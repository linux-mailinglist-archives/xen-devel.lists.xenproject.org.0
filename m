Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DED40283D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180946.327847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZsx-0008AX-85; Tue, 07 Sep 2021 12:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180946.327847; Tue, 07 Sep 2021 12:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZsx-00088i-3z; Tue, 07 Sep 2021 12:07:31 +0000
Received: by outflank-mailman (input) for mailman id 180946;
 Tue, 07 Sep 2021 12:07:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZsw-00086X-9p
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:07:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a423eb0-0fd4-11ec-b0eb-12813bfff9fa;
 Tue, 07 Sep 2021 12:07:26 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-wO4pVYOwOfOPYqiRTM-_GQ-1; Tue, 07 Sep 2021 14:07:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 12:07:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:07:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:101:16::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 12:07:22 +0000
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
X-Inumbo-ID: 2a423eb0-0fd4-11ec-b0eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7mzpWDSKQyeB1Y7K6PB6/ey7zolLxcOfxP5VRC4xpg=;
	b=SErut9zMOtkNGyzk/89jVwytfHcYzg+NPNOFJpwQ/WeP7lygv3MgD1ZTMW/C1KHGrllcPA
	k5baRR3ABtSG6pY6EBke79DMgymDIRXYPJnQUYCXlxyYK3JXOxuV9DYpzmaDhDV/Ayzfr3
	oIMGYDbPPqwMmWYC0dhhMeBtjakQw5o=
