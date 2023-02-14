Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5939B696D91
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 20:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495573.765918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS0bd-00059a-6H; Tue, 14 Feb 2023 19:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495573.765918; Tue, 14 Feb 2023 19:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS0bd-00057F-33; Tue, 14 Feb 2023 19:04:45 +0000
Received: by outflank-mailman (input) for mailman id 495573;
 Tue, 14 Feb 2023 19:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cD5U=6K=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pS0bb-000577-DO
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 19:04:43 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ff554c9-ac9a-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 20:04:42 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id lf10so10657197ejc.5
 for <xen-devel@lists.xenproject.org>; Tue, 14 Feb 2023 11:04:42 -0800 (PST)
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
X-Inumbo-ID: 6ff554c9-ac9a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+PIpU7Z2jqm/15Iq1kV1McY54hb16Oom8P9IvSW0h1Q=;
        b=gCbaPSeHBbcVM6E4S7IM0m7UNhsdNhqaLPN7zgGSQHNrjFingah3lDlN7CBOoSCJsU
         e17D2oYmX/lvMq9dCqKy6uceED4TU0lDVtRhASwZ8H0qFjAUaSFJhY49LWrDyuPXz+yl
         PmnIpAyYSwhtJyT4RXEY5H9jlZ1REld42Ynzanp5KKyE6JosgnKfcKusiZYgvSFCP9af
         IXLuF5RQesa+Du5wWTfApmpGyjrp5a1A3RxwlvFljkiqBz5JmYutviyavK1mgOaOOePI
         u5D7CFVhVwZ6hoIFBpR6+oPFEVq0F7DRXYeckkZhOwljUjbPzdyU2vUT2baRc4nHgU2N
         henA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PIpU7Z2jqm/15Iq1kV1McY54hb16Oom8P9IvSW0h1Q=;
        b=JVENwsnEMJ0sRyxPmfOTnDwcTdGewWt55SqC/730QJchzZhlRBmLGXvueJXg+mAhI1
         ddzrq2DvGPiSsl9+SjbG00fZefsv5NMx5R+MDrL3D4RKaBbBu2pAJxgZromUMuobI17+
         is3KSPr7QBiplux71cL8eWImrh/hPlnqA9dLTRRTcjnKRkiTvXb+ZfSpL+vESYWWgL+g
         38mCroxxqGyQBNinnJXLL6jraSn+R0L15YZYn9xWFkB4/svIol+fVMgDjsnKDYpZr0wo
         q1RjvtUdN7QpKSZl1LyQXlYAWGwFe7DML+e/fzkjUzjWZZj6+fYRDiUE4vLkVR26JMsH
         /dtw==
X-Gm-Message-State: AO0yUKU7HtJ6G1xgI+rQl+sg6+fyadopNb/ZMLJjD9KNsh+hb9/OAIGp
	iLxK0HsOMN5c/50UDuW9Ds0msFX+Ou1AG4neu4+ZSM5PqIs=
X-Google-Smtp-Source: AK7set8Xx6IyiSP8d9Ahpa9XJbemIwzp5IqmpI1YDwtwUvUuXDk3v2NrWX3fyVrpcnbQictIpEGq6DhnVdYKmQicryY=
X-Received: by 2002:a17:906:8591:b0:8af:43c6:10bb with SMTP id
 v17-20020a170906859100b008af43c610bbmr1682191ejx.14.1676401480942; Tue, 14
 Feb 2023 11:04:40 -0800 (PST)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Feb 2023 14:04:28 -0500
Message-ID: <CAKf6xptjWKXYeUX2yua6nsSnJOwOWOfU3TBxEQ8YC1tewvHJkQ@mail.gmail.com>
Subject: HWP and ACPI workarounds
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Qubes recently incorporated my HWP patches, but there was a report of
a laptop, Thinkpad X1 Carbon Gen 4 with a Skylake processor, locking
up during boot when HWP is enabled.  A user found a kernel bug that
seems to be the same issue:
https://bugzilla.kernel.org/show_bug.cgi?id=110941.

