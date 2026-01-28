Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JF5JFgQemnH2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 14:34:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB884A2338
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 14:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215683.1525804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl5ft-0007di-9n; Wed, 28 Jan 2026 13:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215683.1525804; Wed, 28 Jan 2026 13:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl5ft-0007aa-6S; Wed, 28 Jan 2026 13:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1215683;
 Wed, 28 Jan 2026 13:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl5fr-0007aU-1N
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 13:33:35 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee33d83a-fc4d-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 14:33:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5520.namprd03.prod.outlook.com (2603:10b6:a03:282::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 13:33:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:33:26 +0000
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
X-Inumbo-ID: ee33d83a-fc4d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOuaqmxMSqV4M8pnYuukAS0C3gyazbqJouyKKrKM0JAXul3ocjMJyPuXG4K9nzLOyWcFdauiZhGPA5/fELMEu4OD1W9uaC0lu57FtpUUsT0el/Le61D1XHSh9fikPn4HWxmy1mO9EWqbJ+BA/NdOqcd1v6dqCaLdXX2pt0PMfrW3JVIo6EbE0aPiqKv9tWyIvsHB1rNJRrQaQa6qOlNgKCIipkFly80K6Z6jq6ZCjE5ypADXsF8wvce/Y6IXAp7VKIBsmvVO8jAgwTCV7Sx0uqttkejtfOKsptauae30X9eqn/zYhyDS0UGBQKi2NpLbamvwrZ+MYKrvBdTTWkxDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ygq6H/0KAv8iQEjAFOVh5VN1R5UL+Jzjwf0+0SIwmE=;
 b=c9SLD1oaY8cosvDLAXSak1n5ghj2LztOcub+rGdKuf10jaPx7cDz75FGAa3D+Y5DYPzathVrVccgwOVPphuQj6uqZbOlWcb+Rg0NJKZcfVmz/HG2jP4AlXgzmA7qWIO79LKlBvDGANB4u6wPWMTf6rkPtBPjoycYr+Rqt26V+MNSVe+pzi5ARG3J8g9sjUhG/AjOEMHK471TbdNn3bj1Nij4WrPaqD5OWddl9LBh2n+jKA1ViIwCHN+mH3oqAO3dix4N4I7TPOoigYeyzc0MIYPgHFw9E4sIK0WNU5mhKjqhPFNpJEpqptz/GmJOyojidhQWSRq+oBcrwo/ZeV2LyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ygq6H/0KAv8iQEjAFOVh5VN1R5UL+Jzjwf0+0SIwmE=;
 b=FnTnAb9awzp7JqFK9izxZfBdK3IFF9sBespcTizIX/IxjU7n9Go8YzFcqgKFK06wbsg4vvaYxzpNJTNeh6FDJOL2hnc3rMil0yEuWZwF2Ou+nxCO/wAURn3iLHE60aPo3VjWVu2o9fpem6iXxAdTv/5UFOdYMHR96SC6djtLip4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 14:33:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
Message-ID: <aXoQHCRoakqtJrlc@Mac.lan>
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
 <baee2f62-786b-4ed3-9ff4-cde3a06c4eb9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baee2f62-786b-4ed3-9ff4-cde3a06c4eb9@citrix.com>
X-ClientProxiedBy: MR1P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 0551c1cb-8d7e-4fa0-5499-08de5e71d0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1M3WFRqQWZuVzhTdnhUblFqUU9GRTRaTVdkZE82Qk5hVmE4Z2kwek1pN3lK?=
 =?utf-8?B?b2VOODl6bWorVTJGNGlUQ0Z1WStxMEp5TzEyVEwvQUxoWXZVRzU3UFJNcnhC?=
 =?utf-8?B?TFBJT2lMY0lod2pTdW1yT0dpMElqVEVFd2tScnNQNUdTWUhMMGlRT0pPbVNz?=
 =?utf-8?B?R0tXaUlwTHExaFlTYWd4UjFpZVl0MW9RZlhaV3UzYXhEa3ZKdXJzTHpRcTZr?=
 =?utf-8?B?S25wRXJFRjRYRzBhZ0pJVDB4U3k3UW9jRm9RYUhHUzU2bW1XM1ZCck00R05p?=
 =?utf-8?B?MHhydm9WSEU5ZElFcDVaWWZtRnEwSFY2V2FhNjZHbnpQVFBwb25MUlQ3cWd1?=
 =?utf-8?B?SXByOXNDQ1JlUDIrUGZ0bkhJSkkwOXRpR3RVR2Q2SzJudUlYRUU4NzVOZ2xw?=
 =?utf-8?B?c0ljbWZHTjBHdFUxYlRDYjIyWUJQTXNFWHFrakFHYVRpVmRwaEpUT1NjbE5k?=
 =?utf-8?B?cGhhSWt4KzlBSGg1bHlRcFhmWEwrdDRycjJvVytVbU5EK1JxY3dRN29SVnR0?=
 =?utf-8?B?NzZJeFFsSldFVGVuNGZQZXh4N1F1a01xQ3BWekNwNDNZRjJyNllSSWdOck1h?=
 =?utf-8?B?aEJZVFVKZmFuVWZOdkl6QWcxS3hJOERZQVZPTHNjZG9OdVpIOElSalhQckox?=
 =?utf-8?B?ZjlGLzBTbzkydEdSQXJnNDgrOE45aHVwajhHTUduNm1HdWFQRWQrK2t2S0dD?=
 =?utf-8?B?T3I1NjZUZ2ppSkdPSzZkWVM3UEoraDdsMkNKeUhiRkhReHJleFZEL3dvcUlq?=
 =?utf-8?B?M1lONFFPbTlhTXBnc0Q1Vm5hcENaRVIxeERKcm1NczZsMDBzYWFYSjMxQndO?=
 =?utf-8?B?Z2twT0pQTnJQVUtXYWt1Q29ZdWw0UmVwOVg1Qk9MaXc4bmh5TTQvaWVKNVN3?=
 =?utf-8?B?SDVocUo4OHlWRVZIZE1HZjl6d25DL3RvMjUwSGN4bUI5K1hyclFUakk0cEcz?=
 =?utf-8?B?SHNLTlBjaG1YcUNIUkhzR0RtVndCeEtPSUp4QTVZSFdqYlo0RmliSFkrUzVN?=
 =?utf-8?B?SFVLdzBuOGZGd2M2bE9qTXF1SEcvOU52Z3dER1NDb1dhbHFnaEhNaW01SlFv?=
 =?utf-8?B?dWdCWTBOUzczbDE1Y1o3QWpMMzN4eDk5dHp6d0oxbjBRaFFtSTA5Qkg1bDJW?=
 =?utf-8?B?QVpJZnBNUmZzdkNvN1RTbzR0WHI5bzVOcjE5Z2FrMmc3c1RJd09hd3Vjc0Y1?=
 =?utf-8?B?aW5ZYmJpc2FNem9xT29CZEYwNDI0cm5GUHNUQ3NJWEh0Um9PY2Z3MlI2WGJM?=
 =?utf-8?B?NUdOK0hMZFdGclpvSHVGN1BYVEhhMGpGbURnSG9vYXZhaUN4WWVocDNSQ3Z1?=
 =?utf-8?B?ZjAycnpWalJLRlB0QUtoLzF1MDhNUlNXeUlMeGs5ZmJRZncybUlnSzIxa0VY?=
 =?utf-8?B?dEdkc3h1M3BOc3k1ZS90R1BtaWh1S2tCYTVkQ0krRzBQSFpYaEx1WnJGSmsy?=
 =?utf-8?B?WnlZcjVuajF6NzZoL3FFdlNRYTFoZGkzdlliOUQzSGUyT01LTFh1ZXJsWGsv?=
 =?utf-8?B?d3BTdUhTVmEvRWIyQXllSmY1cmRjUDZXYSs0TVlaRDgrc2dPSUhZenNJQUty?=
 =?utf-8?B?SFFlT095UU9KWmlPbVNhY3pvbzB3SWxTdTF4RDdpL2V0bUFEQ0FnVnliL3Vs?=
 =?utf-8?B?c2tmZHZxdnEvclJLUzJYZkphSHFVUTNRMDc0bEcvTHYya3o0QzhMbEtUbllH?=
 =?utf-8?B?eTVhNjd3M1poNFczbW9VY1l3N3A0TE9mMXlVdUFFWnRoY2FiWjhOMHBiS2Fy?=
 =?utf-8?B?dEtmYmlxRE5hak5obmZNQzdjSmxLTjBUcXJnVHVSZzk2b3RIbXRORXMxYjlJ?=
 =?utf-8?B?VFMxUFkzRUM1a3JhY25mMGdwYWEybjF5bFVCNnk0dG5HbytXVjNjUjcwVXBG?=
 =?utf-8?B?aWdpSzVZSC9sVmlhR3VLOGE3YVEvV0N1SUZsOUlWaFJsa3BIK0wxR1BIdTFI?=
 =?utf-8?B?MElTWHdUUnRHOTNxOElzdk5kQllPTTJlTm1OSFIzcDc5K01paEY3ODllVi9w?=
 =?utf-8?B?QnY2a2Q5bUZqejNQd0ZvN2VuQVdHVGVKbmtWSTZLbkFGd1cwaTFrSmdLMjEv?=
 =?utf-8?B?R2loQ3hhZWVDbVlLZHYrbGlUVkFtOXdVUVlGQ1ErcWxEZTUxa2JZNDhGM2xD?=
 =?utf-8?Q?1PNI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0hEU291aXo5UzNnd1VyUmlYZlE1TVhSd3ZHbGx3Z1dCN0pXaDN2NG91WGR0?=
 =?utf-8?B?Z05keEF1S0ZublprQ2FhSXdLaGtWWUswbXZIcnBOWHpvQkhtbWxMeWhITzVG?=
 =?utf-8?B?bG5kVDBHUTFKbWg5azR6T3NjZnR6VGRBekJDbUYrY0dtcXdiTW4vQTZQMVY5?=
 =?utf-8?B?eTRMZXlVbFdvNFEwckw3TW1RUkZrVjVJb2pkemVkakpaVllheUVtWE5QUk1G?=
 =?utf-8?B?c3ArWFUyR2xPVitJZlJXSmVQODlLbnNVbEEzZldvYjRyd0tNTHg0dEtBcVp1?=
 =?utf-8?B?MlNaek16MStNU3hnMlRZTEVoV2xacFAxdTBVTkpUMXRXa3VWcU5CdWlEbzU3?=
 =?utf-8?B?c3JvTGttM3NqTS8xN3liR0ZQYzVXRTdKZXAwN1Nkd3hQMGJPU0o2NjlKZmJU?=
 =?utf-8?B?SEUvcVJJVDBvL3F6SXlhbDRzMjBuMnQxMFk3UmZsOGJ0bE9KN1p1cnFIYS94?=
 =?utf-8?B?L29LM05jSXFvRGZaaEJvMHh1TW1qc1RFbTZsTGFubkJ4Rk42NmVYa1lmMUZl?=
 =?utf-8?B?cDA0bWQxaFNLbFNOTkk5aW1LUnRiL3FOQnBycEpYVk0rRUxTeVdIN2tlbkF1?=
 =?utf-8?B?S1FzV3FQRkRnZmdmSUVUQjFJcEFMMzBLYjZEVC9WeGEvNWYzOEYveUU2MXkr?=
 =?utf-8?B?cDd0dHBMZ2pObmcwN0h4aDJtUzgwMTRpY25OVk11ZnZTVWtYVnJjeHdlVUVM?=
 =?utf-8?B?WDlxTWRRc1k5NzFhVEFBWmVJOXRHZmZodkNFSVNxaVBjT2NkZ0FIOHFNV3pQ?=
 =?utf-8?B?cWZCVlpVWDZjanMweEQ0aHRLdUFzYXBRWHY5ZTBLY2tYbUh4V1pEQVdGNllh?=
 =?utf-8?B?SFZ0SjJ1MzZ4eVpKVlJZSXhFb1JSV3ZxYi9yVW9FbEt4SDlrN2kyQnpSQnZY?=
 =?utf-8?B?ZzM0TkpZdXNhaS94TENXdUhTNXlQM1JOblVwVjVyTldzU0ltZU5Td3kzeXRY?=
 =?utf-8?B?SmgwemZISWhIOGU4SXlJQmNwL0s4MlJKY3FxaHRJS09zemZRd2tidlJ6WlRT?=
 =?utf-8?B?bStGTjQ2anMxVStTMmtxSEJjR3VjeHNYTzJDSHc1ZkpJRE50V3V2dlhpdGZq?=
 =?utf-8?B?Q1FnUTg0Q25vRThCcDNmZ2dEVDhybGdsencyQWpKdXVLUjFmaEJCUExLbWNM?=
 =?utf-8?B?ZjNzUDVrUmtHL3lZMkFadUZySU42MHRtZlAxaEY2eWNmYVNkNHVUdCt2K2oz?=
 =?utf-8?B?eDkybTlIaEs1aUxkOEhOeEVaZDdvdi80N2dqaThuOGt1TlpNVXRvUFRSejRT?=
 =?utf-8?B?b1lWU2IwdURCMHJDVWlOVVRrWkp6MGw4SFowZzFnSFVuaEtkb0NxWENtWDAy?=
 =?utf-8?B?d1lZSS9ReFdsajVDL3ZIWmdNeHN1bnBFN0dTVnpXczdEbkVGMElIanhEenVR?=
 =?utf-8?B?cGZ4ZTZ0WnYxSmhNZDVpNFdMUjVrUUhEQkpCVG1vcmM5U1IvcVdza0t3UnU5?=
 =?utf-8?B?aFhWOUpFcUswbU02WmJtUnNwY0VJb1RZbUh4TitoS01IMXhWRU5iR0l5ZzBQ?=
 =?utf-8?B?R21hMDlCMXV6UTBKZEZ0ZUJiemlxUlQ0c01CNXAxME5YdDdNVzRheDd5UU41?=
 =?utf-8?B?Q3k0VUQ2UzVYSHR4U01xdnF6bFhNcXFKV0kwRXgvNHFDNW1iSkM4RTdBWGx1?=
 =?utf-8?B?eEJnT2Q1TmIvZmRLdkJ0eGZ1VEdScGl1YkVwV2t1M1VyRnBaelNxcEJoN0ZL?=
 =?utf-8?B?OVFFNHJpNGJ2aEM4WEhvN293Q3dxM3hKbUpWTG5Gd3NNcWt4T3lHdmZDaTZp?=
 =?utf-8?B?Zm5TTS9WdG56dE9LS3BybC9lZkM0SlZlbHhHcC8xVDdrRVI1Ri9HOW5lbENS?=
 =?utf-8?B?bC80ZmI5QXkyV1JROTU4OUZXeXJOdzFiL0JJSEFYcVFOQ2ZXQ1FpV2tZT1hj?=
 =?utf-8?B?M050UzBHYXdqU2RtdXZ2ME1TMlBuZSthUk5YaHpBakgxaTduZnl4RzQ1YlVk?=
 =?utf-8?B?U3MwWFF0dVFyanZvSDRKUHpNM0F6MUJrUFBoWVN6YzQyMGxvbmNkN3E2V0da?=
 =?utf-8?B?Zk85MGdhMm1vMDdRRVBMd2ZVVFFRMy9uRGJ3QVFGNzcxS3NjNFJYdGN0UjVt?=
 =?utf-8?B?MHJQbnR0bUFWVzlSOWxWWUo4cGtNWFdNeGxhK0svdW5adXBZRXV5Z2x5Rmx2?=
 =?utf-8?B?eXBPa2U3WmJVVVZCV1pDdWRPZkdiNzVIbGNnMHdya0RUMlg5RlppVnZRYTFP?=
 =?utf-8?B?WmRmOExDVThSeFF1NE9XQVViSmVsblVMaWE0cWZBSmJRYmxqZDgvMUNieHFk?=
 =?utf-8?B?SlJJNHczNmhPUm56eWJkM0lwOERHbFZXeWZkN2tHcFFDYWYydGt5aUpET3Jj?=
 =?utf-8?B?SkNKd200YUZHZmFha3V3aEN0cTNCSzhuUnpkS0UwUStTZTV6anVkZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0551c1cb-8d7e-4fa0-5499-08de5e71d0db
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:33:26.4317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXmLzDze2Kp9CGCB1wIDzIHD3EZXzBobYRfoB9b25eXcIQWGcDUpP/xON+h0LFCOcpnfb2cbhq9N83bgZlXHXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5520
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EB884A2338
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:44:26PM +0000, Andrew Cooper wrote:
> On 28/01/2026 12:03 pm, Roger Pau Monne wrote:
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 376351b528c9..123202f2c025 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -710,6 +710,23 @@ static int domain_teardown(struct domain *d)
> >      return 0;
> >  }
> >  
> > +/*
> > + * Called multiple times during domain destruction, to attempt to early free
> > + * any stashed pages to be scrubbed.  The call from _domain_destroy() is done
> > + * when the toolstack can no longer stash any pages.
> > + */
> > +static void domain_free_pending_scrub(struct domain *d)
> > +{
> > +    rspin_lock(&d->page_alloc_lock);
> > +    if ( d->pending_scrub )
> > +    {
> > +        FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
> > +        d->pending_scrub_order = 0;
> > +        d->pending_scrub_index = 0;
> > +    }
> > +    rspin_unlock(&d->page_alloc_lock);
> > +}
> > +
> >  /*
> >   * Destroy a domain once all references to it have been dropped.  Used either
> >   * from the RCU path, or from the domain_create() error path before the domain
> > @@ -722,6 +739,8 @@ static void _domain_destroy(struct domain *d)
> >  
> >      XVFREE(d->console);
> >  
> > +    domain_free_pending_scrub(d);
> > +
> >      argo_destroy(d);
> >  
> >      rangeset_domain_destroy(d);
> > @@ -1286,6 +1305,8 @@ int domain_kill(struct domain *d)
> >          rspin_barrier(&d->domain_lock);
> >          argo_destroy(d);
> >          vnuma_destroy(d->vnuma);
> > +        domain_free_pending_scrub(d);
> > +        rspin_unlock(&d->page_alloc_lock);
> 
> This is a double unlock, isn't it?

Bah, this was a leftover from the previous version, sorry.

> 
> The freeing wants to be in domain_kill() (ish), or _domain_destroy() but
> not both.

Jan specifically asked for the cleanup to be in both.
_domain_destroy() is the must have one, as that's done once the domain
is unhooked from the domain list and hence can no longer be the target
of populate physmap hypercalls.  Jan asked for the domain_kill()
instance to attempt to free the pending page as early as possible.

> In this case we can't have anything using pending scrubbing until the
> domain is the domlist (i.e. can be the target of other hypercalls), so
> this wants to be in domain_relinquish_resources()  (rather than
> domain_kill() which we're trying to empty).

domain_relinquish_resources() is arch-specific, while the
pending_scrub stuff is common with all arches.  It seemed better
placed in domain_kill() because that's generic code shared by all
arches.

I could place it in domain_teardown() instead if that's better than
domain_kill().

> In principle we could assert that it's already NULL in _domain_destroy()
> which might help catch an error if it gets set early but the domain
> destroyed before getting into the domlist, but that seems like a rather
> slim case.

Given my understanding of the logic in the XENMEM_ hypercalls, I think
toolstack can still target domains in the process of being destroyed,
at which point we need to keep a final cleanup instance
_domain_destroy(), or otherwise adjust XENMEM_populate_physmap
hypercall (and others?) so they can't target dying domains.

Thanks, Roger.

