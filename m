Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F664845F9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 17:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253322.434456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4mj9-0005wl-6m; Tue, 04 Jan 2022 16:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253322.434456; Tue, 04 Jan 2022 16:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4mj8-0005u5-W2; Tue, 04 Jan 2022 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 253322;
 Tue, 04 Jan 2022 16:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4mj7-0005G3-9y
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 16:31:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4ea09d5-6d7b-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 17:31:56 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-tIxvfTtYPdifw187KGhEJA-2; Tue, 04 Jan 2022 17:31:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 16:31:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 16:31:53 +0000
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
X-Inumbo-ID: d4ea09d5-6d7b-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641313916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Med3+Sm3g/Zgr+O5Q7y815ZKSfccieFCKUMHBTwd8NQ=;
	b=Rp1ooGPXATufs35b978Fg1UU7NTWV/2zsWH+LB6IMnbrsAdeUzuxuDUJLwpM6KFcm2zpHw
	3GpKqTf5ECMSZazxvw1mpvA/rmK2zAYT0/+uRkav+Q4AQECYiNzv6S1M/9uydd0F99p3xJ
	bZo5zEh/lh8Ilkv7C5mejYG6Kbz6Lls=
X-MC-Unique: tIxvfTtYPdifw187KGhEJA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ji3MTU2K5SLEnvvhfxVnhGBkTG6zoX1BI8s5mGULvF8H++uWtaWhI94acj9YFPv4ISMJzZd9Bz84vdtBSfo9U2QiscJgpi21M/6mXcjKhhq99E++JD4JUqNC3HiSROZanVxtGfC2xev+L1vrDF+yPpTYwf3IcBpjPd+Kn9UDTe/mwREIjUrpAN7c+/nF0qIEHVhV/1DNDYtJ/Ucxhx3/S6W2CfnnirBd8INhbHQ6EsXlXHkvfMSCPW4yMETGYZYs5c6l52yahDrKTNKcjTqwJaWeYAeOrjvs7Y2qqYKA3rcjJAiwULyJL+bNzzXN02jBzYT6776/c5989HCyf6NBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Med3+Sm3g/Zgr+O5Q7y815ZKSfccieFCKUMHBTwd8NQ=;
 b=O2DC2wdP9+4byERHGIwpZOWExoxbpJZnusa3N3psAg71TpbsWPtFO/pi4rOuQZ7aa4ZXmu2teYF4G63tR1y11GKuVQxfVb2BPiXC/0dFq3fRmNl8oiy24MarMYGfcegjSPt7YURApsCJaYIqKo3031Dgjfo1a4oY3cG5vLtNaR2QiMAB3qst3BUP4frhZQKJ0vIPD0ytaWmnrbHr3A4i39dMbzZ2UJEXPUgXel6FpFQO7QQ6iqQyC29UZIUV+etQV4dhJO9DQWlk0L4ebvidiLFROefVI4OUsfXZ69plrcveOxOK/BSN/2tdeoiFBz07yZrm867G1jUjVZVnEPxwHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40236e0e-dbbf-145e-c08d-25419d9c231c@suse.com>
