Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BD227D94
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxppF-0006Oy-G2; Tue, 21 Jul 2020 10:48:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ5W=BA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxppE-0006Om-75
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:48:44 +0000
X-Inumbo-ID: be8cb544-cb3f-11ea-84fe-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be8cb544-cb3f-11ea-84fe-bc764e2007e4;
 Tue, 21 Jul 2020 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595328523;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3ywLeEALQmD5NhJJhQcrRZ+F98L1q2WMC48nDha1bEY=;
 b=G8IRhU/GzPTRu91f2ArVYqQPeMbDiJTRki/nLGnIeMejd5288wbtChOj
 JBJ0NjeiqiYWoTCmQO+QrsEvpCQWivszblbAg/NxTbF0n9W3cPVsjl28p
 5FsmT6KY6VkGw7FLHK8WztqEyus76gCI1zAu3w7SiFlUx6wl8tN7S87pJ M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ua7mRwwo6CF/45BXMHHXbgPmIzdB7E4l5kEA34Ags5K21AYSkZ6+5RCSqiIVy3wiIs8NO40bXC
 7IKq47Lz6i8y1sZc07xf5XZMtuwtPykn7TidKEWn8sgfEYYlCuPe6mXx4xgwCRvTN0WkGlmYLL
 4MG6PAOCGpRmX2EHG/Q32208IibQCbvYRKWYLUaA33hZFiX4LBmd1vUqpFlSHUmORDo4ycCL4y
 ywRAVx5gQ7DjckuJI2PStlImf+O4lcLlRGgzaH7iSfGuLyLbrOuSWKcmGAy8+lAVBQymBpRrto
 wfE=
X-SBRS: 2.7
X-MesageID: 23156518
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23156518"
Subject: Re: [PATCH] x86emul: support AVX512_VP2INTERSECT insns
To: Jan Beulich <jbeulich@suse.com>
References: <08083899-7348-63d2-1f28-0932e2295d64@suse.com>
 <120bdf92-15b6-3616-5cdb-75b9c38155d4@citrix.com>
 <98c74f0a-86d0-41d2-2aa3-f6b2c3e5ed68@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <772177be-eaff-bd2d-b6f4-676359166275@citrix.com>
Date: Tue, 21 Jul 2020 11:48:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <98c74f0a-86d0-41d2-2aa3-f6b2c3e5ed68@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/07/2020 11:47, Jan Beulich wrote:
> On 21.07.2020 12:32, Andrew Cooper wrote:
>> On 21/07/2020 11:23, Jan Beulich wrote:
>>> --- a/tools/misc/xen-cpuid.c
>>> +++ b/tools/misc/xen-cpuid.c
>>> @@ -160,7 +160,7 @@ static const char *const str_7d0[32] =
>>>      [ 2] = "avx512_4vnniw", [ 3] = "avx512_4fmaps",
>>>      [ 4] = "fsrm",
>>>  
>>> -    /*  8 */                [ 9] = "srbds-ctrl",
>>> +    [ 8] = "avx512_vp2intersect", [ 9] = "srbds-ctrl",
>>>      [10] = "md-clear",
>>>      /* 12 */                [13] = "tsx-force-abort",
>>>      [14] = "serialize",
>> Are we using underscores or dashes?  I realise its is already
>> inconsistent, but this is a debugging tool only, and we can change our
>> minds.
> I've switched this one to use a dash.

Ok.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> Want me to also switch others (in a separate patch)?

Probably best, yes.

Thanks,

~Andrew

