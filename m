Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D911BA1A0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 12:46:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT1Gf-0002kf-NU; Mon, 27 Apr 2020 10:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbbE=6L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jT1Gf-0002ka-0s
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 10:45:41 +0000
X-Inumbo-ID: 3bfaa248-8874-11ea-9887-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bfaa248-8874-11ea-9887-bc764e2007e4;
 Mon, 27 Apr 2020 10:45:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i10so19940272wrv.10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=WEVE4TsyCLep1MWm1ZY6XVXdPklSUFZrElyYlI+g/3I=;
 b=p2RqmUmMnaaLc5fxGjcCGeWEXzgPOj/kng4/8rDUWPU+pBGnOh5XmNxFPI3Ea9LNfu
 pc6cjIlIpti3G3PPXvdUOlird+saqjkIRox40lS+OI8zNQgsh7+9gntrpnlC7k1H6ySX
 HNDHGYEaqYkFxlHiy1Zv4ecr8uBM/cNBqIIMnSpDmtAag5fo/lfC9oxPEVKtSv9HNs24
 SvqT45QoKVd8O4SurzZP42Rk9akOz3g0kyTT+XNVYxVAY68WO10J5CVc5BTF553MaWRC
 LA7gt7Hgcx5Zue2ozOS4mOl+gNEPHVg5pZDYoiDtOYTVi3+fRka0mRpMsHg8zHhnFYAN
 BWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=WEVE4TsyCLep1MWm1ZY6XVXdPklSUFZrElyYlI+g/3I=;
 b=VsPSf0sWGXx40+0BHc+p10hFsIvlo0wMAiseCrput86NxzxYt62vYFaDhLRL0yrNYN
 SjeoJQ++g04ETdQSESHuX6N4QyrP08tOz430QbgWBhSygKc+tSqgm9jLip1P8yzf/apn
 w7zZkzMkTuO5Vm8yrebTURJZvXYYdwc3t5ElhdpwVdFXPMHH+05i00+XxMuiAqRDAibR
 2PhdZv2fGI8T0JBSrWQSLqPCJCUNI22wXq94iH/m9n0gc1H2PpPh6+IKgZ9jaS2AaKSZ
 Jqrr2zsfhF2eCSffs5HYZNI8xYRj2f7dbZMnCUQLbLi09OqOBG/dABzUDoCDKaANerVj
 Gjhw==
X-Gm-Message-State: AGi0PuZHG9EL9hGxdyeueDrltwgyGSN9hzTB0z0GBXE/QeZzgsicGaZV
 U1XS7uI/zF+2DW5nO8L6M94=
X-Google-Smtp-Source: APiQypK4qM0dGaDEnak8dZq802PD7W7ZgLWqNHVmZYS3kZQ5Y69KoSU1ADQNdAvPRi5OrwuGQ8DY+g==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr25278919wrv.87.1587984338817; 
 Mon, 27 Apr 2020 03:45:38 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id f63sm14956356wma.47.2020.04.27.03.45.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 03:45:38 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200427075342.149-1-paul@xen.org>
 <6004fb95-42e1-1ee3-5215-0d0dede73f0f@suse.com>
In-Reply-To: <6004fb95-42e1-1ee3-5215-0d0dede73f0f@suse.com>
Subject: RE: [PATCH v2] docs/designs: re-work the xenstore migration
 document...
Date: Mon, 27 Apr 2020 11:45:37 +0100
Message-ID: <000a01d61c80$fd1e47a0$f75ad6e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJEJDb5RQM5hDvWa+75ajX7plb9lwK+35WRp5rBKeA=
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
> Sent: 27 April 2020 11:37
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>
> Subject: Re: [PATCH v2] docs/designs: re-work the xenstore migration =
document...
>=20
> On 27.04.20 09:53, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > ... to specify a separate migration stream that will also be =
suitable for
> > live update.
> >
> > The original scope of the document was to support non-cooperative =
migration
> > of guests [1] but, since then, live update of xenstored has been =
brought into
> > scope. Thus it makes more sense to define a separate image format =
for
> > serializing xenstore state that is suitable for both purposes.
> >
> > The document has been limited to specifying a new image format. The =
mechanism
> > for acquiring the image for live update or migration is not covered =
as that
> > is more appropriately dealt with by a patch to =
docs/misc/xenstore.txt. It is
> > also expected that, when the first implementation of live update or =
migration
> > making use of this specification is committed, that the document is =
moved from
> > docs/designs into docs/specs.
> >
> > [1] See =
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/designs/non=
-cooperative-migration.md
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Juergen Gross <jgross@suse.com>
> > Andrew Cooper <andrew.cooper3@citrix.com>
> > George Dunlap <george.dunlap@citrix.com>
> > Ian Jackson <ian.jackson@eu.citrix.com>
> > Jan Beulich <jbeulich@suse.com>
> > Julien Grall <julien@xen.org>
> > Stefano Stabellini <sstabellini@kernel.org>
> > Wei Liu <wl@xen.org>
>=20
> Mind adding CC: before those mail addresses in order to let git add
> those to the recipients list?
>=20

