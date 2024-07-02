Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE591ED70
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 05:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751921.1160021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOU5D-00043n-15; Tue, 02 Jul 2024 03:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751921.1160021; Tue, 02 Jul 2024 03:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOU5C-00041P-Ui; Tue, 02 Jul 2024 03:21:30 +0000
Received: by outflank-mailman (input) for mailman id 751921;
 Tue, 02 Jul 2024 03:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMB5=OC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sOU5B-00041J-C1
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 03:21:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ad084e7-3822-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 05:21:28 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 03:21:24 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 03:21:24 +0000
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
X-Inumbo-ID: 2ad084e7-3822-11ef-958a-bbd156597b9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foOMtWG7ezYCM/Wba2PoltaeyF02CbhZv1numWUyDFFXEeiV8fAeAsRUXg0zlvyofoda938yVL11HTl/HkEzewLYsVN+NJGOaeXzXKo2xMWN/9K+vjeY4XO0aX8EkwveeLRZyy3mzCR6lE97Zz88Xe+y2gl5CLE1Pv+BiwiHVQl5rjYMBZGt8yqA7LfHi6resKYkhUQatho0hp0o52Kux4XKEEBD5ymFHTMz9WnBWH+4+VqV4IJFK02zKPyeK+9pPw1FbKlaEMOx+JNHNWEZFDNl3es4w/9C14AlZ2IfBzHcvO+HWnS440a3blq4CoAZFh1Kz+WIQ1r2GbiX+o2DVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WqwWOw6C2S4SJz4TZ4gFgeUIe5AJzotDG3ClA/ur5Q=;
 b=eByU7POq5T3rfu50Y8Q5kkq7MbwQ3Qsu11cEoytlRRpNlZ4k0mj0GQpu7swVK9RehxJcI0KHT3lrb3dRr1gpAxLK1Mwnp3CpekNSJS52SEJeMlswVSniUYkaTf9LdXZGpaYVisqOx6h2Xhd9NpcgqZY71rIy7qI99+ZDqMQPRUi0Uf77PrXPhHToJjMlogVnbP0/sVkCskomScSJJQgK2l2FimAshZhHjps/l1fmV3guVio6QjRqkfC89eW9VIdaUAbgKJLlh0V2PfKcbcfZUKqD1E1OOKJNdRFvgTzZ7SJjUZgkColWeIi6YeIGZMNR5SF7TlnLWDqYod/T7aOKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WqwWOw6C2S4SJz4TZ4gFgeUIe5AJzotDG3ClA/ur5Q=;
 b=LlMhY1TTkJ4ddm1PET1kUZWSWkzUHtbKsPNTK4FbXCHTu0z2D8htx3CiCC99E9KDp/u5h5UDeut/vm5v1AjAT2ECzu/ZL+PO/KQrVtBuMWuEXy9GCxLGV0fmZOgs97NopGmkue+VoEz9pEDgx4X28S9ne77P07deWckxDUwElAc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v11 3/8] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v11 3/8] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHayunS8nbcvspfBk+lqNcbWKdXtLHhgWOAgAHLUwA=
Date: Tue, 2 Jul 2024 03:21:24 +0000
Message-ID:
 <BL1PR12MB584940FD9212349774E3A445E7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-4-Jiqian.Chen@amd.com>
 <cdb1890c-a66d-4fa9-9ab6-b678e062e085@suse.com>
