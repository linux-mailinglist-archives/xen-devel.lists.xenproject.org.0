Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6G4QHfG8OmoIFggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 19:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB50E6B8F55
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 19:05:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BsBCLFkM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344459.1603514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Yg-00035Q-V0; Tue, 23 Jun 2026 17:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344459.1603514; Tue, 23 Jun 2026 17:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Yg-00033w-SH; Tue, 23 Jun 2026 17:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1344459;
 Tue, 23 Jun 2026 17:05:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wc4Yf-00033q-1k
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 17:05:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc4Yd-00CbZn-NB
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 19:05:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3abcb1-2eae-0a2a0a5409dd-0a2a4507e900-38
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 19:05:07 +0200
Received: from [40.93.195.20]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3abcc1-4766-0a2a45070019-285dc314d8f4-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 19:05:07 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7693.namprd03.prod.outlook.com (2603:10b6:208:4ff::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 17:05:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 17:05:04 +0000
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
 b=E5Q1/i5c/Ri8zamecfG2us2Ht8n6TbIXt92Xg/PkYSGwQHvNtZc/0MUGPqW7eUhXpAdnO6ucLVU4SCpRzIFe8WJ5BtiQPLRHOi6/TZmeseekvNJz3Kgf+iuzsM0KITpDSu0EScWErHEZG6DdK7nn/sKfl5qeXhke7xFRYjozwm2Vi+NcC5ZnIFirPI3EkIR8gfcXkRNynNuKkxV9/f3ufbijys58iUVgc+TKVPkjbjnr4K43x5r9aUyj4j/KJrTsiZWmUYWlHi16QGyDzCq/S3UFXCIJmHsmSuM6Mj9AA/NRNguLZzrNt0RUKxD2FPRwkfu/0q/vLk5Le1m/T+FjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd8pp8L+3ncazjlMnb+OF40RSFwLJBlTHVmSu6olA0k=;
 b=L0mSIK32Wiex2sftM7PKgoBH8O/bzdOIA3KxvnKxrZTX6q2VDohXXNu1TJPSfz1tnqaGfwtaYYn5+PoKauJxF+/Ibysw6QMOtyBWPQojvbdJtIuFdPB8eIw2nJFMZ7iAlHjoAkaQXOonjRNI6lpw6cK/Y3F/JHMMp7t/iyzPSAKc2EhafZGVakWi9j50VvElmwHva1jI4546sB8dEpV1y4iP9X8EtT/x9akAX26aUWTDdARwM+MYCi0p/eSj3/oi84hC6c97f4qlI41tun6TDvaP4PqJ1lF5dfYhtzPNAns2vAs91w/mH09P0QxwfAeWHYTCFAI5SUUHrpJusSPCsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hd8pp8L+3ncazjlMnb+OF40RSFwLJBlTHVmSu6olA0k=;
 b=BsBCLFkM60+GxtHTPMJlT8bkS21wyqXeCzET2KKPazVXIBm4c3jzJUQ+illNQfCzKX7SjyPksXHUQRG1w8renpu3e04Lla0jqPXUNpN1dGyqePhqg6DIsdRIr++FdZBrCi8f6nNCp5ITBK1oc0cvIt+QL/OYMY09nTInBnyoktA=
Message-ID: <7393869e-9978-4e38-8436-747511b88c43@citrix.com>
Date: Tue, 23 Jun 2026 18:05:01 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/4] x86/kexec: Invalidate the IDT earlier in
 kexec_reloc()
