Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D32EEEAC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 09:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63227.112285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxnHx-0008Mf-IX; Fri, 08 Jan 2021 08:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63227.112285; Fri, 08 Jan 2021 08:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxnHx-0008MG-FG; Fri, 08 Jan 2021 08:38:29 +0000
Received: by outflank-mailman (input) for mailman id 63227;
 Fri, 08 Jan 2021 08:38:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w/qK=GL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kxnHw-0008MB-2N
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 08:38:28 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be6c030c-0d0f-4394-9d75-1e880870a713;
 Fri, 08 Jan 2021 08:38:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d26so8118494wrb.12
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jan 2021 00:38:25 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id 138sm12392868wma.41.2021.01.08.00.38.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Jan 2021 00:38:23 -0800 (PST)
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
X-Inumbo-ID: be6c030c-0d0f-4394-9d75-1e880870a713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=wt17oxnzkdew8nK7epPCXeR3F1EBytl7+dfO2nh0B/g=;
        b=qVMfIFiDcvu+G7kszc0V2n3O00ig1urqOX+T7hXDziFZlJ9iNWzj7g9aaE0neTAL/1
         wAUtJg90diqZM6XuSoZh8VO3XzRQF3vtY3Dmwv++ndTStskzkh5NS2Ivm4t1Qhg/rirx
         u1kUopB7M8ZxBZb6xDQ+KzXDinb/b6TpuR0BAkgUoblQFWMjlkwZDRq5HQRSvlJm1OWn
         7pxBHBsjbaQLCPM/UARjt4+urGsozm9H1MQyUCvlB39Dv894bpIgcGOSa4l0dDpBCbVM
         BMzpX18lK1zl6b+EUGgU6hSzujfrOv/WbwGVPWpIth2V/M8FGt6ppOxf25WaCI1Cqzz8
         zEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=wt17oxnzkdew8nK7epPCXeR3F1EBytl7+dfO2nh0B/g=;
        b=MxNygrbxh5M4OaBThl39xA52d8FmCFXhKkjC1iU+ZNrtMNhKRLT4BVXjPuvt2U8t3m
         sSrd0g5ChBp78oKNbfvnMqI0ko82wbKQmWFkhxo230pZ0tXpuZG1Qb4p9JYe3cUa/n0m
         DgQCvUxg1DhsvDvu23/PzQDb/LLI21uExa/GuEYxfYnytcIWI9hTJ9zCqxoIREinLcFs
         vkDU73qYF1+3EFi1/yXDA0ib9xLFCrrRsFygc7W6k+uDkslhSfzyec/U6CMcbwo2SauE
         upIDTObmhDUCGIWYdGvJXpCCkKljL2BAU+0jzhmi0BnHaNCKaYF/0tGDtvEOw8oiIZ1I
         sQiA==
X-Gm-Message-State: AOAM532HXMu7VwxyV2LCX8HwOXxxPCk+3UJd3LnQNtc91MIbG5QEUiU7
	dMhcKKT+VJWnOutPk7yb0xI=
X-Google-Smtp-Source: ABdhPJwhtH2+Yop8XMd7CJxXWMBnWYdPY6xCB8zK/TrYu2EgVeG7ILxGhieHD30lCIcEZg1cbEfD+Q==
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr2414934wrn.179.1610095104542;
        Fri, 08 Jan 2021 00:38:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: <wl@xen.org>,
	<iwj@xenproject.org>,
	<anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<jbeulich@suse.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com> <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com>
Subject: RE: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
Date: Fri, 8 Jan 2021 08:38:22 -0000
Message-ID: <00a001d6e599$a07c8380$e1758a80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNQGw5HmOqYs38/A=

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 08 January 2021 00:47
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
> Subject: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
> 
> If Viridian extensions are enabled, Windows wouldn't currently allow
> a hotplugged vCPU to be brought up dynamically. We need to expose a special
> bit to let the guest know we allow it. It appears we can just start exposing
> it without worrying too much about compatibility - see relevant QEMU
> discussion here:
> 
> https://patchwork.kernel.org/project/qemu-devel/patch/1455364815-19586-1-git-send-email-
> den@openvz.org/

I don't think that discussion really confirmed it was safe... just that empirically it appeared to be so. I think we should err on
the side of caution and have this behind a feature flag (but I'm happy for it to default to on).

  Paul

> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  xen/arch/x86/hvm/viridian/viridian.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index ae1ea86..76e8291 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -76,6 +76,7 @@ typedef union _HV_CRASH_CTL_REG_CONTENTS
>  } HV_CRASH_CTL_REG_CONTENTS;
> 
>  /* Viridian CPUID leaf 3, Hypervisor Feature Indication */
> +#define CPUID3D_CPU_DYNAMIC_PARTITIONING (1 << 3)
>  #define CPUID3D_CRASH_MSRS (1 << 10)
>  #define CPUID3D_SINT_POLLING (1 << 17)
> 
> @@ -179,8 +180,11 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>          res->a = u.lo;
>          res->b = u.hi;
> 
> +        /* Expose ability to bring up VPs dynamically - allows vCPU hotplug */
> +        res->d = CPUID3D_CPU_DYNAMIC_PARTITIONING;
> +
>          if ( viridian_feature_mask(d) & HVMPV_crash_ctl )
> -            res->d = CPUID3D_CRASH_MSRS;
> +            res->d |= CPUID3D_CRASH_MSRS;
>          if ( viridian_feature_mask(d) & HVMPV_synic )
>              res->d |= CPUID3D_SINT_POLLING;
> 
> --
> 2.7.4



