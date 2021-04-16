Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79462361ABA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 09:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111595.213451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXJ8k-0008KJ-2G; Fri, 16 Apr 2021 07:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111595.213451; Fri, 16 Apr 2021 07:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXJ8j-0008Ju-VX; Fri, 16 Apr 2021 07:43:45 +0000
Received: by outflank-mailman (input) for mailman id 111595;
 Fri, 16 Apr 2021 07:43:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXJ8i-0008JW-Bd
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 07:43:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e93b783f-5f54-4c01-b8b6-1244e27e2afc;
 Fri, 16 Apr 2021 07:43:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D20B9AEC6;
 Fri, 16 Apr 2021 07:43:42 +0000 (UTC)
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
X-Inumbo-ID: e93b783f-5f54-4c01-b8b6-1244e27e2afc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618559022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbhUFvMxmVRl+ja1apV7tD9GarBYF9Mcgz2qXZWu/hQ=;
	b=CsDtoHMHqNay1eJXdemleFq889NkmJC6u+oBwg2xXoMd96KNgtuhz+EKygcqo1GIwsKWJ1
	ChW0stULj2UZQaeV8CyqK41QsewUY5v8DJe7ujQOcaMYXh5hGKZLaou/I0AOuUrARIqUyk
	8HK2jo4NtSce58hI0FuXLqOGies5Xpo=
Subject: Re: [PATCH 0/2] x86/shadow: shadow_get_page_from_l1e() adjustments
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
 <YHhliTZoR/UxpPn2@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5078494-f492-5734-2c34-9410cdb2aed8@suse.com>
Date: Fri, 16 Apr 2021 09:43:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHhliTZoR/UxpPn2@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 18:10, Tim Deegan wrote:
> At 13:46 +0200 on 12 Apr (1618235218), Jan Beulich wrote:
>> The aspect of the function the second patch here changes has been
>> puzzling me for many years. I finally thought I ought to make an
>> attempt at reducing this to just a single get_page_from_l1e()
>> invocation. The first patch mainly helps readability (of the code
>> in general as well as the second patch).
>>
>> Note that the first patch here takes "VMX: use a single, global APIC
>> access page" as a prereq; it could be re-based ahead of that one.
>>
>> 1: re-use variables in shadow_get_page_from_l1e()
>> 2: streamline shadow_get_page_from_l1e()
> 
> Acked-by: Tim Deegan <tim@xen.org>

Thanks. Any thoughts on the shadow part of the prereq patch mentioned
above?

Jan

