Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D6BA851C1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 04:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946565.1344412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u34V0-0006fH-1Z; Fri, 11 Apr 2025 02:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946565.1344412; Fri, 11 Apr 2025 02:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u34Uz-0006dJ-Uy; Fri, 11 Apr 2025 02:52:09 +0000
Received: by outflank-mailman (input) for mailman id 946565;
 Fri, 11 Apr 2025 02:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AtDH=W5=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u34Uy-0006dD-Hf
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 02:52:08 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2407::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d9a5ca-167f-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 04:52:03 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 02:51:59 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8606.035; Fri, 11 Apr 2025
 02:51:59 +0000
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
X-Inumbo-ID: f1d9a5ca-167f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au6DZeQkVyNqQkNu5YZvZCVTGnVveurzLVNL851sR0PxA52R9tPDmO99cDj2N9G8ngZcwiLUC2wZMhejH8KWSLaH1ixJbsLq02J6hyAgRYGdzTLeE88XD7OK8C/5f0dmJ8bvPk9QUS4RNCkSrB6fKueZWlq0wqUh+VnVX3IpKC9g4ln/Gt91kS0WcD6OJpJ5j6uLMnj0lCqlb6mSA2wSS9fhKXPnDVjss3kI6CYyPDhTJ1xurxlpG0asPtKMqIkzKiBkp4zO8zt9jyBD9Xy0MIyrAmpmabCKP6FWVH8RGz3KJzXebaWPLRCUaKDw2i39Rd0osd9MF+Y/MyEpU1bBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ux3IHsZSUN/lKueQAl7xlfT7DAX3r4VFyjFzr+ipY+U=;
 b=v40Q7o34SDO4WlA4s3ap80Wu7sRFYsqaTN3x08RqZpuV8gVLZ4OzaLFiII5yIxsP6vlIpRUdzYtq+YppopD6LTaUl01y6TMR9T0SNlVjiQIPshVYle3LWTo9QcJ2WtI/DC/baBxTJkeougVKWPVLuqwu0lfRvpaYU89LyHxBEJ5ZEHYEsNTq5hAXqlcOXMFKGYBQyOv/L94QGhZgUmzfB6mEDBtcQ6iO+N1ieFSeXTneM19CwxCV2nWY7GXvFJ/0CP2Kr2v3Q5GHkPertzJduE+9D8/ScU7aWgKwE6UIbf3zEKWW0PwI+/QpxlAnqKiNs8RDRXgFJlOBWdQURHT+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux3IHsZSUN/lKueQAl7xlfT7DAX3r4VFyjFzr+ipY+U=;
 b=wjn7/pwAyVoGwPpw+8B2CvuuRsJg62kp6YT8UTpeFhnCakxqugHta285z9aqDJ/yZm+xqsQU6bzvh1W5FwXB9qC0XyN47l3ZCKrjSuSsx+2Ff4LV/eoi9AnE6t82u6hon46EV7c9wI4L8ppErPo3+CqzcfK3jthMDquzXFrsg3g=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/8] driver/pci: Get next capability without passing
 caps
Thread-Topic: [PATCH v2 1/8] driver/pci: Get next capability without passing
 caps
Thread-Index: AQHbqRsYW9r+TjshqU+vmdXYCVrO/7Oc16GAgAFv6YA=
Date: Fri, 11 Apr 2025 02:51:59 +0000
Message-ID:
 <BL1PR12MB5849F5E86496802914619F5EE7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-2-Jiqian.Chen@amd.com>
 <5a18ae61-3ffa-41d1-aa1d-dce4d3ca0381@suse.com>
