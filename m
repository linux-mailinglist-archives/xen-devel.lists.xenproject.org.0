Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA879D2AA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 15:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600503.936151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg3mE-0001sE-6r; Tue, 12 Sep 2023 13:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600503.936151; Tue, 12 Sep 2023 13:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg3mE-0001oy-3R; Tue, 12 Sep 2023 13:50:02 +0000
Received: by outflank-mailman (input) for mailman id 600503;
 Tue, 12 Sep 2023 13:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg3mC-0001kP-P9
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 13:50:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4373161b-5173-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 15:49:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 13:49:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 13:49:56 +0000
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
X-Inumbo-ID: 4373161b-5173-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMcqjPGyyVeFB7qiKPtmhiZ9xAgm8rYNEb4HIfLPIIG7NLDC1SRHnEKhg/IGDMRCBXrDJ3vu+DECxIIrbOoYBGxboNCVSOogQKPoBDtXMmti0Ci07o2DuQGO8xTeLfAUyjyks4op1GrdF0a8sZTCmo+uJnKSS3GIxS62l2JeI7aNW5wnG3SKAJ76As2phKpcF3+jPQ7w/HBLlaNzdzeZNyfVQNhIg4Uk/NU4fbA9tHlHkzkCLXspzI2jxNGx3WqDLQHWqtvymdFBMc/9VV24f7NgfOtel4E9erDMsWXgc8Fozm94P2N0ry1sbUEFsLbbfpLf6o7pL3S8KO1aWUTi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb0dC5oju91ycHO9jKJuPxTBHa5OMv7WvdPcn10STjg=;
 b=VfWeDZuLd2qN2xyjUKhrJM0xXhznggtTRZv/9PZEu6HULcgXjR459p6fUleFOMSkyiHsFLIshyQFypVgsFP06KEfRleZxaXv1xjioZe6+nVUhX3ycbd9dpkvmxAY4hhHqnsQ59Axq/YSe322HQrI9MpVAqZ/HCOE/y7PBKmqFLoR2XX7jdbOqwb3/JRObfcE1/FTKFijvkWulELyTTwtCH0uSvTCwTdFAQh8sz2CtPSsXJ3+NzjjfJnYWkQOEy7sN9pbzwoK3g1LrzCV5oD3AKt4pcH6nL8ihEP3wqZT0zOhIt+IIZKvTIYP9T7ZeZdhyYIVZ6MTRxYcBzRILHgmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb0dC5oju91ycHO9jKJuPxTBHa5OMv7WvdPcn10STjg=;
 b=aVVU+V2H0Jn9xTxLiPEJbuSL667fURGNRuXtnRPWrtdZae+PjlqbtMhweUJfj0zEthTC9/uOKr/9W89IyggPx2WMfP5DZSRB5/WL3Y0+5LK9/EIS1d0U8e8OaQYyPqsPeX5RYvzBu7GuZg2cqRcBmzOapk1N2y4BUql6d9zxUQzxSvZ81HTTfmIWbuWlCjfSYoY/mQeGpS39f3IFxD2TywzKf49wHg4F97Caj45KbvgZvhhegUiNSLmcSYgl2Tryl2QJUXDDzjMR7zMWDQAoTOxAX19EhQiJ18Nb8ZeLWIw+viFKQIRKOs/7cVjCHnzg2hZN4C/4FLmuiT7j9JDEPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efaa720e-0119-47da-3e1f-87fd1413f232@suse.com>