To: Jan Beulich <jbeulich@suse.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-4-andrew.cooper3@citrix.com>
 <2edd208b-4de4-4cec-a35b-31ae696cd777@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2edd208b-4de4-4cec-a35b-31ae696cd777@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 7089b22a-5ba7-4c5c-8c81-08ded14991e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IXBF8aBTaJrpjMe3KkaFfSIdMo4YUbe+l+/5Yz9K3Wg40CmztTkRavii3c1zZXB9Fux1MIZy3SoDsMckJlNGigbzwzdeZvGlpTEK5FugpEzRQsCZHzdulgU0JT12FXe6+bA3R4qoySAUhlBHKyeJH7XYemeqkVtrGwulUsJSAte7Sa1t+M08QQ+W/54D/EUvMyTOwEWsAGboqKssr1OMyLwI9bGRBRpnG6TvtGg6aXtt+MbW/bMDPFjNSvtP4hDjS6tIA3qiexmC7a5M/eivDKSseOO/wzY5rmA4E3RGyIp1khp73hMii57TlT2yzGfuJAcuHWG+ysRp+9UL2G0wDFhD3U9ASxBUgizJnHgAA27bGAq86tG8uMhGlHfUIo9aTvEJ18ZVS1PAV3AJNxGbnsK7OWoA85OtFOG3kiRlylxXNbjvxjBm8PkifSKc13rh5sqWn8Ka+PiXvFmi+4uk+uWs2pVrboA+QObzfSrMAT8B63vi0Wn3LoSlAqoWWoNq6QuX6DaWfflfaejpwj3ciJMAl26BWcGRv6vdUckX1Glfvn7uS5hlM5aAt10r0RBBlhRmjKGH0693IeTt0DcpfSqIemI2ciC0iEWVq3G/5+aZiYHNwskjB6/GmyReUcB5sS9Wo7p5lWX7RbLqzByZkfVZzXa20SS/x+DlnRAnR2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wll4S3F3SDkxN3hoemhSaGY1Tk5lUmxXdHZCT0ErRlZCYXBRNXhoQ3psTUM2?=
 =?utf-8?B?NEdMeDR4d3QxNkNkSCt4Tzc5Y3dYblVYcXlra21GQVdnNXUzeGx3MTRUMXNV?=
 =?utf-8?B?dDExNWNvQUtnQ0Zla1Yxb2tsUXNtd0NXc3NjOWFTUGVsT3ZPdklUU3N2blBI?=
 =?utf-8?B?K3JXcmxLOXRJT2NtbmIwRTliZWFiVVh6UkxLcU8rdUpwemt0WExOcVBIc3Rl?=
 =?utf-8?B?cjA5UWl2OEVleHErRnFiZktxdW5oeUpCSWYxMlpLRzJoUU1HdkZielZwcENY?=
 =?utf-8?B?WGxlOGtBbkhqV3hwNkg4OFFSU00xTzlCWnBFMlAyM0FXNXVNK1kvZVZuUHBG?=
 =?utf-8?B?M1hVUTdrMHd6dyt2RXZjVzdwbFNiM29jSG1hdk9Ma2dZY3JHdUJTN3A2b2c5?=
 =?utf-8?B?dW8wY0diNndXRUNWSTBiV3NjajE3eFJSMW5WbmNaUTZhQzluSUhzL2NPQjRt?=
 =?utf-8?B?bUxIbHJMUStUYzNvenBWbXRmRHJaQWI5WlJadVU1RTdCaE1QZXU2QWlyLytO?=
 =?utf-8?B?RmcySThmd21taHB1YkhUSjd6QllLZXJWM0g1d1N0MzViVHp3L0FOTTVTbHgv?=
 =?utf-8?B?MGNDWWJNTlhub2NLOE5DWmdkamhVUlFadUpnTFlrOFhibmh2NzJ5RmxtMFNE?=
 =?utf-8?B?bkpXeGxrQmtrMUNaNU4vcXEyOHBqOVZVcDV0aFJoaFZoZ2NDMkI5czdBWlYv?=
 =?utf-8?B?Q1JiTFBTdzlKamdyQ2plL01MU3hMZXdNVjc3OWo0WTlFZEdlRi9yWnUxd2pK?=
 =?utf-8?B?MUJWT2pjdGZXTDNvVGhIUzVkWll6cTdTdkxVam1rU0VQL3l2K0VINnFOdkxY?=
 =?utf-8?B?Nkw4ajFzTm51d1luTWRMY0pZdFlzeTF4MkpZazZLeUg4cDQ3YitvNjhZdUF0?=
 =?utf-8?B?T1JJU0dwUzhNbnhZcjM3YjA1UTZRbGxLUjNIMVFFclpuM3BXTDlnTE9vNXA3?=
 =?utf-8?B?YTBCM3FXV2dQMVVuNGlHOVVKNUlBWHovMkNwdGp2SThSbllNamRZTThKdDdL?=
 =?utf-8?B?QkxmaGF2VVhlYWFZVER1QjBKK0JKNFUzclhWZERNdU82YndjRXg5UGI3czhT?=
 =?utf-8?B?djlTQTJJTXFidWRuNlh4M0sxNVNTNndBVDF6SnVVaWF5T1pvOUJ1ZW5ydml3?=
 =?utf-8?B?TytKd1BVR2wyWCtIcXpFai90aEpqRnZYaEppN3lWYkVqL2RaSng4azVxOHhU?=
 =?utf-8?B?ekYvYTFoNFJycW5oRzRnY2lsdXd6czl0UzlhWXVDdXhzUE5BdXlYT3BSYmFF?=
 =?utf-8?B?L0V3RVFzNnlnN25QSDkzMUIyd2tjc3pneEJQWFl4V0FJN0NzbGFxNWJMcnQ5?=
 =?utf-8?B?YTEweVhVdXpIdkVCaVhmaHJhc0RBdVNadGdFNmkyQytkLzUyNnpwSS9nM3Fh?=
 =?utf-8?B?V0RQTXlUM2MzbWdTVCtrQU5aN2xkVVZaM25qRGMxYlhnYjFKdzArdUxZcVJa?=
 =?utf-8?B?Z1ZHQmxiTmg5dzNHZHI0VGx6UkhkaVlZK2Y1a2k2ZG5yY0RNZEM1MC9UcVoy?=
 =?utf-8?B?ZXYxZEFpVU1mTGFpTk5YNU1iRDZLbjJiS1B3N0trcW9NSVBib08yaFNqbk5K?=
 =?utf-8?B?YWFzdnFrS2R0SGdmVzVNMzRJU1U4R3lzRFFiV2FWckZvaFJrSTNLUDFXZ3lM?=
 =?utf-8?B?NkU3ZXZ4dXdUdFVTd2tGdldtRThjc1dNY3hOMVRqYUlCMkVvUnEzSnR3MmRQ?=
 =?utf-8?B?WEVUTi9sdExjdXVFYlQ3aWxJSTAvK2Jzc0U3NHNoeThLRWNOZDhLOC82VzFX?=
 =?utf-8?B?MERLa0NLR0lPaStIdm1xNWhMRkVwMWxLWThCZHR2SVRmUFN6R0Vlb2RrSXNM?=
 =?utf-8?B?VkIrRkFUQXZDTzRlZW9VMU9rdXMrME1ia3FFbU54eldZUE5ZSnpGbmdKRmVJ?=
 =?utf-8?B?OTJ2ejYvNnZSbVNYekJXZVlIN2VaSWxDUDhFMmU0MlM1UUZEcFQxWXp6RFdv?=
 =?utf-8?B?S2RzYVJ1N1pQd3pQcEc1dVdnK0t6aTRDbWdZdmxncVhSaXVWN2JCNi9TRkRQ?=
 =?utf-8?B?eFlMS3EvZWVBbUJ4bkxhVHBjSFpRV0syRTJZSTc4bnR6SmhCT2FqNGtycXNG?=
 =?utf-8?B?cWFWdGxCakp4MkxTdGczR1pYWXFKcmo3eFREYWJiMGtIRFZVbkJxYVFXQlFX?=
 =?utf-8?B?dEo5L0xhTFhZbGR6ZTJoK2c2bUdPV2pxejJraWJMdG9tRXdoUG5CTU5RYzJ0?=
 =?utf-8?B?dVNteTVXYWNDck4zT0ZISDJ6NWg0RHdNejlzYkY2QXZoYjVncnAvanN5TWhR?=
 =?utf-8?B?cHV2a0QwdFZ0Z0JPTTFOWnV0cms2aUpmb1VrckFkenNlRDgzMTZ1dnlqT1d1?=
 =?utf-8?B?NEZkWTVqWm1mV3Qyb0gvZTBmR3pzY29mRXhVbVozSWZXWkIyNzFYUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7089b22a-5ba7-4c5c-8c81-08ded14991e3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:05:04.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a41YoQBWpXwl2W3QiODn06gQYoZ9zNw77QPM5gSYArqycXxpYtIX+PN7WzOYDu7HENmlcXE96C3taJ0RQAXcWBKAyzkgbzHsQe1iqL1L+Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7693
