Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E/PnGnIJKWqXPAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 08:51:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA766663F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 08:51:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=Af4xD7UN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333996.1597103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXCln-0000Qq-0x; Wed, 10 Jun 2026 06:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333996.1597103; Wed, 10 Jun 2026 06:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXClm-0000OU-Tm; Wed, 10 Jun 2026 06:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1333996;
 Wed, 10 Jun 2026 06:50:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wXClk-0000OO-VR
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 06:50:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXClk-00ANJw-8U
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 08:50:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a290935-bab6-0a2a0a5309dd-0a2a450aee22-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 08:50:32 +0200
Received: from [52.101.66.88]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a290937-56b3-0a2a450a0019-34654258bee2-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 08:50:32 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by VI1PR03MB6253.eurprd03.prod.outlook.com (2603:10a6:800:138::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Wed, 10 Jun 2026
 06:50:28 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 06:50:28 +0000
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
 b=lcWbvYhe6v9UDDMRhvwpHFJ5rknKULuPq6chlVxvxXn3n1e9BOx7ULBosusSbfiufTJTOAMkgAdL/ixyaTLGFYw3pTi76tiCchfL3eBhGE56427vkZrk4NDVV1gWrqGkTAWvfLGEK6f3cy1RQj7ev8gEn0d5sUxjEaDQx6f/6PDFmBb/foegBStvginN3N+1a8paKbbJq/ngRjPr8xlhwlF8IOZhqLj/CxKVvfQUAPztB4CO0UDTiCba4qEkpD7bTkJEROxxGPobCXEMkwd2FYnRB4LNPm18D8+Atipkl9YDmlLLrwcB9dUFJCO3z6FR77UuIJvtRuOPBUArJMD0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pP87thhXIgbwA+WweNhF1apOKmvKrNauHXGewln+GCg=;
 b=wuhtxNA5gVfNKiBOEWvytbchl6SlVa1U7XqGFLUAULUftekfCUyvY5Iz+2pqT6O8idjlhDY6pLGB8lSJVXGUiw1nt2zH4U8k6j197SKV6fj8g1BwuOdMYXfhdQm1w/KhiWaDqwPB7bDtnqrRDZghBW6zlZDl7FK0ruE8u6boQm8fmb1haZCxjE64BoaPNFwvZGOEAB8ZJUG1ZLx0oCsXr6zFjm/Kd/IcbpXx0O+vDMkIMejT6kHqAXhdi8zSfjJ+H2xrapQBCjvFqpoy7dk14dXK3xD+OcWgzYB9P3iZ4E2ky3w4Tc5syRt7HV50uTfyw8P92XNdJDFBslhgulZU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP87thhXIgbwA+WweNhF1apOKmvKrNauHXGewln+GCg=;
 b=Af4xD7UNgVi220vKhQfTdiQyHir6EzpN+Hkn2WFZerkoIpsH2DYYJEFf20O/hZtmqmlk+p9wonS/rTPrEfXErJYe7vd9QihoX0kcqk9T/vky8VhRhYmUapUGmQqYCu0DV0+jrjGdQcFUWKsUxP9SbCJZGCKLJ/rdI/d2g6gGvGtPPh8MlZCdlu5W63IITeDl9k4bJgP+Na/5iRmv+/B0AEF0qVCsnyp2guKmbHfZecCqLo+pgVljKcmm3OBLetE3oomeK6JltweBEdHPB2uo5eVnLyZ/3J4r7ozbd00I1dX+/tXzglt/v8bW57HeSqxYgBfkntOM1+ZLhVhxMZQrVA==
Message-ID: <cafef621-024f-4c3f-862a-4c61a1ab4293@epam.com>
Date: Wed, 10 Jun 2026 09:50:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/rtds: refill cur_budget when extratime is toggled
 on a depleted vCPU
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
References: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000512.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::666) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|VI1PR03MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a627cd3-755e-45ce-688f-08dec6bc8e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lw85EEPu6f9KtmlktuRtui51uVZzCXPBJIx/DI4gOd9mnqaQWIveL4qYLXRBjZIC7qdmAoqovpjJB/fA2s1oXCQKSEHzIFcZVmAP/FJq8Q+BuZD+3ghUH+ZtAPF85ff72RfPZ/RVJp1h7srruP2FI+mslomXcXqRibZY7M1XXsKPEpE6Rsp9kowVbK8KLSk9sa3yJTqugI/b86nHiVeoKXHTxm9r7RfFNTN4kXFyM9DlLBATcUKR969PzYfDNeDtetaoqMmmDLGD2q3KGO+RaGf+G70zhG5Iphjbe+zqlFsSqliWfqAzJ5x0yu56mYIL8axClaJHBoqF+5HC4LHdBtvpPsSobvpXnTStHEPsoZjO8LHnAH3QKzv5HRJQt4CEF+i8Oc+gXMVn3jhgxZcn5I3RPUqw7orPwnN4xe0tt6tSRrbezeVNEdDNome0xXRYba24fOrRmAYNhz1wWGP3EUo5o5MC2eVg9szb3XxOLiXTBrGQTjH89XcEjERlfYeotkwSjYvLCTuh1nknnTedcl4QCruC0NwvuW6mwT/LoFamfvnDATh9/y1PkDuGhi80fjagDgDZL7ioqbp8F3Hind/qpL0riTJXo7oEIFGfwrpOng8s9bra7qmv80I2Mm0dH7g9CNAXp2vOzwjaIn9MsQo1pB/fhznTaa3JiFp+BDbfLv0DX0/jcgA4pVZi7GMd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29Wc2h5SW5od1A4VUMzSUVSOW1MVGhIeXgvRWVoNExNakQyUEc4YXBNS04v?=
 =?utf-8?B?N2ErOUNwYjhwODJhb1pBRitQVFR2L1dpb2FNdWRpeGdwNDZHR3NFV2ZWdVYy?=
 =?utf-8?B?SnNJem5taUluMmgvMTlHZnpyVVhwRWhIeGkzV1FyeUdwQnhjaXhLa01WOHU0?=
 =?utf-8?B?R296VTZveTR5TDZqMzNlNlhuSU1RNnBOUkQwVFFidEkrY2Qza0FEc1B2QlRu?=
 =?utf-8?B?OHpOeWhoek4vQVZlbGl0SWhwazdhV09mMWR6U1JmQUZVdU54S2ZFcTJzWllh?=
 =?utf-8?B?dkQ5eGpOOFQ1M09aUjFWV3RWQ0xCb1RIa3JTem9EanNGNjA5SG9MWDloUC80?=
 =?utf-8?B?MnJBaXVVOGFuMEhnK05JUnVGb3pmMHhXWUVkWFV2dFRzbi92Q0pvNU5ldXRa?=
 =?utf-8?B?OWVKUnVQMU5mTTJyaHE0d203UnhPRGpsR0RBd29vTnNzL2tJcjBDSU0yd0Ur?=
 =?utf-8?B?aGk3S1YrRERKWUROTXhoNW1XVURsSGYrYnZzS0FsWi90SitBOVFZUHRuQkRL?=
 =?utf-8?B?aGVaZnpBa3lqQUJ2NXVoajh5c3RMUUVmRGp1cWFIN0lrUzk3OGl6bTRocWo2?=
 =?utf-8?B?bExsZVd2YzFBbnZGZ244WGJhWnVyTHR5VW9HandEdEVKSThrbW1xZVE2ZVZJ?=
 =?utf-8?B?WUl5U1lndCtRemZRazlKZ04ySjM4UVRQMGZhRXVhT2xxd3BzQjVaMExmeUNk?=
 =?utf-8?B?SG42dGRhSHpnY2NtbGJsRXJMQVcvcjZJTzJadERYTXVkeXRadUpxVVpoMjNN?=
 =?utf-8?B?ejdRZk5oWm82cnJnTzJ1RU9YdlNyYWZwcVpzRCs2TzJqdnVCL1NXUE8xSUND?=
 =?utf-8?B?S2lXS0FNOTVpVW92a1dJblp0VzJORU5tWnNVNk1BK1JmdVppdVFXL0xvK29Q?=
 =?utf-8?B?MFBtaThOd0lZR3dKU1o4d3Z1a3BpSkh0cHJyQ3NpbURaNVhhTlMreUUrSGpk?=
 =?utf-8?B?NTZnbFA0emlYbld3UkVveWRFWE1GeFRqV2NaZ3FYZU5ROTBScGVHTFFMeHpX?=
 =?utf-8?B?L2prWEdsR2xiYTBlNGluT2d2R3FVV3MvNWZtMzBoVm03ZXRJazc4TC8yTWhL?=
 =?utf-8?B?MTdLSHNkUHVXTGdNTDhOdXNkQXVyNFVCd1JjQVdHUlJRVDdoaGE3cVAxOXJm?=
 =?utf-8?B?MU15NFkyejMwT2hTN1dCaXk1MkNmRWw3RGdwRTBEOEdLRFZmcUJ0Y2VhNm5m?=
 =?utf-8?B?cTZ5YVpCaXhoWUtXSytRb0xMMXZvOGp5UHJVclBpQUdvUks4ZThsOEFUbVJC?=
 =?utf-8?B?R01FdU9PaWREaGZzeGFWOG14ZE9JWjYycWtYa0pUNzh6NHAwUWFHYnZOTGZr?=
 =?utf-8?B?NWJ3d2ZndVZMMXdBM2pVenhTNzFqNzd6empZNTVxbjBNNWVGRnFoRldUNTV2?=
 =?utf-8?B?YnBwMmRIaTFVYnB4eDA3Z3FDN3pHMWkxbStwZkhhV2RzbkI1V0YyWFFsRkZl?=
 =?utf-8?B?dHlRZW1abHA4NjJUam1pRkNyK2R0d1pxVDd3WDE0OHJ1a1RuV09rMi8xeGda?=
 =?utf-8?B?aThNM2N3OW9KS1JZRHBVL29Oem9WMkNXdzE3MVlzUXdWa3JDN0ExaE8rRGxO?=
 =?utf-8?B?YmpXbXlBdlFMcXpPNXNHNVhOSERkcWgzTVltRVQ2MUpqU0lqWUZ3WkthaUFk?=
 =?utf-8?B?bnh4OEhJNUM0MU40eGgyeTlua21mOGEvL1JaUFpmaW4yMU50aERTakFlVkE3?=
 =?utf-8?B?djdUTGs3dEZYU3RRYzQxaDdUd1RSVVhyZ3hXaHYwSC9HN0FudFBZWkZvdUhU?=
 =?utf-8?B?emNVOHFjVnBWU1lNeGpGU202c1RBNlR6Wndkc3l4MGVSYzZvbzdleURYUnFP?=
 =?utf-8?B?WDlyMkZoUUdPSU5jeDJHZm1BR01odnhtU1JpWFBVTWEwMW1sdWU0Zy9ENi8y?=
 =?utf-8?B?SlpNZEYrby9Cc2o2KzQ5Z045Z3MwemxXc2ZBN1p0Vk5jYVdMcng4TURmREla?=
 =?utf-8?B?UFp0SFh0QVpMbDBVRmxiUkY2UmNUaG9zZndMTG1vTnFNSmY4bUVONU5oT0hK?=
 =?utf-8?B?Smp0TU9TZEs4L0FCVjFBbWlVbXlzajJ5bVM3allUMk9MZW5JYVFKT0djSWJ3?=
 =?utf-8?B?RDZEQ3hSSElIcDFVTFkxdFRMREV3bnZuRjlvdFhONjZxMEdRdjBDbjBkQUNO?=
 =?utf-8?B?ZzczV25sa1V2cjZ4cWdISlQxZlg0S0ZodjIwTnV4YTdmSmM1Uy9PdGh6dENu?=
 =?utf-8?B?Kzk1VjBDQmQxckJPcnBiZ3lzWkV5VXYvWWxBQzRSV1FoK3JvMlZLb0ZLSU8y?=
 =?utf-8?B?TTc0ZGFPaXYwQ0JvbXZuZndLRUhHYXgyckV5R1lRWkFzQ3c2K0dHeldscVZk?=
 =?utf-8?B?UFpyc0s2dGxQbFRGWk5yQzNJYjRmTlV3UHVwWG03QlhlRlBvMFV1T0J3Vngv?=
 =?utf-8?Q?m6mn2+9hVIIRA2jI=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a627cd3-755e-45ce-688f-08dec6bc8e5e
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:50:27.9468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLzlZ26Pvqdj2DB2ulDuBDAjCDVd+mkUs4+sVTCXFhpijR4mWAriDJhRyiDZDvaOLAU6M1IpubPXLhiSubSL7gFLk9kdrqutG5j6iRIPkhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6253
X-purgate-ID: tlsNG-4011c0/1781074232-7357C8B7-865E0B11/0/0
X-purgate-type: clean
X-purgate-size: 6184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,epam.com:dkim,epam.com:email,epam.com:mid,epam.com:from_mime];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACBA766663F

