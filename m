Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF94BFBE9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276823.473130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWjH-000249-3h; Tue, 22 Feb 2022 15:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276823.473130; Tue, 22 Feb 2022 15:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWjH-00022L-0X; Tue, 22 Feb 2022 15:05:27 +0000
Received: by outflank-mailman (input) for mailman id 276823;
 Tue, 22 Feb 2022 15:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMWjG-00022F-5o
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:05:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc83d54d-93f0-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:05:24 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-Dhwefaj4Pdifxm4r8_QdxA-1; Tue, 22 Feb 2022 16:05:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Tue, 22 Feb
 2022 15:05:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 15:05:22 +0000
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
X-Inumbo-ID: dc83d54d-93f0-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645542324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cqXfdTdjqNxFES8K9KyGRQOYEZ0CBiUZwflHPlejhU=;
	b=KErO2s17o3YUuc0Ut+27hl9A1Q6Y/VLRI2eOa8XOE7b0Awv0YxTCa/dCejF352LelTOCYg
	gkgAHI3bOUh7dHXUvkOYZ5IJy4XlLd2Vd3/2And8YlBM1rdo/obCEvVAIDSttZcz1O4BJT
	rsgfxKPs6oPWTjbJVYBvfqofu1B1fAc=
X-MC-Unique: Dhwefaj4Pdifxm4r8_QdxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGk9ncOoF8ehM6mnjLPfItl92S+PguH43f/xLL0JwkxC1mqJUgk2/vZjop7wLJqT9pwubRgUvmvyZW+iwpBUMJtMLMIQoQtETdEVIGLmoBclvgZEbKZibPq/0QnQltJWRlZxpVH5buHonIaZqEov6BgKw+YH4O2Dt9TY4w6SfpJKgD11X2DJQkHwBuN05601sFX6U4+lit0Ws+2apGZM30QBgSPqx8C9YoN0mL234ljVQgGIFSWOk4rpOH2ALpA/GX263XJygcuYKy2Wl3lu+QEzVY61ErPy/txRr6HU9IIjd2T8hfdhHrzEppvZodw3q34XQaLFrGSUUyNTZiH8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdZoQxKhAUVuPLjmymg2wECbeaWHsOatd93AP/5RoZU=;
 b=it53A9e3cDdpizpr8CwcS9xd0qwInDOuUrPR3aSJLwqpN/BCqK0NASgmXUMZleNRaGc+OOmDmgz8rcidWXp8HGz34Xg03I/4bPOOShppqRcJbEnOL6C2UQQXipgryjVH0vnxw3wsBTHlgTiI/yympLoi6kFDDJ1hucYZeY705mqYaz92FhkFcGRqhrWwjWz5jKYjcLTOwWCecN6yncFwxa8nXG6M45gEmXwh6zC3EV8V+OArWdvIjl7WLMWBCTVy2N+jSTmFKTisdL2TW9gRLjoMJ/IhNbNCPgDFbrSfsSjqGnL69C7GUgblzWOXgJtvH60VpFsjlCL+sBtj+eySgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5c50526-2fdc-029e-751d-eb05b29a8366@suse.com>
Date: Tue, 22 Feb 2022 16:05:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] RFC: Version support policy
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Committers <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Wojtek Porczyk <woju@invisiblethingslab.com>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
 <YhTUe7K5/rlek4AA@invisiblethingslab.com>
 <77CD0734-A343-45CF-8A44-5C53771E404A@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <77CD0734-A343-45CF-8A44-5C53771E404A@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0079.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f5c8579-135d-4367-ad36-08d9f614bf38
