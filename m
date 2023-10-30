Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4637DBDA0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625279.974422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUz1-0006nh-Jg; Mon, 30 Oct 2023 16:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625279.974422; Mon, 30 Oct 2023 16:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUz1-0006lh-Gv; Mon, 30 Oct 2023 16:19:19 +0000
Received: by outflank-mailman (input) for mailman id 625279;
 Mon, 30 Oct 2023 16:19:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxUz0-0006kN-Rk
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:19:18 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12476658-7740-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:19:16 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-538e8eca9c1so7523326a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:19:16 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 16-20020a170906329000b009d3148fb9f6sm2858231ejw.22.2023.10.30.09.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 09:19:15 -0700 (PDT)
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
X-Inumbo-ID: 12476658-7740-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698682756; x=1699287556; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJZkRpOMk3C2UIlWoKKmUjykg+igzXGvq/QftLmFKsc=;
        b=omb0NoGsuxjIa27YChVMxLBcr6DKctLMblO911T5+ZJlUwv60XBA5oWcRkCnQiZH09
         TXZ7q65K06m97sJz9+2CtP2zzZeXPQ1RXJ/SqoNemlTTVYhzbGEMEUEwfMghrFQGN5As
         bAdvbMIExxBPDdia8awhZe2loq7MLJhuVrvoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698682756; x=1699287556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJZkRpOMk3C2UIlWoKKmUjykg+igzXGvq/QftLmFKsc=;
        b=Eotvldo4i2tqv4aerzLubYzmObw7UUy99zoCTvh8umP/R2ZlWuZPpavOhpgmyoWwBP
         iBNny+bv5dcQhTamgYt8tBDPtTpy6PH7PTch8u7gAyngXmcwpapDjIEVYYkliBv/S5pi
         Edci0O53Nkvkl/mfgXMxo93lZ+oZshQndB3WqQZPMKHHo2hO3x93PAyXabY13N+TtBXt
         9WMeYrd2e5zqOZo/bh9JIRjGltiLTSG2etU6kVg2nRxb0/hZK7mUhCXoAJ3S0aHBkeW6
         LQHv/zJvx+kV7I5dvkclWom2/0Uw6vTjZqGT1DQUWHKXe8esMtJqPa92xxHg/1XeZQi6
         Gomg==
X-Gm-Message-State: AOJu0YwHfoFEjNJI8TBYwQn7r8Y7zKU5qR+UkUElpECfM+xzARe3YYgs
	VJKArvgHP8NqUe9TfVUtDA5n5Q==
X-Google-Smtp-Source: AGHT+IG18lHoR13uddCDsJMtU463RS0cRy4//CMV37HV5cz6NZfw3QwYBE32FCIbFabz6eNbXPUCWQ==
X-Received: by 2002:a17:907:841:b0:9be:263b:e31e with SMTP id ww1-20020a170907084100b009be263be31emr9678994ejb.33.1698682756048;
        Mon, 30 Oct 2023 09:19:16 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:19:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/x2apic: remove usage of ACPI_FADT_APIC_CLUSTER
Message-ID: <ZT_XgnKC6ORZcyXX@macbook>
References: <20231024102630.47691-1-roger.pau@citrix.com>
 <77a0297d-3b47-6679-94a3-1463f642aa72@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77a0297d-3b47-6679-94a3-1463f642aa72@suse.com>

On Mon, Oct 30, 2023 at 03:13:50PM +0100, Jan Beulich wrote:
> On 24.10.2023 12:26, Roger Pau Monne wrote:
> > The ACPI FADT APIC_CLUSTER flag mandates that when the interrupt delivery is
> > Logical mode APIC must be configured for Cluster destination model.  However in
> > apic_x2apic_probe() such flag is incorrectly used to gate whether Physical mode
> > can be used.
> > 
> > Since Xen when in x2APIC mode only uses Logical mode together with Cluster
> > model completely remove checking for ACPI_FADT_APIC_CLUSTER, as Xen always
> > fulfills the requirement signaled by the flag.
> 
> Actually, one remark: The text in the 6.5 spec really only mentions xAPIC
> mode, so it's not entirely clear whether the two flags actually have any
> meaning for x2APIC mode.

Hm, indeed.  That wants to be in a different fix however.

Thanks, Roger.

