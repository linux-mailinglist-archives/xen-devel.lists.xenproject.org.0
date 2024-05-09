Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83208C1251
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 17:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719305.1121983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s565o-0001Lq-9h; Thu, 09 May 2024 15:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719305.1121983; Thu, 09 May 2024 15:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s565o-0001KK-5t; Thu, 09 May 2024 15:54:00 +0000
Received: by outflank-mailman (input) for mailman id 719305;
 Thu, 09 May 2024 15:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XlW=MM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s565m-0001KE-OG
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 15:53:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5748768a-0e1c-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 17:53:56 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a5a1054cf61so255500766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 08:53:56 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7f78sm86358066b.133.2024.05.09.08.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 08:53:55 -0700 (PDT)
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
X-Inumbo-ID: 5748768a-0e1c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715270035; x=1715874835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFqPM6h4b+zncfhX+ydefZM27ejofMemYZ4BF17oo1w=;
        b=EoqXlwxjWryS9LYa+4qVhOxSDrxiAl1AR6J5hPbM5uzcdRQ/fA+LMGGCzkEiK8//dc
         wlhkME8zCXk0dc3e558xDniqJ8rlxZ78+6EfwX6FGr0Dea88VzGdgxZfrnHiw5CsmKcO
         m7bn+CEBE5iGGBcIl5kFd6mavq5yHaJGHZleI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715270035; x=1715874835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFqPM6h4b+zncfhX+ydefZM27ejofMemYZ4BF17oo1w=;
        b=NowCZlVNXFZ1QiDnP6zkpxlxymtdvLwUlbPWhIby6DFWgqooTYluGX4TM48hqV3Ikp
         PBXZCJkpXRMUF8qisVtiK93h2m0PoTrdJkAxHLF/PAIk0vuK/oDGPWVXNP4F+/tHAIaL
         jjDmxInQT9YCutHcmIlvlyWPfC3tuMyYgzbJmO1awsGQov1QQtB2ZvCFePXde3oigU9I
         HbqGfT2E8K5A/3PU+tb9jbdJTZCgpV/3Vu3FEHXcEZwX8WZ4peqrW/gHyts+HytU1YDX
         CsyNTvYe1WzV+Q9Bk/z3LDeCVccp7uiClN5DJlXbCy2RI+y1Eqm/QoOJv3uYoDZ+WGZ/
         loZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjIS6FOpDHXVGlMvSoTNZAhHtTG10oVhgcUzC8X1RsfKkORWS47BWiDsXnR3SeSFACLLrVn6y2utD2LJ0NGtPlDW8w2YlRS+VOQnYdiX0=
X-Gm-Message-State: AOJu0YyvlmerDRa/BmJNpfT5XvCIdYZDnk2r0aDhcglCRvj9XPwwhSZd
	tNarER+n/oBPMmuLjcH+gR0W4GNaureAzNYGP4oQDE4i/S3ciw0GIsxSOsr14B8=
X-Google-Smtp-Source: AGHT+IF1co9OQ3ixr+I28h9DoIxwf0x7gUYgeTs3rNBjEe1X13EmUATNhQdN/agxNB7nvl/G0emcDw==
X-Received: by 2002:a17:906:3e0d:b0:a5a:1077:334 with SMTP id a640c23a62f3a-a5a2d57a39amr2153066b.26.1715270035338;
        Thu, 09 May 2024 08:53:55 -0700 (PDT)
