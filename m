Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C9325007
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 13:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89716.169243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGDv-00065R-7t; Thu, 25 Feb 2021 12:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89716.169243; Thu, 25 Feb 2021 12:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGDv-000652-4N; Thu, 25 Feb 2021 12:58:31 +0000
Received: by outflank-mailman (input) for mailman id 89716;
 Thu, 25 Feb 2021 12:58:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFGDt-00064h-Nn
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 12:58:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7583606f-1264-4c4f-8fa8-34fe05f6ac94;
 Thu, 25 Feb 2021 12:58:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 133C2AF6C;
 Thu, 25 Feb 2021 12:58:28 +0000 (UTC)
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
X-Inumbo-ID: 7583606f-1264-4c4f-8fa8-34fe05f6ac94
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614257908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iz20/M6cyK40jMO3Qm/SHdJg/3GVnkpBIt8WOkrTV24=;
	b=Mp21WoumZ3STbY9aHAIUTVVTyKMwrZNiXDXnuRKhl4jEgpRmUzEhk7aJkzwfDtTfcemgJQ
	YvkoG2ui6j4lycD3nKJAnjdk2Mpmq1lNF8Wj15PqFEHL01aZjhKeQMa9bPZnhFmKLOIsG+
	RWVIKXNxJJ8mOTb4W9xVv4Gs3JTVuhg=
Subject: Re: [PATCH v3][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dbdb045d-42de-af94-64cc-0be7992b80b6@suse.com>
 <0e9b9e12-f3b5-971c-caf6-377c7c7c439a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bbc398d-f389-1155-68ca-348ebfe8dfe7@suse.com>
Date: Thu, 25 Feb 2021 13:58:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0e9b9e12-f3b5-971c-caf6-377c7c7c439a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 13:52, Andrew Cooper wrote:
> On 25/02/2021 09:30, Jan Beulich wrote:
>> --- a/xen/include/asm-x86/config.h
>> +++ b/xen/include/asm-x86/config.h
>> @@ -170,7 +170,11 @@ extern unsigned char boot_edid_info[128]
>>   *    Guest-defined use.
>>   *  0x00000000f5800000 - 0x00000000ffffffff [168MB,             PML4:0]
>>   *    Read-only machine-to-phys translation table (GUEST ACCESSIBLE).
>> - *  0x0000000100000000 - 0x00007fffffffffff [128TB-4GB,         PML4:0-255]
>> + *  0x0000000100000000 - 0x000001ffffffffff [2TB-4GB,           PML4:0-3]
>> + *    Unused / Reserved for future use.
>> + *  0x0000020000000000 - 0x0000027fffffffff [512GB, 2^39 bytes, PML4:4]
>> + *    Mirror of per-domain mappings (for argument translation area; also HVM).
>> + *  0x0000028000000000 - 0x00007fffffffffff [125.5TB,           PML4:5-255]
>>   *    Unused / Reserved for future use.
>>   */
>>  
>> @@ -207,6 +211,8 @@ extern unsigned char boot_edid_info[128]
>>  #define PERDOMAIN_SLOTS         3
>>  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
>>                                   (PERDOMAIN_SLOT_MBYTES << 20))
>> +/* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
>> +#define PERDOMAIN_ALT_VIRT_START PML4_ADDR(260 % 256)
> 
> 4.
> 
> 260 % 256 is pure obfuscation.

Well, that's why the comment is there. The expression is to
show why 4 isn't entirely arbitrary. But well, if there's no
way to get this in without changing to 4, I will of course do
so. Before I submit v4 - are there any other concerns?

Jan

