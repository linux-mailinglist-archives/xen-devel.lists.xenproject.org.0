Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83625ADC29B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 08:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017745.1394740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQCh-0001tA-FE; Tue, 17 Jun 2025 06:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017745.1394740; Tue, 17 Jun 2025 06:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQCh-0001qz-CX; Tue, 17 Jun 2025 06:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1017745;
 Tue, 17 Jun 2025 06:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCXm=ZA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uRQCg-0001qt-4n
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 06:53:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d45c299e-4b47-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 08:53:52 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C8A064EE7C1C;
 Tue, 17 Jun 2025 08:53:51 +0200 (CEST)
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
X-Inumbo-ID: d45c299e-4b47-11f0-a309-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750143231;
	b=gZfktH5TiOXRPiSsNnIcawv9QwZjwTdA9ZSRmmzunsqe52jOGk33n/lE/I7+F6UnMdSh
	 wT/WemMC3qJORpmc1B5+9VVIjnAjvSejytAruHgkpVB98OltAbS+fOfGFmVzAH3IzFJLD
	 iXfiFKTzACD4KZMbC1LmKiMTegMFNH1mWpYfC5XmOyRIluPiXrpOpBd+Ynprae/V+tlHB
	 3KhjXwolbFF9LRqIxlZLAQiG2o2OgmquVNyz9Ug6KKMMy6axA0i3Q1aoWLlV7iI8ZYOjJ
	 RzFixUasbrWyaKhm1fP2Vn5Zqj2lXGPS7fY335bOTrDXugIEib68hfFdbwturb2JjMNAW
	 UI6HZcSudyUWbHcUkXt+EZmh1L+US08TwGPtAnzMNj5pkneDCEpoAurau15IW9scpRXYr
	 R4tgZf+sosQQaZcvNA/8UTaZU7RPgfJpu2Ym/47p/dz45WFi4toWaKuNRMHS98BDOdGty
	 pxXLHa6yHQtu583x72kfLqSdVFJjS6SZJM4HhO4i9DvgRM50eanCMcA8m2OnMXxwmxDc/
	 ZDRkKgEKhHyHZgzaMQv3O+PBsEFthbE3PF7MCch8zVFT7FO/dUy5CjT/eqSuW5YJU8FrX
	 UxChwkpP/LlzUjEfhQDem2NDKQeN0gFqU7Iaw+H8VjRe8sIZ7zDZFsCNDtw+294=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750143231;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=S03k3Fmg7265fhYKh78nbXNwDP7Tiwoipxv7pXiHa1Q=;
	b=WwFcghydvrwBu46H5sBI7e8W1jezRKS7i6rPEVk1bafM9hOIOBf/b2pioeOFKD+lEoL+
	 znE1jdYBzWZHO4F9r3Ix9G9PGFMbZhJj//njk2VN7dAh5QI1ewVRkyp59H9IZiq/gsuq7
	 EPwl1rLObOXLj0/F59uJEdxdRxu6O9LFuGgaBDgEp3VSSa0K6f1YDr9IadAX9piuDb6wg
	 61tZoTKzOU+EcoJUzxA+zIxwE5x4jlrrpPzyptRKcST8s8Mgqu201s2/rK3QTihvKrNTx
	 YjOfQ4o1qVGKIEWTYOFtJwfgZsGgaljWqQeiBnknAclGcPsO5fViN+RCEmIwKuov1yIAJ
	 x1w5euFNNDFQmlLUGpMTtL2mITfVAN8W3cDr7QUTzLdiOPouTCGE1XDtYJrV9B0FWQVNM
	 Ld34M+a9uaSoQdkca4R1qpWSTLyPbcIdSQRXWu4v7S9+hHcdZ9Ksgak6HM/MelF0/sk1V
	 9VfVWMOUCVZFp9jbCLOzGFT+Kv4z9cRmCwdA5Aj2z0NsZLF8/9bgbKxHXtMwTOysH3e1u
	 7nUxpj7o4AaZ0ROgQjDmEUIV27ZehRNd6Rs9nzlFzSXFKlZlxr7KdIhJ8e1K8qC6fc8Zk
	 BcrHYxCMVFarZ9/wcTn6cYAghJI+3QXR9zfgfr5rGq148hl/BESGG3a4A2tLRtg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750143231; bh=/nJ/eYz09zkR/gCLYXtdlWHqP/b6YHgk+W4MIan9/lM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=opWKoyFY8Qavl0RdwcfzCoUnjVqDBMO+QVnDmRSPkz6u7J8Jvu5KekA85n97vMV5l
	 Fq0nkoaRBgSNFIuGTiyXCQUeeSh3mfz0SWqwoUa9IQcOe+mosOKIfiweXihJckilxz
	 iwblcu0gfSKcOQQf0XPbALqHlsByjnTgTIEggczjQKkr1xMb0wUqfLpk4FGi5uO8m9
	 aaw1I/3ud5de3DoCMZyksudiwA78Sz6BiGOLp5lErr41tCi6TxRSsN8wn4d54hTzEP
	 MJi1/YEHNhV9IVebMlFzJM4QmF1NogiHVE7VPICUjQfqVkxc/imxja8BgmXOGfnmtq
	 q/wPaRgF2m/Vg==
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 08:53:51 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, roger.pau@citrix.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8] xen/domain: rewrite emulation_flags_ok()
In-Reply-To: <a8471943-ebf3-4b45-80bd-51bff5498ed2@suse.com>
References: <20250617011519.55386-1-dmukhin@ford.com>
 <a8471943-ebf3-4b45-80bd-51bff5498ed2@suse.com>
Message-ID: <dff6968c29274374d32c01baed7ca806@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-17 08:19, Jan Beulich wrote:
> On 17.06.2025 03:15, dmkhn@proton.me wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -743,32 +743,75 @@ int arch_sanitise_domain_config(struct 
>> xen_domctl_createdomain *config)
>>      return 0;
>>  }
>> 
>> +/*
>> + * Verify that the domain's emulation flags resolve to a supported 
>> configuration.
>> + *
>> + * This ensures we only allow a known, safe subset of emulation 
>> combinations
>> + * (for both functionality and security). Arbitrary mixes are likely 
>> to cause
>> + * errors (e.g. null pointer dereferences).
>> + *
>> + * NB: use the internal X86_EMU_XXX symbols, not the public 
>> XEN_X86_EMU_XXX
>> + * symbols, to take build-time config options (e.g. CONFIG_HVM) into 
>> account
>> + * for short-circuited emulations.
>> + */
>>  static bool emulation_flags_ok(const struct domain *d, uint32_t 
>> emflags)
>>  {
>> +    enum domain_capability {
>> +        CAP_PV          = BIT(0, U),
>> +        CAP_HVM         = BIT(1, U),
>> +        CAP_HWDOM       = BIT(2, U),
>> +        CAP_DOMU        = BIT(3, U),
>> +    };
>> +    static const struct {
>> +        enum domain_capability caps;
>> +        uint32_t min;
>> +        uint32_t opt;
>> +    } configs[] = {
>> +#ifdef CONFIG_PV
>> +        /* PV dom0 and domU */
>> +        {
>> +            .caps   = CAP_PV | CAP_HWDOM | CAP_DOMU,
> 
> Just to double check - are we sure Misra / Eclair will like this 
> (ab)use
> of an enum?
> 
> Jan

Likely not, but x86_64 is build with CONFIG_PV=n

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

