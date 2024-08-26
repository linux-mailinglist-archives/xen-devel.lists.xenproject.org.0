Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9150D95EE67
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 12:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783385.1192713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siWq9-0001xH-AW; Mon, 26 Aug 2024 10:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783385.1192713; Mon, 26 Aug 2024 10:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siWq9-0001uE-7D; Mon, 26 Aug 2024 10:20:49 +0000
Received: by outflank-mailman (input) for mailman id 783385;
 Mon, 26 Aug 2024 10:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siWq7-0001u5-QE
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 10:20:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe794ab-6394-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 12:20:46 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5343617fdddso5875256e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 03:20:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4f6139sm641550966b.220.2024.08.26.03.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 03:20:45 -0700 (PDT)
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
X-Inumbo-ID: dbe794ab-6394-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724667646; x=1725272446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/qhVGALwY/dUHdwmy7J9EmaxnHbMtZrbU8ICizlTd00=;
        b=PwwuYxosfqKZLTD55opVD8O5SyZkEPWEeoaj7NcitoqG/5SjdCFtOgVuiLxVkm1Ehd
         mG56Lb/USl/43NP/qdsI7xz3KXJpiyZy/cIRSBiPmfAsxfr+c/Kqy4LBbL2HpPxg34ZI
         icpZB37aMDp0iF6FYX3t6CzyBbZrcyMF3DhQRcUBjj4anu3Ac4J9u4rB/cZIeo9M8EQ1
         BheyoND4Fdc09LwkIUXLFjjfvvn9dg7br4Tfpo630FYWKJUcoAywqPK4J898IbbR1+1T
         wvXw9w0z/5CMnikkMkOJCxnbFePl/lRTA4ILPXnO4LdobgL5HT6NBM+H0Po9c/1NGZvs
         z6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724667646; x=1725272446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qhVGALwY/dUHdwmy7J9EmaxnHbMtZrbU8ICizlTd00=;
        b=MgrINgjsaJYjvbokU/c8SCDm3krUR2r5HOEY83x30WZ6EWhuJSIgfgQShDJhtxJEft
         cZbzfafS64rWKI5figH1BazisduGjMrFqaZCl031Zlv6Xfz6tJYdQuL4rBfz2mlNoZBt
         xABtimyTDixJyBT33INJ1gB8Ncqoc6648MMFyMGST7SVebISiFPYinYTz0yCa2grQqNY
         Mu6PGHlVsCkX5kaFQBp0neIn2qNz1eoYH5AhRF0On7FCPRUpiqAK1b4AuZmEV2bn2S9A
         IXAfOhTMzlouOHxhtVe80RMD93rbTR+UExaW9FyrhNHQNMH6S+qZcqfVdtT5JlKFZ1i/
         RNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaNYkCO3sRtjE3uLGomUJtc1lKS69O+eYlUs0M6sTu++P/7Vwga0agvIvzZUv2ZgDs50X8sSDsh8M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkIlo9mXckmxPPLQFOG/uXSO29cn3VmidOpoWl1tMMuhyVEFSP
	d9AOak/UAvy3rE8MmfDA+LwwE/tNZiTBg5olDqR5VSkgP3My+K2Kmh8GCjegHA==
X-Google-Smtp-Source: AGHT+IEB8RfH37Y7OhgPNcZKm+tBz20EJMr4BIHCOjSRErSoUPBrnvlgLAyqKf0VqwMWUQa57ULHnQ==
X-Received: by 2002:ac2:4e06:0:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-53438846debmr7122271e87.16.1724667646047;
        Mon, 26 Aug 2024 03:20:46 -0700 (PDT)
Message-ID: <fa7e4596-32fd-40d6-b762-6d55def3d9dc@suse.com>
Date: Mon, 26 Aug 2024 12:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240812203938.981588-1-stewart.hildebrand@amd.com>
 <74f88a45-a632-4ca6-9cee-95f52370b397@suse.com>
 <f59539c4-0444-4644-a522-ea33fb2b4dbe@amd.com>
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
In-Reply-To: <f59539c4-0444-4644-a522-ea33fb2b4dbe@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2024 20:03, Stewart Hildebrand wrote:
> On 8/13/24 10:01, Jan Beulich wrote:
>> One aspect I didn't properly consider when making the suggestion: What if,
>> without all VFs having gone away, the PF is re-added? In that case we
>> would better recycle the existing structure. That's getting a little
>> complicated, so maybe a better approach is to refuse the request (in
>> pci_remove_device()) when the list isn't empty?
> 
> I set up a test case locally to remove a PF without removing the
> associated VFs by hacking an SR-IOV PF driver. Although the PF driver
> *should* remove the VFs first, it's completely up to the particular PF
> driver how VFs/PFs are removed during hot-un-plug, in what order, or
> whether at all to remove the VFs before removing the PF. Anyway, during
> PF-only removal, at least the Linux PCI subsystem warns about it:
> 
> [  106.500334] igb 0000:01:00.0: driver left SR-IOV enabled after remove
> 
> Returning an error code in pci_remove_device() results in only a warning
> from Linux:
> 
> [  106.507011] pci 0000:01:00.0: Failed to delete - passthrough or MSI/MSI-X might fail!
> 
> Despite the warning, Linux still proceeds to remove the PF, and we would
> retain a stale PF in Xen. Re-adding (hotplugging) the just-removed PF
> led to Xen crashing in another weird way.
> 
> To handle this more gracefully, I suggest removing the VFs right away
> along with the PF in pci_remove_device() when a PF removal request comes
> along. This would satisfy the test case described here without Xen
> crashing.

Hmm. That's an option, yet would introduce an asymmetry: The PF can be
added late (after VFs), so it would only seem consistent to allow it to
be removed early (keeping the VFs). Suitably justified / commented it
may nevertheless be the route to take, for (hopefully) reducing possible
complications.

Jan

