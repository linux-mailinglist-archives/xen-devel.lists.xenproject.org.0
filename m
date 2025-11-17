Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D2C64FAA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 16:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164158.1491152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL1Wa-0004T1-6p; Mon, 17 Nov 2025 15:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164158.1491152; Mon, 17 Nov 2025 15:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL1Wa-0004Ra-3E; Mon, 17 Nov 2025 15:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1164158;
 Mon, 17 Nov 2025 15:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lv5t=5Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vL1WY-0004RE-Lx
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 15:52:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60fbe15f-c3cd-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 16:52:12 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7373fba6d1so434730866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 07:52:11 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad41cesm1089479166b.16.2025.11.17.07.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 07:52:09 -0800 (PST)
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
X-Inumbo-ID: 60fbe15f-c3cd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763394731; x=1763999531; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kyArrnqaqiFmAawX1hzqHI9xW8A/b/NnnN/SKQ3SH4=;
        b=ZtlR64ojYRDU1JsphQ4JVbWx5meLEx/13ZBFn3CFA22PAF35Oc4K+VivUw05uOnAZt
         oVmzSjaYXUtBS7mOqLbsyBvtfhFsSm/8m3xmwpNpsbx80HS25A8VT+mTccj5V+xIJ1Zu
         lobwzDlXlDGaRYaiGkLln/qQNwy7wSbc0e0uMJBx29zIzdYeINXAHrSwrjlzX8Sn+Gmu
         Lwlhs/3Dg7RzGLGpgB9gxe+lLgICZN7B+O7fjxd9c8dVNgxogNDnMm2Je2ZIx/40aQa2
         0K4cj3B/RXA9haxCy0ofcMRx16bEgv7ZSPzZRxeM82MQlCbzXyzA+DLV0juc1f4NwPVc
         pEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763394731; x=1763999531;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kyArrnqaqiFmAawX1hzqHI9xW8A/b/NnnN/SKQ3SH4=;
        b=vJejQA+4ZNnpZSLHZi8osyEoATEE8innrPQ6Z0aHdLMDoLrpwZqCzgu9rccjsCTSBL
         js1OKGf2CIcWeODeA/P6qy1r2oA0J863jCXOK6QefPpFWva677Kkl3Yi2dQ57JhA3MEl
         aqw0W+p7+4sx9PVWQLMWsBRAYlqx8riTGfHl6EWlqHvocKp+dmzPwvMEODLNTJzhQkt+
         kqpYanON1bn8IPqDbaFc40si8+dtzaI8T15/7jvgzxiIt9q71e5gabdnF/bVPI/N8yAa
         7MF+VMI/8DRtArcytnsI0M2WysLhWNDAh09JKTjWvKJsC7vwzmQS/xY9pTYM9Np+TJst
         lxUA==
X-Forwarded-Encrypted: i=1; AJvYcCUAbqPwU9dIL96qIa10ZYCvDAfHWAg+DUcHDYJXCIvqyWBischzju2CaA5d5zCe/oIFJv7ZpNQk6NE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoevfoNs0JZWMuGnYWYFoVT1NV7/9Yzf3TLDwogeqbfG1MAYIK
	xxmGZnK38NkzzJjvgEjSE2CDAGnYkS0mADjS0gVLG70iFk4k0y5h9SFl
X-Gm-Gg: ASbGnctaiK/9MY8fqD02CkY41PBcdvopwJoYnyDB/I/cFI68BPwcRgwRtNbEBjxyu3+
	nzSIscJN0k4GJTEhYLnHclex2B0xmv0EBOG0tvJLLZU63nFJ8SLOChKpFUerIOwNFyHuShs8+C1
	AB3N9ogYXstJWdzQ1mRDLEq4uBFcNybvXbmeikapyjlZ3i/6ecDh8n+18acmBtapuc3CIFQaSqs
	1O9AujuMD6QzkgesxcqMsPwsP4jmBMxsWoDGu2GGZG8h4SAdKr3UekS4E/25C8aSAaZ8zYYxv1r
	e9/Z7jvkdWItASftRgiu8PrcOfo7XqKMg99rBgNAKSQjlHTOoLhi0GKXOb3z00dfQyb6Xl/NPZz
	6rqNdgEzd+ZTz2RtALFJlIbIXXH/zApdaQQPGVUmIrkA5rgXwYqEq3jNvU35UDF+I7E1cRloxf+
	5p68QDQh6qiy2iOrq09cQE54T+9ehoi0zfg/a+++JQAWAq0+KJyg==
