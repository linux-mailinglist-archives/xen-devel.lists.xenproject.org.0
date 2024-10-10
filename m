Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BF99804A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815805.1230022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syojT-00070G-Ue; Thu, 10 Oct 2024 08:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815805.1230022; Thu, 10 Oct 2024 08:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syojT-0006yh-Rh; Thu, 10 Oct 2024 08:41:15 +0000
Received: by outflank-mailman (input) for mailman id 815805;
 Thu, 10 Oct 2024 08:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fZv=RG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1syojT-0006yJ-2r
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:41:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2414::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67895ebc-86e3-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 10:41:13 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 08:41:09 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 08:41:09 +0000
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
X-Inumbo-ID: 67895ebc-86e3-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYmIST2+zVl7POHU/TB8rEBaT/p48d5aJ+Z2NORcTc0y7fYuuG3/pknNGB7BlCDdLcu4K7VvJ3CXrthuo9fwWjzqLb49CZrx0eifBGRXhXdlFEdERfpfAFUfZKHOpRxDh2viLO+qVkwlvMtv1kpxr9cSplMuEvaLsjUPyrQptMZ4xo194UC9Q+Z087GnBSQuOLd34WzwA8yfDgNn3GFfKwBsIt6OeyWQ4WVRpVpxXb0ErmUULbQ32X4UOAIUHG4VeKYYQhC1lcaoMLM+eN2Chn3Gb3BOGgyFznqgZXtdUae80fu24OoySsYBTCvAn3U+08jlYlpoyFhxzy3kQyFInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg6wvMKY4j5BZkgnHX7n7GYoZI23XClvF+KHkBr8r1E=;
 b=uuQG3HwA0kxVWJZJkzpNl+z6Txh3chKkAfQrlxaEMSu7XiGrcR7KFbElTVFpOA1W/47fd+FMF6TOMFFzdXJi1AbLmadD1RgOcvBu3kCTyxkJGz7uFkRJQmv6PqajNNtIkpWv340HcL4MvrXgqCemq6ktsyz/m88xPScchHgWsU4zmY7rRwoNTKaa4M+0LY6i+ZZIQLxUMu5/1SwFs1IPwSQPWTQM1jB4t80QoXMhUibGOqmiRGhqLaRuFkHrzcSdoTU9dh39PSgXLvwkSmJ2dDOHzBzbpUnQNVETMsQnfuBOUmxvnGxj8Ii1DKtgARa3XZM5eZTpvUQZQ7l6wp598A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg6wvMKY4j5BZkgnHX7n7GYoZI23XClvF+KHkBr8r1E=;
 b=x3TM0OSe4a0a4reNMGw8jz9nWEUCNLXr9uQOn5YS/R4FoBb1ud0wSWC/E5TnUZwsCLpQGSjCD99x9dLN327FtX0k6VtVwSS0ybQZYRCuTp2fPMXiFZjrtU/FLsZfUHuN1uMNSoJu/6AMcs/+OAir8E1vSerkH/4sCH0SbtSwitE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
Thread-Topic: [PATCH v2] xen: Remove dependency between pciback and privcmd
Thread-Index: AQHbGupfp7VkZjmg5kywfP9O2WdcyLJ/o+wAgACL5oA=
Date: Thu, 10 Oct 2024 08:41:09 +0000
Message-ID:
 <BL1PR12MB5849298F820763B42CA7A34CE7782@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
 <e6d4912a-d6d0-41f8-a3e6-fe3eec6c6807@suse.com>
