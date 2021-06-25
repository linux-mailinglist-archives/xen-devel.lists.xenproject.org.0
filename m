Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7F3B40FF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 11:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147096.270897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwib3-0007qZ-T0; Fri, 25 Jun 2021 09:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147096.270897; Fri, 25 Jun 2021 09:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwib3-0007np-Pf; Fri, 25 Jun 2021 09:58:01 +0000
Received: by outflank-mailman (input) for mailman id 147096;
 Fri, 25 Jun 2021 09:58:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwib2-0007nj-BF
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 09:58:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74a26779-c716-4862-9cfd-d1c5bd7505e3;
 Fri, 25 Jun 2021 09:57:59 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-VsPpbuswNIysK363DAqDrg-1; Fri, 25 Jun 2021 11:57:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 09:57:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 09:57:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0221.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Fri, 25 Jun 2021 09:57:55 +0000
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
X-Inumbo-ID: 74a26779-c716-4862-9cfd-d1c5bd7505e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624615078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRJJj4XGivBfb1/vwcwREcwzGQa1OaB8VE1V/tqOHQY=;
	b=J3AvEElBlnOpPajIXuOPmjYeEQibDPFdYsd0mS5T8M4Zf/qoYevQ6q2hzviZBIAfEzpUry
	qu/K5sH3t8UPRsAF6BwRLX5Iu99adDrooVi4efD3vcDIo7uWTQ4sDrdr73TFeqtJhq18u5
	x1QbzmbaGUQXvjoPMEnjVFrXrSNOUJ0=
X-MC-Unique: VsPpbuswNIysK363DAqDrg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiTWmbzUjXW+PEi8C0svoJEmkkyFWeHW/na9sTjeIgSyOwizIsVJiB2IM60zCDG9xxaagfW3TEnbOKvocX+oTrdj8t2odhLNBrVyy0gXQHB/rAv5r//v1zZjeBkd7Tsd249jwW839jXkCaZG6SQM8yDZr002gtrHMlrgQhvR6ONkJRf3iFPAA7To72wQyKW+dbZaa9fwlortprJaTfJzkNe6VqyZUQASiHMUGwdrCEMDDatAed13Nj/t/yaqBi41WlOumttUsiiDKZ+5p93SiBcgsYU1Td+aldYX6xHq3iNWIUWAyyuZRZVPUFjDt8a/VbwSJkmvxIXy0LANH82tzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoZWxPl+s3IRdc0xrlhnY9/hEXENm2vZcv5qvv0CqRw=;
 b=bnb2PwSKGAc2RvVqhOTdY2946f4QjINdB9e0MfjlioAwGZ/tP8SGQx6nVKIdA/jvp6j1Dt+359azauEOSfAKwUCXVyZ7mFrfzMIpS0vr1kMSal941+/448n+tmjFJ+sW21m2HFlmFEzLLqbMzSAiKdqn/c1sj1yfBohR4Af/sOG9xHfGil0VuMpFE7NVKPP3P8e1lDlFuCSoprSZnS2s2FWZz2NY5fxZBN6hq8+k3NrAnSwk1hL6Iz2bcX896jS3h4chxO2IrPLDfh+YhnXHeLTQqii6OsHzo/XMxiQswjK7yW9nld8RoNc9mgh/w9gfw2KA/zJ69syDn8D9OLcsDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] libxencall: Bump SONAME following new functionality
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210624175521.20843-1-andrew.cooper3@citrix.com>
 <6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
 <9c5cff0e-0ab6-7015-3667-bad2d9f5b31e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b360f95-aec2-935b-ce95-73a01cae98be@suse.com>
