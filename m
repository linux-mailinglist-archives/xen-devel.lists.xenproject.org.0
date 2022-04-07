Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7914F8267
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300867.513317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTgC-0001E2-7E; Thu, 07 Apr 2022 15:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300867.513317; Thu, 07 Apr 2022 15:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTgC-0001Au-45; Thu, 07 Apr 2022 15:04:12 +0000
Received: by outflank-mailman (input) for mailman id 300867;
 Thu, 07 Apr 2022 15:04:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncTg9-0001Ao-NY
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:04:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f95b85f9-b683-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 17:04:08 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-QBmmBVfaNqWFMzeG0ggKgg-1; Thu, 07 Apr 2022 17:04:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5175.eurprd04.prod.outlook.com (2603:10a6:20b:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 15:04:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 15:04:06 +0000
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
X-Inumbo-ID: f95b85f9-b683-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649343848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jnqZVrwb0NaHLt4TFQFuycfDG5MtXpUoN1vga+mT/TI=;
	b=kKjl1GQ8WhKJ67h3CHP4eUVY2aGFSmIPqVEKeMERcYhOe/dxc3H8sV28dXd/5NxpMw6jtx
	4WvT655MHodlgXt0EXhcXruOfDzavt9XpLHWbdLkhx+Wk59ImbXxo7vxD9Ntktr6zA5mje
	jItNeWRiDJG+vuEYhbh6SkUPBX2uUqE=
X-MC-Unique: QBmmBVfaNqWFMzeG0ggKgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ctd5KEB8eG+/JwkDf9kHU8c9fQVPd0LtEwkSBtn0xoAe1OSruBKVpiC3bSiLml7A2jPuRLFRD773PnWQUuO0wSyTSHTcfvl0QMYU8OzlXMkzH9kIGYQBUT2e2o29IF4ShlIVfsLDyG733Cu2p9pmqq/eTe2xIu8Qvv+TnpmV1P/nOh5zh3GCIznAQdCL4xFxrwvRDNOSuQQFg4wcBK0hOicfsxbcsp/0CfBtXwLxKXOJBMmeXeEUVLOG14gAX/gT75KGuvpOkmlcOkvv0szHC6bOGi+gdGPWURb0Tq+lRcu3BpDFwt0E+mBi/2DIzTQPSIp/SUYtn/YYMf50+ziuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnqZVrwb0NaHLt4TFQFuycfDG5MtXpUoN1vga+mT/TI=;
 b=fpuKatJ8mjRr6S89zgKLMY6LEdEpy+vnganUa6SuNOUOZXrJZHHyx7WYGp8wytQ/AfQN4t2N/HnKAk3GktUcdB4X+/3UtM6xtUBUHHJbwQnZlxXXEBG7YnQLne9D4M90KJFYIOaffbhX8plfYsFWWmzoHawN3vLNQRgMGmR9UjIVtRC6h8bpc9I2S+jG3lR9UNQQW+UefWhl1OdRflhstkOXg73LS7aTR3lLXLqB3fon/OUoiMKZ6BYdd3TH5t+rLnFS/B0qrt5kGLch1B7RNIIV6Q3KYwH00GKYfgwlS5u69AMpWSGYVjdL82PlGulpFZWOQzI2vvyZS2sEdMEdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36f65270-8807-323f-c1bd-d14dc742ee74@suse.com>
Date: Thu, 7 Apr 2022 17:04:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4.14] vPCI: replace %pp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0420552-44b1-4599-697f-08da18a7dc48
X-MS-TrafficTypeDiagnostic: AM6PR04MB5175:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB51752BAB0203547A10348716B3E69@AM6PR04MB5175.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0iPuvNZGeZOHarYgmVi67ImqGdZKB/EWdOjasYaCG3/ihWD6gwBkmuKxap2MktInWODRbrNsnn6zIX0HlmPYh5cZlokcUMxlqcvX4VioSIRbyxIgsPktIxp0Oo78oIShalJ3fn13CUIeYAKJLBnlcvXyUKUrT/LsHsCJDW6xC3vjxwKbY9+7cc6e6jF4KYBCobSrdW6wsifDatTKE2uXuEJ23L2bn5hR0iUJWGUsoigsyIJSSSg16yRwAFHcDJKK0N4gTmQWZ/ZtjDQ4bjf86BJr1ELCXQw4ctjYMbw8TcNQAHWUPM9afvkzkJQ6hC5Oc223/Rt2KzUg8VnDpooqk/V+2P8LmRCcalAP4mdKfDZS1dr25kVZ1HyJnNhmyceYAIiyWChwR2omnRKuMZX2i3G2CIABkPU9lM4l/LR2pNIysM74eVsmTzB1tyqZTAgtSkVvJDzj23cbaVbOX0tuY0V7vCMAKoFomBhJZGzBboV8Rg5zhTP0k8HVnSO94c9cnnUmTDHZr3NcrPb2Wd/Rup6khBsdEY1Ig8yxg2PApGQ2ibJ++kVaAC83TTnqUYmP+7GKjhpr8sYqvcpxMgAeOI/ajeHjtlaEOFV0dgY+xYzgJ//HrB3xqfT1w7zudTQ+F0+CSXUodaqlkfKHKrBBtr2KT0M8dUiVMRPPAfzYQnkgDHh5ndilEjXrH+vSiKK3BLfQ34u5Hf6QB0zuhuNaSB+PlFLrFUxOD0GhQJvE30IlCO6+zEKpX6HbwpcPNAiP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(316002)(38100700002)(66946007)(66556008)(66476007)(4326008)(8676002)(86362001)(83380400001)(31696002)(6512007)(6916009)(4744005)(508600001)(36756003)(186003)(2906002)(31686004)(2616005)(6486002)(8936002)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NThmUG5HSm9jbzJndHkvNmh1YWYrNHVIVGlhZlhvL0ZkdEFvOEhwejkyQnBJ?=
 =?utf-8?B?OEpHak40SmZiMVAvV094TUVWcFI3dE13ZEF5eW93RTNVNms5UEtkdEptRXZ3?=
 =?utf-8?B?YWwra1pqOWFGbERycXo0QXk1WGVucUN5bkR3YWUraTVmUW05ajMrNjlFYmpD?=
 =?utf-8?B?NFdENytEWDFEazA1b0FZWExxWU1scEhyTTdxeThZL2NnQVV3b1N5OWR2UTIv?=
 =?utf-8?B?M212RTl1bURDUkMyVWFDN1oxYW41Zmt6N0xXVm5RcURQQ2JmVlJRQk1vUEF2?=
 =?utf-8?B?cExvcWg5aGgvY1ZXMHphdzJBc1NKVWNFcnNZVytFQ0pUOVp5VXY2RHF0WHpv?=
 =?utf-8?B?RGdoVzd6M201cnhjSWxHRklPWS96MWNKRFNtb1N6QnR4Zi8vcW1sV3EvT2Fs?=
 =?utf-8?B?WGJtV3lHVEFTRVcyVjVtWks3Q0FkSWhRSG9yc1VMaUc3Y0MyZmNFb1V2Tktt?=
 =?utf-8?B?cmpLbkViajNMcjYzQlB2TTR1bkc0a2p0ZUpIMm9qYlRoclZVZGpna1NObEtQ?=
 =?utf-8?B?c1pJRGlyMS96K2p3Y044UGxrZ0lJam9RcjJVczU3L0luNENHdmF2UG1oS0Ew?=
 =?utf-8?B?OGRwU0RGLzcyWHdGNjJ1UVhIMUlyS0h3bWV5ZmFKWVgzQk81N0RKYUZrMU9M?=
 =?utf-8?B?YW02M01kNzB5OEpydWtod2RhcGNCRHJ2dVlNcXg4TDI5Rkp5M1pEMjU2Y0ta?=
 =?utf-8?B?eVNWT29LTWxna1pVR2F5N3dOZzI3eWZoSzN4S0EwRWZUdmNyeW1IWTJwZlRa?=
 =?utf-8?B?OGJKTnR4WG05bnAwMGx1Vk4wM3ZPWmRPZzQ3NGx5aytEUE5UVGt0Q2JTV3E4?=
 =?utf-8?B?V2Y5YjVaSi9paFFEQkl3SzdDV1Y1WWNLSktUQW9wRzJydlhGcjVPVlFTMVow?=
 =?utf-8?B?dHJ3TXA5MWtMbTF4MmlJTXd6TTY4MXBCTWpTdnY3MW5CZHgvTC9zV0tjT1RY?=
 =?utf-8?B?Q0tCUUNxWGtxVXVFNWVqdGdLeHR5WEVFbWlud1FWRER6cm1XTUZBM0tsUmFK?=
 =?utf-8?B?ajZEcTJRdFZ4UmJybHVWME9WV25VNnRRVHg5VjZHc0RPV3FrSlJWU1Qrb2RG?=
 =?utf-8?B?VTZnWFdIRmxPMWJ5dU56bk1HNk5admdkRnBnRUlkcExKL0wwUy9kUE9DWUNW?=
 =?utf-8?B?WVU1eVNSd3pVR0MxWG9VVXdDUVE1d0FyTWNEcEV5TkY1UnBObkJLYWFsQjBp?=
 =?utf-8?B?V2d1cXdjWWk2djd2M25DVTRIbFNVRHhmY2taWGkxTkFJcEhPVjlKbFhlRUVQ?=
 =?utf-8?B?SUJmQzI3UjhKUi8xdG5Kbmd4MnpQQlJWNHB0VDdEUmRDaDJwejYxb3p2RU0z?=
 =?utf-8?B?L0dRdU9rYjBnNHE3VE9aSElFN1dYbndHVDlBQ1BGdlZ1eCtwVVZJQm9qdDU5?=
 =?utf-8?B?TGJEelkxcXdRRm1PUldZbHcwM3FUVHpMMnlpZW9ZTGR4RkdjaUlULzZUMzRP?=
 =?utf-8?B?cFc3MW55RHdmanBQSU9Qb0hETkRoREdpM2JNemdFazlSL3Z3L2dTS2ZZMnRU?=
 =?utf-8?B?UjhMaVlpeVlrYndqb2huWlU1dUsxNkZudERhQUk4TzhBRzlpNGpwVFRQVHoz?=
 =?utf-8?B?OXpsUWFzamVhUHdFRkMyTkhPNTdMSWhia2hoV1h4QkVEVTVMeXFML2l2dGdS?=
 =?utf-8?B?dkZKNThNejV5cFdaRXNRNDl0V1ZSb2hQTHpBWnZyM0VNanBtRm5keHdET1Uz?=
 =?utf-8?B?cUoyOUlrZ2VRVXdwSVVjeWJFMlpPbWpETXdrWTVxV0g2N1lFL1NVQk9TcnBr?=
 =?utf-8?B?azlZL1RZdUF4Z05uQlBERGRPSjU3L3VnNE8xNnZoaWp0eFhkRWl3azlscTdF?=
 =?utf-8?B?c3YxWkcxRXNLb3pWWlNBRUE4dEJuRDloQlJPQW5FNnJubkdySkZBcC9EUlR5?=
 =?utf-8?B?V0ZsZXcraFNkSmhXOW1UQVJCUmRVeEhDY25pbmxIRjVVd0hwS25lWDJQRDVm?=
 =?utf-8?B?aDk3dDNxcHlibTdVSlhOdlB3cmJ0SVlTSDVpdk9FNDlCYlVLb0svTnpTQmpi?=
 =?utf-8?B?aFhqOW03NXArWHd3RFB5V3BiWURobGJGTXVhdTc4dnlxMDN6MFl5cy83S2x1?=
 =?utf-8?B?aVAvNDJJem45TFF6YW5pTy9rTGNRRzYyaWNJbkNuU1NYKzRTOEw0THBHMGFj?=
 =?utf-8?B?cmZWRDZwTzF1NmRDWUdmeXBPZzFvL09FMFNmOVc1Y3YzY1lhVFhqL0FEUzA3?=
 =?utf-8?B?UXc1ZG1yOVk0L3hqWlljZGRFeUVhenJEOGFvU0M0Uksxa2p1Nm01Zk1hNEJ6?=
 =?utf-8?B?TGZxMHNlRmpxWlZocnpYRUQ3VVJTTmRuRlVHWVZ4cXk3cmZNMEcyVWlzR2x6?=
 =?utf-8?B?emFDOWlTMHUwS0ZoVTk2YXFaWmFBQ3plSldpb0VSV2pXUi9tNXBEdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0420552-44b1-4599-697f-08da18a7dc48
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 15:04:06.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQSvxwkFYST41l9VWqEyFLUqp5Aq864bjtFqwJpB7nZQdI18jC4QREJLfU7u8G0Q0fGygNBJ7Diq3+H8R8Z2yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5175

4.14 doesn't know of this format specifier extension yet.

Fixes: 47188b2fdcc6 ("vpci/msix: fix PBA accesses")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -258,8 +258,9 @@ static int msix_read(struct vcpu *v, uns
         if ( !pba )
         {
             gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, report all pending\n",
-                    msix->pdev);
+                    "%04x:%02x:%02x.%u: unable to map MSI-X PBA, report all pending\n",
+                    msix->pdev->seg, msix->pdev->bus, PCI_SLOT(msix->pdev->devfn),
+                    PCI_FUNC(msix->pdev->devfn));
             return X86EMUL_OKAY;
         }
 
@@ -342,8 +343,10 @@ static int msix_write(struct vcpu *v, un
             {
                 /* Unable to map the PBA, ignore write. */
                 gprintk(XENLOG_WARNING,
-                        "%pp: unable to map MSI-X PBA, write ignored\n",
-                        msix->pdev);
+                        "%04x:%02x:%02x.%u: unable to map MSI-X PBA, write ignored\n",
+                        msix->pdev->seg, msix->pdev->bus,
+                        PCI_SLOT(msix->pdev->devfn),
+                        PCI_FUNC(msix->pdev->devfn));
                 return X86EMUL_OKAY;
             }
 


