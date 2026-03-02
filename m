Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCw3NPWvpWkiEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:42:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE011DC0EA
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244363.1543803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Pc-0005W0-J8; Mon, 02 Mar 2026 15:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244363.1543803; Mon, 02 Mar 2026 15:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Pc-0005Te-Fy; Mon, 02 Mar 2026 15:42:24 +0000
Received: by outflank-mailman (input) for mailman id 1244363;
 Mon, 02 Mar 2026 15:42:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlTG=BC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vx5Pa-0005TY-Ug
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:42:22 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b50bb5-164e-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 16:42:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6444.namprd03.prod.outlook.com (2603:10b6:303:123::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 15:42:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 15:42:17 +0000
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
X-Inumbo-ID: 65b50bb5-164e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOaPUdh38CXQ1x7ZBEHcLzXhef70LUDoF6s9cLxv0os8Bik8nSFYNenRLy3eK35UdXF9JVFAjwZUjp2oGJ4kT494/Mp9XTyzj5BB5gF/clMxvShaewYnwXK7DHDWAR4B2K4+ZOGfuNT3E07ksvgyC6yH02ifPSqeu9AkoWo18pbvq2yEbLlDKYuwW5Sp26iSaVYU1d93vtO0Nlcq4H7Og5dYU3Bar1SLJGzpI2Wtb3mfFtVJVIE7KYpgDzQ6YbajI7b4KDVCORjTxovtv32UrTE30g+/k4R7ICgHUGx0Iss0EM/4Wl0Md0NIJInKoUJM0qxY9Xuwu5zz6BpECouq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FC0BCsAPTshr1gVjROEcLDusm8ZgdIqf4RmZra6rNVk=;
 b=D51mFj5WxBh42BWcRXh0dbSp3SYg4AQvzmHoCRAoiv0ma/h1ETafLu+ixnOkNWyz4/TU1PPBJd77qDNQmNpTCegTqzUoFL5KhLQ3rb4LgjxyzJTF1YFyVuNxNK7YWd33SpoZE//7yvuyxy4UiYR5w1dmW8WZ9St9f2BuJVfT2b6RKTLeab5uuIiK1t29lmAyBoH2kZlekDsZPDyHzj+x5C1KlAa1dZXiZgp2xnjeLMZliUeuEdnxSuNcvWxS8TsSjroW5Ox6MeO03n7nJhhhHnpM0GJwMDhanOISxgKmrQdFNgBvDNyd4zC6pBat2WCVEw7KJ330Y7LbWX93aB/1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC0BCsAPTshr1gVjROEcLDusm8ZgdIqf4RmZra6rNVk=;
 b=ximfNIolbqjotQfW8gDpB4nsOgR2zGF4ewuXLPSU8iw4/xOVUq43/INjTmUV+WTtPfVN8tOZA5HYNRubzrhO4vYwH6JPcmV/D0JFlm1ePbpiL9GU8XujgbYb9dybQqkbqOPkrj6RM8OBTa0ZkDJh8ZOHXmuOWdyjMZTckW/rjko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3e460f2c-9118-4cd1-9d60-bdfa1f502cd2@citrix.com>
Date: Mon, 2 Mar 2026 15:42:14 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 04/14] x86/boot: Document the ordering dependency of
 _svm_cpu_up()
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-5-andrew.cooper3@citrix.com>
 <c0455659-b160-4e34-adda-cbaafb942f51@citrix.com>
 <a99ff4bf-1519-4b93-a11e-dd8c2b5c44d6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a99ff4bf-1519-4b93-a11e-dd8c2b5c44d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1f0834-b01e-4789-e60a-08de7872486d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	22ZNkBCv+6mGi+ejb0g8wP/2FiORBL9+igbMN9kc8DpVJvDk+eijfWqCv+mytN4FD/4x9GdO+j84FmBlrUTfcUZAqP3HTNE+1J3sLF1LlN+5FbyJLDCgY78NADmQ1xYnlzo0arxkgTMPbkp1CamE4E4VfBDaMCpeaGMpvQlhzTlhEOlzhpz96QwO1qZZ0E0xx0G8Jdp1g9KbvF/bE7i3D6wOBsb+xbE5QVat5TPbIrDVnCu9cne6XnT3JFXQVDoA+2VtpIBb6TTLnduG+UiyBXKtPkoIsB+pY2XVpHMb7XA8Ea9J1/2pWagPmiN6ZGREl/J8pZwN/8RvVoAktKSq4cq/Aal1ZghcfaCeyvqEP3pHc08O5fslBUtRH01EL4mouIcOvqtIzQsweplqYV0t+AHXIkb6WDgQGUk8hdNCKd0iE2MWZrvnmID6YgAPiXSocens8w0hEecSgxoPa5XUGgwzAL1ZUQOude8iTnC8aBOGVB8WKDMh0+6X2CN73vVnfyHUcHF8hg5/Vs2GlZk3mbau8lHga5mviK3q9whSqU2DaFdE3J/Gaj+4dx8/jCDD3OxJuDJeYSuxBh8hI0s+zbTmptB+fyJJuKOTN7TvadYhxLYqQCdUymUBzqcJu/5Y7OuuofmcnhMkrda67k/oj1DylkCqrLLOT3OsHk58+UMK+lTqh5R5LVWqeOROISpeGlWBG4djIMbWW13dMoaUZ1QUtio0ocxas6nH+o8XCfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b09DUTBzMWpmOTVROWtjdWd5NTRxdVRUM1hBMUFKQXJDelpFWFRodFZYRks2?=
 =?utf-8?B?bVlVdDJSTmFlS1JMaFlvd0hXK2twWnVQL0Rud0VBZkpwZm43TmJubUdrZEZ2?=
 =?utf-8?B?SnY4L0poM2dBcUF6NFhiTlB5L0N5d0pVUENkMjV5YllCaFQwU0dJRGhrellW?=
 =?utf-8?B?ZFkxeFhDQlRSN2JBMWxIK3BGLzZEaTRQTHY0QTk0ci9BeHd3TUkvNXhtMXY2?=
 =?utf-8?B?Rm1iV0lvYnQxNGpabm9vV3pncTFzbE9TMVl5STdXemVlUGMxOWs1WHBPS1dP?=
 =?utf-8?B?cUtvdUNFUkYwclZJeGpMWUtLbjNMSitNMUZCdFN2VE85NjdNWGQ1cGtDTXFV?=
 =?utf-8?B?Tm9VQzF4WU9XMzhOUENWd1dwNEo0dUpCTEhVMkJVQWJ2emNCWmR3RVpvdmJB?=
 =?utf-8?B?OFlxcHpxZGY3Ry9nUjhPOXNidmlVS2QrempWQk1mS0RiWFRhdGlIU1Y0V1hX?=
 =?utf-8?B?MkpOSGdDMlhmWVhpSU45Nk9nMXE0Z2xnYTZEOVo4VXMxaXQzSG9jaUY2RXMz?=
 =?utf-8?B?czh6c1IvSlBvOHhKR2dZdklEVFdla2wzZ2U0YVdtTElZaHBVYm9DbDRzK0hB?=
 =?utf-8?B?QzgxWXRZbjlwV2JML0JLQ1dBK3dqUXVyaTlpb2w4VTh2QWFKb1luQ3QxSmdB?=
 =?utf-8?B?aWtJK2tIVDdzNk0reUlTTkIzclJSWXd3R0IvQUFHMVlqaVVRQmt0cmNWWlZR?=
 =?utf-8?B?eDNXa3lRSnY2dHZrdzd5ODVVQ2pVLzY2dTdLY1FxbDFMSzV3dVN3b2JxYUU3?=
 =?utf-8?B?UE9VejV0M2x3TEovSndUQVNFQzZsbjRzaDZmMjFhNHF4cmpPZHZrRkpVbi9Z?=
 =?utf-8?B?UUhkSmpXbkVHRkY1bDJXRkh3N2hTOE1VUGNGQjM2TkdxRHZKSzZMcUw1eGJG?=
 =?utf-8?B?MHMwQi84VXNzbTNEaDNsK0FjSVdxM1RrcTk2dWczUXpBQXdQY1NsNmJWYVNN?=
 =?utf-8?B?NUtTWloyTkl3L3Fic1Y4Z20rcUlZMWZJTEo4UGdxd1hmSWlIakhnV08vOE85?=
 =?utf-8?B?TERZU0RZR0huSlQrLzZiTHpjSm9MU1ZwNWZYQzZycm9HMC8yUHFIOTkrZ3VS?=
 =?utf-8?B?YXBkUGtIQmJMeEhDRTRUOHRkcjZ0RlNuZGFKalZBT0gxeXUwbEdMam5lWHZB?=
 =?utf-8?B?azRDZmROY2VBS3JGT2lXbnRKYVpLQ2lCNXd6dExKZkg1bFFUUml3ait1aE5B?=
 =?utf-8?B?QXpGeWpBUFkxaHB5VWoxdTZKYWV5NndaZDM3b1g0RE9sZFIwbXB1TjY2Q1VF?=
 =?utf-8?B?bWZFL3BCR21GN1V5YUVTNzhvd3dnWjBvRHpLbnp6VVVFRWQrcG03UmhqS2ZS?=
 =?utf-8?B?NnpPNlMrTGxtVHd3S3RPWGdkckhIc3J2bU0vUGFjV1hocXpyM1lXTVNSSFRz?=
 =?utf-8?B?N0VWYXUwS1ZXeVhHTGxmZ1dsZjBQZVZURGJabDMzaXFPWFE3K1NCMm5TSWFJ?=
 =?utf-8?B?S1hPUzROYlVUdHVWeTNTK2cwWVZhb25BWGZ4ZXdQcFRiTEJzdlhSOGZMbGVG?=
 =?utf-8?B?V3NHRTlRa0htLzgxd0pNTWVFcSsrNGhaNFVRQXVpSTIvZnpoekVMVGtzV2Vi?=
 =?utf-8?B?NElwZSt1S256MHNSc21zY2EveHRQbEd4d0Vyc1NIaTl1Umt6dGpPU3Jaa1Yr?=
 =?utf-8?B?Mk9xeVVFQzF2cjgrcmN4eGdtZlplQk84N0toUURXaWxuNk9aVDh6YnZOc0kr?=
 =?utf-8?B?RURveEZiMVZkS2xSQ2N2WkEwZjV5OWNpWEM3ZjZPajF5S2xwUkpCVlI3NEU4?=
 =?utf-8?B?NFNaL2s4c0pUVXV1bjFicFFYK1VaaXkxOENPVXd6K0RHY3B2WEVoMlN1aHZG?=
 =?utf-8?B?RFE2SSsxRVA0QUVqTFUydStib0FUTkd1MWNjRjdNL3hpdFIxNlFOZmZYODha?=
 =?utf-8?B?MVdPMElKdDZ2WHYyT0VJWGcxZnNqM0Z4Y0VQUkZXVWI5eHcyYStzSmlOUnBR?=
 =?utf-8?B?czZtRi9xTE1nd2RYR2NmQVlrZ1pkVXBXU29xWk55QjVkN2kxYkdpdUg1Sytp?=
 =?utf-8?B?MjBSVk1GeU85RXltWHdrKzRkamc2ZEowV2ZMcCtJRU5WbjhRYnBKbmVMTHpH?=
 =?utf-8?B?a21HYTE0b0wraGRSSkQvS2RrdnlUVXZiM2JYc1hWRU5kSHVhdkorUFNTaUVo?=
 =?utf-8?B?MkF2bnBrQTU2bTJGSU9GYlNjaE5JVlo3dkVxK2NGYk91dEQyMVVjbFhUY0E5?=
 =?utf-8?B?THFzeityRFBLazZUcEpicWtxMlJWRllnNnhWZmZYM1JyVmJUV2hoQ002T3hB?=
 =?utf-8?B?ZUNqY2I5cnlvQnBZcmNOM1VZWTN6Rk43RkY0cmQ1dTZhTzBxcXpWYmlReUhj?=
 =?utf-8?B?cCtuVzFDUTRSRlpBbXRlT01hNU8rd3Vmd1V4Z0F6eURubUxVY05GQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1f0834-b01e-4789-e60a-08de7872486d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:42:17.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJi2odPro5FbZwHmujlsUlT/sz5QBOCm6nARHlCithWVxPA5g5UCrgGlv/C87g81kmQFzy9fcl1KiP52ZokY+UQZ+bARjYt25NhDbQLaFVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6444
