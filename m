Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9FlGM4YSMWq4bAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:08:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F668D611
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:08:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=TqbmhYno;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338861.1599931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPmE-0004P9-Tw; Tue, 16 Jun 2026 09:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338861.1599931; Tue, 16 Jun 2026 09:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPmE-0004Mg-QU; Tue, 16 Jun 2026 09:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1338861;
 Tue, 16 Jun 2026 09:08:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZPmD-0004MS-Ps
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:08:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPmD-003uFS-6N
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:08:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a311274-5cb7-0a2a0a5109dd-0a2a450294f6-28
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:08:09 +0200
Received: from [52.101.52.18]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a311277-af86-0a2a45020019-346534127838-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:08:08 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA5PR03MB989582.namprd03.prod.outlook.com (2603:10b6:208:602::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:08:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:08:05 +0000
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
 b=e8kFJaeyZ27gqjRszIOB7h5aG1XF/UhddBm7uhhiVjo/8oNci80B6NLj7wBicZvkG5pUY/r1965RUUNkvSUW+3JRdXiKnFwYTxpixqZiM5r1oXJR6ZhGafZUXrFFQOJGqYDY3hh5afeZcZnhdFf9Z2zJGxW8LZhF0RCXe/UTD1znQ63SIJ6IbqUfMihkYMyDrHGRqxlxG6NUy0w1W+YcikIZR/ZsLge0ybegIcp0Xh0R/7Mk/MEYd4KaQKXUnlnw/j2uQyo5hLfRULFUD82SHVuJV5JL2FUgxCF6zTSUTP1lDCinnROzYPZIZW/CDy9rKbENF1DfM63IAwE7YY/IRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM6TSo4/zzYWieftzZTIFXzLwVw4Q7MsnYwayOY/Fn4=;
 b=wd0qsZKeuG7BkrcdfWbJUv+fmAZtmqHRwz1gmVrY0Pfov23W8/JwfxwepB84W19Vc5UpXrGbYPSAVUR8iwcrDNsCC1nwi25XnACIlV41PR96AwIQ+5B8DH7RwzaxIsH6t1yhoyMlncyTHZhNe8UGK8zpeP2DsUO+9fXoAPutQSJAHamQfUoZNDga4/FwHw6nK8zbtDExlhvVM6ERf2Wax4rnYKMU4Ngyq6lw3PYcXCP7ydkf9LCK0KPcnU/jxYUGCIYsVydW1Ixwl/fAfMz+9YQhZQgYH15v2neAsYjqJZgG220xGSox6ItXqvvCG1JjweC4HnsEvySIR9Y6u8MMkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM6TSo4/zzYWieftzZTIFXzLwVw4Q7MsnYwayOY/Fn4=;
 b=TqbmhYnomAKfxdMy13tWONSOtOlkqw94md/Kk8lD4f3lW7R0yYWc0CHXzrHz0xAleOtr2tuaAl4tka3OVE/6ksk4111FQ3JyejhNDaTtLoT94xEbI88x3utGAcnzVW4rGETBdT3rDP/5kZ8Gi12OCD9rVROCjnLpiWGx315E9Ac=
Date: Tue, 16 Jun 2026 11:08:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22? 7/9] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
Message-ID: <ajESc7Ae_0bzd3IV@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <5f49f890-426e-4076-8326-c2fbff433a35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f49f890-426e-4076-8326-c2fbff433a35@suse.com>
X-ClientProxiedBy: BN9PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:408:fe::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA5PR03MB989582:EE_
X-MS-Office365-Filtering-Correlation-Id: a5cbee43-d1d4-4e4c-b859-08decb86c6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/P9G7F2drmlGFGshfc4ZaKq1lRr9K7zkOtNmSnv5Y7xjIzylKN9VIZN79Ks2rJFoZGBO1yNvY2mL4k+V4lz1fJDziJwQpesD6zv7wrnODSkhKwwlxf1wLURlzKgPwZS7NjJr6GbE+p43QRLfvX4Iz9v8LAoshBzfMN1cpuW6EOAHGNSzt2K0p89DeXk0288/cBtGE4ALRMhUfDB2+b9abl9km12qQixSHqStRs3eVvdMmESLas14dhmaw904oxVHkt89vzvzY3CMauYtR19AAwVZl9j6kP7prXOwrwDTj77D683zQr2b9pa3lt/RHtx8wcvLdhkcZ1umFha4nCRVpO2U6pwOFduGGeASXEepfX9xrTHzgXMYiOO2lCcBOZ4lPu/y0q9luW5tdmhLliPh9l4zwOhZsOQZ3DUWCcod5PCGoiL2MmiLflx8ECbse/96mggDKxGluy3BWXNrl0UBtU2AQplETV/ZADXM1j9Y6Ix5q5i7j4o152e4gczCDEucAhZeSukwUnro3I4bqR9ReRulj/PWoIJyCr+AUEsSnolb/oI9zU2fQtkThchHy2aEeXGbUKKxS91RgKptcHpBfP2evbIamxYU5O8rUqPIXZuqB9F+kUAC7N/NPMpS7kPm/FACU4Aor/HvFEYGQW4B7PPgBH5+qLARXaiN6pMi7mDuh7BxFeQd8iq3dkJx0eSV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3RSd1RzUkJGRUlLamF3ZTZOZ3lOQlJGYXBEUU00bUQ4TUowWkJIQzMzVTVP?=
 =?utf-8?B?Z0JHYWsreG4xVndLc2M4U21rUVYzdS9manI2THJ1MU9rTzVKa2h1Y3o1MTha?=
 =?utf-8?B?cWxOVS9qbGVBSGdUSzQwR283TXJ3a0ZUcUJOMXFINVU1YVQya2UrYVpqN29h?=
 =?utf-8?B?dXpubXUwKzRWRHhvRHR5SUE2QkdmZUVUWjUzZXBwMFJkVEUwQXBQQ09PNWgw?=
 =?utf-8?B?MFVtYlpEMG9DcGFTSU5MbEtRa0dxT2xRcCt3b0N6YUFGNmpqNkpJWGFZamFR?=
 =?utf-8?B?YWttaThwS29ZN0NGemIxL25hQ0Y1SlF3NE53Q1F4d2swdG42SGhtTXJUYnZB?=
 =?utf-8?B?NjZ4L0ZHUkFrdGlFRUc3cWNNQnAvQVZuVEVqak43dEFzcWZtYzExOUZoYnk3?=
 =?utf-8?B?VzgrZW4xLzIwckRlYTQvcVVKYVcrcUFjUGNVVitUaFZsSG9ZL05JYjJ2ZVRI?=
 =?utf-8?B?d0pjTFpobjYvNHdaamNmK3hTZlhCZnhFenNFbVlpMUtFdXRCWEd1bzlhdXlm?=
 =?utf-8?B?b1BQR0kzQlBINUxrbVJpQWhJODZFalRKNjVZWTI1OEVYNVVLVDhpT3JSV2Ew?=
 =?utf-8?B?VGZIKzBWb2IzdTdnUldDVmJ6dEZtME1DZldJOU9HR3ZKNGpyRGk4a0FtRTdH?=
 =?utf-8?B?ekxjYmZLMWE1bHVQSFZucnZ6WGJyWmxiTjJMOUR4TkExZVYwOUJ4T0VMZmpL?=
 =?utf-8?B?Skd1QWxzV1ZNUjJMSmEyQmtjNG4wL0plVlBwZk1ERWFOQUtKd09LTGhDZkdL?=
 =?utf-8?B?b011bURjdThQWkNySzM2MWhTaVRmSW5VQ3V0ZVR6NmgvSmkybWxsaHhvaEQ0?=
 =?utf-8?B?WEl5cHQzaldHQmtPbTM4M3NmWk9oZ0JQZWtxa1JkNFozWUkvbk5pa09LT2xr?=
 =?utf-8?B?eExkVnlvY0xhaWp3OUtMZWJhUEFqMXRDcUtkMy90OVdVb1c5UytsZzhnL0xG?=
 =?utf-8?B?MUZzQkV2aUVtTnhKSThkMkxjVWNaWFEyN3VHN05uQUVHYURXcldiUEZuRzYx?=
 =?utf-8?B?NXZ4WVZPSDhjV1RMWEZSTytnelg0anZCUFgwQ2F3Y2lWQTY1ZTNacy9zOGJr?=
 =?utf-8?B?c3hveCtiRjYxMTdaaHZpWXNsRld6RmhSTVh2em1YVzBEZStheExNNTA3RzBW?=
 =?utf-8?B?TjYreE9oMm9nQ2xXMnFsWTNkVlZRTUdiTU83dlB5WFJBRExSaXdLM2h2UTVN?=
 =?utf-8?B?cFpxOVBvMTR0cUd1K1dtWnpSb2FyQmZ3eVRGRk5ha0xiTVhPQTFqdHdtcmp6?=
 =?utf-8?B?a0N4alptWUt4YkxacnpzVThvempWbzdkeDV6aER3dWxYNit0V1NpdW1kUy9o?=
 =?utf-8?B?SllJbU5UVUllS1poeC85S2tvODlKVUNvcUlzanJWc3pNT2hIV0p5UkV2TWFY?=
 =?utf-8?B?aythcWxvK3IxbnpEekJkTW9BRmxaMW1VVk9URTR4VmpRdzI3MFBRbGtOQWRo?=
 =?utf-8?B?NTZ4a1ZsSDZxQXVMd3VkaW9peWNvWkI0TjFDanJHTTZWSVdmZDZ6amprRDdJ?=
 =?utf-8?B?KzZpSURFL1pYTWF3YS9lWWNFaDAyR3NvLzFSZnBUblI1UFFGM1gyOXkvOCtw?=
 =?utf-8?B?MFAvVUxkU3R5SkhJOExCQ1pmUlZaZlA1bDN2TEQ5bHZEWk41SHUydDdpaHMw?=
 =?utf-8?B?UjN4QzFITzF6N1JCd0FaZUhOKzQ2dFl6MUxOWGV3VW9HVUdSWm5pNW15ZExj?=
 =?utf-8?B?ZW9CWXFSRG5VdTJ4NzdRaUFVUFZPTDJMOGJLRWlkckdKVlBQKy9rMXJscHdY?=
 =?utf-8?B?eDJFbVBFem1sMGYvL1l0OGpxKzJUREJ1ZWF1MDNlZE90MGtjRmQ1UnF1L2ZY?=
 =?utf-8?B?R2FlREV2NFA0Sy93a3RFd1dmUkkrQmxMQUJHbUlpcERtNWx6c2svQS9qVFdK?=
 =?utf-8?B?THU2YmlPeTJqQ0xCRHNKQmRRc01LYVlpbHZ2RXVTUlY0OEZkRW9INWJYbEdl?=
 =?utf-8?B?bnErZGdnMnhqTkorUXEydndNZWtrUXhCd1ExZkJ1Z1pkWkNnK0hvZWI4azNO?=
 =?utf-8?B?dnhMaTJDL29XYlJOK2l1YUY4UG91UU9WMnVvZjRVaUR5SkgxVmpLZlJHc29k?=
 =?utf-8?B?aVh1WloycXF3VzR5eG5hNzhoVmpWb1BXTXFnYlpWT1B2bzBZRzNIUHBXeldo?=
 =?utf-8?B?NUtQWjFNNDNtVDVJbE1RdlpKNFJCanNWYjlWWFplL3pyYUdTQmJXc3dJamlj?=
 =?utf-8?B?ajg1alBCTklBdHhJK1hYRVFDbWxBWW1rc2NHTlhTb1Z4U0hmUlJGcUFxZmZW?=
 =?utf-8?B?YVJrRjBXUjQydkN1UnNnaEY5Y2Z2YkJUdmdRVjlqU1I1Wmpldnluc1NZMDVJ?=
 =?utf-8?B?SkxiOEl2Q3FxSFZMVG9NUVNSL28wc09wS2c4alZRdkVxZkYzL2lnQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cbee43-d1d4-4e4c-b859-08decb86c6e3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:08:05.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sIKDOFkWdqwYYmK9EFJ4aFXxGubljs9bvM5CgomkJjIvwbg3pQf3k2rf073lYzfulda4QKAVgtyhwOt0Qk9sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR03MB989582
