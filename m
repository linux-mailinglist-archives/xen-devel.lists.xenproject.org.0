Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOduKaRBqWkZ3gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:41:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849E20D994
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246295.1545501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4G6-0000vP-Iu; Thu, 05 Mar 2026 08:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246295.1545501; Thu, 05 Mar 2026 08:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4G6-0000tj-Fy; Thu, 05 Mar 2026 08:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1246295;
 Thu, 05 Mar 2026 08:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy4G5-0000td-0G
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 08:40:37 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa5390f3-186e-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 09:40:35 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso2989290f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 00:40:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abdf5430sm38025527f8f.5.2026.03.05.00.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:40:34 -0800 (PST)
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
X-Inumbo-ID: fa5390f3-186e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772700034; x=1773304834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TKw83thhZwmgNZhCPSgiFZE6zAnl4nn7a0lA8g2gzBs=;
        b=DNDbI+In282ONKhXXVRLncQmRpVOAjREaCYbeYtf6dXJ2w2aXNE/99FvVF/5vkDnWJ
         ngA0sm4AMehGS3nFT4K7EAcqxGDaxKPuilgfKU9erIXH7vMA7k3e6mW8edSe2bu86Crd
         J/0VBBNveM0IGE7fXS4MHKxQn+NXdADs9aEXw5MydVtFHZxNnbOTtjKoDEE1d48rfPzD
         RRrW/VnM2H4VKvQkoPqkDsOwnRb7NCMv5loOlg6y6HHwYyf10tlQ9gOAIDvguB8j/ZkJ
         7Dm7VXzbs7PJdHm7g10khSQN/w9oaopoBomE2z1UsCKizv36vj4NnvwCVK4F5ik8Ktzz
         +YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700034; x=1773304834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKw83thhZwmgNZhCPSgiFZE6zAnl4nn7a0lA8g2gzBs=;
        b=tJes4Wcy3uZRzz5lfyqGPcxLZKgu06Fh79PiHL74U7172bOdIPzTJB3USj0hN/JzKx
         IYhXa/NWyLNxE9qcOX6vUAN+qJtMMbHWO5FZ643RzlyoXSDIfxwLhiGbC6nSJ/+KHE/D
         Oa47OgKu0Goq8OTV+mz5nW8qdUwNDX6cR/wpjT0luCuKf8uGPlfR4yM+5tt/SIS6WaWo
         Dc7WbmnzC2gd6R0nX9ZOfFMA7PWYitPvaZeVxbQs4grQFIFXm6uAU5d03wNFwrgD6jVa
         Bslm63BrM+819PJlvqmSgrC5T/eWqj8q8y3sX7OC895ciicOJ9/TTC+0pqKSaDQFM4S2
         mdfA==
X-Gm-Message-State: AOJu0YyhAxoza5TLEWqVW80f6jBKvQnE2Ej+XQXakOnWgGbFCEb5ATnN
	4AJbMylTTkLSkH6z2F7XmeEiDGsz1udv6204peAgC9nWGvBelyFlPNGObveAYJsQDBZFR8ucTdS
	D3rk=
X-Gm-Gg: ATEYQzyBuMlNSvBy2DLhyqFR73MLiYbTi1W7k7+WJwOk1voFY6fFZR6unFDlJHhDOgl
	C+LPy1wMlbVprkq8ERTdiBYsbTbZbgP6/OOuXhavvvOrxjShudTFzEy4w08GmwpDrCk0LApplJH
	ZC0MyfsvwRxh/H5vv+kI1P7e+vt4fepcJO6hFw+iLq3i+0uaOCOUvYpbVpfBZmltZaZ33nCWfiz
	MJyDH8Tq1R8yx03Fz7MrxUtxfqT9bXT/6e8AKkOkW9ldbYymqn0Ybyg4mwQBSuPiesl7VRycVvA
	FYdLsOThTKBTRlBAPqKmrXJr9oWgIQTN2X5jxdy3Ym4Md4oLY8+Fln/HRNDBLo9yN4afyupXAZg
	1i7+5VYPcURlvLeB4/c5GFcDynXnUy75Q8Zzp9Hi/E4DwK1DGDf94Crt1s/a8pSicWYFV+sNCH1
	sFlMrl4+1MUyanqJLCmoyhOImH/c53mL7Z8n/QL2gEDS77/si6CDtZqHo87/kmLgyjsTqwg26M/
	kGhbIeeNohVRNg=
