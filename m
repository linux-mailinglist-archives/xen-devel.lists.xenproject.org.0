Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C6351D81A
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323089.544637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxKS-0003Ap-Kr; Fri, 06 May 2022 12:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323089.544637; Fri, 06 May 2022 12:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxKS-00037W-Gu; Fri, 06 May 2022 12:45:04 +0000
Received: by outflank-mailman (input) for mailman id 323089;
 Fri, 06 May 2022 12:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmxKQ-00037M-Sj
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:45:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5828acf0-cd3a-11ec-a406-831a346695d4;
 Fri, 06 May 2022 14:45:01 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-4Hg4q188PRC2uyHj_v-nnQ-1; Fri, 06 May 2022 14:45:00 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5280.eurprd04.prod.outlook.com (2603:10a6:803:5f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 12:44:58 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 12:44:58 +0000
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
X-Inumbo-ID: 5828acf0-cd3a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651841101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EK+DTPaAA1jcEZ7Zb2OAGNLR3RD4Q+rFnmNrccLNiDs=;
	b=D/eVi6MlVTI8ldKDl53/45pNgM3jWaMKByS0PEMnNcK7ctS7KRbYMCqNyR2dKZ0VCuk+//
	v4+c3osBZl2ELZL/VDCVeg/gb3BWnObst3aKl7PS+2MC/yNXomsifoeYuPShfItA9vQmcO
	j7Ec0gLbg2C33TTEpSBvUOkUoaBR5ts=
X-MC-Unique: 4Hg4q188PRC2uyHj_v-nnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itkLwzLxbsA0b41PL98FUqFBnF3SQ2JrPIfikEEy/+OI8NpO1e/MqoK71V4L4PboT+WRrRObXXQiiM72ERt7Ivuuvv0EdVlxX8lLe2m5exd8LocGp11ugXbXlzbzuALm65NDYqR3skOr5Iy2LfPwtDWKzTYVqmtc4IPpAUvpsWPyugtsxImLo0XVQ0gUlb6UPZuAmCgsW1j2I5ME/uEpuhasCrrr4W+3OuvuVXJvekJqaT1wBAQ5lZ2CFJ1rLgUgbSxKZerplCUMH6eEi9270CLF9Nv6k+963ISXBbTdNzuuUUo5Q7yx5CMtgbi8e/tlTpLAwQIP/hnQvPLC1mFWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jWkRXuOmtKcjdq1XEADF1gapWmxABP1tVakRSYur6c=;
 b=fzXFCAbuI4miKpgNknJTut9hRgSteW6au0A4SSNlCaA4315I+oEtPXHmrUyNrrVYaZTZdlwZWu5DHvb95cFAEGRPmgCtjICn4OQ8Zny++Ub1iKwbfE6p6VAyc3k+Z/x9m7pDXrN38Dai6Ymzr7iZ8S8eVI8ZVV3rQMfc7oEjxjIg5vjYlOjiokbVGRsAQDu3aROkX1CeuND9ua1xUOsNk2G6VRoGMkFXXp+kdsLF8TWsWRJx8XAImOIPZcYbdEcqXTMOWaPJxJYoKOyt92I+/XIiTpsp+wnxyRBisdYXMQ1oGEbR0hRaaGq6bZoEQYnuEIPyVRrhQ1F3ix9/D3/5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e2b64f7-fda9-9a79-c809-cd3e92ffd356@suse.com>
Date: Fri, 6 May 2022 14:44:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] MAINTAINERS: add myself as reviewer for IOMMU vendor
 independent code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220505150454.51710-1-roger.pau@citrix.com>
 <20537ada-d3f5-56a9-8cb5-f274209c36e2@suse.com>
