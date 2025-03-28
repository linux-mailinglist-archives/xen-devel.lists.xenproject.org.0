Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E13A7430F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 05:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930120.1332808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty1ZN-0007UD-D6; Fri, 28 Mar 2025 04:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930120.1332808; Fri, 28 Mar 2025 04:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty1ZN-0007S3-A4; Fri, 28 Mar 2025 04:43:49 +0000
Received: by outflank-mailman (input) for mailman id 930120;
 Fri, 28 Mar 2025 04:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jzi5=WP=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ty1ZM-0007Rx-ES
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 04:43:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:200a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b4fb384-0b8f-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 05:43:46 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 04:43:40 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 04:43:40 +0000
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
X-Inumbo-ID: 3b4fb384-0b8f-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbcUteiP6gk5kSrfVKMTUqIqnf0QNRx+/kDG/CaEEYo695wrWk6Hxs2exc1+WKlc2hswczRW6mn/c2t6JaYSxuiQjbuu/gnke5ZFZ4ovXjGoB1TGUR0z8vWRmpL0KdC9YgjJBiwmAiNi1q8j3MSv3GA1Jb4zhnTYjy3MzeP7CHtlXFKozOst+n4zA+D+lkIYeHF6wdxKDPHMh3Sr8cKV+Tz+eGAyeifE81AIFKew/PVPXIyShLECMQLeL4UZFMWYVsJzqqU4PIVhhWnr0tDcKtqwcZBHAt+ef1lhjJ+zvcjCxQXN/Rjx6ANXJkSyc/+2toCrakwkiZVFW2pNcKa7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz5V+Jyw6pre3J9fHiqn+xSm8dvoGFKs4Etr7/Nkf1Y=;
 b=MVmfo6tvgVFDbECSSwLKsdnG2YmLqWp1Mw2uBlgjtFxqEMHzVFjRQ0gqQ6DXVr3Ex4HANxv0SllDzf+JxXRLd5mr+c3KvGGFsuT1gN0lSNnOIICHjgKE+ISJW3i8R8gErXa4P930KJyU1fNnzrXFvNyhxXmjsWApa1jsMmBH3AhlxnK6ESR9ZLhD/z6lM2SDpuiN3nr+rtvXhMe61XwyWx2Udecyqdx7b7KOCgsE4SqERr1McseAYTFO+mXzOP7R6ovG1tV/ZATm8yO225jgmUi81g9NJCZT0Loo1woIIFKdGdGQXWBlWOaFcickL7BVJW227a/vWAoQfVJ4htNnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz5V+Jyw6pre3J9fHiqn+xSm8dvoGFKs4Etr7/Nkf1Y=;
 b=OHmXrXwQDb9h31ZAul9F+ROECj8ecnuuS6d5NLAlWNFl+aWDT2Fc25HxSNoHd9I9ktH4etEgGKpfnzFOz39Of7dODOrlft1f9dtbke1v2wfPIZX5mVA8KBBbLUk5HEQxJcioHho27QyScsysMpxDXxK1cQuyexVc2LM2q8Ld2kM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index:
 AQHbjnNu8gKP+BdRfUqUIswSBCp7ILOChUeAgAKrd/CAAC16AIABDVwwgABQrgCAAVtk8A==
Date: Fri, 28 Mar 2025 04:43:40 +0000
Message-ID:
 <DM4PR12MB84518A6A1B1E7989D541824FE1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-6-Penny.Zheng@amd.com>
 <5498f98e-f3c5-4cb4-9a3d-793239a4339d@suse.com>
 <DM4PR12MB84519AF2B72DDDF50CA8BF18E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
 <df911e05-df3d-4f16-992e-a1931ad00099@suse.com>
 <IA1PR12MB84674DAE3F0FD2DB2DD87F17E1A12@IA1PR12MB8467.namprd12.prod.outlook.com>
 <a5c6b64c-b162-4b84-87ef-70c2ab665186@suse.com>
In-Reply-To: <a5c6b64c-b162-4b84-87ef-70c2ab665186@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_ActionId=7a46dc22-acb8-48d4-bdfa-8cd37c30010f;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_ContentBits=0;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Enabled=true;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Method=Privileged;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Name=Published
 AMD
 Product;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_SetDate=2025-03-28T04:38:04Z;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH8PR12MB6746:EE_
