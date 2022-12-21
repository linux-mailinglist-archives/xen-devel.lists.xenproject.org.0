Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5656531A9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467890.726948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z6f-0004OY-Bz; Wed, 21 Dec 2022 13:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467890.726948; Wed, 21 Dec 2022 13:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z6f-0004Ly-8t; Wed, 21 Dec 2022 13:26:01 +0000
Received: by outflank-mailman (input) for mailman id 467890;
 Wed, 21 Dec 2022 13:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z6d-0003Di-16
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:25:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2079.outbound.protection.outlook.com [40.107.247.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 008fbdc5-8133-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 14:25:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:25:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:25:56 +0000
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
X-Inumbo-ID: 008fbdc5-8133-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwL6Df3YszTBwlGv1OlA0hSp4q0z+MRE9/YqhmKZs6TXuFk/OdguBj1OL+ZgyTbx/RScA695xZpzgTqAebhBnQK/jFVnbCZWu1CuyQBjozP4q0tv3oTrAl94Td41OkcS9VTRFAmntoawAigysQUIoLM0FnH4SqwuU+JIY1g/A6MC+B6/5umF9YYmqAXgYJilIaH9+L8w3KqDb9V0zxVxfbUTxnkwrXiqOyJ4F7LcYG93KWGy+XLBL+nMYZ+MEMGKOjDfjYrnd0ddZ+xHRufXapkR5woTUgR3CiSqBJEgcqMWAJF3g2riXcaIE/vo9r2S57sPRXMaTiag2ofKAHKqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rldcuhOARHmNVJ4bzrBkzU00bPLVpOspDoSIIfszq5Y=;
 b=cm4xxDUprR0GNH954Gz7SeIsiE+gKtQIkA67oz9UC2dpcgisbWcJGp051B1b3Px1cTfv3q8SQmYgqYtjExgVIr0cTJfoY+Krspz5McJsXN9+72BR2k+VPxZYhA2cmydDfVijjvjm2tDXcF+f6TFi0Dm5u1M+ZTzztXV/QL5uucUq8zneylFYRGPkdOoMIpwUJv6Mu7sc7zB2gDxUUIWmb2cmrcPbmQa22ENxQgJK8TEGtK0WrhlhRJDf5h21g+FVKS9WiPZe5NFmDPALfpZCsNolC4VQ5+qODOTPy6DiNArdg+XYFyBgdO24PUJdRFfFZox0kK0PEQDaD9riblq+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rldcuhOARHmNVJ4bzrBkzU00bPLVpOspDoSIIfszq5Y=;
 b=CAXnM6HXdxR+HsV0AFUmPlv56Vs446+uKNFUuvMJYGYMHTyJ/i6m7zvyFQqU+sDmG9+9f5J3HRZ07m8+A525M845q8bEN9ApEUeVvzAeZqi3G7x74ny+Ozs0TNbGKh2woaKXeLaREBcKJozCy/huq32/LdCjDdcCa2wNTkXxc+nDrGkd8Wq6jIa+qnTfM8/pp9pOJH1jS83e4ypGqgIY04RqdVn1P+yxMM6zgez3Ef0+gKfxVt1ynIbYfCG6Jbw65RiBz01FYRFJp9B8TO6w/Q3014/kC2szxSin3ykaREgsHzLe5Qvpd1Pb9xWhQcyd3AhsLSpDwCVwE0yptY9nGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bee2d51f-534e-f6e2-6385-70f8597eac1e@suse.com>
Date: Wed, 21 Dec 2022 14:25:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 3/8] x86/paging: move update_paging_modes() hook
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba18161-67f4-4766-ff8f-08dae356e44d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jvm8ZuL2nffqZFD8YXA+47EEtExRGfXTs9JlbW1qDfrgUDmfqo+ml0U8nMxCyBupy2FJQwHQ9jmsdZtt+gkwHNY0J6wLm+QWTTOrlfUKPjSPXqHWfVcJ9izlaUzk4LJSBU01iWiRJPABusssv6TG+uGXWwv2d6MZRqeed9gVuz1E62GzflhkUbakZMV4hx6Xk/tO+eKEBps0LWwYW11AQ4O7kMn4vX1qloEGspKFLjIYGi71VcSfnhOlQWTcoc8Od0ta83Mf5MxJRHjT/Cf2Ru1Hv0KbdCaVpQj/BRaeAW/dhJdB+WYSYqrot3j8Nb29NmdZMKBh7ci7E5vh5eMMKPYuf58v7m5WBqbCgwUKX0d1FrMVVDXwmdHka5tc5oWOAwbD6JHCUY+mjAjC4FbRHOUyOTokOYO2TI65jSX3J/2IVXG0O8Sjtm5Bb8AfPl7VgQHb+elI6W6L09s6bbhHu18oI7s5i5FkOYjS9MUHH3SbAGWPfIBJaON/wOjtTGfZlAIbdcFXCnMDPH8ZJmkukBiWVef+8Jco4XLRX8wYcKh4SRu8UihDBqnszA6mNBMzdaeAwi9TRjab1LIyl8CClLZWzv9J5VZXThke6029e/nuWTDAhJHSsM1n472VzeotnuicRsPewAu0rbu3bNZ2xDObEh1/8u0Oa7AE7KUiVqVJcGmqSzj7eyJVK4PBOON5kW/X58/K7KW1tpQ4524zXq0gTJDudu70kTx/JHws+Ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199015)(186003)(38100700002)(8936002)(36756003)(83380400001)(6486002)(6506007)(2906002)(15650500001)(41300700001)(54906003)(478600001)(6512007)(26005)(6916009)(66476007)(4326008)(5660300002)(86362001)(31686004)(8676002)(31696002)(66946007)(2616005)(66556008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVRnaWpDUDEvUTdCNnFjWW5QeDBMeU1XcURQTEdHME51Tm5ac2JMUjBLWEVq?=
 =?utf-8?B?emdGYnRsaDlTSkttOWdMVCtPOHEwUnRkQWZjWGIvbTltMTVtcHZ4RjlLb3N5?=
 =?utf-8?B?cGczRkNXalM0SW9McktRUEJmYmk4dDNuaUs1Skx4VXUxWGZsVm5VNU41T0dC?=
 =?utf-8?B?OW95MkhleERhcENBMWM4WVIxL3ZHL1pFVUl6dlFQNDYvSUM2bmJpY003Qlor?=
 =?utf-8?B?QXplbzBYdS85NG9tQVIxWnZNWEg3RHJmOTl5N2hXWDJuV09ER2VOVkJQNkJM?=
 =?utf-8?B?TW0rcERTYXFRN005ZGEzREtRVC8yQUpBakhhTDVaUldraUZZUmxORXloQzlK?=
 =?utf-8?B?K3lzc1pmdFNrRGM3eXQwY2RySm5RbkhMdmpUcnRqYy9PdjcweTJFeis2cnZL?=
 =?utf-8?B?ckVJR1AzZkdtdmRpVDNsNkNpaDN0WXMwWW9naHpJNkVNNGw5aXU1Y29yK2ZS?=
 =?utf-8?B?VVUzZmRCa1pBRUpZdUN3QmFVWE5RWXhrMlFFOFV3d0tjbmhuMit4UUREc0hW?=
 =?utf-8?B?NVo4dlM0Uk9OVXMrbEJsckZPQytyWVBQTzJWOTRPSHAxU2FlSVFIdzNQZWw5?=
 =?utf-8?B?VEMvYzdXbUl3clB1alZ3MGtRaEthOFkwZEdOVDcvMDl5UFpDZlJWQmhzdGha?=
 =?utf-8?B?U2R6eCt2aGlic3JtSnR1azFpQUZjNFYzTTNLVlBQdUsxU0V4WjZ4TWZIalg0?=
 =?utf-8?B?M2xIRDhZNktQUE5xV3BTYmd0WGpiM2c3STlCUEZhbEIrN0VDcFhrNFhRUHVK?=
 =?utf-8?B?czA1dFppajRLb2luczJiSkRpNy8vNmlXTkFSVnJBekUzOVpHVHNGVDdWV2Rz?=
 =?utf-8?B?NzZBczlSalBUcGpjOTVEWHVxekpQdWFqOVhGSGsySDdRLzNpdmxjWEgvWFk0?=
 =?utf-8?B?TlZzTnRsb3lOZy9udnlOQTlKbDZLeEo4U1hvS3c3QkxyZGpUWlRkblFWSjdD?=
 =?utf-8?B?cU9adDBIWW1kemsrRitmWUtPMGU1ZTNpNW1GdURJWXNQVEhNL21IQWxoeHRM?=
 =?utf-8?B?dVYzaExZSnFsekN4SWpwdDVXUUlXM01pWEE0bVdkSElsZVhjVG1NQ21FeGxN?=
 =?utf-8?B?VzRlM1NDN0tWdjJjU2ZUSHA4L0pkVnpaOXJQZGo2OXg2TitrT1FNOHc3NW1S?=
 =?utf-8?B?TzNFeVB4SytJSzJvUFJZazFUSk9xaFRianQvMi9sZ3BUV1NXbXdhWDQyWXRy?=
 =?utf-8?B?VXhqaW1NNHpGRHJwRlBINmVuTnhLVk9XTWFEMVhJSEdXN1BUbXZBeklCWG1I?=
 =?utf-8?B?L1lSWlpWNjY2TlozMzRaQ0ROTjV1UVlFQzhYMHNzbVAxQUNVaTZGM0pTODdO?=
 =?utf-8?B?c2Q3L2t4QXBUWTRlTnFlK0Y5UWsxekxDQnpGYm9ZbFZPQjllWk11VFNMZnVl?=
 =?utf-8?B?R01GRnFMeUtVM1NXNFFiZlRodW9oQ0FlZVhocnFXZWM5U1VvN3dxd2hSZlFN?=
 =?utf-8?B?dldnY3FFdzJzVmFML2Y2NzFiZEgwRENRN01MeGFrdHduWXpHUitUR3FKdU85?=
 =?utf-8?B?RmNuVThDVzJQcVBMcU00SlE5RnNlVk0wRk5FQVhaOEpZc1pOUXZaZ0syallL?=
 =?utf-8?B?ZDQyZ2NxdTdjTWt3enM0S05zZExTOC9KNDhHNUZvcmsyU3Z5dVlDZzBHaEFk?=
 =?utf-8?B?OVI4R2ZJT25NSUpaZGJpd3FBZ0JSeDU1NXNvc3IvSkVIMDhFckJ4SDRsTG8x?=
 =?utf-8?B?Rzlqd0UwTG1NdHJzTFpTZE1HWkw1YVJtenBJbS9Qdm5kdnRlemR6VlZTb3Jr?=
 =?utf-8?B?R1ZrSXlXK2IzUW9RWVpZUWFkM1FQeG5KcHo5enJqVStBQ3JmSDZ3KzFQaW9j?=
 =?utf-8?B?MkZQakw5NHFLdFBTNTNBbVo4VldkajB6NU5SU1M0MEYvWGtBeUF6cEhDQUFC?=
 =?utf-8?B?cFhXM3hHRndSb3pLSzluRzI4SmZVZzk0cFpFV3UrK1h5WVpya2c0bFZ5bnZ6?=
 =?utf-8?B?eERpNm5CYk9LRGJDbG1ZSGgvTnRJdjNaWG5kNGk1TEJPbnpwN3N3WURwNHFZ?=
 =?utf-8?B?YXJFSDhkMFFqd0xzcEM0Ny9JQlhxeU5UdU1icnN1WTREcndISGx0UTBXcGFs?=
 =?utf-8?B?Nk9tYzRjVjhRMTVzSWpkbHozZ1ljNE5yK0prZVhET3grbkg1MTVXR0hyU0JI?=
 =?utf-8?Q?2T3eYGjrs9SQH8IAcOU05xN+6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba18161-67f4-4766-ff8f-08dae356e44d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:25:56.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sBkT6E3xT3gwuhXurq8ZZGOo2VqsoruiISx6YYQB7nRXtLXBgNtkoR6myceQ/M7i5iznwKTTFu3wgC9+pAHJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

The hook isn't mode dependent, hence it's misplaced in struct
paging_mode. (Or alternatively I see no reason why the alloc_page() and
free_page() hooks don't also live there.) Move it to struct
paging_domain.

While there rename the hook and HAP's as well as shadow's hook functions
to use singular; I never understood why plural was used. (Renaming in
particular the wrapper would be touching quite a lot of other code.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -235,6 +235,8 @@ struct paging_domain {
      * (used by p2m and log-dirty code for their tries) */
     struct page_info * (*alloc_page)(struct domain *d);
     void (*free_page)(struct domain *d, struct page_info *pg);
+
+    void (*update_paging_mode)(struct vcpu *v);
 };
 
 struct paging_vcpu {
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -140,7 +140,6 @@ struct paging_mode {
 #endif
     void          (*update_cr3            )(struct vcpu *v, int do_locking,
                                             bool noflush);
-    void          (*update_paging_modes   )(struct vcpu *v);
     bool          (*flush_tlb             )(const unsigned long *vcpu_bitmap);
 
     unsigned int guest_levels;
@@ -316,7 +315,7 @@ static inline void paging_update_cr3(str
  * has changed, and when bringing up a VCPU for the first time. */
 static inline void paging_update_paging_modes(struct vcpu *v)
 {
-    paging_get_hostmode(v)->update_paging_modes(v);
+    v->domain->arch.paging.update_paging_mode(v);
 }
 
 #ifdef CONFIG_PV
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -443,6 +443,9 @@ static void hap_destroy_monitor_table(st
 /************************************************/
 /*          HAP DOMAIN LEVEL FUNCTIONS          */
 /************************************************/
+
+static void cf_check hap_update_paging_mode(struct vcpu *v);
+
 void hap_domain_init(struct domain *d)
 {
     static const struct log_dirty_ops hap_ops = {
@@ -453,6 +456,8 @@ void hap_domain_init(struct domain *d)
 
     /* Use HAP logdirty mechanism. */
     paging_log_dirty_init(d, &hap_ops);
+
+    d->arch.paging.update_paging_mode = hap_update_paging_mode;
 }
 
 /* return 0 for success, -errno for failure */
@@ -772,7 +777,7 @@ hap_paging_get_mode(struct vcpu *v)
                                       &hap_paging_protected_mode);
 }
 
-static void cf_check hap_update_paging_modes(struct vcpu *v)
+static void cf_check hap_update_paging_mode(struct vcpu *v)
 {
     struct domain *d = v->domain;
     unsigned long cr3_gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
@@ -842,7 +847,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_real_mode,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_real_mode,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 1
 };
@@ -853,7 +857,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_2_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_2_levels,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 2
 };
@@ -864,7 +867,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_3_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_3_levels,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 3
 };
@@ -875,7 +877,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_4_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_4_levels,
     .update_cr3             = hap_update_cr3,
-    .update_paging_modes    = hap_update_paging_modes,
     .flush_tlb              = flush_tlb,
     .guest_levels           = 4
 };
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -45,6 +45,8 @@ static int cf_check sh_enable_log_dirty(
 static int cf_check sh_disable_log_dirty(struct domain *);
 static void cf_check sh_clean_dirty_bitmap(struct domain *);
 
+static void cf_check shadow_update_paging_mode(struct vcpu *);
+
 /* Set up the shadow-specific parts of a domain struct at start of day.
  * Called for every domain from arch_domain_create() */
 int shadow_domain_init(struct domain *d)
@@ -60,6 +62,8 @@ int shadow_domain_init(struct domain *d)
     /* Use shadow pagetables for log-dirty support */
     paging_log_dirty_init(d, &sh_ops);
 
+    d->arch.paging.update_paging_mode = shadow_update_paging_mode;
+
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     d->arch.paging.shadow.oos_active = 0;
 #endif
@@ -2558,7 +2562,12 @@ static void sh_update_paging_modes(struc
     v->arch.paging.mode->update_cr3(v, 0, false);
 }
 
-void cf_check shadow_update_paging_modes(struct vcpu *v)
+/*
+ * Update all the things that are derived from the guest's CR0/CR3/CR4.
+ * Called to initialize paging structures if the paging mode has changed,
+ * and when bringing up a VCPU for the first time.
+ */
+static void cf_check shadow_update_paging_mode(struct vcpu *v)
 {
     paging_lock(v->domain);
     sh_update_paging_modes(v);
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -4198,7 +4198,6 @@ const struct paging_mode sh_paging_mode
     .gva_to_gfn                    = sh_gva_to_gfn,
 #endif
     .update_cr3                    = sh_update_cr3,
-    .update_paging_modes           = shadow_update_paging_modes,
     .flush_tlb                     = shadow_flush_tlb,
     .guest_levels                  = GUEST_PAGING_LEVELS,
     .shadow.detach_old_tables      = sh_detach_old_tables,
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -18,6 +18,11 @@ static void cf_check _clean_dirty_bitmap
     ASSERT(is_pv_domain(d));
 }
 
+static void cf_check _update_paging_mode(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+
 int shadow_domain_init(struct domain *d)
 {
     static const struct log_dirty_ops sh_none_ops = {
@@ -27,6 +32,9 @@ int shadow_domain_init(struct domain *d)
     };
 
     paging_log_dirty_init(d, &sh_none_ops);
+
+    d->arch.paging.update_paging_mode = _update_paging_mode;
+
     return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
 }
 
@@ -57,11 +65,6 @@ static void cf_check _update_cr3(struct
     ASSERT_UNREACHABLE();
 }
 
-static void cf_check _update_paging_modes(struct vcpu *v)
-{
-    ASSERT_UNREACHABLE();
-}
-
 static const struct paging_mode sh_paging_none = {
     .page_fault                    = _page_fault,
     .invlpg                        = _invlpg,
@@ -69,7 +72,6 @@ static const struct paging_mode sh_pagin
     .gva_to_gfn                    = _gva_to_gfn,
 #endif
     .update_cr3                    = _update_cr3,
-    .update_paging_modes           = _update_paging_modes,
 };
 
 void shadow_vcpu_init(struct vcpu *v)
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -426,11 +426,6 @@ void cf_check sh_write_guest_entry(
 intpte_t cf_check sh_cmpxchg_guest_entry(
     struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn);
 
-/* Update all the things that are derived from the guest's CR0/CR3/CR4.
- * Called to initialize paging structures if the paging mode
- * has changed, and when bringing up a VCPU for the first time. */
-void cf_check shadow_update_paging_modes(struct vcpu *v);
-
 /* Unhook the non-Xen mappings in this top-level shadow mfn.
  * With user_only == 1, unhooks only the user-mode mappings. */
 void shadow_unhook_mappings(struct domain *d, mfn_t smfn, int user_only);


