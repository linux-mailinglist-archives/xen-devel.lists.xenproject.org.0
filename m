Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1DAFA07A
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 16:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034240.1407155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rU-00060X-Sy; Sat, 05 Jul 2025 14:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034240.1407155; Sat, 05 Jul 2025 14:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rU-0005wY-PS; Sat, 05 Jul 2025 14:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1034240;
 Sat, 05 Jul 2025 14:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oLNU=ZS=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uY3rT-00055Q-2Q
 for xen-devel@lists.xenproject.org; Sat, 05 Jul 2025 14:27:27 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bcc5930-59ac-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 16:27:25 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB1974.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:165::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 14:27:20 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.023; Sat, 5 Jul 2025
 14:27:20 +0000
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
X-Inumbo-ID: 2bcc5930-59ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9pEPOhSrFDEbn/lxqgdU64vqsbWfr3mB5tPLDnDNMSLcZ1eDp92syeD7bWNWzLZ/u+dIKW6brwCH/UjifJxsjjZSb09MTn83DJrBYeBmn/FEXLJu0yvvXaJ1Tcd+aKUR4HpuCV+GYYv+5GqxIYexU3zg6oDWjN79pq/ubjl+v/ZGhHSO+elTK3pADdv61Jv6gN/KzG4ngulyV4XXf1rlYpbwlRuu1VyWifaadSNKnr5bDX+47KH7sjWO2oSINoSs23Ef0SFK6+XO/l6+Tvve/UU0aOAZgMSqS7kyYLQjnx4dkZ0vO22FZgMniAGFYruW28B3+8uAAKjsNts0lP8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zzp0DLydgtLKZcO+n5mVQVLDViTTCqdlKXROzLvkpJI=;
 b=absjRYoWkmQuQ/UbfMeQA1m+1a9b2Eb2JcJprypFJ/tZi1kgOHmJhg+tuf8K5VArjdyiHGJckMQBjCOM32DyC2SC4jPnKrbIbvQfBFKutaSg4F3JPVMhN5xCLkdUlvgjPm5AcQFEWbyA2E8AMrszQ7XwOqytJ/aqRkq7oP049EorT6RODen8FK0NCNBJetLE96dlDeHbMvrsPnonGS0JVVAqngQpPaLDoIR2VvA9Tbb+HWsopMlY7SQYLzjj8WYOvrCWE1jSTd7QhBpiktRBepPh+sNaeaSEnrFrAPN+dzcMPsPYeDbKh+FmCqDxnXw7R5oIu/PIhB5Q5RR6Vt2/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zzp0DLydgtLKZcO+n5mVQVLDViTTCqdlKXROzLvkpJI=;
 b=VFPz9lhH+GsbeQMIFoh8ynHYdcNSZMeEPazaTQxoFg2nGQA5e0I7a91ycp32gflyY/asyao81AzqQ3Lk60MYKBYRINeYPJX1qR7c6RGL3DyUF7w8bIvhfTwko5JUrSocAZH3cowLynsnG1+ywf2jKM0zoBBUG9oNOlnQGMbNYAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/5] xen/arm: Implement standard PV time interface as per ARM DEN 0057A
