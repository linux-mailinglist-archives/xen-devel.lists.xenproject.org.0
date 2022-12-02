Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D7640AA9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 17:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452147.709956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p18rU-0000jL-P4; Fri, 02 Dec 2022 16:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452147.709956; Fri, 02 Dec 2022 16:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p18rU-0000hZ-LJ; Fri, 02 Dec 2022 16:26:04 +0000
Received: by outflank-mailman (input) for mailman id 452147;
 Fri, 02 Dec 2022 16:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xAMo=4A=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1p18rR-0000hT-Sx
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 16:26:02 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 010760c9-725e-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 17:25:59 +0100 (CET)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1p18rO-0001lJ-7Q; Fri, 02 Dec 2022 16:25:58 +0000
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
X-Inumbo-ID: 010760c9-725e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=c.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=J/cZp/UrAosgTtT+LBiXPS6IgdNnHrO5HzbozuydOFg=; b=DG7L9JpZKuxi
	it1DXEHY2iAm5MY3F6oJXU48hXC4MmX6d0EWPtqMBtm/4o4BN1yVa/bpMFkld0sfdYPs7phJ9VlHx
	2f3YWD4dZujTzsw86SLPyEnnTg0caMufO2oPuDCgLyF5ESCS0h1QajB8oI8iv0kkKn4oZ9uhBxp3P
	EzZwTB64EiBAmYkggRye/dOa1L8Mj2S640wnKqr49bRUQkBnxCKh+5ZeUFpEFn58OFxz5/exVFvM7
	b2p2HLSyF/p3JoX7h4WwyeMUAwgkCP4GjJEy5jvLqB7l5gtno78n++CnkPG1ZIU/ufIjFCDsOmoC5
	qBkBVWffCpRJ3GKK12cTMA==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25482.10006.140155.984629@chiark.greenend.org.uk>
Date: Fri, 2 Dec 2022 16:25:58 +0000
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>,
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Release checklist and qemu-xen-traditional
In-Reply-To: <AS8PR08MB7991236FE66DA48390C8E88E92179@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <AS8PR08MB79918A8115770DCF01863D7292159@AS8PR08MB7991.eurprd08.prod.outlook.com>
	<25479.27844.230855.996791@chiark.greenend.org.uk>
	<AS8PR08MB79917D648261C9ADB5F8EB8A92159@AS8PR08MB7991.eurprd08.prod.outlook.com>
	<25482.1554.910128.804488@chiark.greenend.org.uk>
	<AS8PR08MB7991236FE66DA48390C8E88E92179@AS8PR08MB7991.eurprd08.prod.outlook.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/e7/e7ec394fc5bad70f9d03084a487df88f.pem

Henry Wang writes ("RE: Release checklist and qemu-xen-traditional"):
> Although I am wondering if the instruction about qemu-iwj.git here:
> ```
> * make branch in qemu-iwj.git
>         git-branch $v-testing master
> ```
> 
> would be duplicated with instructions here:
> ```
> # make branches in xenbits.xen.org qemus
>         ssh xen@xenbits.xen.org
> 	cd ~/git/qemu-xen.git
> 	git branch staging-$v staging
> 	git branch stable-$v master
> 	cd ~/git/qemu-xen-traditional.git
> 	git branch stable-$v master
> ```

I confess I answered without looking at the instructions again myself.
I think you are right, and that branch instruction may be a duplicate.

Later, when it comes to tagging, you'll probably want to have a local
staging-$v branch in your working tree, so that the tag is in the
right place.

Ian.

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

