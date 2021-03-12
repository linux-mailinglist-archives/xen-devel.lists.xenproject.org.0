Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56200338688
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 08:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96855.183668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcFF-000467-O3; Fri, 12 Mar 2021 07:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96855.183668; Fri, 12 Mar 2021 07:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcFF-000459-Jw; Fri, 12 Mar 2021 07:30:01 +0000
Received: by outflank-mailman (input) for mailman id 96855;
 Fri, 12 Mar 2021 07:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oflA=IK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lKcFE-000454-R3
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 07:30:00 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8858bf89-9b2c-49a5-a4cd-24f67bf0b750;
 Fri, 12 Mar 2021 07:29:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x13so1195135wrs.9
 for <xen-devel@lists.xenproject.org>; Thu, 11 Mar 2021 23:29:59 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:d41c:67e5:a11f:43fe?
 ([2a00:23c5:5785:9a01:d41c:67e5:a11f:43fe])
 by smtp.gmail.com with ESMTPSA id d29sm6653834wra.51.2021.03.11.23.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 23:29:58 -0800 (PST)
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
X-Inumbo-ID: 8858bf89-9b2c-49a5-a4cd-24f67bf0b750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+GbGDDhDe3XYWVX7P5acwBAajtVk5fQepJhLd2YxEHk=;
        b=Drwwgq5OiF4NLc4d8wFU/96m5OxgffiKXCyf56WXzlz2L92BsD+swwEF2CjN0z7Veu
         AdoftD17N5kjN03eWtgMLhphjJfTXiwJQLp5bvoNdP+o3EFWNADkZW+o26rfrIoza/pI
         D0ZSfLVlM5t7FTmYpq4Ewh5NmC5i2QBp9wmSExHIQSiCbjnIYmxZ07dfaa7CNOiNwF+i
         XvEJuR5H4J1hBrL1PjBt7SjV+LlAalzNweQg0HHyGwl5hUcuXbJDBr8/lnkHnW8GpZXi
         wm7dFu5ygw8xLX0iQsNxCCOGwRRl4qtP28N3r1lf1nWlzlZS4r/AwuLLUzGheB9NE4JY
         Sl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+GbGDDhDe3XYWVX7P5acwBAajtVk5fQepJhLd2YxEHk=;
        b=uB5bNvjVNGPo1CTK7LSc6AkHhNHZAYu8JY3Y23dhJ2EbVItCENn7hfmkzeJ5oFhQ0M
         pvoCZJxe6/gpgxHKNi0bgyPmJFNMyVN+Od2R8yqME0Ll/R0/MD80godfAc5wH3ex8Kar
         aMFv+2U2VefycggLe4yWNKt86TVLwRELC2sfib1w3AhsU2Ub7KqWtduwE7JNdv2VdEIJ
         wFPWupWLsF6xbQtnLStedPdKM6PIidojnVeepiqAgzjbTDWN+Yom0uAwbmz1e9bntG0U
         pokR//O3ovXi8PXBjQhRMgoWkJ+Cxj7ltgdX1wPdU3IYBYeQScMzd3rquMsbAkTebow7
         BnkA==
X-Gm-Message-State: AOAM532keL1vMZoWnkjhLPj/yL+nvXLwUjdkovb0e3nZiox7pIlwjqZV
	jc4GYMBNmqIc1g8TKickaDo=
X-Google-Smtp-Source: ABdhPJw4GjSPmM2lvPGLKlFmWuWvnsZazI4EW0hStIInfgc4qmvvxcpPKkJlBYJFD4IdvsVer+hDyg==
X-Received: by 2002:a05:6000:114e:: with SMTP id d14mr12519882wrx.236.1615534198629;
        Thu, 11 Mar 2021 23:29:58 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH for-4.15 v3] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public ABI
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210311132400.24411-1-andrew.cooper3@citrix.com>
Message-ID: <50e384fa-5203-3882-4b0d-3f3721468275@xen.org>
Date: Fri, 12 Mar 2021 07:29:57 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311132400.24411-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/03/2021 13:24, Andrew Cooper wrote:
> __XEN_TOOLS__ is really there to separate the unstable from stable hypercalls.
> Exactly as with c/s f40e1c52e4, stable interfaces shouldn't contain this
> guard.
> 
> That change actually broke the build with:
> 
>    include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
>         ioservid_t *id);
>         ^
> 
> as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
> nothing noticed because the header.chk logic is also broken (fixed
> subsequently).
> 
> Strip the guard from the public header, and remove compensation from
> devicemodel's private.h.  Fix the dmop design doc to discuss both reasons
> behind the the ABI design.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> v3:
>   * Clarifications to the commit message, and dmop.pandoc
> v2:
>   * Patch dmop.pandoc as well.
> ---
>   docs/designs/dmop.pandoc         | 12 +++++++++---
>   tools/libs/devicemodel/private.h |  2 --
>   xen/include/public/hvm/dm_op.h   |  5 -----
>   3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/designs/dmop.pandoc b/docs/designs/dmop.pandoc
> index 8e9f95af47..49e52b1bcc 100644
> --- a/docs/designs/dmop.pandoc
> +++ b/docs/designs/dmop.pandoc
> @@ -4,9 +4,15 @@ DMOP
>   Introduction
>   ------------
>   
> -The aim of DMOP is to prevent a compromised device model from compromising
> -domains other than the one it is providing emulation for (which is therefore
> -likely already compromised).
> +The DMOP hypercall has a new ABI design to solve problems in the Xen
> +ecosystem.  First, the ABI is fully stable, to reduce the coupling between
> +device models and the version of Xen.  Specifically, device model software
> +using DMOP (be it user, stub domain or kernel software) need not be recompiled
> +to match the version of the running hypervisor.
> +
> +Secondly, for device models in userspace, the ABI is designed specifically to
> +allow a kernel to audit the memory ranges used, without having to know the
> +internal structure of sub-ops.
>   
>   The problem occurs when you a device model issues an hypercall that
>   includes references to user memory other than the operation structure
> diff --git a/tools/libs/devicemodel/private.h b/tools/libs/devicemodel/private.h
> index c4a225f8af..c24f3396bb 100644
> --- a/tools/libs/devicemodel/private.h
> +++ b/tools/libs/devicemodel/private.h
> @@ -1,8 +1,6 @@
>   #ifndef XENDEVICEMODEL_PRIVATE_H
>   #define XENDEVICEMODEL_PRIVATE_H
>   
> -#define __XEN_TOOLS__ 1
> -
>   #include <xentoollog.h>
>   #include <xendevicemodel.h>
>   #include <xencall.h>
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index ef7fbc0d3d..fa3f083fed 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -25,9 +25,6 @@
>   #define __XEN_PUBLIC_HVM_DM_OP_H__
>   
>   #include "../xen.h"
> -
> -#if defined(__XEN__) || defined(__XEN_TOOLS__)
> -
>   #include "../event_channel.h"
>   
>   #ifndef uint64_aligned_t
> @@ -491,8 +488,6 @@ struct xen_dm_op {
>       } u;
>   };
>   
> -#endif /* __XEN__ || __XEN_TOOLS__ */
> -
>   struct xen_dm_op_buf {
>       XEN_GUEST_HANDLE(void) h;
>       xen_ulong_t size;
> 


