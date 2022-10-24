Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC59609A85
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 08:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428722.679156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omqxf-0001CR-TT; Mon, 24 Oct 2022 06:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428722.679156; Mon, 24 Oct 2022 06:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omqxf-000199-QE; Mon, 24 Oct 2022 06:29:23 +0000
Received: by outflank-mailman (input) for mailman id 428722;
 Mon, 24 Oct 2022 06:29:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omqxf-000193-2a
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 06:29:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31af4890-5365-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 08:29:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 06:29:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 06:29:19 +0000
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
X-Inumbo-ID: 31af4890-5365-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHnFws4d3EOXbZ5IUIxXiqQIkRh6dA5MtqwfgPryY4K52uVf6hTdqtOCyqeT2tDid2+07Z6rXuIBoOSzeTwFYLtPJ5yxB2LDvnGTmBJoLr2JnIvE+t7lMwKb++Q9GquiE6LLjtjdvk/j9vrEhvfvAQWV5JXofGS1z/Nd59hC1zmvLYaOQNO1i7UavzJh4D8ra7ACLaCymXUyW2dZWBfZTsSl12QsEitxoLuxyaFfeaWOImVyo0WNS7BzRWtsbOp7IlRSZGSOd9lrrrAFB9+1Nf/SI3DMLTgKyhJV7n18bjRzmkbjB6tb8o9uM5fgUYq4ReecvuZjjBvhym3+zFucCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHGNyKFE2AC+GLgXEhXXxSBj4nMmw4mzOEhWJfF2H1E=;
 b=GV45z3thXmwAoykMpH6xSZCethwPzEi7P6uVjjPF3FRwLrGZFkWY4tUhZ6NwnH0yEzXSqqVQ/KfubpdRVBQVsrW5khZIMZ/h0FeCDDpX1L01y2SbxxWJyR23kMgcJc77FdZ/jfPXLR09PTRnPmBze72TcSc+zW7299PZ7jYIfHCyYYnHW8R4xHinttlrQjdMur/fRm86bkqGXvoSM/1wtRkIXYEQWmuEAfs3UcDakUKrWgoOvg1m2F8G4YdBP3S6lttm/KqwYdVhc6bxuwvM0NpyT0GHCtzCpZRRNdEmWvW7PQXSLMpv4ryBkDR2S2mSWLZKgN5RuUCz0aW/qcNxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHGNyKFE2AC+GLgXEhXXxSBj4nMmw4mzOEhWJfF2H1E=;
 b=IgujZ9x7oIQx6Xrx4Bi7Zqb5RJGpiz3u53Pf4Y4PLp9etatdwsQmuoaNEkySZP2eh8zThLy/535UbTztxt2uizJ0kObTfMM5tpURaasiKFIIUOABg9OGOBUStm0lLjoQ3VQyFHLX/AgAvO3DkgEWrFf7P4IwY6fecD3xVY2iDonafivgQz7ioy3p3XrxD8A4H/Fcg+hbNISioac9dt19cingRWBOd+TyqME+Vs430rE8dziEOlb2XPM7gNz5jAD2sI1ZsB647SzyfbsQWTBvcUsRVmQ3Zthq6p30PNSeQ4NYEmBa55QP1FDVfwgI/ZfF7C9D5hRge00EWoHhqaCHRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5c6ba1b-88c1-fc0f-9d9d-2610f0fe2de2@suse.com>
