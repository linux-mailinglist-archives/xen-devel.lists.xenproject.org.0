Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15778997A24
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 03:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815388.1229137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhuR-00064h-4K; Thu, 10 Oct 2024 01:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815388.1229137; Thu, 10 Oct 2024 01:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhuR-00062f-1G; Thu, 10 Oct 2024 01:24:07 +0000
Received: by outflank-mailman (input) for mailman id 815388;
 Thu, 10 Oct 2024 01:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhuP-000628-7k
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 01:24:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 550636e7-86a6-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 03:24:03 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172852343616523.218753719256938;
 Wed, 9 Oct 2024 18:23:56 -0700 (PDT)
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
X-Inumbo-ID: 550636e7-86a6-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728523437; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S1rLDm5/B/Cp7kb9mVt0r9KR9tV6ulJjX+jX+MT48ik1C56h/1+L5N8EiKZkGKLZ7cV9Dede2U329lwmFAEhlhJe11dLSxvcWo5Wpe/G4ak917D8S2VofN4diIa3ekLaVM/+Visi4p85c4ZdchxDaMHDdvwtxmNhijVuscXBwdI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728523437; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QD5ESB/A2wvgvwCwx6DM2684bku+W2dYkqybJ0YQ6So=; 
	b=AdDqIg5wEbEkZmdGNZnxGexISdAxB9asawy/UerQ7h1nYW2IRk83S2GCnilZTlS2sJIk8vftLHDQcD2D0DJO9wJLieFDJULPdDUMiC8j49BoolmR5nB1TSKPX/DTGHcqRAEbhnpzQJx9XiE7RGh5cYszRypzkxQlj7VZJhAx+UA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728523437;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QD5ESB/A2wvgvwCwx6DM2684bku+W2dYkqybJ0YQ6So=;
	b=UZRrVNV2Ty7qGrb150IrPXFLwyAvvFDZtCyKsIRdJqQFYMAC8CNIhJz3uc5zecCb
	6xKKS+F/Mv3+WyheoAutGietJ7es8KaMziKf1YAOz9SZ/d4OZmefrQixTnT0wLU5OHk
	6FYd7OlYGlWqpFZ5j0M0ASSHTLCxuksflaPWrfNQ=
Message-ID: <7949b6d8-4c5b-4af0-8c92-b56c8210f2e4@apertussolutions.com>
Date: Wed, 9 Oct 2024 21:23:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/44] x86/boot: add start and size fields to struct
 boot_module
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-13-dpsmith@apertussolutions.com>
 <cd3279a1-6339-43d1-bc5a-977f0e9ba2b9@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <cd3279a1-6339-43d1-bc5a-977f0e9ba2b9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:39, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> This commit introduces the start and size fields to struct boot_module and adds
>> a corresponding bootstrap mapping function, bootstrap_map_bm.
> 
> Which then is left with no caller. Misra doesn't like unreachable code.

Only until the upcoming commit makes use, but yes these should be 
standalone and thus complaint. I will rework to ensure there is a use of 
the function when it is introduced.

v/r,
dps

