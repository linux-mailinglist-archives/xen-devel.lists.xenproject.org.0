Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43768477978
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248085.427879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtp3-00046E-O9; Thu, 16 Dec 2021 16:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248085.427879; Thu, 16 Dec 2021 16:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtp3-00044R-L0; Thu, 16 Dec 2021 16:41:37 +0000
Received: by outflank-mailman (input) for mailman id 248085;
 Thu, 16 Dec 2021 16:41:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxtp2-00044L-87
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:41:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 080d39ee-5e8f-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 17:41:35 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-6ovnGGmgMl-a_GW1CjFfxA-1; Thu, 16 Dec 2021 17:41:33 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR0402MB3780.eurprd04.prod.outlook.com (2603:10a6:208:f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 16:41:32 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:41:32 +0000
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
X-Inumbo-ID: 080d39ee-5e8f-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639672894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luB+Mf7pJjnqPCitBgL8p9zUUUYOQDkRsBJj5q8aClE=;
	b=DIfGj6rEqcH93DiT1bgEtVXdm/+EWWCsVNMa1ew0CR/dB4YaFPl/ridMfl2onB3CTVMAdc
	F18Et84hiSx5cQEUpYjjy4v3bHSAGRvE4uEQx+Nii2CCVnAXiZIKBC3Wd2Sg9BGtmSQe+r
	6Tt5QnW3kAWvl/nnxuAsUy18E+uBwlY=
X-MC-Unique: 6ovnGGmgMl-a_GW1CjFfxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROtTL+gZukwPxFeDPeC/Bw5P3VubSPx9/Rncx7fgd2c3HdnnTk6tLCVWoVcsTyw2TEuNwN7DrHA3gEqFgNfoWNXHOSOiW9x45wVtPEkkl9YC8fovveMASV3pwSgAew5a9GJYd0xNfI3ofURKP0nwVEboxFfup8qq2GHHKmprkAER3HMKHIaCd6DP5r+YZEqmpWsciTeu6cnVmXPyzmJaLY808WdW5agYrRG6IRkDzyK539CUIehpMlxxbc6q9Mg1b2rJCy3cx0/HwONoizCYcFBMmB3oe/GQzKIYNkE5AWVb8ZlioAb43wsh3xBiCF6FoS3mHgxjNlAEgiudDKF0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luB+Mf7pJjnqPCitBgL8p9zUUUYOQDkRsBJj5q8aClE=;
 b=cWSXFw61HYh7v74i80Xl9FgE5ADRFHyH6U1Rtlkx2vp4pZsAuNv90idiuKoOsWNB5QFcbD2KbKmK+wuD50qmzWI6zzBvod12dsg7zjEstGPCb+MvOz/T4KTBuLKWkbBiHlcOrOYKfGrI3ABV6Rog8+KtnZqHKJtwdns+mPrmIVcSdjD/LGCJRuTAcvFXhbLJ+yj3jI9BP0VeThTTpQCdmbRCroCtzLN1MWAPJXkoqqpw0SL1MmjNll0r5T70wRuyNXh6OqSrpduhgDt3qYoDWRVOKPVfrT5r8qNlddIGEFChlI1AL/VOOF00JkO+TP/IzutznhZZ4whasE8LP5ihyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49a6035e-9291-7a67-ad78-be6ebde79def@suse.com>
Date: Thu, 16 Dec 2021 17:41:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/4] x86/cpuid: Factor common parsing out of
 parse_xen_cpuid()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211215222115.6829-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0037.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::25) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf05c5a0-887c-4ff1-2d03-08d9c0b2eaa6
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3780:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB378068092DFDB75E3412F234B3779@AM0PR0402MB3780.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UQPMZb9e58ep8deNMqQNIEZGnAJ7zX+WA5ypVYxoX++/B20xugTyWLhVlGbhG3eR+6R92t5zasvlVVhf7677s1uRygUHfJXRXfQ/l0gm3RLz/UUzrnbdufn29G8duGYILZW7uTrJhWwf4+WqyzmI5dXE8vCJreqqmE/R78RKBeAGF7f80Fursf/8SIl4DR0ueqX23SoMpJzgourfes1va1/mBlm3nuanUXAbKZxrbdoM/7gzyA25JiIFweiOlaGeZZceylqOtZSkrmtMxAUQazDY0Ve3MKSB9iqD/w2ska2ASMlptUPcoq7JgegJWHM6Iaz/q4UnRWlqkMpGy78DOI+y9rxbXG/F6DWR8eelafGILuavNX8BQiTd58FqfEB1/9lrZzwXsd7LnzoV0waiwKVs3Dq9pQPEqfaXWZzFS8X9heuzwTSq/EDAbgN2yjHqm0TrueBWWFISv7ysE4muEOHHhsGoFWYDrSaIFTxqgzlBFfyKjDGtooLE4iZe0ioPLYAE+OWFIJ118o74s8FE1iN0B3Ia+W714Er1eEC7ixjBCHttgYD5YZrSbjzuMgUuv9Ez4ma3Rv/geVQawuiVuMSNhM/LpS64pHGVOgpHLQHrIt0X1DTX6hRh5LlrS3Sv2fJf+PaEw9qHjMb60Ylv7GCrSmeTwB0tqtB5B44iKbbABvbNtso7ho3y0JPS+Us4uFJC8yjHtwHKhvNy82GpvgWagKYa8uLtZbFdirPYJQgKrhdOkSQFN3xvG5PPUC+VIANZV/7IJH26YBen/9oEc9kDVenLne8n5OIRp1mht4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(4744005)(508600001)(66556008)(66476007)(2906002)(186003)(6486002)(26005)(6916009)(316002)(36756003)(86362001)(31686004)(54906003)(31696002)(8936002)(6512007)(66946007)(53546011)(38100700002)(8676002)(4326008)(6506007)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXRQUzNMNXVDUTkyZUV4SkZ4UzZvZGVJbThRRittT3lucnBnb043bytyS0Jj?=
 =?utf-8?B?bnNFeE1sNUFOcFd0ZW91WTRZR0tVZEMrT2E3S01GQ1RaNGJubDJ2U0VKa1NH?=
 =?utf-8?B?RlV1MjVraXVTdEZsdzV2Zmp4SU82aUp5eTR3bVJsdGJOcktlMzJlbmhFUWdK?=
 =?utf-8?B?dm9JN2xJem8zYUhTajhwWllrb3BNWFM3eTNzU1dEOG5ycVB6dHJpY3RxdGFa?=
 =?utf-8?B?aHY2SWZ4MUtpY2hJUFdnbHZmeVlianl0QjZJeDNDb2dOUklCSVFFaXNzcWVz?=
 =?utf-8?B?Vy9tQjFiNEROcmQ0Y3BYakhCL2hCTkhJRTl3UlQ4aEYvcHBUSmdSaTVFcEUv?=
 =?utf-8?B?bWozOHBFN1FKSTdkVmxHd0dqMGFmRW9PTmJDNGZRb0VoY3ZXMDhRenRaR3Rq?=
 =?utf-8?B?M1RCbjFWQmV3VjhOQzFkZTMxcUVWb0d0cEp4d2I5RGwrbEhCbDJWTDdwd1Nr?=
 =?utf-8?B?YldHR0dzS040amw5N1Fxc2hqQm1CYXJsL3NKOW14bXRaU3hwckZPM1MyYkJJ?=
 =?utf-8?B?M0hxSStDZzV3cHJIaWgrTnpLOXhkRFkrNC9PcVhOSS84ejBlZzJjRG5NZzdI?=
 =?utf-8?B?R2c3d2tQMUtEMW8wUWt5anZKa29BOFc2TnZnUlJIaHduT1VuRGx2Smx1dkVN?=
 =?utf-8?B?a2JTYnV1K3lQdEZHekdhVUlCZno4ZldMZ1JqWU9Yb1p3djQ5eThnbUdKeFN4?=
 =?utf-8?B?cGxYNExwd00yOGRJbllYZFkvSWhhSjNNSm9YdzAvaitYb2tNdXVjM2RES0dj?=
 =?utf-8?B?OWNYclFUcEJ0N3dXY01LelRnWHRiRU1OMHpWN2NoMjdIamphd0RoVEtEeVZM?=
 =?utf-8?B?K3BLYVduVVhWUjNDWWxWNVRFdFdZd0NxZUFaOUd2VmlwbmpERWgzbEpReEsw?=
 =?utf-8?B?TWZHYzNUVGtSd2d0NHNXaUVNL0VrQjFyNVB2a081RktuR21kVldITHZvazVJ?=
 =?utf-8?B?a0lrbWg5MUZOSWp3SGFXS3lySzdpU0VBVS9VeGRJY2U5bHpQc1JjMzFIMVNY?=
 =?utf-8?B?N3I3QUprTm9jRDQvc0RjV2J0TFkyTVBkZ2ErV3NMV250NTR5Q2hxR0thT2xI?=
 =?utf-8?B?VVVDS1JQVjdLanBqZVhVdWR4NnR3RVU5NWcrNUpzSHNXVC9TYWg2OVR2Wmdp?=
 =?utf-8?B?L0Z2YmZTYndXd05vUXpOOFM4TUJQTE9aYllkeFRIZUJVU2gvMXFLNld5Yitm?=
 =?utf-8?B?Z1k4OXhheFl4YWRMMk00OGRkc1lXN0RMUzBYSXBUWXQ0VDlJbnRIbFNWZ29Z?=
 =?utf-8?B?M3pJZXBsMHdJMTI0N05BUHg0YTBkZnV6TmQzN3lvUFZFZTcwYTA3clFuZ2Fn?=
 =?utf-8?B?MCt0anlJZEZucGt1Q292Sm9aV21JQVRWUzdnMXRKSlZTZHlyaloxdi92VkN3?=
 =?utf-8?B?NFBtMjRJOUlqL0NUMjZWY1ZWRGtXOU9aUFgwZmh4Ui9LNFUrbVZIRUg3VkVZ?=
 =?utf-8?B?SGdFRWVjcVZYT2MySFJybTRVWnlPanNYeTZVZDdFaDFPZjBaeFpxNEVkL3Zq?=
 =?utf-8?B?TlR0QkR5R2hFc1FZZkdzakhUU2lPM01KaC9EQUFTaFk1OUJTUUc1c21CYWpN?=
 =?utf-8?B?YUVKNTNsR2t0Z01sWDE5bW5VS2lxMVpmNHpJQVd6c1dsSitGbEtqdWRRMVZW?=
 =?utf-8?B?eWwzNzdMeExuSFQzOEhCRjJSaWw4NVZGMXduUFE2Y3J2QVdOWS9GcGdUdEND?=
 =?utf-8?B?YWlzSHk2elFOYU9kU2dmN3I4V2t3OFhFV041aDBNYXdEcmkwbmR5bGZpTnA2?=
 =?utf-8?B?aUFBT3JkZlBFV3NTWHpxV2RHREErcVZTdkluOU9pRm1Qdk5tNlo3ZnFVa1JF?=
 =?utf-8?B?L0JSZENBSG5GakVtUjFldlN6RUxZeDdvSXhnSFJHbGxuOVdmZ1c3ZHIzNS91?=
 =?utf-8?B?MVkrelUyOXg2cHdyMCt0WVZEMDFPNE5kWUIxeUV2djNMZ0QvVndpOTZ5TXJ2?=
 =?utf-8?B?L2s0RmprYnhpbUxSUlZBbFRNVmNQNjVTclVCYjdMcUxYK1kxUHY1RUw5T2hU?=
 =?utf-8?B?bndsd1ZobSttdDJ2VzlZblZGVzB1cGtESTRRVlZhckpkZXNYcVRMS2Rua1N2?=
 =?utf-8?B?SnRRRU54RFkvbGswTjZVaDhTNGdXaHR0N1YzMytkK3JuSm93MFYyMmwzb2hh?=
 =?utf-8?B?d3VyVlNVb1lZa3daaEpwWTV2bk8rNVhsb1ZlMVpDaTZtcjFRMytZcjgyd0Q3?=
 =?utf-8?Q?+jBVC/8bPyzpw5Xn9YvlU2k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf05c5a0-887c-4ff1-2d03-08d9c0b2eaa6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:41:32.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVg2z3LLlrWpm7WNc1XOT9fnDmxS44Rs/9q4PWx8qWrJ31O5XnGV6j4xh3VPEdGHxjUyiow7KYcI4nOxKq8jTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3780

On 15.12.2021 23:21, Andrew Cooper wrote:
> dom0-cpuid= is going to want to reuse the common parsing loop, so factor it
> out into parse_cpuid().
> 
> Irritatingly, despite being static const, the features[] array gets duplicated
> each time parse_cpuid() is inlined.  As it is a large (and ever growing with
> new CPU features) datastructure, move it to being file scope so all inlines
> use the same single object.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> We probably want to be wary of fallout from this pattern elsewhere.  I only
> noticed it by chance.

While that sounds at least close to a bug, there might by some subtle reason
for why they have to do it that way.

Jan


