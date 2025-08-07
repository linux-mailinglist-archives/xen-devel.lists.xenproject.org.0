Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CAB1DD4B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073656.1436535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5uo-0003lZ-DY; Thu, 07 Aug 2025 19:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073656.1436535; Thu, 07 Aug 2025 19:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5uo-0003iW-A7; Thu, 07 Aug 2025 19:04:38 +0000
Received: by outflank-mailman (input) for mailman id 1073656;
 Thu, 07 Aug 2025 19:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uk5un-0003iQ-1k
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:04:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 597a02ba-73c1-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 21:04:31 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so11396595e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 12:04:31 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b8aab8c0sm237292645e9.19.2025.08.07.12.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 12:04:30 -0700 (PDT)
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
X-Inumbo-ID: 597a02ba-73c1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754593471; x=1755198271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8MIpdjmfH98TCgyyxMleGJjD5tieYsqryJwfoVYi/iY=;
        b=Y/c2ME74xmMmO4nbE129stwUjKgkLXwTx7RVdeODCp49WHjf1rTV4nG/vRxMQPNbIz
         7GXGoJENFGUY3uM1aty94hhnGxW8cWg03QgWDIde8SrLOidFZj+DMh4bshpl43bXjNI+
         NJb0if4q6NVS2tNAlLlG+2G6Ai11DQRXfg3bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754593471; x=1755198271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MIpdjmfH98TCgyyxMleGJjD5tieYsqryJwfoVYi/iY=;
        b=Og8AUelqQaGZFS2ues/PDRBKF8X3xnEkKKI0NiaIgPQFXCFzlXP0asaFiZE6i0g4AU
         x7OgEJIxhDf5/MLctPX+jmfMK6P6pCn1sxnjuNdmn4VWTXqx5S4HKjPeoMUjQUdNXuPP
         NqNkdeZS4lwd32c7dA7ibfXWEXz/hdTCMFB5jugClRszlq8iRZGI48csss7arE7sTFZf
         67lQfG/4jiNM1zJs1IfHKWJ6oFw32TNpFM2Ffd0zg0/87lgX3kmkyW54+rTDWqnNGKvS
         KeAsJyP0BIfopn2sUvdKfaSbbG4ewoJvtTpKK9nFmGxKbx/g5/dI3ellQlpS/qsfsxlQ
         ogtA==
X-Forwarded-Encrypted: i=1; AJvYcCU2VApNpDADJaymJuwamJIkbOZjik8m/wR9e83kswxqwAU/t4Tj6+LzfZT63Pn//KYw2s4TkUHRcc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwBgysdv5MbPmfg5j7Wwe4oDGtyODNDzwGnmoIXeS3al13aqmv
	73CrX6xkUFnkFym2ZJFUf3NJQqJ2HbOSM+jlomJOtm1FkjHu0c0dtJd4vmj4PqGnOAs=
X-Gm-Gg: ASbGnctaYIm/X4dcVa0iJpgPgcfIZcJ8DEzqjdaBpx8sUN3XpdDyRahrKeLZR83YzrB
	9QUEW5vzAoXdTHe6wO73xvF0axmN9pTIuA1d02JyrQvhWcAxjab2RAv7UafZUu7HeZ81AP9eO9b
	I3LDScleguFBiFZkc4pD877eYHOBb8omHlhrx5xMBsPvtA2xQftAXENbSd8phVoAXXMro7nP9p0
	2MI/HMpDBGCyuIRd6kHES+nTf5aYZPVOu0fA0+EY1XJ0GxncV3zAOWIwHRHbh5X/+cbVkNJMhVm
	XwoLCmv5RX53640OdhfBy3TestwNxpMfTeJmrIQ0jIzJoXRJPbm2F1gHplZDqBQ8Vd3Wtq8ViyF
	Lxkprn+F7FCnJDWVSVkOosrsDGDAu+Ho5lIPgNrSFatyOC/pcDAMQ2ZPcjLiwXxgvdT1Z
X-Google-Smtp-Source: AGHT+IEhQdSNiFgOUR0Uy0m3Td+Ae36MO+b7rURiUFSjvYbkFIkVBez45Eh/RbbH/zQ35FymtTLLMw==
X-Received: by 2002:a05:600c:35cb:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-459f4eaf75emr1201825e9.10.1754593471038;
        Thu, 07 Aug 2025 12:04:31 -0700 (PDT)
Message-ID: <dbc003a2-9202-46ec-bf87-2829d8a63d53@citrix.com>
Date: Thu, 7 Aug 2025 20:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [regression] Re: [PATCH v2] x86/vpci: fix handling of BAR overlaps
 with non-hole regions
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Victor M Lira <victorm.lira@amd.com>
References: <20250516083159.61945-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250516083159.61945-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2025 9:31 am, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 97b792e578f1..afaf9fe1c053 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -98,3 +98,53 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>      return rc;
>  }
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    /*
> +     * Check if BAR is not overlapping with any memory region defined
> +     * in the memory map.
> +     */
> +    if ( !is_memory_hole(start, end) )
> +        gdprintk(XENLOG_WARNING,
> +                 "%pp: BAR at [%"PRI_mfn", %"PRI_mfn"] not in memory map hole\n",
> +                 &pdev->sbdf, mfn_x(start), mfn_x(end));


This is causing substantial logspam now.  From adl-* in CI,

(XEN) [    4.131847] PCI add device 0000:00:14.0
[    0.227775] pci 0000:00:14.2: [8086:7aa7] type 00 class 0x050000
(XEN) [    4.131987] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.131996] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132013] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132015] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132062] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132070] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132084] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132086] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
[    0.227942] pci 0000:00:14.2: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
(XEN) [    4.132130] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132138] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132153] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132155] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132202] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132210] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132224] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132226] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
[    0.228082] pci 0000:00:14.2: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
(XEN) [    4.132270] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132277] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132291] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132294] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132322] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132330] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132343] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132346] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132360] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132368] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132382] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132384] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132412] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132420] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132433] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132436] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132451] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132458] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132474] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132476] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132528] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132536] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132550] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00003] not in memory map hole
(XEN) [    4.132552] arch/x86/pci.c:109:d0v0 0000:00:14.2: BAR at [00000, 00000] not in memory map hole
(XEN) [    4.132729] PCI add device 0000:00:14.2

It really needs to become less verbose.

~Andrew