X-MC-Unique: wO4pVYOwOfOPYqiRTM-_GQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTIxY8KEDICOriuKX5SuLtaLX8doPexdNM9CYmFxBEanU/cMmnEH74KVzYL39rSFD4cTK9jSwCf4ro+4qMbDkqqBLCOfMNGCux8PMyFvz+3NkZ/exWTw03IZyKMARPSGHmzocZ+YFv8HHvBAAwuxxZbO8mABTODP4EP5WWfk48N/foFbOGqUk0zrhDI3RhKPTgkV79ysNrU+2aYboDr/x9c27H5xTUK3hSOjV8HqIkjw6D2V2cLVL434+YGsBjElA/0ihK3DbZ4gBWofHjC4WAuufdkWFesQopamHg5dOqP/cJsKm6SJZVllpT/O+4hcO70T9szY3ZnX1siBGXbzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=n7mzpWDSKQyeB1Y7K6PB6/ey7zolLxcOfxP5VRC4xpg=;
 b=bncueqn56HBLtcSH4vHgtaTxs9jKY+re9pppPYPvwbY4YDfvfW6CztYMvYRehgdwJm+YeuRjF0/y9b/kURFHgknYzLDHx1eYCTWmkrd9srrvXilKQIQI0hMH2Z0Yy1ANZo51f77VNnCNZS2p9CDgbP2m0ImH07hJFBtgxUnyOnpK6r3PhuXXV/WgCLAm5ettm1nm1vudbQ+GDSrBPOYlxALXuDiAYgxlcCNH3Q0cllH6xTyFwlCR66dG1heQVXIuOAt63n22daKJhdmYCaxZY3srkXpYSvqdCeym07RAkvGUMU77E6gjpmoiAUoIE5IFKdw7yYSRtAXn5hFNysynwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 08/12] swiotlb-xen: arrange to have buffer info logged
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <2e3c8e68-36b2-4ae9-b829-bf7f75d39d47@suse.com>
Date: Tue, 7 Sep 2021 14:07:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:101:16::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aafa5b43-f735-4db3-d08a-08d971f80cd2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335A4D28E390E529E868D9EB3D39@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ALtpvWS75rPd7bTQjpiRwarOVxM9LjLzQJ6rf1JxZt1AVwxcvXpcn45dkxiQKB5ZUE+Dfd4K/QpZyDhhp7N+7Zt703ARx9ZdTLUl0hnpDQTsfpdZ8G97B5IP4PAkoN9Zazpzlxligg9aiCWyR4dJmmyvWppWuubxIxPnBHwiACKW+RGTiDLgTr2KBybIb7slboF4jAW+p9+usuzzYMw2fXMnu/835pKx69fVXcNpLFPpFoKrttRnK7WwGgB2G8fSPBZ7oErBw37nJpIiIk8xVCCDlIdPVHbzeiaSJACMLlBlzvM2yobefjCmEnXr+JaYzcAs4PqT5YIbSUGxa/d8LkTMbFNOZ7yhEACe+8oSkfSo0hfDJirqV7Cp4HoZ+xGPkg5rIjaVWJlNripn3uqwSak6XQVF5/MqlFl+nXwE6lXwpmdPPuQOI2FDKPnOYgyhji1HM8NSX+veqqZnFfPBSyZhKk1MEyGZ8dqzk+hJmyhW7MX6KmRSTs/2pRbbrgoJb8AYA9Bs5OjBo8RF1YovTwjE/hXZZb6f3FCwn7pPfa3dgfW8+me43jsnV27UdJCXt1hwCxVyLYIrxd0doxV1bL2eYL3JW/fmJL8knD6+JeSSk5wvmN8Bu+V49zfnznuSnmVTG75b1u/Hj9Gz21QFNvvt5xIUI38olM787kdrmOWXQKp+TyHZZDRHDxtQgbyYbygJHhIBvtPKzgiP6kEaax7UrrxC66jl5eJv1OJfcA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(2616005)(8676002)(5660300002)(38100700002)(54906003)(110136005)(956004)(66476007)(66556008)(66946007)(4744005)(26005)(316002)(6486002)(31686004)(8936002)(16576012)(36756003)(4326008)(2906002)(478600001)(186003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FoUjNGR1NialF6c2owUENPTlFMM3B1d1psYkV6dmlpUU8xK1ZMc1ZJMGZw?=
 =?utf-8?B?dlZLMHZyWnp2bkpYeFp4STNsV0RPSnpqMFg2WE55MW5wZFZNZ3AyLzdlenpt?=
 =?utf-8?B?NHFvdFRkMnE2QnYzVkdEMGRhTGVwZWZqZk5MbTc5QVlHZEN5YlFYMnRwTWhs?=
 =?utf-8?B?Q3hDWXRZQk1MV2hCdmh6Qkw3TTlOMkZaQU93cDRCTzZBWVBFK0JFZm5NVGJL?=
 =?utf-8?B?ODVMMmF1Tk5DcnpUWHFRa284TzRNaFdiRG1TSEF5dDFWMmdaSVgyaXh6UER3?=
 =?utf-8?B?WVh2Yk9KbC91VXAyZzNDdFR1MjgrQUZTVGtxdWZsKzJncVdES3c4bkdONE54?=
 =?utf-8?B?Q0E0by84VWE5SkdhZkg4aG9scmFhc1NnSW9najRGbzlzaWtCdWkzY0toTkNR?=
 =?utf-8?B?eFRXNGhoMlJpL3hPekRRNCtWM3FoZnpWZklpa2ZLZVVBMUhqZ1V0NGxWd0Ny?=
 =?utf-8?B?a21OTVRaUEJvZHJFVUNRU0k5WGhFdU5MaDYrSEZzbTM0d1pvSGJSajFGcEVJ?=
 =?utf-8?B?SWJUWi9RVFBVSlFpNVQ5WlJMamkvQWNBUXRIQUFDUkRVZ1Q3ekZBYjBiakJa?=
 =?utf-8?B?ckdzRnI2ZXNDbi9td05OWEtZZlpvUDE0YVA5Vkc0bU1zdnlNNTBESDFBcWpi?=
 =?utf-8?B?eHE3a041Mnd3TXRZNTdyOTVKUTlCQndBRUtLWmpFZkhCU1haWFpwSUhFTkRC?=
 =?utf-8?B?L3YvMzU4eER2STc5alk5SmR3bTk3aUp0OWpSNTV2eW5hNlROL3dRbmZtczBU?=
 =?utf-8?B?ZFNkeUswL3JjOU9DSWY4REtDbHA3MCtOMzMrOFpyQVdkcnUrcnByTk5YcGNJ?=
 =?utf-8?B?bjlzVVcyUGx6UmxUWnFRQ3FVczByRUk3TEt4aHN2aUZlUFVuRXZFNzJhYmh0?=
 =?utf-8?B?amR4bGp3UTNVb2pNcW9LVWVOSSs2ejBYL09Rek5XRGtJT1NQR25YOXJuMmc3?=
 =?utf-8?B?MVhSMzVGSUF3SXJrNktuSWVwVUlFRzhCTGF3U3FOZERCTThuVVEvSWxsOTlk?=
 =?utf-8?B?NlpFYWtjTDdITVN3ZmJrNFk1bzcyOGt6MVRuREFraklYSGQxc1RvTXlZOTJm?=
 =?utf-8?B?UmNhK2JOTTlyTUFJRzk3aEFNaURITDNtd1VxMURSY0xaWm1JMXNCS3BLODQx?=
 =?utf-8?B?ck12N1NCcWwvSy9lWllBYzM1YjBjQWQyQVlLSTd2b1J4UFdzN1IrQUlvcnRU?=
 =?utf-8?B?SlFDdUFnVkR0azNQK2svTFZzZlJkR2xGMUp0RDl2MW9ick03cVpzeXVmS09D?=
 =?utf-8?B?ZGpFdUdDaC9rcEU5amVaK0VyalhGVDFrWFBmOUE2VVhzWWY5Tng5RTFGaWpl?=
 =?utf-8?B?d1ZueVl6eU9lZlZ0ZzhXcFQvRXpnbWdQNHJ6V0ZnUjVpZ3BCM0pPK2k5ZDNQ?=
 =?utf-8?B?Mk5Hdnd2cWhFL3JhMGs0S1QwMFRJSFBYZjUveUFMdzVJZy8yUEs5TElxRmU4?=
 =?utf-8?B?T1orZ09GZFgwRzZpWjgxYXJqeUR3TG1BYmVHRWZiMVc3cjkrdHI5dDVWc3Zq?=
 =?utf-8?B?eWFLV01aV1ZQWlIyTmp0L3VidjhYWC8yb0hlOTNHMWVvSGE5a2o3cEYreXRy?=
 =?utf-8?B?RUZjRnBTSEsyejdBS0phNW5Cc2IweDMxOUxtbjNtMFNoeTc2eXljVjYyTnhy?=
 =?utf-8?B?aWIzN1I4TXkxQ1FtNy9MMGRScXpIenJXRVRwdGp6Ymp2bUh4R2hWcDJOYmJW?=
 =?utf-8?B?SkE3anBGL0pUZTlPaGdFSnFUUnlOcFllREk0RkI4ZC92amxhZDJLM2g1VFJv?=
 =?utf-8?Q?orcBUZhClMFZ0qsoioEpPl5cbx/+29amJxrDzSd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafa5b43-f735-4db3-d08a-08d971f80cd2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:07:23.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZFC7s4D4ydJmgfgHq1eN5JHKDnRLeCTZaomrg8SF5gCbPA7ZyH/63UPSSxFvPLLe9wPZN3GKpUD02THWyXLHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

I consider it unhelpful that address and size of the buffer aren't put
in the log file; it makes diagnosing issues needlessly harder. The
majority of callers of swiotlb_init() also passes 1 for the "verbose"
parameter. 

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -253,7 +253,7 @@ retry:
 		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
 	}
 
-	if (swiotlb_init_with_tbl(start, nslabs, false))
+	if (swiotlb_init_with_tbl(start, nslabs, true))
 		panic("Cannot allocate SWIOTLB buffer");
 	swiotlb_set_max_segment(PAGE_SIZE);
 }


