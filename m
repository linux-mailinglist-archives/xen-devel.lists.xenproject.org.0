Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65F7A45E8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 11:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603852.940951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAZo-0004Av-Fn; Mon, 18 Sep 2023 09:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603852.940951; Mon, 18 Sep 2023 09:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAZo-00049A-5S; Mon, 18 Sep 2023 09:29:56 +0000
Received: by outflank-mailman (input) for mailman id 603852;
 Mon, 18 Sep 2023 09:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiAZm-000494-QP
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 09:29:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec2d188d-5605-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 11:29:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8172.eurprd04.prod.outlook.com (2603:10a6:10:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 09:29:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 09:29:51 +0000
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
X-Inumbo-ID: ec2d188d-5605-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0AESs3sfp2Lx8vbqjGmxc6uzUQUQjvK52XeyW4iuI4ktcAfTGBA4asYxkCCkZhSvJDCloJMPYJuQmhZw9h4pdCv/6SyhJbJRzDcfoW6NZ7dJT4GHG0txYGx2cLsBpWc6eKUSGVBnX/PSu8P5ex/ZFE6pgYUFp4TkuFOSssyl2DVSoSmcqnZIqqmpNwQw0hvDuwn9XxACv8wVnjLM8TpTd0nbK8Na1BjLFhF6PMi3GDNLoCK8Zixjkx3JCAVMQIWksob6JzyiNgCAB9aGTBwI3nk++fVL0Dw9qOeAHCIAytJeTpzxQDi6BIF+qtqKUA8DHZ7I/rnT+RTAHbkiQmaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BvkfHbyYBZ2ENgsnsxNoJOZF0YHMbHuBBEbvoaXwfQ=;
 b=XUshWUbEXAyrLNMWLQ6i1rGiug7XWvXMLbU7Hy8sGeSsX3DG97JIQxI2SyjWWFotXXk0IIA0qJ/G6DRVWMiFo90mjPiqVTLZlFe3CWU3zbAsjUlgO5EkEs/GnHClamp0tiYpXSVsvuOr9GOrvFYevaLAA+5/lbxInWa2TAPCjy0I0bhR49PEox3y7UkDA4rH5ZFdTK8IF8A4NiA6iRoH75NNITfTsH5wyqAOO8HJvSlTgtgRsGX1QzMINAHxP7BKFWOQhWMEFLs3e5CSJfiWxCR7uXuIPZVZqCceFy9j4d7tK/PEhTtv5af2gVa1k0mwPIWcvdxjcB3OssXZUHGpAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BvkfHbyYBZ2ENgsnsxNoJOZF0YHMbHuBBEbvoaXwfQ=;
 b=d3RjKJsGW86dr959urUooQebxCt2y11qVFUx9keVYc0MJ243f9mU8Hh5nSI43zCd1DwheuUqTol6VljX0JGomPnnAyOcV+yOudmFTdNrVca/dyK9mkMXVPADNTm2pcBeuYYCWw00HeE3ndv07j4V/yTT9TGDDhxHBMCY7uUvTvCv0n4X48IVAxfZUvUvfIo1qATaBIComhwgJ6J4l24fCuP7Z/vDaJkQfLUm/EGRI25tA9+ldeb9IJfbkZacdmk0b3RXbfj6vXhXMKYpK8M0oOiMzhXoV1+9ypKzLqcDSNzJJfAZoA3DzxjrOT04ibc4hV8wlJ4SvxUCBs86/V8M5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
Date: Mon, 18 Sep 2023 11:29:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f726cfd-a30b-4eb6-6a6b-08dbb829cf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wm01YzNSIZNSYRS4Mn4IlKaVeBrWaYtzydo8QQS7sULmf7G/+pjdXy6hW0Rtydxm7mQASthyjQmiHFT52R7p+QebsDj1J3vkOp9f0b124Um+yhyBc73jcyQlcVPcuZueQRxH3E8CdTjoP9xtfjSXRqYlxSau1fZIwp0B2PXDtiTb9L76lLWXOkdYMu/CW3pkx5dvRV151StArwAgYgLP9SugXKyPNizCUcy/OqkCcignhmpnoHw4fzU9waa74jaLx+EztJQi+Lwc8ras0riEM39TtlQTl01Y0QGLZXnYEhVfuuzmWimScfTMfcPSTohefCet8zOmC8am0gXdaX4JXUShZW1RNubBUkyQHEShFq5uM20VVmwBXEExKvvIsm4GJV+62dqEN1a8D6odX0S32P4ZjbMJA9YDwZoDWjlDe3rq1Ev1eep7sbb3k9jlDz2961ngBDUWodulOcA6+6/KuwZdS5Noo7AuF2UOT68ImgqweohGKBxeAvsTw3GYKQXi1wV4PfqXnjS3HiBZo14eG/WpD3S+/3qZ4x+FzxmRiBAkhxWlO4Fg8pu0dxh3K5zQT3+0FztttpLLXW+IdR6vVhoDjoITRnnJoCu1VGhdoB8izC7viWqYSJkK/fgNutrorLzBMz9g8gp6Xiy1qwTqDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(186009)(1800799009)(451199024)(2906002)(83380400001)(7416002)(38100700002)(53546011)(478600001)(6506007)(6486002)(6512007)(966005)(5660300002)(4326008)(6916009)(316002)(8676002)(8936002)(66946007)(66556008)(54906003)(66476007)(2616005)(26005)(41300700001)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBLSU5KaU9qR1hJWHZZelVtRTFYWFVlbThKSHByMkdiWkJiYVBDSDVYcHh5?=
 =?utf-8?B?cWVOelJYY0xrdk9mamFtSyszdE9WK2I0Y3hsMUJaT2RKaS82QjZ6RDI4cFY5?=
 =?utf-8?B?YWlZVkRPQVJPdm5xaUpuN204OTA4RGtsUE41SVZMdGs0bHVROWl3c0IxNU1w?=
 =?utf-8?B?U0VnY3REaFozdUZ1KzFsSE1qYWFoYlZuaWxMbXJMN2lER2JsKzl3bC9BNTVB?=
 =?utf-8?B?dzYvbm1xQUpIQWVSbHFUaDFvYVE2aVQzQmZ3Ti9qTkVUYzVMUnFWUjVSaU9x?=
 =?utf-8?B?bjQwQU4xejZZVSs0Z1V1NlhZN0JkRUs2Q1FTckFWNXdXWjVhWXRHbzBWOU5i?=
 =?utf-8?B?MEtYdWZwbXpSVXpzWW96VVEwMGd4UUhQcXo5djNBeHlPTkdxVE0xbmJiY0ZP?=
 =?utf-8?B?NXFkdUtkbEk3SmJXWmNZZEdMOXAzMXdLSk84Mk8rMWNzRUdidGhJSGQ4NWt0?=
 =?utf-8?B?bFlQMDFwVVN1ZE05d2J6R1daTDBxUEhiWitHb0JObFhCTFRpc1c2RnZ4MEQz?=
 =?utf-8?B?SncvT2Y2VjRaYlRyemwyR3RzNTBKUVRiTlJsNUVQc2tsdXczRk1WNEc5V1gy?=
 =?utf-8?B?cU1PcGdXOG80L2NGSDlNVGV0MzdscTduaVdaR0tDRkUxODNJbkVudWF3MjBP?=
 =?utf-8?B?M2RvVCt4aHlZS1RrN0RBam16VG5zVEU1cWdwdTZzYnlsQXpJVDRWT2lNcXQy?=
 =?utf-8?B?QjBiVDZ6SFRQVnpOTHVrOGRtSlFnWk5aWHJ0cDQxcTV5cEFYTGlIc2lNNEtT?=
 =?utf-8?B?TEhjVjEyZkRFTUVmMk82NDNSeEl4aGw0cGJwNGxBWkU5ak1FWFhRTzVYUGVB?=
 =?utf-8?B?TG85TGR4dkJtVkFJYWcwZG1rZTZrNnh6T2NraUdxdWRBdTlTb1MyNWYwQkpC?=
 =?utf-8?B?QVRnMXphcWh6d2RmMm1oVVlxNnoxbTVycms2YndGQVJNLzVFdVlVQ2F5dEtG?=
 =?utf-8?B?Sm5EYVl5bHNMWCtnUE1RMGJPWC9DcVVVS1YrQWtBVFJZa0x1Y21EU2phalZF?=
 =?utf-8?B?U3ZOTDZuUE1ML1hBK2N2U01WUDVTYlJVb1RPT3VhbGVpMy81Sk9kbVptU21t?=
 =?utf-8?B?WDFDYU5zK3V4dGgyNDkxQVdlTUZGTGhubG8rNVhyUHhnY3gvUENTUmpNU0tL?=
 =?utf-8?B?aHBrTFhSZkFacVdLWkVoNC9GcE5JSkdwNVI3Z1lEZWhXd2krQ0dLMVdXTTdj?=
 =?utf-8?B?TTNIK1AwWFV3ZmFaU2RWbmhub3d5Mk5VeVNTMlhnK1ZGWFRFU1lxMk9FSUtW?=
 =?utf-8?B?UWRwWm5jWCtKUEF6NWZrSGx1ZWdnai9nVGlNRGRzbnFhaE83dmI4WWxENjN6?=
 =?utf-8?B?STUveUxnSUkzNHpXUmxkSzdxSFJmcjlNN01xOVZEY0dXNldxZlRjOGFVWnFB?=
 =?utf-8?B?YllYVFBxbUxzQWx1U1RCbEU0aDJDM1V4QlBtRGhHOVZIQW9MRXJMQW1VS2pU?=
 =?utf-8?B?VG1YSVFiOFV1WVc2RnJ6TzRJM2ZWbVdGYVdjdU1Pdkx0OVQzVXEwcGs1VFhx?=
 =?utf-8?B?OUlXdklab00xT0pKdUVzMjFXUjYvd3NLOVJ4NGhJY2pxK2pXbnJrOU9UUnJq?=
 =?utf-8?B?V3hQVVhQSkFQZ0s1bDBEeE5kRTloODhDZ3NMRFowVTlya3R5ZGxjR0pHWTJH?=
 =?utf-8?B?QjFzRlRVdVZweUd0Nm1qZVdDemcxWjZRdUNXelR2bnYxSG4vUU40SWJSN3N0?=
 =?utf-8?B?VmJxSXd3STVmSmFjWFd2TUdIcEljamFWZnQwWm5SSGpNWXR3WWE3dXhVbGcz?=
 =?utf-8?B?UFAyc2pMQWU0VFJXbE9NdWU5Y1VYWThmdXpJTllkRUxEazFkaW9KUlhlN2JI?=
 =?utf-8?B?eTBXTldUeFgvbGY5OEZMZzFoVzN1NkVLUDNqMHp4SWhIVW9zTWhHSkZpcjNY?=
 =?utf-8?B?Q1lqMHFna25pT1FVU3l2MHoyWWtmeXFVOVBIZG9adjNUWWh6SExIWFpUREUz?=
 =?utf-8?B?TDFYRU9MZEY2YmVzd3pVbi93MjZuQ3NOUGUvRVg2dkFtZDhsUjlLTE93YnBo?=
 =?utf-8?B?UHN1UE1uMEczYlcyNVpRRHZ5bnZFM1NMRzZ2RzNoNzdLRXY5MUdFWlFQQURZ?=
 =?utf-8?B?TStINnFsLzQyU3M2dUIwazZ4UXVsNTJaSmluVmlCM3MxNDlROWxrQlZRcWFQ?=
 =?utf-8?Q?96Xq/8ZZR2TTcn/5zFWCJs0Qh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f726cfd-a30b-4eb6-6a6b-08dbb829cf1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 09:29:51.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iC8/uR1xhD5ZtJPwG6hzBsDePFitLbn3R3CC76qc5Nh26ix87Dabd38H6/z102XpkQQ7tJEia1KZJM0P1D3azg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8172

On 18.09.2023 10:51, Oleksii wrote:
> On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> Based on two patch series [1] and [2], the idea of which is to
>>> provide minimal
>>> amount of things for a complete Xen build, a large amount of
>>> headers are the same
>>> or almost the same, so it makes sense to move them to asm-generic.
>>>
>>> Also, providing such stub headers should help future architectures
>>> to add
>>> a full Xen build.
>>>
>>> [1]
>>> https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
>>> [2]
>>> https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
>>>
>>> Oleksii Kurochko (29):
>>>   xen/asm-generic: introduce stub header spinlock.h
>>
>> At the example of this, personally I think this goes too far. Headers
>> in
>> asm-generic should be for the case where an arch elects to not
>> implement
>> certain functionality. Clearly spinlocks are required uniformly.
> It makes sense. Then I will back to the option [2] where I introduced
> all this headers as part of RISC-V architecture. 

You did see though that in a reply to my own mail I said I take back the
comment, at least as far as this header (and perhaps several others) are
concerned.

Jan

