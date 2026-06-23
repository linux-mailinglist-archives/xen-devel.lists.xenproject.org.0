Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dCajIbW5OmptFAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:52:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27E16B8DFE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Y8LLFxl2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344432.1603488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Lb-0008Vm-C1; Tue, 23 Jun 2026 16:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344432.1603488; Tue, 23 Jun 2026 16:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Lb-0008TP-8H; Tue, 23 Jun 2026 16:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1344432;
 Tue, 23 Jun 2026 16:51:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wc4LZ-0008TJ-KT
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:51:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc4LZ-00GDns-1T
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 18:51:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3ab955-bab6-0a2a0a5309dd-0a2a450c8d44-24
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:51:36 +0200
Received: from [40.93.195.59]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3ab997-94a4-0a2a450c0019-285dc33b6af7-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:51:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7568.namprd03.prod.outlook.com (2603:10b6:806:43a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 16:51:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 16:51:33 +0000
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
 b=xiMDsOzLt/v1FNuhXScGj6G/HrwNTIDP+r9Jmy5ZlorABIMK9v1/az/BTYjgFUpX3Aa9HJtykiA36l9q4xcL3oc6gn9mgNQ58z+kgNBCNMec5SOauo9WAgNN4Nz5+TaMElq5Wdg0EC5Svr6tgaSW/f95EUCRWKkTEA/Y6tlHAWtc9kx+/PuFlYrDXsNKVF0sBu+KNAlDat/xp/iyWLrrYfP6T45V12Kq/U8oqDjS8s+kGi3EHgI//O8EGkixFrqA36k68xLzBM9A9ncOGNGfQH21d4SkAF8+peWO1psW0+0l6kwqmSfgbxcFr0eB7tFzodX0eePOJtymySk2QPgeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNydE3pDH9r4ElE646A79O9kUmUsG7dKnDYlxukftnM=;
 b=SZELuZGa2R9uOhWycCYV36lJjYYUE2LvEc/Tqrptz39AkdhioshkhTppb+4kXLRzmeORCCajTDuyyKNmoOzSX+1VbDGhnXdVRLrx8e4UJA3nj5ydeIqm9mNdrtm84yrDkpkm/M6LHTGSxV9LDEXuqzuhpgv+Pi2cOlPSllRMamohvJNs8LSZW37atC5Z8o6igiwvlXMPnJIA53TMo8/3PYxqciB2agabJlcqmOZymK06TXAMcoJcqyrextZ0PpgyzGyJLvO1OOt0QSZyut+pmqQQPyJlwIqTN5NAwLvtQfZmtTvXgdlm53IwTHGNORXpma+WZq4u+V77tlaHzbHoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNydE3pDH9r4ElE646A79O9kUmUsG7dKnDYlxukftnM=;
 b=Y8LLFxl2b5KDYRuIjOP9HsWvbK8Weig1VHjp3Duc3aj9jRJrVJOAdJ2wdDx+65FAUzOolwA6rve8Re2r+ImSueTmqgVcOT/jUl9m3ONDHwgeTxQOhTW4rvzAYGG9fAbf4dC4WDvKG/fdaKwI032Fv/ke5z+NmCHMkhJ+LB4Bhao=
Message-ID: <eca91510-4681-4fcf-9b5e-e79c6c010b9a@citrix.com>
Date: Tue, 23 Jun 2026 17:51:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 7/7] x86/kexec: Zero GPRs before entering new kernel
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-8-kevin.lampis@citrix.com>
 <63766e74-aaf8-48b4-8ffd-321f150132a4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <63766e74-aaf8-48b4-8ffd-321f150132a4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: a15e5a4f-f617-484b-0f89-08ded147ae6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	EsMCjrvu6+OSr/6ZYPMZzwX+31/jgFQ3Vl84KupI4gJ8wSDC5azSRKs74oejq7Fi8nPjmfdTtbp5CyqO6aFl84UcMbjPcT8pGlF4/l4FuuqPB9M95aty66le0fIHR+OlSA/0arXQ/zKjBbSadUg8Lr0hIRiUtSDi+d2V/NVJPiKjN2oovYERMsDR1M1Qohhy7Ro31BkE6GR4Dxk4B2GM0yFFkemTxCaMpQqwqYWviTQVIm6U8GRjAqIBr7zX60esa0IU1mm7XgKNI6jjUBD0eNDL+6s8HO26j5idli1y4cqaHVWgAfic6GvsbnLaID57M/n/DZvF73CDRsDci1bRqc2hB16aOczuSf6SAOL/xIuL4v36uMF8589lyS6rRVrgAymzzN5tVssObVyL45M81kNvTMhinEh6V6YIiojrGacRZwzAyFmhFtjtO2AE5hXNghGkISHc1N7E7L74u0/IazSVuSwGv3lUZwWEw7US/rCx0E7ysyNsUAtS8UlZC5AiYNpM7N+ABQkRXoVaoW38jynDk3VYboO6/pt1d7lDVg+tZonEvfzLPjMQZTt2JGeFqKPp6EDDLWLnyJ3yII99ONce9P5I4vzxJ5/5FTNPx/Se3AauQAtbAsHJxtPFxqWoZo4t3ewFpu0u2DKQJXUAlLTccPoJ8AP318idKk3x5bI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkIvalBLSHRUNmx4UTc5Ujk2OVhxMW1PVWEvS2lnN2ZvMlVncnArS0pNaUpM?=
 =?utf-8?B?S1JyYWZ0dUdwcWxFN2FNNzNXQXdBNWswbEZTWU43NWpBRzRNQU5GMVpqMk1I?=
 =?utf-8?B?WXZEQ1Y3SWtVL3phL2Nmc3U1RUJ3ZlBidEZmL25CNXR3L2N5RnlRZWNUR1hL?=
 =?utf-8?B?eGtsY0NsU3BrNTBhSWN1OUFwMXBSTytIMG5UTWFITG1PcnIrVXhwdHAxUnRZ?=
 =?utf-8?B?c0pMWmptTjVoRzN0eHZ6U0VmTXVleFUvbEhzanpCNGNhUXpKTTU5N0QwTGNi?=
 =?utf-8?B?bENGSkpUd3pkM1J5ZGpYNUgyMzc1Q2Z0VVg3bTVXZUJwcjJnUnBxL21wV0tn?=
 =?utf-8?B?WGx5ZCt2b05WN0hRZUF4cGFiU3FhRFZPc21RM0RMWXo5bzV3OXZ2SElSMTFM?=
 =?utf-8?B?Mnp0aTFQak5Sb0Jmdkt6dit1MlJsaXdOSjhudFB6SXRta0N2b2NMeThPWld3?=
 =?utf-8?B?cVl3cUVDSldSWStETk91VlFLdWdZTmUzbmhwUGZwTVhIRmUyYWpQZzFsMkFh?=
 =?utf-8?B?bUpOUUYzOWc0MDFOZGdKKzlUKzIxQS95Z0NEQTBsOW9iaDlEaWZYMFFFSE05?=
 =?utf-8?B?eldtRDd1dnRVY2dxUmlxNC9rL2NRblZuMzhVYUh0anNTZ0VIc2hCS3J1Kzlo?=
 =?utf-8?B?SllFRnJDQ1M0ZHdzTjUxU050cnNraHgxc1h4d0gxdmlEMDVsM0dDalNmK1h5?=
 =?utf-8?B?S0xnRk0xdVRRMHF4bndXUXM2bTdNVEhFVzdxVXJxa2N0VnNPRXNZZjl5Nk5y?=
 =?utf-8?B?TEw3UjdiWUFNSzN0TUpXR0ZycUEyUTM0QnBzaS81dUZxRytWVFc4Wnd2TXd5?=
 =?utf-8?B?N0ErZVRXa0k4a1hrUlk4bjFGVXBzMzdITGlLZFkza2ZIam95K0VBY1dSREI4?=
 =?utf-8?B?Qm0vQ200Q2plbk9PSmtzdTdLOFF2ZVh2enpBUDlnM1Nya1I1WXI0YkZPYnU3?=
 =?utf-8?B?YVVFb0dVeHViSUNQaDRXbTlYQktocWVpbkpwSUg2dWQxSUxQSjVVQ3lZU3hL?=
 =?utf-8?B?K214RzJVTWw1UGRMRmQ0TzErOHliaDFWMTVFbk9CRzZid2RqRG1EQUg2R2cz?=
 =?utf-8?B?Szc3ZC84UU8ybThzK0VJdHhaaTVPaHBqVVVvWGk4Um82MG4zWURxOFpnOU5o?=
 =?utf-8?B?UmNVVWRCQnJTNFF0TmRzcDROWFZhU1hvT2QyL0wwVTJCeTJ0VzdMM1VOOHNr?=
 =?utf-8?B?Ni9jUmFEYnFhRC8rajJ6Qjd1UVE0M3NQU21sYVkzd20rZ3pkbHJ1aUFHS0pN?=
 =?utf-8?B?bnV3bE10M1lWbVpNZldJVVFSR28xWEF0M2c4ZDRmNnBEMTFXVVlReG00dGF5?=
 =?utf-8?B?S0ZpRUpHbkQ0QTJvRXkwRXBuV0Vhd2wvZTFnVVBvR2g0bG1rWDJCUmliWG5h?=
 =?utf-8?B?NHcyU2s3QUNlVlZxQnpXNktadWFtdW8yVkkyVzZYNXZadFdLSmtia2N2RTZC?=
 =?utf-8?B?YXYrb0J2VUg0dkc1ZFZra1hsZ1ZJb241cHRCQVV2dUJURGxJZEI5bWhBWnpp?=
 =?utf-8?B?WGNYUURLc1JVZFBaU2NSWk1wM25TeTNXQWhrM0pmdS85ZjBtWXE0dkFCdnBZ?=
 =?utf-8?B?ZnpFa012c0dwRnJNS1B0MEhCSmZISUY5SWhWNUxJTVZxNjY5bkVydnk3L0FR?=
 =?utf-8?B?UUl0aGIvUUZ3TnQ1ekVMOU9Xc1NFcXpPdjZ6c2poNnk4SXVSdEJtNUw2czNY?=
 =?utf-8?B?MDVHK0JPSmRBQms2SUxsbnlyVXNNTXpDemNaVFJoZDFTZ0U5V2MvSk5Oam5o?=
 =?utf-8?B?WXBOa0oyZW1jQjRBZldDYmtSV1RGZys2bzcyNitqUnkwcjBwVkFqUDB5OUlW?=
 =?utf-8?B?WWJONXR5WW8xZ0ZGQXFYdDJlVGd5Z0thTmhLZ2RIdDhibWE2VmZ0RnQrNHA3?=
 =?utf-8?B?aFl1c1puM3d4WVg4VGZkbGQyQmM0OGhPdmNoTitsdUdVaU5TenFwVjc3UENS?=
 =?utf-8?B?cWRkRllWZk1IaGJBN0NjY01VRFpXcVJOam9PN2c5L2pEZi92dGdWaWVsWnRk?=
 =?utf-8?B?UVk5aHQ3RjdWTzQ3UXFtTG0zei9FYkJ6V3BhL0ltUnZaOUVZeCtlQjliMm1L?=
 =?utf-8?B?NnhBMmVzZldnSmo1enBBU0J1L24rejJkUzBQWC83akI0d1JFdlUvd0MzY1c5?=
 =?utf-8?B?bncvUHh3aFl6K2dSdFc5cGdQQ0Vpak5sVEwrWWR6ZmlvQUFiL05rTFhKVzhx?=
 =?utf-8?B?ekJFcVl2NHNlV0lVOW9meG9zZmkxSnRvM1dKZEpCYVdXbnlBWXljVEpQQUNn?=
 =?utf-8?B?TUNjSHFQTnVZM1VUV09HWG9DWkl3SjE5dFY5MEhuZE14andteTlLUFV5TGNq?=
 =?utf-8?B?WmYwR24rT2RnUktjZ3FLRVRneGdVdXllRVhNT2JxY3VHLzBWczl5dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15e5a4f-f617-484b-0f89-08ded147ae6e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:51:33.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC7JhTbWzq3MmEkfVYnreBLklvCZhxMb0FedqgAsemxdYcplSL+PEAyrlAhT5LoCsxVyExP46zJNJNsjinsUE02qe2IRSMn+FNSWmGLST6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7568
