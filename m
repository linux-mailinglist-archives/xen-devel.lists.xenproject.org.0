Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED223CCEAE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 09:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158128.291271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Npx-0003LL-SQ; Mon, 19 Jul 2021 07:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158128.291271; Mon, 19 Jul 2021 07:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Npx-0003J9-Om; Mon, 19 Jul 2021 07:37:13 +0000
Received: by outflank-mailman (input) for mailman id 158128;
 Mon, 19 Jul 2021 07:37:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5Npw-0003J3-Ao
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 07:37:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20327603-e864-11eb-8aed-12813bfff9fa;
 Mon, 19 Jul 2021 07:37:10 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-zJ4lnPopP86Jh281hNh-ow-1; Mon, 19 Jul 2021 09:37:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 07:37:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 07:37:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 07:37:05 +0000
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
X-Inumbo-ID: 20327603-e864-11eb-8aed-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626680229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd+IwnqkPN9nngruGLx4u91bVvssuKeYnSnodNbnGts=;
	b=BweLN8kn8P1+pcOvOb+wubA7qke3toh6DM/vQBMxUN8d3x7hp6te6yj5VuAjRU+4ntGYWn
	KiPauK4xaVkBBBC+0l1zBHZQcF7ByvXnYASRmG7ENW4iTuU7KXWWM7Nr0PnsJpIrNUvrJm
	ylfEPPfnlRvkKTyl9JQeOwmMOLWSLDc=
X-MC-Unique: zJ4lnPopP86Jh281hNh-ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAs+SARBxj29DMB8tBk2TSH7UjQs0BmN/+B11p4xqiH9yns6d9Wdqk/U470apDBzzz9qfJg+qoCsKk9gWbOypPuzF3H7mFqhdT9/cIJOrh9b0aNcE54l60A6Z5SkKU6OvZogCaUGQzFkInM9nIQaU0Fy7VQtBreIpqwqgzIIfX5nIgP2XX+xwSdxbSqsVeNC3rCVePLx+W2bL6ZiIeQK1JVacfgKN//Ci4Ve8Zeq9nSO+xo8gBQMdBDg32p/gRA/ARuWfuNnGeh9tRZ1fiHAx7TZfFeXalNS3BTHxQ6c8Lgj19GlKki6y2q7KU/O0a2NOwlqpO/G0ZG2YvfQrM+V+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e0nm1lyd2BQOWbe6B7Q1v5Kbuu4y1w05G4kiBgJpqk=;
 b=gxTSlgt96gQY/9CXUGkJbiQRDUbEJ1xnrdbUPbZP+zvE11h9X9NesJdVwk1vAfGmAfMWG/u0v9Qv9g6EsQaCrsoqyqBZcBKWfTFPmW89bc4smlC11Nw1eLC29cjEt+RHzgQdPhNXqJOlzNmpHZA59eUkhJmJFfTKS2Awusiczkh6FKtGcpCRrvMaoRF1/Nw4Z/b9kDa+tjA7kh2+bEwWT5XndB/v3IEv3a5r9aMtQaIud0SUmKsEpNNFH9feZqxsDSmgh8Xhfoz9VrHUrpXHny1h7sDL2Qw8hMaEZIjFESroh5RaLqmr66Y/sFXFsS94HDFfrtndDDjN2TQqhJtnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <20210716123812.494081-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aada0028-ff60-9f59-5d87-a023ecd35d11@suse.com>
