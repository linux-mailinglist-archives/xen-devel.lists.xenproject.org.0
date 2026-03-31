Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBqBM3V4y2k3HwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:32:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1E365386
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268530.1557789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7TZX-0001xZ-2C; Tue, 31 Mar 2026 07:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268530.1557789; Tue, 31 Mar 2026 07:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7TZW-0001uz-VO; Tue, 31 Mar 2026 07:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1268530;
 Tue, 31 Mar 2026 07:31:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w7TZV-0001ut-FH
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 07:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7TZS-00Dw5J-NM
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:31:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69cb7853-bab6-0a2a0a5309dd-0a2a450192be-8
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:31:32 +0200
Received: from [52.101.57.11]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69cb7852-6400-0a2a45010019-3465390b906c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:31:31 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO6PR03MB6211.namprd03.prod.outlook.com (2603:10b6:303:13b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:31:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 07:31:26 +0000
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
 b=YD3f62DJklE4myL5oJ60AQaAX11XMFXICXME7/Jw6MyrKkoLyXmT5HZ9e2OixlvtOpNm9jtr6FUMDWdMZASgQWAKy7Nem8/G+Apy4cqDVyjm5aqcszSzdxgygeFYm5+ySJKsEJ1evXXvrWmoIwSutJ+jZyW2vrLvnhifjHz0vOcGBiX7WW/R0rdJbkr58jkVEL+8pbev+D8mJjRcmqUECW/uxAunnjungE4FOmRLBMeTZgTkdIYGJFoopotF2ZVVx5n4xU5tiPMd9TqLIVCjQVcMu/i72UPCSnKyBaEQ++LdE3Hwiat5Eesjis/3kbVnrHK8FYRPZEzVfGMXEoMnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vheqAJQ4ojLcTi+UsnqYL89G2/5RVLOWRianD+yHNKM=;
 b=qnuwUSDnQGCRgK2uc2McYcME93jgeghjf75Juy0lIL8Kx4PSfW8rPQ2TXu5zeNxzEgVTNh0nbAxVjP9x4c0wK3ZL8bLG1E8WoFeFx9z3LdGTyB0agXArY8hE2ci5Zj8iZ6RvQW7rW6ruq1nHhN53wyrow92dCO5KLjpNHBrpBtJp94nXOqOC7JSq5f1r+MqQ7YsAOT+5kefvFAZpVA4OAJzm6bTkwG0q9iw84PD9inpEDDR0iZJXQZjIRDDJrcqluEjmWGl5UQm1hD/HScQZ1Dofbi/Uk5Lz3cZmOKpRLxANonh1q5wPTQxrL2kYifYZd5SQ8K1QB9WeV39HC5cnvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vheqAJQ4ojLcTi+UsnqYL89G2/5RVLOWRianD+yHNKM=;
 b=yg4EHz8Sg37ar9jmWR33dxZBg99WM7OzxM3OeV/YLkE1aFyuoBjJ3bRSFlvCH5zBbt6w+Yk0LEIEABMHZOIVXpu03LGaQdwYlHGQcwEjbZgbYYW/jiufNzfxt/kGic48685SbXMzuwkaiegS2g5y/PV+22DO7rW9uZPes2Zpa2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <22b8ff1a-e9cb-4298-9f30-b07125d0cddc@citrix.com>
Date: Tue, 31 Mar 2026 08:31:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/pv: Provide better SYSCALL backwards
 compatibility in FRED mode
To: Jan Beulich <jbeulich@suse.com>
References: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
 <20260325170208.1115832-3-andrew.cooper3@citrix.com>
 <059588cd-d73e-40a1-98b4-65be01957d41@suse.com>
 <08a02b65-92f5-4e78-8c34-38a22ae4d906@citrix.com>
 <b67bbdd7-e1dd-4a18-b552-1c90d6323ac9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b67bbdd7-e1dd-4a18-b552-1c90d6323ac9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:5:54::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO6PR03MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0297d61c-3698-4b1e-9696-08de8ef7848a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7KjO0OGz/+rUPRK4IAl/x7DuntQzqKspCfLUUjV4pCS+vn3e3CSwz5OFhTdw7GGX/qR2YSovkaeeDaG51nXRknhVsmrthlo2EWZgdGTPtwBHIGm1q/2NUBaFzzbGVw7Vgg94c0J+rOSeotuaAN70XY8QdMleu/ez2qhI9wZx5knKQhcfVXyjy23Gu6QevKLU0FmfFvMknDaHHv5Jj73C8bKAhc2DptTDXLo8MWK53ZpISUtLwTSYnB9ZMZ/Ix7+kdYCkYTJEwVTEs5feTdwyooYpToShHPVKcpmmivhPAo+2z6zc7PWebnOsHLK12vh3COri0tZBXLEuLgG+/XD9ofBdUXGBNNu2UZZvGjf+mqIoomhyPZKGyjwe+RiJ3ShUfLsC4wtIx47VjOjwjHXRW568gobrQAUqPKnvgpmb4J0rKC7ftXD19tRl+Uj+IUZvZKwk7wGTNydoUIoqBjZZjnjIGy42fc7ZjffpaXE6WQa0t1Bw8Dg89CIO/6oESLmBBg9QgG/ADyWxGShyTUQsiNMZcKGI7aDbl9+pz6L0bFhnANATYhcq040CCegugSeAJwosHdbSd8dLC29ptH4hFymYNW03UOlY//0Sd8+SU6FCF1949mtSXgd/1/wwjBlcgHDzjURJF15UdMdE0CSzpA7RgohDbB0kOJEyXPOgg28keLd8+I9vpPhTg6CJJQXBRPG2b7oYltQZ2lthZsiFhTJJsaq4e2fTK9d1+Qrr0Es=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEt5Vnh0RHd4L0wrUDhGMkVZTEs2eSt0VHdYWWlKODdrTzNLTVAzRUh2blZh?=
 =?utf-8?B?bzNGNVNpbXFtYlNxczVESDM4TDlxb3RlMjNrL0tndTJTNTNVOXBJdWN5RG5Z?=
 =?utf-8?B?VFkyZGFhTnFHWXd6SnJjRXZIYkZvanlKUS8zOXA4dDFUWnhPZjRxaHVlLzdT?=
 =?utf-8?B?c2lod2Jqc2UycDFMWUljMW90M1R0QkdQVnhqUHFKNmMycHJMdG5OYjJ6UVhk?=
 =?utf-8?B?UlZGcmhiYk1rUlRKNjJKazhhWFY4U1VNTEs4VjhpQkdYOGlZakM2T09mZ1Rs?=
 =?utf-8?B?ZjUzdnpsUVZLYkxDcFZ0QVJUVDRKOUNSNHRvZE5zaFJpeFU4WTdvZFpobGpy?=
 =?utf-8?B?K3QvTGh1UnpMQnhHNXZPRzdiS2xIMWpwRyt0MWQ4Uk41T3QxZUF6b3d4UUt1?=
 =?utf-8?B?K00rUktpWUkzTVZ2M2owa2xpMHQrOVIyclhXWTNtWGczSSs3cThONHhMRWZO?=
 =?utf-8?B?RFIxY2xpK1pYdmVuZnRPM3ZxU3pyc09DUEJTbkpwTFI1OXFHUy9uTUhNYmhq?=
 =?utf-8?B?bU1JUmJiemVPUFhXNnZUK1M0Q2N4ekRmZ2lsR3MxWDF4S0VLMnpmMWdRT0JU?=
 =?utf-8?B?WjMvOGlVL2VYdXVwMzVSNVNkb0o5MWJCa2xNTmFBY05qVDJQU0tCQTRwS2FF?=
 =?utf-8?B?Ym1ZZnhxWUVOQ2pXYnp5dGFMNVJ6ZTRBQ0dDZHg3VmJ3TXhEc3E2RFNqWDRY?=
 =?utf-8?B?Ymc5T3RqamRuWDNQcExJakZuei8zKzUzR1JQS2Z0RGROWkk2cUUzc2JVdWF6?=
 =?utf-8?B?cDdicEtPMENIZ2xaZ3BZQkR0RitNV2R6Zk1zdGUwelJQMUtIMThaMjN6c2VM?=
 =?utf-8?B?Sk5pVWwwM1BMbm04NkJBa3FCQm1HbWRKN3E3OTFwVXFLREJqTldkZForS1hj?=
 =?utf-8?B?OTV3SUwzUlJQd1RHN2U5a1lqYzEreWlFNjNPUmx6TTB0SDNnN0xIK3pvNk40?=
 =?utf-8?B?VDEvbjl0U2UzZXFNRWZ5Z1FPeFZqMFlUMERGQU8ycEJBMStQdmJPdktkN29E?=
 =?utf-8?B?QVJza1VBYXBFSHBROU1DaXFsOXViNUc5elNaYTRkM0tSUExLOFRpTy9iTHV6?=
 =?utf-8?B?b0ZRQzZrQ2lGWUVPaFVXclNaT1NMbTFwMGY0Z1ZvUVMzKzQwUmlNbGZNcG9y?=
 =?utf-8?B?SXhCK3VOVUpVUlRkT1dWeFdtYkFmR3dQRXdoQ1JOZWlZMGlRNzFxMkZQZE45?=
 =?utf-8?B?SjZqWmxhaEw0RVlnNDJtVDRZYzRqR083SWpRVWxtb0c5Y2tjMDYzQ0JmZ0Yx?=
 =?utf-8?B?anJjOCtMUFNtNERNWDJwM3Y2aWZwdnNMT0F2aGkySnFBZitwcm1taGFZTEdN?=
 =?utf-8?B?MCtJbkZzcjV6dVA5UWY4ZVYyUTFhL2x5RW9MTFowc2JLVVBrTytpYlhHL29Y?=
 =?utf-8?B?aE8xYWtzVzRiaDU1eGVhMlNYYWUrMThaSzRFY25ialZtc2VibEwyNlNoQVZK?=
 =?utf-8?B?N3VjYm1PS3BETnA3bWpsTnhuL01UQkFXSE9kQzF4cEZ0OFVzZVJ3RE9aSU5H?=
 =?utf-8?B?dUFhb3Flak9CMktlL3c1VHdOS2ZzbURTTXlibUJOLzY0QnExSmhEZnJxRjIr?=
 =?utf-8?B?TEFsYmtseWdxOGxNamxlV0xaYzFLUEw4NFYxTkNtY2tCRUdpNG1hTndhQnQy?=
 =?utf-8?B?azBaS1ZSMWdmVDFUeHdadUd3TGRTOVVVUEVCMW9wdWFaQVdDNEh4ZzJtTk4y?=
 =?utf-8?B?Zjd6VmpPaUp0Vk0rRS9RWkc0TVBwZTUwU0g1b0w2MVBsV21zV1BWNmJqbnRk?=
 =?utf-8?B?ZWdIVFhsQUEwZ3BacUNtYXFKUzNxUXdVZDlNai9WQWJBbDBrZ1MxNGJIcFpU?=
 =?utf-8?B?MWV2RjQzZnFENElMWURNVFJJNjZ2YURNY1FXWm9XMUdmQmV0N2JkcDRDOWNq?=
 =?utf-8?B?SzFpN2dGdUtKMGk4UGFabnJFdmg3dUZhb2J1dVJsSG5KSE9ITDg4bnlxK3Iy?=
 =?utf-8?B?MmRReXRpTFM1dmpUS093YUh1WEdnYVk2NEMvOHovT1gwcWpqZkJNMWhtQ0l3?=
 =?utf-8?B?YUpSa2hoNTN6eFBYazczRUwzdDVldHY3VzA3WjA1SDVkWmt2WWREQVF4M2hj?=
 =?utf-8?B?V2wzTVBXVXR4anhvVnlnd2lhejNhYnd3RWNsRlA1WnFGYWNEdGZadHV1eEQ5?=
 =?utf-8?B?SHRRMnNrc3I2MzlCRSs3SUFVc3VBM0lBQ05IcDVHZlBsZzhzZlp2VlNPYzRJ?=
 =?utf-8?B?d1FSZUhYVWlCVlM2N1Z6N2Ntb2dINDZTM3VGdVplSkd2OHpiMGxZTCtEbC9F?=
 =?utf-8?B?aDduYyszb2huTUNFbkVtNmlIaDhEeGgybVR0MEJmbGlHS1ZhVHNPTHA2Mnkx?=
 =?utf-8?B?SnFoMmt3WHhBZGFkV0I2cDRGU2lQaVROZzhRT0RUaHJ2K25ieTZzdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0297d61c-3698-4b1e-9696-08de8ef7848a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:31:26.5830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6/2LCPoYzp6OdOx4ogn/vVe+FeBdM26lH2YrHUEpM9twP5atSwSyN6oOi2gZVMP5s/PqHUiAw5hGj8yzPKkp9sUZ7MofpLHvWP2QY1oy3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6211
X-purgate-ID: tlsNG-d62444/1774942291-8FCEBDF3-363CA6A2/0/0
X-purgate-type: clean
X-purgate-size: 937
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 33E1E365386
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 8:50 am, Jan Beulich wrote:
> On 26.03.2026 22:05, Andrew Cooper wrote:
>> On 26/03/2026 9:14 am, Jan Beulich wrote:
>>> Don't you also need to set TRAP_syscall here, for the new code in
>>> eretu_exit_to_guest to actually make a difference?
>> It is create_bounce_frame() which sets up TRAP_syscall.
> Hmm, right. I was misled by {l,c}star_enter and sysenter_entry setting
> the flag explicitly. That looks to be necessary only for the pv_hypercall()
> path out of lstar_enter; everything else goes through create_bounce_frame().

Oh, that's a can of worms in and of itself.

The hypercall page preserves %rcx/%r11 around the SYSCALL instruction,
but that's not captured in
https://xenbits.xen.org/docs/latest/guest-guide/x86/hypercall-abi.html

Given that we're now explicitly supporting the use of hypercalls without
the hypercall page for CFI hardening reasons, I guess I need to fix that.

~Andrew

