Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H6VETH4w2nPvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:58:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728AB32750A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262511.1555000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ph1-0003YV-Q3; Wed, 25 Mar 2026 14:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262511.1555000; Wed, 25 Mar 2026 14:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ph1-0003Vq-Mn; Wed, 25 Mar 2026 14:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1262511;
 Wed, 25 Mar 2026 14:58:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5Ph0-0003Hw-35
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:58:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Pgz-00H94M-FS
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:58:45 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f81e-5cb7-0a2a0a5109dd-0a2a450b8c88-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:45 +0100
Received: from [52.101.52.57]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f823-ef63-0a2a450b0019-3465343945fa-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:45 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8032.namprd03.prod.outlook.com (2603:10b6:806:45a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:58:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:58:42 +0000
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
 b=yrOZvG87EWg2+nb8D2wy4UXJeKw94N+vnlnZHBiIX1qvPOQyozCmu+itxY8/EukLpJ/w+Ida/YFBlZW4hBXLF1ag1+5lGHBbyWG50G+0xHjylMyNp1adyGFWH1Js+Drm5dlDtVzVhhmGeLcF6zZ+d1uZ/iEKwncRi1j3CzR7O7XvKiS0lEYnDgUuYRaXTuMXpWgU17RfXywLuFc4QCrbDLNriAJZ34FBeP0K4/G4PyHcTrkCtmUZNr+VWs5oU+JDht7DfeaaHd02l/oSEJgyrN6xr3Sj8/dHOvBuQWtCaPnouPl4veEg/QT7glYXcep7EfkH2yTPsrffgBfTz6Rg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEgJ8Wd5qW4VAjfsP1HrFdECze8KglxkMRJ4l8ASAB0=;
 b=JYz8VkFiJeUV7GhVv/mkweX8N1FBLB4kBUnKy0nk9S/9p644R/W0BxA9Tse5SP3v26M2ZnfwMHjRIc6iE2tnj0mhNNJRBjPVJz9dmfUPNPcC75TZHFF0ZnPNgHJzUWsQYgoSYQOK2W2mctmTFaV654uZLJ3LdLBuWOx8OJZOZnv8CxlU/86cq9nA22oaDIRmAj8Op4kkfLcP8gv66ntwW6v3qDRIfucHvUETwMw+odzSDdff9Lu05st1XbsP+uBLGg1DwpOOyDdeU6xXE5dX3TpipN4DzKdS55JoWQSGNJM21KJE62wANKnx6ZyTFc9a97i91XXXmyt8sZ8/8XiW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEgJ8Wd5qW4VAjfsP1HrFdECze8KglxkMRJ4l8ASAB0=;
 b=pAnYjCspYhtEyK+cRQ8dyslOlEPqx7OB/58KLBcYQTWNS47W0yYhlahiDbhtxTefg+exHf/OyiQ4g73edQmBA+5wGjX2Reu30d3bUdHnAGJsIHXTTeo+ZuFa1nYLG2rtTClnobNMNnqdhEB4x6fKZKGX4GzXDfEZUr7TBMUXav8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/4] xen/uart: switch ns16550 to use pci_sbdf_t
