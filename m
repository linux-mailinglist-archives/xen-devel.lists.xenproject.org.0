Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3256CDCA0E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 16:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192926.1511949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYQR9-0005N3-Uv; Wed, 24 Dec 2025 15:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192926.1511949; Wed, 24 Dec 2025 15:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYQR9-0005La-S7; Wed, 24 Dec 2025 15:06:03 +0000
Received: by outflank-mailman (input) for mailman id 1192926;
 Wed, 24 Dec 2025 15:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DYbN=66=suse.com=marco.crivellari@srs-se1.protection.inumbo.net>)
 id 1vYQR8-0005LU-8w
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 15:06:02 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0edc2140-e0da-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 16:06:00 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5942bac322dso6664023e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 07:06:00 -0800 (PST)
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
X-Inumbo-ID: 0edc2140-e0da-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766588760; x=1767193560; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AxcJ++mDjVdg2vkVJXskNfABxiuOiTbK8B4BuH1PAo=;
        b=CdOoTDt9HymXaqk7oRgskgJysBSs/gKFCDOze+m36desJE6nDlvFbqQNPnWdKFeA/y
         borNQBAF0+w9Us4Qv9CCzrKA6kH7wEGI4lwJF9yraYGCg4afuEP8J/itWCJmtws+02fE
         VoWdv1mimrtyK2ReHCC21yjHtuAWoT/sWER++Yks/qUDtdMx1d5ZdWUE699L3g5HW7C0
         baSmjrNO+eAdqs0vvQodimsI3baP2PEiIqgwNLQOKVGvCybvXp6/8nHSDDkubSDPh9UV
         Wns3wKIyBVLX+fP050O+e6VGxPMPNb4N+3L9XY9zfMzc5lXYxGkkHOGOvehHmPAJDzKU
         KxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766588760; x=1767193560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AxcJ++mDjVdg2vkVJXskNfABxiuOiTbK8B4BuH1PAo=;
        b=EXokm6AwlmvRYQLAAy0zv/9oTpkm/NQSzJmy/o91sQofuF6XZgFiRpAogg6k7/B8A/
         pEQy+FFw8p177lhjjfFXbyMHfAE6NMQC3KkTWghcZZfAru8e2rP+vVkxdomykPC+wElT
         JlqihfBzj90rEoUzTmkflKq5gZVjNb8gqjGQxHWZ/a8Vxt5b/rnaR5TBtjGsFg9Hpje6
         YE1c0HLWg6qMueqprWDTunwfgyJ1Sue5WJUfQx+xfJtHxIKUWNeU+eB8bYHi7ufMFv3E
         Fa7T+YeEceagzX3yVxzi/1P/8VtmU0JNlbdD65cSQhehKYUxxEnWsOlf4u5L4vvjBwSd
         uIMw==
X-Forwarded-Encrypted: i=1; AJvYcCWGjg5zFjQnXctriuqHRahBRLaZx8hjNX6+WhHsKrRvbRzU47q3R1Gb+RvM7R3T+Cm7xQpc4XffYR4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEcNV1dvjKIacXNlVAQ3fMmsDNw2O5NWjrJ+aZOS79r3c3DQg2
	uHjBTTNbuXZF5lD7kLA/XVNzRXtl0GD7GPJBo9UoTogblUwPhtNDw8Nl4oM7+X/XtMD8QWfj3bm
	vGnXUcUbXRXh4FKkVNTcnI1p+Hyxy2B70/y6whJGuqg==
X-Gm-Gg: AY/fxX6HwbHV8zbKMrxCOtansX3L5XmFuEKXiScQj8L326ytgdTbQ61FWUe/f5RpTHL
	qjwhUPdZ4IkeeBIMJa6G9ImGWqvs6EPqHbwM53KsUDUrxAWSnVBNzBoOmAjlc46snnzbwcRABfx
	3T6X2dePu4XFj0w/+n7gPQYWusJll9eCE1DMEEPQ0tQp80g+0TpMz6u/d+1j9DOqnyPLMr0O3Lo
	czfCkbLMfqkK2OR6cdXB7icMQwVHDZDO6m06/UiXu593/rKRliFrSQqz2b/YwTzQxseVe0rf57v
	A80qBvU017XguPZlToA64OqOhP59JGiOEsFzZm8=
X-Google-Smtp-Source: AGHT+IHVMuch2kTut9aphBozo1dC5IDPtF6bAMCdul3HMtqOKgey6ooHrpGe08sKt7YgR/cYTyIecO5t303sGEVu1JE=
X-Received: by 2002:a05:6512:2211:b0:59a:115f:5b86 with SMTP id
 2adb3069b0e04-59a17d08f04mr6718124e87.12.1766588760030; Wed, 24 Dec 2025
 07:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20251106155831.306248-1-marco.crivellari@suse.com>
In-Reply-To: <20251106155831.306248-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 16:05:49 +0100
X-Gm-Features: AQt7F2o93fZnlXnIb_xtPnoUbRnCKdtLBd5hClRrFTCRxTDzaZg28FIXeuTcS4s
Message-ID: <CAAofZF4JXeLpXHNLeKXSY=Xz18XcOwA6FFvnX=0+NbKMh3rYrQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] replace system_wq with system_percpu_wq, add
 WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 4:58=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>  [...]
>   xen/events: replace use of system_wq with system_percpu_wq
>   xen: privcmd: WQ_PERCPU added to alloc_workqueue users
>
>  drivers/xen/events/events_base.c | 6 +++---
>  drivers/xen/privcmd.c            | 3 ++-
>  2 files changed, 5 insertions(+), 4 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

