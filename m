Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE54B311F5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 10:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089732.1447236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upNJX-0004J9-Ei; Fri, 22 Aug 2025 08:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089732.1447236; Fri, 22 Aug 2025 08:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upNJX-0004Gw-Be; Fri, 22 Aug 2025 08:39:59 +0000
Received: by outflank-mailman (input) for mailman id 1089732;
 Fri, 22 Aug 2025 08:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRuK=3C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1upNJV-0004Gq-PW
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 08:39:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 941ca271-7f33-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 10:39:55 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb73621fcso250133266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 01:39:55 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe018f1943sm376739466b.87.2025.08.22.01.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 01:39:54 -0700 (PDT)
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
X-Inumbo-ID: 941ca271-7f33-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755851995; x=1756456795; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8Bd09Tl0Ukd71FV0oXY4dST+KAj0jn7h4UW55YIQUI=;
        b=mP3CDuY1epN/BMkLF2ndWL3cb3gcW3XVL3y0gWc+B5eNmYz9FRD3w2YaFmLt4UTMre
         kNK5NSdpt/BtkpOxdTYAkb9/Wc8mBWGeJhd2h8v9ZL7w98PngwZIrO5isz8zqESMiXFM
         Oa1Uo8zR17tBJJiw/n5iFVaptz6klMPJPukwTw4/soZdk9ajQBlfQapgRDU3b3JjcwZ3
         2crH3m39twI6GzjYtdhjWmObL5PKn4FSDI13HWCbJuHKuhmyv0WL+lJbfNmlsPHWRU4f
         Zuj0KxHLjjrIdTkaJGaQd3EXbJxUNa5FjYybh8MWM85b5k3UsmoEBwwGvzmbnLJXFcrJ
         BMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755851995; x=1756456795;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8Bd09Tl0Ukd71FV0oXY4dST+KAj0jn7h4UW55YIQUI=;
        b=WPOmOjSAiE3qAxwm6eH1pRXMFenu8c1Qxn6U++sQ1dkgN+DGNBEODVLDYj+XXmTwKw
         F/Z9GWgM2+OAyNRPJ3gk/UQeNP28B3MNL/ohQmLhd/PBheS4Fb/AGki8ssEJiQlrrQVB
         JfFmXsqXQvpeUEcGBw+e3HxWpgbaM/iP5+iFWKPR6r/o28Q1YrzaHf+lUNuiskO3u1Nu
         RWY1wBnAS1/zMYr+d7gW1btQ6dRYnvGAyMZj+iXFdr10CGh6cQK0dXvd11uHRYKWyrpZ
         owh9sVe6hnmQsD6Yt7cClstt5k3PlPH/cSmIKfbZYzrKNpdweVV1ER58LQaCIHFtVUmh
         b31w==
X-Forwarded-Encrypted: i=1; AJvYcCWWeJRAx1f8JDPua7GseeaGOgpfLUoiICdPqtKdemjx53kXkpuFtKUQ85+VvCimTiD6la+jiioXgY8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDdJs5Q/XhFewLW0Y0OHOLv7Z05jxQ6BZ9cjjPixGJohEOUvqR
	YRraq+BSt9v4ZZgTnOWce7AABMcCt9F+6u3V83WDPDu1I9e2BEUd+EnM
X-Gm-Gg: ASbGncvbNASOiYqA21DoIqCGZMTKYOPNhKHK3ntiI25LxtszR0U793nACRiC5fNpepQ
	8euDGOb7vtpOZ7gsCMYpuKOxSN+UGznMQQoAR1iu7woFner80vJBcv0ufIsXsbDyvs1wk1I454V
	nDFEvz8TE/Ac4xaS1a0mENLGbDNEyO3Owg2MvgR+BqMkvMwpyB250/UTh6yUe1kPfGrKIoeBkjF
	1/PlbGbadD6yTtKE3OwX6LbeKV+ZOot54fYyaN4M6A/vdZzcF3eYYG/ne+S/+HJTSd44Xcdgsta
	3mkKUWv6D421WWeDnUjQUb0w9sPuS0lLeHt9uVSYxJMA7qwSptb1JwW9/SCkcXoZueNF6Rp9+qK
	ByqH0CbAhj/38cv8AED8AfpIae36my/Wfjl3++5PgZnQKISwXC91lcyUdDIlHtey8fpVV3+vabO
	Cb8ggSyQ==
X-Google-Smtp-Source: AGHT+IFE9Mx5Y81bn2hab/fXG36Bf3dRpOhiv0pYRX0PJxo969ou1ejSKaptOJ0Lcq5pezT7Kb/eiA==
X-Received: by 2002:a17:907:6e91:b0:afd:eb4f:d5cf with SMTP id a640c23a62f3a-afe29743b8fmr196742266b.63.1755851994625;
        Fri, 22 Aug 2025 01:39:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------LP3v1KWXJU2q3MxAZtuUzQJ3"
