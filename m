Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE59AE9EC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825401.1239619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zTf-0006gC-EI; Thu, 24 Oct 2024 15:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825401.1239619; Thu, 24 Oct 2024 15:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zTf-0006dt-Ai; Thu, 24 Oct 2024 15:10:19 +0000
Received: by outflank-mailman (input) for mailman id 825401;
 Thu, 24 Oct 2024 15:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQmA=RU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3zTe-0005Eo-5I
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:10:18 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 131d92d2-921a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 17:10:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729782610624950.495973368562;
 Thu, 24 Oct 2024 08:10:10 -0700 (PDT)
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
X-Inumbo-ID: 131d92d2-921a-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729782612; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QgJa2RusdGoPNNsn1m+pnaYG6PBS3v+6ovj95AjNg9HLYBaTYPfQngbJ42Th+kWCST+6upeX2bnnGICD2jv9+dM47sVULjPnhV6hF0afetRXj+oqGsej4J68xmG4DrsgvGe2NlHWchn28qub/YXIdl09lGYYiJhl1a3GxjIFd1U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729782612; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pyo69ORJ440As5EWbOfx2/6qDjh5nZirj38C/FfCvAI=; 
	b=ef4Q377SCJpXQ8OYrPiQPF4h3aEVp/TDMbhX9rGOGTWVzniYiEWKGsk/VyjLx/6XUd4gbUgaG0aoptNo74AoQ7JpJHG8c+f5p5AqyaWDcwVyT7J1Je9jtpvryNGJMkbdxgG6Lmt+ubhyZVXzW0jz23+d67A/OTUMlI8+4/bSMNs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729782612;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Pyo69ORJ440As5EWbOfx2/6qDjh5nZirj38C/FfCvAI=;
	b=MZPriIRglCsnyLRJu59I3ARV5zHZdNLtzKvsXmc11RQ0BL3hhVYDQhJZ4HbmzMb+
	qYKrhOny4RvYQvjgJZ6qjfJrwByn5dUwvMUOTZMVcq1y6cPmAtoHaS7rkVoYyZ+KrRF
	lo1CdSqvJQZudUivYWuxVxXJaysEw/c6YooFNsrg=
Message-ID: <74f65fc9-be43-499c-b22c-d5364b887208@apertussolutions.com>
Date: Thu, 24 Oct 2024 11:10:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/boot: Introduce bootstrap_unmap()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
 <20241024142654.989980-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241024142654.989980-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/24/24 10:26, Andrew Cooper wrote:
> We're about to introduce alternative mapping functions, and passing NULL was
> always a slightly weird way to express unmap.  Make an explicit unmap
> function, to avoid having two different valid ways of unmapping.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

