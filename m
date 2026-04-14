Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CRBHz0Y3mlBmwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:34:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1DD3F8C67
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281577.1564453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCb69-0005s5-U3; Tue, 14 Apr 2026 10:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281577.1564453; Tue, 14 Apr 2026 10:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCb69-0005oN-R7; Tue, 14 Apr 2026 10:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1281577;
 Tue, 14 Apr 2026 10:34:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wCb68-0005n2-Nb
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 10:34:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCb68-0091ky-3O
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 12:34:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69de1829-bab6-0a2a0a5309dd-0a2a450cd56e-20
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:34:24 +0200
Received: from [40.107.209.70]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69de182e-f40c-0a2a450c0019-286bd1468b6f-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:34:23 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5573.namprd03.prod.outlook.com (2603:10b6:5:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:34:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 10:34:21 +0000
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
 b=xFx2x81Rje7dQ1qFoh5RGg21Lc7ruXMgPMRgOkm2sd6P6vp7ncQZrdQrcrxM4zzxWvzdWkjnWw93/7+aDXun0/DHhxKLcuxyJG63MAwW5Pvwtlp87BcTymq9OFvVbvNzAREMNLc4v6p0TvJolLeryXfXDsoXj3UhM8m7tnD6zi2G3wwvDi50wT6bxcOE1115M0vGympuHDKRxkCIV4N7Jjy7qCGiO/aStiBdCu2GUmikD/4mflMw+lphrN3wbWvDZ/AkYVKLFK4EvjqSlJOzuS6/r/QfXcbP/3yBSz6FYuqz6fu2C0QAE3nF6/Dqse+VmhgnXPjJQ5VR58ylHvJwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vd6wmy5re3Pw6r5a1e8wGjbTzbuX+NVCRIv+nVQt1Q=;
 b=xhM7f5QDu/+5xgv9K/5Rc1AlQSu88HVtNLsQHAWN9/1/YtwE3ipFzbZl+QixW+yI5J+EHSGUTiG1XoRQArDZpFLP0Q7T8Qn0GXrDYV15mJ7kIJVRDOdMaQvGrqnyrd/LB6PYXuAWJe8l1rQbAp6aiAmLgt3XTqxYbEl4JtVuZvFjo05ajrjyv1+rrhmrwBfjtGtlt1dJwyGXo9ImHBx/khIjEfMgUA9FiXU6ObcpWEh3tJatqthUnoKJBM46+hlR1pw5258pZ5fNAm3kLDq7diFe25RAKKDu911YTxfhZvXjeTAODcpOkegv7gfbqFoFTRiM/1xEwMbEs0wWS+tAHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vd6wmy5re3Pw6r5a1e8wGjbTzbuX+NVCRIv+nVQt1Q=;
 b=LAg0xRL2VTCawGZO27fRqsoarbiFp6A9zn+eAiEZcPZlfBufJckNMzLAG9Uqz43GUrbf3SmEq5oSfLmzFG7T60R1C3NQ6IqTFVkTGvOvWqWLYKS2Mbp/Zgde2+6Pz3PwGcUdDkQZfUGi3JQjideIyX71YnBQSccumnZ24N4mOqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/2] xen/cpu: round up cpu_khz calculations
