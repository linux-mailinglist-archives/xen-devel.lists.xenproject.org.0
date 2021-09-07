Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A9402847
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180963.327879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZwg-0002hT-CM; Tue, 07 Sep 2021 12:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180963.327879; Tue, 07 Sep 2021 12:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZwg-0002fd-8F; Tue, 07 Sep 2021 12:11:22 +0000
Received: by outflank-mailman (input) for mailman id 180963;
 Tue, 07 Sep 2021 12:11:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZwe-0002fQ-18
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:11:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87c36d05-5fb5-4f85-871f-79f0948e0ee3;
 Tue, 07 Sep 2021 12:11:19 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-aRu3o9_mMI6z_lWB0iMeiQ-2; Tue, 07 Sep 2021 14:11:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6670.eurprd04.prod.outlook.com (2603:10a6:803:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 12:11:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:11:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 12:11:15 +0000
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
X-Inumbo-ID: 87c36d05-5fb5-4f85-871f-79f0948e0ee3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w/4sgXZWL5TyOKqIEB0uUbPnSshL/83p3qgV1ftBS1M=;
	b=G5E0+El9twSdJ4JPdIdcA6T7uJI4xcnrZK5TsXLmAxVPKfRIQkejBObU2Nsl/R9ywrZ4gc
	9YIgDm/IXnIrq48RFo79xmthC05uop5obhm8MOVFToq4iYByQ2b13VxTVeSuEWc5sd3N2q
	growQoEhAbP33xGtkECN4tB1ibE5spg=
X-MC-Unique: aRu3o9_mMI6z_lWB0iMeiQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By2MW81/o1kLuXrOUuM8q6oL3Ze9TE5xrmCWM8vczKO7aSWDhmJFL4M24jRQdjpV91rymu43Qyb6txMna7daDikJY5AKBxfzMV1G7lfA3un0sjyNuzyJLkOteTjvD9p4my5SAmsBMNJy3RTDF8Vwnv1CCAKcTd7Nxk13p/8d7sxUP8fb781Nnsuk7u3tFjAjNDv81uFKDQLy9pU3rIRAV8RfGyYO+nyjWHI0GMsEpVbvNGER4PnG6gCuM2DshNeq2+MT+eofI1D3tkdImsxMsngg8eMGasNmRC0oIK2L2t3b5fqJcl+s9fFp1rmbzxhbexhOzcvwb2I3c1y+o0BISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=w/4sgXZWL5TyOKqIEB0uUbPnSshL/83p3qgV1ftBS1M=;
 b=lHmvz+NiNzSTlSrLOMxEGmfUSa6GiUMaikp6c9ZxF5uOa+1a8WReH4Xgfh1Ce8K68q4U3nLG+dQf6E9yy7lcD3D4tUMeF9bX2GN5KzgIXNyhx8kdljvnADorvItx1U/+/WxiYMrGNxsMyBVnF0YoHmsxkSlh06YnC1+m9cOmaXCFLiujSwxs7uTnhpytwdpUIHGkI4OroIlZgCq22RNf1h1kfWrF8OZbRGGo4RoTniRC7nhSOjnJfhsFp8ErY6s7Bp7Yizb45IEpc6uKGXLZ0yQOv5/fFB4ZqbY1HI0ZWXcaWBy6Kt351euSCasqdQ+Xzsjpsa9INTXZsDkhAFGSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 11/12] xen/pci-swiotlb: reduce visibility of symbols
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <75591cef-95e8-c694-fd11-283800499e4e@suse.com>
Date: Tue, 7 Sep 2021 14:11:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0047.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b96239a-338c-4c83-a97d-08d971f897c1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6670:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66703BB89CF5EC4D02E926BDB3D39@VE1PR04MB6670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c6jtTYYeSeyA8Xs2NV5x4j7yK4F1HAeNdMSka5OVZXiMXj22vesIRzMd4/kz7xRK7qeOeP5IwQFI6EqYyXPILPJwqNnN9lvRsUYihsVtrICJ3zbM1CULB4bbn+ej5gugNzviDieOLUG10NPU525CzdrHB9Xgrwbo12Joo3JrBLxqB8gHVpmbQK0vxxb6cPjGhZ0urjrYSbApUmM7k7nFp5AMrcvFjIb+hlkDfaC2QxwjWRY09Rxt9fd9knGkaE4B6llaNKYoZ36tIFTvt/VH1OjictbFgOMoRLvPL8ItQacZ4fXVBaHkjk6/da31yp8PrArZi29sw5NmtH1Qv3fXg/5Jic9ogCLi0XwMwuCJ4HI9eded5XtvAEoFu5KyaIrQu5qouKAm9LxV2mmQ+lGUSimCnJZEjMuFu2XLFDR2edH+WLeJOfCvoZV8EOHUEK03r9ediEQSxhQKyffIlJAOJIMuVjgoR/w353zN3BtMKfwLK9x+XNASDwCsWwGL3ddIS8rCDvx/NtW1WFM1aiEvxw2+krqkwgO7Pn1CSXPxf8Gdkye/8CrPALf4gobyMbOYx8PydoDPu9QlLS/IYFae+iTqocbHnl1/8jW17dFiv9ccv7V48YjrvuBjLuUMjjXnM2YxeYcRHnR8XiqzKTr1fPU3PIVfTww9K0AE9Mk/af9ur36LKadfKkqxmlzaAu8DbsT4Wcm3ahbZ5WLgLEUZbxADiaUvu44Tgqi8c7OiSsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(31686004)(8676002)(2616005)(316002)(5660300002)(4326008)(8936002)(478600001)(31696002)(66556008)(66476007)(38100700002)(66946007)(54906003)(83380400001)(186003)(86362001)(2906002)(110136005)(6486002)(36756003)(26005)(16576012)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXdSMHNXREh2TFAwUWhyUzc3ZTVJbHFnc0NiMGNwV0RoVFMvTlN5emZUL3k3?=
 =?utf-8?B?VXdNd3JOeXRXdnIvd3FDYkZqclYyWTZ4VmtaYlhueEZ2bHE2Y1Nicm8yWFBZ?=
 =?utf-8?B?czQwNjhOK2plMEpLdUwzSURjVmFZK0JKd1VFOTJPNVliWjlzM1NVUjNsdng3?=
 =?utf-8?B?RVhOc21MeityM0x5WHA5b3NlT1hpanYrblVRNjgvemplbThhWkdDcVVXbjNx?=
 =?utf-8?B?aU1TajBrTjdSWitNVTZhTERCS2tqMVo3ME9jd2ZvQWUzUlVQQS9hVlRvYVhi?=
 =?utf-8?B?ZkkyaFNxOGJQckEyZjlCREQrUm02WnFhQnRLN3prT01NNDlPbWhVK0Nha2M1?=
 =?utf-8?B?aVZudVZMOUQ1TE5PQ0t0bWgxZVpyMjFldmY0OGNEU24weU90K1BBT1V3Wlln?=
 =?utf-8?B?QVhrRGtMZElVcklDVnpIMWJFVmRMK3lxK0JUWDZ4UnBSSUVHR0N1c1UzM2Nq?=
 =?utf-8?B?alFIdjB2VDVOOFpvb0J1ZXdNWFJUTGp4L1ptTXpPU2lEdnEvQkNIbmcxa0I4?=
 =?utf-8?B?VVRTYmM2OVltemhkQ2RXWFZMemtLM1ZnWXh4bm1zWnYwYk1uYzFuSVhsbTJk?=
 =?utf-8?B?OW02NTVXWVpoeTV3YTVRTUlCeTVBZTQ1U3FKMUU0WSs2ZmU1RjR3ZXhPNVpW?=
 =?utf-8?B?bWVzYlhRVUhaZU1lVkR6V1EvZG1KUFptc2tJb1pSaGVtM1ZVZHFtV1RSYkhy?=
 =?utf-8?B?dmlja3gvZENKeXVLTktaMzNMVGI0OU5wbHVnMyt6eHhpMUJjbldxb2M2VUNT?=
 =?utf-8?B?NHJWejIwN0dRcFlKQ0lCRFFMeldpcGZMMEM1Q3BGbE13V3lBTVBEUCt6OHdO?=
 =?utf-8?B?a2hWdm54QTJmdVhZcm4zdURaRjdSSnFkQzFoWm5PeHR3WnFwMG9Ub0Rtd3Rn?=
 =?utf-8?B?Z1ROZmQ1MkZ5SnJORUNuR1Jsb3B1M0thU2tueWRFUWZZQWlQRWU1RlVDUS95?=
 =?utf-8?B?Q0VITDRDRllGaVllNnc2UXVySVFYNStuRFVYa3I0OWkvOW5XT25wb20yU09k?=
 =?utf-8?B?YTd5emxwUHEvSndiL2E2VC9RL3ppZk5iMlBHVnpPRDlPVmMvbnBsekxtbWZB?=
 =?utf-8?B?YU45QjF1em5mSGpzTWVPL0NZSk5uZ1Q1WG80UTVDdEJrOEpCU0huVUs4U2FQ?=
 =?utf-8?B?ZWdadHU5eU5NcitJdnpGQnNVU0NyeE9YWnpzc0o5NjZ0Z2syK1J3ck1Ualh1?=
 =?utf-8?B?ZUV3bXZRamp0RUMwbDRmRUYwSy9XeTFiOFJUSEpkVlBOcEhYZHVQOWc1emdD?=
 =?utf-8?B?Ly8wR1k0YjRnZ2dpbDFodDh0dWc4TFlxNHN3aGx2RVRHOU5VVmF2OEJVZWZp?=
 =?utf-8?B?aXhkYUN4S3dmVkY0c2sxMWpiUUw1b25mbGJRU1Qvd3VZM2FxS0JFblE4Tm5i?=
 =?utf-8?B?RWt1THp6b0Z0Rit3VHZDMHJXUnlVNzZ1NG4zU1ZRbU5GTkk2S0NiaUNVN0Zu?=
 =?utf-8?B?TXVrNWp4dHJ1d2RmSldVMC8zNkZydU1nbEJ3bEtFNmg1ZGJOb2ZLdTlERWs0?=
 =?utf-8?B?UWU4cU15VGIzbjh0ZTJLMi9laXA1Q0dkam5adTFDRlpDTWhpckdCUW5nVjZh?=
 =?utf-8?B?Z3BtUnY3THlDbWVhRzlGRFFpWHd2ZDhXeTNhcjEyYlVMN01MRWVERXIwbmpK?=
 =?utf-8?B?MS9EMHg5MDluUVJQWXBmeDNSVmR5SldLNW5vNTdkenpKWWlRQ05rNlFTTFdE?=
 =?utf-8?B?U3dOSkZMTlM3amxxWDBVL29mMlROYXRSa0NMWHd3WEprak4wL2JwZjZHTEpn?=
 =?utf-8?Q?jztJsKC5v6UJGl1hsCBzl5tLH5sz3/K5EI9w1ma?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b96239a-338c-4c83-a97d-08d971f897c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:11:16.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEfTjpzl4JcI18fHOhFc1nlSIL4QhKp3jrj0zwtijI0hb4Whbz4NLgrnIg4zOSGvgSYcNJGY8iOXwgUlRxDadg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670

