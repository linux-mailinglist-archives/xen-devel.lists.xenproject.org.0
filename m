Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0FF5B0022
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 11:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401052.642724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVr8p-0005pB-HS; Wed, 07 Sep 2022 09:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401052.642724; Wed, 07 Sep 2022 09:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVr8p-0005mu-E5; Wed, 07 Sep 2022 09:14:39 +0000
Received: by outflank-mailman (input) for mailman id 401052;
 Wed, 07 Sep 2022 09:14:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVr8n-0005mo-KA
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 09:14:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e4671ed-2e8d-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 11:14:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2549.eurprd04.prod.outlook.com (2603:10a6:4:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 09:14:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 09:14:34 +0000
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
X-Inumbo-ID: 7e4671ed-2e8d-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/AwbhLLJ7PzPQmj6uCizvVh09kOHePBDHu8Vp/v2oyxtKjWtJW2uHWOiwWid1VOzoKBC1Owho71Tj6QF6j+IhSgpPj37WuYNUTaKpr5K5RCu7nuTZwSjbafhsm+HztTkPjJTqmxGTmJSLWcGKDCar8H2tsfzZdXf7zpV+PN17smnr6lDOrkquwmrZ+4TPSinlGEX+DPdJMygSlNlTU3oiebwWssa/KiNCUjGmfrgSFxrae92JJXiPB4oJK073/YT/C6hvPj8HN1/3yeDtyH7MB+j40Ym6fWgXjKAOIikH7mc83z7bTlgOox1DICPS5ax5MyKbPqFoxefJv1VblSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJBDFeUPxgfJcf58l/RfdXZoig3p9P9YSHMNrCL7twU=;
 b=PMOS9iQriwFVAt4c4ksn7+1Xg+MmxRW+3H5j5ZvpOX3GqaI8+w3uLogLuuucwzrzoSiETNFp6YOzvt3qGMIXf8eUobMHhF1oOk67K3z8DhNnD7gxxEgYynoWfAUv/hQxeTBs8174s3rHtVbPyvGm06hnZt0ouAjK1dqa1sJyZEYg6js6pNCSnflosYq9b8jn1RsmNroyqiw/zYz9PxUZaFKDRETmFTqX0Cgy5V+ISXxUXzxOeQMESSrh804Y7YJGHHOANNt+Rghp9rCyqqpFSGA3WWynbD1o8ARyc60SWKS8SbLd0kBOTOsng1IaNqSmUhR6XhEOEiLc4z+Z1jBdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJBDFeUPxgfJcf58l/RfdXZoig3p9P9YSHMNrCL7twU=;
 b=UwFnqoexqODukeMtNXnEeS/KN25qKexa6e/qt8xWijBS2NNH3oBvASQIfKqX/4+qWb2eMsg1D+N0X8d7oTPdzMlNNmM9DaPlkfDS6iTbpVa5KGjR2oFHCDAXjMhEhb1Leo4WLTExkRUZQClMd4T/2XEyn4P4wnqgZa9Mt5d+7otbyqzFff0Rlc62Y4QysN6RyOTDMRGRieatV6TVLaIkmNu1iJjlzWwcDLIJ6cJuHn/hqrrgKAcPrdz7iaJWszPxd7eOddEyc573OCINaLAfU8uV4VgR7T7fHeTNsStkEmYaaFiKIGCXf/natQ22Jwc77z5UFURVQi/y++2cWHW+bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ce7f63c-5ba5-f2cb-8e3e-f6dd2d9d76f7@suse.com>
Date: Wed, 7 Sep 2022 11:14:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "leo.yan@linaro.org" <leo.yan@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
 <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
 <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
 <10E7EFB2-65A4-4092-9DC5-71825BC9595B@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <10E7EFB2-65A4-4092-9DC5-71825BC9595B@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:206:1::40) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB6PR0401MB2549:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b85bf8-d124-4d78-c59e-08da90b161a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yOlL/dZdOzQgL/xn791NwGNKob97+V3XKFrO+uD1cjfkcGpxmW38Wr83q7xvYKXD35ov4B04aQUqdOBvaJ5PeGy+MrKmziq61TmHPa8G1GjhS8wWvhmj4iFmqx/Pmps3571FLo7N/aSVzIs8q11P2bfoTz82UpnLJUAe5S8f5Tb4IZydaIe6k5n9/i1jsksY+sAtYO6WOi7HMWFGnCZp8oN0pT1KFuL5xUZ2defckB2+XRmGezR9lZjJCIBeRrfhRzep0SFDeztSVQX82mkFTRMObqvyOI3pVmAmWokUNEETAsSKJOuHpTwMQAltsi+eaKjzsoioZ1B9uC5jLZzpPOLbfMqeacFQKb0smG0YSeGJ/U6kpjjuThvKI5hGEBvGsAsx/rUCYQMMyTnWSfKYq7dZN7Mc/9NsmC5z9rK1GZWmThpFhAkjKm0SYamODd69I7AyHwDt0uStjrpvjQ85+KIcleHq69xTU0ERWNDc1WKHoz5uZQuZGQO5gQxuPZulaLM7ISC7xh0UshqfMflyKI51HdF5YXbd75HJBwiq0qxcosVYG75/vDQFgeE5Le19lO3yW1J2iiShivCK4m87Z4n5KZcC7wnaE4DdidJ/VE/s1sC/beFO6hbhZvZMG/6sJBy7FJGfFxWSKouDebN34+Dw+BJ0dU1UhpDhD/KZB4Yk4lf6D2CjjHAIQMBO36LP6zQAMW5vpdKKJji8Ld9LTYTf6cxgY4AN8xJnKhZ1vXaTPspwAZ5ELZf+gh2mOZh6ZnjJ9x1aMUHJ9hPc5d8lC86/eYFmmLKm9SMzXL9vE/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(136003)(366004)(376002)(5660300002)(8676002)(478600001)(66556008)(66476007)(66946007)(4326008)(6506007)(8936002)(6486002)(6512007)(26005)(41300700001)(2906002)(53546011)(31696002)(31686004)(86362001)(38100700002)(316002)(36756003)(6916009)(54906003)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0hoZWpPR25RTlg0b3ljcGlhY1NrZEhhSjh2N0ZCY3dFdU5vQ1NwUTQyUC81?=
 =?utf-8?B?NURpVjhhM1pNNnlQR3FQcklpU0FYOGY5aFdCc01GTGFkU2dMUDQ4TnU5MCtn?=
 =?utf-8?B?K0t0Y3RieVpleVhOd3drcVVBNTdnREIwMkp0U29jNzAwOFlwallwM0JtVkkx?=
 =?utf-8?B?NFBKWTVSZmMxREdncHJKdWFSY3JQUENWS1FYaGZXakxGZitpZVZ3dk9WaDha?=
 =?utf-8?B?d0RKYThaVTdiSkN6Qk5tMkZwSUN1N055cFN1bmlVbkRleXYxVVh6b3h3bmtC?=
 =?utf-8?B?MFBhRXhWcDJzMUxZNHk3YVp1bXFic3NpUytKOTE4czN0QkhwVFpsdkwwZURS?=
 =?utf-8?B?dXNBUkpJMWJEZDVCQVJYY1Y3T2hpK3hlQWk1ekFFUzJiVVF5TlNtWTBaaytI?=
 =?utf-8?B?ZGVnS2xZR1ZDR0ZlL1VQNkxmMWxjeGY1RVFTbGVTYTFsenVvQ1lOcHpmVWlp?=
 =?utf-8?B?WmJabGpVUkJqY1JmR09iUFp4SXNLa3hDcEo0SXFGU1Y4TEMwNmVTeUZPTk1Y?=
 =?utf-8?B?Ry9OZmtNTk1ha3Z2cWx6eHpqMGVpclZ5WkE3dDhiSFJhYnh1Skw2YXNJMWR3?=
 =?utf-8?B?SC96ZUFweGtFelFSYkpkczZXdGhHS3BhTWpLWEg5OHNDVGU2M2R2N2plOXo5?=
 =?utf-8?B?RDhnTjVOMlRNeE1LYlBhRWlXMEcvaEM1VjhSd0tMRmpWcGlOUVFEeGd2U2Jk?=
 =?utf-8?B?WVlRVHpDK1Exek9IcklpLzhKSDdyRWtYOVNoM1llZjJaeGxhRlJHREJFZzI5?=
 =?utf-8?B?cEVmelVrN0NoUnBXdWdHelZMOUxuMjNUUmJmRzNqVVM4M2t1ZjVTL0xGOTFY?=
 =?utf-8?B?NzJrRHBIMlY5NTNaZjBGb0hGZXM1ZlVSVmY4b3FwOVNYU2dwZy90TTVOc1A4?=
 =?utf-8?B?a2tudERmZ1AxZ2QwTHB2NXJaRmN2V3UrSis2N0daTEpiMlFpMXFFQWtCeGhs?=
 =?utf-8?B?dEpWT3kzb0JxTUlPYlk0Tnp2U2NvOE8rZmV1OWdiTmYrKzV6cGlWcWc2cXZM?=
 =?utf-8?B?b0krQ3VjaVo3TUM1cFZrSHJjRWJrQlNSWlhSUjErYzVQZDRweXM4WjdIcTRC?=
 =?utf-8?B?UmZwR2E4c1YyK0RCV1VPUmJKV3BPVDY2OU5Ba0t2OTFHQnRPWFBob2xtbVMw?=
 =?utf-8?B?WkwwL0d2alJtMVhiTmFJK2lkL0J2VEtUSm5iaCthRTAyYndoeno5QnBXMkhB?=
 =?utf-8?B?QzlKZ3cwSG81bmdIdk5TTmdQWStmMkdNS2E0aEVKNkowWThtUE50T1lkMDk1?=
 =?utf-8?B?azBMenpHWThLMzFxalFMbStONUZraDBzb2hIeUxhV09XR1JqQXFneklVTHZF?=
 =?utf-8?B?RnRWQ0EzOFE5ejJyY0tUY2MwZlcyRS9QbUw1UTMwc0IrYWtCL0Z1WGVvY3Rx?=
 =?utf-8?B?eG9PWUNFbFEyc0pacllHZmxzSityV29WQ1hxVkFWMnNDMWhMcnB1Zm1mZ3Za?=
 =?utf-8?B?T25vUXRRYk5DR0pnSEdrckZjODNhdWRENVRIU2FVbXJJSDE4QTZEV2VLT1ds?=
 =?utf-8?B?MFFYakdwZDRFamNiK1NEUStSdEZPTkhqOEZtQjU0UjIvRkl1U0owcTU0N2dt?=
 =?utf-8?B?YjBySG1RZ0MxUlM1aEZJbmJHeVA1M2llM2ovRU5WNXpFWm5CUGNFdCtweUgz?=
 =?utf-8?B?WTBUV2I3OW4zbm1pM095TnpiVHIxdEF5VjNBUWxGRkhzRDFoWDNZaDVvZVF6?=
 =?utf-8?B?UU85aDBwMjB0Ty9UZEFPY3U5bkVINWdjaGtkZVNRSThyTTh5V1prYmpzUndM?=
 =?utf-8?B?UVZmU1oxVzU5dncrTE1BMDM5dGxqeklBOGt0dlQwZWFhNHBmTmxyUmsyOXBn?=
 =?utf-8?B?OHFIdjV3c0ppYnBiQk1VZ25sZ2tMVU9KZVAxa0VPaER6RVJUcEpydXdoRWFX?=
 =?utf-8?B?MUczREhybUVDN0ZGckVxNW50Z3lCNk1Geng0dDA5YmZBRkI1Ui9ULzFsV28y?=
 =?utf-8?B?WlltVVRpbXpBM1ZjTXFqOFlkTmI5UG5xZGpsT3h0NG83UVVnZnAxd3VXVndV?=
 =?utf-8?B?bDJpUXVadXRPYXdaZ3FRQ1NDTHdncnVoUi9DUU94QzQ4OXZpRk9zcVE0ZzNv?=
 =?utf-8?B?YnZXTmduaGxnYU43aU5RS2FlblNyUnpHTFgvam5saTh6WFJjRkR0dnlqNTFF?=
 =?utf-8?Q?wCPwdvFA2Y/hlsLXoKsOptWK0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b85bf8-d124-4d78-c59e-08da90b161a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 09:14:34.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwWw62z73V+5t6YiWi+2+3iuhiSvASXvqOcKDrUBY8SeUm4djD2BV1EFeMAg6qq3Sg2PIzitUdna+MXfvzkosQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2549

On 07.09.2022 10:58, Bertrand Marquis wrote:
>> On 7 Sep 2022, at 09:55, Julien Grall <julien@xen.org> wrote:
>> On 07/09/2022 09:53, Bertrand Marquis wrote:
>>>>> Otherwise if we start adding those kinds of checks, we will have to add them in at least 3 places in xen code.
>>>>
>>>> The solution I proposed above is easy to implement right now. My gut feeling is tweaking __stringify (or else) will take a bit more time.
>>>>
>>>> If you (or Leo) can come up with a solution quickly then fine. Otherwise, I think we still want some hardening for backporting purpose.
>>> I think a define in compile.h using stringify is the easiest solution:
>>
>> Ah! I thought you were suggesting to tweak __stringify. This is ...
> 
> Also possible but a bit more tricky
> 
>>> #define XEN_STR_VERSION "__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)”
> 
> Quotes at beginning and end should not be there.

I have to admit that I dislike the STR infix. I'd prefer a suffixed variant
(e.g. XEN_VERSION_STRING) or one omitting "string" altogether, e.g.
XEN_FULL_VERSION (albeit I see "full" as being potentially ambiguous here,
since one might expect that to include XEN_EXTRAVERSION as well then).

Jan

