Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C69A24EB7
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 15:46:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880385.1290457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tebEy-0002Gd-0C; Sun, 02 Feb 2025 14:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880385.1290457; Sun, 02 Feb 2025 14:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tebEx-0002Es-Tu; Sun, 02 Feb 2025 14:46:27 +0000
Received: by outflank-mailman (input) for mailman id 880385;
 Sun, 02 Feb 2025 14:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okHa=UZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tebEw-0002Eg-50
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 14:46:26 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79ad2db2-e174-11ef-a0e7-8be0dac302b0;
 Sun, 02 Feb 2025 15:46:24 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab651f1dd36so737678466b.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 06:46:24 -0800 (PST)
Received: from [10.101.4.108] ([89.207.171.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab705f83e1dsm349226766b.185.2025.02.02.06.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 06:46:23 -0800 (PST)
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
X-Inumbo-ID: 79ad2db2-e174-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738507584; x=1739112384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BcArSS6CX3n6wEP4ZnD4V2Q9h8xujCV9l41m5BBENQ4=;
        b=M3coFyIuoe4oAgpjZYRwUBAz1Qq4IhD0GWj+0xwlGa0MbzzhkCVrksrR0U5K8gEKQj
         dgbJWs+VC1hL9U62hDHTzhUSK5hZ/EBJ2QbECwoWBawUdOl8zOExxr2Yi2VtmwnkZQp5
         Iggsv1lTJdwWZzHDhn6oYckcH15+firdmmhuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738507584; x=1739112384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcArSS6CX3n6wEP4ZnD4V2Q9h8xujCV9l41m5BBENQ4=;
        b=Fru5aI3dyrrZcPRss6oJZZMlysLnYzq5UXjlIpzIeAYUHDQb2jlNfWLxdfMWp/G5To
         CpRJDhobOdFn42nEX/I1X7ieQSMhkYKEIQ+nDqCK1oajKmmm+KDXEAqfNughgSzgX0er
         wI+3fM+Rv15+y5h8CpJ0dBshTQPimautxN6z1LQbf2HNutu61WXGrQKi7O4QOXCYUQ4o
         IwvAPy262YaSFvqERJXRqn7aPBhXrJGAx3VGQrWMtMK7alHRjvsKzEqZ5PxWxI43PhzZ
         WieWQaRUvxPk7UKWVak8p4DWivxpPRO0ZubCqWXN7+GI7orGZTkBldYVNqp76djgCnnZ
         FHbA==
X-Forwarded-Encrypted: i=1; AJvYcCWDxtn637a4XeiaIGCU4d8FYWdt3+NOw2eLsfsjfTclK+btjMl9RreQHghKnJ1SH98iFyTjuD00eKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNrFd6USkJx0zp2MGYMaG8ofaKNUSK+5EBjfa4vZsolt2KxGLD
	kPM9oiMIxz9EoJg6y7hJIkrGXllcGWNhHacm0kwtO/q922GwVCcDJziWL4u4sLxq+V5YXhRNPQi
	JwDw=
X-Gm-Gg: ASbGncv/tO8D7RFeqw6buGRLfBeWc9WBLfbRZvWXkzKBPhcXKsjLX8u0L/eU8WVxNlh
	P/opCvPnoEGXYmHiIdztt5hSXSzqLsriLvsA75RGHeMRKiIqGO3Jd8VBkyX9gs1CfPutv4+rUit
	nnPZ5+2/Nsq9vaA0AcERdl9Ya+6BrGCtwcXD9w5NGCSaHXsUnV730LGf6BYItzy7C49UBIlCfmo
	Kv9hHO35pYXRMUTxqbzDcPao0SJHCRcepbOaCOicfOf3aoMuKAAJDgXYrxp+JsElPf50hCWrFII
	a3ghBbQs7JnWFOSYgbIOXprS6tA=
X-Google-Smtp-Source: AGHT+IGbRXRSIpeiVfxVPg4f/VZNFOWbv3ni0dG+gvhi7auUn8PCexrk7Q9nbulOfAqRxsZYe4RuYQ==
X-Received: by 2002:a17:907:7f13:b0:aa6:7c8e:8087 with SMTP id a640c23a62f3a-ab6cfc87b15mr2003337266b.12.1738507584021;
        Sun, 02 Feb 2025 06:46:24 -0800 (PST)
Message-ID: <a4cc2c27-ed02-4453-9730-09d532b3edad@citrix.com>
Date: Sun, 2 Feb 2025 14:46:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2025 11:12 am, Jan Beulich wrote:
> In order for amd_iommu_detect_one_acpi()'s call to pci_ro_device() to
> have permanent effect, pci_segments_init() needs to be called ahead of
> making it there. Without this we're losing segment 0's r/o map, and thus
> we're losing write-protection of the PCI devices representing IOMMUs.
> Which in turn means that half-way recent Linux Dom0 will, as it boots,
> turn off MSI on these devices, thus preventing any IOMMU events (faults
> in particular) from being reported on pre-x2APIC hardware.
>
> As the acpi_iommu_init() invocation was moved ahead of
> acpi_mmcfg_init()'s by the offending commit, move the call to
> pci_segments_init() accordingly.
>
> Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course it would have been quite a bit easier to notice this issue if
> radix_tree_insert() wouldn't work fine ahead of radix_tree_init() being
> invoked for a given radix tree, when the index inserted at is 0.
>
> While hunting down various other dead paths to actually find the root
> cause, it occurred to me that it's probably not a good idea to fully
> disallow config space writes for r/o devices: Dom0 won't be able to size
> their BARs (luckily the IOMMU "devices" don't have any, but e.g. serial
> ones generally will have at least one), for example. Without being able
> to size BARs it also will likely be unable to correctly account for the
> address space taken by these BARs. However, outside of vPCI it's not
> really clear to me how we could reasonably emulate such BAR sizing
> writes - we can't, after all, allow Dom0 to actually write to the
> underlying physical registers, yet we don't intercept reads (i.e. we
> can't mimic expected behavior then).
>
> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>  {
>      bool valid = true;
>  
> -    pci_segments_init();
> -
>      /* MMCONFIG disabled */
>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>          return;
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>  {
>      int ret = -ENODEV;
>  
> +    pci_segments_init();
> +
>      if ( !iommu_enable && !iommu_intremap )
>          return;
>  
>

I can't help but feel this is taking a bad problem and not making it any
better.

pci_segments_init() is even less (obviously) relevant in
apci_iommu_init() than it is in acpi_mmcfg_init(), and given the
fine-grain Kconfig-ing going on, is only one small step from
accidentally being compiled out.

ARM is in a bad state too, with this initialisation even being behind
the PCI Passthrough cmdline option.

IMO there are two problems here; one as you pointed out
(radix_tree_insert() doesn't fail), and that PCI handling requires
explicit initialisation to begin with.

Looking through radix tree, it wouldn't be hard to create a
RADIX_TREE_INIT macro to allow initialisation at compile time for
suitable objects (pci_segments and acpi_ivrs currently).

That involves exporting rcu_node_{alloc,free}(), although the last
caller of radix_tree_set_alloc_callbacks() was dropped when TMEM went,
so we could reasonably remove that infrastructure too, at which point
radix_tree_init() is a simple zero of the structure.

Dealing with alloc_pseg(0) is harder.  As we never free the PCI
segments, we could just opencode the radix_tree_root of height=1 with a
static pseg0 structure, and that would drop the need for
pci_segemnts_init() completely.

This gets us into a far less fragile position, and one liable to survive
future refactoring too.

~Andrew

P.S. Yes AMD IOMMUs really do have BARs.  The BIOS programs them, then
sets a register in config space to hide the BAR registers.  You can
reprogram them if you know how.

