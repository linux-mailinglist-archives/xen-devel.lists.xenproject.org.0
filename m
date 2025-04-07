Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA3A7D5AD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 09:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939266.1339438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1grr-00073k-J4; Mon, 07 Apr 2025 07:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939266.1339438; Mon, 07 Apr 2025 07:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1grr-00071c-GT; Mon, 07 Apr 2025 07:26:03 +0000
Received: by outflank-mailman (input) for mailman id 939266;
 Mon, 07 Apr 2025 07:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1grq-00071P-5j
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 07:26:02 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dce4561-1381-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 09:26:00 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3996af42857so3204792f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 00:26:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a6608sm11105228f8f.23.2025.04.07.00.25.59
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 00:25:59 -0700 (PDT)
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
X-Inumbo-ID: 8dce4561-1381-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744010759; x=1744615559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9BxXJKK6p0Lu+dQH81lxBtaafHL8L1NP4hEUEvN6aG0=;
        b=Xrh8BvOkfNwCKV19aVbYbJrMEmrv/Q/EhK6G0fQ7Wv+GezEPSChzuBz0KZ8fFbGB4T
         whqp9PwTXZNQ0l6ixvkUdg5O0ILosuN3m2Bn0e0DSCymgexT4o6WmtAhufN8EtdOpkge
         l6SH5/E+X21LfLa3Yp5quSBZ6hnlblIIitOlnrzgnuHABRYQvnnZn1J/PB0a2QDEHqg1
         Ud7pkChWHTj7qgCOvkrbbDwsfDHLRB1Bi+IpOnjiaMzE6mwEEsypgKApjQHjt1Yy/l1M
         V6SphMcUZ8bw1QYHbUde2VkhydhHGa76Abf2ZJPrhhPscODZpADS01Z8K7LIiqfJxtNf
         rKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010759; x=1744615559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BxXJKK6p0Lu+dQH81lxBtaafHL8L1NP4hEUEvN6aG0=;
        b=VaR1TQrF28j+U9/+jc5+TSbpfS4eVLThUfhweGCYoyGVueA7JdvJ+Fa5tbwOnP9Tfk
         A2N7l6pa+G5/RT9NhtBE8gfOnQQ3ubQ1tD9VHLMZVWEHxyfaaTMscz8mpfi/eSWoyqMn
         2oT7VXK5mF9vHnQwpP41cv5zSF1qQejlMwQ9WzafzGgDhTAyTS20xBtQl1Oc04nAVIBE
         EM4PVkFWCrD6DLlSGrwaB4YIkFGy4qOrLK2j+5K/DIOwplbAXtUEzcZoQHE71md/LueZ
         OEk74DqeV/mcDpwGK6ylB5p+A7Y3uNSjyzoMi76OALl0/srUS3I4T8cMl+KeEBQcwmmw
         UVtQ==
X-Gm-Message-State: AOJu0YzVPw/TkkC4zwcQtNa91+99jsQr8i69NVQm9XBzam0Oj2s/WdpM
	XWM39ZvzwSRRseaETtcAO2qOKSmfXNCXnc9DwoQMSad5kehadVBxj/q8mekD4zXKVAW5HlilpXA
	=
X-Gm-Gg: ASbGnctRYUbV7iX+9wd/Z3pXCmBIFYKh/YMgYrG1+7C56gglDfYyV93KSTuXlWcMWlJ
	29RNU7+ZqtqQwAcLLJAcxi4gcQN84+rcbji4WrfHD0njCvIs/upcZ3KtNIFxY8ktKNKYWe9L4pG
	ykZv+NHb9J3RiUqVY5/EK4OLGRjeLiUqSjHBYJZSnUZMWt07Lx2ONLnPaeLSP6qOc9CvLl5iMcK
	EgRwdEmOzL97+AaC95kYy9DoDhw8K7s4/roHQKtXb/rvQbK6QEllzMgTXwRr8kdeHavmyEtXuST
	mSrNpumjzXJmh7XAih5nbADTAhJ7TAgBS2esJHeGb3OYxRtJr1Y+pu95Oj8HzjkRF1mq64Ku5Ar
	I6lmr3AkXldk/UCZQN2Il5EQYf4s6MQ==
X-Google-Smtp-Source: AGHT+IGLcVSIPEA/leRSOrj2tUdLK2DdQ/44jtENybsTNOSW1MYR+IkKAeJhTmKFAz0d8fuMDRWd9A==
X-Received: by 2002:a05:6000:22c5:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-39c2e6518a9mr13793696f8f.19.1744010759526;
        Mon, 07 Apr 2025 00:25:59 -0700 (PDT)
Message-ID: <7e5fe92d-4f67-4413-aa72-5771f8d61570@suse.com>
Date: Mon, 7 Apr 2025 09:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67f26722e020c_13a342abaf9ddd9a0513e7@prd-scan-dashboard-0.mail>
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
In-Reply-To: <67f26722e020c_13a342abaf9ddd9a0513e7@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.04.2025 13:36, scan-admin@coverity.com wrote:
> Hi,
> 
> Please find the latest report on new defect(s) introduced to XenProject found with Coverity Scan.
> 
> 1 new defect(s) introduced to XenProject found with Coverity Scan.
> 
> 
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
> 
> 
> ** CID 1645644:  Control flow issues  (UNREACHABLE)
> /xen/arch/x86/hvm/vmx/vmcs.c: 774 in _vmx_cpu_up()
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1645644:  Control flow issues  (UNREACHABLE)
> /xen/arch/x86/hvm/vmx/vmcs.c: 774 in _vmx_cpu_up()
> 768             vpid_sync_all();
> 769     
> 770         vmx_pi_per_cpu_init(cpu);
> 771     
> 772         return 0;
> 773     
>>>>     CID 1645644:  Control flow issues  (UNREACHABLE)
>>>>     This code cannot be reached: "vmxon_fault:
> if (bios_locke...".
> 774      vmxon_fault:
> 775         if ( bios_locked &&
> 776              test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
> 777              (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
> 778               !(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX)) )
> 779         {

Is this perhaps an indication that Coverity doesn't understand asm goto()?

Jan

