Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ED7495B11
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 08:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259252.447327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAobA-00028j-CG; Fri, 21 Jan 2022 07:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259252.447327; Fri, 21 Jan 2022 07:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAobA-00026Q-8Y; Fri, 21 Jan 2022 07:44:40 +0000
Received: by outflank-mailman (input) for mailman id 259252;
 Fri, 21 Jan 2022 07:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAob8-00026K-HG
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 07:44:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb567922-7a8d-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 08:44:37 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-KvTnRwrjO5aRmLtv8uI0Rg-1; Fri, 21 Jan 2022 08:44:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 07:44:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 07:44:33 +0000
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
X-Inumbo-ID: fb567922-7a8d-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642751076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdTy4gNBfnz/2vOfMk9HIh+OmpVZVnL0kvRqSdf2TpY=;
	b=fExE4w97oY41/X2XshRSPANm3yYOw9DUh752y7irxwuHjUWBF2FXipXo0I29iS72rDPwhA
	qzY0Sc0UAabjVKBBXF4r5V8kWCNUSQeoCbalzsHGVD8FtV7ltxAy1z2TyZBFObqfFdWsat
	Jwf/QuxSQdJ1pD6lQ8tp9l1gySYaJA4=
X-MC-Unique: KvTnRwrjO5aRmLtv8uI0Rg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE+W6eQwQp3DC4zPQ/cq3kLPJsyvDKhgBKmrUJJl9HIS8qhGClflTCo7V4BY44PvVEj77POfeD8L2mOTij/XRKISdhubaziIXbAVk/h+ZnSWBxZsIQt4vzIHKZ7ajVOxOcRU0/hZ/PQhKUq0346bUUy97PAnDnXKj1mP5NPEZMNcX9PbamsyJpfdz4ZAt+XNcMv1oZc3UDZzfYyTIC3TJldDuypyKBwgKal3q7fUbReYIg/lqSDvw18VQyFpcLuHs2w4Rpk3lT2E2kbmnoh32YsTsZmCokbNI886I9naE70+6J96FB52wp8Xo/W3w5Jyxz+Zq95mYgIPaoxFfoFg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxBvNDGH7l8iGz2bA1ARindmiN4N+ymJwjANa0sRoKU=;
 b=Xlg97ob3gWWgFP+zPh+yaSTQsk+0Krm5Dt5jkujzr7HmG8qfnhYoOMf6Z6V43OGqrjjg476inEljb2q+CtgAZAMpm8Jpb7htJ758ka1gHErS9vQTIhN0hlKtbTzvm8DVYyxZ8V69wiSzCBqZKVbswYqtCeMpxXrfareg84LWFVETH4SBQltp1qIitffC7yOsBoAoC4rjK8PYBLHeWyPes9RLJ7+vWWY50TK3tBOWY6PXwx/QNKhiVp4c/NOL/lHVhJQ6WgqmfGqmpQfTbM0WWfdjZSUmkhxSQDGiCvAaI5I6/nzmytpvhlqbnkM3iT/St3Fr8vehsOptZ1CzRybFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50d575f4-f19e-dcac-5b8f-47d5d6951868@suse.com>
Date: Fri, 21 Jan 2022 08:44:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/time: minor adjustments to init_pit()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <08b293b3-e04a-9230-e7ec-dd7da9d198b1@suse.com>
 <5a8228df-b3f9-609e-e7fb-d0f8a5ed5413@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a8228df-b3f9-609e-e7fb-d0f8a5ed5413@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0251.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e390f3e6-897b-44e4-1462-08d9dcb1dd63
