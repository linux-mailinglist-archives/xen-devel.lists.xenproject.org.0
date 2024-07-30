Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63580940E33
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 11:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767417.1178023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjQF-0002WV-Rc; Tue, 30 Jul 2024 09:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767417.1178023; Tue, 30 Jul 2024 09:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjQF-0002V1-Ow; Tue, 30 Jul 2024 09:45:35 +0000
Received: by outflank-mailman (input) for mailman id 767417;
 Tue, 30 Jul 2024 09:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYjQE-0002Uv-4r
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 09:45:34 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 763797e0-4e58-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 11:45:32 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34722so9006270a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 02:45:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b049csm7063955a12.3.2024.07.30.02.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 02:45:31 -0700 (PDT)
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
X-Inumbo-ID: 763797e0-4e58-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722332731; x=1722937531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+7VN6XpvIUNL/t0RlxVGC4Une0iibsPZ4kuOrxouJBA=;
        b=UjsFuliNhvqlrA7qFYTIwQVa7xl30eSQE/WnthUTdkuMLZPgcJOzTIPRflWgnx4n+x
         HSHVZ09b4GnN36W+V7xxWjTYCo4sN+es7nJrFvSnTYQglowPf/TJPcTxc6VgUXtOC3VQ
         m781kHOgi5ZgFvo93avAOsDPbHoAfd3HiqSSCE/RLeWBW5iWAfwTwpgxOWDdGmPoD+Z1
         Z5eNX0LTEZqErWYf5CRgfopsxSZZd2kC4Ju+a6YP9YypfieKUW6/6UK2flKwtf54tsAC
         BuooTQd7UdF1UNGQ50eZpRwZJv1N35mVo+y9iM3lcoyHfh8PWh5TwEKdd1PJVHYx90Pf
         jWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722332731; x=1722937531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7VN6XpvIUNL/t0RlxVGC4Une0iibsPZ4kuOrxouJBA=;
        b=FNtXWgHaocg1HAlE2wGCCjjIVxckT2uqle8kSY3oOBu6YBsTXeS3VcIIL8MDPfVsWH
         /63/e4/0dHLgupqqplIyBujYZ29+euotwqDGPWns2WjaH3phAsbWgP3VXVxj89ZOdf1x
         dlKUg9YwS5BLzk8i2iZ90KXWFFed9e20YOK3wHkHjOi73ui84Ag6LrILiDWvUcj9J+I9
         VInKNlfmEzM14W6ZsQjt8TyE3Lx8WunSgM+JDRq2wmlbIBM5PQQXCyoun07ufvg/3uEU
         oi4oQZfQNhb+7Wg3GOTWSlhAtVKclAwhkykz1xR3Fm4f9Ibxs5I1gjcG7lq8M6u5bOpB
         XrsA==
X-Forwarded-Encrypted: i=1; AJvYcCVuXAqDlRR2/5Y5Ai6jWb+dUj9C+vOkzcliZXTN++Lc6suUP4phvrn6b38VBBYBcGRpeSwfr4TSCwC8zv8Vc+ch7GQMhsP1h850SxCejxc=
X-Gm-Message-State: AOJu0YyhHMdrvEIv4930nPDj0y/TwF7agdHQpHWF1PcmAdcyBkrEPsKT
	SQvHmMZJDRkdy+k9csoN6gb4ApLL/h+XL1zsqBH+K36g9TAOW7xp+opM027CXw==
X-Google-Smtp-Source: AGHT+IG857zViPAVGFuiTUREDGMDAMQc1JuvtmAFJ1yw5SZ2xK9d+p0Cw4DoGupf7PYqW9vFgXMvQA==
X-Received: by 2002:a05:6402:3489:b0:57d:3e48:165d with SMTP id 4fb4d7f45d1cf-5b46b88cba7mr1705865a12.4.1722332731463;
        Tue, 30 Jul 2024 02:45:31 -0700 (PDT)
Message-ID: <7116e5dd-ad7b-4d2d-bb72-739320208dc1@suse.com>
Date: Tue, 30 Jul 2024 11:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 13/17] xen: add deviations for MISRA C 2012 Dir
 D4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <1a47750ebed47a3429269112fad6da58bfb6ee96.1721720583.git.alessandro.zucchelli@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1a47750ebed47a3429269112fad6da58bfb6ee96.1721720583.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 10:15, Alessandro Zucchelli wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Add safe deviation for *.c files, as estabilished in past discussion.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Hmm, I was about to commit this when I noticed the mismatch between From:
and the sequence of S-o-b: Who's properly the original author of this
patch (whose S-o-b ought to be first)?

Jan


