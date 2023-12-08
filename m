Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4F80A7C2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 16:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650694.1016424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBd0j-0002rD-Um; Fri, 08 Dec 2023 15:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650694.1016424; Fri, 08 Dec 2023 15:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBd0j-0002pR-S5; Fri, 08 Dec 2023 15:43:29 +0000
Received: by outflank-mailman (input) for mailman id 650694;
 Fri, 08 Dec 2023 15:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gRCO=HT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rBd0j-0002pL-AH
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 15:43:29 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876eeb12-95e0-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 16:43:27 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9f85eff28so32024151fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 07:43:27 -0800 (PST)
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
X-Inumbo-ID: 876eeb12-95e0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702050207; x=1702655007; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6k/DWiBejeRD6ZOzbRhQb1cp4CJb4UWtP63T4t/O2w=;
        b=j6LMnjoluUKfLiZfRWtgary2YNIsC/9IzLkJTbx5aDeMFyygEJYMAs6POUNASbTvz3
         m/5xkaH2abSTl66h8y9moQxoFaZDODcU56mRja48Ahox4bo0bTLm8PoeAnuoxqmmYW38
         qrWDZI977N0OjSFMVXkZJkCCBXjvJ/dqrZBw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702050207; x=1702655007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6k/DWiBejeRD6ZOzbRhQb1cp4CJb4UWtP63T4t/O2w=;
        b=t4lPTEIBekq4W+yVn2dQRP7swlBMqPUlAfHZ0mGl2d6JtUUwzAOjlg4azluE+YggkT
         hl+Kti8hVPWq1oZYByH/9JFVCzn5A/ET4ONMA35s73JHnok4zceRGG9aR7CaWM6XHxHN
         lKTlfXljA6kynsNrf0+h8edDOcqqTrRKVHFvCyXIty2Om2sxAQLXZcufOlZ8Z/T9NXrW
         z9ykwgvfpfkYSgOv47L3ebXk/iMM0SsatwG/bOE9UN0Kkx0/V+5vx+3nWlL+QQmlemXW
         aO/mrqMe2PxBPpqVnkup/1AGsRmKeCW2LXRt45MhtrTVVzaI0d7NCAXYoq08xIkMknZl
         Hltw==
X-Gm-Message-State: AOJu0YzvRofQ0bPx8t28/XnAE0wgqB2vRFzp5m7napBe8qZQemPP0tgy
	CO999DFalhTNRqTqJEShkeAJfvp2YE4c8raptvlAqg==
X-Google-Smtp-Source: AGHT+IHfVvFK4cARCj0Gp6958FMWmC4uVUXE03Gd8VTjCxUAoGWIWGEDXCgZWdnksWa7MK+PzG22ZIDaidUWdkdcugM=
X-Received: by 2002:a2e:94c6:0:b0:2ca:1a56:f603 with SMTP id
 r6-20020a2e94c6000000b002ca1a56f603mr69264ljh.13.1702050206853; Fri, 08 Dec
 2023 07:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
 <232da84f-08d0-4bec-9eca-0bef023dae37@citrix.com> <b0133fa8-a774-4587-a1ed-4059f97970f9@xen.org>
In-Reply-To: <b0133fa8-a774-4587-a1ed-4059f97970f9@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 8 Dec 2023 15:43:16 +0000
Message-ID: <CA+zSX=aHisr_MKEqXpe2DH9PGF=sTpqZrOQhkss623ttfRWZXg@mail.gmail.com>
Subject: Re: [PATCH] tools/pygrub: Drop compatibility symlink
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 3:36=E2=80=AFPM Julien Grall <julien@xen.org> wrote:

> See above, I think this code is under the remit of Anthony. You haven't
> CCed him so no surprise no-one answered.

Additionally, my old citrix address *was* cc'd, but I only have the
'ping', not the original email in my work mailbox.

I'm tempted to suggest adding a hack to libxl, so that /usr/bin/pygrub
automatically falls back to the libexec directory if /usr/bin/pygrub
doesn't exist.  (I'd be happy to code something up if we decided to go
that route.). OTOH, I can see the argument that 11 years and the
CHANGELOG entry is enough.

 -George

