Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE938FAD5E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 10:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735212.1141390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEPNZ-0007T6-Un; Tue, 04 Jun 2024 08:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735212.1141390; Tue, 04 Jun 2024 08:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEPNZ-0007R7-Qh; Tue, 04 Jun 2024 08:18:49 +0000
Received: by outflank-mailman (input) for mailman id 735212;
 Tue, 04 Jun 2024 08:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAXK=NG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sEPNY-0007Qq-FR
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 08:18:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fc77823-224b-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 10:18:46 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21; Tue, 4 Jun
 2024 08:18:42 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 08:18:42 +0000
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
X-Inumbo-ID: 0fc77823-224b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOD6JKWydb2a5m5LGu6ACy+P8PJDVnkuLhdHB3JvFI4hdxXnRfLn/T7uv7GrUP4NsFYh9r05rmWI8O9cHdZfBmXu+eKPy0J36TI/6mG1TOJZiLwmfo4RKHXo89iujcKo975M80E/UXg9tNS75O/bsJ5Js578rLKRlNpqZ+3Y5tNr6qLvzNrVLj+RjxdPSYcmvBSP/aHgWKtzQI21bi7/mDvfsWtGFa3Va+35WWbs0bEWP8dE9X0wNMt/lhGgLiOnGWviGp4H72otCAkLoGQqcDb8WzE3fpoUg1cl9GHuvGiE+t5AhMo7oKhUyfn8N1CDRKklGymYBluvTXo651zW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++Lg/aGmLc3Bq6sVEngyKnRWXQfleRO5rke1pZtkoG0=;
 b=UlXEe/TC1dmXj6XX2bRM+XXM4I7zeBrkxHGxZvfDjuhr9xIWwCpFV3RWk7W1m4ryADOQDKJLD9lC8a3YOEryu67S6CYI4I++OBjEk5m9AOupg67djq/dCCO7nHsO4nzsCo975Y+Qtva0m3+bQSjXJv5k1L68ZBMy3kl0PrE70MvW++G2s7Av3iQLA1oXuUiM3EFSza9y1qRWaA7rpDtpnvOO5o0Sn9uiAuEMKBm78oZ77DOBiS47vuJuQjo9ZoB/jbkatkAeYjFU5O2pOIKSDR2/c9TXT42c65MaUZNtx0Y/vvhT7+TFJgtQBTzezcwEHpvMAt6EqgNdhJ4yQ2VEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++Lg/aGmLc3Bq6sVEngyKnRWXQfleRO5rke1pZtkoG0=;
 b=Q6uRfs+OS+TY3lDpComQVv/nqF42DYvMX1/QtUrw8Bvrh78D1YAhz28KazhNcLNgq+wuxgRKh0D3xJvLQNM96AJGdMOIoXIqeQ+36GHa4bJNlUUoDVpG6EA7zJ6cMPD4OEVfGZckzRrn0TbwUFoyqE6AbOiwgG4y2GDibIP9vMc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA//+0FICAAgSCAP//yCWAgAeLLwD//6n2gAAQ1XyAABA5GQAADz4pgAAu2vkAAEmxvAA=
Date: Tue, 4 Jun 2024 08:18:42 +0000
Message-ID:
 <BL1PR12MB58490E8F1F26532B0FDFFFD6E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
 <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
