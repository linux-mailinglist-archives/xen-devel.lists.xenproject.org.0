Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A95435B8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 16:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344050.569653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyx5e-00042w-1e; Wed, 08 Jun 2022 14:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344050.569653; Wed, 08 Jun 2022 14:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyx5d-0003x6-Ue; Wed, 08 Jun 2022 14:55:21 +0000
Received: by outflank-mailman (input) for mailman id 344050;
 Wed, 08 Jun 2022 14:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvtQ=WP=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1nywy6-0004Sj-SL
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 14:47:34 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6cd9b4e-e739-11ec-bd2c-47488cf2e6aa;
 Wed, 08 Jun 2022 16:47:21 +0200 (CEST)
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nywx6-00ChZr-Mr; Wed, 08 Jun 2022 14:46:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0C581302F55;
 Wed,  8 Jun 2022 16:46:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id C77CE20C119BA; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
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
X-Inumbo-ID: e6cd9b4e-e739-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=HzY3jBvKRSGcnvMJEPYny4/0n/oTUbqDiv/WYyIgET0=; b=sA+18VAK88SPXdLOpMza+rOEfP
	LIZ49BFC7l9BHr/9lFK8wXWo46KZqkiByud1HSMZeZ+BUYAV1ia+Yhjd7ltAYMQ5wWfxb2f6aW9XN
	LaYbqONFU5epqLIj3qUQtYBecrUdqqZByYp3TXTApbtEn9PG18xAyF+bW9M0QZ0Hl1P3HfTU4flDJ
	/60dHZ76Xt7rMxgX4MVdhQrPOIHu7jlHBXo6lM/0rE/s1QqIBAAOq4lIO8uNFmK6Mus0AzeHFEaFf
	95DVCFKqB4yKLaIMK8VXS/RFhvqO+ARWFtTz41dKNkpurhwu+bIx/YcQ0H56dkcHsKj/6fk/1/KoL
	4ucMtSnA==;
Message-ID: <20220608144518.136731332@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Cc: rth@twiddle.net,
 ink@jurassic.park.msu.ru,
 mattst88@gmail.com,
 vgupta@kernel.org,
 linux@armlinux.org.uk,
 ulli.kroll@googlemail.com,
 linus.walleij@linaro.org,
 shawnguo@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de,
 festevam@gmail.com,
 linux-imx@nxp.com,
 tony@atomide.com,
 khilman@kernel.org,
 catalin.marinas@arm.com,
 will@kernel.org,
 guoren@kernel.org,
 bcain@quicinc.com,
 chenhuacai@kernel.org,
 kernel@xen0n.name,
 geert@linux-m68k.org,
 sammy@sammy.net,
 monstr@monstr.eu,
 tsbogend@alpha.franken.de,
 dinguyen@kernel.org,
 jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi,
 shorne@gmail.com,
 James.Bottomley@HansenPartnership.com,
 deller@gmx.de,
 mpe@ellerman.id.au,
 benh@kernel.crashing.org,
 paulus@samba.org,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 hca@linux.ibm.com,
 gor@linux.ibm.com,
 agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com,
 svens@linux.ibm.com,
 ysato@users.sourceforge.jp,
 dalias@libc.org,
 davem@davemloft.net,
 richard@nod.at,
 anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 acme@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 namhyung@kernel.org,
 jgross@suse.com,
 srivatsa@csail.mit.edu,
 amakhalov@vmware.com,
 pv-drivers@vmware.com,
 boris.ostrovsky@oracle.com,
 chris@zankel.net,
 jcmvbkbc@gmail.com,
 rafael@kernel.org,
 lenb@kernel.org,
 pavel@ucw.cz,
 gregkh@linuxfoundation.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 daniel.lezcano@linaro.org,
 lpieralisi@kernel.org,
 sudeep.holla@arm.com,
 agross@kernel.org,
 bjorn.andersson@linaro.org,
 anup@brainfault.org,
 thierry.reding@gmail.com,
 jonathanh@nvidia.com,
 jacob.jun.pan@linux.intel.com,
 Arnd Bergmann <arnd@arndb.de>,
 yury.norov@gmail.com,
 andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk,
 rostedt@goodmis.org,
 pmladek@suse.com,
 senozhatsky@chromium.org,
 john.ogness@linutronix.de,
 paulmck@kernel.org,
 frederic@kernel.org,
 quic_neeraju@quicinc.com,
 josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com,
 joel@joelfernandes.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 bsegall@google.com,
 mgorman@suse.de,
 bristot@redhat.com,
 vschneid@redhat.com,
 jpoimboe@kernel.org,
 linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 linux-perf-users@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org,
 linux-xtensa@linux-xtensa.org,
 linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org,
 linux-arch@vger.kernel.org,
 rcu@vger.kernel.org
Subject: [PATCH 35/36] cpuidle,powerdomain: Remove trace_.*_rcuidle()
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

OMAP was the one and only user.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/mach-omap2/powerdomain.c |   10 +++++-----
 drivers/base/power/runtime.c      |   24 ++++++++++++------------
 2 files changed, 17 insertions(+), 17 deletions(-)

