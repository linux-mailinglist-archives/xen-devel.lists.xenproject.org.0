Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886D78D657
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592958.925825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLbF-00018E-3S; Wed, 30 Aug 2023 13:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592958.925825; Wed, 30 Aug 2023 13:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLbE-00015N-WE; Wed, 30 Aug 2023 13:51:13 +0000
Received: by outflank-mailman (input) for mailman id 592958;
 Wed, 30 Aug 2023 13:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbLbC-00015D-Nz
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:51:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 460aa90e-473c-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:51:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 13:51:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:51:08 +0000
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
X-Inumbo-ID: 460aa90e-473c-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipBG2f5Iv7iRyqZ5CmtZcVp7EOD+LH+L/KfnKTI2wlkJcfJjcsILOJazgESeCla3FsXyiwARBi5ML8NY8eJE2/9aUE+9G9hIlnjFrAqjoCNDOhxcL6yuyP/2P9VPB9VbPcvS0vyMWKHkkkXGetiE1+JYHahqkUN6WwOZe7vlxD9C3WzHoEq3w4ebLDxaWcSj3YE0iVmaD02BNK84Z8+M+VNweo7R6UP/V0Yqi4WqChV4kSzNgJzNveUmAarpgY6M75asMbhUmyMhPnmsyRpNa9QLQFkuTaZEgLzwg56/oyLbF6FQPqMRBIfXl/0tQula3DiPIxL2RtJ6xwgIIBrzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xIg+g/PWGD9NvvPUJjvuqjyIJtOUpjZ91Jfu4vYyiI=;
 b=ICccNnrKwnrWr7mhyrVHoWFP/nQKQuA/gLgZftr2vFMl3iVtYwYjwCj6RXsnhsW8+MBK7vG4Rnm/ox632Jw6/hncmnrGihCF3h65AC3oU9nnfbvIpjfrPiCGqtkdwtZLZKRNWwFJOjLhWZh9bbUfZo6EHXlVsDNlYLazIok5ymyeBwVTXKaqafzOM/s+7wlomziyg+gRLn9ytgXkiG2vn7vVfxkC285mNAhR/8BEYxE98Xya0J6j2OEZUpRi+T1/gm7hLrVxf5r0wd2jMAxFmJBkAnGa9MDzusUqnD8I+aleS3Q3qttWF+s1ZaJY/ldWTNOeJZvXKHlc8KB5zF0pbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xIg+g/PWGD9NvvPUJjvuqjyIJtOUpjZ91Jfu4vYyiI=;
 b=UDxfJfN4UkboppJY0pyoPlnDFlfaiTM5x7zCza/At9A4Dl07y01fBslFMfMr/oeo3l9wI8vORqTmFNRBk5V+6Wn/XzE6yxIPuiC88fHfU8cnIysrZuqTEqQydNR271t4XHpGWMhcsEOIPT6QV1c6TouaioJ5xWYJCKw0r5S3vZvgt6i0uO7Jhl/BHypqn7vLHYh52Eag5vNQoX3Uo5ye50sq88iGbmX/wsMib0Pm+gYOF//QPVhL8AKYT297JL7g5giFVKQKSH9eOvkuPhpq/Li5X+6Sl5cu/60ZVhce/EH+oHcG1vyEjfhFiuRkWZnImdvVdUwogA9pD0BfH5OpZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0485b37e-63a0-b31d-ecae-3c55e9c41e0b@suse.com>
