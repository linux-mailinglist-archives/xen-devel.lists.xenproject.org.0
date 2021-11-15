Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBB450339
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225783.389980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZrt-0007mo-Hn; Mon, 15 Nov 2021 11:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225783.389980; Mon, 15 Nov 2021 11:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZrt-0007kU-EB; Mon, 15 Nov 2021 11:09:45 +0000
Received: by outflank-mailman (input) for mailman id 225783;
 Mon, 15 Nov 2021 11:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmZrr-0007kH-Tx
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:09:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 888c07b2-4604-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 12:09:42 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-mLMSaB_cMuWqfpybvLuvNA-1; Mon, 15 Nov 2021 12:09:41 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5681.eurprd04.prod.outlook.com (2603:10a6:208:12a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 11:09:39 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:09:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0012.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Mon, 15 Nov 2021 11:09:39 +0000
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
X-Inumbo-ID: 888c07b2-4604-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636974582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfbTQv0gqNT/v5N3lT2GnmE7JAfLJRKwKoX9nwTgZWc=;
	b=L/8xNSOE3QOBmCPTISNy35TwcB9MyPZ72Qr2G89ctu+wrx/w+ybI2F+Cf+A2q2bU2Xokz0
	C8rCPvdmHhhdCOg3ZmETIvlWVBCq2lRDvKtPIo+ZLI34m2KIoxDZ7aCwd6So3OqSPTk73x
	/IA77ujrvP8/3Lot9nEIhQZukvbVpCI=
X-MC-Unique: mLMSaB_cMuWqfpybvLuvNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDFtYDcdFSc/GIJMc027e1y5HcxWGJxuWRS/DHsTCvJfpJvnppCKwJyRGP/EbNFrLW+UhqtVxGsDTa54kOyDYaL8YI91In3+72E+mlJbAdpcwH5jbkIcMWqeoDtRORJW3cElHRdlpssW6HAfL4sVpVPu6Kb5pp8Ltk9FVeg0Vflwe3MLDQRiboO3IVLj8LqvhTEeEWar7aKcqRfwiu23YgQZ7vsuD4I3Tz5xw4UnCTbYGCUZHBIYafxRZdR8Y/lG6FatggaawEt04Ej1MDOE/Q/zbMLsN0KJ+h1CJeLJrBrBFbgtnoA5BoiDVt+1teuZA2CEpE/wZq65wW2gYn+k8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slXQGne7JzTLYeGyeOVrdpH74tMCYFzDO9T3Gocbj10=;
 b=Rv+xzWurZUPOXpnl4ugzrIvj+FC6BbLZP2Pcs2AZ8Y2V/7crGrE5bZH+OwCR2IAUT4jG+e0248EEzOzpLSn+egKuOt56M/0gOQrPJXn1xn6ukaBWiYFiQpHHs0DaztgeIZ7guEc+DJRnCZ2VpVWEVzip0FIZMJ3HX6FHy5lNgqwX32QDlMj93KvP9jo/FvT5WHXHVK6drq3/k1nE2ZspkB/tJgvrxPp+iJDj0LMz17pDxT+LqOYfx7924wLQBN7wd/MzXOdEJTpui/jLxZw/yYYzw+IahZSEqCZO3Aik9jj3iZthE6SazpP5+meNM/zU7ajEVGVVDv+iguK8JlfMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a220c6f7-3290-42ad-fcf4-69cfad7b8ece@suse.com>
Date: Mon, 15 Nov 2021 12:09:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] x86/cpufreq: Clean up powernow registration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
 <20211112182818.30223-2-andrew.cooper3@citrix.com>
 <YZIn78EzYjI7YXC4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZIn78EzYjI7YXC4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::17) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7192c4-e562-4d2f-f1cd-08d9a8286ab8