X-purgate-ID: tlsNG-720697/1781600888-82D6F161-7EFBF660/0/0
X-purgate-type: clean
X-purgate-size: 1543
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 385F668D611

On Mon, Jun 15, 2026 at 04:15:36PM +0200, Jan Beulich wrote:
> Like is already done for I/O ports on x86 and for IRQ unbinding, check
> only the requesting domain's permissions (for it to not interfere with
> MMIO backed by another stubdom DM), but not the target domain's: Removal
> should be okay even (perhaps: especially) when permissions were already
> revoked.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -436,11 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>              goto domctl_out_unlock_rcuonly;
>  #endif
>  
> +        /*
> +         * NB: The double lock isn't really needed when !add, but is used anyway
> +         * to keep things simple.
> +         */
>          iocaps_double_lock(d, false);
>  
>          ret = -EPERM;
>          if ( !iomem_access_permitted(current->domain, mfn, mfn_end) ||
> -             !iomem_access_permitted(d, mfn, mfn_end) )
> +             (add && !iomem_access_permitted(d, mfn, mfn_end)) )

You seem to be doing the opposite of what the commit message states
here, and checking for permissions on the target domain, not
permissions of the requesting domain?

XEN_DOMCTL_ioport_mapping does check against current->domain, and not
against d.

FWIW, we could also remove one branch here by doing:

ret = -EPERM
if ( add && iomem_access_permitted(current->domain, mfn, mfn_end) )
{
    /* add logic. */
}
else if ( !add )
{
    /* remove logic. */
}

Thanks, Roger.

