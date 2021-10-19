Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D14333F2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 12:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212995.371072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmhV-00042N-8S; Tue, 19 Oct 2021 10:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212995.371072; Tue, 19 Oct 2021 10:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmhV-00040E-5J; Tue, 19 Oct 2021 10:50:33 +0000
Received: by outflank-mailman (input) for mailman id 212995;
 Tue, 19 Oct 2021 10:50:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcmhU-000408-1c
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 10:50:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6087f6f6-30ca-11ec-830d-12813bfff9fa;
 Tue, 19 Oct 2021 10:50:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-LWstARwuOue7yXa2vh4VfQ-1; Tue, 19 Oct 2021 12:50:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 10:50:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 10:50:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0045.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 10:50:26 +0000
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
X-Inumbo-ID: 6087f6f6-30ca-11ec-830d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634640630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMBYjnG5XxXn01qbgnb576KAXNzQ7k29DDTMWTn3wFo=;
	b=eoVpWWkrEfakHPpZESTZNEpn3QF0VJqrq9UCWCe6YZAs3/yUGyxeWABiU2zEnQ9pzw6ldD
	ImGWZKhzrv49vGBfGhzKWxFWXJHuGz6td6iMUnRok5Oo5k5pfvbLpN8KDMc/fNe9CHAbZE
	m0zdHGIN8Sqghhr8Q7lbH92pZ+jY21M=
X-MC-Unique: LWstARwuOue7yXa2vh4VfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4ROPjMjblziqLt4GIbz0h7jI5cc2+qJDmFPHPdFSxFSpAwMBZ/kUCX4M4lIJWSviokGZxG+HRnVorCTfvnCwTpIeyj6VM5OW3b2riL6RlvLgp8Hso5AzdHtmOs2uMFew6QGFHgZzzb90GoOq+57g7VlsOKyhGN5UdqKSne7Tvuq2/hQ+PIwWHm41VKMWjrrIi2rOcyoJnxtvwIIOXO0PNU/nt6gNM4LFsNOoZwia5Y8eHDEzRFvcJcILs+LCAay1NlCnCdxNzv7EV2o+bi+saPUhQ8tRuVMaEql6C4SuC9AMAnLJdiSOVibB0776bZauwSx3kayXTeVekwf6HIZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdSCyaJ77SNV6Fu86xcQ6jM8t+zvodwnQIieN78m3So=;
 b=ao0Yg6fYh48iYUbCHy8ASnJdrLJHxFFbJ2BshbwWyp29Fb7rj54YxR3R3XJB2Tv4O7V/+BSOF6wZWe3D64KCGStdktBeY9vtsucqh32KpAO5OSXWaO5OxgWu36vuxTPQpiX5vjU1Wc+NcAFthAoIh0WUFN4OIFYZUQe5rYooGEQWsLxlLXkPCnRr86966NBT10x3H6/bUdhS+d9hm4uTGyh6QvIQL0r6P4MdcqD056NO5S6Km+IUpBsiLYsR51wsZXMqOM052CRTbpZXoI+2/4mlYVkOQwD7c7g4Zj9rjIGRatrH1kqlmjtsxRDY9UYI8P5yEI60AZmpof1Gb9kTIQ==
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
 <fc543483-bc67-1323-6db1-b335bbdc4238@suse.com>
 <65a88325-909a-7995-4ded-c9d77b386129@suse.com>
 <YW6gR6L0UkCm97aM@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8f17af0-1a06-f685-bae6-6c2bef9be39e@suse.com>
