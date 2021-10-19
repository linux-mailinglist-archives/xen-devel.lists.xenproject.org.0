Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD243349F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213045.371144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnFj-0001zk-DP; Tue, 19 Oct 2021 11:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213045.371144; Tue, 19 Oct 2021 11:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnFj-0001xf-A4; Tue, 19 Oct 2021 11:25:55 +0000
Received: by outflank-mailman (input) for mailman id 213045;
 Tue, 19 Oct 2021 11:25:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcnFh-0001xX-Vb
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:25:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5163126e-30cf-11ec-8310-12813bfff9fa;
 Tue, 19 Oct 2021 11:25:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-CazR7_knOOWTS7Jygwp5Nw-1; Tue, 19 Oct 2021 13:25:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 11:25:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 11:25:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0041.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 19 Oct 2021 11:25:48 +0000
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
X-Inumbo-ID: 5163126e-30cf-11ec-8310-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634642752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ga5BNlOutqG/yZYHaC+o3yjkXEU0eKgcGY/4M3UFTZ0=;
	b=Iijg160AxBIE9UWfYuDDx9Ogbd4Wxhn7uyb0IsTzww520P6Bqdv2IOBurBtPgekqO/LPWs
	Hhp4CWRCdrEmpGKY3SHDuzh2eyvBq2pD+wDQT1h/iSLIjgSa6rFhXGk6NjFxaztzvKdFGo
	QbR3E0NM4erf3VXRpgX3pNkyiTHK1O0=
X-MC-Unique: CazR7_knOOWTS7Jygwp5Nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9nquac0T2BEmGMFm2TgYGW05DBsJmNzTsMJ2dhqkFSt6QM5mavR37+9nHWBFfHbQ22wt6yhBCWzND3Sb31McQ8yBM6WwnvR/Gr49g3SVWATB41i8/brQJppYpb4brtLS9UR2bguhFnD3y4WF+U+79WKAVxNPSWotUrOwKV2GyirIZfJVZ95OrF1FHhr8YMXGoBaB9bD1ntk1+IIqbvNCmzUCZED7maz4hJSd3RWMr+8nN3o3bqw+XevUweoRBO5Qk1siOnxtwXxSk79LzLzdSSXuRw57sBf16Ko3TVdOZ/beZasl7c+DNbh/YALpHwkrcjXJwtur5Bo0FHa2Gqozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga5BNlOutqG/yZYHaC+o3yjkXEU0eKgcGY/4M3UFTZ0=;
 b=NpQnGCsLX4EzuFtNtY8E04wVTDrsqZ4VgZU2C1xBY2+KnRf1O6OUDbLVhs125z1szQ4jSTb8sPgvBfRmxYpQe3SXvyIrE+K9thP8+nMsbgNz0x9s+z5THbFFmqLOc1YZi0qa84zGC1q2sDfI1DrT7Z6D34WYEfbs2n5Kn2pqGtLqCH5BzB+4SvxmEArR4wY9MJgu0ziqA3sehc0PlBMDOHGT0iWbeaYTQtBT+ghgvsCJx2XAk0gfQ7DNmCdNqL22LSGxno5jmSeC4dfPgRiqi1GzaH9Rn/TXGl2KisV1b3c8PomaMpmuDlKAy2OjaNjlnWpFuUjITa34MZfkGwRm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, sstabellini@kernel.org,
 Oleksandr_Andrushchenko@epam.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <24942.43034.758402.850001@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4471eef0-5dfc-876d-5f4b-e5b163032210@suse.com>
