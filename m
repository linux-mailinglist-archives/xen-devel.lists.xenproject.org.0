Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zPRaFYCeKmoUtwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 13:39:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9F6716E5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 13:39:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="yJP9EkB/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335378.1597657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXdkM-0007iY-PT; Thu, 11 Jun 2026 11:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335378.1597657; Thu, 11 Jun 2026 11:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXdkM-0007gk-Mo; Thu, 11 Jun 2026 11:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1335378;
 Thu, 11 Jun 2026 11:38:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wXdkL-0007ge-Lp
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 11:38:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXdkL-00CcGe-2G
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 13:38:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2a9e3a-5cb7-0a2a0a5109dd-0a2a450883f6-46
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 13:38:52 +0200
Received: from [52.101.52.47]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2a9e4b-63b5-0a2a45080019-3465342f3511-4
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 13:38:52 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7610.namprd03.prod.outlook.com (2603:10b6:408:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:38:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 11:38:49 +0000
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
 b=R2WwZhSSfC0mGXYK1c8VLTkIy7/1oPhS4jIyi40sZz74Ya4SB8E/iObg+mgayC80A50mUlliJ7sPdVX5WHlfi8iDPBO5TLJiGZd7D5zTbo127eaQcMUzCix7XZBM/5YPkh7x+tsDGWT5Hp5PvTw1K/nRIBPIxIz1l/H28GlPxvqo9tEvjJLuuqIJ4Z4WtUacEh80vlH9RJNhdrWkiRF57xoYIulerBnynpHllJyGCQtZhkrkeZjwyP1hDSGA91I8pDSDEE0VCtzTXtW/ktbVlRIt7t8RoAk4CDxEKgUqRl4eHZ+7a/oMPUE9x4gB32CReM+qyXaHUO0lmu8IkiCbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkcOpXLqx8Dpk9SWFpSlhznieldPbPgCx9xc5lpDY3Y=;
 b=oP8XmY8KS4njxfC7IiF/Z/f1rtbjjAxKoPr1PLZcJa2QSoSSeucHHe5pzH44ZrSWcuOLUxvLABtZb9OdrrbcXlJpp/2FbLoXi83SZLUo8Tah/Zd8yjogxAOXA/T9KzXbDjkxyWXiVNTiIoS2RWpDvwP8UDMDsqR8CbXzkMqWV2NJYnHM6K0ne04T2IS65FCv6raRP/K8FkFoB9okjc1dtIcHMuOiCaaft1Fm0mN9EewxyS7qLOY1VR5Ut7S8xLcI9VO/YwR8Qrx97y+af3fEXxKrFYkG9l0IXYrTKy39v1BNV4mu1cFIlw06s7O7JOmJzodSG0Hy69+wGy3GwX+C2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkcOpXLqx8Dpk9SWFpSlhznieldPbPgCx9xc5lpDY3Y=;
 b=yJP9EkB/8eD8UsHwxE0pAbM96RKy+3jeqbEdkzKmA+Xa2Y4lxFlSjrwo6qWqFB2pifaYFNBP0csOyf0ImUMbWwnqXkd0Hlxj7VuYjjmFKRCINU1mwF+0wtn+PphlDXOzI1IO32fD4JVJWsGMQoX944tCHZDbQr8tm+76fMTts8k=
Message-ID: <1639ef93-4260-4a2b-bcfd-d39a059c1c56@citrix.com>
Date: Thu, 11 Jun 2026 12:38:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22] xen/x86: Change stub page allocation/free
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260611075342.58428-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260611075342.58428-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b6a2d8-59df-426f-0bf5-08dec7ae0174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qF9p54Vq6EssXaVka7w7HhiM6JSUAtfUCZcPYPDvq8L1XwtZIs9qc8oMB4p8QQ/4mIHL+U27LswGlW3ycb90BOs49gdyRug7YnvBM5EnVWPwbiTkYfqW884RVsYK2/Df2wvOxqVJTi4CFGKo2S70jFC3eh2c3wcCriH+BmAC13RMHC6wYM0vmf6SeogFaaqSsbGiLuN/Veg4fLoDeNNLxboXKMJc2WCHRVvtd7f0FCprwC0uhPdkjzoeh8CrvWsg/8fhKhN2UmF3UeNi93psIbnp3ue14UsnDrUFI31qJw4BmnFohV5SZxZuLx8fXsyDP+7txv9cJjDiA4xxQvgypXN18ZXJ6JCt7aKPP6pK0JVLyxnbtMmuACnmuKke9ItTMvRZIdOWgvkG2biU0X3pg3X4KRMmSBd82KvSN2uuJ/L/kVAiZ4H4O2ahfawaA2/HG+Dl1RJstXfOUN99I2hJX41oucIh4XZWBWsECFhZHBaqVt8Ze3TWFH1k64JiicuAcWHRTpl86CLilzTSZaAOx5qLMx4qA0F4JmvACfsCp8xRVt6ZDnoOlqyKLPwXtkUg2S0kxVIHpBc4gObV18MZPaq4sFedL5bl6HHrMFwL91hT27cVFiIC8xV8o2/hi5ez2/CPUAv/PO/iZHEs9Pku7VVGgKBedbKHday+f0iGxX2qnHbzfGc8EloO+faovm9R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkZ4WUFYRFFXaTVid0x0cFB5ZkZidFNSOXFXQ2d1MWpzV3l5YXBMYjhnaTZy?=
 =?utf-8?B?QmhSNjdGSU5CV1plVkl0UXdtWmJVOHJlMUp1b1Y2NjdiL3lpRFBBNE92Nmdj?=
 =?utf-8?B?ejJOWHdGS3prb2o2YWZzUllsN3E3T29lUDQ1ZmdaZnA2WWM1NHZhRmZuZ0ZU?=
 =?utf-8?B?MG5pcmVDK2ZVUk9zQ3ZvK3MvV2JuTVc4eE9qdEIzbWxGZHdsZ2lYTC9CeFhk?=
 =?utf-8?B?RDJYeW0zMWZTenR6cUxSZHhtOTdnTTd5Q0Z0NFh6cTVNQmhTWm56Q2lRR0Za?=
 =?utf-8?B?Tml1emdDMnFUdXpSQi83TVJFWHBSQkhMdEVITHVFenhLRHBTaEhLYjQ1Wnhi?=
 =?utf-8?B?Y2lrVVdleXEwdWlaYmt6RGdSb3lZSXZJTk91RDVWV2FlNVJDN2pTTXFWSUJN?=
 =?utf-8?B?UkdIZUs0K0VHRFlJTFI5d1RXbWF3aXJMdHQzZEdVVTJzSGYrNmtENG00WE8r?=
 =?utf-8?B?a3J0WFlhOHlOYmNndGhQbHViQlUrcDVVakN3T01FcEZMak0yTCtQdjZMb0ln?=
 =?utf-8?B?RSt0VCs4czdyeTVJVzJGejJUMXVYTDRPKzVEZHF5WWNSeDdXRnBnVkRKRW0y?=
 =?utf-8?B?enhqejlyNS8xZTd5QTcvbEdJWDFqeldOcVd4SWM3WDVXK2Jwb3JTc1RFd25v?=
 =?utf-8?B?cWx2TCtWZ0ZaWFN6YUtzRW5reElXUFNIVGptK2taTklMRERjUExpU2lleWNn?=
 =?utf-8?B?czZkWDlhWUJLWVRCeE9oMzJkRWxNNTZwakhBVG1GT0ttTGFYTitRdmNGdGp3?=
 =?utf-8?B?VVl0ellXVGNnK3ZZeDZ3ZURiblUrK1Z2c3BnN3RVUmRIWnlMUWZuRzJZN0ZG?=
 =?utf-8?B?dTdjQWtyZEZ0UkJ5RFRMeU40cDFNc0tkZjNJbFdSNDJDOG45QWdjSm5uV1pU?=
 =?utf-8?B?L3lzTGhIVjc1L1dkQzJORk11elVYZEdsU3RDemZGVkZzZUVnbk5aVWc1alRH?=
 =?utf-8?B?SGIwdnI0M3Y2SXRTQUhhY25jMzlmbFhnOExIZTFkcEROY1dNOG1TWCt4Ti84?=
 =?utf-8?B?SkczYUdwblp1bFlIeWdCR3dIdTlDRHNTNG45bkhOK1VyaGx6VlN1bjNTNFda?=
 =?utf-8?B?ejJBNDhkWTRoYWxuV29VTjRWYVhmdkU0WiswMURmZWR3M1p6dE03MnRDTmJP?=
 =?utf-8?B?aittdFhVVnBzMVUzSDJubmg1VTAwS24rQU5VUkZJVDlTeWdBenp2TnZ2a1lw?=
 =?utf-8?B?QWhURkhWTmJ6VXJNRmszcTh6WXVwbmU3MG9PSTk2QlRoUTB1ekxSNUZDclhE?=
 =?utf-8?B?b1VCRjh0bVZtbDlqZmI5cG9DTEVCTmFNcC8rOXhhK0dVZExZdXFZTGF3WkJa?=
 =?utf-8?B?SW5oOTl2bHhVTjVFWlBjakdtYmYvOUxTbEFnYXEyMjNjTVFid2RPaUtFWC85?=
 =?utf-8?B?U0JmUHVVWklMeFRuK0RvTXN3elFNeW9XSGxjVUJjVWEzZG54bTA5MHo4emRj?=
 =?utf-8?B?RFBHMnB3MVpJemp3SkhNdlV1TGNEMHRmWjdSSHRIcm9GeXpwN0s3OW5neDNH?=
 =?utf-8?B?U2FiTjhuWG1mZUMyZkVqTHc5eFJSU0xpejAvbGVQNHpidmg3UHh3MXVobndw?=
 =?utf-8?B?S3UwbTkvMDdPUXgxSi84QXc5aG1Sb3NEcGpmdEpvZjlaakRucVZSUGs5eWNS?=
 =?utf-8?B?dXg0R1NDNXQ1cEU2azM1dmhNRTJMZ3EyNmxiNXpOdVgxa0RaeXFvT2tjdzM2?=
 =?utf-8?B?cENiem55aDVVNlRzYk5XYnQxeEhMK1JRQ2xNbHNNazk4WTAvb1FDTHRLMHF3?=
 =?utf-8?B?UFJZbmZRbGpCTE4wSEZaTW40ekMyejN2eERZeklsUUlta0JTK0JZWlhwNG9m?=
 =?utf-8?B?UW92RHZPSDVPVDljTFRheXRNQ3BHUTB2UmJuN3UyNExiTEFMbEkwNTlxNnlH?=
 =?utf-8?B?TWRkYko0Q0pHNFBzVVJwWk5zdzZBNEJncXc2L1JXNmY4bExGNTN3a0szTjlP?=
 =?utf-8?B?MG1pKzdRRnVsWVZjdElLQUtTTFlUVFJBUG1nKzFQcjFpRTg4aElwZHVURFpC?=
 =?utf-8?B?dXhOd0p0TElPeEJaNFZuTm1Tck9xb3lLVURmT2VpWXNycUMyWVMza3dvN0w3?=
 =?utf-8?B?TlVwbWs1Qk9OUUwzUDhqSW1rbklQRHpnZGNVU3VjOTNCRlY1WHl0WE5HM25B?=
 =?utf-8?B?TUIwUGFNTTZNV3Nlem1tcWlEbmc4VVVYYTV3eXJWZCtLRkt2b3hjYlNCckk2?=
 =?utf-8?B?Ulc3L3RkTDE2c1dpWks1cVMvRVRmeGJiQmFjUlJXM2hHN3VxcGY2UytmbzBS?=
 =?utf-8?B?T3krUUplckY0MFpWelNDMTNSWGxiM29oeWd3NC9DODFQY015S3BEWSttZmt2?=
 =?utf-8?B?a0ordTlJT2tNRElTTDJwcUNhSXVYOWIyQWlhUnpKT3kxVnlqUGRwQVlRY2w4?=
 =?utf-8?Q?m9ia9q2a4tH5MpNk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b6a2d8-59df-426f-0bf5-08dec7ae0174
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:38:49.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QiSE2kOAIvBVXEDraAJefdNht1uFlJDvLQ1qbsTgKFdNMFNwSZff7CcJd2wu4m2RKYHnCYPyhAmOMbXrWCDSAitVeUcSeXV7EZ4VdMu+Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7610
X-purgate-ID: tlsNG-c1860d/1781177932-BC567DB1-2C4D07B8/0/0
X-purgate-type: clean
X-purgate-size: 7598
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,amd.com,suse.com,vates.tech];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83A9F6716E5

