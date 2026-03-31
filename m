Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBtOBQXey2lHMAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:45:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6918136B245
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269026.1558179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7aKq-0002Yr-0p; Tue, 31 Mar 2026 14:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269026.1558179; Tue, 31 Mar 2026 14:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7aKp-0002Vo-TT; Tue, 31 Mar 2026 14:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1269026;
 Tue, 31 Mar 2026 14:44:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7aKo-0002VP-Qn
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 14:44:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7aKm-00FjsE-9v
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:44:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cbddd8-5cb7-0a2a0a5109dd-0a2a4503cf10-14
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:44:49 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cbdde1-1947-0a2a45030019-d1558033c04d-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:44:49 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so53100735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 07:44:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c8bc9dcsm28618355e9.6.2026.03.31.07.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 07:44:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1774968289; x=1775573089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JNHDtr7WCG8iOLY51gB6FQhLwm54QF/rV8nNNDxSmTg=;
        b=SZnBq2wah/UIS+PZ8bKYQw0SKJQMt4DXrfoslloWA19TFkUv/0ZuISej9eR6fTOO+X
         FNvWZ8nhKp8FokBm/PWTRwl8ZsmCsgjrm4dEIEKLXxV0mjPLg/r901LIY0+vDifvSzsc
         UBImAbH8qdbBRd4urfs3VDZfqohtAVi9aYUd/HnkUpaheSCjXQp/69YwW+C7MBG7Cri3
         XXUgZCfhZS/AIUD9awHQaCFy1ZJZDR3PFcWjh8t+HFKVJ4fSjsdW5GACmtmCUZEiAJJd
         iY1jGpXW79VlavM42rNLgbfm2G4W2tI1WuHIqNi9Xr4vty8XqLYdivWdTdmmEoP8VJcq
         IuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968289; x=1775573089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNHDtr7WCG8iOLY51gB6FQhLwm54QF/rV8nNNDxSmTg=;
        b=CAg5uV+QTutXZh9nbm9N9x6aGCXE4qM1CZKNuWEwnOvdrA0mWxmcW0cXnazTJ3N3Ei
         iwtbARaw54GCyKoZc5crJR7lB9RZDcg4ckmZkOg2c0ZiS8tkaz+9n2uzQA6/ErpWXub6
         AhoZj3aADnaHWVMOjRnd5e0BPtcl2OhaFbD13n5hQqJsHyh5HF9eBYobPVGCl6FI9SwR
         jNDAiAOAENe4ZT2/iEb87Et6Pe11R36ZugxfIp21l/cAKL30bLvjg+nynMFOjCV+5KTl
         q7vIBSeeItF5k/HZkF67bhMI4lnp2XvZRayB85DxppiwFXxLC3CykqWC6Yh/dpK2ono7
         z1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWhIQwiFxpAvzVzX35YfKo5TVio10A6EBLEh1KRJ3nplxlEcD4XaMh9Wmdy/mN/MLRlT21ziCesfig=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKogfmd+AQXlWO/yWEHzbrqLP7uKUm8ujl0TNpZkOIqNv0AqW4
	Pobg62d/9ZpAVk0euW1WDhvpfbKsvWrMrDdpEk83jwuwccJMPm2M3wK2WIHeOAXTSw==
X-Gm-Gg: ATEYQzzlbHLXei/FBAsIALfnjvB9LO6bwgCCuALaoAeqx5ckE/b0aLOeuyft++YWPFB
	C6u79vb2NpuOHynwEtv9aho/x0bDBOvDrTQd9AHPSKjl2rDT+Ncc2AiV01d1gD0AFvgXygsSz8L
	TsqfMcNNJUR/flk7WGSbuhNNG1Ki6+MIBilP3ZP/3hSDE16mAtmZy3CM6AmirYuC1ez7uNXvbKw
	4Co8jKfu/VotzkBMGoKVyBPR9pe1LI5DB6Fk98fnGnU+aPN5Jq1zRxS0Bydu45vAOm7kO83peQk
	JvQO1nUoXJWOicaCdiJ9VYLXfDBKr8uhrQk+VRGeaOXPBVcuWe9gJ9INi1FzGDDB1EacoPeaj4Y
	CpTNy+sUqOeWySFkrM2fOmLY10rRTxwCFnXZ1X+4RAia5XOQ/X0xuBLdMTfSZ2kZNDlI8gufR/o
	vhjewy8TH8in7nHiUhlrPPbiDpMBHXhrfBLTRZU/7m4BYxpaCz/B9/ydp2eOwOKWlxI8GSTyASW
	czIM78yZh2cNtw=
