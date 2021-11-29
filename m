Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188924610F6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234377.406764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcoL-0002pA-OU; Mon, 29 Nov 2021 09:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234377.406764; Mon, 29 Nov 2021 09:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcoL-0002m6-KR; Mon, 29 Nov 2021 09:18:57 +0000
Received: by outflank-mailman (input) for mailman id 234377;
 Mon, 29 Nov 2021 09:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrcoK-0002m0-US
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:18:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 604d9ff0-50f5-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 10:18:55 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-xKLf9x0qMbi4pKEmPVDgOA-1; Mon, 29 Nov 2021 10:18:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 09:18:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:18:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0071.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 09:18:51 +0000
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
X-Inumbo-ID: 604d9ff0-50f5-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638177535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJJ13KI7TZkpW/GBncbTMtfHVMj3Vo2zygBGObSPje8=;
	b=QYCLuP4lrwR66WJ0R2NTnUoaH9zlwODKPpNmh+5kq8sFBtorIDN1/a2z97rXnpAc5IRdjJ
	sTE6TMtZpjCEaPgqEZDZ+JBFjrBfgAyshyIBBL7W/7TxHYpvKUGdymwm89DuJiayLaY4Pm
	1anAxJNPIiHOuiC74gcPslv3bs5Y98M=
X-MC-Unique: xKLf9x0qMbi4pKEmPVDgOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSfO8FREKojO3s8zT1RbY3HxGFWnVQqVOv1DAD7lJXkJE1lzCx/6kVzIfzTgjhzzmOHk9U6yrphPvH3r9zefjyAI9KfbwElkp4l7S1p+dovEF76vpcivYI0mY7raGIfW0kR8I6DDJW2MYfDRS09eK3hej6JSwDZqIZ/a5txo3RTSFEWoK84SYgTdyxGLt4G1YRecy7dzColAHrrMEeHaj254uQ0MCet77pSif8dbtKpTGf4tOZNaykqmu9EpbFVeXg4R5yYLqLGudKiBJ5wc8m6XQxCdYMooZLhMpLeVnCHz3TV5/AlDxgb/QMIGomLziV1i12T5Z9pc7D4WmRCmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gb/fQR0I8QmRGQLMxQhmqOlVFGZxl/0ilDaPbMba7Q=;
 b=izwRi6Q9C2FCTxb9Laoe2twjXNszx7MeXlC24O4a1l5UKZk68iZAV6Prd/p09PBpa0ouZF1+j/FhMpa/yoISx4kzSzSuMz0EU3biMa+m+NkYY2SsZmIDDI1LLA9xTE26szU5z+vLidyKE1DxA/B8MraeHP2Pli8n7exKKcUDT6omvjwn1iXIcrb9HIL7w0oURaQLV460N6ki5Uh5YnNNGtKKeSzPpBTYWXaSMZUaTJ4TerdbLP3BvsvxKBSH8uGXhp0zUkUKU7X6x08bCBGGiRmQbnVTmmjtksrEtrcAmKms6EvHlJYFGqQ88UA9u4Nz8m6kq8p2eJ3XOhzzBIagMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48dc432e-b607-d792-c1e7-b5900707f95e@suse.com>
