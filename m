Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJK2HN9SA2pq4gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:18:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D562C524864
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307243.1578933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpoC-0005SK-Sa; Tue, 12 May 2026 16:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307243.1578933; Tue, 12 May 2026 16:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpoC-0005PR-PC; Tue, 12 May 2026 16:18:12 +0000
Received: by outflank-mailman (input) for mailman id 1307243;
 Tue, 12 May 2026 16:18:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMpoB-0005PL-GU
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:18:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpoA-00F7TR-IY
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 18:18:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0352c1-bab6-0a2a0a5309dd-0a2a4508ac3e-2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:18:10 +0200
Received: from [40.107.209.34]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0352c0-63b5-0a2a45080019-286bd122d6be-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:18:10 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7577.namprd03.prod.outlook.com (2603:10b6:610:23e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:18:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:18:06 +0000
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
 b=qGPjab/Rz2zVYq+7Z91HakEqEVgphH+UvgKgIa7FZbGz8ZQ4XkhmTU8mSLhcwiH/N6QF9gFR0laeh/mYJe/vZgNMLijnz0w3Jh7AjafYTlmKXUiccwPZqmlXA34/vaFihJsi/1LWL4KCSwWL8zRJq30CdpwkuLLNpBckxw1elpvzrNX4/gN96aVdq3mo3gD6uTMk0SIsxQK8g2tkocc509j70Scl/63o6TtEaL5YKhsMhPF7984WQzzR2bMlxFeytzhgxDYGsDLcAIlrqxf1BEPNKubK2fCGIVMiPKINS7iKf6Lnvv+SwMtKyBiZPtdSNhzFDsI756PvMls5Ca7hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ih+fpdpzU1+Jw4x3igq9L9Z0UrwTgTSxfu5oNUK11xQ=;
 b=EEXzVrxPS2wkHFBrD0Rf/OLDb57mDKoLxtDt4rad/k0mIFOSIpO/XsLgTQ+XN8MOO2QiCTptQwPTHNqktGidq9kFr4GEgXa4fLeJjWAwKLOnZShGrdhqk/cHKKRhWEdZbXupQ68wE3eY69e7v80mUdUGYyV0tyx/fdwm+w1sRREmmspA/rINNA2ocAn59SpEyF1QcHeFQI7KDw3Zca4JepBSDXNKM49QY8VuCAVHy+Ia5+XxjIl61WRpN46+xUEzs8KeG3GwyGYdItHyNp/f/cYYerHGG0Y31CqMYffJ6WCLIF0bDEM+KGi1fRkdZAObNBgqrzEWx1PBOFtaOVlNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ih+fpdpzU1+Jw4x3igq9L9Z0UrwTgTSxfu5oNUK11xQ=;
 b=OHwTbHAwrF3R4L9NzmB6Lespv+aBbo7Oj2zQnPa6bvdmyuS7x9qMmuSl7jglnL4qsYWLLfUSsY3s+SjDGUBSSnhBP2wutu2rnyAThnIPd0w7DiQQYTOmBLfq2Sth0XpIdWZJ/CrfWa1W8K+K5CFE0DCRL2XbV91sGK+KbJ5RpyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f5a935dd-2b8b-4bd1-a43f-bff0de11ee53@citrix.com>
Date: Tue, 12 May 2026 17:18:03 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair: Restrict where eclair jobs are
 auto-started
To: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <1778602049.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1778602049.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c435e95-4f35-4761-19a7-08deb0420d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JhqxArNttBXiDSphXis+DWk7cFyNOm5beBVT2OJ6Ksx8YwOLNOAhfQFO22+zHIP6H8FOUxHNzTlWiM2klGreonrlAWyAEmg/6aJvLaBNsUSXBanVGi1ifsSKk//DDm1ffms+yGjrQU1P7nCRx/Lnu5/XSZ/ngBp0ajhFvk+Mm2jC0kQ2vp3ERQy5XdV30ov6R6o3vFDtUU8PY3Ds4hV69r9h/mTBm31Dy+I4HKWmqcB+SnMFKTcRKSA4qxslHoNHum4QLjqP4/ct6jCH/XMwx9G1BcQ/A8UEm2QRkkFbw9Gm7CPIeVZapIozQ2nfiHpwcG5sSy23mzSBroPwpfRbqzIHb6jby29FBhMIwO55wq3kdWLJ94i0BB8Tg5cINSnjTnFSNmcBA6m2XU/XOFTxn+ez6UIK3Fql/FTGkYMV0xcQtXyJzjHLZVdXiJI0YmLY59pVGRkusJqc+nUKS0RGDrMV/xb498/MiqLPAsOgDuOxYuPs/tyGZc3YGAybGM3tVd3UJ0fMtIHhodPSbz82tM1MB/H+YvHUX8FPxcDvj2XOBT2RfLj7kfKssJC3y1zZUVX5ildB4a4X0WuG7EPEMw3OTtgviHjH84Rny0pMqo6yVy4R7iM0ljFUMdSq9C4gbQhUzviHCl4sxzZN3my7pOEMj5lDUQ7DJBfkYD2lYunQU810+HESG06Qz4QbZaAm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXFLTDJQMGJoZUU5UUpUQXhEbUtiTmRVZGR1VnJMdHFsOHM3NnRLTmQzcGNs?=
 =?utf-8?B?MTZuSThIdW43TVFkemhVelI5ZC9oeUVCZFY1c0RjeE9JNHZ4a1BlUFA0Szhp?=
 =?utf-8?B?N2s2R0U2V3BHRGlId1lvWjZhUXAwem90aE5XN1NIdlJLZE1naE1RRnBMSUcx?=
 =?utf-8?B?RGFvVHBSTVc5cDRWK0R1TVB6Uy91RE96Z0N0bzh0bHNvSm5sNU5Vb0JiZjdv?=
 =?utf-8?B?VktOcUVYTFd4cHFCdHNGYlJVM1J4cVQ2cERmbDR2L0JNMDUvaUVicHdFQTRF?=
 =?utf-8?B?b2VyUk1aK0U3N1FOSlp5RW5yU0tpNkdLdTNhckhmZnZDdUlwclZLTmh3TGhB?=
 =?utf-8?B?QmhvRUhHWkkybnFTQ1VOY05MUVF3WXhMUFR5L09JM04reEk2Ri9sNzIzbmMw?=
 =?utf-8?B?VGhiN3pHci9oSVoweHp0VlpFaXhSd2MvaHVhcjdXVUU0ZytTRy9PdnNPUUQr?=
 =?utf-8?B?dEZjWWtzWUJSMzZiRE5pTEVmTERSbEZHZHRpNis4b3AxelJRVmRyZHF1NWJP?=
 =?utf-8?B?aVB4SEZycUpvMXRBajZtby9XMzZyQWxWRkNUc0tNYUpVdE84ODU3dXBobFAv?=
 =?utf-8?B?UE5OeWZZT1lJOFkwRlRJSnpPSmU4clhkeFZIUFFiWFJHc1VyQ0c4dTNnQ1NF?=
 =?utf-8?B?ci9kUlhoSjJxYTdEVmw5SlQvV20xWmk3eUVGbTc4cklpb092THBHUU1RKy85?=
 =?utf-8?B?M0RPdHVYdlg0aGxBR0RzZDdJcWdPak1Sc2RMTzE5M1JjS1lHMUlXTDRiSm5W?=
 =?utf-8?B?eW45Mm56Y282SE9wS0lFbStGbzRTNXk5VzF6RmZyOTFIZ1k0SzRYY3pkRUtu?=
 =?utf-8?B?dFZheG1tKzBLWUJMRk9XSEVWS0dhRHZ2VEZybEIxOGRzUThrczh1cG94VVQ1?=
 =?utf-8?B?VFByOVdUQnRVL2F3QzdRODNQNWI4OERMOHFZMzN3WElweXpqeHhqVUNhcThn?=
 =?utf-8?B?VHIvWXQrZHAxMzZNa1o3MSt2K2ZqM0NXZjd2WE5aclVicnRBeDFDaUF0S2Vh?=
 =?utf-8?B?ME9DandYSUhkbkpaMklTZTZxZ3FSdTZxQmluVmphdGo1NUhwTktUTGNjU0V0?=
 =?utf-8?B?cThQSnRZNTBLZ25YU3JJTzVoYVdsWmNxQ3pPS29CS1NvMktmTmtNdWROMnhI?=
 =?utf-8?B?VEo1VVJQV0t6bVlKM1poc3BCR2w0Sy9MdG41M0d0TGtYbG1KQXlrU3BHcHQz?=
 =?utf-8?B?OG5wNlVzLzVpVVhBbk80SEd2bW9xeElGRTRqRUg0NEZMWk5SZGxCQjV4VTRH?=
 =?utf-8?B?N0k0WUFGejVadHZjOWRTSUpBY1NmMjI4b0tKSWg5MWVuODR4MlNhUVA0azhM?=
 =?utf-8?B?VlR0YStSU0N5VDFCaFdBQ2prMENSVVB4Y25OeW1Vb2t6NkcvZFN5VWxDUkdh?=
 =?utf-8?B?Ry9oSFh6dXVLK0ovd1lmRXowaE9weTA4VzdGQS8yejE0K3d2aXp3RFJ5S24y?=
 =?utf-8?B?V3ZyOHpySkd1ODFQU2dwSU5lWlM2bmwzdlJNdjBkNEg3dGZPc0ZhaE5RT1pa?=
 =?utf-8?B?ZzYyVTVaaFRla3NGdllZa2szMFNzYmNUNVZZK1IxL1FEOWRHM0FUYkk0UE1v?=
 =?utf-8?B?cmU4L0ZBKzU4dTgyTEVlSzI2OW16b3RxdHIvU2I2TVdkRlNIMlQ2WWRnakgv?=
 =?utf-8?B?MTJnRGhIem1LSjlFTzhPVUtFQjZESVp6RTFoaTlVT3VmcU5YWEhoVldLWU9t?=
 =?utf-8?B?UEdDTENnTWxxUk4wYzROb3JuNFY0RjhyYVNXTGlYRFptSmRUTDRhdUhsNmtZ?=
 =?utf-8?B?VE1PMWg1U2xuUXF5ZXJ0OVljaUlZY1JpSitTS1lKczM2V080bFJIRUc5YUlm?=
 =?utf-8?B?dWhXOHNyc0w2OFZtOTlRSDAxSjlMK3pyK0E4QUxYQTFScGJaajVEVit6b3pR?=
 =?utf-8?B?dWtRYXJ0bHh2M2I5eXM3eUdtSTZldUZRMXZIdzFBS2ZQSVpIRDdIREQ5OHMw?=
 =?utf-8?B?cFZha0xrZUtWekR6V2dmWDVwanp3QTVPTGVDNkF1bXp5dmJjT2xzczZQdkJh?=
 =?utf-8?B?bW14MGNRT1BSbDFuSUdvRGhRNFo1T2ZMKzRWRGl3MTJtc3RzbTcza2QxNEZp?=
 =?utf-8?B?RWkzMENoRGIxOCtLMDNLb2cxSWJEQXpCTi9DTkFORE9uL3ZxU1lTNk1kVmJh?=
 =?utf-8?B?ZjJqbVdHcUtZWFkwaHBFVTh6dmtvMGtQdjFob3dYejMxa1pwQUVtc3Y5ejg4?=
 =?utf-8?B?YVNDRGo0UUhhcVZrMlRvL2RQSlBBNTFtSWx0RHVjTXVsRDNhMWJxdEZJM3VT?=
 =?utf-8?B?RUFvcUtMa1lqRzFZWDFmL0RJZ05iOVY0Ui9Rb1k2ZmlHd3Q2bXBlbE9ITzhS?=
 =?utf-8?B?UFY5SXdOc0tTeDFKdlBvY2JGTEVmS0xHL01SVFFKb0NWUWZKM1ZnQkMvTFRi?=
 =?utf-8?Q?nThBzfXVFvNJm7rE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c435e95-4f35-4761-19a7-08deb0420d18
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:18:06.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5gJXo49AzBVb8EkqYfa/nITipPIq64XlKh3jbQT6DC0spu1WwbmnT4SIGX//9N/LGPmJ3RnUMxjv0mXJdq9KlP7lqbBef5elSBN8NmLrkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7577
X-purgate-ID: tlsNG-c1860d/1778602690-B5D6BDB1-60E762D6/0/0
X-purgate-type: clean
X-purgate-size: 326
X-Rspamd-Queue-Id: D562C524864
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 12/05/2026 5:07 pm, Anthony PERARD wrote:
> This will prevent eclair jobs from been started automatically
> everywhere but in the main push repo, but still have the option to
> start a jobs manually.
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

