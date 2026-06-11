Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NdsZMd84K2oF4gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:38:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9BC675A86
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:38:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=biMprlnj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336211.1598092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXo2M-0002TP-UU; Thu, 11 Jun 2026 22:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336211.1598092; Thu, 11 Jun 2026 22:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXo2M-0002Rz-Rq; Thu, 11 Jun 2026 22:38:10 +0000
Received: by outflank-mailman (input) for mailman id 1336211;
 Thu, 11 Jun 2026 22:38:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wXo2L-0002Rt-Cq
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 22:38:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXo2K-00E1wz-Q1
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 00:38:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2b3887-e002-0a2a0a5209dd-0a2a4504a486-30
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 00:38:08 +0200
Received: from [40.93.195.2]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2b38cf-1dec-0a2a45040019-285dc3020419-4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 00:38:08 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS3PR03MB989171.namprd03.prod.outlook.com (2603:10b6:8:39c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 22:38:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 22:38:03 +0000
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
 b=quhVaDxMl7QiMkgL4RVHO4MHq31pI67vQwEXZyqTnIoe2tPrpCuWPUySP9Jx3PORxNd5VLScQO/u7JdIsZoFGhJAA/zje3E37l0hiYFNAdFwI9DjCQVPpnfHAuQ3aNIZe7C+VxvzQSfONFnefU8/USnNbqx7D1vyOcRNIo8x4MgUSIEIyZrdkQF9+XJHJE9JDU8+q7WodoBUX3UxwE9ADWys87n9tDl0GGv//mGjFeZ5BE23zwC88cssteaUu9StAQ3me3FqtD9etzGXMosMiIEM/FScLS6fX1euwqqkPXNKd+OCQUlLqokjpE+KQZwtKMTipqYW/o4Df/+dC5skQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdz2NGYsZ6C/lvn0NpaxmREq1wrhdoTHxpjx4YfsDko=;
 b=fxC5wCAAB/ngW5bQDoJDauogoV/k2kYxcaJSJR4WN6Zb5BLQmR8OGgG8bUVjQSishx0F9IcqoUyazGRNY+8dhvHld5mbwF77nYct7eNm7TkAB3TkKru1pXfeoV1KBp7MPntumD8GK/UNY3xwCitF+4RQeJcWYDhzWNEkW3ZFAuU5UKAFHZ3FIu/d1FNdd+gmYnBtm5LVozLNP+LV+jXdv9BL7Wtqk5XYgrN+BWjLt5ZRVzslwCNkBL/UHbONDC53KW/7uNWE1lDDMP2bBW/nrClz49zD7mzTyqrMRslkuc8WHi5S1BWcoXaYYLqLU0Sd18RfppOSExjDoraL6S/SZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdz2NGYsZ6C/lvn0NpaxmREq1wrhdoTHxpjx4YfsDko=;
 b=biMprlnjd5jTcFbcjHscT1+3UsgxjdngTjln4ofCjOsC5xsIy22BU8y2maSsalhHBNTZdbOVArwqPd3W52UUOGNAsjd6VlaBK5iHnFYCYcn8NF5OmfEZic1EJGEulU9VXgJqlt6/RrlJDAnl1TA+R0SQfjl8kg1i4R/u95R3zxM=
Message-ID: <c0261259-c4b5-412a-a676-039c31c51db5@citrix.com>
Date: Thu, 11 Jun 2026 23:37:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Mykyta_Poturai@epam.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
To: Hirokazu Takahashi <taka@valinux.co.jp>, xen-devel@lists.xenproject.org
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-4-taka@valinux.co.jp>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260610111320.133784-4-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS3PR03MB989171:EE_
X-MS-Office365-Filtering-Correlation-Id: 26be0a3f-e940-4094-2651-08dec80a198a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0KeNryoC2gvw/Xsqt4Oobw/XpovQiqht8oT+KQjVq5N/XYLNbzlH4iQiCpUYqMFYJQ//ZMt6BzUUz+zjNhSQE8/RzheimK6GaJFeEgsnsl2J+AL56u1Od+lh/EDVn7IrP9mqyM/Ea0ndvsPcYHdEKl9q71D5aSKXGfltskZIcOJyLBZIdF21z+g20AXfS52tfOrmfkTYiye+FIp+VB0hzjEl/vSeRgyRLf/B5NOYN1jHRAVKiMXRvXMfn/v9+VQ4zrRyMboYA3uEB5Dttgjg2o3YZmsEBSW/WekomyWCef4Z2U5XaPNnxbIyBI0Ekmqke0Oeq+KN0bqgfC6NW6GdOBJ7O3xwFzmIPdhcZIjIadzBj414wNpHlik7ShIDqDuRFsVgg9HN2Ta2TYJ19f2UZabK69ZmWXG2q4YvviGc8iW0oIKLzXLsrgG2Fayvlz5nQySi9kdGClDSl3z58zVTeuPanN8kEM55cl/97RqK6/UnkG7bC7+JyeBy60zbDybVyi7Ve2PXH/GhBdO+06dUtq8IW0csrQsEZgG1RvUz9XMKLNq7T4ZM/r8FPpjOfBlsMxGm5yy0JNEM9XzSSoaJOvrs7U5mo+IVdYN9TFj9UdPrIIr/XK1nKue2tfzp+UeRQ1UM5KXQARUXkauDGCtt94JKRglPFTNmdjk9V3LoJfjzbeGQXfGEKCL3c++juOTl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0NFTGVmSTNUalNUMjFYSk4xTVpwZ1FTaU01ZkpIZzhCTndwc1pTejMwWjRZ?=
 =?utf-8?B?UzlGSEFDVDBZeDlUVEFkbExyUVRpSlVRMnBnaE9IL1VzSWtPNUxOSUUzbEhh?=
 =?utf-8?B?dGV3TmJqMXBmRENFNHlTWktCOVJQVVNoeXI3cytydW42eWcxL1RpbVFsZklz?=
 =?utf-8?B?Y1lKcEFkYkR4cFdDSTdFQjJRWCtzc0NWczVLV0x6cExsZTFZK0pNSlRJcGNi?=
 =?utf-8?B?SGIwZ2gzV1VEektOa2NzUEN2cUdHYmhWZy8xdG93OFhVUEpxZldlb2tmRmxT?=
 =?utf-8?B?L0tMekd5UjZYMFVQVXpJc0NPUWJlWGtFejRBalRSb2pjWUJHaHlueWV3SWhw?=
 =?utf-8?B?WUlBSmdDMnRRaWNPVExtZjNEOEJXejNETGEwd0Z1RVJDUlFTczVLNHNJM3o2?=
 =?utf-8?B?YTdtOXJObXF5c0R6MitOTXc3eUJOT3BYYmEwZjFQVjlIdkc0VjcvUDA3VmNi?=
 =?utf-8?B?ZDRlZ2dqeUdNUlNBUHhXVDJXM1h2NlZwZFFLRVRqL1pad1Y4RnlUWXFoUUh3?=
 =?utf-8?B?VTlWalp0ZW9tcnVvZ1o4cnIwbWR3b1JyYk4yWFdwaFV2QjR2aTFEa2hsRmhS?=
 =?utf-8?B?L012TWtTQkJEZ0NXQnZaSVBjTlRNWDJzL0Q1MGh6S1paYXlsMkw0QlV5OUlF?=
 =?utf-8?B?eCsvTUlYU0lCRHpoTm1nZjMrOS9ZZlQ0dmZKM2VxV1VwUXhpR0hrTHFibmQw?=
 =?utf-8?B?Nzlwb0lvdWhIY2pVaThFL3MweEZqS3hOVUlCUldsaU5XUWhxOGlGTWcrbzNR?=
 =?utf-8?B?dGx0UDFXNFBxOXVHVDBweU12ZTJGZFo3VnQ2RnczQVFoUHNXRy8wSHA0Y2Np?=
 =?utf-8?B?d3FLcXl6czdYQWRxWnhXRmo3cGJWenVSa3B2cWR5ZWJMamF6U3U2Y1BJSlZD?=
 =?utf-8?B?WitXVFd2Qy8rMTdobEZTcVpQc0JDS1VRS0NTM1FWMEplM014OHFpaGFUQmJ6?=
 =?utf-8?B?L2RoU0tJR3J5djNvMm9IMVhlSDdCUHgxTzVwYW1YZzdBcldWbjZHNU1xZ3RQ?=
 =?utf-8?B?TEJFL0MxSjBiL1ZkSHZQNjdvVnIxNXMrYnNrQ0FvT3VGeXd0V0liNE4rdlF1?=
 =?utf-8?B?MEpyVThQNGozbGRZV08wamk2UHgwdTE5VmdGbmZVb21mQjJwVzNNZkZEWndC?=
 =?utf-8?B?TndTUXVpZ1NQWGxPZUYvblFTTmR4ckpvUkZtMDdLNXNlcWs5TUJROUVTVXlT?=
 =?utf-8?B?eFhqVVMvd1lLZFI0V2xkSGtWRDB4elMyd1dHTlhuVmlBaHBmWXRuY2NEQU5B?=
 =?utf-8?B?NXQzcHVMRGhiVXpFYURRL1RINmlLbTFxTi9JRDVvOE5WTVY4ZS9Yb3VUSHRn?=
 =?utf-8?B?VkF6d1QvOGdGMUcyczQvRnUxU1RIUmRkYWxucFVBTDFYaTJncUl2YzNCYzJL?=
 =?utf-8?B?U2ZYb2dCMWRHOW1qcVRoZzNOUERXTlNNV1o3NnBwSjB0NVZDS2YxVEJSKzBP?=
 =?utf-8?B?Ymk3dTZuRmhhd3BYMFhhREJkcDJvNFpjRmtRc0hTc3FWNHp2YkN2c1JpUjlK?=
 =?utf-8?B?RkdhZkR3REtZU2JvSFNmMThCUnVnRTJrM2RuTEtPVmw0RUFER1NRNU9QN1Vl?=
 =?utf-8?B?Z3NxMERiakxPZXYrU1NSSklaUlFqckp0VmdmQUZWM3NTcnljdkdaaG9GNUp6?=
 =?utf-8?B?T0ZFWkZsSWZ2cVlLNzBSQzZkeEQrRHFLSUw5ZmhPUG1rZlJWK3A0Zk1tKzdU?=
 =?utf-8?B?c1doclkrSHNQYWVHRHUvZElYNXM5QVNWa3FuTWMzazVUTjZnQzNCeHpPd2dU?=
 =?utf-8?B?c2FaRnB3UU5EK0IwTGRVMHZqc3hDZzRqOVEvRFNMMDdvU3hTeVJVb05PRW10?=
 =?utf-8?B?MXdJS0huRFJYM3o3aEtYMG9JV1hMUXpkckJwOVhPdzRqK2xwdjNvenhxVWIy?=
 =?utf-8?B?RDZXaXllZ1VhSEJJY2pGbFRXL0F2eXpSNnlSbzlhd2ZJT0RiMGtGbmd1N2hk?=
 =?utf-8?B?M1l2VktlRGhPMHlRSzZGMnR2UGRuTWMxU0lIVnpSSC9ES0tLTlJsYlI0V3dJ?=
 =?utf-8?B?RkRoVjlZcVFhelRWaXg0ZUV3RW85RzRiN1VTcDV2alhIME9zYnFrVHNUV3BE?=
 =?utf-8?B?MWI1WDJrK1JWbWFtbmZxdEhWaWRHQnRnOFZsSGprclErSjY2Rjc0SUNBUDFZ?=
 =?utf-8?B?UDZKdVVQQ2Z0Yk5jUVJpMEI0SXpSOXE2Y25TNVUvUVByMi8rVUJFQXFmUDg4?=
 =?utf-8?B?M2hrOFEyVVdTWm9OL1ZDSk5NWFJ0eHVqTTc2d0FWK0FYWkh5UWNEMkc0T3hV?=
 =?utf-8?B?K3BkMzBwWlBQZ0lUV01HSWRZQ1hYMUFIWThZdEh5S0lMandEN0RWc1dkSVVx?=
 =?utf-8?B?STI4N2dRbGc5ckJpYkt1QktNaHh4bkFZZXVZaW9sR3FNcWY1alF4bnc5VEVt?=
 =?utf-8?Q?H2IUpSKCfPAJthAw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26be0a3f-e940-4094-2651-08dec80a198a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 22:38:03.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFQITpJ03RmQ67ePXO2QlR0U1+ZWGePZ2Xi5i/vHnfiYhVqgwPHksATTzRfRJR2wn1P7NJRgcxO6z8IMq7S/tmMBXnIFa59VvfP3MvdevXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989171
X-purgate-ID: tlsNG-ebf023/1781217488-427613FF-F9E3DF82/0/0
X-purgate-type: clean
X-purgate-size: 622
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,valinux.co.jp:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F9BC675A86

On 10/06/2026 12:13 pm, Hirokazu Takahashi wrote:
> Make cpu_nr_siblings() an architecture-specific function.
> This patch provides the implementation for x86 and a common
> version for Device Tree-based architectures.
>
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>

You're effectively reverting 188d568db8c, but without fixing the
underlying bug.

It is undefined behaviour for Credit2 to use cpu_nr_siblings().  It
needs reworking to avoid this function entirely, after which
cpu_nr_siblings() wants to be deleted, rather than being reintroduced to
where it was previously removed.

~Andrew

