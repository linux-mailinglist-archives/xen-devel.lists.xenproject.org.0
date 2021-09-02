Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192A3FE908
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176893.321978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLfm6-000314-8G; Thu, 02 Sep 2021 06:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176893.321978; Thu, 02 Sep 2021 06:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLfm6-0002xk-3X; Thu, 02 Sep 2021 06:00:34 +0000
Received: by outflank-mailman (input) for mailman id 176893;
 Thu, 02 Sep 2021 06:00:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLfm4-0002xe-31
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:00:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1391809c-0bb3-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:00:30 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-_ZlLMGi5PW2ujws4aoQMqA-1; Thu, 02 Sep 2021 08:00:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 06:00:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 06:00:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0030.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:00:27 +0000
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
X-Inumbo-ID: 1391809c-0bb3-11ec-ae3e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630562429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nC+9HmiyN8tVvvPJOvEBYdkLxGcD03BuhBqwPRC12mQ=;
	b=Fvkhcpn5ROPnx59kqiGL7ot1nXCPqsYuIH3SmgyXsw+RwA8QPAPR/2DdrrEicu5ggwV4Xh
	5u4NDPgZiliSPcNCGLTdEuPKGQp6nLjjRUtTnwUzmYOLNMSK2lAOoiABqM2PiuMhlPoFfR
	a54t4Zoocz1RV/AriDcv+iTSsXRj44Q=
X-MC-Unique: _ZlLMGi5PW2ujws4aoQMqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/Myo87nMPuu3OvTsQwALPeycrrQFH4n8VvJ5umuLgQzm/sqKIWQq9VKavtwwRJFEJPTo1++E4QSL8KBikHt0eCdXZEUualqniHI2vD7xAzUh/x5RqMTq4PFg2SqbA135NarC3D91c8BENprXecU+ez1C8dlMz6EeLlYK65GcaI1vzdenUywnSypIJcmOXQyQSGlCVuoblPHjc1pnAnz4w+qsky9QYFx2NrCFaDhQ/EyIJdek1leBl4I6ly2ttdWOyIT2kTNPKMmRT39YQn4KceC7EmLijJesNvg6Bv4GXJmvBVEpFDAKfiSSPY2uDGJxH0i++cOptkN/Lq/ql9Zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbBGseStlkeOTJ5Gdk2wq00BX9kdOoWEm2+cqRGWZDA=;
 b=OzTQufgGHLa22yzQDwIw69LRQoouqhuTV2NzaraOWKoLQ49Uhp6Lm8pqRSkUub2RAAE5qibpT/bSWB4aVF6HxvTm4Yz524VNQAiJecOb/vCZ+5pkfquGb3W3Z6WoJ7bwoGt8FR+HurevEvJVR5dpYhGxbpmN4T+tge/BRWECAIBHCxD4xOl6IFXfsprwPw0jLrzkKHIQiMkCEbUIObHefvdDGQEI8eCppIb3Xzmwo/ngoSohNYb7x83pGpB8UwAWsXz5BC4dh1MZ201Fv+530D4ZbHNdr0XhTyDP39QLGjmyn8Cf2NaSyLWW5C1OAsLfJJAK4hQrMeXwbIsG1B597A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-25-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301740500.17851@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685715E39333597911BAB6FD9ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2108311428040.18862@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857F9954D269AE5EC45093B9ECD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109010920220.17925@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e28f6230-56cc-e716-0dbb-8e1dacec7df2@suse.com>