Date: Sat,  5 Jul 2025 23:27:02 +0900
Message-ID: <20250705142703.2769819-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250705142703.2769819-1-den@valinux.co.jp>
References: <20250705142703.2769819-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB1974:EE_
X-MS-Office365-Filtering-Correlation-Id: f3497fed-2386-4765-2173-08ddbbd00d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uf4GDlrJGNUNh9lPxm6R16gXVorHS6DLbixBuqSpNarA3QtvnbZIrWOJRbeh?=
 =?us-ascii?Q?R3m5jtK10cIbhuIbmknhWdKdgew8114nr8za65XcaBxBLYhKfUxT/iBQQMDO?=
 =?us-ascii?Q?I6wusQ1ZJTAgJS8kdLFLar7J0AwoLC4Gzj58pLUZl6XSysJBwdm1mF/yipPX?=
 =?us-ascii?Q?sJAp4cRk1NPwsR1im7ev8gZCCht73sOC2RH9uXg3I7GUMKv1FT7zSyHOJxJg?=
 =?us-ascii?Q?lJeu6mpbtE7WjO2Z8We38RM5Yuw5QHS6VkhL3m6P+ZycSMPMhZeKu2xgKPhv?=
 =?us-ascii?Q?+3QkqaT8Htp7/y/R2WPQRTFcGQC2vXdi7GWhyMP1He8Oev+nsyFWLYMgthWu?=
 =?us-ascii?Q?9t0e6JWdftoHpW/HgAMJnKHcOzJ9RnfreIEFzPM9IfCqr4iUKs9hxAR2bduV?=
 =?us-ascii?Q?JvIuRk875c9rrvsfKlS3/w1Qy7hSniInAXqXJ7RlYzOKXem/aG6pgzzw2djr?=
 =?us-ascii?Q?m4UFFt3cDrcwHpRjW8r+4P0Iso9AUhVUZhL5JUBygwV8771bJvrqDue+lXKD?=
 =?us-ascii?Q?Gd0GhAWc/HzI6eiysn303BsSoK9YaWhQXdZFwMAPSztoQwlPturUxS4OXE1m?=
 =?us-ascii?Q?EeVL8dtJEK+Tjt+xP9IJ9h6fCqSw3dJHQG+1ztVSvkKft62uc3XfVT7WsvAS?=
 =?us-ascii?Q?FY2azdWMw+1VDeYsEblQZpaqJXSv9C+LyWJHiIGpLOZ2wAOtbLXKBB2l9dwj?=
 =?us-ascii?Q?fTtvTfwrSgK+SxLv5U32R/WD9MRapao2RWDucM+IUNYZfZrIBjnlNEdvNgMt?=
 =?us-ascii?Q?We4MBOvW9dGQ9eWA/VhCKqQJNmWqDa28TPcomhVofeVHkVWyt8brIsv8SK5w?=
 =?us-ascii?Q?kdmk4igf2r5X4AqKCaZC7ZUbXpUkiSPwuojQ+zqlqrNo53a8uhsmqfc5xHpS?=
 =?us-ascii?Q?MdmgDhLuDe/ZezA7iqZd2dYmrMVjuF7Sq2q3IdhHk+qUdapjI3G3fRgLn5zs?=
 =?us-ascii?Q?mbmvzIfx8tXt101SAQLx2hPbkyp6XqnDARWA1kIoII6KHLFpL9IfmMblTKNB?=
 =?us-ascii?Q?0NWDaNRVDVcjhT0FwUg+5f0mI0qnN7mfCLc+7ghIuR1Faga0So0vuaRAjnDG?=
 =?us-ascii?Q?chFyOGszJedVt1pxc99rszvV08enyAj3ytOKFe+iaFn0348tG0nKJHaE8wQs?=
 =?us-ascii?Q?3/br3PRVHWJUJim+mxbMbBxa3DSDK783Ao4WR/Zu/HUd3brWY9pUS1wCn/K+?=
 =?us-ascii?Q?NlMlC4Ni0XhuMVP11lVZge00WvoL0r1ksxvCb3p9TNcFKX/yHczGnkXDVcZa?=
 =?us-ascii?Q?SUCUN88Sca3ZKLj4SoYgfxgIb2qoV8Zs51Abmmm4B79NHvH5jIzXruiHkVZy?=
 =?us-ascii?Q?pdpyTatgleQI54FpyDe8/0N1IZWADPd1PqHVNT3eIPG+ujF2vP9Hy2YrPamV?=
 =?us-ascii?Q?/pcMKobAHHPHTXsYlx4yLYcIwBg3f7c5PDPeUoT+DAJarDJtPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eq+yDsKfwn92OKMhWeWKeq4qDWHoaY1Ly5OZUJ0339InHAF1p0zCI9ju5Kdg?=
 =?us-ascii?Q?0yg37q1ESwZbkR/EOK0a5EaOTVG6nlCDl80KK8/51GLXObzRxzz2dr20K6FO?=
 =?us-ascii?Q?yzCqXzHnSYAm+vTVI5iuiucybeCyUbDPFcU1fwAPWzTf0mED2M4qxgKWcux/?=
 =?us-ascii?Q?kCwDpzNJrzVwJ8OapmxPEoCQndKJ4r0Q2ZiZ1b0YonFt+KHOnEmnxW01ETtM?=
 =?us-ascii?Q?oxE1D6v+kVYmSxeRU0j5fWzkVPOE1oZm1IVFqwiVmv0xzrIoQE2H01bpzX67?=
 =?us-ascii?Q?hJQeOoMbFO7hYmzGiYznfHyIPxwASTDaz/d6qeevc3uO28sGmMiXc1nDfbcZ?=
 =?us-ascii?Q?R82UL0dpSxMJTCfqndXVdoyBXHDf0/pVa8FIOTMBSVu3PSdIMPZtLKFjrIVS?=
 =?us-ascii?Q?L665SvERXg1D0kUV4snuUkcHyw7qphdoG2Fhzn4k5V2UNloEZFAS2k2/ad3W?=
 =?us-ascii?Q?duvLjUQoMVBkHvqzLGugSiMA7hEoQe/D+68GHr9ASG0RA/uLgr0jD72tJfrW?=
 =?us-ascii?Q?E8eDMlE2nIhYVQ25hW1nu60SnxJo7uJiZHXpKY28oL8GK+9wtXPfEipBLkH0?=
 =?us-ascii?Q?6lGrzQACTKZkuERYDnvhsAQZfrB+IQePg9WEKlRoF87Ju4/8R1cLaTcFbZw8?=
 =?us-ascii?Q?SCLasP8lL9NPQ5TwVGbphswJvQzk38ao/EpSie8UrLOc6obTHyn2vR0QX/Vq?=
 =?us-ascii?Q?2esToQrR0hFqfOI96W9/1bHeKeBdeGjVMFHsGJv4Y6T14DXaMY2ySDTrgKQc?=
 =?us-ascii?Q?sh1UPDu8FD446QGfwxLSlSqB9FAoTmTyPJ0kOtvoIu5BzV1I4leHrSsR3YlP?=
 =?us-ascii?Q?NC5IjgfvDtlvUNbZbt9DVijMlXCxcFsy1pnkyX4E84jDb4UI/gaSOw8xqefx?=
 =?us-ascii?Q?4cI85JmlXS9UwC9huXmc2SdhjxkR5XLUEvq1oGSq13SXsLYWZMQ9unrf0foj?=
 =?us-ascii?Q?NNbBvSySujTCOrFGGSBj0wRmkgzitJDcfGe07TdimelCEMc5JEFEp4VoC+6i?=
 =?us-ascii?Q?ZihEwH479X2YjlY9S+a4Qyx4E/O/KDdhwRbugL+dw7hUp2HhbXhj0rh4T4nm?=
 =?us-ascii?Q?Ced5Yqlrskw+nDXIF5mqhCgiQFi5QCAACxGBc8FBBRMha6yOv8Gqcf10UKlw?=
 =?us-ascii?Q?jh25biwn9xEV0NnNaGlZejafVJiaK1rAfc8iEHfIMDsvkiCMRE/LSsa0DL2F?=
 =?us-ascii?Q?0Z2UWwwjs1tTDB5wpga9kaXzonRWC2uU0lkP/99PhhUPzOkwbnOwDZZ8MlQy?=
 =?us-ascii?Q?BBJWKAgZ2UmRYxp4iAiF5T+wIZxsq8D7m5PbRoB9Cd+uzptlIYb+VqxQJ7wi?=
 =?us-ascii?Q?jscgnDcJ/OpJKZ+Z2bWpDd+3aFg0Bc7B5GGhPyhpad71oa/HAJ/oFqX9YqV7?=
 =?us-ascii?Q?vfbJQtGzNcwUEXLAPPrphQ2oYgNUADJ+uNdLwjs+mHV6IUjfnPWTd6pcU6io?=
 =?us-ascii?Q?lLIBUCu8VWgZSirhPIGfYjI+AWQeCz78Q8B0hYmyQsHRrfLFAzi8JFEBAylA?=
 =?us-ascii?Q?ow/Ntr8mWR1+sP7xd3SxcG8vn6gvvRkNdmTRiNUT4gKK7YhhDKfcM7LCfuZQ?=
 =?us-ascii?Q?UJgdAO3z4XXJkJRerp52sD3RUTKEpiZJbraUW6BmJDX9+9n3Uxfz9xpPZNf1?=
 =?us-ascii?Q?fPX+eomUa2OsPDB46aCQYek=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f3497fed-2386-4765-2173-08ddbbd00d53
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 14:27:20.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fRWjlsuyLOEkUd7xWLPyzukLCJTvYD9q+rzwcp/mJ1/Powjq6RUelO8WNDALT3sXRZo0+6TuiUJ2Eye5I3Mpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB1974

