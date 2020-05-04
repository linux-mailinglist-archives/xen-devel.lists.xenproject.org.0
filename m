Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C789E1C3E22
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 17:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVci9-0005fb-T0; Mon, 04 May 2020 15:08:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVci8-0005fV-GI
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 15:08:48 +0000
X-Inumbo-ID: 26ba02c0-8e19-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26ba02c0-8e19-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588604927;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wjSY2GhoO17AjmZTCXOxGZ+UkDFTIAB/CbmgGVGaI+c=;
 b=gmRlYsxETJDOEcBZwQXlhGwTrqMeTNkHX3UbYD0VnSs1LbDgAMftVKlr
 BoqERimWUPkpLGartVagA+EpacUk3Z2PvMabHwxEkxkHuueQLiYWulL4x
 B785681bJlkRsz059ukYbAwJmvAoZqB/bRjgFbPyTwwRMi0BhLhyVSGk2 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: Xz63FMZyf8hWLY7PLjITaPwT89WVg3nUrHNbIzXwYddsEqqDLDpOppoTcPfQrJP/P0SQ2GJXjn
 K5FFOFdBTsS6PTjJKfi1kllQ2wjtF3ut6CVUv1bFU5r+AokzGPS8pKBRHW+54KB3JDlnnVA9pj
 Ji+tvxrh+qFBAgl0IeODq33hzLTTj7DSKUQQ2eNB3vwjQF9lIzKxi6Kc/EUSE517T9jEsY26F8
 1iYCGw1UUtl/wEl0BqFwrgxn/UUgyrET+vxi6qXAJZI0zxHQHrz9C8EgC4sesTThLXYtaLWrHC
 Xxk=
X-SBRS: 2.7
X-MesageID: 17376503
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,352,1583211600"; d="scan'208";a="17376503"
Subject: Re: [PATCH 08/16] x86/shstk: Create shadow stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-9-andrew.cooper3@citrix.com>
 <c31d9d4d-76ea-1391-5f7d-fbb3f47e16ce@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <92816b17-448f-d1ed-3579-393292120565@citrix.com>
Date: Mon, 4 May 2020 16:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c31d9d4d-76ea-1391-5f7d-fbb3f47e16ce@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/05/2020 15:55, Jan Beulich wrote:
>> +		/* Poision unused entries. */
>> +		for ( i = IST_MAX;
>> +		      i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
>> +			ist_ssp[i] = 0x8600111111111111ul;
> IST_MAX == IST_DF, so you're overwriting one token here.

And failing to poison entry 0.  This was a bad rearrangement when
tidying the series up.

Unfortunately, testing the #DF path isn't terribly easy.

>> --- a/xen/include/asm-x86/processor.h
>> +++ b/xen/include/asm-x86/processor.h
>> @@ -434,7 +434,8 @@ struct __packed tss64 {
>>      uint16_t :16, bitmap;
>>  };
>>  struct tss_page {
>> -    struct tss64 __aligned(PAGE_SIZE) tss;
>> +    uint64_t __aligned(PAGE_SIZE) ist_ssp[8];
>> +    struct tss64 tss;
>>  };
> Just curious - any particular reason you put this ahead of the TSS?

Yes.  Reduced chance of interacting with a buggy IO bitmap offset.

Furthermore, we could do away most of the IO emulation quirking, and the
#GP path overhead, if we actually constructed a real IO bitmap for
dom0.  That would require using the 8k following the TSS.

~Andrew

