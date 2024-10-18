Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF189A3DDD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821802.1235759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lm1-0007Gf-F4; Fri, 18 Oct 2024 12:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821802.1235759; Fri, 18 Oct 2024 12:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lm1-0007E7-CH; Fri, 18 Oct 2024 12:08:05 +0000
Received: by outflank-mailman (input) for mailman id 821802;
 Fri, 18 Oct 2024 12:08:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1llz-0007Dy-EN
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:08:03 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e99ad7f-8d49-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 14:08:01 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5e7ae4c504fso956680eaf.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 05:08:01 -0700 (PDT)
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
X-Inumbo-ID: 9e99ad7f-8d49-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729253280; x=1729858080; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvAMSRAXf52OhK2pXnM8sxQusYSpTiA7W9Pocse7Ssg=;
        b=Oi266v6pT1AbKSl/l0lErs1ENrsJ/IGJSr3LMuvTSuW84OPz4UanbwdUf5s9xGRa1U
         WV3P6VfPF4De+ZJ/0K4Nm2DVwsoYnGX1NUGfzkuCXljsCx5DpDIKfO9NHFVsOvurB14Z
         JExqUCIRigSPSAqJ9+OUMh7XOC9NqgIEDZEgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253280; x=1729858080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvAMSRAXf52OhK2pXnM8sxQusYSpTiA7W9Pocse7Ssg=;
        b=DkfdMhfNUFy179YlkR35xfhB+1HOpTm360fyjKcSch+TemzK/tenmv/L3RHLuF9r9I
         H6l5CWNJoCjFuPfJttyv8i3RO8HryIY630HMrnbDM+IHB49Fny402SO6Xvg7p7A5GZO8
         GO3dRDZmD331VZtuLJKBkMw/QDKPXb4uyaG1StVj6X/9BmJ2fTsphnqXCOnSQ6gI4luZ
         SFnaGyKRS88pUl6s6g17QuBAEDpM1a95NVGGzojQ6W3VxJRwqwEWCRB5FM+ybg6cg3/W
         q22W50AY1HTbzhrUwj+dsN27k3ENcjUSbfl098p0ks/lGFOPL/wW8bPZet5xNfy7wV2r
         NlMg==
X-Gm-Message-State: AOJu0Yw6t0uesAntxsYRvXMEuhIsjZCPYGJvv8Vu1OsAkQW90JGvcV9+
	g7zeNRfZpriQRgT8mjpG0k9xccoVrsJDXfbjQeIVndVyxEtSSptgxmKbUcGdPXd3JHGxPGxeTM6
	eJzJ/34+vfGkvsOV4dufWhbgwcOukcmtLdB8OjSUj+QEYQ9LU
X-Google-Smtp-Source: AGHT+IGCkpiUr6EpXMkkG2wMUGJ3xuqq7DGD52xqlF3G/FF3TnBVLUCdXmbTNUU4TVxA6atj5ONwuUsZLKosI1hqT88=
X-Received: by 2002:a05:6820:c91:b0:5eb:6c26:1ca0 with SMTP id
 006d021491bc7-5eb8b3a4b8amr1621266eaf.1.1729253279836; Fri, 18 Oct 2024
 05:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240926095133.483619-1-frediano.ziglio@cloud.com> <CACHz=ZgwcejTF0Yz5vchVy18Hn15LYp_R8Y1LqOA=qAHK-HRiA@mail.gmail.com>
In-Reply-To: <CACHz=ZgwcejTF0Yz5vchVy18Hn15LYp_R8Y1LqOA=qAHK-HRiA@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 13:07:48 +0100
Message-ID: <CACHz=Zh9r7xFSsq3vxdBfss1ozJC1neoTFs4Dvpw+xeQiUFTsg@mail.gmail.com>
Subject: Re: [PATCH] Update deprecated SPDX license identifiers
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	Paul Durrant <paul@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
	George Dunlap <gwd@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 9:08=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Thu, Sep 26, 2024 at 10:51=E2=80=AFAM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
> >
> > As specified in LICENSES/GPL-2.0:
> > - GPL-2.0 -> GPL-2.0-only;
> > - GPL-2.0+ -> GPL-2.0-or-later.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> ping
>

ping

Frediano

