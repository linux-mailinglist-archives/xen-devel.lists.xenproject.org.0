Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF2CC769E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 12:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188746.1509834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVpzI-0002Cw-8c; Wed, 17 Dec 2025 11:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188746.1509834; Wed, 17 Dec 2025 11:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVpzI-00029u-5K; Wed, 17 Dec 2025 11:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1188746;
 Wed, 17 Dec 2025 11:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0CCj=6X=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vVpzG-00029Y-Vs
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 11:46:35 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 088b748c-db3e-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 12:46:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7744.namprd03.prod.outlook.com (2603:10b6:208:4ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 11:46:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 11:46:30 +0000
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
X-Inumbo-ID: 088b748c-db3e-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEkAoaj1xUpjNSPg5lZfVWzXhQpUvMTdh3OivkagdBtAiiUkAVK4KJ5hLbtQOUeANESGFDi/NTIZMFFdFDxBlfz68jzX8ABl7/qAkE06j5HXCndEMFoMUwghQf+R52JHd+AwV3eJkQ8sWsQ0hZsrbvh+Y+lc7ZFbEMGKCXOiL2EgDePaq0WYEPhC5age3cuf6VhYh4nLbTHZtAVzQAVY8ytv0k6aaD+aTSUu8xwXtyHJwvY6xY0E5JBZYSaHqS95WUNQ9kDvZVZYX1gODs+SDFTn208vFJwSEe+kjBBUEDBYBJehFGnt6jxSl0hErbI8V3CvorRpTkxXl+fP1Sguzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Jf7VyL54wyiLJ45oOdxGR3ZZVuP1PZZak7x1WNcM9Q=;
 b=kTeyrXTs905eaOW5AsZuhFPyHxhxb3MO8QkvsvRP9oEwUQCKYfaZbSWCc2Il9XAyxz+p5/NoNHYVTqlNyPouKkT/WKOKzuCeJPv+2A2S7vjY1i2aofNOdVzFcX3/KrYg0A+lMGc18SxAiqoD7b72KhYiy+8OgHN2uPL2BChYOPmtymZPS6vA7g+yRv6OGTNXat+fmEwRzSKDCPS2gO4YOteV4eLpl+KAgm0jF3ruudSS3WCQ0iSmotDIL77q7zhB8clfhXpLYBBJTZlEu3H/LjrJAnC+9tG2lvIVhpmEf0h+4B4dRzPGKI+8kd4ddIKfUTZJ6f9i+NvbkI601OFskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Jf7VyL54wyiLJ45oOdxGR3ZZVuP1PZZak7x1WNcM9Q=;
 b=ebiEtFZd25ky6pxg8tMC6QJqnlb9HIc1slN/cQYFkO4p+Y+ERlEenoG7BSDasq4/gUvxyOJtmFwAntz0BVs0NsgEn+KLNiP63aJsdNMQBpU6ocXYkUw3YMDn9ftOTbUyrHNt0v7hGqdYgZBS15WmaOmdO01fmolg5vY91b2ll3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8aee5daf-be3b-4f10-aa38-b8c1504ba0b4@citrix.com>
Date: Wed, 17 Dec 2025 11:46:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1] xen: move alloc/free_vcpu_struct() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <5f75053750a9fca2b5fecf1dcf6f097b25e8f27f.1765967934.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5f75053750a9fca2b5fecf1dcf6f097b25e8f27f.1765967934.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: dcea86c7-28b2-4604-a4fa-08de3d61eb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlBPWGFZQTNCTGxWenYraFl4WlNJd09jak9FUE9uR1BuYUNNTC9KdnBjRU9s?=
 =?utf-8?B?QVhkajZRR2pYNERxSDNUWkloUkIvbWVwMXg1c0RCeVM4SytFbnlzRFpxVXVy?=
 =?utf-8?B?T2FOMWZTZVM5SVlIeEVTQm11ZnprZ3l1TlQ2eTVkNU1GV0pDZDVOUlh3bXY4?=
 =?utf-8?B?MSswd3VNV1dHSWFJeHBMbDJEOWJ1SFpXaGllcStidHpXczN2SUs2Uk8zV2dt?=
 =?utf-8?B?ZUpFZ0ZkQTBlaTFGWHIwUTcwUiswTUx4NytZSHR3VjlWandEN1JZVUt1V0FO?=
 =?utf-8?B?MEFxamVzSzVlak5DWHpLY1BYMzlZNy9nYkhpbzdpaXRmWXc2Z292Q0MwUWdw?=
 =?utf-8?B?bG1QMXVURmozVFlIQ09BMWRyUWhhRjRQb2RzOUFndk81ajhMbGtyQ3VVYkhG?=
 =?utf-8?B?R05CWEdHbHFGRWUyZlFtM1p2azUxZFBwYk1iRG02L2JCNlNoQTdmVDIzZmZ4?=
 =?utf-8?B?QW9uZTF6RWhwU1Qxa3AwZVZMZHF4RzNWMFlvdUg5aFFKbzM1a0UrOW5wZ2Ji?=
 =?utf-8?B?cGJnektnY3ZLL09IeXRJSFlFaCtsWC9yb3pKN2dBY1l5alhaZy9aTHJTNGg1?=
 =?utf-8?B?dlRocUUwSnVXenpNUndvcVFJeCsra0pCRktIUWhQTW9SV090TW84NEMvcUlq?=
 =?utf-8?B?d3J5TSsxdGk1MmIxN1RxRllwL0VhL092RUdsaXV4cmNPWEl0eXpiVG1QY0Zn?=
 =?utf-8?B?TTc4SXplZTZDOVVramUvdU8xRHJ6WDF4N05nek1ibGxsSC95UUx5QVVtN3E0?=
 =?utf-8?B?ZmYzb0lGUnNRZzNERDBheEFTSENKdWo2U1FJN2owRjJVeExIdXhhMk1xUWN1?=
 =?utf-8?B?cFRWcHpxaUd2ei8vUEtuY1dpV3J3RUVVanh1cmNLS0l0dmp5b09kVXhPd0p0?=
 =?utf-8?B?MG1QdGVvSGlFdmxiR1pqdUI4WnNyOURXWlk3Rmx3dndrREkyQmFvQWhORXZH?=
 =?utf-8?B?K3N0WmFtTGtGNWM5R053ajRrV1lLNlBQY3hDaUZDelRLa3ltdTNKQUZ3ei83?=
 =?utf-8?B?dFNFUWhIYzB0allRSFBsdHRjb05USk95WklKUDNtYW1rT0Uwd21UMXdMVjhj?=
 =?utf-8?B?cytUbmRRM1ZtYTRWZURZOFVWZVlnR3Y4eHJVNkwzeHJBeXo1eTd3YUNrTCs4?=
 =?utf-8?B?SVVtci9SWlV6ejJuNm4vaXNNeEZ5WEtSejJsMWM5YnIxQU5WRDIydHFYamxr?=
 =?utf-8?B?eTVSMEo3Vm4yZFhROTkxbW1TR0lsMS9weEhvZWxRY2tuTzZTdVdpZXh2QjUv?=
 =?utf-8?B?alFhR2ZWSks5QXVqR1BaTFJVSFliZ3VHblRJMVdrZW0wYkd2U1lJMkJPVzVD?=
 =?utf-8?B?cVBtWG8wblVwblIxYlNmMFNhUG44aHhPby9OZVNjREF3QnNLY1NvRE0vbEdC?=
 =?utf-8?B?T1JUV2xld1ArRFIrQzE1MGdKbEVscHQwNzNTYXRJTThXeTJySzB1WmdiNWc4?=
 =?utf-8?B?MnRvdmdCSmFodUVSSzd1OFFGZFRFa3FFdlI0bk5ZY2srSjB4U2dmdDdITjZ1?=
 =?utf-8?B?TDRyTVJtbkx3SjFzTk12TjJLdWNPMDZ6NHRvK2MzZE5SRGhHMGFNU3JSVmNQ?=
 =?utf-8?B?cjlSVXlZUW9teWZSM2NXczFiTzF4VDFVRVNyRUdNOTV5SFZibzdFam5tR3p3?=
 =?utf-8?B?enUvME11RkdMNGk4VnpmdEF5ZXBYM0lKelkrWHhSanFJN0JBNnBRMEYvdmov?=
 =?utf-8?B?VExMMzBkbmNxNkt3VE13M292aStZMDI5bkNXQlcyQ3FLdDVSY2V5YnAxcDlC?=
 =?utf-8?B?WUtwaUZjME5ieWJNZEYwKzVydzRRMzRYd05QOVdWY3VjQ0swbU8reHFUNSt3?=
 =?utf-8?B?RlhqSE9mK2lMMk15VTNyeHQ1MHRkOEJWMXJxOWxzRDJIQjhtUlgydStJN1VX?=
 =?utf-8?B?QWQ1RWxlTWcyMTZPZ1RMS0Y3WE9odFFoSEVpbmlqdjNEOWRRaUJqQW93dlpL?=
 =?utf-8?B?dU5WYytVajJQbXE2THhYbFJGWFdnZndPRFRwYjlENWw1c0VONWhZK3hVamty?=
 =?utf-8?B?TVJRdHZEdGtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzlQRzVzUURtdUErSVlRSm9rejM5L2MzRGxMZUYyeS9tdjZBSVJ3Tmg0M04x?=
 =?utf-8?B?TzcxL1JqckpoSGpyNUZrMHdpbEp3K0ptazh1UkppZmZ5U0pNQUxEczJmb0to?=
 =?utf-8?B?OWk5akdueWhFNFdZMzdQdWpmczdNcndadWtBYnJEaXllSFVGQTJvTU5ybGsr?=
 =?utf-8?B?alVtaVhVSHFjcEJqN1l0K0JWbG0rNUJCR3dGRnI4blFweDhzVHBzUXFZeFow?=
 =?utf-8?B?TjRRZXJJVXpnNFoxUS9sR0ZoaE9VaTNoZzZxYkgvc3JOQklGWVQxVUF5Ujl1?=
 =?utf-8?B?bHRtS2hBT1lQai9iVk5rOVJvSjFmMDNyTmR3MDJQOEtrNFAvVUs5NkdCUmFr?=
 =?utf-8?B?Qk0yUUF5UFJXbW8rbzVoWG4yVFBNNC9CVE1Qem9VZmpFWFAxRVpzN1Z0YzVn?=
 =?utf-8?B?dXZGdjNuajFYQlVMQk55bjhRalBlMU1PQll5SGw5OWFhZGlncFJYNVZKRTFi?=
 =?utf-8?B?SktXSTlaNzJURisxeDBCTHg2aS84V3d6cnpUSzE2Y2tQZ3JMNWhVcDZxR3Rp?=
 =?utf-8?B?dDlpa0J1SXdVMkhzMU4xdGNtTmJ2WDVGRlRSaWErcGxLeXVVcncvVUlVanFO?=
 =?utf-8?B?UHhNbktDSWt4TFArUHRVZ0JKZ3ltRk01Wmx1SVhlY0ZzQXgxdUJaekVKbEts?=
 =?utf-8?B?M056ZkRXSlMwWXNTMjNYRFpFWi9DUFVZc3FtQzZIWWJaeVNsVURVR0VsR09j?=
 =?utf-8?B?elpsaHBVMmdoYm54Z3prM0ZaWUh0TXRMb0N3RUF1QkFBcW9MTVk4RHNraFNF?=
 =?utf-8?B?YXorcDFHNTNpaVBPd1lzVU9EZm0wTGowaHgrdW5CemQ2OWVZNzVMQ3BPZUh0?=
 =?utf-8?B?Z2xxN2MrRU0wMEJQbDFJZ3BVK3llbDE1SW5aRjk0VHY0Nm9rbkMxR1VVTFB6?=
 =?utf-8?B?bHBOckRRa2JjVFp0dU9ZMjR6ZG1IUkRDVkZWVEhjNzJTLytMVGQ0cDc5Y2hh?=
 =?utf-8?B?Q1ZKbjc3Z25GNUMrWG9ja2l1aUNvWTlDR2E0TGkyOWtXa3NYbmFJRkFKcG1J?=
 =?utf-8?B?am15MThKNWM4Zk9DaWlQVWRWT0xQVC9IQ2E0QkdYOC9waFpsTm0vSmlDYkFF?=
 =?utf-8?B?cFRJY1o1aHlCL0F5WGdjb2NxVmExQ2dQRVk4RlBUalV3M3djVzZNV0dJTzRC?=
 =?utf-8?B?YVJ2Q2Nmd082bnptK0xqV0xMMmxHcnJ2WFFUR2lmVTB5NkttY0JxOTNqaVNn?=
 =?utf-8?B?Q1VFRnBRZUdpMWZERGsxTnVKS3FlMlo2ZmNpNTA4b1BWcWtGSC9NRnVVMnRW?=
 =?utf-8?B?KzRuaFVUbHNrcWYxVldnak9Wd3phYU9KY2xoQzFQdlFmZmx0NGYxK3BxSVlH?=
 =?utf-8?B?OEdDWFhxTm1FNElKbE9MTUlHSE9CQ1ZZZGZPWWdRTDdLODhZeUpIVjBLZ0hw?=
 =?utf-8?B?N3dXWFJ0RFk2eGkxYkE0V0Q0OUU0YXFsNTFxazd4SEZqUm4rbkp0MFAxTE9Y?=
 =?utf-8?B?WnJ6S2prZ1VidUE0REd1SjluSmpSTXdPUEovWi9pUlRTL2VDZlRYbHhNLzZF?=
 =?utf-8?B?enJLRGI2LzNvZGRqUS96UlRJaGxVSjRTdXFFNlg1Z2hIdnpKMjVBWFY4S2po?=
 =?utf-8?B?WXVFVnkyUGtBL2VNN2FaWi9wa1hCM2NPN1lqQmV2UlM1N3gyUVl4aWJyRjd6?=
 =?utf-8?B?MWJQZFdlSCtaWmxXY0kyU0huVTBOayttVWhJNGUzUXAxRXhiQTNMSTZHeEJP?=
 =?utf-8?B?RDFtVGVuMHEwQzZ6SzBlZnBaU1FSaFJFTVRXR0ZuMENMMWs5YU44VnRuWVlF?=
 =?utf-8?B?S1Roc0tiVHJKeGdMd0dMMGV1cTJkeXVKK0RCWkc3QWxXSEwzejYvS012cUh3?=
 =?utf-8?B?bS80SFFKclMzdFAyYkRoQndmeFJVM1RtUW8reEZJUFhhYXRsZ3BEenBPTERi?=
 =?utf-8?B?L0hiVFJVWVZ2a3huUk1oa1hUWE5qQWFHY2MyUkMyZVNhV1VxKzI3TDEwQ2Y3?=
 =?utf-8?B?WHNvMjVxUmY2bUdHcTNEY2RTL21ONHp3Ykw5MGtub3EyWTR2QjlLWFJBdWd3?=
 =?utf-8?B?eGhSS3ZpZ2ZwaHhOSHU2c2M2YlNPNkxxT1h1UmU2bmVWbTVaSm04RFFkSWZm?=
 =?utf-8?B?UnlaTHBWZ1R2NUswR0Zua2xWcDBTOUV4NnFoaVlEa1BUaU11SWlXLzVEYzRh?=
 =?utf-8?B?WnZMWUhCS2gzTmlhMkpkU3QxU0xyRVFMMnBCdHlNRWtzYjNCeS9WbHpCZnFh?=
 =?utf-8?B?M1creVdMeDVCcS8veGpDcW5UanoxYmZqS3BMM2NHYU5RNURYV0Q0dWNCMmVy?=
 =?utf-8?B?dEJ1QTFoZi9Hbjl2ckY1dFNGdjlhWDQ3V3BOQmE3RmdrZUliMUp1WGgwUERs?=
 =?utf-8?B?dXJaeFdMeWZYYVlUdWIzcUYrMEdSekpwMklkbU1GK24vdUJ2WkJUdG10ek1U?=
 =?utf-8?Q?WnQmWPdpG8XK0P4w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcea86c7-28b2-4604-a4fa-08de3d61eb0f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 11:46:29.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvQZtl0k2eXAJBv5xF4oOZxgqgV6O8PpBe4BhN5ZSncEt++hMVX73fsH1H42aa3UsMJTb+SGjzvSwYK7ctS+uL5d0Xln95U/JDjMgA8MEeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7744

