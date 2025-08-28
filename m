Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3DB39EEF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098832.1452795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urciP-0004yX-IV; Thu, 28 Aug 2025 13:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098832.1452795; Thu, 28 Aug 2025 13:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urciP-0004wU-Eq; Thu, 28 Aug 2025 13:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1098832;
 Thu, 28 Aug 2025 13:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4L6=3I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1urciO-0004d7-0o
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:30:56 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 384769f3-8413-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 15:30:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so169731966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 06:30:53 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cdb01d515sm1339449a12.28.2025.08.28.06.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 06:30:51 -0700 (PDT)
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
X-Inumbo-ID: 384769f3-8413-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756387853; x=1756992653; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poU9btkk5ywisyID3Ow7xqH6Y903F6RfLqIY7KynyGY=;
        b=hklWAX9OEIztHLTYbmv7cd4rvmVfkAAAUFBb5ai8RRO31XHChExboaheup8KbD/12w
         Y322PzqjmPEgIgAtRb+ZA16nMtt0aL6qYKujIGBHBoccydZ8IxgiPe4NZcit0WzBZmux
         NBbktUFHoDCienB3sp//QcG8zsPScVqj62v/f45UaIj4TnATUi3y141bXXspkAunfM6/
         UMdL/A607I8F/JCN7QjX2C/MqIt6huPYqr3t35bcro2K4z54f3PtiYARUgdbLqZxzAJH
         QhR23z7hAV9iINZhy0jo6g07DWBzkKO1880l/D/tqUcxENMhitiWiW3a5SORu1THn955
         D0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387853; x=1756992653;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=poU9btkk5ywisyID3Ow7xqH6Y903F6RfLqIY7KynyGY=;
        b=c+liNVPepy/6kHuBm8xGNH42Og7o4mext7veiJbOrc4eLtTz3jM3Cwrur0VMY6aggT
         8pfFiK/gTbg1rCt2y/7rKJtVhnpPAakRZiIiUJyEew/uL8LS94ocxdKBd9ZQyI6dw0i2
         uaGGrBBha8UsgqqDAPSISSBfXMa2e291na+R20CAfim9TynNuwtHF4y1wzdg++0MRyPj
         ZS4BM+84L98wAuiXubLwUABBt1rgtw2qFqZbTPp0Hw3/TbM/rgjluyr0IC27TmHPeQpq
         8cGO3rNZb8TFb0Ngj9Ho7UGXFX5xTVAwsY4Ms2UkWSiew3SV744dz3ToLMWLmvmtjvRR
         OxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6y8PQ7wkFZ8XRKJL5zk6pbDPchC9k5fLTcONfbB5vjHlmzHtv60Kw1n8443B0q4vGkXnrTMIklwU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySoIhJFtAG95DaZdl3ZSuo/xFKmG10+jjVSD9mxWDIINwr7yVR
	4U5u0B3YfBdv8eBuGc+mOnJMKVpmL/Jy301RhBjG/1zi6g9QGVyhANin
X-Gm-Gg: ASbGncvw88b8kkGKVpJzi+jhsSxpn76FrZ/RZ59+1HowQp1K88ZNpGDAeyygMFxBcrM
	31LxrQBUcQeMamGdnlBjs4OORJ5fO+ktUaj27Nu9+Wr1NVp2eRlWw5BDM6hPjrfOaaaBrkRLUTN
	N4K4vZNsMAPogl6U6PIaTUm9PPNpyuqFY5SmhBNa3zZWNQqlT/FOr/N0WCarEBSdRl+ue1Ive/n
	37Al0IqRqTkc+81KGbzguQz20S+NEOzlcgvEe/MtJmB0REYG4MtQd48hDYHNJTLz/2W2RbMciKO
	PwzRzyUBhMwmSvyoxMarOEtBeNqDpXlhVZulMpoTaN5NbgLWyX3lD3hz9s/iQRDXjCLGCyDym0Z
	SmKIuAsMg2t7Xb6eeGm+xZsFYh3SBFWvQhCdTpgkrnThEl2zOSIH4QAYa3eeIoRvQHyAW/rp1vA
	3RnSK1pg==
