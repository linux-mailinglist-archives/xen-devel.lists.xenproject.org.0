Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE32D1029
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 13:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46437.82414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFNs-0005GG-RZ; Mon, 07 Dec 2020 12:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46437.82414; Mon, 07 Dec 2020 12:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFNs-0005Fr-OK; Mon, 07 Dec 2020 12:12:52 +0000
Received: by outflank-mailman (input) for mailman id 46437;
 Mon, 07 Dec 2020 12:12:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0y+=FL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kmFNq-0005Fi-Ua
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:12:51 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97a4b626-0258-45a9-a088-68496a6e2f7c;
 Mon, 07 Dec 2020 12:12:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a12so5733125wrv.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 04:12:50 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id o67sm13871553wmo.31.2020.12.07.04.12.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 04:12:48 -0800 (PST)
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
X-Inumbo-ID: 97a4b626-0258-45a9-a088-68496a6e2f7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=YT62w/XHXRRVTJ4fKfvousr9yOLU+/nzOSs+DxN/Mms=;
        b=AUOwDd+TSzMZ4IH9hg4fW22gyiEBty0t/YKhqxKxSBvnri3envWVsRrlGS1PgrSK1L
         9oY9pnBkhpZ5U/I55KxOnsOGWkTt4OXrRLXcws5jHUjYy6PTQMAxa56xH/OLm7ZpK/cX
         z1KMqtBEtfvOz557ld4XbqG+IDdFEyC2SmjGofJE8j8ohYefu+vaYmn28YL2ctKq9Kpu
         /P36FlchjxaqrEGUseZLnnfDtg0EIwCISFMqBqwpMRkZjhcYSRZXOt+hTynhwj+Lxx85
         4hsd845jsBIyCMG6K7dN/D5GmYhSBubFyuBbW62JX8PwjKykfoR07xyWRE03xAaoNJlA
         sgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=YT62w/XHXRRVTJ4fKfvousr9yOLU+/nzOSs+DxN/Mms=;
        b=YgrJCh8ZK4MEq35gsR+IlibMOFaRxak1dz0qU8HwV567NdYyqSkDuNUyT0OB6DT/Tm
         aYl9dcAj5DuXbBWRWOkjCBtn6nZOUHFRkxgCBRTpb3i1vcDSlQmEzisfKiFK7mTptoI5
         zZDsWp1xXbNQ9XKIp+c4AWP59qBIyc1t+D/vzrcO3iaUcIrXmI2xibEEfJQkf6wKTZ2m
         lWSc1OI62nFbL+kLU3WOmz/KvcLfUaaO7mQuCIxU1KNdvYOC7AF4AaE2oXkdSTZpFkVY
         NKOT/VSLcprxuN7fZZe3JS4FL7pNKAqUonaL7MWYgm0TEhPaHm7GwkCg/KAmsEj0qEhm
         UhqQ==
X-Gm-Message-State: AOAM532fUHTbp3J7SALQiJcbhYUv54SzJiIgRUBaTyY/e4ZpScbUi1QC
	sfVSNKDUDkARhP9QFQNr4MU=
X-Google-Smtp-Source: ABdhPJz8BeY2CzQTjM0tEIsz0yTG3SYohbJ5bKXMzd0dRndUxPyiJS0VwbMmkRdTyn2x4EMAPVjUgQ==
X-Received: by 2002:adf:a3ca:: with SMTP id m10mr19324499wrb.228.1607343169274;
        Mon, 07 Dec 2020 04:12:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-9-git-send-email-olekstysh@gmail.com> <5b5011b7-5b8f-79cd-d8dc-c276ba1f9e37@suse.com>
In-Reply-To: <5b5011b7-5b8f-79cd-d8dc-c276ba1f9e37@suse.com>
Subject: RE: [PATCH V3 08/23] xen/ioreq: Move x86's ioreq_server to struct domain
Date: Mon, 7 Dec 2020 12:12:47 -0000
Message-ID: <0d0601d6cc92$47392ff0$d5ab8fd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKk0D4Qme59XF0a0h96d36zIOxDhQJGmzfoAf5XvzyoLVwsAA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 07 December 2020 12:05
> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant =
<paul@xen.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<iwj@xenproject.org>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu =
<wl@xen.org>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Julien Grall <julien.grall@arm.com>; =
xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V3 08/23] xen/ioreq: Move x86's ioreq_server to =
struct domain
>=20
> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > The IOREQ is a common feature now and this struct will be used
> > on Arm as is. Move it to common struct domain. This also
> > significantly reduces the layering violation in the common code
> > (*arch.hvm* usage).
> >
> > We don't move ioreq_gfn since it is not used in the common code
> > (the "legacy" mechanism is x86 specific).
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Applicable parts
> Acked-by: Jan Beulich <jbeulich@suse.com>
> yet with a question, but maybe more to Paul than to you:
>=20
> > --- a/xen/include/asm-x86/hvm/domain.h
> > +++ b/xen/include/asm-x86/hvm/domain.h
> > @@ -63,8 +63,6 @@ struct hvm_pi_ops {
> >      void (*vcpu_block)(struct vcpu *);
> >  };
> >
> > -#define MAX_NR_IOREQ_SERVERS 8
> > -
> >  struct hvm_domain {
> >      /* Guest page range used for non-default ioreq servers */
> >      struct {
> > @@ -73,12 +71,6 @@ struct hvm_domain {
> >          unsigned long legacy_mask; /* indexed by HVM param number =
*/
> >      } ioreq_gfn;
> >
> > -    /* Lock protects all other values in the sub-struct and the =
default */
> > -    struct {
> > -        spinlock_t              lock;
> > -        struct ioreq_server *server[MAX_NR_IOREQ_SERVERS];
> > -    } ioreq_server;
> > -
> >      /* Cached CF8 for guest PCI config cycles */
> >      uint32_t                pci_cf8;
> >
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -316,6 +316,8 @@ struct sched_unit {
> >
> >  struct evtchn_port_ops;
> >
> > +#define MAX_NR_IOREQ_SERVERS 8
> > +
> >  struct domain
> >  {
> >      domid_t          domain_id;
> > @@ -523,6 +525,14 @@ struct domain
> >      /* Argo interdomain communication support */
> >      struct argo_domain *argo;
> >  #endif
> > +
> > +#ifdef CONFIG_IOREQ_SERVER
> > +    /* Lock protects all other values in the sub-struct and the =
default */
> > +    struct {
> > +        spinlock_t              lock;
> > +        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
> > +    } ioreq_server;
> > +#endif
>=20
> The comment gets merely moved, but what "default" does it talk about?
> Is this a stale part which would better be dropped at this occasion?
>=20

Yes, I think that is a stale part of the comment from the days of the =
default ioreq server. It can be dropped.

  Paul

> Jan


