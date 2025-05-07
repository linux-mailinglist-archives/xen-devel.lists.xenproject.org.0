Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189EAADA12
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 10:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978346.1365161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCa4B-0000m5-Du; Wed, 07 May 2025 08:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978346.1365161; Wed, 07 May 2025 08:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCa4B-0000jg-Aw; Wed, 07 May 2025 08:23:47 +0000
Received: by outflank-mailman (input) for mailman id 978346;
 Wed, 07 May 2025 08:23:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCa49-0000jX-Fk
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 08:23:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2415::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95b1e80d-2b1c-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 10:23:43 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7148.namprd12.prod.outlook.com (2603:10b6:930:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 08:23:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 08:23:33 +0000
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
X-Inumbo-ID: 95b1e80d-2b1c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmcRAZXGCPXi1O/j7Jv2APu7InjTjRSOCQmuTU/I3dyCm3ksxZMGkjC/GM0eAjLrxwwFiHviXr54fLKeu/oNC3pcbKyMJ9LpJ0xBnT39tlCh5R/dEjw+WhdGJjK9k+5jvNFKqZhsVxBwee44ftcCJUT1qHpuyWLiE8Bq7U8cgF3dX7/AFkoU4Wx9X8majroNIRvCUFqOjCPccfN3CpJLYfY/tWq04MuI9lcO5XtPRLM9BKkGwVbi1wLA7zhjWA0TsfMqGkzTMICd6op/eMYv0ScFdltKaaHyQQWFFS3ZFIC2Hbr0iCBK0uZevLZSl9lmI235lydAhhjt4QFws8UX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJz+KNr4Z0BgcgfYez3DfAnWIh3q8h0/eL6abuPzapM=;
 b=X8m2UP+o4DE4Lt6xivbyG+P+UXXLwC0Pp+1+Yu4dkoo7A8NAhJ0Xpjn9zZtNLnVEwhzU7/OLQy8Dd+UlzmnRgBrS8sMVaxK6wtplxRUSKVt+gfUoaPJ8feM6+8dPy0Nigq8yvnIdJxgRDp8pJifUf7vaivsjK2ybDiLUKnxJbLHiCOfBUOSoluWpTAQsEw9ZXjBX+TDJCCkq7cM0dGQY5NvD1jWORh/Kjh3DHbP+MlN6ikHZk2FfrjZcGNjuWAAZ+WEpg0ptMVAIRTv5anAr/qUvg2NOo0ODljBN9VTo2y2JMD5YcXYXY6JFTImx12ce49TVeSXgnM2rfRSfNhd35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJz+KNr4Z0BgcgfYez3DfAnWIh3q8h0/eL6abuPzapM=;
 b=qdlEd5qPEoS7DHk3XITdBogZdhcfFxfa21YVM0jDvWsHVR28GsplrkPC7PWXeY8nHGVbSsCoZas7gwwyXJa2k/LwrWBn5kguT9GeuBbtROP+UPCDQuBxEzXmrnvnMp4sAhNFeM1ZCRbTdYNAGPWbFb+GBqq6DPG8GhF2xSmKXNE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHbsoVaTdJd8UN3wUOnIdqQLAHMILPFw6cAgAGFDQD//5+hAIAAii+A
Date: Wed, 7 May 2025 08:23:33 +0000
Message-ID:
 <BL1PR12MB5849795B451D8B300A5B1D7FE788A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-6-Jiqian.Chen@amd.com> <aBoelpSu4xmJH2Eo@macbook.lan>
 <BL1PR12MB5849A46E40F2933464294732E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aBsUGizTh8FCW_KH@macbook.lan>
In-Reply-To: <aBsUGizTh8FCW_KH@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7148:EE_
x-ms-office365-filtering-correlation-id: 2bf87b20-7add-4057-aa92-08dd8d407504
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2Jlc29aRnRqVTYxQUJWOFJaaE96bGlhbEJMZWh0M0JUNXdZSE9xNUd4M25o?=
 =?utf-8?B?L0NDaXEzLzE1cmVSZW1RYnhyT29WZHNtR3dhN3dpbmgreDRjK2JBR3kyMUkz?=
 =?utf-8?B?NlcxUERMN0RIdmhmMHI4QWRrT1VFVjBveXBkeGp4TmxBSGx5ZmMrbmFhWGo3?=
 =?utf-8?B?SFh4TGJ5SWR3UEpYWVpyRDBzSGhxWGtZSllJUXZQNFBHMTZsRmtYRkxNUDkv?=
 =?utf-8?B?dDh0NUpsWWpTckFCQStBS1AycFVGcVlUMGw4MWVEcklrUy92Uit2YWVzakgw?=
 =?utf-8?B?U3oxU1FiRU9wSi9pU3JjWGdwWnpJYTFnclNlRmFVNFdGQlF1VjVmYWNaSGE0?=
 =?utf-8?B?NkllWDZ1TEVING10bTFhbFZJUXJ2YThkV0RjMmxjVkoxY0ZSU1ZvTC9tNDIy?=
 =?utf-8?B?dVhaRWNMaWNXcnVRSnYwYWhrVmdCYStZSEhzL3hsT1RjWStrVHZPUlNKb1Y5?=
 =?utf-8?B?dk1LdEJrTFR4VHFGMVFxZkRXTGJXMlFzWS9SbW9lbWFPZ3Y1R2N2dE9DK2or?=
 =?utf-8?B?TnBWKzdSQlRzL0FDYzdhQS93eW1NdVlwenJObHhQQlo1SDY4MUJYRWlRTjl0?=
 =?utf-8?B?T3JUdDFQVWJlNURPYVZPNjBDeUxQbGxJbTRPVVZoR3gwemdWTEU4L2g5cnkv?=
 =?utf-8?B?cU9zdlc0MGlpNEFuTDdlUG9oYTNkSlkyY3ZDaWJ2eG91ZEl1WHBLWllkVmtE?=
 =?utf-8?B?RVZWTHp6aDBZYzFjbmlqSHF0WHJYSmF2dFFMZjhCeXVwL0YxUWNId0VZbnps?=
 =?utf-8?B?VWVmNkdUODltaG9HMlEzZk9najB4WHQ2dk1oRjNrSjVCUnFHSm1NRFdsTUsz?=
 =?utf-8?B?Q1BkNUI1UmNZd3pvcUJhZEgvTWRmTS9xSFZuT2xtaVlMNUxoZUxpUm5kRkg2?=
 =?utf-8?B?SGlMNDdSVkNwS2xJeVphK1lrUWVxRzJDNHVnaE9TclR1a2ZQeVcvOXV1V1k0?=
 =?utf-8?B?SUVnOFhOdjl2U01hQjNBMS91c2JUS2ljTzlwYzZqRkg2SCs2MHVMZ29tRUdB?=
 =?utf-8?B?UG41Tjc5UFBlSG9sQkFKUzl3aWd4RVpsOHpRaWZUb2wyZkZYNkQzWjZOT0VW?=
 =?utf-8?B?YVRWek1UR29vbEQwaUp3dmZtb25WUVFKVjJmMEk3NEhwYUl3eEVnbXRieUtk?=
 =?utf-8?B?Z0ZQdEdXbHVtcG0yL3R4WWdJbnRITFFhOWR2WHZMU1ltWEgybnlWK3FKbExJ?=
 =?utf-8?B?Y2N4QVQ0bTN0SlVWRXhKeFgvL3UxOWx1UFM0dGpkWnhkRTJhaXVSaGxJSjNE?=
 =?utf-8?B?NncyRmpKaTdzTWhQVHJFMWhlS3g2SHZsSEJGTXB1c2JZNi8yRVRTQ3c3aHV2?=
 =?utf-8?B?Y3JkQ2Qyc29OYjlRTzd5T2FZMXZMTWc0VG1pRzgvdDg1Q2lYWndRN2R4UENl?=
 =?utf-8?B?MEVMcDRJd0x1SmhqVHRqTzNJYy9PYW1HTk1BN0JJbXg4V2MwcDNreHpoU0NK?=
 =?utf-8?B?OUF0SGdDODdLTGZGUzV6aDZweU1rQk1EOVU5WjVLMU5ISUYzMFE2TkFMNTI1?=
 =?utf-8?B?cC9YTWZTTEgvRloxeTBhNWNPTmRuaGV4YXhxMzlIUDg4RzN6dnAxdEFBZnZu?=
 =?utf-8?B?eVB5WHN5L0Y1L0w2YXJFeWxQSXhIY0NKTWlQNlAwbFFCenlvYnhsNytEajRz?=
 =?utf-8?B?SXVvUHAwaUNzUVdyYkJ5aG0ranN2L1FCT3ZodVZmc090UUwrL1FqaUFPT0Jp?=
 =?utf-8?B?d0xFdlh2aEtMYW9JNTJJTDBKeU9oTG5JdFJ0QXN4TUZBWWJqRkNjcWhvbEpo?=
 =?utf-8?B?bG0vbDFyWEtjZXRmOU9VOXpHLzA1LzFkNVFLMldXNTBXQWFCMXE0Qk82Zmk5?=
 =?utf-8?B?RXhKUGtUQmxtVzM0Wi9ISk5lMzFGWHpJOTllK2V1aUhZMHVhZFZwbXlHc0hi?=
 =?utf-8?B?bkliK2RxVkdST1lxNnZrNVdJQi9rR1VyNDNWNktaYnV3TzRUQWJKUGMrYkhi?=
 =?utf-8?B?S3h1UVdOQnRTWndVYlhaOW4rY0ttNzZCMVdBdVdlV1kyNXM0SUZUekh1cXZa?=
 =?utf-8?Q?XXTLAyAcoXJnGmLqMOEeNVDUUBXyHU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUF5VkZhbHFoNFRDQTFaUDhTZ0hpSGhjWEJ6a1ljdG0zejNKcWR4Sjhxbitj?=
 =?utf-8?B?MDJTdjdaYjNROCtXbEdvZXArOE5NQVQxRjBpbjdpYU1mK0ZISnFlR1FtZjA0?=
 =?utf-8?B?bUplNktFUWNrelRGb3o5T3c3UTdRRGczS1A0cGoydE1iYUVlNzhNTURVZ2t2?=
 =?utf-8?B?Qm1CNmZkR21pRW5MejU1dk9TSWRlZ282ZGZuYm5SZzFGeGQvN0JpcDBqUG1Z?=
 =?utf-8?B?K09XWVdOR2ZkZC83eWkzSDBnOVhZRU1CZVpwUHlhRWJ6VU5DM0Z1clFaK25n?=
 =?utf-8?B?d1UreURiNFQyMUdlUUFuRVNpWWFlVnZaSXEydldpbFhZNys1em1tQnZNYStl?=
 =?utf-8?B?eStqV29zMnZMcU1rTWw0NExzcXh6YTBiVUVIaTdkR0FtWEhQemQrY25DVFg2?=
 =?utf-8?B?dE9LU3JLT2tLc284TTB2MFBMWHk5OHorWjREUGRLTWNaVVY1R1BHaVdNSi8y?=
 =?utf-8?B?cTdoUi9BY1BmYU1FcHZ1dG1VRzhoUVdHanIvSEVmS0FKWmNpdWNKSzVzZjY5?=
 =?utf-8?B?Vm5FVEErTWZOYmViYnVRdXdUemY4QTI2T1JvcllwdGZrUGtkL1BCWnVYS3BM?=
 =?utf-8?B?SGZxbFJHdmVNbkVlN21xcm4yaWlscXZZZUV0eWNIM2ZjTnliVS9Rc1dmWTdO?=
 =?utf-8?B?S0lQUTNmSFlhejk1VzcrdUxVdlFMOHIxL1VnbkN0SSsya0lPRnNuVkM5YnBX?=
 =?utf-8?B?bFkvcGtVM3BiZlB1a3NBRVlSMHN2UGlzT2VwY09FYXdhUWxyTUp5WVJRdjhG?=
 =?utf-8?B?NzZRSExyMVA2ZnFvakJyK0R5U0wrbVNxTU5MRGJJWjQyczVUZkczcFNCR3pM?=
 =?utf-8?B?WWF5KzZQeGFweE1VSExsOTlITWdjRE9hdHZrZmVPTXVzaTdoTDlETVlHYlBW?=
 =?utf-8?B?V0RLelpUaXVxL3kvQUFxSlBlSnRXWU93M0tET3VVSDBrVHczOWVPdHVzN21C?=
 =?utf-8?B?TDQ0ZFVzaFdHQ3JMN0F1cGNKaXg0dmdseGFTVlBENFVUVmo4eXZpMG5tMnFl?=
 =?utf-8?B?bjRlSER3UWFlSU9nS1hrR0J0THhnRTBWL3RCS0pOVTdxcVBDVVVLNElEWDRS?=
 =?utf-8?B?SVFrOU9xSXJJWGh0MHQvT1lxcFBPNERqY0xueHNwMTlMTXlpRGEzSE1YbGk1?=
 =?utf-8?B?Vlo0dWg3MFhwMVV5ZTEvV1c1U05nc0pRbFNFd2g1cndCeUwrbGNNNXAyYWVx?=
 =?utf-8?B?bVAvVHBwUTdrN0FSaEcrbWVxV0hPODhLRnh6VTIzNHlOVlJ5UTl3Q3lkWitT?=
 =?utf-8?B?aHZLSG1oZGwzYzhpcjJSY1FxU0cxTi9IVS9Tc2FjYU5LZjdCN3JZK0g5bXk1?=
 =?utf-8?B?OUh6VEVxQ1BMeWVWdHFKUy9GRXRwckNjQnN1dm9oMVJHVElickJwUnNqY3Ix?=
 =?utf-8?B?QU96cHdXcFFmRzRQNWpUakl1YlVGSzNrd2pZdlFqck5jZjFSdjU0dGxIMEh3?=
 =?utf-8?B?Ynp1a0lxTFpGZ242ZDBWODBOUUVrNUJXYzh4WW4rVnZqd0JackR2RGd0RExI?=
 =?utf-8?B?TlFuTW03MWtzV2hIcnN5eDcvNHNGUGdicG16VzladmhwODdPZ0hOS0ZCVlJF?=
 =?utf-8?B?TkN3Y01kdjdjcVNhWTRkY2hxYXJvNnhuUUVaeVFYSmpnb3RyNlRxaHl3TGZJ?=
 =?utf-8?B?SXNhcml5eDI4eG5KRnorV0MwdHl6Wlcwcms5WXJmR1psZm5HaGRqQlhZdzBm?=
 =?utf-8?B?VXB6Vk00N2drLzZKL0h6WjdvYUZnQUNDN2R5UnY3OTJValdkaDhzVk92K2Qy?=
 =?utf-8?B?VEZOUUJoNTVHNVRHS01ueTdGNXJ1YmNCQVpRMjE3Vzl2UnluTEV4eElzWUZU?=
 =?utf-8?B?ekZVWUNLbHl5Y3RrL2RaYUdneGZGc3V4L0NNZFcza1R1blpjRUF6TnI5QlF2?=
 =?utf-8?B?NzNKME8wd3U5TyswcW9yNVo0dUh4VjV0R0FnU2RhU1VXNHlLRFZkcjdUYTVJ?=
 =?utf-8?B?aEJBQUs1Q1NCd2d1cXdBUFltc2dUZWNRSldBMGkrMjI0MTlheGVtbGNpNVlm?=
 =?utf-8?B?ZDFSOG96SGMySkdQMzI5cndNcVpQK3pvZU9aZSt3a21RT0JOS2hvNS9FTHk5?=
 =?utf-8?B?bW42NkxEM2xnYk8rcHZHdFFBbFZya2d1ai9IL3pUcjRlSjFVclNiOUljYUNo?=
 =?utf-8?Q?oqB4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <006322F6C330844CA84A800F5A732045@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf87b20-7add-4057-aa92-08dd8d407504
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 08:23:33.6796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R1Df61iMTyOQZScgzymgNAr4y7faFWr6+6LsIKdySsqstxekrBj57M3YqtBaDX059028129zwP8NlyH49O/L/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7148

T24gMjAyNS81LzcgMTY6MDQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwgTWF5
IDA3LCAyMDI1IGF0IDA1OjU5OjUyQU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9u
IDIwMjUvNS82IDIyOjM3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE4OjU3UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pg0K
Pj4+PiArICAgICAgICBpZiAoICFpc19leHQgKQ0KPj4+PiArICAgICAgICAgICAgcG9zID0gcGNp
X2ZpbmRfY2FwX29mZnNldChwZGV2LT5zYmRmLCBjYXApOw0KPj4+PiArICAgICAgICBlbHNlDQo+
Pj4+ICsgICAgICAgICAgICBwb3MgPSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwZGV2LT5zYmRm
LCBjYXApOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlmICggIXBvcyB8fCAhY2FwYWJpbGl0eS0+
aW5pdCApDQo+Pj4NCj4+PiBJc24ndCBpdCBib2d1cyB0byBoYXZlIGEgdnBjaV9jYXBhYmlsaXR5
X3QgZW50cnkgd2l0aCBhIE5VTEwgaW5pdA0KPj4+IGZ1bmN0aW9uPw0KPj4gU2luY2UgSSBkb24n
dCBhZGQgZmluaV94KCkgZnVuY3Rpb24gZm9yIGNhcGFiaWxpdGllcyBhbmQgYWxzbyBhZGQgY2hl
Y2sgImlmICggY2FwYWJpbGl0eS0+ZmluaSApIiBiZWxvdywNCj4+IHNvIEkgYWRkIHRoaXMgTlVM
TCBjaGVjayBoZXJlLg0KPj4gSSB3aWxsIHJlbW92ZSBpdCBpZiB5b3UgdGhpbmsgaXQgaXMgdW5u
ZWNlc3NhcnkuDQo+PiBTaG91bGQgSSBhbHNvIHJlbW92ZSB0aGUgTlVMTCBjaGVjayBmb3IgZmlu
aT8NCj4gDQo+IEkgdGhpbmsgYGZpbmlgIGlzIGZpbmUgdG8gYmUgTlVMTCwgYnV0IEkgZG9uJ3Qg
c2VlIGEgY2FzZSBmb3IgYGluaXRgDQo+IGJlaW5nIE5VTEw/DQo+IA0KPiBNYXliZSBJJ20gbWlz
c2luZyBzb21lIHVzZS1jYXNlLCBidXQgSSBleHBlY3QgY2FwYWJpbGl0aWVzIHdpbGwgYWx3YXlz
DQo+IG5lZWQgc29tZSBraW5kIG9mIGluaXRpYWxpemF0aW9uIChpb3c6IHNldHRpbmcgdXAgaGFu
ZGxlcnMpIG90aGVyd2lzZQ0KPiBpdCdzIGp1c3QgYSBuby1vcC4NCkdvdCBpdC4gSSB3aWxsIGp1
c3QgcmVtb3ZlIHRoZSBjaGVjayBvZiBpbml0Lg0KDQo+IA0KPj4+PiArICAgICAgICBpZiAoIHJj
ICkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+
Pj4gKyAgICByZXR1cm4gMDsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiAgdm9pZCB2cGNpX2RlYXNz
aWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gIHsNCj4+Pj4gICAgICB1bnNp
Z25lZCBpbnQgaTsNCj4+Pj4gQEAgLTEyOCw3ICsxNTgsNiBAQCB2b2lkIHZwY2lfZGVhc3NpZ25f
ZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiAgDQo+Pj4+ICBpbnQgdnBjaV9hc3Np
Z25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiAgew0KPj4+PiAtICAgIHVuc2ln
bmVkIGludCBpOw0KPj4+PiAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKnJvX21hcDsNCj4+Pj4g
ICAgICBpbnQgcmMgPSAwOw0KPj4+PiAgDQo+Pj4+IEBAIC0xNTksMTQgKzE4OCwxMyBAQCBpbnQg
dnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiAgICAgICAgICBn
b3RvIG91dDsNCj4+Pj4gICNlbmRpZg0KPj4+PiAgDQo+Pj4+IC0gICAgZm9yICggaSA9IDA7IGkg
PCBOVU1fVlBDSV9JTklUOyBpKysgKQ0KPj4+PiAtICAgIHsNCj4+Pj4gLSAgICAgICAgcmMgPSBf
X3N0YXJ0X3ZwY2lfYXJyYXlbaV0ocGRldik7DQo+Pj4+IC0gICAgICAgIGlmICggcmMgKQ0KPj4+
PiAtICAgICAgICAgICAgYnJlYWs7DQo+Pj4+IC0gICAgfQ0KPj4+PiArICAgIHJjID0gdnBjaV9p
bml0X2hlYWRlcihwZGV2KTsNCj4+Pj4gKyAgICBpZiAoIHJjICkNCj4+Pj4gKyAgICAgICAgZ290
byBvdXQ7DQo+Pj4+ICsNCj4+Pj4gKyAgICByYyA9IHZwY2lfaW5pdF9jYXBhYmlsaXRpZXMocGRl
dik7DQo+Pj4+ICANCj4+Pj4gLSBvdXQ6IF9fbWF5YmVfdW51c2VkOw0KPj4+PiArIG91dDoNCj4+
Pj4gICAgICBpZiAoIHJjICkNCj4+Pj4gICAgICAgICAgdnBjaV9kZWFzc2lnbl9kZXZpY2UocGRl
dik7DQo+Pj4+ICANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94
ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+Pj4+IGluZGV4IDlkNDdiOGMxYTUwZS4uOGU4MTViNDE4
YjdkIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+Pj4+ICsrKyBi
L3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+Pj4gQEAgLTEzLDExICsxMywxMiBAQCB0eXBlZGVm
IHVpbnQzMl90IHZwY2lfcmVhZF90KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLA0KPj4+PiAgdHlwZWRlZiB2b2lkIHZwY2lfd3JpdGVfdChjb25zdCBzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDMyX3QgdmFsLCB2b2lkICpkYXRhKTsNCj4+Pj4gIA0KPj4+PiAtdHlwZWRl
ZiBpbnQgdnBjaV9yZWdpc3Rlcl9pbml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+Pj4+IC0N
Cj4+Pj4gLSNkZWZpbmUgVlBDSV9QUklPUklUWV9ISUdIICAgICAgIjEiDQo+Pj4+IC0jZGVmaW5l
IFZQQ0lfUFJJT1JJVFlfTUlERExFICAgICI1Ig0KPj4+PiAtI2RlZmluZSBWUENJX1BSSU9SSVRZ
X0xPVyAgICAgICAiOSINCj4+Pj4gK3R5cGVkZWYgc3RydWN0IHsNCj4+Pj4gKyAgICB1bnNpZ25l
ZCBpbnQgaWQ7DQo+Pj4+ICsgICAgYm9vbCBpc19leHQ7DQo+Pj4+ICsgICAgaW50ICgqaW5pdCko
c3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4+PiArICAgIHZvaWQgKCpmaW5pKShzdHJ1Y3QgcGNp
X2RldiAqcGRldik7DQo+Pj4+ICt9IHZwY2lfY2FwYWJpbGl0eV90Ow0KPj4+PiAgDQo+Pj4+ICAj
ZGVmaW5lIFZQQ0lfRUNBTV9CREYoYWRkcikgICAgICgoKGFkZHIpICYgMHgwZmZmZjAwMCkgPj4g
MTIpDQo+Pj4+ICANCj4+Pj4gQEAgLTI5LDkgKzMwLDIwIEBAIHR5cGVkZWYgaW50IHZwY2lfcmVn
aXN0ZXJfaW5pdF90KHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4+PiAgICovDQo+Pj4+ICAjZGVm
aW5lIFZQQ0lfTUFYX1ZJUlRfREVWICAgICAgIChQQ0lfU0xPVCh+MCkgKyAxKQ0KPj4+PiAgDQo+
Pj4+IC0jZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfSU5JVCh4LCBwKSAgICAgICAgICAgICAgICBcDQo+
Pj4+IC0gIHN0YXRpYyB2cGNpX3JlZ2lzdGVyX2luaXRfdCAqY29uc3QgeCMjX2VudHJ5ICBcDQo+
Pj4+IC0gICAgICAgICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEudnBjaS4iIHApID0gKHgp
DQo+Pj4+ICsjZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQKGNhcCwgeCwgeSwgZXh0KSBcDQo+Pj4N
Cj4+PiB4IGFuZCB5IGFyZSBub3QgdmVyeSBoZWxwZnVsIGlkZW50aWZpZXIgbmFtZXMsIGJldHRl
ciB1c2Ugc29tZSBtb3JlDQo+Pj4gZGVzY3JpcHRpdmUgbmFtaW5nLCBpbml0IGFuZCBmaW5pPyAg
U2FtZSBiZWxvdy4NCj4+IGluaXQgYW5kIGZpbmkgc2VlbXMgbm90IGdvb2QuIFRoZXkgYXJlIGNv
bmZsaWN0IHdpdGggdGhlIGhvb2sgbmFtZSBvZiBiZWxvdyB2cGNpX2NhcGFiaWxpdHlfdC4NCj4+
IE1heWJlIGluaXRfZnVuYyBhbmQgZmluaV9mdW5jID8NCj4gDQo+IE9oLCBJIHNlZS4gIENhbiBJ
IHJlY29tbWVuZCB0byBuYW1lIGZpZWxkcyBpbml0IGFuZCBkZXN0cm95IG9yIGNsZWFudXANCj4g
KGluc3RlYWQgb2YgZmluaSksIGFuZCB0aGVuIHVzZSBmaW5pdCBhbmQgZmRlc3Ryb3kvZmNsZWFu
IGFzIG1hY3JvDQo+IHBhcmFtZXRlcnM/DQo+IA0KPiBJIGRvbid0IHRoaW5rIGl0J3MgY29tbW9u
IGluIFhlbiB0byBuYW1lIGNsZWFudXAgZnVuY3Rpb25zICdmaW5pJy4gIEkNCj4gdW5kZXJzdGFu
ZCB0aGlzIGlzIGEgcXVlc3Rpb24gb2YgdGFzdGUsIGl0J3MgbW9zdGx5IGZvciBjb2hlcmVuY2Ug
d2l0aA0KPiB0aGUgcmVzdCBvZiB0aGUgY29kZSBiYXNlLg0KT0ssIHdpbGwgY2hhbmdlIHRvICJp
bml0ICAgIGNsZWFudXAiIGFuZCAiZmluaXQgICAgIGZjbGVhbiINCg0KPiANCj4gVGhhbmtzLCBS
b2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

