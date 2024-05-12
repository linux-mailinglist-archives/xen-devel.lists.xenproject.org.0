Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50118C3727
	for <lists+xen-devel@lfdr.de>; Sun, 12 May 2024 17:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720591.1123564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6BOl-0008VF-9p; Sun, 12 May 2024 15:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720591.1123564; Sun, 12 May 2024 15:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6BOl-0008TQ-6g; Sun, 12 May 2024 15:46:03 +0000
Received: by outflank-mailman (input) for mailman id 720591;
 Sun, 12 May 2024 15:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAR6=MP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s6BOk-0008C2-0o
 for xen-devel@lists.xenproject.org; Sun, 12 May 2024 15:46:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb27bd4f-1076-11ef-b4bb-af5377834399;
 Sun, 12 May 2024 17:46:00 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a5a5c930cf6so113881566b.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 May 2024 08:46:00 -0700 (PDT)
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
X-Inumbo-ID: bb27bd4f-1076-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715528760; x=1716133560; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbTbRtgUiP72GkT6/YqDaFY9yg+GfdxSuJV/XCZAyTA=;
        b=TqwJgGYqwG8IN6HuamjODh4ggvI3eNaDWLfTBXdYCeaoTalTY2v+FW0RHBdkrUTOMS
         /hIVVtzDEHiGHIf9F96WfwRIOVaOmBUGwEEH4o/0MLxfgZVRPkCfDmqxBqrbMG53mRii
         xrl9gH1b6tSY8IvS0NpD6+9o2jK59UoEmiEFQGhnoIHS15aGulX5yFSKac1Iki55Xu94
         1Dz+5dNfTjFsC2JEldW+nXEI75jErqbxO9XSNn1wf0yPeCvIZwTGPjH6zFU3hofmMVBN
         l0J7gF9FZjO1jC7vCkBG4iS+Kr0Utxtd4x/fxHtT92lmwB/iMH6GYc862wzRjohKcyd0
         k2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715528760; x=1716133560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbTbRtgUiP72GkT6/YqDaFY9yg+GfdxSuJV/XCZAyTA=;
        b=bV23iVFv1ojvRTsFp5MGOndUK3EwvYWVJA6AbkSzDSAZGMf11P2YA9PoVcTiCr4h8A
         4jVLHXV1rHS7Qa3WBTc/b1u3sI1QR+027sZ/8bomwsDEI+N3EiWR+9/vTMCobGWafllq
         g9Gjb5D7wmhbCbZtRiUcBxo8AWJbKSUI9jblPvL8XbM6ZqyKFAIT0l5HL+y0MFtw71Sa
         sDRRgZCmaw3cteParCkgTj/PsFJr1t8V2D8exktEueUzkX7fH9iru91MWvx79RHO2Ml2
         OD4aKPC7U2NScEYiDGy4zbEd/aPSZrXKG//qfvgU3JlqMNZiRE9PcYtN7ogDLoyHYYn1
         gSvA==
X-Gm-Message-State: AOJu0YyIiLYBrpy3FYwX1bsqBktz+rbSLdASoQ+Zb/n34k6M5x53Q19t
	8ffYjPvawp9W+0qHjPESbSxU7heiqvfFGevTu2tkCvzzdQTua5OjdtiW5OJiBMU7z1uIGFIHIwN
	/dM5a4TPtAiOLuEOFMzft3tbfs0zs/Q==
X-Google-Smtp-Source: AGHT+IFv/3YnW79HbfRjo6N82zFBOYCQARPGHsoAE1HtdGuBbT+Aj88sIRFCrVpH4cUu2Z0W1w6rsjMfQb4ilHtDfQE=
X-Received: by 2002:a50:8a95:0:b0:566:2f24:b063 with SMTP id
 4fb4d7f45d1cf-5734d5e4ba9mr5451332a12.23.1715528759881; Sun, 12 May 2024
 08:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240508213824.55824-1-leigh@solinno.co.uk> <20240508213824.55824-3-leigh@solinno.co.uk>
In-Reply-To: <20240508213824.55824-3-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 12 May 2024 11:45:48 -0400
Message-ID: <CAKf6xpty-wAU36L4KAqbEB=BHQEF=gGs=dBOhB_BYkvOrBEA2w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] tools/xl: add vlan keyword to vif option
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 6:13=E2=80=AFPM Leigh Brown <leigh@solinno.co.uk> wr=
ote:
>
> Update parse_nic_config() to support a new `vlan' keyword. This
> keyword specifies the VLAN configuration to assign to the VIF when
> attaching it to the bridge port, on operating systems that support
> the capability (e.g. Linux). The vlan keyword will allow one or
> more VLANs to be configured on the VIF when adding it to the bridge
> port. This will be done by the vif-bridge script and functions.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

