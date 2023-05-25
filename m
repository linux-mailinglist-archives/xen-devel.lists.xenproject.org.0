Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF32710F6F
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539693.840816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Cnu-00058i-NH; Thu, 25 May 2023 15:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539693.840816; Thu, 25 May 2023 15:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Cnu-00055q-JU; Thu, 25 May 2023 15:23:02 +0000
Received: by outflank-mailman (input) for mailman id 539693;
 Thu, 25 May 2023 15:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2Cnt-00055k-0Z
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:23:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07bb0c29-fb10-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 17:22:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9315.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 15:22:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 15:22:56 +0000
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
X-Inumbo-ID: 07bb0c29-fb10-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWr7PFq8eUdUOg9Nr0Nh+S2L2FLQ9VQh2mXrf3rO4eVUQiDQLsEPuTZUDInfZXGMckESY1LXFWcgu2Zfiadd/f9BD11QLNMSutUkm4tWbkgtjxabUBKjPlt+6/tcmoofgicLezN7YF6m0Etyc3cQl+WfrkEAZDJnW7hytNtmLbsZMBFEDZb2HXOcgvq51n0ckwKja3IhvizbrkDzsFEjNgei9FaycEzCIYPA4ZLMvDLP6pdT6FUL0y5Xx67hxNtL0p2y1U8gVBHp37DUpTcKAVGZQ2uWdHR79tXMi9gxWXrInz0ncrvPsGx2QN9gYfuYt3gUvqZqYlyqrhXeH5R+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkFVCOGYL4an4mCcuOA6hS6maBBNiaz7sHi1Adol5Uw=;
 b=VH8WnybyegBYMBf6vLqRxe9VM1lvvXw+niyC8NNyJ5BwU19LQhX13cJd5qtKoPR63u33tx3WYYyazCwtrwNr1ZxABfhW8I6rPc73rGe6UTmCZM0P9na4gI11TjZUFTJlOw235az6lPBbzaMAzLZLEUjDnHdHat528kV3fblmkyoyq5jusEawsN5D/g1v0Eu4zd7r/a8kalW0i/A3N2It4GfHrrsDHoMd+oip6QTc49cgauwRPK7N8RVB3Va0XNH01cRpF//Lyf70xx0Xc9VOWK99hpiL8LnorBKWYMhWGpQMQmBNQP3q8WwUrL+hJyHJxQCHgolbhsB21gwwUk1Ieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkFVCOGYL4an4mCcuOA6hS6maBBNiaz7sHi1Adol5Uw=;
 b=Uit04lPsyjKmBeAK8psoUnE1usyI+lXgIq/l5s8l4uRUmHDTJ3agkPeAHhI/cO77hxJvXwjjS6+wsmk3H7z7A2Y3m9udsEpSYpSSG/m6aXXPQOHW57t5+TpDSx85b/tBEAwbxy265B0bgLucOyxnF7Un1adVdmn/0wxuw0gJNVUFIX9TXSUdFIjtJEGwwI4qp+Gk7Ou9cmqy0hRC3fqN4CavzBab9WuFkLH+7aedZc1uSe27jrczgev00h8NqO1tqEvToMNy+vj+Bmhci1EojNTlnLmpzXr7gCDFapLB7BxWf2C9gHA2MSDnyUMC2QidOGHuiMLl1JcLVYX/gT8RBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56cb3727-5905-1a7a-ceed-cf110bdddad4@suse.com>
