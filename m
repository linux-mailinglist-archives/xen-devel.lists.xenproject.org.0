Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38B58A5D3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 08:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380817.615199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJqbx-0004Yl-5Y; Fri, 05 Aug 2022 06:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380817.615199; Fri, 05 Aug 2022 06:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJqbx-0004Wy-2F; Fri, 05 Aug 2022 06:15:05 +0000
Received: by outflank-mailman (input) for mailman id 380817;
 Fri, 05 Aug 2022 06:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJqbv-0004Wq-Jt
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 06:15:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f07b26fa-1485-11ed-bd2d-47488cf2e6aa;
 Fri, 05 Aug 2022 08:15:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5621.eurprd04.prod.outlook.com (2603:10a6:20b:a6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 06:14:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 06:14:59 +0000
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
X-Inumbo-ID: f07b26fa-1485-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iREtbcRzU1AonluszoaraA7NqE6J1XtTCtxcUE+X19pwVmgvEIbaTs/yad68QOaZyBqskIKJ454YaEIsBN8YJGwok0GqzH3TgDRAncbY765dwo6nUueCAmMakV4ClekFUzZVvt9ozS3o5mnc0f/g15Fsn19uUqSdbODyc2p7+5FI035YjDZNORAefa0R4yAiMa3Lp+0OFQDRCjvTYloRv4jSMa7d3hkICvqlUsQWc5zw4pzSG/QFnQcHyEygMq6OqnPtJ2uryAklZQfTM42iyrpr9RogROxM6PkgYGKp8syU2BanqMOJmkrIs3RctZ4G7GzIdqlNX4b5qJX2W2KWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGH1TWAhCev18qr25KY0QCoCiXKkcHEAoVKC2XCVGQo=;
 b=eLyOnbLP6lXyXKU3t9bBdaPUaBtwL7ytsR/1uze4tmKFyz/ZGhUeBAWcJJu4fCjSoVbZ+fkf+HuTarZpx0/e3E6t45njqfdn293tA+5E79uYO5uFJycXHaYWFVEov1RYk/2ZclSVEA28dFoA9mzRDuRallnOwri5fShA6LLNdFddHfO7X2BI6f87hfQFL0QLGTrqogMM6n9/96tIbVud3/VMwfK8cdXBCyw5+O4VUyP6IM7VBlmT//wOkmMEscLDWyICeYbJk2jguVHIlSvQ3NYamd+Jc1ujb3Mcctvj/9FKrh3vaLY4eu7HDsoYQ0jlc0Y33VHqRgUUdC6yKwLbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGH1TWAhCev18qr25KY0QCoCiXKkcHEAoVKC2XCVGQo=;
 b=iH3UdxqU45+sk8NYOiNZ8v7Rw5OjiIgeTRDyctEj53Nc7YQ+jPmr7Zh0b1IQdo/rD+dpHrXi2XFERO3Tb4wgWwE7yiD98xTqx2A6hSQjFm2wprA6Fet3/ox/mOpHaEzVIJqVW/QOoLD55IrxE7n8XRWrUogO0/EqTqtKpVgSLWRXbL2A+39sQOhtGrMElqaDnb6XHL4XlnswCfaNhmsSLQID6VuigrMZC2GjRaNgEIzllqIYxGZZZ0W4hlHLzXp0k/baAMpTiiPsNv8awZTu2g0fO0VO9FXqOdjT1TlSTK1TShkTZmDvPpQxs4l8bF6RTy8qCDbzS63/l6TjfYGX9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35b1a843-ffe8-0e68-969c-49e0f46ab685@suse.com>
Date: Fri, 5 Aug 2022 08:14:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com> <YuvM7vElH/IdBJjq@mail-itl>
 <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com>
 <6d329731-57ef-2e85-be1c-54102f3dd2b8@suse.com>
In-Reply-To: <6d329731-57ef-2e85-be1c-54102f3dd2b8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 956509d9-d7ef-4b3c-9037-08da76a9d312
X-MS-TrafficTypeDiagnostic: AM6PR04MB5621:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NTzpFRee24nHahsYGLQZvSslba2AhPrTMvFCAuKBPTHGTQC4+n1LppG++jSoGXd3TPow8rQ3ncZJ7yc/ns6Wyjrw8dphXDCcqURhlqbU5f30V4tETW6jtHoDmdjD4COlNVIOu6H/YqE0RaPl10iQVmRj0HQfl2FAyLa5YvJrOav3zljRL11WkQhfLWV5T1CRzK+1HS2uUJBYuozvnkkpoMyzgJN4pPUJqUdTajWMIL/GqnHJg1j+07bgZXswwwKezge6J7TuW3+p361jG0gfA9GcrsVsbLYnj28sDRukYwnG+cNFrIhOJcx6MnTLrP54RTkjY8/qBnnlK1fHatZfKYVB1T4JNZRimTgw/S+s70QZLZBcWfNFOkaGHKKt8SuoK/fGEaRLDi/vF+hSEcqn63qR14OlDzOH6AcufPmYBGEiwKeOMdvc2/XMSKSWFTnMmM1ptcXaMrv1cj0GuOpTm6LU/oU0vC/kbdc/vxOu1XV7zYK1FMDljqap6gO62ii4eohjC4ydnNCEvXnAMyp6s/i+0mv1twS/QFjPtO5aIv4TsbKX5yTWLTU7fMBWOXkL+XU51OWPZI0dfMspS6TLU/M8qkc3F7APLfUSLqyV72yGYTebbQBYp55cvmUmeE7vH21I0IWTyksxWheJDzhJ+f78O7mTjd88s1Y97GVGJm0PqB5BttyjfG0pMwyn5KFxkHseqmm4aLSUarSRP2qpvhVS6iG47u1amT0yTIoaTv0UGBZOQ8JiUJZ49SydYEvU9NDPN2E7aq/rnBGrIADPe3YZfsI8jX38QAqvV9kfyCS8OFNsx95/8SyJ8teh0L0WWa12DSYFq4vtJJA9r6bK5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(136003)(39860400002)(346002)(4326008)(8676002)(5660300002)(66476007)(66946007)(66556008)(316002)(8936002)(2906002)(6916009)(31696002)(86362001)(36756003)(38100700002)(478600001)(6486002)(41300700001)(54906003)(83380400001)(66574015)(53546011)(26005)(6506007)(6512007)(6666004)(186003)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE1JcFJjdEJNQWh4NVZ3eWVLMUFuWkErRktoeTUzVHRCdkZGdTA1eVM4alVJ?=
 =?utf-8?B?c29zcy9Td3RsQVVweWNuUGY5azBjaWNpTFFzNkdFUG1xQ1hMVnpQY2lWSHJB?=
 =?utf-8?B?b056YU52U1diUnpPbjhGdzYzdld3QWxZZ1BDSGcyZTdiRmx5eTFXRXErVmtZ?=
 =?utf-8?B?L2FWa0tlUzlEeEdzNElsZC84N1dUS1NUMHVXZHVYR05yU000U3lnWnBuK2Jm?=
 =?utf-8?B?dmdPRFZ1cThCeGpBdTNjYW90WUkzOEhXMnNtd1lQbm1kY0JHLzRlNzAza0xE?=
 =?utf-8?B?dnExMU5zVU1NN25mUUY1NVFYVEhVK0tmSUlNOWxsT3Zqb0Exa1ZwVjloeVJU?=
 =?utf-8?B?NkxPeVJncmtOVWR5amducHQ1blRNVmRzTFFyWTh2N3A3SXcrS2NzK3dRUTVX?=
 =?utf-8?B?bFpQVE5TUWhPcXdyQUJVdzFDWDloU29aMGhYNEJ5d0UyeXQ3MEhSWVRqeFRw?=
 =?utf-8?B?Zktlc1d3dUJFWC9yRjRZdGdzcHVFbFFUMjdIYTJsbzVRbUptVmRMSTNRNHll?=
 =?utf-8?B?cUxlbWhmK3U5cTB1dThVZldZV3FzSmZNc1FicEh5MlorbWdKeE5zWmNOeUUz?=
 =?utf-8?B?L1gwYzRqRGJBdUlvdkR5YXBNYm9zNVRLYzExS05STjZQc0pXcUtCRjRQelNW?=
 =?utf-8?B?M25FdGNKYjRiK1lvTGxwMGR5MC9HelozaWZtU051V3ZhRDZQMFdtcm1GTVRp?=
 =?utf-8?B?TzlrSkJ1U1IrdWhPVmZjeTlnTFJkcnM0QldpcjdOVXhaVnpnNnNqdlE5VUx1?=
 =?utf-8?B?RkNwSTRoQWJxcS9FSVowWVFJelYxNWVWZmdpUFltSlRxSG05cFdVZnVZK2E5?=
 =?utf-8?B?VDh5VmJMb2lKZ09vZkt6d1hrR1kzUUpqTUE1dHp6RUU2QjVSZmtWVXVaRWtE?=
 =?utf-8?B?Q0Z1VmNiK0FWOE5sdHdmbXNEOFVQei81dlJBdmRYaENTNkUvaHJxSHRkTHRi?=
 =?utf-8?B?ZUxEdmFCSGlQUU5CU1F3eXVLaFRFR0Y5Uy9wOFZnQzh4dnNVWWFSR3pYeTk5?=
 =?utf-8?B?OWMyT0IzLzJvOTFLczFzVmM0cCt1bDNMU00ybWQzT1lwTTBySkdSY0FoWmdy?=
 =?utf-8?B?Yll4ZXorbTBFZzFsazhWZ3Nid3dleUYyS0Z1eXV4OGlMOGFqRzFuQXJ6dUt4?=
 =?utf-8?B?cFl3U2NoemI3U1B2WWdUNGdPRWRzbWxWWmViaXBDclFmVXloU3dZNjBFWUVF?=
 =?utf-8?B?SlZtdWt5UjIyV1MyWklobE4yazkxV0V6eVZVcSszYnZzak14UmltbW1oeWo0?=
 =?utf-8?B?a1ZZWHhEYVY4SVNJOTFjdCttRXJiTGRlUFdEODZ5QnkxMGVPNlBmeXFtSVla?=
 =?utf-8?B?R09SRHo0WXBIUnFEVjF6SzdzdURaMk8wUU5abWZZOW55c1pNU01Wc2ZYYi8z?=
 =?utf-8?B?eWtRc2dBNEZDdlRlK0pwVUJSdWVTNWNMSERjWDIxSHlxYjN6MXdTUHp2eUNN?=
 =?utf-8?B?NWFWQ1dGS1A0L29VTjd6bi9KTDA4WWthUHRhSjZpa2Q3ZXJEb2FieVBSOHFN?=
 =?utf-8?B?TnI4TkJhT2tnU0xWUVlESStDbzByWEdkR21Ra2xxV1AzVGQ0aG9VZFdkQnRK?=
 =?utf-8?B?c3JjdEN3cjRhT1pGU202cDFsUWc5V3FxalhZUzMvNFg3R2N6dnlUTkEvSGpZ?=
 =?utf-8?B?WnpMd2FQcHlpQ2xqVlUycFhoQ0U0OU9OMXJnWGp5L0VodFV6U2cwTTI3VFk0?=
 =?utf-8?B?eFFCWWtuelltRThtYmNZVG81TVNqd2NBeGJwNTRUempBWThpY0ZSYndMeitR?=
 =?utf-8?B?L3ZXdFVtR2dSVnR3ODVGWEVjV0xYbWpkbWdxNE53b3FsVnlFdlphUk1VMG1k?=
 =?utf-8?B?MXIyeVpicXkwQVFITnN6QmlQZGxubk9XQWFvUzNrNTlRVlZ6T1ZTSUt5NzZh?=
 =?utf-8?B?S2lBb2dPYXJEWDBWNEl0dkYrUzJEeTJJQ0RFNDlYdHB2djBzOUZXQmM4dVhU?=
 =?utf-8?B?d2ptYkthVXVpMXF4dHArM2tnMlMzMXY3U3RycHBLMFR6SGNkTXNpa2dKV1Fh?=
 =?utf-8?B?RVN1RVNlNHhzb0duRlFXeTRHRlliWU1PblJzUGk4bFZObjFXdS9ucEpYM3JC?=
 =?utf-8?B?V0pxRUVyc2lXYVdGRVljUjQ1MmZTKy9nQW9ubjI4VnBtaDJvVzNjbSt3bFY2?=
 =?utf-8?Q?9S3qHy/b3jFK6cTI/Sb+6Cp3+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956509d9-d7ef-4b3c-9037-08da76a9d312
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 06:14:59.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HryyLPwqeZ43vsLww2L/0ZL/jIYP6HOosfzPbbkb+GPfH4LUwqkHfXQrcYGNx2H9hBoGnows217cFJvp+8i4eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5621

On 04.08.2022 16:34, Jan Beulich wrote:
> On 04.08.2022 16:21, Jan Beulich wrote:
>> On 04.08.2022 15:43, Marek Marczykowski-Górecki wrote:
>>> On Thu, Aug 04, 2022 at 02:57:49PM +0200, Jan Beulich wrote:
>>>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>>>> +struct dbc {
>>>>> +    struct dbc_reg __iomem *dbc_reg;
>>>>> +    struct xhci_dbc_ctx *dbc_ctx;
>>>>> +    struct xhci_erst_segment *dbc_erst;
>>>>> +    struct xhci_trb_ring dbc_ering;
>>>>> +    struct xhci_trb_ring dbc_oring;
>>>>> +    struct xhci_trb_ring dbc_iring;
>>>>> +    struct dbc_work_ring dbc_owork;
>>>>> +    struct xhci_string_descriptor *dbc_str;
>>>>
>>>> I'm afraid I still don't see why the static page this field is being
>>>> initialized with is necessary. Can't you have a static variable (of
>>>> some struct type) all pre-filled at build time, which you then apply
>>>> virt_to_maddr() to in order to fill the respective dbc_ctx fields?
>>>
>>> I need to keep this structure somewhere DMA-reachable for the device (as
>>> in - included in appropriate IOMMU context). Patch 8/10 is doing it. And
>>> also, patch 8/10 is putting it together with other DMA-reachable
>>> structures (not a separate page on its own). If I'd make it a separate
>>> static variable (not part of that later struct), I'd need to reserve the
>>> whole page for it - to guarantee no unrelated data lives on the same
>>> (DMA-reachable) page.
>>>
>>> As for statically initializing it, if would require the whole
>>> (multi-page DMA-reachable) thing living in .data, not .bss, so a bigger
>>> binary (not a huge concern due to compression, but still). But more
>>> importantly, I don't know how to do it in a readable way, and you have
>>> complained about readability of initializer of this structure in v2.
>>>
>>>> That struct will be quite a bit less than a page's worth in size.
>>>
>>> See above - it cannot share page with unrelated Xen data.
>>
>> I have to admit that I'd see no issue if these lived side by side with
>> e.g. other string literals. The more that the device is supposed to be
>> exposed to Dom0 only anyway, and hence that'll be the only domain able
>> to get at that data.
> 
> Actually: With your plan to expose the device to a DomU, how is that
> going to work without tool stack adjustments? Wouldn't you need to
> prevent in particular HVM/PVH guests from using the GFNs corresponding
> to the MFNs where this Xen data is? The minimal requirement then would
> seem to be an E820 reserved range for the area.

I guess this was rubbish - by mimic-ing RMRRs or their AMD equivalents,
the tool stack ought to be taking care of this already.

Jan

