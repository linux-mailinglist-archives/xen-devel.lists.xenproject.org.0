Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8C0BA1627
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 22:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130861.1470221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1slI-0003Qi-Lr; Thu, 25 Sep 2025 20:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130861.1470221; Thu, 25 Sep 2025 20:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1slI-0003PB-Ia; Thu, 25 Sep 2025 20:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1130861;
 Thu, 25 Sep 2025 20:40:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCQs=4E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1slH-0003P5-7y
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 20:40:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf3a2833-9a4f-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 22:40:02 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b2ee3c13aa4so221032066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 13:40:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7806sm239149166b.70.2025.09.25.13.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 13:40:00 -0700 (PDT)
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
X-Inumbo-ID: cf3a2833-9a4f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758832801; x=1759437601; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXaUO2sQ3n/Q+JfDPL6ct2++ofgMqz7sXZdZYgJeZ6U=;
        b=Y8GzL0l36mK7rifv5RM7vv++vZJh5FHbCEs/UKyDwui/pKR+v4qKuqrrls2zFLvHHK
         L9etgsz8nyX/Bya/oVa/FKynxOyiWj3FHsrB07EPHD52/hItLI4R09Wi6QMzFV8sRO9e
         chcTv+rSskzJ1PM0Yqh7eZzJLp+uXsRRD4t5QKY4QXRpcZO0ML8MwAFe/O5qb05D5T7/
         CCy1ElqRgi6OpFXrPOfYk1LJbcDyW2ESaIus4rljAeOJopdLoaktWY8VY2JRC/Ji95CZ
         YxG7ivRpAeXyH4bvfClAHW5QWe2xel2a12mOw9f7M4+cHCBCXVj4RsDSfmaXel+xLC67
         cvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832801; x=1759437601;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nXaUO2sQ3n/Q+JfDPL6ct2++ofgMqz7sXZdZYgJeZ6U=;
        b=Ojp85Pq8SbD9cvDgY1z9HO8nzOJFxG23wKHCj68K9sWYjbr8QZN1LTpaJh9GPieCWt
         Q6Bu1zRTtnLVES6BLmOal3LLdPnxYnfL1T/Kw+Ex7e/zIdN7PWDNEA7/DUGjBC1DBaz6
         cU/Zq7OE6b+4fgzkNexzlFd9nN4RgKncP0Hwk7EQHYa3fZo7Cpb6HQmXLRQxJANRdTmK
         eiyf17kt6QH3Q25ccW5tLUrz9HnAgGWgqpeQEgBXZSXyrl1RxUc++Go2p8OzBOe3m/rY
         MxVUem04HNhnIcaSlWwg4zntfRn1khtoWDWBDCrIZKsGEKpXmJVNHBePFrrdzPZd/HNu
         Te0g==
X-Gm-Message-State: AOJu0YxKFhg8XYJkRhWzjxPsEJdeuFmPVnk6KeIHpZ6yFEsuofjbpHWn
	E3vL143LrVoc43be6Q3Rae9EMBufZwoYgfvlRVU6ezXn+GAgcwaspAnn
X-Gm-Gg: ASbGncu77Yud4VqiTe93wrTy7vu5LnBlJFg0HNG3hsuq9QkwzRZxc1PqZLn/nig3Xg+
	zFg7kadUVKBOhK9LTyNpmpfyhfiYJdWord1zUr6Kxd/4c0M26iQYSODCjV4o3esJvPmCdcZgFR+
	8EgvIP76nFpQnrCnp4EqJ9tAzv8Hm87EtmwbkwNWFPpJlPkaohn2FF0Dn2BmDjA/oRWNBKYeIPh
	tQTUvCHA8kYLVjvpSbZnCYKiMXJigCMIl7/1J8pARj/3KtUirO9b07yo1XV81Gl3PBQ4lIX0yjy
	q6va/+q0Iv8PA7rIzZI58+AC9wN3mmIW634uUDiSl4W+5ZJ+kUrjOpD1ANfUMaftqW584ctqxzA
	WQydCLYvNFXwv0cEhwwOxUIr0UDRtKwGXBEOQG4fA4jbAJivFrucS48yu/a3mr5WEACEkQext
X-Google-Smtp-Source: AGHT+IH557yebrMNF5LAESwPiXNFyyEHkixaUB8rRbQv9yvbVM0FUKYt6kv91y1ztIoLjLDzLVouzQ==
X-Received: by 2002:a17:906:4fcd:b0:b2c:dc13:89e4 with SMTP id a640c23a62f3a-b34ba147a90mr538291066b.9.1758832800941;
        Thu, 25 Sep 2025 13:40:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------GEgyVgrdSSmxrKd3BGf0Cp6X"
