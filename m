Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877841965AA
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 12:21:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI9VC-0007Kq-Hq; Sat, 28 Mar 2020 11:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8l4x=5N=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jI9VB-0007Kl-BU
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 11:19:45 +0000
X-Inumbo-ID: 06b9e238-70e6-11ea-8b31-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06b9e238-70e6-11ea-8b31-12813bfff9fa;
 Sat, 28 Mar 2020 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXYhuMZTCgXwHKGc8GMsAswZ73GuM2pCk02UFEvS35s=; b=JhavIqoyYBhenNUieZ910ZEdDC
 c/NYWmuhlk4ChfQAj9ZuXSwKO0QgT3jIlZCubnHPBS9LyPl7Im5dv5itRSDpOTnSjL/YUGfd3TWow
 0X5b35po+SyAr1FCPc8ZonjKlTWtBJx1xc3ZXpiNA32x4ygoe/at2Koh/IW+izo4m2DU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jI9V8-0008OU-Es; Sat, 28 Mar 2020 11:19:42 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jI9V8-0007x4-5L; Sat, 28 Mar 2020 11:19:42 +0000
Date: Sat, 28 Mar 2020 11:19:39 +0000
From: Wei Liu <wl@xen.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20200328111939.imm5t2v6ls5tktba@debian>
References: <27a883ea723d5d123cb3a10d2a6092ad54a6171e.1584485918.git.m.a.young@durham.ac.uk>
 <20200324023226.GK18599@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324023226.GK18599@mail-itl>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH] mismatch between pyxc_methods flags and
 PyObject definitions
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, "YOUNG,
 MICHAEL A." <m.a.young@durham.ac.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 03:32:26AM +0100, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 17, 2020 at 11:01:43PM +0000, YOUNG, MICHAEL A. wrote:
> > pygrub in xen-4.13.0 with python 3.8.2 fails with the error
> > 
> > Traceback (most recent call last):
> >   File "/usr/libexec/xen/bin/pygrub", line 21, in <module>
> >     import xen.lowlevel.xc
> > SystemError: bad call flags
> > 
> > This patch fixes mismatches in tools/python/xen/lowlevel/xc/xc.c
> > between the flag bits defined in pyxc_methods and the parameters passed
> > to the corresponding PyObject definitions.
> > 
> > With this patch applied pygrub works as expected.
> > 
> > Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
> 
> This looks like a change in Python 3.7 (according to the documentation,
> might not be enforced there yet). Python <= 3.6 allowed METH_KEYWORDS
> used alone. Fortunately, all the versions supports METH_VARARGS |
> METH_KEYWORDS, which looks to be equivalent to old METH_KEYWORDS alone.
> 
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Thanks. I added "tools/python" to the subject line and committed this
patch.

Ian, this needs to be backported to at least 4.13 since we started
supported Python 3 in that version.

Backport: 4.13

Wei.

