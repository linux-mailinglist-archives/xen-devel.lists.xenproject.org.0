Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D8B94615
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 07:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128044.1468675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0vT9-0003j6-Q5; Tue, 23 Sep 2025 05:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128044.1468675; Tue, 23 Sep 2025 05:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0vT9-0003h4-NO; Tue, 23 Sep 2025 05:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1128044;
 Mon, 22 Sep 2025 21:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LTaO=4B=gmail.com=linmag7@srs-se1.protection.inumbo.net>)
 id 1v0nhw-0006fE-Ds
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 21:04:24 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b48d2bcf-97f7-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 23:04:19 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b2fcfef5600so29458566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 14:04:19 -0700 (PDT)
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
X-Inumbo-ID: b48d2bcf-97f7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758575058; x=1759179858; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uh7Hyul+h5lwAcNtxj/DI9qojjFccIciQ/b88SlaL0g=;
        b=CTol6M01TfvgNYX9ev8PGdJ4bjKLF7a3ZZv9QyBfRuVRIaOK4TXfUk5SurgC3XQgYG
         ako3VMN7tGM80G1Zz0bb78IAfpRggew7XgoJ81bFQMZpdLM0N9AveqiIRSx4hMFl6QCX
         Pc7vCuBkdr8/zeMDRLdjXTi422BL2HKSTHx7jkkCCLp6kNHP+AkkPR1hl30Q6HtVg2Jg
         MDx2TLYJw9GayujrFE4t63zoV/+6TuN14au94dZ5GOTpoqYQ2PBR8/AmOk3UzRApR07I
         B2lJnhb4uz4jaCKQH5yRMa2x53M7/Lsi9NMerXHS/cdT3XmxkwMiLf4PnwEdnDLf5h5p
         nZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758575058; x=1759179858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uh7Hyul+h5lwAcNtxj/DI9qojjFccIciQ/b88SlaL0g=;
        b=VVazWcb/8JayU2YxYsV5EsBlV1PYK07Xl92XavPW8/PjDj/w4zsQbGK4VG0M7w4htZ
         QLLE1QHJuk8TVHCc4ySYO39n1sHiFTNDrsRUAuBEz2FxQdyXbWBrCKj1KpPpFnL7ftCA
         tiRTTYkcRxvN51sXPfu8Zff1adv4oHkTNSh9Mo1WjJ3/imBU0Gqw6T8Bqs+pP+qDWNBk
         kx/71NHxylVex8625pjwNaoHR2rUk9Ky7oEvzFZShGWOwEhK0CpSZBnklVXwFkSTfofS
         5dFWsPUr1JuRXU6BpYdxA2qYi9RAs7cV9l/I76r3yAw5Y9U8EpDaX8RVsYsyUVgAKk+u
         dbIA==
X-Forwarded-Encrypted: i=1; AJvYcCV2hqiaP8pwoKKYOUhbTrqiWJFB0jfyI08a6Ma3LA4jxpou95c3cDTv1KNvMpXD0J0imb/VxRhp+lE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQh7CctDsRgbJmQfXGChuMGeMsx97LspgZ/ERZUWfkENUrnY2H
	Si5m8OR2IkbDln/wb0DI8e0GEAA4eLfNJIPsYbOqfxVFppxMWtTT+kjMFJ20OeKCBDlcFgOrV5d
	lw7K6PoEhnHDWtpGy2QkGOoEFLhCkcAg=
X-Gm-Gg: ASbGncsqufJo6Dq/qnfaXOhX7gWQO0r81DYXyAr6c0asosGwde1FWHoL1PUPC9UTqEG
	xAInZkgeplDSLKq8udW4RGVQnIrYjGqJXBs7EPNChuQMpIvENRSjQOrp2H7qR+9rjSLXHf9jLlp
	rAq6gwIAprRWSUW2Ehma5WmvLY7MFy6tgjZZKLNqwejNKhiHLKRqtRFwGhRNTm+OMhYxDwv73EG
	yYQbkXAC0sXB7VUuLc=
X-Google-Smtp-Source: AGHT+IFr06URzpJ6aUp4DpRFc3gqIF/QKzvPatkXOguRNAK+5vyBht27Wi77YYUi7cw/QJFO8eHWzN6Nc8/pR3lh7aU=
X-Received: by 2002:a17:907:72cb:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b3026c84e0cmr5356866b.20.1758575058272; Mon, 22 Sep 2025
 14:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
In-Reply-To: <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 22 Sep 2025 23:04:06 +0200
X-Gm-Features: AS18NWDVFMZZnWEreuo7vPXyYUB8RQkWA0R_TESbZnVi7LcEMvax5dEHcVzVJVI
Message-ID: <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 8:45=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.


Hi,

SInce this patch affects the Alpha platform I got curious and decided to
try it out. The patch series requires some preparatory patches. Leon
provided me with links to his dmabuf-vfio branch, which had the
patches (and some prerequisite stuff) applied already.

Based on the dmabuf-vfio branch,  I've built a kernel and tested it on
my ES40 Alphaserver, the kernel booted fine but after a while of
moderate filesystem load I started seeing some ext3/4 related error
messages in the system logs. Rebooting with my old kernel into
single user mode, I was able to recover the filesystem using fsck.
Clearly this set of patches breaks things (at least on Alpha).

I haven't yet dug any deeper into the root causes of the file system
corruptions and I've only tested this on Alpha, maybe there has been
more testing done on other platforms targeted by this set
of patches?

Regards

Magnus Lindholm

