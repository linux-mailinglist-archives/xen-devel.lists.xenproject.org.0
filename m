Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD35LTOznWnURAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:18:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10691188464
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240095.1541589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutEw-0002gT-Jw; Tue, 24 Feb 2026 14:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240095.1541589; Tue, 24 Feb 2026 14:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutEw-0002dp-Gw; Tue, 24 Feb 2026 14:18:18 +0000
Received: by outflank-mailman (input) for mailman id 1240095;
 Tue, 24 Feb 2026 14:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCRR=A4=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vutEu-0002dj-TA
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 14:18:16 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a414c684-118b-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 15:18:09 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5090.namprd03.prod.outlook.com (2603:10b6:408:db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:18:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:18:02 +0000
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
X-Inumbo-ID: a414c684-118b-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/TVtK1ZYMVvpm0ywHUreljo6HehJiM89xpStyjmds6iY1y0+fsvIB5lOJkTaILIDDbzDB4Uori++9NPyz85V9Y+tUYc1OPSqT9cEIk1yKRUp/0LLBji/o6jRDTk0Yr6n/1SBBKwn39vdqqjpOfyUYfwz7yG3bi6HHdDT3V1QM+yxiGwZ1txmpRm+K6TYVFeUv2VV/fQKBZA8frLD71P45t0uZFNadbOnNFbQ/SbcaSGs3GR4vZ5cRBpPS3mZcmCQUyv9DCp1z6wFLRNC9zoebGVPqgSm4eAIwpAP1eHV5k3PxlvhqBLMOL6buvWdpZJTkE2HZfyODMDAshWdMQvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axrfCNCbwDyu+3mQDhGKi1oDYTpIDtmCzqfj9oh3uiE=;
 b=HOeBHb9bfxI/+hj5gzkwZ8UJNmvP67OCUWBYPFw+D8msVtvIzGrXz3Z/kY6W7L+uFTag7Ii4trktoIF2W7AWmbZz23AbImxU7fkTPGpsHIboly88gY30OAcLKoDcW4Gfz3JuYuCw9WztoP+AxH4E8eCU1mbV4zAVZnPUSIrDqOKEsAuJ4rvMknIps/ZohrOR5dmOP3ZyU0AAbs+GHeRxgwjIsaUyvu/TzTumd78AlCJaielxMXUhpwnGooqXCArHkRA2GNj0rroLY32hGb46tIXP0Lu2T6CxUji8RARqd32cE6VPXCIFJWk7La6JPgnE9Uzg6tv7iHRBh4bUfyK/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axrfCNCbwDyu+3mQDhGKi1oDYTpIDtmCzqfj9oh3uiE=;
 b=sS3RaYogxR3X6tyIzyDjfBc8WI6qaBERoDMzRb215WEOI8oGj6FxKYCRrifJkHX4mg4t/33Rt+Rcx+zl27GNRNnAO2QAMjUe5+MKMK2YXyC2Q0CMWq/2mbt0lUUpP38nSs3wqdQ1sFNZUBU12N1C7bD8MLL+FJbksi+yOAanL/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <46b25d29-d7b9-4b5f-af54-074ecce5c34c@citrix.com>
Date: Tue, 24 Feb 2026 14:17:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 1/2] xen/arm: Simplify SMCCC handling by reusing
 __declare_arg_$()
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
 <20260224124558.3675278-2-andrew.cooper3@citrix.com>
 <631f2de3-f551-412c-a465-34cd5d8db8a3@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <631f2de3-f551-412c-a465-34cd5d8db8a3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: 309359d3-de7e-4a8b-481e-08de73af8514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTBVMEhqMTNPbUhraHZhQkZ1aS9wajBId08rY1AvK2tZcXRpZFR6SldNeVI2?=
 =?utf-8?B?Rk5FZGFrKzR5dHoyR3c5bkFNeTA0NmxYK1dCNW5DVGxHVnlydjQ0S2N6bnhp?=
 =?utf-8?B?NjJoc1FHajNKazViTS81Y245WFIxRm8xK3BnRitnSHFhQlJXaVdsQmJXS2NM?=
 =?utf-8?B?YS9PejVmdVFUeS9UMDlPWXNoQXNhT1ZnYWVhS1Z1dDkzTUZXL1Z4anlzcStZ?=
 =?utf-8?B?bDEyMk81TXlsTWJXRzMyeHhLT0Z6bVpmK0xvZktBVnJKTGlIZ3I4YVo1TU45?=
 =?utf-8?B?REQ1anF0SkhMZnhPeFBpb0FObDdDT0phSmdPSmQrZ0JucURPRDJIRmxxZExh?=
 =?utf-8?B?QVM3b0tsbnlnOVRuTmdoVHRQdy9ndmZjZUQ5T2xuSHczUGNzVm8zelltNEhJ?=
 =?utf-8?B?U1g1RjhuUkNpeko1UGFZVjNxMDY4SGZtS1dIcVJjUWhlcmlSQXUvTkJwK2M0?=
 =?utf-8?B?RDAzRFEwNHh1Z1l2dnlidXY0ejgxaGlVakhjamZua21idkJ4bG5ZSnJCRDBh?=
 =?utf-8?B?ZGRITTRZNWx6YjdFSWdMNDZQdnE0bk1SNm0wM0MwLzJxa1lDMTVtZjdwVFVG?=
 =?utf-8?B?SENTeVdIZFIrUTZsUXFtWmR3WndxMStLR1Nrd1l4YysyT1BwVjlqNE92d0Yy?=
 =?utf-8?B?cVdEdkpxalRQTHdGeWNsRnlUS3ErNmFJcFdSTkFObjRLK0JEK3pKNHRMd3Ez?=
 =?utf-8?B?YndYYXNvUkRVTEpaTU9uRkFwaWh0QVhuMzArNVJDWlI3NHMvejlOTTFFRGpr?=
 =?utf-8?B?dUY0WFlHdEVQRmt1cjNNdE4rM01rK2J5ejdaWmU2bWI4YTdMTDhERzFiUjlH?=
 =?utf-8?B?U0h6MEJlZ0c5Q2w4cGhkY3BNOFJ5TjlmNXA3UUg0TDhqUEpWcitJVDNQTzlN?=
 =?utf-8?B?RDVtc05PRHkvNlNEUzlFOGI5L0tvcXFuQVBPcWszM3VBdUN5THpIenhWbGdY?=
 =?utf-8?B?bVFLcFBrSW0vSzI2YzNSeU1lRUh1ak9RR2tnd0hIODU2cVZFSnhHcTBKR1pZ?=
 =?utf-8?B?NW1QUFdoQ3hCRjZrTjFCSkNyRXhzV3JPTzdOR1FlTlpVWEpwdjBVL0ZRZHln?=
 =?utf-8?B?NTB0UjVkd3dTZ0lubEpsNjA4dnNFOVAxVFJBbnBFL0s4azN2SUVuTE0yc09Z?=
 =?utf-8?B?WGJ2VzE2ZWcwNlQ0VVdQb3owRERZZ29Uei9ScHEzQ2RGb2VkclN4aHFNZUYx?=
 =?utf-8?B?VkVGU0ZzL0JLY1RFL3BqOVM3ZkxyTnFFMnIwNGZyVElkRnFsa1d2RE5FREdN?=
 =?utf-8?B?c3Uxa29iZW9Ed1RrbmRxQkVYa1paN3RUQTVYNUZjU3FNblhOdUJ1QjVFTXh5?=
 =?utf-8?B?cnBrbUFZOGtlYkF6a09JZGEvTFdqVVBPVjVkcXNXVy9XS3AyZjdJbVVYUGVH?=
 =?utf-8?B?WUJRbk92YWdUSVF0SVd5RXBiWlJEcFVhdnc0d3A2TmJpTkg4Q20wN0pDMTl4?=
 =?utf-8?B?V08rY3I0aHcxOTFQczE2dzd6VWg2bnU1blVxVzk3TGUwdUZrcXlPWGRLMCtl?=
 =?utf-8?B?cDBtaWlqRUd5Z0JmYVZZWFpBQ0tCdE0wUE9WdzhTTGlkL3NHREhYbHZPOUls?=
 =?utf-8?B?U3lXOWhsYzJ6c2Z2OWlEWXNhamdEcGtUeWw0Z3V2Q0dnb3lCNmZYeXFFM2hQ?=
 =?utf-8?B?OThYRUxjNVkrUFY0MVdBTEF6Ukgvd0VuZ0dJczR5dDhDL05qcUVCZmd1Smty?=
 =?utf-8?B?Y1dvYkZiV3JwWnZrZGdnQ1kzbGw0VXJlbFpReG1JWkdLQ0c0NmpDSStXVHBS?=
 =?utf-8?B?ZHJDRjlBWVRIRFQ4eDRjUUFocEJuRzZKWXhQakVpRUUyNjBpWUE4UzdQTldp?=
 =?utf-8?B?MENMSjZldUkxK3RjNzl1Q0hXeVVIbFhkK2QrWnJJcys2dmJHWlYvVmtjS2FB?=
 =?utf-8?B?SWg5NGQ4WlVKRTM5b0R3UzlNNjRITXF0VXYrbVRjRUJzNlZMTXlYczY0ekJz?=
 =?utf-8?B?N3EweEh6YXlWNEFSRmkxWkp5bUNqcmdNTEJVYWw1OSsrZURZK0V1aFgxdlN3?=
 =?utf-8?B?T2E0ZTQxV3grM3h0NElQWnl3eWJpN2pIU1ljaklWRS9DelBMeXVnUUFaMEhj?=
 =?utf-8?B?ZXppbjhDWFBPY1U4WFBNVThMeUlDSTU3dmxUUFNhb21zZ0h2MVZpQ2ZxRXZt?=
 =?utf-8?Q?H4Fs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZkMldJcG53bVVwK0FoVktvNFN2dzYwUXcweURkd1ZIWnRPT2JPTUpKbEo2?=
 =?utf-8?B?UytPOFJTVXM5bnVZc3VyTno5MlNwMUptOHdJRnI1eWxKanVvU0gwQ1NDZm5X?=
 =?utf-8?B?RjhaQ1AvZk4vRlV3Z3d4YW1Zd1A3a21pUWFBL3UzRnFxL3UrTkdyUzI0MFlr?=
 =?utf-8?B?Q0lpU0xSVlpiRHpRNnpiMmpnMDJYcUJuanlTSDNWWjhmTEw3T1lvbHovaUhG?=
 =?utf-8?B?SHU5K25WNU1WNmxHS3JUSEJ6OWJTMDlyaWtwRDFWb0NiWXlwRG1vYUlaV2gw?=
 =?utf-8?B?TFcyUmRUbG5sTGpCenY1aHBXMFk1RTIxVml0LytiWi9GSHBFM3R2M1BCNS85?=
 =?utf-8?B?WHpwTlFyZU9ibk9pS2FaQjFUOVczQ280TS9OUjFDczlTbjE5eGpDMkcvYnM5?=
 =?utf-8?B?T3JZYVYxdi9wQThwNzBaNmZzbWd3K0kvVU9lTDJtN3JDMDBGbmt2Q3JYRWJz?=
 =?utf-8?B?K25DSmxZZ2JIN3hXK0h6MTBpcWFkeVNSZlprZnUyQWtBenI4dktTS1JnMzQ2?=
 =?utf-8?B?WGNKbGF5WUhXVkNVSi9QVWIwR2FrZ1NwRjhzNnF6ckJyQVNFYW1taDJmSERu?=
 =?utf-8?B?SjBoOStIeVZsb1ZCSSt6a3h4ZFN2QnBXT2huYVVMR2ppSng0U3BtRVZsU29T?=
 =?utf-8?B?MXBtU21SdU4wUzVJR3hFTUZuQnlFVVFzZ3lCcUw2VXdFZ1lwRVlqZVBsdjhZ?=
 =?utf-8?B?UG1hUlFxaGtGL0pPZDJtYk1xc1NiNVNaSkJYbmZiWVNJc0VXaDNEM0dhTjV6?=
 =?utf-8?B?N0dWRDJTQmErMWk0ck5DNUVuLzdKMHdWN1RXNEdGUXJ4K1FjTS85SzUyQVJp?=
 =?utf-8?B?Sy94YXZJL1FLSGFBV0V6WmJvQk5GNll1VElDNU9GWFgrYVhqRUZmZEFsQk1j?=
 =?utf-8?B?azloaWRzRkpwTnhVU2VHV0NZUHhHZ2poYjdBUG5IM1dELzVueGVoMjNPOHEy?=
 =?utf-8?B?ait3SDJhdG92d0FKWmxGeUhSZk1sL0ljZ1EvSGtCQnNZM2ZDZHFpTC8zY0hC?=
 =?utf-8?B?QWNibXZJYzNPTXVPazBJWnoxM3lMSjVUWEd4UTlHa08xV2hrZE9FQ0F3TCtw?=
 =?utf-8?B?akNFcmJ1TzVobVZlWDVTZmdVb0ZGM0tnSzNTckgwUmwwbjdLN3BHWFFOU1Nq?=
 =?utf-8?B?dVdDTVZkdEhtWmtHdTJGNnpsZ05paDgrNzU2Q2Rxamw0Y2NlZjl2TzNnM25k?=
 =?utf-8?B?Y0lFN1BhMmNFWU05NHRYMlA1NTRhWDZ3dVhxZXNZeFFaYytnMzEwcnVEelJN?=
 =?utf-8?B?QXZCQ04xMzNMZENxMi9kU2NPS1FIT3F1eHVxMEFqQWEvVTROeVhXbjBLOTJW?=
 =?utf-8?B?NEZ5TDBVU3NCclgwVENScGZEV3paZHc3RTVLRUNGYXFqNUp6M2RiZ2t0RlZq?=
 =?utf-8?B?RTZlZ1VzRkU4Z2NCQ3lyOTdjVlE4Q1FpVEJHWWRLdEtnZlRzTG9mc0dBdVdR?=
 =?utf-8?B?UlRrVjJjUDV6L1QrOGZvZmVGK3BMazkyalNYcjFoK3lOY0VpcHlJQWkxN3Vv?=
 =?utf-8?B?U0xmUk1MQUJUTU5OR3hsazdFV09EQ0dheFhWcmQ3Wk9Wb25mUjM2bTh2dzBW?=
 =?utf-8?B?TllLek1qdU90cm9uejZjTXRQcDJhSElsVGhKTXJLQVJ0aEF0SGtLZlp5ZER6?=
 =?utf-8?B?VUV3NFJZZm9nS3MwcWRZZ0tKZ0pBeVJsSnRlOGtxQ3ZGS21xZ0lKU3dtV25J?=
 =?utf-8?B?dkZnVDhtS2lZbGhVcXFSZUpQWWR4NmJsUjZGb2FqNDlrRHY0d0xPTDhTWGRC?=
 =?utf-8?B?aXZUbHIrbkx6VWxMYXVOczRVbmw2elR4WFRsQ2RaWTN6V3YxSEFScmpwSm9p?=
 =?utf-8?B?RHN1Ni9SZHRlamtjVEJSVHVQSGtsNWxJWERhTzBnQlhPdW55Q0lyaExBYW9I?=
 =?utf-8?B?cVpUVHo2OXBiNnZoNFJMTXFPUG5TTEFiZ2E4bEU1UFdGbDlWQmFJM1d0Um5J?=
 =?utf-8?B?QjRrazVHb0Q0RCtBYVYxL0ZrbDd4T0ZoWTZGcEFVK282aFY1QnhXc0laUytS?=
 =?utf-8?B?RHl6UGdyc05yaFF2UEFEU2FrdDZYeitCOWpjWWFTUnVkdGJ6UmJLZE5jRlVn?=
 =?utf-8?B?RWEzUUlRV0s3RTNiaS96YVlFNVBjeldSWFBjUlRqRTlnZ3E3QnZhTUk0d0pl?=
 =?utf-8?B?NmJ3bjB0UytTR0pwd1NaOVdQZkJuWHArUURab3g3bGE0eCtmNTdCME03VmdO?=
 =?utf-8?B?bTlPRUVpOW43M2g0ZGFxbDI0KzBUdS8yeExrNGFSSXBsRjRFREVFekcvalBY?=
 =?utf-8?B?TWlDc0tjb29ORmlTYjEydFM2alphR2tya2xJd0w0SjVaaVBOR0RGWjRROHZ3?=
 =?utf-8?B?RFVoTjJxWERPK28zUnB2c3ZFd0xEaW8veGRORmpBRjZodisxeTVBVXIwOXZl?=
 =?utf-8?Q?yAS7+5jzhwhFCas8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309359d3-de7e-4a8b-481e-08de73af8514
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:18:02.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEvnYX2fhOGjOv2rDexpINVWJd8uRSWnb+ak5lYVHjHM3q4zc+08Gu7o7ti34sv9jNRUDrf20AsAd6rsV7qGvEpabLKavc8D5wMmjsOPbZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:email,amd.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 10691188464
X-Rspamd-Action: no action