The VCPUOP_register_runstate_memory_area hypercall is still actively
used, e.g., in the Linux arm64 codebase. When KPTI is enabled, the area
was not registered from the beginning due to the VA not always being
valid. In such cases, Linux falls back to using the standard PV time
interface (ARM DEN 0057A), but this interface has not been implemented
in Xen for ARM64 (until this commit).

The VCPUOP_register_runstate_phys_area was introduced, though it's
unclear whether this would be used in Linux arm64 and when it will be
prevalent amongst every possible downstream domain Linux variant. And of
course Linux is not an only option for the Xen arm64 domains.

Therefore, implementing the standard way of sharing PV time is
generically beneficial, avoiding reliance on specially crafted
hypercalls, the usage of which by guest VMs is not always guaranteed.
Note that the PV_TIME_ST interface communicates with IPA (GPA), not GVA.

Add the PV time interface according to ARM DEN 0057A. This supports
dom0less cases only.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain.c              |  68 +++++++++
 xen/arch/arm/domain_build.c        | 228 ++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h  |  23 +++
 xen/arch/arm/include/asm/kernel.h  |   2 +
 xen/arch/arm/include/asm/p2m.h     |   3 +
 xen/arch/arm/include/asm/smccc.h   |  12 ++
 xen/arch/arm/p2m.c                 |   6 +-
 xen/arch/arm/vsmc.c                |  35 +++++
 xen/include/xen/fdt-domain-build.h |   2 +-
 xen/include/xen/macros.h           |   1 +
 10 files changed, 367 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index be58a23dd725..e3b893e93685 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -277,6 +277,20 @@ static void ctxt_switch_to(struct vcpu *n)
     WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
 }
 