X-MS-TrafficTypeDiagnostic: AS8PR04MB7719:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7719B544A79F2C73ED878B81B35B9@AS8PR04MB7719.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iHMXnVloOzr/RhZMZ7jfJzMnXr7ktbxFAq/J3WXIXi53G8nwf347jPVnsvt+8k4r+qqHft+rmZ+JUFxOeSTZnDcuEsQP2Evvf9DRhUur/H8yniHCtnDkUCcL2yps3pPEcAvokTMaYHridrNOJn4Xbbuy+70IHmMUJxkXBsTsJwh38h99uMZYrdze8lTkE88Cl7nRnay0bFep9GG/IT7QQxeEFuiZPjk4G+vadlRkCkN8Qt4C8OYMi/f4htY48C3X9IiRpC5eWF1avOh6qf94/W3KHA/ChhlzsltR6uLS+6tuAtwGhyDu8wkZ+LSkLZfqiTLdeukIN1JxMQuBb9zAxNc2CqbseQYybwvSxEsat56au1DH9AAVgMuM2OyCYHSAIfwW1KiPUxAJXEEtLmbP/mDQeFSiKeRFSekqGByEHQz6xds6aPStt6CzUZ2LARBLMS5ibAXM0iKC0DLpaIjIoReK3KBFPAlXjUuEE86IYu/kqmbONizRJ/SuMc/xBKcHQIDMkSPHajAnI9eXY8g/s201zWB7b7nL8J0kziR0JaX2M6S+KtzRISYybA9k1gqea1EpCAz6utofnVkBYFdr45XGCxyoNsg0khCzNws610ACIf40tI7NKw5uZWiEZLeNvbOU2QPmqneAI91D6hJhd/wTHjuvjwd8HRm0tcFxChvRhWhRIv6Eju+6T/lPR2SyMS69RCAlaNSzy/MDTWMX83uauFCExEwmeWPqLmWhxQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8936002)(6506007)(86362001)(186003)(53546011)(6486002)(8676002)(26005)(6512007)(508600001)(316002)(54906003)(5660300002)(31696002)(2906002)(36756003)(6916009)(66946007)(4326008)(38100700002)(83380400001)(31686004)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+wTKw3AZhIUJRzVkWj/PYj/qCIP7zgLC9MKS6+IvgAr8b3YVFSW1E9oEjdlI?=
 =?us-ascii?Q?vCNk1araH7xzzxwGReywJq1k/sh/fo4/gMx+A2SuY90muqsRQ4ieP3VhgEfL?=
 =?us-ascii?Q?8hu8HcgLfbKYIXan3DavYb6zLT8dEP8Gq4XHl21MvU0X6HV2umzoXDOHZ4AL?=
 =?us-ascii?Q?opJRyCvvgXvI99wmuVYRAbAjYxdQoFcL2ir/XglBT8nNmiSkkFGWXtgXYbmp?=
 =?us-ascii?Q?wpb7wuVutRzJPaksJ+zdx9BACMavVUB+ARBKmvu2Mu8BBqiyOzTEx+iRq0TG?=
 =?us-ascii?Q?3dJTxboXNvINYV2ZNBAqCLqRAeUwJ1rqVPvReDUp49vE5xBdvrE1mFsJiuv1?=
 =?us-ascii?Q?xeXEXYhw7zJC2/wRIuILfoIGYAKAWHb2fI/8INU5K9detWSOs7GGr6rxQ9jA?=
 =?us-ascii?Q?xfHJaw8SvNu6ajMuPBxJ3K5mdgS0qHZ1JSXcQ8DoFbMRyjdzKxjnJy+u3UHe?=
 =?us-ascii?Q?1xLHeta0PUixbSLP6gjRkeQCiP+CJgnx8sS5YHtRlgijIPGYk+D7NOSBfs7H?=
 =?us-ascii?Q?fACrB4jvcTdAqmJhGrbZHi7znlr5nvuprGPzzS1/EDjV1qrkNw55U2w5m6GB?=
 =?us-ascii?Q?nCGaEE5Y+9s3S3rNCueLL+yPYx2kE4Dnb/vxzni82JZeV23gcHQvju2CGmXc?=
 =?us-ascii?Q?F08c+ScYn3aepGZmrTgK2uJJ2XzajjfnS5chp6poH/xtKyPvd0DzEMJHxfon?=
 =?us-ascii?Q?vWrL9IO0BWYkfDCttL5oAs+93gC3IrP+QSEP15BBQY+CJNj6Crb/jzFO5NLD?=
 =?us-ascii?Q?JC8RYIeYwv8DeSr8k1AIxIJ/b8gg9WpTrxMuo5guKNQkkW/Fy5FLttjouDxA?=
 =?us-ascii?Q?y3LlbKCqE18GNKWWKIpGaN+FnJBk6/ZDwWqBdnZ94H2Pgl91Lh/qgR5JQiVo?=
 =?us-ascii?Q?hqvyP4AjRGR6HwkE0M/fU8RxF4+Qgkh+jdiIfgOj9HmDmkCEnHP3ff0A0hI3?=
 =?us-ascii?Q?GngH4ERGSHf7xFDePAni4Bw+Oxry3bQkWIkbme4CIBox4RfTpQoDq40HlPjz?=
 =?us-ascii?Q?/qDj9F85sUVtcVlH6cU1Gj9+QIY2ALX8u6Nfk4nzfhFIDyFVkOQJx/WTL1wf?=
 =?us-ascii?Q?miV/x9G65T5BttlGMzkvk7QGStHNbzi5aoM6YHiATmmqjeZ924yEg4o8iSZ6?=
 =?us-ascii?Q?Z0IT2S4Ep3u9k+yKX5eXc1uNpOY66TNmEV+xZ4U3RMWQkzVDEvw/qFR6Z2GJ?=
 =?us-ascii?Q?8dIcQugvo1gmizzeYiMLpgwXPrreQ9BHV14cRS4rFLELINCHQILXgffrjfX0?=
 =?us-ascii?Q?6V/3D79yfcr+OT2CZQO9PwR+FZB4rjfID+XQskyJs8iu3ZMCXhVrFswV7Uo4?=
 =?us-ascii?Q?YmdAcLoCRiGXnR/ZIM3Ez1jbY2EYc7ES55EufHnhIMxBGkkQdqsaawMoFkAQ?=
 =?us-ascii?Q?y0uk+zJ2dLQ59/N7mVeMpfFlCYWEjrsByKFFo0zIDSN1u01JEHtg/RsqgsE3?=
 =?us-ascii?Q?L9h8/b+3piJEqmzCZ96g5tgBLUoaYG06yKvrlBeyCjfiOWcHqVkb5JddI9js?=
 =?us-ascii?Q?yf9NDipx7sLnC0q20pBmBYi/FzFFFh4itMRaFf1LcsM+TAvuhYmb32sunSRz?=
 =?us-ascii?Q?ujT3ZqsFFZ9VQwuOx74SSIlyVTu0JdS2Yb5IDHTmNPRn/FV8dsIFw/f/CwIN?=
 =?us-ascii?Q?zkgKFkwNEDDVH5O8xGzjSe8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e390f3e6-897b-44e4-1462-08d9dcb1dd63
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 07:44:33.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUXp3gAiycM1DpR7If4WRG45qN/giyfW6QN7dDSOTMuGeLYkJyrYf207mIHF3+q0uiZM5gjh8mV7B5GVo4RGyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719