In-Reply-To: <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB8216:EE_
x-ms-office365-filtering-correlation-id: b824f69a-c252-4ba2-bf5f-08dc846ef23d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?M3pvRmVBcjJLaXc4ZGo3R01DNFcxUG1YZkQ1cjVEUFVMbm1VQURXeHBOU3FM?=
 =?utf-8?B?ck01M0N5ckFSTCtVcm0vSC9tVytCMzNMYjlCL1QzWUl6M3hHM0o2MndpVmhN?=
 =?utf-8?B?S0U1RkFvM3FuM0p1VklSRjViV3FYejUvQTUrdkNCN2pPbWJJY3dKdHl5NWN4?=
 =?utf-8?B?cUpxZitscDd0dHpiVHo1d28ybGlpM2ZmSTZvOHQxWWNLamY3OU5iQzM2V280?=
 =?utf-8?B?NXhWayt1ZWRBMGxKOVNyUnBuMkp6YmpLZHNpVTdwZXZiZGQ2VHFLR3psNWlQ?=
 =?utf-8?B?bzJPMGpKR3lzak0yd3dnZTBhUzh4S1dDTThWcExzNTRsQ2cxd3pkaVhuYzBk?=
 =?utf-8?B?WXVvMGpjajVvaGI0MFh2cUdrYk85MTdjK3BNTVVoOG0wOW5TZURLVU5KbnJ1?=
 =?utf-8?B?VFhaVWpLOExpR09iTU9ld0FXS3Y1bEJNOHJkOTlDeE9icnVxb2drbkdWNjVU?=
 =?utf-8?B?K1Qva24xcGl5T1BRR2FydlJzQlpvVWk4LzlXVU9QZVVXenZBQmZLVzhKQ0R6?=
 =?utf-8?B?ZWNSVExWKzUrQkt6dTJxRHJ5KzQyTkxGczh0WjhjYUMrb3hUL3JpNWwwUmVY?=
 =?utf-8?B?Z2hzOWJBUXlXUW9jT1hqWU03Mmo0aWxRbC8zR0JtRG5qMWc4eTdYWDFLUURS?=
 =?utf-8?B?OGVYa1Zic1FxekVIY2pNeXptSVZsTlVoNG1hdExobklZRmFlK0h2a08yNlBH?=
 =?utf-8?B?TS9Ha1VJNm9qaEcyOXB0TE9sRjNWWklLL2JKNzlSekx6ZGh5Z0ZVVXp6eXJQ?=
 =?utf-8?B?NCs5UytVejNjVG9PYnF3QVBsU3JlUVBwQy9oM054UE1XNFNGTFIxeVVkUy9M?=
 =?utf-8?B?MmJJb2UyRlU3WlZManVxZ25OQVV2UGFRZXNEWEN6aGVwc3phZVpiUkZHU1Nx?=
 =?utf-8?B?Z09UQUEwN3pzWUczbTh0Vzd1ak1tenV2SjVucmVrMEh3ajRGc2p3OURoL2J2?=
 =?utf-8?B?V29YMTAxUXJ3SnVlelcvV3FhdENtY24wYmUzdFBRTVp3M1hjQ2owSlI2aWlj?=
 =?utf-8?B?UXVFeWdCeC9lZVgvL1FGN25HM1lHRkZYTW4vZDgrUFNRSU5VVkE3dEd1ZENI?=
 =?utf-8?B?VTU0QlNrRkFBSkdKZDdINzZYeXlGcXhqeUl0MWhsREJraStFOC92L0I4RTU0?=
 =?utf-8?B?U3NkZkVUL1lvNFBwS2RhUTNOaGZXRnQ3alBaZ240anp1NVFLOFprR1ZWcXph?=
 =?utf-8?B?L1ArQWc2ZUJoYitnd3A5SXlUQVZRU0NRQ2VSWlNmd2lEekJJais3MkxOZnAv?=
 =?utf-8?B?TkI5WG1vRTZtQnRvckdXbEYwYXIrcjZBQUJ4Y0JBWmhJMmVKNHVndENMYXh0?=
 =?utf-8?B?dHpTTjRiWGNmVTlKRkNjMVJraGsrUWpxdFUrSXFIaVlyWXd0RVpMWUlTY01I?=
 =?utf-8?B?WmhDd04yZ3hzK3dwa253NGFLaVBZSi9ycGhDWm1wUnIyT1ZWMEZpZExQN2hI?=
 =?utf-8?B?eFp3Y0ZaVThRNmRwMURUclhaMlk4My9RcWo4UGhEMnlWL05GdUVFR2R0blJu?=
 =?utf-8?B?NDFRcGc0MFBDdnlma2xlczFCblFnREwwMnh6MU0wRnBvdTVrVFZUN3hGdU5a?=
 =?utf-8?B?ZjF6OVJSdE9ST3p3Q0hYSFlybVk0OTg1TUsyVUdiUWRjZVRoczF6QU5WYzU2?=
 =?utf-8?B?VXc5Tm9HdkhVL1c4S3RLWG03c2Vwa3pWeTNjYzNmM0srRGFvU1JvZ3o5Ym9i?=
 =?utf-8?B?VTBlUEJpMUV4M3RORGRQYng3allLaFNhU2tEQXZQTWZtN3F3Z25LZ08zVTFy?=
 =?utf-8?B?cE9hZTUybUxOaVRRQVpsSmZNS1NwMkJFNDJBQjlGVkwwVEc2Qys3NTg1YVE0?=
 =?utf-8?B?NUtGU2lvbGJMY1VMNFRTZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWd1RjBrbHcvdDdjNFJmdmR4aHJ2TXdwL3crQUt5R2RTV1p0RllnM3lYUTRZ?=
 =?utf-8?B?THpFVHhrbGJsUHE3cm9PdW96eW9ydSt5RHVZK1BVbmY2UDNxTzdQWjlYUHMz?=
 =?utf-8?B?RXdMdG52MUxNV0V2RFNScjQzUndoMmE3ZXVBb3FpeHZTQlNtZE5iQUNoQ25P?=
 =?utf-8?B?SHk1a3JWL0ZjenBYU2pFUWdOU2wvTTBjd1RjNCs4VlEza0tYN0ZQUGl3a2Y0?=
 =?utf-8?B?KzNBOWZRaUI1cVl6SW5IY2sydzJ2Zm9QZGJteFE1dEtmVHVsWE02Z1h1eUp5?=
 =?utf-8?B?Z1FLZ3JEL3VocytGcjQzcWcrSXE0eEh4WkRPT2h1S2t0eEVtRENWSEI0UFBl?=
 =?utf-8?B?amw5L3V2dlZwaUlwOTZlaWhiS2pJMWRQSWliSks2WTU4aFlMV055V1dyQlFw?=
 =?utf-8?B?dkhoZTlFclNEWlJSR2lrQ2tENjc0Z0d4UVBoS0U1b3pENkZJWlFMSHFMQXQw?=
 =?utf-8?B?VlVBcDNoWlRYbVJGVHZ1SUNqd2dmNDJtNW5BckF3aGRUeTVxeU5CbktpOFVu?=
 =?utf-8?B?aDZ4ckpSQlVxeGZQU1JtcmdUTWdNOXdyT21nSlY0NmJMbHlFNGsyYm96MHkx?=
 =?utf-8?B?SUlUeDI2eEF5TE1CelF4NlNKYXVheHRxZE5naEl5OUFuQWMxc1I4RWI4Um9P?=
 =?utf-8?B?NVVmWTNJWmoyR3Z5SHQ3K3RaZEpMc3I4WC9HSE00Q3d2bEhjYUZNaThzNThD?=
 =?utf-8?B?L3hGbWowN2dQcGs0aWkrdFdmWlhuendQUVArMnkxNWF5VnhhZlU3NVhLUmdF?=
 =?utf-8?B?clpCeDY3d2JCeldVQWpJRCtjRmVsSWp4dkhlN1N3bll2QWRPUWtBd21LcDdE?=
 =?utf-8?B?OHBuYVcwSi8waC8zUmJid0pXUEQzSzhkcStMOWFrV09BYWJScFhFZlhpbUVW?=
 =?utf-8?B?ZmlCQk5lblRNZ0FlTmNsWWxXQXR1dm0vOUNUemVMNHJFY3haeGtubFhjdmxm?=
 =?utf-8?B?R1kyNnlKN21JQ1grOEdTMktCUmpLN1l5YUJLTEtnd2pWZU9hS0RuZDZlVW9C?=
 =?utf-8?B?VTlqS0MxMzJydU1KekhHRktHU1FSMzZrcDNoZUQrMUxvaERnQ3RlRER2a043?=
 =?utf-8?B?b1VKQXdaN2V0RzdFWXExMFg3cnVPb1FyRHNqaTZZRHQxdEM0R0dlVGcyWXZs?=
 =?utf-8?B?VGgrazE0NnVKN0VpdXNtQWpwdjFUWVRpSHlBWXRDUXdFRE5HR2Q0VXR3Z0t3?=
 =?utf-8?B?QnBJS0VWMVRiM2dVeGxtbnk4Tk4rQmhJeXJjK1pnbG9lVGRicmdQdUt3eFFN?=
 =?utf-8?B?K1BnNVZlZElKNk5qUGhGaE5rUlpOcFdXNVN6ZGw2Sk5TUGRsRlhtZkVWd3RO?=
 =?utf-8?B?NFZ4dXQ2eHVwTk1HK2w1STBwNTVJbXZ5b0JRQmhlOE91SUs2RnZwZkxnTFRJ?=
 =?utf-8?B?Y050MVVuZ1dQdm9kSUJBZW9keXhLM0xtdjFsQ1NiWDJUZFNaU0ZWa285amta?=
 =?utf-8?B?eXExeGJPVWZ4cHUrQ0V1cTFMS29IeTBpNDhaYTdyQmxWRE5hTDVOZTV0L2sw?=
 =?utf-8?B?M1owcXVydHNKdlA5UFBxTXNrVkszNW9qNE96Q08vSTVpdjlQRXJCRGxRWXRs?=
 =?utf-8?B?THU5TmhFTVdZZUdLcFdhVFM1WDFiODVmZnhSUHo3SUpTOFR2M1B2eVpydE0r?=
 =?utf-8?B?UDYvclNuWjhDd1g2SVdZcGozV1g1M0pVNFNLUU01YkZYMjhDeWpzQmtQWjRj?=
 =?utf-8?B?U1dyY0k3M0p4VkpDQUJuVVhtS1JVeHpUSENreDZTWXVYMGwvNjhGOUllYXhz?=
 =?utf-8?B?dTZYd1hLZWc2RXdWNkFuMlNsN2pvQVlNdDZhRnBWMkx3TGh6dk5xcW9nVU1I?=
 =?utf-8?B?SERKL29KSVAwY256K3JWaWxRc25TeUw0ZGtkRGJ6cEo3V0RZMFNrNyt3d3E5?=
 =?utf-8?B?SkNHSXRrdnp1ajZnSTJTUVJjSHN2Ujh0RW93bjQ3OHpTT0dUN0dDNEp3Z0Zq?=
 =?utf-8?B?cHRaOTZDUnA5VnIzOEVOY0RxejBBek1ab3lWWmVYd1o2RDdtWWZYOXlWdmIr?=
 =?utf-8?B?QXMyQWg4eC9ib09BRXRUcHVIbS9QckYwcXJOckxMSkh1eUlkb043SC82elgz?=
 =?utf-8?B?Wlh4R0tKM1F6QUtMSm1OYm14L01uK0dweWtNZnZnWHRxbHdDeC9FZ1gxbmRq?=
 =?utf-8?Q?Jmu4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92A21E268EC7F49ACD1C7E638655663@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b824f69a-c252-4ba2-bf5f-08dc846ef23d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 08:18:42.4788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbFWmr5nHOC8sB9XZ3uoKniqUPtUt7eQNbiNQyWpi8YFIvNT/S1tCSoVCG5ViSMFpB+aj3eV3/sA08xfPPGlsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216