In-Reply-To: <5a18ae61-3ffa-41d1-aa1d-dce4d3ca0381@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8606.035)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB5761:EE_
x-ms-office365-filtering-correlation-id: 8ca040a1-b876-4a88-602b-08dd78a3d47f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9ghr3DaP6l3Jp/YfIG+r9EQgUrci8pOMthOQBkMkv3zAaOrvQXqCs73wqM?=
 =?iso-8859-1?Q?H497LzyrdQTUvlylHTeF52k1iDm34LtJ5aWL/O2VQ1ves+5VVfnW0drftm?=
 =?iso-8859-1?Q?DpTy9oTPAzTmI+I5vlWZ1DRs0Ms6IvrFe3N+zqC0xdkhvBgkTiabAsSu4G?=
 =?iso-8859-1?Q?Nws90cKQScsYoEulYRGH8jUiWhsIGr7NByzup0P81PXG9e7H5wGVseZ7tI?=
 =?iso-8859-1?Q?S40CoK/EyoUutw/stXRpzLUo1Qf0CzBai/Ec5VJa6P9eAGoVWbojW+AmOd?=
 =?iso-8859-1?Q?mB5n6ypaCTEn1UhvR/Q7nyRkbLJbSFAuTyTlcaGw2NuQh0iiJ7fYsYtXzG?=
 =?iso-8859-1?Q?V3n6LbRa5mNtiF/aRCzc9sw84MKox1ysYXOEbTzonTk8ehdTJ0zHUemK28?=
 =?iso-8859-1?Q?5TxVB90mUWl5EO2Z3qmysgoBNmnhIYMzxlRLXOsWXgK2EPzkXGzvUvRkS+?=
 =?iso-8859-1?Q?c+t9HPhXgXkkGZEtT8RvFnnJY/CT1Gr5tNq7d7+ZkZCmefwRMkKzihJVUR?=
 =?iso-8859-1?Q?5tAEnVQT7OQcybCj4BGqv33h1a+tazWBqOfJBKe+ji/L4yG+gGuauRxUpc?=
 =?iso-8859-1?Q?b3kci1/GWaPtXALgGRqPr3zbLFiwG+hE9NXzH4x+mgMM6jpKpXSycLZZiL?=
 =?iso-8859-1?Q?58UwyMlUIFLBOXM8N8TpZJf7rZjHdaax7gbEg9JM6lAg8YcBb9Jw5Q77E0?=
 =?iso-8859-1?Q?I0lWJQj+Yh/EkGlwcFbqSVy+uv4fTZSIaMM7GCXsaM9e2KcRdlCHY68/ql?=
 =?iso-8859-1?Q?TE/s7kSuQsCLzvoRWUOIHlv2RKklYzJszclAcKXJaw/UHwdgbes9bTFVjX?=
 =?iso-8859-1?Q?tVl63HflH4kLt9LnOM9Q6fp1wJnSY4+U6kT5onKXdGfrl412zSsVyop9or?=
 =?iso-8859-1?Q?jI357/Q13ZsYYTuRQU4Fy8tp59TPg7xK6aXB1Wg8LmvZ3mbFaPkhN8rx8C?=
 =?iso-8859-1?Q?zWRzBnw6x6Xta+durm1YHiORMaYxihHhTEEXePa6/jWZZ17fvziflG0nia?=
 =?iso-8859-1?Q?O8UHjm2bNNh8vLnZ62utDxEe2GKf56AJYsfCKg883tUlBUY4VvCC0RKODS?=
 =?iso-8859-1?Q?XFeJ+04j4/L08xRg0iEzv5cJgTsaVwpOFL/nCSv4KepazEPG+XPELQfQeJ?=
 =?iso-8859-1?Q?nfbwnj5orCa77a5KK7sXwKyOmUtM7nwCFVQizXhSBoI79fUY5/QA0jO+H8?=
 =?iso-8859-1?Q?56CsJNQr/Owc1V08+vR9WDlb/JruYYzQE4YpTra0adAsbzXy2sh1wpL0J5?=
 =?iso-8859-1?Q?g7mLrx1/P0zU8MfKIpPE+ykdRgSq6XLCnkNEQh3UvBEW6k4tvVimlUOmqK?=
 =?iso-8859-1?Q?1JiSGnfdJAnUFVEl82WY0GIhWVTqkSkm2ENFzFxwSSrb3ehf7DPWON/l1h?=
 =?iso-8859-1?Q?hxAeMkoJfnR14Nj1Fm24+0enqW0W6eqpXGmA+UnvioD5EEG8MxcFExYzZm?=
 =?iso-8859-1?Q?gxuVhYRE0U75MD3nVSe+LgOOBdD4DnuhkML9s6Dd4Vr5409ZmaVPAn3xOj?=
 =?iso-8859-1?Q?Eaas/pBOrivDxKuBlrnLV5O0y27NEN6c9oXH/J5aODRZnPaDHdDomQ4nYc?=
 =?iso-8859-1?Q?lpskkOM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+NvjpL1zt6HRA3bLQnDsiN3P304pIybPpDGHPbH/B9np3Jt7YCMA57iySj?=
 =?iso-8859-1?Q?M2scSU4Bxh5K8jHOGQMwJA2ptopUdUX6NtCDFQMbZkOIR5ut7Yiq4Pb+wF?=
 =?iso-8859-1?Q?hiP5cGe54UgHfc3VXgwMU+bPTqhaH9peSHJZj0LdR4za5zXV72mMZhiwjw?=
 =?iso-8859-1?Q?XZHny6RSE0Y31PgII+607j0dZmPe2f0eDNXt6u5EfibpmWhVoZKGr/3oia?=
 =?iso-8859-1?Q?F5gb/1I+L6LhopU/58oMEs8ml4ice8bVSG+b1KcdgCIT06Up7jyBS6+54p?=
 =?iso-8859-1?Q?uxA+Ybb/3wuLTzT8ZDYJEyFZuR4JCtvwUHMC2QnKcjgmcEQfbXHJUpFcZL?=
 =?iso-8859-1?Q?iAmgceXeqOq+YLy0WnpmIqYs2j6QtV0GEE8vJA6j9JJMx6yIRSQMWFZ9ir?=
 =?iso-8859-1?Q?bDCNC99qQMvCH0GGmsjzVoGx3pmPq0UgFLKhVNbuhLOvZ8MLc0BLMLA9RA?=
 =?iso-8859-1?Q?lr7eqVXBtDheM21gJSSGzt0tv8doMHerlZ3FnF1XAsoTu8fjwSuVAEo1Bo?=
 =?iso-8859-1?Q?pet8DQ8VH2+Oe8kswhhavcspXXXvahOl5OeSDt4I5STpHN2PGmiaqix4AU?=
 =?iso-8859-1?Q?z/qiYinR8mfJpIVRHzWWO2Omjiyi5UNu0JrU859sZMrXNSVQqbu3btjMz/?=
 =?iso-8859-1?Q?+PJQ1q4LdaLYI1vQXnZCZleCSmSuezN1nLv0UvauCk5PaAlgYQ8o4CzE1G?=
 =?iso-8859-1?Q?wrmsd1jzuAPGfyMaJ//V4Ga7cSDgyAa0d+7q9MGsQPTj9cQfrSQwaTpEDK?=
 =?iso-8859-1?Q?/1DN/LCSQX+X9JyNsShLrWOVbLq4DBERuQYcsBOX7kF102PfoZRx6Yev8V?=
 =?iso-8859-1?Q?HbG5dC8JA8rGTJXukgflAj7dF+RNjjwCyUIrn2V6n0nJfAd3MjgTV9dIKD?=
 =?iso-8859-1?Q?ve9XrHoNU19hdEQoT6aQtdXFDzOBy2n8ZCNl7QlPRbn89cX1WDqC6duOVt?=
 =?iso-8859-1?Q?Dnnj4Dqo0k0BnpSqKw4viBiGBHHw/G3e+6exMTUYp5UwkOfeXUZxlpVJdf?=
 =?iso-8859-1?Q?43EC80W5L2hb89W+nPtAvP/4cEYHHHBh9Tiln7Qzam/ND/z5lBo8WvK5/a?=
 =?iso-8859-1?Q?7Jdwu5wUEGe2CFLa1KYJaJEpQryBn9v6L3BL3vGsjpECmlhyczFtx7momR?=
 =?iso-8859-1?Q?yLKQ8xQ5llwj0ySuWr3uAbXdMgnVj6DVb9S+Lk+7qdFJLoHAgw3i7OPshT?=
 =?iso-8859-1?Q?E6ZIVi/W1OVq14viKDGdVobpcMRjvwK66sOzeuBWcnprXs1dTAzPJwYvmb?=
 =?iso-8859-1?Q?A3aJf/jfca32wHstu5dBjhuchK/tMMQt8z+JMBlGIYqaCQE1SWs4NaAZcH?=
 =?iso-8859-1?Q?DIrR+5EGihVrUG060+4OzTCwsQHq/R9pJ7ok/Vrasq9iqiTRn7VFl5O/du?=
 =?iso-8859-1?Q?+SbgbRgJ+XU347T1LCt6vfgcHS0Z+Sc2D6yIJw/5ubLSVMet5LKDqNRF8U?=
 =?iso-8859-1?Q?Gp8O/M7BMS9pzmgJ7Ivr6TfzZgZdsmIjEa016HJFns52pwSqGX2a04dItL?=
 =?iso-8859-1?Q?0NwOeooBCp+Co/edDO4FVBfLdiP1ppcdLSQnW2uRztUNGPDLW6YU86g6yi?=
 =?iso-8859-1?Q?RbszBvC0fqNYakTIgTglVgmsS58vrJIiwH2r+EEmu5jgTsAGljNOxtuGy5?=
 =?iso-8859-1?Q?to8jEazu/USgA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3604114147EA4848A9D47613A7A5E439@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca040a1-b876-4a88-602b-08dd78a3d47f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 02:51:59.6566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 05Yu870AmKDaRNFBP9n27EZ2SKpABJfB19+D3BfOXgrZekcUsNr4z1iirnB0MTDRfZfIUuw6yAew29ptZtgtPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

