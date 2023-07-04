Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5D74742A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558417.872497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGh4o-0004kU-Hm; Tue, 04 Jul 2023 14:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558417.872497; Tue, 04 Jul 2023 14:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGh4o-0004hg-F9; Tue, 04 Jul 2023 14:32:22 +0000
Received: by outflank-mailman (input) for mailman id 558417;
 Tue, 04 Jul 2023 14:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGh4n-0004hY-Pv
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:32:21 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe16::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d4f2b7-1a77-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:32:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8095.eurprd04.prod.outlook.com (2603:10a6:102:1c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:32:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:32:16 +0000
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
X-Inumbo-ID: 94d4f2b7-1a77-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSabIi0JxtP7hRvSFggeMB/TalYEP691ncwfDyN19F+aGw73NmRYwnZl+ueVA4sCZOHl+Wj05HrfywNTckCg0QZFxmJs+BBjYvjZF2GhHH8r57jz0U5O2a9c6OqYfQSZrN8KhlkhzFi7d5w+9zlfxjIfogK0i42Krmdtq+xXYoJiHGTJq8yHwdA0rlA39k0IbLeYlEDbR+ad6DlsXEcFcCC6eGaYDvaMpoGpit3FYGs6etLtf8q1uRnesmLThyxwgM3IMJNTT0Ja9fKnyHd+t6qYNIPKMMRKac8LUHBh7bXh14VrnnzYq0XIwKucgnXrE5LC/U9B30u3HY81oL5B0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFGoua6aKvlEbN069IhmsjpuFn9TqK52MFlJOSz11Pk=;
 b=IoFGn1WVIwACyBKzJpsiRmFDKYe9FtLjEG0LgG7OOt0ZCiQkIOF2H4I8csugKoH9xvyeC/njgBoBPekTahaHlf9KWGtIOpQ8OeHx1386m+LzXCj/67B1BghiqJy3apBZ6lvt6dMmc89C5nHER2J75oKlBy6uDGGZjW1l1LfF9trSk0h8Z111PPQC/9VE5ABnP1zeb1O42ppmy5Mdm8WkR45LbNqmcMIe++whXoRvsuddmbYyin8anpbvOHh7duYIc73KLop0ScVRsMbymXhHdaLS9PrkJ6zPdp8+BFtnpkkUfts6iRYkJzuArnzgPfPItdPnYijeO8H2ZrCS8iRUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFGoua6aKvlEbN069IhmsjpuFn9TqK52MFlJOSz11Pk=;
 b=tRG8htXCldXYmEOR6fo3F0m4MnqcnWJD6V/ZmyPP1JAupjORLpWudbjanum0UmGyNhd9c/Z5wVf2gKmFCEdHLnychhtSEdBbgvwYibpTiLUsSwLjCc+51Qp5DGhrl3NDkf4R6QC+5kIYM7m1axOWOPavqcnrZBhQcsTdeTYnY7YIVum90ArrrBuSXUQmKh1GBdqr/fZ+3yxWQfKw2kYl56Jy6++ww81zcXJZL1Uc+7q19SV1mND5mmam5NnKLF7xa5aeo67gcR1DduJPOsjJCJWyvPEZa9SjC0BBFSK5SawzqYnaTS434fpuejC2tJmytF3IuC4N744Ff3Qq4f1MtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4194337c-9c21-1a72-bb37-93aa3a0aac31@suse.com>
Date: Tue, 4 Jul 2023 16:32:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] treewide: Avoid including asm/types.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
 <20230627075618.1180248-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230627075618.1180248-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ce9ae3-fb0e-4327-d37c-08db7c9b771f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oMk2k2vzCob81zu9b3pLZpXLJv/JRe6Q2gXk0SXAHWj0/+5E5vvGvE5+2DpBsw70NcMo+a10M21lL/tyk2XuxyO72DqQmuO6I7ZRP6UmvnQbDv/HufViq3G9hSRjHF7RcJh68vrg8WbF2DD20Ao8Oh8QzuyzBi1tcOPBIwQu5i4iEZSKfGxIIrMzsdvbq7+0awC2mUsKDJSqo0qCCNNWXZdEjMsUO29edlcBmxPIPPPi/V1ld/qOWHyIbhRNUwNxCmJjNVRGlj+mESJgV3f5r1qeryghal6QjKBYJdPkN4CIu9NMaiZaUbgUkn0vlVTz8uXuR9dSbp4emc6MoBE2Vv7mPY0dWSUuunGI2eubAwy54Z13KZO6/pTx2cxuNM/nUUD8lhK4OKztOYcD+6F9macqV76OApOtlwP5LgTPApI2iRPVDiiSp6RM6P3AEiECqr9KxGCGV+MaHytMKbRQXTMw22KZ77uJ7pS+05M9RLJKPMYKHoesv3JfA0xLzH7mh45nVdHEEBIBP0O5Xl2aklQ1FYxIxZh1LgWROXT1OGPclBNaTu/u854/IKAPy2QRq084TYlQS4R0vKWvdhn/OFNTp4TyiAkBAMtiyf3LLiLQhe/NgsUyfYKa6ymo2BiOHbJ5lDQfu6wLHbB77NNdZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(316002)(41300700001)(6512007)(6486002)(26005)(53546011)(31686004)(6506007)(2616005)(186003)(478600001)(6666004)(54906003)(38100700002)(66556008)(66476007)(4326008)(6916009)(66946007)(5660300002)(7416002)(4744005)(86362001)(31696002)(36756003)(8936002)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0ZzaFJOcjdVdlk3WXVudXpZSFVhZTRaK3Qzd2ZXTmRuMXBoRU4rN2tQUzlW?=
 =?utf-8?B?TjlSNy9KRnJVYkIxRTZkVFYxQTBJQnVuSGp1YUxiUzdyaWJpNEVzdkE3ZEZT?=
 =?utf-8?B?UEtMSnQ3amZiOHlCdFB2UU5taU94T1A0S2dVYmJMTWwrejJkemduTDNieUVO?=
 =?utf-8?B?aHFGajJqZzdEVUpZTTZVWkJaMnpBQUJxVUxQOEY0ZER6MHZILzlEeEdWRnJZ?=
 =?utf-8?B?bzdjRnp3VklQNXBSbDQ2QXR1WjRyUEpTbVk2K2l4eGdKYkgvVmNqRzhPMmFp?=
 =?utf-8?B?TWZJaW44Y0JHUE8rN3JYazg1d28wYW92RHNxK0xWSlpyRnhncUpDRWRiOFJ0?=
 =?utf-8?B?V2JNZjcySEwrVDJrUTduSWRYYk1pNk9DN1F2MmRZdVpPbWFtazBUcU1VcFpu?=
 =?utf-8?B?TUVKYWJqeWgya3N2WVpuV256cVN0NEpFRXhKMFg5WXpqZDJqNVNaZGJMeVJZ?=
 =?utf-8?B?encxem05ZWNtUmpiY2svRTd6SktvWGYram81VWt4SzdUemtTeHl1VmUyMHVZ?=
 =?utf-8?B?WkExUjJ0NjJ5YUhOTm5iRWxtTmZKdW5GTWVJQ0JtVXRNMUxtWXFNV214U3lN?=
 =?utf-8?B?YUIxLzhQeXNRSFJGdjJMaHRMbEM3cVpXOWZYRDJkalErQmRnZ2prd0lCU2Nu?=
 =?utf-8?B?VDRXTVNGazIwak1pU2ZodHZoUXZwWGc1aFVCbkQrQlU1Zmc2T0tBZTRMTU5R?=
 =?utf-8?B?WXQvNVZacXU0b2Q1S3hQN0gxNFNTcDNwRnNvdDloSitNalErVE5kOXRlS3Uz?=
 =?utf-8?B?aDdRTnRQSHVST1R5cHdaQ091d0hhT0lPTHh4c2FrcmE3WTk1TkxXTDdLQ1p2?=
 =?utf-8?B?LzRhQ3Z6K3dJZXZpTVY0NEpmd05TekY0bnBNcEhPYmx0VE9USzMwNmpaQnFq?=
 =?utf-8?B?eFpDMmVWbFJ0amI3Rm9GcmZvZWVqNk16ZkhBenFzaFhiVVJMRXhZQk1jd29y?=
 =?utf-8?B?NDFNRjI3REcralUwOUhOS2YvT2VYLzRaNWd3WjRDQjJzZGc4akhMTW14Qm9D?=
 =?utf-8?B?QlFqOUNqQ3pEdDcyRjR0bmJ4MFpMMTJGYWprZmVYWk1QclF0NTdnLzRSc0dh?=
 =?utf-8?B?cEh0bTNIUVoyRGdkWlUwTStWSVhGQzNUdmJUZnI1N2xzbU5RT3E5VlBHMkZR?=
 =?utf-8?B?Yis2ZkJKYzJCMUxHb1psanZUY0VTSFhnbEsrYXJLSXI1TG1qbEVVa1NXajFh?=
 =?utf-8?B?L2pQOStQaU8zUnJRZExnTXZ6NkRkVFNlS1VzcVNHVFdsdjEyQ1JLem5PR3lh?=
 =?utf-8?B?U01STk9RS3lNRzFQNTR2c2FMU3lHQ0xIamVWcDI4aUdBYWZSMFJtRHpWM1U2?=
 =?utf-8?B?OXVadENNVkFTRHZxWFdQczhjOGsybTlMT0hDbGh3VVVnV0c3RkdqTERmd0M3?=
 =?utf-8?B?NmgrQlhLdUNuZjM4Z2xTQjBZVk9TVURmTURiYlRoV0NXMHB6VHM4dElZeFBq?=
 =?utf-8?B?UEE4RFU2KzA0ZjdralNLb1NOU1dmOVp2TTRnSk92TjVNTVdORDA0TlhDclZ4?=
 =?utf-8?B?NVorUGtJQktNejJJdFVkUlBmejVGYzlFbUVtc2VocEIxNWZjM28wSUxzcDUz?=
 =?utf-8?B?ejRlL1hRN25FNzhmbkhmZENNcUkxdUNFMGgvMWpGN2FkSUZKRjhKckZvUm90?=
 =?utf-8?B?RmlUT0lZb3pOSGo1N3hseXplTUdDSG9Va1VpdkxTV0lFT01yK0lKeWR2V2JN?=
 =?utf-8?B?SGRKa3d4OXpZM2sxUUxDaEU1TnJPQ2pqWklzblc2T3ZCTG5jd0d0V1JKRE9y?=
 =?utf-8?B?cHJLSDNURzBXWkxzeWtDcUpUbkpJVERoMTNsWmEwb2g5bzNDM3lBYWtGKzJp?=
 =?utf-8?B?SkQ5cTNzdjRmRHFLR3lYSDA5WXV2QkpRYnRFVVNEL3dCdDQyeW82RWhqb3VP?=
 =?utf-8?B?Y29XOXYvaDRFeTZqdjhQWWYzWGM0b2ZQdTdUS0NHV05HS2ROZXRhMHpXd2c3?=
 =?utf-8?B?aklRV2RiUllSNnd5TjQvMXMwTVZER3dhMnlLeFVldFdwTTRLWGpJbzNiL3N1?=
 =?utf-8?B?aE1QWEEvN3VOQzV5VC9tbnU5aklYaXBqdzB2c1kxZEFFZ281c1g5a3NvRzN6?=
 =?utf-8?B?aG8rd010MG1xVmN4V1F1TTRPNEdJcDJpclFSWHpNNjNHVlVBYWxOd0JZeVhG?=
 =?utf-8?Q?5uxSsQaItpRqmEPefTSQ6djGE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ce9ae3-fb0e-4327-d37c-08db7c9b771f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:32:16.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YjkDHDAYwDf94OSSibmM8mAK3dhllrwLi0fWTnYRVctNVYlqp4JwK13GNJfdI1OrGz+IJc9tuXMRCNQem21Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8095

On 27.06.2023 09:56, Andrew Cooper wrote:
> We're about to rearrange the common and arch types.h split.  While most
> users already include <xen/types.h>, a few do not and some files fail to
> compile as a result.
> 
> Almost all logic is going to have types very early in the include chain.  Drop
> the include entirely from C files, and swap to the common types.h in headers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