Date: Tue, 14 Apr 2026 12:33:27 +0200
Message-ID: <20260414103327.7420-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414103327.7420-1-roger.pau@citrix.com>
References: <20260414103327.7420-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0066.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9555a4-8be6-4fbc-a285-08de9a11638f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GBpaUKpJr4t8JK+err59HyGW2cBK/XkQ2oewZTD8nYvjEAo9kWaPOFpRhMRsv9ryu3vsIB5MgoZ+iF1RVCesh8OCc8fumnnpwm2ZZsYmhQ5v/w4FXO3pSjlRUiRJMTY+AIrQtVpLrarLLHBc0/vfo5ssaVCDE6x+sL68QcNLnV5dq2jQ6wcKfdKiyA0zfPsc5YoWMAKQwAH5J7stYvJhOUD2O4+b+DBxE88FHbJQUNYP9+aR+J5lIKCBTuRexwFjV/9H755fJ9EeNIaGBKEitxV7w1/Lsq6AbpBfCy+icueKr1ja76X2iRy96kFPVirEoDYIhiNhSAiZLgS+t11jMNMWe3ix72vcwAoQv8vemaYcCeL+haVLcHeYd8pCVvl1oRxzXEyKqX1X+Pc+kuoto18+6cM9Iw/1oBuIARj0b6OrZcU+N6qSw/sj8/YQ7MUzSY5CEl0wforImFzJYPjGjIrJ0hnlGdbvyal3JGv/aYoJ490fDjXryREswf0/zELNfmuieB/TCM1Oil1A439dFgybE7aXen1pV0Zs/mALotPcV+VLPrXp84V+vGqVBJAwqnNiZCCGV1eQItZ5tYA4M/I3A0n+OJ5VqOGVp8EEBhP0S1H4mTyy60WUun70PZN2T6w/rrVrnGBDg9a5ztQSR1MExWCL5i9ya4Y3XDWumpba2LdNiHoZo+tZ10mB+ZNa8o0XTTC28JhdeyiP2FWm9HPynP2m/dh4biRsncs5RFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWlHMTdOaTJpQm0wRlBKeTVQOWw2ZEsrZ0p6bnZYYk9objduNUQ1SjB2QzVP?=
 =?utf-8?B?U0xLaDU0K1hyVjVhU0dyQVBVQ0lzcmVMR3E3d2hJYWM0b0pDZXJCd2pwWDdV?=
 =?utf-8?B?MVBCcFczbi9XU0NUcW5aSFY2SVZEOHFuTlh5R3RMZU11KzRJSHQ2QnIzbHV5?=
 =?utf-8?B?MmhDS1VDQ1NaRzJRdDhlczZ0L1d5TDRORnArUXZWSG5VeGI2V0tJUFJCdnJK?=
 =?utf-8?B?R3FEQ0dEc2RwejVNdVc3R1hHU0kzUVJKM0xaYlNWMWJLWVpLL0VJN09hNWpP?=
 =?utf-8?B?UHFOY0ZPZjk2eDUwdVRQaG9lOWZHNHpZZkhaL2ZKTHVCeWdSSTd6NWU1UHp1?=
 =?utf-8?B?am8wTnhBTUIyQWpUeUNZcXB5T1lyMzJEc21OSURMMENIaEdzMVM1WlN6elpD?=
 =?utf-8?B?UUdPdDhLK214V0dPQkQ5UUprNTN2RnBtQWtjUXAyRi8xZ1RQM2VLSDdWMllE?=
 =?utf-8?B?ZGNOMjJsdG1yTVYveXdKVFJOcmRkZk51VW9zQVRhL1hhSDYyMFVHN0Y4UFZ2?=
 =?utf-8?B?QlArR00zMmNtQ1MxRVI5dGl5aHl5OG8xTGROQ1R5Y1ErTS9hZHNaS1JEdkxh?=
 =?utf-8?B?L3I1KzJzMWhHa2ljUkpGdkFYRHdhUnhvK1NDRXp1MGhFUm5zZGVtV0I2Q3lG?=
 =?utf-8?B?a3lyeUxzZ1RPWFZ3MWU1MEJ0dllURTVRZ0tEVkY3V1JhcmdpSVJzUmlvZ1l2?=
 =?utf-8?B?b0JZUlRmeHZ1VFlMT1ZIV1BrK1dHeXJsdTZJVitLQUx6aEUzbStQVXQraldB?=
 =?utf-8?B?cXpoakVIWklhcmkvdkRWOVdGTkZoRi9sZm02bnNVcVkwNVU0alVCcERqOSsz?=
 =?utf-8?B?TXV5dmQyMlVZSklmRnBQZUVGcEZ0V3J1SW93SGRBcW9DNURwaGZZZ0txWFdj?=
 =?utf-8?B?RkVDaVBuTWF5RlZwTUY0eFZicnl6TzdHdDJ2MzlROWp0OFUrYTRXRFRuYzZ3?=
 =?utf-8?B?c1lMZTNOcEI3S09KMEtxbkNacEdFMlB5bk1wQXFLcXJNdU05OEcxM1ZlbVRD?=
 =?utf-8?B?ZGUwMjVNeU1JU2hYQVh3cWk1SDNSNkFXcC9VS3NZSzZKN3pFcXVPSTJIa1dO?=
 =?utf-8?B?ZC9zamNrOXUvVktvMlJtQk9iL25PeUFmdXhvWjArV0tpRWpYa0dTMS9sdEx1?=
 =?utf-8?B?VFRoQ05rQ0pGaCtMYnZRL1JKTjdzNHhBOHZWWmswV09DbGZicGFwM3hxaDl2?=
 =?utf-8?B?aFNjODRoZTI5QVlyQWVxd1FwaElpajlTRTZiejRwVzkxWTcyak5NUWV1NWdF?=
 =?utf-8?B?T09jbWtGVVRIcEhGSlhReURZVHVqUzJYamVuaUNkWUM2Y3duYTZQZnZHTmZn?=
 =?utf-8?B?UmFQUm0vcGg5SS9PdFRYYlpPaTRLNk5XbVBEMEZPRmtnU1I1VERCbWNYcnVk?=
 =?utf-8?B?VlZzNFU0aXM5ZHlLTUcwUktuei9vRUxoQUN0M2lnc0pIUGE2ZVJNR0FGZVVO?=
 =?utf-8?B?akRKR1c0V20zb01sSE5OU0hOdVprYXdRZm5qeHRRb2xSSFJ5USt2cnc3QXNJ?=
 =?utf-8?B?VklYWENrUW1UUzV1UlZCaWNPaWZ3Rmg1UGREenZnT3ZEVEJjRHBCQ3FqVE5p?=
 =?utf-8?B?RXJYUGZ2Yjl2YXdkanlOUlcreEcyQmNjOWh1Qktid1pwVHpVelpMa0hvN2k2?=
 =?utf-8?B?bklDSnkydTlHbWRMZ1crOGRNa2tjZGMwY1BaYWh0ditBbnYyQ1d2VzcvZ1Ri?=
 =?utf-8?B?QllqMUZVaVJWY2ZHUHJvcTBPNVRHdHVJdmk1KzdEWjBRSkFaVzZYdzV4bUlX?=
 =?utf-8?B?VEg3akpKZ0QzV01pSEV1RndxTHlEaHdTNFJvdWVVdTRuUWFPUU5VdkFnTjFu?=
 =?utf-8?B?RzJmNlVOaXJYc3VISFRmRUlWdEs2VFFrbXVpaWVVREVGQVBnMXlLUTZjZWNv?=
 =?utf-8?B?cllkUHAyKzA5Q1ZTRnkyU1VXOXNOSlRrWERZZVJjeW1hejJNZURScFJXc3Iv?=
 =?utf-8?B?RmU2Q0JNU2tnSFJuZ1lrQTU1QUxXUm10Q1k2YkI2a0xhOHh2NDhUVDc5UGJF?=
 =?utf-8?B?MUpNY0VWRy9oemJvWXpxWkxRSlB4VU4zWWpKZjBBUFVLMnJudTNSam1aUXBy?=
 =?utf-8?B?cVdOU0c2OHkvOFdycmpWSGh3MkhqUWZzbFFYdDROWjRFVmhRQ0tQV24rcDhP?=
 =?utf-8?B?YTN5dlcvbXhvSFdhcXVJRVBYUlNnb3pZb0RGTjdZTDFMUGNiWVVBTFlSTUcw?=
 =?utf-8?B?QkRISTZxQW1JRTU4cGt5YTYyOHR2c3pYR2NOd3ExTHZXKzJ3Ym1VYWxyUldm?=
 =?utf-8?B?Q2QyT3REUDBFNjdIRWtERVd3ZVZIbzkvVFNZTjEwOEV4a1VUZU5Tb2JOeWRE?=
 =?utf-8?B?R3dyTzFicDZURm1LazVQcExsTU5pOXQ1M1hRN1NMQjNyWjNhdEdNZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9555a4-8be6-4fbc-a285-08de9a11638f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 10:34:21.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tFqel6TdhRAUye85AV6cJwq8X4Zjo81nQvBn6XqhoyxE0Ca6E9yBDysbF3AnKpjQ5B3aYxm3R9Npo7y87TKyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5573