X-Google-Smtp-Source: AGHT+IGDU4fmaLq9wpLWM0wkbIQqC8pN5iL2cnv3AcXtSdFJMOmTXdQ6kQYsPHQVeh107h2sWsGWUA==
X-Received: by 2002:a17:907:1ca2:b0:afe:bbeb:1f61 with SMTP id a640c23a62f3a-afebbeb25d6mr630929766b.16.1756387852346;
        Thu, 28 Aug 2025 06:30:52 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UE91rRe1RLfqhJu1GwWz81oz"
Message-ID: <33c8fa6d-5cd0-463f-bc7f-2671ca9fa571@gmail.com>
Date: Thu, 28 Aug 2025 15:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Optimise restore memory allocation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250827123309.39699-1-frediano.ziglio@cloud.com>
 <3cf8eef1-04e6-44b9-ad41-144de9cbf1d7@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3cf8eef1-04e6-44b9-ad41-144de9cbf1d7@citrix.com>

This is a multi-part message in MIME format.
--------------UE91rRe1RLfqhJu1GwWz81oz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/27/25 7:23 PM, Andrew Cooper wrote:
> Subject wants to be at least tools/libxc, and probably "Use superpages
> where possible on migrate/resume"
>
>
> On 27/08/2025 1:33 pm, Frediano Ziglio wrote:
>> Try to allocate larger order pages.
>> With some test memory program stressing TLB (many small random
>> memory accesses) you can get 15% performance improves.
>> On the first memory iteration the sender is currently sending
>> memory in 4mb aligned chunks which allows the receiver to
>> allocate most pages as 2mb superpages instead of single 4kb pages.
> It's critical to say somewhere that this is applicable to HVM guests.
>
> You've eluded to it, but it's important to state clearly that, for HVM
> guests, PAGE_DATA records contain metadata about GFNs in aligned 4M
> blocks.  This is why we don't even need to buffer a second record.
>
> It's also worth stating that 1G superpages are left for later.
>
>
> CC-ing Oleksii as release manager.  This is a fix for a (mis)feature
> which has been known for a decade (since Xen 4.6), and for which two
> series have been posted but not managed to get in.  Unlike those series,
> this is a very surgical fix that gets the majority of the perf win back,
> without the complexity of trying to guess at 1G pages.
>
> Therefore I'd like to request that it be considered for 4.21 at this
> juncture.
>
Such a significant performance increase is a good reason to include this
in 4.21. We also still have enough time to test it properly.

If there are no objections:Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> Thanks. 
~ Oleksii

