Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKddD+vg1GmZyQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:48:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21DE3AD2F0
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274894.1560869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3yG-0003V7-7U; Tue, 07 Apr 2026 10:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274894.1560869; Tue, 07 Apr 2026 10:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3yG-0003SS-4I; Tue, 07 Apr 2026 10:47:48 +0000
Received: by outflank-mailman (input) for mailman id 1274894;
 Tue, 07 Apr 2026 10:47:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wA3yD-0003OG-Ou
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:47:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3yB-001fI5-4r
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:47:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d4e0bf-bab6-0a2a0a5309dd-0a2a45028cdc-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:47:44 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d4e0d0-42fa-0a2a45020019-d155d033f161-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:47:44 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-66dd0531d01so7359773a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 03:47:44 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66e034c6750sm4120455a12.27.2026.04.07.03.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 03:47:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775558864; x=1776163664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ty+nd2UtzHINDIw06cHHm4EklEis82OeP39lo5ZDPiQ=;
        b=m2DF4GJ/+NTRaskmGTrVjfgrzGXDgYK//O/z9PU2SWYtCcro3U5513fF3Su4K+4IfK
         8ylqzp1jtviLSbTGjoMuGmud22XjRyxdZRsAtFMhSpkzZ3S02SIl77nMOToHuK1Y3Xkc
         eDrsswirmbDnz1QDJLbQyO0W23/25hnepHDACDbqLmp85r2eiTp5rwQHo5tA9c0GEzhU
         okBrQzVHFLOpZvhsYX+uidh42dLc+z9VcZHFswG67wbjG0KCCcwtNq3yIE1c2e70wSV0
         nmtKWil/orVqFIgKO7c4PSLzNuXsda4vZPJLGwufMm0f6Tzab0Vmi/ry55o6pV8A4zEY
         yp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558864; x=1776163664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ty+nd2UtzHINDIw06cHHm4EklEis82OeP39lo5ZDPiQ=;
        b=sEK1ZFLQTRsR+KYs6cZVFFQO6Z68VgA+yUWeJnRFClxfz7fk6OQYnaqt1UUeKaqcHU
         4HauNynY+wfG0q+2zlQVAkwElrh8DaT9owoyncauqONW9oBGzGluUsyoUGaV8SoIpl1y
         smVEiu0FJTtyL35h9UPQCjl2rAmMxtpJYGssszPNWomr59kbJjEm0e1zOA6Ln/Lvqdlt
         EbHpibXN0zA7EmP0/2X4OW0c8HnuriOJhM5WveR+Ja15O8KUx2mcXFGXWI202CzOjhT/
         yQOg/fsEtabv2vCNPrsrl3xuwfXEJINe6BDL87N/G5NGVbbhqCtAgVT85ZTAbUjMm+Mf
         FlHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5cDnvIyY5OWtrOX/rbp9uFGeGbsbYDnATlEGk6WuY7WfBnEMv6rOuM7IMNpZOw7zCnrkgjHYX0dI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2yPPfNJIUwfnlGYG+uLD/pZtLMUdCZKmG2wd5fpIYWhZC+gPb
	SHn06Rru8UZbd7IPde5MbGnurSaIy86lDuo8bjIfHqJ9qVU9a794VyQK
X-Gm-Gg: AeBDievpJ05MYCheMv6ABLZ+0pOPZmW7qR3H7arvDsi7kquOcqGaa3h6ERfsIC9ZkMk
	JxVaauHa+/9967JGrTr7uiGlB6Ulkvv97N0hhSnEkcTDW8Y32hTT2NWtDIEW1TPjIs8aXM0emyz
	t9dLafBn/MBQ8cSOkKxz8H8h49PT3flFdVNAhtjzSLpk1VGKth8oY1c7A6bGQ5w7AgEenk3GjHf
	TrN/KYjgdQYMRBfEiMolE0gF+qwpDgrh87FDK8fOkueqItJqcu6l/gpdScnZxk8b/NZHRVIWW0f
	3Pzs9foACkvlEkeVXMTVvISU/GchqgJ33ytwjwjwctUM1sOGw1X/N63dGZY/YC7QTtbD/6BqTh2
	zC9TDVPFDOm0w1KEdxK0QKcRNl9j3Oou4LMBeOp7NehnvpzNQFxC4+ewJ4phhLT/h8KBBxiM+Ax
	suG89Wf5PcexzDERs22m98CHm+loWAgqQf00cXpnHOiaS+Y3rI3KuihIUdZDfLrJLodiBRdONO/
	K7yCb0Yq7PBCA==
X-Received: by 2002:a05:6402:5254:b0:66d:d2f9:51f9 with SMTP id 4fb4d7f45d1cf-66e3f4d8b5emr8003271a12.11.1775558863738;
        Tue, 07 Apr 2026 03:47:43 -0700 (PDT)
