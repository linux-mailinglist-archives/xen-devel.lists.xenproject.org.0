Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FF4316CA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212048.369785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQRV-0000ro-UW; Mon, 18 Oct 2021 11:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212048.369785; Mon, 18 Oct 2021 11:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQRV-0000pf-RP; Mon, 18 Oct 2021 11:04:33 +0000
Received: by outflank-mailman (input) for mailman id 212048;
 Mon, 18 Oct 2021 11:04:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcQRU-0000pU-L9
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:04:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7312a911-5284-4017-a3a9-32b137fd0b24;
 Mon, 18 Oct 2021 11:04:31 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-AwK0v_GfNcGEYgd1ciBJdg-1;
 Mon, 18 Oct 2021 13:04:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 11:04:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:04:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0060.eurprd05.prod.outlook.com (2603:10a6:20b:489::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 11:04:26 +0000
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
X-Inumbo-ID: 7312a911-5284-4017-a3a9-32b137fd0b24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634555070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGGMYNRt0HUNitdLSdjPGHmL1pFvMNeiIbsE5v9tXCY=;
	b=cWd+N6Wsr+9dcOKlTS5fCBhsAUa2DM1ezm/yc0jM3QtvmbyZZV0zU0SS5XfJmTD+A8F9NZ
	uPD8TQoVNyMukbxQoQV9E7odhLf3PA6EZmStR3iSFwtJ7oBSP/YUvlGKotHi5BqOWjO6jb
	Pc1VYLAs6smbRQdjiKskaci/hu7fGj4=
X-MC-Unique: AwK0v_GfNcGEYgd1ciBJdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6jpUNQciW16pLd4BcYEZ5JsGR+I/65hdeSHwoCGpmy/+JMnGNwyAeFNtH2iIwW/yF3NHVwEFe35O+ByC9oPBTnX279HfQb2sccpC2LTlEWOyBkqHW0tz8BMHpb7Q1DjsxFUN2dgd+0hwPJGfXrHkS1kw+/vqH6lL1Lddf+c8/JwJ3ONAT/zJa3K9jrvA1OKmRklJU0WSVBy6z12WVxtJzld5oeQFXqYipQnKgVPETQyruHtmiDFGucfUl2TOqY6bidV4K+pIqn+6eTzg7PnZg3C4q8fnuCR4X20RGRnLphmOeiorkjL/22sSQL5kk6CSPI4ZAA+2nXTSxwFNM1Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT3bgD1N2M3YaOibhdjUYNEepol+J8HxI2jA1wA9PIo=;
 b=FbyHvVWM68xZz2m7LlQt8R+SpFTZW6tfZWcnFZw+qpqRWrPIO61CRg8LfJdULLAut1jebIG1IvcNgq52TXKTI7ZNU7/7Xj6beKvVnAhpraDVsF4x1mLNtpWMh8THyQFavz1buXgGKlBBBxGM1Roz0KGe/by5Q4MMTvuzgZM8inwfuhX90JtdLj4QY7kFYx7IXl+zHP3bJJ0srRr3G/mNRHYoZ5TFP7PMiSm7CJzKuzCSFOb2FeDykdyc9a2cxqwxA8HP6+ylHR24w5lkVJtxyzyxenOTtYu11OtNE0iSwrhU9Ibr89I03rW5+mq32rqdxJQVRTP9+NY4MPV6gZyHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
 <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
 <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
 <alpine.DEB.2.21.2110151235100.31303@sstabellini-ThinkPad-T480s>
 <YWqpQyKvNzE8GYda@MacBook-Air-de-Roger.local>
 <2b6c80de-f71a-b32e-340f-130f62d9dfd5@suse.com>
 <24941.20117.330072.580007@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91920ca1-7d80-e4c7-b567-adeedda1c885@suse.com>
Date: Mon, 18 Oct 2021 13:04:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24941.20117.330072.580007@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0060.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9b5c97d-53df-421d-7cfe-08d992270d61
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6302D10909B6E026433AC49CB3BC9@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jqG0Gd4Cp4uWsKVv+cQdlVA0NZVfXPeopMwQxigij5OuVL13rIZKwAeiJepYOuYACPLplm/zKxsv81/qN+gU/CeEj2fCKQwHAZtqk2zO6R335f9SFObgb5PL+YoALcG1+ctbNXZaONS1YakKtWqVkgCjD5WesdkfA9IEMcRSxESKeLfQwXa+nic9K0TB+98LWfSy7x/9bXNR5Zt1CwAWJKNqSnK0U6BJ4LZosjgDO5AJvEUnXd23cbb5wS2eHgVKXZzmqscQcRiajtb3NyjDPZaZYuko2P9Be2dHa+bDgZgeFb3mXfR9AuXXPMVtmE7ophfY9y6LXHhOjwkbS//D0CRl6yaYzOh9SRoo5wyVC6mHorntjk5sSrzJOuwk5KwzrXv5x7+o7/BvpDV0GBcMPO7RXWkrmfBMlSYdkpzunj9G+ex7xTGS+HyLc76aQgpYgqIj1/RdQaZKVn89XViufem9riqKbNtu4OGIMpph4xXVvZ2eVn5J2xYzKlXr3DaN7eeFDKtFDs0jZPm9Jfqrlg7ZLHaArdvoCCe2JoCMLMc2uhkbmprX9ARmHx/V2Pdii0kdUtSYoyHEgqNDUiBFIfzl3Ys/aL4CMEe/hBhBlMniQnLcQh5QMB3nqcY/gBhgQ5g1yIwdEYZC2Jenb1+r0HWfGOAw/QW/z4gUI3voYzfBQMMXt4D1lb4jrYACGflEYTMfbFtbhu/rl8e9o9aVwK0dOik70xHy+A6kSEAQoK8UKJSs59sGwtdknf41zwar
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66556008)(6486002)(2616005)(66476007)(36756003)(508600001)(8676002)(38100700002)(54906003)(66946007)(186003)(4326008)(316002)(16576012)(5660300002)(8936002)(7416002)(2906002)(86362001)(31696002)(53546011)(31686004)(956004)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LHSMdAkar3obbkM/P27HTsi8Cqrr6PGg8E48qRu9C9fCXaKEkxFo1LmT+mMG?=
 =?us-ascii?Q?JTRNynHpE3yFCKp1vbFn0vAmZ7gDBcaucCw3eQoV+Zc4ckaQg4mmbtJyg9Rq?=
 =?us-ascii?Q?CPMep7Od6iyLI458l55dJRoJ/iuxuOiat8jVxLPaTsRUakuabyFyuRrawhyC?=
 =?us-ascii?Q?HDNtW1958B2mWKiBaWd/FFDHr/FD3FPWLyDn2CiigEr/B1GBcEGqVqWeuP2r?=
 =?us-ascii?Q?1zFstDZKZdmop0PTWsinNF3Dj9VHhmqDf2w9jy8jtJLI/9ZDYKY16KoQNz68?=
 =?us-ascii?Q?EfXDAifkgLFiIA4APhV2J0t0FOAEsmnSBBdjqUXQhr0GHI8FbgBdTpOk1M3/?=
 =?us-ascii?Q?6m8FJB9LKKg8uOgR7gWoKS7manJErnQVL1T9UqVE2gXpWKCQH2CpErOE8ugn?=
 =?us-ascii?Q?GwL0XdRcKmkBX2cH17v+k11t5kKSI1BLA9peJvrC8O7VvzpuH6E3usoZhAhE?=
 =?us-ascii?Q?L8tO8/fikNIVE80k5VIUjbAvuMOjpaJSOMEKmCRP0y9fW31+mZo3elgji860?=
 =?us-ascii?Q?ThsQWiaPA2ASHKhYIapCOBENPofGiP5UH21g3gPCGKgeVfQh17JlMzw2H3jv?=
 =?us-ascii?Q?ekvdAUp7fbhISrqx8pt2uO+SbaozxyVVkDvv3eL5Rlz4fGBK1IPrAv+l+Lpg?=
 =?us-ascii?Q?ZULDoYF4Ysd+6icWLdnFpBjiU90erTXstJMfM6Vt2h3JjSrKD91lEtPsOmuc?=
 =?us-ascii?Q?NMPCHxSaDVdDph6SYk+74eR/nno/tf6CTOIOhYNFtI9hzdlzMPKkYH3NwG1e?=
 =?us-ascii?Q?zgJtqoPJwqRS09UnQHjC10djvyzQihCGz9OEDNmeSokP1CD+2X22xl/rzdQP?=
 =?us-ascii?Q?4o+8jC6Smc+dg80S3RPEz6RPQ+/i7A/IZo6xmB7QMfQtQIsauNKxKGbOCxYM?=
 =?us-ascii?Q?dsW7DmC0PtsyAUpVib4d4ToE9TEyQNmCVHIfTzw+bV/loK4bm9iBiFFJylbw?=
 =?us-ascii?Q?r7yzbqR37ePnuw04hzCmxieid7VKbKrsuc49mEnTmi81X1eyptEIjonHp4J6?=
 =?us-ascii?Q?F5+6WN4JpspMPVOwOzC2D6AnljM35N7kFvJHWU0fwA+qpNhW0Qf3mYA+AF7E?=
 =?us-ascii?Q?+8suPscQj5mb2/iw0bDoDVe0Vea9G4QWghzQb9rqEkvbY7/IsNej+pOTp1QL?=
 =?us-ascii?Q?uHheql/dzdEFL67yiwtS3Y7T4u9p7fKsjt63KO/ttCpR+QwCu/OZNVipEzkb?=
 =?us-ascii?Q?nin16BMmGe+/87W8wU3enMXB4h86fXJCodnMBAA1yCK50bgVCzxlSl3oDv3d?=
 =?us-ascii?Q?Df7QPG58xmWRIrjtbz7CTPeIarEsjid922OEWhR32FjOaEb8Ohl11PK2Vgq3?=
 =?us-ascii?Q?9oDUKKERihH4KU4zFwhZdXzT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b5c97d-53df-421d-7cfe-08d992270d61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:04:27.6997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz/TVvFZ5Q3zK8ndUE6dbmplppduGkdssg4Ml6DxJe2WFmExoA4hTyhTXnHsxuAcGmLE983MCv7vUJrbN+D1Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 18.10.2021 12:38, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH v8 2/5] xen/arm: Enable the existing x86=
 virtual PCI support for ARM"):
