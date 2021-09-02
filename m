Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD5E3FF135
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177483.322944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpSd-0001YG-BS; Thu, 02 Sep 2021 16:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177483.322944; Thu, 02 Sep 2021 16:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpSd-0001VP-8K; Thu, 02 Sep 2021 16:21:07 +0000
Received: by outflank-mailman (input) for mailman id 177483;
 Thu, 02 Sep 2021 16:21:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9UA=NY=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mLpOr-00029c-Q7
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:17:13 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 283a0621-2f95-4c3c-af23-46744b554ad2;
 Thu, 02 Sep 2021 16:17:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n5so3807784wro.12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Sep 2021 09:17:00 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m5sm2067398wmi.1.2021.09.02.09.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:59 -0700 (PDT)
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
X-Inumbo-ID: 283a0621-2f95-4c3c-af23-46744b554ad2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FVQ82fA2n+2YkhWVmssVrmq1ZgiebK+OWD8XFPkR2KQ=;
        b=NTN9poXw36sIQz7tT1cMpoOOwTG/lxJCt9n/hIDHpJ5oAGalZwShWoEdYjhHzzlMVv
         8/2soAA7WUYORMTBYBpUDtWNNxUFfDfUYJu04XkeEJLId1oUy0fpWdBO6D7Yyx1272JJ
         XKOsoC+njj5yavj0Qu1MgGlocXXaIcWXPI9T20BJ6avUCeJwQryVdBqiUkNfXQOnUX19
         Ji1BNyPOvloHuZqi99dMvFNWYRhFh5wijABsraMfCS9+BoMw9K93KiX8s+h3u2DNCNBy
         aYF39Fl9JigWDlhE1ZATlIq1qqUJ331MkmIOX3TRyMSoprNUbK+LRaCdaECy2hoGa1sh
         /wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FVQ82fA2n+2YkhWVmssVrmq1ZgiebK+OWD8XFPkR2KQ=;
        b=EaR3Us1frMpyXK5YUIWCBwqN+h2rllF1ZkloKOyiioL9daJb+0jiPTmT+RZ98C+cVy
         vCUhNLaDqoLrZRzBHSR9TI+b3qIFgZ1glTk9BdJbbcMiaZPs2qK0BVRg4hiWVhA8tSMI
         IZxM3biBTLE0/iVuQoVCTMXvX7P3KmA5VaEYJpwZrIPG/+u24FA9vlIH5/rgfY3HpH6O
         FKrC2IbMTMnHjmLrH3Jzrbc0mSKS3drTbyE9S9UQDquZ55CHm6w4ZuxVbXc0fdjOHDpT
         RtWM4Mti/gOXKlkxsUMoqh13CIskX+2J1Cs2edqje7HM8/th0PPA6/TB0TZvn6dkNWZl
         1raw==
X-Gm-Message-State: AOAM532Drrfvanph0Cnwpn/RhVYIunmNqamzXYkFLb+Jt/0XvFnOJ4A8
	0Qre1oKHg/Q7Yez1swhwtGU=
X-Google-Smtp-Source: ABdhPJwPHE7SqMAg84hdLm/drHbhhc9Rf1ir7m9E7UwL/bm+2kZWpbUhpR7xKiGkP3mn69DCmtzK4A==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr4712589wrr.21.1630599419723;
        Thu, 02 Sep 2021 09:16:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	haxm-team@intel.com,
	Kamil Rytarowski <kamil@netbsd.org>,
	qemu-ppc@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Cameron Esfahani <dirty@apple.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paul Durrant <paul@xen.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Wenchao Wang <wenchao.wang@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	xen-devel@lists.xenproject.org,
	Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Colin Xu <colin.xu@intel.com>,
	Claudio Fontana <cfontana@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Stafford Horne <shorne@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	kvm@vger.kernel.org
Subject: [PATCH v3 12/30] target/hexagon: Remove unused has_work() handler
Date: Thu,  2 Sep 2021 18:15:25 +0200
Message-Id: <20210902161543.417092-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

has_work() is sysemu specific, and Hexagon target only provides
a linux-user implementation. Remove the unused hexagon_cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16e..aa01974807c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -189,11 +189,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     env->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
@@ -287,7 +282,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
-- 
2.31.1


