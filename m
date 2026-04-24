Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOaSO74g62k9IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 09:50:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57C45AEB6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 09:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293215.1571076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGBIM-0001HN-VZ; Fri, 24 Apr 2026 07:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293215.1571076; Fri, 24 Apr 2026 07:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGBIM-0001Gj-QO; Fri, 24 Apr 2026 07:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1293215;
 Fri, 24 Apr 2026 07:49:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGBIL-0001Ga-3K
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 07:49:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGBIK-006YKi-ES
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 09:49:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb2098-2eae-0a2a0a5409dd-0a2a4508eb2e-12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 09:49:48 +0200
Received: from [52.101.48.68]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb209a-63b5-0a2a45080019-34653044e97b-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 09:49:48 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6623.namprd03.prod.outlook.com (2603:10b6:510:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 07:49:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:49:43 +0000
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
 b=sYu9MSUD2aW9LSARKOISFrLNdCB0SoZNVcTYFS0SskW7uDmcj8ey2UdBidvRWQvJ2+3DvA0LpaX6jbzlGsUW1QAVDCpG7ejMa5UKAwT34ROPcedwH9eFbYN6DlVR8tWvoDi7SdTaY5ue98Tc90hhVNyJ+8RGzHSoGgbVxOcmj36+cjsg3fFhZv7RqmLybIk+Av9kWGqTsAvmbWwKN8VlGhNiIpCVtCdZctY3QPDmDS2WaPnjwNCn8jxEagjyEt37uF4EWmbDGWWHtTxABRtLA4WlzkyDI/gWR/1ejKlfnRxa0Pm4GLEin3iuF56DK4i1YjAzNmhu10uSbzQFU0ofEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufqEaAAoAlubdRoekNwqA4c9sXLgofpIa1/D2IECkm8=;
 b=Z9yVmFu/JRqaSQQmHreny9M6520dqzAgN6b3/Obv0g632VaIZxKzJ/3YHQoY5DBYUfYCtlxdULJWhcJGAAbsB49idLynTN/9cPVH/LLvFMh61BFMiO6/WkArr2i9ifpLiA+hmR/znLkiEjTYQOsujRPJiI+kBz617br1KXFAPQyvt0kmsz01a+ueMX5cHUVwcB7gf2UrU1biUz1VPGlep0CITQA6swIc834hrN2jzNdZ1r3Rz+TKp+yZAhv/ySydfZbz4akCY5OE45XF0gL2L+zuXowAxFNCCntRV6HIr6Z/kQQFPF5Umik5Jg7D2FenojTxhs+R6IUCz7/MsrMrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufqEaAAoAlubdRoekNwqA4c9sXLgofpIa1/D2IECkm8=;
 b=w0dZIp5+qqvu7PlUUzhrVoAzIzfR5A7dwsBzlnwevIlW9kMIG816SKjkN55bH0/Yq1Rx/SobPhU0Luvb9CIxSId6ywo4ZVqAFz74ZxL3wHd7qnYdYt5NaxBnJ0MbkRo4MpqCqWn+M7+IUW+fqR39hC8/e6BzdvBqsyUa6v8riUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 09:49:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/4] vpci: Use pervcpu ranges for BAR mapping
Message-ID: <aesgkm0-b6QTxdUc@macbook.local>
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-2-stewart.hildebrand@amd.com>
 <90f66a3a-4811-4f83-a4df-204b121118c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90f66a3a-4811-4f83-a4df-204b121118c2@suse.com>
