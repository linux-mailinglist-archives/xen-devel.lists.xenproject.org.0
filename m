Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CBAACF551
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007268.1386589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEKv-0007kH-SC; Thu, 05 Jun 2025 17:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007268.1386589; Thu, 05 Jun 2025 17:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEKv-0007iY-Nd; Thu, 05 Jun 2025 17:25:05 +0000
Received: by outflank-mailman (input) for mailman id 1007268;
 Thu, 05 Jun 2025 17:25:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uNEKt-0007B4-O7
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:25:03 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 014c0be6-4232-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 19:24:58 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so1808771f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 10:24:58 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526f4c808sm2871357f8f.28.2025.06.05.10.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 10:24:57 -0700 (PDT)
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
X-Inumbo-ID: 014c0be6-4232-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749144298; x=1749749098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aT4xlVdmPM3dcSL4LpqxBEaD/CpUWMmlGqv27BCEQ3U=;
        b=NirD4fFr0Fnj2IClbILsbMnV2c+8ku4FAKiuvXon0rxHjilmh+w2FpHVuwxuqRehLL
         LHgMErkHw9jxKf1dvJcmvCV/kza7Au/JX/NKihLK/ePa3ezpL81WB4UQSfO3Vzull5L3
         SdvUBEJ5TM107eHRtaDay/rDD8mEBJvj4Ihjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144298; x=1749749098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT4xlVdmPM3dcSL4LpqxBEaD/CpUWMmlGqv27BCEQ3U=;
        b=rBcsqVB8gPJCRm8VFQVNAsSkQMyXF6ZoJBkA0VQ46cdv7kwFaeYlC//3JB+IBk4Gp5
         TDq7GQ9Bm8DZVYVfUZJVKQnba0C/QFtoH8+9w6R5NhFvm4Kx4TJtp6tJD+QgFPH73SYs
         AHrbABXbUz6v/5Q1mHH8YgOCpZ4nuQ8z//vJ6mc2aNQ/bKYAr6Xg6llZg+IYv4Po3BA1
         bw0zDLPErlwWOEQUnxFs1t+43p07Qbx7+EyWUD4Fddf52XXwdz54AzEM+tM358Xp1vQD
         luR48494UTEyhskPwXwRUHLxnphnchlSzeUBD6aO4ZBrPHsroeCg4BDhpJRpLqXCqhjd
         BUfw==
X-Forwarded-Encrypted: i=1; AJvYcCWO5RF/DlrrqfuvBeG1LipwBwrLxOnHpGyU7kBO9h+7YHgkpicuxbfkax+a390QN+ha6sHQWeHGsIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUGExaD6ArJzxdRsfk+BUcbiwLGUFxUsKbQqYl19ledKNOVr1J
	2NAvTqkDerqRbs7MNvfaUnZtUJHBo0eLsnbCufnYdgewuxiydvyQeUNwflKf9bG42fE=
X-Gm-Gg: ASbGnctt/aiWERwJOtx8jdF0SRETlyeueTyKOALJ5mIgXy9/Z8mgJz0CsbQoYRoi+bb
	6PgzvomWbN2NncaZqJlWEZ/zeWaEgt6yl79sIUIyRy/cK8hqN3wziNapVyl7yOtY9isuXxaJvz3
	kp2rQfE74cBh6wnzDeNOrzDONO0Ixh3NaoJkkh6XxrHeu3lbQeZ2q+vfOXUPKswx3tE767i80e9
	k5il702BX9i2XJeI0NbD5ZgMc2HlCAqMYU8L/yWAWcMcxuaCmVAt0Oj1HexDpVV++CheiwND4+G
	P4iT/rD8AZf8tNWL/hwKk0nWE5XRK/23EUBROI/8iMGOYB+eZgrv91e3l4M+2X0hCMSz4GW/Ec5
	B+aCVzANZhRyiaFUm
X-Google-Smtp-Source: AGHT+IGC0eTU31ibD9zhhg55NHqzmmE+JYBds4NIPodJDnlj28KR92dp7BEIo1woQDP+sYkIG5enzA==
X-Received: by 2002:a05:6000:144e:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3a526e0cf3emr4350327f8f.20.1749144298111;
        Thu, 05 Jun 2025 10:24:58 -0700 (PDT)
Message-ID: <dda11e5f-4802-4ef2-a086-fe85943dfcbc@citrix.com>
Date: Thu, 5 Jun 2025 18:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] x86: re-work memcpy()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
 <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/06/2025 11:25 am, Jan Beulich wrote:
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -195,12 +195,16 @@ void *place_ret(void *ptr)
>   * executing.
>   *
>   * "noinline" to cause control flow change and thus invalidate I$ and
> - * cause refetch after modification.
> + * cause refetch after modification.  While the SDM continues to suggest this
> + * is sufficient, it may not be - issue a serializing insn afterwards as well,
> + * unless this is for live-patching.
>   */
>  static void init_or_livepatch noinline
>  text_poke(void *addr, const void *opcode, size_t len)
>  {
>      memcpy(addr, opcode, len);
> +    if ( system_state < SYS_STATE_active )
> +        asm volatile ( "mov %%rax, %%cr2" ::: "memory" );
>  }

This hunk wants pulling out separately.  It's not really related to
memcpy(), and probably ought to be backported.

Architecturally, both the APM and SDM say you're ok doing nothing on
64bit capable CPUs.

However, there are errata, and at least one recent AMD CPU needs
serialisation for self modifying code.  (Not sure if the rev guide has
been updated yet, and I can't remember offhand which CPU it is.)

You should also discuss the choice of serialising instruction in a
comment.  Mov to %cr2 is serialising on everything more modern than the
486, and least likely to be intercepted under virt (== most performant).

You also need to explain that we only do true SMC during boot.  After
boot for livepatch, it's prior to addr going live.

Finally, you're loading rubble into %cr2.  It's not even reliably 'addr'
because of the transformations the compiler is permitted to make on
memcpy().  I really think you should be reliably feeding in 0.  We're
doing self-modifying code here with serialisation; an extra xor won't be
measurable.

~Andrew

P.S. We should drop the noinline.  That's only applicable to the P5(?)
and earlier where you had to use branches to flush the prefetch queue. 
It's irrelevant on 64bit capable CPUs.

