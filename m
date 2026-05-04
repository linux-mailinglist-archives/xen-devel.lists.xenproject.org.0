Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPUEAMow+GlBrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:38:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C924B8940
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299459.1573993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm0E-0007xI-VK; Mon, 04 May 2026 05:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299459.1573993; Mon, 04 May 2026 05:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm0E-0007vG-S7; Mon, 04 May 2026 05:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1299459;
 Mon, 04 May 2026 05:37:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJm0C-0007vA-WF
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:37:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJm0B-000epT-UT
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:37:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f830a9-2eae-0a2a0a5409dd-0a2a4506a0b2-28
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:37:55 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f830b3-7371-0a2a45060019-d155802fbded-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:37:55 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488b0046078so28196235e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:37:55 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb69698sm436637455e9.1.2026.05.03.22.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:37:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777873075; x=1778477875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qDtGVv1vn8v2JQN4/+C31OwW8o/xPineQ1nRIC7bTH4=;
        b=AFE5PTaZkE6D24QBHzfEdUJdttjracpO7mLhA9Ua8UZ+2Q2wPi/Doa1mw1JTNWUDmO
         pCh3dlLcaIRGsRD59KMwct9iZpfnBrDi9Hzvk7m/mf5Tl5leqy+0YCv0wvGSKUvi039O
         ztmOPUi0hvMm9NNYV8Qe1e9wuRqYKMuOgpC0NZRoLsbM90pypLmA96RIoQbOFQK4jopn
         S99l2BN9VcfUF5B1PYMQrGpk3d/waWLeHW/rHwewmxIjjyU/dY+fZvjp2Po80qYyUG+y
         gddGCJ07jii/hC9qe78e8wSR6onmHNAhSD67O5Me3pOUE9bwZVXFIBz1nSF4ZbDGVU31
         N/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873075; x=1778477875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDtGVv1vn8v2JQN4/+C31OwW8o/xPineQ1nRIC7bTH4=;
        b=UkkJ4ESiBrgc3+ddRlVnAw2ocQPdsxjGzFEPnRjaYdQRgMMUZQL2/vZEaUo9SvUD1l
         O2h9BVyr0oBzd34vpE/pBNONoh9i6rIl6jfEOs1jjbtEOZkOzTixd8ZWcmWoRwCmZQiF
         F3Yyw6urzuDxiJDzHiFOCyqNVkIPXOqy6QscBtn83yTRdVLIJOEwNn2AkZ/xUsqZ4G0d
         sGHjTbOvruhmeKJPdQk7v/84HjhZ3vBjhfWWrr8hB0euF3pWcTonGtSRTckSGh+0FOYB
         AgfX7l7Y9Nv0hyP5I0ecM+pqb9vQabVUj9UCSuadr2gOpJu6CpDLE64PZE1xeAO5am5A
         G2hA==
X-Forwarded-Encrypted: i=1; AFNElJ9i2dpW8Umgcts8c6kk2ssOEfl/LV6Ml+pHj5pKktqG6LYXUubLGr6kIKtvLMplIOd3SXK7r5iMopo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQOvUNEBK4H/dd8J+ABFFDR3bNAqCLM5IdNkiVZxXt8Ttd9fAW
	t3LFd9e7UX8TPFptN4nH3xoABOw3AYZybmjJjMLTI1/L2Gw3ITS9f2b4wHv8Cqm2Sg==
X-Gm-Gg: AeBDieuvBr5gr3ynnNASCvCh+ftRlPWOG7cxMLW4XaIZ5C4AFtIE7Ps8SeMTKIe+wL3
	QALMHznSM+12C0fs/He9ZXsD6BxDCHA81vHtE1ZtwBb34XxeLk39ftxzRFqTSeQYWT4MhcX9Mtw
	lshXYbXLS9HUx5erEa8aNIx/ppqhhlxAxpUwWR+U2VCMzx9akmIuH70gnjoXxg6ueccok1ok0/c
	H+XT/tnWIh9EO/BFLaaOvL7E4qZoPhZOD9USwWN5fHOGgkfhPQJkX3Vhx7+TsPNpLJ2EygGbOke
	NLSM8WjY8c7tRk+vjYxoV/2Hxb9ubNL34OfgpVM1GFHxFd+qTBEQZT+RLPzH56cRWGz8y1ZgO5C
	59wVTB8MZC4sL9aEXEGnKOo0D9BhLbDeTKjTkRvMlls0u+wf5ZxsL6wAjn18XUuyrcbIaQ37Zee
	TIhtTn/TEwtUpILQp0GBf9LGsOnG3pXU7lxmXqEXj1IeYQfQeETVVIX3kQJUwpKziB0F+s/m/tY
	T4Hd1jqJGVi3UuqC2BCtdGn4lhXu65uKRlpRbRyo9ikgIpWa7w6RnViSXT2zAv2vWgqKQ8=
