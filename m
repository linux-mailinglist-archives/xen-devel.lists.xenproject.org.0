Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1CBC965A
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 15:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140646.1475470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6rAL-0005YB-PP; Thu, 09 Oct 2025 13:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140646.1475470; Thu, 09 Oct 2025 13:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6rAL-0005Wk-Ls; Thu, 09 Oct 2025 13:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1140646;
 Thu, 09 Oct 2025 13:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDLD=4S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v6rAK-0005We-BV
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 13:58:44 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10670a49-a518-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 15:58:42 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3dbf11fa9eso167495666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 06:58:42 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4c7396b863sm1179671866b.65.2025.10.09.06.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 06:58:41 -0700 (PDT)
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
X-Inumbo-ID: 10670a49-a518-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760018322; x=1760623122; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhhawq/U58NrrthBnVjhi9Ol7gOE/DlKlkAr0eqZ7+g=;
        b=OaKyu4bFZ+dH2YLaNSSdn5fA9rtSC685+p1TiXcvZK7MiGRY/fSoXTfr4PoJmOoVn8
         WXcHkmVLu1Tlq8kZwKAHdHUFkcQJPvIJxRRQ3dtehq9o9vx8m39Pp+YfBVb4Bz1T4uUS
         jwaNrV/HvgKxBrAZAONKCjDGiB8Ps/wY7gfo6gr6ZUrkfg+7P4xfePLcw/T3tN3YteRL
         ehzjDau97sgz6piS5M7OYyKhGPQaod7AzsNfYpDXdJQLchT6bLjGQm/Z2GF4AMW7SHcm
         SuhFeOoDi3Usy075vEoTgocwtgCJEAUpYMCBcMzK17V8Zl2r7gpbokjcTnKUT2lgIZLr
         caSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018322; x=1760623122;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dhhawq/U58NrrthBnVjhi9Ol7gOE/DlKlkAr0eqZ7+g=;
        b=kwRSAkRaH/lIxvgQN6CtkCBOFxuq02/wC8IS+dPu5Md3wFggfBkBVH4sDTrled8/uT
         pvPBGv5TC7Q+HBz+xR4erM9nQTwDb39hoyrjelRJ+TjoWEgxq/CI4TM4hgUUHyZ8/+Qe
         KX53R2rCxlyEgmsQCvq8e6/j8ANVo+szUh/iOZFkmyDIWwCD3KDQ7XztuEztuuXjdJP7
         m+Hu8UpSDmd5SAl2vCS7WLID58z0dVfB3U8wWcIqKjx/9FOI3GQ24VeadgwyOuIJiUjn
         gDvaXocWPWmtqRiQzJPa7sMRP2JvLwLR0EMP2hq1+RcqSAaFrfCL2KANNhc0X/Q2yGAI
         ntXw==
X-Forwarded-Encrypted: i=1; AJvYcCUnrlvCwXIkeIv1p54FtUailSUBc9futXf/iSsT7jFfAO5FKXoCYL4PjOSnONsO6ZS6klyAbRg/gww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvcrFuFDmHj/CGj/itUsLkNCtl78r9Wxb7LWi3FjO3jAtsw8BB
	2jyTtbZ3fZVGlZwlFNDJXNmDdzDTNGi1bgyXJ+jKROrZk6OxJoObkw8k
X-Gm-Gg: ASbGncswLPFlmK7GixeRJ+xYceJP4sBQO3kI63Okxs7laDxDVnYqisnyr56A0z4qWxd
	4bNXGZNteBxZeYmRb/GdlXdXdDmHANUHWoEHQyqun4RRYfPvXLtIUVqEZJYO4sLsy6nv1T46xqx
	MpEqa45YRi5TmV/kybnTONbYYSdb+av+/BPwC8lQx8/13NQt7dw52yuY2UYVh6/d13xXYAAtG8Q
	BAOoKcEpljHafKEVqTH147PBgbOQhjXui2VPxjf7el2I25FGoi0C8xFiHNdyPqGe2/h4NDp3FAn
	7YPORNfnRkX2wC8RO3UmD42m6mW4VJzTPwbIgQdDhKeHccL/g1WLY09aIVA1kokTXHRuPXyYl16
	IenF0MJQ8yiMTslyrkv9CSfgb6/7gKZwGogc6DMvkPQ5l8CtTxQH06PnKIEenVF/lw4IZ8BqIo4
	/yhpLzAgJzVqwki6oMBqDD9cN4New=
X-Google-Smtp-Source: AGHT+IH6hvYAhI+GCOS1nHHHIYMZZKZ6n7UtOUjHp8pMehkNtq0YSbohwZEpUhFKU8kFIfUn9veQ9Q==
X-Received: by 2002:a17:907:2d0d:b0:b4e:f7cc:72f1 with SMTP id a640c23a62f3a-b50aaba1161mr827704666b.22.1760018321451;
        Thu, 09 Oct 2025 06:58:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------DOpWkZ2vHPb63xZSlZh3qcDl"
Message-ID: <0830134a-ff0f-4183-877a-b4733b45156b@gmail.com>
Date: Thu, 9 Oct 2025 15:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 0/3] x86/vLAPIC: CMCI LVT handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>

This is a multi-part message in MIME format.
--------------DOpWkZ2vHPb63xZSlZh3qcDl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/8/25 2:07 PM, Jan Beulich wrote:
> 1: add indirection to LVT handling
> 2: drop VLAPIC_VERSION
> 3: properly support the CMCI LVT
>
> Now having this coded up, I realize it may be too intrusive at this point of
> the release cycle. Still I wanted to propose it ...

IIUC (not being an x86 expert, please take that into account),
Xen advertises CMCI support but doesn’t emulate it properly, which means
the guest stops noticing corrected errors. This could result in lost error
reports or potential guest kernel warnings, right?
Would that lead to inconsistencies in the MCE subsystem?

I’m not entirely sure this issue is critical, as the related Linux
configurations can be disabled, or MCE can be turned off using|mce=off|.
At the very least, CMCI can be disabled with|mce=no_cmci|. So, unless there are
other objections, I think this can be deferred until 4.22.

Thanks.

~ Oleksii

--------------DOpWkZ2vHPb63xZSlZh3qcDl
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
    <div class="moz-cite-prefix">On 10/8/25 2:07 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com">
      <pre wrap="" class="moz-quote-pre">1: add indirection to LVT handling
2: drop VLAPIC_VERSION
3: properly support the CMCI LVT

Now having this coded up, I realize it may be too intrusive at this point of
the release cycle. Still I wanted to propose it ...</pre>
    </blockquote>
    <pre data-start="162" data-end="425">IIUC (not being an x86 expert, please take that into account),
Xen advertises CMCI support but doesn’t emulate it properly, which means
the guest stops noticing corrected errors. This could result in lost error
reports or potential guest kernel warnings, right?
Would that lead to inconsistencies in the MCE subsystem?</pre>
    <pre data-start="427" data-end="709">I’m not entirely sure this issue is critical, as the related Linux
configurations can be disabled, or MCE can be turned off using <code
    data-start="557" data-end="566">mce=off</code>.
At the very least, CMCI can be disabled with <code data-start="613"
    data-end="626">mce=no_cmci</code>. So, unless there are
other objections, I think this can be deferred until 4.22.

Thanks.

~ Oleksii</pre>
    <pre></pre>
  </body>
</html>

--------------DOpWkZ2vHPb63xZSlZh3qcDl--