X-ClientProxiedBy: MR1P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cf79ad-af84-4498-fbdf-08dea1d60be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t6D9TbOurLFvi/D1BGNErOepnoDk7eGzw35ztQsstHhKGPGgOJDK/wqoTKMA0LfXnbrlrtNyk1fG2DYPCb08Xqk7AENCtBIrGgCpiLt/aHd8MnPrL3OBct8OL9GpfLeAynKpYDOlXL0uJFl0XnfDYdHm26/MlpuWB6dPu/HrIFTt99aZDnP49O17wmRqH1JLi8N1mu797/GwJQP/7uDJA5gu2kf0/Lox1Pi9unSV6XpMXO8yXjUrgxnOBAKg5nk8mweaf5oKAuRJQVAWbQgzHB43WzWk0jE49hx3hpaoiL2JNYw22MaIyjBxUVexKrSNOLwu9ALJhOM5zErGWx1k56bJbshPlbNx1U8cOXo+vMbH4UK7wbfBvni3Y/M9MIRLV3f8ijZHCRUJPqnzW9sr76AOW0IfZ92UukF7Ip8wCa3ZltwVXrol0Sr3hfi7S5PzjIhmxniYARhA9TFuZAcFar45yf/6XM2kNo/BUOYgzSMkJ4NOAoUDds1kC6ENpVnIteBsM9gdrBfRFjqzuTW8mGqdWOGW8KPHkfXazomJCasc33DZMVsDjMJxA8j8pSS/QAz2oSAROxHIwjaNTXQLmxtsl0TcB393DKeP3krI8vgrfVycfjTAgW5KKgaXNjW0MAu1Mnjhk8qYQ7fUZJBgmx0zPh5DpYINNagrqrmx1PR6MfG7R29hWjJcoH0VkWr8YPiKyhNyTrFBjyfWgMuU9lrOhMv4L5FIjISQKIxf0Fc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2pXdFB4YjB4UXpncG96OEJVeWdRZitLblJQTXo0UXFPdXdCb2I3SlJGekY5?=
 =?utf-8?B?cnBEZys0Z29ybXMzTkFkSFZ2ZVhUN08zK3hDWFRpRkZWTVdIelYyckh6NGV5?=
 =?utf-8?B?WnpzekVDSGRRcU9ES3BabzVXMm1jYy91RmJvRVhTTlZ4Uk15djFmV2EvQzF4?=
 =?utf-8?B?aEhFZXk5OVR4T2gxMVdnVmUyayswaHpMWlU4dUVsa3ZlODJXbmZ0Q1lxc0Vo?=
 =?utf-8?B?REt3TkdRWHFtS0t6Q0VJcXBYdVpUZE5wRTBxWW4vbjJ6MnVXcm9JYmRMbEE1?=
 =?utf-8?B?REZZZS8yRnk5dlZGMXZlNm5SSGpZWlZ5N2tmTEZpeXFFbFF0QmlVVkdLdGc4?=
 =?utf-8?B?aHVuOVdVanZmc3pvb1phSklSN3hmUW1aK2dCdVhvR2FpS3lGdndNODUyZHhx?=
 =?utf-8?B?dTR4QncyWnd4aFhRaDMxMUttTTZXV2trTHVwMTd0aC9pL1Fia1BvM2ZROFVo?=
 =?utf-8?B?SlB2MGJIaWJOa0VTQW8zYWppSm1YRlFiRVdFMDdNT2tRZXIwRTZYL2N5S2x0?=
 =?utf-8?B?TEd0cWpYSEJtb1h0R1g4SGpHMUtOYzZVN3VmMng1V2RDaFpXSlhDQ3FyMVd0?=
 =?utf-8?B?Y25JN0lMdWh6MkJFbGk3N3NzamZOK0U5RVJkUGxodVI3M3pwZXRaSFhGeWc1?=
 =?utf-8?B?SmM0aXhWY0hhaENwQVpLbVlaVytva1Y1Q2FkMVVwMTVCQ2pqSFpOc2ZwcUov?=
 =?utf-8?B?NGhpWDNyM0NORmlSTzczcCtYSnV4RjUvWDhSR2E2WVBGL1MvNDBGUUNiK0tY?=
 =?utf-8?B?VytvZWp0TXJZeTBmTkV5Q2NHdXpCMk02Q3VsV29YRjVKSzVnMnduTFAvbXJz?=
 =?utf-8?B?eGFQZWtuWEx6d1ZTR0tIKzByRW9YbjdRSnFFSExlM2Z2OHVMLzRBRjlkTG84?=
 =?utf-8?B?WFJuWUZraXBOQkl2ZGhxQXlXckpkZ2ZsVjExVDZ0UVlWN2s5R2R1b3BGdDNv?=
 =?utf-8?B?Tjl1QlgxOEl2Q1Y3VVBEbWRJV3o0VFJXL250MzBsOFA2L3JpUG1oZGFic29T?=
 =?utf-8?B?cUZSRmQ4cXZvSlFuZlV1WGNXTFRxa2N5UzNnRWcrcGNsMnlMV0xlTDBWRnlF?=
 =?utf-8?B?OERNcllxSG8rRjRMTXBEdWYxZnhCclNMRURiem4zV2Exbk9HM0tFMDBJRkFR?=
 =?utf-8?B?S215WDF0cVM1dTBqM3VOMnhUUjBCbGx1L2NGVjlIREtPWXFUWnhHTTg5NG5o?=
 =?utf-8?B?bFErU2RlelNleWtGSGhVdXArTFVoMnVRb25EMnVZOGR1eFhlODRRdkN5OWM4?=
 =?utf-8?B?OTNLWGhVM09VemFHZmpxUUloYWNLRFcrOVM5ZUxZeEN1Q1lDRVB3WVRHTlo3?=
 =?utf-8?B?TFVaOGRyUjFoZVBSbTlZTThGOHlrNTVZSmVhSHhwTTBNT1VXMmlRUU1tTFA3?=
 =?utf-8?B?WWdwS1hvOE1oN2lRUlFkdG1HZmdXNzhHeHpySjA2dVZMUmFrV3diRGNCbU5w?=
 =?utf-8?B?aHNVdEJ3cXFCMzkzODFiNzdvYjFLdkpoM0hsdDNJYjlEdTRyTFJKd1JvdHZ0?=
 =?utf-8?B?M0MwaXRSUVZFNlNOVjB2TkVwSFVWSUhrVkRyTEY5ZlRyejVibHJNYTAydTlM?=
 =?utf-8?B?SzNlU2Z6SGFmenZlaGlvaTZFcEZPemE3cU8vY2pJWklGMllKeHduZHZ2N1RV?=
 =?utf-8?B?MkRwSCtnY1VKdlo1VlFGTitVKzFYUm9nWlZHWWs0NEpXdDF3SlRsZ2JYckJV?=
 =?utf-8?B?Qnl4dllvR3JOL1ZIZlY2eGRpV2ZGeGlxQ0Jvb2xwWW1xTUg1UDhFNTFhRWFu?=
 =?utf-8?B?dVB1d1oxK2k2QmE0Vm1UNzQzMVczcjhtZmhXemw4L2thWnJFVnNwRFBoQjU2?=
 =?utf-8?B?TVJrMXh6Vnd1QldNeHcxSmFoMmZZR2ovOExhWG1Ud0srQWJTKytIVXBEK2Rv?=
 =?utf-8?B?emw1NnRmbUdPRHZqZHJOM2lVZ0JkSjhLOFUyNDRBaER5c2xYR1MxNjk2WUhn?=
 =?utf-8?B?ZWo1MngyVjBUenI2SUhNTGVhbDBJajlBQUsrRzd0RjNFVVdNNFFBZUJaT3Jr?=
 =?utf-8?B?eUgzYm1vRUVTUGsvQWQzVDRqUm9kbUFSYWtpaWYvUUg5LzJHRUcyNWYwbXA5?=
 =?utf-8?B?SkFneWtmSGhla01laDhXclFHamZRM0MxRTRPQXVRRWhSa1paT21qYjVjSHJK?=
 =?utf-8?B?VVo4UTV0b1pONzhOYXdYZnVXbko3bXgrOE5sMS9ocFBwMklCWlZndmd1cjBx?=
 =?utf-8?B?YUJMZzlyeVFKZXVvV084RWVwZTUwL2M4d3FnZ2pvMEVMSy9kdEtaUExoSWZu?=
 =?utf-8?B?R1c0dXRTWmVBUDFjcHN3elpHeFpWMjY3TWZVM1dxeTk3OTF1OC9iU09KaUFa?=
 =?utf-8?B?NE9kZWordFp0dm44OUwxajVHMmIyZnBJcGR2RExDZ0puL1pKZ00zQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cf79ad-af84-4498-fbdf-08dea1d60be7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 07:49:43.0231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5shCCyfao+EALZ9V+w/gtTrF/RFIpAnv+yAS8xy7aPkqfO+Y3R7aXcpN9J2sxcoN5dBT6URzSL3NvyYml+Jmvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6623
