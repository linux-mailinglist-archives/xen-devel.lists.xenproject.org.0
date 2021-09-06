Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C44401D3E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180002.326484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFuc-0005jZ-LI; Mon, 06 Sep 2021 14:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180002.326484; Mon, 06 Sep 2021 14:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFuc-0005gz-Hq; Mon, 06 Sep 2021 14:47:54 +0000
Received: by outflank-mailman (input) for mailman id 180002;
 Mon, 06 Sep 2021 14:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNFub-0005gt-61
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:47:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93362bb3-838f-409e-8ef7-20d2ec162293;
 Mon, 06 Sep 2021 14:47:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-ZUAwH7HBNbeAZCKnY8ICBw-1; Mon, 06 Sep 2021 16:47:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 14:47:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:47:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0154.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 14:47:47 +0000
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
X-Inumbo-ID: 93362bb3-838f-409e-8ef7-20d2ec162293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630939671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AwH30p3wBzytY59LExMHtIgmcTmt2MaZkmO+Zyddd+c=;
	b=EwGChiis+7h69KPouAgKmLw9skNB1Pxkx9kvoopuNtlgJgPop5nCxIj4mtrsFf/g7s2C/N
	N3CWadQ4QJomH+f/9x6A4XKAwEY9hApJzcM5Hzi+UN++O+HKGo2s2UVy7AM+beb7IM6/e7
	IbvqGhdlyC4eVDlDlQOKU2GJPgVfchg=
X-MC-Unique: ZUAwH7HBNbeAZCKnY8ICBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTfbOVi/et79nELYmQ8BNq5hkBRpCAPpse63+n3f45zLQcO1I8bXM/5C/tzpVawm+6ukcu+FIf0Jc3ix63zkfJDN3UJFSAq9xqsyY/Je2wmkaMzP4pk3aay0x8Y8hYRZOFwrNhfospa9wXWGK+tWUYX/pMhQfYHnQSxfxgc+W1wl/BrNGx/NqXjz2f21B24M+6g68TT64MjV2ls55u+lPGicIwETsMkPznfGKprZs7y2XKThPwamZSvx6TknHxSKXYL59PSKhFSixdjV/VaITlayAzak/SfWeV8Xuu4eYrwVPlV2ahX9eG1XCFLZh/E5fC8CH2gvW73y+t5tClTy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AwH30p3wBzytY59LExMHtIgmcTmt2MaZkmO+Zyddd+c=;
 b=WirNdtYCR68ybkJpUYfjzFTRXSYMd29JPEu5R9tki/RxVVLJSLHmEhlP73I5NI/8ciX3HI4T5LnidemDPT0lU8Zats97XMdLBI+GKseJOjNNg/JL4cR9y74VBi9zZ3GiamfpIEIi3YIrQPCaXx4MJSFkAX3W3psU4vq1gQFB8+Z5RJOl90J2KtndwsVa84gLvIo14t8bYLQPgC+y7inVr1nbkN0eZCm0FCS1qeZ6Mvt6FtqIhf/FndZVlerMcPZzQLTEionSWciiaC6Yi6a/EzeXQOsMHxup4Q/yapY1ZHanmRUq2yOUpsSYYlVyIWhJuRPsqwoImefsrypTsY6M+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
