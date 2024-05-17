Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC78C855A
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 13:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724046.1129246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vXP-0001Tz-IF; Fri, 17 May 2024 11:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724046.1129246; Fri, 17 May 2024 11:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vXP-0001Qk-EM; Fri, 17 May 2024 11:14:11 +0000
Received: by outflank-mailman (input) for mailman id 724046;
 Fri, 17 May 2024 11:14:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7vXN-0001Qe-GY
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 11:14:09 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 936b5fcb-143e-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 13:14:06 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB7847.namprd12.prod.outlook.com (2603:10b6:a03:4d2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Fri, 17 May
 2024 11:14:00 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 11:14:00 +0000
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
X-Inumbo-ID: 936b5fcb-143e-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0jzGPCcEh6xapv2SNOpkO3vzirhlYomzovMcsj/0OoTHGP9rU5hcF2vO8ApLxWTLJlaLsoj/9BGQue5x6IeR4O53zVdhhWjX7XOMG+KjmLID/JljgFSEvcn9p9NYkwFURXih6on9fLD6aZ5X8fm6Zw/9+BWWJqDm+/ckxKZGQ0fZjMT9JUO8a+Pu5+sp87s/wMZF0qrXf1dO5yF7kRQKlMit1XcUFFHPajdEoBkOgY2kvsbxTylRINitTQM7eU8AFFZl2gLIeGa7+rugl6zUu5DYIz/xRvyhuGs1uXrrjQKsmw1loZ6s3/TKwUVZp+de2jpPRnJmfmDXPvw15dCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQs12np3lOboD0HaA3Llz13Ng4nYVMZwoFGR1yxNgWg=;
 b=ir8PBJo8ars1YdblgPf1N1NyZiU9lKbjDbbMkGBOKk0DAPkM3j5Op4oO9V0jfURH7GyWrkr6+2m862BQnuCdVed6DfRcG954QX2sPtQ1w9maBBOMlY1y4jPydRs/njNwbAkPBHbiyG9oCtiONBZHVNQzWkTUkp0sAIgACZoM19wnYYEmMk/AvNRdFwLpPY3Pmp2mQ+ljmdhbiodbn4J/Le3aaWUrFeJ/sJx9DXE3Rgyl5k+lm8CXy0EDnIpMsR0xq34fqNvE9YRCukz7LVSz2MBZf5z/8cOhn7am9IB5+KeQgeQLMrvXJcfoV7VfQ9giyytlF8Rm8DE/ZBCGO9IJFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQs12np3lOboD0HaA3Llz13Ng4nYVMZwoFGR1yxNgWg=;
 b=33h7mZ6smtdCA0RWHrJcjCxRa9vezbCBkjz40ZoEpu6nofy9OcMiJ2S1VFxHv0ilm6GSX9TzzO8Ct45xLML6dAGYeFccmrQemEXsaCIi1g/g6mH0ANxS6ToqMrV9WrqomLj1qvHpgUR1BcGOCzmEtg2ZQtYb9/zincUJ6iOtt4w=
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
Thread-Index: AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A
Date: Fri, 17 May 2024 11:14:00 +0000
Message-ID:
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
In-Reply-To: <b10e68e2-3279-471d-a089-c40934050737@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB7847:EE_
x-ms-office365-filtering-correlation-id: b5dd9f43-c8a3-4ec0-ea86-08dc766273da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y2w5Kyt2RlZwdDJhS2V1VkwxVDA4TlVkRGpESHZJT0dJRVhoVWRQZHBWY3Bw?=
 =?utf-8?B?TDIwMXl4ZDd4NWFDZ1gvUUs5dkYxV3BaU0RHR0NEaWFpVzNxYytmVHozSER5?=
 =?utf-8?B?NTF4YVBNT08vdGFUUzEwWWFnTmh4SStCaVJxcXhiK1RNYUkwQTU4Y1NBWEVI?=
 =?utf-8?B?UkVqU3pZVE00OU1EV2lqbzI5NGhSM1V0dEdrdUt2dUxxc1hTcWVLTzlhRUJM?=
 =?utf-8?B?akVmWFU1NStkcjYxc1U1VjVSRWdxVUlCRUp1d2VjMXNHTDl4WUUzNS96cG11?=
 =?utf-8?B?OVVPazI3YmtVYk5NbVFXUkpWeUd5QVlCOFVGY3VLMTBmOTM0enlYU1lqWXJ2?=
 =?utf-8?B?amR4Y1piODJ1TC95R2dwTVJEZGY4UGZ4Vk52TU5MdG5QUFVqemdrMDh3aGk2?=
 =?utf-8?B?dGNaZWZoc0VxYStBRWgwcFZoRE40VEs0bDk5SVltT3BEOUQwUGdOZXZtOE5I?=
 =?utf-8?B?OWF4ZTgrMWJRSUF2VzdyRWdKcVhQYmtkWHV4aXNqVytic0psb0VIODNPTWxw?=
 =?utf-8?B?TXRFRWU5ZERQdFB6SVVFWi9xOGU5blE2eHVhb1JjOFlLcjViUjc1aC9oSUhz?=
 =?utf-8?B?Mmt3ekxJejhyNExiaS9PUHpkRlhnbUkyQ0dHQ1ZIUGRYbE9nQlVtRXA1eVo0?=
 =?utf-8?B?cVdyQ0dxZWxSRUtnQkk1QWZLSlBDUnlNN0pzQmRXekYvUXZBMVdldUlhZC9y?=
 =?utf-8?B?cEdYTnM2T3lBMVNpaVZsTVh2Ymc5RkF5SnBVSnJ4SG9CV2ZzeWhaNWFOWUhF?=
 =?utf-8?B?UjJwNVVmNUdRTmN3d2RSZmxYVGYwUk9iY29MZ0xKRklqcXV3a1h4TmJmbWxa?=
 =?utf-8?B?OTlCbllTaG1PcVFZdWt5eTU2QlhjNDBsdElhNnpza1hNMVZaRUZyUUh3Sit4?=
 =?utf-8?B?cEhZZzdMd3F6citGbHpCRXprZE5nYkNLeVNzdW1nVTBtOHNjYkhsaFBCbHJH?=
 =?utf-8?B?ZVU4Q2QrcUs2aFA4dkFDRjg3cXF3SzJLanYyNW1WVE9iRktKem4rcU1OUjVS?=
 =?utf-8?B?NUpOZmx0V214NDkzTm9WdjYvYTcwSlNNK1ZDTlZob3FrYTljMkhzZmdoOHdF?=
 =?utf-8?B?c0lsaHV3djd2MWlwUDVrYUIxZVdnUnRXNTY2cVZ6Mk5NVlR3SmdVUG5nRXo2?=
 =?utf-8?B?UGJHN3FLdWdtalpxM1NDNHRMTkR5V2NNbUFKNG8zejlFZDhkanVkZnErZ0F3?=
 =?utf-8?B?cXBBc1JJK0JZNlh3NElRQUltY3R0cXlmNGNsZmZTZ1lyZTF2UkEvSTVOSGw3?=
 =?utf-8?B?d3J5eUgrK1JVV1VCd0hMbnlHdmNHVTQwZHoyNmRpS2VwUTJJTWJiOXFrNjM0?=
 =?utf-8?B?Z1pUNy8wb0V1NVRqNlFUbWwyUlhsbGZCWTZzRHNoOWVKN3NjanUzcmZTSTVy?=
 =?utf-8?B?Q0xuWk5zaFhkdVNWaUMwdGZ4aWZNN3ZoSWY1WUNWSDdIbysyZzB4c0VMSC85?=
 =?utf-8?B?Zlp3SWJLSXJmeXk1blNQMUF3OGlWdTNlR3AyTkVreUJpVitTbWF4dzBlZ21M?=
 =?utf-8?B?OUhjK2pWS1FuRHJnMmZZNy8xQVZtNGVGcDBJVm5YRmwwZkxUVXV0QXN0Z0Yv?=
 =?utf-8?B?ZVlkWU9GNlhiWFNtM2dkWnpQVEtUNFp0T0JmK0J3L04vWnVUekwyczQwMWpL?=
 =?utf-8?B?MzF0azdLRVJaVGp3cDhySS9wK1IxM05DdWpRY3BYeFljdUlUL3dwOHR5aW5N?=
 =?utf-8?B?NzY3Z0ZyQVNNNGZpenhTVDliWkpybVJ2RHBtWFlHSTlmcU9ORUkwcExYQkdz?=
 =?utf-8?B?K2tTR2U5RDR5M2FsbDV0eG9LeGJiUytMTjF3ZE5JSFpwWEtJaFBPMm9Telk5?=
 =?utf-8?B?L0xQcVQ1dmxXdjBJSExSQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTJuVmUzaFpOeGRmOVh1S3RaYWpGRVV6Wkk5d0ZST0pDWlpMRnJjTW5WK256?=
 =?utf-8?B?KzVnaHoyUG1tSDFIemx0K2NqY0RDWGcra2hCekk4aUhHRlVoYUlXalV3TUNi?=
 =?utf-8?B?dVhyWTJnd3NucGdLdjNla01jUmN6SnQ2dGhMUyswNVRob3JSSDdvMFJYeTZ4?=
 =?utf-8?B?VjltZTNSeHhyMXdycFErOEtaN0x2bmk0WVhDbjFEMytiQkJGUkU0bzA3a3E3?=
 =?utf-8?B?dWNGQmU5bnBXbmVDMVpLQTk1TlArZDV6cXhtNDVTeEFFRmdUTkRwM0E0SFR2?=
 =?utf-8?B?K2xDTTRwZTB0VEszVWdBK0MzWUVncWdyanFZZTlxVlFpKzFCdkFhSEdDWU5a?=
 =?utf-8?B?Zi9DaG43ZG8wQU5HNGVxKzFJNkJ3a3IxZWorK214Zmo2V0tOS0hzRHFXZENI?=
 =?utf-8?B?S3UvMDNldklOTU1QcTdkYmdyL09PM1EzdWhMODVKR1F0QkJPN3ZQVG53eHlZ?=
 =?utf-8?B?bi83TE1HV0Ntb0NDcSs5MkFBWmNjRlRzdlNYL1lSaG04RHdkcHovMjhZRHZM?=
 =?utf-8?B?aFVvZkpyTzRaMU5hQWdPQlpxNERTbXJTM3ZzZG1wU25oWTJvenJOQ1pKY3Vy?=
 =?utf-8?B?Y2ZNWlZPdHJjU1k3MEVtSU4xNUp1S0ZNWVZDQzVpbkptN3U2Y00xYUY4TUNm?=
 =?utf-8?B?T0ZUdklKdHZSSTNXUk1RdENEbE9PR0kxbmsyaHJHcWdpVzAyZEluNy9qakx4?=
 =?utf-8?B?S25wNGVCNE5pR2dEeVlhWkpLcEtUZFpsL3B3aVVHL1gyYUI1Y2Q2ZEViT3My?=
 =?utf-8?B?bjJ3MjlXR2krSndnZ1NuME5EclJ0RlBUQUx2MkxESG9RTk9DcDFqMjdEQzBD?=
 =?utf-8?B?TjAzaWlZRU5UTzBoZ2E5LzBFSmlDY3dBenptMG1Sc25OdFB5b1UvVG4zaDhh?=
 =?utf-8?B?aGtMTVAwSTFhb0dhLzUyQy9WRFpXQm5KVE5jd0NqN3QwZVNucmFxRnlkV09X?=
 =?utf-8?B?L1M5MGRqN2RsV0VWb2trN21LbGJPQ1V0TkNkYm5UNldLSE1PZ2wweUVSN3FL?=
 =?utf-8?B?Q2g0TjdmNjFKTWhuNDdzb2dBZjAxaGFIY2xvSkhJRjZpbWhQcUhiME8zQW85?=
 =?utf-8?B?YVBTdmsyak5ZNHhxU1RvVXJpRk0xL3VEejRlbW1MeUI0UzNDM0F5dnVjclBC?=
 =?utf-8?B?QWhLVGxLbWh0MUhFZnl1NW5sVHB6U1FyNGpSQjk5L2x6TjkyTlg5OGhuVnNY?=
 =?utf-8?B?Z0JISHE0ZnljV0NjdEF0cmVySjhEdEpRUmpzSWE3MnJVWHh6L09VVE1zRDBO?=
 =?utf-8?B?TGtaQkxST0tiTnRsdFFyK2ZPdWlvQjlsazFLdDlocTBPMS8xcUVKWEF2d0l0?=
 =?utf-8?B?YTk1NUJpZyt6Q0NsN3ViL2Noa3o4dHVuVHA2MXpGa0VNV3gyZFBwcVUyMFNq?=
 =?utf-8?B?UVJxSkxUN0Rwc2Y1blBOSXRNUUhUbHhucFRXZUFSU2ROTlp5Slk0TFpaaGZn?=
 =?utf-8?B?enNkYlM3WnpTYUM2OTVLR3pmb1JmSkEwOFRQYUdFSW5aOXkveDB2eUN3N3ha?=
 =?utf-8?B?TzdqSHdvcHYrbWZLT2lxSURieGVwdWpwQjJaUkUya3h3Q0dUQlBIL0RVUkJn?=
 =?utf-8?B?WUlJVlo1YXQweTdBVnJqMzVwWERyUytOVWNoaVMzUHlHUlJoeGJBbSt5d1Zi?=
 =?utf-8?B?MFNXSnQ4bHlpOEU2QlZwWlRidXA0MWlNN2tVL3FHcm5HOGd4T05DcWVxUzhJ?=
 =?utf-8?B?Y0orK0wraEthM053cXJleG9pM282QitNbEZzRWxGVjlJc3d6YlVoM0IxSEov?=
 =?utf-8?B?UEpZdnlSOVNyNXNzNXRoUURPSUdRM2RIRTdjd3l6R1JaZGplOUpzSlZGdGZw?=
 =?utf-8?B?L3UvL1g2c01oMDFwK0g5RDZrekpqKzlrNVRWeHBJU2FETmQvaXhJZFE3ODBC?=
 =?utf-8?B?WWVnMFVaS2ZxVThVOWhMWUoydHBkUWpiMi83eEQyTUo4cFNJU3FERWRNSVNa?=
 =?utf-8?B?T1lTTWlFbGZSYlVZZlJkcHYrYU9WLzhWQzZ5cXI1cWw4YVo3TlhsK1luNmZh?=
 =?utf-8?B?OUdQUVhZUDRkYVN4dEJkVzJnMDl1Qk84SXFHVFhkdHdhMHBJR2dHN2FUQTYz?=
 =?utf-8?B?QkZ6UU56UXJOVFpIZ1lON1R0QStEaTVhcktrbXFETmw0RUVoN2lkV1lpSWR0?=
 =?utf-8?Q?kvFQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90A7216E25A1D5449BB29B33CA87ABA3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dd9f43-c8a3-4ec0-ea86-08dc766273da
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 11:14:00.1874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apk7hynPlDwbARtivwz2U4WLQFG2SKiXhiEzpKXPm4a1Uh5ZcycZVkUOAdUAiCO9/AhyJguxzmaKkEvdDLYRag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7847

T24gMjAyNC81LzE3IDE4OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDUuMjAyNCAx
Mjo0NSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzE2IDIyOjAxLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNi4wNS4yMDI0IDExOjUyLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gKyAgICAgICAgaWYgKCBnc2kgPj0gbnJfaXJxc19nc2kgKQ0KPj4+PiArICAgICAgICB7
DQo+Pj4+ICsgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KPj4+PiArICAgICAgICAgICAgYnJl
YWs7DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgICAgICBpZiAoICFpcnFfYWNj
ZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4sIGdzaSkgfHwNCj4+Pg0KPj4+IEkuZS4gYXNz
dW1pbmcgSVJRID09IEdTST8gSXMgdGhhdCBhIHZhbGlkIGFzc3VtcHRpb24gd2hlbiBhbnkgbnVt
YmVyIG9mDQo+Pj4gc291cmNlIG92ZXJyaWRlcyBtYXkgYmUgc3VyZmFjZWQgYnkgQUNQST8NCj4+
IEFsbCBpcnFzIHNtYWxsZXIgdGhhbiBucl9pcnFzX2dzaSBhcmUgZ3NpLCBhcmVuJ3QgdGhleT8N
Cj4gDQo+IFRoZXkgYXJlLCBidXQgdGhlcmUncyBub3QgbmVjZXNzYXJpbHkgYSAxOjEgbWFwcGlu
Zy4NCk9oLCBzbyBkbyBJIG5lZWQgdG8gYWRkIGEgbmV3IGdzaV9jYXBzIHRvIHN0b3JlIGdyYW50
ZWQgZ3NpPw0KQW5kIERvbTAgZGVmYXVsdHMgdG8gb3duIGFsbCBnc2lzIHBlcm1pc3Npb24/DQoN
Cj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

