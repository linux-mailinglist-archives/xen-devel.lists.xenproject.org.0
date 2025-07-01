Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4BDAEEE12
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 08:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029362.1403099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWU1Z-0002h1-Lt; Tue, 01 Jul 2025 05:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029362.1403099; Tue, 01 Jul 2025 05:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWU1Z-0002fJ-If; Tue, 01 Jul 2025 05:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1029362;
 Tue, 01 Jul 2025 05:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0vH=ZO=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uWU1Y-0002fD-Kp
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 05:59:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:2417::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85ee0c7a-5640-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 07:59:18 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Tue, 1 Jul 2025 05:59:13 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 05:59:13 +0000
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
X-Inumbo-ID: 85ee0c7a-5640-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czi9Vb35slEhJuBMo+RX0DU9T9qg0zriDjDcCuKXoGzOi9qZDjk+hL8j2NzdGLi0TI6DisPUmdi1hxnHKl/z03G7zoXGVBpbQQIAUnThZ+Tg+bxgP9HL0XKm1tZH/wpgOfwa2fvL4rRTuPTNY5PMhQKy6/4nrjKTv2o3qbZm0XRs2R5XlYzQyjWjYs+yAYkkwfA7NtOAnBp/shqkAU1SnUG75i8k8al/sBXzzn9fvp4Su6UmdOgX53H0vHG1VrBcBtMHBP7QN2SY0m9heAztY51VzJE9bQ7Bb7IASC2+lN6E5WPw0ClvlkU9OC3b6oaDcsmK+VDZkgB2aSb39oMSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ4ubSY85gCNuWxi4fUdqOTyyO4XIBiMVwX+tZr3NOo=;
 b=vsihPg48Vepk4FRkvb3shVS87wNMGpF3CukU+a1ZocueBwHJrzm16MnhQ6oc5UZ6yTAAF5K8bnaSevmOfmiM/wX868GAzRFaJ+zy840bkfDa9ux6DMC0RKhNNZ+oojlIPr24iHkQjoJySHmoIQ9nTjyOdAIexySgpG1rPNvedn6MoptZCh0jJf5B/kjv9aijhu5wgL9Tq524MvTMU/ImkLf6hkR19L+T2kxpASVxXaB/1lhdnhFs+klexqv42y3Scw5HWBmwQ3SQNLZ44P54AV9hCjxMGLLGo76+TZ/CHSBzAFxWWDHHTVd4RNkFTfnu+qgf7VuV+yqm/kUY1KnxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ4ubSY85gCNuWxi4fUdqOTyyO4XIBiMVwX+tZr3NOo=;
 b=FraJU2PL+7vATynIKUn09nq88PaCt3ICiHIDlqohOEHVHkuQEEnHS044z4fsW0P4KHlSmeQmKC6LWeBjBNyp9YGUPkomG+KmIe4lcU/4zklwnqlIml+bTXoisjYORXBBbXvuIjF3HuWyab8tSCy3ifVgCecIyt99Ll1pG2IzjKs=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 09/18] xen/pmstat: introduce CONFIG_PM_OP
Thread-Topic: [PATCH v5 09/18] xen/pmstat: introduce CONFIG_PM_OP
Thread-Index: AQHb3onRSa8t50bDJ0W0tHgpfVXRMrQbc7yAgAAAc4CAAWjFsA==
Date: Tue, 1 Jul 2025 05:59:13 +0000
Message-ID:
 <DM4PR12MB845192541C9F23536FAC4243E141A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
 <20250616064128.581164-10-Penny.Zheng@amd.com>
 <d24bf708-6a02-4ef0-99bb-fa642a8594a9@suse.com>
 <7e69e568-b426-49bf-958a-231e25936cbc@suse.com>
