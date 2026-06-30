Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TpDzM43wQ2p6lwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:36:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA06E6829
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:36:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=ZmuJpaKp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349223.1607101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webR7-0006v2-88; Tue, 30 Jun 2026 16:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349223.1607101; Tue, 30 Jun 2026 16:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webR7-0006sV-46; Tue, 30 Jun 2026 16:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1349223;
 Tue, 30 Jun 2026 16:35:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1webR6-0006sP-DM
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:35:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1webR5-001cs7-6k
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:35:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f05a-e002-0a2a0a5209dd-0a2a4506c340-14
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:35:47 +0200
Received: from [40.93.196.32]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f061-08de-0a2a45060019-285dc420305c-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:35:46 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BY5PR03MB5331.namprd03.prod.outlook.com (2603:10b6:a03:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 16:35:42 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 16:35:42 +0000
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
 b=TAru7T5qmziYgRUXc+jGOLlcWDBSFBXu0vrdVpj8LD4w8NpyREnCg+G5oTo9Y8ODHr58GK/bZboE6yjaZyhfYECAabPbVQ/67nkGASqnFVXoM7z7rBR2WdM7FFYB//bvZjth4IOsJHdWIMZ+D8okYPYXDt8iFprXPXRK00LfO0+uBDYr4RDxMD7Mho9Znk2qsKPdYAfW+4OPyj1tD7GXG/D2rtJnOGv7pk8wLRCng/11QXh01ZztK2uajLDxOXLpA6UHh/Qdx0kql9lSsD+sjiGacGJIDwgOQj9cO2jp5b7tK+MC0LvMvXz2VQY0cnq2Jc81mfXR8WsVbs5C8jxMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxo6vxaLH4MPc/usXMFWs/+iNYsEmrUR9M7AiWkMSt4=;
 b=hZb8RjN17nj+f/vAOcRVv7VGD9f59xG8y07+EZFQd+tSjYQCqUFAyyBNm9c/8bxzMoEqT6rLRB0H1yhsSy9qZRKNvOljogBI02FxAOtwHX7PmExHK7U8/ONs2oJCbrtEZOwUspzr/jMN3KUMtYAAiooV5y1v5FFs/vcGYXeM6itlH9H1sAbZ82T7AQpeoGcMLVO4/g3C0G947OY09lSZW+/Ds//XpUYixltnWK3X35MYMXRgCwydAReWiCjgRSGUewyWJXEirGttCBc/iCFzkD4mUWWMKtvqdAV2grNfZ0Eqo+Pas8SZ35/TodVU7UYJCaNh1urxVs4/pfSZfDzvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxo6vxaLH4MPc/usXMFWs/+iNYsEmrUR9M7AiWkMSt4=;
 b=ZmuJpaKptGuu5/i/hd98ZtUIIF42Vt3i0w5RJy4gDV1ySHzFzUot0qer4aLCRDIYygBazzzemxv2uALASiuJDUwk2TUkyafHLlbfkTJwGwEaOAAohtlg1b9RN/PIq3oKwnaNJ7VDrpGFtlLezExPyweoF/+iP7fRVJzIlQ8CpiY=
Message-ID: <5320ab2b-a02a-4639-90bc-52e52287dc50@citrix.com>
Date: Tue, 30 Jun 2026 17:35:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 01/16] libs/guest: Reduce number of parts in
 write_split_record
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-2-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260619130501.272832-2-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::11) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BY5PR03MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccc2d3a-c384-4565-bef5-08ded6c5a06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	R8L8hL8SL2sG21jPapWrUzbnXwSRkXfdQ5X8rp1fYNQEDCJOrKMQqOU0sSUuzi9zAbXqMiT0KINfgtmjF+pX8iheRLtCCEAS34AOA7XFlHK0EuM18gjPIf8ETiIayH4ybahWhWU/OVMlAO2oHw1R5Mfp2JLcLjP25SN5fuvtnIs8gQlUjtDg7f+Hysr1Isulg5ByDlkXZrttMjlueEct1lMSFE0lkjVVoD2wcWz8RM15ksWrs1skUZA0ccLPaU5Axs12OTgruUHEU7B5qwvDRttr56VYKASX60jbpz6ohWGYVg5wGeT+Yl64UzJxPBdFX6d6E/F2EBy3AjW4TrgK0YYzQU1DvY3fJjBgqY0vConBV6xiouuR7/UkVciTlxd5ZMl9g5NftnxPNcDZsssF59agx58znMynqHXuD6iSC9Q7pH5p5bCv57sKAmlUrxHtVBrqa+Xgc1RGWPnttnd1lZXXuDGem03Nj/OrT5oI+p+jRKbRvj+hsbDWpkQtYCMXqdZHKNLA3/bWMQW3zNsyYzKA9qRv9DjYsRQipIoqWavK/rRTuLOz7luiMAaod3vctK2I9HAun9NDy4FDVBwSiY6UwRYRrzxXC1JWvWGBYwBBJyFlrAQaEU2jAvOrUuzBJQe6pdHj7+NnpgNPGV9eFyLavEWqTtoAKKmf/MedO4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2lFT3dPZTA3SytHNHRYR01ZQUlQVFJ5a2E5V1VrWHY5ZWdWK0pRb3JwK0FP?=
 =?utf-8?B?ZTZwRGkxZUR1ZEpBV1EzWWJwYW9JMENrQzc5djY2c25HRTBZdzhiYy9WVVZr?=
 =?utf-8?B?dTd4RVlOb09mNFIvb0VXRHFwdDQwVFhSbDFsUFp1cVZBc1B5WC8wVU1VQy9v?=
 =?utf-8?B?WTl0bm1iZXprclhEWkVzSm9WVThMekdMZUFZNExJUFFvb3dLUXdIRHc1b09P?=
 =?utf-8?B?RkpuRGN6UytDTFpSVzFkSGdFMmRHSFFwaTgzRW40dU1rdXFwYnVGcy9UT1Nt?=
 =?utf-8?B?blp6Vk1wYTIzd3BTZ3VLeElqcUp5SnRUS3BKSFFiRlpoc0FhVWVXd0dSQjZr?=
 =?utf-8?B?dlQ1Ty9MUDJrWE9GV3M5SDlvZ2l5K3AvZ1hvS3NUQXR0TmNUVHhjSHVNeXpv?=
 =?utf-8?B?VXlmTlNrWDhVdFhvcEVaY3FmNmVDbFlmc0xQWTN3WFhlbkdVKzJpU3ZZUzFx?=
 =?utf-8?B?RkhHZFlQZGp4dGhqOFNBbE1TUzBnQk13R3JtZlJKYjJoNzE3dHd0cFcyWFlm?=
 =?utf-8?B?OW9yaVlpUVFMK2RmSEtFeUxVdGozSnRIV2haTDZUblQ3TFZPcmZyTTF0NFpl?=
 =?utf-8?B?TWRsWE90N2d4K2JGNDBBdnlyMXU5RzducFdqVnNIMUhCUGd0LzJjZUY4Njhj?=
 =?utf-8?B?MUw0SHVNTkEvZHB3eHdKTDRkRWxtOVAwUXEyWk1rQVZkRWxnakFNVjV2WGFl?=
 =?utf-8?B?UXo4dWt2bnUrT3hhSnVMeXdzQmZHSUVqSTVwREVoR3E2R1g5clYwVXU3RG9y?=
 =?utf-8?B?emtkQWxwRHprSlNBL2R0R1l0b0wrWnMyQTE3VlQ4ZnhZR1YvQWpvd0JEbmxV?=
 =?utf-8?B?VEFKVEhDV3hsUldmTUZ4STBieWQ0RzlmbkQ5MWNET3pLMVpYdCt6UElaMUo2?=
 =?utf-8?B?Wis5eUpFcS90RWRzQVEwVytCM0Q3MXFvYk8wZnF1b0VrVlFMSWRQVzlBQ2tY?=
 =?utf-8?B?ekoxcEEyUTN4d2xNZFdxeG52dXBwbEl4MUlBZmVnWlgyNUxHQzRQK1FiK0dL?=
 =?utf-8?B?NXl5dmt1S1hId0hOanh1M3RLa1hqTVRjdWZsU05kT2Urc09Qc0lnbm05b1Nq?=
 =?utf-8?B?WkpITllzTWpPZGxEeDdaTnNxaS94SGVXNGNrc01XbjVXSm9YQmdhQ1B5N1lJ?=
 =?utf-8?B?RTBwZzcvRkVBb3BCRDBvRGcyemhKNldzS2hkTHdQR1BrcHBlWldIck04U1Uy?=
 =?utf-8?B?YmFuTDFjQVE5ZTFOdDZCck9PbmV0b1VNTldWTHEzNndOaVFsUWtjemZsamVp?=
 =?utf-8?B?R1RNSDB2aEJvMXo3SitCNU1NL0pzZmFVbVoyUXBkUndpeVRmUTFWaXgyUFAx?=
 =?utf-8?B?RnVaUTRVQjZLME1RL05YTGljZ3V0WUliekNIZ2hRUFhWeFZYVXFxbVd6QTdW?=
 =?utf-8?B?aTJ5US9sN2dtWjZJd2NFQzI1WEJ2OVRHUzBOSm4xR0licVpaNFFMNWlrY2Ru?=
 =?utf-8?B?QTJacEJraEcyYmpCSDBQcWtFQkxUY0E0anV0bGJ0M05kK1ZJQVZqRDMraUha?=
 =?utf-8?B?N2NsRmlIeC9vVXFueWNhZ0o0a1FWbGRNL05BK3diS1Nza3FKV2VQWmtIU3ht?=
 =?utf-8?B?bS9lQTl3bk52Z2VGYkF3d3ZKSGh1MWMxaU5YMStEZElFWU5BN1RlNzc4SkpS?=
 =?utf-8?B?Z2dzMG51Yk5BN0NRZVVtUHY4OG1NYjVUQ1QvN1FOYWwrZ0xEMEptSnIrYWdt?=
 =?utf-8?B?QlRCV3lldVhNVlRtaUk3V2NkbWN3dEt6ck5UTkNFOFh3eGhkN3NPSFNTRUZB?=
 =?utf-8?B?Q21ndmV0TUpHMDYweHdWZDkycUgyLzFzZzRrU01NMzdLWW5CZ0VEbTVPMjlN?=
 =?utf-8?B?YWlpQkxuN0tnZ1pUTUYwUnU3WUJNUWRzTVU4Nkh1dklKUTZ6QmJ1NS9JczlL?=
 =?utf-8?B?Z3c0aGhUMWMzR2JsU0FiaFU3QlRXeGVJVXRIdkczWDM3WWJYNlVFUEFRazR4?=
 =?utf-8?B?c3ZKTVR0Y0dYeUZkSHV1WWdXOEIwTWlhdXdUNWMvSkh0NU5pY3FVbFZFeENs?=
 =?utf-8?B?VWc4ckNPQ2oxd0pxamhHY05vbU9yV290UlNJM3RGeTcxSmNURkxDQ0JMbFlz?=
 =?utf-8?B?UXFQUW5ESjBpRW9XVzl1MHQ4QlhmN1daWlp1MGNqYVlhSEJIY2trWXcwUS9i?=
 =?utf-8?B?YmVIQjJ1Zlk2QjFxYmdibDVFQkl3amx0VTFaOHo3UlExR1BlNUNTcFo4Sm0y?=
 =?utf-8?B?dzZkdmJxb0VkN0dUb1JBa0FPTG1DWUZtdDEyZ2NENUdZRTRuUkZXUWFLL3cv?=
 =?utf-8?B?OTFxUVFiYk5CL3RrQ0FYYlc1eWRFVUVJSEdsU3o2ZVhKZDdrSFViS3R6YVht?=
 =?utf-8?B?Z1BYYjFRRWVaM0VwU0FLcWFDaC9kcHFYMmRtTzlRWnRhYUg1VWVlUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccc2d3a-c384-4565-bef5-08ded6c5a06f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:35:42.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpL4uUK291qlSUwX0AC+7XxPFFA9gBfYk+PmILwizGHcLsU8UjSbD4702IQ9AbIiHvO8im87a1PTWrfvPZiDBYj+ya3J9KHrDkBKdbENDSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5331
X-purgate-ID: tlsNG-16d1c6/1782837347-C633E68D-FA386104/0/0
X-purgate-type: clean
X-purgate-size: 710
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22BA06E6829

On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> Small optimization.
> There's no much sense to split the header in 2 pieces, it will
> just take more time and space to reassemble them in the final
> buffer.
> This also avoids truncating combined_length to 32 bit in case of
> 64 bit machines potentially avoiding following record_length check
> (it could still be truncated writing it in xc_sr_rhdr structure
> but the following check will catch it).
> The function become more coherent with following read_record
> function.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> --

You need to use 3 dashes here.

~Andrew

