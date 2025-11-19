Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8AAC70585
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 18:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166189.1492796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlik-0003Te-LT; Wed, 19 Nov 2025 17:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166189.1492796; Wed, 19 Nov 2025 17:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlik-0003R8-I4; Wed, 19 Nov 2025 17:11:54 +0000
Received: by outflank-mailman (input) for mailman id 1166189;
 Wed, 19 Nov 2025 17:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vLlii-0003QQ-AZ
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 17:11:52 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1685235-c56a-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 18:11:42 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so2272001a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 09:11:42 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536443784sm28039a12.28.2025.11.19.09.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 09:11:40 -0800 (PST)
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
X-Inumbo-ID: d1685235-c56a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763572301; x=1764177101; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyO+CWlpUJBi6y30o1PBbKSYtgX/eWjDnWW4N07oIOw=;
        b=mdw1IrOgHuJK4P+hnTx/jckpJxlExHPnJ63raH2DA0GRs42q15nUg798EQFd5kUa+p
         7baKgXrFSSOb93O4hmFoDNYyrLiHy8QVT8AB4H/pHF1dXLFwEiI6crUwXOy+BvxR84Iq
         5Dp5mTM+SE01l0IxCxVJ5HrgBgC/imi8/D8gJYIvo9KOYoQYki1XMlRaUsWnSo+vhUkj
         lOQFVU0eLZPYfZfVytdrqk/dbLZf1vLrJgpf2eDqVItz0vWhAbXsT/L+ZOPwQNOFY7LY
         eqVwlmOzVfAjw4YNCngeKcUVvL3uwp/iqbBckMdwb7Ntjd6YvpAdXFNgmmfTDRn1PR5m
         3eFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572301; x=1764177101;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyO+CWlpUJBi6y30o1PBbKSYtgX/eWjDnWW4N07oIOw=;
        b=NhOfUVoB17iNUUBa/pqZqBFPjLFMFBQME2akVjFJtYbOlg3ceH5Pup3VyjRuXOL3Z1
         eFQGvhXtrmYI/nRt5A+InFnGbgIZqV/1hL4eVK1avHAIzvh8mQyWzFkTwzYz+Xkm3F9W
         f7VtjIOLmEGAgZrB9WBbrgekPhwZZaCFqqzl7wfV0GVDKZ+20AOTnXzKs2SaVSIvkkov
         ZWuAumidtAu8dLmXxhgELT4qr8D41UoS69yC3KheB0chadZS3bhEIglouV9MecsvoZn7
         C4NfKaR8YV4hl5da4LpvA/MYDPbI0m/Sbo3o3z4IV/2HUw2b8xI5Uwii0DHdIJxJkBqP
         NWCg==
X-Forwarded-Encrypted: i=1; AJvYcCXeCbm4us/B6sYdlTgT1o8d0VxMRLTeQJeQEFRfwJj+obas9/tUmi8qIOr75i+DUccMCxFMOQMkE8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9xCdKa+swhYKRmtLJAHr9NI6hsC+i0kEqRqqou0TZl3oHPk6+
	IV5dyPuP5mwc6FKD0FcV2s6l6gcKEMTlIMGp97qFZnxPJbbmepXvasve
X-Gm-Gg: ASbGncvnNVae6tmvnDlbdT0ZYKGfZa1Pnxti5If25+CvGGj6hvukM8vJHY5BYQ21aPp
	w1BxnFJfgyHeKoVMSL7jwwihjdEpC2ZVHrQgXeRe/Wc76vLmhiOUcPdrpgqMQYw5oUHPkP2c2EZ
	unJcvNGJ9mbUvEyvi93t1vnEwbh60uh4n3luPJrXPAoLZujla7qQ/78XbeWSM8GkcTbUP7aoO3V
	tpgx/UzPI/tRDy+NQEDh1drEQLO8M7hKOSoLvUQ/Eb47aZth8f/mRRTXmwIQmD0ZB40Hsz0iIlh
	HGNJGux1vz5deMZVAa2TVXEJZVMfCKPifhCQ9xKqKNP0xDk9D1BxFkEQfxlebCStjW60PSr9guP
	ICZuWRP1Jsq8wLaSKtckBU3Nq1E780VCCX8tNzHJ0oxwyytm/+/FzUtX72lE4fbIdfX8JQhpiHu
	/CgB2Uq+sCw9/pPqf5FuosUHmvVmdrsAru0Bi+WoQZxRufwNfttTGLgQXZDGo5VUyjjozrGNk=
