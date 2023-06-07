Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E3725B5A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544657.850579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qCB-0001pq-Ns; Wed, 07 Jun 2023 10:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544657.850579; Wed, 07 Jun 2023 10:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qCB-0001oB-Kb; Wed, 07 Jun 2023 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 544657;
 Wed, 07 Jun 2023 10:15:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6qCA-0001o5-8D
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:15:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 301815bc-051c-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 12:15:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7536.eurprd04.prod.outlook.com (2603:10a6:102:e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 10:15:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:15:09 +0000
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
X-Inumbo-ID: 301815bc-051c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhoTfTnlGWWkmwhJo60WVUsT0H3ztTG7Z8sCvRbEqr47bEwoJJ2oSdFGTv/rk0rJvLf9xqMAxiiPonxod9scYXPg3mPt9rZEDA9S7mPt9fuLwAkrgCW+VmJspYnKbC9bBeDMuDvctOGDUFq4UVRswb8cCmnTzZb3RZnVnz4zgPxchMJ1RonHhfhigh+1Qn+nPMB9KJ4/EcbAvKMZe+QxpvEuPliWqdnrDs8Vsa87xQwo66cbsP22jnhZyn1SDmZVqF8Oyq1D97+Ic/+SRUZniXLUQGGG9dttFAkXmKPKNmw3M0Hdw2YKiUwrhpP802RtYL8e+c1Z+ah73aj7f9ThxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aJz+t2PSCbEWj5gihmkCGP/+VySLxHHiBzb94h11JU=;
 b=fTD4RDgTpox+sw1XoBApbsIQ8VbQbEFsdUjOVFSS1kIabMF0RMrdMIZjvEUQf9aypqeefUcYAuW8/8pCUFXMox6kjJuVVv6Yk5eWvxKUF5zI2XDeWKFtUHR2SYNTVLo2vi8wLuZvWiOEZmPdAfIdLkXmCyHOtxOhkDvwQuLLZq6kRzgMkt04KQ6yGAm/01MSuX55MQsoZdOle//w5rJ+RsQkpvmIu79MVCmcJDhfpHuv37wCr1WGUG2DigbWnD1l1l8Z/mrPtFyBqq914Fy7mLgLmvXqA8xKB92Bf1VD7cuAz5LIYNtV22HLf94ZZvHRXipYa74pq45J3z37PTXJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aJz+t2PSCbEWj5gihmkCGP/+VySLxHHiBzb94h11JU=;
 b=n6dH9hKsAggkWceWStVjDl2vW0ZwV6cgWitA4Wcze020U+C2VxSmWr/WyxrgRJXc0QbpegLrMqlaHHj5GWOymnqFem6PQ71lPtLpNT52xY5uucrBmKELSmMaTmWkXl0zIeiKz0RwInVsSn84ztgyOQaUYBMb+2+0mOUyEqg5dyPu/gdMEiVrsJNbaPzZcbRv83kBmhoL8vQBjbjKbukR629LBwRSpLplBOfE6xhwNdeP7lpO9zIpeX3/ZJ9I6kDB7KtxeUdu1R6TOTXyPpKqkCPxiH3bHE/1xugHtclc8csigySihDEw80eL3J5AMW7MMSosg0D1/gPighqze9NNHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60fd188c-ba17-d34c-0a97-37f8e807a8fd@suse.com>
Date: Wed, 7 Jun 2023 12:15:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230607090120.49597-1-roger.pau@citrix.com>
 <d8048c61-4b81-0527-444e-fdf6f38ccb3b@suse.com>
 <ZIBLOYiAFE8gqUY0@Air-de-Roger>
 <d2b5c125-3086-d66d-cd29-e7c31002a3c8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d2b5c125-3086-d66d-cd29-e7c31002a3c8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: f10fc15b-51a9-4e52-f1b4-08db674012d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iCKlCItlzoTuqj2TTj0skrYCd3hREjsApJlDc2sURZ73eIjKJ2dcbqFKhBHt4XmEFTohpxXWgmAwsoSFqTLggVskU5RdthdI3GCmBXKx88IMuMDBhY9FtXVzKLC3bi0Je/5I1UFeLhSwZBX98eAM7A/uh5a74IRGygzVhDGKkMV0H1/ZgSvIHbR4j2h18dvCte2/W5Puyh5qcJeVA9wfJOHceB9hnyF1Do0BZXwinwhELGvOFknfzobaCUKkkOXtYSrKOKXMmUviae2Xnipb1YuJBrdUz/BtulV944WYhw4jLoiAzSpf23OTnrG+f6iHa1f6KiHGnAUpdsR9P5y6/V9PsDceui4jfFe4CXYXDvO6M4YLM3+gGsHhxmUz6ngQCxgBhuxtVUge2nXquNXdxpLLYmvTeBbcXVTAHhd/VwOyKDcBv5h+qfDBFhRlsc7rBg9lJQ26weRo1MDqMTSZCa8lspBKqqUIeH0HBFQdgfsGCVZ80nnlFHPS9vGecEw3l1VYkEyDclPqvizVRPCRgnTmi/2deSIoO3WkE0oOkEvqDM5MioIvYTZp+8+joHkVYkb8NpvBckbXciwpTJ8x6zHId4iWT63SVtofkxbIdz26kfv93QD3+NGkZtfNJTz09ePD5hy+kfHWNfISwMzktg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(478600001)(54906003)(6486002)(8676002)(8936002)(4326008)(66476007)(316002)(66556008)(66946007)(31696002)(6916009)(5660300002)(41300700001)(38100700002)(86362001)(36756003)(2906002)(6512007)(26005)(186003)(6506007)(31686004)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1lWU0Z0VGNDbXFIUzB1bWFXekxmZlNMOFdmNTM2M3lGdGx3eTJWMVZkbEJC?=
 =?utf-8?B?YkRFVjFVSEdVNW91c015V3BRUGlubUxUN0dNMUw0UDFBcWU0Q3k5UjBKRlZn?=
 =?utf-8?B?SlFmSXVRa0JkcHVFeDBzTlZua0NSQU93aFFRUHl6dmNnNGJBd1ZXNzhpRms2?=
 =?utf-8?B?WlpUV1pKc21IaFdXRzJ3QkNJOStjVTVWM1ZHYnNKV0k3UmZMbXNmbGczK3lV?=
 =?utf-8?B?ZjYwWnZsQXBBTVZEZzdobXdaSjgxZGYyemtEK1NXamJpVVZ4ZGhPcDlYVVVW?=
 =?utf-8?B?ZEhzKzBEL1NMbHo3YldnYllFaVhQR3BwNlJUSFI1bTdlc3hKR004TnRpc0dY?=
 =?utf-8?B?N29pTWlUeS95QW1EVllXL3MzcE5PRW5TUUpmYUdOb3lSMlplbWJMMzc2S2RE?=
 =?utf-8?B?Z1hMTDJoczZ2b0hrY090VW5URVl1WG1mMW5kdTZGV1poV081TStFVStzdHFP?=
 =?utf-8?B?M3RBdXoxUFY2T2txb2R1QUM3QWJtaGpDNmtkVE1YbkFpWTJROWd3QTMyczhH?=
 =?utf-8?B?NnFPQ3RWT3ExRTk4Sjc2d2lpb2I0Snh1RFVmWC85NTVpOTRnWkY5Q2JHVG0x?=
 =?utf-8?B?a1o3ayt3dklpM0pVbDVYWTBFWlZlZHBETnFQNGxTKzN2TVBCdVU4M2owazBY?=
 =?utf-8?B?YUsyMXc3UUQ2ZVZYSmcrdWtLWThEQ2lTZGNPMytvaE5LVk00cGU4MEtRUlMr?=
 =?utf-8?B?Wm55UWhsbnN6NGcrS21SazY3THRmYmxZN0JNUkh0SU5LOW5jaXVMc01BL3VL?=
 =?utf-8?B?bmg4dU0wSnI5SnJubjZFRDRhK2UxZVlTTUFFbGxYd1FPOGdPUWpxcE1sckIw?=
 =?utf-8?B?SmUrbk5CYk5aSmt5Nzhhb0hEbVF3QUcwaFhSL0NHZGRXRE91VC8rbDlkcGFN?=
 =?utf-8?B?ZDFxMkFDU0E3aFNtbmRZVUJVNGZxeXJrMklJV1o3d2dRcTV1OU9IQ1RqT2Nt?=
 =?utf-8?B?ZDVTYzZiSVZKLzAzYVA0b1NZTnk3Vll1MThzWndZbUVNeGlhNEs1b2xDM0p4?=
 =?utf-8?B?dEE1eGxXdDBoMEJKV25ZUWZRcCs4ZDZCZmhwRG80aXJjVXJ2U25qTTNlK3pQ?=
 =?utf-8?B?UWZ5TERuL0d3RTFPTEdLdEF6bmc1NXkwb1BZKzFFc1ZWVU1uQXFRbWFkd05M?=
 =?utf-8?B?OUc1bzVDclV5TUZRTndkQkpYdUxVNTFONTZuSlNRVW9HVXd0YmlCQm8rWFRB?=
 =?utf-8?B?K3E4WDNINHdJNjZrNW8rUDhyeW1UdmczRWFHRE5CdzhIdmJBb042ODFoSjhM?=
 =?utf-8?B?VUtCL3FORkhBSVQ5SnBLcnpCWmE4NDhhaDBuTjNVS3ErSUxMVHM3WDNmM0lE?=
 =?utf-8?B?MjllRXh3R0JnYWVValB3WlR1cjJpcjVWZDdFZVRuZzZFaHJkZi9ZTGo0SzVm?=
 =?utf-8?B?ZFNMSE9oYklqdVNBUzlqY3ZVdmJpK2V1R3Voa0NwN01abmFVS3I0SVVQL1FL?=
 =?utf-8?B?dnRzYVFHamljVUVjL2ExMWlHSFpOdE0wSkF5QmZXcndzVVlMaHpacUs5WmVE?=
 =?utf-8?B?Y2RueDhETVVuY1dNMHR6OEU1MVQxN2NFT2Rqb2YwbVB0emtodUpjYmxmQzll?=
 =?utf-8?B?VzVwYnRwcDM2TWIxcEtFbk81dFBveGZxUG9Rd21BbmF0ZmNJbS9xNDVRdm91?=
 =?utf-8?B?QWsxdW4rWjFQVXdpR2JaK2pzSVBMYTY1S29HdjRldlArbmJHWWtKVGx4aWNJ?=
 =?utf-8?B?T3F3OHJTZzRhYWdGRlJNWGtHTU5UWlJHb2NLT1kza1hpcTgzVlhNV1NPWkFp?=
 =?utf-8?B?VDFKVmRtRnRIYjU5R2NnQmNXSTY5ZEE3UXNoV1krMkRHeUowWEpsUnJ6b2dq?=
 =?utf-8?B?bjUwSnc3dlRmOThneGxlZ21KQlRqMFRXaUd6OERlZ0ZTYmtESVVyTkdkam5s?=
 =?utf-8?B?Vlc2RkV6ZU9NWC9YdG9KcmQ2YkpUbHM3SEVKVFBieUx2RFZWZmZybEYzMzkv?=
 =?utf-8?B?SFV1QUFqVytUbnhJVy9tVk5QSHgzV1A2MkFzT0pZTHdaU1AvTEpQVDYxQ0ox?=
 =?utf-8?B?TmkyMFUxUHdsaG1XcnlIekUreStIKzB2aWk0QzR3YzRIdTh5Z1VNSkttUkc4?=
 =?utf-8?B?U0hCZ3g0MkNmeERkU0JpQkNKNmhxNDFlR1k2TWMyWmNEN3AxM3pyMVR2N3oz?=
 =?utf-8?Q?MYGuArQhhWryZnhytEdZroGp9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10fc15b-51a9-4e52-f1b4-08db674012d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:15:09.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvkqUwt4s9iKwEekn4ufj2EFpkCPqK1m9CfZwNWkFJ28qMM4tD9ndL49DiXuipJEw865vtxG/UA4zsYay7kcHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7536

On 07.06.2023 11:19, Andrew Cooper wrote:
> On 07/06/2023 10:17 am, Roger Pau Monné wrote:
>> On Wed, Jun 07, 2023 at 11:10:27AM +0200, Jan Beulich wrote:
>>> On 07.06.2023 11:01, Roger Pau Monne wrote:
>>>> Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
>>>> using _apply_alternatives().
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> albeit the implicit ack therein is only on the assumption that (apart
>>> from me) it is generally deemed better ...
>>>
>>>> --- a/xen/arch/x86/alternative.c
>>>> +++ b/xen/arch/x86/alternative.c
>>>> @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>>>      }
>>>>  }
>>>>  
>>>> -void init_or_livepatch apply_alternatives(struct alt_instr *start,
>>>> -                                          struct alt_instr *end)
>>>> +#ifdef CONFIG_LIVEPATCH
>>> ... to have the #ifdef than the init_or_livepatch attribute.
>> But the init_or_livepatch attribute doesn't remove the function when
>> !CONFIG_LIVEPATCH, so it's not a replacement for the ifdef.
>>
>> IOW: it's my understanding that the purpose of init_or_livepatch is to
>> add the __init attribute if livepatch is not enabled, but
>> apply_alternatives() should never have the __init attribute because
>> it's solely used by livepatch, it's not used at boot.
> 
> For context, Jan you missed the MISRA call yesterday where this was
> identified as an emitted-but-undeferenced function.

Ah, this helps.

Thanks, Jan

