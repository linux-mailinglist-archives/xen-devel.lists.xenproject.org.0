Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CFF4674C9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237281.411512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5o6-00007u-DD; Fri, 03 Dec 2021 10:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237281.411512; Fri, 03 Dec 2021 10:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5o6-0008Vi-9P; Fri, 03 Dec 2021 10:28:46 +0000
Received: by outflank-mailman (input) for mailman id 237281;
 Fri, 03 Dec 2021 10:28:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt5o3-0008K0-Oi
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:28:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9e6582f-5423-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 11:28:43 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-ww_8QyEVN3Oq6BCyi27G-Q-1; Fri, 03 Dec 2021 11:28:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 10:28:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:28:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:20b:2e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 10:28:40 +0000
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
X-Inumbo-ID: c9e6582f-5423-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638527322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zQPfrq5PnLPIcrr5GCqLB0gNS8JjF4R/bwJtL4gdSxc=;
	b=TdmAYv92GkFn1eaZNF5YgXvEJnHR6tFqibqoyOX47zOy/93dtQJD3eQ+6vYLaHiGWce2nk
	SmYYmHMx2rYB81yXZ+JFpCK8lgDFJIPORnnFiEwCZop63ORIal0EiDwuVsk6564x7dpXFk
	ZfhTPeTeGwZQVDFFoetam5gFAkwI6i8=
X-MC-Unique: ww_8QyEVN3Oq6BCyi27G-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gE9jq2vvdl7F6GK5ulA56fuPSNxAuVbqdu/jP7NHQ173fH/5GWZQUf2pCd0zYa2TowfBlMNpEUiDvn/USv/zDIqGow3ppDtKw5lukpltDCYK7zi4M4yVvD8uPSV5V6oethEO1OstPBxr0f62awO4AbYvQeWx1z0pwSCkHOdAStjvwxaX+3/4O/ddUU2d9pvGdhqSyILB1L3/1OJ8FPM0GtSYN8ZgZsnJ4SHn3lQEi6YkPcmCKBmf1jt3usvWi+12SyZZ/ZG+vOjcexMXq3Gr6QWxIGGbxgokf784fMFDjQHj9fbWhQLx5KmSl9wyu708yBzX785dbkChJ9gRG/LM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQPfrq5PnLPIcrr5GCqLB0gNS8JjF4R/bwJtL4gdSxc=;
 b=Vjc0dcz3HyuKbGmu/tlby0RuLXfDVMO6kRqRhfIhigxJbTbkOTwAXhY5sawN74mZj8zdeTTN0Ct0ksPkOICCdNWsyCHQ7bhBkwl0CVphr2Xx4pd93tpzvBjeHUvpG1XzLyvaufScNSqYIV70hKQQ6Kaz4y0to3ndAdk8I7BsCj87j9JxTmJj67zhqWRXV7AKvKYaqwZD502N6fmCpVciLlAzBkT9ND1xFxPfcc+1Odr5+0m/oKhfR/vEzE9zNz6lNUCqNV/yE5aUlJpo+0dcb+IDeh7PG0OB4ABV+ciUlRo6rrqlLtNfh7liGprnsC/JxtWiEQ5t9sfdFJ6lJIER7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05eeb76d-3aed-f543-f0c0-dcfe4e2bcb6e@suse.com>
