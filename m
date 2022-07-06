Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C4567F95
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361817.591523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zBE-0000Tk-M4; Wed, 06 Jul 2022 07:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361817.591523; Wed, 06 Jul 2022 07:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zBE-0000Rv-It; Wed, 06 Jul 2022 07:10:36 +0000
Received: by outflank-mailman (input) for mailman id 361817;
 Wed, 06 Jul 2022 07:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8zBC-0000Rp-JF
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:10:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9e5b9b8-fcfa-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 09:10:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4422.eurprd04.prod.outlook.com (2603:10a6:20b:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 07:10:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 07:10:27 +0000
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
X-Inumbo-ID: b9e5b9b8-fcfa-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx1oJqFt9za+wtjWZeK1kd9uNoRo21+Qi6eJuRSpRqV5JaEU5/jdXw0QP0FpATTRQ07PCN6NTCLHqh1ylQ7E8ybnUTu0TRDhAq+nrlfppSd19mceLum6TLUdHD1OAoOy+5srcV2l9UuekWH/PxVvUj1ZTynduF8tq6BNJHB5KkAP3Z9/xhM6lhB9GEhfJaCKfCpBksR6hlLfRLO1jq6Vy93qGVKhE2GkjROG4wLRTkcLaKcwlGHetbuU6AlNZ0DBaAKSkuXkpQjHadKwdqa4Sn6vKlh/BDnFWhwRb8kRR6RQz73MQ7heJ/j26evIYRNOM4NNYgFqiphtlSKEhPJMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CD9/NiGIUt6EuxRGUHKkxxWTlFzw9ckhYkOJsrDL13g=;
 b=SRzKcSif/1GiE2FS86I8rolqgzHiIAevA7eefBIR5V3wwL9RM2P7HwAqeX6MGAHH/sqdV5kLokY4/P5d0qa4oBE13qWMyGAbjrNkOmhlYRUzwUhWAwMcbiVLTyWU5vdJjY9TYLCv9Fdpg2cXCZ0+tHvX+1TRK+kMphNnQR6Tlf/xmeeV2TWtjw5gu7XcFstuM142E9sLTUp+wiMuXGfs52zBtrIxv+K6wlWrhbifabYr+vNVvhP1pVwQnTOHhZK2VjV9rtjf889usu2vN7ruJrTzVoa9cXyypgIo/Wp9SLQ+Aun+wLpHnNc9ADhUgjLRw56KYIaCDrLhQxNcy/n3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CD9/NiGIUt6EuxRGUHKkxxWTlFzw9ckhYkOJsrDL13g=;
 b=JAI2Jkny9qxQ9/AQ/QkgOXVsWagB1H5sU6jT3wtMtU/FQ1V9OMkJ0awf/ek+x//qA72MolgfOZHUSnBkLNsqN/PMO/trUeACOC5DQpuEL1p6kRdNNad/Xn+YGIvrjDAxq+CnfFu0AneEAct7FByDYxRjWQhTQecCyJP58+GwGpY3x2MxCKqbrP1sqxmbcpIEs8iaENvwx3EypfWd+Oduj2MpISgqSUP8ajgT03AEk7VSlyQn9/agLwGS+rzgygibDSxbL76TSFS6VIYMjAIJSiIvH8jVBhRjJXVTASgifHkpPJ3DG2BYCK5L8Nbw4nzEVjWKYgiORY0mAZR5m47+yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
Date: Wed, 6 Jul 2022 09:10:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220705210218.483854-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f5ea9ec-8902-4171-9f47-08da5f1e9a71
X-MS-TrafficTypeDiagnostic: AM6PR04MB4422:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l+4tXliv99ThtGzHgx9CTD4yM4e391FrPSGVzJm4Fbp3gFR/ReCHMZ4b8r2i8bNhlttET2MtnQTLVQ+HvjuzfpViWfBFSqKEDMwM29Zk7TdYkePu6ybHxjGamamJeKkG9rsPio7+Sq1Ye+k6myhkHroAu7IA0IECbNu6Fnf3wqm+5farL20VmvjCHONtp39ZH1ELCaZyZWDd274h9Of1rtuNs0CuNaC8pMQXpzA6Hu16vD5m0UnEXpRB3M4z8ZSEEexoW/kiqQBPaPCJ607sSSsdumjbBupnRWvNu1Dc7u7fmM5aZdIWOokJ1w0EM/09/FkJcI5Cki67ZmdMNH5O9ywgFFWYafsiJV3UColwUlG1C4OOkcEZ3rmz78JWzd1NRXf1X/+3X9W9bvXXp1SdE335HfX4M9HPUyx5KbX0psmxlvXH1WGetG2huBh8r/6WDXTnnTOIJOYbrg0jwnuc2zUtqo5JbdRHywwpiOQ3eydErOgmPgPH6JFGpFGy7DTCqGc4kCLnXp6yYfnhyG0a9ic6BvAuhwV2rhehMn8qBcoagsJkKQi2Lwh3YliwKPxTiXWmP6tKGJBiZ7wfuSiihTL8rwY9I7k/puyXjoPmjLkytbgoYT4ectPj4Ulzc5XF2qfwZUk2Mdxbn8jrbRGifIxHDS0k598U2ety0d0pZ/yn5W3EdugmbuUqhDB/m80KI5uriHt3e9gbJL0AxNQlacplGCI6q4zEjKh5qpIcrgiG2Nk6bmoqeV0evxqsB9nOVYrvqmq0fpp2OqyxzY86bz/nRvJ6GiK6wnqYzawGgnQJQHqCWrsWIyjbukyQT4YBVlpM4c6R/U38webt+xbMqgduE332s72zU0+N0C1Fk4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(396003)(346002)(136003)(39860400002)(6486002)(86362001)(31696002)(38100700002)(41300700001)(2616005)(186003)(6512007)(26005)(478600001)(53546011)(31686004)(6506007)(83380400001)(66556008)(6916009)(54906003)(8936002)(4326008)(8676002)(5660300002)(36756003)(2906002)(66476007)(4744005)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3VzN1dyVm5LMWpnMHdkOE1BaDEzNlpkY1NJL2xVbXFKM2wzREFnZElZUWpO?=
 =?utf-8?B?RmlJVXlkalovZVNVRVlkWERNVE5yNXptelMzemZ6ajBnWDhWUzhyQ1Nkam1y?=
 =?utf-8?B?WHhQNEJZa1c5WTN3eXRzMTNrVTQvYkVOYy96eWJ0VE03eCtlS3UzM3hZdVYw?=
 =?utf-8?B?SHZKMkVnN1AxQy9tc1hnZkFqQ0RTNENNdDVBdktqRDRuRDdPWWZXSHM2c1hZ?=
 =?utf-8?B?dnhjNjA3ajdCMDVSWmp3S1l0YjAxWm5qYkxMQ2tXb2MzZzZFYmJPY2pBb0c2?=
 =?utf-8?B?WUM4MmNEaWFkQUR6M0VhOTcxbmZobEFXUW8vem1LV2pWOW96UVhWQUVpenk1?=
 =?utf-8?B?WGNuK081dk9NUmNwVGdJa2VGbVlsMG9kSVoyNXg5QUZaeXBNbjN4N1JHejBB?=
 =?utf-8?B?NVZidnpoemNTK3E0NVV0MVd5elNsV3pHQXIyNzlLVkdETll5THQzRlJIM2R5?=
 =?utf-8?B?aEo0Nkx1Zm1IVHdWYVRFVjlBZFlrU0FqemtKUTBoZzA4aTc1aDBueFJVYU5j?=
 =?utf-8?B?akJ2cWVyRHNlaUNsNDFDWms2TmdGWEZqalNoZlRaMzBlSjlxS1pDZk40WGlE?=
 =?utf-8?B?SHE0RnFydmd1akorU2xjUndvM3VlUVJoakV3Q2VoK0c4UFdBZi9qb0FSbWxn?=
 =?utf-8?B?aWdxZWgyRXNKbGhDQmJjd1JhNDRMdnFlQnhKdU9OUThwUmxkZ2lzTWJjT0Fs?=
 =?utf-8?B?czgyeWEzVEg2YmdrNkQ4bzhidVdFUzE3NExCb2lxeFV2SUlPdWVUK2h0aWdH?=
 =?utf-8?B?MGFWaFBXRXQvbENERFk4Y3JKOVI5YnBLSGUzNVV1MlNaZVUyQUtQeWdEUkdy?=
 =?utf-8?B?c0JDUEhBdmNWZ001Mm5RRTBWRnZ6M2lOeDVWUXBzTmpXcDd3ZGlYcGsyR2hw?=
 =?utf-8?B?enhKQXc0L05nU1A4cFV0bTg3cnhDcmhxOGZXNXpqaEFVb2xRbm5NdVI5Rjd2?=
 =?utf-8?B?eVVWeEJvQjJOdG9HZ01xSnFvb01XcWdKY1JmZm1hMU9iNzBnQWFpZ2xybjh3?=
 =?utf-8?B?TmYvK04xa3ZEYTVwZjdMWDBOZHE1OVdvU2Nuazl1Z2lQVDMwTFBjS1RMMnBv?=
 =?utf-8?B?bHRDOUNGWmpKRnQyRzRsTDVsOVZ4ZzRSN3ZsbUFoQ09pRS9nUUlzaWEvRkNa?=
 =?utf-8?B?SFhkK0VXY1JMTHhFeE9oKzduOWkxc29oV0FsMUgzMWM3dExWQWFIZURCWmhS?=
 =?utf-8?B?Z1lrRzBsNmNEVEpZa0pqejJzZis1bU1wYjRJUUtHb0hPZ2EyR3Y1aXlQMUxC?=
 =?utf-8?B?RDZySCtKNUlLRW5GYm93dFhCamRZTXUxRlgwY3ZIKzNuYVpsakp0ZW1sZUx4?=
 =?utf-8?B?L21BT200NjNUUnJMcEc0dGM4cUE1WXpVYUo0UE02SGtIZDFJam83UTh4dXgv?=
 =?utf-8?B?bHRERHB0Nmplb0MrelZzMW9xdmZ4dy9HWXBUaVFMa2prZDVQUVUrMlJuQWxO?=
 =?utf-8?B?NFJhSCtGcDhZRElHejhsTzlzOFpIa0R2a2JLWUxFbGlEdFFreUd5bFp6S0dx?=
 =?utf-8?B?cUtZY05xUmNLeG05SEhidjlSdmpPa0JMQWt1TGFGbDJVbmRob1dNQ0RjVldq?=
 =?utf-8?B?WStFcS82emV2VzJMRE1GUFgxazZuUzR6U3ViaXo3UzdFeXdVdmV2UXJMNytk?=
 =?utf-8?B?TGFWMEZXUUc0MEU1N2dnMGRvKzlvZHErbDJSUndmYkFPV2UrNGpYWExWMjBq?=
 =?utf-8?B?d0tKVWc3eW1SSUFITzNENkVmUGM4djhpTXRYblY2WGRKVHFJdjNPM2huS053?=
 =?utf-8?B?WWgzN3laMGYzZ3YzaHZYeXRtMlJVRnpyeW83czNkYTJYTElUV253NGczUDBW?=
 =?utf-8?B?TnZYQ1FPck56MGkxQTc1SkRjQSt3Qi9RcG9Cc2hHN2RubTBRZGxaMURMVi90?=
 =?utf-8?B?NDh6Q2FhT0xDUHRTQ3hMOHhBaHNDQW1DczRDc3E5Q21PNE96cjBXNTU5RW4v?=
 =?utf-8?B?NlR2T0JMdXZIWHl1aEtHbDZjdjN0OHZ5bnd4Ym54YXk4MU5RZFZ3Qkx4cm1Y?=
 =?utf-8?B?bUV1dUlKYjkyb0tPMGdWT01PK2tJZmgzQ3lJRXlONXI3OWp5RGMrbHVndW50?=
 =?utf-8?B?SjJZa2FqbEVqVXJnUGNhVjV2VFNXNFF2RlRQY1daK2xFWG41RTRvYU9DbHFR?=
 =?utf-8?Q?l3WecAd2/YfD2Uq1pJKKk5hAw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5ea9ec-8902-4171-9f47-08da5f1e9a71
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:10:27.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUf5ilCtP5SxQMBFKwiMdhue2M7agey1OCsIWtbaMEXc8SVHZM2Dskgfl2jBBRI2NGJ9AOl8I6qvxp1IJeFBuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4422

On 05.07.2022 23:02, Xenia Ragiadakou wrote:
> The function idle_loop() is referenced only in domain.c.
> Change its linkage from external to internal by adding the storage-class
> specifier static to its definitions.
> 
> Since idle_loop() is referenced only in inline assembly, add the 'used'
> attribute to suppress unused-function compiler warning.

While I see that Julien has already acked the patch, I'd like to point
out that using __used here is somewhat bogus. Imo the better approach
is to properly make visible to the compiler that the symbol is used by
the asm(), by adding a fake(?) input.

Jan

