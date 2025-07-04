Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D0AF9CD2
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 01:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033864.1407095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXq9K-0000X3-MA; Fri, 04 Jul 2025 23:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033864.1407095; Fri, 04 Jul 2025 23:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXq9K-0000Ve-GU; Fri, 04 Jul 2025 23:48:58 +0000
Received: by outflank-mailman (input) for mailman id 1033864;
 Fri, 04 Jul 2025 23:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mgym=ZR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uXq9J-0000VY-8U
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 23:48:57 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 721f6fb8-5931-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 01:48:56 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2cc9045bae9so231429fac.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 16:48:56 -0700 (PDT)
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
X-Inumbo-ID: 721f6fb8-5931-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751672934; x=1752277734; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJzanTHGjvHTKvjPLBuJvvpoG7h3xLmSqsQDzx/tTmg=;
        b=UOHYpTIY1n5bp7fFuU6VYHVtv/DbntE4CxxDzxHCygdvJMfkcAxls7kJqGrw7Vo+a3
         0yrLPXGPJmbG9lPU3inhLfoeBIWKQD+o92mitktG1yXQ7/nGbf/bLARfVTTneddAdprf
         1B3dOG9rrbXDinnn9tuSrWfj7P9h4mgXVUPwJ6E8xWsjM9u0ArWQIR5SPFdwzW/8AAf0
         a2HKfMhK/dXLp7/myz74/W2k8+DUaf154Pz6QGf5nGuEqoPVFq8zMaRLa2QCO5eB+k+6
         69xGlHTYaPWnq17Uk9pXQGKe3I1PrBOHQYMUhZ7in+5XUKGmENbrBToRKw48rQ+Sq3TD
         vL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751672934; x=1752277734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJzanTHGjvHTKvjPLBuJvvpoG7h3xLmSqsQDzx/tTmg=;
        b=eJKLVxwbl6XfjVCKqoeuu878jhrRMapWofblJMqqdewTKx2EvfaxcZps3PhvPPtQyQ
         9kpKGbpjh1RWPwRVHMXk3GF2+HASpK73otPwjAsQkkJ4stLs4dkzTQNAoEBBiQ24zr7+
         q0DGiFk2X10CdY74siMJGOzPnrw8+ojunTOoDLmZcsAf1U0OFcrUSgnWUPU8mMlyPLrZ
         vffFh0zZGe3RLSRl8myGUmesX7vDFS7MZ5v+UtpzilvIBAevxj/3WfGx71Z21MeY4wUY
         jWcKyQzz9/2WoqIlSVt7K8ZEgDJKo5M0ze2F8MJfihQrhn3ClrK1qOcMHyQIkjtNL051
         Sk7g==
X-Forwarded-Encrypted: i=1; AJvYcCVxqXEpnFrr59gHNhw76IaFokwjSMw9n+zACcruKTqVr47LRduCf/4kuHgzKH1pUKaegnVM4jr/gpc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtgiVs1D3+fyD2KYrNq3EbFMscBtKhfAnLLu2t+fndfB/SQC49
	/wjBgLMgL0dPfJdgFBm57pxhn5eL6jCW76NW4YcRVudefNRVQ9qTReAI9AM834J70JrZ/jBjl1+
	moLkWqxsIYts8luuarwfD/i4MSRbSYiM=
X-Gm-Gg: ASbGncs7BpdT7MniQIcdSkl7Guu/Q6lyIBHzicNepQdGI1Lx0rvO64GTse8q294UNXf
	rwLGppTsmqc8rDjZ/8etEBTT/AX5NC7P9v3LnYMm5W4u+2MvueCcT7t7V6TrswmmqFfhES587xs
	WTVQWZep65FDF+IKIuQdS99ox1CbatmJMK6iuS7FkRrdyEt/LmcEZDDnI=
X-Google-Smtp-Source: AGHT+IFEgpn7ECgnacGTTL6g1SxxvH1kaoA0nazNERdOT6kuV/t9tbow/bjaxDdsaOtkTOxGSxZlaeQd7QN/f9XXsIQ=
X-Received: by 2002:a05:6808:302a:b0:408:f80a:b972 with SMTP id
 5614622812f47-40d05bc6b64mr984122b6e.5.1751672934466; Fri, 04 Jul 2025
 16:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751412735.git.w1benny@gmail.com> <99e281ad05537d2384eaffe95155a03382493c96.1751412735.git.w1benny@gmail.com>
 <8143b492-6e3a-48bb-b564-52b2623a78f7@suse.com>
In-Reply-To: <8143b492-6e3a-48bb-b564-52b2623a78f7@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Sat, 5 Jul 2025 01:48:43 +0200
X-Gm-Features: Ac12FXwAhb_PXYOGUgN_GZ5crX0A70r9PSNL4Nj7KYccjngeAAGjCWasK6iYF-Q
Message-ID: <CAKBKdXhOdMqPFO5GZpm5p=6PQf8G3Ho0+UG5rZjku6QESCeJtA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Anton Belousov <blsvntn@outlook.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 9:15=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.07.2025 01:45, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> This isn't in line with the first S-o-b, nor with the fact that in the co=
ver
> letter you say this was previously submitted (and hence authored?) by Ant=
on.

Can you please point me to the right direction? I have no idea what
tags should I specify here.

P.

