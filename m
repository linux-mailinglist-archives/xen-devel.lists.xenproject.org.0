Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pw78NUH1PGr/uwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:30:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6226C43DA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:30:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=OB5WoHEM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345365.1604241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcgP2-0002VU-L7; Thu, 25 Jun 2026 09:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345365.1604241; Thu, 25 Jun 2026 09:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcgP2-0002Sh-Hi; Thu, 25 Jun 2026 09:29:44 +0000
Received: by outflank-mailman (input) for mailman id 1345365;
 Thu, 25 Jun 2026 09:29:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wcgP1-0002SU-Ac
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 09:29:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcgOz-001CFf-SG
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:29:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3cf502-2eae-0a2a0a5409dd-0a2a4501ed64-2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:29:41 +0200
Received: from [40.93.198.27]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3cf503-400f-0a2a45010019-285dc61ba42a-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:29:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 09:29:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 09:29:38 +0000
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
 b=U+dQQTjXIrohtuXesjJ7bIEm1wetP9pFcOuLQ9Riwa2NKNG0MmoB+92ouPb1LpXGwawtNmTCEp9F2xQIxpaWEEOUk/JX5O3lfdcSzg75GBdbrE8PR2ftJzq7/UO4wiBkTla/dcj42C0ybKQAo0TFvjkSaC7tEc2c8BHAEmj6k6nsM3xXa9K7tABcZ15/AkN+VAuq1VwZyF8PTtR7S+y4tnCn+DFivf2gOUsxSxDKkiumZkaNqom3ZkJUqNizNXRdzuhTV8RqMOUdEVVAEs99X0xPKFI68DfogT+NOdB792rQeYMV9NvQMpCzYkBdhMvKMaG8K4TbWgjtNJ+ptw6XwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObFmv7ukD/ytY4QYdlcOaLMOBt1q9mOUfPDRFbT6HHs=;
 b=L7fINXYbK9btdFWIOvwT6cIKMIO3JRO3yIcsSJR1aT8nTi12fX9p33voCf1CPO5vEArS7qQeW/AwyxbjJlFrQ4P+R6342MCoUmyTDTNlucnUxDhQtrulsaahYZZBmDYg4rlsJ7Res7o+AvpunbnBb/ZYKHmM+LX6XW+XRVMkUBrpQBPaahVrb9g2U4i5KAs+P17tYQX1cKO0I4Q5tCLs1gU64chYMrajIP8IUjcqMzn0OIgOqvlea/2tzRTM2ltszSRsl5/M/LdPZGKolRVi/NmDvnqmOLyX7Tovok2FSFdoQYgwkM5ZFVK2Vgxt2o6tYHFhxbO4ZwJnRt132YG9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObFmv7ukD/ytY4QYdlcOaLMOBt1q9mOUfPDRFbT6HHs=;
 b=OB5WoHEMrgGv9mX6gW+zMcD6HOI3MyCgHrDgaItvqNel+e10QWJerVKQlATa6hbbRsztoiTvxeCq7Q3VgCXMxmitKxKme6sirLpJr15K4f/CbRJ2782vybY80aF/I1M4gjLka8BIBAdUMUk1iy+/BVV5BbT6M8koSB3xYg1eNZo=
Message-ID: <e948fabf-2b31-4404-8a35-da01717adeca@citrix.com>
Date: Thu, 25 Jun 2026 10:29:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22] x86/fred: Send an EVENT_CHECK IPI on exit from
 NMI
