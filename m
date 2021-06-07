Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C039DD06
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 14:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137925.255442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEkO-0001ha-3v; Mon, 07 Jun 2021 12:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137925.255442; Mon, 07 Jun 2021 12:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEkO-0001fj-0L; Mon, 07 Jun 2021 12:52:52 +0000
Received: by outflank-mailman (input) for mailman id 137925;
 Mon, 07 Jun 2021 12:52:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqEkN-0001fd-BM
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 12:52:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ac4d880-06a3-424e-a5ca-049b286b7c9e;
 Mon, 07 Jun 2021 12:52:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-Mb9h-BGbOYyIXg3_u2kmRw-1; Mon, 07 Jun 2021 14:52:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Mon, 7 Jun
 2021 12:52:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 12:52:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:102::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 12:52:46 +0000
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
X-Inumbo-ID: 6ac4d880-06a3-424e-a5ca-049b286b7c9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623070369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADYzQMaVerczQu8ZmYTGHB9lt1qZzrDIOvpnewkdDC0=;
	b=RjCXorP8Kyi12yT46OEBzoXmASF5n0lFjy/3k8vemNSU1a2JqD6V/N7jPeKWqU/7rm2PxR
	eaFwUwnqwfSZUJ0KSortg5f8kNkVZ5YhfKPZq4qL73S/6ncO7DxpEH6VtMrmYVFwUwnl7r
	slP5f9VjatQmXK+WD3g0FXBUkfAYSyk=
