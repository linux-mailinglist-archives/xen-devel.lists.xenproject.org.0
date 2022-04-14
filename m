Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABE501AE1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 20:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305013.519811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf41k-0005fv-D9; Thu, 14 Apr 2022 18:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305013.519811; Thu, 14 Apr 2022 18:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf41k-0005cm-9K; Thu, 14 Apr 2022 18:17:08 +0000
Received: by outflank-mailman (input) for mailman id 305013;
 Thu, 14 Apr 2022 18:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A50e=UY=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nf41i-0005cg-R0
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 18:17:06 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 162bfc9c-bc1f-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 20:17:05 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:42386)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nf41g-000Tx9-Ja (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 14 Apr 2022 19:17:04 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CD77A1FA77;
 Thu, 14 Apr 2022 19:17:03 +0100 (BST)
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
X-Inumbo-ID: 162bfc9c-bc1f-11ec-a405-831a346695d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <59eab45c-ea10-b7b6-d78d-5ea4b6213246@srcf.net>
Date: Thu, 14 Apr 2022 19:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20220414162348.4808-1-andrew.cooper3@citrix.com>
 <YlhetDD/Xsnn2Vif@perard.uk.xensource.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] xen/build: Fix dependency for the MAP rule
In-Reply-To: <YlhetDD/Xsnn2Vif@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2022 18:49, Anthony PERARD wrote:
> On Thu, Apr 14, 2022 at 05:23:48PM +0100, Andrew Cooper wrote:
>> diff --git a/xen/Makefile b/xen/Makefile
>> index dd05672ff42d..02a274f56dc0 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -599,7 +599,7 @@ cscope:
>>  	cscope -k -b -q
>>  
>>  .PHONY: _MAP
>> -_MAP:
>> +_MAP: $(TARGET)-syms
> That's not going to work well as make isn't going to know how to build
> $(TARGET)-syms.

Huh... It appears to work for me, but it's parallel build so who knows.

>  I guess you want to have $(TARGET) as prerequisite or
> add somewhere "$(TARGET)-syms: $(TARGET)".

That becomes cyclic with arch/*/Makefile which has:

$(TARGET): $(TARGET)-syms

The _install rule does make the implication that a dependency on
$(TARGET) builds $(TARGET)-syms so I guess that's good enough for _MAP too.

~Andrew