+#ifdef CONFIG_ARM_64
+static void update_stolen_time(struct vcpu *n)
+{
+    uint64_t tot_stolen;
+
+    if ( is_idle_vcpu(n) || is_32bit_domain(n->domain) )
+        return;
+
+    tot_stolen = n->runstate.time[RUNSTATE_runnable] +
+                 n->runstate.time[RUNSTATE_offline];
+    write_atomic(&n->arch.pv_time_region->stolen_time, tot_stolen);
+}
+#endif
+
 static void schedule_tail(struct vcpu *prev)
 {
     ASSERT(prev != current);
@@ -291,6 +305,10 @@ static void schedule_tail(struct vcpu *prev)
 
     update_runstate_area(current);
 
+#ifdef CONFIG_ARM_64
+    update_stolen_time(current);
+#endif
+
     /* Ensure that the vcpu has an up-to-date time base. */
     update_vcpu_system_time(current);
 }
@@ -536,6 +554,9 @@ void free_vcpu_struct(struct vcpu *v)
 int arch_vcpu_create(struct vcpu *v)
 {
     int rc = 0;
+#ifdef CONFIG_ARM_64
+    size_t regions_per_page;
+#endif
 
     BUILD_BUG_ON( sizeof(struct cpu_info) > STACK_SIZE );
 
@@ -586,6 +607,15 @@ int arch_vcpu_create(struct vcpu *v)
     if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
         v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
 
+#ifdef CONFIG_ARM_64
+    if ( v->domain->arch.pv_time_regions )
+    {
+        regions_per_page = PAGE_SIZE / sizeof(struct pv_time_region);
+        v->arch.pv_time_region = &v->domain->arch.pv_time_regions[
+            v->vcpu_id / regions_per_page][v->vcpu_id % regions_per_page];
+    }
+#endif
+
     return rc;
 
 fail:
@@ -708,6 +738,10 @@ int arch_domain_create(struct domain *d,
 {
     unsigned int count = 0;
     int rc;
+#ifdef CONFIG_ARM_64
+    unsigned int npages;
+    unsigned int i = 0;
+#endif
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
 
@@ -791,9 +825,43 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl = config->arch.sve_vl;
 #endif
 
+#ifdef CONFIG_ARM_64
+    /*
+     * Preallocate the stolen time shared memory regions (ARM DEN 0057A)
+     * for all the possible vCPUs. Note that at this point, neither
+     * kernel_probe() nor XEN_DOMCTL_set_address_size has been called,
+     * so the domain arch type (32-bit or 64-bit) is still unknown.
+     * We may allocate the region for 32-bit domain unnecessarily.
+     */
+    ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));
+    npages = DIV_ROUND_UP(d->max_vcpus * sizeof(struct pv_time_region), PAGE_SIZE);
+    d->arch.pv_time_regions = (struct pv_time_region **)xmalloc_array(void *, npages);
+    if ( !d->arch.pv_time_regions )
+    {
+        rc = -ENOMEM;
+        goto fail;
+    }
+    for ( i = 0; i < npages; i++ )
+    {
+        d->arch.pv_time_regions[i] = alloc_xenheap_pages(0, 0);
+        if ( !d->arch.pv_time_regions[i] )
+        {
+            rc = -ENOMEM;
+            goto fail;
+        }
+        clear_page(d->arch.pv_time_regions[i]);
+    }
+#endif
     return 0;
 
 fail:
+#ifdef CONFIG_ARM_64
+    for ( ; i > 0; --i )
+        free_xenheap_pages( d->arch.pv_time_regions[i - 1], 0 );
+    if ( d->arch.pv_time_regions )
+        xfree( d->arch.pv_time_regions );
+#endif
+
     d->is_dying = DOMDYING_dead;
     arch_domain_destroy(d);
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e063d0d4076e..bfee77268056 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -767,6 +767,34 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
     return 0;
 }
 
