Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A204EA128B9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872747.1283740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6II-0002xv-Mw; Wed, 15 Jan 2025 16:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872747.1283740; Wed, 15 Jan 2025 16:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6II-0002vZ-JG; Wed, 15 Jan 2025 16:31:02 +0000
Received: by outflank-mailman (input) for mailman id 872747;
 Wed, 15 Jan 2025 16:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4PG=UH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tY6IH-0002vT-5b
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:31:01 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a7c5f2f-d35e-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 17:31:00 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54026562221so7149113e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 08:31:00 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becb15dsm2022132e87.238.2025.01.15.08.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 08:30:58 -0800 (PST)
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
X-Inumbo-ID: 1a7c5f2f-d35e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736958659; x=1737563459; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0hDi3ZdVEye7prLvwhTXtSTlQyM6lv0uwFu2SMg7ww=;
        b=P0MkPG5svlEx/nbwOuvdS/jXv1RlcwSQ6gvDUpaqMvFUwskGSOmnr15sm9nAJ2lvYd
         Id6FJyVmALsI76bF5fyT0s2I5mu7t9P2LTMNuZSaRt4DrjHwPIkjO7yZ+E5hSVnI6KgT
         y7Y531hM6MVnz5th6zSyimkZgW7/s1C+sOR7FUM5H24B5b5TkxXyw+uGpQqPO1KAMWDS
         i+29CRA6l0JHUz2sderSDufWTMFPkR/8E+ClZgVwrLrbZK16uyttcVDnsYCjCFuOXaqR
         /O2No0/vfd8rD0aPTHUB1A8jWZNBIHhMR8cimEUkrv+JKre2/wyMyIve04lZL3x+FUNg
         8FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736958659; x=1737563459;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w0hDi3ZdVEye7prLvwhTXtSTlQyM6lv0uwFu2SMg7ww=;
        b=bB+faOzNgZwfrrHmbOkzdZkNzmMkTr2fYuoyzZOddc7gygS350hvPODJfwhrQGB2R+
         C9vJ6LS7mQXQge9tdRBXm7V+tuQov0jAsMrqB+hErneeBbIVlH5D4unYqERRoYMWOtSx
         edohCGU44tuhgv+28WF+H6gWIIlGU/E/tbEj8rrA6PSpni4si1bBZnOBsDzdbvEXKqic
         7zY4c2w3r/mnwb6CB/eNIt9BTMnEAScAIc5Q7a8JoGhQZLQixNdgj3izY9jP2XpgObxP
         4Ia7ivcylQVlwc6ZcfLXiHPMNAVN552pRxDzPQ6BDKfOI2KNWMzvuH0KmzCU0Z5fW4t5
         OVuw==
X-Forwarded-Encrypted: i=1; AJvYcCXPT2oIuKB5qHuYhAEyDsHVZkNlLV3gE02M+sfaMQrYT8Z0UKZg4MPwVhNfDhwftZPa2HB9ZuSXCqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGw7xlQjXD9cISluayyY1mdgROoJoAx4rps+CGU3SPew9uzAx7
	TR4NQOQuTrZlLEMy+3Gh5Pel3f+nhxFkStVxKqRHVLls0zsopw3C
X-Gm-Gg: ASbGncvtJ1vO2PDICVMJQOfh93fM8Dy55NJKy+JOH3DHlUDSg+QjFdc93ERREGvgYAx
	pPUdlzipGgypA40RUczZYEqRYOWP63MS0NjaAcobmWzGIYc9t9GzR5pBxmCZyK65pFW4ydfOYEO
	RPUQW4BLviCPBgtRtXpDKYpACAYuAtj+nFZw9dkonMrQULH1hcv9evTk2jgw+iWFTDREu/txlWS
	hqJqsnt3qLaaW+GkmFjQsJih0ne71W2UrHpYLnP7M8cdzDJeLfrBteaiXtL0lqiSg4DqQ==
X-Google-Smtp-Source: AGHT+IHqozlGT7lRatYG/bFCqt5LMNZZ3aQleXcw/cpbHBKijQLeRzTlMzhNdZa156V1ZZj+PMgB1w==
X-Received: by 2002:a05:6512:4020:b0:542:9987:6ead with SMTP id 2adb3069b0e04-54299877201mr5024807e87.5.1736958658596;
        Wed, 15 Jan 2025 08:30:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Ci2H156EfJ7OyKE0RBG3P315"
