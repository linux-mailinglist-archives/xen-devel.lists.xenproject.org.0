Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64524047E7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182870.330695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGXE-0001kM-HQ; Thu, 09 Sep 2021 09:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182870.330695; Thu, 09 Sep 2021 09:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGXE-0001i7-EK; Thu, 09 Sep 2021 09:39:56 +0000
Received: by outflank-mailman (input) for mailman id 182870;
 Thu, 09 Sep 2021 09:39:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOGXC-0001i1-V4
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:39:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7eb37e46-7309-4579-8b72-710457a4f8b5;
 Thu, 09 Sep 2021 09:39:54 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-v7YX5zgnOUe-OtfuP7aC1w-1;
 Thu, 09 Sep 2021 11:39:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 09:39:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 09:39:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0121.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 09:39:48 +0000
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
X-Inumbo-ID: 7eb37e46-7309-4579-8b72-710457a4f8b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631180393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0lILzb8aXfHStZ4bHwZau/9qfFE+vcjL8U5FhxolXw=;
	b=Kjj/kFK5MwfRQMeA07ITgU1FZsQSn5aiUfhDcOy/2roNSbOwGdu1+joX1O4mmpNPUg96VM
	2Kxd7OQmokDU0BnMAgXvJyr4/r2FDi8fmhAAUHZ456QPklWRP/RRWW4n9wUyBDB0DJMryn
	sM/Di4b+fZLGnZIQsnU7iR0G4L0m2CM=
X-MC-Unique: v7YX5zgnOUe-OtfuP7aC1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxgAtZGG/kx0hAhZqOlM4HtTS+TT80M4MJcPDiJw9s3OxZyQJf3OroZttd+kFUE/D8S5T4Bu1myu6LCOiUeUELJYtcajDDw5q6C5gLBZ6+tG2jbfIa9y/8sZBBj/gBeCrAQBuEkp6hVOboRbu5GQQy5RgYEcJJCBI6xG8jJzxntGPGItifgLjdCLy0S2c73GXeNQjZuYLqt2SZeN8f+nSToBGLKiRLKITCHUn9Qb2SoC7rPR3cdJFE5NNJR4ltC0kuyt/GCF6PSllyVMpAQ7YxuiaEf28BvFuh+SbkLgwLHinLMx6Svcvs9iHIkaXg3W8qIAS3AD/UFDEnMI58fujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=h0lILzb8aXfHStZ4bHwZau/9qfFE+vcjL8U5FhxolXw=;
 b=HNA40bmZRC4aYw7wYFA0XU29uS11YbWcaiOXouEhrMAcH+THz4UFZ1C3T7r/rXNQkf8/JNOMWPsfjjLoXp6ssXB1clG2S2vmVkOGlmJ3XsglLg7fTudeqKiRjaxBGh2VmID5OUeCxtV7mg5/toJNeBf36wtPjRm9j7q7JM/9zZiNw47LMpK1LEGS2tNiXdTv+is6XEZ6oUGouOseXv39oWjmFfBUKSC9SqSwFIKojULlExRk8haLPZvFwJ+IaXoMCfd97kkj6cA/qnOBpEOFgfU9jAkNNIj+wqC6xo/4kmthvTsytQ5Z1cukQN++I7vmkT/rdGYtkefBOL6I/cxsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
 <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
 <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
 <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
 <422a6543-ec2e-0793-3db5-09456e04f65b@suse.com>
 <dfb66ff2-9c9e-645f-4789-2dc6c21ff751@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27043082-bf9f-5bba-f5a0-bb0e10426aba@suse.com>
