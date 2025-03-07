Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED070A561BF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 08:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904614.1312466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqS89-0007cG-HD; Fri, 07 Mar 2025 07:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904614.1312466; Fri, 07 Mar 2025 07:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqS89-0007ZU-EX; Fri, 07 Mar 2025 07:28:25 +0000
Received: by outflank-mailman (input) for mailman id 904614;
 Fri, 07 Mar 2025 07:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqS88-0007ZM-0e
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 07:28:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf3f8ac6-fb25-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 08:28:21 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bc6a6aaf7so11674345e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 23:28:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8c324csm42465915e9.12.2025.03.06.23.28.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 23:28:20 -0800 (PST)
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
X-Inumbo-ID: bf3f8ac6-fb25-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741332501; x=1741937301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YQDLz+6QSvsh+cWgBfIYqdjk1TWuURfQmhCJZAML8Jc=;
        b=PjqI3bbjZoT/kx84VcVQFdqPEqNPtZ1tejXUV/tOHBnEPeAdBdL0WauHYCbvNByslf
         Biczy3vT4uOrGH66VngqBrlhUQgrOYd6K8G8Xyl/RsnLJRTU48lmDOR06WQTvN1lVdUN
         h3yNxqJfdJV5RIP6s6a5DPwCOLCPXq8D4MbvELL1I/ERwVw7zvF4mn2/xVcib6A3brCV
         UvKYlw5uglfG/uhuglQOkRE+EiT+hUn11UkhxDjQ8YpY9V0OGWHoZ4b4zfDBGJAC7L5J
         AoCbQXB+iGCkQHc5TzxAx/ttMBFKFyJVrTrwXC/xX+eivgBnQA9Un/9VwAoN8MvkQpLX
         szpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741332501; x=1741937301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQDLz+6QSvsh+cWgBfIYqdjk1TWuURfQmhCJZAML8Jc=;
        b=wWENvLHvqC2i7nR0CX9yxNHG+f054UmVKJoiX3CahMSE2AROYKc2VFxwzl6secumIn
         Rzt9YFYf6f48bpMxZfI9+Od4XyL4qV+me2X0leApHk1VVsCUlREocbAVQa18J/0lPcqc
         jOGEpb9oxCrVGPZ8Nc33biMwdJREw2Hq94D+VVoSbwC8Zz8zeIOqtKpNr8l3H6R0Z+84
         Cz2EZjspvSPL1Tvicm9bg3nxQ2jv3hsXGpS+eOydJEO0unofI7rxuN+N6/erbx/7f7Gp
         HxG2y0TeIMLgYLq6y8EFDdH3DkjIOB27JIlO6JsIP3A4y7aktb8O2dtwmGzhRxOjeeaV
         nNiw==
X-Gm-Message-State: AOJu0Yy2GT3/RrSCQB4HZ6Y0sI4JYKh9TZNs4g3IniL2sz9Sx2i+EsgO
	Qwpz59i6+XnAwtaOrT/j5B3Q86MVWFXe7uarOskNKNtRo0dOruNwIyobaHr96hcWXvQ0DJzugOA
	=
X-Gm-Gg: ASbGncuQaaYd1oQrGbe+AnQDNuCYLfS/YX7Z6Nj0rKzl7Z2GbiXPQlJUySi/6Ixnv8D
	1v7+3d818yy9DWfFR08l4eYW4mBXy+kYHE4P+l4RBQTaHaqKgE5l6u9JUMH0Ld0mM5ea7Ph7obV
	zpGy5uyCrf73yf8Yy+asamoMjt5q9q3wxmc0ck2gB9C+lGC6ijZcYgWYMhnC9qaSK3JEiB2pHo7
	QJtje1dh3JwEhwMj0MqHecVWiQ3tfehezcsAcVBlKX2YWGquLuzeN4MkLXzHfHhk02NzvDBgHs1
	f0q07bDFcyIsFGLrUJI5igDVtqQnvH99J0PpgGwimnGLtxMDxfxUVXhxRycGSWWbeL6hnb64+Ve
	9nVGa0O0rXSZu8XC2FAW0HH8aoiD+nw==
X-Google-Smtp-Source: AGHT+IERnw0yjpRoHD/OLZIOdalaNRFxF6S3fkGWDMCxhuFsGGVLpM25xXa+qq7obbBgsc1HcWhJxw==
X-Received: by 2002:a05:600c:19ca:b0:43b:cf37:c7ed with SMTP id 5b1f17b1804b1-43c5a5e5259mr11951755e9.1.1741332500728;
        Thu, 06 Mar 2025 23:28:20 -0800 (PST)
Message-ID: <1ca1105b-2ad5-477e-9707-15c5423a6aaa@suse.com>
Date: Fri, 7 Mar 2025 08:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | fe5757f2
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67c9da9b3186_2e7497fa83084b8@gitlab-sidekiq-catchall-v2-66447c6578-4sqjw.mail>
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
In-Reply-To: <67c9da9b3186_2e7497fa83084b8@gitlab-sidekiq-catchall-v2-66447c6578-4sqjw.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 18:25, GitLab wrote:
> 
> 
> Pipeline #1703410235 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: fe5757f2 ( https://gitlab.com/xen-project/hardware/xen/-/commit/fe5757f25de6062732c088ae54e2180236632552 )
> Commit Message: xen/events: fix get_global_virq_handler() usage...
> Commit Author: Juergen Gross ( https://gitlab.com/jgross1 )
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1703410235 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1703410235 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 1 failed job.
> 
> Job #9334349344 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/9334349344/raw )
> 
> Stage: test
> Name: xilinx-smoke-dom0-x86_64-gcc-debug-argo

I fear I can't spot what the issue is here.

Jan

