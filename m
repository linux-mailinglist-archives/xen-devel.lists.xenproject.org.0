Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEyNCfuCe2mvFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:55:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C8AB1B2C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216789.1526719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUML-0006W3-9n; Thu, 29 Jan 2026 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216789.1526719; Thu, 29 Jan 2026 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUML-0006TR-7A; Thu, 29 Jan 2026 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 1216789;
 Thu, 29 Jan 2026 15:55:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlUMJ-0006TL-Sx
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:55:03 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df1785a4-fd2a-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 16:55:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso9776065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 07:55:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdd79c7sm129615085e9.2.2026.01.29.07.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 07:55:01 -0800 (PST)
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
X-Inumbo-ID: df1785a4-fd2a-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769702102; x=1770306902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aTYgaIwpD6zQ/VXsCYvzmWGHpgFMVj2e1rILg4BrlM4=;
        b=BX/eB0zrHAzFmOP/EbldqgtqLV03krJXa1PlPYAPP/57y9/0RDgWjckAfR2i+8iKHA
         dfTOlVlIyijlo0jyKXohoIGIkMOFCepMbM27BTw8H+rV+0fpq4BKIA2+W9nYtCaNu+oP
         GhuATF+9v/6ffrKrmRVA5p+ktcJy39GBhme26MRrvwJY641WySCaDfEss9BZ0ebhMLwB
         LV/6rvV/uyXjK+PpapQBvfCr0/KH1sTShGrucEzFgnSOVMHGJRjfB5vO7+03TPhMV+fs
         ceaBWx9UVJdISlrEx6bK9+W6oMTzTAAZzPZPnG4tEJ0zcR8QzXLyq3+mOU5baQ6SBLgr
         hy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702102; x=1770306902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTYgaIwpD6zQ/VXsCYvzmWGHpgFMVj2e1rILg4BrlM4=;
        b=aU9AY1C2NWLc36ZN4bSDINE7N+t/TjKcjQ2whv0WEitwT6Vdq1z3Ub5u/ygHOF2Czd
         DMiKBU5TwUZHhiqnnNkaO7XCGVSkfSAxqMARKRx4j+3M2eMrjnDjCpXqAVP4Z9OYTcc6
         jLgRiS2vIvfd8t7Cw4WOxzsTy5wV5IGGB4lIiSyIlF3GRHJLlz2TJioxk/ovCKQIAD1+
         kRdqVQufVYZor5py7c1zTznQoPfWnKM7xmDAYVcRqS3KBwtZAqeYKo0gx5xANMIgOXQa
         p7518J7lQg34IT1r31afG+aqno8bg+vTUIzrB5en2xQYxgDP0DF1zYSUXKDDf4icOZeY
         fVvA==
X-Gm-Message-State: AOJu0Yw9olejqLPlmS7+PLjYQJn/js0VmSfG3L3EaVJaizQEMDlNEiUh
	B7qv4Z6F9RGFhVT8UCxhNhKcgljqTKMLYAboAZOJyqHady2LHdDrzZJX09WI27FiPA==
X-Gm-Gg: AZuq6aK6lbhG9ZmFz6jRNyg+myozZ1ExwAa6tIn0BjGWb3z8R7M7pjvlCYodqf9w6WW
	SjfU01kmxmxjEiPuABrwUx/4FFnzj83ws2FnBblNk6nNtSx2NoFlu1N9qAGPNVotivlhyf0q8Ao
	oP+iyGvucHHW2rio3eMwI/Yms5gqAub8/bEHAYHvjCPsbvlVXIWmJTDUyUNzDAd5+mZ28NvIgF1
	cLTHr6RhnMo2oOT242qLEVVveX9bS2viGTBWKMCw9KL+ElCya1UboNSwluClU1PpIXNJXn6GjgE
	ENDMxrdnb/vVKOA2WFawjkv9bCIIEjI/IqUs1jbPRjIPgxDJYABW37lOghb/43k6MRzZtYiJcZ2
	nvuPyYH4sqydUl12LyPWscyPXPgPIv3BH4DNidshJuCX/yHxDPt4LcC9rWpEBDz91XkcHd37jEH
	vsRLWqZ+A89psWPdgo0PSwm/54kZXQU1/ZIK3vJ88d2rGPFUV7DKx9kc4uKjMpEvWhCS4AlBadI
	MFGASOSq7B/sA==
X-Received: by 2002:a05:600c:3595:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-48069c78bdamr129417605e9.22.1769702101820;
        Thu, 29 Jan 2026 07:55:01 -0800 (PST)
Message-ID: <45ea72d4-bbc6-49b9-8d29-d18876dd187d@suse.com>
Date: Thu, 29 Jan 2026 16:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] vPCI: re-init extended-capability lists when MMCFG
 availability changed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <d6f1c261-5af7-4fcd-b95f-af8baa67ba64@suse.com> <aXt_Z4INxG6fgsjx@Mac.lan>
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
In-Reply-To: <aXt_Z4INxG6fgsjx@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 85C8AB1B2C
X-Rspamd-Action: no action

On 29.01.2026 16:40, Roger Pau Monné wrote:
> On Thu, Jan 29, 2026 at 02:10:34PM +0100, Jan Beulich wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -869,6 +869,18 @@ static int vpci_init_ext_capability_list
>>      return 0;
>>  }
>>  
>> +int vpci_reinit_ext_capability_list(const struct pci_dev *pdev)
>> +{
>> +    if ( !pdev->vpci )
>> +        return 0;
>> +
>> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
>> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
>> +        ASSERT_UNREACHABLE();
>> +
>> +    return vpci_init_ext_capability_list(pdev);
> 
> Isn't this missing the possible addition or removal of managed
> extended capabilities?  IOW: on removal of access to the extended
> space the vPCI managed capabilties that have is_ext == true should
> call their ->cleanup() hooks, and on discovery of MMCFG access we
> should call the ->init() hooks?

Now I know why this felt too easy. Yet I wonder: Why is this done in two
parts in the first place?

Jan

