Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D924B537
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 12:21:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8hgJ-0003Tv-Gj; Thu, 20 Aug 2020 10:20:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8hgH-0003Tq-4t
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 10:20:25 +0000
X-Inumbo-ID: 2dcc951b-11f9-4084-b6cf-ddbec9d3bc16
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dcc951b-11f9-4084-b6cf-ddbec9d3bc16;
 Thu, 20 Aug 2020 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597918824;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Sv68RoNLXVff/6n8GJVDTzUndQIzSGsto9tYosUgXbw=;
 b=XbZeu7UkFAifTcJ4xqjQcp1c3tcDgfudSJXynAmqI/Zh9Hv8pPb2hOng
 mhYbUyFrrfYwvpp6y+spErvKRXGlYCAZymwbbGYibdayDC5E773/EDnFT
 7iWuXx+g9rsu8WhZLfZmezswYQZlMldD8Kq8l1EWY0hdOLCVUl1AsDq1x A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: g5He4ply494ZRa/EGg7MaC71UzA0BjHI1c7YSwZBTDzTp9vpey0jdtGIFSsbMxA1X6JsEBAvkw
 B26jNrEgbiFdR1wvCVK0z3EhFmTTq4XgjmQ4hJTQKN/YHmJkqr3oqEq7fo7nByDE/78nF//jET
 ail+DgQVD5LgeIS6TGXJHGPHn3r/NmlyoYNxzeNv9wZ5nmrHZHIqKJpLTa/azaYJygb0agovIt
 sOBNqo3hgPUzC/dFP+lUPEmbSTg+MmbWcdS+RPQkTjx3SN4flHaKnhszEvO84y4Le8Yy5jVL1n
 qaI=
X-SBRS: 2.7
X-MesageID: 24943558
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,332,1592884800"; d="scan'208";a="24943558"
Date: Thu, 20 Aug 2020 12:20:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
CC: Norbert Kaminski <norbert.kaminski@3mdeb.com>, Ard Biesheuvel
 <ardb@kernel.org>, <linux-efi@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, open list <linux-kernel@vger.kernel.org>,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, <piotr.krol@3mdeb.com>
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too
Message-ID: <20200820102016.GU828@Air-de-Roger>
References: <20200817090013.GN975@Air-de-Roger>
 <20200818120135.GK1679@mail-itl>
 <20200818124710.GK828@Air-de-Roger>
 <20200818150020.GL1679@mail-itl>
 <20200818172114.GO828@Air-de-Roger>
 <20200818184018.GN1679@mail-itl>
 <20200819081930.GQ828@Air-de-Roger>
 <3d405b0c-4e2b-0d29-56bb-e315f4c21d03@3mdeb.com>
 <20200820093025.GT828@Air-de-Roger>
 <20200820093454.GS1626@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820093454.GS1626@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 20, 2020 at 11:34:54AM +0200, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 20, 2020 at 11:30:25AM +0200, Roger Pau Monné wrote:
> > Right, so you only need access to the ESRT table, that's all. Then I
> > think we need to make sure Xen doesn't use this memory for anything
> > else, which will require some changes in Xen (or at least some
> > checks?).
> > 
> > We also need to decide what to do if the table turns out to be placed
> > in a wrong region. How are we going to prevent dom0 from using it
> > then? My preference would be to completely hide it from dom0 in that
> > case, such that it believes there's no ESRT at all if possible.
> 
> Yes, that makes sense. As discussed earlier, that probably means
> re-constructing SystemTable before giving it to dom0. We'd need to do
> that in PVH case anyway, to adjust addresses, right?

Not really, on PVH dom0 we should be able to identity map the required
EFI regions in the dom0 p2m, so the only difference between a classic
PV dom0 is that we need to assure that those regions are correctly
identity mapped in the p2m, but that shouldn't require any change to
the SystemTable unless we need to craft custom tables (see below).

> Is there something
> like this in the Xen codebase already, or it needs to be written from
> scratch?

AFAICT it needs to be written for EFI. For the purposes here I think
you could copy the SystemTable and modify the NumberOfTableEntries and
ConfigurationTable fields in the copy in order to delete the ESRT if
found to be placed in a non suitable region?

At that point we can remove the checks from Linux since Xen will
assert that whatever gets passed to dom0 is in a suitable region. It
would be nice to have a way to signal that the placement of the ESRT
has been checked, but I'm not sure how to do this, do you have any
ideas?

Roger.

