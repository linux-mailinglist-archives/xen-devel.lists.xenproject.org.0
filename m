Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPguH8U46mnRxAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 17:20:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D954A454353
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 17:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292301.1570799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvqb-0005fr-7Y; Thu, 23 Apr 2026 15:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292301.1570799; Thu, 23 Apr 2026 15:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvqb-0005eJ-4F; Thu, 23 Apr 2026 15:20:09 +0000
Received: by outflank-mailman (input) for mailman id 1292301;
 Thu, 23 Apr 2026 15:20:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFvqY-0005YN-P0
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 15:20:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvqY-004Oa5-5o
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 17:20:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ea38a1-2eae-0a2a0a5409dd-0a2a4505d6ec-28
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 17:20:06 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ea38a5-aaa8-0a2a45050019-d155d0a9e077-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 17:20:06 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38e9653b580so72752781fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 08:20:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185ad11fsm5211742e87.14.2026.04.23.08.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 08:20:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776957605; x=1777562405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmCIC64TEvCqGjCN/BfUc7dGfg3d/i9vHmXqvqQvoe0=;
        b=opTX/eFOZ0rX73KLjfLMjaXfu9z+bcunjewtoKB9fK68p3AJF8MgKvEn/hQVP+doUY
         w4qusTGQ+WqU2TvYZkK9tP7qGkgtIaGfY7QpIh1aU2xIy0uwNOgCAqfk2DJRlfognLrL
         HEUgbc8SVqydRYE9Ui4+fTUwVY9xPdak8YZ6kTjLbEESyEbYhKLqLSXp9Gz8lfzFVPoD
         VaXHuhq4f/lnnS+sJAbo2y7yu+n84K6W4r0uOV85Rg6c8tn5dRpqcenK07T9P3zbDM3V
         fyFv0NV2xgFVC/XNHSyiMaCSsvAZZNv6ONcI2+08hVZeggmypH8dj0RbEjk7TwapsIyU
         7MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957605; x=1777562405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmCIC64TEvCqGjCN/BfUc7dGfg3d/i9vHmXqvqQvoe0=;
        b=Flp3LvcfQl1CR1iM/K6jwcstpvMN/TvbA4fK5n0qWDgo2TLrfgaWMGnaOsdxi+nU90
         l8z9HUeXj2RkGRPAHZbIYPMmdsCTkMIfco9FwC99pdVegmJH4tyrmmw3n8RjH5a0eAUN
         3yMRZJy8wYSq9tRg/ER87oqcJHcUTawnsJMFPcIvmbnpCb+LPNJYE0WIWfGYikYXdUYB
         6YPJw+eEn+qqB/eUq+e6lV8j5pVKcvYDSASu9mtAMWZ07jQ+XCbeTtAKCePq/FpJ273G
         T7rfsZmpuqhQwSttPQGK7cLA+BbRxktgZbY9D5aRkQ0+spbhoYsOgRenLUYKY8I9ZVtv
         ltxA==
X-Forwarded-Encrypted: i=1; AFNElJ8TIrWo0WPC8lOOIXbZm95S5aulNSx4K1hXRHffKvNPFu7o/HBZIoHi6GUOb6L/ecXuDeS0R+QEbH4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuJh/W7xUR1Gv7ya6KUD/SV2s+BE00y+m0+ypeMLTDXN7uyUBl
	cJx2fzWP8Fo/tGzy4Ye0ME14z4cDrvypD2XycYHXHOqSW9VTYd5qPeTs
X-Gm-Gg: AeBDieuZjZtx4AoqxsswtFJlz/zA+UTrZkpin2MOy4ON2yI3wunAvYX+n9bla9sUydW
	guolNtM1x9WBI+QzBkHE+3Nw1XJ947Z7aJCQ5PiCao5tGtXSrhaZUzkaL0jChGswGBm5+kLGaXa
	JFruh/y1aArlu9SoW5uRdIojxlMxlI8T3F7QX/TTwOQVGnqmTkH0J2CEZRk0ph8EqrQ+tZ2iKOD
	cYAjbiD7SNdfoekPDbP60+MpSNiMZG7vp1o5iHwDEabMemJ1TS+QrR22G+hX7cl65d8tYDi9lJG
	Op6K5PCyyT+dBWo1eh/LDh19MIY750m2RsK1JBabPbICRuP8YwokHOxZY+eYwTrrcdBJZVzVuIQ
	OjmSPaLKCxGhA60R3+3Lf4HRzEt0uUrIZHjPQ53h+0WNlnyHfrAt8lv7otth1XcjTe+SPsenZr/
	bUBPti0dGhpurY/wbDD5gqXomEubWruSikrjNVSwH7+zgaMA+Y14J75jc4Pfj6bRzKzNEMORA/2
	7TYghsF5jsDCA==
