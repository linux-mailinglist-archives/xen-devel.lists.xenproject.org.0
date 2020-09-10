Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3B2644B5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 12:53:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGKCa-0000A4-3V; Thu, 10 Sep 2020 10:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGKCY-00009z-4N
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 10:53:14 +0000
X-Inumbo-ID: c4d3bcb0-9b89-4fe1-bc02-90ea20d09e22
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4d3bcb0-9b89-4fe1-bc02-90ea20d09e22;
 Thu, 10 Sep 2020 10:53:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id y15so5345617wmi.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=8yxCaAGJMTyjqqTzDMQrqNo13B7NI0Y1CRUYa1BBCWY=;
 b=fts8sdteBl5ioGN7n6dVytbpznx+0tEtFrFi1zxz1tWjzj6fHtx8OwSbq/P54FWdMa
 iFS7JtqlnaJE8BJZ+XIdRw3J5GTLGy06UrXLhxXY2ACmLKuQe4I2EGJP7m/4uFepCIWj
 EYfq52Sp+nK9VARiHUmizRfCbdy/FVDqPUJlTAZo5Mzq9XXiF0beFjkuya9BW+xYKS/o
 iTLXJt0Zfgd+kPvCCDEEMLhmTVG4INAOfFv9dxGESAq5OEdApZnQlI0oM6vDTvZU7xor
 +PUAXvT25hZrUd5BqOe2RD/ib2K9DSoslPhxW1SwT/dxM9xsmlmCmcc6aCo2kjbX05hQ
 jZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=8yxCaAGJMTyjqqTzDMQrqNo13B7NI0Y1CRUYa1BBCWY=;
 b=kW0MZJiAl4E6o7HZujXzAoFSoSUvIQRl08wSywqzjff3sWY+ELuludDMFIh8RLSKoT
 kLDEvitflTfNqwB9YAFZJ/JIrpSLlKqfwWCBlAU0zxzZ2O/+fZCqHs7FiqkqlsOd+pG1
 wTxz2mN0GB7nxY/sdWz5dbR8ZD4Rxtr/Z9UWp1s1BPkiCeP/R+sfp73ViB7mTw4TsL2M
 eaAslsqSDBpTcwe9By+LaFcxdVas2KMHjYEYu5YvzUhgF0TaXg6ikbTTvUa0uXMmYVbW
 lbo7zl5Jkg06JFj2mRyrP+i6bdZZop1IIzShz1hv0soHhoCnWZ87xkpBLOUDzvnR/ry5
 KSgQ==
X-Gm-Message-State: AOAM533bQl4nYzxyfP2czlCJQYUgLdsgExNZlui47qSGm1/vfRFU3urT
 t8Py+9x2Z8cDaAh6/DdsjIM=
X-Google-Smtp-Source: ABdhPJxtCdwoTsJoWwqpUdji40mrQ4YFy/K8j1kFJqfpTBg0DqG9yACvhqVbjCWNEJfx9g95JWaNlg==
X-Received: by 2002:a1c:9654:: with SMTP id y81mr7884607wmd.9.1599735192244;
 Thu, 10 Sep 2020 03:53:12 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id t202sm3194906wmt.14.2020.09.10.03.53.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 03:53:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>
References: <20200909145058.72066-1-roger.pau@citrix.com>
 <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
 <20200910103455.GV753@Air-de-Roger>
In-Reply-To: <20200910103455.GV753@Air-de-Roger>
Subject: RE: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding
 cache attributes
Date: Thu, 10 Sep 2020 11:53:10 +0100
Message-ID: <002901d68760$93a6a330$baf3e990$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHf/Df7LZfQ9Xm/eSTBd3e0hnXIhAJAqh6dAQmHGeWpNHauwA==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 10 September 2020 11:35
> To: Jan Beulich <jbeulich@suse.com>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>;
> Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones =
regarding cache attributes
>=20
> On Thu, Sep 10, 2020 at 11:27:49AM +0200, Jan Beulich wrote:
> > On 09.09.2020 16:50, Roger Pau Monne wrote:
> > > MMIO regions below the maximum address on the memory map can have =
a
> > > backing page struct that's shared with dom_io (see x86
> > > arch_init_memory and it's usage of share_xen_page_with_guest), and
> > > thus also fulfill the is_special_page check because the page has =
the
> > > Xen heap bit set.
> > >
> > > This is incorrect for MMIO regions when is_special_page is used by
> > > epte_get_entry_emt, as it will force direct MMIO regions mapped =
into
> > > the guest p2m to have the cache attributes set to write-back.
> > >
> > > Add an extra check in epte_get_entry_emt in order to detect pages
> > > shared with dom_io (ie: MMIO regions) and don't force them to
> > > write-back cache type on that case.
> >
> > Did you consider the alternative of not marking those pages as Xen
> > heap ones? In particular when looking at it from this angle I
> > consider it at least odd for non-RAM (or more precisely non-heap)
> > pages to get marked this way.
>=20
> I wasn't sure whether this could cause issues in other places of the
> code that would rely on this fact and such change seemed more risky
> IMO.
>=20
> > And I can't currently see anything
> > requiring them to be marked as such - them being owned by DomIO is
> > all that's needed as it seems.
>=20
> Should those pages then simply be assigned to dom_io and set the
> appropriate flags (PGC_allocated | 1), or should
> share_xen_page_with_guest be modified to not set the PGC_xen_heap
> flag?
>=20
> I see that such addition was done in a2b4b8c2041, but I'm afraid I
> don't fully understand why share_xen_page_with_guest needs to mark
> pages as Xen heap.
>=20

In general they are not marked Xen heap then they will be considered =
domheap and will go through the normal free-ing path on domain =
destruction. Of course this doesn't apply for a system domain that never =
gets destroyed.

  Paul




