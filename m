Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0C3ACA50
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144507.265970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCv4-0005Sp-An; Fri, 18 Jun 2021 11:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144507.265970; Fri, 18 Jun 2021 11:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCv4-0005Pi-6Z; Fri, 18 Jun 2021 11:44:18 +0000
Received: by outflank-mailman (input) for mailman id 144507;
 Fri, 18 Jun 2021 11:44:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luCv2-0005Pc-0Z
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:44:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60c0895a-7ee9-4f45-b091-36fc777038c3;
 Fri, 18 Jun 2021 11:44:14 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-NkR_hk7kMc-NaWup-g6e0w-1; Fri, 18 Jun 2021 13:44:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 11:44:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 11:44:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0203.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Fri, 18 Jun 2021 11:44:06 +0000
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
X-Inumbo-ID: 60c0895a-7ee9-4f45-b091-36fc777038c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624016653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKFckytBowfX9X43g+XZYTZ0ij8kQBLKQUhn+og2JGE=;
	b=CfirM7Us95QEqNFS0H8zQ43Kc79+Lswh6QyM/N5TddcSLvecdhnsBcjOY4ikpmhRH6Dcqi
	MKOhIXe3nkzxKcmUXJDzHvxinyF7gzuZ7WrdPpef5GdPixdFjAGI0yyKl0tKcFYy8ER5FG
	V9EQAnwEo6z5Pma9SF6MGXR7dwqVPTk=
X-MC-Unique: NkR_hk7kMc-NaWup-g6e0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ+uZbf67Lp7O+dqyjmiXwkwhnVd/rVSavRlxrIJisdf13Jj6mDRSCYeJb0KbGwG1UCQXS8qL+mpjFbtCE8ky/pHhZB1zk0vCvSbn67CmGluRWxUx/IWr7U/Sq9inAHgxD0gRs3kMo0pScbmx43jIYXf2azng9DHu1PDg3ZUm4RhNHYInF8lAxaealou8woAizwfUeQ2UJbE8nX8ekNSCXd2RUmaU51IvSKZE1faATpqjS2+ndo+VXQxYhTH6mNs8fDGjjznJR5x+15lB7kw94s7EPbo/Lk2bzVWIyMDJMOmzHRowHUe6Q4pXOYrubMORuMIWzQJEUf9PqrBe/q3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjmq/86DCfA4709Ryy1nrsKKtZ6y5S67KCEXPc2k1L0=;
 b=Nq/lBzlMY1G/YjN5I/4qhQkLSTOHSLoFT5sOWi6WJl44/+dclJHpNB65XEGA8mCFuI08uhhwREhyIL0qU81jeWWfYKikUzDuKM+vtphzA2+gu8ealbBsW9MB0UJDL9dnzrl0FCXTdsnAKT1TD/IRAai9q3X4eYulDssFeDyTFPCg8YkS/8mDYZo2If+CEcoG74cT08s2y5dy4b89qqL9It/CK5VRCBAiyS3y6F5+eA4CSBsyg/fix2BSUAJKMb+MoB7MBCE9megrlISlTrhGmFsUGWZS5X2MTr88wcZF93y1sSXnJS3OnDGkMbHJkGhvnFfhT5goNd+2lUwnzWoSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/6] xsm: refactor xsm_ops handling
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-2-dpsmith@apertussolutions.com>
 <07566583-d4bc-dfb8-eccd-d779783d959a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3345073c-45ab-b875-6d3c-32dadfb63fc9@suse.com>
