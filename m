Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A344A5EFE6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:49:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911733.1318136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfB1-0006zI-7M; Thu, 13 Mar 2025 09:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911733.1318136; Thu, 13 Mar 2025 09:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfB1-0006wg-4f; Thu, 13 Mar 2025 09:48:31 +0000
Received: by outflank-mailman (input) for mailman id 911733;
 Thu, 13 Mar 2025 09:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tsfAz-0006wa-Uc
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:48:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ff79cfa-fff0-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 10:48:27 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso440768f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:48:27 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb318acfsm1542919f8f.70.2025.03.13.02.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 02:48:26 -0700 (PDT)
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
X-Inumbo-ID: 4ff79cfa-fff0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741859306; x=1742464106; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/XufgiXwt1JHlXFUSJwL6fj1nSDPgwOMu2FsdvULnGg=;
        b=AysCryXsZOwMb+Fu9wlUARrcEuBm0dEX00t0cZ6ByDM5YfPU153JBsCoqJjzdZnTqj
         gQpNryS5YDppb4DIkB7iMJiXAYNugmrxdhYJ7o8GcX6a3V7ZlRmyX1x/nuCI/xZu1/on
         7Cd5ZoLc31gyJ4s4CCGS2rVZmghVPkJwuVgTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741859306; x=1742464106;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/XufgiXwt1JHlXFUSJwL6fj1nSDPgwOMu2FsdvULnGg=;
        b=jwGuKOwpWxgfOpnuB438t1zLjZn6ICphgQKrBwuvbzC/a/X60A+ZUA0xO3yVvYrVbi
         Fi5hyVEyPqOSpvBCEAg7Jd9cYdaewkBAdeI1vcdaVx8jqli6xD1LGk1HzbFuIq86qeat
         OO6Uq+F7Bmngew/d9cqTlCxgTV01It1dwaz1Wa5OSjYQXpMqWEX8I9+chck+UPZ3JaXx
         EVelK6nfEk7fl7J//G1higZVkPHhOvaeN/ye7NBDE3lhrM55lskQaiauw67GuCRMolsG
         ODG/azkaNJvVB/bReMk52TpzIDUkJxjFP49K2wJmTUUxkxRQEWtcR+EkyZSEoe6WZtXE
         pW+w==
X-Forwarded-Encrypted: i=1; AJvYcCUDxdLsCggi/iO0Il9irho4k0qKnFrvoMt6W2KeBp7V/wrxWfFMqGRjetMADNO7Uura3zjP6PsPnHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzejDI2EVQiaZqkiJWHbT/dPVjl346JQ25S/JGb/81nHKPa8NjK
	jM8i6Z4uw8/zWjZdqVt0hd9MqHlhn+ujuVKpsLzNC/hkadE8FG/ulH7oXTT4vt8=
X-Gm-Gg: ASbGncvvKFAV/LJbfY+DFWvVIhMNgvX1/LV9EW0/0C2js6Qq1XvjuSDplHRpX7r3xc1
	ojS1tKgXsbpDH8e2S+HfviRcQdOSLDWQKdHFPC8z3d8U7SK0xawyOc0LuUIK3kczJ3txXIKXvP+
	J0KiuYEGH8lBuMusaZBWe7A8EPs/C23dvfzs7kUCWKhwia/89WhHhSDGbN+gZEMMrc+tr5uDS2U
	EcyBpKY1bZDe2Mq2c4mKpivkkcBvUl168auymeTAnQihQeIpkI/e4daF/EpwJc0GUO67aIoGRYp
	YAb85ItK7/5A/aRwwDjmxShQsMV6TaPWputftEjUDh9nHpOS7A==
X-Google-Smtp-Source: AGHT+IEb5sbCQlzlEYZOYFQR/F/24VIi8AnW0CqZY34XO7/E9/O+jCmNIWWmj8heqBLEwSr0PFiJJg==
X-Received: by 2002:adf:8b92:0:b0:394:7c55:7030 with SMTP id ffacd0b85a97d-3947c5570eemr2362190f8f.30.1741859306660;
        Thu, 13 Mar 2025 02:48:26 -0700 (PDT)
Date: Thu, 13 Mar 2025 10:48:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Community Manager <community.manager@xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] CHANGELOG.md: Mention PCI passthrough for HVM domUs
Message-ID: <Z9Kp6b3l2YAePqWl@macbook.local>
References: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
 <a8919be5-020c-47f3-8bfa-02dab2f1e2ca@suse.com>
 <Z9G39ULeHr7fp9ur@macbook.local>
 <7977cc2d-d654-49be-8bf9-9d3fe9286857@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7977cc2d-d654-49be-8bf9-9d3fe9286857@suse.com>

On Thu, Mar 13, 2025 at 08:42:25AM +0100, Jan Beulich wrote:
> On 12.03.2025 17:36, Roger Pau Monné wrote:
> > On Wed, Mar 12, 2025 at 09:51:09AM +0100, Jan Beulich wrote:
> >> On 12.03.2025 05:02, Jiqian Chen wrote:
> >>> PCI passthrough is already supported for HVM domUs when dom0 is PVH
> >>> on x86. The last related patch on Qemu side was merged after Xen4.20
> >>> release. So mention this feature in Xen4.21 entry.
> >>>
> >>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>> ---
> >>>  CHANGELOG.md | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/CHANGELOG.md b/CHANGELOG.md
> >>> index 7201c484f899..b6de9b72ea7a 100644
> >>> --- a/CHANGELOG.md
> >>> +++ b/CHANGELOG.md
> >>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >>>   - On x86:
> >>>     - Option to attempt to fixup p2m page-faults on PVH dom0.
> >>>     - Resizable BARs is supported for PVH dom0.
> >>> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
> >>
> >> Aren't we still in need of SR-IOV support in order to make such an
> >> unconditional statement?
> > 
> > I view SR-IOV as kind of orthogonal to this: SR-IOV is not
> > supported at all on PVH dom0, so it's not just pass through, but the
> > capability itself that won't work as expected when using such devices.
> 
> Hmm, yes and no. No in so far as I as someone who simply wants to use Xen
> would read the above statement as indicating full pass-through support.
> Which first and foremost includes the passing through of VFs.

Maybe we can clarify somehow that SR-IOV devices are still not
supported on a PVH dom0:

 - Support PCI passthrough for HVM domUs when dom0 is PVH (note
   SR-IOV capability usage is not yet supported on PVH dom0).

In any case we should likely wait for:

https://lore.kernel.org/xen-devel/20250308001711.18746-1-jason.andryuk@amd.com/

To be committed?

Thanks, Roger.