+#ifdef CONFIG_ARM_64
+int __init add_pv_regions(unsigned long s_gfn, unsigned long e_gfn,
+                          void *data)
+{
+    struct membanks *pv_regions = data;
+    unsigned int npages;
+    paddr_t s = pfn_to_paddr(s_gfn);
+
+    /*
+     * The overall required size for the regions should be at most 2 x 4KB,
+     * assuming a maximum of 128 vCPUs per domain. Therefore, always
+     * attempt to find a contiguous area for simplicity.
+     */
+    if ( pv_regions->nr_banks == 1 )
+        return 0;
+
+    npages = pv_regions->max_banks;
+    if ( e_gfn - s_gfn < npages - 1 )
+        return 0;
+
+    pv_regions->bank[0].start = s;
+    pv_regions->bank[0].size = npages;
+    pv_regions->nr_banks++;
+
+    return 0;
+}
+#endif
+
 static int __init handle_pci_range(const struct dt_device_node *dev,
                                    uint64_t addr, uint64_t len, void *data)
 {
@@ -796,7 +824,7 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
 
 /*
  * Find the holes in the Host DT which can be exposed to hwdom or a direct-map
- * domU as extended regions for the special memory mappings. In order to
+ * domU e.g. as extended regions for the special memory mappings. In order to
  * calculate regions we exclude every addressable memory region described by
  * "reg" and "ranges" properties from the maximum possible addressable physical
  * memory range:
@@ -895,6 +923,15 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
             goto out;
     }
 
+#ifdef CONFIG_ARM_64
+    if ( kinfo->arch.pv_time_range )
+    {
+        res = rangeset_subtract(mem_holes, kinfo->arch.pv_time_range);
+        if ( res )
+            goto out;
+    }
+#endif
+
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
@@ -929,7 +966,7 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     {
         uint64_t bankend, start, size = 0;
 
-        start = ROUNDUP(bankbase[i] + kinfo_mem->bank[i].size, SZ_2M);
+        start = bankbase[i] + kinfo_mem->bank[i].size;
 
         bankend = ~0ULL >> (64 - p2m_ipa_bits);
         bankend = min(bankend, bankbase[i] + banksize[i] - 1);
@@ -961,6 +998,15 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
             goto out;
     }
 
+#ifdef CONFIG_ARM_64
+    if ( kinfo->arch.pv_time_range )
+    {
+        res = rangeset_subtract(mem_holes, kinfo->arch.pv_time_range);
+        if ( res )
+            goto out;
+    }
+#endif
+
     res = rangeset_report_ranges(mem_holes, 0,
                                  PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
                                  cb, unused_regions);
@@ -1021,6 +1067,10 @@ static int __init find_memory_holes_noiommu(const struct kernel_info *kinfo,
         kinfo->xen_reg_assigned
         ? membanks_xzalloc(count_ranges(kinfo->xen_reg_assigned), MEMORY)
         : NULL;
+#ifdef CONFIG_ARM_64
+    struct membanks *pv_time =
+        kinfo->arch.pv_time_range ? membanks_xzalloc(1, MEMORY) : NULL;
+#endif
 
     /*
      * Exclude the following regions:
@@ -1029,6 +1079,7 @@ static int __init find_memory_holes_noiommu(const struct kernel_info *kinfo,
      * 3) Grant table assigned to domain
      * 4) Remove static shared memory (when the feature is enabled)
      * 5) Remove xen,reg
+     * 6) Remove PV time shared region
      */
     const struct membanks *mem_banks[] = {
         kernel_info_get_mem_const(kinfo),
@@ -1038,6 +1089,9 @@ static int __init find_memory_holes_noiommu(const struct kernel_info *kinfo,
         bootinfo_get_shmem(),
 #endif
         xen_reg,
+#ifdef CONFIG_ARM_64
+        pv_time,
+#endif
     };
 
     dt_dprintk("Find memory holes (noiommu)\n");
@@ -1065,6 +1119,21 @@ static int __init find_memory_holes_noiommu(const struct kernel_info *kinfo,
     gnttab->bank[0].start = kinfo->gnttab_start;
     gnttab->bank[0].size = kinfo->gnttab_size;
 
+#ifdef CONFIG_ARM_64
+    if ( kinfo->arch.pv_time_range )
+    {
+        if ( !pv_time )
+        {
+            res = -ENOMEM;
+            goto out;
+        }
+
+        rangeset_report_ranges(kinfo->arch.pv_time_range, 0,
+                               PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                               rangeset_to_membank, pv_time);
+    }
+#endif
+
     res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
                                   unused_regions, cb);
 
@@ -1564,19 +1633,82 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
-int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
+#ifdef CONFIG_ARM_64
+int __init make_pv_time_resv_memory_node(struct kernel_info *kinfo,
+                                         int addrcells, int sizecells)
+{
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    unsigned int len = (addrcells + sizecells) * sizeof(__be32);
+    struct domain *d = kinfo->d;
+    struct membanks *unused_banks;
+    void *fdt = kinfo->fdt;
+    unsigned regions_len;
+    gfn_t pv_time_gfn;
+    paddr_t start;
+    paddr_t size;
+    unsigned int npages;
+    __be32 *cells;
+    int res;
+
+    /* Find a memory hole */
+    ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));
+    npages = DIV_ROUND_UP(d->max_vcpus * sizeof(struct pv_time_region), PAGE_SIZE);
+    regions_len = PAGE_SIZE * npages;
+    unused_banks = membanks_xzalloc(npages, MEMORY);
+    if ( !unused_banks )
+        return -ENOMEM;
+
+    res = find_unused_regions(kinfo, unused_banks, add_pv_regions);
+    if ( res || unused_banks->nr_banks != 1 )
+    {
+        printk(XENLOG_WARNING "%pd: failed to find unused regions\n", d);
+        goto fail;
+    }
+    start = unused_banks->bank[0].start;
+    size = unused_banks->bank[0].size;
+
+    kinfo->arch.pv_time_range = rangeset_new(NULL, NULL, 0);
+    if ( !kinfo->arch.pv_time_range )
+    {
+        res = -ENOMEM;
+        goto fail;
+    }
+    res = rangeset_add_range(kinfo->arch.pv_time_range,
+                             PFN_DOWN(start), PFN_DOWN(start + size - 1));
+    if ( res )
+        goto fail;
+
+    pv_time_gfn = gaddr_to_gfn(start);
+
+    /* Reserve the selected GFN */
+    res = domain_fdt_begin_node(fdt, "pv-time", gfn_x(pv_time_gfn));
+    if ( res )
+        goto fail;
+
+    cells = reg;
+    dt_child_set_range(&cells, addrcells, sizecells, gfn_x(pv_time_gfn), regions_len);
+    res = fdt_property(fdt, "reg", reg, len);
+    if ( res )
+        goto fail;
+
+    res = fdt_end_node(fdt);
+
+  fail:
+    if ( kinfo->arch.pv_time_range )
+        rangeset_destroy(kinfo->arch.pv_time_range);
+    xfree(unused_banks);
+    return res;
+}
+#endif
+
+int __init make_resv_memory_node(struct kernel_info *kinfo, int addrcells,
                                  int sizecells)
 {
-    const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
     void *fdt = kinfo->fdt;
     int res = 0;
     /* Placeholder for reserved-memory\0 */
     const char resvbuf[16] = "reserved-memory";
 
-    if ( !mem || mem->nr_banks == 0 )
-        /* No shared memory provided. */
-        return 0;
-
     dt_dprintk("Create reserved-memory node\n");
 
     res = fdt_begin_node(fdt, resvbuf);
@@ -1599,6 +1731,12 @@ int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
     if ( res )
         return res;
 
+#ifdef CONFIG_ARM_64
+    res = make_pv_time_resv_memory_node(kinfo, addrcells, sizecells);
+    if ( res )
+        return res;
+#endif
+
     res = fdt_end_node(fdt);
 
     return res;
@@ -1747,6 +1885,13 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                                         dt_n_size_cells(node));
         if ( res )
             return res;
