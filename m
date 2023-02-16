Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799E698DE2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 08:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496377.767091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYqe-00030y-RE; Thu, 16 Feb 2023 07:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496377.767091; Thu, 16 Feb 2023 07:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYqe-0002yA-Nd; Thu, 16 Feb 2023 07:38:32 +0000
Received: by outflank-mailman (input) for mailman id 496377;
 Thu, 16 Feb 2023 07:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSYqd-0002y2-3V
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 07:38:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e81e7628-adcc-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 08:38:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 07:38:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 07:38:27 +0000
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
X-Inumbo-ID: e81e7628-adcc-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwstdrUvo7r++bCM5QWdq6Nsq+WZekmJvURFlkV69Mg+CMNjk1a6z71ezSBa2p2eGGgr2yOTpNcmg322u1w+RHwSWCclDDWR/jr3FZOR6IUEu4qpzNjw4xwA0Xc+VYaEOum4QPeldrrV/9Lja6F/JOijpeL++mV2jg/z1ncuUy8FpoH1/tP08LHoCQ8flHR/XZvOEeWb73eS7do4xNvbvDGw1a5qk/JDNWkP6KdvJx8ijbsaBXCNqQW4ZDV+oTltVNvwYU9ODvvkk5y7GaFZjqPYEO0W6Q8Xb8UxgKCTQmG8wCPsj22ukkjtHWHtZVHQDuuGpuAdNp94SwgkPR+oxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdSvawLur9z3uii9VAf5jczLSIvMRa54vGxeZ+hKdcw=;
 b=n4e0D2wGoHs2syCpZFN5boF/OjCc6Oof5fM3Jg3s1n2rNJjNN8HIS7jlsGJPl7P5tvATXZTHaTOM9WbyTYUAW0us7O6FFndyyc0AEGijWTjJFC4AvZAJyhgc8zET1DPzVc78IWVZ0WOc88L63qUokaL1Pi1/45YschX1iAiD2AC4Tyya52FukxMkvf3jPfAtnAHOzToxgMuYkdCGikiyMNTe0Hzz/qxFgCaTt/aRnfoScAHUK7RNpZgyoqoZGeJmXO8DW7gSvEP7XVKYLSY87Ttgjx/StIEwywhgnGhMDzVb5kSdmLpPAvf8n33DP3rNhRXAEEwjzMDKCSmhvIiIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdSvawLur9z3uii9VAf5jczLSIvMRa54vGxeZ+hKdcw=;
 b=3HLvjBYt2uiSWayITwLBd+45D9uwsIo5dEwtgn8ivH+nLWfMLqSP0YDzWE7UdTnFI/Hl68K9hKpKFOmGkOGoG/OwAP+lolXZy16Lda4QNBfffWVOWJz5CMedx+n1gvr/Kx5FdlGSLnFZVuuY8BZsu8X6EWV5NsHfSTBN3+kbtfd5lEeKCv1H/g/SX3JsOAdHID1MBiOgRTvdRff77CNtr2jrdkOFfE8+3r9wNCjDq47J3Ckng+bg+Uo+eyzxFrXhMJuAqn4wb11j1auZ/lQKYE8AndWjPoOEugIW8LL5LqCVdcDhlvHjX97APmqLvg6eD9BKZgZFMNE95q4V1ekWag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f53fc54-626a-5e42-471d-b4679eaf54ed@suse.com>
Date: Thu, 16 Feb 2023 08:38:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] x86/PV: ignore PAE_MODE ELF note for 64-bit Dom0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c5458448-10fe-9c04-f25e-b69704c5f3eb@suse.com>
 <7c38a1dd-3ac7-f7f3-4a7e-a231f55e8f48@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7c38a1dd-3ac7-f7f3-4a7e-a231f55e8f48@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 50348c71-02b8-41e1-9335-08db0ff0cad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yEjjuZbNg9v0D6ikaSPsyEjSt0yOeJuucMCAr3n59L5QpuxcNpRFFazvP5ALNn2DIuMigWBOcnCaHMzV0XXry7ITaPlb2buGxOHLmqA0KiK2P7jt5vDiqiB25lbiPCWFwLmkvVNxdSeKM3O1hKnigbTT9X7i43fZVRZFr2oBrYSzpPYG+q9lqbToCjobkGSY0Ir8ufDksa5lkbGJQic42+6M3XB91pDC6I6PM1Qzt+oXHhyqz4LP+RmcElD1pO7hD35l9JFExVZ1qA2LJP4FIPwoSUvCDFO+s0zBYL8IVeTOSVlHbjwdvZw1RRpULuwZ6UBej13v6WH7ZQKOEimEqXIji/XFKDPhYpLOxr0k14ZdaxulVRE1IRChSALLO1RJ/is9aXZihMaF4bl3Uj2Oljb4weeZBCOa8MEz/cgny3UwhszVgtBaB+1Mej4REkJ9mcMQwJqOw+Hu+NwODTz8bsi9jyw/26+90CEs544pIiobbcfSZ+udGzMGvbJpF36uLDi3Bauh+fgIkaSaSjUuG4522V+iItCyGqxEuATPA1vlreyd+8QjvHM4nml0AFtZRSctp5fBHmAq8cwjbx4N3gOUXeHrypGik8OQ3+Fg5YQwBY6VTe4l0QFoR4+rQr0ZI5XDAMjoq0/Aht/Utp28NDRK1ONUzijpAp9Z21bTreqvnGXSXHxW6jJjSbk8vGXg7wtM0oWirQDf0WSXuKt5YB2eWs3+31gQA6g77PMnsx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199018)(83380400001)(478600001)(54906003)(316002)(36756003)(2906002)(31696002)(86362001)(38100700002)(4326008)(6916009)(8936002)(66946007)(66476007)(66556008)(8676002)(5660300002)(41300700001)(6506007)(186003)(31686004)(6486002)(26005)(6512007)(2616005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDBQTFMvTXJyaTZaQlQ0azZ0NnUxNVY5ZGdQeXhVQitTWTlqdmcvVUVibER6?=
 =?utf-8?B?Q0VtMHc5TVpqL1lQR2p2cjRpMmI1d1o1WnhXbm51SUhwS3FpR083anlUbGZ0?=
 =?utf-8?B?MUY4RWxZTW5VTEw4Y2xzY2RwRVhlaE1qRFBPenQzQTVQamUyUHRJbnJhamw3?=
 =?utf-8?B?aTVCa3daQmN5VVJRRExHRkowL0pZSkdVOUMwNXN5OWVHaTVBaFBmL3cvanFJ?=
 =?utf-8?B?VTN0QWtXUFlGQmt0c0tCallSUXprMUtuN3AxSjJhWE94QmVpSkQwWGZFdTl3?=
 =?utf-8?B?OWgvekh4T1NlR2tiUERHQTF6Q1hvaVVJRmpsZG1WMVF0MHhPTUNKUDBrTVNy?=
 =?utf-8?B?RXdFT21say9JZmxlYUVqZ0ZmL1FLZDNBdDZqVDhUdnpOUHFxOFVQaVlwZVdp?=
 =?utf-8?B?c3ZObE9UYU5LcDFnQzhldlp4NStodnJ6UHcwRDNteWhXblJqT1hiMEh1WVRQ?=
 =?utf-8?B?ODBnYllEN21pRm13Z0tFWG5WSTVlOVBSRFprcFQrRldSTEhhQXQxQW9peWJ0?=
 =?utf-8?B?ZXpDK0VSOEZPZldWTGhUbjF3eUFraTNzSE9DQm1vNmdnT2dBcjB1K0tVRUVD?=
 =?utf-8?B?bCtkVGFtS1BaZ0NpcjQwSGZ6K2hVNC9kUldQQ2ZhSVc3cW5ObU9SNktVMzBR?=
 =?utf-8?B?OU5sR0daQkF1WHpucmVQUWpSYm5YL2ZsMXhMRjlWRjR3dUl2Nk81ckZkeUJS?=
 =?utf-8?B?ejJERTFHcHJ4UXE3Tzkrb0J4bklWOURsSFJZSklhMWMyT1V1ZVlpdGpqbGww?=
 =?utf-8?B?akl0aDJ5bmY1NE4vSmM3VDhZaWRqcFIwaTdnZ2pmWE9EVWk0L3I4YzRzSUNj?=
 =?utf-8?B?aVZRUGpIM05RZUR1QkNZc2dOTzdtL214RHFvVWJpSXZkQXNraHVwQ09MTXVH?=
 =?utf-8?B?WkZWdXp1bEcxaVdTZXJPN3JSdURPWXgwd2dmVndTTC9PcUVjRCtaTFRBVjVO?=
 =?utf-8?B?aDZ5M2tTSEZlbUx6d1dzdGs5dTVWZ0RJSU5jTExtMGpDT2VHMVhJcE9wWTU5?=
 =?utf-8?B?Qm1KR1QvTDlvVExlcEEwMklBWloycnkrbHE4NG1LM3ZtRmhmMG5MWlBVNEpU?=
 =?utf-8?B?c1dHNWZrRjdIK1RMQ3pZZWc3L1FUL3B5THNRdFdJNzJ5VGp5UlFocVRYQk83?=
 =?utf-8?B?eDJkbDBma3ZGY2NhT09SVlNXL1FiMEpDTGlLMEl1ZVl1djY0S2V3WkNoL3Qy?=
 =?utf-8?B?emlpYzF4d3krYjRjL1l6NHdjd1Vac24zMmw0ZHdCdVczR1duUEJSdXJ3T2pU?=
 =?utf-8?B?ZG9ZVE1tcm9rWmJHWVFGRkhrWUkxSmFKNXh6dnMyR2VyY1QzbUtCRUYvR3lG?=
 =?utf-8?B?RXFhWUZtS3hDSFV3cjBreWdpYnNuR1dmNzg1cUdSTSszVWlIM1FuMEZxcnVt?=
 =?utf-8?B?R0Y1UEpnT3VybDJLaFpEWS9ZSWttbTMrdFgzVlNhak4zaDJ1bXhuOGJlOUsw?=
 =?utf-8?B?aTZuYXNaYWZha1NrcUF0ZVppbTI5ZXpVNEpCbU9XLzJaZnUxSVEyeUk2MGVU?=
 =?utf-8?B?VmpUNXFHUGZla1IyTWs1aWpubWN3UC9ubkhtdWp6SGJ4MnlkT2F4cVlEYVkr?=
 =?utf-8?B?ZTJxWWd1Y0QwaUZGWm52VWFlZmNhckF3TTBUY2dSYmppNStPcDNONm5VNEpM?=
 =?utf-8?B?MlNnWG80NEs2VjF3QmVmb3BJYnZ1d0ZBRUQ1bFA0UWpqVlhsaG9abnFBRStS?=
 =?utf-8?B?STBGbVFhK1RtUFFwMCtjVnYwYzhnRTBkZmhNWTZaMXA4L2p1MzhOMFNuaTlM?=
 =?utf-8?B?Y1k5b3lFT3EvcUpOd1hQMEtySUpudkFDQ2Jockg2UXBrNHAxcXhzK1FHVzV0?=
 =?utf-8?B?NkJ6RmxGWUxGRkJMMUpINWo1RXNlck5LWDZhZ3hVdFZ1VEQ4YUxuaU1Ha3lH?=
 =?utf-8?B?eGUwMWdlSkZVUEVtT2N5NUJYNEVSdllLQllXZnJ3TUZJbE1kalQ4WTdBV1FG?=
 =?utf-8?B?WjJ3ZHo1NTZMSFZYb3ZGbXBwaU9vbFVKNTdUdmtUYytleTYyQXJ4K2NPMkd2?=
 =?utf-8?B?enpKV3NXMlpmRmdKK2xGWS9wVmo2Wjh3NVViVUtoSnRyOXhrMEI4WWxEblBH?=
 =?utf-8?B?TDJ0S25xaUYwM21UR01UZVY0cHpiL1ArU2FNd0Rxa25BZ0pnOGN1MldDd3h1?=
 =?utf-8?Q?hRGM/OyDa5FTez8YImeqMlbRP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50348c71-02b8-41e1-9335-08db0ff0cad6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 07:38:27.4247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYYD9s11xgJjH7IPhh8N1aAzvqz0gnnD5Op9uKfJZnoGhnUGfCSqPk2WAa26uKgXKi4x37iNJwjoggt+Ey/y+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

On 15.02.2023 19:41, Andrew Cooper wrote:
> On 15/02/2023 3:10 pm, Jan Beulich wrote:
>> Besides a printk() the main effect is slight corruption of the start
>> info magic: While that's meant to be xen-3.0-x86_64, it wrongly ended
>> up as xen-3.0-x86_64p.
>>
>> Fixes: 460060f83d41 ("libelf: use for x86 dom0 builder")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: While Linux works fine with the adjustment, I'm not entirely
>>      certain of external tools (kexec?) having grown a dependency.
> 
> Again, I wonder why you think regular kexec has any anything to do with
> this?
> 
> Are you mixing it up with (legacy) pvgrub which does end up doing a
> kexec inside the context of a PV guest?  If so, it's MiniOS's support
> you need to care about, and I cant see any logic that even inspects the
> start_info->magic[] (either in MiniOS itself, or the pvgrub patches).

I guess I really was thinking of something like "crash" instead, mixing
things up that way.

> Like plenty of other fields in the undocumented PV ABI, it's not
> interesting at all to software.  There's nothing I can see in it that
> you don't know at compile time.
> 
>>  It
>>      may be worth noting that XenoLinux and its forward ports never had
>>      this ELF note in 64-bit kernels, so in principle it may be
>>      reasonable to expect that no such dependency exists anywhere.
> 
> NetBSD sets PAE_MODE for 32bit and 64bit but, like everything else,
> doesn't appear to inspect start_info->magic[].

I.e. the same as (so far) upstream Linux.

> xen-3.0-x86_64p is obviously bogus.  I find it far more likely that
> noone has ever noticed this bug, than anyone gaining a dependency on it.

Which kind of reads like an ack, except there wasn't any ...

Jan