To: Jan Beulich <jbeulich@suse.com>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
 <0e964293-5b38-4f80-be78-bda76706d0fe@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0e964293-5b38-4f80-be78-bda76706d0fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5103a9-86f8-48c1-5b79-08ded29c46f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LCRP85qtPnAuWzcabUBgLQ4KC1Eg/y13gV9QITXo1tMc99QlamdbvLTNwbyLzyRaKBZ58P16ToHQpeJC+3vyDcl+kCJSToO6tcMtHqmQQfn7S57Yj/FB6CJmFUgvYCPorVbOccBiVYRF6dvwFigahNR6brOd9785tc0B4cJGrqZVTyNfCwtAYmExtSQoDV46T0knzy/AM1VTAmVJEsrne19qQI4OnFTnlILx5Y69qYf36dm4lI8n3oBjBu9Pg/x86xqi+W3f+tPk/fLhYJk+zRG3y4dt6Ois80oGPjWIwodn9Wrph4cxSDOwYsDIiogdoje89LCNqoHxB8CfuShsMuj5cAHkADpj1Z6MIZuTU1wsQ8chsrzvv5KfnNwMzMtEv+dLddlJ6Wt0/5EimEnHe4ok5FW/Ooeo5qEcWirxbkwrk+m/P0Bdl1Hy/JZMdHsG3xXqJfxd3jOTioRG7UjL/gwgBw0d9MzQF+1jKtHGwgKIpAHzzrnoaLM0QAYmLloOeMGNmq+FeqbIlfzaWHPHnIleAtocTkFJCqzz3iiqrGgq6h3Bwe9jxTt7bBF3FS3RhN0kCTQ7gDG/D6ZHsuoB2quQ3uRdQLy/65wDvV64saSLW8so+/85DYOVRoUcGPrc+vdAEnqTWgVXiw3M3a9ubwlBJpL+oPszk4bQbsyXc4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjBQY3h2NzhGQlowNmhiSC9iUG1wc2NRMFg2d0Nwc0lDTVpYRDFpS3hOc205?=
 =?utf-8?B?TzZKbmZlR0RvQ2xCa21rL3o4TUJiLzJsdDZFbTh6L0dqa3BDYjNkczJMZjBS?=
 =?utf-8?B?SVpoQk5uYThQT0twWXU1Tjg1dXhRYWc0anRwQUY2UTl3ZmJRWGw0aC9UNitU?=
 =?utf-8?B?SmxCSC83b3VvVlo2V09Ra3l2S0h2bnNSOXpTbkhJOUNrMDlhSzBEOElQaUE5?=
 =?utf-8?B?dmM3aGZvUUxnTEZrWjZUV3VxY0w1QjZITkh3ZjhGcy92MDN6VzBId1k1RmZL?=
 =?utf-8?B?dmMvZUwvYjhLbUZhYkJRNDNKbmRTQkphQWJONUJLYVROSUVvcFZRQVB2eWRX?=
 =?utf-8?B?enhUWDUzUDdYcWRFMTFoUkdOUW9TcmYzeEw1TWdPYUlGTldjK1lpY2xUMElR?=
 =?utf-8?B?MXo4b2pkdDhHTUVocW1nSmdYd3NEYzJYM2M2RTBIZFlSNCsxcFV4YkRlWU56?=
 =?utf-8?B?OVQ2ZVBCdXBZOG5YRDFzdmsxcW45dUtQOUMzVlpCTmN6OE96Nzh6QzF6UjE4?=
 =?utf-8?B?QXVZNnA2ZXg0eERiRHFoNWJXaGM1enV3S0Q5VXlaMFJjVFE2K1NxUGRZVWZo?=
 =?utf-8?B?aXI5RXRKcVdUSmtRL0UrUUVnTGZmWndaSkJ6OUc0WmtLOFhLNWdtSmJWWEJX?=
 =?utf-8?B?ZGQrMVRoRkgvNWZnQlFsdjhlTzZZTnNxSlhDS0dydXVKNzVCSjQzeGhiVldj?=
 =?utf-8?B?RlB3YjVPcDNjOFM2OGhtS2d5Rk5CQ0ZtSTd0ek0rc3p3Z1QrRHUxVHVZREI2?=
 =?utf-8?B?c2tUY2g0aHN2dnlVc3pyZ1d5UjE5MXM5aFJ2bGVYeWhGT1J0VzBhMkxpV1cv?=
 =?utf-8?B?RVl4M3p5dlFONXQzTVVLdjFya2JXZTBZT1NTRUx2MkEwOUVjekF0WnlvbC9s?=
 =?utf-8?B?bmM5dWNrUXUrTVZSWldKbXRxSGJybU9OdXBBOWsrcUMxaVVCaDJnNTY0emp3?=
 =?utf-8?B?dEF1ZWt2SEJZRDNmeDJPRHJaS0ptWnR4VWNIOVpZOTVLckhXV2RiZjlEcnNM?=
 =?utf-8?B?R2lRa20wVnJxN2hOMFdETE15Qmw1Q3I3V2k5cHRnbjBWMjJLUURtL3ZXUlE1?=
 =?utf-8?B?eVEwcVlaNmhyOUdFNTRmeENKODhjNTMySGVZRVlvUTRkR0hkVjBGcjRmTS9R?=
 =?utf-8?B?OVZkdjA3MjNxL2FMQUJJRUVWVWg4VXVGbDBtSlkrRmZEZW1VTGdSSWtKVEQz?=
 =?utf-8?B?Q3JGQmRsZTJSSUlBako4YlNWbTFVNS85WnZpQ1ppOFlMVDZGTDZpN08zR3ZT?=
 =?utf-8?B?NE9XTkc2N3JLVHl3Sk5DUzZyLzl6a1J3T2poc1hSNnhKVmMycWtRMCtsZjQr?=
 =?utf-8?B?TGhkN3pZR2xxVTM2a1VDbTZzbFhwZ3h2cnhYOTB0d0VXcVBuQ08ycG4vNktP?=
 =?utf-8?B?UjVzSWFmNVlmbVhUend3Q1ZTWjdBT0NicTJHcXhPdTZoN2xYV3NUSUttL0VK?=
 =?utf-8?B?ZkcxZUZJR204VXY2aUw3a05MNHpxdkJhY3REMHBITCs3bnIycE5aOEg3clM0?=
 =?utf-8?B?ZzRFVkxZL0RZTkxFc1JqRTlqMlBtOCtDRVU4OE5qK0NmWDdxdTExRHlvZ1l1?=
 =?utf-8?B?OE03Umg0UXBZcHVaVXJjd0VkdGwwLzNSeWkyVmpla1N3WlNrL3Avd0RDbjho?=
 =?utf-8?B?OW5GOXNUa0UrQjAwZFpSd2MrajlpWDRaWXJwUnIvSkplVUd4OFc5QThad2ZG?=
 =?utf-8?B?ZTJ0Ly95dGEzaVBzRzNNVENGV0NEOE5rUko1UEFSclZpZVYrMTJFZVlNYUVI?=
 =?utf-8?B?ekVCVVd0MmR1UGZlaysrQk1kYkFKNS9ueEdmTHBVYWxEOG94bzFoamtLcjBG?=
 =?utf-8?B?Sm80cXVZTDFmeU92RnRoaFZmYzhhb08vVkplV3FnU1dNeUErNWE4enRwWmNG?=
 =?utf-8?B?Z2VnQnlGcG5qVkpWNDZGcFRoN2dlV1FQYzlicndHemdNNFNiWFNlTXA2SHkv?=
 =?utf-8?B?QUc2KzNNUUVENDVabm1oaDYzMXhGK3JLM0dPY3NJa0R4R1Fua2t2Ymd5cnJs?=
 =?utf-8?B?Q085Yi9CaUVRalZaRDBpa2QxTTc3Wmc0QjBqOXR5ZENYZmV6T005UjBJR2g1?=
 =?utf-8?B?QXhpc0RzbG1qamVvSUFZU3pTWEI5N1RWZTZ3U1UxNEJMTUJpNXg2L0tJVzJo?=
 =?utf-8?B?NFVYd1l1eFdiSTJ1Y0tkRHFFUGowTk1ZSWpILzBaYUF6aTFXS085SGVvRkVw?=
 =?utf-8?B?ejQyQU5WYmdQdWdpbmUxVHM5Z1hPb2FrM1Z0R3hWRmVTaGZ2QnhYcHlWUU9N?=
 =?utf-8?B?dUhvVXJkNVZhYkxjUjVlbmRnUzY4aENwWW43REQ1TGVWa0E1QVZJWSs2YUJL?=
 =?utf-8?B?YkVXMTZLL1F5ZTkwdWE2RUIya3o3VWNzc2lyei8zdGlhblpDbGU1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5103a9-86f8-48c1-5b79-08ded29c46f5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:29:38.1391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RM8MdWvMTI0DBLmhC7d7TEli0qvKj3q/PDZXTU9tlQB27ZZfHeF1rsMmDFH+44fZi0/Lxzb0YEmS+2nXdJ03zoyCiNIeyDz/j5TqJsjdv98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5227
X-purgate-ID: tlsNG-d62444/1782379781-824C21E0-FB0D6AAD/0/0
X-purgate-type: clean
X-purgate-size: 874
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
X-Rspamd-Queue-Id: 2C6226C43DA

On 24/06/2026 3:43 pm, Jan Beulich wrote:
> On 24.06.2026 16:23, Andrew Cooper wrote:
>> Returning from an NMI which hits guest context needs special casing in FRED
>> mode just like it does in IDT mode.
>>
>> Break nmi_exit_to_guest() out of handle_ist_exception(), and use it in
>> entry_FRED_R3() also.
>>
>> Expand the comment a little, and invert the conditional jump to
>> compat_restore_all_guest() to avoid needing an #else clause for CONFIG_PV32.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> provided of course ...
>
>> Slightly RFC, not tested yet.  (My AMD system takes an eternity to reboot)
> ... the results of this won't prove it wrong.

Testing is good.  We now get core register state on all CPUs, rather
than missing the ones which were in guest context.

~Andrew


