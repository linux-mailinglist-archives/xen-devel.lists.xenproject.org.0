Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NUrOKvY0TmrsHgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:31:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98B57254A5
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:31:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jgXRXArC;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356889.1611410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQUN-0003Jh-Ql; Wed, 08 Jul 2026 11:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356889.1611410; Wed, 08 Jul 2026 11:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQUN-0003H7-Nt; Wed, 08 Jul 2026 11:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1356889;
 Wed, 08 Jul 2026 11:30:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whQUL-0003H1-Ra
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:30:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whQUL-0084yQ-48
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:30:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4e34db-2eae-0a2a0a5409dd-0a2a450ba77e-42
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:30:48 +0200
Received: from [52.101.48.62]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4e34e7-ac48-0a2a450b0019-3465303ebb9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:30:48 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DSSPR03MB989212.namprd03.prod.outlook.com (2603:10b6:8:377::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:30:45 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 11:30:45 +0000
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
 b=zMhYm573VF981Z8D15LuVQLt33bfHVzXY1Uhc/AwIsEZ9PVdJZ0sVCnYoU9Odz2Oe9dOud8B/uUe6RJMF7gfnAlamWqFZlueUujX45yATFM+OOuqtk4rTNIoLE1tiQ6vbC6TnLX/3h1HJU/krb0MOAqPhyc7ueKxYDpKlT3UCC3Ok5xAAM5+NoP2SxlApzqW0VD3kVOFw5m2PVOlNikhS7hujPOy/LatwUHzOmIwzgEHW+zyWZVGgGk8k357chUbHfdE7hzkKCO+v//BNwMI7fuWmBZetWmx79XIPMMCq8uDpvkwIPOvwRhgSkiHQatlOuXRhXSr0OuLyyhr+WFXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8mImnlolV6DBbysK5xAgct6B/dWPRGvnSNtWNOB8vM=;
 b=lmyBFxew4+8tyy5XPJyJUuFo9FIkkxM7GAW19siOybCofDgzp4k0Un19lEf61kH7ybC1GCYVL0P6uxSqJMqkqDuHgaoc9hc5GyXYscyQIE3ZZeRcnlJ4wK0WtEZMYxC250wIE3SqksELUE73vsUdFY+n50NdyJyL3Q8espsS5uxY9QlDMwspJTrl4nUUXeuR919N977ztTYVFnJf6GBGA9OAD2S6V8lXoF3g7PgCvBgbATZ/+ilwibWbq4hYPYbUSNFOU/iJAjD/wO2IbEmCVuRgBDTxpMZjPJZLRLQNvkdgGbH2KqF7wtdhEX0OjxznErlWL4XCe14tPlhFFML8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8mImnlolV6DBbysK5xAgct6B/dWPRGvnSNtWNOB8vM=;
 b=jgXRXArCZNR7YxHO4bAxW1Ux/Lf55NjvVNUZRk6mNf1luGTNjD+UeONZjwpa6V5kK0Iaxh79kidI9c58yhXzeeBKqFHu9Xp4RQ7RZzSzfykAR43Y6q1H50BXKZxbVC1LhNVmJmTtsz844xfMy1hceSGIwlkoa4HeO03u1pOOXnk=
Message-ID: <1cce5057-3f17-4144-acc7-b343718c431f@citrix.com>
Date: Wed, 8 Jul 2026 12:30:41 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayan.kumar.halder@amd.com
Subject: Re: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20260708074919.33381-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260708074919.33381-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0265.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::18) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DSSPR03MB989212:EE_
X-MS-Office365-Filtering-Correlation-Id: ab050045-297a-458c-99f5-08dedce459ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b3aK35UW600+VqHemFU4eO38p3tGVi7ObWtRMgjQ/P9Z/KvWMVkqDbxcddtEzm6rINfOKMBm7Y5ywXM3Yw+i8Ph0vVVYrO8qCqLtGQ4p/y+i5tzetTTZYTynnr7RNzR9WEY1uWfupUlJm4KUb0tJ4B4DHQt8kGvknMiLTbsu8EabVNqTWT3jlbxCawl7GGGBwZTgNJQwTiYLdB8FWnvE7V8La2f9QxwTVN6TIyznGqRGvI2foULHSw6FgtUcm+NtID9Muj/48mskU3me/6PVMoEHERXqvpAFiSlJpNkQP8bGcw4EZbN5HDufiCt75pH3N40fWHT3ylGAS8S7zjfw3FjDqLcEewR2Xn7zu5lpM8DFAYTBwHSHl2sn/DBxblEiOdGoNrr7pw2dajCPeJoIbnjDqmtmTJNno95spqH9BGW0poJDsi9x+FkmpwCIa7bzm9QGM549TjO3sSSM6gZJI9BpxABu9h+f2nPZQoL0zf1PGzO83IWUoDvSOABt3W+NGVWqFqBYY0BPWPEd9yGfrPRHTaNBFd8jFLMnLTtoCdYp4PjNAmzA6kvgj4Gy1Yn8DOxrlvutB3H4+1P8l25lPMVX9I0tvYTFG3J7HHLTBcLMYWLUMpqr5hcLLElv5ZjrItEnUMDwc8ARZhYsi4vGtkcGLU/qBMS8+VqEut2PG5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3hOWGpKUUgyd3laMi9heXd2ak16NmRGRnBBajU3bFRJY01KVGJaV0pkUFBC?=
 =?utf-8?B?UlFSa1FmeFM3OWtuSVN4N1k5Nm1WclltN0RxUC91YzZHWTU1NUdqdmlIWHNv?=
 =?utf-8?B?ZVg1bGQyUEFiekFQcVJsWVY3R3JjdFFlQ253WkRDUHJrUVRqMldrV21WVkRn?=
 =?utf-8?B?QnRuclBmZ0Q1b1pKdUlPd296N2FjMnNOQnliWmMwcGFDbGJQNGI1UUlQcG13?=
 =?utf-8?B?Q1BkNXFUUjNMckx0YXFwM2VvbGx5dlp2dklDL1VSdFdtczh4ZUdUalBKUlVp?=
 =?utf-8?B?eVhHVzAxRWVZd0FaS0R1V0VPdjZXY2E2QzA4N1BVSnc2aUFRdDJpVjdxQUdB?=
 =?utf-8?B?QnBIbnJPQVZnQldNY0RJS0ZyeXlBZFQ1WWMzYW54ZkVDa09SZHFvcXZFeTB5?=
 =?utf-8?B?Rmx0SGtpUFZqMWM5cG85bUJ2bCthdCtSV05EWmw1QjQ5OTlURkhjRDg1dUdR?=
 =?utf-8?B?N3I1ZWlUaHo1NjlMNWlZV2JzczNPWXZ4MjMyYStRa1pPZ2wyNno5NVZJZnFG?=
 =?utf-8?B?RzVQZFlSTHR2UjNJYXFsUEllbXZiNm16dlBJU0gwWkVsandxTk4vSkQxRmU4?=
 =?utf-8?B?TllvODd5aWxGZ25tYTUxYkgyOGJxN2JxNUFNRDhaRkJuQXo2WXk3ZXVaVzM2?=
 =?utf-8?B?cDJ3Q1ZGQVlUUDZKcDRXc3UvVmp4RFhaZ3h4akVwVnRFRHllTWYwM29BT080?=
 =?utf-8?B?Y2duNjBxRlZ1OWxpL25ob3pabklleGFURUhKNTRjTDJEZ0UyeFdvcDZ0T2Rx?=
 =?utf-8?B?VEVab2d2U2F1ZmNWWWZJUVBwdERreG94TnZ5M2xaODJnMnljQVpENm1sZE5X?=
 =?utf-8?B?ckxlWkpTeU4vWVVXNWhLUG02UmkxbWtWaHZBL1UvVG5oNUt6Umd3L0Vza1RE?=
 =?utf-8?B?K1B2ekQ1VTJVeGpJWGRodzdJQ1NvazQ5Mk9hU3lncmdOQTRJSmZTc0d4OGZ5?=
 =?utf-8?B?TDlvTk1ZdE1pWXFCcjh0TmdoQ0JxUTlBdVZnQ1NOVDNkYlhTQUJ2aFFSZTJs?=
 =?utf-8?B?OHIzdFJ6dXZuQkZOTkVTOFhodlZWSlU4T0lXWGhjWEMyZStwNkttaTNtV1N3?=
 =?utf-8?B?WXlXcTRLVHB2aGM2VFROSXVpb096S0ZDSll2YW1pSEhLTlErUk9QalpJR0hC?=
 =?utf-8?B?UWxhZ3NpQUhrT1M3YTR3MDFHSnVrZG1Za2xnVlhrd0I4bXdZS2NhMW8yWkxK?=
 =?utf-8?B?R3dHQVZoOE13VXM3Z3NrSnZjL1RzWjROK2VMQnFyZ3VTdk83M0pRSWprUG9M?=
 =?utf-8?B?b1VIYnRYYUxOalVTeCtaOWU5N2lpdzQvQVh6TW1EZnVNeU5QbEJ5SDJoLzhO?=
 =?utf-8?B?dEYrS3ZORTM0ejJsYUtiMzM5WUNUc0FUT3Y2cWRBZUk5a2c5bFcwVnEydVI4?=
 =?utf-8?B?bUNlSjA4ejVpNC9YUUpCR3JERVNzN21CSGNBcFU3TUFXaVkwblpQQXZ5bCtV?=
 =?utf-8?B?RDVtallkZkEyNXl0OUVQQzdaU0FwekViTVlBZEMwWEw4OFNvd2xMWmF2Nkh2?=
 =?utf-8?B?YnZ1OVluY2l2TzlLK1lZYVVKR2dySXJWd25Vcjc5dkp5YlJVUlhwS3dZbVpm?=
 =?utf-8?B?d1pUR2NiZERNMUFRdWxHNS9ZanRVTXlBazUzYWdKU0haZXZWTlhuQUZYSVpT?=
 =?utf-8?B?L3FLd3BvRzZMcHpWQW1WTzNrZldYME9vSlMvWlVNTTB2M3RqdUVuTGtMM1pQ?=
 =?utf-8?B?M2I0YmlUbnBiK1NsRWFmUXJSZ3J6YUFkQTBXQXl2UXZyYjViS21uMzJkMGVZ?=
 =?utf-8?B?MWlTNFZKWllHZnhtMHdUM3BXdkNCWlk1bTJHU21WSTcrWE1pZHloalVzZXVU?=
 =?utf-8?B?ZTVveXI5YU95TFBjbVpzOHJsTENFd0Q2amxNWjhGYWJQajJVeDFhazNXS3RZ?=
 =?utf-8?B?cmFMS2hrbklVOGdtVzh3dzlUYWJ0T0pkbUFFMG14ZUZRTzlkNE4rQUNPMVNv?=
 =?utf-8?B?bkZlQlJNNkFrWHB1WSs1Z09KVjVTR1VBcDNCbTQ0cEpKUnZGMk90dlhaUGE0?=
 =?utf-8?B?bTZZQk1XL1VYN0puU3BSRzJsai9SeXRtNXVxWlhTeWxnam4wc2Z0WVpSTlpI?=
 =?utf-8?B?azVFTlpYM2U3c0NjQXhib0JqSXkxT1NWNnJ5ckI1UlVRUVNOeFpNUW4rMGVC?=
 =?utf-8?B?QkVlRzhjQUppSmpmQlUwckFXTk95QStqVnhNVGxseGF5bThTN3JNWEpqdjg4?=
 =?utf-8?B?azEyN1NQQnBvcytQS2RaT05saHk1UTRxUk5rM0VkSEJFRkFadVRVK3EvNDYz?=
 =?utf-8?B?eDNBWnpMTEF3a2wwaGRVVjdYNUE3dkJMaUxIZHJXV21uNWZGcUphUGE2b3dY?=
 =?utf-8?B?ZFRhNkYydE1uVWZzVCtEdFptNE4xbFc2WkRPd2ZNa2N2WC8zcDBOdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab050045-297a-458c-99f5-08dedce459ff
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:30:45.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayUxurP/oTd/rcbpmbr8C0GkV00RhWOlLvJ0x1J5sAxRc2KlNRGGavUF3dnfgcCnmU5JuYkQLAhh0xoaM8hO/3VqaKNVnaFDMkOzeoasCYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989212
X-purgate-ID: tlsNG-42698a/1783510248-3B732220-484DD90C/0/0
X-purgate-type: clean
X-purgate-size: 3038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:from_mime,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D98B57254A5