Date: Fri, 18 Jun 2021 13:44:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <07566583-d4bc-dfb8-eccd-d779783d959a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0203.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb15906d-ed2a-4fad-fbe2-08d9324e6169
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59033C5928D70273D81FB3A4B30D9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NKe0H6/N7x15+M/PykG59noZlKtDNxt3JAm6/2bq5jup7XxAWFnpjlZbqTvrJmC2pQIodXgLWBZN1YSFZauhkMQFE1pz1AWaAnjzLhil/MDwMTfMOg+MG/2MhCeln8jvfbmwdzydxoHatWcrzN2/CRvmPR3wI/4QgiIs0jKVI/i2vKD3/nrIK5A4c4HxMWSGMLw0mPMBmH5ZsYTz4Pa7mIqVFXkMDIQwNEKxncQwLeHeZCNpcnMZiCVGK/Zvd9geQw3R/1QJmJ50e/AJtluVI0jkfzLRIk/53WFwgHvPpp/+jit7WUAvi5+duXcq99CRFIagnfqmAl40020vTOnE1tUssiBsaW2BOZUp3V2IwbP2P2TQPNWpwn275Ezs3I0YP1y+wByH+Yd7V0IcRQ/wysMgdzsIptB+xtf/V+/zzdWNK4QyvUt32SQVGjX/w1KqW4CZ+yC3v6+THVcqf5ULX8D/jn1phAbv1TeNmTTWmVpbA0AmGqARaG6WWEsV73H11lphqi5pP/GhSJZaxLHNUSgktA/7WpOm6+ajCER7npw5gQ1BRY4s3QJFXYRiDwCcwvaiFK9z2CL0pMyjKM3cWgV92dNsIArD4cBMq4bxHIyZWOObvkPI50csU775MlOeW/mZp7w3kjQgMKLVxoF/er09EztRa/3cbycZsPOotMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(39840400004)(136003)(396003)(86362001)(36756003)(53546011)(26005)(66946007)(2906002)(66556008)(66476007)(8676002)(83380400001)(4326008)(7416002)(478600001)(5660300002)(31696002)(54906003)(38100700002)(16576012)(8936002)(110136005)(316002)(16526019)(186003)(31686004)(956004)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mpO55/sstfd27gakNa31iXISZ4LCRQBoW9NDB8dUQA2/u/iO9t6GNrWaSKfl?=
 =?us-ascii?Q?aTBj1MmI8HONndnPNcnw/xC992orz3T61foV0drIreckTRMBMeu2x+gCp21v?=
 =?us-ascii?Q?PHdV80NTh/Q56gisi0FqX+QWZy3pNtw4L0SofMDjoxyYi1GjynKui0TX4f4h?=
 =?us-ascii?Q?2eSE03JSp1tvFoHqoaGwYsFHomsxEQuMgyVbiay9ywaOxWolEnkMRyWtgN7i?=
 =?us-ascii?Q?Ius1dJI6EZ1MG2rKEDZZ3iKm3oo8a3HywxuReEJoG3Uicti09zVaIs1nfF/t?=
 =?us-ascii?Q?FPeGFMwSYsgQML8sDCJdNNAN88CxsnbN2rfOP6AavrgAbZhf9baYGEQs0gMj?=
 =?us-ascii?Q?4jEBlLLvtI3WAoBDpLs/bk1AywoIfwo5e9MmakWNJBKN3fJnxhkTk4ESPlRS?=
 =?us-ascii?Q?X59DVSjdb1UDksfpBDZswqFPA7FMPtdK9hkg3QrznXBRLuNiBLyOqOVpy60W?=
 =?us-ascii?Q?ZwZZXHWwbq6nXgH5bpoLvSrliLMiERhhtvhHNLgPK04Dpc6kj9J17U9I6UGd?=
 =?us-ascii?Q?Hk5JtWzc38/ZdNjWToAvStZ1iyPZT7A9400JpTmHSRwwuwV21+Fl+0I6cf0W?=
 =?us-ascii?Q?GnEVJjAKThHmjFU0+u+1+DDcSXIfoLSRAPr6pYcMiqDKFevxNbb3wGn1jx3F?=
 =?us-ascii?Q?G2cgQ5kJC8b8269sz14rfiA4C8ziHL5yGp4hEj2Qky06uGmPy94Ns9lf6B2/?=
 =?us-ascii?Q?/KoAkSyjR/YOf/pZIwXnMMwzGswJXtmJM/4ay5GULS+61jmO6l4RmX6RbdoV?=
 =?us-ascii?Q?0C0NBsARMK2K4LzgjPBlIjiQan9DOfSl8LUcylwEnHxS/V9MMpUpYgbOU2ij?=
 =?us-ascii?Q?lyTOcMTU8iVCcr1y6uuJdge7xIas/HCZDtOxWKeyalJtHjszca/d1pKB0lAB?=
 =?us-ascii?Q?YWoiFZjXRP7lk4w3qySnXaKr0O4YQVjmx2/FsUxAU21PvtE0Fxtp7Ioutpb7?=
 =?us-ascii?Q?25u69whjA/S8k8G26r4lCQMWmqjnUHcWuIzGiYh5Q7HJUAxwSRHXjsykgwIM?=
 =?us-ascii?Q?5myqXLy7a+O5zH0RGNl7nuGIsuQjnMR+cpVHseJUOreZFylxC6Djbuci4dnz?=
 =?us-ascii?Q?Cs3qeDc/zg2xIn+jzGJANA62ZDSUk98RHELFjLhgGDOZ+2vvRUTQZZ9LOMf6?=
 =?us-ascii?Q?oe1jszlar9nbsmIjYCngw2KmULOv/p9UzXa1r0mimLhLZqDr6pZYo4tLL9du?=
 =?us-ascii?Q?3g/hDPT4Udshko1slsalIAcAV14iSxLZK74ts7RKb9BmCRbOG6iLdYCQUR0s?=
 =?us-ascii?Q?yssOXZ3TPWaisbSLVHn1osumbFvQ2KUezWTYIFv4RQ2G/ESHWhRPp4BKG4s2?=
 =?us-ascii?Q?zmthSdP3nYvSwmUAVD18ZhC3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb15906d-ed2a-4fad-fbe2-08d9324e6169
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 11:44:07.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gtx+Kgeo4jkyfKeDOa36MbSnmtGY4ZYOc4PF5cosRY+N1wGKpW9yvlDep5aTmhWENSgpBiEqRnnSpg1k7RvBXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 18.06.2021 13:34, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> @@ -197,16 +204,21 @@ bool __init has_xsm_magic(paddr_t start)
>> =20
>>  int __init register_xsm(struct xsm_operations *ops)
>>  {
>> -    if ( verify(ops) )
>> +    if ( xsm_ops_registered !=3D XSM_OPS_UNREGISTERED )
>> +        return -EAGAIN;
>=20
> I know you moved this around the function, but it really isn't -EAGAIN
> material any more.=C2=A0 It's "too late - nope".
>=20
> -EEXIST is probably best for "I'm never going to tolerate another call".
>=20
>> +
>> +    if ( !ops )
>>      {
>> -        printk(XENLOG_ERR "Could not verify xsm_operations structure\n"=
);
>> +        xsm_ops_registered =3D XSM_OPS_REG_FAILED;
>> +        printk(XENLOG_ERR "Invalid xsm_operations structure registered\=
n");
>>          return -EINVAL;
>=20
> Honestly, I'd be half tempted to declare register_xsm() with
> __nonnull(0) and let the compiler reject any attempt to pass a NULL ops
> pointer.
>=20
> Both callers pass a pointer to a static singleton objects.

Why check at all when the source of the arguments is all internal?
We don't check pointers to be non-NULL elsewhere, with a few odd
exceptions (which imo should all be dropped).

Jan


