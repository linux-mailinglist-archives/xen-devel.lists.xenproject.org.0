Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC05186DC
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 16:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319697.540029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltel-0002vF-Mb; Tue, 03 May 2022 14:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319697.540029; Tue, 03 May 2022 14:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nltel-0002sf-Ir; Tue, 03 May 2022 14:37:39 +0000
Received: by outflank-mailman (input) for mailman id 319697;
 Tue, 03 May 2022 14:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nltej-0002sG-No
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 14:37:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 928a69fa-caee-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 16:37:35 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-eZhpcM0XMUmZIcOaVOF52Q-1; Tue, 03 May 2022 16:37:33 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5377.eurprd04.prod.outlook.com (2603:10a6:208:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Tue, 3 May
 2022 14:37:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:37:32 +0000
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
X-Inumbo-ID: 928a69fa-caee-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651588655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJasbgl5K181eMpWCwlaUaFuJJ11AypZXM97LiZ3c4I=;
	b=TGHmXtymsUS77XTqEz/AdTeii+P52FsRSSkwCXsCSRNdPbvcNtBoNWbznY370vz1DwloPM
	ekuvtDKZHsFdTR/XFc2vZcQIjv5ysZCV06LTFjfn5RRHpnDQkBsmpEdzr1qsABmB6kFCJZ
	xUumyEZu6UVLgv5k2MeUYrsV2mbTLic=
X-MC-Unique: eZhpcM0XMUmZIcOaVOF52Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+lG2EtKWRw33VME8fdCG1tsjBL4NHdNWk2vzJlQmwGNB4lA8Ci1MfuRuf/x4DoL7yg+5JQGoS3As2CZUKxgt8VFDkI1cF9r7SQxwMJzZNFMsRSVS5ha/SipulVab5Fpbq43JrzwhIM6pPacwUSbqgrr6KtzwjGA+3N45C44eO3c+q9KNXmUWxHYjmB93Y7REJPtjTYTvtP44AAGMqD8IATqc2RcAG5LwOE8B4iglti57zVelsekoTQ/+uaqYZQn3lHUdRJyoewO4D6wUwKtc/ZS+8ZzcB8TC2ZQaJ7/PtFXhDPu8WGK3A/bkHEPv8+KgS1WVz8gNtEBTQUI58FylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiM3v9ehxjalEdyydAEZPE86Myb11PHYx6eUAjSqLm4=;
 b=OJ/9+U9mR71xAhnYCbp39sSm+kQ8C2cy47sxaiyM0Csjm71g7Ca512FAL7nlURmkMv6TlVeAOSR9gueaSh3sBa+W1GnyEEs2DUXF8RP89td9HVXQl4lKOCNfz0TM6EijuUd6moAaAgUOhTjGoWj3kWprZauzGc39E0f4qZKiiwbKMdffo9otZ3MdmxQ4z3NE1r2LPX6YIUfTGDaENLxMAlTZYSkL3MOwZeOBoLnC0YUjHo9nKUzWF441RzuFIyHmc8BNNZlpZDa9rNE3GIxbqVXd3mJII7RAXryA8S7dvdyne34wVYZo70G8LyJv0ZDxMj7JAFHdCFkRnzgopcTkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35e5935b-7082-8224-7ad1-84ed12116426@suse.com>
Date: Tue, 3 May 2022 16:37:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 02/21] IOMMU: simplify unmap-on-error in iommu_map()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
 <YnEDAG5HcQc8SOAt@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnEDAG5HcQc8SOAt@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0036.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::49) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4f5a8f2-1e1b-4f7f-bae0-08da2d1274f1
