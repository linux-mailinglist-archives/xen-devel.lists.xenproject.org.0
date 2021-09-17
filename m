Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA640F223
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188898.338301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR77g-0007wI-4w; Fri, 17 Sep 2021 06:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188898.338301; Fri, 17 Sep 2021 06:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR77g-0007tj-1U; Fri, 17 Sep 2021 06:13:20 +0000
Received: by outflank-mailman (input) for mailman id 188898;
 Fri, 17 Sep 2021 06:13:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR77e-0007td-O1
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:13:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 585ab23a-177e-11ec-b66d-12813bfff9fa;
 Fri, 17 Sep 2021 06:13:16 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-DphBANeBOFqbfeylBos-Ig-1; Fri, 17 Sep 2021 08:13:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 06:13:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:13:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Fri, 17 Sep 2021 06:13:10 +0000
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
X-Inumbo-ID: 585ab23a-177e-11ec-b66d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631859195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E0C70BnHkf+Xjjy8puyk2DxDQEN3l79sxqdB6zmJekE=;
	b=JmJC1B19LS4GKHjFNuyGeRG8pEtGKCuuzIcThxRszeZlpllSOTxUUe4RzpiKK3cHLxXuq/
	gAWcG010ZWCP/iL9cHzSjUGSwm1ihOHr0lyQa1QieBysC7v5QV4XKUQ3yTGL6+3O9M5YtP
	8OnMlTWVd92xRkhsPSgIWewl5F1ss4g=
X-MC-Unique: DphBANeBOFqbfeylBos-Ig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXhkYtSdvVa4wdvtljJxcynR9dYQupXOYSXT0Bm0PPrOssm3I2WzkX0vJXUrR6Es0cDBP4xIa1IQ+Ag1C5eoOLv68MbJKnd0SRLl21W9XjryTYKxUKJOCDhnEJdv5n73UaXjHLZx6XH0wWgAMv51tOqZm5si9SzmqTMjQEgtLHa3F3OL56Zo+XXsfAYVjGSvrOTHo0RGJSSNOP9G5Yi3GpqD9aaPnuVEiVirc8wCHlHqwwAyMx+tcGIUfhEV6DJaX/ssqIOhBggjiFZxa3w2f66XmWYqcvGLcwqPFaLO3FL/bVCKmkzmG9Ml8D5hPjP5lLFlKrB8gTl1Zj5CujU0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=E0C70BnHkf+Xjjy8puyk2DxDQEN3l79sxqdB6zmJekE=;
 b=M4SPYxDp6Zv9q4EjccpFIm1vr6twNv2RfCnmptwY3uzI1mBlJBl8OjMR7a+Eg113PjmtrCl9TcmyqK3RahDBbyzEp77CeXwe9d9UzhNnHYaMcT6iEhQuI4QgKQIquYIuAF0JtW9dpGPhS0Uly/q+Apg5ymzURSq8bSkjl/wC2Y4KSlLmzkIw4dIzOfeFJDEHwKyGGITbuJ5KrMyc7BdktzYcNTimWBtZKm7j9RgogjxiTB0VVjuj0TNnbHI4WKCMCh0GdWMN9CkmitqPqHkLnN5weI6y73ut4cIOP8IIpwoB9GfbFMfGUrnaNZGkeNfwP4BRyKAPqrHHXdBMgSKszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Xen/gntdev: don't ignore kernel unmapping error
