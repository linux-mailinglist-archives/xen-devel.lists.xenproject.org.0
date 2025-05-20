Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10BABD76C
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 13:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990678.1374608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLXY-0005rD-IN; Tue, 20 May 2025 11:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990678.1374608; Tue, 20 May 2025 11:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLXY-0005pm-FW; Tue, 20 May 2025 11:53:48 +0000
Received: by outflank-mailman (input) for mailman id 990678;
 Tue, 20 May 2025 11:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHLXX-0005pg-2s
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 11:53:47 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 145f6bf4-3571-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 13:53:44 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad5394be625so52246666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 04:53:43 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f2cd8sm7093085a12.15.2025.05.20.04.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 04:53:42 -0700 (PDT)
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
X-Inumbo-ID: 145f6bf4-3571-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747742023; x=1748346823; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfZkE131mIxLsC0cdTVCU8aUE78yQal29ryN+ESy2ss=;
        b=TLh0j7qudPeUUe6zfaubnM/GP6wf1PK4gaf3ZmgDlI8U4IohGPoFLHUPS6tI0Y52AS
         K04Bmg2b7cXZZ+NwObdA5x76GYdXNsmQKyGMEEx0S7A9zP5mn3gT8tdOV5G73gCV7hzg
         wWn4jsnL9DV/4SLXHLBekLkifShNU2i4eHcowICZm2PXYyPOqvgUysJWFPprn5t1+7dp
         +bnWKnYEGRZoo+4gdnOAHNrFYwfC+Ixd4pMr1M0DVQiNVlDn3/s5zAtlb2fGQ+naKR7d
         yUOZLHhLK+s/14q4A5UKoLeEr7shSdBcZYaR1WdROV8sGrDFoQ914tNmLoFVrCOTh4A3
         YD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747742023; x=1748346823;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xfZkE131mIxLsC0cdTVCU8aUE78yQal29ryN+ESy2ss=;
        b=UihU/mbcrmtd6l9hIGpZNjuzWxWBiIUgmEgZI8rMvF9mGrlBJKbwGk+ia4d5/yUNWI
         zLZkB9/WYRqouGSMpD82RIciYSCmNNH4seLeqGAKtQiUVLisxSezFgB4suh3Dt70HIih
         r+PoJ1xpg1hnLlyym2Bbjxhyo6IlkkJOMZcw+t/ZbIbDuTjrqJpjwGC9S5EXZ/ZFTzNH
         NTc601BpwEgS5URKyn3h+x9YkdYg0ML3kYJ5lX7e0lUeO0cFEHfWSGRfWQQpyXQvQWLt
         4EOPafF2mKTtxFTW0I+feb58+XB3ypc0lu8hymoLOcgwS8xxlzax4OVCmHcoKb2hv3W2
         q3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBbmZhohx7eyMcee+8J8OA/oXDVQFc4fvEMrVTcQ21WZeaRYPoDUX72w3RZJc+i7xbgJn5dwC7djc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwVEwCtUNxPbCJMY+Blb0+SpsleroIsII+WnReCC/E07tudhrH
	7znjoXNoPnaCzSwaOw8iqnFaGku9Tl7PYaahoSs9zRuArKzG+Y8N6oYW
X-Gm-Gg: ASbGncv+pCmhrOB21D139K4dWSYH9dI2dcl/YUkAspmicmz+8F5z1MVgTSJLQNWSO+l
	Hdkp3rSwx5yLyefaFwmgHoPfz9IQy6CsHDKjaXJGDi6FpwsSIaItTqJ+vrGSVpro6m/LIuEdRgK
	Ev+AyT97tMIUIZGKoSy0seuuxP/nbsLMHtp7+Orb54PDprloHj8h4schWJCRMuHUVLXE1FAL2uY
	49E5Tdhl9I25wKFbNN6wKzrGcIkBap8X2QCEw0y9sY7cd1+3GM6o3kGUV3ZCUYOAbkxgxufV89d
	oeOkCh6ZmqBwYcLl+5xB1CTMQ+04oq+42jN8EGsh6A/JW0l24GTFlARJBOTrv+iUjndJnYaX58c
	GE/RxBDArgxyhcPcWgoBKfdVh
