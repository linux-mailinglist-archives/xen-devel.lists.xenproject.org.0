Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED572DCAAB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 02:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55677.96982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpiSQ-0002oV-OG; Thu, 17 Dec 2020 01:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55677.96982; Thu, 17 Dec 2020 01:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpiSQ-0002nT-JC; Thu, 17 Dec 2020 01:51:54 +0000
Received: by outflank-mailman (input) for mailman id 55677;
 Thu, 17 Dec 2020 01:51:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHkA=FV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kpiSP-0002nJ-Rg
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 01:51:53 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 965de945-b423-4fe7-a8df-47dc188d6506;
 Thu, 17 Dec 2020 01:51:51 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BH1oJZp023972;
 Thu, 17 Dec 2020 01:51:49 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35cn9rk70t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Dec 2020 01:51:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BH1p9VI157324;
 Thu, 17 Dec 2020 01:51:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 35e6esnxwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 01:51:48 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BH1pk7F022502;
 Thu, 17 Dec 2020 01:51:47 GMT
Received: from [10.39.246.206] (/10.39.246.206)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Dec 2020 17:51:46 -0800
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
X-Inumbo-ID: 965de945-b423-4fe7-a8df-47dc188d6506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7Dk1bbvSwo8qhlO8Y6j7Qb2cAWBPa4frZBAAF+aKujM=;
 b=MTryJ0OrK/bWmgWGow3fVDJ/zPxygczSzeQcQIOA2TAxz+dCvFy2w0HJxeLs5I0S5DEh
 cAUx9SKc4lGz6yr7g2k65MrCelhfbw6BUBIQPktTAbFmp+1vk7KBlN4VY8bvWhTQoqBL
 Qqy/T/L/oOiYRlhMeWw51LsIwfCyEaeBQgf+NOwX5eycXi37cPtw+1Iz2VvS8Y8Tdd1E
 cO/kWjCdHe/+I1SKtLk5F1atOfiJQ/oMux57x9uz0Zl7eKVuUlXvE/UVhbN4J5+VHOPH
 g66KAkT60D9h/iLeAjAvAbuFuOov2hbDIvskyOGIzGTFJ6lA9o613BioLxRlErmvjQfF UQ== 
From: boris.ostrovsky@oracle.com
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: Jan Beulich <jbeulich@suse.com>, Cheyenne Wills <cheyenne.wills@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
Organization: Oracle Corporation
Message-ID: <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
Date: Wed, 16 Dec 2020 20:51:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9837 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170010
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9837 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170010


On 11/17/20 3:12 AM, Jan Beulich wrote:
> On 16.11.2020 22:57, Cheyenne Wills wrote:
>> Running Xen with XSA-351 is causing Solaris 11 systems to panic during
>> boot.  The panic screen is showing the failure to be coming from
>> "unix:rdmsr".  The panic occurs with existing guests (booting off a disk)
>> and the  booting from an install ISO image.
>>
>> I discussed the problem with "andyhhp__" in the "#xen" IRC channel and he
>> requested that I report it here.
> Thanks. What we need though is information on the specific MSR(s) that
> will need to have workarounds added: We surely would want to avoid
> blindly doing this for all that the XSA change disallowed access to.
> Reproducing the panic screen here might already help; proper full logs
> would be even better.


We hit this issue today so I poked a bit around Solaris code.


It definitely reads MSR_RAPL_POWER_UNIT unguarded during boot.


In addition, it may read MSR_*_ENERGY_STATUS when running kstat. I haven't been able to trigger those reads (I didn't have access to the system myself and with neither me nor the tester remembering much about Solaris we only tried some basic commands).


The patch below lets Solaris guest boot on OVM. Our codebase is somewhat different from stable branches but if this is an acceptable workaround I will send proper patch for stable. I won't be able to test it though.


Author: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date:   Wed Dec 16 17:19:07 2020 -0500

    x86/msr: Allow read access to some RAPL MSRs
   
    XSA-351 limited access to RAPL-related MSRs to avoid creating a
    side-channel that might allow information leakage. Guests trying
    to access those MSRs now receive #GP.
   
    RAPL is not indicated by CPUID but the assumption is that guests
    should not deal with power-related features and therefore should
    not touch those MSRs. (Linux, in fact, does read MSR_RAPL_POWER_UNIT
    but it does so in safe manner and can ignore the fault).
   
    Unfortunately, Solaris reads some of those registers without
    safeguards. So for those MSRs let's return 0.
   
    Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 0dbe810e4b27..6b4a5dc77b7f 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -131,6 +131,18 @@ int guest_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         *val &= ~(ARCH_CAPS_TSX_CTRL);
         break;
 
+        /* Solaris reads these MSRs unguarded so let's return 0 */
+    case MSR_RAPL_POWER_UNIT:
+    case MSR_PKG_ENERGY_STATUS:
+    case MSR_DRAM_ENERGY_STATUS:
+    case MSR_PP0_ENERGY_STATUS:
+    case MSR_PP1_ENERGY_STATUS:
+        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+            goto gp_fault;
+
+        *val = 0;
+        break;
+
         /*
          * These MSRs are not enumerated in CPUID.  They have been around
          * since the Pentium 4, and implemented by other vendors.
@@ -151,11 +163,16 @@ int guest_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
             break;
 
         /*fallthrough*/
-    case MSR_RAPL_POWER_UNIT:
-    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
-    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
-    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
-    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
+    case MSR_PKG_POWER_LIMIT:
+    case MSR_PKG_PERF_STATUS:
+    case MSR_PKG_POWER_INFO:
+    case MSR_DRAM_POWER_LIMIT:
+    case MSR_DRAM_PERF_STATUS:
+    case MSR_DRAM_POWER_INFO:
+    case MSR_PP0_POWER_LIMIT:
+    case MSR_PP0_POLICY:
+    case MSR_PP1_POWER_LIMIT:
+    case MSR_PP1_POLICY:
     case MSR_PLATFORM_ENERGY_COUNTER:
     case MSR_PLATFORM_POWER_LIMIT:
     case MSR_F15H_CU_POWER ... MSR_F15H_CU_MAX_POWER:


