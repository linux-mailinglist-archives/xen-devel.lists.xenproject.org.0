Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2BD3188ED
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 12:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83822.156944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9mt-0007NA-O2; Thu, 11 Feb 2021 11:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83822.156944; Thu, 11 Feb 2021 11:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9mt-0007Ml-Kb; Thu, 11 Feb 2021 11:05:31 +0000
Received: by outflank-mailman (input) for mailman id 83822;
 Thu, 11 Feb 2021 11:05:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cmTu=HN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lA9ms-0007Mg-Fb
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 11:05:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daa49be3-fe1a-4567-8787-db69d8ba288c;
 Thu, 11 Feb 2021 11:05:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61C60AE65;
 Thu, 11 Feb 2021 11:05:28 +0000 (UTC)
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
X-Inumbo-ID: daa49be3-fe1a-4567-8787-db69d8ba288c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613041528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwIx6/+561xaswH9ZaAMNmCXpvb2vKxetk90b+uGPPM=;
	b=EvdAQVKUHpJL6h1yVYHmx0mRaIGYNyMj42iP9LEfeOnu7lvRZMnKZRmOvavjS5H6fnHxFG
	Ie8GRmoinKOQBse07M+9GLSxbKQyak+PirFV5kQ934ZjOyiZT0aLKkLpJncNpZ4ISiF+4W
	9wBg6dHWyBEC+2umfhoY+y2IGFM0Guo=
Subject: Re: Stable library ABI compatibility checking
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <22a01569-1ea0-bb87-eda1-1450d0229cf7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <816d28b2-df85-9259-de96-5a6654c8b341@suse.com>
Date: Thu, 11 Feb 2021 12:05:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <22a01569-1ea0-bb87-eda1-1450d0229cf7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.02.2021 02:08, Andrew Cooper wrote:
> Hello,
> 
> Last things first, some examples:
> 
> http://xenbits.xen.org/people/andrewcoop/abi/libxenevtchn-1.1_to_1.2.html
> http://xenbits.xen.org/people/andrewcoop/abi/libxenforeignmemory-1.3_to_1.4.html
> 
> These are an ABI compatibility report between RELEASE-4.14.0 and staging.
> 
> They're performed with abi-dumper (takes a shared object and header
> file(s) and write out a text "dump" file which happens to be a perl
> hash) and abi-compliance-checker checker, which takes two dumps and
> produces the HTML reports linked above.  They're both debian tools
> originally, but have found their way across the ecosystem.  They have no
> impact on build time (when invoked correctly).
> 
> I'm encouraged to see that the foreignmem analysis has even spotted that
> we deliberately renamed one parameter to clarify its purpose.
> 
> 
> For the stable libraries, the RELEASE-$X.$Y.0 tag is the formal point
> when accumulated changes in staging become fixed.  What we ought to be
> doing is taking a "dump" of libraries at this point, and publishing
> them, probably on xenbits.
> 
> Subsequent builds on all the staging branches should be performing an
> ABI check against the appropriate lib version.  This will let us catch
> breakages in staging (c/s e8af54084586f4) as well as breakages if we
> ever need to backport changes to the libs.
> 
> For libraries wrapped by Juergen's tools/libs/ common-makefile changes,
> adding ABI dumping is easy.  The only complicating is needing to build
> everything with "-Og -g", but this is easy to arrange, and frankly ought
> to be the default for debug builds anyway (the current use of -O0 is
> silly and interferes with common distro hardening settings).
> 
> What I propose is tweaking the library build to write out
> lib$FOO.so.$X.$Y-$(ARCH).abi.dump files.  A pristine set of these should
> be put somewhere on xenbits, and a task put on the release technicians
> checklist for future releases.
> 
> That way, subsequent builds which have these tools available can include
> a call to abi-compliance-checker between the authoritative copy and the
> one from the local build, which will make the report available, and exit
> nonzero on breaking problems.
> 
> 
> To make the pristine set, I need to retrofit the tooling to 4.14 and
> ideally 4.13.  This is in contravention to our normal policy of not
> backporting features, but I think, being optional build-time-only
> tooling, it is worthy of an exception considering the gains we get
> (specifically - to be able to check for ABI breakages on these branches
> in OSSTest).  Backporting to 4.12 and older is far more invasive, due to
> it being before the library build systems were common'd.
> 
> 
> Anyway, thoughts?

+1

Not sure about the backporting effects - tools/libs/ had quite a bit
less content in 4.14 and older, so the coverage would be smaller.

Jan

