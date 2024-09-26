Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958698724A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 13:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805359.1216435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmIB-0004H9-Kx; Thu, 26 Sep 2024 11:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805359.1216435; Thu, 26 Sep 2024 11:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmIB-0004Ej-IN; Thu, 26 Sep 2024 11:04:15 +0000
Received: by outflank-mailman (input) for mailman id 805359;
 Thu, 26 Sep 2024 11:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvAu=QY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stmI9-0004EY-Md
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 11:04:13 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f483302-7bf7-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 13:04:11 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c718bb04a3so949498a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 04:04:11 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930caf5bsm334702766b.122.2024.09.26.04.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 04:04:09 -0700 (PDT)
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
X-Inumbo-ID: 0f483302-7bf7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727348651; x=1727953451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iuEOkMz1BkCkG7DzkfVUByAm+RF+Z3Mu3yaOKSLHU5c=;
        b=IUhK9CSHtGVCPprgS66TinwaknQL9/1DAyQttvm1L4YE+wQelaKkzMlsaQD/mdUiA8
         5ulnXCAH0r2RokxEbqUTwOc5DIeXaWlUHWOoHmS8NUCKO1mYEJYliawxYX9NOMeMhOWS
         +5AQpn40Wa7QS5MS9366d+xTKiVkJOMnqMTd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727348651; x=1727953451;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuEOkMz1BkCkG7DzkfVUByAm+RF+Z3Mu3yaOKSLHU5c=;
        b=H3aMuex+b2pY1eCe6zJ/HuOcjCrgIMG3Rkv86aroGdajMn19BuPaPSHFwrBQH8S3hr
         23U4DENyNYQ1xXCse671OYKNU+eosRngNDI50tm61Ebe/d4g7ccKPQ4Wr/Ofl9En2+lB
         6aH9wZckubz8FdCwhMCrZyGNbHTBJeDAmNxsfHmD1Vd4yGsrUwiDm08zm9S+aQ6W3D4y
         mOUhcpczNRU7oDJZ0+Z9aPOldJUClJ4AuU0mi+4+FIBet9pGNnoT1BTkCQs0T/TtRECc
         Q3agTocbnYaOorlxb7ZxyzeskaCzCesM09ZJi/QTPP8RdddaOAN3hKjyRzAJMIQXVrmx
         VilA==
X-Forwarded-Encrypted: i=1; AJvYcCXNQlXuHAReal6LOGqf//9iZxHZ/yEr4vaPQZ3sFlVCepNJrw2IgjdD/0JvnL6mHaBDOXX5vCwX21o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzH84NyjDzFFTXfdpeu3UC8oyQ93zGFCgzXa2uERBy3f/FQT7qh
	uP//D2vWeUx+K+vStCR1oVJrQC9VJK342yYCvzy5AmkBKpFWLJlSnly3xmWQsUU=
X-Google-Smtp-Source: AGHT+IFUVRA8I6Ldlwxnk25/JsZh/aq4+qOA8XPhISve/6teXZ/JlPJ+2oj+wdriCabPCae/d41DYw==
X-Received: by 2002:a17:907:9487:b0:a8d:caa:7fee with SMTP id a640c23a62f3a-a93a033804emr647560666b.7.1727348651041;
        Thu, 26 Sep 2024 04:04:11 -0700 (PDT)
Message-ID: <4d9da48c-00ba-476d-8915-96ed765cdfbe@citrix.com>
Date: Thu, 26 Sep 2024 12:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/livepatch: drop load_addr Elf section field
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20240926101431.97444-1-roger.pau@citrix.com>
 <20240926101431.97444-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240926101431.97444-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/09/2024 11:14 am, Roger Pau Monne wrote:
> The Elf loading logic will initially use the `data` section field to stash a
> pointer to the temporary loaded data (from the buffer allocated in
> livepatch_upload(), which is later relocated and the new pointer stashed in
> `load_addr`.
>
> Remove this dual field usage and use an `addr` uniformly.  Initially data will
> point to the temporary buffer, until relocation happens, at which point the
> pointer will be updated to the relocated address.
>
> This avoids leaking a dangling pointer in the `data` field once the temporary
> buffer is freed by livepatch_upload().
>
> Note the `addr` field cannot retain the const attribute from the previous
> `data`field, as there's logic that performs manipulations against the loaded
> sections, like applying relocations or sorting the exception table.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index df41dcce970a..7e6bf58f4408 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -371,18 +371,21 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
>  
>              ASSERT(offset[i] != UINT_MAX);
>  
> -            elf->sec[i].load_addr = buf + offset[i];
> +            buf += offset[i];
>  
>              /* Don't copy NOBITS - such as BSS. */
>              if ( elf->sec[i].sec->sh_type != SHT_NOBITS )
>              {
> -                memcpy(elf->sec[i].load_addr, elf->sec[i].data,
> +                memcpy(buf, elf->sec[i].addr,
>                         elf->sec[i].sec->sh_size);
>                  dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Loaded %s at %p\n",
> -                        elf->name, elf->sec[i].name, elf->sec[i].load_addr);
> +                        elf->name, elf->sec[i].name, buf);
>              }
>              else
> -                memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
> +                memset(buf, 0, elf->sec[i].sec->sh_size);
> +
> +            /* Replace the temporary buffer with the relocated one. */
> +            elf->sec[i].addr = buf;

I'd suggest /* Update sec[] to refer to its final location. */

Replace is technically the memcpy() above, and "relocate" means
something else in ELF terms.

Can fix on commit.

