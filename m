Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353BA91008D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744333.1151353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEHR-00009Z-Am; Thu, 20 Jun 2024 09:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744333.1151353; Thu, 20 Jun 2024 09:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEHR-00007v-7h; Thu, 20 Jun 2024 09:40:33 +0000
Received: by outflank-mailman (input) for mailman id 744333;
 Thu, 20 Jun 2024 09:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3B6=NW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sKEHQ-00007p-Gs
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:40:32 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2108ba7d-2ee9-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 11:40:29 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 09:40:26 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 09:40:25 +0000
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
X-Inumbo-ID: 2108ba7d-2ee9-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VelB6SPeycDl1UuXY/XXND0vOydbwdLugDBeyU/5mUm06iv4o6o65z/BGp9lqCV0YjOyeXGmGR5siTzy9X81oSAA51DWIFbNbw3b1YKcNCQwwU7KmHcA0vxJ2j8IgpKG4swy1BpmJE6zHsppXRByizfvDzXrnmlMI4ztMUaMV9BeEjHyb/gdBF4yqMvJCNY4PhDIjFEjqBa9bY6FWWkhiND53D8Mp41aKyWZ5a8OnMmH6DB3RF3Ao/td1vC8QpGR4hmb7qImAQcqh03Jt/DaDrkhjpKm1UU9xfnUdzUxInrmphCLE5bkfevaaHAX2fYG1H+ojBkY4LyTr67xZXAoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC5nzhJNZXlpnr5jo9kN5ci/J7Al/DdElf+vDCVtvKs=;
 b=iO0U4Ak1WzHFKRkwW5GXhGjzsb3h8HScyoOn3om2b6GUFliMxnwIob1npf+uJNDA0/lF6BBU4534GHhz208LmH2Dt4iuj+ehjzVsYyOUe5CPqD5BGVqMobYk71x74qmpC3efcP6ar1vuDEiYZLeMhTWYb4nCOSkV3G+0rNRFeiPfzf+DHEz2NwUUk0+dMj1WxqdjMNNE9QvAYt0FEDRt5VJivmNnDNNtoDoe8+nbToZCNuMQkbNMp3kEeIrGq5aLEXZf2BdD2t4su+EpWEwwIp6fuJQtb6Uvlx0XzWwBfVydre0fjaJT19zGmd+JLPz4gxExo2s9roesHQ1Z1wzB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC5nzhJNZXlpnr5jo9kN5ci/J7Al/DdElf+vDCVtvKs=;
 b=eWUuNAz59cieg3GsJB1JdWxSBsmuvk1cfmvcpvp+bWaSYEr1FZa2Q7HxeZ8vg9o1T5sJROYrluZqbT/eqSdo6keno3tCWlLkzR2hjF74FC7QIz/1fDOXPdMgT85cMu1gRfVV6k+VKi6ua0TXbnv/jEI7B9W/1Ir8AhE2tuSQIas=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHawJTqXyg3PMEiVUiLHPQ86aZkYrHMFeyAgAGdTwD//43bAIADi4UA
Date: Thu, 20 Jun 2024 09:40:25 +0000
Message-ID:
 <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
