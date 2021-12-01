Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFAA464B7D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235802.409005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMig-0002BY-5v; Wed, 01 Dec 2021 10:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235802.409005; Wed, 01 Dec 2021 10:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMig-00028z-2b; Wed, 01 Dec 2021 10:20:10 +0000
Received: by outflank-mailman (input) for mailman id 235802;
 Wed, 01 Dec 2021 10:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msMif-0001OS-04
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:20:09 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4170fbbd-5290-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 11:20:07 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50558)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msMic-000QlC-hn (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 10:20:06 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 6BF2A1FC17;
 Wed,  1 Dec 2021 10:20:06 +0000 (GMT)
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
X-Inumbo-ID: 4170fbbd-5290-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f1a7edd8-c46a-b857-fe5d-b4eaf962808f@srcf.net>
Date: Wed, 1 Dec 2021 10:20:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] x86/altcall: Check and optimise altcall targets
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-2-andrew.cooper3@citrix.com>
 <e3bee553-9443-2f3c-095b-4d6151a07c5d@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <e3bee553-9443-2f3c-095b-4d6151a07c5d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2021 08:10, Jan Beulich wrote:
> On 26.11.2021 22:22, Andrew Cooper wrote:
>> @@ -279,6 +280,27 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>  
>>                  if ( dest )
>>                  {
>> +                    /*
>> +                     * When building for CET-IBT, all function pointer targets
>> +                     * should have an endbr64 instruction.
>> +                     *
>> +                     * If this is not the case, leave a warning because
>> +                     * something is wrong with the build.
>> +                     *
>> +                     * Otherwise, skip the endbr64 instruction.  This is a
>> +                     * marginal perf improvement which saves on instruction
>> +                     * decode bandwidth.
>> +                     */
>> +                    if ( IS_ENABLED(CONFIG_HAS_CC_CET_IBT) )
>> +                    {
>> +                        if ( is_endbr64(dest) )
> I would have given my R-b, but I don't see where is_endbr64() is coming
> from, and you don't list any prereqs here or in the cover letter. I'm
> afraid I don't fancy going hunt for it in the many other pending patches.
> Hence only on the assumption that the helper has got introduced before:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oh sorry - this series is based on the CET-IBT series, which adds
CONFIG_HAS_CC_CET_IBT and is_endbr64().

~Andrew