X-purgate-ID: tlsNG-d25034/1776162864-8254FA3D-6DEB300D/0/0
X-purgate-type: clean
X-purgate-size: 2251
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,wdc.com,gmail.com,suse.com,vates.tech];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AA1DD3F8C67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All arches truncate the cpu_khz without taking into account the less
significant digits.  Instead use DIV_ROUND_UP() when scaling from Hz to kHz
to get as more accurate kHz value.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
While the possibly more accurate value is nice, I'm not sure it's actually
fixing any functional bug, and hence the lack of "Fixes:" tag.
---
 xen/arch/arm/time.c   | 4 ++--
 xen/arch/riscv/time.c | 2 +-
 xen/arch/x86/time.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index a12912a106a0..9e0c485c77db 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -118,7 +118,7 @@ static void __init preinit_dt_xen_time(void)
     res = dt_property_read_u32(timer, "clock-frequency", &rate);
     if ( res )
     {
-        cpu_khz = rate / 1000;
+        cpu_khz = DIV_ROUND_UP(rate, 1000);
         validate_timer_frequency();
         timer_dt_clock_frequency = rate;
     }
@@ -136,7 +136,7 @@ void __init preinit_xen_time(void)
 
     if ( !cpu_khz )
     {
-        cpu_khz = (READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK) / 1000;
+        cpu_khz = DIV_ROUND_UP(READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK, 1000);
         validate_timer_frequency();
     }
 
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 7efa76fdbcb1..faca7b70e13a 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -40,7 +40,7 @@ static void __init preinit_dt_xen_time(void)
     if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
         panic("Unable to find clock frequency\n");
 
-    cpu_khz = rate / 1000;
+    cpu_khz = DIV_ROUND_UP(rate, 1000);
 }
 
 int reprogram_timer(s_time_t timeout)
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 244277c0a921..b84414f00d05 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2642,7 +2642,7 @@ void __init early_time_init(void)
     set_time_scale(&t->tsc_scale, tmp);
     t->stamp.local_tsc = boot_tsc_stamp;
 
-    cpu_khz = tmp / 1000;
+    cpu_khz = DIV_ROUND_UP(tmp, 1000);
     printk("Detected %lu.%03lu MHz processor.\n", 
            cpu_khz / 1000, cpu_khz % 1000);
 
-- 
2.53.0


