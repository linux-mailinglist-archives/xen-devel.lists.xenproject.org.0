Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ACC4C6447
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 09:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280210.478060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOayf-0001Oa-Aq; Mon, 28 Feb 2022 08:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280210.478060; Mon, 28 Feb 2022 08:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOayf-0001Lp-7m; Mon, 28 Feb 2022 08:01:53 +0000
Received: by outflank-mailman (input) for mailman id 280210;
 Mon, 28 Feb 2022 08:01:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOayd-0001Lj-S2
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 08:01:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af492509-986c-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 09:01:50 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-bcYMwRR5NumY8ps3DmZtOA-1; Mon, 28 Feb 2022 09:01:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8846.eurprd04.prod.outlook.com (2603:10a6:102:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 08:01:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 08:01:47 +0000
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
X-Inumbo-ID: af492509-986c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646035310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aHw6eS3HhLdhmS4JyEajEPzY6f6I/mNQ5p2ENR9IAg=;
	b=bynWTn2HcAd0uB8RunTlwImLs2VIt1UucYgPWgdOcQtBKHDEn0C8AXBMnoyPolX5AkztG2
	2dAoS/FY6OrFQ6uOGRfQPrr+NchXM8KK5Qssc7fQsiBlTm4ozbE2NoOCevwCG3FEfNqjSm
	beIPs6c8COFWj0KZFCeZcQg1UKoQmwU=
X-MC-Unique: bcYMwRR5NumY8ps3DmZtOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxbTY0jqvOhuEIWHupiQbiAIEbrUVW19fjgLKpQYH4g90LGaCfrek8JPXL3exoB3GGYV3fit4Qk0VaKYdpSk7MRl8AsYI8i+Qa0bcektXgdXIbmTrRsqiCJLWxe/ZtAbABGymBNGlzs7EO0cT0fN/ld02kchHkXGp+DAmW1q/rFZmCHU0sLs3EW8FNypiLcUTwuKS0UwHfVhiAavf181CXdVARbWi/XUxVVae2FZaGLxS8hDez8jON7I7t4vE+9Je0f76nO8poDeKQ04XqKcqThCubEedjfE1rtRBmxnJF9OzWbdNxpBnAcfIKmb/QxHRbq/Ufz7AYY4gHJSZOJWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOqyZQ+bY3Yh8mG1PmvxpxUYf9LoPAAtucE3Xf3e57c=;
 b=ctoxHho2wayVhV72aP0uqZm3tjxbFIqnCM875MSzs7ZHyf+fhNpCi+lL7GDDYJQWlb7sDwv8yDgz3tzuOPhJsX2g8Bmq755u7y/SBHkov2dud/SsBfHzre9UaOOa2YFyGr5oqM30KjQYeItTwA0jed+0cs+BGHICXdamGSlDrJ8LUBzdePeSSLjFI20Ie2V/Y14ZTgt5YDhRQOX8o8RtcKvFLolk21Rw2ayE8dh42RScBpvmg4jeQtd0RF9AmBaiwQY+6Gl+5sxv1uAhy95b9Uc4BLCfS2aHDP+/i49BslP561ZSTUtLWScnFPNRMZMCPmI4uP1myYBv0wDgmDwnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02055c67-89a3-b60d-5f8d-cca5d38ea227@suse.com>
Date: Mon, 28 Feb 2022 09:01:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] vpci/msix: reduce indentation in msix_write PBA
 handling
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <20220225153956.1078-1-roger.pau@citrix.com>
 <20220225153956.1078-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220225153956.1078-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0416.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a4573d7-4b74-4618-5c13-08d9fa90918d
