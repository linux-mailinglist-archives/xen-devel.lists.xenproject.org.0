Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BBFA3BBC3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892614.1301577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhUl-0006FB-U7; Wed, 19 Feb 2025 10:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892614.1301577; Wed, 19 Feb 2025 10:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhUl-0006D7-Qu; Wed, 19 Feb 2025 10:39:59 +0000
Received: by outflank-mailman (input) for mailman id 892614;
 Wed, 19 Feb 2025 10:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkhUk-0006D1-7i
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:39:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da31f970-eead-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 11:39:53 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394a823036so67585255e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:39:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4399fd24f9esm2464185e9.12.2025.02.19.02.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:39:52 -0800 (PST)
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
X-Inumbo-ID: da31f970-eead-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739961592; x=1740566392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FNKPmFoPdNz1VheHcLtFXkIrwLFv/NZdO0Le0H9Wf9s=;
        b=aFS+loyQWQ2kzRmrYIglY1oFdQNKXJDflz1RzGybAvtG+PUw2o9mM0WHaHmRNPNwAt
         GD7oEiMPcTyx1UxDH3IhwdmKB6IQ1KnIR23EhVMdV7pbR4U5vzr/qGsTISTrcyahlTto
         I+euRjBUkHJsJGlG+QVxJZaKy40MdWDJR/vJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961592; x=1740566392;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNKPmFoPdNz1VheHcLtFXkIrwLFv/NZdO0Le0H9Wf9s=;
        b=kzQVchG0YB+71QLkhsA72/GPbtjVgGGV43T9zXhPVlaXFoTxp/fftK+zfoEhoqLEo5
         7EPjhtXyqpRS/9xHSCzo6JVBlbLufzdJtkT+gntt2kK3G+XalRNw9dbwxV0CJaTYueDL
         8Tq08be7/AGE19XMY8h352+r85Kyasv4J+E1SmYGWP20/hOZiY0i1lVf8azs7KT3tsAX
         p5hvsvb1OUZCF4CsW/IxqtCI8pmvKoG1HTptMpBnRleICS4uEfgk1hk+QUmsKy8gq3+H
         miFMuZ9cGYz7J9O373TUVJMu1nkDyEd9IWr8tSoF1hyTThagkNEvew6osrFbdidWq8V1
         Ow0A==
X-Forwarded-Encrypted: i=1; AJvYcCVVXa7Pn22IZwxMeV0o+XlzqyYgaz4exZXWtyXswdAAMJ//HA91azJG0vMlqiUScQrXagr+rDx2Opc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYvKBOVbKFr4lnyA+MIqRlPiSg7bnLpKhF/4KGXB9mpUwC8QXb
	wkBQjEtu0H8a2D+yYSt580oXbUqb8Pz9ur40BMfeMch4g5OQ8olVBfcNmacHMIw=
X-Gm-Gg: ASbGnct5Rh3smVzIoTbsfZ7owcLKmhsVLAsHLwuYbLHSN2bpkGh/OfSTaZQ/Mm46bdF
	qkE7zp222bD9rM4pnGd+ChVvoLC6bHS8u1qSFOftcqJpQSjd+eOxNTPW8oBECTmTwAVUJJt44pH
	DfIWUKYYpMpRFYRsxHXtbIi9RbaGLbdv+iSljSHigVIrvaHP0Lyb5jn6Iatm0HE1xVA2LEIKtfm
	SpsTdERCybVtoV61ngOII5yKBVxWYv4j0ceY4XXZCMerL4RTqoJnj7P+YpEqFQ1bPY3Re5HiXpz
	cgDa4tvkCd1xrM+c7mXVseKg2LO/+IrEIylgFAmbIsrQo3annYb++1E=
X-Google-Smtp-Source: AGHT+IFsZqfOKjfjGNqRds8+o4ztj59n5YY+xL2+KW+nzltzC8qA6KuVqI9NUtYtdYk8O5k3Leogdw==
X-Received: by 2002:a05:600c:1d95:b0:439:8829:aa69 with SMTP id 5b1f17b1804b1-4398829abd0mr88404715e9.17.1739961592439;
        Wed, 19 Feb 2025 02:39:52 -0800 (PST)
Message-ID: <93e60969-2331-400e-bd2c-6569dea40269@citrix.com>
Date: Wed, 19 Feb 2025 10:39:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE-telem: drop unnecessary per-CPU field
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <01d5464f-81c3-4b5d-92b6-08d9e22201ef@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <01d5464f-81c3-4b5d-92b6-08d9e22201ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2025 10:01 am, Jan Beulich wrote:
> struct mc_telem_cpu_ctl's processing field is used solely in
> mctelem_process_deferred(), where the local variable can as well be used
> directly when retrieving the head of the list to process. This then also
> eliminates the field holding a dangling pointer once the processing of
> the list finished, in particular when the entry is handed to
> mctelem_dismiss().
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

