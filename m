Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B555455874
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227289.393077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneC2-0004r9-3k; Thu, 18 Nov 2021 09:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227289.393077; Thu, 18 Nov 2021 09:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneC2-0004oj-0q; Thu, 18 Nov 2021 09:58:58 +0000
Received: by outflank-mailman (input) for mailman id 227289;
 Thu, 18 Nov 2021 09:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mneC0-0004od-GL
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:58:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23f19ab8-4856-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 10:58:55 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-9DDlEaxOOPK-XIBJtpG0hQ-1; Thu, 18 Nov 2021 10:58:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Thu, 18 Nov
 2021 09:58:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 09:58:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 09:58:51 +0000
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
X-Inumbo-ID: 23f19ab8-4856-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637229535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6wS3yvgiK4BO4uZI38HHnkqiqbUgPZ7hPQidz4KiNo=;
	b=N3Nn2tHW3ARaBLSFLdFMEMtEyTXF4pP2DOqheLZJjAW4+y8+u2VEI6h+w1SASgnaEKO9DY
	5wVwCE8wb4KWZ9gq8Icl//gpX23fJCY4Wqa0VtM77Yr0G7KyFVT7lbzHjlYPQxuujyil5m
	DlJN+NM2lAwQM2BPROIzoFs5qsqu7cs=
X-MC-Unique: 9DDlEaxOOPK-XIBJtpG0hQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czUFdtuzmc+xbfT05e122OWL+YoHNYlEY0qZWNJbubVzV2vF3A4HCu0dwTPhoo6dfDL9tl/zZP2DbmZuAoXqxrf/lFdpeRUz7//khCeB0VrvDhs5u3KJYwGSYk481dP0OhcyKQJsbu7N9jFheOybX1QS6lyKsGKq0VS3bjrzY7QbCKonuWgHUk4m+0pizWuv3nbCrvSYGYZBs/J8SBFS9/YJe4q5339KejiiiJ0RYQqNAXLRpwzNtq53ME8r+0fcdgG0184GL0aDjJaQXdXFbXJo06AHJRuOg7MPlxtv9Aw67VBkfFQJ7j4lYnX1UURRlHoTi0vH7iz56VjJuZ28Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuHa7okESgt9qRNIJdeUHhwtPOGDq/Y+/WpjZzyGnnI=;
 b=iCLzc/CUwpPgFydcVn8ewaSEy4FzTLN74q2SfQYrx/8qIqmJSY3hOzUPzDefEMkKHYaj3K2+LnFStkyuHh/UWCkcIuijBZIPXJPEKa5FNGerc5Xo7cPbEbIXl4Fy7lVKx3TYjWOhmIFmZIXbEgEzrvQW4as1zZkOhLLXrDrK3o8OhY7FOJ+kaqB3ZrpJLEBn4QT3rfd1mxRd7hxfwBYRaIGeNDyzkDRhTtsligIrgtDWfr1NHE3q0DzA2ciygmTH9767KkBet7TXeg9IckDaARo4ZlL9uK8mS4Vo9nyy8zKbvuo8b2X4JJDfsvFjyfuT8KlBbK+yGlNpM/3mbmDygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1dc1fed-8f07-5074-592e-b240f2bbdd44@suse.com>
