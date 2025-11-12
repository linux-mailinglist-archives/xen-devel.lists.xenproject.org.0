Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F2C518C3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159656.1487971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7jZ-0007YG-93; Wed, 12 Nov 2025 10:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159656.1487971; Wed, 12 Nov 2025 10:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7jZ-0007XB-5X; Wed, 12 Nov 2025 10:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1159656;
 Wed, 12 Nov 2025 10:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJ7jX-0007X5-Lf
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:05:47 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27b4db64-bfaf-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 11:05:45 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6142.eurprd03.prod.outlook.com (2603:10a6:800:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 10:05:42 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 10:05:41 +0000
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
X-Inumbo-ID: 27b4db64-bfaf-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFFHE6Eht3YNJldF6d/WAFEpcagGrWMI5nn8kPEvR9FF+GeR6B8cTQ3aCmq3UgCH6og3osHzZA2ZN9OU7or9RGHNY2V0u9RPs6Zl3eH3k0QL9qNwCmIT9FQe9FJrbJPKA7dngob7AqYgWXMPMEAs/jdr1z82nPrZ7a2fQWAMeHs3q583OwsFkgjm5rCtqX8gwXBwaei/Mudoc7zUq8x5XIW2w+e9D0bwSU6Beks92RmvOzIUAHOxYDisoUEW/+IfH1RncOtJ0dxsGECLefl3C5nW8bpKhdpbFJlPWgtiVMhv3Z3EGhPeQ4Yw3wGpwu8mVXPA/X5N2d2vMs/Fl3XpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igzEDLR9CwnFw7DmypRVbWYrYEcaUJeATM/YMlhE3ow=;
 b=hoEXBSr9kT/w8b1h/HWt13Fbythg2OfecpJbgTeGwUZabJJTL9JAsyBf78Fx94OgoXkvkwZs/xjZfLS6q6nNlmNPg2e97ZUqH7AuFgQfTDN4KRpB9MMArHKy14UqRXMosNemC8KpRrQERcr7LpZTLYzZ5WgyeKzy/k5ZrqXbom+a21YGGANMQeyxPISYDsLa1ukUqnOkfCo5VuFvv2KDn2wuShEMpS5e+udFFjqC3B+MWWuBAzn0INfEITl4AH/yCXuaZqY8sU2EGi6bZ4vykgsLG1BFyKIUQCHp0KtREQ7S4RLQGHmzuvVpq7rHTc5D13uaIQFkrDpSDAxItKLNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igzEDLR9CwnFw7DmypRVbWYrYEcaUJeATM/YMlhE3ow=;
 b=gw6sOgO30nw/2eiaXTCFpDJeMyRXjau53lwGEfp7hpaoCtDgVttmtAD8iw7ACfO5kkNDW9P91duRjvJiHd/dqhf2RuwVBjWnILDAti7nDTbPAV1v+bn5FTkuMJFM5J5Zf4OYcFJgh97SAEMtxmb7vBRCvZ+NtQvnULRsn7Fp98p4GgpeE/wc4wbVe+mg/ejsP+JpIwR0jTdLi4k0NqLU0va9oQXeOXD3D8wlxYHacPOI4eq3rnOaL6woEgiT8fzdYBkY13eIgef2fXwJFgepYuPeeqrdTFti/WWzCd2VuDhzQuY2xEPKPuKl+qtkWL6bcPYkTLGQF6QUOKRJ965hiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <50c7e5ee-50d1-450a-a5e9-9d059228224e@epam.com>
Date: Wed, 12 Nov 2025 12:05:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/5] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <cea9d2cc-ba33-4483-92e9-4aa31c24960b@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <cea9d2cc-ba33-4483-92e9-4aa31c24960b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI1PR03MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: e6817f33-ba0e-4198-cd15-08de21d30948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djNEd0RnZmdac0sxVzlabkN2OGoxWEovR3VJMm5nRVpHZHZDNVlPc3NzTHho?=
 =?utf-8?B?d1N4MC9qWmxJUWlXSm5iZHo5N2lTMXRqdGZqQWtZSU9MNUZrZG5oUi9TT1NM?=
 =?utf-8?B?M3lKa3lrTGxGQUF4dk00NVRUSVVRNTVUd0didXc1RnZaUi80Q083ZElQa1ZY?=
 =?utf-8?B?bCttVzZxU0NsbWRkUFVpeDlRUmNPc3h1WDFpS3l0WGNwMmtRVVhMYklxcWJ2?=
 =?utf-8?B?UDJKSW9RVmFyN1JwYXA1aTFMU2xtNjJiWWs5VjdLNzVrRjZ1Q2NlckoxVEhr?=
 =?utf-8?B?VmorUWxONlZydUFpOE8rVFRiNklTNDZuZ1hjWTJTSUJDc0QrZVczMDNxM3Ez?=
 =?utf-8?B?Q2ZEckp1bC9KSWtqbFM5K3RjYi9xNm1GNU9sTnBLZ2Y0K0pqdXRJaEIxVk56?=
 =?utf-8?B?ck9tdC9haEtLWjFXVHRwY0lUcUtDRDNLSjJSUlh2bGUzR0g1VlpBanRWdDZV?=
 =?utf-8?B?TlR3UVdLQTNHdmx6S0NOZWdubDdKVjdVYlpLTXBBQ2l5NU81Yk44eGwyRlZT?=
 =?utf-8?B?L0pkVURjRHhRQ2R5ajdZc3YwZ0VCOVNKQmo1RWNaemlqUGlZTEpGOGVBSFJF?=
 =?utf-8?B?ZTczbEc3cVEzeGVmT2lZcjVBVUNGUkxESmloQjBPQnNBQ2ZBdXhGYU8yaUJH?=
 =?utf-8?B?WHZSQVdSMlRNdWNhL1gxQzk5Ylczakw3ak1WcVdWd3Y3NW5jUUp0TE9uWWp2?=
 =?utf-8?B?eTc5M0J1Ync2TVh5dHdNYkxadVh5aHdjZGZscXhWWm1GWGd2N0E1bHFKOWV0?=
 =?utf-8?B?OXpRRVErL0c4eCtwc1ZPVXVIY1BPUWQzb2kzUFZmSC9OaEdqS1ZhSGJqN3lk?=
 =?utf-8?B?WjZRN29hcUtuNG80NW5vV3pBcXFETVI5VnZBSVNrYldTYTRBYlp5VGQ5UHJa?=
 =?utf-8?B?ZkQrOGVWWWZUOVRMU3ZuejRIdXJaM0swZmQwbXhtSlg0ak4vMVpmQ0svMUh0?=
 =?utf-8?B?V2RoeEVHdEVabEp2U2VqdW5yYnl0NXlHa1V4TWlQS1ArR2N6NzduZlp4ekd6?=
 =?utf-8?B?NVhaSUR1K2U5TVBoMXd6ZktCR3ZrNVo1UDZ3TmRsbUI3QUtCMTA4S2FuSzYy?=
 =?utf-8?B?dHI5S2FQZDlRZW9SK2JMSjBsby9PNEl4bVNrM3lXbWxFSVl3SjZxZklJMHhE?=
 =?utf-8?B?L0FFV1dvbXdpcmZ4NWZZS2R6dWExb3o0dWNic25UampLWW5WaWM0UkJCMW5w?=
 =?utf-8?B?ckplS0ZId1hmYWtSTEJzbCtUdU9kY0RmK3R2ZlI3cGRIWXZ3NTVVZmJoNFln?=
 =?utf-8?B?a0pQcjgyRVhoRnNkNWVIZXVFZnZ0bGpPOG42R1JvUmdtT0ZkQXBRQ2ovQWY4?=
 =?utf-8?B?dUZ0MzNPNm5jUFlleEVZRTNSM0dUTDduZEUxaFBuNm5VdjdpRmQ5L216SmxH?=
 =?utf-8?B?SW9MNmx4L1U5cE9maW1DdDBZa0s1SHlQY0ZCdTQzSVZNU0hhYVFKZEpIanpt?=
 =?utf-8?B?SVg2d2F2bUZwS24wMy9VYzF4cVRxQW5KSzI4RTZaZ2w2NEZPZmRNcGNUU0t2?=
 =?utf-8?B?Tk0ybStmamZaWGRIYk9jQUJQMlhRRndlZGZqYzlnV1JhWTNXdkVIVEZzRTBQ?=
 =?utf-8?B?U1crMjhIb2YwNWJSOFFSWmtNU1QzVGpDL1N1WVR1YlFCRkdCejI5enJxTE9T?=
 =?utf-8?B?NHQ1cHB6Uzg2VTBod09NbWYvcWR3ZG9UYXNNMVpYR0ZjcnFSTzZzV3ltZVBa?=
 =?utf-8?B?b2l2KzhpSHdGN0doc2lobW5MRWVUYUFqeks4Q3pEeWVudTlvL3dqam1RNitY?=
 =?utf-8?B?cmIzRTdVM2RsZHBCWVk4VlZUd25KVXN3WjVxcitZa0cyaWZwdWZpKzlhQU8z?=
 =?utf-8?B?WVVaU0M1ZC9IQUtvMXpWSkc0d05xZUxiSkJZRzRoeEc0SlF6Ly9XVzMrTk1Z?=
 =?utf-8?B?cWpDRnYwbHgvS0QwdmxuQTdLbm1KWUNRSjcyQkxuNWVLQm1Cd1NFRWR0QTlw?=
 =?utf-8?Q?IcNB1txvrcjakEuUWFWZixnUT2GXr2fv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVhEQkVuc1RVQzFCdjNsNDc3RUw3SjcwOHVhWlpVREN3Qm1nd1pPa1VSVXdJ?=
 =?utf-8?B?dkRvQXpRbjlMaUtCWlhmWVdFSWZVSkxZNW5ydDRGMkVGdEREOVZtaEZIODdl?=
 =?utf-8?B?THVNRG9SaVFCZytTejRhUWE1TVRhcVY5VjBHVitWQkdKWDlDcWJaMEZVSGVp?=
 =?utf-8?B?VDhxVU9tT2VCYTFaeWlMK3hZNzRmVTl0bUVyM203QUM2RTB2eUZhZzB5LytU?=
 =?utf-8?B?Uk9qVXBZVUlBT0dzZHhzVm8wMGtLSG1WejhybmNBbVVvemt5R2QxV2VVZitE?=
 =?utf-8?B?bzR4OGtTL3lBb2tRT0ZKcHRBejRvdVcvcUNvM2tJZ0NSMjdtdlk1Z1oySUc1?=
 =?utf-8?B?elRlYjlRQ3JFZm1hODYzMXpPNFkwaTJYeXAyVjRHRFM4cmtybXMrVUtDUGlU?=
 =?utf-8?B?aGVVa1JndnQ0ajlKanBmM01PMEk0SlRvMXlYZzlrSXBROTgydzdXRWlWZnk0?=
 =?utf-8?B?VDNzWWpROGlYRnRsOEh3d2dYV2phNVBPZG5TMTRQLzVVc0JnV2FRempEK3Vx?=
 =?utf-8?B?WUJBWXlMdGxGc0tVa0pDeTJJSWt5ZmNxQ2E3SmJJRGRiY2RkZ3dzY1h5ajVP?=
 =?utf-8?B?SmoyZ2o4RFVsNDJZWk9CQzVsZHZmeE1HVVc4d2JPTmduV3Y5TkhsR3c0NXpN?=
 =?utf-8?B?bHpadjJGQ1RuUkNSdVdCZWNFZ2JBekJVVWhJUTB0eDNiL25xQkxQVGluRDV4?=
 =?utf-8?B?dk9LM3FQS1BZaEo1d0pJRUNVWkZIZUhRMklFU2tiQk9NUFlzemM1RUZPTWFw?=
 =?utf-8?B?MEtkam1Fc3djbExTV20vMGVRTlkxSUNlRVB4UkM3ckFicVlMMzVZWlI3Vllj?=
 =?utf-8?B?bHlxd3dmZHhkREpqcWxISEJmL3VYaXNFTWpSOFVma0pQcHpTZHpGNWlwTlYw?=
 =?utf-8?B?b1ZVdU5ESisrN3g4bnk1M2RhckVpNlplRHZhalVvLy9wby9IRWJtZlJKNytn?=
 =?utf-8?B?Q2dYWmlGWXlXSWIrNmtSOHJ0Qm9FYnk5TEw1bHBxQkgzZ2FDYzdiNVR4QU05?=
 =?utf-8?B?U2hYVVBpYXdROEViR1QybjRGUVpKRDhqOXhTaGVpbGJTRHpoNTFIT0NqRkNZ?=
 =?utf-8?B?T2dwNlRmSjgzcGdOVzFKMTlmTk43MFJoMnBreGRMa1FKaEExN3J2bk5CWGFn?=
 =?utf-8?B?YjJCYjdvRndqSmVIdVNla0ZBd0xkd3hqSkdYS1NEYlpTQVRrMnN6WVNrcENp?=
 =?utf-8?B?MCtuVkRxVXJvR2tKd2RRK25nM1ZEZ2hQNVFnZzZ4V2ZFK083aDdkVEtRcFA5?=
 =?utf-8?B?UmxHY2ZtUGU1T1kzeFJObzgwWVEyR0VyZkVFQ1QvcVNIYjRVNnVDdkFMOWYy?=
 =?utf-8?B?YmFKaHVJSGFjOHpUa0haQWtvcFFWbmhpRXdPNzY2TGg3cHk2VGRRMSs2SnMz?=
 =?utf-8?B?NDZ5dUdNUTF1Sm9BWXhJVCtMb21hQkpWUzRyWG95eG12YVhWZW1HUFhUUGd1?=
 =?utf-8?B?Z2Zva2lNZGtTdm5HQ01sdVdJM0pjREsrK0ZtMmFtZ0JsV3BBZ0tsMUJOUVhh?=
 =?utf-8?B?bkZwRldIbisrYUJUUDBtNmlKblhlaU1aNmdkQlV4SExyaEt2OFNHTGg1c2sw?=
 =?utf-8?B?MzkzNjAyRWlqdmpNL3VoTEJ2OXJ4S2NmMUlBUy9vNDJOWVRtMHhhMXpLM2Rm?=
 =?utf-8?B?c0p6eGlmOW5XOU5CcU9CNWdrUk5aeTR2N3U3bWkrU25Tc1VTWUoxNWJQZzM4?=
 =?utf-8?B?NTgwV1JJVVZjLys5RlBVUk16cWNDazlsTmpFWlNTcnRoZXpNcGpzVzJsYnhG?=
 =?utf-8?B?RFQrUmwrdEZkcXZBMnNDL2lWSWhpZmY0RDZBUy9DSWdDUVRYWDNJcW5aUFM0?=
 =?utf-8?B?bStydS9IcnFtb2ZpUUpoOTVNV3V4aTdMdkorSDBtU1Bad0dCVTBNZ1hEeHBt?=
 =?utf-8?B?NFZnNlozRlgzbDRPRFRSZVdqajVmQXg2Zk52ZVUvMWtJR0V0aFovNFN2L0lV?=
 =?utf-8?B?S1B1eTNGd2hPZGJBVWhsRy9Cb2d1cWpDSFEvR2lXS2hUdFRxSC8rYncvRUFS?=
 =?utf-8?B?aGNiK1NCQjdXMnh1RWkxcUZNKzlYK2RhTlViSHc2SlFqUkl4RGRVRE5PR01z?=
 =?utf-8?B?dHd4Vm1zcCtnYUJtS0tzaDUvNXluYldYVkJheXVVcGVHazVPYmtLZlE2UXlk?=
 =?utf-8?B?WnF5RXVFK0hzcDlaZGpEMEhLR1dGeEZzbktLaHZFL2RUQ094UWdRdnlnY0JR?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6817f33-ba0e-4198-cd15-08de21d30948
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 10:05:41.1894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHKlggNLkEYCMlG069Dup31q695VE90xhZdfqkoYzwPXstkScNxBIu70CGHVe13lc1E2B+VA+c6cHRA7bR+Iku1nyhsx2UgxDGy0q6uNb4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6142



