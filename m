Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2629984AE1D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 06:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676638.1052852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXEAu-0008Q6-24; Tue, 06 Feb 2024 05:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676638.1052852; Tue, 06 Feb 2024 05:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXEAt-0008Nq-VQ; Tue, 06 Feb 2024 05:39:15 +0000
Received: by outflank-mailman (input) for mailman id 676638;
 Tue, 06 Feb 2024 05:39:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXEAr-0008Nk-PT
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 05:39:13 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e977a9c-c4b2-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 06:39:12 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5112d5ab492so7158142e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 21:39:12 -0800 (PST)
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
X-Inumbo-ID: 0e977a9c-c4b2-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707197952; x=1707802752; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dG+A5vlwccgptvGfzo09IcHsRnQBynlBnr+SMFU7cg8=;
        b=GL2TCVqoIBQfahhjNUcDQJiB/Mxj7EmwKDo8RRsup9rHFeQoMwTommuBbCSKQb9wbo
         DZh5ga9AvgwzQbe/7tG4ev7TUGdNl/zNrzB3dj4jVs2xgsAf8ZeAl+f034WL9/kxIwXC
         uvAlCz+4uRRfFR4aXKlyzLtgov0DNwvwOOZuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707197952; x=1707802752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dG+A5vlwccgptvGfzo09IcHsRnQBynlBnr+SMFU7cg8=;
        b=n0bl2sb+SH4RL2Tj09KejosgLV+qCHwwR/GH+27MBz6OHJU/tCPsy+OTvhx+8Y8kzg
         Fa7pJLz5hb6XLTOxK8TOplcVhG8KjpZfJJAeoYdQIGuimCoDN0KH7qjWv1IYr1FmNfmI
         SfvgdVUr1f/M9BS/7nwfLb7gLfZ5L0CwYQdu8sd0MaGw8hFTnYw4awfFUxyX7x8+uyDv
         Kl0fTFfbNKyJOza9GJrVCFdJ6asGfK0QRs1AGw4CVfjWA+3soEi6eDurFtzJ3IDxvFkb
         Sm0zd/gGeb3UxiVn1PknqYustTjsSlpCh+oWdgoyecQQ266mCZ+CHlSgWPRVlcMedRLy
         i2DA==
X-Gm-Message-State: AOJu0YyF8RfUFDuyh3NbNdWzvNnHdHKkAy1a8gfP/eZcqld+fSFUh24Q
	uOp+HX3mKorare7PqYuTBAWgVzKZ0S5YTyfAyDKmpytx99bvVZloDviiYEnMG1i7ZsVF2Fx+JMG
	qywS2RptzCA00jrg2LeP4FHY6hai7YNvvRslItA==
X-Google-Smtp-Source: AGHT+IFHEPYAuM8wiaNKvgnebRdFQxjfVyEBnXibwDd6ClvmKilVRvgTuoL3SccDz8j376/cV5YFzH+8IqVVPIaM2O8=
X-Received: by 2002:a2e:9917:0:b0:2d0:ab64:a7f4 with SMTP id
 v23-20020a2e9917000000b002d0ab64a7f4mr1061220lji.6.1707197951812; Mon, 05 Feb
 2024 21:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20240205165331.18627-1-anthony.perard@citrix.com>
In-Reply-To: <20240205165331.18627-1-anthony.perard@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Tue, 6 Feb 2024 05:39:00 +0000
Message-ID: <CA+zSX=bG6ffjScLA4-uFszJMyjtsPvrNAokZUA5vvN-GMEk8Gw@mail.gmail.com>
Subject: Re: [XEN PATCH] golang: Regen binding
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <rosbrookn@gmail.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 12:53=E2=80=AFAM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> Fixes: 024e7131be5c ("tools: don't expose XENFEAT_hvm_pirqs by default")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

