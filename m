Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E84B1B6F1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 16:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070563.1434164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJ6k-0004dP-Nl; Tue, 05 Aug 2025 14:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070563.1434164; Tue, 05 Aug 2025 14:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJ6k-0004aI-L9; Tue, 05 Aug 2025 14:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1070563;
 Tue, 05 Aug 2025 14:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fV7N=2R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujJ6j-0004aC-HW
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 14:57:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87f00069-720c-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 16:57:39 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-af9618282a5so538078066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 07:57:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3cecsm918417666b.53.2025.08.05.07.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 07:57:38 -0700 (PDT)
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
X-Inumbo-ID: 87f00069-720c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754405859; x=1755010659; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6wfcfeOmRP476JsDeNW3IblGI4JdKzWxCKtel4ASqo=;
        b=aIDAZlgCscYBZqyl3QR1Gh1pbcUF9Kzx8h6KzdpXpSFkgluyz78Z3OMjaHX+wN0vVc
         Up/6cVQ1n7BNAXGcSPGMl++eWaeL/vCqtRQUg/3GhaP984Wm6wDc5ptzNeMHRzjWfsYe
         3j6yiU9PydOEP1zSqF2WhSs84BIutZkV5zZQL/hmLZnpnAeNkcge7vKwK21dntVNdVrI
         ROEghqVrHwE5GSTejWvnXFMFgtRYRmd5pH1W/ZRjqjPBEXf5rD8kva97FfaYZX0DtyHJ
         zCEUG8QukBjlT0alNCXr7W77Xi0X0vtcXXOuxVIyUNLefNgLTuhk8QGaMQ93wNgRG9hZ
         LANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754405859; x=1755010659;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x6wfcfeOmRP476JsDeNW3IblGI4JdKzWxCKtel4ASqo=;
        b=a02KRDAAuzdN6KwoeDy56czqZrd5mva1GWMBkC0+3s3QMZXbZ/qlnaDKm8Pf2iyTV6
         aUzJy1Ifjn/hBBxgnpm11Q6Jaws64NTlMmcVdSYMgQM0sU8jI2c4Erg5q5F+IEcWSLBr
         wXxGamiHIzIIqcazfNtRMzfT4gCyKmWcKyMk69v+02AJDzq9F+Vm8DcvxZGW8WpOBPX9
         wLg0GtI5VKk4dfjvmJN5Sf26tuSUc/4797E/8xGpAT074JJcvgO7xshxWQdiQqOd8Xi8
         PyZjVCkl6Q0jZr9CSs43WuSYw/xvsZRK1xHeW4ftV/h4c11MDqeR7Kq8x59NuYThK99h
         /3pg==
X-Forwarded-Encrypted: i=1; AJvYcCUi7mJd7CbPm07cociKouFU9H3PBxBQcfI080paGDWw4ecsq9a6kYv4NF+NKkitUCdTyPhszTEkqq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrQk1H8xWewXjut838bNSL8na/SauZuW0AqYA8Y1CbJntDAbq9
	wK4Sr/XIoLetJM8WqXaLG6sBt7rtylvsEpaSxNWp4ML3VGbBL6yDuWVe
X-Gm-Gg: ASbGnct05w2pvhOeWPLBw/sRzxqN/QbfjmqC2KYNbWF8ZuoeaT2XllZeN+DqwBetA88
	K+rIjGn6hWK60M7hF6Mlz6ergPKQeLiNdUu7mTyZ/bYdStj1ZskVMkHeRyN6gQIqxE7lr1HcIMG
	8NYxXatku5bu/0qBvJcMjI3u9PCslsOG9zftkiTTxHtQSSqQ8TNN9y6hvk4BHepurUcRGqmla17
	p+Kvcj9TbpGspPSVZ8UJ2Hil0PEdHL0sDoRtCJtilGZuECVDIt0uJ8umQ5ONbziKdQXJolNWogI
	Qm/dnHZ094aoW5mPSqM8FocdhxlEKjh+Fz4xJ490so0BR17uqQ3v6X7bA0gXuLpHu7EOAD9d77M
	RcLHv4pQlLhHezm1BAvwHkg5H1MUcPSYk0w3rF9XpJZvUK81ZBm5YLYQBEYGzyMp9Icpvo6Q=
X-Google-Smtp-Source: AGHT+IEA/cQmn8aTtI044eWJo6JWEkbYozceLiUq5YmUtw5mBzCuA0ZHL2w7BjPbdd+rzRPLR+H5JA==
X-Received: by 2002:a17:907:97c5:b0:ae3:67c7:54a6 with SMTP id a640c23a62f3a-af9401bb6b4mr1490175966b.34.1754405858790;
        Tue, 05 Aug 2025 07:57:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Tw0jcxWjp0ZzjXU7Gtfn0Rly"
Message-ID: <512b1549-17ef-46ea-9247-0b71218be574@gmail.com>
Date: Tue, 5 Aug 2025 16:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] xen/riscv: introduce
 sbi_remote_hfence_gvma_vmid()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <de83ed75b0d7109d007389ec4809320c59c10bf7.1753973161.git.oleksii.kurochko@gmail.com>
 <164e0f8e-3986-4c9a-8201-14ea006405c7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <164e0f8e-3986-4c9a-8201-14ea006405c7@suse.com>

This is a multi-part message in MIME format.
--------------Tw0jcxWjp0ZzjXU7Gtfn0Rly
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/4/25 3:55 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> It instructs the remote harts to execute one or more HFENCE.GVMA instructions
>> by making an SBI call, covering the range of guest physical addresses between
>> start_addr and start_addr + size only for the given VMID.
>>
>> The remote fence operation applies to the entire address space if either:
>>    - start_addr and size are both 0, or
>>    - size is equal to 2^XLEN-1.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich<jbeulich@suse.com>
> with perhaps a similar on-commit edit as suggested for patch 1.

I would happy if you could do that during merge. Thanks.

~ Oleksii

--------------Tw0jcxWjp0ZzjXU7Gtfn0Rly
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
    <div class="moz-cite-prefix">On 8/4/25 3:55 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:164e0f8e-3986-4c9a-8201-14ea006405c7@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">It instructs the remote harts to execute one or more HFENCE.GVMA instructions
by making an SBI call, covering the range of guest physical addresses between
start_addr and start_addr + size only for the given VMID.

The remote fence operation applies to the entire address space if either:
  - start_addr and size are both 0, or
  - size is equal to 2^XLEN-1.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
with perhaps a similar on-commit edit as suggested for patch 1.</pre>
    </blockquote>
    <pre>I would happy if you could do that during merge. Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------Tw0jcxWjp0ZzjXU7Gtfn0Rly--

