Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36528B1D9F4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 16:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073148.1436072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1eI-0003LT-8C; Thu, 07 Aug 2025 14:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073148.1436072; Thu, 07 Aug 2025 14:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1eI-0003Jw-4m; Thu, 07 Aug 2025 14:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1073148;
 Thu, 07 Aug 2025 14:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk1eG-0003Jq-UP
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 14:31:16 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cf06b9f-739b-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 16:31:16 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-af93150f7c2so164615366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 07:31:16 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a218aa3sm1325837266b.93.2025.08.07.07.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 07:31:12 -0700 (PDT)
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
X-Inumbo-ID: 2cf06b9f-739b-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754577075; x=1755181875; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKk650pOXt2OjKnStyEg3KRLgf5h1Du17fqWDDRSrog=;
        b=mZRxOnQ/cB4TEAQGcJQWnskeiqQWhqCoZSRxBn+E0QFORuV2vRg/53KpxmHFiPTTa1
         SfGUE6phzM9sj/pWDurpXBW1jz9hbx28866XsPTLRadsakJ3Bscd7HCU3VtNTZoTxULQ
         KbirjdB58wbVUpTKNsAXwOPIpnhFXFcyNPd8JA05i2YaP3ExdbxImft5WSyRhGXFHHa7
         jELKvksySXQ71r75/nwehpPGMnOzh3d3yYSkJs+eUICSn6fM99W0ykYNY+EWn84ffjgO
         EFy/oZruKJrEQOYsxwiEgG7KzCv4gDcMje4d+FsoEtzhyu5Goa7Sd5a/rKXCjNvPVjRh
         rHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754577075; x=1755181875;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oKk650pOXt2OjKnStyEg3KRLgf5h1Du17fqWDDRSrog=;
        b=F36fu2KBAl/S7+WQrUdtEqqwCTNZmR4vi2IJKKYwkz49E9TuEOm2si7sk3yGYzPebB
         Wg3gfQqFxNA4g+L/68oKB09ALq+I8BsMCBld2ff8PFZXxlpkoQQEvOud+pKydvUPH1io
         /CHbR5qZQpD7wRTA67lmoNDTEDQ8CxtIvxwBTrzGQoHbjk1BpDUff7n/iiGhNVHsZQt2
         6ce/t4+6De8Ms8pkiMldM2LaVF1Pb0DtXS8JnnEX8az3+vX/lN0gg3IN1H/N/MQGwldY
         nOU5YvW0N1tftwIH/b/z3bkC/4ITfA1GufWuU2VwlbjXba9IBT+5VqMPhtt4GU1Gi/AV
         ogBQ==
X-Gm-Message-State: AOJu0YzbyDwmCo+nDp2bQCl3s9RcGHpfd1C6qbB5aXr2eiuyP+vSL9TJ
	cBRhVbV5KeibKuQKXjR7AKz2rJRhLhievXyCWzIw9cOwfmWKod+jc7s9
X-Gm-Gg: ASbGnctSiolgeZQ9PG6f25dtCIvWLbB8xfJImcLiZQhHtTt3fFfPcxKr+0bQWJsUCTW
	srHhdID6MeWrJHfIBkbFPEueEgoEuvdh9kAu078xtb1IfIep0hZIw446bUJDOp1Jok1FgXDLMVI
	rjmAH12CYoUQYcUFgWx2cYFhHJ1bWnqkISQ4Ynj2pacMqZBU+PGYWfJso0+JsZJSEzcza2TPVyM
	Iy7aRVcEgf2ujL91/aN27DwXrrHuQl0tEVXp24pqYzlteUUkDW/s1dffnOKv2B2SqrFVePZHsFC
	oZPRpMCCvqpBTYy10ueoQ1FYihOpUrTKUdnJomzx8HHAXQdpzvbBXrDhNtIICYezNX41l4eaMub
	Y4s5/ZBOR/qjoevXBnZualUXNlxMRqQ9Eb79f+im5Yy8uCTHii6iLWKHPjyNaahcZGKxt+ng=
