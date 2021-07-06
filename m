Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815473BD821
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 16:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151391.279795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ljn-00026o-E7; Tue, 06 Jul 2021 14:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151391.279795; Tue, 06 Jul 2021 14:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ljn-00023t-9u; Tue, 06 Jul 2021 14:07:47 +0000
Received: by outflank-mailman (input) for mailman id 151391;
 Tue, 06 Jul 2021 14:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0ljl-00023j-MG
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 14:07:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 271ee2a8-d6ce-4d44-a2c6-be3d1ea34053;
 Tue, 06 Jul 2021 14:07:44 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-KchfXxDfNTyOEml1MXZF0A-1; Tue, 06 Jul 2021 16:07:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 14:07:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:07:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:102:b7::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 14:07:40 +0000
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
X-Inumbo-ID: 271ee2a8-d6ce-4d44-a2c6-be3d1ea34053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625580463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJIpvwo8QqpTK7WW+1RQbAa9950DtOgEGt9vLhVzg+M=;
	b=g9z7vbfIlVq3nNl85oPtlMtoaKl0fn8NTRru0S8Xn/zHz6B2dXhxFtOKc/+TxshxWCm5ds
	ANYr8lqBpFgw6TtLTVWHaXJYkLGPYJlPxSwYlUfJRHiG+RHZmPwVyf/Hg71JmS8w21tes7
	Tz6n/5AK8UlxLySdt22rgb/pHf3w1U8=
X-MC-Unique: KchfXxDfNTyOEml1MXZF0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VU3UntHuHZMcX4Szf1zdhcdAPS6dAv/XYfoJVWMLZ+YAstqDct8mNPVG9SryuQQCcuZU0msIJH1BRw82tKrsJAfVBQFehptquzU+Q55oE9OY0Fz6fw+nD/6EOmAWno82HyWxuYs+dyDxtSRp7O5OZwlPA88e1cczrBTgvrJelbzBzYQf6Mby/+Oi5gZNuyLEgR3Z0a4Z+E7chKhllxOhnATXe/RcaDNPk6RViHO/gLQD509dXB7aFYR9SHWf3U9B4nYr0N6E4lTghux51mrWpNd5cEuiCvIW73UUgWcjEO5buoxsRmmMyoWkTmMgk0bpr+I/Ec5S+SfCipJmKJLEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJIpvwo8QqpTK7WW+1RQbAa9950DtOgEGt9vLhVzg+M=;
 b=HGGeUzAZyunLBnQJIP4yHlhXsvvR/fo1LAXLmgeYCLFKIi9E9dKl3QH9UWyEKGZbWvdFejK76I2L032iBtExtl2A40+iJ3GNfyCLwnXpesbMcrQyzdfo6h4Vu+3dQNzHXE4KD+4g9DXklDFRC3LJOXnTEzT+yO++b2RU6f7wtgsRgU6QdXVDi6QplNRuty96E8EoCvYL63avUz4ObMoPVdQQMsVXF8ReFr4HHpS0lg6enrU/2WgOaJv7XqIPC44kGawUlXA7qYnS61cpAVzlQF1qT8J5MR4hQdKyvzXxBqiOCszpy1g1xo8N8Mv1MZZ7CsU900DzPSCrcGT/OVOk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/xen-foreign: Update the size for
 vcpu_guest_{core_regs, context}
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, michal.orzel@arm.com, olaf@aepfle.de,
 xen-devel@lists.xenproject.org
