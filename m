Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3D8D353D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 13:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731819.1137540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHFv-0008Qt-N0; Wed, 29 May 2024 11:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731819.1137540; Wed, 29 May 2024 11:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHFv-0008PG-Jg; Wed, 29 May 2024 11:14:07 +0000
Received: by outflank-mailman (input) for mailman id 731819;
 Wed, 29 May 2024 11:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Qc4=NA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sCHFt-0008PA-DU
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 11:14:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:200a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d8f7b36-1dac-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 13:14:03 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 11:13:57 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 11:13:57 +0000
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
X-Inumbo-ID: 8d8f7b36-1dac-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdLoeC2dZNjczCD01oO8MJDc5dH1XZIxF3BmxP3UbDPsvKrllMs1PGUKs1mV3FjZ/N8hJjK8KxbGEKEUOPzkqkRFjny1WqiN4LWOMypdHePNJ4HUl9/1CASbhf78cKJrMARGs8eA3piYuqY5GllA/MoKJn4Xc+7jmWfL5MD839sVpIPvzcWgDas9dNaHt2CAocs4v/VARg7ZWXPlVIVU1WUQxqvwN6SObxgkyqc77ilqprMMEKeK6NdKSZee5RCTvdFp9RORcXu7I2SRvEesYKodBfdJeLnvfOGsCeQZBEm2qvC2fPKKu7lPGPrCqCNo7nEjX2yZFvd7kiKIg6+sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouve0qwK2OY5i048n9z/9WGma22Qu49JQu6el8IvFSs=;
 b=cpbNvWVLei1q5h4GYNjdQdR/sd+PnmdqA/70NPWVXJPJUc5mXaWHvYP/8k7JL97Sr99mUsrQLeI2P0axaeSBVIZqqFkST0k9y0qHNKsf98T/6lQg9pkJ74iVmXOM84Uzo2e9ti32pXNenvhq6PB/EfdomoNE8hWLB27mTOTljArRwOMQOCEoPMw1ChBFa6i+XNyymEY6b1GvJm8uRGOShZoN29nqnMZvFPKf7gCBIDuRPcyOei5+KAdkIAMBCYInXJzLoa241PCZLihwn/wPxQx1F2Dkj2Z6eX8v1lSGV+NqhbFVjU0SXrh8XKUrTXIMcoaXNCprkV0XE2kX7eJJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouve0qwK2OY5i048n9z/9WGma22Qu49JQu6el8IvFSs=;
 b=qiH/L9VWckqnt3pBFxhQGu4AC6t61Ool9Ns6NnLvomnLjsTNxvDcLSeanKACI/0pjemlCzykmRPubea4vegPAJl17+dxuF4K1EsfnTAOKPuWZORJWPW4RWRBhMaavof2u1u0GUU1aWAmDsH2CiqCizjhKzDlkXYlyXsrQNoMqWs=
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
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA
Date: Wed, 29 May 2024 11:13:57 +0000
Message-ID:
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
In-Reply-To: <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7611.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV3PR12MB9259:EE_
x-ms-office365-filtering-correlation-id: 1ad8e48d-cc7f-4b05-847b-08dc7fd06ef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?cFJ5SzAveVhRS3o2SXRnOGJXbjQ3ZC9NRlVXaklnMVdPOVpzek5WQ29RS0t6?=
 =?utf-8?B?bHFLMkFDVUlZM1ViZWZsZDhuQUc0dDdzd1VjWElPYWx6a1NRMXFQMGFTRGVm?=
 =?utf-8?B?K0FPNlYwc1JTT1VTN2RvYmQyanpGMWZlQUk4RENLdXlGUy9TajdyL3V2a25K?=
 =?utf-8?B?NE52WTNwTkZ4STk5TWNmd3lCTnJPRlJCYnpMbUw1eTFCMHpuQkp4dHFZZGw0?=
 =?utf-8?B?V0c2NE9selJoeWRXVmwzcGIwUTJUWmhJY2dpMDd3enpTSzkrVUR0VlZjbTN1?=
 =?utf-8?B?dzZkNlJsWWxMeUZxeTBlbWo1eHgwMUppUVNWUUdCZy9XR3NoVFJIU1RqR1JU?=
 =?utf-8?B?N3o4UDI1WnVNMUwwWlJUZVA0QTk0QTd1UFJCVERGTDkwN1JEeGZRQ2RmK1pi?=
 =?utf-8?B?OFZxZU4yclpsamZkRjFQek9FV0E3QVNqczU1OGIxWi9IY3pUWS91Yll5aExK?=
 =?utf-8?B?Ti9nY1ducUFSRUJLcVUzSlE1S1paREtTdnFMNUFQcDMrcTZqczR6aFdMZ2lv?=
 =?utf-8?B?K2R3d3E2OTVZdFBhckgxWTBRUnc3VzR4cHk2bXJGNU1UVjRPQVhubjJ2WVZO?=
 =?utf-8?B?RmxnbjVEa3NMUmJKMDRES3ZyLytzN3hWK2RKVFFZcHJlaExNVS96R2s0U1cv?=
 =?utf-8?B?YWJNaU9lLzVjYmFuaXIxcWRGWEszbm9BNkRpQXJYTWxaUXFyR0ZtMXdYL3lQ?=
 =?utf-8?B?K09pam94bHJibkhXZVVFUi9YVDA3d0V2cUxoWXZiQjIyS2pQNTNtOCt1RFor?=
 =?utf-8?B?NGhZMjdvd2ppRlRyZ1BxeDh2dEV2dVFXOFRRVzBBYXRaSlhZbllTREpYRWQy?=
 =?utf-8?B?N2piZEQ4Wi9naTFPWlpTRUJzQkl6aFU4SzFaN2dtN0h6cERXbjVZVFlqOFJk?=
 =?utf-8?B?REtnZnNxRFBiNTZxZHJqWmlIUEVCZDgyNkVEMmNFVlduVW03MzdZWHJjWnl4?=
 =?utf-8?B?NEJZTktBMWxjeGh3KzZ1M2NoUkZqYnd4QzRTc0hxNEJxTTdXeEpDekZZZlV0?=
 =?utf-8?B?VUdPYnBJSjBRRHhZUEp1OTUyOGF3NXJ5b2ZldXUxMFdJTXkzWU0yVHlLVDRw?=
 =?utf-8?B?NVR0SUpPWEkyeVV2STBEaXoyODFodnlXV203MUtFU1Bxa1lSazFMbTk2Ty9r?=
 =?utf-8?B?dHdzQzVPTFBTOFFJY0dxS2h4RlZyQkxKbWIzK2FVejM4c1I3ZXYxdlEwNEFi?=
 =?utf-8?B?bW1DK3diM3lKVkd3NmV3ekprUDVYR1V5VHAvQ2g1MkFPSUZzM2tVL3ZUNlFn?=
 =?utf-8?B?UmtGbTBKK09KMDNlcmUzR0c0TEt3ZW1rQjVuOEFaTDN4UDE1bkR0dnBveFA1?=
 =?utf-8?B?MXlnWWZ2b2JUN1E4NE5oLzU1R2t0aHpHNnhYQnhkS2JucnNLZnR5bVNpNDJP?=
 =?utf-8?B?ekxWK1M4UkZPVkloNGFPL2N0NHphWW5YK1NycWhOTXNjVVAwYmVRMHNWWEdW?=
 =?utf-8?B?eVlMSXFvd3VCSG5LRmhkR3Y3RDlzR0RNVzJkbXV3LzZ6L1pLN0RqY21uNm55?=
 =?utf-8?B?cjRrU0V0Qm9yOHVyd2crTXZTTlNJSjhIRmFtQjRKWlN1NHdUQ0hlVXBOeFds?=
 =?utf-8?B?dkU2Y3pnVzNJM3NqRWxMdEN4YUEyc1IvVEF1eEQwNXFiYzVvQXQxUmFjcVpC?=
 =?utf-8?B?MThXdnhZMUFIb1dURE1YcnV5bWswQkJzT09jNG12Q2pWdEYvbkNFMGMvNVJw?=
 =?utf-8?B?WFVjMVBmVDg3MmxoZ0kwZ1owbmh6QzZhS2VqQ1E4ZDlvVVFaWGJuR0RPUlZQ?=
 =?utf-8?Q?02OsxhmFcrOVpQs/YckG07yDYgqoyN5A0ZKbnHC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2F5UjJNRUxHOTV3ay92OU5iQ2lzVzkrdFdpZlQwNUxYRXRCVjVDUHl5NG5z?=
 =?utf-8?B?d3NUQWovenUybUFUNGNabkF5Yk95aklxUDBWZU1XbWFtV2RoaVFpbVpBTGVv?=
 =?utf-8?B?bHNSNkxuNjBvTkZuQ3ZGQ0IwcVpkWEd4ZUNHK0NpdEFWcUZ1RFBJalFsSzdo?=
 =?utf-8?B?em9SSVpoWm1IRXNaU2tMMkNXdXVISWg1SFhxMDRvTmVWVHBMSStjTHJvL1ln?=
 =?utf-8?B?bEdlVklZUG5mU3diNDNxQk1Ib1AxTnMvWGROQzBYeTFkTUFsMm9vSHBRRU91?=
 =?utf-8?B?RW5UUDllbmZJZ0NPRk95RDNQblpRKytYeVhHczlZTDhhNmdjdldkVVRGaThD?=
 =?utf-8?B?dVlKMFc3b2RPY2xHRFpHT1dESUQ0YVFCWkpjVEFKYktsSmNKYXNqNjg5TXdN?=
 =?utf-8?B?dFJnaHJmRmg5WnVYVjBWeDlOWkJ5YnE0RlUxU2Q1NllPZkJMRjVSL1VPbnBT?=
 =?utf-8?B?Rmg5OFdabUpJTmFSL3hzUjZVajNSQjI3eCtvODdjZFhXSkIwYTBwWktBUVht?=
 =?utf-8?B?Vm5wM0NhcEx3ZXl0SWhoeTBUUEVhTFZlQjcvN2Y1R2pXZS9qZFlRbjJmblRr?=
 =?utf-8?B?N1ZQM042NjFUZUlnSUdlS3pqeVRKYkR4cThtWC9YYkYzRWt4VStoRXhlbDZG?=
 =?utf-8?B?NHU0eEVNTmcvazF2c3Rkc2ltT2NXMi9QOGRoM29TZ2wralQ3U09HSy9pUlJQ?=
 =?utf-8?B?eTJUbjByVXpqUGplZEtYSk01NnpLUkJuQjBZT09jT0FiYkllK1dMS2RERFVo?=
 =?utf-8?B?Z2Q2b1lwM0c1MUVUdURsMXB6ZzNkdHVNVVY3blFuclRwZnQwSi9mZklNRDc0?=
 =?utf-8?B?K093OXk5ME5VZFhBS1JEcmJ0ZW9xZHhGRndMRGRpMGtZaDBHQVlxSExmY0xt?=
 =?utf-8?B?WXdZUmR4eURGbnJ5UE43Y1pncS9SN1JtcHlzT1RyVHJHVWdMd0RRZU80dFpN?=
 =?utf-8?B?cFdjYUEzU1lMMWNiQ3kxUkR4Y2Flc0EwRmo3UlVqSjdjUTdBN2REUWwxL1Bw?=
 =?utf-8?B?RjBja05YcWN6SjV6bXZUbEkwUVBJamo3NVN3V1pZcjFaL1VHWVBHZVFSdmJJ?=
 =?utf-8?B?VUxjeVMxMlIxRW1FM2kxZ1drZ0lYSUNkSWtTLysybkZCeVAzK0JwZktmZjdj?=
 =?utf-8?B?VWYrTnNLaW9jdzRIUkdDWHVhd1l4b2JvWWttYkNYeUFWRnY1K2d4OVhpVHBj?=
 =?utf-8?B?KzlqYWVLaFlzNDVCUFZtcEZGMTBNVGw1Q1dkVGJaRDd1Ylo4Qm1hRXhCQ0JT?=
 =?utf-8?B?ZTM4c0dQZ21VajRhWlU0YjR1eVJ2WTlvUmMyZmYweXJ6S3packtaTEJjVVZo?=
 =?utf-8?B?NmYxNjVwdDY2bmlsNTFPSW9qSmdyN2x3ajNqSGxHU0poay9vT2JJcHhtU0Rr?=
 =?utf-8?B?RG96b094WFRzRkxHb2M4UElBSmMveFVaK0VlYk1QeE05dXpUa0xsMFJkRnZ3?=
 =?utf-8?B?OVRFTk52a2Y2WFdLRFNkV1IwQ0JUNkt5UU5xV3I4TXBSZXNZS1hFYklWcGpw?=
 =?utf-8?B?Qm1NN0VWcEgxdFpuSFBrRUxoWU9vTjNTTkVkVmRETUFPS1Z4QUhxUDNWRUd5?=
 =?utf-8?B?NWVrR2p4WmlPbzF0dTk2bXIyTFFwVVh0S0YxTTErM0VHSVpPWDk5Nzh1OExh?=
 =?utf-8?B?b2dCNHVUNkI4cHFSTmdtUFN2N0lwYml4SFlRZ2lLKzZUdTVpNTV2dk5BMEZo?=
 =?utf-8?B?MlhBQWJpMjhoVzJEank4ek1Hckl6c3UzbnFGWWxhVG5CM1FHMExMVWFTYzhq?=
 =?utf-8?B?emt1VWJoYzlIK2hQSkh5WjZXY0R1bnR0aVpQT2NXZnZ1TDZRY0laVjdBUlcy?=
 =?utf-8?B?K1BPYjkwK1oyZCs1LzBLemg3VGNRYWtlSHZxa3JZNjJxME5vSW9xc1BQVVhT?=
 =?utf-8?B?aXVzQ0pYMHJrV3V4OGwzcUpmNzNVM3A4djYwRExPKy9PMXVVc1BhblRKR1Jq?=
 =?utf-8?B?WTJmaHZUNTMzcUZQUG5GUXpDSlZNWXFTTjYvUnZkc0FueVJCMUxvZ0dodmxI?=
 =?utf-8?B?Qm0vMEpSSWhOSFVmNlh0K09LQXltNkFjVDVlMWlFc1FVTUExNWJETlhqYm5R?=
 =?utf-8?B?VHRHLzAycFppbGQ0Nkc5VVdzc3M5OFpFSngrMCtCWk12OXV6SHdxRzFNKzdG?=
 =?utf-8?Q?48rs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00EAC22BEDC7CC45AD35FCAA6E14900A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad8e48d-cc7f-4b05-847b-08dc7fd06ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 11:13:57.0664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Tnjs22SOMI/WYXOHGycthKOHbOMqioKXwdIXt45zbb1XPEyEe22c/ma5a4qQBdZo5CvXxL8gmG9uiWVdWd49A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259

