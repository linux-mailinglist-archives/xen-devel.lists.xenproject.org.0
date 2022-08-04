Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F9589D8B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380457.614616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbvd-0002l3-8B; Thu, 04 Aug 2022 14:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380457.614616; Thu, 04 Aug 2022 14:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbvd-0002ia-5L; Thu, 04 Aug 2022 14:34:25 +0000
Received: by outflank-mailman (input) for mailman id 380457;
 Thu, 04 Aug 2022 14:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJbvb-0002iU-Ka
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:34:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 879b8f03-1402-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 16:34:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 4 Aug
 2022 14:34:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:34:19 +0000
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
X-Inumbo-ID: 879b8f03-1402-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDIUfLtXa5XYutWRmK++kIdppueEHNOVaxQ3mQU3ZLtSuRMkDamNH/244fLdm9xCEVqYykj+y+WG17nodOZNPXFwFnUmhOkjRw1BnN9opvnzEERg7WDp2aeWFH/qEy1siTKXPcTHUlHfe2Te6cf4pnFYdftth66rD3hduykRovdBdhwP0yc8ObXIl/fKd4sWdYVpJvdzprqg/BWl4tF8hxwnAy+/C8R0S+1nCXofJI0In4Gwsp4omEIv6IT9PgL3gNdiGpDQuXsjpxAeBpCGgHHl7wl8GR+B7SZwEKTw+7wcFCS2tlF7b5qS80u/zhM3J7dIloiAuvnAq/XXLT2wkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBKNv4TeIUIRAFsvv8RQxYpNGMMnH/e31aD4GbXSn8Q=;
 b=ba/LCv10Xdj6/HJTISr1QCtBLshGks38uvFL7UKLR30q6L/oKucHC2OeB4Qds3y2DdNwjNaq4FEYhoWU4EeuCfhWDza84Aqo3rx5tMA3aTvWUr/uwIJBwO9d9E7LaYHroQ2fqqTA8SjUnGVnoOuTWn/I/WU2a8UcyB3S2FS+9KdfKO6Np+IyQm7NpsyUV8djCoEeJMFtL9v6tCCv8VjX6UJqSs/E7ApNPORrzjeQCKGrrQOof33cN8hI6OFCeoWKXT9O33ZfqB7iEd6FnGxhUZFcJE0BWhAz0uoSBQqrsAEb0dm6ktoGveZU/Rc8Zz2qvqlXXmTVrsu9UPyCDq5Aew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBKNv4TeIUIRAFsvv8RQxYpNGMMnH/e31aD4GbXSn8Q=;
 b=Q5P0IGfG5ZGOh7Wm0K3M73YC2sTVeATpi/+JA/E+7kmYY/+vjHKStBW6PHPfxAyS+q4q1u9zl8JmyVj5O1T7uKiXbO53HKjWvxzhf4iAmMnn8xFt+gcXFLrBu0/LxVr1BWq0Gpxk17cgIUsoYVOjyidf96o8/9Dr8FBTTIXmNpSZw8u0gOJ+XJ1hW52QC3/d8A3n4yJ/2yEHpZSR1UqiZk7xXJ606XjKTu/bDpsplwPVFYc80k2nq0AxOGQz8Ib4brpOczaNoCIqC0FpP6yYvFEHpW2vyUHUi69l/HQ7KX7W++Tvd9IeaQ7Lkrjv6o+CQ+c71MXBzkgDJzEB5poHKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d329731-57ef-2e85-be1c-54102f3dd2b8@suse.com>