X-Google-Smtp-Source: AGHT+IFBDbRUWH6mMuCNRf6I0PLAXlUBiQUbxnn0aBSUFBg920UBlUAGNC3jNJs77HkBfnG29+ahGQ==
X-Received: by 2002:a17:906:cc99:b0:b73:aebe:e259 with SMTP id a640c23a62f3a-b73aebee4cbmr123539666b.34.1763394730483;
        Mon, 17 Nov 2025 07:52:10 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0ZNjfwRowauBfIo4cBQh0Yky"
Message-ID: <1cd26ed4-cf48-4524-acec-3d806a5cf953@gmail.com>
Date: Mon, 17 Nov 2025 16:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 17/18] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <3eea04894401202666ea0bb7ee1240a23ba54d8a.1760974017.git.oleksii.kurochko@gmail.com>
 <c40be165-0db3-4115-b96b-92624b669e74@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c40be165-0db3-4115-b96b-92624b669e74@suse.com>

This is a multi-part message in MIME format.
--------------0ZNjfwRowauBfIo4cBQh0Yky
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/25 5:46 PM, Jan Beulich wrote:
> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1049,3 +1049,178 @@ int map_regions_p2mt(struct domain *d,
>>   
>>       return rc;
>>   }
>> +
>> +/*
>> + * p2m_get_entry() should always return the correct order value, even if an
>> + * entry is not present (i.e. the GFN is outside the range):
>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]).    (1)
> There's one closing parenthesis too many here (likely the one before the colon).

You are right, ')' should be dropped. I think that "." could be drooped too.

>
>> + * This ensures that callers of p2m_get_entry() can determine what range of
>> + * address space would be altered by a corresponding p2m_set_entry().
>> + * Also, it would help to avoid cost page walks for GFNs outside range (1).
> DYM "costly"?

Agree, costly would be better here.

>
>> + * Therefore, this function returns true for GFNs outside range (1), and in
>> + * that case the corresponding level is returned via the level_out argument.
>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>> + * find the proper entry.
>> + */
>> +static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
>> +                                   unsigned int *level_out)
>> +{
>> +    unsigned int level;
>> +
>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>> +    {
>> +        unsigned long mask = 0;
>> +
>> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
>> +        {
>> +            unsigned long masked_gfn;
>> +
>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(level));
>> +            masked_gfn = gfn_x(gfn) & mask;
>> +
>> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
>> +                          : masked_gfn > gfn_x(boundary) )
>> +            {
>> +                *level_out = level;
> For this to be correct in the is_lower case, don't you need to fill the
> bottom bits of masked_gfn with all 1s, rather than with all 0s? Otherwise
> the tail of the range may be above boundary.

I think that I didn't get what you mean by "the range" here and so I can't understand
what is "the tail of the range".
Could you please clarify?

>
>> +struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>> +                                        p2m_type_t *t)
>> +{
>> +    struct page_info *page;
>> +    p2m_type_t p2mt = p2m_invalid;
>> +    mfn_t mfn;
>> +
>> +    p2m_read_lock(p2m);
>> +    mfn = p2m_get_entry(p2m, gfn, t, NULL);
>> +
>> +    if ( !mfn_valid(mfn) )
>> +    {
>> +        p2m_read_unlock(p2m);
>> +        return NULL;
>> +    }
>> +
>> +    if ( t )
>> +        p2mt = *t;
> Doesn't it need to be the other way around? The way you have it, when a caller
> passes NULL for t, p2m_get_entry() won't give you a type, and you'll do all
> further work with p2m_invalid.

IIUC, then the following should resolve the mentioned issue:
@@ -1344,11 +1344,14 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                          p2m_type_t *t)
  {
      struct page_info *page;
-    p2m_type_t p2mt = p2m_invalid;
+    p2m_type_t p2mt;
      mfn_t mfn;
  
      p2m_read_lock(p2m);
-    mfn = p2m_get_entry(p2m, gfn, t, NULL);
+    mfn = p2m_get_entry(p2m, gfn, &p2mt, NULL);

>
> Also, might this better move ahead of the earlier if()? Callers might be able
> to do still something based on the type, when they get back NULL as function
> return value. (Practically this might only become of interest once you add
> something like PoD, paging, or sharing.)

Agree with that, it should be moved before "if ( !mfn_valid(mfn) )"

Thanks.

~ Oleksii

--------------0ZNjfwRowauBfIo4cBQh0Yky
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
    <div class="moz-cite-prefix">On 11/10/25 5:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c40be165-0db3-4115-b96b-92624b669e74@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1049,3 +1049,178 @@ int map_regions_p2mt(struct domain *d,
 
     return rc;
 }
+
+/*
+ * p2m_get_entry() should always return the correct order value, even if an
+ * entry is not present (i.e. the GFN is outside the range):
+ *   [p2m-&gt;lowest_mapped_gfn, p2m-&gt;max_mapped_gfn]).    (1)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There's one closing parenthesis too many here (likely the one before the colon).</pre>
    </blockquote>
    <pre>You are right, ')' should be dropped. I think that "." could be drooped too.

</pre>
    <blockquote type="cite"
      cite="mid:c40be165-0db3-4115-b96b-92624b669e74@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * This ensures that callers of p2m_get_entry() can determine what range of
+ * address space would be altered by a corresponding p2m_set_entry().
+ * Also, it would help to avoid cost page walks for GFNs outside range (1).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
DYM "costly"?</pre>
    </blockquote>
    <pre>Agree, costly would be better here.

</pre>
    <blockquote type="cite"
      cite="mid:c40be165-0db3-4115-b96b-92624b669e74@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * Therefore, this function returns true for GFNs outside range (1), and in
+ * that case the corresponding level is returned via the level_out argument.
+ * Otherwise, it returns false and p2m_get_entry() performs a page walk to
+ * find the proper entry.
+ */
+static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
+                                   unsigned int *level_out)
+{
+    unsigned int level;
+
+    if ( is_lower ? gfn_x(gfn) &lt; gfn_x(boundary)
+                  : gfn_x(gfn) &gt; gfn_x(boundary) )
+    {
+        unsigned long mask = 0;
+
+        for ( level = P2M_ROOT_LEVEL; level; level-- )
+        {
+            unsigned long masked_gfn;
+
+            mask |= PFN_DOWN(P2M_LEVEL_MASK(level));
+            masked_gfn = gfn_x(gfn) &amp; mask;
+
+            if ( is_lower ? masked_gfn &lt; gfn_x(boundary)
+                          : masked_gfn &gt; gfn_x(boundary) )
+            {
+                *level_out = level;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For this to be correct in the is_lower case, don't you need to fill the
bottom bits of masked_gfn with all 1s, rather than with all 0s? Otherwise
the tail of the range may be above boundary.</pre>
    </blockquote>
    <pre>I think that I didn't get what you mean by "the range" here and so I can't understand
what is "the tail of the range".
Could you please clarify?

</pre>
    <blockquote type="cite"
      cite="mid:c40be165-0db3-4115-b96b-92624b669e74@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
+                                        p2m_type_t *t)
+{
+    struct page_info *page;
+    p2m_type_t p2mt = p2m_invalid;
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, t, NULL);
+
+    if ( !mfn_valid(mfn) )
+    {
+        p2m_read_unlock(p2m);
+        return NULL;
+    }
+
+    if ( t )
+        p2mt = *t;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Doesn't it need to be the other way around? The way you have it, when a caller
passes NULL for t, p2m_get_entry() won't give you a type, and you'll do all
further work with p2m_invalid.</pre>
    </blockquote>
    <pre>IIUC, then the following should resolve the mentioned issue:
@@ -1344,11 +1344,14 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                         p2m_type_t *t)
 {
     struct page_info *page;
-    p2m_type_t p2mt = p2m_invalid;
+    p2m_type_t p2mt;
     mfn_t mfn;
 
     p2m_read_lock(p2m);
-    mfn = p2m_get_entry(p2m, gfn, t, NULL);
+    mfn = p2m_get_entry(p2m, gfn, &amp;p2mt, NULL);

</pre>
    <blockquote type="cite"
      cite="mid:c40be165-0db3-4115-b96b-92624b669e74@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also, might this better move ahead of the earlier if()? Callers might be able
to do still something based on the type, when they get back NULL as function
return value. (Practically this might only become of interest once you add
something like PoD, paging, or sharing.)</pre>
    </blockquote>
    <pre>Agree with that, it should be moved before "if ( !mfn_valid(mfn) )"

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------0ZNjfwRowauBfIo4cBQh0Yky--

