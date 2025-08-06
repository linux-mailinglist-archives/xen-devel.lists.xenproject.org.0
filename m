Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99EB1BF5F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 05:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071092.1434634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujUw4-0005tw-Co; Wed, 06 Aug 2025 03:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071092.1434634; Wed, 06 Aug 2025 03:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujUw4-0005sQ-A7; Wed, 06 Aug 2025 03:35:28 +0000
Received: by outflank-mailman (input) for mailman id 1071092;
 Wed, 06 Aug 2025 03:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOQm=2S=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ujUw2-0005s4-E5
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 03:35:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2415::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60290df6-7276-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 05:35:20 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Wed, 6 Aug
 2025 03:35:15 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 03:35:15 +0000
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
X-Inumbo-ID: 60290df6-7276-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlcDGS/zh+vispZ3GWsevTb1Sz9gzieYa6u6FsSJlw09oY/3Ixka83M5BMqOdZe/PIpyLREUfYubtm3lI3smo6Pd+9FAkypSX7Rk4bsewYQZ7PzbJ1i5izydCYQE7P+ROd63f9urq/nALIJ88wByOngUDDGm6KFUij85nTcORUyvblPf8U3yJFKUsvHk+4mduocMO2kz8fD+GQnNXPLlqvxsH9Nn7wYeTKoRbMxd+i2uDHQKkNd7LRc0JNly3xUWtQu0mU9z1jh+wK0rk826Ai+HLH8Um4zT3UotN+nPEP9cfw+U+0HtkJ1wglIjq/eINSRqIlVbuAL1nrK0abV9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSwADwyUi7M3qzOKNGpXHFSSgPCyCBzt0V8PoiLjUTo=;
 b=mMbt9Co8bwPMLPd/y1b1IhSRhws7QU/Pv3WDIpAjvTaD1NsrEUC9M3UMyOzP/aZxFs4jXnecsK8qEqO4eqIwZ3mQ7hgdd91rWqEgreauF1JMKG9Zd4sgtpZUIqqYj9cq/Z2dBTFZHnxOwJjBNRosh//ia/3rh2aeULIkU/UeQPOtZEP9sw9/kGxkwBNanaSPqBch+UdUEXJYgL1J6qIsSbFi9u077sqh27TM0YQUq9LCYjcCgXTYu1wd+8AyS6jKQpOfvrTA2x98PQfcP+HORzxf9GRpIrXZUKo/CsDRR6QLuYIj+5OQgBaLq6tKUDXzt8YvcOWNFX4fKvXnAeXmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSwADwyUi7M3qzOKNGpXHFSSgPCyCBzt0V8PoiLjUTo=;
 b=f2pNHVfja6TyLoxvxG2wRa4kdWPNqT3BJCCyMRtQm1dfSdseRCHYtYUZ9eu2iGmyIW6lWXYoJ85ZtoJGmN+7or1cmm6YYu4QziWqW5EXOqozGOI4CISHdIHZAj9nnBJqfLM8iCRhp1Ty7Nc+wA9DifNZAFydwdn7bGQpvvMx01A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Topic: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Index: AQHcBbvzKmM00rEmukmd//khB9ysKbRTvniAgAHAdwA=
Date: Wed, 6 Aug 2025 03:35:14 +0000
Message-ID:
 <BL1PR12MB5849E4FE7136515B5947AB8AE72DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>
