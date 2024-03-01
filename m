Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C986E2F6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 15:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687707.1071447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg3WG-0007wn-27; Fri, 01 Mar 2024 14:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687707.1071447; Fri, 01 Mar 2024 14:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg3WF-0007up-Vp; Fri, 01 Mar 2024 14:05:47 +0000
Received: by outflank-mailman (input) for mailman id 687707;
 Fri, 01 Mar 2024 14:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RIpQ=KH=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rg3WE-0007uj-76
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 14:05:46 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb4ccb8a-d7d4-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 15:05:44 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33d6f26ff33so1283189f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 06:05:44 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a05600005c300b0033df1dc39f0sm4918552wrb.4.2024.03.01.06.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 06:05:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B4D2F5F796;
 Fri,  1 Mar 2024 14:05:42 +0000 (GMT)
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
X-Inumbo-ID: cb4ccb8a-d7d4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709301943; x=1709906743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvRcj/lRDxwSKa/nT/9N7/Vu7IjmpxIlQF47Bc5vUnk=;
        b=q8kEQ2D4EaULcDu4kK2dy8Gw/uUnBSwPzOa1qgc4XeulMTddrZHG4aerJYBnqZGfQ7
         W+dHtb8EiqWBcZEL6Wcmz6iBFoJi9k+RoF6XDeDHvOcu95SCOpmsQ84F6NNqHgCFfah0
         tcXsz8mM6krAueh+2w17qwPyPyjrLEgMOGgqpgelbHeV6jh/j6ISIpw6q94BCDzuJkmv
         M8Och6ulrE3b6Yi+GO+tDl0utMUwPYfGNS7SMHqVOqEv9RAiTzH9PAQ1v1Mg2WrccitU
         re+qBXPxm5TSP6RvF/3UI933ywQuletBUK2DXRT4mqlLyZG9B6wa8Ol4gSsnrvVj9wrx
         aHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709301943; x=1709906743;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EvRcj/lRDxwSKa/nT/9N7/Vu7IjmpxIlQF47Bc5vUnk=;
        b=LLimDEhRGDB22ghkVfYEtkFmHimCfBSNl8k3IFrFbvRj2yMLeRW85UDs+edxTP47+h
         98OFKJTjjifgph9XZ0iX1qi/slFhxHunQLO2M6gu2zdEhYB0zk/mazN1ZxWh+24r9OBF
         T2c9an/0lzSJ3RjYET0XpC2kAN44ByH0v2Y0JOV06eelnQD5l0ChjWIQAZKrtQc8zAtb
         x3dqrbZxMGgd/7+5xldnihEfMI3+JWLg+wSNctH8e+sMMsnarnl7+Nt6WaAu1xJZ3Z0z
         s2HALOGdt8m3loJJ/TUDMIr+S0vUr6frAtRZVKW0TQO/1WFVp5vMvWPDXc73RNV7pqFj
         sCYw==
X-Forwarded-Encrypted: i=1; AJvYcCUdyizfAUYdshmxhjnd6f4V7I0kWLblwfuLGa2p+oBYxoD0KSMcSCfwRZus9RunTVhbX9HJKRuQoJZ5vaDWkMhdKQu7wPDPqzEvo2OjKLI=
X-Gm-Message-State: AOJu0Yyu5DNHcq78sihHPJ8a6qAW1kplqkK7NO3tXyk1lyZs+WCtUv4n
	UVhLFCJkzGFJcZ5+fWvDpIMNz5Ieq0mBC2yPMyBEceGvEksRGxPfPUK7InyqRds=
X-Google-Smtp-Source: AGHT+IH0vRBDHW2rDFP3hgccyW/FGrjbFZjzIJZDaHlWCZN9wENhqaERMhpoLlTDZp91yXJWbVVJEg==
X-Received: by 2002:adf:f28d:0:b0:33d:38cf:aa73 with SMTP id k13-20020adff28d000000b0033d38cfaa73mr1336560wro.47.1709301943499;
        Fri, 01 Mar 2024 06:05:43 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: <qemu-devel@nongnu.org>,  <sstabellini@kernel.org>,  <jgross@suse.com>,
  Anthony Perard <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v3 2/7] xen: add pseudo RAM region for grant mappings
In-Reply-To: <20240227223501.28475-3-vikram.garhwal@amd.com> (Vikram Garhwal's
	message of "Tue, 27 Feb 2024 14:34:56 -0800")
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
	<20240227223501.28475-3-vikram.garhwal@amd.com>
User-Agent: mu4e 1.12.0; emacs 29.1
Date: Fri, 01 Mar 2024 14:05:42 +0000
Message-ID: <875xy659op.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Juergen Gross <jgross@suse.com>
>
> Add a memory region which can be used to automatically map granted
> memory. It is starting at 0x8000000000000000ULL in order to be able to
> distinguish it from normal RAM.

Is the Xen memory map for HVM guests documented anywhere? I couldn't
find anything googling or on the Xen wiki. I'm guessing this is going to
be shared across all 64 bit HVM arches in Xen?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

