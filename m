Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66578638600
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 10:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448128.705014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUu2-0006JR-H3; Fri, 25 Nov 2022 09:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448128.705014; Fri, 25 Nov 2022 09:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUu2-0006HZ-Dl; Fri, 25 Nov 2022 09:21:46 +0000
Received: by outflank-mailman (input) for mailman id 448128;
 Fri, 25 Nov 2022 09:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oyUu0-0006HT-Da
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 09:21:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92e5cc45-6ca2-11ed-8fd2-01056ac49cbb;
 Fri, 25 Nov 2022 10:21:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7716.eurprd04.prod.outlook.com (2603:10a6:20b:280::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 09:21:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 09:21:39 +0000
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
X-Inumbo-ID: 92e5cc45-6ca2-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0AFjhYiVz/3ataw4kMTG4djMI6MFvsBStsdatNk2QfQr1tqvqWzDvyhHvplLNa3BQWtYNdqOf5EPnI/gi58ftSdX2gvALJ4aGrE4uQCNBwDI7rIq9f4Ab506bP+x1FgnvavGeCEJCGCy0F0vBU9TRsM4bck/u3KjLlNj7UVJix3IKThj/6aJlVM0MFmfVPQX16Z4EOwGD89dU08gTapMeK6l9JvjUPUCMb1QLn2WhDiSDPWCZtcxkIrH4fjkimpIHcRQ1LTPCEZt2yZvurr5qp9KvMXiNrjOKC74QHsHSkSN8vdeYhd3YzT0wiSyM7I94Pk7x0fo7BntGNtQzX0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x36wMapdvsBO8qOoOwyv+jcZBZsrYD/cX/YnDitS7fU=;
 b=JZAZj+lrtx+hcoiE5rYo7kuZ8YS0pJdt2epfskoefqvJZNhRlDqJv14HGAT7iSoVrncfeN6VhtfpszTgVUJivJp1bqcur28CBkERT2AFVLg8iZ84EuojAyFQH8VkVfIAFke46r8ZNKJLSTIQJM5DqiUbvAbyRRkxvqZFmm7lqS4KdOcN9/hZ77rROPThWBm6XARG1bMyTozckBnJ7q6XdBnPJLFN+X2rgUhnqvjZZH2usD/XR6e+Z1f0g6ONkIj3t9GvsszkW6trHt4uV4tucsWbwcqOe4MAbMyC9RVk0srCxHzfx6cnYfq3GroxpfDVxrZZ3fR2kb9ygfo1a9Mr2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x36wMapdvsBO8qOoOwyv+jcZBZsrYD/cX/YnDitS7fU=;
 b=Q6k77pz5kth/q5dEHRuAf9HFm1DKKEhn9qewDlAMQ/5iXPrX/Vx+h9B5f+Lr4idnbSFeWJIB/MuuRKm/rmVQ9ZyFFbfB1M6wtP0sziNXmqwCeaxVAieyIMpvTa9FhRAW84mQfhA1N6McfHknGJJN7hMNSIL6WU3tmB/XsoL7/ubL6avDeOspRY+HNOqSmkObUcDmtN97t/rKC5ek1rka0PNYt2mmINlxcfsnELSaBel50SFn/SV+dOL4ATEIeoYRJpaEoL14pM4UGksSP/n6R/1jvLniPPdzgY56wiSwgOQ7mUJZ+zATPNsQoTZBq5RysvI50ZSo4jyHLG4tKBAkEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea77d0a2-b701-11e8-afb0-2c8b7ed4a033@suse.com>
Date: Fri, 25 Nov 2022 10:21:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [xen-unstable test] 174958: regressions - trouble:
 broken/fail/pass
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-174958-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-174958-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: b31f8e9e-6416-4434-dfaf-08dacec6755e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S4zCUFknVRmqfDw5mmTkN+Htsurzdz3Grs4KqeiVqxAP79jcquCwvwjF8ohwOpQ/8cSBGp7Bc2eMRoXt9Tk+wHE06KWglnFXZwhmr51Us7w9v0H7C0tBDbxVuHy9ebC7GC556b1w3ga/zcN9X5smgJrXygHAvO8tFo+WJjiKUXGq7a70GoY3UrG1PSVQ5xf7yKmdpVbf2B4pmAhCxsebEzPkvW3fuPQoqFGXpqJyIDVSwGO8u+b9G1MsLnhw8WlD0cOorbjpphXBRSfKc4GzEQcLa9kpJZodYKX7QJirRAa78fB8v3U2p8u5ISFaFSF9Wuozxbpff6jrpTzhax6ZKvtxk15T1oUBWRBmzr6xhxADT2nxOR4LdptZfqm190To8ckAjNQSe8n2YU7gUVT5T8ibJ2RW6AKTuUuO+ZA2fnvfXiiRKcnMnMzs5woO08iM9Tkz1Lmo+AhJRQc0ff+3qV2JTlCcabuuJy8iAF2efxfNdz4lbEHI0rKRe4AHUFSg0k/iAj/k2oHtrBaVr6fjZBzzZMutgdsUTSlZzpz6StQy/e6kRy7DNylJpsfynUr2GNvSkQET93s18aw+W4HHwJ7Xj3J4S2WYuI7HfS8Qyla+RE347FkuiyI5662XtpyBINCQzvpMtUDlzNdh9pyKX9vgqu/QapskGGjeJlTrq72SRjx8yy1Nz8P18tu32wrRDvnszQULOe6/ylNkYF+eFyl/sCdrIlbUwMSmdTn0G6EBg1rSUwh8Y3AOgchjcW9BIbZEZwyFA8eElFzqpekvcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(8936002)(4744005)(4326008)(8676002)(66946007)(66476007)(66556008)(2906002)(41300700001)(5660300002)(31686004)(6916009)(53546011)(966005)(6506007)(38100700002)(6486002)(36756003)(316002)(6512007)(2616005)(26005)(478600001)(186003)(83380400001)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlNRNmtzQjlVOUdjRk5sOGhwbW5RTkZadm9yd3ZxVG9BcWtLbHBudDB6bE5R?=
 =?utf-8?B?a3grNkYzb1JLcUxPNmNxOHQ2TkY1aTNUZHFtYkU1QVdvZDBpTXhCVnpwL05q?=
 =?utf-8?B?bjFOeFJIbXNIbGtaT0FnQUdPWXV4UFpKNzNMcXNmLzc2S2E5NHZyM0FsMmZG?=
 =?utf-8?B?QzBIU2ZpU25WSzV5MlNYTllKQVE4UlVBb05YYm9Oc2J0d0Ywa2ZzM25iaXNM?=
 =?utf-8?B?ZVZyT3l1MysvNUh5UVpZOTRoa2E4cGg0YWlNejViemtjNGc4aURteGRNeC9Y?=
 =?utf-8?B?bmlqYzJMTVRFbUsrWEdCWXgxT2FlZEdISFdIRDFvMmdTbkpTODE1SGVhcWVZ?=
 =?utf-8?B?T1lQZ3k3SkRGVEY3NTQ2eFB2UmdESTlkQWkrV2pybVVYeW9QYVFkVFFPN1RF?=
 =?utf-8?B?U3lOR0toajhJaUxyZVc3UGhhWWRJZjlHOFV4emNkMHhNdklTS2d0b0VaekNo?=
 =?utf-8?B?Z25FNkRSSk1zQzBBbXBMSFdHUlQzRG1GZzM4bFZ1Ryt4dEJvWkdVQW5jRFNo?=
 =?utf-8?B?TEtBdlJTb1RtMzZ0NmdUSUZnMEgzNVpaRGlDVXlCUGhodC9RYlpBNlFaWk51?=
 =?utf-8?B?TUxnd2VwUDV2OHBqM1lUVUsrMFZQMWtyYkhBazdSODI1WU8yeklNbXo3MnEx?=
 =?utf-8?B?SmdoWWZjTlFVL0kzQVcxY0lHRTV6Ry9wVHpjRUF1WVNrSTVRTnZ5QmRYVFB3?=
 =?utf-8?B?aFZvYXArN2Q3RWhHZHZMZG1yUjNPNGZ2aHBzb3hhOWtsWS9qcW1XVXJ4ajMx?=
 =?utf-8?B?dFNpRWtML2NaNWFsRjhBeXVjVEVGOFpGdHJjSEJORnFua2dXZkMvTEVHOWxq?=
 =?utf-8?B?ZmQ2azAvd2tWM0ZQSUVxTGI1ZXlhRGcrM0R5TUo1bDRLQVdadC8yOHJaNWt6?=
 =?utf-8?B?eGlESGRHVkUvQ0VPTW5wcWt5YkpMUnNkQ1hWRW1NdS9qTG5NM3Q5UGM5N2hO?=
 =?utf-8?B?RXlkeVBlbmRidW8wVlBlUEZ5c3FwWGxLcmVmWXBOaFBtQk8xeEgyenlJVXh4?=
 =?utf-8?B?MUNCYTZjLzBwMlBXbkM1QkVrSE9wS3d4eVVSeFQrdkZBSDZIK1k4WEkyOWJm?=
 =?utf-8?B?ajBZbmMzRW40M0FDdFV1aU1uQ3ovdUVhclhtdkxkUnBrS3QyY3pmYjlEejhq?=
 =?utf-8?B?NXkxZXJjRkhUUFBMT2tCVnU2Q0VaWXNsblR0T1RiNWJpa2ROeG5BT29rOTh3?=
 =?utf-8?B?RTR2OG13d3AxcHVXcGJ4OGo3Nk9QallqcVNYSlpLVWdYazk0QnlDbmUvM1F2?=
 =?utf-8?B?cHhYYlZnU0x3WXdPYm42b1VYaXU2dGhTaklLYVFBRi9YUTBXbnY4SzVJaTcw?=
 =?utf-8?B?L0FuR3NPV28yUU5CQTU3QWUxYVVCcWpScnJtTUFoVW9XZ29BR3pWemM4N1I0?=
 =?utf-8?B?YWNaMEtrME4wWUszcE1nbEtxVk1hM0tSVGk5eTJXeHdWQzBJUVk5NUk2TGxz?=
 =?utf-8?B?amZ6aTFLSHpob1gyclVuQ3ZrR2hjL3ZFcG9FdWtSMWxrREFLcndoMXA2bHpo?=
 =?utf-8?B?M1VVNzd2L2hXSUdQbCtjeEtlK3FXVG5QM3A3N1ZkcXpkZVNVRFAzdkZrLzdt?=
 =?utf-8?B?ZVV6dzVTSGhJMVVNR2hNdStLeC9sanpaY1NiWG9jS01uREJrZUlKMHFkdVFU?=
 =?utf-8?B?enJIdHArN1ZDVkdCam1aaG9tUUZQcGZjbVVQQkZzMEdCWS82M3hsRlZTMm9G?=
 =?utf-8?B?Y0REZGFyM2RDZnJ0RVZ5Sjh2REpQQzhzNEozYjV1TnJnY1JyQ1dNejJkMjdC?=
 =?utf-8?B?dTYrOTgrYWYvTlI1U1JEZGIyOEt3WmdVOVNvVHlTZjRHckt6WXBNTG5nYy9S?=
 =?utf-8?B?SUZKSlZURFV0bjJ6U1Y2YzJYMDZUSXRGQWZrNnJrR25NZnU3em5DWUNIMVVG?=
 =?utf-8?B?SWROM0ZRdnNhOXFlS0VTSmtFQWMzNngrenYvR2RLZ0RYenBqN1U4VFoyWW5E?=
 =?utf-8?B?SlY3WUt4Um5DbnpjSndIUzE2Y0VuYURIS1NCQ0xGZW4zNmtrZjBQekl3TXFT?=
 =?utf-8?B?dVpTMVhsQWhrN2NRQ3R2K0pXeGN4aGhadHlyYXpxRUlNRkxZaDJyams3eHFT?=
 =?utf-8?B?Q3FoclRTVjBvTHkxZEszVjNLNUlOUWRNTVVWTXh6N01rTzVVaDVRK013R1FL?=
 =?utf-8?Q?3CT9jCcnJkP6cCy9UPgt0rLKq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31f8e9e-6416-4434-dfaf-08dacec6755e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 09:21:39.5907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4mJLkSyqrS8GL4q/NIfFRIttfDcz0RD9d5xW8aMNOzWTUll833v7UH6oWD6qRmFHP3PXGlLzluIq8u+2dg3Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7716

On 25.11.2022 09:10, osstest service owner wrote:
> flight 174958 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/174958/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-migrupgrade    <job status>                 broken
>  build-arm64-pvops             6 kernel-build   fail in 174950 REGR. vs. 174958

Just out of curiosity: How can an older flight be a regression vs a
newer one?

Jan