X-MS-TrafficTypeDiagnostic: PAXPR04MB8687:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB86878C8D7C330241C419E46EB33B9@PAXPR04MB8687.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4qO0ZZ/SDLrC7W474MQtQK5HZDexLa9O8wsuUDaLTjtmccNSgCTQvo8WH1iC/CDTUCO3nR2eai754/odWk1PoVAAr6c0ImWEMZbHDW0dWABlNDAELaeqOantqXem+8kha50PMhkzu/Xv2xa6C3qRkU4A/zP5kTjmwqNK113nHevznDAlV6I3C6bQAWNZxmMgwe3jXOv58qU0urPa3raGAAMBr1RqlZqfHkQHsarfAk2/CSn+2kdsg3RhaOjoNlJ/jrepiadHhAPfTxqMTGaOAl/pEzkt9YO/YKi94+UHzQz+wkTAS2Wc8y6EyLDtVX6ybK+0zRLystlHWKgQ4G2zi/TcRTO8aNOsEFFiYD55EQ6b2A+cMlJSlSD7HTdT5/yPNS9RV8FDj97aCv7vgZPtYhxVqGc4Z7KGHWZwatE7fVFEeBidHdb7jJ96+zA7Yd2LMGpeaU0BfVNHHgJKKI+erkmZnHM7bjhDPx4J2YxUOSsq30pFzsJ8vqVv5ivSHxrBkYOp2uO8eqV+fr4GmUE/92hOpMlJEufObiLMZqqqbSKrZUMa0oBG/QE3N+R+xgKak69PKirtZIKFGKoIpW98YokN8tSq/u5eib4g2MJoV9BYfyz6kCghvtjGPfIv2Ct1psaLKqvZiJ7Fk7Z+kHYYUUA1NIx0qgwD8Ehpeiro4iI7o7yaVhR0PmHxASyFv1ahh/Y3iYUVrGTloya3i2AuWGTWkCbTIulvRKrubv00RyixxrGfjMccsPYHMwB+zw0j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(38100700002)(6486002)(66946007)(66556008)(36756003)(54906003)(316002)(6916009)(8676002)(4326008)(31686004)(508600001)(2906002)(6666004)(53546011)(6506007)(8936002)(186003)(26005)(2616005)(86362001)(31696002)(6512007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TvX3Jusm623ZC5318BvXKelYVaK7eTJUltn8LBYHTcHPnFcjfzsJJTpU2JoQ?=
 =?us-ascii?Q?uoLHvq0eV+XInaEHQsbl0PZj/gN14DhhYeY74suoLsYNDNC3PbeFYuLUB20w?=
 =?us-ascii?Q?WIh3DR/C2JyH3UshnW35OdeIUbV5HuhNg6Ru/mdq/i9AWYPeZoTPQy0NyVlJ?=
 =?us-ascii?Q?3KOtd6uWxXv/XKiGuo/Dg/+7fdoOPjDi8l8AQYPhlnEx4KHopIt5t5HjPX2E?=
 =?us-ascii?Q?z71Y5l5qxsdP+rFQo72q6yG8D+B/R7x3UkEVNmQo5PTFdI8abnwubJDb+Tbf?=
 =?us-ascii?Q?ADvlVJYdKtNVrpHzUsobDYe8efuOsZhHRTsF+kVgEmQ/SQpfAJe/TmxQYW7V?=
 =?us-ascii?Q?eX/r078rr/b7cm5RvAPgmu54n6uGVJ4irrqU/DEPtcTKeVWQn/b0tKoAhvjG?=
 =?us-ascii?Q?yY6ww6K2MoFP4qDnM3L7mwXBYBnfkXrFBZxcHpkWSEHpIVcXo7mxtFPTMyx+?=
 =?us-ascii?Q?CIiTVyDSkgqp+dDr3TYynbvs5bcPXKDtKg0el7+A4grgY/JYtKpG60W0NaVm?=
 =?us-ascii?Q?VBBiU2Su/qToyp2znrDbzEaESshq1BSWwlTKKPwKi/Zlc2rGIcQAvSba8vRv?=
 =?us-ascii?Q?cweApPim3QeEP1JbKsHfzfIPjcBMIg0zbZIqgSzHxeXkbkoaAlbMOjZq0wrk?=
 =?us-ascii?Q?nbP9lKS4lhH7QTTVZLCk4aJg3EyWDpTBvm+y3ZTpQ9H/UPFLmDedNxvr9Xgo?=
 =?us-ascii?Q?QdjZVDt0vkvQhTqu0KPQvNP4MA2LRD7HhhDuGoYRaW/t/zhmFIWufXKOIgFl?=
 =?us-ascii?Q?OEHG1cxNTQGDYuYBEIMxTpPJsg4MdJdX1hLHF0+bdSiPn0CkiJDufGpN5Pl5?=
 =?us-ascii?Q?1fJpriNMciKXA8xG1GMjzMjfHyjv/eQHBWIoJLJM0L1Vsal5EIZ10GC6hKRp?=
 =?us-ascii?Q?d4ScuHWN1CCQ0g2hFbUv4eAjhMqmuwGum+0uZNE/xgBHonwJ1/AJyWkaxRQj?=
 =?us-ascii?Q?OyacYYCVNEhG1cCCbKszhCflY7swPpOxt2ikOwZ20UTjw+wRTkvfikXVsb0i?=
 =?us-ascii?Q?D5OHlCiJQfwO5+CBoI4USSEhwgi/2szeNqMPqoxZO3ru+NYdQ0yBb/o77sGH?=
 =?us-ascii?Q?/0FnG7pqhj8DlJe7gMeKGXrJEVf8asRirf+0WX1ieOTZy7nnHJsQvIyNesXU?=
 =?us-ascii?Q?TiyTN8hR8C2YNu/wGvDTTFrHyZZeLm9+LNTVeCQ3exiEnBJuIQl6nyAkvMrf?=
 =?us-ascii?Q?AWCcWbTorJDHTI8zb8ab8orcYkfOTOTj5dqva0hu/DVWualDaGQUGj/TlnQB?=
 =?us-ascii?Q?2UvD49woG5MhNdkn9EP7tXMb4anh9HBWn9P6Gk+kM0Puqs5DTlpCBrtKAnkJ?=
 =?us-ascii?Q?x3f8yKPnylj8tO6uU9w7Al65gI3AcMUjTHDAaB+qz0T55cV3aczdygS1Eumu?=
 =?us-ascii?Q?jnlS7TnDERwoIkmnDlXBKmkj9caS18MrTsas7VeMLkPDDUCu8eOIuhXiSx9J?=
 =?us-ascii?Q?MPTvEaA1v7yg6H0IE9xlUafruFDkb88glOejFs5ZSdE9gDXDDOyG2n4/S9FS?=
 =?us-ascii?Q?omUjQCpDGQQlfRCuuS0CpuSiGUcOhjReRoeBt/+LlY72uEojf8nakDJymQhf?=
 =?us-ascii?Q?ZcNAqLGMPIbft0ozNb/Lqqh7as7uDZPuCkfYephQFemBKVUqx9ah04foN1wn?=
 =?us-ascii?Q?kxp3naAjG4K0m+HG+cGJWpE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5c8579-135d-4367-ad36-08d9f614bf38
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:05:21.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVdwH2jeyZdeVk3p6fEE3l5dM07vMmPiKdPhLSUe4rjrVf4ERXtxTf5SFm06oHGXCUIi6kqu8OFve1Bn5GvbCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687

On 22.02.2022 15:58, George Dunlap wrote:
>> On Feb 22, 2022, at 12:18 PM, Wojtek Porczyk <woju@invisiblethingslab.co=
m> wrote:
>> On Mon, Feb 14, 2022 at 09:50:25PM +0000, George Dunlap wrote:
>>> I think it=E2=80=99s too much effort to ask developers to try to find t=
he actual
>>> minimum version of each individual dependency as things evolve.
>>
>> By "find the actual minimum version", do you mean to get to know the ver=
sion
>> number, or install that version on developer's machine?
>=20
> Well suppose that a developer writes code that depends on an external lib=
rary.  The external library on their own machine is 4.5; so they know that =
4.5 works.  But will 4.4 work?  How about 4.0?  Or 3.9?  Or 2.2?  Maybe it =
works on 3.8+ and 2.13+, but not 2.0-2.12 or 3.0-3.7.
>=20
> I don=E2=80=99t think it=E2=80=99s fair to ask people submitting patches =
to do the work of tracking down which exact versions actually work and whic=
h ones don=E2=80=99t actually work;

But somebody will need to do this. If it's not done right away, someone
(else) will hit a build issue on a perhaps just slightly older platform.

Jan

> particularly because...
>=20
>> The second part very much depends on distro, but all of them have provis=
ions
>> to install older versions of packages, though not all of them might carr=
y all
>> the possible versions (i.e., it might be that you need version X, Distro=
 A has
>> had versions X-1 and X+1, but never packaged version X). Again, if this =
is
>> a problem, it depends on the actual package and compatibility situation.
>=20
> =E2=80=A6of things like this.
>=20
>  -George


