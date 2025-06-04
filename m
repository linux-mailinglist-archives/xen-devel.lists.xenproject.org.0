Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C417ACE0F0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005628.1385063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpiC-0006TX-P1; Wed, 04 Jun 2025 15:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005628.1385063; Wed, 04 Jun 2025 15:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpiC-0006Rs-LK; Wed, 04 Jun 2025 15:07:28 +0000
Received: by outflank-mailman (input) for mailman id 1005628;
 Wed, 04 Jun 2025 15:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jLE=YT=cloud.com=aidan.allen1@srs-se1.protection.inumbo.net>)
 id 1uMpeB-0004nU-Sg
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:03:19 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c8fa1a7-4155-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 17:03:19 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-70e3980757bso9631367b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:03:19 -0700 (PDT)
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
X-Inumbo-ID: 0c8fa1a7-4155-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749049398; x=1749654198; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agykzeI/CP2rf2KGCNS4gg7WiuRx4xrKGi9P0NkfQ28=;
        b=WwZ6Ww0xdzUQgTMLg/DWP5gTQIopM/OFHpv2ZZQOphefRwC3Qld603HLHyZno7ZgHW
         WyhA7Zh8Ie8iIvDh8YZVj2syLmMcujZ5qZrjFfqc6HE6tG/od9xJo4KRF5noOJbtkhau
         6Rc7GmAGO/EryD9fnqwI717v2qCLQykPaWFo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049398; x=1749654198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agykzeI/CP2rf2KGCNS4gg7WiuRx4xrKGi9P0NkfQ28=;
        b=WvCrr0HrMGDzmY1FaR1vCOe+JPn5us0J1vZMO7YbIKhMse1vmEr7hQQzqsd9C3espH
         yf6uZyG8voBwGIvzkGzfNu9TXXaAESOGDyfCpmQmD3RL/b5zF2SPEhFH3fdcl0jJySlP
         HJ8X3ktpdGTq2wn2Q6xok87M1SsPp49l+ldUjQ/aYHfB7pI6BaBncxctu9WG7ZCvLbSp
         qqUCp9cadM/DxfAy4nS2hGnnce/s0OgoHB642qAgCb11/vX8quu/xhhbMrU3XyMCrWTE
         NysvcNcVa/jALo+06P9YpTo1pWWFTKCeVb/q6Q7DATUXK9z6PBNdjIMw/KN+PQbAtEOB
         YGGQ==
X-Gm-Message-State: AOJu0YxKLxNBA8ue2bBaDDXtd64pbs213nqfjwgufCP+8uFcju1xhg7/
	77kNDjNljygBvjBGvsMqG1LiqUrADwOQWIGFn8wGii45II1cLUth0iEetip7S+znu5DeMAXOAcU
	N9CHJ2f3IASjrTYfaWztyT+ZzSjDVwSlgIeYE6hNaGQ==
X-Gm-Gg: ASbGnctui8VT+/QVV0J7ztMTrwPtvojlVd73SLEAksqRbw8Y5gMvJ/KROmeDiffcK4y
	dMaDZAR/hcgIguC/oZ0J1JcDfErqUA876w+92msXMA98oNP1Dba8/oZvtOQ9Lm6+9DVgLAaYW9O
	+DQ8g0kNnab1YaqZn2a2AY3/o41Y4FzHkx
X-Google-Smtp-Source: AGHT+IEqF0SLV+GCQF+QfBOUfR0r1MwfptPqkOmqScPWq5rYbqvxsSsyjfCvAdo6PzTYZqr7FafcwV8ng+tTOMpJTT8=
X-Received: by 2002:a05:690c:dc7:b0:70d:8e1f:ec2b with SMTP id
 00721157ae682-710c98673femr98902357b3.6.1749049397837; Wed, 04 Jun 2025
 08:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
From: Aidan Allen <aidan.allen1@cloud.com>
Date: Wed, 4 Jun 2025 16:03:08 +0100
X-Gm-Features: AX0GCFupS9JuYktCUlMyyxJwXzkMWCCCe0oCAdMP4ZIfnfB-OZ-HeQ1YRKDo6kc
Message-ID: <CANgacT8dj=OpOsKLPQs3gFD9Rr+7SigZWST-7hOuSSGfn=zUVg@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Process pending softirqs while dumping VMC[SB]s
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 2:02=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> 24 guests with 8 vcpus each is sufficient to hit a 5 second watchdog.
>
> Drop a piece of trailing whitespace while here.
>
> Reported-by: Aidan Allen <aidan.allen1@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

LGTM. Boots fine and cannot reproduce the crash with this patch.

Tested-by: Aidan Allen <aidan.allen1@cloud.com>

Thanks, Aidan.