Date: Mon, 24 Oct 2022 08:29:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [for-4.17] automation: Do not use null scheduler for boot
 cpupools test
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Henry Wang
 <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221021165341.7905-1-michal.orzel@amd.com>
 <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: f87d3a62-d328-4f16-a33d-08dab5891491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jhM7Wk9kqftdY1EDciq++gsX3cYikR5dWA0dUY6Smc21fs8yfhNEKhbYJgCB6gjlt1vmZvqbc0oR4RpPsgzaTzxnl74yM7flQ8pzjOA+VidSE+DM21eSMVtfAoqIX9CMGSygpycuaZ+HsqYcPN4zC5dLcINisSUfIJ5S+muBXzRI43sbTP2A1mDxoS+WLQ/QG/9ErBTD+paFujhZtaXpuO+LX8eTc6FuRH0ACaoFYY6b6rOGHY5xqY/xySYLL1fDSqleG11O4ANyffADfz2pxoY7U3POmPWE4YaHYgxNTG6E481/KfvG81C3VzmF2P9UqthZdn5SNgMwTC6roiy7IlqY5tepElCjFpre4xnUVdy4k3JYqbHi0EG1bAuGqN1lmfajMeBOILDjdW7d199GFKo4FUD3Bq5w6HlF/rGLkhb8N5Vg28k+qVVUTXxiYbzkZhBRf4GwEsdtnFGGNGld0sY2qoUPIEL1xsLjOFEGIAH8amnBKDe/oRhJeRnljKI19UBrAO80sGCxlK1izG/EJ/ssAegCKdW1JqiWZZrVZTqNQ3hKcSRuQx1xnSmEwlAkcwDII6G9KiQENSj1KZbKO5UkGLCLU6VeAIY3sn81oPraaKdZ/maHcmjYk7GmDFFryf5c+yLLks/1Qx+2XpYSaJ0AW7eRYNmJY9ugz4bz/MlMS7vb5v3SiMDadf4nC4/RwXzNKDWLboJlx2ZB6k7IH41LY5OwP4AnD0E/nmTF26mEfdEk2LNd6xFQMQKO8j27fIHBTHgG25WMD44hk9MYl+BZuZKiurf1SA2/7sLNiMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(53546011)(66946007)(6506007)(8676002)(66476007)(4326008)(83380400001)(66556008)(2906002)(2616005)(36756003)(41300700001)(26005)(6512007)(5660300002)(478600001)(186003)(31696002)(8936002)(86362001)(38100700002)(31686004)(6486002)(316002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE5Ua2hUMS8wbmxnL0xPZ0QycXgwL1p3ODlRa0J0YzVFdkwzNVEwUkhyYVNZ?=
 =?utf-8?B?WlUxaENVYUQ2dXNBLzBRaUYxSUZhYTBUdXhKcytCTDNFWFNsS0N1bnlZTHdu?=
 =?utf-8?B?b25iYVg4U0lsVGtPV3pMeEY1dTkvMUJkVmhYeEZRaUZ1Q1hUZkdBWmhOaEMz?=
 =?utf-8?B?ekNQekVZek00SmJlaEVWaEh1OEdxUFh5S2xmeTNPQlVteTdubjdSVGJCcEFP?=
 =?utf-8?B?Vm5GUFAxUzBxbW9ZbUo0M0VrZU4zMDBxNVNFS1hOcWQwc2ZZenRkTHNYUXpm?=
 =?utf-8?B?ME1JWUN1VkNyZ3lFcmp1UWMralVzUG5lK1FxYyt2SkRZb1FWWXY1QndpYWhy?=
 =?utf-8?B?b0JFS2pMY0U4ekhNMjNLSzRzWE5VcWxxWnZna2dHcUNOTGNOREY3N0ZoY1h6?=
 =?utf-8?B?dmZGWFU1bGlkYk9XUVkzUmJIemNlRXNkUXZaV2VqMlJuZ0lrS3c2MU8wS1px?=
 =?utf-8?B?NjBVTFRJRDQrWUZVTCtoWGpSWXo5aW1oeitDK0Q2Q04zL20wdnlLMVZMZFJ6?=
 =?utf-8?B?czY2YzBGWnRsQUNMWEVwOEwxOTJkZHFPWXRwQ01mZVpDWnF4SG9OWHkxSmVi?=
 =?utf-8?B?UWRkbUdYaUwyMmNtRklib0JCQldnMjRCR2VsYWo5cjVBcjRqRGhFRjBaOG9p?=
 =?utf-8?B?U1lKSGNFN1gwWS9BUUtyN3RSRXBueThUZDU4Zk9yTmZUa2taOS9rb2lnQXlL?=
 =?utf-8?B?SWtoWTFvQkJqMGtrbUZ0dkM3RWt0ZGRxU282dG1zZEpCL0h2dlMrRC9vWlBE?=
 =?utf-8?B?UE4yQ3l6bS82T1hJUXZMS0o1RThLalkyWFgxODA4dVZyLzdJSzVjWTJwMTZS?=
 =?utf-8?B?Skp4S2o0ZkNtNktUbnF2MFU0WkQvYzdIQTRVSkc0M2NnTUV0bUc3aEpoZ1h3?=
 =?utf-8?B?a1FvTGV4ZHJ4R2ZmT29QYjROeDlIRHEzVWNQUlNLa1RBcXJJeSttMnVEV2di?=
 =?utf-8?B?UU5DK29FWGxqRGFQd0pmZnFGZHhjV3FqbU5ER2E5cTcwTEY2OFB4blNQWjZR?=
 =?utf-8?B?eC90WTFCUnh2dGxaMUJhS2VoblNBL2N2bnowOGNBZStaSkwvMnpNNysxZG1r?=
 =?utf-8?B?T3ZjQ2hMS040ODR4ci9VaVNXaGVORmxyVEMvVDA0RTVoWFA1a2NKUXRDMTNs?=
 =?utf-8?B?ZTJ6TDROeWgyVHMyNWtaQmUvbjhUTGtKOVp1N1pkUDhGOCtyTjd2SXpMZUJM?=
 =?utf-8?B?VkExTWRNWXRjTzNXNEcxY2d5TzJrR1krMTUrVmhBZTVRVW5jQVVuNkVZbE1w?=
 =?utf-8?B?Tlc4cDZ6ejVoTjROazhJSzF6aUVRT0JvVEk5SEVzNU9Yc2tzSWVnbDI1MXIr?=
 =?utf-8?B?VHo0RDNhL3RpVFpiWEdTQUhxalBLd2VjdENWNlU1a3RUSER4MmRWNnhyc0RU?=
 =?utf-8?B?QkhEV1BGNWhGOS9TM3RzYXQ0OUxPQ25TMmRmREl4MjNnVFZZekFJbHBNTHpH?=
 =?utf-8?B?QWtJMXJHdmlhZ09qc2xPdkhtVjh5SCs1enFSYnU1TlUrYVlIUVZ5VWh5WEY0?=
 =?utf-8?B?RFBUck9jUW94QnNTY1NIQW93SDR2VHVZbHQ4VVJLdmZLSUhNcUdTSDI3ZThs?=
 =?utf-8?B?K29PNVYvTTZ0YUN5YyszOGdONWk2ZHBuU0d6WWxSd2lxRlEvekJpb0U2ek9t?=
 =?utf-8?B?a3RpUUFqYkoxTU5TaUpOTVp0Qmgya3p0eEM3dWRDQ3A1SWkwTCtvU2IxRmZ0?=
 =?utf-8?B?WlFYU3BZdlM2cHBhOWoyN0s1S0VwUXFORFRmQ0VLdXAycjF3M1NpMzI1amgr?=
 =?utf-8?B?Mk1FK1phZTNidVJ1b0hIaWkvdjBDYVY2T2NIYXFuY1d6SDh6UVZaQnN3OEdO?=
 =?utf-8?B?bjJFL2c0dEltUmFzWU5FOTEzdW0yMGY0eFIrdHNsYW1haG5Qa0hpWU5aaGxP?=
 =?utf-8?B?cC9CZlg0OVdJalpwVnlUbVJmSjZxanNRMDVjOExVUU1uZ1JkRzQwY3I3RWF1?=
 =?utf-8?B?bGRkYlBRWkJYNytJeng0WGtmY255cmdXck9FVVNMcjVqMlVkaTVvUUJGMXJK?=
 =?utf-8?B?TXhvcURMN2daRlFXOFdrcW8ycTRUeitzUlN3Q01BcHFKWk1kbWJTWWNKRjdH?=
 =?utf-8?B?YUw2aCtCcG0yQ25QQTJFS2F0U0MySTkyV0gwMk5oQmlCNk1uSjBCWG5FT05D?=
 =?utf-8?Q?VUubwN0ue9ET2cRxdmALyxzpI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87d3a62-d328-4f16-a33d-08dab5891491
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 06:29:18.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCOZgVpyaJYLxjQRviawi6NFJcq53/y7RblnNRM796Iw2Bw0+2IMaVZRquDxfrfr5TVjYGyK05rBZOTB8nBc5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On 21.10.2022 19:21, Andrew Cooper wrote:
> On 21/10/2022 17:53, Michal Orzel wrote:
>> Null scheduler is not enabled on non-debug Xen builds so the current
>> test can lead to a failure on such jobs. We still want to test that we
>> can assign the cpupool to a domU with a different scheduler than default
>> one (credit2). Switch to credit as it is enabled by default.
>>
>> Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time cpupools on arm64")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> /sigh - I'm sure I nacked that stupidity to begin with.  apparently not...
> 
> It is totally bogus for CONFIG_DEBUG to influence logical chunks of
> functionality like this.  The CI script is good in its current form.

Assuming you mean defaults of settings, I'm afraid I see nothing bogus
there at all. What's wrong with enabling more functionality by default
in debug builds, for people to easily use/test them? Yet keeping
unsupported stuff off by default in release builds? That said, ...

> RTDS and ARINC should be default n.
> 
> NULL is more tricky.  PV_SHIM is explicitly security supported, and has
> been for years, so the "UNSUPPORTED" is bogus, whatever the default is.
> 
> As NULL is explicitly tested in CI, it's clearly supported, and probably
> ought to be on default.

... the state of the NULL scheduler wrt its use by the shim has been
puzzling me before.

> Please instead fix Kconfig to not be broken.  That will be a far better
> fix overall for people.
> 
> As a more general note, tests which are using non-default pieces of
> logic ought to activate them explicitly.

Imo _this_ is the immediate course of action to take. What the appropriate
settings are in Kconfig may be less straightforward to determine (see also
Stefano's and Julien's replies).

Jan