Date: Wed, 25 Mar 2026 15:58:22 +0100
Message-ID: <20260325145824.31601-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325145824.31601-1-roger.pau@citrix.com>
References: <20260325145824.31601-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0046.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: d60645bd-1fb3-42cd-946f-08de8a7f01ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1QC4Z8XYk+zkmknKj+WDxIUxvTy6QewrXQw7dZyr4rUMn8B0Imd3zLS92xf4cDz7Tro1siCeHHYP4JvXX7b15o15Oyo9bKqZjX019caYJ0nzwSg02ag64/GN2hJgOVW0cbWdHx9dbmVsYHaa1Pf9hTJfTJc7+AIKyId5NjOMveBvoZGzVCAE9oajNMclK0R5kwKvGYgJ8s4YFA2mPDh0O5lNxqewqleCkhY8VJbvsn7YKf/CzY1AHqdXUAzPhJiq/vlW1gLVR5uyHhxKbUX8Mekm5HXqOzKQkemYnkdJjhG8FnRnbUfMeimfw611yN/M+AdUcoIGndyOLgR5PoT4O0ACHAd44tuk9SyvUszws6VQ7H4F2whJXQ0SQGvvz6YMnAE04YO0FhbbLtnCxfHmZprFQ/fEpWhPnqaMfh63S4JpGEA3ws/SciBEJTe4kMX+K7YalmaB2aIuUeTYNatw7LiA0jRCLH9stQHDpEDZ/8B6evagZGE6pT0CPPC4A3U8d0i7SQM+IMjX+kHv0UCgifQuiSubZVl3vA5wKNkr4FsdbAlYJBibOLKp8jemjNKca5WrZvy5jrw50E9IGjdIZN+8QV34xwQFLwf0T62TO/cBKc88qdKsMzltUAbwizL4xRfMc4kJKj7HzmqMnP10m/pP29wfRb/glkTFW0wvsf2gCuNwn/mb42jrFmJWhv58ejP+7nx3ykuR+kqMpmg3ao+uvzK8gEe/JbN6S/xGgAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0JxWVd5UkJlTlJYOXIyZXFwNmJGU0l4U2xZbGY3Vk03Q3pqSUlLNm9WT3dN?=
 =?utf-8?B?dDNhSWpLYTQxNDFaWEpIMVJnTzJ4RWU3aUw5Q0x0b2x1S0FUM3plRjZEbDRj?=
 =?utf-8?B?WGdhVExCYi8xaE4zTXdHTDVJMGZPOUkydldRNDl6aVFvaDUxU0U2U01ZT09m?=
 =?utf-8?B?ZXpIZWtwNjZ0TEJZOVN2RFV1c09nVjBGL2lOeDNzQVdpZUtoYVd4bHdSSnls?=
 =?utf-8?B?YlZCU3ZNRzlUbHVZTlNhTkdOdTZuOENXSUlJUVF6cG4vN3RHR3FEUzU2WmV3?=
 =?utf-8?B?a1JmRi9YbXR1WENJUXcyODkwdDRWRmE4MXMzdCtURU8vLzJTV2JYQjkyMmxY?=
 =?utf-8?B?RmNrL05FWEpJUm41WVEzaE1DSkJjWVZMMXE4eDVVR1hKNERuUi9qVUQwYUhS?=
 =?utf-8?B?bTRZRmZDaVhoQktPUHV5cDlzVmdZMjJTd280L214cUpDNmU2dWp4YmxUTkVF?=
 =?utf-8?B?cUplc08xbWUxZTZIZVFsVmc2T3IyZU5SMC9WSzZta0M2MHJ5aDJXRGdweUlU?=
 =?utf-8?B?VGRrZjdUNloyZWZKUnFVaFZpSis2ZUJBTDQvK25xRml4K1A5VDdCajBSZDc5?=
 =?utf-8?B?bysySzFHay81UlJXTXNMUEFjdzgwZ2hLTXZacXRRMTd1V3Nzc0Q3cWlrZDR4?=
 =?utf-8?B?N0JNWTNNUHIvbnV5R3hzeXhKcjI0cUw5VFpoUnp5cTdyOEJkVkZNYmM2UC9V?=
 =?utf-8?B?ckJjcW1ZYzNZR1ZsK0t5R3V1ZVcwMkE3MGU3VXlncXBYV3FuZVFyVXhQTTZC?=
 =?utf-8?B?ci8wRXF4T05ST3FuNjJNTW1Tb2tERlZieVpFMldQSmt1WHZDZzE5RFk5aGNH?=
 =?utf-8?B?ZHFvVnVTUFZQV1FoSkF6RmNReHhVclBzMmlzQzZJUTR4RzYyNFl4SlBaR2xH?=
 =?utf-8?B?VzJwUjFRaHZTaTcxTmVtNkEveVNWMUhJT01TcnR0am5BeU1vM0xGbTI1KzB4?=
 =?utf-8?B?dTRqOGU1em1IckNhU01jQTZaanptQWxXMDJtQWEvNC8rV2l0Y2pZV1ZlSU1l?=
 =?utf-8?B?eXFvY21LVk9wUUhyeDdnTEN0Zld5T1dCMUVpa1FHYTdvalgvZUt2UytWRGZp?=
 =?utf-8?B?YXZLUzJsY25EUGx5aTZaU3RqSWZzRFZwZDZPYkJHL0pldUJaMFVTaHVtenZz?=
 =?utf-8?B?eDlxWFNOMWs5bFpYVUZxRU1qbkpoNmVGZnk4U1Irbll2ZmppOUR2bFJqb3Iy?=
 =?utf-8?B?N3BXRzRsalpxMExJMTRvTnpZVDlxQjZ0UTIvKzJGWUVaMzZaVHAzbEgrZVZR?=
 =?utf-8?B?MEthc1Z3ZGJxU3BYaC9Bd0pQeEF6RGUrTVpSMmJwNGp1VDkzR2NWSWI3Rmp5?=
 =?utf-8?B?enEvNmJmZE5BUHQ2L0R5NHQrWDVyTzRjY2o3T3h6ckJKOGVSam42MkdCZVFJ?=
 =?utf-8?B?M29tTmpML3dFOWVrM3dNdGVDYlVWNGJFNFcrdzZSa0ZoMWhlcStlcmlFVnB0?=
 =?utf-8?B?YUQ1WUw3Vng3bzhlWTB2WGpJbVl0QnA2MDZvU3lONHdKVWhSLytUMDczNmtr?=
 =?utf-8?B?bkFqZFNQbXIzeGpNdHREaUorNnh2YUlyUElJOG5NY2kyUjB6OGpEZnFtM1pz?=
 =?utf-8?B?UVV0ODNXUVNFUUJodjREZ2hqNFlxUEJTU3pzR1dFY3RJSXgrV3pXcjg3YXFH?=
 =?utf-8?B?RVNEVEhlUEtGcTc2T1IxRmJhdUJhSEx1d1ovckVhTExlVDkySWFIcmdtUWx5?=
 =?utf-8?B?ZGlEcnoyYmVlbHZsK2RpUGF4aHAwWkFIUmNUaUd6d1pSaXBYUngzeENnbkN5?=
 =?utf-8?B?Q0h2bWpabEVoN2hxbXpGSlFlQ2hJUTF3YkpsdzVsTEY3dVNnMmFVeUkrQzdm?=
 =?utf-8?B?ZEJuRDc1NlFzVW5HNVdSMSsrb1llbVUxZWlzTlRZdEdtbGp2WnNPZjROWnFo?=
 =?utf-8?B?dm9CYzEwZFdWMWMwZGo0Y09YanVuUEIzS2E5UTBSNndSUGhXa0owSnFLZVlO?=
 =?utf-8?B?dm1JdTI3M25sV2Q0MlBTWGlYTWhpT0piemxoc2FkYTRIZ2dmdjhwRkJRUUdo?=
 =?utf-8?B?cTQ4NDdZNGNRUmpKWCs5NUd0NzNrZW5PV2RveXN2NzhQZnJ2WTcxb0h2MTRB?=
 =?utf-8?B?WVBWV1R3cFJlZCtLbXZCM1pzb3pvcUR0VkZCVDhXa25EMTVaaU5hZGhyY3Z2?=
 =?utf-8?B?NUlqMy9jcDJ4WnVWWU5NTDlndk9PVVNVRDJGcWNwdEZQVDhhQ2JQYlRvTUdJ?=
 =?utf-8?B?bXdDMnp4MExwSStVZGJlSTRlWHllSVJxMVdtVVR0M1I3aTQrOHVKc251WnhB?=
 =?utf-8?B?S21TOGJ6cnliSVduMGpiY3pHa0FUK2t2a2dsOHN0RW9taGJlQlM1SFdHQ3JQ?=
 =?utf-8?B?QXh4RlNLZTZTSlJjWUs1N3hrRjlBc1c1THpqdExGZUovWTVtL0p0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60645bd-1fb3-42cd-946f-08de8a7f01ab
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:58:42.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKib/BomPupOiiXOtPbmkn9ZZD/ciFx4/4s0gbxWHPp8I7CQzyEmpeyLVL36ABxXfbjUuDJTWpEJarIcPhBy1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8032
X-purgate-ID: tlsNG-42698a/1774450725-BB0A9112-9A782E94/0/0
X-purgate-type: clean
X-purgate-size: 13785
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 728AB32750A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/ns16550.c | 133 ++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 75 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 41d6380367ca..da3b6fdf99d9 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -67,8 +67,8 @@ static struct ns16550 {
     /* PCI card parameters. */
     bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
-    unsigned int pb_bdf[3]; /* pci bridge BDF */
-    unsigned int ps_bdf[3]; /* pci serial port BDF */
+    pci_sbdf_t pci_bridge;
+    pci_sbdf_t pci_device;
     u32 bar;
     u32 bar64;
     u16 cr;
@@ -286,14 +286,11 @@ static void pci_serial_early_init(struct ns16550 *uart)
     uint16_t cmd = 0;
 
     if ( uart->ps_bdf_enable )
-        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                       uart->ps_bdf[2]), PCI_COMMAND);
+        cmd = pci_conf_read16(uart->pci_device, PCI_COMMAND);
 
     if ( uart->bar && uart->io_base >= 0x10000 )
     {
-        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                  uart->ps_bdf[2]),
-                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
+        pci_conf_write16(uart->pci_device, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
         return;
     }
 
