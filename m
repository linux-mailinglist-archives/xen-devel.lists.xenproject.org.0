Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FDACECAE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 11:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006450.1385629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6hX-0005SW-1t; Thu, 05 Jun 2025 09:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006450.1385629; Thu, 05 Jun 2025 09:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6hW-0005QJ-Up; Thu, 05 Jun 2025 09:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1006450;
 Thu, 05 Jun 2025 09:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN6hV-0005QB-2h
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 09:15:53 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd820a2-41ed-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 11:15:51 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450caff6336so4184055e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 02:15:51 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb169336sm12113595e9.1.2025.06.05.02.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:15:49 -0700 (PDT)
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
X-Inumbo-ID: acd820a2-41ed-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749114950; x=1749719750; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/qWXu8KxmH1W/UcnnhGyan8SaigjVhFkCwT1GCDGwy4=;
        b=hDP1+RlNToMgcHwwdKpLmKmhArlUQ58bhRG2vo4DrNYxDRIr8aCxCIGYFp9rGyEUQQ
         YStmBV1O9cq8Rzz2R1LD7KvCSkE+oDq3KopYNkbLLeJ7hdyi1zxodihMj0WZyoZ5gQhw
         PXQmyar6a7VLn94kxFwcIQb0uWeLkMGCsilQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749114950; x=1749719750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qWXu8KxmH1W/UcnnhGyan8SaigjVhFkCwT1GCDGwy4=;
        b=Ch2HAkz9fMS5O8oIKirZo2c6JDSRPoWkcfKDXNKyjhGH1m10YmhlfqObYyJbfVPvfb
         aldJoay/PkEksZ35owWRsPzs6mpCDrPHML9D2WTcFmZiJkekWxAaZxNsaRWnIdHs89zu
         +2b4HMzaOS2tGJ7JscQqYdZ/3M+5yo71pCBwWd7l+zzgjr7oLY+eBIhRwXPgtnB83EPd
         aG75PmNy45N02LyEmrNM7Ik1tVL8VEj4DmqXTndEMZw8WEq4y2yQ4/ET4mf3bfWnAzcB
         g/pkme+hC8ZKT1f11PyiuNnkIK6f4pFcnx/DklBHLHstcDEEbUE0OUHBWpEjDK3NRa4y
         zn1w==
X-Gm-Message-State: AOJu0YwJSpQ+gHj5kkxMD/8xO4te5sw9RZK3WclMw3fI0lFPqtWi71cg
	BfOyaNt5dCDBqCGyFvI0oKYmcDSbQQ0msTA36gc7+1tv6RCp1Fo9Dey+1SDkcPb6bKM=
X-Gm-Gg: ASbGncvOOI8KhvPb3zNkhagwZ40iT5gJeuVA7KsTmd0mrjDpFxK9+v1AdAC0rHQgyRg
	vj2USAr9QoVLY8o1cB9QXIQktNE7fbT7AMxhR760g3r3yCrV78oPjxPItATNVMXh6RA65NjWYWj
	fZgPyS7CX3Rt31Y0QUFeZViLhh9UhczwURqfrNkN2CFeeCZ+Gs04oReJeLejF4eM9BfaSH2LzcA
	Fv8a28Qi4+F774ChIoMWho0cy0POoyhlKK1la59k3uK8wGpSlCRaMBKC2lHGL5PKK1Wcui4XpOi
	ivrWrfNzi6ZkV13l6rLaz6rSA1Uerv3LQ8O09fOozhyfG2i0Gv8fG9+NH34uJ7RgPUpULIXszN8
	xx2LQlN2ylTckXuiW89omD+m9vLrYVw==
X-Google-Smtp-Source: AGHT+IEGAAnvRQlGloFHoSSWFR//wPA+q4YDLzSCnzlwrKlI9bjWDKuMIW21rjbMNez/Je79+LBRjA==
X-Received: by 2002:a05:600c:46d1:b0:450:d5f6:55f5 with SMTP id 5b1f17b1804b1-451f0a6a475mr56255465e9.6.1749114950428;
        Thu, 05 Jun 2025 02:15:50 -0700 (PDT)
Date: Thu, 5 Jun 2025 11:15:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
	Penny Zheng <Penny.Zheng@amd.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
	Mykola Kvach <xakep.amatop@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Grygorii Strashko <gragst.linux@gmail.com>,
	Alejandro Vallejo <agarciav@amd.com>,
	"committers@xenproject.org" <committers@xenproject.org>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: Xen 4.21 Development Update [May]
Message-ID: <aEFgRaSRDMQuvogQ@macbook.local>
References: <7364a71d-2604-49ca-bab7-d21544d49b10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7364a71d-2604-49ca-bab7-d21544d49b10@gmail.com>

