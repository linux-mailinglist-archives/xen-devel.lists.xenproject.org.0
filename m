Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C313091D9E7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751342.1159269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCM2-0006up-C5; Mon, 01 Jul 2024 08:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751342.1159269; Mon, 01 Jul 2024 08:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCM2-0006tG-8B; Mon, 01 Jul 2024 08:25:42 +0000
Received: by outflank-mailman (input) for mailman id 751342;
 Mon, 01 Jul 2024 08:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VC/5=OB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sOCM0-0006R3-L7
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:25:40 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f6cc712-3783-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 10:25:39 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6fe617966fso227516166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:25:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf18c99sm308790966b.2.2024.07.01.01.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:25:38 -0700 (PDT)
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
X-Inumbo-ID: 7f6cc712-3783-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719822338; x=1720427138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2HT4hATmlGuJxaDUc5KV1URVwYIGXkgBvqpIWR1IlU=;
        b=czzzStDKalPFCdbAyXOXHL7rl3rXeETLkVkdG+MSzoe1EJHmHop04gFfv/e6clH8Sd
         E57jb4KfAnZWiucroi4jQt7wt7M9/C8R/XqSy4mCzoAOkD7+XDHTRXD7xCKFOk5m7kjv
         MzYXtR9rCuM5gZuIWaPm/U8Ee+aAwJvOi2f5YjVAsVsng+Q4W4eZiSCHZjW2tEFv3v1j
         eG9IGo4Lzi3OYy2hcDmgRXKqTh40oQ4LaJLQBKaUrQ5VJ2T+A6Q/g0EKPf0NToAbRa2f
         vep8oARz2GHzfswSTM/ptXguxzLVwe+alA6bbZpc0HuRofOg7MtGbligM46ycITS3nTd
         kCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719822338; x=1720427138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2HT4hATmlGuJxaDUc5KV1URVwYIGXkgBvqpIWR1IlU=;
        b=EsgVGz0C7MYJo/0EbCyTS6+KZ6i4lzTHQiyCtqKHXtGfBKiTn19Z3gMrsvH/Uweruz
         N1JlD+HciWj5XnkpbReMbZJvXLlPVyRPseded1iI1eYcCExn8IYEexUliB0Crycd2K1h
         JufhD9D9rp4vW0nBTDn/5T/Q9lraGf9mupLSHtCbTj8fD0mknuRT5X+PnTxi4jMz6ytU
         y+3rrrS7uj8uQ4SbMqIGq1gdlK2SQc6/o6PFxo05alxk7rMjEW1qlrydchdYBud3+a5n
         J3UdRjUdX3sHfozsqGAWTI4ojrrOzKuCw/284hnXxSw+9UvN5Jn3dAf4nZrdqBgc0mxL
         Wsng==
X-Forwarded-Encrypted: i=1; AJvYcCWSeOMoOGGQ4Ii7rEXnvMCRpzjd54SEe4voAdGIcO883vIcBamNCUYHJQiOZMK3ld9byyJrsiWhXQ+8WFH5rW7qjda+YADsm2vAIDrWcGE=
X-Gm-Message-State: AOJu0YydrnpaN7x1V9xZeaTEM3J9G7kfQ9zDO+P3yqyRKoM2ieSmCL36
	BCj+1t0db87jNeCrFkXY/PhNwVRRrKvIOveZSFHQwkx60Oqp6z+MLldmNL3RDnk=
X-Google-Smtp-Source: AGHT+IFNIGavJzId+B0jfQxw7gW2PaPV3S5uawQ3l+IpGLodohtrkmAXLbHIsdTAntg4ZVBTEfEO8Q==
X-Received: by 2002:a17:906:d78a:b0:a6e:ffa2:3cce with SMTP id a640c23a62f3a-a7514498cb1mr267074666b.41.1719822338499;
        Mon, 01 Jul 2024 01:25:38 -0700 (PDT)
Message-ID: <098c5197-bd3e-439a-ae4c-72e05a06a9a7@suse.com>
Date: Mon, 1 Jul 2024 10:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/xen/time: Reduce Xen timer tick
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20240619104015.30477-1-frediano.ziglio@cloud.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240619104015.30477-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.06.24 12:40, Frediano Ziglio wrote:
> Current timer tick is causing some deadline to fail.
> The current high value constant was probably due to an old
> bug in the Xen timer implementation causing errors if the
> deadline was in the future.
> 
> This was fixed in Xen commit:
> 19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future
> 
> Usage of VCPU_SSHOTTMR_future in Linux kernel was removed by:
> c06b6d70feb3 xen/x86: don't lose event interrupts
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


