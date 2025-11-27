Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7969C8DA90
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173689.1498705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYlS-0006Gf-Pg; Thu, 27 Nov 2025 09:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173689.1498705; Thu, 27 Nov 2025 09:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYlS-0006EH-MQ; Thu, 27 Nov 2025 09:58:14 +0000
Received: by outflank-mailman (input) for mailman id 1173689;
 Thu, 27 Nov 2025 09:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOYlR-0006E7-MA
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:58:13 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 954678d7-cb77-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 10:58:11 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so113848866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:58:11 -0800 (PST)
Received: from [192.168.1.17] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510615c0sm1103777a12.30.2025.11.27.01.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:58:10 -0800 (PST)
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
X-Inumbo-ID: 954678d7-cb77-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764237491; x=1764842291; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntBQ+Naci59x6i5X4tbyhD0t5idIrZ/7onoLilwsfj0=;
        b=ckhGyfMYKUac40Zi4wLa85RjM+9TsIvMN1umryD4WZ7sUL5o5RcJNJI1dLysxsz+Px
         a3LHrG/92fKFrCBwMLTTtiH838lrGRjg0bfmhhSWOraUguOs0/9Z0IOb2kHWVZFbvsyu
         Bnt3IscF0QIh0il8EV6xiq/0svUlfMWL4wrB1V+gjEN6+fSoyVrFKgn8eKK8zXM6Gir/
         ZG5F1tzw2SZIFd0LiexiTC2ishm7XpXzGpZe1GA5XZngCKvB1d/u6JHqFnXcTHMTYJv7
         F0F4D/vByxOnXpsWicQlku7KPwFD5LrUNkDz/7AGF6H8raGKlDkxvggjTuBtLqbIM6sE
         REMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237491; x=1764842291;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntBQ+Naci59x6i5X4tbyhD0t5idIrZ/7onoLilwsfj0=;
        b=pZUE8AzegRLj3jMhRMmKPJNVucMY507+9O/oOB3zSPI/c7FDONypfFkXXAP3IuT0me
         VzOri4saxRLcbEDR/Il7kEs7v/o9F9F5UBt1U86lmQlnePIkp18feJbnckSMhM4mE5E5
         dRYpEioV+yTMERFUoxSDpsQlvIaFj6wE6LuSoMlj9BVZ1Q2zdgbS6PeFB+OYnKlcQ3Tq
         akff5ifOq/F1OFB5tTop0KL05wAWSvOCXYYOYqj/4YgLNgnkC+J2dd9sPg0Bi+qSfxjp
         X5FclBlUgU5E1tSkp3333xpsjrF+TsdfxUVycnEEUKmQhwcUzSRANOMomgI566GMei/6
         t3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCURfNYcgVdPSIQQpWhJMHF9SeQ+2tYAIU7DQMEmKzbE0JqQntkzRHHzZXiPp2DnPc0SfEk2N0nOFHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+pXkNip+hoa5L19IQf22IaFnHrh61SOTM0kd81i55cIu+eDOx
	7yP2i0pjf/aYHFoO7OlH1jYyLZhpPVexyodsYrlGx7M9HvMnvaU9s32X
X-Gm-Gg: ASbGnctv+CNwRie5+EypZK9Ufw6ZJkIzGfXgTusMs/dbXnS7lBOv9Jw0YeqelBpkrAl
	jSoS8QvT7+a8PCubC+4LV61AhwBU16FvVHx3V27KZTMBpHzjAJAd0H5b6MkkySr4gYmpA7419c8
	5Gmst34zAIksQ/eXXUJS1/FO25zZhexVK3rC7u3Hivf7GE7IxfAG7Aw4u/1s4fgt+50Dr/JK0t9
	hCZ6d6BW/IYgUnSMByMojyTPfH4As2j9QsMktHPc6lIlHoJX4Xbdev1cH3gQoOKmcSGP0g07PDA
	sKQAZO8tBt4ZMYQe164HD8JGg60BM81SyXVyR3FrzehlmkAweAvX4xRQqL7HL07oJLv9lYIHyy7
	vwM7k7OnSdypH0Vws5MIDkMw7T8bBJaPV2uTVOHtpqv9vbnuzBSNn9GrUoEfzgWNJUpJ6xM9vGh
	S7+VCY3eCMy+bHAHWfF+nmUuCjvRpapqrw9hBJWYrIwSs8Y48kJfhYqj2sznKux/dWZQ==
X-Google-Smtp-Source: AGHT+IETDsw+ppgeVf4bNoZUokwjhA2gxhrdllE2+pm88QJZ9ttN1i4gGoi08eMf4wNyRbhDKc35+g==
X-Received: by 2002:a17:907:6d06:b0:b73:7652:efc2 with SMTP id a640c23a62f3a-b76718c3862mr2551474866b.60.1764237490659;
        Thu, 27 Nov 2025 01:58:10 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------nsJzs8XOIrXGfzragPKwdzml"
Message-ID: <9e45af97-52f3-4c21-865f-db64c9f78416@gmail.com>
Date: Thu, 27 Nov 2025 10:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] symbols/riscv: don't use symbols-dummy
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <5e5ee09f-88b7-41eb-99da-a9b5cf4bf348@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5e5ee09f-88b7-41eb-99da-a9b5cf4bf348@suse.com>

This is a multi-part message in MIME format.
--------------nsJzs8XOIrXGfzragPKwdzml
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/26/25 2:45 PM, Jan Beulich wrote:
> In particular when linking with lld, which converts hidden symbols to
> local ones, the ELF symbol table can change in unhelpful ways between the
> first two linking passes, resulting in the .rodata contributions to change
> between the 2nd and 3rd pass. That, however, renders our embedded symbol
> table pretty much unusable; the recently introduced self-test may then
> also fail. (Another difference between compiling a C file and assembling
> the generated ones is that - with -fdata-sections in use - the .rodata
> contributions move between passes 1 and 2, when we'd prefer them not to.)
>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -22,8 +22,10 @@ $(TARGET): $(TARGET)-syms
>   	$(OBJCOPY) -O binary -S $< $@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds + 
> $(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> -	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> +	      $(dot-target).0.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1.S

LGTM: Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------nsJzs8XOIrXGfzragPKwdzml
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
    <div class="moz-cite-prefix">On 11/26/25 2:45 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5e5ee09f-88b7-41eb-99da-a9b5cf4bf348@suse.com">
      <pre wrap="" class="moz-quote-pre">In particular when linking with lld, which converts hidden symbols to
local ones, the ELF symbol table can change in unhelpful ways between the
first two linking passes, resulting in the .rodata contributions to change
between the 2nd and 3rd pass. That, however, renders our embedded symbol
table pretty much unusable; the recently introduced self-test may then
also fail. (Another difference between compiling a C file and assembling
the generated ones is that - with -fdata-sections in use - the .rodata
contributions move between passes 1 and 2, when we'd prefer them not to.)

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -22,8 +22,10 @@ $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $<a class="moz-txt-link-rfc2396E" href="mailto:$@$(TARGET)-syms:$(objtree)/prelink.o$(obj)/xen.lds+$(objtree)/tools/symbols$(all_symbols)--empty">&lt; $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	$(objtree)/tools/symbols $(all_symbols) --empty &gt;</a> $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).1.S
</pre>
    </blockquote>
    <pre>LGTM: Reviewed-By: Oleksii Kurochko <a
    class="moz-txt-link-rfc2396E"
    href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
  </body>
</html>

--------------nsJzs8XOIrXGfzragPKwdzml--

