Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EC249B772
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:19:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260478.450016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNb4-0000ou-ND; Tue, 25 Jan 2022 15:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260478.450016; Tue, 25 Jan 2022 15:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNb4-0000lz-JO; Tue, 25 Jan 2022 15:19:02 +0000
Received: by outflank-mailman (input) for mailman id 260478;
 Tue, 25 Jan 2022 15:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCNb4-0000lt-2u
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:19:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0757769e-7df2-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 16:18:20 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-Dez6IixRNJCRSdisacGW1g-1; Tue, 25 Jan 2022 16:18:59 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by DB8PR04MB7113.eurprd04.prod.outlook.com (2603:10a6:10:12a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 15:18:56 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 15:18:56 +0000
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
X-Inumbo-ID: 0757769e-7df2-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643123940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1o2eQTz1HX52MBovzTipwlFKEihtoLigz8s3rI6u62Q=;
	b=fQIhYufPWRcrAv4Ybmf8x4T+XPTvah9On9nMmz5gH//4c42UI1cys2PTISC7J53wqmRUPY
	VCsOZXRuF470VkRMvyHHLnCl/AEr06gRraYwKa0zDC37VfF+9tXjRa6wDbNJedGkEpAdDz
	PwobVp7VEL/zHLQV6EWP6PQF9beCa50=
X-MC-Unique: Dez6IixRNJCRSdisacGW1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahmc6QyEEcHR4sNC8Z2mILJ3fTgLDjxUyEbcudL1tSy1+2DneXli8XQJLc0ZOIjARbbegkmlQsznAcbrDWB6Qh/UWs6VZrgXnKXvjwkYJFwgCFxcbZoZp9kV49Mr527Y8Fi8WC/Wy8U+iqod2C4h6tAAF7FhaCVWm6G5F1/QBc2fpsEDBYoh6in3z7j8LUf4ffE4ZuGrI6SdurS/QuDkfdIgnyJW4GnkBipNGgOoOoPXjzAxZ4EhP+/oipzL7ogX9TetgRNGU8fIywKTtqjJkm6JQXCaKLTbwN9MJirJqV3tgRcFGTE1SQGJ98pWL2jMNBFCoe/8+0ByIQqc6tNqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XhgzduY13boTbMtLpSWIYSwbrlIyQh6KYBTB+9CXds=;
 b=EQaCUUz+IFqOVo8LsmqP2tiaJXk4R6BTkqa0D7qLfKcfsVTlZUtYBOplzKRaVuE5xyPxH/G6iTo+YS3ZqKA7YHn1PRKMKZ50CGWTojcRu3L9/lSyWN3oQRoKpk6X/hBnAWNv6envr1jyvvtz/izReDlL7R7ewbS2rczBKCR56E8KZzMo1qmPDjQIpxaHJIDgq6QWsNb5glN/2Vs/jfvJZJuhVYDQOo1jj0G+HeC+0zY2aMrDDdx5xEHJp+67mWIyIblgkaJXB/cFs4Eu35WVxtH40yOpl7dvTXAltIhUln8/UKK3npnbJpQvAPtVFMXrhRmehZUEb+xN19Bhj6qqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e349244-ae2d-6e02-dd77-8a67bdd659a9@suse.com>
Date: Tue, 25 Jan 2022 16:18:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86emul: recognize CLDEMOTE
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
 <2e949d41-00f8-5344-3989-7b0ca45ad6e0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e949d41-00f8-5344-3989-7b0ca45ad6e0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48e59ac1-8b7b-464e-b0d5-08d9e01600e5
X-MS-TrafficTypeDiagnostic: DB8PR04MB7113:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB711396DF459709A65199B88AB35F9@DB8PR04MB7113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eAvsD3IweW23wzF2KQuizplU6TfA3dE44Vjc+ApKKAySxMa7Niv8n4cpjBGd3GWdoerBtjmXuzyPw7P3+rSWZPrdbFHCkr7vEJB+HK+eB4lSo9lx9NkA1tM/6jcEEjDIGZ/6peAKb2eCQEr5bOueF0I2ZXMOog/py0EiCzK3trgpWuSDyh0e1TIJMJPvMkuZ0ZLK0Q/nby3FTtDGnUngAFj9HCdjRkSrUnYcJ/5+tJeko6sBiKRvk1M/TmUTs0O4y+qk1oYvpUhOulDHwBN219FVZwvqmABTBhxZhqUrw9lkdhGTjhHceIH3dOkn7K3KJAgyvBM35X2tzhzg90h85sWQMAYUXGHr/yM+OgmKRuKH5CXcgG9aG9EzwnV+gkzrN+8nhAtOLfjfcM+tICdigxnBPVQ02CCJ3aSFbYdJyaaPi1tfhiGf70V/UCT4oZMym7iFLoKBfyE+itrmBVh3HmbvUSUPSN44+iNVpN70pN8uezTBN7i0pRtJv/LreYL0TLFm8bF3PrvfRb0+7qeDI8tq+fTts8xH6UmEHNlMLWSp9k3qKN2bbVhs6CfnHCvAu0+kiq3uGXFc7K6JtkTRIbCHadumpJ8tck8PyL3ESOwn11tOFDwuDKKPnCEPs9bZUeeENjOL40B2L9EuBf3FQeQKe3qw17ecHTYNuhoCfkRspqW4CCW5StdcmvNyc22+Y4CG8fM1lAXlNcAchJwrWD6vMRGXISH5y1QyPBsl6xIvocx8hYh+kLsizL6arpmq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(38100700002)(66946007)(26005)(66476007)(8676002)(66556008)(2906002)(5660300002)(36756003)(31686004)(8936002)(4326008)(508600001)(31696002)(54906003)(316002)(86362001)(6506007)(6512007)(6916009)(53546011)(83380400001)(6486002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4cYUZLrhqERFQul0/jvePVdkf5LdGgInw8HDF1zwtJZi+LR0KOryxdDtvJLt?=
 =?us-ascii?Q?kwQqUn+Sp51zB0oeDA+IHegPYEMTHTm5QsRWoYS7zCedkdXAMiNsVgshaF5M?=
 =?us-ascii?Q?lcGxhk1bEQhDL28/rq4H+E+Wue3p5IL75umBRn7ufzKn0mDshQAMFFrDNj50?=
 =?us-ascii?Q?fd7X4M1pLXdl31vhCZYQRwJONJKG8yzXJmHFsqqv1X4MjnMvpkVxP2eGDRFd?=
 =?us-ascii?Q?GM3kJAKfIXKE6tyblTvR0zEA7GlaF7YaCOXwaK7vhERLjRszm6GR1RQ3rFIC?=
 =?us-ascii?Q?9iqgPstMRZxRLZqs1mxoOa7FESf5RV7qPzdzICWeCEpKvj265xjJr61fCdmC?=
 =?us-ascii?Q?vS+H+Ee4eh5+zyQ4Akm6KoXUJCk9bmi9gtyYNk2lOFNQtwDpBuA126oP68/7?=
 =?us-ascii?Q?h3EYsegNl2Gtu3NDOGZPTKuN1U9BTNupId5kL4+o1hKVz5Lay42WHx1+MAm4?=
 =?us-ascii?Q?bEmEJZT5ekvt1n9rsUrPWa4P5sMIcRpbZ5gi/lfHZrY4Kuxe+oPigeG58zvv?=
 =?us-ascii?Q?5NitRES5NsHTfOghMB4+/e6ITt+Jw8sAbsbgzJD+OpzmLANK4fdqhzck3Wgq?=
 =?us-ascii?Q?HUCy4e2FKhvrQWbIUGLQDpbpZNh+s1GK+VTLTayd/i4Zk4w/PDmLzA+c21Yo?=
 =?us-ascii?Q?1XQxv15LFVf0XUFGN35TxOxmeJ2MuYbxPSJpZBL+bVYS2CbH6m2odx4eZHno?=
 =?us-ascii?Q?Ix97T7Sb/flz6GZ5JXmzY8s6bSu9wq8udAzyFak8cIob65r/d0TWGIsy8ZIO?=
 =?us-ascii?Q?gEMJkRmr+TU90exs+jslmhx6+1toVMhByDI3a8sXIWtSYLVMYqILPnTBEOfZ?=
 =?us-ascii?Q?Dut79MxQi3A26GOnytoi0YMGkcY0TmsSYAQTFbwpEBuod6r4DJF9wqdmHv9/?=
 =?us-ascii?Q?Ss22Yy2byCqsVxWhwJ1VksgmHhcg4nWMG5IW85wdl0qUmaKKvY1CJLVRrh60?=
 =?us-ascii?Q?0JkbNNmLIT166SKEvL1NQ7NCrKcZnm4Vb6oqqciR3HTZtNaLrabnHG2/wsfW?=
 =?us-ascii?Q?U+Yhshl7o53nvJqXLz2XUs/IhECv0DGiFrpnjM5a8AEcmsc/WNN/TS+/KUf2?=
 =?us-ascii?Q?r7rqJZuEHHbO1o5qmYdVRZHKxuCi9BFqNlbJUPFXagECC9Z4t38bFxUdZVWO?=
 =?us-ascii?Q?vW05Z6BlGnfdXRCr23lGk1SVHxWVkgjqHF6pMNzzbN2afLJX0JCk4R1zUpxP?=
 =?us-ascii?Q?GjTCXF3TkV1yB0vO+1RdMTOSLhOwPk2ueXwT9xYzIjmE8PQ9q4u/dR8tLKY7?=
 =?us-ascii?Q?umKBQuT6C1BH7989BdQkOrlPgb9lXzrzkQmJQK092Y32kbUSVa0CVtK6S/DG?=
 =?us-ascii?Q?uDI4a4qZqomGrA+TqaaGCtDSOGOWOBYyAzVZ4mXGppsOAM3RsjyEeuV4LMt7?=
 =?us-ascii?Q?22aSp6ymlO3SW2bDKk88zZFfuhcxrfiX/ldCse8+IL4NI55Et/pXQ8RjDoqh?=
 =?us-ascii?Q?Zjqd0PFIqLsgy8KZFFInMJQhUb0THSvT9T9YmM2ZK3E3TAl0EqBa9FR2oxFn?=
 =?us-ascii?Q?jaMKweDyNdmfyJivHrFEdBGOjeSHU8xh5Y5KiVt1F964Ipg9yvp2+NqJJc7e?=
 =?us-ascii?Q?ZADtJISrVTUXUIWwI8SwNLFaMHajiceHSG75hYbq+lqJopeqMQysqIzu4cs6?=
 =?us-ascii?Q?jQl1dISv4/cpuget5fvkvMk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e59ac1-8b7b-464e-b0d5-08d9e01600e5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 15:18:55.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZO2STIuES8t8mBzWZ9i8VtRAHh3IH1XpIihz/O81tglqbMm1i9gsjp39kYVEVnZIvTo/PJh31uTm9vCfngj6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7113

On 25.01.2022 16:09, Andrew Cooper wrote:
> On 25/01/2022 14:22, Jan Beulich wrote:
>> We claim to support the insn, but so far the emulator has been handling
>> it as a NOP.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Treating CLDEMOTE as a NOP is going to be more efficient than actually
> setting up the mapping to execute a real CLDEMOTE instruction on the
> line in question.=C2=A0 CLDEMOTE is very specifically an optimisation for
> software producer/consumer pairs.

Some similar argument could likely be made for treating CLFLUSH etc as
just a NOP then?

> If we want to take this patch, it should Fix[es]: ad3abc47dd23c which
> made the claim that CLDEMOTE needed no further additions.

Added.

> The only issue on whether we can treat it as a NOP completely is whether
> we believe the exception list.=C2=A0 I'm not sure I believe the absence o=
f
> AGU faults,

I also was puzzled by this, but I have no way to verify one way or the
other. Hence the implementation follows what the SDM says.

> but the instruction is taken from hint-nop space so
> guaranteed to behave similarly to clflush/clwb.

I'm confused: CLFLUSH / CLWB specifically do not live in NOP space:
The former are under 0FAE, while NOP space is 0F18 ... 0F1F (with
CLDEMOTE being 0F1C).

Jan


