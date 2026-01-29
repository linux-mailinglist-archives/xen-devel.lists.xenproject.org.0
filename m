Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPo/GGMXe2lCBQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:16:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B64AD5DC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216137.1526098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNBj-0001Eu-9Y; Thu, 29 Jan 2026 08:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216137.1526098; Thu, 29 Jan 2026 08:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNBj-0001CT-6P; Thu, 29 Jan 2026 08:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1216137;
 Thu, 29 Jan 2026 08:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlNBh-0001CN-Jj
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 08:15:37 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af350f41-fcea-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 09:15:34 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so571329f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 00:15:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce70sm13016105f8f.27.2026.01.29.00.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 00:15:32 -0800 (PST)
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
X-Inumbo-ID: af350f41-fcea-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769674533; x=1770279333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g7n14DybuDZFk1lYIVthCzYJ147OpqhxxgWowMwjFnc=;
        b=QA2XBTYPCR4V9xGyfV4pXZK7ABQ/ynjjCdwkbqSsz3dCPz2JyFmaVI7RTJnf+fhxsm
         P+xwoXsapFXhM5NipJMpbruOqOnCoS8B6aVRpa6+srYI1i2B2IJKm9AKTfqge4n5qFTX
         5IakEwL4hJ8hUIywZd4rdirw12E7hIkBwqnuuq3/FnuhUT7IwNHqtjnADwpN8J6YucG7
         5U5ezh4wCv9qboVRW+vF9eaLlMBY9eC8IOti1Cu+uz1S+exzPKQy248lCPAHTCb9axLb
         Ftmjy0KxVbsX70Mb/VbgXm/ai8mtMMfWN1pWSUeU1vRnvrMG+dkBYCwLixW1knrC3lPK
         ym2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674533; x=1770279333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7n14DybuDZFk1lYIVthCzYJ147OpqhxxgWowMwjFnc=;
        b=aOkbzqn3iHQCMB9PnU+yRyF/Kgbi2M46bhi133d/3uUEOluV+2idbt50nAVxrBZwL0
         X5QTwJrdgZTYi8vc0IyqGw5mfOZSxR4vH0s6fJd7k155Nq5a6FNY48iGzeuAjSqzUgGY
         ERUmHANUq54sUeQdr2DqCkpckvFIcd1JzTjV6YnlYvMbmTPWsWhEs/+48C1EYFJdt5Ay
         toeQcw1ZALk3BQG+FBIr3wdjr6/OjHi896B8ICr386fRzcsUYfxZPcdJlbdmmm98bTUl
         C9+VzprV7pUGjNhYF/rycJgKPpMhU6OZoOFNvGR5hg3Ak/sXj0LWtLMLoZdYsFJ7gyJf
         nFwQ==
X-Gm-Message-State: AOJu0Yyzaz0HX1O6Er3+SLmVhv2cKnPxC/mgQ7uruCvs/Uw1A/hkpbmE
	Kv5BLARpK4xViUaAVKre4m6nH+/xGHzMCk9cR4y1l7ObnapQ90Ou/0RTvmIEnkgu8g==
X-Gm-Gg: AZuq6aIfmzkRZxb0SaLDvWsvug4rRZKklNB2V4GP4LyLXcFhQP92yowK2VK2Joewx03
	8S/3EbLJOKaXeAF9AE/0DEyvN9HVS1H/QfQyEWaNdP5FXwKB8lB7PmME1Quw6cHjIV+zUhXPjy/
	7ez9+peK8sXRcRrecruknqLWGQ1XYeyNw5N5QbCAdF3WKTduC5ADLE6gjmDJUqlzQ+arF+VOZso
	73kqy3ZinBTokUW2KiFuUsJnTDQek9IHrJVSIib21V3MAXi8WTGjvqq+uZpZqprIjRoab+xdlUn
	hBogOlKXQwJ5G6AOqiQCi+OPDrrQVLtIn8vDxE1wxagsBQTP6IObcmff9JtWiDd9VbKjn7PUyvB
	ETClcq7pvqLL+xZFswNXkGPnNTeQOyR949DBC9OQP2GKFarv95wAHrWJKy3dhxGw1R27l6PBooh
	uCj5MXdkygINZdeHmtQh0dIPvq+s5cZVMRuLvLKufhll6hshOqofr/729L8l0vMc3LyLcn5TFZj
	+8=
X-Received: by 2002:a05:6000:2906:b0:430:feb3:f5ae with SMTP id ffacd0b85a97d-435dd1d8c28mr10494543f8f.55.1769674533167;
        Thu, 29 Jan 2026 00:15:33 -0800 (PST)
Message-ID: <2d5e017f-1675-4753-9494-2b664c4ca7fa@suse.com>
Date: Thu, 29 Jan 2026 09:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com> <aXpMIOuRZvX8IyFK@Mac.lan>
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
In-Reply-To: <aXpMIOuRZvX8IyFK@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C6B64AD5DC
X-Rspamd-Action: no action

On 28.01.2026 18:49, Roger Pau Monné wrote:
> On Mon, Jan 19, 2026 at 03:46:55PM +0100, Jan Beulich wrote:
>> Legacy PCI devices don't have any extended config space. Reading any part
>> thereof may return all ones or other arbitrary data, e.g. in some cases
>> base config space contents repeatedly.
>>
>> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
>> determination of device type; in particular some comments are taken
>> verbatim from there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
>> exit path?
> 
> Possibly - we expect no change in that case.  However it would need
> to propagate some extra information into the callers.  I could see
> that as a followup optimization.