X-purgate-ID: tlsNG-d25034/1782233496-519F2ABF-3DA831F1/0/0
X-purgate-type: clean
X-purgate-size: 1131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D27E16B8DFE

On 23/06/2026 5:04 pm, Jan Beulich wrote:
> On 22.06.2026 17:18, Kevin Lampis wrote:
>> --- a/xen/arch/x86/x86_64/kexec_reloc.S
>> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
>> @@ -78,6 +78,20 @@ FUNC(kexec_reloc, PAGE_SIZE)
>>          testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
>>          jnz     .L_call_32_bit
>>  
>> +        xor     %edi, %edi
>> +        xor     %eax, %eax
>> +        xor     %ebx, %ebx
>> +        xor     %ecx, %ecx
>> +        xor     %edx, %edx
>> +        xor     %r8d, %r8d
>> +        xor     %r9d, %r9d
>> +        xor     %r10d, %r10d
>> +        xor     %r11d, %r11d
>> +        xor     %r12d, %r12d
>> +        xor     %r13d, %r13d
>> +        xor     %r14d, %r14d
>> +        xor     %r15d, %r15d
>> +
>>          /* Jump to the image entry point */
>>          jmp     *%rbp
> Why is %rsi not cleared here? And why is keeping %rbp non-zero okay?

%rsi is the parameter passed in the previous patch.

Linux used to require the entry address in %rbp.  I think relocatable
configurations can cope without it now, but we don't parse this property
of the image.

~Andrew