On 12.11.25 08:50, Jan Beulich wrote:
> On 11.11.2025 18:54, Grygorii Strashko wrote:
>> This series introduces possibility to disable 32-bit (COMPAT) interface support
>> in the following cases:
> 
> The use of plural here ...

should be "case"

> 
>>        - Only PVH domains are used
>>        - Guests (OS) are started by using direct Direct Kernel Boot
>>        - Guests (OS) are 64-bit and Guest early boot code, which is running not
>>          in 64-bit mode, does not access Xen interfaces
>>          (hypercalls, shared_info, ..)
> 
> ... makes this an OR list, which I don't think would be correct.

It is AND for all items.
I think I worded it better in Patch 4

  PVH domains,
> for example, can well be 32-bit ones, can't they? Otoh the latter two points
> look as if they really enumerate alternatives. Can you clarify please what is
> meant?
> 
> Jan
> 
>> If above criterias are met the COMPAT HVM interface become unreachable and can be disabled.
>> Coverage reports analyze and adding guard (debug) exceptions in hvm_hypercall/hvm_do_multicall_call
>> and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused for safety use-case.
>>
>> Grygorii Strashko (5):
>>    x86: hvm: dm: factor out compat code under ifdefs
>>    x86: hvm: compat: introduce vcpu_is_hcall_compat() helper
>>    x86: hvm: factor out compat code under ifdefs
>>    x86: pvh: allow to disable 32-bit interface support
>>    x86: constify has_32bit_shinfo() if !CONFIG_COMPAT
>>
>>   xen/arch/x86/hvm/Kconfig          | 19 +++++++++++++++-
>>   xen/arch/x86/hvm/dm.c             |  2 ++
>>   xen/arch/x86/hvm/hvm.c            | 22 +++++++++++++-----
>>   xen/arch/x86/hvm/hypercall.c      | 37 +++++++++++++++++++++++--------
>>   xen/arch/x86/hypercall.c          |  6 +----
>>   xen/arch/x86/include/asm/domain.h |  3 ++-
>>   xen/common/kernel.c               |  2 +-
>>   xen/include/xen/sched.h           |  9 ++++++++
>>   8 files changed, 78 insertions(+), 22 deletions(-)
>>
> 

-- 
Best regards,
-grygorii


