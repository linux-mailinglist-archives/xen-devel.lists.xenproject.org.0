Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKTHCgbViWmBCAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5810ECDA
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225285.1531760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpPuo-0003TJ-1x; Mon, 09 Feb 2026 11:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225285.1531760; Mon, 09 Feb 2026 11:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpPun-0003RP-VU; Mon, 09 Feb 2026 11:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1225285;
 Mon, 09 Feb 2026 11:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dId=AN=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpPum-0003RJ-Im
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 11:58:52 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2974d2f-05ae-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 12:58:51 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7720.namprd03.prod.outlook.com (2603:10b6:208:4f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 11:58:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 11:58:46 +0000
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
X-Inumbo-ID: b2974d2f-05ae-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVYs5eoRAAWVxiCDoSc77mL4lbPBcDEcLdW9npQDKTcGl94vFFZAToDKWFwij8l+2KQ1AMvVD/Iwfxh22s4RAGGVx0aFrjSddlNnq6AGRechPhACgkAjodLKk/Q9z3UAeVTvJ354FoS18lvD3fJKiTnj+kujJtfQDoJ4xN0UMfCg+Nk/oGyV3lu/2jd4tEEUtEPoD69STtqpnjL1PwC+zoIMoEs5LsZNIc+ljqWtSTGNXvBIz9SOtyWlTwSk74Jx8jq0caHok+d0eOnR2MIgfLlO/eN1PyuKsFPPsnzop6xBtnjjZFqXsPU0+ZJSasiz8eJyHRPQSWvXtapzu5yaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0DGAXHGXIXNsUsKpRHhHiF6pi8tCfQWKCvvhDIEBNo=;
 b=ouJ3rv029do76cBDqFJMSm5xUai8dIZVAdBfeomvEIXu3QZQOsfreMzFXQynMpy0q7VSnTtJFnCZAqacxuLjoLGPJ0EXhQtKIeqHU/vUiJUsFk1Ym3OeLmTTzEIdRYQokF0SbsLVYI6TK2BnLn5G8wZ4jMtgi448o/SChrrcDGO5s3y01QmKXp5d24pt9O5pGq4SlD+xzq398er4zpBMndbG4W5kbe5yOBZH3HF+c/L/F32RbLxxOHbCvU4wRo3o9OmXMcCIfLBApfWSXQhvgaQH7EhtRS9AvEG4vrRX2D0siVhr+lakhx5e17dhzqYyWo5lTEZi5XT4FCNOCmQYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0DGAXHGXIXNsUsKpRHhHiF6pi8tCfQWKCvvhDIEBNo=;
 b=Y+9InMNW5sOlqQWgUoMI/oduhl/Xhk/aSCT92fVQkTA+d7tBuxHGLsE5tq8Odjr+n3bfj5OfeJm3si+NHXB3Rc+75/DZaPbbRfxxRkA0XYUsW9rt4FiCeONCkog0k2ojWAy3pbFWjBM5xha80y6wRF5TmcVYRGlyGbDSrI3fW1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1686f9db-dab3-4c8f-940e-1d93c9523dd2@citrix.com>
Date: Mon, 9 Feb 2026 11:58:43 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/hvm: Add x2APIC topology
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260209113721.2604894-1-julian.vetter@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260209113721.2604894-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0339.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: a76cc3c0-e1ad-449b-fff7-08de67d294a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkFPd0hYdzY1MUhVQnh4MDRGTG1xem8wNFhobnhLZjJYUjFIRUNsalJiUzVC?=
 =?utf-8?B?RDdFRGZmVk5hZTd0anUxa0hKMThWZURndDFxOHhZdlhlNkk0dGtsaXFmUVh5?=
 =?utf-8?B?cXo2RVdWWVZDWFRVOC9kRWhBSFhLVFB0aEVLVWdtdmlXOUE4KzJoVzJySVhv?=
 =?utf-8?B?SDVCZnlDS1pWTzB1Rnc4a294cEJrQms4K1I1d1FUQzNTRVl5Z0NudGZJOEtM?=
 =?utf-8?B?RG0yeDdNSkxLKzhteEwwUEFxOGJYajZCSG9tQjZLZWJDT3FwdWtwWlpIZU5i?=
 =?utf-8?B?ckE1bG1EakVzQWxieFYxR1UxVDh0T2ZJdGdtdG92MG1sazNlajdyQ01WZWZR?=
 =?utf-8?B?SmFtaGlDd0JjU3AwSG1ia2MzS1Y1ZmhRNDlVVnA0Y1Q3ZUhhMUdEZnVsMWVi?=
 =?utf-8?B?eWZvYWdPblMrS1J5WUVXNWJ0cnBZaCtmcVhEOWVrM2w0RWhVS0M0bEdzc2cx?=
 =?utf-8?B?ZGhSSjhtZkYvbkpMSmZqY2hoK05xUTVxQy9FUk8xd0xkVnI5eUNaVy83ZWMy?=
 =?utf-8?B?Q0hFTlFtVVJTOGRWTVFwN3VwMXVBcHM5Yk4xeTlPTlpTdWoySFFGTXZRQzBX?=
 =?utf-8?B?bUUxR0NqNUJDNnpQbXpFQWdybTJIRXNycFpyYWV4TjM0cVJTYXI5SmxiazBo?=
 =?utf-8?B?ZDB5b0lNdiszcDNwNHphaVdWM2NocnR4dlVHTTVrUnZzNTNNalRSdUNtOUZ4?=
 =?utf-8?B?SWNEQUgrVFhLemthaEJrQ0hlakxPb0FXTzZacnpqVVpxMVRqeUluTFZQWnJ2?=
 =?utf-8?B?YTRxMmlRMFlHSnlLMzdpY2F3L0JSN1pndVdTQ0ErVkJqVDBDRzlBR0FEZG01?=
 =?utf-8?B?aGx2cjRqU3FtZ3RnVnRFVnJiMW85RHRLcFdFck1aZlRIdjJQdnU1RVJUY1lG?=
 =?utf-8?B?NWttcnBJOFk0R1VYdXJUTStlWWZQMVRvNW9zaFJiZ3gxYXluNkxoaUtQN3BO?=
 =?utf-8?B?U2UzSFUvWjY4OVpzVy8yd08zQ0RlTHZMSHdiWHV5Rk81aWQyZFd1akkwOXpD?=
 =?utf-8?B?aHkrQXFxa0xPTzBxTU5neDRNY1dyZHhiZlk5Vm1GOERPaEsxeUJVaFN2MVZB?=
 =?utf-8?B?WU9zODJRUC8rSkJmRHBPZXNBTCtSVWxvaGp2Rk04T1owZHZrZXBGRTBqRG1N?=
 =?utf-8?B?R0ZGU3dVU2hCNUQzaGJtMWlnbEZqemdzbVpUV2lGa0F0Tk45SUdwMGFDbFpS?=
 =?utf-8?B?Qll4VHdrTVdxa3M5RE1lQWdGMlhmSWptdUlBSEZIcS95Uy9wN1JwSDRGTmVy?=
 =?utf-8?B?amdTUWJaRm5VdTJkR2lvc3RHUWtheHYwMkpybnVKZDRRbnUrMTZXRnlDVWFD?=
 =?utf-8?B?Ni92N2tnMWpNeklTZ2JNMEtsUlRCRytsMENhT1RSNU5RN1JxTHdXTEkxcjF6?=
 =?utf-8?B?dUtDRFpUbWZrRm4rZmdCUEJ4ZU9nck1CWGVLTGpzbHVzc2RpNkVySXRqQnFZ?=
 =?utf-8?B?anArcllJNW45YUxOTWpzTkxLTFZJN21RQ3FFQ1FvYmNmWm5SVXdJQXFwV3Yw?=
 =?utf-8?B?RHkyMUp6bmxiOGJJckdTc1k5TWRQTGxBNGdKY1NXVzlyTTRyRVZTKzdCUk0v?=
 =?utf-8?B?VkQxV3ZDd05MVHBEN3dQMXhjU1FrRjhRZlBjTG5CQlhvbGhyem85eFVsVkxU?=
 =?utf-8?B?YmhoRHZRQWpWbG8zWHRLNFpDbXNZNGJBMGd6cjYzQVoreHRyVTkzRUUwb3hW?=
 =?utf-8?B?Wnl3QnI4Y0xEWGxQcTYxdnRhUmowUWVXcHZYdmEwazgrOUFGQkxPd0JOZFBW?=
 =?utf-8?B?K2ZQS1JDeVdMT1N1WHhENjYrZzlJS1Z2cEluc2NtMUtrUXRLRkQrWXhWRHRC?=
 =?utf-8?B?NmxGRTRqMzc1Q25EWWd4dEk2aTZWaC9UZWNSNnp4U1pGajdOdXpldVI3NFNq?=
 =?utf-8?B?ZmJBYkJxQ1hrNlRNTVYwencranVDeU9wRVJpM2VDdkNCRzJWTGNiNUhlYmov?=
 =?utf-8?B?S3lmK2xYdWRaZTdtS242UU5nRWROTklsNDkxYVlLZzZxdlhiQkN4S2dqNG44?=
 =?utf-8?B?VVNFNnpIK1VISlRMb3JmcHFrZVczaTdNY1d2aGxocVRmSkh6ZnJtU1RiWVpR?=
 =?utf-8?B?VXQydjFrMk1TTktkanphL1NERXhxamlEZmJuZnhzT05nT051VGNudUM1Q1k0?=
 =?utf-8?Q?TPuc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjdHSnBLako2VElDZUFVcnVnNWlFVmRrbVl6MS9FbW9QT1V1QitNcStDSVhv?=
 =?utf-8?B?Y3pQUG9nUG5lUS9SQ1RXdGUvYlRHakJFZEk4aENVUHpWTktudW9SZ2JOTjk1?=
 =?utf-8?B?a2pTajUrWnNaRkRiZzc1dkRsemJqbSs1cUtXQzY4RFQxS0NjZXg5VFBSRjZh?=
 =?utf-8?B?SFZBdWtvbm43dnpXOVJqRmFwR25xc01QNHc2cG9Yd05UK3lZdEErWnhudHlj?=
 =?utf-8?B?OHBWRGtHaGJHNTNmcWFIcnBrRm9IU0xscWZScVRyNGV4N0h6alU4NVF0REVj?=
 =?utf-8?B?My9DN3hJV0YvMUdEQnd6NkIwQTF4ZzFjaWJXSkNJQUlIekM1aEh3OURESGNW?=
 =?utf-8?B?cWV6ZjZrYU5uSkp4ZE44OStBOHQ0VkJCWC9QZTFDNGQyS2grWFM1ZEJ0andy?=
 =?utf-8?B?bVd2YXdyME9WbXpZSDJVaXVGUEQ2c0JTU29lTVpkN0FwV1lFT0JPY05Wby94?=
 =?utf-8?B?ZS9qaDJyWTdORWgyckdRcXVIYVdNbTZoRG5PaUFRQng2ZWFaZUtqV0pURHhK?=
 =?utf-8?B?N0N2WlBuZ2hpQUtXaGlnUFhPU2UwUWZ0U2llRC9JN1ZtUFo1MUZZeHRoeUNH?=
 =?utf-8?B?SkQ2WEVwdmo4OWFjUThFSkFsQ0JielVZaUJlZkhERG1rS0g1R0pUYkJWS2hy?=
 =?utf-8?B?dFlyUVlGL2JGWnk5TlRFMHU3OS83cFA0ZnhYOGhwM3lSN214NlFDRUVtemNr?=
 =?utf-8?B?MVR1Y2F1dEJKRFFidVJHSXlmK0tML0YwUFBOOTRDbWNTZUFSenI4QytYU0tO?=
 =?utf-8?B?TUgrT2ZiYlJZVUlkZVFpSG8zb0taOTNRUWVrZ1dWZ0szc0hZM1lyQXpGbnE5?=
 =?utf-8?B?M296cTRuWjlwVFI0N21lemlUYnArN2VNYnI5WmFJcDBUWVpERlRmS0Nlelky?=
 =?utf-8?B?RzZxL0R3QmhKNUtDbHZXcWJQMTNPU1RVd01yMi9OVWJoM2tjcW9TZGxWbUNF?=
 =?utf-8?B?Z1pWSVhCRlkvZEYybzlsaXJJSzk0RDc4WWcxMW1XQSsrY2ZrRitoV2JqWVNM?=
 =?utf-8?B?VVdnZE5Sb2RMVlUrTXNtUVVrRytIcStzT3UxNGZjL24xaWFueWJqa2ZXSkRW?=
 =?utf-8?B?T2F3OWlqRVNmdkFtNGVRQ3dVWVVnNDBOK2NyVEtCMDZ0MlNZL0tQUEhPY09N?=
 =?utf-8?B?OHdrbUtqL09nQklYaitCRTBuWCtqM1pIU3pEL3o0RkVoTEltSzRhMHdTSHo0?=
 =?utf-8?B?c2RCN3hXSzNEL0NtVE96QkNPSW9PZEZtdHVKQ3l3dTNJK2FiMGZ5ZUFqeEJD?=
 =?utf-8?B?aEtvZlpwTGxFOGdKYXM3bEVqd2w5ZFc4cXBVOHliQ3IzckxGVmZncTBIQXhJ?=
 =?utf-8?B?aDQ0Y1VpYWJEdGNZNk5mYkQzeDUyUzBXMTl2d2NYTDByb2ZNWStXbVczMHFQ?=
 =?utf-8?B?Vzg1NCtwUUtEVitHTE5rWGhpb2hSWXNJNlNERi94QUJWVEFYUXlzQTJ5bVNM?=
 =?utf-8?B?VzNzL2hlakt4bU5mbXpLdGhVYmFYN0VlWHQ1M0QxSExWcmdQT2o3Y1o3OUN5?=
 =?utf-8?B?ek9lQ0xwME1xWmdBcXdUbU56N0x5WUJyK0lGT3h4NlR2RUlSbW1aZ2VhSFR5?=
 =?utf-8?B?UjJlcC9yUDBwTzM4TTQ1L0x0NU5XT2tLa2xOaWRsUDI5NS9jYjVaY2tXVWJ4?=
 =?utf-8?B?RlFKOUJKUUQxU3hxbU1rTEpPQmZ0SmNuOHF3MHA2dzJmRG9ndDFzbUJBNjBn?=
 =?utf-8?B?ZElZb2gyaXdVT1NmeCtsZjNUM2tOR3pRd0IvRmIrOHFvODZMWmkvQzRnOUdH?=
 =?utf-8?B?a3hqMFpVSTZ1RkZsODI0ck1vWjlNeTFoS0taSVlaZlZ3YWZkRFd5bWMxN2NS?=
 =?utf-8?B?TlpxY0dUcDFZRzZFdlZLQzRNV09xTVRZdDRIS3l6bStoeG0rVXFGS1JBNHZW?=
 =?utf-8?B?bFRxTGhabWU2ek9LTVFUYmwyMEZkMTBHTC9LakRNdC90TkJxWUtvTDljQUk2?=
 =?utf-8?B?Zlp3cWpxc1BXeWE5TEEvUlhnTWY2SERMUmtDZHRsY2E1L0Z2U3BRalJyb29z?=
 =?utf-8?B?T0lMU01YNmphSTBDVGhOWktPUVZUMmp1Q0RPMytHWTM3RHRHb1lvSTVlVDY3?=
 =?utf-8?B?WHN1S01FaVVvc2RmMFk5a3BvZ25EdVdCNlMxVStCbGN3WU83OUx6UFhNUDZo?=
 =?utf-8?B?L3dFdS9TYzJSbEVpNlhtTjcrVTdDendpRWRBcndMdk5MTjVWdS9UajJFczZD?=
 =?utf-8?B?UWQrc1FTVkpCaXdGanB2S0daU2RDZWpWYTRBZ0lqM2dZZEVZQ3lWenV6d0N1?=
 =?utf-8?B?bjJOYnZ1Mm9ycjVJK2hnMzlvZlFQcWtKdUJ4OW1keTEybjZMUTFpOXd0MXVU?=
 =?utf-8?B?bXlrQi80YytreUpuTGZFWHYvMFlDemhSbnVaZ0k1YjV5a1NQNWhTdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76cc3c0-e1ad-449b-fff7-08de67d294a4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 11:58:46.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnxBXbApCsSgh+EaH1hUXCMjW25+PfTeq+/JI+5rQhvfiqnEOZhxmZgsTKsakzyp7an2cR2gNb/qLD+tL05qok0+RKb5WDt1jgGI5Tr7oSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7720
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 92E5810ECDA
X-Rspamd-Action: no action

On 09/02/2026 11:37 am, Julian Vetter wrote:
> HVM guests with more than 128 vCPUs require APIC IDs above 255 (since
> APIC ID = vcpu_id * 2), which exceeds the 8-bit xAPIC limit. Currently,
> CPUID leaf 0xB returns EBX=0, making firmware (OVMF/EDK2) fall back to
> CPUID leaf 1 for APIC ID discovery, which is limited to 8 bits and
> cannot distinguish vCPUs with APIC IDs greater than 256.
> To address this, implement proper CPUID leaf 0xB x2APIC topology
> enumeration. Present all vCPUs as cores in a single package with correct
> shift values based on the maximum APIC ID, and non-zero EBX so that
> firmware uses the 32-bit x2APIC ID from EDX. Moreover, set CPUID leaf 1
> EBX[23:16] (max addressable logical processor IDs) to the appropriate
> power-of-2 value, but capped at 255.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

This may work for cleanly booted VMs, but it's unsafe and will cause VMs
to crash on migrate.

The toolstack needs to choose the APIC IDs and topology.  Alejandro had
a series working on this problem, which needs picking back up. 
https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com

~Andrew

