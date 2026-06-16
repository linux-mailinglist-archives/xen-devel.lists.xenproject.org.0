Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XfH1DhcTMWrxbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:10:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9A68D678
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:10:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Pgwu1rsc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338873.1599949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPoY-0006rN-H7; Tue, 16 Jun 2026 09:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338873.1599949; Tue, 16 Jun 2026 09:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPoY-0006pC-EF; Tue, 16 Jun 2026 09:10:34 +0000
Received: by outflank-mailman (input) for mailman id 1338873;
 Tue, 16 Jun 2026 09:10:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZPoW-0006oB-QJ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:10:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPoV-005Deg-I4
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:10:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a311300-e002-0a2a0a5209dd-0a2a4503b38e-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:10:31 +0200
Received: from [40.93.195.36]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a311305-672d-0a2a45030019-285dc3240a8b-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:10:31 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8287.namprd03.prod.outlook.com (2603:10b6:208:5ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:10:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:10:28 +0000
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
 b=sWHPjj6np2CGqbSupLWzj/6sleY0LAzx9kiPEKz9Xv2/PfKs9uCTjAMi9gOrYYOMR9fk1xY/AJoTz3QvpATN7q+77nvIWc9PMudCJAjhO3HZQTQzqkCXgT7fkEOpchZfOhHos8NXB+CuZW0BMwItzw3LAtqRX2iEWGPfRgVUYWq5cQpbJaBHIS66lU5MVJuowOb5+nsHEhHRyiIqNBSueQazgyoIp/CbKXTnY4U9MBKYZvNRWjVFwhtEfv56r5U6+b4ek+qoWX0JQUxee6kIfQ6OcpCJ3INMRtKl2YUzY3p0sQWhWH402n/2MUfEWKJXiSdYxBqcAuXFpwkrKjcXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFVO+ko0F80uHwvTt8DpLcBKL5xKFTNyjegt/hvf14c=;
 b=NAP9drk4PR9j/A09ImVqXZHGbD4c7QhlDaqMBkhQ1G+F+G0cqvYukHwnj6PRM6dVIdBuR7njGcVShd2itPW2d+2YtHzP3bzPBD+9FvrbMcKHWDkPM+mv4orerJ+O+xrBCbIgdw9vHmDSB4HIadVOowSJKk1JOhjHV25X8oUV02A2ud13IgD3W1fvrRRBJjs96ylvXORamZz/Aa1lmvTIDcgJRhUziUw5QTkxG8cl1dsR193TuDkjz8gMKEuQLS5A29pXt4rOdSbOKo+Ug37UppE3JnBj58fVJ9OBu1jn0PgEKIWLEXLVwv3AhFysCNB48O7MAqli4+dOgOZpIrly5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFVO+ko0F80uHwvTt8DpLcBKL5xKFTNyjegt/hvf14c=;
 b=Pgwu1rscIZ/IaWH2S4MFoVh7/dz4Ys2x/2mEeG/aCCJCq1EgIByD3sWyPQ+cr3cyTJpG6aNKNaOg8R/c1BAtctEhPFdBmhSx8uTlNtOmTR/L5vlua4jrt4brJYeHS482uCzqpIbOugTfp+M8f9Gs+33YBsrPckp96qVJp8yQ00c=
Message-ID: <9aa3c6d2-44b8-4563-8a38-036947479377@citrix.com>
Date: Tue, 16 Jun 2026 10:10:24 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 0/4] hypercall string inputs
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0469.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 216042e6-3092-4b9d-f029-08decb871bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MLxGVjhknKHQ8/DrRV6S6vyYmUEQ8wDg9DBCI7yCJU2X90P37dWIQVmMPqB4zDNQMQ5FP0d8DQYezSVRv7Va65r0KilPt+ZLYvLvj46e9JeQWopf1M8ujNZ7YNlmWV5gXR5SoVH5OfNuN1mCELAJ+DR4/3awz04UfVDzx+Qjmu+fPZJI5Xdb9U7RmMYremW3HNfW7hQVT9sh2Wab2of4jn2micP3l8rAGTEX9NwTB+BY/uNy+9QEo2gMfqscua8bMkLsA0Ox/4+E1/30StI3VLqVrZH4vAHaUEoGVycvwX+Xte+GVJi7AhSVN94ezHdjAIQMYYkB9SCkyV08vdDVGqLKvvjMqqm+qSA9QpWOmEjgpDM/7fN/CpwfRrBxECVH4aoNP4M55ej3jI4rYeznuaRwbZtHEU7N+2vFoCX4eiKP/kGIdP1tnkG9D+fc0EXUvJpQDOdoxblckjrPnbdRPMn1m6VmzqKU1a66H8q02QXkUF8djbvp/T4zcofpZma6PincRV13BGUKK0+EhUvuIS5EpaBTbNsgepTDGkRK3/kzQZWr8O5cHGhRWpBeh2I8483A3obv/u0BIHAQs6JhqJgfuwPqlXewddYFLniu3FaZzKDKEDqzS309KKqXh3BSTC7mBhFZoHKEG+5slPK/jFxHjNIpvF/wXyJ4tidUMxEX3h/4mTteVB/xwv8AvWgz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0NNV21xUTNIYTVhcDhNNTk3bldSN1RRTFl0WUx6VWdBcTlsazJ3R2tLNjZ6?=
 =?utf-8?B?WC9iRzZqMFFIS2lUNlJyZGF5OHpvNDczL3JXSmt6cjc3Njl4VEhEL0lRVXVt?=
 =?utf-8?B?TkpFYUs3aEd2MGRtcHpDbFVpNWdhOEREN2RsZW8wYlMrTXJHaEdub25EMlhq?=
 =?utf-8?B?djgyVldiekxFdEIxQVdBYzE0Mks1bmc0MVNzdXJ3MDZuNkU5KzdvQUNSUjBN?=
 =?utf-8?B?alZZNld5dTRUTytMZ25NV3ozb2ZjZ1BPNGlEWW1ndmhLZUcxTTlYcFlwWXBk?=
 =?utf-8?B?Zk0zVStuaTNxUVg1TGdnV09wWGthK0czc2FYcFViSlRlRnNlVzUwNkZGZmVU?=
 =?utf-8?B?dmttUE05YjVmMllSTXdTeEd0QUlwN1RpbzNFZ3UrN1JXQ2xDalRWSzJCMUNl?=
 =?utf-8?B?NS8wZW4xYStpNWYyZTdrM1l5K0hNTG1ieHB5SHQxd3ZXMHV0YmpvV3hINktE?=
 =?utf-8?B?WGhvL015V2R5c1dJT0pCb2l6Z0N2ZURwWERWa3dHeEhJaHBaN2NGTnVEdEVj?=
 =?utf-8?B?NHhHUXM4ZGJKbWRLK1BFRFZvcG5Qa2hKSkY4UVNuTVc3NjhDYi9lQ3BvNHVq?=
 =?utf-8?B?YW9mbGRWZ2xzWDkvV09OS0RrM1BoK2Q4R1poUVJ4cXcxM1VHTVBsbloyOU5F?=
 =?utf-8?B?ODNzTi9KelZicmNadkRXRFRMbmdFUWJoQ3hXMW1uVFZmSzk3clBZTkhlczAr?=
 =?utf-8?B?aE1sOUhTRUhZT2QvU0NRckxhR2pkSzRPY3JoTHVuQ09zT2pLcWRybHFyVGdY?=
 =?utf-8?B?Zk5VUVlMSlhMM3dtVzdJcW5nRng3YzdmQnBNa212cmFJMlM4dHpkbExqTXFE?=
 =?utf-8?B?cHdFejk4VVpVSDVtN3pCNElLY25PZ3JnSVM0bUFDT0szeGtQeE9xemRlWnVK?=
 =?utf-8?B?ZjN4V1RCbFNQVjN0MUJCU1dSU0ZtYUptUUc2aTZSV3lFUWQ5eHdTa3JnSmww?=
 =?utf-8?B?Q0plbmZPckN0WnpaN3lEQzNwNGtBeDZVaDMvODJhL09RWDR4K01wc0xsbW1P?=
 =?utf-8?B?TUNjaHpDK21ZUnhHVndGQVVFZ2hneko3YmRHQmtYSFlTVVNiYkV2TFF6M1o5?=
 =?utf-8?B?d2VHVS9jZEJGT3Q2YnZOL0tkbUdrSWVKSVd4RnhoaHJyQkQ1Q21LTUJpSm5w?=
 =?utf-8?B?ZGJVNFpuUHJ5NGkrWVVBK21sazFnRUpJN3l1QmF6OHlXaXQ1R1lqUnVUV05w?=
 =?utf-8?B?R2V6R1N1UEhTcWYwcVlSUGZwYnZ0QSs4V2U1TXdVVk85VExLdmJ3ZmZKNFY0?=
 =?utf-8?B?dkZRTXplZE5wNEZjVTVwRzVNNVMyZC9XNEZtNjQzS1lhdmpqY1p6ZElXbmsr?=
 =?utf-8?B?YXEyUUdoR1pXaWNwS3FPam5ySndZcnYxVE0yQlVaTXRSdllqdGJ5bThSNllY?=
 =?utf-8?B?R1ZPMVc1ZEdOeGx2RjZPU3F5a2Z3Q3RydEtjajRpWFpSMlFRL1hnYng4OEZy?=
 =?utf-8?B?UStaUU1pTmRRV0x4TDNKU1U2VFF0VFhJck5QWlpaUjhPZk5GSFBrcURXN0NX?=
 =?utf-8?B?WC9WeEdYSlJ2Mmlqa1ZnWnRPSmZNUDFuUFFxUnhLaG5pQVpzUlJrT0VtS1FT?=
 =?utf-8?B?UzE3ZEwraE11RXBtcnQxSkRQbVJMekdrTDI1WlVIdi9OQ01PVDExVC9rbU1B?=
 =?utf-8?B?enh0ejZxVmhzdVRwOXlremttVXZwUi9jVzhGSldHdjcvcURBOUQ1a0VHdGdF?=
 =?utf-8?B?UFFrdmV5Z2w3Z3ZJMkxkRjBZOTNBc3dHc1IvQ0JHeTZTOHM2ckxiaHppeEpx?=
 =?utf-8?B?enJTWHZycFRrQld0dUVWbGlsWTNvS0xQNGt0WDA4cUd2V1l6OEhXVnFyVm5r?=
 =?utf-8?B?RzN1MVAwZ0FNbjc5Qy9Yekw4dW5YQ0xnQmxDemo3M2NndSs3MGIzaFMvT1pT?=
 =?utf-8?B?cmkyWVRxS2UzTTZldHBmK3h0b1l1MTh5UXlRRWFyQVhYRmFsNGgrL2dpaFZH?=
 =?utf-8?B?Tk55VCtWb0ExSWx4WjBqYUh1cjlyZXAxVW5INnBmelhqTXNQZkdvNGdDajZs?=
 =?utf-8?B?dWxKN3RwakVEV2NiNlQ5TDBWL1o4SkVyZjhWZ05IcVZFSDhRR1NPUHpNNGE3?=
 =?utf-8?B?aFkwM1hxZmtmYkt5TUFoRnkyZUEyQmpvQkRqZjY2cUVZUUhkK2xlTVJTZE9w?=
 =?utf-8?B?dmMxUS9xSithNUxoWEhSQUMrM2EyMDhaYVY2QlhIMWc4VSsvTVFDL1ZCTTc3?=
 =?utf-8?B?UVBjQ3g3bm5hanhKRGYxcExRaXphTmRGSHNZQkVvNlpuZDZ6cjJ4WTlUbnlH?=
 =?utf-8?B?ektnVlBETmdvMitlelNRMnJqWkt5c29sSUw3MW9mQlRmc0lOdTdMSDhuckJw?=
 =?utf-8?B?SC9weHFpSkYrZTk3d3d0SFZjRWxqZzJpcUYwOVdZdzRGSUNBdXZWS3FQR1p3?=
 =?utf-8?Q?wOzWHiL5RfFNMzMA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216042e6-3092-4b9d-f029-08decb871bc1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:10:28.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4bqsnVJ/yQWDmlf4W+tLuEl81XIAfjlqYzqkAaz3kUJdKWqoyZ38jXW+65GDhj5rzPjn/t6m2qogG2LPYtP5PlAVH1WFBUByeF2lRdpQQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8287
X-purgate-ID: tlsNG-33051d/1781601031-36547938-9C1E1396/0/0
X-purgate-type: clean
X-purgate-size: 638
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95F9A68D678

On 16/06/2026 9:59 am, Jan Beulich wrote:
> While doing the XSA-492 work I further noticed an inefficiency with
> safe_copy_string_from_guest(). All callers pass PAGE_SIZE as the maximum
> buffer size, and with the function adding 1 to append a nul terminator
> the resulting allocations are all order-1 ones. Which we'd better avoid.
> Require respective callers of hypercalls to nul-terminate the strings
> within the buffer supplied. While an ABI change, I think it's an
> acceptable one.

FWIW, I think this is an acceptable ABI change too.  The chances of
there being any users outside of libxc/libxl is slim.

~Andrew