xen_swiotlb and pci_xen_swiotlb_init() are only used within the file
defining them, so make them static and remove the stubs. Otoh
pci_xen_swiotlb_detect() has a use (as function pointer) from the main
pci-swiotlb.c file - convert its stub to a #define to NULL.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -3,14 +3,10 @@
 #define _ASM_X86_SWIOTLB_XEN_H
 
 #ifdef CONFIG_SWIOTLB_XEN
-extern int xen_swiotlb;
 extern int __init pci_xen_swiotlb_detect(void);
-extern void __init pci_xen_swiotlb_init(void);
 extern int pci_xen_swiotlb_init_late(void);
 #else
-#define xen_swiotlb (0)
-static inline int __init pci_xen_swiotlb_detect(void) { return 0; }
-static inline void __init pci_xen_swiotlb_init(void) { }
+#define pci_xen_swiotlb_detect NULL
 static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
 #endif
 
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -18,7 +18,7 @@
 #endif
 #include <linux/export.h>
 
-int xen_swiotlb __read_mostly;
+static int xen_swiotlb __read_mostly;
 
 /*
  * pci_xen_swiotlb_detect - set xen_swiotlb to 1 if necessary
@@ -56,7 +56,7 @@ int __init pci_xen_swiotlb_detect(void)
 	return xen_swiotlb;
 }
 
-void __init pci_xen_swiotlb_init(void)
+static void __init pci_xen_swiotlb_init(void)
 {
 	if (xen_swiotlb) {
 		xen_swiotlb_init_early();


