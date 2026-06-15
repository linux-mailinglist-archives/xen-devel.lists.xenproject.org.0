Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0c69CmbeL2q8IAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:13:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A46859F1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:13:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=uE2vdc2Q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338135.1599145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5Fe-0006Hu-41; Mon, 15 Jun 2026 11:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338135.1599145; Mon, 15 Jun 2026 11:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5Fe-0006F8-1M; Mon, 15 Jun 2026 11:13:10 +0000
Received: by outflank-mailman (input) for mailman id 1338135;
 Mon, 15 Jun 2026 11:13:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZ5Fb-0006F2-KB
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:13:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ5Fa-002QcU-2F
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 13:13:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fde3d-e002-0a2a0a5209dd-0a2a4507d76a-24
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:13:06 +0200
Received: from [52.101.53.70]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fde40-229c-0a2a45070019-3465354651b3-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:13:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8232.namprd03.prod.outlook.com (2603:10b6:806:45e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 11:13:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:13:02 +0000
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
 b=caDn/MQGGsomIr6VWWEL7nHvUwC3hgG7hshtzI6QZCzJMSe9kNc0gKzGFios8KM+N1AyTDfczLw3lKhPArBChtFLOiT4jaBhO506lvE01wSNU8+fGd+AwiLrENj1ezR+dHMENGxCBSBB9L48bI89PxKcRxLoy4zBF/CW2lHvjTocBcFBaI277Stu/tV/H9man8pd/iPZqGkfjlkMBZyKcIdFexnfW5fBDltSYcv2CQxPzkmiTXubUNCcOsAzfOCrLhz6rbk3NQ5tfdNMh9v4aP+HOwGvccq9HWbDHv/SxmTV5h8fcnFqGOqBzfcvPjntpqITI63iBun3qMJhuS47ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8JosXGlf05Jz3oPyxvm2lCt42a/ba3ZfvEMC3LzaWk=;
 b=CfKM2qrY6skBEDiwAHaUrkfwIztteBrGTZJlhdVdrgle8SqCGL3NREhr+kL90RFLMvGuXemcAWFsYFPnazQQWabeallgAZwhOcowVDE27kD8DjPQQ1Y4zsCCfGmMnZJP66WCCxP/fMxmMzZmavd9FosGQ1wHF/li8DSID2u3VJLtsfLaz2xlUw2xw7pR0TMdM3GllpzFB36M423sXDrMutg1ZMyeB8z2qMiaQ56iBmD9hVAyJoWjsWr65iPVAXEFBpfMzo4FpWKFUwj7DacgUWyGbVR7NR5Mb9oq+ZcvW4ghlBej+ZdVzDlubPBnK7MaQ24FPLnRmCcUwbxP0FuNZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8JosXGlf05Jz3oPyxvm2lCt42a/ba3ZfvEMC3LzaWk=;
 b=uE2vdc2QgE/sedhKQTlLJTkDLTtKsUaFSXXG+JCGUefKPNz+36GFgFRJpn4MirKgmf4aiApmqvuEDDsMR5fyt5jfDV/eV7jBJrgwIS8Vt+MxXh+oYwqgoEC7UJcf1GA2bo/XK+xMcJsoq4vw97QeQ7CvA1F0vGLOGtpMY2Jk1L0=
Message-ID: <70131a25-b3e6-46b4-a9ee-096b0cf23eb5@citrix.com>
Date: Mon, 15 Jun 2026 12:12:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH 6/7] x86/kexec: Pass boot params directly to new kernel
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-7-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-7-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0593.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a03bbf-da95-46d6-a727-08decacf10f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1mSM4bqVkGxsckFaqhTxVQgxAgTs6Xa4C0BK16PpAA3W7IbQTyrk4U8ZhiiroYhyHTEhWWbeDVhVBVMPlLJyHgcFvD/xSGxNCxFj4OAfShcFHSRTaVhf7fO6SpVO4rVfNn8KO/pm1pjavEWZxGejUl/TIXQSTZz1QEkAsIFkqaHEl6+IXMp02qWZtksi7yRocNLvcAlYacQxWS45rFQagxBvO8FSTiPVTzeY9/zNvNhI/EvQWY8hPHBG2uOEKk4XUdEy3l24lfVNIphgEnML1/FfjL4M9zswDOvI0PXO0zuSu7N1rjRPnv37O6vNUxTzyc/OfBTznclzSl3/QJf2+lXqHMIIY8BbNirmhMcIOktjyPI+1Oz0sDDw+nmu/rdkApBIhKvFhTmFw8y7Y6sWe5EIttBN0ezdNZ+aXkpultOh1U5n9oXbaVEAbZL0rG2Gin1hfi++dD6KSTuklgzkWVdBbrruP3WfKCekAD1CI2t8jbn2FCq2MSraaqJg1R9os7ScD3MIpPwXJSeGj+yvqHkqzeNECOFlGg6iou8Oymflj7kQq/xbZCR+Jn5nmgSj2CsbNaIMbTz3u4jcCGOxgLs9wPeXo99rrsGAbLlEigNEark8Pfxrxye6ms0rMFArKyCKQGx3a9txcvBiHZH/SsMLpspIox/NTQHEWn8F3SqcE70bFU6Af48BPKy3jqup
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDluY2NoN2ZvdDNmY0FnRTNoZGVqZTNzQjVrNDlCWEZxWnRzLzF4amZwejFp?=
 =?utf-8?B?ZTFlajl2QitYR2xoZ3RBdHNmcnA0UFp3UXY1V2FMa2wyTStmQjZHYnV4SzFS?=
 =?utf-8?B?UU8za0txWXdvY0wzcStJdndYME1leE1DYWNFSjB2VmtCTTgzNlg4OUsrbFpL?=
 =?utf-8?B?Ui9kUzRkaTVBVEV2eXhBdW9PeGo0TDhFNmJoZE9qelZ0NndYNnJVQzNzMEtN?=
 =?utf-8?B?MjR0NlRUSG9ZVnJjdlVlL1FiM1VDTmg3NXk3SmkxckpMcTAvUlFOQ3htMktS?=
 =?utf-8?B?eDJKZVdhZWcrd1hpVG5RU2xJN29mQ2VvR2NaQ3VvU2J1d2hFMzBsSDRDOHVT?=
 =?utf-8?B?Z0VCOUt1MjlIcjNlRE14UDlrN1UzbllEM1Y2WjE1N2NyVmlLaDdDYlNXelNL?=
 =?utf-8?B?cXZnbnZzZXNsaVpYeEVqMUxLU21kR3Q0QjhhdlhOdk0ydG96bVgwYTAwR3da?=
 =?utf-8?B?WWxOditSRVZkNnpXalgrK1kwcWo2RlBiSTkwTzNvRTQ4cTY1TWYydzA5dVdI?=
 =?utf-8?B?ekJZcDNWZUEwNGhCUjhCSnIxZ3hBOFJNajA4SWxJN2VjV2ZPR3V5RmUyTng0?=
 =?utf-8?B?bW5pbUhlNmY3RHRqZFFRSXpxdkJ2dDkyNXdYTkk0VVFSR0VnNnFjajNMaEEr?=
 =?utf-8?B?REdyK3cwQ1hyMWZ0elZhQklZNitjTlpuRWcvWU9XdjRKMHZmbDI4OHNqT2RZ?=
 =?utf-8?B?WHQ0S0RIeGpZU0k0VVVZWmhvU2VFSFQzTld4RUFLcjc5Nm1nR041NVkrRk8r?=
 =?utf-8?B?TWp3YWNWc3dqM0k2Qml1bzR0OE1NNEV2RkI3Y1ZWMWFnL29KQ21iQkorU3lT?=
 =?utf-8?B?Z3F5YmlzQUVlNGVMZ1VTKzd5MCtOM2dLcGkwa3NiOGVDNExNbTltNGtHOWFh?=
 =?utf-8?B?UndGZDYrbnFHOFF1c04xbFlMcyszZnlhNUZ6K0VBM2NsLzJWeHkyT1ZiN2JP?=
 =?utf-8?B?VkMrU0plTGM0VzVXcy9KNVZQc1RJSmhoS1E0d3hCRHBlaWYvQmJ2bWVhQk40?=
 =?utf-8?B?RUI3ampSQ1BzM3hET3pDOVlmb1Q3VUh4YTlpZWVqNkQ5Ly9RdHVDdlVLV2I5?=
 =?utf-8?B?MTNNRjJ0Qi8xWnBtNGpLaFBuV0lCdityK215SHcwOUkvRkhNemZ2TUNZZDZX?=
 =?utf-8?B?bURnMEZwN0Y2dDVwajBaWVQ5dWtUdCtSRXF5WVo2R2t4WitITVNNVkpzQlhR?=
 =?utf-8?B?N0FYK0Vmc1Y3SFljak5SenBLanlwNEszTVRhZFBBZUVtV2pKQTcyVHBPKzBE?=
 =?utf-8?B?V3pVNmJ4RXVlV2dCL0FScElYS0lSanUzT1N5U0JhVVl4aEFldTBaek93Qzlj?=
 =?utf-8?B?cjZWNCs3YlV5YnUxUVc0TkFvKzAwcWR1Z1RjdGV1d2k1bWpiaC9FVVVRU1dU?=
 =?utf-8?B?M0ZWYjhoKzR1Z094dGtGazdiejZHNWhYL3Y5WVV0TjBUckpLT2dvWmtxekRZ?=
 =?utf-8?B?bkptZmVtYUNHOXViNVN3SUtwMGU3WGVnOFJPMUVWRmFCalYwL3JSVnNzQlFR?=
 =?utf-8?B?Tzl3S0REZXJwYjU0OVJMUC8xWlpiU0pUZWdsN21XY1F0NXBSTWFZRmtsdjFt?=
 =?utf-8?B?REdWUVZFbGFZR3NoRVFwcnhablRTdGk3eEsxNlgzdWFPUzROcFB6S1hQb3cr?=
 =?utf-8?B?ZzVGYjVaUjZuRUJsYnVDejJTYUkvSVNJMGVHRjh3V1ZkcW5QN0ZON1ZmZXJ6?=
 =?utf-8?B?Um45VmZ4SlFpZXBkK0QvczhZVE5WSjdXYlNiN0dpMXVXamdFaVVNTXk2REZv?=
 =?utf-8?B?WnByZmtqZ0hWS0xMVnliR3FGTWJvQWhhWTR1anJuMUhhV0ExdXBkcXhKR3o2?=
 =?utf-8?B?SGJCMUVxMzJhU2NNU201eUhZMW5pT1NXYll6U2JJUUcrTXQ3SDF5SCt1MmpB?=
 =?utf-8?B?NUNnVi80dGpLRnJHWENvYjBkdEovWWU1TFc2Zmpjb2M1MHUyS0I3SUwzWkZH?=
 =?utf-8?B?M0pncG9QNnhUNU1wQnVjTVdIbll5RkxwcGprZDhydnFLVUd4NnNzOUNQTDd0?=
 =?utf-8?B?MUNhMWExbUZOQkpUU1o2NHB3VWRkU2dMbjBaSmQweHhJYlJLa3hEd0lBL1N3?=
 =?utf-8?B?N1hnQUd6MVR6ak9SVDcvTkc2cUoxeW9DbjliVlUxNHZMYVgya201Y2VmYThJ?=
 =?utf-8?B?U25KdEJLd1hDMEJibERDalFtOE9CY1hUNGFoQVVZajFrblYyY0ZNR2FieGhO?=
 =?utf-8?B?MEtsZm9vYXk2V0E1M2dvNUU2V3ZYMjBBWG00M0s4NWthZW5jTHJYeWZ4VHI2?=
 =?utf-8?B?N01yd3puNW8vc0pidnlBQTg4WTJtYmxBcHdGMTZ6QjdwZFhFWVdqZk84ZkZ1?=
 =?utf-8?B?Y3ovM3U4eFFEWWh0OG05WW5XWi9kdzRjNzkra0tNL3RPK2NuMGVBdFcxS2xi?=
 =?utf-8?Q?MHW9oH0PFNfHdqJ4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a03bbf-da95-46d6-a727-08decacf10f9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 11:13:02.5857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4txDWCpdrhQ480s3dZr3U+2OIe+5oEg7n/P/4/+GGTg9Yi6FQ2R8Jqty+WFC0njUG41YkxJEEnuUhU6jeJbZmu6vtdYTrwDPrlDh5tMW38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8232
