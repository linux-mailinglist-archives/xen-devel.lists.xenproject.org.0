Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491D058F315
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383872.619080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrP7-0005ui-Hd; Wed, 10 Aug 2022 19:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383872.619080; Wed, 10 Aug 2022 19:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrP7-0005rl-EI; Wed, 10 Aug 2022 19:30:09 +0000
Received: by outflank-mailman (input) for mailman id 383872;
 Wed, 10 Aug 2022 19:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrP6-0005rf-Bs
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:08 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6b697b7-18e2-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:30:07 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id h4so5155119qtj.11
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:06 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:04 -0700 (PDT)
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
X-Inumbo-ID: d6b697b7-18e2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=EKhyktsChWP9CZ1PSgPGIKO4fIEXt44T6It0n4X25eg=;
        b=ByD1NOhgrwc44xwfeliHw7fjmb2u+m/G1SPYuZncSBjsms5A1+29guQek3C70RkSDE
         J28uPI0NxHspiOoOc5L+XmWUkmGKuQB3wvQI4uVqKfQqZK9P9h2BJaQPBegeFFjRLc5V
         KFDNa8qtYPqrx7CXUMmtoXLVgr1Dw3BjBVqP/kp1mVa2Cz9xVEpKRtJzd1Nq+85Ry8bR
         Aaa1WSPmUdCQas2283S1O5gLb8oc3jyDycezWxF7PosS8BxtKDrY38JLLVj1ZQkIM8kb
         YvUUrpxJVD87katpEekBOkYnrPD5MM9EAOG7S3S8L8bSF4kkPr5XI9gfJae0ig3iUpv6
         PVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=EKhyktsChWP9CZ1PSgPGIKO4fIEXt44T6It0n4X25eg=;
        b=av4U6JulrkJa7LKaeaRjmJGC15X6gckJ+BGx1GhKsrda+2CMC/DvM5CshqcTVWM88A
         pvufF5mX9zoH+2cMUcLBHPs6JlIXQPBJGv2CXFkIl66PHuVomGX1JJm64MsWwJEZ1Shf
         BUs+SZD4E0y0GK/we1uH0eGHr8ecWQjxWRZ8KAdXjpDuuRGnFZe9nF/zktqFbYPB/Xm3
         cgSFJsxpq8Z1CJIB0ZHf/EGq3W7iO88QLfpXEzJ3PgaoWTrquNVTW3fW0QlPq6wqT+R4
         pUu+SrCc/c8+3GN/47SsT0y+kMZb//gK2E3c+i33MtvXPUXiLddm8Mp8JDw15ndugCqC
         Hmgw==
X-Gm-Message-State: ACgBeo3F/Ks/m0I1Onc1pL8tEdyWxXrmQbuphWqtBIe9CXMyw1cqcBhg
	zGGYNnNpQyc8Y0ncMxPa0NJ9/CBhgJw=
X-Google-Smtp-Source: AA6agR5Ekx9tXCQP+ep6Nh9aT2QP8klNYk4/sNkEvBFoHQi1YGRWBzMtgiN47R8g1gR8606EDAS2Hw==
X-Received: by 2002:a05:622a:190f:b0:343:5aa8:5538 with SMTP id w15-20020a05622a190f00b003435aa85538mr3284456qtc.445.1660159805399;
        Wed, 10 Aug 2022 12:30:05 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 00/13] Intel Hardware P-States (HWP) support
Date: Wed, 10 Aug 2022 15:29:31 -0400
Message-Id: <20220810192944.102135-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series adds Hardware-Controlled Performance States (HWP) for
Intel processors to Xen.

With HWP, the processor makes its own determinations for frequency
selection, though users can set some parameters and preferences.  There
is also Turbo Boost which dynamically pushes the max frequency if
possible.

The existing governors don't work with HWP since they select frequencies
and HWP doesn't expose those.  Therefore a dummy hwp-interal governor is
used that doesn't do anything.

xenpm get-cpufreq-para is extended to show HWP parameters, and
set-cpufreq-hwp is added to set them.

A lightly loaded OpenXT laptop showed ~1W power savings according to
powertop.  A mostly idle Fedora system (dom0 only) showed a more modest
power savings.

This for for a 10th gen 6-core 1600 MHz base 4900 MHZ max cpu.  In the
default balance mode, Turbo Boost doesn't exceed 4GHz.  Tweaking the
energy_perf preference with `xenpm set-cpufreq-hwp balance ene:64`,
I've seen the CPU hit 4.7GHz before throttling down and bouncing around
between 4.3 and 4.5 GHz.  Curiously the other cores read ~4GHz when
turbo boost takes affect.  This was done after pinning all dom0 cores,
and using taskset to pin to vCPU/pCPU 11 and running a bash tightloop.

In v2, I think I addressed all comments for v1.  I kept patch 11 "xenpm:
Factor out a non-fatal cpuid_parse variant", with a v2 comment
explaining why I keep it.

HWP defaults to disabled and running with the existing HWP configuration
- it doesn't reconfigure by default.  It can be enabled with
cpufreq=xen:hwp.

Hardware Duty Cycling (HDC) is another feature to autonomously powerdown
things.  It defaults to enabled when HWP is enabled, but HDC can be
disabled on the command line.  cpufreq=xen:hwp,no-hdc

I've only tested on 8th gen and 10th gen systems with activity window
and energy_perf support.  So the pathes for CPUs lacking those features
are untested.

Fast MSR support was removed in v2.  The model specific checking was not
done properly, and I don't have hardware to test with.  Since writes are
expected to be infrequent, I just removed the code.

This changes the systcl_pm_op hypercall, so that wants review.

Regards,
Jason

Jason Andryuk (13):
  cpufreq: Allow restricting to internal governors only
  cpufreq: Add perf_freq to cpuinfo
  cpufreq: Export intel_feature_detect
  cpufreq: Add Hardware P-State (HWP) driver
  xenpm: Change get-cpufreq-para output for internal
  cpufreq: Export HWP parameters to userspace
  libxc: Include hwp_para in definitions
  xenpm: Print HWP parameters
  xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
  libxc: Add xc_set_cpufreq_hwp
  xenpm: Factor out a non-fatal cpuid_parse variant
  xenpm: Add set-cpufreq-hwp subcommand
  CHANGELOG: Add Intel HWP entry

 CHANGELOG.md                              |   3 +
 docs/misc/xen-command-line.pandoc         |   8 +-
 tools/include/xenctrl.h                   |   6 +
 tools/libs/ctrl/xc_pm.c                   |  18 +
 tools/misc/xenpm.c                        | 355 +++++++++++-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  15 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           | 627 ++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h     |  13 +-
 xen/arch/x86/include/asm/msr-index.h      |  13 +
 xen/drivers/acpi/pmstat.c                 |  28 +
 xen/drivers/cpufreq/cpufreq.c             |  37 ++
 xen/drivers/cpufreq/utility.c             |   1 +
 xen/include/acpi/cpufreq/cpufreq.h        |  14 +
 xen/include/acpi/cpufreq/processor_perf.h |   3 +
 xen/include/public/sysctl.h               |  57 ++
 16 files changed, 1171 insertions(+), 28 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.37.1


