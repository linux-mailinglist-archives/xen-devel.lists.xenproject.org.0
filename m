Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5999DA67458
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 13:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919063.1323607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWRr-0000oL-HQ; Tue, 18 Mar 2025 12:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919063.1323607; Tue, 18 Mar 2025 12:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWRr-0000lp-EO; Tue, 18 Mar 2025 12:53:35 +0000
Received: by outflank-mailman (input) for mailman id 919063;
 Tue, 18 Mar 2025 12:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuWRp-0000lh-J5
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 12:53:33 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff2368a5-03f7-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 13:53:32 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-394780e98easo3607071f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 05:53:32 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbfa90sm133131095e9.16.2025.03.18.05.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 05:53:31 -0700 (PDT)
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
X-Inumbo-ID: ff2368a5-03f7-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742302411; x=1742907211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5akHyPQzgTDjrQKsXbOWl735Gs1auaE7L6wgWd8mINo=;
        b=keqqaMPYrNBGOLnBPokR1k9gRbwIFysoi22pBojNsWMar+j5ioQQJyl2AIVP/veBWr
         /L5CW0RvDjs2H7+7O7lGY374ypWhcRuqie9v+0Unxz2grmzrVv7fSl/Cc3zRWfdgy3l3
         QVdlJ5x0S2+OalHR7TN6Zyo9zbAX7V0yDd+ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742302411; x=1742907211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5akHyPQzgTDjrQKsXbOWl735Gs1auaE7L6wgWd8mINo=;
        b=H69vYNbgYNqykcFyfyDdSjLRUUsNPMd9AJm4sevVJgv+hL6iR/RKtEXEo0/f6OnEZQ
         zID+uKv/XTzoEdnE8n8BQNjODEyrjlUqIHdAtpJ1EAxjWhIlwax3WAO+n/qolwDYOzPK
         R0Z3ADjB0QkfTiLJ0YjIMwKD7a/fEa7LLH0JgISOHgTRNHZ/jF2g2RC3uYkHzKgcpJmd
         Pg8bdiLEVOBlfthB4HyKCE4ibteIfV/p4m0tcFKIuaDxnvxx43V2XA66IlvovBVcP84t
         oQx3fTE3PGaslWyXwGGjBFnmiVUB8/aNzl/9SzVgowdD/42WLyXgy7pv+W1Ku8lPXhp5
         H6aw==
X-Forwarded-Encrypted: i=1; AJvYcCW4out1Y9k4EaOJuGEf4Bl96L3XluQDWAfwPV6UgQFxhGua0j+ragrWPlp32Xokp57GvCFbcC08FKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt2zCPO44bXV9cvate+vQPC6U1AVM2N3sOz55Zq87FfX+HQza6
	h2d+VsKXBFxWcREyd1GSPDSwjl4JCJop2sP413LSEEFbWXNRE4qknv9xjCn3zoM=
X-Gm-Gg: ASbGncsq8R0gmwpsVsVZZEFbSEcAZDJY+H9OL6BFSm1XpijsYw7MI75MMtr+9tIFUJ/
	CdrYwPrjHIAH7x99gGJSUsmkymz4ij7QlenMwtgmOOAzjtgmQZVvv0TpMPeM7cSXASilVJ0Hfxj
	ciekzTBs/69rxSo0g6M7CnNAhslhZ+3spFVrfAYgEYtYESYTEVnuwdDsUWujDnJATCXYa+pdUJn
	pV6t6cQN4m36SdSdKXxJ9aZ8e74GCNXPzigwxpi37x6a1harawvF4Szv0Jg3hQwwooa9ZmeYvPx
	2ApwBXY2gniXLQGQfk12xFgW2dHI+zMiYXF60qdaQf9tHC99U0w4ZpsL7fm0aEzkEk9RiIWw64T
	u+T9N+2bd
X-Google-Smtp-Source: AGHT+IGm3TQiDNBMvzXgKre6dpwoi7na05G5zzmIn+qL+zEsWb2/UXkil3NHlU+lbGgtWgBnQ4SYmQ==
X-Received: by 2002:a05:6000:1548:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-3996b49999bmr3744546f8f.40.1742302411472;
        Tue, 18 Mar 2025 05:53:31 -0700 (PDT)
Message-ID: <1871a0ff-5766-4707-8791-c20279c12fd9@citrix.com>
Date: Tue, 18 Mar 2025 12:53:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/shadow: fix UB pointer arithmetic in
 sh_mfn_is_a_page_table()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318091904.52903-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> UBSAN complains with:
>
> UBSAN: Undefined behaviour in arch/x86/mm/shadow/private.h:515:30
> pointer operation overflowed ffff82e000000000 to ffff82dfffffffe0
> [...]
> Xen call trace:
>    [<ffff82d040303882>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
>    [<ffff82d040304cc3>] F lib/xxhash64.c#__ubsan_handle_pointer_overflow+0xcb/0x100
>    [<ffff82d040471c5d>] F arch/x86/mm/shadow/guest_2.c#sh_page_fault__guest_2+0x1e350
>    [<ffff82d0403b216b>] F lib/xxhash64.c#svm_vmexit_handler+0xdf3/0x2450
>    [<ffff82d0402049c0>] F lib/xxhash64.c#svm_stgi_label+0x5/0x15

Something is definitely wonky in this backtrace.

>
> Fix by moving the call to mfn_to_page() after the check of whether the
> passed gmfn is valid.  This avoid the call to mfn_to_page() with an
> INVALID_MFN parameter.
>
> While there make the page local variable const, it's not modified by the
> function.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Whatever is wonky in the backtrace isn't related to this patch, so
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but the backtrace
does want fixing.