Date: Tue, 19 Oct 2021 13:25:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24942.43034.758402.850001@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0041.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd51cc0b-d37d-4bbe-2e9c-08d992f3337c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377580A94D19B3034E6A664CB3BD9@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	slXDeyeB5aiQByNS4MKifCXftAt6oLjsR2HG/pMx8aGMT9I0CXsharHeN1jUIs9Lpo1UqNqo4SMmjb3pavfI78W8+VDus7UNYHP/vQSoeoiffwgpwPyxZoWka9DHTAIfxk4TwaV+r5JM8RrWNnVQkTd4zujYaFK1Eel27yy3aiQ++oyWdykwtMBdKztdb9kUbJoOWrM/OZE5AoRtSCPSAR62mPQ9/dzuuq8YFd+NtnU3dGyDczibJQondkidwsOIdf1yudj0We0X/Qj2FIZ8xB9bo1xXAYKm+rvBM31fI1fG2Iwlu8Zft4MSgLeIKkKnelHLIG4MCsoq23TsK3gzG2vV4+3Q4JOHSZ5dqz3+0dcelA6hnovX04SYtZ/1aSTKVCpzI5HKAZc+dyUSl7HKgbA4e6huQTIqa+K648gCCX0pfi3fb5GUU5QxVOlDfn0h2CV8r/+sYJ79ygzfA7vLwt1VHYvas3gxnvippz5Jl3oliH4C0ugraKIYW6jKMOOFLixWKIG8JLPdYHan1EjfpQu920wZjyLPAvceMMRpeKB2n9Xmos05dVeadug57HDnqiVynh709BSlI4fSW8s0S0HazHtB3nmEG53nd6I41B0H9lhgfeRSzw7pSy7c0Um9EBybnZsPTwGwxAdHdCLjYxb3SkH/vtNesR1smIiL/wuazae/NP64oxPfxEBcTSr6HJw2btAv2PCSywojd3EbiD4GmzYSYr5THbPXO7HYx+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(38100700002)(54906003)(2906002)(66556008)(5660300002)(31686004)(66476007)(66946007)(8676002)(508600001)(4744005)(956004)(86362001)(8936002)(186003)(6486002)(6916009)(316002)(4326008)(2616005)(36756003)(16576012)(31696002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjE0em0xaGg3VVNjQzBvZDJXL1d5bUlqRkpEV3M2OFYxQVQvSnk2OWtDa3My?=
 =?utf-8?B?M2VHUTNnTFFxRmN4RHlqbHpMNW93ZjdzUVl5cDMrNXBZTm81VzJZM2VMODFw?=
 =?utf-8?B?azVVN3hGZWlpTERHQlpxaVo4U2hRc01RN0JZUFJ6ZDh5WFNxcTZJbG8zMjNQ?=
 =?utf-8?B?RytRZDBRNklLbmdocThNWjhyQTMvdGxoeS9qSGRQaGcxbEJreTA4YWRGaG8x?=
 =?utf-8?B?Y1NieWNWa01Ub0ZNNVBiUTJCMkJTMmFkTjhWbDdxZGNFd25QOGdOTUgwdGxN?=
 =?utf-8?B?aHNkMy9adk1yemhvejFwTnNpWk1JK1NIWjM0T1diZ2tNQk1CT1hYczBybmlw?=
 =?utf-8?B?Z2tEMGJubFExM09ZNmNKSVhrVURVMFZXMUVzUDNCUlovNnZiU3c2TG9TZ1lB?=
 =?utf-8?B?dEhaa0VNdjRYWHlWK2V5OVU4UHNPdWZjam9sSEp1U0czS1QxaVNCeUQrNkgr?=
 =?utf-8?B?aXFmNDBlMDFZNHZ1dmxuQ0lyVGZJRm90ZnZwNkpvNmphSE1KUDlHN25VUHBv?=
 =?utf-8?B?bDkrdGxVakd1Q3Z2ZWE5V25uZ1dIcmtSUUdOQ05aYllMWlhMUngyVWQ4dFly?=
 =?utf-8?B?ZUEyOExycVVwdW8zTmFLWVlrWTVmeGE4NHorN2Z1MFZLeGtBS0JZczFjbWgx?=
 =?utf-8?B?U01PUjBXanpMaWZETllKdnV4U1U1Znk3bHBTMWcvZFhBS2VBTm1KQXpBUHBX?=
 =?utf-8?B?S2ZrbTZxck8vNiszR3FXN3p0cVllLzVuNkVHRVRwNTVhQ3lyMmRIQ2I1M0hl?=
 =?utf-8?B?dlUyeGIzUWl4dXhiRUtOemlURlRNSS9HNGNsc0FBSUhjUXcyaml4UzNQQWUy?=
 =?utf-8?B?VHgrUFI1ZjFGNTcrQlVJZTFDYTFhMVg4OFVidUd6dGRralFPSFJNUXZVN0k4?=
 =?utf-8?B?OHBUQmQ1WnZ5YWpkZVNGTXBMQXM3VG9aQUg4U2MrcFp3dGFTbnNScnNNMmNq?=
 =?utf-8?B?OFByb25yUjQ2a29ZZlJSSHpCYnlEWElqZVRnNzVwWnNBLzZZMEdwZ1ppMjhW?=
 =?utf-8?B?Qlk3RklmN3ZqYUZ3T05rcTRtTDR5eFhHNzM3bjM1Y1cxVmI5ZHNPRUsweGNF?=
 =?utf-8?B?OW5Ib284S0lBSFh2QSs0OTY1b2JSWmtOK2Z5OGZ6cFhMTG5Zd2RxVDF4MTVt?=
 =?utf-8?B?YWV1QUh3Nzh3Mys1dzlBRUtYeTNqQ0hGQWxMdEsvbm9sc1FlTCsrNWd4VEFT?=
 =?utf-8?B?eDYzTm1vVlNkbXNyN2h3cWhVUGFGejI5R1N0cEdsUXV2NGF5dXlGU0JIT2Vj?=
 =?utf-8?B?MHRCUHM2NHRFYzR6MStCZk9saEZ2SVJTYjQ2QjU4Y3QwTGd1YzFDcUpVNTIz?=
 =?utf-8?B?ekZnRDBEeVRpa0Nxa2VBSEIwNFRCR28va0x2aWNZbUY2N3ZZV0lJOVo5SVRl?=
 =?utf-8?B?RE1LcWVlMk43Y2haWlhQdXBmQW5qdnBVcDV4cldmNjhmTHZ4V1E3alhITnZD?=
 =?utf-8?B?QnBDSUx0cEprZWRLcHpLVmx4cE4wUUQyR1hCcXNoZjdMdFJ1M0xMK2VQNE5V?=
 =?utf-8?B?eTh6cW9YeFExSW5qc3FpU2dhSlR3SDZlNXdpSU9SVjVzUUNHSTZDZG4vMzJQ?=
 =?utf-8?B?OUJ3alV2bk9OZlZ5MER0Uk5iUHV3TStMNDZ3YjdaQlVTWVNCRDZqczBwTkFo?=
 =?utf-8?B?OFUxOFptdnozR3BYbWZ6V1o1SWpaakh0RmhJT2ErbEpBVmgyV0dpZWdXb0NR?=
 =?utf-8?B?YXkxUlh3NW4rS3Y3VnB6R21ZRGpPWTA3aUZJR2tNbkZSWVNaTWxnMm5IRWU4?=
 =?utf-8?Q?GlaBs+mb4Jz5WWw6H8HNotE9kil6CwXo6U6dX8T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd51cc0b-d37d-4bbe-2e9c-08d992f3337c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 11:25:48.9709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyuSvB2FqQKWVaxN6eQmUT0ggjy+i48a+w4EKm27pjejejVzhKRakfvkqfqvR6hqXzgiczoDL9JQpNDuJe7Rrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

On 19.10.2021 13:12, Ian Jackson wrote:
> Bertrand Marquis writes ("[PATCH 0/3] Fixes: PCI devices passthrough on Arm"):
>> This patch serie is a follow-up after various findings on d59168dc05
>> ("xen/arm: Enable the existing x86 virtual PCI support for ARM") as of
>> agreed in [1].
>>
>> It does the following:
>> - enable vpci_add_handlers on x86 and not only on arm
>> - remove __hwdom_init flag for vpci_add_handlers
>> - add missing vpci handler cleanup in error path during pci_device_add
>>   and pci_device_remove
> 
> Thanks.  Roger, Jan, what do you think of this ?

I'll get to this, but at the first glance I'd say that the change in
patch 1 coming before what patch 2 does is already a problem.

Jan


