Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D474B2D14D3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46751.82870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIZh-0003xL-IF; Mon, 07 Dec 2020 15:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46751.82870; Mon, 07 Dec 2020 15:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIZh-0003ww-Eo; Mon, 07 Dec 2020 15:37:17 +0000
Received: by outflank-mailman (input) for mailman id 46751;
 Mon, 07 Dec 2020 15:37:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmIZg-0003wr-NP
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:37:16 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19782f3a-ab27-418f-87fe-ec93720d690b;
 Mon, 07 Dec 2020 15:37:16 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a1so14071705ljq.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:37:16 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u8sm2931943lfb.133.2020.12.07.07.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 07:37:14 -0800 (PST)
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
X-Inumbo-ID: 19782f3a-ab27-418f-87fe-ec93720d690b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WgMYtVxCUDd+WDqbSmvz2/UFjBSEYAqB08KyvfqP6rc=;
        b=X116nSJZsHD1AUBeJVBIeS2VR8FaDvu2u7MMIxmoqvySptPP61WohACMa1sDHRHcm/
         8+TCrcDzz8Wo/5t4DrgFKh3RROYHhgVoHSYgK2IZqkXOTLy5NKVzDHVTxgFpABqj0P8P
         0j/db+3ZYGzEsZqq3fMegCCu1lcLL3Mruo/tgZGW5GJerf0H//m7SO4+JrmmA9QiECnd
         jGHfXGuHBGd13oWQbiEVR+RKnEcDpad7iNwb/rSU/Bpp0Y3+FVD8CRm/UEi/JESS6UAm
         xtFnAq0L9WTV5HX2N9lB8VQmVTtUtY+hP/Mtl87eYUSFqfk/6sThd+PxLheln4cu7yoM
         MCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WgMYtVxCUDd+WDqbSmvz2/UFjBSEYAqB08KyvfqP6rc=;
        b=K9QQSIXv3ZmGSiJQLV5H8xpzQSmcUHJbWl5sVFjazSEJ+xqu8kAaY8xZgJOQl9R7rB
         aaTwGdafz+g3rM5MjbuVZw24m67doquTfBAn2eBDSoS/2SMVECsHmqQo18hsvLFqq3ic
         Gve7TMInjyyk0xs1e1krmKEGblI1/zmzl1Uu3SUFVJZ9VEobS14bScaW0hi2p9o+cQ/3
         noeW4JTjYA6Usy12hGwEkM9QjiJxLa2Qm/lf7Bdkzvu8RNAR+QR9dHTU4DSpDREnzRKb
         rJD2ehhneTc+CgDIO4pammcYTigWi7tafoSdk4CIeYxR6oIzz2HY7un+jhMZFSOBZqsz
         ATyg==
X-Gm-Message-State: AOAM530l1W+hkMXHj+3yzjpWevLgZrkjPt7p42yKrwi9nYbybJN3FOdC
	lFgCvfmQQ2aCz7vVDAwRmVOwZ+DDBzkKgw==
X-Google-Smtp-Source: ABdhPJwkA6mDUtq5GqVPpxnhfSzJbpwt12GJZXd0dnoQXiWsejE8WtwO3B4BQUG5Ck6sp+wiXKLgNw==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr3671482ljg.451.1607355434806;
        Mon, 07 Dec 2020 07:37:14 -0800 (PST)
Subject: Re: [PATCH V3 02/23] x86/ioreq: Add IOREQ_STATUS_* #define-s and
 update code for moving
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-3-git-send-email-olekstysh@gmail.com>
 <78632ed3-e4d4-7b4c-fd0a-504b6b26e78a@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9d17171d-e858-3920-4f69-ca2e4584c20a@gmail.com>
Date: Mon, 7 Dec 2020 17:37:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78632ed3-e4d4-7b4c-fd0a-504b6b26e78a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 13:19, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -74,6 +74,10 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
>>   
>>   void hvm_ioreq_init(struct domain *d);
>>   
>> +#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
>> +#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>> +#define IOREQ_STATUS_RETRY       X86EMUL_RETRY
> This correlation may not be altered. I think a comment is needed
> to this effect, to avoid someone trying to subsequently fold the
> x86 and (to be introduced) Arm ones.

ok, will add.


> With that
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thank you.


-- 
Regards,

Oleksandr Tyshchenko


