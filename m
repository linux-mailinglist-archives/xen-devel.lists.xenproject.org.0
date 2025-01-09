Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB0A07450
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868200.1279741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqS4-0003Lg-6s; Thu, 09 Jan 2025 11:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868200.1279741; Thu, 09 Jan 2025 11:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqS4-0003IX-3v; Thu, 09 Jan 2025 11:11:48 +0000
Received: by outflank-mailman (input) for mailman id 868200;
 Thu, 09 Jan 2025 11:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl7y=UB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVqHg-0003F6-GM
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:01:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 039cb351-ce79-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 12:01:02 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43623f0c574so6149595e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 03:01:02 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e92f7bsm51705095e9.38.2025.01.09.03.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:01:01 -0800 (PST)
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
X-Inumbo-ID: 039cb351-ce79-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736420461; x=1737025261; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGiWpxWM7utRqSJVw4NZRMsiD0kw3rLr7nDPnYu4dFE=;
        b=ETlz9ftuPTtxmv51Uim6SwWlfuyRyxrKHAs52eJHVL42XP302ydN+Xzgb3g4MZUhlk
         gzKcwMN05CH8qzaMh3bNjy69+WmACGygbFdaZNk46cPc3OhFlS3yIB+farl15TUcY9Mh
         zQoq9fOjSG7bsyGu1JiY4yCOs8X5FrD/ifLWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736420461; x=1737025261;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dGiWpxWM7utRqSJVw4NZRMsiD0kw3rLr7nDPnYu4dFE=;
        b=qiNYa5/E4It21oGHG+4yuzOhw2VRAyViLM+6AtbIr0a92pKpVBEtXOKbIXbU29zS7u
         Mngoa69Us31taKhFlS/cOFg/qb0SP+6N0t6wpCN8xS8GyJho1gdKQC1SDSmgWpH75nmu
         Xg5YD6Pi67ZCbFssU8ELUxjvrqezvdhcZBuccy7//IQaMbc+Kw0Owwhs++Ie0NgzWxTJ
         9Bd2gslZhpS1Gyqm5E5seyYn6jDCb48SWA+Pd753Sp1VSLr9TW2b5D4WKjTvZxk3scyc
         P9hM1E8g5muXLwIk23opQGAkWGUnQF7nH/6YY5c8C1uTUdi6zZdayhMLR2jXHg/9TWCL
         NirQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoFY1v37ZqaWL9WuAjBROonTK2Yc1u03CIdgSo9rV6b5dlc+mB99ZG9m0Tt95cYTpo+RkT2zvn6CM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW1STq2nPA94V+SKPrRth6uUHwG/HHh6jB/XeIKN8lF27jJpfL
	nvclgVFNyMEu4zxwZlqwkPIBrTUwON2CEhZSlW/8VJfPYti8HWVUNSHq5GrhWZM=
X-Gm-Gg: ASbGnctd/0QqL/+XUxwR51alCFIuo6p6ysPFcHudWdyRjMm6+ymBO9/8wTZwu+lg7z0
	ENqXWbGSbSAgWBpjEyDwTRunT1ujhVGCtYGnpbA4YP0rC6uAKpP0NSOTxIwqBemE0B+JsIbw/tU
	b5HSVJu2SnNmMnVqo2ZYNYEoG/6CwWQBq8FtbcFOi+aYv9h/RvvioB4//JXTmjyIBiRIeURshsK
	JtaRPGxHT+cqhFHkDwErBPO6oq1ilB9NngwZMew6G7sKbWuCkscPrA3FD7bIqs=
X-Google-Smtp-Source: AGHT+IGybEm3P7KJqje+MTjwyod8X/r+6rWhswzDEuCY/jy8sTmWcc8EMqPHLMz3wyLoGlzbhaEpKw==
X-Received: by 2002:a7b:c8d4:0:b0:434:b9c6:68f7 with SMTP id 5b1f17b1804b1-436e26ddc3cmr49453045e9.26.1736420461416;
        Thu, 09 Jan 2025 03:01:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 11:01:00 +0000
Message-Id: <D6XHOJ01P6HV.2IGS7W4SGN07@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 09/18] x86/mm: simplify create_perdomain_mapping()
 interface
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-10-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-10-roger.pau@citrix.com>

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.=
h
> index 65cd751087dc..0c57442c9593 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -601,8 +601,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUES=
T_HANDLE_PARAM(void) arg);
>  #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))

Shouldn't IS_NIL() and NIL (out of context) be removed too?

Cheers,
Alejandro

