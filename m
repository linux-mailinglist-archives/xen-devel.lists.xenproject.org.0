Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOozO1xClGm3BgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:26:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAF14AD51
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234761.1537885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIHM-0004YF-Pa; Tue, 17 Feb 2026 10:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234761.1537885; Tue, 17 Feb 2026 10:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIHM-0004V8-ME; Tue, 17 Feb 2026 10:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1234761;
 Tue, 17 Feb 2026 10:26:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsIHL-0004V1-D6
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 10:26:03 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e424c85-0beb-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 11:26:01 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so45300065e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 02:26:01 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a29982sm103769865e9.15.2026.02.17.02.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 02:25:59 -0800 (PST)
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
X-Inumbo-ID: 0e424c85-0beb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771323960; x=1771928760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VIPKhxl26Cc1xDcD+huJmGNKPP7ZnTaEskrRCs+Rpg0=;
        b=LnISnONMC8BrduK9XZraRzw8yeEtqW3wq6FusQrL7EV1jPHNOACEM1qdUPMoqvfV7l
         xIjgEXAb5HqLTLPphhIlalRJgw9r+aJsGop9uVi+rp0V0lJpjnZJm0GM0EufHPTN56Po
         ucIVlF4rFXemlkPwSd95nb7Sle5Cz6F/d8T2kI4I/F9ksxeQ9yIbrAOpuxdTmMjYU/Zj
         MIxXMWke3mkJ35eLJClswBkje+654hcrcWFvUFe5k1rnSB7BriyF8CR3Bj1B/uyB28aV
         SnE4pRjAoAJyfuNBhKGKTStCmIUwNcgLZmNiu07gsZg4uJlQN1rkNCFtFIwMnlKCvpE+
         yNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771323960; x=1771928760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIPKhxl26Cc1xDcD+huJmGNKPP7ZnTaEskrRCs+Rpg0=;
        b=Y7/9YBBauKF1MnFJSKxm5Z/TD3+hH2/3hAjNDl+GDYu9WNc0BOFzCHL1EIxh3M36jH
         VCo/kNXaxRiMdl5qyjQaUDJZS97gfFIQoy+CspPWBkbE3JO40t6U9yj/D/9H0CkYIO0P
         UxySOdg6Fd84ZjZChKsfVPZJGd5z4MBlqwdfU/amq1FZ1o08jJ5lOLycKxs8Tnrp9Mjp
         7VQbSIUjW87Ae//i/yuK0JZPae/WNEViBaJYnRZVcZLNgH647uGzpn03dop+GT8pH6JW
         KCHqlrqOQQbLNqOGo6GAV4mY1oUL+0ttmgCS1idha00K3KX13C/KoZ6Mst2nwHWNiMXL
         XbRg==
X-Forwarded-Encrypted: i=1; AJvYcCUL+VspZ35YX3mA9dcBa/veeuu9TP1G2LwYmvPGp/7QuuT+BNY8aC20a+oS4ttg1FFKZK5PmESAwqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBUbNxW13V1dgVdQCZ3vEtWxqsbrB8gNKwa4Jh/EnIBfGin8SW
	J0Gs2oDnWWMZed4/YvQd8a2o6uCFxHSz9ZZ9+nK0IyKnoH0VaNeD2fke
X-Gm-Gg: AZuq6aJ22LH0tou0IBwNZbyDQ1SW1t6zFFPT1gqyTurNf8PtoAZrqe1QNWuFAMpHpZZ
	xqNaxINRMn5WPQxQs9csZncoi71mDa95AiyO97gTSo6xDWAoKlr4PrYXjC+wwpo/JHaairvY1BM
	JKhRczEW9R40A20Aif/zEP3QXPwMpvuLAWC5FWxvYqmivvJsmjuowKgr9weUOJbnG6JT8Ek/YW8
	qT7dbM9hAmYbGD3HAOiDEPgswTRaVZGYrUUUTxM6hByBFYQWn57WCAjgLMS0GJMhbakKBR28j5u
	QW6UlIuYXic9Ob0boLLYvAaMH42VX33iNqQpLupSFAX7vjC+IipFZOtE7HUDrlr042R88nQnHIA
	Mbekrjw1FoU6Zc8K1HKuie8qyMSRG6hzQpLD4O8bsCjNjebbnjyJp26ZbDHwiaY+wrP6hUgkciU
	iJYXHxTukJw1u2UDLztvAYRUT8r0wxRIMNpSsVznrcAZWmErshvF8q1xcb0hMWO9zb0Yh5+N0Tw
	729r/WhbuWXCA==
X-Received: by 2002:a05:600c:c04b:10b0:483:7eea:b172 with SMTP id 5b1f17b1804b1-4837eeab900mr123033345e9.23.1771323960150;
        Tue, 17 Feb 2026 02:26:00 -0800 (PST)