X-Received: by 2002:a05:600c:444c:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-48a9866dcd9mr132888835e9.22.1777873075187;
        Sun, 03 May 2026 22:37:55 -0700 (PDT)
Message-ID: <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
Date: Mon, 4 May 2026 07:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
 <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
 <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
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
In-Reply-To: <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777873075-CFD7AD75-BD6035A0/0/0
X-purgate-type: clean
X-purgate-size: 4201
X-Rspamd-Queue-Id: 66C924B8940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,amd.com:email];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 23.04.2026 12:12, Mykyta Poturai wrote:
> On 4/21/26 17:43, Jan Beulich wrote:
>> On 09.04.2026 16:01, Mykyta Poturai wrote:
>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>
>>> This code is expected to only be used by privileged domains,
>>> unprivileged domains should not get access to the SR-IOV capability.
>>>
>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
>>> for possible changes in the system page size register. Also force VFs to
>>> always use emulated reads for command register, this is needed to
>>> prevent some drivers accidentally unmapping BARs.
>>
>> This apparently refers to the change to vpci_init_header(). Writes are
>> already intercepted. How would a read lead to accidental BAR unmap? Even
>> for writes I don't see how a VF driver could accidentally unmap BARs, as
>> the memory decode bit there is hardwired to 0.
>>
>>> Discovery of VFs is
>>> done by Dom0, which must register them with Xen.
>>
>> If we intercept control register writes, why would we still require
>> Dom0 to report the VFs that appear?
>>
> 
> Sorry, I don't understand this question. You specifically requested this 
> to be done this way in V2. Quoting your reply from V2 below.
> 
>  > Aren't you effectively busy-waiting for these 100ms, by simply 
> returning "true"
>  > from vpci_process_pending() until the time has passed? This imo is a 
> no-go. You
>  > want to set a timer and put the vCPU to sleep, to wake it up again 
> when the
>  > timer has expired. That'll then eliminate the need for the 
> not-so-nice patch 4.
> 
>  > Question is whether we need to actually go this far (right away). I 
> expect you
>  > don't mean to hand PFs to DomU-s. As long as we keep them in the hardware
>  > domain, can't we trust it to set things up correctly, just like we 
> trust it in
>  > a number of other aspects?

How's any of this related to the question I raised here, or your reply
thereto? If we intercept PCI_SRIOV_CTRL, we know when VFs are created.
Why still demand Dom0 to report them then?

>>> +static int map_vfs(const struct pci_dev *pf_pdev, uint16_t cmd)
>>> +{
>>> +    struct pci_dev *vf_pdev;
>>> +    int rc;
>>> +
>>> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
>>> +
>>> +    list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
>>> +    {
>>> +        rc = vpci_modify_bars(vf_pdev, cmd, false);
>>> +        if ( rc )
>>> +        {
>>> +            gprintk(XENLOG_ERR, "failed to %s VF %pp: %d\n",
>>> +                    (cmd & PCI_COMMAND_MEMORY) ? "map" : "unmap",
>>> +                    &vf_pdev->sbdf, rc);
>>> +            return rc;
>>> +        }
>>> +
>>> +        vf_pdev->vpci->header.guest_cmd &= ~PCI_COMMAND_MEMORY;
>>> +        vf_pdev->vpci->header.guest_cmd |= (cmd & PCI_COMMAND_MEMORY);
>>
>> As mentioned elsewhere as well, this bit is supposed to be 0 for VFs.
> 
> There are some devices that expose VFs with the same VID/DID as in the 
> PF, causing Linux to use normal driver for them and threat them like 
> normal devices. At some point, those normal drivers try to do a 
> read-modify-update of the command register and end up writing 0 to 
> PCI_COMMAND_MEMORY, causing cmd_write to unmap the BARS of that device. 
> I am not sure, maybe it would be better to just ignore cmd writes for VFs?

No. We should treat r/o bits as r/o (which for this bit implies it not
controlling BAR mapping).

>>> +    sriov_pos = pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
>>> +    ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
>>> +
>>> +    if ( (pf_pdev->domain == vf_pdev->domain) && (ctrl & PCI_SRIOV_CTRL_MSE) )
>>> +    {
>>> +        rc = vpci_modify_bars(vf_pdev, PCI_COMMAND_MEMORY, false);
>>
>> Doesn't VF enable also need to be set for the BARs to be mapped?
> 
> I don't think so. Enabling memory space logically maps very well to 
> mapping memory to the guest. I don’t see any benefit of also requiring 
> VFE bit here.

Iirc the spec is quite explicit in this regard.

Jan

