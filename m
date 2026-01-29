Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APIwFP4Re2nqAwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 08:53:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65DAD094
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 08:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216118.1526088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlMq0-0005ze-8M; Thu, 29 Jan 2026 07:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216118.1526088; Thu, 29 Jan 2026 07:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlMq0-0005xe-5e; Thu, 29 Jan 2026 07:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1216118;
 Thu, 29 Jan 2026 07:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlMpz-0005xW-3B
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 07:53:11 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d2db3aa-fce7-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 08:53:08 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43596062728so1040054f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 23:53:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce4c3c6sm113214785e9.10.2026.01.28.23.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 23:53:07 -0800 (PST)
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
X-Inumbo-ID: 8d2db3aa-fce7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769673187; x=1770277987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vzVRxjp+KgK45VmAjNvmwskHCy+VcHU0ccYFsRmd2uE=;
        b=K3OW9y+20KX2R8E/FRl9bL4ICSE00BBwMLzhEHpLbGyKT31Kk6dPTvnbuVkolbsoWc
         VTLaREJ5qF+AXq01zJ+uMCfBldfnPwtCbEFObUgdydd3hgX6wo4sHu200sNhBKh0lP+g
         tHtGJKXht/OHyIMoMn+lmR2uuY79YP57FnCCnd7dNUiZ9aLhWSzB84zaHa2qq1Ps3Qwt
         Yi9WClo2VIpDLll+SUT531omoMhhdqL3MLQoT+opDayQwjNblWGFG/oWKngNQL+/NkVQ
         DHX4mRYV53e9qrp1gr3Eq5kbzQUuucZHyKT+qQy7aQC4getQ285VeyCcRbLTZrNvmvf+
         tRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769673187; x=1770277987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzVRxjp+KgK45VmAjNvmwskHCy+VcHU0ccYFsRmd2uE=;
        b=ipz/6Ai/oGa/0VNF7CBiLE6rKFrDx8VIyuIO/iazPxWHlOkhPCFHOugmT9OyCmMVih
         fnPV+GrskMF+ZH/b7atQyD4t82iwZ0C3w8QDZZMTouYEub+pvAQR7nbSQ9SsfA2NY2AE
         9RiWliHInM0oz1drp7lQnTGoEPDqHy6nvN33EDjt4W72xlDwlfpfnyagh9+U7axEYPqF
         Zi3SLUi8xvuppAZLqQEpu5hCtrWweQCMJeC4z8TfSXp2YgEDog8Ux6Jp+alZz4131cJQ
         g7aB5ZaT50IfjsopDIuZGs15NfdrSKQyDhuEZte+jsAXeh2gtkutmJXe9mFxygwPkMxY
         knZg==
X-Forwarded-Encrypted: i=1; AJvYcCUdBlyq+bwbTqIgTK9ks2WATvOdXuOBBgsDQRRWxHJMqvp6a8mPL6vK9sDw41eY94VqWzakJ+UGguY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5wK1Y55WW77xyeYg5g3ndrun2f5xfdxPXGPRs3QDUUlplrgs0
	Y/hLxvWDHLUP2k0N9+mEyP6DVgocmUxWbnb4B9jdNaPvHAvFzdLlcsNtSfFDkWxyjA==
X-Gm-Gg: AZuq6aJ1vmHy19s91nFJb5RMleXYpSNllFzuHAyfRsaHaXdNpXBYlKO16WhTcaDal3a
	uGL4vA7HNBogY0GhApJqX486sk+SgTJ+wVPYcfDjyxJX5pJZwul57HDoc9wRymZEre+bQGT+fGI
	xzQ5JfqnmW5i2nJ5fg63Vizm+CijWiWtA/k2SUEjOVlznxAsVPdHwB63Mciu01vbNdi5MIyZwX2
	HgboCQbkafj4jdp/JW+m178BDSyZQDjUHJ3A33QiVpoiyLNNk94V9WFtX5Gu6i9/DEt2avDHxOv
	cWMaylGyA3Mbr2g6hQmUkL3sOgHw9rw5ENbKL4rXtnem2cUQouaYAZR3vOo6D1uVqr67Nofb3ET
	552DcmHTHl7O1L+8hslyOzeJQkXy3kHTMGKsu6N/IC4cJ+kGAzd/CXrX9b1zLVtQAd3tmp0BLML
	3e4J4HnK6RTB5OYc5Yc9m/reKWvyha+3Ew0c6pa8FGfvIkA9Ce2WG9Q5v6ZCr+wR3ljEwgVzcq7
	Vw=
