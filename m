Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571BADFB41
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 04:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019599.1396214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS52C-00023z-7n; Thu, 19 Jun 2025 02:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019599.1396214; Thu, 19 Jun 2025 02:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS52C-00022L-4i; Thu, 19 Jun 2025 02:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1019599;
 Thu, 19 Jun 2025 02:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aO=ZC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uS52A-000229-1T
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 02:29:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40e9b4b2-4cb5-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 04:29:42 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 02:29:35 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 02:29:34 +0000
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
X-Inumbo-ID: 40e9b4b2-4cb5-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceTww7p5PN/pWFX5c2/q4kkoSJsCPUudYfjAe4qcoQxkkKk6b6lgPsZzXr7t8ulmZaPZ2U8WK0ESf/l1m+DirA0fuX6tkyJVojOwMwZH7v7vsvEH9EBI66vjshT0rf9yOSTRnlc00DFwc6pRYhMAD0u4Ep1NruUEL/ZA8nOCENA6sh3Mladd+y3WV+9PNS7QpxeUjVrJ0QHO/6GtTK6gHEGXu5YPLKoxJm0OaP73kU8VkityKsTxPBzS2oTtAZ1FYV4tf/AfjHMtPKGwSKd3BpQyYyS0FoAvJUwqTZueNGyE9XZ1ZCXxbwS+tQDrTaAJm2L16SNFaAswxCcLHNvX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlK9si+JYJ+M2ry0Oz6tLH4rxAx2vknZg8hY8BAJrTk=;
 b=JCJ9hs3sFyRY4SrgxESFAxElyUvJT0sdf9wTGAERmDnqN0FJLzp1f9mCSmLKAM0f+D19O2bc/BV07d7KiovrAzH61XkQpGgu6eqRNkD3uJZg51a1clpGWaXUd8pLwO4Cs39O8Jfr2nIsHtWmjPlnSGp7KMEpcfx24RVgukMigIMU/5VJMgzLZsjRe4fcco3EJRbfQSCAyaEdqWt505Ss8diNimDoch6E80eACcUGMmCvpjebo6HWvQ1Lhh/BJuERwTrr64tAAiMUZZh++NtOb2CT/OA18d5411k+skgBVRRTksgtJAv+GHqygYQX2lx9z4+h6b6dsOjrA/aEBHgX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlK9si+JYJ+M2ry0Oz6tLH4rxAx2vknZg8hY8BAJrTk=;
 b=qEtcavQpqL0GkaJblKTbGZgfj3mKrxNDo53uVDCuwC1ljHkrPWAmMVIVWwZbnreaexfBP7x++bAO/TbnzScCeJQFTR9y1kQ098L5RAHtpVicdFHKfPiGB7MUCaNhzwuJliKRKvAFuQ+B+IJNV4ShsCuthADi8Io6Vpgr463nCUI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Topic: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Index: AQHb23yZHYwoBN0glE68BnOedByoqrQI+ZKAgAFXGYA=
Date: Thu, 19 Jun 2025 02:29:34 +0000
Message-ID:
 <BL1PR12MB58492A07F1E9491B1F8D8E00E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-2-Jiqian.Chen@amd.com>
 <669877f5-ef34-4552-9cfc-e097d40d444a@suse.com>