Date: Thu, 2 Sep 2021 08:00:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <alpine.DEB.2.21.2109010920220.17925@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P193CA0030.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f228516-5502-423e-f163-08d96dd6f673
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6173A83A0CFC0F9D10F6D254B3CE9@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O2x7S07dpmshUk8wFmgnSyV4xuUJ5+sD8h978JYQAP4mD5kqnVB7DL2VCIUwxISvMX3kfP2hVXtvW/2Yr8uR9/kCwcSEMZiFNabEVI1/C+Kun/lD2Mh0ZpDfTeOv/GRJC65LcCldgJ2F5AelADQ5ugdQhHnnYzEhpTClo377FGhVWQJq3NiLSOUmrEGxnBs/g4lD9wQ/ozjpeBoqY7p2ISyM+gYgEdBgjWjNmmFkeqgyT5k2R/FmXuhRKJC+K4hRH468L3PMR9Z5a1Xi4yTI/6N4RLhUJkUhWNg57GInFeqgbJTJ3ejCoP9w2ZPKh6gV4TQ3mm/jkZ1EZWgZiz9qOgt976bSnO9cMGdquZB5PysYrggmB1SEYqU2LypS+7zEt0doPm+L9Ol17vnEAJpufqbsrsqK2hlyFvY3Y0zSjQN3t3AjUz8hz6IglnFt+S2II4DrALPaFOjLaUm6cceillROoAo6CQ9hMS0LsvgPsNZBWTCGNgJ0/Z6+oTX3mHYhaiDXbC0kxC4vXUFOpo1fokRkq9HBETuCFiYMvperAqDiK8CCY1votnPrs8rIFXpXZ13mN7cWqlTPQzN/8xEr8x7Pl/68dPXmTw0E8fQTQqslocR3rWWfXYFBSRH2R9b1zwv1IsyUg79TkxpjNCin0IKJZww1hFAvK6ZkX2+Sr462fqoyRrZuiPohkkgo9cGAvoeX93vR3CZCSxE90dn8ZdPpJdxXSgjDV+5owlHjqXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(376002)(346002)(136003)(36756003)(8676002)(2616005)(8936002)(6486002)(956004)(86362001)(26005)(110136005)(66556008)(66476007)(53546011)(54906003)(16576012)(316002)(31696002)(66946007)(478600001)(4326008)(38100700002)(31686004)(186003)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aY/riTP+rSmQ6CrbF/9tBbS0He25OlEingMszT5jU8d7dBShRYlVbNVpP381?=
 =?us-ascii?Q?96e5Erg5treQfk0U8ky7rs6krtp5v0ucrV83a3A9MVbEZW3q6e7DdrFqvdRd?=
 =?us-ascii?Q?ViR/z1W1Tb7xCBsC5ebrNrN/mPYv/njFBPgpLi3jPaF7IW0WmkGY9+Oij7V/?=
 =?us-ascii?Q?hFiM3NZI3VJMa2FNXf+0pYYYNpJPSpjlwSTx+CY/k2fFEs0MqcUKMjTTOsCw?=
 =?us-ascii?Q?yTD2n57sbhrPFW4myHGQ06uYKruNIju+vlnf4+HP82zbHhd4qvkSaBx94O2J?=
 =?us-ascii?Q?jIxl0kNIFRzOaw9wqP4leEBpg12nS23Ox0m9eWhfW/Zuj71X4cxJMORaNGod?=
 =?us-ascii?Q?Qo9x7FTQzUDfP0G2FhIaog2ntAW3yM1wygXf9EO0Y62S4+UPB1a7JIGhj0lw?=
 =?us-ascii?Q?LG0Xw+mh3+RLWtyutEX5ZQzwIZ/Ed7dAuZjd5sLJ4PZ83ni4wCoXzb3QTOV9?=
 =?us-ascii?Q?rqPupBOOIjPuyvjp4M4WvCMEiu9kz+WxBDojwQ2ev02YSEG2f7nDKmzI5XRY?=
 =?us-ascii?Q?1LZ6xtZv46gYRXdwjcwdRl0zSwXdSw5q77xkrECNk81nVM+5xcsN9YLWAMLd?=
 =?us-ascii?Q?GuiGJtspya9MF0UGZGlzOVE7MUslno2LlO4kffoziNiFrC5hdnv8XJwr7O9o?=
 =?us-ascii?Q?3q3ZRKbMTM3C7qmTE7IT3GOap/47MnklCEjH1/3MOnkilvGSZre4b2stkKle?=
 =?us-ascii?Q?wqG/T0RJfJsg0g/B2/tH/NlwlQtQf69quY7ILwpQgvXcjCLq5qYMf/bCgAA+?=
 =?us-ascii?Q?mJ7Zkt5CXhsaicm9VGCpASm7YvbiHqGAUYTROW7nLMTvH4jKknkV6pd8BMwb?=
 =?us-ascii?Q?2RopmJMXERhN/6fVyId3ZQ7tbtrAot1n+SsNH4Tkgsahmv8RuZBHHBNgct9U?=
 =?us-ascii?Q?VNpqpAdw8UIsAFjdDHWUt1LrsBQ+FnZRVbxUWMcjXT1jkYs81y1enrmErtok?=
 =?us-ascii?Q?MbdJJ0wQAZCFYaO48OsjnCvj7M+/0iJm0csfpHf08F1NibqypQaZvfsE8Hix?=
 =?us-ascii?Q?EQlVOdOLZQqMnVyhN7lUgdi/N6X9G8kMu6QGsqBzajmwb0hjs3g1rpwZdHVj?=
 =?us-ascii?Q?vEXhbFlAn5UJ3Wz9BgDuF9/L5FY/HTv+zm2+8RzChtykvBcwNSr3EnZtg+9h?=
 =?us-ascii?Q?jnlyugydMwCLuQ6L0UsTxUSI5Eu7zuYZvMIQMBKa7L+LXY36Hefac0z43A4z?=
 =?us-ascii?Q?DvdHVopqQGaRDj0XxJxXpZAIe+ZyGxtIWi6eMq06c+/782/Tj565WRLxmTZa?=
 =?us-ascii?Q?sPLEFTZXA+EJUm31TSUMKI1Q03eF/eL1BK0dkxstmWkDgD/p8q09SRnTZ5V2?=
 =?us-ascii?Q?SmAaZqTOnFDgteEfoiVvedqt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f228516-5502-423e-f163-08d96dd6f673
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:00:27.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojAZtHKtXPbvmBV18kYQwwWXzK5+2ZhSpSLMDwdvfKajnYIXRj76IaWkTEWPvatnKOANlthkfo18EKIXFcAlAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 01.09.2021 18:21, Stefano Stabellini wrote:
> On Wed, 1 Sep 2021, Wei Chen wrote:
>>> Stefano Stabellini
>>> Sent: 2021=E5=B9=B49=E6=9C=881=E6=97=A5 5:36
>>>
>>> On Tue, 31 Aug 2021, Wei Chen wrote:
>>>> I don't really like this implementation. I want the behavior of
>>>> numa_set_distance just like the function name, do not include
>>>> implicit operations. Otherwise, except the user read this function
>>>> implementation before he use it, he probably doesn't know this
>>>> function has done so many things.
>>>
>>> You can leave numa_set_distance as-is without any implicit operations.
>>>
>>> In that case, just call numa_set_distance twice from numa_set_distance
>>> for both from/to and to/from. numa_set_distance could return error is
>>
>> I am OK for the first sentence. But...
>>
>>> the entry was already set to a different value or success otherwise
>>> (also in the case it was already set to the same value). This would
>>
>> ... I prefer not to check the previous value. Subsequent numa_set_distan=
ce
>> call will override previous calls. Keep numa_set_distance as simple as
>> it can. And when you pass new data to numa_set_distance, it doesn't
>> know whether the previous data was correct or the new data is correct.
>> Only caller may have known. =20
>=20
> That might be OK but if not numa_set_distance then somebody else needs
> to check against overwriting previous values. That is to be able to spot
> bad device tree cases like:
>=20
>   0 1 20
>   1 0 40

What's wrong with this? At least the ACPI spec cares to specifically
permit this case:

"Except for the relative distance from a System Locality to itself,
 each relative distance is stored twice in the matrix. This provides
 the capability to describe the scenario where the relative distances
 for the two directions between System Localities is different."

Jan


