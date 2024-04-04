Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C202B898840
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 14:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700844.1094591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsMXS-0003K0-3c; Thu, 04 Apr 2024 12:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700844.1094591; Thu, 04 Apr 2024 12:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsMXR-0003Hu-VY; Thu, 04 Apr 2024 12:49:53 +0000
Received: by outflank-mailman (input) for mailman id 700844;
 Thu, 04 Apr 2024 12:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsMXQ-0003E9-M7
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 12:49:52 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d40b9433-f281-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 14:49:51 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-516c403cc46so1671247e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 05:49:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k24-20020a170906a39800b00a5187bbfcc8sm915164ejz.149.2024.04.04.05.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 05:49:51 -0700 (PDT)
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
X-Inumbo-ID: d40b9433-f281-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712234991; x=1712839791; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=00BJbuZoq8NeRMiCXCfNPHJG0fkkfiEbNj9egTbKRjw=;
        b=bBgwTeapjK0jHZfcUEer0kLGew+fXzDSTgThj2UCFT5M4WrFBQIL9OxOOgqYIp5xAW
         MU4FtDYErxRJe5H/zGjEz2R4XlWQdFexFmHD0Ed+2EObixt4RwwQhiFO48gnkIQYKCym
         FjlWl1asB6cYxIBpvhfv1L770Qg4pMxYg6TSwtoAmBl6E7AHTe2AKoVPayEiLhUP32Ef
         bR4FDNy+vf1GJXCzNxYq/w0uCKsV6lSOhZOboz+RuMVt+ojin/W+dylR82pSvONIMRL4
         mkL23s7WMo7gP2YSCstk0fBbbygFqi6pJ3lcvfJUoiFGpToW5ouwgCu1kHbr5R2DbFq8
         6RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234991; x=1712839791;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00BJbuZoq8NeRMiCXCfNPHJG0fkkfiEbNj9egTbKRjw=;
        b=E5i44/9CMIKoF7QcKGv05+czxZHASCkFrY34otbaeFVkuo01Ui5L9Bve4XT6IyboK7
         tcG39xRhGVDkMeyqCw0qwYBPdjEaaiOkscmKLRIDgAW0vBLi/IFlGEMxD+++zIf4H3u5
         NocovLHIw6Zp3u2sUmoX3Z13mftCuwWSiBWUCZ5SLyROhdd07qcCKVi6J2+qW+YeyYnk
         g6H7tVkZgqREZd1ey8x3Xm2VcmNRPnxmYfJxKTGwgNXAdMrzO/wuJbYaK2YpJBlbB83n
         TbPMwp9BCrwtvbaJ1Ca29JBSGD6Khjt8grl3zxJZ5kyo97nvpzCCpDvmGjcVRGK1kXOO
         4Mjw==
X-Gm-Message-State: AOJu0YzA21Ql9DAi0XK17kHKbJs3Oxg2ZOOPEHXBdKi/DRnpkBWCdzT/
	/wzvu5TI1KW+ScBR6ota2iz/o/E+2aeAS5+lPQm7QwW0nm1QsO2YZjLg8Z/sGr7yLy+XIrz9lio
	=
X-Google-Smtp-Source: AGHT+IGqwR+3FihaBiEVDgy8xA45AFA4xGK4EV3JGzNrZBMEcYAf49MMj8+PQ/RzO/nB2Ll1f/7dCA==
X-Received: by 2002:ac2:4db1:0:b0:516:cc2f:41d4 with SMTP id h17-20020ac24db1000000b00516cc2f41d4mr1798075lfe.25.1712234991237;
        Thu, 04 Apr 2024 05:49:51 -0700 (PDT)
Message-ID: <6dd11879-a656-4f89-a5df-a63f256a015d@suse.com>
Date: Thu, 4 Apr 2024 14:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.18.1 and 4.17.3 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All,

we're pleased to announce the release of two bug fixing Xen versions.

Xen 4.18.1 has been available for a little while from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.18
(tag RELEASE-4.18.1) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-18-series/xen-project-4-18-1/
(where a list of changes can also be found).

We recommend all users of the 4.18 stable series to update to this
initial point release.

Xen 4.17.3 has been available for a longer while from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.17
(tag RELEASE-4.17.3) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-17-series/xen-project-4-17-3/
(where a list of changes can also be found).

We recommend all users of the 4.17 stable series to update to this
latest point release.

I'd like to apologize for the delayed announcement.

Regards, Jan

