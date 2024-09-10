Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9E974101
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 19:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795949.1205442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4xl-0000Ec-Fm; Tue, 10 Sep 2024 17:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795949.1205442; Tue, 10 Sep 2024 17:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4xl-0000Ce-DB; Tue, 10 Sep 2024 17:47:37 +0000
Received: by outflank-mailman (input) for mailman id 795949;
 Tue, 10 Sep 2024 17:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWlv=QI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1so4xk-0000CU-J1
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 17:47:36 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b71bdd-6f9c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 19:47:34 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so11006766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 10:47:34 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d29399sm506894066b.185.2024.09.10.10.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 10:47:32 -0700 (PDT)
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
X-Inumbo-ID: c2b71bdd-6f9c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725990454; x=1726595254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZbwvOHZTwLb2ayp7iJGnlX8k53MT09kmYsoQEiqAQ0=;
        b=NnMaClfi25yU599jtfueOlNqH+VCNUQpUqBD5aV3xqwR5yeZwaJuwtZW6cJYLBtNsJ
         crxEeUx+rfETWhF2Y7QLwfPOkI75VJhC3vR8YxnGRRW+JVtUZskFuTCVY+knHvgWgOe1
         KdUY3WNUISIsGga8TRuPfFJ2SQYPHlz6lJy/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990454; x=1726595254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZbwvOHZTwLb2ayp7iJGnlX8k53MT09kmYsoQEiqAQ0=;
        b=bychHp853X5/2AjowMCF9LDKjOPCIBQIq/QdMPyBHh+Rl9OpCkcwA5yB+Kil426JQc
         nAvA0P659cvcG2sVVoMzdQc7UVM4MzpomZ1eToPvU4lNZvhJxbK2M065574TOGnKRPD/
         ahi07UOu1t/IH6QY/Nl1QBWCjxd5yABfoTFulNYpPO0aT/372b993vQ4ofAI9ePzBvDV
         OXJwbcIhmpQoAeowj1zLCTQGLv1I2myDJYvnW2EXDParLTSpwgf+9la2xJ5HPiID0oK6
         FIHqNIWsjGZCnYsSmKYBzG09zMeo6Lw+eB4jVvzlJCCAVhEgxAzOiCCTRaZoff0VwkMz
         N7Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVDCQkItHRYWeOAbdsAz/Md7N5NjbkHWI0cTgOzzAsZO169mMKy3MRqeLqqSSlqoQNT6oAkjpKPmh4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNneDRfArhem2EwTAfT0mmmN1SEUicS/CIaY5BEl0GrnpLwzdA
	jNCxyGBfMugShkZv2TCZQBts5mchRAV+jx5N/7GTKChOQnS6vNANXgBLsIT9Llk=
X-Google-Smtp-Source: AGHT+IEB2APYUeKe5IgpDV/AZDhRyuD9uWDyj61PQfwSLMvul3JQOnL7qEmn9y+kyXHPxlFfVuviNg==
X-Received: by 2002:a17:907:7283:b0:a86:9fac:6939 with SMTP id a640c23a62f3a-a8ffb2fe465mr220002366b.30.1725990453236;
        Tue, 10 Sep 2024 10:47:33 -0700 (PDT)
Message-ID: <f05cb8f3-31ff-48db-b741-aa3a5ba6b74c@citrix.com>
Date: Tue, 10 Sep 2024 18:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/HVM: drop stdvga's "stdvga" struct member
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
 <836afb28-581c-4ab8-a0a9-badf29a51b5e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <836afb28-581c-4ab8-a0a9-badf29a51b5e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/09/2024 3:40 pm, Jan Beulich wrote:
> Two of its consumers are dead (in compile-time constant conditionals)
> and the only remaining ones are merely controlling (debugging) log
> messages.

Minor, but I'd phrase this as "merely controlling debug logging."

>  Hence the field is now pointless to set, which in particular
> allows to get rid of the questionable conditional from which the field's
> value was established (afaict 551ceee97513 ["x86, hvm: stdvga cache
> always on"] had dropped too much of the earlier extra check that was
> there, and quite likely further checks were missing).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/hvm/stdvga.c
> +++ b/xen/arch/x86/hvm/stdvga.c
> @@ -103,7 +103,7 @@ static void vram_put(struct hvm_hw_stdvg
>  static int stdvga_outb(uint64_t addr, uint8_t val)
>  {
>      struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
> -    int rc = 1, prev_stdvga = s->stdvga;
> +    int rc = 1;

This looks to also drop a MISRA essential-type complaint.

>  
>      switch ( addr )
>      {
> @@ -132,19 +132,6 @@ static int stdvga_outb(uint64_t addr, ui
>          break;
>      }
>  
> -    /* When in standard vga mode, emulate here all writes to the vram buffer
> -     * so we can immediately satisfy reads without waiting for qemu. */
> -    s->stdvga = (s->sr[7] == 0x00);
> -
> -    if ( !prev_stdvga && s->stdvga )
> -    {
> -        gdprintk(XENLOG_INFO, "entering stdvga mode\n");
> -    }
> -    else if ( prev_stdvga && !s->stdvga )
> -    {
> -        gdprintk(XENLOG_INFO, "leaving stdvga mode\n");
> -    }
> -
>      return rc;
>  }
>  
> @@ -425,7 +412,6 @@ static int cf_check stdvga_mem_write(
>      const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
>      uint64_t data)
>  {
> -    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
>      ioreq_t p = {
>          .type = IOREQ_TYPE_COPY,
>          .addr = addr,
> @@ -436,8 +422,7 @@ static int cf_check stdvga_mem_write(
>      };
>      struct ioreq_server *srv;
>  
> -    if ( true || !s->stdvga )
> -        goto done;
> +    goto done;
>  
>      /* Intercept mmio write */
>      switch ( size )
> @@ -498,19 +483,17 @@ static bool cf_check stdvga_mem_accept(
>  
>      spin_lock(&s->lock);
>  
> -    if ( p->dir == IOREQ_WRITE && p->count > 1 )
> +    if ( p->dir != IOREQ_WRITE || p->count > 1 )
>      {
>          /*
>           * We cannot return X86EMUL_UNHANDLEABLE on anything other then the
>           * first cycle of an I/O. So, since we cannot guarantee to always be
>           * able to send buffered writes, we have to reject any multi-cycle
> -         * I/O.
> +         * I/O. And of course we have to reject all reads, for not being
> +         * able to service them.
>           */
>          goto reject;
>      }
> -    else if ( p->dir == IOREQ_READ &&
> -              (true || !s->stdvga) )
> -        goto reject;

Before, we rejected on (WRITE && count) or READ, and I think we still do
afterwards given the boolean-ness of read/write.  However, the comment
is distinctly less relevant.

I think we now just end up with /* Only accept single writes. */ which
matches with with shuffling these into the bufioreq ring.

~Andrew

