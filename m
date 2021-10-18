Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F39D431F76
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212362.370209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTZg-00081c-LI; Mon, 18 Oct 2021 14:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212362.370209; Mon, 18 Oct 2021 14:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTZg-0007z4-He; Mon, 18 Oct 2021 14:25:12 +0000
Received: by outflank-mailman (input) for mailman id 212362;
 Mon, 18 Oct 2021 14:25:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcTZe-0007yy-Ua
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:25:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3261c6a4-301f-11ec-82d8-12813bfff9fa;
 Mon, 18 Oct 2021 14:25:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-kOy1Nm5cPoykAuiiSnf9mQ-1; Mon, 18 Oct 2021 16:25:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 14:25:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:25:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0062.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17 via Frontend Transport; Mon, 18 Oct 2021 14:25:03 +0000
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
X-Inumbo-ID: 3261c6a4-301f-11ec-82d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634567108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmXPEYI93Z+HoVnhHT0BZ/msEXOKkXE/W062/8hOBj0=;
	b=Y3CXrHcp+BBxqXXoi19j5XOqk+OxkTIwadW/pjYy+iu7MwZGH8nKFWwOlu7T2XHAcBfiJC
	3h1j46Tcfr/KRsICKONkLg7dz0WWhVhSWbT09EZhTolo/yJE7+KyjeX/tivz/2Fpn9H+N0
	FSEIoR1US638WgsjAglnuKD29wpZg1o=
X-MC-Unique: kOy1Nm5cPoykAuiiSnf9mQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CP5d7QceS7eYzCxv8Tf1rWd0hbRIgv8UC7PcZKR6B9EABf9BytpNX98Sj8X21yQFXDT2SzVJPPoNPsQZTXqAf/bim0GBZ6MrBTrfpl2aKtmuvGXZXdMgol1Ju6uXokg/goFO60ynlbvd0Gs7Az7ZzQWTF8UrQImI4BdLyBdVYHy4BKxcc47NketUOvsg4oeMKI5HQtGa7EqUd5RStkuxVdko3EuPsj0grGjk+5DVVzYM6uhE+sJ+fQ+eiv95i/+Udx6f2aYANfOMkAQuRZVIsYzw8xvuH96CIc8CTQ+s8YRudY0yZwuGY2eqJ5oNDbLGrHXo7gjef1TVurJsnD90zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0suWGfn45wVvNVIjN4rGi3qwMwl1Q1X/xyvHV/N+a58=;
 b=MdJlPwHeearK8NgVHHzd2NXetbKnHaatMhx0NW+UC6vY5HZuVzVMRNZUywv4ku84tGRMEZ9In/nv88fsn/WiNeybaJbORuU78F/AjEgxZ7+wzSoUvq25ojM/J6sv8HMUIwfEkUlted/+cgwdN91rR58zMHKe55c0OegrqQFWU/Hf4k6UnSl6bx5g2C1YqiQNp6cWUtRHV3lDb6dBEMf4PzB3ux9KiyjHk/9nsjW8Z+2Z52bdR6D7v3EQK3HXE9S5pFv+4DF5sbLihQpbx8tcbkeSZQx14uJGeOitT78+wSXw6DiCQGNkpmgfvPMnzFRFpEZov2RLPT3HI5hfK+lSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 03/12] xen: harmonize return types of hypercall handlers
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-4-jgross@suse.com>
 <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>
 <0ca6cdf1-330b-f47f-dea8-442c3cc268ea@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <838aace7-8076-3c78-cb53-faef04162568@suse.com>
