Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18498660E26
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 12:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472965.733398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pE6uS-000850-KZ; Sat, 07 Jan 2023 10:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472965.733398; Sat, 07 Jan 2023 10:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pE6uS-000838-GC; Sat, 07 Jan 2023 10:58:44 +0000
Received: by outflank-mailman (input) for mailman id 472965;
 Sat, 07 Jan 2023 10:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s8zH=5E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pE6uQ-000832-Aq
 for xen-devel@lists.xenproject.org; Sat, 07 Jan 2023 10:58:42 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e1d6bce-8e7a-11ed-91b6-6bf2151ebd3b;
 Sat, 07 Jan 2023 11:58:40 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id qk9so8872544ejc.3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Jan 2023 02:58:40 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200f901f42a62c21174.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:f901:f42a:62c2:1174])
 by smtp.gmail.com with ESMTPSA id
 gc22-20020a1709072b1600b007c127e1511dsm1312119ejc.220.2023.01.07.02.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 02:58:39 -0800 (PST)
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
X-Inumbo-ID: 3e1d6bce-8e7a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojbJNP36CvrRWo22zSn32zK2y/pXsV+Mmkw5xGIK2Pg=;
        b=hEtdA4nME3eNcpjNgQ3F3dCNDNRy3K91tNQWFFKz8eYVdhYNamrTCdnub5/2uK22E+
         otuEYgoHszVpnjT9ZZToFJ8dMPn51ocD2GU6W1XXPFU8K1W7fdCPCVQfr5x49H1hccF5
         Zpi7ZlFeLP38+URxOL0BU6WLqVOb3aoNbhZnQLJYmldB8fDj8Uaz+0Pd2ApDbvpHbkqE
         3k4WJogU4GwnqqrjLd2PO98f2IJw9TdGJaUWtJEQykq7lt3ujr4QNbgZ70Rn+cyqeji4
         o/eX4vLZShAc+aj/A2DxCCcQIka9T3jPGFmN6I7Q9cwgwDhjA48MfPZbdF0CvnneLS8r
         H3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojbJNP36CvrRWo22zSn32zK2y/pXsV+Mmkw5xGIK2Pg=;
        b=jO3w1IFBlK/bMO2QDgTD/eT/GHzf4aOcXlpe7a9M693d2gKRDJUDQEq1JN6HHfkZum
         ZRFHU9EP9AKzswLYZK17QTBv9txH1vAYuoHl+o6Y6IxGuqaKdat5EIDU2LZo4BJnyKuK
         83TMggy26xNpa8LEpwf1f/nK9uEGY4DAZLY9lmO2tJZkMtLv+PI/mnEP58ra4YssGRN3
         1vgHStSyCGmI7PcSriU8L2K/MK12kezkccbuhM3Lp+M5iPFZRY7am7neKTV5BCXDXH6y
         QB28dRnQphrGQQ7/qxiGjWO6XBRHkmTUx/F2PInl0cPcyLCfe4rQ34vGo4uZSaVE8oXh
         QHbg==
X-Gm-Message-State: AFqh2kqRdEcNnaJWw+RBhydkpZ6bxyDLOPgDbNKLRJrN54GmyFwwZLfB
	6+JZEwhXwPI+hk/AJ46Io/I=
X-Google-Smtp-Source: AMrXdXuVhiLxEGrharK3dUjrwBfNTxBrdm5SiG2nGWJW4zBv8CB5mvtoicCvREcZjQt+b9feh78vcw==
X-Received: by 2002:a17:906:4a0c:b0:7c1:3018:73b6 with SMTP id w12-20020a1709064a0c00b007c1301873b6mr49497559eju.61.1673089119432;
        Sat, 07 Jan 2023 02:58:39 -0800 (PST)
Date: Sat, 07 Jan 2023 10:58:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/6=5D_hw/isa/piix=3A_Wire_u?= =?US-ASCII?Q?p_Xen_PCI_IRQ_handling_outside_of_PIIX3?=
In-Reply-To: <b80c0bb26d8539899f53b91deb48f748e2495d23.camel@infradead.org>
References: <20230104144437.27479-1-shentey@gmail.com> <20230104144437.27479-4-shentey@gmail.com> <b80c0bb26d8539899f53b91deb48f748e2495d23.camel@infradead.org>
Message-ID: <B71743F3-1C6A-4A18-A9A2-AEB252BE25CE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 6=2E Januar 2023 17:35:18 UTC schrieb David Woodhouse <dwmw2@infradead=
=2Eorg>:
>On Wed, 2023-01-04 at 15:44 +0100, Bernhard Beschow wrote:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (xen_enabled()) {
>
>Could this perhaps be if (xen_mode !=3D XEN_DISABLED) once we merge the
>Xen-on-KVM series?

It's the same condition which selected TYPE_PIIX3_XEN_DEVICE until the las=
t patch of this series=2E If you had to change this condition in your serie=
s then just perform the same change here instead=2E

Best regards,
Bernhard