X-Google-Smtp-Source: AGHT+IG+tniha4CZVcTYRL22zdXWzQoMvZIzjSaQBgeBWIpo/rPTL4314HqPtRDddD7z5tqwlm6ZIQ==
X-Received: by 2002:a05:6402:3583:b0:63c:1e15:b9fb with SMTP id 4fb4d7f45d1cf-6453643d11fmr63251a12.22.1763572301193;
        Wed, 19 Nov 2025 09:11:41 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0X0aeALjqkcNTZ3peP7NrZqg"
Message-ID: <a3b00440-28d5-4c22-874a-d4f017b0766f@gmail.com>
Date: Wed, 19 Nov 2025 18:11:39 +0100
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
 <1cd26ed4-cf48-4524-acec-3d806a5cf953@gmail.com>
 <499df585-d50e-435c-8496-bc6078dd504b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <499df585-d50e-435c-8496-bc6078dd504b@suse.com>

This is a multi-part message in MIME format.
--------------0X0aeALjqkcNTZ3peP7NrZqg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/17/25 5:00 PM, Jan Beulich wrote:
> On 17.11.2025 16:52, Oleksii Kurochko wrote:
>> On 11/10/25 5:46 PM, Jan Beulich wrote:
>>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>>> +static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
>>>> +                                   unsigned int *level_out)
>>>> +{
>>>> +    unsigned int level;
>>>> +
>>>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>>>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>>>> +    {
>>>> +        unsigned long mask = 0;
>>>> +
>>>> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
>>>> +        {
>>>> +            unsigned long masked_gfn;
>>>> +
>>>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(level));
>>>> +            masked_gfn = gfn_x(gfn) & mask;
>>>> +
>>>> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
>>>> +                          : masked_gfn > gfn_x(boundary) )
>>>> +            {
>>>> +                *level_out = level;
>>> For this to be correct in the is_lower case, don't you need to fill the
>>> bottom bits of masked_gfn with all 1s, rather than with all 0s? Otherwise
>>> the tail of the range may be above boundary.
>> I think that I didn't get what you mean by "the range" here and so I can't understand
>> what is "the tail of the range".
>> Could you please clarify?
> By applying "mask" you effectively produce a range (with "gfn" somewhere in
> the middle). For the level (which you return to the caller) to be correct,
> the entire range must be matching "gfn" in being below or above of the
> boundary. My impression is that this isn't the case when is_lower is true.

Oh, got it. Then I agree that when is_lower is true we really need to fill the bottoms
bits of masked_gfn with all 1s.

Thanks for clarifying.

~ Oleksii

--------------0X0aeALjqkcNTZ3peP7NrZqg
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
    <div class="moz-cite-prefix">On 11/17/25 5:00 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:499df585-d50e-435c-8496-bc6078dd504b@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.11.2025 16:52, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 11/10/25 5:46 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:58, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
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
          <pre wrap="" class="moz-quote-pre">For this to be correct in the is_lower case, don't you need to fill the
bottom bits of masked_gfn with all 1s, rather than with all 0s? Otherwise
the tail of the range may be above boundary.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that I didn't get what you mean by "the range" here and so I can't understand
what is "the tail of the range".
Could you please clarify?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
By applying "mask" you effectively produce a range (with "gfn" somewhere in
the middle). For the level (which you return to the caller) to be correct,
the entire range must be matching "gfn" in being below or above of the
boundary. My impression is that this isn't the case when is_lower is true.
</pre>
    </blockquote>
    <pre>Oh, got it. Then I agree that when is_lower is true we really need to fill the bottoms
bits of masked_gfn with all 1s.

Thanks for clarifying.

~ Oleksii</pre>
  </body>
</html>

--------------0X0aeALjqkcNTZ3peP7NrZqg--

