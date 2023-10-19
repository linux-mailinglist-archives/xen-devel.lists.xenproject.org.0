Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC927CF363
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 10:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618994.963421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOqq-0001zn-SP; Thu, 19 Oct 2023 08:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618994.963421; Thu, 19 Oct 2023 08:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOqq-0001wb-PJ; Thu, 19 Oct 2023 08:57:56 +0000
Received: by outflank-mailman (input) for mailman id 618994;
 Thu, 19 Oct 2023 08:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtOqp-0001wV-KJ
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 08:57:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97357f52-6e5d-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 10:57:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 08:57:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 08:57:51 +0000
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
X-Inumbo-ID: 97357f52-6e5d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T62FDYKLBwG22ccGIE1KZ4DO9P8Yy7yNFepqWdtVpHucVYvoDwZ37tZ887TbKxN8Q7h8R9F7xDUPtL7ezt/5dI0Pc5ur6LkZbYJVYuoQl9/eIJxVVMdyYCGdLR6DiAs1iULSyOeDowOi8YGUX7rnjV+3Sqrp0yjZJvyxLSxFGYJxkJlfswSyjMzPxY+344Py2dQa/hFcjDQdeDN8FbMjN/xUzFtacOm/PpQ7EZtzw+hYLPUgox+WWfbsbNEGfrrDjeRxgD2p0jNS8et0b4+W7drdBAjDBRIwu6MqE3FLKiIVInJOcL9IrqT0rzFmmT+jx5h6wnm/XD33/EDirK5E9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3+NXjmF/TaXgYfqK+BH/JVAO+YO2KV37s5GmeVG/Dw=;
 b=X9gb0OKY39Lpbp99oesH5AMVCRvPajwZrzW5x/XuhH3vayo0Zisu1uY7V8EruehStwUWNqV9jhyYh2LEFXQlQJdzcU20Yrwf9LRd818m8sB+tHoovrVCTjpgeIYzgXV3q48MmQpkOnvS58hUGU+Dn1R595IWVbo6r92mgSlWr7e25phkUaTWP7QndxJAOiziBcYhdjmrjaxpsfMvXxjwLiMsbZxjy+MF52FTUhd+Dy9CtfliUMHS7zcaSK/epEoxxPIKeIjLD4AiILrYkFVg+vMdhOvkXKr99LJx4dTK3wl2TtoK9GE5V1/uFNb29EfCghVV9DyaYiwTLZwKVm9WpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3+NXjmF/TaXgYfqK+BH/JVAO+YO2KV37s5GmeVG/Dw=;
 b=mXZxKDaFuOR3VzYkoum5PY0CYgWIb10RtMhldSE1SMxJmfqJr/eWLeCqomXvu4kxcWZbrf5vE+9I8w/YhfgZNl2V38A2/RghcqscANOMXwJ9BmlSH+SfyNHb6tYcCWDtspDz8hZeyK3o+96LV72VjLMS8iZqn5Q2TA1oXa/+VEjXWEI4PT6pOq6qpaewoPbvDGFL0gp5QWTD8nmG6Eh9LlCgQ92vD6oJc6YSTNXV/tQihFRWITg9+Z3akUlWxuUHvshfAYGD9tjTJtySxhDjcaeNwWjAokj0o3/sXAG1PMBjXaqUMXaNnip4bjp74ZN9BgMZz20Jr5Q4SPsi0ss6pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d67b3281-0600-a75f-5ce5-63dff47bc98f@suse.com>
