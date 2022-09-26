Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B65EAB38
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411986.655142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqA2-0006RQ-M1; Mon, 26 Sep 2022 15:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411986.655142; Mon, 26 Sep 2022 15:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqA2-0006Ol-IV; Mon, 26 Sep 2022 15:36:46 +0000
Received: by outflank-mailman (input) for mailman id 411986;
 Mon, 26 Sep 2022 15:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocqA1-0006LX-Kp
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:36:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06678123-3db1-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 17:36:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 26 Sep
 2022 15:36:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 15:36:43 +0000
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
X-Inumbo-ID: 06678123-3db1-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmtQ7ebnfaPlrVPL+vMi61szgYsXIvOpBts1FIAN2tpOIJEvh6TshlR+/dqFPiQgc+v0SErl8qImhnJpd5F9IZrBx+VdDc7OB7YBNjLatx+NT2qsyqmn83vpmW50sGuUvdhpt3XTjF9Natk6dPiPDhVxM4/Esbn9EQVd09LQ3atuE5wQ8/oZdu8fgZGmm5NbgGXCwWEWJOtI5w73Dvlj+UncMP+W+Mv0Ueal3FWqHeOnJaMp1IhAFv2lXSw74OS8pBvpFfclZF03jixbHspnPcKNwEXXpYK/epJPHL9vnlM8YnevI6EH6R6NTmIxzH7c0tlTzssCc5o6mMT4x3lw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiRO1fbiMz0K0BF4WVdahsc51lQbrzcFmA4oYs8BhU8=;
 b=e2/eQVC451wQVaEMEhp4M/6vc642FMP2G3Uexo4V8OPnywUhNQkY1AcIrYuiirZocLQZVqpeALKD+kC3sKjksT8utKsfoKySgri7ZBGkYqt/29PGZo+Ja2YMnYHIzl2HgE72ru7keqNHsKTwdeF+xcklJfJWqlmTOLQIA5YSUHuII5u0iUC5zmXn5gYJP7PJ5pvca7+dbBZVV2ZpEzMV1WdPBWitmVjIib47n0TUS+o1NzZQMNBFYMH4U6esKYVNK1g9Red1NyQPKfwIjRPqnscXqSb8OIYP3HduSzEmFHj+cwiCaAWxurSVCesXn6en7dyo+9BXM0MxSr5K+JAYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiRO1fbiMz0K0BF4WVdahsc51lQbrzcFmA4oYs8BhU8=;
 b=NQzi6UGwqL6L/wPDCSHpFxszTNJp/a3DdpN3soAAWJKV7tGD4EOnZNO97RzecjbR4WDBSy6bQXexM+n/DWhaPbkGrLf671j3bzT8EPFLcYpqPh2KFBYZLXaGes3mpwyaak0yO3aXBmZYiodHXxVnSfkJwNVx3Jc5SUFUylWwjTDUp3SDw09uurZHQCgEMC2wM65nHSWAsCh8BP9Hr/Oqmfgk9ZDOGdbkSE/EWMbOCzVm2T/fxAd+pfijWUQAxBt4bvKe6Ua8/UHeuka9261dZ9Nrh0cyPw993CO4pGTvlTDXoUMhOQvsEQcy7I9i3No0h+dPMMqLV3MfjX1HH2OxxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8c080ca-33a1-ab15-963e-9c5c02c99bce@suse.com>