>> AFAICT, the code is not reachable on Arm (?). Therefore, one could argue=
=20
>> we this can wait after the week-end as this is a latent bug. Yet, I am=20
>> not really comfortable to see knowningly buggy code merged.
>=20
> I agree that merging something that is known to be wrong would be
> quite irregular, at least without a compelling reason.
>=20
> Jan Beulich writes ("Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 =
virtual PCI support for ARM"):
>> On 16.10.2021 12:28, Roger Pau Monn=C3=A9 wrote:
>>> Maybe I'm being pedantic, or there was some communication outside the
>>> mailing list, but I think strictly speaking you are missing an Ack
>>> from either Jan or Paul for the xen/drivers/passthrough/pci.c change.
>>>
>>> IMHO seeing how that chunk moved from 3 different places in just one
>>> afternoon also doesn't give me a lot of confidence. It's Arm only code
>>> at the end, so it's not going to effect the existing x86 support and
>>> I'm not specially worried, but I would like to avoid having to move it
>>> again.
>>
>> +1
>>
>> I'll be replying to the patch itself for the technical aspects. As per
>> context still visible above this code path is supposedly unreachable
>> right now, which makes me wonder even more: Why the rush? Depending on
>> the answer plus considering the __hwdom_init issue, Ian, I'm inclined
>> to suggest a revert.
>=20
> I don't want to be waving hammers about at this stage, and I haven't
> looked at the technical details myself, but:
>=20
> Can I ask the ARM folks to make sure that this situation is sorted out
> ASAP ?  Say, by the end of Thursday ?
>=20
> By sorted out I mean that the __init_hwdom issue is fixed and that
> the overall changes to xen/drivers/passthrough/pci.c have been
> properly approved.
>=20
> Furthermore, I think these followup patches should go in all in one
> go, as a small series, when everyone is OK with it, rather than
> dribbling in.  That will make it easier to see the wood for the trees
> (and it would also make a revert less complicated).
>=20
> Jan, are you OK with this approach ?

Yes. FTR I'm not fussed about "all in one go" vs "dribbling in".

Jan


