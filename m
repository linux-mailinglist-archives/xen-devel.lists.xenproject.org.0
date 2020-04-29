Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD161BDD47
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:14:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmX7-0006oo-8K; Wed, 29 Apr 2020 13:13:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTmX6-0006oj-EP
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:13:48 +0000
X-Inumbo-ID: 424855fc-8a1b-11ea-b9cf-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 424855fc-8a1b-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588166027;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2oGmrEgKMupQrM7FVAvm/it+FPw2mTp7sakYHmPaIos=;
 b=OXl4JbduLQCePVp5F3IuzeYQ7Pa5jV9v+xm2kMQsAtBf2+s8VuIQJtiv
 MvWIp/eQmqtMYNZMzfSNiTxsG2UPKvQDoqEVw8/9zO0MUrcm9CWaXAiFU
 tXrDFwcLDs3VuU1y7PruKCAO3d9gaC+e1naflj0+MZgCzlT9wDIMKT9Dm Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FgeK8dkL4dcP776bljb4Zo7RG+3Ja7DWkiAvMBcOwT/j4+NqyHsQRYX9AOv0Aw3/aDkV6kuttG
 WLfmtqZQPjj2E6Yyphne98g6S40LXyYhB0RW4Hz5Vg5oI+jDVriyfv2tn6ZXdwOsPPcz+FA40c
 jGoR+LD0C02uOL3utqHtj4iUpepGUkWf0vy6TDrUSSfbpTQX+P6Jy8vLT6RpRxSnQqsBbwXtjM
 +gwo1KtWP2qXjuT9WigCVhbEh/EHUFEzGn+G5ZTX95w3e04Q31n49gL+0lckgU7gvjOIXD+tbu
 rXY=
X-SBRS: 2.7
X-MesageID: 16837954
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16837954"
Subject: Re: [PATCH 2/3] x86/pv: Short-circuit is_pv_{32,64}bit_domain() in
 !CONFIG_PV32 builds
To: Jan Beulich <jbeulich@suse.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-3-andrew.cooper3@citrix.com>
 <9b721f94-92de-8d23-b9a4-fdaae13aec38@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0300a420-2979-d788-c158-12d580e412ee@citrix.com>
Date: Wed, 29 Apr 2020 14:13:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b721f94-92de-8d23-b9a4-fdaae13aec38@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On 20/04/2020 15:09, Jan Beulich wrote:
> On 17.04.2020 17:50, Andrew Cooper wrote:
>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -215,7 +215,7 @@ int switch_compat(struct domain *d)
>>          return 0;
>>  
>>      d->arch.has_32bit_shinfo = 1;
>> -    d->arch.is_32bit_pv = 1;
>> +    d->arch.pv.is_32bit = 1;
>>  
>>      for_each_vcpu( d, v )
>>      {
>> @@ -235,7 +235,7 @@ int switch_compat(struct domain *d)
>>      return 0;
>>  
>>   undo_and_fail:
>> -    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
>> +    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;
>>      for_each_vcpu( d, v )
>>      {
>>          free_compat_arg_xlat(v);
>> @@ -358,7 +358,7 @@ int pv_domain_initialise(struct domain *d)
>>      d->arch.ctxt_switch = &pv_csw;
>>  
>>      /* 64-bit PV guest by default. */
>> -    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
>> +    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;
> Switch to true/false while you're touching these?

Yes, but I'm tempted to delete these lines in the final hunk.  Its
writing zeros into a zeroed structures.

~Andrew

