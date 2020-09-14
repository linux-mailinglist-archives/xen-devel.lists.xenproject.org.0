Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20121268554
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHiWP-0007Z5-OT; Mon, 14 Sep 2020 07:03:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePln=CX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kHiWN-0007Yz-Ob
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 07:03:27 +0000
X-Inumbo-ID: aa37f92d-8e75-4732-aa43-e584abe3a5a8
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa37f92d-8e75-4732-aa43-e584abe3a5a8;
 Mon, 14 Sep 2020 07:03:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y15so10073970wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=S8LVNUrW/wqfH6wn5gRl4ShdNtSTKdik/mZ8bZKLrFA=;
 b=a9FM9I/o7Kj5bNO+ELlETAVscUdd5nRq3V1pTw6wZWn8yYG3qlMWJDFII0q35NLchI
 6TvkxTVVqDsxPm7bDMAUl/gqUJ9Pgju8T8IieoNQCIxYDUZ/inO5+YW3yTUiuw5kf2Jz
 sByMseYjIRaOK+GA1k6qOS+HJAi4TePTK4IPcCK9DY1+cRNgLN51V8lk2UBhME8f6MuR
 6rD7wDffjgCgXKPd+/QVfQbZP/5OHuGovFEQTvIZOGXt9IJnLR5D/1bcPnywkEOyBdxV
 4jin8bgK51TWlG4zNWZvhSIaShIvqTtgef9FfmjkNdQGOaW5/+mkLF00F1TTfa7Wlk3Y
 SdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=S8LVNUrW/wqfH6wn5gRl4ShdNtSTKdik/mZ8bZKLrFA=;
 b=FSmPW1idSEpHrFGJ0c5jl/V2zDExljZ8xfze3KaAi24tIF8fTf5lvI6BXLVxq8AaGn
 DgWQEeSN1HspMEAT6qad4YXKzmAZJApsSfh74+dTx96KWhtAaLRrw4e0vrz1eZT8s/t+
 9mwcfhsbVJ3RLtZQ7u4iq9rFMBfIECfTqeTSZeQ2ejvBiuLjKLlpvB6zi3YaWeHyFyKD
 8DpACUGGF4PjL0p6YRqN/+tOYqwA3HQ6yJO4C6ndQuctj8yBPVFioQGfN/1HJY9qQW/S
 rw9GhD1vav4rPRpX0YbJ4hbhgg4NivHdCQ1siuUk32R0Uvu8HEAd5FFD1m4Yg+fQrc5t
 +kcw==
X-Gm-Message-State: AOAM533dFW1vJRXx+Ztj+TdBI5wlGnljL+aVPPpphzGLgwM3RQ/44l4G
 NpAr3mkNSQxArUgwyHvs1h0=
X-Google-Smtp-Source: ABdhPJwZhDVW7uiqtpTgqI/r3sziwH9TeYGhdIi32jyCU9+lJRvenar/6xMej7bw4wS8dUn/JsNnJQ==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr13398442wme.136.1600066996408; 
 Mon, 14 Sep 2020 00:03:16 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id d5sm19989313wrb.28.2020.09.14.00.03.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Sep 2020 00:03:15 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>,
 <committers@xenproject.org>
Cc: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Bertrand Marquis'" <Bertrand.Marquis@arm.com>
References: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
In-Reply-To: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
Subject: RE: Adopting the Linux Kernel Memory Model in Xen?
Date: Mon, 14 Sep 2020 07:59:37 +0100
Message-ID: <000101d68a64$9c7ba580$d572f080$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJCSvoMa3CM1riyjMgcUs75aGJDUKiQLdJg
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Julien Grall
> Sent: 11 September 2020 17:34
> To: xen-devel@lists.xenproject.org; committers@xenproject.org
> Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Bertrand Marquis =
<Bertrand.Marquis@arm.com>
> Subject: Adopting the Linux Kernel Memory Model in Xen?
>=20
> Hi all,
>=20
> At the moment, Xen doesn't have a formal memory model. Instead, we are
> relying on intuitions. This can lead to heated discussion on what can =
a
> processor/compiler do or not.
>=20

...which, in turn, may well lead us into decisions that harm =
performance.

> We also have some helpers that nearly do the same (such as
> {read,write}_atomic() vs ACCESS_ONCE()) with no clear understanding
> where to use which.
>=20
> In the past few years, Linux community spent a lot of time to write =
down
> their memory model and make the compiler communities aware of it (see
> [1], [2]).
>=20
> There are a few reasons I can see for adopting LKMM:
>     - Xen borrows a fair amount of code from Linux;

...and essentially the same toolchain(s)

>     - There are efforts to standardize it;
>     - This will allow us to streamline the discussion.
>=20
> Any thoughts?
>=20

It seems like a very good idea to me.

  Paul

> Cheers,
>=20
> [1] https://www.kernel.org/doc/Documentation/memory-barriers.txt
> [2] =
http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p0124r7.html
>=20
>=20
> --
> Julien Grall