+
+#ifdef CONFIG_ARM_64
+        res = make_pv_time_resv_memory_node(kinfo, dt_n_addr_cells(node),
+                                            dt_n_size_cells(node));
+        if ( res )
+            return res;
+#endif
     }
 
     for ( child = node->child; child != NULL; child = child->sibling )
@@ -1912,11 +2057,72 @@ static void __init find_gnttab_region(struct domain *d,
            kinfo->gnttab_start, kinfo->gnttab_start + kinfo->gnttab_size);
 }
 
+#ifdef CONFIG_ARM_64
+static int __init alloc_pv_time_region(unsigned long s_gfn, unsigned long e_gfn,
+                                       void *data)
+{
+    struct domain *d = data;
+    unsigned int npages = DIV_ROUND_UP(
+        d->max_vcpus * sizeof(struct pv_time_region), PAGE_SIZE);
+    gfn_t pv_time_gfn;
+    mfn_t pv_time_mfn;
+    unsigned int i;
+    int res;
+
+    ASSERT(npages == e_gfn - s_gfn + 1);
+    ASSERT(gfn_eq(d->arch.pv_time_regions_gfn, _gfn(0)));
+
+    for ( i = 0; i < npages; i++ )
+    {
+        pv_time_mfn = virt_to_mfn(d->arch.pv_time_regions[i]);
+        pv_time_gfn = gaddr_to_gfn((s_gfn + i) * PAGE_SIZE);
+        res = p2m_insert_mapping(d, pv_time_gfn, 1, pv_time_mfn, p2m_ram_ro);
+        if ( res ) {
+            printk(XENLOG_WARNING "%pd: failed to insert P2M entry for PV time\n", d);
+            goto fail;
+        }
+    }
+    d->arch.pv_time_regions_gfn = _gfn(s_gfn);
+
+    return 0;
+
+  fail:
+    for ( ; i > 0; i-- )
+    {
+        pv_time_mfn = virt_to_mfn(d->arch.pv_time_regions[i - 1]);
+        pv_time_gfn = gaddr_to_gfn((s_gfn + i - 1) * PAGE_SIZE);
+        res = p2m_remove_mapping(d, pv_time_gfn, 1, pv_time_mfn);
+        if ( res )
+            printk(XENLOG_WARNING "%pd: failed to remove P2M entry for PV time\n", d);
+    }
+
+    return res;
+}
+
+static int __init construct_pv_time(struct kernel_info *kinfo)
+{
+    struct domain *d = kinfo->d;
+
+    ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));
+    ASSERT(d->arch.pv_time_regions);
+
+    if ( is_32bit_domain(d) )
+        return 0;
+
+    return rangeset_report_ranges(kinfo->arch.pv_time_range, 0,
+                                  PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                                  alloc_pv_time_region, d);
+}
+#endif
+
 int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 {
     unsigned int i;
     struct vcpu *v = d->vcpu[0];
     struct cpu_user_regs *regs = &v->arch.cpu_info->guest_cpu_user_regs;
+#ifdef CONFIG_ARM_64
+    int res;
+#endif
 
     BUG_ON(d->vcpu[0] == NULL);
     BUG_ON(v->is_initialised);
@@ -1938,6 +2144,12 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
     if ( is_64bit_domain(d) )
         vcpu_switch_to_aarch64_mode(v);
 
+    res = construct_pv_time(kinfo);
+    if ( res )
+    {
+        printk("Failed to allocate PV time region\n");
+        return res;
+    }
 #endif
 
     /*
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index a3487ca71303..5a724f9f22d9 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -59,6 +59,20 @@ struct paging_domain {
     unsigned long p2m_total_pages;
 };
 
+#ifdef CONFIG_ARM_64
+/* Stolen time shared memory region (ARM DEN 0057A.b) */
+struct pv_time_region {
+    /* This field must be 0 as per ARM DEN 0057A.b */
+    uint32_t revision;
+
+    /* This field must be 0 as per ARM DEN 0057A.b */
+    uint32_t attribute;
+
+    /* Total stolen time in nanoseconds */
+    uint64_t stolen_time;
+} __aligned(64);
+#endif
+
 struct arch_domain
 {
 #ifdef CONFIG_ARM_64
@@ -121,6 +135,11 @@ struct arch_domain
     void *tee;
 #endif
 
+#ifdef CONFIG_ARM_64
+    struct pv_time_region **pv_time_regions;
+    gfn_t pv_time_regions_gfn;
+#endif
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
@@ -243,6 +262,10 @@ struct arch_vcpu
      */
     bool need_flush_to_ram;
 
+#ifdef CONFIG_ARM_64
+    struct pv_time_region *pv_time_region;
+#endif
+
 }  __cacheline_aligned;
 
 void vcpu_show_registers(struct vcpu *v);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 7c3b7fde5b64..9b33526d2384 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -12,6 +12,8 @@ struct arch_kernel_info
 {
 #ifdef CONFIG_ARM_64
     enum domain_type type;
+
+    struct rangeset *pv_time_range;
 #endif
 
     /* Enable pl011 emulation */
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 2d53bf9b6177..fb754da3db17 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -324,6 +324,9 @@ int map_dev_mmio_page(struct domain *d, gfn_t gfn, mfn_t mfn);
 int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
                        mfn_t mfn, p2m_type_t t);
 
+int p2m_remove_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn);
+
 int guest_physmap_add_entry(struct domain *d,
                             gfn_t gfn,
                             mfn_t mfn,
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index a289c48b7ffd..6207ac74b715 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -380,6 +380,18 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
                        ARM_SMCCC_OWNER_ARCH,        \
                        0x3FFF)
 