Date: Fri, 25 Jun 2021 11:57:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9c5cff0e-0ab6-7015-3667-bad2d9f5b31e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0221.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d9c37d8-4ab7-4498-00b3-08d937bfb49d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742AB0B540DC244A1D0202CB3069@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zNN0HmIsEk9RuasDfbjUcBqm6JBj9+HftAN7XxOG+qxsCpQQLqON4kraDllwjTapyogGj3N6cOaVu74WtT4+jmVADQDLtoe75p9Wwr/QFF5AsLUCCcWYnF6tr7vVireL+9SPcSnO13eNzIJrPZvgkiUtDgRZzOl38ymdhVBkLjHLZekd4sFYHGu3PPD4wwzr74mRrljKONnR6017+X+xsnNe64KPbLTZUoUCHm8hR0yNLWVWbw7YaStE8ul6evZQT8zVfP8kNM44XQ+kCq5eDs401UyUV9G1dmikxEulLjACnwB6eTAcJr5maVplOyOPgrAKUy02ZkY8/wJMoVnHsqYcbLRSkxW2ho77W+OYPFwrmvhz5zK5L36qFzi9m5P5EhbgI8pfZ2RZMrhQ1xweYAFM6IXJwBUlk0poteGl/rkSl3QTG/Fw84xjY1rMSJlD/aaDNPbTbhDoXzan7dc9kPlS3Kl9m+N7nY8EOZWmDJwxkQI6AX2y4FMn0neMOfg3oZ9eIwhf3xhpoBStL7iddQlrve8324CqVKt1FBYfxj5nL5X87iR7nE7tNDsRFiXWq05qX8FdD/gq5yuKyx+rtrOcVr88/+QI6J2t1uB5BgCj2Q/ItAzlI0TljWTELpQc7D75DF326gGSptTy8bvHZBtwhruZi0hLs7etxVrWY4g39/h0cJ2thFA4RxR++tUY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(396003)(346002)(136003)(366004)(26005)(16526019)(31696002)(4326008)(36756003)(186003)(16576012)(31686004)(5660300002)(66476007)(316002)(38100700002)(66946007)(66556008)(6916009)(2616005)(2906002)(53546011)(54906003)(6486002)(8936002)(86362001)(478600001)(8676002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fBK3hd+kRyPXu0BUzlAADrJhGIeH38OlTq0Q/tVi6NMhbeqLWkFuLVw9JaMv?=
 =?us-ascii?Q?l5POaQgUz/tjZIIjMClPpOd5ZD6tQ47wqHBdPIncM1Rtxa4jOTDYukmke8L+?=
 =?us-ascii?Q?7OVdHSMI9gy7oIiA3P8Hjg8+bktRcW3PtMPlUMtVkvPmi2t0x5R7N5lr0cFp?=
 =?us-ascii?Q?yzTbHW2S9D8HLrAoPRgckbY8zwVULFRymkRlEbv4GNAYmW0dPMfwzKEollDM?=
 =?us-ascii?Q?wH4bvCDbm6wCbD0d3FgejWz7n102Y0Dnf2APqaCpHZucMoKVHt6f+A+jLQA2?=
 =?us-ascii?Q?7yyu5wKLE1bK/6OeziPfNKwcnj6K2vd60Y9CjhoIXH2dY1ur6DvEEdAtZQMi?=
 =?us-ascii?Q?YwXTC529YF+W6NkilMbqh+WtxsEswNJglKQ4z1tLZLQ7kDvYaX6yC2pWHasa?=
 =?us-ascii?Q?2hVMZPfUlwUHAlbZIviAgmtVluf3HcvBwvJPaF4wTfB3IlXFyHvjF40NDwDL?=
 =?us-ascii?Q?NzGw5L+e7HvgqzB+5Tve5yGlfv44KAH1PJpLycFuXj6N2rP9EZsMKbCXFYdF?=
 =?us-ascii?Q?iVMBReQTfiPVFVqhsZavWx61mNtnYEzlAbZQl6xSput4Hhhxfx3fWoY2+IaP?=
 =?us-ascii?Q?ZSXnXwc/rtB2LiuXZkmbTxMUtDQobREQz+bWi3WIbelYfen5fkhFcI+HC60N?=
 =?us-ascii?Q?La/rXf/H4vp7vOeXRL2JpI1R5HY5HotA+wWpzow60gzHvjQ98gnJZ/LoUSUG?=
 =?us-ascii?Q?6YDau9w3IIDXS69nAbH7kH3GV5O2XraJrxK8sjl2PK6BlrM/OWt4122fd6F9?=
 =?us-ascii?Q?GMqjNGzoI0SCNvXJjkaEdEnU6DaRtlwJlYeoe7VQk2CMXFknzE2e09xwoThx?=
 =?us-ascii?Q?UEHMDBT4QNfa4kuN6bABUsbDEZOM3pzJw2b8PWFdnp9r7PUY8Qnan9vyD1P/?=
 =?us-ascii?Q?UZEHAHelYPJxBYLzpdvsYuPrD3ZbWx0wuSWMurIs5uS8grtN5O938dv+rN+9?=
 =?us-ascii?Q?rnDojMsQhBJADqjDWqthpvaKFooatLSwAm8oJYN8CB1KKbxxhulAr9m1ES9K?=
 =?us-ascii?Q?gyhUA0VIWkiq56ZHL7Xx7frSTZAJqnIZ4f7ozubjNuMq85fcily22wy6IY1P?=
 =?us-ascii?Q?nLe8h9PtgXLtt66viJVOHh6ReM6cvUbk1X3KAilRzuHf0fNzRItOXEeWI0j/?=
 =?us-ascii?Q?8cyoX/Kw4ibDRLb7ibE+DqLCOI7rR2UXjw/NT06WFp9WMkQ+S/U4QJpNPibx?=
 =?us-ascii?Q?KV+lSzDwJNsyIb8NJ+MuodnA/bvRIDXlnLw5oWnD8Hs33wPewosC2CrDUCUe?=
 =?us-ascii?Q?8mHJiDrm1CvmlcFtXi9LW1cO45dJV+qIkYinjebd/boeifEsgDatjpcB1hED?=
 =?us-ascii?Q?eRc4lJ12V6cilDlckVKpZ8Sl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9c37d8-4ab7-4498-00b3-08d937bfb49d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 09:57:56.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JauSLZNFWUYCX6MPCEeKl88EACsi5aBqo/OEba6xEIxc71+i7wfBAYh6yXOwaxTgb99kAlQKTAhdJQCz1m3cXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 25.06.2021 11:17, Andrew Cooper wrote:
> On 25/06/2021 07:31, Jan Beulich wrote:
>> On 24.06.2021 19:55, Andrew Cooper wrote:
>>> Fixes: bef64f2c00 ("libxencall: introduce variant of xencall2() returni=
ng long")
>> Is this strictly necessary, i.e. is a Fixes: tag here warranted?
>=20
> Yes - very much so.
>=20
> andrewcoop@andrewcoop:/local/xen.git/xen$ readelf -Wa
> ../tools/libs/call/libxencall.so.1.2 | grep 1\\.3
> =C2=A0=C2=A0=C2=A0 33: 0000000000001496=C2=A0=C2=A0=C2=A0 59 FUNC=C2=A0=
=C2=A0=C2=A0 GLOBAL DEFAULT=C2=A0=C2=A0 13
> xencall2L@@VERS_1.3
> =C2=A0=C2=A0=C2=A0 39: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJECT=
=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
> =C2=A0=C2=A0=C2=A0 76: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJECT=
=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
> =C2=A0 020:=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 (VER=
S_1.3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (VERS_1.0)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 3
> (VERS_1.1)=C2=A0=C2=A0
> =C2=A0 024:=C2=A0=C2=A0 3 (VERS_1.1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (VER=
S_1.0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 5
> (VERS_1.3)=C2=A0=C2=A0
> =C2=A0 0x0080: Rev: 1=C2=A0 Flags: none=C2=A0 Index: 5=C2=A0 Cnt: 2=C2=A0=
 Name: VERS_1.3
>=20
> Without this, you create a library called .so.1.2 with 1.3's ABI in.

I'm aware of the change to file contents as well as the disagreement
of file name / SONAME vs enumerated versions. So telling me this is
not really an answer to my question. It may be by convention that
the two should match up, but I don't see any functional issue (yet)
if they don't. Plus of course you leave open altogether the
backporting aspect of my question.

Jan


