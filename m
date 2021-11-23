Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224845A401
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 14:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229609.397061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW1q-0007nY-F9; Tue, 23 Nov 2021 13:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229609.397061; Tue, 23 Nov 2021 13:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW1q-0007lk-Bn; Tue, 23 Nov 2021 13:40:10 +0000
Received: by outflank-mailman (input) for mailman id 229609;
 Tue, 23 Nov 2021 13:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpW1p-0006K2-24
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 13:40:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5d4ee1-4c62-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 14:40:08 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-BSAAXH1QNjONoB3pIxpIdg-1; Tue, 23 Nov 2021 14:40:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 13:40:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 13:40:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 13:40:05 +0000
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
X-Inumbo-ID: df5d4ee1-4c62-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637674807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UpnXoNN4OOD8dNV51znqRmM214jyttiYXA4qdhkm0s=;
	b=dAni9xxVsWcVuWebXbNYrplFK40Mp2MfgnzKFCu++hvtuyzZXZ7V+YknUzmVuPYUSPHa0K
	gQ1ePoeL7qm5QV2hQthewxUggqXjtnL2V7uW8JGYEORIYyrohld69/uhyr3uVMLLu45/c3
	Vvzc8Xo6m4k9b1cFSC0PMAsEmUJOdYQ=
X-MC-Unique: BSAAXH1QNjONoB3pIxpIdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbs2bI/JfnKfMCpQwEF4YQg4k4MW4uhLmnEkb7zVXApJRQHOnx0qQ6Ewht0kuJuxabtbLXp8xZLI40Bm5DEJxzK1iCmCV+ficfoffhjgrwqJHIYRFec5HM84gW+Q2v0ddNoW9/nBID1x21EBw2E8iEIzKOfVsuXNBCa+mjIBcaNlg1fiOHSHi+WOaMJb1SqJO36wAgRDKOxEDqzAGpGDG7xcdRfg7a03Q8bhVP+JmZme+feHde1P3HaDwm1hDjizgqjm7rnIUi3K/Jwv1yXHgGCIEyh842czyTBOuBIUZhJoo3SP69h/SULxCsJoXin7SkHXoRzWT+KKTH0PspM5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UpnXoNN4OOD8dNV51znqRmM214jyttiYXA4qdhkm0s=;
 b=aPV6ZGQDmhBwY73MeCiBIdoC4qL4PYKtsBFnEO/ClZTM80w1wsBmKQz9tLOpXf3R9ZAwiaYNm1M9x1yGBkpMocKOBMxCNyaJbpnnKG3OgVgQJJ8u24fAfBMsI2F6HikQQytB29iowopvErJO39hIxGhb4PbxvUWJkcJ/jkoqfq6KI1c2lIlQV7wP4zXRVqU8EuOjxb/Bc+8PSxdL088y21/KO+jx1y0SE6b0LJqOSfdbU+5JOP+ZFWjTLEchq3nGkTy7Z83L797hOX0MK2RXEmYysLJLotv69E0D81NnkPnlL/YEETv5bmNk2sP9U4uKxQV38kJwg2s24aOEj5ePkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3627c85-916a-40eb-9601-9aba87eaf8ad@suse.com>