In-Reply-To: <7e69e568-b426-49bf-958a-231e25936cbc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-01T05:57:34.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB6657:EE_
x-ms-office365-filtering-correlation-id: bc8d24dd-e6fa-4b16-6ca3-08ddb864680a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGJtT2VMUlA2RXRZZDlqU3N0a0taSnlXbDdEUi8xandvNU04Zm0yTklTM21B?=
 =?utf-8?B?WGo4eitDU0ZscVRLa3FRQ2h1cEVCRUdJQ2hSZkJFVGxVT1dibEtVZndJNks1?=
 =?utf-8?B?U2Q1bFJ5Z0g3NHk5VS8veTdzTkRtd2kzYytOanluVHdxRE9ORitPUVN1UC81?=
 =?utf-8?B?Ky9VVThzTXFKNWZud1pBQVFqZVNXTkZlTklaSnlzdVQvZk1HK1ZJcjR6aVFN?=
 =?utf-8?B?aGU1azNvb0FqWkZWK0dpTU1tSmpBckQ4ZXRUNjZjc0pxb1dUa0J3VFF6SGNz?=
 =?utf-8?B?dURMS0E1dldBSDAxbDJLQ1hIamN6TXk2dGx6Q3JOUnlONWdCMmJPOTBuYUR4?=
 =?utf-8?B?SndRQ0NFNFl5UUF0MklydkNYUlpKTTF1eVBBbTBCZTRhaGZObWl0bWJzazVM?=
 =?utf-8?B?bE1TS283TkF4T0J2T1JUNUdtMEtyQnZtQmtzMThjczN0L3c5QlltcW95bmFx?=
 =?utf-8?B?RVdIUnVFOEQzNWcwSUJ3Q1B3cHZmUW5vV2VOVVZ5UytqR3c5ZVczMzVnOTky?=
 =?utf-8?B?N2ZJdU1RRy9RMjNFcUNEUjY0R1lMNVFWUjR5akJEWVMwSmxIU1dNK3FEcmta?=
 =?utf-8?B?Ui9nMlFpOWFqejVGeEFNdHQ3TmZUYTFtWVI0TFJUYnd1aDB1NW85NEF3RVQx?=
 =?utf-8?B?cHhNNFBkVU9oZnBxMzIvU05GV01SY3g0c1lFZCszT0JwbU9NRFhHMUxDSC9r?=
 =?utf-8?B?WVFySURJc0Rtay9XcVdQeEY5N1F6K3JrYW1GRmRIeWNBMFVFUFpKVThOMm1G?=
 =?utf-8?B?Nk51NTJSN2pqMUNXREpablRUNFY3Z2l2U2ZsNUszZnJFVDdDMG9LaEJ5MUU5?=
 =?utf-8?B?WTZmY0EzTHplQzhBRi9BTUtiR1QvU1ZvcktobEZxYjcwU2MvRXc2QnQ3WmN3?=
 =?utf-8?B?SDY0VHFlTzBTRUdVaDFjT2d4bHJTMmc3UGRaaEhqVFdqNVRXbmdrMEJEL04z?=
 =?utf-8?B?bUZWYmtDRndJN0VhOU9URkNQTmszMjlFNXBRR1gwODIzMHRhek1UUXd0a3dP?=
 =?utf-8?B?THZyNVhrK2kvd0VEREltdXVQVlpjVVBTOHlWelVpNjhlV1VHME9pTGNYb1JN?=
 =?utf-8?B?cnpTb1ZqdFFDanRDWXNNWmgxd0VGUkh4TlMrVU4yWmdwcVIxRlpqZVd4SStH?=
 =?utf-8?B?c3JwSHRXRGtCdmh5VzRxd2g0cGhWT3ZYMTJRVTZkYzd3WHd0cWNiOWYyYmdM?=
 =?utf-8?B?cVJlT2t6ckRSS2Nza2RacGFWeVVJMlNkVHRoRGJFZVRER1d5SHRlRXJFekFQ?=
 =?utf-8?B?Rmt3b090SzRxL05hSmpENVZTQWZ2YnBEOGtCSFpkT0xXVkNmTDBvZjdzVks0?=
 =?utf-8?B?STBKUFRDZEVaZHE0MTlZTTRpNExrdGYrWFJNbUJCVzV2MUc5Wm1aaEJZdGZC?=
 =?utf-8?B?T3UyOENHUEpoSWd2V2xGNG85U2hIRXFLRHRmTE9GbGhsNi81WDI2bmZjc1Bw?=
 =?utf-8?B?Ny9MTWdXSEYyYkNmNjRNejVtWEhwOUUwVjgxY1FSNXN3am5hTnd6OFJoRFlp?=
 =?utf-8?B?cTYrcnJxT0w3ZEsxajRxeUdiU0ozMEhJZjJ6OURtSzdWTnUxR2pJTEFVSndP?=
 =?utf-8?B?eXJjNmhVNSs0bjJqU3l3Zlg2YzdsSjRGOG5rKzNHTzlHOGwwR3JubFVwOVJ1?=
 =?utf-8?B?T0NUSmtGdnV4ZERNZkVLY1RZK0gzNTNmK3lmVUtxZVZiL0cySVdyRm9zQkEv?=
 =?utf-8?B?dm5TcHZOZkczbkxMUjBsSFJSUjhtOUxzL0VWc2dqVXZzekI5MWdhbUd5UGtS?=
 =?utf-8?B?cUs1bDIxZkl2QnUxa0g1aHBNejhzZEtobmxRdmdEdXYvRy9ybWlJUXpkd1hj?=
 =?utf-8?B?Vk5OUWlsOFNZNWQxeHlxZ01NUW96ZXo2SDBrVXp1clNjOVZYQXFlZGt3U1Rt?=
 =?utf-8?B?Q3VpcTVwUHV3U0RxSkVQcEd3R25lZVBaR1JoR3h2YVFobXBCTFJpQTBBVVJz?=
 =?utf-8?B?ZXVGSUhWdnZiTDdkMVYvdWNRWEpLaktyY1JmaU0xcEhEZ2liVVcxOERVRUw5?=
 =?utf-8?Q?V3R/nVT8giSGHQ1o7b1tND2GHhK1wI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elhoNWRXTlRmdEJOeFF4NWlTSWxLNkZWbGdnQUJvR3VBc09TdVFlQ1Z6engw?=
 =?utf-8?B?bTJTdUI1QTlHc0YwcnNaRWVyS3YxejdvN2JMcHpjTk0rVEI2YmExb3dxU0Y1?=
 =?utf-8?B?UmdXbmVLVW9MK01wTFpaL1NzRmVlY2pJMnl2cUpMRXhPelZEcnU3M2RkRU1Z?=
 =?utf-8?B?UE9HMXdTS2ppZzQ5VkYrMWFvbXNmL25RWXoydm04VFY4SGdZeUxYakxsTkEr?=
 =?utf-8?B?Y3c1aGVQdlNibEh6QjgxR2pKcDRuOXRHS1BXTEF5L0JjY0pGZi9wcUlYcU4x?=
 =?utf-8?B?SXpJVTdhOTFrQjFvNDF0MTYxUVl4L203QTNtTVhHdVFydmJjdjlERlhBdGtv?=
 =?utf-8?B?LzBxWnlsd05hUXA2M3BucVh4RDBjS0oxaEhzcFFNRFVGQ1ZHOFhDbnhPRmVO?=
 =?utf-8?B?ZE9HRGFzSGtOVVN0MHZ5SmhRbkVDLzVzcllSYS9CRXRSaVlUcmUxTFR5UkxO?=
 =?utf-8?B?RGptOHh5MlhBQ2crYjBoNCtiTmtTdXZLOHhkSWpRYXF3eWdoS1dVOXRHaHpp?=
 =?utf-8?B?UXJFeEhmaEZvU2hKN2FZeGtWYUlXVytUN2c0bjJTMmhVMTQxVjF4RExCZ2V4?=
 =?utf-8?B?elV1djNvOG55d1d2bjdwUkliV3JFbDk1TE5NSjVmVlUvNVlVZFNtRy9XVjgy?=
 =?utf-8?B?YThYMlVsekY0VktFWEpwVnkveldBNm1EdC9uc1dkaWlObDlHRHoyVXVYb0lo?=
 =?utf-8?B?K21YUnZocFhFYzk2UmhYRHRUekZhamw0ejF0K2F4ZmMrd2h2Lzk2SCt4Nllz?=
 =?utf-8?B?TkpYOGdGL3kzNU9xcGZ4RUNyVThSOVYveW9OK2lNSk5OcVpNVjY0SUVCRVYy?=
 =?utf-8?B?M0pkZ2N0RTg1bkNwckJsWk5mcjd0dFV6bFZaWWNldktzNXZZc1Zvb2NVc1k4?=
 =?utf-8?B?QzRjYjdkSTFYeHY3YXVFVmN3aHFmNHc4bG1IWXdsVy83TkVvNXZkV25rYWQw?=
 =?utf-8?B?dGNobFlycFFiLy9NZmh4dzFYaDJ2bVBKOUs5cHRWTHREMmJPZnIwWnp6bXc1?=
 =?utf-8?B?UXlVaGJ0NUw0dVFjSGM3RUgrbG0rMnR6YUM2cGZYRWk0bXlxRVlsUTUrOWl4?=
 =?utf-8?B?NEt1dVdGbWVwK3VQZkF5eCtBWHlvVFc4QjV6TEhuVVBkdFQvVGtzZnE0VWZQ?=
 =?utf-8?B?YW0rU3dQUkQyQ2IrTUVPdmgzcXBoeElBTnpaMS9vemd5TmFHSE1vQUV2TDcw?=
 =?utf-8?B?eWhZdVBxcmM2VkdvYy9QakZXZW1IWlA1bkg5MTNES0dZWDZOaDNxeFdIa1hs?=
 =?utf-8?B?UU5VSWwrckRtaERWbks3aGRxSkR3WHpuY3F5VUpQckxESnJUQ2xFYTZxMDZ0?=
 =?utf-8?B?TFB2bUxSVnR4dldjVk5oY0ZpRlpDU2oyM2xtWEpWVVptbW1jTFh5VFN3ZE5w?=
 =?utf-8?B?OHhTcGh6K0k5Zk9Sem5uYjNrUlR0WHBwUVNUYnlrSzY1U1pRd3piQXNwUjZT?=
 =?utf-8?B?MFU3dXhaUktVRXlIOGxtaitmMFNOTTFLV0VMYlc4V1JIcVpaWWtSOHQ1Tk00?=
 =?utf-8?B?YldyaFVMZm9qVDRqNE96M2tGYTFLNUI2Vm5ZUkRtbUtSbzFJQ3U0aFVRRnhN?=
 =?utf-8?B?YnhqcTZTSG95NW84R3FRVm1adHJBOWVEV05zanJ1SUUwUWtKT1JjdDVTSmRO?=
 =?utf-8?B?VTY5YzFVMWs4V0ZlbU9aajR6U2M2N3E1eHFhNTV2SlRlRWdoRjBnaWNpcWJp?=
 =?utf-8?B?enFBWTV2ZFhmbTg1S1pwMmxwQWNLcTFRSXpNR2FUMGF6YmdNaUh4NHNzL1Fr?=
 =?utf-8?B?b1kxWFJsUmMrTlJMQngyc2IwZVNKVWlneDFiL1NXN0VVekd0MXh4emg3cDVz?=
 =?utf-8?B?Nkhvb0Q0cWN1R2dGMjQwWERMMzVwdE5OZlhQVlJPS2NNajY4RFRjOHVWM3lX?=
 =?utf-8?B?c24vcHp6OWRnanV0bkMrVStQa3hYM0x2UG9CY3BpOG9VSnNrYitEL3RVTFJE?=
 =?utf-8?B?dFB1Y3pobWx2TTlDOGlkUVZCekh1ZmRwb2JPRGV2dkp6SEwyUXFScEZmd2lN?=
 =?utf-8?B?clloRmlDejJPQ0FnY09nTTZCYnM5cVJJMkd4eTdmZzlsb2VsdVpmdFFNTlpJ?=
 =?utf-8?B?NXdtRnhmMUh6U1FvOVlTQlJjSnVadlI0MHlOOHMvdXRQNUVMazRoU0RGamk4?=
 =?utf-8?Q?M79k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8d24dd-e6fa-4b16-6ca3-08ddb864680a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 05:59:13.7995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVNBeAZ4h5fPWnZ/BX93feikD220xhZ1Fj+fXLXCDGxJ51f2AjR9KTIi785ncGTVXcYPi8Jg8bjZVon9nWOkAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMzAs
IDIwMjUgNDoyNiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47
IE9yemVsLCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY1IDA5LzE4XSB4ZW4vcG1zdGF0OiBpbnRyb2R1Y2UgQ09ORklHX1BNX09QDQo+DQo+IE9u
IDMwLjA2LjIwMjUgMTA6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDE2LjA2LjIwMjUg
MDg6NDEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcN
Cj4gPj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+ID4+IEBAIC02MjAsNCArNjIwLDEyIEBA
IGNvbmZpZyBTWVNDVEwNCj4gPj4NCj4gPj4gIGVuZG1lbnUNCj4gPj4NCj4gPj4gK2NvbmZpZyBQ
TV9PUA0KPiA+PiArICBib29sICJFbmFibGUgUGVyZm9ybWFuY2UgTWFuYWdlbWVudCBPcGVyYXRp
b24iDQo+ID4+ICsgIGRlcGVuZHMgb24gQUNQSSAmJiBIQVNfQ1BVRlJFUSAmJiBTWVNDVEwNCj4g
Pj4gKyAgZGVmYXVsdCB5DQo+ID4NCj4gPiBCdHcsIGRvZXNuJ3QgdGhpcyBhbHNvIHJlcXVpcmUg
YWRkaW5nIGFuIG92ZXJyaWRlIHRvIHB2c2hpbV9kZWZjb25maWc/DQo+ID4gQW5kIHRoZSBzaW1p
bGFybHkgZm9yIFBNX1NUQVRTIGluIHRoZSBuZXh0IHBhdGNoPw0KPg0KDQpZZXMNCg0KPiBOb3Qg
c3VyZSB0aG91Z2ggd2hldGhlciB0aGF0IG5lZWRzIGRvaW5nIGhlcmUgb3IgaW4gdGhlICFQVl9T
SElNX0VYQ0xVU0lWRSwNCj4gb25jZSB0aGF0IHdhcyBtb3ZlZCB0byBuZWFyIHRoZSBlbmQgb2Yg
dGhlIHNlcmllcy4NCg0KTWF5YmUgaXRzIGJldHRlciBsaXZlIGluIGhlcmUgd2hlcmUgdGhlIG5l
dyBLY29uZmlnIGdldHMgaW50cm9kdWNlZCwgd2lsbCBmaXgNCg0KPg0KPiBKYW4NCg==

