Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1497790A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 08:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797981.1208104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0GR-00013U-7t; Fri, 13 Sep 2024 06:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797981.1208104; Fri, 13 Sep 2024 06:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0GR-00011o-4J; Fri, 13 Sep 2024 06:58:43 +0000
Received: by outflank-mailman (input) for mailman id 797981;
 Fri, 13 Sep 2024 06:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5q=QL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sp0GP-00011i-Hu
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 06:58:41 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2416::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a07bb95-719d-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 08:58:39 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by DM6PR12MB4059.namprd12.prod.outlook.com (2603:10b6:5:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 06:58:34 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%3]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 06:58:34 +0000
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
X-Inumbo-ID: 9a07bb95-719d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJbL0fY8R+I5HA/ByF4d9WqF/tGBp2K2LH0LD84gaCJ873U4v3Agh4YikkwdaM1C4Gs7alXbGCpHL2vYyEaPMCA/8AJEYgwdAI+9wz6swZXvuG4AX7vfDRu/6f034ByqGUXG1L9hoC9wmkVGDrf9IcTYqoJIAGIUBB3rWxiBrIMtm4z2GXpEtgmPN6ohMCr6pSUbEPMYaJhyJgzufGShwNbopV+Aa2yspS6am+NnRGMJSNuY3Rke7Lj4cHemZaJ1CVcoMQowh+P3G6iurcRZ8Tci49NQkhnCfwlFQRuTaSna0DXm8W4Th2TLlgeW33qmjvpscalc8j493my/IX5uLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv8wuS2Hr2HD0+oKG/L46eeg8Z7vuW+BQ9S8y/xfvlE=;
 b=lnPf9A+/bi7ZFRyxYsAI57umjBGBkJ249CHjrzfpuKKXCwC86sBLGhyWfdt7TLsrA02zDsUJctjd2bb23aJAMPxfT9nhv5G78CBur/rbyaQRTXau+bpCwaRfIY6+OqTeyHmr9qplaZu8JljvLP/pNoJytaIuNApl2hDRdKHoCreyCI7p0QOOXgms3Ia5kyftpJa0eAkSxgLlYMpJh3MzIKLMlEDk5qGBVn6MfDvlHIszxo8UQhkFbvYRX4LfXP+Ot59eHIyemzDr/PIBnaZw1LczcCxZ02edXj+v7iUOnzfvG4/rNkkvNXy3nbbozbCYQWS46hhxfiA7lxh3m+qxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv8wuS2Hr2HD0+oKG/L46eeg8Z7vuW+BQ9S8y/xfvlE=;
 b=H4r2fY/gIpeGB5MmrQ6KbQ4Pn3kCKuMpQN/P8aW/ZwBXqeEVNtYzNP6rEQRvbDlh4ASAI6goa4NOEtsj8REQTPZcCNLD/7K88gFIfLb/N+HuLmAAEDWSR9kh3y2uUaj+BsJi6KyiT+YhxP2x0uoHUrVMZsV6A7gYdSkLJzenBjQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
Thread-Topic: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
Thread-Index: AQHbBBiuopssrGEkhk6CaPzsYxSpJrJT9mIAgAAE1QCAAY3jgP//wbuAgACGsoA=
Date: Fri, 13 Sep 2024 06:58:34 +0000
Message-ID:
 <PH7PR12MB5854F84365D426D41AF5FBA1E7652@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-3-Jiqian.Chen@amd.com>
 <971eba46-79e0-411f-8ae5-6b1f986f2ed0@apertussolutions.com>
 <5a3b43eb-6c98-42bf-8331-1112de9d888d@suse.com>
 <BL1PR12MB5849AB4428D6278BCD24C610E7652@BL1PR12MB5849.namprd12.prod.outlook.com>
 <e9394226-4e21-4789-b685-8e0d9db61ad3@suse.com>
