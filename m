Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685BD9EAFC9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852147.1266039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyKG-0004Um-5G; Tue, 10 Dec 2024 11:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852147.1266039; Tue, 10 Dec 2024 11:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyKG-0004Rw-1x; Tue, 10 Dec 2024 11:22:48 +0000
Received: by outflank-mailman (input) for mailman id 852147;
 Tue, 10 Dec 2024 11:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tKyKE-0004Rq-OB
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:22:46 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13a8e3e9-b6e9-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 12:22:44 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3e8f64d5dso4532868a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 03:22:44 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3dd4f641bsm4848120a12.51.2024.12.10.03.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 03:22:43 -0800 (PST)
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
X-Inumbo-ID: 13a8e3e9-b6e9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733829764; x=1734434564; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qup0cVCyJDRhtn49zetXW1dYP3Q8KNLLw66dhKfZx4g=;
        b=EQU6K672ohkKGL5UONFwVH3oA6YwRF4BtrO9+mvJL2h3dIfxRj59JEZN/vnarCBikX
         iv6bkiAV7JrzgzUMZfDUpANFxcv9mL1hvil5uBmoQ9tJp/YFj881XMxoQ6c4BK83oV1b
         XNIf9ZexoqX3AQoJsWaVWHI3FzP5QjpfA1OY5x/jtkv5l98S7ftKeRiiannHgiNgW2Gy
         ruZZ3GKYUadHoYHRn0MrmqN+xSWxHPa7/78CF+/wVGvBlUnAcODwLEt/9y8vZwxxV6Y8
         WB0J64PhKWo8Cpg6fSnVS77ErPVkqDWSKFX9eU7WvHcW097XSWXcmAgK2cTuILq99zG/
         DTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733829764; x=1734434564;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qup0cVCyJDRhtn49zetXW1dYP3Q8KNLLw66dhKfZx4g=;
        b=Yg9p7DWUJJvMGWmu99W/1+2IMxgSkNtlJ8ZfBGS0FKQ4y/nh5gT67+6WjWXH2M99X8
         kygvabnmJVfCtSX02wSVsm/v/tJpSqXbyaxFuVSlx5k1WLs6yLgE7AgntPqU6qKQfaBL
         SZCJ7V+IshfLPVczmy0PQ1KREbY4G2SJqCHtHreWFI7j6LM7fXbwJzTID+Tf1o7CEhYl
         ugh0c1LS830NkC0S9Tsjr/wAfLL5qNgMGVh/WSHS/N5Q216HfOUo0ogHcyHyjbE3yPcD
         FpV6SbhQkw9f+vIWJrAs026CHR/qlJZL4Gkziuari5ZWc6ldto9y9SVZyPaFXtxtYoEB
         q7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF+qRY1ccgT4yFRZQIU5uuggRfFAyDPgZYcsqBY5K2GxBac9MC2dN6l8S0yhAzg7cHfYy/ahyoWi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyO9h2SXmbl1TJ+yGTx977giwMD7ptIcpTJOspHfsgEdj26paOE
	7H4wlC7Th+qRTL2huOQVBb7kCbxq0CtqetT8fuymvlPiBU6TyVdG
X-Gm-Gg: ASbGnctTlbSsTzrzDnjBrF9bXjMYgbHdbVJoaNnaUidv1+TAcRVXJX+Ia8/EIErPOO5
	uAVYX89eGX12Qvt7iNb730K6cG+mNpqXJRlDj4IfywFYaNpReOuBre8qb8bE5cY/gXj6zUqe01U
	Iq/YBL65qZ9gjzHWQdLkklIWAkvEqAIMZHmp6wOGopjtXLSrlnJmV4hLzV3xOMeUPnOri3b9P4b
	Rf4iymHqAw8QWj1WDif02mQv3RYY/q7yCCny0fNU4IDrewmHhAp6zM/resKep5gYa8=