X-purgate-ID: tlsNG-ef75cf/1782234307-915DE979-D1CF0B00/0/0
X-purgate-type: clean
X-purgate-size: 1888
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB50E6B8F55

On 24/03/2026 1:10 pm, Jan Beulich wrote:
> On 19.03.2026 13:25, Andrew Cooper wrote:
>> After switching stack, it is not safe to run any exception handlers, because
>> attempts to access the cpu_info block are out-of-bounds and will generate wild
>> accesses.
>>
>> Invalidating the IDT in the common path means there's no need to do so again
>> in the 32bit path, so drop compat_mode_idt entirely.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Yet still two suggestions:
>
>> --- a/xen/arch/x86/x86_64/kexec_reloc.S
>> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
>> @@ -44,6 +44,16 @@ FUNC(kexec_reloc, PAGE_SIZE)
>>  
>>          movq    %rcx, %rbp
>>  
>> +        /*
>> +         * Invalidate the IDT.  After switching off Xen's stacks, the
>> +         * exception handlers are unsafe to use, because there's no way to
>> +         * perform arithmetic on the stack pointer to find the cpu_info block.
>> +         */
>> +        push    $0
>> +        pushw   $0
>> +        lidt    (%rsp)
>> +        add     $10, %rsp
> Deliberately misaligning the stack is odd (but not technically a problem of
> course). How about using two full PUSHes instead, possibly adding a displacement
> of 6 to the LIDT in exchange?

I've got a similar pattern in a followup series to remove compat_gdt,
and for that it does strictly matter that it's not two full pushes.

This form takes no displacement and gets the accesses naturally aligned.

> Furthermore, don't we still have access to the full Xen image at this point? If
> so, why not do the above without using the stack, using zero_page(%rip) (or
> zero_page+6(%rip))?

We're crashing.  I'll trust something freshly zeroed on the stack far
more than a piece of memory we'd never notice changing away from 0.

~Andrew