Message-ID: <30c95ac5-bc1e-4cbd-9a8a-bb1c5ec53922@gmail.com>
Date: Tue, 7 Apr 2026 12:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/27] xen/riscv: rework G-stage mode handling
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <2c8f1ea25b8d3ec78b00510fbe604a87e759e194.1773157782.git.oleksii.kurochko@gmail.com>
 <fb4a8f75-d3f8-4e8c-9b45-1194c78659f5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fb4a8f75-d3f8-4e8c-9b45-1194c78659f5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775558864-45132CD1-A05B86F9/10/73395122804
X-purgate-type: spam
X-purgate-size: 4857
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A21DE3AD2F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 3:19 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> Rework G-stage mode handling to make the selected mode descriptor reusable
>> outside of p2m initialization.
>>
>> As max_gstage_mode is going to be reused by code that creates CPU nodes for
>> guest domains, not only max_gstage_mode->mode but also max_gstage_mode->name
>> is required.
> 
> I guess I'm not DT-savvy enough to understand why that would be.

There is an optional mmu-type property for each cpu:
https://github.com/riscv-non-isa/riscv-device-tree-doc/blob/master/bindings/riscv/cpus.txt#L73



> 
>> To support this, make max_gstage_mode a global pointer to one of
>> the entries in a global modes[] array, and remove get_max_supported_mode().
>>
>> Update struct p2m_domain to store a pointer to a mode descriptor instead of
>> embedding the structure directly.
>>
>> Refactor the modes[] array so that mode->name contains only the MMU scheme
>> name (without the "x4" suffix), as this value is reused when filling the
>> maximum MMU type passed to the guest. According to DT bindings [1], the MMU
>> type must not include the "x4" suffix. Use "none" for the Bare mode to match
>> the DT binding requirements.
> 
> I expect this DT aspect is also why Sv changes to sv in the table? (Which
> is a little unhelpful for the printk() where it's used.)

Yes. According to the link above the following options could be passed:
                             "riscv,sv32"
                             "riscv,sv39"
                             "riscv,sv48"

> 
>> Adjust modes[]->paging_levels to represent the maximum paging level rather
>> than the total number of levels. This ensures that P2M_ROOT_LEVEL() and its
>> users behave correctly without relying on hardcoded p2m mode values.
>>
>> Finally, drop __initconst from the modes[] declaration, as the array is
>> referenced via p2m->mode and max_gstage_mode beyond the init stage.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v6.19-rc3#n82
> 
> Is a reference into Linux doc really providing something "canonical"? Surely
> there's an independent spec somewhere?

I wasn't able to find better source for arch-specific definitions. For 
example, the source mentioned above has outdated mmu-type properties 
which should also contain riscv,sv57 and riscv,none.

> 
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -45,18 +45,32 @@ struct p2m_pte_ctx {
>>       unsigned int level;          /* Paging level at which the PTE resides. */
>>   };
>>   
>> -static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>> -    .mode = HGATP_MODE_OFF,
>> -    .paging_levels = 0,
>> -    .name = "Bare",
>> -};
>> -
>>   /*
>>    * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
>>    * restricted by external entity (e.g. IOMMU).
>>    */
>>   unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
>>   
>> +static const struct gstage_mode_desc modes[] = {
> 
> As a function scope static this was a fine identifier. Please consider whether
> with the wider scope gstage_modes[] might not be better.
> 
>> +    /*
>> +     * Based on the RISC-V spec:
>> +     *   Bare mode is always supported, regardless of SXLEN.
>> +     *   When SXLEN=32, the only other valid setting for MODE is Sv32.
>> +     *   When SXLEN=64, three paged virtual-memory schemes are defined:
>> +     *   Sv39, Sv48, and Sv57.
>> +     */
>> +    [0] = { HGATP_MODE_OFF,    0, "none" },
>> +#ifdef CONFIG_RISCV_32
>> +    [1] = { HGATP_MODE_SV32X4, 1, "sv32" }
>> +#else
>> +    [2] = { HGATP_MODE_SV39X4, 2, "sv39" },
>> +    [3] = { HGATP_MODE_SV48X4, 3, "sv48" },
>> +    [4] = { HGATP_MODE_SV57X4, 4, "sv57" },
>> +#endif
>> +};
> 
> The dedicated initializer form isn't adding any value here (whereas it slightly
> hampers readability). You really don't want the array to be sparsely populated,
> so perhaps better to leave as it was before?

I need modes[] to be outside of gstage_mode_detect() as it then could be 
re-used. For example, if expected G-stage mode should be passed by DTS 
property then in DTS property we'll have something like:
	chosen {
             ...
             DOMU1 {
                 mmu-type="riscv,sv48";
                 ...
             }
             ...
         }

And I will need to have another functions something like:
   static unsigned int find_gstage_mode(const char *mmu_type) {...}
which will re-use modes[] to find a correspondent mode and return an 
index (or return just correspondent mode) for that mode to then re-use 
it to initialize p2m->mode:
     p2m->mode = &modes[find_gstage_mode(mmu_type)];

~ Oleksii

