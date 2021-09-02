Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A93FE9A3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 09:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177056.322243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgjM-000786-Sg; Thu, 02 Sep 2021 07:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177056.322243; Thu, 02 Sep 2021 07:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgjM-00075E-P9; Thu, 02 Sep 2021 07:01:48 +0000
Received: by outflank-mailman (input) for mailman id 177056;
 Thu, 02 Sep 2021 07:01:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLgjL-000756-GI
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 07:01:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2d0c698-0bbb-11ec-ae41-12813bfff9fa;
 Thu, 02 Sep 2021 07:01:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-OLV-JV4COwOG_7GeAIMqYQ-1; Thu, 02 Sep 2021 09:01:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 07:01:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 07:01:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0012.eurprd03.prod.outlook.com (2603:10a6:208:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Thu, 2 Sep 2021 07:01:43 +0000
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
X-Inumbo-ID: a2d0c698-0bbb-11ec-ae41-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630566105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=27WMxhXQJYDK8zBJxq3wqZWYbPIQe9ZgUpLtLbNSdZo=;
	b=A3qlVHgvffdkiGTZ/azdUis9J0mJNJul+Pong685ScUO69AC/9rzl48r2jFiy7uUrgGzGk
	J2fDAv3oFvGU/aCiNr5SXMp1JZE25HP2W68lJC689UdnrZOGvgvWM4DDMHTed7NlSDD7kW
	0gkD/ka9Jgf4KQlFGFpLzOF/QXtbloQ=
X-MC-Unique: OLV-JV4COwOG_7GeAIMqYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHEnISrcHdZrmeEhjciMwCW7JIRW3f0n2KvAxSRbtZII+QfpNvzbT/1mnXRYPve6+raQpdkpr5DsdYF79HjCGSs5U0d9Y8/gcSBquK8t+m5VJEy26R3Aoguh1M+zF8rP+CmQQXWev6sv2CH02F+YsXc7Y7Z5KTxgt8EzGJm3wdp5Qaz5KcPbwfnXu7VuaBfzf1onlo3A20NuhzJEusn/H1nVz87uksPG9YD4oefzeP2MMAp7vb0YJFLk+KIfENJNdbTgijsDYN/FVBh6/cC5LYRQHGOSXYDilO8Y1dNFKipObTrFYvvqarIUGWrvqAf9Z5TvpScN/RxxFQhO1oE6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=27WMxhXQJYDK8zBJxq3wqZWYbPIQe9ZgUpLtLbNSdZo=;
 b=k+vYz7XkeCgxv0UA8VqD72xKzK2oYkw5izLtTAyYeAuEf4SMSrSOfTL0ZngxdzFOtnw6Ftbi6n8K8i/20YgUJqqBWmhGRSE837k+MMvrZc1P32elvt67ptuyaOoUyYhCAVsv2o7eaq8BGJudYL6BkIEXOUdq0JGi/jyyE4GQ01iSr9qyJyLyj1oFVjl1F+Ah8+hmYYVZ4mFTmdcBqyocW7+jaOXnQSSdQIqxz/V7PcbweZf78dSp9yApQxwBC7TwvOiB4z8/cTATGZHeU8dasTRmS259JsMZ5pmFWL89RFs8BhwKVMZBZYPrvv01SlcRaT0+qFjXvcP4pmTeRcSzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/p2m-pt: fix p2m_flags_to_access()
Message-ID: <2ec3fb93-5b91-15d0-4769-adf414af86b9@suse.com>
Date: Thu, 2 Sep 2021 09:01:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:208:14::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd5acd9f-2fb4-4565-b91c-08d96ddf85a0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71513AE6B5666A7FED7FD17EB3CE9@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N9Rmf4qgpAwGvEOWd0pbMrv85qMp/QOUoLk0i/IsWjLIY7Mu14hvufIYYsIff0HYZ3+wW7UL9rM8HNd0hzHiakjz1KINuP9uJktc21yOR4Eve5riUQff4r5aBEhesAeNzGH5SReLNTvwahb1YPEhbW9hx5qQczrko4wKAMKqQRUWWaZuprLKfTgT5wol+0mAwbptBPU91Da/KdU+kj5KmykWx8ORIzECAQOUgy4qxO1kSpS8pnIZrJyCXVqiDbmZe4k4jEyJwmWFDLejeDDAL/y3ZGyED2U6fyXFKtb68AfhnUrDzpr20x+byMGbiGLq4DOqOBwPTiOLgCzPkFSpJMRK+zPv+BVgi21FPmffndYOvIFOusaUjXbtzl0V6g/kzq6mDFV6Ck7r1lygOkVOWcVGSoOg7Bxtty2z83R11DFHUcRKOf5DyF3U+0Gh3VhClJTFFGQfMx58TS6YvfuxbU8+mXv+fyW3CaiPhmZLktCQYuSEP5U46DTMWZDzOo6xwrMc9/MiTiE0snTmkl2YTLdOzrrSkXGZfxbmM3prOj/aRppRpKF8EDwMgOarWiHSw+J/DRDZziK8ZsHTPDRPcTrTyIgbiqkprcC1uQgFI6HJMQY7fVInF+c1PKeDKmu2DeoaMr8vAUy7eCyBNXLNm1EaWxm8ohwxEZXJSnXyYC9lj0QyQLCBat0Bsvs7LLgxEOpbXWiQjwv5Qjzp1X2MjNIshOW4/Ep40eIo3iEJGxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(396003)(346002)(376002)(6486002)(5660300002)(83380400001)(86362001)(956004)(2616005)(54906003)(31696002)(31686004)(6916009)(36756003)(478600001)(316002)(16576012)(66556008)(66946007)(66476007)(38100700002)(186003)(26005)(4326008)(8936002)(2906002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azB0YlpoQm91WThOQ2hPRHZmVTh1VE5uMFJjempNOGpwL3BpbUxUOUlaMmcv?=
 =?utf-8?B?LzI5NlFPSTBEejZqemR3bDB4d1BKa1dQME9TdVA5dTFZRXNuWEMrR21tSVFH?=
 =?utf-8?B?anNQZkJPMXRja01TeHNEWktmTjgyQnRGQ3VEN3hSZ2VPWm9NZmc0NCtscUVx?=
 =?utf-8?B?VEV4ZmpuNDRqb1dWUEp0c0FCcTNuTy9iMDNBb01DcHJQWmpEVFZvTi9sN0Fj?=
 =?utf-8?B?UmVtRTdZa0tSdE45L3lQdGxqSDRpUUNBSDVFbTl4c0ZBb0UwRkZoaThSVmtv?=
 =?utf-8?B?MFcwRHFUQllCcmZlN2g0c0diNXFadjJlM2kxMEJvb0RFdjZteW81L0s3dUVE?=
 =?utf-8?B?K0t5M0lhbllFNmhHZlNwenc1NnQ5UWJwWG9zZkJkSVBMSzJZQlJ0UW5RbXVS?=
 =?utf-8?B?RngwZnhDUHRCVVBzTlVOSDJ0elE5UW0vVm5MN3Y4U0Q3dkI3UmZHb0VyUVd6?=
 =?utf-8?B?S3UxVDRXZEt5RHhpWTlQRkVrV3dpWURmbzk5R2dxNTNSc2lROGtDbXNJRHVY?=
 =?utf-8?B?bEVrU2FmZ3lWMjd0UzRTRGxMd0IvOVlCN1JFWDJNckFTZm1FV0pMT1ZCVHQr?=
 =?utf-8?B?Zzh6aWtuM3I5cktsdHZzandQT21pV2ZkU2duL1QzTWhnUERaZExaTzl4NnNQ?=
 =?utf-8?B?QlpPVHowcUNjbndyT1BwZzFyV0ppTjhZUnUvdjVjb0p6bGxUN2ZENGZwaG9r?=
 =?utf-8?B?TUZ1Z2tlM0pRTEFYQ3JlVkpHTWhRdEtFNWdmVjE5TS9STTRiMnRTcjBqaTJ2?=
 =?utf-8?B?bUFZbXJOVlRIanFXZ1l3VmYrSituejlLbWFJOUErM1BlODlmVzFNc1liUWpu?=
 =?utf-8?B?QmVMQkxvQ3AwTEV5UUw0VXp6L0FEVDJ0RzJsOUFKNm1zS3NYVHIxYmF0VzR5?=
 =?utf-8?B?SUEwMjNlRXVoVzF5NGtrdkNJM0hocUNXTzVlMVp1aHBNVnk0cmJOMDB5MXJV?=
 =?utf-8?B?OU9QTGVsVW5VQkx1YnMyUElJYzYvbkxBaTVwQWpia0dWam0wZGcya3hwM2Qy?=
 =?utf-8?B?K1NoRnB1VGtyVmRBV3JzOEVGWmtQRnJ6ekdTSlF0b2N3eWc2TVJSOCt6c0hy?=
 =?utf-8?B?MU5pdWtQbENpdG1YZzBYWXgraGhIVEh4NXdFOE85QWJreGl4eC9XbkhzU3Yv?=
 =?utf-8?B?blAzWkFLSlBOV2FkL2p6a2RmR1orYU9pR205QVgxbTNBL1hGNXB3V2padGFM?=
 =?utf-8?B?Q2JZUzdCd2s1ZTRmbmcwL3p0cm5Yd2FFUjFGTU1WQVVZQ3JxLzZlNzdGV3Jx?=
 =?utf-8?B?S0ZYVkdFdnk0TWorbDVnR1BMMUFTK1REeXAvdFpPa3lrUDdMSFJsUFFKME1y?=
 =?utf-8?B?OFZsbzNaSE4xVEhma1ZZWkVQTk9mQ2pQR3cxLy9aWW9tM2NZVkp1bTUvQUJO?=
 =?utf-8?B?T2ZTN2VRVEh2T2xxYUxxZnp4aHJDTFkvL1ZET1R6SEE3eklkRXBkVkQzVnN2?=
 =?utf-8?B?amxXWmUxMUcrYXd4SG1OeXNyZHV2c0lqUVFTSi9QdDd3Tjd2M0o2cEpmbkVJ?=
 =?utf-8?B?QWpyNC9Ca3NNaWNCOXNaZXg4MlowdTBTWVpXNWszY0MwNHhOYUlVTWlyUVM0?=
 =?utf-8?B?dXlZK0I4clhQSGl0WmpYYjlpbmtXQW1maGxmMHJzNlNKMGlHUENBQ05NMzhm?=
 =?utf-8?B?eHZpaVpPNFA0Smc0dHhkU0JBOWNSTGs1TDd3aVBHdWFpQytTQlJlMnNhcmY4?=
 =?utf-8?B?dFFLdVZpTkJ4ZHFEZjRMVVlaUStSUWZRT3ZjUlRBa2FmMmM0Q0tNMUhhenB2?=
 =?utf-8?Q?4S3ob/DlcQOh1LqZRns70TEGq+qG13/O8WY5rdI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5acd9f-2fb4-4565-b91c-08d96ddf85a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 07:01:43.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RIxMwgIb1xSBrHgKfR2il+Ua6kz7tlEfwDWWrxlQNY9xBjo97EMDWwzH+z60sdiJHzlysMMm5OdVt1R4Gpfow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

The initial if() was inverted, invalidating all output from this
function. Which in turn means the mirroring of P2M mappings into the
IOMMU didn't always work as intended: Mappings may have got updated when
there was no need to. There would not have been too few (un)mappings;
what saves us is that alongside the flags comparison MFNs also get
compared, with non-present entries always having an MFN of 0 or
INVALID_MFN while present entries always have MFNs different from these
two (0 in the table also meant to cover INVALID_MFN):

OLD					NEW
P W	access	MFN			P W	access	MFN
0 0	r	0			0 0	n	0
0 1	rw	0			0 1	n	0
1 0	n	non-0			1 0	r	non-0
1 1	n	non-0			1 1	rw	non-0

present <-> non-present transitions are fine because the MFNs differ.
present -> present transitions as well as non-present -> non-present
ones are potentially causing too many map/unmap operations, but never
too few, because in that case old (bogus) and new access differ.

Fixes: d1bb6c97c31e ("IOMMU: also pass p2m_access_t to p2m_get_iommu_flags())
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -548,7 +548,7 @@ int p2m_pt_handle_deferred_changes(uint6
 /* Reconstruct a fake p2m_access_t from stored PTE flags. */
 static p2m_access_t p2m_flags_to_access(unsigned int flags)
 {
-    if ( flags & _PAGE_PRESENT )
+    if ( !(flags & _PAGE_PRESENT) )
         return p2m_access_n;
 
     /* No need to look at _PAGE_NX for now. */


