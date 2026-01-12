Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862CBD138B8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:16:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200538.1516426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJeh-0005NF-IT; Mon, 12 Jan 2026 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200538.1516426; Mon, 12 Jan 2026 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJeh-0005Km-F9; Mon, 12 Jan 2026 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 1200538;
 Mon, 12 Jan 2026 15:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Amy=7R=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vfJef-0005Kg-Ob
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:16:29 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6a00a22-efc9-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 16:16:21 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM7PR03MB6627.eurprd03.prod.outlook.com (2603:10a6:20b:1be::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:16:19 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:16:18 +0000
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
X-Inumbo-ID: a6a00a22-efc9-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNjRm6kXmZj40gch0gu9Cio66cWIfKVzOBdthxwutgNxYZhIDm8ZBXm/UqaIBrAVGoNiDSntvb1pXMWBXwrL0c9OfBV67S0z7NSAu7OfiQuDhuX2imbcnrLO5nCwDM+YP7zcg8/0M2negSuHLlHBn65aanxfcLc8EgIZAxMAfV7xPsMe2U8jZTN1aLqn54DJP38kMusvlKwGpac8g6YZ5OcU6YsbgFqZeHtx8Gap668vcMfLtSDbe3Ywl3v3+xKJWhOBj0hNOxF2HvYRFwYsrSjxH5ymUqMjj2V6cmCAFufkcOLJzJJJyB6xPw2AFcMqyBKM4AjJu9y4YnQt9wObcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mWGS+L361xhqia19vi8YLSgRAMLD2/gMJg3VkdUYZY=;
 b=Ole1fLcDg7NtVFySRWBoLO4xaYMawl12/TDGU9LJJTp01c5vt50EAXJYpm3eHYucLaZHVZkBc5f0uKjS48bl0RgOkSDqGUiQN94+k07mHW65SwOhw16OROOZ02NrwPeVP6NIG3bXqKYWa/5iLRiWhw6NhVSSjKb5JDrCqwWsyFhlCzqcRR/SbwVJVGB3LQrvwDqbSaCDV/iWa7XLZWV0ekKmQMZDlxCw88GOhLHuQJtXcr9mPofcQ0p8dt6FzX6t9H2mR0Q8O8iD69ulIUNuN0l6fEz3BQwKd+4FkW2Cjo9beaXcIR9NXJKsnRBn1P5CIO+HFgbxb4StrWJtxl881w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mWGS+L361xhqia19vi8YLSgRAMLD2/gMJg3VkdUYZY=;
 b=N2QJaSw+WF/d1L5yEipZo5Bm5ZFQ/CNFc6R7dY30da/nhuDl0pjt9dP1BRENtuwAvTHMk+yoByN7wRGa4C7EnOx94DDI169H95SVro/EPB0ZDnl9XEolBBpWOntix2F2+n2YZC1kbnasz9MZ+rr0DYNKe2otBdUn2eTfWUu58qXUjI3dANpF1GDUN+hk8jBTSB/7uOGd1XsRLDgtWZLEL1k4Yq55bGoPxWO/tYmU0zXzKt+zL7ST7Ert59KP3hcAEjzDU2IzKsAvEQ9zNjmSiltCVhe8jlicafL7SINE5Bfs53Nlmn8SOzEyNoUdSCb81uTtbcd64h3ORnafYk4GVw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Index: AQHcSyafS16SOr0Uk0OkeRdy8jd8Cg==
Date: Mon, 12 Jan 2026 15:16:18 +0000
Message-ID: <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
 <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
In-Reply-To: <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AM7PR03MB6627:EE_
x-ms-office365-filtering-correlation-id: 66bb91bc-adca-4536-336e-08de51ed897b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?akJxM3ZGbHhNOWtjMHJvWTJWQWxUdjVXZ2JqWlMvWWVPRWZKL294bnp1SGZE?=
 =?utf-8?B?ejJleTI3bGhXYkFCQVBRa3NybXBOTThBdmhwZGVvYVVBdjRCaGt6RFNCVXc5?=
 =?utf-8?B?UFZGZXNkYTcycnNNQkNSaDJFSmdaWG5FSzRpMVVOMC9Zdy90d0RFY29zeExq?=
 =?utf-8?B?SmhkanZkcEtEWHA1REsydi9FMTc3NC9yZVpVWUpyZTBya1c0ZjBJRVpNSE5L?=
 =?utf-8?B?VndoRnFud05ER01JZm40aHE4aTJaUjh4anhjQythUUYrRUt4Wm04QzUzQUdw?=
 =?utf-8?B?Z0NDbHFiSjdrZDVsZnRTZ0xTNmpSaThpQWRtU0Q0cklIdWRRd2FiVWJ3RmZB?=
 =?utf-8?B?YXJpSmM4cGlHSnhOYXk0MDJraDdDQmdxcEp4VG1CSWM2bUYxbHAyZ2R3dE9N?=
 =?utf-8?B?OTdPUjlaenpqS040U2NQYVNySk5hQ1hEYWJESUlHMXJkcm9RbEhpbDRFQkM1?=
 =?utf-8?B?aXl6Qk9lZWNYZEtOOFh6SmR4T0FHVkZldmE0NlYrOFVVZ21zWlQ0WllsRit5?=
 =?utf-8?B?MFJuLzhtVDl2czVzbUswMi9reDhVQWxYT3ZNV0VxeCtwb0FxcU1CbS94T0xx?=
 =?utf-8?B?ZHlLWXpRNjlUYzVaUlQzWTRVMXVkOHJ5d1hJUEo1ektkMWlOVWMxdVR6eUhY?=
 =?utf-8?B?YUdLNytXQUV0a1U3cm9LejdhR3hQYXpreUJMNVNuWEUrelQyc2xWSTJBUGQz?=
 =?utf-8?B?STgwUEFHMllaWUZWckI2YVJRNVNiRWJvL1NJcjN5M1lMQk00SnBUd0QyZ29m?=
 =?utf-8?B?SDRNZ0ROdndBc3BHSHVGalRaWVpuL0lEaFJZdFN2bWVBYnRob2xxa1p1SUEz?=
 =?utf-8?B?L2N2Z1hDYkVzMGxzY21ER2dDSmcvUElTdk5tcEkvTytFQ0RjT1I1VlBoWUJv?=
 =?utf-8?B?Q1FpZ3EwODNibnBSRnI0VFU3SlRad04wWURaSERKRDVQTHJXRFFPUnBSbGlB?=
 =?utf-8?B?MkVOSkhzWjU0K2syZTZRd2RHRUdnODc1Q1VBNSs3R1lvajhwNGU1YlpoMzN0?=
 =?utf-8?B?K09aVExrakxSYXVNWHlneDVoS0ZSMFhzMFErMUUxTHZIdUtJcGpMN3lFcGkx?=
 =?utf-8?B?ckMxZ0N2L25xWFpGakNjRzNYcU54YjZxa2pQbi9zWUQ1aVd5c2E5eVljQ0JC?=
 =?utf-8?B?UEpIOUdjMlRCdUlGWm9FMit5QmtVRmEvZExUc0F2VUpGL0NHTkNnY2NpQXNi?=
 =?utf-8?B?TXBMRDRzYWhURkxPdUg3OUxOQmx4NzBZSEx2WDFUVzJGL3k3MnlEWFpqanIr?=
 =?utf-8?B?eFpsRHdxZ3RDL2hBaVlpNktRSFFFUXFIbzFwckZuUEJCREJCOUxYZnF2SmZp?=
 =?utf-8?B?SFV0cEZsWUV2VVBBbmFDeXBROGZZQitCR1lWK1htOUVNQWNvb2lpNGFaeCsz?=
 =?utf-8?B?UWxKQUZiVUJwVGFNZ1FzNWwvMnBnampEOEtZRHN5TGN1V1JUSDZ1UDhtcTlm?=
 =?utf-8?B?bm5NblF0d3FtejFhOWhWTUZSOGZubVRXUWVIVVlreEtNSHhUUk1TcmR2bjRO?=
 =?utf-8?B?SUVxdyttcVRXV3lPS0RvYUd3NFUxTjZ5VHozejFrcXJtSndXejRKUis3RkZT?=
 =?utf-8?B?bzlFc09keEgzRW9BQVZPOHR1cFhkb2xLNUVFVE1EVk9YajRtYTl5MmRHOVFD?=
 =?utf-8?B?c3NSQjE4TlJZOWpSdmxoR29icUx3dDV3ekdGY0xuMUcyMUI2MkJyMXpJaHQz?=
 =?utf-8?B?RVAyZWw2R05HZGJBMnhEZ25zZjBnaEVFMFY0Sm41NGU0MVlxNVBibjNCYjcv?=
 =?utf-8?B?bytjTzFzUnV4VWJYTmFOWnhhSDUrcERKZ0hvWjVucE1vQ1I3K042T2EwRjgw?=
 =?utf-8?B?ZmtSVFVWWXM3MlNmVUpSR1BLYWhHN1RKb0J5aUdmTm5Qb0I0bStDNEdDMmJO?=
 =?utf-8?B?TEE1TmFIZHVsT3BLV3RySWg5ZWN1ZDlibzU0MTZDWkppSzN1ZXlJbGFFVVNq?=
 =?utf-8?B?U095Zk1seWNoYnp2elRmVDhwcUtYRjFxTXRYdkoxNmlsWFQxdVJ6OHFOK0E0?=
 =?utf-8?B?bzJPU1VEWnVFdThOWnV4QXRaYlVIMnRBYU9rQjhVOFlIb0d2cFIwTyszQURD?=
 =?utf-8?Q?WWNpVv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUZlSmJtV2cvRGZXNk9zT29lcm5wUlk5dlI3aXoyT2x6ajVhZ1hlNDNQSmFH?=
 =?utf-8?B?UFEvaHV2TGhTeVVxcFg1Z01LSldHekN0TWZCeTdzR0Ftb3FNRHlZSmRGRmRX?=
 =?utf-8?B?Y2NvVGFVVHpqVGRrSDR4L0xTcFNMMmN2dzlTZHExcytuVGROb1ZteGtnc3hX?=
 =?utf-8?B?RWsxVnVXZVhETTU4dDd4TTgwelpVdmRWWHJhNnlUVmtXWWluSTJjV0ZUbkJI?=
 =?utf-8?B?RERCOTNzcTF5S25pZStCUkxVTWVYci9jekRWNHhjU0xVRE16VlI1aFlPL0ls?=
 =?utf-8?B?MnNEeEFxeU5BNkFsdWxzd2ozd2QwTkN3b0FMSXB4aHMyM1h6TzhEVVJsOEZ4?=
 =?utf-8?B?UStiQWNwKzlBTmROL1lwSmlRei9YeUFBN2Z3TXBYbmJNaTFvMWgzTDRFVzNO?=
 =?utf-8?B?TUVoaVJqTER1aXd1a0d1dWRNZ0k1Z05MU3NxZVVtSXdzR2lOVnUwbnp3bWJ1?=
 =?utf-8?B?MFNzQ0VaSE5xL1QxUGVrMHc4MFBaSllmNCsyaDE3M000eXdONnJQTUM2bnlQ?=
 =?utf-8?B?Yzh2dDBjc0NQMy9BckhqZW96ZHZ4QjNHejgrbjduUnl4OVovK2IrdWhtc2Np?=
 =?utf-8?B?MlN4Um90aWtraXJoaVFrWktFQjBqQmNyOWM2Z1BHY0JFL2p4bHAzMnVqT2po?=
 =?utf-8?B?TEtTamVnQ0FXT2VNZnJKMDBEZDAxa1pVZGl0eUk3QkQ4aWtNcDhnbW5OYkp3?=
 =?utf-8?B?TWhHNHoyRFZyMDduaGlUalNadit4OW9Ra3ZFeEhmbURtYU5NYU4veHNTMk8z?=
 =?utf-8?B?TmUzVi91eWRTcUpXNitqYUFuS0pIVElOMnA4YittZXUrR2N0Zi85S2s3NHdi?=
 =?utf-8?B?ZnpYanE1TTRmMGtHdnUrTXd6czdiNFRWMkZzTkdWaFIvUEc0YmovUmYwVEJX?=
 =?utf-8?B?eDZJSmh4QlpoNE1LdFpjcEZoRDdHdW9sRGIwR2kxVWNWbERYYjhMbkx0cVhD?=
 =?utf-8?B?L05tVWo0dEVkYmJoWVFJSTBIWWRNVGNIZVF3TkNtb2lFeFlZZEJSdnkxUjRC?=
 =?utf-8?B?ME1OcG9lS09tRHVkUWZPVHBxRDVlMEU1Nm1JWU9oc3k3RHRqZEZsV2d5WHlK?=
 =?utf-8?B?MSt2VThJTldxMk00dXhxbXhid01sbUlrdE1qc0lCdk9wdis0dzBSZmpxUkRv?=
 =?utf-8?B?OE5BN3JCTnNqemNHYmhQdHNCV2RlQjB2c25KcEx4SFFkQnVtemNXMDByaGE5?=
 =?utf-8?B?T213dE5lUUhQUXljVkFjVmNuU2tlU3dOU0F1RUxEY0FpaDU3TGVteVBmYmk5?=
 =?utf-8?B?Z1RMRHVQdDZtWEhFTWFreDFmUG1NTVUwVDB0OXh2K1FoM3BXZVZteHlvVVNk?=
 =?utf-8?B?VUFodnpZWkNmT3hJMXZjd1dMWDQyc3cvMjFTZ3JzbHBhYk8rN2FGUWt1MzNj?=
 =?utf-8?B?bzk4L1laWWdaeEh6OG8xaTdpdHlRN1pHQUo1dUJSbDJMbTJJUlYxS1VzazRT?=
 =?utf-8?B?Q0F4RStSZUVDYm9KK0ROdzVSbkVSMzFKSmlpZWhmWWp6MkFxak1GNVliT3BU?=
 =?utf-8?B?NWxDcy9RcUZGQjdoUkk2V3FOZWNqU0JTbnY4RE5NczNMSTh3YVZucWc5N0Z3?=
 =?utf-8?B?dU5mS2VpTERHTm1Lc2dSZFBjWjZRMWUzZzRTdzFEVmhPNzc3cXZqNzFVM0lK?=
 =?utf-8?B?Q3RiaWlRSWFKUW1lcUZGRmdMblVHeC9SWVRvMkJrZkR0R1lndDBIanhwc3NK?=
 =?utf-8?B?ZVhNanFIay8zaGtGR0lyTXNnUW1LQ25XNDA5QjNpbEFaMTRUTGM4M2lnWnM1?=
 =?utf-8?B?SU0zS05rMWhpZ3lvbTBncXRxQnRFc1hHc0hFbm9panpKblRDTXdXd1dPZUFQ?=
 =?utf-8?B?TEdBYjRPcGgvK1dpS3lhbEh5V05ZOTVjYmRNWHJKR21YWERlK2gyS2s4bUIx?=
 =?utf-8?B?OW1EVVQzQlMzbUR0V3lkeXdkSFBJNGgrT0tiY0N6SlA0c3VWR0QzSzJEcUQ5?=
 =?utf-8?B?Q2lycHIzeHBvTkRYNzVidEZNSVNWTSt3YXJHSkRCajVDN3pXcXcrY29aZXlQ?=
 =?utf-8?B?YkI5VitsRlBTaTlOOHlXZzVYSWppYzFnSU02ZkhCWlp4TXp5dTVteHRkdUZP?=
 =?utf-8?B?YyszdlFVTkNKZDNGM3RmRldPZ2pOa1NkSW1vWUhQSHZmYkVUNVJ2TkNTOUFC?=
 =?utf-8?B?SG5Tc0hCREdwOHRoV3hScCtBWTd1NWw0UnRSVlM5NFF6bHNqN2hHcGtUVU9N?=
 =?utf-8?B?MzM3OTVRNjdVdkNtUXN4blVURlhFU1VLRFJneVlPT2dqSkFoM1ptQzI3ZnFD?=
 =?utf-8?B?cm04R2NmVDJmbG5Oa3BjakF0amtnMndiZzB0KytpTmRhbExvdUJNYlZ2UmtN?=
 =?utf-8?B?MDU5VjdacmVXcnVkU1Q3a2VMY01VZllwbUc1M1dBUlA4Z25pakRPQ1RvMXl2?=
 =?utf-8?Q?SzqZndr1BeTMJSqg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F4250CADFED214CBAEF866D9F108F3D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bb91bc-adca-4536-336e-08de51ed897b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 15:16:18.8319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzNKpW5CejYx6+aAWhjVnxmb8AMrgM/SyyWO+sQPfCCVQf5fvHTiwQKD0/jEOEVYCrO5Wbv8Ruxv+QGBtXF5phco61Oik4dM+m0vGPLDokI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6627

SGkgSmFuLA0KDQpTb3JyeSBmb3IgYSBsb25nIHNpbGVuY2UuIFBsZWFzZSBzZWUgbXkgYW5zd2Vy
cyBiZWxvdzoNCg0KT24gMDYvMTEvMjAyNSAxMjowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9u
IDAxLjExLjIwMjUgMTI6NTYsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4gLS0tIGEveGVu
L2NvbW1vbi9kb21jdGwuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYw0KPj4gQEAgLTI5
LDYgKzI5LDcgQEANCj4+ICAgI2luY2x1ZGUgPHhlbi94dm1hbGxvYy5oPg0KPj4gICANCj4+ICAg
I2luY2x1ZGUgPGFzbS9jdXJyZW50Lmg+DQo+PiArI2luY2x1ZGUgPGFzbS9maXJtd2FyZS9zY2ku
aD4NCj4+ICAgI2luY2x1ZGUgPGFzbS9pcnEuaD4NCj4+ICAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+
DQo+PiAgICNpbmNsdWRlIDxhc20vcDJtLmg+DQo+IERvZXMgdGhpcyBidWlsZCBhdCBhbGwgb24g
bm9uLUFybT8NCkdvb2QgZmluZGluZy4gVGhhbmtzIC0gd2lsbCBmaXguDQo+PiBAQCAtODI3LDcg
KzgyOCwzMiBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21j
dGxfdCkgdV9kb21jdGwpDQo+PiAgICAgICBjYXNlIFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2
aWNlOg0KPj4gICAgICAgY2FzZSBYRU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZToNCj4+ICAgICAg
IGNhc2UgWEVOX0RPTUNUTF9nZXRfZGV2aWNlX2dyb3VwOg0KPj4gKyAgICAgICAgaW50IHJldDE7
DQo+PiArDQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogQWRkIGNoYWluZWQgaGFuZGxp
bmcgb2YgYXNzaWduZWQgRFQgZGV2aWNlcyB0byBzdXBwb3J0DQo+PiArICAgICAgICAgKiBhY2Nl
c3MtY29udHJvbGxlciBmdW5jdGlvbmFsaXR5IHRocm91Z2ggU0NJIGZyYW1ld29yaywgc28NCj4+
ICsgICAgICAgICAqIERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUgcGFzc2VkIHRvIEZX
IGZvciBwcm9jZXNzaW5nIGFuZA0KPj4gKyAgICAgICAgICogZW5hYmxpbmcgVk0gYWNjZXNzIHRv
IHJlcXVlc3RlZCBkZXZpY2UuDQo+PiArICAgICAgICAgKiBUaGUgYWNjZXNzLWNvbnRyb2xsZXIg
RFQgZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2hhaW5lZCBiZWZvcmUgSU9NTVUNCj4+ICsgICAgICAg
ICAqIHByb2Nlc3NpbmcgcHJlc2VydmluZyByZXR1cm4gY29kZSBhbmQgZXhwZWN0ZWQgdG8gYmUg
ZXhlY3V0ZWQgZm9yDQo+PiArICAgICAgICAgKiBhbnkgRFQgZGV2aWNlIHJlZ2FyZGxlc3MgaWYg
RFQgZGV2aWNlIGlzIHByb3RlY3RlZCBieSBJT01NVSBvcg0KPj4gKyAgICAgICAgICogbm90IChv
ciBJT01NVSBpcyBkaXNhYmxlZCkuDQo+PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIHJldDEg
PSBzY2lfZG9fZG9tY3RsKG9wLCBkLCB1X2RvbWN0bCk7DQo+IFdoeSB3b3VsZCB0aGlzIG5vdCBi
ZSB0aGUgaW5pdGlhbGl6ZXIgb2YgdGhlIG5ldyB2YXJpYWJsZT8gKEkgYWxzbyBkb24ndCB0aGlu
aw0KPiB0aGF0IHdlJ3ZlIGRlY2lkZWQgdG8gcGVybWl0IHZhcmlhYmxlIGRlY2xhcmF0aW9ucyBh
dCBvdGhlciB0aGFuIHRoZSB0b3Agb2YNCj4gc2NvcGVzIG9yIHdpdGhpbiBlLmcuIGEgZm9yKCkg
bG9vcCBjb250cm9sIGNvbnN0cnVjdC4pDQo+DQorDQo+PiAgICAgICAgICAgcmV0ID0gaW9tbXVf
ZG9fZG9tY3RsKG9wLCBkLCB1X2RvbWN0bCk7DQo+PiArICAgICAgICBpZiAoIHJldCA8IDAgKQ0K
Pj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IFdoeSB3b3VsZCB5b3UgaW52b2tlIGJvdGgg
aW4gYWxsIGNhc2VzPyBJZiBzY2lfZG9fZG9tY3RsKCkgaGFuZGxlZCB0aGUgcmVxdWVzdCwNCj4g
dGhlcmUgaXNuJ3QgYW55IHBvaW50IGluIGFsc28gaW52b2tpbmcgaW9tbXVfZG9fZG9tY3RsKCks
IGlzIHRoZXJlPyBPciBlbHNlIGlzDQo+IHRoZXJlIG1heWJlIHNvbWUgY3J1Y2lhbCBhc3BlY3Qg
bWlzc2luZyBmcm9tIHRoZSBkZXNjcmlwdGlvbiAob3Igbm90IGV4cGxpY2l0DQo+IGVub3VnaCB0
aGVyZSBmb3IgYSBub24tU0NJIHBlcnNvbiBsaWtlIG1lKT8NCj4NCj4gQWxzbyB0aGlzIGRvZXNu
J3QgbG9vayB0byBmaXQgdGhlIGRlc2NyaXB0aW9uIHNheWluZyAiVGhlIFNDSSBhY2Nlc3MtY29u
dHJvbGxlcg0KPiBEVCBkZXZpY2UgcHJvY2Vzc2luZyBpcyBjaGFpbmVkIGFmdGVyIElPTU1VIHBy
b2Nlc3NpbmcgLi4uIg0KPg0KV2UgY2FsbCBib3RoIGJlY2F1c2UgU0NJIGFuZCBJT01NVSBjb3Zl
ciBkaWZmZXJlbnQgY29uY2VybnMgYW5kIGEgRFQgDQpkZXZpY2UgbWF5IG5lZWQNCmJvdGg6IFND
SSBmb3IgRlctbWVkaWF0ZWQgYWNjZXNzIGNvbnRyb2wgKHBvd2VyL2Nsb2Nrcy9yZXNldCkgYW5k
IElPTU1VIA0KZm9yIERNQSBpc29sYXRpb24uDQpTQ0kgcmV0dXJuaW5nIHN1Y2Nlc3MgZG9lcyBu
b3QgbWVhbiB0aGUgSU9NTVUgd29yayBpcyByZWR1bmRhbnQuDQoNCi0gc2NpX2RvX2RvbWN0bCgp
IHJldHVybnMgLUVOWElPIHdoZW4gaXQgaGFzIG5vdGhpbmcgdG8gZG8gKG5vbi1EVCwgbm8gDQpt
ZWRpYXRvciwgbWVkaWF0b3IgbGFja3MgYXNzaWduIGhvb2spLg0KVGhhdCBpcyB0aGUg4oCcbm90
IGhhbmRsZWQgYnkgU0NJ4oCdIHNlbnRpbmVsOyBpbiB0aGF0IGNhc2UgdGhlIGNvZGUgDQpwcm9j
ZWVkcyB0byBJT01NVSBub3JtYWxseS4NCi3CoCBXaGVuIHNjaV9kb19kb21jdGwoKSBzdWNjZWVk
cyAoMCksIHRoZSBkZXZpY2UgbWF5IHN0aWxsIHJlcXVpcmUgSU9NTVUgDQpwcm9ncmFtbWluZw0K
KGUuZy4sIERUIGRldmljZSBoYXMgYW4gaW9tbXVzIHByb3BlcnR5KS4gU2tpcHBpbmcgaW9tbXVf
ZG9fZG9tY3RsKCkgDQp3b3VsZCBsZWF2ZSBETUEgaXNvbGF0aW9uIHVucHJvZ3JhbW1lZC4NCg0K
VGhlIGZpbmFsIGlmIChyZXQxICE9IC1FTlhJTykgcmV0ID0gcmV0MTsgZW5zdXJlcyB0aGF0IGlm
IGJvdGggcGF0aHMgcmFuIA0KYW5kIElPTU1VIHN1Y2NlZWRlZCwNCmFuIFNDSSBmYWlsdXJlIGlz
IHN0aWxsIHJlcG9ydGVkIHRvIHRoZSBjYWxsZXIuDQoNCkRldmljZS10cmVlIGV4YW1wbGVzIHRv
IGlsbHVzdHJhdGUgdGhlIGR1YWwgcm9sZXM6DQoxLiBBY2Nlc3MtY29udHJvbGxlZCBEVCBkZXZp
Y2UgKG5vdCBuZWNlc3NhcmlseSBJT01NVS1wcm90ZWN0ZWQpOg0KDQppMmMzOiBpMmNAZTY1MDgw
MDAgew0KIMKgwqDCoCBjb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW4zLWkyYyI7DQogwqDC
oMKgIHJlZyA9IDwwIDB4ZTY1MDgwMDAgMCAweDQwPjsNCiDCoMKgwqAgcG93ZXItZG9tYWlucyA9
IDwmc2NtaV9wZCA1PjvCoMKgwqDCoMKgIC8vIEZXLW1hbmFnZWQgcG93ZXIgZG9tYWluDQogwqDC
oMKgIGNsb2NrcyA9IDwmc2NtaV9jbGsgMTI+Ow0KIMKgwqDCoCBjbG9jay1uYW1lcyA9ICJmY2si
Ow0KIMKgwqDCoCBhY2Nlc3MtY29udHJvbGxlcnMgPSA8JnNjbWlfeGVuIDA+Ow0KIMKgwqDCoCAv
LyBubyBpb21tdXMgcHJvcGVydHk6IFNDSSBtYXkgbmVlZCB0byBhdXRob3JpemUvcG93ZXIgdGhp
cyBkZXZpY2U7IA0KSU9NTVUgaGFzIG5vdGhpbmcgdG8gZG8NCn07DQoNCjIuIElPTU1VLXByb3Rl
Y3RlZCBEVCBkZXZpY2UgdGhhdCBzdGlsbCBtYXkgbmVlZCBTQ0kgbWVkaWF0aW9uOg0KdnB1OiB2
aWRlb0BlNmVmMDAwMCB7DQogwqDCoMKgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLXZwdSI7
DQogwqDCoMKgIHJlZyA9IDwwIDB4ZTZlZjAwMDAgMCAweDEwMDAwPjsNCiDCoMKgwqAgaW9tbXVz
ID0gPCZpcG1tdSAwIDA+O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBuZWVkcyBJT01NVSBt
YXBwaW5nIGZvciBETUEgDQppc29sYXRpb24NCiDCoMKgwqAgcG93ZXItZG9tYWlucyA9IDwmc2Nt
aV9wZCA3PjvCoMKgwqDCoMKgIC8vIEZXLW1hbmFnZWQgcG93ZXIvY2xvY2svcmVzZXQNCiDCoMKg
wqAgY2xvY2tzID0gPCZzY21pX2NsayAzND47DQogwqAgwqAgYWNjZXNzLWNvbnRyb2xsZXJzID0g
PCZzY21pX3hlbiAwPjsNCiDCoMKgwqAgY2xvY2stbmFtZXMgPSAidnB1IjsNCn07DQo+PiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jDQo+PiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jDQo+PiBAQCAtMzc5LDYgKzM3OSwxMiBAQCBp
bnQgaW9tbXVfZG9fZHRfZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBk
b21haW4gKmQsDQo+PiAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gICAgICAgICAgIH0NCj4+ICAg
DQo+PiArICAgICAgICBpZiAoICFkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKGRldikgKQ0KPj4gKyAg
ICAgICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9IDA7DQo+PiArICAgICAgICAgICAgYnJlYWs7
DQo+PiArICAgICAgICB9DQo+PiArDQo+PiAgICAgICAgICAgcmV0ID0gaW9tbXVfYXNzaWduX2R0
X2RldmljZShkLCBkZXYpOw0KPj4gICANCj4+ICAgICAgICAgICBpZiAoIHJldCApDQo+IEhvdyBh
cmUgRFQgYW5kIFBDSSBkaWZmZXJlbnQgaW4gdGhpcyByZWdhcmQ/DQpQbGVhc2UgZmluZCBleGFt
cGxlcyBhYm92ZS4NCg0KQlIsDQoNCk9sZWtzaWkNCj4NCj4gSmFuDQo=

