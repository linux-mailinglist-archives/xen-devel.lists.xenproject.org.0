Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484AE192DCC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:06:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8Vl-0000aw-8T; Wed, 25 Mar 2020 16:04:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH8Vk-0000ar-Cq
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:04:08 +0000
X-Inumbo-ID: 412b17ba-6eb2-11ea-864e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 412b17ba-6eb2-11ea-864e-12813bfff9fa;
 Wed, 25 Mar 2020 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585152248;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LLRPPNUfj6Yv+yQwNI+puscWzwL18qOQpSpPkCuR3Y4=;
 b=Bvxdh7/XBDzkJr5CcGJYRb60VafXi4BO4AKa3KYPPR2U3bvQjDESdlOG
 RDveHMHxxhkZs3PDmfTOG2db0oxhvRDLnhFHVEUW8DoVlAepDjBha15VI
 ELKt/1Fvn2F4jqbBDgNk7KxJGQ4Alfi2bSJS949oL6unL1059b7cilGUM c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qjUIL2vuy5NsD3GItpM1dDyQccB10wfSbK+A1yjRljYI6kPD2awlG+XtTM7B9bivMXnsBFyeyH
 vtQWm8xSv/lScZ/ZprQnK+fwqa0obit6W/jlopEWF2G6YqpuVWOgUG/fH0U8tTgWIYP+odGUWh
 h+IINSup6jZ0Pn/wUqyrvBX9jBW5NXN2E9mCCcNXzQehdnfPbcC9d943m3PUJwEAT3i5arU8eL
 x5HoUHlmfFmKr+1TMxxhyvphq0BlRSCsun+Y/8njh/zoQD86Ru7i2DLUY8CCIHV7pIrkgSE4cs
 LRE=
X-SBRS: 2.7
X-MesageID: 14627503
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14627503"
To: Pu Wen <puwen@hygon.cn>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200324103726.3406-1-puwen@hygon.cn>
 <20200325103054.GA28601@Air-de-Roger>
 <772e041d-a91a-e67c-1243-530065b2f628@hygon.cn>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e4c2dafa-2b03-e6d0-4511-872cb70e8e68@citrix.com>
Date: Wed, 25 Mar 2020 16:03:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <772e041d-a91a-e67c-1243-530065b2f628@hygon.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h
 in vmcb struct
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/03/2020 15:23, Pu Wen wrote:
> On 2020/3/25 18:30, Roger Pau Monné wrote:
>> On Tue, Mar 24, 2020 at 06:37:26PM +0800, Pu Wen wrote:
>>> diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h
>>> b/xen/include/asm-x86/hvm/svm/vmcb.h
>>> index b9e389d481..d8a3285752 100644
>>> --- a/xen/include/asm-x86/hvm/svm/vmcb.h
>>> +++ b/xen/include/asm-x86/hvm/svm/vmcb.h
>>> @@ -316,6 +316,17 @@ typedef union
>>>       uint64_t raw;
>>>   } intinfo_t;
>>>   +typedef union
>>> +{
>>> +    struct
>>> +    {
>>> +        u64 intr_shadow:    1;
>>> +        u64 guest_intr_mask:1;
>>> +        u64 resvd:          62;
>>
>> Could you also use uint64_t for the fields, like you do below for
>> raw?
>
> Ok, thanks. Maybe bool for intr_shadow and guest_intr_mask is better?

Bool would be better if you're willing to change them.

There is a subtle truncation bug with can occur, e.g.

foo->intr_shadow = bar & MASK;

turns to 0 if MASK isn't the bottom bit, and intr_shadow is not bool.

The traditional way to fix this is with !!(bar & MASK), but bools are
safer because you can't get it wrong accidentally.

Its also fine to drop the resvd entirely.  No need for the field.

~Andrew

