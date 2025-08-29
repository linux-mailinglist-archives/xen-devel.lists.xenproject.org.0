Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C3B3B78D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 11:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100947.1454190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvUo-0002IW-NS; Fri, 29 Aug 2025 09:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100947.1454190; Fri, 29 Aug 2025 09:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvUo-0002H0-Ka; Fri, 29 Aug 2025 09:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1100947;
 Fri, 29 Aug 2025 09:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4pU=3J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urvUm-0002Gu-VS
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 09:34:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ebc95fe-84bb-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 11:34:06 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so11003995e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 02:34:06 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b66cdb5d1sm71708075e9.8.2025.08.29.02.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 02:34:05 -0700 (PDT)
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
X-Inumbo-ID: 4ebc95fe-84bb-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756460046; x=1757064846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v+O/R4J4uWq59iFdjDfiz2aSLQIFSnSFgkvWJcI+Ku0=;
        b=sz6+ZAIO1JYjW2BE3M/NZUrB2IGdgNv7HuwrCQ6E1/KAMekmzOZ0Xd3S+MnzvNHG20
         hX/CzGe4q0K0FjhB0Ok5FZ2IMsiU7P4+hMiKWkzq6FSsCCrZUznVhWPr59pn6dK4fIQJ
         RJChjcSiEoY0BgCmUAmI4LAE3iqSBI7iljrx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756460046; x=1757064846;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+O/R4J4uWq59iFdjDfiz2aSLQIFSnSFgkvWJcI+Ku0=;
        b=K7FrRdxLo66TFvw37ccxGFIIDd/b+zOdo1M3ClBZymPacxefM9dlO9EwUtxp+wMuky
         YsuYP4GWEsc63kgRqukzLGAe2V+jEuTM4iQMF1IyQcA71Tzf5VexFcvGrcsidtBL1ZoZ
         KNhY+DPLSdXHzirHjnJzvR6HN6JQoBpqE+kyG/pLMGpDj+eXxd601tYsT29bUs2HQ3kH
         zCT7ujVbqBshHkED/G0wDgkjwLN9ngMSgdRrhdNVOUCeTNf2UCWIiL/wE9E3Cf+UT1Vl
         hnpc3VhmLresOLUwrixHzjo2mqKuqS66JT+Scd+W4ABDoQppuXl1k1c/8qkvUDlQ17In
         yt4g==
X-Forwarded-Encrypted: i=1; AJvYcCWs7NZ/nngkQRqKsD9BlqEZ+xiPiJX0ZiKvMKfQy/WLVB7UZXHyidW3J0yQaGPUy3GQKWLnJVIwENQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVR/lKcLinbznc046+nW/o7T5xzOd2xRycfI42YECCnt/ENrT+
	t5HBthbRuIFx8JsdZmp/g64NIcVY2Bf5pt1mmDIUX2cipi+fi2+vgyGmgVU5q6VA8KY=
X-Gm-Gg: ASbGncvGHBigyF3CqExh4yzr4igrbBq1fi9Yl0aOgBkIsCKr9FVafxV0A48qOydAJcj
	U7q1oKRM6hMhTAXUJ6nvi5roC/VyXAqdNXe76G3cHVZV4iLsnsekltztyfQ4DWoaiTUPmMp6plq
	oH+8SFiKeSbO09lTDZZiwlYBPd1w6vkLhD0y+5cRLum6YoORfagcF65CMMMJSj7Oaff+HypjZT5
	3c0XtcAmYEsZLvXg6ZpQvmm3nIMYRWRui5yd0L1SSOrvmOwnjH6Q2vw94g+/+luWWWO9GM2Bmyv
	yKohRw2qbrRyJo3S4VTnpiou09Rjrv0A7m7E+OEerCDu3qYzu7ynPshI63OfGt9/jcD1IKkNPsu
	TqfpTMArL7yoF+vkQgNccvjgvNwBhw5aJyY/ejKVvDMqbH51MwpeC02Nr8OTz/xw/62HT8Eaw/b
	SeAEc=