Date: Thu, 9 Sep 2021 11:39:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <dfb66ff2-9c9e-645f-4789-2dc6c21ff751@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f14924-af8d-407b-b70d-08d97375c486
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73601CFA41DA3A686A012D1AB3D59@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nqwSU+/iLwq5rV0+42Yh5dq6UnKfmtzQgV/b/UUMaf/VHkPK1x3wLoi8IGeA8Retg1kWbrWxsOe9OwNhxsVPXGSBkz7qBPuob+ocOOp4w8qFn0A7B36Jy1yQUwqxFLUlmOUtpo7RtuJYMAq9N2eG1rgCcC4kHDBu6xDIydDMotn/e6Fnd+cHA5pjb4Ni3UYZ7H5igIvocjeSdkOxI6XiVsF6YltrV5MMTjTzAkJLuvHzneHrzvygsXrzSSmmPZ5reRp+lFHVqSd1Z6vZkYTAR68pNYIbeWj/eyiFmbmh/PRdtpJ733SiLkrUjr9dXcWZ2DkcBiBqkNSL4jBaW7oexS3dNdB3DqZN3CaD5tSyf2N7exQVsCCQ6uiwPk/9Q8snwxNr0ZuIkg4bhPsDd9tiUKKsGtryNA4YLs6U6awxGkkguk9H+dN+TW3AxzWoCm6vn6XQSPuJ1CSeZUs1ZzucGGEQ9OXP3m3nE2ULE0G0jxBYOHrLksPw8pQQzW/v1xAmPbWqhPma+o4iqGEoNc7jzBunUxMQgfCcm5QZ37UAmOI2GuIlfCEO9xdMV0FfcatHovpOoytnd2uJJtOTNAMnvOxh3aSO+c3H+WSpSFn1EVK1hTht3htRH2HLo2DqrLOcS5oK+YaLadERgl0BphUcMUWzkK1i5BWgb73KK4leQ84oNBBoWCBMff3DkoSKGOULE/zJEFHIt/MNE0Pv3vg6UK812oSnNR7XXizbgbMRWrqHNRpn5RN9fkLNuHDZGHdV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(136003)(346002)(366004)(53546011)(8936002)(110136005)(316002)(16576012)(956004)(54906003)(31696002)(83380400001)(5660300002)(2906002)(6486002)(31686004)(66556008)(2616005)(66946007)(36756003)(186003)(4326008)(26005)(8676002)(38100700002)(86362001)(478600001)(66476007)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0F6cFB0WmJycG9LcFFXRlJYOVRkQzBOT3hsdkJPL28zNTRON1JnOS9PSXI5?=
 =?utf-8?B?eHhPaUlyU1ZIakVpU2NROW9TbHh4U0c3Y1Q2NmlhdkNvN3dIRXFOMDZvcWdL?=
 =?utf-8?B?RnhaZlVXU0w4ZGRNR1VOaVFHby9TMHVxbWZOMzUvVUZ4QVRJSTNDZm1oU2VG?=
 =?utf-8?B?dXhLS1BoZ29lb01vbmpuODZYNkQ0eVFOT3M0T1lqMnQ1ZDRCd3Jjb1VmM1RW?=
 =?utf-8?B?YmlzK2Q5MDZpM1BzTHdtei83cGJ3VWhmenJMNkNkbi9NNHJiSzRlM2tJOURW?=
 =?utf-8?B?RDRiazczNzJtVkw1MDBKM1oxMWtBdE53bTBFa3AvVkl3a0MxaTBsU1dBd3BZ?=
 =?utf-8?B?SVQxdFp3MUc0eU9DMnJBalBaYmtEQVBFZGpsZFBHb0NUMUdpdjV4dWJnekUy?=
 =?utf-8?B?Z1hPVEZSeTNTZ1FLejJNanJmcnNkb3BwNVcwbHRJRU9ra2FmM3ZCME51QW5s?=
 =?utf-8?B?bW1vS2toaUxzVUwyblNaQW1SaVRlTGxlTmpad2VUL0FrSWNESHp2dDlwUmRR?=
 =?utf-8?B?cTI0SlI5bG5IckpLYitmVk91UnROMFhVNkh5UXJ3REdnNDlWR1NoYkI3VHJM?=
 =?utf-8?B?NmlmbUpmajI4dnBwLzZIdDhOejJ2WTZmbWtBUk1vY21nZVBOL2FEMjNwTkVT?=
 =?utf-8?B?TEZ3dWs3SGI2R2wvdWRYMEN6aFRaQlJUQnRvN3NEemhxSXpSOUVHZTJoVFZ6?=
 =?utf-8?B?U1hScnVCeG5SR2NkREs1cEY4YXBQNmJ0dW9wS0J6OUdMUVJGRFJUQTVLc0JU?=
 =?utf-8?B?QS9RWVVlTVdWTzBuamtUajUzYlhUQXJEOHlIWHVpcDUzTG5ZZDA3cUV4dFh4?=
 =?utf-8?B?ZFlrVkI0bjEzalN4bUR1ZThPczRoRTRQb0FnekoxSVNlRnYzRk5Sc1l4TFls?=
 =?utf-8?B?MFZQZ0ovaTBKdWJ1WDk2UzNKYlk3Ung3V1gzN1J5QU1qYUg2Unk3UmMxUWgx?=
 =?utf-8?B?NGtBYTFCUmtEYkJjbUlDMVZjT0lPZ0sxMHk0U3N2WDdSTzhtVGtkZTZST1Uz?=
 =?utf-8?B?cGFmamY0ZGRzUHBEYy9OVHk5a3dWRHN2UCt0WlJvZTN3azlVYmU3c3hZM2lF?=
 =?utf-8?B?MEtSR0pyMVpKbHlGQnhyMkNVcUN4SlU0aUFYMS9MOXNnZ3Q0blo5cWlkelJM?=
 =?utf-8?B?MkhPVTQyN0M5eENRbzFaaHVRK1hoSGM1L3ZJVmtDN3VmQW14akVmMFZWTzlP?=
 =?utf-8?B?R3hkVktTZm1aTGtaVFlqWEorTnl4d1Z3cEc4SU1ZRThNT2M2dFhrMko4SzE4?=
 =?utf-8?B?UGpIc2hwVnRNUzVQT3BwRnMvTk1xajFEL3p0SWxXTnZ0QzFjczgza1hZdC9O?=
 =?utf-8?B?eXU4bi9zcU5nWDdlWmRhcUttaUdBa2U2dUFFSXhEQW1SNU9kYjJjNG9PUlRn?=
 =?utf-8?B?TWsxb2gxTWtPb1pjLzhrNlJXMkNyajhPYi83NWNXb1hWSlA1a09HVWt2amxQ?=
 =?utf-8?B?SW5idkxpd2cyYk14Rzh3Wm1PdDlzS2xlbVk2Z1pYVW9SMkFCSFo5TVBqdjJJ?=
 =?utf-8?B?STJnN3RzSGY4dFJmMVBGMEVaZ0ZkVE42S3ZxTnpkeU5KWmo1WXd1eVROcW9r?=
 =?utf-8?B?cmsxdGpSWHprT1hHRVIyR2huN1VhNE5jQUFLZlpTMEZFcThDY3dvdDN4WThj?=
 =?utf-8?B?dkZtTnk2YVZSQjlYZEI4dUovRjBUbDU4WjFhanJ5YVJ2aFpIYXd0b1NMSWp5?=
 =?utf-8?B?MkswQURCNGZJZnJLdUxNTFJVbE4weXNhSU1QNnV2NHFxcGpEM1lUUFpGcEV3?=
 =?utf-8?Q?vXf/GAXwVHSnJRVlSery4ZmQQds7Mx+bKp6ElXj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f14924-af8d-407b-b70d-08d97375c486
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:39:49.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ww/na8YrPqu/jpD8M7znn+16jAK8mKqrtFaOsCGmDCCiPpp83ymXZfloLdl3nDX8RYc3Zx9Q8PY1lmsDepbTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 09.09.2021 11:12, Oleksandr Andrushchenko wrote:
> Anyways, I am open to any decision on what would be the right approach here:
> 
> 1. Use range sets per BAR as in the patch
> 
> 2. Remove range sets completely and have a per-vCPU list with mapping
> 
> data as I described above
> 
> 3. Anything else?

A decision first requires a proposal. I think 3 is the way to investigate
first: Rather than starting from the code we currently have, start from
what you need for DomU-s to work. If there's enough overlap with how we
handle Dom0, code can be shared. If things are sufficiently different,
separate code paths are likely better. As said - to me a guest altering a
BAR is merely a very special form of a request to change its P2M. The M
parts remains unchanged (which is the major difference from Dom0), while
the P part changes. As long as you can assume no two BARs to share a page,
this would appear to suggest that it's simply a P2M operation plus book
keeping at the vPCI layer. Completely different from Dom0 handling.

All of this applies only with memory decoding enabled, I expect.
Disabling memory decoding on a device ought to be a simple "unmap all
BARs", while enabling is "map all BARs". Which again is, due to the
assumed lack of sharing of pages, much simpler than on Dom0: You only
need to subtract the MSI-X table range(s) (if any, and perhaps not
necessary when unmapping, as there's nothing wrong to unmap a P2M slot
which wasn't mapped); this may not even require any rangeset at all to
represent.

And in fact I wonder whether for DomU-s you want to support BAR changes
in the first place while memory decoding is enabled. Depends much on
how quirky the guest OSes are that ought to run on top.

Jan


