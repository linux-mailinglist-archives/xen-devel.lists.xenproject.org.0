Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA06B51275
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 11:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118003.1463947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwH7A-0002wc-8f; Wed, 10 Sep 2025 09:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118003.1463947; Wed, 10 Sep 2025 09:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwH7A-0002v8-5Z; Wed, 10 Sep 2025 09:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1118003;
 Wed, 10 Sep 2025 09:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwH79-0002v2-Io
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 09:27:43 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 654f1236-8e28-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 11:27:41 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 09:27:37 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:27:37 +0000
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
X-Inumbo-ID: 654f1236-8e28-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQIRySiVnWN9Pf6I7zdHZ/XEz82Q3m4gH7T7IyTO1tBciSNrBOnoH8wJXJhzkAwOFt63kxYuVN9nb8fAAtXdlpZMmbYhDza05VUrUDo7kNiNHjnrGod8hVNnGe6Qs04B87bN7KkEbV4WAIuhu78dq9XXIS71zTVu+KS+uUI9uUVirVglSne3MvC2vYIEhkBnPd1ZTvOjYeNwhySKsvFQjoZTU1i8ulvxs24vPLQYd462QVz1AwenMU7/BF1ZlR0rBU+03Zb0//7vy+2ePJb77A/89SfaXToNty01feYCFrQxCGwyC8Jz6U7GfgrHflNcoViQjaWczIbNd1DIxlq2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGXHiE8g5bVKV4cF/SsCihL+O9WUEvnQ2BN8kxq5k3o=;
 b=bvVMszrzC1V2gXgZp1dr1pS97ZABpPXb+RK+PpGYbWm+gRidgTztrOGM1JxpxW9vgFwiJthG/9e9/uzXSuVT5gvKURYF7649YZbyzHCaZO+QDZqXY34uXoYhKyfuizUv7dpjrz69MVbum12pFzm8ewEvBh3jnpJE/x53PHigyO3NcdhSiWt6gIroYDaLr+GKHFfC4RvnwJP0gyPPX8NJk5lsFtYEAFRI3T+E/eDiDW3MlyoWag4WS1Qf0Ah2t4xdoj2PwTzWh2lwgI4/6Gy07mfjTeuF1zr16AAbGgQ3YQCqaBoGqKALWqddn6WGHhnLJfmN94R4f+dMyiMxZn0x+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGXHiE8g5bVKV4cF/SsCihL+O9WUEvnQ2BN8kxq5k3o=;
 b=xQaOxJW6Y6l5rsV8IEOlZTc2WKU/ZHDjO8VEk3ES9X7npGtsRXhSl+zCn6dSKY+eegntHVs0owfFyC7IHModjL+CU98vF23abR3D74nULxRdyMM8tyhKuZoUKpmn1OOm5QBii1JUJBc5S5+kpoQYQf4GCm4ErLwgoFtZ+fzFy+U=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen
 Gross <jgross@suse.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 0/8] amd-cppc CPU Performance Scaling Driver
Thread-Topic: [PATCH v9 0/8] amd-cppc CPU Performance Scaling Driver
Thread-Index: AQHcHWYmANxehc4TY0iF4B3xrysaNrSLDcCAgAEffUA=
Date: Wed, 10 Sep 2025 09:27:36 +0000
Message-ID:
 <DM4PR12MB84518B78EEC2D8E7780DB042E10EA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <b648990a-7efe-4400-8b85-9e437cfc6eaa@suse.com>
