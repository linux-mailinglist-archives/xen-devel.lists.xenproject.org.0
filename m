Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383963E0EE8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 09:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164160.300390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXVK-0002fN-DK; Thu, 05 Aug 2021 07:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164160.300390; Thu, 05 Aug 2021 07:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXVK-0002ck-AP; Thu, 05 Aug 2021 07:09:22 +0000
Received: by outflank-mailman (input) for mailman id 164160;
 Thu, 05 Aug 2021 07:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBXVI-0002cO-9n
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 07:09:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab116f1a-5baf-402c-bc46-61f92950d6f2;
 Thu, 05 Aug 2021 07:09:19 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-PY7pkXwpNye3awqhsqnUXg-2; Thu, 05 Aug 2021 09:09:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 07:09:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 07:09:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 07:09:14 +0000
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
X-Inumbo-ID: ab116f1a-5baf-402c-bc46-61f92950d6f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628147358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSfvfb060d6ZWfg0uVXEirZ/BTJ7eJxdhKN8nE9MBEM=;
	b=WkcQ/Zqhgt+hkR6ya5dPzAuP0GyWs2tZ6XM3fgz/UY6oh5rByEIRd8RdYDSaqPN23I/dBq
	U6enphJI4Ycn7nUTPuTiluhJ4YbU6eEUB52g79HvTH7cGTU7mWNqisV/UHVuyaD2fUCO3N
	UACe7AyAzuzYegDrGZYuiOuk56DiuC8=
