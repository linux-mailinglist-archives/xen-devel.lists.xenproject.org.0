Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3588A48C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 15:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697766.1088847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolLT-0004cO-KV; Mon, 25 Mar 2024 14:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697766.1088847; Mon, 25 Mar 2024 14:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolLT-0004av-Hm; Mon, 25 Mar 2024 14:30:39 +0000
Received: by outflank-mailman (input) for mailman id 697766;
 Mon, 25 Mar 2024 14:30:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O34W=K7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rolLS-0004ap-7p
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 14:30:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3bbab6-eab4-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 15:30:37 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso4227877a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 07:30:37 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k3-20020a17090627c300b00a45ffe583acsm3117597ejc.187.2024.03.25.07.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 07:30:36 -0700 (PDT)
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
X-Inumbo-ID: 3f3bbab6-eab4-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711377037; x=1711981837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FUFGRGZGIt4FLE2TwoZp+n1GWyfWt97B0lI685Irlvk=;
        b=V/Tgq7e3n1MVQ+8djUJbWmZBuXy4EWVcnFtsDZ6TXiXnVd7GOvnlQM1nXaLN8lWhpe
         KOKax+pUK7/My1RogMhFmrXpH22kaqXHQIvRXFWVJbOAoUSeI8bxscq6N1MDmag84vpW
         kor1jewpy+JZ1PF4ivIJGoe7hzrRybpal2h6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377037; x=1711981837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUFGRGZGIt4FLE2TwoZp+n1GWyfWt97B0lI685Irlvk=;
        b=J2LDjI/CxSgkTl6JaV6FQM+nQERWYaj789xfhu/TNrQTObQT1YdjlpHDW/3NyOcg93
         MYfQvIUbDeYN2rOpzz+PDYQ8/3cZQUEABb3/T+I7oQVCFGAgOmMa/jHUnjvUa3wdfCgU
         EOeMM22RyskYuR6IDUkc5ar1+6b8Bu4ykOzTbQS+DmmCsN9+PtuJbjxYNT8KHmr+1u5l
         5G+3gIOvt/dw7rGb7yZwOPQ9S/RY6ctwNrP4smpokRErL5MtnFG3HLJRcNQMFfahkReV
         KL+i/HRmTqK5Aie5qr8I23mVvZXn5BYVJkoqs+092L+QsP1ENI4VWig22/vXypA6i5XU
         plmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuFEVKvjFi9giP4AqGBpZgB8nf1i9l42/zP3NFgcTXsRwsZ4fxtZdiXIHpNwwpMUXP0i84IoQvne+pXIVhkhtcSqNG2v+6fLFoKKeOM50=
X-Gm-Message-State: AOJu0Yz2aY1btux+fimOgpiFW5PS7CZWSfTiAVdmEm5apN63Pq9QZ0GF
	sP6qyO6QtAHqSvAhOyYuGqhIWy4DaHZAAaPZtY9UP0OXEA1EDRsp0WoHrFTpqHI=
X-Google-Smtp-Source: AGHT+IGL9I45aEre7LYYvf81v6lrp1wsE4W2N58aVft77d0lVnQc8TXx9OCrt+TaW6wI+xZ6DzJOaA==
X-Received: by 2002:a17:906:a197:b0:a47:3437:7fe8 with SMTP id s23-20020a170906a19700b00a4734377fe8mr4818212ejy.51.1711377036710;
        Mon, 25 Mar 2024 07:30:36 -0700 (PDT)
Message-ID: <8895fcce-3738-4bd6-9127-56296369e3e6@cloud.com>
Date: Mon, 25 Mar 2024 14:30:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] tools: add x2APIC entries in MADT based on APIC ID
To: Jan Beulich <jbeulich@suse.com>, Matthew Barnes <matthew.barnes@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
 <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/03/2024 13:50, Jan Beulich wrote:
> On 13.03.2024 16:35, Matthew Barnes wrote:
>> libacpi is a tool that is used by libxl (for PVH guests) and hvmloader
>> (for HVM guests) to construct ACPI tables for guests.
>>
>> Currently, libacpi only uses APIC entries to enumerate processors for
>> guests in the MADT.
>>
>> The APIC ID field in APIC entries is an octet big, which is fine for
>> xAPIC IDs, but not so for sufficiently large x2APIC IDs.
> 
> Yet where would those come from? I can see that down the road we will
> have such, but right now I don't think we do. Without saying so, this
> change could be mistaken for a fix of an active bug.

It's worth adding some context here.

You're quite right in that it's not immediately needed now, but with the
work done on improving the state of CPU topologies exposed to guests[1]
the strict binding between APIC ID and vCPU ID breaks. It's not hard to
imagine sparsity in the APIC ID space forcing the maximum one to peak
beyond 254. The generator present in that series tries to be
conservative and avoid it, but general topologies can theoretically
waste copious amounts of APIC ID space (i.e: by reserving more width
than strictly required to represent IDs of a certain level), and
exposing the host topology sensibly becomes difficult if we're subject
to limitations the host does not have.

[1]
https://lore.kernel.org/xen-devel/20240109153834.4192-1-alejandro.vallejo@cloud.com/

Cheers,
Alejandro

