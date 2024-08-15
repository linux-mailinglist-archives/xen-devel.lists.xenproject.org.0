Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5543952AAA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777873.1187934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVvh-00052V-NE; Thu, 15 Aug 2024 08:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777873.1187934; Thu, 15 Aug 2024 08:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVvh-00050w-JT; Thu, 15 Aug 2024 08:33:57 +0000
Received: by outflank-mailman (input) for mailman id 777873;
 Thu, 15 Aug 2024 08:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSYy=PO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1seVvf-00050o-Tr
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:33:55 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1af7394b-5ae1-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 10:33:54 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53310adb4c3so261909e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 01:33:54 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396c682sm65477466b.196.2024.08.15.01.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 01:33:52 -0700 (PDT)
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
X-Inumbo-ID: 1af7394b-5ae1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723710833; x=1724315633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fewEhSihwMs4ydWbbFvlM4BIxeK1PRq9egoOjfLoXg=;
        b=a3F5onFK4at9N5338LefehjEWrmT5YmZ4vp/diuRcA2B9tzDpYM36QRJrTsOckSqB6
         soel8dJiTqH7FExgLq+6JAQuHg5Uyq79+rPx6JmqdVoVu6JN2PLQC4bZo+VqacRpk5Fr
         cu1LLj1t4MxJoYoo1e6FvnAR6emcpNE1Ru8+wWG4BLfoE/KCkfWo0/3WJM01DWcBBVb9
         9CMm5Zb8nwj1R3EtYEa7c2kbLtu4jfDmJ4OUVrhov7EFoHlIfgZ/NhBKLD/i5Ng4+PpB
         ZEOqLdq6fEcj/x2T9KTyENLrFCqick56X2gT1P0eBW2FsFMXF0qlJf06wdKjh/OeOcus
         6c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723710833; x=1724315633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fewEhSihwMs4ydWbbFvlM4BIxeK1PRq9egoOjfLoXg=;
        b=hXcQLw2QsBgPU59VkzYx4NgMajQ1vpAtuuu9aek89YzB/5/sP7hdEqK3LBEkfWInam
         LflRWoRaYXyMPvmgPeVbuGoItnZwRblWZ4WSWi2aVul3Ldzol4avMnA7aI6O0F8afEJB
         O6jUsk0XfdUuO9S+SYnrwzJS5Uld6tWzKBXljZyZUssKhe+6jurvCLiCaqDLS9agu9DF
         +KQ85IqSnOxMsdPEC9ehyQ9FVLL0422Tmq3Ym7SY6GOTKbye5LIzmY/YrnS+FzT1EVtg
         moe/VEAeNBY6qJvZeyj3rc8Ui9yI4INgpUmh1Xvm3PVZlYBNR1Vmrq3s7VRCyQjSzSfD
         cxCw==
X-Forwarded-Encrypted: i=1; AJvYcCVi4EsPDKYqBh8U0e5bPG9kng/Qd9F3mjqAY0ZBYcXf+GqftU2deACE4d/2KykhjLuvYYoOnZG3O9+ibDkJ1LrZsPboTrX80Gjr3lFbUUE=
X-Gm-Message-State: AOJu0Yyq0+KKY+uLL0wyeqgGAehZnzPw9zg72vjF+JZjnzyvpHNXdvdz
	WGFx/COeLgk1x9tG2PnHTWvyqcz49zRXNjM1KVwY/2pUtavsbnGlVau1AYZ+3rI=
X-Google-Smtp-Source: AGHT+IGhQsbZdJEnIBq4LM1umZZofaHed6HYN1mmlrp65h77hIhD2GbpUlRz1nIr9GkqCgknBd9Tug==
X-Received: by 2002:a05:6512:3b91:b0:530:aa05:eb7c with SMTP id 2adb3069b0e04-532edba8734mr3573302e87.38.1723710833194;
        Thu, 15 Aug 2024 01:33:53 -0700 (PDT)
Message-ID: <07396e04-1def-447a-b83b-ffe3a5b01fbe@suse.com>
Date: Thu, 15 Aug 2024 10:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD EPYC virtual network performances
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
 <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
 <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
 <ZruckufSjT0GkpJt@mattapan.m5p.com>
 <d556e168-8542-4b93-81a9-a7054b5b69ba@suse.com>
 <Zrvf5wgm6xEI63x2@mattapan.m5p.com>
 <e95ab71d-b985-4ab7-994b-1c562efd5f9f@suse.com>
 <Zr0S-2QBf3lkBkfS@mattapan.m5p.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <Zr0S-2QBf3lkBkfS@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.08.24 22:26, Elliott Mitchell wrote:
> On Wed, Aug 14, 2024 at 08:15:38AM +0200, Jürgen Groß wrote:
>> On 14.08.24 00:36, Elliott Mitchell wrote:
>>> On Tue, Aug 13, 2024 at 08:55:42PM +0200, Jürgen Groß wrote:
>>>> On 13.08.24 19:49, Elliott Mitchell wrote:
>>>>>
>>>>> There is a possibility spurious interrupts are being turned into spurious
>>>>> events by the back-end drivers.
>>>>
>>>> No, I don't think so.
>>>>
>>>>> Jürgen Groß, what is the performance impact of "iommu=debug"?  Seems to
>>>>> mostly cause more reporting and have minimal/no performance effect.
>>>>
>>>> I guess you are referring to the Xen option? I'm no expert in this
>>>> area.
>>>
>>> Drat.  I haven't noticed much, which would match with simply enabling a
>>> bunch of debugging printk()s (alas I'm not monitoring performance closely
>>> enough to be sure).  Guess I wait for Andrei Semenov to state a comfort
>>> level with trying "iommu=debug".
>>
>> You didn't answer my question.
> 
> I guess I did not explicitly do so.  I was referring to the Xen
> command-line option.

And again you didn't supply the information I asked for (command line
options of Xen and dom0).

Did you consider that asking for help while not supplying data which has
been asked for is going to result in no help at all? You are wasting the
time of volunteers, which will reduce the motivation to look into your
issue a lot.

That said, I won't look into your problems any longer, as I have a job
to do and I can spend my time much better than trying to help someone who
isn't willing to answer even the simplest questions.


Juergen