In-Reply-To: <cdb1890c-a66d-4fa9-9ab6-b678e062e085@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB5958:EE_
x-ms-office365-filtering-correlation-id: c801edf4-dab3-4a3c-9193-08dc9a460d71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dDlIREcyWUpnblNpTno4bEFxditiWHI1WHVhRGNMWUlJdFV6RmdQbTNwWElK?=
 =?utf-8?B?MW5IUkppZUVGZXBTWTlkbjNGRnRteThRS1BnWFZkVkd0eHpPN3NUbVA3WEFi?=
 =?utf-8?B?RGo2Nm5aVXRoSDJEZFNYNWQyNGpDZElhWWN2N3l1YjZRcXMvSHY4bitaRkxR?=
 =?utf-8?B?QzFFT1dTaVIwYTc1bEsxWGNOTTlOdExSNngvM0M4ZEdLRnNZUWxGYzJSNHJs?=
 =?utf-8?B?Vm1lb25FWDNMN2Q2VnJEazQySGhOU2JCSG1xeGVqN3M0TnBEdWN4bHlldDNo?=
 =?utf-8?B?YktmWXArQ2VSUzNaelZyWmxDZ3h3c2QwRkNodzFISnZwanZyZzdsU2tLVG55?=
 =?utf-8?B?b3Rxd3VmMVJLN0RVNkJSamJIeCsvSnJPUlMzNVRQK214VHArbE96S1dvZVhn?=
 =?utf-8?B?TE41Z1VHUVFaRkNUY1pnTkViRUJYVVdEcFJLK0lMVVJGbTdEQXZVWDY5ZlRx?=
 =?utf-8?B?NXl6YWxhQ3RPcW1KSHA5N2xpZFVWQWVNT1FLTlphcVBMd1lDVjNMd1UrWk4r?=
 =?utf-8?B?a0RaY3ViUTZwWTlMVU1GVlRaVXhlQzhPZUpMbWpxT3JsbXdmcG5ZRVc2cStN?=
 =?utf-8?B?UnExRHdxMXBHdDAzSG9mQnFXRjJTM294TUxucXVHRmpGMmdNKy9Ec1hZZ0xV?=
 =?utf-8?B?TnFrOFlNN3ZoVmFKSVNPL092aW5LdWI4MW80WTJmb2tlbDhOdnNDS1lRb1Zm?=
 =?utf-8?B?ZkpnQjk2dkgrS0d1eDR1M3VmZ05VSk9BQ0FidjRNa3NDdVoxUnlORGZXcStu?=
 =?utf-8?B?emF5UTM5cENPWVMxYWEyZEJGUUI4UUJ2Vkd5T21maVVUM1RZdlF1anRQekRJ?=
 =?utf-8?B?eFlSblZzVWdwQUQ4UGxqNzhiNjVnZW5HZTRjbmZ4NmZab3JQajhFNWswRHR5?=
 =?utf-8?B?MEJJckQ2WFp3eXRlMUhsa1d5dDFzMWpyK2M3T1lNQnJhSUo4SVhZcE56d1hD?=
 =?utf-8?B?V2MxRmcwMENrTkx0VE5EZ3c4NnI4cXdzNFYxTU1wekoxNHI4SW1mQnZNQTR0?=
 =?utf-8?B?YzN6US80WWpEY0cycll2YkZKaEpzTzZ5Y3V0WEU0eTVBNVlsU1Juem9TZm1s?=
 =?utf-8?B?cHU3S3dLWjJuTTRyQllFcWxxTmg4bWlpeU1zSmNJcmtKRVJTbmgwYzNoZkRB?=
 =?utf-8?B?LzlwQnczVkdkZmNtcitSeTdqTVpEL3lxM3ZaVHVzdGYzOFF3RkVZTEpzcmZH?=
 =?utf-8?B?N1JScFdBZVU5RXlmdncra0NXMis1OVJxZ0xFM1dZeUxPMFlWUjZ6QmxwVFRw?=
 =?utf-8?B?bmVHemhCVVM3eXptQlJGRFFIejU4TEJ6TFF3emRVd0E1Q29Ra3VEWTBqMjdQ?=
 =?utf-8?B?Nk9vYWx1dUkraFZiY1dySnRCa2VORGpUOXRFZ04rUzU0M09JQ2pySXFyUWlz?=
 =?utf-8?B?TW5SSHlrYXF5eFpyVDBEQ0NiT0RwcklqQXFEbW4zMzFoUk1XWENCUzJLUGNl?=
 =?utf-8?B?OXIvSWsvNUFITDd6OUYrVUR1a3FTZXI3WFA4a0M5bHV2aG1aYmMyMHJvYXZ0?=
 =?utf-8?B?Ni9lN1d6dnlaTVlUT1Z3STRTTXM4eTU0clB1S2g3RDhYejE0TkNCTy9Dc1NL?=
 =?utf-8?B?K3A3UEJvQUliZlgwTklKdWo2b2ZRR1BZY0ZiQVdnR1lON2RCNzhMcXRyMU5J?=
 =?utf-8?B?bno2MGQwSHk1OUJ4RW9XdEFGNmdzaE5XZGJXQzVLY1VyWjVWRm5USkJBSTRF?=
 =?utf-8?B?Q1hmTVBYdHdxcWdrNjRNY21qNXhJUURMNnZYbjBWOStOZCs2cFdqSE95YnlM?=
 =?utf-8?B?cmpWWnc2bVFta1d3WUNYUG1WbmdJRlJmckl2M3c3aFgwYzMxSnJYMG1Wc1lk?=
 =?utf-8?B?emVic05hR2lWSmVuWFovSnBCN2NuRWF1ZHBCTXVFR0xEL1l1SWo1NzY4b0VO?=
 =?utf-8?B?Q1hOV0JBZXgyZW9nbmpkU3NTSEtYQkxQTm83NXRRTGx3a0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NE5ZUFVUUi9laHJZWUdtOXcraWRvdVZlYlFKVXg5VkhRU2dJMlV0T3JUTkFt?=
 =?utf-8?B?bDUxNHJnWEhRZGk2ZjU0M1YzK051aEtvNitJelQ3bzM1WWJ1aCtKcnVLSzB5?=
 =?utf-8?B?Mlo4VjRHUVhidm4wN2x5dGJocjJKYytHUTJ4dG5HN0pOY0tsY1lIcjduNTJL?=
 =?utf-8?B?UEFJY0VOVE0ya1FnUUg4Sm1xRElmK3lYRFV1VHA0VlU3YUk1VWpsTHJLaHVx?=
 =?utf-8?B?eTlUZjNMK3lqdzNiTkZkNVRDaVZRQThydm0vSHBFWEJUTlNxQk9VOGZtdXlX?=
 =?utf-8?B?clhUemRHdm5aMjNoaHZod0VxeW8vTWgwMWpCNURzTitTTkxzM2RFdkVtYWJl?=
 =?utf-8?B?WHFQdlJCeE9KMEgvREo0dmxKeVRPaWY5VGpXQWd0ZkI5a3Zma0U1dnA2RllY?=
 =?utf-8?B?cEV1QVR4dE9QOUtrM3VXV2tQNG1scytkc3l4QWZyOGl3M214YTF3SVNxdTdy?=
 =?utf-8?B?a0ZBaFN1RG40c0xNNEhqN1dLeDBUWHVNYnFoQlNodDVuWUZEam5FVi9nYkl3?=
 =?utf-8?B?UnBIQVpTbzRCUFJVK1FGODhnZHJnMkhRcjBtZm5NSEhuaHpDbU50QkM1QWxi?=
 =?utf-8?B?aU5MTUh6NjhCTUNqSkVlM05ORC8wWlpHOHRhRzlKQXYvL3NSMlZOWlU1WXp4?=
 =?utf-8?B?QmZZbjdHUW5KY09uc2ZvVG5ZRVpsRmFPWDJNa3R1T3hNVjROakdrc3FlRSt4?=
 =?utf-8?B?cm0vSkVWb2ZCOTlLdTR3WEJ1T0pDQlZFbWJydlBXRjkxRGZIVW5IWTRjdXFP?=
 =?utf-8?B?MytJNXk4SnRKL3BhbHpTMURWeFhDWUJlaGtxYlhuVU1wR0czZzVZME1qZElB?=
 =?utf-8?B?S1NlNVg0bitzMmo4YXZmQlVaTlRrQWh5ZDVPTk5sTG9Ra0FhVkk2N3hVTHVq?=
 =?utf-8?B?QXp3Z3ZudUswdk9DTDdqTEZBNWZ3N2FJbWM4QmlmS1F5ektxVmNIek1GU212?=
 =?utf-8?B?WUp2NWkvT1JFQytBdXZHOEtWcHZkUDljN1JidXEyT1htQk84TmlQSTJGaFM3?=
 =?utf-8?B?OEpTQXQ3UUptYWJsWFB5Y2NZRmF0K0Vud0M3NjMzNHVpYkJENzJVdzlnVVNB?=
 =?utf-8?B?T0IwbjNXQlRWR2ZjV0dFZFZWRzlSb1NsL0hLRTJVS3F6bmRqc0tKaHd3NHpr?=
 =?utf-8?B?cVQrVURFdVE0eW0yZ0t2MTdGUjBVQWNwbjlSQ2lOSWRTMFNRM3JMRmZXaEVu?=
 =?utf-8?B?UDhQSGdTdFEydkRZaTNJU1NBZGRnZlJzRVF1b254TktDQ2ZxOUc4aXNMZGQ1?=
 =?utf-8?B?dEQvT01MaW1JZjByTHVJRGRKTnhPbkMyM1lGSVlQOXZCbldLZ2JVSjZibU5h?=
 =?utf-8?B?Q2tQVkdTdVA4bU9RcE5meHdybTVNRGZHR01EWDNZdGdZR3NTb29yQjhZbFhV?=
 =?utf-8?B?Znd0MENwNzRyZWs2Sk91ZUljM21RYWJWbVM0eEt5eUR1b0diSWlvNkNzbVV0?=
 =?utf-8?B?U2lad0ZwUmlZSkFxWHlPb0dOSitRZU5tRnhxNUZuYjJObllTTXhhbFppOHBY?=
 =?utf-8?B?cU11WjZZa3MzYmwwMkF0RFNPOVF6WVJOR0NNZWRwNnpFdlFibU9rRnY3V0Yr?=
 =?utf-8?B?WXRpWUZFeUZheTl0YTYwNjFDaHA3VGt1T29Ib3pMbzNlc0xabDVoM1dPWkxs?=
 =?utf-8?B?T3ZUdFVZeHgxaHVkWEZFT2cwbXQ1ZEkva0tsdHNrTytJTERuRWUvdjgxcUdZ?=
 =?utf-8?B?d0o4aTFCUjdUUUZnTnN2cjZiU2JmaU5xMFhXeWd4aUlkT3lhcUVmeG5pUGtl?=
 =?utf-8?B?cUZYUUNCNmNFMU1vY3YxOXZUSnhtWkZEZmRGeTBEWUpRVjFGK05vYjZGei9l?=
 =?utf-8?B?dFJpcENYdGhPQVZSNWozWko2WStrcTNBbjZyaWQ5L2FabmhsazJLQ3ZGMmkv?=
 =?utf-8?B?SU1yQXVFUWoyUTJRTlVDYk43STZiNWIvL3RBZnRDQlhsMmZEWUJJRG5Xb1VV?=
 =?utf-8?B?OXBxL1Y4U1dhVEpVLzRQN1hla0Y1UklZQ3E0OEdja2FHcHEzdjhhTm0vd0U4?=
 =?utf-8?B?OFpOTEY3S0hSeEFsWENOdzZoUmZCOE5kOWFNbFpJRmJKSlc2bzUwT21BanNB?=
 =?utf-8?B?QVJuL3hGZTZOR3dDaXZUdk16QWE1NGRyREVnQzRJZTV3TjZJelRNMFc3S2hq?=
 =?utf-8?Q?7u/Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56E15BAFBBADC34FAC93204C73B6973A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c801edf4-dab3-4a3c-9193-08dc9a460d71
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 03:21:24.3482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWx6aTTA5AXMU7B4hX+v+brYgAKPglMQtfiPbgVRyF+PTJEputXDlcZNznY57m0fncPcQh/vhO6QsW/fzaOppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958

