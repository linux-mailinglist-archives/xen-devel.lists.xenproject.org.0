Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CbEAJaQ8GkOVAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:48:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D62482ECE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295580.1572242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfzX-0008Eg-8X; Tue, 28 Apr 2026 10:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295580.1572242; Tue, 28 Apr 2026 10:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfzX-0008CY-4b; Tue, 28 Apr 2026 10:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1295580;
 Tue, 28 Apr 2026 10:48:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHfzW-0008CQ-3Q
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHfzT-00GFYN-GN
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:48:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f09075-2eae-0a2a0a5409dd-0a2a450cd162-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:48:32 +0200
Received: from [52.101.52.1]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0907c-62f1-0a2a450c0019-346534013a11-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:48:29 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB4945.namprd03.prod.outlook.com (2603:10b6:408:78::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 10:48:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 10:48:26 +0000
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
 b=b3BN/R41B+IyuCmpSm6ilzIHH5qZkYlcdDL6AhRu4JqDr4Xd/lWuujJDUs2iScnIpUhIAwVwHbRB/RhfaGthN7k02shJQLvA1JZx58Z5t1eIwxuJwTPBYc4MRhkOR8FCOLwQz6e3r8MO+/Pk26ql7nGD1avsj39rd0fDoLzBcGdL8nMdVedjzrwYUURBBMe3pUSiQ4WMZbAaf/L7gDDWEKiM5Rmg2nHIspXqAJLMds/UDdVL4KIXuXS2242SsXdz75LROevdAxScyKV795GHkINNFDtPMfY04LfwOaaFE0D7nDRXMHePLroqskrRb58xuErY3F9NbJK2REAiyxKsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScmrUjwHEK1f6U3CDn9Gwyk+phawh4mQ3+ZmFetVPjg=;
 b=YRolIm0n2r9GvtNp09863JEZWCQROW9xvdyNkvJ6tR5r0DUn7Dsmy6BczdIvOrXHCd9ZjeLTHdp+3DkeqPRU2IUTH+qcAPEls3qD5DSZRdOWBbwu7p5ss7L7EwE5oOAqEP6YXKNckjkExiisV3AbvJGGgSI4j8DvF9GQRvW3opLbx9kJBgYef4AamfGC/pZRpaeTLaGEs8gvmgf+Ic5T6F+HD5UwiZhXaMa56+qHJFToD5eN283JmcJ1jt5VP/RsCUu7476jc8VoSThOQcEbqCqy+CxRHBn1kZwKJ7mAfARzmwf00UB6v2foiPrP3BkjY9MT7pgEQgdR3dZ+AIh+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScmrUjwHEK1f6U3CDn9Gwyk+phawh4mQ3+ZmFetVPjg=;
 b=JePOjYRZrcw3aTfeMMWcREOtO7U8P/4nS8hJBqZuimdh3Q8O4Kh+agJ45ZkisOWqlJTC+/jtfRJViynjm5O57Vz2M6niEnSvimOOhumgRFQPtryrduOccidRZCHflMn02QcC7O+gnAynGvcEhF3+pBSCamVccn76UsUsG7nWBKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 12:48:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 04/17] hvmloader: add ACPI enabling for Q35
