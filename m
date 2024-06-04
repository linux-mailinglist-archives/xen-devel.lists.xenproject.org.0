Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F58FAA67
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735129.1141280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENET-0005aA-7a; Tue, 04 Jun 2024 06:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735129.1141280; Tue, 04 Jun 2024 06:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENET-0005Xc-41; Tue, 04 Jun 2024 06:01:17 +0000
Received: by outflank-mailman (input) for mailman id 735129;
 Tue, 04 Jun 2024 06:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAXK=NG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sENER-0005XW-Il
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:01:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9b6c707-2237-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 08:01:14 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL3PR12MB6379.namprd12.prod.outlook.com (2603:10b6:208:3b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 06:01:10 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 06:01:10 +0000
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
X-Inumbo-ID: d9b6c707-2237-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCtYGaCCxX2y/KlIVDgPP3nFBoZkDExsGY9j1VQXmckNXwRscsw9YBBuBI/9asSjZMghscTkM8nqNF66SMMrNvLXYjdN5YqyjBjPSDSlWwVJo6auP4ZmavANhtp/l5ySwcHaCj3DSqTX22Gx7wAOJHiS8f+GYLfUMYVfc+B9qrXdbFMSj5uxWxmsMcZ2B880mYXjdWW8fwmNlCHZTIvjCpP2bVVbyz7+QL2aPy+FOc6RBqBynb+T2itS3AM04ZxSzWzQW5/G8uS+T+OsCpoz/QyuyEnqdOilYw8+fPOsRfDtca7oPDWDDK9xPPKBKpbj1+AAuJU/B6Uqb7t0IeJ7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDmZTLYOkYHDsuZO7ybeLbK5lH8L8SZk4dMIvFUrAX0=;
 b=RAfwjm4SB7EUJswhmA0ziTr2j2+VwixkKpyGKkX+NsNmE+nb7bKjPrfLpPlVP83IxGyuLrxEMDTEfcJp7UbIErzDMpbfDYVBpahpjFi0vrHn/8sP0hQibbhhd8vJDyboe+ffz40wVMH5UgITrEeQjeAxivUKlpHAeJzQU/+mlf8J/XVReZ5R5skAeigfTz8CENm2FE57JG7e/uSPReHnZJh622LHTPy46FioCTZuHDO1KaZ2VwZ7fLkfJbGkLAGifGa5AiXdIFTIS6kt/aNU+CM3VHRczMt8f923TW3AGgZEurPBeGj7AItCYdTZA92wP6NpfsJuJ7z1BJdA2F2byg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDmZTLYOkYHDsuZO7ybeLbK5lH8L8SZk4dMIvFUrAX0=;
 b=MAFz80EsdMd9HqZ6sjwe+UK1lXGuNxgTnfSJDU1WCONHUm9QAnMPHJ1au2SHtUizgkTIAnrZtu/Jnv22jSiSG6u1CHXsBLeD4/YEROcrbyXaednUbuMM/X/ENyFGQbUzYuRA9NEQrqAMQQ8H2HIWIa3HPSKGGqX0U2m21FglQ2A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA//+0FICAAgSCAP//yCWAgAeLLwD//6n2gAAQ1XyA
Date: Tue, 4 Jun 2024 06:01:10 +0000
Message-ID:
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
In-Reply-To: <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL3PR12MB6379:EE_
x-ms-office365-filtering-correlation-id: fdf23327-1636-47ec-3925-08dc845bbb62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|7416005|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?YlozZ3ZsQ0ZNV2kvU3lYb2lHNTU3eXg4cnd1dWlaOVpOYVJlMFErNGtncFQr?=
 =?utf-8?B?S3M1bGlhOWJmcFdmY3dOUWlHZnpyMmduK1ZLVHoxYnVIZTRlZmVxa2NxZHhn?=
 =?utf-8?B?Nk1BY3hsQUwxbWdGTy9Ic1hVd0VxRG1OUFZnajArcndjRGF2QUpadlplWWZn?=
 =?utf-8?B?aXR6MEdOOWN6R21DSmhoRUZ4Z29lQUlpb0sxYzNqTk54Q3ZRQkZudjRYVkpq?=
 =?utf-8?B?M0JRbTBiVGxVS0xESE1kUC9hS1BHZzFERVhaY29GejdyT0RFaFVvWW5qSFlk?=
 =?utf-8?B?aFYvN1pEenhucDJIaXZPalpsT0xGWGlWL3ZRWUl5MDFGcE8zbzM3U3o0VXd2?=
 =?utf-8?B?VXNiaFpiazdJSjgrTTZXOHYrOTdMSmJ4akVQNjQxalpoRzlERU15cFE5ZnBo?=
 =?utf-8?B?NnRwRDdsZmRudDFVWWt3R0pLLzBMSEl1azZ3cm9KZVhwK0FFY254MlNZVEV3?=
 =?utf-8?B?ZGtQb01BVHZtU3ZBQUFpdzFvYXJZL25QU01jS3BkbG1GQTNmc21pd1NYV1A2?=
 =?utf-8?B?bzQ2Z2QzU2gxdFVPN2N4WG5LbDV0bFl1RW5aOFZib3B6YW9aTDFHQXBsdXRU?=
 =?utf-8?B?UU1idGR3SHBlZTNIVWdoYnpOTWNVKzZ3N2Q3eFNML0lrRjJFak04V29OejJV?=
 =?utf-8?B?T3BvbXM1ZU92dTZ0NWl1Nmg1YU5jSExnUHc5bTYzdEtPdTFpQlhMTERrempF?=
 =?utf-8?B?Y3djZCtWQzVaMVRrd1BpbkRibEJHSS9YT1NVQkZ6bitOTzZ5bFhYMWg4SXVo?=
 =?utf-8?B?RlNOTkJ0Ri9vOUI0dlNPbVRaaVF3R0JFejdBVk9reHdrNWhqbHdEL0c2R1lW?=
 =?utf-8?B?dzdOazM4ZERXY09zeHo2U3FkZG94cXdlZ2VBd2Z6RStvNG9UbE1EU05IMXUw?=
 =?utf-8?B?SzZPZm50amF3VGo1NFVqMWlobjF3aGRqakhJNmd4NDg4d0dYeWNBTlRCOWZ4?=
 =?utf-8?B?NHZFUmY4UjhGc0pSUDVWd01Nbmh3WklndDFIbWp5OXZtV2ladDN4S1Q5TVU0?=
 =?utf-8?B?RDMzRURhakhEUVJCUXFvVm92WXJvb1hWZWxwS054Y3RUVWJXWE5UVGszdmtu?=
 =?utf-8?B?K1QzaVBnUHdKcXBUN2s3eEpuQjdUV2plUXZsVWJlTStzYjJTTVgrbkxjbU5o?=
 =?utf-8?B?VWo2c2JNRU5Ta0U2VHZxS0QyWFlabzY3Z3BJbTdSQ0dJSStaeGpXQzY0bkVJ?=
 =?utf-8?B?YkZDTkc5b1hnNWRLQ1F4ZWppTTRMTnpSWWZRVjlEUVk5US9PRDgzZ3N6M0Jj?=
 =?utf-8?B?bE51Y3VIcXR3TE1wY09PU2pnNDA1VmFON2tBamNqa01RZm9WZ0pBdWI2aCta?=
 =?utf-8?B?LzJFcndyQXExaE5HTmI0R3FFNnRwNjFRV0dZMXVyYUZIajQ4djJ1VGdpaGlr?=
 =?utf-8?B?bHFWMExNK3kvMmlRMEVPRTNtUjd1SkhnN1Fmb0p1OXFqVTJrT0U0bGhaU2lr?=
 =?utf-8?B?aXJSNFNZd1Raa2I3a3lPZnRjbmNRUDZmOEVSS0hVQWd6S3cySnJQZ0hNN2RU?=
 =?utf-8?B?UjZ0UkdpT08xbmtVT0VjcjhOK0dHaVdidGpqR0RVRlRoRExFZzRUSSsxOEZK?=
 =?utf-8?B?WHRaOWQ1MEg4SWZOTWd6ZWlDZXl0UWRJUisxTGY0Wm5YVVZPd0NBTzVnVVJu?=
 =?utf-8?B?UGlmMUp3dGErd0hCRUlvRGhvYjM3aUJ1N1FGeFhuOHZON1J1Sm5Yb3YzSGVp?=
 =?utf-8?B?c1VxOUx0bmNyQk5KR3BjcGtUeDhteUVCUnZnY3h3d1luaTlyUC9sNEVLWDRK?=
 =?utf-8?Q?IVg/eaHTVBKXGYFMV8OBxVgbPXBJAi9uvOA+9cl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mk1EMTRVaE4wbERiTTZ0dE43amdTSm53MkU4WjdRV0M5WDY3dklSY0h1ZjI2?=
 =?utf-8?B?bUxPendxR3FRanZHdFhNTHJEMVhqWmdoc3hDYTE2TVdQYUVQeGs3Z1c5UENE?=
 =?utf-8?B?NUlnSVlOSGRjeEJMcnpzM3p6QVFONGdMR3hML1F2VjRpZUtLWmMvMHo4RmxF?=
 =?utf-8?B?Mmdvd0doK1ZoUXViUUdoTjNIZUN3dEg0azkrVkRXZGFScHk5UW1DTTI1c1Nh?=
 =?utf-8?B?OU4yM21jancxVEFKc1FKdmpSWTRPSWYvak1DYWZFaUprOThGQko5RXJYNGQ3?=
 =?utf-8?B?K2NZeERUcWVVenNaQ3lhaG4xWjN0djZtNHY1T1RsWDYrcnBheWpBcEZQM3pW?=
 =?utf-8?B?d1ZMS0hJNTViUS9BTndVUXFISVVnL01tOXRDWVRMWnp1Z0JkMkFTTXBsYTA0?=
 =?utf-8?B?N3pqN0RIcnRNalgvQ3NhMHJkYkRrZ0xDUnU4aytsZnh2RjhZeWtaUXM2U1Y1?=
 =?utf-8?B?T0xrRlFySk5udDdqREZQaEJUMG9UQkd4KzE5cFdxK1E2cmszV0RieTljTzBl?=
 =?utf-8?B?dFQ1ZllPSmIyZnp1ZWZNdmdFQlU3QkR6dG9TUzJtRzc5NG50dUpWK0c5eVJH?=
 =?utf-8?B?eEJWanRITUExNGxNUDhrZHRsVnExYVA5dVlWbGk3YXMxV0tqd2FjNzFWU3lx?=
 =?utf-8?B?c2c4bW9kZGRqVForcHhWQlN3WXdZN21BaTYxYm0xTVRVTjVTeVNYNXl2Ti9S?=
 =?utf-8?B?eDZNdC9NcDd4cVREbURIeUtkbnlkK25tS29rbDNUUk9pMGpOQzF3cnRzS0xW?=
 =?utf-8?B?bHNFRzBNNXFSSlBTL1pEc3gwenBEamNFSzIzUG1YQWtpU29rcWJvdjhnbFg5?=
 =?utf-8?B?ZGRHaEZ2NzY3Nk1WTFVQbUFzbGM0NmJXeEpSajBSZG5ybVM5RERaQWdKeVJk?=
 =?utf-8?B?RnovTTZZa0QzUkRqbndDS1IvczJQUGlRUUVaek9iTmJpRkNCUk10eWN4Znlk?=
 =?utf-8?B?QWRjdlhrWjJGRzd4RlhneGVBQUMybVNpeHdKNS9DSHZxZ1pWakpURkttcXAx?=
 =?utf-8?B?eVhrY3lXM1RWSTdqazBiNVlZMkpkaVkvRm5GSmJ5MG9WUHRDUmpYOSs2a3lH?=
 =?utf-8?B?SWxNUmhIdndUMzlPR3NaZXBEK1JJMWVvM2Zma3VvSHpIS1NHcjR4Rmt5NFFr?=
 =?utf-8?B?Nmx5MGRtY3d6bzRPR3lTb3lXd2hiN3R4OXlnTzdWTk1LWU1XV1prcXkwbHdO?=
 =?utf-8?B?THRybnNOMXhVK2hPVHZpYnJCSTJyTmxVV0RnSFVvcnRCaGt3TzBYWTlMc0xO?=
 =?utf-8?B?ZnhtRXZ2QUh1ZnJHUmhPZmFsWDQzZFNnL0dHKytrb0dpTWRaNzdjYnNSZnRt?=
 =?utf-8?B?UEVlNWJRRjE5bzJFUTQxV1ZyRDd3YysrbW1RREZIYzdHSmJZcHkzY0ZYVmJn?=
 =?utf-8?B?NnRGekRMMlBId3Jqa1MwTjg4cU1ucmZlMUJDK1JJWkZLZUJ4RXVBTE9KUm01?=
 =?utf-8?B?T3J3aGt6RVpteGpDWSs4ZHcxVWFmaTVBdjRmUzhTaVJZSng5aVJDZVBJZEdL?=
 =?utf-8?B?SEYzYzNzRlEyekYvTjJDZ2VLK1ppR25ZaWdxcmt3aHk2YS92V1F4VGpIaDRR?=
 =?utf-8?B?ME1tY2YvUnhZUmpSZjFaOHNvRVk2OHU1VFpCU2lYWUJmVXJsdlQvc1dMWUp6?=
 =?utf-8?B?anFpM0dYcStEeUJZZ3VqUDBaNytPaysrMkJ5a0dZV2UvUjhZU3hQemRERE9m?=
 =?utf-8?B?TE1FdVN6VWd0dVBjRW12TlFaQm5uSVlXZVpvOEFVVjV0YVhvY0VBK3UrbEhr?=
 =?utf-8?B?ZkJ0cmZ0TVJJVW0xUEpndUc2UjJMYjRvMHNLTmxaNHFmcVN0dHVaY1Y0N2VD?=
 =?utf-8?B?WUVZRmRNMFRaU0Y3clp3a1Q5YVBhQ2oydk1vcngrRTNUTHRHVUY3UCthZitj?=
 =?utf-8?B?QVQ4VUZ0LzJiRkZ0ME5QMytlOTU5Um9ZTGxNcSsrRDB3N1pLRmZMMFp0aUxW?=
 =?utf-8?B?S3VhZHA0bFh2NlBONTRiK0RMMW1BS1BVcjIrSXhKVDREMk5QQW1pZnBlRkVz?=
 =?utf-8?B?SWJJclREY3prNzFJRGpITGhTZWp4WDVDSVBORFZYY0NMTFdNZFg3T2NhZWt0?=
 =?utf-8?B?RFd1dk5QZy85TU5wa0xCcEY1Zk5ObitPUEUzbXBXcktKRldtS3dMbXpKUkRJ?=
 =?utf-8?Q?UUhk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84C3064BA40C8F41B07FC952CA9BA547@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf23327-1636-47ec-3925-08dc845bbb62
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 06:01:10.0222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGmRBu7Rdx29U/Evy2T1dEJh62/qESEpgEQOD7UwdnFNUQzuTwsGBFPeiwUNh5eCb2DkRIf0MRVCzqnKI5+A1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6379

T24gMjAyNC82LzQgMTM6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wNi4yMDI0IDA1
OjA0LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzUvMzAgMjM6NTEsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+IE9uIDMwLjA1LjIwMjQgMTM6MTksIENoZW4sIEppcWlhbiB3cm90ZToN
Cj4+Pj4gT24gMjAyNC81LzI5IDIwOjIyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDI5
LjA1LjIwMjQgMTM6MTMsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+PiBPbiAyMDI0LzUvMjkg
MTU6MTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAyOS4wNS4yMDI0IDA4OjU2LCBD
aGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4+PiBPbiAyMDI0LzUvMjkgMTQ6MzEsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDI5LjA1LjIwMjQgMDQ6NDEsIENoZW4sIEppcWlhbiB3
cm90ZToNCj4+Pj4+Pj4+Pj4gQnV0IEkgZm91bmQgaW4gZnVuY3Rpb24gaW5pdF9pcnFfZGF0YToN
Cj4+Pj4+Pj4+Pj4gICAgIGZvciAoIGlycSA9IDA7IGlycSA8IG5yX2lycXNfZ3NpOyBpcnErKyAp
DQo+Pj4+Pj4+Pj4+ICAgICB7DQo+Pj4+Pj4+Pj4+ICAgICAgICAgaW50IHJjOw0KPj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+PiAgICAgICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhpcnEpOw0KPj4+Pj4+Pj4+
PiAgICAgICAgIGRlc2MtPmlycSA9IGlycTsNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gICAgICAg
ICByYyA9IGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KPj4+Pj4+Pj4+PiAgICAgICAgIGlmICgg
cmMgKQ0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICByZXR1cm4gcmM7DQo+Pj4+Pj4+Pj4+ICAgICB9
DQo+Pj4+Pj4+Pj4+IERvZXMgaXQgbWVhbiB0aGF0IHdoZW4gaXJxIDwgbnJfaXJxc19nc2ksIHRo
ZSBnc2kgYW5kIGlycSBpcyBhIDE6MSBtYXBwaW5nPw0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gTm8s
IGFzIGV4cGxhaW5lZCBiZWZvcmUuIEkgYWxzbyBkb24ndCBzZWUgaG93IHlvdSB3b3VsZCBkZXJp
dmUgdGhhdCBmcm9tIHRoZSBjb2RlIGFib3ZlLg0KPj4+Pj4+Pj4gQmVjYXVzZSBoZXJlIHNldCBk
ZXNjLT5pcnEgPSBpcnEsIGFuZCBpdCBzZWVtcyB0aGVyZSBpcyBubyBvdGhlciBwbGFjZSB0byBj
aGFuZ2UgdGhpcyBkZXNjLT5pcnEsIHNvLCBnc2kgMSBpcyBjb25zaWRlcmVkIHRvIGlycSAxLg0K
Pj4+Pj4+Pg0KPj4+Pj4+PiBXaGF0IGFyZSB5b3UgdGFraW5nIHRoaXMgZnJvbT8gVGhlIGxvb3Ag
Ym91bmQgaXNuJ3QgbnJfZ3NpcywgYW5kIHRoZSBpdGVyYXRpb24NCj4+Pj4+Pj4gdmFyaWFibGUg
aXNuJ3QgaW4gR1NJIHNwYWNlIGVpdGhlcjsgaXQncyBpbiBJUlEgbnVtYmVyaW5nIHNwYWNlLiBJ
biB0aGlzIGxvb3ANCj4+Pj4+Pj4gd2UncmUgbWVyZWx5IGxldmVyYWdpbmcgdGhhdCBldmVyeSBH
U0kgaGFzIGEgY29ycmVzcG9uZGluZyBJUlE7DQo+Pj4+Pj4+IHRoZXJlIGFyZSBubyBhc3N1bXB0
aW9ucyBtYWRlIGFib3V0IHRoZSBtYXBwaW5nIGJldHdlZW4gdGhlIHR3by4gQWZhaWNzIGF0IGxl
YXN0Lg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4+ICJucl9pcnFzX2dzaSIgZGVzY3JpYmVzIHdoYXQgaXRz
IG5hbWUgc2F5czogVGhlIG51bWJlciBvZg0KPj4+Pj4+Pj4+IElSUXMgbWFwcGluZyB0byBhIChf
c29tZV8pIEdTSS4gVGhhdCdzIHRvIHRlbGwgdGhlbSBmcm9tIHRoZSBub24tR1NJIChpLmUuDQo+
Pj4+Pj4+Pj4gbWFpbmx5IE1TSSkgb25lcy4gVGhlcmUncyBubyBpbXBsaWNhdGlvbiB3aGF0c29l
dmVyIG9uIHRoZSBJUlEgPC0+IEdTSQ0KPj4+Pj4+Pj4+IG1hcHBpbmcuDQo+Pj4+Pj4+Pj4NCj4+
Pj4+Pj4+Pj4gV2hhdCdzIG1vcmUsIHdoZW4gdXNpbmcgUEhZU0RFVk9QX3NldHVwX2dzaSwgaXQg
Y2FsbHMgbXBfcmVnaXN0ZXJfZ3NpLA0KPj4+Pj4+Pj4+PiBhbmQgaW4gbXBfcmVnaXN0ZXJfZ3Np
LCBpdCB1c2VzICIgZGVzYyA9IGlycV90b19kZXNjKGdzaSk7ICIgdG8gZ2V0IGlycV9kZXNjIGRp
cmVjdGx5Lg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gV2hpY2ggbWF5IGJlIHdyb25nLCB3aGlsZSB0
aGF0IHdyb25nLW5lc3MgbWF5IG5vdCBoYXZlIGhpdCBhbnlvbmUgaW4NCj4+Pj4+Pj4+PiBwcmFj
dGljZSAoZm9yIHJlYXNvbnMgdGhhdCB3b3VsZCBuZWVkIHdvcmtpbmcgb3V0KS4NCj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+PiBDb21iaW5pbmcgYWJvdmUsIGNhbiB3ZSBjb25zaWRlciAiZ3NpID09IGly
cSIgd2hlbiBpcnEgPCBucl9pcnFzX2dzaSA/DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBBZ2FpbiAt
IG5vLg0KPj4+Pj4+Pj4gU2luY2UgeW91IGFyZSBjZXJ0YWluIHRoYXQgdGhleSBhcmUgbm90IGVx
dWFsLCBjb3VsZCB5b3UgdGVsbCBtZSB3aGVyZSBzaG93IHRoZXkgYXJlIG5vdCBlcXVhbCBvciB3
aGVyZSBidWlsZCB0aGVpciBtYXBwaW5ncywNCj4+Pj4+Pj4+IHNvIHRoYXQgSSBjYW4ga25vdyBo
b3cgdG8gZG8gYSBjb252ZXJzaW9uIGdzaSBmcm9tIGlycS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSBk
aWQgcG9pbnQgeW91IGF0IHRoZSBBQ1BJIEludGVycnVwdCBTb3VyY2UgT3ZlcnJpZGUgc3RydWN0
dXJlIGJlZm9yZS4NCj4+Pj4+Pj4gV2UncmUgcGFyc2luZyB0aG9zZSBpbiBhY3BpX3BhcnNlX2lu
dF9zcmNfb3ZyKCksIHRvIGdpdmUgeW91IGEgcGxhY2UgdG8NCj4+Pj4+Pj4gc3RhcnQgZ29pbmcg
ZnJvbS4NCj4+Pj4+PiBPaCEgSSB0aGluayBJIGtub3cuDQo+Pj4+Pj4gSWYgSSB3YW50IHRvIHRy
YW5zZm9ybSBnc2kgdG8gaXJxLCBJIG5lZWQgdG8gZG8gYmVsb3c6DQo+Pj4+Pj4gCWludCBpcnEs
IGVudHJ5LCBpb2FwaWMsIHBpbjsNCj4+Pj4+Pg0KPj4+Pj4+IAlpb2FwaWMgPSBtcF9maW5kX2lv
YXBpYyhnc2kpOw0KPj4+Pj4+IAlwaW4gPSBnc2kgLSBtcF9pb2FwaWNfcm91dGluZ1tpb2FwaWNd
LmdzaV9iYXNlOw0KPj4+Pj4+IAllbnRyeSA9IGZpbmRfaXJxX2VudHJ5KGlvYXBpYywgcGluLCBt
cF9JTlQpOw0KPj4+Pj4+IAlpcnEgPSBwaW5fMl9pcnEoZW50cnksIGlvYXBpYywgcGluKTsNCj4+
Pj4+Pg0KPj4+Pj4+IEFtIEkgcmlnaHQ/DQo+Pj4+Pg0KPj4+Pj4gVGhpcyBsb29rcyBwbGF1c2li
bGUsIHllcy4NCj4+Pj4gSSBkdW1wIGFsbCBtcGNfY29uZmlnX2ludHNyYyBvZiBhcnJheSBtcF9p
cnFzLCBpdCBzaG93czoNCj4+Pj4gKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5cGUg
MCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDAgZHN0YXBpYyAzMyBkc3RpcnEgMg0KPj4+
PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMTUgc3JjYnVz
IDAgc3JjYnVzaXJxIDkgZHN0YXBpYyAzMyBkc3RpcnEgOQ0KPj4+PiAoWEVOKSBmaW5kX2lycV9l
bnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgMSBkc3Rh
cGljIDMzIGRzdGlycSAxDQo+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBl
IDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAzIGRzdGFwaWMgMzMgZHN0aXJxIDMNCj4+
Pj4gKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVz
IDAgc3JjYnVzaXJxIDQgZHN0YXBpYyAzMyBkc3RpcnEgNA0KPj4+PiAoWEVOKSBmaW5kX2lycV9l
bnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgNSBkc3Rh
cGljIDMzIGRzdGlycSA1DQo+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBl
IDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSA2IGRzdGFwaWMgMzMgZHN0aXJxIDYNCj4+
Pj4gKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVz
IDAgc3JjYnVzaXJxIDcgZHN0YXBpYyAzMyBkc3RpcnEgNw0KPj4+PiAoWEVOKSBmaW5kX2lycV9l
bnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgOCBkc3Rh
cGljIDMzIGRzdGlycSA4DQo+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBl
IDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAxMCBkc3RhcGljIDMzIGRzdGlycSAxMA0K
Pj4+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNi
dXMgMCBzcmNidXNpcnEgMTEgZHN0YXBpYyAzMyBkc3RpcnEgMTENCj4+Pj4gKFhFTikgZmluZF9p
cnFfZW50cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDEy
IGRzdGFwaWMgMzMgZHN0aXJxIDEyDQo+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBp
cnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAxMyBkc3RhcGljIDMzIGRzdGly
cSAxMw0KPj4+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcg
MCBzcmNidXMgMCBzcmNidXNpcnEgMTQgZHN0YXBpYyAzMyBkc3RpcnEgMTQNCj4+Pj4gKFhFTikg
ZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVz
aXJxIDE1IGRzdGFwaWMgMzMgZHN0aXJxIDE1DQo+Pj4+DQo+Pj4+IEl0IHNlZW1zIG9ubHkgTGVn
YWN5IGlycSBhbmQgZ3NpWzA6MTVdIGhhcyBhIG1hcHBpbmcgaW4gbXBfaXJxcy4NCj4+Pj4gT3Ro
ZXIgZ3NpIGNhbiBiZSBjb25zaWRlcmVkIDE6MSBtYXBwaW5nIHdpdGggaXJxPyBPciBhcmUgdGhl
cmUgb3RoZXIgcGxhY2VzIHJlZmxlY3QgdGhlIG1hcHBpbmcgYmV0d2VlbiBpcnEgYW5kIGdzaT8N
Cj4+Pg0KPj4+IEl0IG1heSBiZSB1bmNvbW1vbiB0byBoYXZlIG92ZXJyaWRlcyBmb3IgaGlnaGVy
IEdTSXMsIGJ1dCBJIGRvbid0IHRoaW5rIEFDUEkNCj4+PiBkaXNhbGxvd3MgdGhhdC4NCj4+IERv
IHlvdSBzdWdnZXN0IG1lIHRvIGFkZCBvdmVycmlkZXMgZm9yIGhpZ2hlciBHU0lzIGludG8gYXJy
YXkgbXBfaXJxcz8NCj4gDQo+IFdoeSAiYWRkIj8gVGhhdCdzIHdoYXQgbXBfb3ZlcnJpZGVfbGVn
YWN5X2lycSgpIGFscmVhZHkgZG9lcywgaXNuJ3QgaXQ/DQpOby4gbXBfb3ZlcnJpZGVfbGVnYWN5
X2lycSBvbmx5IG92ZXJyaWRlcyBmb3IgZ3NpIDwgMTYsIGJ1dCBub3QgZm9yIGdzaSA+PSAxNihJ
IGR1bXAgYWxsIG1hcHBpbmdzIGZyb20gYXJyYXkgbXBfaXJxcykuDQpJbiBteSBlbnZpcm9ubWVu
dCwgZ3NpIG9mIG15IGRHUFUgaXMgMjQuDQpTbywgaG93IGRvIEkgcHJvY2VzcyBmb3IgZ3NpID49
IDE2Pw0KDQo+IEFzc3VtaW5nIG9mIGNvdXJzZSBhbnkgYXJlIHN1cmZhY2VkIGF0IGFsbCBieSBB
Q1BJLg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

