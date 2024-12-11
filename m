Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4FF9ED6E1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 20:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855298.1268280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSqK-0005dX-9N; Wed, 11 Dec 2024 19:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855298.1268280; Wed, 11 Dec 2024 19:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSqK-0005b8-67; Wed, 11 Dec 2024 19:57:56 +0000
Received: by outflank-mailman (input) for mailman id 855298;
 Wed, 11 Dec 2024 19:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLSqI-0005b2-N8
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 19:57:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3405db9b-b7fa-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 20:57:52 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173394706513489.6879956682427;
 Wed, 11 Dec 2024 11:57:45 -0800 (PST)
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
X-Inumbo-ID: 3405db9b-b7fa-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733947067; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ePy9CWlfLu5meR+GmYVtPGmH1wA2rX1YpPAqoFU5ssSW71SnencKFAhS2gGfzeJPnWZHxqfuDi3zZtK0x3ugNJyB7ZiN0BVDpDmZ4IST0UcHGwAMbAvD89JwrFYjS9zREek0Ft7q92LDV2qHzaGikT3KDWl9wpFOnmqQQbr1t8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733947067; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oOUBIxcz6spn5xEIpbInUoIhgQ+SLADcKx0oqmYW8yY=; 
	b=CoOzH0ubjodqmTz66ABEz0PsU4k27WtQbnRb34qxwN0liUiqsGppGXyrdSSdnrRlxUgKW5ENXXEQSdBEhqRi7zFP6OQdRgabqNG95z6pk0XN5rEfoPNwmVN/xMqYGLQRAxEsuyPJ8alJLbO1+HIT4sxPVmRBHRXDy/Y1KYJ2XDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733947067;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oOUBIxcz6spn5xEIpbInUoIhgQ+SLADcKx0oqmYW8yY=;
	b=nUFgdfRFOtOPx0nPfoxwUCM6YVS+RfAJ+1SEoWeAIlbtuKCR0UIK3XuzWvnRL1kd
	cQnTLX3F9ga4qX7N1I+NoF3uLJOC2dhOwLCKS5cd0Tbydtz8QaLKI9psmemKZYAV79V
	q4IOqTL9bb/bWpRPuo3JR0SLngezg+tY9Qgi65UY=
Message-ID: <71a9d5ec-f810-410c-81a8-92dc69ffabdd@apertussolutions.com>
Date: Wed, 11 Dec 2024 14:57:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Hyperlaunch device tree for dom0
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <40db3a16-0f02-4b9a-ac1c-8e237b32b006@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <40db3a16-0f02-4b9a-ac1c-8e237b32b006@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/25/24 19:11, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> The Hyperlaunch device tree for dom0 series is the second split out 
>> for the
>> introduction of the Hyperlaunch domain builder logic. These changes 
>> focus on
>> introducing the ability to express a domain configuration that is then 
>> used to
>> populate the struct boot_domain structure for dom0. This ability to 
>> express a
>> domain configuration provides the next step towards a general domain 
>> builder.
>>
>> The splitting of Hyperlaunch into a set of series are twofold, to 
>> reduce the
>> effort in reviewing a much larger series, and to reduce the effort in 
>> handling
>> the knock-on effects to the construction logic from requested review 
>> changes.
> 
> Having gone through this, I think you want to ensure that docs/designs/ 
> launch/hyperlaunch-devicetree.rst is updated with each patch adding a 
> property to ensure they stay in sync.

Ack.

v/r,
dps


