Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266434464B5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222408.384579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizyw-0004uB-6z; Fri, 05 Nov 2021 14:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222408.384579; Fri, 05 Nov 2021 14:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizyw-0004r4-3P; Fri, 05 Nov 2021 14:14:14 +0000
Received: by outflank-mailman (input) for mailman id 222408;
 Fri, 05 Nov 2021 14:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJNx=PY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mizyu-0004qy-CS
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:14:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5169c06-3e42-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 15:14:11 +0100 (CET)
Received: from [172.20.51.40] (50.216.66.194 [50.216.66.194]) by
 mx.zohomail.com with SMTPS id 1636121646415664.9324363814346;
 Fri, 5 Nov 2021 07:14:06 -0700 (PDT)
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
X-Inumbo-ID: a5169c06-3e42-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; t=1636121648; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dm6iLrZyJuJ6LXB7iTxbow8qCxCxP05Kwruvp6qhovwE+1+DewgAM5n+3RfEYM+o1t21XrFjSCAPvAZ6xkUkakyvcDTiDyG+C9GhpAlGvQc6SjKqXG25vnOANQHp/9XCmWfNAQ22zpCxNp+MUsCe2nUDkL/iznUmsTDZlMJFaXY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1636121648; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=0AKKwH1oqvQxqu1OBKQOXJgoSAmhgOiLDohjGsZITb8=; 
	b=gn55JsHsvWPkBAAKOl1/LcPMKvoLXwlKN+c9X62zt72YYyeipJ7Qay94X9T/o50Q2cuac0fMmkFG4zmQCVUF1Wdk+k7lbYPEiLJgafWJyC6MWi9qahGR2H8zGR4VXqJJamHuCytWozlHgxkTjBKnix6VFmRhLoBKc7DhzR1tvj8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1636121648;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0AKKwH1oqvQxqu1OBKQOXJgoSAmhgOiLDohjGsZITb8=;
	b=k++mu7XXnEdMze2rmHriijhZpqiLZp+HlAkHsXYkpGZFDVQDapx/F0BD1ZHTWq4L
	LpvyW5crbUS7iCKTwKiiQgTMN5TX7+fieZfLprcfx5BxPEPImnIWde7w91xCPRpQfqd
	OHew3zWZXqb3BZfbtUiAVM0wET2oqnmDtk8WOE3M=
Subject: Re: [PATCH 2/5] xen/xsm: Complete altcall conversion of xsm interface
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-3-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <dbcb19c6-3b21-46ac-dbba-4290fb21676d@apertussolutions.com>
Date: Fri, 5 Nov 2021 10:11:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211105135555.24261-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/5/21 9:55 AM, Andrew Cooper wrote:
> With alternative_call() capable of handling compound types, the three
> remaining hooks can be optimised at boot time too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> 
> I'm on the fence as to whether to declare this as fixing "xsm: convert xsm_ops
> hook calls to alternative call"

I don't know about fixing but completing was accurate. I am fairly 
certain in one of the incarnations of the patch set there was a comment 
identifying that these were left remaining since compound types were not 
supported by altcall.

Regardless,

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

v/r,
dps

