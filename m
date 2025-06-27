Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76426AEAD21
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 05:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027154.1401944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUzJt-00066T-5m; Fri, 27 Jun 2025 03:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027154.1401944; Fri, 27 Jun 2025 03:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUzJt-000639-2G; Fri, 27 Jun 2025 03:00:05 +0000
Received: by outflank-mailman (input) for mailman id 1027154;
 Fri, 27 Jun 2025 03:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Eu8=ZK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUzJs-0005rj-7P
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 03:00:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2413::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce746c5e-5302-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 04:59:58 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY1PR12MB9700.namprd12.prod.outlook.com (2603:10b6:930:108::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 02:59:53 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 02:59:53 +0000
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
X-Inumbo-ID: ce746c5e-5302-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acwLxqDpnxWsAD5O3P/BxoFsKelaKBBVa/oHQuRIxWX0SpfskWJ75G75+N/Yh5ez5sxHdsw9VnkMdSjguSyO7bdswo1g4m3CQlXsxbK0G0zVei6Gp4q0FyjlppsBzX8oYVAGteQ9rCBiT71y3LtxpX3/FCZcXoIM7kOXu09ziHIZVkKcrIipEXo8+Kb4Mrvx7mt5zq2HaTuyVyCiaJ/f5rc4D0G2cMHukLlZvSla5YjG2sbsKOdGEvP+TB+J9Q0lqMGWj/1PfNgxevKgJ+WDc4Pc5tIAIxSFLnmidyJ+PDZNlPXQS9sYSboUKdk/JSuGpc+fHDId1GpSdSLRZKTKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+jRtypYYzqLpyKsu5gjznzXitFwFM4JD46DDheDFm0=;
 b=t/s+VXipE5fbkYkaqJEbWNY05S+MisN618F0ZQ7ZwkCOwSOKFlORf2yEh2u255R1yEaZun4IZo9/tQSzZ1QlkLranC8wk6urTauCrDrlOs6jIXgy/NsjMG0s7NlYbSkYTxmT9JWahCx/drTTZDiNkkfm3BpDMjpwq96l613sGX9i+okOwaIxWNv4ripiklPZUmKOVHtXdeBpKH79ldYeGyLeo0KhHDPai9FpmmGWePbuClUy4vvvpNj0246pBeJ/7Xq7/ZexVw5ihZ74iZw24KnjXnIjGPGVLJq8WMK5b+tVQILjyMtF3pHJxsepPuUJBf6CABSgfLAdhcUCxNN0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+jRtypYYzqLpyKsu5gjznzXitFwFM4JD46DDheDFm0=;
 b=uW3h+dkvR78BfpStbmXzi/PK2nuVinjWI6L2VH62QE4JaNBNmo06BXXgVwgXBaaZqdXZ3fZI7XHM861a6rrPhyRk29PQzEVYjvXrQ1z/EDxiFANrPCV2dboGEgJw013p+Jb2QT8kE4B3NsQrpp9B1WycWoAHCdZPbAW/KDZHxIg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4D//5oCgAASTfCA//+FrwCAAIi+gP//u5+AgAGwYID//8AMgIABfE8A
Date: Fri, 27 Jun 2025 02:59:53 +0000
Message-ID:
 <BL1PR12MB5849302474B73599557CC1F2E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
 <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7753470a-efef-478a-bbe5-ae48d008cfdb@suse.com>
 <BL1PR12MB584979FA987CE2D6E242648FE77AA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cf41d703-dae1-42fd-86a2-aec32184adcc@suse.com>
In-Reply-To: <cf41d703-dae1-42fd-86a2-aec32184adcc@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY1PR12MB9700:EE_
x-ms-office365-filtering-correlation-id: a0fd2a9f-c7ca-4e32-76ed-08ddb526b09d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SW5Zemt6Z3RZRU1vUStkVjQxUGVXTmowRWhpaHdhSlpiYlVIUGhJSml3eStr?=
 =?utf-8?B?RngzR3RSbysyS3ZTNXJ3cmZtczNZTHl3aWl5UUh4YnZRSHlJNXpJekQ2Ykhy?=
 =?utf-8?B?UVpOSzAwWWM0UUxyamx0ajBvRGlTWXdrZjB3ZW5aa040Zy9iT2ptbXdEcXh2?=
 =?utf-8?B?NzlGN0VvWWEyTzZRZGZwSXBZeUc0SEZIU2twZk5uaUJlMVJQMk1ZM0NPSzlU?=
 =?utf-8?B?ako4VGlLc1JTR1Y0aVBScU5DTDl4dzI5di93aHZkUTBBNkxPSjhjMDRva2pw?=
 =?utf-8?B?V2RwcG1rTy9vMFlNcFNRMFA2VGpGLy9sd0JUU1pxR21DaE45RWNITURBbGxw?=
 =?utf-8?B?bWN4bUlqaVZWbE1BYUs4RGJqMEVGdFBpalVzckZVWHBmVVR2QjM0ZEdPN1Vm?=
 =?utf-8?B?bnVocUVHOVk2aTM1UnYxT1RxVU5vaExGem41MGtUU25sOUFneXk5c2ltRW93?=
 =?utf-8?B?Nkx3VFNMVkUyZUZpOUQ4WXduME5HdWxqQWRXOWRDM0FJQjI0V0ZXY1RYako2?=
 =?utf-8?B?Smx3bmZpT1RJcXBCaFJ4emVVY1VEVWx5b3Zja0FQVGJ2eEpnb2pzNjEyQVoy?=
 =?utf-8?B?QW0wRDJqa2hvUndlcTUwOWZaeU90N0xjWEs1Z1lsQURSTkIyeHFLNDhsYnkx?=
 =?utf-8?B?OExQMGx1WmhPUzJZbWVhOEh5RjRZZjRZQkhKdVc2cmZlYlN4QklwSXdhWEx5?=
 =?utf-8?B?RVR6b1lGT2t0Z3JPS0VUbU9FUzJqN3ZLbmJNREpxaFRDSXoyYnNvbGpGV0RO?=
 =?utf-8?B?VWxBNDNFQkRYeEFEazQyVG5qR01xNjRjcGowdTcwdVZvcjlNS3E1OEVJQ0NM?=
 =?utf-8?B?bmFxNnpBc2ZTcjJmZGJINzhRV2gweDI0Y3N1QjlYSUtucURqeSs3ay9ya0lv?=
 =?utf-8?B?UWVSK0FMK05tWlo3djQ5OW9XbkJLYUREUys5UG5QRUcrWUczTlNRTlM3NW5V?=
 =?utf-8?B?NDU0VWpQQ0dqVHBUR2YzQmQ4VVNmMWR6dzR4TVQyR1JJS01JdGszcDdwMFhx?=
 =?utf-8?B?Q3NwYTNKUWcyYllkcmw2V2JDMVJXQm4zWEtWZW01MFQ0WUQzTk40WlllK0RV?=
 =?utf-8?B?aStHOFBjS1JXVGhMMDdkT1Z2OHNyR2NiYVFFcHlNRUhpeGgwOFdFZTE1Nmg4?=
 =?utf-8?B?RW55YWsvYVR6bjRORHptV3JqUE9wbjkxRnRxVEFsbS9XdDM3d3FRSDdwMkx0?=
 =?utf-8?B?SmNVZ2tOOGRLTlBuOXhhMitnSlh5YjEvSTh3UU1VZy93MUYxRUtHSEl6TkdJ?=
 =?utf-8?B?YURkdTlFZmY3MTNNU0s1K3o5RUhlM2o1R1d5ckJsNzJ2bVgwL0ZtN2NrM3RP?=
 =?utf-8?B?ZEFOY2t1UExsbDFqMGFyK1NrVk9iaHFCenI1MkFiTzg0TjByemp2NGpzdnA0?=
 =?utf-8?B?NXpUNXdVV3Y0VTlNZE11V2F2ZnArU1dkdkZndTBBVmJTaUNDNGxqWElLeFRz?=
 =?utf-8?B?WThtRmNqcVpON2xPNzNFYjRRaHFxc1hTdWh4SkMyVThXVW9meVJVQmtEYjZ4?=
 =?utf-8?B?bXJCS3V2SDZ1bTg3K3FkYUcwU3UrcXVpMG01Qml3RmcxR1NJSDNVUUdnYlIz?=
 =?utf-8?B?aEFFNlpOWERYOXJiZmZwaFFnczYyRjJDVzlQNFhnV0ZsU3NzdkVtSzlLd1JC?=
 =?utf-8?B?WWFvRmVWeTJwTUFOR1QrU1IyYlJVVW9PdTN2cVZINzBQMi9LSk9hZW0zK1RH?=
 =?utf-8?B?aGs4UktrOHRNMlV1bkhqcXZOektESHhBTEdoNEVBa0VUUXJ4NHRMZVdCSjh5?=
 =?utf-8?B?eGpkaGJqK1lPRFdYd2d5OHNKbW4yaFRIdlYyeGVlMThtMm5wWmMzZjhuTE5Y?=
 =?utf-8?B?ZmpQK2tHM2JBMDZnaUM3cGVUcEJyQkpJK2NORHdwTnl4V2NYM2YyVGNzOXRD?=
 =?utf-8?B?Y0g4RGdIMk5qWlp4RkF6SnRUM0xadlhUcnlRbWRjUmFubmN6S1QrN2JCZlVJ?=
 =?utf-8?B?SW5Tc09nK3JqQnZhQmxnRFZRWjlIU2ZuRHRoeFNFeVF5a2pqWWw3NjU4UUM3?=
 =?utf-8?B?cEErYkQycTZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnAyQWl4Y2JiWGNrTXJzUTlua1FMYTV1aTF1SVhNOFN1R2ZWYW9iTGtDMmxX?=
 =?utf-8?B?UXJGRFRIVkM1a0FBVlZEamwwUU00c2tTaFIzQnFIbHlHalhTdUd2QmpjK3BQ?=
 =?utf-8?B?Z0hVZ09VRjVUQ2lFclJZcURMUURnS0ZWZ0lOc0VZbDdYRldQalpESkRTWEcx?=
 =?utf-8?B?RGNDa3gwLy8rK2IyWk5WOGRaanJuTlNBTDZjR2k0UlQ4NGZycnhSZG5HdkYw?=
 =?utf-8?B?dHQ5NXVBRENNVWRSRlVuVWszYVZSVXRUY1YvOFJnOTJsbjJ0cXJWWUdPVUgz?=
 =?utf-8?B?OWd6eTlySlRQTVJranc4TFJPb3dEVUFpaUxEU3BhRVN5eGxGdzNBbjZqNW15?=
 =?utf-8?B?MjBNL3hYQVhJS0RNY0c0T3FSQm5NellUTzdQaXZVR1pUZk1HSVlWejlKWjY3?=
 =?utf-8?B?Q3dpbnBncUlFR2JzVUVLdGtGajkrNmdjV3ArL0dyd015RDRBU1RGUWdKbGxk?=
 =?utf-8?B?U1Vwdy9WSmZlam82UFJVeWUyVlMxQnI3RkpXT1RvY2hKVUlHN280T1ZoK2pQ?=
 =?utf-8?B?aktGZkZPT0UrT01FNVB3NzRGZ0F3cklnVVV0YjMvcHdGdlFRdG5OQTNvZXlH?=
 =?utf-8?B?bXFHeVYyeE93RmI4UGZpTFNmcmFCa2pWeHh4dXlXdk1yR1ZhNDF6TS9lOWl0?=
 =?utf-8?B?VC9NWk1aWEVKRkZBWDIvelF5Tyt0N1M0RWNyQXIwdnc2aGZDekZwSGxOekhE?=
 =?utf-8?B?V3dKTi92L3g1NmhWUW44ektIQ0VaUzE5a3Q4SzRHSGFITXh3ZnJIQ01SQnVw?=
 =?utf-8?B?ZDQzaktMZEFnN2thVXByTVdqLytSOWNtMWxPNDRsMi9EalpFZ2NoZTFXdDJr?=
 =?utf-8?B?c1N2WWUyV2F6VFhUNVRYK2E1NlNHK3Uvd2d0T3FQUlQ3UThHcGNrMGt1WVVS?=
 =?utf-8?B?R1NSZ2EyU0RoV0VnNDJCUjF5TDNKNHNjaWgvNFNIeFM2QkhGOHI4THdtNW5i?=
 =?utf-8?B?dm1wQjR0Vi9iY3crQUUrc21CSjBTbnhqb1lJOVBtL2tRY0hiK2JGSldMSy8y?=
 =?utf-8?B?TUZUN2pFajdSUmlFMTlSUkxNRk5uMVhVd0hFRzdRVG50Y2pFdEpIbHZ2NEZL?=
 =?utf-8?B?Z1k4MjEzSVNXM2paN3N4bDl3dzEzODdtUlFUZHFwbzk3eUZsU1Zid3BJTjRh?=
 =?utf-8?B?TndleTNWclhZTXV3cEpGS1JrMWhXWUFKM2hSMkdXNGpEUU1Md0JqNmphQWIy?=
 =?utf-8?B?WXZ3WUZtK2VoUkZpNko3R3dGbzNGbkZzU2dYekpVYWdTRllrbGVjRVFtWENw?=
 =?utf-8?B?ZzlnWVFpWG9ZamY2VjFQanBvNEJFeWFWSnRndUF0NmROMTB6ZmwyekI1V1BO?=
 =?utf-8?B?VWZQYTcrWlhBM3FUM3o3UmMzSEZuTFptT3Z5YUcyaVhNdnJleXp4QVRFSjBY?=
 =?utf-8?B?QUZvcUw4eEwrZzRZWkhKSXdOQ0VrKzhrVjFNN1NQa1RLVVVxb09keXo0WDBW?=
 =?utf-8?B?TDhyTDNycExEaTlUVTFEM3RBdHBnTGhEa29EUWdWNTljSzRkU3dHVGV1c2Yv?=
 =?utf-8?B?UDNXaFVoM0NaL2g0QmNDKzNiVnlsOVZ5ZjRwdVVOUHI0ck9nUGlxVHJMNG5V?=
 =?utf-8?B?dXNkaUVqZXIxWmFKNDZ2ZDhIZWxwOXM1RCtlRzlpNFhPSWw1ZENJQkViRG1r?=
 =?utf-8?B?UjhzY3lwamUwWnF2SHoxajNmc1hMN3BlZThEVGJZaHdaZ2NEK2I5SW95UFJQ?=
 =?utf-8?B?T0V5K1B3cXVCKzNnRFNtdTBWTTJMYmkxeVEydVhqMkRKOVowV092YnI0R1dn?=
 =?utf-8?B?NmRlanNCSnZlNXlSbTg3c1ptU0hVT0c4OEhQVjdoc04wazlRanQzczdEcGlu?=
 =?utf-8?B?SGdxSE8rbWdIemZIeUc2UndiN2hNbXZYcXVwZTJQU1FNN0JpTW5RbHhCdzAx?=
 =?utf-8?B?RWhkd0M1OW1DYWpCaThqWm9MSzVwY3FLbkZaZFVoSDM0SzhjRndOYW0vUkNw?=
 =?utf-8?B?b2dlamxMMnc3VXpYbFU3SDE5VFZ0STFic280aUFZN3RnNE1TVW80dHE5L1ly?=
 =?utf-8?B?SytDdWhaaVUrV3pmdS81aEdHVHVRRnFNN21xT21mR05OcE9ZenN1TjArYWpi?=
 =?utf-8?B?S1BheVdYSVhKaUUxR0Nia3cwRzJLdnh3NldKSGJGVGRyVURuLzg5ZHoreERB?=
 =?utf-8?Q?MigU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D26D392C5FE8CF418C40AE717AA74717@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fd2a9f-c7ca-4e32-76ed-08ddb526b09d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 02:59:53.2749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9WCwHY+ByCT7qvPgh+saLgVNnw8nLJTflUTh3nWH9F7KFbtYUdA6fX6ctwp9N3tRZh+Rel25SMA7X1hXJjZEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700

T24gMjAyNS82LzI2IDIwOjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjYuMDYuMjAyNSAx
MDowMywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI1IDIyOjA3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNS4wNi4yMDI1IDEyOjE2LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yNSAxODowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBBbHNv
LCBhcyBzYWlkIC0geW91IHdpbGwgbmVlZCB0byBjaGVjayB3aGV0aGVyIG90aGVyIGFyY2hpdGVj
dHVyZXMgYXJlDQo+Pj4+PiBkaWZmZXJlbnQgZnJvbSB4ODYtNjQgaW4gdGhpcyByZWdhcmQuIFdl
IGJldHRlciB3b3VsZG4ndCBsZWF2ZSBhIHRyYXAgaGVyZSwNCj4+Pj4+IGZvciB0aGVtIHRvIGZh
bGwgaW50byB3aGVuIHRoZXkgZW5hYmxlIHZQQ0kgc3VwcG9ydC4gSS5lLiBteSByZWNvbW1lbmRh
dGlvbg0KPj4+Pj4gd291bGQgYmUgdGhhdCBpZiBpbiBkb3VidCwgd2UgcHV0IHRoZSBfX2FsaWdu
ZWQoKSB0aGVyZSB1bmNvbmRpdGlvbmFsbHkuDQo+IA0KPiBOb3RlIGhvdyBJIHVzZWQgX19hbGln
bmVkKCkgaGVyZS4gV2h5IHdvdWxkIHlvdSAuLi4NCj4gDQo+Pj4+IFRoYXQncyBkaWZmaWN1bHQg
Zm9yIG1lIHRvIGNoZWNrIG9uIGFsbCBkaWZmZXJlbnQgcGxhdGZvcm1zIHNpbmNlIEkgZG9uJ3Qg
aGF2ZSB0aGVtIGFsbC4NCj4+Pg0KPj4+IFlvdSBkb24ndCBuZWVkIHRvIGhhdmUgdGhlbS4gWW91
J2QgbmVlZCB0byBjYXJlZnVsbHkgZ28gdGhyb3VnaCB0aGUgcmVzcGVjdGl2ZQ0KPj4+IHNlY3Rp
b24ocykgb2YgdGhlaXIgcHNBQkktcy4NCj4+Pg0KPj4+PiBTbyB5b3UgbWVhbiBJIHNob3VsZCBy
ZW1vdmUgIiNpZmRlZiBDT05GSUdfWDg2Ij8gSnVzdCBsZXQgX19hbGlnbmVkKDE2KSBmb3IgYWxs
IHBsYXRmb3Jtcz8NCj4+Pg0KPj4+IFllcy4gQW5kLCBhcyBhbHNvIHNhaWQsIHdpdGggYSBzdWl0
YWJsZSBjb21tZW50IHBsZWFzZS4NCj4+IEFoLCBteSBjb21tZW50IGRlZmluaXRlbHkgbmVlZHMg
eW91ciBjaGFuZ2Ugc3VnZ2VzdGlvbi4NCj4+IEkgd3JvdGUgYSBkcmFmdCBhcyBiZWxvdzoNCj4+
DQo+PiAvKg0KPj4gICogU2l6ZSBvZiB2cGNpX2NhcGFiaWxpdHkgaXMgbGFnZXIgdGhhbiA4IGJ5
dGVzLiBXaGVuIGl0IGlzIHVzZWQgYXMgdGhlIGVudHJ5DQo+PiAgKiBvZiBfX3N0YXJ0X3ZwY2lf
YXJyYXkgaW4gc2VjdGlvbiwgaXQgaXMgMTYtYnl0ZSBhbGlnbmVkIGJ5IGFzc2VtYmxlciwgdGhh
dA0KPj4gICogY2F1c2VzIHRoZSBhcnJheSBsZW5ndGggKF9fZW5kX3ZwY2lfYXJyYXkgLSBfX3N0
YXJ0X3ZwY2lfYXJyYXkpIHdyb25nLCBzbw0KPj4gICogZm9yY2UgaXRzIGRlZmluaXRpb24gdG8g
dXNlIDE2LWJ5dGUgYWxpZ25lZCBoZXJlLg0KPj4gICovDQo+PiBzdHJ1Y3QgdnBjaV9jYXBhYmls
aXR5IHsNCj4+ICAgICB1bnNpZ25lZCBpbnQgaWQ7DQo+PiAgICAgYm9vbCBpc19leHQ7DQo+PiAg
ICAgaW50ICgqIGluaXQpKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+ICAgICBpbnQg
KCogY2xlYW51cCkoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4gfSBfX2F0dHJpYnV0
ZV9fKChhbGlnbmVkKDE2KSkpOw0KPiANCj4gLi4uIG9wZW4tY29kZSB0aGF0IGhlcmU/DQpUaGF0
IGJlY2F1c2Ugd2hlbiB1c2luZyBfX2FsaWduZWQoKSB3aXRob3V0IENPTkZJR19YODYsIEkgZ290
IGNvbXBpbGUgZXJyb3INCnZwY2kuaDoxODoxMzogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9u
IHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSBudW1lcmljIGNvbnN0YW50DQogICAxOCB8
IH0gX19hbGlnbmVkKDE2KTsNCiAgICAgIHwgICAgICAgICAgICAgXn4NCkkgdHJpZWQgc29tZSBt
ZXRob2RzLCBvbmx5IG9wZW4tY29kZSBjYW4gZml4IGl0Lg0KDQo+IA0KPiBBcyB0byB0aGUgY29t
bWVudDogRmlyc3QsIGl0IHdhbnRzIHRvIGJlIGFzIGNsb3NlIHRvIHdoYXQgaXMgYmVpbmcgY29t
bWVudGVkIGFzDQo+IHBvc3NpYmxlLiBIZW5jZQ0KPiANCj4gc3RydWN0IF9fYWxpZ25lZCgxNikg
dnBjaV9jYXBhYmlsaXR5IHsNClRoaXMgYWxzbyBnb3QgdGhlIGNvbXBpbGUgZXJyb3IuDQo+IA0K
PiBpcyBsaWtlbHkgdGhlIGJldHRlciBwbGFjZW1lbnQuIFNlY29uZCwgdGhlcmUncyBub3RoaW5n
IGhlcmUgdGhlIGFzc2VtYmxlciBkb2VzDQo+IG9uIGl0cyBvd24uIEl0J3MgdGhlIGNvbXBpbGVy
IHdoaWNoIGRvZXMgc29tZXRoaW5nIChpbnNlcnQgYWxpZ25tZW50IGRpcmVjdGl2ZXMpLA0KPiBh
bmQgb25seSB0byBmb2xsb3cgY2VydGFpbiBydWxlcy4gKFNlZSAieDg2OiBkb24ndCBoYXZlIGdj
YyBvdmVyLWFsaWduIGRhdGEiDQo+IHRoYXQgSSBDYy1lZCB5b3Ugb24gZm9yIHNvbWUgb2YgdGhl
IHJlbGV2YW50IGFzcGVjdHMuKSBUaGF0IGlzLCB5b3UgZG9uJ3Qgd2FudA0KPiB0byAiYmxhbWUi
IGFueSBwYXJ0IG9mIHRoZSB0b29sIGNoYWluLCBhdCBsZWFzdCBub3Qgd2hlcmUgaXQncyB0aGUg
dW5kZXJseWluZw0KPiBBQkkgdGhhdCBtYW5kYXRlcyBjZXJ0YWluIGJlaGF2aW9yLiBUaGVyZSdz
IGFsc28gbm8gc3Ryb25nIG5lZWQgdG8gdGFsayBhYm91dA0KPiB0aGUgc3BlY2lmaWMgZWZmZWN0
cyB0aGF0IGl0IHdvdWxkIGhhdmUgaWYgd2UgZGlkbid0IGFycmFuZ2UgdGhpbmdzIHByb3Blcmx5
Lg0KPiBUaGF0IGlzLCB0YWxraW5nIGFib3V0IHRoZSBlZmZlY3Qgb24gYXJyYXlzIGluIGdlbmVy
YWwgaXMgZmluZSBhbmQgaGVscGZ1bC4NCj4gVGFsa2luZyBhYm91dCBfX3tzdGFydCxlbmR9X3Zw
Y2lfYXJyYXkgaW1vIGlzIG5vdC4NCj4gDQo+IFdoaWxlIGZ1cnRoZXIgcGxheWluZyB3aXRoIHRo
ZSBjb21waWxlciwgSSBub3RpY2VkIHRoYXQgYWRkaW5nIF9fYWxpZ25lZCgxNikNCj4gYWN0dWFs
bHkgaGFzIGEgbmVnYXRpdmUgZWZmZWN0IGFzIGxvbmcgYXMgdGhhdCBvdGhlciBwYXRjaCBpc24n
dCBpbiB1c2U6IFRoZQ0KPiBzdHJ1Y3QgaW5zdGFuY2VzIHRoZW4gYXJlIGJlaW5nIGFsaWduZWQg
dG8gZXZlbiAzMi1ieXRlIGJvdW5kYXJpZXMgKHdoaWNoIG1lYW5zDQo+IF9fc3RhcnRfdnBjaV9h
cnJheSB3b3VsZCB0aGVuIGFsc28gbmVlZCBhbGlnbmluZyBhcyBtdWNoKS4gV2hlbiB0aGF0IG90
aGVyDQo+IHBhdGNoIGlzIGluIHVzZSwgdGhlIF9fYWxpZ25lZCgpIGJlY29tZXMgdW5uZWNlc3Nh
cnkuIFRoZXJlZm9yZSBJJ20gbm8gbG9uZ2VyDQo+IGNvbnZpbmNlZCB1c2luZyBfX2FsaWduZWQo
KSBpcyB0aGUgYmVzdCBzb2x1dGlvbiBoZXJlLg0KRW0sIGNoYW5naW5nIF9fc3RhcnRfdnBjaV9h
cnJheSB0byBiZSBzdHJ1Y3QgdnBjaV9jYXBhYmlsaXR5IGFycmF5IGNhdXNlIHRob3NlIGNvbmNl
cm5zLCBtYXliZSBrZWVwaW5nIHVzaW5nIHN0cnVjdCBwb2ludGVyIGlzIGEgY29tcHJvbWlzZSBt
ZXRob2QuDQoNCj4gSW5zdGVhZCBJIHRoaW5rIHlvdSB3YW50IHRvIGJhc2UgeW91ciBwYXRjaCBv
biB0b3Agb2YgbWluZS4gV2hpY2ggaW4gdHVybiB3b3VsZCBlbGltaW5hdGUgdGhlIG5lZWQgZm9y
DQo+IGFueSBjb21tZW50YXJ5IGhlcmUuDQpJIGFtIGZpbmUgdG8gd2FpdCB1bnRpbCB5b3VyIHBh
dGNoIGlzIG1lcmdlZC4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFu
IENoZW4uDQo=

