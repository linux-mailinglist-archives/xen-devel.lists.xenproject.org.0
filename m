Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB4A6F77B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926402.1329251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2ls-0003M1-UC; Tue, 25 Mar 2025 11:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926402.1329251; Tue, 25 Mar 2025 11:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2ls-0003KZ-RS; Tue, 25 Mar 2025 11:48:40 +0000
Received: by outflank-mailman (input) for mailman id 926402;
 Tue, 25 Mar 2025 11:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx2lr-0003KT-MT
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:48:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16cfdd88-096f-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 12:48:37 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so4244466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 04:48:37 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb65899sm850707866b.104.2025.03.25.04.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 04:48:36 -0700 (PDT)
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
X-Inumbo-ID: 16cfdd88-096f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742903317; x=1743508117; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCEjaPmJgfygbqlK8gLZ8p/r+OFOcMgMZGqGaXcTB4E=;
        b=QsxRV2FjZkkbmwv96aotMYGz04jnNxO2/D2ZSm7fql+ocj/Gcy0CvnWG8Z7TVbG8VY
         sTnVaA7M0kyQ9S8Fr5NGzvR46S3IS+JHcGBN3HpzYf12/4KWfrXCvwS+cFa5xHuXH9rN
         C8iMPSRqhZ61rf7peBsxMQqMI6FAhdkjJOv3mAp98ot9vTmgWjsbr7P/rCPZLvJ3hPjl
         JoQa7Fm0Pszc5HeiwaTL1f/qPws9dJReOx43h5Ix1t1brUiIi1TdegNa7LEr8Zqc9o7I
         njRDAxVpUCqtnL3OLOHBFqlYQx23PjQrxj4aMEFRWHi5MOoTcxQLIfmZxeGhyXhWKHXR
         2LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903317; x=1743508117;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KCEjaPmJgfygbqlK8gLZ8p/r+OFOcMgMZGqGaXcTB4E=;
        b=Ff4ILj3YD2oKo2BWQgi4OInwEWxII256hAsv1C5l0+Zz1GZMMoyzqQ05x9LUJEImC/
         AUqIIf2iijv1PkpqZOrH/zlwkdyZ0DHmVhVUeC/zzVbmV52seWGYoW+bhJkYMj8g/mhc
         UNP/XP1c1LE8SbZiCtuSiV739p2o4qvW+ckYYVbvtX0/theaJkx3YkeX7klaqwZvFAjW
         re1OJSZHL2pT+NYJqALZFxl+BG6iQ4lj+XV/nqKIyMZPSNQ2ueGLSQwgf7nAYpMqWV6V
         YFZc41P+U4gq3HeehM+9a+tQNBQONSn55cagg/mn88x6CGTuFjen7dGPEp2Ujy27WuPv
         +rRA==
X-Forwarded-Encrypted: i=1; AJvYcCU0TBSFIGirR5Z6411Nn2OqKEqn3TAx92tN2Wx7k+c56IOm0OPOWQXMjTfnNq76xtVEQEnfF6dc4SQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvNDbb1TDANiih2WOb3M0abwNkJqTcOprDOTh1PZvl7A8cZT4r
	rMbneCXI+FeKXro0w3mRcfpDyELoZRkt/zpNJdBmziDExzo42B4p
X-Gm-Gg: ASbGncuCtgadZwG2aZxh+ItLaaijRw5CGdjEds1wySN+K/rfiNUJsSq3tdxT3W46c3/
	Sdnph1FcwBKoIVZNAA80J9Ni4EGqyR+3kaz1Rk1QPFKGQpNCW6Eyt9VSwNbv5dTGA7gU/A2iYnr
	fW8Tw39l8mU82AiwLzgaqyJVyQH59GksV7nMncnC8ZfXFW5c8K+u7PIjhIJXhLsHgVfgjIhoggn
	XEDIAmpd9c0A92TO4E4+AwcKk49zFq3Ek8EcVzESa1zRkYhjDQh5topgzHvggUk/u2S3FAuJ1pr
	Tnyl0z+ZIG6k0uFpvoNbv33+wkrpSou9X/SWhFECFJ+GmOqEgeHcCUYx1jXW4Sj21Tw+ezTSMGH
	6MnYatsFidaURGl0j1UWFP+NhGFJoBok=
