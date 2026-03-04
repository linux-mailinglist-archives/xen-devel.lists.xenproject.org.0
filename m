Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NDVIiBSqGnUtAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:39:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10A202EFF
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245654.1545008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoJV-0007fl-Fn; Wed, 04 Mar 2026 15:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245654.1545008; Wed, 04 Mar 2026 15:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoJV-0007dm-Bm; Wed, 04 Mar 2026 15:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1245654;
 Wed, 04 Mar 2026 15:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxoJU-0007O5-E0
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:39:04 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 459160dc-17e0-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 16:39:03 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4837584120eso52408505e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 07:39:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b0549600sm29576163f8f.35.2026.03.04.07.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 07:39:02 -0800 (PST)
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
X-Inumbo-ID: 459160dc-17e0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772638743; x=1773243543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QNWsCIeGZRbprrIy/0SsmSPOdGwM07nDurlIE+0tk1o=;
        b=fIyfA2jJhaa/XRQgIiFm68b5U9n87lbihXB3gl/BYWY61YA32rTts+VyR+ipNQw6+v
         8xbwvlgOQAdUDXKW2CQbZ6I472Npq88yqvhArWT5DcPS3okF/46rbU2wMLETHG0NDEct
         UHKGHZJ8bWAAutNADu1boIbYfXoDkFdY32aGYzdQ3iSKIWinf8gUk3N7nukTuOIqRqJE
         R1vfRv+qRjvU/GRiKqgDFz6CBc6w1fn/Hx5T8+yAHMQMwJugy7Z7xE4bViZG7NqAEwoz
         pAb/GKwyNv9My0O8FKBdLcxget7Jh+omQeHpfs7g0LnJ1hLwfOuIaXlttR5JbFQDSWqX
         A7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638743; x=1773243543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNWsCIeGZRbprrIy/0SsmSPOdGwM07nDurlIE+0tk1o=;
        b=Gvemt4bfe8jf9glHXrPa8pSQT9GF8A/lW8CKiwHkxeiYVu4yBIstlscoHfm3ZKCx6q
         CIEvMxgmoyI2jMOq5ZQ5z1ThZz13WKgyoSgbxebjfsvz3FdDbHTNnXYZ/jDgw9CECbPR
         oyI0lwyoxggqi8Ce4rWtzQPQdilFCw5SlDvRioN3D6wnjJO5hn1XeLWhT7NUwRpzf4m6
         ZM2gpQY9DGUH0YS82FlTw0YElOIWpyNvWPb5/neorR4f6wIeITZHKGa5QY6DmzCbmHNe
         EJ6Qs4AMMBU1NoltArvGSMXYm2Wi+B7Mit3Hu9SX/l7dDvUIYAWzx5AntApdc/04qpcG
         Prdg==
X-Gm-Message-State: AOJu0YyxBjARIQOk8W88YNFONOQf+yCjkMuUxsOnM9ZRegudV62HXOsQ
	na1z2D131gH6obKEbozFwt5qseORZWyEWgA8FOzuUPAbqFRanEt87BYwbnBsV4BZ0w==
X-Gm-Gg: ATEYQzz0QFNmTWu85EHqLdv0+WNR0bUN3Fs7GwKWFXdqv8v9gb6hZSbXpqNvsZWaHqQ
	gpAOphbc6yLRRadgv2x+/JzxM+bc5DCPbuH++bSnEgDiGuC5AT9fQ7M0I02DLN1P53F/eRcgG4X
	G26KWh7GjiOqvvoADHRCggcOz9x8QBXYDdobMxQpaDZOqWcsBYXf6Ik0rmRac7f2/vZ7Uusnigp
	qazkje/uks52wcFPy4+KabDlib5Fi0G3Bj/ZZsFxgV/Tu0DPQBO7sJfRG4kThPy3qxr8IYhaNWp
	upYwBYZ7gAUF9txc1wWmX6TC3XTZyqn+fnAYfN+REPo/TQjrL6rnJpkzqazpTof0UgRNMInNYyI
	3ptKlWJbuklyJvOdVsdqKH+OKyS6OwU8JdBXJ0GmjOYa38rZNoAwABs69SLFyKKY7kTjuvczbNa
	1LrX0l6eLIBWl395coRayQanfwkVhUq8EDTuWYA2/oLirggApMBt6vJtkhyf6QUm81iStkbxJHT
	Uq6C9wERSvmF8c=
X-Received: by 2002:a05:600c:1c26:b0:483:71f7:2796 with SMTP id 5b1f17b1804b1-4851982e8bcmr42106625e9.10.1772638742475;
        Wed, 04 Mar 2026 07:39:02 -0800 (PST)
Message-ID: <7d7b75b7-80c4-4c23-8678-b33f4c90132c@suse.com>
Date: Wed, 4 Mar 2026 16:39:00 +0100
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
In-Reply-To: <aahKkV2csf28Y0YC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE10A202EFF
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid];
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

