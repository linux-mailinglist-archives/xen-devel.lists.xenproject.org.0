Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC129C8DAD5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 11:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173714.1498726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYrZ-0000ML-OR; Thu, 27 Nov 2025 10:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173714.1498726; Thu, 27 Nov 2025 10:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYrZ-0000JA-LH; Thu, 27 Nov 2025 10:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1173714;
 Thu, 27 Nov 2025 10:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOYrY-0000J3-2p
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 10:04:32 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7716addd-cb78-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 11:04:30 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b762de65c07so96747466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 02:04:30 -0800 (PST)
Received: from [192.168.1.17] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5162c5csm126368966b.6.2025.11.27.02.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 02:04:29 -0800 (PST)
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
X-Inumbo-ID: 7716addd-cb78-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764237870; x=1764842670; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4raARQItkJX3V6w1QGL5CRr+ynlo0pbCjQ56QUUkYac=;
        b=MLNkfiEUSAZGAnU79JFN+bIx1IYC3xEG76FV3TpKLrIpGVnvgHTXZPWjTZWuALNQqP
         hGrkqEtOvDgn316DVJwtkhtdcUZzSd64Bm55vk75eJBX9uYuSiu3b2KPWhyw6StZXE8u
         XPXogEj70qsqKKbll2iVetVfkvmZf2xWXoXnXFjUtwS9Jedyb0Ijkv3/Ny3s7rEkItWF
         54qojr+IcIU9gQXQtQKaBBwnzcrgs3xydK+GmWwubhtKLo7H4W9LSCMQTtjsP7mL0P5l
         9qfd8SBnN0p0r2FtAIkVhrJADBusqSeW2Nci1ojX0qBruWbWHioTpplp5G3n+YbN3j3T
         HdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237870; x=1764842670;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4raARQItkJX3V6w1QGL5CRr+ynlo0pbCjQ56QUUkYac=;
        b=tVs8wmEbT5GjPSDSX8/SkKNCuAxCtlRgJEeP9w1qutX8jzni5iRldrd8Sfd3lD//96
         tgLL2fG7VWw25ueMrvE5Z9Tm+sgfrgUSfvj10pfCrOhDFRTZONdT+23+obR2OpPNWPYc
         CLPcz01H97jA0TWgwV4Yrkv+hqWwtRI7k16CJ5CAR9C5RJwrwnB8mlqqwpAGBTMZ9Any
         7I83mWpu0jOlnckF9+1cgG4nMBYiZKmQCzzVqjNPeGquUjFc9NaCGMytVHP4oZLkzihA
         jFAl38GmE7St17lqIdR0oZ7TjpaSaUhUjRZmjrcu1+MXBWO5I2X4oHvUe6FkyluhjhS9
         Jqsw==
X-Forwarded-Encrypted: i=1; AJvYcCVT0VkPJWcrXXnoKAt8CSQlJyyGhEFS6W/3/qtx/w2sTZNVJvb8ajp4QwznuoaK++PrafJCQnVtpZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh8Q3Yo3w5CQeysHNup7I6uwo975Hw4nzHW+PwAplXEHRAlCUk
	CH9ER01KkRZ3uvWQ8/JFImaGTfbHfv3gCQoqwx67WAbCl0L4vI4hyTaF
X-Gm-Gg: ASbGncscdo3g4mPkdd/jBzEJl13VB3ZdMPGZfEnTqACaq6uKPbLeCZK3wxTDYWvXtzc
	toxQiBP/ut2Gg7JZfnk8S3YbD/OZ4PReRihFeqgRtgQdlAIROGBEstlCHJO+7SdwALd+rdfJXRA
	cHmTq/ehy+BF0T1f9GBtZGGqNQPKIjX/i7DkkVnfgYzqw0fqwio3DshAQpTN0I0bo5W/5qO8KTq
	pPsxlYIO6RM1KvApNP8ykjdE1gFySh31oggsCThp2auUzJ5iXg9MI6trKfeG0AC0Xlp3QzlPNul
	NFqOdIOn3wKvLpvHzOfTlCTpxTqH7IGRTlIX5xm85246jBZMooBjDPnJRtkKUjbc3z/tCXNGHHb
	KtoIowfzWFju5BmyPZ5bDPCalzSRE9Vv8VGNEp6HSyWcNvM7kL/nu0PlrfvKV7e6ucMzNCBZjM6
	33UF8R/c4D7Y4B4dA9hBN0/NYhHfxuGcLyPi0HqR9h9UYIkZeP5qTliRvM7bzdEH03Gg==
X-Google-Smtp-Source: AGHT+IHPso+P3vV9V6n0v/TYDYxBW5i4WX+1Q1rjL+EE143pJLsgdIGVLnvLF9UeMAWBwNkeFFk95A==
X-Received: by 2002:a17:907:3d89:b0:b73:9a71:13bb with SMTP id a640c23a62f3a-b76c55f3e48mr1108823766b.32.1764237869610;
        Thu, 27 Nov 2025 02:04:29 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------6rxlXtWiSDHfng9MB26VfzsC"
