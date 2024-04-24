Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062188B102B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711587.1111648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfnL-0001us-HK; Wed, 24 Apr 2024 16:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711587.1111648; Wed, 24 Apr 2024 16:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfnL-0001sz-DJ; Wed, 24 Apr 2024 16:48:31 +0000
Received: by outflank-mailman (input) for mailman id 711587;
 Wed, 24 Apr 2024 16:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfnJ-0001st-G2
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:48:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e08bbd-025a-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:48:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1713977301596859.1966917487259;
 Wed, 24 Apr 2024 09:48:21 -0700 (PDT)
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
X-Inumbo-ID: 77e08bbd-025a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713977302; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iqNrq84hfWT3KgHfGF19FiujAybCbq0LsV4+8YqJOUR55bWzImmfm2HtCgZveRkkGXM0VLYWz8reFqOvaLURiQoThYhNp+SEeExZGVcPPGaNMYnQCtUlGNwEoNITczNQqlyND6X2yx1m1qQO7YOgMF0ML9kSEcdqRedDf5ovyOE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713977302; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yOpU1JsrRcgJjxB+nMXK3zIsvPX6deIuRZtXUB2NycY=; 
	b=nbSOwWDgWqLemIl5k6wIH8XfOruq1aefGLLjIdVDQshl8GpPl0cNtHElozrz92X0pshpPvPmX7oBCwl1hlhNPcZtQ564kN97V6ILP046U4fUGntqZOTMwLmYMPkpBvCgnSNWmyRsQ5aQ5QGcrv1d1QYjhtCdh+mOFNzBTgVr6P0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713977302;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yOpU1JsrRcgJjxB+nMXK3zIsvPX6deIuRZtXUB2NycY=;
	b=D2Q684rubovtvwsKIk7kc/ABRuZAxLIZoNRu7GKJdGsI3lwOefYBD19sChNtPn+O
	ElmLzXbZSjbAr+9c9xOsfaqFLUMerMTNWsWzKmbaPMPS3j/K/Suq8l7E9+KSOqsnr8v
	lLvPl8y+GmU0HqLr9MnB5/buBE+RhbsRtzz6BZqA=
Message-ID: <ce018324-582c-4f83-a7ca-94136f98a37a@apertussolutions.com>
Date: Wed, 24 Apr 2024 12:48:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Clean up of gzip decompressor
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/24/24 12:34, Daniel P. Smith wrote:
> An issue ran into by hyperlaunch was the need to use the gzip decompressor
> multiple times. The current implementation fails when reused due to tainting of
> decompressor state from a previous usage. This series seeks to colocate the
> gzip unit files under a single directory similar to the other decompression
> algorithms.  To enable the refactoring of the state tracking, the code is then
> cleaned up in line with Xen coding style.
> 

Forgot to add this comment to the cover letter.

Concern was raised about taking updates from original source to the 
code. In this case the original source is from the Linux kernel, which 
can be found in lib/inflate.c, and added to Xen in 2009. The last time 
there was a logic change to that code in the Linux kernel was in 2008, 
before it was added to Xen. Since then, it has only been updated for 
changes made to included headers. If fact, as far as I can see, while 
the file is still in place, nothing uses it. For zlib decompression, 
three is a new lib/zlib_deflate code base that is used. The scope of 
this work is not to completely fix/replace zlib decompression for Xen, 
but to stabilize it to allow hyperlaunch to decompress more than one 
zlib compressed kernel.

V/r,
Daniel P. Smith

