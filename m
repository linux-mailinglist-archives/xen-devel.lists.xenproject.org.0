Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794D3C92BA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 23:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156244.288307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3m2M-0005yz-RQ; Wed, 14 Jul 2021 21:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156244.288307; Wed, 14 Jul 2021 21:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3m2M-0005wq-OF; Wed, 14 Jul 2021 21:03:22 +0000
Received: by outflank-mailman (input) for mailman id 156244;
 Wed, 14 Jul 2021 21:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+SWe=MG=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1m3m2L-0005wk-PK
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 21:03:21 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9c6e69d-14e9-4192-8e50-28aba4eb8fdc;
 Wed, 14 Jul 2021 21:03:20 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so4687376pjb.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jul 2021 14:03:20 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4c02:4c00::1? ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h14sm3843966pgv.47.2021.07.14.14.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 14:03:19 -0700 (PDT)
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
X-Inumbo-ID: d9c6e69d-14e9-4192-8e50-28aba4eb8fdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s7BdSsJEg8VF21zupu1h+/GHDXA+/+S9ZJ8X81z9xCk=;
        b=AiKwXZc8q09JFNeNDfyhqPyT5W4wGexFZJqBYYPwML/zcDIbxVdHVTPbuEXP7Cm/sv
         C0hae2kE5BRuerxw/8NQYQKHjZKlweEoSuUVLkeUh2WZcJ8rceEwpYg4pIbSifFBttf1
         QceG8YH3xGDj+vM/Bvcj+yhdQCOjHmvwulY4rh+4U1glHJfEPVInCRj2bhuwkey/EltN
         5dM9T8x/dg7nOHFcJjQYKozxmWGsctNbbTtuvhjJG4s2UXNE6hNfTS5pbAGl+vL1Zihw
         qmvJqimIdE+77ElUWavW0PwvwEZjF46sioeoh3bNWP0IYAbvwmMhmQTgKn7GUZ5m4p8O
         a6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=s7BdSsJEg8VF21zupu1h+/GHDXA+/+S9ZJ8X81z9xCk=;
        b=Voh7KYgr6VMm1NslxW04bHrUsx4Vc2M4Lu9fcUQefZQdNSF1x6PGd7DA5L+eDM9KJh
         Y4pjoyK/IXSDQRvYRbKYEPqjbQ8qqDYgxZapg97ROqM/J6iosf0ajuHB/FIC1DFYtcil
         gl8WlYYDUGg/uLqyEIdaJhUovcLXArHHFz4QSsdcnNcc86OPk622qiOJjoWM36QCRqLM
         rODmlhnsYD2beWp/rr3s1RvYyUwKLmOc4dRsHULXpuAeT8Nywo6Hx53XcuYxoVMf9U4R
         XipimOXjBVpIkcyXUh57JsWkyOEQ2wButiugjoO7dplDbTz2NqadGnv8mnQFroBEIkD8
         hw+g==
X-Gm-Message-State: AOAM530bI7XPO1YP6ahpPalZzBF/pePTeKRsgj8lrM665uTTsz63UB+n
	wNKX5DWD6PeYoVxsIU3RYWSYh2QP2lNDviRH
X-Google-Smtp-Source: ABdhPJzC7D6Q8m8J1dhaFZNR81shqyUzFvj0F1LYjV40XLn2LKMAn396arYs8hWDuo2hgWy5KEJrNA==
X-Received: by 2002:a17:903:189:b029:12b:3fd7:d95d with SMTP id z9-20020a1709030189b029012b3fd7d95dmr15653plg.24.1626296599760;
        Wed, 14 Jul 2021 14:03:19 -0700 (PDT)
Subject: Re: [PATCH 1/4] build: use common stubs for debugger_trap_* functions
 if !CONFIG_CRASH_DEBUG
To: Jan Beulich <jbeulich@suse.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
 <2fc1a1416d37b5eed0ebfdeff8bb9dd61bc7acc7.1626136452.git.bobby.eshleman@gmail.com>
 <7468d092-42c5-34a1-74ec-7500e1bc7bf1@suse.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <b6124fdd-b8da-b924-bf6f-1df6456f5926@gmail.com>
Date: Wed, 14 Jul 2021 14:03:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7468d092-42c5-34a1-74ec-7500e1bc7bf1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/14/21 2:34 AM, Jan Beulich wrote:
> 
> ... we strive to have new insertions be sorted alphabetically. When
> the existing section to insert into isn't suitably sorted yet, what
> I normally do is try to find a place where at least the immediately
> adjacent neighbors then fit the sorting goal.
> 
> Sorry, all just nits, but their scope is about the entire patch.
> 

No worries at all, I welcome the corrections (I need to learn the
proper style somehow).

>> --- /dev/null
>> +++ b/xen/include/xen/debugger.h

...

>> +
>> +static inline bool debugger_trap_fatal(
>> +    unsigned int vector, const struct cpu_user_regs *regs)
> 
> I'm afraid the concept of a vector may not be arch-independent.
>

The only way I can imagine it not being arch-independent
is if it is thought of as a trap number or id, instead of
implying an entry in a vectored trap table.  I don't
really understand this subsystem, so I'm probably missing
context.

Are you suggesting a rename or a different approach entirely?

> 
> Jan
> 

Thanks Jan, everything besides the vector thing are incorporated in
the v2 I've just sent out.

-- 
Bobby Eshleman
SE at Vates SAS

