Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FEB92BE93
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756361.1164952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCue-00085R-T0; Tue, 09 Jul 2024 15:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756361.1164952; Tue, 09 Jul 2024 15:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCue-000830-QM; Tue, 09 Jul 2024 15:37:52 +0000
Received: by outflank-mailman (input) for mailman id 756361;
 Tue, 09 Jul 2024 15:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aI6s=OJ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sRCud-00082p-OS
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:37:51 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31d99e20-3e09-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 17:37:49 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1720539464976752.0324934837599;
 Tue, 9 Jul 2024 08:37:44 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e04f1bcbf84so249360276.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:37:44 -0700 (PDT)
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
X-Inumbo-ID: 31d99e20-3e09-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1720539467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e0pU+9+1UYf/E/PZ2cns7rwknbd47XFVjR+vuu8nZc5/Xib///TtJVTqdmEAyrMdztHKoAboGqz1btv7Lep+vh8pCgOMUvH2Q738p48f7SYA2Dm2HLlnHqupUXnPGaHGFMt7sboUyTogVRECrOPbvsfhz2g3ijl1o6DePD0a6+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1720539467; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NUUI8ZSovdRWBKLlWARpYwrsq+B8cMTtPkOYvvyk72o=; 
	b=iaqvb7tfFe2wZfaPPYHenT8FtEsR888UoYkN6cTjewvdGmOSlAOWToOhKFyOYnL8e6edp0v6+3xEgxE7TthLWz5Cg7OF+fCxVnT/D65krJvyvCL4iffRqj9LCk8zUnKMrpAx1KAAbnylFnZv4ey8dPFIuF9GPmpry2p/pNrygEY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1720539467;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NUUI8ZSovdRWBKLlWARpYwrsq+B8cMTtPkOYvvyk72o=;
	b=BV/Zd7Ip+OHkSiLtQE+gc19MQLFjAxQGwembyZEOru5MrZMWe7J3wDp7qKXD4AM8
	gwadsDq/abIgbF+CT24QgxI/s5iegaYLduiTTTZ+5AId/P/oRunLEX3FzxqescTT4Zr
	osy20dzasfKX5y8JrJFzuknLUD/Trase+2K6xtwc=
X-Gm-Message-State: AOJu0Yxxwdd6lYpVOt2LCwpKJ3pYKRZqIKHxwjoRxpqQ8pMNXh45M8xv
	6GmHUY5MshcGh5anxLZVIhi06vrO3YFZyIhLw9vyNkFJo/kvvBOgGB9XcrTa69cHRrX/rxdjE9a
	lMHnT6GHIy0j9yH2pMok7lxjVGwg=
X-Google-Smtp-Source: AGHT+IFIOQCxxupwjOjZaZWy0shAFsKKGqVWTp8tQ6jz8Bc0zhzFqaUTIXQmEaKOxUK9/35IkC0SEwmZ3Qz4KTcmLJ4=
X-Received: by 2002:a25:ab8d:0:b0:e03:9a27:feb0 with SMTP id
 3f1490d57ef6-e041b0397c6mr3207279276.11.1720539463901; Tue, 09 Jul 2024
 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
In-Reply-To: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 9 Jul 2024 11:37:08 -0400
X-Gmail-Original-Message-ID: <CABfawhmkNrMR5opsFZpyEXDaiLMyo8a5bepXL6A+MGnbwBFvAA@mail.gmail.com>
Message-ID: <CABfawhmkNrMR5opsFZpyEXDaiLMyo8a5bepXL6A+MGnbwBFvAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 6:47=E2=80=AFPM Tamas K Lengyel <tamas@tklengyel.co=
m> wrote:
>
> This target enables integration into oss-fuzz. Changing invalid input ret=
urn
> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding th=
e
> missing __wrap_vsnprintf wrapper which is required for successful oss-fuz=
z
> build.
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Patch ping.