In-Reply-To: <e9394226-4e21-4789-b685-8e0d9db61ad3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.7962.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|DM6PR12MB4059:EE_
x-ms-office365-filtering-correlation-id: 85cb25c0-5079-4e04-58ed-08dcd3c17c3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UlBuVWkrTUJGNnF1NGxWaDRvM0w3ODROVkdWVnBpT2t5SDZLaFkxVk16bDVC?=
 =?utf-8?B?NlVGT3FOQ2gzcHQ0c05BOFpFMWxFYnVBZzdTNUk3SUx0czVSZnB3QWJqTVBh?=
 =?utf-8?B?NnNDdHNaUGN5eGp1TXVUeGt0Wms3cXlwR2FpNU5pY2xQY2FKbVhJK3BpZ2E2?=
 =?utf-8?B?WlV6ZGl2K1pYelFEMXhHdVJQQ2l2UHppc21pY1RKZU00dHpWWnp3ZFJOQmJU?=
 =?utf-8?B?RDNDc2lrS3hzVTB0K1hSSkkxdXlGMElCamU5YkdDTXh3OENVQm9TNHArcEM0?=
 =?utf-8?B?WGwrcUlSd2hDU3E4OHBHUS9zajNBdzAwQlhYeWR2SUo2ZmI2ZDNIbUVFLzRY?=
 =?utf-8?B?SGplNjBVU2t4N1d2MEZmSXlWWWFrbEUvcnFxbXVVcHlUREhCOW5xTFBsVEpw?=
 =?utf-8?B?cnZzb3grc2FHNXdCMm5pTFk5NHVOSkJpMTU3Sk5KRHpLdmN1d28wN0plUWNi?=
 =?utf-8?B?bFNNWmwrMFBhdmNxTkRLMGNzNjZueGllbFo2QVQ2V3BqOGhTbXBkQWhORzE5?=
 =?utf-8?B?VWVSRlNXNEtDbi8vU1VmUi9NZHBHK1pWUllEUDFwa0lBbWFRNFVsdjR4c1NN?=
 =?utf-8?B?bXYwZnhDZTB6ZmNTdFVlY3FGaW9XemoxQTFKSkNTbjlIandmK2Z6OEJZWDBG?=
 =?utf-8?B?QkdObTZTc2pJOVBndisvaXZzM1N2cGowdDVWMlFTVkhscUlRZ0Y5cmduMVpE?=
 =?utf-8?B?UkQ3Skh4cUZ5WEVYbFRRTFlIUjVvcEx5TTRTQjI1Zkt4eUR5M2dnZzRhcGFj?=
 =?utf-8?B?eW80UmxtbjNWRnFiNkJYTjMycndkTUJMajNXWmtXL0lHVC9vdDhObW5HR3pl?=
 =?utf-8?B?bGZpZy9NMDlnSjNJTm1lS2U4Vnd2SEplZy9Ub1BUajBPTUQxZnd2YTYvWHNj?=
 =?utf-8?B?dE8zcmszbWpGREI4UXlQQjZ0NjNva2ZmTTFEN2dBVHB1UUxjZHQ3c1hNVjBW?=
 =?utf-8?B?TkM4VGY1bkQySU1JeWxXOEovR0JDU1NHMmY0SkhSMUxyK3NOUzhDWUg3Sm9K?=
 =?utf-8?B?Mjh1a0Y1QTBLSE04eE1YR3crMkVPUWh6WHV3UXpicmd5a2xTSnBUVjF3bjgz?=
 =?utf-8?B?Ti9jYVFkMklKMlJMd0tsR0YrTy96U05SZENzejlOc1Z6NUtZOHZIenJDRU90?=
 =?utf-8?B?cXQ4T0VtcVhqc1c3ZzZVWnk1aGVoMnN2UVI1L2s2QXBXR1ZnaUx5WC9Mc09m?=
 =?utf-8?B?VmtlK0FJL2VRWjk4b3JhN2ZNajE5VW5IVlRmVDNiWnZwNHlSd3pUOXF0R2NO?=
 =?utf-8?B?TDVINGd5QWhURitzbFNQRmhqNTdDZlQ2SGVSekVnTU9XRkkzZzhCODFiRjRu?=
 =?utf-8?B?ZGZ0YjUreldNbDdrWUtGbUptYmNYNEZjYTZQeEJJNXNoNVBYQ1RTZEMvaWxo?=
 =?utf-8?B?dS9ZQXQzdW5QSGozUmpkaVM3RE00empxOElJalFSZUNoV0lFSjlVL0VWZ2FV?=
 =?utf-8?B?Nyt3dFIvVXVsbGpYS3lCVkN3K0R6Q3R3MktTN3Z3Z05xdmVWSENZRlViZ1h3?=
 =?utf-8?B?N2dnS1VHUEhFOG5ZVERsQTFCd09DTlRyVzFNTGY4Z3BqcVAyUWlpbVRaeDE1?=
 =?utf-8?B?dnhDdTNWaytsWjBVSFRiY3dWUnhGRVFvR1U2bXk1SHFLR2pRSXZXK0g5cC90?=
 =?utf-8?B?SWU5OVpHczljdUNqZWZRbk1NUi82Q0N1SzJrUGFSN3NUeHZWbkpLZHJZN2tu?=
 =?utf-8?B?dkM3VkZvYWhBMEtSUVNYbXFybTJjQzQyWFpUdTZnOFlMdUVCRTBjS0QyT0d5?=
 =?utf-8?B?cFh1eC9WcHdMM2trcW5La1dIZWFGc3hPKzkrazZBU2xJOUMydXlmSGQ4Tllh?=
 =?utf-8?B?SzRqamlNdGlPS1lpMk0vWVcwK0QrRlJ3Ync5OHo1amU2V2pPSi9POXJEREp5?=
 =?utf-8?B?bEJlaVZQODU4WmpRZGt1OGdTdm9GUE9pWkRNNHJNckRSeUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2s0SnlNZzZCZHdqQVlPbXhvd0FCaFJXWEg1cXk4VlJzaVlPLzR0OWYrRElj?=
 =?utf-8?B?SFlSOC85aXRqWnJmRkw5SXJ6UnNYZFVlNG1LVk5TUjd5eEZNc1JsV0MwY3Z4?=
 =?utf-8?B?ZXZvQ2daYzNEL1BaWm9GQVh4dkc5RS9uUkRSZ2RVdnk5YUxJa2VJTVdnb2lF?=
 =?utf-8?B?N3hLMVpIZldjbVJ5a01XQnY2OEZ0QWNVZUpKaERUMitIZm1WQ3VvSSszUi9j?=
 =?utf-8?B?K2tYdVBFZVQrYzdsYXIzbldGb3Y0MTFIZjBjTHg0azdZWVNyUzAzZ0orOVNU?=
 =?utf-8?B?VUVPdGlkeVR3bWVIYXR4UndvUEZSL2hUUVNGZldWU0EwUVFLQnZFbkJIUzNl?=
 =?utf-8?B?ZXFhdXRtNkc5Ny8rZGhUN0dUa1IyZW1BMms4UHo1ZkhiazJ6RlFzY2g2cGRh?=
 =?utf-8?B?NTh6UVM0OXd2VEpIVkRKZkhZM3daMEhSYk5vS2Nsd05QdkdPNDBweS95STdM?=
 =?utf-8?B?aFh0eENDSWxEWUlPQWxvSVlpY2E4QUszV0JxbnUvbTdIU21IUmpSUCt5TnBi?=
 =?utf-8?B?WjJpNmZlLzVCa3dVbGJnZHExR01uVVNGcFdyb3NCU01IeHdPN05sc05RNmJj?=
 =?utf-8?B?cjk5TGhRT0dIcEZNTktkcVJNaE5xQ3dxclB2alVCN2ZzNjlvN2wrYUt1dVhz?=
 =?utf-8?B?Y0Ztc3c5Q1ZDQVRlRUNmMmQ0RG11aWtpQXFNTDMxQTRMNGxKako4RitmYTZo?=
 =?utf-8?B?d3BhcitySkt3bzhSRFJmb2tYbU0zTEpKRGgvRlJLWlZZVEpnSTNQL3RFdHJm?=
 =?utf-8?B?bG1lU2lpazBDbzZzSlVNL0k0UGYwSDdDc29TM1hlek02MWlaZ2h1NnhsVU5C?=
 =?utf-8?B?dDA3MDdmSGlGWU14NjF1UUFCVUJ2U3ZUMWxEWGpOKyt4aVptdVdndEtLdllz?=
 =?utf-8?B?ellsZnZXUmwzbktSZXNtVmdIakhOTzVWRWRSWkR6UUhmdTFHZCtpMHNMZHFx?=
 =?utf-8?B?dUhzVk1LYm9tYXpLMXpSZ0hDeVdOQXFSTUZnei83V2xld29qYWxlNnNiREI4?=
 =?utf-8?B?WjFGQWQ0bjhqdUJLcjdRa0hPU0JrR0JETGJHdnlnWXdYcDE1WVROT0FleGlE?=
 =?utf-8?B?czVaaHVuaGl2bEJ4cEJaSVgyNW1oVDgyZXJ2bGZibUVUZGhyck1iTlptQ0Ir?=
 =?utf-8?B?b0xiSHI3Q05XaWp5NmFmNTVDZnBiaVRFaEt0RlZVZG1qaWl2ZVJHSWFOR250?=
 =?utf-8?B?UEp4c2p4N0JreStvRGFaK3l5QW1BQy9kbDU3Q1ZlZnVjYVA1S1kxUml5Ymdq?=
 =?utf-8?B?UjBsbEEwTC9CVGRoRXZnOFJKVUNCR1EyU2MzK2toQmxnbEt4cHBKaUpkY0Rp?=
 =?utf-8?B?bmpKaXVVbWpCbjlZc0s4Z1kzcE1kR3MvYUlpUFV3VGpZV2tGMlRZTGcvU3RN?=
 =?utf-8?B?ZFdGN0FrTVNyNXJEd21saURyK0N1SXNYazBXdkxpbko5bW9reWtWNnhNcGJZ?=
 =?utf-8?B?U0NiN04rS0ZPU3hPLy9PLzVGRnNHSmhVeDVoWlJlcUlqNGkySHdoZ0xldHRB?=
 =?utf-8?B?UEFRSmtyVU1OdzFyR09EczNxMlNFbGFRNFIxOC91QkI3U3FqNUFxTHl6cGVz?=
 =?utf-8?B?MjNiRlRvSHZNU0lhSGRINXB2bWJ1aUZyQ1RWM1B6aGhRakV3R29tSFpUSSt5?=
 =?utf-8?B?OUs0K1FHVGdHbGN2QzlCQWVva3lTRERnVEw4eDlZcC9vaFhxdWdyMUFKT1Zr?=
 =?utf-8?B?cmM0V2FjS0thSFEvRjVuN3pxTXdwaStmdkNZNHlQcnpPcWx3WEswZkQ1ZzNn?=
 =?utf-8?B?NnpvQ1N0aHdZSGd6WisyYVJqb3pRS1VjSCtNVHBhN3phL0M4NFRRWmV6bk1Z?=
 =?utf-8?B?dlh4am1WRWlLYVhwc3BOK1F0TEtjNHVYendBMmJDRUJtUGtWd2dxSTdrT0hu?=
 =?utf-8?B?ZWxkcFJJMXlMZm16YmIzMlNoVnlyUnMzUkJuQ2M2YVFrTHpDRzRVcDBGRnIv?=
 =?utf-8?B?UkpJb1JHZGR5V1p6NTk4YlBrWFNTNjZMNXNZck1BcW9taElmMVVJV3BlUlNY?=
 =?utf-8?B?UTdIUnFZa0Y0ekFBcitXS2FVd0Z5M0NjdXJiRHh5NVZiZ3VLKzFzNUF6YThl?=
 =?utf-8?B?QWc5cXN6ZnowK1l1NUhGQVJ0Wm9vcmlRNklkQWl2NXJRb00vZDM1SEN3R0Vp?=
 =?utf-8?Q?X/Tg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37C28142FF7B1242834ACC18FB472AFD@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cb25c0-5079-4e04-58ed-08dcd3c17c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 06:58:34.6304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmip+r4awHqFecvqVY/39gTXy7NXOMeER3lsYIm0EeaQgAIWm5VeLlUxjYYtpifkYEAputF0bwlCnkdMLCcJDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4059

