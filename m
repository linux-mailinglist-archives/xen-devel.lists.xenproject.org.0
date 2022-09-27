Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0E5EC89A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412806.656265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCt9-0005tY-BV; Tue, 27 Sep 2022 15:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412806.656265; Tue, 27 Sep 2022 15:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCt9-0005rM-8n; Tue, 27 Sep 2022 15:52:51 +0000
Received: by outflank-mailman (input) for mailman id 412806;
 Tue, 27 Sep 2022 15:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odCt7-0005qr-OS
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:52:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f751e2f-3e7c-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 17:52:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6828.eurprd04.prod.outlook.com (2603:10a6:10:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 15:52:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:52:46 +0000
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
X-Inumbo-ID: 6f751e2f-3e7c-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBOgL9NA2skWMIkbHkaK3WC9jA0jsKEorr0Axzh5leTVzlvnhQEMQ7CBrC30LvDEVZ7YA34u8AD80UTVW0dRMUkhFCOF0NQY9/PwCgpWToY/kbbikgY7SUnUkAASS0YQg6/88LtP1UN1/+zOonTZ72pNywEDFWjbYw8LrVEfa7rqiwMFJxhJVF40If9iwWtRvL65W48Al10wbbV7oQizxg3AIotnyz9OXdUaFQR6JQ1vhl7tCwffr3w3hRBrXtrZXQP78HQvzE2rxTtX+8u8xOEiNA25c1Q/lwwdff9mL3y3eDkOoQjxLd5mhhGCNE6AV/N2+vhIJK6MhN0ESy1dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peLxow+fyZZz86PyCAEs4UsoiHFSpvnKnCocSF6eHIE=;
 b=WGPSzq9UXWFxy2DzzQPCo7JXGmQzsLm0xysCs1BagzVT510tjZViyNxalj2Nq86Xqor1B2vYwq6gIi8yRxrpU4wMMWP026md+C5QHwOfNkU/vQAjJXAAiGPyHJfN+JuOJV0FqL+L5kYyLuff9zaTpJD6Njt7oMGSftoXZ2rSBI1zccjuYbm+/AluflXQ/l+WIjFFgCCEYbfu1pnwBSD3wOt5ufImSMJNwQt5782KWazOK+yPDQF973d/IhPvG9PlTyiBMJ85szH0aOyaj7I7+pwxYcXxo38DauoM1Fcauh8rb1hz9xULGWMmVrYlTuF6iuhqmdjl6fw6G+xq6Wbt1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peLxow+fyZZz86PyCAEs4UsoiHFSpvnKnCocSF6eHIE=;
 b=hxpBIMBYq0Tw/fI78L7r8KUzX6/BQ89QUnXQq2SGX0K6k6SxWgxCP78LsAI75aRi6cWTcVZXsKExrLDrST51JSSO4t7gOtTzkApMkXqaMzayR1iOij8PCrn9cTM9jQu2r3HDPtyLottGN8MZJcR1jaJ4bIubuvbH8+MdqzwqUcsBg9FKKsENdvl7hidWNqzzRZkTZXR1GipbD+uTpGdG5sNDza169jaoVBYBVE0iICFJHktkuH+sN0lL7a1p80V71eYhJGqXV6yZI9D3pv9UrHlL60YN1GZy1LCIBQ0pZtVVATD9+hurNwOOdVpqMMRylFODnrRG8FAb+7DbXT83TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d8cc77d-073b-1de4-1ccf-43427529e470@suse.com>
Date: Tue, 27 Sep 2022 17:52:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] Build: Drop -no-pie from EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220927154708.15787-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220927154708.15787-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ccc30eb-3de3-4baa-f8aa-08daa0a05242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QB6D3ZxLjZz7EjohGbn6nhRmAQPKmKBTpTCPEDLpH8Wgq+gGYdIM0RpshedJ8j2N7Xjp0VJn2rXTBy5jyjObp9FXmEVZ0Q6qBoz5Tu3QlQSMVPYjvk9R4o9aZGpqhqJrGioQ5pZkCna74GJkuTKxNOil0jgqQAHIs1C+5tAq2hETl9Mxdzwd5Fcu8P+uRI325kdxe1xhVDDvlyHry3TqlJyJqJUSAvk4IwHyHBzGQrbie6+eLb7fhn1hOe5Rez58Xj7bxupmRT7ejToMmb8bOxveLygPz0JX6yCFvuE0Xejp3gondTpvd/faOhzOmdHgkYf3SFFz5XeFriHvB7H2/tsjJ5m2NNmlHFdf31vtCV2Br94vPCVAKyDtnjyeZNh3749jkapzABt4ONVKvZRJcV9v3rIsCB861WrwnvIfWhKRgcuwEgwhIwR5gQocSTeCn9pFw22Vwk/9AUeQ31YAKahl+2riQ/KpqjYh0MmAbnpMUECukwl8v/Zvf4ChT02muUtPo/1bN8AIj7kihz/IBz7lpgweKyztcbclGeEVpxQEThOIBPYWId2TMqNjzjAxUKzDMt3BXXgm2wOgx7NEjA5QZ5PNAjPBiK4D2FV9+oMB/bqkxoOneg8z33T6/9Wf05xVdaLpIiv2fJyfVMc9Ia0bR4UorQeKwYi++9BksHS9IG0H4jvcdAeLJoWmy6mi+p6dWiJwvJF0Z5PgQ+30xaZznZgPoRrvO5rfhge0P8YoW7tX/yHfnVOgpXfoisHdn2ZN6yxcChe4e8cg6r1krZzBu7UyHSbJPDVhDEeMLPc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(41300700001)(478600001)(6486002)(8676002)(2906002)(5660300002)(4744005)(31696002)(86362001)(36756003)(316002)(4326008)(54906003)(6916009)(8936002)(66476007)(66556008)(66946007)(186003)(31686004)(83380400001)(6512007)(26005)(38100700002)(6506007)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWNtSUpoTmh0Q3MrQmgrM2EvamVrUWY5a1I4TEl5cTlKVW9ud2dXTDVydG9m?=
 =?utf-8?B?b0lKZk1pcm5Ma2pmUitnclVPLzYxZjVjWWZWRmRTUDNNYmU4Z0FNblBkVW83?=
 =?utf-8?B?VXczUnY4YnN6UjNYQmdlUmQ0UE1VMk5lUXVWUGxKM0hmRnNxQVdFM0Jtdm50?=
 =?utf-8?B?N1hadSs5V0lJQVlHNTQ3aXJkcW01QVRJaFRjcmovRlNLa21hcTdaV045cTFN?=
 =?utf-8?B?cEFBUU9FdnlvUW9GcEVmQmJScjl0dEtFWlA1alFPc3g1UWl3VkRxaFpXMXF4?=
 =?utf-8?B?dHJtaXlGdjhlVHQxSUFjNGRBcURrSlZzUEFnajRtN2l5elBVVGJ6U1pNYWRS?=
 =?utf-8?B?MUNHaGtHdHdyVjVkQW11Qmt4dW5KSis4U2NkNGhmbi91VzVHUHFNWVduR2ZP?=
 =?utf-8?B?UWkzN1I3MVdSeENadXdDN0p3RFpBMEdZdTQrdWVJRGpkMXVDOEc2V1JuZnJW?=
 =?utf-8?B?aGpOYjBaK0NSNmNOM2d4MzBsVDllSU1Xc2ZyVXl2bXBSaXF2SHpvaGw1d0pN?=
 =?utf-8?B?cGZjZHh1a25JL1NnRkJIN3VhQ2VtVXZUMHNIYlczR3NUeGpoNFNhc21LT3lL?=
 =?utf-8?B?aUxtanBrTTZnYVAxNlZ2bXZjNzlLMElETnk4eHdDL3lwdnJ1RHFEendadlVZ?=
 =?utf-8?B?WTJEYkRmcHdGS1BFeWpqK2NmdTlHK1Y1dTNwT1RoR0VEeGZMY20zSDQ4SnZR?=
 =?utf-8?B?OXlES3BvWmNOSnI5L2FlN296NjF5VmhCUWxZVFBnejdEcEM2WEVtdXIvdHhU?=
 =?utf-8?B?RmxWYXMvZkhJbzBRVHM0dVBQRSszQmI2dk1OZ3RjZTFyb1VObUZOWko5My9H?=
 =?utf-8?B?TlBndkh3OUthdUxsZWtNVy9WZjM5c0dWYW43cE9relRMaUtmcHBjalptTmRp?=
 =?utf-8?B?VXJZVFBUV0N3enlMeFRlTkU3REJKa0RJMzlxOEJXNk5aVjJmVThrNStacEFX?=
 =?utf-8?B?MWNWalhTZy95U00zRzlxUGJUM2N2UEdsTGVUOTgxOFAwaVQ1bUVVQUh5bG4w?=
 =?utf-8?B?a2lzNm0yS1hvOXJWRm45aDY1TWR4YjdjdEZISzBYWEthSmd6WG5zcG94NHVv?=
 =?utf-8?B?eURrR05FQ0hua3E3UTV5UzI0eXU2MVhHNzBFTVF0ai9SdDEvZmthcjRNZlNx?=
 =?utf-8?B?dzV3VHpCa0p2TFFmRGdac3lpa0d3TkIrSW1OV2xZMXJhVFYrZGVPaUEzSSt3?=
 =?utf-8?B?VUZPZThjVmZUS0h5MUZwOXdNbUdCQmdLNVd2T0t4SzljOTZWMUJTWEdpRkcv?=
 =?utf-8?B?UDMxSUx3a0puRTk4Mm9XamFNeTE0VEtiRHFDeEs0bzJITTh2NWlvVGRSM2hr?=
 =?utf-8?B?TGtiMnJaa0pWTkVkakM1bmgrSkg5NXEramluSWJGcTlwMzRhd2hhclVoS2Rt?=
 =?utf-8?B?WW4xcU5WK3lTNVlBOWpIc0d6MEVBWkJkVWlQOUgrZWJ1aXV5L3RQS2lRdDlW?=
 =?utf-8?B?RUYveVE3MGFNeGN0NVJPakp6UWs5TXBrSi9WOHhkL3QvdXgrdHJpcDFLTGpP?=
 =?utf-8?B?TEF4dHA2aFpIYlJET2p0NVB6ZnZHNUcxSFBvbit6NHdrVVZIbkEvQzhybEFv?=
 =?utf-8?B?bkNCaHVKQ1VMRVhhZkUvMlJ5bUhtanpUVUlsWXZ4dkZsT3M4bFNVNXdnNkNF?=
 =?utf-8?B?ZXFqa0x3RmFWQWI5MGNDRDhCUjdaMjJxVU9Rbzg1WHRaUmVuQzliKzBtdlRV?=
 =?utf-8?B?bEl0VmhaVTg2a3g4NTNTVXJvL0N5dTNkbFFxWERmVlVsek9VdzFNc3FUWG43?=
 =?utf-8?B?MFl6Tys3TExxVW82aDgvMnpES1R1ZnhYYmlVUk5KV2lqbktjVHdRRE4zdGIx?=
 =?utf-8?B?bFRCT1FEZXpNLy9KdEV4QlVVand4c2RWVDNRV2NiUTlpa3BiclNpakhmaVhC?=
 =?utf-8?B?c0pLYmFmOEk1cno5dnNCSXVGNVE3dFFqd3dKOHRsOWNBQzdLbUVTbyttYnZl?=
 =?utf-8?B?L1lYay94QnkrUSs3bkJ6bEpDUnJVS1VJSWxuWW5rSVNDQ2E3TnpLVkdnY0VH?=
 =?utf-8?B?SXQ0em5mY0ZMa1JISjM4RWNZdkdJalBZcG5nOWwzL21hRnhMRDZzOEoyM0VT?=
 =?utf-8?B?ZVUyRTRreVJEalZPRzE1ODRKRHVpTzAyYzBmL202MkNKQzJYMHc0cXcxSnYx?=
 =?utf-8?Q?GwNOicWjkplw/9HYbtDL5RRP9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccc30eb-3de3-4baa-f8aa-08daa0a05242
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:52:46.3084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjFzj4/f2JPuA9QI04yUoenLA27kyH7QDlbDOK+r4rpToOSZZWdE54TfzvtkQ6fiBW6YOYoNPrD7J+HgZyd4kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6828

On 27.09.2022 17:47, Andrew Cooper wrote:
> This breaks all Clang builds, as demostrated by Gitlab CI.
> 
> Contrary to the description in ecd6b9759919, -no-pie is not even an option
> passed to the linker.  GCC's actual behaviour is to inhibit the passing of
> -pie to the linker, as well as selecting different cr0 artefacts to be linked.
> 
> EMBEDDED_EXTRA_CFLAGS is not used for $(CC)-doing-linking, and not liable to
> gain such a usecase.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")

Acked-by: Jan Beulich <jbeulich@suse.com>

Perhaps the Reported-by: Stefano should be kept, even if you noticed
the issue as well?

I would have preferred a mention of the questionable origin of the
earlier misspelled -nopie, but I guess I'm not going to insist.

Jan