X-Received: by 2002:a05:600c:8819:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-48727d55fc3mr283673715e9.7.1774968288955;
        Tue, 31 Mar 2026 07:44:48 -0700 (PDT)
Message-ID: <977bc84d-cd7e-4362-9eb8-05d56b364d2b@suse.com>
Date: Tue, 31 Mar 2026 16:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <b4c86444970a65f56d20203fd77ee368e1eebfb9.1772806036.git.mykyta_poturai@epam.com>
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
In-Reply-To: <b4c86444970a65f56d20203fd77ee368e1eebfb9.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774968289-49A5972C-50D41E06/0/0
X-purgate-type: clean
X-purgate-size: 3252
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 6918136B245
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 12:08, Mykyta Poturai wrote:
> +static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos = reg - PCI_SRIOV_CTRL;
> +    struct vpci_sriov *sriov = pdev->vpci->sriov;
> +    struct callback_data *cb = NULL;
> +    uint16_t control = pci_conf_read16(pdev->sbdf, reg);
> +    bool mem_enabled = control & PCI_SRIOV_CTRL_MSE;
> +    bool new_mem_enabled = val & PCI_SRIOV_CTRL_MSE;
> +    bool enabled = control & PCI_SRIOV_CTRL_VFE;
> +    bool new_enabled = val & PCI_SRIOV_CTRL_VFE;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_enabled == enabled && new_mem_enabled == mem_enabled )
> +    {
> +        pci_conf_write16(pdev->sbdf, reg, val);
> +        return;
> +    }
> +
> +    cb = xzalloc(struct callback_data);
> +
> +    if ( !cb )
> +    {
> +        gprintk(XENLOG_ERR,
> +                "%pp: Unable to allocate memory for SR-IOV enable\n",
> +                pdev);
> +        return;
> +    }
> +
> +    cb->pdev = pdev;
> +    cb->pos = sriov_pos;
> +    cb->value = val;
> +    cb->map = new_mem_enabled && !mem_enabled;
> +    cb->unmap = !new_mem_enabled && mem_enabled;
> +    cb->enable = new_enabled && !enabled;
> +    cb->disable = !new_enabled && enabled;
> +
> +    current->vpci.task = WAIT;
> +    current->vpci.wait.callback = control_write_cb;
> +    current->vpci.wait.data = cb;
> +    current->vpci.wait.end = NOW();
> +
> +    if ( cb->enable )
> +    {
> +        size_vf_bars((struct pci_dev *)pdev, sriov_pos);

No casting away of const, please. See Misra rule 11.8.

> +        /*
> +         * Only update the number of active VFs when enabling, when
> +         * disabling use the cached value in order to always remove the same
> +         * number of VFs that were active.
> +         */
> +        sriov->num_vfs = pci_conf_read16(pdev->sbdf,
> +                                         sriov_pos + PCI_SRIOV_NUM_VF);
> +        /*
> +         * NB: VFE needs to be enabled before calling pci_add_device so Xen
> +         * can access the config space of VFs. FIXME casting away const-ness
> +         * to modify vf_rlen
> +         */
> +        pci_conf_write16(pdev->sbdf, reg, control | PCI_SRIOV_CTRL_VFE);
> +        /*
> +         * The spec states that the software must wait at least 100ms before
> +         * attempting to access VF registers when enabling virtual functions
> +         * on the PF.
> +         */
> +
> +        current->vpci.wait.end = NOW() + MILLISECS(100);

Aren't you effectively busy-waiting for these 100ms, by simply returning "true"
from vpci_process_pending() until the time has passed? This imo is a no-go. You
want to set a timer and put the vCPU to sleep, to wake it up again when the
timer has expired. That'll then eliminate the need for the not-so-nice patch 4.

Question is whether we need to actually go this far (right away). I expect you
don't mean to hand PFs to DomU-s. As long as we keep them in the hardware
domain, can't we trust it to set things up correctly, just like we trust it in
a number of other aspects?

Jan

