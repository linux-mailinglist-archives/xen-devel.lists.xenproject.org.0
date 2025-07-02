Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B9AF0C23
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030250.1403871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrSs-000773-LY; Wed, 02 Jul 2025 07:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030250.1403871; Wed, 02 Jul 2025 07:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrSs-00074m-IL; Wed, 02 Jul 2025 07:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1030250;
 Wed, 02 Jul 2025 07:01:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuNh=ZP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uWrSq-00073w-JM
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:01:04 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 503dd7ba-5712-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:01:01 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2260631f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 00:01:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a892e5b2a7sm15333717f8f.69.2025.07.02.00.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 00:01:00 -0700 (PDT)
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
X-Inumbo-ID: 503dd7ba-5712-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751439661; x=1752044461; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lUEhvy740rICo+jSI7tS3syBJfWEW2hX8Grf3gXAaAs=;
        b=fT6iyGOd4cIJaBSb5+FrC5jik9M1r4Ek6jtYDGwELJaoyVZu5hgNYoZZ8Z6Du5rtWo
         u0xAWjn6WiI16nwexKTg2tHRjkL2ltG2oXNgABRqqn22p7K6agp/uevMmm+Q/Zw8ldhH
         WHqENmpE3QHB4HB2cz0GIRGExq54EXeLShjwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439661; x=1752044461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUEhvy740rICo+jSI7tS3syBJfWEW2hX8Grf3gXAaAs=;
        b=g3sCtOYyfYNh9PyYRjgPTnSA4+22fNf6fBJUwOdPLkKL/7iViIdMzkz+0+TpQ9J552
         aYurag+RNHPUEl5icjOlwG2lJ5OuTbIjCHfsig8CTd+jSkuMpTP5DGFGh6cJLvMVZQ7s
         ANWNQh8O7+1eu/RXG4lfHxX8l5dUN/ITGab9JPvTa482rejPr0KJg3BOVyWfno2127rT
         a/58xaTxP7zjfqckSVR81IOS3XvQHYwi3n3ZsHWj//qgxggrbMjBei63ne/oIuYmWXYO
         mhz7+Qd754kdeCKnbSOn0C4+n63atGVuHljYBopQgSObEnLJ9GJzt2bFiGqLKE6WNMEz
         gSMA==
X-Forwarded-Encrypted: i=1; AJvYcCVhCVzaxuyNTJRBrhROdT8f8T/hHB/2gvsAztUnhLZQV6qBbuu0nJbZFBysV4EJGCSuWTW7YPZFC/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEuSM9hPy1QN/LZBhsu536Kh9uN/TibHi18JPlvAJscCPNwm1Y
	5/+F+yg4fEMReI7ujK3fHFXr6Py0Rmr6x84ezmLcPB/pSDp1mR4xGMwjHm4JtpuOdw4=
X-Gm-Gg: ASbGnctFNGAJxeppDzHuoGIhOua7203S8Qjz0fsKYTK59J7KgIdcAmJQ6eU+TAeeHtO
	fj7IuUP9k7aM6j7BOmfu7RhlWJGZmPveVpFuHiqkJHNWZXQMzESS0RqQv7Zjl/lZTztiftTvxKl
	a3Zd0jMHLb1VMcq+1IXNza4YgzfxYqCMYf4FRqFNaNDBVpn1xt8/ya7sWe14y1gZ4j/VCTt7yoR
	yUJ6U6QMRRiMioDG+BEIMr5t76gf73T5vFnHb+NzAtiCTvHJoPbbIShmWEho1BIEuek0M1mUsPM
	BnjLb3hRzvqNeYXxgPZkyF/rSMgHrZNfP3NV7e6UDq1hGup44Lj164Mak6aVgHHnggLSxyuM8V9
	ZsqkIrgAbi7pecAWUsLa0Po7uXZpIsg==
X-Google-Smtp-Source: AGHT+IFiXzCGVyc4Dl5Sdmk9vmH1Oogb1LSOYioY0wbFqoY9h8k28ZqO8wBGvNYcpaGsH9eowImy2A==
X-Received: by 2002:a05:6000:26c2:b0:3a4:f6c4:355a with SMTP id ffacd0b85a97d-3b201d8e2fdmr999695f8f.57.1751439660969;
        Wed, 02 Jul 2025 00:01:00 -0700 (PDT)
Date: Wed, 2 Jul 2025 09:00:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
Message-ID: <aGTZK0YmBTvGmNQr@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>

On Tue, Jul 01, 2025 at 01:46:19PM -0700, Stefano Stabellini wrote:
> On Tue, 1 Jul 2025, Jan Beulich wrote:
> > Sadly from this you omitted the output from the setup of the offsets
> > arrays. Considering also your later reply, I'd be curious to know what
> > mfn_to_pdx(0x50000000) is.
>  
> Full logs here, and debug patch in attachment.
> 
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000000000000 - 000000007fffffff
> (XEN) RAM: 0000000800000000 - 000000087fffffff
> (XEN) RAM: 0000050000000000 - 000005007fffffff
> (XEN) RAM: 0000060000000000 - 000006007fffffff
> (XEN) RAM: 0000070000000000 - 000007007fffffff
> (XEN) 
> (XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
> (XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
> (XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
> (XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
> (XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
> (XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
> (XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
> (XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
> (XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
> (XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
> (XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
> (XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
> (XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
> (XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
> (XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
> (XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
> (XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
> (XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
> (XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
> (XEN) 
> (XEN) 
> (XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
> (XEN) [00000006bfc302ec] parameter "debug" unknown!
> (XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
> (XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
> (XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
> (XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
> (XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
> (XEN) [00000006bfd1444f] DEBUG setup_mm 252
> (XEN) [00000006bfd3dc6f] DEBUG setup_mm 273 start=0 size=80000000 ram_end=80000000 directmap_base_pdx=0
> (XEN) [00000006bfd5616e] DEBUG setup_directmap_mappings 229 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=0
> (XEN) [00000006bfd7d38a] DEBUG setup_directmap_mappings 237 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0
> (XEN) [00000006bfd92728] DEBUG setup_mm 273 start=800000000 size=80000000 ram_end=880000000 directmap_base_pdx=0
> (XEN) [00000006bfdaba3b] DEBUG setup_directmap_mappings 229 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=800000
> (XEN) [00000006bfdcd79c] DEBUG setup_directmap_mappings 237 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0
> (XEN) [00000006bfde4d82] DEBUG setup_mm 273 start=50000000000 size=80000000 ram_end=50080000000 directmap_base_pdx=0
> (XEN) [00000006bfdfaef0] DEBUG setup_directmap_mappings 229 base_mfn=50000000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=50000000
> (XEN) [00000006bfe35249] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72

As said on the other reply, the issue here is that with the v2 PDX
offset compression logic your memory map is not compressible, and this
leads to an overflow, as anything above 5TiB won't fit in the
directmap AFAICT.  We already discussed with Jan that ARM seems to be
missing any logic to account for the max addressable page:

https://lore.kernel.org/xen-devel/9074f1a6-a605-43f4-97f3-d0a626252d3f@suse.com/

x86 has setup_max_pdx() that truncates the maximum addressable MFN
based on the active PDX compression and the virtual memory map
restrictions.  ARM needs similar logic to account for this
restrictions.

Thanks, Roger.

