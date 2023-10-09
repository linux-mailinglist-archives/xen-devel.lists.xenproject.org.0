Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826717BEA89
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614441.955508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvtE-0005ug-CP; Mon, 09 Oct 2023 19:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614441.955508; Mon, 09 Oct 2023 19:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvtE-0005t0-9W; Mon, 09 Oct 2023 19:26:04 +0000
Received: by outflank-mailman (input) for mailman id 614441;
 Mon, 09 Oct 2023 19:26:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xq5o=FX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qpvtD-0005su-0U
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:26:03 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac004e1b-66d9-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 21:26:00 +0200 (CEST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178]) by mx.zohomail.com
 with SMTPS id 1696879554439198.56562758093196;
 Mon, 9 Oct 2023 12:25:54 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-d8673a90f56so5148045276.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 12:25:54 -0700 (PDT)
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
X-Inumbo-ID: ac004e1b-66d9-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1696879556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=epLr6YlUiri8a+7+C7uX7Dl9uS6QIYivkX5j/I2DKY7O5cjih9fDKDc7EcEuXFSMluMnbcXcdwhJasEEv2Z+TbUiRKxFxVOeNc3lTI/HewD74p0XybYNEC6xcBCJxZbqXVFR9HtHYwxFb/JOW8P9j32VRlHxy2dB7JUroiC2kBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696879556; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qFKBvHh2n933efa+5z6EkgCUMcNkftWthOO5thaMdvo=; 
	b=gUkCM1T6pfEQSb0hs3eN+VI+35H9yS8Mx6TnhjLRo8Np9ON3o6a1M0VyHFeGIFqEGK84xRExeDPnfVS7vB4mvtQScL/loJLYmpoH8E61/iZpcPSUJGCIBtkYmqozi9PXiphOoJNKeNBmyyyqplI9a33VU+ZnEAl3HO4eDgLiPf0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696879556;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qFKBvHh2n933efa+5z6EkgCUMcNkftWthOO5thaMdvo=;
	b=IPC63Kic3WvqNQmQJpy19ubrHyOk8ot9ZaRW6lMXIR+pYtwdhRS5KNf544BiRAht
	nEYSsWK9PQ0Dh+6pjKZ6oPJcOPqDUsLqNe4lvJs35Ku65cZ7Sb7FLm0EfxyiVG8WM+O
	pLS4kq4dYWGdmTK53z/uKiI6Bnj9I+c2hlKwVmXw=
X-Gm-Message-State: AOJu0Yz2pj0xPlLPf7sbEfixZp7CyUwstX0yiM8NagRrbgiqVaKXgiP9
	bHKpaEMRFmFJfCxXCCOg84uiyqJSIWu3M9mTWpU=
X-Google-Smtp-Source: AGHT+IG2URxlCPLxZyx5J/AtzmfU8nwUWgNIeWf/MnZ6UXrstX6ESJUsl0+q7sD9tuGV63TZrNykdDsw5rIG+dMGSAs=
X-Received: by 2002:a25:838a:0:b0:d9a:5071:716f with SMTP id
 t10-20020a25838a000000b00d9a5071716fmr332823ybk.59.1696879553405; Mon, 09 Oct
 2023 12:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696833629.git.nicola.vetrini@bugseng.com> <4f506769acca31d3d9f36b893822581720050d61.1696833629.git.nicola.vetrini@bugseng.com>
In-Reply-To: <4f506769acca31d3d9f36b893822581720050d61.1696833629.git.nicola.vetrini@bugseng.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 9 Oct 2023 15:25:17 -0400
X-Gmail-Original-Message-ID: <CABfawhkD2XwidWF6KezWz8cd=1yBWSfR0gOLrDFH7ZyN+Xrctw@mail.gmail.com>
Message-ID: <CABfawhkD2XwidWF6KezWz8cd=1yBWSfR0gOLrDFH7ZyN+Xrctw@mail.gmail.com>
Subject: Re: [XEN PATCH][for-next v2 5/7] x86/vm_event: add missing include
 for hvm_vm_event_do_resume
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
	consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
	roger.pau@citrix.com, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 2:55=E2=80=AFAM Nicola Vetrini
<nicola.vetrini@bugseng.com> wrote:
>
> The missing header makes the declaration visible when the function
> is defined, thereby fixing a violation of MISRA C:2012 Rule 8.4.
>
> Fixes: 1366a0e76db6 ("x86/vm_event: add hvm/vm_event.{h,c}")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

