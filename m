Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CgcLBRRjGmukgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:51:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EC6122FB1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227138.1533474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6s6-0002Mg-CV; Wed, 11 Feb 2026 09:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227138.1533474; Wed, 11 Feb 2026 09:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6s6-0002LK-9Y; Wed, 11 Feb 2026 09:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1227138;
 Wed, 11 Feb 2026 09:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq6s5-0002LE-DG
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 09:50:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 292e89d1-072f-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 10:50:56 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so4206791f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 01:50:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d46ec6sm3293250f8f.9.2026.02.11.01.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:50:55 -0800 (PST)
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
X-Inumbo-ID: 292e89d1-072f-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770803456; x=1771408256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X/kawchlnkSpmu6Ejkn7qq2+TmbcVtzDhc43G8h7fdI=;
        b=MphAJi4yffNdzhitLHXbB5lLLwamSTPJ8sXg2p0Yfx2ataUgnTWuLyBMo6zjAgOn6a
         5Fjfdd/JasXIVtpGDHjQE26GXBujfeGaqyHrH1KjCZpx7To7sv6xBCLqkgIYRClStXTP
         z8Jp+FoqRblNicidxDVYm3qSOyFYhDxh00Qt+EBSvx8d1AoCcTV3oWS77KlI9RVGPjxa
         Apu75bZOWZoWhvHqX2aGNGUIMuvF1gH8aCDSLwKiPB3D9TvcuOqOQCaVSMYi1MyXzvD1
         ktKi7YrsOihGPDaBY94LnxyN4U+3F+eYsxtkFQ3DC2q8s7gR0+i4Q66fZ3dj2STSzAn4
         553A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803456; x=1771408256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/kawchlnkSpmu6Ejkn7qq2+TmbcVtzDhc43G8h7fdI=;
        b=I7a3F7hFJmP97TU+vBR0yLoG7UteEHrV5/Ic/BAhlpQaHt3Dr73qsJ/wrDHD0zzX9F
         BL2KydZlP3i9q/ih8S3/IFkcC8LFBrTed4t7v1IWcxGN3GTvEcep48GJOoMZh26ynjS8
         KEkaDsz2BCsErFTQPmZT4mOqKXucMtAnL4y3xrkOBXHnWSz8B+unZvFP/QE+h/lmxGUG
         vJyIx0ReYuEVUZpkiK0416EZiIVBrAZ1GqhNwm2M1UVfAj4YJZIaPFX/EuxceG5r34WZ
         sjB8fneo6OK0pHoPyOft1cSJ/F13BdCyxVQ9FUW+NMVYER7HYPSlGnQjBoXPptoutEOv
         N5qA==
X-Forwarded-Encrypted: i=1; AJvYcCWEBCC6Y+5RlUcHvFqPuhl6OH94wP1BAaOHfWuJqK89gqWhg7o92nUpETVoR7GkYALH6NkO4K+Pegw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkxUDcmeM4hCszKfvfNGye3YdnezZp9x5fozNBw7dKBC6Lg7fE
	ZyKgxPQsbmyrq39Z9Kd82Nj2lPMz+/qG2PwoSBJhglOQXMTiVo/RybDdt0CEqzkCTQ==
X-Gm-Gg: AZuq6aJk4tE6xQVg2KL40r1U/gz2dqEnYITWqjvArud71Wo2lUrecg3B4qVVOvxUDEI
	P486+0sWQGHk/Ju1UXl7hC09jVXA8l30hr8dcq6pvMStTHu+QnN08GUH/He76YtTCPNhTfpt6nl
	Rm+5cRbxUAzCl+2ymKQRZdygybIToKYnXSOFpZ4Wxrs8bbA/jAUJch+K3Om1+tbf5dShKhhctZW
	guC76ZrBC6rWh4qEPz28EEDA9kyabnIORLeMmTOxl8D6hCOAUSSMcRyfaf8uj1Wa4x2f74x8HV4
	KlTQzQugd8v7p3vTR1qO+ZLVp6s3yMZpZd2+bm/dQXUBRmxw5IvrttbS99w+jhatf8ags0sP5UB
	PzitgBCy+Pispb90hOkEVvkW7iCHNSfi69Vx8dhk+bvcoxr7SkshQ7cDIPdChNlHNnDiNt98NJP
	8FQPMkPVgPKGMbCTRfh2TS2AoP72jr32yVmXp0p2mu0+KN5pwIWc2BziNoDrOi01cF73JTFDxxK
	PLw5jXLepC1tqU=
X-Received: by 2002:a05:6000:60f:b0:437:6625:d0d7 with SMTP id ffacd0b85a97d-43784599e40mr2168182f8f.42.1770803455567;
        Wed, 11 Feb 2026 01:50:55 -0800 (PST)
Message-ID: <6f170f0c-6d36-4ecc-b2c6-5b70aff8ed45@suse.com>
Date: Wed, 11 Feb 2026 10:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <cfb2bd81ca9c43f29f5d77a918e1da7a8c55318e.1770650552.git.oleksii.kurochko@gmail.com>
 <a660d245-0c63-409c-8609-ba767fff9e65@suse.com>
 <3650d684-f6c8-4f73-ad8b-3c6dd64c256c@gmail.com>
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
In-Reply-To: <3650d684-f6c8-4f73-ad8b-3c6dd64c256c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D8EC6122FB1
X-Rspamd-Action: no action

On 11.02.2026 10:47, Oleksii Kurochko wrote:
> On 2/11/26 8:49 AM, Jan Beulich wrote:
>> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -32,6 +32,8 @@
>>>   unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>>>       __aligned(STACK_SIZE);
>>>   
>>> +struct csr_masks __ro_after_init csr_masks;
>> setup.c would be nice to only have __init functions and __initdata data.
>> Really up to now that's the case, and I wonder why the makefile doesn't
>> leverage this by using setup.init.o in place of setup.o. This variable
>> would likely better live elsewhere anyway, imo: Somewhere it's actually
>> (going to be) used.
> 
> I put it here as I wasn't able to find better place. If it is okay to have
> it in domain.c then I'm okay to move this variable there.

If that's where it's going to be (mainly) used (as the next patch suggests),
I see nothing speaking against you doing so.

Jan

