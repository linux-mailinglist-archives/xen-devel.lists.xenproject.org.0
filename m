Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F658FE25
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 16:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384639.620054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8zw-00059X-58; Thu, 11 Aug 2022 14:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384639.620054; Thu, 11 Aug 2022 14:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8zw-00056g-1C; Thu, 11 Aug 2022 14:17:20 +0000
Received: by outflank-mailman (input) for mailman id 384639;
 Thu, 11 Aug 2022 14:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=foSi=YP=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oM8zu-00056a-6E
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 14:17:18 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d3d9a45-1980-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 16:17:17 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so5233156pjf.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 07:17:16 -0700 (PDT)
Received: from leoy-huanghe.lan (n058152077182.netvigator.com. [58.152.77.182])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902e5c800b00170a359eb0esm9446133plf.63.2022.08.11.07.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 07:17:11 -0700 (PDT)
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
X-Inumbo-ID: 4d3d9a45-1980-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=C8Zf2NSvfDsDU1qGut500fi9G7IQx8n0oSWEzCgVfIg=;
        b=zmUR88JIAsi3JxmbFzbYZ0cS75C5eZdvjTvDlEtg9yG4LDN4HFySLVXxRr6vBvFKd1
         kPTdUXpNud57u410H9Xhwll1F/Q34PmiWMXTok0T51T2kfy/oAxxVjW14AYyx6BB1K6R
         +QbUq9tiYcLL7WkQ15BvyUZydU2L+lJCba3rxUIkScKdDFt3Lk++RrZr1WC+N+D/HbXx
         Xe3cw7qqBeUoQZ91kpADvvuYXtfRPd+Z2nAlzdgvFbs+7BdhiitTUZO4gPRPK90ep2Ji
         xkmlpAAQTc8H82ceMhQLm+vlhQ+Nijvea1mgLanMyZpM2P+JFaJb/ul2KgcCXBkRhqNr
         /HRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=C8Zf2NSvfDsDU1qGut500fi9G7IQx8n0oSWEzCgVfIg=;
        b=CBUEWFoEJQKm6CFjdOKkroK5H7Ogb0zDWE7eIkhe56C6FjnD9ZQ+fghtlG4b3tFstp
         /z/S7PmW7LuaYXLCV7usTq9AgS6HL1Ae5Z8Dkzv8u5FLZ5h0gGU1FA4VMBC4MyOv9woa
         xS+S780ZGaXyb3FKq4lX2tmuDkrqy7qxnicO41K1GEPBNWuQbcwxp5eQwrlCtsYeJLMo
         5wnr1BXTPcZ3CneZcSrYotKOak0BNbPVbqnSkfH3AovVfirxjQaTjBgqOpVS/SSRu0Ed
         Ww1xDLphVEIJYerAsgP3wcHpCYkCKVyU4ZAAm62217QdT9VGL2gtsNj0+pwZ6QU+XXCp
         Xt1g==
X-Gm-Message-State: ACgBeo04zhhtj2Pq6xm5OzspQ3ZYX++iOS7k0ADiVMawVZ5zp/EzgW/z
	QmWdgS/p1gdTvhykvKPFIa4Zlw==
X-Google-Smtp-Source: AA6agR5ORDVzX0hn5csZu/4hcVbAhZCP5wL2HcM6Ed3tSuxyAG4tpDePd/DISbcyW4Nf65t3VIeY/w==
X-Received: by 2002:a17:902:8502:b0:16c:c5c5:a198 with SMTP id bj2-20020a170902850200b0016cc5c5a198mr31988808plb.88.1660227435254;
        Thu, 11 Aug 2022 07:17:15 -0700 (PDT)
Date: Thu, 11 Aug 2022 22:17:07 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Message-ID: <20220811141707.GB868014@leoy-huanghe.lan>
References: <20220804081253.GA1219098@leoy-ThinkPad-X240s>
 <D6DDAE40-A8EF-4230-A292-401FBA085EE0@arm.com>
 <EA8A294E-856D-4579-B26E-55F6B7EB477C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EA8A294E-856D-4579-B26E-55F6B7EB477C@arm.com>

Hi Bertrand, Rahul,

On Fri, Aug 05, 2022 at 12:05:23PM +0000, Bertrand Marquis wrote:
> > On 5 Aug 2022, at 12:44, Rahul Singh <Rahul.Singh@arm.com> wrote:

[...]

> >> Looked into the code, the GICv3 driver tries to create persistent
> >> reservations for pending pages, and the persistent reservation table
> >> can be used by kexec/kdump.  For the persistent reservations, it
> >> relies on MEMRESERVE EFI configuration table, but this table is not
> >> supported by xen.efi, I think this is the reason for the above oops.
> > 
> > Yes, you are right above warning is observed because Xen does not support 
> > memreserve efi table. I also observed a similar warning on the N1SDP board.
> >> 
> >> I checked that if I boot a host Linux (without Xen), then the EFI has
> >> provided MEMRESERVE configuration table, I can get below log:
> >> 
> >> #  dmesg | grep MEMRESERVE
> >> [    0.000000] efi: TPMFinalLog=0x807f9ef0000 ACPI 2.0=0x807fa0d0018 ... MEMRESERVE=0x807f8141e98
> >> 
> >> Just want to confirm, is anyone working on enabling MEMRESERVE EFI
> >> configuration table for Xen?  And welcome any comments and
> >> suggestions!
> >> 
> 
> No I do not think anybody is working on this at the moment.
> If you want to work on adding support for this in Xen, we can provide support
> and help on reviewing and testing as we have several targets on which we
> observe this (N1SDP and Ava).

Thanks for your quick response.

I took time to look into the code, below are my conclusions.

For a normal UEFI boot flow, UEFI will invoke Linux kernel's EFI stub,
and the EFI stub will install MEMRESERVE EFI configuration table.
This is accomplished in the Linux function install_memreserve_table().

Secondly, Xen passes DT to kernel, it synthesizes ACPI compatible
nodes in the device tree and finally kernel parses DT and create the
ACPI table.  In this case, Xen doesn't invoke Linux EFI stub.

To be honest, I have very less knowledge for Xen and APCI; just based on
reading code, I think it's hard for Xen to invoke Linux kernel's EFI
stub, this is because Xen needs to provide the EFI runtime services, and
I don't think it's feasible for Xen to pass through UEFI's runtime
service to Linux kernel.  If we implement the EFI runtime services for
Xen, then this would introduce a big implementation.

So another option is we simply add MEMRESERVE EFI configuration table
into device tree, just like Xen does for other ACPI tables (e.g.
RSDP?).  And then in Linux kernel, we need to parse the DT binding and
initialize the corresponding variables in kernel, so we need to add
support in the Linux source drivers/firmware/efi/fdtparams.c.

Before I proceed, just want to check which option would be the right
way to move forward?  And I am open for any other solution and welcome
suggestions.

Thanks a lot!
Leo