Date: Tue, 4 Jan 2022 17:31:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Ping: [PATCH 0/5] x86/mwait-idle: updates from Linux
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
In-Reply-To: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c96c9a73-9c69-4689-23bc-08d9cf9fb760
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5600F91CF4D051E248DFE12DB34A9@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jsx8PcQjLvDgev0T2bL6mbbC2EJdR5kgG5QgszYq9dldrWtfbM4Se2cp1/TjqxJAF1WnTdECHh8h8IEOqBgnmuE2NuVaKMuAYoDiXDKT2O6qlwoNd939Kp3T0D3nCL1XW7M4nPuegP7r5ApnPYvOrTxDtRIYrDTEww4RTv1ei0aRjzjvFU9TVYtmotmIZsbdAA3jRabhqlRA5nXA7+MknH2As1b/zCW9/ILf8nnVKg9aPPeNkUT7OtHcVlDgeLoHz9JY/wVkOBBx5aNRlGk3dbSAjxl0q2Kf8e3hPsiRTYEMSEVocmXZMJgnwhLNNw3voicn/ezdTenKNtQjv9FYuPrQ1Qqdit7Sy+RZZ87ZU7vMO5S88Ru86K3e5KerGaMaSMXatK0e3h5TMtoXiKm2fxMCsv3q2rq+DlbkhxQv/tq7kEe9GGZtOMaFDGDDNd4/O8D/4BmKDo/sQvU+EARPHgAFjRh2VHumg/uKWluLIpCln0HnmTP7FtjKr/WjnGkc4qVg+ME1M6KbmlIi3nnhcmCu12gQMpcgi719qa50JhZ3JUq8q93jP/6d0ZLEVhirsWyQrMpb9guW5PJrXn9QucEQ8r8BqPUFFwCb/1pFRVZkXgqJit5HPiq+9vaBF6436MlNwjtSz/k9vm3nr4t1VCyfhb/9NbnZjL21lzPPyn3HWZ9CBDi7+iVwdom7b0IaggzXbQ2Ifrl9subatnFsJkeQNXNZKfhWN42mBZCzLj2W+0Uewca9aWvsV6b/7+vz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6512007)(186003)(83380400001)(53546011)(6486002)(31696002)(2616005)(4744005)(36756003)(5660300002)(6506007)(86362001)(15650500001)(2906002)(54906003)(8676002)(8936002)(66556008)(66946007)(316002)(110136005)(4326008)(31686004)(38100700002)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2xpVktjRzQ4ZmVvTDVyR2JwYzJJNHA1U0RLZGV2N2RXTUFTWkpHNFBGV2Jm?=
 =?utf-8?B?TTl1Tm1ZTlRwNjcvdnpTN1lOTTZZd0R0SGwvODk3dWs4SDAxWFNOelY4eFRx?=
 =?utf-8?B?SXNyK25ObVlRblFrZlNMei9DUGlGSnRta3o3b042S3VxRXJXMzhUWGdjVFZN?=
 =?utf-8?B?MDJ6eDFUMHpOeDNNL0JrZVNDS0FTejBqNS82RCs1ZURmd01zbFJTYk04MllL?=
 =?utf-8?B?eVdmWVArVEFEendYSks5QkJ1MVdOZVgwc1pGS0tjdHhPWTlFbkg0MkoreTVv?=
 =?utf-8?B?eWUxSkVEaWUxeGpDQUM3bkhNVzVOU1FwY1JidnIxYmYwOW5Qb0hvSngyd00w?=
 =?utf-8?B?ZFdiTzdHM3g1a3FEZWxKUGdmZFgyV1BNV1BObXVhb3hBL1NFQ3M5RzFJTmJx?=
 =?utf-8?B?c1B4aEhueEZvbFpyUUtqZXBSeDR6YXhjQ3dFQVl2SEpzcitSZlB2S0UwMFRH?=
 =?utf-8?B?eWZLUFZIb012Q1hDVGRxSzBtTlZ1Q0RyczliWkNhckFtVmJlZ3RJeDRkZ25H?=
 =?utf-8?B?aTVvWG1JNzZNTDBUMVY3bXY0aEtQZzlSSzJmbFp6bEQ5N3Rza2MwNjdQT2VJ?=
 =?utf-8?B?emZRN21yMDVydkxGM2toRGRqZCsxQ05kSGkzcEczWFI1SThKeTVwRHE3YTg0?=
 =?utf-8?B?QVdtK2lLZ2VtRHkzVFBVL2xEbEgzd1JqdG9qTXdwRUdESjBUNS9kenVNNnEy?=
 =?utf-8?B?Q0JFbzdHZlFCcFJoKzJEOGEwSmxIREMvcGJmVXNCRW1zZmgreFZubks0M1N1?=
 =?utf-8?B?OWFhckplZVJXQ2FLbjZhUUlWK0t4NjdSMmx6K3VXSmRrZmcyQXgzYWx0cE8w?=
 =?utf-8?B?OGN2N3lmN3oyT2hrM1FOT3FKSTlld3ZKMVY1djYybDQvVnBzWHp5VE5JL2pT?=
 =?utf-8?B?U1hHcncveXdoTkNqdC8zSDR4YmJhUm1RTDJ4Y25GWU8yUzJ2TVpaeGJaQnJj?=
 =?utf-8?B?NThTV2hsMllHemNlWnZwZzNEU2RGN2x0Q1E1VHVlYm9BSkFHN2xvam10Yjh1?=
 =?utf-8?B?Smk5ZnlDd1JxbFBhUnhqR0pDZFdkRHUxNFBVZWdzdHBjdWVIWEpjdW56ZjdB?=
 =?utf-8?B?c2dLcEF2TERrMVpPdjAvNFVSVjRxRUJ3K1c5R0xxQnlVZ0d1K2hYZnhnbVcv?=
 =?utf-8?B?WjFWenZjQzNGN0VkTkg5TFVmYjZhNkNHbUVDWUNGc0Q4RXVxSXkvZjFiNCt3?=
 =?utf-8?B?Wnc2SHo1VXAreEE5djhyNmh0dDMvOXFVZlpWSW1wWXE0VkJCVC82amNmTFkx?=
 =?utf-8?B?ZGw0Wi9Zak9jWW5LQnFaMjd1UGJ4Tzk3TlpqQWFuMklEVXlNQ1lCZzZMUExO?=
 =?utf-8?B?VnhaaWtST0VpZ2ZZNTl4bHFyVXU0T2I0RUlHcTZ1SFNMT1VEcVJBazA0ZjVQ?=
 =?utf-8?B?a3lqTGt1SWJtQm1KenNEZU54QVNzeFdlbVdXUEpNMXB2c1ZvZnYxYWpNUHpp?=
 =?utf-8?B?TDVETk04REJrb1hjM1p5R0FOYVJQQm93dWRORXhvYUkrVWtVMGNNeHZnNVQ1?=
 =?utf-8?B?VkxQZGo2YU9kUGRCNVR6cVp5bFNkdzQ0VDg0TnFKcDJzaFdSUGFZTkRBbjZJ?=
 =?utf-8?B?dzNYVVR3aTRUNEZkYVkzdjBvSTU5bDFhTXExSkFxMWxIYmJWR1A5VlpIVk9T?=
 =?utf-8?B?RjhKQUpRV1dNby9ONHByMnFnb1VvTEhkOVZLZDc4c2VoSUhwdFgwN0FEM1I4?=
 =?utf-8?B?WDlEZkMyWVVsVzlHZm5vakU2b0RNTkRSK1FtTkgyck5TU2ZuTVB5SEtzZFk1?=
 =?utf-8?B?N0x2OTY0VTFWUk5TWWQ0eFBZcVlHRHZJQmY1bVpWSmxUeE1MdDVRR2czY0lv?=
 =?utf-8?B?YXNwamlaNWpQYkZzdVFtc2ZweVJNTG9GT0ZOdVFWTnBVckZ4MVhVVzU4YVZ6?=
 =?utf-8?B?ekJYVjZOek5IRXNHNFFGWDJtQkhPa2VCQzBvajlHaFkrVW82VTRDcEo4WG5Q?=
 =?utf-8?B?LzhiTFk0dkQvWFJrck1OQnE4VUdncWNpbmloZ0RabWpOdnlYV2VFQzNHdjF6?=
 =?utf-8?B?aGovZzhpa0J2NnpIR1NTTzhSSVpEaGE2Ri9Bb1JHRG9EdFVWbVVXUXh2UlNn?=
 =?utf-8?B?N2MwOXNoV3k1Qmp3SERzMTU1bVdrcmlWeVlUQjZFbC9ETmxqeVV6WGRYTlJG?=
 =?utf-8?B?bUIxanpDdUZnUFhQc2gwY29ZNkl2cFozMHIzM0ZLdjB5UE1LU3o5Sk9PZWxT?=
 =?utf-8?Q?lQiQeZkIn70iGAdHbfBHoCA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96c9a73-9c69-4689-23bc-08d9cf9fb760
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 16:31:53.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6pRT+09v83JNxgDjD/jjbYMF2WZoFWiZDBuPMZ43UfpKTzu3WvC17SYQ4Ot16ygDqnpSl11P4EAPehYKaV2rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 06.09.2021 14:58, Jan Beulich wrote:
> Before the code freeze I thought I'd check the original driver again,
> and indeed there were a few changes we want to inherit.
> 
> 1: mention assumption that WBINVD is not needed
> 2: add SnowRidge C-state table
> 3: update ICX C6 data
> 4: add Icelake-D support
> 5: adjust the SKX C6 parameters if PC6 is disabled

May I ask for an ack or otherwise? It's sad enough that this didn't
make 4.16.

Thanks, Jan


