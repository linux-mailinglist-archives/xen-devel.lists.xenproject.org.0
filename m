Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB564B5378
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272383.467207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcVL-00073W-Sz; Mon, 14 Feb 2022 14:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272383.467207; Mon, 14 Feb 2022 14:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcVL-00070c-Ps; Mon, 14 Feb 2022 14:39:03 +0000
Received: by outflank-mailman (input) for mailman id 272383;
 Mon, 14 Feb 2022 14:39:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJcVJ-00070L-Gr
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:39:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8b769d7-8da3-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:38:59 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-S3auIpQPMvutrH3u2J2FIA-2; Mon, 14 Feb 2022 15:38:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7796.eurprd04.prod.outlook.com (2603:10a6:20b:243::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:38:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 14:38:55 +0000
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
X-Inumbo-ID: d8b769d7-8da3-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644849539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsXDWh1/LX/yCotIya6tDIMr+1L8uDfwXUu8ABfr2oA=;
	b=I8ap613qYWa6v6Hp3QUoQbgLDK8fXdKe5sgzfqbuAmhc/U4ZqQXXBaMZPEQpomY6oE+HJq
	yYaG+kRsGNCX5xFJI+uXa9dcxB53FRdQTDOC9CtafJuCv88CxI/UZeCEqEeWcN9n8u6jHy
	uEPVEEtj2TKi05Q0QlnAqo2PQJEZ42E=
X-MC-Unique: S3auIpQPMvutrH3u2J2FIA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfNVlg0tQUh0Cj/mxL0NymTtJYSL9IRusaC76Af1Zc3USbPcmUfkvWxp8eE/Gc/QOFGnaQWS/BHecn1UqwtJsRFa2plxZKj/65ZsVt68UgAqItswjdpsDEgMSbDNYQBp3yL6lv/R1vSeAqD1+gUMQTJvba/h4nn1MnA2ZQ5+gk63Qi69+5J+jkqwW51yVbVCF5pRFqh0DXyj5TCwO1MDjSwLb979s0uqiAj/itBIgr/CEEO+4SAmrXeeEYZ2JWJwSh1R7uNV693DdtxT7CZxVvOJCusjwIbVyQaIZq1c9qdX5jHSxE094v6HTywySrm2iJVM6sjUB+qwHj5MI6BcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW0R6CNu1PHJKhRVZskWODYz0c04fKeDGBd6HyYD2sU=;
 b=Dq0UW3MiN1EYjdiv8trX8KGaLCxgGb5Z+U2Az7eoK/6ctwEKzZtw2oY9TLXXdcBtzO4E0flxI86d75LEr2spUUnKJyxpCfgTpHXOraOZqTwuUueA1lFr7aOJc4cfwILsAx+BHut9lHvBwg8U1Et9UDOw+fYb8zGlNI/cE0TKaob2GFeMR3qSdK32NUmT6lY8/D5mhTwYoLcg+B4AYHKRC43N5npBLNBQ+6t7vaFTb+KLZNIMRoM/+e7l3VEmywQWbYTt1jSpiTetGchU1+YDd3LD1CsSjcinmm7vcaiYCOU9uvEA3PfKQi37cS3GOiZ7C/bjH/SrbYyXIU3l6jZw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83e15c5d-f48b-a6f2-ebca-e416bdef1093@suse.com>
Date: Mon, 14 Feb 2022 15:38:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <c471dcc2-8a91-60b8-ba5d-58874752e4d7@citrix.com>
 <218de2dc-6dd8-4e13-3288-36448e47de7f@suse.com>
 <8c6dd7d0-11e6-9b8a-66fc-f1a4998c074b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c6dd7d0-11e6-9b8a-66fc-f1a4998c074b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0024.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31442264-b660-4bb4-abb1-08d9efc7b9fc
X-MS-TrafficTypeDiagnostic: AM8PR04MB7796:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7796E31E30AD786A95DA1500B3339@AM8PR04MB7796.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V8bANfzkxlTsT4iUCuBAB9lzwU54XWM5siLdf3AMiTDphpjreYLE2rkckaypXVbkffgPE6jt/HSWOGOwaOlBSAI0vXDNOAFtI3jY/w3y666cyUWBYZiOb9Bs2UH02Onzvp2BkPAt2IDuxc+ag1Jo29YOobQVrA6XFb8CWuB5qURVMa2SXyv+I379+2DXL3l+S3iD8D8OJzaqGw/Qgx90R5FEPYB1msJVkIPbwq3cMcrmzmBZC13ajIDqJQASJev9TnFO55dD4njt+SmIwTUQaWPfGJjJUTqRwE6TwlC9T4VcaiWDGuZF1jP2ueLgKHFgS04llHNnQq1qefPtlEb6tU0krzGtvG1SVmzFv+TgAdcF93mIKAA4491HUIzzd3SZAenwEs1gOuL+Uk4QtY1OTMxFUvDfUr7j5n8rFu7NHrEmp7rg4pYHZZr64flHQy4ov+3ora3zKu34reqQX2Ty5+3GE7epf8PHLZsBJ2tbjRVTIWlloGax0fO+ZrR/xoAtHkItvJwfD9lnyNg8T2OxkkFMiuaFs7Rau2PYS92YmK/qPDNjrR4KehZ7askgM4Rl8LbfFDY9L0dZRNhdF8hHVRdAMaiE4P3s2cn87QBj/3XIycVZk/5zWhqq0O+gUUi1BOpAb9+p/So9ZEL07G6KHWPFywe8vUwEgKSyy8o8/Yk1Vad7uYoP6gARXiTVREe3QKlnqPgPIF9Nkp12NVeeTfWtGjsRkRoFeCzALjCEgjRX/SkgYObVHwCvhhHxwwb04XpeIJr7kTmq4p2I8U4Pjle+4VJHlDAgLyyTCdBg5uHy9ytehImhS7jgrJo8MV4F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(36756003)(31686004)(110136005)(6666004)(54906003)(2616005)(2906002)(31696002)(86362001)(316002)(966005)(6486002)(6512007)(66476007)(66556008)(66946007)(8676002)(38100700002)(5660300002)(26005)(186003)(8936002)(53546011)(4326008)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9/UwChijAU984aDmci27Mr1B/ceBn5qB8QvkAhHWnSrBXvztaBvTfXnoSA/0?=
 =?us-ascii?Q?nb1QWNvhpi06ouemYZaVXEOkJ5nhahz76G8dq8ikex00PCV1BMMvpd99XmtT?=
 =?us-ascii?Q?r6Plxw8I+5rYg6YsfDdbgryUiOtg5jylmI3Qt4x+0qAiNlUf/0qec6gnkKuL?=
 =?us-ascii?Q?nn+R0qgzhXfj2U0jIv1eb5qm7BhQbVFr3i+xPBxt/ol4mKVD2X0yFFetSos9?=
 =?us-ascii?Q?Brs7t4OeOx5KJ69xSFislVsGEY++pxb5FUmrzm/4WWbMsDcdNJYV0JIs4i9a?=
 =?us-ascii?Q?Y2X5kNKVfeazp8UIGO3uFlnhAlgqlMe15tfqgmobpx7UBW59UitZ5d/J/z4j?=
 =?us-ascii?Q?2cC5ez3diWVeyK3LfUK8dsIWpNoCCqkCiJaNNckMjXU1SEKmrMO5ktLLgYy+?=
 =?us-ascii?Q?WgB+6MjM7njEdfhqP9AtpBto6/I2pAPTeBILVHXdGvv6p2fX2pEAovNuUqRV?=
 =?us-ascii?Q?YXgvGNLZNuOAXOfGzSIjxl1cz/U0KgFtojdgejQ5KJa8HYUF0tQYTQBS/oPM?=
 =?us-ascii?Q?OZEc7VErFnap4kJHW0q9T5zitBB2HFyt2TwZxIjDp1AU8e0X5eNxhj10J6IF?=
 =?us-ascii?Q?5R5AXwjPCA7+R+efqPe0rJRhbku7/YfIbwE5pptv7FHXg6kwnXm+uGt/nHzY?=
 =?us-ascii?Q?qiXKcksN204U5ib/sTz/rdN6WFCGlGMP3M6vNEUgo9oEPUgH+sJ7mUH7N1YY?=
 =?us-ascii?Q?GMLRcmHMDsFNRnrKfS6jmQ3hw+E80Tw2TO6cfCld4kpjIcrGgsnJRIzLN9xm?=
 =?us-ascii?Q?VhNYfFtv4ljXD+pln+bTOzFubyt/BybV7A/vyK49VyrN5I1C8ihVS4bkChas?=
 =?us-ascii?Q?cdkKC7oK574+tUUzGH5BjHVaiKMSPQL8LOjD+XyKR8001U7a02J+wJ+f8MZj?=
 =?us-ascii?Q?hPyK+lqkLOQDXNuSjkFi0U0Md02m1vXoHeuwvRYL/g9Mw4Or+DG67ND27Eq7?=
 =?us-ascii?Q?8Qd31zZy0L+GNHQuBFW/0AayMyVzRlq5vhgPR9iaoFsDyiAAPwcQw1BjBbEQ?=
 =?us-ascii?Q?e9D2O3EmO8fJeOjlPeNRuxKWhuv9hRxbPFO72jMWshSN7GLNwZLAv4KXF3Uy?=
 =?us-ascii?Q?6dOVKwvXyESkV/KOrTJSkXNtcX3G+hiJZ9TM/zChnyHPgqsHLIZomVDrauOY?=
 =?us-ascii?Q?fuMhL87w4m5AAk1zBKEGz/OxR0n9ODms+ZoqZDvLmQYygN2Y18bta/+19/3s?=
 =?us-ascii?Q?LBQhYj1mv9HjdYBmJTYgq/Eus7OJCkHDteHIm7DASB3YYxwU1diIJjckfl+w?=
 =?us-ascii?Q?kNqOEH4QxHMdqsYyBn0ccX0u1xDQtr31jNiZFz5o8d6lCEfj7Ea5EN0kzDQP?=
 =?us-ascii?Q?PH0MmWjVF9BVa2qsFXqk04+5fNlT9NPaeOidO/JjS7+Yw+grc9I/hDJv3N0d?=
 =?us-ascii?Q?gHERmUEH9XrTZzrONeJRz2j3+Jb/JQEmWYH3P6Jv3Sw3Jq/UqutnEbe2DGwT?=
 =?us-ascii?Q?jWptsPpbVMdSfvadB30Qex7oujVIBzq722Gia6/4GMLPhgVE4fywlM0qcvKk?=
 =?us-ascii?Q?kBtKTCbeDaJOGxvPAoLMZyWCYpxV+fX6QSTL9FYs3lIDavZYd/zci8jX+wfw?=
 =?us-ascii?Q?C31fUoaZM/ked66LK1LNI7xw6loW+pvWs9ewsu/rmLg+kTuN/mndBpYK11Bo?=
 =?us-ascii?Q?A6epilWhBeZVgJV6JsHd+1E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31442264-b660-4bb4-abb1-08d9efc7b9fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 14:38:54.8916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uu2lrXZMVBTwqPmoPqnYK/bp/XnPi4Mantb3z2zvskaLznnyhwvMf8YcEBY1VWFro3u1zOXKG6YhD8qoxAcXYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7796

On 14.02.2022 15:15, Andrew Cooper wrote:
> On 14/02/2022 13:43, Jan Beulich wrote:
>> On 14.02.2022 14:10, Andrew Cooper wrote:
>>> On 14/02/2022 12:50, Andrew Cooper wrote:
>>>> CET Indirect Branch Tracking is a hardware feature designed to protect=
 against
>>>> forward-edge control flow hijacking (Call/Jump oriented programming), =
and is a
>>>> companion feature to CET Shadow Stacks added in Xen 4.14.
>>>>
>>>> Patches 1 thru 5 are prerequisites.  Patches 6 thru 60 are fairly mech=
anical
>>>> annotations of function pointer targets.  Patches 61 thru 70 are the f=
inal
>>>> enablement of CET-IBT.
>>>>
>>>> This series functions correctly with GCC 9 and later, although an expe=
rimental
>>>> GCC patch is required to get more helpful typechecking at build time.
>>>>
>>>> Tested on a TigerLake NUC.
>>>>
>>>> CI pipelines:
>>>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/470453=
652
>>>>   https://cirrus-ci.com/build/4962308362338304
>>>>
>>>> Major changes from v1:
>>>>  * Boilerplate for mechanical commits
>>>>  * UEFI runtime services unconditionally disable IBT
>>>>  * Comprehensive build time check for embedded endbr's
>>> There's one thing I considered, and wanted to discuss.
>>>
>>> I'm tempted to rename cf_check to cfi for the function annotation, as
>>> it's shorter without reducing clarity.
>> What would the 'i' stand for in this acronym?
>=20
> The class of techniques is called Control Flow Integrity.
>=20
>>  Irrespective of the answer
>> I'd like to point out the name collision with the CFI directives at
>> assembler level. This isn't necessarily an objection (I'm certainly for
>> shortening), but we want to avoid introducing confusion.
>=20
> I doubt there is confusion to be had here.=C2=A0 One is entirely a compil=
er
> construct which turns into ENDBR64 instructions in the assembler, and
> one is a general toolchain construct we explicitly disable.

Hmm. I'm still at best half convinced. Plus we generally have been
naming our shorthands after the actual attribute names. By using
"cfi" such a connection would also be largely lost. Roger, Wei,
others - do you opinions either way?

Jan


