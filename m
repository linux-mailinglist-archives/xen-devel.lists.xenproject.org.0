Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39274A45FCC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 13:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896511.1305264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGum-0002di-RM; Wed, 26 Feb 2025 12:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896511.1305264; Wed, 26 Feb 2025 12:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGum-0002b5-O0; Wed, 26 Feb 2025 12:53:28 +0000
Received: by outflank-mailman (input) for mailman id 896511;
 Wed, 26 Feb 2025 12:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnGul-0002Zl-KR
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 12:53:27 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab0f1986-f440-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 13:53:25 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3098088c630so64297241fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 04:53:25 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5485222af44sm421910e87.138.2025.02.26.04.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:53:24 -0800 (PST)
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
X-Inumbo-ID: ab0f1986-f440-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740574405; x=1741179205; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uArhqLd/PU5ZvoJ53Nemxk5nPslXqlvd2ut7vvcyrs=;
        b=nQ1IfgqC2vZNxRTq6JsKwirJnsT0epqiYL/wR021zs5dh/BNR4jPYL+ajxKYXBKg1g
         3cgJ2agRcjXmZE+wcxLuAbEzKBseNQxV1+YoIUuGgRMQzzqM6oF0bT9/35Po4O2yRQ7d
         Kgk+GiBoQULZmsUiD2fAuRRw3K+ex4JWU2Bo3CQvJx/7bzx46hd/o/wI3sE4oz5GFuCP
         dkrLIhU7pYNYnM6L8OPMHxf51+un0Yu4xZb5PE3TJPfvQmvJEYpwpD+2var+UdElajw6
         +eJmmPNMyVYbXyJP10zjYhqwOp4TOA/8/Gnb1hkZ0vauTnp/SisLSz2TO9xfNAL28+sO
         DpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740574405; x=1741179205;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uArhqLd/PU5ZvoJ53Nemxk5nPslXqlvd2ut7vvcyrs=;
        b=YdFUAEl8ZXwxJ+AD4UC4X7rkpAWjq4Rirj8/Md9arZzDafrijhyxOq8ZfVCzO6jNkZ
         iFlO0WZby6x915z0opN/EkUXZt2HRFwUqA11fWS/dEg9QqmqQHSCP7XbLGeyC4HKYevD
         OvG9PUb7Z64aoW4/fS7i4YIGRFPL81JFhPOatKMAk0b8q7H+02bbkNngS0l33i27vIzO
         edEjWYKd3Tu36Jb2RKAXjWBj59vMirWcre8tAt6vw9dmr//Ni/4CUeSsndAM1yfTlQm8
         hnTynCpwvhAo5svl8GGlT/SPqEbOeJmiY+NHqZLnKb/kFNK2nIG4nv255onhwzFp0GkG
         q1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmiBw4Mr+QXamzh+qpfEePH5qaRAvGhka8fQJ4NTlQePgZYIGaaMwBNbVOK3jC47E82/wH1PV8CCM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweMoIMokTKTPwVElmMHxtssFAdO7wv0RTv/87XZtaOQI/FLnTx
	pdfzQ/wkg2ZSFLBYYrBIY1VEMHH+pQYZ3/+Q/i4XiBU5+QPn540j
X-Gm-Gg: ASbGncvTQ003giQIqeN3Mc3QMvOfqAikhA7E2IqkRHdJDkPBCTRcpzuILjiy3tbAzpd
	2H8nDcuj+S3rfZ0lv40h3N7YtrCiqg/8mv3fyr/s1zXpWP9MITCcsDDP0h6uUt7/q/AlSm9diuH
	xWOFdlytEbJJiNSvsgW3CtMN0cNsgY6iLcRsXGzEBN0P/wtZtTau/SH5Ub6fB6AfWzNdsWAmH5P
	YYM9EhOWHrfl08izPqi79FSWT/15jhKWxcr3Evb2US+xfcOVlcY2sWjZXkGE7orLwevhOlEwjLV
	ucrTJJrWBk5zkOmUDxmPIu+AbiMw0VkKW0Q=
X-Google-Smtp-Source: AGHT+IFLKtPWoHZSx4PhvVgkBMd/W0HHqos932F8cTywmrZZzVFDfFNhTeddJnlgrTW3bxS/yPjO5w==
X-Received: by 2002:a05:6512:10c4:b0:545:c7d:1784 with SMTP id 2adb3069b0e04-54851108826mr5579282e87.43.1740574404712;
        Wed, 26 Feb 2025 04:53:24 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------epK0FFwm7nTkZpEeKT48y5eD"
Message-ID: <54c23100-5be2-479f-9e35-871fe5f95af2@gmail.com>
Date: Wed, 26 Feb 2025 13:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] PPC: Activate UBSAN in testing (for 4.20?)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740540262.git.sanastasio@raptorengineering.com>
 <a1bc84821cf9018549fb1dc0aeb8fd8f9bfeb002.1740540262.git.sanastasio@raptorengineering.com>
 <4d5511e2-ff07-42fe-b57e-7e66c999d811@suse.com>
 <2295052e-3999-47ef-bb74-ca8517296abf@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2295052e-3999-47ef-bb74-ca8517296abf@citrix.com>

This is a multi-part message in MIME format.
--------------epK0FFwm7nTkZpEeKT48y5eD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/26/25 1:10 PM, Andrew Cooper wrote:
> On 26/02/2025 7:24 am, Jan Beulich wrote:
>> On 26.02.2025 04:27, Shawn Anastasio wrote:
>>> From: Andrew Cooper<andrew.cooper3@citrix.com>
>>>
>>> Also enable -fno-sanitize=alignment like x86 since support for unaligned
>>> accesses is guaranteed by the ISA and the existing OPAL setup code
>>> relies on it.
>>>
>>> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>> Signed-off-by: Shawn Anastasio<sanastasio@raptorengineering.com>
>> Acked-by: Jan Beulich<jbeulich@suse.com>
> Thanks. I've committed this.
>
> Oleksii, seeing as how simple it ended up, and seeing as how you're
> currently writing the release notes for 4.20 while excluding PPC from
> the list...
>
> Views on this sneaking in at the last moment?

As it touches only PPC part, then I am okay to have it in 4.20:

   Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>


I'll update release notes too then.

Thanks.

~ Oleksii

--------------epK0FFwm7nTkZpEeKT48y5eD
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
    <div class="moz-cite-prefix">On 2/26/25 1:10 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2295052e-3999-47ef-bb74-ca8517296abf@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 26/02/2025 7:24 am, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 26.02.2025 04:27, Shawn Anastasio wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

Also enable -fno-sanitize=alignment like x86 since support for unaligned
accesses is guaranteed by the ISA and the existing OPAL setup code
relies on it.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks. I've committed this.

Oleksii, seeing as how simple it ended up, and seeing as how you're
currently writing the release notes for 4.20 while excluding PPC from
the list...

Views on this sneaking in at the last moment?</pre>
    </blockquote>
    <pre>As it touches only PPC part, then I am okay to have it in 4.20:</pre>
    <pre>  Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>


I'll update release notes too then.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------epK0FFwm7nTkZpEeKT48y5eD--