T24gMjAyNC81LzI5IDE1OjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjkuMDUuMjAyNCAw
ODo1NiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzI5IDE0OjMxLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyOS4wNS4yMDI0IDA0OjQxLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IEhpLA0KPj4+PiBPbiAyMDI0LzUvMTcgMTk6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4+Pj4gT24gMTcuMDUuMjAyNCAxMzoxNCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+IE9u
IDIwMjQvNS8xNyAxODo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDE3LjA1LjIw
MjQgMTI6NDUsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+Pj4+IE9uIDIwMjQvNS8xNiAyMjow
MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gMTYuMDUuMjAyNCAxMTo1MiwgSmlx
aWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIGlmICggZ3NpID49IG5yX2lycXNf
Z3NpICkNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgcmV0
ID0gLUVJTlZBTDsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+Pj4+PiAr
ICAgICAgICB9DQo+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgaWYgKCAhaXJxX2Fj
Y2Vzc19wZXJtaXR0ZWQoY3VycmVudC0+ZG9tYWluLCBnc2kpIHx8DQo+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+PiBJLmUuIGFzc3VtaW5nIElSUSA9PSBHU0k/IElzIHRoYXQgYSB2YWxpZCBhc3N1bXB0aW9u
IHdoZW4gYW55IG51bWJlciBvZg0KPj4+Pj4+Pj4+IHNvdXJjZSBvdmVycmlkZXMgbWF5IGJlIHN1
cmZhY2VkIGJ5IEFDUEk/DQo+Pj4+Pj4+PiBBbGwgaXJxcyBzbWFsbGVyIHRoYW4gbnJfaXJxc19n
c2kgYXJlIGdzaSwgYXJlbid0IHRoZXk/DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoZXkgYXJlLCBidXQg
dGhlcmUncyBub3QgbmVjZXNzYXJpbHkgYSAxOjEgbWFwcGluZy4NCj4+Pj4+PiBPaCwgc28gZG8g
SSBuZWVkIHRvIGFkZCBhIG5ldyBnc2lfY2FwcyB0byBzdG9yZSBncmFudGVkIGdzaT8NCj4+Pj4+
DQo+Pj4+PiBQcm9iYWJseSBub3QuIFlvdSBvdWdodCB0byBiZSBhYmxlIHRvIHRyYW5zbGF0ZSBi
ZXR3ZWVuIEdTSSBhbmQgSVJRLA0KPj4+Pj4gYW5kIHRoZW4gY29udGludWUgdG8gcmVjb3JkIGlu
IC8gY2hlY2sgYWdhaW5zdCBJUlEgcGVybWlzc2lvbnMuDQo+Pj4+IEJ1dCBJIGZvdW5kIGluIGZ1
bmN0aW9uIGluaXRfaXJxX2RhdGE6DQo+Pj4+ICAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBucl9p
cnFzX2dzaTsgaXJxKysgKQ0KPj4+PiAgICAgew0KPj4+PiAgICAgICAgIGludCByYzsNCj4+Pj4N
Cj4+Pj4gICAgICAgICBkZXNjID0gaXJxX3RvX2Rlc2MoaXJxKTsNCj4+Pj4gICAgICAgICBkZXNj
LT5pcnEgPSBpcnE7DQo+Pj4+DQo+Pj4+ICAgICAgICAgcmMgPSBpbml0X29uZV9pcnFfZGVzYyhk
ZXNjKTsNCj4+Pj4gICAgICAgICBpZiAoIHJjICkNCj4+Pj4gICAgICAgICAgICAgcmV0dXJuIHJj
Ow0KPj4+PiAgICAgfQ0KPj4+PiBEb2VzIGl0IG1lYW4gdGhhdCB3aGVuIGlycSA8IG5yX2lycXNf
Z3NpLCB0aGUgZ3NpIGFuZCBpcnEgaXMgYSAxOjEgbWFwcGluZz8NCj4+Pg0KPj4+IE5vLCBhcyBl
eHBsYWluZWQgYmVmb3JlLiBJIGFsc28gZG9uJ3Qgc2VlIGhvdyB5b3Ugd291bGQgZGVyaXZlIHRo
YXQgZnJvbSB0aGUgY29kZSBhYm92ZS4NCj4+IEJlY2F1c2UgaGVyZSBzZXQgZGVzYy0+aXJxID0g
aXJxLCBhbmQgaXQgc2VlbXMgdGhlcmUgaXMgbm8gb3RoZXIgcGxhY2UgdG8gY2hhbmdlIHRoaXMg
ZGVzYy0+aXJxLCBzbywgZ3NpIDEgaXMgY29uc2lkZXJlZCB0byBpcnEgMS4NCj4gDQo+IFdoYXQg
YXJlIHlvdSB0YWtpbmcgdGhpcyBmcm9tPyBUaGUgbG9vcCBib3VuZCBpc24ndCBucl9nc2lzLCBh
bmQgdGhlIGl0ZXJhdGlvbg0KPiB2YXJpYWJsZSBpc24ndCBpbiBHU0kgc3BhY2UgZWl0aGVyOyBp
dCdzIGluIElSUSBudW1iZXJpbmcgc3BhY2UuIEluIHRoaXMgbG9vcA0KPiB3ZSdyZSBtZXJlbHkg
bGV2ZXJhZ2luZyB0aGF0IGV2ZXJ5IEdTSSBoYXMgYSBjb3JyZXNwb25kaW5nIElSUTsNCj4gdGhl
cmUgYXJlIG5vIGFzc3VtcHRpb25zIG1hZGUgYWJvdXQgdGhlIG1hcHBpbmcgYmV0d2VlbiB0aGUg
dHdvLiBBZmFpY3MgYXQgbGVhc3QuDQo+IA0KPj4+ICJucl9pcnFzX2dzaSIgZGVzY3JpYmVzIHdo
YXQgaXRzIG5hbWUgc2F5czogVGhlIG51bWJlciBvZg0KPj4+IElSUXMgbWFwcGluZyB0byBhIChf
c29tZV8pIEdTSS4gVGhhdCdzIHRvIHRlbGwgdGhlbSBmcm9tIHRoZSBub24tR1NJIChpLmUuDQo+
Pj4gbWFpbmx5IE1TSSkgb25lcy4gVGhlcmUncyBubyBpbXBsaWNhdGlvbiB3aGF0c29ldmVyIG9u
IHRoZSBJUlEgPC0+IEdTSQ0KPj4+IG1hcHBpbmcuDQo+Pj4NCj4+Pj4gV2hhdCdzIG1vcmUsIHdo
ZW4gdXNpbmcgUEhZU0RFVk9QX3NldHVwX2dzaSwgaXQgY2FsbHMgbXBfcmVnaXN0ZXJfZ3NpLA0K
Pj4+PiBhbmQgaW4gbXBfcmVnaXN0ZXJfZ3NpLCBpdCB1c2VzICIgZGVzYyA9IGlycV90b19kZXNj
KGdzaSk7ICIgdG8gZ2V0IGlycV9kZXNjIGRpcmVjdGx5Lg0KPj4+DQo+Pj4gV2hpY2ggbWF5IGJl
IHdyb25nLCB3aGlsZSB0aGF0IHdyb25nLW5lc3MgbWF5IG5vdCBoYXZlIGhpdCBhbnlvbmUgaW4N
Cj4+PiBwcmFjdGljZSAoZm9yIHJlYXNvbnMgdGhhdCB3b3VsZCBuZWVkIHdvcmtpbmcgb3V0KS4N
Cj4+Pg0KPj4+PiBDb21iaW5pbmcgYWJvdmUsIGNhbiB3ZSBjb25zaWRlciAiZ3NpID09IGlycSIg
d2hlbiBpcnEgPCBucl9pcnFzX2dzaSA/DQo+Pj4NCj4+PiBBZ2FpbiAtIG5vLg0KPj4gU2luY2Ug
eW91IGFyZSBjZXJ0YWluIHRoYXQgdGhleSBhcmUgbm90IGVxdWFsLCBjb3VsZCB5b3UgdGVsbCBt
ZSB3aGVyZSBzaG93IHRoZXkgYXJlIG5vdCBlcXVhbCBvciB3aGVyZSBidWlsZCB0aGVpciBtYXBw
aW5ncywNCj4+IHNvIHRoYXQgSSBjYW4ga25vdyBob3cgdG8gZG8gYSBjb252ZXJzaW9uIGdzaSBm
cm9tIGlycS4NCj4gDQo+IEkgZGlkIHBvaW50IHlvdSBhdCB0aGUgQUNQSSBJbnRlcnJ1cHQgU291
cmNlIE92ZXJyaWRlIHN0cnVjdHVyZSBiZWZvcmUuDQo+IFdlJ3JlIHBhcnNpbmcgdGhvc2UgaW4g
YWNwaV9wYXJzZV9pbnRfc3JjX292cigpLCB0byBnaXZlIHlvdSBhIHBsYWNlIHRvDQo+IHN0YXJ0
IGdvaW5nIGZyb20uDQpPaCEgSSB0aGluayBJIGtub3cuDQpJZiBJIHdhbnQgdG8gdHJhbnNmb3Jt
IGdzaSB0byBpcnEsIEkgbmVlZCB0byBkbyBiZWxvdzoNCglpbnQgaXJxLCBlbnRyeSwgaW9hcGlj
LCBwaW47DQoNCglpb2FwaWMgPSBtcF9maW5kX2lvYXBpYyhnc2kpOw0KCXBpbiA9IGdzaSAtIG1w
X2lvYXBpY19yb3V0aW5nW2lvYXBpY10uZ3NpX2Jhc2U7DQoJZW50cnkgPSBmaW5kX2lycV9lbnRy
eShpb2FwaWMsIHBpbiwgbXBfSU5UKTsNCglpcnEgPSBwaW5fMl9pcnEoZW50cnksIGlvYXBpYywg
cGluKTsNCg0KQW0gSSByaWdodD8NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0K
SmlxaWFuIENoZW4uDQo=