On 2025/4/10 20:34, Jan Beulich wrote:
> On 09.04.2025 08:45, Jiqian Chen wrote:
>> --- a/xen/drivers/pci/pci.c
>> +++ b/xen/drivers/pci/pci.c
>> @@ -40,7 +40,7 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsi=
gned int cap)
>>  }
>> =20
>>  unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>> -                                   const unsigned int caps[], unsigned =
int n,
>> +                                   const unsigned int *caps, unsigned i=
nt n,
>=20
> I don't follow the need for this change.
This changed is for my next patch "vpci/header: Emulate legacy capability l=
ist for host".
Currently, vpci only emulates capability list for domU, not for dom0.
For domU, vpci exposes a fixed capability array which calls "supported_caps=
".
My changes want to emulate capability list for dom0.
I think vpci should expose all devices capabilities to dom0.
When I emulate it, I need to iterate over all capabilities without another =
fixed array,
so I need this function to return the position of next capability directly =
when passing a zero length array to this function.

>=20
>> @@ -55,6 +55,10 @@ unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, u=
nsigned int pos,
>> =20
>>          if ( id =3D=3D 0xff )
>>              break;
>> +
>> +        if ( !caps || n =3D=3D 0 )
>> +            return pos;
>=20
> Checking n to be zero ought to suffice here? In that case it doesn't matt=
er
> what caps is. Plus if n is non-zero, it clearly is an error if caps was N=
ULL.
Two checking is to prevent null pointer errors.
But as you said, if checking n to be zero is enough, then I don't need to c=
hange the definition of this function.
I will change in next version.

>=20
> Jan

--=20
Best regards,
Jiqian Chen.