On Mon, Jun 02, 2025 at 06:37:46PM +0200, Oleksii Kurochko wrote:
> Hello everyone,
> 
> This email only tracks big items for xen.git tree. Please reply for items
> you
> would like to see in 4.21 so that people have an idea what is going on and
> prioritise accordingly.
> 
> You're welcome to provide description and use cases of the feature you're
> working on.
> 
> = Timeline =
> 
> As there hasn't been any feedback on the proposed timeline shared here:
> https://lore.kernel.org/xen-devel/666e3f49-2f92-4828-8897-8579832bcaa2@gmail.com/T/#u
> 
> We can proceed with the suggested timeline as the release schedule for Xen
> 4.21.
> I've updated the Xen 4.21 Release Notes with this schedule, which can now be
> accessed via the RN link:
>   https://xenbits.xen.org/docs/unstable/support-matrix.html
> 
> = Updates =
> 
> The following items ( the links for them could be found int the list below )
> were moved to completed:
>   [since May 6 - Jun2]:
>     * Hypervisor:
>       - tools: remove qemu-traditional
>     * Arm:
>       - PCI devices passthrough on Arm, part 3
>     * x86:
>       - xen: cache control improvements
>   [since 4.20 relese - May 6]:
>     * Hypervisor:
>       - Move parts of Arm's Dom0less to common code
>       - remove libxenctrl usage from xenstored
>     * Arm:
>       - Enable early bootup of Armv8-R AArch32 systems
>     * x86:
>       - x86/HVM: emulation (MMIO) improvements
>     * RISC-V:
>       - RISC-V some preinit calls.
>       - Fixes for UBSAN & GCOV support for RISC-V.
> 
> Some new items added:
>  [since May]
>     * x86:
>      - Allow x86 to unflatten DTs
>      - hyperlaunch: move remaining pvh dom0 construction
>      - x86/hyperlaunch: introduce concept of core domains
>      - Confidential computing and AMD SEV support
>     * Arm:
>      - SMMU handling for PCIe Passthrough on ARM
>      - xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
>      - Add initial Xen Suspend-to-RAM support on ARM64
>     * RISC-V:
>      - introduce p2m functionality
>  [since 4.20 release]
>     * Hypervisor:
>       - tools: remove qemu-traditional
>       - Physical address hypercall ABI ("HVMv2")
>       - xen: Untangle mm.h
>       - xen: introduce CONFIG_SYSCTL
>       - Add support for exact-node memory claims
>       - Several CI cleanups and improvements, plus yet another new runner
>     * x86:
>       - x86/EFI: prevent write-execute sections
>       - x86: Trenchboot Secure Launch DRTM (Xen)
>       - Hyperlaunch device tree for dom0 (v6)
>       - amd-cppc CPU Performance Scaling Driver (v4)
>       - Hyperlaunch domain builder
>       - kexec: add kexec support to Mini-OS
>       - xen: cache control improvements (should be moved to "Hypervisor"?)
>       - x86: generate xen.efi image with no write-execute sections
>       - x86/asm: cleanups after toolchain baseline upgrade
>     * Arm:
>       - Add support for R-Car Gen4 PCI host controller (v4)
>       - FF-A VM to VM support (v5)
>       - First chunk for Arm R82 and MPU support (v4)
>       - ARM split hardware and control domains (v5)
>       - MPU mm subsistem skeleton
>     * RISC-V:
>       - introduce basic UART support and interrupts for hypervisor mode
> 
> * Full list of items : *
> 
> = Projects =
> 
> == Hypervisor ==
> 
> * xen/console: cleanup console input switch logic (v1 -> v5)
>   - Denis Mukhin
>   -
> https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com/
>   - https://patchew.org/Xen/20250530231841.73386-1-dmukhin@ford.com/
> 
> * xen: introduce CONFIG_SYSCTL (v3 -> v4)
>   -  Penny Zheng
>   - https://lore.kernel.org/xen-devel/20250528091708.390767-1-Penny.Zheng@amd.com/
>   - https://patchew.org/Xen/20250528091708.390767-1-Penny.Zheng@amd.com/
> 
> * Physical address hypercall ABI ("HVMv2")
>   - Teddy Astie
>   - https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.tech/
> 
> * xen: Untangle mm.h
>   -  Andrew Cooper
>   - https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/
>   -
> https://patchew.org/Xen/20250312174513.4075066-1-andrew.cooper3@citrix.com/
> 
> * Add support for exact-node memory claims
>   -  Alejandro Vallejo
>   - https://lore.kernel.org/xen-devel/20250314172502.53498-1-alejandro.vallejo@cloud.com/
>   -
> https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/
> 
> * Several CI cleanups and improvements, plus yet another new runner
>   - Marek Marczykowski-Górecki
>   - https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
>   - https://patchew.org/Xen/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
> 
> *  Remove the directmap (v5)
>   -  Alejandro Vallejo
>   - https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallejo@cloud.com/
>   -
> https://patchew.org/Xen/20250108151822.16030-1-alejandro.vallejo@cloud.com/

Since you keep track of the directmap removal, you might also add the
other ASI related series:

https://lore.kernel.org/xen-devel/20250108142659.99490-1-roger.pau@citrix.com/

I very much doubt I will have time to work on this before the next
release.

Thanks, Roger.

