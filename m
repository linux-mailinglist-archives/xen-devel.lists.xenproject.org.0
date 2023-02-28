Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F76A5531
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503162.775347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvyf-00077k-WD; Tue, 28 Feb 2023 09:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503162.775347; Tue, 28 Feb 2023 09:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvyf-00075c-TD; Tue, 28 Feb 2023 09:08:53 +0000
Received: by outflank-mailman (input) for mailman id 503162;
 Tue, 28 Feb 2023 09:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWvye-00075W-Aw
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:08:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83b7e336-b747-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 10:08:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 09:08:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 09:08:44 +0000
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
X-Inumbo-ID: 83b7e336-b747-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmWiKKEaai+6MbYtAZB49tWVz0RLkdRkdEGHO3LEREHa/HPL4IvX8FdEQnz6P/dPC8C892lf1jjoWVEe4YjKg+aCGKgcDdn2SUY+dK7Y8Hg85hpFb94EAwV+xl8fJr/unZbzf8GIGV4GsYHPJmboFz5TOSomXqzNXCl8uIEdNa49qI/8CgOquyfUnLv4nmi10eUpZEZUlPWKiByZ6c0HDk3XWRSeYmWb6hFfgOfl4IbGkwefEwkKDErrtyUf3YtrCJsgrsz99+QCQ0hIGazknZNhGRw2DYPtBHaUZsbqT6d6C1SkpEZ3sOqsuEHq5qFOvaenCXW5TGytUBdAfpnQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9re3QZsju2Hvu85/uQgjvpi6KNtyr011Ea0rEBRmpHs=;
 b=Wdrro/si4B76djCSi9CMi6psrOJBqs89zQwCkshe8C8AJjXUXVTboBTBUY26vQurhfaE43DB0LqjTa4Qd5QjwYOVVKsfQaGh01xvo+MhTFJZ+BtBPUXLGf140JWpuGtyvJzWWMYQEYhvnbe/mHaU8J7V+dmCrJmGOfXWzKtigLcnSpfOuoQbXdXYeIjTv2nxcOEYhtyN5OJ4/dhySZeOBI4vOjezuT+gW67AHca3Y6LqCwW6Roo9PsxrtYge4Xg8QbQ/TP9miU+M21zE011rrG4pTohchhMziLw3/V1I2VmRuuiMJpcsa84soLq9md8x2/9RiiB8jjZo2yeyrD5PbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9re3QZsju2Hvu85/uQgjvpi6KNtyr011Ea0rEBRmpHs=;
 b=JlJvlGTvns2m+q8cBKIq0Ya/+ZHa8ahMDcAJGHr6vS3d4PZqcONJmq+DioY4YwuHE0LfMJksoW/gNfP8HQPcRZzO/PJu5WmhjxWLTBcCL3rnNhWYNKpHO/DiWvPyevY+dmfhsLiO+sKwodlCnFyj9JHD9ZC7Q5jrzg1ZLZSjMWkNleSy25lXSlqT00PLu0yJ7C4Nd0fBx7FN2zwxrPJpcJ0RomkSQnVxYObV2D1Hlh4XiNH/DAZayWXgIupK0QFWb78CXX1ujmKHmQJNKoujVWsurYM6HGKyub29HDjnNT07XO340x/MfqXOlaOWi92B1z3mv6t2JYFn3JwgIulrzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46721d04-508a-9d63-2af8-5ece857ed54b@suse.com>
