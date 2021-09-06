Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9AE401D4A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180022.326520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNG26-0000CM-5I; Mon, 06 Sep 2021 14:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180022.326520; Mon, 06 Sep 2021 14:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNG26-00009h-19; Mon, 06 Sep 2021 14:55:38 +0000
Received: by outflank-mailman (input) for mailman id 180022;
 Mon, 06 Sep 2021 14:55:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNG24-00009b-6L
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:55:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d4867c2-0f22-11ec-b0a9-12813bfff9fa;
 Mon, 06 Sep 2021 14:55:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-EAfCa_UaPdGfC6z9bz9vUQ-1; Mon, 06 Sep 2021 16:55:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 14:55:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:55:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0219.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 14:55:30 +0000
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
X-Inumbo-ID: 7d4867c2-0f22-11ec-b0a9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630940134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bv9XkP8auOWVn7yNSqj8qEom+vUYrV73C8AOIGJpxcM=;
	b=j3d2CkaD7MYhW3K+gjo7PPim+vsUgCcXVXWYz06JBY+v/5zxpz+pchuHNVAqHuo2/W3YsM
	aQbitXNgVg+4j3VnqQEtmyt5oRKSrgCTm+7jV/n4LJ7E4mqsvn49qfV0mKqhJA6cvoRI3+
	Pqdltzxge4AIjDjJoatZigs4TbgZrg4=
X-MC-Unique: EAfCa_UaPdGfC6z9bz9vUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOZU9rIc9MSfr+JyiiMZZdYx9pxdnDaE8vCTVMIoxWw5O662f5akmDI+1+obqGcpPFzHGjMol5prvdlfivynaB4a9bZxbFNYQI8IKk+R/UsFDCVzD+BxBc87JdLFnu9+G9/vGlAraaNbWq+0lsPfKgntM4GEkNNTtMW1hdZP35I7R27MZE9urYxUnH3m6P78R0LzMXSglO2vlHy0eEUe71ks7XbAAxr5nxni7nGS1h/5dCXd26UQ/xd5jARRw2TzBCAZ2iS0/l+CbrouIzyHP6BalilaCMwQ9m9WwhUDmNG76/VWlC3uxQFhuGuHfTlIey7rzZl3paE5VpTXmUty6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Bv9XkP8auOWVn7yNSqj8qEom+vUYrV73C8AOIGJpxcM=;
 b=TP36ndniocItnaNg5dEvChGUUqU5cgTfXS9RWxHLBmREp76Gh+lMZBHYeD0ZrDUjqYzRopFVEum8cmS7rEhuCT3S1Qf5Zeqf0o8Gi2QzEm86EWs2rbCWotYRLvULIzonL4V/4xnMnlZ45fgRzVVJwcduhlaluvJFq9L6idEJymPOqBlo3G4nPzZ2DzMNIdxM4j68mXPW6EyElD7LFQlwJa53mUBu8bzcqvfFszmvonG3+PcQMsXxQXQU8t17au52RrMGocVEBCnq4qqxe8u/UqjyPUaT8qj3BMs2YYKexxK914/ImHe50WW/lgBMJ2NJunOW3ktFKysMQWMW+kRqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
