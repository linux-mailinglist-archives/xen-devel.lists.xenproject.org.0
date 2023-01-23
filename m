Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E32677E80
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482977.748826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyFi-0007ub-OS; Mon, 23 Jan 2023 14:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482977.748826; Mon, 23 Jan 2023 14:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyFi-0007sL-LM; Mon, 23 Jan 2023 14:56:54 +0000
Received: by outflank-mailman (input) for mailman id 482977;
 Mon, 23 Jan 2023 14:56:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyFg-0007rt-LU
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:56:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a82a8cf-9b2e-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:56:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:56:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:56:48 +0000
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
X-Inumbo-ID: 2a82a8cf-9b2e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMbyuNrlVdi8icIzsRH7UDjCL9zmS33iQrhfZKDgy+EcdAOyWwpo0gAL5BuLtyNNwpZPwn9Hu/fd8xYE/cMzEqWQXrQ2ymJkvDTyIdFbCh5Hgi+Dr69ZIBs28AZ104XbtSvWOo3ssfWnHP3nKnRNy2RFq96HYXc/f5nM0Yn3RECjTlMzYsMBOlD8yEXIps2MvDgdnBK7oDyNilkkwoBPGzvKpHqwSpH5DMKtfeeRyc3nD8fIsF0bypP56T4fH/3mvqPTIQqBfOuc2tGxINy/rGzvOUYE/2faukPII9r5eUMqNKeQ1L/qdh+38dtQoAms+6rEjnuB69lw8aiFTIHNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfjVl067685QYNdMenPbNcSHcpvBJTSgTSpwaVubY4k=;
 b=hUdI7FMfnripvPIaWBiug2g/lyYHFvxP5ezFYIwr+Bz7nFJR92YVu3g/WDLaD5U/xolkLFiTMgR2ICPNXoGMEGI2mj0W9UQrQNpzPlEAkHodigHW75OmgS/xdlkK817fyusrDl0tP2xeXxIsJvr6CIrrj8VhXPLmzMZF1wn4kidqhvU7VQOzhRwQ8SyvW3ra7biZttgiMg87sbelG3MS6C6nWcc/9IR2dQM+z5Ir2jnGFSV1/sJ2B1dEveMZ6Rp3JBj1BA1OfWFXUT7zSLpIu26vgU485mlAXhw2WzdTpr+CLVuEocd17KHyv4fwOBnj2Bo/NU5mgxMltP7q3ROhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfjVl067685QYNdMenPbNcSHcpvBJTSgTSpwaVubY4k=;
 b=SLM641KhnryrfiSIgYXIoQPRTcJyUpa7+r5MCV5M5As38syHXvIZ+5nGiSPBNAhzSIY6HveaOevEu+LEc9U2KqDhCVeNEdNZjvBciMoG4x3MSEcx3W7C0B0MUA1BlSiRXsCGIASZsM5DXXX8/GTlJrXeB/dhcFZWOSjqKhpwAuWAc/L2sIg9Li9IfoyC43iM4JNyXuIbP+J05wsQVpU0XTccmfWsnv34IiiKhYr72P23/T5n5EfCwNtRrnN60C0yL9zNPewu43hb6EwqwfD5CsFjkjn5FkR4rrJMIniWeUOxRLaN6twttwbZWbO2CuZ6WjrvIGgD6eB9FtQa8txReQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce2ee037-1d43-52fe-e934-1c21e977b03a@suse.com>