In-Reply-To: <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7698.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB5819:EE_
x-ms-office365-filtering-correlation-id: 2e7716ba-1daa-42bd-e720-08dc910d037c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?d2dsbGhYQWJUWDFvL3RRcUhPQVhDK3hHQnl5TDQrcTk0OHRORGJ3bkgxbUFk?=
 =?utf-8?B?ZW5yaERTeVh2bjlJcWRieHpmdHpmVUFEMFlqNDZHZGpHOWxCZmlVZWZySnR6?=
 =?utf-8?B?YTZ5ZWlUOU52cmZ5amxuRk1JT2czZi91a3pBYnVvMFEzTWg3VFlXb3I0alpw?=
 =?utf-8?B?MW1WOU52MmVnRXJtMHdXVWNaWEp0NjJmdGo2cytvQnRWU2dHTGZkNGlwanB6?=
 =?utf-8?B?VUtBeEhybnJFclM0eC8xQXA3SHNUeFZNUEgwRmV1MUFtekpWeVRMVDhKQ0xs?=
 =?utf-8?B?ZXFpdmgwTFp1LzBCalU5MUE3TXNDUFJDZzhSa3NzZTViNXBXdkRCQVdFQ0dV?=
 =?utf-8?B?a3RZUXZWWnYrd0dFUnBFTEcwb04rQnE0M1dYZHdvMWJhZ0s3cXdCZ0ZlejNI?=
 =?utf-8?B?Ti9CNzlPVXF3TlFqeTREbVU0NytrTHgyY0g4cERHOFozYTgxdzVCb0JoT1Rt?=
 =?utf-8?B?OHBaNHhNa1pvR2N5WDZnVUlXeFhHWUw0L1pTbysrRytkT1hDZlR4U0lleWxE?=
 =?utf-8?B?WEpMTllManlwaGZXcnQzM3N0cTVBem1DV2FTUVAwUXA0RzBjNmhqZlVrbE9B?=
 =?utf-8?B?YlZDamZxWlJ0NEJpSTJWSEtlRDhUekRuYUd4WHVnbTh5S2hiTCtISHc4THR4?=
 =?utf-8?B?dGlNcG1Rc2ZpSDJWTEtvMWVDUThZMHRlZkVEMjFIcUptdzVWMUpSQnV1NkxJ?=
 =?utf-8?B?L25lK1pZMWFUNGQ2VFUzeHE1cmt0U1BUc092UlpsQjlTclh0bXdheWlpQ0N6?=
 =?utf-8?B?OW8vSHJtb0JZNzBZRHQ1WG1WSHg3bjIxK053MFZhUXlNdllKTmZhMXROc3RY?=
 =?utf-8?B?MmZkdnBjTzJIYUhBTHVXNnJtSVdwQnNzK0czcTVOK3NHdFNjZU9vL3c3aE8v?=
 =?utf-8?B?YUc1Z0ppTWdnUGNIU0NObUJqcVRlWFZuNmVkREdYYVY0NDBkbWYxaHFjUlN2?=
 =?utf-8?B?bDlvYWtnVHoyanIxTUZISHZ2OXR4WU4rakRwb2FRME56R2xaWjEzZ1VpbVUw?=
 =?utf-8?B?UkFsU3VPcGY2K1Z5Q0U3VTdWblFCQjkyOXMzUkxNSkhRa1dka3MrTUpZRTJ3?=
 =?utf-8?B?enY4K2JQZHZmVmpCbzB6OXdrdGNRZ1YwT3UyQVFWVHFwL2UwSm1sSm1ySUNu?=
 =?utf-8?B?NlJqYmtLYzdnS1BpeUd6K2JJTXcxUG1CaGpRR1FGS2kyWEZQRjByRUM4NHpL?=
 =?utf-8?B?Q1lsYTcrbTQzMjZtZW9jdnY0QkNidkJSWDZaaEk0UUkxQWFDMG5rczVNM1hJ?=
 =?utf-8?B?UGVIS0ovNlJmeHg4M2luN0xObDlCU2pTeXZBSi9KejNacDVVcEVKQ21ZUkxD?=
 =?utf-8?B?OTJvdkVTTU8zVG5LK0w4dUhScnNUUDIyaklTR2JmbnlTZlZGVkxMY3IveE9p?=
 =?utf-8?B?b2ZsSVZ6L0N6K1lQQjh1VVRWWDV3bnpwMHRyVVMzS3gvUXNQcVZiTy9BNlE0?=
 =?utf-8?B?SG1GYVJPN1lzK0hXM2JFeXBwY21BMDFhbWdDMzFtS0ZKNUJpK2NTNVY3ZWRa?=
 =?utf-8?B?ekYwRUd5aHVEOXlQOC9Hc1BqdjFSOWJ0QlNoY0Z0MUR4UWx0L0RQQWhkS2pz?=
 =?utf-8?B?YlRnM2hVNmNkci8rZnQvK0hMWnBEdWZ3VzBDcmJobExIZ1pYK3VmTVNxSmdF?=
 =?utf-8?B?blVmU3BNbHZxa0Nxc1ZIQzdDSW03anoyMklOMFA3cWdqaHJ0VVRBTEVRY1Jt?=
 =?utf-8?B?S09LbFB5QlhoS1RnZHY0dktjRkpVenNwWmtReUZVWlZlMDc4UWxNeDRMZGUv?=
 =?utf-8?B?YnpiTWl0UmF4RkFpRHVUcUVKK0xNN2ZDUHM2dnZiTDNqUGFmVzFDb0FJOVZu?=
 =?utf-8?Q?efcFT8lz/1XFrers6EOfYXa9GT4ZDUK9568Cc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWhMZHhvc2hjeWxkMFIrazNWWlJ4UFkxdG5IdWlMVHpLdlJnSHMvL1J1TzFT?=
 =?utf-8?B?anpPZzN4NXVHNDdZemM4NVdlTS8rbHhHNDE2QlV1VTQrZjZtTDczSmhPTlNP?=
 =?utf-8?B?MDFqZlVCSnZLNUZjRXZteVc5QTdkcXJKN3FSS0xXeTE1bHByWW5KTWNXT2Q2?=
 =?utf-8?B?Slc4dzZhQVlhbVlLWXBvWDh5ZmN3WHNWQWJaaDNLSUpWVmZMTThXL1dQa1k2?=
 =?utf-8?B?VzJPRFJVaVk2bzlPZWJ5NlIwRjl3MFJRU2VoNGRySXorc0xBemJQd0krc3Ev?=
 =?utf-8?B?eklTZElNWFZEN29jU1E1RThnanJtVkErVk5zTUtYS0VMZzhmVyt5eStKUldw?=
 =?utf-8?B?Y1NKT1ZhU0JmL0haaEZFSDlMK2NzUjc1TlZrTVFPMkpuUHJXL3BMRGZldjJ2?=
 =?utf-8?B?YlcrdkdEQ1JrelZZYkNLWkZueEtadCtMbE9Nd1VFVzQ0SHJucEZCakZHNmVT?=
 =?utf-8?B?ZC9kTFBOQU1HQ0IrNFZ1QytYSFhhV2E0Rzd6eFg3dmNuN1dDeXFLUmNHRjJK?=
 =?utf-8?B?cFRLN0pnK3dqMms1Q0xJVUhsZjVGZTFoSWJhdmNIYmJDRXEyYXhDRStCdTN4?=
 =?utf-8?B?aXcxR0dxNHE3VWx1MkFvVHZCVFFNbW42bjZHSjJqeEJkRmk0ZHNJdlFLNW1y?=
 =?utf-8?B?aXpJK3dEbm1CRkxvQVlsOHZkdW1Qam9yU3RLWExPSHU3cXpVSkpodExiY3ZR?=
 =?utf-8?B?eVVpUGNhdkV1VDhBSzEveVdNUnMrdEN4ZEoxeVJmMGZZS0U1QkJIdjUvMkNB?=
 =?utf-8?B?VThrR2hZZ1BXSkQvaWQyUGwrdmVtRHg4YVVnRVZmTGVac2RSSkFmMys1bndP?=
 =?utf-8?B?cGNrMXpwWk9YWHRFYkxmYkUrajNqUnhxNjZCb2R1QjJFWXk0QURlQ0M0TEtI?=
 =?utf-8?B?dU9iN2pGUThZR1dDVFlYM1ZuaXZWbjNud2RIY3QwcnNsRkhoY2lidFozaWpM?=
 =?utf-8?B?MjgyYWE0MEdIcEdoT2ozWnhXK2M5bjZEMUpaelJoNHNIZWZjS2dZdVZQQy8v?=
 =?utf-8?B?a3dqQVR5aHkxeTdjYkhiUFpVUEVRWWw5QU5kcnA2TkJiZFJmRE9OQTg0V1di?=
 =?utf-8?B?UVQ5alo2MmRzaCs0TzFETm5BQlI5NisxSHdUNHdsdGZvL21rakNlRmFqR2Y4?=
 =?utf-8?B?UUpkeDNtcCtOR3RTeHNKYTJ1QjlMbUNBeGJJaWhQOW5EckNYenBzQ3VaQXp4?=
 =?utf-8?B?dWNZeEo0eU5hL3NqWXcrQXg5RGxRY2NiN3Q2K3NTVW9NVUNKbVoxY01vaFlJ?=
 =?utf-8?B?WXkvQTBTVDROYU05cWJicnhwd2pCU1Iya3pNRE1QWHI4SkIwOWtvZnhaclJH?=
 =?utf-8?B?WTZJYzNRQWU0eVcydmMxZW5TaE9nZlh5dm0ycXRCNldHbUg5NksxWXhjaUV5?=
 =?utf-8?B?RHVzYksvZUwxeWVickxOR29Wc2FYaE5ucGZlbVRrVzJ0N2pvbk1hQ1NYdVJ3?=
 =?utf-8?B?cXpJN2lObUV5aEZITXc4WHluZ25KSHhoR1NLR1VpcTlGR3ErRGRiczZFS3cz?=
 =?utf-8?B?ZWFHeTdJc3FjZmJLL3F3NnlzMXM1MEU3VkRhQVFjMEtpVzRHOUJ4VmVjNXg5?=
 =?utf-8?B?dDFCOEMrU1dacGhpUkgvbXZXY1pyOU5kZWNjTkpaR29VNERGTVc0VHh2K0RY?=
 =?utf-8?B?L09UVUZxMVl2NjJQVXFHZUxhbEZIUUY3emFudy9QVWZXdTZKYXA3blVhRWF5?=
 =?utf-8?B?cXZtQ21FNk1Yc1dSRk50TFFORytKNnJiQXIwdDAxaDV6ZVdUYmllbkVhTGEx?=
 =?utf-8?B?SUNxWDRZR2ZSZ2lXSjdjc2FrenBRUXUxdnFQQTBPMHpWNjBGbEFZTGx2Q0xn?=
 =?utf-8?B?UHMvejA0TkYwenJabEZlUDJuVVU2c3JKWVJtWjNNVEtXV210QmJXRUNrdHJW?=
 =?utf-8?B?anZ0MFNxU0MxMUNTMEFQaVpLWnFKRVVEWWxIU2hhVUpuck5SOHhjN2pBOVFl?=
 =?utf-8?B?L1lqVXBvaWZqMTBvekdROTIwVElKTWhNNU5iYnc4OTd6SmR4WUhWVTIvZnJQ?=
 =?utf-8?B?RWVickhZb3dTNUxlNXBJWnp4TUMzUVZWQmVKd3V2cE9obCtmMk9TS0M0YlV0?=
 =?utf-8?B?OVRlKzIvWXgyL1Z5NEtxYzJkRE1KMy9VdXpPRFdZSU1IeUZRMWFsSVUySVQw?=
 =?utf-8?Q?1RdE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76993DA5CD32A44EB0215BF18FC0B0CF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7716ba-1daa-42bd-e720-08dc910d037c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 09:40:25.8426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxZ2PBi1FBVb38rcUInBBktGQ0CnxolffDevQ4/SCjqkJPPBZsAUP/tpDTCmlZFhe4KBjO98UhC/WluwCkBAzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819

