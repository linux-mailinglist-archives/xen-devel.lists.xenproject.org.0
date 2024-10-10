Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4019997E70
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 09:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815557.1229535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synGU-0000qE-9V; Thu, 10 Oct 2024 07:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815557.1229535; Thu, 10 Oct 2024 07:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synGU-0000oH-6Z; Thu, 10 Oct 2024 07:07:14 +0000
Received: by outflank-mailman (input) for mailman id 815557;
 Thu, 10 Oct 2024 07:07:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fZv=RG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1synGS-0000ld-BG
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:07:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2415::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 443e63c1-86d6-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 09:07:11 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7427.namprd12.prod.outlook.com (2603:10b6:510:202::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 07:07:06 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 07:07:06 +0000
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
X-Inumbo-ID: 443e63c1-86d6-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0m1s0mz47W8FANaA1SXK/9ePxiWcWRRBRSJG5nOM6YIeH2f3e+dg94unp48APYA/U0FRnqOMEZmxJgOnhW8s8WKmf1pPlR6X1k1kifQoVP5DNcGXmvqzVsYIw0TiA30Y6SXRznoi1GbTbNvfi8KhPuDwRNbyWA9j1RdFqIMzAqAqgXGTceK5LXdc7nfuIZ0YRrIrHo9X5GbU4gIPrha6+GD4Pk6+CcUQpv1SewYqosXywQF0RG8Vbo0ScKvuFpWxDjq9qNzqPYf69smTeHlySnb03vdwIMnl0cOn2z7tihnIMgouVhFJzc0vPts6j4YfCRH37AezSAlWz4aY522Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUhvMB09tbqA8NK5v8XB9Ge8pIp5aMRmHKaj4oI9vw4=;
 b=o/xkS9g3vS9JW7SrszhZehjluRRxk8iL5G1c73mXKAzdhMIOGlN3Alnjdf7jgGFLR9wR4IN2cI0tAUaR8GRAgRmCL8vnaBeClpK0eHKWxhiugOuK181u3mdvYssCI5+Vrgu1WUis6AnFC8BnO7am3LWIgMoLLbbIGXI590TJdao6EU/rrhFBxymoHZE768n/zLfir8GlMAvqCQnj6DEfF8IDZdEzrRz08z6gnfCQwDdgccOvNrh/WDCN2WIPy5H7G3KnSYFoVDyEK2sB/pG3XNl1eYDQ9QB/SpkmC+5RrB92cAAGlHuarYK9uxIvB+ZH+B1A0c9UtsWKCQT9+5w8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUhvMB09tbqA8NK5v8XB9Ge8pIp5aMRmHKaj4oI9vw4=;
 b=Rzo4iDUtEm6xtN6HY77lx0pJT7YUZH6jrtpFnTHMI9jhhtLGi7tPw74rtgc1DnCgjK2n+Q+kYl9vIMJlUYmevIZXzrWNUVGiINGknrYmR8pU5IOW4g/wE7gxef0K4K399u0qxq7ZehQ0LRWlEdgcHoIsPBb4cycYn56Aow1uXdU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Marek Marczykowski
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen: Remove config dependency in XEN_PRIVCMD definition
Thread-Topic: [PATCH] xen: Remove config dependency in XEN_PRIVCMD definition
Thread-Index: AQHbGhNYcN0w2cT3Gkyq1+R+KBCtNrJ9/yUAgAEHAICAAHM/AIAAnieA
Date: Thu, 10 Oct 2024 07:07:06 +0000
Message-ID:
 <BL1PR12MB5849650F8CB4606143C403F1E7782@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241009062014.407310-1-Jiqian.Chen@amd.com>
 <73174eb0-380d-4f95-a2c3-097b86fac8db@suse.com>
 <alpine.DEB.2.22.394.2410091539260.471028@ubuntu-linux-20-04-desktop>
 <8bfaa6cc-2cf1-48e4-828b-e4d356f0b3fc@suse.com>
In-Reply-To: <8bfaa6cc-2cf1-48e4-828b-e4d356f0b3fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8026.020)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7427:EE_
x-ms-office365-filtering-correlation-id: 1a8552ee-9ec2-41ad-ce18-08dce8fa2653
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OERpNGFiUWYvWTN2aEVRL1R1dVRKQmdReXV6MGRuRTN0b0JMSzA5N2Z2ckM5?=
 =?utf-8?B?NG1EZXNtWGROWmh6SGRoR0Vqd2N5VitIMTg3RVNxTkdHOEphak1HTDdiRW9S?=
 =?utf-8?B?UHRwOHAxQ29DRUx0Y043a1NZT01NNTcxb2V0YlEwV0F6UkZ0OVVHcVdwRFJa?=
 =?utf-8?B?MmRNYVRqalZFbzd6L2ZPOGVuUnJrTDJkT3M4NXpDb09URG95U2VncTE0VC9v?=
 =?utf-8?B?M09nM2NaTWN5Vk8wL2hYc1ZFWFQxVEtXRzFWVXBldWwvMVFPL2pPTTQ1N1Bs?=
 =?utf-8?B?SVo2N0tXbHJiVXdiQlN2K0VMbnUrK3hPeWlpZFI1UG1Jb2xaYlB2VzN3TWdX?=
 =?utf-8?B?eEtpL3Q2Zm01MDVkNTdjWmtMRVFyL05DMWxFSDNBampoOE92M1dLa0duQTdk?=
 =?utf-8?B?SkxLQjNiN2FLYkV5bXV5cjR1QlN3aGZ6dm1CKzE0eTE5dlFQSkVxRkE3YWNT?=
 =?utf-8?B?UUc1dE1IdXJQd1VObGF2Ukk2T3UzOUdkdk5Ec1FxNnZoZEw4NTBRRG4yZWtx?=
 =?utf-8?B?SlkxcXlTZVdHeSt0ZjBBUEdYRlFaS2tQeWc1UmNRZzVTTTMyNGJ0SHVTSnVK?=
 =?utf-8?B?ckk2MkNTS29ENW5PL3I1NlJIVFBxVFZnOW1paUQ4OVkrR0pFZnVjWGtxNk55?=
 =?utf-8?B?VnhhUHVXZlVsKzk5b0xNRSsrK0YxM1IzcE5QUTlibnNkb3lSRm1hbWM2dFpS?=
 =?utf-8?B?Q3gzaCtTQlArQTZMRHU5UVZjRW90eDVnengwSGZZR2hSdGhhWXhsbHVBdzBM?=
 =?utf-8?B?YWpSUXJvV1FpUExjU1pxL01DUEV0NitDNVNxb2gvQ0pjMEtMS1FIMFQzcklZ?=
 =?utf-8?B?WlVEanp0RGJ3SmtldjJ2OXZ6QnFKNlBHYUZpZTdxd2pQZ05OcElFT1lhU3JK?=
 =?utf-8?B?eHhDT1NyTWNWL2FCOWpBWElYTHk0Z2p4U1E4U3lROVpmSjhnM1RneFA2emEz?=
 =?utf-8?B?ellzT2JTVDB4ajNzVlNleFl6Z3R2RzJKRTBjbjljdGxzanFWZCtsMk1iUVlF?=
 =?utf-8?B?U1VjTWMyaHI5emZWaytWdkVQNE90a1gzVnRLeVZNNGs2N2xUK0I3NU14VnZX?=
 =?utf-8?B?aWZHMmJhWlZTTnpiemtrZWZKbWR6VnlUdHZlN0FPdS81ZndiTlR3RjBWMDBu?=
 =?utf-8?B?ekFvNkNZRGJUaFNZQ1NBMUgvK0RYdklXWUNpM1pEN090RkVEWnpQYmJjREZx?=
 =?utf-8?B?d1p3SVFwRnVndW4vOEwyMmRnaWdkQTl3dm1rQ2NFZXZ4cHFqY0cycHRBbHk3?=
 =?utf-8?B?SG9iSCt6MXAvajhqSGhQQWhhbk1pSTB2TzdEMThFNTltWk1UeWZHSmdmMnRh?=
 =?utf-8?B?WEdqQXlNR01tNU9YY2lOTC9acElGTVh0Qng3TG1yS2N6YkhaYzBZVnVkZzdV?=
 =?utf-8?B?bU9ZLzczMGhSSkpPVHo0TTh1Nk1kbUVEdnRrUElkU05kMnAvV2N6UHlxdDgz?=
 =?utf-8?B?aXdlWUhKL1k0V3hSanI4bEMzeHo4ekhJakJidjdoanpnczU2UlNzY1Jid3c3?=
 =?utf-8?B?akJjZVYvSERMYTV5a2grbFlmaStqWlRmVW1XTlZUMGxKbThsMjVjZC96SEsx?=
 =?utf-8?B?WjFDVjYwSmtseEtWczh4bDRKOU5PdTBxeHg3dG92S2svZytMbUNGejJ4cGRu?=
 =?utf-8?B?dUE2MEl0UHpGWVFxTXAxTkQvc0VLU1JMLzBqbFNpa1lnNWRMRGsvc05ZRGY5?=
 =?utf-8?B?M1djODVzWTgycVRkSGNtVGJ5YVBzclhicEVBU0dJMDlZTWFta3k0U2t6c2E4?=
 =?utf-8?B?R3NicmpHcDVLTEJpMXcvU0lXQm9ZdGEwNHdSSUtvczEyY0NYWkJxUW9FK09F?=
 =?utf-8?B?UDVNOVl4T3FJMGpkV1JaUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmFsRFNuWGwrb3JnVlM0SzVGeFdYWDhhcTlNenREc1FIWWJrd2M4Ump6anlr?=
 =?utf-8?B?WWxsRGtFLzJZZFUrcGY3YmNhK1ZvRTIwbzRwS2FDWkhTd3R4N1VlZ1R1ME0x?=
 =?utf-8?B?cW81SmJIRGhROUMzSFlhdVZmaEFKMkx3blZFemNSV21TWXVxeUFCMC9YNE1R?=
 =?utf-8?B?MjI5dkZabUU4VU0rUCtnZ2lnY3F1OGZYTmdvUHB0bEs0SVFBUTVLVnN2YmFJ?=
 =?utf-8?B?aU9ySzNuaDJjYyt6QVo0TGhpdGZ0UXlmUXdvam1pK00zREJmd3k1RnlOSlJ1?=
 =?utf-8?B?b0paVEo0NVNuRnB0MjIyT082S0d4Uy9qSWVyYzVNQjBBdFo3aVFIbmZ3VXBF?=
 =?utf-8?B?ZjYvaGxCcXB0cEdmMkp0cktUYjQwWFJYeWFuUXpXdHdmU2xFdUFaYW5DK2Fh?=
 =?utf-8?B?RnBjREwxN1dIWFcwenl5dGxicGV2N2NEZEJGQlJ1MDIrRG1jcmFSU2YyUmhy?=
 =?utf-8?B?K3h2aDJRRm5qRzUrMGdVZ24vRnZrd3NXUEJ6VXl2MXBOM3pCL3V5akY4U0dY?=
 =?utf-8?B?Z0R0UHZNQVhRbG16YWwwN3I5WHN0OWxvYytuYjdzZnFiYnhaZGhrT3laaDFJ?=
 =?utf-8?B?eVFIaVlFOUV4Zk9vaTFzZjk4dVQ0OUpQVk1Ob2RXL2t5OW1wS1c4MFJTS28w?=
 =?utf-8?B?Z0MveFlkd29wQUdIZHh6TWpKekZUNUFKZVVYVWRpRUp4UlNuU2lDWXF3QTBM?=
 =?utf-8?B?L2RGV0k1Mk9pb0NNNFhFcmdOekZzMDkvNXFMT3NkMmpRTHFiSnp4UEhqNVdE?=
 =?utf-8?B?RGIxL1Y2c1l6Mk5sZjFKYkpvWmdSZWZPY1RwYmQvWXVMN3J2a25oYW9FeFRi?=
 =?utf-8?B?NDFNUTVqdXQ0ajZ2aCtuNzE0UXUwa1BETEVnOXJWamNOdkcrUlZOWlc4a002?=
 =?utf-8?B?UkNiaFNRemFuRmhUSVpPb3d4dFRVRlQzMitxMU8rcTJteDIzd2dSZU1QMVBW?=
 =?utf-8?B?YUlBL2tpRHhETjRxa0xRMmkyaUJEOHdsYkhhcE94cEdFR2haMU5KbTNLbmtG?=
 =?utf-8?B?QkU4YThna2s0QTFvbWNSa1NxcXFIQlN4Mnp5QW5jU29QNGJlTE5waGlrNTBr?=
 =?utf-8?B?QlMrV2tRK2w1cWg0ZTFLZ0hsVUNyamJBUnRPTm5McnY0L3VpMGl4Y3BnSTBF?=
 =?utf-8?B?SENMVTNmR0xJbVAvZmRScmU5WFdLY29mZDZZcnRxOUxLVk9PUHlsNkFzQUVC?=
 =?utf-8?B?REtmcUpqQkZjQjdzSlVlSWNrNGtVV3Z2ZEhEdm9KUlhsOFRBQThBQXFsV3g1?=
 =?utf-8?B?ZlJLOVQwWmp2R2ExcHhMU0pTSUZ1Z1A4TTJzYkZqbUI3YUNnQ1Fzb3JNaFI2?=
 =?utf-8?B?OThWVEdzWDhVWnFIeFc4Ly9Ba2l0RWpOQ0xaYjh5eWpoWmxMSFB0dVAwMGRs?=
 =?utf-8?B?K1dSYkxoRUh3TURPMjdLR0xUSkxFSVRmSk03N21qNStIREpvU2kxdlVYc2NO?=
 =?utf-8?B?MXN1TnBsQWlmWjEvWkRwMlNpMEoxb3lNOEdyS1ZjMWdTMTdwQkQzRWhzOXBV?=
 =?utf-8?B?OXBDUzM1TG9iaGRIZzBURE9xV1dzMFV6MlFrWXlYbU5hNmZKVU5FZUZBQklp?=
 =?utf-8?B?c25yYlNyUE5URTJmQ1hnWlI2TDR1R0JUYzZnRkRDbnlYMHFoSytsN0ZCYmdt?=
 =?utf-8?B?R2dRYkFPUWlGRmJnN3Z0U1ZaRFBUa2xaY3NFRHRTTks0T1luTnZ3MExFOXlP?=
 =?utf-8?B?RWxTekYwb2ltMVZqRkNjbzJBeDF3em5SZmhabEV3cW16czh4WVhhSnRrQlNQ?=
 =?utf-8?B?L1lHdEdSM0Q1L0RPVyt4R2c3RzFwb2VKZGpCWmQzVVhLZlhrQ0p2Mjl6c21Q?=
 =?utf-8?B?SkFvd3lQVVRjUzBJZWFwZ21HZ2txaHhiazBMdUgrRUR1QzY4ZmJhQlVaWG9N?=
 =?utf-8?B?T0RRclBmWGIrZ2UxeGIycXBNZy9RTDZyYU9mSzdVWHFDdlljMmV5bVVtOFRC?=
 =?utf-8?B?YWlhQmx5WkdwRkM0NkZBRUNnU2swSXd4cndvUUFIY3RqZDUyMW1HVXp5eG5w?=
 =?utf-8?B?MHJkRURHSUZlVDlnSkdNdG5xTkxtYnRKWnFrMEZ5K1FvdEJjZ1BmMllqZ25L?=
 =?utf-8?B?QWUyb2xnbE5sdTdYOU9oMnNlUW0ydjVIMGZpMTRqQmhUeGUzRUxxc0cvbXBH?=
 =?utf-8?Q?AJ+M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <676BF40FD86418499E6284463AED58D7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8552ee-9ec2-41ad-ce18-08dce8fa2653
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 07:07:06.2068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLKaMDX2Akr7wkBudlSfchTlhczg+N3xZdaHLggZkcg9GwhKlQoHYF69rHUMNLFdT0IS0MAg6SMzBlBZ5G6Pcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7427

