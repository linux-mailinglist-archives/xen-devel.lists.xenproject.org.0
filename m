Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642CBCBD762
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186804.1508235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6VX-0002wq-27; Mon, 15 Dec 2025 11:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186804.1508235; Mon, 15 Dec 2025 11:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6VW-0002u6-V4; Mon, 15 Dec 2025 11:12:50 +0000
Received: by outflank-mailman (input) for mailman id 1186804;
 Mon, 15 Dec 2025 11:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV6VV-0002ts-Bn
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:12:49 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fced034c-d9a6-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 12:12:48 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so25405875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:12:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f36b6a19sm13969345f8f.38.2025.12.15.03.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 03:12:47 -0800 (PST)
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
X-Inumbo-ID: fced034c-d9a6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765797167; x=1766401967; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aacpoZ2jpiz5UpdoKXX6zRtFGImATanKcxyLMZHZvuI=;
        b=ejnGbboogKHSfMZO49vefEE2dciWDN9qGx6TKbBhDhHNxTRvnKE3KUcqNXhil84mGD
         rnjDoMXhhH0MMbCIXE8jI+yDE3Rk8v5scj2aDvs8egJfUWivQ75zwF41FEcacCRjXxrV
         dWebSTVYarKXEFqGXiZgszm4tvB9y395eYTvD7FeWeJNH2vZqOMeSNfUXrzmtXHntXpV
         MMXzVpE+xzwU/HMy74ndJXQnFzahv7O/NEHeBrOJ/Kb5n996XCRQlkJ5YDgOLadP43NQ
         tomQat65GWwz0+MjfKfEHRxcDJDDX57VM+GdxyFSnHDVWFPcT3bSVFeif/xDPF9028+W
         TnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797167; x=1766401967;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aacpoZ2jpiz5UpdoKXX6zRtFGImATanKcxyLMZHZvuI=;
        b=pj1lCriGyUIcvcjf4niiNL/9mrUBRSIeDwuLg6CTrMAD5VptR8Yg47pw+FTdKRbxw3
         iE5SM+HYh4GuWrj6qrWusQSSjcO4YCKyuqWFkVR8MQZaEbVC2/EBiaYCb7+Ri/buhdw7
         6yKH8tzLmMdnhwkzspbN8HyNtvNjgYGfJfHLz4DozUXoBzZMaNZeMB41S+eD6kwMtyVT
         595JuiF1m8FrWDKJdZHbyXiuAy1rWi6iFIp2lKceVop8RTt92ROvKzZF4E0HQpNVCvcd
         esY6vrOSPKCFKDp1yVlots3KUthU1gYhBbPswETvsr0xI1DcmegQYTQCMcHiWlbkfbsm
         Xz8Q==
X-Gm-Message-State: AOJu0YxmZZUC8+r/DHnVC+ow5KoRV2kBH/t/dHV6rYS44omxrbHB31Xw
	u2HlG8cDuYkIsrmT104mzAEZ5FNfr4ej0qkE4epGEbf4BH3kGk5USx32BG+E6RqS8w==
X-Gm-Gg: AY/fxX6nPfJok7WJZMfe2eQUYEZKRZ4KrWB+yfm0O+v90zcU+1GZG6gUSjIQkSSgucg
	UREXxtKRhc+2iqq0HWN94dks29BFX6xlnbdyyZANfVTEizAgpADfFb7XFCdF5GJNCLwg1RcCAD6
	lfgXxLS7sKyJk3TR60yezO/to46Iz0YlK1gbiALMjRvIcpuLI3I+kDfJO7AzkhnsyLYhsojQjyy
	N+11K1t8fXpjC1JHOcU/eyBEWMTv9ft3pShoMSQGpNDg8wpAIIvnpVsAhcClHYuvqBspsbP6jGs
	+Q+DCnx+02yO8J8+AkHMCBU8EH9axcIR+/wXsvKbDTAlJ8kNRXBH/2hm6ggV+/1TofCVU0CL+4b
	vCYRbn14P4s2abKGOQngcyTurLdmCHi95ca0ruXFh73ZvwiZY8q+te6x3gxQVB+WOYMbOSDEDkN
	646wXdIzfhh9foL2TJe5sfYlGY3w9QIEO+dlrBEmYuWAloBVicsAnp8Kxi7ed6FYaSFyqRV/ZFn
	6M=
X-Google-Smtp-Source: AGHT+IEPkoM0pzpW0npa5/v/o/UPPNqF6BuNZ2xerPghQXaulscgJOy7dsXq8wenwqQmFoK5xxRkcw==
X-Received: by 2002:a05:600c:a08e:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-47a8f8c57e2mr98529185e9.14.1765797167437;
        Mon, 15 Dec 2025 03:12:47 -0800 (PST)
Message-ID: <6ca4dfe1-09f2-4fc2-b74a-2ad95ebbbddd@suse.com>
Date: Mon, 15 Dec 2025 12:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.17.6 released
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

we're pleased to announce the release of another bug fixing Xen version.

Xen 4.17.6 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.17
(tag RELEASE-4.17.6) or (eventually) from the XenProject download page
https://xenproject.org/resources/downloads/ (after entering 4.17 in the search
box there).

We recommend all users of the 4.17 stable series to update to this final point
release; the branch is being closed.

Regards, Jan

