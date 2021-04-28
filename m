Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9036D8FA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 15:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119386.225850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkhG-0001jc-GH; Wed, 28 Apr 2021 13:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119386.225850; Wed, 28 Apr 2021 13:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkhG-0001jC-Cx; Wed, 28 Apr 2021 13:57:46 +0000
Received: by outflank-mailman (input) for mailman id 119386;
 Wed, 28 Apr 2021 13:57:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbkhF-0001j7-K2
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 13:57:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8b8683d-b589-4415-aebd-ca22cbe80d4e;
 Wed, 28 Apr 2021 13:57:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 152ECB195;
 Wed, 28 Apr 2021 13:57:44 +0000 (UTC)
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
X-Inumbo-ID: a8b8683d-b589-4415-aebd-ca22cbe80d4e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619618264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T6BD+5OjSCi9y551mCIhNBmZQEpHYMNCs4DI9SEOV34=;
	b=EgoEnfJ5URKrW4hSnrIgOa34b2ZDNKbt7HMJLdSNeK9LT9/U/JLJWfBqh5UlcrsWHVbI0v
	ihDQQZ/JwcOnFHOD5+eTrEOXR2Hxqs2OyexugvaASIjsJNcXXVzSSXK+iHfOYPzBaNCkhC
	mbKjNGDGcprL+V5Z+RF9Fh/u5RR6WQE=
Subject: Re: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
 <YIk8MYCeKi0eKkrg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0120aa9-f0f5-8756-d8e5-3190c2494618@suse.com>
Date: Wed, 28 Apr 2021 15:57:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIk8MYCeKi0eKkrg@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.04.2021 12:42, Roger Pau Monné wrote:
> On Mon, Apr 26, 2021 at 05:21:26PM +0100, Rahul Singh wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -20,6 +20,7 @@ config X86
>>  	select HAS_NS16550
>>  	select HAS_PASSTHROUGH
>>  	select HAS_PCI
>> +	select PCI_MSI_INTERCEPT
>>  	select HAS_PDX
>>  	select HAS_SCHED_GRANULARITY
>>  	select HAS_UBSAN
> 
> This list is sorted alphabetically AFAICT, and new additions should
> respect that.

Since this isn't a user visible option, perhaps it wants to be
HAS_PCI_MSI_INTERCEPT anyway?

Jan