Date: Mon, 23 Jan 2023 15:56:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 7/8] x86: introduce GADDR based secondary time area
 registration alternative
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
In-Reply-To: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ede3fa-d391-4b78-acb2-08dafd520d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mt3+/3F7Ln8r1gJQGJE9DHI63uyYw4q+SOa5ii9NU6jLoo+cYzrHqa7Qz62iS8Fgr63ol1/zzSyQkAefKPAIPzH2dvPcpiTNMQNcTxTiYbz7+vk+xCSXvTCFe68NqQLRVRX6GFHYMIuosT5XKlrRA/zNPTOlK6tjkmBhjybkDtZVJkSgk/R1eFPm0xRTvh7VNWGpDUsTvgERsDU69vTUNPJPmCyORAaNppdQUS0c1nnqv1RDxxfycE/SvLCzrL7axcfaDvn0CPSvtXfr51OrRcO47w+DFZaPUtzeL/dmgcIQvGB5Omgz1/+mo4SJI4bZ12bC8X0S+GX+0DCOw5F2Zl6fBHIC3P+cgA7Fh53rZ6ogQe969ae4oG9oynzxjvgnFdpVu07CQKQ3vtNLEN1NxmfJdw+O7j9LmcmaLk8h7cL0Ue46hD83TZuiIZ1a6Tn4ZtPqAY15uPMYEThi3E9WOHYnPeIEWXVWEuFix+3s0Mhn8unbmM50sTTGeWAExWPYZHv0Gt6HC/0Vd6oBiabQKQMypNx+a27iVDzZbRWO0mn2fsnX3fWJ2j6pgGSWef/9OjQ7VCf+XiebPnKstxZKH2cWAF3K5daIThDGPdYh0iRwcQvyt4ZJamNm5PvGMsmAD/I0gD7FaWgnzbppKLo6V9qvwNeCEvF6hoZgpvaGzaRlnRKaSYZgAE3sBbcO0PmKiLwnapQ88aY1yg40wq3j2RY4Yo46cANbguYGXEl+TpU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(6506007)(26005)(186003)(6486002)(478600001)(6512007)(8676002)(6916009)(4326008)(316002)(31696002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(8936002)(83380400001)(36756003)(2906002)(38100700002)(86362001)(54906003)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDBubHZZVDFZYkk2dFRXTDBsYWZhVENtcHFJZkxaejNUT0ZvQXdNZFhSQzh3?=
 =?utf-8?B?azM0ejBUR3IyNzkyWXIvMUU0cC94UUNRQmdCSUtNeHJFR3RoSmdLSXVPTjFr?=
 =?utf-8?B?LzI2akorclVYd0xjM3VJUEJ4NGVyNCtNbHVaVU1ubmFqWTRzbm1iRTUyU2E4?=
 =?utf-8?B?N2thc2l1TjVySEdIcTQ0SWxUdllScUhwcDZySTNtNGk1L0ZjWEhjd2dSbDYz?=
 =?utf-8?B?VnJYUUxGWGNnei9XaFhSeWhzSTRSN3U3bVZ2T1hDMFIrMWwxbU1sZnJCTUZN?=
 =?utf-8?B?SlNjaFBCZmtSQ2lLTk1tL3d0OFh1Y0QzejFEV3gyWDhiOFlLd1dqeW9xU2Y3?=
 =?utf-8?B?UjkyeEQxSjJKbWdwaHNVUURKOHUva1hSK1RXVk9yU3RyaDVUTEpYWGU4Y3Rz?=
 =?utf-8?B?eEZ2bUtJMlpYRm1DWVdEVTJkQ3pweGpQY3FNRUV3SVpyOE0ySTlnMzVsdW1a?=
 =?utf-8?B?aElaN3g2VCt4SzgvZTFlMm1zNmFOaHNxaUlEMXVtMFRIV3ExVkZaaVZ5NlRu?=
 =?utf-8?B?b1BYSlNlNlVwWlhwYUNIcDN2U0RXcFg2ei80blR0eFFic2MyQjg4cjM4d0dX?=
 =?utf-8?B?MXIzbTREMkQzUmx6UW8zQ1lKOXZ2RC9XRVduaGZ2QXltRkhIcGNGNVpuRTBt?=
 =?utf-8?B?ZmZyaXVxNTR6THZNN1VEUUdLbzF2bitqNjJNZC8wK0hMRFRkSlNVSE5SZURt?=
 =?utf-8?B?SFRPS2pCbzBOYXRhbWhaakZ1TytKZW1rUDdBc3VaVmI2SGgzOVJiKzdTWTRG?=
 =?utf-8?B?UDN2NG1pcUpaTTBhQUtuajVDcEl1VkNwTm5aTkI1c21jQ3VxUnprUTZHTTNJ?=
 =?utf-8?B?Z2NDTlpJeE05SEpQb2VwcmhEYkJKQWV2eFdCS3JoN2FYRlFhNG9jODBrTjdy?=
 =?utf-8?B?MnlGTVB3akpIdVcydXhTaGVjVDBwdkhWb1dYczdzVlgydnJSQTBoTnFxZ2h3?=
 =?utf-8?B?NWhtVW5wYk5wWklHVmgzcStFbkQ3cDB3dVkvMWlnQmNrY2kveVk0enZoZ0NC?=
 =?utf-8?B?NFk3UXo1WWVpMC9KYlkvUGJNTlJZeFA1Qm9qbU9uVCtFeVVrQUZUaUJUZ1k5?=
 =?utf-8?B?S25VRlE4T1JBRmhOQzNZWGdGMXo2R0VDb3A5QUhzRXJlR0hKQmNMMjhyU0sw?=
 =?utf-8?B?dnVMYW8rTllIOHZkVk5RVkZTL201Vi9IenFwdjVudnlZUFduUHVYeUMwM01I?=
 =?utf-8?B?MW5yYjUzbEhyc3B0eklwNUtlcGZFUGR0bVpUWk11d0xER3pPTUtSQWcvc1Y1?=
 =?utf-8?B?K0xaYUxpYXliM1RuUUkwQjcwNXZzdytBcDJlYXVydnFxdTFXc0dwWkxJcU5r?=
 =?utf-8?B?VEMrTGhZSy9zRkoyT3VLKzFvd3hVOUpIR1k3RjJvVXpiTVdPb2RYZkFkRHFQ?=
 =?utf-8?B?eWRGQldyM0xoeTdHcnB4UDB2MDZoNnFxN0tMQ3hITkN1L2k5cFIxbkVmemZK?=
 =?utf-8?B?Yzk3c3JISzZVMHpLT29HSk9rODhrdU5lL0NDVVhXeXVGbkxSOWJMZkNSOFZp?=
 =?utf-8?B?bGxhU0ptYXlxaXNjak9PSUpiMlJKaFUzaktXaWR0MnY3M3hHM0d1c2JQc2M5?=
 =?utf-8?B?ajJFTXZaUjVFWVdVVzZJekVJcjFYRDhuWjQ1SGNuVkVFbHlXaGE5dTl3eS84?=
 =?utf-8?B?UlJMRWZmbkV4QVJjaHdYdnE4VG9pL01uU21KTW8rTE1rWDNXWmpRUS9XYjA0?=
 =?utf-8?B?T29sVTVtMnBkOE5xWlVjZVE5T1Z0UUw4WjlQWEY0VWdFRDNHeG9NRDg1K2hj?=
 =?utf-8?B?a09OMWMwYmNOb2JFT3hvYllUMmZOdG1BVEF5WHN1dGhXNHZ0NnhLb3k2V2xi?=
 =?utf-8?B?MlFNWFlJRHJpNVlhd2FQOGY2M2E4akE2WTlwV3Q1U0VTbGZnVEhrQUE4VDdY?=
 =?utf-8?B?QkF0RmxaMlJGREFPeEJlZjdIZ3pPUDN0NUVJZU5rZXZKaEs3djZZOFZ3b1VV?=
 =?utf-8?B?RnNRVEhOOXZTcXlTVGZramJHcHEvN3c1aFIweDg1VVpzdWVEWTF1cTFWZGZL?=
 =?utf-8?B?OHRZenZkUlVBMnJJVGdFbTRJMU0yOHlVUEZhbDNqYTRRQjd0eml0eDN6M2hP?=
 =?utf-8?B?ZnJacW01d01NT0dKV1orb1VIVHU4QXBWVjkzSzM4ai84SUNhaC81VC9Gbm5G?=
 =?utf-8?Q?v6E0K4+mTAkT6GKkCY/RcZZBw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ede3fa-d391-4b78-acb2-08dafd520d6a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:56:48.2305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbfjHjq+qT0boZANSHwHTVrVDo1Blev2cTDgX0voZ66m3uGOrjRHtK14FKhMPMr8M76nzCZa3GNLLp5kxPzRqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

The registration by virtual/linear address has downsides: The access is
expensive for HVM/PVH domains. Furthermore for 64-bit PV domains the area
is inaccessible (and hence cannot be updated by Xen) when in guest-user
mode.

Introduce a new vCPU operation allowing to register the secondary time
area by guest-physical address.

An at least theoretical downside to using physically registered areas is
that PV then won't see dirty (and perhaps also accessed) bits set in its
respective page table entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Forge version in force_update_secondary_system_time().

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1499,6 +1499,15 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+static void cf_check
+time_area_populate(void *map, struct vcpu *v)
+{
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.pending_system_time.version = 0;
+
+    force_update_secondary_system_time(v, map);
+}
+
 long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
@@ -1536,6 +1545,25 @@ long do_vcpu_op(int cmd, unsigned int vc
 
         break;
     }
+
+    case VCPUOP_register_vcpu_time_phys_area:
+    {
+        struct vcpu_register_time_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(vcpu_time_info_t),
+                            &v->arch.time_guest_area,
+                            time_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
 
     case VCPUOP_get_physid:
     {
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -681,6 +681,8 @@ void domain_cpu_policy_changed(struct do
 
 bool update_secondary_system_time(struct vcpu *,
                                   struct vcpu_time_info *);
+void force_update_secondary_system_time(struct vcpu *,
+                                        struct vcpu_time_info *);
 
 void vcpu_show_execution_state(struct vcpu *);
 void vcpu_show_registers(const struct vcpu *);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1524,6 +1524,16 @@ void force_update_vcpu_system_time(struc
     __update_vcpu_system_time(v, 1);
 }
 
+void force_update_secondary_system_time(struct vcpu *v,
+                                        struct vcpu_time_info *map)
+{
+    struct vcpu_time_info u;
+
+    collect_time_info(v, &u);
+    u.version = -1; /* Compensate for version_update_end(). */
+    write_time_guest_area(map, &u);
+}
+
 static void update_domain_rtc(void)
 {
     struct domain *d;
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -115,6 +115,7 @@ compat_vcpu_op(int cmd, unsigned int vcp
 
     case VCPUOP_send_nmi:
     case VCPUOP_get_physid:
+    case VCPUOP_register_vcpu_time_phys_area:
         rc = do_vcpu_op(cmd, vcpuid, arg);
         break;
 
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -230,6 +230,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_ti
  * VMASST_TYPE_runstate_update_flag engaged by the domain.
  */
 #define VCPUOP_register_runstate_phys_area      14
+#define VCPUOP_register_vcpu_time_phys_area     15
 
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 