Message-ID: <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com>
Date: Wed, 15 Jan 2025 17:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Stefano Stabellini <sstabellini@kernel.org>,
 Milan Djokic <milandjokic1995@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com,
 oleksandr_tyshchenko@epam.com, Slavisa.Petrovic@rt-rk.com,
 Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com,
 sunilvl@ventanamicro.com, takakura@valinux.co.jp,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------Ci2H156EfJ7OyKE0RBG3P315
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 1/15/25 1:01 AM, Stefano Stabellini wrote:
> +Oleksii
>
> On Tue, 14 Jan 2025, Milan Djokic wrote:
>> From: Slavisa Petrovic<Slavisa.Petrovic@rt-rk.com>
>>
>> This patch introduces initial support for running RISC-V as a Xen guest.
>> It provides the necessary infrastructure and stubs for Xen-specific
>> operations. Key changes include:
>>
>> - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
>>    and interfaces, with function implementations stubbed for future work.
>> - Introduction of Xen-specific headers for RISC-V, including event
>>    handling, hypervisor interaction, and page management. Functions are
>>    defined but not yet implemented.
>> - Stub implementations for memory management, grant tables, and context
>>    switching in the Xen environment, allowing further development and
>>    integration.
>>
>> Signed-off-by: Milan Djokic<Milan.Djokic@rt-rk.com>
>> Signed-off-by: Slavisa Petrovic<Slavisa.Petrovic@rt-rk.com>
> Hi Milan, Slavisa,
>
> Thank you very much for your contribution! Which Xen tree are you using
> for development?

They are using [1] and have separate branches on top of latest. So we are in
sync. Also, if you are interested we have created a task/epics for this feature in
[1] so you could also check there some details:
1.https://gitlab.com/groups/xen-project/people/olkur/-/epics/5
2.https://gitlab.com/xen-project/people/olkur/xen/-/issues/12

>   I am asking because RISC-V support in Xen is still in
> the process of being upstreamed, and [1] is the tree that consolidates
> all patches currently on the to-be-upstreamed list.
>
> While the specific Xen tree you are using is not particularly important
> at this stage, and using [1] is not a requirement, I am asking because
> it is essential to align on the hypervisor ABI, especially regarding any
> details that have not yet been upstreamed. Specifically, is there
> anything in this patch series that relies on features not yet upstream
> in Xen?

There are few features but some things which are Rt-Tk's branch in [1] could go
without waiting for these features to be upstreamed.

Thanks.

~ Oleksii

>
> [1]https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads
--------------Ci2H156EfJ7OyKE0RBG3P315
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Stefano,
</pre>
    <div class="moz-cite-prefix">On 1/15/25 1:01 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">+Oleksii

On Tue, 14 Jan 2025, Milan Djokic wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Slavisa Petrovic <a class="moz-txt-link-rfc2396E" href="mailto:Slavisa.Petrovic@rt-rk.com">&lt;Slavisa.Petrovic@rt-rk.com&gt;</a>

This patch introduces initial support for running RISC-V as a Xen guest.
It provides the necessary infrastructure and stubs for Xen-specific
operations. Key changes include:

- Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
  and interfaces, with function implementations stubbed for future work.
- Introduction of Xen-specific headers for RISC-V, including event
  handling, hypervisor interaction, and page management. Functions are
  defined but not yet implemented.
- Stub implementations for memory management, grant tables, and context
  switching in the Xen environment, allowing further development and
  integration.

Signed-off-by: Milan Djokic <a class="moz-txt-link-rfc2396E" href="mailto:Milan.Djokic@rt-rk.com">&lt;Milan.Djokic@rt-rk.com&gt;</a>
Signed-off-by: Slavisa Petrovic <a class="moz-txt-link-rfc2396E" href="mailto:Slavisa.Petrovic@rt-rk.com">&lt;Slavisa.Petrovic@rt-rk.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hi Milan, Slavisa,

Thank you very much for your contribution! Which Xen tree are you using
for development?</pre>
    </blockquote>
    <pre>They are using [1] and have separate branches on top of latest. So we are in
sync. Also, if you are interested we have created a task/epics for this feature in
[1] so you could also check there some details:
1. <a class="moz-txt-link-freetext" href="https://gitlab.com/groups/xen-project/people/olkur/-/epics/5">https://gitlab.com/groups/xen-project/people/olkur/-/epics/5</a>
2. <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/issues/12">https://gitlab.com/xen-project/people/olkur/xen/-/issues/12</a>

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre"> I am asking because RISC-V support in Xen is still in
the process of being upstreamed, and [1] is the tree that consolidates
all patches currently on the to-be-upstreamed list.  

While the specific Xen tree you are using is not particularly important
at this stage, and using [1] is not a requirement, I am asking because
it is essential to align on the hypervisor ABI, especially regarding any
details that have not yet been upstreamed. Specifically, is there
anything in this patch series that relies on features not yet upstream
in Xen?  </pre>
    </blockquote>
    <pre>There are few features but some things which are Rt-Tk's branch in [1] could go
without waiting for these features to be upstreamed.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads">https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads</a>
</pre>
    </blockquote>
  </body>
</html>

--------------Ci2H156EfJ7OyKE0RBG3P315--