X-MC-Unique: Mb9h-BGbOYyIXg3_u2kmRw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDuYixP7TfoL2jm0vDQfDURt0xP+X3p7Owjt3+1Ltzo0044Fc3RWDcE8LU47v2cCTC21aqndAs6zzMpokxAMLL3j44LqxKRP0r0EsbYYXCIcXXowY/9Rl6wS8UPJoqFZGBVJc+W4lY9QJaGL2gxaAQe7HkTnio/PFcDctsW2aUKLDa4Tk0vnkmnkdDixiK1U0y+fnpo3Yv6zzTB3KTI5xI+p7wlJho65EjetbTXbE62ZTwsr7sQsq2XB9Fk0PbutUjHXQmLpX/CcgnNYylhIzXKClHbB1Cr+T1J7fSkTzVPv9EoqJXySElLl9vr4b5iNpFYMy5dNhs0wd5x+1SLrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t16o32gG1VsGoX86uvlVT72Q3N6GoyS88sA+DaEkvNw=;
 b=Rv1wGOGDJy9k9bJvIq+ZH0+MUx7E6Uy1CyAvYhstRl0LB6oLCQUmwSJ0D7jGsRiYOsy+vnrbTmDnqTT6pYfa+EjPlu9evmNjueyibx6BlyCl0lWONTnkto+QH8EKN2YHCecZrq83soVLt87kePTVlbdq2hW7Ke4ERLdOII5uqH4Ux5hIprmqB2FNWCeOBm2PslV1RQDmQq3S4GaBfURYLrs5o0SibcxEkHa1gnGxpAqufKUUD7XyroC+8609FB8QyNeozk2FjuB4t17+NAWMvoJXk+vHRdvLTl7cGkiYqM9rkIEskZRoAjbP8D++vh1b8Xa4aXiMZkD5pAoj4NIf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cpuid: Fix HLE and RTM handling (again)
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210607124116.24250-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c975a90-5222-5a20-e694-d107265ec8d2@suse.com>
Date: Mon, 7 Jun 2021 14:52:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607124116.24250-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb7fb28-295f-4793-ea36-08d929b3260c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6173D3F62D0BCB5348796012B3389@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jbvkK3gd9gbcbOayHubqWVByHS6l2KTZbaSCeb0SaPsOrPfy5r4aADka8Siml6feyY+9XZROx4EptnGCBEDD5OUnGiv16Wr+Aj0P4v9ohOvlIBrrj+Cjxtlw0Y0aiK96RVyWu36/ZxkbwaJMwJjfzQvPGXNPt9640IQUG1mTbSjj9ZwzrTeOdcGMWc8/V1FNOCZGR9A69je+ry0f+pOfFkk+1e74/dT+OnybMhEKrW4Hanr94yf5Pk0kZEmQQxzw/6Pep3TjQj/1KKwntoej/QIdZCZeE2sOBZcpkSXivneio8a9PeqrvMReKqbf5i4MidywkdD5auw3Xak/5omOQ7aGuL6sdQpM3/tGRc4yLTSdrG2mxpdny9oODJbmV+PglMc5mriyo8suFlMZsTcPhJlt6Xn2mnpJhSL/q+966g7dCiZlifu0bKqCD7bP4NJKBfSbHGRHuSH5mubiMPmTDuYQGwgvt+sIrxmLCIeKxfSsMb+2HjPpolw7TQIpxl/4Nrh6XPz+y74DxUsg49swoyNf97DXw04mj/CTLMqDCJ2c7cfPTAr50KNvRrkoofluoo0UFy1sETR/u351E+dJSNLMzRIpVoSGmhgUCQxsdtwuO4vjYDx8hBj03U648vs174VcqqoFo0IUIBIYXyOM8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(26005)(186003)(36756003)(16526019)(2906002)(31686004)(53546011)(2616005)(5660300002)(956004)(4326008)(83380400001)(16576012)(8936002)(38100700002)(31696002)(6916009)(6486002)(8676002)(4744005)(54906003)(66476007)(66556008)(498600001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?K/R+VIcujjQVNzw/HtC4rYGng1uuos5OyQfsocmwYSqeCwUil0KsDW/H/zra?=
 =?us-ascii?Q?burI3YLXLJMeHKjZRFteLD5MrbPrrPGLpnMIt1oRxSDT67GcEr4D6tJfNdi0?=
 =?us-ascii?Q?8f13dmCCaVpL6/5Zlvz9p5fr+2yIdZy1QWhsobzj+PAeowLshRAITq5XZ3Qu?=
 =?us-ascii?Q?rxPTUVKrhp5ZsuDOdp4+mrAfMlixpIKNyHgCHiIU8twfU80kdxSBJpLFZiew?=
 =?us-ascii?Q?kEygNWMcm4go4utOvQuO3bjQ+Nm5Kqqn7x19yVK8L4aJ1Nlmu4W4dlzlhbxe?=
 =?us-ascii?Q?XZ/K8SU6EjaRPv/kB7kFZ3SQGAto7iTtxY0mHpDWvTrSKDL10lZUnydb2Fus?=
 =?us-ascii?Q?adc3R2MDWkBu8+Scj9qgur27YhXUTxva+Kmh5ouTPaz3++fbEeahiQH9jFbI?=
 =?us-ascii?Q?uKgN7bwWwpiOYFN3CkZ6C5i5I8TZ4Au2l3gG7k7WqxXn82uo6DIZudRRria3?=
 =?us-ascii?Q?/tgw30LrtvfvNwB2xIFRHnQD72yGu2vNey47NA+tJonVOKZrY+o4I/26TkXC?=
 =?us-ascii?Q?SoDUJuybr+uF08/Nnw9+nWvnRlxMXyBAWyNTUlCx1wS3d91g7kHSNrVrfDC5?=
 =?us-ascii?Q?tM+woCHS82zFFWUHLVCaRwcNJi3lnNZN2boX5joBktEi6yy+3qdcIjtjL6hc?=
 =?us-ascii?Q?Yskx9h6w0LjebkyH8Vz1hgFO7LmVXYUTW37707DIrEImbswsRcdIbuKSLYgL?=
 =?us-ascii?Q?JbC+ANbSeoQbpjIiZw84GTEsdzOeVcfRliO9WidkMgURP+cyWaX97i3Ic0nF?=
 =?us-ascii?Q?cK2GR0B8KWX/j7EtV1u7A6oS7fsTxmSzn6bqq5BzlQBjFs6xi59NdzF+uPe5?=
 =?us-ascii?Q?506t5MJb87awoBzKP91R3yISgJbN7UxY/4pj9TRvD6cNohqUuvH2C0jourNN?=
 =?us-ascii?Q?3bxQ3fypgFhu6zjeVdVy51ot61YikM39aKq7YeoF+j9uZnNautOfkN1Yi+PU?=
 =?us-ascii?Q?lUEy35AniUsbhXFDkTcuEqiv4hJLGsvPvZuKN+GMCw0ctoqFMDw4Owk85sMy?=
 =?us-ascii?Q?ziltH5SznpFAFSkHeRLmfXn8/7SGD/EIa0hv2zeFS4AsmPNj/xudRuLzPsG4?=
 =?us-ascii?Q?S8Mar+ZXqekl5DnQK3gTHAL2tzwpkwsxkubqZvcW0LF9ADAmYH2erjD7D9qT?=
 =?us-ascii?Q?JRpW6wUwmT5H9zvf+Fkqyt9npznpr4FWpkom+sdrH8AfxPMk8xr/JnTj1AiI?=
 =?us-ascii?Q?60fJTusYMJaFlJMhJzQyCi9tW9FrL7mFR9zzPC8/kXI8Rpo+qzamhhFbPOGe?=
 =?us-ascii?Q?3X0wvo2TMJs2bStiTG5+/0HnTmuRbJ74ZtxH1x+Svbw1ycwZZqvsLsHKpC8v?=
 =?us-ascii?Q?031du4TPe7MrG8znDhJ5z0ea?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb7fb28-295f-4793-ea36-08d929b3260c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 12:52:46.4650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51OlJ75mymWWGaocg081Rb7WXGB0DhpuxTnsMZUUWenlWMp9v10Q9IDLaZ+zYcvd0TEyA3KgB71Mxj4tetCUhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 07.06.2021 14:41, Andrew Cooper wrote:
> For reasons which are my fault, but I don't recall why, the
> FDP_EXCP_ONLY/NO_FPU_SEL adjustment uses the whole special_features[] arr=
ay,
> not the two relevant bits.
>=20
> HLE and RTM were recently added to the list of special features, causing =
them
> to be always set in guest view, irrespective of the toolstacks choice on =
the
> matter.
>=20
> Rewrite the logic to refer to the features specifically, rather than rely=
ing
> on the contents of the special_features[] array.
>=20
> Fixes: 8fe24090d9 ("x86/cpuid: Rework HLE and RTM handling")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reported-by: Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