On 11/06/2026 8:53 am, Roger Pau Monne wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
>
> Today the inline tracking of the stub page is problematic.  0xcc is used to
> indicate unused, but it is also a "clear value."  A !CONFIG_PV build with
> smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free the
> in-use stub page.  CPU0 or subsequent onlined CPUs can write to the re-used
> page.

I'm pretty sure a CONFIG_PV build booted on a FRED enabled system will
do the same.

This is the other case where we (now) forgo writing out the LSTAR/CSTAR
stubs.

>
> The new approach uses a global, CPU-indexed dynamically allocated array of
> stub addresses.  However, to handle NUMA aware allocations, we cannot
> allocate all the memory in advance because of the NUMA dependency.  Take
> advantage of the fact that Xen will attempt to contiguously pack CPUs on
> the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
> same stubs page the previous CPU did if suitable.  Note the code would
> still function properly even if CPUs from NUMA nodes are not contiguously
> packed, it just consumes more memory.
>
> stub pages are no longer freed.  They remain referenced in the global
> CPU-indexed array and are re-used if the CPU is re-onlined.
>
> stubs and node_stubs don't have an explicit lock.  During boot they are
> accessed single threaded.  During runtime, &cpu_add_remove_lock serializes
> access.

Is node_stubs stale?  Stub(s) should be capitalised at the start of the
sentence.  In context, it's not clear that it's a variable name, and it
doesn't need to be the literal variable name to convey the intended meaning.

