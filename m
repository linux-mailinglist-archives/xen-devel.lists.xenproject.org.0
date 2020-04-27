Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C21BA23F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 13:26:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT1tZ-0007Zx-7B; Mon, 27 Apr 2020 11:25:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbbE=6L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jT1tY-0007Zs-Dv
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 11:25:52 +0000
X-Inumbo-ID: d9760e90-8879-11ea-b9cf-bc764e2007e4
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9760e90-8879-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 11:25:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id h4so5843121wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=4PTJ5kD22A/3+2M6HVI7JbzS+j7YC4waLleUbiUPfIY=;
 b=bRRUQ0XtluqOtsTL0/WkJAFidCnCu68C4vuc1sxACwzFhC5bRP4vY8ucgjAfeV1Iyr
 AR7glySvJVxUZZpCKYxIgP+bCrKHQHFPqIgaSDvvPYUGCBmw9YkXcWdHk2qZvHdBB28x
 63g/IIWEiQpx18yl/GGeN9yAM2dueLlauZkdnT0/UQck2PRM5djxj6xQB/xut8V223Lq
 mrrw6bqWjMqwX4jK3fp+JeBRXoELNqeTA64F1Q/xAArrtSdFYocLFTTAmW7Ky2kdyukA
 6weeYYFc1mW0drPLc/Igz1+CJSLFUxq/lUylDn7vxQ8LbpkFTLJa1PZngQ3PhxC3D1Fu
 X6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=4PTJ5kD22A/3+2M6HVI7JbzS+j7YC4waLleUbiUPfIY=;
 b=MLI+r8GukdkP5HkIKXTIkIZHLJAa+WwaJ3fwGrmT56mfA5zyGQaJRXac9Z4XHOy3Jw
 xIvanrApG36pvJg/wk0AQy4+4l3OUgWpzYWrfQnaVXoWnMtbE818mqTIFQQXmv1Gyn3K
 iAsCr9bt9zZl2q/aXfz5jFKqFWeB2sM6WQs1g8C9WApoqgwLozKfoYlz9RmVHeDDlfE2
 7JDiDXSEBPAmhWhoR4NlXoViHL8q1L9oX56flPeP32IOkcohdP6Gl2l9XjCX+VRew6wy
 gqxNXEe/hfbVS2Uzov8dJMoeSKj2h3an38UWy0840N8junMnWKHJJdQSzdpv7K0X3I0Y
 EWNg==
X-Gm-Message-State: AGi0PuYLl5d08jUy6j/XdfSeEwpSyJIfBAFQPZEU4Je+c7oMQqkqDRbr
 2DZwMEhEFcMugWd7/3SJR5A=
X-Google-Smtp-Source: APiQypI3ZnCBuJp3J2rb++Y99bp5yL4EqA19FA8pEojcqgAx6XbsAhjxKFthZqV7PbFWhNhTHiqpwg==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr8327898wmk.92.1587986750512; 
 Mon, 27 Apr 2020 04:25:50 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id v16sm15041219wml.30.2020.04.27.04.25.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 04:25:50 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200427075342.149-1-paul@xen.org>
 <6004fb95-42e1-1ee3-5215-0d0dede73f0f@suse.com>
 <000a01d61c80$fd1e47a0$f75ad6e0$@xen.org>
 <ff0a5505-77aa-905b-7b77-af418a586a47@suse.com>
In-Reply-To: <ff0a5505-77aa-905b-7b77-af418a586a47@suse.com>
Subject: RE: [PATCH v2] docs/designs: re-work the xenstore migration
 document...
