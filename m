Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA9346629F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 12:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236499.410262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskUz-0002YM-7K; Thu, 02 Dec 2021 11:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236499.410262; Thu, 02 Dec 2021 11:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskUz-0002WK-3u; Thu, 02 Dec 2021 11:43:37 +0000
Received: by outflank-mailman (input) for mailman id 236499;
 Thu, 02 Dec 2021 11:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mskUx-0002W8-G4
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 11:43:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 146e225b-5365-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 12:43:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-PeT8LZw3MBuyC1QssxjhOg-1; Thu, 02 Dec 2021 12:43:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 11:43:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 11:43:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Thu, 2 Dec 2021 11:43:30 +0000
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
X-Inumbo-ID: 146e225b-5365-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638445414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3+bPm8UyslSnyMghfZbGu7oXLBj5fRK/MtlKXWaq48=;
	b=b9o9NxNuMnhMP6C3w4VfWCjR75COS0ooQkaBfIoO40ZzCcmBCJ9iyYBVhwaeY4N3g/RXW6
	vUq5h1nBKwbGQDVMFSZq6JLaXI4Rh3u6yg+HdZayWTC0SHX6+inbgTuqHZTPj6H4I3uxsw
	VViGWtYVegC53aqWRWpO9/KoQiyzM50=
X-MC-Unique: PeT8LZw3MBuyC1QssxjhOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs8/RxGicsD0ZynwrjqRW1cJl3i2hT40MCge3u2smhsMeewR50acMk/2UwIhiLtgbPdJEPFrXGdF9sF/YljUmedjm7YXSOq2MC3ZZjAgJ1LyLtGU7riXz0q1p4J5en4UDvyzKBkEJpTcTYRYpl7LG7++hsgv9km9MR+lH8aLxUbLRHc6Y96kUXYLHU1TFFInnmyhJ8ipWzhBTmo0AKNYhRX9IOkPXyfR1OW+p8KwaDcHRfnyZoVY86dnGcMe9zgrWf0cbm0EnP+8jySZh0u3tCqxekn1F9yp/ClWc3HuahCnhKB5h68xbjjZJO+pxC3rm45yG2xq3bevjYoCpUcrow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3+bPm8UyslSnyMghfZbGu7oXLBj5fRK/MtlKXWaq48=;
 b=lbndC3gd+eXSU+Ojlcver051U/sW/0cPuBGxb9yNxWpJNmGaCFDrE8A4+pCCYHx7m4FHkjQ7ooixqRJ/kYzWAhzkDf19hg/GbsQ4kPoUDRgP6Ate1rri0t/CxmJWOx5rGMMPMkgxRF5TNJOpHfRlUbqwm/tyuTnixavYRgjoeCFhwr+iU6S+V4jbqk7Pzou4lO0ngQ8iH5tpbc9tnw7+i8zimwtoGbBAYtGTR08QiaxwprI9BJcT6lTA5/1CZeWtGgWsYGVpIOGRcqmss4agEz+U0NDbhZxrxS//ydg9l7cGtsnFTBzzxHTtIn4KhfOTwS4opqzAEqZk610Wiz95lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf2cd306-0dbd-0324-c85f-43f8f7f2ae81@suse.com>
