Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84743BEA84
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152370.281506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19HF-0005fv-4b; Wed, 07 Jul 2021 15:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152370.281506; Wed, 07 Jul 2021 15:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19HF-0005cp-0s; Wed, 07 Jul 2021 15:15:53 +0000
Received: by outflank-mailman (input) for mailman id 152370;
 Wed, 07 Jul 2021 15:15:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m19HE-0005ci-1K
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:15:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3632d597-df36-11eb-8509-12813bfff9fa;
 Wed, 07 Jul 2021 15:15:50 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-K08GgI72Mzye89QpRxw7AQ-1; Wed, 07 Jul 2021 17:15:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 15:15:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:15:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0272.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 15:15:45 +0000
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
X-Inumbo-ID: 3632d597-df36-11eb-8509-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625670949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCMC93upXs5jkb+MXGY8aI8pAPWSEWwdjnJOdQ5TQao=;
	b=GOVvJT1+uMrP6BBrgu6rsyh6BF0ARIAGTD9nsPwRjX55gmdBEZUg5JpA1qJX7ZcTjzuFAU
	4PwHs/63Up8dlm9IfovWl5TqgZe4oKBvh0pxBlfZLnhGh4KQct5N3BmdPjPVQg+aug2PR9
	MRbD83Dhn3YmdLAv2IIaXaHllcRYKfY=