Date: Tue, 19 Oct 2021 12:50:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW6gR6L0UkCm97aM@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0045.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91ca5604-3c9e-4f15-6b7e-08d992ee4277
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477AA59CACB59047BAD9CE6B3BD9@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fBq4pLzeurDoVZIxvQIodI02Fd16KXv6WZ+X6ajYPaHBllvwBwN6EUh7JHEhXq2i+WyFLs+EyPiglCfGD8brPUE06TZyXwhOg8Wjp5t9p7mqPpju3BonSvRYSHKGCiC9ibCEiWNmpGV6eS9Lt9J5gkFGu0heOHa03/KCUL4m2lZaK9BdmkbGfKhNvsI0MuNpSDsDN3IDt+qxTr4CCLz7O3sxUlCntVmE69JOopEq0OG5RLZpU8B9vqtv1/QKFqX9BdGvGG55M9vWJpnnk+8xi2+F/8fMfqRIr48GTaOpbLZHMaYC187uYdh0xtEPZSc9VL6uYS5+Ga38eH9rmyVvYsH8A7gNpRXkL9BZy6/voI9vzgsYyCl+3Gbfrp95+kfDRjZ/NNtNrTItCqTjFo72E0vVW/I8qZQ/Fv8LR6GSbIYf42GkkO5EXxrtWONuz+oX5kdkX8bwxPbHJDGdEFyveuaq5jyZnRePDwI73WgjFziHV+A0mw8zUAbQj5/wvuRghuySZWe0rjSZJauL7EX1SBIDNx51272oVyztnrzNipH4F+P+z/s8aKi0Bh2lP6nvcYTEY5/lM4uFuDy77NYgdkxSVUgpsHFT7md6P7A2ndQoUXouV5U4t7O7RFmYHjgbD/ltTGWkyBDtf5HXWY4pTlIpipNMtvR7J6M2YlnwU1a07OLMszNpUA06wkzKZEF0SUKdF3AVEDUOwqwtLB7qgyMeEoZgCcYihpSRrsgR+7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(54906003)(16576012)(316002)(4326008)(956004)(31686004)(53546011)(508600001)(8676002)(2616005)(86362001)(66556008)(66476007)(66946007)(83380400001)(186003)(31696002)(6486002)(38100700002)(26005)(8936002)(5660300002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jbVb5ELMDjk2LK2RXzVAi5WGdtaVexMkIefL3nvpyxJ7rmJDoWvQSYyHWJcA?=
 =?us-ascii?Q?lsuPycYT3BhifT6SXmTiHR4isi+m2gA6MX13wNFibGJcmgT8488cWzcmx37I?=
 =?us-ascii?Q?rT9iPn8dG8NggpnnKEi1BFXNnc0I8sM9qMJR5kTyWzXEqmyoiPZe64C5V9Z4?=
 =?us-ascii?Q?ePS3+TgNnszjgJ+zyWFwFl9c+bvAnKryBrvTRIfJ1jV1/H1HxDnoSvPx5mTw?=
 =?us-ascii?Q?QZimofnCGVSZOiVttDNrQS2kMeS+cglo4R47kVzadDY1ZcIVxiMD0WgiJe65?=
 =?us-ascii?Q?XxJYi8IJdgvuRfE0hfJHcIEabV4F+bIny/5KOCDr40rRqWXoRelzOAvwcQkK?=
 =?us-ascii?Q?/+qcuaCkVGV5Zi5s/lemlev5+wrUKqgkJb9WIMlrrpJy3A5yv08OARgwoPvx?=
 =?us-ascii?Q?WiFP+7KQcCrjsdDeN/ZtBA8O9wpfiHgA1Hmka/rUBPAUxad5S5ApNMS3A/6q?=
 =?us-ascii?Q?7h20/PhxS37So3C1XTu7ROwLev/Ero4wr+qTX7V1AthEDoc925QRnaWAcFb0?=
 =?us-ascii?Q?TExNu1TyBjQCiKzL5JSL1G1U+z6WJrFEsbAHnoeJDCEG/aW5icgx+Dn/tlIa?=
 =?us-ascii?Q?JzAV4fuIicPJLvjd0s3ildlgSiofQ6LMctM9E0UJBbvoE1Fx7skR/uhhHygt?=
 =?us-ascii?Q?aptb8H7iHjmnUrnm5DRzHMjb0WZHKRQej77CVFNyAYXfFiRjiYMVWwcIWRX/?=
 =?us-ascii?Q?Cr6Oa69++3Vmu1JOcfKxQTkvi+PZslBgB6zssAshZuSHPq+obJn9VMkXqUTK?=
 =?us-ascii?Q?xsayv0VmDTwJHmgm4FJB5UJLcW6pRRCDcq4O+r48OrDn67lMgYzECLfk6C7p?=
 =?us-ascii?Q?/WA+r8KWUEoJ3Tuu4l4GIHufE0dBdrKfskpBQblOLF6yiFeAEy+CSn2OLza3?=
 =?us-ascii?Q?e1xXYkU3JJw364wSYVAZqhSbtYoLSdtNeHoJxfW5NA3DUn2qD5+CwM1XMrsI?=
 =?us-ascii?Q?sd6+Whg5m18L428dc1S+khm4CyVhr/xfYz5rSjNyh+8SkEqU8+CT/czWE3vJ?=
 =?us-ascii?Q?ua9pXY/rik96FDGcLWBxPyjuQ8mp8cwL0Xa+OuC/Tv1b9buZK1j54dbq+r6y?=
 =?us-ascii?Q?6iVwhPFg1yw8aBejKu5JPTZjumGM4Z8hpdDGq/FTW1TzRP48wO9mt+zeY5ZW?=
 =?us-ascii?Q?p/wj0GKme6Wu7NpRAjku7p9VzssMqkGmi7OOXmFU7/jZG6PCBmuR6PsPpK5B?=
 =?us-ascii?Q?XR82ax5dTlIMtURKx3Or0MFj4K5eKB8TU5I8RUaXPo8Pa9wgPjOtyDcq7NK5?=
 =?us-ascii?Q?gB/5RcOY2yPKetJQPGgz/Wvh1bdxo9PAyDH0ZZ/nIn608C4gic2dG0CTKq5j?=
 =?us-ascii?Q?oiz1wAAxArX5gMDPFDdFGvTR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ca5604-3c9e-4f15-6b7e-08d992ee4277
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 10:50:26.5579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUPgl7JmgeDtcLPAOFgjno8ZmEhgNEOTnb9zPi9ZFYwRx95lDiobSQPVj44psMw2wdE4m2PEeFKR+tORaeAlrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 19.10.2021 12:39, Roger Pau Monn=C3=A9 wrote:
> On Tue, Oct 19, 2021 at 10:19:57AM +0200, Jan Beulich wrote:
>> On 19.10.2021 10:17, Jan Beulich wrote:
>>> On 19.10.2021 10:09, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
>>>>> @@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
>>>>>          __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
>>>>>      }
>>>>> =20
>>>>> -    pod_unlock(p2m);
>>>>> +    pod_unlock_and_flush(p2m);
>>>>>      return true;
>>>>> +
>>>>>  out_of_memory:
>>>>>      pod_unlock(p2m);
>>>>
>>>> Don't you need to set defer_nested_flush =3D false in the out_of_memor=
y
>>>> label? (as you don't call pod_unlock_and_flush that would do it)
>>>
>>> Yes of course - thanks for spotting. I had pod_unlock_and_flush() here
>>> too initially, and when switching back I forgot to convert rather than
>>> just delete that.
>>
>> Oh, wait, that was on purpose: There's no point clearing the flag
>> when the next thing we do is invoke domain_crash(). If it wasn't
>> that way, I don't think I could avoid using pod_unlock_and_flush()
>> here as well.
>=20
> Oh, I see. We would need to be careful if that domain crash is ever
> removed.

Well, I can change the call there as well. Doing so would seem preferable
over adding a respective comment there. I didn't do so originally because
as it stands this would be meaningless code churn. Let me know what you
think.

Jan