Date: Mon, 6 Sep 2021 16:55:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-9-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0219.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 042c7078-9ffb-435b-057b-08d971465f7b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48454FEE8A389CBD15FD7798B3D29@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DP6pgYsCEek2J4ubnvlbLXqs2kLl00f0vSO4HSj1pBp3qfNcKiIKpHvd72nIhKd+FmQfHKnrBK9p1IxK/mSHtpNsMdjOm8rBa98oPQ9FkJp9+TVAtZmu6oxkF7iiP5DGdpKP4MAfV1WAEr0di9KQ2Yo3KcUhUwcbcLoh9Yp87QcdQrdkO7sBJHmo3SD2VAypjelmydcDeHtR+VVGUAxOV/aOwIa1uOeeWh9of8sfViDUGykLcJsSa7EAKGym7Q7EI4gZKxR/sygtXppU3Z4oBIUzIpQ0D4hQBkdZ9bayUQOVmY3J3imIlOjFW+c0ioTasm4Y7dCLSy2eNSsMVhOVEoctUIOCTD08g3OEKu5y4xmK6jsGv2D80t3wL4r8PZJzrsbpQM/lpY/1GKFzGyCbmBsA9O7EZPPC3KDegQ5zqEI5CjoN4Xso7hOU9Z7/vc3JxcSIKqcLw7eEb/WgdJMNfrBarx+h6yWhWB6fsQ9WYld1zFMIlgFcxqliN/isjCxahOq8o64spyy35unbYUJzxiwNjtljaRORNX1LxJnIJPu/FWiJ9edZ5tOv6ElDTYbak67Bh4rwrvb1N7UtSQar5/tQB5RZ9nP/8Pw+aLB5YnmJuS/h9iD2HajG5mqTchIgS5+dITiLBCrHzx/q8blEAeV8hM06xNYvfQ+fIvwsq20fHIM6aC07cmiNhwdy+6aR7m/OG4M/0j2yBUbT7Rs0aLG9i94U2vhRzXMHRUnraUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(31686004)(7416002)(186003)(6486002)(83380400001)(26005)(5660300002)(2616005)(508600001)(8676002)(6916009)(53546011)(66556008)(66476007)(31696002)(66946007)(8936002)(36756003)(2906002)(16576012)(86362001)(316002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVlGcGI2LzhDdE80dHBOQk01U1Z4WDQ3OXR1d2Yrc0VCeTY2bCs5NWpCYXBV?=
 =?utf-8?B?KzJqT1duMlJhRExEcHN5cnVKcE45Y09yL3puLy9OQUFsMU9kMHJ0b21heDlF?=
 =?utf-8?B?UDJwMFpPVmRja3RDalA5SE9xaGh4aDVzZythRzZ6UkdicG9jRkJzNGxsekdE?=
 =?utf-8?B?eTVFL0Y2ZmE2ajVzQ2Zlb0toQnZheDcxbkNEeDZZR3hVYWwxSHc1cmtKZ1lE?=
 =?utf-8?B?eFFGT1ZrZU9LKzczc3FDYVZlU25OdTJTcTZhckJMMGY1d1hZZUtFUFNzSWVZ?=
 =?utf-8?B?cUd1bmNDN3lrTGlDQktvNVdWTXdFQmdUMHZBZThuMDcvR01ZV09lbjVTRnhG?=
 =?utf-8?B?cXFheEdSejB1eFgzZExsWEFJQjN6cmZjK2xBSFcvMmtxWjR1SWdxRVhsNGhK?=
 =?utf-8?B?UXpmVGIySXE4ajZKcGk3R0didnF2R2FPc1JuTUlmelRpa1hEd0cyeE0zeHpV?=
 =?utf-8?B?MDVXc0ZPRzdXbXJpbzRHYjJVVy9rYXBiZXV0Tk51Yy9sOUpWWnFpdUZzaGQ1?=
 =?utf-8?B?bGxHUVhnVzFMd1hOd1BOZUg1Myszd0dpUE9zcmZ4eGF3VVVzNExRdUIyLzJw?=
 =?utf-8?B?TkNlQzZkaEdjRFdUL09sMGFoby9WZnp5enR5eXlPTC9UcTRkaTU1eVhoZUh5?=
 =?utf-8?B?ckpHcVFYUFkwblhicEd0ZlkxdklSTDdBMHlWaU8vZ1h0VHZ0a0NqMnR2aTI5?=
 =?utf-8?B?bE1uajdmZ1dKS1dEKzJXbDBJbVlKZXdWRzRzaStSd0REVG9JcndRM2p2bTZn?=
 =?utf-8?B?ZUpkTlV1K3hZSWF3U1p2V2hjSjJsUzh6NGF6VzRiSkh0eVgzNFpWdnRsYmxq?=
 =?utf-8?B?ZldXaGFjcnVzekpudm5rdzNCTGlGOFMzK0tlV0o3TFJDN2QxUk1LUm50L2Z6?=
 =?utf-8?B?d21tb1ljTVR4QUZqR0pwc1NYVHUrZk0zVkVqOEFXSjF6S3EwWFU2c3RNRTcr?=
 =?utf-8?B?MzJVSXVrcEFkcXBsNzV1Q2VRcXF4WE5HNFI4RzZqZnJ1djlrMFE5YkFGTVVs?=
 =?utf-8?B?TW1tQUVycTVFNHRXSjR5d0JPK2FsbldaQ2d2OVgyUDY5Z1ZKNnpPYmJXN0cx?=
 =?utf-8?B?QmZoYklzQ0lGYUhwckZNK01PNXlkQ3dQaXZReVZMUXo2aE43QitiNFVsTmV1?=
 =?utf-8?B?ekx4RXFIVHNpS0ptSUNLMVZnc1EyUGJqMzd4d2N4M1E1SmpqRVlVV3FBN1di?=
 =?utf-8?B?RTNIbndwMlE1akpYNTI3Q0VsTVZ2YmY2dEw2bE9iSFlMVzVMOUljS1hFS1kz?=
 =?utf-8?B?a1c2dDNxOE5yUktsM3U2a3BCVzVYNGhrSldSL1R3aGJzWWROTkJKaXE5RWVj?=
 =?utf-8?B?R3VqUVBNMnRUQVlLTU4zTGoxeExZbHBVMXBzMlFRSWxjb1B5a2NxV3ZwR2Q2?=
 =?utf-8?B?cXBWS2EyTXBNQk1IK3M3NE9lVzZIaTRvVjl6QU1rSUxCVjIyQWVsdjgycDNr?=
 =?utf-8?B?cnRXQS9XbVNydVNoQ3JNNjF5aXUva1YzRjk5S1lIQmVVTFFnUk04b1ZvVm9I?=
 =?utf-8?B?WmdnaTBSNURRbXYyV1Fka0JPSzQvalVRM0VZdS9UZE9va1FiWTVSM2VVVzR0?=
 =?utf-8?B?d1B6d29DRlZwTC8rejdzRGpqRDdqU2pSVmIxMmxqWWMzVytDTXVpTXlXTmxB?=
 =?utf-8?B?REc1RTc1YWNFdUFOakMxeXJ0bnpkRmphbmdNeHhQeGJzUEJFaGdxQllMdU5x?=
 =?utf-8?B?WEptZmVjYlFhYU1rZENzdzQxUzQra1c3bGgyZGpiZThEamI0eGN6eEhsbE5H?=
 =?utf-8?Q?/x7L4ZEuuVKQi83GvhbeNQ0m0596ot3hjIg9kR3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042c7078-9ffb-435b-057b-08d971465f7b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:55:31.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQD1tIYNncaNkT3WVx6usSciRqbrmX7p2hVGsGbIzgD42Rc4cBqUrhnkjJJ8CrymCqdulIk3fGOHGsSmWCjyIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -811,6 +811,16 @@ int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
>          gprintk(XENLOG_ERR,
>              "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
>              d->domain_id);
> +
> +    /*
> +     * Reset the command register: it is possible that when passing
> +     * through a PCI device its memory decoding bits in the command
> +     * register are already set. Thus, a guest OS may not write to the
> +     * command register to update memory decoding, so guest mappings
> +     * (guest's view of the BARs) are left not updated.
> +     */
> +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, 0);

Can you really blindly write 0 here? What about bits that have to be
under host control, e.g. INTX_DISABLE? I can see that you may want to
hand off with I/O and memory decoding off and bus mastering disabled,
but for every other bit (including reserved ones) I'd expect separate
justification (in the commit message).

Jan