T24gMjAyNC85LzEzIDE0OjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMDkuMjAyNCAw
NDozOCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC85LzEyIDE4OjUxLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wOS4yMDI0IDEyOjM0LCBEYW5pZWwgUC4gU21pdGggd3Jv
dGU6DQo+Pj4+IE9uIDkvMTEvMjQgMDI6NTgsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4gQEAg
LTIzNyw2ICsyMzgsMzQgQEAgbG9uZyBhcmNoX2RvX2RvbWN0bCgNCj4+Pj4+ICAgICAgICAgICBi
cmVhazsNCj4+Pj4+ICAgICAgIH0NCj4+Pj4+ICAgDQo+Pj4+PiArICAgIGNhc2UgWEVOX0RPTUNU
TF9nc2lfcGVybWlzc2lvbjoNCj4+Pj4+ICsgICAgew0KPj4+Pj4gKyAgICAgICAgaW50IGlycTsN
Cj4+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBnc2kgPSBkb21jdGwtPnUuZ3NpX3Blcm1pc3Np
b24uZ3NpOw0KPj4+Pj4gKyAgICAgICAgdWludDMyX3QgZmxhZ3MgPSBkb21jdGwtPnUuZ3NpX3Bl
cm1pc3Npb24uZmxhZ3M7DQo+Pj4+PiArDQo+Pj4+PiArICAgICAgICAvKiBDaGVjayBvbmx5IHZh
bGlkIGJpdHMgYXJlIHNldCAqLw0KPj4+Pj4gKyAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4+Pj4+
ICsgICAgICAgIGlmICggZmxhZ3MgJiB+WEVOX0RPTUNUTF9HU0lfQUNUSU9OX01BU0sgKQ0KPj4+
Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAgICAgcmV0ID0gaXJx
ID0gZ3NpXzJfaXJxKGdzaSk7DQo+Pj4+DQo+Pj4+IEkgd2FzIHJlY2VudGx5IGluZm9ybWVkIHRo
YXQgYSA9IGIgPSBjOyBmb3JtIGlzIG5vdCBNSVNSQSBjb21wbGlhbnQuIA0KPj4+PiBTaW5jZSB5
b3UganVzdCBvdmVyd3JpdGUgcmV0IGFmdGVyIHRoZSBjaGVjaywgd2h5IG5vdCBkcm9wIHRoZSAN
Cj4+Pj4gYXNzaWdubWVudCB0byByZXQgYW5kIG1hZSB0aGUgbmV4dCBjaGVjayBhZ2FpbnN0IGly
cSBpbnN0ZWFkLg0KPj4+DQo+Pj4gVGhlIE1pc3JhIGNvbmNlcm4gaXMgdmFsaWQsIHlldCB0aGUg
c3VnZ2VzdGlvbiBkb2Vzbid0IGxvb2sgdG8gYmUgcXVpdGUNCj4+PiBtYXRjaGluZyB3aGF0IGlz
IG5lZWRlZC4gQWZ0ZXIgYWxsIGlmIHdlIHRha2UgLi4uDQo+Pj4NCj4+Pj4+ICsgICAgICAgIGlm
ICggcmV0IDw9IDAgKQ0KPj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+DQo+Pj4gLi4uIHRo
ZSAiYnJlYWsiIHBhdGgsICJyZXQiIG5lZWRzIHRvIGJlIHNldC4gUGx1cyB0aGVyZSdzIHRoZSBw
cm9ibGVtIG9mDQo+Pj4gInJldCIgYmVpbmcgemVybyB3aGVuIGV4aXRpbmcgdGhlIGZ1bmN0aW9u
IGluZGljYXRlcyBzdWNjZXNzLCB5ZXQgdGhpcw0KPj4+IGlzIGFuIGVycm9yIHBhdGggKHJlcXVp
cmluZyByZXQgPCAwKS4gU28gb3ZlcmFsbCBwZXJoYXBzDQo+Pj4NCj4+PiAgICAgICAgICBpcnEg
PSBnc2lfMl9pcnEoZ3NpKTsNCj4+PiAgICAgICAgICBpZiAoIGlycSA8PSAwICkNCj4+PiAgICAg
ICAgICB7DQo+Pj4gICAgICAgICAgICAgIHJldCA9IGlycSA/OiAtRUFDQ0VTOw0KPj4+ICAgICAg
ICAgICAgICBicmVhazsNCj4+PiAgICAgICAgICB9DQo+Pj4NCj4+PiA/DQo+Pg0KPj4gWWVzLCBy
ZXQgbmVlZHMgdG8gYmUgc2V0LiBBbmQgc2luY2UgZ3NpXzJfaXJxIGRvZXNuJ3QgcmV0dXJuIDAo
aWYgaXJxIGlzIDAsIGdzaV8yX2lycSByZXR1cm5zIC1FSU5WQUwpLg0KPj4gTWF5YmUgYmVsb3cg
aXMgZW5vdWdoPw0KPj4gICAgICAgICBpcnEgPSBnc2lfMl9pcnEoZ3NpKTsNCj4+ICAgICAgICAg
aWYgKCBpcnEgPCAwICkNCj4+ICAgICAgICAgew0KPj4gICAgICAgICAgICAgcmV0ID0gaXJxOw0K
Pj4gICAgICAgICAgICAgYnJlYWs7DQo+PiAgICAgICAgIH0NCj4gDQo+IE15IHByb3Bvc2FsIHdh
cyB0byBjb3ZlciB0aGF0IGVsc2V3aGVyZSB3ZSBleGNsdWRlIElSUTAsIGFuZCBoZW5jZQ0KPiBp
dCB3b3VsZCBiZSBnb29kIHRvIGJlIGNvbnNpc3RlbnQgaGVyZS4NCkdvdCBpdCwgSSB3aWxsIHVz
ZSB5b3VyIHByb3Bvc2FsIGluIG5leHQgdmVyc2lvbi4gVGhhbmtzLg0KDQo+IA0KPiBKYW4NCg0K
LS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