Date: Mon, 26 Sep 2022 17:36:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
 <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
 <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
 <YzG8Ln2cYTuxF513@MacBook-Air-de-Roger.local>
 <YzHEcdCtch7lKh4G@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzHEcdCtch7lKh4G@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e87e328-329c-4aa6-f9db-08da9fd4e9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jKDHb5ZObglI4TE/3CpXUZS3a+5A4rhhTJrD9eoxT/L++rCECWk8704IbXSoS907XRpHc4IckpPzOOLIbtbM0eaF5goim+jpG1VFXUS9lbJp7bOL0moWW3aKagPszImZmW9KlIsNaOXv/ARvKKPqlfiBGkz5zhSpfEcNyPdMaZMrqeX1jAXHC7+tockqLST3Yp5892M3ErNMscU18mv4BcXnEXmtidbjZirSJcfEutnn+TuOErywahUm4IJfg0Ex0WQIIROW9lRsTcxUgjA+Fy9S9vxM/VFllQ5de54yfRxvdebWXqGmqQP14ZF4ATFOmvpsiCyd2YF5IrCpp2i6WXTGBBfppq8+85w2LfnT0v64UgCO7nTvqXH3YoA1LGQs/VhmQxygDhTuDdgWGiomzJWWA+UOyE7jAe/MXCUnJ7T7M5CAsNWrdLuTqVYtDln/Xgkf8p9IhI73TXaYAuiYlCe2BdbRn62hOVKreNvta1ozyGrYa54iqIf1Zdts1OYETx6KPpX3VWTTA9cwW8HDjQz6lMcRwwE4HPtgX4lrXd9Aa36KB0rJ+EtEBobPzFoPBbWmWISTYdiDNhypAExelwuA6E+tmixvE3tcAs5nYBxnvNQcNNGckDtPC8o8t3pmft/KK91+4Ik3QnPg6Cm3xgvyH2hur9IM4aQw5WZoUL/DchPq7PIngc2D1tkVfZEoFm7Ji5V1/eLV0xAMIvocS8lvwd4f21UP7AyYN6n8Zvvgn6di7yXqfWweetDwrJVYtccOjbvc56FJqDbUu9fdYoA6u67cUXcLw+JKReMHrRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199015)(38100700002)(36756003)(316002)(478600001)(2906002)(8676002)(6486002)(66476007)(8936002)(54906003)(5660300002)(66946007)(66556008)(6916009)(86362001)(26005)(6512007)(53546011)(6506007)(4326008)(41300700001)(2616005)(31696002)(83380400001)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2Z1YUJlb2dCOUR2ZzVqYUdqTGppeExBeUtBYnJoY0pXQTNBTTdwMi9GYzBZ?=
 =?utf-8?B?ZDhReGd5YmYycVBrcnI4VnRtc2JLZGhzV3RIOVZjUDd4Mlo0dkhpT0ZlRVA0?=
 =?utf-8?B?cUx6VGs5Um9WdjF5WG5lTG91ZmtGcnljdmxSK1g3bC9lTlZOd2RZTjIyWm4z?=
 =?utf-8?B?T0ZuZ3dHN0F1ekhpNmU0YWJRVjlucWpCeStFcGxIR2tLZEM2Z1lKbnB6Ri83?=
 =?utf-8?B?Mm0zaDkyT0ZGY1NKM0syb25tdmhrbnhXRjFGbllER3pramtpN2htNzFlalQ4?=
 =?utf-8?B?NW9ydTJOY2o2OE9ZZ3dka3ZzVWdVZFZiTWJrb2d3d1gyOFo5RGxuaDE0bWdK?=
 =?utf-8?B?bkpTMHRUUVIra0hCZ0NPYWZPZDVHTGdHYkVoOGxWNUVDSFJEVXpXb3A5MDho?=
 =?utf-8?B?S2tseVRTZFlHcHlRNHE5SXU4VFU3Szl0SDZyaXBmZlNTNVJoalFVOWg0elVi?=
 =?utf-8?B?bHJKQmt1bWNDVXk2Q0lxM1UxZUtGQ2VoUmpzaEFSMmFQQlNONUVJODRkQWxK?=
 =?utf-8?B?U216L1FwckhNOW02dUwxMjE2YXVIRmdSdGQxS2U5bnEzaGpQR3FzUCtIWkpl?=
 =?utf-8?B?cVJLVjFSWTREckZsTUh0RG1BYmJuWjFIVFFUMGRhL0M5QUhVaFhzZG9Gelp0?=
 =?utf-8?B?RlE4OGhTWnZLS05tNHExQVhBOXVkdVo5MHNGZi9FM0hucUx1YVJNQ1lsUkgw?=
 =?utf-8?B?djl5eHROc244bEtyUlpIZnJLVHU1aXpmOGFEM25wOEx5amxYRHR0QlRQbTJ3?=
 =?utf-8?B?cW1iN3Z6eHNHYnpsOHZlS1h2VVZVYS9iZWhENG1EbnBkM3hVb0ZGZU11Q1hk?=
 =?utf-8?B?S09LN2RHbkYra1dXcmZvOUhTOTc2UHJ0cElWM2lVcUJoc0E0R1VTRVhma3k4?=
 =?utf-8?B?L3krM1hsaVNrUXZCRWh4ZmZGdndoWmNQQ1JhL2hTWmZGOTUxWWFYRjlNbmtT?=
 =?utf-8?B?YmNYclNNSy9kZDlCMEtCVmFaZFlkazZjRmU4cGVlVDhYQ1Z4TS82aWlZQXZ2?=
 =?utf-8?B?RWJyS1JDdktDUDg2ckdKUDBsem1ubXYzYjVsTWJOVHVzUjZLVzBJWkNzYjhi?=
 =?utf-8?B?YnRXY0lJc2Zxd0xRMEVrMUdIT2ZySktPeTN1VEg1VEpjSERVNmZOZFVSemNz?=
 =?utf-8?B?MERNbkkrdE5qS0ROaDcwMlZzVUE5UjZYLy8vMmpEUktuSTlKdE9SU1F2Ym5T?=
 =?utf-8?B?aFkwbk5MVWVkWk1rZ1JMWk5obkoyWFhRTTNSdzFpYmM2cEVtc0ZNVi9KaFgr?=
 =?utf-8?B?M1YyT2Z0dXZHL1B5cTFMalBKM0dqRnZ0TXJjWVBzdWNBVkN2ZHpuNmd0bWQ2?=
 =?utf-8?B?NWZxY1VNZUNiajUrMUc0akVxZ05PdmVUVjJEVnlGRVpIWUI2Wi9YWEZPb0h6?=
 =?utf-8?B?MDYzNktDZHlGT2RiY2MveklMVXJYR3lkUWl5QVlOMW1nK1NscU5JSXhmY2lk?=
 =?utf-8?B?WVg1aFcxaVhpNXNFU1B5dHdWeDFqZGpUSDNrVHBGMytsTGZCUWNKeVZPUjFm?=
 =?utf-8?B?Z0FWMldjN1hrQlduUG8yZWN2Qi9TbGVQaU1UaDVFejFzcE1kSU52UldUdkJF?=
 =?utf-8?B?WmJha2VxOGtzd2lMR25mQWFWY1RnRThDYmRRbUlMZDlQVkkwZ2JnV0l0Z202?=
 =?utf-8?B?Y1RGbytxZUh2c0Vja3MycldvKzJUUWt3QlVFSHp3a0QxV29Rc2RMWmxCZDNJ?=
 =?utf-8?B?U3J0eUFHOXFPdmwxbjdkQzg3aGtjbjVNNHIxa2VXY3hCYnU2T2VZYTdDUDBy?=
 =?utf-8?B?OGFUUFNyN1hxMUp1QmpOZEg4NlF5Y25mZVNncFY5bGpPdTlGZzRtSFRsWk80?=
 =?utf-8?B?UmNab0o4Y3FraFVxaU9hUnd5eGxZUzRtRzgrai9QSU9NNGZGUWRScW80ZTBG?=
 =?utf-8?B?TjNNRm1JT3VoanR4MUVybHl0OXVTZThKNW9vUXFHUVd1c1c1cjZUeEN0M3Ax?=
 =?utf-8?B?L1FzOTFBNENGYUhTb2pvM1hmelJTWkRrSHdWMitDeDZGZ0twZ3pBVU81NTNK?=
 =?utf-8?B?OS9CWkZlSDN1SXNZREJnekNQQllSYVg5bDAybjFna2NBRy9SM0ZiZkFscllj?=
 =?utf-8?B?U1VMT2ZVcmwzem1OZlVlSXloakN3RlpOQjhDQytRWndJeEpVL0V6Snhza2Z4?=
 =?utf-8?Q?J0wapn/Qc5+Qx2eoiK7oxKyPc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e87e328-329c-4aa6-f9db-08da9fd4e9bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:36:43.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQ0Nkf2SdW0lfBZo+i/zQWTk699UEA5yPNi73GaAEXBN/uQ0NhmVFMq6VJfGQio8Y+VQjjj7/sCt2HAg9Wp4EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

