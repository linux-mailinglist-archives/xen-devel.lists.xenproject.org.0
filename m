Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840DD401DD9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 17:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180076.326596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGyd-0002dd-GT; Mon, 06 Sep 2021 15:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180076.326596; Mon, 06 Sep 2021 15:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGyd-0002bO-D3; Mon, 06 Sep 2021 15:56:07 +0000
Received: by outflank-mailman (input) for mailman id 180076;
 Mon, 06 Sep 2021 15:56:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNGyb-0002b8-Ro
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 15:56:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0b55398-0f2a-11ec-b0ab-12813bfff9fa;
 Mon, 06 Sep 2021 15:56:05 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-va3uDO4RM2y9I5DnaNZr0A-1;
 Mon, 06 Sep 2021 17:56:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 6 Sep
 2021 15:56:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 15:56:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR05CA0094.eurprd05.prod.outlook.com (2603:10a6:208:136::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Mon, 6 Sep 2021 15:56:01 +0000
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
X-Inumbo-ID: f0b55398-0f2a-11ec-b0ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630943764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3VIIzhR4VPWUylr8MJh6UdRLw6fQBScFUBQK+lSfh4=;
	b=Y+c/YjHDXnFGZS6F7wHUpPP3RjH7n9hDJZQezId5NEoOxTHvDmZp+5hlkgGnEppu1J5NJd
	fqSMreL6glZmbstkyWwC9CVb+mUf9w76up56vaShGpMmX1OCMu3+giz098E3OnFJAQ9oug
	lkusKzhV63UPq6aGGJ92zBCH8V7bALo=
X-MC-Unique: va3uDO4RM2y9I5DnaNZr0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa4U2cSGjzNInatLJPKW4bsGiTjipHz3GBD4+9hjcxgNXYMpX1Ujz77ItvoB69KvGjZEj6rTZ8vqqB7uGtqzWc2RfIrQdMBfNBn7ItH2q0Ya4FE3EVxgMcg727J/7tUQJYp+1U2O9txHEJPEZv3/YIqpV3RBdUHot1GGeIzZ20cbxk5sADfDMjkxKk277aonkZtWtYH7SDas2qWrPYq8Fz7/6VOpGyqq/hl1zfCBgebk+u7aXfLRgDpAD+seGftOs0yu9aG2nCq4+M2nZv3+WuzeMSBiZWVrEbAswp2HwfXVhL0AnnMTPgv2I6qH8hA+hRnRO3xSInDKhH0dhsuJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eMpjxEXhNm6omFEl8aBZ2ChtVfNPks2EaXMUmuJAqg=;
 b=oW2mU8h4+nJF+7gaYSuD086lsqKeg0UyEeQEhKIrVOLWyy3/xqbH8KL91jiQAsCM3picT6K9N0harL+UWaSPC5REiP8k90Qu9LJjNdLs+J09qqUVv6+qdkkPuD0gtJZXTMTBcAAjjHFDsaJX2T67XCL7CnCCbfYrwnRW3u4Owx374Iuvxb84ssXCorTTJ5J9d4H6SqofSXt6WLsEUPepd71TpdgDaS6vuCUSkWXT/XWjYpJGh/n8i3TFDFBfoTTqTPNgBmrtEuwGL42izeARRAIc1zA1wdjwiCiD36O+zwYAM1zUcRAvmHnzngjlSzlS5mASN9Ik9UHktr4hxu8KtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/6] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
 <457637e2-d35c-18d0-ead8-0b513b257927@suse.com>
 <9b7936fc-f81a-d5e7-5ceb-6e10588503dc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28646a17-420e-bfaf-8f7d-6d109818ffc3@suse.com>