T24gMjAyNC82LzE4IDE3OjIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMDYuMjAyNCAx
MDoyMywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE3IDIzOjMyLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gQEAgLTE1MTYsMTQgKzE1MTksMzkgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9kbV9kb25l
KGxpYnhsX19lZ2MgKmVnYywNCj4+Pj4gICAgICAgICAgICAgIHJjID0gRVJST1JfRkFJTDsNCj4+
Pj4gICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4+PiAgICAgICAgICB9DQo+Pj4+IC0gICAgICAg
IHIgPSB4Y19kb21haW5faXJxX3Blcm1pc3Npb24oY3R4LT54Y2gsIGRvbWlkLCBpcnEsIDEpOw0K
Pj4+PiArI2lmZGVmIENPTkZJR19YODYNCj4+Pj4gKyAgICAgICAgLyogSWYgZG9tMCBkb2Vzbid0
IGhhdmUgUElSUXMsIG5lZWQgdG8gdXNlIHhjX2RvbWFpbl9nc2lfcGVybWlzc2lvbiAqLw0KPj4+
PiArICAgICAgICByID0geGNfZG9tYWluX2dldGluZm9fc2luZ2xlKGN0eC0+eGNoLCAwLCAmaW5m
byk7DQo+Pj4NCj4+PiBIYXJkLWNvZGVkIDAgaXMgaW1wb3NpbmcgbGltaXRhdGlvbnMuIElkZWFs
bHkgeW91IHdvdWxkIHVzZSBET01JRF9TRUxGLCBidXQNCj4+PiBJIGRpZG4ndCBjaGVjayBpZiB0
aGF0IGNhbiBiZSB1c2VkIHdpdGggdGhlIHVuZGVybHlpbmcgaHlwZXJjYWxsKHMpLiBPdGhlcndp
c2UNCkZyb20gdGhlIGNvbW1pdCAxMGVmN2E5MWI1YThjYjhjNTg5MDNjNjBlMmRkMTZlZDQ5MGIz
YmNmLCBET01JRF9TRUxGIGlzIG5vdCBhbGxvd2VkIGZvciBYRU5fRE9NQ1RMX2dldGRvbWFpbmlu
Zm8uDQpBbmQgbm93IFhFTl9ET01DVExfZ2V0ZG9tYWluaW5mbyBnZXRzIGRvbWFpbiB0aHJvdWdo
IHJjdV9sb2NrX2RvbWFpbl9ieV9pZC4NCg0KPj4+IHlvdSB3YW50IHRvIHBhc3MgdGhlIGFjdHVh
bCBkb21pZCBvZiB0aGUgbG9jYWwgZG9tYWluIGhlcmUuDQpXaGF0IGlzIHRoZSBsb2NhbCBkb21h
aW4gaGVyZT8NCldoYXQgaXMgbWV0aG9kIGZvciBtZSB0byBnZXQgaXRzIGRvbWlkPw0KDQo+PiBC
dXQgdGhlIGFjdGlvbiBvZiBncmFudGluZyBwZXJtaXNzaW9uIGlzIGZyb20gZG9tMCB0byBkb21V
LCB3aGF0IEkgbmVlZCB0byBnZXQgaXMgdGhlIGluZm9tYXRpb24gb2YgZG9tMCwNCj4+IFRoZSBh
Y3R1YWwgZG9taWQgaGVyZSBpcyBkb21VJ3MgaWQgSSB0aGluaywgaXQgaXMgbm90IHVzZWZ1bC4N
Cj4gDQo+IE5vdGUgaG93IEkgc2FpZCBET01JRF9TRUxGIGFuZCAibG9jYWwgZG9tYWluIi4gVGhl
cmUncyBubyB0YWxrIG9mIHVzaW5nIHRoZQ0KPiBEb21VJ3MgZG9taWQuIEJ1dCB3aGF0IHlvdSBh
cHBhcmVudGx5IG5lZ2xlY3QgaXMgdGhlIGZhY3QgdGhhdCB0aGUgaGFyZHdhcmUNCj4gZG9tYWlu
IGlzbid0IG5lY2Vzc2FyaWx5IERvbTAgKHNlZSBDT05GSUdfTEFURV9IV0RPTSBpbiB0aGUgaHlw
ZXJ2aXNvcikuDQo+IFdoaWxlIGJlbmlnbiBpbiBtb3N0IGNhc2VzLCB0aGlzIGlzIHJlbGV2YW50
IHdoZW4gaXQgY29tZXMgdG8gcmVmZXJlbmNpbmcNCj4gdGhlIGhhcmR3YXJlIGRvbWFpbiBieSBk
b21pZC4gQW5kIGl0IGlzIHRoZSBoYXJkd2FyZSBkb21haW4gd2hpY2ggaXMgZ29pbmcNCj4gdG8g
ZHJpdmUgdGhlIGRldmljZSByZS1hc3NpZ25tZW50LCBhcyB0aGF0IGRvbWFpbiBpcyB3aG8ncyBp
biBwb3NzZXNzaW9uIG9mDQo+IGFsbCB0aGUgZGV2aWNlcyBub3QgeWV0IGFzc2lnbmVkIHRvIGFu
eSBEb21VLg0KT0ssIEkgbmVlZCB0byBnZXQgdGhlIGluZm9ybWF0aW9uIG9mIGhhcmR3YXJlIGRv
bWFpbiBoZXJlPw0KDQo+IA0KPj4+PiBAQCAtMjM3LDYgKzIzOCw0OCBAQCBsb25nIGFyY2hfZG9f
ZG9tY3RsKA0KPj4+PiAgICAgICAgICBicmVhazsNCj4+Pj4gICAgICB9DQo+Pj4+ICANCj4+Pj4g
KyAgICBjYXNlIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb246DQo+Pj4+ICsgICAgew0KPj4+PiAr
ICAgICAgICB1bnNpZ25lZCBpbnQgZ3NpID0gZG9tY3RsLT51LmdzaV9wZXJtaXNzaW9uLmdzaTsN
Cj4+Pj4gKyAgICAgICAgaW50IGlycTsNCj4+Pj4gKyAgICAgICAgYm9vbCBhbGxvdyA9IGRvbWN0
bC0+dS5nc2lfcGVybWlzc2lvbi5hbGxvd19hY2Nlc3M7DQo+Pj4NCj4+PiBTZWUgbXkgZWFybGll
ciBjb21tZW50cyBvbiB0aGlzIGNvbnZlcnNpb24gb2YgOCBiaXRzIGludG8ganVzdCBvbmUuDQo+
PiBEbyB5b3UgbWVhbiB0aGF0IEkgbmVlZCB0byBjaGVjayBhbGxvd19hY2Nlc3MgaXMgPj0gMD8N
Cj4+IEJ1dCBhbGxvd19hY2Nlc3MgaXMgdTgsIGl0IGNhbid0IGJlIG5lZ2F0aXZlLg0KPiANCj4g
UmlnaHQuIFdoYXQgSSBjYW4gb25seSByZS1pdGVyYXRlIGZyb20gZWFybGllciBjb21tZW50aW5n
IGlzIHRoYXQgeW91DQo+IHdhbnQgdG8gY2hlY2sgZm9yIDAgb3IgMSAoY2FuIGJlIHZpZXdlZCBh
cyBsb29raW5nIGF0IGp1c3QgdGhlIGxvdyBiaXQpLA0KPiByZWplY3RpbmcgZXZlcnl0aGluZyBl
bHNlLiBJdCBpcyBvbmx5IHRoaXMgd2F5IHRoYXQgZG93biB0aGUgcm9hZCB3ZQ0KPiBjb3VsZCBh
c3NpZ24gbWVhbmluZyB0byB0aGUgb3RoZXIgYml0cywgd2l0aG91dCByaXNraW5nIHRvIGJyZWFr
IGV4aXN0aW5nDQo+IGNhbGxlcnMuIFRoYXQncyB0aGUgc2FtZSBhcyB0aGUgcmVxdWlyZW1lbnQg
dG8gY2hlY2sgcGFkZGluZyBmaWVsZHMgdG8gYmUNCj4gemVyby4NCk9LLCBJIHdpbGwgYWRkIGNo
ZWNrIHRoZSBvdGhlciBiaXQgaXMgemVybyBleGNlcHQgdGhlIGxvd2VzdCBvbmUgYml0Lg0KDQo+
IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

