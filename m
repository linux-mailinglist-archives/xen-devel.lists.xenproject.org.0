Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267BCA46324
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896764.1305518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIYr-0007Gb-IK; Wed, 26 Feb 2025 14:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896764.1305518; Wed, 26 Feb 2025 14:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIYr-0007Ex-FK; Wed, 26 Feb 2025 14:38:57 +0000
Received: by outflank-mailman (input) for mailman id 896764;
 Wed, 26 Feb 2025 14:38:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnIYq-0007Er-02
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:38:56 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67aef0d1-f44f-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:38:55 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abbdf897503so177082166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:38:55 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1da56d6sm334173366b.86.2025.02.26.06.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:38:54 -0800 (PST)
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
X-Inumbo-ID: 67aef0d1-f44f-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740580735; x=1741185535; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeuuygS1UZMe0F11CuqSRxtjYoKMD7IPMlmoZa7WrgE=;
        b=Bc+LgfHPGVA8WA0ndzcHYVr/9UnktkPoG+UQbqW08wShHrGheabIDDVjMye4z5IONP
         v5eJI3d1aKbR0yXicHCdWD33daEBuy9GVLhGDs0vCAvzViLEdxWPq1TiH1qGY4OceI9M
         glKQCahUln/ubpMNIeOrmImL+f5QSn/rbmbv/acbAPKR+rujzzuvFRLXMGOi9LuDtcRG
         +lF1tXPNBtEaYNCkWwh94GYDBqMWEcBaIvnJ6RLCJPfZm8J6jPNYg9grbau9OK3hTErN
         k0/20AyWTI2qfYPfG5dr7lCtC865RZNVcYjEG1sHx5L8NVDpH0GjykKxKuv3xboohbuQ
         JyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580735; x=1741185535;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FeuuygS1UZMe0F11CuqSRxtjYoKMD7IPMlmoZa7WrgE=;
        b=m4e7kQwK9Vg8Kz6+jgQKl4vUpqdQ/IgiClDlLwoD/oVMKeZLs1CNEzifjUZfRlUXqq
         pu5ZhfmHR4N2v8jVHl8uRag41Fm3tc4UdTTdw7Tad7M+n+rxoLnhXmXxwmJu6quZQkR/
         iMrUwvEN+fDuJOmjiCBEs9YfH0os8CTPssM8/sIRmyaR6PIPXtazs6zppNtxebAqAIIy
         kI2lHLc8dRQnoGdrDeJM9rAIfbipE5Ia8lEZwsjxqj02Oo9qoId8HMz3NwtOCOH8fI37
         6ZxtCk7tN3KKRYKdQRhtnLLVy7HcUQ5+6qCqXVdgQHvsOMQQPVPk+Y3aj28uiQ8eNqJb
         SaLA==
X-Forwarded-Encrypted: i=1; AJvYcCUDT6oUMhGxP8L9LksBF26jQET1DjdSruzCLwdyb1ml1MEQP0YuB7sOpm454CjeQ6trJubccJSWMUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmokwP6MDBDy35W/WPpt7j5R7ZhS0em3YbFtDKwzLgoJ0KCgJj
	TQLNLwNsTyNZ5r5w9L+o0wvc8HWBdeaE3gjzondBpit8mnSCClCZ
X-Gm-Gg: ASbGncu4fiXvU5xaeOTI6L8iy84EBW4s8mtWLNGy2fxEQFYHxdblCNMet4PfUxKWqD+
	Bpz0gJioEj7GeyMowD/cLAiaxPlhbpm3c+PedsG9IfnIT0yUe3LcDeV2jz9SbDclvrFTawtarmU
	K4LlxzBRp5QRyDPkozvGFHm78TpIVV0gABcvuXkoOH2lzs6MPQCD/QKmGAWeMt78zHsjN5cK27w
	2b1xcsy2CJCw2XFTU1+xU7JCBob/7WJrlRqO0IYUX0gma5WhCIKhhphocugN18ZLaErDYzfR1QB
	3C81OFnITC7o4qAOFasks7g+8wul0i+SDw8=
X-Google-Smtp-Source: AGHT+IGwbTpvBTpah/RLh75Cg7IVG5kIZSQjtzsNGTFn4dU4I1VSrzPHYlB7QQ/nww3tFFHSrIpaDA==
X-Received: by 2002:a17:906:3151:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abc0b037859mr1699007866b.24.1740580734506;
        Wed, 26 Feb 2025 06:38:54 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------tek504RAvAtI3k3yrr9upT33"
Message-ID: <38834638-df7a-4631-99e1-5596bb65d136@gmail.com>
Date: Wed, 26 Feb 2025 15:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 3/4] xen/riscv: make zbb as mandatory
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <611e289e357a26490b95b2aa93d7288c77787171.1740071755.git.oleksii.kurochko@gmail.com>
 <ef3972a5-825a-47de-b9a7-a3681fe70bcb@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ef3972a5-825a-47de-b9a7-a3681fe70bcb@suse.com>

This is a multi-part message in MIME format.
--------------tek504RAvAtI3k3yrr9upT33
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/26/25 1:58 PM, Jan Beulich wrote:
> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>> According to riscv/booting.txt, it is expected that Zbb should be supported.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in v7:
>>   - new patch.
>> ---
>>   xen/arch/riscv/arch.mk | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
> Please can you also tidy asm/cmpxchg.h of ANDN_INSN() then?

Sure, I can leave only:
/*
  * To not face an issue that gas doesn't understand ANDN instruction
  * it is encoded using .insn directive.
  */
#define ANDN_INSN(rd, rs1, rs2)                 \
     ".insn r OP, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"

~ Oleksii

--------------tek504RAvAtI3k3yrr9upT33
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
    <div class="moz-cite-prefix">On 2/26/25 1:58 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ef3972a5-825a-47de-b9a7-a3681fe70bcb@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.02.2025 18:44, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">According to riscv/booting.txt, it is expected that Zbb should be supported.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v7:
 - new patch.
---
 xen/arch/riscv/arch.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please can you also tidy asm/cmpxchg.h of ANDN_INSN() then?</pre>
    </blockquote>
    <pre>Sure, I can leave only:
/*
 * To not face an issue that gas doesn't understand ANDN instruction
 * it is encoded using .insn directive.
 */
#define ANDN_INSN(rd, rs1, rs2)                 \
    ".insn r OP, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"

~ Oleksii
</pre>
  </body>
</html>

--------------tek504RAvAtI3k3yrr9upT33--