Date: Thu, 4 Aug 2022 16:34:17 +0200
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
In-Reply-To: <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 112e1d5a-9097-4041-df23-08da76266aa1
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eKtGVg93rW/4LCBSkyQxB7gzB9hx8E5D2Tq1JcD9aqZtBpFYX609C6ABmuAB0ISpGe75ZWBrqhyBUHbA0iwwmhaE8pff7HIX3sRb1oUuvD4iJdMXRUCOqYX1MSPuPPIAOgP3XG2UiYYPBy1ZjaTqN3L3B/2HQp8ds4Jr5K0ajtd1+E+DB/iNyYuHSotZUljFrDmY8W2noPcQlUAyiGVE2wEprI2gDEKRYh9NQKE/nF+x3ylHaHFNaw8XuAYnoL5Se5x1bMffN+O6Nl0UfhYxRtgNajU0LhZvBaXc4/P7V/ppgPbLTP21c9mJSV/DIkWDZ7DbGyZOGBGTI9cRsbBXjP+K3cehYvX//LCf1QsDYFW6X3TW+UnFuciiMIP1ymXlGhYwQ1K2mKq+vJ0A4QGHyCis316TUHe4p/Wc1vChlbklztCeJLtIBUaatacTLZv+EiLdnTLYPcS3DyG8z66Yd971EzJFEqMVTMy2uxPo1/oD6GtxpAvW/CgvWcsYHRplXFIZs+6N6tryba5/JfaxVtjSfmqFyTIRTF3JBcy/pzQBI4J3MWdiLyMuhGVaulrpJTgXjmFHt3EEPTAulaipJO3laqKohkbhUbeDDXou0rRd/TyNq+axi/i2KbMMfA7lyxiZQ7LxQQ3TvLFyvdul7yUQ1zeCi6zPqBkRZTbEIwrwIA6LEuJAxtxel/BYTovfkK4w+FZL/cC0xD+ndEnJxocYqkzpp0GN8LC7cEZLYvyrk/GZw8OXeJkNtW4YlvGb47i0pd4RDgrRPFVwonppYPVElYwqflflE5NU89sczqQJSsOj82nh7emITjnFpcTnmEAl00Wfdz6EYV4L2lw2Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(136003)(39860400002)(366004)(6486002)(54906003)(6916009)(36756003)(31686004)(66556008)(4326008)(8676002)(66476007)(83380400001)(8936002)(31696002)(478600001)(5660300002)(66574015)(66946007)(186003)(86362001)(41300700001)(2906002)(316002)(53546011)(6506007)(38100700002)(6512007)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDVXajRBWGlBVEY1T25vc0JwQUVseGtCRFNweHU0OUlCc2I3c1VvU3J1S0R4?=
 =?utf-8?B?NExvdThtVTZ1dWxLOW5oZjV2b1BXWEQ5YXB1b2ppSXYxcVNrcUoxYks4WHlo?=
 =?utf-8?B?aFQ2RDJYTFgvMHNQMDJURW5TdXpyd2REMUovejBMMkp1dVcvTTM0MGFMT3lP?=
 =?utf-8?B?KzdUMkphaDdpV1ZyNWhCZkRIU0txWlBlTTdzek5HdE5SNGIrdXg1OFNmMlp3?=
 =?utf-8?B?NWlBQlRRdmpNNDlEZVNqLzFEWHE1RmIzYXlMclovTTRYRGNqU3F4OGtLWWJ0?=
 =?utf-8?B?cS9temFOSzdOS3N4RkFRcElrbm5zRm1telorVlFkVVprMHNQMy9YSENiYSt2?=
 =?utf-8?B?b3Z4Q09iYy9GZUhmMDErdXZuUXByVzlkV0JLM2tYWGVUVUl2SFBCa2JtTzAr?=
 =?utf-8?B?Q21RbTZ3RkFhNGFaaGhuMnhXakU3NXdzQXNXck1Rc2tWQ2VublNCVkEwUXhN?=
 =?utf-8?B?bWEzMlJOQXVLNkozcmE3aVc2MWYveTFjMWRKZDI0cm9qYk1sUWRwQ1l5T2sr?=
 =?utf-8?B?ZHpOSVJ4RDFrcmJxOE5adTh3YVVNVVlxOW1uVTNFQk1mTDhLeHZNcjBJWTZy?=
 =?utf-8?B?c1IwRXhDdDgwYWkxMHI0bkpPNC9aaFdSOWdkd2h6VzhYWGlyZjdndjE2WWVo?=
 =?utf-8?B?VmxiQTNZL3gvNm5SVDhYdmo5QUY0UzJ1a3F1N1g3d25IYzN5VFBXdVFTd3l6?=
 =?utf-8?B?NkxqSjlnWWNPMlY3NWNoY0ppTW8xeVhmUjlPdk5FUTlET3c1cE5nbTRsd3VB?=
 =?utf-8?B?ZEtXcS9nRFcySXZMdVR4WFVhYlBCVDBDQWE3TDdlM3VzeUVRODdTZTJ5eFU3?=
 =?utf-8?B?WXVZZFl6YUZicEVVY3BzNGpmZExBSGpZTnphRDF2eDg4RUFka1IwVEkwVFhE?=
 =?utf-8?B?dk9Bblo4TWdyR090U3cyUkluRTNkRWhod0JOazJlK0VWYWdZUmJINkl6ektu?=
 =?utf-8?B?d2ZYM3NDVlpBRU9STkRSa1puTEd4SmtXemlselpPSUtPTkhCaG0rbU8xM1RV?=
 =?utf-8?B?U1R3U0lZaDkxbjdqU3k5alRFaXdqWXVqWVR5MStPS0FYeG5TLzhEM0NmYTJp?=
 =?utf-8?B?eU80NFJCUXdleXBmRGMzWGM1RmxwajVMT08yRktQUXRNNHJGV3hkQXM3aXBw?=
 =?utf-8?B?RlRDRkJvZkxyamdkTFE5Sm1JdGhSNzBvaEM0L1dNYUo5a29jQkxYRks2NzFM?=
 =?utf-8?B?SHlFQW12UXk1RE9PQy8zazZPM2R5OGlkRCtsMndNeXNhYlVicEYyZnBicXJR?=
 =?utf-8?B?cjU1NkZZZGFubXQ4MGF5c2FBWjdWN3JpUzQ4bnpHUGR4Q1g0WEg2c29NaXNN?=
 =?utf-8?B?Z0xKRFZHRjJBNEJNZ0dSK0hRL1NYODZmWkRrSkNWL2Y5WmFVU2YvTmovTjU1?=
 =?utf-8?B?Uk5zYzFQdGhpRTYvSy9zQ2xDV0tybE4xNmJFSytuanJoc0FJOTU2c3FZRVEw?=
 =?utf-8?B?eE9ramlmUXU0eGtUSG1uQ2F3Tk1zaXM2RTJhVWkxWm5JdU5wVStwSWR4WElB?=
 =?utf-8?B?VWFMcHdxVDdkbUNTeG5BMVp1b012a2dkTXJEVFhIV3AzWWRMV0xvWStLT050?=
 =?utf-8?B?ZGtvMlo1Ym9Hbmg4WXZ3bWR2QUZwMG8veGcxRmRYZkYvOVdQRHZRVTk4NDhL?=
 =?utf-8?B?UHlwOGw0b2dVWUMyTmVYcHh2Vm5sZ09lZ0JWYy9ISVV4dWd1U1BHcjEwdGFK?=
 =?utf-8?B?YjZlOXpVUkhLTVFvSmg4UGwxVkJvTGVzdkpyY3NJY3JacWJsNXJMaHpsVnIz?=
 =?utf-8?B?WjVoNkVieDRVKzZZQm1aV1UvNGYxTlVIcktRNTNvQlhpVG5zWmwxWGQvNFYr?=
 =?utf-8?B?eE5DVjRJcU5VUnZ2Z2dVR0ZTY3hwZkNGRVBkdWY4cG03NzU3L1k1bFFDOTc0?=
 =?utf-8?B?b2kwTkQvVnFTSC9oM1dxNzZTUktQbDdESTc0L3AwOHpuSWFwem1sbjdna2sx?=
 =?utf-8?B?RElkaEpCanZnb0h5cGNWeFdQNVZDR2xWTjhSZDAvY3VZM28vaC9zL09SeWNw?=
 =?utf-8?B?NWpxNFdSUnpaZjhPclV6aGY3Uklsc0lBMmdkZ2NWcUVpMWRESllQTlZYT3ph?=
 =?utf-8?B?aGo1TkVIVHN4WXNpcW5MSThwanRRU1hGTHVuSnVzVmdwRk5tZjVNdUZBZVly?=
 =?utf-8?Q?walPvN93ZMxZl3EjVF/LyPXvA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112e1d5a-9097-4041-df23-08da76266aa1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:34:19.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeZZn23WUxxcrehyNbJZi0v+uW+Vae2mILI8ZQ/sPhTfC4EpiCo87ylwCPldwZRK5vkJVCbEIVxbKRrZh6IKug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3039