>> Signed-off-by: Frediano Ziglio<frediano.ziglio@cloud.com>
>> ---
>>   tools/libs/guest/xg_sr_restore.c | 39 ++++++++++++++++++++++++++++----
>>   1 file changed, 35 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
>> index 06231ca826..8dcb1b19c5 100644
>> --- a/tools/libs/guest/xg_sr_restore.c
>> +++ b/tools/libs/guest/xg_sr_restore.c
>> @@ -129,6 +129,8 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
>>       return 0;
>>   }
>>   
>> +#define IS_POWER_OF_2(n) (((n) & ((n) - 1)) == 0)
>> +
>>   /*
>>    * Given a set of pfns, obtain memory from Xen to fill the physmap for the
>>    * unpopulated subset.  If types is NULL, no page type checking is performed
>> @@ -141,6 +143,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>>       xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
>>           *pfns = malloc(count * sizeof(*pfns));
>>       unsigned int i, nr_pfns = 0;
>> +    bool contiguous = true;
>>       int rc = -1;
>>   
>>       if ( !mfns || !pfns )
>> @@ -159,18 +162,46 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>>               if ( rc )
>>                   goto err;
>>               pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
>> +            if ( pfns[nr_pfns] != pfns[0] + nr_pfns )
>> +                contiguous = false;
>>               ++nr_pfns;
>>           }
>>       }
>>   
>>       if ( nr_pfns )
>>       {
>> -        rc = xc_domain_populate_physmap_exact(
>> -            xch, ctx->domid, nr_pfns, 0, 0, mfns);
>> +        /* try optimizing using larger order */
>> +        rc = -1;
>> +        /*
>> +         * The "nr_pfns <= (1 << 18)" check is mainly for paranoia, it should
>> +         * never happen, the sender would have to send a really large packet.
>> +         */
>> +        if ( contiguous && nr_pfns <= (1 << 18) &&
> This is an arbitrary limit, and to contradict the prior feedback given
> in private, the domain's MAX_ORDER isn't relevant here.  It's the
> toolstack's choice how to lay out the guest in memory.
>
>> +             IS_POWER_OF_2(nr_pfns) && (pfns[0] & (nr_pfns - 1)) == 0 )
>> +        {
>> +            const unsigned int extent_order = __builtin_ffs(nr_pfns) - 1;
> This (non-)loop isn't great.  You'll e.g. use 4k pages for the second 2M
> page of an HVM guest simply because the VGA hole exists in the first.
>
> I think you probably want something like:
>
> int populate_physmap_4k(ctx, nr, mfns);
> int populate_physmap_2M(ctx, nr, mfns);
>
> as simple wrappers around the raw hypercalls including transforming back
> the mfns[] array, and:
>
> int populate_phymap(...);
>
> with logic of the form:
>
>      while ( nr )
>      {
>          if ( nr < 512 ) /* Can't be a superpage */
>          {
>              populate_physmap_4k(ctx, i, mfns);
>              mfns += i;
>              nr -= i;
>              continue;
>          }
>
>          if ( !ALIGNED_2M(mfn) ) /* Populate up until a point that could be a superpage */
>          {
>              while ( !ALIGNED_2M(mfn + i) )
>                  i++;
>              populate_physmap_4k(ctx, i, mfns);
>              mfns += i;
>              nr -= i;
>          }
>
>          if ( nr >= 512 )
>          {
>              for ( i = 1; i < 512; ++i )
>                  if ( mfns[i] != mfns[0] + i )
>                      break;
>              if ( i == 512 )
>                  populate_physmap_2M(ctx, i, mfns);
>              else
>                  populate_physmap_4k(...);
>
>              mfns += i;
>              nr -= i;
>          }
>      }
>
>
>
> Obviously with error handling, and whatever boundary conditions I've got
> wrong.
>
> 2M is the only size that matters (ignoring 1G which we've excluded for
> now), and this form will reconstruct more superpages for the guest than
> trying to do 4M allocations will.
>
> ~Andrew
--------------UE91rRe1RLfqhJu1GwWz81oz
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
    <div class="moz-cite-prefix">On 8/27/25 7:23 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3cf8eef1-04e6-44b9-ad41-144de9cbf1d7@citrix.com">
      <pre wrap="" class="moz-quote-pre">Subject wants to be at least tools/libxc, and probably "Use superpages
where possible on migrate/resume"


On 27/08/2025 1:33 pm, Frediano Ziglio wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Try to allocate larger order pages.
With some test memory program stressing TLB (many small random
memory accesses) you can get 15% performance improves.
On the first memory iteration the sender is currently sending
memory in 4mb aligned chunks which allows the receiver to
allocate most pages as 2mb superpages instead of single 4kb pages.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It's critical to say somewhere that this is applicable to HVM guests.

You've eluded to it, but it's important to state clearly that, for HVM
guests, PAGE_DATA records contain metadata about GFNs in aligned 4M
blocks.  This is why we don't even need to buffer a second record.

It's also worth stating that 1G superpages are left for later.


CC-ing Oleksii as release manager.  This is a fix for a (mis)feature
which has been known for a decade (since Xen 4.6), and for which two
series have been posted but not managed to get in.  Unlike those series,
this is a very surgical fix that gets the majority of the perf win back,
without the complexity of trying to guess at 1G pages.

Therefore I'd like to request that it be considered for 4.21 at this
juncture.

</pre>
    </blockquote>
    <pre>Such a significant performance increase is a good reason to include this
in 4.21. We also still have enough time to test it properly.

If there are no objections:<span class="Y2IQFc" lang="en">
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</span></pre>
    <blockquote type="cite"
      cite="mid:3cf8eef1-04e6-44b9-ad41-144de9cbf1d7@citrix.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>
---
 tools/libs/guest/xg_sr_restore.c | 39 ++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 06231ca826..8dcb1b19c5 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -129,6 +129,8 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
     return 0;
 }
 