On 24/02/2026 2:14 pm, Orzel, Michal wrote:
>
> On 24/02/2026 13:45, Andrew Cooper wrote:
>> Now that the type handling is entirely uniform, it's easier to see that
>> __declare_arg_3() can use __declare_arg_2() and so on, just like the larger
>> __declare_arg_$()'s already do.
>>
>> No functional change.
> This patch won't build.
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/arch/arm/include/asm/smccc.h | 15 +++------------
>>  1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
>> index 5b30dd57b69d..347c4526d12a 100644
>> --- a/xen/arch/arm/include/asm/smccc.h
>> +++ b/xen/arch/arm/include/asm/smccc.h
>> @@ -114,26 +114,17 @@ struct arm_smccc_res {
>>  
>>  #define __declare_arg_1(a0, a1, res)                        \
>>      typeof(a1) __a1 = (a1);                                 \
>> -    struct arm_smccc_res    *___res = (res);                \
>> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
>> +    __declare_arg_0(a0, res);                               \
>>      register typeof(a1)     arg1 ASM_REG(1) = __a1
>>  
>>  #define __declare_arg_2(a0, a1, a2, res)                    \
>>      typeof(a1) __a1 = (a1);                                 \
> You should remove this line and ...
>
>> -    typeof(a2) __a2 = (a2);                                 \
> keep this line.
>
>> -    struct arm_smccc_res    *___res = (res);                \
>> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
>> -    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
>> +    __declare_arg_1(a0, a1, res);                           \
>>      register typeof(a2)     arg2 ASM_REG(2) = __a2
>>  
>>  #define __declare_arg_3(a0, a1, a2, a3, res)                \
>>      typeof(a1) __a1 = (a1);                                 \
>> -    typeof(a2) __a2 = (a2);                                 \
> Same here.

Hmm - it built for me.  I'd better figure out why I missed it first.

With the second patch, these disappear, which is why _that_ builds.

>
>> -    typeof(a3) __a3 = (a3);                                 \
>> -    struct arm_smccc_res    *___res = (res);                \
>> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
>> -    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
>> -    register typeof(a2)     arg2 ASM_REG(2) = __a2;         \
>> +    __declare_arg_2(a0, a1, a2, res);                       \
>>      register typeof(a3)     arg3 ASM_REG(3) = __a3
>>  
>>  #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> In principal, with the remarks addressed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

~Andrew

