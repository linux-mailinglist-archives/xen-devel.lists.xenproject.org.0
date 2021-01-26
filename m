Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FA6303CB8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 13:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74937.134763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NFC-0000pc-Bw; Tue, 26 Jan 2021 12:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74937.134763; Tue, 26 Jan 2021 12:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NFC-0000pF-8g; Tue, 26 Jan 2021 12:14:50 +0000
Received: by outflank-mailman (input) for mailman id 74937;
 Tue, 26 Jan 2021 12:14:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4NFA-0000pA-L2
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:14:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4NFA-0005Vi-HK
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:14:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4NFA-0001oR-FV
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:14:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4NF7-0006bI-81; Tue, 26 Jan 2021 12:14:45 +0000
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
	bh=RvtMaX6I4/lwTQI1d1pqdAEWhlFJqQTF0Pl4YvXCE80=; b=63amINpzeWeGwQSFdL2kyftdZ8
	Ul3VdCAivNCg9Yb35aQCpl/rG2PXWytun/NIxFDoez+DO0L2Kl93OO2H8K9MlZNme8C2NEUVkBua9
	1owBlYkKQXLcwlPEDD56Icku/UWzma5xM/Gf4ED1H2/bnYPEUPCV51k5wJgK2kO21W5I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.1972.995045.683329@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 12:14:44 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    M A Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
In-Reply-To: <9f2e20ae-ab61-329e-9894-7c6b964edfbf@suse.com>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
	<24590.44019.51460.33930@mariner.uk.xensource.com>
	<d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
	<24590.52459.194044.857442@mariner.uk.xensource.com>
	<6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
	<24590.56183.458644.60628@mariner.uk.xensource.com>
	<6e988e9e-f8c2-13cb-79a4-1d8ae4e8a403@suse.com>
	<24590.61205.393750.544294@mariner.uk.xensource.com>
	<cd06d04f-f1c4-0087-b46e-34648585fb5a@suse.com>
	<24591.49.238509.216726@mariner.uk.xensource.com>
	<9f2e20ae-ab61-329e-9894-7c6b964edfbf@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
> Anyway - I guess we should continue from v3, which I hope to post
> later this morning.

Thanks, yes.  I just wanted to reply to one bit of this:

>   My initial attempt to avoid configure failing was to specify [] as
> the 4th argument. This, to me, would have felt the half-way natural
> indication that I don't mean anything to be done in the failure
> case, neither autoconf's default nor anything else. [true], otoh,
> already feels like a workaround for some shortcoming.

configure.ac is m4 input text.  In m4, missing arguments to a macro
are experienced within the macro definition almost identically to an
empty argument.  (There are some GNU-m4-specific facilities that make
it possible for the macro to tell the difference, but it would be
highly unidiomatic to do that for an autoconf macro like this one.)

So naturally [] would do the same as a missing argument.  It's
possible that [ ] would have worked as well as [true] (depending on
the levels of quoting etc.), but [true] is more idiomatic to me.  It's
the usual way of spelling an explicit no-op in shell.

Ian.