Okay, with Stewart also saying so I'll make this a follow-on then.

>> Note that no vPCI adjustments are done here, but they're going to be
>> needed: Whatever requires extended capabilities will need re-
>> evaluating / newly establishing / tearing down in case an invocation of
>> PHYSDEVOP_pci_mmcfg_reserved alters global state.
> 
> Hm, you probably want to do something similar to re-scanning the
> capability list, but avoid tearing down and re-setting the vPCI header
> logic to prevent unneeded p2m manipulations.  We have no easy way to
> preempt this rescanning from the context of a
> PHYSDEVOP_pci_mmcfg_reserved call.

Yes, definitely only re-evaluation of extended capabilities. Note, however,
that once we expose more of them, there might be a knock-on effects on the
P2M.

>> Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
>> risky code (as reads may in principle have side effects). Should we gain
>> such, too?
> 
> I would be fine with just a command line to disable the newly added
> behavior in case it causes issues.

Can do. Will need to get creative as to the name of such an option.

>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -22,6 +22,8 @@ int physdev_map_pirq(struct domain *d, i
>>                       struct msi_info *msi);
>>  int physdev_unmap_pirq(struct domain *d, int pirq);
>>  
>> +int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg);
> 
> I'm not sure why you need the forward declaration here, the function
> (in this patch) is just used after it's already defined.

Well, this is needed for the same reason that the two decls just above are:
The file is also used for the COMPAT variant of the hypercall, and hence
the declaration needs to be visible there, while ...

>> @@ -160,6 +162,17 @@ int physdev_unmap_pirq(struct domain *d,
>>  
>>      return ret;
>>  }
>> +
>> +int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg)
> 
> You can make this static I think?

... the definition doesn't need building a 2nd time (which hence also
can't be static).

>> @@ -718,6 +721,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
>>  
>>                  list_add(&pdev->vf_list, &pf_pdev->vf_list);
>>              }
>> +
>> +            if ( !pdev->ext_cfg )
>> +                printk(XENLOG_WARNING
>> +                       "%pp: VF without extended config space?\n",
>> +                       &pdev->sbdf);
> 
> You possibly also want to check that the PF (pf_pdev in this context I
> think) also has ext_cfg == true.

I don't think so. No extended config space on a PF means no PF in that sense
in the first place, for then there not being any SR-IOV capability.

>> @@ -1041,6 +1049,75 @@ enum pdev_type pdev_type(u16 seg, u8 bus
>>      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
>>  }
>>  
>> +void pci_check_extcfg(struct pci_dev *pdev)
>> +{
>> +    unsigned int pos, sig;
>> +
>> +    pdev->ext_cfg = false;
> 
> I think I would prefer if the ext_cfg field is only modified once Xen
> know the correct value to put there.

Well, my main point of doing it this way is that the code ends up being a
little easier to follow. Especially without the optimization talked about
near the top, there inevitably will be a window in time where what the
field says is wrong. With the optimization there'll be two main cases:
- MCFG becoming newly available: The field starts out false in this case,
  i.e. the write above is a no-op.
- MCFG disappearing (largely hypothetical, I think): The field may start
  out true in this case, but will go false unless we have another access
  mechanism for extended config space. It then can as well be set to
  false as early as possible.

>  It would also be nice to detect
> cases where the device has pdev->ext_cfg == true but a new scan makes
> it switch to false.  Which would signal something has likely gone very
> wrong, and we should print a warning.

Why "very wrong"? If Dom0 tells us that MCFG shouldn't be used, there's
nothing "very wrong" with that. It's simply what firmware / ACPI are
telling us.

>> +    /*
>> +     * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says that
>> +     * when forwarding a type1 configuration request the bridge must check
>> +     * that the extended register address field is zero.  The bridge is not
>> +     * permitted to forward the transactions and must handle it as an
>> +     * Unsupported Request.  Some bridges do not follow this rule and simply
>> +     * drop the extended register bits, resulting in the standard config space
>> +     * being aliased, every 256 bytes across the entire configuration space.
>> +     * Test for this condition by comparing the first dword of each potential
>> +     * alias to the vendor/device ID.
>> +     * Known offenders:
>> +     *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
>> +     *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
>> +     */
>> +    sig = pci_conf_read32(pdev->sbdf, PCI_VENDOR_ID);
>> +    for ( pos = PCI_CFG_SPACE_SIZE;
>> +          pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
>> +        if ( pci_conf_read32(pdev->sbdf, pos) != sig )
>> +            break;
>> +
>> +    if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
>> +    {
>> +        printk(XENLOG_WARNING "%pp: extended config space aliases base one\n",
>> +               &pdev->sbdf);
> 
> Hm, I think this shouldn't be very common as it seems limited to a
> short list of bridges.  However every device under such bridge would
> be affected and repeatedly print the message.  I wonder whether we
> should make this XENLOG_DEBUG instead, there isn't much the user can
> do to fix it.  More a rant than a request though.

XENLOG_DEBUG feels too weak for indicating a potential problem with a device.
I also don't see us marking bridges to limit the verbosity here, as the
issue may or may not be due to a bridge in between. Imo we can defer thinking
about limiting verbosity here until we see reports of this actually getting
overly verbose.

Jan

