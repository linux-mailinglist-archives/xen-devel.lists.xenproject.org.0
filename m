Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08D32B918
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92902.175180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU5K-0007oh-Rb; Wed, 03 Mar 2021 16:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92902.175180; Wed, 03 Mar 2021 16:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU5K-0007oI-O7; Wed, 03 Mar 2021 16:10:50 +0000
Received: by outflank-mailman (input) for mailman id 92902;
 Wed, 03 Mar 2021 16:10:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU5J-0007o9-8H
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:10:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU5J-000426-7X
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:10:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU5J-0005iX-6j
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:10:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU5F-0002Vy-Sj; Wed, 03 Mar 2021 16:10:45 +0000
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
	bh=C1Fqyb7V7hJSUZYOzcyx0OltK1CH/43qR6Zd9Ejy3fw=; b=dVe6fQUubGyYSDCMuWVsMBKb57
	qF83nVtQgpYGvX/5sa23RbCa8HiMsynT6NlMjyvmoqqjtl+42yrqERuxMHZSbK3a1YAyF0cWSCQTH
	ChIlMhyRKtHqfILZDeYUs3hXzK52acV1nhO87Yl8fF8PNQbDzeS8t8MQsd7B2uYBJvqk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46341.638952.338740@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:10:45 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: [PATCH XENSTORE v1 05/10] xenstore: handle daemon creation errors
In-Reply-To: <20210226144144.9252-6-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-6-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 05/10] xenstore: handle daemon creation errors"):
> In rare cases, the path to the daemon socket cannot be created as it is
> longer than PATH_MAX. Instead of failing with a NULL pointer dereference,
> terminate the application with an error message.
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.

Again, not for 4.15 I think.

Ian.

