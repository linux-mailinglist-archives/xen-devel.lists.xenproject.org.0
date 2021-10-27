Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A837943C6D0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216811.376550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffZ3-0000rc-LF; Wed, 27 Oct 2021 09:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216811.376550; Wed, 27 Oct 2021 09:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffZ3-0000p0-I7; Wed, 27 Oct 2021 09:49:45 +0000
Received: by outflank-mailman (input) for mailman id 216811;
 Wed, 27 Oct 2021 09:49:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mffZ2-0000ou-7c
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:49:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mffZ2-0000Iz-2z
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:49:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mffZ2-0007Zj-0Z
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:49:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mffYy-000740-5u; Wed, 27 Oct 2021 10:49:40 +0100
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
	bh=lKNn9nVcf2yNauEfyMR2FCQ4Wfr9soC5sSBQNxOgQj8=; b=q7B/H4zVrZMILwzMiXvJ1xxevM
	4wv0mfN5JNzn4IMIhCDszJkcziXgHAb0D1GFNHXriecPenUEaao6LV1Vu7yO9b5Ypxbx2Z6FIr+p/
	bPDZ+gCBfssln/nWkN0q6dNU/jTTGNc1ZI4JlqpAqDV+9Hdce8y9iSOl4jYLYZgoi7g4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24953.8371.554610.857382@mariner.uk.xensource.com>
Date: Wed, 27 Oct 2021 10:49:39 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hpet: setup HPET even when disabled due to stopping in deep C states
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20211026151233.57246-1-roger.pau@citrix.com>
References: <68352fc1-9ba0-1081-be50-065b212f96a3@citrix.com>
	<20211026151233.57246-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH] x86/hpet: setup HPET even when disabled due to stopping in deep C states"):
> Always allow the HPET to be setup, but don't report a frequency back
> to the platform time source probe in order to avoid it from being
> selected as a valid timer if it's not usable.
> 
> Doing the setup even when not intended to be used as a platform timer
> is required so that is can be used in legacy replacement mode in order
> to assert the IO-APIC is capable of receiving interrupts.
> 
> Fixes: c12731493a ('x86/hpet: Use another crystalball to evaluate HPET usability')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

