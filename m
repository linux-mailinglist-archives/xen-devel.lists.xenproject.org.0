Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0157DAE9772
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 10:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025993.1401251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhZx-0007WV-Mt; Thu, 26 Jun 2025 08:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025993.1401251; Thu, 26 Jun 2025 08:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhZx-0007V3-KA; Thu, 26 Jun 2025 08:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1025993;
 Thu, 26 Jun 2025 08:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MONz=ZJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUhZw-0007Ux-Bw
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 08:03:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2412::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b8fff9-5264-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 10:03:22 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 08:03:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Thu, 26 Jun 2025
 08:03:16 +0000
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
X-Inumbo-ID: 05b8fff9-5264-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fufd88mbvN8rR1b8EwEfQI1euLtRYkSxvm2V501gJnMSaCGQ6lvMx6kpsvtxkvwn+bjNaDbysX1EY9ljinN0xDum5bkB19yqLx4bGV2iFVoLYDSDsj7CEnivThCwOgOf3hQFdrDKkXhnm8GgbzDhhFcg8z7pUi7YPW0nBcC/b2hIAZ3zu0DN6XmUuBSbBNbeb6aOngDlPUPaP0C5oq+4PGRnm6LOqnt4UWYtb2wczDv2816CDfKF85Yctw1TsYmiEHuGScVb3CX4DRQJsyRFeDzkLb6WYEU3KYHpvmKDNNVDKIRxSH0mVhLlYzFtH8yvDsnOEf4879X0bsZiD9joOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUUBeDXFvjCJhw2C1JuM6OwIToeQin86XXHa2v986Rw=;
 b=E8kp8h/87tKllxwjH0FuXccMLCVEazKKkzt3oleQD58E5zzApLVTudRBwoy89SWLWCsMyqaGA5/PhyudqxUYrmDmveg6K9dvcaYfJzPylpcP19pMgvYJHvn/c88mEiW0hgW0U8tNKEBujCEj5Ve+h/qRp/SLGeoL2Irq9tz4DJyYeNyu5b1dv4LCYbHVPY2j+Dzn33AeuriP1bZSW7Kp4BmVwz+7hb7cw092U4SjVQEOB9OiSHVCDap/ZpWMM4+12/s1/EazSFfv6Avf9GcQnTGz9c0+4duZACXyLT1lrY1RAv4OGNIC0+7L386ohcv7umhKF0XNyo1yDRCKBQlieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUUBeDXFvjCJhw2C1JuM6OwIToeQin86XXHa2v986Rw=;
 b=1lJeXiBbl+Wlx5NNcoyoFofBshh3JVJSm836ObS4hwMYIVvPeaZSxO84HokbuoeZL0kCtHB4lH6+76yqHJ0q+Fzbr6vf4coBcNm03HYioQ7kTt0bSfcv/Fl79FSfUjLzpUz3SU9DYyljQO008gaELz1i1JE7hlEMFnlx90Jzjw0=
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
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4D//5oCgAASTfCA//+FrwCAAIi+gP//u5+AgAGwYIA=
Date: Thu, 26 Jun 2025 08:03:15 +0000
Message-ID:
 <BL1PR12MB584979FA987CE2D6E242648FE77AA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
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
In-Reply-To: <7753470a-efef-478a-bbe5-ae48d008cfdb@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB6993:EE_
x-ms-office365-filtering-correlation-id: f7582701-d58c-48b6-4d11-08ddb487e7dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c21iV3V2a0xJL3V0Wkt0am5MTVZSaUdGSUNwR0dFWU42b2w4ZmdZL0RTN3U1?=
 =?utf-8?B?bmZYVDZvS3kzWm9UeGozQjRUbkZCOWkwSkhYRTFrL3Jlamp0QkRhV0phVVN5?=
 =?utf-8?B?bFpqVHVUaG13MldxL2w4YjVhYVVWSGtVOGxJYy9sc041b0tWTGd5eFVXRzZC?=
 =?utf-8?B?S0I0R2FtNWM2MDFOMXd4a0o4ZjBtd0xvWmk1aHZHZkUybUJCYUtTWHlwL1ZY?=
 =?utf-8?B?TUFnS3RrN3ZLazZ5QjdPNmJuSmNwL0IrYVRTT3dKemZnUnYyYkJyRDJ0S1JM?=
 =?utf-8?B?c0pCZElFclNyd24yZzRkZzFXSzJ5ZjRSeFFRUjF4VVpJQnBKYkVFMHZuYStl?=
 =?utf-8?B?TDA3a3ZVVVUrYUVsZzI0OVRBRlQzWXY1bjRTSFpGR05PYnh5UzBDRGppTFRS?=
 =?utf-8?B?ZFkzZnZxaldQa3g1TW0zbzZOU3orbGVzemlYMTdvNHE3eGRBdHZZYjRoNWJH?=
 =?utf-8?B?RHE2cGw2ZEt2dzF6Z0JLbVZ6eEJZRmUwUVRUWGpyRDF1N3BGNFFJWkI5cWxP?=
 =?utf-8?B?QllUMUNFWWZPeUNZT21kUHBDcHY5djI1Tzd5a3BzVFFWYi9BMjAzTlcySEVp?=
 =?utf-8?B?b1l5V0xOR05OVWVxc3NrU2tOeXRTcm1aNGFtZjZlUFd4eDRoN2lIQ2xQaXhH?=
 =?utf-8?B?bHlQUkdEZXJlYzdjNEZPSEF2WHpTUjBHV1doWFVhZlVkbkQzTERRYzVqRkpU?=
 =?utf-8?B?ZnpOZlF1cGFDQUVvQ0xXTnQyakUzakdDTTU3SysxcFJ2eTVmTFdwbysreUgv?=
 =?utf-8?B?N0lYTzVyQWhGSWhUOHlPNzFZek1xdUJ4K25lWDdkbHlYU0tBWE10U2dFRjNj?=
 =?utf-8?B?V1NNY2g5RTZnMnd1b0JVMXhSREhYVy85UHNrQmc1V281cGlQb3NvUVREOXZh?=
 =?utf-8?B?MytxaXpoMURlMlBTbEY5V2tCc1hNb1A3RmUvM1pGZXdqMXZHQnRUckkrTTln?=
 =?utf-8?B?anorUklDeG9Gc203cW9nSWZqaFlBWG5abDIxbkZEblVkdXEvcW4yVlgrcWo0?=
 =?utf-8?B?c0xHQ3ppTmlQdUZPME43d2xjeTFqVDVQUWFFeWZSLytuTXVjWmZqNjhYcC9M?=
 =?utf-8?B?K0QxQ2dmTDZpMVV5dVE3a3ROU1Rvd0NlMkRPTlFTVXQ3QmVHQTZXT1Jxbksz?=
 =?utf-8?B?bVR6Q0txNmhXYjJiYmY4UHhiWU9vV2wxVXlYMVVlTG9hYWUySHJwbzVFUFhD?=
 =?utf-8?B?V29ReHQ3U2VoUVVxbEVwdEVFSFd5QmROVHhYRnFiZU5jWE8xUUt2blJqWm9t?=
 =?utf-8?B?ZUNMZ1o0dGVROFFVSjJmc05xNGo5eG1ORTVYMW5aeUFqZ2ErWDZmQ3l3OVlk?=
 =?utf-8?B?RFJnbDVzZitRYnlFcThsRVVhdHNXeWhhTFZ0VWw0Z1dmM1RpTTBOcVZmUjNj?=
 =?utf-8?B?WkNvNGIwY21nRFpzWHEvc0QrNkpwRkU3Z2M0dWw4S0phUlRkcnJVMGpTMEwx?=
 =?utf-8?B?NWJCNm9icU1PeVA2WkhteEcxMWZwMnpTTWJDVVJCOC9CNVhqOFlNY1d2QVlV?=
 =?utf-8?B?MkN4YWp6YVZMNGJ0Z2JuNFZDWXFJT3Z1WUhxUHhhQ3llQ2FiNzZ0RmxWSzF6?=
 =?utf-8?B?eUN0MC9qUUJFbmlLUWFFZEVRcE5OWmJqQ2JXR3ZGVExsUUJPdll0aTdqM0xL?=
 =?utf-8?B?TFZ1QnRTRDZFVzdSQ3FyMVR4VEpLVS83aTBFMGNJa1gwY2VDbHFSMkFmTjVJ?=
 =?utf-8?B?THUyUnI4T0hQQWkwQmlseVJwblpiNGd6REVUazZmNndaVnJPa2lqeG10dkU0?=
 =?utf-8?B?bmNYUUI3MWdET2ZNazZ3aVpONFJwaDBwRXN3UHJGbDdFK0dFa3llcGEwcDQv?=
 =?utf-8?B?S2RmM2ZrbTRnU1hXL2sxYjA2RUpzTkhNejAzTEV4a2h6eDIvb1lJSUZOVkFN?=
 =?utf-8?B?b1FSWDVMclRaQ0ZuemNzTWZyK0tzbWsrVEF5R0JBRkFYanZwQy9Wa2I4M1Ft?=
 =?utf-8?B?WFJhM1RJTTErS1NmMDhWZ2tCaW80N2ZMNE9KWUtSbGtETlllQ3NtTkM1WkdW?=
 =?utf-8?B?Z280akhHQXFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlJQVjdCeGtmMHFKdWJKN04rVHBOSC92bkhiZUZTN2E1QVFmWFB1T24ybnQ4?=
 =?utf-8?B?UUNuSFlieGkvWHFUd0dmRjRjd1pHZWU1b1pnYU9uR1lkSjFiTFJadkwrVEJ0?=
 =?utf-8?B?dDIyQmxFalNVQjBrZW1Wcy9QdzM3NkxSdmJTUmVpOGpCcW9RT2d3U1k3UGM1?=
 =?utf-8?B?bzhIMEpxK0ExaTdCNnpTS1Y5L0hZZHhIMDJqczJTbG9pUlVVV0NZZ1FQM2JG?=
 =?utf-8?B?MUJqKy9ra09pOGRyVFhqVXNsRW1SbmZ1OTQrTURJa0k3WCtCcDArT3hYamRS?=
 =?utf-8?B?c1MyK1FldHYwclpZbUljU3lYWjQ1YUxRRE5Fd29IcXZaWklYTGVOM1ZyVStl?=
 =?utf-8?B?MlVxV0x5WjNlbnovYlRDcS8rbm02RmwxV0RhNGlISFpKdDJ3elRwSllrcDht?=
 =?utf-8?B?OGdvUExadVNETUdud3JjYzZEZTgrV0c2SUp2U3pHcFZLWW43aXdhSkRnOERh?=
 =?utf-8?B?SytsZ3VpZjNEZzdpcU9DOUN1Y1lub2VsamJsQjFxUEF5SEVjR0FtbmdYc3Vu?=
 =?utf-8?B?SStZNzE1ZGRTeWpJWmdEaXdXTWRhclR4K1N5UDlLUW1WeDRnYkd6by9QTVBJ?=
 =?utf-8?B?SzhCcVBZTVEzVlk2WFBXdEdUeEZQbTh6eXpQWG5vREg5QnVlMmVmcWczRnJ1?=
 =?utf-8?B?R1FkV2pFU2M0Ky9WV3lrODRjay95SlY4L1RjSGlZZXRBOGFKNVlINGhmc1RF?=
 =?utf-8?B?Y29vWnk4YUNXZkxYSjhUdThRR2lYR3R4bHF6NmsvUGtMbjYwWTVzQmR3T0th?=
 =?utf-8?B?QVBLVVorVFhOaE8rRFF1a2M4bVVXNXhpcTZTSVE3VXhrd0ZaZ0MwanhPZkJ6?=
 =?utf-8?B?YkdvaWtJaExjcURDc1RYVHMxTXA5ZkZPbnc2Um1ER3hzMDdZRnM3bVp4ZEFN?=
 =?utf-8?B?ZWdWSUR4amFLZWdqWU5lbkw4ZEJzWTRNSWNpVTYwMWlJMUpTTDJoelNWckJu?=
 =?utf-8?B?eUROTjNmaVpDUGM4Q1dadmRjS3kvL0QrMG5WSDQwZDVmMVBBWFRsVTJVZllH?=
 =?utf-8?B?c2dzenYxUDE0K1NFaXJ2b3dSM2dlOFExOFUrUGwxSzZQdXBsMjNHYnprNk5s?=
 =?utf-8?B?aERYYXZLZ1ZZdUNheitoaFZxM0RtZG83aXg0dmYxUGVHS29jWjNqNTgweXVK?=
 =?utf-8?B?SHQveVhpUEoySGxKRzhDUmNnM0xuOWdqSDBJV1Y4NlZSVEs0THJmSTRpZUNi?=
 =?utf-8?B?TU1sYmdualFZRHVQQW5pTU45VXlCZTY5ZDZ4SHFaTHpGZjJxMHRjc1RFSzdp?=
 =?utf-8?B?VEdqS1RUTXpHRzRTczc1YzIrSmpwdkRxZ01yQmxEWFRPendrZ3o2WmRIVEdR?=
 =?utf-8?B?TDFQQ3liSm03ODIyZ2RDbSszY09QVjFaMWZBaThORWVOZDhBVHBleGl0QU5s?=
 =?utf-8?B?TXRlbUxNRTlWSHdqTm1JYkdlRmlxczVQZHJTZnBicWdFTkpqWjh4T1RhTkNX?=
 =?utf-8?B?bDZYTjc2UDJsaUhreThQc24xVmhsRnQ2bVZPeTlHeTh6eXF6ZlZMaXRMaDc2?=
 =?utf-8?B?a2dqZFZPUCtyZXp0ZEdJRkxYcWlvOXZUYlRmejNhZUdlR3pjUGE0Y0cvbXR2?=
 =?utf-8?B?WFZsWWVtemc0KzBKRTJsUXJTL2tKeEJzdXFKU2lOVXdPUnFJZkpKbDJMZ0E3?=
 =?utf-8?B?bVRBQUxYa0ZJK1NuSHdNSDRJZjVudFhPUE92NkZ1YjJVQ3VjUkJoeGJDVWVL?=
 =?utf-8?B?MksrRHFabWRub2NGcGpTUlhEcHVWV1ZXYWtTVk9MZ2tnQTQrV1MzVy84MHZj?=
 =?utf-8?B?QzVWYnpFRUpGdU5zQWkzdHREL1daeklYaDhIZTc5S2dsMEZKdUtqeHZUSHA0?=
 =?utf-8?B?UE1CWHlnVGg4MXVHTHdZajNLeU5sSWUrR1BRNE9sTGxTVDFXRzQveDRLY3lx?=
 =?utf-8?B?RUJpWHFKSUhialVMQmY5Nks1a0h3dHI1QmF3Zno5WE4yTGtVNjVGVkdEcitu?=
 =?utf-8?B?VXppNXN2OXN6UWJuVEg4aXlNajM1R1h5ellzYyswdVRmdWVJREtMbm05b2RT?=
 =?utf-8?B?UlM3dGs5S3kzRk1ldDNub01Kb09hMUx0b2NaRDUrMHZ6cG4wLzNpTW9GZlhB?=
 =?utf-8?B?K1pheUdlbDJCZDMvRjhJUVdXUDJOMVdyVkhzSW9QeHZVcDZML2lWUnZNWkto?=
 =?utf-8?Q?Jl30=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4309F9D59A4D6A4ABC87986D07FADB31@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7582701-d58c-48b6-4d11-08ddb487e7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 08:03:15.9630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uT0FqQjp9j4YHgog9BCMKlle85gwZkmXSTG4hoBL+1Zkg+tijZCzu/9vITpUXN//pDvKjKmJOHne46hxzSS6Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993