Message-ID: <69cef6db-cd39-457f-a5f1-b2f0078b57e7@gmail.com>
Date: Tue, 17 Feb 2026 11:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: implement copy_to_guest_phys()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <cb50d76c627cb666317b23ae136ca43bfbfd04c5.1770821989.git.oleksii.kurochko@gmail.com>
 <1edea973-4ca1-491f-a9bf-9c2b09bbe615@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1edea973-4ca1-491f-a9bf-9c2b09bbe615@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 56BAF14AD51
X-Rspamd-Action: no action


On 2/16/26 3:57 PM, Jan Beulich wrote:
> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/guestcopy.c
>> @@ -0,0 +1,112 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/domain_page.h>
>> +#include <xen/page-size.h>
>> +#include <xen/sched.h>
>> +#include <xen/string.h>
>> +
>> +#include <asm/guest_access.h>
>> +
>> +#define COPY_from_guest     (0U << 0)
>> +#define COPY_to_guest       (1U << 0)
>> +#define COPY_ipa            (0U << 1)
> Like already asked elsewhere - is "ipa" a term commonly in use on RISC-V?
> To me it's Arm terminology, which you don't want to copy as is.

As we discussed in another patch thread, IPA isn't really used for RISC-V
and I will rename it to GPA.

>
> Also, don't you prefer to use BIT() everywhere else?

Yes, BIT() would be better for consistency.


>
>> +#define COPY_linear         (1U << 1)
>> +
>> +typedef union
>> +{
>> +    struct
>> +    {
>> +        struct vcpu *v;
>> +    } gva;
>> +
>> +    struct
>> +    {
>> +        struct domain *d;
>> +    } gpa;
>> +} copy_info_t;
>> +
>> +#define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })
>> +#define GPA_INFO(domain) ((copy_info_t) { .gpa = { domain } })
>> +
>> +static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
> The caller has to pass in a domain here. I therefore recommend against
> use of copy_info_t for this function. Or wait, this is misleading, as
> the consuming part ...
>
>> +                                            bool linear, bool write)
>> +{
>> +    p2m_type_t p2mt;
>> +    struct page_info *page;
>> +
>> +    if ( linear )
>> +        BUG_ON("unimplemeted\n");
> ... of "linear" is missing here.

Yes, for this once cases it will be used vcpu as an argument passed by "copy_info_t info".
I will add the comment above suggested below BUG_ON(linear).

Btw, I think it makes sense to change linear to GVA to be more close to RISC-V spec?

>
> In any event, this one please shorter as:
>
>      BUG_ON(linear);
>
>> +    page = get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt, P2M_ALLOC);
>> +
>> +    if ( !page )
>> +        return NULL;
>> +
>> +    if ( !p2m_is_ram(p2mt) )
>> +    {
>> +        put_page(page);
>> +        return NULL;
>> +    }
>> +
>> +    return page;
>> +}
> The "write" function parameter also is unused, but there's no BUG_ON() for
> that one? Imo the p2m_is_ram() check isn't thorough enough (on the Arm
> original): p2m_ram_ro shouldn't be allowed when "write" is true. As soon
> as you gain p2m_ram_ro on RISC-V, things will need updating here as well.
> Perhaps best to leave a note.

I will apply your changes from suggested for Arm patch (Arm: tighten
translate_get_page()) so write will be used and also no extra updates will
be needed here.


>
>> +static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>> +                                copy_info_t info, unsigned int flags)
> Why an "unsigned long" return value when ...
>
>> +{
>> +    unsigned int offset = PAGE_OFFSET(addr);
>> +
>> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t));
>> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t));
>> +
>> +    while ( len )
>> +    {
>> +        void *p;
>> +        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
>> +        struct page_info *page;
>> +
>> +        page = translate_get_page(info, addr, flags & COPY_linear,
>> +                                  flags & COPY_to_guest);
>> +        if ( page == NULL )
>> +            return len;
> ... only an "unsigned int" (or 0 further down) is returned? Same
> question for copy_to_guest_phys() below then.

Agree, unsigned int should be enough.

>
>> +        p = __map_domain_page(page);
>> +        p += offset;
>> +        if ( flags & COPY_to_guest )
>> +        {
>> +            /*
>> +             * buf will be NULL when the caller request to zero the
>> +             * guest memory.
>> +             */
>> +            if ( buf )
>> +                memcpy(p, buf, size);
>> +            else
>> +                memset(p, 0, size);
>> +        }
>> +        else
>> +            memcpy(buf, p, size);
>> +
>> +        unmap_domain_page(p - offset);
>> +        put_page(page);
>> +        len -= size;
>> +        buf += size;
>> +        addr += size;
>> +
>> +        /*
>> +         * After the first iteration, guest virtual address is correctly
>> +         * aligned to PAGE_SIZE.
>> +         */
>> +        offset = 0;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +unsigned long copy_to_guest_phys(struct domain *d,
>> +                                 paddr_t gpa,
>> +                                 void *buf,
>> +                                 unsigned int len)
> May I suggest to make good use of line length, just like how copy_guest()
> does?

Sure, I will do that.

Thanks.

~ Oleksii


