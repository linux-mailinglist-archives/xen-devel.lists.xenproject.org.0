Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D2C8DA27
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173670.1498684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYcv-0003y5-Pn; Thu, 27 Nov 2025 09:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173670.1498684; Thu, 27 Nov 2025 09:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYcv-0003vo-N6; Thu, 27 Nov 2025 09:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1173670;
 Thu, 27 Nov 2025 09:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOYcu-0003vi-P7
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:49:24 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59f7f17c-cb76-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 10:49:22 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b728a43e410so127544266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:49:22 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a4b757sm113583866b.66.2025.11.27.01.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:49:21 -0800 (PST)
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
X-Inumbo-ID: 59f7f17c-cb76-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236962; x=1764841762; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxn2+MfLQviHdGIYui/UKb5z8iSNk0jiYKQiK7O5VnU=;
        b=MB7vxqzXUfjxPxnvxEVjcvQn3J+hQtVF2wCI2OG4nu1Idlva0m3/GYEih3H/hBetTw
         TRvfT9SxYCjjA/7bGMnpxoCJ3VrZk3s5aiW1UgLr8dpLc18EHsUFH940fWbmwNGjDUZ/
         Ds0W377xc8HNzLv48525JrQK76GGF7ple/OkkFPukYf4PSeV0A98HniuLWgjuUwRmknC
         r2aOMoWQaWbWTTeUrterhWER/9aa6ykjTf8JIoXbK6nMXkiIsO6+hNvMln7OCMriJCHj
         m6JauTKJRTJXN5C6NLcUTXnVMwLnxOQQrbY/jFdWpKcpSt6ks1wUOWohywEWQ9PSGE1t
         oEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236962; x=1764841762;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxn2+MfLQviHdGIYui/UKb5z8iSNk0jiYKQiK7O5VnU=;
        b=W4LuRikJJkNDxM9HUtF/wBbUEU0Hamjw1+pOtjSRCt++TPgq/F9KtyB/Xi5sju+VdK
         fhiJc3Gs5cFaj9s1YzYi3eShHTKjQz1jSW+eAc1RoQOazA3BJ/xB5mZk62wF7asO68/Z
         QN8RFU+cq/GrtBGg6jTXJ/A2DhdM51SNR/mV0zts3yCr+AxTH/o/d9bb/EaUawravHhu
         EldPM1ziK+UisdLQ3LBeFmi6txt2I3DJ7F35+dJtYPKVgwkGB2AyWSlAP5LGubDZH1sN
         OTt8ExIKpXY7jNRv2URYOxba9ACM2aAaamk+qiJ5j3Uub7vuHzVM8PK/e1GXZVlDHtvD
         RE+A==
X-Forwarded-Encrypted: i=1; AJvYcCWh6ouwEiP5qCRU1sZHJi89tn5vqDXIuB6lkAloRcZGmCxX03hErQT/FshJKZlQy3UNLSu4vhRjbkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9u0z1p0O1uBhq2BvNIKEUN25t/1UzQGlQ+e8mnthHsLOPMy5X
	DG1t5UdEBNGyVMIqqmOHbyRKWHV3n1dTnSEBn2KR2yhbm/0f10SyRJR1
X-Gm-Gg: ASbGncu/bNe3UcdUfNpiO8tr/kT86rb+KXA/6AkVnpedE6gW4D9/fvOpbXk3oHdnF19
	OLGNmF9vpTxoyHGnCzZsPTxxkj70QW/E0MCdWrRf3U/vyVknqD+ZD2xcOXph7MkrrWP4ZupB6WK
	qdvyKXQ7v+qXeP8FCvC56Jk+VqS4rASvDB5fdY8tg0be+x0hGpjnLSr75rAtgM8yUYwUXfD8Zhr
	rlTsaQ7sbgEuf5ti1qRLdxZ7Cqf+2iLqQZeqOT6DiKExfDNAz9usMgh+5LKgfhpp2O1nCM+79LM
	zrNAZvP8ALOPIPCK0jVm0tImI5LIPvF8naOAptc5QFi2L8ibrUjXDDevB2jDEvB+G35qP54ayBI
	2jl07P7BoqIHZgFHH+FvUzXxwZ2MfkIT6vuIfuAL78FNGlBQOHJ3uJFc5GOdQVlqmrmD3A1vsV5
	vO3FVPKQTAmUlzTERq2NAHRfoXI/vzcfPc9JW46cs0UfWCH4FUsTHTBASwX7OFTbvh
X-Google-Smtp-Source: AGHT+IHDy9xh0h4/hF+DYtZttmuvVNrQlkOItACv4tFQF7j7w6E20D36Epebtn1OjmzQnpH54XOlXg==
X-Received: by 2002:a17:907:2da8:b0:b73:74d6:d360 with SMTP id a640c23a62f3a-b7671731884mr2465397966b.40.1764236961635;
        Thu, 27 Nov 2025 01:49:21 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------DGQkPQ7F2hn52tuLoEeFscSY"
Message-ID: <db4bccef-a746-4912-89ad-b015a8d43f78@gmail.com>
Date: Thu, 27 Nov 2025 10:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] symbols/riscv: re-number intermediate files
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <37ed4a18-f1a0-4c1f-b915-1708c235068b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <37ed4a18-f1a0-4c1f-b915-1708c235068b@suse.com>

This is a multi-part message in MIME format.
--------------DGQkPQ7F2hn52tuLoEeFscSY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/26/25 2:44 PM, Jan Beulich wrote:
> In preparation to do away with symbols-dummy, re-number the assembly and
> object files used, for the numbers to match the next passes real output.
> This is to make 0 available to use for what now is handled by
> symbols-dummy.
>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -26,16 +26,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -		> $(dot-target).0.S
> -	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> +		> $(dot-target).1.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> -	    $(dot-target).0.o -o $(dot-target).1
> +	    $(dot-target).1.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -		> $(dot-target).1.S
> -	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> +		> $(dot-target).2.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \ - $(dot-target).1.o -o $@ + $(dot-target).2.o 
> -o $@ $(NM) -pa --format=sysv $@ \ | $(objtree)/tools/symbols 
> --all-symbols --xensyms --sysv --sort \ > $@.map
>
LGTM: Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------DGQkPQ7F2hn52tuLoEeFscSY
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
    <div class="moz-cite-prefix">On 11/26/25 2:44 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:37ed4a18-f1a0-4c1f-b915-1708c235068b@suse.com">
      <pre wrap="" class="moz-quote-pre">In preparation to do away with symbols-dummy, re-number the assembly and
object files used, for the numbers to match the next passes real output.
This is to make 0 available to use for what now is handled by
symbols-dummy.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

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
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $<a class="moz-txt-link-rfc2396E" href="mailto:$(build_id_linker)\-$(dot-target).1.o-o$@+$(dot-target).2.o-o$@$(NM)-pa--format=sysv$@\|$(objtree)/tools/symbols--all-symbols--xensyms--sysv--sort\">&lt; $(build_id_linker) \
-	    $(dot-target).1.o -o $@
+	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		&gt;</a> $@.map

</pre>
    </blockquote>
    <pre>LGTM: Reviewed-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
  </body>
</html>

--------------DGQkPQ7F2hn52tuLoEeFscSY--

