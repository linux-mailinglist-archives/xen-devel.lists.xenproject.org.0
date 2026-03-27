Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDpmIkyixmnrMQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:29:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5EA346C0F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265908.1556641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w697H-0006ag-Gu; Fri, 27 Mar 2026 15:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265908.1556641; Fri, 27 Mar 2026 15:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w697H-0006Z5-EA; Fri, 27 Mar 2026 15:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1265908;
 Fri, 27 Mar 2026 15:28:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w697F-0006Yy-MJ
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 15:28:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w697F-000JKS-2O
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 16:28:53 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c6a230-5cb7-0a2a0a5109dd-0a2a45079dd4-6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:28:52 +0100
Received: from [52.101.193.70]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c6a233-fd74-0a2a45070019-3465c146d6b0-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:28:52 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB8113.namprd03.prod.outlook.com (2603:10b6:610:27e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Fri, 27 Mar
 2026 15:28:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 15:28:46 +0000
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
 b=TNt+7CMSYE8NYVtCYuZFe0PxRwDK2kYnB+VBEv3N5joFApC+noiIdpE3Gb+jX/skMhDIyi9WSR1jzsuUARb0oPnS8yg5zWXgphqerqwl7gVXQ9LNzZRAzhNMEm0rI7nI2nHpssaYBjEyUf3n85e4CStHRECitcdd5i2wzvIKEUlKkTjReyPj1uqAykuOrsSbRX/lEixIP4mg911PXLiJmlK0HqzhmPhjgVCv0H49NyFnw/xLpHdWTLPcD+xmJfGGzCvHsSXXPvWRqqNZThU5e/Gx+bu3efvJCbd6DRO5spa4aY/GUOA/ZHwqjkP+UilJZrmkQHNBhzLyHN6moJHkaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eki5njl91rCGqW7qNiThUEKlKFAvhE6lV+GEdJXtjDk=;
 b=ecE+T2vRDLo5zKaVIJ2J5f+UqAYmH0vQMhPPimnZMATZABmiT4dQLobQOlWyWgM7O/d+Un9Dar3v/B73aLAgeda27J+FnSIysABODAT1l+ZPVWqeS9NZs7ebnXeemDmUlMW7YYNFwtDGhLhBaynpqh4BT4DDjgIeqKF3G/+t+StByG3dXP5b07422XuDG80ZVeoo2dpp7utumcVzSc/m1f1Gwh5xq1t6UVKYS/u1aasrjzOOXoL35cgSdqTB2E0WfBNMqKzBDmL3BriPtD1zRw55m7NYNuuxQEJoW1Eb5LqFjfhb0NkTVyNt3bTqLfyR0oOcP9eINbYmR4m/Wmyd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eki5njl91rCGqW7qNiThUEKlKFAvhE6lV+GEdJXtjDk=;
 b=eFszoP8GMZLjIyOn4pZJOANlG7Bwtm+LWUbhZjy67kFxVgc+yARKStpvvOOkAm5FtABwvCev/7L4mXSxJqYO0xbm1SvrK1JLxCJGZ0j51lFpHQUZC33zz7rBwDgMDXlKVsoc/QmGb8m0Z3bW+V7/Zqo3/lzYGNUAUgVyzU5ibb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <78400798-1183-4edc-a32f-a6f0ef67759d@citrix.com>
Date: Fri, 27 Mar 2026 15:28:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] Config: update Mini-OS commit id
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260327151429.438096-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260327151429.438096-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::26) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 8426f5a9-520f-4cc6-2ea3-08de8c15895f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aLvUKNWM5WqI6VqTryyWA9YdC90OntfxspKAmzqU1sICARRV+ANMKMQxj0SEIjwdZnF7eBDml3BuVEzzTmncoiPo70CK8Gp69oea1XLVcbsKLbzwvvDGpc6HcsJmcdfbzgN9w9EP0EXol7Q4ofd7LYD4OXwv8bIkv9b8g8u4EXmoTMSnF/TeTR+TppcsaYtkgzN0tgo5c9cUZZMOcTlgduyOjjXz2RUe13MX+iFKJAs30MdgB3Hh+ViG73dntUUc94e2d1wWdv2WZmyqtOA4QnSvXDCbaj/WJqdsk962UB3xHBFDGZBWjxvmN0puPb2dFxsZzdNqX0cM1jm89TZOuI3YLP8yz6xxXGDmb5ZCi46mebzUbv2NHUMh3WaaVoWVQZ+/Q+Es9QMm4GhSxWv0aRD/Cznym9Oci0uSi4LZ9cu8r97pxGVBD1PM2rtnZQb8JaHDZ65ms2Vm6DnV1q2wY34F1kHyfb0OFCtJTmjI1ix4o3qNh21ruID9IP8MJorRZQ5uEV9CBHwxRcm73ONf0BK8vayBmrCvp+RozxzQP3Eccddvn3rq+xfgxhDqXIAFKc1Didmx/eB7U5J62T183+k+l47Zpx9t47nkZA/X5rXVfuj9nKTz2VrqxVxMQzWMDiHdbi/wWE55V9/sg3LWfABzCCQzz8k7XztWGcFda5ja/JYLN1IE0sfrJC/O/ars5tOemyjX0O4FeZhPWIK+U6d/IznbmJHluzkXUx0s3l0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzE1ZktVWVdFZUtIdWhiN2JzWk1PYkNZZGUxZFBzWGYyNGh6ckJFSys4T1ZM?=
 =?utf-8?B?V0srM1IwSzdUNGI0THlXM2FQUWl5ckVBckdoNUI1STlUVTRuL04yZzl1QUJZ?=
 =?utf-8?B?a3dpcDlIOWYrbWN0UDNwMTYrb1VrQyttRDNucWhqUlR2M21aZStxZGRrRWl0?=
 =?utf-8?B?bGdRU1VxN2JwNzRZNmxWcVlMUjdrWmppcE5yaGtuM3NPdzh3ekFPM3RSMnl6?=
 =?utf-8?B?TzR2TWdpb1ZpVUt1alFoaWZGLytqZEN5MFduV3lYVWpZRHFFUEpoWE5aaTh3?=
 =?utf-8?B?NGllcjY2OHVhQTlibkk3ZkRZUW5aTnVvWmNkenJGbVViMFAxVWtQZGRzNW9k?=
 =?utf-8?B?UHAvU2RsVEdXT3NGZG1SdDlMUlYwU0gxRFR1NWxoR01VN1l6TlZjUXVIQ2dM?=
 =?utf-8?B?eGY1WFR4MzZ5VTF4NGtWeEIrV3I1UmlwaVg4OVVxOUV3VzhQbHBiMkkrTkQ0?=
 =?utf-8?B?VXdDUW1pVEFod1JCemljNnVTYysrc2dTZTdONzM4ZGw3SnloTEpHTURKTXg1?=
 =?utf-8?B?UUpwU1IxMGN4RGcyNE5WSk5WNGNZdmRJbnByLzFIb1UwT1FuZW5QeTNSQ29w?=
 =?utf-8?B?czh1ZjMxOXlEWTd5RmZXbUd3YUp0eEVyNFZOSW04dHpreWo0MW9kTjRPL3lZ?=
 =?utf-8?B?eDJKczljTUZKWGdnTTNsci9VY3orTFpTVHZyaUtGK0FzLzAwUEtuV2Z0aHl4?=
 =?utf-8?B?RmJ2RXVSQ3NZNEJXWFV0eHh1RDVUNjdCU0dXWlZKMmx3SGtCRDQ5eHkxZDNt?=
 =?utf-8?B?YjZnWkRqQkJDb2E2MVJoYVdXZ1ErTGtRdStNSGpiRE1rZ1lwWDNDWjdtVjQ2?=
 =?utf-8?B?NVlSUWZBTndlN1Z2RGM1SkFSVGZyRTRrS291VThjU1UweE01QUxzQTRacG9B?=
 =?utf-8?B?b2pVeGJPbTRNemNWNG1ETHMwK01xMnZuSWltTjBrTWZvNWZaVnh3STF1bnpS?=
 =?utf-8?B?a1paZCszRWluTFJNUGM1VWlKSFBDd2lRckJ6bk04QnJpWGlRdzNMck5EZlRy?=
 =?utf-8?B?K0xYeHo0YTdMOHpzdTdWRWZaeDNvZ3loUkFlaGV0ZGVjWlNieFY2MEtFanB0?=
 =?utf-8?B?MXRJNHp2aUNXTjhNOUlRNnNGdXdxY2k4M2FHUlN1WmIwYU9OY214TXRZSGxa?=
 =?utf-8?B?TjRhb0tndS9wYUtjRktCWFVZT2h5d2FBRTB6b0NXWHE2ZnhhQmtJQXhEeWxB?=
 =?utf-8?B?WTY2ZXVXalY5WXMzNGhBZVNaRXhLZWlNaW9pek5JMUpDdkRrWENlYVRXOU5l?=
 =?utf-8?B?cENtYVVvY3gwZ2ZlWnpuUENUSUJ5NFhENEdlWXZzYnpVTjM2Q2NsQkdNQ205?=
 =?utf-8?B?YmZYMU50MDFmVWp1aHd0U0xJbjh3WlhYQ3c2T2dHdUt6NWZhQjdpL2kzblhj?=
 =?utf-8?B?Sml0SEtmOWZFNTJvcWFKYzF5cVMzNnMzc0Y5YVRiM1Q1Z282Z0d2RnBaRndt?=
 =?utf-8?B?Wng4RE4zSUs1KzdqR2I2MTdvMVoySW1DWXp3dW1iSnkwKzdBQUZob1N2UVk0?=
 =?utf-8?B?dW5HSUhCa05IRkhQcDA4K2E1V2pQekdBNVQ3aWM3bS9NdFVGVWdLcmliRzRq?=
 =?utf-8?B?VndSNi9TMkNleDlrdDlOUHNQNDNRMnJGKzd6Z0pUYlRlL0xRTzZkM3pPZEU4?=
 =?utf-8?B?MHVOaG05d0l4ZHlSME13TDhRL1A5aEc0MnhMZnQrZTBxdE1mOUI0bUR2eWF0?=
 =?utf-8?B?MkFOWUE4Wi8wZ0VHTUNOdWVOWjdaSUtFVnEra1c5eEhNbCtYcGZ0U3JkbW9M?=
 =?utf-8?B?YlJIeGhQbmtzRUZzL1l1b3pQeS9LdWxsdjA3MjZKeUQ1MDdGa3Z4Wk9BNE9P?=
 =?utf-8?B?MTIrTkpJNGVGNytQdFhxR3c1L3QzNkF0YWZiVmY0YkoxYmdMSXVBR0lnQTJY?=
 =?utf-8?B?YW1pUlh5MXVjVmNXUm9paUZHc1JzVVhtQ0M4NTU4ZVdDUE91cVRQQi9iSGpo?=
 =?utf-8?B?SURhb3ZOaFcybWRzTU9kTkJmdFIvMWRKMnQveVM4VkNxYWIvMVFCQUJhRHNX?=
 =?utf-8?B?bVdjSTRwclFWS1IyVG52VTVvZnZGT1EvTEN3YU5xMGJMRFVyK3VOUkxKZlFl?=
 =?utf-8?B?UlZtdDlFMmNpeUl5dzR4V2pyR2RyY0drd1lPeEVvaHdaZzFtT3JDTk0rRXFp?=
 =?utf-8?B?TGg4MUp4UGVuUFZ5dmpmVUtXc3JhY0hHcXZ2U3RZb2pSUFlTZlN6Y3puZVQv?=
 =?utf-8?B?N0xIajdacVFQcXBEVG54aHYrUk5iZkhvUEU0S1JMNDBTNGlxOVVhYzh1eUJm?=
 =?utf-8?B?U2kxeS9lQ3ZoY3Z4d213WnBjd1BUTzJobUhvQWdRZFhYUU5OSkhtak5KZzdS?=
 =?utf-8?B?WmF2TXpwV0pIWFFNbjVPM256aGdQUjhoaU5BVENneFJjOEc0WW11dUxlMzJw?=
 =?utf-8?Q?wSUeFKndNGYecNy0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8426f5a9-520f-4cc6-2ea3-08de8c15895f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 15:28:46.2419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlxKodtlMjpJJDjaAwNb+o5efI34+oxmH1mfvtBuUxfpkspemgVVaCKtKfy72YaTKz3Q8OXDTrffmQNqnDQTJuYv17Q55+RkDBZK++vrPLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB8113
X-purgate-ID: tlsNG-ef75cf/1774625332-4DCB2303-0F664B84/0/0
X-purgate-type: clean
X-purgate-size: 180
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB5EA346C0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 3:14 pm, Juergen Gross wrote:
> Use the newest Mini-OS.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

