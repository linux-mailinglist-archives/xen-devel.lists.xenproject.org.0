Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33754675B7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237336.411636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6DW-0007Lx-Ef; Fri, 03 Dec 2021 10:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237336.411636; Fri, 03 Dec 2021 10:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6DW-0007J6-An; Fri, 03 Dec 2021 10:55:02 +0000
Received: by outflank-mailman (input) for mailman id 237336;
 Fri, 03 Dec 2021 10:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6DU-0007J0-A3
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:55:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75253080-5427-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 11:54:59 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-yhIfI2YdOHu5naMKw_zaQg-1; Fri, 03 Dec 2021 11:54:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Fri, 3 Dec
 2021 10:54:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:54:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:312::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 10:54:56 +0000
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
X-Inumbo-ID: 75253080-5427-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638528898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ER/BOQk6TDm0gj9BC3vEDaNIiwfCia7A1Mz5radM/p8=;
	b=gpg/seBcLTmIvVeWM69tiXtuVAbUNM3O3FQwNdjTtip4A5GEObum7KWt0zzZmMahScxMaP
	FHWQVZvWAIk65yWvSTheQbgC/+NprhFnwk73X1rVMvPAi8FDK8/IOPzHw1t9gU5DeFKaIR
	CnaUQqx9YvI0bJ3R7dmNUu3Oset3rF8=
X-MC-Unique: yhIfI2YdOHu5naMKw_zaQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqwy31mDTetDOwkzlIPnvKXxSZQ2EUZj2AHSNLuKQIKmUWrtOGjA/c8mssKgizF+B6bH5TUaXX9voHIKaHGBrgJyDUftdgVUz3uwxI1aI0wC1jIfyIJ4WM0PbctkZZzuGmMB4/mVvp1emPQ2fAnFJslXNQGCaiSZcNXD4LoTet/qy0NO1aDvRr1zs3I20XxZz1MJnu4FMDJSkrzJJZjzQpHktjj5MrmMKhjBjluzKvFaw4bklPxP946BD1EwfS1+G+QIrKsDntX842BDeVhWtAn4+4CSI/nqWCfjJpXhjA3ympXfZkTtMf5zVujkaBcclLDM/U0HW9MxEAXVKgwNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ER/BOQk6TDm0gj9BC3vEDaNIiwfCia7A1Mz5radM/p8=;
 b=SrcIsPO6tDVan5eHf2g7mgA/IHgrL0ixS4RzH29kE/lQC+OFYc1fxMyJapF+erbNaNpyYHB1yu5tc4aoP7b5uWsJyL3DehETkagJDhMudLVuN4FPl05IzkQ3+tqivbXGjuFm9x12ndaUbcU/sS8ac1m1wc43yefVq6fFVZvezGLhNoPjCY0Sldt05+M6a6yIO2fANdqk7lUGDz+h6e0y1qsnHQjrjojZQ5PxHoao7RxTZfvie9SnWj6YOF9aLbK1yLPvKriybt4h/bGRP7mNKyGCRL6xC6AeA3DQPK5NH7veKsbzgb5L33ihSOqKgcwEjczjFokDURypRMx4M16kog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