X-MC-Unique: K08GgI72Mzye89QpRxw7AQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOrNzu+tThMZYuw8bzScnjtHuPEwWKbXjO8C2B5FM2LjlU+TfcMKmUWDM0FaZyB8FwLo9oYoaF/k5nzdXCjBXlDdReJDo2MZQFkBQNYljdoai8nbMHFFYeJcU3KoxjxTuHEE5aNkgq2CZiV2V1WnhCKDCCz1pgQ4CZOMuLoL5T3w+iZYnjPBV/4ZAXYbZOZvXHMsBSHXXDJxxB6hBr4QTQBmSJ1Jbo8Q5QBhKZsJGOSbKH+tJi73LYsPpbMD2d0TUNtDmOxlZlx+qC7mRJ13djdz1k+EqaCVJO58Kdhh/Ld8Z5YsO7+O23UVVrPY9jUMQKvhqtjHlYmqTti1uzxavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCMC93upXs5jkb+MXGY8aI8pAPWSEWwdjnJOdQ5TQao=;
 b=l5viSsJO5te6AkixuehD1paasCoO/1EyGO7Xj7h0MGfYCuq9JUk28EaHT5NdPt99nesX4RyyuDaBumYTj6S4kY/8xeYiiDIB2+7u1bJkBXrlXR2mri9sPk+YSNteA7LbcN2LEoyV2OSrF2nheC8Mwe9Ak5bolOrz+GCHURi6WM9Qq7TDRZMWYEQLS4eH+ZdNTTQ0JMz1Tf6LngMc2klImFDlODDxlOaCAZVqxEI0irjzrufD2aXSrdtgwXP9loce5bGwzv0A73LyAKeKV4cXqnD9iz28y/Ewel2Phg0JCSw9C2uSc9n9OGRcvjlG3o6m8UiuPM6x52b9yXWH0duAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 11/31] build: fix clean targets when subdir-y is
 used
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-12-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ecdf93e1-ad03-9257-4d97-a1532878b873@suse.com>
Date: Wed, 7 Jul 2021 17:15:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-12-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0272.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdff63b3-579a-4c4b-df3a-08d9415a185a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB702490847E4474200C1F4DFFB31A9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O1gJo6c/oQnWRVpjxamPKgYIqut0YFIz9oiNoeKHVoJp0tBWif50CHun/V2yq7nHncoQXKUcIzSq1HMRbNG6qv/uNtWCRd2EvHu125c2awNheeaoA2ip6M7XOT3bh3Y+WGf1VSa76tiyLo7Fhjdg2QEnnQ5sd1+nz/Jhkmj7ExAcHahH/3pizW2jEtP/2ytsjyhjeGMCx+x9Rvnx8GrTg71U5jWFDgCeUeIGPfuCqIWeZ4YjYpiv40MVdcp0WU36sTGUdS9oRceLPo4Dj2JMEAA2X+MamHmFwNMD9J23iFDjiECIeSi+h+jcnKRFSNQChXUZ4q5A+oiFseWxQ2/JGd+XW2F0tLRuOkvPA95g0GArbtZYVhFApkogCMAsyVyqUIndkVxcmzaIeYKVWVnJcM0HL69+KX09looUqVdfVNK2ZdWsCVvScoyaaM15M/3Qe9rBgmA8ZM/ykz7bx4aQ+qU/EPa7g1Q+rYZMlU7dFdrhptfiSHxNH45vflwcsh4rO7ChdFZIebph1mEco8AUTAT2qGu/HCiJzfMAKvzd+eAjmPiZ0tqspTUJngUBsqh1XwSebjz1cj4BpMzfdQy/4JqRL7K0QWp+0xwNnWzMpcA9uXKYUyzxu1n2vOJ4rUwSj779qsI5C9nAqAEMewzbMgM7BZn+bXkn1HKycFhyRlLRo48F4745EKpJOdLYK3FuUh1aw+hPsAXdcXK2QVSHTDOdfVcy/t4yMk1DjhbE3Kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(346002)(136003)(396003)(366004)(316002)(36756003)(86362001)(66946007)(66476007)(6486002)(66556008)(83380400001)(53546011)(16576012)(26005)(2616005)(956004)(2906002)(31696002)(5660300002)(31686004)(54906003)(186003)(4326008)(6916009)(478600001)(8936002)(38100700002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3ZTeEdGWHhDQm1ybDBxZU9GZ0UzZUlldFNEU1JJNTVUOHQvc3Bud3NhY1hJ?=
 =?utf-8?B?MUpCaE1TMFd0cVZta2s0eGY4Z3FoNFZDdWFZc0hvRHZCVmcycjZxNDBPM29T?=
 =?utf-8?B?cTdkSTRqcU1PaTJqLzNYb0pZWWZJZE9LT0tXTW9kTEZOSlFVSWxEek5tK0p5?=
 =?utf-8?B?OEFyWHYxSTcvUmlWK0ozUkU3YVRQMCtId0lvRkJSWEhVdWV1aUMzbGE1RDJy?=
 =?utf-8?B?R2t0bkJ1cUlObG94YWdqWWttYnNOSkNGV2c4cVMyaldpRk9LaUdIVk0ydHNp?=
 =?utf-8?B?WkxNV25rb0JsQlVGWlNmL0x3clhMaHQ3NGVoQUkzdncwaFFQMnRJNWlyeXJD?=
 =?utf-8?B?VlF5NmNxZ0JFNVVudHA5NFJMbHZGNXhwM0dBaEt5dGN2M1NlSU4vbTA1OTJX?=
 =?utf-8?B?TExzZXNLSTAyVFV3ODN6bjAyVnkzYzVOaVNoQ1pHY2htY2xKVytkb2VjczFV?=
 =?utf-8?B?N1RmUXNlVWU2SzNLS2p2K3p4aUQ4UllmYXlISkU4bUI1SS9MSDhzcHZlb0xj?=
 =?utf-8?B?WXBSMEhrMS9rV0pEd2ViU3BXSmFtNGlNelZBbGxXOEdBdmFGeDZzaCtGZm1P?=
 =?utf-8?B?VTduUnpEcEI1OC9xVHRHTDFXOTRreVVHKzJVOFB2MG5TU0Jtc3hiVzhmbmhv?=
 =?utf-8?B?aXZqZGdMKzdnTi94UUxybG0vbnRHdTMxUEp3a05BN0JXZkhWMTJnZTVZdDdL?=
 =?utf-8?B?b0h1RW1aSW44dVZHYU1LandlZnR2ZXJIREYyMHZMZWFpSDZCZkU4OU5lWmxI?=
 =?utf-8?B?SE9Gd1FhRGVjbDZrdFRBWVY0UzdNZjhOSFFsYTIzQmxGMlNtb1ZHT2w2UGxS?=
 =?utf-8?B?YjVjOUJ3anh5WHZmYXVxSThaMUx1TVNhRDR0ZkdRakZSUFQzeDZnNUptM2NT?=
 =?utf-8?B?dkwwU2YwMzQrOEtsdnZFS0h1Sm1EM1RxNkhiY2J2Qkt3U2ZXVTdHVU9HN0hp?=
 =?utf-8?B?MExOa3BMS0NCdkk1ektvcE44M2VjbXY2Y1NFUzlDYXFnVXJ0OXJYM2Mva3U1?=
 =?utf-8?B?MFg1eTRqZ0x0dFlnKzdacnZJd1o4MjBnd2FCMmpQandhdGJReVljQndUODZM?=
 =?utf-8?B?ZCtnUEtibnpYYTJTeG4xbXUvdVBuTXR2cmxwczFqUGovVzFPZjFDSFp0Sis3?=
 =?utf-8?B?NDdlbGZxQVpvUWJuRXkzUlBDMGlsUkREbjh0a1ZRRFJXb3Y4azdJNDdhLytF?=
 =?utf-8?B?RTY3YWVraXYxRmJRWHNwZ0FaTDZEZXBsblVrNkhleDVQdkJwMFp2WWhnS0hp?=
 =?utf-8?B?UXlqNi91MnZEOWxhTm95M3M5N1FSWWVrZjhKbHZ3ZjE1dlluR2N6S1YybkJj?=
 =?utf-8?B?YXJ2QXg2MUNmazNmakVRWGtnYUZEYjJTcnZFMnBIRUloekhUS0FONTZuVzRp?=
 =?utf-8?B?bFRZVlM4WkRGc3N6QzVQSjdmYTdEL29jM3d5ZStMMzlyMkcvTHBmYW9najNr?=
 =?utf-8?B?bVg3T2NKZDBpck5WbGJHWnR6ZS9veXFPZGthOXBIVzdPUGpHbW5JdWxqMzh2?=
 =?utf-8?B?V2J3UGJQN3M0cUFTZTlQQ0VtWFZYY2c0UmJIMmd3N1hnN3dUNmlwcGdBR0hh?=
 =?utf-8?B?TmV0aERnOTRCeFdMK2Z2SnBxSUFIYzlkd3ptMGw4SkJpeXQ2dG1uaTNjUnpS?=
 =?utf-8?B?UkZxbzU3UHlxZ0NoL1A5R2ltYTlaK2Q2VE1PRDV2QldPZDJHb3UrWkw4UzVC?=
 =?utf-8?B?QWRTS3pRa1pCLzhXc1BTRzdNVjdmZlgzQ1JET1BZRjRrOHZKQ1VBbVRHRlhF?=
 =?utf-8?Q?v02f+aLv+vKNE4EumTaPWznPLNSgzz0EpW8O9So?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdff63b3-579a-4c4b-df3a-08d9415a185a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:15:46.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kw9fCLlRtdEUO8EOjfyevnV9BeQj8XftM2W3WNII/gBDWcfl0m3AbOrfO1PzOmv0nLh/0IASZ45NntZRukm3hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 01.07.2021 16:09, Anthony PERARD wrote:
> The make variable $(subdir-y) isn't used yet but will be in a
> following patch. Anything in $(subdir-y) doesn't to have a '/' as
> suffix as we already now it's a directory.
> 
> Rework the rules so that it doesn't matter whether there is a '/' or
> not. It also mimic more closely to the way Linux's Kbuild descend in
> subdirectories.
> 
> FORCE phony target isn't needed anymore running clean, so it can be
> removed.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/scripts/Makefile.clean
> +++ b/xen/scripts/Makefile.clean
> @@ -12,19 +12,18 @@ include Makefile
>  # Figure out what we need to clean from the various variables
>  # ==========================================================================
>  subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
> -              $(filter %/, $(obj-y) $(obj-n) $(obj-))
> +              $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))

Isn't this a normalization which also wants doing in xen/Rules.mk for
subdir-y? Or perhaps this is part of one of the subsequent patches
already?

Jan


