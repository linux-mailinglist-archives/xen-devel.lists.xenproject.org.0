Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C191A2DD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749885.1158116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlg9-00058Z-9u; Thu, 27 Jun 2024 09:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749885.1158116; Thu, 27 Jun 2024 09:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlg9-00055R-79; Thu, 27 Jun 2024 09:44:33 +0000
Received: by outflank-mailman (input) for mailman id 749885;
 Thu, 27 Jun 2024 09:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMlg7-00055G-Fz
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:44:31 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d96655b2-3469-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 11:44:29 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a72988749f0so103011466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 02:44:29 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca1f5sm41986566b.218.2024.06.27.02.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 02:44:28 -0700 (PDT)
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
X-Inumbo-ID: d96655b2-3469-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719481469; x=1720086269; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L1DgNbcw3XA82bPbWLtfB7xphk4jpI2wPVlVr/JOifg=;
        b=lUwYliPZQlYVC1QrLP/izoC4go4dPTSqOAHsQiAaI3VhyybcYYWPnRmNQbF31F54M8
         tZqjjXYB/BAETtrXLWL+9tfcQzbt+CU4VGJ2gFKRSYEvvwBwK0Bmtept32JQCXMA0HVO
         OVYoNdy3GlQEx8RbIoPq1F5CHWZ76eEFmG4M5Sh/oaQ9zXtPW/rmAn0khexoJKYj1HDD
         RIeABWHlpTBs5V7fnTOuz+Q7gddl8I54s2/FRGJQ/0t5q/vx6sU85mYKuyxkmQvDZbtW
         Gmts4iNGi3SUXHNrAQN6c8h6cnwHUjtahEMv+qiVB6SxQIYWhlPPgmtoTs6xFsA5zUll
         LpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719481469; x=1720086269;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L1DgNbcw3XA82bPbWLtfB7xphk4jpI2wPVlVr/JOifg=;
        b=jpY3bESI/wVl6axqsz5L7TR+Yry4MgGhTsD8IT+70xlw2mSw4GfnOSZx/M9/vH0onc
         VjyuswLhQSZrIbYWbuogDRZkQ+hJZ5TqQPUi94JPmXGC41sOH/ybCnlR9vaBTXh8Cygl
         sfmNq/lFQFxhLEmXH0iJuXlP411afp6MDNC5uigOP/+VvYg3w/diM5zE7a2kU0D3YnvR
         GiK1O/bQYodOT6woXmDNRV0/ZDNaRgZ9qG3Cbj/CM/Qycomae3s9x3bkxpayG5Ya/rdf
         8bY/ziqG6IaBcllee9GtNz1Yk4CyyZ68dsYeR5YFw1qYqSyqr/o2eK3QLDzqj4jbtHJI
         FE1A==
X-Gm-Message-State: AOJu0Yxj43iwcYrqzjVWJPTWoD6AiEeXTvB2lwpvJ0m4GfbUaGBJ0KM3
	og0Z0K0w2HgLNwDhIRtyiTrsi4nDl2f0AQr9zRWMxgzH7radqMNp
X-Google-Smtp-Source: AGHT+IGroLt2qeY7Uqodmm6jI60q7Vaaf5NfZVtq1GQGEgQLYrOzg/YVxpJaZQo+3yHHNN4KZXCtXw==
X-Received: by 2002:a17:906:bf4a:b0:a72:5bb9:b13e with SMTP id a640c23a62f3a-a725bb9b2a7mr754788266b.30.1719481468852;
        Thu, 27 Jun 2024 02:44:28 -0700 (PDT)
Message-ID: <1932c346492372cc9ffe633774b412d719e662be.camel@gmail.com>
Subject: Re: [XEN PATCH v2 0/6][RESEND] address violations of MISRA C Rule
 20.7
From: oleksii.kurochko@gmail.com
To: Stefano Stabellini <sstabellini@kernel.org>, Nicola Vetrini
	 <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com,  Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Date: Thu, 27 Jun 2024 11:44:27 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
	 <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 17:47 -0700, Stefano Stabellini wrote:
> Hi Oleksii,
>=20
> I would like to ask for a release-ack as the patch series makes very
> few
> changes outside of the static analysis configuration. The few changes
> to
> the Xen code are very limited, straightforward and makes the code
> better, see patch #3 and #5.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
>=20
> On Mon, 17 Jun 2024, Nicola Vetrini wrote:
> > Hi all,
> >=20
> > this series addresses several violations of Rule 20.7, as well as a
> > small fix to the ECLAIR integration scripts that do not influence
> > the current behaviour, but were mistakenly part of the upstream
> > configuration.
> >=20
> > Note that by applying this series the rule has a few leftover
> > violations.
> > Most of those are in x86 code in xen/arch/x86/include/asm/msi.h .
> > I did send a patch [1] to deal with those, limited only to
> > addressing the MISRA
> > violations, but in the end it was dropped in favour of a more
> > general cleanup of
> > the file upon agreement, so this is why those changes are not
> > included here.
> >=20
> > [1]
> > https://lore.kernel.org/xen-devel/2f2c865f20d0296e623f1d65bed25c083f5dd=
497.1711700095.git.nicola.vetrini@bugseng.com/
> >=20
> > Changes in v2:
> > - refactor patch 4 to deviate the pattern, instead of fixing the
> > violations
> > - The series has been resent because I forgot to properly Cc the
> > mailing list
> >=20
> > Nicola Vetrini (6):
> > =C2=A0 automation/eclair: address violations of MISRA C Rule 20.7
> > =C2=A0 xen/self-tests: address violations of MISRA rule 20.7
> > =C2=A0 xen/guest_access: address violations of MISRA rule 20.7
> > =C2=A0 automation/eclair_analysis: address violations of MISRA C Rule
> > 20.7
> > =C2=A0 x86/irq: address violations of MISRA C Rule 20.7
> > =C2=A0 automation/eclair_analysis: clean ECLAIR configuration scripts
> >=20
> > =C2=A0automation/eclair_analysis/ECLAIR/analyze.sh=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +--
> > =C2=A0automation/eclair_analysis/ECLAIR/deviations.ecl | 14
> > ++++++++++++--
> > =C2=A0docs/misra/deviations.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > =C2=A0xen/include/xen/guest_access.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++--
> > =C2=A0xen/include/xen/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0xen/include/xen/self-tests.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++++----
> > =C2=A06 files changed, 22 insertions(+), 12 deletions(-)
> >=20
> > --=20
> > 2.34.1
> >=20


