Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEB61F3F4F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:29:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jigBE-0003HO-Dl; Tue, 09 Jun 2020 15:28:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jigBD-0003HH-2l
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:28:47 +0000
X-Inumbo-ID: e8a401d4-aa65-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8a401d4-aa65-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 15:28:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id l17so3252882wmj.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ZN+XytTMQNoilwIrkXqaYTN41eYENGKQWZOzk7IbbiE=;
 b=J12yODvUoWb2IfQVBIE8gWEsVUMKEQTbkr2NJJN97Zx1k/yLtc1lOFZKKiUMV1rHPN
 X7pqsVjcmNfJEhstDi2gzkikDRV3cTwOQhnFSmvP56z0FZd2dsHpBNCxp1UZ9GDpNXSy
 bLMDVoz26kPVHLyfzMhDUniDvYIoh0L+yz0eZm+HjUW88B/AaPHKOS34ppfKL13kNjMr
 x1X79yBf9XsMM/l/gAnqDJx4xUTBCGmIFSU+U0+Mpnqpw/14R68c9YcfUZ476CqkRUWZ
 vdILMmRAemXhDSPkz6r9TVG9L8U4WunT6LlT7MgP7l+lQacWekLoYk3Btj0qwm8lnx4N
 rM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ZN+XytTMQNoilwIrkXqaYTN41eYENGKQWZOzk7IbbiE=;
 b=bkURgdM2boqn8WXbWv6MMKX0/JDrieUwlbg/Yu5/4EKQMn2BaqeyT3hEnGgSJUMpzI
 VAnJ3jd+dQG/OkUmaEPjyK7zenq64OB9lrMFWHxddxCjFQT9PSydLlDf8vswe8METdzk
 KiFpHPhxeiC6FAtHyze8bKCuVA9IuGTKXWMmlWIoufjMBOtCp4QRB23vHxKUP7oF8VGZ
 XMxByAKci+FSQI7PT8e1LM7RuUAmNDCgqvkhlaT5O95ixnH4brWMkorUvEKNjv+zCKsd
 lWIQQHZNyb6K81wLZ/5TRhMN6ta3gzeq3Mi8TQRFT2W2CD1N+nCwH0IaZHQASFmUHNgx
 qjyQ==
X-Gm-Message-State: AOAM531Mac9LlFCduWYaOMth7xwXZc4LSdjmDvuPG36IKKwlrc6I960x
 nPGkjqrGz48VU2/ovKjQkNk=
X-Google-Smtp-Source: ABdhPJyTr4VWZpTkym6uhNxctOGlBxAwi4HUbv43y4tyldbdTmCWc76tAvS6v6mgKMbau4n6XsiJLg==
X-Received: by 2002:a1c:5541:: with SMTP id j62mr4360417wmb.64.1591716525612; 
 Tue, 09 Jun 2020 08:28:45 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id o6sm3205771wmc.39.2020.06.09.08.28.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 08:28:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200608094619.28336-1-paul@xen.org>
 <4d63c9c7-f4e8-4c56-7778-df17b3c5254b@suse.com>
 <002a01d63d84$9c351430$d49f3c90$@xen.org>
 <86e29001-4b33-de46-0675-0107a2e2b386@suse.com>
In-Reply-To: <86e29001-4b33-de46-0675-0107a2e2b386@suse.com>
Subject: RE: [PATCH-for-4.14] ioreq: handle pending emulation racing with
 ioreq server destruction
Date: Tue, 9 Jun 2020 16:28:43 +0100
Message-ID: <00c201d63e72$a9d28bb0$fd77a310$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG4RzFDVM83uzCFIZn1YivdDmazZAHQan7RAPjCHYMCxrTPqKjf1PGw
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 09 June 2020 16:08
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Marek Marczykowski-G=C3=B3recki'
> <marmarek@invisiblethingslab.com>
> Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation racing =
with ioreq server destruction
>=20
> On 08.06.2020 13:04, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 08 June 2020 11:58
> >>
> >> On 08.06.2020 11:46, Paul Durrant wrote:
> >>> --- a/xen/arch/x86/hvm/ioreq.c
> >>> +++ b/xen/arch/x86/hvm/ioreq.c
> >>> @@ -109,15 +109,7 @@ static void hvm_io_assist(struct =
hvm_ioreq_vcpu *sv, uint64_t data)
> >>>      ioreq_t *ioreq =3D &v->arch.hvm.hvm_io.io_req;
> >>>
> >>>      if ( hvm_ioreq_needs_completion(ioreq) )
> >>> -    {
> >>> -        ioreq->state =3D STATE_IORESP_READY;
> >>>          ioreq->data =3D data;
> >>> -    }
> >>> -    else
> >>> -        ioreq->state =3D STATE_IOREQ_NONE;
> >>> -
> >>> -    msix_write_completion(v);
> >>> -    vcpu_end_shutdown_deferral(v);
> >>>
> >>>      sv->pending =3D false;
> >>>  }
> >>
> >> With this, is the function worth keeping at all?
> >
> > I did think about that, but it is called in more than one place. So,
> > in the interest of trying to make back-porting straightforward, I
> > thought it best to keep it simple.
>=20
> Fair enough, but going forward I still think it would be nice to get
> rid of the function. To do this sufficiently cleanly, the main
> question I have is: Why is hvm_wait_for_io() implemented as a loop?

I guess the idea is that it should tolerate the emulator kicking the =
event channel spuriously. I don't know whether this was the case at one =
time, but it seems reasonable to be robust against waking up from =
wait_on_xen_event_channel() before state has made it to IORESP_READY.

> Hasn't this become pointless with the XSA-262 fix? Switching this to
> a do {} while(false) construct (seeing that the only caller has
> already checked sv->pending) would look to allow moving what is now
> in hvm_io_assist() immediately past this construct, at the expense
> of a local variable holding ~0ul initially and then in the common
> case p->data.

That sounds ok. We can do that even with the current while loop by just =
setting sv->pending to false when we see state =3D=3D IORESP_READY. =
After the loop terminates then we can grab the result and set state back =
to IOREQ_NONE.

>=20
> Thoughts? (I'll be happy to make such a patch, I'm just checking
> whether I'm overlooking something crucial.)
>=20

Only that I don't think we should use do {} while(false) just in case of =
early wakeup.

  Paul

> Jan


