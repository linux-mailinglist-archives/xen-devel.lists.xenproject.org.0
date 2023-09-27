Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624CD7B06BA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 16:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609044.947902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlVWJ-0000f3-Dw; Wed, 27 Sep 2023 14:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609044.947902; Wed, 27 Sep 2023 14:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlVWJ-0000dC-BK; Wed, 27 Sep 2023 14:28:07 +0000
Received: by outflank-mailman (input) for mailman id 609044;
 Wed, 27 Sep 2023 14:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwnc=FL=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qlVWI-0000d4-Di
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 14:28:06 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12843dbe-5d42-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 16:28:05 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so187336681fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Sep 2023 07:28:05 -0700 (PDT)
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
X-Inumbo-ID: 12843dbe-5d42-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695824885; x=1696429685; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXuYqEgzh/iOAZe12fKV8DRfIXiJLypHN3eOCRvPQNA=;
        b=fJUvzyiYF5NqpJOGdlI+lzII+JnuV+Ik86BTGw+2gtDhKwi5IjbHxss9dT/h6dHuAO
         OOhSGXjI3EKt832dWA+ynzCKBxblz2giDQlQ61ieiobm/NMVgNZShG/eD3+Vb6FqQGEy
         rME7QsJvGtMIk9sMXgRzpU2vC67P/2F6QEqtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695824885; x=1696429685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXuYqEgzh/iOAZe12fKV8DRfIXiJLypHN3eOCRvPQNA=;
        b=remPczBF9vjZVvf6NxvjRN16c8Cuq+oREFTC6X80Bo4IkOmrpsXbOkIfgjWfRvQr2b
         G2oh9+S91I9AUi5QSwoNuR4TAknJECEFYGxzC28HKU1tbeW3+Ti8vNGEH8Hipws+XWAi
         nKknQe9dmR4NOjOy73XvI1jun+Qj53DU2sz/UOsojyLTkc6g72RYx3PuD1YLHP3WRISC
         aVcYBd7fM3NbVOy08AE2Gftgw5D/AFdD5eO6SaeHZGhhnwDXXiCqgo12FDXSsRLwRFp9
         QjnYdvT9zUsjpRBp9ldpt99PirMN2WpPuxcTLhhMSAoVFKBcv+7dJ5ysM3Px+TP35iBF
         AOZQ==
X-Gm-Message-State: AOJu0YylKBXmH/AEH9ca7pnUIZ0C47h0FibcJ8jvHVZk3pFHgiks+OG+
	bsHC0zrdIqYE6KvzLPweenJBUxjv2+ZmxiE8uXYBqg==
X-Google-Smtp-Source: AGHT+IH9zl9dYb2ITxRQzisH4C2CUKi6QMlXbt7v5lFTjGc61/hGsFV7yPsDBGltOhuIMtTyqoX5rBPEf4zlEMvyAWs=
X-Received: by 2002:a2e:3c10:0:b0:2bd:58b:3a0b with SMTP id
 j16-20020a2e3c10000000b002bd058b3a0bmr1899936lja.50.1695824884974; Wed, 27
 Sep 2023 07:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230927002938.1770418-1-sstabellini@kernel.org>
In-Reply-To: <20230927002938.1770418-1-sstabellini@kernel.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 27 Sep 2023 15:27:54 +0100
Message-ID: <CA+zSX=YJ7CfydKXrz+VD3dd8BSG9zb=3bTo93QAFD5H6iQbk-w@mail.gmail.com>
Subject: Re: [PATCH v2] SUPPORT: downgrade Physical CPU Hotplug to Experimental
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	jbeulich@suse.com, julien@xen.org, wl@xen.org, roger.pau@citrix.com, 
	Stefano Stabellini <stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 1:29=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> The feature is not commonly used, and we don't have hardware to test it,
> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> members. We could use QEMU to test it, but even that it is known not to
> work.
>
> Also take the opportunity to rename the feature to "ACPI CPU Hotplug"
> for clarity.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

LGTM -- I guess it does want a changelog entry though.

 -George

