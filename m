Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212887AD1AE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607669.945955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkg36-0000j4-Bp; Mon, 25 Sep 2023 07:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607669.945955; Mon, 25 Sep 2023 07:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkg36-0000fx-87; Mon, 25 Sep 2023 07:30:32 +0000
Received: by outflank-mailman (input) for mailman id 607669;
 Mon, 25 Sep 2023 07:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkg34-0000fp-Oy
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:30:30 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 647d7929-5b75-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 09:30:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:30:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:30:24 +0000
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
X-Inumbo-ID: 647d7929-5b75-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACYRChPgfQ3k+NmDYM/Ez1OChO1wSyVFWzBA06VJ6L4Qc2ljbolFn4B6O3uaz7s7b56RxZz4rekTWEGDBM0FXE7rFBWOpo1btfjjs4kD74GZ4OY0+EuZbAOJ1D6mNIezt8xsMKTs7fIeSl2KnqK06KX6Ke4DgbxvJV5/ZAI9RvHjSli2JF2DLzR1mJmVLnnHBPn5Lw6lV/FJPnt3Y93pPmJPf8RM/FqQZn6oPFXkHaRQR6h+Tm34FYiIyZWeJXmJErRp+rvyW+NvtncuIyf9tiEXHCkz76h8kKkO94JcAiRhkCJrAZq15PKgDNFCJ2Gc+oEwJ7rxOpSWfJ73zhsxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBVKuUVHS4u7ZXAms0tHxKQ76ktRUAQhfdkRfTHi56k=;
 b=QwMJLahtsmNcwm/q/P4A1bsWnnnj1HBWKeWAsLbPU1FljOVqsAuoiNS3WCZMhP/2X/KVYaHzM0Mb6Ouw+fOhT/q7YHPM/Otp3L84xVWVtZT4aXOMi/qz4JSkyq7rlXVerod3VKXfigC3exJ9DYRrS+ddJw243apiYnEyl7frESKl/sMquUdunlOR4KMuDM6zXoC9KDTkt/Agjl4M9YW9Z8fUlZ1EVtERHfV0EVMy9mxAXMHjXVZDA2LQhBMyiyh0EmV+9cg0RDLMhu9Hp4B4vboRxUWYZf5aWEpg7xFbHIjWme7gBN4Bfah7ya3yOwJRk60uBj9Diq3JpANNb/2NUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBVKuUVHS4u7ZXAms0tHxKQ76ktRUAQhfdkRfTHi56k=;
 b=CB4ZetnBvYSnSv4upbXDWUljD2asqx5o6vGft9Vu0xopUs8gzZecDS8Vk0p3PwB+xyj2753fR++hM+beth4b5HGOKr1gQkC422ICE5uOYIasKD2P/GWnnKX9jKHVjSle/kvbNaYMxfMEn6HhNOU4pJzOjFgc5GdPfVGUgp0M39/uSQx53cps8EuEgUTGWlmC83M0LhSDDcGiG0sV41q7Aq4LBadOkzq9FeaITnB12n4NXxQPyTSomd6uNmQkui1YclWD0Jm0WPFU75rdCjZZyuHGipevovX5t2Re6v4veNXK0QijovvR8EMyKusnWSvhwCpAShS6ETk38CzyOhUDaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f365e11a-9ca7-fb3f-ceae-28da7e1d6779@suse.com>