+#define IS_POWER_OF_2(n) (((n) &amp; ((n) - 1)) == 0)
+
 /*
  * Given a set of pfns, obtain memory from Xen to fill the physmap for the
  * unpopulated subset.  If types is NULL, no page type checking is performed
@@ -141,6 +143,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
         *pfns = malloc(count * sizeof(*pfns));
     unsigned int i, nr_pfns = 0;
+    bool contiguous = true;
     int rc = -1;
 
     if ( !mfns || !pfns )
@@ -159,18 +162,46 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
             if ( rc )
                 goto err;
             pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
+            if ( pfns[nr_pfns] != pfns[0] + nr_pfns )
+                contiguous = false;
             ++nr_pfns;
         }
     }
 
     if ( nr_pfns )
     {
-        rc = xc_domain_populate_physmap_exact(
-            xch, ctx-&gt;domid, nr_pfns, 0, 0, mfns);
+        /* try optimizing using larger order */
+        rc = -1;
+        /*
+         * The "nr_pfns &lt;= (1 &lt;&lt; 18)" check is mainly for paranoia, it should
+         * never happen, the sender would have to send a really large packet.
+         */
+        if ( contiguous &amp;&amp; nr_pfns &lt;= (1 &lt;&lt; 18) &amp;&amp;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is an arbitrary limit, and to contradict the prior feedback given
in private, the domain's MAX_ORDER isn't relevant here.  It's the
toolstack's choice how to lay out the guest in memory.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+             IS_POWER_OF_2(nr_pfns) &amp;&amp; (pfns[0] &amp; (nr_pfns - 1)) == 0 )
+        {
+            const unsigned int extent_order = __builtin_ffs(nr_pfns) - 1;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This (non-)loop isn't great.  You'll e.g. use 4k pages for the second 2M
page of an HVM guest simply because the VGA hole exists in the first.

I think you probably want something like:

int populate_physmap_4k(ctx, nr, mfns);
int populate_physmap_2M(ctx, nr, mfns);

as simple wrappers around the raw hypercalls including transforming back
the mfns[] array, and:

int populate_phymap(...);

with logic of the form:

    while ( nr )
    {
        if ( nr &lt; 512 ) /* Can't be a superpage */
        {
            populate_physmap_4k(ctx, i, mfns);
            mfns += i;
            nr -= i;
            continue;
        }

        if ( !ALIGNED_2M(mfn) ) /* Populate up until a point that could be a superpage */
        {
            while ( !ALIGNED_2M(mfn + i) )
                i++;
            populate_physmap_4k(ctx, i, mfns);
            mfns += i;
            nr -= i;
        }

        if ( nr &gt;= 512 )
        {
            for ( i = 1; i &lt; 512; ++i )
                if ( mfns[i] != mfns[0] + i )
                    break;
            if ( i == 512 )
                populate_physmap_2M(ctx, i, mfns);
            else
                populate_physmap_4k(...);

            mfns += i;
            nr -= i;
        }
    }



Obviously with error handling, and whatever boundary conditions I've got
wrong.

2M is the only size that matters (ignoring 1G which we've excluded for
now), and this form will reconstruct more superpages for the guest than
trying to do 4M allocations will.

~Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------UE91rRe1RLfqhJu1GwWz81oz--

