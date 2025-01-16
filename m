Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79AA13831
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 11:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873454.1284462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYNLY-0007xP-OB; Thu, 16 Jan 2025 10:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873454.1284462; Thu, 16 Jan 2025 10:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYNLY-0007vS-LC; Thu, 16 Jan 2025 10:43:32 +0000
Received: by outflank-mailman (input) for mailman id 873454;
 Thu, 16 Jan 2025 10:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7wr=UI=ventanamicro.com=rkrcmar@srs-se1.protection.inumbo.net>)
 id 1tYN1j-0002tB-JE
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 10:23:03 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd282102-d3f3-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 11:23:01 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e971a2a0so33030f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 02:23:01 -0800 (PST)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ac207sm54165545e9.12.2025.01.16.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:23:00 -0800 (PST)
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
X-Inumbo-ID: dd282102-d3f3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737022981; x=1737627781; darn=lists.xenproject.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZkvdDnyLVGp1IEy4txVMz8RNqPNLFiF+bNPBLcxx30=;
        b=Q3FL8DgKV9p0YvrpItuCmw0U4uTrTIv2G40G1LsSTxdiKazpL9EJ/k4kDzPUz1ZueW
         u4VCiimImlJtsYBqMP46Tve0+C0S4emjhkDLYifi+5a3zbWjjvqrNFhYhLHlm/qFrRuf
         c7+a1fDo8M0ObcOOAlGwir4to2ke9vqPPL8LlZf6OVIl97IDB70r410tYLaZtoLMoBGS
         v3tBA3hGduRqgr3N1b8vkQhKDc64uVbldLnKnBYOx2XkNikmqg40DeSMoZmoPF0xohql
         3AdanCtoolkWHnQsfJid13ZQfgtvAiptTy8oceE8S/IYJl7/Y7FMmgCeO+4p+DpmoiOi
         M9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022981; x=1737627781;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZkvdDnyLVGp1IEy4txVMz8RNqPNLFiF+bNPBLcxx30=;
        b=F9omrVKzCUt6ZwYH65lvnSoTq5OuUXLui3sVtIE6jkratZnklQmiJXV3RdtWNApfCC
         egMwp6pxRDD88NhxArjFQw5WhzMWBs7GKHA990S4+aoMPo7PTV63kBqSklcNVQbJs6Wp
         roc+xGUDeppxaSuyU7OlrbldwVXFAcNZOJ2p0S8N16a05EIPPSYf04T38YV+hyk2EprV
         vMgSvlZgoRqWWUSdHk7TG+JMxOZvFOdI41xFjQ7tRH5K1Eez+MzHXAs8sqiRLmUNIApX
         oSMVuVYyT9A2ZeDrsbCT+nzSwcMdqXgzl3QvBjG//6yjA+8D+GmPBo+vU7/EuXV32Crb
         PGCw==
X-Forwarded-Encrypted: i=1; AJvYcCX/m4dVZ9L3zDsxJRmw5xiBfFXlrZwBkUf+2j29H4y1jBQ19ufFIQvFBkB+8EoC+/SzEnqe242cSiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8ZM9H0bA+eq8jSRH6Oep17+ZT6YlDML2DsntOfHb2noXcEjr7
	/7167y316rDNXnhY0+nsgF3TVNBRjR2Xt4AdhoGX9flge0Lrb6CONTiPUKjBw2s=
X-Gm-Gg: ASbGnct6ryw6wC640lovGCtsu1Nb7sReyutF8cnTM8yIToX9vaYVYaYN2/ppx12aIw2
	m0d7WB+MhDvLj33b1WuKquZMfgQajWa2hgNqbH+a0xhO6tb8AQMKnEbzYjKlIlT6OE9jOV+aDXs
	AuPWcjzx1o1V6rqGtWUjeBE1L3AWFh3SdRCIZmZYTkefa5HCVKAVjKuHojNFdB/lfKX/AsdIJba
	yfssFBt+BsqH4LsYi3x+S3a6yoV1nsf0F8lB9I/IxkdQiee6jDTAUmd9uwDdsQPhw12+wb+uMzJ
	GhFaCuV+ZkTuCEL/
X-Google-Smtp-Source: AGHT+IGRoCDvefbFzC6jI8eoiyaJwQY+MVagscMSk1SQP59pQNBBzH+/Z2VgQqY5H4m/ta4tZ/nIKw==
X-Received: by 2002:a5d:5848:0:b0:385:f7a3:fec1 with SMTP id ffacd0b85a97d-38a872dc81dmr10932658f8f.3.1737022980865;
        Thu, 16 Jan 2025 02:23:00 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jan 2025 11:22:59 +0100
Message-Id: <D73F98QBJ4S9.3CN2ZUQ0GSMT6@ventanamicro.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
Cc: <linux-riscv@lists.infradead.org>, <jgross@suse.com>,
 <aou@eecs.berkeley.edu>, <Milan.Djokic@rt-rk.com>,
 <rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
 <oleksandr_tyshchenko@epam.com>, <iommu@lists.linux.dev>,
 <sstabellini@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <xen-devel@lists.xenproject.org>, <Slavisa.Petrovic@rt-rk.com>,
 <takakura@valinux.co.jp>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Andrew Jones" <ajones@ventanamicro.com>,
 =?utf-8?q?Milan_=C4=90oki=C4=87?= <milandjokic1995@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com> <20250114-316084c962eb867c0b681043@orel> <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com> <20250116-aa9eadde9279e66dbc01c705@orel>
In-Reply-To: <20250116-aa9eadde9279e66dbc01c705@orel>

2025-01-16T09:51:25+01:00, Andrew Jones <ajones@ventanamicro.com>:
> On Wed, Jan 15, 2025 at 08:04:05PM +0100, Milan =C4=90oki=C4=87 wrote:
>> On Tue, Jan 14, 2025 at 7:18=E2=80=AFPM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
>> > On Tue, Jan 14, 2025 at 05:09:36PM +0100, Milan Djokic wrote:
>> > > +#define SBI_ECALL 0xE
>> >
>> > Shouldn't this be 0xA000007, i.e. the SBI firmware specific extension
>> > for Xen. Otherwise why refer to SBI? Note, '0xE' is an invalid, legacy
>> > extension ID in SBI.
>> >
>> Hypercall is triggered through SBI and we defined 0xE just as an
>> SBI_ECALL ID on Xen side for hypercall handling (among other operation
>> IDs), so we're not referring to some standard /legacy ID here, just
>> utilizing SBI for hypercall handling.
>
> If the SBI specified EIDs and binary encoding aren't used, then the
> hypercalls aren't "triggered through SBI", Xen is just doing its own
> thing on an ecall. Xen doesn't have to implement SBI at all, but if
> it wants to provide SBI services, as well as its own hypercalls, then
> the hypercalls should be encoded in the same way as SBI functions and
> an EID allowed by the SBI specification for hypervisor-specific
> functions should be used. For Xen, that EID is already specified and
> it's 0xA000007.

SBI specifies a complete calling convention, but it's not necessary for
binary compatibility.  SBI also aims to simplify caller API.

Linux maintainers will want a good reason for introducing separate Xen
SBI call functions/macros (linux already has sbi_ecall, so please try to
use and potentially improve it), but the ECALL is guaranteed to be SBI
compatible as long as a7=3D0xA000007.

a7 is needed to denote Xen's extension space and the remaining
input/output registers can be implemented in any way Xen wants.

