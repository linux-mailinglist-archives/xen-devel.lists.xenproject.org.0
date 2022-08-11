Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6C58FAF4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384436.619816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5nn-0007rD-I8; Thu, 11 Aug 2022 10:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384436.619816; Thu, 11 Aug 2022 10:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5nn-0007mi-FE; Thu, 11 Aug 2022 10:52:35 +0000
Received: by outflank-mailman (input) for mailman id 384436;
 Thu, 11 Aug 2022 10:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM5nl-0006fh-UB
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:52:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2074.outbound.protection.outlook.com [40.107.104.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3c3253c-1963-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 12:52:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 10:52:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 10:52:31 +0000
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
X-Inumbo-ID: b3c3253c-1963-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFTHwFhqaQc0LOo0OQJQqWGAbQI3CilsU1n8TnS5mEK7w7V3J8Gj3gqL/W6aDzA5j/3qtdhRtopeXNPNfbLiANndaNo61EIror9rfMgBLjZP0g0eAGIG5FWbjyOCX/syVR0QfaCR164NxotNR/rqMsBys2c7HmxcvtZ+UeRqJXBiX1vTJTDfhBFYGOfMHweOQqDC8vjfA0vEo/o68/QEJrLTnCD1aZPZaue0iR/R5wdqEUBcoTd+I5ON2biJSTNJV9fOY7jS1RZDQttFhl5Zj+JbD7OjWA1oFjB2LpT0nOa3b3GyrdW2lNaSN2cVJsMmsY/X4X7EDrmMj2hqowuMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltM3LnypLdKXezODmgDlDlM4OKAb8fvviVm22POdPMg=;
 b=CQ2XSET7gVPo/oIFb1yHBjvE+GspoLw+IGkaFxPOgYEl9CNgEDhfYXwErcjo4AiIqGOo4R3VWHqc0pJ93dB/JkhtG/pLdFyXLV2ndfbvp+NS++MYwTD34Y4MlFzVggD1pdBD/wX0Zc2b+RQVP8DXuUEkb1gi4cbCVImEc4uCrjyMlJI5cVvPUCkxgI75Jf+SDkufjNIZgINTBSPulGhrOnFs0Di7y5y5DikHKtozj7eOauwHY0cXGO5ESigcPvECHuxqu9NMh5BMWalO9JECeuVkO0J5z5+FI+EtfqGretewRbG0P1q+zm1WuhNmCWTILhddGpRxIRiz+fNNBcEI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltM3LnypLdKXezODmgDlDlM4OKAb8fvviVm22POdPMg=;
 b=dMymrbZ2GSPT4nrPPdoHSZHcIp64TA9axAI4mZ6Lm0wqy2Nr07w/9vvwvCFFd05qtqBVOM7Wc43Y8WFIbQZSMZFKuMuWBBtd7ls+Wqm0o/2vTq6TBQG2tB26ajNcRzwKXjernBCvmtkhCfRbhVn/GqHrHzLt9FSlmwFipOxt6CBR/YZsiYW3QKv/Ch34YOVGDNX3YPlV4rakykbyq+rqj4iUh/bErWn6geM3aggaLG/q8MfqiI12ZaAma8qoPQ3S//NUdaVTdpc+VTPXywn83GMZkATSIFegLsfxXqGynXTx435Mv8kpmWN8A4bcFyTSDzUInox9PjJAyLOEdQMo8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8a5294a-6869-121b-cd67-0740e6330769@suse.com>
Date: Thu, 11 Aug 2022 12:52:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v2 3/3] PCI: bring pci_get_real_pdev() in line with
 pci_get_pdev()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
