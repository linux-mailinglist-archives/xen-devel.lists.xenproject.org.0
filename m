Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF082A234
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665738.1036033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfAQ-0007bJ-P2; Wed, 10 Jan 2024 20:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665738.1036033; Wed, 10 Jan 2024 20:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfAQ-0007Z7-LI; Wed, 10 Jan 2024 20:27:14 +0000
Received: by outflank-mailman (input) for mailman id 665738;
 Wed, 10 Jan 2024 20:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNfAO-0007Z1-LD
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:27:12 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a270b86b-aff6-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 21:27:11 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55818b733f7so2495733a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 12:27:11 -0800 (PST)
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
X-Inumbo-ID: a270b86b-aff6-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704918431; x=1705523231; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nRUNNOIavKulSy9Q0ggc3YP8UFXHfwTBqcyW9VsujE=;
        b=DWtJH73f0wW2pYkwGE99/QUxPzUlm7OlIjg8nYwlJoz8aMGlHcyRn0TGS3l60fUbgx
         pmENWEPexICJiQIdTQQtAx9vVwVvzl6A2GOjSwf3pOK73BDFR9BI35egd3oeGsTbtlWC
         8HlRzda5jTSE++ftQN+hkEpM1spREYsw+leVQssmixGjNRqyK1COVrRTxZ9QGNZa1aqz
         lqVMJqwPwbhuqJ1ddtcwVXs0L4J2tOfN7OLi2SQGJHTvx1l7X5RQUpseYUkNeas88Dtg
         Ft4Y2jGilQq2Wk9/0Xsy7a/aMCOmCgmUPA1wqBptdKT5BtvZUVUvN4hY7beoq9FXa1YI
         7czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704918431; x=1705523231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nRUNNOIavKulSy9Q0ggc3YP8UFXHfwTBqcyW9VsujE=;
        b=vYVkMuDFTnQ1zuTydhB0sd0Xui7UgRffOnQLgISRdwG8BmdVasvGD4xQc63/eCVAoE
         rIOf+67qJXAzqjpNkttigxzZxxOLcMbFlaKWQWuxsnXV1mSNBbMXw7iUl/2GcOBz77LQ
         VauQMj8p4EWzVOnHhP+KxLFMqW0hesr6EG0qWCT38TuG4oYqByzJDb53sAOsZZyjdeJ/
         Fng52yX6iIDJnHZffs+yuNARrXR1M0RcSBkvmK0rE5LhmTEamjr+duW6Zd2Gj4h1J0jV
         ycKcXn28iTLQRBPaD1xUBjlwkjJZV0ji7Gwd7cg9cxqofdCgLR9/0RyTB7XLQgMYJP8m
         l50g==
X-Gm-Message-State: AOJu0YyGHmE94LG834asRVHx7dPUxwPkajnzOQQ3PmxXSSC9cPA+KIX+
	CQDImCX8UR0hArAW9gFCCQSia2DWp5bqdY68LZKsvByI
X-Google-Smtp-Source: AGHT+IFatB/vJ+6kHPGVykCmt4UeNsBgBurUVfjTrz1gKHxrSdD2QGrGwa12FPlRK/CdOKrMupq1yJdMlzGTMcqZJ54=
X-Received: by 2002:a50:ec8e:0:b0:555:204a:beb3 with SMTP id
 e14-20020a50ec8e000000b00555204abeb3mr19076edr.59.1704918431150; Wed, 10 Jan
 2024 12:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-24-jgross@suse.com>
In-Reply-To: <20240104090055.27323-24-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Jan 2024 15:26:59 -0500
Message-ID: <CAKf6xptod88p68Zppr8iG=Ni2ysJSHPvEftoocdL2PWP3_uygg@mail.gmail.com>
Subject: Re: [PATCH v3 23/33] tools/xenstored: move systemd handling to posix.c
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:13=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Move systemd handling to a new late_init() function in posix.c.
>
> This prepares a future removal of the NO_SOCKETS macro.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