Date: Tue, 28 Feb 2023 10:08:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] core-parking: fix build with gcc12 and NR_CPUS=1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f24c758-2d2d-49cb-1073-08db196b6444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wnhfCZD+bd6ZNIjMj3BCX1/ahDHoYFL+Zp0Ln1fHyRpg0iMr/vzfx448HYaa54OWD71zSldfNYr/6pnT4gEKzifa24uYuxA5sWowP5d3Nmj4QS4GYemuQUwx7h6R/uTNcB1UG4iD6iDGUuP+qwwsJ2Ra8PJB1WB5klUBiF045iPufY95C1geeMNFy1OkMqZ0VVpOYUemDmaKr7wJ/5VYkTM0dUBGKJS4lyi+eOjldcO/nF/Yve28sMy3H42ngbkgTl1NlGuMEZSUEAM7YXnPqGXikHqAviGTLy4H+WVL6mQTeFp98Y79NjwnoBKysrc4VBdj2tDmXLc7yWyKewZ6/eQrXEZCBVNi67KGoPVWH0BEuHxSJ7sp3EG6aN/8urham7w0yX3ygjDKzRfC2tgQN+LOntd8/EB8xT04NvoTX/YPTTu6BVowtHG9xa0Hc3MH6ueN5Mx9O16s91TQGKZBggTCcd84utKWlfyAqiCqgudk1OFUJEIslLxbu59g9HjAF1+LtlMipeD36vJ2qoZbhDyaJfdYTzI2jBp2fxiJKRm+xbBbMUwSOJC/nguUtEtZYf6A4WC2g8Xtf91g6t6bd1MW1x4QQZ57yMe+7alH8ZF6fhBNNZznrphRF+iXOL8o/Q1JOvmh+aI2Y26OZEP3PMwIKlFmzkx3ebZsVufl6FcKIgDnctyDR6Yg+/3CbdW3KXN6JSOHU9gtJMK08fHhXBu58jbsP19/F+h/SONzEf4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199018)(54906003)(86362001)(316002)(6512007)(2906002)(26005)(31686004)(186003)(478600001)(6486002)(41300700001)(31696002)(5660300002)(8676002)(6916009)(8936002)(4326008)(66476007)(66556008)(66946007)(2616005)(6506007)(83380400001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2JVbTRyREhGWmNvZUJVekhnYlNGMkwyaHJjc04yRGJucVFyb3lnYXBocFBN?=
 =?utf-8?B?R0RxRWE4T2tsNElFaWR2U29RVk5ITUtDZndIZDc1Nzc4R1dlNTRPUVRtMTI1?=
 =?utf-8?B?cHJYSDJYRGNOZjB0bnVpb0xCNE9UcW1YQjVIZW5WaTZ5YXJ1Z0plRlJQODls?=
 =?utf-8?B?NTB3Q3pCMFBibGN2Nmx1NzJHdTIvc1BKRDBVMUhlMVA5eFk1N1puSWtNaHVp?=
 =?utf-8?B?eCs2YnlESUVFTnpHN0prS2lLSkRoNmlTMnZ5YTVmeFZaKzZmbzRpSG45YlVn?=
 =?utf-8?B?ZHlYU0R4cjFSYVJ3ZHFwbm50VWd0Ynorak5mWUtaVSs3MWFNS00rVDcvN3I5?=
 =?utf-8?B?NzlRS1NTSS90V0N4YW1sTXdhRTFsaFQ3REg3RVBGQzJBUktxeHFFQno3czg0?=
 =?utf-8?B?cFUyOFVCRXdOdCsxTWI5YkQ4c2I5eGVsZ3BxbkN3cmpCL2tUYVZFd1QxbVE5?=
 =?utf-8?B?L1A4ekl3eXpUNXZLTWhjQVU4RzY0K3Vha1JlajNHUFA2eW43M1VqYmZQTXRI?=
 =?utf-8?B?eWd1TXJLd2dRejRMNWt3eWFtd2Q3c3BuUjdqMWZ2RnVLZ1I2NXdqMmdnN040?=
 =?utf-8?B?UWxXTm1CVGNmQnJvRG9sL0VVZUorQmFUdm5iQzR3MStRUFljRjBUN3JTMC9H?=
 =?utf-8?B?YW1PR0RZdjRNSWtGa0FsYi9ENnBpQTNTOFpLcDAvaGdhc1R3T0JXZzNhM3kz?=
 =?utf-8?B?M0xTMk55L2JXVy9WZHlKUGZydHhRdUJqYk5QUlJkUVRDMVZLTGhaaEh5bGUy?=
 =?utf-8?B?U1c5UXlPaXRRY3Y5MTRoK0EzVnZxNDVrbzRRdkQyZ3MwLy9LMk5RMklMSWdl?=
 =?utf-8?B?Qk5WemttZnlXWm5xblkycmpjS2dBMG1TNzRCR3JRU3phU3ZMa2hkVGZMYlB0?=
 =?utf-8?B?UFExenhMLzA0djE3MEpFNUJxMWpVckVlUzFCaEh3NzRGNEpWaDcvRmdQQzhs?=
 =?utf-8?B?Vk15ZS9rNnhHWEo4NGlSYkNUZVN6RjJTTVJlZVM0blJscXVKWkptaWo4dlZV?=
 =?utf-8?B?bzBFS3MrQWhodFF2TDd1Z29tbjh2ZGpQMEJLck9mSTdJWTJ5MFZ4SHN3UXdF?=
 =?utf-8?B?ajlld1JKVVZ1ZkhrNWNCUlBiWTZLdkFBUXA1dkJ3c3duWDIzMjdNSFFvOXFQ?=
 =?utf-8?B?YU5SbnRiVk9qdWZuYTJLeE90SDB4eUJSVVFBTU9yMG9jTkdLTTcycnI0dy96?=
 =?utf-8?B?Y00yVDBmZGsyYkRSK2dmT2owU3FwU1R3d0VUNkFUY3lIUVdJQmZkRWJIcjBG?=
 =?utf-8?B?RndrVWJxVE9sclhIa3JCd3NCczdSUjF6aW9GQmlUdXdSNTBnM0VPVFVtRkxT?=
 =?utf-8?B?QWNQbVhtcmlqWWhTcVNjSVpyamVUR0VRRHZCVEpYSmNJdFVuZ1RFYTA5RXlR?=
 =?utf-8?B?QlZjb3pQR3ZWVi8vNEp1eGpxalFLR2ptaCtyUUJaK3h5YVFVUHpsTTc3Rjd4?=
 =?utf-8?B?bzdEVWRJcGtGRElHZXFwSTBWeCtvVDMwa1FhQmthZXZWK2VNRGd0Zk8yN1lw?=
 =?utf-8?B?ZENWVlBaT2ViZ3BaNHZxYzZ2SnNzSjVPcFptTkJUWlNYcHgzSkFrVVFwSThU?=
 =?utf-8?B?U0ljR0k1cnlURlNpSHZ5OGdtdjUvT3k2K3dqMVcyWjBhMHUyeW0wMmpxZG9o?=
 =?utf-8?B?V1BQUFhXcHlSdmlCU1JROVRZUVB0anRWb0lEbitFSXhmNlJpR04xd29QdDRs?=
 =?utf-8?B?NzdORmRPVFRveU0reDlvR21yVjM2TlFYeWNUaFJnUHdJdFA2M0Zqd25MK1B5?=
 =?utf-8?B?NEtiYXo1R1ZpTzhyUDB0YmZ6cWxXalVzeUc4b1h1MkVkRlRVNFd6RFZ0cG5X?=
 =?utf-8?B?NnQ2YUk1azBxUDkrWitGQWFBR01Da003cVJZZnFCMXlIUnZ6SlN0cFhPUkdw?=
 =?utf-8?B?ZkFjUEx1RDJYUDVRRVVkU1pXMmEwaTZvcmlJTyszTWwyVXpBOXNPUy85b1gw?=
 =?utf-8?B?UU1Hci9NTG9xSi9wdzRwdWN6bWMvQzRNb2VwTzZPdHFuQ0hhTkxzWThIOXhu?=
 =?utf-8?B?VTVYRTJMbHBQRkQ4R1paWHpvZXZ6b1NBakQwRi9TbGg2ZHFUUCtsbTVCL3c0?=
 =?utf-8?B?UGU4ZmJ3STROMVkwY0Y3d2NNOFRCMUhCaFd6SklXWVBuaFNUM1k4NDEzc0Zt?=
 =?utf-8?Q?y8P0ejnsOgoV8a2k0Tz5nMz4o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f24c758-2d2d-49cb-1073-08db196b6444
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 09:08:43.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikH+OT2jR1MONpDkXvrE8ypTXbK1UDvU9MGBxtFgDuCMU6BUuy1VXvyNffxGrlavl1VX4Ve1M9kwbkt0K0ky+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

Gcc12 takes issue with core_parking_remove()'s

    for ( ; i < cur_idle_nums; ++i )
        core_parking_cpunum[i] = core_parking_cpunum[i + 1];

complaining that the right hand side array access is past the bounds of
1. Clearly the compiler can't know that cur_idle_nums can only ever be
zero in this case (as the sole CPU cannot be parked).

Arrange for core_parking.c's contents to not be needed altogether, and
then disable its building when NR_CPUS == 1.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Use "imply" and "depends on" in Kconfig. Adjust the arch_do_sysctl()
    change.
v2: Disable building of core_parking.c altogether.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -10,7 +10,7 @@ config X86
 	select ALTERNATIVE_CALL
 	select ARCH_MAP_DOMAIN_PAGE
 	select ARCH_SUPPORTS_INT128
-	select CORE_PARKING
+	imply CORE_PARKING
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -727,12 +727,17 @@ ret_t do_platform_op(
         case XEN_CORE_PARKING_SET:
             idle_nums = min_t(uint32_t,
                     op->u.core_parking.idle_nums, num_present_cpus() - 1);
-            ret = continue_hypercall_on_cpu(
-                    0, core_parking_helper, (void *)(unsigned long)idle_nums);
+            if ( CONFIG_NR_CPUS > 1 )
+                ret = continue_hypercall_on_cpu(
+                        0, core_parking_helper,
+                        (void *)(unsigned long)idle_nums);
+            else if ( idle_nums )
+                ret = -EINVAL;
             break;
 
         case XEN_CORE_PARKING_GET:
-            op->u.core_parking.idle_nums = get_cur_idle_nums();
+            op->u.core_parking.idle_nums = CONFIG_NR_CPUS > 1
+                                           ? get_cur_idle_nums() : 0;
             ret = __copy_field_to_guest(u_xenpf_op, op, u.core_parking) ?
                   -EFAULT : 0;
             break;
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -152,6 +152,10 @@ long arch_do_sysctl(
         long (*fn)(void *);
         void *hcpu;
 
+        if ( CONFIG_NR_CPUS <= 1 )
+            /* Mimic behavior of the functions otherwise invoked. */
+            return op != XEN_SYSCTL_CPU_HOTPLUG_OFFLINE ? 0 : -EINVAL;
+
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -10,6 +10,7 @@ config COMPAT
 
 config CORE_PARKING
 	bool
+	depends on NR_CPUS > 1
 
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT

