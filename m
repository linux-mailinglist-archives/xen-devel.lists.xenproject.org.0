Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B83C5481F1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 10:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347845.574169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0fSF-0003Iu-Rf; Mon, 13 Jun 2022 08:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347845.574169; Mon, 13 Jun 2022 08:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0fSF-0003H8-O6; Mon, 13 Jun 2022 08:29:47 +0000
Received: by outflank-mailman (input) for mailman id 347845;
 Mon, 13 Jun 2022 08:29:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o0fSE-0003H2-4g
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 08:29:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4d6235-eaf2-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 10:29:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4679.eurprd04.prod.outlook.com (2603:10a6:20b:15::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 08:29:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 08:29:42 +0000
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
X-Inumbo-ID: fa4d6235-eaf2-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOHILgFexGHd8iy68NGMdUWKN3mFrPbVPk080WBSKW53X85fQZFXZLhQoIvwX48T0BIRlT1nl7snIGV5E1CHN3+KBt/tGj40jfvRRhNlCy1UXJadRsI8w+/9VGr0SXyyLvLGMyAPVSJLcicTC/2GFCaYxURO1TC+lYwGYY4pfM/cFHhjrclBTrRd26z/MUFQ3tAGjZsPuCk5KnNYH1L1Rx2UDPMC5q2QeHhacCDD1l8Zv5SBrvzqocrsBUgEkbRLdGpLa7arQb2MOF/Wt4eD/bE03S5WCVMUQsA+F/+vGHyCyKnO9icISMr3xbpTUFJgT5DWVOUHWsfllOTb/BSgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYcrEut4kluYSceCBLqOPkSd1e7yrXpHrrbnXH3Oh2k=;
 b=MybAA4aKdZRWXnvomGruCDoCfftwudYQN/SRaWZdPJiGFS+msbYGFNq9Mo9La/skdVMZMwmopUiyjNTzAsLHhZlcpsoPOd0lfaKGerhb45piTlp4g4uvlLMr6KrNov2aoj9TEvk/sl6uHmXjHv3knHS6AjsR9Y0ktm5IVVyJCvEXug2GOT2x32GVfHBsF885gEX79oaO42Cq/zmOPPcUA8tg/EjIoWMEdKnzzDvTc2IXTnyLJMQwP87bAR0xSuRhoZyvsufeT/fgOxkoSUr3n5jNanZ+lUXIBHN908NSkyyKhP5dc+n3YfJ4aNsb/YlpeIcguHas1DSBHLxftwdqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYcrEut4kluYSceCBLqOPkSd1e7yrXpHrrbnXH3Oh2k=;
 b=pYxaUwTHOYEOg9og+0aElXDtEaWeXi6SjIL5eYvgx064ohxX6GOr0N6z2ZnBoA4N5Ce+aqKe4AwH+MpCm+mTo7JWgibRLY7mJS9YsDOINBPa3I/ptoLp4DACr7Yvy7lM76xCQR57PKJZIkyJu1TfGETYBVdOhj0jyzb2xApnI5FY+wXjEg1sCT766g5nnimR/1JkEIbr0XIrpB//e+/wCMGNCchh9sMnKqC3lVmCfN+GDFLB6O39A/NyWDPHndTEola0I71A9j46Atnrt7SSQ3iWqQ/akVR0QL9CDqNoYUB+0PDoNPTz/Ej62jYVQx8qSY0nh7FzWmWzFDxoiKskrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
Date: Mon, 13 Jun 2022 10:29:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YqbziQGizoNX7YFr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0201CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb343808-4d43-4a31-3e48-08da4d16dd04
X-MS-TrafficTypeDiagnostic: AM6PR04MB4679:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB467933D208135E503A9C0948B3AB9@AM6PR04MB4679.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jRQU1W+rt6aJRuoDBuXOI5qbX2ivls1iLhiKGtbS4HpHV0L3es5GyG9/UflJvXwfDKNRv9M3aWL9AYxKJ4z21enWHDaw1RVJWI3z5LTREdQL3/6bgtbsuZWwgpNdVftAScmTbKyruJkvDCUKIYTQW59n3rEaOc2/B3wao48G5WXXftKC/BZJdAeFfz651vIUNXxeLE1VvZlMgThtUrP60j1z1IZXGKmQjasegwbhJcVdguh5KRxS3AM+e9rOBAmaCpcCWaQtb/MgBTwhBZw/6dVbtRKCVeUDkMlEId9LHzYIu/Nn94sQ86dRfX2i2MBnJnX8Pg1AbDIgDDGYHxlxI/zBOpEt0iRI4/JgDjlCOup+sxB3iJHXqrwBm90L8snzselt7gaI9KdNZCH62wMECL8qr6g1WCOVhW+4U7bBxUPtT5ctpmGvNNGQdtiL3sqEV6v+9FghZBRdHttVt+FRYBknYi/WA0kRod5jUaNphcmZ/K6Up5t3sB2fF7joq+BRbGqhjcFJ7JPTNmimQLCYKimGu9Ae4YAj+kdvZyMNjIRzTYvMOwSLKxfGfEtFUWmQkYf2ADDQhuFEjpiokAhdIJE4I8DkW2rwtZtP087Qevg5nj7K0QnsTLyw/U/Ub8EmGj+p/BlHah0Ue9Xg//Kh2P21M/O3+dU7X3RQFRp8t18Ic5EYNVFkjowtZ50ubETViWTme4o2Qkh/Df3hDYWAYV99LMX0XDRZtIccB8pW9FA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6512007)(53546011)(26005)(6506007)(2906002)(2616005)(38100700002)(83380400001)(6486002)(86362001)(31686004)(6916009)(54906003)(36756003)(508600001)(5660300002)(8936002)(316002)(186003)(8676002)(31696002)(66476007)(66946007)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkYzeExoaUt4S2Jvb2V6Zm5NVUdnZzRIc0FyVnVuYnNjSTExbkRyb01rWW80?=
 =?utf-8?B?RjJsNjl2WHF4YUM2WlhHZzcwMlNaS1kyUyszTHczd0ZuUXYxSWM3Nm9QT08r?=
 =?utf-8?B?d1IyYmdEbU4xV0xqNkVMSzRmVnNxRDB6UGdqSXpSMFlsenNaRC9vOXI3ODlZ?=
 =?utf-8?B?RHVQQm5ia1NLRVloVDdwd1gzSnA0UEZyMkJvWW92dFErZFY4dkxoNjEzVXRS?=
 =?utf-8?B?WEJUQlpDcVc1Z0gxeEdwTG5HeEl5cFh4UEwvWTFzbXE3NFFnMzd3dUlnOWFq?=
 =?utf-8?B?ZVFZekNQZzNzdGx6Q3hJbFpJY08xUGRQM0pkR2tINXRiNU9GbHc3b2dQM1ln?=
 =?utf-8?B?QXdPNlQzQklqNHJWckl2YUVUeVFpb0cvU3oycjMybDlMdGFtY0hsMjh5TGps?=
 =?utf-8?B?VVF0aXl1MGVIRlpPVjl5S1hDb0xpNjhMZm1RYjlqbHRKaG5sOHY5YjZuSG5h?=
 =?utf-8?B?VEhmaDZnMWR0QURqQWpvbDQ0UFA2NFphbU9MK25oSFFlRjdGa0EyNXR6aTYz?=
 =?utf-8?B?U1g4NTdqVUdzS0Iwdm1DOVZFeTE4di9PYXZCODQ1WkhGS1dHRGd6TzNLODUv?=
 =?utf-8?B?M3dMTlNuVEMvL3BnS0tkbjFMVWNkaGh0RENJTjZ0MW5JclFLL2VjNGc5eVpo?=
 =?utf-8?B?akRRNlRXMUI1ajYrTU9uSU5ZTTZGTlU5SE9HK2RIT0tvcEJaYXN3NU1TeE1C?=
 =?utf-8?B?OGc4Wk5BWHVrcHp5LzZ6REZDM1RLU2JaRE5PTE9aY2c0Q1BTN1JQMnZPVUR6?=
 =?utf-8?B?c0dETTJxaTM4YXdZZUgxSGROd1N0amFEUUVnNXUyY1hGeHNhcWxzaWhFdTg0?=
 =?utf-8?B?ZXRZNEM2dEhQQmF6UUQ1RDVNblZXenAwR0FUSy9yWGZXTzB6bm1PY1ptRzlH?=
 =?utf-8?B?V2p0Wi8wdjh2MVVPVzcvM2FEZ3RKL0hpdTVpaXM5S0w2ZVlQbDExdjBQMHdS?=
 =?utf-8?B?QWQrT1FxQVRkSFlFeWxHc2FFZGNlV3E5Wmh1aHdzcjhPYTVLY3NPSWZOWC9W?=
 =?utf-8?B?enpDOUQxcVVpRU9DTDZoeW5jSFdJM2JUajNLU1B2dmV4MU10Nkt4MGVhemZo?=
 =?utf-8?B?VkJlaTRiMi9VcVB0cUY5Z0ROTXdHSndwU29DcTAxMWRvaDNSbGN6aXBlZnN3?=
 =?utf-8?B?QUxLS0N2ck9FUC9LL0YyU1dxVUViVFhPYU5aMUlYUHZNUXVsckRGUUJYb1Jv?=
 =?utf-8?B?RTh5ZVp2dEthdGtYMGRZZ1luZm4yYTBMelR3WmFxcW9Ca1RyOEk4TGFUN09B?=
 =?utf-8?B?TXN2Z1VnUXhHcm9ndE9YY0F5VzY2dnZ2dlJOS0IyUXhrdGtFemJrVkhJWXRk?=
 =?utf-8?B?UWIraWNOMFZXaUVoQjNORGc0L2x3bmhJbUZaU01kTjJDS2FOenhjcHptY000?=
 =?utf-8?B?S0MvaS9UYkVJL0FvNmZBR3Z4NHdhNHFnWTBYOVdiRGM5ZlZXYThQT0QyYnpa?=
 =?utf-8?B?Q0swNDdRbUpZMWpDQnU5L3dkaEJQRlVqUVRqeW9kYlFTLzMwMHREaXBnVEZH?=
 =?utf-8?B?OGlwOWNMZS9LREovMnVFdWRqN1FDVjlMaldycW1jbExkVXdicHFsZFRvbWht?=
 =?utf-8?B?enRJbnJzV1d2MEpoTXJVR1h0WFFXbEl3SW1Fd0tQczNFQnMzWnIzY3FxcEJG?=
 =?utf-8?B?UGJUb21WZFRxeStKZHlWV3MyRWNncTJiUncwYVlGcEFORmdmN3FzVjRiVktT?=
 =?utf-8?B?dWdHcDhnckFQVXp3TEN0SXpXK3p2eUpZdzFUSG1HWjAxYkdtZUNPRHpRMWNk?=
 =?utf-8?B?OTVINFdiRnJUMmxVTjF5Y1hHYlNRRUoxaEZ5VkpSd3E5dWo4NHhsdTY3QzJp?=
 =?utf-8?B?bWdIb2VsQkdQT3hvaHh0MVYyeUF5TTdyMFExdTFGbnZuUHVGOWtReWgvLzdv?=
 =?utf-8?B?bVdNbzdIU05WNVdZS1JaYUVmcnlzeW1JcjBFSC9lUmpCdDVsMmdYUkJRZTZB?=
 =?utf-8?B?eGFrQm1mQUhQQVRHRGxEY3J2QllqL0IxVk0rcjJIVWFLVVEvV21QQk5qMWNH?=
 =?utf-8?B?Um1QUnJWQUpnTWxVMUhScmUwK010cmVrNFdqZnNndUpPNkthdGE1ZFQzY1g1?=
 =?utf-8?B?b1FWOURNdkMrSFRocko5MlcvNEZsYm1pSG5QL3EwQ0tDemU0Zm4vQ3BYWG8y?=
 =?utf-8?B?NW9VV0lHNkpMY2l6aUpoc0N0dEt6NUwxSlNsejdzSlFFcFhNa3NwaHY4N2Uw?=
 =?utf-8?B?TUZDK042Q1RrMUNMVGRBbmQyeCtaUmlYa1FlaWd0R3NTMnNpQ0lHQnRLSlU0?=
 =?utf-8?B?TDBURzEyVXdNVWdFZDdtMVlpODM5aG13SnhLSWorbUcySldaR3RUcVNsNytH?=
 =?utf-8?B?Mzhtb21FYUdmTit5TDVIMGcvb3g0TnQ1Y25LbXpGTFRqV04xazQ0dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb343808-4d43-4a31-3e48-08da4d16dd04
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 08:29:42.0414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDfVAtiKgAeisMEjjXGWKEyLq4fB2B3PMc5oXZMhQemH+eNOb58fLdP1vhKN/fVx5En02UFPVJD7Opag1mBNnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4679

On 13.06.2022 10:21, Roger Pau Monné wrote:
> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>> Prevent dropping console output from the hardware domain, since it's
>>> likely important to have all the output if the boot fails without
>>> having to resort to sync_console (which also affects the output from
>>> other guests).
>>>
>>> Do so by pairing the console_serial_puts() with
>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>
>> While I can see the goal, why would Dom0 output be (effectively) more
>> important than Xen's own one (which isn't "forced")? And with this
>> aiming at boot output only, wouldn't you want to stop the overriding
>> once boot has completed (of which, if I'm not mistaken, we don't
>> really have any signal coming from Dom0)? And even during boot I'm
>> not convinced we'd want to let through everything, but perhaps just
>> Dom0's kernel messages?
> 
> I normally use sync_console on all the boxes I'm doing dev work, so
> this request is something that come up internally.
> 
> Didn't realize Xen output wasn't forced, since we already have rate
> limiting based on log levels I was assuming that non-ratelimited
> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> triggered) output shouldn't be rate limited either.

Which would raise the question of why we have log levels for non-guest
messages.

>> Finally, what about (if such configured) output from a Xenstore
>> domain? That's kind of importantish as well, I'd say.
> 
> I would be less inclined to do so.  Xenstore domains can use a regular
> PV console, which shouldn't be affected by the rate limiting applied to
> the serial.

Fair point.

>  Also that would give the xenstore domain a way to trigger
> DoS attacks.

I guess a Xenstore domain can do so anyway, by simply refusing to
fulfill its job.

Jan

