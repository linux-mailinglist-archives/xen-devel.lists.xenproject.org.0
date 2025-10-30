Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5742C2114D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 17:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153854.1484115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEV7C-0001Xg-1Z; Thu, 30 Oct 2025 16:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153854.1484115; Thu, 30 Oct 2025 16:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEV7B-0001WF-Uj; Thu, 30 Oct 2025 16:03:05 +0000
Received: by outflank-mailman (input) for mailman id 1153854;
 Thu, 30 Oct 2025 16:03:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vEV7A-0001W8-0X
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 16:03:04 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e78ca313-b5a9-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 17:02:58 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-63e18829aa7so1716262a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 09:02:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef6c129sm15306299a12.3.2025.10.30.09.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 09:02:57 -0700 (PDT)
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
X-Inumbo-ID: e78ca313-b5a9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761840178; x=1762444978; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTWYYeImcGjWZUiPWsuMRdZ0/0ySL8/qYM877Yoyssw=;
        b=DTaKRiJxLNYBU9LL9o6sZCDgwL/g245vsloAP1979he+OMnljU1/EdKmTewZZNDi1g
         g5jPYNfv5zUhIhuJmyUWlWpzt4aVEiM/OtjTEuEiDbM9ZkAH2noPT08n7EPnGaNxc7A4
         9kRfcdc1N1muQPhFD59dcN06O3AZyqX5TAaN6jLaKzOodqzpqwDjLS+Q4uSvMVBbiZhz
         ilIZQ0Iluybh77F6r5CX2Ptb+Z5gXiIK9rQfl96GJLZCHoBp0zrldT//zk5byTpfivht
         /C7rvct8PVELv2GeQ9AqK8vDM7zpLlq9pxJz55AI83LpPoV2deGrMK9TL2jkth2shx/0
         ksvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761840178; x=1762444978;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTWYYeImcGjWZUiPWsuMRdZ0/0ySL8/qYM877Yoyssw=;
        b=GKIdJ1hRvzZNZVreQNHuuTieqVWPFzqdz+LAO4SP0C11pXs4jeZoZzBgSmipilEqsC
         8vn3dzjo5oR/lOWIdv6wAZSG8dxgl+cxjgH3/RB06llua2h3majRG43ebtfJo94LkX/G
         odU39Fb7lDhf6mzWsWQ/3hD7WdTfVxG7D8AieAfYGS0P7bxH/FGLuZomkVMKichw/L3v
         0Hep6r0mThXw94i6DJIlk6wbN/SjN66zG7LkcXo4eKfyWsCsMhlaPD5unDSfoasraS6A
         3vt8y26FN2kXeDWAfGDSPcBQZTSTeejc4LMp1L9D1PKQLUGq3ycjo1B00Lm/pdgP5Bf2
         h3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVRsoV6jxJLUT3yoV0xdqpi5aWgVbnNWiIk7v7VG5ZLbXoBJ7JI9xKQKHpL1kxh92da6pqun2IXiTA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzswOP95uVeWUBWyp9ODkrSwSzvuVlPbXSUAvrHdUzB/iHTv3LC
	fECuXV2hKtNaUEt7lYnhjObvRpitplM/OYej6K5WHb5Lu05o7tmWQyShL1bqwg==
X-Gm-Gg: ASbGncsSbZkI1RBDsNpJx1gzRKunB33+8DwCRb8XBUjKFNnlTUluX9bgHkbH/WjBdqS
	M2a3usalZ6mzgQqmgtTIDyC8e2bM73Etoy6PX2wcR5CPlnWA9GEDUCKsokmEoeg+K9pBjUZaMfK
	Ndt5XRJYjG0/qQUSvPL9VWLEHrUL417fScPwZqB3Z3JhiVWpUSwIywkcYBBI3LGYPgdH+XqUN7w
	WMnSEsoysRCeZ+4buUKs5cuZcnhr5MHjxuPknjCrsdl8ap8hNtEEmr6pAXWICbALqUxA7wi2J3Z
	Ne5o8NfWD7xKKU1CJQxIaMf7q8PM/nyrY+f2k8HysCz/uwu2U5Wm/7iAhBjooJ8Q0GDIdUxnhFQ
	uRH5Zfq4c+INFQOq3NAUljWZP71UAPDkacoiQA9uMvGgJasINdDnqhkbzkMmLBFwAUIc0YX/lx2
	Rjys7dWMtV5nWDeFVwlOn+vnXy60PAAKsajyHB3lpJ4n23Om9IQh3VREO2fVuGO30b
X-Google-Smtp-Source: AGHT+IHj9xgezx3kPQYXRPAmbLOPeSTedQacYpiOTswXgjoAD4W9FIv17b7OLOFE0j6yjz6D1VQBMg==
X-Received: by 2002:a05:6402:d0b:b0:640:325d:3dba with SMTP id 4fb4d7f45d1cf-64061a83b71mr2914338a12.35.1761840177886;
        Thu, 30 Oct 2025 09:02:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fLVn3BV11kTRyC7YX7U5XosF"
