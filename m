Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71D3FDDC8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 16:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176503.321161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLRB7-0003VL-Bd; Wed, 01 Sep 2021 14:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176503.321161; Wed, 01 Sep 2021 14:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLRB7-0003SJ-8Q; Wed, 01 Sep 2021 14:25:25 +0000
Received: by outflank-mailman (input) for mailman id 176503;
 Wed, 01 Sep 2021 14:25:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLRB4-0003S6-SA
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 14:25:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7058c3e0-0b30-11ec-adf6-12813bfff9fa;
 Wed, 01 Sep 2021 14:25:22 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-x6Wda70zPZ-kkgxYV1AHfg-1; Wed, 01 Sep 2021 16:25:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (20.178.127.208) by
 VI1PR0401MB2333.eurprd04.prod.outlook.com (10.169.133.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Wed, 1 Sep 2021 14:25:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 14:25:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 14:25:18 +0000
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
X-Inumbo-ID: 7058c3e0-0b30-11ec-adf6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630506321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HPcJqXemlh/M+q3GUqr/9ybdIci7HrM7vUhZHsFzCs=;
	b=jXSpoqUVYZqiwSXr/VF1HIvKiupZnhD50emelEkkorfyOcrCzB7U7508AM5r1VkDscr2Sn
	Fja6Y9EhtfbgTpnUCE6tV+kqn2HyEZBuTssJ+MQPRfNeUefrYwowh7Ll1NkhHrnyB7zDNf
	IDUc3kNJzD10hrs+aHMrF9CJzwpbOJU=
X-MC-Unique: x6Wda70zPZ-kkgxYV1AHfg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dks4BD7DFn9qEVxSaOoiPrPtnl9MG6K1lZnD4vLbPzKFVTHsJ/9HghzsSkwApTNu0Z3nEyNtytcYBlfDMm7785xzzVg9ZRvjga673CwOqSiepFJPzbzwkEa7JkKsinoGaolHlb6MMjElfDbnR4COTIMK25mo4M7ohtOfwcN00iuDGuuRu1qKz1UbWLhD+XC0oi8yGyVye3XGmYyHnyQuuLs3dXcOY/ObpSzPp+TO9ppSfk0EfZzISdPK7mZnETimbDwdMzu5gey+e9D4xdFABjhPIrMqCZ+5v4isJ+KoTaB+m+C2sGN0w5NB817Au/NYDQeYgafhSYR5GCaN97zWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3Fevk7k48OM6SAmkM3l2HgTjJcLe/LKPJf4QIPKH2os=;
 b=mnp9xYwr5kj2IKbgCDJsqM5b96f0/McoZqrsfZkfyDSnuF3zvxYhOYx2bjjWTVxLVwc1/gRf8yGyt2fRSLwRRLVsNSl1r9n/P+kJtrIia8htaPApFmDO2pwnuyIT8FUdq4ksnCVbc9eqc9pkDkz41pFpMBIxOgRr46Ef9O26B2plmoPd/tJCZ671t8PqnS5H45Oy4TRuH3ukTbIvYaHfke5Bs5r97D8qHhVH6glrq8tFmDLaOsx21X5SFKA1EAKZsu/EVsba3c2jvhj86C1W53MgsKcdmRnnIY64WpwoijXasQb1HGQpjzaadB/CnmvzgyKB4G4puDZ/XGAddrcnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <a2b8421d-e608-2abe-b78c-924ab0bf529b@suse.com>
 <YS+GmC7IjxoODTu+@Air-de-Roger>
 <17c5ce48-11e6-ac97-fa67-294cbb8b79b7@suse.com>
Message-ID: <e40194de-f490-d917-0626-cf13d0f3c976@suse.com>
Date: Wed, 1 Sep 2021 16:25:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <17c5ce48-11e6-ac97-fa67-294cbb8b79b7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44a8f791-a8cd-41c7-8231-08d96d54533f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23339A93FBEB6EA4E82E20F8B3CD9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tsB6AwgsbuRyQ8bEJW2Z/TwBDf/3hhixoo7t3335gPUAmaLzFC/ph0xT5bVdjRdd8UlEZHua+m/KNhnxb8AlxxqjwrJfTJR/KoTBFIqnkfxfGFkhWvxkCx4svY1HVzsQK5497htAnt9kBmOPiWIZwf+K0Fw/NEYST9DZt7o+x34jLXHrD6Puw6avMAezf5QX7+5E0YxlcRszR7mX78182OUISnCLxPnUHlRrCxT+paYhPtsLXUZPKFupA9jAQxdspGFhey/3GLhuNk2T6/GcNSXx1sLFrTFpiJyX9vc4TntlCxA6AwPwnyZ2TmuN3rZ1niCkw+SFCZ8eOT1NJzqHzl+zo8iX1yUBMj7XHdfhH4hUKxrKb/+uIHR6P7RNK6nvP91E4X3xFxStD+GX3Q1QF6PCpAMwFoQReVFbFcrmhZkSk90ZOyS1iAA8jwUke/YIggw1dTKEaq743cn7KKLxzgNjH6F8oh3/xGn9Z4smr5VhX7HIPMKVILWU67Odi/cFyo/Q+kHazl8suqbWX1oEQjpftQp5W6SeTdCzYsW9bj0agcs+zhd/tFLQ9egscFG6AgbgNfHXiLFDpp39f3Wq2IrxcnAMIJI5FnuJZAkScWJxOw0qCTC2Lc8iytMxrAo9Z+njW/XU1M0w0HJlSlkkl5TW2/d+tM3VxUOaoOn4TJZaDFV+0m6o4wqWtxuuuJEdUsk/kIlbFEE3GnQEiZuRYoAD7p8htz/vNiXyrZRL1PF5x0/MGtqA4WjGwbjbwJr5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(366004)(346002)(376002)(54906003)(53546011)(31686004)(956004)(2616005)(16576012)(86362001)(316002)(186003)(31696002)(36756003)(38100700002)(8936002)(8676002)(5660300002)(6486002)(2906002)(83380400001)(4744005)(66946007)(66556008)(66476007)(6916009)(478600001)(4326008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fh2bxSI7YJ1P41qfjRRzA7H5A0v6/E7j73CdJvOr1Us0BR/HttGvxElM/KRN?=
 =?us-ascii?Q?u86BrmXDeOAOdN8ols/w9nZInOvAxiWOJJr7C/AsUOiwXAwkG0TyTHR1LC5k?=
 =?us-ascii?Q?ErrOSoGBD5EonwYvyiNBCd3HMO0cxmQDrB8ryAO3zYEwVwCq6wk+HVHGy/xb?=
 =?us-ascii?Q?bDZ5/98LgaaoioRaAPEg4kFEOUuI5q2LvhXHdKwzhob2UtnBk6OMZgmkHn8C?=
 =?us-ascii?Q?sx7EliUZvp6olGtucIgy68DAqXZNVE8YOEjV/ayJhfdbDLgGeS8LDQbKir8y?=
 =?us-ascii?Q?DdTYmwaTpb29OD4vsaea35Qg2iSfXB4ainD4iMX5AHhiLjGiXuTjOyUhyM/4?=
 =?us-ascii?Q?sdEBhjdkl61d3xNlE4Ab51Qy/qdF6PvZOHL0f8Y/6cfIiMQJf1KUm9ZcnYit?=
 =?us-ascii?Q?kHDWQ0EUcLkv3Hp+inbhR4zGbJKpsEnauQS0X6Qucoc94PW4pKzarxJbqj9E?=
 =?us-ascii?Q?BhM45tkM1DRqw0NYlygf35htmMLi6TXEXXA2ntBrX5R7BOppL23VufJqGfoX?=
 =?us-ascii?Q?gjlIQr3RMH2Y2zr0mTiJETL4mFnjEgTPkEZZ2mcx9fKCuXFgyDQCzl9KXiZg?=
 =?us-ascii?Q?LKOG8AfHLnNRLoJ5KtPZmsgOjVheUnmfckYLe/xyPrmyBoBXo6TlCpq1mOx5?=
 =?us-ascii?Q?DQ61U/2GvXKq+bFQwZBXvRMQyEWBbJF/klh6MH03AW0/IuD1lebcTk5Cpa0n?=
 =?us-ascii?Q?yxHAZ/Srwzme5uFZh5W46JDfVn+9N6lshTOgeK6PSH8IzBDsyP0zSLFiRCWr?=
 =?us-ascii?Q?nk9HukzGoyFuW3y3So/HeerFeVXG3cOcHoeEUwOKCTnfQq1bxKmNms7j5Awy?=
 =?us-ascii?Q?h3Fz8wVHUEYKjSCmuKCh8URB8s/8z42JTiJfQLRZZNV3FKWUPksqlE/jGIkl?=
 =?us-ascii?Q?hwiUHcpo7C9eO1JvjYMsji3nO+266AJUD+MKYBHdiF+OIvRj4ZjmAKDFNdxI?=
 =?us-ascii?Q?u0Bp+xNcALJDz8+RA+mLSJCejRjfrSaKWu/hlgbw7U6JK4bY56lcs+CMqgaI?=
 =?us-ascii?Q?1AiBu/7KwDRdH3YgRtADWZArQePyI1IYFj4vq4FIpB9Z+Tx6CYi/cdSP72CT?=
 =?us-ascii?Q?jPrrwhH05fleqm4g9ajnsx+d479tgLGoN5sxAGoPdkEo4KD+XJAPPsfZs3a8?=
 =?us-ascii?Q?olWsijWqJqAii/pLJ6+xvkfiJ2XMQCk+omRAVE2YhlWnkiSbkcs/gV+yUUL8?=
 =?us-ascii?Q?ew8uqwl2zS2APcfFS3ty18JgrblzBV2tSCUKP5NAdMv184UviIgNZqyCJgf3?=
 =?us-ascii?Q?TGAzKTP8j2QzT6v8pieCj8WMjuQfvf8yyqG2tJEg+GyZrg8s/4/3pBA+/za9?=
 =?us-ascii?Q?RhWU/nlVCgEbCk5XKULfE5Ue?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a8f791-a8cd-41c7-8231-08d96d54533f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 14:25:19.1896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hk+dvaco5348to9K5jyYM2xGZhSzqoa3IxKpAhk1eo3cvUCrYHtTDFJ4BUGgG8RvnTfVNejh+KGc1fLOl2l2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 01.09.2021 16:19, Jan Beulich wrote:
> On 01.09.2021 15:56, Roger Pau Monn=C3=A9 wrote:
>> Do you have iommu debug/verbose enabled to catch iommu faults?
>=20
> I'll try to remember to check that, but since Linux hasn't
> brought up APs yet I don't think there's any device activity
> just yet.

No IOMMU faults, as expected.

Jan


