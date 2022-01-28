Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51249FAB1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262000.454015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKD-0004nZ-Uh; Fri, 28 Jan 2022 13:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262000.454015; Fri, 28 Jan 2022 13:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKD-0004lQ-OD; Fri, 28 Jan 2022 13:30:01 +0000
Received: by outflank-mailman (input) for mailman id 262000;
 Fri, 28 Jan 2022 13:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRKC-0003aP-1E
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:30:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 626e1aed-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:29:58 +0100 (CET)
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
X-Inumbo-ID: 626e1aed-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5YvOYeOH1AT6H56DS+3LvoaEf/dTfXY53J18WV3bFhA=;
  b=U/qXnclNj9bFxe3lWtbU/vwMfKCfypzWh5eTLWZ9IEEZlCuplqgLlzfa
   ww3EIAlFSAW7HBWHkpCTuQPTh4AssRnmw7fs5Xwv0zSO4fZ3wDNXEvHLu
   sMoMMcghxFx9y0grSCP84JkiEPSC8Q3MATZRlKJq6cIo9c7PIYFdgpNLQ
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OE0NEHdV6XFmtCNIyXSLHgb0VDfVWzkQ0F/hoL6RGToglNaPHPU2CoWp1cyaard6Y7tgLbNkml
 O+IHN1ep9IWg3e0QCEvMSLjeSVXBCRLvpcUYivSMYssdoXMGrTM5y9Ff89N6xeU7rS50lUdpri
 q6RhedqeSDjRc/K1Fn59nPEPV1X1Cg2SUo4ADkOcsbOxSzEp5WaSNddWl5x06onWSc9zPRXObI
 W39RKjsr9ybUN0UTVeBDyyCl1kMMZ+Thvp50bFIzgb4UcRNCbN1d5T71KfNyBJfnnHF3N1VTaN
 FLJpH7NLZC03T6gM8gGf9djU
X-SBRS: 5.2
X-MesageID: 62981610
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gEd7UKAn7Sd/jBVW//3kw5YqxClBgxIJ4kV8jS/XYbTApDMkhmRRm
 zEaD2+EOvqPZTH8e98lPYrip0sPuZLWnNVnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En9400I7x4bVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/uza5xNVMi
 9537JG5bVknGoPFqMA8akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGhmZg354XRZ4yY
 eI5MTR+SwrvZiFlZHoyErgVkPmp3GbWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiE6HjkUZZplbKbQ34SXTxI766ja9J1FRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtvxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtoLuGogeR80Y67onAMFh
 meJ52u9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:ln8le6O7WMNRScBcT4z255DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE8gr5K0tQ5OxoWZPwC080kKQa3WB/B8bFYOCLghrKEGgm1/qY/9SCIVyyygc+79
 YYT0EWMrSZZjIa7foSojPIa+rIq+P3lZxA8N2uqEuFOjsaD52IgT0JaDqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOoXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6T64aT1eUWpDLS8KoBOCW+sLlWFtwqsHfsWG1VYczDgNnympDq1L9lqq
 iKn/5qBbUO15qYRBDLnfKq4Xit7B8er0b4z1mWmH3iptG8ag4bJqN69MRkWyqc0lEnut5k1q
 JNwia+jLp4ST39vAmV3amQa/lN/nDE+kbKVdRj10B3QM8QbqRcopcY+14QGJAcHDji4IRiC+
 V2CtrAjcwmOG9yQkqpyVWH+ubcKEjb3y32MXQqq4iQyXxbjXp5x0wXyIgWmWoB7os0T91B6/
 7fOqplmblSRotOBJgNT9spUI+yECjAUBjMOGWdLRDuE7wGIWvEr9ry7K8u7O+ndZQUxN85mY
 jHUllfqWkuEnieQfGmzdlO6FTAUW+9VTPixoVX4IV4oKT1QP7xPSiKWDkV4r+dSjUkc7jmst
 qISeNr6s7YXBnT8NxyrnPDsrFpWAkjbPE=
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="62981610"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/9] x86/cpuid: Advertise SSB_NO to guests by default
Date: Fri, 28 Jan 2022 13:29:19 +0000
Message-ID: <20220128132927.14997-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a statement of hardware behaviour, and not related to controls for the
guest kernel to use.  Pass it straight through from hardware.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Not currently enumerated by any CPU I'm aware of.

v2:
 * New
---
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 6e44148a0901..fd8ab2572304 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -266,7 +266,7 @@ XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*   MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
-XEN_CPUFEATURE(SSB_NO,        8*32+26) /*   Hardware not vulnerable to SSB */
+XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*   MSR_SPEC_CTRL.PSFD */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
-- 
2.11.0


