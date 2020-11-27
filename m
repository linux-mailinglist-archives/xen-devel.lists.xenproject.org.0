Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE962C6761
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39431.72344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieNh-0004xv-7s; Fri, 27 Nov 2020 14:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39431.72344; Fri, 27 Nov 2020 14:05:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieNh-0004xW-4K; Fri, 27 Nov 2020 14:05:49 +0000
Received: by outflank-mailman (input) for mailman id 39431;
 Fri, 27 Nov 2020 14:05:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kieNf-0004xQ-SS
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:05:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7a4b55b-64f4-4b09-8cb1-95f40c708522;
 Fri, 27 Nov 2020 14:05:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 180CEAC23;
 Fri, 27 Nov 2020 14:05:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kieNf-0004xQ-SS
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:05:47 +0000
X-Inumbo-ID: c7a4b55b-64f4-4b09-8cb1-95f40c708522
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c7a4b55b-64f4-4b09-8cb1-95f40c708522;
	Fri, 27 Nov 2020 14:05:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606485945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F4mKkKoFhIJuLeKHSD4f3NCIeDTQLMr0Zld8Bpz2Vgo=;
	b=CyfmLBFjHuTzcdsF0HszQzr4SEgXrPNJzQl18RhZy58cmQCFyVAInlVQgR7UfVftoH3sB2
	JvBwYRUBkb80AXlJx01hY8fPxhwn0Sldm9jX1O3GxCp6FOE8XyRC4rZkfZYR1fnwIrlVg+
	b6Y4/Nem5WDkwRyiIL7VJajuihFuCLA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 180CEAC23;
	Fri, 27 Nov 2020 14:05:45 +0000 (UTC)
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2b099865-647c-3d47-1510-d429c2a4b6c6@suse.com>
Date: Fri, 27 Nov 2020 15:05:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DSS8JncNRbdqIiwdljUiftaRGKDT9sd1l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DSS8JncNRbdqIiwdljUiftaRGKDT9sd1l
Content-Type: multipart/mixed; boundary="8NFTV2bdLPgudmR2d3Px2BdjffeuoG9Cx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <2b099865-647c-3d47-1510-d429c2a4b6c6@suse.com>
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
In-Reply-To: <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>

--8NFTV2bdLPgudmR2d3Px2BdjffeuoG9Cx
Content-Type: multipart/mixed;
 boundary="------------38CF97E019B7DCFB33182E2E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------38CF97E019B7DCFB33182E2E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.11.20 14:58, Julien Grall wrote:
> Hi Juergen,
>=20
> On 25/11/2020 10:51, Juergen Gross wrote:
>> -static struct evtchn_fifo_queue *lock_old_queue(const struct domain *=
d,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ev=
tchn *evtchn,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned =
long *flags)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct vcpu *v;
>> -=C2=A0=C2=A0=C2=A0 struct evtchn_fifo_queue *q, *old_q;
>> -=C2=A0=C2=A0=C2=A0 unsigned int try;
>> -=C2=A0=C2=A0=C2=A0 union evtchn_fifo_lastq lastq;
>> -
>> -=C2=A0=C2=A0=C2=A0 for ( try =3D 0; try < 3; try++ )
>> -=C2=A0=C2=A0=C2=A0 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lastq.raw =3D read_atomic(=
&evtchn->fifo_lastq);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v =3D d->vcpu[lastq.last_v=
cpu_id];
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old_q =3D &v->evtchn_fifo-=
>queue[lastq.last_priority];
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&old_q->=
lock, *flags);
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v =3D d->vcpu[lastq.last_v=
cpu_id];
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q =3D &v->evtchn_fifo->que=
ue[lastq.last_priority];
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( old_q =3D=3D q )
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn old_q;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&ol=
d_q->lock, *flags);
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 gprintk(XENLOG_WARNING,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "d=
om%d port %d lost event (too many queue changes)\n",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d-=
>domain_id, evtchn->port);
>> -=C2=A0=C2=A0=C2=A0 return NULL;
>> -}
>> -
>> =C2=A0 static int try_set_link(event_word_t *word, event_word_t *w,=20
>> uint32_t link)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event_word_t new, old;
>> @@ -190,6 +158,9 @@ static void evtchn_fifo_set_pending(struct vcpu=20
>> *v, struct evtchn *evtchn)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event_word_t *word;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool_t was_pending;
>> +=C2=A0=C2=A0=C2=A0 struct evtchn_fifo_queue *q, *old_q;
>> +=C2=A0=C2=A0=C2=A0 unsigned int try;
>> +=C2=A0=C2=A0=C2=A0 bool linked =3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port =3D evtchn->port;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word =3D evtchn_fifo_word_from_port(d, =
port);
>> @@ -204,17 +175,67 @@ static void evtchn_fifo_set_pending(struct vcpu =

>> *v, struct evtchn *evtchn)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Lock all queues related to the event chann=
el (in case of a=20
>> queue change
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * this might be two).
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * It is mandatory to do that before setting =
and testing the=20
>> PENDING bit
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * and to hold the current queue lock until t=
he event has put=20
>> into the
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * list of pending events in order to avoid w=
aking up a guest=20
>> without the
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * event being visibly pending in the guest.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 for ( try =3D 0; try < 4; try++ )
>=20
> May I ask why the number of try is 4 rather than the original 3?

