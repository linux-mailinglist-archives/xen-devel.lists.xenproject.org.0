Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C91A22629C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 16:54:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxXBD-0000b9-Dn; Mon, 20 Jul 2020 14:54:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pLMr=A7=gmail.com=alejandro.gonzalez.correo@srs-us1.protection.inumbo.net>)
 id 1jxXBB-0000b4-5o
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 14:54:09 +0000
X-Inumbo-ID: dd112ba0-ca98-11ea-849c-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd112ba0-ca98-11ea-849c-bc764e2007e4;
 Mon, 20 Jul 2020 14:54:08 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c25so12402181otf.7
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QBB9o1cZ8g3+RFyyMGo7jZrS0UDti7SFSFebEliZB+c=;
 b=YMEZ+gm32iwx0IJ8U54KGaXMO1AcwsDDqSUrpGVbA00LcDQeSK319XcgPAxzC1aXLk
 0OgrQiN+RUJDWb0KRZyJXtfwC1w0DGzcLjb2EJQdNO5IvoWmpEKBopWWMt4ngswGUE1r
 YtrVisRRnOTPPQ8FE+2to8E6BVw4J5icGcORPpP6T3+8TLDkvysWWkbLa2k2wHUH1T1u
 Uok+VudT0FgpmkUn87b1TIkvT0YeG8zlp2+uJOWZRB7o2IdhlA2/rFVqHocnKOAddlWI
 JIRkK0jJnINEs0RBTibFNdOxgzNu4iTGBQicPQh+zSHDHFbz9lBhKhOcnH0S5/QMyiAC
 b+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QBB9o1cZ8g3+RFyyMGo7jZrS0UDti7SFSFebEliZB+c=;
 b=P/vXOK2Rd0iwD3qVTxI3fZGcCCumCwAdMclP5THJEVBmj4OqpRCiAl4yfImdsmR9tm
 /xaKssT+wSjgX6trey0IjR1+ev4j/nUjnSSPnCiU3cJMBAqz53yVk4zE+sp2bpquSZqO
 U51Xls2DFy4BZJNYvsSYe4IFB8mFJfuyE3JmvwkI67L+C+/tR8ZnzkHESEgGDXHIrDk0
 nLl4WffK/H+86T1SvWLk0F+Vx/9eh2wX5PCu8JQyz2j/faRp/Ra/p0E08ibOoLiraduS
 0Fj5vOlz/9EYDutpjxtLSIb5AP+IzKn4oLZ2T3yww79MHm6RUc8j2Ub/62xI4rC4rSUs
 qjCg==
X-Gm-Message-State: AOAM533kqH3j2LjlGNHhSuhrnxreutez4xae8NDhzD/INJa/lTDCVn+P
 3U/i7SiVKf5VudDsV14mYQqmuYKwGy6sXslcfjST1IrK
X-Google-Smtp-Source: ABdhPJxqN5+nJ5pRQByNhQP7e17jnpQoeVfh5alWWX8XxaUd0ZCpgHJh8WXx06COjx/Ssm8r60iZVp+UbhSzwhndwNI=
X-Received: by 2002:a9d:640b:: with SMTP id h11mr20925612otl.92.1595256847440; 
 Mon, 20 Jul 2020 07:54:07 -0700 (PDT)
MIME-Version: 1.0
From: Alejandro <alejandro.gonzalez.correo@gmail.com>
Date: Mon, 20 Jul 2020 16:53:56 +0200
Message-ID: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
Subject: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello all.

I'm new to this community, and firstly I'd like to thank you all for
your efforts on supporting Xen in ARM devices.

I'm trying Xen 4.13.1 in a Allwinner H6 SoC (more precisely a Pine H64
model B, with a ARM Cortex-A53 CPU).
I managed to get a dom0 Linux 5.8-rc5 kernel running fine, unpatched,
and I'm using the upstream device tree for
my board. However, the dom0 kernel has trouble when reading some DT
nodes that are related to the CPUs, and
it can't initialize the thermal subsystem properly, which is a kind of
showstopper for me, because I'm concerned
that letting the CPU run at the maximum frequency without watching out
its temperature may cause overheating.
The relevant kernel messages are:

[  +0.001959] sun50i-cpufreq-nvmem: probe of sun50i-cpufreq-nvmem
failed with error -2
...
[  +0.003053] hw perfevents: failed to parse interrupt-affinity[0] for pmu
[  +0.000043] hw perfevents: /pmu: failed to register PMU devices!
[  +0.000037] armv8-pmu: probe of pmu failed with error -22
...
[  +0.000163] OF: /thermal-zones/cpu-thermal/cooling-maps/map0: could
not find phandle
[  +0.000063] thermal_sys: failed to build thermal zone cpu-thermal: -22

I've searched for issues, code or commits that may be related for this
issue. The most relevant things I found are:

- A patch that blacklists the A53 PMU:
https://patchwork.kernel.org/patch/10899881/
- The handle_node function in xen/arch/arm/domain_build.c:
https://github.com/xen-project/xen/blob/master/xen/arch/arm/domain_build.c#L1427

I've thought about removing "/cpus" from the skip_matches array in the
handle_node function, but I'm not sure
that would be a good fix.

I'd appreciate any tips for fixing this issue. Don't hesitate to
contact me back if you need any more information
about the problem.