On 04.08.2022 16:21, Jan Beulich wrote:
> On 04.08.2022 15:43, Marek Marczykowski-Górecki wrote:
>> On Thu, Aug 04, 2022 at 02:57:49PM +0200, Jan Beulich wrote:
>>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>>> +struct dbc {
>>>> +    struct dbc_reg __iomem *dbc_reg;
>>>> +    struct xhci_dbc_ctx *dbc_ctx;
>>>> +    struct xhci_erst_segment *dbc_erst;
>>>> +    struct xhci_trb_ring dbc_ering;
>>>> +    struct xhci_trb_ring dbc_oring;
>>>> +    struct xhci_trb_ring dbc_iring;
>>>> +    struct dbc_work_ring dbc_owork;
>>>> +    struct xhci_string_descriptor *dbc_str;
>>>
>>> I'm afraid I still don't see why the static page this field is being
>>> initialized with is necessary. Can't you have a static variable (of
>>> some struct type) all pre-filled at build time, which you then apply
>>> virt_to_maddr() to in order to fill the respective dbc_ctx fields?
>>
>> I need to keep this structure somewhere DMA-reachable for the device (as
>> in - included in appropriate IOMMU context). Patch 8/10 is doing it. And
>> also, patch 8/10 is putting it together with other DMA-reachable
>> structures (not a separate page on its own). If I'd make it a separate
>> static variable (not part of that later struct), I'd need to reserve the
>> whole page for it - to guarantee no unrelated data lives on the same
>> (DMA-reachable) page.
>>
>> As for statically initializing it, if would require the whole
>> (multi-page DMA-reachable) thing living in .data, not .bss, so a bigger
>> binary (not a huge concern due to compression, but still). But more
>> importantly, I don't know how to do it in a readable way, and you have
>> complained about readability of initializer of this structure in v2.
>>
>>> That struct will be quite a bit less than a page's worth in size.
>>
>> See above - it cannot share page with unrelated Xen data.
> 
> I have to admit that I'd see no issue if these lived side by side with
> e.g. other string literals. The more that the device is supposed to be
> exposed to Dom0 only anyway, and hence that'll be the only domain able
> to get at that data.

Actually: With your plan to expose the device to a DomU, how is that
going to work without tool stack adjustments? Wouldn't you need to
prevent in particular HVM/PVH guests from using the GFNs corresponding
to the MFNs where this Xen data is? The minimal requirement then would
seem to be an E820 reserved range for the area.

Jan

