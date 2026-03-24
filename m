Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMCkBOaiwmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:42:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440230A5B3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260932.1554095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52xh-0002Lj-6R; Tue, 24 Mar 2026 14:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260932.1554095; Tue, 24 Mar 2026 14:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52xh-0002J6-3N; Tue, 24 Mar 2026 14:42:29 +0000
Received: by outflank-mailman (input) for mailman id 1260932;
 Tue, 24 Mar 2026 14:42:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w52xf-0002J0-Sx
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:42:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w52xf-00EhbA-8i
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:42:27 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2a2d1-e002-0a2a0a5209dd-0a2a450a8d46-2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:42:27 +0100
Received: from [40.107.200.47]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2a2d1-1772-0a2a450a0019-286bc82fb6a0-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:42:27 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7383.namprd03.prod.outlook.com (2603:10b6:408:1a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:42:07 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:42:21 +0000
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
 b=XbfSfvOrWkotDpgfiQsO+aF5nwgMF8kk3r2vH8qq33qMshUruelN6O65xE0999/nZn5Ef+JgGBkXWolOP22alsFjDo2ilN1K6rWgngKjRIIj9xkESmoQ2dOeTHOo+kX/2Kmgzu3DnL997mULHTTSkLhH+yhIg7nNU9/Idn0magyeaLuKo7Jkg5HgrPrXwd4Ba475PdnmIO2jo/msVFKfkQEKg+eYYgTIhyCHFM8jHAHNypb2XGlnoEuYRdLrX/0YGUstLRcN+BBoPE3oVN1Iv0QONBDdLL0QRWEfiktHn6hYKFrwM04JZkoIKe403Slg2kx818Msz/y7R6D5osN4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfCbnHYkw45Gh6fxQudDYiDmDC3fF9I82ocKi5X9ehw=;
 b=g+Q3S/jjc6En7Ow8Dg+xLKA8E7w5Z3aCzmwHtsrk0OAPYM7i0m+q1/ECqxAeEuEZrtvX8zqHEP90T1NMxShh1IVlw+/C78S6L5S4gMEgKJcZ/dR49bPa5SdkmhUHpCwbeEWcacPM2PC0SFVuE8yrU0gxuBxbANogJgSsgvcUDJy+9bGMCrQ8Qgd+OqwARxF0tuyg9ScPVq/ujJAZVd9Wp4WGC9TIG+Vr+fevVJr+4Hzd8+DXPic/7HRyPX+3XwN5MXZirq3id4r1tVaK4uNZxjch7ph+rKnixmOn74T6VyXL7QiJdUICHLZp+A/YT/7J9pa4Z0uCIprBOk/GB6aPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfCbnHYkw45Gh6fxQudDYiDmDC3fF9I82ocKi5X9ehw=;
 b=XWE5psghBEAN9Ptm+uWEusRMtbrs8Xdz9B4QGDV6FWifAce2ifZPsfOAU/aAZ1fkXgjLID8cbh1Xjr3UUxVRtSCq15k7tzaI6caxvioQNTasCqfkIKlBZ4gzS2oaSQHl4Zbma7mc2DDoweRACoGDR29jrDuifouTp4CoQIus7PI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f563feca-54b4-4fd7-9c52-2ef29b0e1a81@citrix.com>
Date: Tue, 24 Mar 2026 14:41:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] x86: Remove fpu_initialised/fpu_dirty
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-7-ross.lagerwall@citrix.com>
 <b2574a87-4707-4eb1-9d1d-23caedfb5bbe@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <b2574a87-4707-4eb1-9d1d-23caedfb5bbe@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::11) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: cac25f8a-e6ce-4bb4-1b16-08de89b388f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A8IBiNbN27l9OlAQ5+rrJzLv8RKBcCxWM50zOLfXa/WQjXdm17q9fsWi7DO4JCIA+XCBBy9ZQ50NqzlcOV3YhcCFA0JmDi/g8AopUw3AUokOD8SZlCDtokefG8vU1/r2njHISC2c53qvkX6h2+BO4v2WF2beybFA8iSyaz/JOuPP5+DFL8QP6+azLWM/ng1uY5yzSqmsMpcn7IxdbkR5HXoM6fCUBP+Z5itrzx7qEtGEFQscGkyBnVeP2fHZYJ6u3162karh1LaeZAemB3vOXMvESLrC5kTx1vC0pVPQX6ijvZnZnoM1lWyavs36l+T59wlpmwzwJMT6ZDVDUp/cmvdPfV0XLML9ZNG5UOLfRaLwMGBpKNIsHOX/hwsgVYg6g+4LXDqs+fNn9PfcnqtXZbVRSXbd56EMUB/hItvdR7ZiS3Lb7xMxtrRopuPgGEVW91YrylMolzZwsjH861aQsjy8BXZytpGRrPYawo4U69YDFvCoOy3OsN7+nWxJDMOMewpeuztZr0Dj9+rVTvDE3/DEiHSki2Vw5r+jRNZvmJLZvVqm16U+L8946pdMOH/d8McILr4e0IZ1tBSq+zhEOJOyHoF4rqTokO2Y+OhuxBUIvkBPSK8AShBRTHqDPz39lTmF2tlSo+qSK3J7NHOQ7a27xmBbZ8CXRD0WwxrkMtHlkCl53dhuh5MdEmomdHc5iVryJO58QffgYZOUfH+ndxKLtjHrH1hoT+Cb7w2jO7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RERta0RLTnk3dnV4azNTclhXOGFyMFUycXl2UFQrWXpicVFvN3lNNDc4Tmda?=
 =?utf-8?B?ZmRRTHNWYXlBbWlULzhPK1RRcFJTa2txbU1leWtPZldGeUx5SndFVVVXU0Z4?=
 =?utf-8?B?Uy9XTDV6bk0yMUFNd1dqYldvc0JyY2tqcTNneFBPVVBlQ3YrcEdhWEZqRHpE?=
 =?utf-8?B?Y24wSTJOZWhFU1BYL1AxRCtPVGRGdkNYWDE3b1kwdFBxdUN2WXdIV0Rtdi9i?=
 =?utf-8?B?UzBEeGhMNWlhVWtTMTJnOFY5YVNVU3ZGNU1rYzhVaDZMaFJicVdVcWtEZWZP?=
 =?utf-8?B?R1ZRNW5BSWlXRFpudEpWVXFTeEJvMmc3UVRmakN2aWZLcXJheE9CanNJRDFZ?=
 =?utf-8?B?U0pvbmhDMWZHUnVsdjc3VmdMbkFTUW1DSUNyb2V1dk9DbzVTL01KVTdCOUV5?=
 =?utf-8?B?SWpuZDNqR2ZBSGZSL2V4U0NGa0hFVlg3eVVPc1Erb0ZTRWxidU11UGNSd1RF?=
 =?utf-8?B?U0tZWWIwbGhraE9rZW1XMktQaXprMVhwdHJiTVRaUG15STUwYmJzK0ZIVWpk?=
 =?utf-8?B?aTVIalY2UkdDZnRmVFZnQTBVNGVta1htQTFPbEN1T2lBY3Fmc0phTFUxeWFE?=
 =?utf-8?B?eWtva3hyY2xFcG5vSm5vMTJ2bFd1cCttUWFFN09Ta1dWaklDbnBQVHlNSHhU?=
 =?utf-8?B?eFE3enJIUGx2ZGxJbXFxeUhKNjZjWG9kUkVzR1d2aUZMVFEyaUlxaG5Wc0Fy?=
 =?utf-8?B?VUVrWExDZGJ6KzdWSFVDUUlOdklrZXZFejBXZEpZR2pockxONkxWZnd6YzNr?=
 =?utf-8?B?emFqUlRUVDFSMkVVZjB5VXlJL3czVTJ0Nzlpa0VkZ1dTbUM4TWRXc3NVNTMx?=
 =?utf-8?B?OS9YUW1MY1I4bFR1RmsvTjIrUG8yZjRHQUpGYWo3YzR6eDFObkNsSkF3U096?=
 =?utf-8?B?VW9GNHJWU0RTZnlqd1dNc3VQYkNId2crYmJqMWk5TjhLUmUrWFhPRmp1T2Jq?=
 =?utf-8?B?djFrRm0zVitIMVR2N2I4bTk0eDVlMU9nNEdNcUFSNkExd3Fud0FBRTFHWjAy?=
 =?utf-8?B?MG1yN09EampRRmM5Rk41anUycm4rQ1hqeFFHT3VFbWhmdFh0bmY5c2VOb3hx?=
 =?utf-8?B?R0FJQ1FGc0tBd0RmV29KcnZ0dk1HUWFPOWFvYlFuNCtqYlhPMHc2bGJhdW9F?=
 =?utf-8?B?S2RWZ1pTd3UvaG0xU2xydzJlVlFpbzVEYi95b3ZZZmRnWVFLdjllNTJmVmFp?=
 =?utf-8?B?SVZpSnlkV0RZeEZsaVBqQmwwNm0wKzVOL0dQcnNKMDdpVUMySm45VGkyS1VI?=
 =?utf-8?B?TjIwcUg4d2MwU1E0b0M5NHgyQlBKRzZuYWhOQXZQR3FjVVNScEdpR3k3UWdj?=
 =?utf-8?B?U0lWRzE1TEpVVDMxWE5qOUJpTUp0UTNCNXRBU1VoNzZZTWREdWZOS1BUMHlO?=
 =?utf-8?B?L1BKc1VoQWhZeEZhZFRsYVFxTFRDTXdnK3Ewc283WWFxMHUzNmV6NUFQbUlW?=
 =?utf-8?B?NzloT3M2eXNjUndIMHUwVktpeUIzRXNreXZrY0x6MlVhdWpYcTJ4UHNSVmZx?=
 =?utf-8?B?RWV2U3FSdndsOFZiUVpTQTNxTzAxaHNJQXhRMnpocGdCWTIzcElOamxhTytq?=
 =?utf-8?B?OUQ3bzZQd0JaZkV6QWRvSTVEa3NSWVB4eGhRNFVtdVFManRUOEJDV3RSUFM5?=
 =?utf-8?B?UjdVdVJaZklZRkEvQ2t2U09iVEN0V0xSVEE5OUVPenVzOU5HN2RiYWZxeWF3?=
 =?utf-8?B?b3lXRzRGYnNOaEF3ZGI5K1Q4bXFjYVBYUmRydGx4eHBxWjVRUEpTMkFaNW8y?=
 =?utf-8?B?MlRYMVF6SDlzdmtHc2o3QnBaaTFaUGc3WmNGQ1c4WlFPT2NtSnJ6MmhQdkhD?=
 =?utf-8?B?Q3lzSVJIT3c4anV0VmUwM1FpMlZmVXA1WTJLOUZEdUt1MUswMDV3bDJhVVhF?=
 =?utf-8?B?a21JWTAvdjVuNHBMaXRxY0RoLzNla3pzZmFzZ0VJL1dxSGxTSmNEa2tTRFZp?=
 =?utf-8?B?WTJ1emROM0ZZUkQzaDZzSTFqWndmUnBLaDhlYTY0Z3puVEMrOVUxVVdHVnc1?=
 =?utf-8?B?ZnVyVU9aTjdDNG5KRUgrRW5JVENuWG5udFBYWVRMcEVBYVB1ajZueFNqdGZ1?=
 =?utf-8?B?RnBqQkVLMUI4cFBDcHdCTjgwYWNTQTFIb0xhR2lTRDc2ZWpsK2JQU3dIVFFt?=
 =?utf-8?B?ZjRtUzlhcHp0NEx1QlptQUMzaWZ0eTNyenZMblNSdzZnMkJsNXRPMmErWU9J?=
 =?utf-8?B?amtSUTcxUXdTMXdtaWJaTGM3ZkViemdodVBOdDh1TVdvR3dtMkR1ajNGTUNT?=
 =?utf-8?B?OUtTWmdFMFBZakNrRU1nWE9jN0txYk1RSUZZMDBhTXI0bkx1a1lWREpiKzdF?=
 =?utf-8?B?TXpwQXFvNTQ5SEs5ZlVqSlVOU3M0WTRzbVplNC9iYk82RFIvMFhaZUtNWXFX?=
 =?utf-8?Q?JqbXGe6+qHcSzA8U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac25f8a-e6ce-4bb4-1b16-08de89b388f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:42:21.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPyiJh7KU2pHP8PKGfocYgDm64TaZhLMrx4QfbARtKM2Ctzqe1fvvtesP4kp8CIKnRRKw8Y6J+q4YWEPEelAq8l9uN1rFoqHr56srA/gwnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7383
