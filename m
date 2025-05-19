Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF9ABBB07
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 12:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989708.1373694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGxfh-0005Us-A5; Mon, 19 May 2025 10:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989708.1373694; Mon, 19 May 2025 10:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGxfh-0005SU-7J; Mon, 19 May 2025 10:24:37 +0000
Received: by outflank-mailman (input) for mailman id 989708;
 Mon, 19 May 2025 10:24:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9i=YD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uGxff-0005SL-Rd
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 10:24:35 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e20881-349b-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 12:24:33 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so735847466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 03:24:33 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d06ddd6sm579216066b.55.2025.05.19.03.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:24:32 -0700 (PDT)
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
X-Inumbo-ID: 74e20881-349b-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747650273; x=1748255073; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VptiwLq5a77QUBh0b0JtoOt6zHEP7K0QIuTapcJ9CjI=;
        b=fVyAi/dc1wPGjh23ZwBQ1DAobAkCMZW0GFxujGuIoEhXaRrbttft78RgTqBR4IljW9
         uUse9oisYI0Q14j8j7SrtvACZb+5PyOJHDwppo8C1rWQvO9oeAiWq/4VlqmvwyMwy9oz
         masx8iOj60fnqrVABFOsWl5dKdcl/v0XgT6Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650273; x=1748255073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VptiwLq5a77QUBh0b0JtoOt6zHEP7K0QIuTapcJ9CjI=;
        b=H+hHzE3KJcCbMxT5ksKHRBpVe6jwJntTcm5wxOE5sLEZQceRuxArEq5Y90cwoy8EcZ
         zuHtG8SqZ0iojoSsqHapluM5ptNIA7dFzdXHmuk4gY3ZJkvW7fx4gB9K61pwH2f3wnib
         yDSNEZQvGWBEkO3v2irEgb6oZbXeUrdoYRC1myYcsDv/thmDGFppjLFE5+MRx/ZBqAEV
         2YZZQEqM1rsNRvzzt47XY7fhy5eEQWWcwuN+2tcCUj7QiNk0SBhapHuiuXY4gPxPLg5y
         H3UsGm1huhZKs05oZn6kb807pFMbAHa5p542p3e/00RnhRjr/b40dCEBhnISkOFntyDY
         +CvA==
X-Forwarded-Encrypted: i=1; AJvYcCU+vyEW6vSbnDzgfo+SaP9qz4XfLbPepg0G4/pwF9d9s6E+v5KcZyqmFSCW1z98SiBzzby49P4Vrv0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFX1jHT5cASh9uye/rZf2CVrY7gm9F2OildxgPLnFWcz3OzEqW
	Nzym1HtexLBwHxJDfsM2lgIMxjn9JB+HkFtDNVrsw+icrMRhrp6hybXi4nZg9D3gmcA=
X-Gm-Gg: ASbGncvnTt7ucuCXGTUi+Z4MYSqIw+wpas0Z7QOTfhAKMnX/cNVvmyOknUU3cAX7tDc
	fplpuKE9YVpFh++0z001NBiQVvZLvKcvVJbUL3YdvtlBjv5u8fc9ncI3vfqYfW7EANUY6YXzmj1
	b2CEOHxfd3T+7POAWJStdNM0HBwlJL9emRGfmM9k7FvcWysW94gEMBT1Tglwmce9biNc91KTPIy
	DKluKjT7Hgo5PZqrrQmrq6IVjApmi2tliM5R0YeQwch47tzcuiihL3vXERdC3Id/tV2H/ycYQV8
	i5gEmV3g7+FnydTmfMWqpPbWe4ia5o/x/J+rNhj+fovN53ljF8SxIN+ECuXLaBFd8kEw0Aj1MrR
	Djy63QXW9v89cmC9u/c0HyWEo
X-Google-Smtp-Source: AGHT+IEptagXe+3x19JRS9gplTFEtWlhEnetNu2P4kvPInP+6HBcYkXHTlonNfk2qRzbk9VfAarejg==
X-Received: by 2002:a17:907:7254:b0:ad5:7234:e4a9 with SMTP id a640c23a62f3a-ad57234e7e0mr274325966b.28.1747650272918;
        Mon, 19 May 2025 03:24:32 -0700 (PDT)
Date: Mon, 19 May 2025 12:24:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 07/10] vpci: Refactor vpci_remove_register to remove
 matched registers
Message-ID: <aCsG3-u_3Gh4sm99@Mac.lan>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-8-Jiqian.Chen@amd.com>
 <7129d506-b03a-4f89-8128-84b8befe8799@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7129d506-b03a-4f89-8128-84b8befe8799@suse.com>

On Mon, May 19, 2025 at 08:30:22AM +0200, Jan Beulich wrote:
> On 09.05.2025 11:05, Jiqian Chen wrote:
> > vpci_remove_register() only supports removing a register in a time,
> > but the follow-on changes need to remove all registers within a range.
> > So, refactor it to support removing all matched registers in a calling
> > time.
> 
> Generally I'm a little wary of changing behavior for existing callers,
> but I guess Roger already did signal he's okay taking that route?

The only users of that function currently are in tools/tests/vpci/,
so changing is not a problem IMO.

Regards, Roger.