In-Reply-To: <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8989.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ5PPFE4FC9FAB3:EE_
x-ms-office365-filtering-correlation-id: 655af769-e08f-47cd-2f2f-08ddd49a4182
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MoGCBYSnYS5Tm5znX7hRCm2ZfFMNA+sms0d0R5uESKgpX0prcY47ma2Gck?=
 =?iso-8859-1?Q?/74+WnWVJ6TirfghAh7a98NbS+XoPFvpqUdxRWF/GbSznY7yj42hsuBl/w?=
 =?iso-8859-1?Q?z3XM0JaFNdPI5VxC4JhFcboFzkOZkLayanW+kciz85nA9mYH2t3oHtEvwZ?=
 =?iso-8859-1?Q?aBVFkGHahUxDnlL911nUS3aJLoz2MAXLLZkZ5MS35X+WVIEsY82oq+Y6Yq?=
 =?iso-8859-1?Q?eChznyeh4mUovo7g5wzgtUJVgb8Az5caQsd1BCB7sI0f7FCu5lm01jXB0y?=
 =?iso-8859-1?Q?ylr0+N84+UL396EW77RHCmhNvgd01TgzFaSil5Ex1grlZTJrq5DFSawTmz?=
 =?iso-8859-1?Q?bvYjfcU90GWiYfGO/FlCpDQ2c6SPDHwQkPYoM5PvRpxKa0oqwRGtm5lRpy?=
 =?iso-8859-1?Q?3OOW1Hwjphfqz3cxigrrglULy0kiYk4Ma6U8ytEGLD9V2DG9ohI7MXDRQ8?=
 =?iso-8859-1?Q?NVDUbWRv44X+AmrxuDgpxoBxxkeBaGb4WWcMq2kzsoEMkAHKypIa3j8vGG?=
 =?iso-8859-1?Q?xNy4o/XkpUZRVZErL/EhttRrAc1Dyc/ASwdnGrdyg2fD87rnaFZ51c4Nsp?=
 =?iso-8859-1?Q?Nm9C/fLoh1YsyYPYJYlpAwViYZqWVL2wwvW2uJU1rbkafdEy7CXLxOFpfH?=
 =?iso-8859-1?Q?Dg3yo7hfAmCMCNVmoB/xalf/MsqWt5vhHgplOd3zZ+SKjOiyiabT8Ih4ri?=
 =?iso-8859-1?Q?oZkjwhWHyrnxRRf8cHbUyqwCDqdpvIje8qYmYu3JeBs1uglLOtgYQkVE7W?=
 =?iso-8859-1?Q?GLiTF6EmfPRxkqaFHzZvJseP3d6eKobEfPfD8U9InFi4Dh1ht5i2V1obZI?=
 =?iso-8859-1?Q?sRcYP03iuHenshKQpwUsG6KdYn66s2/jRjLl3DjhTOrpmSD9BnuBIR6tG3?=
 =?iso-8859-1?Q?+fGJVYv+gA68Ql9+t7giMOJ+5C6VvLSL76sqdwOxz1WyCEee/4ooec8J0X?=
 =?iso-8859-1?Q?MnRBhx5FdHuYxmYtTXfUDsdm3a+BSavsH9YJVamXj+8hfN734rkSU1QILT?=
 =?iso-8859-1?Q?VjeJVpHMDu90kihtUbDrhjTW4/+MgJ4m8yUd4qWmwHO9XBRKx3Uo8gxZWc?=
 =?iso-8859-1?Q?PqtI3fDwKz7V4ioTd6AsqmFFIkqYysbl4yItTiqdgaK6llc5wAkNVDoFni?=
 =?iso-8859-1?Q?UMUKx3h4U2OVaSRxEotdpSVLx8Bzq5m5Qho7dMQ5rx6e+jxEfjaKNl1dAF?=
 =?iso-8859-1?Q?naUIC/B8D/tX/jr5n+oLOk+xOdSRdPS2d6Gao2Tv28NOaVAGTsh+PHv7fE?=
 =?iso-8859-1?Q?XFRQ4ahsNUSAMYnrtgN9lf/sekuSZvUen6c7smmx2OsH8JdVCWdwsuXasp?=
 =?iso-8859-1?Q?lKT0dpjScWKBdvx/aOxujCkQDS9eAK90zjdJS709jHIrWy/d75G1LObfr7?=
 =?iso-8859-1?Q?eKmAhlaMWvFGWozj1oB8YUgyeTmg5xw1cl/WzZHL9y1cEhqdkXqIMq/YSC?=
 =?iso-8859-1?Q?YB7WmNnswE9oiX9F7eD49JbqFCObE1ZTifIDywEcQG61b3WaEacF7XXi8x?=
 =?iso-8859-1?Q?j3Ehxl491s/v17MPwSe6EMHywyXZuONqRN6zg2TQ/7vw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ETqyFZaRRlABrYrGCtz6IMc9trM0GQF9vwruB/EYrLZ6cxbSlQ6oT5OaVq?=
 =?iso-8859-1?Q?BnHpT/AwmvI6iRd1eyE6iSII96ZdLgnREtTqW7As8xwde/axWEDiNgq8JK?=
 =?iso-8859-1?Q?l3RUBR7kCat3Yvv1QQ3kt89i3j2JkJY4T997sT/55gIdbZ53iXOVA0hUPW?=
 =?iso-8859-1?Q?vluMPWJhBqPBbfLZmG8HH6I+kOZTiehBNBZwND31ZNorWacIkzbZ7YTltW?=
 =?iso-8859-1?Q?hfKG5EWtd8sdVBixbfj4J5BvVa98jX1I4xQDDJXTUFHyqasRSgED1hPfF5?=
 =?iso-8859-1?Q?npAp7S2I9UioNDSM9Uwlq8zMYghirn8cG4FVGUqAvZK+JMJ9Si4tbIosUW?=
 =?iso-8859-1?Q?wy3C1C10/ftM/InXKgnP4RIWO9C527V3kXTjZ25W+PatRUQFW/qUc6m2Nf?=
 =?iso-8859-1?Q?aewdZ934odra6qRiVhqz+HRry1Smt1+l5RfedZn+zMqbHeEhw0/Hf/+XLL?=
 =?iso-8859-1?Q?4i3rcuycQ57wTk56Bd7iO02lLr3Ud+geL9Zw+s/wGpTzfgGxqm7X8pbLEL?=
 =?iso-8859-1?Q?hg59l3Y/kfTc8CYQs1c39+VfOpDO+1Whj576daK5ypxiXbiiWtLMy29E/k?=
 =?iso-8859-1?Q?8AXDuOreXU/ecbGmTa3NMnWIBSXUjxbZ5xUNx8QlyLX71xr7lO/tapMbEy?=
 =?iso-8859-1?Q?Z6pp+X1EOItWm0q999+GtQlfLuCvqOPeiR+JMtcbVvajTUnpptvm4Blmq3?=
 =?iso-8859-1?Q?sqoEuP2/QjNUpvARG/TIK8iImf63pBx6CNCFDF6fjo7jLieMT4cv1tHp78?=
 =?iso-8859-1?Q?dB/vdD28rcrn0vsGco8cRS35ylt1w+4qGd1q9fbxNbvm6yAFoLbHLlFxFs?=
 =?iso-8859-1?Q?MWHEMIkim1cXU2hGMCyx3aW3mC9YmBfC94Zsap7tCuIvgzilxBvFxuGujj?=
 =?iso-8859-1?Q?S8W9TjOar2Lr90YF/FZYWO2tnDuy3B8LIWLL8PMfIVBHGiYlR5U2sFd8hT?=
 =?iso-8859-1?Q?HwojpuTmR8nbwcszRCLoFPDv6vn0Ouuy6PD7bYxqoSWB0GIp01haRbNur7?=
 =?iso-8859-1?Q?Q3kF6+eQXLKpupwtIXcmktS/RFgevHf8EiCOtRoS60y5/Kf2ZWn7MURuwz?=
 =?iso-8859-1?Q?+wz1z0XYU/mPx17JDphZaG7RkYlt7CQQ0SHVsJ484W57CyrICe1fLrp0xh?=
 =?iso-8859-1?Q?22YYrFHd9bfjxUE6JESwBqQZBOPtX+dL0h+F9MjGAN8R0Eo41kRYZR8oaL?=
 =?iso-8859-1?Q?yBWqe7QcT+pJGleF/lzXmkp8ghK5tIpbSBzuDWj4JV4q0AR1Rc4ZixADjd?=
 =?iso-8859-1?Q?cYMUShLXxICJOwKw6lbBgck9Yr3MuOyYPEfRweaFm/iGMek+wTwSCsbJuk?=
 =?iso-8859-1?Q?I3zcjE505jNph+jzRENxwKKwXYib4w8Z/kjQ3KZ0wdYAAGm4pK5CkBGPBH?=
 =?iso-8859-1?Q?Lq1lmHCLEs6dhcovLCcPa1NE8uPP+KSU5cshyT8Pt15+Z6zKd6Ql49creF?=
 =?iso-8859-1?Q?tU8DnYk8Wx5epE2s0ZUl9LkdXzlOhXa6Q8XpA6SO9sz0lDR+IeQhxK6sA6?=
 =?iso-8859-1?Q?mpbw5lcP+2/JFO2MsmC36qpI2JcpUfxqlqDznhIncUXkV1ecDWceoVUkfI?=
 =?iso-8859-1?Q?TZSlo2LnXWABzq1+bRvVV5WOnhLZQh6d3s8OiMjIQKbisTgW614Kb7gvRx?=
 =?iso-8859-1?Q?e6ROBoY56yELM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C9574D558A7CB94F8D072276CBF6984C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655af769-e08f-47cd-2f2f-08ddd49a4182
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 03:35:14.5233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WS3PprTymW1ED2hs3vPczWtDSbDeXtlw9fxhW30K5eQUj3RdeggS9q/c2fOTBZCCg60m+g0ji288gfrInoxhbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3

