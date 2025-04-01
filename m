Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FFA772F5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 05:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933403.1335360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzSFW-0002A3-QW; Tue, 01 Apr 2025 03:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933403.1335360; Tue, 01 Apr 2025 03:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzSFW-00026v-M6; Tue, 01 Apr 2025 03:25:14 +0000
Received: by outflank-mailman (input) for mailman id 933403;
 Tue, 01 Apr 2025 03:25:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaGF=WT=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tzSFV-00026o-9u
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 03:25:13 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f403:240a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e77e43-0ea8-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 05:25:10 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.50; Tue, 1 Apr 2025 03:25:06 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 03:25:06 +0000
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
X-Inumbo-ID: e9e77e43-0ea8-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCW84NTgb1RghfbNfLXFRVh/sNGpdd2CX8I8brhHdoCY/dJ15TxlEAKrF0d5xJ7LgM3IidIBdkYRe1MHF59Cyuy0bR8Iwdychqkw+rN9RKuc/LuQcG+KZLe9oXlHJLBp/7aG5/vrPaI7MMGNCCZmdflVdXqSS2vDRvUNbaNN6GVXisZTHYpjblicgd8PekPaDA7Nju0el+ebUyTXlqpm9WFFGzPPJrb1n1Y9xuHthD5HS6Ddwo7iYpRdnnzVS/vo87lbJynH0SYjJ8sTBYeezOoIyuxTCkVweT3XE8/Loz+2qjPeitSMODbDiQKevWod3490UQ7FgtAsQE8/+y1xrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/KU+f+4WVQIKdgF9kt5wfqdUCJyew4L+MSOgiPW6js=;
 b=ROO3hz9zofrJTckDx4mGk5/f3+JDyl9WezpjwEUjY+M01ji+H9YhogdGJoMBwfv+Oab7h2eXC+OaDPcp8egM+0bpNY3cYsRIX69Ut7+/8dTgM4J61X0cb8TuxpXWMqU7ifVRUMq4qGUKC71svXjtuod05DomIBGMBq/VWpWKKt3VFlW/vxpYmh4zFExSqzP/IBU7U9gjI/yo/4NqbeukKEvSG75r5H9tIzRO8/jlr4bcs+SsX9vMDJiigKSM+zZzaOENgdK3Wb2egb7dcIFNd3KIu76YvCGiZlVyGVbSrXwDzugo62wI3tYK1JK+5EM3XP5OAPIp364HI69hEqqiBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/KU+f+4WVQIKdgF9kt5wfqdUCJyew4L+MSOgiPW6js=;
 b=Bp/yU7OL9WfuoGPYHdsUdC9KFkNbGTeu11IToR3ID3R7CjHOzOErgrZfv4MadRLyg5/wIfsnxKkvPDRKBwuxyihnzr4z7ZjbBQ2qgM4SB6B9zbuL7e7boSt1aQfP4TBbXdLosrKZjzhJizA5KJ+JRSfNXbm6/0PDLRkd4Jh8rE0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 01/15] xen/cpufreq: introduces XEN_PM_PSD for solely
 delivery of _PSD
Thread-Topic: [PATCH v3 01/15] xen/cpufreq: introduces XEN_PM_PSD for solely
 delivery of _PSD
Thread-Index: AQHbjnNoTRyqRKkrMUKJ/Guu/RHDX7OCb44AgAqX8RA=
Date: Tue, 1 Apr 2025 03:25:05 +0000
Message-ID:
 <DM4PR12MB84510147E03DE64519CC4D62E1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-2-Penny.Zheng@amd.com>
 <8f0efe3b-296e-4f1b-9501-8431f299e90c@suse.com>
