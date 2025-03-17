Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55918A6567D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917246.1322207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCjt-0007nh-HX; Mon, 17 Mar 2025 15:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917246.1322207; Mon, 17 Mar 2025 15:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCjt-0007lI-Dp; Mon, 17 Mar 2025 15:50:53 +0000
Received: by outflank-mailman (input) for mailman id 917246;
 Mon, 17 Mar 2025 15:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rdq/=WE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tuCjr-0007gv-Gk
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:50:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c23df1-0347-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 16:50:50 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so3893433f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:50:50 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb93csm15132825f8f.86.2025.03.17.08.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:50:49 -0700 (PDT)
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
X-Inumbo-ID: 99c23df1-0347-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742226650; x=1742831450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0kvYVh3QIIhVSteww7rz6e6dOUJeoxVvK2zu9yWA2A=;
        b=WGN6wjrEVakV/QGI8Lzhu+QtvE9i8yZ/j7TCLpehlaiHWuXavN1gCezEOiYhb+r8UE
         tQ9JAAzN+1BLvnzW0W911AiqydUXgA/4VARbrk7ebiOhPDO06yX1pJ1d1kYrCYT6b7zV
         a6gHBl0kWwGkVJz1VfMzeRpikFrd4nzCeMACS4VfLFli+SkAQjacSSbM2k4Ie57JoD3Q
         K3oZxtOw1tv/u+PX2XSoLxieQ8yd3jcb4+K0O/te4JqyVhCumFdDGdXr+DmKfTHT6L6T
         094b5q0u5s+mUsD0cx6e4t6xgrpdg3KD38BxCk6c950ENCqnh14m4jgZzkPVaK4vyJDh
         adGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226650; x=1742831450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0kvYVh3QIIhVSteww7rz6e6dOUJeoxVvK2zu9yWA2A=;
        b=gmWAlZm3rh+mkxKKE+qsoMGJ5OkQxjbGSeuD4EXgtyF3WthtYmAzrrQjR1QhvcZtAX
         LOMAtrg7aYhSJ3ueZyQuFC/i9HCYIs7xK7NHnj/Y1BCBzjJivHCsHXb/E3tUF1Skc2rl
         izus1w8TYpkznPrDTbW43QKCGvqdE1Z1Ea2uwGjbbpcw5cjonuAHrigGYFu3DYhedYsq
         GSjXgRzQFSn1iCRECGlNHZO0mNwJUWkbId7WB12Xnc1SsyIPyb8IvCkR9C/bAov9IUse
         qP59Q5BXJX47VVY9KpQWNeJADvozZa9LrGNOm2aiS4az6etBpnaFEgk1PKcW9wRXVg1m
         FA0A==
X-Forwarded-Encrypted: i=1; AJvYcCViSxz3A9n403nlxLveZRCL/pn8YkCpNIt7hLZCyJaosNoPHT3t2BYc7oUDbpZyTcg3DIWUHKJyMQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7A1C1K+wFGb1MFRI7wnqSKFDe67VM3ExSqhyfDxNBPt38ktOf
	cmOAk/0H+S+U9zbJ7ZNDZqzkYafh1PbHhd2ATuILE25TY5VyFYfGjuH9FVzfyek=
X-Gm-Gg: ASbGncsJa4hb9xST+Ud5pfhGbx+WsIkFeB56pciYpkcdtLqjEX6LIlrHv0U4/R/9xQt
	HBLxyURsB2WKn5Dc53lACZClMTwGN5Hl/VWBg1/Fa6KP28t+WkmLOAufmWJ+D1va636clZmnBpQ
	kIYXp/MWrnG94/owrS4NTa5ZRpCoH0n0ay7r13v737/5AcrbJnT4lljhFL89QeWoCGw4JU6HAir
	I5nJc7NEqU1B6mlA6xpnD32sW0HmI8K/3JV1690eRfoP2AGxbTx21PqZR9Co4hpV4j4nZHf5IBT
	1kyQGCC3SD5zKrvI+mt91JPdfdkMuGAFdo3JN/VI62RE+GLttyjuhggccy+KswBUnldrZH5r2d1
	SXE9070nJ6vd7j0bVvfRw
X-Google-Smtp-Source: AGHT+IHEeSmQycdcPRPilEPN46M2KLx0DgnGBUIOfvhqo+t3Qgdzg2qlN331n14zj9svwQlA5J6N9Q==
X-Received: by 2002:a5d:5e0d:0:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-3971d237919mr9793052f8f.12.1742226650139;
        Mon, 17 Mar 2025 08:50:50 -0700 (PDT)
Message-ID: <ad7cdcaf-46d6-460f-8593-a9b74c600784@linaro.org>
Date: Mon, 17 Mar 2025 16:50:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/3/25 18:31, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/ram_addr.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index f5d574261a3..92e8708af76 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -339,7 +339,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
>           }
>       }
>   
> -    xen_hvm_modified_memory(start, length);
> +    if (xen_enabled()) {
> +        xen_hvm_modified_memory(start, length);

Please remove the stub altogether.

> +    }
>   }

