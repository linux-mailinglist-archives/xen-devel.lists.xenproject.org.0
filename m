Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1698405D36
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 21:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183512.331730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOPVT-0005RH-P0; Thu, 09 Sep 2021 19:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183512.331730; Thu, 09 Sep 2021 19:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOPVT-0005O1-LD; Thu, 09 Sep 2021 19:14:43 +0000
Received: by outflank-mailman (input) for mailman id 183512;
 Thu, 09 Sep 2021 19:14:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNcr=N7=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOPVS-0005Nu-Nj
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 19:14:42 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb8edbae-2c50-41c1-b71b-f62ca653c12d;
 Thu, 09 Sep 2021 19:14:41 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631214877401278.2502482860194;
 Thu, 9 Sep 2021 12:14:37 -0700 (PDT)
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
X-Inumbo-ID: cb8edbae-2c50-41c1-b71b-f62ca653c12d
ARC-Seal: i=1; a=rsa-sha256; t=1631214880; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j3L5o5aeeznB4XNecWft0aEDbtDi1ivmqKg28WFHnrepXkKlnTXP5pFhYlOpCahd/8tR32XkK/TDTHzFtqW4jBArczQvmhWXIpAA1Bv/EoOyA4cM+Lw7bOddkCJu5uyOKJ+FIa6YCEChn2cmNFjcWkNkRGovDghpkR0ZjbXfQnA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631214880; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ODeFCicDvawAcTinn7/rak3JqgqM+ZCyMPqIlQYJDjY=; 
	b=hkKtfQXbJwjMKm6df8JMTr04vGm+nAKXnwRSXIIj/lfam5hkWoGgj8tMLjZXXaG7x9rvTLz9S86acNN/9/p9199jnCRADghNXxE+b1uzxq8w5YdPlDRdrZorHi8q8a3ugTpgBTlKeBWMOEiIncCcQWpJkrRhAIvdJcMTLAFLApo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631214880;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ODeFCicDvawAcTinn7/rak3JqgqM+ZCyMPqIlQYJDjY=;
	b=KxtBCGmru/LmPtO9sh7i3B3nU/6+DzinpkhmIQ6u4y82skSnPew5Q9uteofseSoT
	Kj/25swEQlI+4VzzqzqrPnZyYGq2vWlLX6rI1rUXyPgV4gzy7ee/c98tcYqpHBYkbV9
	XyYr9nLM2aBJCYoSUZEgQwFVZlE+O85cKQ0CwzAg=
Subject: Re: [PATCH v4 09/11] silo: remove circular xsm hook call
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-10-dpsmith@apertussolutions.com>
 <8d7824e1-3c7d-c0c5-f3ad-0644d4c49e07@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <0ad0d8a9-5f9a-dfb0-51b9-c19e4f4dc5aa@apertussolutions.com>
Date: Thu, 9 Sep 2021 15:14:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8d7824e1-3c7d-c0c5-f3ad-0644d4c49e07@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/9/21 11:45 AM, Jan Beulich wrote:
> On 03.09.2021 21:06, Daniel P. Smith wrote:
>> SILO implements a few XSM hooks to extended the decision logic beyond
>> what is defined in the dummy/default policy. For each of the hooks, it
>> falls back to the dummy/default policy. The fall back is done a slight
>> round-about way. This commit makes the direct call to the default policy's
>> logic, xsm_default_action().
> 
> Again it's not clear to me what you're finding wrong here. The way it's
> done is not as direct as it could be, but going through the extra layer
> allows the functions to document things at the same time. You lose not
> only that documentation, but also ...

It is only for six calls, thus I figured the slight overhead would be
worth cutting out the indirection. If now one is worried about the extra
indirection, than I can adjust to call the default's handlers.