+#define ARM_SMCCC_HYP_PV_TIME_FEATURES              \
+    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,         \
+                       ARM_SMCCC_CONV_64,           \
+                       ARM_SMCCC_OWNER_HYPERVISOR,  \
+                       0x20)
+
+#define ARM_SMCCC_HYP_PV_TIME_ST                    \
+    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,         \
+                       ARM_SMCCC_CONV_64,           \
+                       ARM_SMCCC_OWNER_HYPERVISOR,  \
+                       0x21)
+
 /* SMCCC error codes */
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ef8bd4b6ab33..51d1fb3067b7 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -109,10 +109,8 @@ int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
     return rc;
 }
 
-static inline int p2m_remove_mapping(struct domain *d,
-                                     gfn_t start_gfn,
-                                     unsigned long nr,
-                                     mfn_t mfn)
+int p2m_remove_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long i;
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6081f14ed0c1..31d643b5a6d5 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/domain.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -127,6 +128,11 @@ static bool handle_arch(struct cpu_user_regs *regs)
             if ( cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
                 ret = ARM_SMCCC_SUCCESS;
             break;
+#ifdef CONFIG_ARM_64
+        case ARM_SMCCC_HYP_PV_TIME_FEATURES:
+            ret = ARM_SMCCC_SUCCESS;
+            break;
+#endif
         }
 
         set_user_reg(regs, 0, ret);
