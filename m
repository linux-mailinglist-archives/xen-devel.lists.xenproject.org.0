Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YCcNF5vUJ2o53AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:53:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08665DFED
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:53:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=rU1CkYeg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332516.1594964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsDH-0007V0-AX; Tue, 09 Jun 2026 08:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332516.1594964; Tue, 09 Jun 2026 08:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsDH-0007Si-7n; Tue, 09 Jun 2026 08:53:35 +0000
Received: by outflank-mailman (input) for mailman id 1332516;
 Tue, 09 Jun 2026 08:53:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWsDF-0007SZ-TH
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:53:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsDF-005GPG-9F
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:53:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a27d47d-bab6-0a2a0a5309dd-0a2a450ab0ae-38
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:53:33 +0200
Received: from [40.93.198.12]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a27d48b-56b3-0a2a450a0019-285dc60c9adb-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:53:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB8271.namprd03.prod.outlook.com (2603:10b6:8:292::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:53:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:53:30 +0000
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
 b=PlX/Tuy1KfctYu4tNLwKo2JrzUYMytK5VcMsHiUzMKzkwOUsy/26WBQ0iU/6NkAmrGjysNnA3WKOtN6AiMgY2kqriCJDSANgW0oC84rhRVPwNb1hvft/XLj6B3AbTVscWc7CzojtF7QQcir+8SuVauBj1ERnfpE6kZoMhKPmdpTKQkZeJL1yabXb7pro+cXKz/+ogYuSK5ZFfB4PzOF66kxLqdrJo+WfyeACkFBjFCbVIDNVqLAPUyJR/rJnKh/IKH1X0kqc/zs4R5AM0nPLkOvCEa2+SJxXG1J8FoZpHGV45Duxq8uA+QVSgFgd3t/nYpcWdi7722T27nSqGik4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=611dfETS4SvX/rN/nMYtpHa/fW49uNNHY2sZ4JaLyM4=;
 b=eMrSMj+EQfBfV9pl56MCl049tIHQfVg2khCoHUJN8o4SPbeMlbfOLzh82cyms0KQK1/lzREMugkwEwpGcmiWWFkw9ggjhsKHAuGgcGv4n230XQzVn/q4BpoV14yaHGMD1lZarJJp0DcJDIzqZTFoBNn21OTVyjaFIs6MqyAyMLvhTlTLL4nfiWOErXeRA03hSdo9svScqC1SDOSNqofuT1ky3ZjrHgLYLymDpUvH3phtf4FWT/8/TJxwyX600+Bc1jMDn1YNeI2MOwCHyrZ30KMKpaIJ0CjOZhe5+f8iiJDBavKWgQykdhdMJpXGV2M8tsgIg64N+lRbi6gK06R+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=611dfETS4SvX/rN/nMYtpHa/fW49uNNHY2sZ4JaLyM4=;
 b=rU1CkYegNROe6hrAj/rCZNUG8efFvUuuc2XGoZPwpXGNSlO9wtWO7BnoZxPg4hlhv9qf3aCdrTORYq4IXzOySCyvBGTb/yqJKQwx6IwvjiHns87Bq1VG3rTMzQeridK+JjNpnB9kdj2pb80x3OFef6/m6FTqO8mCtxKGpvFKbBw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22] xen/pdx: fix off-by-one index in offset mask calculation
