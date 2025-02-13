Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED615A3439C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887766.1297220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaau-0006bj-T0; Thu, 13 Feb 2025 14:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887766.1297220; Thu, 13 Feb 2025 14:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaau-0006Zw-QP; Thu, 13 Feb 2025 14:53:36 +0000
Received: by outflank-mailman (input) for mailman id 887766;
 Thu, 13 Feb 2025 14:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiaat-0006Zq-LY
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:53:35 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bf28908-ea1a-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 15:53:33 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38dc6d55ebaso1396199f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:53:33 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395aef82edsm47520605e9.38.2025.02.13.06.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:53:32 -0800 (PST)
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
X-Inumbo-ID: 4bf28908-ea1a-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739458413; x=1740063213; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jTlOB+moc8I9Zqyx+dKBCE7xnrACQIl41klTAVfCukU=;
        b=ELZNK5BNNZdvaoUbp9ddr90iS1JBy4N/ZDrpOHoKzJQU8oFwtWy0FnS65P/4YjsOoY
         3RjhXk92cvXW3H27GBFEd8F/AYqw/pyESo/MTm6TstAhG09eK7oSVBV0yi9sPcYc3at/
         po1gPRyMXl674Cn+Nio5uvPmA/Vr7Aa3r0HGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739458413; x=1740063213;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTlOB+moc8I9Zqyx+dKBCE7xnrACQIl41klTAVfCukU=;
        b=Bz5JOuW2WM+8wlaiDrg6RwRU5KhpG0xt2BTmnYPO4EDIXTzPHf/kAj5XihHg174aGu
         4jf9D3TMPKL2z5ctEtvbNaNb1WWPuwR84XjY+HHZX87REciJ7SkvkLTd/hk3j9XNmtO0
         QjSsjmpLjE3gJwn8T6vERYs1es3IWuDwSAOa+ppqaFuG+sSH98g1yLfjlKhbqiK0wc9N
         eBaUtPTF+KrxP4ZYsWgRO/j4TVB68CBWy4RWaUEdG+V0Va1LGKLrJfkEgEs6dMbisesC
         n1jwhwP+3oPK0z00/Y5d45ui1vK5sJDttGxY1/FYcoeg3nWPCoe1HewKL10TLr3DrFKa
         oYsA==
X-Forwarded-Encrypted: i=1; AJvYcCUkmyrXyUgxN0M0F63u1OebpDEfNDZk5NsG2bqaOaX6t5szkRFc2zD5+nTe4PkYVLuFWnO7RjeqWgk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx60ZTpcXaTyIfLc54+BU2tlYhGdTwx9oNi1qtaqwHUFl2Up+Yj
	xUAuxZj/zrvGJpEJLidkJCqvSETEMetjUSbPmbQpxMQlRQreO9vRkp98STEEnNw=
X-Gm-Gg: ASbGncscZYm7i+cqQGjz0KRBr4P/vWLyeNPv2m16PUhHs+5/oV5mku1FBlOFuULYdK5
	bqY2V3u8wSJJ4zHLYGq8a9MkrRGLA2EAQYEXusxUM5gRMAQBsLHagvZIP3DlNj4VWZjFsIs0wrT
	z/kbXXShct+gjGNpZoo0O4EdpdUOJD0XG2dGkbQEiWU6qnxC3XmTlZ0TQRtHTkcgQFvEgodkCal
	4wqFqRwUARwN+ovqkJigyj7okn5VY7IQqjzWHmfWdCEEVEdquyeIo8ESnR6sZj8U54x/b6cFhLd
	ozlVgK9bqnY6fjeYUb98sAZNJA==
X-Google-Smtp-Source: AGHT+IEUiXuOIjsoerYbAhxUwNDGxazLzyxrb+cmRAx4SJpQvpbzFif/3MqH5OuTs8AZTmWXua004g==
X-Received: by 2002:a05:6000:4024:b0:38d:afc8:954e with SMTP id ffacd0b85a97d-38f24cfa3dbmr3713162f8f.11.1739458413062;
        Thu, 13 Feb 2025 06:53:33 -0800 (PST)
Message-ID: <6b174729-1c74-4258-9107-6099ade97e15@citrix.com>
Date: Thu, 13 Feb 2025 14:53:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/02/2025 2:22 pm, Jan Beulich wrote:
> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
> left shifting negative values is UB. Use an unsigned intermediate type,
> reducing the impact to implementation defined behavior (for the
> unsigned->signed conversion).
>
> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric 'l'
> tag.
>
> No difference in generated code, at least on x86.
>
> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions) radix_tree_int_to_ptr()")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