Date: Mon, 19 Jul 2021 09:37:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210716123812.494081-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b78fb4d3-7d7e-44c3-8230-08d94a88024b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150C9F4CB4964328DB930E3B3E19@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c9s8rYtFN4vs9clgomC6doIEerF3ZyKPeDrYFf/W8BF1m4rvnDG7Ta1OX4nQF+J1ite+379FK0Joe+EpcxGJF6B5T3SM0oSegKr2tJDaF/tqzRsoR7ZFziU6zrMPmvfARxQiQcJ/WL6ekzS05Qr9mhrkVh+x0P4Jix7FjRTNE3TOAOltnY4dBfGdLpHr79NP6RZYS9b7MpW17UiwPKoMc8QY8Elw0WHwFMqJ56g76ggeNxcvUvpslfam07LdVJjCbq7ypBrwGUx+aJkt6CeTqygR6Pmu44KUWdJazuvjPNTaKUshaU9sQ52rLf06m/ou92SgV9kYcZDJvfq9+QIrLN7E4CKRtMbf1lrjoTtgZbbYn3cFcrFyyKyDv6g6JHD2V99iDcnOosUALfilHe9LZVa3rIQu6Y4CZo/+Vn2LRY87eNd41ZmRGekOfi1pan8kQ0S3qfZBmap0AqfDxeNMUF8K2PWzeLuqzGpEoUURinNaqLSAVBzdF5lHXOWWCd5rH+3MIuqEDJKPhKoGwr+nXW8OfkHjrIshzYW2/e7JKZi/6qola8K/Nl2UPdk5giPHbykttv9VLsKR43uNxSgsBf4Av4b0nhkxBjBMj/E6tLEhN1O+SNO/EbgKLQ//Gfzu62BWnizSw5/2IPbBUmCC0sxealOXq643nJ3Q5TV1AOeG4RrXdgnZWgOr5RBmjlXt30d3QYB0ytJy0CS386EB2oGaxj9t0vq1z7jahsjzTMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(136003)(346002)(376002)(31686004)(4326008)(83380400001)(53546011)(956004)(6486002)(54906003)(8676002)(186003)(2616005)(31696002)(36756003)(8936002)(26005)(316002)(66556008)(86362001)(66476007)(66574015)(478600001)(38100700002)(66946007)(16576012)(6916009)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yhucSkk8+w5qiH0t8vnEukZUGu9UCUHW1jW+W3iCRofxevKVtEMeyXCsoecM?=
 =?us-ascii?Q?Wh6diBifQgQ06+rehGUPsomIyzp7wKMskGvbEGBaymE9oElhL67kg3Vp9cn9?=
 =?us-ascii?Q?vOXCyfEgb//WcnKAz+cnQXDVEhuyBXLkUAkIq4F5kmI25Ko2N/9QJ2OkdGye?=
 =?us-ascii?Q?+HLmKX4T1pCizdW4MIMVQuKZyMPu/r//sj4vBfGrqa4iy88E26w8G4D07tZv?=
 =?us-ascii?Q?L9Wza10Qyx2H0nWkC65LsK8fR78ci3OqffJPkrNseA9GRoWWIsk013hswXVK?=
 =?us-ascii?Q?2dzS4fZI40o2kAzRxgjnlq0tULO18MbBvNS+edTswhDcpKt8nUKhdB9eumDQ?=
 =?us-ascii?Q?LbVsvKFiv0cTTqLDf1sIMZCRy0j1dfI6yM6rpkoTWxZm9XfXFAc+d8ZYmZuw?=
 =?us-ascii?Q?Q07/22ykVuqJ+bIOWwQ0t7Y2JZRf9PF3/XOQuy5V6UXXXFIB26CB6x0M7rQu?=
 =?us-ascii?Q?rLvwRJWUvf3x/TwC/xbUPCMz46T/F2HGKmg7B+vDkwK9+UvgcMTgHv2BXw5V?=
 =?us-ascii?Q?IYZCbUpXHd3dLFhAdr0T098mbk1jBJdl6xAFrsn+/I84rNUtokZ0hivYZuev?=
 =?us-ascii?Q?XM3Jazi0+S8bP5KDyrhHX2i/SVGzCj9gj5BOkzgHER7pjV/hd87RyXQNwBcs?=
 =?us-ascii?Q?uCJQy2mozU0KQCI+u3uwtHfwLb0S3x52vusMltYzYVmthEgS/5NORrAoZTpy?=
 =?us-ascii?Q?xwBHatPJSqsBI5aAaPnzbYsLo8jImYYr95I63WOqw/OnPw5LMJJ/+9TRv/pG?=
 =?us-ascii?Q?RDqS/kUyO6vCetyU+LTDCpHXVTw3akBBn9vY/Tn+vaBAzfl2mDs87DxvXzo7?=
 =?us-ascii?Q?787eBJVAiggT3dgiYXhnly2AGYk0t+XgXAyoINgCNk9CUIc6T33mUgYb45ch?=
 =?us-ascii?Q?w0tyA7nYWqlZI510YBbOFbkD3anuPb7bbrTTg/NUtU2ONcJo26xewellopFG?=
 =?us-ascii?Q?sfV7iQ9seZrreAy/IRhJ1ffeJ0GTZrNa0vAIaiPnHKFgYFcEVCJDW8Ufc6DS?=
 =?us-ascii?Q?ADIgT9VXpGLaOpN4L+s6tT4+HsP5qSqCm+YSV7AxD2p8KsatwSNk4CdJF7nC?=
 =?us-ascii?Q?y3DDTTtiXiQEofoalszYKSHjnHfZQQiP96f4nYOiR5xS+16gPXPs8Vy+3JZ8?=
 =?us-ascii?Q?F/wYzKlfN5xcCjtZ5oP1YEFk2BGfgxgTQIs/wN6Po5hrNzNgWDaCN9v+BZyu?=
 =?us-ascii?Q?xRCOWHWUNbLv4l4EBo8vLMfZFr4SmXxw/ckcaLaSpVSbPpLRNIMNOf7aJRNZ?=
 =?us-ascii?Q?PhJqfrDHK0u36B/kvmIxCgqrvKfscHVYEfb1Ypru6EREXY/Ep+DO6AHQNsB/?=
 =?us-ascii?Q?DmsmVpXjPpDCfJF4o6TnMgD5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78fb4d3-7d7e-44c3-8230-08d94a88024b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 07:37:06.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8U8NOATvyddeZVmVGe94FC5B4QTJKQyONmHCiYbeRjoLzRuPlkMYsrp2HTl/L9DjYYwioD0Br5ViwplnBwAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 16.07.2021 14:38, Anthony PERARD wrote:
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available, when doing "randconfig" jobs.
>=20
> Also, move the check out of Config.mk and into xen/ build system.
> Nothing in tools/ is using that information as it's done by
> ./configure.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> We might want to have a new Makefile for this kind of check that
> Kconfig is going to use, just to keep the main Makefile a bit cleaner.
> But maybe another time, if more are comming.
>=20
> v2:
> - move check to Makefile

