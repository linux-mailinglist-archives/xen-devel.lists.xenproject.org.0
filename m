Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843081CE202
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 19:49:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYCXI-0002pP-R6; Mon, 11 May 2020 17:48:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYCXH-0002pK-EO
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 17:48:15 +0000
X-Inumbo-ID: 96939368-93af-11ea-b07b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96939368-93af-11ea-b07b-bc764e2007e4;
 Mon, 11 May 2020 17:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589219294;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1YuLqSJhS24tb+cRPtgbpGsjxbGohZ1x4vJW0qivluQ=;
 b=ZyMnIVwvNNxqXkiZsfX6EWxfPXe6ckie+qgTyxgegjIy2nO+IJqHdkle
 4HWaB+vcz9aF1IsTR0M6ljw51MEyEn7AEySkiDdj/r0U0Y8c3UkGelRrX
 2hFUBIf/pYX+VoJwZica5eDdv3LJ2J0QK//Jyu0NBGpI3AKtXT6XfONjC g=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 000k+0R0nErGb8NbHz0FFJQ5jkiWORs981K8+ywmfEg2ECNkXaLzuKfeGqxZ6w8+MgNgToU0GM
 XzKUNr/OQS1v5utgFig7Vul30YuI8GdX7gGd9sC0wlZIPjzUmVZ1ZKWShwfj85Vab8f0IapLFn
 RoNmqaG+VG0HeqkzeZ3iO88Q3y80ZDMMLMNWDEjRRgX3t6NOXZOpOhOPv51NlCIwlHz+e+k2fh
 ic7Y5menFrEfwlJyFxMVS2t02hyHNmhGMZBW+IpJ+rMGZ/2J2g2ZoBFiC51HVumYpkcerfOWGc
 dC8=
X-SBRS: 2.7
X-MesageID: 17932759
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17932759"
Subject: Re: [PATCH 07/16] x86/shstk: Re-layout the stack block for shadow
 stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-8-andrew.cooper3@citrix.com>
 <8b6e03ee-545d-eada-457e-79c183a72d6d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <51eca0a6-48ff-9169-2c41-c1cadace1d02@citrix.com>
Date: Mon, 11 May 2020 18:48:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8b6e03ee-545d-eada-457e-79c183a72d6d@suse.com>
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

On 04/05/2020 15:24, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -732,14 +732,14 @@ void load_system_tables(void)
>>  		.rsp2 = 0x8600111111111111ul,
>>  
>>  		/*
>> -		 * MCE, NMI and Double Fault handlers get their own stacks.
>> +		 * #DB, NMI, DF and #MCE handlers get their own stacks.
> Then also #DF and #MC?

Ok.

>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -6002,25 +6002,18 @@ void memguard_unguard_range(void *p, unsigned long l)
>>  
>>  void memguard_guard_stack(void *p)
>>  {
>> -    /* IST_MAX IST pages + at least 1 guard page + primary stack. */
>> -    BUILD_BUG_ON((IST_MAX + 1) * PAGE_SIZE + PRIMARY_STACK_SIZE > STACK_SIZE);
>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
>>  
>> -    memguard_guard_range(p + IST_MAX * PAGE_SIZE,
>> -                         STACK_SIZE - PRIMARY_STACK_SIZE - IST_MAX * PAGE_SIZE);
>> +    p += 5 * PAGE_SIZE;
> The literal 5 here and ...
>
>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
>>  }
>>  
>>  void memguard_unguard_stack(void *p)
>>  {
>> -    memguard_unguard_range(p + IST_MAX * PAGE_SIZE,
>> -                           STACK_SIZE - PRIMARY_STACK_SIZE - IST_MAX * PAGE_SIZE);
>> -}
>> -
>> -bool memguard_is_stack_guard_page(unsigned long addr)
>> -{
>> -    addr &= STACK_SIZE - 1;
>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_RW);
>>  
>> -    return addr >= IST_MAX * PAGE_SIZE &&
>> -           addr < STACK_SIZE - PRIMARY_STACK_SIZE;
>> +    p += 5 * PAGE_SIZE;
> ... here could do with macro-izing: IST_MAX + 1 would already be
> a little better, I guess.

The problem is that "IST_MAX + 1" is now less meaningful than a literal
5, because at least 5 obviously matches up with the comment describing
which page does what.

~Andrew

>
> Preferably with adjustments along these lines
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Jan


