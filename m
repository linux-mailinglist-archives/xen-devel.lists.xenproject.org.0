Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45264C5B0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461885.720047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Nu3-0000SS-9s; Wed, 14 Dec 2022 09:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461885.720047; Wed, 14 Dec 2022 09:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Nu3-0000Q4-6i; Wed, 14 Dec 2022 09:18:15 +0000
Received: by outflank-mailman (input) for mailman id 461885;
 Wed, 14 Dec 2022 09:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5Nu1-0000Py-Ia
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:18:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7e28bb-7b90-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 10:18:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7832.eurprd04.prod.outlook.com (2603:10a6:20b:2af::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 09:18:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:18:10 +0000
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
X-Inumbo-ID: 3b7e28bb-7b90-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+v72wj6U0+TIiBETqY1rTx2L3Cvm0SDw08xE3xgq0fgbfG9FUKURE1qeLQo55j+NI6oktwvbQcrky3LSh05cQXIsWBHhoThUxePWc50ixN4W5EdIdMkk8t14/0YprdLpAPGwMzrNqW9tRah0RrEA274EujY+YJOrSsr8nYFjRSZcYe7Ryj4KasaVdyvtYs2cxQ1HdBkTmp5rrddU3wLXv1QUTJLYwqV3ZRWae5LHJcERCoOEvRKvECVP9Q68SqPz9V3MF5gk4mkUMbjr8zCWDcnkpG0aWXHONRJVVyQz0L7XP/r/1lB74uCJC17MFxOEsDKVL7TWSE7TKrJV0iKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNepkMkD0YVpjZ9cJ2L9o8KhZZiDjlnOkbz6d7ke/BM=;
 b=E8WT55BpBUjexW1iX8g0hMzCj83BBnsVuPQ2+wrpEPSkokfCcdU4468fBWNv9QULlR0n1WF1lkLrYjHu/wG2Uje03AJpbY5QTHangN4nAQcDMFwGECa5UlZtMHv0XLyYTdf5lOQwE3YRgfmOD+DKHEYXg5/sOGHpKsMf+pde1JXoGqrEDDHqY4VrJVlSWl69m04y1TOGbRFg9lPAJQT4Vsh5rQPDhTYy5wYRROYExo/6OoZLIILyazFeh6/FWFmRsh3RB2G5SHfwhLaAMkvlnEilqS2Z74OxKrXqRJrz3mVLbBDNSMviG4No0Z4Phyf9wLbbsNIPZMgYbS3Kjz6KLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNepkMkD0YVpjZ9cJ2L9o8KhZZiDjlnOkbz6d7ke/BM=;
 b=Z/ltjlIqSavDxK5cXT41KFuo2FdqFsnCPL8QM1FBvYb1fBC0vuaLtaM/RY8BnqhzQ1jBhKnKj7DG/2AP9sB8Sd7N8W3u1neF827yOljvhBZAvXpDZLiDq2XkBoj/fPQgHV8p6Tf5U8zeLas9ChSo1kcJE2ruEFOruKeCEo39byHf4WiTlRo2xwtEsgeneuZRPrm9eMZ8wdV7Z+wH6ZiPUfRgPdJKcLeBXGvPzOvKlZTjAJdYti1SYRil5dObdO+c4+zVjobRuFVAeHoPmpz3YC4RtBNNPVouPHH1b46ZPAQRihnZBOrDao0v208i09JU3CzDYSz+b9FoU3xbwZJy3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cfb2a7d-fa47-b386-b6a5-305b11f2ce6d@suse.com>
Date: Wed, 14 Dec 2022 10:18:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 0/6] Device tree based NUMA support for Arm - Part#2
Content-Language: en-US
To: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>
Cc: "nd@arm.com" <nd@arm.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221118104508.768274-1-wei.chen@arm.com>
 <SJ0PR03MB5405FBAFC3B531CD150E6C599DE09@SJ0PR03MB5405.namprd03.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <SJ0PR03MB5405FBAFC3B531CD150E6C599DE09@SJ0PR03MB5405.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: cad1b643-287e-4031-78c8-08daddb41ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jkCV5btlOv4T46U0IzBCBOAjgfTyF6WsXCtTjcqNyle0skUOO7QUAIN1xYBAy0EQOS2RlYO25Tq1U41CvSf9Mu3pTfJ7BXX0HA6GH5cx+XqgLin3gE99SUhwMklCgGibo19W4xOb0PhtWPZJZytYzEMdaN5tpXBJheyRQG5/5FAUTnIFs/IeIMNE0cQctVvT+35sI4IZxdox02hM9XZhRBmD/oAeFCJuYTJKOJlGzBwQrW89rwnVBfOSkb+xQfJti/1YIQ99KsEFOWkMbS2/bTD3UvbGsN2cPqnMe62gZu0PgR/NWvuPe5w2pR6JB6Se4Gm6Pky8tU1ZH/nlhHQ0INTRfM6iICapiyu4Ayv8l/S2vBJVS8F9Y5beDL942j40WNa5c/ykbKeUdTA9KpTHUKttDAp+8ap9ilUq6GmOVjNAUV9A9cqExEYbWDo+wGjGaUC/inAsDxTIxwTXZH6siwmQFxHT6ug6uoRZM47nYfZNXfmVeKrCG0J6Yl8UVNa1uYyXfeqJi5cVzOh6fQMmHfrsgNXXfbj2mRl6p6aXaX1zSGPIzWC8ZPyHVYg7n832wnx6dUAOjVGUTuPABemdMHkRnE1HkTikXILFmTzmcx8GPnpNkmDlVxWbQs6230LwFb9Vq9lo33ykUuviWcdMSABM064pdXFPIHQgN7bFI7qG6ku4VaZrcLpVu986cCvmeacoad5J1s810oYAgSA9jhtpvL9m6rKcKi14u99Ea/SrgWbBbrB3kKBYNSJEpOh+10IemIuk8ZwfXXawdhAu/nlnaS2yrdzAc+WY6VMg5BaAXd00yjRXbOuMblcJpNw1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199015)(2906002)(31686004)(36756003)(4744005)(8936002)(41300700001)(5660300002)(4326008)(83380400001)(7416002)(31696002)(8676002)(2616005)(86362001)(186003)(66476007)(66556008)(66946007)(53546011)(6506007)(6512007)(966005)(6486002)(316002)(26005)(6916009)(54906003)(38100700002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlR1S21ZbEd5eTB5aU1MVWtRY3ZQRFhFcEdmYUxZemkyRkxpOGN5cnFtZ2Jh?=
 =?utf-8?B?d25LNk9xQ3VyYVVjV1pjOEY1T1BXby92WS9zOWp6cEdXbENiVDNuaU9rcmVS?=
 =?utf-8?B?NEdVNnAzWE5XSnFQQk1ESDA5Q0U4WStzTGF1MnI3bkNFc0NDckVPc21sVjFW?=
 =?utf-8?B?SitMNXozQy9ucVVHc3FlSzhFYW51OHZXRHpFZWRzTHlKNG1qNklSMzJ4dzMx?=
 =?utf-8?B?YUw0aHY1Vk1QYWtLOS9WS05iWThqblQ5cGRGZXdHRUJJWGRkZlBYN21kc1JD?=
 =?utf-8?B?c09XeWhwL01JaXBMOTE0cm83a1hGRzlkaFhIemRCcEtiTHBVbm1OMVgvT1Vn?=
 =?utf-8?B?eDFLSC95c2RJaDQ0TS91ZUc1cEErN3R2NXhtUFBWVlRnaURGZFpNa0NGNTRU?=
 =?utf-8?B?WlNSZXVVb1dBcEFONmlyUXZEY1Z3NVdqR25ZR0Jqa1pzUnZhc2VnTUJvaURW?=
 =?utf-8?B?VDdVSEhlUC9jYzRZRVhpM0JjdG82UWlMMFViTWRud0ZoT1lQZmlmOEh6d0No?=
 =?utf-8?B?aWY2bGZVOE1QdktkblR0b1ZTNVhLOUd0dXZEWDYzQWJ4NEJTSS9iR251Q0xm?=
 =?utf-8?B?YlJMUVg3b3VUNzNVbldtdGdWK2pFK25lNzlTcWJrUnZKS1JsTjNGdWx4V3pv?=
 =?utf-8?B?UjlpZnNHSW1wOXZlVHdRbWNvVWtQOHJ3bDg2Q21ScjhYMzk0UDRqRjg0Tkti?=
 =?utf-8?B?bnRpVEVXQzBneVlSemlwVVp1M0J2ck1KdFg0TTNkZ3FOWURWa01VUWZuMDhU?=
 =?utf-8?B?dFBOQTlhVDJwdlpuMVJxeW5rbE1VREc5Vlp5c2Y5Q3ZRbkVxS1ZKcGRpMFBw?=
 =?utf-8?B?WEJOa3NYbHFhRVBOcVQwZXJjL2hKNXRUY1FOR01RRXRJWEd2UGpOWlNWbGp1?=
 =?utf-8?B?ckNGVzFmQlJpK004aENwcnRDbHc3d3FIbDdiL2dFYk8rNnQ5Y2QvZnBESFdO?=
 =?utf-8?B?Y0Q2N3FZMElTaFgyT0ZGb3p3aXpMbHJYUnM0TjJwWWg0MTVTSlRPamdvZHNH?=
 =?utf-8?B?U1h3UExiSGFSNStDRkh0ZTE5dWU0TXNNVmZCOWkyU0loZS9IVHNsQjFjYjJ3?=
 =?utf-8?B?VVVxbDVMRUVYMjg2d2ZsOW1tSVBiVmtVZThXRk1HaWdCZFVkT0ZjZlZTczMz?=
 =?utf-8?B?VzNGM0tRRGtpSnlaQkZBVkNacUd6MDg5NDAwWFA5cFc0SFdFSUNiakRwUjRP?=
 =?utf-8?B?ZHdacFNXZGRBLzk4dXk5M2R3cjNsSWVJdFV0S0dzNkYvcFhmU1N6OThwa0xF?=
 =?utf-8?B?dzN1aW9ldXRFL3JwYXFOS1h3UG83SytCcDJwWnJBb29DUUZEdjBVRlFyYlcw?=
 =?utf-8?B?dm84MHZ6dWtQNE4yYmRQOG1IVGtvSm9vN1AzVGhPREMvbUxPVTRianJXNWZl?=
 =?utf-8?B?bUEvMVRUWmFCUlREQldGTU9iVWhwNjExNDFjK28waXc1TDJkc1owWGVKWTlX?=
 =?utf-8?B?aDRpdHFxS1BSTEUrZnhyNUwyd2IxemduM2RiWXR2d0dlNlNUQVhFdkE0OXlX?=
 =?utf-8?B?MzB2MVp6WnZmTW9jZElIdFdlRXd2OE1sNE5pZzV2eFRyUXZidUt0ajRnYjBN?=
 =?utf-8?B?VEFiSkNneU5PR2w5eGJTRUdPRmFJbWZuRjZkWEdmM09jalNiMU4vbkVOekFr?=
 =?utf-8?B?ckhUb2VuQTY3OTBiWlJRRDgvaGJ0MkJ1dDBxeUZXQXlFeDV0MnVmQStSUVFs?=
 =?utf-8?B?Q3NTQVpaMEpGUS9pdG42SjEwRmMwSHNtRzNyTGkzRmI5WkY3YW5zMWk4VEFo?=
 =?utf-8?B?eC9sVG9UQkFOTnRFWVovSzREZTRxbmtTb1Z4Q21HcmNoeGJMUG5XdHlqRWha?=
 =?utf-8?B?Z0tFYnk0ME92YVc2U0F6QVNsVCtvOExtTW5VT3RSRGZ5MmdudzZDUUhoS1pX?=
 =?utf-8?B?WC9md3lEaU1qZDFpOE5pWE0zMXplTTZsWGRuZGNudXVXTlRQQmxCQituNkVB?=
 =?utf-8?B?ai9qbGRLazBiK2VZL2U2YnJhTnE4L0RvMTEyQ0kxYW9PWTAwYU1JVC9aRDdn?=
 =?utf-8?B?aXUxV0lqZmgrUkdla1JZNkp3TXJsc3BoVXlNOFBVNnFxZkRMd2ZoUEZNcjRr?=
 =?utf-8?B?M3lFZlNabHZETmJUK2NjdU1RYTRmK3JhMHhBUy93R3BzMDVadi9PUlhoa2Ux?=
 =?utf-8?Q?XqL5VnevQ0do7Ef6gvsx7uawE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad1b643-287e-4031-78c8-08daddb41ede
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:18:10.9032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvpcjUfq8eMW7Qffwr2pNxvvjhWIciL492s4Hz8t4VHVT68SpPvhY2Kfrof9L8Evz8eG8d8AjMcxhtv2TPgSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7832

On 14.12.2022 10:00, Lin Liu （刘林） wrote:
> Our internal regression testing detected a panic recently.
> Could you please help to verify whether it is introduced by these patch series?

Please see
https://lists.xen.org/archives/html/xen-devel/2022-12/msg00879.html
and
https://lists.xen.org/archives/html/xen-devel/2022-12/msg00887.html
and the draft (partly RFC) fix
https://lists.xen.org/archives/html/xen-devel/2022-12/msg00908.html

Jan