In-Reply-To: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dc5a16a-31d2-48f6-a134-08da7b879741
X-MS-TrafficTypeDiagnostic: AM7PR04MB6807:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oo7zdffxuReRdXPcoPn/QbjptdR3cs6nm8D+RLKXlycWJfPx/s8MpJwfbxbEBqYgkOHOsjDz+dFqN7mlYMiCkMaxRAGKcVyuArZrfQ/mKrgR8C/NjWKQe1UBremSHwmiRwuWtNc+EbuT2t5BodN7pQWVkraLECwQrh8aL8QPIovYrFhWEs3QhaBlHCyBnEzw2X2c7cSI+CwPvEEIwQJxW/sX/F89cxfyuSPw9R+lwuAY0axcdoYpCIzJaEziCTAhDT/UmrTJA2a1KXuHklUSO8PXTdu553h1kbWcZGlgj7OmrLG4vxRbKM5GABMWAfuP5FI0YKBFenmD+YMEzWef4h0dkdnx1PmshGW9vGA+Ddyhpj5YfqcrbfqlwSVztOaY4NxbWEzUL9yNIzE/R7B40HOkIQyjhAw9jm9h53eVEPyOzymE0oSOHjA20T0P13oTXW00y3nnk5mxgBc0vVSdsaM5lQXvRj4veI1OZYWML6EM9BC1DcK8ODmhi6jyiUIX9+FpTS0LHb2S3Pz+uBV3FArWPeoXliCPPvbkJnZnxN5HlLDHO1530pYZDgI5t9bWRWyuIy+z4WsYcOjO2eEm6pWk1il5jqGhJjtfDptCuHP8TyFIrdloUDvJMni1+Cr2FXSnmeZrPLK/QtV8/C3oSX0luS9O1LovCwr678sxH3bb4PLwJh+3rv51Cb/weHyO+yTo/BZ869aT21rk3rjOqpqUw5VTp0QIBG4Inm+dGY8FW0CnyYcy3RTnyNB9JhEM9VVFFmvhwtffWKfkhBLGqNpHRH4eykx6BuMfYTZFgyq5YzGzwYzZTYFFM7fVxujhj3CP3peR1WzmmX5aTLZ3Qw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(376002)(39860400002)(366004)(26005)(6916009)(6486002)(316002)(41300700001)(54906003)(478600001)(4326008)(2906002)(66556008)(8676002)(66946007)(66476007)(8936002)(38100700002)(5660300002)(31686004)(36756003)(31696002)(86362001)(2616005)(186003)(6506007)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkl2NWZ6Yk4wN3pBU1pvT29wc0VWS24wcjhwQSt0Wmo0M3RuejgxUVpJNWIz?=
 =?utf-8?B?elhsVUprZzBzc3ZQR2piVEdHNUJPKzJRTDlZZndIbjBSSFhYMkptS2RkZnVJ?=
 =?utf-8?B?MkdyTGdWb1pjTjBrRmZUaVVPWURkWSswMFRoMDZjZUovUnR4R2RpMkFzeDQ1?=
 =?utf-8?B?dlJJRzYxdkJZd0ZwZGtyYlE2KzZtemFVVUlNQjJUVlB4TU1tV1ZsckFRNk5S?=
 =?utf-8?B?TndBVXdWTnNFK29vWWgzNXM3M3JQbGoxdGNkN1cxVHcyQVNPcFI0UG1hc3Y2?=
 =?utf-8?B?U1ErODdlUitPbmlZem1CTGl5MDdIdlBiUWdoZjNnMXlRZnF4aHhTWmMxV1RL?=
 =?utf-8?B?REdFN1pJaUxwajdSQ2dFeFFzbU0rcStQZVcvVGlLemFiemc5V2hHR2VVZWE1?=
 =?utf-8?B?VVFKU2dxWkNaL3JkMzE4R2cwUTN5Q3pWaUhMK1NGSTlLMFV5Wms3WThDMW9L?=
 =?utf-8?B?Tkg5UHVPRGVwdnc2VWp3Tjdvay9xczVmUmU1TlJvVmY0L0NYMGRBcHZ2elcz?=
 =?utf-8?B?TW9icWF2VituejVPcFR6QmwxU2dYclQzUDROVkVDZDZOdGVHSkxCbWdwUG4y?=
 =?utf-8?B?aWZQenN5UmpzNE5PVXRXVmlJU1NKanlxZjR1TDRnWVBScDEyMFJkR3R4ZldT?=
 =?utf-8?B?ZG5mM3J6MHZUenZ3N09FZ3RvcnhDd3ZNYnJGbTdPcUordFVTMnc3VUY2dzkz?=
 =?utf-8?B?UkcvNTRkbjdkQ3YvdGtvTTgzemVORzlCYkRlWHM2SFl1NkJpbjVWcGk3dFRH?=
 =?utf-8?B?ODhmZHZnZVBWbXFjdjViTGRNUGp3NHpsRFN1dVljNXc0cWxOUllHSHZwUTNK?=
 =?utf-8?B?MXhObVkvTWkzZVZIQVJXTVNQMm9KcEZxejVLejhDQ1VhU1ZFWndWUkFQMzBG?=
 =?utf-8?B?SmxCWlBGVnNHMjRjcjRhNEFSOEFpQjN3Tm51Sy8yeml4Zzk4UWxjMStMTVc4?=
 =?utf-8?B?YU1ONDloNVhySWdMMHpMMFVPZ0lWbjdsZHQ5d3RHVy90SUgyb3pUSEZkRjBv?=
 =?utf-8?B?ZnJEZDlnRFA3TW1xbGZXWUhPMnNTZmI5QXR6bmpBeXBCZUczTnlUdXg4dllh?=
 =?utf-8?B?T0dBSjcrZGI4c2MrWXBxSWpQVkZyN0dqQkRwRlRpRjV4cjYzUXFhWUNnejVy?=
 =?utf-8?B?OS9hZ1ZTZzA4b2RlK1A1a3hkSUVqemNzUTZGcnFkV0lzTDJrRVBSNEl5RUs0?=
 =?utf-8?B?THJyVWZTQU8zNkNsY2R6SllKL3drNTRYNmVqZGhrdEhKc2syOW5xWUd1bUZk?=
 =?utf-8?B?Uml2QnNua1I0ZVo2Z2JVbXRISHhDeDhzUWQwNVVYOERzNmZLNks2bElHM1Zx?=
 =?utf-8?B?L1c3aUgvNDh2bHJnL1hUU0tYSERRbVRaOGh0UXFnZlN6ZDkySWJDL3JPTy8w?=
 =?utf-8?B?T3Z1VkQ0UENjMHVoYjl1YVVjT1poMmpRdVFnT2Z4S1dVelJJUDJ6VDBWUGZB?=
 =?utf-8?B?WlFqeE0ydWxqM2JzN3FDczFUQllNQWtjeFpzNEc2aFJrRkZDbmlwbkFqT05C?=
 =?utf-8?B?SVVLaUg0RWFNbmFZeVpvSHd1RFVQZGZPWGxnUHJhYVJwRHRiVzdmd2dBNjJG?=
 =?utf-8?B?MzR1YU1YdGpBMGV1Nld3RnNUUXRXdGQvK2huZkQyY2tkTkcvVlNPNUFhQy9p?=
 =?utf-8?B?bXdKRldJYzNabWp2QWNJeE51cGJDeVJld0Z4VEZBaGUwL3ovcVRlTDUvVGNJ?=
 =?utf-8?B?cE96Q3F4bXNjRkxUNEpzMU1UWUdSR3pEL0lSSXFCbjcxa3VjRmtlZGZ3RGdx?=
 =?utf-8?B?d284MytMT09HVTQzcFloOWl4eDJGSTdiTDZhQkFPM2tuaWk1U1AzMWM1MWM1?=
 =?utf-8?B?SGc2UC9Ycm9reSttaXpBRStSZlhqS0xoV2dIZFA5amRLc2NUTUFhQzhyQS9z?=
 =?utf-8?B?Umg3K2UyQzFlQkczTWJ4R0hNeHhuOWdVQkdMNTMxTVZlNk5tWGJVRXJRU0ZV?=
 =?utf-8?B?c3FqYUdDY1dWRDhUZWpkN2tTZGx0Y2dWWWZTbSswVmFMcm0rM2VFWXZZWXl1?=
 =?utf-8?B?ZmFlVGgzNUV0N0VNbUZZbkY2cUt5TERlY0k3dUlvbzFnMG1Jb1JZeExSNytr?=
 =?utf-8?B?OWZlYmJyQlNOdG5aaHgyMTBPWEtzd1N0V01zY3dKWXJVUkR6R2VwU096ZHBH?=
 =?utf-8?Q?dRLlAZCJH1R6zBAD7YFcGh2/h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc5a16a-31d2-48f6-a134-08da7b879741
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:52:31.5902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VRuiVjU3fep6fBKkqRCL/dputB/ZMAvg60dd3+c1Hb20m0MiJV4Jdr3gnACr6AGmftjUz5NL4dfDOOgRsdDog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807