Date: Thu, 2 Dec 2021 12:43:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/8] x86/boot: Better describe the pagetable relocation
 loops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130100445.31156-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80926bf1-06bc-4eaf-fefe-08d9b588f6c8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335D0ACA3333BC8BC3EFEE7B3699@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PivIr/xZ8i/NhPdGT9PjpRSlFs4L7nIcsOEwlzAiSkD0dEYUIdlTtIfEXMvFuMOEtZ40kJHMCnG4Mj9EMK97vn9AGMJLNYhvDwrOQ033oonmgroaqeXQL5t+S//kl8n6b9TiHUvVTpYhvKU42lAWISDwRkqaJrE99IVXSmNm6of1gAHhsUcAdy4r+J/n/NkO576g9DYqTYkPVtW5+qgz9VGbJh4yV00Ddu/JDzab+LUSIP5Y/G+obz/ptb7IuJbtTbflk9DlUNSrpEWZ84QzPGdV3ZQxVI9im33X8m7Z6UefnCPqS6dNR63KLu46x98tF5WLv241dh+BzCFgBv8jOfcGmd1irRLN0SC4sUhWYs2V6Xv0HrtafKd1syMZOFdp0sEQ+NeqHxfOLQAKd4p402zVXbR+QX7+b0YdbIYSadD9VmSvLltDTd2r14A/3EUdYdIkvDos0uMq9yUaMA26V9Sitc9e+Afb39l8GW2pIZt5/sCqxw88t2zLQnZ0N6qFOnBRQiyziBNbL74ucJIqtxAGaEOGt8c5fJiomRw1EKqHSehbd49aqakbV+7feaIi3oveFbkcXbKF2+ABNjwzBdAVJMjAVjtjcjJB0qaGPi8LfoRLwAId97mVbbposCOcPDYZ1ebxjNah3t4LW0cz0M1LDIN8iZja6bAIlRyF3OQusdI4ZJT0LzeuhwvJ33MXMhaMlSyqinR/i9EcHy2Esn/kZva1ulWKt3MmKYyT/+09XsN7Z20RZocn3CBwf0Gv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(316002)(16576012)(36756003)(8676002)(66556008)(6916009)(54906003)(83380400001)(38100700002)(31686004)(186003)(66476007)(31696002)(956004)(2616005)(5660300002)(66946007)(86362001)(4744005)(4326008)(26005)(2906002)(53546011)(508600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXg2b1VXVm9PSjZ0RXpMNG13OU95OG5SZkVONjV6aGV2dXVHNEsvcFMzVWl2?=
 =?utf-8?B?bkhHdGdCQnU4S3BxZFpINVprNTU0Y25LVzdNWFhOMmxDTzVHV1JxL0lNMU9F?=
 =?utf-8?B?RU0rVVQzRlh3YkZJbi9QVTVnYnlsdHQ2WUVHazJDajF6UnBVVDBEb0ZZM3VW?=
 =?utf-8?B?dUJJSEJUQ2ZGeU1nRUEwd2lPYjR2UEY1TC9ONFhkUStiYWRaQkc3cmZLdkdq?=
 =?utf-8?B?cGUvY08zamdzVmx6TXEwLzc3dG5EL3RCUU5zTXphTlNCdFlKc2ltbzA2NVN4?=
 =?utf-8?B?TXIxNjJRTlgzZ2VIRzd0SDlEN1R3T3pOMldEUmdvNkFyS0crVC9jR2xjYmhM?=
 =?utf-8?B?SXBtUlUvQjFmSFNsVlYvNStXTnVpUUhIMVFLK1k3bnFRNHMyTXM1YkU0azZl?=
 =?utf-8?B?cTJpakloa0gveUxLNHlZKzVFbUdRSUwwbThWZW9MR2RWMXIzVnFiSDJiRHhr?=
 =?utf-8?B?SW0zdWhWK2NDNDlYUzFiWjV1UXNRelVNbmlRRWJFUm93dlhiQityUlUra0tF?=
 =?utf-8?B?bUxuNEZ0bjJyb2l2VTYwSzJhaTVHVkNQbFZrdlhGN3hJdnNuNTI5UTdZallp?=
 =?utf-8?B?T21XQUJlMENnWHNkTGkvRkptdFd4b0NwVTFrUnF6a0JRdE44cEVNMWJnN3RZ?=
 =?utf-8?B?UURYRVZkd1NxL2pUNW9Xd1B2c3U3b25xbU5maUhLTXBJNHdvNjJOR0szRHcz?=
 =?utf-8?B?UDJJUWdlSjRaNG92b3JpN0hhSDZuMkVqTk1MV2s3RHQ0b1VaN0xkalVJUU93?=
 =?utf-8?B?WFRHVk8yVXlNOStpVmdiWnkyL1dSUmdTU0VvT1V3OU1Lc3NseEQrVWNIZkNt?=
 =?utf-8?B?d05QeTc5RHJxVXR2S3k5L1IyLzdFbVdubUNxUjRDaVV4UUx6R3pkQ2QxdUJU?=
 =?utf-8?B?MjZrTWRsY04reklkU0V2aHJjOVpHMWNMYVNDVWY0bVJLYk81U3ZYR3RMajZG?=
 =?utf-8?B?WU8zZUp6a3ZGM0VCVEhNUWZXUGZEem5nYi8wOEJNM1BJTkF1d0JGb3pRdWxQ?=
 =?utf-8?B?bWptUy8wS0VJd1BmMXN1K0RjYW43NGw1aFFyTm1sSnEra05ITEZ3VU5OK0wv?=
 =?utf-8?B?bldBR0thTjRLVXg5Qlc1bi90RXNqUnNxQnBXdnpsTWg1NTU3cURqcTF0a0Ja?=
 =?utf-8?B?OU9tZisyYUREWmhjb2pkSmVaaDcvWXNnZ3pzU01GdTB6ZEc3SkR6QmN0TmpU?=
 =?utf-8?B?bWlKZzZLYlhjL1J5ZlI2UWxTeWRocWRlUGpvdGdmY0xlU3RvdERDbXU2VmMv?=
 =?utf-8?B?VGIybkw4MGNhOFRFN2NxT0xUWFR1S3hUQUlEUkZPOVdtSi9JeEh4em1NLzJi?=
 =?utf-8?B?czZqVXBQcUF4RmtZdkpmY0w3WitQOENMcFNmOGZPTmpIREgzZVRNWWw2emdQ?=
 =?utf-8?B?QXZHTkJUa2VoK1RNQUZ5Qy9HdVhMWEdNcnVxOW1jbDRwbmo0cEJxL2w1eE10?=
 =?utf-8?B?ckdMQW1HckhYMW9qcXpSbW9SZXZ2Misyd3NNWEozTmE1U1ljRHF1MStjQ0xE?=
 =?utf-8?B?ck1hNGsvUHhmb3k5V2xNUkNUNEdOa0N5dnMyQ3FJUkJUUFJaZk5hV1JaejQ2?=
 =?utf-8?B?ZTNDajBZYmI3ZE5RY1JwWm1yR1ZtRCt6M1BhZW5NUksyMlF4SHlHQm1xaTh0?=
 =?utf-8?B?WGwvckc2b2t3RmlDRGtsWTJrSmlCRjdUcXErc1BVOXpRd2J2Z0FHanFuWHNz?=
 =?utf-8?B?TVlrUEJtZ0FSZkJYQzFlWVFzVWNnei9NcnhBUmdmVFNmOG9VMmZSUkRseEVT?=
 =?utf-8?B?OHJ1bkJURThodjMyamc4WGRLdmNES3Q5K01XRVZlYVhNa1E1MVM4dG1oWGlw?=
 =?utf-8?B?U1loMmR3eXJ3ZktKZkFPWUdOZ2E4ejROY0x3c2p3U3Qxbzd1SXdidmZYb2ht?=
 =?utf-8?B?czR3Y0F4WlQrUURvRU12NmNBMG1zQ0FhSFNDZFl6YUdUa0s5c3BHcE9vY2xk?=
 =?utf-8?B?SXZCWHlJOG5ETmwzaTRENjhDd2xQZGRmWGNHdSt6OFU5QmoyNktnaytVSEoz?=
 =?utf-8?B?UHA5RnZJdGw4ZUZLdnY3RDhVeDBYNkt6TUg1bklIYTF2dllnczJmRlVtTzR3?=
 =?utf-8?B?cVQ0dGtCZHltTmViM1FxamtXcTNXRlFNOVk3UWpjQWhCQjBvR2NXNGM1MXFF?=
 =?utf-8?B?MWorYkk3RkM3cU5IUVNybWNiNjh3djc5U3V1VDhhV1JaSlhvSXBlZDJTejJB?=
 =?utf-8?Q?mDNGT3ADv+2y9Gzzhv4hP1U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80926bf1-06bc-4eaf-fefe-08d9b588f6c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 11:43:31.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHHiRJIQhnW8fRA0xLkUhFEWeCX9Tgsgu8ZefjdHe70o3fTdFaWToKeVcMEm61aaoz1ZOXaqgn6/DK3e53zs2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 30.11.2021 11:04, Andrew Cooper wrote:
> The first loop relocates all reachable non-leaf entries in idle_pg_table[],
> which includes l2_xenmap[511]'s reference to l1_fixmap_x[].
> 
> The second loop relocates only leaf mappings in l2_xenmap[], so update the
> skip condition to be opposite to the first loop.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