Date: Mon, 25 Sep 2023 09:30:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/7] x86: Introduce x86_merge_dr6()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-6-andrew.cooper3@citrix.com>
 <943d1d28-08de-3c1a-5a64-6caa98cdba78@suse.com>
 <43428539-4fe0-e2ac-48a0-b2fd9bcc0d1f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <43428539-4fe0-e2ac-48a0-b2fd9bcc0d1f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b1e50d-e732-4489-7716-08dbbd9947ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OSUcRjDuE7jKPhF78o156tZg1BTGbiH8ov/mGopLCmt+BRUAcHA5mp4ry1sHykwDZQZ/vRLFnBns9Bx+TqTPGXWhPhTXW1UKTJivMxVi9lhLn+EDmuGFjMMaYwWJE4UGnnlq1fIieqwdLu5OSgpnD5uIyxRa4KISvhQ894BFIjzLfp4DEXpjsYPC1Ykh/TLqeN4+JM0+fSusInBP9c53d0fjwqc696+r7IoKISPrjbXbs5aHkVlwanXNIfRvaKG+GVT6U0QGpP58/8PTu1XKLKtYUfS9LRfN1FPlk7zKEyrPkCHM4dVGSmgRpPqWZjxkuyDx6+oV+RcOh2FULHumuR9rXH8nqD0mg8RFviGqKSClpgEwXjjaoZAbcqH/YzxBngZX52e1FNCbUMauP5sc6MX1Ob9+uL9PWk3P4FjDm2flgnihtizyE0kowoub2wxmZFZulbY4KzBzY7KHNXhfSt90CsVHXANW7ZrxAQyC4ppQq9c2UpW54IGg5ZIpLeuIwIAGWUIAtRF4DdX95DCGEf7YxV9NIrD7rLmKp0gy/tRWH0AY/4QOQNEY+UxEwok00ecyW1Q+bb0HdemFPQJHncD6bnpPSPL3+poppgrizSkeA9Q3P/mzdMzP2ED5XPNRN2u//BJlRChcFoDqzD2HHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(478600001)(6512007)(53546011)(41300700001)(6916009)(38100700002)(316002)(26005)(2616005)(83380400001)(5660300002)(66946007)(66476007)(66556008)(6506007)(6486002)(31686004)(54906003)(8676002)(8936002)(4326008)(2906002)(66899024)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGdaVGtCVXh2SDdWK0U3cjNRZmplWEV2WGV1S05qdFBJRHZlV1lhUnFtNTVJ?=
 =?utf-8?B?ZzdKZjQrdUFXNWdESHAvUVRzZkJsZmFyaHN1QkZuc3UwK0dJOGxjUkUvOERv?=
 =?utf-8?B?enJTMjdDZVR2UmxFalQzMmxFd0NLQzB0QjM3QXdGeUsyZDNTaEJ2RzVoMEwx?=
 =?utf-8?B?dEZldC9XZEhGUExpcXFTODk2NDRPNElFcFdTZ0hNakV5OGhaaG9FNm8xWVRo?=
 =?utf-8?B?emN3blZqRjE3S09TV1RTMEIveGZNcEdpemdMSHVmVzU4NVRIQUI0TDJJRnZu?=
 =?utf-8?B?M05lM0ZwTnRUTlRvMmpPYk05bW83YWRITUlKaFlQb0hMQ3c5bUtMcW43U05M?=
 =?utf-8?B?SFY0ZUVlSy9lVE94VDlRa3FrR3JlOVlxak8xbTIvaW4zUm1URlpMRC9PNk9i?=
 =?utf-8?B?Y2F4ay9hbjRMNnhEOFg0N2I3YWFRb2VETjdUaSs5VXo4a1RqT1ZhSmN0cVdt?=
 =?utf-8?B?S1UrakVXaTdhTGhrZVVoU1NmdnJ4VytmeGVVSGpKd3MzZmxpalFGaVBEdHBL?=
 =?utf-8?B?NTVJZnJudklPaGNqTTRwb2I0c1RkcXZqT05PTWUvems4Umd1dWRrdFUrcTVN?=
 =?utf-8?B?UnpBK3lhb2hleExzaTdOSlNYem1SUTkrWnVoQkJhREYxOGFWdWJ3M0RqWUVa?=
 =?utf-8?B?bHdEejJxRE95TXNuS1cyekdJV0FMZUd0aEhFYUt1MklCY2hjMFhBTm9GLzhP?=
 =?utf-8?B?bG8zenVXOTFqQm1HTFYzZUdxd3Q2YWFZRXhhbnN5aDRoSVZ5d3hoQzd6cFBv?=
 =?utf-8?B?OVRQaG5iY0thZUJSeXhDcHFtYnl1YThZNWdRdkZIZlR0YTFKSWZGVWhMZWIy?=
 =?utf-8?B?cVlJWFppdGNFVWpqc1ptdVpaK3ZIeFU0ZjZBYmJrY1FVWUwyZEhFZXRiL2FW?=
 =?utf-8?B?VDFWMlhLQmcySnRzSU8xOXYrbFVqRHpTUHBQbWtDTThXZHE5VFVMNlBYTTRh?=
 =?utf-8?B?VGlrRjExWHhvUzdyeHJQdjQ2cVJtNFEveE9mdEttVGtSZk1sSXJTVDRmZXRI?=
 =?utf-8?B?ek4xK1U0Q0JTc1dzM2VodVZOZlo2Mk5iVFIzaVZUb0R4VE1mQ2xucC80Y0N0?=
 =?utf-8?B?QUJWT2cxV0plZUJXeXcxWGdXTENQR3VtTGJsalRobXppby9hOU5WZjFPYUUr?=
 =?utf-8?B?QnNiMkJHSmpkQm5zYWwrcTdocmJnb2JoMlYvS3dFL29pLzhvZ2tiSkc3N2J1?=
 =?utf-8?B?ZHZYMlN5VmVHcUdSaXNUMGsvRFZ5TXVBanV0VStMbmtkaDB2bjRjamZiOXl2?=
 =?utf-8?B?MThrdFI5Zkp2STQ2aUJPb2lvbkl6cXJodGJZOGs2Q1o2NFVpaGpWY0NIOGR1?=
 =?utf-8?B?R1preVNGd1lhWGZSb1E2STNBNmpwSjQ5RGtNTHA5Y1FaWkdjVHJCc2s5N1p3?=
 =?utf-8?B?R2d1RmpnSzlUMUFzY2RJd2lSSlRxaVhpbHl6eU1ZN1g5OGNkMzJQSTV2R2Q5?=
 =?utf-8?B?YWxjVjlzTWd4dnJITms5YUtGd0N3c0N3MVcxQmR5ZkR1K0hqS0pZc2pMemVO?=
 =?utf-8?B?VkF0MmdXZVpGZm5xWXFVK2o1TTZRL243bWlsRXZRaGdHTk5KSm1hQUJPWS8w?=
 =?utf-8?B?STNDRHFWUlB3K0h3NVJyY2pycVRWdkFLd3I2eWl4Ky8rVytMeTdWbXVOWEFV?=
 =?utf-8?B?YklKNkFHMzlzZDZOZFNaK01SY3FkZnRueVlqTEZOQkk1ZHpDakd5MHJiNWpB?=
 =?utf-8?B?a2hraEEvNHlSOUo0MnhFUS91aEJTaGZKQUhEUTROMU5PLy9WcWZ5a29sUkxZ?=
 =?utf-8?B?U0tTaGVNK1orUmJuV0ROYU90Y0d0MWRJVkxFV1htdFZORzBkZXZ6RjluTFMv?=
 =?utf-8?B?cE1uUU1IeEEybjVmc1VQNW5kdUFLWmNrZlNLVW96ZDFzMUlpSTBJdW5lbFFE?=
 =?utf-8?B?SWZOSEZYVEpFK2VDVmVKSU9ta3BGRnhkWjdHbGZUblBLdnR5R0NHNVpJMXZh?=
 =?utf-8?B?WHJxTDViUzRIVFRHS0Z3R1NBcFF0RS9FcU12SkdGa0d0VmlCNmo2MHJKQVNE?=
 =?utf-8?B?dVMwOGpRajc2a2dLTjZ2RFZabkR5TkluZVlmSVlieXFMVUd0Z3FkMmZ5SjhQ?=
 =?utf-8?B?cjF0TmdEL2UxWWxDYzNjcVE3cnpYbkhmS3hmSFF4ZGdTV1pTK2hjMkhnN3pD?=
 =?utf-8?Q?lMMlsiYmpZ2Uz8E85aon4a/Nx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b1e50d-e732-4489-7716-08dbbd9947ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:30:23.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1RW/GkHvTiV8DUH7XJXlKOgqgi9wGzbxltDU+WjLXKFOUB/2+0qY18ZYi4IY7/Vc9FK8yrYEhB4Qdk8aOs4/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 22.09.2023 18:11, Andrew Cooper wrote:
> On 18/09/2023 12:37 pm, Jan Beulich wrote:
>> On 15.09.2023 22:36, Andrew Cooper wrote:
>>> The current logic used to update %dr6 when injecting #DB is buggy.
>>>
>>> The SDM/APM documention on %dr6 updates is far from ideal, but does at least
>>> make clear that it's non-trivial.  The actual behaviour is to overwrite
>>> B{0..3} and accumulate all other bits.
>> As mentioned before, I'm okay to ack this patch provided it is explicitly said
>> where the information is coming from.
> 
> The information *is* coming from the relevant paragraph of the relevant
> chapters of the relevant manuals.
> 
> I don't need to teach programmers how to suck eggs.  Nor am I going to
> quote buggy manuals (corrections are pending for both) as a
> justification for restating several paragraphs of information as a oneliner.

Earlier on you said this to my original request:

'SDM Vol3 18.2.3 Debug Status Register (DR6) says

 "Certain debug exceptions may clear bits 0-3. The remaining contents of
 the DR6 register are never cleared by the processor."'

"Certain" and "may" do not describe the behavior that your change implements.
Hence imo there's still a need to clarify where the extra information is
coming from. Pending corrections are of course appreciated; in case you have
been told the new wording already, perhaps you could quote that?

Jan

