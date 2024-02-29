Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64586CE5B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687269.1070469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfizj-0004Ds-4R; Thu, 29 Feb 2024 16:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687269.1070469; Thu, 29 Feb 2024 16:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfizj-0004BR-1g; Thu, 29 Feb 2024 16:10:51 +0000
Received: by outflank-mailman (input) for mailman id 687269;
 Thu, 29 Feb 2024 16:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfizh-0004BF-2K
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:10:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1913589a-d71d-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:10:47 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso165666666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:10:47 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gs41-20020a1709072d2900b00a3d9e6e9983sm824860ejc.174.2024.02.29.08.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:10:45 -0800 (PST)
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
X-Inumbo-ID: 1913589a-d71d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709223046; x=1709827846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3Z+PfadN5bd277EOL7z+3fzaDA/n/PXl/UtTOHkuNY=;
        b=BUHE4YTnJtIoRQeurtDjQ1MskyVzqsMPI8oPV3MNHw+OCmKdGNojzZppoTH2pqNq+o
         obsmaMg2lQGaF6Xet19h6AIsXXfQ06bhMcIMWEX84D1eiKMOiWsw3g2itjxiJKyiuv8J
         o8WPeaQyFrUmJp5vuWYpGE+z7JCeiaRKYV1TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709223046; x=1709827846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3Z+PfadN5bd277EOL7z+3fzaDA/n/PXl/UtTOHkuNY=;
        b=NFKjvDA6cNnxdVx9mJGbvliVdGOWEhaO9zWmqntvNTANgnE8l6MUqK0rgAcKBa/ihZ
         F9vv5sfNEnsfomzC2UwbVjrZlOPNHqoLzVBHRuCNzNsroswCd+vDCaxVw1NUl1qiqpkt
         v7ovsY8fRp1qdVM3cH//CLKaZqFjhFGc/jnfflMyRb37TNRj3jb+3ZvRG4n9OJBef+ta
         fXDGwToTfHjvU7xXLyR/OWOJZ3aP10sLU1Ie1KzCgfgM/2HQgS64YH6dNWxFHunN1Ovv
         u6Lnx5S2kiBx6+v4RR9TXQd7equ8GDqbX7UJr5dm2E0sNAmBmtUgHviN9daEcRc8q4Jr
         /hHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDlqISR8jV/vhTzosUEiBCMHO8OEwsinx42md7NnNZCIKe+M965p8xPriw3Bhe5H8wwFAd1Yr5Onw02Ytmt4jIT7N7JgkuOwDSgpLn1Io=
X-Gm-Message-State: AOJu0YzeNeL9p652mIQpiUVaroEusrT8WE5v1H9g8yDIUw0eD5B9T7Xy
	VW5S8O5nHWOOZY4x0ya5N5gpDPj6Ic4oNC9z1phy3FtFc/47M/PDQzi0TbgnsO4=
X-Google-Smtp-Source: AGHT+IFH9JfVmsYdZH7GCC/a9MqcXTvC7ub7/fVF7nkmLYFyEeFPiKHPdOaFUgKqAfgrhmjT5tznTw==
X-Received: by 2002:a17:906:397:b0:a3e:792f:3955 with SMTP id b23-20020a170906039700b00a3e792f3955mr1729741eja.62.1709223046479;
        Thu, 29 Feb 2024 08:10:46 -0800 (PST)
Message-ID: <b844e28f-a53b-49c0-b4b9-297367546bd3@citrix.com>
Date: Thu, 29 Feb 2024 16:10:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/10] xen/include: address violations of MISRA C Rule
 20.7
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/02/2024 3:27 pm, Nicola Vetrini wrote:
> diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
> index c25dc0f6c2a9..b7e70289737b 100644
> --- a/xen/include/xen/kconfig.h
> +++ b/xen/include/xen/kconfig.h
> @@ -25,7 +25,7 @@
>  #define __ARG_PLACEHOLDER_1 0,
>  #define config_enabled(cfg) _config_enabled(cfg)
>  #define _config_enabled(value) __config_enabled(__ARG_PLACEHOLDER_##value)
> -#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 1, 0)
> +#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk (1), (0))
>  #define ___config_enabled(__ignored, val, ...) val

This one hunk I suggest we deviate rather than adjust.  You've subtly
broken it, and it's extreme preprocessor magic in the first place to
turn an absent symbol into a 0.

~Andrew