Date: Mon, 27 Apr 2020 12:25:48 +0100
Message-ID: <000c01d61c86$9a9ffd20$cfdff760$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJEJDb5RQM5hDvWa+75ajX7plb9lwK+35WRAi412S8Btzh3pKd7oJrQ
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
Cc: 'Paul Durrant' <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 27 April 2020 12:13
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>
> Subject: Re: [PATCH v2] docs/designs: re-work the xenstore migration =
document...
>=20
> On 27.04.20 12:45, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> >> Sent: 27 April 2020 11:37
> >> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> >> Cc: Paul Durrant <pdurrant@amazon.com>
> >> Subject: Re: [PATCH v2] docs/designs: re-work the xenstore =
migration document...
> >>
> >> On 27.04.20 09:53, Paul Durrant wrote:
> >>> From: Paul Durrant <pdurrant@amazon.com>
> >>>
> >>> ... to specify a separate migration stream that will also be =
suitable for
> >>> live update.
> >>>
> >>> The original scope of the document was to support non-cooperative =
migration
> >>> of guests [1] but, since then, live update of xenstored has been =
brought into
> >>> scope. Thus it makes more sense to define a separate image format =
for
> >>> serializing xenstore state that is suitable for both purposes.
> >>>
> >>> The document has been limited to specifying a new image format. =
The mechanism
> >>> for acquiring the image for live update or migration is not =
covered as that
> >>> is more appropriately dealt with by a patch to =
docs/misc/xenstore.txt. It is
> >>> also expected that, when the first implementation of live update =
or migration
> >>> making use of this specification is committed, that the document =
is moved from
> >>> docs/designs into docs/specs.
> >>>
> >>> [1] See =
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/designs/non=
-cooperative-
> migration.md
> >>>
> >>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >>> ---
> >>> Juergen Gross <jgross@suse.com>
> >>> Andrew Cooper <andrew.cooper3@citrix.com>
> >>> George Dunlap <george.dunlap@citrix.com>
> >>> Ian Jackson <ian.jackson@eu.citrix.com>
> >>> Jan Beulich <jbeulich@suse.com>
> >>> Julien Grall <julien@xen.org>
> >>> Stefano Stabellini <sstabellini@kernel.org>
> >>> Wei Liu <wl@xen.org>
> >>
> >> Mind adding CC: before those mail addresses in order to let git add
> >> those to the recipients list?
> >>
> >
> > D'oh... good spot.
> >
> >>>
> >>> v2:
> >>>    - Address comments from Juergen
> >>
> >> Not all unfortunately. :-(
> >>
> >
> > OK.
> >
> >>> +### CONNECTION_DATA
> >>>
> >>> -Each WATCH_DATA record specifies a registered watch and is =
formatted as
> >>> -follows:
> >>> +For live update the image format will contain a `CONNECTION_DATA` =
record for
> >>> +each connection to xenstore. For migration it will only contain a =
record for
> >>> +the domain being migrated.
> >>>
> >>>
> >>>    ```
> >>> -    0       1       2       3     octet
> >>> -+-------+-------+-------+-------+
> >>> -| WATCH_DATA                    |
> >>> -+-------------------------------+
> >>> -| wpath length                  |
> >>> -+-------------------------------+
> >>> -| wpath data                    |
> >>> -...
> >>> -| pad (0 to 3 octets)           |
> >>> -+-------------------------------+
> >>> +    0       1       2       3       4       5       6       7    =
octet
> >>> ++-------+-------+-------+-------+-------+-------+-------+-------+
> >>> +| conn-id                       | pad                           |
> >>> ++---------------+-----------------------------------------------+
> >>> +| conn-type     | conn-spec
> >>>    ...
> >>
> >> I asked whether it wouldn't be better to drop the pad and move =
conn-type
> >> and a 2-byte (unified) flag field at its position. This together =
...
> >>
> >>> ++-------------------------------+-------------------------------+
> >>> +| data-len                      | data
> >>>    +-------------------------------+
> >>> -| token length                  |
> >>> -+-------------------------------+
> >>> -| token data                    |
> >>>    ...
> >>> -| pad (0 to 3 octets)           |
> >>> -+-------------------------------+
> >>>    ```
> >>>
> >>> -wpath length and token length are specified in octets (excluding =
the NUL
> >>> -terminator). The wpath should be as described for the `WATCH` =
operation in
> >>> -[2]. The token is an arbitrary string of octets not containing =
any NUL
> >>> -values.
> >>>
> >>> +| Field       | Description                                     |
> >>> +|-------------|-------------------------------------------------|
> >>> +| `conn-id`   | A non-zero number used to identify this         |
> >>> +|             | connection in subsequent connection-specific    |
> >>> +|             | records                                         |
> >>> +|             |                                                 |
> >>> +| `conn-type` | 0x0000: shared ring                             |
> >>> +|             | 0x0001: socket                                  |
> >>> +|             |                                                 |
> >>> +| `conn-spec` | See below                                       |
> >>> +|             |                                                 |
> >>> +| `data-len`  | The length (in octets) of any pending data not  |
> >>> +|             | yet written to the connection                   |
> >>> +|             |                                                 |
> >>> +| `data`      | Pending data (may be empty)                     |
> >>>
> >>> -**TRANSACTION_DATA**
> >>> +The format of `conn-spec` is dependent upon `conn-type`.
> >>>
> >>> +\pagebreak
> >>>
> >>> -Each TRANSACTION_DATA record specifies an open transaction and is =
formatted
> >>> -as follows:
> >>> +For `shared ring` connections it is as follows:
> >>>
> >>>
> >>>    ```
> >>> -    0       1       2       3     octet
> >>> -+-------+-------+-------+-------+
> >>> -| TRANSACTION_DATA              |
> >>> -+-------------------------------+
> >>> -| tx_id                         |
> >>> -+-------------------------------+
> >>> +    0       1       2       3       4       5       6       7    =
octet
> >>> +                +-------+-------+-------+-------+-------+-------+
> >>> +                | domid         | tdomid        | flags         |
> >>> ++---------------+---------------+---------------+---------------+
> >>> +| revtchn                       | levtchn                       |
> >>> ++-------------------------------+-------------------------------+
> >>> +| mfn                                                           |
> >>> ++---------------------------------------------------------------+
> >>
> >> ... with dropping levtchn (which isn't needed IMO) will make it =
much
> >> easier to have a union in C (which needs to be aligned to 8 bytes
> >> and have a length of a multiple of 8 bytes due to mfn).
> >>
> >> So something like:
> >>
> >> struct xs_state_connection {
> >>       uint32_t conn_id;
> >>       uint16_t conn_type;
> >> #define XS_STATE_CONN_TYPE_RING   0
> >> #define XS_STATE_CONN_TYPE_SOCKET 1
> >>       uint16_t flags;
> >> #define XS_STATE_CONN_INTRODUCED  0x0001
> >> #define XS_STATE_CONN_RELEASED    0x0002
> >> #define XS_STATE_CONN_READONLY    0x0004
> >>       union {
> >>           struct {
> >>               uint16_t domid;
> >>               uint16_t tdomid;
> >> #define XS_STATE_DOMID_INVALID  0xffffU
> >>               uint32_t evtchn;
> >>               uint64_t mfn;
> >> #define XS_STATE_MFN_INVALID    0xffffffffffffffffUL
> >>           } ring;
> >>           int32_t socket_fd;
> >>       } spec;
> >>       uint32_t data_out_len;
> >>       uint8_t  data[];
> >> };
> >
> > The issue is making sure that the mfn is properly aligned. If I can =
drop the levtchn then this gets
> easier.
> >
> >>
> >>>    ```
> >>>
> >>> -where tx_id is the non-zero identifier values of an open =
transaction.
> >>> -
> >>>
> >>> -### Protocol Extension
> >>> +| Field      | Description                                      |
> >>> +|------------|--------------------------------------------------|
> >>> +| `domid`    | The domain-id that owns the shared page          |
> >>> +|            |                                                  |
> >>> +| `tdomid`   | The domain-id that `domid` acts on behalf of if  |
> >>> +|            | it has been subject to an SET_TARGET             |
> >>> +|            | operation [2] or DOMID_INVALID otherwise         |
> >>
> >> DOMID_INVALID needs to be defined (or we need a reference where it =
is
> >> coming from).
> >
> > OK. It's in a public header... I'll reference it.
> >
> >>
> >>> +|            |                                                  |
> >>> +| `flags`    | A bit-wise OR of:                                |
> >>> +|            | 0x0001: INTRODUCE has been issued                |
>=20
> Just realized, I think we can drop those flags.
>=20
> Reasoning: if INTRODUCE hasn't been issued, there can't be an active
> connection to Xenstore for that domain, as Xenstore doesn't know about
> the parameters to connect (especially the event channel is missing).
>=20
> >>> +|            | 0x0002: RELEASE has been issued                  |
>=20
> And the same applies here: RELEASE will drop the connection to the
> domain, so it can't appear in a connection record.
>=20

I think the presence of the RESUME command in xenstore.txt makes it =
non-obvious that we can forget about a domain once RELEASE has been =
called. The text there does say:

"It is not clear whether this is possible since one would
normally expect a domain not to be restarted after being shut
down without being destroyed in the meantime.  There are
currently no users of this request in xen-unstable."

So, perhaps this would be the time to remove RESUME from the spec?

  Paul

>=20
> Juergen


