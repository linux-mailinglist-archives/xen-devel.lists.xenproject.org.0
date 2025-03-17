Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC15A64553
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 09:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916250.1321372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5ne-0008WU-2b; Mon, 17 Mar 2025 08:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916250.1321372; Mon, 17 Mar 2025 08:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5nd-0008V2-Vy; Mon, 17 Mar 2025 08:26:17 +0000
Received: by outflank-mailman (input) for mailman id 916250;
 Mon, 17 Mar 2025 08:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu5nc-0008Uu-I5
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 08:26:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e31ef1d-0309-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 09:26:15 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso19103225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 01:26:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fd301edsm49179665e9.0.2025.03.17.01.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 01:26:14 -0700 (PDT)
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
X-Inumbo-ID: 7e31ef1d-0309-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742199975; x=1742804775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk0LzRIKCfvyKgzsBKzRoTfyelwsQ1qciem0DxUO658=;
        b=fov/ozjqySwWoeRFrHwBODcTpyXO61Ad7Ut6ihK7T8GP103idgLlnzD0RYV8lxSpDS
         lMxcmX3hTyePCxRRxCfUefgd1ynZfl+05yKLqD4IbTBHn6KFi+thHUEzIaudQ2ElZqFH
         QOPcAwuVvVJ1QGpqDKZbXvP5jR5Qhk3x25zt48ByRs+4nayhfMlgzip8tVx62vmw6hYX
         yCO9ZjHalHHLGAu4sGnarDOOYHzsT4Wk2hdK5VBYWM0xXS+uwzxjJ0uYV7VKywLr1AES
         NSKtWCpEi5dl3neqf/1lC+Oeb79DKYk+GOwcHImy0095zvt9Y4syiqd7qB5c4LWXT2+D
         5lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199975; x=1742804775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk0LzRIKCfvyKgzsBKzRoTfyelwsQ1qciem0DxUO658=;
        b=UvBYWIrAy2pWpHMX3TiGy63RjikEARcrltyFl/WIYwrrbPa3WQN3FY/H3ROZrDA5hB
         UpILXlIRh+uvDBOOPcMt8prQ/hRdCdJ2N79BaXptP3R5+Dj0qdLGvzecg6ezUiUc8Wdp
         5oQ444sEcfXcMS7rEm0ZzJE24ZnnB5BKFgXtAYn5h2//hpbAyO0xtYVFc3cstFJswXK+
         pdAT1rCC80d3mECYOd5WAp+HDRsBcAKAgaOhn3nmY+oqJjPvGzwl+mQfme6Im3dfqvEX
         +joARQddX1IWVaTlLsQSaSStg24dTSTysEDjZ6Zf1s/D5Zvs+nTIcUiG6JcCIj7PLbD/
         LVLA==
X-Forwarded-Encrypted: i=1; AJvYcCXYIc0Ov3Zwmp89dycHyNtDFSHn7Hv1Cq0wrlR+zwmsYF7woKIxXa+qXEcVwmyrsQrASECMGgI8ByQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzwK/+Hf8HvS+uJFCszjaoKepBbMpWuZMc87oIpaKT0MNPdvtw
	+i8a8Dl4gtE4X9Ou7RiPBQ4H+lI/aHSweTN83YXWzBRhTAaEayFA+1HqgC9dxQ==
X-Gm-Gg: ASbGncv7KRxgi0MoGpn20dZTBtdUyYkr+AWBbWQ+9PTjE4dIlQDd6YOmp0TGLYxmh9L
	fxhTNlgFbkLPD4GGA+Yf93y5Wa8jjYdGTN6gpsgagSk7vWf6phJ4Eq6scrmfDB+DM2ySAOJnwVq
	ZrnV9DFMCc2yN1DROlcxoqckW7dRFxyirNhBiGakl40VuECD3H3CLlBJZHATAartVNsR9eR5JZT
	YqxaZJ3A0ekbZrYA/bDDTONJJafWzxmIFVkAweYOO8kpeECKXULOBIN38t6RmqkhnzpMDe3K+08
	V3r37Rl2MkpQfPfEgVlVx/v5QWFJbwD4TNxEasOTvnPc4XZNLRYA8Z34uK/k5kUhXcwC6umSqvp
	iY7nu0OblQbNPIiAtg3uR6z0keo8kRw==
X-Google-Smtp-Source: AGHT+IGNtKZNvhLJqyJL/LuoS3oOUJOlxvtu3gojybJjpYJUZW3tDxGApVE3zRjxzqyfmwliRNzFxQ==
X-Received: by 2002:a05:600c:35c6:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d1ec80fb4mr109170635e9.8.1742199975110;
        Mon, 17 Mar 2025 01:26:15 -0700 (PDT)
Message-ID: <27288942-d9a8-48f9-86cc-7bb201dafb21@suse.com>
Date: Mon, 17 Mar 2025 09:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/irq: use NR_ISA_IRQS instead of open-coded value
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250315010033.2917197-1-dmukhin@ford.com>
 <20250315010033.2917197-3-dmukhin@ford.com>
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
In-Reply-To: <20250315010033.2917197-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2025 02:00, dmkhn@proton.me wrote:
> Replace the open-coded value 16 with the NR_ISA_IRQS symbol to enhance
> readability.
> 
> No functional changes.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



