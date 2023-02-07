Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19168D11A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 08:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490892.759788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPIoy-0001R8-3X; Tue, 07 Feb 2023 07:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490892.759788; Tue, 07 Feb 2023 07:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPIoy-0001Oe-0m; Tue, 07 Feb 2023 07:55:20 +0000
Received: by outflank-mailman (input) for mailman id 490892;
 Tue, 07 Feb 2023 07:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPIow-0001OW-DH
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 07:55:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0c39f63-a6bc-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 08:55:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 07:55:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 07:55:11 +0000
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
X-Inumbo-ID: c0c39f63-a6bc-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVXtlrp5wo1v0g70x+vb+DJQFE1beUiFWmGOYqhT96N/2tWgOBWZzoVRahlgaoXUOSbfrbJ0cn6wcSYZVBcEzYDaWgvn15t1TfJXlPuhDtKkWHoCHAhPV5RTwDmtUUPnmlovQuu6uecFnEKaaTjmbAjw1oqubCFKJXG5PRwLqMUnaINxOVBeTxHM87QVtr8EjFL2zYsABFd3DfyOogHliXzT2Vfj8sLyF/r0RCO2QsyzV3TKDFsgfzVOBviYRFE2ES+UQ8pe1ppUau8va07PkkgKLkBIeNlPwCuZI7PIkChYHzg4NKHuCW88UAGLmE8hi2EWRb1N0uVLAbq5OnAeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyMlDGlnbTjTWKsUr9Dg2CKy9ZY+rH0jptAkKFFu0Vs=;
 b=bJAZqnKIgUugV2Oi+lXWQ7AEi1FFY5rWoVqfU8pa+tLUwDhhcTWcYwG2BqJCHjEj9cxbGGigp685NvQFq5K+t7tjM+taYdn8myD9db3LdYyXxSh3Ncw+Hl7uJj0EsIaZnFCAinQ80FP2aKC1QYElneQ+tOMx0DphAzRPAmO4Wx/4Fcd4xlYGEj4+FRpVmgNH9gCPhob87kPBLbI/Lhrx6bcIiBPJK9+eumAMu0CD+tmQfXZsK58sile1HYlOIpAHYMlQ59dGXx4EtxPDXv3mQYIWp/6eMggaTtSi9w9efEt+PUf/ffz4HYk3xJzUWuUuTPsod90kzTF45v7VbSivaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyMlDGlnbTjTWKsUr9Dg2CKy9ZY+rH0jptAkKFFu0Vs=;
 b=5idHm8X90BuhvM+81jqSMEWFWUNXgl0+/ZXaFxV/rW8nQvBqauQEmwdkPtZaRfXnoDlDwGk/mqHznHDUyycqZpOM3AoIHVVkerwAgur/ZBOE/EZ78B02YoCejIlTTmAYy6MDij85k/C93yUlARCGAaFghpQKrY+U+M+xHbIq+bZfbqJBZ/UCqxaX/o0vCTVu3T+KB6eJ4ADTgv54GdwnaozqmGWf6fU2nqI63gnFfkGvHMUn3K5wpGP7v5QgWKll6SuSR6Uyz3H0JG39XT0zQ9rTiBEZv67ltizbw1ZFmpUfmUt/s6iEev+XVft8GHyWft72YSdhNkSNpwbebFUhlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53e151e1-9b35-bccf-1589-fc503729cee4@suse.com>
