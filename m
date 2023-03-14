Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810AC6B980B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509677.785911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5iY-0007i7-Ut; Tue, 14 Mar 2023 14:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509677.785911; Tue, 14 Mar 2023 14:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5iY-0007fe-R9; Tue, 14 Mar 2023 14:33:34 +0000
Received: by outflank-mailman (input) for mailman id 509677;
 Tue, 14 Mar 2023 14:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc5iX-0007fY-MA
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:33:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 319776c1-c275-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:33:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 14:33:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 14:33:30 +0000
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
X-Inumbo-ID: 319776c1-c275-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XszHIL5qT3jF7LHBgedQlu0y0Tsf+NkIAvEAfaiGopjpM8pvR9ckwkFlWpkz/Paz6peU5ADstS1RWs8tmUEGdlCqg+GcvQZ1ayKC85HVZ/vUOdL3/H/VIo50UIPFfLg1/Ebzapc+Ue6UMDegoNJUr8JRW+D3lywUQxiIXqkrJzoZX3pA64khuQ8gW03ELOMoE69pfEsn7goo/ZE0cCEsJ1umtY5ypP5LpOcveFumUAijRL5SEey+KdES4uN/14Ao+5PQ3sivH7nM4eXHF7XllptwgSH8x9dSpyo6/DKf43t4TmQpNxNhL4vhJvIHPQeDkV4l5NwjnUnBIBtzhZTHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eW8UACmteyc+xfdfPgVjIsQ2IbcviZapF1MypZeK5nQ=;
 b=RS4MHU43UREL+vLNt6O2CkTOyylYcC3sTgQmOb4Ta/V/+SMQDzTuQrCkjvDybKmrF5wA9lgsOynVbv16e42svicwYhk5y6ghu4W3eXEMQDUnbjaW5GPCyXARmXj0LySc+qCeO5vuP2kwiwymJ0/F2qou/1onKaA/2JhRFGNXtObyZGuMBMqVPEhCtLaDHd0YqllcTI+isqwJaM3lHJN6yl4yESPnXjFkib+RSTVrICYUjy6aMNJ1jPfy9e3Lbh7TMHNJTumzT5AWUv7f/xO+nWDxrtGnNCbOPpnq9G7A8f8YxFeNaVx/IvKA3aHWkBzFhvWVemGtMVwT+qre65b+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW8UACmteyc+xfdfPgVjIsQ2IbcviZapF1MypZeK5nQ=;
 b=KqkKeOwSsIzCn56HvpMLelmQyYqfnuWre20VbPphzyx9hyWalVt48wQBQmyG/K4SV4Y4VGbZYAPvhXFUYMba8RBhn5A6+gA0frUuhwQx4iBavNOUJZWriXbcoJguMc2hhA7MRot9/uf2vYggSU3vBoai3BLO+VRlujtokt4iJs8Eu3UMWlrM8YMzAXNfWan437kkkj5nZ154l6H6h+LDyOfqLyarefrfNAlViSZQcR2J1nvv69/SCvrmHfWQxLWZkwOSL5liAVfhgeMnmBzX6qDoY58vPH9rt+5Vo0jD3JdUegmQ+C/XYQiGPA6y0Zn1+UVOIlfOptqckaAbFXkFJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4b422c6-eb08-89e5-9c97-4e0c4d0f8f01@suse.com>