Date: Thu, 25 May 2023 17:22:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] vpci/header: cope with devices not having vpci
 allocated
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230525145405.35348-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230525145405.35348-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee730d6-799a-4d0b-2b10-08db5d33ea23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ua4TqcZuFvOJfYqJIqoBXfxuHZqU1PtREHoYDfwCO3AKRlZiGiG6asMTxt8Hz/gNCx9WWTpedFt5M0msPdA8KCMWWjo1iQ4zuBmPnIJrEbMHAgYwgt81MdvQV8ysBGmo3O886dJ9+CAE/HuvwAMHYutuxMRMBpL8537IHVNVbFXiOEMGYnByoIFm2yXJPZjstdRf590/a5TY598FmxdrYJ/syKaU/HIV/Om9MdLZEMtdOlg1uIpCsqbmCCo3HHhaU6oJYnaIeIjNntu0xq+FEJuKYUI93Tgl130TL/PMvvAoXWij8s4lW3EoWIT2ikKEqSZ07TT6T1P+8/3SCZehA5cIJZw0yYuCjBrnJEF+R+rzKuqaZh7XLyVMqu/Sb03ilwzKGjF436tJ+g+CoZyJatn0wZCIeA6PBXFZI5aAGQV75hy70Q0N/aSrYLZ4aryf5egdOH9myjx9jYwueJmlSwkxKT8OcEhxoQgFz7u7xRjQ4uIKb0xSeg9i9bE1aPSwNmTgDM2svLS0SWQLzIg3bNlMbpsFlsvJ1QOG1lrT141uSue2A11PXqqcCB91/qZW+AZCPrsJdD56qI0RjoAsU2TGTd3iUZPXUwotAk4ktjcQ+BCCqNWzf8E4UhDGgaEjyK7koqdl2jvyEVD2R2/PEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(26005)(6506007)(6512007)(186003)(53546011)(38100700002)(2616005)(36756003)(2906002)(4744005)(6486002)(5660300002)(41300700001)(316002)(6666004)(86362001)(66476007)(31686004)(478600001)(66556008)(66946007)(6916009)(4326008)(31696002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1lqcXFDTlRiNm9LZlpGQzRyNVdYckJGZ2RjMjFPNnBFTXh0bXREaE1RMTVD?=
 =?utf-8?B?UXR0RWdjODBZRzFzL2FreDBQS292alRNMEdYNVBhY3JiVVFISHRnbFB1UlIz?=
 =?utf-8?B?dk9pK29sNHJ3L1RCeHcxUXlLN3dHNGgzT1pmOXdQYnl2VXdCZHV5Tnp5b1VP?=
 =?utf-8?B?SXVOLzRtcFdkT3lxZWVicFZhajdMQ3krODNPV1NOTnBSVjFnT2ttanBGZEdz?=
 =?utf-8?B?bEl0OVhlbC9MbVZVUFhOTXJMSDVGLzVYR0lrTTdlL3FuNDFVelgyUFd1UXpD?=
 =?utf-8?B?Wm5BZUljbzd0TUFabmtjbTNULzZSZVlrT2UrZEJnWnRhNjV5V0FyM2hTZzg0?=
 =?utf-8?B?ZE9vRVM0dU1rcElWUU51TlduV0pxdXg0aDFJWGNWc2pYOGRKanN4N2ZucjJo?=
 =?utf-8?B?SFBKVWhTL1R0ZXhWR3dqRGg0ZHg3RlBrTFhGWWgwSStlV2tGY3VrWU93QjBM?=
 =?utf-8?B?eWN3RTZTZTVuYUkzWnMvVnY0ZEhuN2hMa1V6WlZ1REhQbldsOXVnTXNBdTVi?=
 =?utf-8?B?RzFsNHgrWTJIeDVvTXRMYTJsbnlPNlZ3UlVGMmZxbzFYOXRhUXRrWmNRLzVZ?=
 =?utf-8?B?TWk5N1lLSHcvY0lHSDJWZzgxK1JoSmQrUEorYVhURWkwUUxkYzQ5TkpwWU42?=
 =?utf-8?B?U0paYm1kYmUrVXhFKy9DT2RhdFJua0ZwOWdlM3pGVTJMWnFOS0hnOFRkWGxi?=
 =?utf-8?B?TkdNZWxvV3lvZTd3eGxDcy9pZlpoR3VsZlExSG5jM0VpT0JubmJuM3grK2hn?=
 =?utf-8?B?TUl6N3VvR29iVmJqL2k2eTZndjFwMFltODVFQ0w2NGhQUFlGQ0NHMURGZm9M?=
 =?utf-8?B?bFlWVSt1MTR2TVZVWnowN08vMjMxU3J3VXFkZnJqQlRhZVp4Z3NnU05DMDRw?=
 =?utf-8?B?ejNvM0NuRUVxNWhwRk9DM0JydFJkV2lNb0FDYzY3RklzbDZqWmtHOC9yVnF3?=
 =?utf-8?B?OEZjTWVFQktpcG1iOU53N2QyNTZFOGNiTW9IVXlyeU5WYy9FcGxWbkRvMDFH?=
 =?utf-8?B?VmlUU01QZWRHK005ZDNoM3orSFRvSU9rWVErRk95RUV6VDlvOTYyME81Uyta?=
 =?utf-8?B?cEZObC9ST1RRMFhiVTFVNHNQc2xSSjAxVllOQXF6bFFaRnNlM3I3U0tkLy80?=
 =?utf-8?B?cFFIZndZaitEYlI2Qmd5VjNJdm9WdlhtVVpKNDBLbDh2TE9mZUFvS3RHZlZJ?=
 =?utf-8?B?ZmxnRGxVWUZDMmZMMDQwdHJqSTd0N2ZnREhMWHM4VTJrQ1FUN2c0UU15dWtQ?=
 =?utf-8?B?dHRSZ2wrbzgwcStDWUFVam5zYmNrNWFEdXBXM1pyWlpMdWI0czFOanRxVXpC?=
 =?utf-8?B?a1IwUE1FL3l6VmdGS09ERy84UVJid1J0VkRoN2FGam1pcmRHSjRyTEUvZHd2?=
 =?utf-8?B?MUdUejljTDdFakJWTHJENDRKZ0xLR0ZnTzVkbDFJT3J3elZwQit0ejl1TWJK?=
 =?utf-8?B?OE5jWG5LU2NiV1hyTFRVQXZ4Z0NOY0xpa0s5Y3dWS0lPa3RNOTl3RmFTZXY3?=
 =?utf-8?B?M1E4ak9KSEZHUSs4MHg2MS9EaFZPZCtqYzc5M2tCOUM2TFNsUjlINUpQcjE1?=
 =?utf-8?B?cXN6WEE5SE9hQ0pPbU4xYzZISFFGK1VXRVZwVGFpa2NDM1ZmV1d3cjhWN1Ry?=
 =?utf-8?B?dE1lOC93RG1UcEZ6U2pHTjJMMGJuaGNKdEJmeVl0c2hySEh3TkxHUkFwZFZC?=
 =?utf-8?B?UkkrYXJLWTI5UTFhRnQ1TjB0bFdaZ3Nab0RJNWdXMU1qcFBQMFRWdmtKTWdT?=
 =?utf-8?B?SEM3RUdDaS9jSXRHa3NJRkgvMGxyZEFSRG5HUysyQzFVYi9zNjZPUVY0R3JE?=
 =?utf-8?B?dWhvVVpyZnV6c2ZFUklseitJZGpLbko0NElPUUhVcW1oRElsaTcrRXFCRC9u?=
 =?utf-8?B?czhUeHJxeTN3dzFyU3Jrc1dHb1RaSmQ0VEE3Nm4zTFNDMGlsNDc3cWozaGJH?=
 =?utf-8?B?b0U3Y2ZZdmF4MkEwSVh0TEEzZkxPM1Vmdi80VkwzQXQwRWluY0NuZ29HTHpn?=
 =?utf-8?B?ak1GdXdMdGdBWEZobXQzOUY0R1gxb2FhQWtkdC9kMGNMQS8zRWNCQlJiWmUx?=
 =?utf-8?B?S0lFalJKV0Z1T0Vkd1IzWjBLMkl2eEpzOE1qaGo4WnRmNTNrZko2U2lpMHFw?=
 =?utf-8?Q?/CABWn4QugVUbSa9z0d2l8z4A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee730d6-799a-4d0b-2b10-08db5d33ea23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:22:55.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLS7SbbeWp6OCU+tdja7EFqr1rD8Ufjv8NcTVrKFlP2k786iC1jNobit1TDjWjUqbL+Vou5mF8+LJZh2zRDeJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9315

On 25.05.2023 16:54, Roger Pau Monne wrote:
> When traversing the list of pci devices assigned to a domain cope with
> some of them not having the vpci struct allocated. It should be
> possible for the hardware domain to have read-only devices assigned
> that are not handled by vPCI, such support will be added by further
> patches.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I was wondering whether to put an assertion in (permitting both DomXEN
and hwdom, i.e. slightly more relaxed than I had it).

Jan

