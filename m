Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6FADC02D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 06:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017675.1394669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRNmq-00047I-IW; Tue, 17 Jun 2025 04:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017675.1394669; Tue, 17 Jun 2025 04:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRNmq-00044R-Fl; Tue, 17 Jun 2025 04:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1017675;
 Tue, 17 Jun 2025 04:19:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zxid=ZA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uRNmp-00044L-Ih
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 04:19:03 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 318694a4-4b32-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 06:19:01 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 04:18:56 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 04:18:55 +0000
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
X-Inumbo-ID: 318694a4-4b32-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=op34QFOkeCgV9YNIEKsOBbnKltSfjjhYt2dwmB7TKFSlOarOwX+xiiWU9sJEy0J4hqnc1FOAuHCQD8KMaGwmzp7zfANPZRgAECOtKXTHC6JClhNizuHETaZIWHCk7EsbDpiq20lXWEbmvnpOhbK+Xy6SdueO7R5N5Jr5LF+7LoaSGuPYcWigAsjmmG9PlKLRAvGeVVbWxXhoSCpMbDSmjIMq3RJa53cmnugZ6+W9lRAwTPG3TFyVqpCO2K9h4SgcyKAJyoX+yKvFedi6S1K9/Z0UF6NhRlLN2ZWZLk6ul3FzJOiMLpIwxQd1b3TF89wYYNgmc+mNrjlWW9fBTbKA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIpxpE3uEtt2jbaKBahK6/4JCXHx7Ruvd4JUUf2fhzA=;
 b=sSSVZnpBwThkRTiKLl1AQkmX9CtrisZMnn5IhvmFonpkNQMzYXQ2+1ADQBBAc4Q7TWEvt3pNk8TMzwqMM0bRW/TIT9PdPF+O8vf+m0cjRBhl4RvO4+05++XTzKytwZnKgDKUCs2BbenwOicUHhi5ILjMq7jBHbD6jSi+Vqaf9ynMPEySB60L8M4Syae42YQcD/ukNKco8I0AfQakN06PrA2eYURWVRBCxUZPwMBJZv2TFhjBTp6utdSR5N+b53iFdNwsNRd1InbHtJ9D2L8z73YK2xA7aiYVtbcGkmOnlg9guhPCVvFH5Ztidx/+8pJ01v4liG026VbUdnt01ETHfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIpxpE3uEtt2jbaKBahK6/4JCXHx7Ruvd4JUUf2fhzA=;
 b=G/kJyC8V2J2aHk6eHz2AUgSCDFzXvnwy7vvXd5R/snhndrOs6gf+hWZk2KYGxG2RIIG5TtbGBTjsBsflOrKYdGCVQDeu6XWh2csvK5+6oljHN6kQ7XA2ImCd/5vN3F/Ck+pQZvy9LnKHASg0QTe2F5fzwrncq1vWvP7D9y449Xk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbzuQ+jriHLS/NnEiww9yxRz3NOrP+OOqAgAdvjjA=
Date: Tue, 17 Jun 2025 04:18:55 +0000
Message-ID:
 <DM4PR12MB84518F0C8E04A57FFD71341BE173A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-5-Penny.Zheng@amd.com>
 <0de0ea5c-64c9-4ac8-8e76-750cb3036419@suse.com>
