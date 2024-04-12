Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8E8A2D83
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 13:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704558.1101011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFB3-0006Sy-Qt; Fri, 12 Apr 2024 11:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704558.1101011; Fri, 12 Apr 2024 11:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFB3-0006R7-OK; Fri, 12 Apr 2024 11:34:41 +0000
Received: by outflank-mailman (input) for mailman id 704558;
 Fri, 12 Apr 2024 11:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUrc=LR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rvFB2-0006R1-Fe
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 11:34:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a43b6449-f8c0-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 13:34:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712921669121388.98311949771437;
 Fri, 12 Apr 2024 04:34:29 -0700 (PDT)
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
X-Inumbo-ID: a43b6449-f8c0-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1712921671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UiPqfDZeVt7C2iA2DfDYCyseGw2J5tS4W5KVe2HEQZJf8IQxr7wiLId0EviYYzY0EnSbQzYj9saAZUamTAl7gfmmd8DiVxJgjRDd5Qlc0HjnM1H3srpbm2OJaDp/VLk4hDHSvsdpVHkS97Mjav5mVX8BxA2iZgkJ+H+XYp+7mqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712921671; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9TaWNEKeh2nl8tHY2/iJljIDnXmneDUINGPKaA4m2wE=; 
	b=GPdLQOp1crzB3O6p1hOCps7VJJGD/+F2juFF8zusZvFIpEruqDVL7KJ5Dqs8Ob8rHWBtLvyTxdEY4/wMFCrFGN7NbUbO/x3qeJexYcZ+6XmLCmE6f5oPm8Nixu4hURZRPFUlhxhlZFDLRjom70KaM60XaMtzdfmfaDIkLNBi+nY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712921671;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9TaWNEKeh2nl8tHY2/iJljIDnXmneDUINGPKaA4m2wE=;
	b=rc1MW54lDv5UmC9BiiQcUCa5Wb4rg3E+7q1oIu21NCsNFsRpjWJJAWpbLK1nbMIN
	98y/BAVJUf9J5OOtSCV7fEaqZtFNYd3M1YZuUlfbNhYNqM3S1KV8MY4ENvTw15wtL9Z
	ODg7GwasaFIwVtPhz0eEIudQuIXj9UeOsCdtBZag=
Message-ID: <c03b4f1e-f2c9-4f92-a369-b8afad56bc0b@apertussolutions.com>
Date: Fri, 12 Apr 2024 07:34:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
 <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/11/24 15:24, Andrew Cooper wrote:
> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>> index 1bcb007395ba..9b4891731b8b 100644
>> --- a/xen/common/gzip/gunzip.c
>> +++ b/xen/common/gzip/gunzip.c
>> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned long image_len)
>>   
>>   __init int perform_gunzip(char *output, char *image, unsigned long image_len)
>>   {
>> +    struct gzip_data gd;
>>       int rc;
> 
> By the end of this series,
> 
> Reading symbols from xen-syms...
> (gdb) p sizeof(struct gzip_data)
> $1 = 2120
> 
> x86 has an 8k stack and this takes 1/4 of it.  Other bits of state are
> dynamically allocated, even in inflate.c, so I'd highly recommend doing
> the same for this.

I take it you are mainly talking about crc_32_tab? Yes, I can switch 
that to being dynamically allocated.

> Also, could I nitpick the name and request:
> 
> struct gzip_state *s;

I have no attachment to names, so yes, I can switch the name.

v/r,
dps

