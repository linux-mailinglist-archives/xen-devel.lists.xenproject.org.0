Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E65B17DAA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 09:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066929.1431959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhkI4-00016B-14; Fri, 01 Aug 2025 07:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066929.1431959; Fri, 01 Aug 2025 07:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhkI3-00014r-Tq; Fri, 01 Aug 2025 07:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1066929;
 Fri, 01 Aug 2025 07:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhkI2-00014g-Mr
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 07:34:54 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 035cb61d-6eaa-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 09:34:53 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so903880f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 00:34:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e897716bsm36096025ad.112.2025.08.01.00.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 00:34:51 -0700 (PDT)
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
X-Inumbo-ID: 035cb61d-6eaa-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754033692; x=1754638492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxm3lXM7pDmrwdxmM1hDCMHJDqVvUQCcV3H3roPEu7g=;
        b=A0P72WJRk0VY0ptxhBR3WiWv7NQdOrImjDkY/PJ8dF3pZhQTtvPBv7qFQtr2OfxdF/
         f4j9Xtz5PSj18U47//0sNd1R/5VIkYX8mVHfuKV8wX/7RpJIVN9ymwpVVNvUusbsX4L2
         RwbskZeyQoH+VUWNB2mVQKGyswDQQBzLWiaUKpM1kDYvT97vHpauid+m3XsmU6LODAhl
         CJp8Y/bthw4tXjx1xLmvjoy5je/WjKd+R+i9CAFMSFXRLSSH2qexafJfWAAq465AeTkj
         4K8GNHLHtM8YRyxVVykGqxecWE+Yklb+B9qhTKTccRbwA4Iz7/BEBJb27oLGdkizXHWx
         GCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033692; x=1754638492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kxm3lXM7pDmrwdxmM1hDCMHJDqVvUQCcV3H3roPEu7g=;
        b=cEpIVguJFpVcgRGdbMdqqZ+S1uNfHbUZfMkwrqMXeGfOmxOQfycd/nJwJlRTCGvxkd
         ALtGt6U23d9raO77ugo4oICVfYuW10CdcAkMm+8uFUAVaOgoiSNyWWgi6G72XjJii4hV
         MJT9GyLiGjGEKN2ZG8TcVsgyoug0i4PrE850sjOCAQO+RPX1byhOXZdu1So3jRvwY2iS
         F8n0/HizXN1QJ9KcunaardvlvrpiLWWaIEkhjGoc1m2tMVFW2udC8CI4/artc/WRSntm
         P+0sYeN2xx7H7cb5PUJVqLfSNZWVq4qbdOqQttBNV2RE9I3In3RlosTo7sB4Jgmpyfxw
         b5mg==
X-Forwarded-Encrypted: i=1; AJvYcCX/LvQ8nsq15CSULE0jMFPj9yWRhHEs7lruwW+ItKgHeMXizwUTczxi5YzcCdq0b19MuF9RUJlH0JY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkyT3nzQ5+4ly1nArQ4kKiA656OmFcr5/rSgX19xlPXNTDDRvO
	6tUzi3Zd3x7QyWDDLQvjwypCNOqyAYligoD0U6BKatnuPrF71XkLSJmBpr74MFgR/A==
X-Gm-Gg: ASbGncv2eqWWj0i3xBvyozWuwqKTuLG7Pg8yeLk2u2uL7yiDrw3Sv0OnU8yxjJ/c4vA
	mQwptQzWvUeM9yrEzgp238f/Kw/pyoIfKm/Bc8kcITBauXGz3n7viwbmrc4g31ALIJuJi/aX/wb
	YQTmPNyy1gxvnM5QZXCVoXWhcRM2wTgDAnJQOM8dZ0gvQe0whjC0fDaY7q9WSnPcGYaByJoOzDC
	vCSwpl/vsquOYjl2aUBkDYSjnQp1pEzW54IEPMMN+vrEUkiX9qXjlEMc7FyDAtBJ/xEtKQe072U
	Zr1z+GrnEMb8ZtC9Zresf/SP/nVR+Plxqqz89XSlrNGHG5GWJ3v8+mb0zsyPrXAW1ijuYZHEZ6Z
	m+SPZ1nfOs3RuWEuCwYXJPfOu0gr8w2FaggjsbrPj+rZWeer7egph1NVnJEuGiD/dHJDZnpmged
	9vVZXJ4mc=
X-Google-Smtp-Source: AGHT+IGc8/XSOoI/e9fV9iLt7iwwpkt9DaKzZEsWk9grXlu0S4wbl0t1jLSKKm5xXMVfJb0daVoxwA==
X-Received: by 2002:a05:6000:2302:b0:3b5:dc05:79b with SMTP id ffacd0b85a97d-3b8d3445909mr1404883f8f.14.1754033692017;
        Fri, 01 Aug 2025 00:34:52 -0700 (PDT)
Message-ID: <cc3812ca-b929-416c-af75-78c3c3b0d664@suse.com>
Date: Fri, 1 Aug 2025 09:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250730031249.1613142-1-dmukhin@ford.com>
 <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com> <aIplBkq7BL52Fn/Q@kraken>
 <78128ec6-b79f-4d4c-a298-72315b190036@suse.com> <aIvjJP6bpJpsQRtQ@kraken>
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
In-Reply-To: <aIvjJP6bpJpsQRtQ@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 23:42, dmkhn@proton.me wrote:
> On Thu, Jul 31, 2025 at 08:54:10AM +0200, Jan Beulich wrote:
>> On 30.07.2025 20:31, dmkhn@proton.me wrote:
>>> On Wed, Jul 30, 2025 at 10:12:54AM +0200, Jan Beulich wrote:
>>>> On 30.07.2025 05:13, dmkhn@proton.me wrote:
>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>
>>>>> As it stands, polling timer is kept in the list of timers even after the
>>>>> interrupts have been enabled / polling disabled on ns16550-compatible UART.
>>>>>
>>>>> Ensure polling timer is removed from the timer list once UART interrupts are
>>>>> enabled.
>>>>>
>>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>>
>>>> Wasn't it Andrew(?) who suggested something along these lines? That would
>>>> want reflecting by a tag then.
>>>
>>> Yes, indeed.
>>>
>>>>
>>>> Also, what's the real problem you want to solve here? The timer function
>>>> would be run one more time after ->intr_works is set, and then the timer
>>>> will be permanently inactive (up to a possible S3 resume). Is it being on
>>>> an inactive list an actual problem? (IOW I'd like to understand if the
>>>> change is merely cosmetic, or if there is some actual benefit.)
>>>
>>> My understanding is running polling timer one more time after the interrupts
>>> are enabled is the issue: if there's a pending timer when it is known the
>>> timer not needed, then the timer should be canceled.
>>
>> And the effort of canceling outweighs the one extra running of the timer?
> 
> I think so, because intr_works will not flip at run-time once set.
> If so, no need to keep the timer ready to be rearmed.

Well, to me it looks like a code size increase with extremely limited benefit.
Hence while likely I wouldn't outright NAK such a change, I also wouldn't ACK
it.

Jan

