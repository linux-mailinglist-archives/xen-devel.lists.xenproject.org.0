Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A1455965
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227337.393175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnezi-0006x0-CC; Thu, 18 Nov 2021 10:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227337.393175; Thu, 18 Nov 2021 10:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnezi-0006vH-9E; Thu, 18 Nov 2021 10:50:18 +0000
Received: by outflank-mailman (input) for mailman id 227337;
 Thu, 18 Nov 2021 10:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9nqF=QF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnezh-0006v9-DM
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:50:17 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50a170eb-485d-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 11:50:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:60048)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnezg-000557-72 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 18 Nov 2021 10:50:16 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E96801FD7A;
 Thu, 18 Nov 2021 10:50:15 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 50a170eb-485d-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9aa54187-43e6-0ed6-62af-50ba52b3116a@srcf.net>
Date: Thu, 18 Nov 2021 10:50:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211118082806.23335-1-roger.pau@citrix.com>
 <1377adb3-e3f5-2865-a2df-e6dd8098645e@suse.com>
 <YZYo9oGq2Bzontjw@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH for-4.16 v2] efi: fix alignment of function parameters in
 compat mode
In-Reply-To: <YZYo9oGq2Bzontjw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2021 10:20, Roger Pau Monné wrote:
> On Thu, Nov 18, 2021 at 10:46:32AM +0100, Jan Beulich wrote:
>> On 18.11.2021 09:28, Roger Pau Monne wrote:
>>> Currently the max_store_size, remain_store_size and max_size in
>>> compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
>>> 13.0.0 complain with:
>>>
>>> In file included from compat.c:30:
>>> ./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>>>             &op->u.query_variable_info.max_store_size,
>>>             ^
>>> ./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>>>             &op->u.query_variable_info.remain_store_size,
>>>             ^
>>> ./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>>>             &op->u.query_variable_info.max_size);
>>>             ^
>>> Fix this by bouncing the variables on the stack in order for them to
>>> be 8 byte aligned.
>>>
>>> Note this could be done in a more selective manner to only apply to
>>> compat code calls, but given the overhead of making an EFI call doing
>>> an extra copy of 3 variables doesn't seem to warrant the special
>>> casing.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>> The code change looks correct to me, so it could have my R-b, but I'd
>> like to ask for some clarification first.
>>
>>> --- a/xen/common/efi/runtime.c
>>> +++ b/xen/common/efi/runtime.c
>>> @@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>>>      break;
>>>  
>>>      case XEN_EFI_query_variable_info:
>>> +    {
>>> +        uint64_t max_store_size, remain_store_size, max_size;
>>> +
>>>          if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
>>>              return -EINVAL;
>>>  
>>> @@ -638,16 +641,34 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>>>  
>>>          if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
>>>              return -EOPNOTSUPP;
>>> +
>>> +        /*
>>> +         * Bounce the variables onto the stack to make them 8 byte aligned when
>>> +         * called from the compat handler, as their placement in
>>> +         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
>>> +         * clang will complain.
>> I expect future gcc would also complain; I'm actually surprised it
>> doesn't already, as I recall work in that direction was done for one
>> of the more recent releases. Hence while I'm fine with referring to
>> clang specifically in the description, I'd prefer the comment here
>> to be more generic. E.g. "... and compilers may validly complain."
> Sure.
>
>>> +         * Note we do this regardless of whether called from the compat handler
>>> +         * or not, as it's not worth the extra logic to differentiate.
>>> +         */
>>> +        max_store_size = op->u.query_variable_info.max_store_size;
>>> +        remain_store_size = op->u.query_variable_info.remain_store_size;
>>> +        max_size = op->u.query_variable_info.max_size;
>> All three are OUT only as per the EFI spec. I'm not going to insist
>> on dropping these assignments, but their presence wants justifying
>> in the comment if you want to retain them. E.g. "While the function
>> parameters are OUT only, copy the values here anyway just in case."
>> Obviously if the assignments here were dropped, the local variables
>> would need to gain initializers to avoid leaking hypervisor stack
>> data.
> I think it's important to do the copy in order to prevent changes in
> behavior.

I agree with Jan here.  While I agree that not doing the copy in is
technically a change in behaviour, it's still the appropriate way to
express the logic.


> Even if explicitly listed as OUT I won't be surprised if
> there where quirks that passed something in.

I would be surprised, given how much static analysis typically goes into
the IN/OUT annotations in the windows world.

~Andrew