@@ -301,19 +298,13 @@ static void pci_serial_early_init(struct ns16550 *uart)
         return;
 
     if ( uart->pb_bdf_enable )
-        pci_conf_write16(PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1],
-                                  uart->pb_bdf[2]),
-                         PCI_IO_BASE,
+        pci_conf_write16(uart->pci_bridge, PCI_IO_BASE,
                          (uart->io_base & 0xF000) |
                          ((uart->io_base & 0xF000) >> 8));
 
-    pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                              uart->ps_bdf[2]),
-                     PCI_BASE_ADDRESS_0,
+    pci_conf_write32(uart->pci_device, PCI_BASE_ADDRESS_0,
                      uart->io_base | PCI_BASE_ADDRESS_SPACE_IO);
-    pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                              uart->ps_bdf[2]),
-                     PCI_COMMAND, cmd | PCI_COMMAND_IO);
+    pci_conf_write16(uart->pci_device, PCI_COMMAND, cmd | PCI_COMMAND_IO);
 #endif
 }
 
@@ -453,17 +444,16 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
                                 PFN_UP(uart->io_base + uart->io_size) - 1) )
             printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
 
-        if ( pci_ro_device(0, uart->ps_bdf[0],
-                           PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2])) )
-            printk(XENLOG_INFO "Could not mark config space of %02x:%02x.%u read-only.\n",
-                   uart->ps_bdf[0], uart->ps_bdf[1],
-                   uart->ps_bdf[2]);
+        if ( pci_ro_device(uart->pci_device.seg, uart->pci_device.bus,
+                           uart->pci_device.devfn) )
+            printk(XENLOG_INFO
+                   "Could not mark config space of %pp read-only.\n",
+                   &uart->pci_device);
 
         if ( uart->msi )
         {
             struct msi_info msi = {
-                .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
+                .sbdf = uart->pci_device,
                 .irq = uart->irq,
                 .entry_nr = 1
             };
@@ -505,9 +495,8 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
             }
 
             if ( rc )
