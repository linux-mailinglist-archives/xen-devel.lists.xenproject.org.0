Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA89BAD64
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 08:45:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829836.1244738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7rlY-0003pp-VE; Mon, 04 Nov 2024 07:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829836.1244738; Mon, 04 Nov 2024 07:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7rlY-0003nU-SH; Mon, 04 Nov 2024 07:44:48 +0000
Received: by outflank-mailman (input) for mailman id 829836;
 Mon, 04 Nov 2024 07:44:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t7rlX-0003mb-Mg
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 07:44:47 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7a09459-9a80-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 08:44:43 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so34051035e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 Nov 2024 23:44:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9faesm174653905e9.35.2024.11.03.23.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Nov 2024 23:44:42 -0800 (PST)
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
X-Inumbo-ID: a7a09459-9a80-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE3YTA5NDU5LTlhODAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzA2MjgzLjI1OTM0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730706282; x=1731311082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dvawDXgZOaPenTHuDlzYJvZvfwUCcdOUgb2gjkIRDa8=;
        b=VbZ9828OJjKPBOJeap2Osq756CuhGDGpjz8DuXGCp6BXvusdTLDpoLAmDc9+Bq8IbL
         WByWPsRvq9KYJ3sH+7/mOAsH5QuY8OS0mnqb7R9mzUlwqRJbbQU+aFjgx+s/orXDurQP
         Dr1cvcOpYsOYK2SJ44uX5HaDzm5Aha0fClxf2mpnI6ZhTZ3QD4s/DSg3TttWAIwatWL1
         7CbW/pIVcWiPoLDGC4mx1FhfY+zyjUOlj4CAZp4+4Iylf4Fk/8AuIsNgj5WTXmYoTfwy
         tgI9kPY11kMn0CVHO+EZ+Vd5PLrqd9HdjFAU8xS6dWYDXFRIvZVxZr6eG5RVQRW84ZNi
         j/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706282; x=1731311082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvawDXgZOaPenTHuDlzYJvZvfwUCcdOUgb2gjkIRDa8=;
        b=XK7Zh8OAXxvibS6EIh3t09DQ54eSgJmDsMO0Vc2HMWiyfTbP6/zwb+jSijteoZd7Vc
         FUbVl+7zJmX07E+F6orvOS5m2jXa1lbOkJxOq6MlBlOFGeB81zus2FiG93kZ7eFBuxZf
         XQqpRQZtWGDjX/ZP0Adrdr7InFYy1iAga351rzINPJsNV7Xt5xrE/zU5bVqmWi0V9lJi
         /uISxbW9gW2uvi23IhpkGMidMvfvwotXxKYlE+e3HyruUh7s0apDzL1wEIiULq+7wsFl
         RY6YE4ZPe7T+TWnBPEpB1pJBDs/E9f3GoOvq3pEkG5SWAiTeq1TUutxHLFqDJ4BkYHen
         ILEg==
X-Forwarded-Encrypted: i=1; AJvYcCU3TuuMxNE4JmfEBnd1TL6nYaKdVolYgNaCw5NIqF9xtp6HgGkPvQTDVMMS/Hxlqz+oJa98xxmrMhA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdQCtCLTJjbItM0K/dkweSYUYAEjpRyLE+e42jW0f/jDF8pISS
	Dh8BStezZGuKLLew5PMfrCFWe6kp4DigogOfGhScqiv3n8uuhqB3xy7gGhpETw==
X-Google-Smtp-Source: AGHT+IEkgi0YgAz7Ak7ukKkYl4cVUICKYLDFW4o8IJkBEBezQF1kgdihGVRWY+rZ/UhqeKWCJo7LJQ==
X-Received: by 2002:a05:600c:54ed:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-4327c08d430mr110826785e9.23.1730706282612;
        Sun, 03 Nov 2024 23:44:42 -0800 (PST)
Message-ID: <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
Date: Mon, 4 Nov 2024 08:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
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
In-Reply-To: <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.11.2024 21:16, Stewart Hildebrand wrote:
> +Daniel (XSM mention)
> 
> On 10/28/24 13:02, Jan Beulich wrote:
>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>> Add links between a VF's struct pci_dev and its associated PF struct
>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>> dropping and re-acquiring the pcidevs_lock().
>>>
>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>> VFs may exist without a corresponding PF, although now only with
>>> pdev->broken = true.
>>>
>>> The hardware domain is expected to remove the associated VFs before
>>> removing the PF. Print a warning in case a PF is removed with associated
>>> VFs still present.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>
>>> v5->v6:
>>> * move printk() before ASSERT_UNREACHABLE()
>>> * warn about PF removal with VFs still present
>>
>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>> just after an adjustment to the commit message. I'm instead actively
>> concerned of the resulting behavior. Question is whether we can reasonably
>> do something about that.
> 
> Right. My suggestion then is to go back to roughly how it was done in
> v4 [0]:
> 
> * Remove the VFs right away during PF removal, so that we don't end up
> with stale VFs. Regarding XSM, assume that a domain with permission to
> remove the PF is also allowed to remove the VFs. We should probably also
> return an error from pci_remove_device in the case of removing the PF
> with VFs still present (and still perform the removals despite returning
> an error). Subsequent attempts by a domain to remove the VFs would
> return an error (as they have already been removed), but that's expected
> since we've taken a stance that PF-then-VF removal order is invalid
> anyway.

Imo going back is not an option.

> While the above is what I prefer, I just want to mention other options I
> considered for the scenario of PF removal with VFs still present:
> 
> * Increase the "scariness" of the warning message added in v6.
> 
> * Return an error from pci_remove_device (while still removing only the
> PF). We would be left with stale VFs in Xen. At least this would
> concretely inform dom0 that Xen takes issue with the PF-then-VF removal
> order. Subsequent attempts by a domain to remove VFs, however
> (un)likely, would succeed.

Returning an error in such a case is a possibility, but comes with the
risk of confusion. Seeing such an error, a caller may itself assume the
device still is there, and retry its (with or without having removed the
VFs) removal at a later point.

> * Return an error from pci_remove_device and keep the PF and VFs. This
> is IMO the worst option because then we would have a stale PF in
> addition to stale VFs.

Yet this would at least be self-consistent, unlike the variant above. No
matter what, any failure to remove VFs and/or PFs correctly will need to
result in there being no attempt to physically remove the device.

You didn't enumerate an option lightly mentioned before, perhaps because
of its anticipated intrusiveness: Re-associate stale VFs with their PF,
once the PF is re-reported. Problem of course is that, aiui, the VFs
could in principle re-appear at a different BDF (albeit we have other
issues with potential bus-renumbering done by Dom0), and their count
could also change.

Jan

> [0] https://lore.kernel.org/xen-devel/20240827035929.118003-1-stewart.hildebrand@amd.com/T/#t


