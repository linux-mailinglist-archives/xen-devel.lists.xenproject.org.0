Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCXTDyNq+2miawMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:19:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664CD4DE019
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301913.1576034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKexX-0003cn-FW; Wed, 06 May 2026 16:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301913.1576034; Wed, 06 May 2026 16:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKexX-0003a0-Ci; Wed, 06 May 2026 16:18:51 +0000
Received: by outflank-mailman (input) for mailman id 1301913;
 Wed, 06 May 2026 16:18:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKexV-0003Zt-SC
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:18:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKexV-00AEYn-91
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 18:18:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb69da-5cb7-0a2a0a5109dd-0a2a4503cf76-24
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:18:49 +0200
Received: from [52.101.85.69]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb69e6-672d-0a2a45030019-34655545f4da-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:18:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8437.namprd03.prod.outlook.com (2603:10b6:408:375::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 16:18:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:18:44 +0000
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
 b=zAjHb9zedqqt2duLTTiiHzfNx6x8c8uBYj8/O0MtLQDnHf1uNLt2ratVDVU+F/eCA83GfwSbiGVQgi3EhyNMXYI9ClOXL6NMfomb4Nf1lxpMSYhLc4ww0tfk54nz9rJg0qFMEfD7REopCr2E2iX332BCtrT1d9DHKzn5B953bM+Ms4xoUC9QQIPkOvbS3GDqmk83RUIAGNUCNk9iGLITuaV5vZINLipG3ziLmHQmw56G4HYmARqkdmP8UwffNDiYCRec9lk9SOYW1HK1j4nGiRMizHbHzmciIa+doL2RWe/i662HCPlW279eEOs7VRLB/vv+we2+gnxI1yCObn25eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6j8AaLsuLmDxHw7LsfCS+KnZKihxmmrdw4+EIumcCk=;
 b=t27v6U97BFmkvBv7D2RYWEj9QHrPkdp466+9FNxDPYpQ97eo0Lf7QkM9lp7xukc3rUohqpXzO479jIPcl357SXqrl78e7qAV0qjArSOvTl5S1n8qAX/gAh3oyrPT/T3Cn5Bz3QOpFvxKxzg7rJbMsrG4ZX7h4NFDNx7rgXBt/8PIjh0Gwy+SN7A2f+coK1NqQSRb3FCvvGHEz7UFzfN4GkQgiQ3HE2TdqhiCZlcUWgkjNXKRRO0KPreN1WXl9JjufRTUMK/CArCf3n8A5yK+esAuVDLfr0GLQ5E6/rkOrXrPlF5HZotiITHhMMF8A06bcAbb8oIQt9V+rNNuN0pnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6j8AaLsuLmDxHw7LsfCS+KnZKihxmmrdw4+EIumcCk=;
 b=cPWDANbQhwnKfNsG/LgP03iAOONmWzKZ9e/jbariFsxeD1PwDVF8vnuiqPGJv5SyPsz2wzIrNzd55L1yca4oEF1yxPB9rUVq1ykrB0M2WEDn9aEoPCNExD5u+JjmtC4ZRmobHiNIKvoWFHl+hxq6eOFcbBo7SDW8VHA6KPS8pDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5531fe94-6200-4f7c-9c22-e09189438e9c@citrix.com>
Date: Wed, 6 May 2026 17:18:40 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260506135514.47310-1-roger.pau@citrix.com>
 <20260506135514.47310-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260506135514.47310-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: b94d1113-8d39-4287-e52e-08deab8b24c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bx1p6fNhhEWJPt3S9nhiJ3Cdkc5T/KFFAXKTitGvFn8JNonJmtvMMWAAtpB+hhpwzmh5FsEsHxTkha4ngpNkDU0pgIZdEvBEK/ovSWF5YOE7BHy+6oaN7mhTyq6DD8SGkatJoAxz6SrlJ/xGtUIL1atkwijhgHcZjKw725tm0mfLUZI5v+cchIGrjMYN5wG4cJncH7qNY33InxorYRi9n01pGq1ygihlwXrW826sLIg0B/bXMtDT45e/ZMyhEwo8nERu5QapCshSp8deZ+H5gYpm0iAoZ3EM3LMVfUnhznEZzE8/ec0vvCFxNh9tgieGgHlhe7hqgOjEqMlhFrTb5lqc80forO0ufFFNCRtK9trlbffp2xgNlm28EbMVQHArM79cFF3zbh8MIrx3wNZJ0goHZkwJZC+qi2kHUAB5lFRjERE5Lp3DnlEa5173HfNuX73eMedQ6w4lvyX5rWQkTSF/LOz4Ow4X4xLhobRicfvJrJiygjO9eIKCY+ffNzJ8oyvQ9EYR0MkBGPZkm6i2oaNoONBaD4r4Zqzw8aDdDDxMYKKf+OGCYybyQ9qRdLqASYADT41xBrVj2GUzTP/YJpLoorLPJaGwiHrJ4rqLJ+1Ztk28qd7va9J1wK4Mk7b+he4ryD2Z0h4rg+XmyLRiuAxLIZP2aIPFqI36kKgFFN42txtdc/3d22sOo2krsm94
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnB0L0RrNEZKTDlOaDk0eE9wSDF1WFA4M1hmMGpIOHVqTXFIWXhGeUZvWUJC?=
 =?utf-8?B?WE9wSksyak1nL1BkSkhBb2RCMmN4YlkrSnZtT0gvWlh5d0xiY0Jjb0hpYkhL?=
 =?utf-8?B?OHBQOTg3aFVjMStOSlBSWE5mdWZwNm1zanFhS3hxdUkzcmFDVGYraUJNLzhO?=
 =?utf-8?B?YTlXWHpVRTdjeTZ0ck4wWU00RkhaZVJwVU9tNVNQZWUzSWZ4MHlYQVo0NExu?=
 =?utf-8?B?ME5remlCZkp3eUhZaU5EMlRLbldQdnNLSktWVXBoVUNHNG9ZSnpDeXlTK0dh?=
 =?utf-8?B?MFBjRUJJVEd0K1NweGI3L0ZDaVczZ000dXczUWhZWlhOc2RjWU1QdHJqNk5l?=
 =?utf-8?B?RXpPMkd4VEI3ZllkQmJETkg2WkhtOS9QRTU2Q05mK3FPR3pweEljNDIwL2Zk?=
 =?utf-8?B?cEhsSjAxN0t1a2tJYm5NaWpLQ2VESlRSR3U2QmNUaVoyNStkdk5qVWNoUmdV?=
 =?utf-8?B?NkFxQWVZc1cxc0tsajJ6dVdBcEZyY3ZhRDBmMFlya1hLbVdiZjhGRG5yak0v?=
 =?utf-8?B?UUhZTTRIRmY3RHZzM05rMExkdXNIaHNQODI0ajhNc0VjNmZ0bnBldHZtTVBW?=
 =?utf-8?B?bXVkRnlHazNqVkoyVnpvYnJVQWNoa3hMUGtTTmtDZGhINy96THIyMlhOMW1L?=
 =?utf-8?B?WEY3UzhKSFJ4OGxKNC9ibFhZaEVDL2dRS21lTWRoSGRmbFkxbHMwZzVFQzNU?=
 =?utf-8?B?TE9wY240dWZqNTByN3V0RzdCZ0FtaE9MVnhtZ1BWQzNZQmNTeGtHNFR6V0ZV?=
 =?utf-8?B?K1dzSkVpTUF0WldnUmtCTE16dmhpUnFmQm1xMDAwQjVQMEttM3VSVURqeFcr?=
 =?utf-8?B?eUtIMG93eDV5UUVITXZJcFhtdkoyQ01KU0VKdFJnSU9yZjZNQWZ4aWFXWUh3?=
 =?utf-8?B?Wjd1bi9oQ3Z3V05Ic3l2UVRSL2pwSW9xTHc2YVBhaDZtL2MxOVlrR2xOd3hF?=
 =?utf-8?B?anBkVzFmWlY5TXBmcUpKSDFHN0pmYUlST2hFeXJRYWtSNGVaUVFTbEgvTVlm?=
 =?utf-8?B?dTRwNFVVYmFXZkdiRTJOMzlrK2xhM0RNK24rUXlKeURxUzdnTTlOekNUc2Nm?=
 =?utf-8?B?OVp5a0hJTWNIY1Q1VEp3MzY0K2lqR2RTRVV0N2RqL2Y3NHVpcENyQ0JVUkw5?=
 =?utf-8?B?YWY3UXpoTTBra3NrVGpEbGEyNlVZdk55elc4VytKQTZHYWxnZ0dKbmZwRURw?=
 =?utf-8?B?VjZrcW95V24yOThvQlBXb0tub3NVR2h1TGFrL1VhU21ZUzB4TnhEU3ZadG94?=
 =?utf-8?B?bFVGRmxtejErTFZLNkdlcGp0eU9XRjhSV3M4dld6LzZrQVVyczNSMkZWTHIy?=
 =?utf-8?B?M0Y1OG04R1QyM0tRWHM2eEU5eWs3RVR1ckFZcktQNThQdEpVa0JZemlFaURG?=
 =?utf-8?B?QzM1bDkrckorU1gzOUZsQkJqRlhLNlNyTXBFelZrQSsraFprU3Z2aExxQlpG?=
 =?utf-8?B?c05LYk1zN1VHZ1ROczNVMHV6Q2pMR1NtNXBmYzZSOXl6alk0TUVyN2dVSkFm?=
 =?utf-8?B?K29NemlaeHlLK0psMnp3Q2YzNzBJWkhJSnJtZDhaMThPVHd4eU9BakVmNXhq?=
 =?utf-8?B?OURsbU1vUVJGL0c4MTFvL2E3eEFsYlVQNDZZRkJXNjhxaWltRmppbVUrWURa?=
 =?utf-8?B?bFRsRFpTdEtrd0o2bnRLYXVSNm9ybDNzQmZORDV5TlFaQWZ1bDBpYkRaVVZv?=
 =?utf-8?B?TllzYncva2hiUHFLMDd5QjI2UmRBbVRoa25RdGxMb2U5aThMWWRiTUY2eldN?=
 =?utf-8?B?RXMvVHhxT1R2TTZjWUhCWThKS09nN2hBcWFET0V0K2s0VVdpUEtWb3dnNkhW?=
 =?utf-8?B?UmJ3VzIxS3lZQVI2SnI4cGw3WUt4ZUhoNlVReTE5b21NYk9DNlhoZHhoeUJw?=
 =?utf-8?B?R2lPMG5ieUdSRGhPRVhQeDlnK1B2Z05GVnFMQnlSK012SGR3Q1JJbHFXeWw1?=
 =?utf-8?B?VGN3RGRkWXN6NzBlVXBuTGtYZ3RIL1dNUHM3aEdqay9rSXJrdWN4UWxOeHVM?=
 =?utf-8?B?NmtkMjdmRk1VT3ZFZDVFREdRNUZOaSt3N3ZPWW9oKzVoMVhhcCs5NXJNVmdx?=
 =?utf-8?B?SFpkS0wzWEVPT05MeHpwd1o2RktCU2dkV0pKUk5mTjZrbk03eXFWTGM3TG9w?=
 =?utf-8?B?bVlWRHhaNUp1SnJHMkJ0emM5ZXF2Z2UvYURnU0oxYktPYzd2dnBtZENINy9C?=
 =?utf-8?B?SDVxaS8zSjBQT0d6cXRLMkJFVmV0TXNxV0lBczZ6eEFKWnNrMEZ0UzdmcEtZ?=
 =?utf-8?B?Z01GTjh1M2FaM21IMENHdC9iMnF2cVhtRzMvVVZhU1FOSVc1UDZJVktyTGZE?=
 =?utf-8?B?aDVML2ovSUtZMXl4MEZ6VU9LUDZlMnlUVU83US9HcUo0QWhGV1pWOVNZbUZH?=
 =?utf-8?Q?mzCda/YDQe5jotZQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94d1113-8d39-4287-e52e-08deab8b24c7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 16:18:44.0213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiSJlBPhK+Z4R6WGZOlAdk6USRs0YsvItrYb5pjUDCQDkmR2uswEHJh9P+RoRdPX2U9YwgJ99hshZnTFuOb7Suy7+kCr65/SvqJqJanOQCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8437
X-purgate-ID: tlsNG-33051d/1778084329-4279C938-E36EA754/0/0
X-purgate-type: clean
X-purgate-size: 5150
X-Rspamd-Queue-Id: 664CD4DE019
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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

On 06/05/2026 2:55 pm, Roger Pau Monne wrote:
> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> say the least.  We don't know what registers might be there, nor which

Sorry, one more.  "We don't know which registers might".

> values might be safe for those registers.  On a forthcoming platform doing
> the zeroing of the MMIO region does put the IOMMU in a broken state, which
> is not recoverable by the IOMMU initialization procedure in Xen.
>
> Instead attempt to forcefully disable the IOMMU ahead of enabling it.  Fold
> map_iommu_mmio_region() into it's only caller, as the function body is just
> an ioremap() call after the removal of the memset().
>
> Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Zero the control register after calling disable_iommu().
>  - Print a warning message if the IOMMU is handed enabled to Xen from
>    firmware.
>  - Fix commit log grammar issues.
> ---
>  xen/drivers/passthrough/amd/iommu_init.c | 31 +++++++++++++-----------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 76ae78e5ea53..ffc041211fb5 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
>      return iommu->ht_flags & mask;
>  }
>  
> -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
> -{
> -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> -                               IOMMU_MMIO_REGION_LENGTH);
> -    if ( !iommu->mmio_base )
> -        return -ENOMEM;
> -
> -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
> -
> -    return 0;
> -}
> -
>  static void __init unmap_iommu_mmio_region(struct amd_iommu *iommu)
>  {
>      if ( iommu->mmio_base )
> @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>  {
>      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
>  
> -    if ( !rc )
> -        rc = map_iommu_mmio_region(iommu);
>      if ( rc )
>          return rc;
>  
> +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> +                               IOMMU_MMIO_REGION_LENGTH);
> +    if ( !iommu->mmio_base )
> +        return -ENOMEM;
> +
>      get_iommu_features(iommu);
>  
>      /*
> @@ -1381,6 +1372,18 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>          return -ERANGE;
>  
> +    /* Read current control register and forcefully disable the IOMMU. */
> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> +    if ( iommu->ctrl.iommu_en )
> +        printk(XENLOG_WARNING
> +               "AMD-Vi: IOMMU %pp enabled by firmware (%016lx)\n",
> +               &iommu->sbdf, iommu->ctrl.raw);
> +    disable_iommu(iommu, true);
> +
> +    /* With the IOMMU disabled zero the control register. */
> +    iommu->ctrl.raw = 0;
> +    writeq(0, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> +
>      return 0;
>  }
>  

I don't think calling disable_iommu() is a good thing here.

It's just a cascade of clearing one/few bits in ctrl at a time, but is
is added unconditionally so that's 5 UC stores writing 0's to the same
register in the common case.

I think this logic wants to be:

@@ -1381,6 +1372,18 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
     if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
         return -ERANGE;
 
+    /* Check if the IOMMU is active, and disable. */
+    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+    if ( iommu->ctrl.iommu_en )
+    {
+        printk(XENLOG_WARNING
+               "AMD-Vi: IOMMU %pp enabled by firmware (ctrl %016lx)\n",
+               &iommu->sbdf, iommu->ctrl.raw);
+
+        iommu->ctrl.raw = 0;
+        writeq(0, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+    }
+
     return 0;
 }

 

which has the advantage that it's closer to the current behaviour, and
therefore arguably a safer backport.

The only thing that disable_iommu() does which isn't editing the control
register is playing with the PCI MSI enable bit, but that really doesn't
matter when we clear ctrl.int_cap_xt_en.  (And in fact, that path is
buggy because it clears MSI enable without inhibiting interrupt
generation, which architecturally will turn into legacy line interrupt
to deal with.)

We're just about to re-set everything up, so everything's going to get
re-enabled.

In the commit message, I think it's worth highlighting that zeroing the
control register is the current behaviour, and this will need revisiting
in order to support Preboot DMA Protection.

Or alternatively, would you like me to submit a patch?  (Happy either way.)

~Andrew