Date: Tue,  9 Jun 2026 10:53:22 +0200
Message-ID: <20260609085322.92856-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 021cbf2d-8e0e-491f-06bd-08dec6049439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zw95K2C7ZXE65AbmtiBfjNZYkpAuZ1nP9y1mdQjINMJCZX8vC0H9P3o8oqwRBOglWB6sNlBv/v90WLHDVVtY2T0vypveV5cQoc5tJ0cOPiaYuFRpn6GzMbWg5s9r7AvxmPj8ZnurdqAVHmjI9SOZWmZYGq/IRrt8sgee/FjqR/7l40CX5CiCFCDDPy0ci7eiOAeFN6YqGvih19ZzfmwS1+cG1tmXT6ndhdKQm4ZbwkwsCHHR6FkwifIL8G+UT1l1uC3c89/A0CcLRvnURhibE2UhSfv3ih1OSFNIlNXVMo1hE6cqVwksReUtm4JfGvE5VsyjrScnxNZ3ihuf6DPT+H6qfURbbA6DumzoNZLxn5JamDCk21OcozoOJH2+xpHGek67kAFeskMeZXrTU7YMpwH62fFMd74SYTjvA11r2wte+nbPWBT5HBMLY2qL4F4TopZi7Pqvg42jjDobm/htK4pPUyQV3zQI2V79Q3lnFWQBuJIztUbxiKBhvr4qLb7blJ9aT957Kcet7JP1T+7lIbDybPEBGnzQvTuOrG1IfWGSo4lowZ0xK8LAaV48VUq1WG4jfCVCy9JQ7mzy76V6S+N8mok/vsClm4FDyCwOzfZX5HW+uUNOhjkb28qM4vud/zxi3NLPY6ti/nSb1qeOrTUZnLmWtSMpwOxi4lXdBmBs2yqXgB32F833J+tEEHxt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVQZ2pLbHJKaFhIeVlTdlQ2dDNhaHAwRG1oR2U3Y1BnUEgveFZmelh3dVM0?=
 =?utf-8?B?OUYrZDNEWVBlY3l6a0NudXdBei9BcE1DcjFvdElJSnY5YVZSYUxtOXpBYnl2?=
 =?utf-8?B?aHVMZy9UdTUySXRVRDBqWXdEdGxuYzlzVDZObXZTNkdHL0ZoR2w0ZEJ3V1BM?=
 =?utf-8?B?NHVOdktrMEIvWFY5RFFRTXhxczFQZS9uVExzdXJMeEhvZEo5Qm02RE4venM0?=
 =?utf-8?B?aURVZHhOa3RnMGE5SlYrZUhSYlJSeWErYkJaemRQVU9DTE10K0lsbmJLMzJE?=
 =?utf-8?B?aEE2RUhIeVZETVBZc2hsWVhuaWdndnErY2VTaXNSLzAzWmNPcFd4bk5LeXlZ?=
 =?utf-8?B?bkM0ZmlROVNtWDJFT2R4UGRtOCtYUXZlNGxib3dBeThKenlWNEc1T1hhaGxp?=
 =?utf-8?B?ZnVpU2xKVWZMZ3VPZDh5T3huUzA2UC9QSyszS0NmaVpsaERLcC9uaEU1S1F0?=
 =?utf-8?B?aXhVL054N0loTVhPSWxVeU5XVXk0QUtrR1EwdTVEekh5anJVd3gyOS85V2ZH?=
 =?utf-8?B?amJDb2QvNDJrZ0JXMTFaeGJyY1B4TWZKbnFXTzlQY1d4UFZrc3lNd2gwcWpY?=
 =?utf-8?B?WktRNERwVVN4bzI0c01jOW5HYjlkaEtUOU1QbVFxYm4rcU5zVGF1Y0pJMjRP?=
 =?utf-8?B?aDZCZ0FyRUw5Z205WmV4MllYdGNnd25pUm9VUTB4MWZzNm5kWWVWa09VODBF?=
 =?utf-8?B?MVRiR1lNTm5pU3p2MnFBYVh0dlQ1T09JRU95bHRidUxEZVM2U1d2OEJOL0xJ?=
 =?utf-8?B?cFBldUs1YkhuY1RSVnd6QzdzVzgyR1YwTnNYbkxIbjRVWmFYNS9hem1RUE50?=
 =?utf-8?B?UVNzOWU4ZHQvWXhOVmxlM1JsVFRXN0ZVYkptdDhDNVEvbVpLSGNJU3gvUjM2?=
 =?utf-8?B?WlMvSG9qbFlndFhNak1xUENaZVZCY1hkb3dwTzhzWXRxNW9vYi9JWFZGV3kz?=
 =?utf-8?B?cllyWFNNbFhyYlpuYU1ZMEtyL2FCRDk0WlhlSTBaS3RwOVVpcWVkR2MxZnJI?=
 =?utf-8?B?MEdteUlyd2xJcytGajczK01ycUVRZ05UekR3a3NVY1VMZnp6ZFBUWUZJTlUx?=
 =?utf-8?B?VmhZbUVvSEJBalA3TjZXMWpHSmlQRlNYQlRid0tMT0xJNGM5dU1zSVZXakZj?=
 =?utf-8?B?dG9ROG0wNzRFbXptcTZPQkhkazYzZktkM25xTU9TRU5lVGpWU2hUR3hhUlM1?=
 =?utf-8?B?dU1wRzFZN2VybCthSWtkTExsdGYyNFdDbFcxTUM0dnhyaXJmbWtOOUFHL1Vq?=
 =?utf-8?B?THMvai9udFBybStLa3lReVV0ODE5M3lYZ3pOODFkMkQ4QzRNVDZxZ1BvZnBj?=
 =?utf-8?B?b3oxbjBGR2RRTlhCZkUxMmJreHVrTkxDZVB6V1p5VE4vWm1MeXdGM0U4MHRq?=
 =?utf-8?B?eVFzNmdiNG1OMklmV2RNL0l4VnZubnBqak1UUjhRWVQydm93WUZPVmx1RC9P?=
 =?utf-8?B?NjFpVTV2dzlSV3FUeUFIMVpzL0Izc3dQejU3WHFmcytkam51NmswRThEY1cy?=
 =?utf-8?B?am5IckQwRkJlRThRa2Q2ZXNDenYyZ0dHOVEvaXlaVmhkZ2pGd3QyN1lzbkNi?=
 =?utf-8?B?T01KODIwWDViMFEzWk1oRG51RXB3Qm1wRVkyOUdnVE5TbFoxNDNYblZjNGNo?=
 =?utf-8?B?dGpqQ0FObWUrS1ZzNVk3bTBCL00za0xEWU1wUHZJemV5ZCtoeE5nV2kzNVlj?=
 =?utf-8?B?eDZWSXpleUxJUkx1aFBLOW12YkNPVmV5Vzg5YUJLWHZ1aWpWL1FIdWtleVY0?=
 =?utf-8?B?L3VXUHFyVkpTSVpQeEc2Q0R1MnNHZXNtWUJvVERlMW9DTFRFYlZJSmpETURp?=
 =?utf-8?B?dm94M1NQWG1taGNSSmlXSDV6c0lERzJLUVhHUzFrWkNPUlpjRmUvR3RZbDhQ?=
 =?utf-8?B?ZWt6bnNTSlpYUnNGUFpTWTZuc2RHVFR2TEw0ZlYrblR0dXp6YTZabTNNU3Vn?=
 =?utf-8?B?QUJ3U3ZXcEFqUk1IcmNiVXB3MTVUdldFeVN2Q0ZPbm4zRHd5UDhLUGtrK1RQ?=
 =?utf-8?B?ZXBLZTUxMGFzZktqNEhYVjBXa3dPQ0kydTljWE5JbVB0Vm5YaS9Lb3dmTmU1?=
 =?utf-8?B?YmFjMDVxRGtudnBPU1B2UUNnWk1VYmtkU1ZFNU9QWnRTdC82STNVQjlHTSsr?=
 =?utf-8?B?TWV5Umx1cFZZb0pjR3lvUUx5NEdJdnVSSVhUcmM3RHJNVzRsdms0cVJiQmxF?=
 =?utf-8?B?MWhkQTBsV2dqVUF2U1JFUE82ZkMreUdQdHJqN1NwZko4S1RadzB2WXBZSnZx?=
 =?utf-8?B?aVNhbFlHakxCWGVSQU13YjN6NHJjcHJBNyt3dTRzZjE1TEVGcGEzUUlsMVJp?=
 =?utf-8?B?YS9FYWo4RnNXNUF2Q0hPTzFLR3JvSTRJTU5Od2FBK1FYZzZTN2xIZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021cbf2d-8e0e-491f-06bd-08dec6049439
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:53:30.3902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpPPikMgt1DQ+dxwilpwK8Wt6DWWeuE+G0FYcT6QWNpyRWckatuVQZXnVG18P+GkNzTUDICXE1VCxi6t6WFslg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8271
X-purgate-ID: tlsNG-4011c0/1780995213-709668B7-16E1E357/0/0
X-purgate-type: clean
X-purgate-size: 3519
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F08665DFED