In-Reply-To: <8f0efe3b-296e-4f1b-9501-8431f299e90c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=342404d3-5c86-4c97-b390-9f0e78de4631;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-31T07:55:06Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB6557:EE_
x-ms-office365-filtering-correlation-id: 867f6878-f386-4378-d759-08dd70cccc46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dzhwcWhrbHl1YjZLR0d6amltZmY3azdXNi8zZTBLQkRuNytRdHhpdzlRTGFR?=
 =?utf-8?B?Z1dRWEZ3MGRwYU82YnA4T3gxbHBHa2M0azRGK3ZGZGhLWU9UU1VsT0hMZDBJ?=
 =?utf-8?B?MnpkZG5PYTRSdXFuUmdscEVoUWhvM2RESiswOTllM0IrOFh1Y21yOFRnblJk?=
 =?utf-8?B?UHhHK3M0bmF5bnV6V2huWjdjYnhKbnlyR2NhbkxEK0p3TUlwK3JaRGU2dWJQ?=
 =?utf-8?B?ejNKUzZ4Y1c5b2NFOEY4ZFNXL0hRZENzSi82SlBGUjhvQUxXUkVTcUxLMkNl?=
 =?utf-8?B?MnpMaU9KTmFINWNhRENmbWRNQWMzTWUvcGgyYWxsTGxPUXFtQ3crdTdCV2JY?=
 =?utf-8?B?V2E1eWpHNUxlZDd1ODFwcU9aR2hxZFJUVExxSDJhL1lPaVRrcllSMmY3ZDZk?=
 =?utf-8?B?RjNsZHZkTVVJalovOU1hNWUrbEl0SDc5a0pyT1VqVThYcnFocjF6WlhsYWFD?=
 =?utf-8?B?TWNacllBWVNQS20vZ05UbDVlU0IraDJwQkp5Qy96NjFkNkg5QXNxQUtqOXJi?=
 =?utf-8?B?aVY4SGpQcElvNE9KbkJBeGdwU29PZ2d0K2NOY0RDZzhna2cyd2xsRThQZ0p4?=
 =?utf-8?B?OE5RcDMrZ05YTzB3aUI3WVl0dTlIYklmMUVxYXVjcGNyaGlaYjFwZkd2S2dT?=
 =?utf-8?B?R1NHRzFPeUNJK2hWYWJQSUdrTGNQaDVCWnJSdk16TTNFT1FxTW1CdnpqNlRx?=
 =?utf-8?B?R2ptQ2lCLzVKeFhDR0xYaWY0QzVjRVdYaDFobytjbjZFeHF5dzR2MDQ3QTNh?=
 =?utf-8?B?Yk1zUys5VUlwbjZoNVJtUzVHUjIwNmtveHMwUUJjQVVaZGJIVWNUT2tIRWFl?=
 =?utf-8?B?eVp0cmlBa3RCRHAyQkp3UXZwVVRlYmhMTUxNL1FYWTllclF0STVicUl2V3kz?=
 =?utf-8?B?MFhNT01RWU9FNnNDVFdEdEl4UU1uenpDS2UrdEZBMDN4ZUloS2RwV3ZwaXFa?=
 =?utf-8?B?bllicWRlUGhSOGlVMVlXVHdUUzVRV1RSbDk3UmtlTjV3SDhrL1lrWDBrOTJU?=
 =?utf-8?B?SngwbldyakpieS9TV0p1V0I4cWcxOHdJRDJRZzE4TnhyZW1ja2lEdkU3d3A1?=
 =?utf-8?B?L1ZaN1BwWmFOTFZwSnJWeDN6NTQ4eDVCQ1dCaXBzVTFSeDdEeFNVZGQrVk50?=
 =?utf-8?B?SFBOYndvMnU5QUJLTXJxT05HSkc4bUFPbkovcGVQd3NmL1VkMWFDd2Y3WHI0?=
 =?utf-8?B?V3VBa3k3MTZ0WTZ0QWxMTW1oSWlOWDBDYXZNOGtmYlorYVFINU5peWFCczlh?=
 =?utf-8?B?U0Fhb3ZxWXVQV1lnTzVEKzdMVG5QWWJXSlY1TVVPZTZDTmxkUWtEeHZtMkF0?=
 =?utf-8?B?TCt6UG1GVHhvZ3FGVXBvWjJtSCswU0RZR1FlRFpzRFEvTkY3dytrT2RTVTQ0?=
 =?utf-8?B?OTdwTkxnRnF0dmJ0QitHejBncDB3cEtOd3lwdHZhV0ZEeFFzbTVRN24yL3VM?=
 =?utf-8?B?cTdrWVJBY0cyN0lzWDI2akErbzhOaFRSZ3NrUFdVUGNhSVNqZmtFU2VibjlY?=
 =?utf-8?B?cWtObDhKTWh2N0d0TEsySG5ZRkNXSTNjbzZvZThWSGpud1VsR0ZpSTVOWlN2?=
 =?utf-8?B?QkZwRGdJZVM5UEFHT2hubUptT01qQklqL0dUNFEvMFc1TnFPVnl0RCtOdEsy?=
 =?utf-8?B?TTdyWDJkVy90cmVrclN5ellSTHdSS2RHaURmUUZXaG8rZUh1MFBZaHc2UTVq?=
 =?utf-8?B?VFIvSGxZVDVlZllKbjhsY2dHbGlibE5wZm1VbXFXaGJIRkZpQ29QdENNdEFZ?=
 =?utf-8?B?aW5lZGxkMFM0dGxicTgxK3Axb1lVb3p3ZmRNYytjRTFGK2ZDNnp5VTZHZyt3?=
 =?utf-8?B?cjJBTnkyZlA0eTdoRDdUdGdQQ0JRb2tlWVZXcW1RSUdGRFN4MlZ6WG9lbWNU?=
 =?utf-8?B?aFRldVRtdVB4MnNYQTlUNGliYUdkM3MzZEdwYzdyVHB0T3JlUm1lSzVhR2JI?=
 =?utf-8?Q?2piT6e6ztEnFg+ZJlJZwCSopqkqDPjR6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUc2azQ2QUdiMzFEVUQrdXVSV2pmYkJuNjFYTEhISlBnczBmSHRLcE5PblNk?=
 =?utf-8?B?c1MwdWlZL1VYQU1ObldsVFk1ZVAxQ0g4NEViWG9uS25vOW80YktWbmMrckRH?=
 =?utf-8?B?d1ZnOTJPaWFsakdBVXQ3VDZhYktkaXhTYXk2YzA0SXR4bEZmcFpMcWF6ejBq?=
 =?utf-8?B?MFNhSkdXeFUzSWwwYnpxWHdJakNKeUdqV1ljTy9jbFlrUEZZOW13WEhqSmsz?=
 =?utf-8?B?SkRBWEVJWnFleUxqRldrVE0vWEthY3VuMm53U29PeXJ0OHdESEtObnRQbkty?=
 =?utf-8?B?VUhzV3p3NUJRZ2pkM0dRajE1YlBYSm9KZjhuWWdzQWVPMUpzQVc5ZHNjaHYw?=
 =?utf-8?B?V0RXK085VWNRNWNSelM2KzE4L21DSUJ5eGhOMGxQMzhjUlA2NG9yVlJ1WnNv?=
 =?utf-8?B?dWRYNDlKNFJmYzVGUVNUVmw3dWtVL0tidXNsWTFhM2hleGR0NjJLNUdZTmtr?=
 =?utf-8?B?TXN2cjZVYTl1ZTFWcVZNUnlXZUtRUFQwckRhWGlGaVNkNkNVWDhObDErcTd1?=
 =?utf-8?B?QlFuNHp3K1BJMWlTSVdrdVlYSEVUSjFxcHhrOXovNG1IV0RBSTB0QitDZDNM?=
 =?utf-8?B?b2RLOXR5QnVyZCtzVWNQMzFxbDRiUXZIMlhHK0ZvQTJGS1E2aVlSVXUwYkpT?=
 =?utf-8?B?NHdSOXA1ZUFRa0JVTk9Ya0c0Y0VBbVhhTjZyWmhPYVhIaHpaRHBtRGVrWXBu?=
 =?utf-8?B?REY4anZwZEhZWjRBSnU3WnBjWWRrYU9PRVFiVjNtcGdYSWcwT05lbjNqQ1VG?=
 =?utf-8?B?MFRRVjF4N3pqU0EwZEdRRlczQVVOMEhEOG1CU0lEZmhrcXpCZHgxVGkwU1ZJ?=
 =?utf-8?B?MEwwenQyUVNnMWZqLy9raWY0OGFZK2czYWJmdm40YzAraE1qVHJrakdJWHBv?=
 =?utf-8?B?VXlRN2IxSGQxNmJrRWlDZ2tZbjdOOFUvT2dYQ0xFU09nUzAyRFI2dVVuamQ0?=
 =?utf-8?B?aTdvRlR3encxUGFuNiszRTZzRTEzMTJhNTdxdzEzVE5yODk5c2VPV2liTlhj?=
 =?utf-8?B?VmZTTGhWbWxieVd4OTljSE40aUx5ek01cGxuZWhWTUdyUWhEb1VxVU1NTExF?=
 =?utf-8?B?bUlFQmVsUzk4VkpVam5SS3pIRGZ2eVp5VSswWXhTYXFDd1BaNHcrOGgxYVNL?=
 =?utf-8?B?MGg2RTN2RDhPeU1tYW5KNi9zUkFNajFKOCtPTEJSMjB3d2I1MitIZG1IMkRh?=
 =?utf-8?B?VXRGMURHcjl3MzlFSlFHdjlWaHBmTzBFdThSQkxJbXMwNkFuM1Rtem01S1pU?=
 =?utf-8?B?VHE0VmF5NXVvZndacnJ0clZ2ckQ2cGMva2hGRWpaelRkc0l0SzRsSmJTNGtm?=
 =?utf-8?B?UXlrU0FySmdsMjEwTUdUVlZya0Fab3hkMkRicmhPZU4vZmpOQ1I4bS9aQkpK?=
 =?utf-8?B?Y2xhalVZbHlyU3FEYW1taER6N0Rld3dKTmwwOFVNU2FSN2xqd2xodkQ2OXNE?=
 =?utf-8?B?b0V3eURiNnRGNEtrVXROZnYwM1dPQWc2TjZVbjdHQkdUMW1KUDJjdmpXZVg3?=
 =?utf-8?B?ZWZSeWJyd1c4ZEFxdTVzam9SQTJScytyL3drTmEzRFVuS3ZVZUlLVklQbzlR?=
 =?utf-8?B?NlhQQVpGblRqekJLb2QxQlRYbDV6eHFPblZmUG8xMlEwc2xwdjQ3TGxETC9Q?=
 =?utf-8?B?V2crV3NxM01hVHh0eU9oT3lWZVR4QmhoeDRYQis2emxUSXVTaHg3RHJyQ3ZR?=
 =?utf-8?B?QnZ5REljR09xQ1l3VkNBaVJVNFNEYzZPa0Y2aG9OeHcvTmlIVWI5UmNIY1pa?=
 =?utf-8?B?d1YvaG94cHpUcWlVWEZMK1VzMEdLTDZ0QnFDTUkxNCtUNnV3M21XUmVCZTVI?=
 =?utf-8?B?UEtXeHpWK2srazNIa0VZV0hMQ2NsVk0vbVZ5S2FLdXVlTkxZNVR0RHgzQlNn?=
 =?utf-8?B?TVE2UEZqRUUwTjdDektPS0ZZYzVteUlKQllRS3lCRzVrMEFnd0ErdU5lL0pp?=
 =?utf-8?B?Ry9LRHJEb3piVitRZHlKeHJGelFRcEdYUUtLdkEyRXZsRzBTUklJWjNRU1Nx?=
 =?utf-8?B?ZCtxcHhwMjI5dVNMWnlySDdKQng4ZGNnd0I0NTUwMlJudzhlelBodE0wKzlW?=
 =?utf-8?B?bnFOVnVHOWM0eCt3RUhZaDhrbEREZ29mTktDSmMzczhZMlI5ODN4UzZ1dUFu?=
 =?utf-8?Q?Z0yM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867f6878-f386-4378-d759-08dd70cccc46
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 03:25:05.9279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNWI85AC3F6yqF9JY5edd9ufyhPDfqFJxwyut1YOsANm79APWVlda0q0D0zqXtho7uD09kSxXYu9kGFZL7uSYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDI0
LCAyMDI1IDEwOjA5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNo
PjsgT3J6ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMDEvMTVdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2VzIFhFTl9QTV9QU0QgZm9yIHNv
bGVseQ0KPiBkZWxpdmVyeSBvZiBfUFNEDQo+DQo+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55
IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9wbGF0Zm9ybS5oDQo+
ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3BsYXRmb3JtLmgNCj4gPiBAQCAtMzYzLDEyICsz
NjMsMTIgQEANCj4gREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVucGZfZ2V0aWRsZXRpbWVfdCk7
DQo+ID4gICNkZWZpbmUgWEVOX1BNX1BYICAgMQ0KPiA+ICAjZGVmaW5lIFhFTl9QTV9UWCAgIDIN
Cj4gPiAgI2RlZmluZSBYRU5fUE1fUERDICAzDQo+ID4gKyNkZWZpbmUgWEVOX1BNX1BTRCAgNA0K
PiA+DQo+ID4gIC8qIFB4IHN1YiBpbmZvIHR5cGUgKi8NCj4gPiAgI2RlZmluZSBYRU5fUFhfUENU
ICAgMQ0KPiA+ICAjZGVmaW5lIFhFTl9QWF9QU1MgICAyDQo+ID4gICNkZWZpbmUgWEVOX1BYX1BQ
QyAgIDQNCj4gPiAtI2RlZmluZSBYRU5fUFhfUFNEICAgOA0KPiA+DQo+ID4gIHN0cnVjdCB4ZW5f
cG93ZXJfcmVnaXN0ZXIgew0KPiA+ICAgICAgdWludDMyX3QgICAgIHNwYWNlX2lkOw0KPiA+IEBA
IC00MzksNiArNDM5LDcgQEAgc3RydWN0IHhlbl9wc2RfcGFja2FnZSB7DQo+ID4gICAgICB1aW50
NjRfdCBjb29yZF90eXBlOw0KPiA+ICAgICAgdWludDY0X3QgbnVtX3Byb2Nlc3NvcnM7DQo+ID4g
IH07DQo+ID4gK3R5cGVkZWYgc3RydWN0IHhlbl9wc2RfcGFja2FnZSB4ZW5fcHNkX3BhY2thZ2Vf
dDsNCj4gPg0KPiA+ICBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZSB7DQo+ID4gICAg
ICB1aW50MzJfdCBmbGFnczsgICAgIC8qIGZsYWcgZm9yIFB4IHN1YiBpbmZvIHR5cGUgKi8NCj4g
PiBAQCAtNDQ3LDEyICs0NDgsNiBAQCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZSB7
DQo+ID4gICAgICBzdHJ1Y3QgeGVuX3BjdF9yZWdpc3RlciBzdGF0dXNfcmVnaXN0ZXI7DQo+ID4g
ICAgICB1aW50MzJfdCBzdGF0ZV9jb3VudDsgICAgIC8qIHRvdGFsIGF2YWlsYWJsZSBwZXJmb3Jt
YW5jZSBzdGF0ZXMgKi8NCj4gPiAgICAgIFhFTl9HVUVTVF9IQU5ETEUoeGVuX3Byb2Nlc3Nvcl9w
eF90KSBzdGF0ZXM7DQo+ID4gLSAgICBzdHJ1Y3QgeGVuX3BzZF9wYWNrYWdlIGRvbWFpbl9pbmZv
Ow0KPiA+IC0gICAgLyogQ29vcmRpbmF0aW9uIHR5cGUgb2YgdGhpcyBwcm9jZXNzb3IgKi8NCj4g
PiAtI2RlZmluZSBYRU5fQ1BVUEVSRl9TSEFSRURfVFlQRV9IVyAgIDEgLyogSFcgZG9lcyBuZWVk
ZWQNCj4gY29vcmRpbmF0aW9uICovDQo+ID4gLSNkZWZpbmUgWEVOX0NQVVBFUkZfU0hBUkVEX1RZ
UEVfQUxMICAyIC8qIEFsbCBkZXBlbmRlbnQgQ1BVcw0KPiBzaG91bGQNCj4gPiBzZXQgZnJlcSAq
LyAtI2RlZmluZSBYRU5fQ1BVUEVSRl9TSEFSRURfVFlQRV9BTlkgIDMgLyogRnJlcSBjYW4gYmUg
c2V0DQo+IGZyb20gYW55IGRlcGVuZGVudCBDUFUgKi8NCj4gPiAtICAgIHVpbnQzMl90IHNoYXJl
ZF90eXBlOw0KPiA+ICB9Ow0KPiA+ICB0eXBlZGVmIHN0cnVjdCB4ZW5fcHJvY2Vzc29yX3BlcmZv
cm1hbmNlIHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2VfdDsNCj4gPiBERUZJTkVfWEVOX0dVRVNU
X0hBTkRMRSh4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlX3QpOw0KPiA+IEBAIC00NjMsOSArNDU4
LDE1IEBAIHN0cnVjdCB4ZW5wZl9zZXRfcHJvY2Vzc29yX3BtaW5mbyB7DQo+ID4gICAgICB1aW50
MzJfdCB0eXBlOyAgLyoge1hFTl9QTV9DWCwgWEVOX1BNX1BYfSAqLw0KPiA+ICAgICAgdW5pb24g
ew0KPiA+ICAgICAgICAgIHN0cnVjdCB4ZW5fcHJvY2Vzc29yX3Bvd2VyICAgICAgICAgIHBvd2Vy
Oy8qIEN4OiBfQ1NUL19DU0QgKi8NCj4gPiAtICAgICAgICBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9w
ZXJmb3JtYW5jZSAgICBwZXJmOyAvKiBQeDogX1BQQy9fUENUL19QU1MvX1BTRA0KPiAqLw0KPiA+
ICsgICAgICAgIHhlbl9wc2RfcGFja2FnZV90ICAgICAgICAgICAgICAgICAgIGRvbWFpbl9pbmZv
OyAvKiBfUFNEICovDQo+ID4gKyAgICAgICAgc3RydWN0IHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFu
Y2UgICAgcGVyZjsgLyogUHg6IF9QUEMvX1BDVC9fUFNTLyAqLw0KPiA+ICAgICAgICAgIFhFTl9H
VUVTVF9IQU5ETEUodWludDMyKSAgICAgICAgICAgIHBkYzsgIC8qIF9QREMgKi8NCj4gPiAgICAg
IH0gdTsNCj4gPiArICAgIC8qIENvb3JkaW5hdGlvbiB0eXBlIG9mIHRoaXMgcHJvY2Vzc29yICov
DQo+ID4gKyNkZWZpbmUgWEVOX0NQVVBFUkZfU0hBUkVEX1RZUEVfSFcgICAxIC8qIEhXIGRvZXMg
bmVlZGVkDQo+IGNvb3JkaW5hdGlvbiAqLw0KPiA+ICsjZGVmaW5lIFhFTl9DUFVQRVJGX1NIQVJF
RF9UWVBFX0FMTCAgMiAvKiBBbGwgZGVwZW5kZW50IENQVXMNCj4gc2hvdWxkDQo+ID4gK3NldCBm
cmVxICovICNkZWZpbmUgWEVOX0NQVVBFUkZfU0hBUkVEX1RZUEVfQU5ZICAzIC8qIEZyZXEgY2Fu
IGJlDQo+IHNldCBmcm9tIGFueSBkZXBlbmRlbnQgQ1BVICovDQo+ID4gKyAgICB1aW50MzJfdCBz
aGFyZWRfdHlwZTsNCj4gPiAgfTsNCj4gPiAgdHlwZWRlZiBzdHJ1Y3QgeGVucGZfc2V0X3Byb2Nl
c3Nvcl9wbWluZm8NCj4gPiB4ZW5wZl9zZXRfcHJvY2Vzc29yX3BtaW5mb190Ow0KPiA+IERFRklO
RV9YRU5fR1VFU1RfSEFORExFKHhlbnBmX3NldF9wcm9jZXNzb3JfcG1pbmZvX3QpOw0KPg0KPiBX
aXRoIHRoaXMgY2hhbmdlIHRvIHN0YWJsZSBoeXBlcmNhbGwgc3RydWN0dXJlcywgaG93IGlzIGFu
IG9sZGVyIERvbTAga2VybmVsIGdvaW5nDQo+IHRvIGJlIGFibGUgdG8gcHJvcGVybHkgdXBsb2Fk
IHRoZSBuZWNlc3NhcnkgZGF0YT8gSU9XOiBObywgeW91IGNhbid0IGFsdGVyIGV4aXN0aW5nDQo+
IHN0YWJsZSBoeXBlcmNhbGwgc3RydWN0dXJlcyBsaWtlIHRoaXMuDQo+DQoNClVuZGVyc3Rvb2Qu
DQpJJ2xsIGV4cGFuZCB0aGUgbmV3bHkgYWRkZWQgInN0cnVjdCB4ZW5fcHJvY2Vzc29yX2NwcGMi
LCB0byBsZXQgaXQgYWxzbyBpbmNsdWRlIF9QU0QgaW5mbw0KYW5kIHNoYXJlZCB0eXBlDQpgYGAN
CitzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjIHsNCisgICAgdWludDhfdCBmbGFnczsgLyogZmxh
ZyBmb3IgQ1BQQyBzdWIgaW5mbyB0eXBlICovDQorICAgIC8qDQorICAgICAqIFN1YnNldCBfQ1BD
IGZpZWxkcyB1c2VmdWwgZm9yIENQUEMtY29tcGF0aWJsZSBjcHVmcmVxDQorICAgICAqIGRyaXZl
cidzIGluaXRpYWxpemF0aW9uDQorICAgICAqLw0KKyAgICBzdHJ1Y3Qgew0KKyAgICAgICAgdWlu
dDMyX3QgaGlnaGVzdF9wZXJmOw0KKyAgICAgICAgdWludDMyX3Qgbm9taW5hbF9wZXJmOw0KKyAg
ICAgICAgdWludDMyX3QgbG93ZXN0X25vbmxpbmVhcl9wZXJmOw0KKyAgICAgICAgdWludDMyX3Qg
bG93ZXN0X3BlcmY7DQorICAgICAgICB1aW50MzJfdCBsb3dlc3RfbWh6Ow0KKyAgICAgICAgdWlu
dDMyX3Qgbm9taW5hbF9taHo7DQorICAgIH0gY3BjOw0KKyAgICBzdHJ1Y3QgeGVuX3BzZF9wYWNr
YWdlIGRvbWFpbl9pbmZvOyAvKiBfUFNEICovDQorICAgIC8qIENvb3JkaW5hdGlvbiB0eXBlIG9m
IHRoaXMgcHJvY2Vzc29yICovDQorICAgIHVpbnQzMl90IHNoYXJlZF90eXBlOw0KK307DQordHlw
ZWRlZiBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjIHhlbl9wcm9jZXNzb3JfY3BwY190Ow0KYGBg
DQoNCj4gSmFuDQo=

