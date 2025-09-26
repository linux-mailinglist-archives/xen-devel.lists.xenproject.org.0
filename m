Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A9BA2C6D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131183.1470370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22ua-0000Y2-79; Fri, 26 Sep 2025 07:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131183.1470370; Fri, 26 Sep 2025 07:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22ua-0000WZ-4D; Fri, 26 Sep 2025 07:30:36 +0000
Received: by outflank-mailman (input) for mailman id 1131183;
 Fri, 26 Sep 2025 07:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5CHW=4F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v22uY-0000WT-S4
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:30:34 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afc96ac5-9aaa-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 09:30:33 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so358624766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 00:30:33 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d1210sm320286066b.9.2025.09.26.00.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:30:32 -0700 (PDT)
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
X-Inumbo-ID: afc96ac5-9aaa-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871833; x=1759476633; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVa20+lIhjQpraHsX4Gj70ClwZooh72ry2FkROBk2uw=;
        b=Qnhd/np2RHLoSK/ffcWVZvxPfEBrlCcPtryxeuN8DehndblXiUtTsFdW1X6oPtbetK
         7ga5xa7pLkoK3uO4LoYfW+L702RNTZUkkLCzGmgXHKKkCwDPT0235unFO1pI2IitZwin
         y4XGQrTrgLl5gsWLYEuH/gkczZbNOa17DuwJflOfKFuJxHl2kJnoJF77+iiShusWS5Wu
         UMQCLEf078GQP/TrY7UmplWcsWSKPMrS6a1SITmODfs/gfzwcVbspIL3xdfK4RXJnCvw
         NiEzrABafFMmrQAT8vzKzNEJCu9EtrlgScHL1KgBiS4x6u/RRUjjsj9JEoTRg2wpvk+J
         kFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871833; x=1759476633;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVa20+lIhjQpraHsX4Gj70ClwZooh72ry2FkROBk2uw=;
        b=mVebF7G8rcjvQIqj1NiniLpORswu26/nrxezTgHPKrDbt/T7iiLS/U24ek8R+Veyo2
         9fSY+z0k2hk4bMcJkKlfHTc9mmDRoldlhs75VoFSEqO/Mt+C1LC6IGTJ1vasahE8GEPy
         ni+hBVr7MRDUG4ND+mMwNlZBui91BNRwYKbZxW2knjUBgstGWm0gjQXP111HzpFxMslk
         pLp5rLALXwI64OrF4tXEexue0g5E/R31jzcveLQvxrGsdZgFyDKaictQNvzGTUE4Gpr3
         ja8odFt5i9GumvU6x5S4eBZeJtdNcaE+g+3Gg5NpVqf+v2DH2G4eJAn4RO5P6ZHjLeAW
         sPzg==
X-Forwarded-Encrypted: i=1; AJvYcCUOwBs7Bs17jZBFankeRbOkMtt0ccTaXiwebrqIIcCcR9F8lO4Vf16avmgt3BYu2Io4adVgxN3Ub/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxP5NLz6PBn9IMVlOZwYArLIb2SO0zg/CgVY1mL4i+3/lpNO8tB
	B25a4yHNcVcHoUOuSZ5tuuP46dZb7xNqWkrQmILEYp98MI9DaasqNTJq
X-Gm-Gg: ASbGnctAhy+v1ApqxaKvEAXhQXFt53226UZ/NThP8ORSuxGxQhsUqkBtTvf0XfiBXXI
	kS4hg52jTREbpO2GnjWREMD9MwM1j/amhn9CyluzONZ5jlrOjkdS4814mo6RcCTgzyeW6rxBOcF
	xB/brcLY4JZ0q9rgCz076vOvUqReSpSdM0dhUMRUv/sp4MXZ1AHWgnxW0f072nbjxv2BWjaSxoz
	VnQ1atDpr/k3f8vffEeaLLsoRnBL+yFFClIaXIhHqiznLCkKqhv/fgwKOpFNBQXRn/mRhywud9D
	dsdsjjNKOAF/pUyxMvHg+J4j88cBLgTb3KEp2eBC8noWcslS5TqnGiHwqV9coudKVdYSBSc4/ns
	hkKWaXTytpdMu+fT1+SF1P9vULFRF1sW/4e/d31RGuXx/YK3s0VafRI64plsBT89yWVwKTZ/R
X-Google-Smtp-Source: AGHT+IHHNAYnDkt0p8Zfwh5uaiMKrPEpCRdx+LGWAy0snUTLHHK8d3jK7bbDqxdbFNyRQkRb/lNN0A==
X-Received: by 2002:a17:907:9803:b0:b18:63b8:c508 with SMTP id a640c23a62f3a-b34be0fd02cmr583570766b.44.1758871832559;
        Fri, 26 Sep 2025 00:30:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6SEF60HfqpTLDm8Sl0rw5G4x"
