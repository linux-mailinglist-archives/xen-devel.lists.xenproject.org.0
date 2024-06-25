Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066591602D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747328.1154706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0nH-00029O-0O; Tue, 25 Jun 2024 07:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747328.1154706; Tue, 25 Jun 2024 07:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0nG-00026b-Tx; Tue, 25 Jun 2024 07:40:46 +0000
Received: by outflank-mailman (input) for mailman id 747328;
 Tue, 25 Jun 2024 07:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM0nF-00026M-2s
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:40:45 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ab0aecc-32c6-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:40:44 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso60905351fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 00:40:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7067e8f3293sm3654489b3a.2.2024.06.25.00.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:40:43 -0700 (PDT)
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
X-Inumbo-ID: 3ab0aecc-32c6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719301244; x=1719906044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v+TUi2Clj8MVh+JnnS51CFJp3GLTCoG1JG7Rn3hKFac=;
        b=Tez42T1Ir9dMemOlq1yJI4HS9ltXGUFjSmIIO/M2dnuDd/IA4hd3VgaX4/ISjMKyNi
         G4kp43r/+s8vHYv1lmhVV1uMs4+T0g7ZilMFOCBnY6MNv4XJfoke9/I+HGvlwLSQ+xls
         dIkuhe8Tc0rmaceV1F3+aXHWO+v31YB49sDOz51ONjqzZOUFBzEZv8DSD++Yl8PMF50W
         zIkiLiOjFyr6dkxM9P8vN565KoqmtFLKLR6fmEfLBFIt+qAHE/eaEPsCc7jaWO5WmwOI
         hqHmDfuuWBp1EYEkmgYgMniTVSjC74h4DQyxJJOhKN9dvTSuewsdUSGFZivacDHVFsux
         GjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719301244; x=1719906044;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+TUi2Clj8MVh+JnnS51CFJp3GLTCoG1JG7Rn3hKFac=;
        b=GSF1oBI/rza3fVdw/I6TvDK94Qszgmk9LNY2SHV6UFMX514/l6b8ak9QVYk/CfaXPO
         r6pUzTdiAhuiyKN1d/COqqXTYwy56Snrx5PQ8/++apR1b0NUMjw2w9kGQyqJAJ5vJjaR
         y4brsxVL4UcovGSXxdXmCdIXFykDuQYlagMMp1jtewl2Hfx8R8lgXgo7kZTm9xnstmN0
         TKII0NdHAj0MWTiRuUoxOegebnVuGl3YChSav/A437umy0oBNnjVmTNAre7XMoqLIY98
         zZFdWKmaMb00aRzya8HXnKMPQBjSdyhTKKO1oU+ebjGIyBqJMtjWdwcCNyvB2zAoB6Uz
         yBbQ==
X-Gm-Message-State: AOJu0YwkSIDSOb9rwEXv74OI9udg1JYbiLPN9kKFPdEX7Y988KQWwpFb
	QDHseE0eEMzOOn6gmnZsxVnRe/jSxm7m3EBRcQqbt9nVBUoEWoofrDX03SyX4Vz3TKYMC21fqa4
	=
X-Google-Smtp-Source: AGHT+IEunict/5Y/QLYgrBfNb4npX8rkMQy/JeD/4Wp7o1WzLCi8EZFdGjvFKY8o1hl7QUefwM6qcg==
X-Received: by 2002:a05:651c:152:b0:2ec:5128:184c with SMTP id 38308e7fff4ca-2ec593be850mr37543871fa.11.1719301243658;
        Tue, 25 Jun 2024 00:40:43 -0700 (PDT)
Message-ID: <e9adce27-7fb8-43d7-b851-1da14ad4362e@suse.com>
Date: Tue, 25 Jun 2024 09:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] gnttab: fix compat query-size handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
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
In-Reply-To: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 09:30, Jan Beulich wrote:
> The odd DEFINE_XEN_GUEST_HANDLE(), inconsistent with all other similar
> constructs, should have caught my attention. Turns out it was needed for
> the build to succeed merely because the corresponding #ifndef had a
> typo. That typo in turn broke compat mode guests, by having query-size
> requests of theirs wire into the domain_crash() at the bottom of the
> switch().
> 
> Fixes: 8c3bb4d8ce3f ("xen/gnttab: Perform compat/native gnttab_query_size check")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Looks like set-version is similarly missing in the set of structures
> checked, but I'm pretty sure that we will now want to defer taking care
> of that until after 4.20 was branched.

Actually it's get-version too, yet then for both only half of what's needed
that's missing (and luckily only the just-in-case part, not the actual layout
check). In any event I've queued a patch for 4.20.

Jan

