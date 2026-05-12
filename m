Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFL4F9spA2qw1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 15:23:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9530B521179
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 15:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306767.1578556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMn4G-00028l-8b; Tue, 12 May 2026 13:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306767.1578556; Tue, 12 May 2026 13:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMn4G-00025r-33; Tue, 12 May 2026 13:22:36 +0000
Received: by outflank-mailman (input) for mailman id 1306767;
 Tue, 12 May 2026 13:22:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wMn4E-00025f-9D
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 13:22:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMn4D-00GqOI-Je
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:22:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a03298c-e002-0a2a0a5209dd-0a2a450a8d3c-20
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 15:22:33 +0200
Received: from [52.101.57.67]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a032998-56b3-0a2a450a0019-34653943cbb8-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 15:22:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB7053.namprd03.prod.outlook.com (2603:10b6:806:326::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 13:22:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:22:29 +0000
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
 b=UWqonfqFprsAx34Z1NMdrUKvP+SEtVR8xNt3M3eKUxt1F6O56qoPgUaZjCgoxfkvul1ZxDydTn456PfHrtfcDqkQEPfQLdwWKh/VjFdtRzIy5IQxTM4IKAZs0lfpc+24hQAgnVv3BRgNzOcNZZ56H9bvBLKaOsBPqyRDM5kBmnqDnZJ6RSWJeY9Oba4EfEhCMqgNioOPxEjM5oiu+xNoMSfNBlKM9IhfuC+yv0ZejPVSl9L5oDCeMp4StIaAstOlulLqKpEQB3BC6WgH0hwewp8ltGv0/ILMm9fxlEWidwM3VEOAJxM05KZmvt6qNPu+zuecMVXWpM1+xdx6gXbt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wj4h3Ia5IEE4WoUj7agL//1EIIs9tQPFwXwLKzXfi90=;
 b=ZA7x5WJi3qBve+WRf4z+Sv1rZMnHv+q8Hb/rgDC9KIlllCC/AJHrS9Ytc2tTUmaEz0gsKA8HMzrexFZMdQTldalI7uxdu1y+3B3RG7OwU3iInzvU6/lC9a+PnE14S0cQ2k9L7WRQ+h18Flp4ieuLonhXiUkNd/hJf/+xpDQHmazlbW5/T5CYSz1imsFKgt75gsQVD+RLkBR69zF4cIvHkCG5vOOyOOHmQWemn6PIrzJMmXLN4dsygnOTFz47lUXr/X+dzjfRY9/yTuYJaeb5p5RkjfPR4Y9lhaOPm4H9fI3Mkh/jYkCvYFzxLXXvOym04lLz+jXZxMgAwc7/9p+vHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wj4h3Ia5IEE4WoUj7agL//1EIIs9tQPFwXwLKzXfi90=;
 b=FB3qE9GjjwW9L4Cs8m5tAxduxJAt1QEJtst8mBvniHKRMaTClJMebjUPy+KBCx55Scw5hI17JYFFLOi7cb1b/T0VKf72uefyT7joHPtj11M9VEG39ifxkK7ty5qq0USB5UsqlJ9YL2nGqM9k64i9OCHvNwOsUc7Ht4Dol7OXuvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 12 May 2026 15:22:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Message-ID: <agMpkflDCV9hBMKZ@macbook.local>
References: <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
 <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
 <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com>
 <878q9vt0lg.fsf@epam.com>
 <e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com>
 <877bparq9t.fsf@epam.com>
 <1d591ff7-599d-4dfa-b521-bfaded430a76@suse.com>
 <925f2076-f98b-4102-ba45-a85a83861c9f@epam.com>
 <agLruvURfBUb-VgF@macbook.local>
 <87v7csrkgb.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7csrkgb.fsf@epam.com>
X-ClientProxiedBy: BN9PR03CA0543.namprd03.prod.outlook.com
 (2603:10b6:408:138::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d537a5-c150-4db3-f180-08deb02983ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	0k1iM+7QYtjvOX+K5FMN852Iu4ueFjgVLT87xj1PuWJiYoQoPW2QO/jII2q13+gTYks9ge1oouHZwXSxhEZtjRFutB9e1iK3F5QBT2qOK461Q1ra02hRhjUk8hvSYF3Pmv3cikFZOslkUcC1ZIAwfcQ8SNiycCfZLK/YISgEzNBjgnJwvmMZRi4sFwGX5l3Kn1/dBhSLyYPbCh2zE8SSsHfWsbIJf4owyDwj0XuIOZClWeCD0bUvhookdsLvmOJLv9zDYaZwuQTU8z5sq/ofve2O+6IwTJtVO2gfvLxHOGJNwvBwNAGv6VVgO/3FaJeCxcbjqebku9mU8IA8NpqKSCJYTBLNFdsY3IygRly4UPy8P7uQVKnH1MrjXTxkXKCyiwbsNTQPE6ezThIMkaJPetPo8eWPuefbtfSUJzFi8du5f8prxSREM9CfLySr9khoC36gpyLIVDDFtZ/QvsblLr1XFdxnp+dpf9uXiq2PSswphkYnEOmifhHtKAZLUZOTLYL/b8lDDqZ0v2IRlQ13xjYxK4v/mtDAU714roT7Q77jRlc+0NtDeItZemqG2LY7NR0Tnr3UcgKlCnHVljLciwfciwn/ow6AmHqp5pxgTV4+xgFGFq7udDzPqAN1JLMoJ8CaJp5Rs3UNKenx3kEvWHWlPeRK9NlNpNZU0umvXTehy25JRgGlI0vw1VynPvig
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGlwT0NxRXg0ZVhCTWFPSTlRWFNJV1U4dGc3RVFNaE5MVFEremNrR295b3ZB?=
 =?utf-8?B?dHpmS0YrNzI3VE9RN2tUcDUzaklJYlVYZ0QxQXQwVVRkSnZQUDJoZ0hiYi83?=
 =?utf-8?B?c1ZXcUk0N3NGYllVdWpkbCtkRWJsb2J3bG5Hbkx3YUVkWmgyVnpoSTN0TUFC?=
 =?utf-8?B?OVRTYzM3WC8rSGlxNkFhR1IrUitISm5uZ01RVUNMNUhsa3ZkSng0Z281WFR1?=
 =?utf-8?B?Uk9xRUNDSFpMa2hJODdWWllPU0pWQ1hQNnpYYTZjM0hYby9SRWJLMzR5VUdl?=
 =?utf-8?B?amZrRGN6bThOZjVMUDdPV3BGbXdsWTFlb3VZWW9mbWlDdTloZWx0bkVlWHd0?=
 =?utf-8?B?SVpSVVFtL3o3L2JQSVdkQzlCVXljS0lmRXJsd2kvOWpic2pZTFBIa2t5SzQ0?=
 =?utf-8?B?aGhEakV3ejlSeXBDQ2srbmJiZ1dNTlNENmlaL0p4OXVVeDBQc0prUFdkSFJi?=
 =?utf-8?B?TXF3Tlc2UUxqY2Q1Mldwb1QrYkM1NkRHeXJMLzBKay9zcEVaSmJLWHZySDk1?=
 =?utf-8?B?OEh4UEFEZFNQSkpQRDQ0VXBQMSsvZkRZdWhTUk82QkludXdNUS9rK290d1lT?=
 =?utf-8?B?YVJENm50UFdjTlFLdHlwMWR6V3pUcFZxUGhVL3BzNEhaa0xyOXVtemNFTmdF?=
 =?utf-8?B?OFpFaUxPWTlXelE4U2tpZWVQWVFuWTcxdkVHeFQ2NFR4ODBmY0NxdE9nVjRz?=
 =?utf-8?B?SzRlU1ZSeU05dnhtUFNxbzVPM01LUVlPZGQ4dFhicFlOYXRBU3RKMmt0Kzc1?=
 =?utf-8?B?cWJLSWlDeWhLdFVXblhwVWRYSGlCWWMraDBWcHRmb2YrWDh5SUJsWkpVMjFi?=
 =?utf-8?B?ZFhzdVNTL1dyWTdWdkcxK1pjRk9CMUxuNnM3U3I4b1NmdlRLUlhPMG5sRGFp?=
 =?utf-8?B?ODJRV3BQbGhnL2JLbnZXeDBobm1LSk9qZVI2anEyaCtnc3FUNm15SU4vbUdY?=
 =?utf-8?B?YVBKMEdCK2V2WWJ5dk04bUV5SXRUQ0I0d2xsTlNZeXMxQTJ6R2JYSG1nY20w?=
 =?utf-8?B?blFIWkJDOGNQVjB5UW1BVzlKVSt5TkdUTmIyRERjMVNRWGl5RmJIT09zRkpy?=
 =?utf-8?B?bGtMc3J6UVBITXREV211NDFaSlFxUG9MRHJUdmthL1JsRjM3WEhwYkVNQXhX?=
 =?utf-8?B?NTFYZjIweWxyUGk3TFhVUDhHbUp4SlJjMWZabUNQK2NzRzhUQVBwYTdoTzdo?=
 =?utf-8?B?K0IwWjRTbk5MZ21jcm1obEhpQllTcXFOdlNzTWowUDQ2eUZqN21SYnVxSDFW?=
 =?utf-8?B?MGZKRDBJRklIaUlGeDlLc2RuRVlMSFBWaE9mY3pxa2gzRXBSWVdldUxMZDVN?=
 =?utf-8?B?Y3pHcDBQTVVqOFQ0QTJucEk2eVNLVWovUDkrSGFOQzNJNVNHU0o4S3NwK1JP?=
 =?utf-8?B?NUdyb0JRQmpzLzd2M3BMK1lmUUZpUzZIRHZwZGVFYTQrTmwwdE5CQSt4SnlG?=
 =?utf-8?B?S0pTSDhKK3ErSk8vMmcyMVNBVExIcllST0w1NjZDQmRKY211OVl2YnczcWxp?=
 =?utf-8?B?a0srZERtNkNDbkRQS2tMSVJnT2UyZXlIeEFIQlBvTTVQRitiaGV5bTd2d3Y0?=
 =?utf-8?B?eWFyekdqRjdrV2ZwYWxOTDFTcjlGSEZSd0tWZjB3eGFqTEJ3bXRKdFhPU0tx?=
 =?utf-8?B?RFJUbnJyYVdRRTFyMExZMDYvdEZVamIwYXZtb0liSnlOdUNiWjNmRVdMYTMy?=
 =?utf-8?B?dm5QSUJ0WVFqTExEMTZZei9xRXhUaWpRQXAvU0pRME9JODNKREI4NGJXL25X?=
 =?utf-8?B?S0tKZDMydkhLUlZMVm8yS0x6WHRZYmR2QWFQUWZ4bWpBTy96QXlRRUc0NHJa?=
 =?utf-8?B?STdXcDI4VTROWm9YTzlkMXFMVVdpYlFZQmVmMHRVVzUvRUpPdkwza0xmcTNp?=
 =?utf-8?B?cSs4RjhMTzJlSWd4U2kxbXR3R0QxcXhwTGZxZnJnRE9TNUUyc2lERjhFOFhs?=
 =?utf-8?B?NUpKZU40czBQVHZWZHNYb3JHNTBwSVUxc3JNZHBXeFZRTWo0NVN6c2JoVVFw?=
 =?utf-8?B?VWJhT0l6aEV3TnpmR1BiQlNxOG9oYklBbE83NXB5WjdiMzh1QnVuOE1Ndnkr?=
 =?utf-8?B?MVZhcnMvSm9lU3RtcVA5YlR3OHN2TTNXNkQ0UUUyRlp5TjZKRzFJSDRFa1Bv?=
 =?utf-8?B?eG40SDdHRDZqZmU5VXg2ajRtVmZnMDFJbjgrUzJHRWRBdlFxNFR0dk1QMkJV?=
 =?utf-8?B?cjUyWDVOT0dQcHdORVBkNVNkTGdtd1dhclozWkxUaWN2cUlHdTEvWStoRDJB?=
 =?utf-8?B?TW9oLzlia1BLVTNwczJGQXYyaGJWOEV2RWpaMGRwbXo2ZFFxQmt2bmJLTnhH?=
 =?utf-8?B?TUpNci84WE4xc1c3YXZKb1dsb1dkV3hwckRFU0tlSlY5VEhKVmxVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d537a5-c150-4db3-f180-08deb02983ec
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:22:28.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FiFjZ77NWYEW6ZY9dFXquXHvU/4wNF/XSkmJOT+V2oTD51u4nuYuj60Y4xaCHqfkM7XGj0bLnUwzFs4FZo/4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7053
X-purgate-ID: tlsNG-4011c0/1778592153-7F3958B7-8D979058/0/0
X-purgate-type: clean
X-purgate-size: 9169
X-Rspamd-Queue-Id: 9530B521179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Volodymyr_Babchuk@epam.com,m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 10:28:05AM +0000, Volodymyr Babchuk wrote:
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Tue, May 12, 2026 at 07:32:20AM +0000, Mykyta Poturai wrote:
> >> 
> >> 
> >> On 5/12/26 09:20, Jan Beulich wrote:
> >> > On 11.05.2026 16:10, Volodymyr Babchuk wrote:
> >> >> Hi Jan,
> >> >>
> >> >> Jan Beulich <jbeulich@suse.com> writes:
> >> >>
> >> >>> On 07.05.2026 22:40, Volodymyr Babchuk wrote:
> >> >>>> Jan Beulich <jbeulich@suse.com> writes:
> >> >>>>> On 06.05.2026 11:39, Mykyta Poturai wrote:
> >> >>>>>> On 5/4/26 08:37, Jan Beulich wrote:
> >> >>>>>>> On 23.04.2026 12:12, Mykyta Poturai wrote:
> >> >>>>>>>> On 4/21/26 17:43, Jan Beulich wrote:
> >> >>>>>>>>> On 09.04.2026 16:01, Mykyta Poturai wrote:
> >> >>>>>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >> >>>>>>>>>>
> >> >>>>>>>>>> This code is expected to only be used by privileged domains,
> >> >>>>>>>>>> unprivileged domains should not get access to the SR-IOV capability.
> >> >>>>>>>>>>
> >> >>>>>>>>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> >> >>>>>>>>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> >> >>>>>>>>>> for possible changes in the system page size register. Also force VFs to
> >> >>>>>>>>>> always use emulated reads for command register, this is needed to
> >> >>>>>>>>>> prevent some drivers accidentally unmapping BARs.
> >> >>>>>>>>>
> >> >>>>>>>>> This apparently refers to the change to vpci_init_header(). Writes are
> >> >>>>>>>>> already intercepted. How would a read lead to accidental BAR unmap? Even
> >> >>>>>>>>> for writes I don't see how a VF driver could accidentally unmap BARs, as
> >> >>>>>>>>> the memory decode bit there is hardwired to 0.
> >> >>>>>>>>>
> >> >>>>>>>>>> Discovery of VFs is
> >> >>>>>>>>>> done by Dom0, which must register them with Xen.
> >> >>>>>>>>>
> >> >>>>>>>>> If we intercept control register writes, why would we still require
> >> >>>>>>>>> Dom0 to report the VFs that appear?
> >> >>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>> Sorry, I don't understand this question. You specifically requested this
> >> >>>>>>>> to be done this way in V2. Quoting your reply from V2 below.
> >> >>>>>>>>
> >> >>>>>>>>    > Aren't you effectively busy-waiting for these 100ms, by simply
> >> >>>>>>>> returning "true"
> >> >>>>>>>>    > from vpci_process_pending() until the time has passed? This imo is a
> >> >>>>>>>> no-go. You
> >> >>>>>>>>    > want to set a timer and put the vCPU to sleep, to wake it up again
> >> >>>>>>>> when the
> >> >>>>>>>>    > timer has expired. That'll then eliminate the need for the
> >> >>>>>>>> not-so-nice patch 4.
> >> >>>>>>>>
> >> >>>>>>>>    > Question is whether we need to actually go this far (right away). I
> >> >>>>>>>> expect you
> >> >>>>>>>>    > don't mean to hand PFs to DomU-s. As long as we keep them in the hardware
> >> >>>>>>>>    > domain, can't we trust it to set things up correctly, just like we
> >> >>>>>>>> trust it in
> >> >>>>>>>>    > a number of other aspects?
> >> >>>>>>>
> >> >>>>>>> How's any of this related to the question I raised here, or your reply
> >> >>>>>>> thereto? If we intercept PCI_SRIOV_CTRL, we know when VFs are created.
> >> >>>>>>> Why still demand Dom0 to report them then?
> >> >>>>>>>
> >> >>>>>>
> >> >>>>>> The spec states that VFs can take up to 100ms after the VF_ENABLE bit is
> >> >>>>>> set to become alive. We discussed in the V2 that it is not acceptable to
> >> >>>>>> do a required 100ms wait in Xen while blocking a domain. And not doing
> >> >>>>>> that blocking would require some mechanism to only allow a domain to run
> >> >>>>>> for precisely 99(or more?)ms. You yourself suggested that we can trust
> >> >>>>>> the hardware domain with registering VFs if we already trust it with
> >> >>>>>> other PCI-related stuff. Did you change your mind, or am I completely
> >> >>>>>> misunderstanding this question?
> >> >>>>>
> >> >>>>> No, I still think that we can trust hwdom enough. Nevertheless we should
> >> >>>>> aim at being independent of it where possible. And I seem to recall that
> >> >>>>> I had also outlined an approach how to avoid spin-waiting for 100ms in
> >> >>>>> the hypervisor.
> >> >>>>
> >> >>>> I want to clarify: you are telling that Xen should not wait for hwdom to
> >> >>>> report VFs and instead create them by itself. Is this correct?
> >> >>>
> >> >>> If that's technically possible, yes.
> >> >>
> >> >> Okay, so let's clear this. If I remember correct, you discussed this
> >> >> with Mykyta in the previous version and suggested to put the vCPU to
> >> >> sleep for 100ms.
> >> > 
> >> > I don't think I did (except perhaps from a very abstract perspective),
> >> > precisely because of ...
> >> > 
> >> >> I don't think that this is a good idea, because guest
> >> >> kernel will not be happy about that.
> >> > 
> >> > ... this. Instead iirc I suggested to refuse (short-circuit) handling
> >> > VF register accesses for the next 100ms.
> >> > 
> >> > Jan
> >> 
> >> Do you have any suggestions on how to ensure that we accurately catch 
> >> the window where 100ms have already passed, but guests haven’t tried to 
> >> read anything yet, to flip this back? As I mentioned in the previous 
> >> version, Linux, for example, doesn’t attempt to re-read anything if the 
> >> first read failed after 100ms. So it appears to me that this approach 
> >> would be prone to racing with the guest for getting to the VF first. One 
> >> approach I can think of is to somehow swap the register handlers back 
> >> in-flight during the first read by the guest if 100ms have already 
> >> passed. However, this would still depend on Dom0 for registering VFs, 
> >> but in a more convoluted way. We also can’t add the VFs before 100ms 
> >> have passed and add timing checks to all register handlers, because 
> >> pci_add_device and everything below it expects the device to be 
> >> functional at the moment of addition.
> >> 
> >> 
> >> 
> >> Maybe you see some other way to avoid these problems that I am missing?
> >
> > We could maybe do some middle ground here, kind of similar to what
> > Linux does.  The overall idea would be to put on hold any accesses to
> > the device(s) PCI config space for 100ms, that would include the PF
> > and any VFs.  At the point when VF enable is set Xen already knows the
> > position of the VFs in the PCI config space.
> >
> > Any PCI config space access attempts to the PF or VFs during that
> > 100ms window would cause the guest vCPU to be put on hold, and the
> > access would only be retried once the 100ms window has passed and Xen
> > has registered the VFs with vPCI.  This approach needs extra logic to
> > put vPCI accesses on hold, similar to what Xen does when mapping a BAR
> > into the p2m, and a timer to defer the adding of the Vfs and the
> > unlocking of the affected PCI config space region.
> >
> > That would be a middle ground IMO, as the guest vCPUs could be running
> > freely, unless accesses to the affected PCI config space was attempted
> > before the 100ms window, at which point they would be blocked waiting
> > for the timeout to expire.  A well-behaved domain shouldn't try to
> > access the PCI config space either ahead the 100ms window expiring.
> 
> This approach seems reasonable for me, but this would require big
> changes in vPCI logic, as now pci_add_device() needs ability to defer
> all config space accesses till VFs are ready and in meantime we'll have
> to deal with half-initialized pdev. PCI/vPCI logic is already convoluted
> enough and adding more intermediate states, which need to be dealt with
> in different places will make things even worse. Unless I miss some easy
> fix, of course...

You could just defer the pci_add_device() to after the 100ms window
from having enabled VFs?  The only requirement would be blocking PCI
config space accesses to VFs during those 100ms.  You could use a
bitmap to signal which SBDF should be rejected in vpci_{read,write}.
There's already logic in those functions to reject accesses.

> What I am trying to say is that your suggestion is technically doable,
> but requires lots of work, and we don't need resources for this right
> now. So, what's your opinion on existing approach? Is relying on a
> domain to introduce VFs such a bad idea?

IMO yes, requiring the usage of an hypercall (or any other side-band
interface) when not strictly required is just adding a handicap for
OSes that then need to be ported to run on Xen.  It might seem easier
at first, but adding and maintaining such side-band interfaces in OSes
tend to be cumbersome and prone to errors.

We could have avoided introducing vPCI at the cost of adding a
completely new side-band interface to manage PCI config space
accesses and interrupts on x86 PVH, yet we didn't do it because albeit
easier to implement from the Xen side, it would have a huge cost on
OSes that would want to run in PVH mode.

Thanks, Roger.