Date: Tue, 14 Mar 2023 15:33:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/4] xen/blkback: move blkif_get_x86_*_req() into
 blkback.c
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20230314142741.24917-1-jgross@suse.com>
 <20230314142741.24917-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230314142741.24917-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f3ebef-483a-4af2-83bf-08db249914ad
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmZSP33VM1Yb2BTgd9QL4pUjwg3KR9C7UUoq+jbSdPiRm+g6FX5QchVqneLzgTL32n8XQlcNQLdc6QguNosCNG29+uS7mpmlTQ0jSMgA7SOdNeaO8kls1UOPJlqyEFwxnfk3SxRcuWw0RNRB8Xaa9n97ZHCUASAHQV/OK+DZXNPM6bIZUgxapivPE8p4clDHASqqPVBLPv3rB/vRDisyjqD5+a611XzaABE7Xuo9uKLmL9kPYX4xvhz/Elrnw20W+eBSnDM7FvUgy1W515hW69X3Cp6ufIVgjYKoKv+Qqwl0ezaJLiFplGnEw470a4ofyHCv/jIkD0ReYna2c2/VnWchOpxqTKYJonsKjFxz3PR/NU9rXAPW/eOpnkVOwbrAOAMklhHVX/TQ34PKVztRzYmm6tMgBaHBTmxyHfk6EjFbvU/a+wkEfBchWzUsX6fL+HcSxCFgHIIQGP9ne/U+3gWZw1WH6f6xUg4IB1s7hLmOsN/A87/x3lihg4Q3sXWC1eoCLZN8YQ+qzoMPt5m5SEwQ3oIhdGAb86XRJpvTltIpRimjVZWmfMmhA2p+zre16QqswHcgBE7lsgl33hsgEMGJKCCupZDkJBHJyRNH8L47uKAc1X+b8HYiFb5dKmZFs5YnZueAzihaSPMNP5c7rNyF/yG0GbXJIO/wIWF/M+Ij/TX8jb/H/cbuScEwrRvpZ0GveR8lo4w+sWsguYb7yJ5EylzRzLujXxiWbdu7CmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199018)(31686004)(38100700002)(2906002)(2616005)(478600001)(316002)(6506007)(6512007)(6636002)(37006003)(54906003)(53546011)(26005)(86362001)(31696002)(36756003)(4326008)(8676002)(41300700001)(66556008)(66476007)(66946007)(186003)(8936002)(6486002)(6862004)(5660300002)(83380400001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1dNam0zWWREVHZVOGVGSmRhQnVXMzJYekVtRFQzOUlNVlJWLzdseDlWNDhL?=
 =?utf-8?B?K2IzR1FYSHhQNTJxN1B0SjV2L0JMRFBtMFdPVDBZdSt0eFBDQklVL3h0b1BT?=
 =?utf-8?B?NmMvT1RyeDNYdW4zZjRDeE1kRWVuRkhOY3lVL0g3NzdpMFVZTldIQkxhdy9o?=
 =?utf-8?B?Q0NQOUdEUmxybjNZNStEdlVLMk5FaUJ1YzBqOHNtdVp4R05hWVg5eGVlUU5M?=
 =?utf-8?B?TWVVRk1jYUVhMnhSZERkbG5JQmdDbnlWVGJqa2lISTVsSjRVREtFV0xoQmRw?=
 =?utf-8?B?U0k2NkRkOExDQXVPeW8rL0ljZ0habHdnUEhzdmc1MzlHclM4Zm5WYldKSkxT?=
 =?utf-8?B?ZnUvRENScUxZTUJVRWpZeTRUZC9jZFVXM1FhKzF4elNFd1dyS3luMlNVdW9B?=
 =?utf-8?B?OVhCcDdBRUpudHQ2ejR2Y1VnVzlJb1puNkY4ZGdwdlpFSXNoNkY0bEQ0Z0ND?=
 =?utf-8?B?SUtVVlhqTWppU2ZLMUpJc1pxcE5sZmNqYmZDSWpocjFlRGMrSEZybDEwSnht?=
 =?utf-8?B?TzV1QzY2cFA0bTNzRG94L0U5ajBZaUsrS2l5SmRJQVFuTXpTUHFLMzdleVJy?=
 =?utf-8?B?VFA0NityVFFGak1vdHFkazkzNS9LKzI0bVQvUTFlblZTd3haSTJ1d0dyUzdC?=
 =?utf-8?B?ekttNTlsS2p5VWxrSEJDdUFhamFpZEtndmc4NEFHaUZ1ZnhCcXJRQ2hYYkg1?=
 =?utf-8?B?RGF3Z3FnREIzSTN5a0ZPK0hZVllma2J5M25GdWJ5WlROd0R6Y2ZDTmlENGZ5?=
 =?utf-8?B?Qmx5R0crdE52czdkb2F6cG1vbDY5MTlaRVA1aGxyV29wOGJxWEkyeWt1OS95?=
 =?utf-8?B?YTR2ZXlyUXFTc0VHeU5WUndHM09ZNEt0dlJPNjFtQ0poeno0eTZRUWdFbjFm?=
 =?utf-8?B?NzZMWStRN0w0TjFtT0FPQU4yZWlGeUVHUVVSNFdWY0FKczFpU0dYS2t3Q2Jo?=
 =?utf-8?B?WTU3K2taREJFL0E2WDdUd0JBemMwZkt2cmNRblRmUis2WUdQNStubTRRNVFy?=
 =?utf-8?B?Q2F3RWNHVktIWUhZYzNTbVAybmk3Sk5STkRSNDdudWFHS2t0bUJPMGdXZXMr?=
 =?utf-8?B?Q0RBRTZweC9oc01DU1dUdncyRkxIeWNJWUduME4rZUR1TVBrTk14Q1c4eVZh?=
 =?utf-8?B?TktoaSt2ajlTa1hjTms0ZnBvemRCYjNvMkRXV2U1bmJEUURqbE1kam9QOEVX?=
 =?utf-8?B?TzB3dHAwcjB6U2xMNjB1SmE3MU0yQng1VW9jemRWMUxJbWxUVXJKeDNNb3lV?=
 =?utf-8?B?WnBiQmszUXg2TWdBU1Q4NFYzVWtLK1RPOW05REZuNDhURDhaUlBIQXJXWHhK?=
 =?utf-8?B?NW9nTEMxUUJwUlNUZWJxOUdMdVJtM2NsQWNrTlptbmtLWlowalJpdUdPb0Ru?=
 =?utf-8?B?S3U4b3Zkb3BmQmNZTFFudVJqY0FvTllrN2Z6ZlMzMWVpVWU3M3drSTU2aEJy?=
 =?utf-8?B?T0QvWm4wcndGUWRRTmVGekNNTmtYSlZFL3I4RXk5ZkpQTjRYRUJXZ2pMbGsz?=
 =?utf-8?B?T3VPTFg3NWRQZmJCWElHa2hUeFFqV2xkRzZkTHk4d0RYbmcvelcvTklJNktt?=
 =?utf-8?B?UHRxeFJGM3dBM0JVbGxmdnBTWXd0SXJqQUNSSjJDOU42Tmh4anRYeko2MXNj?=
 =?utf-8?B?TW53U2lML015R2JNNGYzU1pMdHNpaEhXRDRGVFNEUU9nOFgwTGtGaHZSNXBV?=
 =?utf-8?B?Z3owT1dQcW5uSG9ENE9xVUlobWk3UkdMOUo4c0pyQThLQnJPZUVjbDhPZVdt?=
 =?utf-8?B?ZnNXMjN4TjR5M2V2am15REJZdDg2c1ZUbVNxOUQrNEc5RGs0K3ZWdlVCWFFq?=
 =?utf-8?B?d1Q2Rm9SNmhzL091OFY3azRjWUlkd0VqelNyeWV5TGF6cU1oQ1NsTFovZjdl?=
 =?utf-8?B?RjFibjFXYU5mYUlLczJ5UTJ1dDhnWU1TNldPRUdLWGhWNWkxNDlIaTRkTXJj?=
 =?utf-8?B?cXU4WVRjZjNpMlpod24wK1JsYytTcFk2OGJOWEJINGpGdnByK1lmektIcE1F?=
 =?utf-8?B?dkRydkovMk1qSlFOdmVpTStLbW5kbm1kRm95MXdJTDV1WEdteG93MnVySTZT?=
 =?utf-8?B?dG0rRC9VK210U3JJenh3Y3ZLa3V5aEZyZi96R1h2dTZjeDR2cUVOM0l0Ym5j?=
 =?utf-8?Q?uIw4pGLecMmCSjMOs7XcJmg8G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f3ebef-483a-4af2-83bf-08db249914ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:33:30.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdgCr+P2wTxOeAuHoX3hsggjqAQMO6WAakwZrXPVwoLH9d4P2kPqopex1tnAwlNufrn3zmpktHJAVUYL4Bkh5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160

On 14.03.2023 15:27, Juergen Gross wrote:
> V2:
> - add const, use unsigned int for loop counters (Roger Pau Monné)

Hmm, ...

> --- a/drivers/block/xen-blkback/blkback.c
> +++ b/drivers/block/xen-blkback/blkback.c
> @@ -1072,7 +1072,111 @@ static void end_block_io_op(struct bio *bio)
>  	bio_put(bio);
>  }
>  
> +static void blkif_get_x86_32_req(struct blkif_request *dst,
> +				 const struct blkif_x86_32_request *src)
> +{
> +	unsigned int i, n;

... here you did, but ...

> +static void blkif_get_x86_64_req(struct blkif_request *dst,
> +				 struct blkif_x86_64_request *src)
> +{
> +	int i, n;

... what about these?

Jan

