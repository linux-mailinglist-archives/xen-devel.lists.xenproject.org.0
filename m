Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282EB15363
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 21:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062980.1428732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugptW-0003Dg-29; Tue, 29 Jul 2025 19:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062980.1428732; Tue, 29 Jul 2025 19:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugptV-0003Bo-VO; Tue, 29 Jul 2025 19:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1062980;
 Tue, 29 Jul 2025 19:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugptU-0003Bi-Bn
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 19:21:48 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b376ea-6cb1-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 21:21:46 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so55145075e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 12:21:46 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589314959bsm3529015e9.1.2025.07.29.12.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 12:21:45 -0700 (PDT)
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
X-Inumbo-ID: 44b376ea-6cb1-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753816906; x=1754421706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rjPnBX0mqKv4Rtt9IzA538Q0YtDQQ9x3ilX/H+q88rg=;
        b=KZYnj58Sz0wYNwUgEOTqewsKZbCo8t5lUh/7yG99+ijdhL4UVR43ZnaYCCBu4NJ2SV
         duHWQ3OEEYJRgO8UwWLuRschk0zhN2ofaip85yHu6WezNXgkgfI0S8NSs1kqhDbDKwVC
         cxoxCRPVCDkuTXkjOq2Q/ez8+X8jlgTP5f8vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753816906; x=1754421706;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjPnBX0mqKv4Rtt9IzA538Q0YtDQQ9x3ilX/H+q88rg=;
        b=QwGKrajXr6Qm5nsZPbhrNOGNdQLL3CgDDm53KLyeIUmBmL1APCs2hFyXjzUh9dcY3+
         bGoQPmHVLcYRbVHGa935QgqIwZ63gHTwzexeJlWnRTYPn7++eyhBg8KpfeYqgadwemNl
         iulRbrNgpPVCQiNMc4csn9SZYbohW//TbK94bjHgqLEeBfo9vsZZ0PEVdlLYOZfbwz+H
         kaDxPz737+/ZZ/cx/CH61Vw//B2aycLR3VFn7iTX847dGZJG+QFwvqVN/j7K8qYrFhKK
         PAAxjbHOFopSSa+1IINoCY3xpvZlpNlM13oIbnzBcZQuHJaUPGUwk7fox5wZldXPPE1d
         6F1A==
X-Forwarded-Encrypted: i=1; AJvYcCWmLGFZhRd4GCoJk/PhIWmz17xYQZ8ej0obvKr0JbFmRQg79p27To4ccfVkyv+XH3AnSbuG0X0eRwc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnLJhAcSqtn8K4i8YB3KeyBPu0jcIUMWaBu4bfr7ODO4G3DBqF
	0izSiNpNcco+sIr0dDPIgIonTWu9RCae4Z30FWwk8FiUYQnqdewFfxxRddkYGz+YkMI=
X-Gm-Gg: ASbGnctGU/JQtPTZe9OQmSTStoZUDq0p257r+ZJbAI7+Z88GWPccTuyprR2m1EzgruT
	NwRcZqq6oHtrpsY021fjw0Ztx/PU5ZDRQLOFuR3cc/VNaxbUk5MnOk4VhoZAljvKLLq4QFtezEO
	8Qilfy+bolbuzfgK9ZkLXAcKGzOcAhP0/pUxpyYR9o/Jp+Osy+dg1r4ILnB/4jwzZNwlmXHsorw
	3hcjOxKwlSTmC5fQ5X62oZ0649b7tEt0OQjTJtGoZxxqQqpf2f4zFQCoFVbZ/5i8Kuolw3EH/nA
	orNEKf1ZWtNE2GIuCtxLca0SOvEXIItsiiNKZeojtt5fg5nDZPE8OqkESOcq8SYRRmHHBSAWSSW
	wciZq71BuftHJGOM46OqCsSMkXQCmV4mzzpAWZ0uUzS+etS+3cttvWioaDNGIsFSMeQwn
X-Google-Smtp-Source: AGHT+IG5BHy82sXBqdIQPecrs6mmdL039mrCuU/Zvzc4cOm9Iaaov36KJ/0c2RjzhFnylBGp5pVTog==
X-Received: by 2002:a05:6000:2403:b0:3b7:8ae9:f032 with SMTP id ffacd0b85a97d-3b7950286bcmr584508f8f.30.1753816906091;
        Tue, 29 Jul 2025 12:21:46 -0700 (PDT)
Message-ID: <dfd09f68-1d2a-42b7-ba8f-c1f54c6861ce@citrix.com>
Date: Tue, 29 Jul 2025 20:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-2-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250729110146.10580-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2025 12:01 pm, Juergen Gross wrote:
> diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
> index 77e0d377c5..f2c8b92d07 100644
> --- a/tools/xenstored/lu.c
> +++ b/tools/xenstored/lu.c
> @@ -27,9 +27,11 @@ struct live_update *lu_status;
>  
>  struct lu_dump_state {
>  	void *buf;
> +	unsigned int buf_size;
>  	unsigned int size;
> -	int fd;
> +	unsigned int offset;
>  	char *filename;
> +	FILE *fp;

I know there's already one unsigned int size here, but life is too short
to not use size_t from the get-go.

~Andrew

