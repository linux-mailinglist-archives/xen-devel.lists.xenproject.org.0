Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM4QEYDgAWptlgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:58:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32BE50F7A5
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306232.1578296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMR93-00065O-6c; Mon, 11 May 2026 13:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306232.1578296; Mon, 11 May 2026 13:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMR93-00063X-3L; Mon, 11 May 2026 13:58:05 +0000
Received: by outflank-mailman (input) for mailman id 1306232;
 Mon, 11 May 2026 13:58:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMR91-00061l-8W
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:58:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMR90-007JqB-Hy
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:58:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01e05d-2eae-0a2a0a5409dd-0a2a4502ab7a-42
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:58:02 +0200
Received: from [40.93.201.26]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01e067-af86-0a2a45020019-285dc91a1962-4
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:58:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DSWPR03MB989106.namprd03.prod.outlook.com (2603:10b6:8:35e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:57:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:57:58 +0000
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
 b=izIJswXDZC4F9ujhfjaLIcf+FWSsaozoUgqOhRL7+LBfqPABtmlvJlsL+0q32IGAmtc97dnAoDJv/M1iUjDRmDWaPu0PoCbuzu+K6mnvS3Bf+7BkKFCS4+z/OTnnh50kZD+TVZRYWLw9i8mOk/GEGtjezEWFq/Jd1/3VERy7O1l/Ny01j1Hl4hrjT/D6dDiYEwZ706GNXN2KKJL0Damqj+Q4aE+Hb51eEU5tWTpgfM6vz9a7HWpQRCNdcHZmNKaGwHMyiwZJoo5GInjL2zRflvgQoLcaRBJVYzlPnTokBjaC4iLTryPAvk3hIJmG5uenhBj8X6wO6ILMer5SCClwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tc/KKf2zGsQej0e4TCm+LkqvwBRiX1vXgUPwcE4RYAM=;
 b=vyL9M8by+fBbYtBGPsFDrMWpgOMamAsTLqxVCyUqurJKhrMX//qQV4MVyvE86MRMbR5RaLur6oUtn3YxwPb0zRRd1ZoKCDKnoIK7E8o9KVVmjzdSwkRv3QB2cUYWGdKu8DVVpExRSJkn8fxFoJdxjCGyRAHFWVHiImAMv4CcoIoMhb8NWtMTOjKfjOU69O9MLPFaH2JJX+54xtcev8dsZCfGmWGQXh8rrMq7otL9zI+s/bshsmbcrgz2fm+bliXV5SiUN83K+Sew3PhA42GOs/9cNx4I2keS5aHF3+t1PjI6DncXoj9a7vlTPvnnrpemsn5rxRvg6OqYfke+MfoWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tc/KKf2zGsQej0e4TCm+LkqvwBRiX1vXgUPwcE4RYAM=;
 b=eXmttEcXwuLXs70rGvFF/RpMN4OU8OZbkHrWi1onxtD5jTW4H9oT/jvlCWZ8NciK+UhA4N4SYsWXvMrHd1wrABAc6mVmRKuW1x3HFO9qAJf+3Jf/+Kjv4YAfvBdHSHyDFKnz746nIHdwhZZQ7QVgYgC/PFbzBqtg+fyS77+Wk/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d3f3e745-6d24-4e41-b8bb-de7145a3b2ea@citrix.com>
Date: Mon, 11 May 2026 14:57:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Code freeze for 4.22 started on May 11, 2026
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
 <2a6117e6-e458-4818-9c22-0c356982eb59@suse.com>
 <58f80bf6-b9e0-42b8-9f84-831a1c546768@gmail.com>
 <4b0f55a1-1e9b-4ce1-b6b6-29b868d57e25@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4b0f55a1-1e9b-4ce1-b6b6-29b868d57e25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0038.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DSWPR03MB989106:EE_
X-MS-Office365-Filtering-Correlation-Id: 953f6014-50ae-40e9-15c0-08deaf654e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sKDcSCabxj+DTFO+fLZb+xanjbEOW2QI9RNPh07NDfhIssF1PitgUZrN7nkKFYgCm48XYJaSb0REe6k/N9sScHWDthVz+jhNFSmVjLkYsO/QK02PQAImFZUr02eXaZIPanPYZvcQw6S6CjHvyDGTgsjTQR82BZP3XyXtjXUum8hsEQ4kKgQEGHQwFxMr1wObANqId/jp7g+bw+pzQLFNC+d064BmEBFlWCqta0gF2lh8IhuCKsthJu6GF38pDcCE6rQbUJT4u6xUGGvEfOjr9qjeQu/qqEuEI6E7ldviKX7V2ZOtrHgPCIiwZ1h4Jf4aed2hLLB4p9C5Jm5mZSdSreIA23S2Afn8mq+xm6VNkg/jhEgNUJjKn4OiVCyvFsecVQDIM8bq0gKKI1ToNLu6yMtiO+wspCVjqwua1xzxvZu43HlescLlRN4eUHbGjTECETMKBiamZiafmykuYcT/1NboS1EGdJCdZSBhPY0qJdmE6E9UUL5Vm3k8BQh1zkBTpwOd60N+gcFqIbn3L314hJqp7UjDxJg/apgb2AxgmF6B5pC4nQ9qtU/d66WmlJ95A3r7SMZQ+76xHWNG9ofcVF9oRmzvUJBCBHpRpnPZWXWsuR/f18xI3nW3SMncV0nMptAmbW6Oq/8lyrgUHFV89rGBMxxuBT8ysnUL85UubYSOCyDBDMa5I0mx9Zakml3C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0x4UnJ2R2Z0S0FRWFZJZDY4cVF4Y3htZVFubjlXRzZ6YUFNTWZYSlIvdEJw?=
 =?utf-8?B?ZXZJRmRQRDVJdXJ2TEp5dmRTeXZQTXFkeUVIZXhpMHhoS09RazdvKzh6OVBC?=
 =?utf-8?B?TTFrRFhJdWZQNnlaMmNHdWR1cnZ0QWF1RnpXbTNvREFpRlp2L1RGZW9NUTJp?=
 =?utf-8?B?YndXalVJWXpuU2d1dFc4U2phTnA2ck1ZNUpSMHFiUTR4SkhIMGw2Z21ySEh3?=
 =?utf-8?B?aGN5clpIQzRnT21xbzJTbUZZVUxpZFB3REhFdGNWSGdidDl6b2pSLzhTaDF3?=
 =?utf-8?B?a01uMUdETnpJRzV5OENmVmJLOS9COWRJVk9ZTmNwR1VnNTA0cFhqSWVHSXQ2?=
 =?utf-8?B?UG45SjRqUGgrTmc4M1hrRzlQRlZsdHMwQUhJcjFiZVJPWVhIMmlJNzZJQW03?=
 =?utf-8?B?TlJxaFAvdGNYbWJHMkpaTU10NWFOd3R5bUxhenJmNVZDQ0ZsSjd0WTdWWldw?=
 =?utf-8?B?WFl3RFlWWFFnZWxEMWVrb1p0disxSG12YS9ETmExZnZqM2hTdCtPL2tNcHFF?=
 =?utf-8?B?ZnIrQUpOaFJtbWZ1OWoxL2NXc0w3QzNGS1YzdkNsbmtYMVNUb2xyR0hxam5y?=
 =?utf-8?B?RzJhK2huWUdPdkplOVF5WjBpTmVabk1kQm42VmNwZS9adExrVU5zYUpseGRE?=
 =?utf-8?B?NDdXOXVYVWJIOEh2TzRKaloxOVZ3a2F3NThvWTIyczZ3REU5ZlRkM1dpbkpn?=
 =?utf-8?B?N2dHSm5RQjdUVUllV3l1OVMxekUxTkE4amg2U2dXRTViMFdLKzZscjVUUGdN?=
 =?utf-8?B?ZmRDNHRKaDFVOU9PVzduVnFJcWUwNDZIQUdqV3BtRmU3NUEvSThwUkdsK1c3?=
 =?utf-8?B?c1BOSVRtSzkzTzdINnF5VkxnVldLQzJFc2liakd6elRSQVEvOG0xNkNTT0d1?=
 =?utf-8?B?WEJUK29mSUhqaWNPc1dDRnd4aXhKSHFvSGlIUlREd3djREJqUVg3dy9LS0tT?=
 =?utf-8?B?Kzc3YmErdGhOb2xiQ2JHT2IzS1dUcjIreDgzMzB2aXorNUxqRzJiVlN3dzMx?=
 =?utf-8?B?Zkx4OHhjZmJzSFdxbXdoY0FUTWpwejI1L3J1bmFvb1M0NTEwTDd0YnRRNWwy?=
 =?utf-8?B?TnRCMDdSc2t2OHpFOVBSSndkS1UrOVAzSVc1aXY3djRieDF0clAydVYzOHVF?=
 =?utf-8?B?R3pLZTU1VTlyT3lCeE0vUU9BSU4rMlNXcitlaFJsQVFFUVhodE41bXErSTha?=
 =?utf-8?B?dVYrdnZ4TTZaMGhabzdVbHZabFByWUI1RWQwU2toZ0xFVWRoNDEwUEYzQzJi?=
 =?utf-8?B?N09qSTBhTGFKZHFJTEp6bGlkZHBtZXRkRXI3SlRJNXExckpaQ1dhdWdPMEpT?=
 =?utf-8?B?NFo3YmtIL0gwdUoza05LZjdTd3cydVhENUtlcHVrcnFvQjczM01aSVN5Q1lW?=
 =?utf-8?B?SWZzM1ZhZFdpMUNHUG01dG51SWRuVkRvNEt0MjFPV0x4TUlqWENHblpzZ3dn?=
 =?utf-8?B?aUNrOTVZTm1yT2VGcldYZGNDdUxaZmpZVVNwcmRFU014Zjljd2lNaS9FWnBD?=
 =?utf-8?B?WmlXaWRoa1pTeTFSamZyeWhHZjU4OEYzdHBmSEN1RTNEOHdJaGpuMFZQUVVq?=
 =?utf-8?B?RHFZUndSUFVDajVhenRHdVAwcTA5OTVhNUlvbTVJVldNNlA2ZklVaFVGSWZs?=
 =?utf-8?B?R2N1bjAyaFNMNG8zQ1VNMDUrc05MdS9WOFNPN0pMdEhVUWt3SWQ3N1dOZnJk?=
 =?utf-8?B?L1BvZEtQb1ZzNEt0YlVlbEhtcDRtdXV0SDg3OFpjM2JtOEZEKzRSY1JaamRI?=
 =?utf-8?B?eDNlRDJDQmZmSlA2NHBzRUI3dkVhbWJoc05FYVhJbDdmL3pUYTlUMGRYUzFZ?=
 =?utf-8?B?RUFtMXRudS9JSVBINEF4TDdkb2JKTEc1WDFYT2R5SjdiYXVUaDlkTkVsMHJs?=
 =?utf-8?B?blIxb2F2VTVWeitKSHVVVU1iSGJaMjF2QUpRNnpwci9JREVqbWxzUUR1Q0tn?=
 =?utf-8?B?K3dGbERqZHR5cExFT0dOMmJaVkgvRnZkMllaWEZKTnFIRSt1dVc2MVRQcWs5?=
 =?utf-8?B?OUx2ZkpSVDMwejNORzAzOEZqaUhVbHlNZlE2NG5KQkg3cUpnQU5HVUtpNmJo?=
 =?utf-8?B?ZmtlNmRsOXdBbHZtSXRRV3ZvRUVWK1NseUNQeDRkZ0tCeGM1WnhmRG00cGlV?=
 =?utf-8?B?UXJmNVBieUh6cGtiVXVraTc3S0YxOWJET1U0QmE4akpPQmVMRU0vU3VNYnVO?=
 =?utf-8?B?L2h3MTVSZ2xKNlV3TGFoalh3WFlxNTh5dUcvRnlwaFZFVUZtZFdLMHAyQmMy?=
 =?utf-8?B?c3dZamV5MFVLcCtaQk5EMFB4bTZPZmZiOGp6cmF1eTk0SXdlTW0vZ3ZGalVM?=
 =?utf-8?B?N1psUkZLekJ5cmh0S1l2VERHYmxEQlFDTm5aVDQzMURCRFk3V0dqc2ZPdjVH?=
 =?utf-8?Q?1wODCKT0I/FvPxIk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953f6014-50ae-40e9-15c0-08deaf654e01
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:57:58.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2043MXVdyWjuZqXFNKPgh5NiuKd/gj9y8V335r/fg1hNnYS5wBWixbISPiJXWhS9nlCWeACkM44XQiNS2H5TOOM8/dwm38tRiLS76mIipuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989106
X-purgate-ID: tlsNG-720697/1778507881-A8145161-E93BD2B0/0/0
X-purgate-type: clean
X-purgate-size: 1118
X-Rspamd-Queue-Id: A32BE50F7A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11/05/2026 2:45 pm, Jan Beulich wrote:
> On 11.05.2026 15:34, Oleksii Kurochko wrote:
>> On 5/11/26 11:41 AM, Jan Beulich wrote:
>>> On 11.05.2026 11:35, Oleksii Kurochko wrote:
>>>> I would like to inform you that Code freeze period is started and will
>>>> be until Fri Jun 05, 2026 (+4 weeks from Feature freeze).
>>>>
>>>> Bugfixes may continue to be accepted by maintainers without R-Ack.
>>> Gives me context to ask right away: "x86/mwait-idle: sync up with Linux
>>> 7.0-rc" has had a few small adjustments and hence would want re-posting.
>>> Question is: Does that even make sense at this point, i.e. would you
>>> give it a release-ack despite it not all being bug fixes?
>> I don't see any Fixes: tag in the mentioned patch series and also based 
>> on cover letter it doesn't really clear what this patch series is fixing.
>>
>> Could you please clarify?
> It is "fixing" us lagging behind the Linux driver that ours was cloned
> from. Plus the series was posted well in time.

This is updating/resyncing the mwait_idle driver with Linux.  It is
necessary for new CPUs.

~Andrew

