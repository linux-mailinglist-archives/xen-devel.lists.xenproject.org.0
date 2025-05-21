Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30445ABF2F3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 13:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991713.1375540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhkb-0007rr-J4; Wed, 21 May 2025 11:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991713.1375540; Wed, 21 May 2025 11:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhkb-0007pM-Fv; Wed, 21 May 2025 11:36:45 +0000
Received: by outflank-mailman (input) for mailman id 991713;
 Wed, 21 May 2025 11:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHhka-0007pC-RQ
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 11:36:44 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf5ec79-3637-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 13:36:42 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so1131672966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 04:36:42 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4420ccsm871359666b.110.2025.05.21.04.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 04:36:41 -0700 (PDT)
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
X-Inumbo-ID: ddf5ec79-3637-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827402; x=1748432202; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvtI3wCVPYpw9YxMS7wk/RISza5+TDZdXWaw/AwZ9h0=;
        b=IgszQVMHQhXD6+8fOzdv/+f+1PYePzV0wAuAk3qd8vaYX4gFKupa3jNZVVJ57slqdg
         Y9XtRbH6YQ2JG3FFg9flBy6z4UZY8/tj6rGWb/FW6oHG69tiv/XLKzHb7eAEWj30TlHY
         iydLXeTq8Z7hsvZTYkvzTFkAPDKf30t841BKhduRFtqkpgN64/xPLOZpGLa2kkhMQsLw
         Wuplu1Saf/IlGJLGUf7TGU54Hhb6ZFEIrpQxfJKE/Jinyl7Zso/maFBAC/k+VUQVy1mN
         gViJxbdB93IPczze7TmY+Xo8M612VXl4gc5S9EjPP9jEA/Z3XJnfQ/yVfS1uAFGSKX9W
         DItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827402; x=1748432202;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvtI3wCVPYpw9YxMS7wk/RISza5+TDZdXWaw/AwZ9h0=;
        b=WYUCnm7Lve3OxM8vs03D9FhdQYNIDYmUp774XDojv0zEZjjUWecEQ8uChNvrrOIJDz
         LOO16Ey5HmUXT0kxI3YJsoUXh9oIoq1TJjEMFBCJ+3pUM5i1xeOEBYOqxbLJWUgs9QCz
         7OomKVMIlCRbBWQd1ra8DWKzASykcE224SvST7+Ztj67qRv+8bSyUqDO3+Dse7OlebFO
         /m/HC6BXh8llUXPmJ040hVyWVf4L9MP/nvuuL57AXszeJKaND9En8BX4wphcDJouvEJ8
         u084pvZ0pEjegZmvIzNoLovuF/+GtQNAN2jHSFLzIzO42VK348ZrLpmCbmkkGzwJJwdu
         f1hA==
X-Gm-Message-State: AOJu0YzI3eImuJTw0WNxQLKG3JvlQTxChqYKmWsSRXqMAN7X4Fc3egSn
	ka7v1kWuhDy1Q6agkxLIXVVVucBxFRbA9LFLcJ2OlfA6xJYru8QSFxY7
X-Gm-Gg: ASbGncuy7kZ8y7NuMyKmwAhLftoeP2ZGReBkF25iRzPgB8h61R81JW2Gg//xfp+YfmD
	0pfeIkLtG7zzq9XZvQyzRMWXy3uz6S71TUpSmbcd0z1BtNTJs6AGvCyUyc06GD3x7JFqmfH9Obo
	C7LFQPljQpsnuaQxKFDv8F7vobD9PTEslavTpQRTSAI/Q+eFFQZcGpefpxkxhvmDxxK89Y8pTIU
	aR5yGqZy5+4owVLXJOcaN7fhP79A0G1Gw2nQcTqBkwO9ip4R2SwHacBKlIWu7oCLkbGjDYKNJop
	l6wD1EtInOJ2qDZsV5S1stiu8osrOhk1FiTeuMDBmHVAfSl0wUpFQC1QAGSuzvn6cO96ecdMlDe
	LQCpAB0SFuDFXjA0yPYUaN1pG
X-Google-Smtp-Source: AGHT+IFlhVAFV1Hr0cQyaNFkJ4DbNc7BwRVXzgmt2V0n16deA8ox39DwdDo7SxCxFgMgn6dZW+voGQ==
X-Received: by 2002:a17:907:3e16:b0:ad4:f512:733 with SMTP id a640c23a62f3a-ad536dce6e4mr1986447766b.45.1747827401526;
        Wed, 21 May 2025 04:36:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fSTWdDHqTBPPhtZzqumk8kgM"
Message-ID: <9591ab10-9e39-4af0-a8e6-d701fa0e114d@gmail.com>
Date: Wed, 21 May 2025 13:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: add initialization support for virtual SBI
 UART (vSBI UART)
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
 <aCeXCV9680kKFqg/@kraken>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aCeXCV9680kKFqg/@kraken>