Date: Tue, 7 Feb 2023 08:55:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Proposal: List files in Xen originated from external sources
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
 <alpine.DEB.2.22.394.2302031145530.132504@ubuntu-linux-20-04-desktop>
 <53371bbc-ea78-4c2b-a84e-e888ae090d3a@suse.com>
 <alpine.DEB.2.22.394.2302061323130.132504@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2302061323130.132504@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b416610-9fa6-45ca-9195-08db08e0a34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6i2fhQ4c0/h4tVFPdllj4v0ulH/PGEMP+GGq87b/5ClzGqOWsM2G5gxNUoys+LbVXqWNm4vxWmZUg5pubapmgsouk05p7p3YrpbYGh1gUw1SHOMmX5MVkvDmaByeWEcLsdlo1MnP/3E8d8lJv9LCpm8/tqBfWs13nlH6mt/nmrshKnjzSGvG+UB3GFRq+BAbV6sP0O194nCcImus6avb1oQBPtFBfzh3BCxjPC8DFhDS6+PL3IiiYfCmNWRlVVHmSOJgXJk4+mU+Haw7fuubJyR+xkL2HCuawREcZcD2pxGx05rqyeBccj6TlMcUC/FU8LwSFkUNo4JD6FVA7+qmD71dUVzSIbRnEhQ2YHZ4YJxu7GKiaS21Tv7LS+Ec5c7u8J0GryiGZMw1KrNbausMG05DmFLMObbcFWn2o1jQkpUzbe9KYDaJV8esBC5jXL0dBbKm1c4RIzjzfjEwfaZVka73ALw6kHVZ1TR0p3bGpggi+FIr3rTFYIvvSEN+kImBVSSE8bdx/w0fem1t1761ag/d96XLMYmGavuUDd08jvQjrOvjTk23idDqTYz1nMOVI6JK+UNSlSCyV9FtEj+3Me2lN8SJm4tyu7b3EBJjOhDNIfsUXqWmlERj6qjxbJlyRp6X5vwcUuQQxDyVKKavgsdtUTBwQI7aw0/MtxYOqRgh0bEdEm5b4qU0GY5+Qy/IG294IqoKUmR5CWryQAcKVfRSvtKgPHYe+PadoMTKoec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199018)(31686004)(66476007)(66556008)(54906003)(316002)(66946007)(86362001)(31696002)(36756003)(2906002)(41300700001)(53546011)(6506007)(478600001)(186003)(26005)(6916009)(8676002)(6512007)(2616005)(4326008)(38100700002)(5660300002)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2FteEsxa1ZyV0JMR3VqQWYyRS9NL1FXOGlvTS8vVGwrc29qSUlkdDBvOXlR?=
 =?utf-8?B?K0ZBVTBwVkZSRE9wK0o4UGgxbEx1Yzhzd0RtM0N6c3FZcXlFdnJiL2JzT3VT?=
 =?utf-8?B?UTQyL1hpSklLMVRlNnF0SkIyTGlEWUhRaWc3Ynh3MTlJZnNiWGNBYWVWdWRC?=
 =?utf-8?B?OFZwQitHZWJUMHQ5WDNRTE40ajFCME5zb2dFdXJmSE84RkZRUWJDSTN4NFV4?=
 =?utf-8?B?Um0wazZqWldwdGVNRSthNUxRRittZGNVRk9iT1F6SThsTEVZMFh2RmYvaGRl?=
 =?utf-8?B?bmNvZGd5N2x6NzlnRzVyYzlJSWdUSzIycDJPOElwWGhvOVA3Z0NNV2lmemRW?=
 =?utf-8?B?TWg0NGZBcHBjVERveGpadjQ3WUpnMjN4ZTV2Y2J2cjlsekR5MkNIL3JpZ1VZ?=
 =?utf-8?B?VGQxbFRnUTZkc05MUWVXNTB3cEJmVEtyRTlWM241UGUrWmRWWHQwT0lEaW9K?=
 =?utf-8?B?dXpxcGtUT0o4MnBjSXQ1Z0FWZS9wYWRLZ3EyRlBwQ2J4c1VOTnZhQm51cWUx?=
 =?utf-8?B?WmR2RXFTQ1A4MnZkLzBwYy92VkpBNGxBM3dmRXEvWFJWMGpQMkhrMzRNM3lW?=
 =?utf-8?B?elF0bnFJR2c0bWlIY2xFdlVZUzZCbFRIQWNqanVPbFJHeFFlcG13c2FkZFpC?=
 =?utf-8?B?NjZLaGgyWXdzMnFoMUwxNUhvbVdPL2ZoMlowTmFjb0ZOcWRFUzRKU0p6c0wz?=
 =?utf-8?B?bjBuQ3YxditSUVJmWlAwTjgvUis3Y1hzb2RMd0pCb1F1ZGI3M0tya0lyNnJl?=
 =?utf-8?B?QWZXVlMrZVBJeHpLQ282V1NIRVBSekxTYXdUdDdoaHNaOEpCaXEyNFpRRit5?=
 =?utf-8?B?YkFjWE10N0RkMTI0VXhUZ3pzUXcrNWJvemx3L0lpdHB2RWJ0cmhBVWc2OUJn?=
 =?utf-8?B?VGJpTUZtMFZ0c1R5UC9nekljMksyYkdjOVpLRkQrVURUQWkwQXM5Y1VMNHNL?=
 =?utf-8?B?ZGs5RlU5QWNCekdJanZwY2x5UWE3U2FyYVprNHc2TGl0WEJ6dklmRFB6Nzc3?=
 =?utf-8?B?UVY3T0ZDbm9RRUZDdWFXbjJuZmFnRzFQT3d5Y25Memx2YVpORFBlRnIwaklW?=
 =?utf-8?B?azFpQVRxNXEwSE9Gb3h2S0dtbktONDkxNlRTd3lJc3FQUlRmZk10b0tQY2pQ?=
 =?utf-8?B?UjlGQThHMVJBaFNzYUM2bVlKb1F0Q2h6cXptaUwzY1VXdmluT3g3Zk4yVHNL?=
 =?utf-8?B?UldqTXBIdHFkRE5TaHp6bnNqT0tVWHY5Ykd1MmgzR1JSWUNnb1NIQkpSdnAy?=
 =?utf-8?B?R0kyN2lGVlNmUDFobEwyTjFhSU10T0E1aVIzRGFWbnd4a3VVa1BlblFkQXph?=
 =?utf-8?B?MkQwN1ZONlE0RmZ0NnVya0xWakdEdEZ6VFlmT2hzU2tHbXZZMndtMmlWVlVR?=
 =?utf-8?B?N0NubEFWOWVXNmIzUFIrdUFPTjJFbTVnaVRNa21kNjRqaXZLbmhHTXJ1QTU4?=
 =?utf-8?B?Y0xCa2UyVE9HczdJT01WSHBuemkxZFhKN0k2SnZxUU4ycjloTDRiUTNjZThE?=
 =?utf-8?B?a1RLVFRmM3AwaTk0UGJTZWlZVzB0end5d21zU1MzTXA0aWVuVGMrNU51ZjFL?=
 =?utf-8?B?N0hGRVFhbmRRTEFiUDZvSkxRTGVCc0d1QjI1OU1pMkFjdDh2L2p3Tng3MjZD?=
 =?utf-8?B?Zldmd09HTUpWdXhnRktvVkdxM3VUaW12S1ArSGtRT25Jc2NMQVBVRmt0ZVIr?=
 =?utf-8?B?WFIzUHRzQkVPekZ4b3hnWE5ZeER0a3BtS1pNUGdIWFdodjcvS2xXb0pDaHA1?=
 =?utf-8?B?bkowaytCc1FVQ0t3a0h5RnorM2xhZWk2MUdsb0M4SUJPK2I5a0tiV1kremZx?=
 =?utf-8?B?aE5YV1dsZlg0YThLSzQ2WExDMGw4Y3V2UW9zcERqRkdlS3NsdUgrY29kQWpy?=
 =?utf-8?B?b2J3MEo3RU5yUGpsRXlySEIzY2Z5UEdOdkVIZFlsUkdtNUcvWHEvbExISU9j?=
 =?utf-8?B?NW1GT2RpYVhhOTJtc3BSYndIaFhRdmhJeTRnUGY5KzV6dTllczd2SllxZEJu?=
 =?utf-8?B?bXlpNGN3UjNCeTFLSUw2SFlWbURGcmVMNS9LUlVZTVBNY3BtbkIzR3dQV3J6?=
 =?utf-8?B?NEUzaC92UXg1UFo4VHBvTDVUbDU3ZjBMN2J0L3MwRDZyWnRLWXVYOUZKaVFx?=
 =?utf-8?Q?IqidcruMEj8Ii0O6rYRXVnCzY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b416610-9fa6-45ca-9195-08db08e0a34b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 07:55:11.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdPo8KPJHBJ7LSyuJ851dVl/caQVzcUh3KFO7sS54nOfr4bZOPYn0PHc00qecJ342dEEDhYvaBRMePD1Ewl5dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562

