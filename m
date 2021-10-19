Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B24330F0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 10:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212864.370912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mckJ9-00081X-G5; Tue, 19 Oct 2021 08:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212864.370912; Tue, 19 Oct 2021 08:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mckJ9-0007z2-C3; Tue, 19 Oct 2021 08:17:15 +0000
Received: by outflank-mailman (input) for mailman id 212864;
 Tue, 19 Oct 2021 08:17:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mckJ7-0007yw-UE
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 08:17:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6133822-30b4-11ec-8305-12813bfff9fa;
 Tue, 19 Oct 2021 08:17:13 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-zLLeUXrAPuSOfNmxVkJ8RA-1; Tue, 19 Oct 2021 10:17:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 08:17:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 08:17:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 08:17:08 +0000
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
X-Inumbo-ID: f6133822-30b4-11ec-8305-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634631432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1S/1I6DQrepmMJMZXs0L36Qo4Gpek8KEUHClCiTiwBg=;
	b=S8m+0xl/j9ry5PUbcWANIFCF7+xJvTud3yz5GuyprHa/S2CryoiLEM5g0HryhYNWaklYMR
	rClkMQEblMc5qoBXv6D74Ysam5F8cukP/OSZsa84xB1K6RWWg/4T7l2+e/J+TBzuaiOK5s
	8VBDCd5m9DlvZSVKFWoFM5N5aV1pJO8=
X-MC-Unique: zLLeUXrAPuSOfNmxVkJ8RA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P15S3Zs8MNLeA2/lv7bfrvkFobMPQ5GNhBrpKDxXLv9WoYRpF1QDp8osnY5DZUe6p1fWNeCUriSPGrRetmdhKpQgd3Kw/u3C0GwECIbXWp16aaYfRaX6I5dm8fsrvIV3HtOXli6D13JaWUBm7Ns0IQX3vsSKCiDEhJKTKE974CON+3aem2qhqXcfUuKa1cYSINcNUGuy6tBxVatepmfJpTmFbIwJg4HyD1IjDRiMU78DHHOqkHoDUmlv6r4xAnVumjLpzD/7HlyBCyb2w7fYl9PaKgfVFGN3LjAtj7C+hp/QhJI48XfJvqy5EdJWmVUp2GsKv3LL7W2Hq67fGRklFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvibTTjJ/Ho86MIUJF0vJCTQshy/ICg8hJvurCqVAgY=;
 b=Y75UtwEL0MTcTbLs6iZgTH2iwa2JEMhlY59lnlARuj3PZPB4MZ76EFREvKvDRuWDIl/AuPo+xXWLIR/MadDq7dRqD0vUg8RCfIAxI35kuvEzpQBYUM80JUUKCZWJMDH6Bbrdk0ZvK79luF4SyIFblKaSqmASSYy/msb/AJTKMFF2IC5hL7JPIYLSbVtVd4cjBeme9YXd/gL68veT66Ay4HHLS8tkWnc3DbIPb1kb3jX74tZghNCJ/gO/9msywwJg7EdRFt2EY7vzCbsd5729WSfBW2OBosi0e+ZP/GIINTjLYLJhQJDpcFuE2Y+qMVq8DunOgpJ5X61CC56HuRmNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
 <YW59OUi9tpnGccl7@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc543483-bc67-1323-6db1-b335bbdc4238@suse.com>