Date: Fri, 3 Dec 2021 11:54:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3]: EFI: some tidying
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e8c92bb-a2d8-4e65-0f79-08d9b64b57ff
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32931D9F3CA95F2E8F2C542BB36A9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k/KjFXwDqeCcqvQnkw1rX8xtLDrYfDynB+VdB9sWA4xp526xUEvG7pTm0Aaj1tufsaXUGs8MVqyvXK4FpBVJgzBd2f5uGizZvTR/M4b5IAtg9+BedAUglwhdrIfjmZ2BQG3mmhZO0Rx9zd4g7FBx745ZirKKa0IyeIvRfwElFr6JFeiO44gppMY/Jj2r18riU2bX/NkvCUTj7VX6qbQM42UPEcnNF/mNVZSnf5qZN37N1attLn7xl5P5iq1VK02BY9IKLdmRAR/1HEEo5TD2mKf2WIrBAa4A63OhROCdkkZaxIOTV9WUSIwWY8knsffCmCf/vAek77VgClGrPsCouoUCCkIJZjGiE/9VpJBAPWYz2KwRtu2aYZcCkfyRiGtTIbL/1dsI/eM7sPn6X4RtyWs9mtkJLRiBGvaOkl6orKr3x+UjCv50Zg9qVG21BjQbnDFKbIZn7Z+7EFuGPr2IVIDMcdp8w9ZNwEcBFrv0+GwdVfU/JcJmM+CqB+FESNpVrStAg+gLUomm03fJPOSZXVPX6PwV41PZKYGWBSw/LqzjiEvlYNb3T4MPh3QNVAR2ZIdsEPsOt21YTyzIIrN/PX1Hx5zSycYQJmlna1nlegA35T0quokJUAPn6of4BEwY59cy8s0///Nc5diVxRAOAyjmRxyZkNOoa7uCkvSbRmHG2io6ZU+bv4fL/eacI8aITBS7ObF122R2X/ACfjPHxvck5OJzhkH2+eo3KDQ0omv0cVDYL8JcSAuiEaj/f3sa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(186003)(16576012)(54906003)(558084003)(508600001)(8936002)(956004)(6486002)(8676002)(2616005)(6666004)(38100700002)(6916009)(4326008)(316002)(2906002)(66556008)(66476007)(86362001)(36756003)(26005)(31696002)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3lLNDhCS2dqN256VVRrN0NrUDhyaDVTVXpqanFUaWNoeVRxaGh3MlJmdkdV?=
 =?utf-8?B?VHNhRXZ6ZS9SZ0Z1b1lRZ3JpWWI3OFdZQ2ZkUlovbldyUUNhYnJuL2U4Z09w?=
 =?utf-8?B?bDY0Qk5mYzN6ZEtZZ3I4YmJUMC9vdHNCQ2dib3ZZbGxWQzVPb251VEI0YUJ5?=
 =?utf-8?B?TGphNkVtZXBLQnlkSS8xM1F6WkVEbUswdjc2OWs1eGlmcEg1WTdxaG9FT1pD?=
 =?utf-8?B?RDZtR09ibnNXZXloZTRSeHpvcVFVWG9qMWFYVEJJSjBzbUNtbUVlSFZvbnhw?=
 =?utf-8?B?MmFkNXFjU2FrdHpUQ1lXZGJmNFhSMTUxY2Q2MjVTUi9GZ3dvMWZPSTdFUzl6?=
 =?utf-8?B?TDAvS2VmUXR1QlhDTUpGMjd3MExLUkxjQ2hZdW1ZWURuYVhrbVozdjU5YjNW?=
 =?utf-8?B?R2gyTTRZZHIvZHVZb3UvSUJUNjBvM2lrVWI4RlNaZ1RXbjVvMGZnZ3hFU2kv?=
 =?utf-8?B?NUFodHZSNmcvb21GNFJCY3I0VUtzZDNjUE9XMWdGV0ZpVmViMCtlVVVDd1du?=
 =?utf-8?B?a1UxNUhCVVkrdmpScFJDRno0NktRbUsvODV1dXcvTC92SkhZeVFOZnNCODNn?=
 =?utf-8?B?RWFYOHk3MHVaOTl0L0hEN0YwY3NEaFdSaEJTOC93SGlEWmMvUi8rQTVoVXpK?=
 =?utf-8?B?WEx3aVB4bHB3VmhGdGxhTVFmYlQ0T2xXZmszRlVRelpVMUhFLzY0T0RBRnRV?=
 =?utf-8?B?YktpaS8zNzYzTGcyeE5rTXZjL3Y0NjE1WEkxSU1BWFNGOHFjUlQ5RUFpTmNk?=
 =?utf-8?B?ZFJpMkM2U21FblBJSHF1bDQ1WEdWcSt0K242MDJZRTArcGI1K1lvaWpVekJS?=
 =?utf-8?B?WEthSXhzbjBTV25GU0w2OXlpTTJpL1BSalBiVUNLS1piOXNzV2k2cGRudWVV?=
 =?utf-8?B?S1B6V1NjMkNFblJ6SjFFdkFJRTljejFzQ3VCRDRRQ2lZQnA1OGV0VW91UFh1?=
 =?utf-8?B?VlNXbnMxVjZOK1dXbm16SXg2MGszYnFCT280aDNOWmQrVGxjMUt5ZUU4cE92?=
 =?utf-8?B?TldRbDJyejI5TncvMitPYk0wZjFwUnVtS2R4MjFMUHpDZDRXRStlazVmWG9D?=
 =?utf-8?B?ayt3MUtScVI4K0s1Q0dYZTlaNktzOGhyWUhLaTIzK1RuRnQ1V2t2S3Nnd1ox?=
 =?utf-8?B?MWJsMjgvMFVYNFhTRnFQYVZMWDYwUHErc0g5VGcyK0Vnem1HeXpoOXl4UHpw?=
 =?utf-8?B?QWM3TGl1ZUhoUk1zWmpkSVpGZHdyb1p2cTlqT3J0a2VtTWpUL1VjbzdlSGFr?=
 =?utf-8?B?cTVLaHo0QWZGKzJodFBKWFBDY3gyVTVlMy9LRTJhdSttZ1VSM0RlNVNJYTRH?=
 =?utf-8?B?SWZqWnBIVmZvc1RoTTdBenJhNUdmS1RLa3RJQ3QyVHpJUnYyZ0MwaERXWEh2?=
 =?utf-8?B?N0FDbHdKY2Z5b1JIYkJla21kUG9ucW91ZzdPQ0sySzMvMjAvaTg3QjR3M1ox?=
 =?utf-8?B?MWJkREg5MVBENzZ3SU5TU2tXcnJLVDFFOHB1SWo4YTdyK1B6R3EyczEwUHAz?=
 =?utf-8?B?eDBpS29QcXZMT3Vja29halBjalZLbzRSaXNsb2FtRGNZdThGK3haa0VKR3NK?=
 =?utf-8?B?NFQxbElzbW4vWXlibDREQm42OTlBcVo5eEFKU1dMcTJ4M1hCMk94aHVNNzM3?=
 =?utf-8?B?RGRNd0t2NTRRRnNrbXY5UnpKejJmSDVwbGpKS0ZXTFZBdUlrSTRFNlk3Tjlp?=
 =?utf-8?B?ZE1ZZGZYSGNxRG90dXhrUUpFY0dQbGtURFk4dnF2SGNCVlR3SUkveVlaZ1I4?=
 =?utf-8?B?RmF0dnk3eVBUa3RrY3hlWjVibXJMS3NWN1Z5OXVBN2lwenlCRXg2QTVNOE9J?=
 =?utf-8?B?Nzk4YlpwMWcyMzR1Tngzcm1KUGZjdEJLT0xxN0ljRWp4UE1IZ080SHFkUFZv?=
 =?utf-8?B?Z1h0ejZqZE1mOVN6eUd0VDZZa29DblM2T2V5QjcvT2phZVpuRDllU1p6enhm?=
 =?utf-8?B?MHFaSGZYclFTVWkvamw4eFM1NVhaL2ttaUxnSjJiRnNFUHNyVm5zN2tLQTVt?=
 =?utf-8?B?L01tTGV3V2tCbUlxSU5HdFRQdjg5YVowM1FTS1QvUjgwajBjWmg1Q2RNb1pp?=
 =?utf-8?B?N2J1NGgrRXE5RXB1UWxDRkk4SWRmcGlSYmEyWUdCWTFPUWhGYi9RR1Z3aTIx?=
 =?utf-8?B?S3FjZWRSUHdCcVl0K3V3WjN5Q3p6Z0hqOTd5bjRsVFY3R04vN3QyMERrcVRI?=
 =?utf-8?Q?MTM6cEgHvPiPpjgPAZpAO84=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8c92bb-a2d8-4e65-0f79-08d9b64b57ff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:54:56.6590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sa6XsjAZznAZHTekkEoJm1dh6hGmTLSveJkdQiO22TY+WsaltHd5aLud6ifD3UF9Lw1axm7I2o/X96qD4YIgfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

1: move efi-boot.h inclusion point
2: constify EFI_LOADED_IMAGE * function parameters
3: drop copy-in from QueryVariableInfo()'s OUT-only variable bouncing

Jan


