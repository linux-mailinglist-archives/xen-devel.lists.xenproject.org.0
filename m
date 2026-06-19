Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pt0fKPwfNWpAnQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:54:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCEF6A5523
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:54:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=s9Rzw9ak;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342068.1602352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waWrl-0005Wl-RK; Fri, 19 Jun 2026 10:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342068.1602352; Fri, 19 Jun 2026 10:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waWrl-0005V5-O3; Fri, 19 Jun 2026 10:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1342068;
 Fri, 19 Jun 2026 10:54:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waWrk-0005Uz-G3
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:54:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waWrj-005HnQ-Hn
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 12:54:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a351fe0-2eae-0a2a0a5409dd-0a2a4503d280-20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:54:27 +0200
Received: from [52.101.62.30]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a351fe2-a3da-0a2a45030019-34653e1ef413-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:54:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7780.namprd03.prod.outlook.com (2603:10b6:408:28d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:54:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 10:54:23 +0000
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
 b=vpe0eKPFfunKI30O/nBlaADJhja+haxy5Lscf08ihqPXOFkS8Md5Qv5fNYcWVvO/bRc10DZw5arKl5TMPOjUT3srOmJfwWFNS8VmJzkjesZNHm4/MNnpBzwPlU8Afj27p64dR8I51AghPjuRwcm2Ln8lPgnVQ2kdvgsuZxm1SrnnjC1U6ly1E2LR/PQeJMGJYycCQGflKuzR7n//UAYcgq9K3FX5+YVC6BEKViCVRoCFl+dFAAxxWpA2JBNQNlY6vQVvWOVvLEnM2WZuZixUfRe4dV4xQURXuEY1cJNXquI7pDg1sm0FE/fqqrfHTfngAWTg/4D8SC8VoYiTnVXkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C53uhB0U9fvy3Lu1fWObBoLSBOmuvlEQ7psrRhSqlfI=;
 b=LJqqRCD0lNbwNCodZOfX/RzHY2lyQ5YGkDbJ6UyCr/j03HmzyOMkAuESEOs8cHuntspXaI263v4i0ZewaIlFkybCKz1nK9kdxirr3JL7xSy+O61RajajtudKfMFsG0o8UBSvDCnAZpwJnpnBfwPCBmMXwRori0Kv7iF+LLTjOP+i1xPGBOdvxRK9Wi3VXut5ux575UmfOusHSq6giuL/9mJ++oIIzJ5NYrVFitNDgb90rMuahhOGiKHbIAgjP3BbZ9Gjory9iQIH49XnA8/kR6nQyBu1MYkJITJJTbWrBcmtbA/r1MoQXB2DNJI5s/iLe46eZU+gWDOKs1mnzUBR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C53uhB0U9fvy3Lu1fWObBoLSBOmuvlEQ7psrRhSqlfI=;
 b=s9Rzw9akkjHgF0nnA00as/XCDUNZ8zrpFBI/LzB749Rlb7vQ6P/32vnJ0GpUHsk/u0SEY6zDFDKBsxqN86T/FrLMl77mTicNHDB74QAgBD7VAlCnX8Auf9zQxeRcZ/tjgTYxcLVnfuzG+SepDu58bAnOcU9cx2TXQM2wQ7vRJD0=
Message-ID: <df3127dd-9923-4e93-9866-64777d0a6419@citrix.com>
Date: Fri, 19 Jun 2026 11:54:19 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 14/15] ehci-dbgp: Use pci_sbdf_t instead of (bus, slot,
 func)
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5af5000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5af5000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: edaaf41f-999d-4f6c-8b1b-08decdf11f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	OE8T65Ydf0MIm45TvUaT0grBzZGAZO1pPIgaTTh9yESDKmQmd/YyVSM4yavrEmnOIUI4W16eP6P2EfS5h4i+omwKMk+SJNwZl3rXLzhvqrViHy/RyoaXvMb2YiUDw7QQCk2+b2BVsFIJbVzp6enl8VlgSF8od+CHmW0IaKXMXqQU46h2bKqJKRWCh7e3D32ZPNRtexsBx6Nv+XPHyDi1vGw9Q6odg/fAqCOcZJ8RZ+OYpiUG6wzaHTUFNeseMikRJDuA4Kum8fgJpjCR+hv8hFnB++s6/kf6hQ5AGDTR8WS3V43wyO1AHojG29mkL4bxsFa2tqY6MbufD+I00+effZdg/ZL/sBcYGFfqcYFTotsUhxwsGlNjIShAkMvruH55H63xIjTJ6MI5YNAYx2rvgM86QEDBmSqHGUyZ2C4P7E2MKeLm+XHkhaTfY929obQ2ZFSBAEBQXIYM/Td8oKp23zr69fr5E++5RTwNA/YN51kQsPsnfIXxtUW++b7hHqUQbm5SNzl21e9kVTUGZsEUTEtH6koVoM3KBu67cF95WxmFIN7QP0wkIcYm0YOQ8eWLt6QHkXa7nAGDnitAHZ9/nabUoVygwuvk0qFr12U88HcozZ8dws7b9WEF14MVkibxZLU3FsJkK9YDQyNQyft1UKgLO5bzTBLNrQBDldpezM4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFlwa1VYR1VlZWlzc3VVMG1FTms3WDVwUCtRLzd3ZStkY0RxaG1xNC9hb0F5?=
 =?utf-8?B?bGhHd1F5N3dJb0hJMHpVQmRibzRxajVsNGkwdkZuaU5uRWxXU2cydEwwU1lv?=
 =?utf-8?B?dGZFelFrYndaazY3SjBHMU5Rb2N6dVA2UlhBR1k2RnNoNFMraXJpbHJBdzFE?=
 =?utf-8?B?QjBUMFJYQURKKzRERnJVZUdVMmErK0NLNUpCdTFMVkFQMUdON1NaQWRwSVFp?=
 =?utf-8?B?SWovR0xNZ2pISXVRWDAxWmdneWg1bWxiNmdlTmtNTkc4Z1ZJOFFRdXpjM09Q?=
 =?utf-8?B?aHJ6TmhoWXFWbUh5WUYzT0VLQkJxZXlNWW95dWI1QXN4Zy8ybWNCbXFMbk5i?=
 =?utf-8?B?aWt2eEVQQkFmZk14RTBmSGluOEkzMTVIZXduYWhOZGREQytXWGdqQkxZY0Ji?=
 =?utf-8?B?UFJBbTlSSkQreml0R1ZYa1ZXa2tCUGgweURkdEozelo2YVhKRU1DaitVcGNM?=
 =?utf-8?B?bk5SdXpUY2NQMDdmL3RVV29FRXVxYmpBbGt0MHQwRTFPRWY2QmJ6NnRhcHhm?=
 =?utf-8?B?bXV5OFo0QnNwclBjL2piaWI2dnhOd3NndVdBRStpMTdvTEY2Z2Z1YXBXUmxw?=
 =?utf-8?B?Vm1mTVBuNnNYaEdCZjNHdnVXNWlmSTZGa2h1eUVZZ3FYS1Y5ajdXaUFlL3RF?=
 =?utf-8?B?eTk5N1dhVUxZSnBRWmI4a0xjQWJZc2JtTGpFVHNvK3VtSlVyZXZaa2hRTHl5?=
 =?utf-8?B?V04yOGIvSFRaak41cDhHalNBaFFyS0VRV1RiQk9FcDRiNHhyMFo5U1FuR3Fv?=
 =?utf-8?B?bjhLK1lGYzVtbXBsU0Z5QzZYdGVwem5yQlJjY0xKd1hicEtkNFFFNlQ3SFBs?=
 =?utf-8?B?clNwS1FlMGs2ekhsejgxYXMwU29BYncrNHFNVmI4eEFacFpIUWgxTmZtdzB5?=
 =?utf-8?B?b05tYVFwQTIvUEMxT3BNa1N3TlBhVy9DY0VBZDVxUzJoWEd1a05NTkliV1J6?=
 =?utf-8?B?RzRKMnBpY3ovRnFvemE4b0tVKy81ZzF5ek81azd0ZjdCaTJBTGdpOGdMUCsr?=
 =?utf-8?B?TzVCbFpnZzN2dVFSMUQ5ZzcrWWZtRWh0S3FEOVJJTmdQUWsvSHFBK2p4WlBp?=
 =?utf-8?B?UGR3aU1WWkpKb0pJRmtGVVlYUE1uKzgxTDJ6QnU1RHNOV0tqSVo3aTE4a1Fw?=
 =?utf-8?B?Ui9hM2ZLYmpLK0JnS05YSERlUUsvamRVbUxKWHpQR0hlWGtvWWkwM0c1V29y?=
 =?utf-8?B?VS8yR2JIZnBLOWgwSTlEUjlrMzBWemgvL2wvNEFjbVJsK2paSXhqR2EzRFlv?=
 =?utf-8?B?S3poU2hUd3JFUmJOdWpUWkRIc3hDYXJKRkxVMFU3eGkzQk5QMHJkN3FVbUdl?=
 =?utf-8?B?cjQrY0JQNC85Vkd6cmNhSXNpZEpTcGFZZllOMzFKMUdUMHV1SXltOHV2MEI1?=
 =?utf-8?B?Y0xJTVV1LzdNSG1BbjN6c2RYanFGbm51VHhXY21JZEhVdndsbm1GbmtGL1Iy?=
 =?utf-8?B?VzBsb3dKM0pMN2lPL2cyQTdDR2ljMjNqOWNrTGpQMkIwNUlKWVhGK09UTnVv?=
 =?utf-8?B?T1lzZFVhODFqVmV3YXh4N004NmlSOE1pOVBjbCsyQWJHcDF3bDVtSW5LTWlM?=
 =?utf-8?B?d2FOTklDY1Znb293VkRXVEo0UVUvU2F4ZDFuOE1POXpCL3lNd3ordXdudzBV?=
 =?utf-8?B?aUVLbXRSWTVaZzVmNCtKeDdxYkt6M2lHTkVzQUUra3BRSmM4cGRCY3ZqRG9w?=
 =?utf-8?B?RTNlOThlUms2TEcyYXU1ZVJGbzBCZ0Y0ejZUa0FkUkw1RWNRY3BkR2NTUFVw?=
 =?utf-8?B?VVVoVUVjb3JmNWxIRDROYnlmWDBMNnZvbHhGWEkyN1NublZWSzBLVzc3eFor?=
 =?utf-8?B?b3hNUS9XdjBtbE1tU09NWi9QRlMrYUNiNmpRVlBlSWx2bDdsazArd3l5Lzl1?=
 =?utf-8?B?ZzlHOWlZTVY5UnB1eVVsUGtjbW5uRmg3Z0FIQ3UwcGY5ZHdSa2V5ODBXaGEr?=
 =?utf-8?B?UnVRZmUvZmxaeGpRUFloVGNvTUptSzFWUEpDZHJDenpRbkZzNTl5WjU4ckpZ?=
 =?utf-8?B?TjhwVUpDalp1VklFS2dFL1ZlMGE3ZGlGRlVZeWFWRldmUWR2Vk9kZlVSSEMz?=
 =?utf-8?B?SUd4WW1pZ0MyTVBWNUdPVkhxOGRMYWE4b2FGUE1HRDh4Ui9pNHFOMWJyYlUx?=
 =?utf-8?B?VUhkT3RCMVhwWDBLNXVhRUtrdzdaTDFzOWpta2RFYTFBekFLUkVINjJBcTdT?=
 =?utf-8?B?eUxsUE1uSGVnQnU4TGRhUnlSNklXNEsyM3NFSFpuaUtTOEMxMkIrOE14UmF3?=
 =?utf-8?B?d25vcFFUdmhOZ0UvSXlNdW5FYUF4cEgwMUI2WG9iSHZ2TkR5SDY3Z2JUYzVD?=
 =?utf-8?B?TTVKOFY4dU9qbmdtMW1iWm9EN1BsU3pzNHZFL1BkMmc5MnorOXVHd2ZuY0FY?=
 =?utf-8?Q?p32mpH/pUWjCUbc0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaaf41f-999d-4f6c-8b1b-08decdf11f44
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:54:22.9431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpzMxKW0LS5LCFLGmLtph0OJ3CwF4AkmxrckOeTNQwfm4C5TQelA6TRZ/3DvHKbnd94sgMrT7rPnnoBEptqm4n8mIBi+n6Hq5t0JP8diLq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7780
X-purgate-ID: tlsNG-33051d/1781866467-645CBD84-63F6F455/0/0
X-purgate-type: clean
X-purgate-size: 3530
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCCEF6A5523

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> We also take the opportunity to allow the device to exist outside
> of segment 0 (only when specified with pci@ syntax), since it's
> not hardcoded anymore.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