Message-ID: <205d50ff-5a7c-41b2-a72f-932f0a7cb4e1@gmail.com>
Date: Fri, 22 Aug 2025 10:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <24bb8ca6ad9d325f48d0c64b0fa461db5f0d0cc5.1753973161.git.oleksii.kurochko@gmail.com>
 <f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com>

This is a multi-part message in MIME format.
--------------LP3v1KWXJU2q3MxAZtuUzQJ3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/25 3:25 PM, Jan Beulich wrote:
>> + * The page_order will correspond to the order of the mapping in the page
>> + * table (i.e it could be a superpage).
>> + *
>> + * If the entry is not present, INVALID_MFN will be returned and the
>> + * page_order will be set according to the order of the invalid range.
>> + *
>> + * valid will contain the value of bit[0] (e.g valid bit) of the
>> + * entry.
>> + */
>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>> +                           p2m_type_t *t,
>> +                           unsigned int *page_order,
>> +                           bool *valid)
>> +{
>> +    unsigned int level = 0;
>> +    pte_t entry, *table;
>> +    int rc;
>> +    mfn_t mfn = INVALID_MFN;
>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
>> +
>> +    ASSERT(p2m_is_locked(p2m));
>> +    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
> What function-wide property is this check about? Even when moved ...
>
>> +    if ( valid )
>> +        *valid = false;
>> +
>> +    /* XXX: Check if the mapping is lower than the mapped gfn */
> (Nested: What is this about?)
>
>> +    /* This gfn is higher than the highest the p2m map currently holds */
>> +    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
>> +    {
>> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
>> +            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >
> ... into the more narrow scope where another XEN_PT_LEVEL_MASK() exists I
> can't really spot what the check is to guard against.

Missed to answer in my prev. reply to this and noticed that only during
start of reworking it.

I think it makes sense to update the comment above if condition, this is needed
to find the highest possible order by checking the base of the block mapping
is greater than the max mapped gfn as it is mentioned in the description of the
function, if the entry is not present, the function will return the order of
the invalid range.

I expect that probably it makes sense to do something similar for ->lowest_mapped_gfn
and it is a reason why /* XXX: ... */ comment exist.

~ Oleksii

>
>> +                 gfn_x(p2m->max_mapped_gfn) )
>> +                break;
>> +
>> +        goto out;
>> +    }
--------------LP3v1KWXJU2q3MxAZtuUzQJ3
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
    <div class="moz-cite-prefix">On 8/11/25 3:25 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+ * The page_order will correspond to the order of the mapping in the page
+ * table (i.e it could be a superpage).
+ *
+ * If the entry is not present, INVALID_MFN will be returned and the
+ * page_order will be set according to the order of the invalid range.
+ *
+ * valid will contain the value of bit[0] (e.g valid bit) of the
+ * entry.
+ */
+static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                           p2m_type_t *t,
+                           unsigned int *page_order,
+                           bool *valid)
+{
+    unsigned int level = 0;
+    pte_t entry, *table;
+    int rc;
+    mfn_t mfn = INVALID_MFN;
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_locked(p2m));
+    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
</pre></blockquote><pre wrap="" class="moz-quote-pre">What function-wide property is this check about? Even when moved ...

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+    if ( valid )
+        *valid = false;
+
+    /* XXX: Check if the mapping is lower than the mapped gfn */
</pre></blockquote><pre wrap="" class="moz-quote-pre">(Nested: What is this about?)

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+    /* This gfn is higher than the highest the p2m map currently holds */
+    if ( gfn_x(gfn) &gt; gfn_x(p2m-&gt;max_mapped_gfn) )
+    {
+        for ( level = P2M_ROOT_LEVEL; level; level-- )
+            if ( (gfn_x(gfn) &amp; (XEN_PT_LEVEL_MASK(level) &gt;&gt; PAGE_SHIFT)) &gt;
</pre></blockquote><pre wrap="" class="moz-quote-pre">... into the more narrow scope where another XEN_PT_LEVEL_MASK() exists I
can't really spot what the check is to guard against.</pre></pre>
    </blockquote>
    <pre>Missed to answer in my prev. reply to this and noticed that only during
start of reworking it.

I think it makes sense to update the comment above if condition, this is needed
to find the highest possible order by checking the base of the block mapping
is greater than the max mapped gfn as it is mentioned in the description of the
function, if the entry is not present, the function will return the order of
the invalid range.

I expect that probably it makes sense to do something similar for -&gt;lowest_mapped_gfn
and it is a reason why /* XXX: ... */ comment exist.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+                 gfn_x(p2m-&gt;max_mapped_gfn) )
+                break;
+
+        goto out;
+    }</pre></blockquote></pre>
    </blockquote>
  </body>
</html>

--------------LP3v1KWXJU2q3MxAZtuUzQJ3--