On 08/07/2026 8:49 am, Michal Orzel wrote:
> construct_domain() creates the secondary vCPUs in a loop, but on a
> vcpu_create() failure it only prints a message and breaks out of the
> loop returning success. As a result the domain can be constructed
> with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
> below max_vcpus.

I'd suggest phrasing this as "partially constructed".  "holes" isn't
really what's going on, given the linear nature of allocation.

Because of the object visibility, and because constructing vCPUs isn't
atomic, all code needs to cope with d->vcpu[] having no, some or all of
d->max_vcpus constructed.

>
> When the guest probes the redistributor of a vCPU that was never created,
> get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
> dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.

That's unsafe, especially as vcpu_id is calculated from an MMIO access.

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index c1c4d6f71ea8..c01cc596d593 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1111,10 +1111,10 @@ static struct vcpu *get_vcpu_from_rdist(struct
domain *d,
     unsigned int vcpu_id;
 
     vcpu_id = region->first_cpu + ((gpa - region->base) / GICV3_GICR_SIZE);
-    if ( unlikely(vcpu_id >= d->max_vcpus) )
-        return NULL;
 
-    v = d->vcpu[vcpu_id];
+    v = domain_vcpu(d, vcpu_id);
+    if ( !v )
+        return NULL;
 
     *offset = gpa - v->arch.vgic.rdist_base;
 

Do you want me to submit this separately?


>
> Return an error instead of breaking out of the loop. Both callers
> (construct_domU() and construct_hwdom()) already propagate a negative
> return value and fail domain construction, which is the correct
> behaviour: a domain that cannot provide the requested number of vCPUs
> should not be brought up.
>
> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/arch/arm/domain_build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 550617f152bb..b46574fd32aa 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>          if ( vcpu_create(d, i) == NULL )
>          {
>              printk("Failed to allocate d%dv%d\n", d->domain_id, i);
> -            break;
> +            return -EINVAL;
>          }
>  
>          if ( is_64bit_domain(d) )

On x86, we explicitly tolerate a failure to build all of dom0's CPUs, if
at least one did get constructed.  This is to increase the chances that
the server can boot and at least let an admin in to look at things.

However, I can see why such a behaviour is not wanted in a "single
pre-packaged system" as used by automotive.

~Andrew