Date: Mon, 6 Sep 2021 16:47:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-7-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bfab33e-f55e-4ccc-05c6-08d971454b8d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445CF7748DA3ED4BC290119B3D29@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r5NAMpvGAwb0UtPPZ9NXqtMPLGHTnhpPsw6J4r8lG222Q4qNZybNsgHe3mdvJOb7seTf81dBXqRJ+A21YVmil9opouWWYwnSwIePjohlsucCwDcP8feaSusvmGtnFbPrFjz7wyUJQN/7LKeH+yYziYGs8SUHFxtGnsm2aZAyelLOWyL9eccYH13hA7oQ/VjJv3JtrSL/95xxdPX77YBkUzYpyuGTLyE5O9Kl0i6v+SDrOsZQe5yXlVaq6QpIGehuj7TThVsbC3KgmjzAyThwwXj1zFblnEQHLyX517eXpzJyqxZcHAZiUZHR8A8QFPTcHj3577dGp06lm/vbqI75bEGBk6V/bMc0c+x4LLJlR4X1/WjXllFgTk9fhdTbaK6Yxxoai3lDJ3DrV7FY6aCz38+DZMlHjPa6tuKQn53IODR146nHvFME/PdXFXta+VctOMz2w1mUStFXAZbaxtfkWM6bTIZSNoqcYwoH8DYeKcHFjG9HmLihmSi8hzL7wavQaNMc0DLay6zO2nc8A3r2b2XNtV9IsGUsMHecDl8kINh7MIM1XLiPtrSX0gXSIhDxdJCG6v50A9cKfRAkN2KEDCSjGFQiresGSxPy8BS+9MMCNgtQWBqOg7FKGQ8WXFttVYLbZR8h9Tvtaw4znO36GJPy3OQMdMe2dvPK6C7nDQr4+hkFWCf5riX1fG7idx3z9abwbBL7tCYmHux6WumNT1UNXOsHTFh7k8QnbCd61E4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(956004)(4744005)(6916009)(16576012)(26005)(508600001)(7416002)(86362001)(31686004)(6486002)(36756003)(31696002)(316002)(53546011)(66476007)(66946007)(186003)(4326008)(38100700002)(66556008)(2906002)(5660300002)(8676002)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3dueGYzYjhtUTZOWjZjY1E2R1pRN0U0TnRISUFTSEl2Q2dZTXpJc2NaeERl?=
 =?utf-8?B?NWs4bWd0V3VESmVMY242MHBibE9IK1NNa2c5MVk1NDVHeGFmQW41cm0xSmp1?=
 =?utf-8?B?Mmd5a0g5TUptMGk2ZHJseW1XU1JEWHR2UlJUa2xNczFKeFhobzNVU2l2eVVp?=
 =?utf-8?B?K1g1Y2xyK1UvaFBueUpTQTNZQnJkVGlGNVpmM1R3WUFNc213K1JqRitzRE1H?=
 =?utf-8?B?ZTJ4QUZuNFMxRGZmWmE4dlFkdlRCQk54b1JmRUQvMGVoN3NnUTV1WmRxeGZP?=
 =?utf-8?B?cGU1YVptTDZtNld4THZlVnpuZkViQ2ZiZWZvTVpEYzdGaStMZW4rSkhEQVZq?=
 =?utf-8?B?KzJLTkUrZFZwOVZQWXdXTW1Eem5PbHZpdm9HUDJVaWlIeGtieU1zNjZnVTMr?=
 =?utf-8?B?OGFOeWV3c3VkTXhPMDZ1YllvUHpRaE83Uy9WUjB1anBhOGxIYm5mVEViYndX?=
 =?utf-8?B?cVRJVFZoZ0VpZy9KM0VEVzUzdDNJSjk5QTVBVEEzR2JqOFZjL3hsQXUwWE1i?=
 =?utf-8?B?TVE0K1NEVmVZd3NSV1pHSDhhY1ZldTFIMG9TM3RXSEYvOThZUm5QMGUwcEIw?=
 =?utf-8?B?UCs4dFdZSHNGOTZPaVR1VWpWWERCWkdwclk4eksvaVo0NkNQU0ZBcVFEc1o4?=
 =?utf-8?B?RWFNVVpucDcycHZIVndiUFZNbVNjdlVXZm1CdVk5MENMSG1TQzBjRk9Xenox?=
 =?utf-8?B?ZlhLbXA1emd3WUpzUXYrMkYzRFg5eDhzVmlSNGsvSmtodkNybjZpT1VEZWZa?=
 =?utf-8?B?NTdBdUdjSXgydlkwTm94TzZpYlRXWktPbExiamQyd21Ca3luZUpRVjVsNGpS?=
 =?utf-8?B?WUtaMTNHTk1NN3NHWTVoeXVzMnlTNXBNTDg4dkRHMCs4cjF0TU42UWtBYnNB?=
 =?utf-8?B?aUx3d1Mzam5xVGR0Q0tyQVJzQzhhMmhhSXFwOEFYMzhWN1E5blM3aW41bjhs?=
 =?utf-8?B?d1hnSGFudlhQcHNyRjB4MnVJVzBjdzF2ZFlIWFEvc3ZrOEJ3aWZwcjRDQm5w?=
 =?utf-8?B?dXQxUFJ2OGl4NW9oTHovS3lKd09xSU9QNStOS0Y5YmpSQjRhMXdjZHM4djVX?=
 =?utf-8?B?SVluOFZnNmc0eGpIbXZuVUV6bWlDM2tIVHNhOEhJaEJuSlIraW12UjNPNHZr?=
 =?utf-8?B?S09nbXQzalBIc0RaUEcrdnZMY2s1TU9WM2RGRTRUZGthU0x3NUowUGlkZTc2?=
 =?utf-8?B?OTJESU5WaG0wWjkxcFd4MWNTMkZpM0xPVDl2Y085aEtza3NvTk9aYWU5aWw4?=
 =?utf-8?B?NEd6QnlWZ2h6ZnZ5WmN2MnVaOXhoUDBlekVlOXRVRTJ1WWxnejhOZTV3Smdm?=
 =?utf-8?B?aExmUVd3WGFPWExtMHl6S3AraFM0UlpIWjFCWHVyWXpJUWZnSUFQVzBpZm9L?=
 =?utf-8?B?d1VEUVhBcDBxdEM2aDRGV0hwV2g1Mnh2VFd3SXVueGRndUxJUmRENU9NMHZp?=
 =?utf-8?B?Q2pLbFVLYkFuVTFoaDZkbVZXd21NT1V1TWU5eGhsZmtGZWxKOGJxaWJEbEla?=
 =?utf-8?B?RHNIcUFsUHNqNXJiQy9OazFhZW1JQjNsUWU0NkZGWktHcjVIdmVMaHFkYmxW?=
 =?utf-8?B?UDVndXdBQ2V1TWplbnBxUkFEMG9RNnNPSGtFdTlpa1RZajVJQ1YrUUFaUTgw?=
 =?utf-8?B?dThIRnNFb3E3Nk1yTnFvcHhVdlN5QTV6cTdrdWlOckEvaFVyUkszUGFEdjZi?=
 =?utf-8?B?TnljWkpwdndyNjF0V0EyY00rQ1RxU1JhWGxIeUtXQnV3VlZmcGJVVGNBcGty?=
 =?utf-8?Q?4wmloHMG1g4fagcRWwWVjyXN3Jm4i0iJ7iheFbh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfab33e-f55e-4ccc-05c6-08d971454b8d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:47:48.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67JahmkBh+xlSHPwUvmcVDxQ1vBbKF0GOdcKWUTthT4riqXHbZ1UtbzL7M0Kf0QfUJf+qrHRgFtkuK5rnwBRVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Instead of handling a single range set, that contains all the memory
> regions of all the BARs and ROM, have them per BAR.

Without looking at how you carry out this change - this look wrong (as
in: wasteful) to me. Despite ...

> This is in preparation of making non-identity mappings in p2m for the
> MMIOs/ROM.

... the need for this, every individual BAR is still contiguous in both
host and guest address spaces, so can be represented as a single
(start,end) tuple (or a pair thereof, to account for both host and guest
values). No need to use a rangeset for this.

Jan