T24gMjAyNS82LzI1IDIyOjA3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMDYuMjAyNSAx
MjoxNiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI1IDE4OjAzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBBbHNvLCBhcyBzYWlkIC0geW91IHdpbGwgbmVlZCB0byBjaGVjayB3
aGV0aGVyIG90aGVyIGFyY2hpdGVjdHVyZXMgYXJlDQo+Pj4gZGlmZmVyZW50IGZyb20geDg2LTY0
IGluIHRoaXMgcmVnYXJkLiBXZSBiZXR0ZXIgd291bGRuJ3QgbGVhdmUgYSB0cmFwIGhlcmUsDQo+
Pj4gZm9yIHRoZW0gdG8gZmFsbCBpbnRvIHdoZW4gdGhleSBlbmFibGUgdlBDSSBzdXBwb3J0LiBJ
LmUuIG15IHJlY29tbWVuZGF0aW9uDQo+Pj4gd291bGQgYmUgdGhhdCBpZiBpbiBkb3VidCwgd2Ug
cHV0IHRoZSBfX2FsaWduZWQoKSB0aGVyZSB1bmNvbmRpdGlvbmFsbHkuDQo+PiBUaGF0J3MgZGlm
ZmljdWx0IGZvciBtZSB0byBjaGVjayBvbiBhbGwgZGlmZmVyZW50IHBsYXRmb3JtcyBzaW5jZSBJ
IGRvbid0IGhhdmUgdGhlbSBhbGwuDQo+IA0KPiBZb3UgZG9uJ3QgbmVlZCB0byBoYXZlIHRoZW0u
IFlvdSdkIG5lZWQgdG8gY2FyZWZ1bGx5IGdvIHRocm91Z2ggdGhlIHJlc3BlY3RpdmUNCj4gc2Vj
dGlvbihzKSBvZiB0aGVpciBwc0FCSS1zLg0KPiANCj4+IFNvIHlvdSBtZWFuIEkgc2hvdWxkIHJl
bW92ZSAiI2lmZGVmIENPTkZJR19YODYiPyBKdXN0IGxldCBfX2FsaWduZWQoMTYpIGZvciBhbGwg
cGxhdGZvcm1zPw0KPiANCj4gWWVzLiBBbmQsIGFzIGFsc28gc2FpZCwgd2l0aCBhIHN1aXRhYmxl
IGNvbW1lbnQgcGxlYXNlLg0KQWgsIG15IGNvbW1lbnQgZGVmaW5pdGVseSBuZWVkcyB5b3VyIGNo
YW5nZSBzdWdnZXN0aW9uLg0KSSB3cm90ZSBhIGRyYWZ0IGFzIGJlbG93Og0KDQovKg0KICogU2l6
ZSBvZiB2cGNpX2NhcGFiaWxpdHkgaXMgbGFnZXIgdGhhbiA4IGJ5dGVzLiBXaGVuIGl0IGlzIHVz
ZWQgYXMgdGhlIGVudHJ5DQogKiBvZiBfX3N0YXJ0X3ZwY2lfYXJyYXkgaW4gc2VjdGlvbiwgaXQg
aXMgMTYtYnl0ZSBhbGlnbmVkIGJ5IGFzc2VtYmxlciwgdGhhdA0KICogY2F1c2VzIHRoZSBhcnJh
eSBsZW5ndGggKF9fZW5kX3ZwY2lfYXJyYXkgLSBfX3N0YXJ0X3ZwY2lfYXJyYXkpIHdyb25nLCBz
bw0KICogZm9yY2UgaXRzIGRlZmluaXRpb24gdG8gdXNlIDE2LWJ5dGUgYWxpZ25lZCBoZXJlLg0K
ICovDQpzdHJ1Y3QgdnBjaV9jYXBhYmlsaXR5IHsNCiAgICB1bnNpZ25lZCBpbnQgaWQ7DQogICAg
Ym9vbCBpc19leHQ7DQogICAgaW50ICgqIGluaXQpKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2
KTsNCiAgICBpbnQgKCogY2xlYW51cCkoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KfSBf
X2F0dHJpYnV0ZV9fKChhbGlnbmVkKDE2KSkpOw0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