I'm afraid I don't understand:

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?=3D $(shell hostname)
>  PYTHON_INTERPRETER	:=3D $(word 1,$(shell which python3 python python2 2>=
/dev/null) python)
>  export PYTHON		?=3D $(PYTHON_INTERPRETER)
> =20
> +export CHECKPOLICY	?=3D checkpolicy
> +
>  export BASEDIR :=3D $(CURDIR)
>  export XEN_ROOT :=3D $(BASEDIR)/..
> =20
> @@ -156,6 +158,8 @@ CFLAGS +=3D $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
> =20
> +export HAS_CHECKPOLICY :=3D $(call success,$(CHECKPOLICY) -h 2>&1 | grep=
 -q xen)

While the setting indeed gets obtained in a Makefile now, ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -235,8 +235,8 @@ config XSM_FLASK_AVC_STATS
> =20
>  config XSM_FLASK_POLICY
>  	bool "Compile Xen with a built-in FLASK security policy"
> -	default y if "$(XEN_HAS_CHECKPOLICY)" =3D "y"
> -	depends on XSM_FLASK
> +	default y
> +	depends on XSM_FLASK && "$(HAS_CHECKPOLICY)"

... it's still used as a Kconfig dependency. This in particular
does not address George's concern about a setting silently getting
turned off behind the back of the person having enabled it (and
this could happen at any time, not just during the initial build,
where one might still remember to diff .config against
.config.old). The minimal thing imo is some kind of warning then.
Even better would be if the setting was left unchanged and the
build would fail; a solution for randconfig would then still be
needed of course. If we wanted to go this route, a tristate type
for the values may be unavoidable, along the lines of what J=C3=BCrgen
has suggested. I wouldn't think of a global override though, but
a distinction of the origin of each option's setting. This might
be as simple as y vs Y for "positive" values and "# CONFIG_...
is not set" present (for visible options) or absent (for options
the user can't control) for "negative" ones. But yes, this would
likely be an intrusive change _and_ it would not be clear how to
transform existing .config-s, so is unlikely to be suitable for
the immediate issue at hand.

Jan