References: <20210706132000.29892-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa29ee07-0231-378b-4f28-07d894b371f5@suse.com>
Date: Tue, 6 Jul 2021 16:07:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706132000.29892-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55e77974-13a1-445a-a042-08d940876b24
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393520D4ED602DDD4F81D1F6B31B9@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uwhXAKl1+cK049Rhm8WZAVOBVx21ce/aHLZMrqHYasL0DHNf1eEkD6jwzemSG4G/ZHaqkpN3I8+QAk2FfWqEeDV5OMoHIy8mPOAeicJC9K0tSYUHGkpaqk06afg4IKWcAl/g8SCutJo2l+VcZe5ndngOMWTQ5TExsafx5sPDjMufAqSpGx3Wr0He2p2m3sg/dtjbYarx8Ht45VHC6kDeJfnQxGri9b1LhJxSa1mhgMGuFy986BhWcNnvhun4RI/mdbefwmOYSKDcfg6r1TsezWwm82KxftlJ18fT2jiY1G7S76kh5YBN2cJTeAqVXOkf2Sok9RUkMZoY2smVyMNIOBMLZflnrMXtxPm8aF6ABUoPOFHWWVowGYN7qDZr2feQIkgtF7Q7Pi4uSNbYKY5SoXHNiZYg5838cwZFNSFHRCA9Qywy18zZHU5UNzFP4vkeRo4rDFusFZSjbnLlVO6PXVjTc8GHmfdSPjNmnXpZKOiCVuEEQGOeXvO9C8ZiJ18vslN2sAOcxBcigccSs5qwEuZ/zEMrdY6s0MpF6olocrivgdtL4am8rupwD0KUmUKAzxt/8jNsCbEHJr4AXS00lEwTfEQ7IPn4UmbAbqGiG0zGQ3y9FV+/rUdDYNQuu/mR8VAVwwiHKB6uz/vzK9ecRJyWEq71iqKeqr8tMKM+a2igTg3TpEFmWzeky4/eFDe1dWlK/tm+8J2ybzgAccqlRY8lK1ICUN2/RlyHJaTLoVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(346002)(39850400004)(2906002)(8936002)(478600001)(66946007)(53546011)(66476007)(8676002)(16576012)(5660300002)(54906003)(316002)(4326008)(31696002)(66556008)(6916009)(36756003)(956004)(186003)(38100700002)(31686004)(83380400001)(26005)(15650500001)(86362001)(6486002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0s2aWpIbExSZ3B1SzZrVEJkT045K2V5MXU5V2xNR2FYdklVL0doVWJ2N2JH?=
 =?utf-8?B?M2hYMkN6QUgrSWs5MVNsaDBnS1RsZWRNOVB2b3Y4WXlkWmRJSFh4L1EzKytQ?=
 =?utf-8?B?Slp2WTNCN0p5OHBVWHZhL3NXbUQwTEw3cDg4M1RxSFlUQmo4OHZJTkhIWFRT?=
 =?utf-8?B?T0ttY1FVWnhuUXlYSFdTaWs5VzlNWXhqZGFNZ0o0Wi9VbnU1MHR4bUdVRXYv?=
 =?utf-8?B?amJVbFh1blJPOStia1dyVTQvNW5FRmo0bC93UGxVaGczYndOblFvTEdDdnBp?=
 =?utf-8?B?bHBQdUtOQ3hySGxvWGU4WEJhbFR2UHU3ellFRDJxcWRLVkFBczZteklBK01B?=
 =?utf-8?B?Uy9oeVp5RHVtSVdlSlVlYmNzLytVNkRMQUczRDdRUDdUeThVS2tYcU4zNy9p?=
 =?utf-8?B?YkJKOUhPZ0NpV2g2bDhRbDBWMEUxYnZWSHlMdkIyVjAwV2pxOHNubnMwLytE?=
 =?utf-8?B?T2lDcHYrQmFsNlJFenI0R3hIKzhoOGRLUjNOdjRqSG8vZ0lKbmdxRWcyYit2?=
 =?utf-8?B?T3M5cUJtamlmWlM1UFlsWVF6SFh0ZFc4MTdDNjQxa2dJaGZmZzFrVFVaM0JF?=
 =?utf-8?B?cmE4V08vQUExSGtibTRHTi9qaFhKeW11UWwzMXV3WXdqRnExT1REZ0wzTmVO?=
 =?utf-8?B?enVLeUNxeFZ3eVJNbE5KVXpEWTJuVEZTQzdoT0xyT2VKWFZORmJYNThGaXc4?=
 =?utf-8?B?MEhTU3RYcU45RmFSSEdMbjd3VVlrMmtYUHpPOS81K2VlM2NHWVFjZ1VoU2JB?=
 =?utf-8?B?WVhLYjhxb0tVV09GUldwdjVKZzlZZGZQQUthTzVsM2tUaVNnNGRvbCs5b25O?=
 =?utf-8?B?VW12Nm1ScXV6RzhhY3RNeVBJQXo4anVpbUFRa0dwU3R4T2FKeXBKeFhlYVh3?=
 =?utf-8?B?bERFV3dnRHNDVDBQSmpqdEpESEt6S3h1UnB2S2U5L1g3R040aEhDWEtwdzFi?=
 =?utf-8?B?L3VDbkR5VHVFajVlak0zRzkyTUdland6V0g5K1JJYXJ6Z1pZQXpzQXlOVVc4?=
 =?utf-8?B?VXkyc3dQU0R3QnFPNTVZbHhDYXB4WnI0UzdlOHJFNG5odDdGb2NXVDAreEhP?=
 =?utf-8?B?bFltSFVlNFBCaUdVc2VCdWR5Vm1YbFhVSklpeHJ4dXkybmxBbzVjcGw0V2Zk?=
 =?utf-8?B?cThHc1ZnMGpHSjhkTVE3ZzBKOVBMeDlMdkhvVTJySkU4eVg0NkN0WjFMYUxo?=
 =?utf-8?B?Wi9UaWNpS1pBNncyM0JjZVpoUFRBUTUveVhMLzdrSXN2WUVUZUJNYk43eGlO?=
 =?utf-8?B?bm9LRDBqN1RFSlYxRGdKYXNJV0IwK0ZWa0EvbkVValVDdVh5ZWxocklzZVEy?=
 =?utf-8?B?NUM0VFk3UllNRjk5aytkeXFvOExBUDVRMENNN3pKeU1oa21zL0JmYlNScWhs?=
 =?utf-8?B?VWhjTmNLcTN6Q09KbGxPYjVKczJZTk9BZ2hlMUprUTN0YlRIU2RGWnFuMGpZ?=
 =?utf-8?B?VlR6NGg3UWhlNk1rL1g1dDNBU2tIZHNUTzZrSWxJMENCa3pkTmlnZVBaM0M2?=
 =?utf-8?B?VGpKL3ZReXB0STdYSkJ2MHBDUlo1Q1VnbzE1RzBWdnBWV041N1c3WFRQeXdH?=
 =?utf-8?B?eUwxdmhCSmRjWkhJOGFsV0N1TjU2SG5lczJlRWNoZkxNTDdxUEJBTmxscXVM?=
 =?utf-8?B?SCtheUMwTDJOYkVZelpxcjBGUWkzdkNPcHUyeEFaTnpzd2g3WUxCZ3piVkdK?=
 =?utf-8?B?R3B6SkJKNUNXSlBpUEYzd2huTVByQzFDNHZNcTZDMmFuaFN5WjJyTXNIcVdO?=
 =?utf-8?Q?qRGi3NhcUYbXKup88ZGOmsPnnLHlcRg58hH4bAT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e77974-13a1-445a-a042-08d940876b24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:07:41.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJ8DC0tx1Q0bdlI9KSlbCKL/M+WKNR0kNcgOKJkVLJV8vcjRNxh+nbMOZoVIU5u50/FFEkw3onzKryErT1hOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 06.07.2021 15:20, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to
> uint64_t") updated the size of the structure vcpu_guest_core_regs and
> indirectly vcpu_guest_context.
> 
> On Arm, the two structures are only accessible to the tools and the
> hypervisor (and therefore stable). However, they are still checked

I suppose s/stable/not stable/ and ...

> by the scripts in tools/include/xen-foreign are not able to understand
> that.
> 
> Ideally we should rework the scripts so we don't have to update
> the size for non-stable structure. But I don't have limited time

... s/don't/only/ ?

> to spend on the issue. So chose the simple solution and update
> the size accordingly.
> 
> Note that we need to keep vcpu_guest_core_regs around because
> the structure is used by vcpu_guest_context and therefore the
> scripts expects the generated header to contain it.

If vcpu_guest_context is also tools-only, why does it need keeping
(for Arm)? IOW can't you drop vcpu_guest_core_regs from the scripts
altogether, and mark vcpu_guest_context with valid sizes for x86
only?

Jan


