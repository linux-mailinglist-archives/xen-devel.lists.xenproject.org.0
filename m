Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603F3E5BE3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 15:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165384.302254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDRx1-0001Sn-OL; Tue, 10 Aug 2021 13:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165384.302254; Tue, 10 Aug 2021 13:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDRx1-0001R0-LB; Tue, 10 Aug 2021 13:37:51 +0000
Received: by outflank-mailman (input) for mailman id 165384;
 Tue, 10 Aug 2021 13:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDRx0-0001Qu-HR
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 13:37:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3336facb-bd71-4f60-ad9e-948f74a7598e;
 Tue, 10 Aug 2021 13:37:49 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-oPoN_r9jPiOQFaLoQoldYg-1;
 Tue, 10 Aug 2021 15:37:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 10 Aug
 2021 13:37:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 13:37:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 13:37:45 +0000
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
X-Inumbo-ID: 3336facb-bd71-4f60-ad9e-948f74a7598e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628602668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8BBexWQ+PyfmhndQCiT/AdDLomjgszk9QdE+e5xhB6A=;
	b=CgZfZdu9xDgKZ8UAxu6tEFQPuzG58glQuuRI63zmOastRWP3De3z/2fy4AWNRGDsYWJXPZ
	kwt/BNktQL1i7CXw0W7Wrq3ufCVv9Fgolp3dUfkVm4WpRSohX1zUlXZFz2Jlzg9HRXJe/y
	hnpvasvZYDlQNiDAPzcPs6iVWUSnHIw=
X-MC-Unique: oPoN_r9jPiOQFaLoQoldYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAfIhyiZxGw83fuK7ra2IIZRnjBDRX5o77fLBrMK9Nbqb2BJYXEEc+IToI6awW8bx1k6ttwjJ5y7ItN/JwmqAEFNnOsL014JHVLUAxCQgLZV5B1lO2LBlpDAeT255Sv2FJw5KtQT9YLwNd7xXbxDgw21/GSGwBlEY03sTJN7H0zTnKSnaQOxxlrRZ5l5she3N+xc9CP/CddsvzaLNupszVEU7GzzMvQ9M8AoEvQ4aUmUy2MBqaunO0grO42av5DfKnXxyVtDLTrgWae34D27fpz2shIvcln2VKtuY2GAPEuPZGp++zl31mjGpbMORCvgTsKOhgbCb0W/SPu8wgbBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BBexWQ+PyfmhndQCiT/AdDLomjgszk9QdE+e5xhB6A=;
 b=W+WGnw3p/vbX0984MZZvElRpHjcxV+RscJuat+3IDdnwoosIUo+fldSYwXtancoU65jIeOFI7dl/NkgcvdKKFYdoHfirWV1Gu0kpvbFzRvsqCU9SjTgYtr9ajSNLaFeTKVMoJ1b4Tf/c6SOLf8Z4Y1/FAioGyP/gewWB9bPHEDpgz9qQGZb8HX4cT1iZclGSYIlhEul8iZvU4yQCpQvmnnqqqELfXFRHvQdsoqFfe4gfv1RuGZQfPBoN8Tt9XdxBKZ5aAY6MjyT8MR0bitTnPJdidTFWuemx4pRaEBR3qLjc96gC9cSkJmVyv2VE9YK+NtWC7Nn/nzUxepOyltIpmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: IOMMU page table freeing
