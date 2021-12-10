Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E4470214
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 14:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243887.421980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgHL-0004mx-Ho; Fri, 10 Dec 2021 13:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243887.421980; Fri, 10 Dec 2021 13:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgHL-0004jt-Ch; Fri, 10 Dec 2021 13:49:39 +0000
Received: by outflank-mailman (input) for mailman id 243887;
 Fri, 10 Dec 2021 13:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a5or=Q3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvgHK-0004jn-4H
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 13:49:38 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0205a017-59c0-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 14:49:35 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:36070)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvgHG-000xIY-6u (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 10 Dec 2021 13:49:34 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id EA3EC200D8;
 Fri, 10 Dec 2021 13:49:33 +0000 (GMT)
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
X-Inumbo-ID: 0205a017-59c0-11ec-9d12-4777fae47e2b
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <6abbbdd6-09f1-0511-ddb5-7c5222658d2a@srcf.net>
Date: Fri, 10 Dec 2021 13:49:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] tools/libxl: Don't read STORE/CONSOLE_PFN from Xen
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20211209170752.20576-1-andrew.cooper3@citrix.com>
 <0bf3ccd1-7958-e8c6-bb4d-4e319cc567a3@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <0bf3ccd1-7958-e8c6-bb4d-4e319cc567a3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/12/2021 11:16, Juergen Gross wrote:
> On 09.12.21 18:07, Andrew Cooper wrote:
>> The values are already available in dom->{console,xenstore}_pfn, just
>> like on
>> the PV side of things.  No need to ask Xen.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Wei Liu <wl@xen.org>
>> CC: Anthony PERARD <anthony.perard@citrix.com>
>> CC: Juergen Gross <jgross@suse.com>
>> ---
>>   tools/libs/light/libxl_dom.c | 17 +++++------------
>>   1 file changed, 5 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
>> index c9c24666cd04..03841243ab47 100644
>> --- a/tools/libs/light/libxl_dom.c
>> +++ b/tools/libs/light/libxl_dom.c
>> @@ -722,13 +722,10 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
>>   }
>>     static int hvm_build_set_params(xc_interface *handle, uint32_t
>> domid,
>> -                                libxl_domain_build_info *info,
>> -                                unsigned long *store_mfn,
>> -                                unsigned long *console_mfn)
>> +                                libxl_domain_build_info *info)
>>   {
>>       struct hvm_info_table *va_hvm;
>>       uint8_t *va_map, sum;
>> -    uint64_t str_mfn, cons_mfn;
>>       int i;
>>         if (info->type == LIBXL_DOMAIN_TYPE_HVM) {
>
> What about moving this if () to the only caller and renaming the
> function from hvm_build_set_params() to hvm_set_info_table()?

Because I was hoping to delete it outright in a subsequent patch.

~Andrew