X-Google-Smtp-Source: AGHT+IHgQa4Uq9UQEvvKiaVktbg+CUVUf6QEgcPUl5vH+vhR3j5pl83Hya74jzcLPZVkr6FG6xeM/Q==
X-Received: by 2002:a17:907:9706:b0:af9:add3:6be6 with SMTP id a640c23a62f3a-af9c1e57d37mr12877366b.58.1754577074682;
        Thu, 07 Aug 2025 07:31:14 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------3cymdy8VbN4eYWJSYeGGck07"
Message-ID: <2fa6d182-c7d3-49e4-a9eb-b027f4d3758e@gmail.com>
Date: Thu, 7 Aug 2025 16:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [June-July]
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, "Penny Zheng,"
 <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
 <CAGeoDV9S3oqg-AgvQ1PhDCMM2Fd-uTrunD2q-4vSj9G8LwU9AA@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV9S3oqg-AgvQ1PhDCMM2Fd-uTrunD2q-4vSj9G8LwU9AA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------3cymdy8VbN4eYWJSYeGGck07
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/25 2:50 PM, Mykola Kvach wrote:
> Hi Oleksii,

Hello Mykola,

>
> === ARM ===
>
> * [4.21?] MPU mm subsistem skeleton
>     - Luca Fancellu
>     -
> https://lore.kernel.org/xen-devel/20250312135258.1815706-1-luca.fancellu@arm.com/
>     -https://patchew.org/Xen/20250312135258.1815706-1-luca.fancellu@arm.com/
>
> * [4.21?] Add initial Xen Suspend-to-RAM support on ARM64 (v4)
>     - Mykola Kvach
>     -
> https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epam.com/
> Our team expects to see this feature included in the 4.21 release.
>
> Additional related patches for this feature:
> https://lore.kernel.org/xen-devel/cover.1753778926.git.mykola_kvach@epam.com/
> https://lore.kernel.org/xen-devel/e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com/

Thanks for your comment and info about additional patches.

~ Oleksii


--------------3cymdy8VbN4eYWJSYeGGck07
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
    <div class="moz-cite-prefix">On 8/7/25 2:50 PM, Mykola Kvach wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGeoDV9S3oqg-AgvQ1PhDCMM2Fd-uTrunD2q-4vSj9G8LwU9AA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">Hi Oleksii,
</pre>
    </blockquote>
    <pre>Hello Mykola,

</pre>
    <blockquote type="cite"
cite="mid:CAGeoDV9S3oqg-AgvQ1PhDCMM2Fd-uTrunD2q-4vSj9G8LwU9AA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

=== ARM ===

* [4.21?] MPU mm subsistem skeleton
   - Luca Fancellu
   -
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250312135258.1815706-1-luca.fancellu@arm.com/">https://lore.kernel.org/xen-devel/20250312135258.1815706-1-luca.fancellu@arm.com/</a>
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20250312135258.1815706-1-luca.fancellu@arm.com/">https://patchew.org/Xen/20250312135258.1815706-1-luca.fancellu@arm.com/</a>

* [4.21?] Add initial Xen Suspend-to-RAM support on ARM64 (v4)
   - Mykola Kvach
   -
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epam.com/">https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epam.com/</a>
</pre>
      <pre wrap="" class="moz-quote-pre">
Our team expects to see this feature included in the 4.21 release.

Additional related patches for this feature:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1753778926.git.mykola_kvach@epam.com/">https://lore.kernel.org/xen-devel/cover.1753778926.git.mykola_kvach@epam.com/</a>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com/">https://lore.kernel.org/xen-devel/e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com/</a></pre>
    </blockquote>
    <pre>Thanks for your comment and info about additional patches.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------3cymdy8VbN4eYWJSYeGGck07--