X-Google-Smtp-Source: AGHT+IFuwRSG4zKXovxptz9vbfe/65SZs9ADDF35ldbwi+trGwL0DwXS2UOvgfN/6LVqIMLCF9qHjA==
X-Received: by 2002:a17:907:7da8:b0:ad2:4fb7:6cd7 with SMTP id a640c23a62f3a-ad536b5a0e6mr1437237566b.2.1747742022850;
        Tue, 20 May 2025 04:53:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------hZtnhytO99qVl3cCHO8z3lAw"
Message-ID: <c24c40bb-7948-44bf-8144-a7bb7236a105@gmail.com>
Date: Tue, 20 May 2025 13:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] xen/riscv: implement setup_irq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <6f17bbf0eb6240d7389d389f0973af6fda5cce29.1746530883.git.oleksii.kurochko@gmail.com>
 <5f8a2840-2080-4b04-8298-0f5e22eaf5c0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5f8a2840-2080-4b04-8298-0f5e22eaf5c0@suse.com>

This is a multi-part message in MIME format.
--------------hZtnhytO99qVl3cCHO8z3lAw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 11:57 AM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> @@ -58,6 +59,89 @@ int platform_get_irq(const struct dt_device_node *device, int index)
>>       return dt_irq.irq;
>>   }
>>   
>> +static int _setup_irq(struct irq_desc *desc, unsigned int irqflags,
>> +                      struct irqaction *new)
>> +{
>> +    bool shared = irqflags & IRQF_SHARED;
>> +
>> +    ASSERT(new != NULL);
>> +
>> +    /*
>> +     * Sanity checks:
>> +     *  - if the IRQ is marked as shared
>> +     *  - dev_id is not NULL when IRQF_SHARED is set
>> +     */
>> +    if ( desc->action != NULL && (!(desc->status & IRQF_SHARED) || !shared) )
>> +        return -EINVAL;
>> +    if ( shared && new->dev_id == NULL )
>> +        return -EINVAL;
>> +
>> +    if ( shared )
>> +        desc->status |= IRQF_SHARED;
>> +
>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>> +    new->next = desc->action;
>> +#endif
> Didn't you indicate you'd drop this?

To one of replies I wrote that probably something (eg RISC-V's IOMMU) will want to setup
multiple handler for the same interrupt. But I'm not sure yet. I can drop for now and
return back when it will be really a use case.

~ Oleksii

--------------hZtnhytO99qVl3cCHO8z3lAw
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
    <div class="moz-cite-prefix">On 5/15/25 11:57 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5f8a2840-2080-4b04-8298-0f5e22eaf5c0@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -58,6 +59,89 @@ int platform_get_irq(const struct dt_device_node *device, int index)
     return dt_irq.irq;
 }
 
+static int _setup_irq(struct irq_desc *desc, unsigned int irqflags,
+                      struct irqaction *new)
+{
+    bool shared = irqflags &amp; IRQF_SHARED;
+
+    ASSERT(new != NULL);
+
+    /*
+     * Sanity checks:
+     *  - if the IRQ is marked as shared
+     *  - dev_id is not NULL when IRQF_SHARED is set
+     */
+    if ( desc-&gt;action != NULL &amp;&amp; (!(desc-&gt;status &amp; IRQF_SHARED) || !shared) )
+        return -EINVAL;
+    if ( shared &amp;&amp; new-&gt;dev_id == NULL )
+        return -EINVAL;
+
+    if ( shared )
+        desc-&gt;status |= IRQF_SHARED;
+
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    new-&gt;next = desc-&gt;action;
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Didn't you indicate you'd drop this?</pre>
    </blockquote>
    <pre>To one of replies I wrote that probably something (eg RISC-V's IOMMU) will want to setup
multiple handler for the same interrupt. But I'm not sure yet. I can drop for now and
return back when it will be really a use case.

~ Oleksii
</pre>
  </body>
</html>

--------------hZtnhytO99qVl3cCHO8z3lAw--