>
> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> There are other even more simple options here: for example Andrew proposed
> to pack stubs contiguously in both the physical and the linear address
> spaces, at the cost of possibly loosing the NUMA memory affinity between
> the allocated page and the CPU using it.  We have decided to go for a more
> conservative approach here, that keeps the same properties as the current
> logic regarding NUMA memory affinity of the stub region.

Part of the suggestion was made in error, but there's a second aspect
which I'll discuss at the end of the email.

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4192edf635b6..cddf8806c877 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
>  
>      init_idle_domain();
>  
> -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
> -                                           &this_cpu(stubs).mfn);
> -    BUG_ON(!this_cpu(stubs.addr));
> +    init_bsp_stub();

Personally, I'd name this init_stubs().  It does work for more than just
the BSP, and the bsp_* part is only really needed for clarity when
there's a matching ap_* variant, which is not the case here.

>  
>      bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
>  
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index d8fd71ffab37..3282392317f4 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -641,41 +642,61 @@ static int do_boot_cpu(int apicid, int cpu)
>      return rc;
>  }
>  
> -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
> +/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
> +static paddr_t *__ro_after_init stubs;
>  
> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
> +static bool assign_stub_page(unsigned int cpu)
>  {
>      unsigned long stub_va;
> -    struct page_info *pg;
> +    paddr_t addr = stubs[cpu];
>  
> -    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
> -
> -    if ( *mfn )
> -        pg = mfn_to_page(_mfn(*mfn));
> -    else
> +    if ( addr == INVALID_PADDR )
>      {
> -        nodeid_t node = cpu_to_node(cpu);
> -        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;

I think you need to retain this calculation of memflags. 
MEMF_node(NUMA_NO_NODE) doesn't work as expected.

> +        nodeid_t nid = cpu_to_node(cpu);
>  
> -        pg = alloc_domheap_page(NULL, memflags);
> -        if ( !pg )
> -            return 0;
> +        /*
> +         * Attempt to use the same page as the previous CPU if possible,
> +         * otherwise allocate a new one.
> +         */
> +        if ( cpu && nid == cpu_to_node(cpu - 1) &&
> +             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
> +            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
> +        else
> +        {
> +            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
>  
> -        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));

You've dropped this memset() of the whole page to 0xcc.

As a consequence, the stubs for not-yet-onlined CPUs, or for gaps
because of NUMA, are rubble yet mapped executably.

> +            if ( !pg )
> +                return false;
> +            addr = page_to_maddr(pg);
> +        }
> +        stubs[cpu] = addr;
>      }
>  
>      stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
> -    if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
> +    if ( map_pages_to_xen(stub_va, maddr_to_mfn(addr), 1,
>                            PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
> -    {
> -        if ( !*mfn )
> -            free_domheap_page(pg);
> -        stub_va = 0;
> -    }
> -    else if ( !*mfn )
> -        *mfn = mfn_x(page_to_mfn(pg));
> +        return false;
>  
> -    return stub_va;
> +    per_cpu(stubs.mfn, cpu) = PFN_DOWN(addr);
> +    per_cpu(stubs.addr, cpu) = stub_va + PAGE_OFFSET(addr);
> +    return true;
> +}
> +
> +void __init init_bsp_stub(void)
> +{
> +    const unsigned int num_cpus = num_present_cpus();
> +    unsigned int i;
> +
> +    ASSERT(!stubs);
> +    stubs = xvmalloc_array(typeof(*stubs), num_cpus);
> +    if ( !stubs )
> +        panic("Unable to allocate stub array");
> +
> +    for ( i = 0; i < num_cpus; i++ )
> +        stubs[i] = INVALID_PADDR;
> +
> +    if ( !assign_stub_page(0) )
> +        panic("Unable to initialize BSP stub region");

\n's for both panic messages.

With the above stuff addressed, I think this is looking ok, but
definitely subject to Jason confirming it resolves his issue.  And for
4.22, that might even be sufficient to go in.

The other thing I want to discuss is this:

>      stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;

because it creates 32 virtual aliases of every stub.

AIUI, this was a hard requirement for the old freeing scheme, but the
optimisation guides recommend against creating aliases like this. 
Besides microarchitectural tracking/safety effects, one consequence is
that we end up with 31 aliases which have unsafe branches in them;
disp32's depend on the linear address the code is executed at.

The ideal solution would be allocate VAs just like we allocate paddrs,
and for the map_pages_to_xen() be beside the alloc_domheap_page(),
rather than outside of INVALID_PADDR check.

This reduces the amount of VA space (and L1 pagetables) used by 32
times, and removes the risk of accidentally using the wrong alias.

~Andrew

