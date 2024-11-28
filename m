Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E99DB4B9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 10:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845176.1260639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGajZ-0003OZ-6y; Thu, 28 Nov 2024 09:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845176.1260639; Thu, 28 Nov 2024 09:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGajZ-0003M3-3v; Thu, 28 Nov 2024 09:22:49 +0000
Received: by outflank-mailman (input) for mailman id 845176;
 Thu, 28 Nov 2024 09:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kHC+=SX=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1tGajX-0003Lx-Ov
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 09:22:47 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51b1d0b5-ad6a-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 10:22:42 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso649015e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 01:22:42 -0800 (PST)
Received: from premium-test ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599973202sm44799266b.198.2024.11.28.01.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 01:22:41 -0800 (PST)
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
X-Inumbo-ID: 51b1d0b5-ad6a-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzMiLCJoZWxvIjoibWFpbC1sZjEteDEzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUxYjFkMGI1LWFkNmEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzg1NzYyLjIxNjc1Mywic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732785761; x=1733390561; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5SHNTErr57x+cB8HTiSBrH8uQLW242r53zDQAABjy9Q=;
        b=gU3E/9BzvJZR+b1CDHU50nwcluher2oFWQ68g2Tg+A0W+QS1yTgIqdsnp5M/CQS05d
         yhHWAUvtRmXliJiHOQqdUeutGGRzRotgSF9oBpLIaNy8Wy7qjuBFfgXjHge8ler9st3X
         yohkYCgSwgpOeG7LmJnLN5D9xjXRKyp6X0EZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732785761; x=1733390561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SHNTErr57x+cB8HTiSBrH8uQLW242r53zDQAABjy9Q=;
        b=uxkwKk5W+LeYqhmFoozchaPoGyDMEGeeq4cf1cn8hdXq8clS8fUreVplm9KCN1Zmhw
         K0XfAafCZlOiHCrAEF1QxlY8CNVa+cI3K2lk4Zbd2xK/Coy7g3rK1S4F6yaBVsfxGill
         SV1r5ko/BXOkSJWNvzTboflNBDBeGlsuKqOe0jr4pTy4152CZ8rUuEN04fs5dVt8O/1N
         mxySG4annPBGGbw8sOrtvXq3MJ0CoBCXj/HYOUlyVcnXfAcCgUuR7fTcCy7KmFbLFuoH
         Iza+PQrGxqRcTtBKr1RQZY2P6gjQYNiSPthjbp149w+nvtNlT0Rc4xsMPnux03KHWurV
         lKmQ==
X-Gm-Message-State: AOJu0YyXdIBwEJC9PukihhHVGKwOSrXZJBOYIlsqtsnGPI35+kzQMBB2
	tJCv7AT95d/KzLdz8VTXcXkorQuHga05gtrHAZJP1xZVnjmhu5H3VzYqrtUjBLe6DitBdUrt+vl
	y
X-Gm-Gg: ASbGncvf82rZZ5j52YP+/lA4geMb1MdRlBCMdjLlNgNXBahEivOUvbBlZegqs05gCdO
	2VH3zXaPSXKWw76wlbtqtdhjp+Py4cpfad8og4jGYraOtgsamaZRwyYeGf9dAFhdJhstfXbB67+
	Wb7Era9WwtR3pvuzcF5ph5Qm6TCePlORnLeeMpuiKGreO3Rzdoc0cYgdvFiJ7SuhiRIgjTEIRuS
	QcjcGl7u2dJ15K7eKpMF0kursts3581PNdKqDX2py79/YxF15/t
X-Google-Smtp-Source: AGHT+IFoPLAIAhQBAci3sYn+IK7MdbTlb0uGnrfMqfy/MGj6IVL5OLqGbqf5BOYjRi/N/Ep46CYxHw==
X-Received: by 2002:a05:6512:b98:b0:53d:ede3:3d5 with SMTP id 2adb3069b0e04-53df00d11c8mr3679614e87.22.1732785761554;
        Thu, 28 Nov 2024 01:22:41 -0800 (PST)
Date: Thu, 28 Nov 2024 09:22:39 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <JBeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
Message-ID: <flhsfvmvqc5cffhc2bgbvbe2afonxo5wa4fe7qbas5yhnd5stt@vplc5f5baese>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
 <j743is6qrolxcblkz7q5ta46l2y6vad3e4vetcrgtziqpdpo6y@q7tsoe45ltdf>
 <63cf9731-61ff-472b-94fe-06b3a4fa5763@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63cf9731-61ff-472b-94fe-06b3a4fa5763@citrix.com>

On Wed, Nov 27, 2024 at 05:45:29PM +0000, Andrew Cooper wrote:
> On 27/11/2024 10:03 am, Javi Merino wrote:
> > On Tue, Nov 26, 2024 at 08:58:59PM +0000, Andrew Cooper wrote:
> >> The SDM instructs software to write 0 to ESR prior to reading it.  However,
> >> due to an original Pentium erratum, most logic skips the write based on there
> >> being more than 3 LVTs; a stand-in to identify the Pentium.
> >>
> >> Xen, being 64bit, doesn't need compatibility for i586 processors.
> >>
> >> Introduce a new apic_read_esr() helper, quoting the SDM to explain why a
> >> function named apic_read_esr() has a write in it too.
> >>
> >> Use the new helper throughout apic.c and smpboot.c, which allows us to remove
> >> some useless reads of APIC_LVR.  This in turn removes the external callers of
> >> get_maxlvt(), so make it local to apic.c
> >>
> >> No practical change.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Javi Merino <javi.merino@cloud.com>
> >>
> >> Based on Javi's patch correcting error_interrupt()
> > Fair enough.  I was only looking at error_interrupt() and missed the
> > bigger picture. This patch is more comprehensive and this is very nice:
> >
> >> Bloat-o-meter reports:
> >>
> >>   add/remove: 0/1 grow/shrink: 0/3 up/down: 0/-269 (-269)
> >>   Function                                     old     new   delta
> >>   get_maxlvt                                    48       -     -48
> >>   __cpu_up                                    1465    1417     -48
> >>   clear_local_APIC                            1109    1050     -59
> >>   setup_local_APIC                             942     828    -114
> >> ---
> >>  xen/arch/x86/apic.c             | 29 ++++++++++-------------------
> >>  xen/arch/x86/include/asm/apic.h | 24 +++++++++++++++++++++++-
> >>  xen/arch/x86/smpboot.c          | 17 ++++-------------
> >>  3 files changed, 37 insertions(+), 33 deletions(-)
> > Reviewed-by: Javi Merino <javi.merino@cloud.com>
> 
> Thanks.  Are you happy for me to merge the two patches?

These changes represent a single logical change, so they should be in
one commit. Please merge the two patches.