T24gMjAyNC82LzQgMTQ6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wNi4yMDI0IDA4
OjMzLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzYvNCAxNDoxMiwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDQuMDYuMjAyNCAwODowMSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0K
Pj4+PiBPbiAyMDI0LzYvNCAxMzo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNC4w
Ni4yMDI0IDA1OjA0LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNC81LzMwIDIz
OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMzAuMDUuMjAyNCAxMzoxOSwgQ2hl
biwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+Pj4gSXQgc2VlbXMgb25seSBMZWdhY3kgaXJxIGFuZCBn
c2lbMDoxNV0gaGFzIGEgbWFwcGluZyBpbiBtcF9pcnFzLg0KPj4+Pj4+Pj4gT3RoZXIgZ3NpIGNh
biBiZSBjb25zaWRlcmVkIDE6MSBtYXBwaW5nIHdpdGggaXJxPyBPciBhcmUgdGhlcmUgb3RoZXIg
cGxhY2VzIHJlZmxlY3QgdGhlIG1hcHBpbmcgYmV0d2VlbiBpcnEgYW5kIGdzaT8NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gSXQgbWF5IGJlIHVuY29tbW9uIHRvIGhhdmUgb3ZlcnJpZGVzIGZvciBoaWdoZXIg
R1NJcywgYnV0IEkgZG9uJ3QgdGhpbmsgQUNQSQ0KPj4+Pj4+PiBkaXNhbGxvd3MgdGhhdC4NCj4+
Pj4+PiBEbyB5b3Ugc3VnZ2VzdCBtZSB0byBhZGQgb3ZlcnJpZGVzIGZvciBoaWdoZXIgR1NJcyBp
bnRvIGFycmF5IG1wX2lycXM/DQo+Pj4+Pg0KPj4+Pj4gV2h5ICJhZGQiPyBUaGF0J3Mgd2hhdCBt
cF9vdmVycmlkZV9sZWdhY3lfaXJxKCkgYWxyZWFkeSBkb2VzLCBpc24ndCBpdD8NCj4+Pj4gTm8u
IG1wX292ZXJyaWRlX2xlZ2FjeV9pcnEgb25seSBvdmVycmlkZXMgZm9yIGdzaSA8IDE2LCBidXQg
bm90IGZvciBnc2kgPj0gMTYoSSBkdW1wIGFsbCBtYXBwaW5ncyBmcm9tIGFycmF5IG1wX2lycXMp
Lg0KPj4+DQo+Pj4gSSBhc3N1bWUgeW91IG1lYW4geW91IG9ic2VydmUgc28gLi4uDQo+PiBObywg
YWZ0ZXIgc3RhcnRpbmcgeGVuIHB2aCBkb20wLCBJIGR1bXAgYWxsIGVudHJpZXMgZnJvbSBtcF9p
cnFzLg0KPiANCj4gSU9XIHJlYWxseSB5b3VyIGFuc3dlciBpcyAieWVzIiAuLi4NCj4gDQo+Pj4+
IEluIG15IGVudmlyb25tZW50LCBnc2kgb2YgbXkgZEdQVSBpcyAyNC4NCj4+Pg0KPj4+IC4uLiBv
biBvbmUgc3BlY2lmaWMgc3lzdGVtPw0KPiANCj4gLi4uIHRvIHRoaXMgcXVlc3Rpb24gSSByYWlz
ZWQuIFdoYXRldmVyIHlvdSBkdW1wIG9uIGFueSBudW1iZXIgb2YNCj4gc3lzdGVtcywgdGhlcmUn
cyBhbHdheXMgdGhlIGNoYW5jZSB0aGF0IHRoZXJlJ3MgYW5vdGhlciBzeXN0ZW0NCj4gd2hlcmUg
dGhpbmdzIGFyZSBkaWZmZXJlbnQuDQo+IA0KPj4+IFRoZSBmdW5jdGlvbiBpcyBpbnZva2VkIGZy
b20NCj4+PiBhY3BpX3BhcnNlX2ludF9zcmNfb3ZyKCksIGFuZCBJIGNhbid0IHNwb3QgYW55IHJl
c3RyaWN0aW9uIHRvDQo+Pj4gSVJRcyBsZXNzIHRoYW4gMTYgdGhlcmUuDQo+PiBJIGRpZG4ndCBz
ZWUgYW55IHJlc3RyaWN0aW9uIHRvbywgYnV0IGZyb20gdGhlIGR1bXAgcmVzdWx0cywgdGhlcmUg
YXJlIG9ubHkgMTYgZW50cmllcywgc2VlIHByZXZpb3VzIGVtYWlsLiANCj4gDQo+IEhlbmNlIHdo
eSBJIHRyaWVkIHRvIHBvaW50IG91dCB0aGF0IGdvaW5nIGZyb20gb2JzZXJ2YXRpb25zIG9uIGEN
Cj4gcGFydGljdWxhciBzeXN0ZW0gaXNuJ3QgZW5vdWdoLg0KQW55d2F5LCBJIGFncmVlIHdpdGgg
eW91IHRoYXQgSSBuZWVkIHRvIGdldCBtYXBwaW5nIGZyb20gbXBfaXJxcy4NCkkgdHJpZWQgdG8g
Z2V0IG1vcmUgZGVidWcgaW5mb3JtYXRpb24gZnJvbSBteSBlbnZpcm9ubWVudC4gQW5kIEkgYXR0
YWNoIHRoZW0gaGVyZSwgbWF5YmUgeW91IGNhbiBmaW5kIHNvbWUgcHJvYmxlbXMuDQphY3BpX3Bh
cnNlX21hZHRfaW9hcGljX2VudHJpZXMNCglhY3BpX3RhYmxlX3BhcnNlX21hZHQoQUNQSV9NQURU
X1RZUEVfSU5URVJSVVBUX09WRVJSSURFLCBhY3BpX3BhcnNlX2ludF9zcmNfb3ZyLCBNQVhfSVJR
X1NPVVJDRVMpOw0KCQlhY3BpX3BhcnNlX2ludF9zcmNfb3ZyDQoJCQltcF9vdmVycmlkZV9sZWdh
Y3lfaXJxDQoJCQkJb25seSBwcm9jZXNzIHR3byBlbnRyaWVzLCBpcnEgMCBnc2kgMiBhbmQgaXJx
IDkgZ3NpIDkNClRoZXJlIGFyZSBvbmx5IHR3byBlbnRyaWVzIHdob3NlIHR5cGUgaXMgQUNQSV9N
QURUX1RZUEVfSU5URVJSVVBUX09WRVJSSURFIGluIE1BRFQgdGFibGUuIElzIGl0IG5vcm1hbD8N
CkFuZA0KYWNwaV9wYXJzZV9tYWR0X2lvYXBpY19lbnRyaWVzDQoJbXBfY29uZmlnX2FjcGlfbGVn
YWN5X2lycXMNCgkJcHJvY2VzcyB0aGUgb3RoZXIgR1NJcyg8IDE2KSwgc28gdGhhdCB0aGUgdG90
YWwgbnVtYmVyIG9mIG1wX2lycXMgaXMgMTYuDQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVn
YXJkcywNCkppcWlhbiBDaGVuLg0K

