Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C686B27F72
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 13:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083340.1442970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umsqa-0004Vr-Ee; Fri, 15 Aug 2025 11:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083340.1442970; Fri, 15 Aug 2025 11:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umsqa-0004Sq-Bk; Fri, 15 Aug 2025 11:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1083340;
 Fri, 15 Aug 2025 11:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umsqY-0004Sk-Ob
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 11:43:46 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1978064e-79cd-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 13:43:45 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9dc55d84bso1445075f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 04:43:45 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a2231f6a0sm16714685e9.13.2025.08.15.04.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 04:43:44 -0700 (PDT)
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
X-Inumbo-ID: 1978064e-79cd-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755258225; x=1755863025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=46KruP2C9ZyuN3HowYFlaJL5UmOyGq3m48gy3Sr3B/U=;
        b=u4AskVu6Ui0yDBb2jDxH3sYEeWrOgoxexYpXT2vT8ZVkCL5dxZNbd1x6lshDhcFNqU
         cXwxbh+QX6HAZEa8wMfr7BT8te0SMf9ILh/nm9JC4cXEL2AeX51L/GyqerneTUEgWpHk
         AY52UrQj1OBelkiGr7ses2TnRtMa1b4dTYf6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755258225; x=1755863025;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46KruP2C9ZyuN3HowYFlaJL5UmOyGq3m48gy3Sr3B/U=;
        b=NMfWnko9m+ejkH/BI0Wy6qSpWQNxK2MhbvMznHu9qXEZ6+F89TGVlraBIMSbkGBVN/
         BJ6GGdkIhKVUauepKIriVrGfpZKNXUMkZqBIw0qoD5rCAx0UTBTzgXrHA6R47b1lxrUR
         YKp0UkGs5bG8dU4dZSCBspt8N/kowlXfHDkEAWsGWWKy9S0mGOhvdXPf9DFDzPy1wplo
         hBnpIpeJflsteIH29KsSFY5eA4wAf8iURMt7C3XSXUBOhZv0kyf+HSCxUHPHPg/ayCwK
         hDkxG4bZlgd3sqW0yd7+PQvVkTiQ9zGWmzKammjp9L6UDA94+fQbt26V7t599hIeOOH6
         aHVA==
X-Forwarded-Encrypted: i=1; AJvYcCVO7opq8RZ82E4EHvsT8hTSQoAIrNrH4qgvLtqzwrTr7RCt8eqqDepym/CTFuySiIhj393mnb/elwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlGvsKGl5N1oWtZevzYRujfip5ddZ7nZfbUgLSzzp69++l0nJO
	p7QGi0M5GOW13SZbZyOn9aBF6pIw3r3L0cSNheJTREftAfbl/e515iiizmsxMaqdBOo=
X-Gm-Gg: ASbGncssfS2IGemEARwgwf3sSRim1oeobsCKiBuJ/nQvHxrDtNbLtLyZ8rLuQVkXcXy
	4d+F7OPU/XEaM5NYzpKgfpXO+ZIRPOG2eXxRabhqXNG19NKN0Rr19E2ouAJwnWyswz8CwJFBM5L
	ukJqMxe+V2nlleYIb5hX1cMjW+yXPfh8fzOU+S+tFdcSzISz4ZbpC+JpUt8UBgqD/20rL5OFfOv
	nyymy+/320siPcnMIdTkALIUvwLOF95w06NvkOHCbQnrwLkGCtqpo+nbSHdritqRwG4+WJ/+bUy
	eE1GNGdL+4VnwopxF3RlXd2NbStKOZUSbJu4+CBMzX0Jv5qkzzN0TyajyDmUPrVdzE/IlTnB18N
	4lduzj8y44VjxudU4ipAlHidYzlNukiA7uA31pun0Iee3c8Yhy7qtoz7H4Nf0fX/TyXNE64s274
	b48vc=
X-Google-Smtp-Source: AGHT+IFnyT5f5/wW6SHmrzkVDEJYdRgnY0WIWLKTUlHMHLCuTaZ1MJLrgKsVMUIYMH+hb73DtGKeeA==
X-Received: by 2002:a05:6000:2210:b0:3b9:1443:aba with SMTP id ffacd0b85a97d-3bb669435bemr1277245f8f.9.1755258224776;
        Fri, 15 Aug 2025 04:43:44 -0700 (PDT)
Message-ID: <0a828038-69e4-4ffb-bc88-0359213ad878@citrix.com>
Date: Fri, 15 Aug 2025 12:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xsm/flask: add AVC pre-allocation boot parameter
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
 <37206bd7-b455-499a-9632-f435ab87888e@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <37206bd7-b455-499a-9632-f435ab87888e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 12:21 pm, Andrew Cooper wrote:
> On 15/08/2025 11:23 am, Sergiy Kibrik wrote:
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index a75b6c9301..9044827e78 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -238,6 +238,15 @@ loops for Queued Invalidation completions.**
>>  Specify a maximum amount of available memory, to which Xen will clamp
>>  the e820 table.
>>  
>> +### avc_prealloc
>> +> `= <boolean>`
>> +
>> +> Default: `false`
>> +
>> +Allocate XSM Access Vector Cache at boot. This forbids runtime dynamic
>> +allocation of AVC nodes from Xen heap and changing AVC size via
>> +FLASK_SETAVC_THRESHOLD hypercall.
> I don't have any input on memory allocation side of things, but this
> needs to be a sub-option under the existing flask=, and it looks like
> you're going to need to turn it into a comma separated list.
>
> Also, if you actually want to use Flask in a safety system, Flask needs
> to become security supported in Xen.

Sorry, sent a little too early.  x86's dom0= is probably the closes good
example to follow, having both comma separated booleans and a choice-of-$N.

~Andrew