Date: Mon, 18 Oct 2021 16:25:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0ca6cdf1-330b-f47f-dea8-442c3cc268ea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0062.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a440df-0d45-495b-9f00-08d9924313f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43512AF1F3E40A3D59D54AB6B3BC9@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	el2ysncW1XGa9o6mE8QV8kXqaO7dIlKjz9JPcGiqQ34JUenC8Fe6bXg+EwxnDzu7T5ZORjfg3dmPNvns0Eiv+SN6zWHd0dChnJ+4NSdnPL+33IRRomDNa4belBCNZFGyka0vy3JaySyYBkVBtKIpCxT2w+ZxcZ+nSLyaLVVSRk3RFjNG+pDDg//n2QCd8nEcrfDVPJF8zY2oSEnYZiObV929yzUo2MEYgEwPtG8lS+xIKYdWiIotKOoIUH4NUmecVobUu8dU9iZcugR5xp+y1ZhwwjQUbXXcUC35hbUkLuM0QBmM2e9ApPNh33ivKv19OCDokjsPVyx1FHZVtwwTFdmOPg/yOCzdh0yLqomSoZ4xew6xwGcBcdjLxUZoj4RWR3O9S+QcxAP3qlUD5MhS979UIUELGBGf/TDRiSaYiLSromKeu+I8EpWQkFd6CuPSywsVeZ/TLHwPH34ol1RtTyGSRREtEgF/0E4Nvt6lRCB36EOGL0xt4eQ5057NNN6TsuWnF4oBUHBTByy+VdRtq/bknAcWFa+qHqSQ0JcNNiOrMqm6M4va57mqVqHPD2Ww1zZlB33oSMRHF+bT1ZJ4ZeRLYN9jpdfsur/qUUA8AJXWlDCh1JgyjggraFf5MINKHAorxFrGHDdBqtz2LOsENl6lWOVKVu/u4o3LExFPFBlJK/yEQKP54uWA4X7gPtqqTQfURqeWOYVzEOffnsx+KpN7uGp8vPcIeQOFbsIkkeUGJt5Ih4FJ+TTwBd4q5a2q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(38100700002)(6636002)(53546011)(6486002)(8936002)(8676002)(2616005)(86362001)(36756003)(5660300002)(6862004)(4744005)(66556008)(31696002)(66946007)(316002)(66476007)(186003)(16576012)(26005)(4326008)(31686004)(2906002)(37006003)(7416002)(54906003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mQtziUUbMA1zXoQ8s4GtyZzJ+I4j0LHgUOvk6tR5KVa+otxhHpjljWMvUfSr?=
 =?us-ascii?Q?sdizqh/bLDc9CkpfAJ3ACVebbT5t/JMynAym9vZEOUHdEE6+KtL58YRVIUD1?=
 =?us-ascii?Q?PifhVf7dcCiWBAio1WzKKAsvWKpn663iN/P48I5KqHoD3Iep5vvdi4PdIamf?=
 =?us-ascii?Q?6ejXBrr6FWlt7uWaUp+Lqh8KkXneuMcDoF+gHQj/nF9YZ+V/z85xmamnZw94?=
 =?us-ascii?Q?JHc100i7+PCZeGcYCObjm3sI1ieAGB8w73IimFelKXeD/xlyYeIOcSuS7DYg?=
 =?us-ascii?Q?egNvE9YJjMZe5zK9nKsogPM6ttJJAd5dglr56iLC4MieZ5eSR/q4YHihIM4w?=
 =?us-ascii?Q?KIeg2k8w70PBiucl4hJ/kr0ddasSvyAXIryhN3A+uuupKD9yuRCtMcGR7iaz?=
 =?us-ascii?Q?7tRFs6RrWY+EOVrAEEixBAWKkX7XdEWBgY7T4+o1LA6earyJXPm8EEXFyGYP?=
 =?us-ascii?Q?QGrS4TZ+o84DNr+1wdqJFXtAf7vBJ3Fx+jfLkNcXtXzyE1P0/DWujVTToP1N?=
 =?us-ascii?Q?oYh9d4Z640ibDr40AjBRMG00BxHohp44Vv1V7XTaYnxeVvtQpLcIEKv2CtzD?=
 =?us-ascii?Q?uBmLntood9pkbBOXiihXbUUCIJLxOkapuO9iAr1E1SkWIKeaEuALlfXqF1e6?=
 =?us-ascii?Q?smm0mS4ZgXCmh2jF65Ai08GqngfWNLAjxxn9Dxsqaf/+TgghsMN+wFQ3x0Np?=
 =?us-ascii?Q?GfesvdYpdX2S01ig2XUkGbX9AyITVUG5ncoxSZ1DnsU3CSwXVi4ZlV4WL8al?=
 =?us-ascii?Q?oM5zBYUwC4yyyNeArPp5ntw7Ebt2RFR9nFtoE8KRqOYO7QgwcQbBWlsb9FmP?=
 =?us-ascii?Q?IIObQLofK59KJJSvDFUzWwISKpebyzt3n1c4lqk7qc1vE84EwI2l4EZ72WOA?=
 =?us-ascii?Q?lb4JfJtUIzzJ4uivbpioMfCDjdPNl7EcY+ltv1jeoJcPvI9f8lPsdJfuC3iu?=
 =?us-ascii?Q?OdZn9NxGMIy1BzZYUtC6tnQAu+tyayeoee4rYLDn6IJny7Z4DJtpN+r+s1p8?=
 =?us-ascii?Q?v5ONXhd2XtWFM1T6wg6YvXUBZoxW5E1+ejnmjECfLR/plr+ArPf7JjITIwcH?=
 =?us-ascii?Q?9QzG53IYYe1Lazazl36nSSxQ8nB7snMwuhO0MpnP7Bt8JvhM4X5QDt2nZO/C?=
 =?us-ascii?Q?wl5h5yfERx35hIdfgPzF7q65MoRSIHuaHniAracLtbkqOqz6fD8o4CaB+HNg?=
 =?us-ascii?Q?XAhMJW30WA5aKpgzc9FPGjQdpyxpIvNNzEPu6xIoNdwPEv4dUFk1WnxpLcDN?=
 =?us-ascii?Q?W9d2EOogD8/2Wtrxu6mXG6JKim1lTCEML0pRQeHVG4Ls2xbpDhij6zcDKyRm?=
 =?us-ascii?Q?YkeHe4vojcI9Exx3widw1d/H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a440df-0d45-495b-9f00-08d9924313f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:25:04.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zP1m3ngiJnjZrBcQlrcPqMVoGfyU/nig9qfdpwfs33c2trcx4Uq/nBze2Tc9jOHFabF8dBLEGUAFMJoruBvBmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 18.10.2021 15:24, Juergen Gross wrote:
> On 18.10.21 13:55, Jan Beulich wrote:
>> On 15.10.2021 14:51, Juergen Gross wrote:
>>> Change the type of the cmd parameter for [do|compat]_kexec_op() to
>>> unsigned int, as this is more appropriate for the compat case.
>>
>> The change for the compat case is fine, but for native you change
>> behavior for callers passing values equaling valid KEXEC_CMD_*
>> modulo 2=C2=B3=C2=B2.
>=20
> TBH, I don't think this is really a problem. Or do you think there
> really is a user of this interface relying on a -ENOSYS in this
> case?

That's a secondary consideration of mine only. The primary one is
that invoking with an invalid sub-op should fail, such that in the
future we can assign meaning to the upper bits, if need be. See
their use for continuations in memory-op, for example.

Jan


