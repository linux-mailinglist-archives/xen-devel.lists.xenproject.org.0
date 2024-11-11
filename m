Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B39C3886
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 07:40:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833344.1248474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAO60-0001cC-Rw; Mon, 11 Nov 2024 06:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833344.1248474; Mon, 11 Nov 2024 06:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAO60-0001aI-PP; Mon, 11 Nov 2024 06:40:20 +0000
Received: by outflank-mailman (input) for mailman id 833344;
 Mon, 11 Nov 2024 06:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAO5z-0001aC-JF
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 06:40:19 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfb97d57-9ff7-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 07:40:16 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so2378671f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 10 Nov 2024 22:40:16 -0800 (PST)
Received: from ?IPV6:2003:ca:b721:c835:8cf8:ed41:9b27:a44e?
 (p200300cab721c8358cf8ed419b27a44e.dip0.t-ipconnect.de.
 [2003:ca:b721:c835:8cf8:ed41:9b27:a44e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0562860sm164895095e9.22.2024.11.10.22.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2024 22:40:15 -0800 (PST)
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
X-Inumbo-ID: cfb97d57-9ff7-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNmYjk3ZDU3LTlmZjctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzA3MjE2LjYwMDA0OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731307216; x=1731912016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh02vnXRa68asDEXybC1H0gsMPnXuyX3wnjfBuhi6gs=;
        b=LxKh6txmLwwpwajvVJxzzmOFpBRMO75mT753EcGaHWG0HupY/jn6/n2Mml3x1PbvJE
         zvbZ8yml6CAMIgLpG1iSOUjan0b5Ybb3DAxIhwrDv4X9iflbKARL1pJWNgZYdTiMU3WR
         3ALix38OmLg9yGZIBiBzvx7gL7sljfR4iwSdwKgupnuJmP9zCNKeOg/2lZrSO8xMfGye
         oEPDkh5Uuj5TJ93NxOhaogGRgKBa4BlkeNuz3OjBu/9jk9Jms/mQdr1n2DrBSKl6j2NJ
         TNanRo5YnuMPe5DbtQ6DOric+FYsxXYIY3JwKU90pqMej3Age7ZI/eNeliW/CvNkKqOT
         Fyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731307216; x=1731912016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh02vnXRa68asDEXybC1H0gsMPnXuyX3wnjfBuhi6gs=;
        b=QXluaxZGxvbSmVujRolNmXIFCj66bYYbABG8CV+VpkT/RvWFBgoh+dqBXqGUtumFmg
         wz8TkrM3jzLMh4/iFV518E0aK+J9LeC0NZXjin9ZbPhVlZqAKBpUP4xlowJkqBxda6Ds
         +jx/2NqsgQvdH0t9+bt+ekqsG9Kui1f+H/ZbF50+MnZqPQRrAKeANg1om3dBWzK8RQuW
         fp2fNs3xxBH04RbS0cltEg8TijKZhINShi3mFceUpt+yNTaprw+SoSPHJIi0ZELN819t
         x0iIlDMBF8dT8+oIrmBU2BYRfkeTMaXqn8OLCozJCyjidmu2LzMBjvLFmmWSiiSP/P+8
         q9+g==
X-Forwarded-Encrypted: i=1; AJvYcCWjjzOt9qtxwgnWJNdD3NuoKKMciBvnNnON/ob/P8foLg+FtOsBdDr3yPWf1ukE1jAuz/8ZgU1b5xk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3dLyTkXa2WAeJ/Rg0evsMMF45FDMK3nvMuYrUHaXRPTpfGJ63
	8Ce4gguEKlrpRCf4oOJwHhoSl/QCxJKJVZRdDZiABPn45asWeCoocTZhau4+2w==
X-Google-Smtp-Source: AGHT+IFqwekx/8WyiE72idn3H3XNbQ9XQ8Cw0x3Cu3sliV0c5qeeq3cxuVFpycEs9XoIwoN7SZ/zwA==
X-Received: by 2002:a05:6000:2c1:b0:37d:238:983 with SMTP id ffacd0b85a97d-381f186b4b2mr10424443f8f.22.1731307215728;
        Sun, 10 Nov 2024 22:40:15 -0800 (PST)
Message-ID: <479d7430-ca30-4d72-b636-b47e5a2356f4@suse.com>
Date: Mon, 11 Nov 2024 07:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
 <D5GT0NR29WEF.216KE5GCTH1TL@cloud.com>
 <39b2a334-1298-4e83-b7b7-393c79964539@suse.com> <Zy4sG915LicXNmIV@macbook>
 <ec9dd718-ef25-4a23-8080-8081ef2facb9@amd.com>
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
In-Reply-To: <ec9dd718-ef25-4a23-8080-8081ef2facb9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.11.2024 17:29, Stewart Hildebrand wrote:
> On 11/8/24 10:19, Roger Pau Monné wrote:
>> On Fri, Nov 08, 2024 at 02:17:40PM +0100, Jan Beulich wrote:
>>> On 08.11.2024 13:42, Alejandro Vallejo wrote:
>>>> On Mon Nov 4, 2024 at 7:44 AM GMT, Jan Beulich wrote:
>>>>> On 01.11.2024 21:16, Stewart Hildebrand wrote:
>>>>>> +Daniel (XSM mention)
>>>>>>
>>>>>> On 10/28/24 13:02, Jan Beulich wrote:
>>>>>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>>>>>>> Add links between a VF's struct pci_dev and its associated PF struct
>>>>>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>>>>>>> dropping and re-acquiring the pcidevs_lock().
>>>>>>>>
>>>>>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>>>>>>> VFs may exist without a corresponding PF, although now only with
>>>>>>>> pdev->broken = true.
>>>>>>>>
>>>>>>>> The hardware domain is expected to remove the associated VFs before
>>>>>>>> removing the PF. Print a warning in case a PF is removed with associated
>>>>>>>> VFs still present.
>>>>>>>>
>>>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>>> ---
>>>>>>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>>>>>>
>>>>>>>> v5->v6:
>>>>>>>> * move printk() before ASSERT_UNREACHABLE()
>>>>>>>> * warn about PF removal with VFs still present
>>>>>>>
>>>>>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>>>>>>> just after an adjustment to the commit message. I'm instead actively
>>>>>>> concerned of the resulting behavior. Question is whether we can reasonably
>>>>>>> do something about that.
>>>>>>
>>>>>> Right. My suggestion then is to go back to roughly how it was done in
>>>>>> v4 [0]:
>>>>>>
>>>>>> * Remove the VFs right away during PF removal, so that we don't end up
>>>>>> with stale VFs. Regarding XSM, assume that a domain with permission to
>>>>>> remove the PF is also allowed to remove the VFs. We should probably also
>>>>>> return an error from pci_remove_device in the case of removing the PF
>>>>>> with VFs still present (and still perform the removals despite returning
>>>>>> an error). Subsequent attempts by a domain to remove the VFs would
>>>>>> return an error (as they have already been removed), but that's expected
>>>>>> since we've taken a stance that PF-then-VF removal order is invalid
>>>>>> anyway.
>>>>>
>>>>> Imo going back is not an option.
>>>>>
>>>>>> While the above is what I prefer, I just want to mention other options I
>>>>>> considered for the scenario of PF removal with VFs still present:
>>>>>>
>>>>>> * Increase the "scariness" of the warning message added in v6.
>>>>>>
>>>>>> * Return an error from pci_remove_device (while still removing only the
>>>>>> PF). We would be left with stale VFs in Xen. At least this would
>>>>>> concretely inform dom0 that Xen takes issue with the PF-then-VF removal
>>>>>> order. Subsequent attempts by a domain to remove VFs, however
>>>>>> (un)likely, would succeed.
>>>>>
>>>>> Returning an error in such a case is a possibility, but comes with the
>>>>> risk of confusion. Seeing such an error, a caller may itself assume the
>>>>> device still is there, and retry its (with or without having removed the
>>>>> VFs) removal at a later point.
>>>>>
>>>>>> * Return an error from pci_remove_device and keep the PF and VFs. This
>>>>>> is IMO the worst option because then we would have a stale PF in
>>>>>> addition to stale VFs.
>>
>> I'm thinking probably this is the least bad option, and just force the
>> owner of the PF to ensure there are no VFs left when removing the PF.
>>
>> What sense does it make anyway to allow removing a PF with VFs still
>> present?  Not sure exactly what the owner of the PF will do before
>> calling pci_remove_device(), but it would seem to me the device should
>> be ready for unplug (so SR-IOV disabled).  Calling pci_remove_device()
>> with VFs still active points to an error to do proper cleanup by the
>> owner of the PF.
> 
> In normal, correct operation, right. The PF driver is indeed expected to
> disable SR-IOV (i.e. remove VFs) during its removal, prior to calling
> PHYSDEVOP_pci_device_remove for the PF.
> 
>> Returning error from pci_remove_device() and doing nothing would seem
>> fine to me.  There should be no stale PF or VFs in that case, as the
>> caller has been notified the device has failed to be removed, so
>> should treat the device as still present.

Imo really that's another case that would best be addressed by proper
ref-counting. Each VF would hold a ref to its PF, and hence the PF would
go away when the last VF is removed, or when PF removal is (properly)
last. Just that this likely is too complex a change to be warranted for
the purpose here.

> But software has no way to guarantee there won't be a physical device
> removal.
> 
> In test scenario #2 described in the first patch [1], the PF (the whole
> device, actually) has already been physically unplugged, and dom0
> invokes PHYSDEVOP_pci_device_remove to inform Xen about it.

I don't think that's how it's supposed to work. Physical removal should
occur only after software has done all "soft removal". I'd view the
notification to Xen as part of that.

Jan

> [1] https://lore.kernel.org/xen-devel/20241018203913.1162962-2-stewart.hildebrand@amd.com/
> 
> That said, test scenario #2 would only happen when a buggy PF driver
> failed to properly clean up the VFs before the PF. But the point is that
> returning an error does not guarantee there won't be a stale pdev in
> case of a buggy dom0.
> 
> I guess as long as we trust the owner of the PF, this approach is fine.


