Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AECAB98FA
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986660.1372210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrTQ-0002tz-KY; Fri, 16 May 2025 09:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986660.1372210; Fri, 16 May 2025 09:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrTQ-0002sG-Gz; Fri, 16 May 2025 09:35:24 +0000
Received: by outflank-mailman (input) for mailman id 986660;
 Fri, 16 May 2025 09:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFrTP-0002s5-9a
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:35:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 168a1173-3239-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:35:22 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad510c259b9so331869866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:35:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4383d6sm124518166b.102.2025.05.16.02.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 02:35:21 -0700 (PDT)
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
X-Inumbo-ID: 168a1173-3239-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747388122; x=1747992922; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GuUUtwLi5p78xydLz57ppP9dNcYDitOJlBtWKRI9umg=;
        b=gLl8mcwDPNgSAxeSQLCuQOKooUtNvwrkv5Noi3V/OD8+cPux1fYZmCp19XeTBUBz5v
         /sDqkli3SLorBfmBSfLqOioMfe41cbpmEWYJuVS9g3n+lEjaNrl4igZhmwkPL/Pqekh+
         TFarT+fv0jVcWYYlDSe4BM2jtCDwC3LiRgGwr7HPQ+nflq5YSGEm/GJS74VEEs2vVmVV
         wwH2Yi6PEFhBVXml1eCfZkkTu29YOMJM+jI1ZU3NnGDfLTa00nb0EJmuWdcYO5muG4Vw
         XIy76G5RZ5OvGfu+I1eDXCxNFnU/91/Mxo3SX4t10N1PLTCwzGLE5AZb6Ks2PAprSrih
         2rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388122; x=1747992922;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuUUtwLi5p78xydLz57ppP9dNcYDitOJlBtWKRI9umg=;
        b=n/JGo3uMTSQKjpO5GXSKpDMurYQ7SkvmaKTfNjTqLQrE4jMeQm3fdTJJuO8dslUFYq
         pu7OcGa0QdzSJlc6qn85kNcJ1CF27JSrWH2s8OsULTyKvFEFqayD6E1D3ESUmC6UvJFn
         3xii9SLKTciOIOxWj9nCF3gVaKlMa5mEvYJbnCh5dBqg+yAJ0DuXs5Rtwpfj5IkvzUp8
         gaxWVy4DIEbOvOd9o72G4dO7k7TimqmBRbDDdOjs91vedse59JUissc3jlIO233uV/Hn
         RQrs7w6yeTgxJJiSaU87WgegEzZ0YoS34RFrsXom7t2xTefQR99k2y56e1ulnDdv5iU7
         0dSw==
X-Gm-Message-State: AOJu0Yxj4R1ca07EQ05v8/rBrPdacWJidsGYsI/Fh4nyFkXrYqSucuUP
	b5r+8Q/g9xt29GGr0gq+IwDH7A1dv1eZOpcISo+8Mao8ytrQ5iB2DNIPW1VIPMXSYg==
X-Gm-Gg: ASbGnctKqh0vfyn2/nwoz7FTYIZlrvLFNEyxg5KorHh2bxYzLGZ+I+kIyghR5SZtK1A
	1ds+KIdHsCzFPOMQQQBqr6BPwpRWUERM7iajmN0s7idbdEvvI3pV6YbmPi31Fk54o23xs6hdG8F
	IMe+voavS1BxmadDccyfEm3YII6sjZy6LL5UnP8NWeH5KA9YdqRvTCEnoizELLirO7l8Mtc81jx
	3e6hMmXnPCk1ykY1XRKKOjOgCLUhhREqkkvvlSv/ppJ2Strt3syhDj/fAKryj5rb06W7taocfAe
	xUBUjZKmmar+igN39aPAiuEVU++WfQy4lkVz9yY1SGCt6Sk6vdU8z+hC0gcd2AVCEgb9dnPd+Zk
	7bAZNF+2/Shyjw7xfoIQ+NfpDD9jMvJnTsGhSwqCkEZkRcWE=
X-Google-Smtp-Source: AGHT+IE4kohGyvQKsrWfdwryU5Plp+Rqb8fPtvj4Cv8/GQjHwOL8icnsKTwCPYZnNn/wb1a7a8+ZOw==
X-Received: by 2002:a17:907:7205:b0:ad2:409f:fe6f with SMTP id a640c23a62f3a-ad52d5d2fa4mr337706066b.44.1747388121581;
        Fri, 16 May 2025 02:35:21 -0700 (PDT)
Message-ID: <04d6f03a-ff40-48c0-a88b-753f3f8bda0e@suse.com>
Date: Fri, 16 May 2025 11:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.18.5 released
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

Xen 4.18.5 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.18
(tag RELEASE-4.18.5) or from the XenProject download page
https://xenproject.org/resources/downloads/, or from
https://downloads.xenproject.org/release/xen/4.18.5/.

We recommend all users of the 4.18 stable series to update to this (now
firmly) final full-support point release. The branch is moving into security-
only maintenance mode now.

Regards, Jan