On 20.01.2022 17:17, Andrew Cooper wrote:
> On 17/01/2022 10:36, Jan Beulich wrote:
>> For one, "using_pit" shouldn't be set ahead of the function's last
>> (for now: only) error path. Otherwise "clocksource=3Dpit" on the command
>> line can lead to misbehavior when actually taking that error path.
>>
>> And then make an implicit assumption explicit: CALIBRATE_FRAC cannot,
>> for example, simply be changed to 10. The way init_pit() works, the
>> upper bound on the calibration period is about 54ms.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> Really I've noticed this while considering what would happen if someone
>> specified  "clocksource=3Dpit" on the shim's command line. Unlike "hpet"
>> and "acpi", "pit" presently wouldn't be (explicitly) ignored. While,
>> aiui, right now the only error path would be taken (due to port 0x61
>> reads being supposed to get back 0xff), I don't think we can build on
>> that longer term: Seeing what we use port 0x61 for in traps.c, I think
>> sooner or later we will need to have some form of emulation for it. Such
>> emulation is then not unlikely to continuously report 0 in the bit in
>> question. That would leed to an infinite loop here.
>=20
> If we're not already doing it, pv shim really ought to set the FADT
> hardware reduced bits.=C2=A0 There should be no need to depend on heurist=
ics
> around ~0.

Before forcing this flag onto "others", I guess we'd better first
start properly honoring this mode ourselves? Outside of ACPICA code
there has been only a single use of this FADT bit so far ...

> I do suspect that the emulation for port 0x61 is obsolete enough for us
> to consider dropping.

Well, as always - I'm hesitant to drop code which we don't know for
sure cannot possibly be of use to anyone anymore, and which also isn't
known to cause (significant) harm.

Jan


