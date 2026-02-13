Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJcJGQBKj2moPQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 16:57:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA3137BDE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 16:57:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231239.1536465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqvXK-0000Kn-1G; Fri, 13 Feb 2026 15:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231239.1536465; Fri, 13 Feb 2026 15:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqvXJ-0000IQ-To; Fri, 13 Feb 2026 15:56:53 +0000
Received: by outflank-mailman (input) for mailman id 1231239;
 Fri, 13 Feb 2026 15:56:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqvXI-0000IK-TI
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 15:56:52 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9945ccc0-08f4-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 16:56:47 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 15:56:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 15:56:42 +0000
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
X-Inumbo-ID: 9945ccc0-08f4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xkks1N7mb4Yb67jdkicJoKzhll2EvoB+zVvpVjpOQvrD9nRh4TmrCuSE8XW4JeDxvXGkuBUPcambPY43hndlg+uDbEYHvYLEGcbtO+Kdm6MbefTA6COlTf5mnN9IIrWKuhp3BsO3AnjR6UdQw7ZnUXb1CM0/BkCX1CsFgcIW6O7D1x91uTWmHGWKqBlMjDV/1MXDwv6VJ0PE6X6WaiAcBMEQ+/6i0naBurNO4zrkZE4HarWAUi+qYZGQlx+6FxPrSoSBdGBYGySgVabhpZa5K6evipLmeI/zpwiEDMmheR6yJPR6qRDoj33St/NQzL2lLOWVpscCLO3RwYEe/L0U1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtwA6J6JnP5kzOs4VxtBq89OBcW3wn9L4AtBgiwkYkE=;
 b=xycoX5Yc0qbEhvMQoSXA/mp2muuaOIUh4QsdMpA3tBcHlC1HmL/SCnJCBXrXlYrYn3eMrLjD39TnBX+q5EDRdMg0qrRaelG3uPi1NI99yrxo4OoL7b0QHlfZBxmn4gkc6wWaw86gBsZv3zOV2SoBAo5zjtX4PxHrZ0ZZcrN4kJUXCQoErS+jww6isXZByKYhUVeMJ1YXVKnVQVNv8u6UHSVfdzxzhEdGcxCKHsJc5TLKJrUaYFLWBaQwLUHM4AGOkLDNHQqpdxYJwAbAUL00smnbnrsOLGc/S9o737fEsAW+QOoA3WQ6Ovo2rFfhqVK3seer3YfH6fkAnJDfyfJI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtwA6J6JnP5kzOs4VxtBq89OBcW3wn9L4AtBgiwkYkE=;
 b=QtzQFaArfNoZYraBnJ+0uisqIHCUJqzlE5IF+qHCf5oIrXCjWFtip30IZlClshDzx4txg71x1fCkRF2SYNostg+BmZlLQRNBBJVBoRFVOYwaS2V307JP2qAdKhkx7goQ1EKoQA7UQXC8via8kWofPcZk3yrVDtMfGuyjl5unybw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 16:56:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd
Message-ID: <aY9Jt1-jCWhStcxB@Mac.lan>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com>
X-ClientProxiedBy: MA2P292CA0013.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::6)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 433f4447-ef13-4e22-0186-08de6b187b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGRRTVVSc1RqYk5BMGpTcUxvUjFQZ2JTUS9wWVJlUkF4K3YwYmpkNmg4dlc4?=
 =?utf-8?B?Q2Jrdll3Y0hMUlBZY2FraENNYWt2ZGNnTkYzNVNQSHd5UVdsdXhINFkzZ1A1?=
 =?utf-8?B?SE51K0VPM1J0akc5czRzT0FXN2pIODJlQ3Rjc2c3OGtUSmZoMzZ3U0dVNGFy?=
 =?utf-8?B?Z3YzSmFLQ0hOZDVwQ2VFb0IxVG9DTkViZjRnRGloY0IxZUFhdiswK09CejBG?=
 =?utf-8?B?Sk05QTA4Q0d1V2Z0aUg0amIwMC9vbGlZUjgxSytqTHhuakhSTisvZXZqWDhU?=
 =?utf-8?B?WXhvUEQ5ekk5bGxxRWQ5RVZaNHBYbGhkK0VqZ3gzYkhrTXNFSU5yTDlkQjho?=
 =?utf-8?B?dSt1M214eWRKL251VlhveEtNajEvdEZ3dWwvL3ZVWTJ3NnI5SS9sNzg1eTd2?=
 =?utf-8?B?RnRuc09zNHJ0SXYyZXVrNGhYenhCWTdkcmovMUlkWHdleHJ5VElVem9BcllF?=
 =?utf-8?B?OENiaWk4MUQ1VkM0R3FlZkdrK29pZG9NT3FRc25TdFBsWGNUeXVzTng1UnNH?=
 =?utf-8?B?MVc3L1JzbmpRcGErZitHN0F6cEIxeHo4bHJOTFV1TVZuTkYwK0N2aEZWcjhv?=
 =?utf-8?B?ZForY2pvSForS0ZWcXJuMmZweENIMitVK3V5dVAwRjZpVjZCNW1UWFlybGNI?=
 =?utf-8?B?aXgxcnpTRi9YRFdnYk5ieHVvMXdNdGsvaWdMMTlsYm5UaDVvWnNOQnpRdjVC?=
 =?utf-8?B?YVlJSDdnNjgrZlJCWlV5ZG5qZHZtMW9aUElWUzM5Sk1qTlFScElTY1JYdzZz?=
 =?utf-8?B?Z1Z3OUtaTktaYlRZT2hrK0xhQXE2blRZcU0vNUhZRWpLb0JWNFVTQjRWNnAw?=
 =?utf-8?B?bHdSSTVzNXJ6ZU40d1c2YitvdXliK2hWSmtSUlllSmViUDdOWEo2Um9mOWhK?=
 =?utf-8?B?blN2bUFsTjQyenorWkVXQzhIM1J4WFRqM0IwaUs4NmI4TFkxSW9TMzZXcWVi?=
 =?utf-8?B?am9TL3FUaXZFcG5SajNFYS9sMHkydXFySlgrS3M0TFN6ODdHS1NUNi9LOHRz?=
 =?utf-8?B?enlVZUN0OWxEMURpalpJeEpNOVRXM2l2TkhqSU1ka2orTmNTVEMwY2Vjbk1M?=
 =?utf-8?B?TU83MUx6bHBVOEJWWFpDTFN6WlhrSDZQclFGUlltTmlvWDh2b01yS2lDVUFz?=
 =?utf-8?B?cW13ZkpmZlNPMWU2VWZZTTdGL0hwdjRvMXpIRnA3d3FHMm1HOGF3ZUovbTNI?=
 =?utf-8?B?ZXZseUdhblQrZzY0QlowaU4vNmRnekN3SzBWU2ZiRzF0RXdyY3doUUlneGdh?=
 =?utf-8?B?ZTNBQWtXVXUxVmI2R2I4RkVCYkpmUFVvZWo0VExreGVoSDFSWjVtdzEwN25p?=
 =?utf-8?B?NEdxYk5xTjA4SjVTVHNNMEl4Q29LeDNnZUNKWithaDBDWUxQZFZDd3h4a0pq?=
 =?utf-8?B?OWNZQ0lmODRRRmpvdlhvdzRDL0FNb1JGekdJYmVKWldEVnlJSzZKZktTK25J?=
 =?utf-8?B?aTMxdFVCK000emNiNWxtRldqWVFwWUUvMWVJdVJONTZPclA0SXkxemtXSlo1?=
 =?utf-8?B?a2hiSFpYaklhbktyL042TWlhWTNtN3lHQ0lTVDM2dzltbVBVb3VTaUh3V1F5?=
 =?utf-8?B?YkNOWVY0Ris2WDBrWWFoM1BQeEJQM3Q5c3U1SU80V2xrSlNDSlpDTnZGRTlO?=
 =?utf-8?B?OWlQUEhKSUxUZFc2dTB5QTdPZEFDcktaTy9FZU1oUUV4RDA1SjVxd2JZRW1r?=
 =?utf-8?B?WGw4b2YrcFJGUldibFByM3hyM3AvS0VGU2JFKytTZmZpcDYvT2RVa2djYXZH?=
 =?utf-8?B?THFRNG1zUFpjTFp6Vm04bGYvR2hEYjhLWTJzVU5pN0UrNHBIWHpCVEJ5WFpK?=
 =?utf-8?B?VWQ3cDdvbXM3cWRxZGRvWjQxVVg0U1l4a00xU2dwdmpzdDlrWWJNQWhkVHo1?=
 =?utf-8?B?NUNYZUJ4TFMwdXFnTGdCeCtWdHkzaHNsdTBCQVpUenJEWlhvQXdNSGFMaEh0?=
 =?utf-8?B?dmp3V0VmSXV1clcrWVFnV3ZVUTgrcXF6eEwyVUNuUkZKVEt3aTMyZEVyZTk1?=
 =?utf-8?B?ckVESkNieXFZYTdZOHp2UngxdWxSN1dGR2tBMGJmbXlCZnREajhIelpzSmh4?=
 =?utf-8?Q?eoW3zP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9CRUwxWDYvM2ptNjRuVFh2VGNudWoyWmt3Qnk0SC90MHRvY1M4d1VUOGl4?=
 =?utf-8?B?dkVxbmNGOHR3TS9mUytNTXFZVm1HaHlucFJuSEVwYlpFSzY0dEpYL0V6a0d6?=
 =?utf-8?B?MkxkRUJTaHlZOXNPUFhTbW1KWGxYOEJDdnBIVFFwaFU2enl0WHNiNnNBbUpW?=
 =?utf-8?B?N0o2Wk5zQWFiay96SWpjYWR2ci9uZjZFSzFJYlVZdkFSTVczS0hLV1hzWmtx?=
 =?utf-8?B?VG41NFFTbWwxZ3RubEp6ZXh4R3FzZHc3cCtBSjZtWTlKR3pQWXNmdWt0NEgx?=
 =?utf-8?B?Qk91WG5yTWl1SGQyQ3lHQzdQYitUVU1MQjFyVHBNL1BLQzFxajM5MkNDT3pG?=
 =?utf-8?B?YnlCblJhUWNuY1RpOVNPczhkcmdON0VSSTJ3VjN4OFI4bFJaRHJFRHdTUXBD?=
 =?utf-8?B?bjhxeFcwV3lEdGVDKzV6ZzJKNG1iUzdCV283Tzl4TUxSSllnQzNNaWQ1NEFG?=
 =?utf-8?B?dmZEZ2hrQUJLcFg2UWc4TW9EN2JNRXJIOTl5L0J4Wm03UDNVM1U3ckRndFZu?=
 =?utf-8?B?NUNWK3hiY0dZcXJ6MVk3TUFkUjZNWENKVUVRWFhVV2hFWUU1OVdVVDhCSDZr?=
 =?utf-8?B?UE9rNTAxVEplLzk1UHZsd1NyS1dpSHNIRmRqSllxUlp0YVJxQTdqRkNEckpM?=
 =?utf-8?B?TWMwN01YWHNWQWhrTWFJdUMxeERic0wwdVpIdTQ5ZnpzZWRXWUp0ZHZlOFcr?=
 =?utf-8?B?K1FmT0tIYjRkSGpYVXR4ZHl4cjdPbHlMOU0rbHRmSGFKTG9sckdFUWhmSUYx?=
 =?utf-8?B?Z0NQM2dPNjR0RWxUanQ1aDFDbFV6S2UvR3FKa3VQVjZGRUIzY2lwTTdJM0Nw?=
 =?utf-8?B?NnhTY09mM1AxdjhpWElVVHhQbzVzdnlrUERaa1k3eWhmaXJsMlYwVDdmOXhx?=
 =?utf-8?B?Y2dlajdvN3NRNmh5N2V2R2JDSVoxa2F4UWdwT2piZVc0V3dxQ3NaNkdyTWpB?=
 =?utf-8?B?RE11cHZvTWhSRDArZGJFTVg4UU53RnFtQkZFMWVwSytTYXA0cG9iVzdWeXRo?=
 =?utf-8?B?R0l1enZXdGZiUkxFOFdKSHpSZHVMQ3YvdjdGNmQzbUdXZkZlVXptQml2YmZk?=
 =?utf-8?B?WFE0d2kwUHJVOWdoNUJaUE4wMndoWE1DQWhmOUxlZ0FiOVJmTjdsSzN5dHZ6?=
 =?utf-8?B?RjJYTjdGNGlXejZRQ2dIQ2hESmlycjdkWURpMThUQUk2OEtaTkRrd201Y2dL?=
 =?utf-8?B?N3BaZEFmYjJnQS9NT1BUczFNYVdBZnpCSHdlbFErY09xdHJzR0hPa1k3NVh3?=
 =?utf-8?B?Y2NCc0cxVkoxcDJZYWpVWEgxSUtCMG02cE5HM093VFg3MEdUWVk1N0NjMzY5?=
 =?utf-8?B?MC9lRUtacE9TQ0k3M0MvQjUxblRKZXFvRlErRU5xckFRWk9ONEw2VCtaOWxm?=
 =?utf-8?B?UUNpYjlBNDBuY2M0TDFUZ1d6WnpwU0t0MDRqUEppTHpjM29xOUdESEg1TW5P?=
 =?utf-8?B?VXBERVhEOUlkVGhTeWRzeE05bUczODJQMUU3Yi9xOXZsdXhLVldJeUI3bFBk?=
 =?utf-8?B?TW9oYXd4ZEVTb1hXVFpXNXhWU0dpVjY5OUlNV2UvUEJyeTRzTDhFS0FBTmxC?=
 =?utf-8?B?ZTJtTklMcHNZYVpObzZqblFRc3JNbG9YdHZreGF1azd4YkJYMEZyWWY3SEM3?=
 =?utf-8?B?eldHR3NKWmtJOTR6OENXRThaQXVzOUpTdTdSQ2pPMC9Hck1QbHRTVG1kMXRT?=
 =?utf-8?B?aUYzWWtGODlJYnBVeTRVR29oWFdxdjhJV2hQTTg5d1F4bFdSUVVPdlRhbmFa?=
 =?utf-8?B?N2kzUU9zR0l6QnJhUzd5YUEwZ2dQK3JXV1o0OTNiN0UzenNTU3hvZHFLRFlU?=
 =?utf-8?B?ZFZYYm9yaGE1UXdwSUVXckpnaEQ2NGtWaDBLcGl1c0MyY1VpbnZLK2VuUWVF?=
 =?utf-8?B?US8xaEJzZ1U1aTF2K3dzeHZ3a1JUTVZqMThuTUFJL3FmWml0YzBsb1VRWitv?=
 =?utf-8?B?d3NjWDB5NmxqOUF6OUtBZHRaZTFPSmpyc2VqNzlhQVdJdlNKV1FOcG5ra2R6?=
 =?utf-8?B?eVFlT2s1cmpmYTgvMzN2U1ZSMDdhUE5hWDlKeUJCTFhUQkJ6RFV0OWJROERp?=
 =?utf-8?B?T1BCSjJBU3ZKOWhHdWRLWDEwTmRDMjlJRVI5UmRBNVRDRHJEcGZqOU9UL3Ex?=
 =?utf-8?B?UTViRFRQY3RqSXRzU0pSUG9hZ0psdW12d2h4anVPWjFKOTNXOElKQVVBVVpl?=
 =?utf-8?B?RmpqV1A1TnVXc2U2WitnMURlZWJ0NUZqeEprak1rZEFuNi9UMXJlTFYzaGtr?=
 =?utf-8?B?T3pXMmNQWGZ5bW9uU25mV05jdVphb1NXQzBiM0cxK2FIbytGcTI2dENscTA5?=
 =?utf-8?B?ZTdpSHJBZkcvSFJ1a0ZMTDR0NlR0QkJsTmhjNUg0RXhtdkFXZ0gzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433f4447-ef13-4e22-0186-08de6b187b4c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 15:56:42.7505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbZa0Fzjd2URfLlgvZcDXAKQ5EtCZ/eqhqvVBK0MeyC+RSRwSE3zuaKqqllDXda5XS8A2wTm9Qwyt+HJPC0Piw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5977
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7FA3137BDE
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:56:42AM +0100, Jan Beulich wrote:
> On 13.02.2026 05:02, Marek Marczykowski-Górecki wrote:
> > Hi,
> > 
> > After fixing the xhci crash, I hit another issue - booting with 236MB
> > initrd doesn't work, I get:
> > 
> >     (XEN) [    3.151856] *** Building a PVH Dom0 ***
> >     ...
> >     (XEN) [    3.593940] Unable to allocate memory with order 0!
> >     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
> >     (XEN) [    3.599884] 
> >     (XEN) [    3.602482] ****************************************
> >     (XEN) [    3.605272] Panic on CPU 0:
> >     (XEN) [    3.607928] Could not construct d0
> >     (XEN) [    3.610692] ****************************************
> >     (XEN) [    3.613463] 
> >     (XEN) [    3.616035] Reboot in five seconds...
> >     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
> > 
> > Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2899781755762f565
> > 
> > If I skip initrd, then it boots just fine (but dom0 is not happy about
> > that). 164MB initrd failed too, but 13MB started ok.
> > Just in case, I tried skipping XHCI console, but it didn't change
> > anything.
> > 
> > Host has 16GB of memory, and there is no dom0_mem= parameter. Xen is
> > started from GRUB, using MB2+EFI.
> 
> Hmm, yes, there's an ordering issue: Of course we free initrd space (as used
> for passing from the boot loader to Xen) only after copying to the designated
> guest area. Yet dom0_compute_nr_pages(), intentionally, includes the space in
> its calculation (adding initial_images_nrpages()'s return value). PV Dom0
> isn't affected because to load huge initrd there, the kernel has to request
> the initrd to not be mapped into the initial allocation.

Right, on PV dom0 we do not copy the image to a new set of pages, we
simply assign the pages where the initrd resides to the domain.  We
can't populate those pages in the p2m as-is, otherwise we would
shatter super pages.

I think the fix below should do it, it's likely the best we can do.
Can you please give it a try Marek?

Thanks, Roger.
---
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4fc..8e3cb5d0db76 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -343,7 +343,7 @@ unsigned long __init dom0_compute_nr_pages(
 
     for_each_node_mask ( node, dom0_nodes )
         avail += avail_domheap_pages_region(node, 0, 0) +
-                 initial_images_nrpages(node);
+                 is_pv_domain(d) ? initial_images_nrpages(node) : 0;
 
     /* Reserve memory for further dom0 vcpu-struct allocations... */
     avail -= (d->max_vcpus - 1UL)