Message-ID: <2ee558fe-1366-43d1-98f6-ee729c097aae@gmail.com>
Date: Fri, 26 Sep 2025 09:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] xen/riscv: detect and initialize G-stage mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <7cc37e612db4a0bfe72b63a475d3a492b2e68c83.1758145428.git.oleksii.kurochko@gmail.com>
 <b7fa50ae-8094-4451-8326-53c975f7b441@suse.com>
 <0c4e446b-abe1-481c-91a6-60a49459b486@gmail.com>
 <9777e972-8ea1-4dfa-bab0-ee7e13f0a0e6@gmail.com>
 <f6d2806d-26d7-4f7e-a064-23cd34fa2c39@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f6d2806d-26d7-4f7e-a064-23cd34fa2c39@suse.com>

This is a multi-part message in MIME format.
--------------6SEF60HfqpTLDm8Sl0rw5G4x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/25/25 3:46 PM, Jan Beulich wrote:
> On 24.09.2025 17:00, Oleksii Kurochko wrote:
>> On 9/24/25 1:31 PM, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/setup.c
>>>>> +++ b/xen/arch/riscv/setup.c
>>>>> @@ -22,6 +22,7 @@
>>>>>    #include <asm/early_printk.h>
>>>>>    #include <asm/fixmap.h>
>>>>>    #include <asm/intc.h>
>>>>> +#include <asm/p2m.h>
>>>>>    #include <asm/sbi.h>
>>>>>    #include <asm/setup.h>
>>>>>    #include <asm/traps.h>
>>>>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>>>    
>>>>>        console_init_postirq();
>>>>>    
>>>>> +    gstage_mode_detect();
>>>> I find it odd for something as fine grained as this to be called from top-
>>>> level start_xen(). Imo this wants to be a sub-function of whatever does
>>>> global paging and/or p2m preparations (or even more generally guest ones).
>>> It makes sense. I will move the call to gstage_mode_detect() into p2m_init()
>>> when the latter is introduced.
>>> Probably, I will move the current patch after p2m_init() is introduced to make
>>> gstage_mode_detect() static function.
>> Maybe putting gstage_mode_detect() into p2m_init() is not a good idea, since it
>> is called during domain creation. I am not sure there is any point in calling
>> gstage_mode_detect() each time.
>>
>> It seems that gstage_mode_detect() should be called once during physical CPU
>> initialization.
> Indeed.
>
>> A sub-function (riscv_hart_mm_init()? probably, riscv should be dropped from
>> the name) could be added in setup.c and then called in start_xen(), but
>> is it really needed a separate sub-function for something that will be called
>> once per initialization of pCPU?
> Counter question: Is this going to remain the only piece of global init that's
> needed for P2M machinery? Right in the next patch you already add vmid_init()
> as another top-level call.

No, it isn’t the only piece — at least|gstage_mode_detect()| and|vmid_init()| are
also needed for the P2M machinery.

Okay, then it would be better to introduce a sub-function now and re-use it later
for other pCPUs as well.

~ Oleksii

--------------6SEF60HfqpTLDm8Sl0rw5G4x
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
    <div class="moz-cite-prefix">On 9/25/25 3:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f6d2806d-26d7-4f7e-a064-23cd34fa2c39@suse.com">
      <pre wrap="" class="moz-quote-pre">On 24.09.2025 17:00, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 9/24/25 1:31 PM, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -22,6 +22,7 @@
  #include &lt;asm/early_printk.h&gt;
  #include &lt;asm/fixmap.h&gt;
  #include &lt;asm/intc.h&gt;
+#include &lt;asm/p2m.h&gt;
  #include &lt;asm/sbi.h&gt;
  #include &lt;asm/setup.h&gt;
  #include &lt;asm/traps.h&gt;
@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
  
      console_init_postirq();
  
+    gstage_mode_detect();
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I find it odd for something as fine grained as this to be called from top-
level start_xen(). Imo this wants to be a sub-function of whatever does
global paging and/or p2m preparations (or even more generally guest ones).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">It makes sense. I will move the call to gstage_mode_detect() into p2m_init()
when the latter is introduced.
Probably, I will move the current patch after p2m_init() is introduced to make
gstage_mode_detect() static function.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Maybe putting gstage_mode_detect() into p2m_init() is not a good idea, since it
is called during domain creation. I am not sure there is any point in calling
gstage_mode_detect() each time.

It seems that gstage_mode_detect() should be called once during physical CPU
initialization.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Indeed.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">A sub-function (riscv_hart_mm_init()? probably, riscv should be dropped from
the name) could be added in setup.c and then called in start_xen(), but
is it really needed a separate sub-function for something that will be called
once per initialization of pCPU?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Counter question: Is this going to remain the only piece of global init that's
needed for P2M machinery? Right in the next patch you already add vmid_init()
as another top-level call.</pre>
    </blockquote>
    <pre data-start="62" data-end="182">No, it isn’t the only piece — at least <code
    data-start="101" data-end="123">gstage_mode_detect()</code> and <code
    data-start="128" data-end="141">vmid_init()</code> are
also needed for the P2M machinery.</pre>
    <pre data-start="184" data-end="292">Okay, then it would be better to introduce a sub-function now and re-use it later
for other pCPUs as well.

~ Oleksii
</pre>
  </body>
</html>

--------------6SEF60HfqpTLDm8Sl0rw5G4x--

