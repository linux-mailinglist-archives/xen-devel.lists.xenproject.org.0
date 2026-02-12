Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKSWI83tjWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:12:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9812EC7E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229270.1535253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYMI-0004as-VD; Thu, 12 Feb 2026 15:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229270.1535253; Thu, 12 Feb 2026 15:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYMI-0004Y8-S8; Thu, 12 Feb 2026 15:11:58 +0000
Received: by outflank-mailman (input) for mailman id 1229270;
 Thu, 12 Feb 2026 15:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqYMI-0004Y2-51
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:11:58 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5e80df-0825-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 16:11:57 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7227.namprd03.prod.outlook.com (2603:10b6:8:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 15:11:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 15:11:53 +0000
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
X-Inumbo-ID: 2b5e80df-0825-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md8HXiQqMiQJF10CezDmKItSPRlDxFIpfGQNhJPCcylb+2tEb3tpDvACteNN62Qb2o5i9bI1O3ADqM064+qL+QjSr/7kEUEyREnkJxC/tslRER1HatFEJTsM226ckamfTx0MGA78++Zy3/nlvNHlQ202JccHzKu5MFKDrwaHVqAzw+e5CXp8ql/b0tO8OzPZ3wvnte5WZz8K3JY68g+Yasgnky4W8HgJNkoDXVf/QCxLL6/XtcaZk51icOvGbP05M46fJs0uyNbuQlZ46HVb+7vXcF06eNgLnf5pc9FLtCHq9aNhfW3eDkG+qSHZTGRqvUNCNsx+Gc8aZTTKaes6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8WvqIiDbpSzSZbP8fpwg9152H/0Tnqn9QFxuYy2cEA=;
 b=sVdsdWKaIwXiGhzj0Rp5pZOGNSdtpDAPb43lJZJXGFdYp4UWQEJAN0/q//qRYO9RxA/0KL4+t+4FFabyxER65oz1pwL0K1TqdOZJwKHPCDwySDrCjAx1mUhMXfknqMBlqIiLrPAm+Q2tSSPgMng8KWLdyM0ZSXJ4gMq23AIlBeXs6y7GGmFEX+FDEsDAo3kAaxOSNcchbnZ4UdwZDNZiDibqjtRQTHjJB9hbFPPwTB+6G4KtcxCklvvRl/qJ8jzMWOwHp+ps3Qhy11UQXC6Tw8lhqaQO5evLu7uLMGObrVjwYNGRj34/spZA/Q0oTAdAnEhpumRjASOiGqYMgSp+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8WvqIiDbpSzSZbP8fpwg9152H/0Tnqn9QFxuYy2cEA=;
 b=fqbSSMKHt7I1Y2rwMBHZLXHzMAkHp5Tw/9I42Sq+vaPLo9nS4uxK5g5HBuaG3X4wxPyOQkjBIeA8PWy7/dSUeA2PXsWMPBf0MhHNQ3wv//F33sSNCWDTJ4dXwts8YG55u/sPZHbDO/Sk+TUNjHmLRBBGH99qQHUC2ASR9BACFjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 12 Feb 2026 16:11:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY3ttvtxGCPTNgsj@Mac.lan>
References: <aYtznP_tT6xNPwf-@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYtznP_tT6xNPwf-@mail-itl>
X-ClientProxiedBy: MN0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 76feb553-3252-42f1-7f73-08de6a490da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFpWTzlsVlpjNkpMWE11RjhPMzZzOERrMXpvYklyZDRDOHdLYmM3N1JHc1k5?=
 =?utf-8?B?YVFQYjNya2FLb1pRWHh2dTcwMTJCT0grdmJzY2QwQU1SakN0QkZ6TjJ1WlE0?=
 =?utf-8?B?ZlZWVXY4N28rUkJpdWFoTnA2R3psdlRjYnh5TGFPYnRlSjhmZzZMZHhwaE9S?=
 =?utf-8?B?SWlkL09pby9DejhvUUZuTFBCVUdGU1Vxdzd4UlVFaWJvcStpSkpCSndvNTdV?=
 =?utf-8?B?dEdjNFAxMStTODN5RlhpdTdicXBRa0tYdTN0RnIzZmNrNzV1cTlPU3RXWVdK?=
 =?utf-8?B?Z1phL1hmc0Jib05UdmZ2Sm9TcUxPVi93aDdnSml1cVFtTENqdHBPNVNPQXBL?=
 =?utf-8?B?NHZTcmY0N3ZhYkVTeWdoaXcrbUgvd2ZGRytWTWxhcU93VlZkMEFUNzkvSG8x?=
 =?utf-8?B?NDNyaUdUalVDamw0MGJYVnRKQUZhUzhocy9kMlRqdnlFbjdVell3SWQyOWxQ?=
 =?utf-8?B?UXpMQ1FaNXJMWFVkQzNqc3hhTi80YXMzSnZhK1NaZ0F0RUpoeS95V2g5VExR?=
 =?utf-8?B?dGYwemdBNkdZVFZmV2NjODFpQVdHcERNR0pxNkplcHIvUjRhYmUyNHdmRlov?=
 =?utf-8?B?VEs4RlRnemFIaGU5VW9QcFF4QUVNc04wWWkzZEdIM3lCNmEwaDMydDI1aUJY?=
 =?utf-8?B?VG96OERZKzlua2doRUVTQ2xIZ3ZWUlZSbGsydHdDQ2orNmw2bGhrLzQxd3Ar?=
 =?utf-8?B?dS9KRHlXQzN6ZkxXT0xnT2dJMUZrWUNGTk1vOW9XVDdJT1EybTZFd3ZmWUNL?=
 =?utf-8?B?N0RqNkZZV3RhSDZOYW1jZjMydUNhR0FTYTRwcjhXSCtxYit3ejZobHoyR05D?=
 =?utf-8?B?YkdaSkUwcHZPd0oraW1CZFpxenNCY0U5b3ZRdFpEeHpwS2Fpa3ZVNkpWK20y?=
 =?utf-8?B?TlYxS0lJZkpENTF5aW50djFraHRjaDNOSklwUGlsekFRbE5uUVh3L3YzOXl2?=
 =?utf-8?B?QU4zamtreU13OFRUZ0VCUlgrS3hhNHdsYVpFMXJUS2xRd01nK0psdFRCQk82?=
 =?utf-8?B?bkM2c0hmUTh4eG1EeE9BNGxMV1ZPb09SanNzck1NRUlTVXVQaEh6NnBjd0lz?=
 =?utf-8?B?WGUra3FPNUNqenZRSld3RkxhQ0xvODNTZ2UxZFZ5ckxuLzY4bUFSanU0dHBO?=
 =?utf-8?B?YnFOVnl4VHJCbU1ic1cwNG0zbmtzWVZMaGlLZ25DNEJzekNQTTZnUUF4TE85?=
 =?utf-8?B?ZHhQajlMSyszbzMwWEFNbm5zNnh1dWlNYW1NdHQzUkxybzBqT1FjNDgwV2Yx?=
 =?utf-8?B?eEduN3VJMUhJR1FqaUUyNUJmb2JqTUs4UGxCZ1ViNkNZV05Fa2kvZ1BVa0xU?=
 =?utf-8?B?VjdNbmpOZ0dkZCtIMy9jWGtHUXN0Z3dqSzhFMGZCVFcvcUl1WVQxb3AwZWVK?=
 =?utf-8?B?cEtvMXkvT2JsQmpzakVmNEZVVzEyUTc4ZC96ekhDY1NQQm5Nb2hYZ2tFRkhO?=
 =?utf-8?B?Z2xBdlkzMVFOQXhqTk1uaTVlOElPVGNES3JCc1l0NVhhMTcxV2w4N3RFblZ4?=
 =?utf-8?B?SDFLcEgvY0JBcUdSQnN6eHRhQ3grU3puNXBONzRNQkpmRWV3M0Z3SHJ5dG1h?=
 =?utf-8?B?N1RoWjZRQkw3TlN0aFdMM0Z2QXV6UzU1UmdBdUJ1NUtQMy8zSzgxck1RWjA5?=
 =?utf-8?B?ajVUNjNtTXdiZncvZ1dnZTB0aFE4aXRYZFBxbWhQaXl4UThoVnBCR3AwVXM5?=
 =?utf-8?B?aDJOVFBJaEFzTE13MWdNTEZDMzY3K1ltaXB5SHRTWjNHUUtoT3crdjVZQTlE?=
 =?utf-8?B?SXRHVWxXVHl6Wk9EOEMxQXozc1B6c2JVN1dFSTQvS0NobE5hVkFlZnpxbllP?=
 =?utf-8?B?c09NV1NneG5leDMyUHdST2FBajl0cGF2UHVmTlZjZkgwZEVNbUJaWnpReUlY?=
 =?utf-8?B?MlZkdjl2dXFzYjdrSzRIYk55eW4yWCszTUNhV0prMjlHdU5YbldFY3NGbmhQ?=
 =?utf-8?B?UHZGY2ZxQVEvckFKVG1pWnJPUlZ2TjlCazVjeElUcElPdytmZ0V2cXZ3SEY0?=
 =?utf-8?B?ZmVrVEJ3RDdJMFlEcW9QVjRSeTgyWkxydGJzb0tmaVdwNGVQSFJwazJLblBB?=
 =?utf-8?B?cWVNc0Zxdy9wQVo4Znp4SzdhclF6UTF5c1ZCOGFyc3ZVVitRbWlyOE4xVGZL?=
 =?utf-8?Q?y+P8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDVhRzVkVWNJd0lhOXJUM2o4bUNWeitWV0c5OWlWblVmNGlWajBYSGx4N1k3?=
 =?utf-8?B?aE52QmwzTVRYZ0VQa3g5UEkzeEw2RFJzWmJHZlJwdlozQzZoRm4xMVRIQTJ2?=
 =?utf-8?B?MWlWaG10UXkvV1R0YTB0bUY4RXZjTEpTdUh3WnUzZEpBK2swRGpMUFhsWlFU?=
 =?utf-8?B?NDVUcnVoaXFpWVMvNXI3WmRoY2Nwd2FhUDVuM3hjYW9EYXVMU3pRSjNza3dl?=
 =?utf-8?B?aWlsWDVoT1dTdFh6T1FOTGw0Z3QzMU9uQ3QvTXBTK3d1Nko1QzZCQTVHZWw1?=
 =?utf-8?B?dUZzWWNsNVdobnA5WlJ2NUdaVVFxbmsrYmFwUzFudFRwbVVFNWxRcEZJY25x?=
 =?utf-8?B?NC9aTHArZ2FUeEx2b0hFcStzbXZHaVZtZjQraXRyZHgyblFZbEx5aFBHRk15?=
 =?utf-8?B?Y0FNdXg5cnJqSHN3ZW5kT2xxdzFZY3dYa2hkRU96VnJtTG04TUpCRHgvVVJX?=
 =?utf-8?B?SjNrR1pQOWExVHZZSHpURW03Vmx3VXlFYkg3Y1FtUHhONEpFNjF2dFdCSHRl?=
 =?utf-8?B?eGl0NUNyNnpTdjVJOHl5OTJiS1c1OTRJN0NYcWhTL1VrZ1IxbXF5emkvUVFV?=
 =?utf-8?B?bEl1R0cyZnlrQkRGa0szKytkMXI5ZjRhMm45Y2JEYmI0NlMyY3AxUnphcVB5?=
 =?utf-8?B?UGM1eno1anNNM240WVpubGdSbUs2QlRtclM5dGwrS1JMenIvSUtnWGZ4ZjVM?=
 =?utf-8?B?RGNLRGVEakpzeitVVFQ2Mmg4V0VkQlFTQWxncnliaGxSK1AvS1ZJaExpMEth?=
 =?utf-8?B?NGY4NzU5TjJib3BRNHl5ZE9VaitLSStiQXVyaE05NHJ5amduS3dCK2hpZWdU?=
 =?utf-8?B?a3FmcjBMN3BtaXZhZGFUUGQ1a0ZOZC90cjI3MkdJNUJFQkZkVm5TUHdNZ0hh?=
 =?utf-8?B?M3d3dkNzeDY0L0IzcE5WdDVjV3VRUnJzVk1aRUZCRmEwMWNhMWVVaDNwV1Fz?=
 =?utf-8?B?ZnBYMEhBUis4R1R6YW5MQitIbkVCUFY2MHU0MnQ3TzRpNXd2bHgweE9xR1BZ?=
 =?utf-8?B?emhZNXdDcXMzSDJhZnlSdExrNVhQVWFMMGJuS0Nadk9IZWN1aHplS3FPcWJl?=
 =?utf-8?B?KzI1MzJYQncyMTd6MU1HU0xteTljcFpFdUtqc0xkeFhQSkI0bE05bUJmTmNL?=
 =?utf-8?B?U2JuQnpvOGkxRks1eGV0YW14S1dtRkUzWWZHU1JEblgrTVBDUTJheWx3QXZ2?=
 =?utf-8?B?UXVxQlZCajNycVZYSmFtMHhROEpwNWVVZmd1ZVFVbXhMTXI3QzZKMHdBd0Mz?=
 =?utf-8?B?UDh4ZkVJTmpqV0ErYW5uOEc4VHc4VGlnMUc0WFZXdEY0RzRzdVNkaXBpa1BO?=
 =?utf-8?B?bnZtcHUyc0lFTGI1cktIbmw3czA0bmxpUktCaE14TDFqYkwwUjNuUDQrbzJz?=
 =?utf-8?B?TG43UlloRVpvcGlmSGVPaFVJK1QvRnAyNUxwcmpjU1lHZVZLY3hOUittZDZM?=
 =?utf-8?B?ckdCeTYySE9XQWd6UHBzTjVjNVd6UGZ4RE93YjlBeHR3cmhrMkZwZ1Q1OTFm?=
 =?utf-8?B?WU1oWkxvRkUzcVY1QjdPMHd3a2JNRDFYWDdVVTRMa29zOWt6ZEVIK0NGMEFp?=
 =?utf-8?B?TTQ0SmEvNjMvTlROa2cyc2N5c09TY29GWmxPZ0oyM09meEJTNEZMRzlDQlIx?=
 =?utf-8?B?R2xOckVhR2k4dGZBcVNRQzNZOXRTdUQyWHJPMDdsTk1UbFBpYjV1dDNja3Fk?=
 =?utf-8?B?SzFvaDJlY3N6VDQxS0Izb0xsdE1LT3JNTDcvMTVVYTZ4WXc5NE5zaGtSSkFo?=
 =?utf-8?B?clM2ZFFQR0ZZY1pkRzM1V1F1NkQzRjNBa0szc1hWd09RWmFIWlVPMHNTQmQ4?=
 =?utf-8?B?U0VXOENNQWdmVStHNmtqMzh5VzBFS3g2RUZkb2F6SExKU2JUTDJJNmJqRm40?=
 =?utf-8?B?bmxXMGlRYmJrY2s2aXc2My9CbmJTMTh3eDNrdW8wZ2Npa3pmbHdWbkNJdmVT?=
 =?utf-8?B?dnF1US91RkhMSDNvQm5yNkVxMVZHZWIzOXBicUw5UGR1UHlJS25HZWV1OTdF?=
 =?utf-8?B?QzhFSHpvNEdqblNYM2lRcG9DK0RabGUrQ25FUW1tVnZ6K3ArWTQySnFxWWlx?=
 =?utf-8?B?bWh1MmpYUk51eGRodVBCVUl0Y2t0VUpkaS9Ed1N1c1g5U0NUMXhTOElnd3hr?=
 =?utf-8?B?THhEK2dnLzZKQnNnSlh2VTJtZHlJbjFvTTJZc3l5dEJ4SXFFTGxTMStudzJy?=
 =?utf-8?B?YXlQd0QrNDJUWkRUZGgrK1dhcjNLV3pvQUNqMDBFckN0dlZqZlFWcnJaQWl6?=
 =?utf-8?B?S1EvRWNqTWYrNnJEWkZTSVRTLzNJVVJCYm4yY3pLV2RVTmxTUVYwOExoRFhq?=
 =?utf-8?B?NnkyQVJsTEcwN0grWHh1eTc0UzBGVlFRcG5IWU1BRGZmd1NyTG9zUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76feb553-3252-42f1-7f73-08de6a490da7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:11:52.9430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocz9kk1JvKJCZUzFLRtH3dgBR9KQdz+rZpjGWiNc/055Nok0eQ57kK1MSeCsdMqRMBzq66qQj1XLU13cBuM5hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7227
X-Rspamd-Server: lfdr
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EDE9812EC7E
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> Recently I started testing compatibility with Intel Lunar Lake. This is
> the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> Linux 6.17.9 in this test.

Not sure it's going to help a lot, but does using a PVH dom0 make any
difference?

Thanks, Roger.