Message-ID: <82d7533d-aeb7-4d9b-a868-00bd419b72b6@gmail.com>
Date: Thu, 27 Nov 2025 11:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] symbols/riscv: re-number intermediate files
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <37ed4a18-f1a0-4c1f-b915-1708c235068b@suse.com>
 <db4bccef-a746-4912-89ad-b015a8d43f78@gmail.com>
 <3fd32ba0-0670-4c9b-b216-60c55a5de7ba@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3fd32ba0-0670-4c9b-b216-60c55a5de7ba@suse.com>

This is a multi-part message in MIME format.
--------------6rxlXtWiSDHfng9MB26VfzsC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/27/25 10:57 AM, Jan Beulich wrote:
> On 27.11.2025 10:49, Oleksii Kurochko wrote:
>> On 11/26/25 2:44 PM, Jan Beulich wrote:
>>> In preparation to do away with symbols-dummy, re-number the assembly and
>>> object files used, for the numbers to match the next passes real output.
>>> This is to make 0 available to use for what now is handled by
>>> symbols-dummy.
>>>
>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>>>
>>> --- a/xen/arch/riscv/Makefile
>>> +++ b/xen/arch/riscv/Makefile
>>> @@ -26,16 +26,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>>>    	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>>>    	$(NM) -pa --format=sysv $(dot-target).0 \
>>>    		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>> -		> $(dot-target).0.S
>>> -	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>>> +		> $(dot-target).1.S
>>> +	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>>>    	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>>> -	    $(dot-target).0.o -o $(dot-target).1
>>> +	    $(dot-target).1.o -o $(dot-target).1
>>>    	$(NM) -pa --format=sysv $(dot-target).1 \
>>>    		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>> -		> $(dot-target).1.S
>>> -	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>>> +		> $(dot-target).2.S
>>> +	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>>>    	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \ - $(dot-target).1.o -o $@ + $(dot-target).2.o
>>> -o $@ $(NM) -pa --format=sysv $@ \ | $(objtree)/tools/symbols
>>> --all-symbols --xensyms --sysv --sort \ > $@.map
>>>
>> LGTM: Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Thanks. May I remind you again that there wants to be a blank before the
> opening angle bracket? That is an issue which was also pointed out for
> some of your recent release-acks.

Hmm, something wrong with a setting in my e-mail app because I am looking at
my reply in my e-mail app and there is a space before the opening angle bracket...


>   (Canonically, the "-by" also wants to
> be all lower case, I think.)

I was sure that I had seen “-by” written with an uppercase letter, but I will
use lowercase in the future. I tried using|git log --grep|, and it seems I was
mistaken — “-by” is always lowercase.

I didn’t see your answer, so I made the same mistake with “-by” in the next
patch as well.

~ Oleksii

--------------6rxlXtWiSDHfng9MB26VfzsC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/27/25 10:57 AM, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3fd32ba0-0670-4c9b-b216-60c55a5de7ba@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.11.2025 10:49, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 11/26/25 2:44 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">In preparation to do away with symbols-dummy, re-number the assembly and
object files used, for the numbers to match the next passes real output.
This is to make 0 available to use for what now is handled by
symbols-dummy.

Signed-off-by: Jan Beulich<a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -26,16 +26,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
  	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
  	$(NM) -pa --format=sysv $(dot-target).0 \
  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		&gt; $(dot-target).0.S
-	$(MAKE) $(build)=$(@D) $(dot-target).0.o
+		&gt; $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
-	    $(dot-target).0.o -o $(dot-target).1
+	    $(dot-target).1.o -o $(dot-target).1
  	$(NM) -pa --format=sysv $(dot-target).1 \
  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		&gt; $(dot-target).1.S
-	$(MAKE) $(build)=$(@D) $(dot-target).1.o
+		&gt; $(dot-target).2.S
+	$(MAKE) $(build)=$(@D) $(dot-target).2.o
  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; $(build_id_linker) \ - $(dot-target).1.o -o $@ + $(dot-target).2.o 
-o $@ $(NM) -pa --format=sysv $@ \ | $(objtree)/tools/symbols 
--all-symbols --xensyms --sysv --sort \ &gt; $@.map

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">LGTM: Reviewed-By: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks. May I remind you again that there wants to be a blank before the
opening angle bracket? That is an issue which was also pointed out for
some of your recent release-acks.</pre>
    </blockquote>
    <pre>Hmm, something wrong with a setting in my e-mail app because I am looking at
my reply in my e-mail app and there is a space before the opening angle bracket...</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:3fd32ba0-0670-4c9b-b216-60c55a5de7ba@suse.com">
      <pre wrap="" class="moz-quote-pre"> (Canonically, the "-by" also wants to
be all lower case, I think.)</pre>
    </blockquote>
    <pre data-start="65" data-end="260">I was sure that I had seen “-by” written with an uppercase letter, but I will
use lowercase in the future. I tried using <code data-start="186"
    data-end="202">git log --grep</code>, and it seems I was
mistaken — “-by” is always lowercase.</pre>
    <pre data-start="262" data-end="352">I didn’t see your answer, so I made the same mistake with “-by” in the next
patch as well.</pre>
    <pre>
~ Oleksii</pre>
  </body>
</html>

--------------6rxlXtWiSDHfng9MB26VfzsC--