Message-ID: <d1aa9fe4-870d-8a02-9cef-af1be617252e@suse.com>
Date: Tue, 10 Aug 2021 15:37:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c07dc0f1-ff06-420e-b9e0-08d95c04096c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB44456A1502F9CD3C4A331AAEB3F79@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QxJ3LJw+kCTWiG7OXO3dxNV3WDQLvoILhpMb7jc7Mv85k1oaqp6+aznycwJ3Q9vPrWs4vH05x3doyYGsIQ0vz/nbHhwogcM+0WJS8bvyNcC10u7woLyf2O1K0r1eH5+cM7+4cacMJPslbGmWMixnVWPyW+/QJkmu8oZhYqChkjUiRi1eTPnDbE27AYfxcFlA/g6HN/1KG06tdTAAYjKB9Q0KE4kAV2QQN9apgNXyKhyp4/nG1D6PLvaCrElnavgjaoK25v/2gTzmmDAX7AuKDSoA2VFIQKXd2Wzg2aup2Ol1JQ7fJDHu0cSCmIkWurrI4P4UBDkkC3bUi6EiIb5bBdSf5RowowUsUtsUhBcTbS3psoB+m/PWTmSA6mEVtYyXFQxZY8ctwK7rx/34EdFURybOVQ8J9cF5Xk7tn6yk+2KL0ujPzuuyLvDA3lLnRz8Gb9R2QijBKKcLe3yUYWUZRqophx8p4atKP2gfbx8aO5Wl6AdPmKhXxiIRSbpBQL6qWbCEs2YEianz4OOK8gWs+e/kTxWYfFMJOzB7ln86VeMw0lAM098tkxsIhxW5H1rDnR/cudsG9LczSPp8bR8JgLOg/KUK/VFTVn/C1coUplwFO6K1jF2QZ0XQbiDgBa1LPgcEqu34/xcwhj4iFm8vIPVW1IfGsIhQ88u6PNgK8wvhplPzKj15T2rB6tjfQq3sdIPJ1noHfUpdn8UtJuwdWfN6NKg5isxnmzngR99HmVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(31686004)(508600001)(66946007)(36756003)(66476007)(66556008)(26005)(2906002)(110136005)(2616005)(16576012)(316002)(86362001)(31696002)(83380400001)(3480700007)(956004)(186003)(8676002)(5660300002)(38100700002)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnRkSWhMVXR1OGhRVmZFU1VmRGRtcFBvTlhMdWl3Y0VXenhtQk1IeExLT3du?=
 =?utf-8?B?UkVESmc0VUkxRnhGN2w0QTRoTHl1Z3FUVHBkWHFPRkVHcXZwOUNjalFVTWts?=
 =?utf-8?B?MkRTclVidy9ocENDZnFHUW54RzZpVjQrVnhGTDBJaDNmU3pPc3g3dUE1aUs4?=
 =?utf-8?B?TWVzVnh2alpFUkVGcjFOWFhwNUREOTB6NDIyaUpMRVZ4NGMxekdFb0hEVFBt?=
 =?utf-8?B?bGQ3aVo0bEJSa2N2ZnErN1o3b0FYYlhOcWF2YktlbWZVUkdMblIyK1dISDhE?=
 =?utf-8?B?NlJCQUpwaS9iQXFrUnRrdWl5YmQ4WTFBSFpMNFhmU1NCOThkaWt3dUFPeXZ1?=
 =?utf-8?B?dk5VOTVMRDAxNFJxQkg4MHJ3UUkzNFBJcHZ0N1o1ZDNCSEtINVJxVUtrTDVl?=
 =?utf-8?B?SmhCL0V2dFQzSFV0UnRWamtZb0dvbURqMWZwOTFRY1dRSUVKbDQyd2U1eUxX?=
 =?utf-8?B?aWNOOW1MbThhai9udCs0NkNQMi85Q1FDMEFjSEdsb1hoZ1k0T2w0MVU5RXBs?=
 =?utf-8?B?TVk5ZFJRT3QzaENoSE41TVd5K01ZL2VKZjc2TmdXS2twZ2MvZno0YUdCa0Jt?=
 =?utf-8?B?alNRaytYcnV0bDRKWWdocU5ib1ZMVjFhckhxYzlyLytPVGYyeFVjRXhaV2ln?=
 =?utf-8?B?UmtuZW13c29iRVl1S3AyUFY2b2w0RUVZZ3JDL2lFeWhmUEJOSWc2OTBkTmc4?=
 =?utf-8?B?TUZqSFEwK1hXSVkwbDZCOUJXd1dEODF5L3BqTXdqNFBUU2RTQ2lrb2NLTDhp?=
 =?utf-8?B?ci9zNHlzRlhqRkpWUm5kalBkb3ZtdFVzZHNHWVJUcnVubjYxbzIwNU4rVWgr?=
 =?utf-8?B?YW9La29WQmxNVDRmNHZYd2tJSkt1SkxrT2p3TzZ4bDJxMGNIUVF5d1luZFo3?=
 =?utf-8?B?ZjgyWmxuR1FwTStsak1jZ2NJM1dJcnRrdER1VU8ranhNa0NoaUpIeDJ6M292?=
 =?utf-8?B?NEpsbzJyNm1zc2tQTm5BVDBMZ3JlTnhPWGEvUk9mWFlVMEgxZXdQeklnYjVD?=
 =?utf-8?B?N1M0YTE3MDlqejJTOFVLVFZvWWM1d2hMV2w2T2tZZUxDNldYUG9Tajl1MExz?=
 =?utf-8?B?bDU4YlFBVjAwLzRydkIyUzUza3FtWmFqd0ExUHBCTXV5aldkeENrQ0MxVFV6?=
 =?utf-8?B?T0Z6emx4QkFkMVZuOU9ZR2JnWHIyckRLMlhKZVF3WDRxQVVOSXJzYm13MzJj?=
 =?utf-8?B?THhOZFAwNkVPcnY3TVpSL012MVpON3pJb0pxNWcrUzkzaktodkhjWUNvdGhs?=
 =?utf-8?B?Zk0rVHNaRkxhdVRZT29GN01EMFBvMFNGN1kydGdYQWpBdkl5NzNGQVpwRnhj?=
 =?utf-8?B?UDBrT1A2WnNhb1B2STN4c2tjUlBCTllYMGhieTUxN3lMK2VzN211aUZ3RW9o?=
 =?utf-8?B?dFdCZGJnT3Y3bW5qOVpYRVA2V3JEQzBPb3ZGQW9SbFJyVWIya3A5eThNNmFK?=
 =?utf-8?B?NGV1cEt3dEVSUEtqVFVMQkFFL1FmSHVleWxwWm5mazB2Kzc4WmFaajNHTHZW?=
 =?utf-8?B?Y2UyZTBVV0RxOTBZMDE2bXRLTkJHNDJTMXgzTDlveFB3cTdMZTl3T0pvUG1U?=
 =?utf-8?B?MFV0ckVsNmtCbXFMWXlkelB0djU0Q3pMQ0F0T2FhUU9HeTlzZlROSW9NdXQ2?=
 =?utf-8?B?YXZ1dDc1eUpkcE05V3NpQjFlbEoxV0hRd1NwWmJtcDFrQ2FOcGExSWtyaTBl?=
 =?utf-8?B?OXFDMGF5NUlQQmZvU1B4MEwyQmRlOGFicWRnZHBNblB1OG50dzM0ekU1WCt3?=
 =?utf-8?Q?p0ssauqdX3T3N/PnLLVeoGH/v9Jh11egQ+qQHi5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07dc0f1-ff06-420e-b9e0-08d95c04096c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 13:37:45.8600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljsj5bYeCC7Q1xr43nYzyNkAs//1xTV6Xt2P4HtQAEMgNlYmeMyWt9e/mYU+YociLEPElwawXU+OEq8OycToUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

Hello,

while I don't expect this case to occur often in practice, for
superpage support we will need to be able to correctly free a
page table (hierarchy) after replacing its mapping range by a
superpage. Following P2M by carrying out an immediate iotlb flush
prior to synchronously freeing the memory looks, to me at least,
out of question as an option - the latest when considering ATS
the flush may simply take too long.

Making use of RCU doesn't look like a good option either, as
this would require callers of map/unmap + flush to enclose the
whole group of operations in an RCU-read-locked region. Yet I
think we want to avoid to concern callers with details of the
implementation of the IOMMU operations.

Which I think leaves deferring the freeing to a softirq or
tasklet, of which the latter - to me - would seem the better
(easier) choice. If you have any alternative / better suggestions
I'd appreciate a reply; ideally you would also reply if you
simply agree.

FAOD I don't think I want to make an attempt just yet to care
about the case of flushes getting carried out asynchronously:
That would require a means to signal to the freeing function
which prior page table pages are ready to be freed. For now I'm
rather considering to merely accumulate these pages simply on a
(perhaps per-CPU) list, for the tasklet handler to consume.

Thanks, Jan


