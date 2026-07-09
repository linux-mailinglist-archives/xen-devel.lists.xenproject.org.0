Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T+IuB2aDT2oHigIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:17:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CBD73029F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:17:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=nRl3aF2v;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357967.1612277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmkZ-0002HB-Oe; Thu, 09 Jul 2026 11:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357967.1612277; Thu, 09 Jul 2026 11:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmkZ-0002FW-Lk; Thu, 09 Jul 2026 11:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1357967;
 Thu, 09 Jul 2026 11:17:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whmkX-0002FQ-Gl
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:17:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whmkW-003LZ7-RN
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:17:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f8322-e002-0a2a0a5209dd-0a2a450bac6e-34
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:17:00 +0200
Received: from [40.107.208.49]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f832a-ac48-0a2a450b0019-286bd03118d8-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:16:59 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CY3PR03MB8149.namprd03.prod.outlook.com (2603:10b6:930:ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:16:55 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 11:16:55 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce0Zij11p1qkOjSoNEHtOXnmabm+uoyD+Yq8qW4/LwNUMnVbcw81RHi2tY1s3dB2qghHMTru4PRpI2A3hxizB8sv3eT2woO9F8ct3Jhlg62RkhsmC3VAGSwnicX+tweSHSLaQI23/CHefHYGe2o3VQ2s0fxoBVHBw29q/ohmGhKeAEOJCVzU7i9QKLbULQfHFRwiolWqtZcx9ypzJgt0S5EGprAbt5NeuEeV/I4169Ju9OdZ4g30pixmFZTOfSn4LstMoMkDfq8qyvGsv6HQTCTOFOrtUh2YTm/dsbUcVAhIUkr+RMFu4K2NnuW4Dt3lEPUL0rvr4P3x2PY2AVLorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGTQzBav1uAQSQ/VDjLRFuxhBRQRlQrmPKB5PtbwteQ=;
 b=RuOsSlKR4sPAHho12MNlIv2Oqiu2ZHOpW9bPU4nvaKUt9AxXnImawUvjlkz3WqMSIVC86xsjj14JO68VvtgGmxnhcz0lWqgl1NWniEZK7jr7azs0qPe955znMkMIEiAsF/vNlpJuDFbpg98Vjq+1fDbDrip+omTATWiihLXX/qimABA2HHP897S7u5xnH6Nv+uLf3OSgn/NnJRlNDz2lxQ7VahZwH4E9jM4Cp+43ec7VV/qB7IBdrsgvWEjLZgBj0V8fMBO8+g6b62S1Vr12qb2VicO2v4MUODT9mOZbX3vPS/cl6z1j3VrM3oZ7DMl2mirjYEvQP46E0nuNzpEL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGTQzBav1uAQSQ/VDjLRFuxhBRQRlQrmPKB5PtbwteQ=;
 b=nRl3aF2v0yk9mUTgcClbgx1dOCOKP4cBwLC2Ts7Kv69qQubUdOCohIcRlIoOioTomAE6ngxeIT4nB/U4xE7hDaF+q8wW00QGwMJlg4qMgGsx5cHBuEWEoBNFZImkRnGAe6eam9rlphR/W+LXlwkqE6BjG3+94NGCu7yU6pdBAKc=
Message-ID: <aec621b1-283d-46a4-9ffc-f515a33c26e7@citrix.com>
Date: Thu, 9 Jul 2026 12:16:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86emul: drop host_and_vcpu_must_have()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe377539-f32b-4202-8ef6-fd5b959a7f66@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fe377539-f32b-4202-8ef6-fd5b959a7f66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0121.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::18) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CY3PR03MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: dfef9168-0780-4a05-3bb8-08deddab95e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c5EQHex2XU8CzqapyM9wsCO8xLBPDpAP9kWXNwtQ7ItZBfRWbMK5qXo4U/wKq2KLFIID2NLNh+bJNX0Fq3fxKLS5X7jYVyUC8tGG9r+3bGaLIsgOAa7o+NDHua6eXWlE31c/tV34ED8Hq6CDMTA+eGFoqkE+d6vkd59WYFKuAixHqpFDowxp+KJ3o33BEyyA1oUcUo8Xxoz4D5RulewCIyt56KUVpVaIId/SdeNesRLkfAyJwjOpxDihiRcXU7fWvQ+GdNZ54CsXTATxSTxIppwgPAf/sAGxnei5nxZ9cWoAv69BSML8+cvxqqHEEubeCZr3sLDUWZT6SHZUqJE5Jy1O9Df/Eh2jAZGgimYoVnGVMtpezhc4zc36UmFY+bnhAipS2tv8yMP7UkIqpatTIVyAI559LyfFax7pSZvGtxbK4496p6Y2cIEi303bt2OY99PiS7/KKhYCH9lTjWzDksG7TgFaIm/g/gItkJbVjAXtFYTBISkrvjCPD6bpCjZGszIvO81HRwbrFkbESzX6SE6kaRO9zs0YYqHZlOH2CRE3lOXJVfkFy8m+bKnhzez4xb49SO2Ow3hWg4fxjxxDG2JILC39+z9hh6eNJkwpO0fonB9FIylgV0IIPVfqGvDz8H2Asa0kNp70eQBjYgcOzRlnrnDD0D+M/h+dfd+PiYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG5qM3dzTmxxMkQ3NWl0bHB4VVZUQmgrWlgrd09WY1BFaTZjMDFjRXB6MkNR?=
 =?utf-8?B?WkI2bUY4Z0hadVprdzRlN1cvQmZ1dDhTOXRhNFZhWDlWcGQ1OGNGOElXK0py?=
 =?utf-8?B?Z1lYeVVzRkYwRHphTTFZMlJsN0xBZXlhQ0xCcExWSlFDejlzNEloUkRLeFhr?=
 =?utf-8?B?QWxvY3BHZ1ZTNnFma3pwelQ4ZXVVVjUyREwwZDhkMXJNVFZ2R1pPNEZPdml1?=
 =?utf-8?B?dTdEZXJqQ3piWWhGdTNPczdjMEFXdjc3cll0Y2I2R2RmbWFEYzZFS1hGeVdB?=
 =?utf-8?B?TEw0a1Rpc3dnRW9KSEJNNTIzRTVJcGt5aUhvVjZjaGNhR3NCdjdockVsT0Zx?=
 =?utf-8?B?Y2wzVGtGQk1GMnVJS2RWYlpQeGJFcnFkRFNkandRbmJMbGoySGQ2dEFlWnhw?=
 =?utf-8?B?SnFoME9sWnpxUTZ5dUZSelY0RWNuT0k4WWhpZ0EzU3lMTmYzMmY4ZGZycG1n?=
 =?utf-8?B?ZU1URjgyYXpIaVQzZ3JhRENVSFpqWU56RUhCNTh1UTc1dHowYVd0R3BTdmJE?=
 =?utf-8?B?QmxRN0JyUGVUT0plVDkrWUtGaVBLSzdtUlpjWDVGRldJcDBLY2Y0MWlmYlNE?=
 =?utf-8?B?N3JZUlA1WDZ3UU00OEpnbFdpci9UNk9RSEg1WVhPd3YwRmRKMEpuRWdkc2Z4?=
 =?utf-8?B?TXhkYXBZM3Y0ZUdNcnFxdU0rVW83cGtWR3ZJK1VOQnM1NzRJMDk0QnRQaXhH?=
 =?utf-8?B?STV5WGRCSC9CanNLeU9DRjJLREgrSGZZYXk5N3hDcytSbXNtYWI5dUJGRVcy?=
 =?utf-8?B?NHRQaDRBdE5RVHB3MlhNTHV6NzhXbWRLb0pVL0dKYzVBellOTk5OSGJvTnl3?=
 =?utf-8?B?ek51Vmh4ZTlUTnJaaTNLTDVHOVplWnBacWpQMS9mMGtlcVMzZHZWRHNxSXFs?=
 =?utf-8?B?ZWMrWDRUSDBxdkZxSFVWWUdMT1FUQmFqZUtIaGJrekNpb00rOVpBS1pBcGxk?=
 =?utf-8?B?R05peXh5ZzJ1ZU41a0c2V0lBem9kZmxvanhYaHBmTkthNUhWOFdibU5QVHhF?=
 =?utf-8?B?R2ZFWTFZbmNFRmVpeGJwVExpeTdKVGRzSTQya2VzMS8zRzdPTHdtYWhQNDRR?=
 =?utf-8?B?c3N6L2cvSTc1MUVyYlQwSlZ2dzkwSjkwUkpMVTRreG9CV1I2cFF2ZTVxSjVt?=
 =?utf-8?B?azdXVFFVeTl1aCtsVmJUbVZLS21Dd3NhNThCdmxMRE5lOHlvdjdMOEdzZ1d4?=
 =?utf-8?B?ZUdDWWpRMHhUUys5ZHZyTVdwc0hhY1JTU2hlZ0l1clN0OTZBVnJWUDFyMllu?=
 =?utf-8?B?bFJVVlI2RkhQeWdWQVVLRzdHMUI4MWtwOW9WZFpLUXp5QlM2WmlGVGo4dU84?=
 =?utf-8?B?ZDRIdE5zcHpMSWt6TkVRTHlodjVMQllEMVJ4UCtpRzZxdEtPT21xYldIQkIr?=
 =?utf-8?B?YUhoRTJtSDlnblJMSUpQVWJhaUtBeXFHYm4vNXZTejZkc0ZNSFZMSVJJU2tw?=
 =?utf-8?B?K01NcHk4aU5QUm5ybXNDRHlHQVdoeGFrUGxMVy9tR0NsdFFZYW5LMksya2xG?=
 =?utf-8?B?NHlMQUdrTnlSeVIwVmRMZXdxNWhUYnJBaEFHc3htY1V3YnhHTndLZnp0TDhh?=
 =?utf-8?B?RVNiS3pjUjRWZVRnNEVXaXVwSTlycnZBajZYQUxycUN2QTZaK0dJVUFnMUFL?=
 =?utf-8?B?S1l5dUhwWDFKNEY1WEovMDAzZHBTYysyMDdzd3EyeFhNRVNMeVZkOVdPODQ2?=
 =?utf-8?B?am1YRnBTZ1lWTHN3Z2dWMG01OUZZVFRZK25nT0NTL2tIMFlNOWVsalhJcjNH?=
 =?utf-8?B?em9LUWRJVElhbSttNnN2RUdZTmxGQlFLZWg2SlVpLzQybXpmQUlBT00wUkEr?=
 =?utf-8?B?MHpRSjZvT2NPODRyWVhpdXNpQW54OXEyWWR4bzRoSEd6aTNLRFVxdGd5RWNa?=
 =?utf-8?B?ejFTT0taT0NEUlZYRFgrbmRzakg2WFNzR2YwV09heVFQVlNrOWRpUldacU94?=
 =?utf-8?B?UGV2NzkzYTJnaUFCcnp0ZHd6ZW1nZ0RCeU5NNHFrdFRQaHRodVhYT1cyVVF5?=
 =?utf-8?B?K1FJMnd0dXV1eDdqZ3BWWHlOV1pxaEswd1ozMVN1eE1GVHJwZUdnSzlLYjhO?=
 =?utf-8?B?Ky9zVk83a1JJQVJIN2FVNHVMMWRCajVRNG5jOHVUekFIc1FLU1ZzVWJmTTJO?=
 =?utf-8?B?RzJUZVQyQVR2V1VMOEF2N3Q2Q002WXNzOVhiS2dBVWZlQlEvbUxLQmhkTzdl?=
 =?utf-8?B?MGJTRVNoVUpXNHA4SVkwMFFjMFp1U01vQTZIOEU0WnRQWWYwa21QYjlLcVVu?=
 =?utf-8?B?YkRlWWo2NFVrNmFZWlB0YjVnRE9LMlN3NG9ld0JEVTViU0piQklUL2ZoVnJV?=
 =?utf-8?B?T20zSHV0L1g4dmw1Z0VoK1hIbHZSQmVibVhrNmIrMVk2djJUcEFXUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfef9168-0780-4a05-3bb8-08deddab95e9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:16:55.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRrcS5WZgDAib/26hADGeA6EuivcEKKUpk5RA+az0iywtZ6qYuNl8t4A733mtPFDUpMYDaYuIpK0A30TzPj/VvBFvjWFN42j1RtvyIvMJQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR03MB8149