X-MS-TrafficTypeDiagnostic: PAXPR04MB8846:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB88463D734B3EAEE36271A984B3019@PAXPR04MB8846.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	92bjdUXpiC6TryRJ5x3Ie415ZGsGTECxKUA60kZa4vefm6q+pJ7d0UsbdLq01JVSCz2eaO55V5itvxdQ/b+RsPa0oFPAcWDoj8nL5PWm6y8JEXNW+R5k4uAf8KtgtCfQoNZYstxZYGV6nX26X2sUiuqTLh+c2+drA+qpJWt/K61aAnMWxujG5deeVIY/NeK0ncHHJs62RVtjXwsjBrtDQUt3YsaqDI/xb7XqMONt8QEfYMcAonC6hL7QFkTGX8r+wL0P5PSFHlZGarU9w4SB5R1/mEuZxsNTY4PPm/CQEzvZooBdhamPKfPe524G685Cd/WXz65aBwEN8ydm3n02JquE3bAAo5iPRNDW2rD15pW4MslgmddW1FUASsSF/2hLBPkq7/Lackp5ZNS5TIwdaRKH2ROL5VdHFsP0cFRrHq73c+Db7biJ5DlWEKx9au2vtqXHKQIqiB//0rf3fPcbceDh6drwTnKHrkBqNRnij4QfxLjH/3Cx6ukSGDhbdAIbp0nD04a7uWRrfJfD91mCqURVFLjprBUu5c5MHw2Ip0/Z4BfcoVMLWFdE7T8pGjE4jxEDkt9TkQJem20IjE62cQHNqc3o6OjdhKvIYsHlxc4PPTR3YsjEn1tB8KcJmglsDxNTgGe1tZXKr2XQvSQjIjQGihDUUPSTzQF6HG0RI46fm4KwdQnL/AjthM9Aof3fgwe71I50Zpda9oBDQtAGIKkMnTYZd2ZtVRuYLoBlv/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(31696002)(5660300002)(2906002)(53546011)(8676002)(36756003)(66946007)(8936002)(4326008)(31686004)(6512007)(26005)(558084003)(2616005)(6486002)(186003)(86362001)(316002)(6506007)(38100700002)(6916009)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KOwiEV1jXDdNcqT3IJdlrY66g4BlerO0t0RlQf0AKbylHbiCtV4lgtqZ1oXi?=
 =?us-ascii?Q?uxR5fGvI1wdvfzUBLRm2wXuNIvr05AYFY5TujS51ea+sUMDtMLYzi6nn52tH?=
 =?us-ascii?Q?N6a60/uAktlSxE7f3NauHwvkjkwCnTYtdR780o6j7vuAo5PGnBKhi+nJk+nr?=
 =?us-ascii?Q?YRBW/YzSfmQ6tsVvOvt2ev4W4yZJv/TL67LoEOKJHOHw/Mb7BdcSjmRyZmz1?=
 =?us-ascii?Q?5aN2UakbGUAlt9lcjODq8ZmekD8Pij6dg8B2MKAtPoCdcl0tX0/hFV+zgx9w?=
 =?us-ascii?Q?8jCwD1YzSbSRaSVnYDPzwoUfJ0OKdGFE81QeMk03F19njub8LjZluvwHETos?=
 =?us-ascii?Q?EXuabgr4KM6KgyzYcLAzOSQOxFlKr2kxDG3eMK5q+55+vNsR285PJUbDtpy8?=
 =?us-ascii?Q?sPeISFo0yF+dU24pJzCmLUByOmhgjy0il6tORVOZ31HldpKHZzEo/ZAmKazo?=
 =?us-ascii?Q?IC2YPySkEPmZ3y0+f3ldceJ3Fr+Wd80tVNvzwYjO5lwkFu/+XpDOUxDVwTFx?=
 =?us-ascii?Q?0iGsGmgRioSaeQKsDS2HSHaQtigcXD1zXw1rG6Pxd5Sw49VyOoRbnR10mtFx?=
 =?us-ascii?Q?E3Y5OQDAqe1Ou6fYHqfRtg8aZnek7v3oAA4+8YcWb6DlDkpxkC1SIoUCyLJN?=
 =?us-ascii?Q?TUghiZiYHvuHuiqubReFU2CSaP8TY0Gbi4+1y88sRNx6lfrT4oLVtyXjh7TA?=
 =?us-ascii?Q?90em4Xy8+ksXNkRQGtEnSmNKGBuNq0KidT4OsJLVH95gdPknO1TLz2bM/0TI?=
 =?us-ascii?Q?6r/TjLM+FnHQAR0LpTJb+Jk3Uys5YuBex2XSfixMWRq3zLoVkjpScmkTQfN3?=
 =?us-ascii?Q?V/PPx+17NVH3tqU4tGZFnRR/YmQAtrtmSYnk/nAqcvHpChodMCkiitdXYp06?=
 =?us-ascii?Q?y+utbowNv2Vi/rgVYt1Ap7vPNSTwiqx/LAfo7J1jeheAJAeef8eeG5rzqq1/?=
 =?us-ascii?Q?J8J5R67fnUgMJ/CpILf08qa0ZY1wJf9XGn5gc3jqX2oTGrjoOlJMCGPuXClG?=
 =?us-ascii?Q?CB6b48tc+/jx8odgc6AdWaRMOt9O4sCSDAkCB8LaigWqtC4XjpekKPqRoYl6?=
 =?us-ascii?Q?74OldEFWYqwfWFSye/TQUH3MQXjMiAqmKgxmjSiiC9CYBRO7k71WLJfGaqom?=
 =?us-ascii?Q?TjDT6cqAtgX8F6mF+ndXvyNBNP4aaD8PHTkPHXBWpIpg1w/LkHfSHbPa12b6?=
 =?us-ascii?Q?ti8JvmesyRtiT7xCThxbBO8cdXw3XG3A+/EW44ZpWkzGvFzjO0gXC6tL599B?=
 =?us-ascii?Q?4ZeNjwS+eFRWeSK0AwaZ0O2eXMB+apJfgfMFEBTNCvAhXteOH8wIOtJra3Nl?=
 =?us-ascii?Q?UhuQRe6TVMzSOsjScJv9mYk5MAcLtlIvkXvBnl4aYyG2vVDLU8X1WdMiB+kq?=
 =?us-ascii?Q?T3oe2FOCqg9FwgpOhF4NT5RbcSEvKn1K12uGuolMzWiVNILzIZfFEOWGeKiN?=
 =?us-ascii?Q?XyN9r3TogcglFrMK4JyLg9HOOAdhIjlg5TNSQoSKqo05gD4dC1mqGHuLW1NS?=
 =?us-ascii?Q?8fdUdeHeFduaUFIyAmUGtKIdovsI0ntj3BlJTD4wHkHCLJ+wYIqzedPDSJio?=
 =?us-ascii?Q?MwAAPXcGK26iPCFbXARIRjru3hAx9V/BtFhT1yz1nA8CnKuiGkc05RVtxUwC?=
 =?us-ascii?Q?3lZmUXi+xRIHbeM1DoaoLsg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4573d7-4b74-4618-5c13-08d9fa90918d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 08:01:47.6643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiOuw0IAGKcTFokML+5PoQbBaA9xg5aKhW3bpa5ppQHJt1Rf8kPZDm68wUW0JOqSH4WTjP2sQgctVzO8KkgAqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8846

On 25.02.2022 16:39, Roger Pau Monne wrote:
> No functional change.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


