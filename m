Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0570A651A2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 14:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916903.1321912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAqZ-0006w3-Jr; Mon, 17 Mar 2025 13:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916903.1321912; Mon, 17 Mar 2025 13:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAqZ-0006ub-FZ; Mon, 17 Mar 2025 13:49:39 +0000
Received: by outflank-mailman (input) for mailman id 916903;
 Mon, 17 Mar 2025 13:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fdmo=WE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tuAqY-0006uT-7b
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 13:49:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa4548e4-0336-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 14:49:36 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so645166466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 06:49:36 -0700 (PDT)
Received: from localhost ([46.149.103.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149cf09dsm658420166b.121.2025.03.17.06.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:49:35 -0700 (PDT)
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
X-Inumbo-ID: aa4548e4-0336-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742219376; x=1742824176; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XjSkglSo/XiKoY74Gm243wWeX8ZXQs5Q9PG/ndvbQA=;
        b=lBCOaUN62fjxHQDlJ8gnpEsnW05wOaDV+qtdOfBe7Qh8i5y/+odJmiGQ7YahesATDS
         McEFcb7s35L6q3R70GZ4uDIvagdp6TvvuTcUybDOjdWTFJe848UH2eNPgnZV9J4Mrf9F
         3gAMGn/BB9LAt/N3E2yxvYEgaWCdL/nryxiM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742219376; x=1742824176;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XjSkglSo/XiKoY74Gm243wWeX8ZXQs5Q9PG/ndvbQA=;
        b=puMt4AUqZrjDw3uOHsPCRSP0sBtUEfXjHMIt0Dn/Qx8m/frZDc2iey5ZHu32i3l0SS
         +f+XERBAt78U0NTk6oPj8MrOlxOUGIzcxdELcOkN3fahgAdNZEdkFGSRFjuUgEFGyS4d
         xmA1WxieQ8Gb2nBEk8KoVzbW+C3DZOsarxAFn8cTyjrtY0yRN5EsMQdQp+F+Dp3vkXIt
         b1q2lswS7ud4YeFm+UOcgHFUOpLAXo/u/6M5Xvmfw7msBivOwtIF1LtCNUug8CSMuOFL
         /ayBNiLuL2RmlSES1YTpJJ+4QKq2PNzOlMHg92CFM5yTX8iMXPKFZS6YTCugUvpaSx56
         NPdw==
X-Forwarded-Encrypted: i=1; AJvYcCWRd3c6RLnQpZOzroATlv6SfFg/BcvgMHK5Uln5WRgEO/on9fuV70NRMib0NAp6kk9zPje2wZssnaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoZ9LwwhP1yMfxfjc3EYOaNXU1Oy8uyB4If5Ha1uU6xeyaxuzq
	DBXJo+nuR4rcli5sbhlPjY9sewGO6KGZk3ulkHKXtKLXk/tE0xxq/IChNcs7jnQ=
X-Gm-Gg: ASbGncsWW+Etb2Q4wIteU41QFLhqK4VZKrFMocoItBDFB4tn4B07IUHOjr9MIj3uPaW
	tdy8h+/cOGAjF3J/iT2c0voqTo/xfgtpmUyPDuqyrYnwLpSktwYxzXxIfAIKW7O72fiYdPlorJ0
	j2JImPFzQL+KIX/Kqws+HypPDr2uhKuG/CXsenaErMd2Y+/gzMFrhkhWJnbL9utwI1jJjnzknMo
	42x60NrX8ET9sQndsnLzKjahL7VbUqznC61l4rAL3Kr3RxrcSE1BHVr3p4Tcu0ffB1UEhcZYGEQ
	dNdL6kqeLQtwTxpMzwqjPNxYzT4M8/i6JPw8XSBEQ1j+JW7C/zM=
X-Google-Smtp-Source: AGHT+IFLw4mIpI1u1ubh3QL+FTtYp6/1y70y76eiszHRSttv8oQr8uXf1Mj1PkuLtK7sWjfPALA+Og==
X-Received: by 2002:a17:907:3e0b:b0:ac2:66ff:878 with SMTP id a640c23a62f3a-ac3303db225mr1405826866b.50.1742219376313;
        Mon, 17 Mar 2025 06:49:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 13:49:34 +0000
Message-Id: <D8IL83OMY1GO.36Q84NOAJ55G0@cloud.com>
Cc: "Stewart Hildebrand" <stewart.hildebrand@amd.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <D8F8IW559J11.2G40MDQH23I44@cloud.com>
 <7b4f47c2-ce03-44e9-907a-acd56e56a9ff@amd.com>
 <D8FXALVEWMGZ.2C16ABCKLKQRY@cloud.com> <Z9gWVThk_OFhlzW1@macbook.local>
In-Reply-To: <Z9gWVThk_OFhlzW1@macbook.local>

On Mon Mar 17, 2025 at 12:32 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 14, 2025 at 10:39:04AM +0000, Alejandro Vallejo wrote:
> > On Thu Mar 13, 2025 at 5:43 PM GMT, Stewart Hildebrand wrote:
> > > I think this just reinforces the need to rework the BAR mapping
> > > machinery.
> >=20
> > Right. The most delicate part is dealing with races with another vCPU w=
hen the
> > unmap-then-map operation does not complete in a single taking of the vp=
ci lock
> > I'd say. And that much is unavoidable, I think, because either unmappin=
g or
> > mapping might take a while.
>
> The original code was put together for dom0, I bet there are some
> races that can lead to incomplete p2m mappings if the domain attempts
> parallel manipulation of the BARs and memory decoding bits.  However
> there should be no case where an unexpected mfn gets mapped into the
> p2m as a result of such races.
>
> It's fine for a domain to shot it's own foot if it attempts to do
> concurrent PCI accesses to explicitly trigger races in the MMIO
> mapping handling, as long as this doesn't cause issues to other
> guests, and doesn't leak memory.
>
> Regards, Roger.

It's refcounting bugs that would scare me the most. Or something similar, l=
ike
having an expectation that a BAR is absent from a certain p2m when it's sti=
ll
present.

Cheers,
Alejandro

