Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E956647798D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248105.427935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtuS-0006rI-Gz; Thu, 16 Dec 2021 16:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248105.427935; Thu, 16 Dec 2021 16:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtuS-0006pK-DA; Thu, 16 Dec 2021 16:47:12 +0000
Received: by outflank-mailman (input) for mailman id 248105;
 Thu, 16 Dec 2021 16:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxtuQ-0006RG-Vr
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:47:10 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cef113d7-5e8f-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 17:47:09 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47092)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxtuO-000sSc-ne (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 16:47:08 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 21BBA1FA9B;
 Thu, 16 Dec 2021 16:47:08 +0000 (GMT)
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
X-Inumbo-ID: cef113d7-5e8f-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <430620c8-2181-296f-6fe6-bc83d86114c8@srcf.net>
Date: Thu, 16 Dec 2021 16:47:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/4] x86/cpuid: Factor common parsing out of
 parse_xen_cpuid()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-3-andrew.cooper3@citrix.com>
 <49a6035e-9291-7a67-ad78-be6ebde79def@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <49a6035e-9291-7a67-ad78-be6ebde79def@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/12/2021 16:41, Jan Beulich wrote:
> On 15.12.2021 23:21, Andrew Cooper wrote:
>> dom0-cpuid= is going to want to reuse the common parsing loop, so factor it
>> out into parse_cpuid().
>>
>> Irritatingly, despite being static const, the features[] array gets duplicated
>> each time parse_cpuid() is inlined.  As it is a large (and ever growing with
>> new CPU features) datastructure, move it to being file scope so all inlines
>> use the same single object.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> We probably want to be wary of fallout from this pattern elsewhere.  I only
>> noticed it by chance.
> While that sounds at least close to a bug, there might by some subtle reason
> for why they have to do it that way.

Now I've thought about this more, probably C's "every object has a
unique address" rule.

~Andrew