On 2025/8/5 16:43, Jan Beulich wrote:
> On 05.08.2025 05:49, Jiqian Chen wrote:
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>>      return 0;
>>  }
>> =20
>> +static int cf_check cleanup_msix(const struct pci_dev *pdev)
>> +{
>> +    int rc;
>> +    struct vpci *vpci =3D pdev->vpci;
>> +    const unsigned int msix_pos =3D pdev->msix_pos;
>> +
>> +    if ( !msix_pos )
>> +        return 0;
>> +
>> +    rc =3D vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=3D%=
d\n",
>> +               pdev->domain, &pdev->sbdf, rc);
>> +        ASSERT_UNREACHABLE();
>> +        return rc;
>> +    }
>> +
>> +    if ( vpci->msix )
>> +    {
>> +        list_del(&vpci->msix->next);
>> +        for ( unsigned int i =3D 0; i < ARRAY_SIZE(vpci->msix->table); =
i++ )
>> +            if ( vpci->msix->table[i] )
>> +                iounmap(vpci->msix->table[i]);
>> +
>> +        XFREE(vpci->msix);
>> +    }
>> +
>> +    /*
>> +     * The driver may not traverse the capability list and think device
>> +     * supports MSIX by default. So here let the control register of MS=
IX
>> +     * be Read-Only is to ensure MSIX disabled.
>> +     */
>> +    rc =3D vpci_add_register(vpci, vpci_hw_read16, NULL,
>> +                           msix_control_reg(msix_pos), 2, NULL);
>> +    if ( rc )
>> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=3D=
%d\n",
>> +               pdev->domain, &pdev->sbdf, rc);
>=20
> Here as well as for MSI: Wouldn't this better be limited to the init-fail=
ure
> case? No point in adding a register hook (and possibly emitting a mislead=
ing
> log message) when we're tearing down anyway. IOW I think the ->cleanup()
> hook needs a boolean parameter, unless the distinction of the two cases c=
an
> be (reliably) inferred from some other property.
To make these changes, can I add a new patch as the last patch of this seri=
es?
And the new patch will do:
1. add a boolean parameter for cleanup hook to separate whose calls cleanup=
(during initialization or during deassign device).
2. call all cleanup hooks in vpci_deassign_device().
3. remove the MSI/MSIX specific free actions in vpci_deassign_device().

>=20
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -321,6 +321,27 @@ void vpci_deassign_device(struct pci_dev *pdev)
>>                      &pdev->domain->vpci_dev_assigned_map);
>>  #endif
>> =20
>> +    for ( i =3D 0; i < NUM_VPCI_INIT; i++ )
>> +    {
>> +        const vpci_capability_t *capability =3D &__start_vpci_array[i];
>> +        const unsigned int cap =3D capability->id;
>> +        unsigned int pos =3D 0;
>> +
>> +        if ( !capability->is_ext )
>> +            pos =3D pci_find_cap_offset(pdev->sbdf, cap);
>> +        else if ( is_hardware_domain(pdev->domain) )
>> +            pos =3D pci_find_ext_capability(pdev->sbdf, cap);
>> +
>> +        if ( pos && capability->cleanup )
>> +        {
>> +            int rc =3D capability->cleanup(pdev);
>> +            if ( rc )
>> +                printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=3D%=
d\n",
>> +                       pdev->domain, &pdev->sbdf,
>> +                       capability->is_ext ? "extended" : "legacy", cap,=
 rc);
>> +        }
>> +    }
>=20
> With this imo the patch subject is now wrong, too.
>=20
> Jan

--=20
Best regards,
Jiqian Chen.