In-Reply-To: <669877f5-ef34-4552-9cfc-e097d40d444a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB6000:EE_
x-ms-office365-filtering-correlation-id: 7adf9ba1-2bb8-4556-7990-08ddaed9215b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WzK8DGxgjBWtZHIukUttJx5EucWR/F0tWpp9x3s+zKwUX1GchjF2kGzLFf?=
 =?iso-8859-1?Q?+VwbQuzPS5dShCfo2UQKWCliO1BSp/wTskAI84mRxbFU8fnVnEqBr1ZMeU?=
 =?iso-8859-1?Q?Y6kwz+okgMfQRni2J+Z8Gp1Lh6mBqh6elPloXuDqRuQ0XTnDqncmiVfO+F?=
 =?iso-8859-1?Q?3qk7gQXl0K9a8mSxjTVLRYYaxqedj/47xW0ODBCJDd7vNNv+jwU//ySNJP?=
 =?iso-8859-1?Q?OoSM/rcQnBziapexYonmYA1tknQB6cdbpqbDQdbar7foIXViR3q6EZUvmv?=
 =?iso-8859-1?Q?2UpCKNncwI/ADYcu/04bliwS8M5kTWgyfLJFk+B2oK9LNSdFSfYaIH68NE?=
 =?iso-8859-1?Q?lqFJyYvyf+xpGmtSbwErgyWUVzl9dXFXeNrgQMqYVe5wTdLYPIpNRVB4LK?=
 =?iso-8859-1?Q?e0JoomH3R0xD7jBlIMooTkL6tFvyUfASPjOg4snxgi8HzrPZhMvWZ0L/b0?=
 =?iso-8859-1?Q?on8TWuCR6A6CnS5WdrJSsLN9o3uUNpvxJ8TamV/uRfmQ23+nPEdOP5M310?=
 =?iso-8859-1?Q?LCnUxweSnf/o7m7LhhlN9w86MCscu5Ce2kpkg/QFYWxpE0Du88y5Mi+Kpw?=
 =?iso-8859-1?Q?o2ApmL14+mTIjgPXEljc1ILhh/EpgDboZDn4Ad274BdAx8KkFZdtXbqfHI?=
 =?iso-8859-1?Q?Phn2Zm9NY6wJnZLIu1r1LtcLVr4NQmMRAdN8llNZgc26DdoLA+Y3FqeRRa?=
 =?iso-8859-1?Q?QqFdlwDoThvtvl0mGvpEe7KHQkhIoeheMdLsFED/iJodHqt+GRGsB4Ycu1?=
 =?iso-8859-1?Q?DFSoyXAuC2ynoY0ciSybkrfkNYXwGf5KpLIC0kCAimgUCqun8cKHiIDrtn?=
 =?iso-8859-1?Q?iBTbJblubazzVmZXTt762iZOSSqiMgF3N3YB3BCU5VphOQb3XTqlbi9Hus?=
 =?iso-8859-1?Q?BGW60jnBbEbaUhZICXbjYlgpfZt51EpOtdGswimA2DiJjUMwK5Y8OMMKcl?=
 =?iso-8859-1?Q?ARjWPPTrBwj2vKr+WpwHX2UD5y8tilIU0o5+ORRT+SB6NZwAThuG5yW2GI?=
 =?iso-8859-1?Q?HWNKl4FGZb5kpZjh6y2S/qAvSRiucdBicrIX+fVwa7oVyksBEvFAm2q0LZ?=
 =?iso-8859-1?Q?oM+W5a4UfIWNpZfdVbzjRlXO2HZDL6HlP19pS/NHqTgqb4IFydgVLCxA4J?=
 =?iso-8859-1?Q?mHc5QZU2rF8GjHgmAcwGG//BwU0j+xRCVDfOy9/+dOnanhk4Ju6V2WdWCO?=
 =?iso-8859-1?Q?uD3bgPtXZ7WMXmWHZRfpgakcGwedIXkCoA4GMmjbCF9RTlW8MqZ9TcFTGi?=
 =?iso-8859-1?Q?/NEB+d292cYDcMA2sICmPLMO44LbtWB3iQXDC2XYiheV949mtfFEOvDqWN?=
 =?iso-8859-1?Q?QbNuWkpf3w2gegX+g65S04kXMsztESOEhwBLq7GZYGmKSDhTVjSMHJ7Qvy?=
 =?iso-8859-1?Q?0RW1Q+olRnXKqDEB3vEW9Wv93xCt1K6DsBFXGfOBzsvw4UgDmGP35qZzeQ?=
 =?iso-8859-1?Q?htg6IHjzs5p9ExLiQuTBiIN118PLB/4aLP+uhKVMFUR2zXJ+gfpuSWJ6kS?=
 =?iso-8859-1?Q?avPVIeh2YLeljDwDot3nrszUeNEIq1+xX4t/GbzZ4eAw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dukik8L3A4RNGHioRlUUTw8ifyUYEIJFq7OQdMp0lKnX0ivY7ZglG808z0?=
 =?iso-8859-1?Q?R0rn5BN5Bdq9GRKxRem1Ul5MZ4bFbI2cX9jAWQYUkM3qilLVg5uApbshpB?=
 =?iso-8859-1?Q?zUwl/vPQ+xmqy5WzA9IXP15ozc2BBZXrVxAg7rOlK/K0vpu5G9oW8+tPtL?=
 =?iso-8859-1?Q?FihdMlBJRhWjW62Uv1qyErvqGp49oqrQUUvm5Ajep68osbuoZpQaeOg9OA?=
 =?iso-8859-1?Q?UlvAWsYxlEFP7bVe0PRNufLg8VyIw6gk0vwBS9RhLOrHODIDIRtg6X2psq?=
 =?iso-8859-1?Q?Wk186MeY7VKMHHh/G+glZLCCMF0KY2kk8ft+Wipwp1zxfTmPw7JggQ2+JG?=
 =?iso-8859-1?Q?F3SIEtvUqZE87mfsW00xfuld48J5+LXYKeDV1Olj9APCuYQ2kX4Yj8hkGU?=
 =?iso-8859-1?Q?jqCDC7ouwpnLpV4xE3vlw7glg/pd3CLkIvNV7D3YseZALlmm+ZHFVtunmp?=
 =?iso-8859-1?Q?cGGygjFOGqHcwg2V7Hf+LakywiI2zNDwlTYJav+8orMzkYWD7fY9uDctxi?=
 =?iso-8859-1?Q?xZLOzj3cNHqdvehzz5ia5WFUtI86CNBs3viH3YCM1boPtYabPJJBZHEFhH?=
 =?iso-8859-1?Q?XXqk+f2kOEc5hViQ9bZgC3f73S/vPqOxudxV5+jeH2MG+Oo/JIwUpp7X9/?=
 =?iso-8859-1?Q?Ef+gaQcEjC5M50OWP9FMrl6czAVjQOYx6Og4fgX4GCa71Dkdu/NBsdxnOc?=
 =?iso-8859-1?Q?6cuyB/s6uZC0QziPlH6OF/JHxGB3uGru9XPuXmD+cu4dgD+VHYwM8pBgjE?=
 =?iso-8859-1?Q?3NiYWTA1uw1bUi0/mTcVuZHa71n1mSJBdLDF+IwAgfJf5obQXG6Xi3k9Gg?=
 =?iso-8859-1?Q?NVHU/cyXXVJN9XGsF/0OmfJStS/UUGLGQbeVlEfVwKQHbAzePqihP9DyHM?=
 =?iso-8859-1?Q?06ZcxyEqQGc1qZwLatJ8YbgT3dVCQ/mq9XP74wqgZy5+KZkiw8EDNGzyWP?=
 =?iso-8859-1?Q?v2LO+0BMR5j1wBdoOc7rWlWnIh7B1tdYBhXyiGC2rbSyTjR6TeF02WcHWW?=
 =?iso-8859-1?Q?5HcmnPbhQHgd/mWct4oGB0oVNrzjEXlBV6EmCGBHzsVVpeaaSMKPKtKMKg?=
 =?iso-8859-1?Q?pR5QMUM8mMnLmEnbwhRaThQqByibqQTGrRve/bkkHtH1hZwAVZgrmK2JRP?=
 =?iso-8859-1?Q?39EPP8cORFFAJcWif8oup0bPsAVtkjoczQLON6VHUQXN98AWqsFxbrdVlr?=
 =?iso-8859-1?Q?Qlq2C+LSAH7Xi1kFfBZ7YltFWa4raQjYFONl9fOpkVl9lSvY80YKOOkWBG?=
 =?iso-8859-1?Q?uvN4vHYGwlfW2ZQUj7usR0w9GHNuZQkUoT3/xISWdSnFDqe4LNLc4IPzj2?=
 =?iso-8859-1?Q?qm5H6jpNo3HdM1LXLog9w7eK+WdqPikAncAJx6n1xmOLvMkxOqnacvAdWM?=
 =?iso-8859-1?Q?8IMrw8/VUTghKw9Df/m5DVNny9Qd87g9Y/t4tzAVer7pHYzmJLf22h1wq7?=
 =?iso-8859-1?Q?7WAIXLqRv/1++L9bwC/fJcKpHmzrYE8SCY9oLCO8DFS8Yk5VWYAES7WOdQ?=
 =?iso-8859-1?Q?Rf+vKxcIkvJPXy3vaFTjiqWVdM9uwXtqUkDieBctQdtymuMi6nG8ElgjrO?=
 =?iso-8859-1?Q?/nHkUrjXUSlEnbJBVKEVExqXqnZRUvjC5V1TuCnhNAT2BwfQVnkz5buwwn?=
 =?iso-8859-1?Q?LKq1fAvL7IW2A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <450DF7159EDC2448A4C853CC9B65BC21@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adf9ba1-2bb8-4556-7990-08ddaed9215b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 02:29:34.6779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9S4qA4VIpnmXjWl+fvUzhoZecrS0Q3em4xNqRq63goq2eo0pN3CeiZWfc6sj0p+/dSAi/dROR8zOv3mu59eoTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000