X-MC-Unique: PY7pkXwpNye3awqhsqnUXg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTPShMrwU017Bxma6I+dIcLzdSylmdPC5lgL++1nFQWRft5fPtx5a1x+w809Rq/rpetnrb9iRb0/bWTppljyOhBWG25NNxGe3O5Yjm0NUczuwChS1SCw88hh8Si0iK/Fkt872rYxK1LtbHxhmoV0LFwzqgn88midm79nn/ifdF+daMVBvZPcBI/zp6K0/oqAdzKPNXtQH4e7HMhXO20vPwCRKQxD1oDZo9PlkCIMlDzlNu1ZHO9nUzOZjVKfpnngTOCvQa8bBjHQA/RcYiQ4dkc5nuZzFwCqp8KHLkQbgVnWMHLfQwRXSfpRXlk7Fdo26YWpo6HZdvS8yP0r6AWTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSfvfb060d6ZWfg0uVXEirZ/BTJ7eJxdhKN8nE9MBEM=;
 b=SzjpoPXgXwJERJcH72GLFYRl1GluZZtKfawY+Jmg2T3yrteL0gweeX54BDF1varzb57y+JTgOg8nLU1Xp+EzommytNuB2RctQ4TnHiFgV9+FDH+ZakWi45iSNZRdtJCKcjXj7qNjMnsJ39jSCZBD/CpB1ysnXhnxSepJ5tESONUkeoZaUumZbgnrf+8s/tWORph99eGH+zMUj13a0+STMI+TFOzBb6MYPqYIbuKU6h4MNqxN2YvmwbsxQhibPQcSHJcyO1TgS1xLS01Wy5cWIsyVan7AFSH+3wRwtqS05kmUNSlq77hgsA+DTF2ltDWV8RLHZN68P4B7fZ7HcPD0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 19/31] build: rework .banner generation
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-20-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6debeffc-a710-0145-beba-29cc1e00d51e@suse.com>
Date: Thu, 5 Aug 2021 09:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210701141011.785641-20-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d1ace7-d2cd-44f2-07d7-08d957dfef5b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3936839B162FECF355E0AF9EB3F29@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pzjRUR3q1rar0BSegWIujHhuNrUoWkPRvDbNnRBtEx0A2ko1SRkduSczmcYTRamBRYdo3tEw9RQ8qIaTqA3gjJn4K4RFu9QTwXh/TAtwulq3gTeSriDhwZuIeK01q+Ct5zQH3tJFNZvo/VscwEfAsZESl8Ot8EiALxH2O7gYauq5pZnkU8QCqNaMMhwTxAXlp9RMsS3PSAzg9f6Nk4839tNivTZcXsaSUTNWIbi2e0dZAHJxuSxZDVAPSgdUItKQbA1DvoJ6PWzd47o0ZnXjhhcIjHI7Fq/w0W2f3P2DYhZ58cLjJwt64MZg3tsfY5H/W7vMrW78PZ+WOrXv+w5J86XAapk76g2J37f1PQOyYpF82n9LKi3UWA4+oxL+bZ61Nvld68SasEwcZONecijnGCXnvU3gRFBKFv4DnmIn8ldc2amuMT+gTbEBgDn/MyrNiJ+Xn7BFG3GhAxyTloBLybohsQAkAT6dt6TZ6io//jjgXyqv9vLbEpGINy+TP6RiQcHI2OF+suX54E6cBFGWTK4KZHgx13H9FN83r/sLUKMNqdTfESKhGku3R/KVLNe/ClSC/PP3j6Wi5Hax6GI+dXdpgmq6KkLKLytHmnpXk/vUWg9XnRCpz2SCHUXGhDRi+gsTRvJnzMrMv98+D22Hch2TV7vrAsPVoEQcAPtEfgA43QlocHqHP3Ra5ix2X9x9zaFv9Zf9QfH+8n4NBdWt90l+xbPAJooLOg82NIUf1OctM7iEGwHBIex6sk1JAED8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(376002)(136003)(396003)(4744005)(8936002)(53546011)(5660300002)(26005)(38100700002)(6486002)(8676002)(186003)(316002)(66556008)(66476007)(16576012)(66946007)(31696002)(4326008)(2616005)(6916009)(86362001)(54906003)(2906002)(956004)(36756003)(478600001)(31686004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmdKNWpnbUFUWXBjcWlQV2MwMDFFK25QbEJRdk16QXUvd3QyckNBMWhlQjFE?=
 =?utf-8?B?ZjI4dHV4WVhsejVSUTI1dCtYV3FVU0M3VVJoYUpTMUxqK3p2dmxITzVSWUY0?=
 =?utf-8?B?c0E4TnBFZ3lBSG4xNFVTRGJVb1JPMFdwZnJjT1pnRWZoZVl3QzFGVnBkSEtl?=
 =?utf-8?B?WVQ1MU9YN3V5ZGloSWtuc0NwUmdoQVEwTmNydnVlcENUd1FDcTFSaEhGRkJu?=
 =?utf-8?B?d3Nqc1ZWYUpCRFhLNTNsbWp0SkdkdUNyY1E3ZGMwQk5pK1ZSaVZSdUZPWWJs?=
 =?utf-8?B?dGEwYzQzNzV4QmxHc0llUDZXY2FWMGtzS3FaaGJ4MHlYa0JqcEdIcHJYMUt2?=
 =?utf-8?B?NlIxTDh3amtCTlh0dFBvcllHR2FZT0tXNmpjSDRIUjJnSjRuMk9zM2VPZ0ly?=
 =?utf-8?B?MTJ3dE9iTnlreXVSdjU5K3R2Mll5MjJpV1RQaDROR0dDUEJMNmhSYVQ0cVNq?=
 =?utf-8?B?Y05yWXAwb3AwTHNnZlhXQ1VSdkN2SVh5UW9vTC9DUklKZmdIMjlOR21XL09H?=
 =?utf-8?B?cHMwZFoxbnVTNEo4ZTBvdUlrMktuSHNOOFVSdmo2UEJLT1FlY2dxMmk1endY?=
 =?utf-8?B?cWcvWHYrazgvQzIrTnp2TlVSMm84R24ydElCZ2JoSWtubGhDMjczQURUZStM?=
 =?utf-8?B?YW50MFBIZHNzMUlRdmd2aUIwdmUzS1B1K0UrY3NOdlF6UFh6Y3VjTDVXOGUr?=
 =?utf-8?B?R1pPNGVSNitMQ2VrQmJrbEN6UzdLTEN6aWs5NmxCbmJtK3dwRkxEVTR3cnRs?=
 =?utf-8?B?L1QxVERFYkd3MDhCZlZGdU0ra0NtWTRjQldIVnNYNXVVU044dzdQRGxUSkJB?=
 =?utf-8?B?VGQyNmwrZ0QxbEZWNlZxcnhFclg0MUlDdHJGTWJjTFRFaWFxK3c3UytvU0dH?=
 =?utf-8?B?MlEvT21NcUE0bnM4dkozMVI0ZGZ0d0pEd2xsZTFhZFVOTDhFbXJQTlhiajJ1?=
 =?utf-8?B?S0RkZ0RGbW9mSG5iQmZkQWpIUVhyYlpnTEk3L2ZuSmN4VWZ3NmNPRjRQVTVw?=
 =?utf-8?B?cmdUeE81NnFGUnZ2MzZ6dHFTdVlwdGRNNlZzQXU1Z0xRRUZNTk5iMnRyalF4?=
 =?utf-8?B?K0ZBOWNxNnJtdlhZdXhWWFMrWlRaMm9LTld1TnNuZGR5YlNxNVdkMm1yaFpa?=
 =?utf-8?B?M1NzSG85Si9yQ3dIa0Q3YTNtWFJrbGNXOEFKbnY4T3lvaTIzTGF2RHlFZHNS?=
 =?utf-8?B?Tk9OYTdEY2NYUUU4dlV6dkw0aTJzWmZTQVVBSEd6dXVsVTdaSDEyK0t3RThZ?=
 =?utf-8?B?V0VOZ1RhVWVYZG1kMGxTODBac1dDT2NNTlUyNG9VTzJWNXBKNzdKRWhHWXpz?=
 =?utf-8?B?NXYwcE1XcGRIdEpEYjA1VnYrSGdKL2xMVmdrWFFEUkZjMFN2MUZlcXBrSGYr?=
 =?utf-8?B?QzViQUZwRVNyUnJXYmVLM05pQUg4cnBVTlNSRWRCZzRJVm1FdXhqSXhVVFlo?=
 =?utf-8?B?OGR3QnZpNUluS3ZtMTdDdUh2dVNqZVNYdFJjVjFHYUM1cWROZEFwTm9iUmFX?=
 =?utf-8?B?TmswK1A0OGdTNzRselZ0Q2ZjOVRRMm9rWHhyQWVyZVhmUll5ZHMzLy9MYVIy?=
 =?utf-8?B?NWJUNmJndzRUNGcrRElTV290bzRTd051aDRQbE8xTnRmT3dwcVpYUWtKZWJV?=
 =?utf-8?B?MUNLZGl1QmVvSVU0Uzg0MmVoaExERzgvOEtvYm8zakNoL294TWNpSTJOcFUy?=
 =?utf-8?B?SjBheDVHcitKb2RnSDBYNC9nai9nbGtDazRiWFR2MGM4STFyeG5lTmg5UkJs?=
 =?utf-8?Q?f9WR0Z4ox9rREDmIqyD6cR67w+dNYU5eWzPqf0j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d1ace7-d2cd-44f2-07d7-08d957dfef5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 07:09:15.5349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QelGg88BN47rrDS3H2836pPU4ZgzkTBf6QNn/Fe/EK/A2mezap7g3xGobqpZo4MViRJRhsbqJmSIIh7kNRAgSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 01.07.2021 16:09, Anthony PERARD wrote:
> Avoid depending on Makefile but still allow to rebuild the banner when
> $(XEN_FULLVERSION) changes.
> 
> Also add a dependency on tools/xen.flf, even if not expected to
> change.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

This looks to be independent of earlier patches in this series? If so,
I'd be happy to commit without waiting for earlier patches to get
review comments addressed.

Jan


