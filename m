Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5DC0E699
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 15:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151632.1482152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDOCh-0003nk-8E; Mon, 27 Oct 2025 14:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151632.1482152; Mon, 27 Oct 2025 14:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDOCh-0003lX-4x; Mon, 27 Oct 2025 14:28:11 +0000
Received: by outflank-mailman (input) for mailman id 1151632;
 Mon, 27 Oct 2025 14:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4SB=5E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vDOCg-0003lR-4w
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 14:28:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2873e01c-b341-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 15:28:08 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b6d53684cfdso1060162366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 07:28:08 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8540807bsm769969366b.54.2025.10.27.07.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:28:07 -0700 (PDT)
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
X-Inumbo-ID: 2873e01c-b341-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761575288; x=1762180088; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r40CHxcNvtUOSKN2L1J01Uj9Si5KRuLkWDq9k27cJ8k=;
        b=B39aJ4z20SZ2O0RVPry63z6d4A9cYFEw52aQKh4rqEnnTJ8ydnT4ecURulimziwFDO
         kFFTZjQvlq71VPAXqCAu9tJj2/fqp4LGqminkxqVaSOncn+VkWf9BpznFx0arstgH5hv
         hS1UFlA42HjTk0xodAhzE1vryYOXvHqgNoTUvIidySkcI1RCn0g8Hp8BEcosa01ki+8c
         kv6CkuV7V3Tk3pBDxKlroWsPdwYl0yLmYJlqM9rFAqmDzhIhYbAXdYl2XJf3H9Sn8YQH
         ogICBcDY4C0AWrrkx0K4qu2EdUlt9pjPJods+GWmMcu9zYEv8YDLizD2FBe6E4cctrbk
         s7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761575288; x=1762180088;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r40CHxcNvtUOSKN2L1J01Uj9Si5KRuLkWDq9k27cJ8k=;
        b=CdAp+JnfQ44sJJJhwfNjTOX/uXbSLzlaLl6NfqD+0iZvEh62hDciP5ls0VPpaf+mmj
         WN/2QXdNhjTK0eY+yJhKvaFITtvsDjY3+w9D275zKY5/SxGNW7TexW8yrN7r6JtyMovq
         qIFN7CN1rTGVFvOdcWOB4k5GeLXloNoJ6pZWf5mBQc8mfirrgunX9noM59Jb2+hKo9VN
         Y5WjaZAVnTfk0IKCZ45lbGpMGI5CKreZDEQl6PJ4zZNXC70J4g2BwdLCd95up65w8ZBM
         DqkaOc0UXiKlq9viixi6HIdkLcP/NTzKZ6ihN/nMqp5dnbpP8feRU/ogQ6/U3//w22lv
         a1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXwAOyANuhpzut/fuzfaBKJHO49lisR+hfMpGVUxjp9ouTLLuYMUqKUNAOf3PE+O1jCJ6fISmqC/k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzk+HHte+9hWYgcoWzWtSaF1wjW0+UOe5/meinsv1BsGMqZlBmX
	8Ov8B5Ku67XwFWdrDbdDx/3w2XZ/Hc6rByVqmfRDs7ejGYlLfw7atfCu
X-Gm-Gg: ASbGnctKvmAFW91/418I1T366Q8oewDg+c7qvs1gVzGY0ZhJCTrDCwB7jFhzm43bomx
	11xwXElRBP067yHI0TC2yupQ/4IF8e8LLcoEILgf02a0f/oIA2cslDlIEmPBtkO1NoRGRhAv8+K
	mmVWaA5WVof/CNOgwUg4WCaNIZIRVTKHG0sGkhuR7x6U2MS9u2eURQLXlQO17ZZBAT1JxN0vJtE
	GLDOi/5rwYweyKGYIA30oJ0fVhr8l+x3MZSfPrZfPcGzyM87SpnqeRUbjE5x6fzuBBZDFFsCcfd
	JiSUQrTrXLIqm965rNFV/Es3aBtZJ/1QSvg5E+BUkI+URLrZuzF0FmxmlXaiCtLBRMJREgal+aL
	2XKEIPH2S18q5jg135dSjf0AgonkCxXeGYbrnoJtWCNNkerYeCm3mXTJjLqLep/1hKzjfsahTA8
	d9NEefHzhIu20ACO37JsNtQRJgOw5HW40lVFHJxUa0Eh9LRvBe0w==
X-Google-Smtp-Source: AGHT+IGm8mhA+l7gjUsEbpAtYoGkg99XQJqh67+1v5H7unJB7V+t5E4J46WtbJvQ1xHqw9B5P5pVKw==
X-Received: by 2002:a17:907:9486:b0:b6d:6b56:bd7d with SMTP id a640c23a62f3a-b6dba474b82mr15312466b.16.1761575287472;
        Mon, 27 Oct 2025 07:28:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------GPY0qACh2gbKMm3ZbOHCKDF6"
Message-ID: <4746e81e-7327-46b3-9e50-9b0b401a2416@gmail.com>
Date: Mon, 27 Oct 2025 15:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21?] xen/pci: prevent infinite loop for faulty
 SR-IOV cards
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CAHt6W4e1XOoqO-W0O1mEU4UCr_ik=J9bRGQQPeNL3YLQSyV7_w@mail.gmail.com>
 <c06a70c8-747d-422a-8fb8-431608631f84@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c06a70c8-747d-422a-8fb8-431608631f84@suse.com>

This is a multi-part message in MIME format.
--------------GPY0qACh2gbKMm3ZbOHCKDF6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/25 10:07 AM, Jan Beulich wrote:
> On 25.10.2025 22:09, Frediano Ziglio wrote:
>> If a SR-IOV card presents an I/O space inside a BAR the
>> code will continue to loop on the same card.
>> This is due to the missing increment of the cycle variable.
>>
>> Fixes: a1a6d59862f4 ("pci: split code to size BARs from pci_add_device")
>> Signed-off-by: Frediano Ziglio<frediano.ziglio@cloud.com>
> Reviewed-by: Jan Beulich<jbeulich@suse.com>
>
> I have to admit though that "faulty" to me suggests more like active misbehavior
> than the presenting of a bogus BAR. But maybe that's just me ...
>
> Oleksii, thoughts towards 4.21?

Lets take it to 4.21:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------GPY0qACh2gbKMm3ZbOHCKDF6
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
    <div class="moz-cite-prefix">On 10/27/25 10:07 AM, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c06a70c8-747d-422a-8fb8-431608631f84@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.10.2025 22:09, Frediano Ziglio wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">If a SR-IOV card presents an I/O space inside a BAR the
code will continue to loop on the same card.
This is due to the missing increment of the cycle variable.

Fixes: a1a6d59862f4 ("pci: split code to size BARs from pci_add_device")
Signed-off-by: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

I have to admit though that "faulty" to me suggests more like active misbehavior
than the presenting of a bogus BAR. But maybe that's just me ...

Oleksii, thoughts towards 4.21?</pre>
    </blockquote>
    <pre>Lets take it to 4.21:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------GPY0qACh2gbKMm3ZbOHCKDF6--

