Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4A6B7AC8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 15:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509319.784855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbjQz-0002U9-MG; Mon, 13 Mar 2023 14:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509319.784855; Mon, 13 Mar 2023 14:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbjQz-0002RO-J0; Mon, 13 Mar 2023 14:45:57 +0000
Received: by outflank-mailman (input) for mailman id 509319;
 Mon, 13 Mar 2023 14:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbjQx-0002RI-Uq
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 14:45:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c09ec886-c1ad-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 15:45:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 14:45:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 14:45:49 +0000
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
X-Inumbo-ID: c09ec886-c1ad-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4zDEtgWp1ESF76xz0XVXjG+WHzSPNOmdbmE3ePKcQPGipow8UeOXF4Bm5Dmu2MdIus1wqU00uVRq4UpUk+ObySv4jB3fhSa0+4WWTRhKw1heBMIVWJGG8b5c8b74aaSyvRJyil3kPQXgLTcAmR50P0eIX30rUlFwHPGzWfUZuw5GweZ4VXlGHr/cHoXEAFpee7/utIAGabD1RwyT+ZCeJ93eA4/qiqusZPZj75lT6/n/iY03FZ6ngE6OawvTErdcOsLDy0b2+6c0HMeuAyjPxc7g9sdFy/A4/2VvpAl2x8F3YBXxCrm0ZvHtdRhmDH1JKds75tAcwcBVswnRNOa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWpN1480tjRPGRXZlWUgNnk5FrJrXJEUh5BpxzVk7yg=;
 b=hTEgaq/BbhUd00Q8jTcaiztSlcS8Ozl7ANAoKyCiFpzHBryUk4bgxB+jxwXD5snBDk1c4rV/NEt+Ton7XCTaOTNLj2shZz4RtZkUofeZvZW4U22BSSw30ygZKYkYen9TPequaI3WtCdPiGjyLGRsX9he5QfnQDojNfmHl2S620pS4TQr9ioMH/fodOdbqHhYN2PmFvjuTnHvSp9MbMLTIotXpW1GgR25fDR2pHWanoPVjbYBUwrdU04AsFhyx+LepVclr5oMMD8/6760UF3+mDSRpBuseZa0cga4fxqf7ozHeQVVIaXNws+bag700k3yPrqYjB0zSGCKM5zfpDaMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWpN1480tjRPGRXZlWUgNnk5FrJrXJEUh5BpxzVk7yg=;
 b=B/aC1YyHvnFgKU84g5JJhglVmw+EAwMCixpZQNO8KW03fzioUJ1lk0I5w+EMwgqNAhIMB2oelKTT9fe9sqOoQQZ+WFX4PhHbfej6AZCYGsagauV7n3VfOPmQCfVhk1pwBPyQIu/nTKQbTWUWmDwPZFrdIgFi6O5IyRcXWIg4WX/Fm6bCxtx/6X8uTxJ5PV/Vg/hMNAK51+MStbJyrhSky20652JDu2/dzysYJJhjWXO9W+pkE8Cnvdap56X8OueAag6q+nY/f/21Hs1LZTldXLNnM4s1pv4m2N4QP3u+3rYPSOnOgdTuWVj4/fLLXbYnvqc99QMJ4SVUYBEk87JSyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f315e92-7bda-c124-71cc-478ab9c5e610@suse.com>
