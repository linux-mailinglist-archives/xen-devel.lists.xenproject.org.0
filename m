Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FF3B957F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148987.275385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0SK-0004Ju-FS; Thu, 01 Jul 2021 17:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148987.275385; Thu, 01 Jul 2021 17:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0SK-0004GY-Bj; Thu, 01 Jul 2021 17:26:28 +0000
Received: by outflank-mailman (input) for mailman id 148987;
 Thu, 01 Jul 2021 17:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaNF=LZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lz0SJ-0004GD-8w
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:26:27 +0000
Received: from mail-pg1-x536.google.com (unknown [2607:f8b0:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a742286-a903-48e6-a2e0-21818705cd04;
 Thu, 01 Jul 2021 17:26:26 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id d12so6739044pgd.9
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jul 2021 10:26:26 -0700 (PDT)
Received: from ?IPv6:2602:4b:a45e:ca01::9? ([2602:4b:a45e:ca01::9])
 by smtp.gmail.com with ESMTPSA id 195sm582873pfw.133.2021.07.01.10.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:26:25 -0700 (PDT)
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
X-Inumbo-ID: 5a742286-a903-48e6-a2e0-21818705cd04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=puxaSWmR8dmzghTaq+DldI0mhH3+zGEkF2xlex2SX4Q=;
        b=UXU9U2NdEUjg94KzE69NDcWVVpTV8Eyi8ROyPNW2c39AtFlt7eXEQadQeHlu56Lsv+
         SUHAzZA9Jnsm7KaGSmGskyNKdyE4dXockf+63snrMghLbFnnXyJ/483cHpsuF2lr/AOz
         P77YoSQMz2zKICzPoEIe0lmm5w+iu36g+dI1XjKeCHrMnEKzXmPeRJ30aF0nSbyEDpWV
         Wqo6PPCyJrA63v6emMUxwO+W4HYBiPMUum3q6JZaFEJ6V6XDlMaIYfmJmIpbcVQUZFRy
         jiiBDM3hlezav5GP7GdgdTVe3Kcz3yecN2xnLHkr5gXDTqh24nfnhFf9U0QMMcmAdpfC
         txsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=puxaSWmR8dmzghTaq+DldI0mhH3+zGEkF2xlex2SX4Q=;
        b=PIXsK6oYWZY4Vm5jeXymfGUFZneDDhnk0sBTOsdQscgla7GbwEFO8ISJOp6jfu/6uu
         r/HUJAxSM6+aR9kMfhmjPw/duy8u7OmcnXDTmTIpziTLLAqeq+QaNZrIMm326656jhhx
         ViNnH5eWJPwvbqO3PM0NUvK+K2GdaImMW4JzqEZ+x3VlYDVoBy47689S4+blK1OH9CWJ
         JTpdh/7R3ZlzjL/H47yMFL9lAvDzM3305QgUCwytYv0IIkasE/MwF6Qd8GCOEA8ogd7G
         iZxuwkcQeEIO2NQgjoEK2DBP9oF7IgKONTnEFOPXZnxSk7lKhi3OAZtdpLKM00G/OwmW
         37Rw==
X-Gm-Message-State: AOAM533yqQ+Zd8Mnb1sR1THaQy7NLwzjgWc2EZ+ut9LNzfKiWYsHz4ZI
	K1q2OY8DfH4jTAAWPPjHUp0=
X-Google-Smtp-Source: ABdhPJxphjOfc/JZOSY1gk6URvPa4YBCzTNdtVQUy1Bc7b1e9ZtfVks+RUPKNCuJKNkzxbWvDEqEXQ==
X-Received: by 2002:aa7:8884:0:b029:307:4e14:14c9 with SMTP id z4-20020aa788840000b02903074e1414c9mr790039pfe.62.1625160385619;
        Thu, 01 Jul 2021 10:26:25 -0700 (PDT)
Subject: Re: [XEN PATCH v6 18/31] xen: move include/asm-* to
 include/arch-*/asm
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-19-anthony.perard@citrix.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <c25255f5-8b46-7bc1-0627-cc9304fa3c0e@gmail.com>
Date: Thu, 1 Jul 2021 10:26:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210701141011.785641-19-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hey Anthony,

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a52a03969fe..03a5553116a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> -F:	xen/include/asm-arm/
> +F:	xen/include/arch-arm/

... snip ...

> -F:	xen/include/asm-x86/
> +F:	xen/include/arch-x86/


It looks like riscv will also need the same in its "xen/include/asm-riscv/" F entry.


Thanks

-- 
Bobby Eshleman
SE at Vates SAS

