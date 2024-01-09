Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A39828E1E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 20:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664945.1035098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNI5M-0005he-E6; Tue, 09 Jan 2024 19:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664945.1035098; Tue, 09 Jan 2024 19:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNI5M-0005e9-AN; Tue, 09 Jan 2024 19:48:28 +0000
Received: by outflank-mailman (input) for mailman id 664945;
 Tue, 09 Jan 2024 19:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNI5L-0005e1-Ez
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 19:48:27 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d7236ba-af28-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 20:48:25 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so2992619f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 11:48:25 -0800 (PST)
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
X-Inumbo-ID: 0d7236ba-af28-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704829705; x=1705434505; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQTvPCN2zWa5yZRABHiEa1XRZcLKao4D7D/0DzROdzs=;
        b=JgXoJ9I985F3hFrCS/LOga+zMuIyYT9r+ZD8HLt/E4V+T4CWVOpB+ImtrvyQXdNcHt
         dmkcvqtCRyaAhG7BRjzRtOFKj1fs96zpV9qabKbAghXQcMQKMTyfq0U1tbU2pINUCgvR
         KrqaKY/eQeejfr36q47ckZQwc+89Hs+UL6eBD8GR5QRBLPRLK/wDax8RBj6FVXl3Hal+
         OSDBmSrOF9syUZiPScK2Y/gcop2ERqzlDjdQqtAhlUsvqFuuvgcoQkyHrEkFdDSGbmqm
         +QrviTTVtGWBfpUE07eyXCbx8gBZWRbvJ2hRVKfhWLUat1jU+0VrYw5a0Igm++oguhqh
         KBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704829705; x=1705434505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQTvPCN2zWa5yZRABHiEa1XRZcLKao4D7D/0DzROdzs=;
        b=icyMbAASlG0MaxfLbGQx99dhiCF4Nu4IAXpZGGYQ9AH6451i1pYeDOaqp4qWD6xvEv
         cc38uYlz5UD3HsRzD7TQUQJlJ/x+qGSHBO+naxOvrX+E5CvyKqInXmCiFXMNZsWY7FnW
         kOV9LpN9QxV5+qgkVK3sHnfQU5PKJcwre86GrIjn0PjggqY1mAh7AbZpG6C1LQFSlt03
         L2MPRvx60JTDiDVXFxMly8iEkVYACng3x8m7YHsIDs4hfTIssTEVvKOxl1bCoFuSjPrl
         hmm0lwMx1dNuD4+UVSdg02smjEh2NaajnPy435xcVbYUF1DbnsEQb2Gtqt5+OZ2/HQ1m
         tu0Q==
X-Gm-Message-State: AOJu0Yy6uTAzGPY9t4rMSwYUOBSMbCOpjrUQ36T5zbij2JPXEGmSQhUP
	5h5avfKFuBepjMaJGA6lmP9G57/ISKrwIan1+F8=
X-Google-Smtp-Source: AGHT+IEDLq96gl3MXOq4NbSYXl8b3AVbX65HQlqTw0GdpNzycnrtX2ynIOLrLv5wnjZOjflx4wctVy23+J7YyCjbLs0=
X-Received: by 2002:adf:e810:0:b0:336:76a5:5774 with SMTP id
 o16-20020adfe810000000b0033676a55774mr768939wrm.68.1704829705063; Tue, 09 Jan
 2024 11:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-14-jgross@suse.com>
In-Reply-To: <20240104090055.27323-14-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jan 2024 14:48:13 -0500
Message-ID: <CAKf6xpskhWj5TX233tLTp84xKDKoBDu-CwUtVkJy4NagOKnVJw@mail.gmail.com>
Subject: Re: [PATCH v3 13/33] tools/xenlogd: add 9pfs stat request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 6:32=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the stat request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

