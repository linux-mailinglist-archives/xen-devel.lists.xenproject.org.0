Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284537AB313
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 15:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606906.944990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjgYP-0007MF-5g; Fri, 22 Sep 2023 13:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606906.944990; Fri, 22 Sep 2023 13:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjgYP-0007Jd-2P; Fri, 22 Sep 2023 13:50:45 +0000
Received: by outflank-mailman (input) for mailman id 606906;
 Fri, 22 Sep 2023 13:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5esq=FG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qjgYN-000781-4h
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 13:50:43 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 048e0c9d-594f-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 15:50:41 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3226cc3e324so1271004f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 06:50:41 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4f0a000000b0031f3ad17b2csm4530867wru.52.2023.09.22.06.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 06:50:39 -0700 (PDT)
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
X-Inumbo-ID: 048e0c9d-594f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695390640; x=1695995440; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrFraTbMf82jvk4Ii2MK1VmClFFGJXOZZ+m2vVcFPDg=;
        b=HmbxJGlTgZK3UkLFSxWrbXWsLrqG52Zuq8IQkCwb3oFsC6teEHkbU6xpQIES2gVMru
         KconR0A/xdBv5mLilv1o1LiTdfXGnEEK5Gm3ZiYdwa1FqBB1LMCx+EoKvnxGuZyTpyiQ
         K6YWs3dkLV9Z0Enh3KZYCcVYoY5HD4sVvpMNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695390640; x=1695995440;
        h=in-reply-to:references:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrFraTbMf82jvk4Ii2MK1VmClFFGJXOZZ+m2vVcFPDg=;
        b=Qp/O8gXX2lHoe0Bbg1kaVkDiWyjJ2Uavy7/YNDRSZsHAyUBS/J21oGo69NKVeObPQu
         /s9BqOiToFxF9VJOuXuKfdqnWVulIsEu+6f+2mzeUzJfTIeSHRH3X/TNsHBhn2NlhuSA
         +cT9ugjunj1t+cmcvk9/u7GxT4AWqKOZ2Rq3cvVIYaix9/5X+FWJN/HafqzZQB8TGCAF
         FLWUdu50OwA9xQFful7gZt556JemmSnlTya6Z9UEr7ECmeP8DZIzQ9rQcx5OHwMqgQE4
         Vom3s0j8xhytvuWA5R5vSxI7yphubWtz8CiU0ELXy575ySoLMeW0yPBTFcGATquobXZj
         W3MQ==
X-Gm-Message-State: AOJu0YwycflrfG2bgUUqkRArEVodh3Wzb2Zgnq/XgujRQ1esU9mygdyO
	xbxRQ0cAPSjMuFMrqueU0+7tYA==
X-Google-Smtp-Source: AGHT+IGN6QQNnfvuKk8peP3Ip3sIAlFxKSNxUknvmaHsltBKaZGRrVd3k25A4vhEkgANNAYrJEStDg==
X-Received: by 2002:a05:6000:118d:b0:321:6936:c217 with SMTP id g13-20020a056000118d00b003216936c217mr7968414wrx.14.1695390640236;
        Fri, 22 Sep 2023 06:50:40 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------yYv5ATeT8y7DEmqXjsG2xVFF"
Message-ID: <d9bc0a47-5d33-aa94-7932-02e6323e5cc4@citrix.com>
Date: Fri, 22 Sep 2023 14:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>

This is a multi-part message in MIME format.
--------------yYv5ATeT8y7DEmqXjsG2xVFF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2023 2:08 am, Henry Wang wrote:
> Also, below is the critical items on my list for 4.18 release:
>
> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
>
> https://gitlab.com/xen-project/xen/-/issues/114
>

I've committed all the work so far, which means it's nearly done.

There's one more bugfix still in testing (which will be fine to take at
a later point), and one TODO over xenpvnetboot which I'm tempted to fix
deleting it - it uses modules deprecated in Py2 and fully removed from
Py3, so it's very clear it's never been used in an up-to-date distro.

> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for
> staging | 6a47ba2f
>
> https://marc.info/?l=xen-devel&m=168312468808977
> <https://marc.info/?l=xen-devel&m=168312468808977>
>
> https://marc.info/?l=xen-devel&m=168312687610283
> <https://marc.info/?l=xen-devel&m=168312687610283>
>

Sadly not started.

> 4. The proper eIBRS support for x86
>
> https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/
>

Also not started yet.  All of the time I was going to spend on these two
ended up getting spent making XSA-439 work correctly.

At this point it's too late for either to get done for 4.18.

~Andrew
--------------yYv5ATeT8y7DEmqXjsG2xVFF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/09/2023 2:08 am, Henry Wang
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}div.WordSection1
	{page:WordSection1;}</style>
      <div class="WordSection1">Also, below is the critical items on my
        list for 4.18 release:<o:p></o:p>
        <p class="MsoNormal">1. [PATCH 0/7] tools: More Python 3 fixes
          (part 1 of N)<o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://gitlab.com/xen-project/xen/-/issues/114"
            moz-do-not-send="true" class="moz-txt-link-freetext">https://gitlab.com/xen-project/xen/-/issues/114</a></p>
      </div>
    </blockquote>
    <br>
    I've committed all the work so far, which means it's nearly done.<br>
    <br>
    There's one more bugfix still in testing (which will be fine to take
    at a later point), and one TODO over xenpvnetboot which I'm tempted
    to fix deleting it - it uses modules deprecated in Py2 and fully
    removed from Py3, so it's very clear it's never been used in an
    up-to-date distro.<br>
    <br>
    <blockquote type="cite"
cite="mid:AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal">3. dom0less vs xenstored setup race Was:
          xen | Failed pipeline for staging | 6a47ba2f<o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://marc.info/?l=xen-devel&amp;m=168312468808977"
            moz-do-not-send="true">https://marc.info/?l=xen-devel&amp;m=168312468808977</a><o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://marc.info/?l=xen-devel&amp;m=168312687610283"
            moz-do-not-send="true">https://marc.info/?l=xen-devel&amp;m=168312687610283</a></p>
        <o:p> </o:p></div>
    </blockquote>
    <br>
    Sadly not started.<br>
    <br>
    <blockquote type="cite"
cite="mid:AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal">4. The proper eIBRS support for x86<o:p></o:p></p>
        <p class="MsoNormal"><a
href="https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/"
            moz-do-not-send="true" class="moz-txt-link-freetext">https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/</a><o:p></o:p></p>
      </div>
    </blockquote>
    <br>
    Also not started yet.  All of the time I was going to spend on these
    two ended up getting spent making XSA-439 work correctly.<br>
    <br>
    At this point it's too late for either to get done for 4.18.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------yYv5ATeT8y7DEmqXjsG2xVFF--

