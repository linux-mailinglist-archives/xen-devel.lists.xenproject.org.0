Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E310880CE9A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652265.1018015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChVp-0004Yy-PK; Mon, 11 Dec 2023 14:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652265.1018015; Mon, 11 Dec 2023 14:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChVp-0004Vd-M3; Mon, 11 Dec 2023 14:44:01 +0000
Received: by outflank-mailman (input) for mailman id 652265;
 Mon, 11 Dec 2023 14:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+fN=HW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rChVo-0004UO-KV
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:44:00 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8173952-9833-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 15:43:59 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a1e7971db2aso514750366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 06:43:59 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 hw14-20020a170907a0ce00b00a1d32353c87sm4880266ejc.49.2023.12.11.06.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 06:43:58 -0800 (PST)
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
X-Inumbo-ID: b8173952-9833-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305839; x=1702910639; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y+Mf5DKPe4H0F1CcEk5bpBg3cFKNa4ee8znJVZUoKq0=;
        b=FZR8DYqxkEik3Vtq5Woen1CqTP37HElpxhMIMQHXlgEbX8s8LQyzOt8IeyqjJAUM8+
         AgkSAeis5ie+ADhnqFP7zMHk3BNiQX/xWvvRoSI7PzoxIreM0kctKlzL0NLyjHNnrjfI
         mzapkuG/8wSsnBb0XBlBDKEoy7jOI93WtdFYt4NpeLr1vlRBAeARLcoqvMXuLOuOMOXU
         HxJNGbE9fPdnOgLuxc8yGOeU/ZFaBGsJ7qggLzuRPQ9ai8BG+AMdRzEy/4HAUKnUelma
         t6WpUEUdBwgYiJgN34hNDzQMsTPD1BeM30ULRhyJNdC2Kv9SX5eIYELMleHVH5w8cjRS
         aHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305839; x=1702910639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+Mf5DKPe4H0F1CcEk5bpBg3cFKNa4ee8znJVZUoKq0=;
        b=aXRlX5GAGx46aH3Z/tYobtS6C85W+B6Er0fSbkcvIJKi0R9kLA/QpFikkDEwWCZObn
         v10toDQUyfd6PJaH+hmBF/Wp8j3ke3lT1a07KdMwc3VLqipLVja1wY2t76+pIz1v10JS
         7KLUSVqTjFPzGXrjsoyNMpMKna+7qBdAxbVjVqAjPsRjovbs2ejjrz11hgXlkOuq2CEM
         hE1S/U5Tu/MYkFXQHGzxHsFNveDnSek0bwV8WHHuHcWg7WAwlzmDw7TIZORS2h71+DUi
         NGwC9Y5tt+CNNK6dvgAvWhrE095NhI5DsLsNbFgftKO0/Qg29bUtP9rY3K5n1v29hfIJ
         satw==
X-Gm-Message-State: AOJu0YxH2O0m0XjABp4WXlYUxNWq1+0+uTrmzgzr/XwBMf/AqoPcr6NZ
	3tZiJT3FfLBUJyq90Rs0JCNbZpY7bUgf+Q==
X-Google-Smtp-Source: AGHT+IF7uZS3o0ATcKzXAppneibvZKRUITKypfxX7YGQEM43ZMrGpkntUzT4X+UPUq8Dwu8RVwXtlw==
X-Received: by 2002:a17:906:d6:b0:a1f:aca1:6bc with SMTP id 22-20020a17090600d600b00a1faca106bcmr557888eji.100.1702305838893;
        Mon, 11 Dec 2023 06:43:58 -0800 (PST)
Message-ID: <a53707edfac7d8d959cfc858953a1d64c3149596.camel@gmail.com>
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 11 Dec 2023 16:43:57 +0200
In-Reply-To: <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
	 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
	 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
	 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
	 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
	 <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
	 <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-04 at 11:39 +0100, Jan Beulich wrote:
> On 04.12.2023 11:34, Oleksii wrote:
> > If you ( or anyone else ) don't mind, I'll update the patch with an
> > introduction of HAS_GRANT_TABLE.
>=20
> I won't NAK such a patch, but unless convincing arguments appear I
> also
> won't ACK it.
I am going to disable GRANT_TABLE config for RISC-V ( and PPC? ) by
providing a separate YAML file ( riscv-fixed-randconfig.yaml ) with the
following content:
.riscv-fixed-randconfig:
  variables:
    EXTRA_FIXED_RANDCONFIG:
      CONFIG_COVERAGE=3Dn
      CONFIG_GRANT_TABLE=3Dn
      CONFIG_MEM_ACCESS=3Dn # this I'll add in the next patch where asm-
geneic for mem_access.h is introduced

And then for riscv*randconfig jobs do the following:
archlinux-current-gcc-riscv64-randconfig:
  extends:
    - .gcc-riscv64-cross-build
  variables:
    CONTAINER: archlinux:current-riscv64
    KBUILD_DEFCONFIG: tiny64_defconfig
    RANDCONFIG: y
    EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig,
variables, EXTRA_FIXED_RANDCONFIG]

For RISC-V, I prefer having a separate file for all the
EXTRA_FIXED_RANDCONFIG because in another patch series [1], I'll
introduce a large number of disabled configs for randconfig.

For PPC, I don't think it's necessary to introduce a separate YAML file
for EXTRA_FIXED_RANDCONFIG. For the time being, it is only necessary to
disable two configs: CONFIG_GRANT_TABLE and CONFIG_MEM_ACCESS (in the
next patch of this series).

If this solution is acceptable to you, can I retain your 'Suggested-
by'?"

[1]:
https://lore.kernel.org/xen-devel/b4e85f8f58787b4d179022973ce25673d6b56e36.=
1700761381.git.oleksii.kurochko@gmail.com/

~ Oleksii

