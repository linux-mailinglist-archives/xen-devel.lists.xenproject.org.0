Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B2BAEF119
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 10:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029422.1403160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWWMd-0006Qb-5L; Tue, 01 Jul 2025 08:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029422.1403160; Tue, 01 Jul 2025 08:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWWMd-0006NX-1K; Tue, 01 Jul 2025 08:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1029422;
 Tue, 01 Jul 2025 08:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cy6x=ZO=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWWMa-0006NR-T7
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 08:29:12 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76764dfc-5655-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 10:29:11 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8070.eurprd03.prod.outlook.com
 (2603:10a6:20b:441::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 1 Jul
 2025 08:29:04 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:29:04 +0000
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
X-Inumbo-ID: 76764dfc-5655-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvWpeWGhW/WRqnd32YnDV4SNjXJgqJn8fZYxY1Et7uubPVMUOzO2kbSB998NwCWP3Ayv0oUIOS1z4pIEI6+/ZKyfN2WQy5ctLb2tv5REULkED9GILB03zOOrE2yJjd2uSBxLakaC74z1pVHrc8na3su9CgZ30p3fbYFrsa9fCmSjGcGH/SS76xS7SvjPcS0EbxZSOhH3VenmC5Hb3uW9LDpRJFettmqvPRSKLsg1HgX0tuk2LBYYgIu1AF6WCo/PD7kcdhhQ9YhVlY+uI/xnG7IlT9rX5Xw93IeT0foqCdxKKB3fDWTc8Vco+INTaY3uG0x4O7kmVWmXiFzC3ZmelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvjpZcPQJ0Yu0hV0QkbFDhF661JiCBxQYbHlE6AME+s=;
 b=QVM/QhB2vEGTjjplqpOVkaWtWcpp6kB4ARiB/pToxXozEPpmja5yXA+yQtwSbqa8nc1Z6yF6e9pZFm0xsmvyHh9UrHsEbCKOOn4Y16MasZbmoa+lN4ekUnNVWEcw5F3iC13rG5PBbXwaj0EAvcnERFPJtxY91A8nTmFV8DPOrx/X93zWl0WzuHOwqJLd9pIM2Hsb4qGwsJqVXMSrQJHlfNBth+zS7FJpkO8VKqtNfn6NYm4sZF2K8wK8pxT1E72rbwwhuvNbw+SqMgcn5MLR2a1Y496gnKfiUsMWxATKjNwsxV07hhLysItMh/hpQwWz/mJy3ZaHWO45D4jbzm8MGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvjpZcPQJ0Yu0hV0QkbFDhF661JiCBxQYbHlE6AME+s=;
 b=GsAVnGcfKVBiovCP1L0RY4Vdba3BryApOHftPrereEHUH2143t/vXII6k/XMqXgRybxgwQ1FyahgAbvG/fzu6MG0hMta0M8WxoP0QJYQV+pBpNDzb43tI1ohx1fsXeH7PopN9h+PWLZ3g9/64GctvtzAq+U2HPNMfWE9xMtoJv7laawYqC6YRT9wS8blYsmttA2F0m9M0PfkSxM/a25nfzhpgaWiSUvoLqiYUlyps33qzhlPbJMrhAnaCQQ0jAaw12tbJsxvMe6wwub8UmYzuRseauuHuFHBIpjshv9CJ7oXJ/kroJF/I0dzY1lRWGZlZPNvQ6MlNOulABvXtI6mAw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbz7CcYslTkZ61QEOdjKGC2c9BkrPvjG0AgAHrw4CAARIwgIAqmqWA
Date: Tue, 1 Jul 2025 08:29:04 +0000
Message-ID: <7250049f-e8fd-4752-b749-596332de34a0@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <c0b080618909580e527d7c6cce6010edf5278d2c.1748422217.git.mykyta_poturai@epam.com>
 <66cda989-efe9-4389-ae8d-cb9bc4dc5239@suse.com>
 <c5ff547e-4e0e-4f31-a07d-55527a6d8457@epam.com>
 <a73e2e41-6101-4a4e-a50e-f68d28a0637f@suse.com>
In-Reply-To: <a73e2e41-6101-4a4e-a50e-f68d28a0637f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8070:EE_
x-ms-office365-filtering-correlation-id: f8c771be-6fe8-41df-a3a2-08ddb87956c3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2tqUGQwT0hwVzd1WWNORFRVbkIxWDNvMHlzcWgrSWZNVG9zY3pobklXZDVm?=
 =?utf-8?B?cHZrTHRIajJxN3oxSWYwRVAzbGEyTVh5TXIzd3JUOE1jMGh5dVZiODhIc2JU?=
 =?utf-8?B?dG9tU3hNa21aTHkxcFZvdkk0NmFDdWRad0x6cW1MV3VjcDhGWlQrSW9tcXFB?=
 =?utf-8?B?VlIzaldjNVpXQ2NSZFBsbFdZOGt3N2QrWmtnT2JSeHlIYXBrb2JJZ2Q3Y2ps?=
 =?utf-8?B?ZXBobG85UE9wYkc2WVVDYnFjN0Y5M3g2M1g0Tkh6WkxjeWlweTB0QnI5NDRM?=
 =?utf-8?B?bGtiTDlXUWIwZXc5emR1Nzg2SFJMT1d1YS9POGRHMnQ0dHIzOFJJVFI4UEdB?=
 =?utf-8?B?NnZZdk1NZ2diZU9vY0lEVGtsL3JIZEp6TU9CQmVYWlI5Z1ArQkxzUEtrRklw?=
 =?utf-8?B?THlWOVQ2ZXQ1cm9hWVMyUmVVMDJrclFmL3NTRG82aVVOV3E1MGdneHhmdVdi?=
 =?utf-8?B?dnM3eHBYS0MzUitWSUpaNXNuRVhNZ1lYUFN6Z01RQ3dGMmxVYnh1cWxCU0Qz?=
 =?utf-8?B?d05zQmxScm03clBpRnVVWTNXNXRKazBLNzFLZUxDcU10c1lxaXliM1k2S2Y2?=
 =?utf-8?B?RVFOS3BtMi9kMDlYUnZZZG1UeGJPNXBQb0FOU2kwYjlJcjluOVFYYTF5RmZU?=
 =?utf-8?B?R1VjOHNtWXZ6bUxIQmdDZU53YXdhdmxQYTNKMmlkaGI5YVA4dlhDMXFHSXNE?=
 =?utf-8?B?M3BaclRiZml6N3U0alBSS0ZYWktJT3UwcjIwb0lpWTM4cVIxS3phTnBUSFAr?=
 =?utf-8?B?RFdhWHNGRE1XbEF5NGN5QmpXU1JUa2FTTUc3UEpSekp1Y3oyZVA0UXRHNW1P?=
 =?utf-8?B?UlVidkROVk1TL3EwSGpYdlR2R0tCaGN0ZXU4RXJTTjVQZXpjOVRzWHV2TDk2?=
 =?utf-8?B?bkZiajVoVTh3YnM0eStLWjl2Um5aWkM0L3VUNVduVzBFdlg3UmkybmZ1b0ha?=
 =?utf-8?B?U1NjN2p1d3lmRVdzNk53V09yS0FpbzZjOFR0UGVNM1lOYTJrWnBzUWNLbllm?=
 =?utf-8?B?aFJHbFpaSE03OEZNY01RbUJLWktzZncvcHU5cTNJUGFzL1NWOFU1QUNRZ205?=
 =?utf-8?B?RC9PZHM3Ly92ZlJjakFwZGh0Y2VzOFBULzNNSmNOSVlmL1J2djhXVytSZWJ2?=
 =?utf-8?B?NWs4NFFGMDBTRDcyMjhNZHNNLzUxVm5ZRWhGaUE2TWhmRW51ZDFPSTNnWkhW?=
 =?utf-8?B?UG0yaC9acWl0NDdQT05IbHkrTTZHQTdZUldGZzFMb2hZYlErb3J4L0pWMVdC?=
 =?utf-8?B?eE54QzJkaUVKcTk4ZVdtb3BESittcVpqQVpoR1NBY3E0WUR1TDdIT0tCSUxv?=
 =?utf-8?B?UkxGVTJ0VkNYbW9NZm5rcDNUOEFlWWZNbW1SeEthbVRUMWp5VzdaWFFMeCt4?=
 =?utf-8?B?QkJFYnBOUFZoU2VJQXllYmpPV3VzRHRQV3UxWlExK3JJRlJGdmtuanYzYjda?=
 =?utf-8?B?R1lVSmdIRVhVRmVPa2NmbWdiYUdnSmNUZnVqeDJpS3Q5RkNxN0N0K2JwNEJ3?=
 =?utf-8?B?WU1wNkd0SURhMXNlOVQzeWRYQWdrd1dPdkQyUURvVHJUQ1VsS0o4eW1uelJO?=
 =?utf-8?B?ZmI3L090bEpNTXhDczBEajVHbHZsak9MMTJmb2E5d3FzSk5UMnJnK2hhTXFi?=
 =?utf-8?B?RkFYOG1mYjh5a0dEbkZaK0l1b21iZk9rTXB4TzNvamY2bCtXdzNFZXVXQXgw?=
 =?utf-8?B?WFdlWlExR3R2RU8ySzhzY1lGdko3Wm5UQkZJMmJJaVJIS0JoU2ZwMzNKZ1lN?=
 =?utf-8?B?eWNzcE4wdFllcmtlLzAwUzUrd0t4QndseEV1ZEQ1U2V5SU5ueGpoUFNlUkhu?=
 =?utf-8?B?RVF4OWs1L2VTSXR6NldvQjlEVHl6c3hhclBOTm9jbm8xM3VtRTU5UG80OEM5?=
 =?utf-8?B?U2NEdEUvZDJSZ2NuQ3ZBQ0RPeGY2bFp0czh2RTJxZUMrRUV0VFFYYVBWNmFT?=
 =?utf-8?B?UGxyWDNHcW52bHdWeHpyNldWNGFJZzZ1dkNmR3p4eHNQanVtMS93OXRaeGUx?=
 =?utf-8?B?clpsUUN3ZzZBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0RQNEZlSVlQY2I5cEdPc3VRKzJDcGhtenh2R1o2NFdRZ3RMNmxQNG9CVnda?=
 =?utf-8?B?NUxsTVJNTlR2WWZ2aC8zYS9rQThEbThPalNCYm91cHh4Zm5DWGpqT0hFaThK?=
 =?utf-8?B?Y2VrbEtGTk5xWUpDeGNLUVZBTlBIaVdxQSsrVENMZ29KWDZuREZrTmRSTDJI?=
 =?utf-8?B?M1BOMllscURVNVZtWjhab2ZUREtrekVJV0k0Vk1Md0t5dkNOUjE4UlorV21E?=
 =?utf-8?B?SFlUQVBQYW5Od24vSU5lZGtTWlVyTWR5RG5DaXBmMWtuZVJKVWZsbHo4MWZW?=
 =?utf-8?B?QXhMQ0pIUEtRRWgwb3FjL2dDY1Yrb3pGSyttWUVkZzUycFB4c2ZMWWg2UEJD?=
 =?utf-8?B?VHF1ZkZLQUVaMlh4eVpFL1VTYXNVUEZHRjdiZzlIVHhNQisySE51VWExa2hn?=
 =?utf-8?B?dmRWYjRGMExnYWs3ZW14M1RKeFZPakgrLzJTTlJsV2UrcVVZNTFWWXVYV21t?=
 =?utf-8?B?a051b3huYjZNNlpJODlJcUlHdElLcHEyUXRpUWJhVkQ1bFJ2QlhxZFc1NzAy?=
 =?utf-8?B?VGhtM2srZFZIVTVOc3FiWUdFY3o2UU1pU1ZadEd0emJzQndvbUsxc0NsUWhI?=
 =?utf-8?B?YndFdnhtZkpPRGxzY2lrZUVldG53S283Y3hkbzFGWHRQREhxckgvckFma05D?=
 =?utf-8?B?Tmh4OHhLYWIrY01JZC9WZXRBbzhoU1lGaElxRGF1dTNvMDFVdnRTU1dmbXRE?=
 =?utf-8?B?UEhUMnBvcU10dzQ1T0w1UGYrUWdIazU1RG9CM0t3OFZUMVVYMC8rZzNhVW9Q?=
 =?utf-8?B?ZDBRN0oxd0FETERmc0NNYUIyOWtoVmhqV0hTOTNWdm1LQXJNMGozNHdMM3Na?=
 =?utf-8?B?azU2RkRUZk1iNkt1UkpmdDhadjA1M1Nzem42Q1JDb2xSbFpKeFZTYVJucXFn?=
 =?utf-8?B?aGlkdVBPVytqdFFHMExaeDhzUVBCM0JjOXBZbUwzeHJLR09LN3B3dTRsaFMx?=
 =?utf-8?B?TkJJWWJycmUrRUpVbWJWY3lzMEFMSjJ0S1p4bzE1UFBGR0o2MTV1TnVEdjgz?=
 =?utf-8?B?aWx1MkticnpzUithdFpnM3NTcStlODdqenRoTEh0ZGl5ZzZDQjRZZHpKNlA2?=
 =?utf-8?B?Mkhob2NhZzJkNTdJbE9CV01XTW1nOXpUVTQ3WCtRUXh6dkhrZjNXdWVOV1A1?=
 =?utf-8?B?Tm9XSVZ6dUV6Y0MwckRLcGYxbGwrWlRrdHRPZy9jMXQ3VGlpOGo3RTJJSVpU?=
 =?utf-8?B?UElWRkRveGNHL0N1L1kzaGpFcmRXQ3c1WC90YUZnSHFRMWdNWXQvdnBOeWtQ?=
 =?utf-8?B?eFFwWFAyVitIWS9ZODRUMmROWjRLWWYyUzdFUG5mNTR2MGVLNXBVOU1tVElQ?=
 =?utf-8?B?bDh3VVRMQ1BhdWliU3d5QWJ3UTV0V1ZqNDZsajlReVVhWGFQNm11MldVWkxl?=
 =?utf-8?B?U2NNbU8zbHV2dEdBdmVCMzIzOTYrZEVmcGZOZHhTbjRFdDFBUmlEakJaTzVD?=
 =?utf-8?B?aTlCMjVHMDRQR3JnS2lwTW9LaUZlb3BnTnZaSktSWFpYdWhmVFZGdEdDNXJY?=
 =?utf-8?B?QWcxSFBrNk8rTEZSZndkbVpaTXJicC9hVWZ2ZzF5d0NxYTViNHQxOEtoa0RR?=
 =?utf-8?B?c3pPMDFRaGxIZkpYZUppMWhjQmtoRVg0N3RMMldBc1RRK0x4NUIwWExiT1Za?=
 =?utf-8?B?WnhXMi9xS0JqdEZFbmxLTklRWGoxdlVXQ0drbE5jWlVBcmgxVGNUbGNKTUtN?=
 =?utf-8?B?U1lIa3J5Z3J6MGZ1YWhEK2VuUnZ3VnFENkEvZDA4L2VzZHN4a2RKMmg5TU1a?=
 =?utf-8?B?QWtyRDJ0eE44VmQ3a3JsblZsUmpUWVBxbWR5TUJDaWFkZVIvdFMvR0R6cnIr?=
 =?utf-8?B?aDJseE9ZVm1mNnhJSTBGeEdaZy94a3RlUmJSM2tKL3JoWlZ1azRqVS9KbXZE?=
 =?utf-8?B?blVlVVBHelNndUd4TlhKTkZEMzZReXhrM1hsZDBFQzBUUnRqbUxGOHptRmVP?=
 =?utf-8?B?NjF5TnZPOUlzb1RRQm9nY0ZySnVSdWhqd3dxd2pDTjk0dFpLaGZxUWtWUXYr?=
 =?utf-8?B?MGl3bFhNOTlBaDJwUks3OGhENUxJdDRQUGxESVpmOG1PTzZ2c3gyUTFNK1R3?=
 =?utf-8?B?L25OVmxwUXZRZlovNDc1Y2pKYUJUakVIRmVsUlRYNVVkNjVxeEVacjhkS1hW?=
 =?utf-8?B?NWFIV2d1OGc4VVRxMFI3Yk5OamZjVHREZC9NeHZ1aVd5Z3ZvNkhTUkYwUzU2?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98BB77E3B4510B49B7B6E17D5E60B372@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c771be-6fe8-41df-a3a2-08ddb87956c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:29:04.2552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/Syh1lFYct5ZO08iBAf8bvAFLwYcXZxCKP9P5L74hSS5HxtpsYxBUrynwZnno3Rt1d3i2VLP2IxgThZyoU8cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8070

T24gMDQuMDYuMjUgMDg6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wNi4yMDI1IDE1
OjMxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDAyLjA2LjI1IDExOjExLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyOC4wNS4yMDI1IDExOjEyLCBNeWt5dGEgUG90dXJhaSB3cm90
ZToNCj4+Pj4gRnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1k
LmNvbT4NCj4+Pj4NCj4+Pj4gRW5hYmxlIHRoZSB1c2Ugb2YgSU9NTVUgKyBQQ0kgaW4gZG9tMCB3
aXRob3V0IGhhdmluZyB0byBzcGVjaWZ5DQo+Pj4+ICJwY2ktcGFzc3Rocm91Z2g9eWVzIi4gRHVl
IHRvIHBvc3NpYmxlIHBsYXRmb3JtIHNwZWNpZmljIGRlcGVuZGVuY2llcw0KPj4+PiBvZiB0aGUg
UENJIGhvc3QsIHdlIHJlbHkgb24gZG9tMCB0byBpbml0aWFsaXplIGl0IGFuZCBwZXJmb3JtDQo+
Pj4+IGEgUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkL3JlbW92ZSBjYWxsIHRvIGFkZCBlYWNoIGRl
dmljZSB0byBTTU1VLg0KPj4+PiBQSFlTREVWT1BfcGNpX2RldmljZV9yZXNldCBpcyBsZWZ0IHVu
dG91Y2hlZCBhcyBpdCBkb2VzIG5vdCBoYXZlIHRoZQ0KPj4+PiBwY2lfcGFzc3Rocm91Z2hfZW5h
YmxlZCBjaGVjay4NCj4+Pg0KPj4+IEp1c3QgdG8gcmUtcmFpc2UgdGhlIHF1ZXN0aW9uIGhlcmU6
IElzIHRoaXMgYWN0dWFsbHkgY29ycmVjdD8NCj4+DQo+PiBJJ20gYWZyYWlkIEkgZG9uJ3QgcXVp
dGUgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zIGhlcmUuDQo+Pg0KPj4gVGhlIHB1cnBvc2Ugb2Yg
dGhpcyBwYXRjaCBpcyB0byByZWxheCB0aGUgcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQgY2hlY2tz
DQo+PiBhbmQgbWFrZSBQQ0kgcGh5c2RldiBvcHMgd29yayB3aXRoIHBhc3N0aHJvdWdoIGRpc2Fi
bGVkLg0KPj4gVGhlIHJlc2V0IG9wIHdvcmtlZCBpbmRlcGVuZGVudGx5IG9mIFBDSSBwYXNzdGhy
b3VnaCBiZWluZyBvbiBvciBvZmYgYW5kDQo+PiB3aWxsIGNvbnRpbnVlIHRvIGRvIHNvIGFmdGVy
IHRoaXMgcGF0Y2guDQo+PiBJZiB5b3VyIGNvbmNlcm5zIGFyZSBhYm91dCB0aGUgY29ycmVjdG5l
c3Mgb2YgYWxsb3dpbmcgcmVzZXQgdG8gYWx3YXlzDQo+PiB3b3JrLCB5b3Ugc3BlY2lmaWNhbGx5
IHJlcXVlc3RlZCB0aGlzIGJlaGF2aW9yIGluIHRoZSBwYXRjaGVzDQo+PiBpbXBsZW1lbnRpbmcg
aXQgaGVyZVsxXS4NCj4gDQo+IFJpZ2h0LCB5ZXQgZXZlbiB0aGVyZSBJIGhhZCBhbHJlYWR5IGFz
a2VkIGZvciBwb3NzaWJsZSBkaWZmZXJpbmcgb3BpbmlvbnMuDQo+IFBsdXMgdGhlIGNhc2UgSSBo
YWQgbWVudGlvbmVkIHdhcyBzcGVjaWZpY2FsbHkgRG9tMCwgd2hpY2ggZml0cyBoZXJlLg0KPiAN
Cj4gSmFuDQoNClNvIEkndmUgZG9uZSBzb21lIHRlc3RpbmcgdG8gc2VlIHRoZSBhY3R1YWwgYmVo
YXZpb3Igd2l0aCBkaWZmZXJlbnQgDQpjb21iaW5hdGlvbnMgb2YgcGNpLXBhc3N0aHJvdWdoIGFu
ZCBpb21tdSBzd2l0Y2hlcy4gV2l0aCBwYXNzdGhyb3VnaD1vZmYgDQphbmQgaW9tbXU9b24gdGhl
IHJlc2V0IHdvcmtzIGZpbmUuIEJ1dCB3aXRoIGJvdGggb2YgdGhlbSBvZmYsIGl0IGZhaWxzIA0K
YmVjYXVzZSBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgaXMgbm90IGFkZGluZyBhbnl0aGluZyBh
bmQgdGhlcmVmb3JlIA0KcGNpX2dldF9wZGV2IGNhbid0IGZpbmQgdGhlIHBkZXYuDQoNCkkgYW0g
bm90IHN1cmUgd2hpY2ggYmVoYXZpb3Igd291bGQgYmUgdGhlIGNvcnJlY3Qgb25lIGhlcmUgZm9y
IA0KcGFzc3Rocm91Z2h0PW9mZiBhbmQgaW9tbXU9b2ZmLg0KDQoxLiBMZWF2ZSBpdCBhcyBpcywg
cmVzZXQgcmV0dXJucyAtRU5PREVWIGFuZCBwY2liYWNrIHByb2JlIGZhaWxzDQoyLiBBZGQgdGhl
IHNhbWUgY2hlY2sgYXMgaW4gYWRkL3JlbW92ZSwgcmVzZXQgd2lsbCByZXR1cm4gLUVPUE5PVFNV
UFAgDQphbmQgcGNpYmFjayBwcm9iZSB3aWxsIGFsc28gZmFpbA0KMy4gQWRkIHRoZSBzYW1lIGNo
ZWNrIGFzIGluIGFkZC9yZW1vdmUgYnV0IHJldHVybiAwIHNvIHBjaWJhY2sgY2FuIHByb2JlIA0K
dGhlIGRldmljZS4NCg0KTWF5YmUgeW91IGhhdmUgc29tZSB0aG91Z2h0cyBvbiB0aGlzLiBJIGNh
bid0IGNvbWUgdXAgd2l0aCBhbiBhY3R1YWwgDQpnb29kIHJlYXNvbiBmb3IgdXNpbmcgcGNpYmFj
ayB3aXRob3V0IHBjaS1wYXNzdGhyb3VnaCBlbmFibGVkLCBvdXRzaWRlIA0Kb2YgbWF5YmUgIm5v
dCBicmVha2luZyBzb21lIGFic3RyYWN0IHNjcmlwdHMiLiBBbmQgRU9QTk9UU1VQUCBzZWVtcyBt
b3JlIA0KZGVzY3JpcHRpdmUgdGhhbiBFTk9ERVYgc28gSSBzdHJpdmUgdG93YXJkcyBvcHRpb24g
MiBpZiBldmVyeW9uZSBva2F5IA0Kd2l0aCB0aGF0Lg0KDQoNCi0tIA0KTXlreXRh