Date: Mon, 13 Mar 2023 15:45:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: obtain VGA console info in Dom0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1fc107-c164-4b70-b703-08db23d1a33e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6C9szDA+1Vg9gaEKzHllggLA6X/13UPFkqrfh1Cg0Wqf2yo0b5RRS4DrUfNptMYFVbL20EnZE/TfeRa6jkvpXabFAbwoPB2L3yXhTuqbK7phsnMUwucHRa3g6LxAXtUUYPP4b7ECcXBC0Mmy5X3KrRbkmcscT/b2luBIOhJt+iVuK4Sl7qTVzYGeiI3zQv9sHMir2C/IXNx8IXcpclEfd4WFJzhrtw2Y+LXuhxJbax65wm7toBsvjkAz5zm8DiXq8+Wv3NJ8E4ccorVgATTGr2zqUT1DGtwYPZjWdEdIpwU2KKVEVZuk3LbpZiSWYYGjwGEE2EMWvC17PBkah9wdxFbuGrbxwS0x+Q+csf1Aaqgk7VHjtAxHwTA+igzmORiwW8Pv7pbA1qjzHCT6/ubkDwHoJyFCt6M0C/pkgW4kct6GWf8PY1Xy5P/hbAyhF+XeQgGdyjf45iatIDH6SHZ+yG5sAjAAlGg6Aw0AZ5zkKzHk4ANF9CmtC2yUizeof/s38AUbDBdI4GhFlFbVwvpku0jzCfEJHo+QYnXQKFyZWMyUJ3qd4NhP71XyNRMCBJrqH8LhIpzUr1TUypSN2/szoKvSsKLDcVUTOGcJCPlkZ/ila05MPxvw90WsNLO7l/WILQztXO/LqV+o92u+DeY6UVTt6Mjl2vkwPo3nGeia7V8RAvoNgcRiXd6BhnXRgAM+gSXSPy1JLhXrdEb5CIzUBcaQXaZGaVAzvM8kJ2jaxwypiL/YsIJ9D+EJRg0lpYNRE/PLDWXckG8Za2KsZafKmm2KRSa10/SCv7E+jTaGay0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199018)(2906002)(31686004)(83380400001)(41300700001)(5660300002)(36756003)(66476007)(66556008)(8676002)(8936002)(186003)(54906003)(6916009)(4326008)(38100700002)(86362001)(31696002)(316002)(66946007)(478600001)(2616005)(6506007)(6512007)(26005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0Q2aVEvUEl4NEdzZFlUeDhtNmZGY2YrQ0hMSmQ4SWFWQTUveEFGMThoTUdo?=
 =?utf-8?B?d2FpTGxoV1BqZU9MWHZLUHNCOHArVC9pcE9STmFCelN2U2RaRW1RT0gyVlNw?=
 =?utf-8?B?dGRKT2tiM1h2b3pHQ1NsY1BabmhyeHFqNklYcjA4S0plaExndVB6d2xZNzNn?=
 =?utf-8?B?SXdPQ1JZb3hhanJaODJMZXl6SzMxVGk1Y25pUXptTGNXcStxVENQbWp3L3RU?=
 =?utf-8?B?ajlNbVVsMGkvVUp6ajIrdHI2a3MrYkRSTklybnc1ZlJqTDFuSEN6QzdyQ21Y?=
 =?utf-8?B?cTd0cDRnSU42WXpkUXhNT2FtY1g3eTgrTVZOb0VHRVJTZ0ZiZmdjYW13blBM?=
 =?utf-8?B?dlF3cTNETlhsOVhReGZBdEVFa0hxTlNrMWRXZ2R2VGJzNHZHM0E4VjN2N1RV?=
 =?utf-8?B?RHpoZXdJWUduUkhhZ2JnSDRiKzhNOFZKZEJGNFBYbWUrWTRmQlZUekhDWFdW?=
 =?utf-8?B?OVQzdytUc3IvekRPZ2ErRXBsVFdsaHJ6MDBDMVlydEozdEZpeUliY2tjQ05L?=
 =?utf-8?B?UzJzY3psMXhTVDhCcDhPZmh5VjgvTkxzVEdBaUhIcjN5VzFWMHNLZHVXejVk?=
 =?utf-8?B?OXRhWEVwUHNTUVYzT25RSWlLa1dpZ1MyZUNXUWZJZWtKeW5MRmZIU1ZwemZm?=
 =?utf-8?B?TXcwNWowOUovNGFBdXdRV29LWUhsRnJqek9jeEt5VWkyRmY4K1FRcGYzQTRz?=
 =?utf-8?B?Mkk2TDRDbElldUs1a01IOVRmNG0rSDZRMk5EQXJFcTdIbGJUWHdrUDlNSWhz?=
 =?utf-8?B?R09UZ1dHMnJmU0dVNEswQkd1QXV5emM4a015MU1nUWFHY0ZBVTZDczJUcFpl?=
 =?utf-8?B?eTFDM1NRL3ZPQkRGSGZwTzlaMmpOOE5HanJHN2dsTis3S29xMEJPRWN3dXZU?=
 =?utf-8?B?MDI1U3YxMFdkOVA4SDFRUXRMRkJESVBnb1hHcXJLRnVXZWZwY3ZoSVZPQmJ5?=
 =?utf-8?B?T1UxaXQvUUZkcWFDb092bWtHM0I1WFZQNjdReXlsS2ZhdmdyWnNKYUt5L0d6?=
 =?utf-8?B?TmlVTkkzNzRPQUZKeUJSTnhHUTJNN0dlRnJubWpiQXJzSE1LQTFwQW5aWkZo?=
 =?utf-8?B?bnQ5RitlTVMwRDhudFBueWdsdHMrdnFUQjRxWW9ocmgvNUdMSUZPY1ZWTVgw?=
 =?utf-8?B?a05PMDg5Z2NzVWY0bGFtRWYwOEVwUzVQeWxWQ3V4dk0yZmNETTRBSWd1YXli?=
 =?utf-8?B?S1k0bmEwQWo4S1V2cm1iZWZzSGdRSG5vQk9KYlA0SEswRVZkSTJHZ0NuR1VH?=
 =?utf-8?B?SnFLN3o1Tm5LVmhHWWthRGNCMjFrdG80T2t1UXNYak11dGZGSnZjRHUvRHQy?=
 =?utf-8?B?b2d1NWI1eDRCU3BSOUxjdVltSlZERGJzTjQrVmlUcjNsdFczQ3VsL2hEbytr?=
 =?utf-8?B?bHF4ZGMyNUVSYzVPa3YxRGFLeWxCZTFQbXQydkdMbFAzVTFsaU4zTXU2N2pJ?=
 =?utf-8?B?R0w2ZCswVTFJVHZzYStFcHhnOVU2M3pIRUpoQnN5c20zeThaRDJBZy9oRUtp?=
 =?utf-8?B?UTg5OWwvdDR3TnVIeFVrZnpvTGhJOEdpOHkxazg1ZkFrbCtoUHlGK1FsbzJD?=
 =?utf-8?B?VHFHVVdEOXpXc0dOdHIyNndkM01sekxGWHg5RmpTVGRsUVAvYTlidkUwa1ph?=
 =?utf-8?B?QjArRUlzYWlKT3haeUNIVUZkZ2xOTkFnTVNlNlh5U01Xc1A1KzFvWEJQbTRZ?=
 =?utf-8?B?bWkzMnlyT2F6NEl6UEsyc1BBUGVPVkoxQldyR2taNE50dXk3UVZpZVZQcUVB?=
 =?utf-8?B?eHh5b2hwRjQvWUJybTA1QmVwenIwMW9mcU1sNXhIakVnOFQ2bVROUmhqT3VJ?=
 =?utf-8?B?TWwxK3d2K3JGbTN2Q3dTaWlDVXV3SllkTHFkTXB6NWxMQlpLeU5yUEZhVkhs?=
 =?utf-8?B?UWRIOEE4d0lVVlRsSzBncE9LWEM3K0lkMlpiL0NPR2gzVW9rRzJnSWhydFN4?=
 =?utf-8?B?Z1pSdXg4SHVveXVjc0hob0EyUkhiYi9xR0lTbDFQM1ByR3MyOFBKQk1lQzI2?=
 =?utf-8?B?dWw2WFVGQnVwaDd6c2NaRlgxZ1dJUEs4UGVYMUxXNldFd3ZmMUJnUko4RjVQ?=
 =?utf-8?B?WTdwYUZCUWFZNEpEV1VSM2h0ejB2aDNBSytoVjRlMTlTaHN4dDUzVzlDWE1I?=
 =?utf-8?Q?Cla1or5JPdhmPLdAlFd9zRRFG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1fc107-c164-4b70-b703-08db23d1a33e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 14:45:49.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+MxXpZZhiHk7MT1XevpKqQj4A4qtAYkLn0bTvUyNEgbOIMgCoaw2SCEEBChFkaOXDuZwGi2rJeS6sTJWLbxLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7402

A new platform-op was added to Xen to allow obtaining the same VGA
console information PV Dom0 is handed. Invoke the new function and have
the output data processed by xen_init_vga().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -45,6 +45,6 @@ obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= spinl
 
 obj-$(CONFIG_XEN_DEBUG_FS)	+= debugfs.o
 
-obj-$(CONFIG_XEN_PV_DOM0)	+= vga.o
+obj-$(CONFIG_XEN_DOM0)		+= vga.o
 
 obj-$(CONFIG_XEN_EFI)		+= efi.o
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1390,7 +1390,8 @@ asmlinkage __visible void __init xen_sta
 
 		x86_platform.set_legacy_features =
 				xen_dom0_set_legacy_features;
-		xen_init_vga(info, xen_start_info->console.dom0.info_size);
+		xen_init_vga(info, xen_start_info->console.dom0.info_size,
+			     &boot_params.screen_info);
 		xen_start_info->console.domU.mfn = 0;
 		xen_start_info->console.domU.evtchn = 0;
 
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -43,6 +43,19 @@ void __init xen_pvh_init(struct boot_par
 	x86_init.oem.banner = xen_banner;
 
 	xen_efi_init(boot_params);
+
+	if (xen_initial_domain()) {
+		struct xen_platform_op op = {
+			.cmd = XENPF_get_dom0_console,
+		};
+		long ret = HYPERVISOR_platform_op(&op);
+
+		if (ret > 0)
+			xen_init_vga(&op.u.dom0_console,
+				     min(ret * sizeof(char),
+					 sizeof(op.u.dom0_console)),
+				     &boot_params->screen_info);
+	}
 }
 
 void __init mem_map_via_hcall(struct boot_params *boot_params_p)
--- a/arch/x86/xen/vga.c
+++ b/arch/x86/xen/vga.c
@@ -9,10 +9,9 @@
 
 #include "xen-ops.h"
 
-void __init xen_init_vga(const struct dom0_vga_console_info *info, size_t size)
+void __init xen_init_vga(const struct dom0_vga_console_info *info, size_t size,
+			 struct screen_info *screen_info)
 {
-	struct screen_info *screen_info = &boot_params.screen_info;
-
 	/* This is drawn from a dump from vgacon:startup in
 	 * standard Linux. */
 	screen_info->orig_video_mode = 3;
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -108,11 +108,12 @@ static inline void xen_uninit_lock_cpu(i
 
 struct dom0_vga_console_info;
 
-#ifdef CONFIG_XEN_PV_DOM0
-void __init xen_init_vga(const struct dom0_vga_console_info *, size_t size);
+#ifdef CONFIG_XEN_DOM0
+void __init xen_init_vga(const struct dom0_vga_console_info *, size_t size,
+			 struct screen_info *);
 #else
 static inline void __init xen_init_vga(const struct dom0_vga_console_info *info,
-				       size_t size)
+				       size_t size, struct screen_info *si)
 {
 }
 #endif
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -483,6 +483,8 @@ struct xenpf_symdata {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xenpf_symdata);
 
+#define XENPF_get_dom0_console 64
+
 struct xen_platform_op {
 	uint32_t cmd;
 	uint32_t interface_version; /* XENPF_INTERFACE_VERSION */
@@ -506,6 +508,7 @@ struct xen_platform_op {
 		struct xenpf_mem_hotadd        mem_add;
 		struct xenpf_core_parking      core_parking;
 		struct xenpf_symdata           symdata;
+		struct dom0_vga_console_info   dom0_console;
 		uint8_t                        pad[128];
 	} u;
 };