This is a multi-part message in MIME format.
--------------fSTWdDHqTBPPhtZzqumk8kgM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 5/16/25 9:50 PM, dmkhn@proton.me wrote:
> Hi Oleksii,
>
> On Mon, May 12, 2025 at 05:55:21PM +0200, Oleksii Kurochko wrote:
>> This is the first step toward supporting a vSBI UART.
>>
>> The implementation checks for the presence of the "vsbi_uart" property
>> in the device tree. If present, the vSBI UART is initialized by:
>> - Allocating a structure that holds Xen console rings and character
>>    buffers.
>> - Initializing the vSBI UART spinlock.
>>
>> This commit introduces the following:
>> - domain_vsbi_uart_init() and domain_vsbi_uart_deinit() functions.
>> - A new arch_kernel_info structure with a vsbi_uart member.
>> - A vsbi_uart structure to hold information related to the vSBI
>>    driver, including:
>>    - Whether the vSBI UART backend is in the domain or in Xen.
>>    - If the backend is in Xen: details such as ring buffer, ring page,
>>      Xen console ring indexes, and character buffers.
>>    - A spinlock for synchronization.
>>
>> Also, introduce init_vuart() which is going to be called by dom0less
>> generic code during guest domain construction.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> JFYI, I started to move all virtual UARTs under drivers/vuart directory
> and introducing a framework for hooking vUARTs into console driver.
>
> pl011 emulator cleanup
>    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/3c635962a349afed75f47cd2559a4160ffa41106
>
> original 'vuart' for hwdom cleanup
>    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/405c86cbd6d55f5737dc9ccf9b8a8f370767e3f0
>
> move pl011 to drivers/vuart
>    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/4b5cdff118a2795278dfcc2c1b60423b46e85f27
>
> move 'vuart' for hwdom cleanup to drivers/vuart
>    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/d76c17b8056c1d500afd854a513403fc3774da51
>
> which is followed by vUART driver framework introduction (not posted):
>    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/ebc7e83650e5e3f68e5d734e5c475c6bcde626fa
>
> These patches ^^ are not posted, since I do already have enough patches on
> the mailing list which are in progress.
>
> I did this work along w/ NS16550 emulator on x86.
>
> IMO, it is worth delivering those patches first and then integrate SBI UART.

Agree, it makes sense. But If it will take a lot of time to upstream/merge then I prefer this patch
go first to not block RISC-V upstreaming.

Anyway, I will look at your changes tomorrow.

Thanks.

~ Oleksii

--------------fSTWdDHqTBPPhtZzqumk8kgM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Denis,

</pre>
    <div class="moz-cite-prefix">On 5/16/25 9:50 PM, <a class="moz-txt-link-abbreviated" href="mailto:dmkhn@proton.me">dmkhn@proton.me</a>
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aCeXCV9680kKFqg%2F@kraken">
      <pre wrap="" class="moz-quote-pre">Hi Oleksii,

On Mon, May 12, 2025 at 05:55:21PM +0200, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This is the first step toward supporting a vSBI UART.

The implementation checks for the presence of the "vsbi_uart" property
in the device tree. If present, the vSBI UART is initialized by:
- Allocating a structure that holds Xen console rings and character
  buffers.
- Initializing the vSBI UART spinlock.

This commit introduces the following:
- domain_vsbi_uart_init() and domain_vsbi_uart_deinit() functions.
- A new arch_kernel_info structure with a vsbi_uart member.
- A vsbi_uart structure to hold information related to the vSBI
  driver, including:
  - Whether the vSBI UART backend is in the domain or in Xen.
  - If the backend is in Xen: details such as ring buffer, ring page,
    Xen console ring indexes, and character buffers.
  - A spinlock for synchronization.

Also, introduce init_vuart() which is going to be called by dom0less
generic code during guest domain construction.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
JFYI, I started to move all virtual UARTs under drivers/vuart directory
and introducing a framework for hooking vUARTs into console driver.

pl011 emulator cleanup
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/3c635962a349afed75f47cd2559a4160ffa41106">https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/3c635962a349afed75f47cd2559a4160ffa41106</a>

original 'vuart' for hwdom cleanup
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/405c86cbd6d55f5737dc9ccf9b8a8f370767e3f0">https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/405c86cbd6d55f5737dc9ccf9b8a8f370767e3f0</a>

move pl011 to drivers/vuart
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/4b5cdff118a2795278dfcc2c1b60423b46e85f27">https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/4b5cdff118a2795278dfcc2c1b60423b46e85f27</a>

move 'vuart' for hwdom cleanup to drivers/vuart
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/d76c17b8056c1d500afd854a513403fc3774da51">https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/d76c17b8056c1d500afd854a513403fc3774da51</a>

which is followed by vUART driver framework introduction (not posted):
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/ebc7e83650e5e3f68e5d734e5c475c6bcde626fa">https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/ebc7e83650e5e3f68e5d734e5c475c6bcde626fa</a>

These patches ^^ are not posted, since I do already have enough patches on
the mailing list which are in progress.

I did this work along w/ NS16550 emulator on x86.

IMO, it is worth delivering those patches first and then integrate SBI UART.</pre>
    </blockquote>
    <pre>Agree, it makes sense. But If it will take a lot of time to upstream/merge then I prefer this patch
go first to not block RISC-V upstreaming.

Anyway, I will look at your changes tomorrow.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------fSTWdDHqTBPPhtZzqumk8kgM--

