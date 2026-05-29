Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP/GB7ZtGWpzwggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 12:43:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48960100D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 12:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321886.1588350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSufC-0001Gb-UF; Fri, 29 May 2026 10:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321886.1588350; Fri, 29 May 2026 10:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSufC-0001Eg-RM; Fri, 29 May 2026 10:42:02 +0000
Received: by outflank-mailman (input) for mailman id 1321886;
 Fri, 29 May 2026 10:42:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wSufB-0001EW-0l
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 10:42:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSuf9-00F8AM-U8
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:41:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a196d61-bab6-0a2a0a5309dd-0a2a45088ca0-42
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 12:41:59 +0200
Received: from [52.101.61.61]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a196d76-63b5-0a2a45080019-34653d3d0c70-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 12:41:59 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7071.namprd03.prod.outlook.com (2603:10b6:a03:4ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 10:41:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 10:41:55 +0000
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
 b=QT1DjAII6QVqmLLo2u9mS/8AlKq4g2BtMBRONXMIDcJKsYYu+QILN55nrZEkZ2OH3x+qd2molkLycZjZE0f9nAUPanQ1o/YrjSj2uPb2L9tPq7qvAaxaZsgWck5xhEF0cZt/tzVIuvjMEPuwSeiXESrxbh/Wbkwn3DzqFCrecXn5tfWvCKknfTpgLshjXFfk4Nim7OtKTBRCARYgDD476G8Iy45uGgEIkj/5rdKe0wdfVuMD/VFv5zGUpdfOPWRQW69gIpb811hwVo7dfYbu169qHBhHCn7GlgUez+S/DxIwLWkMT/RXLF45GygNgS66SN0mNehjEtyh5T0IqP2C/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwZmiP5bUbjE+gwp/QJvJyWGRZ9RQ12I/oanFjhqSTc=;
 b=qArZ5zrZ6c4r+F1arPMaeVqDaXzhXEBTiEai4OszPEtxU0Ay8BqUYeyj8jo57nw6Wjtglw2W+pX/cytcyYAIKE/taOKmDE97sgLIUg7kMVMNBLvuoSmguzDN1LI+Oirlm5BanEHd3OYCNEKskuqvkph0f5aPcvJd1+i0oSMa8nuBxNfyD0TfeDoSnjElqrzG+NSzJTXsc6Xk9TnGbIOgKvjsQnpapWWTGpzgEn8+RLLL9mJ148GUaz+7L7GXO3T6LhrTQBuYuoRkchXNzQpHbn8JtONiAdubQvErhO7to0a/AxndbPA6b5/IcX8JLHXhcBKJ9W1u1Cx7pRSfKtFB9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwZmiP5bUbjE+gwp/QJvJyWGRZ9RQ12I/oanFjhqSTc=;
 b=XC2olc3ZkGNsdpAUfiXf8oLlmgd3wNcs4WmCDllQ/2ffcoLDImFGYJo6LlcCetXlpVUD8CmVh12JgO9tw/EQxIrHrfvi6yx8YaYGtziOKmsratyev1LgiK+RDbDYszaBsjxZ1alG1yQuniC8RPExygMDy6/1tApvpHEgR7kwhZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <095aa162-a397-46dd-b34f-5c9c1b15e149@citrix.com>
Date: Fri, 29 May 2026 11:41:50 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] coverage: place GCOV-generated .text.startup section
 in init text
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fb154ba84ed01a060c6617194080d7cd77f9144d.1780044400.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fb154ba84ed01a060c6617194080d7cd77f9144d.1780044400.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c9db7d-6019-4db4-5efd-08debd6ee735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|22082099003|56012099006|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	TkDdLig3+/0vgGGdt6JjoLPs81ASPNiuHLCRrZ9am7DuHYW/nUS7pgRIdLrBA1nvmaEHXUcDapkPvAXT5HCbNtXU4PBpmfCSvVKPpyF8YsRp6TfAds3LLpvLVHVBoWsED7N7HpG4uS/J9+8yhGUcixfUdPNnihZMzk76iOHjTgrDNz9m484jhz6ltNGKUFzKvOzwVeCzH9NUl08K+f+FsnCyrjx1nTFkcPUU+qHMQsNVVBObTZJ6yj8e1gmI2x20NY+i7r9JC7Bs9UxPb9gG1qmwP710FdFLuCL007xlKFwJ/RL3nyggmzdM35MdCQzT+wHxHE1NtzuSewnckY7jELf7huPUJYcHiqNT5fmWRn8/eH5XSUIDAgokWoEBaobbGKNJR02qi8mda36JL45STeCeWLBpIYIbkDQdVkdSTtH2Bob8UF8scLshVpEq7nrwtm38rO2RieI7DArzzdcW8RcgFBA456I/NG1ZEsw7s6HfbmF8M9DtlWfo4gb4NNDUodbwzGFqiHxXfu8eItYTrOrPJQHsdEK6BC9Hr0PZ2RvVf9m5ioF67oZxH3teupbJufe0Nc5Y8vG5FBqjSQt676waEJvBVn2om3b0NwNzxUP5Hv0DA0I4fl9jABwwaeTyUz1k04WQ1tdP7OTYyW+l6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVdNYTJMek1FN2pTZDZweTRnRE1XaVhYUmRHSm1xWFluemk3OU5uS09xcmRv?=
 =?utf-8?B?MmgxWUI4RVAwcHh4UnhXMzVPbTc3V2owbmlrelVwNUVqSUdBMW5VNU1TOHBw?=
 =?utf-8?B?ODQ1T3B1NzZuQWNyVExpNjZwR0xXSmdsdjJHUjRiK29PZmY0NlYzRHFXK2tz?=
 =?utf-8?B?eW1oMjZBOVdPT0F4RGNBQTdyeFBtYlhlUjFPWFJpaUV0YXRkUWo2QlhaN2tO?=
 =?utf-8?B?VXp1ejVORHk2QmdqY1MwQWU2Q0lNOWxkK1N3bTJ0cmYwM2xPYmhZcHJnZjlt?=
 =?utf-8?B?MnZubGNoV0xmYkt1S2hDbjQyK3RCRTU4N05rWUkwc29rT1dJaXgxV0xnUlB5?=
 =?utf-8?B?MC9abVNDN295amJ4aGlCYUVIdUI3d2xVT2JTclRxR1FicVpzWHZyVlBHdVVl?=
 =?utf-8?B?clZzVGtjRGxKRm5QWVFYakVvNE9hYk9saFRleUVRc0xLekpyT0kwTlVTelNO?=
 =?utf-8?B?MkRHWXFsaVlQbWw0N09VVFMrYkJsMkNDTEVwMGVRaGczSUZKemwySy9zSlRM?=
 =?utf-8?B?bUxJZWtHekxUQmd1MlFtc3AwbzZ3UWl3MWRKbXVyd09BRjRFQUpkY2dJdkN2?=
 =?utf-8?B?d3NmYms0VUE4cWtteGtKeTVqTXNrWitJZ2VFa0wyVmNsRmxSWkNZbUxqa0Vu?=
 =?utf-8?B?RzBRamRncFFaWEt3ZWhpYW9lU0ZrSmZiMVBhei9hUk1GVFhZQjJvRS9qcnA0?=
 =?utf-8?B?Yk5LNzdWRkRwMnZFSWlWeGk3OUdQdTgzTXZCV1JaZXdDTmFSN3NwdmNXaWRj?=
 =?utf-8?B?TlljclpyM0Zaai9TRE5UaDNuRFRESkxWMEdHVExwR1ljZmp3MXQ0U29pMlpT?=
 =?utf-8?B?K0xjZUgxUVU5U2dtQ0hPV3JicmJYVkRLSXY1Y1B1VGw4SDZtdHhBTG9pdFI4?=
 =?utf-8?B?V2dad3lsZ2loUlVFaFhIeDFiUWhmd0Y3NWJEVERETFRRc3lKcEg5bkl4Z0Vy?=
 =?utf-8?B?OEpOd2JZZVBnMmtRS1JPb1B5TEJ6NkE4b05zaSs4cVVBbTBuT2N1VkY5UnhO?=
 =?utf-8?B?aHVvclMvTitqYU0vdmMwNUs3TGVFS2ZKaUp5MGJ4T3FyZytRTHNaNUh4cTU3?=
 =?utf-8?B?eHRRWExWaDM1L0RvWGJsRXZiNHdJY1ZidXR5SG5BT0tyVThZUVByMTF4Vi9E?=
 =?utf-8?B?QnNRZzJHcWFOQ3FBZ0ZNczZaMXpRQm1yRUlVVURFTEFwV2VURzlrVUZ4WEFS?=
 =?utf-8?B?V2syNjRiaUQxWFlQSFl1a3lmb09nenVleGpWaEZuSFA2WDhIcmxPeThvWXg5?=
 =?utf-8?B?ZUF2aUpCSmpJRUJWb0hmMk9xa1F3anNXRUgrK0I1ZDl2YnppU1pyRWtLSTBj?=
 =?utf-8?B?WjJZUVdaVWhiZVJMbzdTb0QrZ2xhWThwQWNvR2xTSG5UU28xRlZVQmlzRWRr?=
 =?utf-8?B?VHl2SCtCSDdnS2N5K09aWEUvVkFHWjc2bHZYRjlrdjBSME5MY3JjeC8xd0V5?=
 =?utf-8?B?YzdiWFhnVHZEejBJWUhVQWpVL0NseUpDK29mNk1qR29jWUJvbU91K3g4K1dy?=
 =?utf-8?B?RGZJd0NQeDlCNGQ4TmI1LzdybElCMWtkbWd4WHpCcS9BLzIyODhtRVhlMnA2?=
 =?utf-8?B?RnVJeitNdjUzQmpRSVNkdDZDN01wcE43ZFdpbUxTZHlMbE9BQ0dFQ1hEVnZC?=
 =?utf-8?B?OHBSZ3ZKbVlKNjNNeUxsTVJCcVBLZFc0MldzNStBUVJENW5iOTVXcU9ORDRj?=
 =?utf-8?B?NEpOU2F4Z0FCbUM5UkJPUjFmWTlpUUVvRHBGKys0cDNacW9pV3FKa29WMzJU?=
 =?utf-8?B?VVJvM3ExY0xJZkgxTFM2c2VYaWdvV1JxTStmc2pVdVQxMlA5dTZibTlOdUd2?=
 =?utf-8?B?c3ExYTNtSWVPUmVhenppb2U5RmMwNitISTdDYXE4VDE0eEVkMFljNGcxdG9t?=
 =?utf-8?B?R2M2aGZaZmpUd3IzNW85ejVzVTRnY2hEZmhRR2xyMytsKzZZekU0U2NheWxQ?=
 =?utf-8?B?SW0rNUduUHp1V2Z6Y0o1TjZkZDJNU29kYWw0RTJaOW5ITEhiYnpUY2pyeGJE?=
 =?utf-8?B?d3B5MkJSSi9BQWJobEtMb2JKemhoV3RkY0g0UGR2Qm1WVk40bEJNS3F2SGov?=
 =?utf-8?B?YnE2S2dES0lwaWY5Y291aUY4VDZjY2FET3p2bGdiVmQ2eUpPMmttamhhKzVV?=
 =?utf-8?B?ZjFISkVFU1hmVFZGM2gzeUtYVU9aQlVZWUZ2TWd4WkNEZG91MlpDM2M3TUlp?=
 =?utf-8?B?bXZneWxQWHhJM1NiOS9wM2VtVGI5ZFY0U0RDRkt4OU9LRjFHNWUycE1Yb2Rn?=
 =?utf-8?B?MVFPLzFMVlYrWHlkdnRpT3R1QkRlOEcwc3pHRjhXL085eFFvbFpMUnFDaGlP?=
 =?utf-8?B?NE1XMkRHYnRhK1J3aGJhaGhJbG5Vb3lYTmxCUDJZNGU2dU9tcXFMbU8rZDRk?=
 =?utf-8?Q?ql3RgrrjyD40VDm0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c9db7d-6019-4db4-5efd-08debd6ee735
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 10:41:55.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A82gMaCLHL/lIJCvk6xwmlpEbAGt3yYGTH34LnEMmoHe5dNNXe1xdWxBZCRtEuv0uc2iSA5TNQb9mb75v894EEeyZhWqQVq2K0LjlD0bES0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7071
X-purgate-ID: tlsNG-c1860d/1780051319-C5386DB1-D45D5588/0/0
X-purgate-type: clean
X-purgate-size: 4242
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
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,citrix.com:mid,citrix.com:dkim,epam.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5D48960100D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 9:53 am, Dmytro Prokopchuk1 wrote:
> GCOV instrumentation can emit executable input sections such as
> .text.startup when CONFIG_COVERAGE is enabled.
>
> At present the x86 already places .text.startup in .init.text,
> but Arm, RISC-V and PPC do not. With CONFIG_COVERAGE=y .text.startup
> can therefore be treated as a linker orphan on those architectures.
>
> Constructors generated by coverage instrumentation can then point
> at code outside the normal RX text mapping, leading to early boot
> crashes from init_constructors():
>
>     (XEN) [   12.331193] Instruction Abort Trap. Syndrome=0xf
>     (XEN) [   12.334253] Walking Hypervisor VA 0xa00003ce000 on CPU0 via TTBR 0x000000004352d000
>     (XEN) [   12.338550] 0TH[0x014] = 0x4352cf7f
>     (XEN) [   12.341823] 1ST[0x000] = 0x4352bf7f
>     (XEN) [   12.345124] 2ND[0x001] = 0x40000043527f7f
>     (XEN) [   12.347329] 3RD[0x1ce] = 0x400000433cef7f
>     (XEN) [   12.351233] CPU0: Unexpected Trap: Instruction Abort
>     (XEN) [   12.357643] ----[ Xen-4.21.1  arm64  debug=n gcov=y  Not tainted ]----
>     (XEN) [   12.360243] CPU:    0
>     (XEN) [   12.364098] PC:     00000a00003ce000 00000a00003ce000
>     (XEN) [   12.375835] LR:     00000a00004802f8
>     (XEN) [   12.378273] SP:     00000a00004c7e10
>     (XEN) [   12.380492] CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
>     (XEN) [   12.382785]      X0: 00000a00003ce000  X1: 0000000000000000  X2: 00000a0000410fa0
>     (XEN) [   12.385176]      X3: 0000000000000000  X4: 0000000000000010  X5: 0000000000000001
>     (XEN) [   12.387555]      X6: 00000a00004e5f40  X7: 00000a00004e5f38  X8: 0000000000000000
>     (XEN) [   12.390027]      X9: 00000a00004e5f20 X10: 00000a00004e5f30 X11: 00000a00004e5f40
>     (XEN) [   12.392510]     X12: 00000a0000439748 X13: 00000a0000406938 X14: 000000000000062e
>     (XEN) [   12.394954]     X15: 00000a00004f3918 X16: 00000a00004c7bb5 X17: 00000000004c7bb5
>     (XEN) [   12.397293]     X18: 0000000000000030 X19: 000000000000001d X20: 00000000000000a9
>     (XEN) [   12.399803]     X21: 00000a00004c8008 X22: 00000a00003fa000 X23: 00000a00004e2000
>     (XEN) [   12.402392]     X24: 00000a00003f9390 X25: 00000a00003fa000 X26: 00000a00003f4ca8
>     (XEN) [   12.404798]     X27: 0000000000000002 X28: 00000a000057a9c0  FP: 00000000bedb6740
>     (XEN) [   12.407110]
>     (XEN) [   12.409442]   VTCR_EL2: 0000000080023558
>     (XEN) [   12.411291]  VTTBR_EL2: 00000000bffc4000
>     (XEN) [   12.412895]
>     (XEN) [   12.414204]  SCTLR_EL2: 0000000030cd183d
>     (XEN) [   12.415928]    HCR_EL2: 0000000000000039
>     (XEN) [   12.417642]  TTBR0_EL2: 000000004352d000
>     (XEN) [   12.419152]
>     (XEN) [   12.420327]    ESR_EL2: 000000008600000f
>     (XEN) [   12.422056]  HPFAR_EL2: 0000000000000000
>     (XEN) [   12.423809]    FAR_EL2: 00000a00003ce000
>     ...
>     (XEN) [   12.485355] Xen call trace:
>     (XEN) [   12.489080]    [<00000a00003ce000>] 00000a00003ce000 (PC)
>     (XEN) [   12.512076]    [<00000a00004802f8>] init_constructors+0x38/0x50 (LR)
>
> Observed failing symbol:
>     _sub_I_00100_0
> called from:
>     init_constructors()
> The issue can be diagnosed by enabling linker orphan diagnostics or
> generating a linker map:
>     LDFLAGS += "--orphan-handling=warn"
>     LDFLAGS += "-Map=xen.map"
> and then inspecting orphaned executable sections such as:
>     .text.startup
>
> Place .text.startup in .init.text on the non-x86 linker scripts,
> matching the existing x86 behavior.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes in v2:
> - do not add *(.text.*) when CONFIG_COVERAGE is enables
> - copy the existing x86 linker script behavior to the non-x86 linker scripts
>   (put .text.startup into .init.text on Arm, RISC-V and PPC)
> - update commit subject and message accordingly
>
> Link to v1:
> https://patchew.org/Xen/cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545.git.dmytro._5Fprokopchuk1@epam.com/

What about my feedback to v1 which showed that .text.startup
specifically is buggy in x86, and provided a suggestion of what to do
about it?

~Andrew