Date: Thu, 18 Nov 2021 10:58:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/smp: Support NULL IPI function pointers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211117164852.16394-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211117164852.16394-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d52ce3-aaf2-4f93-30ff-08d9aa7a0662
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31201A9CAB4761B7EBA6746AB39B9@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDYnY05cyX65p7zEbVA26hFKsfF9/HPNuet+5wYpQeDfXVc5B5RNkBzfeJatl2h83qXThrDxAN+sn1HiHn4vN+y1OPFS2Raw41ElCTmNAAQ0DE85XwUHtfRQWXPOYb7HkRdDwO/QDFaN1epexLueGRf0YW8itWT+7NWREUMWQFWI5SEaRzeG7c7uEKyC3RVDbSKgiEpsKf0fBj3oriwkTiHBUVbjbCva4/7Uwu8voMo+KuxmkFMNJpHX1rzfj7a/h2N7JWmCCTDye2NVPlNkL88K/7w5uQvxyWlpI77WZd7Q+GkGEVB1WuOviPA+YVWsUnjkRY+F5lwMPiT3BTax2yKvHwDy+jAPxgr7YKKT8HyRUtCZnSlxTSYwVqEWL4fpG6U8UINB8EWNF7VqQBQvwqghSYNeYjscGVczHBjEz9vdMZZ3P+iYdSx2liMzwun/wXgayP5p8aNSJVEgYgiIqlKn/rOvfgwmnDlLUH9pXJla7hwObZ7ZyxmRiks5E9beemfWSzRctIeZjQMq0ErLn4xA5Vepzd7q6zHTbKnTxKITzPvuBG38ItBK9rwfqfb7kCLpFm9XAQ4+DtBrjjaovu/ifoQbVRiu64FgntmxWjyzsI2ewiUiJmmYZLOeLLBt9N1Q1uRGTKdwO8oh7LdEs9ndrBBpX8yF6qqrmJq+ujZdd/XuSYn6xo9qUUD9TsyIKuV+fAAN1jjnOCHIB/7bqzqYc8FYit2lTq0IEymgd9Idoq4rDSswCCdt4B83fjQM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(16576012)(6916009)(31696002)(86362001)(31686004)(53546011)(8676002)(5660300002)(6486002)(2616005)(54906003)(36756003)(956004)(8936002)(83380400001)(38100700002)(186003)(66556008)(26005)(2906002)(66476007)(4326008)(66946007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UD30LXM1jTjCMjR61UyHYg/WocLKe74dDOWxa9OgL2IKKTfXibsvk62+db4k?=
 =?us-ascii?Q?lt6Km0MfHc8ZuOVw1hdqMFArfSM00XFOaFduPE4xY4J9aXjG4pRQlJrB9/X/?=
 =?us-ascii?Q?HoaXDHdDlx2xQ5sRj/bDgMGndUfGHhSouqaQzfNxuYgck2prJ/hUDd/sPhrI?=
 =?us-ascii?Q?VKMBbTeuxXVSkwIBm56nV9Mx7+FQ7j66b5VW514pXYZmXuMhm3sUBisxLSjK?=
 =?us-ascii?Q?UndjthyOK21/8R6A7/jE4L3ZV1CoMLZBiIh+LW6tJpvjddtIRM9TUxjvOcAW?=
 =?us-ascii?Q?R+K+Hgz0gNoyUfRPKXVC99gdkaA2+q2/kr3VaiVl9fQEODghjcjeXLHpZGwG?=
 =?us-ascii?Q?/wGALcyTYYG+OIFO4wBgUK3toBRGkZrWcEofMzaLvCxTRcBJZJN65hwynhwo?=
 =?us-ascii?Q?kKsC+aFTCbAmFCEZhbg1LTiBTEUhxnAKheOpJNLvpVqAyPn6GfheXutrMMi6?=
 =?us-ascii?Q?DR5ykeLgzxznRkw2eUCDOV+ckkw2Vev9aihhi0tAW2iBdo8xAbUJlvMp7Bsp?=
 =?us-ascii?Q?bQ0Q1EphSVri2VUGnaNrhCLr87JFxlOZTmspYDNHbM+Fps9HCIIcnjWDTD/4?=
 =?us-ascii?Q?hcbY9VSVMkv8Zu/+qqUmA6Ezzz1T37Dq1NfUmsJM96q0COItIhckTy1SetaR?=
 =?us-ascii?Q?Cl7L9Li7IYMnz3kyaz7n1+kYiucN+hgZA9E6/Pkm79dUnJ52RLSjPML37iAp?=
 =?us-ascii?Q?2YZVKI0uG5sNsY2x/9BGOiz/WqjomiqkwJUjUCcgR4BPdNKMAF4bXIQ45MI0?=
 =?us-ascii?Q?iF+oWY8GTs9D0aJDzFffGfLO+qVPldAvfO3x+GooBGRc5LrmFgk76MrgjmoP?=
 =?us-ascii?Q?Jb1endByioRzGZNeGjSKvhJ9SoZDaviA2nUCpyr8bjgpOdc5LHO0P4T4V5bo?=
 =?us-ascii?Q?FBVo3rD7QvXI5KBzBCZA+zuAGWVaiqAF6WM8gdhpAoM/shLhn+G25PC6HJAB?=
 =?us-ascii?Q?KnBcQYl/yObs6HN0jWjOjOiVmBWvOdFfr0xArMN5Fq/dBxNKsjUGf/ZL5ngm?=
 =?us-ascii?Q?nvmCMXjaygr8ptbyQLdHHxH+uDLZ7/etYqiH7RB/qY46cVlVv303/bSwOVDB?=
 =?us-ascii?Q?zJoX7ZmzHoIs+xX9nUCXW2fTonYWB6DiXXoOmmpgYu5zdkhBMh6lsLeVHqJN?=
 =?us-ascii?Q?MG/PdlMzB51Lh5cYM264bnDSIn3t/wVOtO+tEjTs17hJctL/RkrUpOZilV0M?=
 =?us-ascii?Q?n24Xge8jiXZnRqeeYya7R6kuxwzzY6TKakkDaUyEDxgIV+nfBUfKpxkLDBCg?=
 =?us-ascii?Q?ATJUBzmHuYmYvBYCWPup1kI9RHctD19dZOT0j16bR4iPu3MxJLMXz6NxKZSe?=
 =?us-ascii?Q?4SP83lKlcuiUSbLlTduj83fwG41h9FxuUJ6WqAcDOY+mVlxOC0hl4CXLWiNF?=
 =?us-ascii?Q?oAOZ+8edlk5h+XAeTx7iA3MYz+8sfX+sisJ+R0jpuQGbqIKsfbH+iXMBabhm?=
 =?us-ascii?Q?qeKFFLWpwxntpdvOmgF1DN0abX4ww/eoDWcv0ON061/NjEEiSFhfVTMlfZcC?=
 =?us-ascii?Q?JhlIakufMKQPX3Ywj8yUFSSHnjV2ERRxM4ZtoDagInR/HmT3LuPbtH89EOS3?=
 =?us-ascii?Q?o8s/kpzi8kYm/Wx5wWRLIK/09OEfwYB0KgnNX0KF08C9UzNCQKdBWOeupgJF?=
 =?us-ascii?Q?EMYQDnZ4y49wzYe3Vg9w9z4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d52ce3-aaf2-4f93-30ff-08d9aa7a0662
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:58:52.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8EvyGDDgvKx1hIsDs9b2mS47lVNh/+YfVxzh0ruR7kYRqbJT/W8xIRFTRgUb0WEl4Mfn4GvLVerPILAyaLthA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 17.11.2021 17:48, Andrew Cooper wrote:
> There are several cases where the act of interrupting a remote processor =
has
> the required side effect.  Explicitly allow NULL function pointers so the
> calling code doesn't have to provide a stub implementation.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> The wait parameter is a little weird.  It serves double duty and will con=
firm
> that the IPI has been taken.  All it does is let you control whether you =
also
> wait for the handler to complete first.  As such, it is effectively usele=
ss
> with a stub function.
>=20
> I don't particularly like folding into the .wait() path like that, but I
> dislike it less than an if()/else if() and adding a 3rd cpumask_clear_cpu=
()
> into the confusion which is this logic.

I can accept this, albeit personally I would have preferred the extra if()
over the goto.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