x-ms-office365-filtering-correlation-id: b5a53bb3-d33c-4007-4bd8-08dd6db31c8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VW5iWnU2QmRpOUJQYWQ2ZmJFMWE4Y1A5TlNGb0ROVFlmeEZFWVRETHA5N1l0?=
 =?utf-8?B?dGlkakhPbmlUWmlmZ3N0ZitxV08yRUI3RTdXQlNDUWJFb2xRckI4UnUwVFFP?=
 =?utf-8?B?SFhmMkMvS0hhR3BYUXpIT0h2VERuWVgzYkQzL0xPeEtDcnZvbmlpWWY3YWtk?=
 =?utf-8?B?VXRGSXJFb0R1MHduUEJXa2tUdnZYczByVGJyWDhLRVY0THhWUEdhWGM5NzNM?=
 =?utf-8?B?d1NkbW0zdmlwK0RTd0RuUHRTVTJTREhVcGphemFzU3BVSmlpZGdUelExRmgr?=
 =?utf-8?B?OEc1ZE00WWhLdmdteXFDdU5YWGNnVnFsWkNNOTNDNHJIY3A4dThEMU4yaFFx?=
 =?utf-8?B?WjlPalB4TytGWC9LS09GNmZZZDhwU2ZzaXNnNm9QQis4NllDRTU5ZWYrcTFV?=
 =?utf-8?B?SGxyWHVyaFU5TVRvd0VySUpzbGdEQjAvZVV1UWEwZ3lEdTlYeTVidkNvcVBv?=
 =?utf-8?B?V3FLaS9WUXc1ZUZpeTNrZGVLcXVBTGVDemJMRjRyVjBFUHEvd3RIWjcvQVEw?=
 =?utf-8?B?SGorWWVIdXh3R0J6QmRQUmJGeDdUcWRQQ2c2Yi9VNVJGREZZaFVCSVJTRTJt?=
 =?utf-8?B?RzBpcmh1QVlybkl3TWhWdnM2YjdKdVpPbWRoWkExRndLdU5ZKzNUSXBqSkp5?=
 =?utf-8?B?bnJuS1h6ZlZpdERLV2hiVjRwbXB2eVgzbnNxMDZrTnBBUit2aU55RmtkbG5Q?=
 =?utf-8?B?KzJ3aFFmNGVHQS8yNEsyN3hEbGlqU3J2NmZvb3JFZVg1eWo4dnpSbStEQzNK?=
 =?utf-8?B?bCtNbVpWNjM3UjRCcDZJNlBGWDBha0t0czlBTzVrSHdxcEh2NkRVdTZvODNB?=
 =?utf-8?B?M1NwTnByV24vWHpGdGZmT3BkMEJ4SHR2Zjh1bFltZ1dwMGhVaUhSWE1BWVdT?=
 =?utf-8?B?djlMbHY2bXJnbUk1cGhYdUxpRWxwRjZjZGkySlBiaCtvb0k2STdjTzNEamhS?=
 =?utf-8?B?dk1yWGVBUnVNUjgybU14bm55L2NUd2MwTjZ6Z0NmbFNqVU9PUWJ3WXN5L25i?=
 =?utf-8?B?OW9VRVFDWk9xa1VhLzRRbXl3bTAxOFpKSTg2NDJ4MVJ2dmNJcVcxQ212dTlP?=
 =?utf-8?B?NTV6OUFPeTRwYk43MTJvYnhkRVkvRGd6MlhmdUlJcjhHbGJFUTdkYWlHLzFY?=
 =?utf-8?B?MWhGbnpWNEZoWVpGMGdrME1zTDRod3hHRG1DT1NjeWptTktHaTFTYklTamk5?=
 =?utf-8?B?UE5IUitWVVc1eHBhbWFLNlk1MWZSOUt0SStHamFnSDJ5VlRER2dlZW1qY2Ju?=
 =?utf-8?B?bVI3dlc0bXFmSk5MeWNjUmV3NUU4eFlieWMrL1c2NVlpNFhxZ1BpR3pzQ29D?=
 =?utf-8?B?cCtUaUwyVDc0eTM3ZGkxdWJ6bm9hbnNKb3NzRUtGVjk2Tjdac3Rxbk9JS3U3?=
 =?utf-8?B?WHRKcUdyRUNOS3F1RWVKdXNBb0RtOHNhMHhOYks1ZER0M29QN0Z6cUx2aDVu?=
 =?utf-8?B?WkJ0SHk0aE5yNEYxbGprNGMxZHRtS2x1VHpyWGpGeDgxL2pocU5VdWdxQXNk?=
 =?utf-8?B?dTFyUW1zUk9QdmN1c1hlQnB4SW4rWGtTYSs5WkdSc0xKeWdOblF6NlNUWmdP?=
 =?utf-8?B?WWNQZVBTUFdIeUwwSVc2dnFxbnVsWE1XL3RrSldsSHV1d2ppNHBNUGF0eGJV?=
 =?utf-8?B?KzNtSlpLTzNkcnY3RmxtTjZiRFF2c1BLN3cwazJuYk5mQUN1cWxSaEhmVlh3?=
 =?utf-8?B?S2xncmVuTlF0MlRuclVRTGRHVTQ4SGZiVE1wam1EY2FYZHRSNzlwRXc5cTB4?=
 =?utf-8?B?Rzl2TWpGWjBPbkMrNk5OU3dVOVBoa3pYaEsvMzNWaGJhQ3ZTNkI5Z3ZYYlpM?=
 =?utf-8?B?ZnQ5TklSYXI4NmJpNjhSVGdVNG00b1VSWmV3bWszVE1oNnMrN2MxQnI2cGVr?=
 =?utf-8?B?SU5mRWorb3RKRmhFOEl6cllSOU1LMndMTytoaXV1TFM3WE84TXkvenZiZklz?=
 =?utf-8?Q?EfQ5PnLNqOEPbXjabluY4n6Tc8lSE3h9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1NTQXY3V0hWemltWHNlbFlRWmRUcXlaSXd1bkp5aHBaWTRsTkxpMmUrLy9I?=
 =?utf-8?B?WVRmZFlmc0xhejFGMGR2R2FteTY4Z0UwK3FzbEEvTUk1akxaL2V2M3poODFZ?=
 =?utf-8?B?NGZFcVBlaVV2UHYwb3Fqa3dOOUNBeHR6VWp3RXdOeUJ2RUJXSmRsMlVtNmlk?=
 =?utf-8?B?WlZmTVFETlJRL09SNk9lTzRiSXdjSWREUTFpVDNwWStrQlQ3clN5Z0ZGbHNz?=
 =?utf-8?B?WlpoY0lKRUlDak1wQjQ0STk2ZXpRMEp5MHhweFFMNHBkSFptM24vZHdqYWQw?=
 =?utf-8?B?akZkbW41aHFkQ1JHUldCMmlXOEY3RzYzQWNURkgrRTIycTlEUXg3cWJaVXM3?=
 =?utf-8?B?OENaeGcrNmtueEpCZEhiVlZyRG9QUVFTYml6dzVQUHFwWXpxdWVIYnN2L0o3?=
 =?utf-8?B?enhMQmIwSUVVNEQ4UW52MXpNM29MeHVqa0xJNTUvdHR2aDNQemdXVnBkaTl1?=
 =?utf-8?B?TXN0bEpCbm1zcFJjeUJNSmF3WnBwSy9POENvd012TjJkRmJHbmdPM1ZPVjh5?=
 =?utf-8?B?U0xhMW1pcUdlTXovRmRaUmp3ZlpSUXFSRkJpMkE0UlpsOGxGdHZrS0ZBbFQ2?=
 =?utf-8?B?cENWbVBBZU1jWHpGZ0FxUHhOcitTcEhmNmZBSHFFNjM5SXRYSDBPNXhkVTdC?=
 =?utf-8?B?aXdxSS92MVJDTXZYNE1peDdyQURaaVZxUnQyUTAvb0hZVEZ2L2RNWWlXWnFo?=
 =?utf-8?B?Mmkwa2EwYUswZmNRTTJIU2JGWUoyTmVOZXdnbXVFUmRyMEhKdjVPcU51TUR3?=
 =?utf-8?B?YTFtMDc3clBvUWp3U2lCNFNpM2FXOG44djk4bGc0R3ZZa2NCOUNmZ2s4MFZw?=
 =?utf-8?B?dVU5VWw4OVpIMjBQV2NPc3FvM1BibGFwVU5tR1ZybmZLbmUwampKclI5UTZy?=
 =?utf-8?B?eXB6dk8wdlh0KzJWNHlKdElidTB6T2NtYXc1SC8zZUZLR0VRR3ViTzRycGcr?=
 =?utf-8?B?dnR2L2U1elE3SGR6VzNjYXQySUNGcXNEZDlqMVVEN3FMODFVSUFPZnBRa0ov?=
 =?utf-8?B?ZFZISVZ5NWtSaW0vdFFPUlVBSmFyVFhLSkw1aCs4czhIeXJJNFQ5NDJxcHRM?=
 =?utf-8?B?VGZ5aUlyaDJncGNXbXc4V2NtUHZCeTlMTnA3a2tZWkhyU3pLays4bzZ4ajVF?=
 =?utf-8?B?dXMzdHZ5aURDRFJQNjdObDh0Rkh1eUgxdXBJVDIxcy9ER3pOTUkrZVhqTENB?=
 =?utf-8?B?QitkL1Y2THRGdjB4aUZRbmEycmUvTlJrV1IyL1Q3ZmZWUWFMeUlEYnZDNjJm?=
 =?utf-8?B?SldQRGhsRGxtV2RLVnBTeHpNOHV6SHJHcS9WQVBnSmY4czZOVHp2QjBuVk51?=
 =?utf-8?B?YVFwSjE1NHZRVW5wS1NGL1k1RmNlTzFnR1Rrb1BHcWhEdXRiZTdDcHducCtP?=
 =?utf-8?B?ejdKS1RzMjlBQW90OTFMS1F5RGMrOUgyU3pHcXpWWjFiZE5yd0tpRGxKOU5W?=
 =?utf-8?B?emY3UWZ6N25KaWZpWEdUQzNjdGVVNy9BQzF2Ym5jdzVjaksrcWY3WE05N2Z0?=
 =?utf-8?B?R1FEa0pMYm10bDRqQjFlWGIwSlk0VmR0eXBTN0ZuR1pETGlGdDRmUzQxak1I?=
 =?utf-8?B?VnNIMjNDRmNqcjZPZ3RxRXkrRk9pMHllUTJ1WVRWYk1pdU1xRlQrTEN3bTJR?=
 =?utf-8?B?M2ZUNk5mcUxSdEVOUTRkZ0w1eUlLeUhQYTFkNUI2THhtNFo5eXN5VFVmdWdk?=
 =?utf-8?B?cldQNFBNMzhsKzBtUnRkdkhFU252TUJwbHdla3ZxeG56U3h6WUdMODFxSDRl?=
 =?utf-8?B?eDVSRWtZNUlNZ0VEY1AvWVNJQkFweHo3d3FzcXhKbHUxbVhVWXd4MDduM1Nq?=
 =?utf-8?B?MEVXOVc3SmRqblhPeE9ZZGZaSkVVZ3czNEQ2YjNkVmNCY256N1JwNG4wU042?=
 =?utf-8?B?K3NVeDZsb05vNDltTGZQdTBjVWZuYzFZZ1I5Z1pPRzJiamtab2tXVDlqcWFr?=
 =?utf-8?B?WUpWRzJxd0kvekJVZHFiRklIWHZudHpWQ2E1UnE2bHlaSG9kNWo5NmRCRnNz?=
 =?utf-8?B?UjMzdEwvYWdnTkRUMUloWTFLSWdWV3ZWSHNuZm9IRHk5K200emZjUmtpYWxG?=
 =?utf-8?B?cU4wVTdLNmRZQ1VSVE15NEVMSiszcS9OUmU2d002OHRON3FQZ2w2bHdpR0N3?=
 =?utf-8?Q?GQxg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a53bb3-d33c-4007-4bd8-08dd6db31c8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 04:43:40.1876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVqSex+5ebuFQjW/SaSF3UxgE4zKfiQE1+lNI7Nb8QuJtJkDOV6+Mz8EXldD5Jvjzhq7n6jR2Q7POnC5rC3wtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2gg