Date: Mon, 29 Nov 2021 10:18:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <2bc4eeab-a69a-a953-e09e-7b87f7dc4b85@suse.com>
 <41e1f32d-6fe0-b588-ca27-8ddbd77f25e4@srcf.net>
 <ce727ab2-da21-b013-9650-98747ebf45a0@suse.com>
 <7809f437-320a-6749-e33c-92e641f87be0@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7809f437-320a-6749-e33c-92e641f87be0@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0071.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b855e91e-8837-4307-3d85-08d9b319424d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4847C75612528CD35B7DCDD8B3669@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NohM8dQkhrAyVSIHXycuoNBe/FQLQrS7FTjHpDYMeK5A59PSodPaR6MtdttzMaq3+1QgqDDkDluYybck5jai3CLr0R/T54JFzIXxFmbv6/kuXylqHdiogRiRhFTvfM8jwW7F5kgIT7FkktWCshAxgybaVvwCmEoBNnsPbYsRe76gabUyc8YuQsvR734w5lMK9CHpQZhS8dfIBg8aHPGLoPKEWOnKQLPJ70nLCJRKNu3z87XGnhMW/EagnQ1V9V3wTV3I3tnIZWn/4HTDclrvPyc5I7Or2UOloDwmZ+gmLnXkeEVJbvp/TVH+R6rNUj8mWdJGQhbwVTIOW6oVNoED7NTUB6SQwtQHwgYe6hkUzTx9x+TWkmkY3kAa+9tk8GhIwWl7onWi2kUo0SllqzlBYON8buNL45EVh3WzqTXnx7DtDPnKiuz6brmOJiDxq4JfwL7ikGYvitsW+G5oXfLlJ1/H96N9nOnz00uIaU1LgtLT5kaPahKEqGYgSRlEtCYnS0Inr4H35qM0p3OE2IurfRvMW6dgMeD0I5OfbBCY7/LCzvLisriyarxOa2f6sP6eirOP43cyfVN9pNnuF+2QB5fNOzx9SC+9RK+7qLdrd75UZcRYJafmVFyaGD+vQj7frB6ma+R0JpFTAf9JnjVK1VwO27/GHyNuX3I6k1/Z34MZNlUBeS6JIgOrq6O1yllzwaxIDqJsTq0HdkOHv4JCQWQsKNlTrWmTVaZFS/7gDBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8676002)(36756003)(38100700002)(26005)(508600001)(86362001)(4326008)(66946007)(956004)(316002)(83380400001)(66556008)(66476007)(4744005)(2906002)(5660300002)(6486002)(186003)(110136005)(31696002)(16576012)(54906003)(8936002)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ITnk+J2U7UzCQrb+IVEssP0DR+L8wjsDrphYSH30g7gtxpGh6JwAPa+f4D1B?=
 =?us-ascii?Q?O61oKkFpZokIplhMDaAoAzEOdEE1q7yHGVGI6bqLExVeR0cwqpm6BzcoFByO?=
 =?us-ascii?Q?ghvoWbMLELInk+zLJlNSwrovkSBBjAqiKD/yoAswfDtn83nNBdXUuV0ni7LJ?=
 =?us-ascii?Q?OX3PmMMZLU5VabF8EL+SPD5h9ZKhaYXNsPXwKhLqxAlWM8Oom9B/VJae1P1s?=
 =?us-ascii?Q?5s37Uw2fJk+zkcFNQyoYEamcL3bfsT2H8oyovT2Uku1Dab4pLcfeV8/cohbR?=
 =?us-ascii?Q?EEA7ykzZmVFffQ8B67exyTg/tGLvsAMLxDjpseUcTMjUy+laPI4DxcBhSy33?=
 =?us-ascii?Q?EXXlAUAADgNRzkD6x3HBy63v9z2z8O0uy52d+vFQTpVYdoUNmxN4WAEsGLKz?=
 =?us-ascii?Q?MaJErFQ2qFc1rZt+gpJaw3GXOGWOmWfnoQXbafMttWPVot9ksh7or0Gu9MAs?=
 =?us-ascii?Q?YWbIfZRXypbHtT64IvrfUwXx91/3O0CRq1ej3CsQolki+PhbxuuzRYS4j0sQ?=
 =?us-ascii?Q?O1Pyb7g8LR2jkcWT7QOc/Y8k54o8UIg93ypocOz2XFjLHrciJQEEsBW5WdSA?=
 =?us-ascii?Q?uOoLPRXgVBwJvxQNdI/cDdUa8BXIb95kEasKY4cRb95PezuFGy+wNupRSOSy?=
 =?us-ascii?Q?APo/oMTU3UZ4fwGdUhCQWynppQCdpcGc8EKJcXuMg5X2qLBX+u3WnmqNHpV1?=
 =?us-ascii?Q?NiP0PaD3aRWVnXnEi/fl7hvglF6p71OqrbdkNamtT/NITvSWJkRllX/kY6mt?=
 =?us-ascii?Q?3edpf1NmTb90yC3mtgaQOoMwWPXOIT97pSNzMS8k5zLNGoVr546pYRqF5dJL?=
 =?us-ascii?Q?Uah8R75mrL7Uqb6BKMi5ryZY7fAKCMWKcBEd9gZ/9BigV4P9XObxQVjkt8gM?=
 =?us-ascii?Q?Zn1dLPsXrFc3SDwbjpZigbo8dvaP9NnIYpfSGSpIeQ0H/UOywLfmF3qWuLx4?=
 =?us-ascii?Q?T1AdCTCGX70HGndYG0JsK4TfsDzU3Q61e5ITHGiAeDWqW8aBULHBAzzJVf8C?=
 =?us-ascii?Q?Iisr7d6t6fsDXFp+d4OnEYoGnNlzNO78aVHi+bMXzHPrxTGyMayEfGD267dj?=
 =?us-ascii?Q?Iy6hLijITD73DfL8sC/cIia3G0GHpjygw70CPslX/D4iC000HB+isdo4j4FL?=
 =?us-ascii?Q?+MLXTy6vo1NfyhpLcqGJ5d/tJIMYF2eGlJ+4nuTiCOzpWkRBVitgalNp0s4N?=
 =?us-ascii?Q?s3YpFeU8rHPB1ANy+ousGd/Ag7WOqZqju6l+mIXxSNtajpW5Q3Z0uh+wGjkH?=
 =?us-ascii?Q?Lrc2WjvMdy5SRfvym5H4h0Sds8oOQWzuWkP/sB6C/aV7+oApFphvUJUfmNAZ?=
 =?us-ascii?Q?0k0Omg9mlj1jWdKCcb1vXTrcL/4NIxF1cc7dgnqnfkmIfS2GQ7joaCtbQGvA?=
 =?us-ascii?Q?KceBDYQxSk4iXI9O88FsGiU8stv6UR4B5nTV+SLrPLEC45/i8pUftra5RARW?=
 =?us-ascii?Q?6IxrvtzjW1urtoiX1J0v849rvWQ8qoobnb+nUAnbbMYPBCbswQFMGkganX+n?=
 =?us-ascii?Q?WMxHEyYgjX+FdAIhYYUOzVkdmwQXhdxvuaHsuIRXk1i7LTE5DMtJGI4zr76Y?=
 =?us-ascii?Q?wGZ/zU14qQx+51Leb7p/nUWatckGquoDefyBZvAXlTfDRQ/dB4VIcjt2li7f?=
 =?us-ascii?Q?Fxv4/QiVLshOFGi1Hdn966c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b855e91e-8837-4307-3d85-08d9b319424d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:18:51.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrIjUwQutoav05hZilEaDpqc3/i3sSjUcjG9chFVZ34HUrGVPrEevIq2R1FIW2QEjzUAs+YpgfG9sNJQe33mXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 27.11.2021 00:49, Andrew Cooper wrote:
> Given that Marek has kindly hacked us up a check which should find any
> arbitrary violations, and on a small sample of builds, there are no
> violations, I suggest that we clean it up and put it as a check in the
> real build and enable it by default seeing as we're right at the start
> of the 4.17 dev window.
>=20
> If it is seen to trip (and it might well not), we can judge at that
> point whether to rearrange the code to avoid it, or drop the check.=C2=A0
> Until then however, it gives us a very strong security statement.

Sounds like a plan.

Jan


