Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D658BA6FE7
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 13:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132313.1470701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2pYt-0007Lz-Tc; Sun, 28 Sep 2025 11:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132313.1470701; Sun, 28 Sep 2025 11:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2pYt-0007KM-QA; Sun, 28 Sep 2025 11:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1132313;
 Sun, 28 Sep 2025 11:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tAav=4H=gmail.com=linmag7@srs-se1.protection.inumbo.net>)
 id 1v2pYs-0007KG-Cc
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 11:27:26 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b1f69b9-9c5e-11f0-9d14-b5c5bf9af7f9;
 Sun, 28 Sep 2025 13:27:24 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-62fca216e4aso8115843a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Sep 2025 04:27:24 -0700 (PDT)
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
X-Inumbo-ID: 1b1f69b9-9c5e-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759058844; x=1759663644; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=NDCrItVj7gyijlPKTEbGaoKqtJjvgBct137cM0ZQjQj0R/OwD+n2UEZ0w/BQeyxYp5
         xvGQNrHoG02g8x0CEkVklk+bru1omInImFEC+0wpeE902WkynY91hbNJfIEinrTcz68R
         dr1AmTOst1y/uHH/gfiSwjJcA1Z2RxAY3GHCeKawBnXHP4QUxdO3SbPTXdDQ8FsywyTU
         pzPxovKJZpOAZ4hJvJratlMUhE2Fbhg7avTSn0IncJWYSTX3HcoSWP239WwJ9U2/KvFA
         pq2G3sz6iHTpe04cMgDACqCjLDYi2pUtVFKkHvNlrXBlLz8RsJjLjS4UUGsoN27OuDM4
         5y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759058844; x=1759663644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=h83QUL2paw69ORm4ryF9ZlKybSV+ddewn7/x6z0H/o0YDsKthCKeMcA/0Uc9yv8Wts
         HQDpWBiQnuZw7u0Xl5fj6MeqN0/NjNvNveQKE0VJSQzkEV0crfKUMntHiw1ozB8mY0zP
         pJdd2HJJarQeOv8y9nEUOcpnSuVqpZ5374VCuHzJoeVYAGTlJhkhDZC1LZFnD7d0DZFC
         xLIo5DMIqvjV008LEeXYXZ+U5eFqro02fTuVjpmnK1ycC2lT9dWdWdmDGNmDgxfaIx43
         SeDFo2TENKnmF8EnK0Gj0KiMxsjftMmT7EjeXeqWDw6LlVVCh8laf0NStcAW5Hj/LrAr
         IALw==
X-Forwarded-Encrypted: i=1; AJvYcCXh+KVXwqbIQNVnY/5iuLOn9ENQ1h1C5NN3K+HEaCsnD2W1XlpAxnuSiaDPzR6VHjVCLl7NoOpew2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7n1BzSZ0yTzkBTMLDvwdMD+MwbbC610HeF7csOQU8Tdy1V+vd
	pc4QEtgHLf2s4fkAZtiG/LBVtQarjcY/SrwGbSPId6gNug9y3OQRVpvEQC9yb4qwBGVys+YMzh5
	E8l6rpWimyvUUZjUGkt+/08xjbBcm7gA=
X-Gm-Gg: ASbGncufG2sn/yc6WLsZulOU1Dsqg8uDRpGw7e7AYY8bRBA030qmI2TXEepZ7nSNsPw
	ESMYvrfyLmOrullZpm26l5a0eFhJ8El1rq5FXcJhNYS+jj8XPJZYPBOicljE8LYZLlEqWkS/kU9
	gj1FVwJiPcfbqg2xtKoRpHDWp1Q1yFnVU3B+LLAAQ0uB+ZoCW8fVzkgm47lEn8VFm7nmlyk4U7A
	MLYGENWd1a9mnpiap8=
X-Google-Smtp-Source: AGHT+IEbmR6jFZWeOZACTqVTuyroT1qollOj9im3bB2gCUN08/YU89k9vFmzDRRbDuqGeOLmGGtFiulh5CESx8Sm0EE=
X-Received: by 2002:a05:6402:44ce:b0:633:ddd4:4e37 with SMTP id
 4fb4d7f45d1cf-634a331587amr9387899a12.13.1759058843815; Sun, 28 Sep 2025
 04:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com> <20250928105413.GE12165@unreal>
In-Reply-To: <20250928105413.GE12165@unreal>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 13:27:12 +0200
X-Gm-Features: AS18NWDQy06zFzFA0Tb4sMvL6G-ftUfrOQ8ZIU-yy9wPAEd2O_xZFFnSMKmSHdI
Message-ID: <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> Thanks for the effort.
>
> Can you please check the following change instead of reverting the patches?
>

No problem, happy to assist. I think this did the trick! preliminary
testing shows
that this now works on alpha! I guess the offset information in paddr was lost
by doing "paddr &= PAGE_MASK" before retrieving the offset, well spotted!

I'll keep running the system with some load to make sure there is nothing else
we haven't spotted yet, but so far so good. I'll keep you posted.

Will you be putting out a v2 of this patchset with these updates?

Regards

Magnus Lindholm