X-Google-Smtp-Source: AGHT+IFotw/oij1X3x7hYgMRGhxE7xyk+XTRFYnYSebq8OklKgDUAvwPqzVpOWuWTu71e5+9sqd9SQ==
X-Received: by 2002:a05:600c:c87:b0:456:475b:7af6 with SMTP id 5b1f17b1804b1-45b5179b6aamr210443735e9.7.1756460045650;
        Fri, 29 Aug 2025 02:34:05 -0700 (PDT)
Message-ID: <4b852055-4651-46ad-8f04-3f95fb2fa631@citrix.com>
Date: Fri, 29 Aug 2025 10:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Optimise restore memory allocation
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250827123309.39699-1-frediano.ziglio@cloud.com>
 <3cf8eef1-04e6-44b9-ad41-144de9cbf1d7@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3cf8eef1-04e6-44b9-ad41-144de9cbf1d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2025 6:23 pm, Andrew Cooper wrote:
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
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> ---
>>  tools/libs/guest/xg_sr_restore.c | 39 ++++++++++++++++++++++++++++----
>>  1 file changed, 35 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
>> index 06231ca826..8dcb1b19c5 100644
>> --- a/tools/libs/guest/xg_sr_restore.c
>> +++ b/tools/libs/guest/xg_sr_restore.c
>> @@ -129,6 +129,8 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
>>      return 0;
>>  }
>>  
>> +#define IS_POWER_OF_2(n) (((n) & ((n) - 1)) == 0)
>> +
>>  /*
>>   * Given a set of pfns, obtain memory from Xen to fill the physmap for the
>>   * unpopulated subset.  If types is NULL, no page type checking is performed
>> @@ -141,6 +143,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>>      xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
>>          *pfns = malloc(count * sizeof(*pfns));
>>      unsigned int i, nr_pfns = 0;
>> +    bool contiguous = true;
>>      int rc = -1;
>>  
>>      if ( !mfns || !pfns )
>> @@ -159,18 +162,46 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>>              if ( rc )
>>                  goto err;
>>              pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
>> +            if ( pfns[nr_pfns] != pfns[0] + nr_pfns )
>> +                contiguous = false;
>>              ++nr_pfns;
>>          }
>>      }
>>  
>>      if ( nr_pfns )
>>      {
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
>     while ( nr )
>     {
>         if ( nr < 512 ) /* Can't be a superpage */
>         {
>             populate_physmap_4k(ctx, i, mfns);
>             mfns += i;
>             nr -= i;
>             continue;
>         }
>
>         if ( !ALIGNED_2M(mfn) ) /* Populate up until a point that could be a superpage */
>         {
>             while ( !ALIGNED_2M(mfn + i) )
>                 i++;
>             populate_physmap_4k(ctx, i, mfns);
>             mfns += i;
>             nr -= i;
>         }
>
>         if ( nr >= 512 )
>         {
>             for ( i = 1; i < 512; ++i )
>                 if ( mfns[i] != mfns[0] + i )
>                     break;
>             if ( i == 512 )
>                 populate_physmap_2M(ctx, i, mfns);
>             else
>                 populate_physmap_4k(...);
>
>             mfns += i;
>             nr -= i;
>         }
>     }
>
>
>
> Obviously with error handling, and whatever boundary conditions I've got
> wrong.
>
> 2M is the only size that matters (ignoring 1G which we've excluded for
> now), and this form will reconstruct more superpages for the guest than
> trying to do 4M allocations will.

Actually, I think a simpler option is to alter the first loop, where
you've got contiguous= right now.

Something like:

@@ -158,6 +165,18 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
             rc = pfn_set_populated(ctx, original_pfns[i]);
             if ( rc )
                 goto err;
+
+            if ( ALIGNED_2M(original_pfns[i]) &&
+                 can_populate_2M(&original_pfns[i], count - i) )
+            {
+                xen_pfn_t mfn = original_pfns[i];
+
+                rc = xc_domain_populate_physmap_exact(xch, ctx->domid, 1, ORDER_2M, 0, &mfn);
+
+                ...
+
+                i += 511;
+                continue;
+            }
+
             pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
             ++nr_pfns;
         }


with error handling of course.  This way we don't potentially fall back
to many separate hypercalls for 4k pages.

~Andrew