In-Reply-To: <0de0ea5c-64c9-4ac8-8e76-750cb3036419@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-17T04:18:48.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH2PR12MB4215:EE_
x-ms-office365-filtering-correlation-id: 34c71ab7-bc2d-48a7-baa8-08ddad56133c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2doa3NRMjhMSmpHOVQzM01xa3E2RHNkUVM1bTdJVmZBeXQwVVZYcmY1Zm9p?=
 =?utf-8?B?czcwVHhxVC9PNUtROC9nM3dCNXd1WmhZL1VucTNEeEQ3S0NiaDZFT2Jya3ov?=
 =?utf-8?B?ZG02cVUvQzloY0EvZnQ5c0tLeEV0cmtxU0trSUNqWHd6SlZwODJ4dDNIZysw?=
 =?utf-8?B?UlI2V3BGNFZubStTY1g5SzB0TXhhT3lLcnBGT0MrN05OU0VYVW1nY1E4bEI4?=
 =?utf-8?B?ZmZiZzI0YTdadWtJeG96Y0hsUEsxQVV6RldLSGlieEo1N3dMWE9TdnBJSTZa?=
 =?utf-8?B?VmdQTDdoNHRTYjdCbG9LZElWTHJRb0ZwMjhUYXFGWEJxbStEMFgzam9BZnp0?=
 =?utf-8?B?SXVxNXdkSFJmUDM1TjJ1d29zaENuTDV3dTQ4c1liSDRUdEwvU3l1OEZROTZo?=
 =?utf-8?B?MXdIUEJCMFdhOThWTERhZnFtY1kzZXEvR0JLODV3a0c0dkF5alo2KzlxR3VY?=
 =?utf-8?B?Tm1iaFBJeFhOTGMrL2xHL1FpRmFZWFhoTzYxMlJMak5ha0FIak1MVXdnZVE0?=
 =?utf-8?B?bmlNWHFvM1hjTUlJR1JTb05ESXF2Wm9GcWYrUzZJNG1VSE9SS2x1eDZEdi9Q?=
 =?utf-8?B?dnRFYXNacG9Xc0VndnNyWld5bkMwNDI4VkdyclBwdXVPMndvME1Vd3lMMnNX?=
 =?utf-8?B?TytaQ3FWUnp5eWpvVmozY3NiYUIvRDBHcnd2d3BaL0E3UTNCUDNmOThqUWFB?=
 =?utf-8?B?b0lnV0p4YU1qYXFjREluYkV3bDdFaXdra1VKQW9vbFNYMmpuVWNYL0ZtaHJO?=
 =?utf-8?B?cGVTaFlETVVzL2lPd2syZW12cGpFUXh5VGlwWkovN3hURnNFU2pBQ2lLWk1Y?=
 =?utf-8?B?RDl0SC9DWVlkN1RCbXptWm5URkV5SUliZW9obnY4UWNjT1B3bTVTVUEranFm?=
 =?utf-8?B?NEx5MHFHbWZPaG9MS3dKTkRMNURIZy94R3RXVmJsTkc4Z1R2OXlmbXFnNy9T?=
 =?utf-8?B?aHI3OFcwcHpha1EycG5jYmxMOEphWGxIaDNIcG1jUDZXSzVZYkM5VWVFVlVr?=
 =?utf-8?B?OXhEOU1iTmgxY21hV00zU05ZTE5DOU5sa1Z2akwvbEl3SnBOTmEwWW9DQUwx?=
 =?utf-8?B?b1lhUE13VnlrcG5yTW9rbXRXRDdjOVNPb0VocnJmblU4Z1ZKN1h0cVR5S05N?=
 =?utf-8?B?WFZFN0lwcEh1SFR3OEFRcnFyRGtlQVFQL3BkT29yYTVlWWdBcW1rbkExcVRr?=
 =?utf-8?B?MXNIQmNYZXZBVnhScU44UE0vNFhlU3NpNjFiZDRkUGM2YndFSUxOcm9sY3E2?=
 =?utf-8?B?VHNVMDR2QTFTNXhaYlUrVmxUUzBEQ3I3Vzd3TCtWVXdBaUdEbU1tdWNUUWZD?=
 =?utf-8?B?dXJwR1k0OEg5dTkySC9XdExyTTBCck8razYzZXJYKzhVSkhlSFo5QVFtU1Uw?=
 =?utf-8?B?bmtCSjkzM3BaWS9vTE5JSnh1ZWkrVmk0TzhCN1Q0RFowN1JGRWJtenNpbm5y?=
 =?utf-8?B?SnYzazFLS2FVSTlPMWxib3NEU1RXVXM3VHhUZ3IwNm1RdGZKSXFydFZ5Q0Vh?=
 =?utf-8?B?Nzc5VUM2Z05HMHVjVzd4bG1mSzdmclh0VWc5b3AraUtUcTBFWHh2Ym94em50?=
 =?utf-8?B?M2pOZkFwZ1g0Z25PanF6cXlBQ3BlV2tQWUhmVFlCMnNuVUVBNWt0aTJLSXhS?=
 =?utf-8?B?UkZpRjhNbUZxMTd6M2dTVEFnaXprOStkdHJFNGVuelF6WUZaTExSVWpWQnRm?=
 =?utf-8?B?TUZCTm9nb3ZyL0swZGh3RVNGTm1seitMMFR3Rm1uZFlHYllKTUUrUTZoL29R?=
 =?utf-8?B?YjJ3Ti9vWWpGV1lpVW1vb05VQnNIQUw4bWlDT2hIbWhqTWltRXhkdnZTdlRP?=
 =?utf-8?B?Z3FZZExoc1FXcmNKTXdQbjk5a3lRV2ZBOStiV0E1MkdyaXNKazlzRDN5RWMy?=
 =?utf-8?B?L1VremtVV0tkUVF5QlNJb0pOMU1UTDVLREd4N2xEbHNLbGU0WU1VNVdaVmhu?=
 =?utf-8?B?VUtKUi9KTzlQRkY2eUsrTURrRy9wZWtybTlZNGwwdHl1b3JoQjFUMkZYN1ls?=
 =?utf-8?Q?58DDBVaedZi7KusGlCurPFYuEr9rxI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3lWZjdHTkxQcE9iMEEyWFBpOU4vd3JBSUJSUUpaeER0UWdIUnhvb2VleWk1?=
 =?utf-8?B?UlFQdDhOdTJBNjZkc2h5dEE4VldIVzZ4QmVQOXZXS2hVOHhZVjVZZHVUZFhh?=
 =?utf-8?B?dFRCaVlQUmk4TnhjNmgwMEpuWUF1bDg2QzRva2diMTRLdnZhM09rNGFrS09u?=
 =?utf-8?B?QWpJeGNQckpOMDlvclV0R284eS8wMGpwM2prSGZVeXAxOE1pdk1JVkVjbkRD?=
 =?utf-8?B?c2VlaGVWVXdPOWkzTlpJVTZkKzgvVWYwQ2N3NitLRi91LzZsS2dtR2xYVTM4?=
 =?utf-8?B?cXBUVFMvQmZqVkxPVk5wUDJNVnJTUE4vUUFydHFrdjRSeS92MWpaVXFSOFBk?=
 =?utf-8?B?MFBWVmxUS2gyaVhkbDhtSUh5djdTWmZUc3JEaUl0NTFpY3MraHo0YzJNdUhU?=
 =?utf-8?B?KzNucVdQclArZHlOOUNNdWREUWZBTW0wUE1FMHZjYW1ZSjlHNXZGRmRQc0xi?=
 =?utf-8?B?Y2MzQkcwOThQdWExckkvM0ZRcDY1UC85Mm1yRUxxNTdrN2x0VGZQd0JQQlYv?=
 =?utf-8?B?NlNhQnNIUDM5cVpsRFM2anBKWk5aT0ZHbDNqMlFKcjJCWVNqWHN3Wkt0ckgw?=
 =?utf-8?B?RmNCQkl1NE03MGF4QkF1Qy9qTXBMaWJKZmF6MWtCM2V1ZDUzcUZoUFVMNmtN?=
 =?utf-8?B?bU05MVRNc1dUTFRwUTRuaDZVWWxKajFWaUY1T0VaamxoNHlPUjBtTUVLcStJ?=
 =?utf-8?B?WVdyMWNKMk4yQ1pIdjJ0MVdHN1hnUU5odGZRYUVONW1BZFFsR0xENjJZMEZZ?=
 =?utf-8?B?ajZZdmp6V3JwMDFQZWhSWFYrQzJ5N2JjZ2pxd040dlorbmZBb1R1b01aVVBo?=
 =?utf-8?B?MDd1b21lMkZvaXhPVk9jVVRxanZBeGpjaHpxd3ZvR0t4d3BOU0w3enRNZEtu?=
 =?utf-8?B?ZUw4SFdrNFZJd0JGbTJtY2lxUzVBMG1kZks1ZVNnQ1NaL3pkSTBUZ1l1M2pk?=
 =?utf-8?B?U2FYNWE1UWxEeEgyY3lJWGF5Q3FZOVBvN0VyTi9kWkRrVW1EaGZmTlRUSEFk?=
 =?utf-8?B?QU1abnpUUUFabGF2ZkxmbHp5REd3bTBaSUhLOXYwQy9RYUM5aFNJeDJVdXd3?=
 =?utf-8?B?MlVaUFJacVFlMUx3MjZNUzl2b3liUmVXM2NRR2JaaWhSN1UyYkY4N1F6T1lZ?=
 =?utf-8?B?a2h5WEtzMEVPbGhscTNhN0RvS3VLU2dLbEErVW9taE9NaUhTRGkyMnN4Z3V2?=
 =?utf-8?B?UTBObHpsYURXR2wzd0NmUWczNlZSZkVMdDlsMm1YRE5HRFp0aVFGaHB3aS9K?=
 =?utf-8?B?TDVqYXV1WWFxc0Fxa1lsUVZGZ2huY0JGK1BJbGNZRjIxdUNsY1NzRnVEWkky?=
 =?utf-8?B?aStPY2E1eXNVWUtzNW43THNBVndyTzNaZUsxT3FYU2dMcTlJanZDUmxGLzg5?=
 =?utf-8?B?R2NrRDJselRjcWhId3FVVDdNUGl0bGdIbkQ0RkIyQ2RCY1dSWG5XMVZSU2tw?=
 =?utf-8?B?YzlGY1pmSFBhWXJld3o5QkhFcThkSHVRdUFxQWhuaHZ1eGZRM0x3bS9EUDl3?=
 =?utf-8?B?cFpDRTNHT3ZJUUZpQVNiQW5xMHlyNWNuQmdXdW82Q0lDRXZKSjA2MXBnVXk5?=
 =?utf-8?B?TEh3R0E0NDBXTVMxUWhqVkEvNHlxdDFrV0VNd0RJdmNWMmE4WDh6bm1qcWRI?=
 =?utf-8?B?aXBSaVFZUW9CTjdvK2dQbmY2OVVOK2R4TllueGpsYzZJSHJLRWx4UHN4c3JQ?=
 =?utf-8?B?T2FhKzl3WmpaOENrMjJIUnNwL1RDcnNnUnoraUNMZXViL3dEN0s4VytBMGlh?=
 =?utf-8?B?eDhUNTNreFdoYll4LzJEYWg3RnVIa01ROWxmS0R5TXJkZVgwSHVWRnl3cDIx?=
 =?utf-8?B?YUYzU0ZPWExocWw5YkM5SllEYW9BTTF1a0RIek9xZU4vUGkwaDZvbll2UUVN?=
 =?utf-8?B?M0F3cFV2b2hpbEtYeFFvMlZBNDRzNTkrN0x1NzVWbCt2YXF5ZkpVTEJic1NX?=
 =?utf-8?B?NXNPMkRCSTEvZGpvaCsrYXdDZDl2eit2WnQxbThMQklXcmtwQ1NNSlVYS2RO?=
 =?utf-8?B?OVBBRjc1SlNuZy92VlJjelpOanl2aEh4WUNuNmd4ZUYvSk93aGh1YVZETnBF?=
 =?utf-8?B?S0VFa2RjekU1YkRoTCtSdTNYdVdvaFpDUkQ1QzN0bmtZczJpSG1aamhwUmo0?=
 =?utf-8?Q?su1A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c71ab7-bc2d-48a7-baa8-08ddad56133c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 04:18:55.7882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4exwQyX2cKJlAzQ8LWfW3CRoeykk8GIvdMveF4h/MuDtOAzGAurjJCBmzL2WTY+DpgXwAPRAa2ZGqyLEPg73Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEyLCAyMDI1
IDEyOjEwIEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6
ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djUgMDQvMThdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgbmV3IHN1Yi1oeXBlcmNhbGwgdG8NCj4g
cHJvcGFnYXRlIENQUEMgZGF0YQ0KPg0KPiBPbiAyNy4wNS4yMDI1IDEwOjQ4LCBQZW5ueSBaaGVu
ZyB3cm90ZToNCj4gPiBAQCAtNjM1LDYgKzY0MSwxMjQgQEAgb3V0Og0KPiA+ICAgICAgcmV0dXJu
IHJldDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIHByaW50X0NQUEMoY29uc3Qgc3Ry
dWN0IHhlbl9wcm9jZXNzb3JfY3BwYyAqY3BwY19kYXRhKSB7DQo+ID4gKyAgICBwcmludGsoIlx0
X0NQQzogaGlnaGVzdF9wZXJmPSV1LCBsb3dlc3RfcGVyZj0ldSwgIg0KPiA+ICsgICAgICAgICAg
ICJub21pbmFsX3BlcmY9JXUsIGxvd2VzdF9ub25saW5lYXJfcGVyZj0ldSwgIg0KPiA+ICsgICAg
ICAgICAgICJub21pbmFsX21oej0ldU1IeiwgbG93ZXN0X21oej0ldU1IelxuIiwNCj4gPiArICAg
ICAgICAgICBjcHBjX2RhdGEtPmNwYy5oaWdoZXN0X3BlcmYsIGNwcGNfZGF0YS0+Y3BjLmxvd2Vz
dF9wZXJmLA0KPiA+ICsgICAgICAgICAgIGNwcGNfZGF0YS0+Y3BjLm5vbWluYWxfcGVyZiwgY3Bw
Y19kYXRhLT5jcGMubG93ZXN0X25vbmxpbmVhcl9wZXJmLA0KPiA+ICsgICAgICAgICAgIGNwcGNf
ZGF0YS0+Y3BjLm5vbWluYWxfbWh6LCBjcHBjX2RhdGEtPmNwYy5sb3dlc3RfbWh6KTsgfQ0KPiA+
ICsNCj4gPiAraW50IHNldF9jcHBjX3BtaW5mbyh1bnNpZ25lZCBpbnQgYWNwaV9pZCwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjICpjcHBj
X2RhdGEpIHsNCj4gPiArICAgIGludCByZXQgPSAwLCBjcHVpZDsNCj4gPiArICAgIHN0cnVjdCBw
cm9jZXNzb3JfcG1pbmZvICpwbV9pbmZvOw0KPiA+ICsNCj4gPiArICAgIGNwdWlkID0gZ2V0X2Nw
dV9pZChhY3BpX2lkKTsNCj4gPiArICAgIGlmICggY3B1aWQgPCAwIHx8ICFjcHBjX2RhdGEgKQ0K
Pg0KPiBUaGUgIWNwcGNfZGF0YSBwYXJ0IGlzbid0IHJlYWxseSBuZWVkZWQsIGlzIGl0Pw0KDQpJ
IGFkZGVkIGl0IGJlY2F1c2Ugc2V0X2NwcGNfcG1pbmZvKCkgaXMgYW4gZXh0ZXJuYWwgZnVuY3Rp
b24sIGFuZCBtYXliZSB3ZSBzaGFsbCB2YWxpZGF0ZSBlYWNoDQppbnB1dCBmb3IgYW55IGV4dGVy
bmFsIGZ1bmN0aW9ucz8gT3IgbWF5YmUgbm90LiBJJ20gbm90IHN1cmUgaWYgaXQgaXMgYSBNVVNU
Pw0KDQo+DQo+ID4gKyAgICAgICAgcG1faW5mby0+aW5pdCA9IFhFTl9DUFBDX0lOSVQ7DQo+ID4g
KyAgICAgICAgcmV0ID0gY3B1ZnJlcV9jcHVfaW5pdChjcHVpZCk7ICNpZm5kZWYgTkRFQlVHDQo+
ID4gKyAgICAgICAgaWYgKCByZXQgKQ0KPiA+ICsgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19X
QVJOSU5HLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICJDUFUgJXUgZmFpbGVkIHRvIGJlIGlu
aXRpYWxpemVkIHdpdGggYW1kLWNwcGMgbW9kZSwgYW5kIHVzZXJzDQo+IGNvdWxkIG9ubHkgcmVi
b290IGFuZCByZS1kZWZpbmUgY21kbGluZSB3aXRoIFwiY3B1ZnJlcT14ZW5cIiIsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgY3B1aWQpOw0KPiA+ICsjZW5kaWYNCj4NCj4gV2hhdCB1c2UgaWYg
dGhlICNpZmRlZiBoZXJlPyBUaGUgbW9yZSB0aGF0IE5ERUJVRyBjb250cm9scyBiZWhhdmlvciBv
Zg0KPiBBU1NFUlQoKSwgbm90IHRoYXQgb2YgKGRlYnVnKSBsb2dnaW5nLg0KPg0KDQpVbmRlcnN0
b29kLiBNYXliZSBJIHNoYWxsIHVzZSBvbmUtdGltZSBwcmludGtfb25jZSgpDQoNCj4NCj4gSmFu
DQo=