In-Reply-To: <b648990a-7efe-4400-8b85-9e437cfc6eaa@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-10T09:23:04.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY5PR12MB6478:EE_
x-ms-office365-filtering-correlation-id: df0dd64b-3169-45a3-c8df-08ddf04c47d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1pPSzBpWSs4Rk9zQTRKVzV2VlI1U2NnM2I1TlVzU0lpOEZ2YjlsaWljWkFO?=
 =?utf-8?B?TnNrdUxCY2NndTFydnBVTWJHbEUyTXpqTllaMDRESU1sVThmY0svU1lnWFYz?=
 =?utf-8?B?M2VWcitzYVRkMEhxdVZPSS9rdWJUay9hcFduSWFoaFdUV204VHZDRUkxTEFB?=
 =?utf-8?B?Y0tmNHk0R0hIWlBDVWswS1FLSENQQTlCcExaWEE4RlJ5eEN1QTRGTDczRUNV?=
 =?utf-8?B?MzJ6cGlXSk5uZWt4ZGpiVlBaM1I2UEpIS1pja2xscDE1bzBNUWpBQitSMkxn?=
 =?utf-8?B?Qzh0T3VjQVNjUW05c1IvNkpNREdzWXEvSWw3TjNlcFNXWHhjUnpmRGo1MHJx?=
 =?utf-8?B?Snh3cDF5bEdicUZaQ20rUmY0Z2ZSVmkrTEhrSlUyMC9JQzQxdzVKM1JqSlYr?=
 =?utf-8?B?UzdoWUxCT1J1bjU0bkRzdGhGcXZ6V1hkcit2S1NyYnlsMmh1dDVzSU9xL0xX?=
 =?utf-8?B?RzRTOTdvL0UxcHgxdGxGbHRkT21kK2NpVnhZeTQyV0FmbE9IeUlUVEVMWjVL?=
 =?utf-8?B?blp3ZmRvdkFWUVhtRUpsOWFLQUtEZHp5OWxQWnkzaFovTmNPaVNua0Y0Qk5T?=
 =?utf-8?B?UjFJdlRLOFgvNkgvRitmWExwTHd0K1BwSkNzdEhFakhlQ3ZUeVNQb3pGM0hK?=
 =?utf-8?B?a3cwMFZBYkc3NlRsVGZ3ekhCa3JGU2E5b1lqT1k3RURzdG54clR6VjNzRS84?=
 =?utf-8?B?RGRndHNNVFlzYzZ1YUl6NkJxa211QnhmbS9KLytXUEg4M2crckI2MjhMdG5J?=
 =?utf-8?B?cmpHRjJ2OU8rK1BnMG5oSWt5QlM3aHdaMnlWbmE1ckEwWnV0d0hHSGh6RDdz?=
 =?utf-8?B?eHBpbk1uUG5sS05haXR2RVREQ0h3WlA1TUlvQWdNVWZ5YkJNckZ3N3dIdVpj?=
 =?utf-8?B?aGx6N0pYUVZBQ04yVzd0WE9uazFXbkxHdnFXSUVOVExCUkpaRUw4dVBMV3F1?=
 =?utf-8?B?YzZyQTdsT1lHU3BXNVlpYU9FbFFZUzU1Si9lcVVnay9aenhLanZNTjVHUmlx?=
 =?utf-8?B?eXZsMldDUC9OdUxreXA4OFJPSUJFOURVajdXalFQeVhvSE41UXpJYzg5L29r?=
 =?utf-8?B?R0hkMnNwNFdkQ0dXc2VnWDE0Ny8wRVhBNkZOV1cwNUlnbTZGRmliK2ZwNGpx?=
 =?utf-8?B?V0pqOWhlcWJaVlFOSWVpWnAwRkhpQmZEc1lFWFhQVUo5di9DUjh3WEdQZVNz?=
 =?utf-8?B?Mzk2MmFNQjZ3bTZrbFpwejIwcmcrbWVlYlp3Tk9Uc2tKeUtOdkpMamlscmo4?=
 =?utf-8?B?b0UyekpSbHA3Nk5RWU1QUE9QemhQOHd6RVlhQXRZS2pDV05UeFMrN0tMUXBM?=
 =?utf-8?B?eVZuVGdzc2JuVHF5ekVmQkFIYWNXb1pyd3lVU2dtR2pGRjNHT3crMDZlbE9t?=
 =?utf-8?B?VGZmOUlsSUY5SVl6V2hrUkpQblpMZTdrZjh3MkxVOXNYalJTb2cvWGNTeWR0?=
 =?utf-8?B?bENQNDFTNmI2NGlHVkFSUSt5ODVhc0FzenRzRVo5SURMN2VDb2p5MnB6UG1M?=
 =?utf-8?B?dHhZQThMQmdrUEpkQTF4WE41eTNrZ0VJdWVidkdtcnc1WVhPSXE0cDZvU1ZR?=
 =?utf-8?B?dmx1azJkSHBuUCs2WUpCQUxrcGVlRHJERDUxQlFGTzkrTjE2bUpnY294UjU5?=
 =?utf-8?B?NkVyQjdja1BzNDNRQ3JJZVI0NXlGUGFDTmVaS1dzTTJBeVRGMFY5NEVLRVdT?=
 =?utf-8?B?TkhENDFVVnpTV0xUMjFHUWZvaHpYTVRHMTFVeG94R2FlWXhjRzMySjhmaDVP?=
 =?utf-8?B?NzhUK2dieXhLdm4rOFRwUCszSXRSdkR3RjU0QUk3eE5RRmtsdE13SVBzQVN4?=
 =?utf-8?B?czNSM3F0ZzBCRVJZU2J4aEhQRnJ6V1hDRDhjaUcwWDlNczViWkl5ZlFNbE1U?=
 =?utf-8?B?KzUyL2wvakR4WklGRUJabzdaWUNrTVhPb25pWHdIWmNxeDI2UHc0ZzVZNFZH?=
 =?utf-8?B?cjJ4cG1GT3RBZFk3QVphUHI1ZGV0bmVnV09VMFgxSHVEYzhkNXl3Mkd6aFE5?=
 =?utf-8?B?WStvc0RYc2hnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmFSdXRmZTRNcWgvQmkrQjgweGpJZ3VURkJFM3JZUjliR2NaUXFqZHYvdDVj?=
 =?utf-8?B?eWt2ckFteTYrZ3VsZWZCcW5mOS8zS2JPQXN0K01NWmFzU01WZDlXZVBXamV0?=
 =?utf-8?B?aG1sMnN0NHJRY1RuMU9uVW9COWxwWUNXVG5Rem5EbFZQYmFlU3NrRkgzVExq?=
 =?utf-8?B?d1MyOG5hK0J2MFNaZDdQdDMzYkkzNkIzQWtwUFlEbk5MVk1EOWxaYVVKeDRa?=
 =?utf-8?B?TmJScFVoVHY5b25LVFMxSUIwTGU3VkcreDA1TkJMY3d6eFpNUkRoQjMva28v?=
 =?utf-8?B?ek1PK0xoWUgwczBpZG1MeFhoQ2w0bVRLSFRWc0Q2VVVEUUphcmxTN1hUcFVm?=
 =?utf-8?B?bmlWbnh6Q1lINHBTRmVqVkZ0WHJ0NW81SkFPZjhnVGYwQVI4WWZodzVWMThr?=
 =?utf-8?B?Y1hQYkh2MEpwWnRPNHdHRlkzRXRCT1FrVjg5bDFkTW1ZU2V1YnFpMEVSajcx?=
 =?utf-8?B?YURsNmZUblcwdnBxbHdPWmIwSEhhc0crdk03djQyT1lIOGxjVDJ2L0Q5T2NZ?=
 =?utf-8?B?eDJ5SlJyQ2VkMExzVk1Eak15OHV3ZFd4NDM3TTQ2S2EwR2g1N0RCSjEwZmFp?=
 =?utf-8?B?aU1lTmJnTGN0czlXcnZReEdsTThEMTlFTnZqdFh5NEZaZXlsajljTVoydmVz?=
 =?utf-8?B?M2VucGwyTWNDMFFkeEZsVld4VUtEdGx1Q1FtVTZKbVpHQWlGMHdxUHJFQk5W?=
 =?utf-8?B?dnVNSCtCZlJiMlBYSTdGb1BZRENmRi8zVHJiMlZJVGtyOXZjSWZCOGs1NWYr?=
 =?utf-8?B?aUxieUYvL2FZbnc3MjZBblhUeFF6YXhuRk9OM0VVU0dQTGt3b2I5SlNMcjFQ?=
 =?utf-8?B?eHFyNmw5d0lseEJuNVNmZmVVb25SV3I3OEhqNUU2Q0dLR2k4THFNck1na1Vn?=
 =?utf-8?B?cEVFNVpaVXdWQ3lSdFRVMWJQai9Pa3lQcjk2MEhtZ2psQlBhN2liekRsL2Jo?=
 =?utf-8?B?ZEpiRGRnV3U2d0J6SkVxRVJkeXF6MzBPS0RtdG95NGw5OGVycGt4SnEyYVRs?=
 =?utf-8?B?V3VqWEJsTzJiTmJBVENRYzJhUXVwemliMW51c2RXcnl4YUtFL0tGME1tVElL?=
 =?utf-8?B?QnAvcGlLRnNac0pjVEFaVExnL1RiNTJRRVVtK0xpdEJKMDVGN0p1OU9DaTc3?=
 =?utf-8?B?SXd1M2hXTTFORlB1R0p5Lyt1VGcwQUdYREo0ZEk3T0oxMTViUXNmYmx1Rk45?=
 =?utf-8?B?K3l2c0hCL0VLdzBVdXl2d0lHRXBqVWtzMm4vdU0yd0cyUktGK0ZnZmxvN0JR?=
 =?utf-8?B?RXc3Yk1mSlFBM2p0WVZVQ0dpNnBqSHdKSzFyZE8xWUJnelV6RUQveGNiRDNE?=
 =?utf-8?B?SkpkdWlCdFZlSFIxMHFKbVVQM1pwTnhIWnlzTXR1ZWE0NXFmZ2xOTHB3OTB0?=
 =?utf-8?B?ZkxtUGZBSURkc0ZOdlZLc05BSGRNcll5Y2JZYzhCM1owVHFkR1JrekRDT0NT?=
 =?utf-8?B?MDNudXZFTS9Zd1BheUhxZTNETDdYNmZMNXJrcHBQK1hXem13Rld0RnVOT2hT?=
 =?utf-8?B?bUozeGpnQ2xuRERWeUpYSGdQa2ZFVitzQmJEK0V5YTVSTVhyaUlTbFY3cVpa?=
 =?utf-8?B?cFlPNlZ5MEQ1dTN6NmZJT2pWTUxKcS9DcEZBeWRQQ050VTdicDgxNFVoRlp1?=
 =?utf-8?B?Yjc0aFJYdi9reWJsUFhTMzhXUmxsS0J4YlBTNGJ2TzROdmw3VXdZVnVURDRE?=
 =?utf-8?B?Z2hIUkZ0a2VvYXg1c0QyK0hWQmJWRyt1ZFhwMzdzc05CYk5jOG1WMnRjSmEy?=
 =?utf-8?B?ZEJQOVpmRmlNemdBUTJqTUE4a1psQS9rQUVPOFMrS2lBaGRFQ2dmTW1Za290?=
 =?utf-8?B?cThKbWM5blFMRkRjOVN1MUg5Z2p6VlVGbFFBdjBjRkptRGJaVFlwZHlnTTF4?=
 =?utf-8?B?Y0Y4WjM0aVgxbjB3MlRJb0YyWExYZTVkcnBHZlcyeWlxT0N4R09oZkF5bDR1?=
 =?utf-8?B?WVUwUUhkSi9VeVk5LzlXU0V3QWhyYXAvdmdCZExyenIyZHBXRDZmWXJEb3Y0?=
 =?utf-8?B?MUNTSjRDK0pqR3FyU281dmczY1dDSmNWRzdwN2lTNERKMy9RMEFGa3pCU1BU?=
 =?utf-8?B?cmpDRzYwZ2ZNODh4SGY1QUlMM1hESEdGYlBZMHFpNjlSVjRESlhwYlg5bFJz?=
 =?utf-8?Q?+klQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0dd64b-3169-45a3-c8df-08ddf04c47d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 09:27:36.9169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqdnIBPZOzXTKgXRCpCFOKI+Yqoz2gCqmEjW1kPOfpWKCnMsSnbcZHxJ43SLkBknvo0qpuKlyJ4l6NeWEhDjeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDEw
LCAyMDI1IDEyOjExIEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIg
UGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLA0KPiBNaWNoYWwgPE1pY2hhbC5PcnplbEBh
bWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT47IE9sZWtzaWkNCj4gS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPjsg
Q29tbXVuaXR5IE1hbmFnZXINCj4gPGNvbW11bml0eS5tYW5hZ2VyQHhlbnByb2plY3Qub3JnPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkg
MC84XSBhbWQtY3BwYyBDUFUgUGVyZm9ybWFuY2UgU2NhbGluZyBEcml2ZXINCj4NCj4gT24gMDQu
MDkuMjAyNSAwODozNSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gYW1kLWNwcGMgaXMgdGhlIEFN
RCBDUFUgcGVyZm9ybWFuY2Ugc2NhbGluZyBkcml2ZXIgdGhhdCBpbnRyb2R1Y2VzIGENCj4gPiBu
ZXcgQ1BVIGZyZXF1ZW5jeSBjb250cm9sIG1lY2hhbmlzbSBvbiBtb2Rlcm4gQU1EIEFQVSBhbmQg
Q1BVIHNlcmllcw0KPiA+IGluIFhlbi4gVGhlIG5ldyBtZWNoYW5pc20gaXMgYmFzZWQgb24gQ29s
bGFib3JhdGl2ZSBQcm9jZXNzb3INCj4gPiBQZXJmb3JtYW5jZSBDb250cm9sIChDUFBDKSB3aGlj
aCBwcm92aWRlcyBmaW5lciBncmFpbiBmcmVxdWVuY3kNCj4gPiBtYW5hZ2VtZW50IHRoYW4gbGVn
YWN5IEFDUEkgaGFyZHdhcmUgUC1TdGF0ZXMuIEN1cnJlbnQgQU1EIENQVS9BUFUNCj4gPiBwbGF0
Zm9ybXMgYXJlIHVzaW5nIHRoZSBBQ1BJIFAtc3RhdGVzIGRyaXZlciB0byBtYW5hZ2UgQ1BVIGZy
ZXF1ZW5jeQ0KPiA+IGFuZCBjbG9ja3Mgd2l0aCBzd2l0Y2hpbmcgb25seSBpbiAzIFAtc3RhdGVz
LiBDUFBDIHJlcGxhY2VzIHRoZSBBQ1BJDQo+ID4gUC1zdGF0ZXMgY29udHJvbHMgYW5kIGFsbG93
cyBhIGZsZXhpYmxlLCBsb3ctbGF0ZW5jeSBpbnRlcmZhY2UgZm9yIFhlbg0KPiA+IHRvIGRpcmVj
dGx5IGNvbW11bmljYXRlIHRoZSBwZXJmb3JtYW5jZSBoaW50cyB0byBoYXJkd2FyZS4NCj4gPg0K
PiA+IGFtZF9jcHBjIGRyaXZlciBoYXMgMiBvcGVyYXRpb24gbW9kZXM6IGF1dG9ub21vdXMgKGFj
dGl2ZSkgbW9kZSwgYW5kDQo+ID4gbm9uLWF1dG9ub21vdXMgKHBhc3NpdmUpIG1vZGUuIFdlIHJl
Z2lzdGVyIGRpZmZlcmVudCBDUFVGcmVxIGRyaXZlcg0KPiA+IGZvciBkaWZmZXJlbnQgbW9kZXMs
ICJhbWQtY3BwYyIgZm9yIHBhc3NpdmUgbW9kZSBhbmQgImFtZC1jcHBjLWVwcCINCj4gPiBmb3Ig
YWN0aXZlIG1vZGUuDQo+ID4NCj4gPiBUaGUgcGFzc2l2ZSBtb2RlIGxldmVyYWdlcyBjb21tb24g
Z292ZXJub3JzIHN1Y2ggYXMgKm9uZGVtYW5kKiwNCj4gPiAqcGVyZm9ybWFuY2UqLCBldGMsIHRv
IG1hbmFnZSB0aGUgcGVyZm9ybWFuY2UgdHVuaW5nLiBXaGlsZSB0aGUgYWN0aXZlDQo+ID4gbW9k
ZSB1c2VzIGVwcCB0byBwcm92aWRlcyBhIGhpbnQgdG8gdGhlIGhhcmR3YXJlIGlmIHNvZnR3YXJl
IHdhbnRzIHRvDQo+ID4gYmlhcyB0b3dhcmQgcGVyZm9ybWFuY2UgKDB4MCkgb3IgZW5lcmd5IGVm
ZmljaWVuY3kgKDB4ZmYpLiBDUFBDIHBvd2VyDQo+ID4gYWxnb3JpdGhtIGluIGhhcmR3YXJlIHdp
bGwgYXV0b21hdGljYWxseSBjYWxjdWxhdGUgdGhlIHJ1bnRpbWUNCj4gPiB3b3JrbG9hZCBhbmQg
YWRqdXN0IHRoZSByZWFsdGltZSBjcHUgY29yZXMgZnJlcXVlbmN5IGFjY29yZGluZyB0byB0aGUN
Cj4gPiBwb3dlciBzdXBwbHkgYW5kIHRoZXJtYWwsIGNvcmUgdm9sdGFnZSBhbmQgc29tZSBvdGhl
ciBoYXJkd2FyZSBjb25kaXRpb25zLg0KPiA+DQo+ID4gYW1kLWNwcGMgaXMgZW5hYmxlZCBvbiBw
YXNzaXZlIG1vZGUgd2l0aCBhIHRvcC1sZXZlbA0KPiA+IGBjcHVmcmVxPWFtZC1jcHBjYCBvcHRp
b24sIHdoaWxlIHVzZXJzIGFkZCBleHRyYSBgYWN0aXZlYCBmbGFnIHRvIHNlbGVjdCBhY3RpdmUN
Cj4gbW9kZS4NCj4gPg0KPiA+IFdpdGggYGNwdWZyZXE9YW1kLWNwcGMsYWN0aXZlYCwgd2UgZGlk
IGEgNjBzIHNhbXBsaW5nIHRlc3QgdG8gc2VlIHRoZQ0KPiA+IENQVSBmcmVxdWVuY3kgY2hhbmdl
LCB0aHJvdWdoIHR3ZWFraW5nIHRoZSBlbmVyZ3lfcGVyZiBwcmVmZXJlbmNlIGZyb20NCj4gPiBg
eGVucG0gc2V0LWNwdWZyZXEtY3BwYyBwb3dlcnNhdmVgIHRvIGB4ZW5wbSBzZXQtY3B1ZnJlcS1j
cHBjIHBlcmZvcm1hbmNlYC4NCj4gPiBUaGUgb3V0cHV0cyBhcmUgYXMgZm9sbG93czoNCj4gPiBg
YGANCj4gPiBTZXR0aW5nIENQVSBpbiBwb3dlcnNhdmUgbW9kZQ0KPiA+IFNhbXBsaW5nIGFuZCBP
dXRwdXRzOg0KPiA+ICAgQXZnIGZyZXEgICAgICA1ODAwMDAgS0h6DQo+ID4gICBBdmcgZnJlcSAg
ICAgIDU4MDAwMCBLSHoNCj4gPiAgIEF2ZyBmcmVxICAgICAgNTgwMDAwIEtIeg0KPiA+IFNldHRp
bmcgQ1BVIGluIHBlcmZvcm1hbmNlIG1vZGUNCj4gPiBTYW1wbGluZyBhbmQgT3V0cHV0czoNCj4g
PiAgIEF2ZyBmcmVxICAgICAgNDY0MDAwMCBLSHoNCj4gPiAgIEF2ZyBmcmVxICAgICAgNDIyMDAw
MCBLSHoNCj4gPiAgIEF2ZyBmcmVxICAgICAgNDY0MDAwMCBLSHoNCj4gPiBgYGANCj4gPg0KPiA+
IFBlbm55IFpoZW5nICg4KToNCj4gPiAgIHhlbi9jcHVmcmVxOiBlbWJlZCBod3AgaW50byBzdHJ1
Y3QgY3B1ZnJlcV9wb2xpY3l7fQ0KPiA+ICAgeGVuL2NwdWZyZXE6IGltcGxlbWVudCBhbWQtY3Bw
YyBkcml2ZXIgZm9yIENQUEMgaW4gcGFzc2l2ZSBtb2RlDQo+ID4gICB4ZW4vY3B1ZnJlcTogaW1w
bGVtZW50IGFtZC1jcHBjLWVwcCBkcml2ZXIgZm9yIENQUEMgaW4gYWN0aXZlIG1vZGUNCj4gPiAg
IHhlbi9jcHVmcmVxOiBnZXQgcGVyZm9ybWFuY2UgcG9saWN5IGZyb20gZ292ZXJub3Igc2V0IHZp
YSB4ZW5wbQ0KPiA+ICAgdG9vbHMvY3B1ZnJlcTogZXh0cmFjdCBDUFBDIHBhcmEgZnJvbSBjcHVm
cmVxIHBhcmENCj4gPiAgIHhlbi9jcHVmcmVxOiBieXBhc3MgZ292ZXJub3ItcmVsYXRlZCBwYXJh
IGZvciBhbWQtY3BwYy1lcHANCj4gPiAgIHhlbi9jcHVmcmVxOiBBZGFwdCBTRVQvR0VUX0NQVUZS
RVFfQ1BQQyB4ZW5fc3lzY3RsX3BtX29wIGZvciBhbWQtDQo+IGNwcGMNCj4gPiAgICAgZHJpdmVy
DQo+ID4gICBDSEFOR0VMT0cubWQ6IGFkZCBhbWQtY3BwYy9hbWQtY3BwYy1lcHAgY3B1ZnJlcSBk
cml2ZXIgc3VwcG9ydA0KPiA+DQo+ID4gIENIQU5HRUxPRy5tZCAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQo+ID4gIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyAgICB8
ICAgOSArLQ0KPiA+ICB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgICAgICAgICAgfCAgIDMg
Ky0NCj4gPiAgdG9vbHMvbGlicy9jdHJsL3hjX3BtLmMgICAgICAgICAgICAgIHwgIDI1ICstDQo+
ID4gIHRvb2xzL21pc2MveGVucG0uYyAgICAgICAgICAgICAgICAgICB8ICA5NCArKy0tDQo+ID4g
IHhlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNwcGMuYyB8IDcwMyArKysrKysrKysrKysr
KysrKysrKysrKysrKy0NCj4gPiAgeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9od3AuYyAgICAg
IHwgIDMyICstDQo+ID4gIHhlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgICAgICAgICAgICAgICB8ICAg
OCArLQ0KPiA+ICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYW1kLmggICAgICAgfCAgIDIgKw0K
PiA+ICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNyLWluZGV4LmggfCAgIDYgKw0KPiA+ICB4
ZW4vZHJpdmVycy9hY3BpL3BtLW9wLmMgICAgICAgICAgICAgfCAgNTggKystDQo+ID4gIHhlbi9k
cml2ZXJzL2NwdWZyZXEvdXRpbGl0eS5jICAgICAgICB8ICAxNSArDQo+ID4gIHhlbi9pbmNsdWRl
L2FjcGkvY3B1ZnJlcS9jcHVmcmVxLmggICB8ICA0NCArKw0KPiA+ICB4ZW4vaW5jbHVkZS9wdWJs
aWMvc3lzY3RsLmggICAgICAgICAgfCAgIDUgKy0NCj4gPiAgMTQgZmlsZXMgY2hhbmdlZCwgOTM2
IGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQ0KPg0KPiBBcyB3ZSdyZSBjb25zaWRlcmlu
ZyBvdXIgb3B0aW9ucyB0b3dhcmRzIGdldHRpbmcgdGhpcyB3b3JrIGluLCBjYW4geW91IGNsYXJp
ZnkgdHdvDQo+IHRoaW5ncyBwbGVhc2U6DQo+ICgxKSBJbiB2OSwgdGhlIHNvbGUgY2hhbmdlcyB3
ZXJlIHJlbGF0ZWQgdG8gdGhlIHVzZSBvZiBwZXItQ1BVIGRhdGEgYW5kIHRoZQ0KPiAgICAgYWRk
aW5nIG9mIGEgQ2hhbmdlTG9nIGVudHJ5Pw0KDQpZZXMsIGFsc28gaW4gY29tbWl0IG9mICJ4ZW4v
Y3B1ZnJlcTogQWRhcHQgU0VUL0dFVF9DUFVGUkVRX0NQUEMiLiBJIGFkZGVkIGRlc2NyaXB0aW9u
IG9mICJtb3ZpbmcgdGhlIGNvcHlpbmcgb2YgdGhlIGdvdmVybm9yIG5hbWUiDQoNCj4gKDIpIFRo
ZSBkcml2ZXIgaXMgaW5hY3RpdmUgYnkgZGVmYXVsdCwgaS5lLiByZXF1aXJlcyB1c2Ugb2YgdGhl
IGNvbW1hbmQgbGluZQ0KPiAgICAgb3B0aW9uIHRvIGNvbWUgaW50byBwbGF5Pw0KPg0KDQpZZXMs
IG9ubHkgd2l0aCBzcGVjaWZpYyBjb21tYW5kIGxpbmUgdG8gdHVybiBvbiB0aGUgZHJpdmVyDQoN
Cj4gSWYgdGhlIGFuc3dlciB0byBib3RoIGlzIHllcywgd2UncmUgbGVhbmluZyB0b3dhcmRzIGNv
bW1pdHRpbmcgdjggcGx1cyB0aGUNCj4gQ2hhbmdlTG9nIGVudHJ5Lg0KPg0KPiBKYW4NCg==