@@ -162,6 +168,29 @@ static bool handle_arch(struct cpu_user_regs *regs)
     return false;
 }
 
+#ifdef CONFIG_ARM_64
+static bool fill_pv_time_features(struct cpu_user_regs *regs)
+{
+    uint32_t arch_func_id = get_user_reg(regs, 1);
+    int ret = ARM_SMCCC_NOT_SUPPORTED;
+
+    if ( arch_func_id == ARM_SMCCC_HYP_PV_TIME_ST )
+        ret = ARM_SMCCC_SUCCESS;
+
+    set_user_reg(regs, 0, ret);
+
+    return true;
+}
+
+static bool fill_pv_time_st(struct cpu_user_regs *regs)
+{
+    paddr_t gaddr = gfn_to_gaddr(current->domain->arch.pv_time_regions_gfn);
+    register_t ret = gaddr + current->vcpu_id * sizeof(struct pv_time_region);
+    set_user_reg(regs, 0, ret);
+    return true;
+}
+#endif
+
 /* SMCCC interface for hypervisor. Tell about itself. */
 static bool handle_hypervisor(struct cpu_user_regs *regs)
 {
@@ -176,6 +205,12 @@ static bool handle_hypervisor(struct cpu_user_regs *regs)
     case ARM_SMCCC_REVISION_FID(HYPERVISOR):
         return fill_revision(regs, XEN_SMCCC_MAJOR_REVISION,
                              XEN_SMCCC_MINOR_REVISION);
+#ifdef CONFIG_ARM_64
+    case ARM_SMCCC_HYP_PV_TIME_FEATURES:
+        return fill_pv_time_features(regs);
+    case ARM_SMCCC_HYP_PV_TIME_ST:
+        return fill_pv_time_st(regs);
+#endif
     default:
         return false;
     }
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index e9418857e386..57f2d9cf8da1 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -25,7 +25,7 @@ int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int construct_hwdom(struct kernel_info *kinfo,
                     const struct dt_device_node *node);
 int make_chosen_node(const struct kernel_info *kinfo);
-int make_resv_memory_node(const struct kernel_info *kinfo,
+int make_resv_memory_node(struct kernel_info *kinfo,
                           int addrcells, int sizecells);
 int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index cd528fbdb127..4d184947a4b0 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -5,6 +5,7 @@
 #define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
 
 #define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
+#define IS_POWER_OF_TWO(val)   ((val) && !((val) & ((val) - 1)))
 
 #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
-- 
2.48.1


