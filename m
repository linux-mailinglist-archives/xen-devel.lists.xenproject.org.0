Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394BD3BD815
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 16:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151371.279759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lcm-0008WO-0K; Tue, 06 Jul 2021 14:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151371.279759; Tue, 06 Jul 2021 14:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lcl-0008Tj-Sn; Tue, 06 Jul 2021 14:00:31 +0000
Received: by outflank-mailman (input) for mailman id 151371;
 Tue, 06 Jul 2021 14:00:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0lck-0008Td-E7
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 14:00:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6088145b-c0bf-412d-9497-6f476be1d72c;
 Tue, 06 Jul 2021 14:00:29 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-OvITSPGxOkmC-MOA_ZJhcw-2; Tue, 06 Jul 2021 16:00:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 14:00:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:00:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0073.eurprd03.prod.outlook.com (2603:10a6:208:69::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 14:00:24 +0000
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
X-Inumbo-ID: 6088145b-c0bf-412d-9497-6f476be1d72c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625580028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QypDFCIUIljqGOPv9r/9ZTCAJ2ZWg9r5mbrbBl/EHSM=;
	b=TMs4VFuHYUU/8plinE1AGqWbIAcJ7FGd6y+I0S/RU/GlJQ1hGxOvcZ/G1SNdY2GGBs4FPn
	Z9BfWN97ALGiw2ce6vHV5Wd9FedrpPs0TtiAxEG72Yc4AVh0mBso0enI6XzewIRphjc8HM
	xMteL3ZQEskl4CVtTDRXy+kIgPU+81k=
X-MC-Unique: OvITSPGxOkmC-MOA_ZJhcw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn7Q6lT/vWGN9B9824GRQ6ZMziOu7kFA5rfziB1qqPNl+AB+sM7gG25Vp0z+Sr8zUtLFh2GjKZ/ezuNk7sG/qBh5wDlYhSRaD3f1WUoShkZ9msV6K9M3IirnvElnQH/augm5+UNcjJ+WoGXrkGB6hAh1S/BBlgk2cLlvSyUCDHjxDxTL24Ou5cq7cqI7ZlEDl2gIncpxVELzr7tx+CUNtlgtgXEtJf1JlltFnzfqrk1hBpH8p4rCjl4+fqjg//DF9YWEHMUHzETzbqYwRzGXzDfuKpmsdP3tWBzbQjylHjv/HZuitZjoSSTaUb0Y0aT2SaIdO2rQbeoXl0EnJT0bDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St0EwMrId+cZUv2Y991CKhOohQUFO9iLd9sMz+Pae4c=;
 b=CCdYFQlhZSt46YKWsx5a+8H0aIKyhEHug/5CoaLFaiVfu+fk8fhu7CBH7AkpwPZ+E1x4SA0UlfWTOYmKBAPfM7aI+xQzjSKJwHpJO9zblZp1dA6BqMkDZvDyV1MoFQqT6nd1gGqRP98mrumgJR1f7GT8d06bGG3bI7dqHWN+sj1TlIb8wGjzPMOHmwmLFPzO3w0Gtx2v52Lgw2LfCUDy34nJj1fy9V7mZSv45kp408B/MR3gLaR4lFJD5XKi8F5+qLDdbB1CZzWHmc7zE2wtxeL5WPrkRRapU4X9/+MGwGY3l0ZqeslrMTOWjX7MzM2MUBVgO1KfkH5HPavgOAjPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <d5bb77be-b557-3587-6cbc-3e427104c55b@suse.com>
 <6e5bb79a-1f90-257f-a90d-374cb206093a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b8f25a2-8546-dafe-5035-3885b0d09f88@suse.com>
Date: Tue, 6 Jul 2021 16:00:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6e5bb79a-1f90-257f-a90d-374cb206093a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0073.eurprd03.prod.outlook.com
 (2603:10a6:208:69::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f0fade8-591a-4d33-7b3d-08d94086673a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26075FAA52726EE31FFA09BDB31B9@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZQE8vFV0VsNH/OSZ0OcKS+dThlXxWsQvvxhDniWBo2srRBXZoKiEy2PdztW0gllKS6seeZK2bTH4Ov1DmzyVnyBkXyb+3YIN677//3YPCMi3MSJa3cdgKKJ0kloq56xWTu0pxOgMqAT3wbGmxCEDUEIvvWVu6lmEjaYB389G+P+qispKUqbb6fFykbMPt3AQrjdgO/YdgsZ5c7pbxOmrwbyWodcjyhuIp//NL48DGP9BDiOum5T72y5YL9OV9yFIle7DK0bWRZS9rCSpqeuF1h7Locjn6OaolG1XuR5nIYydkZS7B6MGJDfpK0hh3anB7VvpnugfhMXJ7GWV1ZrsIgMIvhFjzstSVnY8VCwNTzG8waA0TO980pFv27M97rzcG/+JZCSRH/5f/H4C0rOTr6H2iBh9a7uTRvJVB/P+eFHy3fyd99VvOTlUQEhmCMuNDe8zZLEVxbQMLPU9Iy0eExSCv9hL//ELORWG5N7Sh3WLF0ua4gQuEx8POxUYaBpfIcbNh0fxj5dmPIMLJaHAXr2MrANdVZ4Nqm8WRPVzPl2aSR9rxPmx29ytNKu1qq2VtJrF32czr3oIqf2UITg1iGzoSsAHqSEtgNPKV3DEeijTPaWd2UhImHzp54pcWa0FqAGhcQH3bUAUJmY3Yz0Cp8MSbf/CAJU3UMisLreXx0GyptEYtuPByUpxrZ+n3DpfnCOLXk//yHnQsAMsgYuWKFvGbof1eyPLn2QeIWTJwY5pSr9h6DbI3cj1q0v+gTrV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(39850400004)(376002)(956004)(2616005)(8936002)(83380400001)(316002)(36756003)(478600001)(26005)(186003)(8676002)(16576012)(38100700002)(86362001)(53546011)(6486002)(66946007)(31696002)(54906003)(2906002)(66556008)(4326008)(66476007)(6916009)(31686004)(5660300002)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tFYb7onq6B3Kofmheqn5Q/Aw5y4B2WGBv7wh/YxS/xFjnL9VZ63bmKWnk3ZF?=
 =?us-ascii?Q?Hac9ei6CZFu47tgryAKX7dFYLFz75vw2XwnZFAIvvOKppkrhQ2f0fLij33z5?=
 =?us-ascii?Q?TQLeoImxRmWGehVElQHH0DhoMxS0R+SeGfT1Eq/LcrxYgH9o/lWrQTH7TdfS?=
 =?us-ascii?Q?ljvT3CKlntxsrwpcI4gK52j6sjzOmhNF7BevrBswsbYi1jjNQMB5BjpToYDl?=
 =?us-ascii?Q?2oDrevT55Ll37pwt/UBK+yE7+EIAXRBB0kpxS/TY0ID+F8g5KotVb24SZK9o?=
 =?us-ascii?Q?14YC3r/ze6pAH7i8ZD5G7HPoOHZlYixLsQcEoKLF1ZRg9WfF0We85HloMkfA?=
 =?us-ascii?Q?TmAzkkNIulNbkFDAaL3Cj1ljDyZ2JdUk1Ve4oUR1y5ZwvGupjsNMS9s3KKXD?=
 =?us-ascii?Q?te1nunaPNM3KjH6xZ5MpgHPK2YQhz13eCefJe4A4maUbDseExkuKi3pW19AC?=
 =?us-ascii?Q?G/2E2MUnKP+NE7vux1frI4bLAuWIq0RK6SCpNWA3IQ4S7aDIxGWWfpHTCqBC?=
 =?us-ascii?Q?RE8Wm6V2+2NJMmRpQXVQokqucUtadHKDF+16lhnQ9Jah7g0S2mHmKUduQLYh?=
 =?us-ascii?Q?9QOAYRo2lC+LS7bYsZpEUZ45AHiKGvoOOP3mLVm4V/ty5HqQY2/xBX9Q8N3L?=
 =?us-ascii?Q?QYnQSAE0PFN8yS0EEoafD3Z1YKtmchhP/wLEpJMYaS11fW6AH7PmuFEoDHJu?=
 =?us-ascii?Q?m5H20N1lv6h1GCH3YAm1s0ZVcspMEvXilNt1/BTsrsXDPfcfxQ9GBM8PG0uI?=
 =?us-ascii?Q?mF5kPpT3xilGUtCVFjK1k5/4ajmR6FD5gDawQTtwVTLBDRMoLiaZweAuQsZB?=
 =?us-ascii?Q?+zfh+HoVvkl1vY7n5NxaXVqF49WTP45/gf4plbONHUUBlcWiJ/KkKJynmKnQ?=
 =?us-ascii?Q?L7GCnrt63EnG5BfOCxW5C3yAVzJe3Zl1XosiQiM14WlYpndkfMKi3f3khcSW?=
 =?us-ascii?Q?/xQ7ZNkP3IFpPoBer+8pK2PKIusufgQGSj/vOcnEOP2kB9zPBBaG8wUypm10?=
 =?us-ascii?Q?oOeA/T3fiZCnBN4pIRPIk60NbHASkWOcG/m9IZYMwbmjwBG13osOWOvbD0G3?=
 =?us-ascii?Q?LdE4PPs2YfPHQFkPHcde1uVDQCosFDnMfXf4g9WMdW7eVnF665Y/4zPHwcDI?=
 =?us-ascii?Q?zsp9OyR6PXD/MQ+kbNOdPHC9ujgSn8M/5VF/qZ/GtzdmluIXSfLue1VCiLQJ?=
 =?us-ascii?Q?I3QDly44h/FzQpECynq0alTADUoxYCIHvi59TdlP8Vgbw7TDTNbsnSdKsHcE?=
 =?us-ascii?Q?q3aPE1Hj6YHcuRJKWVMoCuAu4aD439V7eGHOpNY5Hv88jOjipYVFJbNkF+kB?=
 =?us-ascii?Q?3COT+zBUEgpPAxqUcsHpRLdM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0fade8-591a-4d33-7b3d-08d94086673a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:00:25.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dxk3pkFyJ4oMxA9iJ9cft7bBNazipWDLGydHzlx42y6O1XevprZT3mvjYXzLTHCB6IDoFH4snn0EwMwJ0ilCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 06.07.2021 15:34, Andrew Cooper wrote:
> On 06/07/2021 13:03, Jan Beulich wrote:
>> On 06.07.2021 13:23, Andrew Cooper wrote:
>>> 'count * sizeof(*pfns)' can in principle overflow, but is implausible i=
n
>>> practice as the time between checkpoints is typically sub-second.
>>> Nevertheless, simplify the code and remove the risk.
>>>
>>> There is no need to loop over the bitmap to calculate count.  The numbe=
r of
>>> set bits is returned in xc_shadow_op_stats_t which is already collected=
 (and
>>> ignored).
>>>
>>> Bounds check the count against what will fit in REC_LENGTH_MAX.  At the=
 time
>>> of writing, this allows up to 0xffffff pfns.
>> Well, okay, this then means that an overflow in the reporting of
>> dirty_count doesn't matter for now, because the limit is lower
>> anyway.
>>
>>>  Rearrange the pfns loop to check
>>> for errors both ways, not simply that there were more pfns than expecte=
d.
>> Hmm, "both ways" to me would mean ...
>>
>>> @@ -459,24 +462,20 @@ static int send_checkpoint_dirty_pfn_list(struct =
xc_sr_context *ctx)
>>>          goto err;
>>>      }
>>> =20
>>> -    for ( i =3D 0, written =3D 0; i < ctx->restore.p2m_size; ++i )
>>> +    for ( i =3D 0, written =3D 0; count && i < ctx->restore.p2m_size; =
++i, --count )
>>>      {
>>>          if ( !test_bit(i, dirty_bitmap) )
>>>              continue;
>>> =20
>>> -        if ( written > count )
>>> -        {
>>> -            ERROR("Dirty pfn list exceed");
>>> -            goto err;
>>> -        }
>>> -
>>>          pfns[written++] =3D i;
>>>      }
>>> =20
>>> -    rec.length =3D count * sizeof(*pfns);
>>> -
>>> -    iov[1].iov_base =3D pfns;
>>> -    iov[1].iov_len =3D rec.length;
>>> +    if ( written !=3D stats.dirty_count )
>>> +    {
>>> +        ERROR("Mismatch between dirty bitmap bits (%u), and dirty_coun=
t (%u)",
>>> +              written, stats.dirty_count);
>>> +        goto err;
>>> +    }
>> ... you then also check that there are no further bit set in the
>> bitmap. As said elsewhere, I'm not convinced using statistics as
>> a basis for actual operation (rather than just reporting) is
>> appropriate.
>=20
> I'm not interested in inference based on the name of the structure.

I'm afraid that's the problem: Because you started using it for
something it wasn't meant to be used for, you now think it's the
name that's misleading, and the use is okay. I remain of the
opinion that it's the other way around (but see below for there
not being an real dependency at least in this particular case).

>>  I'm unaware of there being any spelled out guarantee
>> that the numbers reported back from the hypercall are accurate.
>=20
> The live loop uses this information already for this purpose.=C2=A0 If it=
 is
> wrong, we've got bigger problems that this.

send_memory_live() passes the value to send_dirty_pages(), which
in turn passes it only to xc_report_progress_step() and uses it
in

    if ( written > entries )
        DPRINTF("Bitmap contained more entries than expected...");

There's no relying on this number at all afaics.

Jan


