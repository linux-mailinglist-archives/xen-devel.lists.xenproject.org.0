Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E3B32543
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 01:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090596.1447740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upam5-0006wk-JX; Fri, 22 Aug 2025 23:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090596.1447740; Fri, 22 Aug 2025 23:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upam5-0006ua-GT; Fri, 22 Aug 2025 23:02:21 +0000
Received: by outflank-mailman (input) for mailman id 1090596;
 Fri, 22 Aug 2025 23:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3U+=3C=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1upam4-0006uU-MQ
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 23:02:20 +0000
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b9772bd-7fac-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 01:02:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1755903732182430.24189239395855;
 Fri, 22 Aug 2025 16:02:12 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-43601c9fb61so1553768b6e.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 16:02:12 -0700 (PDT)
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
X-Inumbo-ID: 0b9772bd-7fac-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1755903733; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bj3TBd5SHvdzTWrRtNiuo9dKCWMaJ1HSVaZYROx9DBCjG0qd+RGf2l8mGL5e1ooGxnzh3D7ZUSsuxN/ys6pnbx+zngXFc/XNZ1c8k7NAkVkT7da9L7WvAkM/3j/rnhxXsiyMk9M0gu4BpDIQwzAnY5E0kcG0TheO50RTalnpzsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755903733; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cvwk5vsCAJavQOCGfAxBnQH0MMNtw9Z4c5BKExmtyrw=; 
	b=lkAUVi7hh39k9KWmhrjO807DSguYM72Bnresz4QydOHUNHqN5lzVzP9Z9UqytxLP8+oVxDO3iGUCWq2sL2rW82FN/1SRHQkwZF/o3IHUrP0qLP2I8+aaO94Bx2gWfMfjWCY/8QPkMQX65T9qsT50C7uYm+Kpu3b/BntSCReUQUU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755903733;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Cvwk5vsCAJavQOCGfAxBnQH0MMNtw9Z4c5BKExmtyrw=;
	b=QM6uiM1u5s3GkykAFCxBsgXSqwhryLp/fcqHgbqazyHf0iUVciw/eQB7NqZ1oRnk
	RLrVXS1ki0Fnzdk1W5l+zA59nHrbXh+Osxv20cMDbciGFjUtOMz7ft+/hunnkWaU7k8
	rvOQBi584E0MxgB8fi9+CuWaJD1hOqDmKjdzgfYw=
X-Gm-Message-State: AOJu0Yx+ke+gbh2H63hQnv3XDJwV7pLz9W7nQZNZ7T6rWwX+910RS7he
	/BGwvX77ijRXoUH+BhadasEl2AX61qg4WJ+of3rSj0u4TfdLDlTmdxRDaCqdX0lTe8Eaenx55Dn
	uceZytAV8LOZ2Pzai1fyHDnCoM7bmfFI=
X-Google-Smtp-Source: AGHT+IEPAUIUh9j1paz4AjewQCxcbIFBQjfHBQDJbW2WTe2F5tzuIz388iZFXnp4hpOpbIutrmk0I7oYbi5ERLqkFGI=
X-Received: by 2002:a05:6808:180c:b0:41c:7cb1:fb47 with SMTP id
 5614622812f47-43785182210mr2124516b6e.8.1755903731366; Fri, 22 Aug 2025
 16:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753953832.git.w1benny@gmail.com> <44b4b60854cd7db6d529ff23bb228e9ac19a2a75.1753953832.git.w1benny@gmail.com>
In-Reply-To: <44b4b60854cd7db6d529ff23bb228e9ac19a2a75.1753953832.git.w1benny@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 22 Aug 2025 19:01:35 -0400
X-Gmail-Original-Message-ID: <CABfawhkYYwfnp7nVC4D1G8bmbaJZ7pDKpeT-hpYGEfq=BtteSw@mail.gmail.com>
X-Gm-Features: Ac12FXyGtsJ_porJ4vRgCLbF2l1dDWQ-BZ504vkHuSSdU2GvbDj8mrn68ZSmttA
Message-ID: <CABfawhkYYwfnp7nVC4D1G8bmbaJZ7pDKpeT-hpYGEfq=BtteSw@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] altp2m: Drop p2m_altp2m_check() stubs on non-x86,
 move prototype, and guard uses
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 5:28=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Remove the no=E2=80=91op stubs from the ARM, PPC, and RISC=E2=80=91V p2m =
headers and stop
> providing a stub in arch/x86/include/asm/p2m.h.
>
> Declare p2m_altp2m_check() in xen/include/xen/p2m-common.h and gate all
> call sites with CONFIG_ALTP2M:
>  - wrap the fast_single_step block in hvm/monitor.c with #ifdef CONFIG_AL=
TP2M
>    (IS_ENABLED(CONFIG_ALTP2M) is not used here, because in the subsequent=
 commit
>    hvm_vcpu::fast_single_step will be guarded by CONFIG_ALTP2M)
>  - make the vm_event.c path conditional via IS_ENABLED(CONFIG_ALTP2M)
>
> No functional change intended: on builds without ALTP2M the calls are
> compiled out; on builds with ALTP2M behavior is unchanged.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

vm_event/monitor bits:
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

