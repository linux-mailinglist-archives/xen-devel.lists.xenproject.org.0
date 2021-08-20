Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A83F26D8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 08:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169237.309155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGy5h-0003t0-BI; Fri, 20 Aug 2021 06:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169237.309155; Fri, 20 Aug 2021 06:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGy5h-0003qW-7P; Fri, 20 Aug 2021 06:33:21 +0000
Received: by outflank-mailman (input) for mailman id 169237;
 Fri, 20 Aug 2021 06:33:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGy5f-0003qQ-VZ
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 06:33:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80f01b36-0180-11ec-a68a-12813bfff9fa;
 Fri, 20 Aug 2021 06:33:18 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-fgxG84y3NkScC66DgYVReA-1; Fri, 20 Aug 2021 08:33:15 +0200
Received: from DB8PR04MB5594.eurprd04.prod.outlook.com (2603:10a6:10:a3::31)
 by DB3PR0402MB3740.eurprd04.prod.outlook.com (2603:10a6:8:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 06:33:14 +0000
Received: from DB8PR04MB5594.eurprd04.prod.outlook.com
 ([fe80::2c99:6a5b:2940:533b]) by DB8PR04MB5594.eurprd04.prod.outlook.com
 ([fe80::2c99:6a5b:2940:533b%4]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 06:33:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:208:122::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 06:33:13 +0000
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
X-Inumbo-ID: 80f01b36-0180-11ec-a68a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629441197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCZUzILnwxmlBtHEfZDGJFliHzXJCBFb4gswGMZUe8w=;
	b=SCW/c3nwNpnClkOMHmmpDQ1CEFRBJLViWSFfvrj94SDSyPCyqq2P3O3ZcyJTrLnzhwSW6V
	R3y+45UIDFFIqA5GYRwMV0zrqbQEfjBY1IRPQdH80nQgzxBFFAi4Jgms2bakfZUdZywl1E
	9Y6rEWvbJkTTdKicfQqij038VcHIAek=
X-MC-Unique: fgxG84y3NkScC66DgYVReA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHgicaQsyCPG3UG9bMwBs+QcIuZRA2hHoM+nkFa14r2pEoGwZ22qKy1Hv+mQOSZjNrgGnYFSwjiQWBFmiBkBmErSGRnN9+AMZQIukXhtH8dqth+04A8WxGkIDk7oI3Z+SiAEJvCw1liVoGUyWmOwiVbCx6LtUIolG20RTU7Qa6chjxClKKrCc4PYSZJrCU3kkDq5tf+lNmfvFJIzeHpy6Jh0M/uI/WGlKF3oBj3T6TveREsXXDWMxCyKXN5jEChcTJg7JWWn2AxS/XP/PwaGr+Z4Ja+XcrBuBwbTyM6/m9l6DkKphkPpdvd7kmbMBTxZ83+JSz95/ph79qqv99Lv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nooyd7LXo5tY2ItS9dsXLyQic6u4AooK1E9A42S0jY=;
 b=LQc5VB6sEDnZS1gE5AZVnjbfsuL3Ah5BPZ71r0ftmZs4WpOpQxTnT8jhPWeahaSLGAo7dq188bILjugkPOFPlyfu/bELekV43D8Ow7e23Wvy3bx/5HptsyRNmFPKFrzSviT61DWRuQ8Xe4g4w46gtAj16vogRMwQzG2Pu9mcsivdUANzWvK/KkqpGsXOii9aFQBq5flAVatQCO0UlsbBeGSIgIUQMSkH6ri4lV2cPk/+EzwQ0aYTqoad6870nQ+ttKmN3szm7TSt89B5udH7vE7q9507L4lWOqGbl+9+9OOtaVIhw9tzk79frzi0gueH+LyWnFL9SxiAT0nCqE6nDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 1/2] ns16550: specify uart param for
 ns_{read,write}_reg as const
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210819190625.476165-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69c39e53-353e-b5d8-09d8-e727f37b96bd@suse.com>
Date: Fri, 20 Aug 2021 08:33:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210819190625.476165-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:208:122::39) To DB8PR04MB5594.eurprd04.prod.outlook.com
 (2603:10a6:10:a3::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a53eb9a-bed6-4dc0-1424-08d963a46371
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3740:
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB37403703AFF0AEF7B9AAF020B3C19@DB3PR0402MB3740.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKZakUHJ6fg5KTn4EwVCP3iz2bfRcMdWhF4Dte7qRCsc6ntuv46piLPk6iy3aAB+lH2ZaaYTV1d1/4nvWFbSzkPH+OfxKuMUjNG+UmJFX18MKkKalZ9EoH7Bju4qL/CAmS2JIE7upBFFNBDy8X2xHAUeQ0qEU5sLrSMbmUFkp+p0+R9Q0csHnBD8/eEi9EqMabqFsTpd+JhvYJk+jfWsblHDImPQB77E6xLk8AiF6xvY13wo2EpU8CN5nkBczEd7SSx7LSnmhivARmNhBEBfunqnxFtWvXCdzjjvhVtWn9cwfbcrlwhE6cjYh3nvq/1QWqmqxkfmeQDzXCQNepnNo/kws36VSxj/Q7di1KwsnNEey7/poaxbqcdSr9dXKqf4HoaQQKoiPak5Ryu7tM7Lnxtj8IGFPRcbPHNaIwXD4R1fzt+OIzxQmF3MWMEuQg4nw/utWXLtSShOnPgsjhqx+djQvtOHIL/OS+253a/xhIDhKO4s1AfaYkkDHqK7//qxTkMJi6GJeeqkcpwDzpFIUtCfZy6T3aAn662bR6wZsyaG+kOo4gYuHgzUkTcSIfDsSvfx3qP1oE3izEsXcvJo6/EuzaFM+13gqUok/DELAlLyWkjsJDOJ7BCW5k5KPddZKrHJjl4QhT2SgIaGeXPGKnhVwiqYt4TIoQ/nYaRtHYXR9aVUYJLT1MV0Htc+MXvfc9babPotz6ji7GfxJXshd7fnMALHs9fizngcEg+qgKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB5594.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(346002)(136003)(376002)(396003)(86362001)(2906002)(31696002)(36756003)(31686004)(38100700002)(186003)(478600001)(66556008)(66946007)(66476007)(5660300002)(53546011)(26005)(6916009)(8936002)(6486002)(558084003)(16576012)(4326008)(54906003)(8676002)(316002)(956004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sn22wd73BtWmsY9zjJFykOTWVLe3VD71XehXv+DZwczwJMjbdvd0IrKbNgWj?=
 =?us-ascii?Q?WozOYGqdjGlZfQEHnPS2hp96h8tVb455HtOBZV/4gGDbIYmAliOEtuqrOWoL?=
 =?us-ascii?Q?j7T3toMA2lNRyIwWWnQn1Vr7ufXynFu7g34JCgUPssGOFr8k0JpbfnQHjIEA?=
 =?us-ascii?Q?9Zdw6oneAexFDZPOmS60W/NovJsPl55rMPBxxfDeltY8R5IZGMubYQzNUoiD?=
 =?us-ascii?Q?LqjTjPdu6VA4GaMmQd3J/JxuyvpwzjnAusiAwMGflMh7+Ek08LcCKDTb5zYw?=
 =?us-ascii?Q?FARVmFEXf5f1qIIsewfrn9JrgyspwQNPS/V0sqkNid4oz7shJyTSGFVB28Ac?=
 =?us-ascii?Q?lYGqdonqm6bsvrnQSW591KN+7uPobHogvwGQrCyy/pzKYSs0zhKL6swlM43J?=
 =?us-ascii?Q?xwgEoPxrTso1d32eCtmy2a32kxnfErk7K3BHnmXEMj8olL1ZRgVXFHPK5RKe?=
 =?us-ascii?Q?eg3NbE2+PV5Pp9rjkfFMRdBBZvawZHLXVr6EdZ+09rwQ2wqB8BudhcYV3rk0?=
 =?us-ascii?Q?iJpOMGF46QxWENh5yXn+72sMz4be/Effr+AzhXEXuv7jkvPoNbzPizZLeRhP?=
 =?us-ascii?Q?A8iZhsFdxZOL7Go/CPsg6VkdHcADkXRDc2tJmLRwlyZHxXdbXI9abHni//HG?=
 =?us-ascii?Q?Wm8YwbTeJkLaaJ1TRmJO+FqeBeln8FLPlqy/2On6eMfpH7O6A3b/gJARlRP9?=
 =?us-ascii?Q?xWFZwAq24kQDI8Vk0XH69w2XmR3xO1VXJh0h0UwYmIoGgiW35WeK8Nv3HSoJ?=
 =?us-ascii?Q?Vx9HU0O0mqAmwg0btg/YqKzxIXU9+l9gs91uuvamajsnOxvAmGTjSzs+68TI?=
 =?us-ascii?Q?2fhTWQOo5tagwUj8i1qoXf9Ekc7K57Ml+Ad1glyMDtLGomRgbGpem/PqGghf?=
 =?us-ascii?Q?1diCIvQi8xq8yQF6gzT45qyk3QmpxzCEYyWq6DKu0yFEyLwSHWBGYpvKqr52?=
 =?us-ascii?Q?hKsI3AWfqMGxt8IvKQzXaqlu5+yrEtl/1/i7kxXVGT42/EwBzvu/X0p4kDe/?=
 =?us-ascii?Q?I7a9Ib8ESDd0wANvruB2tWe2IwSKvy9nzYro7wyGiOuvtcNxNEOBq9MDYqal?=
 =?us-ascii?Q?q/Pl9qoARrbbibuLhxsk3YL4KYQcBN9pYUwtb2ExjbJEUukdfy//z8LTW1Ep?=
 =?us-ascii?Q?eajMA3hVD8NaH+tKLmxBQIKP2OtHTeYe7+OOQZv9WMI1SxPOWd95D6Hw/QkW?=
 =?us-ascii?Q?O8tiIX1G+MAbNaWV2STwUxZFjQdJZ27pDKC4Pk7a1iKC2AN0ZnawWmQ+6k//?=
 =?us-ascii?Q?KKgI8xicxsKS3IBHeESi32gsbxkEBwRBJ8s+K+3y/yCDgGhcyut3IXTRz+L3?=
 =?us-ascii?Q?eFf6h7iAH1MpAbDhmNZ1BSx1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a53eb9a-bed6-4dc0-1424-08d963a46371
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5594.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:33:14.4886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJiS+/PFqK1WKDOXPh+bOMzf/Q0bNC4NXBq51HMHlLNnKd5HHmekIxbkOnVAbw81oJAq7q5tUaEFVnPFbKW01Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3740

On 19.08.2021 21:06, Marek Marczykowski-G=C3=B3recki wrote:
> They don't modify it, after all.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks for taking this extra step.

Jan