-                printk(XENLOG_WARNING
-                       "MSI setup failed (%d) for %02x:%02x.%o\n",
-                       rc, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]);
+                printk(XENLOG_WARNING "MSI setup failed (%d) for %pp\n",
+                       rc, &uart->pci_device);
         }
     }
 #endif
@@ -534,8 +523,7 @@ static void cf_check ns16550_suspend(struct serial_port *port)
 
 #ifdef NS16550_PCI
     if ( uart->bar )
-       uart->cr = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                  uart->ps_bdf[2]), PCI_COMMAND);
+       uart->cr = pci_conf_read16(uart->pci_device, PCI_COMMAND);
 #endif
 }
 
@@ -546,19 +534,15 @@ static void _ns16550_resume(struct serial_port *port)
 
     if ( uart->bar )
     {
-       pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
+       pci_conf_write32(uart->pci_device,
                         PCI_BASE_ADDRESS_0 + uart->bar_idx*4, uart->bar);
 
         /* If 64 bit BAR, write higher 32 bits to BAR+4 */
         if ( uart->bar & PCI_BASE_ADDRESS_MEM_TYPE_64 )
-            pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0],  uart->ps_bdf[1],
-                                      uart->ps_bdf[2]),
+            pci_conf_write32(uart->pci_device,
                         PCI_BASE_ADDRESS_0 + (uart->bar_idx+1)*4, uart->bar64);
 
