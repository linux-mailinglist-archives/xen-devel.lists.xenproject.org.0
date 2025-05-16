Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B718FAB9A68
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986959.1372472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsZW-0003V5-4n; Fri, 16 May 2025 10:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986959.1372472; Fri, 16 May 2025 10:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsZW-0003TJ-1U; Fri, 16 May 2025 10:45:46 +0000
Received: by outflank-mailman (input) for mailman id 986959;
 Fri, 16 May 2025 10:45:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8HW=YA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uFsZU-0003TD-LB
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:45:44 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eacd50d9-3242-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 12:45:43 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so6397835e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 03:45:43 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d0fasm2502282f8f.8.2025.05.16.03.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 03:45:42 -0700 (PDT)
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
X-Inumbo-ID: eacd50d9-3242-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747392343; x=1747997143; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TP5nhJJjHei6NVmalzJb6nTagBEkZYP1AtXWbPfby8=;
        b=e3tN0ehlPBYWm+EqyeAQC7Hr7l6wHqpqoATQNIzawcDrcoyKHEL8DPZfvqlWrzAJu+
         LhW0E7rFyz9P97yDHGno3ic1wQoknaxxxCCWP57Q9vBkuFjxLCIp+d1b6+7+M0xw6ZEy
         MHv4DNNg2vqfM+SXnbe5ZFMQW410sxy85OucJEB/HtlvzH9YbgUoBzOR2N3BFJK1RJ51
         WjAoRHh9HyVKScfwWgJITgL1I2igqHj1CkAlPoTjHKWOJxRXJtblg/7Zs5T8eoyB9S4r
         QrJ7Ou0JxC7t8xTXNHfDuRiTx7K0KCNIUB2BDjd6dgYqrO8NnQ9HqgtEeCOUAyCdSqoY
         ULew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747392343; x=1747997143;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TP5nhJJjHei6NVmalzJb6nTagBEkZYP1AtXWbPfby8=;
        b=wQGYsJqlxjRkEwcw1w1dut3botOv9iJ9UC9D3Wx/ek/4LiZgGGRdAMY6IDqmW21NLU
         GoVjaiJPfVzn2k1PD4xb2cpBxlDaZwf/XHOIzu4+VPbI+nTdQ8Fb3GsSi41cRA3jsPfg
         k5HL8VjNuT9X0/bPjo2QYVes1iFQJ7Se02bqDY6bMH36mj4PXqv/l3zR8ZMzFeFCT/QJ
         /ICYdStC8bWZbsJSAI/9tuobVO88o00/VMN/tkt9Y3tvHonu2J3WP4jobw3Btrmcbl34
         kdDWyQ3rkrmTd501KK7yzBwMIDFxmSS3gKovEN2gDPOJo6cFfi8x1bNTz8sTpXMGmrrW
         1D5g==
X-Forwarded-Encrypted: i=1; AJvYcCXuM7uVFRqKG9KX8a7weiUMzow3QNLTEgSKsaYmAE8z60nvvc2W/0/3nbQXsvzAuIaU5Ln1uS8+5GM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd/KPh9hTJdy9QddfX+Jwt1TuT4POEXpKOqOKDSPjKZfW/o6s9
	KheHFQQVaKeLrtkQyhOf4v5fiFjDcv4sesYl6KNwiHKTKIpWMMVnVmcm
X-Gm-Gg: ASbGnct+AOVKex7kZGsDpV/I0DNsuH03jJ0At/1UogDAXb05hhDapycCGPl/Ms0Bwxh
	9mNaNX55aKNWSIjpY3VfL4oPcID/+l17Z68X/LodL9YeSh1b25V1ZppdWAg1mBjD0eziIdkCwYt
	Vm34sQfWfLRnRSZHlsHTvS04q7n9FEW/bdXLBDfBs4kVudYeZGf7gTTRe6OMbAjP8yAIxs/2FB/
	s2vs/hTwOhQZPuWkFb82qsUDATHWVOCeyvC0mZjNEnMORUvUL4gPL1JDHW0hKNMhv29zEUxEtkj
	hyHcPjFOZOhdFf3H6EGyAKv3/TeiU5Ijs/Y1fYOlNed4PcYHn/6ozUGWV8zc/XPzTh7EH2zL+3g
	jWqxPMRiz/gI140D7BHYLnvvXXoUBKHA+l8E=
X-Google-Smtp-Source: AGHT+IGpcTOC0GmG+LS/gnzIAUHavS7tIlwJyMjOVzJaoZcD2v+RST+ay2tgggbl+SomlSvfG5Xc/A==
X-Received: by 2002:a05:600c:45c3:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-442fd664965mr29379235e9.24.1747392342861;
        Fri, 16 May 2025 03:45:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------tai8GTuIga5emhXukXCx0OXW"
Message-ID: <31d8bc62-6682-423c-b2c9-6ec9ea6b5234@gmail.com>
Date: Fri, 16 May 2025 12:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] xen/asm-generic: introduce asm-generic/irq-dt.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <35c68e57e5348c6610e030890802e967f6be4230.1746530883.git.oleksii.kurochko@gmail.com>
 <74c6872a-7221-4656-8655-16b53f9b2bd7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <74c6872a-7221-4656-8655-16b53f9b2bd7@suse.com>

This is a multi-part message in MIME format.
--------------tai8GTuIga5emhXukXCx0OXW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/14/25 4:36 PM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> Introduce defintions of IRQ_TYPE_* which correspond to the Xen internal
>> representation of the IRQ types and make them the same asthe existing
>> device tree defintions for convenience.
>>
>> These defines are going to be re-used, at least, by RISC-V architecture.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich<jbeulich@suse.com>

Thanks!

>
> Assuming an Arm ack would arrive, this looks like it's independent of the
> earlier patches, and hence could go in right away?

Yes, it is independent.

~ Oleksii

--------------tai8GTuIga5emhXukXCx0OXW
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
    <div class="moz-cite-prefix">On 5/14/25 4:36 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:74c6872a-7221-4656-8655-16b53f9b2bd7@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce defintions of IRQ_TYPE_* which correspond to the Xen internal
representation of the IRQ types and make them the same asthe existing
device tree defintions for convenience.

These defines are going to be re-used, at least, by RISC-V architecture.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks!</pre>
    <blockquote type="cite"
      cite="mid:74c6872a-7221-4656-8655-16b53f9b2bd7@suse.com">
      <pre wrap="" class="moz-quote-pre">

Assuming an Arm ack would arrive, this looks like it's independent of the
earlier patches, and hence could go in right away?</pre>
    </blockquote>
    <pre>Yes, it is independent.

~ Oleksii</pre>
  </body>
</html>

--------------tai8GTuIga5emhXukXCx0OXW--

