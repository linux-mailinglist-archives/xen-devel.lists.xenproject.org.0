Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1452BC4CC0A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 10:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158895.1487277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIkxs-0007uI-L2; Tue, 11 Nov 2025 09:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158895.1487277; Tue, 11 Nov 2025 09:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIkxs-0007rU-H5; Tue, 11 Nov 2025 09:47:04 +0000
Received: by outflank-mailman (input) for mailman id 1158895;
 Tue, 11 Nov 2025 09:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifhn=5T=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vIkxq-0007rO-Me
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 09:47:02 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56ba1575-bee3-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 10:46:48 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB7725.namprd12.prod.outlook.com (2603:10b6:8:136::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Tue, 11 Nov 2025 09:46:43 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%3]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 09:46:41 +0000
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
X-Inumbo-ID: 56ba1575-bee3-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3EpDjn8pcqBXWk//0YKLeXllXih948U4MJNTlVUO2LyeKP3K8iNbM1CCzLAkrt2lU6lMnNV4SIEuZIqSWKips3oD86kVL1fsgpSyxZn87MspwthyVZ4NcIHd803KdOz5elz1D1AdVJjh0BMK4TPXwwEyLrohj78Ru1fOYFXdtRmFj5H34+pbVLBBKWDLtqpGWtA84PSdP7lethKKYj4kkG5kW6SqdGAcNk22lfvAh4CAbR9M07C+s9Z320Mp8U1NZ/zdosKXO4ykgWTjPokvfn1tq3HxrFFTdZjgyej4+rJpiua7r1ja1SzRqDyzqJ7WjRE0zas74htOF299Jqh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRmkybsfnEO975H3bsyuVrhD4+SDTVTgo5Iq+4pho+I=;
 b=p7Rd++8kMEcNL8zZHRz+Wu8W0s/QBeKEgddn28L5f5i71VVuoU6YwrkTknvmTIM1SbOBmJpawGtnKUVb5YA8j08UnVOVhU+TbEEi8E/YCu/9TpUHZ+JBMfASK/zUJxBkDSLw4MmKjAH3x3byMIGIuzQEixtWiv7AlGiUqKfT+l5/ZEDvyxQvuQxk/QT3TKBSqFR9PJSoo/+nTFVRARHVhlI7QGduBVyd+PQOGTdLEX148v+o8Q3ftfv7TiT0pC9wNFUJn9E5Ae9mhD0gBwOwKJ3cC9VoIzC0fgdfglSIy0YtCRr0q+tpPi14L3/liY82wUGA7sHt0Mfuq1ILUlMj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRmkybsfnEO975H3bsyuVrhD4+SDTVTgo5Iq+4pho+I=;
 b=WCfuFDXgT3eP2jPjeAjMs3sdcmMy851rilkCAKfJXU01yocTCADKhWTGvWB9CqAsABE3j5Vq4l61MxgHy+0Sm+qjbRMiOtLLPa40ekIw1WhSVGrYLdwm9VOokm24beN0YMRB6NMZwcTwgG2u7uhOz2fwdYqnxfV5trwJNuS0B9U=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: RE: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
Thread-Topic: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
Thread-Index: AQHcPCqA+mY6s9fCEkmLa9SlVlA0PrTZYSAAgBPVwiCAABbwAIAAFwrQ
Date: Tue, 11 Nov 2025 09:46:41 +0000
Message-ID:
 <DM4PR12MB8451D02B2F0878219556EB3AE1CFA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-10-Penny.Zheng@amd.com>
 <1a9ac91c-2295-4749-8807-668fcecf8f8e@suse.com>
 <DM4PR12MB84515407D91133DF7B182BF1E1CFA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <c1fbdd8a-1c4d-4dda-8dff-e0206ab1cdc1@suse.com>
