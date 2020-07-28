Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D69230589
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 10:37:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0L6a-0006RJ-DK; Tue, 28 Jul 2020 08:37:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0L6Y-0006RE-8O
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 08:36:58 +0000
X-Inumbo-ID: 7e847996-d0ad-11ea-a87d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e847996-d0ad-11ea-a87d-12813bfff9fa;
 Tue, 28 Jul 2020 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595925416;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Wt+2Rk35DFsivT+PLFZ3saMbD9lTBuqwKxEAHavAZuY=;
 b=iUPdUzqqDVpvJNZfyxLd57jeG5fE+9oN2+00Y6DO8tZ+/QFss8lTDcV8
 zJA75F4UFOEipTxXIciydcGvn5Z4pKjudXHahaIPT+oYQJkdfUcE9htjq
 944CgToN7mkHNn9u1BIkJmebA5MExBoYGmqCdp98m1mEWw7ppDVuU7kzG o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0RJBp9F2bSyi1xbHsn216+P/WXCsxqXqn75hjXrC2Ufa+TSCdT/qbopDLbeouxi7+80fFIoQ3H
 PdPNQtcl6sGFrYrPxGRyHxJXQUi80hgmIu5J4jhAzE/3jh+sxheShwvfw+GKPRU+p5xirb22FB
 qYrT84PzYRALE+kXc5qmGYeeFsYbeNr3EMM16Hf4KiiN0vIPjRLPhydeokA8UOjipG4MXLF6xH
 OkjevtsFDvh+qUsxz+ol3RKoyYEGjM7gXVltt3VWp3Cz+kCtQEIQP8FexrhmLps/PXN5nUIFLr
 iBU=
X-SBRS: 2.7
X-MesageID: 24191433
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,405,1589256000"; d="scan'208";a="24191433"
Date: Tue, 28 Jul 2020 10:36:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/4] x86: reduce CET-SS related #ifdef-ary
Message-ID: <20200728083649.GX7191@Air-de-Roger>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
 <20200727150002.GS7191@Air-de-Roger>
 <d2a33851-10b3-a1c7-646a-96a0b5783923@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2a33851-10b3-a1c7-646a-96a0b5783923@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 27, 2020 at 09:50:23PM +0200, Jan Beulich wrote:
> On 27.07.2020 17:00, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 12:48:46PM +0200, Jan Beulich wrote:
> > Should the setssbsy be quoted, or it doesn't matter? I'm asking
> > because the same construction used by CLAC/STAC doesn't quote the
> > instruction.
> 
> I actually thought we consistently quote these. It doesn't matter
> as long as it's a single word. Quoting becomes necessary when
> there are e.g. blanks involved, which happens for insns with
> operands.

Could you quote the usages in patch 1 please then in order to be
consistent?

Thanks, Roger.

