Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zX3RNGLRJ2pH2wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:40:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649365DE10
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:40:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GZV5aftZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1332489.1594929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrzf-0002a1-Eo; Tue, 09 Jun 2026 08:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332489.1594929; Tue, 09 Jun 2026 08:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrzf-0002XS-BR; Tue, 09 Jun 2026 08:39:31 +0000
Received: by outflank-mailman (input) for mailman id 1332489;
 Tue, 09 Jun 2026 08:39:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWrze-0002XM-6E
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:39:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWrzd-003Xuc-1Z
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:39:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27d126-5cb7-0a2a0a5109dd-0a2a4506a2f4-32
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:39:28 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27d140-7371-0a2a45060019-d155d02aa49b-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:39:28 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6870ad8072eso10436375a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:39:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf05208e897sm985367866b.25.2026.06.09.01.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 01:39:27 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994368; x=1781599168; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BiOxK0y5pGzEO1VbtSKq/weBFRiL9HFDUqdHpfgUP9M=;
        b=GZV5aftZMUmJABweWM7bNEj/izepWYYeuieCefTFE/FG44IWXj3g6lVZGvLW567xGu
         TrrZETkh2wUo3OP5ZNn+8pr9FwaRAiEuSJmUQvJ4INzfN0QoLYDDnru0dz5CqxCippbH
         20J+PuoKA4obTfGD9cBwzj+k7IdR8xK/QckI0jjWGvcL5JEM9PpUEk4JDHxyTcFyefBE
         mYGtkmABlwAqI6O/uTGuf/7vn2NNr2QJcWyXcwSnyXriFB1YTPQVk6zCtv7vSW1/zw83
         ZedFnhge3UY8ScWzcOmRmzPYXyvbeA5qJUX1+aOTNVwL5oHTsuzwgfyqf/jP6CQrgTuE
         NlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994368; x=1781599168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiOxK0y5pGzEO1VbtSKq/weBFRiL9HFDUqdHpfgUP9M=;
        b=Txjz2EVe9/es2KWLVuszvbxnMvfimcgoPozXpDORPEgYZqf3igXobZeGYoXfV9CKXH
         zdDAvrP+ZkphdqV8xTn8m6wjdEQEDT9gfNEgLDsV8XWb47FSsjKvBIHp2J/Y7+1xI7ll
         4a20R6h8FhVfg4igMd770ii7asgSQRGpAcWdiZFsWQPyVvUlqxXiioeXBlB3woWHpYNb
         iXJbtK4rccbOvDT+5odbInpvYZiclM0NI7QmgjOkdE+b+XXZJDYdHooF5CVcReOIPfOY
         TuEjO91dYm+sfx2MpfyOfzrnZuCqh3n6WXTmhMJkbAg7n7Pt43bMhIUcezljyB6hyVdT
         ZiVA==
X-Forwarded-Encrypted: i=1; AFNElJ/WiCnXmXnWT3GNtXxi7JpEhjI5pQKFTr8dETug/bFTrta+O3bM0gn00/SeFOyjE314sV7vUkXz9KU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCgr0FRMapjewdIVJIxVQY+TNrWA9BgMu1NTv7CXZI1goFK1lP
	Euuan6fQBljl8oJ/fJyf5ceEUFhoVG284EE7P+u6kqoYblfs7M+ak72I
X-Gm-Gg: Acq92OE1DLlfPfQCvZymppkj66WP09T4eni5MyOkDlBp4W8W0YpIm2PrzEo4NghZG1l
	Psxosy+lF7KG0cdj36qWQYlSEZWdXS3FdGNg6Uxjuogf5VvcwkErnHoclCDCos9e09TZUG3io4o
	EZjeFsYztdhLXhfzYxnWyq2urNtWdKg3MPPG5etJbzpUZ7EF5L7IBmTe/YItwLuPt1FTAlNXnZb
	PR4jectKuq+uus4RUdwtIDINRdQW6lD7rYLThVq81IIKUGsdyaBnOczPrMZYSIPzAgarOgIVHPT
	kynHU9FrLFRYwKJNe27uZUcfwZXdA8ENAoNfqMr/Ia3JJWGwgCaabgMzwZuyHxpHhKuvtdMzgXc
	/6a863Noy3nni7xBJYhe9QShJ1xc4topFvS4dLS0S8mE+7zqBu+NS2wbgC+h2x6s2Jo82YSNSFb
	/k1tGYat7sEjfXOEmGUrPx3OKi9NYoEhk+q8P7s85Kva8Fo21zhhlA5h1R7IofukKTOUI7EM6r4
	5E1bwwfzVLqaiE9HluECr1gUWk=
X-Received: by 2002:a17:907:1c83:b0:bf0:e345:68b with SMTP id a640c23a62f3a-bf3a8f1269emr806885266b.18.1780994368002;
        Tue, 09 Jun 2026 01:39:28 -0700 (PDT)
Message-ID: <a6a34826-e708-4475-8f59-bcc08e009ba5@gmail.com>
Date: Tue, 9 Jun 2026 10:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] tools/ocaml: silence
 ocaml_deprecated_auto_include alert
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: andriy.sultanov@vates.tech, anthony.perard@vates.tech
References: <1780990616.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b@vates.tech>
 <8167bcd5-c037-4f80-9f18-ce1082caea45@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8167bcd5-c037-4f80-9f18-ce1082caea45@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780994368-84566D75-85E15B89/10/73395122804
X-purgate-type: spam
X-purgate-size: 1512
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:guillaume.thouvenin@vates.tech,m:xen-devel@lists.xenproject.org,m:andriy.sultanov@vates.tech,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6649365DE10



On 6/9/26 10:24 AM, Andrew Cooper wrote:
> On 09/06/2026 8:36 am, Guillaume Thouvenin wrote:
>> Ocaml's lib directory layout changed in 5.0: the unix and dynlink
>> libraries have been moved out of the standard library directory into
>> subdirectories. The compiler still locates them automatically but emits
>> an ocaml_deprecated_auto_include alert when doing so.
>>
>> This patch sets the paths explicitly with -I +unix and -I +dynlink to
>> silence the alert.
>>
>> Signed-off-by: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
>> ---
>>   tools/ocaml/common.make | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
>> index c7eefceeb4..0e6714e25a 100644
>> --- a/tools/ocaml/common.make
>> +++ b/tools/ocaml/common.make
>> @@ -11,6 +11,7 @@ OCAMLFIND ?= ocamlfind
>>   
>>   CFLAGS += -fPIC -I$(shell ocamlc -where)
>>   
>> +OCAMLINCLUDE += -I +unix -I +dynlink
>>   OCAMLOPTFLAGS = -g -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -warn-error F
>>   OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
>>   
> 
> CC Oleksii.
> 
> For 4.22.  This fixes a build warning with newer versions of Ocaml, and
> also wants backporting to older trees.

You just pinged me when I started to look at the patch.

It look okay for me to have in in 4.22:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