-       pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
-                        PCI_COMMAND, uart->cr);
+       pci_conf_write16(uart->pci_device, PCI_COMMAND, uart->cr);
     }
 #endif
 
@@ -1218,13 +1202,12 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 uint32_t bar, bar_64 = 0, len, len_64;
                 u64 size = 0;
                 const struct ns16550_config_param *param = uart_param;
+                pci_sbdf_t sbdf = PCI_SBDF(0, b, d, f);
 
-                nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                               PCI_HEADER_TYPE) &
+                nextf = (f || (pci_conf_read16(sbdf, PCI_HEADER_TYPE) &
                                0x80)) ? f + 1 : 8;
 
-                switch ( pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                         PCI_CLASS_DEVICE) )
+                switch ( pci_conf_read16(sbdf, PCI_CLASS_DEVICE) )
                 {
                 case 0x0700: /* single port serial */
                 case 0x0702: /* multi port serial */
@@ -1241,10 +1224,8 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 /* Check for params in uart_config lookup table */
                 for ( i = 0; i < ARRAY_SIZE(uart_config); i++ )
                 {
-                    u16 vendor = pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                                 PCI_VENDOR_ID);
-                    u16 device = pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                                 PCI_DEVICE_ID);
+                    u16 vendor = pci_conf_read16(sbdf, PCI_VENDOR_ID);
+                    u16 device = pci_conf_read16(sbdf, PCI_DEVICE_ID);
 
                     if ( uart_config[i].vendor_id == vendor &&
                          uart_config[i].dev_id == device )
@@ -1267,29 +1248,26 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 }
 
                 uart->io_base = 0;
