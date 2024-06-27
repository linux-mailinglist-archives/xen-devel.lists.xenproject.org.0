Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AFE91AA87
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 17:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750198.1158459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqj8-0005Ie-FP; Thu, 27 Jun 2024 15:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750198.1158459; Thu, 27 Jun 2024 15:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqj8-0005GQ-Ct; Thu, 27 Jun 2024 15:07:58 +0000
Received: by outflank-mailman (input) for mailman id 750198;
 Thu, 27 Jun 2024 15:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMqj7-0005GJ-Ak
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 15:07:57 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08a949c9-3497-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 17:07:56 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so90364181fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 08:07:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72745d06529sm1154394a12.24.2024.06.27.08.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 08:07:55 -0700 (PDT)
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
X-Inumbo-ID: 08a949c9-3497-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719500876; x=1720105676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=baYQFBulA6V6dKa4x0FhBbfUwASuTErtziwSk4qT0uw=;
        b=RwU8yPm3JRvMhr4bU3XuQH7ueVg/EAOsvoyXcvKtcVTiDRslbP6jAl5fH0LsbQssP7
         lFRKcI7LIE8nN9R+swEiAstTcE2KehiW75usjaR2mvSNbpNUads1xTooYnhcZrPTeYQn
         tz3KJ3SOwObHmx5JE1qHzVWA9tB2mgv/vVQ/xGCqATJd2b5jAxm734Vogk942NgZySu7
         kO2mJdd9wQct0lLPC4sP66r/blC3oS/iCuJXJqmZT2vosZOegqmtH5V3xtnRX7lh8RDr
         ZuIj5uxtuZdLbd/T0hr/hNAWvS0uGJsrGfZqtfYw0MeEOaDw31zSBhXSgmEgcsZke7UH
         heiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500876; x=1720105676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baYQFBulA6V6dKa4x0FhBbfUwASuTErtziwSk4qT0uw=;
        b=omLiZx72T/tuujGcklybuQelp2HjNIwUnAU161UI3CdLLntIEZ+d7r08QoyD18yWeh
         5NPY3Dku8fjNhtOvPR1pM2yRUgi9ZUcr+IjN17HtnUCLI4243OcVBOJ9xytnGvgRmH2x
         1UDx+hqiY8lkgwA0wrBv4zS6NHtuwzizjNLhIXy2dCQIdYyDUn5PHiSS33PaIpd2WLQP
         +vmft1kyNi2SpZe22wwgxmH1fCwoBj7skAD717rfPpfXCRuRB6xs/0wS0eo3jaNRTFtP
         vqjB46+fF6Wyo2jIKTr/ArzFWKdKO0GYLh2POkrZ17qoT6PskR4fxJLjqlLaFDbIjPnQ
         wfMQ==
X-Gm-Message-State: AOJu0YzmnINetpST+RmcG1on7H91OiElSg4rORQmNcWjLThHX50fKVnn
	2cnOE+CWGZdUyhIqRRn27tezu8i6ihVASgRybNmcApVMB3p/dlJKmojxWtOYnZ+3GiukLOmbfLQ
	=
X-Google-Smtp-Source: AGHT+IFM2bXBjvrmpj6ri7mcGC6JARytTXSVaembUTjZeJ1v9PvMq5pDevvokd3fjEUSInwcp8dxsw==
X-Received: by 2002:a2e:9998:0:b0:2eb:eb7c:ec1b with SMTP id 38308e7fff4ca-2ec59329f25mr108310171fa.25.1719500875638;
        Thu, 27 Jun 2024 08:07:55 -0700 (PDT)
Message-ID: <5be12b37-ddc6-4bce-a25d-758682d8f0fe@suse.com>
Date: Thu, 27 Jun 2024 17:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 402e4732
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <667d6d349798_2fbca341149a@gitlab-sidekiq-catchall-v2-57c8c99f7-ll4tl.mail>
Content-Language: en-US
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
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
In-Reply-To: <667d6d349798_2fbca341149a@gitlab-sidekiq-catchall-v2-57c8c99f7-ll4tl.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 15:46, GitLab wrote:
> 
> 
> Pipeline #1350627221 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: 402e4732 ( https://gitlab.com/xen-project/xen/-/commit/402e473249cf62dd4c6b3b137aa845db0fe1453a )
> Commit Message: x86/traps: address violations of MISRA C Rule 2...
> Commit Author: Nicola Vetrini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1350627221 ( https://gitlab.com/xen-project/xen/-/pipelines/1350627221 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 1 failed job.
> 
> Job #7202274595 ( https://gitlab.com/xen-project/xen/-/jobs/7202274595/raw )
> 
> Stage: analyze
> Name: eclair-x86_64

Without any earlier errors that I could spot the build log ends in

section_end:1719492504:step_script
[0Ksection_start:1719492504:upload_artifacts_on_failure
[0K[0K[36;1mUploading artifacts for failed job[0;m[0;m
[32;1mUploading artifacts...[0;m
ECLAIR_out/*.log: found 2 matching artifact files and directories[0;m 
[0;33mWARNING: ECLAIR_out/*.txt: no matching files. Ensure that the artifact path is relative to the working directory (/builds/xen-project/xen)[0;m 
*.log: found 2 matching artifact files and directories[0;m 
Uploading artifacts as "archive" to coordinator... 201 Created[0;m  id[0;m=7202274595 responseStatus[0;m=201 Created token[0;m=glcbt-66
[32;1mUploading artifacts...[0;m
[0;33mWARNING: gl-code-quality-report.json: no matching files. Ensure that the artifact path is relative to the working directory (/builds/xen-project/xen)[0;m 
[31;1mERROR: No files to upload                         [0;m 
section_end:1719492506:upload_artifacts_on_failure
[0Ksection_start:1719492506:cleanup_file_variables
[0K[0K[36;1mCleaning up project directory and file based variables[0;m[0;m
section_end:1719492506:cleanup_file_variables
[0K[31;1mERROR: Job failed: exit code 137
[0;m

IOW - some failure somewhere, but nothing noticeable in the log file. Is
this an expected thing for this specific job?

Jan