Date: Fri, 3 Dec 2021 11:28:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] x86/PVH: permit more physdevop-s to be used by Dom0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf500c7e-74b8-4747-69cb-08d9b647acbe
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352430B05CF16C5DAF1F904B36A9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kKr9mKhb/IcvUis49SnYvGKdG8ym+wUFiUL1MHe5ss2jZsCIbE5zXN6OTgoMOY+q338JnTyvKoNEU9Dj7K1w6K+0JtsFIc3hE7Ghye/aGEPrUmK5+4KeogsI+h5+D8nphcoIvyIMx3kq9rwZC4XPuVD1bVNqpkLzC2ZSX/U2gGYxAt1zFo1LBBQWmF41I8TGq2FD7B40iIVPpEaVO8ULWGAZSJoUAfFOmYix0oQ7ne+xb2jfdTbTSRlkk8Uoo3wEi6d6XLs34d5RB1UOpM7KZhc/EMmHoHvN0orSI3+mJa+9Z27MfQn5IGHs+fnEC2PDbYANIcx8phgImi9WxSzO9XlRPkMeMPyYAg4kzBT3JtKduyCRUv6O12qt8w57yXdDMl6C5+jpv0sccvBusr1Kv/pS2Z0tthL3Y9tgSygLK+iqVFzu7gr/rKOsYdMuwU6tBz8PftQqHO4iEi5sqhAt7iujb6FhMFNIXJ4P7ntSsWf95xwgIvgfy5+gmYlJpBBV7Wr7WSI0lnT3M/z/h5xImYozDbYAHcSfQYQqAgCW8FMghbv+XgsBXF5WrPt0vOZwcSLF+aE1WNnNK5ZcMmNibErN/QIH7hjEgz3D67iO3GuCVXVY1GzjpTuC5nuRydwrDNC+JljgKjo2rJhau3ltwMFWfxSKt+sJbPOlYN8duFgwpon6IB14Emqy8cTDmYjZvHrZBvAVBW6RQ948f5dXi6AtF5/lJlZP8sjxrufZAY6+I+gQKaIFtvTevYCYHLK/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(2906002)(31696002)(31686004)(956004)(8936002)(508600001)(36756003)(54906003)(86362001)(16576012)(316002)(26005)(186003)(83380400001)(38100700002)(66556008)(66946007)(5660300002)(66476007)(8676002)(4744005)(6916009)(6486002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzFDNVJrb2FSYzdrcVNxeldXdmVjYlhrT3ZHVlZjV1ZvOHpZYnVEK3ZJQS9Z?=
 =?utf-8?B?MStYeVVEOE5pZDNsNGtRR0hqRjVlMkw0SG5NOUUxak1KeXRpWTFSa2g0NVlo?=
 =?utf-8?B?enpKcE5wM3B6cXJ5TmhsVDQreGxIQjN5MTNGQXFEaFdOUzI5ZXEyTzhnSTAw?=
 =?utf-8?B?ZXdRYkpmY1lhKzY0RU5nOXJRSjhuZWZla3lqQnc3a3B4cE5qUndxcFVXK1gx?=
 =?utf-8?B?M1ljeEVzdWQ3dUhmSWUzQ1UxN1E1eWJnMStkZTlmSmxVU1FrR2JWdmZDMm1m?=
 =?utf-8?B?eUFwSmFpYUFLSHZOdHBDKzBMUXRrUXB6RUlzeld2TGVpV01qektoOFhmRzhG?=
 =?utf-8?B?NExSUWZKZTRTakxaVnBMa2FKeWxOSitCZ3p2N1VoczY3Tlphd2gwbWNTR2lz?=
 =?utf-8?B?V1dFaWE3SU96T0h5YUV4dkNHODNsaUk3dUFMVlZob2RTalZpOExDOFY0Mi8r?=
 =?utf-8?B?QWRQZUZ1L3hhWnpuWjJRYmM2bUtCejh0RjVlTXpOU25rT2xkZ3NvZURhNllX?=
 =?utf-8?B?UWtGeDB4VDYrNHlFL1pNR3U3RXMra2pLRDZSa3Frb1cwOTRld3JjWmRmaHNl?=
 =?utf-8?B?RVVnWGlWM1A4VCs2WWlnRm92UC9GSG44aFZrU3JOUVVHRzNuUHoxMzVVTFdL?=
 =?utf-8?B?SlZZbUJzV2tFRWw5U0NGQ2xnTDVtckpTVFZVaVZFaGsxV1ZDMWJjdWhOVXUy?=
 =?utf-8?B?Q3NFSkVhM3JDa1d2cytkalFsWHQ4b0puaFRla2tvRTdsKzRJRTdXdG5PSFYz?=
 =?utf-8?B?Z2lEYzc4TmJObDdmV09UWjdMelFpMWtpajBLcG1jaGtXRWRPd25oL0FYaXFr?=
 =?utf-8?B?M3JMR3Rab1NXTUgzYXBNNUVLYVljd2N5clhhT0JTa0lvUFNZWWltT21SOWhn?=
 =?utf-8?B?eXJzdTNUcVNLbmEzQUw1VGc1VXBBYnpuVTE2OUg3VzNVS0lmdXVhN3ZGOW1T?=
 =?utf-8?B?d0cxZC9obThsL3ZsWkFjZjZEUVpCc3YvMFo4Ymg4ampHVitEL0kraXdGNEs2?=
 =?utf-8?B?R2twQnVzWXlWWmhkbUJSWDk0aE02dmthSUhsdlVpelU1RUlVSEM2a3ZSK1Nk?=
 =?utf-8?B?YVU1QVFoQjBSWlB2cFh4VDI2dzVSeWNWcFNjZE9YZ0RyckZJNWh6MDFsR3p5?=
 =?utf-8?B?aTJoMTl5dExiaXVRU1FmdVRKQTk1UFlQSUhvMWtWU2prclVsWFl4MGg5RFJV?=
 =?utf-8?B?Q0YvZWtzV0RRZlozTVhBelRiOEh6NFZ3dHVHVzJjY3NQWjZ6Z01XMU56SFZQ?=
 =?utf-8?B?TTRkZDlLOEhhcTh0NG9STDVlZ2lpRDNOMFI2VmJ4V1lvVEJIallBYUd6ak9H?=
 =?utf-8?B?dWY0ejFYWmtiYkU2NXNtcnVDSFA2VEkyVVNuTmRBRm9YUGVkY0pZZFpiYlZN?=
 =?utf-8?B?Z1dBYkJDSmV0OWJXaHVCaU1oQzFhNkxKSjR6RnhxYzZETG9qMmVHYmRmNU9H?=
 =?utf-8?B?US9TOWVUQUFacGdzWW1XNGhnNExQS3RiTkxhTjZHSGV3N0xvbU5FNVZpWThF?=
 =?utf-8?B?Y2hhdzRlVFBFQzRSYVJlT2FQbkdramhPVWJ1blFaQ0lUYWJVWEZHQ3JMQUk4?=
 =?utf-8?B?WXhQR29SZzB2QlJnV3k2Z084ZURaV0s4Ukl6MkM0NXBpNXQvU0VjdVRKenhV?=
 =?utf-8?B?c3ZVa05nVFhCVStHS1d3R3luYTJsamcyeW9iZjNERHZxREh2dU5mSUhwUC8w?=
 =?utf-8?B?Vm5KMGxkODRhMlN0RkR4bHJ6b0RTMFgza0ZyL01FVHRDaXZLMFVKYXNWMGhE?=
 =?utf-8?B?Q3FxTisrK0VKbjRCV3dqUXdSc2JncXFQd0IyYkYwaGpQZGUraXJBUiswSzNS?=
 =?utf-8?B?d0ZDem9XQnpkdzlSZTgrbTdqRHkreEFtUE9vL2FSOEtLVU56dGpNenlZTEpG?=
 =?utf-8?B?b29uaVFTMjRaeVdiRWJWc0dONFFVWHQ4WDA5eVhtVjQxZko1MWdnMzZjSWJI?=
 =?utf-8?B?cVVrVWc5REl3eE5DQkFNZnVEZFlsa1daWkNwMUttMC9pYXJFMkVxUFJ5aU5T?=
 =?utf-8?B?K1RESndOZkRuOGRkVU9NMHBTTXB2amFDNnBhSjIxL3Y4bFFGTHJIenlNMWlw?=
 =?utf-8?B?c3Nhb1F1NlFuUFFiUzByOEZPeGhDWi9kWFV6YnFIa3RSa0Z4UldkY0YrMHl3?=
 =?utf-8?B?L3UxZktxN2ZTU1RJQlk5eWZ2N21DcG9mWnhIWmYyYzVUWmNkUEJKcU9xRG1G?=
 =?utf-8?Q?Sq/icaNo9khTqhfZbinaP1M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf500c7e-74b8-4747-69cb-08d9b647acbe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:28:40.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRwYuU50Llv3OyfnyZA+dkSGgfEvIIpxrrJ7apD3vy3d6ihBfITaekrVUGzQKVX63X1A1KufqsFr3i2mIelQsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
running in. Permit further PCI related ones (only their modern forms).
Also include the USB2 debug port operation at this occasion. While
largely relevant for the latter, drop the has_vpci() part of the
conditional as redundant with is_hardware_domain(): There's no PVH Dom0
without vPCI.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: For now leave out PHYSDEVOP_{prepare,release}_msix and
    PHYSDEVOP_restore_msi_ext. Drop has_vpci() part of the conditional.
v3: New.

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -94,7 +94,10 @@ static long hvm_physdev_op(int cmd, XEN_
         break;
 
     case PHYSDEVOP_pci_mmcfg_reserved:
-        if ( !has_vpci(currd) || !is_hardware_domain(currd) )
+    case PHYSDEVOP_pci_device_add:
+    case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_dbgp_op:
+        if ( !is_hardware_domain(currd) )
             return -ENOSYS;
         break;
 