In-Reply-To: <e6d4912a-d6d0-41f8-a3e6-fe3eec6c6807@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8026.020)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9196:EE_
x-ms-office365-filtering-correlation-id: 8a29f465-d556-4a54-e2b5-08dce90749ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pSPXk9SvvmJGwVGhuE2cy+d3xke4Klx0iXaq7CVQyjiKLKX2SZcwFOe1EG?=
 =?iso-8859-1?Q?V1CyLYN2qis4fr+wfiLVU3rIJSL17/nh+R+WQdJx8LlknaBi3O5N7eM7rI?=
 =?iso-8859-1?Q?g9sru1+lbR3RTr/1K0ZO5InXLn1I/ub6WUyIUPftecyJqkCIt+pIAVQJuo?=
 =?iso-8859-1?Q?f+WGhubQHxqv/TcETrYE/2npRcmKwBtkG4sRFrdkc9eQjgaWwBD3+t6iTW?=
 =?iso-8859-1?Q?cjFjh1kGNERkmDarq2gHccdLtvkB9+S3OFLV64mo4RZ8gxm4JXDtJyBF8y?=
 =?iso-8859-1?Q?KOsEKDhp7AEtLusCRQGNBifiyVMFHYzqQ4tJ98IFvz5Dea3q+mANjVTNrh?=
 =?iso-8859-1?Q?a6yGtk9OLLxHmnrdlhxS49nJMk/PZVKQfXRiTp8JOZF54Zlp8apBZW0wb6?=
 =?iso-8859-1?Q?FBXbFC1wlQGnzVXSeOJ9qd0IJGSOIsq0I9mIZW6WiBGHVtmc/WfSCpFCMs?=
 =?iso-8859-1?Q?+Quo7vCmXmgCuId2c5pW/H62Z6fs5KoaC9yQKVfij1qqTEbQxy1/IEBHT9?=
 =?iso-8859-1?Q?TkBrQ/Bzd6xasSWCw+2IuW4YA5TRtRAf3Do1839/UT9fSI56GVT80Axked?=
 =?iso-8859-1?Q?g+aQ8KWybb0w7R+Uq/S4rU9+bwmKWCGfZ/wntYNZGqRZ9PpkU3urTtBNpl?=
 =?iso-8859-1?Q?FfVuv3QvQsNlzHKWcRxxwdlJ3q9ah30BAhupKeyYJMVNYkVfm21L+vjZsS?=
 =?iso-8859-1?Q?LD2LgAw8qgcd9jOkstKUbTFJvnNohLsK8RQJSk92qPEktJ8I0Pk3dI+LzL?=
 =?iso-8859-1?Q?dq+jy3zpRjLfQ13+gvBIdpzqxg80GWHUBE+sasi2d2pfJ3tUyTvysLD87p?=
 =?iso-8859-1?Q?5sTQXbWM1/HbzcJVw7mTuEIVyMIQsZH2JJ75yWxS/I0olgCPju/8iLiedK?=
 =?iso-8859-1?Q?5P+T+ssLS2Mf74uzgQMAh7/G6kvh4urIN5amgZdDVvlaMbI954v31euk3f?=
 =?iso-8859-1?Q?LXYPcpwJeQ56Jrc7XJXIGbUxwCj12vpQ38HVJtTRaEo9+bJqfN8cMSo+n9?=
 =?iso-8859-1?Q?EVN5LElCnhZrGe8271Mw5QjAsUMkowG6zDHJPxjn5LIMQiZt8j+vT56hCM?=
 =?iso-8859-1?Q?uPloJXy0422w0ItaAzDe9TsWkBPbZBMSB9iQYPDggJV6eSqVaYGltMT7Sn?=
 =?iso-8859-1?Q?P2UYw4JBP1ELerOggsMOuCrpCRPTTZOhpgXelGqCzunXJed7bnm+hnOMUE?=
 =?iso-8859-1?Q?JHoHl91JzClUUySfKSERTOdj7ZwHRd0NVdech7SLC4OIDRwrPD8oujXB90?=
 =?iso-8859-1?Q?K3KTSXZSfA245b2hjGCXLpDndB5o6+YAtrxrNk4idFuGwJAfIvV0rjpN6o?=
 =?iso-8859-1?Q?TL0IWIUcB40+1+So/zf/zlKVCZLdItEzGmpp5xmcEKw5yptAzBwY0oT3Yo?=
 =?iso-8859-1?Q?bB4MjSD2BUSSe5f8+FAptKqdWyLGhryQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?33VpxohqwM7VyH8H/JJ4TXY77RBZXuijAkvaLcIzgqiUMUABPGPb4lzPG5?=
 =?iso-8859-1?Q?US8KtSpZQWR4Xb4MrQSdK6/8gnRsYWlGulaeQQ3cRLEI23hC3JHUBCG6bB?=
 =?iso-8859-1?Q?7WG/i/Utlf/sMUx9YG8Libho5SCT/9OWbyT8YSSW7BtFmB79ASlYI8j/XI?=
 =?iso-8859-1?Q?y9NgW5T2B7JKc1neks0/EAWwMHzZK6XIO9AGnewx2N7pInaEmctCYBlvDl?=
 =?iso-8859-1?Q?w7GCQ7vVvH9RwW1avVH0LUkaiZdaUwVOksxH1BF13o/oFAgVHxIkuJCTvN?=
 =?iso-8859-1?Q?w/V2eWTJB/lGG3S67cjbmtXYO2AeSD8yDwTKZsUcvM0+zDnkWV9b+ynpEv?=
 =?iso-8859-1?Q?ruIwkIKg7u+hcy/CV4BgHxnXXvWJ/y39mFk9QZXCJpYIWGKeANDZIHM4CZ?=
 =?iso-8859-1?Q?ZJrIGlzfpUfa8Uzk6VvxYgp9+IJWDHI5XS3Opr6uCBS+7Za7QSfrtpXsNT?=
 =?iso-8859-1?Q?978r7rc60jLqI6ZER98zTRb254pbI0OPlquktxF55Zke41JkDCU7qx7P+G?=
 =?iso-8859-1?Q?IxOHik9aiNm4843qxwrnCd+ea66ISwU1I7VHQ0WsuD73u8h9DDzZwYe1Ds?=
 =?iso-8859-1?Q?ua4tSwz7eCv+IOXG2GdEHLNVojFLvEjduQahr2JZ09Zp3BiiEPfh5/5YKs?=
 =?iso-8859-1?Q?DAC4f84cCDyjiYkxmti6lT8vAafYgY+VK+0urIFwQ5lVAlkWqgFfvfQoWR?=
 =?iso-8859-1?Q?GnjbJvNgLbAxnGS01DERIrV+Wy7mX36jneMHJpr8mE+L4hocSdviMufRT7?=
 =?iso-8859-1?Q?ZJ57wE43F/v0tQbEHAljfFheb/EThcR3NGjnz75Mgd1ARlSoeFN7eq7luh?=
 =?iso-8859-1?Q?XQEKJuUBM1VxPTdnf9Hs4A97MnBByllb3e73LM3yH2cbQ+lIumzWIXBIa9?=
 =?iso-8859-1?Q?pB32Do2+z7Fk8+RtNbac4TpHID0Y7pVQy3MmK0+rdQM55aE10U7C49CfA5?=
 =?iso-8859-1?Q?fP6R2GwexmJquMpIGIc+s2AeLee882fCQaZUzcVbpUAXOUtHVdp5yEWHfE?=
 =?iso-8859-1?Q?ga55f2g/7+4O/p4YIOxdPFHwT4bBE6lHp53DFKQtLXpLmwMHagj2IKYqpF?=
 =?iso-8859-1?Q?87nGSNrpA+/Bw2MebNi+G8d7VsRByNqHaIZhtHDBsjwozDsnLnqDKcSEdo?=
 =?iso-8859-1?Q?PeTE9CQYQYxZK2TZvDiwQLK9v2g6R4UTzxmssmOwFdOewQ5YkJljwmZRoV?=
 =?iso-8859-1?Q?phZHT77wcA3saUA/z6Gqywd0GV1Fly56drECO3wq0+O2YVQk+t8x5H3PM3?=
 =?iso-8859-1?Q?tIhjtCJMrcTp7MSQ9FoBxHaJLuXMNq/P/qxc+UjbTn7vrlVv32pWks3Spt?=
 =?iso-8859-1?Q?O472EaS0Fm/xy0SbUnGXxPZz7vd8QXnx+Rz98zPR+E+gJg5vO3mYPkXYql?=
 =?iso-8859-1?Q?+CrBD4Kfvxs9AVsYCYpBhVpgEOWKtCUHl19TV8lqcWMlqnqXlpb2Lo1Nb/?=
 =?iso-8859-1?Q?3Ox7CsGmA0DkmGLznxXN4JpZPHEThM/Uvj3+ni8HXa22GbBVJlQzM7qCNW?=
 =?iso-8859-1?Q?IKjSlOzfKAfS2jzLpOrPomOyPa8VCxpvDxQUy+IpWiVZgxJMbOLC4TX2jC?=
 =?iso-8859-1?Q?EdqyLYNKscJi9+MuBvWXra+3iqDbArmNn1Eu0M2G7aZahCPuus7agSbdep?=
 =?iso-8859-1?Q?hBq+0kg0v9vZ0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <09914401FA8EE045BC0AD9EDD702C95F@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a29f465-d556-4a54-e2b5-08dce90749ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 08:41:09.3923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frsHIZnQf7ulRzta/e2lAnTewcEvPThJ+PnLoWS6SDG4BQZ1S79bY33wseBcdZuKppvIYiRGKtT7g7H6xWM+iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196