Oh, I think this is just a typo. OTOH it doesn't really matter.

>=20
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union evtchn_fifo_lastq la=
stq;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct vcpu *old_v;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lastq.raw =3D read_atomic(=
&evtchn->fifo_lastq);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old_v =3D d->vcpu[lastq.la=
st_vcpu_id];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q =3D &v->evtchn_fifo->que=
ue[evtchn->priority];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old_q =3D &old_v->evtchn_f=
ifo->queue[lastq.last_priority];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( q =3D=3D old_q )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp=
in_lock_irqsave(&q->lock, flags);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( q < old_q )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp=
in_lock_irqsave(&q->lock, flags);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp=
in_lock(&old_q->lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp=
in_lock_irqsave(&old_q->lock, flags);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp=
in_lock(&q->lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lastq.raw =3D read_atomic(=
&evtchn->fifo_lastq);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old_v =3D d->vcpu[lastq.la=
st_vcpu_id];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( q =3D=3D &v->evtchn_f=
ifo->queue[evtchn->priority] &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 old_q =3D=3D &old_v->evtchn_fifo->queue[lastq.last_priority] )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( q !=3D old_q )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp=
in_unlock(&old_q->lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&q-=
>lock, flags);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 was_pending =3D guest_test_and_set_bit(=
d, EVTCHN_FIFO_PENDING, word);
>> +=C2=A0=C2=A0=C2=A0 /* If we didn't get the lock bail out. */
>> +=C2=A0=C2=A0=C2=A0 if ( try =3D=3D 4 )
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gprintk(XENLOG_WARNING,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "dom%d port %d lost event (too many queue changes)\=
n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 d->domain_id, evtchn->port);
>=20
> NIT: You can use %pd use in place of dom%d.

Yes, indeed. This was just moved around. :-)


Juergen

--------------38CF97E019B7DCFB33182E2E
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------38CF97E019B7DCFB33182E2E--

--8NFTV2bdLPgudmR2d3Px2BdjffeuoG9Cx--

--DSS8JncNRbdqIiwdljUiftaRGKDT9sd1l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/BB7gFAwAAAAAACgkQsN6d1ii/Ey8x
qgf/Vp4zEpgL8jVwHGHZFBrTv1EcS+Q60RBJdaNZ6dkdPcG4R6BVjz1YvP0wg+jAnP657qNhQGoY
dr+JhC8s0HUg0fBMKVVJQpallCxpPlyvlsRX/vcA1t2AoSULtzc0PjikcIc12aQrpgTXLPF1w0XQ
PFJ/K8Up9uqBadZI/hyStxQ5s5MAFafyt36cXUAEWBRDLz5wVV/Navye0b4Ko02x/a17UhWrGHZd
sZTJn8pQgahTFLW0QoqvEGxfDUSAvkznIwpeZWOyG9OHLcFP/AyYwnyKcjxC9BWeWwhBtzPsAfSP
ysexbQxBJt8YxIRNkX0Vp6xDuWpZzSUDosQyoPymEg==
=njV8
-----END PGP SIGNATURE-----

--DSS8JncNRbdqIiwdljUiftaRGKDT9sd1l--