X-MS-TrafficTypeDiagnostic: AM0PR04MB5377:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5377DCEADB5682EF0408DE0AB3C09@AM0PR04MB5377.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sP5DCZUAzXZ0QKHd3+PKHCaCvMPCIrPIf3NlQfWn3tgIg7ZljqcxRryt5iJI4D/8Hh9yzjzdwB/rAgdxRzyUFtgtePxatm4NX8HJlXVgNEmcDrwH9XrqFqRNyx0NhQ0fxrpu8B+6AABlg7lhnqttvVT8GQ0ryfyRj6uVFeZbvBjBNOhMh5Pso9U23J6FDJanWPnOYnV+HKlTkso5YrZnUPtlI9C9Y5nXMyU0Op91VwponEGfwFX+jgwFnjiD9tRaMhLs9n9S6muZs7Lky2KQIWL9hS5xhfQXxwbmZpoNutNGb5vwpZ7xOHQRNBG5IUz//9cR0WGKUNW65hw72bRVqBblZGlyonbY7Qg46E7jToMMYnRXGkvRlkbtd9Wqy/3Cp0h6GbMeVyphW/7IlfgoavGwinB+MnaBjIjgoUYfjndn3ZP+WV+F/qJI/RI7L6ZnvKMDVO2Hn3fbJ6wAj2w+iQh+L0pSSATSY/YIXuKF16ZD0RpVk3aThjsgfq33ChFstnwhPk6tePJhqBulMRbC1cKVxyA1Zu2+GVmYZaAw8o7wFf0ukJoOThps8CLecHRTN5LV9GY1/TJMIoxydr6HEfXAYicewZypWhNde4Isq0+yw/xVas5H/+P2tLd/Q6OsYU04iyXc1I3zpwLhQVKf0J3KycXxVLjOTXQkWviv9ieKzufhjZ0fnvVF6oYA+7lHdiJCdSjkmhHgtvz+vLLLbatNdYQe6R+gPYeXponNGLh94okaX0gyum2oQML5NPSp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(508600001)(66556008)(66946007)(8676002)(31696002)(86362001)(66476007)(4326008)(38100700002)(6916009)(36756003)(6666004)(316002)(5660300002)(186003)(54906003)(31686004)(53546011)(26005)(6506007)(6512007)(2616005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HqeFZyP0a0OhPJj7M0dRwWOmpY6wYj/x6zTPN/FKZ1wUZDKszeEjVE4cY3P1?=
 =?us-ascii?Q?7LfI7plsjjXKCRP6T3Ljfam4NdU58a9Uf35Kukkx9AHTK2z+6YuH2YmvTyvc?=
 =?us-ascii?Q?WqrRV2QhrVCQ3RKM8f1AZcvlg37HxSHd+bPrDcDVwXAhuAvWDEJmfHygnmEP?=
 =?us-ascii?Q?xXFyi3+v5vBp/4JSQttdW/mdBPWGqWtWkIz0kZ9A6fcRYnMMGN3cEAwBm+9v?=
 =?us-ascii?Q?2UO+3X6wWZXT1wPV1+0N3gasRw6wxPuoH7U8A6YwA/GS54lOgeO0XJmWxFsx?=
 =?us-ascii?Q?9KbKu4ZjtJbmiYfObSHwD3qvPcQQpS1taK0uqV8PbqK+CilAXPYzQgK7zsaO?=
 =?us-ascii?Q?T5e2I7atv72EtXlaRLPWLrmLG4mpooj8D8CpQUEGeh40wcm/DoZfRNK8z6KY?=
 =?us-ascii?Q?TLdKvEeugHybCY5aHsJ58flTNl/CJLvEURn4nAPV06oewHyQ8Znh4x7pDIUn?=
 =?us-ascii?Q?30LVr0bAKAs/YUeIDhw4kXDn+OqcS6vL/hVCvfpZ6Yw149603p39szDNMQXV?=
 =?us-ascii?Q?lyTWYyzXC4gTKGW/Z5pjsdrKHdFnZK8ZhQefUG93/HKemag5nm0KlhSZuGo2?=
 =?us-ascii?Q?yLBAxQb1bLyyqyE9lkmUvwP08ozQnax5eec96KBqL5Cwx8dduWZVQIwMu61r?=
 =?us-ascii?Q?EhAWhVBT1/wkasHUNCkJGBYFYb7xqJqDjfKgklTVNhqvYXXs/d4YK6r0B1Nh?=
 =?us-ascii?Q?+0wcKYp20wZN1M7vZfNqcK3MWJOgXlhKGf5HBAk3uzdSJ+Oq8AQ7fQFDC10S?=
 =?us-ascii?Q?92PfV3WTTcdC9tDPjXr2FRCOR1Sjw/CRkp1MWAkhFYlqfzMkiES2MDOWuIXI?=
 =?us-ascii?Q?hpzBzR4ntLQuqao3BXq2rap8WFZj/3nObBpN9zjoN3XB7SxzdcGE+UtHupNI?=
 =?us-ascii?Q?WZW2JIufz1EH0ZCEjUEo+doREyJKCr0BvGi1lJRgrHI4a2vRBPC1mLTCvycw?=
 =?us-ascii?Q?y6jET8/9fdKIzCgTeAnz8DAbPFwPVfu0RXdu9qpqYmZopM2P8tOjTbRg86uY?=
 =?us-ascii?Q?Dkfq2I5WGUB2LtAa59Pn4BQj3fWqmkJnozAPvH8pfa55reL6DJ4Zm5UKDxP5?=
 =?us-ascii?Q?MIP8lzP+9Te0JHLEitJZAayWxpLfcK1mV7ipyi2e6A18yzaMHdSBuc5Ua7VC?=
 =?us-ascii?Q?riwbSDP/Phza2Ac2IPIeu4kJ+rarNVC2GsYq6DYmRefpJiu91xFhjaPbRmf/?=
 =?us-ascii?Q?GljYXZXAzbaMGLNE2ddClPlgrE48C3Zd4zCRx/9BNGIbeEYUTIbsExda9TOg?=
 =?us-ascii?Q?O/pdw7o1HGYDb2IqgzCa8+ZqiXNfWWY87IMEsvFsxv0ou5HlqrufxLCtZm5o?=
 =?us-ascii?Q?/8og/t+VHyh+4I285pBXsrqYQE4apFfVOj43rSSZvHMJ2RcU9lRTmm/9Zsai?=
 =?us-ascii?Q?M4C8LS9G10E71eMjf0EQsxe9iB3O8XH/3Mhd4bjpTlNEWty1WU4kl42BOq/m?=
 =?us-ascii?Q?9bnu6Ot9RM/w0do9cDxOJQbyT1sbLLpRmKqwLGF+BjG5TzNx+s6iq7eAp7Cu?=
 =?us-ascii?Q?jYt+IZQftiBfZhW17KuLIpyv9wy+teeiSoeqdO21Q+G87JBaO4WL2JbQFOSp?=
 =?us-ascii?Q?RiqgpfkpZE49OKBIJsw4JfQMrHxr1LjkaEE7ff3q27NKzLE4Esz+Oa6JwPvP?=
 =?us-ascii?Q?b/RVFHW7kAW3wZMUHxX1yFYZI4I4Lfry8PG+YkkT2YioHduGQNJED3IlThfQ?=
 =?us-ascii?Q?e8lddlj36QA4h6ODQ6HChEbC9y5cLysFKt535Af2P+3drvK4CcMzYLPRnx26?=
 =?us-ascii?Q?MKQBrdQCdQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f5a8f2-1e1b-4f7f-bae0-08da2d1274f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:37:32.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLU+o3ffgOr72sbu9SuKDl1vdm5Qu4WThGhPCPohtO+EVTpjyCxhKLh3/rzuUKnNhBlYDGAqukP2mnt/n0lFsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5377

On 03.05.2022 12:25, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:32:10AM +0200, Jan Beulich wrote:
>> As of 68a8aa5d7264 ("iommu: make map and unmap take a page count,
>> similar to flush") there's no need anymore to have a loop here.
>>
>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> I wonder whether we should have a macro to ignore returns from
> __must_check attributed functions.  Ie:
>=20
> #define IGNORE_RETURN(exp) while ( exp ) break;
>=20
> As to avoid confusion (and having to reason) whether the usage of
> while is correct.  I always find it confusing to assert such loop
> expressions are correct.

I've been considering some form of wrapper macro (not specifically
the one you suggest), but I'm of two minds: On one hand I agree it
would help readers, but otoh I fear it may make it more attractive
to actually override the __must_check (which really ought to be an
exception).

Jan