On 2025/6/18 21:52, Jan Beulich wrote:
> On 12.06.2025 11:29, Jiqian Chen wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -836,6 +836,42 @@ static int vpci_init_capability_list(struct pci_dev=
 *pdev)
>>                                    PCI_STATUS_RSVDZ_MASK);
>>  }
>> =20
>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>> +{
>> +    unsigned int pos =3D PCI_CFG_SPACE_SIZE;
>> +
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +        /* Extended capabilities read as zero, write ignore for guest *=
/
>=20
> s/guest/DomU/ ?
Will do.

>=20
>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                 pos, 4, (void *)0);
>> +
>> +    while ( pos >=3D PCI_CFG_SPACE_SIZE )
>> +    {
>> +        uint32_t header =3D pci_conf_read32(pdev->sbdf, pos);
>> +        int rc;
>> +
>> +        if ( !header )
>> +            return 0;
>=20
> Is this a valid check to make for anything other than the first read? And=
 even
> if valid for the first one, shouldn't that also go through ...
>=20
>> +        rc =3D vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_wri=
te32,
>> +                               pos, 4, (void *)(uintptr_t)header);
>=20
> ... here?
If header of first is zero. There is no need to add a register I think, sin=
ce the dom0 can read/write directly.

>=20
>> +        if ( rc =3D=3D -EEXIST )
>> +        {
>> +            printk(XENLOG_WARNING
>> +                   "%pd %pp: overlap in extended cap list, offset %#x\n=
",
>> +                   pdev->domain, &pdev->sbdf, pos);
>> +            return 0;
>> +        }
>> +
>> +        if ( rc )
>> +            return rc;
>> +
>> +        pos =3D PCI_EXT_CAP_NEXT(header);
>> +    }
>=20
> As a more general remark - this is imo the kind of situation where using
> do ... while() would be better.
>=20
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -267,6 +267,12 @@ void cf_check vpci_hw_write16(
>>      pci_conf_write16(pdev->sbdf, reg, val);
>>  }
>> =20
>> +void cf_check vpci_hw_write32(
>> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *d=
ata)
>> +{
>> +    pci_conf_write32(pdev->sbdf, reg, val);
>> +}
>=20
> Iirc we've been there before, yet I continue to wonder whether we're doin=
g
> ourselves any good in allowing writes to something that certainly better
> wouldn't change. Even if we limit this to Dom0.
I remember this was suggested by Roger in V2, since the Dom0 has no limitat=
ions to write the extended register.

>=20
> Jan

--=20
Best regards,
Jiqian Chen.