Gentle Ping.

I've already got R-b from Juergen. Maybe someone else will have time to 
review?

Oleksii

On 20/05/2026 16:57, Oleksii Moisieiev wrote:
> XEN_DOMCTL_SCHEDOP_putvcpuinfo can flip the RTDS_extratime bit on a vCPU
> that is currently depleted (cur_budget == 0, possibly sitting on the
> depleted queue). rt_dom_cntl() touches only svc->flags; cur_budget is
> left unchanged. As a result the next code path that calls runq_insert()
> on this vCPU - rt_unit_wake() after a domain_unpause(),
> rt_context_saved() following a delayed runq add, or repl_timer_handler()
> after a replenishment - places the vCPU on the run queue, because
> has_extratime(svc) is now true and runq_insert() admits extratime units
> regardless of cur_budget:
>
>      /* add svc to runq if svc still has budget or its extratime is set */
>      if ( svc->cur_budget > 0 ||
>           has_extratime(svc) )
>          deadline_runq_insert(svc, &svc->q_elem, runq);
>      else
>          list_add(&svc->q_elem, &prv->depletedq);
>
> The very next rt_schedule() iterates the run queue from runq_pick()
> and trips the ASSERT(iter_svc->cur_budget > 0) at the bottom of the
> loop, panicking the host. Observed trace:
>
>      Assertion 'iter_svc->cur_budget > 0' failed at common/sched/rt.c:1035
>      ----[ Xen-4.22-unstable  arm64  debug=y ubsan=y  Not tainted ]----
>      [<...>] rt.c#rt_schedule+0x1558/0x33e0 (PC)
>      [<...>] core.c#do_schedule+0x2e4/0x15b4
>      [<...>] core.c#schedule+0xb14/0xe50
>      [<...>] softirq.c#__do_softirq+0x20c/0x3d4
>      [<...>] do_softirq+0x14/0x1c
>      [<...>] domain.c#idle_loop+0x194/0x558
>
> Minimal reproducer: pin a single-vCPU domU to a pCPU, program RTDS with
> extratime off and a low utilisation (e.g. budget = 10ms / period = 100ms)
> so the vCPU spends most of its time in the depleted queue, pause the
> domain, issue a putvcpuinfo that sets XEN_DOMCTL_SCHEDRT_extra, then
> unpause. As soon as the schedule softirq fires on the pCPU, the BUG
> hits. The same sequence is reachable without an explicit pause: any
> window in which rt_dom_cntl() runs between burn_budget()'s budget
> exhaustion and rt_context_saved()'s runq_insert() also closes onto the
> same broken state, because the per-scheduler lock is dropped between
> those two points.
>
> The semantics for "extratime gets exhausted budget refilled" already
> live in burn_budget():
>
>      if ( has_extratime(svc) )
>      {
>          svc->priority_level++;
>          svc->cur_budget = svc->budget;
>      }
>
> Apply the same priority-demotion-and-refill in rt_dom_cntl() when the
> flag transitions from off to on while the vCPU is depleted, clear
> RTDS_depleted to match, and - if the vCPU is currently on the depleted
> queue - move it to the run queue using the same q_remove() +
> runq_insert() pattern already used by repl_timer_handler(). The vCPU
> remains on the replenishment queue throughout, so its normal
> replenishment cadence is preserved.
>
> The complementary transition (on -> off) is already safe: clearing the
> flag only narrows the runq_insert() admission condition, so subsequent
> depleted insertions correctly route to the depleted queue.
>
> No other call sites need changes: with cur_budget restored before the
> flag is observable to runq_insert(), runq_pick()'s long-standing
> invariant (every run-queue entry has cur_budget > 0) is preserved.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>
>   xen/common/sched/rt.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
> index b156f61afa..18e39977be 100644
> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -1465,7 +1465,41 @@ rt_dom_cntl(
>                   svc->period = period;
>                   svc->budget = budget;
>                   if ( local_sched.u.rtds.flags & XEN_DOMCTL_SCHEDRT_extra )
> +                {
> +                    /*
> +                     * Turning extratime on while the vCPU is depleted
> +                     * (cur_budget <= 0) leaves cur_budget unchanged. The
> +                     * next runq_insert() on this vCPU - from
> +                     * rt_unit_wake() after a domain unpause,
> +                     * rt_context_saved() following a delayed runq add, or
> +                     * repl_timer_handler() - then places it on the run
> +                     * queue because has_extratime() is now true, even
> +                     * though cur_budget is 0. The very next rt_schedule()
> +                     * iterates the run queue from runq_pick() and trips
> +                     * the ASSERT(iter_svc->cur_budget > 0).
> +                     *
> +                     * Apply the same priority-demotion-and-refill that
> +                     * burn_budget() would have performed if the flag had
> +                     * been set when the budget ran out, clear the
> +                     * depleted state, and - if the vCPU is currently on
> +                     * the depleted queue - move it to the run queue so
> +                     * the new extratime allocation is picked up
> +                     * immediately instead of waiting for the next
> +                     * replenishment.
> +                     */
> +                    if ( !has_extratime(svc) && svc->cur_budget <= 0 )
> +                    {
> +                        svc->priority_level++;
> +                        svc->cur_budget = svc->budget;
> +                        __clear_bit(__RTDS_depleted, &svc->flags);
> +                        if ( unit_on_q(svc) )
> +                        {
> +                            q_remove(svc);
> +                            runq_insert(ops, svc);
> +                        }
> +                    }
>                       __set_bit(__RTDS_extratime, &svc->flags);
> +                }
>                   else
>                       __clear_bit(__RTDS_extratime, &svc->flags);
>                   spin_unlock_irqrestore(&prv->lock, flags);

