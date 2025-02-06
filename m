Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB0A2A953
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 14:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882852.1292942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg1hq-0003Dz-IO; Thu, 06 Feb 2025 13:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882852.1292942; Thu, 06 Feb 2025 13:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg1hq-0003BU-FF; Thu, 06 Feb 2025 13:14:10 +0000
Received: by outflank-mailman (input) for mailman id 882852;
 Thu, 06 Feb 2025 13:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czS3=U5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tg1ho-0003BN-Tj
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 13:14:08 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ea1a978-e48c-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 14:14:07 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab737e5674bso172604066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 05:14:07 -0800 (PST)
Received: from [192.168.201.60] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7732e718asm97655766b.99.2025.02.06.05.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 05:14:05 -0800 (PST)
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
X-Inumbo-ID: 3ea1a978-e48c-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738847646; x=1739452446; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk/xLBd/VAM+1aHHL5K6TbYcjhHZVR217Ww61gOhdZ0=;
        b=UDVaMW/b/A1hAIhRrW3i5pXVUupbUDLswcg252veq7b7wFnVnahgpMqpMlY2IaOaU5
         +6TooPlWq8/TAn+Cx6AAJOHN03eRecMdb5iQnLwb3t0rrohnjwMFCET9F0XFYtmb0qQg
         LlEOHbEOrKB/lQEH2Bbk9vIEMH8XlhWBS6zLWqLV431O2Tu+I27TskTwOvlvNPKhrkYt
         H2uv+R7YSHzdieVUUh+al7ylXPFzZqCLl4d48Y/o/vqPPE72DL69PmEYKfP3x2eUA0+/
         ed/N5cZLb46S16/NtMnz6rYO/wHQgpvYaPQZhLUB9NC4qyfpIMWiLLjp/aXRPSqft0F2
         h0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847646; x=1739452446;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zk/xLBd/VAM+1aHHL5K6TbYcjhHZVR217Ww61gOhdZ0=;
        b=O3hP7oyqnUVo6EyInGWPefK0DTLRT8FluiXHYRwWFoSKxVk9DDOdRAzopG9ESdEPtK
         t12EaEix1jEArjWnG1sh7u81K/qKHlWxZHKTLiuB4/+x54O6qAnMmPf024XOIVS7pf3g
         JpZPpf+lbRstWsLjcWfBglmojgBwO9IQTG4eqDCKJHriR0IXlnMbEzg2iss0N/ZELPgV
         A82aMG1m5jlsXDgWtw053O48zF1mVemTi7JqOMG9aMFmVMJAV6I+mINjhXIAy180xuZk
         Ogsx5Lx9zrMVM7oNdG62yU6XDb2J+onp5jhGRNMWp1h7H9KVU3NBun/5YVGPYv/n2ok1
         xq0g==
X-Forwarded-Encrypted: i=1; AJvYcCW82p4SdZbtWSJ7K75ZEhxd+kxBUeyiI8uQe/F5+gVQg8UekyhSZnQ1J2wCkPsttvnUlmrwNFyPhRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBTmry4FYBrNsOtqroBcHG7kkJwQkB7Qf0hOlAXItdCoLEJpqY
	Lak9rp+jRZi1QgkzecXLpZo/+OPeZL/v4d1OeLs6KhroheuRvB9z
X-Gm-Gg: ASbGncuteSG0qioXmyk1kAxLOdhGUMBmvlOr56tmRDiNbLrZVyo0lA2u9DMoOXAo2rw
	GAtBF60TemzRlzpRw1l24vrIrM+NsX9EkMxT+xnKeYdwJuvIoKnSj6oYL0oO9zwil23p0sf77DH
	l9EI2bV3Jp0F0QyZe9Tsu4yL67zkJpZ2DvcifEeRvPWU0Uy1ZsKU7OXEOdJRmY1HRuK2hrG5Wyr
	8eTlg2S9QRK2Yh1CTpi8s+RjykGuUPrLwwMzQvFDnSgE9F6468T8hWMy7M0WPjVQ22o05uFuRdu
	8sgURlEQdCnLRz4hqEjU63LHjuI=
X-Google-Smtp-Source: AGHT+IGl79V9gQIu0UyrQhfGjxZ7CfTxPLdTIsQuYsuAfWlku5QSskNm94DRPc9AaxbrmiavyXnIOw==
X-Received: by 2002:a17:906:1447:b0:ab7:6b66:66f9 with SMTP id a640c23a62f3a-ab76b666828mr466759666b.10.1738847646248;
        Thu, 06 Feb 2025 05:14:06 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------qUPT000sIzVV5j2Z5hq0nqJr"
Message-ID: <46091a73-756c-41a7-9c0e-3061b639f588@gmail.com>
Date: Thu, 6 Feb 2025 14:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.20 0/4] AMD/IOMMU: assorted corrections
 (leftover)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
 <b43ab925-a735-4954-b8b9-1e67419ce7cb@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b43ab925-a735-4954-b8b9-1e67419ce7cb@suse.com>

This is a multi-part message in MIME format.
--------------qUPT000sIzVV5j2Z5hq0nqJr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/6/25 1:35 PM, Jan Beulich wrote:
> Oleksii,
>
> On 04.02.2025 14:00, Jan Beulich wrote:
>> What previously was the main bug fix in this series was dropped for v3. It
>> turns out what is now patch 2 is sufficient to address the issue, while
>> doing the requested tidying. The latter two patches are for 4.21 only, with
>> the final one being up for debate altogether.
>>
>> 1: radix-tree: purge node allocation override hooks
>> 2: radix-tree: introduce RADIX_TREE{,_INIT}()
>> 3: radix-tree: drop "root" parameters from radix_tree_node_{alloc,free}()
>> 4: PCI: drop pci_segments_init()
> any verdict one way or the other for the first two patches?

Sorry, I missed the fixes tag so I thought that they are just refactoring.

For first two patches:
R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------qUPT000sIzVV5j2Z5hq0nqJr
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
    <div class="moz-cite-prefix">On 2/6/25 1:35 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b43ab925-a735-4954-b8b9-1e67419ce7cb@suse.com">
      <pre wrap="" class="moz-quote-pre">Oleksii,

On 04.02.2025 14:00, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">What previously was the main bug fix in this series was dropped for v3. It
turns out what is now patch 2 is sufficient to address the issue, while
doing the requested tidying. The latter two patches are for 4.21 only, with
the final one being up for debate altogether.

1: radix-tree: purge node allocation override hooks
2: radix-tree: introduce RADIX_TREE{,_INIT}()
3: radix-tree: drop "root" parameters from radix_tree_node_{alloc,free}()
4: PCI: drop pci_segments_init()
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
any verdict one way or the other for the first two patches?</pre>
    </blockquote>
    <pre>Sorry, I missed the fixes tag so I thought that they are just refactoring.

For first two patches:
R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
  </body>
</html>

--------------qUPT000sIzVV5j2Z5hq0nqJr--

