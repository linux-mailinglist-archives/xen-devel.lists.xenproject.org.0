Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DEB1B04F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 10:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070146.1433799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDDJ-0006H4-N5; Tue, 05 Aug 2025 08:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070146.1433799; Tue, 05 Aug 2025 08:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDDJ-0006FX-IZ; Tue, 05 Aug 2025 08:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1070146;
 Tue, 05 Aug 2025 08:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujDDI-0005ya-AS
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 08:40:04 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c71b0e67-71d7-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 10:40:02 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso5301923a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 01:40:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2b892sm8116926a12.25.2025.08.05.01.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 01:40:01 -0700 (PDT)
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
X-Inumbo-ID: c71b0e67-71d7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754383202; x=1754988002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i2NlffeOdCnrYZXWUB7kK6H60KrPAmWA40eCyBTflCQ=;
        b=WW4dp2iGOpL/N4Sclubetu7ghxjYfeT2DGgsvk/dELWjYCVk7BbnMtXIDhVc8DVAlo
         ME/WE0j6rZn6ZdoVVCqnWzdCr9pqofu/e0AQ+0byL1HHlcPkXawK3E3e1QVWTldNbCnZ
         uYXR+AiFn4h7gXBZvsxOsjsAKb3v4CNnWtp8ngrVJO6WneZ1yHu/Z52hf0bvnOJHq8qd
         oqKdI/oY/xuwsp691/K8mUzEO+Ir40+8yKLlsZ/6NcxJSSj4LmIaZEo0zxOHEsFwtFNj
         GoxUi1cug0/bDvzCqe9uzs6wffXILIHnDATvG2vRDEDYUagUbdsrsz8KJHL/03ZKD4Om
         fZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383202; x=1754988002;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2NlffeOdCnrYZXWUB7kK6H60KrPAmWA40eCyBTflCQ=;
        b=RvPePFWitFwMmU5vX/d/rolTbgsOcf/stR8Xm14ao+w0somo/yR64ApcxTLEE19Kgy
         larOz5LQcLMyYtBlg3+pHVVQ/qs1WctZg/4V4haRBnkRsikZLt1wW2As/u7wgYx6X85B
         lulVJ/3T6ocknBKiOCRWCHJt+44+J33Sa8VRweHB5s9S9+1mAuFPZErB00zx6srPwt/+
         FvG6dHhqbDHEzp179cIPAUOd3Ts6DbNVA3lMrwB006APHwAhv8fpCeXWnGukZMRfV8Vm
         QvUoywu0C9LykJv8UfuL0THSMD6amyga8Zzc4hq5dSWdL5LNQM5+crZoPTGj2iYxZkKY
         cs6w==
X-Forwarded-Encrypted: i=1; AJvYcCV4AqzQxc+Pesc9YVJ0EM6QAfhFuJm0KMNEkBgyEZXdhA2tCOJKvy6QcbamBRnTuB0Qy5N/5jjK97M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVZYE/Ibzt2Vam8Ha6iG5QUfO5oELQGGOPOrdMLumuQ1lWq3FY
	9CFy6PrNHiz1PwjQMJQ6ZS2Ay+b8oBPIaRRsj9829Hwf+P2Y1mOa/45Nd6zL1YWjOA==
X-Gm-Gg: ASbGnctg1Q0Bc3M/ydcqlhZS50q8x3uR98r2Wd2khGd0SHHLX3E+DU+nMGIw92cBEsV
	dkg6gHvgxgzJYISiv4C8i82putXWWlL9VPcL7E1Dvr+bGt+EqHC+e0nJYUL3AwBLShy8pKEJUKB
	C+CtW8WV2JENPU07MPk2jyYPlWYZZ/BPCMcBhX9+25fvxJVb+/h16SNYOy4G17rPII7T5cOT1si
	CNjMXDbp8OI3vS0u7c5Lzkn+TmMRoAqZ4TuUi1SraiIeFzh2EIserMt7cjC2KZFFtsk2Ftm27cl
	as2MUNJiPe+BlcSFHVSPyjKkBDUIG7G/Zu992+W5HbykGdwPWi7NblnR7kMoriSAoaTDyE2lC1I
	x6Kvaq47aEJBVuJz1FnJKcBh4ZwTErtFBaJYwn7YAH02CAGMLrxhAa95dU3pF/qSn6qe6JJ6QwR
	i9Oy5Oktc=
X-Google-Smtp-Source: AGHT+IE9HdvNTef1Os3u9z16/53e5fVAdHFLGh+026hPSxjSdSLcbE2ESu4GRpBvRO5hgFhrJMF2cA==
X-Received: by 2002:a05:6402:3546:b0:615:6481:d1c with SMTP id 4fb4d7f45d1cf-615e6ebc410mr10069910a12.1.1754383201604;
        Tue, 05 Aug 2025 01:40:01 -0700 (PDT)
Message-ID: <0c8458ea-9977-4ba9-8668-b09a65cf9172@suse.com>
Date: Tue, 5 Aug 2025 10:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <889e32d2-b50f-4d61-b04b-6c73472abf23@suse.com>
 <BL1PR12MB5849F389E5CC38582EE9DBD9E722A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849F389E5CC38582EE9DBD9E722A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2025 10:27, Chen, Jiqian wrote:
> On 2025/8/5 16:10, Jan Beulich wrote:
>> On 05.08.2025 05:49, Jiqian Chen wrote:
>>> When MSI-X initialization fails vPCI will hide the capability, but
>>> remove of handlers and data won't be performed until the device is
>>> deassigned.  Introduce a MSI-X cleanup hook that will be called when
>>> initialization fails to cleanup MSI-X related hooks and free it's
>>> associated data.
>>>
>>> As all supported capabilities have been switched to use the cleanup
>>> hooks call those from vpci_deassign_device() instead of open-code the
>>> capability specific cleanup in there.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> ---
>>> cc: "Roger Pau Monné" <roger.pau@citrix.com>
>>> ---
>>> v9->v10 changes:
>>> * Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().
>>
>> Isn't this rather an omission in an earlier change, and hence may want to
>> come separately and with a Fixes: tag?
> This is not really an omission, after all, all the cleanup hooks were implemented at the end of this series.
> And judging from the commit message(which was written by Roger in v8), Roger also agreed to add them in this patch.

I disagree. Of the two xfree()-s you remove here from vpci_deassign_device(),
one should have been removed by patch 3 already. Which would require the
part of the patch here to be put in place earlier on.

Jan

