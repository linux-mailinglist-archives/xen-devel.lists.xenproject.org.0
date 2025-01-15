Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA9BA11BBA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 09:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872207.1283164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXycg-0007Xp-Dr; Wed, 15 Jan 2025 08:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872207.1283164; Wed, 15 Jan 2025 08:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXycg-0007Ud-9H; Wed, 15 Jan 2025 08:19:34 +0000
Received: by outflank-mailman (input) for mailman id 872207;
 Wed, 15 Jan 2025 08:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXycf-0007UX-1j
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 08:19:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71cc4331-d319-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 09:19:31 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so67138975e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 00:19:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c57ebsm14398015e9.20.2025.01.15.00.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 00:19:30 -0800 (PST)
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
X-Inumbo-ID: 71cc4331-d319-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736929170; x=1737533970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SWIJ4rNrIdrGkzef1P2uLOe488T87vh+0e7FW7DNfAk=;
        b=KeOPn9Oz8mk6++DSvDd8E7nf1M89fHCawqYH4is+HxkmtmZbFXYcl1kLeI955GZxOC
         n06YzPhF/a/tz5bsZON5PWlQjSabAzTUcEitvjBE/nGxuhMQb4O2hRW4qi3TwDL+t++1
         xV5tKFExb0qc83WhzV5Xo/tYOEhpafAGGK6qHtit3Rqn12tv0hJMV1rT0cRoufstZWby
         SagfadaA486cvyqnBWLx43lfEYAAcfoq6ePYYXeEuqk4R3Az6YZ+sfLxrLKl6N5BXYyZ
         kZhY94+OJZtjteudEizD6K0OTX8GUuYo+HgOgf0J/Gt3kEOHbrFh7MdeaiBSLzVECVh4
         WipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929170; x=1737533970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWIJ4rNrIdrGkzef1P2uLOe488T87vh+0e7FW7DNfAk=;
        b=kPCCtW/pB60Gq+8A6kvrQW4lXB2wWLu6kt9eiZTTuNGHCALXdRC7qgHLuU3WuzVKdK
         5/J79ap6LO6+sN1T5UczxrPOhy3uZIHd2wlg+a94+IfiW1oYxkiR2UYOhD0rMZ1w9zMC
         1YnjLVjn3LAsGyhIdCLTnQss6ObaJE11EH13ocjG+3LN+FFUH0z3RmtwrK0lmCHm7Ci3
         C8J2bGGYHhUosVy+Dvg+lHcHqermwKJeQ/Oh1irV04cxg1ObagbKC4RbzXmZWoe5e1zU
         UukZCdpj8xgbtjIaw17jPW+1iTxtly8nKr7ZTIfXwqOOqQy1nDmxSuZwhAhPYArrwe8w
         A5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0bcmA7Ovg1BiZH9yK9JtCc6Nwypaqp9ZfvzEXRKQTJyqkFfRfmHDz0pWEOopE+x2ywki5wlqRjtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZeLfTDlkn2sCv875r2T5ZO+hVSzqU9YAiMixAydxN1ZRe4KkQ
	mf2c9/6ym4IFnY6QUpTZvx7Vz6k/iAEo51VOIB2vxZN2MDRIpya5CBQjDWoUNw==
X-Gm-Gg: ASbGnct5cc6BE2QPcHZw9BHGgwQygZ48ngJErYF8lJgxPjOKodpo84i+g7FbE7QPSnG
	NJfHtpXSvTBkrLFNpv6GRnQHk8UmtDNTJkGdAGo3v7J49UbX87tDwl2pIL3Fms99A/zSIF+hp59
	uu8ir7VXB3bqSwK9eskrd1ZCZfkLgXpqJ5BH0b7xwXyLiIqzdKW0UetiQ6gCZfSp+3UMwb68dyW
	WSgQCCbSNFZg9YmNqS9M+YgIL4yuGeWpKp3cXUvqNipr1vQZJv1j8P/EEM/bKI0lPxBofiviuEL
	p8X58VprAvNW9f7e7/OBf2HztMdmxybFJVxPmJMmyA==
X-Google-Smtp-Source: AGHT+IHUwvxfYNxiTzO3MmA6MqwXjG6rhzQfK2yXe+D1nfIhjI4XT1IDPk+uc68GrdHbi88xBIHfhg==
X-Received: by 2002:a05:600c:4f4e:b0:436:1ac2:1acf with SMTP id 5b1f17b1804b1-436e26e28cemr245292725e9.20.1736929170460;
        Wed, 15 Jan 2025 00:19:30 -0800 (PST)
Message-ID: <e55b8b77-e97d-4952-a995-b566e7974da6@suse.com>
Date: Wed, 15 Jan 2025 09:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] automation/gitlab: disable coverage from clang
 randconfig
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20250114174345.60887-1-roger.pau@citrix.com>
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
In-Reply-To: <20250114174345.60887-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2025 18:43, Roger Pau Monne wrote:
> If randconfig enables coverage support the build times out due to GNU LD
> taking too long.  For the time being prevent coverage from being enabled in
> clang randconfig job.

Just curious: How long is "too long" in this case?

Jan