Date: Tue, 23 Nov 2021 14:40:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: [PATCH 2/3] VT-d: correct off-by-1 in fault register range check
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
In-Reply-To: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10cc8ec8-4365-4cf9-493f-08d9ae86c206
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325FBFD9205EBBC32990BBCB3609@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wq4TDOz9ITbJYDbXN6cnU9heRTePoDQpA+YgGwqb5V0Kbgopb1ofVQV680mJbfcqO0xjDXAQaEXVnQuREUruh1GrphMbLjSESopBN/1gKoKEMCIMz/PBRwirn8mYNi8cuEvuA5BYLkBAyfqGg2uJsHg5bNeQFAQyIqn2UObBPUllQVIHNpuflVTlA1s4aiwSs7FyeJQMiQ1oxR5/9eGAODolCsiKWnzv+jVkl/hhmVvnzr+UR4MzjjiiKagsVkV6IS67Vh2L6/vnVX9DSRIhu8ojcDzagE/l6Cpd2Oi5QQ+uOa/TaP+I2Z4aXQBcXmG52ncKlS534TGEf1f8tgeWOirK0zs+GxHTO0pcgl5M8eXbKfiUwGzGx0v9iSP1/YopJ6jUiGCuRP+6iqHG/hi0XrlodX9xVLn/QgeW0ISXboDCrWKmoVI7MrP+sw+of4fIW3dvwLueQK0p76ILM68AnkXetZZOj/rxe6BKIIf8NJHlBmkDUKqEk3yOOemrF3jO7AtB/xRDvm7+6lG/tFVasD9nDgGNBGl1ZGnxhmyzy9I4hLEpF1MXmCBtulZFmXEQQwC9DyjGqpjBAVX+BvTpzHQG797rdI/iLYVbbTQ3T/dX/5TLY5FaY0maAUFlx59PECdF4RYaHP10SArL3JtInh5KlqZdQUuWo+aP0BxtpnC5+4ZKZAetN0OuDHnl2YQg381DrUEkaRdo+6iySzC/ETuxD8TNyxX08hSxRh1uHO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2616005)(4744005)(66476007)(4326008)(2906002)(6916009)(36756003)(316002)(66946007)(6486002)(186003)(16576012)(31696002)(5660300002)(508600001)(8936002)(38100700002)(26005)(8676002)(66556008)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnpaU3A5WTZ6c0FKT0t2WUkyQWcvR1BQR1lwaXRDUW84RFBlYkdua2p0eUFU?=
 =?utf-8?B?OEJzREIyMmVZZkp5SVZOUmYzM2w1L3Q4bWszN2tnQStyeWFLU1h6Z0g0bDBC?=
 =?utf-8?B?Mitqd0xUQnFUaENXTFRORnE1SmlRbFRzUzFEUGtxNGpuV1pKc1A4V3UyODBr?=
 =?utf-8?B?cy9RNG41Zk9abzBQVEE2VkovMWlDR0I1YmNTY0RJbU5XV2tnWHppbTJEN1E0?=
 =?utf-8?B?VVl3QmI4czJiUEFGcjB5TVQzVHhnNXVXMVdRdzJrRjc4VHNNdXBTVkhWU1o4?=
 =?utf-8?B?MkdxNkFaODlZbkFNSlNmK2hIb2FaYTJ2cWZScW9wVGsyaTlXNGphcjFPZDRP?=
 =?utf-8?B?NXU2bmZyWW1hVWhvVXZ6YWs5OEV6VE9qNHpkNEx1cjdwaG9FOGhrRGtyVVVa?=
 =?utf-8?B?OXRUQXplWjFEaFA3QS9Kc0RGUk5sVWRQcGRTTTJmaDV4dzF2Z3k2S3d5TFZD?=
 =?utf-8?B?VFc1NmdvcGhPQjQwZXFFWW9ZYnkwcEcxWkNWMmVibmRZWnd3T1JTeW5TU3Bz?=
 =?utf-8?B?S0FITWljMjI2Z1FCSVVuSGFUbkJwbGhpbDd6enRRQVlWcHNya2h6aUdrNlVr?=
 =?utf-8?B?ejZyVUVqcXNvMzVOOXRZSmtyZ1U0UmpOZktrN0lpSzgrU1hnR1c1UmR2L0xH?=
 =?utf-8?B?RWp4YURGRS9SMnNlakdPTkFSNUkyTW4wcUc0OFNGT1UyS20zVTBaWDdzemlR?=
 =?utf-8?B?a043OGNkcUljbFpwMjJmK01qeGhMejJzUU5hSmdaZXJucS9VdU5ZMEswY0t3?=
 =?utf-8?B?a0RMZklFYUx1TWxSRjRoU2ZlL2VJWER0eE43Wjd6S0M1QW51RTN3NjV3UHho?=
 =?utf-8?B?Q1haMSt2VzV3c2d0SG05RUpWOFNENzNMblZoYjBQb3NYVjlFcUJqbEY0MmRo?=
 =?utf-8?B?dmcwcUhMTHdSSmZ6WmgxdDE4VHRHbzMxZUUyOWk5M1c3VEtlcDd2aTM0MmM4?=
 =?utf-8?B?R3U4MTBTcEFyTnJGUHd4dDNXU0IxN28za0tua215L2ZRQjI2MTh1NElCakdH?=
 =?utf-8?B?MTFwUUVVQUxHeUVjbEFZN2NHNTF0Mit1ckFVY3pXekxJaVNmU0xGK0FHUEto?=
 =?utf-8?B?QmxQVERaSUQrY3pIN3l5YjlJVWFuelRnZ2JKcHVQSm83bDZER0xTdVNHZlJT?=
 =?utf-8?B?L0pibXBLd3pBQ0tsT1pFSHUycVNiTWJLN3pVSmt2QUUzQWJwMzlIQ0tJM0pE?=
 =?utf-8?B?T2phWE0wUnNTSythZkl6U2pmUkgyb2RzZ3orblgwZWUvcEF4c1FDVFZjL1Qx?=
 =?utf-8?B?VDB1USt0cVczSUp4RWh6NXU2TEIzQm5ybVlVVlVEOFNPZWpkN0d5Y3p3K2NX?=
 =?utf-8?B?ZTEwZWpFTFkvVElVams2bHlySWZuaUhuc3IwWWJYZkpLMjc1eFB4L3RwWkcr?=
 =?utf-8?B?Yk90Z2lUL3htWkFoTTNQTGdySVZBMCtPbHZWMkk0cjBtcE1NdmFvQXFEN0s5?=
 =?utf-8?B?bkE1RGpsOG9HdE13MDJmNERxZ3diL01DVCtZYVZlZUVCWXZwemFhOHBXWHdB?=
 =?utf-8?B?UjdxczlQKzlYaGNiVFZpUGFxZS9xRG94UFE2MGkxRlZYMUxSNlNjZmd1Ry80?=
 =?utf-8?B?ZjcvWGU1UGdWdG52b0lpK0wyWTdYelBtbTJ6NzBtc2U1dkFQZytCdkw0L3FX?=
 =?utf-8?B?cUZyZUtQMUVteWFYbldQbTQ3QkprY2hvczAvM2VUK1BzZldYTjYyanhLbytP?=
 =?utf-8?B?b25rVndzRDcvcHBDQ0VGRmlQa28zTGZpYXF3c3Z0NXRRQUllYXhkakpnKzJp?=
 =?utf-8?B?UFQ3UGc3QTIvN2dOUnZJejJMVSs4TStoUndLNldocEtmMEgrMGdLUkdCV3Uy?=
 =?utf-8?B?S0Y0WHlLU0hYMHRzMEFGRHQxNGNpNXNQdkNHT0M0Zzk2b3BhWWV2N3VST1k5?=
 =?utf-8?B?SlNvK01CaEZCVmMwK0FOdE5vbmREYndnaUpGdTVnOFZoOWx5YjdRd0kyQ1dV?=
 =?utf-8?B?K0ZNZXBSSk1CTHJZN1JHZ0RRWEtBVmFQRW9FOTd6ajd1ZGQ3QmZPTXRXWHhS?=
 =?utf-8?B?eGNONXFwVGR0ZjhGODBIZlZkdk0wTTl0QUluWmxScDV3U0dhTU54UlFKbGFQ?=
 =?utf-8?B?UEE4ckNwcGhLTjhYZmcxZG50dndZWklselFzNkZ0bkhsQjdCT0tJdnZSVlIv?=
 =?utf-8?B?V2lvbjcwbWdnOXJxME05TERVNlBaTm9SK3B1RFJCcnQwZmE1Rkk2d3YvZXZQ?=
 =?utf-8?Q?XzxFe/MMmq/DX8Sn73PQ/Pw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cc8ec8-4365-4cf9-493f-08d9ae86c206
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 13:40:05.4477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMaa9gcJ4vcKR4TExIcAq5j5eySrab3SoeocB9lKRROFEYeMo1RGzLYa/kjd4gK5uU1TGLiy5n5o0aJWRroD2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

All our present implementation requires is that the range fully fits
in a single page. No need to exclude the case of the last register
extending right to the end of that page.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1229,7 +1229,7 @@ int __init iommu_alloc(struct acpi_drhd_
     quirk_iommu_caps(iommu);
 
     if ( cap_fault_reg_offset(iommu->cap) +
-         cap_num_fault_regs(iommu->cap) * PRIMARY_FAULT_REG_LEN >= PAGE_SIZE ||
+         cap_num_fault_regs(iommu->cap) * PRIMARY_FAULT_REG_LEN > PAGE_SIZE ||
          ecap_iotlb_offset(iommu->ecap) >= PAGE_SIZE )
     {
         printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported\n");


