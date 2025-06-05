Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC26ACEF76
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006786.1386033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9zC-0005ct-Pv; Thu, 05 Jun 2025 12:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006786.1386033; Thu, 05 Jun 2025 12:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9zC-0005Zl-Mw; Thu, 05 Jun 2025 12:46:22 +0000
Received: by outflank-mailman (input) for mailman id 1006786;
 Thu, 05 Jun 2025 12:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uN9zB-0005Zf-Ec
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:46:21 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14664d77-420b-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 14:46:20 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a528243636so520063f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:46:20 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f9924a41sm23785105e9.40.2025.06.05.05.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 05:46:19 -0700 (PDT)
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
X-Inumbo-ID: 14664d77-420b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749127580; x=1749732380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/8E13FMRdY/mBMDbjzwsHdMcmOj2DIxgi8uOFTnlUd4=;
        b=fqQgrSg+it5SR5/7jrgO6vjLrfD3J2kjN99oMya3u+ZZMWhHOJPMww397cI5KRkpOI
         9eVXNu+NOhhRrHEjJU5tOF1ALLG7lkncKEbWZJGGb7+Y5k5rIvJG0dAizPlWB3NqHDWD
         RmiDnYw7c/X4HCjcKIc+dOuecGwpx20jkVXlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127580; x=1749732380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8E13FMRdY/mBMDbjzwsHdMcmOj2DIxgi8uOFTnlUd4=;
        b=p8AGQeZHNEmR1gYg8MmatH9vjWkfOpuaBwwW9+x6Tbz1fr3d0DvUI1ol5p9WklmC45
         696fqKNcvnwft8Qxr9WTDsBE63IL8GoKFy4qFdYtGA+EaWSvlsvkeDVuq8PVG6vVJ9KS
         CJvBAwwLYlddbwKVbO3JJ/QEZesOeSlRcY07Eh5PLTFZY+0VH3ZXpXUjq/L88B98fZmJ
         w1SA9r7+xy4vmewPgQkwZKHWhatjyJeT7Bs+J+/9c91vxoAfhkTzfJHW9u+Yb555y09p
         nU59cCakng7ShedzOkeXTcvvg5KZYZPphKHogKQbs1pneauRNDagmCMhsx9n9L78Sfaf
         r/6w==
X-Forwarded-Encrypted: i=1; AJvYcCUNdFdpW+NRUMJKQzBArM4RuBv2eEmiRzU7O2/LQLu2AdLa0ohWNwbfIxzGWbczsOi2rNyLKQHWHtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO1D6H032jnE+Sq4iYiSPo5AwM8kC+Oo79JFrp6ZszIiWtiZpy
	bwERw9UNXq9YbqywKo11WHuW7CQVTRhNqwYqARLD/aNRJhZZZv1iS5beMBWsDrWIPGI=
X-Gm-Gg: ASbGncv0w4jxXTv+tj0lLTm+BHTMhMV7SkQNC8t62NnXpFUtkSc81+CHMVjRexQ+oS2
	bNdb8PNFvTPLGD7iMpIsi8VDpq9pY5ARRBrDpY27z64rbSiLOyaOPmLsQd8HwdAkwJBI7pPlwX+
	I2YxWrDERs0UUqkqE5+ZPAJNlHYA24uvmlWbf8Sv2KpOb/ZbWvPy/d/EXl+KYihLlwHcyfP9jm8
	OsgalYq8oFr75BfzL3y8FhGvBB97xxMxMt4li3FM9KLIP/R9uFMM+dzkWLo0YJT+HdkrVg5Z38W
	5qXsc9vH8QU1XUmpyiY2aTt6tJ+KcbgFMFZc3IQAdfO11CGH+wfVQYF+I1ROA0CVhFrN0n1qnIK
	HTOoU4fg/rt5AfHF+5X+9euRXGOM=
X-Google-Smtp-Source: AGHT+IHnOgKC+CAkJmHmQ2Z8OCICro5ATzijs6v+pWi4OOZhHngK8VBa+oz1rWPoffGTtJpxrmoXKA==
X-Received: by 2002:adf:a348:0:b0:3a4:e318:1aa9 with SMTP id ffacd0b85a97d-3a51d98bf28mr4441746f8f.59.1749127579781;
        Thu, 05 Jun 2025 05:46:19 -0700 (PDT)
Message-ID: <d8eb6b3c-69f3-4bbd-93c1-89c865cdbe7a@citrix.com>
Date: Thu, 5 Jun 2025 13:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenalyze: Add 2 missed VCPUOPs in vcpu_op_str
To: Gang Ji <gang.ji@cloud.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250605123636.1444304-1-gang.ji@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250605123636.1444304-1-gang.ji@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/06/2025 1:36 pm, Gang Ji wrote:
> The 2 missed ones are: register_runstate_phys_area and
> register_vcpu_time_phys_area.

Fixes: d5df44275e7a ("domain: introduce GADDR based runstate area registration alternative")
Fixes: 60e544a8c58f ("x86: introduce GADDR based secondary time area registration alternative")


> Signed-off-by: Gang Ji <gang.ji@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Sorry, I forgot to mention the Fixes tags.  We put them on bugfixes to
help figure out if/how far to backport the fix.

~Andrew