Fold the three parameters into a single pci_sbdf_t one.

No functional change intended, despite the "(8 - stride)" ->
"stride" replacement (not really sure why it was written the more
complicated way originally).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -639,8 +639,7 @@ static void cf_check parse_ppr_log_entry
     struct pci_dev *pdev;
 
     pcidevs_lock();
-    pdev = pci_get_real_pdev(iommu->seg, PCI_BUS(device_id),
-                             PCI_DEVFN(device_id));
+    pdev = pci_get_real_pdev(PCI_SBDF(iommu->seg, device_id));
     pcidevs_unlock();
 
     if ( pdev )
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -576,20 +576,18 @@ int __init pci_ro_device(int seg, int bu
     return 0;
 }
 
-struct pci_dev *pci_get_real_pdev(int seg, int bus, int devfn)
+struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;
     int stride;
 
-    if ( seg < 0 || bus < 0 || devfn < 0 )
-        return NULL;
-
-    for ( pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn)), stride = 4;
+    for ( pdev = pci_get_pdev(NULL, sbdf), stride = 4;
           !pdev && stride; stride >>= 1 )
     {
-        if ( !(devfn & (8 - stride)) )
+        if ( !(sbdf.devfn & stride) )
             continue;
-        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn & ~(8 - stride)));
+        sbdf.devfn &= ~stride;
+        pdev = pci_get_pdev(NULL, sbdf);
         if ( pdev && stride != pdev->phantom_stride )
             pdev = NULL;
     }
@@ -1074,7 +1072,7 @@ void pci_check_disable_device(u16 seg, u
     u16 cword;
 
     pcidevs_lock();
-    pdev = pci_get_real_pdev(seg, bus, devfn);
+    pdev = pci_get_real_pdev(PCI_SBDF(seg, bus, devfn));
     if ( pdev )
     {
         if ( now < pdev->fault.time ||
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -178,7 +178,7 @@ int pci_remove_device(u16 seg, u8 bus, u
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
-struct pci_dev *pci_get_real_pdev(int seg, int bus, int devfn);
+struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
 
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);


