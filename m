Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45C90EA11
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743698.1150645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtqw-0005Xa-Dq; Wed, 19 Jun 2024 11:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743698.1150645; Wed, 19 Jun 2024 11:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtqw-0005VQ-BD; Wed, 19 Jun 2024 11:51:50 +0000
Received: by outflank-mailman (input) for mailman id 743698;
 Wed, 19 Jun 2024 11:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJtqu-0005UZ-U4
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:51:48 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f184a9a-2e32-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 13:51:48 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so72884071fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 04:51:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e7bf76sm114392635ad.105.2024.06.19.04.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 04:51:47 -0700 (PDT)
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
X-Inumbo-ID: 4f184a9a-2e32-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718797908; x=1719402708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H+HsZknUf0FqyjXfhHWAcMQ3h/sOvKR89K3syadBBGc=;
        b=HDLXsUkH9Q+z4ghVpnhrcCPziyIPTfcOxvPowcmEbZdekiSheYeRW8HGOglLGhTlPP
         r6wcOpd8eg21woEsKlcfSiJhtA+UX4BMNuWWi4YnNsUaUBiPT+Nl8l/Cz3A+uluq1iKR
         riTqMPl0r3w8qOgm5GfUO+Q0JUbCcboPG0L+Znv23pp4Y5JSUAF22mI0F4rYd3kMkBx7
         /DQvQN1eiI/yeV4prb/6iXPR2IjRS0z3ihuUCZwmqDGzWDXsryDngYE7nlSZvuonwHZ6
         d52zb7jbBi9Cgu5LQCrVVGsAHQmstavyU+JEu23p9Vsj65GaidrAa/jlLFoGDnYEKYwD
         c+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718797908; x=1719402708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+HsZknUf0FqyjXfhHWAcMQ3h/sOvKR89K3syadBBGc=;
        b=DVQ0uvSrEAGEv5nRTMocpVBREGLRn23aBA0K6rHP8Z9YifRrtbEx215GJ+9Xnv1Ocw
         vnYUrACMfR9eaES1i8aITEcFnLAAxvv887Ty3JiZqnRkumYaB8wOTPPEXZRa0gGshenx
         ssb+vs3/ezPhSwc8Z/J5Rkeysweds+KIJjSFG3bCd5jnI5EPHTfMMtcxwm5ZYvpv6Ijv
         FYd2g0ltUMPHXC6zs5wtj09E47O5tFnv05mezYL/bpx73+eIbgkH8t72xUBIrUBo6loi
         hPrPC0MhEjowYTmrv2nHZhHbnV/hyxIPC5a/U7Id235FwSih0Uqs/oIoUDw2kNHXX96m
         Duig==
X-Forwarded-Encrypted: i=1; AJvYcCX7Gqbl9tijrNZPiqbJZob79jfIMZyekDqi9asohx5inn+0UFSioAvvKT8F/kq0F91v7aGO1xvY1XxdsHHJYdE2/ObfcOdVJZbEsPH14UA=
X-Gm-Message-State: AOJu0YwOn28tW5qxMZ/Sh0MQeXmICCFGjDcgN7OkO/3kUI98SAriXDlj
	3s2g0pjKhOy+j04UZwW9N/00aqr221jVPWxl/6O8KLvpietcw6qycWSCpzbKlg==
X-Google-Smtp-Source: AGHT+IE9X96w2hPNyDPa5XqSfMQ1fJ3GKa88BJnFarEpgipsO3lWZrGU47Y9zDiyM840QVDK4eYbxA==
X-Received: by 2002:a2e:9e05:0:b0:2e1:2169:a5cc with SMTP id 38308e7fff4ca-2ec3cec0576mr17373461fa.15.1718797907683;
        Wed, 19 Jun 2024 04:51:47 -0700 (PDT)
Message-ID: <b5767e63-a2ec-4593-b2b1-e6e8aab29b8c@suse.com>
Date: Wed, 19 Jun 2024 13:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v4.5 2/7] x86/xstate: Cross-check dynamic XSTATE
 sizes at boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240617173921.1755439-3-andrew.cooper3@citrix.com>
 <20240619104655.2401441-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240619104655.2401441-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 12:46, Andrew Cooper wrote:
> Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
> every call.  This is expensive, being used for domain create/migrate, as well
> as to service certain guest CPUID instructions.
> 
> Instead, arrange to check the sizes once at boot.  See the code comments for
> details.  Right now, it just checks hardware against the algorithm
> expectations.  Later patches will cross-check Xen's XSTATE calculations too.
> 
> Introduce more X86_XCR0_* and X86_XSS_* constants CPUID bits.  This is to
> maximise coverage in the sanity check, even if we don't expect to
> use/virtualise some of these features any time soon.  Leave HDC and HWP alone
> for now; we don't have CPUID bits from them stored nicely.
> 
> Only perform the cross-checks when SELF_TESTS are active.  It's only
> developers or new hardware liable to trip these checks, and Xen at least
> tracks "maximum value ever seen in xcr0" for the lifetime of the VM, which we
> don't want to be tickling in the general case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