On 06.02.2023 22:23, Stefano Stabellini wrote:
> On Mon, 6 Feb 2023, Jan Beulich wrote:
>> On 03.02.2023 20:55, Stefano Stabellini wrote:
>>> On Fri, 3 Feb 2023, Luca Fancellu wrote:
>>>> And then, if the file is not subject to backport and now we “own” the file, there is no more the need to list it
>>>> in the external file, a commit search can reveal when it was converted to Xen codestyle and removed from
>>>> the external file list so we don’t lose the history.
>>>
>>> Yes, I agree. If a file is coverted to Xen coding style and follows
>>> MISRA rules, then there is no need to list the file in
>>> docs/misra/external-files.json.
>>>
>>>
>>>> So we would end up excluding just all the file listed in external-file.json by the analysis.
>>>
>>> Right, I think so too
>>
>> Personally I think this is too focused on Misra.
> 
> We are trying to do two things at once:
> 1) list of external files with their management info (backports, origin, etc.)
> 2) list of files and paths to exclude from MISRA checking
> 
> From this discussion it became clear that 1) and 2) are very different,
> have different requirements, and different info attached. In fact, the
> two lists of files and paths don't even match: not all external files
> exclude MISRA checking and some non-external files also exclude MISRA
> checking.
> 
> I suggest we go forward with a MISRA-only exclude list with files and
> paths to exclude from automatic checking, and without any implication
> about external files. The list could be a json file called
> "misra-exclude.json" to avoid any doubts.

That would be fine with me. Such a file could then include a justification
for each exclusion right away.

Jan

