Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AA79A67EA
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 14:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823470.1237473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2rMT-0000V9-Bq; Mon, 21 Oct 2024 12:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823470.1237473; Mon, 21 Oct 2024 12:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2rMT-0000Sa-8b; Mon, 21 Oct 2024 12:18:13 +0000
Received: by outflank-mailman (input) for mailman id 823470;
 Mon, 21 Oct 2024 12:18:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2rMR-0000RK-8z
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 12:18:11 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 894b6243-8fa6-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 14:18:10 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fb5be4381dso43403261fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 05:18:10 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb6692889esm1980938a12.0.2024.10.21.05.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 05:18:07 -0700 (PDT)
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
X-Inumbo-ID: 894b6243-8fa6-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729513090; x=1730117890; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfDfPZv8mcr96KheZUC8WlkeWS5ZcxKWSa0rUaFr+0k=;
        b=c8XXHBu0NkpZ+Cy1qnuPpGIW/JbKXZmzgJnybnzTGqI9CH/Q204kFeyJ8gbwF2QhtD
         BKsDb9Z7sR9p2SubuSn3enoMhWp/m5dHr/jHt2sF+Xg0zqbylZcvO/IvT2mKMldLbQ93
         RR9lLzOJK4OL5Nj6GpT96agjQWDL5QJU+Nr0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513090; x=1730117890;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfDfPZv8mcr96KheZUC8WlkeWS5ZcxKWSa0rUaFr+0k=;
        b=f5t+DLGdXNSGENRSSaBu7WalDfx5ycNKwCt/edd/zKDxjl0qACs9poH5OK/tZ3Ivtf
         71Ow2e+DD8uC1Fn5eIjs5gj1NqVW3mlv8irhJ7YRpvr+p+iG8blD2iRrOaiLwdwIePzj
         VJ06Z476vM8DKrOtnBzxqEpEzOqc4JeixyZrCmr9k39QxEZ+dHHuSPxOoCka1KpBRrVy
         Ydgz6jDjGh6XwnSwfP94HgYAo7KCvUBMlY1LhuYh4u69zt3RPAri2KlefwVqWyHC4Nqj
         lN1wdEM6IqlinBXJU91qq7SjqhGK48kLh6RF4gDuUCabdqLKHWIpOqGBxBmVvxUxt+gu
         /cdg==
X-Forwarded-Encrypted: i=1; AJvYcCXLn1+vBbxchF5wCgXRkFQ249ZBaPk+jXuXPHgZg1yjHj9sTXvt4pXgU874aMuTQfgRn6pjVw9cjLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyD7Ch1TIKbsOaxoGAQlxSCgeJex/64aui0cpyNFLUyebh6mweh
	9xAllnTDQ2oqJCFga4zfdKtSmjc/vJDKcXRVnGKQCdYPMeJxa8TkR/jw+9nylgA=
X-Google-Smtp-Source: AGHT+IE6zYIp2+IK4SKzEBAQdiuhwHR9+Ljfnw2m9CF9IbkYYfyWcOXMNHGB/vN61aGxetU28XmAGQ==
X-Received: by 2002:a2e:bc03:0:b0:2fb:5168:1a0c with SMTP id 38308e7fff4ca-2fb82eb03eamr48750511fa.19.1729513088169;
        Mon, 21 Oct 2024 05:18:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 13:18:06 +0100
Message-Id: <D51H7ZKHDY49.1NG4YOYCBIX96@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Willi Junga" <xenproject@ymy.be>
Subject: Re:  [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "David Woodhouse" <dwmw2@infradead.org>, "Roger Pau Monne"
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <D51E73OWU4LY.3GIECD0KR4UW@cloud.com>
 <52c88b22daeb3740402f478ca393e07d84c87731.camel@infradead.org>
In-Reply-To: <52c88b22daeb3740402f478ca393e07d84c87731.camel@infradead.org>

On Mon Oct 21, 2024 at 12:32 PM BST, David Woodhouse wrote:
> On Mon, 2024-10-21 at 10:55 +0100, Alejandro Vallejo wrote:
> > On Fri Oct 18, 2024 at 9:08 AM BST, Roger Pau Monne wrote:
> > > When using AMD-VI interrupt remapping the vector field in the IO-APIC=
 RTE is
> > > repurposed to contain part of the offset into the remapping table.=C2=
=A0 Previous to
> >=20
> > For my own education....
>
> Careful what you wish for.
>
> http://david.woodhou.se/more-than-you-ever-wanted-to-know-about-x86-msis.=
txt

I had seen it before, but then neglected to give it the attentive read it v=
ery
much deserves. Let me correct that, thanks.

Cheers,
Alejandro

