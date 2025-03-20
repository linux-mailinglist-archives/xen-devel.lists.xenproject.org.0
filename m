Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF823A6A209
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 10:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921489.1325318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBmg-0001Qa-3E; Thu, 20 Mar 2025 09:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921489.1325318; Thu, 20 Mar 2025 09:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBmf-0001P3-VW; Thu, 20 Mar 2025 09:01:49 +0000
Received: by outflank-mailman (input) for mailman id 921489;
 Thu, 20 Mar 2025 09:01:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSLU=WH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tvBmd-0001Ox-Gd
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 09:01:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2009::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c2a8f3-0569-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 10:01:44 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB8452.namprd12.prod.outlook.com (2603:10b6:8:184::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Thu, 20 Mar 2025 09:01:40 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 09:01:40 +0000
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
X-Inumbo-ID: f1c2a8f3-0569-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtVzlPfcc70rwzBQbxR9Vxpgdcnh1li6GyBAJ6xKzCgdWNtzwVImhhbZP5hfsmSdAYW1gIWqzY3PQXGXTboVc5HtqhFjDSuNpwrhMmyjxpf6llPzjH15p1YudguUGYXd2awABUlTBv/mUP0WAHToWdegzse2i12Clas2OxiQnhCvbw0xbE0KT/juo6IM1q3/Tlo4HPTFLBLXt6xJ9BV4x/cj0k/TFQF8PhXkbvz8rVf2ZvmEBS4xB3ZqTuCpaOR7iiuLCjjtH7agQaQ3wbAf5hWVf7N/qKSPkIWpeBvBs4Xp+0Uzqhp8WLQP+RMBI2XWH0l1ODph335IYsgCZAoDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHVuCRChUVFBGGQHxwZzG7sqLXLQi8lmhfp28kTr39E=;
 b=X9t10LkqN4DkliFl8aIFzvs+W2/ppaZvuxkxofi95vtC1wf/zqranRkjRW9CwUG5bXhScmq45zlFqzVhpvjR8Q11L9Kbny4Y+CM7MSND9QUKndk6J3d2ACtIafOuFn/gNiIq4s+apuCFkdLvJI+Uec+5SiDS59u+4MhWGc9Z+MXwIu8y0tL1X53stL5GF3h40NpJu21ExMN2CyI1Rsnh29HKkqfczazJxft6gHkwLDs6ED+kiWYCRT6Q4PswilKjh7v/YlHOED2y/FKRpjUhJFe3rRhN8oK++IWij5Ccr29MgEwHoeFQhqMst9ue8RQaPgm0ZlUy1ZBvmdlAg6h1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHVuCRChUVFBGGQHxwZzG7sqLXLQi8lmhfp28kTr39E=;
 b=3GZnAEAVeE7lIT+16eOi9pBVkRtGNjyKnvdVn1k9SYQ2YX28PKY8WiQQCDa7BfrMmWjrly8PABK3NonAR6vWyaI/ZONdllnqN/b7GpKUQBJsLn5/HQYEekdbgUwRJ+AwchtxXCijacS0D/ln0D6wNllXndBX93riESSYlgRht1I=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 03/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Thread-Topic: [PATCH v1 03/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Thread-Index: AQHbkwQ4YtLwdtCzBUqbGFlzJHozTrNw+akAgAq7AVCAAA6JAIAAAgHw
Date: Thu, 20 Mar 2025 09:01:40 +0000
Message-ID:
 <DM4PR12MB84514C303CBEECE9454A4055E1D82@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-4-Penny.Zheng@amd.com>
 <D8F4G80E0LHU.5GHN1ZVVNHYB@cloud.com>
 <IA1PR12MB8467691D93E223033398DCBCE1D82@IA1PR12MB8467.namprd12.prod.outlook.com>
 <318177c1-8bb9-4d30-81a0-6636183f2571@suse.com>
In-Reply-To: <318177c1-8bb9-4d30-81a0-6636183f2571@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=ddfb5eca-2cf4-49cd-9555-6b7c30ea294a;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-20T09:01:33Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB8452:EE_
x-ms-office365-filtering-correlation-id: 5db3a183-6ec0-40c8-cb03-08dd678dd43c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZC9jUXFIK2RmdmFYVjRVV0Y0eG8vZWduVWJsWFkxRm5kQVdPdm1pcWhwV0R3?=
 =?utf-8?B?d3F2NzZzS3VsNWdwSXhxdEdwWVRwRGtwcGZzQzQ5NXJBMWNOSWticXA3b2l6?=
 =?utf-8?B?KysxWGlmQzVrZzNWNWV2bGl6TVV6VGIrbzdSa2NXeWZHWmpZcWxyRkFxOXFn?=
 =?utf-8?B?Y0tTeFc3Rk0wUjM4cFlReklac3p3cW9TWE9Wb0ZSRXJ1WmxLN2J5N05sdXVk?=
 =?utf-8?B?OFVvdDloZDVrbmZkSmZ1U1BtRlV3a2swaDBGVXU5aENmQnBpem4wQmtxbGNX?=
 =?utf-8?B?OWU1QUgvK3N6emN6eFRZbkZ1THpKTTRzNU9JUXZMcjM2ckJtNThmNWFmRHZG?=
 =?utf-8?B?bmZ5UnNhM2daL2dtYzFBSE96WGRYbjdhT0xrR3dBdy9udkZSaCtZNTJjeTdQ?=
 =?utf-8?B?R2RzT3I0ZkFXQXYwdTJ2NEcxVkdTd1dCREZCSFFobVZjNHFMNVNZVmdJWnRW?=
 =?utf-8?B?eTFZVGVqcC9WVHhVNVJ0dndLNkFCdkh0VXBzWitGbUNZbTRSWnYzQTZDdm5x?=
 =?utf-8?B?cU1ES3hVKzNHQmdBSW4zS3pnWnhQcXJIOG45YmFvSFdUYnBoaE4waXNGaXVq?=
 =?utf-8?B?bkhCeTlXODkxWnhKUEdNUG43WXROejU3UTl4bld3TmUvcmkyRVlueFh0NGJ6?=
 =?utf-8?B?WGc1UTB5dXpJTnc1VDZLM1d2ZTdCWDdtQkt2cVRRYjVlUjR4a0NtcFp5enBs?=
 =?utf-8?B?SXZkcyt4MTFuc1FGVUxWUHRESWhrYWk5QkxQNVpya0JZV05xTFlYUktxdGZo?=
 =?utf-8?B?a1o2QUVYbUpKSlRaaG1FRjU5V2dTbXhVamk5MjJsVkpXYUtNWUpVUFc0Y3ho?=
 =?utf-8?B?SElzT0g3endYTERwREk2cFFwaldaVTBSTFZaTlNTVjhzbVV2alE3VnVIUnFI?=
 =?utf-8?B?cGZ5N0lkaTR5a2tvbEVac0JYTC84azdZci9ITDR0SDl4M0NjSy9IdFRadGQ2?=
 =?utf-8?B?WUwwaHdMMzlld01nRlZrbUNVV3ZzbFhjbm4wSllQamlqUWVXdzE1M3pnY2k3?=
 =?utf-8?B?TC9EbEh0NDM3MTlVR3dNVzh6VjF0Tm12K0NqYnQ0QllkMWRvUkppTnh6OGtk?=
 =?utf-8?B?cGd0MEc2V3ZCSWNjc2ppSUJDa2FVeFo2Y1Bhd1NxMFh5UXNRQmNwU1BKTHhX?=
 =?utf-8?B?TmRVWGdTM3JmeTVsY0ltekcyUVl0QjJPNHJMakVsais3Z0pDNVp5a09MUmox?=
 =?utf-8?B?cWpxNGZ5LzZjVTE1SWkyK3lQVHZxQXlWWWRTZTRGMk1JTk1FYUdybGpUQzBL?=
 =?utf-8?B?aEdnSnkyS1psckw0NDhDTE1uMWwwYUNmUnhjWDBCV1FCWStmRXNNT1lZRUNl?=
 =?utf-8?B?eG9NSXFmUGMyRmMvT3NVN2tIdFZvbUowbTJHRitYYUVtMFRFOU5TTGU0T0lQ?=
 =?utf-8?B?d3RzdjJFY3dFdlcrMzI5dVRhSGl5NVZBdDRNaUh4dUJqdDdmVVJReXE2WkQ5?=
 =?utf-8?B?UG4vY0YwM3ZnazcwV21EVlM1MTM5MmxRakpGV0JZdkFFSkJ3Q0xGcno2V2Rl?=
 =?utf-8?B?NmwrY3BjL3p3T2E3OUxuTWxKUDZmTExOSXRLUkhsb1F3bHRDZ3dDbnFIQzk0?=
 =?utf-8?B?Zjh4enVPTWs0Z2QxbGFoSkNndmFTbFZZcXVkaFYzVkxEQVZtZGFsMXRuWWpW?=
 =?utf-8?B?b1RSQ0xUcVRCOHBTU1FMUjVGU3ZrKzJHamo0Sy8rdGdqcnhOcTM3NXlwRlkv?=
 =?utf-8?B?ZzZXd3lQT1RlaHFJcHlkbWZvd0lqTGlFZXphbDNxa0JxalhCeU9Ya3RVK0th?=
 =?utf-8?B?cHIvQ09vWmdSa1FBZUgwMEdwYi93MmlVaWtKd3FTUno3NXdEOFNxUWlWWTlm?=
 =?utf-8?B?eUQyNWFZdTNScFpYMFEvQkQ2bkdaa1J6SHVHSVZpL0ZONjNEZzJEU0Q5WW9z?=
 =?utf-8?B?enJmajJwRGRJNkVnSDRYRi8vMkQyaWk3RTdKVXpmY2pVbEg3bUdaY2V3Vkcr?=
 =?utf-8?Q?5odG5gpxWA0EhYdweNhb4key3V88XDt2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L05Ya2pJN3lrNjgxY0U5Zms0Vmx1TzFQb0pGVWVIYTF0RXU5dTVIOGdwbStP?=
 =?utf-8?B?cnI2dmJDQnFEalUwVkZ3VzMrY25TMFk5R3JPcXZjWEpPbEtUZTQzY0Nacjk5?=
 =?utf-8?B?ZEJlNHZvTVZWNmwzdG15ZWd4QjdyalhHd09kVVJqaVlUaE03RVhHZ3piQU9U?=
 =?utf-8?B?bFQ4amEyRnpyeGJaMlFJc1RDUEU0VjY3bFptcTlmb3N4US9uREFGS1NrT21E?=
 =?utf-8?B?UDlJcjdZdnhKc0hiWE9rbXQvSzJzK1RNd3M2V2RGQW1zYnBjTFhpZmZDdmJo?=
 =?utf-8?B?ZFZFRWpablptYjh0aTV4MnhEVTZ5ZWRRNzA0VW5FbDA0b3gzc0lOMkM5YS9j?=
 =?utf-8?B?MzFhYnpvNFZCYVFWbGJ3Wm8zNEpnVHRkNWV5bWFFNDZZbXA0am9VL0M0RWIr?=
 =?utf-8?B?UktWMUpIc2FWYS94MUFsa0FqTm9XdDNkenhzRGVQVU1IRzRJazNuTzVta1VX?=
 =?utf-8?B?a0RRcys1NmtiUVgvUTl2Tm1NSjFIRzQvV2Y0T2FuYWZxSXVIOUFjcHN5OGtq?=
 =?utf-8?B?R1lEdElLT0h3aEs3bUFqZ3pvQ085NFpZSHdpYnhWL3ZzemJZVmVSOElScDBE?=
 =?utf-8?B?elBPclRTZStOSG43cG1EM1RaRjliSGttU3Jtb0JBWDZZL01YbWl0dnBQZzRT?=
 =?utf-8?B?bS9JTzNReUNFNjRueHQ0LzdvYjJ4b2QySzJmNDVobVIwNFBqQitWMjVPRWV2?=
 =?utf-8?B?aXJIUm1HTEF5SGlmNnZoL0xoK0doWVMyTFQrZS9iaXNtMHltaDlDYjRNUVVT?=
 =?utf-8?B?ZTBBV0tOUW4yYnZNUHJNWkMwQWl4NTM4MlBMamFDUDd2VGJWVHM3Q3gxMkt5?=
 =?utf-8?B?ZDhFTHFJRmcrbXphT094MkYwMlQ4Y3lqNTJ5VDk2eHVmQ1BnZ1RvM0tXeVZR?=
 =?utf-8?B?RHg2TWUweGxUdmpLQXlsTGFLdzk0dE55TzFlVWM2dlEwRjhoM0lvNWVkQUlC?=
 =?utf-8?B?dnduU1ZKTWx5MlhiRmtQWS9mdnl6V25rY09EQmVkUEpiazJoY2gzU0lkTkha?=
 =?utf-8?B?cW1xU1dGbC90VzVZaUhlcEdyMkV0UnFZdzNDMWRLVktBTDQ0ZVBWd09HNlZ3?=
 =?utf-8?B?ZzQvcHhSWEpGRUJrTlJMNkRqLzNRVFVPdGVmUU9TZnVIUEJESjJJZElLd0hP?=
 =?utf-8?B?QVFMcFp6S3FRb0x1TWp0bjF2WDdSdjRpdjR2Y2RUVDFtek5VVXhaSUh1WE4x?=
 =?utf-8?B?UXJ4bFJUdkRnYWNtZGJJRGxrY1QvTHNOd2p2NHp1U2czVmxlV21ZV3h4K3Z5?=
 =?utf-8?B?aUhBYytTWHlTbWlpUk9HVXpxUE5YRjRvc0FvYzdENmRuYWFNM2NUSy9SK0Zv?=
 =?utf-8?B?cmVBTDhUcUhsUDdnVVhUOGFURENRZGQ0d0pyZGlWajl1TkhmYWVnL0ZDT3R5?=
 =?utf-8?B?cG50OEJaMFJraVBNVlE4WTB2WDZlWTg2cC94NDBmeG9kQ2FJdjdDZFJEVHB3?=
 =?utf-8?B?ZjRQeHBlK2JCbnRaeFEwL1ZKeHovazh5S3QveXVNZG5HZkVzOWFFMDZrUnpy?=
 =?utf-8?B?cUhOSXJ4K0NZKy9GMVdBTEtOUUFuYWkvbTRUUWdpZUVZNmlDUHdZSTZURG5h?=
 =?utf-8?B?RWNmNTJ0SFFPd0lJZW1mOHRPUk0yekoyZE83dHJBR2hFc2Z5cWhIcmFRZDVB?=
 =?utf-8?B?YjFjQ2ljVjFWODM3bVlJb1JoUmcrelJ3NmlmTmJNOXdlditNOU9NU3JXM01l?=
 =?utf-8?B?T0JmWGw0d1dCRVBqY2cxMEhxdUFnUWlRcHY4d3Aza2VNTlpnekZ2Qkp6aHNj?=
 =?utf-8?B?MlpCZFFQS3BOOE5sUGxTeXJIVVpZN3pNSS90dHNzMGVEb1E2VnNzd1ExdTdj?=
 =?utf-8?B?WjdpNjRWVTlLUlFnUVI1cXp2eFBaQllLUTF4SFRiK2JLbEFsMU94Qm9ZYS85?=
 =?utf-8?B?WkhDZnV4dDRNM3VBRzlPdlN6WE1RQThtMWFRS3FaUVJIbzBPL3VmekMvcnZH?=
 =?utf-8?B?TnY5YVR3MHpFaFJHdFgzRTgvOEgrYTRBVlUrWDkwcFM4eFBvV0ZySTA2ZmpR?=
 =?utf-8?B?cndHNUptZ3czWndvRXZpb2FmSDZ1NnNRZDhOOFk0dTFTTXJGd3JsanFOaEJp?=
 =?utf-8?B?bktlZWxDa2FJblBqcnlObHhZNGxoT0FBaFBmaGV2MEdKZVp1MXE1RE42THh3?=
 =?utf-8?Q?oxS4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db3a183-6ec0-40c8-cb03-08dd678dd43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 09:01:40.4739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39447qdRZ+06l+U8RGTHM0ZS5+TQYsCCVcOB4z/iMJw08hPH5BDqioxq2R0KMUwwWsIRgJaov7e1wjzE95ztBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8452

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2gg
MjAsIDIwMjUgNDo0NyBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29t
Pg0KPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQHZhdGVzLnRlY2g+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IERhbmllbA0KPiBQLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT47
IEFsZWphbmRybyBWYWxsZWpvDQo+IDxhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwMy8x
OV0geGVuL3N5c2N0bDogd3JhcCBhcm91bmQNCj4gWEVOX1NZU0NUTF9yZWFkY29uc29sZQ0KPg0K
PiBPbiAyMC4wMy4yMDI1IDA5OjAyLCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEFsZWphbmRybyBWYWxsZWpvIDxhbGVqYW5k
cm8udmFsbGVqb0BjbG91ZC5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxMywgMjAy
NSA4OjAzIFBNDQo+ID4+DQo+ID4+IE9rLCBzbyByZWFkY29uc29sZSBpcyBkb25lIGhlcmUuIEkg
c2VlIGhvdyBpZiB5b3UncmUgYWxzbyByZW1vdmluZw0KPiA+PiB0aGUgY29uc29sZSBoYW5kbGVy
IGZvciB0aGUgc3lzY3RsIHRoYXQncyBhIGJpdCB1bndpbGVkbHkgdG8gZG8gaW4gb25lIGdvLg0K
PiA+Pg0KPiA+PiBJIHRoaW5rIG15IGVhcmxpZXIgcmVtYXJrcyBzdGlsbCBob2xkIGluIHRlcm1z
IG9mIHJlbW92YWwgb2YgZWxzZSBicmFuY2hlcyBvZiBpZmRlZnMuDQo+ID4+DQo+ID4+IE9uIFdl
ZCBNYXIgMTIsIDIwMjUgYXQgNDowNiBBTSBHTVQsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4g
VGhlIGZvbGxvd2luZyBmdW5jdGlvbnMgaXMgdG8gZGVhbCB3aXRoIFhFTl9TWVNDVExfcmVhZGNv
bnNvbGUNCj4gPj4+IHN1Yi1vcCwgYW5kIHNoYWxsIGJlIHdyYXBwZWQ6DQo+ID4+PiAtIHhzbV9y
ZWFkY29uc29sZQ0KPiA+Pj4gLSByZWFkX2NvbnNvbGVfcmluZw0KPiA+Pj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29tPg0KPiA+Pj4gLS0tDQo+
ID4+PiAgeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCAgMiArKw0KPiA+Pj4gIHhlbi9pbmNs
dWRlL3hlbi9jb25zb2xlLmggIHwgIDggKysrKysrKysNCj4gPj4+ICB4ZW4vaW5jbHVkZS94c20v
ZHVtbXkuaCAgICB8IDExICsrKysrKysrLS0tDQo+ID4+PiAgeGVuL2luY2x1ZGUveHNtL3hzbS5o
ICAgICAgfCAxMSArKysrKysrKy0tLQ0KPiA+Pj4gIHhlbi94c20vZHVtbXkuYyAgICAgICAgICAg
IHwgIDIgKy0NCj4gPj4+ICB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICB8ICA0ICsrLS0NCj4g
Pj4+ICA2IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+
ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMNCj4gPj4+IGluZGV4IDJmMDI4YzVkNDQuLjZlNGYzYzQ2
NTkgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYw0KPiA+Pj4g
KysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMNCj4gPj4+IEBAIC0zMzYsNiArMzM2LDcg
QEAgc3RhdGljIHZvaWQgY29ucmluZ19wdXRzKGNvbnN0IGNoYXIgKnN0ciwgc2l6ZV90IGxlbikN
Cj4gPj4+ICAgICAgICAgIGNvbnJpbmdjID0gY29ucmluZ3AgLSBjb25yaW5nX3NpemU7ICB9DQo+
ID4+Pg0KPiA+Pj4gKyNpZmRlZiBDT05GSUdfU1lTQ1RMDQo+ID4+PiAgbG9uZyByZWFkX2NvbnNv
bGVfcmluZyhzdHJ1Y3QgeGVuX3N5c2N0bF9yZWFkY29uc29sZSAqb3ApICB7DQo+ID4+PiAgICAg
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY2hhcikgc3RyOyBAQCAtMzc4LDYgKzM3OSw3IEBAIGxv
bmcNCj4gPj4+IHJlYWRfY29uc29sZV9yaW5nKHN0cnVjdCB4ZW5fc3lzY3RsX3JlYWRjb25zb2xl
ICpvcCkNCj4gPj4+DQo+ID4+PiAgICAgIHJldHVybiAwOw0KPiA+Pj4gIH0NCj4gPj4+ICsjZW5k
aWYgLyogQ09ORklHX1NZU0NUTCAqLw0KPiA+Pj4NCj4gPj4+DQo+ID4+PiAgLyoNCj4gPj4+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY29uc29sZS5oIGIveGVuL2luY2x1ZGUveGVuL2Nv
bnNvbGUuaA0KPiA+Pj4gaW5kZXggODNjYmM5ZmJkYS4uZTdkNTA2M2Q4MiAxMDA2NDQNCj4gPj4+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmgNCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi9jb25zb2xlLmgNCj4gPj4+IEBAIC03LDEyICs3LDIwIEBADQo+ID4+PiAgI2lmbmRlZiBf
X0NPTlNPTEVfSF9fDQo+ID4+PiAgI2RlZmluZSBfX0NPTlNPTEVfSF9fDQo+ID4+Pg0KPiA+Pj4g
KyNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4gPj4+ICAjaW5jbHVkZSA8eGVuL2ludHR5cGVzLmg+
DQo+ID4+PiAgI2luY2x1ZGUgPHhlbi9jdHlwZS5oPg0KPiA+Pj4gICNpbmNsdWRlIDxwdWJsaWMv
eGVuLmg+DQo+ID4+Pg0KPiA+Pj4gIHN0cnVjdCB4ZW5fc3lzY3RsX3JlYWRjb25zb2xlOw0KPiA+
Pg0KPiA+PiBUaGF0IGZvcndhcmQgZGVjbGFyYXRpb24gc2hvdWxkIHByb2JhYmx5IGJlIGluc2lk
ZSB0aGUgaWZkZWYNCj4gPj4NCj4gPj4+ICsjaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+Pj4gIGxv
bmcgcmVhZF9jb25zb2xlX3Jpbmcoc3RydWN0IHhlbl9zeXNjdGxfcmVhZGNvbnNvbGUgKm9wKTsN
Cj4gPj4+ICsjZWxzZQ0KPiA+Pj4gK3N0YXRpYyBpbmxpbmUgbG9uZyByZWFkX2NvbnNvbGVfcmlu
ZyhzdHJ1Y3QgeGVuX3N5c2N0bF9yZWFkY29uc29sZQ0KPiA+Pj4gKypvcCkgew0KPiA+Pj4gKyAg
ICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4+PiArfQ0KPiA+Pj4gKyNlbmRpZg0KPiA+Pg0KPiA+
PiBUaGlzIGlzIG9ubHkgY2FsbGVkIGZyb20gc3lzY3RsLmMsIHdoaWNoIHdpbGwgYmUgY29tcGls
ZWQgb3V0LiBXaHkgaXMNCj4gPj4gdGhlIGVsc2UgbmVlZGVkPw0KPiA+Pg0KPiA+DQo+ID4gQmVj
YXVzZSBJIHdyYXBwZWQgdGhlIHN5c2N0bC5jIGluIHRoZSBsYXN0IGNvbW1pdC4NCj4gPiBJZiBy
ZW1vdmluZyB0aGUgZWxzZSBjb25kaXRpb24gaGVyZSwgdGhlIGNvbXBpbGF0aW9uIHdpbGwgZmFp
bCBvbiB0aGlzIGNvbW1pdC4NCj4gPiBTbyBlaXRoZXIgSSBhZGQgI2lmZGVmIGludG8gcmVhZF9j
b25zb2xlX3JpbmcgZnVuY3Rpb24gYm9keSwgb3IgaW4gdGhlDQo+ID4gbGFzdCBjb21taXQsIEkg
ZHJhdyBiYWNrIGFsbCB0aGVzZSB1bm5lY2Vzc2FyeSBlbHNlIGNvbmRpdGlvbnMsIG9yDQo+ID4g
Y29tYmluZSBhbGwgY29tbWl0cyBpbnRvIG9uZSBBbnkgcHJlZmVyZW5jZT8gT3IgYW55IG90aGVy
IHN1Z2dlc3Rpb24/DQo+DQo+IE11bmdpbmcgZXZlcnl0aGluZyBpbiBhIHNpbmdsZSBjb21taXQg
bWF5IHlpZWxkIHVud2llbGRpbHkgYmlnIGEgcmVzdWx0LiBUcmFuc2llbnRseQ0KPiBhZGRpbmcg
I2lmZGVmIGluIHN5c2N0bC5jIHdvdWxkIHNlZW0gbGlrZSB0aGUgY2xlYW5lc3QgYXBwcm9hY2gg
dG8gbWUuIEluIHRoZSBmaW5hbA0KPiBjb21taXQgaXQnbGwgKGhvcGVmdWxseSkgYmUgb2J2aW91
cyBlbm91Z2ggdGhlbiB3aHkgYWxsIG9mIHRoZSAjaWZkZWYtcyBhcmUgZHJvcHBlZA0KPiBhZ2Fp
bi4NCj4NCg0KVW5kZXJzdG9vZCwgSSdsbCBhZGQgI2lmZGVmIGluIHN5c2N0bC5jIGFuZCByZW1v
dmUgdGhlbSBhbGwgaW4gdGhlIGxhc3QsIGFuZCBhbHNvIGFkZA0KZGVzY3JpcHRpb24gd2h5IHdl
IGRyb3AgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UNCg0KPiBKYW4NCg==

