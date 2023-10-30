Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B767DBC7B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625189.974214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxU35-0004xu-9N; Mon, 30 Oct 2023 15:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625189.974214; Mon, 30 Oct 2023 15:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxU35-0004vB-5W; Mon, 30 Oct 2023 15:19:27 +0000
Received: by outflank-mailman (input) for mailman id 625189;
 Mon, 30 Oct 2023 15:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxU33-0004v5-Al
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:19:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe12::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44f5d0d-7737-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 16:19:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Mon, 30 Oct
 2023 15:19:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:19:20 +0000
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
X-Inumbo-ID: b44f5d0d-7737-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtZ52NXFv2KrJ9JL8K4mEyyjVWvp5O+YbtQQzdK9wyu3ILSy6haY2oLQfwDISu2+JPhXoDoT0mTAslR3cpCU6sz/XH/N6J9Gt5nUvoXBZZ3LoGjZ+NMvOLocXJZNmBGeYn3T+AMne8aqI6wXI5nG8gY8Ky9H1PJngYN+XZxOwpAm0trevcYikemPTmuaTaVtsxqWvf+kev+ubiakNZq4XQQ/NiIi4aXgcXmTC4ITN6KfbcyfrN9WG5dKpy9hd8jRW4EEEw+4bS1zfihd5U3IdRSJf6qgWqCT7hKhQPsXP0Ixszc/lRyL2+pERTGOSKdOoo1XA+iGFFyno/zGxCPvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcBEXizaahuBBHyZND5VnUFmhl1MFtWBu49OgJMt4CA=;
 b=lchpqgFxDKVrkDcTo7VwOOYM/21IZrERfoRFqX3ldnF5Afp/C8agny+0xwersnKC2fV6kM7azCk+ZbStRgm639OeD5zmoANApkDvu2uC8w8wE/ISQUwiegOiovvQr1JT857y2/XAV5rw50DpDnErKLM0H3RflmZh8D+RErNwj1hHHa3yPsgczpt/QvEHit7I8ZQh7OziCWQp1df0WQskhYoFyYZa6A3flMnxEtQ22U/j/x4ApQ07E0872Lk5E6eS4wERwLsXXbeW72iXl5wxYIQ0uJ9Weu2IxxYP/vjqL95nrDE/G0pkzj7mFm7kUSDXqpBsYftXaaopcfL6PXK4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcBEXizaahuBBHyZND5VnUFmhl1MFtWBu49OgJMt4CA=;
 b=JBC683Ey5tbHBQMD9+maugbYUS/++E07y/VyWrTyRJTppgkrYD5sY5AB2pQa+ykDFQyAgcF332yNfc9jqjlCZGeCg0suU59gAty85+2fFqdUujIyncYi9+l1skChSN3hVWzX6d1sAiuBpmORXIJSeMyy3S5hC8p7srhWvYLyJaku+JszjWIYnvSmOWC9l9fSK/yo7g0Ep9btQOrohSx6W3BeX/L2+UGCkR9q8G2cFZDjuLu0FxlxWGV+ROvFo7xoARGYj72vNE1HS8eMIEFTmgkxPFsRFYsn/nQ+UgzKYkOF3x90X3U+9+Gk9NrJmxQMaHnTaeVRuMaV8Uao97OAOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4929b28-5608-bba8-9953-270f408e32eb@suse.com>
