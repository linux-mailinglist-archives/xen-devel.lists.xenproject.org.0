Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC291BA8DE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 17:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT5zM-0007o9-9t; Mon, 27 Apr 2020 15:48:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbbE=6L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jT5zK-0007o2-0O
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 15:48:06 +0000
X-Inumbo-ID: 7b76056e-889e-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b76056e-889e-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 15:48:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x17so20395700wrt.5
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=TNaqKHv3xB3gmXqjA49ijYMM+WpJCPmIY1aodHuOlJE=;
 b=BoIGJ9cemSqxisz1jMWM9erc4D0d/aUz6Jur8jpz7WW9DuEmEnOSPzaaf2hR7p9l6O
 PFmwlb0pfE7pSLE7U10j00Td+soMHkraI5jNAGsX0r4yrXaUS0lCFNPnKvbBVtwz68SL
 g0+utS24vpdBWtTACaRgMKLV/0kKBPAABndRMwFVPL/HcQO24KYC0VD++eS3c4fP2hKM
 jRD83ITTipAgHjdROze0jY/3NwwFHDlCKu3oBcgsl71fC0yU3AKO2IFEXcPdfu8o283q
 xpnAB6zAANaYRKjGnUysnhVNqPapD27NIhqZlesWXS+Xk75iU691QMBoabZMVcvGA4Ws
 +CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=TNaqKHv3xB3gmXqjA49ijYMM+WpJCPmIY1aodHuOlJE=;
 b=GPlC3eZuS9PBk3ptjHpxNTveg7+VVPslQMVFrBU/qO1FPNTb8EmTEvAdySfuwdO8lY
 tsO7+u4CLPCyTyCZ09QhL5z+N4G+AIvXyyL4C4lXfSN3tj+aI88fQxMCqIgwOabHVqzV
 h+IYEsHo9VQAO8KAqYMZLJDkyzHoyivCNPIKBCD65Shvx6yi3c8nXpkgQ7i86GDe3cO4
 XxcF3znos8sWePuH5EF5PedOgCR7Hi5ITlHusDGbImsVmSwi5VUSRkNSEZbA/ny0J1qy
 Y3rySXG2ISoCwAYID0zq+hy511ntqspogy33PxH2ZoyGYXw9yxZpCKuo76HvtcEFqHEI
 bcQw==
X-Gm-Message-State: AGi0PuYpzLS/vYnA42dAtHsn5jwk6SxFbJJEaWS6CvF/VcyggkfbD2CA
 mu7+HYTyvqt/4SFFNLI47uo=
X-Google-Smtp-Source: APiQypLGvNPeJ4Tocw3jHtNcO5krBLXS8mMXEKNlJ3IaZU0vSQDu/b6wOCZvOR4spRWjl8dh+PjgrQ==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr28278051wrv.260.1588002484199; 
 Mon, 27 Apr 2020 08:48:04 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id f23sm15826186wml.4.2020.04.27.08.48.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 08:48:03 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200427150620.540-1-paul@xen.org>
 <a0c12699-1abc-8d31-9afc-0d201cf93ebc@suse.com>
In-Reply-To: <a0c12699-1abc-8d31-9afc-0d201cf93ebc@suse.com>
Subject: RE: [PATCH v3] docs/designs: re-work the xenstore migration
 document...
Date: Mon, 27 Apr 2020 16:48:01 +0100
Message-ID: <000701d61cab$3c88c530$b59a4f90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFx+WbLmvmkc5bbO+rA6uYcvUAufgIJ5csbqUUUI/A=
Content-Language: en-gb
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 27 April 2020 16:14
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Jan Beulich <jbeulich@suse.com>;
> Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v3] docs/designs: re-work the xenstore migration =
document...
>=20
> On 27.04.20 17:06, Paul Durrant wrote:
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
> > NOTE: It will only be necessary to save and restore state for active =
xenstore
> >        connections, but the documentation for 'RESUME' in =
xenstore.txt implies
> >        otherwise. That command is unused so this patch deletes it =
from the
> >        specification.
> >
> > [1] See =
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/designs/non=
-cooperative-migration.md
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Wei Liu <wl@xen.org>
> >
> > v3:
> >   - Address missed comments from Juergen
>=20
> Not all :-(
>=20
> >
> > v2:
> >   - Address comments from Juergen
> > ---
>=20
> ...
>=20
> > +### NODE_DATA
> > +
> > +For live update the image format will contain a `NODE_DATA` record =
for each
> > +node in xenstore. For migration it will only contain a record for =
the nodes
> > +relating to the domain being migrated. The `NODE_DATA` may be =
related to
> > +a _committed_ node (globally visible in xenstored) or a _pending_ =
node (created
> > +or modified by a transaction for which there is also a =
`TRANSACTION_DATA`
> > +record previously present).
> >
> > -The `TRANSACTION_START` operation does not allow specification of a
> > -`<domid>`; it is assumed that the transaction pertains to the =
domain that
> > -owns the shared ring over which the operation is passed. Neither =
does it
> > -allow a `<transid>` to be specified; it is always chosen by =
xenstored.
> > -Hence, for the tool-stack to be able to open a transaction on =
behalf of a
> > -domain a new operation is needed:
> >
> >   ```
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
>=20
>=20
> path-len and value-len are still after perm1...permN, which makes it
> impossible to include them in a struct.
>=20
> Could you please either move them before the perm array or tell me why
> not?

Gah, sorry, I meant to move them and then forgot again. I'll send v4.

  Paul

>=20
>=20
> Juergen


