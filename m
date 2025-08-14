Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23133B2634A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081496.1441576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVXv-0007wF-7I; Thu, 14 Aug 2025 10:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081496.1441576; Thu, 14 Aug 2025 10:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVXv-0007t8-4D; Thu, 14 Aug 2025 10:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1081496;
 Thu, 14 Aug 2025 10:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umVXt-0007rq-K1
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:50:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dc55806-78fc-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 12:50:55 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f4cf9so1148980a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 03:50:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9115562sm24065921a12.59.2025.08.14.03.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 03:50:54 -0700 (PDT)
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
X-Inumbo-ID: 8dc55806-78fc-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755168655; x=1755773455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aaFvGBFmR9QsPSUvWNl/jDDQEJnJqf0ZP1skBdYM9qM=;
        b=ea4+Y0XuaK5/YkfNl5S/I4B08l1qA+GDMJVnPxJBEFamkVr6J894Hcco6fX1+uPF9f
         nsY+T4NftgEdwUwzBKC5MfUe+9h+R7qJViWPkYlHBX7DbadHXtz9xe6yKMJqCN4FH/Ly
         hy54oHe6jltmvJAt7+UnB/QCfcDDBq6PxIpciVhlEKT/3S2DhQ7rO77Oq6Mrt3/y7XMk
         /gBHmjpMOGhp4Uz1OqylxB51E2L2nHcGPa8EtHQSkI0ynHehX3dvPHWQ1aE0WyBcElT7
         7y49DU0nsWG+uA/KDKrrBkaEKhG+3+f+cCxukYOLOh7INQ/X9TJQEPPdLiYXUYp/onzL
         Nlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168655; x=1755773455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaFvGBFmR9QsPSUvWNl/jDDQEJnJqf0ZP1skBdYM9qM=;
        b=TgOFzB7/ZU4DMhWrDDmDBLEKhUkI0F5eROnPWxoLfbDvOOFdG+Lvfn8DD5ERdp7wNj
         yvbM4viajYOz/YVxN6gvHAqZiqdWKdDXc8KZg9lw1RUXjZp0lCtONIw540AGSNLDV7mm
         c6dNH13HrzY9tq3uT3wx+6NQKM6odP8t3sG5hCsX0vcIhuX59OFO9LWmhGSn8D9/1sIf
         W8FwVeaF1tbueasYbv5/pPUd9qbAWxVpOpLpMLu/URb5fy1Ga14Airfc6MzGQZWp8kFM
         eogmtdnbSRROrEatiiZHRywJGvNLOZGj9a/RzeUsEiq/MPclHKh1/OqaL1vzubHlunNK
         +K7g==
X-Forwarded-Encrypted: i=1; AJvYcCXTn1KcC6uF7RP6E6csyXaPXA3t5QW4jj1QbBDDilFQEYLv9YZuL38Gti1a24Xou00JD8oOlsUCm9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLruG/e7vmNPMsJOkYTNQ3Yt4zxGH6jgigWB4lk+hxj9WONbTk
	/n93bnJ57J5GQqFO4lESk3LT7cNeB4XfjZgxXG4la5lk7PutT51YDcG+lPhYwoOM9SdA8S0QvWq
	kyD8=
X-Gm-Gg: ASbGncsvs5MNw1BSn37PzdM1yTZF/ImwQIwc2Goib6YJ9dxUXFx60rA99OLhICuSpUI
	FnK57Dd3GMcozmCb1KYMgI3P29qXTghRZu9He3MeyMzBVqy1TTkrJjRY9te8RzsPaNmdw4voIqf
	laGN1AxFan7U01O6GsUHaZo+dNEjUFB8i0N9G8yFD9PO5S3Iwxgt/csmePt05+XEQj9eSQr8IpD
	viEBFZzA0OZ6BfoCga0qcqEbI1lVJQz3J+z46zGM1o0TlVaJEQetV2t7W4lVChy81SWK6a1pY19
	nqIMSSHxvauVdqnZ+ldJ3UXwG0GhFrtGw659+4deFVUJtJJRALpTsF5Th9gKK9cUFkye58tV6It
	CWi6HzuSs4TW0EJ4YnpckkSSzbxdWRbbG2R5QnORCKUW58e5Wv6u4pQoxPUgNi7g4i9mw67cEFF
	d6R/VbgLTl36UrigvWmw==
X-Google-Smtp-Source: AGHT+IEaeke86GYwF3TQqzSZuxZi3VU2Kw/Uz2NGYzXkXr2hls2VpQTwrI5TZ+cDXH9ocTImaZBY9A==
X-Received: by 2002:a05:6402:13d6:b0:615:98f6:78da with SMTP id 4fb4d7f45d1cf-6188ba2758fmr2395950a12.33.1755168654946;
        Thu, 14 Aug 2025 03:50:54 -0700 (PDT)
Message-ID: <626c0919-3e50-40ee-8b85-4bf267040023@suse.com>
Date: Thu, 14 Aug 2025 12:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pvh: update "Host ACPI" support status
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250813093220.76030-1-roger.pau@citrix.com>
 <becdc624-7bff-4b78-94c2-2999bad114fb@suse.com>
 <aJ28COzujqBlrov8@macbook.local>
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
In-Reply-To: <aJ28COzujqBlrov8@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 12:35, Roger Pau Monné wrote:
> On Thu, Aug 14, 2025 at 09:21:53AM +0200, Jan Beulich wrote:
>> On 13.08.2025 11:32, Roger Pau Monne wrote:
>>> For x86 PVH dom0 makes uses of the host ACPI tables, and hence the status
>>> of Host ACPI entry should have been updated to reflect that PVH dom0 is now
>>> supported, and Host ACPI support is not one of the caveats.
>>
>> Well, not explicitly, but seeing changes like 6378909b41c4 ("x86/PVH: expose
>> OEMx ACPI tables to Dom0") I'm not convinced we're there yet.
> 
> How would we know when we are there?

That's the downside of the whitelisting approach: We may make it there
temporarily, but then a new table type may break us again.

>  I think listing it here means it
> had some degree of testing (which it does in Gitlab CI), plus that we
> will address issues and backport fixes (which to my knowledge we
> already do).

We do, yes. We did already before it was supported, to encourage its use.

> AFAICT the only way x86 PVH dom0 can get it's hardware information is
> from ACPI, so not listing it as supported is IMO weird, it's not like
> PCI passthrough or some additional feature, without ACPI support you
> cannot really boot a PVH dom0 I think.

I agree. And from that angle I also agree it ought to be marked as
supported. I really don't have a good suggestion here. My concern, in
any event, shouldn't stand in the way of this going in with someone
else's ack (e.g. Stefano's, that iirc you already got). Yet I'm
hesitant to provide one myself.

Jan