Message-ID: <afCQd2rTmiGpR_bk@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-5-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313163455.790692-5-thierry.escande@vates.tech>
X-ClientProxiedBy: MA2P292CA0022.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::11)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f202ab-b534-4069-dd06-08dea513ad5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yvEaXlKeW3dzX5QU/oaKuk7mwPOYgAS46w9HaYLfr/y1RlAuX1MLwVyg2Sc+x016jasrJM3ZE1PXPfpWY/4rCJHkXleq8p9SHB8o4HQp4Y0l9mH3yoDDBsQSMTdHyZttWZiz5mMub53QsDBvD4Ci878EOqIn+sCcbq2irbtiayHIV9oZVZU+jbIipIr5+3Rm/67T89U/lkvizZrAq8Aaxw3SzbKQKhlTbhPy0neFEJ3Y3SV5Pvy+WjwwyohZDVlas274ZBS1t0Pfdzg9t/OlM3F5y8KRABRqUdDTYSl8WWVKJYfFC0K9v7GOPvolk7P82WJPcPCk7tH/xD+sg/EAm2oX/4+IC/wtMOQBul1fB03zYedvhA71GYj0OgLrOFuKQEIySGRbShmRW7pkKGGEeg959wWCDXCWjVRkjzIKwqkhO7N741+n9BLFwqeSMH7p/OexwmRinvAfKg7jgPqw4mth5QrQD7wkS8J0/4ArJO64jBJ7MOQSnNeOQs5AXMUfs8HGGSds94VeBPv14yA9E39QDqTo3mKXuE9UMhB+5/BmIln9MZAnJeQFQ/57NYTJ7pobfFjuPmBN1rKyuleP3OvNo9a5StF6AQgAc6P7O3y5JCbOPlKBJTVGgeu5kt6ApQSxiXXYoxI2k1XR6BjLKLoTFNf6KzAQytiNX7n5DEflmKapesmv6ljdV461ftuY+4SSxfjMhhYBRIHmEw8jKPK+yGJUTEjiM1O6xzhF/DI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElvTDJYS0tqZlRpYmtnbnJJUEFqbzBvNmtTQXBtNTlnYUVRd2FXL3NEWHRY?=
 =?utf-8?B?MkpPN2tORUgyY25XejhGNENFR1hWbTk0b20xM1RhaXc5Z015M0pUcTU0alNX?=
 =?utf-8?B?enl5bVZSOEpHVy82NXFkcUFwemRLd3d0R2h6b3Z3SnpubjZucGlzdzRtNFZB?=
 =?utf-8?B?dkhsZkt3WHE0SVBxM2hUc24rR3UxckZKalJLd3hGQTRqYVRTRzIvSzQ5aEVV?=
 =?utf-8?B?UDRLZGp0V0tzcEVHN1BjaU8zWHdSYzdwSkZEOWdIMVF5OGs4VGpzbmkvdnFw?=
 =?utf-8?B?ZmxycHlvUmFTck5iWW5MTy9hcFBITmtFUSt5enN1cjZjbHdSS0dPeDVTMWdp?=
 =?utf-8?B?N0VIajBKa1dIb1NHMEJTRVIrQ0psSURyMXVvbC9lQU9IcWNCOGxtN24xazEy?=
 =?utf-8?B?MlR2b09vZVNXejRSbmpXTWYwSGp4cVQ4c29lQW5VcjVyUzIzSGs4MFlKQ3Nh?=
 =?utf-8?B?SGpJTWUwaDdMaDZHU0tYalFMUVhZMVFmN1ZubzJEUHdMYXFROVo4TDFmZFUz?=
 =?utf-8?B?YmpWemVlcjJKOStkL1hBOFVLQnpnUk92VnZ5MUg1NWFyek5oM3R3dGZHbm1Q?=
 =?utf-8?B?V1VRL29BbkRGdUkxV2sxSlhLa01TRDE3WDBKcWE2MnZ0b1lFU3ZLVHAzUVdl?=
 =?utf-8?B?TlZSdXozWThMSUpVbk9FUTVLUzMwQ2xEQjhuQnFaa0loTEFybFdkYTd5emk4?=
 =?utf-8?B?VXdHZ1dONWF2Q3pieWIyTzhrelVCRGhtS05pUFFSQXlrL1p3OTNIRnYrcE9s?=
 =?utf-8?B?MXBocGxFNjErSHZaejhPdm41a3ZLdmhMcFFmdlIvUFVycFBhNlFnanBOOEwr?=
 =?utf-8?B?Z2VvNXNqNXdEYUtObDlHNHhKWUR3Mkh5ejVpZVplU25tK0tEcXNBdWM0alQx?=
 =?utf-8?B?Mi84Y2MyWlpYTkJwWGFvb1p1c3Z2SnphRGdDYkJ3Y09pMmdGTzY0MmwvNjFG?=
 =?utf-8?B?Um0walhCRTNlUDl0SDlyakJlNDArRnBVRnlOSEFDTkxlZ2VwTHZFclZneW9o?=
 =?utf-8?B?SFRRUkt2N3FyczBaOG5vUEpVVkNBR1N6ay8xM2szQUtrVUxkeXNwTEZ1QmhZ?=
 =?utf-8?B?QWdWNzExblRMWkl6dExoWG0yeDJEVXFGcXg3QWpjWTNEdERNQ0F0YTJqaUU5?=
 =?utf-8?B?UDJwYk14L0lpbnRHK0FZeFZCb3NqRWgrZWNEMGpkMStxeUc4dkV2Y1BNZHFa?=
 =?utf-8?B?aW91UGFQRS85MW1DWk5mMWJFdmZyWjhkNlFkK3kraWlob2s2SG5ybDBERkRT?=
 =?utf-8?B?c0ZFSno0MHZUU1FTZTFuSlZkNnR2RGZWVVJkT1ByK08wek1ranhpR1NCK3B3?=
 =?utf-8?B?TEVyNWVqK2dPcjZubjY1TGVuOThKRFpDc1h5cFMycTl6MkM2Uzk3R0luazI3?=
 =?utf-8?B?WUF1dDBiMkN3K0U5ekpOVmxZNEJ4Nk5PbGZsZTJQZHgrZTEveGxWcmNUK1V2?=
 =?utf-8?B?NytwMmpRcmtHMzBsSVd4UzNJTTBDZGRSb0dUem5QcWJVWU5ybmdDVWc4NU10?=
 =?utf-8?B?MXRkQWptMnE3bVZEN0xNdDhXbDBCak40Yy92N3RPZnhmYTByK3Z0RmZlWE1C?=
 =?utf-8?B?bjZna0FsNnpHWEhlNGN2WkludUdobUlLanRUZitwRVE2UlEvZG1jd1ZLb0Zt?=
 =?utf-8?B?L2lXek9Qek1EWktxVHhXaUZsVDI4WXN2UHpRTlhVNkZPTmFwdDBRWmxLOTVP?=
 =?utf-8?B?UDhaNzdSeGxGT2tqaE5hV05VeGQ4cVM1ekQ0K1ArU1FEZGVKeUdKeG80bm82?=
 =?utf-8?B?Y2tXUXBtdXhGYTFYbXRnU3AxdHEwdFV1a1NHc052Qzd4Q0xlTmdNUmdYNEZ2?=
 =?utf-8?B?RFYzYy9RN1pnQmgybU1heFdoOS9xMjB6M3lkQWg1WXR2ajVCamhGZDkreWE3?=
 =?utf-8?B?N29qWDlsM1JiVDN1azZKM1djTUhCZW1rK3N0eHRRM1l1ZHZyUVhYc2IvRTdJ?=
 =?utf-8?B?ZHMvcmdoV1ErRmtPTDBSbFRoNExyaUVYaDVvRFBkb0dBaCtEcjNZVjlsSWsw?=
 =?utf-8?B?dDV3TmxGQitCaXpLeXd0c3NjZWc3OHpLWllmbElKcnFWQWJ3UEs0WmhweEF4?=
 =?utf-8?B?K040WjZ1Q1VTUERZZ1JlY2haZGVDNmtIdHpSU092c0VzUTBGUmFmOURYVi91?=
 =?utf-8?B?TGxkSnVudHArT3d5Yi9hNjRFNlVaak5ucWVxR1NEWXgyTVlqb1JzSU83eG5O?=
 =?utf-8?B?Y1NTTnVWUlY4elIzdnQyVkF5UzArSXQ4R29sSGFDVHE1L2s4RW5sTFgvU1pV?=
 =?utf-8?B?bklrcklkdThYSURxNEkwZWZQWmdRajlvNjJKSTZDaE9SSFNXbXREUk1teE9l?=
 =?utf-8?B?M1krRFBVS2UrYnhxTVBsQldYQmZ4NncrY01ac1FiQlpKWUVyVmxuZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f202ab-b534-4069-dd06-08dea513ad5e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:48:26.7391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xe+LRc7U+cpa6R4bHnrma7Sq94SRJdbDrwzxvgqnLuIvOwFUoXsRnjiom3lnmw4qFoFqRYJbHnUKYQya04nLTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4945