Adjust the mask calculation in case the last range is merged with the
previous one, as then the mask must be calculated from the previous range,
which the current one has been merged into.

Instead of fixing the off-by-one in place, move the calculation of the bit
change mask to the next loop, after the ranges have been merged.  This
simplifies the logic by consolidating mask calculation in a single place,
possibly making it less error prone in the future.

Also add a test case that triggers the bug being fixed by this commit.

Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/pdx/test-pdx.c | 14 ++++++++++++++
 xen/common/pdx.c           | 13 ++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index d783186577ef..ba57f1793011 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -191,6 +191,20 @@ int main(int argc, char **argv)
             },
             .compress = false,
         },
+        /*
+         * 2s Dell R740, merging of ranges causes mask differences in PDX
+         * offset mode.  Useful for checking mask calculations.
+         */
+        {
+            .ranges = {
+                { .start = 0x0000000UL, .end = 0x0080000UL },
+                { .start = 0x0100000UL, .end = 0x3070000UL },
+                { .start = 0x3070000UL, .end = 0x3870000UL },
+                { .start = 0x3870000UL, .end = 0x6870000UL },
+                { .start = 0x6870000UL, .end = 0x7070000UL },
+            },
+            .compress = false,
+        },
     };
     int ret_code = EXIT_SUCCESS;
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 7e070ff962e8..a84c7d19ade4 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -391,10 +391,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
         if ( !i ||
              ranges[i].base_pfn >=
              (ranges[i - 1].base_pfn + ranges[i - 1].pages) )
-        {
-            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
             continue;
-        }
 
         ranges[i - 1].pages = ranges[i].base_pfn + ranges[i].pages -
                               ranges[i - 1].base_pfn;
@@ -402,19 +399,21 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
         if ( i + 1 < nr_ranges )
             memmove(&ranges[i], &ranges[i + 1],
                     (nr_ranges - (i + 1)) * sizeof(ranges[0]));
-        else /* last range */
-            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
         nr_ranges--;
         i--;
     }
 
     /*
-     * Populate a mask with the non-equal bits of the different ranges, do this
-     * to calculate the maximum PFN shift to use as the lookup table index.
+     * Populate two masks: one with the non-equal bits of the different ranges,
+     * another with the bits that change inside regions. Do this to calculate
+     * the maximum PFN shift to use as the lookup table index.
      */
     for ( i = 0; i < nr_ranges; i++ )
+    {
+        mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
         for ( unsigned int j = i + 1; j < nr_ranges; j++ )
             idx_mask |= ranges[i].base_pfn ^ ranges[j].base_pfn;
+    }
     /* Mask out the bits that change inside of ranges. */
     idx_mask &= ~mask;
 
-- 
2.53.0


