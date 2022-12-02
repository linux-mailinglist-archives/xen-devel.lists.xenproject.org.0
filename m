Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DF640829
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452019.709846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16fD-0005ix-CP; Fri, 02 Dec 2022 14:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452019.709846; Fri, 02 Dec 2022 14:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16fD-0005gf-9E; Fri, 02 Dec 2022 14:05:15 +0000
Received: by outflank-mailman (input) for mailman id 452019;
 Fri, 02 Dec 2022 14:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xAMo=4A=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1p16fA-0005fO-Ms
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 14:05:13 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 541fd5bb-724a-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 15:05:11 +0100 (CET)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1p16f4-0004D7-Vt; Fri, 02 Dec 2022 14:05:07 +0000
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
X-Inumbo-ID: 541fd5bb-724a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=c.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ndvOqqtb7/xEJJ/gOE8af9zXjM7HLrMx1PiTE6qEePc=; b=o5xq+JYRa0hs
	JpjQJEwLmuTwL8tvsD7lI8CZcu19BNUTHfNXwwnGGqIH4bhdrFDClUczcj9mdEsAsLoXenhkta0y5
	AzdX5r7YwqbK1Z1BYFImRI8yjYjBz72sq/K1FvPr8G4d7rsFxlkrMpdxoc/o+0bFA6qw/vdXVAeSd
	afWad0tvkCTWkZ2MLCDZJXjoJz8aaEA0yN1NlgitDee715w/7druSFsVImn1ot8bqfcUdvOSorDkT
	AhCqkAyKDngjhHsmfMJuAzsW6vzTdnanBOan9SM9jUQv5OPakOVGzXTiarpCIU1/s895OvCFnHqX8
	3ZyKSbw4Ear+nE+O5rPtXw==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25482.1554.910128.804488@chiark.greenend.org.uk>
Date: Fri, 2 Dec 2022 14:05:06 +0000
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Release checklist and qemu-xen-traditional
In-Reply-To: <AS8PR08MB79917D648261C9ADB5F8EB8A92159@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <AS8PR08MB79918A8115770DCF01863D7292159@AS8PR08MB7991.eurprd08.prod.outlook.com>
	<25479.27844.230855.996791@chiark.greenend.org.uk>
	<AS8PR08MB79917D648261C9ADB5F8EB8A92159@AS8PR08MB7991.eurprd08.prod.outlook.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/e7/e7ec394fc5bad70f9d03084a487df88f.pem

(Adding xen-devel to the CC list.)

Hi, Henry.  Pleaed to "meet" you.  To answer your questions:

> > > (1) Why do the instructions say to branch that repo?
> > > (2) Where can we find this repo?
> > > (3) Is this repo used anywhere since the 4.16 release?
> > > (4) Is this repo used elsewhere in the release process?

This repo is this one.  I think it is still used during some builds.
See this line in Config.mk:

  QEMU_TRADITIONAL_URL ?= http://xenbits.xen.org/git-http/qemu-xen-traditional.git

It is very old and we have been slowly deprecating it.  (The copy on
my workstation was called qemu-iwj.git for historical reasons which
aren't relevant, but that's how that got into the checklist.)

The release checklist will also instruct the release technician to
update the pinning in Config.mk to the tag.  For example, Config.mk in
RELEASE-4.16.0 says this:

  QEMU_TRADITIONAL_REVISION ?= xen-4.16.0

This needs to be updated so that people who get 4.16 don't get any
changes that are made to the "master" branch in qemu-xen-traditional.
The same will be true for 4.17, if it qemu-xen-traditional hasn't
been completely abolished there yet.

> > These instructons relate to my local clone of qemu-xen-traditional,
> > and will need adjustment.
> 
> Thanks for your reply! It would be good for you to clarify what adjustments
> we need to do. That said, I completely understand that you are quite busy
> today, so...

A clone of qemu-xen-traditional ought to do for this.  My tree here,
rescued from my old Citrix workstation, has this for the "origin"
remote:
  xenbits.xen.org:/home/xen/git/qemu-xen-traditional.git

I hope this is helpful.  If you want to talk through it some more,
ping me on irc.  I'm Diziet on oftc.  I usually lurk on #xendevel
(although I fell off at some point and only just rejoined), or you
may send me a private message.

Regards,
Ian.

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