Date: Mon, 30 Oct 2023 16:19:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com> <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com> <ZTponIYDYDWRZhzi@macbook>
 <75026813-03fe-3a46-2274-b93e98f62f89@suse.com> <ZTqDjNSBmXeblsud@macbook>
 <d3da9300-781f-9abb-158b-0c82d36228f5@suse.com> <ZT_IP_-X4oLhmcFT@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZT_IP_-X4oLhmcFT@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae86eac-c45e-40f5-b761-08dbd95b9723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0VOuwcvblT9Rp1meQra9L50HCnTbPB0Pg+amEPLiIYNXe2HEMs/4W/pe0c/IM+3FBqPP/5QS14eOkqM+gO/807JqszEbUMSAbvT1HwOmv8WcvBCq2xpYWSU8v7gCRmPlLu9KkP6EtwxiXNN9oLkqw9ipD+NLwCnikEPAgjxxUxq4FXdfuh5rxeuE6IUqqvwkxS9imAY9TMNjgt3C4C0ptgEWlTjHq+uZQFHasy1oBi7COXeq6wsp+oDmB7wC901QvqUkLpxsPZ5pr5iBra//I0zA2jB+9+YY1nLPld53lZYRbmW2Vle/aKWX1RlE2exGEbJ5C7Bh2oGceAmAry2ocDz2gB7UaRWM/nIGQGTwfq3LjndKnmiYJNDRn+mOI/RhUw9iyQO03CiwGtYiW0LfQ1OcManZwLaQNPLUq9O3U8EeK8HrHasSu6LwDTAr+YqohW3aQwPy5v4+KpCcxPmUcVmxRliMTh59Zeav/QCFYJ+o1UonnQtG4cxEupDJNGzs/6VF49X6Ti7as4p0rLX0SWXpCB+jtRwAXehNux2aPBcWxWbLZtTzVpi+damyWccd85WQ9mNE0++pepeMxt5lW3AJGKLmySGGA7f9WNlNjxZH0SVX188PO8gGwbDgpQGU6qacO89H8Z5uSRxeogVg/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(6512007)(2616005)(26005)(38100700002)(31696002)(36756003)(86362001)(2906002)(6486002)(478600001)(53546011)(6506007)(66476007)(8936002)(4326008)(8676002)(54906003)(6916009)(316002)(5660300002)(66556008)(41300700001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VBZ242b2s5S1RqR2cvSFdNanNIQ1B6QWJnQjgzMG42MHhrWHZ0b2pvYm5R?=
 =?utf-8?B?VGFrc084VE5tZW5lVWNkaHB4WVlQaUZVK1BzTE9ubjJ5bnpJYWhPbWswVzd1?=
 =?utf-8?B?SkNkL2NYVkRvaXpTdmtnUGFCN1lFK2RGQVk3Wmd5a0MrTVlJbnBwbUZ4NHRK?=
 =?utf-8?B?Z1hzUDNjSjJyenoxZkNHWkpRdnN3S21Od01sdnMxVGN2UUMvZWxndE04K3h5?=
 =?utf-8?B?cWp0R2F3WHNlL25rSC9mWXNleVlrZ2ZScGQzZ0pNNHlIaWFxS3d0RHdmN05i?=
 =?utf-8?B?Nk1sZXpCWkpQQmxGQVpVM1RzZEpYV1pHaUY1WjdLLzRYUWV4MFZWL3BqOStG?=
 =?utf-8?B?SHZJeTdPYlAzOHo2YlYrQXpGNUpweXE5cWQ1Y1U2VThYS0l6MTV6M0ZtaU15?=
 =?utf-8?B?WW82SFM3M0xyek5pb1dVdWc2UkgreW9menB6VEhBQ2pMWGZOcWdCVVFSMi9J?=
 =?utf-8?B?YkpJMHlxQzJWYU13Z0hIVXpmK0JzenVFZTcxWTFJR0xEa2lmVkVHeTBubUEw?=
 =?utf-8?B?TjQ3YjJkR285emNpdHA2RHgyZkRoRmNpK2Z0cjVNVThtcjZ1b21pcGNjWk5D?=
 =?utf-8?B?TGk0NHdhRjdMRW96SWIveE9QSncrbVY3Wk9Hd2xMbVluM0NCN2N2V1hlQ1hC?=
 =?utf-8?B?dW10Y2FlR3M0UzRhTko0aUVQWXZtMjluN3JTeFVtMVBwLzhWS0FoRFBSZ1BY?=
 =?utf-8?B?TTd1dlhmR0RtQnBaeG8ydy9NWGZiaFVPVzhIR3FvL1l4K3dpRFExQ0UxaWZG?=
 =?utf-8?B?L2JQeW9VRGZ3Wkg2OXZvckxodjBPN3QxOGV3VVNYSjFSY2xDdGxBMDA1MzNW?=
 =?utf-8?B?eGtvVDdWOHBIMGhHYXFpMi84L003anNraTVaSk9XRmxuWk1sOUpPN2tqWFR4?=
 =?utf-8?B?K0NUbENzNURmNXgxdVJnUjdLQWZRTlVVMXlMYVp6NzBGMTQwbnNkdEFYRTRK?=
 =?utf-8?B?KzdDc0ltZ0pRT1RHVlJSY01hNzN3U2hKUUphaHdzS3lLUTZTQWc3dW1JbDB1?=
 =?utf-8?B?djNYM2tKRmIzOHltY3ZuT25NTzMwWkFqRFdlUGhzRnkvRmp5cStmcTV5a3RG?=
 =?utf-8?B?SktYamJHempSU3J1N2YvWVRTaXNGU3dsS0lHb3RyUkR3dElGczNNa0QyQmhE?=
 =?utf-8?B?dGdkVllTOXZuRzRzM2I0M0lYRjcwNWZBOXVCSTI4dTdyVjhzSU56d1lhQ25D?=
 =?utf-8?B?TU84dHlYVXMvSWFRTmFNY0hCTFlMQy9xTWN0ckFnZDQ3V2xLSFRkb3VnemVz?=
 =?utf-8?B?Y1FDUFk2a2JlRnQ0S2VuN3FzQVdEZU5QOXZwSDRBOFVNU1VlZEUyNTlnMFk1?=
 =?utf-8?B?UVp2eXE5UGpnYlNLVXZMUGxVak14YlVSWVdtUUhBa1ZZMVZTWThuY3RqN1RD?=
 =?utf-8?B?MW1WSG5CVlFVTXdsenNIUGc3NjkrOGdyZkpTNEJxRDQ0SlJMMU9ialdJN1lv?=
 =?utf-8?B?dWJva2kwenRGVGpEeGV3azZwRTJleC94Zkp5SzVqOTJGdXJhbzcvUU9pV2dn?=
 =?utf-8?B?WmpRYWUwRm43SlZpbS9vVWYvVktDd2lldWZaQVpoUTVJU21mNW1CYnhWWUN4?=
 =?utf-8?B?T29Cd1JUYXVIT2VhQll0RzN6d2xQVFFHYlNybk9RekxDWlY1dWxMMGJHcytO?=
 =?utf-8?B?WFhERFRqYXJhMmdoQ1M1K2xsTC9mZXVQaEwvSkJISGV0TkRKQTA4cWlPWWVF?=
 =?utf-8?B?c3BOaHh3QXNhdVd6ODQ2eEcxOEFPRjBJRFExY1pFL01LREo5dFQ3MExVblhs?=
 =?utf-8?B?VjRCYlJiWjM5OHZENGNKMWZuS2Q3cmJEcThOdTljNmRXRlY0T2NFVVFJYXJV?=
 =?utf-8?B?WGs1YllSZytQVnQzdjJ5bEQ2OEVLd1p2SGhNVXFmc0pOUFZ6TVFCTk1TLzN1?=
 =?utf-8?B?WVhrcUkxVzMrSm1BVUlqMWtOdjVoN3pRTEFFRGF4OFBFVEdKRkFjR3RnYUkx?=
 =?utf-8?B?cnQ5cllWZDhwV0IwTmhsR1dqK1FaQncxeFp0MVRsZURza25Qb25DejRON09n?=
 =?utf-8?B?TGNad1A2cjhaNFNWVWZxWFQzQU8zUFdoWnRiYUg2WG5xd2pUWjFydTk4T2py?=
 =?utf-8?B?azB5UlFtRzRzNmVTNDEwNjRRbmJyRm1XTUlmZFBla2JrOXlJRk44NG43K3Br?=
 =?utf-8?Q?siLjKKZxBq5SLXH3Q9nN5GavS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae86eac-c45e-40f5-b761-08dbd95b9723
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:19:20.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTbLLdu779thhqbQn7VSuy7fEFfZ0USnhgnOz6mjQF1SGOUX0AlQk9eNvg5QG/JdjVWh5M6osjsBgc5HxQDEXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208

