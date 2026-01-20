Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140FD3C290
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 09:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208466.1520613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi7S0-0003bt-QC; Tue, 20 Jan 2026 08:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208466.1520613; Tue, 20 Jan 2026 08:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi7S0-0003Yz-N2; Tue, 20 Jan 2026 08:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1208466;
 Tue, 20 Jan 2026 08:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi7Ry-0003Yl-P4
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 08:50:58 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2269bb87-f5dd-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 09:50:56 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so36450645e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 00:50:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428b954esm291555515e9.7.2026.01.20.00.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 00:50:55 -0800 (PST)
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
X-Inumbo-ID: 2269bb87-f5dd-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768899056; x=1769503856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tvR8P1qhYUxOgFhUpo6UQFFziOLcP+abKFopPZ8Y4lA=;
        b=I+b7Uea8A3+d7PWrXw0NR4+per94K6se/+S+wCrHt7BnKMMlx0mbsVla4vL/wvqOlU
         ep6qFotVXTGh3x4cnTUIc67AUgLb+b/Ll+EbypYIxP2/bqlts4WPyhDLrt3M51arG1iZ
         5PtZTvGjBbzp5vUMFI10PxUmGtAuOQG8X/iy1qQsvvWGijBoA0rL8K2S/rJ5lkKf6vsR
         Qkt7YYLSlaSxcahMRMki1kmJb7+Q/asag0u4s8xCfJqETviqaYJTXmOVrShkl636uhUt
         yKoji64C1rc1qRJmIFIrtOGntut8MJ9Zya1QKEoAn3WALr+/DNLlA+d5hPxppyRyLc+G
         XhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899056; x=1769503856;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvR8P1qhYUxOgFhUpo6UQFFziOLcP+abKFopPZ8Y4lA=;
        b=vvyW/D3wA6FDDubuS/oDTrAmMr0X3fGdEVgdx0rvrCmfsFueroVURA31rNRv78ab5E
         yYGvVOY7bmLJDlzkHUiprifmc09KzWmq1vWQ7Ftne0AXgrMDMzAUeUavSpiH0u7JBc3K
         3W1V1WCKk91x7SB6TUNrZZj40eAcPIdkApvUEjm7pHkuXP9uxLdTCCbYUJKjQRcNpeyV
         AYlt3KNcU5S6hFCSsZcliZngjlPv3+ztuuY65KoUeX09GTJCqzDejtoc/0wng8fo4uc6
         8A++rlde88A0ia8QGZ8LXBCi3ymUC4zdLhX6EvVv/iHoHgObSwxzBsJUGRb8Z3aJIypS
         INxg==
X-Gm-Message-State: AOJu0YyM2I56TqoH8GcZpY/2I2+mWQ+VyPpRlYMIov7RjZ6/9JK5NJOQ
	DVb/Ymm6D4zsOf7wzP0rbn6TPSQSkeh8w504cWXSyYEdBbNJ27ExIj9F3wZH59I3CA==
X-Gm-Gg: AY/fxX65kSWPrqvUi61lMzSTiZFV0k3Be2VgmBi5GmkH56cAefb/Kd6pj0kQMsxz3M/
	BKFlRaTwD8leiTV3IIyNvX9cWIKIeUM9+fTjipPtSnjbchrRJ+TXfRcfhIP+2BBr8KB4VqVAoT4
	mnQaZkL5e9bAk+me/zjXYdfbrwfu2P6jgGY1JKj940rp/jB7NIRRphQeDOj91Jv87sUjUw0/bWb
	XmBjJ0VBjWBIBCNe1g6u35BlzI9Wh/g0ODu/Y40Li2klx4p/Uks03bH4EvBq95QdxynFo5xEzPe
	XIWLs++QXRJuC6vElurOnKcY+3fS49TIojDA7XyiJnd6fe744VJ2eMcnoWRR54WJX1xBYxaYuRU
	ABQ0Zs1LCEG/oqRN0b9sCbDmFb3Zql1zzrEt0yX+kEcWwQ1gLa+7k7AvRvCkJhPWI09O1IZgEfD
	82HuE0qJG4A4eKFCm1hiDf3xB1Ehp28dI0Mn7aakv+IXvVakh6tVOb5mKCqT3K1e1wD7kCPOpky
	VM=
X-Received: by 2002:a05:600c:8184:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4801e530d08mr171832985e9.1.1768899055809;
        Tue, 20 Jan 2026 00:50:55 -0800 (PST)
Message-ID: <380f4d96-4612-4369-8ade-8e9739929135@suse.com>
Date: Tue, 20 Jan 2026 09:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <aWfXJk90Sh7B-qi7@Mac.lan>
 <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com>
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
In-Reply-To: <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 09:00, Jan Beulich wrote:
> On 14.01.2026 18:49, Roger Pau Monné wrote:
>> On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
>>> stime2tsc() guards against negative deltas by using 0 instead; I'm not
>>> quite sure that's correct either.
>>
>> Hm, we should likely do the same for stime2tsc() that you do for
>> get_s_time_fixed().  Given the current callers I think we might be
>> safe, but it's a risk.
> 
> Will do then.

While doing so, I came to wonder if there isn't a reason for this "capping".
In local_time_calibration() we also have

    /* Local time warps forward if it lags behind master time. */
    if ( curr.local_stime < curr.master_stime )
        curr.local_stime = curr.master_stime;

Which for the use of stime2tsc() in cstate_restore_tsc() might mean that
indeed there is a worry of the delta being negative, and the desire to
"warp forward" in that case.

Whereas for the other use in reprogram_timer() capping at 0 isn't overly
useful. By the time the value is used, it is likely in the past anyway.

Jan