X-MS-TrafficTypeDiagnostic: AM0PR04MB5681:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB56810952E6458B3A0E2C5CB6B3989@AM0PR04MB5681.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PUxPsi7UlC41gBHEV8RGqP6b39gBmxXWDXzcUhj/xXIZmTqgcjlAxOE4R6Z4Fqd5FCDPGIpY8ClxQ4EZs2kSMTcLMStIuEGekpY26ZP2MF3Mvw74ARAxs3BZHYeU4dlY2bOzZvt0/XoZgXaUxbXIdptMKjKF2lHAVHQ+9+iIoWIZeMHKRMzCB2cRNOb3OaMvohmHCtORHdgwYMvb4f+6+y53ReoYOyfV1CK5Rkme0lWAxs6oPaprCqW22atX2JqMxuhDBy/GYvBYG9tzphLMBakiMEPUFJtq5vuBC2WmVDoIGqYavu3DwoHpVHIkuKX7rNQXVJ2HcOVml8yiWtuaSjq8cIFqKKhJvN7QF23/DgDz2+hebUZmzSb6jJcscO6UinkP2eLstuqugkgpbKWahljp+Uwkf+GKmmwXQsl2YZHAzDkRHiOmmqWilF4BXhicVyx/T4QoSHkiYvpvCbKL8H+tjTUZCuexHJK+hJhtVQGcKjIE9Akp1adGxqLImKfPjefjcj3SbNWCwom+WH3JSkj+CsI2779IP8vmdlm0nAhISDhPbAFqWpq5BYP+KMMhdQT3imcoqk0s4HVMhImV8FjgQB4Y8n8haBy3fFZpBF7avVjr6Tip5ghzVeNW3cfYSiyyuRdL6nnqZSAE3mBFXfvLX90mBS1+0yhlaQtbmFbUQzQEl9Y6u08NJ6icossVBgMq5RUxxuMA7tHxsqWt52ZXfQEfmdlTKBQ7isHBDbQnWpzbZqXreBEze+OSzEAT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(31696002)(54906003)(5660300002)(6916009)(8676002)(186003)(956004)(31686004)(83380400001)(6486002)(8936002)(36756003)(16576012)(508600001)(316002)(53546011)(4326008)(86362001)(66556008)(66476007)(38100700002)(66946007)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U47XVHiwOp5kynM7UFub/9A9VnkH0xY/YHpZSxZO1FYP552uDUlbtLupGi7i?=
 =?us-ascii?Q?FD1Oy8t8KiEMitNGfOVFCgvAiVAz70NSJQBTCZau4+K8tyLAuRf8QjjuWqDk?=
 =?us-ascii?Q?GHnOWjN4lesMx+xJR+l70E8iV4RPdO2y6/UXnWyMer/I/mBTe7QL0uWi4pmy?=
 =?us-ascii?Q?XPx8WsyFqAmgVz7uLCOmrk/5UkQjKTMP32dxGHIEUgS+xq5wSUqSdcu9rGIS?=
 =?us-ascii?Q?w9hRcgioD9wVDkQlhW/MGoIMbZY4Ik1O9/3zsKJUlgWCR3xvatq6Y36cHWGe?=
 =?us-ascii?Q?OfkEvv4DOhqqlGh7m06oZCWefZgjlFLOOkDi4q67/DsI1KR/ZpJ0D7qRFiBr?=
 =?us-ascii?Q?F2JvXcEfcw1icDvKMwY3axU8lEIGuQ6UeMDvJBmdOMOqL0EmOCFEA0lajRD6?=
 =?us-ascii?Q?peoYZhKeepeN+6zd2mxqzp8DdRlx8ihHn3oR1t4qYA8KX+iD5hxezRQ5n8aE?=
 =?us-ascii?Q?7gwyFY2GcE5tPWPg6PCB2JzEiHmSjDnpXBhU0rlmVzC0SDre/9Y/rwqRDJnT?=
 =?us-ascii?Q?/rSa4ktIiqVdR8IZlDToFXQyU+kF+M2bnuItYN+l3drB2XOrjDC19+4rbA4J?=
 =?us-ascii?Q?vGX3GOMrk/H/HII0+CRVrndOMCx53vzizqIMwC6xci/owoEXHxVUeZ09Jq2k?=
 =?us-ascii?Q?nSsBsnF7ek6aKNbSnkxY4XXevYoeLPhkiFhJkKfigzKCeEbtMnsl9FlfqT9f?=
 =?us-ascii?Q?FwGBCw1VgGM95mDl+dWGYOZVP+Y5mI9ooLMz5Vd1u/L7bBoj2Uf0maSGAH1/?=
 =?us-ascii?Q?FW2YReeZErkVj8ruxnjTsyuXmXN/aI35EH15ankBeDQN/+68vAvA1SUPS6ev?=
 =?us-ascii?Q?IS4n6DVKkIFVBOOnwPz2DtLLDqibH0uUGQjZkxj4t9cHZZ0TBKZmTj8NUZPj?=
 =?us-ascii?Q?lKxlESKtHpZ+QjSyIqawW3bpn0DyB0iWjf7xppUtP6QQva5NotlK7K7rUyOE?=
 =?us-ascii?Q?4+VCkft7tLvMAQ35PMK51R2neGqxOMiELVvf6MVC8i8GslyTjEEyNdjzK7x3?=
 =?us-ascii?Q?AwYeXfEo+MHGl9w8wutjS2fi1F/WjotA9ByuuE9Y5KWOMDStYuqxN/7MXHuz?=
 =?us-ascii?Q?9WAtVYBTPtwFZaUmYNXT6iBJdTh97Z6p/tt0ZFK7GMpY18Lbzz7Oe79mlD3M?=
 =?us-ascii?Q?p58Su1ZXV0T0Ju27/wENIN5MwR/6bmxwOURYfZvn7mW/SEyKFGZwgPvbWR/l?=
 =?us-ascii?Q?hRqhk6JOyAc1FOUhgqMpovWu3Cgs2JIpqFpc4cefbtcy3zBCJc0Knn+as67r?=
 =?us-ascii?Q?2fUu0hJbqhHuS85KUsSldc06g/E/yO/lw4ERR7qsVaUsLABQgtppHovrbsNJ?=
 =?us-ascii?Q?vb1KHKr4jb8AVqTu5eB65XJzjldSpv6IQeDgqrcistKaFJE+b5SCPrSXI2Lo?=
 =?us-ascii?Q?NjkjXXIWk/vxr88mASjWxFy0EW9xXGLwYCgfYuwPjBSlUzIKI6QBePnt4hZD?=
 =?us-ascii?Q?yhUOaghQ6sOxcvbh7TBa6k5+sIZdtGYBISGnjYSfDBq3T4aBINPqJL2vsmHv?=
 =?us-ascii?Q?4k9xm/AhKU9CznnIfxi0t5B3vTUhpgIfOWcMV03fco6j+Xebh5upr9O/6R5/?=
 =?us-ascii?Q?7nrmGVzFGLJARLJshduEbt8i2WOoXCB43Rylq5OPr277T3xsNUsVlkaBpipI?=
 =?us-ascii?Q?/n4iV/SHV1j1Tjkxz6B/jGE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7192c4-e562-4d2f-f1cd-08d9a8286ab8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:09:39.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrO5M2tlBAe+jmGBxDkuN7g46kZnyhpcd9zm6vQBmXQZa0xz5isx9zy+gYk+54C6Z+snPVSAI2lCQ4LdAwsRmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5681

