Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o22bM8zNJ2op2gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:24:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3778F65DBD1
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:24:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=hcDdt7Nx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332472.1594911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrl1-00081D-UX; Tue, 09 Jun 2026 08:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332472.1594911; Tue, 09 Jun 2026 08:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrl1-0007yc-RI; Tue, 09 Jun 2026 08:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1332472;
 Tue, 09 Jun 2026 08:24:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWrl0-0007xO-Fm
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:24:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWrky-003U5L-Ky
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:24:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27cda8-bab6-0a2a0a5309dd-0a2a45038e1c-38
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:24:20 +0200
Received: from [52.101.85.61]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27cdb2-672d-0a2a45030019-3465553d9a97-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:24:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5519.namprd03.prod.outlook.com (2603:10b6:a03:287::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:24:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:24:16 +0000
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
 b=hi9pHi6fXNntkfxUYVCSsKaWHz0w0xe5LK9/49paUINVk/JCp9ZqhZkwJT1KB9h4KpMGcC6WcgzWdQCg7GzxxFdTrQsI7L0rKEBhZQMavKlAEC0cFqIKQ/Jgri4M0G7q4XXHMsKI8bhfh0wUyv29HI0Mxww14o47XTgOB4RCTVaIz2WVPYeMn5O+aFxRztfKmYjRghyAmNB46g8MtIh3lA37kyMR6enTWrpcHlOLBsmjNYlDBijEgqof7R9pgssCrnWHov9si1/qaPddxoZS/PK3B+fNkYUTUU48XDW7wYH6/79wLJdH6OWv+gZohOvpN3BP+8/FSzmfVWkBbDSgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34tdOVPVRYJK89DtHbW0capO7kp8DEnub5fuksBX6gk=;
 b=euTFVrQ0fL9ZYte0F5FHyq/yCVbf66r6nFcVyx/qSih/Qmn50pMuyn4lBtOmxR+0s2ZtAySfVp4NiN73BvI1G50uJOK5DFgDgceeG9ufF9ZVo9okupL+0jEAzHMVWF8149ctOZmXuHDMPRJ6Uyn8GamOOuw92X+wCMzoOlcVuZohACGKl7kqHEU1TyOUsJNzVgzKMv72Dx1vfAmGPVpgyvQCQQfWyBJG9M+xzmEKtauXUB39NCVSF8arPn11Nr2gaoLlsUuwGmJAjiO+eiJghC0sdIWNVRLhCkUTCbnZQcBv6JImdKo67WjVpzATaFO3MxHw6Jy9aGlsdzL+cJtXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34tdOVPVRYJK89DtHbW0capO7kp8DEnub5fuksBX6gk=;
 b=hcDdt7NxSuz2d6sNjm6UzYUydxsTpP9SK1o8un6q1LknaPY7qjW7aLfAqN8SunBiCf8a4+hD2b64nvviHmJxyOdifLCdDa2Cba/lTkhJBxTiTbf6X1Cgw3QWD6RdxaxWoBcPnzHuNBrCjfT2CWfKLMNO2iB+L6503kljuY8Oo0A=
Message-ID: <8167bcd5-c037-4f80-9f18-ce1082caea45@citrix.com>
Date: Tue, 9 Jun 2026 09:24:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andriy.sultanov@vates.tech,
 anthony.perard@vates.tech, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] tools/ocaml: silence
 ocaml_deprecated_auto_include alert
