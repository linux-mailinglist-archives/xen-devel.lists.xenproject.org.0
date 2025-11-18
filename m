Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62375C6A3BC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164957.1491807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNLX-0005Ww-Lj; Tue, 18 Nov 2025 15:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164957.1491807; Tue, 18 Nov 2025 15:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNLX-0005VV-Iy; Tue, 18 Nov 2025 15:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1164957;
 Tue, 18 Nov 2025 15:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLNLW-0005U1-6e
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:10:18 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b007d0b7-c490-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:10:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8326.namprd03.prod.outlook.com (2603:10b6:806:462::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 15:10:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 15:10:13 +0000
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
X-Inumbo-ID: b007d0b7-c490-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJw989k3F+mjXPXBOG8rX4nUZByA0wk1jJcVj3no/dImmcmGFSsJBDw1WSXLMHES3Wfljm8Hzb7SrCTMMzahaRyDfCslpGEFb25VzliAWX9yJW8TFoEPf17RoQjlyeYt85p5E+6sAvollHXJJlndJJbq25U6iLUoWxnawQhwnUm8N5JMuwiJjxp7T0jYS3/1kHnJScljYMa5i7LheFJRsb9FVMCEkRPlYkrjyUiCEmRiV990ac2tR6NZgB4fIZ69YPgyjS0/PIUaz7DYX7EJQ0mW0RTjHalZ8XVezSGZO5t3Okl/gTGpVKCG90jVe5yTXB2ITf5/ZTTmdWau4lT3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4l0IRPrYYqsGygs10mjYPUXrqxgEiec9INfeMrMwkk=;
 b=pDzuobkD0EgKoKOJtyE8dNsJyEfw2eurGtPdPmHInZVj6RKqBsLrgzAC24HTYuedUASDJoFtQJxt+VTBe7bzHcxC748H+NEP9dwP9mRZpg8IDRnpwkf12EuEuMoogjaCgmzx+UCZHPVOzNT84zJd4dqyN70+GqXIM9x66a3t+7X4ril/EEbpfg6DDfnPQ3O+VdfxHixUbRWtQzMzqfLLvjC+W4vj/hfUeC39f3eJJQs4RPq0ZT/ED/jbsV7fVyMuEOGZ5B2ncQPC5gFW34uHrCoaNNaqW+KtEeC6vz6bbebHaHz9JVZ57xhKsmsNScNu65+xHxc2Ku6ShkWQAwMfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4l0IRPrYYqsGygs10mjYPUXrqxgEiec9INfeMrMwkk=;
 b=LCl+oI2Rj3KniMekIZib3G1T63oHYLWFwmqLYuYDsM9lNnVuiXiBQQZHxgc21nMbwnkpwoMOcWGx7XCb1W+Q+N5grttCIEl5uxhtI07GAz0yFoOeW5TnxQD7hIGIaknDF9P7meULz1VCpEctFPNFl3z3xuWQoUdrXxbZUjKyByM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91e5b38b-b76c-48a2-9627-0729007f2a16@citrix.com>
Date: Tue, 18 Nov 2025 15:10:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] x86/cpu-policy: move invocation of recalculate_misc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <ea7237e2-9026-4c79-8cd6-7b62094aab1c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ea7237e2-9026-4c79-8cd6-7b62094aab1c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b550221-f3fb-4286-cc38-08de26b492f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFVKQUdNK0RCMkd3dm0vWC9JYXBObkpzSVFaZ1Zoak5LUDVQZFUwSUoxWUp5?=
 =?utf-8?B?T1UyMXo5OUlzN040Y0dNNXdDeDkzV0VvVzV1TjJSNUNMeDA4UEpiV0lEVDBs?=
 =?utf-8?B?VkZodXRDbjhwc3BLRWpBTU41N0VYWkk5NC8yd3NTRDdzWmxuV05LQmp6NUIx?=
 =?utf-8?B?VnNqM2cxWXB3ZmtYQkVja0ZKbzk1YWJyc0RNQ0JVMVhJSmhDa0NydVpiZTVM?=
 =?utf-8?B?ZTVxckRUTEQ5bkF0MWdCWTNZY2g5aXpHR3BVQ2Q3Yk9NZk5HSnRCNy9Pbkdp?=
 =?utf-8?B?ZEp5cDhzSlhNcEFlZ2hRTndYcDBLS0VIVVNxMnY2cGZPR3pPRk5uWWdFbWFp?=
 =?utf-8?B?ZEtMYitwOXZxRDNwMUFYQWt1cVBXa0NVTnVNeTZjUXdIMlFtSXdkSG10QmZq?=
 =?utf-8?B?endyMVNnc3A2YVpVVUZyVE02ZVFZRWpUNHRySEN0TXZadEl4ZkM3eGNjdU9H?=
 =?utf-8?B?MVRkS2RoSkg0UFp1MmRSaVFpSWErTzJNUnI0R3M4blZtdmpheStlVktVT3VH?=
 =?utf-8?B?UnBzbHpSeHNIekZxNWtIazFqY0VKM0swZlcvRHNwaDRsMCtSaFZQVUxnTGg2?=
 =?utf-8?B?Z0czUU0zeWZPN2ozUUNOMElJWGFaQjFHNTh6K2ZTQmRoSFpRNW8rTUNGTnJl?=
 =?utf-8?B?azdBM1VVTm5qcG55TFVraVE3dHNvUldsK09YWERKYTg4ZVZIaTE2aGFMdkI3?=
 =?utf-8?B?RlI3dnJpVVFud1c2emgwOGorRXVYdTBSN1RaaFR5ZEZhem1kQlEvOHk5ZG53?=
 =?utf-8?B?ZUlyODIrSlNEWStkaTNORzVSTG56elkvOVJRbm1HM2U1WFBNODNLaGRTV0dn?=
 =?utf-8?B?c2ZISTVaajBISU1pZW5VQW1LT3lZNG1NVDU5MXNOcHZOREVIZG4rQXBIWXpX?=
 =?utf-8?B?RVNmcXBpMmxDTnpZOEdDYytZR1RpbDY1anFUOVZLSkg3NEVBdHhVQzFLbzBs?=
 =?utf-8?B?STRwT3lVcHkxMC9uVWpzNVk1c1cyZTRpaGNXWXR5U3hGS2xMUmZoNFFJYzRC?=
 =?utf-8?B?ZWxpeWozN1BmUWhRY0FTR3pwSVpwektFTDZSd1pTWmdzcU85Unl0Z2JnenJv?=
 =?utf-8?B?VWZXUlBnNEh6K3JtTm1TU0xyakVSQlYvMm9qSWNMUVB4YWIwZDhYT2h4THV6?=
 =?utf-8?B?ZGc4eUY5NVViN1N4MUd6MjdxcFlmQlNBNnpEOVlNRFFWdTM3UUxTRXJjWkFU?=
 =?utf-8?B?UU5hRW8wdkRsMzZOcCswMnZLdFdOT0s1ZjllcE9CQ1dXcUtZbzZwUjdUd0F2?=
 =?utf-8?B?aTkxektHa0ZsS1ZxRGdoUEZQVWpieWFZd05LejRvRzNIYU5nY0ZMc1A3QVNT?=
 =?utf-8?B?Uk9yWWZWQTZGSDhFazQ0RGZmRG13K21NRzVSNkd2dWtMakxBeWxRZXFhdjc2?=
 =?utf-8?B?d09zVmlxUDBzZ0kraFJhRmdnZENRN3NBckZQNjhrV2E4K09IZ3NTSkVPRnVS?=
 =?utf-8?B?TWwxZUxqbHk0SG1WYk5rUXJwaUhteGVNbWcvclJ1N3Z1eUcvZ1p6QjB2M0o0?=
 =?utf-8?B?ajk1b3FDdXVHb1k2WlBoVGt1OWNaVkVNcmtpWmMvRmw5Q0RqazZ1Y2tzSWFP?=
 =?utf-8?B?YkNpVmFPZlZvZWt1U29wZDhQTDFGUGJRd2l3TUU1UDVMc2l4VmRBZUlxSGI0?=
 =?utf-8?B?UUV0TG1oS1hTQzVFTTZMRGJwdFp0QUd0OHpmTWwxZFFkTkR4Q0tTUG5qZllo?=
 =?utf-8?B?Njk0cm53bHVJdWVUbFdadWd5UU5XUGU3WGYzREpqSXRqelRSSWZjUm5TZ1BV?=
 =?utf-8?B?MHg2VmttZzdHcld1d2dtSzltZlZaUHI0cFdlQmI3VE9nWFlSWi9xRmpBRkhk?=
 =?utf-8?B?a1pZRDdIMkZiY0lVR0dNRFBHM0M4SXA2MVNSTkZ1YkhUNTZYcXlMM3JoOTda?=
 =?utf-8?B?QStVZFhLV1BVamNQNUtpKzBZck9OZ3BKbWJVRFdsSUs4d2dlaElRcHh4RmZN?=
 =?utf-8?Q?PX7njSj/lv4mVBEsFBGTwa8UdzBv60Tw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHMrS242QVpjeDAzS0RueC9Bd241UmpkMlZ1aEV0eVprcUtwMDJXRzE2NDJu?=
 =?utf-8?B?bDJ5RkY3aHBYKzFoRDVja2hnQ040Z255QkxZUDczNDFwVCtES1pzMmhoRHNC?=
 =?utf-8?B?dmxCU21PMEVoSjFvVVpOczN1Lzg3S2ZndkEwRzgwc3BsNW5zMFNIRndFQ2pE?=
 =?utf-8?B?dkFMMXRHRUhISUxoL1BJVXc3WEZrc2xQdCtLSkVlN3lCcEZqazhGYm9BY3ZT?=
 =?utf-8?B?MyttV1QvSWtoNzcweXhkellhRWdIU1BXTjV0cDM4NGZ0dEppdHkyamFINE8r?=
 =?utf-8?B?YWlucEZ2WENGRXlpVGk1LzNJNlBBNUduTyt3TXp1aTBJMm1uUHF5ZjI1dE5k?=
 =?utf-8?B?T2F3R2p6ZWlRZkN5alpRS25QV3pzVHREWGQva3ZYbktScnhueVNYUktsdXdO?=
 =?utf-8?B?aUkvWE5Gb0NiNDNGYmhjUTlPQmU1UzdUb0Y5SnYyNWRjV0FzMHdxZnE0akVm?=
 =?utf-8?B?WGg3SjF0ME1FZWZMM201M1ZJNk1ZN0tTeGQ1R3h1MWYwSkJ2WUlMRVpISDR6?=
 =?utf-8?B?RUlGcE1VQU1OYXpwbjNyWGhobDlaUGV6RzlGbjY2ay8yZ0N3SW9adzkyTnBQ?=
 =?utf-8?B?SFVCVm5ueHN2Qy94MElQVml3TU4yVDRnVkVUdGdvN054THNFQnlqMS9VNm1D?=
 =?utf-8?B?R25PZlRRTnhrUmNYU0tGSDN6QWRkQm5ua3dTT3AvMFBOQmwrRGloaEp3bFQr?=
 =?utf-8?B?eVU0NHdmbXlJNnFEb1Y3TGFNZFZ5ai9aN2tsTmQ4dzZBREJaaU5ITk51Zm92?=
 =?utf-8?B?TVVHRDhRdXBlWkk5Y2puWDJNcjl6ckNSVk5xK0ExVDVtVFZ5L3pDNzZic3pY?=
 =?utf-8?B?TWt6YlNJamViMURNRkEzT0IvMXpqaVdkWVNYakdaaEFTK2RUTXBpcGdLYTVD?=
 =?utf-8?B?bnA4Y0FtWlB3Ynl6MStXaHY1LzZLSkU4eW1oMWUvZFlvZWNPVzZVRmdNejRJ?=
 =?utf-8?B?RTZ5c0MvTTI2NVVFTHlzSE4rems0REMzTHF5RUtCcUF6aEFHUU05NnFydUFQ?=
 =?utf-8?B?Y1hkbUE3MTRQTngzZnR0OGllaFhSWGRSelBJZ0tDcXFEQmM1K0t0QVVVUHJH?=
 =?utf-8?B?MS9FWFZ0dEp5ZHJFSm9qVkJsV0M1K1hYZXVXTkFYcXN0NUd0dUNmc2FKMWRs?=
 =?utf-8?B?S1NHVDJGTDkzOHJoRk1hYjBMWjczUldSNHRTditNMVpMVlNna05aR3pnUUZy?=
 =?utf-8?B?dmMyYnNMRERwZUhwVGk3T0V0eURzYXZ2bnVzOUl1ek9jTUhaZ1R0RWFQdGFC?=
 =?utf-8?B?OTdUTGh6L3JCLysxTDJidnBIaVlseDhuSVUvMnBnalJzMWRDR1pHV3ZIQ05y?=
 =?utf-8?B?Vzg1NUFncUZXRUlpaE1uRmZ1OWl5aGE3a2U2WmRxNE5JbTRuMUk4amljVnhE?=
 =?utf-8?B?TndOTXRqcE8xdjMzZ05IV3VTeWdCMGxJelJSTkxnTzhOdHV5N1BQaUpFRVZ6?=
 =?utf-8?B?dkl1a3RTTnQrLzVjSjVuSEFkZXdYd3hvQjVGREh2UlVFRDNMcTArdEM2cENO?=
 =?utf-8?B?enhlNGRNSWhrVmtPSEszK2pPV2RsbEd5ZmRNZ21JMlRpQnQ1NFVSVGFtOCtC?=
 =?utf-8?B?U29nVE0xdXp6YWhiQkdtS2wybE95Z1YyQkEzV0lWbDlCSm1hOWU0d0RLeDRa?=
 =?utf-8?B?Ly9pelN4WHRwVDIyV3dweGx3NitKWVJBVVFHek1FK3V2MU0wajhUcE1pdWpm?=
 =?utf-8?B?WEgrUm9BcWtHWWQrRi90cHc3d0FxSzk5R0V5SVk2OTRKQ0d3eXdwK0xFeHR5?=
 =?utf-8?B?cUhrTzdsT09oYkVKWHVKOEVFWVRZWE9qOEY5V055d3A3SHNLZHBWTHhWZ1V4?=
 =?utf-8?B?MWYwZmdXRTd6d3dDZjI1TzVObnhNZTNka2lMZFIrTnJSelFQWmtnRnN3Zk5L?=
 =?utf-8?B?U0ZzNDdJU1l1ZTRyU3JsRW1XbkxNNWhCN2JmbVVqdnltZGppZzRJQ2tPdTJ4?=
 =?utf-8?B?cThqd3R3VEM1aWpiY05DY1J2cUV3anlsT1pQSVZjdWU1eTJtcUI3ODNIM1Rs?=
 =?utf-8?B?SlRqRUVLVm51bVNDMElGUDR1MlRnMXUxUnZ6VjBZQlFDTEJKYURqQ1pPbzBM?=
 =?utf-8?B?Yk5nMWhZalBMRHBBZWZjaTRabTk3YVFFY2QvY3cvcW9nNlJkY0xOWmFQVFpa?=
 =?utf-8?B?VlZualVFeUxuN255V3VwSDgrNXUzcFYwaVhsaHhzM3hmdTYxR3Z0cytvcTJE?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b550221-f3fb-4286-cc38-08de26b492f8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:10:13.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcIL+3/CySVy4eAWs/eXNoTpT2OkI1gBFo/LtrwANJ9aopkdMzqZRZTo7hfTweSyOwmFpqu0z3GaC1cfC2nZtgGy221dhFZXdWocfP2Uokk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8326

On 18/11/2025 3:05 pm, Jan Beulich wrote:
> The function is about guest exposure of features / leaves. There's no need
> for it to be applied on the host policy. In fact doing so gets in the way
> of using the host policy in certain places.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've been meaning to do this for a while.  It has interfered with some
debugging I've done in the past.

