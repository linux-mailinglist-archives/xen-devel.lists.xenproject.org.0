Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31CEAF0BFC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 08:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030234.1403852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrLV-0004nO-Hv; Wed, 02 Jul 2025 06:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030234.1403852; Wed, 02 Jul 2025 06:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrLV-0004kJ-F3; Wed, 02 Jul 2025 06:53:29 +0000
Received: by outflank-mailman (input) for mailman id 1030234;
 Wed, 02 Jul 2025 06:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuNh=ZP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uWrLU-0004kD-2C
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 06:53:28 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4086bb9e-5711-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 08:53:25 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso40641235e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 23:53:25 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4538a3fe24esm187981975e9.23.2025.07.01.23.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 23:53:24 -0700 (PDT)
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
X-Inumbo-ID: 4086bb9e-5711-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751439205; x=1752044005; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=es3ipisY5bnyL4qL1ToMVAsl8wmc8JIY94rYbZLns0o=;
        b=Bu38Ux8kBaIfQB4n9LvVZTB0VLNK8iOmvEEJI1qO4HVj9wvMUbA58p1p9/BWWHAASu
         Ys0W8B61d1vWLzc2uCjpp7CVv4J9XcAKh/rPyKe2hTVJlOK1jCCxX6tOg5x79gIL41Fo
         6ZdnlRrVGFe9mReeBwHyCzQoTDFgQiION2McQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439205; x=1752044005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=es3ipisY5bnyL4qL1ToMVAsl8wmc8JIY94rYbZLns0o=;
        b=Q7jh0eldC87cF6mpfaet14HIXFJzXp7Z7q29glf/aQGH+6P1PyeJHSUuwqN3o/uOWe
         YR2xLhXDwy9BbSFzceV7LNp4QUZR8XUZTDVx5wfKrylLwrDE3GhKXfnD24dxPRHY1nm1
         OQOCc1EX7cOXtucVigHGn0NGsA6A3TIF+r2/Pc7M70//icn4OEDUmsumgntaumZGcti0
         V3RSAlTlinlSHEKPcig89g5TtaIZyPRskonW7TM1cw308M2yZRsF+E/dFzRcvjbVG/mn
         nALMM8zudu72+f22pWDPkbdMH2ug/rHe8yfaAMCcQYpduv7LLIvSg8ClnjwKNAmXN0ak
         AjOg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ26bxPocFWH4BPzUxAD7XPrLOQtiRGc+kcXgoRFfGkyRRRdYzbK9h9GF8I7jn/mQZv+HfxljbGk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymeH4wTZ6y/lwyPyWDp2fHYWYxuqYwenYxujesTEGrr7/iqwnW
	llkyQqWnXgCpItjsIJcwVkT2PAq2HpWRADsF+/YwXvJpzcjc144YMb4VRF3HE1+ssL8=
X-Gm-Gg: ASbGnctt1MFFy3M+wwiizW7cvBGoaMkcefn3u8UwoBiNfaKFWDTCv4mDmw6iQ8Pv72R
	Pc7zUczXvecgca4Wrja95G98ARBG7pPj4tluU815/qZRPLWcODbBL1fMEepJMnBFNw3uY+HbfnD
	G0Y9myNQdPtUAgafibh7Im9Cg8a73/D9KvfKA63++3cKPgW2TucAW7oTUni3+EKnivTJOAVLxdC
	PjWBSF5ciYEz51dBXNJLeOVoyHy2bkXrhVlJim2ZugTk8ybzUF6bu1i6+3Fz6ZGVFLlq+JlA2IK
	SUkj5Opv4kCC+Fy+kk2JiWP+mUThL0MnBf3+vR43leeblIpMOyNSDj+jNngc5OLwRHd7uRC3qhd
	nN+XMAmxM+N1rGm8iUpajBF1h1V2gmoREMvJtg1kQ
X-Google-Smtp-Source: AGHT+IH/k9GGBr58KZlQJN9JBw9oU0CDygbQBIGlxyzTYTGRe6rROIX5Zx1ahZNZAdMS7OeYcvEaYg==
X-Received: by 2002:a05:600c:3b24:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-454a371d3eemr15772705e9.27.1751439205216;
        Tue, 01 Jul 2025 23:53:25 -0700 (PDT)
Date: Wed, 2 Jul 2025 08:53:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
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
Message-ID: <aGTXY324gcda0nHj@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
 <ed896b87-1d21-4315-917e-343e3f0b519e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ed896b87-1d21-4315-917e-343e3f0b519e@suse.com>

On Wed, Jul 02, 2025 at 08:32:27AM +0200, Jan Beulich wrote:
> On 01.07.2025 22:46, Stefano Stabellini wrote:
> > On Tue, 1 Jul 2025, Jan Beulich wrote:
> >> Sadly from this you omitted the output from the setup of the offsets
> >> arrays. Considering also your later reply, I'd be curious to know what
> >> mfn_to_pdx(0x50000000) is.
> >  
> > Full logs here, and debug patch in attachment.
> > 
> > (XEN) Checking for initrd in /chosen
> > (XEN) RAM: 0000000000000000 - 000000007fffffff
> > (XEN) RAM: 0000000800000000 - 000000087fffffff
> > (XEN) RAM: 0000050000000000 - 000005007fffffff
> > (XEN) RAM: 0000060000000000 - 000006007fffffff
> > (XEN) RAM: 0000070000000000 - 000007007fffffff
> > (XEN) 
> > (XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
> > (XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
> > (XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
> > (XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
> > (XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
> > (XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
> > (XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
> > (XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
> > (XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
> > (XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
> > (XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
> > (XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
> > (XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
> > (XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
> > (XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
> > (XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
> > (XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
> > (XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
> > (XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
> > (XEN) 
> > (XEN) 
> > (XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
> > (XEN) [00000006bfc302ec] parameter "debug" unknown!
> > (XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
> > (XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
> > (XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
> > (XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
> > (XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
> > (XEN) [00000006bfd1444f] DEBUG setup_mm 252
> 
> This one is immediately after init_pdx(), i.e. by here the log messages from
> Roger's patch (out of pfn_pdx_compression_setup()) should have appeared.
> Which at least falsifies my earlier suspicion about there being an ordering
> issue. You do have PDX_OFFSET_COMPRESSION=y in your .config, don't you? Are
> we perhaps taking the only "return false" path in pfn_offset_sanitize_ranges()
> that doesn't issue a log message?

Sorry, should have posted this yesterday.  With the current offset
compression algorithm the memory map provided by Stefano is not
compressible, as the calculated PFN shift leads to lookup table
indexes that overflows the default table size.

I'm working on an improved version that attempts to always preserve
the most significant bits in the lookup table index, even if that
leads to merging regions.

Thanks, Roger.