To: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 xen-devel@lists.xenproject.org
References: <1780990616.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1780990616.8631fc262581453bbf619ec5b2062170.19eab5024a2000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5519:EE_
X-MS-Office365-Filtering-Correlation-Id: a006daf5-b6b4-47cd-8c8c-08dec6007f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6o4xQwRcNbfKhVF4z5gfnmwjxBdKbSRy3x1iNdaedvFvvvJ7GLlAW2vwrhf2dfIKVc0H/m+G5s2gx2bB+kMVwMMeO0Hgxkzo6t89YZhl9VpFqlMk11mcqnlV3ghmEW4LHkZwE1b8GnhAFASXYUeBOfKYIMuP3vNt5YiypOMRUSWsegrNu7Yt2Y30eHl72N3EEi2DLkH/wIefQYB6krXADAjOT2L9M2yljGCXrDTll5de0NB48kmZnFzpikOZF4rXU0SJfkvKpBGAwqOQcVis3kMf+n+X8Z/TV/88tJm8QZBSLYfUZdv0fv2JYY4jxsFjqk0HBncm/wSFFpsuC4Gsfqc8kQT/wL+F1UCXO0yKWWBPNfhC17lJuQjq1VhXto+VhldOwNDVxfsZhK0m0gli8O70fXnbkJ5nqEbjkryHZJxzISioM9iWjosYuMcu3eUwZ0tdl8mvn1hrbUcpt53cii+27zr3+to8c5/Wp8+zfNG4RlsdDT/elJDbab2ToaDckZUA2+xTTEFCBEH31PHtH9m5GSQwK/wigLm93Ah0wZSNDQZx5HQgXg1ASKiXRwm8qJFfkhGLMGHfUy5b5V8tfRPCB7dPJGIjzNKLZBwUdIckF0lfZBOaDKJhmmAoU5MT0vJPptND5qGSPvhi8m/MJZFff29sWnakbq3XFE+Jaddq6dfvtb7a/Ww4/3jttH6y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFnQ21vbG1tOHlPT3VvaXQxUjBrMzlmM05CQi9OTFh0NlM4OXJpdlBoK0Vt?=
 =?utf-8?B?eXA1YytwZG9QNmtPNHZWaGRLa2NVejNWVWdMZUJyT2FhUkwvd0taWUhZUWlH?=
 =?utf-8?B?Wm1tWnNvOEZQSCsxZTFob1JCU3kweUpsN0JNdEJjT0JuWUdlT21Pd29NVU42?=
 =?utf-8?B?ZXAvYkF1OVZtb3pDVWt5dnoyNk1QVlFDbzNWLzV3cHZhOVVHZERTR3NWa1VO?=
 =?utf-8?B?L2VUbHdkdSs3ZkNmcmYzMURSUkorU0ZVVGVBS2xxRGJTUE5sWVJEcHhxcTJK?=
 =?utf-8?B?bXhjUW4xaW5nYWJmU0dMcTNNaTZSd0Jnc2RPQmx3d3BKdFlZNC93SDZzY0Ux?=
 =?utf-8?B?bUVQV202T1lCaDEwQnJsSXdLWUU2eThOcVZheWxUaW9zUlhBQ3N3QTRjbFVa?=
 =?utf-8?B?QVFzU3dPV0w3N29EMjVmR0pkSS9sTXF6emJuVXdNUGJEczlRSW85Y2E2a0pw?=
 =?utf-8?B?ZEYwL08vVWtsVFpvUUkrYzg4bEp4OU96VHFXb1lxQUtPL21iM3JSQ0hlVUkx?=
 =?utf-8?B?OTRvYVdWZ1NjNG00dFhoYjU0STlOSGhlbVNzR3Y5MDhBYzdaemFnU012RU5o?=
 =?utf-8?B?Q0lCdm8xQ1JnVTEwOWkwVE92ZHRCK1pZL2VqbGt2YjZMN3dSdFZrRzBWWEVT?=
 =?utf-8?B?c0pPNnVMQ1JVY2VwTGdXS2tGdE82dDE4RklqVU5pckprM3dtQjhraFRuc0N2?=
 =?utf-8?B?cDZmK2sybS9kUWZYc0w2bTN5czZJRUZZeHZyVE55RzU2aFVRVGk2Um5EQmg3?=
 =?utf-8?B?aHFQcXJValFSMWJBT1Fta1YxWk90TjR6Wlh6NmZ2L3B3enQ1cDhac01UMitY?=
 =?utf-8?B?bHg3S21nZFNmM082bG5JT05pZlNzM0ZzSXRKVUZIbzBNdkZaVkZVK1c0ekt3?=
 =?utf-8?B?OFJvWjhSbG1JWVN6SWhVOFp0aG5CZTROek9hK2dRNVZNL0d6dnVkSEQ5dnZ1?=
 =?utf-8?B?UzdxQ3VlWkc2OGhUMkdlVllxVUQwSFZqUzVFZFZwL1ZWanRvSmhPNnBzM1dM?=
 =?utf-8?B?NmpXVTRIa3pPTm9ISUQxQXRhbStNRldWQkxhTWNZV1pQcEs1YUI3d0pYSE1N?=
 =?utf-8?B?WDF0ZTdNeVBRUlhkZTRWWlZMZW10dGxrbTVJbmszazJ6RDdoQklieFRZSExE?=
 =?utf-8?B?Vy9HbE1TUzdvdkNSYUUxLytONjJjcEFSR0tkbUI2SVd1L0R3d2J6Y1pIMHZu?=
 =?utf-8?B?dlR1dGk1UzAxTXZwRGpxMFB2NVpJQk9NRS91dUIyV3pQYXlhUGhQWTh1aEw5?=
 =?utf-8?B?NlpNcG1WL3BrektOV2VNRGhHaEJiR0ZlbHMycnh3MHZObllNSE1Oa3IxZXNG?=
 =?utf-8?B?SVlwU0xiVDJMajkxMmM2eE9icFd1UGNUR0J2YVo1bEN2WDVEYXo4WXNLOVJl?=
 =?utf-8?B?YzBaVGJBYTVnNjVwbFZYMzNCYnZ5TlBrRTduSHdWNUdKZTdnN2hVUEc3Ykpz?=
 =?utf-8?B?bVBEeVlsd2lWSkQxMDYvMkR3QVIrOEdPTnFQY1ExUGJic0IzVzRJZXN0ZHo3?=
 =?utf-8?B?bFdMa0Y3NlRVOFVVWEMzSmJjZlNUQm1PTngxbXdiRzBTUzRMRVBsMnJ2S0pJ?=
 =?utf-8?B?YW0vWWVKQ1k0UU5EU3V4UFpYRElybTc4Q3Z3N1RoT1ByLzFtZ1JUQjBuRTJa?=
 =?utf-8?B?eGZwK0UrVS9Fb0k4bDRlVjVscGl2VEFrUmNMcWlycDNsV0E0bW0vd05JanFZ?=
 =?utf-8?B?OU9idzROZCtPNzRzTFNpNUpxY1F4R2Q5N0twcGJzTjZOcFNNbSszUTR1RXZk?=
 =?utf-8?B?TlljSk1DblIzYlhCUVVDRHR6NVl3K1R0R3RxZEFvbjFCdDhuZU5JazVMbTRo?=
 =?utf-8?B?TU9QU25DZ2NHRHVoV05YVDVKeGgzYzdzK2YwekZEeFdyeTlTQ0NqVzJXeTZi?=
 =?utf-8?B?KzdoOGNVZjR6SndqY08xTEQxWjVpUFc4VTFtRUdSYlJrS2lqTk9WUUp6TkdN?=
 =?utf-8?B?Q2ZtUmtPWUttZHRYYXhwaEhrWmxHeVZZQWFDUElUZW5tSit2Wk1IdVRMNWF2?=
 =?utf-8?B?TlRHdmp6d2dMZmM1cFhZamlua2kzNkNnZWNRZXhtall3R3BSamhiOStHbFda?=
 =?utf-8?B?RGFsQWVFT3k5WVdKbGNEaTNaL1ZzRlhtYXFSMmcyT3NHMnZUbEJPOUJERTJV?=
 =?utf-8?B?dGpBNC8zc2FreW1iOGk1YysxUENBdm5UZFY3Sis1eDIvM2o3SWMwbTRiZW1F?=
 =?utf-8?B?YllJdHFKYXlNUjhwbUVPZ2RDNHhYajJUdis5ZXJmdTBkNldzdFRxQkFUZWps?=
 =?utf-8?B?VlZ1RDVSb0Q2Z1h5Q2VuM2dtVzcwajlPeEs5VjZIaVNjbXd0dlZhWGtUN1oy?=
 =?utf-8?B?a0Y2c2lRbXYwYXFzZXIrWkYzYjFDTG1ONUtxbVBVNk8yLy9ET0dyU3pqa3lp?=
 =?utf-8?Q?5L1XFPGyo6DT4lZQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a006daf5-b6b4-47cd-8c8c-08dec6007f1d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:24:16.8804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQF/DqR5YAiecKw0YaZ/qc+sdZYm4nUuajEogluddbbVdsTxFGiar2fICftAR5uaDU/gLauO4FJrx4zzwBCqwrTFtnrxROU5PLS12pGDWZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5519