-                bar = pci_conf_read32(PCI_SBDF(0, b, d, f),
-                                      PCI_BASE_ADDRESS_0 + bar_idx * 4);
+                bar = pci_conf_read32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx * 4);
 
                 /* MMIO based */
                 if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
                 {
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
-                    len = pci_conf_read32(PCI_SBDF(0, b, d, f),
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
+                    len = pci_conf_read32(sbdf,
                                           PCI_BASE_ADDRESS_0 + bar_idx * 4);
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
 
                     /* Handle 64 bit BAR if found */
                     if ( bar & PCI_BASE_ADDRESS_MEM_TYPE_64 )
                     {
-                        bar_64 = pci_conf_read32(PCI_SBDF(0, b, d, f),
+                        bar_64 = pci_conf_read32(sbdf,
                                       PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4);
-                        pci_conf_write32(PCI_SBDF(0, b, d, f),
+                        pci_conf_write32(sbdf,
                                     PCI_BASE_ADDRESS_0 + (bar_idx+1)*4, ~0u);
-                        len_64 = pci_conf_read32(PCI_SBDF(0, b, d, f),
+                        len_64 = pci_conf_read32(sbdf,
                                     PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4);
-                        pci_conf_write32(PCI_SBDF(0, b, d, f),
+                        pci_conf_write32(sbdf,
                                     PCI_BASE_ADDRESS_0 + (bar_idx+1)*4, bar_64);
                         size  = ((u64)~0 << 32) | PCI_BASE_ADDRESS_MEM_MASK;
                         size &= ((u64)len_64 << 32) | len;
@@ -1303,12 +1281,9 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 /* IO based */
                 else if ( !param->mmio && (bar & PCI_BASE_ADDRESS_SPACE_IO) )
                 {
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
-                    len = pci_conf_read32(PCI_SBDF(0, b, d, f),
-                                          PCI_BASE_ADDRESS_0);
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
+                    len = pci_conf_read32(sbdf, PCI_BASE_ADDRESS_0);
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
                     size = len & PCI_BASE_ADDRESS_IO_MASK;
 
                     uart->io_base = bar & ~PCI_BASE_ADDRESS_SPACE_IO;
@@ -1341,18 +1316,14 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 if ( param->fifo_size )
                     uart->fifo_size = param->fifo_size;
 
-                uart->ps_bdf[0] = b;
-                uart->ps_bdf[1] = d;
-                uart->ps_bdf[2] = f;
+                uart->pci_device = sbdf;
                 uart->bar_idx = bar_idx;
                 uart->bar = bar;
                 uart->bar64 = bar_64;
                 uart->io_size = max(8U << param->reg_shift,
                                     param->uart_offset);
-                uart->irq = pci_conf_read8(PCI_SBDF(0, b, d, f),
-                                           PCI_INTERRUPT_PIN) ?
-                            pci_conf_read8(PCI_SBDF(0, b, d, f),
-                                           PCI_INTERRUPT_LINE) : 0;
+                uart->irq = pci_conf_read8(sbdf, PCI_INTERRUPT_PIN) ?
+                            pci_conf_read8(sbdf, PCI_INTERRUPT_LINE) : 0;
 
 #ifdef CONFIG_X86
                 /*
@@ -1591,18 +1562,22 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 #ifdef CONFIG_HAS_PCI
     if ( *conf == ',' && *++conf != ',' )
     {
-        conf = parse_pci(conf, NULL, &uart->ps_bdf[0],
-                         &uart->ps_bdf[1], &uart->ps_bdf[2]);
+        unsigned int b, d, f;
+
+        conf = parse_pci(conf, NULL, &b, &d, &f);
         if ( !conf )
             PARSE_ERR_RET("Bad port PCI coordinates");
+        uart->pci_device = PCI_SBDF(0, b, d, f);
         uart->ps_bdf_enable = true;
     }
 
     if ( *conf == ',' && *++conf != ',' )
     {
-        if ( !parse_pci(conf, NULL, &uart->pb_bdf[0],
-                        &uart->pb_bdf[1], &uart->pb_bdf[2]) )
+        unsigned int b, d, f;
+
+        if ( !parse_pci(conf, NULL, &b, &d, &f) )
             PARSE_ERR_RET("Bad bridge PCI coordinates");
+        uart->pci_bridge = PCI_SBDF(0, b, d, f);
         uart->pb_bdf_enable = true;
     }
 #endif
@@ -1683,18 +1658,26 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
             break;
 
         case port_bdf:
-            if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
-                            &uart->ps_bdf[1], &uart->ps_bdf[2]) )
+        {
+            unsigned int b, d, f;
+
+            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
                 PARSE_ERR_RET("Bad port PCI coordinates\n");
+            uart->pci_device = PCI_SBDF(0, b, d, f);
             uart->ps_bdf_enable = true;
             break;
+        }
 
         case bridge_bdf:
-            if ( !parse_pci(param_value, NULL, &uart->pb_bdf[0],
-                            &uart->pb_bdf[1], &uart->pb_bdf[2]) )
+        {
+            unsigned int b, d, f;
+
+            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
                 PARSE_ERR_RET("Bad bridge PCI coordinates\n");
+            uart->pci_bridge = PCI_SBDF(0, b, d, f);
             uart->pb_bdf_enable = true;
             break;
+        }
 #endif
 
         default:
-- 
2.51.0


