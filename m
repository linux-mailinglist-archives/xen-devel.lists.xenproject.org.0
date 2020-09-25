Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8915278289
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 10:20:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLix5-0000ml-5s; Fri, 25 Sep 2020 08:19:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4q2y=DC=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLix3-0000mg-Ki
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 08:19:33 +0000
X-Inumbo-ID: e7838f50-5f89-41be-9d77-15ffcf3df895
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7838f50-5f89-41be-9d77-15ffcf3df895;
 Fri, 25 Sep 2020 08:19:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so2576205wrs.5
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2020 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=u69/Y/I2BU3HbLSsZCtIkwgdhMt+7DVCgrLvdTSWBc8=;
 b=WGR2SHhzT2MCtOTEqBwvOQrxFWs3lYokrmducqFVTs+BDTnMpWTYouXWoN3QT5FEdd
 yzMB1b4mMi9THD6m4AYaPS96bT7xU6xo9ee44QxlLaiFWR0u9PjFecDZN8lTIQyVLj0P
 G3NJGc3dOk+uJltihyYNmw+CvndHwcY+kZR+U0ruS3KBLWOpZ5iVA7UB7DGPmDB+0Ko0
 WXR07E14B20CWcqmVwVfSZ7j83WXJ73G51JdGYGmRZmYe0oWrCuSnJdtRl33TFOxdYu/
 SIttgxpTiD2p29FZQy/nXFnbiDpXsOpaXP5mQkD/4KLgTLax2v7kfAPoTy2Q039o04+N
 9oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=u69/Y/I2BU3HbLSsZCtIkwgdhMt+7DVCgrLvdTSWBc8=;
 b=gIKIh/l77VLa97gwFORphI40MrmGKpuXQigZEfTLlnfg+fK5Vj1BLBzgwq2PoIOjiG
 nu1tlbNk7BUlc9b2D6j6LqtLrJ/Fm6GZ2mNhnGcWEBaSw1K5EexisQIq7NIENxHqVmTN
 AC4e1jbay8RAtTmR0LerrqA6beHTDjFrw0+7cjo6GCMxsyYS+DMF3CQoi3OJhGYocs2B
 Y2+o8jqVkRkeitiJlBnfJsr89+RNYUHGsTkXrUqw7Y0TxmWZ8QZCs4/M+9ztlK9SjAgg
 LEM0x9urQfKOXHXHpSpLE+lvDOkIAfoG6pP0vWR5fdD5yNX/1RSH2mmUCwaSjfzZBBaa
 Vc3g==
X-Gm-Message-State: AOAM530fIvHkpnjIBeloS42AXsqlpzA+8Jk8qX2phxUd8xfeWw+rxswX
 0CeOF0cCV3aAFmiFFUjeqVw=
X-Google-Smtp-Source: ABdhPJxAOs/0DDRrqAofH0plKOGaBHau9dZJDCxobrAQKsJgONXHSxwf9iKbt3A0AFEV61ETWaMFHg==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr3398662wrr.105.1601021971816; 
 Fri, 25 Sep 2020 01:19:31 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id u66sm1983121wmg.44.2020.09.25.01.19.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Sep 2020 01:19:30 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>, "'Tim Deegan'" <tim@xen.org>,
 "'Julien Grall'" <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org>
In-Reply-To: <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org>
Subject: RE: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
Date: Fri, 25 Sep 2020 09:19:29 +0100
Message-ID: <000201d69314$97bd8fa0$c738aee0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIQ4beZ3sUmYihKXwfoVgy4BRIJGwHfeJxHAedMvHOo5iuCoA==
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
> From: Julien Grall <julien@xen.org>
> Sent: 24 September 2020 19:01
> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; =
xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei =
Liu <wl@xen.org>; Roger Pau
> Monn=C3=A9 <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; Jun =
Nakajima <jun.nakajima@intel.com>;
> Kevin Tian <kevin.tian@intel.com>; Tim Deegan <tim@xen.org>; Julien =
Grall <julien.grall@arm.com>
> Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature =
common
>=20
>=20
>=20
> On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
> > +static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
> > +{
> > +    unsigned int prev_state =3D STATE_IOREQ_NONE;
> > +    unsigned int state =3D p->state;
> > +    uint64_t data =3D ~0;
> > +
> > +    smp_rmb();
> > +
> > +    /*
> > +     * The only reason we should see this condition be false is =
when an
> > +     * emulator dying races with I/O being requested.
> > +     */
> > +    while ( likely(state !=3D STATE_IOREQ_NONE) )
> > +    {
> > +        if ( unlikely(state < prev_state) )
> > +        {
> > +            gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition =
%u -> %u\n",
> > +                     prev_state, state);
> > +            sv->pending =3D false;
> > +            domain_crash(sv->vcpu->domain);
> > +            return false; /* bail */
> > +        }
> > +
> > +        switch ( prev_state =3D state )
> > +        {
> > +        case STATE_IORESP_READY: /* IORESP_READY -> NONE */
> > +            p->state =3D STATE_IOREQ_NONE;
> > +            data =3D p->data;
> > +            break;
> > +
> > +        case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> =
IORESP_READY */
> > +        case STATE_IOREQ_INPROCESS:
> > +            wait_on_xen_event_channel(sv->ioreq_evtchn,
> > +                                      ({ state =3D p->state;
> > +                                         smp_rmb();
> > +                                         state !=3D prev_state; =
}));
> > +            continue;
>=20
> As I pointed out previously [1], this helper was implemented with the
> expectation that wait_on_xen_event_channel() will not return if the =
vCPU
> got rescheduled.
>=20
> However, this assumption doesn't hold on Arm.
>=20
> I can see two solution:
>     1) Re-execute the caller
>     2) Prevent an IOREQ to disappear until the loop finish.
>=20
> @Paul any opinions?

The ioreq control plane is largely predicated on there being no pending =
I/O when the state of a server is modified, and it is assumed that =
domain_pause() is sufficient to achieve this. If that assumption doesn't =
hold then we need additional synchronization.

  Paul

>=20
> Cheers,
>=20
> [1]
> =
https://lore.kernel.org/xen-devel/6bfc3920-8f29-188c-cff4-2b99dabe166f@xe=
n.org/
>=20
>=20
> --
> Julien Grall


