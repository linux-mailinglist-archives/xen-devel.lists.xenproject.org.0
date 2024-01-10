Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4D82A247
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665743.1036044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfDy-000194-7n; Wed, 10 Jan 2024 20:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665743.1036044; Wed, 10 Jan 2024 20:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfDy-00016V-4A; Wed, 10 Jan 2024 20:30:54 +0000
Received: by outflank-mailman (input) for mailman id 665743;
 Wed, 10 Jan 2024 20:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNfDx-00016P-4Z
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:30:53 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25d96c99-aff7-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 21:30:52 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso55135091fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 12:30:52 -0800 (PST)
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
X-Inumbo-ID: 25d96c99-aff7-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704918652; x=1705523452; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhOIpROn0DuWv7Mj/10wYc/iwl6LttJqLi+jeGADm+A=;
        b=CQ6lq3xtgJIU/i0lv4xJVqG5xt22quq8OG/rDpefUyROxVkvZZ/MvVVcHPIH6XlH1O
         yCVRCRqDGpSZeU+cPgv2SOqsOY36qI872Ktxy/4SVPWkj2j4jR83BZ+cKsiAHu1f8Ne5
         d4UWbR2o5cSrn/LGeyYt27lARb8HS4JQg8dlwu02fFTsvO2oFXwiQmAz5EUqTp2iweIQ
         MLe3If1uRhCw8iSPgZPX3MSROCXRLPQKBQ75V3xQ0swmOHA/ihlUiT0exsH0PidSW2L5
         R0NkNGsxarYecGHupBFiwoPJTT39cklCyH6K5W1mYksgjd8ij/+NE8G7EIxyJwk2pUmu
         TOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704918652; x=1705523452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhOIpROn0DuWv7Mj/10wYc/iwl6LttJqLi+jeGADm+A=;
        b=CEuQQEmJ1tKpLgKpDDTj9R373kXLtRrPg0xs46nfTMVgzkD4EEgmil6dJCFGn/AiiC
         TaEp16FF1ZZ3wd6VXsmSsxPO63zA04o0idzhBwiexIZz0xQwXJLIlPCljV1lPXD02J0y
         mTlDmtP5Z0Dju9pKY4Bk8tHJeozaaQM5GjSR1RKzvqr6tcCOZU4wQXsOJlNLRpDkOos+
         O7O7MsPOBOeqIPIk0R+IHmq0KMRYMDVQG6C9a+Mprir4bLFi2BOU214lMuiqQK8iBE+T
         buaJat5XAsCA2la0oqmQtbi8vA5XM+9hKMxhG+ecVqBRRCkRVRDzxnuknZaEZrm9y+oC
         RU8A==
X-Gm-Message-State: AOJu0YzXunajxJfeUCI9AE2iASZBaLIF6aT2gwOz/g9Uc0dKZyDI0IhV
	QOKdNzy37KXyGgwKLyHs14qwuA9A1WCFq3RoFYc=
X-Google-Smtp-Source: AGHT+IG5BsG43fX4Cy8wJJvZcyXgKc60yriKZ91xmZgEXXxiiquxAQCZ7pwf21bppyFzzR06wnZ9AupTNEIMMtkePqI=
X-Received: by 2002:a2e:9902:0:b0:2cc:a5ae:f122 with SMTP id
 v2-20020a2e9902000000b002cca5aef122mr62470lji.78.1704918651465; Wed, 10 Jan
 2024 12:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-25-jgross@suse.com>
In-Reply-To: <20240104090055.27323-25-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Jan 2024 15:30:39 -0500
Message-ID: <CAKf6xptMfP7AjKdP+MmAmZw53pR0Un-c786ZOwS3eR0NYVtQaA@mail.gmail.com>
Subject: Re: [PATCH v3 24/33] tools/xenstored: move all log-pipe handling into posix.c
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:11=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> All of the log-pipe handling is needed only when running as daemon.
>
> Move it into posix.c. This requires to have a service function in the
> main event loop for handling the related requests and one for setting
> the fds[] array. Use a generic name for those functions, as socket
> handling can be added to them later, too.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

