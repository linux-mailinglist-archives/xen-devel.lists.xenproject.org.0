Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269634A999B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:02:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265503.458888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyDl-0002lG-LW; Fri, 04 Feb 2022 13:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265503.458888; Fri, 04 Feb 2022 13:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyDl-0002iY-IG; Fri, 04 Feb 2022 13:01:49 +0000
Received: by outflank-mailman (input) for mailman id 265503;
 Fri, 04 Feb 2022 13:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFyDk-0002iS-GB
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:01:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c253017-85ba-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 14:01:47 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-XTPyIXk1OtadObmG-2dB5g-1; Fri, 04 Feb 2022 14:01:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6440.eurprd04.prod.outlook.com (2603:10a6:20b:f4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 13:01:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 13:01:44 +0000
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
X-Inumbo-ID: 9c253017-85ba-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643979707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRGoAlHuaCWvQyb6t/g00gRtygicmk7STo9sNL4yrJg=;
	b=N7kDlTHv6fj8uqmouWNBJRs5zWANex5YgpbUlFFB1yD245cHijoB19h4erovQVkXiexIre
	W0VGC2AyNZ1g36eRT/7/eCvfWUDAf1LHvvAdPxmLPYQiljhg35tHQiJR4sPQLIS/IzdRBT
	5Em2GYM2mosbNhppARrLpkrAGfudn/A=
X-MC-Unique: XTPyIXk1OtadObmG-2dB5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDYJza4JlJDiu0JCpSM6/a3G5NKhOeV3E21D/W9OhRRBkQPgKrnaFI70P/xYqrFpjySeXz2lUNf6DwzyIk7+a2vG5I03QxOLs3EirkDCMGJrG+AkIdX7mC486bMIqjvAHkxNirX+Y8XmOHgk15xFvd9CBv+QbwUufebhWoMIFRBF8qSJ7wmfz7kWB1qqjWKv9aewch/9jznH3H9IOpMqGzCefkBA6xUPJE/onZtCEl1OQquLyNFGeyoK86F8Va0XmK96cQDAC+1UC5SiaDVNZghZQsVyurhUebcuvJ1Do0rYWR5kSGdkGGiqlwL4D+8ri3hzMT7S0RHOQdhsWuw04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZNMo/XRVYgUyoOFEdCXcYZ7ZInSsT2jNi4wIVZ2avw=;
 b=F2Kr78bPjZ9B1Qxty+PIiuDIszMQ/cnKit84lfhWJDSbjw56Y1yiCyYQ7zoa4N7Buaoq0xPlTgxlOSPfXirbfFEfEG5jaPTvHasNuZ60g+y8NEro46VMW5dSEU+Liul/q2WA8oL1iQ2GuqtCL22Lox1T1D8z0iSnwH0+nlY0cMBtw2XBGFepQdxRDzSboSqMLpA9Y7LAu+vswOZHOZRjo9Hj7R7rd4JxG+zaTc9afjipfeDWo+3sN5KoNKLZYImVJYIU20ecSgSWD2bOiYJJE+so2jg6/TURZ9ZQS4JXtRx8MiS8kaNUFA6087Yu4htrYYCs0R9wpdHX/w4niKiqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fed06b8e-cba6-447f-0f17-e7a4ff557205@suse.com>
Date: Fri, 4 Feb 2022 14:01:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
 <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
 <348f062c-9aed-0275-f0ad-87a0eff8e986@suse.com>
 <8a28b63b-a5f6-db0f-3108-646475912abd@citrix.com>
 <c20b2017-7313-41bd-c854-48029a5df206@suse.com>
 <5d721986-3298-51b1-22f9-58ecf8cb32c2@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5d721986-3298-51b1-22f9-58ecf8cb32c2@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fec8a980-bafc-4f8f-cc99-08d9e7de7e7f
X-MS-TrafficTypeDiagnostic: AM6PR04MB6440:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6440DD595BCED0567885F428B3299@AM6PR04MB6440.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9m/kPWtKPLhTRvFl5uKAMIrROOp/efJzeLrQAq64ze1rSTys5ajHm0nlxCPP+6zYPonEGiNeBoDBC0X7pjzZZvUOzxYexqcX9KTe93mTbSrxECT3w/uQF3OQlcKaVKUKx5Nkp3Rk5bFZVHtV5LRPYMoYYlT7pxKJmB9FRfNSPsVB8zufaOCDwGkBsGhBq3KjujMgit69z7sW9C294KfKZz8OJ/wVMRAphzxpiVBDssO6NJV7d1jJyvv1aA1JMELkFNZYGZWVFlhoLqzM6t1v+i+NjrcmP0YxMb/t2oA3/TjaICy5CZrTbs7lASrfyONzTLKEozp1zHydEJBeEyZpu2sGN1It413GPtp8GLt5ma0G9thcSMppMfFrd+TH18Yf2uB+oaDCL4ZnH3gujVtoqCLtjHZsmAgRczSXOWUeEd7n24XjXhlVESqKEHJUWM2KlfhcKqnsXne3J0xGzo1auXeq4LVyGs0VfgGM+LgM0O1JG6E+G38WSGb8xtWkYz2km+FjF99K/endiailg7QJiL5twTbrcF1vrhJtTlWCpESS0MV6/LwZVpXX5U6svt8P3jklMkFUdV7ptiY/Spwe0dQjfnLG1NZUkQE/4OoL8KSqAl0sV44OIAwb9A57FNtZCP99OOmS0YxADlWo7dGie8pWH13Cke6i3+vfVM2gytyU2Q1YL5SZqdFcQKfWgaZVUZfleqiXUadUm7Nq91f/WM9K1f79VVq07sqcMda8tur8yQlSCw99nEplZDXlUcv6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(186003)(2616005)(38100700002)(31696002)(26005)(86362001)(31686004)(6506007)(508600001)(6486002)(66556008)(66476007)(4326008)(54906003)(36756003)(8936002)(8676002)(66946007)(110136005)(53546011)(2906002)(6666004)(5660300002)(6512007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UsJ2TDqH1gdasImYF885GmxJFRQ6k0AlzLV9lTVI/hUcwIA+00cEtAsIh2sq?=
 =?us-ascii?Q?KnwP5oGqiL5buhQ/BQuxJ3vGGPQNeIEFQ2mPuUTO1bagalIWH+Tzi2Mgcnl9?=
 =?us-ascii?Q?4v/PdTdxtMPZ+HaGzThXZ4abhlRFXWsba/+1nmtgLP4CpxNbatyTozcfWBOz?=
 =?us-ascii?Q?cxX0qH6GnwxTjFjomz3RAvU14TjbAAWZ0T18c620JbjYKpKJ+POORAjf4t0T?=
 =?us-ascii?Q?cltZjvYWdtcIvImrdklKP5GH78WNvmjVkF4yW8onlY7wMPPKKVjx6qRTvCFi?=
 =?us-ascii?Q?jnbSZEkNnyYdMXYR75BeqifC8tkONOhTHrZfTQPjyzz4/RaQ7CNgy3DDDYjo?=
 =?us-ascii?Q?wvkb33aNcNXGBXt6R2miggu4vpyRAG/3mNPulBccIIBxgeTuX7bW1mS+f4du?=
 =?us-ascii?Q?uZhWmJYEgM8PH+MITd/xfbNBgXRfodZxZqUF9ow03lCeUaKqWDSdh75nAZht?=
 =?us-ascii?Q?DYg3Yp7FCYHU3Uh4Y6poO5Kfi+pfsW1u6WJ/+b+yfB9f1TYUD/vGWriTUiqd?=
 =?us-ascii?Q?z68fueRKhHw36FEdA4rcqAaLOxcQzMQklb7WtlaDRcEXA7yQBvv4LGxYfb5z?=
 =?us-ascii?Q?JhpCnQk0RsjLrFaenix6hhK2e+C52rgXJfVsSWRhLlaGsGyvWPHcvCRDxQ+2?=
 =?us-ascii?Q?2jZFk1egcZ5ncO4Ua5SASF1Op+65pzgUmj7VLgFm1XqCVy7z7rY02amSTQXN?=
 =?us-ascii?Q?BGsZZXM6ZgxBYXNv32IJjeYM+4yiGbP/sSvdgFArhjttHTB9X9+h0Fer+bHB?=
 =?us-ascii?Q?3/8bh31Mpiqzftx6MeZakH3dngym/u56jWIXISsSKlp23SAnciuUO8aGYAG9?=
 =?us-ascii?Q?y/OkdcXnRvVg2F0zG/vwJQrEma/vwe59XwEUlFkuDGFOu0TL24ToFYqXnrvN?=
 =?us-ascii?Q?hLoU0LQye7O3QszBBvWAIHssPzdmjFfe4rgSJ4sHN/PM2QRqxUesHUTJpaFt?=
 =?us-ascii?Q?RThpknawGWz9e2TXdAoHyg27aKbyKmn4p/bGNF2EQ5Xmsx4legmAEQ95pJ9o?=
 =?us-ascii?Q?w9U0pZgwEu8rJZFsOCnCjPHwdMzWUFaPNtgyGf7dZCOQiwnR1uw4Y1Zny3BG?=
 =?us-ascii?Q?RB3pP6tnG/Pv7a7lcuJVacYTQkPwx6vGNyu/0DXaOfYvMhag7dBJUrjFiTKg?=
 =?us-ascii?Q?Mt7OokxJfRKEWopJh+pddjFNVo7QVF0XgcBF4mVKSnFHaVArxSCpxm2aXxxF?=
 =?us-ascii?Q?giXlHo5mPetWgM0krX0Cr5LxpMOlrxC7mTkLL7CPIskeUV0dtJ8RXiozCs04?=
 =?us-ascii?Q?w5+OJXHOrCzqr71Mbl4HfNh7S5lkyaeSIl5zg8fkgaVFNsljQCDu7C+7ArpJ?=
 =?us-ascii?Q?IkE1rzimDuyDO02PpyIXBMK3+HPY4ahyPY8Cjn3GS++NimvD6xGvD69bYckK?=
 =?us-ascii?Q?7pFAxaB0YKGWvTvKB4F0BX2ggm5Ldm+R9HncVlGkTUIrK3KAetCRiOfLEyzA?=
 =?us-ascii?Q?FWwNcg7ni2RuIygsLKeTC+6/kIzqab3KqBoHTbiwvpHCprmMv9vAPqWcj6Rb?=
 =?us-ascii?Q?foI84AUNUU5ak8mr4g0BW6hzDCL2sir29qJbKOIvpEpVmWITeuiOTpINSjXc?=
 =?us-ascii?Q?3g0bKY2syWV7zKIcolAvmIaz743UnspsmLYJydygnF0ckxtlJ8OdBCffW24v?=
 =?us-ascii?Q?OCxU3mpOcB/3XFQFHrZEXxI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec8a980-bafc-4f8f-cc99-08d9e7de7e7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 13:01:44.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeCCkX4udrIueCRkxC8C94jZRApI4lb/M+74+n9ppSNARd9cWoCc+HRNR6eMNZEMvu5VjNZMG3yR4qD1OoI42A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6440

On 04.02.2022 12:56, Andrew Cooper wrote:
> On 03/02/2022 15:06, Jan Beulich wrote:
>> On 03.02.2022 15:41, Andrew Cooper wrote:
>>> On 03/02/2022 14:19, Jan Beulich wrote:
>>>> On 03.02.2022 15:11, Andrew Cooper wrote:
>>>>> On 03/02/2022 13:48, Julien Grall wrote:
>>>>>> On 03/02/2022 13:38, Andrew Cooper wrote:
>>>>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>>>>> index 37f78cc4c4c9..38b390d20371 100644
>>>>>>> --- a/xen/include/xen/sched.h
>>>>>>> +++ b/xen/include/xen/sched.h
>>>>>>> @@ -736,10 +736,15 @@ void vcpu_end_shutdown_deferral(struct vcpu *=
v);
>>>>>>> =C2=A0=C2=A0 * from any processor.
>>>>>>> =C2=A0=C2=A0 */
>>>>>>> =C2=A0 void __domain_crash(struct domain *d);
>>>>>>> -#define domain_crash(d) do
>>>>>>> {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>> -=C2=A0=C2=A0=C2=A0 printk("domain_crash called from %s:%d\n", __FI=
LE__,
>>>>>>> __LINE__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>> -=C2=A0=C2=A0=C2=A0
>>>>>>> __domain_crash(d);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>> -} while (0)
>>>>>>> +#define domain_crash(d, ...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>> +=C2=A0=C2=A0=C2=A0 do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( count_args(__VA_AR=
GS__) =3D=3D 0 )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 printk("domain_crash called from %s:%d\n",=C2=A0 \
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FILE__, __LINE__);=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>>>>> I find a bit odd that here you are using a normal printk
>>>>> That's unmodified from before.=C2=A0 Only reformatted.
>>>>>
>>>>>> but...
>>>>>>
>>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 printk(XENLOG_G_ERR __VA_ARGS__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> here it is XENLOG_G_ERR. In fact, isn't it ratelimited? If so,
>>>>>> wouldn't it be better to only use XENLOG_ERR so they can always be
>>>>>> seen? (A domain shouldn't be able to abuse it).
>>>>> Perhaps.=C2=A0 I suppose it is more important information than pretty=
 much
>>>>> anything else about the guest.
>>>> Indeed, but then - is this really an error in all cases?
>>> Yes.=C2=A0 It is always a fatal event for the VM.
>> Which may or may not be Xen's fault. If the guest put itself in a bad
>> state, I don't see why we shouldn't consider such just a warning.
>=20
> Log level is the severity of the action, not who's potentially to blame
> for causing the situation.
>=20
> Furthermore, almost all callers who do emit appropriate diagnostics
> before domain_crash() already use ERR.

Well, yes, this looks to indeed be the case (albeit frequently with
gdprintk(), in which case I'm inclined to say the log level isn't
very relevant in the first place). On this basis I'm willing to give
in, despite continuing to not being fully convinced.

Jan