T24gMjAyNC83LzEgMTU6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNi4yMDI0IDE0
OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFRoZSBnc2kgb2YgYSBwYXNzdGhyb3VnaCBkZXZp
Y2UgbXVzdCBiZSBjb25maWd1cmVkIGZvciBpdCB0byBiZQ0KPj4gYWJsZSB0byBiZSBtYXBwZWQg
aW50byBhIGh2bSBkb21VLg0KPj4gQnV0IFdoZW4gZG9tMCBpcyBQVkgsIHRoZSBnc2lzIGRvbid0
IGdldCByZWdpc3RlcmVkLCBpdCBjYXVzZXMNCj4gDQo+IEFzIHBlciBiZWxvdywgaXQncyBub3Qg
ImRvbid0IiBidXQgIm1heSBub3QiLiBBcyB0aGUgZGV0YWlscyBkb24ndA0KPiBmb2xsb3cgcmln
aHQgYXdheSwgeW91IG1heSBhbHNvIHdhbnQgdG8gYWRkIHNvbWV0aGluZyBsaWtlICIoc2VlDQo+
IGJlbG93KSIuDQpPSywgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gdGhl
IGluZm8gb2YgYXBpYywgcGluIGFuZCBpcnEgbm90IGJlIGFkZGVkIGludG8gaXJxXzJfcGluIGxp
c3QsDQo+PiBhbmQgdGhlIGhhbmRsZXIgb2YgaXJxX2Rlc2MgaXMgbm90IHNldCwgdGhlbiB3aGVu
IHBhc3N0aHJvdWdoIGENCj4+IGRldmljZSwgc2V0dGluZyBpb2FwaWMgYWZmaW5pdHkgYW5kIHZl
Y3RvciB3aWxsIGZhaWwuDQo+Pg0KPj4gVG8gZml4IGFib3ZlIHByb2JsZW0sIG9uIExpbnV4IGtl
cm5lbCBzaWRlLCBhIG5ldyBjb2RlIHdpbGwNCj4+IG5lZWQgdG8gY2FsbCBQSFlTREVWT1Bfc2V0
dXBfZ3NpIGZvciBwYXNzdGhyb3VnaCBkZXZpY2VzIHRvDQo+PiByZWdpc3RlciBnc2kgd2hlbiBk
b20wIGlzIFBWSC4NCj4+DQo+PiBTbywgYWRkIFBIWVNERVZPUF9zZXR1cF9nc2kgaW50byBodm1f
cGh5c2Rldl9vcCBmb3IgYWJvdmUNCj4+IHB1cnBvc2UuDQo+Pg0KPj4gQ2xhcmlmeSB0d28gcXVl
c3Rpb25zOg0KPj4gRmlyc3QsIHdoeSB0aGUgZ3NpIG9mIGRldmljZXMgYmVsb25nIHRvIFBWSCBk
b20wIGNhbiB3b3JrPw0KPj4gQmVjYXVzZSB3aGVuIHByb2JlIGEgZHJpdmVyIHRvIGEgbm9ybWFs
IGRldmljZSwgaXQgY2FsbHMob24gbGludXgNCj4+IGtlcm5lbCBzaWRlKSBwY2lfZGV2aWNlX3By
b2JlLT4gcmVxdWVzdF90aHJlYWRlZF9pcnEtPg0KPj4gaXJxX3N0YXJ0dXAtPiBfX3VubWFza19p
b2FwaWMtPiBpb19hcGljX3dyaXRlLCB0aGVuIHRyYXAgaW50byB4ZW4NCj4+IHNpZGUgaHZtZW11
bF9kb19pby0+IGh2bV9pb19pbnRlcmNlcHQtPiBodm1fcHJvY2Vzc19pb19pbnRlcmNlcHQtPg0K
Pj4gdmlvYXBpY193cml0ZV9pbmRpcmVjdC0+IHZpb2FwaWNfaHdkb21fbWFwX2dzaS0+IG1wX3Jl
Z2lzdGVyX2dzaS4NCj4+IFNvIHRoYXQgdGhlIGdzaSBjYW4gYmUgcmVnaXN0ZXJlZC4NCj4+DQo+
PiBTZWNvbmQsIHdoeSB0aGUgZ3NpIG9mIHBhc3N0aHJvdWdoIGRldmljZSBjYW4ndCB3b3JrIHdo
ZW4gZG9tMA0KPj4gaXMgUFZIPw0KPj4gQmVjYXVzZSB3aGVuIGFzc2lnbiBhIGRldmljZSB0byBw
YXNzdGhyb3VnaCwgaXQgdXNlcyBwY2liYWNrIHRvDQo+PiBwcm9iZSB0aGUgZGV2aWNlLCBhbmQg
aXQgY2FsbHMgcGNpc3R1Yl9wcm9iZS0+cGNpc3R1Yl9zZWl6ZS0+DQo+PiBwY2lzdHViX2luaXRf
ZGV2aWNlLT4geGVuX3BjaWJrX3Jlc2V0X2RldmljZS0+DQo+PiB4ZW5fcGNpYmtfY29udHJvbF9p
c3ItPmlzcl9vbiwgYnV0IGlzcl9vbiBpcyBub3Qgc2V0LCBzbyB0aGF0IHRoZQ0KPj4gZmFrZSBJ
UlEgaGFuZGxlciBpcyBub3QgaW5zdGFsbGVkLCB0aGVuIHRoZSBnc2kgaXNuJ3QgdW5tYXNrZWQu
DQo+PiBXaGF0J3MgbW9yZSwgd2UgY2FuIHNlZSBvbiBYZW4gc2lkZSwgdGhlIGZ1bmN0aW9uDQo+
PiB2aW9hcGljX2h3ZG9tX21hcF9nc2ktPiBtcF9yZWdpc3Rlcl9nc2kgd2lsbCBiZSBjYWxsZWQg
b25seSB3aGVuDQo+PiB0aGUgZ3NpIGlzIHVubWFza2VkLCBzbyB0aGF0IHRoZSBnc2kgY2FuJ3Qg
d29yayBmb3IgcGFzc3Rocm91Z2gNCj4+IGRldmljZS4NCj4gDQo+IFdoaWxlIHRoaXMgcHJvdmlk
ZXMgdGhlIHJlcXVlc3RlZCBkZXRhaWwgKHRoYW5rcyksIHBlcnNvbmFsbHkgSSBmaW5kDQo+IHRo
aXMgcHJldHR5IGhhcmQgdG8gZm9sbG93LiBJdCB3b3VsZCBsaWtlbHkgYmUgZWFzaWVyIGlmIGl0
IHdhcw0KPiB3cml0dGVuIHRvIGEgbGFyZ2VyIHBhcnQgaW4gRW5nbGlzaCwgcmF0aGVyIHRoYW4g
aW4gY2FsbCBjaGFpbg0KPiB0ZXJtaW5vbG9neS4gQnV0IEknbSBub3QgZ29pbmcgdG8gaW5zaXN0
LCB1bmxlc3Mgb3RoZXJzIHdvdWxkIGFncmVlDQo+IHdpdGggdGhhdCB2aWV3IG9mIG1pbmUuDQpJ
IHdpbGwgYWRkIHRoZSBsYW5ndWFnZSBkZXNjcmlwdGlvbiBpbiBuZXh0IHZlcnNpb24sIGFuZCBh
bHNvIGtlZXAgdGhlIGNhbGwgc3RhY2sgaWYgbm90IG5lY2Vzc2FyeSB0byByZW1vdmUuDQoNCj4g
DQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