X-purgate-ID: tlsNG-4011c0/1774363347-CCBC9900-518A2D2A/0/0
X-purgate-type: clean
X-purgate-size: 5210
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5440230A5B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 8:31 PM, Andrew Cooper wrote:
> On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
>> With lazy FPU removed, fpu_initialised and fpu_dirty are always set to
>> true in vcpu_restore_fpu() so remove them and adjust the code
>> accordingly.
>>
>> No functional change intended.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>   xen/arch/x86/domctl.c              |  3 +--
>>   xen/arch/x86/hvm/emulate.c         |  6 +-----
>>   xen/arch/x86/hvm/hvm.c             | 15 ++++++---------
>>   xen/arch/x86/hvm/vlapic.c          |  3 ---
>>   xen/arch/x86/i387.c                | 31 ++----------------------------
>>   xen/arch/x86/include/asm/hvm/hvm.h |  1 -
>>   xen/arch/x86/include/asm/xstate.h  | 11 -----------
>>   xen/arch/x86/xstate.c              | 21 +++++---------------
>>   xen/common/domain.c                |  2 --
>>   xen/include/xen/sched.h            |  4 ----
>>   10 files changed, 15 insertions(+), 82 deletions(-)
>>
>> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
>> index 942f41c584d4..d9b08182ac1d 100644
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -1409,8 +1409,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>           c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
>>       else
>>           c(flags = 0);
>> -    if ( v->fpu_initialised )
>> -        c(flags |= VGCF_i387_valid);
>> +    c(flags |= VGCF_i387_valid);
> 
> This is an API/ABI change.  Previously, creating a vCPU and instantly
> getting state will hand back a record with !VGCF_i387_valid.
> 
> It's fine - I've done a bunch of API/ABI changes in the FRED work, but
> it at least needs calling out in the commit message.
> 
> We have had a lot of cases where calling arch_{get,set}_info_guest()
> without an intervening __context_switch() would lead to subtle
> differences.  Generally I've been moving in the direction of
> architectural behaviour and not worrying about API/ABI changes which
> would occur naturally from running the vCPU.
> 
> That said, I think d1895441b3bad (2007) was the removal of the final
> consumer of VGCF_i387_valid in Xen.  We don't even have a conditional
> reset of state based on it's absence, and of course it's documented in
> the usual place, so it's really unclear what the purpose of this flag
> ever was. [edit, see below]
> 
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 79697487ba90..885f5d304b2f 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -289,10 +288,8 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
>>           hvm_vcpu_down(target);
>>           domain_lock(target->domain);
>>           /* Reset necessary VCPU state. This does not include FPU state. */
>> -        fpu_initialised = target->fpu_initialised;
>>           rc = vcpu_reset(target);
>>           ASSERT(!rc);
>> -        target->fpu_initialised = fpu_initialised;
>>           vlapic_do_init(vcpu_vlapic(target));
> 
> This whole code block irks me.  x86 has two architectural events, #RESET
> and #INIT which are well defined, and this is using the former to mean
> the latter.
> 
> We are going to need to fix this, and it's going to be some fairly
> invasive renaming, but the result will be better. [edit, see below]
> 
>> diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
>> index 88018397b1ad..5e893a2aab94 100644
>> --- a/xen/arch/x86/i387.c
>> +++ b/xen/arch/x86/i387.c
>> @@ -265,7 +240,6 @@ void vcpu_reset_fpu(struct vcpu *v)
>>   {
>>       struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
>>   
>> -    v->fpu_initialised = false;
>>       *xsave_area = (struct xsave_struct) {
>>           .xsave_hdr.xstate_bv = X86_XCR0_X87,
>>       };
>> @@ -282,7 +256,6 @@ void vcpu_setup_fpu(struct vcpu *v, const void *data)
>>   {
>>       struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
>>   
>> -    v->fpu_initialised = true;
>>       *xsave_area = (struct xsave_struct) {
>>           .fpu_sse = *(const fpusse_t*)data,
>>           .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
> 
> 
> Hmm, looking at the callers of these two, we find that Xen has
> VGCF_I387_VALID too, and does have a consumer of this flag.  (This needs
> deleting for sanity reasons.)
> 
> It also means that this patch does introduce a bug here.  Calling
> arch_get_info_guest() prior to scheduling will hand back a block of all
> 0's, claiming it to be valid.
> 
> We need to arrange for vcpu_reset_fpu() to be called during vCPU
> construction (i.e. so we've never got a bad FPU state), before this
> patch will be safe.
> 

I think there is a similar pre-existing bug with eager-fpu. With
eager-fpu, vcpu_restore_fpu_nonlazy() will always mark the FPU as
initialized so the vCPU may be created and then context switched in
without having either vcpu_reset_fpu() or vcpu_setup_fpu() called on it.
At that point, arch_get_info_guest() would similarly return a block of
all 0's claiming it to be valid.

In any case, calling vcpu_reset_fpu() earlier would fix both issues.

Ross

