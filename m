Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F357852C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 16:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369852.601404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRZf-0000VH-TY; Mon, 18 Jul 2022 14:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369852.601404; Mon, 18 Jul 2022 14:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRZf-0000TR-QB; Mon, 18 Jul 2022 14:18:15 +0000
Received: by outflank-mailman (input) for mailman id 369852;
 Mon, 18 Jul 2022 14:18:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDRZe-0000TL-Op
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 14:18:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7552834e-06a4-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 16:18:13 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VE1PR04MB6685.eurprd04.prod.outlook.com (2603:10a6:803:120::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 14:18:11 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 14:18:10 +0000
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
X-Inumbo-ID: 7552834e-06a4-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLcKxY4DT3Raw0QB1TqdPmH40fYRY3XIX97VLDFEq/8OF96++CuB2H+zpWJPH1idUteIUoTd8J+YM7qpIkElZAzkcrqUl7eRAVsKRuKJ4YvjnKrUoFnBv+fDsgrxhFJtY4vZ1ABxL0ACmB3HYmhlWDMzZxXr69zBDFUraonZhxD2M+anc9j/ktxzFVQpoMHGN3pYIZEz4riU1DzwdTvGU2cCX7262LY62ADX8I0f7kzDOHS2/mGTM7dRU2J+XJH48zA4livdSclmx4bh42K2K2cznrOUCbLgFqc4rgqa9R2iTlD0AIgeo+nffU18XUWIimqajGo6RdasdeURAKp7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jl2yXiaCydCHyslEEvnLSLsXVm32pHu4jDvcXmC7u4=;
 b=ezZrLJ0trKVeyAfnPgqHUYmdtpbrQTfAEsdHNykNT2TgyvMmdCy3HMDRd3XzCCxYg0L+OFrIOWATMl4eETZrlJMvOrbRFFp/wANh8GHSdGShBJRtBghffCJPvGKl17l/R2SJUOzBDnBQeinQa1+pDDraLvINoxFoTtqz4h1fKGL8YDFShWmhnmuMFpGB2xCTa02axmmal39ox97eF7D0ez2NHi2wB8OhfWXvKEqy+Uit6WCzbDHbkpri/rW64U20on9Bix1kA4kvQWf5KzO0MaHc6GHuOtP11dl2wiruWLnVEqCd/M94zWddYrZdlPSHilH3zot2iy+wn7oUQfwxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jl2yXiaCydCHyslEEvnLSLsXVm32pHu4jDvcXmC7u4=;
 b=YnjDn4wKBMLwFlVQgPjDF8QdB+LwmWPNnj+3cx2B36kmQEsNJkZ2vC7ByGqRQrXJO80xosUnM2cOIGYZk42f4eZtEG8zZyTIs4W0TKyugHsrn2kIL74vYHr5lhTRa4mqiX4OrARMooPxY192TPGu6aAg6uApqgBuguZUevnnByNy+5Mj9APYdoWwPJcloqAFFdniSl59+/IRqyKlvQH4PFlVUA92fyoO89i2owstuVvGW4gJlb+t0+LYBoybHU5E/pXnmeSTJIDIyeDMg1KSsDuwduiK0DLw3Rkr0nYqw1OHgiNH5u6v73Fgm+gsqsiaynL/+iRnkFq3iRxpN6cAkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3842b4a4-c059-1eb3-c292-f53c5357e502@suse.com>
Date: Mon, 18 Jul 2022 16:18:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86: Add MMIO Stale Data arch_caps to hardware domain
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220718140517.14771-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718140517.14771-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9868481-b313-4a80-3ea6-08da68c85824
X-MS-TrafficTypeDiagnostic: VE1PR04MB6685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gmOfTqYi4JVe0qXf1yuVNIlT4a0ZxQaARC3P/Fcyc4JKufZKgTfN0eXZf/8jiSgxS2W+FsmWupfbuKIttb3beua3wuAy8LxXH/N5BUhjYylTXGuTOY1ih2UsdRvgSlpWOJey7YZtZoa6fn1lqfNlEjrtkHaAwrihYegECbtcycdx0uKvQRRBafPaMnVr1F7bZMT4vqiNajxXeePGu3RqXIkgwU1jzyKYTNqcWs7ERYiZP3latlGi+EASJ92nM+eqb5GKVKuy0AnUg9anWat+4CGMqK5DJv57M+G4x9wdnnr9EQPRRJp48+XJFYrWS7vRtTJum8HOhj7DCBwRBsM+mqN1PqeMqZ3ZZTXUwxRFGiRqvEBm6+KBfs/HAaIHujN5SRd+WhMNOaiNtsHZQTQZs9F+kW+qCwIHlPK6jY8gLFBdDZVEpPxjZKDCSpF27pSeURkC7ySVUOZU44y+ilms1tki5wyjHcLz++53zhmioXqusynCBiZFgY0ji5EEEC5L9DVfjfvYiDQyfu1Gb3+eKKOCZ9Opnm3zGpJDYYheMQ4MzbD9IKx7xgID5PZPPx4500X4lx41wUSk53kryV+24W0kFgx8R+3Aq6HlNVo78fJz7c4Eekkv/p2x2jDUmstHBeneqLTpl6sTMs58NK2IsLQcag+cKvtthgt8MyyR4RusrgERcbvnTZ/BGQeGPz6IiWNA0APiWqt9YpHaD6KsEbAQMCblV5kjlPZGLBRGgsD/cgNShw+FSugbD81HgtEPy0brNVHzIF7hV4jyfF+FG1BxVV1IwuYPVDshFlcSc7yTI67qsjBOVmpDKBjC/J5zCVldxOkEO3thsxSY+dRXapfPiuovLgYXANIpjOB5h/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(396003)(366004)(2616005)(186003)(31686004)(26005)(41300700001)(83380400001)(6486002)(2906002)(5660300002)(478600001)(6512007)(8676002)(31696002)(66946007)(66476007)(66556008)(86362001)(38100700002)(4326008)(8936002)(6916009)(54906003)(36756003)(316002)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDZaa1hNOTh0dUJTc0lTYjZoc0YwcTM1Qm1kRVhiQVpjWUNWSHNGMFkyRkFr?=
 =?utf-8?B?N21URFpKVTlHNzFHVHhvblFpVzVESUNlcEh3bFRRZHRqbHQ2TUR5ay9RN213?=
 =?utf-8?B?UkFQOUtiLzEwWWt3cnBzajYwQkdNNlhCYWZIQ2FSUllUUkZLeEZYeitxWXk0?=
 =?utf-8?B?V3NmYnlvbUlCQnB5Ylhzell2VjZId1VWaEFQKzNCdnZHVkVaaVpiUjMrVkJO?=
 =?utf-8?B?ODJVUUZrV2hkdlpwS0lKSUR5bG54K0traUxKQTM5WCsxNU0zYnVjaFNtYy9j?=
 =?utf-8?B?OWEvL3hIVVdTTXRORWhlMG5ZMU1JTnR5ZTNqclh0K0dVVmRNUklZbE8wRFNp?=
 =?utf-8?B?OVBLZk16b1F3SWNwOCt1cVNseGk2aEFCMDlLc09DTmNtdEtWSTNZNlYveTVS?=
 =?utf-8?B?YnBoMFg4ZDIyUjFTcExCWEhUakJZeXdTY3dDZ2VPN251ZW1MTm1VdmFVU1lp?=
 =?utf-8?B?d0JHbmxJaTZVUHR5R2JXamVrUXhTeGp4RDNDUFpuenhHY0ljZEl2dFVHY1VJ?=
 =?utf-8?B?WjFqd3R4cVJKTCtLU0RKQjZUWVdyYlBnUVpDNlJ0U3lyZVkwV0k2bStzeTlj?=
 =?utf-8?B?bGR4N0ZLY29BYUNWNGFZQ1RycFI1NHJYVlBlanRpcVpmTjNhQ2NmbHRuZDJv?=
 =?utf-8?B?NXljbkVwdVFrVTZUbjFQWGxLUkJwenQxVlh5bkR0WXdMQlRMOXZPRWRodHBp?=
 =?utf-8?B?aFo4b2xhdm55aUVWRFNZc05hUGtOdk5JVzZlTTdqeExBZ3dhYXBFT3RLSWcr?=
 =?utf-8?B?L0hFcldhOUVmb2lEcGhMeGJ1YVNNeXdCQW80c0I5WWRJNlIyWWVGbmdZTDd1?=
 =?utf-8?B?RnBUdVpOUWFBTXRBbHBNRHNmc080SjRFUkt6anRIVWluc0JSeDZvU3RodFht?=
 =?utf-8?B?QkRIdityMkNncENaa0xjRmF1bWJ1NW5XcWFrc3UwL21uNVVPdTRTS0xqdUFh?=
 =?utf-8?B?MWlCNDFXS1g5bllkWmFwNEo1bWZMd0U2M0hnK2g2NmFQRmJQNGd4QXVlQmND?=
 =?utf-8?B?WWRjSFdPQnJMUjJPQkdYME1KbzFhamlVNVdKRTRENFllQnQ1R1JKcXBlS1dM?=
 =?utf-8?B?WEdBUjg5T2d5Z2lGYU5lTjQ0WlZIMzBVS1dXQzBJWHhXb3l2QTQ0VStOSnNa?=
 =?utf-8?B?a2JQank1aWltd002OVpZRC9uVXVaYVZJMlpXRjdKRThCMG1uTm5sTXpGRGVs?=
 =?utf-8?B?V0xaSVpHYlNubThDVXBvMmxQRHNvS0drdTJjWWt0cHY0RDdzdUhiMmJOcVpy?=
 =?utf-8?B?MEZIekEvNlJxSjI3M05SVU9aTFZFRFdrakp4SUNIVmozL1FkSWVaRVpsaDRJ?=
 =?utf-8?B?M3pmcFJaT1ZFUTlTeTQ0Nllnd1ljZFFwMXJyNFo2ZXJWQ1E4eEY4YlBLdTdv?=
 =?utf-8?B?SEJ0YVFaMFIwZXFLWjMwSk5VNmV4Y3RUTVRuR01sV2JWc2lVUThOdDArQ0ty?=
 =?utf-8?B?Wi9kQk02VUFUTEd4Yy9HR29HTVhzcjVueDlNekpCaEIrTnkvLy95TlNhdEx4?=
 =?utf-8?B?YlVhV0gxTlR2dVk3ZEJtT2JrZi9kdDdGMGF2Qnd6TWpjQS9zOUR0N1ZZOWdq?=
 =?utf-8?B?ZmZkY3ArNWFHL0hjcWh5S0dhcktkUXRvcFUxVkQxT3BRUVM0QUVkOVhDcVgr?=
 =?utf-8?B?Q3EvelpwcWxFNkRnbkwrMEpCSDQ2V05JdGRLbys0U1JrTFp0aGwrZ2pZODVR?=
 =?utf-8?B?L3BsaHNWK2kxOHMwRVpPZjZKOEl4VUtTekw5ZkFGUEtnWUE2SkxQNm5mWVQ3?=
 =?utf-8?B?YkRVWTkra2JpU2U2bG1MZmk4ZndjZk5XbytsK1gxSHZhSDlib1FqNWlPcDJF?=
 =?utf-8?B?UGZWdkpRQWxjeHhleEw2SnJlTURkK1RSL3JZT1E3Z3c2cnFFMWQvbVdwa2sr?=
 =?utf-8?B?bHlDWmpkY0tvK0VxcTcyeGhJMjJPdlNKY1IrQkU2OHlGckdZL1BzbkhJOTRr?=
 =?utf-8?B?cEZydTJ5UVp4RXZXREFmU2Q0TE9xeUdOVENGUURKTEY2ZGVhaStCMzlCcFMw?=
 =?utf-8?B?L3Mzc2hDOHdISDRLeGU2R2JYZzRwajRZcnVma2lKSEhydiszWXdzalprNXZ5?=
 =?utf-8?B?OEpPc2h5MElBN0ZCVlErckpFUlFKckN0YWVIcXQrMG40R0Y5TjIveGVGaFZE?=
 =?utf-8?Q?y4zF6NakwFaMuM0X7C/TzD5Rh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9868481-b313-4a80-3ea6-08da68c85824
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 14:18:10.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6m6KFP94DJ4s8/uP1OflLWt/6Dnyr8Dr6A4ubm3UILJ4TQLM0miCTJeYiMPtrM0r3ydKe6Z+n0Ik+BwtkMIhbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6685

On 18.07.2022 16:05, Jason Andryuk wrote:
> Let the hardware domain know about the hardware it is running on.  This
> allows a linux Dom0 to know that it has the appropriate microcode via
> FB_CLEAR.  /sys/devices/system/cpu/vulnerabilities/mmio_stale_data
> changes from:
> "Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state
> unknown"
> to:
> "Mitigation: Clear CPU buffers; SMT Host state unknown"
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Should calculate_host_policy()'s arch_caps mask also be updated?  They
> are not identical today, but I'm don't know this code to understand why
> they differ.

I think this wants updating too, yes. I'm afraid I have to leave it to
Andrew to provide the reasons for the differences between the two.

I would further suggest to also consider adding RRSBA and BHI_NO, even
if then the title would want adjusting. And finally I'd like to ask to
add a proper Fixes: tag (or more), as it looks like the updating here
was simply forgotten when the bits were introduced. Ideally we'd have
a way for the compiler to remind us of updates being needed (or at
least be considered) here.

Jan

