Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A840E8A2D12
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 13:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704547.1100984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvElW-0007pb-M9; Fri, 12 Apr 2024 11:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704547.1100984; Fri, 12 Apr 2024 11:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvElW-0007nE-JS; Fri, 12 Apr 2024 11:08:18 +0000
Received: by outflank-mailman (input) for mailman id 704547;
 Fri, 12 Apr 2024 11:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUrc=LR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rvElU-0007n8-8o
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 11:08:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de9dbd06-f8bc-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 13:07:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712920048673584.3919028845842;
 Fri, 12 Apr 2024 04:07:28 -0700 (PDT)
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
X-Inumbo-ID: de9dbd06-f8bc-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1712920052; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gIBFZskeh/O+cGQ134h2m3kPYn7xX8Suxt7HoHZqxBiAzx7kggS3Q56SK9dcNIIdOv+4N6vKvN6mXONaLINUaFya4gnemvH0Z+Nat6TpgCxoYJvEuz1eluxFPz+yqEwPnrNUVx2GEup44zYaiS48rE02gLSfx8Y8VAGIv3G+cAw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712920052; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oBqIBmXmMqJh2iMf8HK6lFgI+SJYnURbur9shxMNSv8=; 
	b=Gjnw8DjaEQYbjNh8spuLdkOO3fzbzYcWY720935a8qrYWkU9rKwnWN0x/uqLz+v6vXDC0SyG14KQOUG0HJe9f46vdAxZYo84sftQmVMJgQ8WTRUT90Sr0K5UAxOulHNz6c5WWLfTy1XD8fIv4SRIVwe7UpOK2OOWGqq1d2ren+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712920052;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oBqIBmXmMqJh2iMf8HK6lFgI+SJYnURbur9shxMNSv8=;
	b=KyBQuMwduGNRv2NjlLAQTzh5L7ZHiMVrxVGLLAX1Zv/bCmZF/h4DNDiBmG406/Te
	JvEgfS6EeALf6mSeMNtcpnYrHJIrKK5ciyOn2FytVBQudGspuC5NcSc9SIHKylsHyZ+
	GCLOLPyHR6e83IjLZLP6+62z6w/Zbio6VZ5px8PI=
Message-ID: <2897b736-1a9d-4948-8e80-f018fd049bb8@apertussolutions.com>
Date: Fri, 12 Apr 2024 07:07:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] gzip: colocate gunzip code files
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-2-dpsmith@apertussolutions.com>
 <AA1FBA57-A643-4758-B99A-B59181B6329A@arm.com>
 <1552c28a-9c31-4771-94d1-20a51b2c641f@citrix.com>
 <8055E1FC-38DA-4534-BE04-F22AFC7B049F@arm.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <8055E1FC-38DA-4534-BE04-F22AFC7B049F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 4/11/24 15:43, Luca Fancellu wrote:
> 
>>>> create mode 100644 xen/common/gzip/Makefile
>>>> rename xen/common/{ => gzip}/gunzip.c (100%)
>>>> rename xen/common/{ => gzip}/inflate.c (100%)
>>> For inflate.c you will need to update also docs/misra/exclude-list.json
>>
>> Something like this?
>>
>> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
>> index 36bad9e54f7d..095636415897 100644
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -118,7 +118,7 @@
>>               "comment": "Imported from Linux, ignore for now"
>>           },
>>           {
>> -            "rel_path": "common/inflate.c",
>> +            "rel_path": "common/gzip/inflate.c",
>>               "comment": "Imported from Linux, ignore for now"
>>           },
>>           {
> 
> Yes indeed

Ack, will add.

