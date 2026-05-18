Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDxyMBROC2o7FQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 19:36:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB1571AE0
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 19:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312181.1582348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP1sl-0004MY-Nx; Mon, 18 May 2026 17:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312181.1582348; Mon, 18 May 2026 17:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP1sl-0004Jx-KQ; Mon, 18 May 2026 17:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1312181;
 Mon, 18 May 2026 17:35:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wP1sj-0004Jq-Gn
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:35:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP1si-00435A-Ap
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 19:35:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0b4deb-2eae-0a2a0a5409dd-0a2a450c97fe-46
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 19:35:56 +0200
Received: from [52.101.57.59]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0b4dfa-62f1-0a2a450c0019-3465393b65df-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 19:35:55 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5881.namprd03.prod.outlook.com (2603:10b6:806:11d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 17:35:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 17:35:51 +0000
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
 b=DhwJeJX732cqNiiMNFydYFznN24c8TPZwn+axWo8K/NH7CGicJfIPhifQJQkIuLkZc3LquwKqXzLxnRXCWHR6bNfAc38FCqbaNQxGLfdIGPMJrd2JxvWA0rQSFqwzGaor+PYY3tW/S+swL31YsYPyW4D684OeXwF6jtLoQfw2mKCxgwRQlmMrnWLbvHOYu8HZRFNN2kN77GuRwbVhIaefVKmuyhg8mtTj/lccbeykQ4+R7G5rOpAHl92j4UKBV5OXRSfT0V4eus8hSgZNN3Vq5v8AWvPsG1IZDo+U3IH3Uc6SXTcOSM9+6eBT0aQpSH3Iz1+4cxP4jQY55h/BSWA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3V/3xqU8rvEI4kDqvuV4q+H2XEtjmhTKcs+k/WkhGM=;
 b=UxLxa7qxJEkL7L/+3Ua1fQb7s4oiDqSGFUFFyt6b6FwFyKmQG8Krfxu3tU25ufKZn8L9jg+I3VnYzWjJbE9KaaoEPK9BOb8a/CWG8dMbSttopzvoXp3wB66WR9g3rOo5ngYAC8pvoyY55gTDNL9r25GeA25Gu51JlXjapsIvdPUXVLAQ8NcIX4hCUbvTfbXyCvvquD20aqmAZu//HtHIzOksX7KyRad2Yp1yAXSE+rq/ZSgNb68DHsJT7ROyljjjh+E75ilJXVzegZT4Y5tle1UQ2h0ddrJKhxD1QtTCChTlAxiu/fI2RG3SIro2K9d5q2O9VlHfWqZTyydLuCObIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3V/3xqU8rvEI4kDqvuV4q+H2XEtjmhTKcs+k/WkhGM=;
 b=Rg7OFzs/b/XDnBYG8bY3ewgL00Pz4O7DBrUdaMKWVMqByMRR1AKNTnZ6eyAhS6CztR0Y4fjkfv1ZJYJLJA8glNtxg7seNJ8CkV/3TdfoDVeDGTJJN9J5G1HlZM6f8sRVhID7RIptiQXe7ML409KborbQKMfubLwwQbSf2Igzk1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7ac53569-acca-44f7-a129-99b5dcb97500@citrix.com>
Date: Mon, 18 May 2026 18:35:48 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 5/5] RFC: pci: Migrate pci_mmcfg_{read,write} to pci.c
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117765.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779117765.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0331.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc2d8a6-5837-471e-da9e-08deb503e7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|3023799003|4143699003|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5YW3a/RqrBVC9UIGwVXwzEYl7l7YnFLyOmVakbiw5S3ey4fVrQvEHovh8kqiQ6E9XzbCjfw456yGbFRsLeQXqFLD+HKtSFwyhokK8IFgQJOYrnU5mgkPTJCndHnAw/WVVeXOOOvcYEBPWkUHFv9gqrvbwZ7uyC0UxUEdgTIz0N4kt1mGoDVpbEIWMgJ+gHq0kHZC9207j6efoxx2J9T+e5pxsD/N3Qm523zohTCTdI2sPWCNirQM5heCtJqwTmweqHKsJv7hanDfXxYFXaqbrmBHQmPTtDpLrwUdFYVCsya2qgVAbv9LOx2aRAAt4S7rKPpZ1faQc+QmqII30pJMmIYA/PppWjNXZbWKiIpoNnoqN5KSr5ACM7hJg/4Bt3E5iYJinLURqz4U4tPEqj4kufemv31W84H2aRPof4fsFAcJD3m3Z1hAb+iyfJcsZskn/MmF9jZ0uOaEvtXg1dl7kD9pE/L0JBbYIl1HwmPn1LsEkDNpD4ZVaUc5cGVnmz6TJsqN8YdMEpukPYgACcvQSfgYvpzvIujuO9xPx6xd1Dj3FLfIookUhgq3ErjyXAT4sKMyyWFIWWaXOndc5QMYfIXpzwpXdmj5Yx+XiH+kFsOKBp9FpcoLzubwZ4R9I17pLmg9ax72LhQKiPH9wvCq3HshpFY/VvGb3RDxKo82MUXoqc00j/vP+WoIo1RnL52blstZLlir6/Rxj2ht70y97Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(4143699003)(11063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWkwaWFZK2gwZHBUYkkrNGJiN2FTanVxa0Y5NEE4dno4Yys0dWJEUDU2Z3Jw?=
 =?utf-8?B?ZTNoM3lxSWZ3czU3MDh1RGEvSHIzU1cwQXZPaWJIVUxhdWhzdDYrUGFyTGdS?=
 =?utf-8?B?QThxdjRIaHZTT0VWaDAzaitkeXZkbjFrNzRVVFViVFFWbEZERmJjdDhvTnJy?=
 =?utf-8?B?Z2p0YXZrWlowckE4MXdNT0FMWE1rOFZqTkNGZDJUYXFlZGdFeW1tcmE5bzFE?=
 =?utf-8?B?T1p6OWVneXorR1JjcDJzaWFvWHUwK0IrY0NpdEFpZFVueFVlSVNVSWxSTFh6?=
 =?utf-8?B?b2dSaDVvZXhpWkRlbktVM0FKaHB4dkR0RG8rcWxBYTY0YThxcUltMmljblVY?=
 =?utf-8?B?SjJtZ3hjVUZVU2hFMkVEOG03SUdUV1djVENzTTJReVVqNkRVNmc0WFcxWm9j?=
 =?utf-8?B?cmJlb3FwTjducVJmTFM2UXhqZG9HOWZNMnc5c0NteUpLUWdRS0lPa1pwSnVm?=
 =?utf-8?B?TVEybHE2TC9idXFQNU50cElINEhQQmNlUEdFaUpFRTJ5Q0ZzQ1F3YkRaYXgr?=
 =?utf-8?B?aVlMT2Q5c0xNNUxPOG8rQzlYUDgvclN6NWVKVisyNXhDaVZvdXhnTkdKWm1Y?=
 =?utf-8?B?T25nTVNiRUo3TzllYXBxNjZWajQwWVdRbXV0cklXOGNoU3oyT0ZrM1ppR2kv?=
 =?utf-8?B?YXRjTnFqOVJJVzBOOUxua0xDYXY0UEhqWVFEWmZOVWIyQlpSaHJKbnB4T2Rk?=
 =?utf-8?B?YmxmTDhYOHZRTXFmNGo3czBaMWtjVWFHdzVRejIwdUJnUlB5N1hPdUk3MEhu?=
 =?utf-8?B?UGxNVTZobVRqWS8wbHBmSU9VbDg2ZkZXVGM3eW1vSHB1bm1iNEFqekhUUUUy?=
 =?utf-8?B?dUF4RU91QmV2aEFjNDNFRjVLLzhTYksyRDNnYkNqUlpxQmhTTzI3aVZXTG4w?=
 =?utf-8?B?TEgyRjFIWTFiZkdQTVFYaWFWQnQvSVNPeUl4ci9RS2QyelJmSHJYbDRRL1Fy?=
 =?utf-8?B?WTF5YTdxd1ZPRlByUExBWHQ1UE1pVi82bUc0eFh4SkdXdjhTSklCL3RzSG9G?=
 =?utf-8?B?MFMvcSsraURVWHRSdjQxVDBrK2krYjVNWjFHNDJTb3hYZXZ5NVcveFJ4R2pP?=
 =?utf-8?B?TzdnZkNBSGluTjFBbUlTUXpPN3d1RnZBOXc4QmZLc3hvRndYQzVqWkpla21N?=
 =?utf-8?B?R3pSdEd4ei9ML21tWlBxUjRwQTlzd2c3bFlTMkpFcGQveVltM1ovVktYWmhT?=
 =?utf-8?B?ZENadWdsZTRKQnRUdFlzSkZwSllCTytFNTYzdkMyMnp0dk1IWHd5aExJQVBu?=
 =?utf-8?B?Z1V6YVFzODQzWEFnVG4yMVR4TDFBbWZMaFhoaDNSdm5pR3JJRTB4OFROYnk4?=
 =?utf-8?B?bU5Za2dZNUZKNm9pNElraHJDTGliRnRaeHpRVjFTZVRxN2EyemtOWTFkQ1pW?=
 =?utf-8?B?QkpvTHg2SFltekwzcno4RlcyTk96MWt0cGV3NmJkd2Fsa2tFblFhV3NkVkNo?=
 =?utf-8?B?NGZxS0FOdnJ3VGdscVRQbzBYcHBZRTdVYjg4cXF5dldmUDJaV0xGM1NDTm5n?=
 =?utf-8?B?UkNLTGdIMTlZRXpPRXVnVXRpRGgwMEdQcDJsUnlrdUNrYkk4cldSZTcxcFdh?=
 =?utf-8?B?eE02TFpUZXIxbnA1ejkzMWZ5T2s1R1oxbUJHdEhld0pUcTI2SDMza1dyVCtK?=
 =?utf-8?B?Nk1Ia3RsbUNFRGhpaTJwL3ZONzE0RjViUjJYc1MyblQzWFJBR0g5akMyaVBY?=
 =?utf-8?B?VC9na0Q2TTNFaW1oaUtjakhhNXBsT1c2MnAvSmFPYnNjQU1YS0dIRCtpSjdy?=
 =?utf-8?B?RERGUm5vVEh0MEIwR0EzOTk4YXhUNkRKTXRpa2RYclh5aFJSc25qcU1PTXlt?=
 =?utf-8?B?d29zNURLaDdrTjVXREZvT3ZVVmZZc08zNEhCRURSeHNsRjYvQnl2RWY4RWJa?=
 =?utf-8?B?T2I1SUFjSmpRMzZ0ckZtSnNkTk5tWDBhemVSRTBrZDQyUk5BNzhJZExDU1JS?=
 =?utf-8?B?VmUzNjQ0eUZzZWtEdzY3dDJ4ZjJyRE5hRVdGUThYbVcyWEh6Rkt1YnhQN0lo?=
 =?utf-8?B?ME1JUEZTZlJHTXBVd28wNER0QUV1MWRDRGkvM0dsVFpvb254VklwdEowbEpy?=
 =?utf-8?B?NnBSNE11dHZmT2Q4eThuNStUM2VCMnR3K0VYRS9leERoZ1IxdG5wUnhlYTMy?=
 =?utf-8?B?YmpwMU9nenF5K3dxQ3pWT1grRDlpdzhhZGU0eHFaQ2JTaG16Vm9NNUkrZlpI?=
 =?utf-8?B?V0ZSWVAzV0cvR3dXLzVrQ3BIY1h1TnhSS2lKbVF5NTJ2S0Q2QjBsaVM2U3hi?=
 =?utf-8?B?L3JKcU9uQldaTU5OWW1paVdLVVhyN2JzbzJnZWhuQVMzcHd3M0NvWEI1aFhI?=
 =?utf-8?B?VnBKSnU0MkhNNUtNSll2TkorUzJuT1RoTkwxVDVrWkNoVE5nYUhGNE1IT3B1?=
 =?utf-8?Q?HMjnotgiOh7cHfo4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc2d8a6-5837-471e-da9e-08deb503e7c6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:35:51.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG0QQktzQmKYDBHVpiCtqF9fBRX+U5N/Vse9fBYeHUTOzywbim5E34rBLWrogyQ+NAuuBD4HW3aGxcRwNyhiJfcZSbP80dyOb/ZLeedPW34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5881
X-purgate-ID: tlsNG-d25034/1779125756-D996DCF5-CF2E183E/0/0
X-purgate-type: clean
X-purgate-size: 10709
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1AAB1571AE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 4:21 pm, Teddy Astie wrote:
> Key parts of MMCFG access bits are in mmconfig_64.c (in particular
> pci_mmcfg_{read,write}()) while PCI configuration primitives (used accross the
> codebase) are in pci.c.
> This leads to situations where the compiler cannot optimize the `switch (len)`
> for MMCFG access for all pci_conf_{read,write}N(), because they are not from
> the same file.
>
> Move the pci_mmcfg_{read,write} in pci.c and hint the compiler to inline these
> functions such that it's more likely that the compiler eliminates the
> `switch (len)``.
>
> Also take the opportunity to migrate to pci_sbdf_t to reduce the parameter count
> and drop many parameter domains checks.
>
> On GCC 16.1, this leads to codegen where pci_conf_{read,write}N() doesn't call
> pci_mmcfg_{read,write}() anymore and directly perform the MMIO RW.
>
> <pci_conf_read32>:
>        55                      push   %rbp
>        48 89 e5                mov    %rsp,%rbp
>        53                      push   %rbx
>        89 f8                   mov    %edi,%eax
>        89 f3                   mov    %esi,%ebx
>        c1 ef 10                shr    $0x10,%edi
>        81 fe ff 00 00 00       cmp    $0xff,%esi
>        77 26                   ja     ffff82d040301fab <pci_conf_read32+0x3a>
>        85 ff                   test   %edi,%edi
>        75 22                   jne    ffff82d040301fab <pci_conf_read32+0x3a>
>        0f b7 f8                movzwl %ax,%edi
>        c1 e7 08                shl    $0x8,%edi
>        83 e3 fc                and    $0xfffffffc,%ebx
>        09 df                   or     %ebx,%edi
>        81 cf 00 00 00 80       or     $0x80000000,%edi
>        ba 04 00 00 00          mov    $0x4,%edx
>        be 00 00 00 00          mov    $0x0,%esi
>        e8 2a 1c 03 00          call   ffff82d040333bd3 <pci_conf_read>
>        eb 22                   jmp    ffff82d040301fcd <pci_conf_read32+0x5c>
>        81 fb ff 0f 00 00       cmp    $0xfff,%ebx
>        77 24                   ja     ffff82d040301fd7 <pci_conf_read32+0x66>
>        0f b6 d0                movzbl %al,%edx
>        0f b6 f4                movzbl %ah,%esi
>        0f b7 ff                movzwl %di,%edi
>        e8 f5 fd ff ff          call   ffff82d040301db6 <pci_dev_base>
>        48 85 c0                test   %rax,%rax
>        74 18                   je     ffff82d040301fde <pci_conf_read32+0x6d>
>        89 db                   mov    %ebx,%ebx
>        48 01 d8                add    %rbx,%rax
>        8b 00                   mov    (%rax),%eax
>        48 8b 5d f8             mov    -0x8(%rbp),%rbx
>        c9                      leave
>        e9 89 12 f0 ff          jmp    ffff82d040203260 <__x86_return_thunk>
>        b8 ff ff ff ff          mov    $0xffffffff,%eax
>        eb ef                   jmp    ffff82d040301fcd <pci_conf_read32+0x5c>
>        b8 ff ff ff ff          mov    $0xffffffff,%eax
>        eb e8                   jmp    ffff82d040301fcd <pci_conf_read32+0x5c>

This is not the whole function because it's missing a pop %rbx.  Also,
right at the bottom here are the -1's from bad error paths (discussed
later).

But, this should be after the ---.  Disassembly this long isn't
interesting to stay in the commit message.


> diff --git a/xen/arch/x86/x86_64/mmconfig_64.c b/xen/arch/x86/x86_64/mmconfig_64.c
> index 940cf6d747..483dff9c2c 100644
> --- a/xen/arch/x86/x86_64/mmconfig_64.c
> +++ b/xen/arch/x86/x86_64/mmconfig_64.c
> @@ -133,6 +46,25 @@ static void __iomem *mcfg_ioremap(const struct acpi_mcfg_allocation *cfg,
>      return (void __iomem *) virt;
>  }
>  
> +char __iomem *pci_mmcfg_base(unsigned int seg, unsigned int *bus)
> +{
> +    struct acpi_mcfg_allocation *cfg;
> +    int cfg_num;
> +
> +    for (cfg_num = 0; cfg_num < pci_mmcfg_config_num; cfg_num++) {
> +        cfg = pci_mmcfg_virt[cfg_num].cfg;
> +        if (cfg->pci_segment == seg &&
> +            (cfg->start_bus_number <= *bus) &&
> +            (cfg->end_bus_number >= *bus)) {
> +            *bus -= cfg->start_bus_number;
> +            return pci_mmcfg_virt[cfg_num].virt;
> +        }
> +    }
> +
> +    /* Fall back to type 0 */
> +    return NULL;
> +}

This is a horrid function.  Accessing and modifying bus like that causes
poor code generation, and by now having this in a separate translation
unit, the optimiser can't fold it into it's single caller and undo the
poor decisions which went into writing this function.

Instead, you want:

void __iomem *pci_mmcfg_base(pci_sbdf_t sbdf)
{
    ...
}

base which takes care of the bus adjustment internally.  This can be
broken out into a separate patch, and take the opportunity to write it
to Xen style.

> diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
> index 8d33429103..c37e3edade 100644
> --- a/xen/arch/x86/x86_64/pci.c
> +++ b/xen/arch/x86/x86_64/pci.c
> @@ -11,13 +11,123 @@
>  #define PCI_CONF_ADDRESS(sbdf, reg) \
>      (0x80000000U | ((sbdf).bdf << 8) | ((reg) & ~3))
>  
> +/*
> + * AMD Fam10h CPUs are buggy, and cannot access MMIO config space
> + * on their northbrige except through the * %eax register. As such, you MUST
> + * NOT use normal IOMEM accesses, you need to only use the magic mmio-config
> + * accessor functions.
> + * In fact just use pci_config_*, nothing else please.

I know you're just copying an existing comment, but it's mostly an
opinion and not terribly helpful in place.

"AMD Fam10h CPUs can only make MMCFG accesses via MOV %eax/%ax/%al",
would be better, except...

... this claim cannot be true.  It's been made since the K8 RevF BKWG
and exists even into the latest PPRs, but that's simply not how
load/store ops work in the pipeline.

It was added to Linux in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3320ad994afb2c44ad34b3b34c3c5cf0da297331
but without adequate justification.  I've made some enquiries.

> + */
> +static inline unsigned char mmio_config_readb(void __iomem *pos)
> +{
> +    u8 val;
> +    asm volatile("movb (%1),%%al" : "=a" (val) : "r" (pos));
> +    return val;
> +}

These need corrections, either in this patch or a followup.

Switch to Xen types, and correct the memory operand constraint to be "m"
(*(uint8_t *)ptr).

The Fam10h BKWG states that any memory encoding is acceptable, and this
allows the optimiser more flexibility (which will get used).

> +
> +static inline unsigned short mmio_config_readw(void __iomem *pos)
> +{
> +    u16 val;
> +    asm volatile("movw (%1),%%ax" : "=a" (val) : "r" (pos));
> +    return val;
> +}
> +
> +static inline unsigned int mmio_config_readl(void __iomem *pos)
> +{
> +    u32 val;
> +    asm volatile("movl (%1),%%eax" : "=a" (val) : "r" (pos));
> +    return val;
> +}
> +
> +static inline void mmio_config_writeb(void __iomem *pos, u8 val)
> +{
> +    asm volatile("movb %%al,(%1)" :: "a" (val), "r" (pos) : "memory");
> +}
> +
> +static inline void mmio_config_writew(void __iomem *pos, u16 val)
> +{
> +    asm volatile("movw %%ax,(%1)" :: "a" (val), "r" (pos) : "memory");
> +}
> +
> +static inline void mmio_config_writel(void __iomem *pos, u32 val)
> +{
> +    asm volatile("movl %%eax,(%1)" :: "a" (val), "r" (pos) : "memory");
> +}
> +
> +static char __iomem *pci_dev_base(unsigned int seg, unsigned int bus, unsigned int devfn)
> +{
> +    char __iomem *addr;
> +
> +    addr = pci_mmcfg_base(seg, &bus);
> +    if (!addr)
> +        return NULL;
> +     return addr + ((bus << 20) | (devfn << 12));
> +}
> +
> +static inline
> +int pci_mmcfg_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len, u32 *value)
> +{
> +    char __iomem *addr;
> +
> +    /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
> +    if (unlikely(reg > 4095)) {
> +err:        *value = -1;
> +        return -EINVAL;
> +    }
> +
> +    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
> +    if (!addr)
> +        goto err;
> +
> +    switch (len) {
> +    case 1:
> +        *value = mmio_config_readb(addr + reg);
> +        break;
> +    case 2:
> +        *value = mmio_config_readw(addr + reg);
> +        break;
> +    case 4:
> +        *value = mmio_config_readl(addr + reg);
> +        break;
> +    }
> +
> +    return 0;
> +}

Again, for this patch or a later cleanup, drop the output-by-pointer and
return value directly.  The optimiser is hopefully doing this already
but it also makes the function simpler.

At best, we want ASSERT_UNREACHBLE()'s in the error paths (including no
mapping), and to consistently return -1.  Returning 0 for a bad length
is bogus.

Strictly speaking we also need to check reg & (len - 1) because accesses
must be naturally aligned, but even with ASSERT_UNREACHABLE() and a
failsafe -1, that's still logic emitted and I'm not sure if it's worth
having.  Amongst other things you really need to know that len is 1, 2
or 4 before the alignment check reads correctly.

> +
> +inline int pci_mmcfg_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len, u32 value)
> +{
> +    char __iomem *addr;
> +
> +    /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
> +    if (unlikely(reg > 4095))
> +        return -EINVAL;
> +
> +    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
> +    if (!addr)
> +        return -EINVAL;
> +
> +    switch (len) {
> +    case 1:
> +        mmio_config_writeb(addr + reg, value);
> +        break;
> +    case 2:
> +        mmio_config_writew(addr + reg, value);
> +        break;
> +    case 4:
> +        mmio_config_writel(addr + reg, value);
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
>  uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
>  {
>      uint32_t value;
>  
>      if ( sbdf.seg || reg > 255 )
>      {
> -        pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, &value);
> +        pci_mmcfg_read(sbdf, reg, 1, &value);
>          return value;
>      }

Not for this patch, but we also need to junk the if() condition here and
elsewhere.

We should be using MMCFG unilaterally if it's available; the IO port
pairs require use of a global spinlock, and behind the scenes all the
CPU is doing is translating it back into MMCFG-like accesses.

At this juncture we should probably change it at the start of the 4.23
dev window to give it maximum time to settle before getting into a
release, so probably best to tack it on as a final commit in this series?

~Andrew