Message-ID: <a4a5f147-a2f7-4b00-954c-ca6b5e019bf1@gmail.com>
Date: Thu, 30 Oct 2025 17:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] symbols: avoid emitting "end" symbols for data
 items
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>

This is a multi-part message in MIME format.
--------------fLVn3BV11kTRyC7YX7U5XosF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/29/25 2:34 PM, Jan Beulich wrote:
> symbols-dummy.c and the generated .xen-syms.?.S may place their symbols in
> different sections: Like for all C files, -fdata-sections may be in effect
> there. As a result, besides moving these symbols may then also have
> different amounts of "end" symbols inserted between them. While the
> movement is likely not problematic, the change in table size is - linking
> passes 2 and 3 want no address (and hence no size) changes between them.
>
> As, at least right now, the "end" symbols are useful only for code, limit
> their emission accordingly. When data symbols are emitted (i.e. when
> LIVEPATCH=y), this obviously also has a positive effect on overall table
> size (I'm seeing almost 600 entries going away in the build I'm looking
> at).
>
> Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
> Reported-by: Roger Pau Monné<roger.pau@citrix.com>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleskii


> ---
> Furthermore at least some gcc versions emit the (read-only) data there into
> .bss.symbols_* rather than the expected (but still potentially problematic)
> .rodata.symbols_*.
>
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -176,10 +176,9 @@ static int read_symbol(FILE *in, struct
>   		*sym++ = '#';
>   	}
>   	strcpy(sym, str);
> -	if (sort_by_name || map_only) {
> +	if (sort_by_name || map_only)
>   		s->orig_symbol = strdup(SYMBOL_NAME(s));
> -		s->type = stype; /* As s->sym[0] ends mangled. */
> -	}
> +	s->type = stype; /* As s->sym[0] may end up mangled. */
>   	s->sym[0] = stype;
>   	s->typed = strcmp(type, "FUNC") == 0 ||
>   	           strcmp(type, "OBJECT") == 0 ||
> @@ -313,6 +312,7 @@ static int compare_name_orig(const void
>   static bool want_symbol_end(unsigned int idx)
>   {
>   	return table[idx].size &&
> +	       toupper(table[idx].type) == 'T' &&
>   	       (idx + 1 == table_cnt ||
>   	        table[idx].addr + table[idx].size < table[idx + 1].addr);
>   }
--------------fLVn3BV11kTRyC7YX7U5XosF
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
    <div class="moz-cite-prefix">On 10/29/25 2:34 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com">
      <pre wrap="" class="moz-quote-pre">symbols-dummy.c and the generated .xen-syms.?.S may place their symbols in
different sections: Like for all C files, -fdata-sections may be in effect
there. As a result, besides moving these symbols may then also have
different amounts of "end" symbols inserted between them. While the
movement is likely not problematic, the change in table size is - linking
passes 2 and 3 want no address (and hence no size) changes between them.

As, at least right now, the "end" symbols are useful only for code, limit
their emission accordingly. When data symbols are emitted (i.e. when
LIVEPATCH=y), this obviously also has a positive effect on overall table
size (I'm seeing almost 600 entries going away in the build I'm looking
at).

Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
Reported-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>
Thanks.

~ Oleskii</pre>
    <br>
    <blockquote type="cite"
      cite="mid:6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com">
      <pre wrap="" class="moz-quote-pre">
---
Furthermore at least some gcc versions emit the (read-only) data there into
.bss.symbols_* rather than the expected (but still potentially problematic)
.rodata.symbols_*.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -176,10 +176,9 @@ static int read_symbol(FILE *in, struct
 		*sym++ = '#';
 	}
 	strcpy(sym, str);
-	if (sort_by_name || map_only) {
+	if (sort_by_name || map_only)
 		s-&gt;orig_symbol = strdup(SYMBOL_NAME(s));
-		s-&gt;type = stype; /* As s-&gt;sym[0] ends mangled. */
-	}
+	s-&gt;type = stype; /* As s-&gt;sym[0] may end up mangled. */
 	s-&gt;sym[0] = stype;
 	s-&gt;typed = strcmp(type, "FUNC") == 0 ||
 	           strcmp(type, "OBJECT") == 0 ||
@@ -313,6 +312,7 @@ static int compare_name_orig(const void
 static bool want_symbol_end(unsigned int idx)
 {
 	return table[idx].size &amp;&amp;
+	       toupper(table[idx].type) == 'T' &amp;&amp;
 	       (idx + 1 == table_cnt ||
 	        table[idx].addr + table[idx].size &lt; table[idx + 1].addr);
 }
</pre>
    </blockquote>
  </body>
</html>

--------------fLVn3BV11kTRyC7YX7U5XosF--