X-purgate-ID: tlsNG-c1860d/1777016988-C1360DB1-E1A0B5CB/0/0
X-purgate-type: clean
X-purgate-size: 2910
X-Rspamd-Queue-Id: 4E57C45AEB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stewart.hildebrand@amd.com,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Apr 16, 2026 at 05:29:26PM +0200, Jan Beulich wrote:
> On 06.04.2026 21:11, Stewart Hildebrand wrote:
> > From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> > 
> > There is no need to store ranges for each PCI device, as they are only
> > used during the mapping/unmapping process and can be reused for each
> > device. This also allows to avoid the need to allocate and destroy
> > rangesets for each device.
> > 
> > Move the rangesets from struct vpci_bar to struct vpci_vcpu and perform
> > (de-)allocation with vcpu (de-)allocation. Introduce RANGESET_DESTROY()
> > macro to free a rangeset and set the pointer to NULL.
> > 
> > Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > ---
> > It seems a bit awkward to introduce various vpci vcpu alloc/dealloc
> > functions here only to undo most of it in the next patch. Thoughts on
> > folding the next patch into this one?
> > 
> > v3->v4:
> > * no change
> 
> There are some complexities here due to the patch being part of two series.
> Once Mykyta re-submits the SR-IOV series, we'll have two (likely diverging)
> v4-s. Already here ...
> 
> > v2->v3:
> > * new patch in this series, borrowed from [1]
> > * add Amends tag
> > * remove unused variable i due to rebasing over 998060dd9101 ("vPCI:
> >   move vpci_init_capabilities() to a separate file")
> > * enclose entire struct vpci_vcpu inside #ifdef __XEN__
> > * s/bar_mem/mem/
> > * use ARRAY_SIZE
> > * put init/destroy in functions
> > * only allocate for domains with vPCI and idle domain
> > * replace 'if ( !mem ) continue;' with ASSERT
> 
> ... the v3 there has one more item on this ChangeLog list ("* synced with
> BAR write with memory decoding enabled series[1]"), albeit maybe (now that I
> read it again) this merely is the counterpart of the first bullet point here.
> It would be clearer if there the other series' title was supplied verbatim
> and in quotes.

Indeed.  I reviewed the one from Mykyta part of the SR-IOV series.
I see both Jan and myself made similar comments, I'm also a bit
concerned about the claim that moving to per-vCPU ranges is better
than using per-pdev ranges, see the comments on the SR-IOV series.

Overall however it seems to me for the SR-IOV series we will need to
allocate mapping tasks on demand, so we will neither have per-vCPU or
per-pdev per-allocated tasks (that include the rangeset).  I think we
need a pre-series that introduce the map queueing plus the on-demand
allocation of tasks in a clean way (iow: there's no need to introduce
per-vCPU tasks if they need to be replaced with runtime allocation
tasks for the SR-IOV support).

Then both this series and the SR-IOV one should be rebased over that
work.

Thanks, Roger.

