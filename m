Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A24732D5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 18:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246235.424668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwp23-0002Uu-HT; Mon, 13 Dec 2021 17:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246235.424668; Mon, 13 Dec 2021 17:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwp23-0002S4-ES; Mon, 13 Dec 2021 17:22:35 +0000
Received: by outflank-mailman (input) for mailman id 246235;
 Mon, 13 Dec 2021 17:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4QLc=Q6=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mwp22-0002Ry-JZ
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 17:22:34 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40d311cc-5c39-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 18:22:32 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46562)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mwp1y-000gsQ-pI (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 13 Dec 2021 17:22:30 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A598720339;
 Mon, 13 Dec 2021 17:22:30 +0000 (GMT)
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
X-Inumbo-ID: 40d311cc-5c39-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e669d8b0-a971-10b8-5e7b-69520350cc1c@srcf.net>
Date: Mon, 13 Dec 2021 17:22:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20211209170752.20576-1-andrew.cooper3@citrix.com>
 <0bf3ccd1-7958-e8c6-bb4d-4e319cc567a3@suse.com>
 <6abbbdd6-09f1-0511-ddb5-7c5222658d2a@srcf.net>
 <570a65b7-c1e8-9df7-ab63-c49d7a66c1d7@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] tools/libxl: Don't read STORE/CONSOLE_PFN from Xen
In-Reply-To: <570a65b7-c1e8-9df7-ab63-c49d7a66c1d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/12/2021 14:08, Juergen Gross wrote:
> On 10.12.21 14:49, Andrew Cooper wrote:
>> On 10/12/2021 11:16, Juergen Gross wrote:
>>> On 09.12.21 18:07, Andrew Cooper wrote:
>>>> The values are already available in dom->{console,xenstore}_pfn, just
>>>> like on
>>>> the PV side of things.  No need to ask Xen.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Anthony PERARD <anthony.perard@citrix.com>
>>>> CC: Juergen Gross <jgross@suse.com>
>>>> ---
>>>>    tools/libs/light/libxl_dom.c | 17 +++++------------
>>>>    1 file changed, 5 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/tools/libs/light/libxl_dom.c
>>>> b/tools/libs/light/libxl_dom.c
>>>> index c9c24666cd04..03841243ab47 100644
>>>> --- a/tools/libs/light/libxl_dom.c
>>>> +++ b/tools/libs/light/libxl_dom.c
>>>> @@ -722,13 +722,10 @@ int libxl__build_pv(libxl__gc *gc, uint32_t
>>>> domid,
>>>>    }
>>>>      static int hvm_build_set_params(xc_interface *handle, uint32_t
>>>> domid,
>>>> -                                libxl_domain_build_info *info,
>>>> -                                unsigned long *store_mfn,
>>>> -                                unsigned long *console_mfn)
>>>> +                                libxl_domain_build_info *info)
>>>>    {
>>>>        struct hvm_info_table *va_hvm;
>>>>        uint8_t *va_map, sum;
>>>> -    uint64_t str_mfn, cons_mfn;
>>>>        int i;
>>>>          if (info->type == LIBXL_DOMAIN_TYPE_HVM) {
>>>
>>> What about moving this if () to the only caller and renaming the
>>> function from hvm_build_set_params() to hvm_set_info_table()?
>>
>> Because I was hoping to delete it outright in a subsequent patch.
>
> I'd suggest to either do the renaming or to add that subsequent patch
> making this a small series.

That's a separate task, which I don't have time to untangle right now.

I don't think it is worth delaying this improvement for a future
only-tangentially-related change.

~Andrew