Date: Tue, 19 Oct 2021 10:17:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW59OUi9tpnGccl7@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0076.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a23284-e201-49a1-0202-08d992d8d843
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6173DD5C26010B64F76EFA41B3BD9@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67qJtLB0gv47wUNKWrV0/ufEf8Ozc2djdv8uv6FGZBWqGWJXMeK5SJsexDw6J90XkH1e5wS9usVIJ3OnINC/DOxUdI3dXHt3lXSVMj2fXip5jUlW5uH3qM7L05U6hFIsSZE/vF1fOgJpb7KCRKbdYbztK/gCdxtoy9HvkZk4DkL8Gl0vRnYfTN4u22qx2AVJSQNJNcPdDtIaqOVqefEojO2cQUL7SnsELAhLXWR7DFGIqlmZg99un7qfNLk73KyLcGNQAo2mCgw0Mh5NqmqeaLoqziFed9JEH7sjhAvY5OxemVj/zelJKqlnPvhDZIuxAvp1kfSf4usWYHJolPo3tKTtehrdrUwMKnnbsA0kR5bvY/5KsACtERME8LH0vdGurznuXBQE7msnaEKxQJdHzNtKDmzWVMEYzaCO7PrjxeSqtKfktXN867KNOX7hotnQYMXj17UwmDTIFJ96vFvmJ/g0SDpcC3dPMW/EfbDwDjgi0wEADv3+hHIQwPG+uw4kOdX3nqHeCXXzFDB60RDmIkLMdM17rgjPfYozOzrfvzDQ0iy3AGo/ISjoICCFh9iA9JXnMnDLCC5ucpq0Wbl1MdoCUb3c6N1Xbn5WpGw7bm8aQS1NT+74IMSUbIn46Q2+HXrrVk7yJ5N8gRutbIeLDR7rTefE3bJnr8C0H/UZs2dB4O9oRppd0urc+PsfJExWrR/qOZHe0inEyjtuDlvmpYJxhgYbYvlOgOkccFyDJw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(66946007)(508600001)(38100700002)(31696002)(86362001)(53546011)(36756003)(4744005)(6916009)(8936002)(31686004)(2616005)(4326008)(16576012)(54906003)(316002)(6486002)(956004)(2906002)(26005)(5660300002)(83380400001)(8676002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6USEdPWf9MmGOlzMFu8/nL+Qx+f5ppKk2VgLRek3tEvj6dtqKRk029dvGeAY?=
 =?us-ascii?Q?lGEHqTFfiNhlLUcJ4dWY9xQAPt6/yQFzphinz8oiQaqAPEQ1rdtptEHsW88g?=
 =?us-ascii?Q?Hr0TYuPWpLNQifMP7MuXv4wFPd7RMOVnbldGXLS3uYOBa+otLO1vSw3emGDu?=
 =?us-ascii?Q?s55FgUBB0YOCOB6taN2dDNc/j46WWUYuRKn1ANKH41E86rHzKM9hlEQU9pYA?=
 =?us-ascii?Q?ke7ZG1+wgDxPKW6J6lRRatQqYZ2a/ehR8KOVm+u3cUy5Z8rQsZsMotHDluAH?=
 =?us-ascii?Q?nHSFkA2kQzQJrkVFJJNbvzH/dVmX8YoJvWMgfQGdH0GvFWQmh4J0dhThpBFw?=
 =?us-ascii?Q?VGiO5AOF20op1hTGjxAqs7RJNil9d/DuiG7skOt0wCyZZfkoS7SeJI4KhuG8?=
 =?us-ascii?Q?zh09VWDG49r6wwyvgDlb4WvFA8hNM6vdQUGXJtEqtLr/R4v81nweM1KiJWX6?=
 =?us-ascii?Q?4tspYGDZK8qLpHdbK6O90aLIlbOwnr/LJkBTvpO3iZdhHnRAOucpy8nCGXGa?=
 =?us-ascii?Q?TYicqHmea5Wm8Nno1/V9uF4C2eoJyN1bFeCawe1D+yTdPzR2Yg6rSu+eptE4?=
 =?us-ascii?Q?IEr5+L4fogLjo8ayTdGTd+s7mvMd4h1cjRTQ9iz70+asUmfRDXXI1hND9bmz?=
 =?us-ascii?Q?1WmsuC75numdf1h3NbnxLLj+IU40bx8nJv2mLUzMUnzkTJ6XhmJBB28+y/jx?=
 =?us-ascii?Q?cO6N2uRBpQPOjjKf/+3hLwhn/ZFkKCS8W+ULDYGSS3HG9PLoPrrmSy7L4eHg?=
 =?us-ascii?Q?uhNKEUvUSfVOehbqISMZ00izwGfRb6/2S2p602eEazE1vVBW3iugiZrPzz5R?=
 =?us-ascii?Q?4EEamvDSnNPKiOfyPg/D825Srlh2VBSjuksodjimlGkUGkl2NiC8OUmocMsn?=
 =?us-ascii?Q?WvwgY2JwWR7nm+vHkk5CFMoLAS9I/v0epoEcdcAQlms1FBEEUr4UJZTLilpZ?=
 =?us-ascii?Q?Buvh08f/XZ7HoIlnACfNYDadn8lOQ0YSlIF9XhlEFBxHzpe37JUGujbCS9np?=
 =?us-ascii?Q?676oAF9zYLsiT3ahuaVlzBWjfDQ8Jw3Ah6TNME8FLLTS4Oscw/oRE2cXLjhG?=
 =?us-ascii?Q?br2VE6NnA++J8Fz8p7Vtoip2RpiejMziIq1pc2y5J5kNplN7/0Weye0nAYrv?=
 =?us-ascii?Q?CaVZNsmgu8UPY1JTRiaor4B6SrPsomck7WgWFeKNOgMUycorgWXNL530l2zJ?=
 =?us-ascii?Q?5RfRCXuPbqOca0l0uGQq/XOMXSR6kr89mtRb+c+siLDmvTTwrHAO03QOVV97?=
 =?us-ascii?Q?JZlKVjn3VJ+0nBLMkBtH9fat/opAd/l92+9L2LOR0NErT3KTBJSm0OtyJULX?=
 =?us-ascii?Q?2IXLkho5KXF1Pqc0knkssaOc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a23284-e201-49a1-0202-08d992d8d843
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 08:17:08.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crQYIZc9yU9KA6xi3oED99HV71T2KPWJkfpskta3zrlqd8qShiL3o+XLhobR9NsJtfELGuLYvhiQlYwPdTkLew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 19.10.2021 10:09, Roger Pau Monn=C3=A9 wrote:
> On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
>> @@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
>>          __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
>>      }
>> =20
>> -    pod_unlock(p2m);
>> +    pod_unlock_and_flush(p2m);
>>      return true;
>> +
>>  out_of_memory:
>>      pod_unlock(p2m);
>=20
> Don't you need to set defer_nested_flush =3D false in the out_of_memory
> label? (as you don't call pod_unlock_and_flush that would do it)

Yes of course - thanks for spotting. I had pod_unlock_and_flush() here
too initially, and when switching back I forgot to convert rather than
just delete that.

Jan


