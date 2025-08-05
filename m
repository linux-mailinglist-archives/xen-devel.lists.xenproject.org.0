Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0116EB1B2B6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 13:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070364.1434008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujG5W-00076s-4L; Tue, 05 Aug 2025 11:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070364.1434008; Tue, 05 Aug 2025 11:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujG5W-000754-1i; Tue, 05 Aug 2025 11:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1070364;
 Tue, 05 Aug 2025 11:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujG5U-00074t-7d
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 11:44:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 809ae0b4-71f1-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 13:44:10 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-adfb562266cso877007366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 04:44:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a1251sm898641866b.30.2025.08.05.04.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 04:44:10 -0700 (PDT)
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
X-Inumbo-ID: 809ae0b4-71f1-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754394250; x=1754999050; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BH92JrYxTfVRwbnf4Sf3bniKIUgN6cCnUEwrDu+iezk=;
        b=GDXO1lrhk2zbk0TLGy4glEyw6tx05f41fM0YVhR4ZWRFoqKotxA4AvGD4wxJFUOPZV
         qL+JWleBbq0Zrs5slkKzVN+TPZxkfhiPbbd8B9Doo3ZXJ/NQ61lynywSRtj69eNfxDc/
         cWArkrcy6LtEk3fwKi26FD+cIxcmdmHEqLXMFldhY1F/hJtuZqf1IW4vmQM9ydzwfOO6
         Dnb4QS3/GQCQX+5P9kBf/2Mk5MueHoAsq8X8zVGJ/XBI53wXHovsoksd0fcXRI5/4+y/
         lqgpc/HxwKNEUspZHQ4W9GUQKrKmGqY3hqV7/6n7rOJN7rMNhD5o4onAtwMOdWUyiOxH
         FhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754394250; x=1754999050;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BH92JrYxTfVRwbnf4Sf3bniKIUgN6cCnUEwrDu+iezk=;
        b=s1Bc1kc/xFH4tfAAtvsouTVvWP3XZkiLl8izL59s1aqVmSHcVDbdLHlmwJLV7k0mmH
         pDSX1yF8CikXav7q6Op8T1HiO4CfI5xm1M+6d58k1anWLXGbyMMV2lB1yOdENMxB2I18
         WClrNl6lM/me9viqvB96Dx72b+55tQFF2WLxiSTzbAup8ksRHTI64pjIbqPphWNHDSjg
         71Dzo+UovY8M8Vsj2j5cx4Q6V37iw0FY3zuZg2PlZI+kWvAJSR4XEugq7tTodVxHqcoe
         VAbetTVWTOTDIGABkSSHqbh56qZoeiO+0IEuvmLQgG/XFbiLumzsXoOd4KOBTcwY46Qq
         z7pA==
X-Gm-Message-State: AOJu0Yzodunq/eEe75ZslMOQNT6it16y0D1o9KFuSEzwCMZ4iucgwMvG
	di9ELmwYgfbN43fRME8U8wNDw55EQw86+hDLERPO0l/3BgcevnWLmqIcxYVeJnneFbJNidNSwns
	ZuO8=
X-Gm-Gg: ASbGncsOPjpzlllqDKdVgQKpNoB+SiWih4T/D7Z5OK5WdXtuamNlOt24dWDd4eHZc0E
	R5UNgdGadUG/TDXaT6sIy8yo3Y50FyEZ5Hj9lxDsQ4OV0WWxle6sTLomFuAZSFMvkcyMOQXFqf6
	oflrvqhDr2dsL7GXhUxS7f/q5afMRYBK0Qr/9gRvdpt8Ht5dDa3G4HUSyFIC+itjhs0iejGPEev
	/4LWU3ojILtlXCXdsEhXA1Xd5vXPv84tjaUJNa6ZrxsnU/33YjSCErPPw/Z+70qCFCP0WL/svR0
	GvsgUYH0+ub3OQD89sCDoyT0GywYOYsy1V6yZ75RRF6dBPkk4AQeJC0y74bEYixHwAfLWBDWVEB
	QT8hqFy0lG8bdgKKqJCAYxTkHF1Wab5oHgFIy8OQbGRkWaQed082S7FOAJk/jyoa13Ml66FIeno
	HJMx3ITgk=
X-Google-Smtp-Source: AGHT+IHE+oudJJHxhXWrlKYklIFJFvnUoJGRkjCdqP0DpOQXNxhHvs1CEjjk+ydvKd05LrRxnhf7VQ==
X-Received: by 2002:a17:906:470a:b0:af9:4075:4ea5 with SMTP id a640c23a62f3a-af940754f66mr1252954966b.25.1754394250291;
        Tue, 05 Aug 2025 04:44:10 -0700 (PDT)
Message-ID: <508868ed-ef78-4eba-af44-e8c7e6bdbadf@suse.com>
Date: Tue, 5 Aug 2025 13:44:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.19.3 released
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

Xen 4.19.3 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.19
(tag RELEASE-4.19.3) or (eventually) from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.19 stable series to update to this latest
point release.

Regards, Jan

