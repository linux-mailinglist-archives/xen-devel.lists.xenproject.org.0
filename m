Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A2F83E435
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 22:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672538.1046678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTU34-00055E-Au; Fri, 26 Jan 2024 21:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672538.1046678; Fri, 26 Jan 2024 21:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTU34-00053U-76; Fri, 26 Jan 2024 21:47:42 +0000
Received: by outflank-mailman (input) for mailman id 672538;
 Fri, 26 Jan 2024 21:47:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1+W5=JE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rTU33-00053O-1B
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 21:47:41 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8545b31e-bc94-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 22:47:38 +0100 (CET)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169]) by mx.zohomail.com
 with SMTPS id 1706305654228327.1509538128357;
 Fri, 26 Jan 2024 13:47:34 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6002a655d77so7844387b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 13:47:33 -0800 (PST)
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
X-Inumbo-ID: 8545b31e-bc94-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; t=1706305655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WhqyLomWD+CjfcR9uOpGCyO2ljAVP30t70ToQRR6AKV6OIxOwL1bzNaM8bxFkcFaam30F6V6tiSRchLRNdjifbHZ1H5KmO7jzjUOzhSvLhLK5F07G2kC1/miRsXKt5XE71os/4eq1NmYUvzAF8/7pCZKmDG+8VBNDxak7KK7pHk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1706305655; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YGiGIDFjG4PrNXFSFDL+6Bvoflhj/fuR+Xx+JJqg9bs=; 
	b=GCo8fLLc3RferaIA/QW7b5A2YFA6cOOFTkt3XKJrvS5TEvtB79DxiV32O6GZ/sP+CvRVJUKMdgCNkc5R7KVshXcJ09FUz1hlQTNYdzfyjLP1ZMwapjGd5sfnZqzMihkb/W0rfxOw7qh6lz3wBd1A3gehV/l9ddpSQpTY2yKt7Yg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1706305655;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YGiGIDFjG4PrNXFSFDL+6Bvoflhj/fuR+Xx+JJqg9bs=;
	b=FzSNdFmKFe36VlCqZVEXKvETtT6W58mCBUrBZfxcdBNEigpCetmjPrEEvTg2Ijvh
	xf3B/dWGzH4kMuWHLioUPLp28ihNelt9aTr9lYEKRu+L6tLyvbkaSQzCiKW+CLQfPkp
	Hd/dWHsijWwXWoQbCau3QbfvMaW+552wfzZWlpUQ=
X-Gm-Message-State: AOJu0Ywe0Tedvrorrs5WucskzfjR7hwtRvBRANQ86qVcZk+fJG2YdNBX
	/136o4u58EP9I6qsj3b0HQAbvArXo357xbNaGsIepLC73Rv2+nCc3E++/3iVaIL9AkD5Iuq7zeY
	PMrIqS1I2v5bCsVCmHckhvMsh4B4=
X-Google-Smtp-Source: AGHT+IGDcWTA06F/oJpZn3610o/9dxSjUn6VkONGmlSEOZOmzvdt5WcNpmq+4dOWdgK8vgeYzyFeI5swb6RMBmllWeM=
X-Received: by 2002:a81:ae65:0:b0:602:c6ac:890a with SMTP id
 g37-20020a81ae65000000b00602c6ac890amr449057ywk.51.1706305653196; Fri, 26 Jan
 2024 13:47:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706281994.git.oleksii.kurochko@gmail.com> <da7d16d1ab857e103c1b729d5ee3c9d588e1d3e0.1706281994.git.oleksii.kurochko@gmail.com>
In-Reply-To: <da7d16d1ab857e103c1b729d5ee3c9d588e1d3e0.1706281994.git.oleksii.kurochko@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Jan 2024 16:46:56 -0500
X-Gmail-Original-Message-ID: <CABfawhmfJ14FE+GcP-s=Hb5aAw7n5QvYUwZMLTeUgPek47Z2yg@mail.gmail.com>
Message-ID: <CABfawhmfJ14FE+GcP-s=Hb5aAw7n5QvYUwZMLTeUgPek47Z2yg@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] xen/asm-generic: introduce stub header monitor.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 10:42=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The header is shared between several archs so it is
> moved to asm-generic.
>
> Switch partly Arm and PPC to asm-generic/monitor.h and only
> arch_monitor_get_capabilities() left in arch-specific/monitor.h.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