X-Received: by 2002:a5d:5d86:0:b0:432:c03e:a78e with SMTP id ffacd0b85a97d-435ea220d54mr2822786f8f.27.1769673187495;
        Wed, 28 Jan 2026 23:53:07 -0800 (PST)
Message-ID: <9d3d4a0f-5ff0-4a90-b624-fc99b23efbf7@suse.com>
Date: Thu, 29 Jan 2026 08:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
 <6d7b74b6-1bab-427d-aa14-321f4761d9a0@suse.com> <aXpeOocblPZtJW5Q@Mac.lan>
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
In-Reply-To: <aXpeOocblPZtJW5Q@Mac.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9B65DAD094
X-Rspamd-Action: no action

On 28.01.2026 20:06, Roger Pau Monné wrote:
> On Wed, Jan 28, 2026 at 03:46:04PM +0100, Jan Beulich wrote:
>> On 28.01.2026 13:03, Roger Pau Monne wrote:
>>> @@ -275,7 +339,18 @@ static void populate_physmap(struct memop_args *a)
>>>              }
>>>              else
>>>              {
>>> -                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
>>> +                unsigned int scrub_start = 0;
>>> +                nodeid_t node =
>>> +                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
>>> +                                                    : NUMA_NO_NODE;
>>> +
>>> +                page = get_stashed_allocation(d, a->extent_order, node,
>>> +                                              &scrub_start);
>>> +
>>> +                if ( !page )
>>> +                    page = alloc_domheap_pages(d, a->extent_order,
>>> +                        a->memflags | (d->creation_finished ? 0
>>> +                                                            : MEMF_no_scrub));
>>
>> I fear there's a more basic issue here that so far we didn't pay attention to:
>> alloc_domheap_pages() is what invokes assign_page(), which in turn resets
>> ->count_info for each of the pages. This reset includes setting PGC_allocated,
>> which ...
>>
>>> @@ -286,6 +361,30 @@ static void populate_physmap(struct memop_args *a)
>>>                      goto out;
>>>                  }
>>>  
>>> +                if ( !d->creation_finished )
>>> +                {
>>> +                    unsigned int dirty_cnt = 0;
>>> +
>>> +                    /* Check if there's anything to scrub. */
>>> +                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
>>> +                    {
>>> +                        if ( !test_and_clear_bit(_PGC_need_scrub,
>>> +                                                 &page[j].count_info) )
>>> +                            continue;
>>
>> ... means we will now scrub every page in the block, not just those which weren't
>> scrubbed yet, and we end up clearing PGC_allocated. All because of PGC_need_scrub
>> aliasing PGC_allocated. I wonder how this didn't end up screwing any testing you
>> surely will have done. Or maybe I'm completely off here?
> 
> Thanks for spotting this!  No, I didn't see any issues.  I don't see
> any check for PGC_allocated in free_domheap_pages(), which could
> explain the lack of failures?

Maybe. PGC_allocated consumes a page ref, so I would have expected accounting
issues.

> I will have to allocate with MEMF_no_owner and then do the
> assign_pages() call from populate_physmap() after the scrubbing is
> done.  Maybe that would work.  Memory allocated using MEMF_no_owner
> still consumes the claim pool if a domain parameter is passed to
> alloc_heap_pages().

Technically this looks like it might work, but it's feeling as if this was
getting increasingly fragile. I'm also not quite sure whether MEMF_no_owner
allocations should consume claimed pages. Imo there are arguments both in
favor and against such behavior.

We may want to explore the alternative of un-aliasing the two PGC_*.

Jan