MjcsIDIwMjUgMzo0OCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29t
Pg0KPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQHZhdGVzLnRlY2g+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlcg0KPiBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47DQo+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYzIDA1LzE1XSB4ZW4veDg2OiBpbnRyb2R1Y2UgImNwdWZyZXE9YW1kLWNwcGMiIHhl
bg0KPiBjbWRsaW5lDQo+DQo+IE9uIDI3LjAzLjIwMjUgMDQ6MTIsIFBlbm55LCBaaGVuZyB3cm90
ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDI2LCAy
MDI1IDY6NTUgUE0NCj4gPj4NCj4gPj4gT24gMjYuMDMuMjAyNSAwOTozNSwgUGVubnksIFpoZW5n
IHdyb3RlOg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+IFNlbnQ6IE1vbmRheSwgTWFy
Y2ggMjQsIDIwMjUgMTE6MjYgUE0NCj4gPj4+Pg0KPiA+Pj4+IE9uIDA2LjAzLjIwMjUgMDk6Mzks
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hY3BpL2NwdWZy
ZXEvY3B1ZnJlcS5oDQo+ID4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FjcGkvY3B1ZnJlcS9jcHVm
cmVxLmgNCj4gPj4+Pj4gQEAgLTI4LDYgKzI4LDcgQEAgZW51bSBjcHVmcmVxX3hlbl9vcHQgew0K
PiA+Pj4+PiAgICAgIENQVUZSRVFfbm9uZSwNCj4gPj4+Pj4gICAgICBDUFVGUkVRX3hlbiwNCj4g
Pj4+Pj4gICAgICBDUFVGUkVRX2h3cCwNCj4gPj4+Pj4gKyAgICBDUFVGUkVRX2FtZF9jcHBjLA0K
PiA+Pj4+PiAgfTsNCj4gPj4+Pj4gIGV4dGVybiBlbnVtIGNwdWZyZXFfeGVuX29wdCBjcHVmcmVx
X3hlbl9vcHRzWzJdOw0KPiA+Pj4+DQo+ID4+Pj4gSSdtIHByZXR0eSBzdXJlIEkgcG9pbnRlZCBv
dXQgYmVmb3JlIHRoYXQgdGhpcyBhcnJheSBuZWVkcyB0byBncm93LA0KPiA+Pj4+IG5vdyB0aGF0
IHlvdSBhZGQgYSAzcmQga2luZCBvZiBoYW5kbGluZy4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEht
bW0sIGJ1dCB0aGUgQ1BVRlJFUV9od3AgYW5kIENQVUZSRVFfYW1kX2NwcGMgYXJlIGluY29tcGF0
aWJsZQ0KPiA+PiBvcHRpb25zLg0KPiA+Pj4gSSB0aG91Z2h0IGNwdWZyZXFfeGVuX29wdHNbXSBz
aGFsbCByZWZsZWN0IGF2YWlsYWJsZSBjaG9pY2VzIG9uIHRoZWlyIGhhcmR3YXJlLg0KPiA+Pj4g
RXZlbiBpZiB1c2VycyBkZWZpbmUgImNwdWZyZXE9aHdwO2FtZC1jcHBjO3hlbiIsIGluIEludGVs
IHBsYXRmb3JtLA0KPiA+Pj4gY3B1ZnJlcV94ZW5fb3B0c1tdIHNoYWxsIGNvbnRhaW4gIENQVUZS
RVFfaHdwIGFuZCBDUFVGUkVRX3hlbiwgd2hpbGUNCj4gPj4+IGluIGFtZCBwbGF0Zm9ybSwgY3B1
ZnJlcV94ZW5fb3B0c1tdIHNoYWxsIGNvbnRhaW4gQ1BVRlJFUV9hbWRfY3BwYw0KPiA+Pj4gYW5k
IENQVUZSRVFfeGVuDQo+ID4+DQo+ID4+IE1heWJlIEkgbWlzcmVhZCB0aGUgY29kZSwgYnV0IHRo
ZSBpbXByZXNzaW9uIEkgZ290IHdhcyB0aGF0DQo+ID4+ICJjcHVmcmVxPWh3cDthbWQtIGNwcGM7
eGVuIg0KPiA+DQo+ID4gTXkgYmFkLiBJbiBteSBwbGF0Zm9ybSwgSSBoYXZlbid0IGVuYWJsZWQg
dGhlIENPTkZJR19JTlRFTC4gSQ0KPiA+IHByZXZpb3VzbHkgYXNzdW1lZCB0aGF0IENPTkZJR19J
TlRFTCBhbmQgQ09ORklHX0FNRCBhcmUgaW5jb21wYXRpYmxlDQo+ID4gb3B0aW9ucywgd2hpY2gg
bGVhZHMgdG8gdGhlIGZvbGxvd2luZyBjb2RlIGBgYCBlbHNlIGlmICgNCj4gPiBJU19FTkFCTEVE
KENPTkZJR19JTlRFTCkgJiYgY2hvaWNlIDwgMCAmJg0KPiA+ICAgICAgICAgICAhY21kbGluZV9z
dHJjbXAoc3RyLCAiaHdwIikgKSB7DQo+ID4gICAgIHhlbl9wcm9jZXNzb3JfcG1iaXRzIHw9IFhF
Tl9QUk9DRVNTT1JfUE1fUFg7DQo+ID4gICAgIGNwdWZyZXFfY29udHJvbGxlciA9IEZSRVFDVExf
eGVuOw0KPiA+IGBgYA0KPiA+IHNoYWxsIG5vdCBiZSB3b3JraW5nIGluIEFNRCBwbGF0Zm9ybS4u
Lg0KPiA+IE1heSBJIGFzayB3aHkgbm90IG1ha2UgdGhlbSBpbmNvbXBhdGlibGUgcGFpcj8gSSBh
c3N1bWVkIGl0IGVhY2ggd3JhcHMNCj4gdmVuZG9yLXNwZWNpZmljIGZlYXR1cmUsIGxpa2Ugdm14
IHZzIHN2bS4uLg0KPg0KPiBJJ20gc29ycnkgdG8gc2F5IHRoaXMsIGJ1dCB0aGF0IHNlZW1zIGxp
a2UgYSBwcmV0dHkgb2RkIHF1ZXN0aW9uIHRvIGFzay4gRGlzdHJvcyBxdWl0ZQ0KPiBjbGVhcmx5
IHdhbnQgdG8gYnVpbGQgb25lIHNpbmdsZSBoeXBlcnZpc29yIHdoaWNoIGNhbiBiZSB1c2VkIG9u
IGJvdGggSW50ZWwgYW5kDQo+IEFNRCBoYXJkd2FyZS4gQ09ORklHXyogYXJlIGJ1aWxkLXRpbWUg
Y29uc3RhbnRzIGFmdGVyIGFsbCwgbm90IHJ1bnRpbWUgdmFsdWVzLg0KPiBXZSB1c2UgdGhlbSBp
biBpZigpIHdoZXJlIHBvc3NpYmxlIChpbnN0ZWFkIG9mIGluICNpZiAvICNpZmRlZikgc2ltcGx5
IHRvIGV4cG9zZSBhcw0KPiBtdWNoIGNvZGUgYXMgcG9zc2libGUgdG8gYXQgbGVhc3Qgc3ludGF4
IGFuZCBhbGlrZSBjaGVja2luZyBieSB0aGUgY29tcGlsZXIsDQo+IGlycmVzcGVjdGl2ZSBvZiBj
b25maWd1cmF0aW9uIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIGluZGl2aWR1YWwuIFRoaXMgd2F5IHdl
IGxpbWl0IHRoZQ0KPiByaXNrIG9mIGJpdC1yb3R0aW5nIGFuZCB1bmV4cGVjdGVkIGJ1aWxkIGZh
aWx1cmVzIGF0IGxlYXN0IHNvbWUuDQo+DQoNClRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGV4cGxh
bmF0aW9uLCB1bmRlcnN0b29kIQ0KDQo+IEphbg0K

