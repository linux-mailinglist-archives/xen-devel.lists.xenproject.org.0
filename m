Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12892AD34E1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 13:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010693.1388867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOx6E-0004Gq-KR; Tue, 10 Jun 2025 11:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010693.1388867; Tue, 10 Jun 2025 11:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOx6E-0004FL-Hj; Tue, 10 Jun 2025 11:25:02 +0000
Received: by outflank-mailman (input) for mailman id 1010693;
 Tue, 10 Jun 2025 11:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC6Z=YZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uOx6D-0004FD-8U
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 11:25:01 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aded99d-45ed-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 13:24:58 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so41412355e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 04:24:58 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730b9b33sm134892195e9.26.2025.06.10.04.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 04:24:57 -0700 (PDT)
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
X-Inumbo-ID: 8aded99d-45ed-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749554698; x=1750159498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uyQkh1DskgYGzW/KVChHLWEBLbwJXzSm7ZrBZmN9n8o=;
        b=a/0MjQEIeZ0GQoYx/ScRY0oFeyPE3a658478mBL3WmlmgsNQbsvD1O/lG4zBzga58U
         AqioN0qks6sVtrcwV9J2EEsnFgxGErWGQ9xRuiYKJWtFueLCkcAMtGU/cWxuMhIF/r8H
         Wx+mQ5U1K7hLDE0L8OocOuIZI1EVWp8nwxlgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554698; x=1750159498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyQkh1DskgYGzW/KVChHLWEBLbwJXzSm7ZrBZmN9n8o=;
        b=mqdD1sp9wNNLhovT/JUXZHVZusdBOeQncOxM84JZMhV/iN1dKuC1v/kC8WGGbp7Qfw
         504df8CUDKwi1n58vBG9Z+DLDlfmHn4qFkbgVxSKLRD46ij0VR1ddG0INlsvsGPw6ZDr
         v/Ruy0F52erjUvXQve7eFd25RFF2odz+amS1abJ81DdqVLHk1FZyAVX73eSlRT9WI1YR
         BNngsDiV0la4mQpS/oBPEwJKlRS92MZnMjKtwJmAV48pJJHVumtOkGUSOiQ1NNrPYfwJ
         W6KZ6RVYf8+cqf31FRZkxZRRys6qDsWdwy0lg1/2tB75vVe9zx7ZmAhmH/ETd7sudkMq
         3V8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPEFF6z1tEKNJ5lS6ZV6cNDikRxDJR5KoVxiLH30u3VaADzNaOw15MNk55Gh1Fuyc8T0NT6BZiExw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyc8AnPKEFt2iEXa6pg3jGLWjlCYntxE7OiQ/LmGy/vi3zR/39j
	4XGKluglNJS4VsvDLOSK6o1L+pfIGMUz0tV3OZx9SXG70DxYNs/am3m4tji3dZLzKHY=
X-Gm-Gg: ASbGncv0jCkgRObR8z8jmZPYjjK1ZShyZ4zksQNg4DegtuGQFN2/R4iNPkl/o6lI2aF
	0tPDpWshxTkKoLDD6y8EKH+NwlmdkF2tpTJUpNztVKu5NW/9D4jwigs1RUDB16GUJO0xnvqgPsF
	r+9CTeMb8yKgA7jN2C2FOrnY30TeZr0RZa7thzjeyWoyCkRlgulvY/cwdQ8cVX7XrXEyRWpkP+H
	y5Rmpyjotnr/yDlk56mJwEfqgodYtjEISIESbinNF9bNrrubANogi/NL32MRjixTycYbTHU2tG5
	FtqChF5M8UygSuefdeHflAekuL2eKvu7dws0MBNETWNIURAnyq3DC39oqPrDLdMrSokO+kUNSDU
	=
X-Google-Smtp-Source: AGHT+IFP+1FCuHhsLkIuAcxWS5a9gmzUZo1R3okfH/QVzxxhN7UWy0brtEjCF1x0OksvivPjd0gA5Q==
X-Received: by 2002:a05:600c:1f1a:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-4531cfe36dcmr30640865e9.15.1749554698256;
        Tue, 10 Jun 2025 04:24:58 -0700 (PDT)
Message-ID: <7f965335-68d9-4da5-8ce3-db68583db9a2@citrix.com>
Date: Tue, 10 Jun 2025 12:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: group pbuf under console field
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250606194937.2412579-1-dmukhin@ford.com>
 <db9d23ee-9115-45db-b428-104aeaabcb2a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <db9d23ee-9115-45db-b428-104aeaabcb2a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2025 9:10 am, Jan Beulich wrote:
> On 06.06.2025 21:49, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Group all pbuf-related data structures under domain's console field.
> Fine with me in principle, as I was indeed wondering about the lack of
> grouping when the sub-struct was introduced, but ...
>
>> @@ -654,6 +648,12 @@ struct domain
>>  
>>      /* Console settings. */
>>      struct {
>> +        /* hvm_print_line() and guest_console_write() logging. */
>> +#define DOMAIN_PBUF_SIZE 200
>> +        char *pbuf;
>> +        unsigned int pbuf_idx;
>> +        spinlock_t pbuf_lock;
>> +
>>          /* Permission to take ownership of the physical console input. */
>>          bool input_allowed;
>>      } console;
> ... since all uses of the fields need touching anyway, can we perhaps
> think of giving the fields better names? I never understood what the
> 'p' in "pbuf" actually stands for, for example.

I always assumed it was Hungarian notation, so pointer.

As it's namespaced within .console, plain .buf, .idx and .lock names
work fine.

Separately, 200 is a silly and arbitrary number.  Furthermore the
allocation is unconditional, despite the fact that in !VERSBOSE builds,
domUs can't use this facility.  Also, where's the input buffer?

~Andrew

