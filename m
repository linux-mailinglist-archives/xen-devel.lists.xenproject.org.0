Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2E8C82AB
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 10:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723926.1129086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tCd-0006Rl-JN; Fri, 17 May 2024 08:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723926.1129086; Fri, 17 May 2024 08:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tCd-0006Oo-GX; Fri, 17 May 2024 08:44:35 +0000
Received: by outflank-mailman (input) for mailman id 723926;
 Fri, 17 May 2024 08:44:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7tCc-0006Oi-AR
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 08:44:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad6d69e7-1429-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 10:44:31 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 08:44:28 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 08:44:27 +0000
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
X-Inumbo-ID: ad6d69e7-1429-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fENSODaGdX7y8JfBve+NxUutd0XOEYDXq1VxKgBVfyYC5kxQHaz5ZIiyweXNwZX8JQkBxBQq2K8j1NJPOtDLCmxFL5sHSF9IPxCbPV1U7uKXeMCvkeWmNmvHzpkF5asTvIJwcqafBb8kwHbX70BxaNreVnR7TDpR86rjz1Y+qXANY3zC1AH79/NnSpC/PHI/7MKy3e8k6mbUnDBagNLwyRma2LGnTcKt7WYR+iE3GKWr/WAcQwmTGNcRbDemRoBMjuwQ3NU1gF/Y67iNKt/MThbV2LGj4d9nRLbRUtWjwRqXnEmAcJ/uGGqdthG32adq5n2X+EIHNTjCErklm3d68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtLpXzztWnQFiZ/jQJdTjRq4vRU5Crq+vtVahnSG6r0=;
 b=QPuiO1SRRBQeBBZQDNmggxM09hXY8OIQdLoRP5wd94ygQFnxzaKEAGlIlBjfT0TdVCIy9qMH7le1M4MkdRnpvkJW1J4i3LZLhFTp2G7qnvGDDIfYbgrHYjNJkQpkgCvY5tJ1gbCleHTPXng1dQUIBRDrLKA4sw3bMj7pqmcODqC1mB6c2qrDo4xqQbwCWHQnSFrL06rJKWdmaxJBgd262QE16dbVlhsSpMlxGVIkPXc9J1sw5IvLjMCqsZjZ0tP25tIiOQFZzmIGcqpwyjvcD/aztroHW9O6ryyqRdalWqBCuKTbG0/kaGMULtjtTFUYXZCTQAF0Xk1/9JBoqEAjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtLpXzztWnQFiZ/jQJdTjRq4vRU5Crq+vtVahnSG6r0=;
 b=u4e9+68JvqYaF1fMH8E+XsvPrX0am+NXdHgjJP65z7t22Dk0RZwyz6og9yorHJ58yLW7EVUPQHGzAvet5H0wILI2yedkjvGfS+s8j1DWwX6x3z4iDRYzjFw7lJtXLp0efTaQabNh0LH5Mwi8DJRwnBgJF92hZkHI0oPTweYnx0E=
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
Subject: Re: [XEN PATCH v8 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v8 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHap3bYQFs2wap0sUqpOSsc/BlazbGZ21MAgAG+yQA=
Date: Fri, 17 May 2024 08:44:27 +0000
Message-ID:
 <BL1PR12MB584994C1B2CBAD18E77A6D36E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-3-Jiqian.Chen@amd.com>
 <673505f6-2d0f-4ea7-ab9f-c132adce28c4@suse.com>
In-Reply-To: <673505f6-2d0f-4ea7-ab9f-c132adce28c4@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7220:EE_
x-ms-office365-filtering-correlation-id: f80294f1-04f3-4f1f-c3cb-08dc764d8fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?Yy8xNVE2NlVscXRxUVYrWVVqKzBHeVduN1lsdHk3L0ZETFVtTG1RQXRVY2Qz?=
 =?utf-8?B?ZTZtZU5NTzJOeElmOGh4U3l3VnpPeDJnSlUxWXdYS1ZwMWlzZHdZdHNqRlk2?=
 =?utf-8?B?RnlOOUtyL01oRzIyVlQ1dE1yTHpvNk1nQnc2dzZ2YngyQjBiQm9WQjlaeHB0?=
 =?utf-8?B?Vm5NRDlGdUhSMy9oWHlHeXhBS2l5Y3RQQVhTeVRGWFNHSytWNzkwSGF2cmFL?=
 =?utf-8?B?aE1GcnBaUHQxZGYySGdSTGJNdm1ST0huL1NlNitMdWlUSVlKbWtvd1haZklF?=
 =?utf-8?B?cmNkbVN5aUJKWVNpTlVXZWZJckJnMWtaZjM1VWFuQTFzdWZLQytHYmZTRiti?=
 =?utf-8?B?VFNEQlY0V3piQUk2OXlkNnNLTFpIV2Y0VEhLTjRrTzVicW40U1FBTU45bDhu?=
 =?utf-8?B?OFVQdzRIT01sTE1QSElGdGVGdzdrVlB0a3ZZRytWSThoTnc0TTFpR1hGYU9Y?=
 =?utf-8?B?a0xmNnVmdlJyZWRBTkxQZTU5elhoZVhJWEFyWCtkSjhuRUhPWFlNdTNXb2ht?=
 =?utf-8?B?bWtjQ2ZGbGFUdVZZY0kyajhpQ0s1QjVDK2h1UDg3bWcrd3RIVC9wZyt3aHB4?=
 =?utf-8?B?eHJyakh2bUJoVFlUazFuR0Z0bmtDaklWSW1LY3ZpUkduWW5oMENMWlM5aUda?=
 =?utf-8?B?UzFlajNjblpobytnTDBXczB0M0U3WjB3bEsxNkV4NnVTWm0yZ3luL05OVHcx?=
 =?utf-8?B?c244ajVjUmd1Q2VzQWZSZlNCWThKMi90ZlJSR1ZnazNqYm8vZHdsMFVhTXNa?=
 =?utf-8?B?MjZWc0NvTkhpa2MveUUyUE9BVEVITVJWdmhha0g0WHBsZGFNVC9pVmpZY0o1?=
 =?utf-8?B?dDlJait2akJta1FUT1I4L21valRrdjBYV0FoaHpTSEt1aytmSkNiaEFQL3dm?=
 =?utf-8?B?aWhkUmg1dm9PZUlYN3lMdjI4UFNnM2xiUHlXV1MzTENWamlzdFZvRkQ0SWdy?=
 =?utf-8?B?SzdaZ3F6RGkzRHFwenJIOHd2b2RITSsxTnFlMVUxNGc5eXZndnBEcnV2QStq?=
 =?utf-8?B?Y1huaGw2MnpWQ29UVVZ0WlE4b1NDbTdqSWRoeHJCNW9yRFY3VzZIZEhuMGZh?=
 =?utf-8?B?dE1GeGVwRjlydTRPd2x3dGRieVM3T2NCeUw2VGFCaXFjY1MrMVlRRXlPNE1E?=
 =?utf-8?B?Rll5ZDNFNVFlQ0g1Wm5pNzBMUVFmanpOdkxZS2t4RjdhUXZqZDdPUDgzWmQw?=
 =?utf-8?B?eVVoU0N3NElBK3RUYzBwYW8rbG1zWUFRbUZld0xURXVVQ1VWUUFWcmFYOXJK?=
 =?utf-8?B?V0FOZzNBK1A3OGpmQU9TN3B6b1JiU2diNDM3d1R2d0tBV21hWEtMM29vWVJG?=
 =?utf-8?B?ZGRPTklzREFmUkJMNS9nQ2tJWFNRVGFkb1p1aWVrZW1nYlVhSUVxVm5DU1Mz?=
 =?utf-8?B?cXRNS2o2eWZTaTN4dTBtbk5DbWdoT0FZbnlscS8xaGxPRm1MK0FUdFl2L2JJ?=
 =?utf-8?B?R01nNGx5YzZXNWp0WnRGU3hEcTA5MVBUNVk5dy9YQk5mUHNjZlRjZ055TDJX?=
 =?utf-8?B?UU81NjNBbEtIZzB1c01uamdmM0RuZ2szbExUVWZqSnplUG9tYnVSNTl6TUZm?=
 =?utf-8?B?VHJ1UlFLWXE4QkR6cG9rYWhkYXMrdzhZTWtjcUIzY1p4eHNYckJrY0J5Vjhr?=
 =?utf-8?B?V1gwUVZmV1FUTGl1dWxMZmsyS1ptR3pRNHdMV05lNnJwZVVZangySExYWG5D?=
 =?utf-8?B?UlBMMHdjSW9BRmk0MjFCUFoyN3BpenovY1FvVUxYc2czdVhkT3JVcVpOVkZO?=
 =?utf-8?B?QVlOY25pTXoza0ZIaU1nZWQ0WFl6akI0Q2FhVENtc3ZmQUdoK3gvM1NRam8w?=
 =?utf-8?B?cUdjSTY0aSs5WGREaHFydz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWw3UGMyQnJSbFdWZGdheDZVYlJOMDl5dlk5eHJUSWdGLzI5VU9DNXB4cytm?=
 =?utf-8?B?OTNCTmxodk9CdjZFWVNDZjE1STZrc1NyL0FkaVR2SC9hUFFya2RSNlV0ZmlR?=
 =?utf-8?B?UEllRVdXaG9iTGRlZkRVL2FVcEhsS0xnVlVVdVJzMVRXQzJDZUQ0SnZFN3hH?=
 =?utf-8?B?L3Vxd0o0RVIvTmR5eEM0NUd1RUN6WXh5TXdHeDU1dFAwaHhSc3NYUTdEUmtp?=
 =?utf-8?B?VHIzaWZvODB3VTRuRC9TK0VvQlpaWWtGM3FaZ2h0b3J0RDBFWVdSdWI4RTB6?=
 =?utf-8?B?YmNRdDFnOEtCcVhkcDNuRlZFMTRmSFJEME9RcjFPTVJLeU1qWmZadVV4bldY?=
 =?utf-8?B?YkoxUGtJMDNHK0FFV3JEN2lkNERHSVQ5NUxYa0xzamY4NDdFRzNHMUJ6Y245?=
 =?utf-8?B?TVVZWjVpMUNta0h6Qjg1dmdBdVZXZGpNR0ZrS2NNWENDYzR0TFhWdHpkREpm?=
 =?utf-8?B?dWkyUlgzUXVpaGt3bWRXbkJqWU9DcmhuME5VWFN4R2VYakpVOEtQVStYZ3N4?=
 =?utf-8?B?WkgyMUFwMkVvWHJhbGkydEovWUUxc3NjeThrS3JxYmZoYnFKVTNtRWhiT2Z2?=
 =?utf-8?B?STFEV3l2S1BaYkFWYVhLUVZ0aUNaSkt3d1lUYmxrU0hreTVaMG82YjNTMGJp?=
 =?utf-8?B?N1FHYjJUVUp1UG56eE0yaGdONmkxNEhkZW5kWVVzSDNQWWZnU1d5YnAvaDBT?=
 =?utf-8?B?bzJNSDdVME8xZ0xvSDkrNmVEaW10OC9PYlZCVGxNUVQzTHN3N3Rtb3ZLbHZk?=
 =?utf-8?B?U0JiOU45NE52ZU5xc2ZGM1FEY2lWenN4TkpiNDBkbk1hcDljTU1jOVlhRktO?=
 =?utf-8?B?eTFDZ1UyWEVITERjZjQ1N0J2Z0RmSHljb2pEQkxnc1lEUFEzU3I4VkJFaTNF?=
 =?utf-8?B?WVBHWm5LbkJiTG9QZ2NUWER6R3kzUDljMGdUajZZWXpJNlcvNENDcFdJUitY?=
 =?utf-8?B?blJsNFNDTG0vZnpuOFB3NGR0bzR6SUFFeS9OTW9rNGx5STlSbGdWNCticmRk?=
 =?utf-8?B?bmI0YVp3MnRmNE5UWWNnd3pCTFd3SVBpNTEySHBiV0pWQUJSVXVVWXppWDBj?=
 =?utf-8?B?OE9yZFVZOVF4YUx0N1dUdVE5dEt4T0ovelhuVkY1TllHSkpJdS9odENxWXpj?=
 =?utf-8?B?QnM5YXVRUjBMZGlXYUZHeFR3czRhWUJSeTcrVDdIRGd4L2krb1BFbFlnQ0h2?=
 =?utf-8?B?TXpmbEk2ZmpnbXFXZjhwT2RQbmxTeEZaNGFBYUs2eWN0U1FiMGpRcUp1YW1w?=
 =?utf-8?B?ekQvemdlbVdaVFZGNTFualdYL0FCbVduQlRjMURERjJZdVliaWF6T0toeE1x?=
 =?utf-8?B?emxJbGZOSUpWWnN1VDd6VWdiV21yMEJSZ0huRzBlRzBXTXh5cjBsRTdqeEQr?=
 =?utf-8?B?bEpad2hLWFlDMW13OVJGc2o4d3N3M01ZRnh6QVh3aGpBOXEvdUlBNGxUQWpR?=
 =?utf-8?B?ZHhTelBpek5hWjB5UlVucXlzK0M1SGN2NGZDcHFYaFFqSHRIaUViSEFuUFBp?=
 =?utf-8?B?MFJDcDFCYlV5R0k4VENKdGpuZGZxb2hZaFI1b3MwU1pWdlVRbFhaZWh0bXEz?=
 =?utf-8?B?SHB1QnUyT0VzMkUzTk5KSktxYTRpVGwxNUdESndTME5ydS9VUXZtSExYNnlF?=
 =?utf-8?B?bTRaRW93aW5JYS8yVFRheHlTMVIweUF6eG5oeXZ1b2plR3MvMnZ6Q1BPYUU4?=
 =?utf-8?B?ZUcvMXE5RmQ3eHl6Y25JYVB4UjNOWWxFRDI0R0p6Z0JBZHppaTc0ZExtcjBJ?=
 =?utf-8?B?M2lkNmhLMW5oRW9GcDk0TE9SbVBUSy9yYitaYlVMNktQNEVZSHg1OXFvZmN6?=
 =?utf-8?B?M1NibWJYNUZFaEF6NkxRcEVJQnRjOWRucHlrV3B4clFwVWpPNWJjT0ZkYmc2?=
 =?utf-8?B?NTVyYzRVa0FYTTVVbVVwZkFtbEtoK2dzNkh2c2l6VUE4REhpYkFQVHB6OGlh?=
 =?utf-8?B?UTBFQm4xWVcvNU0wUTBtSEFSOWh3bEdKTTZKN21YMkNOakQrVk5UcjEreDZO?=
 =?utf-8?B?azRjV1U3WlVoNmpDQnR5OEtJZkRKL0U1cEdsSG9wZ1hpbG80eFhtS2ZaeGs3?=
 =?utf-8?B?dVVDZXlycERobG56N3RHYS9PSTVMTlpGQ2N6OXBSaHh1Y0pVZWU0eVliTUNr?=
 =?utf-8?Q?detw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B7A2270D5C38144891159313DFFA549@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80294f1-04f3-4f1f-c3cb-08dc764d8fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 08:44:27.4027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6O7sIfP68bTrMvqJMXyStwPcoLdwmY6sGWTS9jBLy4pW908tTF9Cx61+b6ZN7R/CL2aU5tMPNNTxKmp4p0Hng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

T24gMjAyNC81LzE2IDIxOjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDUuMjAyNCAx
MTo1MiwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJZiBydW4gWGVuIHdpdGggUFZIIGRvbTAgYW5k
IGh2bSBkb21VLCBodm0gd2lsbCBtYXAgYSBwaXJxIGZvcg0KPj4gYSBwYXNzdGhyb3VnaCBkZXZp
Y2UgYnkgdXNpbmcgZ3NpLCBzZWUNCj4+IHhlbl9wdF9yZWFsaXplLT54Y19waHlzZGV2X21hcF9w
aXJxIGFuZA0KPj4gcGNpX2FkZF9kbV9kb25lLT54Y19waHlzZGV2X21hcF9waXJxLg0KPiANCj4g
eGVuX3B0X3JlYWxpemUoKSBpcyBpbiBxZW11LCB3aGljaCBpbW8gd2FudHMgc2F5aW5nIGhlcmUg
KGZvciBiZWluZyBhIGRpZmZlcmVudA0KPiByZXBvKSwgdGhlIG1vcmUgdGhhdCBwY2lfYWRkX2Rt
X2RvbmUoKSBpcyBpbiBsaWJ4bC4NCk9LLCBJIHdpbGwgZGVzY3JpYmUgbW9yZSBoZXJlKGluIHFl
bXUgYW5kIGluIGxpYnhsKS4NCg0KPiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJj
YWxsLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+IEBAIC03NCw2
ICs3NCw4IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgIHsNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfbWFwX3Bp
cnE6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3VubWFwX3BpcnE6DQo+PiArICAgICAgICBicmVh
azsNCj4gDQo+IEkgdGhpbmsgdGhpcyBjb3VsZCBkbyB3aXRoIGEgY29tbWVudCBhcyB0byB3aHkg
aXQncyBwZXJtaXR0ZWQgYXMgd2VsbCBhcyBnaXZpbmcNCj4gYSByZWZlcmVuY2UgdG8gd2hlcmUg
ZnVydGhlciByZXN0cmljdGlvbnMgYXJlIGVuZm9yY2VkIChvciBzaW1wbHkgbWVudGlvbmluZw0K
PiB0aGUgY29uc3RyYWludCBvZiB0aGlzIG9ubHkgYmVpbmcgcGVybWl0dGVkIGZvciBtYW5hZ2Vt
ZW50IG9mIG90aGVyIGRvbWFpbnMpLg0KVGhhbmtzLCB3aWxsIGFkZA0KLyogDQogICogT25seSBi
ZWluZyBwZXJtaXR0ZWQgZm9yIG1hbmFnZW1lbnQgb2Ygb3RoZXIgZG9tYWlucy4NCiAgKiBGdXJ0
aGVyIHJlc3RyaWN0aW9ucyBhcmUgZW5mb3JjZWQgaW4gZG9fcGh5c2Rldl9vcC4NCiAgKi8NCg0K
PiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9waHlzZGV2LmMNCj4+IEBAIC0zMDUsMTEgKzMwNSwyMyBAQCByZXRfdCBkb19waHlzZGV2X29w
KGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4gICAgICBjYXNl
IFBIWVNERVZPUF9tYXBfcGlycTogew0KPj4gICAgICAgICAgcGh5c2Rldl9tYXBfcGlycV90IG1h
cDsNCj4+ICAgICAgICAgIHN0cnVjdCBtc2lfaW5mbyBtc2k7DQo+PiArICAgICAgICBzdHJ1Y3Qg
ZG9tYWluICpkOw0KPj4gIA0KPj4gICAgICAgICAgcmV0ID0gLUVGQVVMVDsNCj4+ICAgICAgICAg
IGlmICggY29weV9mcm9tX2d1ZXN0KCZtYXAsIGFyZywgMSkgIT0gMCApDQo+PiAgICAgICAgICAg
ICAgYnJlYWs7DQo+PiAgDQo+PiArICAgICAgICBkID0gcmN1X2xvY2tfZG9tYWluX2J5X2FueV9p
ZChtYXAuZG9taWQpOw0KPj4gKyAgICAgICAgaWYgKCBkID09IE5VTEwgKQ0KPj4gKyAgICAgICAg
ICAgIHJldHVybiAtRVNSQ0g7DQo+PiArICAgICAgICAvKiBJZiBjYWxsZXIgaXMgdGhlIHNhbWUg
SFZNIGd1ZXN0IGFzIGN1cnJlbnQsIGNoZWNrIHBpcnEgZmxhZyAqLw0KPiANCj4gVGhlIGNhbGxl
ciBpcyBhbHdheXMgY3VycmVudC4gV2hhdCBJIHRoaW5rIHlvdSBtZWFuIGlzICJjYWxsZXIgaXMg
c2FtZSBhcw0KPiB0aGUgc3ViamVjdCBkb21haW4iLiANClllcywgSSB3YW50IHRvIHByZXZlbnQg
c2VsZi1tYXAgd2hlbiBzdWJqZWN0IGRvbWFpbihkb21VKSBkb2Vzbid0IGhhdmUgWDg2X0VNVV9V
U0VfUElSUSBmbGFnLg0KDQo+IEknbSBhbHNvIGhhdmluZyB0cm91YmxlIHdpdGggc2VlaW5nIHRo
ZSB1c2VmdWxuZXNzIG9mIHNheWluZyAiY2hlY2sgcGlycSBmbGFnIi4gSW5zdGVhZCBJIHRoaW5r
IHlvdSB3YW50IHRvIHN0YXRlIHRoZQ0KPiByZXN0cmljdGlvbiBoZXJlIHRoYXQgeW91IGFjdHVh
bGx5IG1lYW4gdG8gZW5mb3JjZSAod2hpY2ggd291bGQgYWxzbyBtZWFuDQo+IG1lbnRpb25pbmcg
UFZIIGluIHNvbWUgd2F5LCB0byBkaXN0aW5ndWlzaCBmcm9tIHRoZSAibm9ybWFsIEhWTSIgY2Fz
ZSkuDQpZZXMsIFBWSCBhbmQgdGhlIEhWTSB3aXRob3V0IFg4Nl9FTVVfVVNFX1BJUlEgZmxhZywN
CklmIGEgSFZNIGhhcyBYODZfRU1VX1VTRV9QSVJRIGZsYWcsIG1hcF9waXJxIHNob3VsZCBiZSBw
ZXJtaXR0ZWQuDQoNCkkgd2lsbCBjaGFuZ2UgdGhpcyBjb21tZW50IHRvIGJlOg0KLyogUHJldmVu
dCBzZWxmLW1hcCB3aGVuIGRvbWFpbiBoYXMgbm8gWDg2X0VNVV9VU0VfUElSUSBmbGFnICovDQoN
Cj4gDQo+PiArICAgICAgICBpZiAoICFpc19wdl9kb21haW4oZCkgJiYgIWhhc19waXJxKGQpICYm
IG1hcC5kb21pZCA9PSBET01JRF9TRUxGICkNCj4gDQo+IFlvdSBleGNsdWRlIERPTUlEX1NFTEYg
YnV0IG5vdCB0aGUgZG9tYWluJ3MgSUQ/IFdoeSBub3Qgc2ltcGx5IGNoZWNrIGQNCj4gYmVpbmcg
Y3VycmVudC0+ZG9tYWluLCB0aHVzIGNvdmVyaW5nIGJvdGggY2FzZXM/IA0KPiBQbHVzIHlvdSBj
b3VsZCB1c2UgcmN1X2xvY2tfZG9tYWluX2J5X2lkKCkgdG8gZXhjbHVkZSBET01JRF9TRUxGLCBh
bmQgeW91IGNvdWxkIHVzZQ0KPiByY3VfbG9ja19yZW1vdGVfZG9tYWluX2J5X2lkKCkgdG8gZXhj
bHVkZSB0aGUgbG9jYWwgZG9tYWluIGFsdG9nZXRoZXIuDQpCdXQgdGhlcmUgaXMgYSBjYXNlIHRo
YXQgaHZtIGhvbGQgUElSUSBmbGFnIGFuZCBET01JRF9TRUxGIGlkIHdpbGwgZG8gdGhpcyBwaXJx
X21hcCwgc2VlIGNvZGUNCnBoeXNkZXZfbWFwX3BpcnEuDQpJIHRoaW5rIGNoYW5nZSB0byBjaGVj
ayBkIGJlaW5nIGN1cnJlbnQtPmRvbWFpbiBpcyBtb3JlIHN1aXRhYmxlLg0KDQo+IEZpbmFsbHkg
SSdtIG5vdCBldmVuIHN1cmUgeW91IG5lZWQgdGhlIFJDVSBsb2NrIGhlcmUgKGVsc2UgeW91IGNv
dWxkDQo+IHVzZSBrbm93bmFsaXZlX2RvbWFpbl9mcm9tX2RvbWlkKCkpLiBCdXQgcGVyaGFwcyB0
aGF0J3MgYmV0dGVyIHRvIGNvdmVyDQo+IHRoZSBxZW11LWluLXN0dWJkb20gY2FzZSwgd2hpY2gg
d2UgaGF2ZSB0byBjb25zaWRlciBwb3RlbnRpYWxseSBtYWxpY2lvdXMuDQpZZXMsIGZvciBwb3Rl
bnRpYWwgc2FmZXR5IHJlYXNvbnMsIGxldCdzIGtlZXAgdGhlIFJDVSBsb2NrLg0KDQo+IA0KPiBJ
J20gYWxzbyBpbmNsaW5lZCB0byBzdWdnZXN0IHRvIHVzZSBpc19odm1fZG9tYWluKCkgaGVyZSBp
biBmYXZvciBvZg0KPiAhaXNfcHZfZG9tYWluKCkuDQpPSywgd2lsbCBjaGFuZ2UgdG8gaXNfaHZt
X2RvbWFpbiBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJk
cywNCkppcWlhbiBDaGVuLg0K