On 30.10.2023 16:14, Roger Pau Monné wrote:
> On Mon, Oct 30, 2023 at 01:24:52PM +0100, Jan Beulich wrote:
>> On 26.10.2023 17:19, Roger Pau Monné wrote:
>>> Maybe the issue is that PV_SHIM_EXCLUSIVE shouldn't have been a
>>> Kconfig option in the first place, and instead a specific Kconfig
>>> config file?
>>>
>>> Maybe it's not possible to achieve the same using just a Kconfig
>>> config file.
>>
>> I'm afraid I don't understand what you mean by "Kconfig config file". It
>> can't really be just another .../Kconfig file somewhere in the tree, as
>> it doesn't really matter where an option like this would be defined.
> 
> No, I was thinking of splitting what PV_SHIM_EXCLUSIVE actually
> implies, for example by adding CONFIG_DOMCTL_HYPERCALLL or
> CONFIG_PLATFORM_HYPERCALL and re-work the pvshim_defconfig config file
> based on those, so that we don't end up with negative relations.
> 
> Note sure all usages of PV_SHIM_EXCLUSIVE can be split in such a way,
> maybe we would need some compromise.

Wouldn't such a CONFIG_DOMCTL_HYPERCALL then still want to depend on
!PV_SHIM_EXCLUSIVE, which is the kind of dependency we want to avoid?
Aiui the two (splitting and inverting) are largely orthogonal aspects.

Jan

