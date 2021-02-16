Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764D31CFD2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 19:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86015.161040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4if-0004px-Ay; Tue, 16 Feb 2021 18:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86015.161040; Tue, 16 Feb 2021 18:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4if-0004pY-7Q; Tue, 16 Feb 2021 18:05:05 +0000
Received: by outflank-mailman (input) for mailman id 86015;
 Tue, 16 Feb 2021 18:05:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4id-0004pT-Ns
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:05:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4id-0006B6-LM
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:05:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4id-00026J-KO
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:05:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC4ia-00014T-GV; Tue, 16 Feb 2021 18:05:00 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=z+ZPSMf938mJ4x62YBWP/JOKWCZStOwFzCP7XTqj4CM=; b=fC/fO8IHjiMhiOH+pS1PtwBGAU
	ZtxMLaMmHg3gnd5Nf6oTDPDdiaNjnzNFg8DepbBnveLAlgdwXqNY7tVujAgXq0AeXwCF1mORbxZeN
	GMb6ZxI10j51m2LRrHD7+GOp1py/z5L7FxA+kwYgjK0+1SLyApQy1GDz3XVFbrBnmpuc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24620.2380.253008.883244@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 18:05:00 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()
In-Reply-To: <24620.1955.243860.253052@mariner.uk.xensource.com>
References: <20210212153953.4582-5-andrew.cooper3@citrix.com>
	<20210216174327.8086-1-andrew.cooper3@citrix.com>
	<24620.1955.243860.253052@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH v2 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()"):
> Uhhhhh.  I think this and the other one seem to be stray hunks which
> each introduce a new uninitialised variable bug ?

I now think (following irc discussion) that I was wrong about this.

Use of intended_uid is conditional on user being set.  This is very
confusing.  This code is simulating a sum type.  If only we had sum
types.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

I think, given how confusing this is, that I would like another
careful review before I give my release-ack.

Ian.

