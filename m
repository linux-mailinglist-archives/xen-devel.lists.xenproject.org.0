Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56BAD334C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 12:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010656.1388808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvvb-0000Ly-8e; Tue, 10 Jun 2025 10:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010656.1388808; Tue, 10 Jun 2025 10:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvvb-0000KS-4i; Tue, 10 Jun 2025 10:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1010656;
 Tue, 10 Jun 2025 10:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC6Z=YZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uOvvZ-0000KF-Gc
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 10:09:57 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ebde172-45e3-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 12:09:55 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2030219f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 03:09:55 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244d10asm12053875f8f.67.2025.06.10.03.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 03:09:54 -0700 (PDT)
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
X-Inumbo-ID: 0ebde172-45e3-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749550195; x=1750154995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1u6iuOa6M6QPWsueTr5oZj/pv/UfFtzP76b/eOBfaXw=;
        b=Afb6r3gGEgh9q7IkMt6VfXXHm07P1SNfHudxylRHR5UWzgp5373AmDRm9DlbnK0gFs
         kZS1j8rSCqkN1WiXvfYey6PKjFkShpXeqaKwxvlWVzP1RnDRnbNCFs6bMrKGSrJmdDxK
         zJ64UqzspLwOC4v954zaXRZmnNZinyAtGiCms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550195; x=1750154995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1u6iuOa6M6QPWsueTr5oZj/pv/UfFtzP76b/eOBfaXw=;
        b=GR0pvfMrsAgk2OL3gx1Iu+UI6UOKM1RNT8c/7Hyf9KqMHwURT5JRs0xYuqk+rsnbf4
         g6ABhnus8taMbB7Yolrz98rfTO7UbfgBDGGCe3WN4OfPYx3zM5IC220z6wc4k1JC1vrO
         ES+67JxEZKqBKRryG0HimBwKC+c/o2Em4z1wfQc+risPh4z+a/fOb1hLeCNymdGiQu0g
         JTdLqgNgwruBsRFhTZhDsYTdzdyAup8frtAI1gReeKWANRbQP4t5eTZj1L03csUJ8t49
         OZt/x0qB+JPaUGLgGRLL9ob/32EptZziR0cbmg3IptDU67RExuYcTVEQukRYohHuWm4l
         WFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpgTfqSqVBFIFkL+Ns+wSYqZ0kbeBi9qapdeS7V9jCE6IlD2D6m11ZJ2b0imp/X8Kgvu9ToZVUaBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgBr1lZMXJB604riAH9hCBlysTyU9BQGUE5dnm6nc375e3t562
	1bFs6ArNZSCS6MKtiBqY53wVdX7s/i1IMb2veriNAJx6Q68Ba5o3EJxnPsMYtleOFxE=
X-Gm-Gg: ASbGncsElfuQ4dUIisJkXn/S9VnNWvQN7pEvqYDnc8IGX7ziMuUc1GAYg8bEdPB+sRf
	p96xXVv3liAtj52EXJlZ3au/EEZojM+OKcH35GwptxY+L9y0xzGf4gUEBhSDBKtEn6wSlJNQrI9
	Mec3HinjoyphzORwMnEOlFR2iO87nmrXOD8u+EhCb5tR1QR1DIqHhjJuOppN3gnFdgJtFvO31yP
	F7bTf1j8mUpXPGwuavMbjqXVm+8uSe5YFR7OHLxpmr1beG7mi7WfdeJFAwubqQgy3tBL0Spow0O
	zBjU1DQfI2YuGyvj2gQhfkCD70Jsz5HgpAaSnUE/rZ5Dvyz2MApSXM4XqewOTDGgicAPJZGpnnE
	cfyx8L0KzQg==
X-Google-Smtp-Source: AGHT+IEFpyIVHpA67iWh1FOCxj8cE3D7laDEIJNZ1L6vKk9JmjsUCJpIzVwnnnN7PyRG9C3hbypdQw==
X-Received: by 2002:a05:6000:24c7:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a531ced4d6mr12908891f8f.56.1749550195065;
        Tue, 10 Jun 2025 03:09:55 -0700 (PDT)
Message-ID: <3a71f308-2398-4fa1-96d7-d4fe13052c20@citrix.com>
Date: Tue, 10 Jun 2025 11:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] helpers: init-dom0less: Drop libxenevtchn from LDLIBS
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250610093326.114529-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250610093326.114529-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2025 10:33 am, Michal Orzel wrote:
> It hasn't been used since the introduction of the script. Also drop
> relevant CFLAGS and header inclusion.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

