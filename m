Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBAD3B9577
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148981.275374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0Qo-0003OS-4D; Thu, 01 Jul 2021 17:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148981.275374; Thu, 01 Jul 2021 17:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0Qo-0003MC-03; Thu, 01 Jul 2021 17:24:54 +0000
Received: by outflank-mailman (input) for mailman id 148981;
 Thu, 01 Jul 2021 17:24:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30oQ=LZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lz0Qm-00035P-HO
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:24:52 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0c10b64-d8a7-4662-9e9f-01bc1a1ab55f;
 Thu, 01 Jul 2021 17:24:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso4633198wmj.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jul 2021 10:24:47 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:dd08:98e8:6495:64d2?
 ([2a00:23c5:5785:9a01:dd08:98e8:6495:64d2])
 by smtp.gmail.com with ESMTPSA id o3sm613049wrw.56.2021.07.01.10.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:24:46 -0700 (PDT)
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
X-Inumbo-ID: f0c10b64-d8a7-4662-9e9f-01bc1a1ab55f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bM636ttOBoWSgPMiqkDWtkSD1pigvPw7drXBJk2dQSo=;
        b=CoYAhA25qZuZPHQ03Z3conMZVB/j7nIxyTpV8KAfawMUJcGMdM2D6rJgltGNtKQtg3
         Nudzew74AD9NWYs5euIQatfkbrD1P4ZdJjFelHclGcN6HD3itT3LzuUtdyI5or17Oo7M
         WOUnlUWG/ix7ZxEk5RQEhWxPd3PohJpGrM8dCRCE0kRF9k9+3TIRA2GvzpzEvq8VQDPQ
         T451NjlwgFDG9QX0dEdb8WYHkyX5VCmgKvqvNrT1Rtao2bMxOwJbCCp5I0fdTnhcaPfT
         kjBvboXlWxoajNEUbdErN9UHqMlPBQkpBPDF6sD4icsJsGehTGjCNkjZM0M3c+XVFMZJ
         42MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bM636ttOBoWSgPMiqkDWtkSD1pigvPw7drXBJk2dQSo=;
        b=aVL0R1xjxMBrmyytx5EVVaG3msTUmXci+BHL8FMXRp1BpsSyag6I7XJMVPAlzXazF2
         9SBIwA8sx2h1qmNX8ooYYW772t4BMvcBGTHGL348xUJOzjdhxfCb8l/sGXoHh5hZT33L
         D7oksgxvcCyIIn6Zk+VUhxKHxwhudWtyK4jS3eDzEiHDLb5Z7JVrlFx1YHcCnEqhwgrP
         uYmTNwF5LX7OYiRuW23p1FdD4L0nfhRgtxiSmNsJkxHMwFwjMyahF4I4JWKYDV95aa8Y
         bHIqEfEBDuTs4+Ex3lC1hbTCirNJjHH2rBIdF1imI/Z0GCibsXMDHFFL/HvggfKlj8tq
         j1EA==
X-Gm-Message-State: AOAM530MF92Lcr8CrX23LbXYcS23FvsTvjs2k6zZTnmkGZqvBy4eI7F3
	LYeT5LKceJ/6A2yk18LRPno=
X-Google-Smtp-Source: ABdhPJzR73BRmIIfFijATpWTS27jawGoNo9rHaVB8ejaBTxpMp3GuQyBgjKXZ0J3VDzp6rMyNUNe3Q==
X-Received: by 2002:a05:600c:5112:: with SMTP id o18mr797431wms.15.1625160287101;
        Thu, 01 Jul 2021 10:24:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
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
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-19-anthony.perard@citrix.com>
Message-ID: <bf148f2b-8256-0be0-0ad1-91e1f7b05482@xen.org>
Date: Thu, 1 Jul 2021 18:24:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701141011.785641-19-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/07/2021 15:09, Anthony PERARD wrote:
> This avoid the need to create the symbolic link "include/asm".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

