Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101BF95A06F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 16:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781215.1190757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgmgs-0003jw-Nz; Wed, 21 Aug 2024 14:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781215.1190757; Wed, 21 Aug 2024 14:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgmgs-0003h5-Kt; Wed, 21 Aug 2024 14:52:02 +0000
Received: by outflank-mailman (input) for mailman id 781215;
 Wed, 21 Aug 2024 14:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYNs=PU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgmgr-0003gu-1Y
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 14:52:01 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [2a01:111:f403:2409::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9216ba6-5fcc-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 16:51:57 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 14:51:47 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 14:51:45 +0000
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
X-Inumbo-ID: e9216ba6-5fcc-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgYvGeBdTmpWDm+G+fQLbOvs2fgjPz56iII2XX+iiV+hIlT8VuXzcgpcpkn5eT1gOcZBQH9GvLIyLf7a++LVBpNc9KRXAIInTRzF/VHCi9wx4aQjokjkqGXqTFiQR0Ps467THrK8SCXR98av9wNwNkCsU+N189bMR0qwhX076kcwLzw5wdqpGPqMzH00Sh/qnuE8W3nIPQHLHWt2dNOSdXrXFPPY+4ODr5dUIFJZqKB80JIyxycSusmJiR7OUvvcsw0S0BSHyuyhox+hbORhVrpfGWADHk1wTXZ9YDqvQbIwiaK8lxTnpbulpLKPfavzSyS3G6X+uHavAAaBlEmdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg4ZFM6gKZ3xBxxDQNmOY9dRJCqdzaYEwg06g8ycGbc=;
 b=gqsiNozrE8zhzew1MlerhkDrTANGbfLYoU4yh/7vALrKCj8FHYEeGnGrkOjz/w22vVi6o6sit1ldw9Tyn5qvIzR2zsDxp4B4tZdlLXaRTxJUrF9VGhhb8exJysSJnk1en43Uyigz+9T3ll7jZqqwJOruNtMbZJvwXJvpFD1SLOnV0OahDIOlSHCqMUuHBR3EYEIuSaIPAOjGjnIeaFHEh2YK0rQ2sN9ULYPb1asrGH9kE1L7J/eFH3PgR0keLfTO+cmyY8PGFrjqwarxmIGoxsJi1bQBZ7uVBFSZVTJktlz42IrCmEQmGbZXOTNAB9GrcfNN408q52f65lB1ZIDFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg4ZFM6gKZ3xBxxDQNmOY9dRJCqdzaYEwg06g8ycGbc=;
 b=UHjPSqxiGtSuBpEsFdTgsiBez1iyY6NPIWNzLnaYqDg6IToJQbQpnIsTozUjgTFS5IVqHyoSECkfQjqWyIuHVZg3sj8ZH9UTYrPChAuLlfkCHEHI9RYR7c35y+fCQsX/X7qPeOuhYl8ka9OylbOEPRh6v9N6WoOL2YBB99m6WhQ=
From: "Halder, Ayan Kumar" <ayan.kumar.halder@amd.com>
To: "Charles-H. Schulz" <charles.schulz@vates.tech>, xen-devel
	<xen-devel@lists.xenproject.org>, Xen Project Advisory Board
	<advisory-board@lists.xenproject.org>
CC: Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Setting up the Xen Communications Team
Thread-Topic: Setting up the Xen Communications Team
Thread-Index: AQHa8hy4XFDLZqdmk0S+qmGEw+aHmbIxzoyk
Date: Wed, 21 Aug 2024 14:51:45 +0000
Message-ID:
 <PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2@PH8PR12MB7326.namprd12.prod.outlook.com>
References: <e56ff82c1a1d7398a5b38784fc84a7adf51ec918.camel@vates.tech>
In-Reply-To: <e56ff82c1a1d7398a5b38784fc84a7adf51ec918.camel@vates.tech>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7326:EE_|MN0PR12MB5715:EE_
x-ms-office365-filtering-correlation-id: 3cabe7cb-7f2f-4588-d0fe-08dcc1f0c6e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NTAxczNLbTZyQzZHSTlMVXlOTnNpS1U5ZlBlUThWOTNyd0FBTCtpTkpSTTVY?=
 =?utf-8?B?bGxnTTVPOXVUUHVUTlFKVXQ0RlNkMEgvc1FsRnRtc0UvNTdhU05vTkNPZHY3?=
 =?utf-8?B?c0RJRzdTS0o4b0ZzM2FNT3VPdVZyZnByQWYrSnM3UVBEVDJ5bmpiM2xLM2RQ?=
 =?utf-8?B?bDdoQ3B1eWc4dk9uV3IxaDBsejlxOEhjUjAzMEJDc3c4ZUVNVVlmQWJ6S3hs?=
 =?utf-8?B?VEZSNjB3NEFhY0dBZHJ2S2lGTGwyb2RxWVVLUHN5TDR2bkZwaTVINEN0bUNW?=
 =?utf-8?B?Z1o1UlZNdUZKVkhWcTlsSEdaM01jVEJpS3FSQ3RLOFJ5WElUSHdDdE0zeTB4?=
 =?utf-8?B?RWVTUG16emJlS0pQcHhEdWxSZFBIUnNzRExjSVhzQkJUNjdiY05FNFF0Um00?=
 =?utf-8?B?NEFOYnNHYkdkK3IvK1dNSXBHRm9IOXcxeGxmZVNiY29yT1dnN20xZG1pNEZ4?=
 =?utf-8?B?Zjg1OXBQWnhCby90cGFQVERGQWhMWTZlSEo0a2VwVDJTUWd3eHZWTEZCVGpi?=
 =?utf-8?B?OTltQ3RvM0x1K0FyREk5RzNqRlQ1ZjhXanZUSnFIbEg5VEdtRE1JQ2hjbjhj?=
 =?utf-8?B?c3hzZVhUcEdicGhMdUZIYXI5bzVaR2VFNENlYmFtNEMxdkpuZWxXZkVEWGdX?=
 =?utf-8?B?OUNhaVUvOHpTaTFWN2FXY05nMnpRK0JPUFAzL3U2Q1ZlTmpQS0gvbWpZclFv?=
 =?utf-8?B?b2xpSmpxMWNjcUt6N2VTWHRVK2FGeVZpS2tYdUx3Qld3dlZxMTJOa0VlbXZR?=
 =?utf-8?B?TGNzcm1icXVWNm5wYnJMUG5PZjJSSzFGaFRvZk5XSllqNklVT3Q5QXc1bndE?=
 =?utf-8?B?Zkl5bUhUTmprR3JZckt4YlNyd0VyRXBKQjBsVWU2UzJ3N0xqOTR4cU9oVVhI?=
 =?utf-8?B?WlA0akVjVWRaR2p5TUZrbEhyOGMyYU9NaDYvWHliam51UlF4Wm5Vck5iZ3FN?=
 =?utf-8?B?UHFzNytTaE5neFVCdjBZSm9iM2swamVKN3pFQTdJajI2aFphWTdNOGJ4cysx?=
 =?utf-8?B?a0Q5YmpTSkFPQXdmOE9rVzVPY3dhV1pRYUZTYkNFOG1XOW94L0FHaGkrZmJX?=
 =?utf-8?B?MTBNOE5EeTYyd0c2Y3cwSTRGZHJvdU1obWpHSEN1UEp1UDNrdENDTUk4VUp0?=
 =?utf-8?B?RzBGMXlvdXlxTXYyNFcxRUt5d09UZWZGOUEwZmVKMERaV2YvZmY1UWgzcEdk?=
 =?utf-8?B?MFhUeFVPNk9MdFZhOVlJYVFUTW1JV0JJekJ4Y1Zrc090SUtOVFJ3K2xFc1I3?=
 =?utf-8?B?NmpnNTY2VWw5UytWZ2NEWFJPQkQwb294RU54WFp5TWJoR1Q1TllaRG9pbWJD?=
 =?utf-8?B?ZnREVWFJSURFWWRBYmM3SGorcGJtZHZUZWZpZ1FJODg3aHNXay9Ma0hUWUIx?=
 =?utf-8?B?bEVzNDJhREtzYnQvaVFKeThud09lZnVKSmtWM3pWaDZtSlE5VGZLY29pNEZU?=
 =?utf-8?B?Y2EvLzhodVo1Q0xRUWRxd2piRG9MbXpYQVF3dW5ZMkFIdHFUZnpZdjNDN3lz?=
 =?utf-8?B?SytlTEEzdk5PZlhBNUFhVWR0QkpKdEJoQXNNb3JBd20vbUZpNDRoOFhuUDFu?=
 =?utf-8?B?ZmFzNGw5VXRJT24zdzVqV2FpdXBnYjZoL2thV09YS3UvVGpUV25UdEhHRFpY?=
 =?utf-8?B?SUYzSWNXejhBVW5KZ1NHUVcvcGtSOVM1alRXM2Y4YjErM2tKUnhVR3huNmwy?=
 =?utf-8?B?YXBFcm9XOEpRWEVJOENkelRzTGQzNTlMM0FQNHE5NU51cmJWLzNhWU0vU0I1?=
 =?utf-8?B?azVtaU1hbGtBYVQzNEhId09KSHNsdmljKzVxODNEeVM4VVg2ejRsbFZCQXI0?=
 =?utf-8?B?R3F4MXFPUkhEVy9IVkVYcXpZeENHQVR6N0tPUmhRSXVSK0wra0YxSEIyMHhm?=
 =?utf-8?B?NWtETFRuc0hFUGNNb1JhN0w2RlFDVTFabm1LRmNPMGtNSEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmpvbUJmY1o3NzZWeURyZUgxanpYT2FMN2U3NUY5M2t2R2E1MnVCamJWUm96?=
 =?utf-8?B?VU1ydEdxdHd4OGtwS0dYZjB4NlBLbDBsMEdHdElyNFlpbFFCNERBZ05aMXI1?=
 =?utf-8?B?RWpTZS9ZTmJGSWVkYnR2THJ3SHdFZVFGL1NGWEptdWp0UVJoaDdwSWIwYnBM?=
 =?utf-8?B?dVZmdjF3ZTREMVMwODVGTVI5SWc2R0owK0EzQStaWWtiamR2RHIxd3lIUDdI?=
 =?utf-8?B?bncxWWk0MkJBV0hnTzBkTHdKSTJmaG1zcXFTNEZjQVB2aWtpN3ZUTk01MWEy?=
 =?utf-8?B?cDloSGxzWWgzOVg2MVFNZkpwcDhEZnpQb3M4L0NDY3VtN2FsRC8yU3BUOUc4?=
 =?utf-8?B?citFY2JyUHpTQy8wdWNXa05LNEk1cDJxZzJKZlk3eFFLTno4UmE2M3dVeVdw?=
 =?utf-8?B?WmJNSnpyNmNXbC9zcDdZZGdaelBzbEoxOFRRbVhETEdoQVIxN1pKVFhEWDlw?=
 =?utf-8?B?QndBVHhEZlhFWTlwNmZLSERxaTc4Z3VRVEVDODRKVFJSS0Z3aVhpampMQWM1?=
 =?utf-8?B?ekxETE9SZ3BsbHBmalBBbWlzUWZYNy96K2g2UkVuQlk0MURIT09iV2FUQzJz?=
 =?utf-8?B?ZlVZWHRtVDNXY2ZrQWdvV296WmlveTZzSC9aWmpvbFNYTVBObHg2a3dvcHk4?=
 =?utf-8?B?VFdNZVcwcFlCTDVJcnRlQkFvZ2VWN3RIeUFWNGRNZjh6WmpLWUpINHhlYi9X?=
 =?utf-8?B?Z29BL2RzZjRYMFlxaTlsTmJ2TThEZk4wOUk1SmpPQThWMWZNL2ZVckVFelVx?=
 =?utf-8?B?Mml6d25tUGE0dmp3d1MxMXJXTzNFRVVIUG8vaEE5U2svekNyUkh1TkdLMXha?=
 =?utf-8?B?MHlGNGdscFdRajlaOXYxQ2tQWmttdFhLMWUwTGhVSU1ReWoraXhhQUxzTUM3?=
 =?utf-8?B?aG9UR2crYmRoaFNxRFNIWUpPMzZEZFF1VVA3RzlDTXdvMDYyTFZQRm5KQ2tl?=
 =?utf-8?B?SUNZY3NzVVU3OHFURkxaL0tEbWNUMFVGUllHY0FhTmt1RHBkanZtTGRNYVBl?=
 =?utf-8?B?TGVWcURyTXhFTzhaQU8wajFabkplTFpML2prWmVCVEM4ZkNsTE5sKzZZLzYy?=
 =?utf-8?B?TkZ0ZitIdDAxZytNTXBnQ2FmN0xvck0vWFZuZ0toMzlyWHpKV0NOcjJBWTQ0?=
 =?utf-8?B?OHhGa1RsaTZrcGM1UFlQMjMxbTJLcXZ2VitSOGx6STMyZXlJV2F0T0g3SDBm?=
 =?utf-8?B?emZFSXhPOGlHMXVyazFnUERUVnNPTTN2b1lyZmwxM3pIeENUd2xHdXpOVER3?=
 =?utf-8?B?R1dEOUZJcURMNUllbENndTlmZG05T0pVK21HdFB0UHpqUU9nVXRRSnhnRENH?=
 =?utf-8?B?aEF3c2JyOUxaTkdnS21qYjBBNlV6MmxRR0FmT1c3ZHo5Z3RnclBPN2ppQnk1?=
 =?utf-8?B?dm1vR2hOL0R5YzlqS3ZVUTdsWDZNWGIraXBVUFlOQ0R4TXJENGFSdk1hK05S?=
 =?utf-8?B?NmcwRHRBcWtCWGNscmlDQjBJd3g4KzVmUDlhZlFxYTlNZU5BeUR4RDBBdEF1?=
 =?utf-8?B?UmJrTDE3TU9ZYmZyTk9qNVptMVFjcjNBV2dFTjhJY2ZBNHBTWVdqQ1lkZndm?=
 =?utf-8?B?VUpIbm9sbnBlMndCbWFoak5oMmhYK3VQck9DdnJzb21zZDN0cU9NWTlaVUlR?=
 =?utf-8?B?NUdTaDNCUzZrMVRsdWRNZW9ESVhEU01ubXlmVDJtV3lBd0pqaTh3QVlxSnJC?=
 =?utf-8?B?VHJTdFlGUWgzQlpaRk5VVVVEWkhMVkN6U1U5S1VocnRWNXowR0RnNGFPVHdS?=
 =?utf-8?B?bnprMXkrUEV4U1hVblU3a0paZG1kM3Q1Y3BNWlZoSVc5dEhIbVBqU3pmcXo0?=
 =?utf-8?B?MThEeTdxV2g0YXVGUXBRSXgraUlPUG5FbkM3RU15eGFCa1pLMStHVlNUeXVV?=
 =?utf-8?B?eDZMdEdCRzBIb1B2Sm9SNlNTNWR4SFBvRzcwYTVXeWQwaVVPeGY1OFdUKzM5?=
 =?utf-8?B?YnBiZTR6bHFTenBLbDhXL2ZDeHZLNnFacmtLRUNxZENwcDZqTTAwSE5ZVmdC?=
 =?utf-8?B?akxoVGtuSGJTN000aTJhK25VekJTaUFUeUdsa0RDRmxONGNxeC9iU3QvbVdW?=
 =?utf-8?B?U3pobGZsSTZrK0Q3QzlIMU43TDI1MDFJYVRzZ3BnYnowUUhqMVYzSUV6ckFB?=
 =?utf-8?B?QVVIdit2d0tqWFI3Rkw0VERaU3hDQWRTTmJBR05vYWVVQ1EwU1ZEVUpURWZP?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2PH8PR12MB7326namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cabe7cb-7f2f-4588-d0fe-08dcc1f0c6e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 14:51:45.2699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8rhF4NYMXEpUX42OJSjoQdH1aYOI2xRXwWZQA8K216aM4RkLgoyZhoKdiPHSDhBFW/8lUPqFpysNy/xBO4T0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715

--_000_PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2PH8PR12MB7326namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ2hhcmxlcywNCg0KVGhhbmtzIGZvciB0YWtpbmcgdGhlIGluaXRpYXRpdmUuIPCfmIoNCkkg
d2lsbCBiZSBpbnRlcmVzdGVkIHRvIGpvaW4uDQoNCktpbmQgcmVnYXJkcywNCkF5YW4NCg0KRnJv
bTogQWR2aXNvcnktYm9hcmQgPGFkdmlzb3J5LWJvYXJkLWJvdW5jZXNAbGlzdHMueGVucHJvamVj
dC5vcmc+IG9uIGJlaGFsZiBvZiBDaGFybGVzLUguIFNjaHVseiA8Y2hhcmxlcy5zY2h1bHpAdmF0
ZXMudGVjaD4NCkRhdGU6IE1vbmRheSwgMTkgQXVndXN0IDIwMjQgYXQgMTA6NDYNClRvOiB4ZW4t
ZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4sIFhlbiBQcm9qZWN0IEFkdmlz
b3J5IEJvYXJkIDxhZHZpc29yeS1ib2FyZEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCkNjOiBLZWxs
eSBDaG9pIDxrZWxseS5jaG9pQGNsb3VkLmNvbT4NClN1YmplY3Q6IFNldHRpbmcgdXAgdGhlIFhl
biBDb21tdW5pY2F0aW9ucyBUZWFtDQpIZWxsbyBldmVyeW9uZSwNCg0KSnVzdCBsaWtlIGFueSBt
YWpvciBGT1NTIHByb2plY3QsIFhlbiBuZWVkcyB0byB0YWtlIGNhcmUgb2YgaXRzDQptZXNzYWdp
bmcgYW5kIGNvbW11bmljYXRpb24uIFdlIGFyZSB1c3VhbGx5IGZvY3VzZWQgb24gc29mdHdhcmUN
CmRldmVsb3BtZW50LCBob3dldmVyIHdlJ2QgbGlrZSB0byB0YWtlIHRoZSBvcHBvcnR1bml0eSB0
byBjYWxsIG9uDQp3aG9ldmVyIGlzIGludGVyZXN0ZWQgaGVyZSB0byBqb2luIHRoZSBzbWFsbCB0
ZWFtIGluIGNoYXJnZSBvZg0KQ29tbXVuaWNhdGlvbnMuDQoNCldlIGRvIG5vdCBleHBlY3QgdGhp
cyB0byBpbnZvbHZlIGEgbGFyZ2UgYWRkaXRpb25hbCB3b3JrbG9hZC4gSWYgeW91DQphcmUgaW50
ZXJlc3RlZCBpbiBqb2luaW5nLCBwbGVhc2Ugc2VuZCBhIG1lc3NhZ2UgdG8gS2VsbHkgb3IgcmVw
bHkgdG8NCnRoaXMgZW1haWwuDQoNClRoYW5rIHlvdSwNCg0KLS0NCkNoYXJsZXMtSC4gU2NodWx6
DQpDaGllZiBTdHJhdGVneSBPZmZpY2VyDQpWYXRlcyBTQVMgLSArMzMgKDApNiA5OCA2NSA1NCAy
NA0KDQo=

--_000_PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2PH8PR12MB7326namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6QXB0b3M7DQoJcGFub3NlLTE6MiAx
MSAwIDQgMiAyIDIgMiAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFs
LCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCglmb250LXNpemU6
MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJBcHRvcyIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5
bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQXB0
b3MiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXtt
c28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0Ow0KCW1zby1saWdh
dHVyZXM6bm9uZTt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7
DQoJbWFyZ2luOjcyLjBwdCA3Mi4wcHQgNzIuMHB0IDcyLjBwdDt9DQpkaXYuV29yZFNlY3Rpb24x
DQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5n
PSJFTi1HQiIgbGluaz0iIzQ2Nzg4NiIgdmxpbms9IiM5NjYwN0QiIHN0eWxlPSJ3b3JkLXdyYXA6
YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6
RU4tVVMiPkhpIENoYXJsZXMsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6
RU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVT
Ij5UaGFua3MgZm9yIHRha2luZyB0aGUgaW5pdGlhdGl2ZS4NCjwvc3Bhbj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90
Ozttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+JiMxMjg1MjI7PC9zcGFuPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0O21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+SSB3aWxsIGJlIGludGVyZXN0ZWQg
dG8gam9pbi48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPktpbmQgcmVn
YXJkcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+QXlhbjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0O21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8ZGl2IGlkPSJtYWlsLWVkaXRvci1yZWZlcmVuY2UtbWVzc2FnZS1j
b250YWluZXIiPg0KPGRpdj4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
dG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwY20gMGNtIDBjbSI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWJvdHRvbToxMi4wcHQiPjxiPjxzcGFuIHN0
eWxlPSJjb2xvcjpibGFjayI+RnJvbToNCjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImNvbG9yOmJs
YWNrIj5BZHZpc29yeS1ib2FyZCAmbHQ7YWR2aXNvcnktYm9hcmQtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZyZndDsgb24gYmVoYWxmIG9mIENoYXJsZXMtSC4gU2NodWx6ICZsdDtjaGFybGVz
LnNjaHVsekB2YXRlcy50ZWNoJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5Nb25kYXksIDE5IEF1Z3Vz
dCAyMDI0IGF0IDEwOjQ2PGJyPg0KPGI+VG86IDwvYj54ZW4tZGV2ZWwgJmx0O3hlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZyZndDssIFhlbiBQcm9qZWN0IEFkdmlzb3J5IEJvYXJkICZsdDth
ZHZpc29yeS1ib2FyZEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyZndDs8YnI+DQo8Yj5DYzogPC9iPktl
bGx5IENob2kgJmx0O2tlbGx5LmNob2lAY2xvdWQuY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwv
Yj5TZXR0aW5nIHVwIHRoZSBYZW4gQ29tbXVuaWNhdGlvbnMgVGVhbTxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4t
Ym90dG9tOjEyLjBwdCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhlbGxvIGV2ZXJ5
b25lLDxicj4NCjxicj4NCkp1c3QgbGlrZSBhbnkgbWFqb3IgRk9TUyBwcm9qZWN0LCBYZW4gbmVl
ZHMgdG8gdGFrZSBjYXJlIG9mIGl0czxicj4NCm1lc3NhZ2luZyBhbmQgY29tbXVuaWNhdGlvbi4g
V2UgYXJlIHVzdWFsbHkgZm9jdXNlZCBvbiBzb2Z0d2FyZTxicj4NCmRldmVsb3BtZW50LCBob3dl
dmVyIHdlJ2QgbGlrZSB0byB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBjYWxsIG9uPGJyPg0Kd2hv
ZXZlciBpcyBpbnRlcmVzdGVkIGhlcmUgdG8gam9pbiB0aGUgc21hbGwgdGVhbSBpbiBjaGFyZ2Ug
b2Y8YnI+DQpDb21tdW5pY2F0aW9ucy4mbmJzcDs8YnI+DQo8YnI+DQpXZSBkbyBub3QgZXhwZWN0
IHRoaXMgdG8gaW52b2x2ZSBhIGxhcmdlIGFkZGl0aW9uYWwgd29ya2xvYWQuIElmIHlvdTxicj4N
CmFyZSBpbnRlcmVzdGVkIGluIGpvaW5pbmcsIHBsZWFzZSBzZW5kIGEgbWVzc2FnZSB0byBLZWxs
eSBvciByZXBseSB0bzxicj4NCnRoaXMgZW1haWwuPGJyPg0KPGJyPg0KVGhhbmsgeW91LDxicj4N
Cjxicj4NCi0tIDxicj4NCkNoYXJsZXMtSC4gU2NodWx6PGJyPg0KQ2hpZWYgU3RyYXRlZ3kgT2Zm
aWNlcjxicj4NClZhdGVzIFNBUyAtICszMyAoMCk2IDk4IDY1IDU0IDI0PGJyPg0KPGJyPg0KPG86
cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rp
dj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2PH8PR12MB7326namp_--

