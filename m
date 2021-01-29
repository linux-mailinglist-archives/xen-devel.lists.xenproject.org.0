Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7D308BD0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 18:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78390.142635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Xp7-0001JT-5C; Fri, 29 Jan 2021 17:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78390.142635; Fri, 29 Jan 2021 17:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Xp7-0001J4-1p; Fri, 29 Jan 2021 17:44:45 +0000
Received: by outflank-mailman (input) for mailman id 78390;
 Fri, 29 Jan 2021 17:44:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5Xp6-0001Iz-61
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 17:44:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5Xp6-00030G-3m
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 17:44:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5Xp6-0005jT-1y
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 17:44:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l5Xon-00085h-Ub; Fri, 29 Jan 2021 17:44:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=EJ6k+np03F91sKEQ1mWf9w/XQ10/f67qaeEg2xhOq0A=; b=MVS1Wv95R3bD8wWNiepoOTFsdt
	glVIZo8U8ML8EMQStkT+mC/pWW0L4zzR3v8N8XwAt7TJotzHk/bR4l7lUSOqZumsjryzW7a7Q2qVP
	o3Bjfv10P86griAbiX2n8R+OGZkE0kNX6UgUczx0kQfvCOjFC1tK5sBEptGSOMhPQAAE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24596.18809.727043.409563@mariner.uk.xensource.com>
Date: Fri, 29 Jan 2021 17:44:25 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    George Dunlap <George.Dunlap@eu.citrix.com>,
    Ian Jackson <iwj@xenproject.org>,
    Stefano Stabellini  <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Julien Grall  <julien@xen.org>,
    Paul Durrant <paul@xen.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
    Tamas K Lengyel <tamas@tklengyel.com>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <94faed88-5323-a6a2-6627-4ef3a6a07d78@suse.com>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
	<20210112194841.1537-2-andrew.cooper3@citrix.com>
	<6321bce7-1826-be38-622e-088d492fb0c9@suse.com>
	<a96bed35-df20-e77b-1b98-593aa5649ad9@citrix.com>
	<57895dd4-10c7-18cb-bc44-25a45cb688a7@suse.com>
	<d85313ae-295e-d3d1-f041-67d6814b959c@citrix.com>
	<94faed88-5323-a6a2-6627-4ef3a6a07d78@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition"):
> Anyway, I'm not going to further comment on any of the below.
> I'm not going to either ack or nak this change, so if you
> have the agreement of others feel free to put in.

This patch,

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