$ bloat-o-meter -c xen-syms-{before,after}
add/remove: 0/0 grow/shrink: 0/9 up/down: 0/-560 (-560)
Function                                     old     new   delta
ehci_dbgp_check_release.cold                  72      64      -8
dbgp_op                                      260     244     -16
ehci_dbgp_init_postirq                       121      97     -24
ehci_dbgp_suspend                             87      62     -25
ehci_dbgp_resume                             150     102     -48
nvidia_set_debug_port                        100      50     -50
ehci_dbgp_init_preirq                        344     239    -105
ehci_dbgp_setup                              692     568    -124
ehci_dbgp_init                               778     618    -160
Total: Before=2016873, After=2016313, chg -0.03%
add/remove: 0/0 grow/shrink: 1/0 up/down: 8/0 (8)
Data                                         old     new   delta
ehci_dbgp                                    144     152      +8
Total: Before=2209383, After=2209391, chg +0.00%


It's a very clear demonstration of how expensive the split parameter
passing is in practice.

> ---
>  xen/drivers/char/ehci-dbgp.c | 71 ++++++++++++------------------------
>  1 file changed, 24 insertions(+), 47 deletions(-)
>
> diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
> index a9bf7dbadb..6d0a6c2ef0 100644
> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -335,7 +335,8 @@ struct ehci_dbgp {
>      struct timer timer;
>      spinlock_t *lock;
>      bool reset_run;
> -    u8 bus, slot, func, bar;
> +    u8 bar;
> +    pci_sbdf_t sbdf;

This struct is horribly packed, but putting sbdf between lock and
reset_run will pack better than having it here.

> @@ -1009,20 +1008,18 @@ static set_debug_port_t __read_mostly set_debug_port = default_set_debug_port;
>  static void cf_check nvidia_set_debug_port(
>      struct ehci_dbgp *dbgp, unsigned int port)
>  {
> -    uint32_t dword = pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot,
> -                                              dbgp->func), 0x74);
> +    uint32_t dword = pci_conf_read32(dbgp->sbdf, 0x74);
>  
>      dword &= ~(0x0f << 12);
>      dword |= (port & 0x0f) << 12;
> -    pci_conf_write32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func), 0x74,
> +    pci_conf_write32(dbgp->sbdf, 0x74,
>                       dword);

This can be folded onto one line.

> @@ -1570,8 +1548,7 @@ int dbgp_op(const struct physdev_dbgp_op *op)
>      case PHYSDEVOP_DBGP_BUS_UNKNOWN:
>          break;
>      case PHYSDEVOP_DBGP_BUS_PCI:
> -        if ( op->u.pci.seg || ehci_dbgp.bus != op->u.pci.bus ||
> -            PCI_DEVFN(ehci_dbgp.slot, ehci_dbgp.func) != op->u.pci.devfn )
> +        if ( PCI_SBDF(op->u.pci.seg, op->u.pci.bus, op->u.pci.devfn).sbdf != ehci_dbgp.sbdf.sbdf )
>

This wants wrapping, somehow.

With suitable adjustments, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

