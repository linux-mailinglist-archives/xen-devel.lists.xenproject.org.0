Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2CB84B252
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676765.1053031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIVa-0006uM-VD; Tue, 06 Feb 2024 10:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676765.1053031; Tue, 06 Feb 2024 10:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIVa-0006sn-SS; Tue, 06 Feb 2024 10:16:54 +0000
Received: by outflank-mailman (input) for mailman id 676765;
 Tue, 06 Feb 2024 10:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXIVZ-0006sh-Mm
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:16:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8bed5c5-c4d8-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 11:16:52 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b1b21c020so3156595f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:16:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f17-20020adfdb51000000b00337d6f0013esm1691714wrj.107.2024.02.06.02.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 02:16:51 -0800 (PST)
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
X-Inumbo-ID: d8bed5c5-c4d8-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707214612; x=1707819412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/fdb57JZvf0dvGSH2X/1n7eUey51PwWD70FB2aYbEw0=;
        b=ExfoqCD0nkJX5ktDXNeDFv1FV2Ioi5FOL5TmC6DxFVDGrzYIm+1y89A6MaTqTXy/iS
         LGYvdbB0FbMdW0PN0LZKOKGrE43UlumyvREvFaguBU4s83ShWtYZ/e+CPl+AX6n8SXdT
         DSOIkjFcYpxlcZtZzuo81Jtb2/g2TrL+2ALkCxzOrBEKmkKLjNI//G437FOxSLWd8z75
         J3b5Hc+6kfrzelDv2hLwWCEF1YLcZ/2OevyzCQcTthBaWcufJvp7vt5chMaLZudpAGYi
         mJJaiGMWrVy057KyHhUjzQd10uhOBI1sZlFTqBlw700E85TFWLRSW6U1LZI+FKyv1flD
         rqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214612; x=1707819412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fdb57JZvf0dvGSH2X/1n7eUey51PwWD70FB2aYbEw0=;
        b=arZlGyre2HbfIOZfbq9n0aNqd2xJDpTNnCnSZFlt8MmJmJATbLT4r2aZKabHfguBsm
         D0BJKd4Y2vNRldZd6KHb1dRn/A3r/qnnzeoJrhHSRK65kQD98zmCEhSgdQNgaEFop8Xi
         r9mmxAPb3GThDk4qmFTUJUdneM++MFiF7NQhVqcwetm2kyeKT4jbmzVd/gZhT1HbbHNL
         j0XymzLkHrsaX77WfxcNVUSfzdzka9Ejw0MGlPb+CcbJQgTHD6d2JcupjCCFbfMKIwsk
         Vw7Ogx+9CJ4PABf83yYK9RsYYEltmp2tBsEVs/4u24qwR0ZFjNnJJzkfql8+jLfx45YA
         8srg==
X-Gm-Message-State: AOJu0YwA1EAittp2zgC/+QIL+A3IjTohDmJ30fvblbWKIg80BVZ3Ncyu
	QygIYgbX4r53H5gmwgmEErbOGP0IFGs5dxkEu3l/gQTpAdsrLMnzI0UXNfC1+8nD/PutaBwzauE
	=
X-Google-Smtp-Source: AGHT+IHONHAsNChAsu7enF6j9CqMMhBRNLh70v3O/Foqo0VjZHYjV4JHpTlH1ObDCMbPmvaZAbV1Sg==
X-Received: by 2002:a05:6000:1372:b0:33b:44d0:63ea with SMTP id q18-20020a056000137200b0033b44d063eamr916777wrz.59.1707214611941;
        Tue, 06 Feb 2024 02:16:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUA6+G5HgP+JHQaDNGBSemww5tbmw1Bs5CtrGI6SfKPSlim/RibMGZcp4bHF9sCPMiG7qlefsD4MTIOm4dLh6HIKvLP+N3bbLzSRwBeh7QDPZpFOKHyE3jLp2m/4Qb/
Message-ID: <e531ab31-6137-4fbb-9b05-b972ca102c4b@suse.com>
Date: Tue, 6 Feb 2024 11:16:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] amd-vi: fix IVMD memory type checks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, oxjo@proton.me,
 xen-devel@lists.xenproject.org
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-2-roger.pau@citrix.com>
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
In-Reply-To: <20240201170159.66330-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.02.2024 18:01, Roger Pau Monne wrote:
> The current code that parses the IVMD blocks is relaxed with regard to the
> restriction that such unity regions should always fall into memory ranges
> marked as reserved in the memory map.
> 
> However the type checks for the IVMD addresses are inverted, and as a result
> IVMD ranges falling into RAM areas are accepted.  Note that having such ranges
> in the first place is a firmware bug, as IVMD should always fall into reserved
> ranges.
> 
> Fixes: ed6c77ebf0c1 ('AMD/IOMMU: check / convert IVMD ranges for being / to be reserved')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



