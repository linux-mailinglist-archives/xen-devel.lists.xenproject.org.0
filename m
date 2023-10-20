Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86477D10E5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619799.965469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpxD-0008GR-AH; Fri, 20 Oct 2023 13:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619799.965469; Fri, 20 Oct 2023 13:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpxD-0008Dv-6T; Fri, 20 Oct 2023 13:54:19 +0000
Received: by outflank-mailman (input) for mailman id 619799;
 Fri, 20 Oct 2023 13:54:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtpxB-0008Dp-3W
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:54:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2071.outbound.protection.outlook.com [40.107.13.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28420b04-6f50-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 15:54:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Fri, 20 Oct
 2023 13:53:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 13:53:46 +0000
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
X-Inumbo-ID: 28420b04-6f50-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtX6k4an7tlf02kakp9c9/kq4PI/85+Ss9RQT//XQYpShL1CJHxv/q06kDGzMLpqQd9WArYq0Qif0VZWn++0ZeKDdU7lOTAxV74TxCJB3ZX6z04+T/QaBJUOp1M690fzvbHtnLeoam4RuM8nOwA+5ORkU7uDsK4N8SwJDniqIIwjJwIee+CHGSCmKTiz0ENRmcU0Kn23AqA2z+NzeHhpxgrFLWQW4IZxMIhZmtB2/+tyi+btpG0HjzJCgr2AboGFJetKqtHBnriN7BEM2H0uPtgqvx3gE/1S4cJciun4mn5ffaLZ3LlCjZDhJ0KQ9rHujIyfmm39zX1n5rKWLDkxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h80mR4IclP8nbrUI/5w0VojkWbxSLN6CE2lJLBXgHs=;
 b=JmY47kTsZmF3JrKZDJZ14QsZb+K6YpUyM9jICucTC6aWmIY1LMAHDItauc3LilWaIENNQL3Z0YsnFI+qS+/iCm4gApL0sPlQp/xj/yjBSEY3iytU8xWSHqHNMSXT9VTTuNAsCYjzSxCG+eAlsmt2ZiEQFzlpNMT9M+YVxFRTNz1eOfHzeMMVtQ7SW4TQ78JkWbyIF0cUwvZ5hsqgAbe6bn1/cTAgbHBlXFT6Kaq7ahFNbLA+Dw6dRvzKCD45WBbWsSNUPJahc+4xPepbyI1uJOuifhApsVYvyEA9+OrefKUX1sqd3Z+Ozu2XGbxspn/lqX3vkdTAg8kGtLweVkrcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h80mR4IclP8nbrUI/5w0VojkWbxSLN6CE2lJLBXgHs=;
 b=Py4OehQtBTrcR8eRFrGQCmLqK7Myvs0TGkM4fvodnkvyOwOcRhEiqWakHJ6kcdTzgGfAExQUKM/JA09xe/fz/TSG4l/TrlRkkScdXd3ueM+/Xsv6rFkrPTRvuIDfnMqXwsrw/MJZQoR81hOhX7hvUbDmejEzuQA48ndkQqMxtR8XzXW97BxnTrBys2NsI1qO1KzUkolxnReYjthK+ywwbKzAlH5YbPIOhA6UVERXT3Y5Nc6C/Z4hNYtu0/xzRMuVnxq6ew2YkIhbxgeuJEYAeNxUK1+MrdwphbTG85a3VziwRQadyOZYVQBwW+iLnmwV2qrdSLiJ4CcVQRVHdTxJhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e9ab120-11a3-40fb-fe3b-165b3b2ef1b3@suse.com>
Date: Fri, 20 Oct 2023 15:53:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 0/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 JulienGrall <julien@xen.org>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
 <059882ea-3e42-f74d-83e6-2f809d0993cb@suse.com>
 <ae6b419eac6eaefd65aab36b69e8926032983110.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ae6b419eac6eaefd65aab36b69e8926032983110.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ce3763-27f7-49a7-7886-08dbd173fb25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0HBB/3vCFc77iywOBN65hnt1MZQLSvpUHpKTBm5UsjR5F/16rQudh65PuUdRvKtiQi9L7hI07p2e9xzkEDyOGX41C54P+hLyGgBiYj4z0F0dAY5IneSDtSo3Ya9ctuH4Kg5lT75avnVY+h3StyFqwu6+HmYWVFiiRXgU/hhQlhk55jVQfatO60FKHwyNaxsl1EY2OxwM1uZA3iHqWIALKljWqBMrj9dPaeRlgdRXjiPc19xcH05YxxFmX7v2VBjMMs2IhiNBRL+73/XcpKHWE47RSi3GNr9QrM6pkKBM9jdOcrgn3RIzPRiIZDYNlxQJlExHDmcUoab3U7YXCuurGEIAvSsaOLKGVNxd8FjUz3R78SFz7bP0xWeOMzeZ0Sc+mJ9lQmanYV23N5TSoZUNgfXFF7Gs5hhbo2olv41R94RNluzUlaf9uT1mWfWQ5jMFCxkTuFv8mArTbNaOv1kMDj9FfVohZckDcnNr37j+Qp4NNrTwKx5/bxrINJTCUJ085xoX4BRZY+ZOwE+NKW0gtcvvotg0Hqc0G0GJF7UvGYCEY/bXkaz9XA46LVfXjupkZa0aN4n8agVyt5S3uqn6jmYmMPxzFpY2i8A61Vos9fkaVn1Zv4BGT5ky2hUfbnGfeI5hhFYGPN1n8796rPG6BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(41300700001)(5660300002)(316002)(54906003)(6916009)(478600001)(66946007)(66476007)(6486002)(66556008)(4744005)(4001150100001)(6512007)(53546011)(2906002)(4326008)(8936002)(8676002)(6506007)(86362001)(38100700002)(26005)(31696002)(36756003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEdTKzQwcXY3SjZVcHFWTjUzZDVaRHhZM2JIT0NwUDRlMjlXWklNelRUL2Nk?=
 =?utf-8?B?a2J4YTgrZTdwOGYyOFJiVkdCalpDNjNVNXNnOXpKT05KV3NRWlF6bTV4UTdF?=
 =?utf-8?B?cVBQdUlic1QvSENxTUdnS1ZsZ1NuL3dhbUEzS2l1SFR4OGp5VGhDcXhkY1VG?=
 =?utf-8?B?UGNva25NZitqdUxNbW5oWE9ZbXdidmpWK2dUMnk4bFhFL0g0SjQwVXhLcjhK?=
 =?utf-8?B?SzJvRDlsZWpsYTc4NWRGT3pueUdqWjJ4RWJHZlZtVE96MlVvSUFmZjFlTzVS?=
 =?utf-8?B?UlBpU1VQWFFXdHA5YkFYUi9jb08xeHorYVFDR29rZWJkZmdmLzE2Y05wQVhS?=
 =?utf-8?B?dGFVUWhzL295RlFOZXhxdlZFZElXa1RNdWg2UUF0NWhwcmhGRllrUnhVVDVk?=
 =?utf-8?B?NlpjMkpzaWR1UktUMzJXS0pRcXpMakJzV1JXeDBTT0xvWEluV0l0NjdwdWFY?=
 =?utf-8?B?S25lcHJNTlJnUzFqVXhyVitGTHF5UU5MUjJ0clBjMlk1WUp5M3lVY0xEbW95?=
 =?utf-8?B?RGpOVXVQWDVJRWYyOGZ1Vm5EZ3hLSDg2bmVmYjdlQmVyS1VMSEVGb1o1Sm1t?=
 =?utf-8?B?Q0lrNXhCQWlLa2xwTXl2ZzFEeXlvb2dpUXVrUjRBL3JOaFVRSGVuWGUzK1Zv?=
 =?utf-8?B?NDI2YngrY0lMUUEvUCtIT3BDS2lYcWM4MHZtNFV6OUlnZVowZU1rOHRJRkMw?=
 =?utf-8?B?UnZnZ0tKbzA3L2N2WmJWNVdqNE43ckVkUEgxNEZ4UndLNXlqQi9iVkZNU1Vn?=
 =?utf-8?B?TzJWRjBIM1BUNlRLOFRSTUE0WmMwMys0d3B1ZG9VQktQZzNQTWlaUjJGMlJj?=
 =?utf-8?B?QTM1V2I0VkFVTWRML2k0dDdxTTFoZy82bHlKZmR4NkJoWGhaM2tVNFVYSVpp?=
 =?utf-8?B?MXBBVDlwNE10dkZteFJ5TnU1NnVtOUFYbUl5UmNKbGM2Vi9Hck05Y3o1aDRJ?=
 =?utf-8?B?YU1nT3UwejB1bXJYWXVzeHVCeVFjVnVGSkpqalZSMTd2UXJEb0hmTVNhSmVF?=
 =?utf-8?B?elF5RWlDNXZLSGZoTU1qWkZja3FmdkhmRmZrcG5KWE9QSS94TVg0VVBpVHlC?=
 =?utf-8?B?OXVGT0VBSnJsSS9OTTZFdHBpdWFVcy82ODZLSjJuSkM0Z2xoeTZtYW1wYzBB?=
 =?utf-8?B?aGRBZTYrTFprYWRIcVRteTQ0RStrSmZzUWUxWmRWUzNKSFk1dG5zdzlxMDR2?=
 =?utf-8?B?bjZ5ZTkzeFBSQ0FleUo1NmNOV3dHbmtPZVNDMFBLWmZPbFRzSlh3R3Y4Yndu?=
 =?utf-8?B?aEYwMVBJWHlUVVZXbDdpRHdSUjhhV0NYTGFBV0NoSUJJcEd1V1RxWlVIdlQ2?=
 =?utf-8?B?azRDRnBROFhxVmpyTmN4QzdBejlCSStHaW1iRk54elRRdlgzWElZSU82eFIv?=
 =?utf-8?B?U2I0UEErM0hBa1Rtdy9CYXRKZ0xiT3BIblFOR0Y3U2RKYjRUSlUzeWNrTXl6?=
 =?utf-8?B?azA3TDRWVmloc1FpaWNrb3djcEdHbkIwTG5KZWg5N0Q2a1BueWdaZlR6UmND?=
 =?utf-8?B?WFhOekQ0aVAzWDQ2c3ZicHVGVFQrRi9UeFNUdnlwWmVhSDdXeUEyOTNpN2tO?=
 =?utf-8?B?UisyMlF5UElvbjRwNUd1cUN4MWtIMkRYaTVzSVVPUzBDTUMxV3JOUlUyeTAw?=
 =?utf-8?B?N3crUkhqYU1OcUVtcXh5VjZxWTZiWVd3K2tZOVJLdzRuUlFNMlk5bW9hU3dv?=
 =?utf-8?B?ZlA5RE1Fbk5JQnh3YTVCMGpJcUY5by92NnJva21VeXVBR1M5VmFHVFBOOGhB?=
 =?utf-8?B?Y2ZPS0ZlcmVsRWZNWlEyYVMxY2U0NTdJZlJKQnU3SnBEbk5HVHdZbXE5aHha?=
 =?utf-8?B?MlM3VHhMTjZ6bkgvY0ZxRFhQN3kwcW1WYThsMTlTUEhuZTdzSmJSQlp3Qjk5?=
 =?utf-8?B?MUhOSGMwR1dEbEMvT0FEYzVsampnakpKNUZyaVRwK2RTKzdtdXVsMUpiZWJV?=
 =?utf-8?B?SUxoTHVRU1l1TnkwajZ4aTd6Qkh6RHAydXpIdWpPa0dMRGR4OEd4bzBLRERK?=
 =?utf-8?B?SjRZdFlKdlRsWU95QVZMQzJLMkNZUjFQWmdSYWtGaFNNYjUwUHRUZ29VK0Mz?=
 =?utf-8?B?bXhqUC9GNHBRL3FQaDVPZ2V4b1g4WEpMVmlZMHZKZm5KS00rUnl5RlVGZ0pR?=
 =?utf-8?Q?BwxuYtwIx+44ltFxk50C7YeSJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ce3763-27f7-49a7-7886-08dbd173fb25
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:53:46.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3h1SZAF+zeGTV2DWbZ4YCVRqxKhRQPFkIoi+EBvuVIzDHPeHbS7frpz/zwjIXjhf9DLG9rWDXzxxXUVGLcffQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

On 20.10.2023 15:52, Oleksii wrote:
> On Thu, 2023-10-19 at 12:32 +0200, Jan Beulich wrote:
>> On 08.08.2023 17:14, Oleksii Kurochko wrote:
>>> Oleksii Kurochko (2):
>>>   xen/riscv: introduce function for physical offset calculation
>>>   xen/riscv: introduce identity mapping
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Thanks for Ack.
> 
> Should be the patch series re-send with Ack after the end of code
> freeze?

If what was sent still applies, I don't think there's a need.

Jan

