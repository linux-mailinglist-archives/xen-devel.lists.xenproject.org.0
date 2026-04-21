Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNqPEC6Z52kV+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:35:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE343CC9E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289113.1569322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFD7r-0000oE-38; Tue, 21 Apr 2026 15:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289113.1569322; Tue, 21 Apr 2026 15:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFD7q-0000mL-VL; Tue, 21 Apr 2026 15:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1289113;
 Tue, 21 Apr 2026 15:34:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wFD7p-0000mF-PJ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:34:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFD7p-00F7oS-2Y
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 17:34:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e7991e-5cb7-0a2a0a5109dd-0a2a450b99c4-8
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:34:56 +0200
Received: from [52.101.53.22]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e7991f-212f-0a2a450b0019-346535164ad9-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:34:56 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5681.namprd03.prod.outlook.com (2603:10b6:303:99::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:34:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 15:34:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br8VvePRetJqNP7sv9EfD0iI5us5OpX24dd5uFPFfshcQKgRIgBJ5oDWLoQ3XXGLa3puIHNAypk9osavZT1tkg2HdAztSQEW53KFmLkRktdm8CEM6AkK1e4Yie9KQqNLHC7FtQCTCSXa7js/reAy/ENUSda71yOguoFobBsm+V5jn+eHYkdfmhMUVMSGbMRB3QjYjEqWlSMgD2EaRZeQfFy6gH2Nu+JeuWn++kGljca2gpjbQuEWKu/LVj/zzTZHuVrGPMjWqz7j3OJMs5liZHmrfxJmLl6I8GhWaEwuHDve+4xQLemzAasOLLOUcH1NLuM142DFZwjB25gTpFucyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef9ukOWNE1nSd8UB2YnxHAj09gZ7yEPq7flJ8AcMkSI=;
 b=IJDvo5m3HbZxqph5X38sNWDj6MSlHhGDqgrgVUs1D1xOXnLPFyZGg5zcI/GMQdCcndGW5nhCMnwyNAWj3Rk5Unt365zYU/y9jqJulhRRNEHuFa9GBimKKD7MW+2h+To9KcYi4Nlc/RyFqXb7B1wMNxYV07jwCrxL8whdk4GUk5QTrifnGiQVki3qzeb/yCbTM8pkxloMPlQOmdDYoYdzKYNe1E6Uzdx6S6IJkPQ1f+4eHfwbv0F5KJ8/w5+kSUlmhg49SMEZ3wNTuZr+RU0KaHMG4FJ+FFjwJbqB0+CViPEIRxDH9viOyJ8bP/L53mg9tpMSVX5vY58AUBOmQemEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef9ukOWNE1nSd8UB2YnxHAj09gZ7yEPq7flJ8AcMkSI=;
 b=iEXxdkO7NMUpsqiGOJhpXKPwSNwRBxLajtbgQUjNdtDzNCUE71oYQowtO7FC/NNbIkal1NeFya7NCsXy3utyeiKhsBhq/TLowQ+aMn410hXNGCMUZ/orrRhUoaTO0heOAMFZQJFuVTwWf0yvted2DK619uIHwetZIHnYQ4kfePY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6e4ddb85-c6e0-4e5f-ac27-caca06c26774@citrix.com>
Date: Tue, 21 Apr 2026 16:34:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260421153224.36368-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260421153224.36368-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 47965348-44ea-4450-595a-08de9fbb8807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/p2tqkWZDNhZ/xH0XYByS7XYGUIdHmzOhfP6WnKY8GH7/uoDpZBiCm7amW2GLDydY40iXpEixIfQD+8y280/GX8+7JyLjD96tj7KD3HQca4+NMdZobdwimtoVzcCDassaBE0xNZBIHTX+g+cU0Cgh6oFqW92t5IuKddkzG4Lj+ZpZBXJxDxQS5DceSOgagwL6w3z05vjy+BEqZmKGvRR0l3rmF0Z82v8wBXrq2AVkSsiFwuPNgYzCyS20G4xt+HdVBrgFfXNOjMGmQPKs5ZVM2BAUU0OEms+ZnwbX6ICmU1iwU17dy7e32mXWuk/NsW1eN3iS5ty0nkl4mNZkU1FEaaSmEsbR1JQA64s7a9UB/kivF9h23//IhYCURJtBCZRHTKeHZYLiJPJxp+iqL7xInb3ymrJU1KHs8IaFeYdYTUA4rKKvwA0cAd7ywSXTxWA8DL0ZI6meYYKlPNQIj90AIm5/mMZFCL7O5B9uruWeOOT21/PW+TYPgiGecJBMCaPH2yPUc0lj4lhtpaOlIUBxck+yW4xSEMW8haAuEtkQidq+PXoLausFchSpXETOHqSqTXXIBZK4dsp9cvUJVj9QM0KKGbTVOCM043qrA2wHoQ5kqalFtyzdng8ZRW+0OQSBDyZovD/uHxkbUsHbeXiefRm4PM3zqz16fwtI5SD3wBf5zRcmLwAGkVs6szYV1uZrtBTGNtPOsoTSSc4hYylNmBpZ/U0CAnn/tBmpkZQRrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlIaUJJN0QveWkrUm5LbVhzd2VLVlpOMVRTTFNlVS8wL09CK1hsY0wzTkVv?=
 =?utf-8?B?QUljRmdNQ0N4VTBudWpKTmpzT2FLSG8zZ1JBaUZudElZT2c4eGQvaHA3QzRo?=
 =?utf-8?B?b1JJTmwwLzFMZmY5cjR0a2dvZ3UwcDNnbEpiUkhSSnF5S2ZpaDZXNXppeDhY?=
 =?utf-8?B?cUU2RmJXVmZDZlR6b0ZoWDd5Znh3dm5xRnRwckpzeU1TdS9oQWszcHdYazJx?=
 =?utf-8?B?R1JjTnJzNDgvZi8xbE9UYVpld0s1djg5ZjJpcGlNSzV0QzR5T3piajRTWURN?=
 =?utf-8?B?YzVhSHpIeDMzejRTQVExMGJ3SUYvbnhVVjViaGl5SUZzWTBxZ2xIMnNrK2ox?=
 =?utf-8?B?eDJBU1VsdVRJK3IrMnpVNkVuVU1rYWYzWmFpd2IzVnVEcFcxSFNsR2k1NlJG?=
 =?utf-8?B?TG52OFNuZHR6SFVUWkIxdTNzOFJ1bzdYa21RVGdRWWl5Ykt1d2VqNkxTelhR?=
 =?utf-8?B?NlhCcVA1N3IvMm5OVVNpdjZvU1lLVVBUZGNJY1M2TDg2YXYxM3hpQzFQL2NN?=
 =?utf-8?B?d2ovOVNXbTVjdTR0VENWY1RuMng3RStjMWpiWlY0NTZDSXBPLzE1U0lMaXdJ?=
 =?utf-8?B?RThTN2Nvb1JQV3N4T3l1RUw5Z1ZCUDlSNHBOZ1NKaVUxcnNQRjFtcnR4WHgv?=
 =?utf-8?B?Y2ZGc2hDQjg2Vk9NNzl4SlJpRUxoZXpqa3pYQmQyN01VVWVSWXpkQUNBenBC?=
 =?utf-8?B?LzlBelhoeWZEZUlrOWhNVTNzY0JaR3FCQlh6cHJycjEyeklacU9aUW9jQUNr?=
 =?utf-8?B?QmFINnk2bitPajAwSUtMdTViOHR2VEFMZDBCRXpJNzlkZnZCaGZqMm84N1NH?=
 =?utf-8?B?TzZ6elJBZG53Y0piZUltL2dGY1JKSldGNTFqclgrbG9lNHJML1FDbFhCMnlY?=
 =?utf-8?B?L2FvN3A0YlpGNXJ1QnZ1NEpYT1Ura0tlNXNWZWhOYnR2ckMrNTVCTWcyQVkv?=
 =?utf-8?B?NWlhdkVSSGxmYjA4aTdSLzVBNEtjY0x2NlJkRUthMm5vbXY4SWJhc3BySjFr?=
 =?utf-8?B?ZGJYbUxOWU5RaHEwcUgyZWdjZFhqZFNNMUpRVTRHblFsaUY3T1BvSS9zVDB1?=
 =?utf-8?B?RkNURlRCMkZUMm04Qmt2b3doRGVBczM2QVp0U1BkdlpLK3dnVm15NXhubEd3?=
 =?utf-8?B?VWdzWm9WRGx3RnNCdzNuemM1L2JIYmNHei9uSVhVd2gvMllrdDdZVzV4Nm4r?=
 =?utf-8?B?MVNQSjZ0TVYrRklUQ09ma1JnSzQ4TUI2NDhYWHF3bjByMVEvb0d4VzFFZGFs?=
 =?utf-8?B?eUoxVll1ZGZVRTRDRTZFSnFXUm1oaVVuemZwaFNKekVlbTJxSUtvb1N1Z3Jy?=
 =?utf-8?B?c243a29IWmdLK2xqckpvREhoRnNLalNXWitCZUtEL3JlUmIveGZLV3hIR1pm?=
 =?utf-8?B?b25PQWh3MHd5Vnhjb3JPb291bkVXaEtIWlB2a0dKcHl6YWFkZFVwYXBDbmZJ?=
 =?utf-8?B?RTBDUUxwUlhmTjh1RTh2MWQvWWM0cHVGSDF1MlFpK1pRUDhKOFNzUTlVeFdu?=
 =?utf-8?B?eE9jdWMyZU1pcmhmM1JaMmdsYkM5UGR1WDdwZjFGdjkwTFhCV3lkZHRHV2hK?=
 =?utf-8?B?WHY5VjhJQVJXMDNzL2lTZkhRNFhKQXFvTE55UlhFMytiUThqV2s0WmJmZHo1?=
 =?utf-8?B?eXIvZWU5d2Q4SEhhZXRqZkx3TUVueWlDMFdqaHFUM256UC85MjBmcnVWWG9V?=
 =?utf-8?B?UWQ2WVdDTFhXY2p0Nm5IZktIendXaDd0VktBT20zNkxEZVpsdFNwN3hsMVhw?=
 =?utf-8?B?ZE1pMG5jNUs2VVl5OExsSHpaWExuZ2VFdXpObXczWU5FWGsydEVTa3BsOWV6?=
 =?utf-8?B?L1g0VXJ4aTcrRnpYdXRrWmtQNUtSaCtPK1Z1QnNCd0JVKzY5VXVPOHQ4Z0Jr?=
 =?utf-8?B?aVFXY3IwdktKNW1kMHF5YVJCY0I5c3pzTG83WmhkZXVMdkEvTS9yMDA1ZHg4?=
 =?utf-8?B?SkxJSk9tbXNSYlNwMUlCTkJQMGhYRXVzMGgyOWRVWFcvd0tOT2dBM0FPeS8z?=
 =?utf-8?B?YTN1V2RkcW1YSEZsMWdkMDNVS1R1VWtsN05OQ1BQY0FNUXpoVk85Ym82ZEh0?=
 =?utf-8?B?UjVQL0hxYUxxWTlBSk50Nm5LbVIvOExPak1DcjVHeTdQVGpMeVR4Vk5sc0d0?=
 =?utf-8?B?UEg5WHRvNXZzZ3dWTS9jdFMwUWNPYm1xZ245UWJ2TXZqdlMwSGpHTEVUd0M5?=
 =?utf-8?B?YS81K3dGY0RhT0hWbEFBb3cvMDJPamh6T0NXL2VNQXhndktlZlR3aWY3NW90?=
 =?utf-8?B?RHkzdXl5OSt2UHZTVkFzNUdMaU1vWFluVUY3YkcrZklnNWlBaVBuZzlaeGdq?=
 =?utf-8?B?MEFGVm1Hc3E1MFNJV242ckZKQyt4bU9RUk5aZlZRY0cySlRZckpmd3RtM3c5?=
 =?utf-8?Q?ikKuPXq5Tut72D6w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47965348-44ea-4450-595a-08de9fbb8807
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:34:52.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pa3xZ2qLMIfY/qrxTk15k3kihImBSAmqX4btjXDhiu25z+Ny9ugj4w4ksgJLtk1Kl3/+Jpzrbr4/4zexgwYVtL8oWYz0jdma/vg31MzNzIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5681
X-purgate-ID: tlsNG-42698a/1776785696-04D67F3B-5913FFC1/0/0
X-purgate-type: clean
X-purgate-size: 420
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BBBE343CC9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/04/2026 4:32 pm, Roger Pau Monne wrote:
> ENODATA is not defined on FreeBSD:
>
> xenpm.c:1380:17: error: use of undeclared identifier 'ENODATA'
>  1380 |         errno = ENODATA;
>       |                 ^
> 1 error generated.
>
> Fixes: edb657887a60 ("xenpm: Add get-core-temp subcommand")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