On 2024/10/10 16:17, Jan Beulich wrote:
> On 10.10.2024 09:58, Jiqian Chen wrote:
>> --- a/drivers/xen/acpi.c
>> +++ b/drivers/xen/acpi.c
>> @@ -125,3 +125,20 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_info);
>> +
>> +get_gsi_from_sbdf_t get_gsi_from_sbdf =3D NULL;
>> +
>> +void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func)
>> +{
>> +	get_gsi_from_sbdf =3D func;
>> +}
>> +EXPORT_SYMBOL_GPL(xen_acpi_register_get_gsi_func);
>> +
>> +int xen_acpi_get_gsi_from_sbdf(u32 sbdf)
>> +{
>> +	if (get_gsi_from_sbdf)
>> +		return get_gsi_from_sbdf(sbdf);
>> +
>> +	return -EINVAL;
>=20
> Perhaps better -EOPNOTSUPP?
OK, will change.
>=20
>> +}
>> +EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_from_sbdf);
>> \ No newline at end of file
>=20
> Can you please take care of this as well while touching the file? Or
> maybe you are doing so, but the diff doesn't show it properly?
Yes, will change.
>=20
>> @@ -484,6 +483,7 @@ static int pcistub_init_device(struct pcistub_device=
 *psdev)
>>  		if (err)
>>  			goto config_release;
>>  		psdev->gsi =3D gsi;
>> +		xen_acpi_register_get_gsi_func(pcistub_get_gsi_from_sbdf);
>>  	}
>>  #endif
>=20
> Why here rather than directly in xen_pcibk_init()? And why no change to
> xen_pcibk_cleanup() to remove the hook again on unload? Which will then
> raise the question of possible race conditions.
You are right, will change in next version.

>=20
> Jan

--=20
Best regards,
Jiqian Chen.

