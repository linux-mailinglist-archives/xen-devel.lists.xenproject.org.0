Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373AD72FCF1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 13:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548724.856825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Opg-00075w-4X; Wed, 14 Jun 2023 11:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548724.856825; Wed, 14 Jun 2023 11:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Opg-00072r-1e; Wed, 14 Jun 2023 11:38:36 +0000
Received: by outflank-mailman (input) for mailman id 548724;
 Wed, 14 Jun 2023 11:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9Ope-00072l-Fz
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 11:38:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2085.outbound.protection.outlook.com [40.107.13.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd0542fc-0aa7-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 13:38:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9694.eurprd04.prod.outlook.com (2603:10a6:10:312::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 11:38:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 11:38:03 +0000
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
X-Inumbo-ID: fd0542fc-0aa7-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oosbj4+mpDCK2yuHxSN68GDqUPg/68y7V6JXs6y0f4Ot/9xuIDCo7861rZLdwQ4VH2SUclLoI+91StcvpbnuzWbEWsjVkkxlGoqJqHOsraND1FBuQkLfcXVKJPjf/rgxepX+dcDsJ+Tj5FTPKzTtWaxaCdCcVJbpctgG8pMeSGw/iq+FHHhhRBh6Pdt6CkZb3jdc5KNpWab3X0v98vS1GaV+wlpb7Bzc054iyqTQfTj69Vm7Ev7E7tfTUvPKpZRHZwqRnSoXXHJZ/ouy7kvbVfikebIF5lNKAi7wZsUrTW1mNJ9d3FknTn/wCCnk4Ooq/POYYVPLDuvlXXU2noctOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl+a/GhPZFGdxHdvP5QAkd9hX/pxiNOFfITf5iaNXKE=;
 b=Q4w2+Y65fG3PssjzSwY3/aO8yCYfq0Zscx6V6vZjIZWx3Hgm5ss8etz6q6RxOrTUlhHlr3YSyJJ+cX35ScG4r6j1t8BVM2fW0kSMgbde71VBjsRMCvevD2kiPfWddYIt2XsT/LRc7v89CH4RWzktlaPfklVFjf6II2yMU/CXhddSu7MbSsmbM90dbr1sAcCYIrnpydNb8dNvDD8cm4UQ3JFzHhYwDtK9ulrRwTsTMNja7AaM2bYHxrAf5lfgXNFTjqZjmH+6g/YmVC4zRXGeBGeq5DwFI1jkjnMvpjlyxHx4cpl/L6wc/wHyMPj4O5a/bKhJN4gy9ZSrZG0Qm6vYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl+a/GhPZFGdxHdvP5QAkd9hX/pxiNOFfITf5iaNXKE=;
 b=wVTikH+3iBOnElMIoH952j548uArRu5i0jxdDIM9YwEQ4ZJpXNdlRtV7E6rVl411kT0GiFknxG30doFlABxbvf61C1f7asN7ern6NbLBVlNziSl8nL+EQ0vdg6DN8tRss83kr8wxxUT+A5aB/tqLBPwt2oRUGPe94gydeEQNtEMWCml9gc1sQ32J/fcphaAmxKoTmzOY2jzJZgVq7sI1W3lJZnnKGxFxkur8W8hdzt36e0MkRH0Z/aXas63SqKyLIhCkMAugl9J61s8v73/BDmA7CMaADkPOgLDsCDX84Lyb7N9AIyPHKKbgAYsLXgaaQeKH8o78y6RIj/ihcNFS0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9c9bb49-0762-82d4-167a-0c2996221ea6@suse.com>
Date: Wed, 14 Jun 2023 13:38:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 5/8] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
 <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
 <2f23afd53e748a09d3de2b50aaec0c6d2cf106c0.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2f23afd53e748a09d3de2b50aaec0c6d2cf106c0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: eafdc012-9f0f-4b01-742a-08db6ccbd036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oPRwE9+bTqM6jxJPC2sZXaeU+qoyjaamW6SOtAT1RfcJBoYjSFNjgwdwhJMCL/S047bnq5dZ4hfHhchiHOpQKcZDcUeYSDBR1s6YyhWHkxZV6zs4Wi9oj8+gsytwbwpYq3jS+LI37a4Hpyd3oPLgX9U9S2Uf+ZbNEAE9FqqAA68IOH9JBkNWpvDLCYdAaS3IXTXEGgq0Kww3Nw1Xn/obYUvcb1QqbxCTIPso256OTy7gIALeb5hg6t4qCFELIyqyu2w2Ge9TsgXv4rElJiFYOWtOY1vwDi88ACH0fSUtTkD1uHDhtpUfS1L/8USN4VO+xPEmQtOIhktDU9eV6CPCsj3PnRRYFPCE4bQ2/zAJPshoS4kUoSNvR1S4CfiSsfOUkt4nVZA4Cw/lahqkP3OkZiDfnYqL06O6DZVLtg5o/tZx1M/YEAlqECbBbHRkoysdsXd+yJSyi8fCYu62TJxK5i5lxaf1EpL706CBmgmwJ9vYlCVxWruCfnB57PGlwMaTuSLkxynbmbpX51I4XVqfrkXQmQdaPXdCiizZeWeI5IBPcd5ltL5a3ha2CYcaheCMRyYG35X5jbKc5d2cZO2nfm4//eR0F/HEVFaL3LEKToOjqbbLMIkW6ngnr3R8V8PPmeNGzlRpJ6nyyUAhp/kNbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(36756003)(86362001)(31696002)(66556008)(66476007)(478600001)(4326008)(54906003)(6916009)(66946007)(316002)(6486002)(8676002)(5660300002)(4744005)(8936002)(2906002)(38100700002)(41300700001)(2616005)(186003)(26005)(53546011)(83380400001)(6512007)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW5CNGp1dEV2Q1FTRXlORXQrb3lmemhxdmhwdmRKQks0RldiTFhyOERiRWZp?=
 =?utf-8?B?ak9kUU80Z2NiRHRaV2QzMnJodm1FU1RHTFJBTDlKTzFhUTRCQXFsNkxHcGh2?=
 =?utf-8?B?aDNMN2V1Y2tyU2dsMzFmRjN0WXpzMW9KWERhZjA4dGZWdnQ3TEkySlE0ZFNp?=
 =?utf-8?B?bG5xWksxTHZQZW1hZFpsKzYvNVpGeEFRU01TeFF5QStqM3Jza0czVWhHcGxZ?=
 =?utf-8?B?L1BtS0x2YWtjTXhJbW9VQUc5dW9MZzdCeVB3V0U2NXdkWjE4TjJzWGV1SFBv?=
 =?utf-8?B?UWpza3NrU3NVTk1FZ0JqWEVsTGlYNUk0c2oxN2hHdmh3bVY0NUJPWHU3RzYy?=
 =?utf-8?B?Ny91SUd1U3JxaEJmR09aU29FaWxEeUlDTUlvSHQ3eVB2SkIycTJOUEJBZCtK?=
 =?utf-8?B?L2RSUFExVGlMVmxvQlZ6Nkdxei9mbDVweFZPOU5LcWo0TU10S21lcTRkb3Qw?=
 =?utf-8?B?bjROLzZmZkpDeUFMdTRFY1lDQkg1V0xhUlF3cUhZakxOVTRFbTBMazloK2Fx?=
 =?utf-8?B?YnArcWFCVzNMUVdZc0QrcVpIQjg3SEJibTAwZ2FDSTdRVmJvUW9YWWZScEl2?=
 =?utf-8?B?aHVoQ0dKL0RlYXBwZVRPVER1VW9aeHlHRURidXFXQ00yL0xWM0NwMFV2cElG?=
 =?utf-8?B?SnpLZTN5UTRiSExYTTh6VnltS2FFL2FNZlgwYUQ2bEM5RjVlNTQrMDlJMUM2?=
 =?utf-8?B?c1FWRUFQWjg0M1FKQ1ZIaUpYUFJoaVBGWmpoMnNhdWNway9wdEdUM05maUg1?=
 =?utf-8?B?aHIzMis1bHJiWGU1Z0RWTi8wNW5mR0tJSFFSeitNbnpCUjBOVDR4dTlIRGhB?=
 =?utf-8?B?UU9BRnFzc0RVcVNab0ZidThEL1RGRlBqRWJTQ1JTWGxZWlc0U1Fla3pjSHk5?=
 =?utf-8?B?N2o4VlZlMktFWEdUVmpuRnpONitpdW1PTTkwa0kvblB4QnlPVWtScnZSRWdN?=
 =?utf-8?B?RGl2anNtQzhaQUppM045L0lEL1hrU0tqOHRFR1MwOU9scXNXM3lOazQ1WEVz?=
 =?utf-8?B?dXdwdXlxcVNOMTVMVmtXZ1NoSHNwNGVlaDlvd2FUUWJ0aUZTNzczcktCOVd3?=
 =?utf-8?B?MUFoRldiUkN3T3RRV1c1U2w5QmVwRXV3ZGZvMHNTdWpSL1hubWMvMS9RMTJh?=
 =?utf-8?B?YzBabzJYVnNRT1JOWXJRcEFuQm4rbUtsSjJkcEc5bnhHblJYOGxCeERVZEMw?=
 =?utf-8?B?bk50elV0RXc2T3BTMXNsblRDcVQ1a0tOczJFSkh1Y2FGWXZhZzRZcXQrNXI3?=
 =?utf-8?B?RldveXJxYkRVQkxLRUthdmNzM1RwMlBaV2FPWFMvaW1YYlI0R080TlZKN09E?=
 =?utf-8?B?Z0d4ZHd3Zzh6S1UwZ1B3YlJNQkhmUzFyTEJIWDNZT1M4OCtDYXNSQ2sySU0z?=
 =?utf-8?B?bk5VU255U0huQXVFeWl4RTJ1SWNhdE00SGg4eVRFVDNZSHIvb0JZU3RwV0VQ?=
 =?utf-8?B?M3kwdEhCNExEQ04wSkFnZE1kVzdnT2dSbUhqU2ZzVTFMSFpTV29yb3haekRR?=
 =?utf-8?B?MEVqVUxYRVhlQW8zRGVNSjVQS09hUXBDOHExOHlEa013cTlYWFFFSlUrVmIy?=
 =?utf-8?B?cXZselY2T085QjJaWE1zNUxtbnNhK25VWCtjb1hDem9pcklBT3Z4ZFNsRm5Z?=
 =?utf-8?B?UmhvbnVYYmR6TkNPS3RTVzFGUXpNamY2RmY5RjlGUnlwMThVYW82bDJNSko5?=
 =?utf-8?B?c3NyeXBhNTE2UzBWaFJlci9XdCtpR0hzRHU5UEpIRlhrdEhFNlJ1MWo0YjNE?=
 =?utf-8?B?Sm9ucUF4NjBqYXhvT1FrTERZY01zcGJPeklHZWlJZXZZazh2RGZ3REp6dGFx?=
 =?utf-8?B?NjVSS0VrSmxtTzQ2ckFBbkxMQTRmNHMvbFU3M0xOblJBOENkZ1BaWnc2ZUx0?=
 =?utf-8?B?WmQyTHFuU09GUjVlN3VKQ0JsbDBFRE9BWEQzOTE2STJwMFNLNHo4Y2JNU2FO?=
 =?utf-8?B?TkJGL0xLT1RQMjg5OTdGK1lvZkU4eXZybUFLTzFCNVVvNk9raExRdzJMaXBU?=
 =?utf-8?B?OG1qQWpHb3JYV0VqN0d4b2Q1RUV0YWQwRC9oNGN3cmtPQlpKNVlmWDlrbFhT?=
 =?utf-8?B?amxieElnMU1oVUVkQjBxeUttZ3ErZmNxYXpab1N6SE52dDZGTFN6V1dLSDdt?=
 =?utf-8?Q?15KmOGPmb1fKRdqrq/G+J7OL1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafdc012-9f0f-4b01-742a-08db6ccbd036
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 11:38:03.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lexq7j39pd7kXk9SM4OrndnPRDLuj9G/DybcbRb1tK0VV2oN/bDMUVL9xRRakGvJjJhOcMUu3F3MfBOtRq9qqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9694

On 14.06.2023 13:06, Oleksii wrote:
>>> +}
>>> +
>>> +void __init remove_identity_mapping(void)
>>> +{
>>> +    int i, j;
>>
>> Nit: unsigned int please.
>>
>>
> It should be int in the current case because of the 'for' exit
> condition:
>       for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS - 1; i
>> = 0; i-- )
> 
> Should exit condition be re-writen?

Since it easily can be, I think that would be preferable. But in a case
like this, if you think it's better the way you have it, so be it (until
someone comes along and changes it).

Jan