In-Reply-To: <20537ada-d3f5-56a9-8cb5-f274209c36e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16a6a45c-4070-4459-5a06-08da2f5e3a9b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5280:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB528092FE75698E832C494F04B3C59@VI1PR04MB5280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h55Hn7QeVIOekEDUlZStKUkxrbae1UoMnW6u1N4tm7so0Ez3EOHtiamJBQ46YMBeu2337Nwk3+QZ8E9Wp4L3O/RYl3hU8XQs3VuudCa1CVRgF7gmvACJSrbXu2DpMvbkmNoazICDEIXDEW7uyHJiGDLyRDDegirNlFEHzSCBNhgK9B2Xe4J5sI0Z8m6uwDXaSZVGeWKPaeJFj+Ryrwt8y1mglOheoTvBTgChrbT/g94r85/QkQ9uKgqP4v1IIsrgv/1R9jgmIvYpgnmJTHQAL2Urj5soAJoqErgIbaWJ/q6crhc4ibE7Ml++FO/iqHq12Nuy3SC3++OHGoFsweFK4mLgTucLDl/GzmIox0SFyDIAHIpU9+FYNdC/zHWfrMiESykDy/qwlrwWwv8SrjPkpZxqb3qbTJlBFEzvBkgelC0dMErix9+F4glS4GxoXjtLtLgm7oz70lssA9CxrWBIV8vr8BaqozOPz+CC60nddaDWd/yN7UCchlg0mSnW59dePLYMqy+XFX5HveEEmK/zB+aNu4atxpTMygMuRZqJLpWP/mm1LE9pGbHxAGxblRWhA2BIkggYtr9eFZ/Xh42/mTDkFS3bxQAz1UyunU0sLDAnYmvS3obMHLFgCspzd/fskTpnCtVub3bm0fCDcL4BFRytdjZy0jMfTuUkAanMEUDyTh8yqEtru2kDGdIZKpvGEMEh5qm40kVwsm1531sU6mMgeY3w3oTkT9vdJHpZanA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(31696002)(6506007)(86362001)(2906002)(8936002)(4744005)(83380400001)(38100700002)(26005)(6486002)(508600001)(6512007)(5660300002)(54906003)(6916009)(2616005)(31686004)(186003)(8676002)(4326008)(66476007)(66556008)(36756003)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OULFxpeNx7jSp8p/NdN2CFNc+y63qXMvAzj4yYtnSR8t01lh8edbCHx2s5tj?=
 =?us-ascii?Q?XU/X6vMB5WvwNj3WrAIAN0ewuU7HsZ1edc3xFGvZ8D+8j1XD6FNPiwicu/BJ?=
 =?us-ascii?Q?fObmx9p/qEAFhd9OBzSRlbfEfinVQEbeLZhOH3UsG24NeQNnq7I7j+0/9Gph?=
 =?us-ascii?Q?sdGH60HVAdFgfovlVgkYSJSnTLZ8rXGAE92dsPmt47p1mVCE0+b4kwS60iYT?=
 =?us-ascii?Q?QD/8aq45avLyynsDQO0RvNEVUBTiPkY59NM+YTf+iwfn2DxD0TDhX8ivRAO/?=
 =?us-ascii?Q?7QWNZMJfxACy6MJhvTDrDj4joxWTJxMphZkgl8X3vHRvsvibPziQkTAJT2EW?=
 =?us-ascii?Q?pNThb1yQrnYKMSfh0220IuXw8Pkge/iKSaq4T0pZtSr3RM69RSJsIRrn2b3X?=
 =?us-ascii?Q?uWS7sWhHoiM18WheWe4dvvtwS15YOGvewUuxOEA90/YjBTe2Oeo552e9uE3n?=
 =?us-ascii?Q?YtD9ab4p6oTM/lPDUobTxVVI/vXxB76SAH4r0OxxsM9yQcsfGKScqF9ehJyh?=
 =?us-ascii?Q?GSJ8MlQn80QsWuaI17jQHfed508g03HXkWz8l53UmS2Tg7DjXW14rWRsF0hB?=
 =?us-ascii?Q?bJGWf5GGCK4jESzAxV8p7Df59KzxKP77e4kOA7gayfkTqidU8YSaKySLkuoP?=
 =?us-ascii?Q?hcnaIKTmYiy2JUSWgwSuIJRA5YlxM9cw5NBJet0KzXEwz6l/8qqlUhu9ajiQ?=
 =?us-ascii?Q?xWT1GnO9KXKPu00Vv5Zw9PuRDrmR54vblW3vtBL4ND8dGemhKEt5PPVgUMLs?=
 =?us-ascii?Q?4E0wRNLvhDBDg9Bfu2Fivm/NKtvxZxNqOclkh5OKqpd+MRS2wjYPL/a1mG9/?=
 =?us-ascii?Q?EdnHTRTmjMy+4c8X3/eUHkHbZRvX8cZJM1erL8pMl7TccljGkAh4HcxRwqz0?=
 =?us-ascii?Q?GY4fgPffunKklPF8R38gjC7/U1C6SQWATt71UCBggcdUsGZS0oXMvzGVwJO9?=
 =?us-ascii?Q?bHIpSkvBxKnwq4cex1JjUnVmylTT7ju0xMwG6vFwF8F7+Zqnod38jWLtTXVb?=
 =?us-ascii?Q?IgflVM1wCdFcGRJnXtAo045JYo56Ej3YnELvu1wBNZneJMl3n+aqwvezKgpH?=
 =?us-ascii?Q?M+ZnP7Pjy1IkZOWYhR6ErGGPv6v5c3RdbLMs3U2IwGlHnZG8M/OEJ0PbQgUq?=
 =?us-ascii?Q?ZHyRas5gwemlJqvs1ufIKSaiol5z4w4+Tips1Z7A9ra4shhm4LmMMVzbiLJ0?=
 =?us-ascii?Q?pnl78Ux+akog0SU1R/rzSxQwB0oxXyq+4iQBqSJ/rBF8tttU3qSaPPwgS7YR?=
 =?us-ascii?Q?OcjSm4oSaCYmfQpfPa01pxjsPPjtxUgjSFtIwROTsI1UPqke9UJzoLZhmX70?=
 =?us-ascii?Q?rbFv6ryRNLoXVmXOUyKBJflcygz9SdHzIKSTkRBP+8HUIubUw1prHBWXiNB6?=
 =?us-ascii?Q?suG6+zQHY0DU1B6uyoZRns2alVwOVqbp8ZbkzWK0ZQb4OVQvgtAmoAiD5kj9?=
 =?us-ascii?Q?vIvylXNHYSuaUKdtssg0V3Ae8RwXhD1mQEhg3um2KCWqPijkkcu8KgUDy3aa?=
 =?us-ascii?Q?kUp33dnDfHngvE121106SZSdYC8n2cJgoWEIPe3+duIneXVQvhPkxpaxsnDO?=
 =?us-ascii?Q?9VZBpgZRn14j18G7gK7G7MBI4zYnpbGeMOxRnuCAQER1jsJT5Xfo/DIoMVwD?=
 =?us-ascii?Q?COPP0NEo21gAItuG2X5y/FjxOnD1BW42BbqYIyHKSGZAvEHg+2sj1o4ZDlVd?=
 =?us-ascii?Q?5I0/4lwIpBQx2v31Dt8F1J5jnJlYbp/nm90sYr+IC0d3dyVuIEfEe/pm34n8?=
 =?us-ascii?Q?tDnOxNPKMA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a6a45c-4070-4459-5a06-08da2f5e3a9b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:44:58.5380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnkUEW/V3bQb9rQ0dmEwRz3rmv9SBwD4JDFPVNyqu6TEWjnq/qfyjiQLTouISrnz/WJwDoOArEXf8I8D6FtEtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5280

On 05.05.2022 17:15, Jan Beulich wrote:
> On 05.05.2022 17:04, Roger Pau Monne wrote:
>> That also covers the PCI bits which I'm interested on.
>>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> And thanks for volunteering.

Or should I have said thanks for formalizing what you have already
been doing to quite some extent ...

Jan


