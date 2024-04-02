Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDE894F2F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 11:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700076.1092662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rraqH-0001iJ-U5; Tue, 02 Apr 2024 09:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700076.1092662; Tue, 02 Apr 2024 09:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rraqH-0001fI-QK; Tue, 02 Apr 2024 09:54:09 +0000
Received: by outflank-mailman (input) for mailman id 700076;
 Tue, 02 Apr 2024 09:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rraqF-0001fC-RB
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 09:54:07 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f92805-f0d6-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 11:54:07 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34379b447c3so31857f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 02:54:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm11252226wrb.87.2024.04.02.02.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 02:54:06 -0700 (PDT)
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
X-Inumbo-ID: f1f92805-f0d6-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712051646; x=1712656446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mghQ9DgNnw6Sa9ok0aCNeantn+TZ3q9lRZ77lig1Gg=;
        b=cQUIsRiDcN2Ch8nVCDmaCd3C/tEIha/8MwwfNPHLwfzObhwpfNriNfanMDT4pY3NPI
         DefNeaiR2Bcvr+YIyuCQ7LDYtkNxaWI7ABDP0MHDO/j7kEBcj2M6fXj+Nuk560d7G8EU
         Z7ceyUVVYRFzD+94+bYCcfZoDdicQYpGYH8kfNqn9KJ4AU+sDY/e18iovHMBMZzslRrE
         1FBy38SYDuBXnAp+2lcH4BJ6wzC+jeaDPrAsHnl9mPM8irIkGCYQCvhxgsVMn4NTD1nz
         TFZVH5kn/xeL3ZZzmQXeEkj8na/vhMcTARNlQ5f8Bf0FBpq0NGC8h+qRwrYvPHGgqweL
         my7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051646; x=1712656446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mghQ9DgNnw6Sa9ok0aCNeantn+TZ3q9lRZ77lig1Gg=;
        b=iqGQKcTzcQ9ULeDb15asNenwfDM4WSLICvxxSupZUA+NoKQcFt3WxrQg/oF/+n4z50
         Y1F8PLINCtC4wUx+4pRHGgbp3CR4G15tIIBGPJ90J4EGDziX7RBG82CTdTYrjl4UCUr2
         U7AeO+92H2mIdJ5kkiuqqybRoU09HyqG/4+k+Uk4aLVD9JFxkbeaXXpINSX55Dd/HKhU
         hUWvYRfsFp/OrSYMv6IwSk6gRDFnQGEHoJnalXa7hrAVG2BPY+OC7kKVWqgrvUQybnTx
         veOXpSqFJOzmq4CWllcYz7wbMlW2yHdTaa4giwKq+q8vjvxtFEjmzGI6MsWILjTh2BSn
         Fh3Q==
X-Gm-Message-State: AOJu0Yyn9mkONM0SOLmob4naQfFGF6+JCTQd4Pd6lEIWb+SpGi2W7JnQ
	o6wHxmve0x5gWKO7YrzVdQ2iIR7HG1eKUWOuVW9e8Jex21HKdo0duofn6CRdeg==
X-Google-Smtp-Source: AGHT+IFegIqk4Vx5rTyliMAZF4dgdG8GUPlT741e1ladmRbNBlMXUhC0O6QoJWkKPpfwlRVk2wofdw==
X-Received: by 2002:a5d:63d1:0:b0:341:c9d5:ae23 with SMTP id c17-20020a5d63d1000000b00341c9d5ae23mr8510442wrw.18.1712051646411;
        Tue, 02 Apr 2024 02:54:06 -0700 (PDT)
Message-ID: <546155eb-1dd1-4944-bb14-2cde551cf35c@suse.com>
Date: Tue, 2 Apr 2024 11:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/video: do not assume a video mode to be
 unconditionally present
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-3-roger.pau@citrix.com>
 <9d8af8b5-2a14-44bc-89c6-b616e79cb259@citrix.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <9d8af8b5-2a14-44bc-89c6-b616e79cb259@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 20:58, Andrew Cooper wrote:
> On 28/03/2024 3:35 pm, Roger Pau Monne wrote:
>> There's no reason to assume VGA text mode 3 to be unconditionally available.
>> With the addition of booting Xen itself in PVH mode there's a boot path that
>> explicitly short-circuits all the real-mode logic, including the VGA detection.
>>
>> Leave the default user selected mode as text mode 3 in boot_vid_mode, but do
>> not populate boot_vid_info with any default settings.  It will either be
>> populated by the real-mode video detection code, or left zeroed in case
>> real-mode code is skipped.
>>
>> Note that only PVH skips the real-mode portion of the boot trampoline,
>> otherwise the only way to skip it is to set `no-real-mode` on the command line,
>> and the description for the option already notes that VGA would be disabled as
>> a result of skipping real-mode bootstrap.
> 
> IIRC, Grub defaults to using no-real-mode for xen.efi.

That's our MB2 entry path which forces skip_realmode to 1. The xen.efi boot
path doesn't, but similarly skips entering real mode (retrieving desired
data via EFI protocols instead). Imo if to be retained, the above paragraph
would want extending some, to cover all the cases.

Jan