--- a/arch/arm/mach-omap2/powerdomain.c
+++ b/arch/arm/mach-omap2/powerdomain.c
@@ -187,9 +187,9 @@ static int _pwrdm_state_switch(struct po
 			trace_state = (PWRDM_TRACE_STATES_FLAG |
 				       ((next & OMAP_POWERSTATE_MASK) << 8) |
 				       ((prev & OMAP_POWERSTATE_MASK) << 0));
-			trace_power_domain_target_rcuidle(pwrdm->name,
-							  trace_state,
-							  raw_smp_processor_id());
+			trace_power_domain_target(pwrdm->name,
+						  trace_state,
+						  raw_smp_processor_id());
 		}
 		break;
 	default:
@@ -541,8 +541,8 @@ int pwrdm_set_next_pwrst(struct powerdom
 
 	if (arch_pwrdm && arch_pwrdm->pwrdm_set_next_pwrst) {
 		/* Trace the pwrdm desired target state */
-		trace_power_domain_target_rcuidle(pwrdm->name, pwrst,
-						  raw_smp_processor_id());
+		trace_power_domain_target(pwrdm->name, pwrst,
+					  raw_smp_processor_id());
 		/* Program the pwrdm desired target state */
 		ret = arch_pwrdm->pwrdm_set_next_pwrst(pwrdm, pwrst);
 	}
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -442,7 +442,7 @@ static int rpm_idle(struct device *dev,
 	int (*callback)(struct device *);
 	int retval;
 
-	trace_rpm_idle_rcuidle(dev, rpmflags);
+	trace_rpm_idle(dev, rpmflags);
 	retval = rpm_check_suspend_allowed(dev);
 	if (retval < 0)
 		;	/* Conditions are wrong. */
@@ -481,7 +481,7 @@ static int rpm_idle(struct device *dev,
 			dev->power.request_pending = true;
 			queue_work(pm_wq, &dev->power.work);
 		}
-		trace_rpm_return_int_rcuidle(dev, _THIS_IP_, 0);
+		trace_rpm_return_int(dev, _THIS_IP_, 0);
 		return 0;
 	}
 
@@ -493,7 +493,7 @@ static int rpm_idle(struct device *dev,
 	wake_up_all(&dev->power.wait_queue);
 
  out:
-	trace_rpm_return_int_rcuidle(dev, _THIS_IP_, retval);
+	trace_rpm_return_int(dev, _THIS_IP_, retval);
 	return retval ? retval : rpm_suspend(dev, rpmflags | RPM_AUTO);
 }
 
@@ -557,7 +557,7 @@ static int rpm_suspend(struct device *de
 	struct device *parent = NULL;
 	int retval;
 
-	trace_rpm_suspend_rcuidle(dev, rpmflags);
+	trace_rpm_suspend(dev, rpmflags);
 
  repeat:
 	retval = rpm_check_suspend_allowed(dev);
@@ -708,7 +708,7 @@ static int rpm_suspend(struct device *de
 	}
 
  out:
-	trace_rpm_return_int_rcuidle(dev, _THIS_IP_, retval);
+	trace_rpm_return_int(dev, _THIS_IP_, retval);
 
 	return retval;
 
@@ -760,7 +760,7 @@ static int rpm_resume(struct device *dev
 	struct device *parent = NULL;
 	int retval = 0;
 
-	trace_rpm_resume_rcuidle(dev, rpmflags);
+	trace_rpm_resume(dev, rpmflags);
 
  repeat:
 	if (dev->power.runtime_error) {
@@ -925,7 +925,7 @@ static int rpm_resume(struct device *dev
 		spin_lock_irq(&dev->power.lock);
 	}
 
-	trace_rpm_return_int_rcuidle(dev, _THIS_IP_, retval);
+	trace_rpm_return_int(dev, _THIS_IP_, retval);
 
 	return retval;
 }
@@ -1081,7 +1081,7 @@ int __pm_runtime_idle(struct device *dev
 		if (retval < 0) {
 			return retval;
 		} else if (retval > 0) {
-			trace_rpm_usage_rcuidle(dev, rpmflags);
+			trace_rpm_usage(dev, rpmflags);
 			return 0;
 		}
 	}
@@ -1119,7 +1119,7 @@ int __pm_runtime_suspend(struct device *
 		if (retval < 0) {
 			return retval;
 		} else if (retval > 0) {
-			trace_rpm_usage_rcuidle(dev, rpmflags);
+			trace_rpm_usage(dev, rpmflags);
 			return 0;
 		}
 	}
@@ -1202,7 +1202,7 @@ int pm_runtime_get_if_active(struct devi
 	} else {
 		retval = atomic_inc_not_zero(&dev->power.usage_count);
 	}
-	trace_rpm_usage_rcuidle(dev, 0);
+	trace_rpm_usage(dev, 0);
 	spin_unlock_irqrestore(&dev->power.lock, flags);
 
 	return retval;
@@ -1566,7 +1566,7 @@ void pm_runtime_allow(struct device *dev
 	if (ret == 0)
 		rpm_idle(dev, RPM_AUTO | RPM_ASYNC);
 	else if (ret > 0)
-		trace_rpm_usage_rcuidle(dev, RPM_AUTO | RPM_ASYNC);
+		trace_rpm_usage(dev, RPM_AUTO | RPM_ASYNC);
 
  out:
 	spin_unlock_irq(&dev->power.lock);
@@ -1635,7 +1635,7 @@ static void update_autosuspend(struct de
 			atomic_inc(&dev->power.usage_count);
 			rpm_resume(dev, 0);
 		} else {
-			trace_rpm_usage_rcuidle(dev, 0);
+			trace_rpm_usage(dev, 0);
 		}
 	}
 