Message-ID: <c2513395-74dc-aea3-9192-fd265aa44e35@suse.com>
Date: Fri, 17 Sep 2021 08:13:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 714bbcbd-c616-4fa3-49e1-08d979a2396f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383156B10C9FAF1D21EDCB0B3DD9@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7x/6Tbo6yHVA/UJL7sQ/DuSLRGvDWU4w6O0UPchq73AiHCJpGTUPNzxBNcSh5bBzbP3nwGV5NRx95QpJDYtKm/EoEz54XtfeJGTiL+ZNJHsFUi60do0gQzCqWT8/rVI1gCqPCZzZ1yXG/AHI/C9Ey8FA/RIXajBjfWULZZ2HETqRemw2z9wdF/3GoZWrGqbkPEmS1NF43N4xOdmLBsV2M6hKKCPvam432y1rupa6QseviGyLrMxtbcjHYyqGO2TqmHoskVgeFdMhJ78zzYBlhJ4KN8+VH/Sr9uIaBeaOOMqqO5i2vpPh6s/UQTvMI0RBMJ6qx6lYenGWDM+5suJ73LJiVhITWMgwmNc3zoC0kc2Z0KKK0xCu0AZ9u79lfVpdyKfmzHd9yzI19zuAzWTH2TrPeisK53WN9tCqZuY5f535I81WB0P7O+ueTOoCHoxlZqjDCGyyY3qQaECXudAKYHk+WzVtQZZCkgucFQ4pk7goKnEIZ6/0mx4/iBRATSAMU1KQlj6zub4l4aWMFu3TeowJpGMnDcepspWzDTb8V4ZS39FDiDLRgvC7yCgmpU94j1R8rZoS4B8r7qJOsft5RN0xJpA1pVc1q2t+X+C+S31kzaImYGccDQFvi9WfazP2n71NscM7S8LTTV6ZPx/UtBbXvI1OSIKxShcw7BrLDodumrujHyxXDkATq8gWtuOkpknMhuizRlxGrZjmJSMaeDvaQvidnulSafxbBu0YldI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(39860400002)(136003)(396003)(38100700002)(16576012)(6486002)(54906003)(8676002)(31696002)(66476007)(66556008)(66946007)(2906002)(5660300002)(478600001)(8936002)(26005)(186003)(83380400001)(2616005)(4326008)(316002)(110136005)(956004)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck1XY05kbmtIUzZsc2xrZHdBMlVBV0hRNEdPQkhoVW05R25kN0R2Qm5WdG1t?=
 =?utf-8?B?TU0vY2JPRldXRTZPWTVvWlZtNFBlcWZ5bXpjWVNzZGpGTXEwazh6MG0yWGZa?=
 =?utf-8?B?eEIxdGlNcWxkd3ovYTZreVkrVFBiR1BCa1c5ckNVYThVcUViRHprTjh1WFQv?=
 =?utf-8?B?MVRDQ2hhd3JiTlp5dTFUenB5b0FsZTdjY3NXUEdFeGtaZEF3WGVHNlBaNHoy?=
 =?utf-8?B?L1FRVXpLUzM5YnRTdzVlVzV1dnpkSXI5Q0JwSlpLdWI1N3Z2TXJwdHh3Mnl2?=
 =?utf-8?B?TGxIOWV2MnloY0NSWVBsVDBBd2VTMnNVMFRGQ2IrTkZDNzhMMHNRUVVOYlVt?=
 =?utf-8?B?ZlI5S1FGdnByM1VjS3ZWREtmZW5ES05kUUdjWVZ1eE1VR005SFV6ckNISlpa?=
 =?utf-8?B?VFk5M1lvRzFWblV5cktHbjdSOFVhbzVvd0M2ZElTSDkwUENMTS9waHZBSnc4?=
 =?utf-8?B?MENSaGtvK0dRUTAyMWNsTHlvcjlYMU9RRFhJbWNpcUdUekNRc05mdzFaUHBU?=
 =?utf-8?B?a2xndTlxNXZhOWdjOHBWL3RDRng4ek5XVmZyb2w1OXR0RHcxSlBRNGlDZGlh?=
 =?utf-8?B?MUZLSG40Z2o3KzFyMTVJWnZPNjdRMCtJS1BWTlVzUmNZdlgydndRb3hCSWEv?=
 =?utf-8?B?bjFCekE3MmtLL1R0SzB0UVdXZXlaRElQbGk3dnFNdmhvdHBZaUdKZC9nOUZB?=
 =?utf-8?B?b1Q2UlY3Q3pUN1RaUGlycjVPUVZ0Q0hXSDVad0JULzBldGZOSWhMUjhBL2V3?=
 =?utf-8?B?SE84WkRiWU1mdlV3MFVKMlRiN0pGQ0dzNVVBcHFwTWtNUWQrVzV6d3hIUkNP?=
 =?utf-8?B?Tmd2eHA1ODV0R1orMERuUUcwNmg3bmRCalp2alVRMGZrWS8yTGVHWk5kL014?=
 =?utf-8?B?UUNIZjd2dGh1dWpwZ2plc1ZTZWh6NkVXTXhLZGFGMXNTK0pjNEFja0R6ZDF5?=
 =?utf-8?B?UkV3Sk92OFZoWnFZTzVHRzFkaVFDQVdJblRXcXhCVi9VbFU0dmkzSy9tRUQ0?=
 =?utf-8?B?ZlhwQlVjSWlTRGdxS2JUMkRqNHR5WHdsdmxESUhLQTJTN0gzVEQ3V2VhQWFJ?=
 =?utf-8?B?TTFyV1NySXc1RDhXcTFSbEZWazg3Q3ZhQ3FTVHJ3T1N0bithVDQzY2dqOXlR?=
 =?utf-8?B?M2EvWitBc3RUR3BGc3VUazVCR28yNkhyaW5wazNlQTkvTEExcmtWWFhOUk1w?=
 =?utf-8?B?TzJYQmJvTDZ4M2NEcVNoUHFXVm1ERnJDZ2JhSmRqdWtKMUFQU25IKzNNcXg3?=
 =?utf-8?B?cFNsUjdYTUNZNElJQkxmK3BtckNFWDhucjlaRWRZUHBMUGdBUnREeHBKd0tR?=
 =?utf-8?B?Q1RQYlpnUlRTcXpDMFBoYjNoaFFQVG5LOWIvcmE0QmdoLzVvdkhOZDR2d3FQ?=
 =?utf-8?B?dGYyWC92WGl5aDFDYnB3c2lhT1h6d0MzK0EyMlVTa0JIZ3pJSTRYcVZPZlI2?=
 =?utf-8?B?L28yR0F0Q3lzcUFpK1BEc2NBTTRGdE9CK2p1bkU0bXZOY2pZUzl3ZHlTYnhw?=
 =?utf-8?B?Sll1akp6bzZpTmZyY0hXYWptazlXTmFIRmpBUzZYcm4veElDd3VxMEJESGgv?=
 =?utf-8?B?b1lOTEQzRjR0MDljdjEybGk0a2RQN0x6c3dFbjFlelZYRDk3bXhuYWlIYUdS?=
 =?utf-8?B?UVJONnorYmpNeTIxVFFJRi9NUHpSbERhR1BMTStMenAxV01IbklPdFJmVUNl?=
 =?utf-8?B?RGc3RVpadjFKbmE4TUlOZTJMNGhtbUNqQ0tCa3lUQ3RSWDJ1R3JLOWxGWk5V?=
 =?utf-8?Q?I9bIqo8XJ+Yny+LHjPUrdt9ukpIjf6bh+Iomj4v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714bbcbd-c616-4fa3-49e1-08d979a2396f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:13:10.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+bVECsj+i/F5j9JH5o2MtArGakmdG/IdvAG0m/gHqbZbYZPIIann4GG9yNWFWPUwjuYljFlMvg2wgYJ5n/tcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

While working on XSA-361 and its follow-ups, I failed to spot another
place where the kernel mapping part of an operation was not treated the
same as the user space part. Detect and propagate errors and add a 2nd
pr_debug().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It is of course questionable whether zapping handles even upon failure
is the best course of action. Otoh unmapping shouldn't normally fail
unless there's a bug elsewhere (which is how I came to notice this
discrepancy).

--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -396,6 +396,14 @@ static int __unmap_grant_pages(struct gn
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
 		map->unmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
+		if (use_ptemod) {
+			if (map->kunmap_ops[offset+i].status)
+				err = -EINVAL;
+			pr_debug("kunmap handle=%u st=%d\n",
+				 map->kunmap_ops[offset+i].handle,
+				 map->kunmap_ops[offset+i].status);
+			map->kunmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
+		}
 	}
 	return err;
 }


