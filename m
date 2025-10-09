Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F7BC9664
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 16:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140659.1475479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6rBe-00072w-6v; Thu, 09 Oct 2025 14:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140659.1475479; Thu, 09 Oct 2025 14:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6rBe-00070V-3w; Thu, 09 Oct 2025 14:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1140659;
 Thu, 09 Oct 2025 14:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDLD=4S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v6rBc-0005oZ-0p
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 14:00:04 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 409a7fcc-a518-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 16:00:03 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b3d80891c6cso320750066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 07:00:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865986505sm1898045466b.23.2025.10.09.07.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:00:01 -0700 (PDT)
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
X-Inumbo-ID: 409a7fcc-a518-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760018402; x=1760623202; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqXRl8ajdoyUJsMvtxEY4U1LRu69Irgxd49xr/SgGDg=;
        b=DGLym2mNl+W6CnRP2YcjDOLZamGEPhoHX/Sl5F846w9EjdUC/i1Dthxm3wZY8GKFAR
         1RREBmA8tq1efXM3LUgIyZxz2/dCQTgjNp62Ewp21e/fMAGIbKxYQpEMVl/SirUVWeRX
         Jyu3NXtlJXDt6szcZacaEyon/BL7IqgVnhdJGlEfa5URwNscC+X5JCDB6LmQnrzcOqRF
         ga/dG/G0ABm8Sn1Hm7BPFIsVwX/SHl44l2s9rijXxCSmXorUcGht0SCY8bw3CQ7Dyiin
         pB3kTbajWu0Gm7shL5N+69RoDS0w1VqeWSq+R2vcmVlJKEDpoz4YVKZBfZjYa76T93xk
         QPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018402; x=1760623202;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqXRl8ajdoyUJsMvtxEY4U1LRu69Irgxd49xr/SgGDg=;
        b=giX/3JqHv6TexefD7rpK+h44HMqA9rf7oL4xeDPNvuZY25U0kafE0gih9C60NKmwF6
         mYWZ/+AIkBljux5S+md9hy1E1QS9dV+LE1sqKMm9+yGX3HPNTqQJ3iUn2+9Va5AA07ID
         5eUwMsK+iOqFmajSgBfBydVW0SiPWzDECmc3zDsj4o/7hjbp2OFoc34WQo+i/KhVy87D
         SBkJzLCZyWAGzjR/sTWJG5lUcO4xSbiLVARfVvCOCgTOEVG+Um47jrfYRUu2rptZj34j
         6UCaO+9WNWfSBSz5sq6ViJllMQSObHw1EZmliYwoG3oTw8gj6sPjPWvpQ1d5UN7u+2sf
         X/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWJqpMHS18uB4Bqsu95HIDSNZPRJKM8XI8AwGs4FSV2THxfer8cKkUO+VD/fk9aRKE7lQTOL7Bq30E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4QVsXxYNAfPXVX2W2DdYyUkiqN6/PlOzQEs9g2+NdMilHqLMa
	DJwzlXyFvOwE2ibbk9swfrpxi75tC+XAU/xv0GzD1BbqOjUdneq1WQyF
X-Gm-Gg: ASbGncv9b6I0vR0JBscPh4NW6m7Gp7D0sUap8qWFuE7hg4VIc2fGc7epgoIER3j0UJF
	b87+GlNK3Fdud0XXEem4neHFi8Pmno/Js45AiC/q4v//iVCEqHZhdWESyQvwYbIur5Hgjd1UHWn
	mmWOYMAsay3kxhhMExC+XMhNKmR1AwpIS4k1/xUePt3r/T02/FzAlmJG9F8hM+G/H/peg6jyDXG
	v1dmNUbNz78F7dkMA+4k4sOhRkyDzNaSU4igq+/ays31wNJz16fpXscACPTi7dP/4wI+Hyjxw/v
	0ue5jYnwf1yE1GySdT0hYlqWQVXvLreQb55Wjb9w5Ss7JGI5mz9muHtGZ95QtIH1uoE3EZs9T6K
	/Qv/gwkoMz3/S/WJrLwRe51hzLmrLU2qaI4UhZ/7gIjBO/qqlA4fLIlye1mNGBD6PaTBYt8e9ky
	zh6lBlktwN7NASjXga0uXfjqwqbahQuy8Kp7ieAw==
X-Google-Smtp-Source: AGHT+IFih7tbX96iXT+Fji5pg/Oqxez1jfYdbYjjix5S1j7LXYWtxa52LIDg67A81h81GJDZ3PtxRQ==
X-Received: by 2002:a17:907:c717:b0:b4c:629b:aa67 with SMTP id a640c23a62f3a-b4f43730a1dmr1334206266b.32.1760018402153;
        Thu, 09 Oct 2025 07:00:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ZMbevqEJtjr5BLSog1KVbjja"