X-Rspamd-Queue-Id: 1AE011DC0EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 02/03/2026 3:34 pm, Jan Beulich wrote:
> On 02.03.2026 16:20, Andrew Cooper wrote:
>> On 27/02/2026 11:16 pm, Andrew Cooper wrote:
>>> Lets just say this took an unreasoanble amount of time and effort to track
>>> down, when trying to move traps_init() earlier during boot.
>>>
>>> When the SYSCALL linkage MSRs are not configured ahead of _svm_cpu_up() on the
>>> BSP, the first context switch into PV uses svm_load_segs() and clobbers the
>>> later-set-up linkage with the 0's cached here, causing hypercalls issues by
>>> the PV guest to enter at 0 in supervisor mode on the user stack.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> v4:
>>>  * New
>>>
>>> It occurs to me that it's not actually 0's we cache here.  It's whatever
>>> context was left from prior to Xen.  We still don't reliably clean unused
>>> MSRs.
> Actually, with this, ...
>
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -35,6 +35,7 @@
>>>  #include <asm/p2m.h>
>>>  #include <asm/paging.h>
>>>  #include <asm/processor.h>
>>> +#include <asm/traps.h>
>>>  #include <asm/vm_event.h>
>>>  #include <asm/x86_emulate.h>
>>>  
>>> @@ -1581,6 +1582,21 @@ static int _svm_cpu_up(bool bsp)
>>>      /* Initialize OSVW bits to be used by guests */
>>>      svm_host_osvw_init();
>>>  
>>> +    /*
>>> +     * VMSAVE writes out the current full FS, GS, LDTR and TR segments, and
>>> +     * the GS_SHADOW, SYSENTER and SYSCALL linkage MSRs.
>>> +     *
>>> +     * The segment data gets modified by the svm_load_segs() optimisation for
>>> +     * PV context switches, but all values get reloaded at that point, as well
>>> +     * as during context switch from SVM.
>>> +     *
>>> +     * If PV guests are available (and FRED is not in use), it is critical
>>> +     * that the SYSCALL linkage MSRs been configured at this juncture.
>>> +     */
>>> +    ASSERT(opt_fred >= 0); /* Confirm that FRED-ness has been resolved */
>>> +    if ( IS_ENABLED(CONFIG_PV) && !opt_fred )
>>> +        ASSERT(rdmsr(MSR_LSTAR));
>> It has occurred to me that this is subtly wrong.  While FRED doesn't use
>> LSTAR/SFMASK, it does reuse STAR.
>>
>> So this needs to be:
>>
>>     if ( IS_ENABLED(CONFIG_PV) )
>>         ASSERT(rdmsr(MSR_STAR));
>>
>> with the include dropped, as the final sentence adjusted to say "even
>> with FRED".
> ... if we inherit a non-zero value, is the assertion of much use this way?

The inherited case is normally when we're KEXEC'd into.  That doesn't
happen very much with Xen, and is more of a concern with Linux.

But yes, IMO the assertion is still useful.  CI boots from clean, so the
ASSERT() will catch accidental code movement which violates the dependency.

~Andrew

