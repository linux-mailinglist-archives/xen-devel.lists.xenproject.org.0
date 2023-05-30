Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79677158E7
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540847.842903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uun-0006mB-VN; Tue, 30 May 2023 08:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540847.842903; Tue, 30 May 2023 08:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uun-0006jE-SO; Tue, 30 May 2023 08:41:13 +0000
Received: by outflank-mailman (input) for mailman id 540847;
 Tue, 30 May 2023 08:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3uum-0006j8-QK
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:41:12 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe13::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d9a2c5-fec5-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:41:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9275.eurprd04.prod.outlook.com (2603:10a6:10:356::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 08:41:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:41:07 +0000
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
X-Inumbo-ID: b9d9a2c5-fec5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn5j6fbedzDhAuwKeggBHM9dkUQeSn1z3bfBfPLhwXl6wuAyOA4WHndpqtPxbC1SenSmQfOvenWGTV89jkzqXrvMZjpnbkWB2TUB9BkpaCAP2gbeEE4fwYqO+2X55h4pjd3ZEfQFupTSy6M2zLJ08yvfha3nLUlD6zbKgFAPQVtjPOSuMyzrhfzMIl+jFjnO1qbNXFiHkqfsjH1Omz42mXCYkLU0aCStvns8YVwOyaGCtthnyU7NydbYshfzX2P//OU5OMsk4Lc06w1RjOhtUKFaOKW4OB60rrSZvd0lUPudE9JuD2sOcxN5rbF7YVjgqc0nFHTm0ni16p98aAWubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRa9BPYrmmiPhwNLlH5ynl6mhJUAmPhIm+HoXb8+MWU=;
 b=T/f1C5wTGbmtUOUsXJq0LzH4zOMGfHJUmCz07j30+vZI9Q4N6YpACkSFub0XXckpAI5Ikbc9QNODW1BJDMOrrz58AWfg+widKEHWXIxpJrYkx79K+x+Il3Ipfx8vFNFDYEEBxb0/ZpUb8N8dthafQbwi7CIhAx+ubYOt0qEO4YVXPVK5MTebxbJsdAXYjanNC3lUbARwzeRVg9kvad8YXU23Ju5Vi51EjE72PyUd9kVLGQod5GMgC4B83KvpTc9+iQhqtyokVKLYW8NKJZ3KLXaxnH1Z8sPlKHOLApPgmo7Bn+FCW2JujrpAYm39Pe2iZANDc4voWODRcfeXWUT6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRa9BPYrmmiPhwNLlH5ynl6mhJUAmPhIm+HoXb8+MWU=;
 b=1tZXNLP31BvYEiC3WZcoAQhYcuOLOGax51KDgKxCYZatPuDRzU3Eekj60dZqMP6nFcVFB7i31F8iCdGXueEIdSOzotKlG44mfZ6zlIY6Oko2bichm0kNRoyF7SuNHtmOAWS2NFOop/UEf9XdJt+xOtiCGisEXdk8I1uB1qFvxA76xrcnEDGXLXKYzb4exO5GD1ua9k/PGMq1qSB3RHIaNblzK4RRkV0AQXYkRvpFDo396jd7MKuFMGy86m8RemFQOqhUrcnNxP4IOFoaQW88VPg4A6bucRMtfiybmE3g5ZrWwLdUFWgyAjlBuvThk5yl+frNOnHikh4XfdexNwCZOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
Date: Tue, 30 May 2023 10:41:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: xentrace buffer size, maxcpus and online cpus
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230530095859.60a3e4ea.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d639733-0585-4d55-a07c-08db60e99c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qMEzfHVMPJbYsY52iu4wtxTf9PKVaDDA7uIGFYJrsdo7DMKLiwGKEmKCE6nEq7CBMjyBqXyJ7jC0rnElc4wvFnriS1NsAyLqQUGMRcJ+GNUZL22eebORcyaqSQnO4w3zzMGIOoS0zgI8WpLUIK2r0oFiIbgKFOq42+UGen4DBhNZCaD1ZKYaadRohBoh8OPvcQKvBl2XWXDT/IEGAxzvuytsd634ON/lTS6qh9jvpGU8tNrQjl3Yy5aMkIOyamiY80VKgR1B8+m+bW0vhGR3Kg1eRJYfVEjEhckZDPMSBAlkC+fNLzJ13Bz7tNgW8QYjFnt6VJeRPXjNjtxbctoTB1fXHayIipZZeyPymnSQ0WIw1rYSkm0wfQ1kb/VqIT6O1/zp95mKOYNrJmHNAocjTPDm0ycPEl8VQg+RtZk/m8BxoucEgLzW779oeZlFXBse4DRYnh2YAzpGz8IAYlCfUx1eanHlmahw+7Nc84bpOIBudJnXYQ9QdWzDNpQ4Kqaffz14B45gpDpqR8+SpyACbzDFBfaNfvnn1fykwzXZ4TvHJQ2HNaJCPQVxRVs3l7WoS2oEcxUxMptApEhedOiHWDOg5PKMgcCVJvLY5r+CD+bTt6euy2q79d/1Y8sYEUE/7cFz1XExpHuyY6Uy1s17yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199021)(478600001)(83380400001)(5660300002)(186003)(6916009)(4326008)(4744005)(86362001)(8676002)(6486002)(2906002)(8936002)(41300700001)(316002)(31686004)(38100700002)(31696002)(6512007)(6506007)(26005)(66946007)(2616005)(66556008)(53546011)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkN2TjJJcUloU2dhenhEdWpVcklEYzIrakV4cFlYWmtnNzhXVmJOd1g5VGN3?=
 =?utf-8?B?NjdKR0lVdWo2cU1ld001YXZXVjZDL3hRU3ZmY2MzNms1dDZpWG9jRUk2K1BN?=
 =?utf-8?B?OWZ4VHBmd2F5NTNpMVRqNUFGcXk0OTFraUtaajZyWTNKNndTaHYrbmlCU2Ji?=
 =?utf-8?B?N2hkdHZhRkRWNEViSVNSbXhJdk53M21xam1UeWlGeEFkSnZaRzhCd2hiQXYz?=
 =?utf-8?B?akdaazZVTWFWVXRyK0lsNk11Nk5LZnQzdFllN0dLUllGcnVhUGxHWmYwb3Zt?=
 =?utf-8?B?Q2tGcXo3K3dxMU5ScmJuOFRGem9GU1RTWnRmT3hIK0wzU2FGL0hwaklrOUd1?=
 =?utf-8?B?OWtBWnQ0SWFOYXRESkxjTnhlOGFueEI3bklWVnYxRFZERHRsM0lWSG5NaVZE?=
 =?utf-8?B?cTNuUWNxVVpRUlgxbXluekJPWjhHZVU4WnNOVFVEUjNEcmNaWkFkaHFxRVdB?=
 =?utf-8?B?c2JQaWU4L3hXZWxHbGJBN1M3ekc4S1lqaUFvSDA2N3Q2NVA3R0NvOUpKeENQ?=
 =?utf-8?B?MVdrMldNQk9oTHZGek5SU3RCMUM2d3duV2ZQejRnb0s3OTBQc2VMZWxuVzhB?=
 =?utf-8?B?Y24zcHFuWnhuZ3dPcnlJQ29OTklsdm5rZWdYZXpyR2hMMmlJNUpFTll3K3Jy?=
 =?utf-8?B?Q2tGNFZ4V2h5Y0R5YlFBQktqZmFxbnU2enFkMDVHZDZBVU56bEoreXp3Ry8z?=
 =?utf-8?B?Mll1UzdscTZYY1EwcTlRaDhndzNjMHFyYkw5a0xYNGpSeExUUURPSlp6aDdZ?=
 =?utf-8?B?ckxaOWdkdkMzZmNQNE9FdTJEdzk5LzVscTJFSisxQ0FiWU1HSTNZcGl2a0FN?=
 =?utf-8?B?ZEdoZkp0clVFcWlPQUY4Z0FnSzdBbEFsL0pRNktINHQ5QW1qanhqcGUwbVdY?=
 =?utf-8?B?MVIySklDWVJIWG00SVdQUzY4bE5WSE5BbXJMcHE4L0s5MlNpZnZvUVc5R0hH?=
 =?utf-8?B?c0lOTXAxcFVyR0dZaHJYb1pSeWl1ZlBybjdHTnNEeEtmQ0hnSzBpSTlxNTdV?=
 =?utf-8?B?Y1YvbEE0dXRXOGVkMXExQXlHRlUzd1h1QjBEd2pLbjJLZXVUeFZJZW9ybC9V?=
 =?utf-8?B?MFZXOGNsQURCTTZaMzBrK1lvRCtSZEpkWTRwSG9iTW9mamRRZGJHbkhkVU9y?=
 =?utf-8?B?WFBUU3o1K0xCT1NTRWNQOUQxNFI0UjUxL2laRVJ6amtyTk1QK1VCWUtjaXpv?=
 =?utf-8?B?TnBlTVVhNVZlcGsxb29EYWw3VFI2cUF4ZlMwQS8rajJ2LzRFWTZmb2FjdWxp?=
 =?utf-8?B?SFNxZXJDejRidkhyUUFyQjM4Ylk4K1V1eGh2NGVGVks1citITnVaNXYzVHNs?=
 =?utf-8?B?empqa3daK1doYjdXRXkyK3FUTFRPTFIvYk45bExLc1JnaG9TT2czQVgvdzE4?=
 =?utf-8?B?Q2ZWbmswUk5VTnRBVUxnSy9CTXNvWlBiVFhlY0ZYRDkzc3ZKekxWZnRTWTJR?=
 =?utf-8?B?ZnRHclovREVvcTBxcDFkdlQwYlNrTFdaMFMwc3UzWTAwZHNSRjlTL2tLMjcr?=
 =?utf-8?B?S2QxSXl3QjBZU3k5QTcvYWRQS01XZW00cm9YNkJEMTd1NEJxNGowY1lDTjMx?=
 =?utf-8?B?UnczS08ycVVsU3MxcVR3eHdEczRibmtPVVJYN1dCNHRwZWV1b21jb1JZMkc2?=
 =?utf-8?B?YjV2SHFsK1R5R2lIT1Y0NFh4Rk5ydE9UOWZjMytVNHN2OS9JaVU4MnpuS1BK?=
 =?utf-8?B?aEJqRnBWRDczYVpvSlNzdGl3d09jZUpFYjJiTzNRa21ZcTNqWUgwSWYxNEpY?=
 =?utf-8?B?UFl6VUdkcGJnMHMzQXZQdGNxOWNkSXNCZ3VLMUlLQVlIVS9jN1ZaQ1JtMUh0?=
 =?utf-8?B?WEYwejR0RDdnRTJaTUZ3ZnFpYXFKenBBOTJJV1VtNnprMHJ2cUl6a2tKZXd2?=
 =?utf-8?B?aTFXekFSWkdBWnhDa1FHN29tWWREcG9tbkx5VkxETGU3aHcrMHJDNzhVQ0VH?=
 =?utf-8?B?Ym5TNTYrZk9ZOWlDN0tmVjRONE9ldkxEZ0lJb3FDK0d5L3JCakp3Slp3clFp?=
 =?utf-8?B?b1RGUXc2Ky9yK2lCRVRpTWlmNFk3RVBDN2VsY1dLclZQVXMyOTRYb1N2OWRl?=
 =?utf-8?B?b0VTQjlwL2tsZnRCK1ZZdis1MlFFOEN5aUtPS0FJSkE5UzY0RHhzdER5Y3Na?=
 =?utf-8?Q?UMPufwuDw811UJ1k5JsVDrDCb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d639733-0585-4d55-a07c-08db60e99c7a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 08:41:07.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uT55UjZ7T1Dv82OUKHF97h8EcnTE9OeLEx+ClI2t38gYTVWe6ggNMUfbg2AoJgDeU0W9Tuthse6KrcIbTYT/TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9275

On 30.05.2023 09:58, Olaf Hering wrote:
> While looking again through calculate_tbuf_size after a very long time,
> I was wondering why the code uses nr_cpu_ids instead of num_online_cpus.
> In case Xen was booted with maxcpus=N, would it be safe to use N as
> upper limit? I think this would increase the per-cpu buffer size for
> each active pcpu, and as a result more events could be captured.

Using this N would be correct afaict, but that N isn't num_online_cpus().
CPUs may have been offlined by the time trace buffers are initialized, so
without looking too closely I think it would be num_present_cpus() that
you're after.

Jan

