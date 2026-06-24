Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m3kGBEHzO2rygAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 17:09:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC086BF7F5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 17:09:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=E54l+TXA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345081.1604081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPE5-0000kj-BT; Wed, 24 Jun 2026 15:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345081.1604081; Wed, 24 Jun 2026 15:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPE5-0000iY-7H; Wed, 24 Jun 2026 15:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1345081;
 Wed, 24 Jun 2026 15:09:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wcPE3-0000iS-OD
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:09:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcPE3-00EQyM-52
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 17:09:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bf30a-bab6-0a2a0a5309dd-0a2a4508a482-22
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:09:15 +0200
Received: from [52.101.61.42]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bf319-edec-0a2a45080019-34653d2abc59-4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:09:14 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7758.namprd03.prod.outlook.com (2603:10b6:806:434::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 15:09:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 15:09:11 +0000
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
 b=Zd1YRgmNlsqER1L9DkO31wvq/huYNSmgc5I+G5KC5iNw/OJbFZptTm8l1kUf+tzszLpJHSnCjhqpsUXSI1NuagOnr749nvK8HK2c5LfURDd6I3nmV0fJDwiBU9lDZWtAC5bzaLyjFzrkWAh9jWQuXTX3qhyA5yCaK6Q+HsPyVDltnwJXX1iax7l3YiZHxZQK6tHUHVOv8g3mS++Ivy4U7gxYowoy/Hgvabs3ytPNu/z6X09BJ9a/Bfgh4xF3t57LTdgf57diibtAKie87poRC9300ZGumMBncPRA6dRCqpqPQARMsD8Df/H1S/Ct7r2FbhyiiYJV9HjwsbJI+TtS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86E59rNNtIBjM8Wmc7F3cvyLTuC2UFWwqW/zUH5k9ac=;
 b=RzX9gbe/GkBLoRqRTzTxAwoAGYWwDwSvnojUXa5RBcbeY+DxWMvDDcbgO1fdSzMv9UapMCf/Xhwi61Uz1rHblEFvJ2R0ghgVg0jqXq5Czgk+R4FL8xB3yolj6pnTSAwM3FcXNl5x0lnfWB2KfYvmw9a+3FY3LKdLL7kO9QeUNrp/DrieyPNUZY/n9ygHYFfm1q2Lm3K6w7Dkbr4a7GutHjmfrLW+TqoICulbQY8uewkSQqQTCQZx+pLt2rycKZ3iFLkHNayfAgkmZocgnVcjXHZwVp1fsjd0yEyiiBmCYmsPA8MH1RhZit+E/0/xIGiCDHJJO6+bjq3pl+C0AsXbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86E59rNNtIBjM8Wmc7F3cvyLTuC2UFWwqW/zUH5k9ac=;
 b=E54l+TXAl3hOshb5bwmO3d/+HNPt9e8rCpxA6yDePcoM64WzJ9KAXPL/poSHsKEtZ0wzutFf3/ZK4/duR1BJIMa2kgmy9DoplHmNodEdWNrI2WVAnCC+3ZWaNs7ro13Ai3fs1iLm2AdBrJojWKDZ9I97uDnPuhUKN00/Yu86Xok=
Message-ID: <df2bdff9-6efc-41e0-91c2-f44a44d28871@citrix.com>
Date: Wed, 24 Jun 2026 16:09:07 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
To: Jan Beulich <jbeulich@suse.com>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
 <a7ce9d22-7ab9-4638-8ffd-2ffb9bc55df9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a7ce9d22-7ab9-4638-8ffd-2ffb9bc55df9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 55df6e73-bbcf-4f13-76f8-08ded2028c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4143699003|18002099003|56012099006|22082099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	Q0BWvcj3CcAbjYWpSbPviaWv4/sN5pIE1iBp9jXFRYZDrYhePG5KIAKfjGtELogn5xa3KW1MRh4j5p/Jta6A851q6Df16/DK+k4Ataz20U73A0XzF0R7CjlBT7/AKOB0Bc8LeBd1kwCTjKyM3+fiSyIVx7cZgE0pdjZo+3h0y6YY0Lh8+cm4jKEWALQEdaPw8JpzuxgIUoKb5V0CkvGN2fKHm2BOyK/kEVZk9uGCxgNzzdNI51He6VyxxotFYaf+sjGXZDSQc22Q9MmB2a/aqj8jSR/MfL5zqSWz04QsC342nDZHiCHEL5vyTZwldLADT/osZDCPvtFheN3VmUkV8b6pXp8KgU/+t5J2WCzcSALY5A0UNZjvMxhWkIPCYt/TclIZi+z1pIfNxQgj5/TEWMVwuwtlKMjhUPtJnotf9EztwDXk5cR8wej6YomZfnFVPpguS6aeb04OiLexICBv+d1CsYcE0khPQoMWraYpyk4Te2kYn0JdEQV5tCGmKTj1+xDon3lKZ7aza1LNVVSA/CiyjXSqRYJqGnMZTdPhQ02qXTe7PIBHOoc3zUJvg2Cgui29YVKT/Mbga690NA2mmgfoqmBZgyob5e4s9+VEQYVWbWHoZZy0VPN2eGcGHLuF0kOL/7xvQPJG79B8RUonihN6giN1pkQyKJgJvi5tB5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(18002099003)(56012099006)(22082099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkpYeTBEcENUWmFMM1FIQlNhWkJIbkhmbGpVNTJuSmhrSVNVMXdKUFZBMHI5?=
 =?utf-8?B?VTVtVXh1bE9kWU1qZHRVdGQrWDJlYnFBV2padkNzVWFoQkV5VUJrSmN4SEdP?=
 =?utf-8?B?eGNjYzB3eHVNSWFGanBNQVAvMVpjOUhQbG9qYjd6OVdDejlWclNyU0s2cWxj?=
 =?utf-8?B?MnE3SmZJM2ZVMmxHN2wra0U5RVdoNTg1ZTc0WDNpTHhvcWZrWlVRWnJEeEtF?=
 =?utf-8?B?MW9DV1hnUE1WeitiK012QmdKZm5rbUMwdVZpUHIvcGlpeUF0UFhqTGNuVm5i?=
 =?utf-8?B?dk9IbDJ5SzNSckRiNGdpemFwTFRmMjU1RWMxMUdCVUJjbGUxcGkyU3B3YkFH?=
 =?utf-8?B?YTg3TDBQQ2FJTzQzbjBoTnNUdWlEWXpiVnpnT2tuNXBibHlhOFUrTjNHaFV5?=
 =?utf-8?B?OUhnNTRFTWo2RXhGM0pmeG8yQUxlK0JtTXdKdEgrU282VFRVcW5MQWIvSzJQ?=
 =?utf-8?B?NmpuOFkrRDBqNFR4TmFQeEhJR3h6dElNalRIb1NjWDVPb2pNTWFaK2swNEN6?=
 =?utf-8?B?bjlnaitaMDAyeXRVYVR3cVVDNnNmcWk4cENwUGYrRSszOXl4R3Y0RVdVUnNj?=
 =?utf-8?B?Z2VQMmNNTzBoQUNvdm9lTFFkWHlzTEt1aVFMR3hJZmlkbmlwQU91M2l5bDBa?=
 =?utf-8?B?UFNVQjQ2TGpLKzdRb0c4aVZkQ1NXM0wzTHRqdFhCdk1IeE4zODNvWjh3NGly?=
 =?utf-8?B?Z0JSdU1SREQ0VThyOHoydW1JUkRMcjk3aFJBODgramFFTUkvNTkxL1pQLytX?=
 =?utf-8?B?N0ExaG9OUmJRMjk3eTZEMHN5MTVWV0lhSzZHSUJiWE1Yd2FhSk1XcHhkakRo?=
 =?utf-8?B?VXkvUitXbk51V3kydDEvK0hEdEt3WG81ZUVleThkQVpPOVYydlhlOC9YZ3BY?=
 =?utf-8?B?U2JyMXlEU2dFak9lMGJZWkd6bTZRbVhoVS9KakN6N0F5WjVqV1JUN2k2c01n?=
 =?utf-8?B?blJJd1BsZUhoM1R1Q0hkdks1WXoxMUp5Vm9OU0diOGt5aENia2NpdDlEbVV1?=
 =?utf-8?B?Q0FPVnhGeUpiRVlKNkdJcFFYVDdCWldOSjZyVWRBeC83dkwrY0ZZTEVleVpG?=
 =?utf-8?B?b3dCeVhpNG5qRTBmRHR0SUFlcWdBUWwyRHdCcm9hRFIvU0ZYZWdrWDhta2c4?=
 =?utf-8?B?blNHQ2xJZzBuUkZZZ0V6VEZvUWJnNjE1ZHd0OWFxQnlQK3M0R0ZyZW5kYXFE?=
 =?utf-8?B?WmdETmRZczU1ek1KZTlPVmxPMVBPZ0FZcG1PeWRVYk1ZZDBOYzFlY0t2ZXdU?=
 =?utf-8?B?Vzh3SmJmUGdscmZRWDJwTGczeGgxa0VFNGdIelJRSFdLRDRMa2ozS3krMzZN?=
 =?utf-8?B?d3gzMlFia2JTTWJreFFuMTBKMGtxMU5kUjgwcXJraUZMb0c0SlZ2V3Y2T2VQ?=
 =?utf-8?B?dWY5b2RoQ0VqM2NJRkNtaDJkQW5OU2VVeWFpQzRWWDVkZ3VCd0RpWjRza3Yw?=
 =?utf-8?B?WEUzSWN4aEFJanpOZFcxM1VoNVFCZnZyZml6eHRNdm5FNS9TK1BPZFFLSENF?=
 =?utf-8?B?ejdKMEpJZzVFSWdwaXhvMUxqZDVlSXM1WmRaY21PaFBWQ3cxb3UvMzIrMWVN?=
 =?utf-8?B?VTZOOVMrSEh1b21OYzZiSEpUQVp6QzZnS0FNKzVHNW41VS9QYTJ2VndMbjRh?=
 =?utf-8?B?ekJvUHdMa1pPeDZlalVoaDBjaWVYZmYzT0lya0xQVFRYN2JSMUFLK0s1dEdx?=
 =?utf-8?B?Y0R2dnpyMWwvMTFtTnJwZlpVNHhHK0diSUF1eTVXd09MT1FVbzhNeGM2WEJU?=
 =?utf-8?B?b0JaR3JOSmZCT2NrVVRxL1hXTmc4WjhmS2JXSXFvYWFnTXR0T21oUUl1dmsx?=
 =?utf-8?B?T2I5Q2I2K1g5QktQUUs1cStWNVIxR29LditOVmFUSDJDZ1UySGNSaEY3SGJH?=
 =?utf-8?B?bWVScGNROUVvdzVEbHFtRjRrd2lLSmw3cjc3YkREQk9CTkVkRVJKTm16SVor?=
 =?utf-8?B?bDFoZ0ZTWGpoM0pLM2kyUDJVQ3JDNlF0RHJRTTY0MEdzbTBSTTBMS1U1N2Jx?=
 =?utf-8?B?dDA0WHdUTkt3QU1waXV1Ny9IU2l3Sy9oWG0zcFBtYXQxeUNBSzlVNVhYN2VJ?=
 =?utf-8?B?MnpuWTlpQ2VIdVZHWjRWdnNMNUo3aGMwK1ROTFJNNmxtNkJRU2tINStGYTh6?=
 =?utf-8?B?am9aR3JNMkt3VDFaQjNRYVE2Sjh6TFB2RkY4UXhsdTRxVTY0ZHg4a2Rlc1dt?=
 =?utf-8?B?RlBDSDVjVnptNHFmODI0OWNUM2RqbElwc2RvM1o0Z1llU3RUelQ5WkkzQk03?=
 =?utf-8?B?ZXdDMGNQMXdKT0ZqM0NrMDRxTTRKclE1M1E3b1hUN0tTSGFZRDJHRG1BYlJL?=
 =?utf-8?B?YTlCanhaY2QwRnVCOXhITDBpSkhuaGdCaFhRcU5uNTZza1dwejRLc1h4N1px?=
 =?utf-8?Q?DyG4MsBtEQmMikHM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55df6e73-bbcf-4f13-76f8-08ded2028c14
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 15:09:11.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzriscWk+5gQ4a+QbOGsi6qB3xxffW39QJE7xorilMJAO9XImUMnMum93tykZIjap/AqQR63la65/cLkR7Rj73kMx5Wc9WFdwishEkER+4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7758
X-purgate-ID: tlsNG-c1860d/1782313755-423203FC-E96BF5D9/0/0
X-purgate-type: clean
X-purgate-size: 943
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BC086BF7F5

On 24/06/2026 3:47 pm, Jan Beulich wrote:
> On 24.06.2026 16:23, Andrew Cooper wrote:
>> --- a/xen/arch/x86/x86_64/entry-fred.S
>> +++ b/xen/arch/x86/x86_64/entry-fred.S
>> @@ -20,6 +20,12 @@ FUNC(entry_FRED_R3, 4096)
>>          GET_STACK_END(14)
>>          movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
>>  
>> +        /* NMIs need special handling on return to guest. */
>> +        movzbl  UREGS_ss + 6(%rsp), %eax
>> +        and     $0xf, %eax
>> +        cmp     $X86_ET_NMI, %al
>> +        je      nmi_exit_to_guest
>> +
>>          jmp     test_all_events
> Actually, how about shrinking this to just
>
>         test    %al, %al
>         jnz     nmi_exit_to_guest
>
> by having entry_from_pv() return a boolean?

I considered that, and dismissed it.

It involve changing large chunks of traps.c (simply to compile) and puts
far more than 4 instructions of logic onto the common path.

~Andrew

