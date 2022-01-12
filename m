Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885648C709
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 16:19:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256709.440672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fOm-00025x-V7; Wed, 12 Jan 2022 15:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256709.440672; Wed, 12 Jan 2022 15:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fOm-00022x-Qt; Wed, 12 Jan 2022 15:18:52 +0000
Received: by outflank-mailman (input) for mailman id 256709;
 Wed, 12 Jan 2022 15:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7fOm-00022r-5g
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 15:18:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f24614de-73ba-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 16:18:51 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-VE_gKaa4Nwi2aYyMjQOX-g-1; Wed, 12 Jan 2022 16:18:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 15:18:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 15:18:48 +0000
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
X-Inumbo-ID: f24614de-73ba-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642000730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+S+RgNeWN6NHsW+F8OYY4Lq3h7n22bBMt6S45RNLSZk=;
	b=kh54L91VXnmBkpon602Qfo4Ep1SSHlkPrpezjSZZJ2rOCMmL7y4mOzilOZ43CbAj+TWcKO
	Fjstt8AHzLZpbUu/QOl2gfu7jKR818I/+sgD2DYOHDtpX7uXqJU11Nk1TMev825VV4OD0s
	dHrJzssbc6SVh8ulN+b3IIwinPMg/ig=
X-MC-Unique: VE_gKaa4Nwi2aYyMjQOX-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6Doq2G5KFTuk4bbKmwgk1ptmAn5XlLSAjyO72vgJZI+RByZgIjrBQG5+GsDba2cKdudUBxFmnZkwFN2SzHdXz5Ngbu/LILFHmWEhLAKxlEycmnSPqpBe4WzXmP8KsI/v0QNXUW2H+Elml5S5GeoO81dz7Rqc9dS4yy5eh4+Es3axLyiYF8oowdgrLZ8vN6I8yAFRuBHquJwGznUfSwI1hbeeTzuLCiWhj6nv+ctxeTNE+FSqLtT40ZirKlKgImQHdazCzqpICh5psbR+RIBNn0+NXGBlkzYb/A4Aju2ROwE1ekVoG6XdPtsd85QkDrR7gnf4BLcyFOzjdmAjN+OUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHaYzXr1GQDK+jFvjYBQu0MrgcTWt7mFD5ZYk/Mex1I=;
 b=f8HYBctL2zAixIn6olTifNEPlzndNcf/zXLmqd69Ve+gx+EK+s1P3lgoSPuKB7m9NWnEQMB0aL/rZak55dqYojVlA88/RasaSCD3kF4Vz773D3o6/Xc5kugLE8sRA604DrGd74nbiKHIv+nV2qd25JYdtfa/Hssq0VAn9LqWB8ncvFAMbfSAYIkmymGg3dPKmfll5YcZNA+bFAI22Nu3N6dohEfDGyW7xkRVXicLC0hz+aTE+O298w2sU0G2GoQCHBWdbUi5phvElbPHhuY+U2o5qID7CFPnNVRrp6LS7rbusU5+w1ZR3aG+1dMYfh7tj11LQI9cLsQJWSZOXE/e+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35d06bbf-b3f4-ec7e-71fe-0329d7cadba3@suse.com>