X-purgate-ID: tlsNG-ef75cf/1781521985-23374C48-81140206/0/0
X-purgate-type: clean
X-purgate-size: 1604
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A6A46859F1

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
> index f921eec5aa..2edc1bd0af 100644
> --- a/xen/arch/x86/machine_kexec.c
> +++ b/xen/arch/x86/machine_kexec.c
> @@ -198,7 +198,8 @@ void machine_kexec(struct kexec_image *image)
>  
>      kexec_reloc(page_to_maddr(image->control_code_page),
>                  page_to_maddr(image->aux_page),
> -                image->head, image->entry_maddr, reloc_flags);
> +                image->head, image->entry_maddr, reloc_flags,
> +                image->boot_params);

With this in context, the field really ought to be named entry_arg.

Linux boot_params is just one possible option (even if it is the only
option right now).

>  }
>  
>  int machine_kexec_get(xen_kexec_range_t *range)
> diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
> index b52d31a654..6a2c839b83 100644
> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -33,6 +33,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          /* %rdx - indirection page maddr */
>          /* %rcx - entry maddr (%rbp) */
>          /* %r8 - flags */
> +        /* %r9 - boot params */
>  
>          movq    %rcx, %rbp
>  
> @@ -71,6 +72,8 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          movq    %rdx, %rdi
>          call    relocate_pages
>  
> +        movq %r9, %rsi /* boot params */
> +

The surrounding code has not been cleaned up to Xen style yet.  This
should be:

        mov     %r9, %rsi /* entry_arg */

~Andrew