On 26.09.2022 17:25, Roger Pau Monné wrote:
> On Mon, Sep 26, 2022 at 04:50:22PM +0200, Roger Pau Monné wrote:
>> On Mon, Sep 26, 2022 at 09:33:10AM +0200, Jan Beulich wrote:
>>> On 23.09.2022 10:35, Roger Pau Monné wrote:
>>>> On Thu, Sep 22, 2022 at 09:21:59PM +0200, Jan Beulich wrote:
>>>>> On 22.09.2022 18:05, Roger Pau Monne wrote:
>>>>> And if we were to restrict the calls, I think we need to clearly
>>>>> tie together the various places which need updating together in
>>>>> case e.g. the condition in epte_get_entry_emt() is changed.
>>>>> Minimally by way of comments, but maybe by way of a small helper
>>>>> function (for which I can't seem to be able to think of a good
>>>>> name) sitting next to epte_get_entry_emt().
>>>>
>>>> Such helper function is also kind of problematic, as it would have to
>>>> live in p2m-ept.c but be used in domctl.c and x86/domctl.c?  It would
>>>> have to go through the p2m_domain indirection structure.
>>>
>>> It would need abstraction at the arch level as well as for !HVM configs
>>> on x86. I'm not sure the indirection layer would actually be needed, as
>>> the contents of the function - despite wanting placing in p2m-ept.c -
>>> isn't really vendor dependent. (If AMD/SVM gained a need for a similar
>>> helper, things would nee re-evaluating.)
>>
>> Maybe it would be better to add the calls to memory_type_changed()
>> directly in iomem_{permit,deny}_access() and
>> ioports_{permit,deny}_access itself?

I'm of two minds - on one hand that would nicely take the call "out of
sight", but otoh this would feel like a layering violation. Yet then
maybe it's a layering violation no matter where that call lives.

>> That would also allow to remove the noop Arm memory_type_changed()
>> halper.
> 
> Correction: the Arm memory_type_changed() needs to stay, as
> iomem_{permit,deny}_access() is common code.

Right, or we'd need some other arch abstraction. (I wonder whether
long term Arm can actually get away without this. Even on the AMD side
of x86 I don't think it's quite right that adding/removing of MMIO
ranges has no effect on the memory type of accesses.)

Jan

