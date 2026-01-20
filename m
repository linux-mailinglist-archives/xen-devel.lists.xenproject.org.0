Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF1D3C630
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 11:52:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208669.1520810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9Ld-0001cy-AR; Tue, 20 Jan 2026 10:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208669.1520810; Tue, 20 Jan 2026 10:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9Ld-0001aO-69; Tue, 20 Jan 2026 10:52:33 +0000
Received: by outflank-mailman (input) for mailman id 1208669;
 Tue, 20 Jan 2026 10:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi9Lc-0001O6-DL
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 10:52:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e90c8b3-f5ee-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 11:52:31 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so40711535e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 02:52:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e9425e9sm113695465e9.0.2026.01.20.02.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 02:52:30 -0800 (PST)
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
X-Inumbo-ID: 1e90c8b3-f5ee-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768906351; x=1769511151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+ShC9hF73Gs3H1X93SkqlY+85cLkohUsLeQhumg1pTY=;
        b=LU+1fqO0uwtWm+OIO7/0HGXtZi/dZ4mnvQKXwqL8Wx8jaBh5tVdCSgFiL++rBmRqZt
         WoG9b+ssdyjO3SCT1BHd5N9bFnZqnlZsU7pxRSBYSO9L9yTngVAOQDhkI3Ve3+n8zHmL
         8O1Jp0muPpSWax4NteGRSRCkhdiLtBvavJUuq0FETIqIfhsa11U7elPqqJO+Blyk3Ums
         y2xiFbZEZLhjMjZ2VZxARlPM6FpK1g4UuiHLhPr5m9sATEXNBglBXwotsBYW3Nlc5siE
         /oosw2l81XcQKifccRLhKiogO2oCl+3dkTSis+rgxBlvH0r/dlKJ3Y5Nw8EOQOU6LIM+
         kMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906351; x=1769511151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ShC9hF73Gs3H1X93SkqlY+85cLkohUsLeQhumg1pTY=;
        b=DnfvBaaa8/VRTQpWU6tLWF+n6/g7zVODFLUvgcYdU+zrcO76S5/1+xJBFazIh3hkvu
         z1M7GS0R9mDm2QfLiFiiX/IFiNEkzE1SKVwg7UTi/M/JSdPukDQHt9JW4to7qVq1Rd+4
         WzhDgC7tqcM7r2iiIuSpv+Q1x6zfJBWTotDATa4qC9WsTXAkqggVrL2kVXNs5+wNrWhL
         LxXWOe1E76cNK242RGZYWVVZ59uyACRFKaGKz1j7kOK8FaKpzwLEj2UtAdI4DeYPub1T
         6tI/CAvXS2FOahm6MAVB30oXg7E1F7Xz7cCGovguU3xGevm8Z+IRPdKbP2iWPWUBJRiS
         iz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVytB70zhA3seYWFk3Uxpx75g5Tpx0xBiUEMXt46d3UGmz1NkA9rXrGwBWb5GtSEFmGKkXGxDpixjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/PwQVKZ1iFSsR+pAx7jIDzSBiRTv9dxVwxCetXUVXc6jRSq35
	elIPfM1TlroCoMuzlE4sWZvRaZW4nuxwb1CcJJEwyDfoZ/1V2QFV0PgTa7tkmZsOOA==
X-Gm-Gg: AY/fxX5dK97Lb3GvyCFey05gLrk1PqxvAPegC5+ao4yIZc4lbnZBsVir1EqCvGvNUy0
	S7oP/TWuXxEhoB9iHKaEuub4HtzqT1muIwZ2ocprvsqvwn75alEcjVhl1wcStZjg6O8J+mZkY9k
	1BUd762dME/IdQrRmn6Wl3Poufr103wFl4x34tamwNQhVG0c4fSNB+r7O50E82xfZYivph59YNf
	jisn5OSlojk8qHERB6K7Px0fxlmUCVmDoQR3vgtW4V7GpsZZZ8TmQ+UibTQKqKMNRFvX9j9cemx
	v+B/7ER3J7xXVeJLCdlj0KtjhyxOzRWYvJmKXtnmRf/qL56o60MhpV3BOZOQbE96/pZhrC/Vg7N
	SmRrmJusgqdRayv4jHP03QbuaPACzWXgbLeUpHmz8+SdPUi29cO8MHao9/1y6IBoPaqWjAXR1LS
	f49b0byEU2jJaqeNO+rHsXPs9HyHb5000WrfV+ksyIaNuJc9TKG4z8b1PRqwmWy1UwN4hAP4Zck
	5U=
X-Received: by 2002:a05:600c:1d14:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-4803e7a2cb5mr17875515e9.9.1768906350759;
        Tue, 20 Jan 2026 02:52:30 -0800 (PST)
Message-ID: <5e34118f-af8b-45ca-a5e3-ba214ab101d3@suse.com>
Date: Tue, 20 Jan 2026 11:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Kconfig option to remove microcode loading
 support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <d5620135-5e91-4223-a0ba-c6876fb8702f@suse.com>
 <DFTCOGP65Q9O.3S2TVE18USSUP@amd.com>
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
In-Reply-To: <DFTCOGP65Q9O.3S2TVE18USSUP@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2026 11:38, Alejandro Vallejo wrote:
> On Tue Jan 20, 2026 at 11:20 AM CET, Jan Beulich wrote:
>> On 20.01.2026 10:38, Alejandro Vallejo wrote:
>>> The only dependency here is patch 2 going in before patch 3. Everything else
>>> can be freely rearranged.
>>
>> Is this correct? Didn't you say (confirming what I observed elsewhere a little
>> while back) that there's a complaint when a file listed in the exclusions doesn't
>> exist anymore (which may have been cppcheck, not Eclair, but still breaking CI)?
>> IOW can patch 4 really be separate from patch 3? Or, if its description was to
>> be trusted, wouldn't it need to go ahead of what is now patch 3?
> 
> Doh, you're right, they are out of order. Patch 4 now just removes the exclusion
> so it's fine to do it separately.

I.e. the description there saying "it's clean" is accurate, and it was excluded
for (effectively) no reason?

> So patch3 <-> patch4.

Noted.

Jan

