Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426F1D4EF3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 15:19:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZaFH-0005CK-3I; Fri, 15 May 2020 13:19:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZaFF-0005CF-Dz
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 13:19:21 +0000
X-Inumbo-ID: af2ac7d2-96ae-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af2ac7d2-96ae-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589548760;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=D0J6JzjlekOhk7fZXV/q1awfnttraVTjwuLWUd84rUw=;
 b=WkH+sWMV935Adf+OHZmETH3HMY/9xnnJ7pfvCHVvCtznDH6AcCCJLXvx
 Cwgc95XpRJzr32gIBshPDM1o+uwU8lzCvlsxDqCPtSVUjibDTEGvaPY1b
 HTJJNIAHBn1Ltxx1VyTYsyiUOErz1ZWf2HHRiqMnqQ8+w4clMvY7dkGbE s=;
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
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: uv/02h6jRFfjgXt/bPJ8gUbH2iIstUjnwGnu9H7HIRdaop6KwlqNi5WjECa105Bf4Ud2DojuD1
 ntrsii1Sc0dlvJkEjEKknph/Zv2hIvO8t+tWV6oGiBFMBOP4pmgd7P1uYoXGZ+kYLIttW+GRg8
 +qVTfSTObes2Gm9Hbr7HX7qkrS8KjPOZSGLthJ2CqlZDoYkDFvUmbd0apx0NUt2E99REifxRAC
 ME/RLzlbseKPOnoOyio3KgNovGKOEMfSotamQTpKGJo4ZYyoxw2IXQrLFZhyx7YMbWWF3cUvwV
 dFA=
X-SBRS: 2.7
X-MesageID: 17650516
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17650516"
Subject: Re: [PATCH] x86/gen-cpuid: Distinguish default vs max in feature
 annotations
To: Jan Beulich <jbeulich@suse.com>
References: <20200508152729.14295-1-andrew.cooper3@citrix.com>
 <e6380a05-d67a-b3a8-a624-ba5c161a8c53@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <142f8f43-98fb-506c-0812-e431f2666e5e@citrix.com>
Date: Fri, 15 May 2020 14:19:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e6380a05-d67a-b3a8-a624-ba5c161a8c53@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/05/2020 08:43, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 08.05.2020 17:27, Andrew Cooper wrote:
>> @@ -133,9 +134,13 @@ def crunch_numbers(state):
>>      state.hvm_shadow_def = state.pv_def | state.raw['S']
>>      state.hvm_hap_def = state.hvm_shadow_def | state.raw['H']
>>  
>> +    # TODO: Ignore def/max split until the toolstack migration logic is fixed
>>      state.pv_max = state.pv_def
>>      state.hvm_shadow_max = state.hvm_shadow_def
>>      state.hvm_hap_max = state.hvm_hap_def
>> +    # state.pv_max = state.raw['A'] | state.raw['a']
>> +    # state.hvm_shadow_max = state.pv_max | state.raw['S'] | state.raw['s']
>> +    # state.hvm_hap_max = state.hvm_shadow_max | state.raw['H'] | state.raw['h']
> While in comment form it doesn't matter yet, for actually enabling
> this it would seem to me to be more expressive as
>
>     state.pv_max = state.pv_def | state.raw['a']
>     state.hvm_shadow_max = state.hvm_shadow_def | state.pv_max | state.raw['s']
>     state.hvm_hap_max = state.hvm_hap_def | state.hvm_shadow_max | state.raw['h']
>
> Thoughts?

The format/layout of metadata prohibits that from having any kind of
difference.

Furthermore, expressing it this way doesn't require anyone to look at
the *_def derivation to figure out what is going on.

I'm going to commit it in this form, but will tidy it up to be properly
tabulated in a future patch, to make it easier to read.

~Andrew

