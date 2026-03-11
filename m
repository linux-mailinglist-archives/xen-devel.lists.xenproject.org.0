Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ5KCCi5sWmxEwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 19:49:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399B268DB9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 19:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251477.1548578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Obm-0004qI-SG; Wed, 11 Mar 2026 18:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251477.1548578; Wed, 11 Mar 2026 18:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Obm-0004nB-Oz; Wed, 11 Mar 2026 18:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1251477;
 Wed, 11 Mar 2026 18:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzpO=BL=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0Obl-0004n5-3G
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 18:48:37 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5e39128-1d7a-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 19:48:31 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7926.namprd03.prod.outlook.com (2603:10b6:806:432::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 18:48:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:48:24 +0000
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
X-Inumbo-ID: e5e39128-1d7a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iW6QCKyQPPl4wDwxqNkDR/tUqdnSfKa/mxraQ0uAYsllS4jTpDUph5uvHQixSdcHcU7X7EaotqeMm6f8x4kJgKOq+PcC3nIxJKfTYpk/JrJ3dI61a4aocfm09b8vwdMw4/KivuRlBafXIJf70sTRP7FT9YdrNpBl/77368SsKqh9QJs8+HHvxfiePhuX4Vl5efmbghJIdf4OUxPklSypoSouBz9EDlumdtxR9sUNmV4JshJ+4PezwpIfpHVHg4d16DkRoG3jGNPtiSea9LjXT6nGfroENDS6toNaAGztC6XYuXd2aIyLEWZtlmQTPr9zrd0moiC/dpQeQD2i82Skiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NGDs+BRyn7XweAWMRpwVKPpBX19IbRMJ8dz2ljzaz4=;
 b=psMPgWnzyHD6hIWQiyhyt/nDG5JZuSW47mEtUKZbwzkJ/p+WPpgbs+k+PDjChmEErn6rQvyMg2iEPNhJFa6ca0kOBomy/jG5r49ZVRG+ORQQ7sSm9Zy/QGGd6+3L32/qSSO2Zkn9x4QZtzg3DsYWbGhnG890UJpOHNSbyMmW/gLU+dNMVzOg6BcQ7HPN3zfD+HeAuL41DOc/vKAPK2lGod84Eunst7oGA/UcVVIFH/NjKgdNgNA6VhQjA5Id5sj5I8Zh5e88yakcLUiRt/4Leq6IUsDM/7NuWJcNiDyAWv/x4dG+tQ8Xep2Q/tBnsKJAAbNe2DXva6JmduFoeocneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NGDs+BRyn7XweAWMRpwVKPpBX19IbRMJ8dz2ljzaz4=;
 b=BCF7W1L+s1Z3VK3PT8VGH7Wc/Z/wjbbLU59H7Uy5OAeqLN08ILqAfsTEKiaJgOJUXN9W7oBHhEQ82oJ7Ki2zfyvZ+CoPGrg4WZvP9z75yDIOIa2L9Ah7/DpoTjP53UfbwQhJXCsnz/FmPlrFuN39/Z5Wcy62ddxt1YlWt2fRBEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3a4359c6-ac49-4920-be28-c71cf911ff9c@citrix.com>
Date: Wed, 11 Mar 2026 18:48:20 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
 <20260311142711.16754-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260311142711.16754-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0416.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4289ff-560d-485c-daa1-08de7f9ec66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oFA2M7iYkuM1Z4c4Z2OmgFZVfOzB87SvVO3zLYyjtlMjq6wYhgujtOuSke3yGrR6nYOm9xpnZ6Fvi2JvkPwIHWUDSroQm3oZ8AYnWKB+CE0bGZ0gJPHN0BtxFRfmIzP6jduB7e88bBj2nhwT6ELhlUXRoC5lT/nTRPlkeT+gbOVumFvio2d86gMRthYXivaXKoa8lwwEE+C6JDPVIN9p0blNF9BGh6NLHv+F80/tbrW8sEKoBWw0O6Lmg5Wq4tP8SDE36mXMS7Uog2aEHm2ENwysPCjWKGvSu+QIsfGCihwcltefURmqkYiix4pZGVYvuGTggAi4x6vkM6U9Gx3oI61MpeJ1FCE91Hqchln95xJYbPoi8JywpbPcsUf3sbzOQTaOSicGGB5WbiFWc0+V0IIBvprmZZb9RWTZykUuDLqcfc6J6kcWeDicRjuNoP1sVWJUaS1k9YGvDuHzdQ9PK1M8JezI2Gs6joDvoGPigJrrihwBgJ8jPOgV3F+F/ozq+xYntuXbEdMl8iWlZKD1cie2svjyDrUFcuEo0hG5eWzKapNjA94/NIlJsHfxkMktDLHPiY1BB8Ly3rzII9/WRqw0sMvRq5s3gPmDCxmUA0PrKIMkTCJsqjFJ9UkdTVGiwn0Bj96PbMucY3enWS2i0aF4t1uf1o24eXAV4bqHQkfKlNMsJ+qfmVJwOcT6zMZOymp0Aa5Ehfsle4kgbfBgFMzSKstGXml87UDnqldI6PI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEs3ZCtrMTQydGpQaDNraHlkbGVITzR4aEhIM3JiNTB1c3ltQ3Y4V0Y4Tllq?=
 =?utf-8?B?SlVhVzgwWkRIMFNndTcraXpLWFJ2V2kzaXlZeXVXZUJ6MTBQcW1rTGlQbWc2?=
 =?utf-8?B?d1g5b2Q5ZDBCZTM1bjU3TFc1QjhudUExNkRPd1ZKZkkyeHhjbzJPZVF3eGtS?=
 =?utf-8?B?TDYvNHhKR2JvVUZlYVVvMDVjd3pWQW1xaStHcHBUOEdjTWZlcng1dGduRjdt?=
 =?utf-8?B?NXhYNkVISkJxMCt3ZWg0MnFsREE4c0tqdHJRT0xBODhuTDhVb1N1aWxSSjVN?=
 =?utf-8?B?eHQ4TjJVVFB0YnFTbVJiMUJXUHp2MnI2SEU5bjVYSG1ZUXhRZ016eGpRNFZ1?=
 =?utf-8?B?a1FlR0JZOTN1WGhSdndxTjd4RnNIZ2U3MStXSHV3TGtzZjk0aklITTB6ZEpL?=
 =?utf-8?B?S2NpaTg2SEF5MXRISGJ4WmdxWGRVTGdJM0hldi80dDNrWlRxWUZDZVEveUVC?=
 =?utf-8?B?K3o3UjFsdFNIdkRteTZ0ZkIzdVhGM3JsMEtzR1VYTS9XRXRjd2wwWUdLb1VB?=
 =?utf-8?B?cnFOTWZiV3NrSGN6LzkyYnVubi9PYzY3cE01UVhORFVPb0dpbTFJTysxMW8z?=
 =?utf-8?B?eXZSREJGd3AzQXNXVXV3bUE3d2pxY3FDRHpNK3VmbkZBekJyR2dBYXZrRWZN?=
 =?utf-8?B?dzZESzBYektaa01TMVBFeEc0cjVYYXpNVkFiTXlpWlY3eUJ4bVNxSTRRbmhJ?=
 =?utf-8?B?TnZ0UTBaS3M2OGZSRFJFWjZrWVdoRnBYSW9KZnRRRCtsSkwrNXpKL3JJcEc3?=
 =?utf-8?B?bFAvTld1dzY1UlJ4dnMxc0ozM1d3ZVQwMGY3VGZFcjJYcXN4M2ZRdzFDTW91?=
 =?utf-8?B?d2l1UWVyNWVhM3I0QWlBdWJQUUhKLzAxS0J6WkRPc0xwYk9mMTlTdXFKL3U5?=
 =?utf-8?B?OVVPZlNCMUNybXRyaDZNc2VwN1hXajRGSXpxZVFsWHdFaWJFVGNPMzc1YkMw?=
 =?utf-8?B?V3dDUjdnVzZ5aGlkTDFmcWl6aFVWRUk3OSt6SjRxbGhPd0pxZWJEcktlZGJK?=
 =?utf-8?B?N2hXSHF6Wng4UDBmOGZvUEZDTG41aUZZN2IvR3FYNXgyOWMrOFhuUWdnR2NT?=
 =?utf-8?B?dWNBc1puWldESnk2SGFHdXpsNTdwaXlWMU1tRE1zbVZYWFNrVE1HVUQ4eXMx?=
 =?utf-8?B?REZtcUxtdUU4NnppelA5dlk2MzFlczJiWk5waTh6Z0FZQTk2Z3RHcXU2eURF?=
 =?utf-8?B?UlNMMG9xOFZLNGVRRUEyNkhSakVjdElRajVUTWpPZUpKRHM5dzlLbllnNEVZ?=
 =?utf-8?B?SVJiODlrN2lqQTluYmIyOUMzcDh1YWtERVNFT3oxNERzeFViVzdQcFBPbUQ4?=
 =?utf-8?B?MmVFTUw1RndaMlhHTFNQdW5QV3VkeXpNeDBTdlVKUDJxbnIrSHB0U3lQTnFX?=
 =?utf-8?B?dUROMGl6V2VzRmMzNVhXblRSN0ViK0Y5WjJ0Qk01OUJiWVNVejdBa25aWjFW?=
 =?utf-8?B?TEV3WnNQQ1M2WWtiM05Gdy9OQUdhaFZhNHpxd3F5SG1yeERWaGVzQXFsRVRw?=
 =?utf-8?B?L0lKdHZTbmhyMnZXV0lhZy9sTE53QzIySVBzZlNWL0s2S3lOVlJvNE9oM1JT?=
 =?utf-8?B?clBua29RZy92TGxRc1Y1TGxvU3NKZEFncElkS20rZXJHdnRwSGZyRFVlZWY2?=
 =?utf-8?B?NEFpQnVkWUI0Nm05L2VsTUt2cnpSdVU3R2JVUXd4U1g0UnlXOE9Cc09kMTNV?=
 =?utf-8?B?QzMwREE5aDlMQStjVXMvQ1B0ZjM0M09pZGRXdXFIdmo2ZXpHT3NOTG5ic2pO?=
 =?utf-8?B?am9OV0tPcnY0NnVsTG9PNnFzc1BUV0RvVnFNYVJWc084UlFDSE9qaFYrOE1U?=
 =?utf-8?B?ay9XNkp3WFlybWJQeFlTaE9ValVYQTh2ek1yeXpQZ0RsMExtcVFRTWVJWUUx?=
 =?utf-8?B?NzM0WHB4Q00wSDUyMFV1ZmJXU2ViaXhQYU9wSGJ4VmZuT1FZSEhGUzgxZWJj?=
 =?utf-8?B?a1luKzF0bGxjT3F5aGhpa0JHNkVJSTRGOXVLWUowWHJOaFVocWNOS1NlaVky?=
 =?utf-8?B?bW1qQytiZzNtTERUWDJwVVltMDRtWis0Q2F1TkQ1ZnYwNlBOYy8xeHpsQmQx?=
 =?utf-8?B?WG1RUmZIL2RDU0ZldktJczZjREZXWHQzTU9GVktZRGhKL0hzL1NvQUxvb1ov?=
 =?utf-8?B?TXZsZE9mTHFPUUY1TFJaNGE1ME45MjJuT3FELzhlY1ZEZzdwV2NGWkR4ajlx?=
 =?utf-8?B?MG5SdWsyVklvcmQ3VnFENC8ydWVSeVIxY0hqbklJWVZYRGhnVnc5YVlVNmFm?=
 =?utf-8?B?SldlS3FrOXF0cUt6R2xPaHpPbTB0U2plYm5lYjhEZC9tQS9GWGdxYlZlMVdq?=
 =?utf-8?B?dmkvVE05SmJIZEg4OGp2eTcvZTJoTiszV1NmSTRXemNzbmdRRzBnZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4289ff-560d-485c-daa1-08de7f9ec66e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:48:24.4716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBRKDWPn5pM3fgNaI2xjM5DKXvanragcR873aYVYavNggl5MDfCAQFx1qu9bpm53drDiW8bVvct7Ngs+GjdgddJAHlDSaSEgFvvI2npE4ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7926
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7399B268DB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/03/2026 2:27 pm, Alejandro Vallejo wrote:
> Remove cross-vendor support now that VMs can no longer have a different
> vendor than the host.
>
> While at it, refactor the function to exit early and skip initialising
> the emulation context when FEP is not enabled.

These two things are at odds.  Two patches please.

The first which strips out is_cross_vendor() and initialises
should_emulate to false, to be this patch in conjunction with the
changes for the UD intercept.

Then a subsequent patch to rearrange hvm_ud_intercept() to DCE some more
in the !FEP case, which is no-functional-change.

In fact, I've got half a mind to suggest 3 patches, with the middle
patch being a strict un-indent of the the current "if ( FEP )" clause. 
I think that will make a very a surprisingly legible patch 3.

The result will be much more coherent for future archaeologists to follow.

~Andrew

