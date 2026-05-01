Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M3wAw5o9GnRBAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 10:45:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AFA4AB1C2
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 10:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298599.1573780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIjUQ-0005vX-R7; Fri, 01 May 2026 08:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298599.1573780; Fri, 01 May 2026 08:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIjUQ-0005tD-Nq; Fri, 01 May 2026 08:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1298599;
 Fri, 01 May 2026 08:44:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wIjUP-0005sv-LX
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 08:44:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIjUN-008y3a-Fp
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 10:44:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f467e4-e002-0a2a0a5209dd-0a2a450cdf98-24
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 10:44:48 +0200
Received: from [52.101.201.45]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f467fe-62f1-0a2a450c0019-3465c92da071-4
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 10:44:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6059.namprd03.prod.outlook.com (2603:10b6:408:118::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Fri, 1 May
 2026 08:44:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 08:44:43 +0000
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
 b=hxm710yWG4zHVDH6z8bcu6jkwdsHqgLI+h8dMl1Mwrs5WukhKK3TiajDLHweZoSUijTqPabFZ2UyorDmJ/LCaioX7+2u4KxlXGUexC/8VkTwfbbtxCWLG0xFqM0nxioDOqbC2dgXv+eknUYABZ1IMWfkYHIqOMkfW51p3c+nzTsJBUJo3ffeYNVdjgZ9wLWFatxe2O2USaD37UfgHYp3zfFSmKeSy5Dfvy4EMqEtheGU6I/TNDx9ALiFpMBj5FF/M20McexfNNTicbi+WjulXDil2Ro0BlLuz8qG4AnrFHzd9cwYfZKs68lBcMdDY9r3IU2nGYuMlMKIr5iWTjI/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3nB5mVYtDLaX9x9FgEfrEvaM1Hav8GpdYyoRO8GmJE=;
 b=FcKFPKIlGXqzZu4oPWR/qFPlD6Vre5Z0dglZRvt3IXblSCbeNBD9ujZ2FeHIS2vNNJ7Lvk09QMjesohsq/vHHNhFeA0Uo630hMIr/z8jeJQmSaZ3YWXaNEU0q5viWilNM8hMlNXEEX7d/bmMn4SmFsR+L3E4HFzaS9KbGjCtD/8E8V1CDzhoii+8GfA/Nm6A7P/rMDcrNRyf3Ek36foZjX8b/wF6D050QWtixWNLgVbmLLbVpnNGNuGR10WtG3O/JrSyRY/5A0/bccHKmM4ILYFstfdvTFjPIdgz42jR+l3LtB6wKODc6UuzUpohLv1barLgz6N1f/jjFX/8+xCFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3nB5mVYtDLaX9x9FgEfrEvaM1Hav8GpdYyoRO8GmJE=;
 b=pX7CUxKqCU2n579I7HjEfzAj0DT043gQMwQn6BCLd5XAU8cEGHNYScPtoP97bASQQmNmKmI63nak6veUsKbZdkVfpYWgukgTs45Fg6/MQXdfXCH1N7fIPk8+6LXmoxMrt1zr4viAz1hv13xAtpS7B21cL1DLd6dEkVodtTyyNxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a1ee1a97-d589-4658-b40f-650a8afa8846@citrix.com>
Date: Fri, 1 May 2026 09:44:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/pdx: Undef the correct macro
To: Luca Fancellu <Luca.Fancellu@arm.com>
References: <20260501084023.1195353-1-andrew.cooper3@citrix.com>
 <CCE39E98-189C-412E-AC50-C510429C6457@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CCE39E98-189C-412E-AC50-C510429C6457@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 288ee640-4058-4031-086c-08dea75de42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qiY8gOlSRBnCk+UTKoS0yfCNKGLxZh57qUlZMQrPwUUpx4MDz4U1wyH5eRdJRpzxYDWs3d2lm+A6ZWzHoZr5HdOGC/eb+4NXRko7BiEPE2bfSi/BW07CcjO0AQnS2lEpCNS9P/hQQbNE5Y0r5e4l5fyngpWJiMC77Zql6smOs+JtYmpciXmNQdLgFrHcfd2kPkgzrTZMebbDv57fG3CjKm0Y5tz8AVrBs0mK3SpVqvkHdI0/vw/ipgbMYnPJpp133Yf94rX6635bJyPVbzhANeMyxtC+xcN7li1PH95+iNB+mk/9kXDuB2pWzkMzy+xfVvVUVaHzVQNasbo6hUH8QVQo9PmkA033feypdueHSeTx5DO43txUDJnlx9GfisOL9gHdyUf5kGlS8F11yMXDT8UbiaiQSK6RiXyULQwqVskrYMd/SMa9P9kCOcMuEvX9ejLRkJuosLZ7nAMZbocU/wsyQ/+YoqInm+8KYPt6NhXskGpnsBFqObcOC4WQVvu/023Mcr3eTDY3dzh06ng1GUNcuXh+jXMScCIPp7OYYcf4k2S+BvDtgQ0QBXDmLdzMzwoAYDz3TWuup8XUS61JHVhZ2Ye1raj8hrMFgl8MZLmI6KuYDluW54icAUT24KSdjonXEw3qhDNdBuO9wWzw7/TLz9G+Hmx0JAwgKhrZ5EumKO566TMTBbDsKd2vucrh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjNic2ZVcnVSUEVXTTlSbjgzcDlyZlJNKytxQjhKdVJjMWNaQzErdGlKQzFx?=
 =?utf-8?B?WmRSMkJ6Y1VKaGVna1pIM2FyVEc0eUhYMGpyQ1RCTWErSmJQUGNieTJXRk0r?=
 =?utf-8?B?K3RiS0NlSGx5Q3NveURYZVNJTy92YVVJM1BnTWU5SlFpWHkvb3k0WVlRemdX?=
 =?utf-8?B?MkhGd0F4VzE5OWJpYWlmT2ZsUENyTjZUT0dVYWwzZ3pqMlgzUlBtZlBWOFNE?=
 =?utf-8?B?U0g0Nnk3TDRCN0M5STVPWWwzQzI1R0VLYWNSMFB3MmhFc3NkUFpRL1QvT04r?=
 =?utf-8?B?KytyRlVJbFR4alVkNFZUakVDNDZrTHEyUytHQks3TkIyQVJWMDd4NTJ3WnJr?=
 =?utf-8?B?Tk8vZFFjTXRUczhpZmJ3WkdpZE41d01tcW9SNGNTOTJEb3g3aWduZ015QTBy?=
 =?utf-8?B?NjlTc3dFaWdPU3FtaTIxVDAwK1JCOFFuU0ZzNDg2TlhudG5CTTlBemVmRWhG?=
 =?utf-8?B?K2E0VDgvTDl4TlBRWk1DTTZZK2Z3bmNPWkpleUFIaHBmMWxZVHN4Y2MvSllY?=
 =?utf-8?B?RWNPZkU1WkNtVGhVUjVGVjdQQXlIS1VGMUo3SzdkejN6U09FSlJxcWVxT3Jk?=
 =?utf-8?B?Qyt5NkFkUWVNdnZLTzJ0cHJ3cEpHMUIxQVZBQ1R1am1sdWZJMUpudDVyc1Rj?=
 =?utf-8?B?cCtJUjBXd25UZFA5eTN4cGxoS1Q5TTJpNEx1MUdoT01kRFZJVzVGNWFHMW1B?=
 =?utf-8?B?QXlRYnhmUjg0WmxHSjN1VWFEK1ovLzh0aEJPemJvMHhueVRFZ0RnN04xVVZS?=
 =?utf-8?B?S0dNSm41UHNmWXV1VmMxT2hGcytCTFpSRE1aemlqcG5jd1pkWTBuMFVONEpn?=
 =?utf-8?B?OFFMQWNFRWVnM2UyMFBlYkdneHB4T3M3STRISWJ5QUV2UTd4dzVxT0RFUU5X?=
 =?utf-8?B?MDRWUmZnb0ZCaVFaSHRCYUt4a3dCV0liaTBaVHVUVGNpd2xuZHNuRlBJa21v?=
 =?utf-8?B?eHBJemdZa3Y0N2p0QnJiWThMK3hhb3pGVVBzZ2s5RS93dERFUVZsaWNnY3RT?=
 =?utf-8?B?QTdqWWNkN3FzRm9OeklOdlhpME9ReUNrRXR3MkdlREg5bWlzT3d4bVB3NjZ2?=
 =?utf-8?B?V2p0RWRxNVZkaEt0a1pBZ05xdktlNUdLcXpBOUJBSFdNY0h1QUUzTnIvYXJZ?=
 =?utf-8?B?cFdIdUlNVGdOWGRqZEJTV0daekhPT3dIaXUwbGFqMUlVcHlvVUFJWHFzQjRJ?=
 =?utf-8?B?T1BzZFlnT0h5R0VIeGYxZVZNU2gyNkRzbTB5MUVXM1ZzRFJMaTdjZys3SWVv?=
 =?utf-8?B?UkErZllVSWdTT29FVGF5MDBxbUxaRTR1VXFMN2lud1JrMC8veFBMU1ZQc1Z5?=
 =?utf-8?B?NjRZNjJ0SXdSdUQwWkFaRXdLVzcybWx2djJDTUJ3dUE2KzNGTm1aVFFCQ0c3?=
 =?utf-8?B?eVhnSUhDa0pyckJkK3JjNmdydTN3UEVpa0taWUxJWkhOK2tIandES2RoOTBY?=
 =?utf-8?B?SW1mVWFhbG1WOVVQVGhaa0JRUFh4cXo3c3hKVTV3cC9VZEhXR2VjZUlkY2J4?=
 =?utf-8?B?NUVyTU9vQU15S2dqRit0SzMwcjJqM2l2OVBMRnR1bDd2dy9EY2hadnB5MHRS?=
 =?utf-8?B?SitRK0ZLQ2Z2OEh4L1Jram9uNVg5eU5LdkljSnEzWEpNOXVGb1BtQmNldFJt?=
 =?utf-8?B?TTNGSy9RNHhzQ1NiNVBTaFhMMzlrczN1SUs4eHdpU25zdys4WHh0ZEtZdWo2?=
 =?utf-8?B?OXdoNjRCZkxSU3B0T01leTVCM2c4SlJJdnRTQWZiQTNOSGdnUjVRTXVESEI5?=
 =?utf-8?B?Q2FaQUdWaUlHY2pPaTdOLzJVTURsaFlSdk1kdnoxbExkbGdKUGNRaHZ5dTdt?=
 =?utf-8?B?elZkQ2NFS09JSHlnd0lZQVFETWZFTTFEMDl2ZERadXlWckZ1d1hjMHBLMVNX?=
 =?utf-8?B?bHltR1VMcks1R1FKQjRFVVlrRlQ3MTJLaGpiaDBUaUpyZGtnT3JmazhuVDl1?=
 =?utf-8?B?ci9kZUREZThqOUUxd0NrVmpGMytuR09mY3hydFR0bFB5R2tiME83aldWUXh5?=
 =?utf-8?B?ZXNPQlA2Qmk5R3haZTZSR0FJQ3pSa21XWExhb1lEWlBydlNvcmZNQXhvWnRt?=
 =?utf-8?B?ako2aE1GYlJ2RUhWVDAveGRGZjRVOXBmc3hUcUhsUEJIOSt0czZPbjFFbGdJ?=
 =?utf-8?B?dGM2ZjU0UWh3NXJTbWNIQkxSNDlzZUFNWjlyY2ZaRCsrTWx5WG9aUHorN1R3?=
 =?utf-8?B?ellFNXZDMU10RlF2ODZaOUl4TDhhOVNVNDhTUXpXVE11NFFrZXI4ODJEbFdn?=
 =?utf-8?B?M3ZlbTlhTVpobmxqQTRBT2Ruem91SE5PK0RQakwrSEpiQUp5YTNwQ3loRHNn?=
 =?utf-8?B?Y2RtRzNGbnJKTTRNd3grY2JqLys5VlhrR1Q2b3AycHRYenc2QjZ4S2prZlZa?=
 =?utf-8?Q?I3bBCSvF8Wk9Nkzo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288ee640-4058-4031-086c-08dea75de42d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 08:44:43.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgtKeNJvZABA5Y1EFYezaymZDUhPfkbBae9bf2omwT64iulcAEG4VWTXPTAyVEGO8U2amozRn3rXWg8w472Kc+vqANgZlVeKS6A59+t5rBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6059
X-purgate-ID: tlsNG-d25034/1777625088-F4E06CF5-8434A334/0/0
X-purgate-type: clean
X-purgate-size: 1300
X-Rspamd-Queue-Id: 69AFA4AB1C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,vates.tech:email,arm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:Luca.Fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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

On 01/05/2026 9:42 am, Luca Fancellu wrote:
> Hi Andrew,
>
>> On 1 May 2026, at 09:40, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> This was caused by a renamne during review.
> NIT: Typo s/renamne/rename/

Oops.  I need more coffee.

>
>> No functional change.
>>
>> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
>> Fixes: bd0b3a876d80 ("pdx: allow per-arch optimization of PDX conversion helpers")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> xen/arch/x86/include/asm/pdx.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/include/asm/pdx.h b/xen/arch/x86/include/asm/pdx.h
>> index 6be7e1185eb1..6c10234ecfa9 100644
>> --- a/xen/arch/x86/include/asm/pdx.h
>> +++ b/xen/arch/x86/include/asm/pdx.h
>> @@ -57,7 +57,7 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
>>     return offset;
>> }
>>
>> -#undef PDX_ASM_GOTO_SKIP
>> +#undef PDX_ASM_GOTO
>>
>> #endif /* X86_PDX_H */
>>
>> -- 
>> 2.39.5
>>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks.

~Andrew