D'oh... good spot.

> >
> > v2:
> >   - Address comments from Juergen
>=20
> Not all unfortunately. :-(
>=20

OK.

> > +### CONNECTION_DATA
> >
> > -Each WATCH_DATA record specifies a registered watch and is =
formatted as
> > -follows:
> > +For live update the image format will contain a `CONNECTION_DATA` =
record for
> > +each connection to xenstore. For migration it will only contain a =
record for
> > +the domain being migrated.
> >
> >
> >   ```
> > -    0       1       2       3     octet
> > -+-------+-------+-------+-------+
> > -| WATCH_DATA                    |
> > -+-------------------------------+
> > -| wpath length                  |
> > -+-------------------------------+
> > -| wpath data                    |
> > -...
> > -| pad (0 to 3 octets)           |
> > -+-------------------------------+
> > +    0       1       2       3       4       5       6       7    =
octet
> > ++-------+-------+-------+-------+-------+-------+-------+-------+
> > +| conn-id                       | pad                           |
> > ++---------------+-----------------------------------------------+
> > +| conn-type     | conn-spec
> >   ...
>=20
> I asked whether it wouldn't be better to drop the pad and move =
conn-type
> and a 2-byte (unified) flag field at its position. This together ...
>=20
> > ++-------------------------------+-------------------------------+
> > +| data-len                      | data
> >   +-------------------------------+
> > -| token length                  |
> > -+-------------------------------+
> > -| token data                    |
> >   ...
> > -| pad (0 to 3 octets)           |
> > -+-------------------------------+
> >   ```
> >
> > -wpath length and token length are specified in octets (excluding =
the NUL
> > -terminator). The wpath should be as described for the `WATCH` =
operation in
> > -[2]. The token is an arbitrary string of octets not containing any =
NUL
> > -values.
> >
> > +| Field       | Description                                     |
> > +|-------------|-------------------------------------------------|
> > +| `conn-id`   | A non-zero number used to identify this         |
> > +|             | connection in subsequent connection-specific    |
> > +|             | records                                         |
> > +|             |                                                 |
> > +| `conn-type` | 0x0000: shared ring                             |
> > +|             | 0x0001: socket                                  |
> > +|             |                                                 |
> > +| `conn-spec` | See below                                       |
> > +|             |                                                 |
> > +| `data-len`  | The length (in octets) of any pending data not  |
> > +|             | yet written to the connection                   |
> > +|             |                                                 |
> > +| `data`      | Pending data (may be empty)                     |
> >
> > -**TRANSACTION_DATA**
> > +The format of `conn-spec` is dependent upon `conn-type`.
> >
> > +\pagebreak
> >
> > -Each TRANSACTION_DATA record specifies an open transaction and is =
formatted
> > -as follows:
> > +For `shared ring` connections it is as follows:
> >
> >
> >   ```
> > -    0       1       2       3     octet
> > -+-------+-------+-------+-------+
> > -| TRANSACTION_DATA              |
> > -+-------------------------------+
> > -| tx_id                         |
> > -+-------------------------------+
> > +    0       1       2       3       4       5       6       7    =
octet
> > +                +-------+-------+-------+-------+-------+-------+
> > +                | domid         | tdomid        | flags         |
> > ++---------------+---------------+---------------+---------------+
> > +| revtchn                       | levtchn                       |
> > ++-------------------------------+-------------------------------+
> > +| mfn                                                           |
> > ++---------------------------------------------------------------+
>=20
> ... with dropping levtchn (which isn't needed IMO) will make it much
> easier to have a union in C (which needs to be aligned to 8 bytes
> and have a length of a multiple of 8 bytes due to mfn).
>=20
> So something like:
>=20
> struct xs_state_connection {
>      uint32_t conn_id;
>      uint16_t conn_type;
> #define XS_STATE_CONN_TYPE_RING   0
> #define XS_STATE_CONN_TYPE_SOCKET 1
>      uint16_t flags;
> #define XS_STATE_CONN_INTRODUCED  0x0001
> #define XS_STATE_CONN_RELEASED    0x0002
> #define XS_STATE_CONN_READONLY    0x0004
>      union {
>          struct {
>              uint16_t domid;
>              uint16_t tdomid;
> #define XS_STATE_DOMID_INVALID  0xffffU
>              uint32_t evtchn;
>              uint64_t mfn;
> #define XS_STATE_MFN_INVALID    0xffffffffffffffffUL
>          } ring;
>          int32_t socket_fd;
>      } spec;
>      uint32_t data_out_len;
>      uint8_t  data[];
> };

The issue is making sure that the mfn is properly aligned. If I can drop =
the levtchn then this gets easier.

>=20
> >   ```
> >
> > -where tx_id is the non-zero identifier values of an open =
transaction.
> > -
> >
> > -### Protocol Extension
> > +| Field      | Description                                      |
> > +|------------|--------------------------------------------------|
> > +| `domid`    | The domain-id that owns the shared page          |
> > +|            |                                                  |
> > +| `tdomid`   | The domain-id that `domid` acts on behalf of if  |
> > +|            | it has been subject to an SET_TARGET             |
> > +|            | operation [2] or DOMID_INVALID otherwise         |
>=20
> DOMID_INVALID needs to be defined (or we need a reference where it is
> coming from).

OK. It's in a public header... I'll reference it.

>=20
> > +|            |                                                  |
> > +| `flags`    | A bit-wise OR of:                                |
> > +|            | 0x0001: INTRODUCE has been issued                |
> > +|            | 0x0002: RELEASE has been issued                  |
> > +|            |                                                  |
> > +| `revtchn`  | The port number of the interdomain channel used  |
> > +|            | by `domid` to communicate with xenstored         |
> > +|            |                                                  |
> > +| `levtchn`  | For a live update this will be the port number   |
> > +|            | of the interdomain channel used by xenstored     |
> > +|            | itself otherwise, for migration, it will be -1   |
> > +|            |                                                  |
> > +| `mfn`      | The MFN of the shared page for a live update or  |
> > +|            | INVALID_MFN otherwise                            |
>=20
> INVALID_MFN is an internal detail of the hypervisor. We should have a
> local definition for it here (as in my example above).

OK. I'll define it as all-1s.

>=20
> > +
> > +Since the ABI guarantees that entry 1 in `domid`'s grant table will =
always
> > +contain the GFN of the shared page, so for a live update `mfn` can =
be used to
> > +give confidence that `domid` has not been re-cycled during the =
update.
> > +
> > +
> > +For `socket` connections it is as follows:
> >
> > -Before xenstore state is migrated it is necessary to wait for any =
pending
> > -reads, writes, watch registrations etc. to complete, and also to =
make sure
> > -that xenstored does not start processing any new requests (so that =
new
> > -requests remain pending on the shared ring for subsequent =
processing on the
> > -new host). Hence the following operation is needed:
> >
> >   ```
> > -QUIESCE                 <domid>|
> > -
> > -Complete processing of any request issued by the specified domain, =
and
> > -do not process any further requests from the shared ring.
> > +    0       1       2       3       4       5       6       7    =
octet
> > +                +-------+-------+-------+-------+-------+-------+
> > +                | flags         | socket-fd                     |
> > +                +---------------+-------------------------------+
>=20
> > -START_DOMAIN_TRANSACTION    <domid>|<transid>|
> > +    0       1       2       3    octet
> > ++-------+-------+-------+-------+
> > +| conn-id                       |
> > ++-------------------------------+
> > +| tx-id                         |
> > ++---------------+---------------+
> > +| access        | perm-count    |
> > ++---------------+---------------+
> > +| perm1                         |
> > ++-------------------------------+
> > +...
> > ++-------------------------------+
> > +| permN                         |
> > ++---------------+---------------+
> > +| path-len      | value-len     |
> > ++---------------+---------------+
> > +| path
> > +...
> > +| value
> > +...
> > +```
> > +
> > +
> > +| Field        | Description                                    |
> > +|--------------|------------------------------------------------|
> > +| `conn-id`    | If this value is non-zero then this record     |
> > +|              | related to a pending transaction               |
> > +|              |                                                |
> > +| `tx-id`      | This value should be ignored if `conn-id` is   |
> > +|              | zero. Otherwise it specifies the id of the     |
> > +|              | pending transaction                            |
> > +|              |                                                |
> > +| `access`     | This value should be ignored if this record    |
> > +|              | does not relate to a pending transaction,      |
> > +|              | otherwise it specifies the accesses made to    |
> > +|              | the node and hence is a bitwise OR of:         |
> > +|              |                                                |
> > +|              | 0x0001: read                                   |
> > +|              | 0x0002: written                                |
> > +|              |                                                |
> > +|              | The value will be zero for a deleted node      |
> > +|              |                                                |
> > +| `perm-count` | The number (N) of node permission specifiers   |
> > +|              | (which will be 0 for a node deleted in a       |
> > +|              | pending transaction)                           |
> > +|              |                                                |
> > +| `perm1..N`   | A list of zero or more node permission         |
> > +|              | specifiers (see below)                         |
> > +|              |                                                |
> > +| `path-len`   | The length (in octets) of `path` including the |
> > +|              | NUL terminator                                 |
> > +|              |                                                |
> > +| `value-len`  | The length (in octets) of `value` (which will  |
> > +|              | be zero for a deleted node)                    |
>=20
> I asked you to put the path-len and value-len fields before the perm
> array.

I missed that. I'll move them.

  Paul

>=20
>=20
> Juergen