On 15.11.2021 10:27, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 12, 2021 at 06:28:16PM +0000, Andrew Cooper wrote:
>> @@ -353,25 +349,13 @@ static const struct cpufreq_driver __initconstrel =
powernow_cpufreq_driver =3D {
>>      .update =3D powernow_cpufreq_update
>>  };
>> =20
>> -unsigned int __init powernow_register_driver()
>> +unsigned int __init powernow_register_driver(void)
>>  {
>> -    unsigned int i, ret =3D 0;
>> +    if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGO=
N)) )
>> +        return -ENODEV;
>> =20
>> -    for_each_online_cpu(i) {
>> -        struct cpuinfo_x86 *c =3D &cpu_data[i];
>> -        if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
>> -            ret =3D -ENODEV;
>> -        else
>> -        {
>> -            u32 eax, ebx, ecx, edx;
>> -            cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx, &edx)=
;
>> -            if ((edx & USE_HW_PSTATE) !=3D USE_HW_PSTATE)
>> -                ret =3D -ENODEV;
>> -        }
>> -        if (ret)
>> -            return ret;
>> -    }
>> +    if ( !(cpuid_edx(CPUID_FREQ_VOLT_CAPABILITIES) & USE_HW_PSTATE) )
>> +        return -ENODEV;
>=20
> I wonder if we could move this check into cpufreq_driver_init and get
> rid of powernow_register_driver.

That's a vendor specific leaf, so I'd prefer to keep checking it in
vendor-specific code. Dropping the vendor check from here would seem
reasonable, considering it's already done in the caller.

Jan


