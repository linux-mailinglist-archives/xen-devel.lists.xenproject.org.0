Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D0CACFE6C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008172.1387392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSbO-0002xM-HB; Fri, 06 Jun 2025 08:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008172.1387392; Fri, 06 Jun 2025 08:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSbO-0002ve-ET; Fri, 06 Jun 2025 08:39:02 +0000
Received: by outflank-mailman (input) for mailman id 1008172;
 Fri, 06 Jun 2025 08:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dg/F=YV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uNSbM-0002vY-TG
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:39:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2413::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b06c833e-42b1-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:38:58 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9281.namprd12.prod.outlook.com (2603:10b6:610:1c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 08:38:54 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 08:38:49 +0000
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
X-Inumbo-ID: b06c833e-42b1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oao2gTWIxev4eZwzhbnp8fKbDx/RVRHP0mpKgbiu4qHPt7WUMqnKXwh5+6107BTH2t1p9lvYdg1Yj8tnu3Zbu7cENaHifwyQjGnYfxIjJd3DsmE1A+05lPpbGXEHys/BlR/qw6nLV+iRBQuMqSVHHu5rNY/tlQN0d9zkxb3yG18DdxrZv+LlRp9DbIwwr6QdTSz9BaGdoO7OTPZCs4JDTmcYrUaFmsvvofsPfZq+LatIGapCdii01cxsTogVWlnnMD4/rhKBFbV/9jWO+7Duragf+QE5epPrrI38/Gwudegzzj3DgLs6WYKDJP9Bv/B19qU7FFCtrjhNI2Yy5IZXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt32hQ7p33+cAqjPXWJDotYMJWDtFrIXhzS9EoW4sB8=;
 b=mtWNr5dxenlcKfIl4EeL7RSOkgdyuJr3eIIKiz5VsyTxB8NXz+qmbHjbcxduCyPL0xYSIrtTsxJMxdAYZ/JKj5ZHgq6bFB+5kTR/4zOUFyQptmWif5y3KPa6EN5uCWMSdkkA/Rwa2xj/MJA1T1fnhPw/FvC77GloaTrcJwPjRt/Jh93zoN+ReWAk7lEYxnmLyoRnZ4dpsCu3oQLThiJh903K1fcQHWjvdoNnHG+HNZ8t436fQafqIoLshSNncEG6AtRds6ijblUBen+NqzyzRzWo1e8ILxOrf5AUGtX+LPqFR3ZibrR67saD1YPcXLWzaCKIR9AQsWycXDP7E54uzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt32hQ7p33+cAqjPXWJDotYMJWDtFrIXhzS9EoW4sB8=;
 b=2D51moHV7X5PxcDPOAEEmHU/V9wJCi74AOfk7NVu3B0ViaIN0r3hjScE5d0PKavNDxIDvbsba5jvfjbtEdXxTqc6eql2yr0ZhB5VeJzN1FA2ASGuyB4eThI2yxqY5Vj5DSunm0UsHdcW5avee4iKp1ZOlgRtmyMuwRwr8tUi/mQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Topic: [PATCH v5 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index: AQHbziMSzFnidHY0zEiSVFmg3K6sv7P0vj8AgAGoAoA=
Date: Fri, 6 Jun 2025 08:38:49 +0000
Message-ID:
 <BL1PR12MB584926CF782BD10D925D1801E76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-10-Jiqian.Chen@amd.com>
 <aEG1jgbVJGF7HxzI@macbook.local>
In-Reply-To: <aEG1jgbVJGF7HxzI@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8792.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9281:EE_
x-ms-office365-filtering-correlation-id: de2f9b61-f6c2-4a1b-cd49-08dda4d58f03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlhVVmVWL2lVZW5yWmp4MWF2Umo2d29hWXNjNGNjTnVYUzk1K0pabHJKYldN?=
 =?utf-8?B?dTVJSld6Wko2UUJrMS9YNG1xYzRCSDBRRURmU3NzbWZOTlIwRC9pcFZmREtz?=
 =?utf-8?B?NkhtaUsrMzVHbVpodU8yT0pVa3RjMTd1aGc4V0ZBVzUxQlVKOTlWRmtPNWtr?=
 =?utf-8?B?NkVWZS9MSm54VG5sSVpjUDJiazE0ZHhBZS9lbklrdENIMHlObUJvVFdkNkh5?=
 =?utf-8?B?dUhqNERSZ1FUWjZZK044WUkwQWtIVmZDTzNoUVRkblJIamp1ZmsreWZXLzgr?=
 =?utf-8?B?WnlETHZ4MittdmsrSFJ3SW5vb2dEdFU0bnZ5bXkrMW90KzQxanRtUzgwOEhO?=
 =?utf-8?B?Rm9NRUFBVXREczJBcExYazd6ZWdZcjNUUFVKSWZrdzZUNXNJWnB4R2VBbFNj?=
 =?utf-8?B?V3krclFGVlgwSEJUeThDcTc4N2c5SEhYakJBNmhkOUd6T0llMmp2aUQ4R0J3?=
 =?utf-8?B?UzhzSkJCNzZzVXlKWlJPZm10UTAxTFNIVWpYNXFIOElZdCtTWFlHTmxqMU9w?=
 =?utf-8?B?akEzQmpVT3BhQmwxeWhJZUZJeWdPaDB3T3RGNVphdUZmMjBzTXJkYlZOb1Vt?=
 =?utf-8?B?TFBrMVRuSXJIZlNDU2pVRzU4K3hsUTVoa25xKzEzbExITWNqc1Axa0NEREVG?=
 =?utf-8?B?Q1hCMDZrY21FUE5xalkrZDJOcWlaRTRDMUkzOWZ2T0VQYzR1ODlLcHhhV0Jq?=
 =?utf-8?B?YzBCN2V1NCttZUdaMXMyUE9kRVJkSUNwS1V0K1orQURrRGYwSTNCSXl5UE5J?=
 =?utf-8?B?M0VTQS82YmtxeitEWXZmWTBIdklHdXJNa041dlI0UVFEK2JpYms2SlBHQ0ww?=
 =?utf-8?B?ZFNRN2R0eGpPQkJQWWVIQUkydDNuR0Fmd3BZclNqN2d0c0JadlBwNWQvcHdr?=
 =?utf-8?B?WHROOGgrRTBYWVZ3NWprY1lKM1drZUdMZFBNWG5aQWVRS0lIQVd3WjdCWG11?=
 =?utf-8?B?Q2FOWDdoR3h0c0VEWHRIdzJSTVZyUE9FNjY0aUFhY2FoektwTFVWTS9iR1pm?=
 =?utf-8?B?Z05lc3M4a2g1Z3JuUUFoTkFNNTVHSnF4UWhQRmxSNGVsSVcyeEJNdjMraEph?=
 =?utf-8?B?RTd2bndIakwvUW9pdi9hY2VsWnBHTjNRMHV4eDZ1N0JxdklGWGY0NDl2Uzlk?=
 =?utf-8?B?QkM5Zy9uQlpJTms0aFhuRm41YXNmVWNUelZ4TUlTZTZhL2Vxd0QxeXdTMFMw?=
 =?utf-8?B?WFJ1c1V6dDU2ZkpweFdMNUN0aTZDNFNsRFQxUW9kRlR3VW9xNHJRaXpGMmhD?=
 =?utf-8?B?UXRuYmdvcmhDbnlod0U2Q3VxY3BDTHpnOHh6MmRWZHFRUkxBc2FvOEpWZ3FD?=
 =?utf-8?B?cHhYU1B5Q1B0WWF5ODFwbFN0Z000TUNFN0ZxOFlRNTZiNGFNVWpTbTl6aG5W?=
 =?utf-8?B?MndnRHpNbVRHVTJRZDM0TXJPbHM4VkZzckJYSEJ3bk9NMmI5eklVY2h6VTha?=
 =?utf-8?B?dXNoMHk1em85YzhlbUd5RHR0enlZODNtSEo5WmllUml2TFZKTGZYZ2tCZVVG?=
 =?utf-8?B?YVF4OEJqTjVucUUxcHdIeE9MVnBOd28rV3grNHhEVjZBaHBleEpvdEg2VUtW?=
 =?utf-8?B?a0svQUEwVFR6YUtTYUY0dWk0OXllTGttdmdYRE9oYVh1VmtKNWp6MkZuQkhz?=
 =?utf-8?B?U1lOc2o3Ylh4VmwrME9jY0FXbnpXWVFNcGdSek0rQXV5djB4TG9hT3Vmb25t?=
 =?utf-8?B?d0lVeWdrUGI4anlWcm5IMm5XVDZRZzFRYzVidEVDOGxpcGEzN0VkQVFNa2Z5?=
 =?utf-8?B?Z2xWd2RmU1N6UEhwNzVIeS9QVHdEZ3VYTFZ5YkFZbDBtMk5NbVN1M0MxbVRG?=
 =?utf-8?B?eHNJYm1kQjlFVUJGcmJsaUV0Y0tGS3g3NUY5ZDgrSXpTNVd1KzFoU05DYzlz?=
 =?utf-8?B?UUlzMFd6cjJWdlE3OTBjMFBmMlByUjZTcHl4ekY4MkE5UVV5RkFGOFhFZ2Ey?=
 =?utf-8?B?VW4yOGxkcmE4Nk4rRk1reUJOU0N2OFZQbmlWamNzVE9FRGtoUGdkSHFKNjhJ?=
 =?utf-8?Q?uZ6RZMP2l73hvHe315RcCn+cyLHv04=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGJpaUhMV3JXZkh2YndUd01qZnpXeHpObXE2U0p3Zmlsd2UzNzdXakhablZI?=
 =?utf-8?B?OUxYT294cFNrREJqdTUyMnJDN3NzMjRxQmt3VDFLN2JoaEpnNGRHdHhERGgz?=
 =?utf-8?B?ei9vRFJrY0J0NS9jWDgrM2Q3ZHliaDcrMEJpQUFnVElobTBGenRUZlNpQjZB?=
 =?utf-8?B?aXRLV3NpQXZjcEVUVXkvK1RIM3pqSUpwZjdtUWpYMEFUK0QyejRuemhzZjNs?=
 =?utf-8?B?aUxQRXpZbHZFT2N0WE1zdmtrYXErZFpBZUMyd0xQMnZFRXBwMHJiQ1IzTHRM?=
 =?utf-8?B?L2xyQ05YTGE4VFVoL3J4U2hPcjUyb3JycEhQQ3lNZUJ0UGRVemhqZU5CUjZV?=
 =?utf-8?B?NDR2UUZ4Z0VqMTByU3c2TmJYc0xJNkZtUG1kc1BmeEdtK2xTTFBKUnROZGdD?=
 =?utf-8?B?NnZaV1JIbTlwaVJKVmtwN1NwOHVvRFdiUWN6OWtYWlRQUGp4allWMFFlOC9Z?=
 =?utf-8?B?Q3d3VUJkVmhaQWYvUUxNZEtUWFMrUW1aMzhCSUlWRWdRTzZOU0VDRVNJUkhX?=
 =?utf-8?B?bE1xZjZKc0hZb0ZNbGtuUklZamtVMFdzVVBuQjFZSFhwQTAyMFhTdTBXTGlZ?=
 =?utf-8?B?eERPRG83N0tjVnlLS0prZ0VRQ29wS1VUbmVWczZkZ3h0dW8zN05uNlhNTzVU?=
 =?utf-8?B?UlRmTGtWcElNam5VSytsTzdQVUJWVm9YYmxKL29iSktEYlpPVzYwblhoOTdx?=
 =?utf-8?B?Tnl4UWxna2FlLzFHUUdJNXh4eEVqSllkTllMWVZMUmtReWNXYXRqR3A4Um94?=
 =?utf-8?B?RlovN0czWm1VeHFGMmRCZXo0NXplWHBYRE80R1dZMHp5VTJaOGNOdnlQaG5q?=
 =?utf-8?B?Q2FmZHlWbVVtSmIrRUdvWXJPVU5rR01jM0JZcUJUbDN6K3hZaWt4OWpDTGVl?=
 =?utf-8?B?NGxvZndQaVJRK3c5S2IxZFVneWRvNXhPcnFBcUcyYXc0NVF2VUI5UWlLRVVn?=
 =?utf-8?B?bGNhT3hQKzgvQytwdFZteEsyN2xDaTU2SmhxYkRvRkpzK1pwaHMxYnVUbXNF?=
 =?utf-8?B?REY2WFFIMzd0cnpvK2ZIUnFkODU3YkwraHdPUDN2Y3FqZWptVko3ZUJEVjBp?=
 =?utf-8?B?ZnZWcjJqUFZFOVJmZlYxakZsSC8rNEk5c2s4SlZlbnY1WHN1YUlRUXYzbDR0?=
 =?utf-8?B?WDVSVHVBUkVTSTVLNXZuQXNiQlZzUFl4RU9UY1Z6Y0F0dStVdW5EQ2ZjMVpZ?=
 =?utf-8?B?N0Rmb0w3aFJuQ3dJb25seVQwSGxlQXR3YTZ5L2dVb2dsYzNVTHlFRkhCTGJT?=
 =?utf-8?B?TnlSTzl5Tm8vWnFJZGR6ODBQTk5RMm9tSUY3dlR4Rk1pVTRwZkxrdTRubFZj?=
 =?utf-8?B?aE56TDV2REFORzJ5NjQ4WVdKTE9kb3MzZ2J0MElxbEFXZE93aUxScWZ0cC9X?=
 =?utf-8?B?Nk1lM3JFelFLYnNJVlpUb09YUkRzNzc2QVoyRzFLV0c2bW9acUR5UFdBQzUw?=
 =?utf-8?B?RUVKOGRzZWlYc1puayt6SXRXcFY0Q2VXVDdEc1BQamsrcW83MjZ0c2lOUStL?=
 =?utf-8?B?Uk9nUm4xRURHWnpCM0lKblpObERPWlYvaVpJMW9ORmhFVld3TFZjWllZaW5F?=
 =?utf-8?B?ZnFwM2xVYVNJMDN4cENVR2VZeXE4cW52ZEVBWWxlS1N6TDQ1ODgyYTVkQTh5?=
 =?utf-8?B?azNmZ0x1aU53Tk5iL1pnWEw5TU1jaUVDOWJseG5aeGUvQXpQZ0NCYnpGOGN5?=
 =?utf-8?B?NzluOG1rZy9Yd2IxR0xNcmU5WCtWZGVSN1I0eDF0ZlRoZzA2MUh4MnAvL3VE?=
 =?utf-8?B?eUNzcVFCUVpXbnlER1hjWjJWdzgvalViTmFFeklVVFJXS1pnbjNwMG10aEVq?=
 =?utf-8?B?bG5OMnMzdUdYNmQ4SSthM2tZYjVQSFpBZTdVWUJzL2pUa3UvaDJCUE9xV0Jm?=
 =?utf-8?B?VEJsbERWZUZpSTBnZ1h6VkI1aGs1RUFlcFhaeFRzVkdXUlE4aU55NFdhdlRs?=
 =?utf-8?B?cnZmbHpaZENxMnhqOTRycVB1RjJzU2ZPNlZHc2ZGQWRqZ1VyQTh3dXlZOHRw?=
 =?utf-8?B?ME1RR3hmbGV1ZFdEOXAwMFBXRDl0SW1ndHBrNjQ5ZlhLYlpscmowYmJDWWdV?=
 =?utf-8?B?S21PYVNUMlcrdTE1ZGxRRm1aU0FWbS9DMlhpRldVVHNEZHAveldTTm5GbU4v?=
 =?utf-8?Q?pBig=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9001755FC4EE4449BAE6688AD33F6E81@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2f9b61-f6c2-4a1b-cd49-08dda4d58f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 08:38:49.0797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5qZHdgp7JUivbaRXUKZpPuTO6J+XLVZ+VKNNVam7yGA+NMeuA2OG/DbtiNeK65coWJpPuqvrJ2C0ri7/KHjbug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9281

T24gMjAyNS82LzUgMjM6MTksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgTWF5
IDI2LCAyMDI1IGF0IDA1OjQ1OjU4UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biBpbml0X21zaSgpIGZhaWxzLCBjdXJyZW50IGxvZ2ljIHJldHVybiBmYWlsIGFuZCBmcmVlIE1T
SS1yZWxhdGVkDQo+PiByZXNvdXJjZXMgaW4gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKS4gQnV0IHRo
ZSBwcmV2aW91cyBuZXcgY2hhbmdlcyB3aWxsDQo+PiBoaWRlIE1TSSBjYXBhYmlsaXR5IGFuZCBy
ZXR1cm4gc3VjY2VzcywgaXQgY2FuJ3QgcmVhY2gNCj4+IHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkg
dG8gcmVtb3ZlIHJlc291cmNlcyBpZiBoaWRpbmcgc3VjY2Vzcywgc28gdGhvc2UNCj4+IHJlc291
cmNlcyBtdXN0IGJlIHJlbW92ZWQgaW4gY2xlYW51cCBmdW5jdGlvbiBvZiBNU0kuDQo+Pg0KPj4g
VG8gZG8gdGhhdCwgaW1wbGVtZW50IGNsZWFudXAgZnVuY3Rpb24gZm9yIE1TSS4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IC0tLQ0K
Pj4gY2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiAtLS0N
Cj4+IHY0LT52NSBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2UgZGVmaW5pdGlvbiAic3RhdGljIHZvaWQg
Y2xlYW51cF9tc2kiIHRvICJzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfbXNpIiBzaW5jZSBj
bGVhbnVwIGhvb2sgaXMgY2hhbmdlZCB0byBiZSBpbnQuDQo+PiAqIEFkZCBhIHJlYWQtb25seSBy
ZWdpc3RlciBmb3IgTVNJIENvbnRyb2wgUmVnaXN0ZXIgaW4gdGhlIGVuZCBvZiBjbGVhbnVwX21z
aS4NCj4+DQo+PiB2My0+djQgY2hhbmdlczoNCj4+ICogQ2hhbmdlIGZ1bmN0aW9uIG5hbWUgZnJv
bSBmaW5pX21zaSgpIHRvIGNsZWFudXBfbXNpKCkuDQo+PiAqIFJlbW92ZSB1bm5lY2Vzc2FyeSBj
b21tZW50Lg0KPj4gKiBDaGFuZ2UgdG8gdXNlIFhGUkVFIHRvIGZyZWUgdnBjaS0+bXNpLg0KPj4N
Cj4+IHYyLT52MyBjaGFuZ2VzOg0KPj4gKiBSZW1vdmUgYWxsIGZhaWwgcGF0aCwgYW5kIHVzZSBm
aW5pX21zaSgpIGhvb2sgaW5zdGVhZC4NCj4+ICogQ2hhbmdlIHRoZSBtZXRob2QgdG8gY2FsY3Vs
YXRpbmcgdGhlIHNpemUgb2YgbXNpIHJlZ2lzdGVycy4NCj4+DQo+PiB2MS0+djIgY2hhbmdlczoN
Cj4+ICogQWRkZWQgYSBuZXcgZnVuY3Rpb24gZmluaV9tc2kgdG8gZnJlZSBhbGwgTVNJIHJlc291
cmNlcyBpbnN0ZWFkIG9mIHVzaW5nIGFuIGFycmF5IHRvIHJlY29yZCByZWdpc3RlcmVkIHJlZ2lz
dGVycy4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBKaXFpYW4gQ2hlbi4NCj4+IC0tLQ0KPj4g
IHhlbi9kcml2ZXJzL3ZwY2kvbXNpLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMgYi94ZW4vZHJpdmVycy92
cGNpL21zaS5jDQo+PiBpbmRleCAyZDQ1Yzc4NjdkZTcuLjRlMTA2YzM5ZWZhZSAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kv
bXNpLmMNCj4+IEBAIC0xOTMsNiArMTkzLDMzIEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIG1hc2tf
d3JpdGUoDQo+PiAgICAgIG1zaS0+bWFzayA9IHZhbDsNCj4+ICB9DQo+PiAgDQo+PiArc3RhdGlj
IGludCBjZl9jaGVjayBjbGVhbnVwX21zaShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+
PiArICAgIGludCByYzsNCj4+ICsgICAgdW5zaWduZWQgaW50IGVuZCwgc2l6ZTsNCj4+ICsgICAg
c3RydWN0IHZwY2kgKnZwY2kgPSBwZGV2LT52cGNpOw0KPj4gKyAgICBjb25zdCB1bnNpZ25lZCBp
bnQgbXNpX3BvcyA9IHBkZXYtPm1zaV9wb3M7DQo+PiArICAgIGNvbnN0IHVuc2lnbmVkIGludCBj
dHJsID0gbXNpX2NvbnRyb2xfcmVnKG1zaV9wb3MpOw0KPj4gKw0KPj4gKyAgICBpZiAoICFtc2lf
cG9zIHx8ICF2cGNpLT5tc2kgKQ0KPiANCj4gUG9zc2libHkgc2FtZSByZXF1ZXN0IGFzIHRoZSBw
cmV2aW91cyBwYXRjaCwgbXNpX3BvcyBzaG91bGQgYmUgYWZ0ZXINCj4gdGhlIFBDSSBzdGFuZGFy
ZCBoZWFkZXIuDQptc2lfcG9zIDw9IFBDSV9DQVBBQklMSVRZX0xJU1QgPw0KT3IgbXNpX3BvcyA8
IDB4NDAgPw0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkpp
cWlhbiBDaGVuLg0K