Date: Mon, 6 Sep 2021 17:55:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9b7936fc-f81a-d5e7-5ceb-6e10588503dc@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR05CA0094.eurprd05.prod.outlook.com
 (2603:10a6:208:136::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff10b55-8923-4283-84b1-08d9714ed333
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41901BA90D360869B8127B9CB3D29@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XCUvxD2aG0bcXQbCaYJIUTp+ZbB9g/stXeR60kRa1vr6hihvPRLyiZq7p612wxmA/KlPBuIqBk3F6m+9g4LJhS6V8+l8mzkzI0WhHTBPis32j/MqzUtySbYUKW4wnffCbcbocABdNmIyKd4kV3hytAt9SrV+TtAZ5qgkYA960GqAANmrWkljwUN7AWahnbfHGje2Ddmj63hTfNKJGbRAecETR8kOJe/O/q2LqrEY8T/T1gm7/hRtW9R2Z1KTfv/NBbu0Lnym3R7hh8e6GUF+OEY47I6rlRlaxCm3MwRFkAfB0m4cmgg8p/37rZaXKg4LWyWI/dQxv5KWbgPaEZ4KbQMv6TYHskJbMHGwdD6nywsXzvwyn+Xxz7Sro1clouyj5wI3lCGDlyySP2UidHfocp8vg3MIHnFwio6p/GqVX5cUOHON/br0zKN2pYPiMnrDfPj/p2zY00vhKTo0NH6iYBhMMSy75Ogi0pAhkmvUZ+Ci9IGRpVJICFVlH6Tbj0hzN6A/QYaO5Km8Y9f+96Xjpz8vQLE4GtxFYRdhC0eFkikLxckosR981Oez2iyOw+Tka2oVnpb6SL9dsZIYuVYJ2NSWVxMN7HosZS+tyod3nqqLBK3QX8A4hNZxiubotrUeD6AYpC1aF/vfVSNS0jYfhuG5d8pj18rdG5LLEFciLBgwbZPgfl9sySc/c/F+ve75S5gOvf2lhpo2n9q3Shj4Ez+UYxYCwgw1iToV0ExYLPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(346002)(366004)(39860400002)(36756003)(6486002)(53546011)(66476007)(66946007)(31696002)(6916009)(186003)(4744005)(16576012)(316002)(8676002)(54906003)(86362001)(31686004)(5660300002)(2906002)(4326008)(8936002)(478600001)(83380400001)(26005)(956004)(2616005)(38100700002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?heEbXrQDAcKTe2mtwvp09Q5xqcIgKsXCaSr1gHO/f19hUXxJPOtdTG3yjL4G?=
 =?us-ascii?Q?Rl8TFZn85zWCdk8FXs4Tqpe+lfEHa8um978Zkd+e585aMDkuiXI1Dh/yeyWG?=
 =?us-ascii?Q?c+CcGWJD8HtUoWmEelD2gRDltz++lYYomjzTU7ck955hWl9WQgOTHoouFfLe?=
 =?us-ascii?Q?N+pBHx21wEcrQ9hjjD+vGwATzBxfAV0RCa8idSwusGo958Ql/9rSQIUnNQTt?=
 =?us-ascii?Q?43YzxQ4sTbAp4ZjkH5MEnap4xVMVpcUPwSw92Z1LNwndSsau+DUPm0WDlLaE?=
 =?us-ascii?Q?AT+pUHW/+kMWb6UAaoJRsGmN6U/yOvykzRiPYiQiLIavNyGnqrN/ysHmVeOz?=
 =?us-ascii?Q?je/7h8IWOQ7fO4AYuVnB48295rYysJHNMp53mvj0CS/n7fzDDtzrbjiqCei6?=
 =?us-ascii?Q?xlHd29A/VROax0zwq0O4h9GTNPoPJ9OlW5XRok2b4qimP/2rmFIcBMm547WF?=
 =?us-ascii?Q?pNAt2PQkywgCB+A49j89uGOsjl6bQEPmYF/e+K7EW/T1To0eTnAhlD915oRp?=
 =?us-ascii?Q?BDwkgWyIPM9EfxLNm5GNw/d5xu1h4O2MyCQr5BuTdp3Wets/5RazOC66OtuR?=
 =?us-ascii?Q?CXbGH4NpfWSdiVC64nw0MocS/sSZcANQ0nrLmJjJ+nZRPfdJb7QkqQkyJr86?=
 =?us-ascii?Q?uXZB7mQb02J4aj3bOBnOIUH13v8jweFIYUfWMIdQxFTRm5SFLqYGY9CQBHOB?=
 =?us-ascii?Q?C++jQVi/EdW0+EvhboP1mVwuVTplp0W7Atyz1/s3541WTWjbKnUbj7D0jDns?=
 =?us-ascii?Q?LWuoKNzbjZQ3MojuOLTnbmq9YETWYSX9qDx7pUMI2Fi22X8WEhpzKZ5nIr34?=
 =?us-ascii?Q?QEZUZ33tIKJ1DUHDfwZ/60CwNbkV1BKSkhX9t5loTZIy2lq34Nm/ei1YcI1F?=
 =?us-ascii?Q?Jv5U/IQq/Opvso4NumnlGXeQyurLWRXnYHZmCQqe4TdMaNqWNoJunFcxGTgs?=
 =?us-ascii?Q?cr/HZQXemGW5heWty/GFrjjOHPGlo3vIp+Ka5Jo1LeC/U6QmAQVsYFXNLUV/?=
 =?us-ascii?Q?672GvoKZsWJc3y7PS8k2tvwwZlHP/pJopI2cStxRktutI1+gL37unQ350Uyu?=
 =?us-ascii?Q?Riq/bVb7lKRib8j8+86JfQhWtJxxWz80egFsQvGuMjc41Nrb0bHYWpdvz+d2?=
 =?us-ascii?Q?lgN0LjoJ2Z+Za+0QMKOMk1Nkuvp63+JTVwE0NDb70jq6W+cc/1ZacmqiBUtv?=
 =?us-ascii?Q?/7nlGBJPf3Vzb0+ks1O8zdXEcpO1V776ATJrbbbNn0X1CYQY5betv7fWbBG2?=
 =?us-ascii?Q?3shhpdefCRkb7fuI0CsX+3y07e2CnJ86AWRALnxtmWbhhnRoa9YXWfCBgtw+?=
 =?us-ascii?Q?1kxNZMrfUbtU/luvoYj6/eAD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff10b55-8923-4283-84b1-08d9714ed333
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 15:56:01.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eS0wVgOD70J+2WIq9vpMJ7GEhlL/Ed0NPhAWtm7ixfCso9bOM/2klZ+IpYMgXJDCYM8l2KdHA66ZYvMgHrlOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 06.09.2021 17:48, Andrew Cooper wrote:
> On 02/09/2021 09:33, Jan Beulich wrote:
>> To become independent of the sequence of mapping operations, permit
>> "access" to accumulate for Dom0, noting that there's not going to be an
>> introspection agent for it which this might interfere with. While e.g.
>> ideally only ROM regions would get mapped with X set, getting there is
>> quite a bit of work.
>=20
> ?
>=20
> That's literally the opposite of what needs to happen to fix this bug.=C2=
=A0
> Introspection is the only interface which should be restricting X
> permissions.

What agent would be handling access violations in Dom0? The description
(now) focuses on entirely Dom0; I agree that DomU wants things the way
you describe (provided all p2m_access_t abuses are gone).

Jan


