Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B1D9D37EB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 11:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840980.1256497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDhb9-0003Cj-P5; Wed, 20 Nov 2024 10:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840980.1256497; Wed, 20 Nov 2024 10:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDhb9-0003B9-MM; Wed, 20 Nov 2024 10:06:11 +0000
Received: by outflank-mailman (input) for mailman id 840980;
 Wed, 20 Nov 2024 10:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDhb8-0003B3-S7
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 10:06:10 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fae7e31-a727-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 11:06:08 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3824aef833bso2128762f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 02:06:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382549113f9sm1590982f8f.61.2024.11.20.02.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 02:06:07 -0800 (PST)
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
X-Inumbo-ID: 0fae7e31-a727-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBmYWU3ZTMxLWE3MjctMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDk3MTY4LjQyNzMzNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732097167; x=1732701967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oBxOsk0SV+PRxnXVAgOdgY8X7czssmPACRjLVpOXpc0=;
        b=ZFv55sEPm3nafvxgBFrhYvWjp0cvN5Jfsl1K8Ia5X0YXT35OtGFT2OQsrDCPDAUCsn
         YvCE3lXCOTms7MV7guk2JE++tGo7N2/zR5DWeb2ywH5BnmgB3kD+cTnuL5cMS5PUDfLo
         R1uuCxcU8IT1h2YUO8czX9riQxb65IGG8TGYYCbXtyLWqomMgd9sv9uyr8tzRt6a6ktA
         Ujf2W5/liQCA/PGlfsbiUavWER5TDYtDs3Stf0khDdb2h6pKlqAWhuHzy6VSSo/l028k
         S08a6Rmsd6/CySx15VPb3ka1ZGNxL783lsTmxebqhvIB8cPhFmzgNM1jH+mxv5DvfGq6
         b7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732097167; x=1732701967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBxOsk0SV+PRxnXVAgOdgY8X7czssmPACRjLVpOXpc0=;
        b=c/LWeI+4vBtdDGQHG4TAqcdI/SpRJ3hV0rF7pskw+W/eSzPhkiLccYSyui6bAgMI5f
         Gx8+aoKAd3Xb9Gmq6n7IGpprBKA6scMdWt5Xko1jxpbEKgjQmR0VIrR5BM2yPAOYbZhy
         XBxnl5/EG4mOXs0nwKDLOuxRlTcApQTNhPUZPWRFnrrZWicMIWcda3BNHAC4PZ6gAnuv
         60tjtYcUgTHUljDEScpekpmjAGwwi05LV/TUBLBMCNGlSiEz1zqWKE1/pW2TJtzcBzKq
         60hlqAQdTD/3YDDZ3segVY0lZSHkIF0trEqPSG+Q2lMaznGaeOb8nCs2SuZ7UQ2soXxK
         Rvkg==
X-Gm-Message-State: AOJu0YxggFeZs9ZPaUXwMCPa4pb7ubcaAuQHYxy8Ev79NgxBKme6S9Ye
	U/x9Z8XNFkTX4CTZTIjeJuPn0usmqEryvfCDQpzRdUhTrW+sBv3aODrMy7hw6Q==
X-Google-Smtp-Source: AGHT+IFxkegj2f76rFGC5TA+HjvIzgJJ5m0KDiJmJ4hEMDFtKn+Vrwc3pnPDsAiUD2hz/wf7p+MXvg==
X-Received: by 2002:a05:6000:2c6:b0:382:4b2e:d42d with SMTP id ffacd0b85a97d-38254b03e10mr1541019f8f.30.1732097167598;
        Wed, 20 Nov 2024 02:06:07 -0800 (PST)
Message-ID: <200086ff-9c4f-4f8a-ae20-598c04e5d887@suse.com>
Date: Wed, 20 Nov 2024 11:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vpci: Add resizable bar support
To: Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook> <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
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
In-Reply-To: <Zz2lgkjgRoZ7Sr5Q@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2024 10:01, Roger Pau Monné wrote:
> Secondly, the call to "PCI add device" is too late.  It works now
> because Xen scans for PCI devices, so those are already known and
> setup by Xen.  But if it's a hotplug device (or a device that somehow
> is not discovered by Xen at boot), doing the PHYSDEVOP_pci_device_add
> hypercall after sizing the device is wrong, the hypercall should be
> done ahead of Linux interacting with the device in any meaningful way.
> The checks done for device discovery are fine are obviously fine to be
> done ahead of the PHYSDEVOP_pci_device_add call.

Let's make the Linux maintainers more explicitly aware of this.

Jan