T24gMjAyNC8xMC8xMCAxMzozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMTAuMTAuMjQg
MDA6NDYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIFdlZCwgOSBPY3QgMjAyNCwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDkuMTAuMjAyNCAwODoyMCwgSmlxaWFuIENoZW4g
d3JvdGU6DQo+Pj4+IENvbW1pdCAyZmFlNmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRkIG5ldyBz
eXNjYWxsIHRvIGdldCBnc2kgZnJvbSBkZXYiKQ0KPj4+PiBhZGRzIGEgd2VhayByZXZlcnNlIGRl
cGVuZGVuY3kgdG8gdGhlIGNvbmZpZyBYRU5fUFJJVkNNRCBkZWZpbml0aW9uLCBpdHMNCj4+Pj4g
cHVycG9zZSBpcyB0byBwYXNzIHRoZSBjb21iaW5hdGlvbiBvZiBjb21waWxhdGlvbiB0aGF0IENP
TkZJR19YRU5fUFJJVkNNRD15DQo+Pj4+IGFuZCBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EPW0s
IGJlY2F1c2UgaW4gdGhhdCBjb21iaW5hdGlvbiwgeGVuLXBjaWJhY2sNCj4+Pj4gaXMgY29tcGls
ZWQgYXMgYSBtb2R1bGUgYnV0IHhlbi1wcml2Y21kIGlzIGJ1aWx0LWluLCBzbyB4ZW4tcHJpdmNt
ZCBjYW4ndA0KPj4+PiBmaW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBwY2lzdHViX2dldF9nc2lf
ZnJvbV9zYmRmLg0KPj4+Pg0KPj4+PiBCdXQgdGhhdCBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4tcHJp
dmNtZCBjYW4ndCBiZSBsb2FkZWQgb24gZG9tVSwgYmVjYXVzZQ0KPj4+PiBkZXBlbmRlbnQgeGVu
LXBjaWJhY2sgaXMgYWx3YXlzIG5vdCBiZSBsb2FkZWQgc3VjY2Vzc2Z1bGx5IG9uIGRvbVUuDQo+
Pj4+DQo+Pj4+IFRvIHNvbHZlIGFib3ZlIHByb2JsZW0gYW5kIGNvdmVyIG9yaWdpbmFsIGNvbW1p
dCdzIHJlcXVpcmVtZW50LCBqdXN0IHJlbW92ZQ0KPj4+PiB0aGF0IGRlcGVuZGVuY3ksIGJlY2F1
c2UgdGhlIGNvZGUgIklTX1JFQUNIQUJMRShDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EKSINCj4+
Pj4gb2Ygb3JpZ2luYWwgY29tbWl0IGlzIGVub3VnaCB0byBtZWV0IHRoZSByZXF1aXJlbWVudC4N
Cj4+Pj4NCj4+Pj4gRml4ZXM6IDJmYWU2YmI3YmUzMiAoInhlbi9wcml2Y21kOiBBZGQgbmV3IHN5
c2NhbGwgdG8gZ2V0IGdzaSBmcm9tIGRldiIpDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBD
aGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+DQo+Pj4gVGhpcyBsYWNrcyBhIFJlcG9ydGVk
LWJ5Oi4NCj4+Pg0KPj4+PiAtLS0gYS9kcml2ZXJzL3hlbi9LY29uZmlnDQo+Pj4+ICsrKyBiL2Ry
aXZlcnMveGVuL0tjb25maWcNCj4+Pj4gQEAgLTI2MSw3ICsyNjEsNiBAQCBjb25maWcgWEVOX1ND
U0lfQkFDS0VORA0KPj4+PiDCoCBjb25maWcgWEVOX1BSSVZDTUQNCj4+Pj4gwqDCoMKgwqDCoCB0
cmlzdGF0ZSAiWGVuIGh5cGVyY2FsbCBwYXNzdGhyb3VnaCBkcml2ZXIiDQo+Pj4+IMKgwqDCoMKg
wqAgZGVwZW5kcyBvbiBYRU4NCj4+Pj4gLcKgwqDCoCBpbXBseSBYRU5fUENJREVWX0JBQ0tFTkQN
Cj4+Pj4gwqDCoMKgwqDCoCBkZWZhdWx0IG0NCj4+Pj4gwqDCoMKgwqDCoCBoZWxwDQo+Pj4+IMKg
wqDCoMKgwqDCoMKgIFRoZSBoeXBlcmNhbGwgcGFzc3Rocm91Z2ggZHJpdmVyIGFsbG93cyBwcml2
aWxlZ2VkIHVzZXIgcHJvZ3JhbXMgdG8NCj4+Pg0KPj4+IFRoZSByZXBvcnQgd2Fzbid0IGFib3V0
IGEgYnVpbGQgcHJvYmxlbSwgYnV0IGEgcnVudGltZSBvbmUuIFJlbW92aW5nIHRoZQ0KPj4+IGRl
cGVuZGVuY3kgaGVyZSBkb2Vzbid0IGNoYW5nZSBhbnl0aGluZyBpbiB0aGUgZGVwZW5kZW5jeSBv
ZiB4ZW4tcHJpdmNtZA0KPj4+IG9uIHhlbi1wY2liYWNrLCBhcyB0aGUgdXNlIG9mIHBjaXN0dWJf
Z2V0X2dzaV9mcm9tX3NiZGYoKSBjb250aW51ZXMgdG8NCj4+PiBleGlzdC4NCj4+Pg0KPj4+IENv
bnNpZGVyIHRoZSBjYXNlIG9mIFhFTl9QQ0lERVZfQkFDS0VORD1tIGFuZCBYRU5fUFJJVkNNRD1t
LCB3aGljaA0KPj4+IEkgZ3Vlc3MgaXMgd2hhdCBNYXJlayBpcyB1c2luZyBpbiBoaXMgY29uZmln
LiBCb3RoIGRyaXZlcnMgYXJlIGF2YWlsYWJsZQ0KPj4+IGluIHN1Y2ggYSBjb25maWd1cmF0aW9u
LCB5ZXQgbG9hZGluZyBvZiB4ZW4tcHJpdmNtZCB0aGVuIHJlcXVpcmVzIHRvDQo+Pj4gbG9hZCB4
ZW4tcGNpYmFjayBmaXJzdC4gQW5kIHRoYXQgbGF0dGVyIGxvYWQgYXR0ZW1wdCB3aWxsIGZhaWwg
aW4gYSBEb21VLg0KPj4+IFRoZSB0d28gZHJpdmVycyBzaW1wbHkgbWF5IG5vdCBoYXZlIGFueSBk
ZXBlbmRlbmN5IGluIGVpdGhlciBkaXJlY3Rpb24uDQo+Pg0KPj4gVGhlIGlkZWEgaXMgdGhhdCB0
aGVyZSBzaG91bGQgYmUgbm8gaGFyZCBkZXBlbmRlbmN5IG9uDQo+PiBwY2lzdHViX2dldF9nc2lf
ZnJvbV9zYmRmKCkuIElmIGl0IGlzIGF2YWlsYWJsZSwgdGhlIHNlcnZpY2Ugd2lsbCBiZQ0KPj4g
dXNlZCwgb3RoZXJ3aXNlIGFuIGVycm9yIHdpbGwgYmUgcmVwb3J0ZWQuDQo+Pg0KPj4gVGhlIHBy
b2JsZW0gaXMgdGhhdCBJU19SRUFDSEFCTEUgaXMgYSBjb21waWxlLXRpbWUgY2hlY2suIFdoYXQg
d2UgbmVlZA0KPj4gaXMgYSBydW50aW1lIGNoZWNrIGluc3RlYWQuIE1heWJlIHN5bWJvbF9nZXQg
b3IgdHJ5X21vZHVsZV9nZXQgPw0KPiANCj4gVGhpcyBpcyBhIHJhdGhlciBjbHVtc3kgc29sdXRp
b24gSU1PLg0KPiANCj4gSSdtIHNlZWluZyB0aGUgZm9sbG93aW5nIHNvbHV0aW9uczoNCj4gDQo+
IDEuIERvbid0IGZhaWwgdG8gdG8gbG9hZCB0aGUgcGNpYmFjayBkcml2ZXIgaW4gYSBEb21VLCBi
dXQgb25seSBkaXNhYmxlDQo+IMKgwqAgYW55IGZ1bmN0aW9uYWxpdHkuDQo+IA0KPiAyLiBNb3Zl
IHRoZSBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jIGZ1bmN0aW9uYWxpdHkgaW4g
YSBtb2R1bGUNCj4gwqDCoCBvZiBpdHMgb3duLCBhbGxvd2luZyB0aGUgcHJpdmNtZCBkcml2ZXIg
dG8gYmUgbG9hZGVkIHdpdGhvdXQgbmVlZGluZw0KPiDCoMKgIHRoZSByZXN0IG9mIHBjaWJhY2su
DQo+IA0KPiAzLiBBZGQgYSBob29rIHRvIGUuZy4gZHJpdmVycy94ZW4vcGNpLmMgaW5zdGVhZCBm
b3IgY2FsbGluZyBvZg0KPiDCoMKgIHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYoKSBkaXJlY3Rs
eS4gcGNpYmFjayBjb3VsZCByZWdpc3RlciB0aGUgcmVhbA0KPiDCoMKgIGNhbGwgYWRkcmVzcy4g
SWYgcGNpYmFjayBpc24ndCBsb2FkZWQsIHRoZSBob29rIGNhbiByZXR1cm4gYW4gZXJyb3IuDQo+
IMKgwqAgVGhpcyB3b3VsZCByZW1vdmUgdGhlIGV4cGxpY2l0IGRlcGVuZGVuY3kgb2YgcHJpdmNt
ZCBvbiBwY2liYWNrLg0KPiANCj4gSSdkIHByZWZlciB0aGUgM3JkIHZhcmlhbnQuDQpUaGFua3Ms
IEkgd2lsbCBzZW5kIGNoYW5nZXMgaW4gdjIgc29vbi4NCkFuZCBJIHByZWZlciB0byBhZGQgdGhl
IGhvb2sgaW4gZHJpdmVycy94ZW4vYWNwaS5jDQoNCj4gDQo+IA0KPiBKdWVyZ2VuDQo+IA0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