Date: Wed, 30 Aug 2023 15:51:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/6] x86/msi: rearrange read_pci_mem_bar slightly
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230828175858.30780-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 47dbbd1b-54ec-4828-6d03-08dba960295f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bc8ddZCY/e1BN9McETatsiCzEGh7xVITHkn9cHRMVXsuiAJlgC13WSEf8GTD/VT5J3fGeUl8fnQKLyStmM7trCJScBZYRSBl6Co1SPGPSJYqy3rzFRwgn1Dpvpiz9z4pc5z6fsifXqAGN7EYCkNY/V3iyd3O1MUgLmd9MLVBfhs/Uij9yG09cVsC5/Q8bGGwmpPgLRD8lYjmJBaMR6au0IdslKWo8UHwgW5EsCtify2ZvQchnhEtoBLb2CPqDPDslQhJe1gkTTYcLf6Z/D/Zkvyva/8ECkqzDti6aF8WflvqdCMUgJnA36d9/7jX6cMySYMIGGFYG0iTTnadkhNA3iu4MXw6/G5wfMa9jtBPWxE/TUkSAvOWFFLgSHBUM2wAemULu10wT9o98La1sd0YCTR1osRgd3azUfv1u+VYI2OhuYJXLiGPD7l49PEFAOpqB4UrKvmdj04QKFfhUlbKpKRi66JD4mmyNm3cCcJKmLRcdaV8M83LdeVM+DGUcVESM+jCTkODAoM6wnqMLkSGexpnrG6NDNKwkhW8ldp3cbi6ovsZL1tUtUqECmfpdhdk7dpFsqK6BAoz6x7LYzlwbPs9OXpXzymu+o6CoinVBhfS+VybVa8ErT5HN7ai7EFQr1Gh3S7spHWG/THi+6YuSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(186009)(451199024)(1800799009)(66556008)(54906003)(66946007)(66476007)(316002)(6916009)(478600001)(38100700002)(4744005)(2906002)(86362001)(31696002)(8936002)(41300700001)(5660300002)(4326008)(8676002)(6512007)(6486002)(6666004)(6506007)(53546011)(26005)(2616005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aytjai9CcXhqOUdGbTZWTlJxZ0ROSUh4OEZmN0drTEV1MjdrMGg0Qy9hZmZH?=
 =?utf-8?B?SGU3WDVDNFJ3UWhIQUFDN2NSQXdZdHNtMUJVQjhqNTJoTVdiQ2I2Y1kydWN3?=
 =?utf-8?B?elhuN1Rydm5INVRaWlJiSFIwVEdEUldGOU5aU3JTcW1mNzlneVc4RlFtYlVN?=
 =?utf-8?B?ZUVQV05FdU11b3ZZWFNMSFU0UW12bktsYmp6UDdwQmxHSXVLbGdiNWtHWjNO?=
 =?utf-8?B?aWlGeGhCMm9GQXFRWnBiaEI1MG96M2xTZmFlTjBhMjFMUE5XUk5MWUtsVHdB?=
 =?utf-8?B?S25lSCtDSHZDUUN6TlVnZFI1KzdJdUgzS1pBOWlSK0Qyd29EeXJRSFpDNXls?=
 =?utf-8?B?ODU5NVhOYUlYc0RIdXcyZWVZKzNrc2xOTk03QUliYVZrNmc4R213UGhia01U?=
 =?utf-8?B?cUJhcmk5R1pyK2hZYUVqa1NPa29rVVdaL0tIMHRYOTZndVphZkRySU9mcXZV?=
 =?utf-8?B?SnRzRHgvOG1qUXBuQVJYT3R5S05YYXIvYzNzOFR6NHpjTTREQWJkTUNBZHdY?=
 =?utf-8?B?UjhrVHBualI3MXV3SVVUMVBrUzgwRWtWTlhXNEhPb0Q0dUcrVzFPWkMwWWxC?=
 =?utf-8?B?bkNiYTFHOUZTcWZPeDRINExXYWZ0bTRIeFpTSGJJeXBwaVQrV1NhRTRkZnB2?=
 =?utf-8?B?U3M5ZllhNndWSkZkeGpWRjZ6SUc2U2NSS0ZsUXd5c1JUTVlPNmovUFl3WjAy?=
 =?utf-8?B?Q0hVZHB0V25nOThhKzV2dWREWU1SM1ByT1BjYkZ6MkVmdU1FVENRU2czRHor?=
 =?utf-8?B?ZnlGd3h3elo5M3krMjY5c1o1b21QRGtjVUJ5cENnU291L3JkaXVyOXRSbkxN?=
 =?utf-8?B?bEN5bjV0bCs0cUxGaHQ3Rk14SVlZaHF4a3U2T2xFNkRqVm03ZmcrWUhwUjBP?=
 =?utf-8?B?RFl3R1BZM284TjdZdHd1dSt0VE90dUVFa1VaU0VpMmNURkRkYXVEdzRjZXFm?=
 =?utf-8?B?Mk55RjhXdWxycmtxeGNia2pUeXhBcWlaM3kwZUlhcTh4V2xiMnZYeXV6Qjlx?=
 =?utf-8?B?dks4dTJzNy9pamVZdWpuVlBQZmxia0N3RDhhOUlQV2pCaC9WQ0FRTkQ4RHd5?=
 =?utf-8?B?LzU1N3A2TkVoTnVRWEpTOTREbTVmdnRsRHdweTltQytEQ09LcUV2bWxIUEZy?=
 =?utf-8?B?bHBFeklvcFRKd1RPS2dFK1h3QkJzMGN1MDg4UFArd2tJWTBpeHlvU2J4TUZk?=
 =?utf-8?B?d3J1RnJjNVl5OEpNdGVtczliN0FDUzdhL1AyUlVwWUhHQ1Q2WmVWR3llOWZn?=
 =?utf-8?B?MFJ0K1B4RmxyZUl5b01jajR0MmcwbEorWGJIQUhpQW9LUnV0bEdWWWZpekUw?=
 =?utf-8?B?Nis3YStvQm5IdFU0c3l3Z3VSSDNvQWttMG1QTi9uYzdKU2NTVm5xdXFzWmRO?=
 =?utf-8?B?VkhJL2JrcUsyUnl2emNBcEhtcTNrWndsWWFUMzNTNmYwNnp6TjVkZHRDSDRB?=
 =?utf-8?B?akQ1c3FVdlU3TzVDeFdCbCtZM2xUdTBqbHZ4Smh6a1BZT0RraUd3bWFCR2hH?=
 =?utf-8?B?ZE90Z2hGbVBaY09Zbmh5TFhyaU40YjN1N1dseVZGM3d2dGw0VGdiN3hCeVBs?=
 =?utf-8?B?NGppRjB2UVd4eGJldU11VGF0RGthUFhrRG1yZkhXaE1ta0FLRmZhSnFONERv?=
 =?utf-8?B?aW85ZFFTNzExdFVod3Q3YVc5K09TMTdsMjQrQjdySlk4QUtOdnJ3N09qVk16?=
 =?utf-8?B?amJKcXUvZjYvdXBkb3FpOUs5U3lSWE9yMnNxY3ZOTUlCRW0zTVU0WWdYSzhu?=
 =?utf-8?B?alhId1NkSGt5TTBLbDdWYmU1Ni91TlNHZ2tlK1dlMmtuMXFNMlVYdS9YbS92?=
 =?utf-8?B?SnNYTnNidWVJZ1J3TFNUazRjZGRFUmZ2SVVRVTN4SVJlaWY4ci9GZzI1YXpz?=
 =?utf-8?B?YVFDeGVHcml0OVI5VUlzdEI4eXphY3RDWUQ5TC93aDBPdjRDcUxEODRNNnNM?=
 =?utf-8?B?bzI3ajFNUHVNbWdoTGVCcGhJa3QzM3JsQm53TUhDSTFIWUJlc1I4Lzc2MUQv?=
 =?utf-8?B?SUkwK2M5Q092MVY2STNZNmR5WWV1b3kyY1FBb0VJZ0llNlhLeVdHRHF0Rldo?=
 =?utf-8?B?V01iQnRoTjdkRFpQTlRxbGtOUGlxNzBKM01Yam0yMmxQcGdUbEYxSEl3WTNm?=
 =?utf-8?Q?4wH6CKa7v00hoHeFQEdBu2b3c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dbbd1b-54ec-4828-6d03-08dba960295f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:51:08.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+Zw7HwSm+45AVxDyTT91gfkFbOea/YmoGCACL0/1AT7ardV+jDgq3KOIlY8E2+tT+CFOt7y90IWs9AVbOJkIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948

On 28.08.2023 19:56, Stewart Hildebrand wrote:
> Use pdev->sbdf instead of the PCI_SBDF macro in calls to pci_* functions
> where appropriate. Move NULL check earlier.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