X-purgate-ID: tlsNG-33051d/1780993460-36746938-DAD4B190/0/0
X-purgate-type: clean
X-purgate-size: 1233
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:andriy.sultanov@vates.tech,m:anthony.perard@vates.tech,m:oleksii.kurochko@gmail.com,m:guillaume.thouvenin@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3778F65DBD1

On 09/06/2026 8:36 am, Guillaume Thouvenin wrote:
> Ocaml's lib directory layout changed in 5.0: the unix and dynlink
> libraries have been moved out of the standard library directory into
> subdirectories. The compiler still locates them automatically but emits
> an ocaml_deprecated_auto_include alert when doing so.
>
> This patch sets the paths explicitly with -I +unix and -I +dynlink to
> silence the alert.
>
> Signed-off-by: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  tools/ocaml/common.make | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
> index c7eefceeb4..0e6714e25a 100644
> --- a/tools/ocaml/common.make
> +++ b/tools/ocaml/common.make
> @@ -11,6 +11,7 @@ OCAMLFIND ?= ocamlfind
>  
>  CFLAGS += -fPIC -I$(shell ocamlc -where)
>  
> +OCAMLINCLUDE += -I +unix -I +dynlink
>  OCAMLOPTFLAGS = -g -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -warn-error F
>  OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
>  

CC Oleksii.

For 4.22.  This fixes a build warning with newer versions of Ocaml, and
also wants backporting to older trees.

~Andrew

