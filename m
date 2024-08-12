Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1B94ECEE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 14:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775457.1185667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdU5v-0007lo-SA; Mon, 12 Aug 2024 12:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775457.1185667; Mon, 12 Aug 2024 12:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdU5v-0007k9-Oz; Mon, 12 Aug 2024 12:24:15 +0000
Received: by outflank-mailman (input) for mailman id 775457;
 Mon, 12 Aug 2024 12:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPBI=PL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdU5u-0007k2-Re
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 12:24:14 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c874ff3f-58a5-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 14:24:12 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso5763516e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 05:24:12 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb08fe5dsm225141766b.3.2024.08.12.05.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 05:24:11 -0700 (PDT)
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
X-Inumbo-ID: c874ff3f-58a5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723465452; x=1724070252; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EiMNcbDrL/oKXG+2/BbSSs8YnNkAmn62VdQTdoY164=;
        b=KapjBUTAbOrW+Dz/3ByK0cLEsIYPgi2X1n0oXA005zXm61DESiT5JNWy96IT9+RP3/
         FyGHLGbzfyrEhzcO9w4hdOo1TXn/f6b+y/XehrtIePk8XI8dm1Y6ZDZlseX8oK2FrO+S
         EQ6W14+Ami55IbZCzAvCZ+SZ/2SfN0GelpsK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465452; x=1724070252;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EiMNcbDrL/oKXG+2/BbSSs8YnNkAmn62VdQTdoY164=;
        b=Q7WYN+/ilsn/yTqkWxzU0Kc+zkGT63GAV+vFfbCD4gK8o/LI33JjbE/1HxvTtUZF4b
         iSqszyHMqCj8kfc73O26y9KrT4EEISdw9bDINKmXIkWEplyNKVpF5BEQAKJG7dGYPKWQ
         Em5uQ+HKSW0PFA/27X1tb30qKTjwW2URY9POa1bsc5DRlsCvdBN7epjX24PLdDZeqfOE
         aI+oki8vZdUZcf0D3rmjYdUddlOf+9RBJ2+GP9kS4xkVPNT9Gr0X4o5mcCFLdPD1EZoA
         CTOaR1v64RweqS3kuyHLYgCdMaLi/BSrzEmime4b/kBO0MUSInamumRBH+Ba9stm0DEQ
         znew==
X-Forwarded-Encrypted: i=1; AJvYcCW6j3vCs+CDNUDs2S/KAn0MQyVoJY+QxcwihdXcgYVTss5PqfjkdqCI56mgiIL1E8XAL1+9WSlEton1iVV1edJQyKMjaDv4SqMb6rhEiQk=
X-Gm-Message-State: AOJu0YxaaBWA78WdgsGFp1md7WvemDSWPfGBMIK3LkDT4ZKtOjqS+1lD
	vsVRcPFGxNmmqhF46PRY1sDCwTh1ejYD1wSWVL9h/KZ+FriEl7dBmcNyc1rO354KVdCpDf877iu
	v
X-Google-Smtp-Source: AGHT+IGJ85U7OLxVwY1+ip45LBTIutbtmvof9lFfwCwGRGZ655E0dWxjk/XBByPiOzS9uRyrFAc7qw==
X-Received: by 2002:a05:6512:3d8a:b0:52c:8df9:2e6f with SMTP id 2adb3069b0e04-530ee9d1a39mr6541914e87.42.1723465452094;
        Mon, 12 Aug 2024 05:24:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Aug 2024 13:24:10 +0100
Message-Id: <D3DXIHMBKVC1.21P79JH7NMMG4@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Sergiy Kibrik"
 <sergiy_kibrik@epam.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com> <D3BBCS1WZ3FI.KYTC0BZLDUM9@cloud.com> <dab7d359-4433-448f-b781-03544fd4b68d@epam.com> <d449f8dc-2d59-4836-b26a-b29a83f7d6fb@suse.com>
In-Reply-To: <d449f8dc-2d59-4836-b26a-b29a83f7d6fb@suse.com>

On Mon Aug 12, 2024 at 10:58 AM BST, Jan Beulich wrote:
> On 12.08.2024 11:40, Sergiy Kibrik wrote:
> > 09.08.24 13:36, Alejandro Vallejo:
> >> On Fri Aug 9, 2024 at 11:09 AM BST, Sergiy Kibrik wrote:
> >>> --- a/xen/arch/x86/cpu/Makefile
> >>> +++ b/xen/arch/x86/cpu/Makefile
> >>> @@ -6,10 +6,10 @@ obj-y +=3D amd.o
> >>>   obj-y +=3D centaur.o
> >>>   obj-y +=3D common.o
> >>>   obj-y +=3D hygon.o
> >>> -obj-y +=3D intel.o
> >>> -obj-y +=3D intel_cacheinfo.o
> >>> +obj-$(CONFIG_INTEL) +=3D intel.o
> >>> +obj-$(CONFIG_INTEL) +=3D intel_cacheinfo.o
> >>>   obj-y +=3D mwait-idle.o
> >>> -obj-y +=3D shanghai.o
> >>> +obj-$(CONFIG_INTEL) +=3D shanghai.o
> >>
> >> Why pick this one too? It's based on VIA IP, aiui.
> >=20
> > shanghai.c and intel.c both use init_intel_cacheinfo() routine, so=20
> > there's build dependency on Intel code.

My point is that the use of Intel functions on Shanghai and not Centaur is
accidental. If shanghai goes under Intel so should Centaur (imo).

>
> Yet Shanghai isn't as directly a clone of Intel CPUs as Hygon ones are
> for AMD. So at the very least you want to justify your choice in the
> description. After all there's also the alternative of having a separate
> SHANGHAI Kconfig setting, which would merely have "select INTEL" or
> "depends on INTEL".
>
> Jan

That's one option, another is for the Kconfig options to explicitly state w=
hich
vendors they apply to. I'd be fine with either. It's less fine for CONFIG_I=
NTEL
to cover a VIA derivative and not the other.

Cheers,
Alejandro