X-Google-Smtp-Source: AGHT+IFdrq0Lx/zUGKli9rCwwfEu0P/6dpoNB3n9XD82HM0ZuFAi/p80gSlPi4eK+KZ0xz/IZ0/GZw==
X-Received: by 2002:a17:906:4795:b0:ac3:b372:6d10 with SMTP id a640c23a62f3a-ac3f2081eaamr1442110066b.4.1742903316868;
        Tue, 25 Mar 2025 04:48:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------N804p3c9equyc5dOMevfQnb5"
Message-ID: <ee8b8e09-9b0b-4757-989c-b7d81721c325@gmail.com>
Date: Tue, 25 Mar 2025 12:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: add H extenstion to -march
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <0a072ab36b54ea7c4f9a6f94465fb7b79f9f49b2.1742573085.git.oleksii.kurochko@gmail.com>
 <c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com>

This is a multi-part message in MIME format.
--------------N804p3c9equyc5dOMevfQnb5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/24/25 1:31 PM, Jan Beulich wrote:
> On 21.03.2025 17:17, Oleksii Kurochko wrote:
>> H provides additional instructions and CSRs that control the new stage of
>> address translation and support hosting a guest OS in virtual S-mode
>> (VS-mode).
>>
>> According to the Unprivileged Architecture (version 20240411) specification:
>> ```
>> Table 74 summarizes the standardized extension names. The table also defines
>> the canonical order in which extension names must appear in the name string,
>> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
>> RV32IMACV is legal, whereas RV32IMAVC is not.
>> ```
>> According to Table 74, the h extension is placed last in the one-letter
>> extensions name part of the ISA string.
>>
>> `h` is a standalone extension based on the patch [1] but it wasn't so
>> before.
>> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
>> and for that version it will be needed to encode H extensions instructions
>> explicitly by checking if __risv_h is defined.
> Leaving aside the typo, what is this about? There's no use of __riscv_h in
> the patch here, and ...

It is going to be used in future patches:https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32

>> @@ -25,10 +24,13 @@ $(eval $(1) := \
>>   	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>   endef
>>   
>> +h-insn := "hfence.gvma"
>> +$(call check-extension,h)
> ... this, if it fails, will not have any effect on the build right now
> afaics.

No, it won't have any affect now as instruction from H extension isn't used now.
But it will be needed forhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/
and for p2m changes mentioned above.

~ Oleksii

--------------N804p3c9equyc5dOMevfQnb5
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
    <div class="moz-cite-prefix">On 3/24/25 1:31 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com">
      <pre wrap="" class="moz-quote-pre">On 21.03.2025 17:17, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">H provides additional instructions and CSRs that control the new stage of
address translation and support hosting a guest OS in virtual S-mode
(VS-mode).

According to the Unprivileged Architecture (version 20240411) specification:
```
Table 74 summarizes the standardized extension names. The table also defines
the canonical order in which extension names must appear in the name string,
with top-to-bottom in table indicating first-to-last in the name string, e.g.,
RV32IMACV is legal, whereas RV32IMAVC is not.
```
According to Table 74, the h extension is placed last in the one-letter
extensions name part of the ISA string.

`h` is a standalone extension based on the patch [1] but it wasn't so
before.
As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
and for that version it will be needed to encode H extensions instructions
explicitly by checking if __risv_h is defined.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Leaving aside the typo, what is this about? There's no use of __riscv_h in
the patch here, and ...
</pre>
    </blockquote>
    <pre>It is going to be used in future patches: <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32">https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32</a>
</pre>
    <blockquote type="cite"
      cite="mid:c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -25,10 +24,13 @@ $(eval $(1) := \
 	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
+h-insn := "hfence.gvma"
+$(call check-extension,h)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this, if it fails, will not have any effect on the build right now
afaics.</pre>
    </blockquote>
    <pre>No, it won't have any affect now as instruction from H extension isn't used now.
But it will be needed for <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/">https://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/</a>
and for p2m changes mentioned above.

~ Oleksii</pre>
  </body>
</html>

--------------N804p3c9equyc5dOMevfQnb5--