X-Received: by 2002:a05:6000:144f:b0:439:afd8:621c with SMTP id ffacd0b85a97d-439c801fb47mr8541014f8f.55.1772700034404;
        Thu, 05 Mar 2026 00:40:34 -0800 (PST)
Message-ID: <5a16e95b-25a5-477d-8445-4843d2fba576@suse.com>
Date: Thu, 5 Mar 2026 09:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
 <aahKkV2csf28Y0YC@macbook.local>
 <7d7b75b7-80c4-4c23-8678-b33f4c90132c@suse.com>
 <aahjn-NXjmC2A-_v@macbook.local>
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
In-Reply-To: <aahjn-NXjmC2A-_v@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1849E20D994
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 17:53, Roger Pau Monné wrote:
> On Wed, Mar 04, 2026 at 04:39:00PM +0100, Jan Beulich wrote:
>> On 04.03.2026 16:06, Roger Pau Monné wrote:
>>> On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
>>>> @@ -349,22 +352,23 @@ int vpci_init_capabilities(struct pci_de
>>>>      return 0;
>>>>  }
>>>>  
>>>> -void vpci_cleanup_capabilities(struct pci_dev *pdev)
>>>> +void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
>>>>  {
>>>
>>> You could short-circuit the function here, ie:
>>>
>>> if ( ext_only && !is_hardware_domain(pdev->domain) )
>>>     return;
>>>
>>> But I'm not sure that would simplify the code of the function much?
>>> Likewise for vpci_init_capabilities().
>>
>> Such a short-circuit would need replacing / dropping once DomU support is
>> added. I was hoping the chosen arrangement would make for a little less
>> churn at that time. I'll listen to your advice, though, just that the
>> question gives the impression you're not quite sure either.
> 
> Yeah, I wasn't fully sure.  IT would be nice if we could add those
> short circuits now, and then once domU support is in place we just
> remove teh shortcuts and it works for domU also.  But I fear more
> changes will be needed anyway, at which point the short-circuit is
> not that attractive to use.

As per your other request (calling ->cleanup() even for DomU-s) the use of
is_hardware_domain() would go away anyway, and the function would be ready
for use for DomU-s as well.

>>>> +
>>>> +    vpci_cleanup_capabilities(pdev, true);
>>>> +
>>>> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
>>>> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
>>>> +        ASSERT_UNREACHABLE();
>>>
>>> Ideally this would better be done the other way around.  We first
>>> remove the handlers, and the cleanup the capabilities.  Just to ensure
>>> no stray handler could end up having cached references to data that's
>>> been freed by vpci_cleanup_capabilities().
>>
>> And maybe not just that: For the hwdom case cleanup_rebar() adds new handlers,
>> which we'd wrongly purge again right away. (Because we pass "false" for "hide",
>> this isn't an active issue right now.)
>>
>>> And we should take the write_lock(&pdev->domain->pci_lock).
>>
>> Now this is a request that I'm struggling with some. I can see that callers
>> of vpci_{init,cleanup}_capabilities() assert that the lock is being held, yet
>> it's not quite clear to me why that's needed. Shouldn't vPCI internals all
>> synchronize on the vPCI lock of the domain?
> 
> Right, the callers of the handlers already hold the locks, and the
> removal of the handlers should also hold the locks.  The point of
> taking the d->pci_lock is to avoid the device from being removed
> while there are vPCI accesses against it being done.  The vPCI lock is
> fine for vPCI internals, but functions that deal with addition or
> removal of devices need the d->pci_lock to avoid races with possibly
> freeing pdev->vpci while in use.
> 
> I think you are right, and for the usage here (that doesn't add or
> remove pdev->vpci itself), the internal vPCI lock should be enough.

Well, we could take two positions: Either we say that as we're being called
from a context where the PCI device is being operated on anyway, we can
assume it can't go away. Then no further locking would be needed here. Or
we want to explicitly guard against that, in which case (seeing that
nothing is added / removed), d->pci_lock may want read-locking?

Jan