On 04.03.2026 16:06, Roger Pau Monné wrote:
> On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
>> When Dom0 informs us about MMCFG usability, this may change whether
>> extended capabilities are available (accessible) for devices. Zap what
>> might be on record, and re-initialize things.
>>
>> No synchronization is added for the case where devices may already be in
>> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
>> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
>>
>> vpci_cleanup_capabilities() also shouldn't have used
>> pci_find_ext_capability(), as already when the function was introduced
>> extended config space may not have been (properly) accessible anymore,
>> no matter whether it was during init. Extended capability cleanup hooks
>> need to cope with being called when the respective capability doesn't
>> exist (and hence the corresponding ->init() hook was never called).
>>
>> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> vpci_reinit_ext_capabilities()'es return value is checked only to log an
>> error; it doesn't feel quite right to fail the hypercall because of this.
>> Roger brought up the idea of de-assigning the device in such a case, but
>> if a driver doesn't use extended capabilities the device would likely
>> continue to work fine, for Dom0 this probably wouldn't be quite right
>> anyway, and it's also unclear whether calling deassign_device() could be
>> done from this context. Something like what pci_check_disable_device()
>> does may be an option, if we really think we need to "break" the device.
> 
> We may want to add a note there, stating that we have considered all
> possible options, and hiding the capability and hoping the owner
> domain would continue to work as expected seems the less bad of all of
> them?

I'll see what I can do.

>> The use of is_hardware_domain() in vpci_cleanup_capabilities() was
>> uncommented and hence is left so. Shouldn't there be a DomU-related TODO
>> or FIXME?
> 
> Hm, yes, possibly.  I think limiting extended space availability to
> the hardware domain only has been done "just" because we have no
> extended capabilities to expose to domUs so far, and I don't think we
> even setup the extended capability list in the domU case.

Considering how many things there are to be done for DomU support, I
think it would help if every place where e.g. is_hardware_domain() is
used only as surrogate would be properly annotated. Or perhaps properly
named predicates could be introduced right away, so one can actually go
hunt for all of them. Then again is_hardware_domain() is also something
one can go hunt for.

>> @@ -349,22 +352,23 @@ int vpci_init_capabilities(struct pci_de
>>      return 0;
>>  }
>>  
>> -void vpci_cleanup_capabilities(struct pci_dev *pdev)
>> +void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
>>  {
> 
> You could short-circuit the function here, ie:
> 
> if ( ext_only && !is_hardware_domain(pdev->domain) )
>     return;
> 
> But I'm not sure that would simplify the code of the function much?
> Likewise for vpci_init_capabilities().

Such a short-circuit would need replacing / dropping once DomU support is
added. I was hoping the chosen arrangement would make for a little less
churn at that time. I'll listen to your advice, though, just that the
question gives the impression you're not quite sure either.

>>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
>>      {
>>          const vpci_capability_t *capability = &__start_vpci_array[i];
>>          const unsigned int cap = capability->id;
>> -        unsigned int pos = 0;
>>  
>>          if ( !capability->cleanup )
>>              continue;
>>  
>> -        if ( !capability->is_ext )
>> -            pos = pci_find_cap_offset(pdev->sbdf, cap);
>> -        else if ( is_hardware_domain(pdev->domain) )
>> -            pos = pci_find_ext_capability(pdev, cap);
>> -        if ( pos )
>> +        /*
>> +         * Cannot call pci_find_ext_capability() here, as extended config
>> +         * space may (no longer) be accessible.
>> +         */
>> +        if ( capability->is_ext
>> +             ? is_hardware_domain(pdev->domain)
>> +             : !ext_only && pci_find_cap_offset(pdev->sbdf, cap) )
> 
> Given the changes you have done to the reBAR cleanup function, we
> could even call capability->cleanup() on domUs, as the handler has to
> deal with uninitialized capabilities either way?

Hmm, yes, looks like we could.

>> @@ -376,6 +380,28 @@ void vpci_cleanup_capabilities(struct pc
>>      }
>>  }
>>  
>> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
>> +{
>> +    if ( !pdev->vpci )
>> +        return 0;
>> +
>> +    /*
>> +     * FIXME: DomU support is missing.  For already running domains we may
>> +     * need to pause them around the entire re-evaluation of extended config
>> +     * space accessibility.
>> +     */
>> +    if ( pdev->domain )
>> +        ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_io);
> 
> Is this to cope around races?  I don't think it's a valid state to
> have pdev->vpci != NULL and pdev->domain == NULL?

Knowing that I had seen pdev-s with NULL domains, I'm perhaps overly cautious.
Yes, ->vpci being non-NULL ought to demand a proper owner.

> Neither you can have pdev->domain == dom_io and pdev->vpci != NULL?

Same here, looks like I went too far.

>> +
>> +    vpci_cleanup_capabilities(pdev, true);
>> +
>> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
>> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
>> +        ASSERT_UNREACHABLE();
> 
> Ideally this would better be done the other way around.  We first
> remove the handlers, and the cleanup the capabilities.  Just to ensure
> no stray handler could end up having cached references to data that's
> been freed by vpci_cleanup_capabilities().

And maybe not just that: For the hwdom case cleanup_rebar() adds new handlers,
which we'd wrongly purge again right away. (Because we pass "false" for "hide",
this isn't an active issue right now.)

> And we should take the write_lock(&pdev->domain->pci_lock).

Now this is a request that I'm struggling with some. I can see that callers
of vpci_{init,cleanup}_capabilities() assert that the lock is being held, yet
it's not quite clear to me why that's needed. Shouldn't vPCI internals all
synchronize on the vPCI lock of the domain?

Jan