X-purgate-ID: tlsNG-42698a/1783595820-A7931220-687CDA2F/0/0
X-purgate-type: clean
X-purgate-size: 2019
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:from_mime,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69CBD73029F

On 09/07/2026 10:46 am, Jan Beulich wrote:
> With CPU policy dependency logic now properly in place and working, and
> with us never enabling ISA bits in guest policies which the underlying
> hardware doesn't support, the dual checks aren't needed anymore. In fact
> in Misra terms they are dead code.

This absolutely cannot be called dead code, MISRA or otherwise.

We have a bunch of logic which is checking for A && B.  A and B are
distinct objects in memory, with A always being evaluated, B being
conditionally evaluated, and both having input into the final calculation.

We believe that in all cases, A has the same value as B, and therefore
the logic can be simplified to just B, but that is a logical leap, not a
transformation that any tooling can make.

>
> In turn, a number of cpu_has_* can then also go away, when their only user
> was the emulator code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In my build (with all the other pending work in place) this is a savings
> of about 2k of generated code.
>
> A related question is in how far vcpu_has_*() are useful to retain. We
> could as well access the policy directly, which would even be more
> efficient when a "cp" local variable (or function parameter) is in scope.
> Then x86_emulate()'s instance could also have its __maybe_unused dropped.

You'd need the test harness able to use a struct cpu_policy in order to
drop vcpu_has_*().  It's doable, but isn't a small change.

> With the cpu_has_* being dropped I came to wonder why we have e.g.
> cpu_has_lkgs. This particular one was added together with cpu_has_fred,
> yet imo we better wouldn't add such #define-s when they're not going to be
> used.

Older versions of the FRED series checked for cpu_has_fred &&
cpu_has_lkgs, but I dropped the latter on discovering that Xen didn't
need an LKGS instruction at all.

I think I will need in order to get the guest policies working
correctly, so please don't drop it yet.

~Andrew