Message-ID: <c2e10aa1-2e01-4032-81f4-65a5e4542775@gmail.com>
Date: Thu, 25 Sep 2025 22:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH] symbols: discard stray file symbols
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
 <6fb3e095-172e-4cd4-8c26-60be6c5de704@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6fb3e095-172e-4cd4-8c26-60be6c5de704@suse.com>

This is a multi-part message in MIME format.
--------------GEgyVgrdSSmxrKd3BGf0Cp6X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/25/25 9:36 AM, Jan Beulich wrote:
> On 16.04.2025 11:00, Jan Beulich wrote:
>> By observation GNU ld 2.25 may emit file symbols for .data.read_mostly
>> when linking xen.efi. Due to the nature of file symbols in COFF symbol
>> tables (see the code comment) the symbols_offsets[] entries for such
>> symbols would cause assembler warnings regarding value truncation. Of
>> course the resulting entries would also be both meaningless and useless.
>> Add a heuristic to get rid of them, really taking effect only when
>> --all-symbols is specified (otherwise these symbols are discarded
>> anyway).
>>
>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> May I please ask for feedback here, so that hopefully we can have this
> sorted in 4.21?

It is okay for me to have this change in 4.21:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> Jan
>
>> ---
>> Factor 2 may in principle still be too small: We zap what looks like
>> real file symbols already in read_symbol(), so table_cnt doesn't really
>> reflect the number of symbol table entries encountered. It has proven to
>> work for me in practice though, with still some leeway left.
>>
>> --- a/xen/tools/symbols.c
>> +++ b/xen/tools/symbols.c
>> @@ -213,6 +213,16 @@ static int symbol_valid(struct sym_entry
>>   	if (strstr((char *)s->sym + offset, "_compiled."))
>>   		return 0;
>>   
>> +	/* At least GNU ld 2.25 may emit bogus file symbols referencing a
>> +	 * section name while linking xen.efi. In COFF symbol tables the
>> +	 * "value" of file symbols is a link (symbol table index) to the next
>> +	 * file symbol. Since file (and other) symbols (can) come with one
>> +	 * (or in principle more) auxiliary symbol table entries, the value in
>> +	 * this heuristic is bounded to twice the number of symbols we have
>> +	 * found. See also read_symbol() as to the '?' checked for here. */
>> +	if (s->sym[0] == '?' && s->sym[1] == '.' && s->addr < table_cnt * 2)
>> +		return 0;
>> +
>>   	return 1;
>>   }
>>   
--------------GEgyVgrdSSmxrKd3BGf0Cp6X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/25 9:36 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6fb3e095-172e-4cd4-8c26-60be6c5de704@suse.com">
      <pre wrap="" class="moz-quote-pre">On 16.04.2025 11:00, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">By observation GNU ld 2.25 may emit file symbols for .data.read_mostly
when linking xen.efi. Due to the nature of file symbols in COFF symbol
tables (see the code comment) the symbols_offsets[] entries for such
symbols would cause assembler warnings regarding value truncation. Of
course the resulting entries would also be both meaningless and useless.
Add a heuristic to get rid of them, really taking effect only when
--all-symbols is specified (otherwise these symbols are discarded
anyway).

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
May I please ask for feedback here, so that hopefully we can have this
sorted in 4.21?</pre>
    </blockquote>
    <pre>It is okay for me to have this change in 4.21:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:6fb3e095-172e-4cd4-8c26-60be6c5de704@suse.com">
      <pre wrap="" class="moz-quote-pre">

Jan

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
Factor 2 may in principle still be too small: We zap what looks like
real file symbols already in read_symbol(), so table_cnt doesn't really
reflect the number of symbol table entries encountered. It has proven to
work for me in practice though, with still some leeway left.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -213,6 +213,16 @@ static int symbol_valid(struct sym_entry
 	if (strstr((char *)s-&gt;sym + offset, "_compiled."))
 		return 0;
 
+	/* At least GNU ld 2.25 may emit bogus file symbols referencing a
+	 * section name while linking xen.efi. In COFF symbol tables the
+	 * "value" of file symbols is a link (symbol table index) to the next
+	 * file symbol. Since file (and other) symbols (can) come with one
+	 * (or in principle more) auxiliary symbol table entries, the value in
+	 * this heuristic is bounded to twice the number of symbols we have
+	 * found. See also read_symbol() as to the '?' checked for here. */
+	if (s-&gt;sym[0] == '?' &amp;&amp; s-&gt;sym[1] == '.' &amp;&amp; s-&gt;addr &lt; table_cnt * 2)
+		return 0;
+
 	return 1;
 }
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------GEgyVgrdSSmxrKd3BGf0Cp6X--