X-Received: by 2002:a05:6512:1189:b0:5a2:b59a:5e99 with SMTP id 2adb3069b0e04-5a4172e7bdemr9283566e87.22.1776957604913;
        Thu, 23 Apr 2026 08:20:04 -0700 (PDT)
Message-ID: <317cac0b-854f-433b-8242-d498cdba6d63@gmail.com>
Date: Thu, 23 Apr 2026 17:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 0/6] xl: Allow PCI devices to be passthrough'd via
 Qemu command line
To: Thierry Escande <thierry.escande@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776957606-2BF66443-2BB0F2CB/10/73395122804
X-purgate-type: spam
X-purgate-size: 3281
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D954A454353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/23/26 4:46 PM, Thierry Escande wrote:
> This series adds new 'hotplug' option for PCI device passthrough.
> 
> The current mechanism for device passthrough uses QMP device_add command
> to hot-plug PCI devices to the guest Qemu instance. This is an issue for
> guests running on Q35 chipset (preliminary support posted at [1]) since the
> Q35 PCI root bus does not support hotplug. Devices could be hotplugged to
> a secondary PCI bus but Xen only support 1 PCI bus for now.
> 
> The 'hotplug' option allows to control how devices are attached to the
> guest, either by using the legacy QMP mechanism (this is the default) or by
> passing them directly to the Qemu command line using xen-pci-passthrough
> device.
> 
> Example usage in cfg file:
>   pci = [ "00:03.0,seize=1,hotplug=0" ]
> 
> Since Qemu -device option accepts parameters in json format, this
> patchset adds a new internal function libxl__device_pci_get_qapi_json() that
> generates the device json object used for both QMP hotplug and command line
> passing.
> 
> Also, to handle the assignable PCI device list, the function
> libxl_pci_assignable() is renamed as libxl_device_pci_assignable() and is
> made available from libxl.h for access in libxl_dm.c. 2 other functions are
> also exported internally: libxl__pciback_dev_is_assigned() and
> libxl__device_pci_assignable_add().
> 
> This has been successfully tested on Xen 4.22-dev and Qemu 10.0 running
> Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk.
> Disabling the hotplug mechanism might be made mandatory for Q35 machines
> later, once Q35 support is merged upstream.
> 
> [1] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.escande@vates.tech/
> 
> Changes in v2:
>   - Add support for YAJL json parser
> 
> Changes in v3:
>   - Move code block of device command line parameters creation
>   - Better handling of pci device assignation
> 
> Changes in v4:
>   - Split the refactoring parts of the 2nd patch
>   - Extend libxl__json_object_to_json() and use it to generate the qapi json
>     string
> 
> Thierry Escande (6):
>    xl: Add an hotplug option for PCI device passthrough
>    libxl: Refactor some PCI device handling functions
>    libxl: Add libxl__device_pci_get_qapi_json() internal API
>    libxl: Extend libxl__json_object_to_json() prototype
>    libxl: Allow PCI device passthrough using -device Qemu command line
>    docs: provide description for pci hotplug option
> 
>   docs/man/xl-pci-configuration.5.pod | 17 +++++++++
>   docs/man/xl.cfg.5.pod.in            |  6 +++
>   tools/include/libxl.h               |  1 +
>   tools/libs/light/libxl_dm.c         | 33 +++++++++++++++++
>   tools/libs/light/libxl_internal.h   | 12 +++++-
>   tools/libs/light/libxl_json.c       | 11 +++++-
>   tools/libs/light/libxl_pci.c        | 57 ++++++++++++++++++++---------
>   tools/libs/light/libxl_types.idl    |  1 +
>   tools/libs/util/libxlu_pci.c        |  2 +
>   tools/xl/xl_parse.c                 |  5 +++
>   10 files changed, 123 insertions(+), 22 deletions(-)
> 

I think we also want to add an item to CHANGELOG.md that it is possible 
to passthrough PCI device via QEMU command line.

Thanks.

~ Oleksii