Message-ID: <f5300cd1-4200-4957-9e4b-9ba0c1f40fa2@citrix.com>
Date: Thu, 9 May 2024 16:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/5] Add bridge VLAN support
To: Leigh Brown <leigh@solinno.co.uk>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240508213824.55824-1-leigh@solinno.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2024 10:38 pm, Leigh Brown wrote:
> Hello all,
>
> I realised over the weekend that there is a valid use case for providing
> a VIF to a domain that has access to multiple VLANs, e.g. a router. Yes,
> you can create a VIF per VLAN, but if you start having several VLANs (as
> I do), it would be nicer to create a single interface that has access to
> all the relevant VLANs (e.g. enX0.10, enX0.20, etc.).
>
> So, version 2 changes the name and type of the parameter from an integer
> called `vid' to a string called `vlan'. The vlan parameter is then
> parsed by the vif-bridge script (actually, the functions called by it in
> xen-network-common.sh).
>
> As it quite a common practice to allocate VLANs in round numbers, I also
> implemented the ability to specify contiguous or non-contiguous ranges.
> You can specify whether a VLAN is tagged or untagged, and which VLAN is
> the PVID (only one PVID is allowed).  For example,
>
> vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10p/20-29' ]
>
> will setup the VIF so that 10 is the PVID and VLAN IDs 20 through 29
> are permitted with tags. Another example:
>
> vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=1p/10+10x9' ]
>
> will setup the bridge to set 1 as the PVID and permit access with
> tags for VLAN IDs 10, 20, 30, 40, 50, 60, 70, 80 and 90.
>
> This patch set enables this capability as follows:
>
> 1. Adds `vlan' as a new member of the libxl_device_nic structure;
> 2. Adds support to read and write the vlan parameter from the xenstore;
> 3. Adds `vlan' as a new keyword for the vif configuration option;
> 4. Adds support to assign the bridge VLANs in the Linux hotplug scripts;
> 5. Updated xl-network-configuration(5) manpage and example configs.
>
> Original blurb below:
>
> For many years I have been configuring VLANs on my Linux Dom0 by
> creating VLAN interfaces for each VLAN I wanted to connect a domain
> to and then a corresponding bridge. So I would tend to have things
> like:
>
> enp0s0    -> br0     -> vif1, vif2
> enp0s0.10 -> br0vl10 -> vif3, vif4
> enp0s0.20 -> br0vl20 -> vif5
> dummy0    -> br1     -> vif6
>
> I recently discovered that iproute2 supports creating bridge VLANs that
> allows you to assign a VLAN to each of the interfaces associated to a
> bridge. This allows a greatly simplified configuration where a single
> bridge can support all the domains, and the iproute2 bridge command can
> assign each VIF to the required VLAN.  This looks like this:
>
> # bridge vlan
> port              vlan-id  
> enp0s0            1 PVID Egress Untagged
>                   10
>                   20
> br0               1 PVID Egress Untagged
> vif1.0            1 PVID Egress Untagged
> vif2.0            1 PVID Egress Untagged
> vif3.0            10 PVID Egress Untagged
> vif4.0            10 PVID Egress Untagged
> vif5.0            20 PVID Egress Untagged
> vif6.0            30 PVID Egress Untagged
>
> This patch set enables this capability as follows:
>
> 1. Adds `vid' as a new member of the libxl_device_nic structure;
> 2. Adds support to read and write vid from the xenstore;
> 3. Adds `vid' as a new keyword for the vif configuration option;
> 4. Adds support for assign the bridge VLAN in the Linux hotplug scripts.
>
> I don't believe NetBSD or FreeBSD support this capability, but if they
> do please point me in the direction of some documentation and/or examples.
>
> NB: I'm not very familiar with Xen code base so may have missed
> something important, although I have tested it and it is working well
> for me.
>
> Cheers,
>
> Leigh.
>
>
> Leigh Brown (5):
>   tools/libs/light: Add vlan field to libxl_device_nic
>   tools/xl: add vlan keyword to vif option
>   tools/hotplug/Linux: Add bridge VLAN support
>   docs/man: document VIF vlan keyword
>   tools/examples: Example Linux bridge VLAN config
>
>  docs/man/xl-network-configuration.5.pod.in    |  38 ++++++
>  tools/examples/linux-bridge-vlan/README       |  68 +++++++++++
>  tools/examples/linux-bridge-vlan/br0.netdev   |   7 ++
>  tools/examples/linux-bridge-vlan/br0.network  |   8 ++
>  .../examples/linux-bridge-vlan/enp0s0.network |  16 +++
>  tools/hotplug/Linux/xen-network-common.sh     | 111 ++++++++++++++++++
>  tools/libs/light/libxl_nic.c                  |  10 ++
>  tools/libs/light/libxl_types.idl              |   1 +
>  tools/xl/xl_parse.c                           |   2 +
>  9 files changed, 261 insertions(+)
>  create mode 100644 tools/examples/linux-bridge-vlan/README
>  create mode 100644 tools/examples/linux-bridge-vlan/br0.netdev
>  create mode 100644 tools/examples/linux-bridge-vlan/br0.network
>  create mode 100644 tools/examples/linux-bridge-vlan/enp0s0.network
>

This is past the last-post date, so Oleksii will need to decide whether
he's happy to make an exception for it.

Anthony is OoO for a month now, so if this is to get in for 4.19, then
it will need reviewing by others.  I've CC'd a few plausible candidates...

~Andrew