Date: Tue, 12 Sep 2023 15:49:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/IOMMU: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <fa7f0000b77ed4930d3d1e5b97d6fd53a26b7390.1694427795.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa7f0000b77ed4930d3d1e5b97d6fd53a26b7390.1694427795.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3fefa6-77e7-4d3e-5e0f-08dbb3972612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZJcunkCUG7F4bFxilgv7wzlyMgm1laLAFp+Mq2oIeaEVizqWe5IgBNEYvqd7yte2UVFnxSaR/HzlfIsvZqj4otvGPG1Xs9BXC4FWSAeOWerDc+DhTCdxqvYhBmpOWSqY26N341nvOwQzqH9aA6iftjVkdh04caXt6ZRp0lVPJfoQDBX76uSxao7EK3Z6gx8sKlS4nbiFq+lvGjCDg2vbH7yEwD9YxKxTtRkUscjiTc3edNr0dlhzWCfnUxh4UTpd/PGcHqrkCuh+Em9xB6RhPr6VdxNSf1jCl0n6Id2W8eTfMgAOnweKxrS8b5PvaIIfL9QEGHFMaUrxvR2JnDwF8nnIMDbOhLdMA+ESGtQ+X0Y1XwI2eHiZoZ8ukllmL8vZ3C47vmIqD1N0dBydLJPy/4bXPAMAw4DXcaCQA1p6s3p3Bvhhqcn6gDIIzuoM4z9V7noTlJZ+ji2OST4Aw35qw+YAlCDULvPUb5ziFXy1aH0ysrOPj1K7L6sE8xn8CSD9o5XzuavA8I2wp83qjDJXezdeVOCU45PdGSVmMlOe9WzOCzOHhfeMEJo+2z8WBPYBbbNp886G+8smJJSad2ijx+wwRyxL0nMdDx6149xGiEYRDBqNKSHYZuss2xiabqC1TxE0UFs1xzdg9iP2PmtAhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199024)(1800799009)(186009)(2906002)(26005)(41300700001)(66946007)(316002)(6916009)(8676002)(66556008)(66476007)(478600001)(4326008)(5660300002)(8936002)(31686004)(6666004)(6512007)(6506007)(6486002)(53546011)(36756003)(2616005)(38100700002)(86362001)(31696002)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDZFeStIenZMWVBlSHQrdkdwdVRLZDE3Y3QwU2ZKRlVObVR6M2Joc1R4bStz?=
 =?utf-8?B?ZlJqc1Q3cWpUU1ZpNXl6Unc1QlNxVXEvL0d3aEdvcFZxZldQd0c5dStMa0pp?=
 =?utf-8?B?d0FjQnNZUnJaMms4dytGSHZmdzFXVEVvNEl5ZGxaWW9yemt4dlJhQWVKVFpC?=
 =?utf-8?B?Q3VIYmdCQkdjV3FhanJVeHRjdmJTYlo4WWdldDFUc0NuWDhvRlZkU3M0YlA2?=
 =?utf-8?B?R2xWcVlwNGp4bkpxanJ5Q0RlTi9GZFNseXNuMHhWWUY2Y1lVdkwxSHZDVnJv?=
 =?utf-8?B?d1AzdGlLSG5jemNjVnE5eXZPMENHOGxpSWZySHpVQ0xhcHlIMm5henN3R0dX?=
 =?utf-8?B?VXo1WWFqejNBMGQwaWFXaDZUSUx5dlZJUGhmOWFRWXJudFUyNTlVTFdIZHp6?=
 =?utf-8?B?Zk9zenVkbXErQVo5SFBBdnAvWitKL0gzZVFhb3FNcHdWQnVaRlloazcvcXZT?=
 =?utf-8?B?eHBJZlQya1dIVDBWcnl4YStnVjFON01RWmNad28waGpwYWhtNUJ3SVFZQlFn?=
 =?utf-8?B?REpBcGhxQS8zYjNOSDdWL1VCcUtZWkhnbkxtR0xDL0ZxK0puWEp4SW1OWllt?=
 =?utf-8?B?MU5zM0dOWURESDdsUDcreVdpZ3kzd2ZTdDRDMFdRVlE2Z1BHZnFnSEF4eGNj?=
 =?utf-8?B?Y3duNitYUmozZ3VRdnk3ZkFsQVBRQzZFdG5IKzBHbTVqSGlRUUhCY3AxWWdL?=
 =?utf-8?B?RVQxQ1VIUDVLdGZsKytpYTRPVi9HQ0Y0NmNvbEp1SGV4MmJxMXQvMm1QUHlk?=
 =?utf-8?B?Q093YW1QZW5CdTk3ajVRR2I3S2ZaNVpiZlhDL3hWTCszbHE3Y3VNd3c4ejk2?=
 =?utf-8?B?aDZlVjE4Q2JjVk1vWkd5eUZTVEx2VnZudTUvdDVoNkFpcW1oWlFJeGpSam1J?=
 =?utf-8?B?c1k2OHMvOFZMRzBsdENwRkhuM2grb3ExaU1zb2h1QnI1Y3Z1Z1QzZkJDenJn?=
 =?utf-8?B?cmxEaGhYcWFqek10cUUwK1M5MDg5cFhMcXBGNU1heVY1TGdjY0tqSHU4Zjho?=
 =?utf-8?B?dXRXc3IxOTUvUjFMUDk5SXVMdkN2bEJ2NG01NFlyeUplTDJvTkFNWUVjVTEz?=
 =?utf-8?B?V05qdzlpOFBEU25Pcyt0TW82VlRNV09lQVhpR21yZVJESXJ6UU1wOFBxb2E1?=
 =?utf-8?B?ZmsxbmtoRHdUZGNTbVFMRFZXU0ovVGJVMWhZY1A1MjNOc3hMenRwNmJ4Ujh0?=
 =?utf-8?B?NmVLVUY3RE1wbTBtQkIzQ1RQcW4yTFJIbjJLZ3NLTWhXckM1dFFKY1N3T0JG?=
 =?utf-8?B?UVpJa3B3Ly9TdjhWYlEwbnR5S0E3b3Q3dUZhZFZlNm15WU05WlMzOUNUY0NE?=
 =?utf-8?B?QzRGRVlkcW1UdlFsc0dWcWJ0NTBOenJxSW9TZ3BxWlpsVGdEVlpFbEdxQS8z?=
 =?utf-8?B?Y0FVVjI4NG1ET0g4ODhpcXJBRjZsRVBxYmVhenV6bDBNaWRlN2VHVXlQaGtx?=
 =?utf-8?B?b3hvVVJNeFF4SkVQaFFVZUtZT0NncU9ZQ2ZGRUdPT0RWNWZmR1oxR29OcmFW?=
 =?utf-8?B?QnZmajJubG8vVlo0QU9uckt4bGtCTHg1N0Z4MzhqeHBUQldGbDRhZUZmdnFk?=
 =?utf-8?B?NFlwam9JT084clRCVFdzeElvajBYMDhibG1YZ2ZIQm9HYXI5d3JRSnYxbjFu?=
 =?utf-8?B?WGZKbEw0VEd1WU9ZMkMrelBoejlTb0w2N3hkTW5pUGlyMEg3TFcxUGNDUVB4?=
 =?utf-8?B?ZGFGeWdMTFBScjEyWGZIbHJsUC85Y2lHL1BhWVVKa0tkZ3RJQUZ3NGZtSjhr?=
 =?utf-8?B?Nkt1TWpkV0NaMkppR2JIUnNoUVh0L3AxWDBBbW1rSzNHSmk4RjFtRFZtblJ0?=
 =?utf-8?B?SHI3eFo3amFMNUh1QVBRT2Zlc3lSRERYRUNHSXgyRkJsZGlWNE15RVBvcG02?=
 =?utf-8?B?YUZrV3hYMkM4OWthUGpGNzFkaEFjaUZkZGxlcm1ZYklyNFNMUElHMTdHZXJ5?=
 =?utf-8?B?YWFYRXBZd28wbzYzWWgrRDdaRDFISmtVUTR1RE40bUYzVzVrNE1TNlB5MkZW?=
 =?utf-8?B?VzFxbGVHWjBKZGIwWFQvUHpFY1R2QmZNd0RaSHZPWE9jdzUrazZNOVlHa2NU?=
 =?utf-8?B?ZVg5MFY0Z1hvMkN0YUtLZmh6eFVEYW1lWWU4Zis0ZkwxSlU2K0g0ZkJTOGpX?=
 =?utf-8?Q?OmmKEiPOobqB2HtnQjEXifxgO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3fefa6-77e7-4d3e-5e0f-08dbb3972612
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 13:49:56.4971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z467hGT+YBnFKTicPKIZ894jrZ2VM3UwZZavfXc3RD3u/vTx41EEMTJ8S4RsHh9WtJtqGnaY2EbsG8QUKeU4vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

On 12.09.2023 14:59, Federico Serafini wrote:
> Add missing parameter names and make function declarations and
> definitions consistent. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



