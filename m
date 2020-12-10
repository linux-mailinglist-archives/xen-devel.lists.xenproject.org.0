Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6A2D5EB7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49395.87350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNMG-0007ZW-Ja; Thu, 10 Dec 2020 14:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49395.87350; Thu, 10 Dec 2020 14:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNMG-0007Z7-FL; Thu, 10 Dec 2020 14:55:52 +0000
Received: by outflank-mailman (input) for mailman id 49395;
 Thu, 10 Dec 2020 14:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sk2J=FO=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1knNMF-0007Z2-6k
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:55:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d87aaf62-12bf-4c04-9b8d-ae5bf7e756ca;
 Thu, 10 Dec 2020 14:55:50 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373--i1cTrN8Pvm7rMlPzp9C-w-1; Thu, 10 Dec 2020 09:55:47 -0500
Received: by mail-io1-f69.google.com with SMTP id 191so4064243iob.15
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:55:47 -0800 (PST)
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
X-Inumbo-ID: d87aaf62-12bf-4c04-9b8d-ae5bf7e756ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607612150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBanhr1fgvfj3a2tbMQ3LSwkRYdL35LLpMiBdo5ibtY=;
	b=WxYd5U4Ff9tE+E073+5PX/y7CjGTSGkqQa/MJomiVGWC38tyMk6VW017HxFiHyxCbNC9S3
	hk9ce+yqIT5If6L1C9lb1q9XfeWATuudf99kFuoAJ5DCl++ooRzYY1YzpNJXc17+cy05sa
	RH24YMveAp+nb6CDbrQhna7iJTXBMbY=
X-MC-Unique: -i1cTrN8Pvm7rMlPzp9C-w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mBanhr1fgvfj3a2tbMQ3LSwkRYdL35LLpMiBdo5ibtY=;
        b=OL3Lk2jWFmfP6tg9RXBjRCPjhX0rbfWtWaeC2Td1saQkYLlYRtw3HhyjO9HHtF7ii2
         YxehZ4IqbMlHdmyCrII6fRLzYvqN5ScxJh/qMKColxpwVz0vuzQNTSS3fuZSREvD/MPt
         4apaBkMD61ZX5qk08Et0rPOHXoquRcwciHpocT/VhHCznr3Bs8w41dpoZ7PrxLMwtBXo
         WEOnC9cfddWBmKaXBUWkeG/8RyT1ZCKuN1dVjF2bgDqImyWJfom5f1urA3DfDXk/i/sq
         e+b8kc0a5SQa5jbHh2DEysqa6Auqz1f3eHgkbqfX1MxTefee42a89A8fgC4wt/bwjFrE
         a+7Q==
X-Gm-Message-State: AOAM533J5kTt706zKQMjkkSdk0DiTd1OrVBN3kYNLpQZttyEk3JPiEAI
	qXW9hHleu8yOELMJAD7Ks5+zkT3UrLlD2PylieH1zdi4JFpi53ykdAwOQY2+mml24NOaCOnBKLS
	EDfkYLH7L0uiZ7G/UyAOWhxMmIRexFqAmWYKdHI815t0=
X-Received: by 2002:a6b:b5d2:: with SMTP id e201mr5227602iof.111.1607612146609;
        Thu, 10 Dec 2020 06:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+s9DW2PJte84KZQqjMa29hIrqXHSO4YD2VzYLlS+k4pC7kfrBaKl4ag4krI7jL31ahzBUBxRx9ZK+JFg018M=
X-Received: by 2002:a6b:b5d2:: with SMTP id e201mr5227589iof.111.1607612146364;
 Thu, 10 Dec 2020 06:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com> <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
 <CAFEAcA986crbUmJLR2GU5PE9BOq8w9KWKA5obYfY3eSoviMtnw@mail.gmail.com>
In-Reply-To: <CAFEAcA986crbUmJLR2GU5PE9BOq8w9KWKA5obYfY3eSoviMtnw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 10 Dec 2020 18:55:35 +0400
Message-ID: <CAMxuvawzN0oOJJhqHu4dX++O+fAdA8BQ0+yNgoQHf_dL5=rVow@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect fallback
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 10, 2020 at 6:47 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 10 Dec 2020 at 14:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
> >
> > On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> > > version"), QEMU explicitely depends on GCC >=3D 4.8.
> > >
> > > (clang >=3D 3.4 advertizes itself as GCC >=3D 4.2 compatible and supp=
orts
> > > __builtin_expect too)
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> > Shouldn't it becleaner to test in the configure script or Meson that
> > likely() and unlikely() are not defined, and define them here
> > unconditionally?
>
> That sounds like way more infrastructure than we need if
> just checking "is it already defined" is sufficient...
>

Eh, I am just removing dead-code "#if __GNUC__ < 3". Further cleanups
can be done after.