Date: Thu, 19 Oct 2023 10:57:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com>
 <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
 <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
 <dd3534dd-29b0-129d-9f34-b542ed3ffabc@suse.com>
 <alpine.DEB.2.22.394.2310181703170.965337@ubuntu-linux-20-04-desktop>
 <94f59896-5182-c711-98d7-dcecf6073201@suse.com>
 <e723c1aad066436f701f284ada836f1f@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e723c1aad066436f701f284ada836f1f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb74a2c-f90f-4932-b344-08dbd08179c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZJ4UmyWcQmidlyyM0ZiGSI4/dm3Zr8A5Go3oSmuFziF0XFZrhVloGK2Onox49SLdUBF4ccFvp9ATx1l7bIv6H0UuiEWQwlIa1Uo8UbCq3PkoqY3/3wI1k7PVW2QW8utrLO4kIIszSAEgw3WkssMaRdcEGbhzG4DRmI9NEJ7mUQdqczwXG5VlvzgnprZLuJW+che6zRHhelQskA5Ey2ypxltuMgsMjkGkDPTJ4ekZc4C3UcsV467acpGWgu5t3qABTY7FtfMG7ljBBpGFW49BKC4QMIzj0x9HMeoqT7xIKh9Ohhk/xUYsi4DJ23tebD6Teiz+fk7qdRa3Tb/Kv7eatQw4ABFF2D6F8IRtY1VkZbYj4g+pO2NYaBKBTfrrLd/lrvqoIWGASHYwQUYIJK37rEr26eAzfS32cFmPozMUmS4fh/U6xloVwDuScrc6TqBe/DGxzW2hhyp0b7ZIJ7G1aCT3PU74LHxAUxyi/YwTIi2o27bzxYeiqsOJalpwWsgVAkp2+f12f0sK5GFXfbprw7ahuztVYztWVnAsjIHgO2i4unC31vAFcN7NeWlOaF6gT+CUSonX7mtvkLeroscBJDYtnVmYsW53Ml5+JKWUJUDVPLQdfvLSSzhDUJEWNAwLLsSQZhDaA5h9HFUL9Pwmxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(36756003)(31686004)(6512007)(26005)(66476007)(66946007)(6916009)(66556008)(38100700002)(31696002)(86362001)(6486002)(53546011)(316002)(2906002)(2616005)(8936002)(6506007)(54906003)(478600001)(4744005)(7416002)(4326008)(5660300002)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFQyNk5pcHVva3hySTNCQUZ4NUN4aW5zQXp4KzNHR05oaXFzL0lQZ0V5aytq?=
 =?utf-8?B?emdkOU40ekxKVW85NGp3Z0F3L3U0dHpMSm9GRVJIb0RjWHZ3aG1nMk9HUWRF?=
 =?utf-8?B?eXFqa2Z2N1VXRFRxWE9YeVZVK0ErT3NQV0JYdFE3bXB3aEFCdzd5NVBnZkhn?=
 =?utf-8?B?VEl2aW1vUkJmS09Za2loQVg1aCtJV2pTbzdBSWJaZVJrL2xIWGZjWUlWS3dJ?=
 =?utf-8?B?SjVOVUFzNytEZ0R5a2dIOGxadmRIOFRJNzFlVnRuOXphUXpIVUZ2bHlyN3RW?=
 =?utf-8?B?UVVSdWhZVUVzNWFEYjBNZU0vS0Z1azFYRlRUTjdPOVhUcTFYQWVlWDV1UGt6?=
 =?utf-8?B?aWMrOW9sKzYwUk1CeVZhTXNNcnpISnJYeklHQndJM2YzdnovOVE4ZGRramlW?=
 =?utf-8?B?S094ZnVwTlZRSkhtSktXYm1ORklyeitDZ2dGKzQxSko4NjBCd3ZTbVMwdCtk?=
 =?utf-8?B?Rmh6a0o3dFlOSGp6MmlEbGtoMFBNNWxyb252NWJiV3pqY1JiVDF0NzlZb0FR?=
 =?utf-8?B?NjZFdzFNV0QzN0NHNDA2Q0s4K2hONW1aMlg2RFpkaWM5Tkw3RzFPWldkZE1J?=
 =?utf-8?B?QnZ6RXJ4L3ZObHkxa2JIbkR4VWJHY3dpS2lmUk5STUFaYjFvQmd1clM1Z1lS?=
 =?utf-8?B?aTZqVlp5dDNUU2xDU0I1U3lndEhTcXRXRi9MbUFROEhoRHk2UUlJWDYzOFYy?=
 =?utf-8?B?cmV4cFd5Qlp5QzZBeFRIYm9TUXQ1N2dOSDRCb1NSVUw3WHVTalV0SW41TGN6?=
 =?utf-8?B?VTUrTFRIUmcxUjFxN3REYld3OEEvVzVLaWI5SzhHN1ROY0NqcGIzQ1AyWFR3?=
 =?utf-8?B?YkhSeTBWYVlGL0YvZ1YvdHQxMDFqM0FtdlJ3Y2Z0cnVrc3pnN3dtQVZyaGFo?=
 =?utf-8?B?a01MeUsrOHlQOWxUZ0IzZnIxR2JmczVITDJybDAyaE5tM2E3Yzgzd1JjK3lF?=
 =?utf-8?B?alBXZk5XUEFTUkp3VWcvamh3SENuSUtBWDd5WlE0aEN2aUF0U1dKNDBuWktV?=
 =?utf-8?B?ckR4WllablFqd2c4NXBJMSt4dzZmVzVMb2JnUkZSZkI2OWw2a3hyN2ZQVFJ0?=
 =?utf-8?B?dG1XYzZNdThaeTlOWDhMeStTb0MvQW56SXBuME5GUk4zcWhxOVM4SG4wNWZx?=
 =?utf-8?B?aUIzOFFIdHkrSC9GL296MnZ2L2dZMzN2VnRTcUVNODVIT3B4bk1qdjZuZXJN?=
 =?utf-8?B?SDVHUjlkNnhKZGNuM2djbTFUUWE1RHJsQzVXcnFMTGwrVU1XNlBjekVPWHlV?=
 =?utf-8?B?b1VxSHU3akErd3lReDBNanlDdFA2bEhVWXZSNHZUYVpzemxNNFBNeDA5WEkx?=
 =?utf-8?B?V0Q0QjBLY2M5aG96K2s2b0RUQ041TmwrMkQ3MlRZOVJBZFc2c3p4WXlIbDFV?=
 =?utf-8?B?eGg4UjQyK2xnRjFhSWNvY0twekUva0JXaG05MlhIT2NoVG0wajRNb2tldXZp?=
 =?utf-8?B?bjRpVVZXelBqK3h1U2k2LzdOYmhxRXFzd3JKd29MakNSZzloR3FqZkF0SEJk?=
 =?utf-8?B?MnA3RFJOeDdhQytMN2VUVm5hQmNBblQ2dmNreDd3OFljSDhvdjBSZzFiRzdS?=
 =?utf-8?B?WDN5ZDJwNkozMDlvb0hRVXNVdDBKQlVNUlNaZ2MxUk9oYWUyeWI4MGFLc1BZ?=
 =?utf-8?B?elhMQ3p5Ky9uRUs0aEpLY3ViMWVsZDZ5NnZjcW50TjFtczMxQnFMcUUwZWpi?=
 =?utf-8?B?ZDRCZ0lLeTV6ejZ0SHFYLzlsalhTRnFOY2NSMGVvK2xPYlJCRHVSczhrRzBR?=
 =?utf-8?B?bmx0RlRoRWZiNnkvVERvTEZaQlFHUlV1SXNVTm1aZko0Zkp3SEc1aHpoaS9L?=
 =?utf-8?B?TTFSc3lQVlBZdmRXVVZvekZRZTluVGtXWURjNHUxekkyZjJsNmJuRzJxdkF5?=
 =?utf-8?B?K1Z4ZlBidFFWWEYwVGNsenJlSzNMckVmZys4RnA0SUdac1VOdi81MlhPY202?=
 =?utf-8?B?UUVaREdEeWI5VHp6Y1J0QnFCM1BxMjBXK0tDV3JJYXluSTRDTGlwUHdCeDJl?=
 =?utf-8?B?T0JMc0ZRTTFrSk55L1RvSlp5d2I5SE56WjlOVm5zSlpxc1BwS1FsWndadHVF?=
 =?utf-8?B?U0EvT3FtSWt1Y3BpV3NHRS9wWXZML2lQdVZWR0Q5WG1QajdUZU9FakpVaFRC?=
 =?utf-8?Q?7a73XjCC2s0vERw5hMHkpLC1b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb74a2c-f90f-4932-b344-08dbd08179c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 08:57:51.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tY2P8CdECEwo2W6R6FxbyJ63NS3nGzdJrqGxAkTMPZFKwI4AwQmB8PDsHVOOclEnvChcjsCd/hr5K5b/5QRM/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582

On 19.10.2023 10:04, Nicola Vetrini wrote:
> 
>>> - vmx_asm_vmexit_handler
>>>
> 
> Isn't this just a declaration:
> 
> void nocall vmx_asm_vmexit_handler(void);
> 
> while the function to be deviated is this:
> 
> void vmx_vmexit_handler(struct cpu_user_regs *regs)
> 
> Am I correct?

Looks like you are, yes.

Jan