In-Reply-To: <c1fbdd8a-1c4d-4dda-8dff-e0206ab1cdc1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-11T09:46:02.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB7725:EE_
x-ms-office365-filtering-correlation-id: 865d73e0-27a8-42bb-be78-08de2107378c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bU8xemZEVmtOWGJCdUl3YUdvR0xMZEIyYkpDRmZySUJobWpiZTI3UldaVXhB?=
 =?utf-8?B?ZkE2RlNjaE5wek5qdjNNcmlMb0hXUHEreGdBR2JIdzJRWnM2eUJNOWxjY2ZM?=
 =?utf-8?B?UitSV3JwL3lGVnN6dDJUTWdIcWxocmZFSXlBb2t1bEJ5VW15MWlia3JzZkU4?=
 =?utf-8?B?RGlOb2lGSjVhNXNScElwdWR6VXNJTW5MWS9BdWlMYUpqWFlPSU1aVG40OWVn?=
 =?utf-8?B?MkdvV2lUaHFPMXNUelhOWWhJTzgvbGpxeEVDdFVRbnlZT0VoaEVkaWNwU1ht?=
 =?utf-8?B?RnpvSjJLZEt2ckMwcEtKYkVmQWxqcHNYS3AxMFI3d2ZEeHczNVpFeU9qOCtj?=
 =?utf-8?B?cFpoVVRkWlM5bHVhQXJPNEpVUXd5dGZIdHpnSWU0NEpyRFlTSDRCTHF2UWFM?=
 =?utf-8?B?NkJwZzhrbDU4SkhlQmM4L29HMldsN213N1E2U0o5RUwvTkI4T3NXUzFUKzRY?=
 =?utf-8?B?RW9HNExwWlJKVkVSUjRPd3ViQWNCazFRVFlyQXA4RE5kdGZLZWxZQXgxTjBw?=
 =?utf-8?B?bFhFOVByaGpRUVlYU1h4SzQ2eG5ReElUOXE1RHVzaWh6OHRaYkNYYStHZzJH?=
 =?utf-8?B?NE0wUE1zckc1SldUSHpEaHJwVllTS3JFV0NrZDJHRnhRSXhTSWoyRXgyVi9L?=
 =?utf-8?B?R25HL3Y4enRYRVRIR05zMUNrWTM4N0RWaVpYMDllMzBPV1ZVMjB2RFZLdmVH?=
 =?utf-8?B?OG1XaTVITVVzM0FocHpBcXJ3UFZFSzlFb1JGMGNPMm5qWnR3NXlhVHJYQ2Nq?=
 =?utf-8?B?SU12U1duRSt5ZHYxdnJPR0VsbnA4MnArQ0ZjeHpZMlROWmZQUTFvcytjeUhv?=
 =?utf-8?B?Q05ma21lUWRvRzc3L2tYZXk2bUlvYUdpRU1DamtMR0M2Y1FhMkM4TjZMQXc1?=
 =?utf-8?B?b0dzdXJKOU85NFVpck1CN0RqdW5pbEF0YmROOUJqYTVwNW9uN1pzRTNiSmV3?=
 =?utf-8?B?cXZSRS9GMjFrRzVwbkZWU2pnNjRZWUdMWkJJY0RJaW9COHVXRlc5Nnd4V05u?=
 =?utf-8?B?YUU1K2dmUll1NzY0KzVZbzA0WUYzakpWK2lQUXlBSTd1OW5wdDMvQVdoWmZy?=
 =?utf-8?B?Y2o4aEF5ZU53cDFyMmRTbW8rNGhRVm5oVFl5dHY1QXhxR0dMd2JBY2hoNVc1?=
 =?utf-8?B?RFFVdHg3NjNjTjVYU2xZaDBxemNYdkhWMVFqS2JmZzRVQUd6SExkQnRCdHov?=
 =?utf-8?B?Y0ZLa2hTMnpkTEFvMloxVytJVk1oc3RaQldMSG9yR2RKVDNYWXBuQm1uUHIz?=
 =?utf-8?B?YUZvYWdqRjZ0RUtsVkpicmJqLzFERWcrZWhjcVI4ajY5VE9NVmRQWGVnd0xN?=
 =?utf-8?B?eVNHVjlFZDNZQmhYeVNNbkpHTXN6NjE3TmZqRXNtTHN0TitPanFoNHF0OWJk?=
 =?utf-8?B?V2cweGczZ285QTluSUVMOTlQUy9IVENxaWV0YlpvVEorUmkxTDRpUnN6V2Vi?=
 =?utf-8?B?YmowOHF0MFRtZkkxTWc1aVJPREVwdGtTd04vNjFjK3pjZmR6amN4WUgrZEFG?=
 =?utf-8?B?cG5RM0ZQbWVFWTdPS2xrNVhBVUhjZEVpZ1hiRE9ERmE4eHJHY25WeC8zek9u?=
 =?utf-8?B?TzJtdXlOeEt5dE9KSXpFclAyblp0TzVJY28yclJscFMrdWtyZ0x4ZVYvc3Fq?=
 =?utf-8?B?cGtPQkdlMVJreW1RdFF2Z0NpUTJmWVRxckxVcUNBMVJqSkdmOEFFNlVPOGJ5?=
 =?utf-8?B?bmFBYndhaVE1RjE1VVVyTkw2OC9Pa0c0Z0VuZk4vZm1yaFUyWkU4T3V3c05l?=
 =?utf-8?B?ZnRiejM3UWJaMlFYblhCWUlVUDVzM1dKMXhqbDlwSGRoZ1hiN05kRENZbkhm?=
 =?utf-8?B?RDM4N0M4ZmFJV2FKcHFTaThYaS9hcDdjUlUxOElqZHhibG5kME03eGU0UFhu?=
 =?utf-8?B?V2tSa3VRL1hUQTBCWTk0czBCK3c1cVl3V3hqZUxOeXRORGQxQVpjOWlST0pR?=
 =?utf-8?B?NHMxQUlQSCtjdFdwS3FpcEt1Ty84eHpOVVFGQjA3T05odHd1QnQ1K1lWUEcz?=
 =?utf-8?B?KzFCK3hnaUc5ZnBtRWFwVnJDZXAyWmNCVnpDQnNnSkIrSjBKWVgycHpwTjVi?=
 =?utf-8?Q?T2iJ5P?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UERaa3I5eXhQNjRSR0taY0VHamxaTi9kT045N3p4UWF2Qng0Tm92TkZ4TmFm?=
 =?utf-8?B?NEVCV3ZtQWgwL0w1blJDQXVRbXdIQXdDeWQrR3JlQTVINTBQWHhubFdueVoy?=
 =?utf-8?B?WjRKK0kwNUtnSytJRlVoVFIzUXgraTMzdUh4ZnFYZDA1R2t5V21ITkI4V2Ny?=
 =?utf-8?B?OCtPL1JJRFRGRVRrcGxMbDhpMCs4SnhUUDc0b3ptYTVUNW45aUQ4U3c0UVNv?=
 =?utf-8?B?b1k1a2RyRnZMN2UzcFdjdERYNEhDaDdyT0tBb2JTUHJBbnRtOVhQRmdMZVVy?=
 =?utf-8?B?TWxTQzFKSjQyazdVeFpoT0gxZWo0cG9UMUxYTklyMmJ3bWNESklVbndCRGZo?=
 =?utf-8?B?M1VQNjl4MjZXYzVIcURaR2xFdTEvSjBpSFY4VFRJWWxTc041RndJSmF6QzhM?=
 =?utf-8?B?M1E5dzI5OGovcVhFRHVJYnJ6ZEVZVzhrK1FqQVB5aGtFMWVoUlZlOGR3U2ln?=
 =?utf-8?B?MTRjbHVOdmpZWmcvTEo4MzdZTzM4SmE3MVYxS2FmQ3dQL3ZlL2grWTQ1TmVi?=
 =?utf-8?B?TE03SkRiZll2bU9URk14T1ZwNVFiNlJmSC9ZVFZOTVFZUHhsMXd1bmROaFFM?=
 =?utf-8?B?ZGowSnJqNGM5LytyLy9VMEhwMk1qbzU2Sk1lcnRUYVI1ZHFYY2NiZ3pTMDNi?=
 =?utf-8?B?Z2VUVW9uRTNVdEFZa2xFcE0zMkRNeGhoVTI1VlNTZHIrcFpWelRtNlk0eEUr?=
 =?utf-8?B?eC9JUTRTNEIzVjdiYXd5ZUs5c09wemZzbFdXZEZ6Z014bmZoeGNiZWhpVzZi?=
 =?utf-8?B?YUVuR2JreWdKTitWOWxNOXRwUHp1ek5mTzVSL2U1V1VVd1UreEdlMUV1Zitq?=
 =?utf-8?B?eU9TM1VGZFJ5ZzdPaFFUNzFwVDRTbURkUEI2MjhTTGtFaXZtNnRBV285SUtD?=
 =?utf-8?B?ZmF0M0xHMG96UURsL2lueEtrRXY3ZnBMeDZ6MDU0R29KdnVmaWx0WUxVNlJt?=
 =?utf-8?B?YUpuZWpxUGlYaTRGclR3TVZjd1FCdlg4UHFoV3dhK09UUTdheXkzNFRZdEVH?=
 =?utf-8?B?RUpZS21TSUZCenllWTNuUENlZ25SY1ZOKzNaTFRjeElQNTRqWEx2Q1MxSFE4?=
 =?utf-8?B?UHdLb0c4L0w4ZVE4Z2M0azVxTEpPVUZaM1VIY0RTNjlHem5CVHUxVmtBc3JM?=
 =?utf-8?B?UXB6N3ZwQVFBMjI4b2gzU3V1dXBoNmhJSlRqL1AydHhuK3lLSFBEcmJDcmhS?=
 =?utf-8?B?YlhpdmVsRFRDbGR4Z0lxejRFc1Zmc3prNE84Mjl4WXZoeWtLUmZVWXBqNzc5?=
 =?utf-8?B?cDJKTW9uSmZIVVBUY056NWtiVTdYNmRJdE9MSjZLTGQ2Slk3Q29lZGRLdUdQ?=
 =?utf-8?B?dmJLNzNTV1NOdURrVlQyRi9iOVBYOWVUaWhjZzd5NGdCS1pDVnFHZm01N2tW?=
 =?utf-8?B?UXhIWExVRHpYNk52UkpHRTFNLzlrQ2tRSWxobGtIMjVGRElZVTZUaWdveS9t?=
 =?utf-8?B?VXVNNUtmQ3RtMGlraW9JY2tHOGUrTm9ESnQ5RDhWbnl1SmNxODhyMXcxUjlr?=
 =?utf-8?B?V2srNy82d3pDT2VtYlpRQk5IS29PcCtyT2g1M0tjbjF6TG9VaHhSeHBLRW9p?=
 =?utf-8?B?KzcxcjdxOVdFRXZxcFJjTXpsNEVuaFBISkJkc1BGVXV2aEtBR2RwVEg5THdm?=
 =?utf-8?B?Q2psd1IvVTRjN3NPcTRqNUw5VzBOZWYrNGNPdHBrcUZFTnFxRUhvSHRqS1hz?=
 =?utf-8?B?K1VObmp3cC9FWndqNFkyVG1QbDhyZXplNXA4SXIrcVRhdTc3byt6UWFia3ll?=
 =?utf-8?B?ZkhSdkMyYTNPbytVY3lvQm9XU3lhY3lFU1BBOVBwZ0RycWZxdVV5U0Q3a3lw?=
 =?utf-8?B?ZFAza1o0SlVLSHQ3TFFQRmlZbnpJTzBWQkhsWG9vMk9EUkxnK1NSTEluZFNJ?=
 =?utf-8?B?Vkh3bmtPMGlSd0lKODcrVlRNZlg3QkFmV3prZ0F2VjhPWWRCTzVyVXVzcEhD?=
 =?utf-8?B?TTdWblZSWEw4NjMyS0ZFc3VRNHhZRVJUWGVWbDQzcE9pME9WaUxJRWVUY1Fz?=
 =?utf-8?B?VUFtcnArSSt2KzgrQ3haMEdIL2pDSFBZdGFqL2xHeDhVUytoRmhrZGxOQkJw?=
 =?utf-8?B?QngvLzF4UmVoeFZkVHY2NURuNm5jL29FM001NTVZaVlPTDZlR1B3dVk0Zjdt?=
 =?utf-8?Q?7lSM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865d73e0-27a8-42bb-be78-08de2107378c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 09:46:41.3564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mH6GMReATF0AtzHivkf2KkANXTjaCsOJ3l5kjLQhY9NB0TcV9JHIt3Owo1aeYhdI27Nrzza8S4/Eg3c/Uu2xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7725

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDExLCAy
MDI1IDQ6MTQgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgb2xla3NpaS5rdXJvY2hrb0BnbWFp
bC5jb207IEFuZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVs
QGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxs
aW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQWxleGFuZHJ1IElzYWlsYSA8YWlzYWls
YUBiaXRkZWZlbmRlci5jb20+OyBQZXRyZQ0KPiBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVm
ZW5kZXIuY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+IDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMu
Y29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBUYW1hcyBLDQo+IExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDkvMjhdIHhl
bi92bV9ldmVudDogY29uc29saWRhdGUgQ09ORklHX1ZNX0VWRU5UDQo+DQo+IE9uIDExLjExLjIw
MjUgMDg6MDgsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4gSGks
DQo+ID4NCj4gPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVzcG9uc2UuIEp1c3QgZ290IGJhY2sgZnJv
bSBsb25nIGFubnVhbCBsZWF2ZXMNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21lbV9hY2Nlc3MuaA0KPiA+
Pj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21lbV9hY2Nlc3MuaA0KPiA+Pj4gQEAg
LTE0LDYgKzE0LDcgQEANCj4gPj4+ICAjaWZuZGVmIF9fQVNNX1g4Nl9NRU1fQUNDRVNTX0hfXw0K
PiA+Pj4gICNkZWZpbmUgX19BU01fWDg2X01FTV9BQ0NFU1NfSF9fDQo+ID4+Pg0KPiA+Pj4gKyNp
ZmRlZiBDT05GSUdfVk1fRVZFTlQNCj4gPj4+ICAvKg0KPiA+Pj4gICAqIFNldHVwIHZtX2V2ZW50
IHJlcXVlc3QgYmFzZWQgb24gdGhlIGFjY2VzcyAoZ2xhIGlzIC0xdWxsIGlmIG5vdCBhdmFpbGFi
bGUpLg0KPiA+Pj4gICAqIEhhbmRsZXMgdGhlIHJ3MnJ4IGNvbnZlcnNpb24uIEJvb2xlYW4gcmV0
dXJuIHZhbHVlIGluZGljYXRlcyBpZg0KPiA+Pj4gZXZlbnQgdHlwZSBAQCAtMjUsNiArMjYsMTQg
QEAgIGJvb2wgcDJtX21lbV9hY2Nlc3NfY2hlY2socGFkZHJfdA0KPiA+Pj4gZ3BhLCB1bnNpZ25l
ZCBsb25nIGdsYSwNCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBucGZl
YyBucGZlYywNCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9ldmVu
dF9zdCAqKnJlcV9wdHIpOw0KPiA+Pj4gKyNlbHNlDQo+ID4+PiArc3RhdGljIGlubGluZSBib29s
IHAybV9tZW1fYWNjZXNzX2NoZWNrKHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwNCj4g
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG5wZmVj
IG5wZmVjLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qgdm1fZXZlbnRfc3QNCj4gPj4+ICsqKnJlcV9wdHIpIHsNCj4gPj4+ICsgICAgcmV0dXJu
IGZhbHNlOw0KPiA+Pg0KPiA+PiBMZWF2aW5nICpyZXFfcHRyIHVudG91Y2hlZCBmZWVscyBkYW5n
ZXJvdXM7IHRoZSBmYWN0IHRoYXQgdGhlIHNvbGUNCj4gPj4gY2FsbGVyIGhhcyB3aGF0IGl0IHVz
ZXMgc2V0IHRvIE5VTEwgdXAgZnJvbnQgaXMgc2Vjb25kYXJ5Lg0KPiA+Pg0KPiA+DQo+ID4gSWYg
d2UgKnJlcV9wdHIgPSBOVUxMOyBjb21waWxlciB3aWxsIG5vdCBEQ0UgdGhlIGZvbGxvd2luZyBj
b2RlIGJsb2NrIHdoZW4NCj4gVk1fRVZFTlQ9bjoNCj4gPiBgYGANCj4gPiAgICAgICAgIGlmICgg
cmVxX3B0ciApDQo+ID4gICAgICAgICB7DQo+ID4gICAgICAgICAgICAgICAgIGlmICggbW9uaXRv
cl90cmFwcyhjdXJyLCBzeW5jLCByZXFfcHRyKSA8IDAgKQ0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJjID0gMDsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICB4ZnJlZShyZXFfcHRyKTsN
Cj4gPiAgICAgICAgIH0NCj4gPiAgICAgICAgIHJldHVybiByYzsNCj4gPiBgYGANCj4gPiBPciBh
bSBJIG1pc3VuZGVyc3RhbmRpbmcgd2hhdCB5b3Ugc3VnZ2VzdD8NCj4NCj4gRmlyc3Q6IEl0IHdv
dWxkIGhhdmUgaGVscGVkIGlmIHlvdSBoYWQgYWxzbyBzYWlkIHdoZXJlIHRoYXQgY29kZSBmcmFn
bWVudCBhY3R1YWxseQ0KPiB3YXMgdGFrZW4gZnJvbS4NCj4NCj4gU2VlaW5nIGl0J3MgaW4gaHZt
X2hhcF9uZXN0ZWRfcGFnZV9mYXVsdCgpLCBJJ20gaGF2aW5nIHRyb3VibGUgZm9sbG93aW5nIHdo
eSB0aGUNCj4gY29tcGlsZXIgd291bGRuJ3QgYmUgYWJsZSB0byBzZWUgdGhhdCB0aGUgbG9jYWwg
dmFyaWFibGUgInJlcV9wdHIiIHRoZXJlIHdvdWxkIG5ldmVyDQo+IGNoYW5nZSB2YWx1ZSwgaS5l
LiByZW1haW4gTlVMTCB0aHJvdWdob3V0IGl0cyBsaWZldGltZS4gSWYgaW5kZWVkIHRoZXJlJ3Mg
YSBjb21waWxlcg0KPiBzaG9ydGNvbWluZywgdGhhdCBlaXRoZXIgd2FudHMgd29ya2luZyBhcm91
bmQgb3IgcHJvcGVybHkgd3JpdGluZyBkb3duLg0KPg0KDQpUaGlzIHJ1bnRpbWUgdW5kZWZpbmVk
IGVycm9yIHdpbGwgb25seSBvY2N1ciB3aGVuIHdlIHR1cm4gb24gQ09ORklHX1VCU0FOKCwgdGhl
biAtZnNhbml0aXplPXVuZGVmaW5lZCBpbiBDRkxBRykuIElkayB3aHkuLi4uDQpCdXQgaWYgd2Ug
c3RyZW5ndGhlbiB0aGUgY29uZGl0aW9uIGNoZWNrIHdpdGggdm1fZXZlbnRfaXNfZW5hYmxlZCgp
LCB3ZSB3aWxsIHBhc3MgZXZlbiB3aGVuIFVCU0FOPXkuDQpgYGANCmlmICggcmVxX3B0ciAmJiB2
bV9ldmVudF9pc19lbmFibGVkKGN1cnIpICkNCmBgYA0KDQo+IEphbg0K

