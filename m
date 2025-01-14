Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A6A101CF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 09:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870992.1282043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXc2U-00078B-C3; Tue, 14 Jan 2025 08:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870992.1282043; Tue, 14 Jan 2025 08:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXc2U-00076j-8m; Tue, 14 Jan 2025 08:12:42 +0000
Received: by outflank-mailman (input) for mailman id 870992;
 Tue, 14 Jan 2025 08:12:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXc2S-00076V-6w
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 08:12:40 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 520a06f1-d24f-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 09:12:39 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361c705434so36644305e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 00:12:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e62133sm166433875e9.33.2025.01.14.00.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 00:12:38 -0800 (PST)
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
X-Inumbo-ID: 520a06f1-d24f-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736842359; x=1737447159; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3a6aVJIZxGcOGXILo6dS5uJfAibi9kUy3AHZ09t6haQ=;
        b=Mh5zW7r4CpWqTjj/VV4XY3R95ETK7sZzddoBExnNFX/Yty7lTEMjCfshJ5mkJ9ekNV
         s4e1ATZ2XMFDN4D30Lp1tSQFq2FALdF5q1m3yrERzRxtKRKi52POu4+cUb82qpHhqZFD
         8nwN8QQsgrjx4l0cd0/cdDQmN0GfPOiON0IBLRIxxVERpN6YIioUtoPyrYmt7KfkxDfm
         C4jieJj2H1QfSbTfF0pqKD7aJyrnyB5H5F0QA5rNUKpBHpe0WiF2y3WLHJhCUXThS0hg
         FDZh+jemdMX2hFKc7Rw6jaT7+MzrKnnhKbo2BvEBeqqpFqndJD/Kdn99LKQGreyJ5czA
         Z2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736842359; x=1737447159;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3a6aVJIZxGcOGXILo6dS5uJfAibi9kUy3AHZ09t6haQ=;
        b=eRvY174F9eTt9ZaGpxznZYJZYh9JSZdPHY6eku866y9Par87G83ULjWVtvzYLGa4Ql
         9QJQNqetrOgSDfj7BWYia02EbuJIH20cRZKVzaO+fr4hCh2LBPXUD1KumjoLWoa1kiMy
         kfszZ7lVmUvVgfuZMqrVF2F42qybg1K87z/6tOzSrRST1NeXLaaRkNqzsAAVV9E52x37
         SyvRgzK5WWeIR3y6ir/2GPDgtnyCwe7yg2xDjfWAPnZjgSefOjUlEiLjcBruCdHpEwf2
         XXCOW7atUZZGgb84iHeAxZ+XHw22+W63/XVQOn6uJOvclqUKi1ZRt7OuGsNly/E0WdSR
         xz5g==
X-Gm-Message-State: AOJu0YwieKAxDBTCJ7n8v4w71RExj+O7+D7iR8HYn5Xuo45qJwHpYyH3
	Rl+BY18Djm7pogam40E+MovNDECqJVfydSJrxUpVrAwr7h7KPLWEAL0uSnSMzAZ2EhQN8rpwOhc
	=
X-Gm-Gg: ASbGncsGoJdhtYEiQuB9fP3ItU8J0Nrik394TIsYWiciE2NTteFDh3Le/Yq2gwDmCzp
	vEoiZbSImwhQtsMcvK66m6nvzXfjaL6guvq+3vYDibGM1PX9ylCHni/ZIqJY87LWCo1n/ntdnO+
	cFqoQAZdFMJwbmr6olI9OgRVeBPbS58dlMmsMbG7iD409vAQbcOb6nv2FGYGEZHUQbEFbZnn0Fz
	xsXaqDRdZ8m0rkyfCLeVM5PjimgT75LXFss8knPRTqWNWJrNbb1NazQszMPADVzwWwWQkzkoPmQ
	5TSemKw/EdeM3/sotBG9b28dch+Ubm/EpYxzD8LAaA==
X-Google-Smtp-Source: AGHT+IH7utO/GKMqnnOWUbcwkAx7/UIXlSWYIaWovjq/cQVkW4QG5uKaOAVvY1I+9bh/DMYy9E2adQ==
X-Received: by 2002:a05:600c:5848:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-436f3f695dfmr107276185e9.8.1736842358792;
        Tue, 14 Jan 2025 00:12:38 -0800 (PST)
Message-ID: <fedf2b9d-a475-4062-b8a4-5e33c7dd6305@suse.com>
Date: Tue, 14 Jan 2025 09:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xentrace: free CPU mask string before overwriting pointer
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

While multiple -c options may be unexpected, we'd still better deal with
them properly.

Also restore the blank line that was bogusly zapped by the same commit.

Coverity-ID: 1638723
Fixes: e4ad2836842a ("xentrace: Implement cpu mask range parsing of human values (-c)")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -1105,8 +1105,10 @@ static void parse_args(int argc, char **
             break;
 
         case 'c': /* set new cpu mask for filtering (when xch is set). */
+            free(opts.cpu_mask_str);
             opts.cpu_mask_str = strdup(optarg);
             break;
+
         case 'e': /* set new event mask for filtering*/
             parse_evtmask(optarg);
             break;

