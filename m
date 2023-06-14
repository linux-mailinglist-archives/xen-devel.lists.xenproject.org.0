Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8036C72FF3D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 14:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548741.856855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Q5J-0008CJ-EH; Wed, 14 Jun 2023 12:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548741.856855; Wed, 14 Jun 2023 12:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Q5J-0008A4-Bm; Wed, 14 Jun 2023 12:58:49 +0000
Received: by outflank-mailman (input) for mailman id 548741;
 Wed, 14 Jun 2023 12:58:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9Q5H-00089y-Un
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 12:58:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32f30d15-0ab3-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 14:58:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8368.eurprd04.prod.outlook.com (2603:10a6:102:1bf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 12:58:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 12:58:16 +0000
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
X-Inumbo-ID: 32f30d15-0ab3-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6eutXjqWIUhrcsHZs8i5gIuQik2phOChUk/iYZvi2/LQB8PRdv4YbBcCAc1+mm3pvSorNDm6rbjwuydYFC4QxK8n9S4x1fK9qQumIvdXfuvHGRb9ZvAsZzYCSSuZbCXqXvqneUbR7sGPZM3f37S3MnzrYpsWWz9JeyslCkxqR6SThj1v5b3fTAcSuWBPcn1SASDvvzWUL9CEC0PiDMLvIVwxUP/uTG7+19+yGANApvgOSnzrrXkSdgHBRDyA2kaQWiugkmvjfN8JHOnjrEKafqNug5Bl3lojh949BMhqXd1lHHttPkyXDbgf9cxF0z87AnewCPyL3oSuhW4Ql6vHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C31FW8rDQZ34AXSmE05cOQ8VaLOiOmCoIwOGo8ckfl4=;
 b=cK5GPI7HmWkvg3XW0rRCfQkybIUn/fJt6p2ZCGOB44M+3LRHZVYuB8ddQ3Yi+J6MA1dvb8q1wFEuDrKVhC7cKKobLVB36R9BVhU7Ca4LktOlEDkbnZ4kaftl4icohNmC1PjV8GLoNL+AGT54PuI4N2w8uO2rmQDekeKmWZCFxDahV9NxS3UjYVfOmQn1QljS4CAHT3SXteArLN0HXR0ItGB9r0wjdbhquyUzYqRK8CvN15YjAW4l39ckJ6FQy3CCo6CjB61Ng8hOLpViaYMdtdGlM6MCzlFuGNf9FafHwLllE0F3gyCuJUORVPro4Sa9t+J6j4M7K8RbBt4UZF7e5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C31FW8rDQZ34AXSmE05cOQ8VaLOiOmCoIwOGo8ckfl4=;
 b=LcVuctrCLQsRX/RkV7o1vtDAakETZNotW8zbUn13PLA5VVgMdObzEwwDptupr6Ud3FwV2R1M23xrYDN4NHT1H8DG+H1NoScFnVq8i/eeBQfVt4/tpKNayrsAtV+vRT5euCpo8UBkCarIz/v/TVTgJFgW+jOgDzUWhSInIgclgJdwRKwrIby1rmlFjD0fiPWJh8nDb6fOg6+ZKqPtLIWHIB0EGGt6psMtBX2e24BIRUFFr4UHWv7vy4T72teup+LrRy2FxkFbc2uxArcNSnHY4Mw25CubG9HEhiHQ+o0e3fKlQ3FpTTATlCHM+zXkV8ZnmFyjBSF+jvQQpT0z39NoGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c12e29a-ea85-b216-fedd-a8028a82d3ac@suse.com>
Date: Wed, 14 Jun 2023 14:58:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] iommu/amd-vi: adjust _amd_iommu_flush_pages() to handle
 pseudo-domids
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230614083236.64574-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614083236.64574-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 903a78dd-117e-4b4e-3fa5-08db6cd704ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IUbOHQEMZBk7nWn/eyZN8N3apLBD2b/w2w3TeQ2gT9jBS7+yquf6SwbhY0pvdkA5Vn6O+Mc0/x5aDpDkXKVOK/FVR2foLf/g4X35PQOpQSzxL7rh5Yl0i6FllA1QFVmblA2ebFTlWB7ZCdoPawdc1raqInQJSnhVn2bApFmkZxeobP7bVe0/RLDf996dlMk8xiCEzLvQY9xU7EL/ztNKDWkiACZ6e7uXxNSQhY7c2Jh+LpV8N0FIYWsMuZyckCF27PnMPWRLZYFl4u7/U4FSdJxvX18mAcb3wdjlopdAlLGa0MIM2iAMj6MA58Wj/adTMw6t5m6FzgNUsmVMaG8vDVblU1PMnwi5MD+7QU1U+NExPQtszDfQwC6j8mFV8xPGZNgjn7dxQK/JlFBWJlzGBshi/2r9OioG+n9i5C47v+oglJtJ6Wi62aORKflynUYepP8fvxpVjZAAy53GYEGzSGvkqFsJVpzUl0bsSBbPwY0pYgM8OHFSNQn9nAeHUEFVh/3KzCLbmJpaBXPUdvzr+9Ub6PNRRxqi2HWAd9n5bXYcqrs+eywLLyob+LKFjomEvTbs4Vnu6znLHflGpojzlwboDECGQO6JbuRNHtlOam1s8Nv8J3DL6AmpJXJwpGKQxBCqkxzrQht3GZ5NbA6lKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(6486002)(316002)(41300700001)(2906002)(31696002)(6506007)(86362001)(186003)(26005)(53546011)(2616005)(6512007)(38100700002)(83380400001)(5660300002)(36756003)(8936002)(66476007)(66946007)(8676002)(478600001)(66556008)(31686004)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmZ4L1lIcDVHQlo5TmxQQTl4NlNpYzc4WkEwUUs0dUhoTjFtNEFrNDNrcDlJ?=
 =?utf-8?B?S3VmYXFxbDc0U3FMMVZoc1EyOUNtbHFhUDYzbUVjN21hd3Z2bGE4QTBMNUcw?=
 =?utf-8?B?L05RYllBVnkzTksvcDU0NEczeFpOdWl6amFhQ2FJc3ZQQU0yTkZBZGZrZ1gy?=
 =?utf-8?B?WXZyc0tWMXRaYjNibFFrRi9mUXFHYWlqWjVrUXdPbER6MFVoeldoQ3o2am5o?=
 =?utf-8?B?ay94K1MwbXVTU1Q4VG4vUzRTbHpnM1k5WDQ3WVM0WDBZRVRZUlFNS0ZWRVhL?=
 =?utf-8?B?S0dkMWk4ZGpDRHNGaU91b0JndzZKZHR0UDNUYi9hVDFYb2M5T241bmwwdi8w?=
 =?utf-8?B?RnYwUE03K0VMVFo0dGw4WmhtZHVjRGZYUk9xcFFZWThmR3BTMTAxMlkyT2xh?=
 =?utf-8?B?bWFndmZ2V3BQdml3OXdQcFk0SEluU1pIZFJqdVh6SFpLM1ZPVnh1VmtLN0ND?=
 =?utf-8?B?dE9zVUcxWHBhczFYYXNIb3Nicll1SVM1TFczNTJKTndLOC9ERmkyVG5VM1dC?=
 =?utf-8?B?cmh6Uk5SOXhrUkNrcERzb3NhRkc1Wi94ZW1zZ0RtZkZOZG9kRVE3WUZSZW4v?=
 =?utf-8?B?SjROeHVmUFExOUhXdWc1QnRYNmRVQjdsdGpjME5rcUtySW9UT2dFd1QxbEY5?=
 =?utf-8?B?WEg2c0xrK0tzNnY2a0k3czcxaGFKMjhnMkhka2UreHVkQzRnUjVab3lsN1da?=
 =?utf-8?B?cmNsWUFBT2pQVjIyVVROV0E2MXJQSmhnd0M0a0NoVmowRTMzZXFmQUFxTU5M?=
 =?utf-8?B?QzdkMnQ4aTJOK0tGTkVKdXhTbzY2Y2JLcVo3OVRaOTlMUTZBYlFnclVGUlpI?=
 =?utf-8?B?Sm10QnhJOGltZ2xQRHdzdmR5ekJmbEEzY2hqbnd4RTF0RWJzcGFhREJkSGNG?=
 =?utf-8?B?YW5KVGF6RnhkUnNtWERIUVI1MU80cGl3bWloeHRuL1JUOTBkM0VMdzltOUQx?=
 =?utf-8?B?WkNteHZ1U05MZFRuUkJsRUpCU3c1VzQxTGZJR3dONTEwaE03K3g2TWhqaTUv?=
 =?utf-8?B?QStVUGszL2hnSzR1UkVFZmtLTDg4Q3Byb0czRVAxNW55U1pHQXh6SFU3T2ox?=
 =?utf-8?B?dXZFUmErVXY0NCtaei9ydWVGb1M5VzhVeHUwQXIzK1RBVHIzQlc1TzMzOExX?=
 =?utf-8?B?VHBDRGdRR2xValpnaXQ4VWlibnlUVEpudDE3RmQzRlRjUTRxUzdjeHUzT2Yx?=
 =?utf-8?B?Z0pxaGpvR1Nvc0d0OGNTN1V2TlJLbFFxd2g0Z3pEYzg1SThjaHRoQ0x2NGNq?=
 =?utf-8?B?TEtUN0c3MnVUN1hLUDdNWThPejRwTkpqdmdRd0laSlZhL1dDa0pvV1laMHhN?=
 =?utf-8?B?ZGNFZTdJWWh1YjBjeDJjWFRWV1E4eEZ1M0trY2hHYVpBMzJjSHB5aWNuVjgr?=
 =?utf-8?B?UTNNbkJwMEdHYitnQXZ0SndQaHZvOG40QnJSYWlLTEdhakZ6NXJqcU5LdWNH?=
 =?utf-8?B?MkNNS0xLb1dud1VWdm5VS1BUSlVHUHpGYWRabWs2RDJjNHcrR2NINXdxZXVs?=
 =?utf-8?B?SzFoSFY0a29yRkZMV2lpbHhWSGxnNXgxVUlHY1VlSXFQSTRLR2VXRHpBMGNT?=
 =?utf-8?B?L01hTTdRQ1lGT09DQTc1MmV4QWt4NTF3Z2E3N2dhU3lFczA3cVkrTXNuSVg3?=
 =?utf-8?B?K0FtVmwvSmxVQUZVek1FZW51VUd3M3duaXgySGMxYzk2L3pLajcxVWZHLzAr?=
 =?utf-8?B?OUxXSzF2L2Y1cE91MXlqbWhkbVdpcnNYeGFWSnFxWWROQnBUK3ZhZldrVVRL?=
 =?utf-8?B?WUYvYXE0R29icnMvdndIMVBhS2h0NlEycWVlUEpnVTZPV0U3SUlVWVNJSkNY?=
 =?utf-8?B?VkNDSVFGcjN5c0tBRFVNZzcyc3ZTM2UzaVBRa0FLSERVdTJHZk1mZi9BKzdC?=
 =?utf-8?B?cXkvSm5aK2ZVRWE4MkZFWWQzK2k3YUVCNlZLRmFMSVJLelpZUlE0SUw2b0Zw?=
 =?utf-8?B?b2xvdS9iUkxIZEdiTkxsa3BKelRxVGVDdjY4WUU3MDB6YVBFc3lxdzNKVm9M?=
 =?utf-8?B?NlhDcnpKaUwvSStCdjc1QnU3Uld1bGl0dlB3VjE2cGMvM1RLWGhjS1hqT0sz?=
 =?utf-8?B?b1piRkszejczVFF2UWp2cTJZbml2ZktrbVhjcWN4VStPSTBJNUpqei9ZOFAz?=
 =?utf-8?Q?dJ0cyxgoUSNeqhK/o4dAccsDW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903a78dd-117e-4b4e-3fa5-08db6cd704ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 12:58:16.1217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSuu8I2fBtRSb1zSrY/Is8xShML3wP+9+WqhpBNat8vlRqqrFwSkiAatxJkxBo7XeT1/T7QmeVbbqdqcFWkqBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8368

On 14.06.2023 10:32, Roger Pau Monne wrote:
> When the passed domain is DomIO iterate over the list of DomIO
> assigned devices and flush each pseudo-domid found.
> 
> invalidate_all_domain_pages() does call amd_iommu_flush_all_pages()
> with DomIO as a parameter,

Does it? Since the full function is visible in the patch (because of
the "While there ..." change), it seems pretty clear that it doesn't:
for_each_domain() iterates over ordinary domains only.

> and hence the underlying
> _amd_iommu_flush_pages() implementation must be capable of flushing
> all pseudo-domids used by the quarantine domain logic.

While it didn't occur to me right away when we discussed this, it
may well be that I left alone all flushing when introducing the pseudo
domain IDs simply because no flushing would ever happen for the
quarantine domain.

> While there fix invalidate_all_domain_pages() to only attempt to flush
> the domains that have IOMMU enabled, otherwise the flush is pointless.

For the moment at least it looks to me as if this change alone wants
to go in.

Jan