Date: Wed, 12 Jan 2022 16:18:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 07/14] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 Artem_Mygaiev@epam.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-8-andr2000@gmail.com> <Yd7wjP8WLWQxzLbq@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yd7wjP8WLWQxzLbq@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0368.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2133240-48e4-49e2-21a8-08d9d5ded4cc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192F373D3E66CDEE3FBFE8EB3529@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MjmKQoM99DYBuY+ECL8dhmvN/kZ+x6WDy1PdG9qhHpYk273iHlqJhf6dVr1Nii87E3fOLJNnRn85JDo1T0YaY698c8qRFiqryhEeUcqN4W+FtPIPkh0GeqKRikKunhCMICvFtG391QvNv38ISFzE0N2tLni6BDXBhpoKDfrTp4LRHZxCIrftGnu0/mbdivCszeTGQbOVtyaRkpXGjGhzRuexWiyZCwScJU5t0p49xHJqwufujyzty8pEawzHXYPPYIgtHWNM0KVi8RVEqb+v3/hlz1e0WkblXW2UJpjo8t8gyX06cFuKshVfGxnwuQrd9P+63MXWg619RIndlClIM6eCpqft9CxYXZNi8j6Ii4AdC/skmR0oqWIC2MJ+3Pl7BvzsEUc6ViaFnZ3RBuNT4FwP50tEvdzcz/Mq3FLOZZXP9IQ2dDZkjLK8FqXOaQWv/5fnNK3c/7uZVj54C4OwUBTF46a4v4mOCrpbnxsqdKhsKHDCAwtFyvgh0HALUkPT5D95EcPou4SEi9k0j/yCV9ox9VWySXLaqh8gG+dKjuU1kYCP959rwmI7XPPL9kkOvMXHztgmcSeCc+D6V4YYNuYb0JfrEMQ7xhI5bz1yz/kN7l1ZiwEMrxsa+F6Yk3rJ6Wyp6M45jOM/7zHMMooM2KqFPdcqSCgRj+IE6cXdh/YjO9zDhYsJBvD5FSnIIKe12aiWsNQe7xyJmDEGjTMFsOrZI/eHWz+Sr2bGTbS6EibVGbPrnsMLHRi7Hy5Djheg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(31696002)(508600001)(26005)(4326008)(6486002)(66556008)(5660300002)(53546011)(316002)(186003)(66476007)(7416002)(2616005)(54906003)(6916009)(66946007)(6506007)(8936002)(83380400001)(8676002)(31686004)(86362001)(36756003)(38100700002)(2906002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rtj4uR6Mkrdoste2nfPmjXBc53T7MUr915JvqDlL2WT4HPYhfHfuenQ+HeM0?=
 =?us-ascii?Q?oRh3WRmoonjsuNbbsjHg0wJs855saovfegkI3u0QPx/SOj0C42Tp3JqOeTls?=
 =?us-ascii?Q?mIK0ggcFA6/dyODDlmRXaYfoFrG1hFpku53NPadMNIZQdU4nZQU+RR0J8137?=
 =?us-ascii?Q?mPaMcd6/fW2eSm6Tz+kERgW7N5oeb+IXf+wSceVEii60UsBIfz1zQQfPslHI?=
 =?us-ascii?Q?gvMcbXyafYLPXzaNEf8MUbhXSOa//1HooQNXaDm9ywW0w52H3A+6YicRhkTg?=
 =?us-ascii?Q?wGH9OsCApmeLp/MraNwJGolt41Okt32NK6lWTZeXNl8gyNHzsymA8lvPz/KA?=
 =?us-ascii?Q?6P6+F/fnItFU7Bo0zRPdXGmPVFSephl59THQs2oGR2u2Q4ZeZwZExIoiLuAb?=
 =?us-ascii?Q?jpf2ifgdVhdXpmw6zKcR0uk01rTkFr3zT1s9/VjP6MM4L+RJGi1xkkjsqsM1?=
 =?us-ascii?Q?kVpx2gl4F6VDSzlGvrvqcP1h47GZyUl2N0LgFYE8oaYr+RUOCK6skDpjRbhf?=
 =?us-ascii?Q?6b1piUgJlHmWQ1m4qokZk+hRPMbxJQ6b8Pm6/kQkeUFGiwtQrSU0xFj6gV/L?=
 =?us-ascii?Q?x9uKb8EgtbYaKLybhYsw6UACE1L2RV9WNjoOU26CXbpC63pFwQOlvIPgkWro?=
 =?us-ascii?Q?PYVgw9l3A4uAj/aEYKkxgwjGaa6ZSWt2tiGrc0fIrHEj5j2rkGfea0ysacjZ?=
 =?us-ascii?Q?0nXp2NSywcFgbZVK/c5p/3Z4xXyf8GrSERMuTyMO5g/roOYciZPSo1EkXDX+?=
 =?us-ascii?Q?vdlXkicgYuri8XGlwGvHfG8dEUTAwxfc0x0iDj1OZb2kjU4OY8BVU9R0hlcT?=
 =?us-ascii?Q?VBJKfMLwTKjVpMC0GyKtJhIdSkfCivUoCS0sUfdbHPd7t0JLTYndKXbYJrXA?=
 =?us-ascii?Q?n/QX/nFRWryRwcf97IYPdIZ7ecBp0hACSP5KIya4X++mID6ZMSSNBlKDcqyX?=
 =?us-ascii?Q?1KkyLAkfR+psorqkXao2FnYHYVRAuhvybnwkMJpt+QtNcTilLpfPlMys3kTb?=
 =?us-ascii?Q?dgza54Hlub3btWjDu9wVbIzsGvbQweYccAd2kSkljOUklxStxy/Q8+zpVwp9?=
 =?us-ascii?Q?luBvk6OihWEBNiCC/2FWeMMgpnP+tBwjURnNWjtihsGphwDzxIzSpLVQdpkU?=
 =?us-ascii?Q?x5l3eAm91DlbOdFb2Rz03NdkwT5+LQKIKVEMzXGRu/RZYrw2EGxxLq0cP+f+?=
 =?us-ascii?Q?fnIXUXUkcUecuXkQyeGfFvGD0K69u2rIvVlDzNc+5oK0SFgPHEcWgf6RRcmY?=
 =?us-ascii?Q?vTGtVf8pchzk7/bOLrq+mc8QjKmPFbMxSOwGmVAlZzQl0hDLcEPovwXPe7He?=
 =?us-ascii?Q?oAOCNC8uXrZW174CPlSUvVuQro5JZuqfoYjKtlOQSp5MfWiPQYOSOkVY60WZ?=
 =?us-ascii?Q?bLOMrW2j123etAgAQp6fy9svp6EVQb29N2vieepH+lBn3wT9FVEq0X7XdDP4?=
 =?us-ascii?Q?DdHnQe34ux4xaLJjKsiM3nAz1qNi13/kmE3/GlNNeEDXcmRR9rUMsou8MdDE?=
 =?us-ascii?Q?lgNxq225bhZ4cWfNYqMyPE38Iso0ZRPPW/8GrYCxWMfti+p734eFpD0Upd1+?=
 =?us-ascii?Q?kyV1gv3PTNZpN9vdC7EdvAdYm9zd1TUDTa5DaF8FahZ+eHLWiYdHI+DGknp6?=
 =?us-ascii?Q?Ahz9syZ62HMljrtNa8mur40=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2133240-48e4-49e2-21a8-08d9d5ded4cc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:18:48.0588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhlupiyaRX6u4PuSakcVkr/TgzjvLBunYJKGQq6krEMmHPpputrjPVLvyido8AZq2kmBOeYckCDg9CgHA22eCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 12.01.2022 16:15, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 25, 2021 at 01:02:44PM +0200, Oleksandr Andrushchenko wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -137,45 +137,86 @@ bool vpci_process_pending(struct vcpu *v)
>>          return false;
>> =20
>>      spin_lock(&pdev->vpci_lock);
>> -    if ( !pdev->vpci_cancel_pending && v->vpci.mem )
>> +    if ( !pdev->vpci )
>> +    {
>> +        spin_unlock(&pdev->vpci_lock);
>> +        return false;
>> +    }
>> +
>> +    if ( !pdev->vpci_cancel_pending && v->vpci.map_pending )
>>      {
>>          struct map_data data =3D {
>>              .d =3D v->domain,
>>              .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
>>          };
>> -        int rc =3D rangeset_consume_ranges(v->vpci.mem, map_range, &dat=
a);
>> +        struct vpci_header *header =3D &pdev->vpci->header;
>> +        unsigned int i;
>> =20
>> -        if ( rc =3D=3D -ERESTART )
>> +        for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
>>          {
>> -            spin_unlock(&pdev->vpci_lock);
>> -            return true;
>> -        }
>> +            struct vpci_bar *bar =3D &header->bars[i];
>> +            int rc;
>> +
>=20
> You should check bar->mem !=3D NULL here, there's no need to allocate a
> rangeset for non-mappable BARs.

There's a NULL check ...

>> +            if ( rangeset_is_empty(bar->mem) )
>> +                continue;

... inside rangeset_is_empty() (to help callers like this one).

Jan