Message-ID: <c4f7c833-3bc7-4eb7-8120-80652b263894@gmail.com>
Date: Thu, 9 Oct 2025 16:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251008201106.36204-1-jason.andryuk@amd.com>
 <cf852476-8a51-4623-b4aa-d9fc42622b1c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cf852476-8a51-4623-b4aa-d9fc42622b1c@suse.com>

This is a multi-part message in MIME format.
--------------ZMbevqEJtjr5BLSog1KVbjja
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/9/25 2:36 PM, Jan Beulich wrote:
> On 08.10.2025 22:11, Jason Andryuk wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
>>   F:	xen/include/acpi/
>>   F:	tools/libacpi/
>>   
>> +AMD IOMMU
>> +M:	Jan Beulich<jbeulich@suse.com>
>> +M:	Andrew Cooper<andrew.cooper3@citrix.com>
>> +M:	Roger Pau Monné<roger.pau@citrix.com>
>> +R:	Jason Andryuk<jason.andryuk@amd.com>
>> +S:	Supported
>> +F:	xen/drivers/passthrough/amd/
>> +
>> +AMD SVM
>> +M:	Jan Beulich<jbeulich@suse.com>
>> +M:	Andrew Cooper<andrew.cooper3@citrix.com>
>> +M:	Roger Pau Monné<roger.pau@citrix.com>
>> +R:	Jason Andryuk<jason.andryuk@amd.com>
>> +S:	Supported
>> +F:	xen/arch/x86/hvm/svm/
>> +F:	xen/arch/x86/cpu/vpmu_amd.c
> What about xen/arch/x86/include/asm/hvm/svm/ ? It didn't need specific
> mentioning on the X86 entry, but it would now. Also F: entries generally
> want sorting alphabetically as well.
>
>> @@ -601,7 +618,8 @@ M:	Roger Pau Monné<roger.pau@citrix.com>
>>   S:	Supported
>>   L:	xen-devel@lists.xenproject.org
>>   F:	xen/arch/x86/
>> -F:	xen/drivers/passthrough/amd/
>> +X:	xen/arch/x86/hvm/svm/
>> +X:	xen/arch/x86/cpu/vpmu_amd.c
> Didn't the v1 discussion result in there being no need for these X:
> entries?
>
> As long as there's agreement, I'd be happy to make adjustments while
> committing. Oleksii - I take it that ./MAINTAINERS changes can still go
> in pretty freely?

Yes, you are right. Feel free to commit such changes without R-Acked-by.

~ Oleksii

--------------ZMbevqEJtjr5BLSog1KVbjja
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
    <div class="moz-cite-prefix">On 10/9/25 2:36 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cf852476-8a51-4623-b4aa-d9fc42622b1c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.10.2025 22:11, Jason Andryuk wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
 F:	xen/include/acpi/
 F:	tools/libacpi/
 
+AMD IOMMU
+M:	Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
+M:	Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
+M:	Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
+R:	Jason Andryuk <a class="moz-txt-link-rfc2396E" href="mailto:jason.andryuk@amd.com">&lt;jason.andryuk@amd.com&gt;</a>
+S:	Supported
+F:	xen/drivers/passthrough/amd/
+
+AMD SVM
+M:	Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
+M:	Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
+M:	Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
+R:	Jason Andryuk <a class="moz-txt-link-rfc2396E" href="mailto:jason.andryuk@amd.com">&lt;jason.andryuk@amd.com&gt;</a>
+S:	Supported
+F:	xen/arch/x86/hvm/svm/
+F:	xen/arch/x86/cpu/vpmu_amd.c
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What about xen/arch/x86/include/asm/hvm/svm/ ? It didn't need specific
mentioning on the X86 entry, but it would now. Also F: entries generally
want sorting alphabetically as well.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -601,7 +618,8 @@ M:	Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
 S:	Supported
 L:	<a class="moz-txt-link-abbreviated" href="mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenproject.org</a>
 F:	xen/arch/x86/
-F:	xen/drivers/passthrough/amd/
+X:	xen/arch/x86/hvm/svm/
+X:	xen/arch/x86/cpu/vpmu_amd.c
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Didn't the v1 discussion result in there being no need for these X:
entries?

As long as there's agreement, I'd be happy to make adjustments while
committing. Oleksii - I take it that ./MAINTAINERS changes can still go
in pretty freely?</pre>
    </blockquote>
    <pre>Yes, you are right. Feel free to commit such changes without R-Acked-by.

~ Oleksii</pre>
  </body>
</html>

--------------ZMbevqEJtjr5BLSog1KVbjja--