X-purgate-ID: tlsNG-d25034/1777373309-F6A08CF5-1AB4C231/0/0
X-purgate-type: clean
X-purgate-size: 1670
X-Rspamd-Queue-Id: 58D62482ECE
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
> In order to turn on ACPI for OS, we need to write a chipset-specific value
> to SMI_CMD register (sort of imitation of the APM->ACPI switch on real
> systems). Modify acpi_enable_sci() function to support both i440 and Q35
> emulation.
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

It's not great to add more stuff into hvmloader when we want to move
out of it, but it's also not helpful to tie the Q35 addition to the
removal of hvmloader.

> ---
>  tools/firmware/hvmloader/hvmloader.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
> index 626cc53649..f6cc3fa4b9 100644
> --- a/tools/firmware/hvmloader/hvmloader.c
> +++ b/tools/firmware/hvmloader/hvmloader.c
> @@ -258,9 +258,24 @@ static const struct bios_config *detect_bios(void)
>  static void acpi_enable_sci(void)
>  {
>      uint8_t pm1a_cnt_val;
> +    uint8_t acpi_enable_val;
>  
> -#define PIIX4_SMI_CMD_IOPORT 0xb2
> +#define SMI_CMD_IOPORT       0xb2
>  #define PIIX4_ACPI_ENABLE    0xf1
> +#define ICH9_ACPI_ENABLE     0x02
> +
> +    switch ( machine_type )
> +    {
> +    case MACHINE_TYPE_Q35:
> +        acpi_enable_val = ICH9_ACPI_ENABLE;
> +        break;
> +    case MACHINE_TYPE_I440:
> +        acpi_enable_val = PIIX4_ACPI_ENABLE;
> +        break;

We might want to add a newline after the break statements.

Thanks, Roger.

