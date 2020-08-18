Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335F24822B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:48:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7yDz-0001Nu-H1; Tue, 18 Aug 2020 09:48:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7yDx-0001Np-RE
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:48:09 +0000
X-Inumbo-ID: 7dde7292-8ac4-48d8-abc6-853deb1f5cbf
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dde7292-8ac4-48d8-abc6-853deb1f5cbf;
 Tue, 18 Aug 2020 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=p3OHhFQH6yCPkpBsQES96D0y1F+thTubuK/5sG42+v4=; b=DQzqWRyIudNbbOMTjsbjeYM4U8
 NTTzSSiIMqrxKwLKXO7kC+NmWwZMIQwn6G140xhbN5j4yURhBQtSb5BK2m4WN/XHnBPPi5wWd13rU
 HU1lJAZbe6w+o6EQlkmyjgYzSsu+oLCsUD7WMfiCXvV6H0983sQj2Rm1Am+urjnS1MeU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7yDv-0008Vv-76; Tue, 18 Aug 2020 09:48:07 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7yDu-0001Jm-Ua; Tue, 18 Aug 2020 09:48:07 +0000
Subject: Re: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <Andre.Przywara@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Steve Capper <Steve.Capper@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 nd <nd@arm.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
 <ef6a40d7-7def-3726-870c-f9bf22e2a388@arm.com>
 <139F007F-5C70-4AB3-B2BC-3A7D414A5C06@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bdbbb910-76be-f0af-6809-6b2ea3b1b6cd@xen.org>
Date: Tue, 18 Aug 2020 10:48:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <139F007F-5C70-4AB3-B2BC-3A7D414A5C06@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 18/08/2020 10:25, Bertrand Marquis wrote:
>>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
>>> index 674beb0353..588089e5ae 100644
>>> --- a/xen/include/asm-arm/cpufeature.h
>>> +++ b/xen/include/asm-arm/cpufeature.h
>>> @@ -13,8 +13,8 @@
>>> #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
>>> #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
>>> #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
>>> -#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
>>> -#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
>>> +#define cpu_has_fp        (boot_cpu_feature64(fp) <= 1)
>>> +#define cpu_has_simd      (boot_cpu_feature64(simd) <= 1)
>>
>> But this is only good until the next feature bump. I think we should be
>> more future-proof here. The architecture describes those two fields as
>> "signed"[1], and guarantees that "if value >= 0" is a valid test for the
>> feature. Which means we are good as long as the sign bit (bit 3) is
>> clear, which translates into:
>> #define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
>> Same for simd.
>>
> 
> We cannot really be sure that a new version introduced will require the
> same context save/restore so it might dangerous to claim we support
> something we have no idea about.

Right. However, if we don't do anything for those values, it may be 
possible to see corruption again when it gets bumped.

If we are concerned about incompatibility, then we should start checking 
the features and only allow boot with what we know.

Cheers,

-- 
Julien Grall

