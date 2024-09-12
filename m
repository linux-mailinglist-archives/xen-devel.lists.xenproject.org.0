Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68B1976685
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797239.1207133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sognj-0007u4-MX; Thu, 12 Sep 2024 10:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797239.1207133; Thu, 12 Sep 2024 10:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sognj-0007qt-Jg; Thu, 12 Sep 2024 10:11:47 +0000
Received: by outflank-mailman (input) for mailman id 797239;
 Thu, 12 Sep 2024 10:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sogni-0007ql-B7
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:11:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69818979-70ef-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:11:44 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so51540166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 03:11:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c624efsm725477166b.114.2024.09.12.03.11.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:11:43 -0700 (PDT)
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
X-Inumbo-ID: 69818979-70ef-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726135904; x=1726740704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0qvVzYfHs3SUrX0X6rgBXy5x5Wt+QVKWYBbEqJ19g0A=;
        b=T/oT7uNbQJAJHvjVCpyLfr4rbQ1WzN6CGD46rwUmBO+Y6t2BrXJyoorkGeHVvPvvfu
         VRQxDu9DNvH6s5HcNKjVLgqInk9+cc0i9rZnEw9pcNqlblRew+5jaX7jI2bbwDk3+CDP
         yS22EBkac0CplB/KzTIhcRKObnk+XnO40PAW3gsIyRWPDBF4Qd3B6snAK0MGo3YtlkF/
         WsWRh4kAtFxJCLQEuBb066howb4OuH9R6pRpjdkzv9tkRsGh9kEQdGxxDL7vN1SywKu8
         ja8J4FFCq4tsVbOmm//3jGmOypkB+Mel7UuPHCGxRW0jpAcogitFCNA6UfHH1JOvQd1V
         MSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135904; x=1726740704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qvVzYfHs3SUrX0X6rgBXy5x5Wt+QVKWYBbEqJ19g0A=;
        b=hxiqlaVspWdsR3xiHvfQ0tOvsoC8C7LoZuA9m+m5j206Apq0KZwqEsPf8CSFRb9oev
         Nq/BZayS0FLvHQ999n5ZsvCjP8Z8lCyCUTAA+v3U0eUmdyC5tw8yp79o+z/Cf1RwgHR9
         W9S7uscJX0eTKzMKXwc/mRtuJGgRXCjr+Yoter7X9WWRKRVbQEdhTtBm1Mgga8Xtl19x
         Q/k9eROq84RvRIvy5c4ybr3IAipdrhfODZx1aCv8FZM69GhF8lUJoREL3iPMj4BsgTCA
         0/1zcRKlvx/tYbK2qP56pBWMBhUKCYnbgjQlgp/r+eycm9AajY2qQ/jI1LcYYdQrtA/n
         aFhA==
X-Gm-Message-State: AOJu0Yz9bwXhrU4DmyqlJY/hHUxqiMm56oeBON6TVXsyV2hiCRuToXQp
	LIGcef5RM+f0mKWt+q/xE2p2XaLw94upmUVV19+NyyWzZFmp2WflJzdp6HphO5qKBfcwBVH3UYo
	=
X-Google-Smtp-Source: AGHT+IHXkn+a5tkDZLiM5MlIhLlGBadSAwmXxnolUiUE9eoWK9kWyC3i3ngG2IXnTeifEh2zPeqRPg==
X-Received: by 2002:a17:906:bc26:b0:a8d:2ec3:94f4 with SMTP id a640c23a62f3a-a902964d007mr199618866b.54.1726135903440;
        Thu, 12 Sep 2024 03:11:43 -0700 (PDT)
Message-ID: <271b23d7-bd7c-479b-a568-3fe8f817ebff@suse.com>
Date: Thu, 12 Sep 2024 12:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 6e7f7a0c
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <66e2a27042b52_2fc0cec83515@gitlab-sidekiq-catchall-v2-74cb86846c-gh22d.mail>
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
In-Reply-To: <66e2a27042b52_2fc0cec83515@gitlab-sidekiq-catchall-v2-74cb86846c-gh22d.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 10:12, GitLab wrote:
> 
> 
> Pipeline #1450299635 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 6e7f7a0c ( https://gitlab.com/xen-project/hardware/xen/-/commit/6e7f7a0c16c4d406bda6d4a900252ff63a7c5fad )
> Commit Message: xen/x86/pvh: handle ACPI RSDT table in PVH Dom0...
> Commit Author: Stefano Stabellini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1450299635 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450299635 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 4 failed jobs.
> 
> Job #7805959443 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959443/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc-debug
> Job #7805959441 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959441/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc
> Job #7805959427 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959427/raw )
> 
> Stage: build
> Name: ubuntu-24.04-x86_64-gcc-debug

There wasn't anything Ocaml-ish in what should be under test, yet:

make -C xsd_glue install
make[8]: Entering directory '/builds/xen-project/hardware/xen/tools/ocaml/libs/xsd_glue'
ocamldep plugin_interface_v1.ml *.mli > .ocamldep.make.tmp; 	if ! cmp -s .ocamldep.make.tmp .ocamldep.make; then mv -f .ocamldep.make.tmp .ocamldep.make; else rm -f .ocamldep.make.tmp; fi
/bin/sh: 1: cannot create .ocamldep.make.tmp: Permission denied
mv: cannot stat '.ocamldep.make.tmp': No such file or directory
ocamlc -g  -w F -warn-error F -c -o plugin_interface_v1.cmo plugin_interface_v1.ml
File "plugin_interface_v1.ml", line 1:
Error: Could not find the .cmi file for interface plugin_interface_v1.mli.
make[8]: *** [/builds/xen-project/hardware/xen/tools/ocaml/libs/xsd_glue/../../Makefile.rules:25: plugin_interface_v1.cmo] Error 2
make[8]: Leaving directory '/builds/xen-project/hardware/xen/tools/ocaml/libs/xsd_glue'

I have no clue at all what's going on here.

Jan

