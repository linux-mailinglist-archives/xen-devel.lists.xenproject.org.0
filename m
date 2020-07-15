Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8A220D4A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgoo-00069Y-F8; Wed, 15 Jul 2020 12:47:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlgd=A2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jvgom-00069S-MQ
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:47:24 +0000
X-Inumbo-ID: 54532aa0-c699-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54532aa0-c699-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 12:47:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s10so2469845wrw.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=jd6m2q6vOnBbmSoWegGfAYIc9ZfcnWxkCBUtaO9NLGM=;
 b=FDJhsQOfJTOFIM16Km2rKodkYgOXe3gmOGmAp+yR4ytOgoO60ia7ClRxC6KvpdcSZc
 qpf6z3wVC9G8oDX50aGH/lKaB5OHd17BcmQFb759YCV7HGCEY9l7v4KcRXyXXNzD1p43
 MHWXAb1juzHL0JY90yiFgKUNFWnUdULiiR5iKez73vN2q9sEIxNQ6gc8CqJOyNJXTKO6
 dR/VPpSQ6hpsZNfxsCbZNw+LkbmB5/EyssyAaHvjO4dNM61H37UddRdl+mEBze5CMnQt
 AvBZ5lSjGrQWQJW7r/AxcsS1HneY4ACK3CzyfDk+yUHnS9BW+VWoHb1qb56Zdi04xSQ/
 8VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=jd6m2q6vOnBbmSoWegGfAYIc9ZfcnWxkCBUtaO9NLGM=;
 b=BT4DB8zU39R6sAHmNnwMGej8N83/vLpsCsutpzZefYNEf+zFmGKCpx8+p7O6Y//oai
 8CBw/0n0NV+QpSTQyAW20lP0IHan8Zdt+kqYpmL22b3YcyHP3juIsgjqQVwiLmht0Xlz
 A1NHnWPXPxeEpIcHuaE6Jx+JBYNw55Vlr1jd9gXzl6jUR0Q3CJ1BjsaxwpTnYb8EbVnn
 uWKrPqLbFb3W5LCA7x7Tf6HXfq0VJAuI2v4BpzxWA7XBwSHGQ+ICbVDj5iFonk1xbore
 nYfhK7FJO6cQyxcqD4NceXu/S/D21EXcucKC83Uv5CKyB0G4eK1Z5kEF3+gQyFglaDx4
 ymMg==
X-Gm-Message-State: AOAM531huzy/UsiRIDwCbk9OJNalfoKn3jOQtv8RUpi7kyFPW366qLlB
 eA/gF9qPB3BCjrc5y/d8PPg=
X-Google-Smtp-Source: ABdhPJw+cT/sbT7KdwQNMFxiOcBSRoLjeEn/IY1LmgdRTPcfsuReM6+22yFMugUHa67AnleGPNm09g==
X-Received: by 2002:a05:6000:11cc:: with SMTP id
 i12mr11072680wrx.224.1594817243165; 
 Wed, 15 Jul 2020 05:47:23 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id c7sm3517527wrq.58.2020.07.15.05.47.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jul 2020 05:47:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
 <872c2d16-f49a-41fd-68ae-f1e0ee14c7d8@suse.com>
In-Reply-To: <872c2d16-f49a-41fd-68ae-f1e0ee14c7d8@suse.com>
Subject: RE: [PATCH 2/3] x86/HVM: re-work hvm_wait_for_io() a little
Date: Wed, 15 Jul 2020 13:47:21 +0100
Message-ID: <001b01d65aa6$15710e10$40532a30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKAf3+muaXr7mwqqHZG6k9bSD0TwwHovSMLp6UFpSA=
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 15 July 2020 13:04
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu
> <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH 2/3] x86/HVM: re-work hvm_wait_for_io() a little
>=20
> Convert the function's main loop to a more ordinary one, without goto
> and without initial steps not needing to be inside a loop at all.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -106,24 +106,17 @@ bool hvm_io_pending(struct vcpu *v)
>  static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>  {
>      unsigned int prev_state =3D STATE_IOREQ_NONE;
> +    unsigned int state =3D p->state;
>      uint64_t data =3D ~0;
>=20
> -    do {
> -        unsigned int state =3D p->state;


Oh, you lose the loop here anyway so the conversion in patch #1 was only =
transient.

> -
> -        smp_rmb();
> -
> -    recheck:
> -        if ( unlikely(state =3D=3D STATE_IOREQ_NONE) )
> -        {
> -            /*
> -             * The only reason we should see this case is when an
> -             * emulator is dying and it races with an I/O being
> -             * requested.
> -             */
> -            break;
> -        }
> +    smp_rmb();
>=20
> +    /*
> +     * The only reason we should see this condition be false is when =
an
> +     * emulator dying races with I/O being requested.
> +     */
> +    while ( likely(state !=3D STATE_IOREQ_NONE) )
> +    {
>          if ( unlikely(state < prev_state) )
>          {
>              gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition %u =
-> %u\n",
> @@ -139,20 +132,24 @@ static bool hvm_wait_for_io(struct hvm_i
>              p->state =3D STATE_IOREQ_NONE;
>              data =3D p->data;
>              break;
> +

Possibly mention the style fix-up in the comment comment.

>          case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> =
IORESP_READY */
>          case STATE_IOREQ_INPROCESS:
>              wait_on_xen_event_channel(sv->ioreq_evtchn,
>                                        ({ state =3D p->state;
>                                           smp_rmb();
>                                           state !=3D prev_state; }));
> -            goto recheck;
> +            continue;
> +

You could just break out of the switch now, I guess. Anyway...

Reviewed-by: Paul Durrant <paul@xen.org>

>          default:
>              gdprintk(XENLOG_ERR, "Weird HVM iorequest state %u\n", =
state);
>              sv->pending =3D false;
>              domain_crash(sv->vcpu->domain);
>              return false; /* bail */
>          }
> -    } while ( false );
> +
> +        break;
> +    }
>=20
>      p =3D &sv->vcpu->arch.hvm.hvm_io.io_req;
>      if ( hvm_ioreq_needs_completion(p) )



