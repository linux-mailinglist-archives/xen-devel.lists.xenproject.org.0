Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D01A6B515
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 08:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923360.1326896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvWrg-0007Ho-RD; Fri, 21 Mar 2025 07:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923360.1326896; Fri, 21 Mar 2025 07:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvWrg-0007F7-O2; Fri, 21 Mar 2025 07:32:24 +0000
Received: by outflank-mailman (input) for mailman id 923360;
 Fri, 21 Mar 2025 07:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvWrg-0007F1-0N
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 07:32:24 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a04aec5d-0626-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 08:32:21 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so962849f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 00:32:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6450sm1614814f8f.70.2025.03.21.00.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 00:32:20 -0700 (PDT)
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
X-Inumbo-ID: a04aec5d-0626-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742542341; x=1743147141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ydoh6TK36mdQb4Y362sVcQIU7fJb2rErrQh0V8h4DX8=;
        b=FfkI6hVA8iKH61od9JkCFNmSlNUhhu0fAR6E582LS1A20jOKQB7C50M3aPSuT8m9z8
         yGylXeXNgY809JbqqGi6MCEPw2pBtuGMgqHrWKPNXOpxfVtBvQdUQpdK1vuaQwdlWOz8
         eW9u+dfR+Eo2/mlMX9+pN9wxCjlS5MeU9VSFqOxJRbBNHvgNBhk/gJJ/OPPFDC3GIMXM
         Sk2V0RO1Wi5il9EDD31ZSFHeXMSOdh6XSWTuOps+Dqd5AfgHC62gt9pDKBpS5U5vjib5
         zUMnRsR4rmqw0eB+SeIJ1jRq3lsFxnEZtz2gl2x43bIOVlDQwLO/X3hyJSrKMr6o/ll7
         owSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542341; x=1743147141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydoh6TK36mdQb4Y362sVcQIU7fJb2rErrQh0V8h4DX8=;
        b=JFkUayuNApJwPTTgOWQT/63elM1xCU55o1vj/aPX7MPEKPXvtZLj0UNNqeaLfJecOt
         0bfjZID/dJpTqeIU4GHGRCfsUMyoNyDGSoiqZPTsTR+2xF5hBskzSMb9TS+T6bb2lCcz
         P/NE0bweRklzkGIggKNvx462chpNqNFFm0a+AAEF7jJBjjWpK94meWmyC+heW9OcCjFX
         G0iwh/CRznnbQofafE41xnvDUWbOpT3BThCucJP6kOtH1QKlAatZR+DTMribmQCFFqod
         LnJPdxsAtKrEDiDG3CZuBlXIhwXvHIrcgWjfPbvFRU8JrDDWUu5XtsJn7L8HUCBySCfA
         QkVw==
X-Forwarded-Encrypted: i=1; AJvYcCXzyCKtmG0pt8FV+fq1MJdi4i62JGc8giz/IP1Vnb4Lwn9XjQ6vNGgzsWbvg05R+xaBRTr505X+e7s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF2bTT3tG4BQZrHio6xlqUPMbezTYSV4ZOxjlKitlwu/ExdhBQ
	EAt75Jv5DEFnNlZyAtmL7of2T6TRe/pKoLJmwZzioKwfaamyPY4EK8BoXQ9ZUg==
X-Gm-Gg: ASbGncvt19JBTlZPuSjUFo7rxZkM7BPT5sKUpMDDcISvOvVjdWSM8Tfufj+LhiQFFBO
	CCBG/8/d9vHhuTpJ1EIMBxGajY2x62tP5oaK58oQCUJTSQy2Ea3Flj6gRA8Z2puiaeA+8AZA5CC
	cLvXVuEmg++x9ZtJB9UPsXIreSzmGIFiGV9Jw0sIFLqYTCGZBhyfge0mY07gZJSaaiUi8s+NtrV
	z5c7pvf6AbxxwRHDhIhPloXPzPfsHcDBqDZkb2tww474EEuD8mKjg/ESaZijKvFPsNngcqcXDQQ
	IdKG/Rlv4BsBwXV8T3fsU8coGyVT1cpjZQ80PXol3F0rEc4rAO2oS2QSsl7273eARYkrzUUmgtg
	mo/LOy/VZRYXW5lepUTwqCBOMBZ642Q==
X-Google-Smtp-Source: AGHT+IGfNK0dwYmICAGa9QKqAncQ1ULOnwm2nisMX2bQeiN7d9cc+MlJL9UhDKwSLmIoBMYkJbF8Vw==
X-Received: by 2002:a05:6000:178c:b0:391:48f7:bd8a with SMTP id ffacd0b85a97d-3997f908c46mr1482357f8f.30.1742542341212;
        Fri, 21 Mar 2025 00:32:21 -0700 (PDT)
Message-ID: <f1222c54-5a21-4266-bff1-292d12154b2d@suse.com>
Date: Fri, 21 Mar 2025 08:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/traps: Introduce early_traps_init() and
 simplify setup
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-5-andrew.cooper3@citrix.com>
 <20250320201732.84094-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250320201732.84094-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 21:17, Andrew Cooper wrote:
> Something I overlooked when last cleaning up exception handling is that a TSS
> is not necessary if IST isn't configured, and IST isn't necessary until we're
> running guest code.
> 
> Introduce early_traps_init(), and rearrange the existing logic between this
> and traps_init() later on boot, to allow defering TSS and IST setup.
> 
> In early_traps_init(), load the IDT and invalidate TR/LDTR; this sufficient
> system-table setup to make exception handling work.  The setup of the BSPs
> per-cpu variables stay early too; they're used on certain error paths.
> 
> Move load_system_tables() later into traps_init().  Note that it already
> contains enable_each_ist(), so the call is simply dropped.
> 
> This removes some complexity prior to having exception support, and lays the
> groundwork to not even allocate a TSS when using FRED.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