On 17/12/2025 10:53 am, Oleksii Kurochko wrote:
> alloc_vcpu_struct() and free_vcpu_struct() contain little
> architecture-specific logic and are suitable for sharing across
> architectures. Move both helpers to common code.
>
> To support the remaining architectural differences, introduce
> arch_vcpu_struct_memflags(), allowing architectures to override the
> memory flags passed to alloc_xenheap_pages(). This is currently needed
> by x86, which may require MEMF_bits(32) for HVM guests using shadow
> paging.

You lost the comment explaining the restriction.  This needs adding back.

> Move the definition of MAX_PAGES_PER_VCPU to xen/domain.h and default
> it to 1. Retain the ARM64 exception (with CONFIG_NEW_VGIC) where two
> pages are required due to larger per-IRQ structures.

CONFIG_NEW_VGIC is still off by default, unsupported, and has had no
work on it since it's introduction in 2018.

There are a lot of good reasons to enforce struct vcpu being a single
page allocation, not least because an allocation can fail due to
fragmentation despite there being enough free RAM.

I would far rather that common code enforced it being page size, and
NEW_VGIC gets deleted or adjusted to cope, than to make it this easy for
architectures to shoot themselves in the foot.

>
> The ARM implementation of alloc/free_vcpu_struct() is removed and
> replaced by the common version. Stub implementations are also dropped
> from PPC and RISC-V.
>
> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
> common/domain.c, as they are no longer used outside common code.
>
> No functional changes.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2219693055
>
> Shouldn't we make alloc_domain_struct() and free_domain_struct() static and
> drop their declarations from xen/domain.h, since these functions are only
> used in common/domain.c?

Yes - they should become static.

~Andrew