That bug was fixed by Linux commit a21211672c9a ("ACPI / processor:
Request native thermal interrupt handling via _OSC").  The commit
message has a good summary of the issue and is included at the end of
this message.  The tl;dr is SMM crashes when it receives thermal
interrupts, so Linux calls the ACPI _OSC method to take over interrupt
handling.

Today, Linux calls the _OSC method when boot_cpu_has(X86_FEATURE_HWP),
but that is not exposed to the PV Dom0.  As a test, the Qubes user was
able to boot with the check expanded to `boot_cpu_has(X86_FEATURE_HWP)
|| xen_initial_domain()`.

We need some way for Xen to indicate the presence and/or use of HWP to
Dom0, and Dom0 needs to use that to call _OSC.

My first idea is that Dom0 could query Xen's cpufreq driver.  However,
Xen exposes the cpufreq driver through the unstable sysctl ops, and
using an unstable hypercall seems wrong for the kernel.

Can we add something to an existing hypercall - maybe platform_op?  Or
do we need a new stable hypercall?

Linux will perform the _OSC calls unilaterally upon seeing FEATURE_HWP
and independent of actually using HWP via the intel_pstate driver.
However, not using HWP may be an untested configuration in practice.
The intel_pstate.c driver will not use HWP when FEATURE_HWP_EPP is not
found.  So we could potentially cheat and expose only HWP to Dom0.
That should trigger the _OSC calls without letting Dom0 think it can
use HWP.  This is rather fragile though, so a more explicity method
seems better.

Roger's ACPI Processor patches that add xen_sanitize_pdc calls could
be leveraged.  On the Xen side, arch_acpi_set_pdc_bits() could be
extended to set bit 12, which would then be passed to the evaluate
_PDC call. _PDC is the older interface superseded by _OSC, but they
can be wrappers around the same implementation.  But if linux is just
using _OSC, it seems more compatible to follow that implementation.

Thoughts?

Thanks,
Jason

commit a21211672c9a1d730a39aa65d4a5b3414700adfb
Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Date:   Wed Mar 23 21:07:39 2016 -0700

    ACPI / processor: Request native thermal interrupt handling via _OSC

    There are several reports of freeze on enabling HWP (Hardware PStates)
    feature on Skylake-based systems by the Intel P-states driver. The root
    cause is identified as the HWP interrupts causing BIOS code to freeze.

    HWP interrupts use the thermal LVT which can be handled by Linux
    natively, but on the affected Skylake-based systems SMM will respond
    to it by default.  This is a problem for several reasons:
     - On the affected systems the SMM thermal LVT handler is broken (it
       will crash when invoked) and a BIOS update is necessary to fix it.
     - With thermal interrupt handled in SMM we lose all of the reporting
       features of the arch/x86/kernel/cpu/mcheck/therm_throt driver.
     - Some thermal drivers like x86-package-temp depend on the thermal
       threshold interrupts signaled via the thermal LVT.
     - The HWP interrupts are useful for debugging and tuning
       performance (if the kernel can handle them).
    The native handling of thermal interrupts needs to be enabled
    because of that.

    This requires some way to tell SMM that the OS can handle thermal
    interrupts.  That can be done by using _OSC/_PDC in processor
    scope very early during ACPI initialization.

    The meaning of _OSC/_PDC bit 12 in processor scope is whether or
    not the OS supports native handling of interrupts for Collaborative
    Processor Performance Control (CPPC) notifications.  Since on
    HWP-capable systems CPPC is a firmware interface to HWP, setting
    this bit effectively tells the firmware that the OS will handle
    thermal interrupts natively going forward.

    For details on _OSC/_PDC refer to:
    http://www.intel.com/content/www/us/en/standards/processor-vendor-specific-acpi-specification.html

    To implement the _OSC/_PDC handshake as described, introduce a new
    function, acpi_early_processor_osc(), that walks the ACPI
    namespace looking for ACPI processor objects and invokes _OSC for
    them with bit 12 in the capabilities buffer set and terminates the
    namespace walk on the first success.

    Also modify intel_thermal_interrupt() to clear HWP status bits in
    the HWP_STATUS MSR to acknowledge HWP interrupts (which prevents
    them from firing continuously).