X-Google-Smtp-Source: AGHT+IHy7HLHJb/Z4w9KFW7LMCJnE9kNeh1ylA+9qdjdxp72cmUkT9s5CVTz8AHmCDdhsFkVAZXgfQ==
X-Received: by 2002:a05:6402:3582:b0:5d0:b7c5:c409 with SMTP id 4fb4d7f45d1cf-5d3be694a4emr17057445a12.14.1733829763939;
        Tue, 10 Dec 2024 03:22:43 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------j9VG0DoQf7FRS7fgqusUDU50"
Message-ID: <8ca7a15a-bdc4-44fb-8702-33ba03a38207@gmail.com>
Date: Tue, 10 Dec 2024 12:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: add {set,clear}_fixmap() functions for
 managing fixmap entries
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <2badea2de39b7614d38a620d1b718478de1fc82c.1732709650.git.oleksii.kurochko@gmail.com>
 <ba0280ef-c0a1-4521-b08c-a10098c8aaa0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ba0280ef-c0a1-4521-b08c-a10098c8aaa0@suse.com>

This is a multi-part message in MIME format.
--------------j9VG0DoQf7FRS7fgqusUDU50
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/9/24 3:29 PM, Jan Beulich wrote:
> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>> Introduce set_fixmap() and clear_fixmap() functions to manage mappings
>> in the fixmap region. The set_fixmap() function maps a 4k page ( as only L0
>> is expected to be updated; look at setup_fixmap_mappings() ) at a specified
>> fixmap entry using map_pages_to_xen(), while clear_fixmap() removes the
>> mapping from a fixmap entry by calling destroy_xen_mappings().
>>
>> Both functions ensure that the operations succeed by asserting that their
>> respective calls (map_pages_to_xen() and destroy_xen_mappings()) return 0.
>> A `BUG_ON` check is used to trigger a failure if any issues occur during
>> the mapping or unmapping process.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich<jbeulich@suse.com>
>
> However, ...
>
>> @@ -433,3 +434,21 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>>   {
>>       return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
>>   }
>> +
>> +/* Map a 4k page in a fixmap entry */
>> +void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
>> +{
>> +    int res;
>> +
>> +    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL);
>> +    BUG_ON(res != 0);
>> +}
> ... imo in such cases it is preferable to go without a local variable:
>
>      if ( map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL) != 0 )
>          BUG();

I will update that in the next patch version.

>
> Just to double check: Iirc this BUG would in particular trigger when trying
> to set a fixmap slot that was already set, and not intermediately cleared?

Yes, correct.

Thanks.

~ Oleksii

--------------j9VG0DoQf7FRS7fgqusUDU50
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
    <div class="moz-cite-prefix">On 12/9/24 3:29 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ba0280ef-c0a1-4521-b08c-a10098c8aaa0@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.11.2024 13:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce set_fixmap() and clear_fixmap() functions to manage mappings
in the fixmap region. The set_fixmap() function maps a 4k page ( as only L0
is expected to be updated; look at setup_fixmap_mappings() ) at a specified
fixmap entry using map_pages_to_xen(), while clear_fixmap() removes the
mapping from a fixmap entry by calling destroy_xen_mappings().

Both functions ensure that the operations succeed by asserting that their
respective calls (map_pages_to_xen() and destroy_xen_mappings()) return 0.
A `BUG_ON` check is used to trigger a failure if any issues occur during
the mapping or unmapping process.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

However, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -433,3 +434,21 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
 }
+
+/* Map a 4k page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+{
+    int res;
+
+    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL);
+    BUG_ON(res != 0);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... imo in such cases it is preferable to go without a local variable:

    if ( map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL) != 0 )
        BUG();</pre>
    </blockquote>
    <pre>I will update that in the next patch version.

</pre>
    <blockquote type="cite"
      cite="mid:ba0280ef-c0a1-4521-b08c-a10098c8aaa0@suse.com">
      <pre wrap="" class="moz-quote-pre">

Just to double check: Iirc this BUG would in particular trigger when trying
to set a fixmap slot that was already set, and not intermediately cleared?</pre>
    </blockquote>
    <pre>Yes, correct.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------j9VG0DoQf7FRS7fgqusUDU50--

