Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DEA867E3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 23:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947987.1345532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Lb3-0007Gm-1V; Fri, 11 Apr 2025 21:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947987.1345532; Fri, 11 Apr 2025 21:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Lb2-0007F0-UN; Fri, 11 Apr 2025 21:07:32 +0000
Received: by outflank-mailman (input) for mailman id 947987;
 Fri, 11 Apr 2025 21:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3Lb0-0007Er-SJ
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 21:07:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa73b4c7-1718-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 23:07:30 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso2041990f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 14:07:30 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20625ea4sm98795885e9.12.2025.04.11.14.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 14:07:28 -0700 (PDT)
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
X-Inumbo-ID: fa73b4c7-1718-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744405649; x=1745010449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cUPyODaUxgH7llNCICZGqe2RmVtJu2Rctix1ZWSRZwA=;
        b=fM6ec9PqvvWu8zEAE5UOTWAAwL3yxC00x9kc3acJ8EJDYZp2XeXw0GX53Nr+QTCQde
         nQ21zxw1S3G0iMGV0Q2x0JUQAcP6pNgUrDWcQVN7S/7TQC5niTEE6PAnvdtjElP3Ztsz
         qmwmJqD/gjIrA0qwoaArgFcD8/bdPK89wCIYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744405649; x=1745010449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUPyODaUxgH7llNCICZGqe2RmVtJu2Rctix1ZWSRZwA=;
        b=j/Tip0vSeHW647mJ+Thal8eIKvbZJJ3BxnHK2pVy7jaoizCFsyn7B12Ywjjih5P15K
         T33Z0/u2lY9WLZs3A8GlRJe/8h37H7mQ1/00xejJ1WbBcqoazkKi4fEexrrii2/grddM
         pM3QNun+eB3zu7EnbDaVhoVGwMFMOqKSn/cNUF0Iwyuoy6YwykRFJELOo3ALa5eSvJpG
         6paJIZqjelid2OIKOZ9RrLtAC5o4Ga5ghuryzRtVSLRPEbn4icMX2xmDgtpaOIU939l1
         SmS2zWe4p4CzV+hNmy67EbvvQav2Fmh9zNkuRzsEQTcI/b9/+PS97Qaf4qH1td0eNlHg
         gbrw==
X-Forwarded-Encrypted: i=1; AJvYcCWGLLdSW+xrJpnjv5WF8rcdPOLWgKAPQomRUfqiSyxLJzmIPFvZ/3C69f+cz5oIq2CHhVQzgx9lPfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyH+DruyJCOUO0RJv8RytdOwCdC23r61qzM02s1zmgOnW1G94DI
	jdxki3cEKIIf5LflKHReeut2dzIl6uhUqDPiiEUcSN624eIiRaKCu6n9dJQNa8A=
X-Gm-Gg: ASbGnctH7nclTkx8YWgMRpW8AM4nNASGKVRS9zdnInLyZlhT1vLqI2+YD7T54jKByAU
	ysNmVTUsxB+sJOPQ+hu5W77k+3jBNnIA4hcS8lztc6zXdUBgPzUbZUdvCQvVvRUlXCEHS+bDvBN
	BwFwPYdIsxgwi3hIHD7ftUSos2J/krteuKWeMwrgl0EkVJxCPf9QPX8dKFicQ6I2HjV4xkNlZ3P
	E4uCbX66vCOHXQaP17AGKXplFDPZKqzIzevOm04geKmL26JjqH8DIqEMW6Ta+TyvWzy8wlUR0mS
	rj33Kes+xQpOxPslWalOSRh1AJqZRch8xxP4ccQ/b2PJ0dByJ+7YskGbmPZdkzcOv3Biu7LYH/l
	+4KwQPg==
X-Google-Smtp-Source: AGHT+IHKwmOIAc1LmotQ1LqdKfM7CvNr12Nfh2g49tDIQRVmdentMCAu4OpPgjXZhvEoSMsDjvdqLA==
X-Received: by 2002:a5d:5f43:0:b0:391:4282:f60e with SMTP id ffacd0b85a97d-39eaaea8377mr3218436f8f.32.1744405649234;
        Fri, 11 Apr 2025 14:07:29 -0700 (PDT)
Message-ID: <107fe18c-e72c-49b4-8b48-e11817f2cf9b@citrix.com>
Date: Fri, 11 Apr 2025 22:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] CI: write whole etc/issue for domU initrd
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <526ec153b1cabc1d5b111be27ded8d0d4da5178a.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <526ec153b1cabc1d5b111be27ded8d0d4da5178a.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 9:32 pm, Marek Marczykowski-Górecki wrote:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 861e302d845b..dd88a1398f2b 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -182,7 +182,10 @@ ${domU_check}
>  " > etc/local.d/xen.start
>      chmod +x etc/local.d/xen.start
>      echo "rc_verbose=yes" >> etc/rc.conf
> -    sed -i -e 's/^Welcome/domU \0/' etc/issue
> +    echo "domU Welcome to Alpine Linux 3.18

This 3.18 is going to go stale shortly.

Because of LOG_MSG="Welcome to Alpine Linux", the version doesn't matter.

Alpine does have /etc/os-release, but busybox's getty doesn't translate
\S. 
https://github.com/brgl/busybox/blob/abbf17abccbf832365d9acf1c280369ba7d5f8b2/libbb/login.c#L84-L86

I'd suggest just dropping the 3.18.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

