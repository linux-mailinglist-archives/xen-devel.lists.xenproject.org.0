Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EAF40C51D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 14:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187553.336457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQTtj-0005ZQ-6v; Wed, 15 Sep 2021 12:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187553.336457; Wed, 15 Sep 2021 12:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQTtj-0005Wt-35; Wed, 15 Sep 2021 12:20:19 +0000
Received: by outflank-mailman (input) for mailman id 187553;
 Wed, 15 Sep 2021 12:20:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uklH=OF=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mQTti-0005Wn-9w
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 12:20:18 +0000
Received: from mail2-relais-roc.national.inria.fr (unknown [192.134.164.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4819fa30-161f-11ec-b508-12813bfff9fa;
 Wed, 15 Sep 2021 12:20:16 +0000 (UTC)
Received: from nat-eduroam-36-gw-01-bso.bordeaux.inria.fr (HELO begin)
 ([194.199.1.36])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 14:20:13 +0200
Received: from samy by begin with local (Exim 4.95-RC2)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mQTtd-00FA9l-7I;
 Wed, 15 Sep 2021 14:20:13 +0200
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
X-Inumbo-ID: 4819fa30-161f-11ec-b508-12813bfff9fa
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A0bEInaoqM1KGkjgH0DbTKQkaV5oweYIsimQD?=
 =?us-ascii?q?101hICG9Ffb5qynOppUmPHDP4gr5NEtQ++xoW5PvfZqjz+8X3WB5B97LNzUO01?=
 =?us-ascii?q?HFEGgN1+bfKnHbdBHDyg=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="528588671"
Date: Wed, 15 Sep 2021 14:20:13 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] mini-os: xenbus: support large messages
Message-ID: <20210915122013.5fswso7poab5iyzq@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20210818152610.6114-1-jgross@suse.com>
 <20210914231742.pxpac2lhp2kk5ook@begin>
 <2304b885-434c-8a19-78e0-14637a4adee3@suse.com>
 <20210915112020.iy6vqn4qcvtbohyi@begin>
 <20e4fa88-74a8-35a0-dffa-fd5e5765fe0d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20e4fa88-74a8-35a0-dffa-fd5e5765fe0d@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mer. 15 sept. 2021 14:03:35 +0200, a ecrit:
> On 15.09.21 13:20, Samuel Thibault wrote:
> > So we really need to make the test after the rsp_cons update, like Linux
> > does:
> > 
> > > > Linux' code uses (intf->rsp_prod - cons >= XENSTORE_RING_SIZE), *after*
> > > > the rsp_cons increase.
> 
> Oh, you are right, of course. How could I overlook this?

One person alone will always overlook something, that's why we make
code review, to have several pairs of eyes check whether we may have
forgotten something :)

Samuel

