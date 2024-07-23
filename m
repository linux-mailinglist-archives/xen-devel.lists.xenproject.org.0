Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1504939E14
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762919.1173153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBzj-0008LI-DW; Tue, 23 Jul 2024 09:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762919.1173153; Tue, 23 Jul 2024 09:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBzj-0008Ib-AT; Tue, 23 Jul 2024 09:39:43 +0000
Received: by outflank-mailman (input) for mailman id 762919;
 Tue, 23 Jul 2024 09:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KExd=OX=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sWBzi-0008IS-Ez
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:39:42 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c5f74b2-48d7-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 11:39:41 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef32fea28dso18636221fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:39:41 -0700 (PDT)
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
X-Inumbo-ID: 7c5f74b2-48d7-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721727581; x=1722332381; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6l7kRSoJUjHzdPQiYd/ht/e7MUtQ6tGdub3AxnaR+M=;
        b=foxeOTWxkKeJbnQZrNYRWY2N3Z+68id4FTeuS1Qpl4J5n+IpDdwez04cmEHq6n5TCH
         A47IEL8DPt9rOZ80m8UMEbwLJrtQJRjNxMU71t82SW5FlVJaSxfsrzDOnmPFRMYz1m8f
         8wCwKVS+/h/0dCVRDJ7HRcGD/mwxiah4Lihx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721727581; x=1722332381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6l7kRSoJUjHzdPQiYd/ht/e7MUtQ6tGdub3AxnaR+M=;
        b=MwWz15+6lyOi+lI3ugfvo0hlJsZwR0TxOp83T0eVpG+TNWMspQn88S2BK0p4fD2qzx
         KiPs8KySki+5DFQ/LYk9rqvlFbIbAd99dT+3mK8aMYR++wzW1PhYTuEH7jaO9HVUOa6/
         mrtp3TS1sNc4glgX6skeSDscta8s/lDg9J1jJU+fE4Hi+c2XPVc4maTWfYzVNrrC9j8p
         WGTl1e4rHzLBl//VmYwxfnCtNzkje/Ajwl5MazdEGxCSMaRFU6w+ojfz0UFi5LvX2BfX
         tQFfjxZG2y0FZvbCjQ4b4uOZKjPA4BOE8S89fzEksvDvEu7DWjaC43d4DDsnufWEbbk+
         9GUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/2TfoRKRwZjulLu4/LkI3GQD1QHOyuWrItLdmFNgfd0b38JgO8V3AFSfk7zuYFRtLQfSHJmUDNo6KaMaaONFUrsOoquPhEaIzhwsJcKs=
X-Gm-Message-State: AOJu0YzfYb8jLRjPoZerSIChoMAli2Or/W1j+03eFGgHpGw7SUDkkDqC
	0vvon0n4H3cO9Lscfj8p0y87qgCk82gF4e4NqB9+H3nkRf2Q8D6ZscNXm7hz+fhRly3alEp7OER
	kmpmH/L3f7d71/td1usxFCVyLVHNZ2Gt7gyDaYQ==
X-Google-Smtp-Source: AGHT+IFzfTp5JokiVx1N/dJq9A9GuJy+wJZONP4I4D14D35rUj8m9tG74zjcHMEt5LKzNGSgGe7BhC3do3bmn2b+tQY=
X-Received: by 2002:a2e:7a0c:0:b0:2ef:281f:ba60 with SMTP id
 38308e7fff4ca-2f01ea5e484mr16420281fa.20.1721727580562; Tue, 23 Jul 2024
 02:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
 <20240712130749.1272741-4-fouad.hilly@cloud.com> <c4157096-cfc6-4455-a5f4-c2af94591284@suse.com>
In-Reply-To: <c4157096-cfc6-4455-a5f4-c2af94591284@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Jul 2024 10:39:29 +0100
Message-ID: <CAJKAvHb-jtoB3APfS940FcgzUm9JhNR=Gg-QMLxS-YOaQyeL_w@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] x86/ucode: Introduce --force option to xen-ucode
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 2:27=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.07.2024 15:07, Fouad Hilly wrote:
> > @@ -79,6 +81,8 @@ static void usage(FILE *stream, const char *name)
> >              "options:\n"
> >              "  -h, --help            display this help\n"
> >              "  -s, --show-cpu-info   show CPU information\n"
> > +            "  -f, --force           skip certain checks; do not use u=
nless you"
> > +            "know exactly what you are doing\n"
>
> Would this output line perhaps better be wrapped explicitly, to avoid
> odd wrapping effects on terminals not wider than 80 chars? In any event
> there's a blank missing at the present source wrapping point.
Sure, I will wrap it in v6
>
> Jan

Thanks,

Fouad

