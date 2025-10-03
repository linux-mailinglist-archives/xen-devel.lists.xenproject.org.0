Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56FBB636F
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 10:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136375.1472961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4arH-0004w9-5M; Fri, 03 Oct 2025 08:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136375.1472961; Fri, 03 Oct 2025 08:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4arH-0004tv-2h; Fri, 03 Oct 2025 08:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1136375;
 Fri, 03 Oct 2025 08:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4arF-0004tl-W4
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 08:09:41 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ef2ff2a-a030-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 10:09:40 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH7PR03MB7195.namprd03.prod.outlook.com (2603:10b6:510:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 08:09:35 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 08:09:35 +0000
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
X-Inumbo-ID: 4ef2ff2a-a030-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xa7r6HykB3kj7w/UL4PjwC3J1zn+mAulptHiW3bINRsHMm2T8AV0Qr/EqwVyahrFdgHd541WG9e8A4SiVuCREGcKju7D8HYLU5gjO/ud8QOljso/bl/1XIivu90FxN82Lo6XiomMAVgI/SaZZFU0XwDB7SA4iWagunA6maGrFLhQfmdtbX+F4Nm3xwzmPSHxQlYFIBZYvpjVaCr9ZaNmoSO10j6xGXBSMU9tKwMa+310U6DtAPpWpT5z5s9i/XwCeg+PbdvaydVNtWs62eG5/uQi5uShO/O297nym8ZeDVvbCHUFQC/LSO+VyTrURaF40xnivz98pjAeshyQqfmJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARIHJkXi1jXuLk4vHUS9FTN3qRxDN3QDgQ5nbC2j2gw=;
 b=m/uP7/sfrynWY1IUE36jojXAUFvmvGHHz5lmnAqB+nl6z7k43YyuIKndISUQlFl+s8tqRZ6ZajkG0mHIwQrDpDnm6jj4Lmzs7Sxt9kklQP95EOoALy0/IlJle3JxlX7vkqQgKvbpvBhubCXjLBmQgk0vgMMuRJvnX9zwDQJS/T9Q2/dDRQhxRHV+KnazqZeCRPdjQMhxrcb2IZ1jqmKMHgFu13tEGbZTRyHITF3XfpZZWyTJQAdjgYGy/n+sT6EX1vQu3xMU5jAaZqt0zD1fAlIpIomb7Gl++E71ThIQXMqfdFelzGQoBRbqvj5/PPjYDnYmsu42QCJkXLWMsQ4EJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARIHJkXi1jXuLk4vHUS9FTN3qRxDN3QDgQ5nbC2j2gw=;
 b=i8yt1wsJ3CnMO1zm9yzWOlRZeaiXbW2iYebqdLXAoR5tmgoB4C81vwZ6ofy5Kew9YhKyYhP8T/ShehDy7vAmE6fmnrNdAJ+jsXpQN/eGIx7ylPjpTwpaNVHdRT8dWErnfXKvXsrf0aIjn00WCYEhK7KYWQrbJJv6CVf8V8T4agU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Oct 2025 10:09:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
Message-ID: <aN-EuzQ2AZ1oMN0K@Mac.lan>
References: <20251002234311.10926-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002234311.10926-1-jason.andryuk@amd.com>
X-ClientProxiedBy: PR3P189CA0068.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH7PR03MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: b5faa59d-6033-4b14-cffe-08de025430a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkN1V3REYkJ0YjkxMU94Tk5SVnhJemlwV2xhaHlvbU53VnJZU1RRbjV5aDFL?=
 =?utf-8?B?ZDg5cWVjSElKVE5oNDIwaXNCWkQ4T09QbmpyQStNdjJyUVc3aFMxWC8zUTl4?=
 =?utf-8?B?ZUFwNHRKbG1lM2VCdmw2STZBZWFFZzZIQWtZcms4enR5T0lYV0RGaVlNMis2?=
 =?utf-8?B?ZkRpS3FhS3VFT29SbUZsNVJURDluMTRieXF2eWFkYWdDWUhTMU53QXdnbWpj?=
 =?utf-8?B?UnE4aXZKODZqWk5EcnJDZll5V3cyQVl6T3prQWI5R2RpS1BLMEVpQU16QmVT?=
 =?utf-8?B?V09NcXgrU3dUaERnL3I1ejEvUG54NE9WMTBpeVVuY0R1aXJvQ0xRemlJdmtW?=
 =?utf-8?B?YlY3UUpselJFbWQvczRIT0pzSDVLNmt6M3I2VGNTcnJ0MndwSklvcnI5OVly?=
 =?utf-8?B?R25MclNKTURZTmpnMWg4ZTNkQW5Rd2F5K1RXeTRkVEZZb254NmpoTDhaaWly?=
 =?utf-8?B?UkYrZEZOM1JBa2lYaEFORnBvVU9zWDlSK1BxTVdFWHM0VXpqUXZjREttaWl6?=
 =?utf-8?B?RHhodXk2N3htU0o5cU0vdVhGRjFMZTRrdEcrUUg4ZXlGR1IvK2tpQXlISEZk?=
 =?utf-8?B?OTNuWTJNNGhkVmR0anlxLzZEdTh3SXlWVnExNTdQa2RYM1ZlVXdFRHVrZDhM?=
 =?utf-8?B?azFOVE1ZcjcrRHZFYXlzcFhyUlBvWStraDJGbEhtbEh4SmU3RkZlQnZPNWlz?=
 =?utf-8?B?d01wV2hNRFZ4aFl3dzAvNWRPZWord2NpSWF0Nm9PMzkvSFhkVTBzSzV0Zytr?=
 =?utf-8?B?eHBZVTNnTUc0R3JmcXc5Ukc2ZWkzbXNjRVBjZXNhbE42OE8ybnNPR0FsNS9q?=
 =?utf-8?B?cGdScGxhVFR0REhsN2tXenhvK3dBV3dUMC81R1ZOZ2FqdTBGeXN0TGFwQWdn?=
 =?utf-8?B?RUFWZFNrVWIxVlFVb1hQU2lJM1daN3pva2cxSDRhMUxOOVErUnROcitXdzV6?=
 =?utf-8?B?ZHdKRG1PaVl3TTRWaU5ka0FnNDRjanBsZlliaktoZUh4T0lCQXd4Z0RKZ0Nh?=
 =?utf-8?B?Q3p1ZFVZQ29scTkrR0RoUW9zUG5nd1VmMGdKWEp6R3FLOEdDcm1wVWJtYyty?=
 =?utf-8?B?UXowQ2t5dEJSYytPeWJyNkt4YWpZd3VpWXEyVEE3Ly9TS1VuT2hZYVFTdGNv?=
 =?utf-8?B?cDVDUkZxdy9KTXRXazYwYkl4K1hONlRSMDV6bUE1TTBNUnJFTXBKRmhFb3hw?=
 =?utf-8?B?SzJnQ0ZLNWRmTk9QN1JpbHRCOWdSMW5obHZIZmN0SGZoazBRcGQ1NlpRYXB6?=
 =?utf-8?B?NUY2V25YbTkyV0pNclZhV3I4azhVMno3R0JoWitNYVZSOTdyUkwwWXhPQnE4?=
 =?utf-8?B?blYzaURBbW42RkJRb09JVW1hdUNlN202L2E0MG1kR0xETlJRL0gvbFpTOXRr?=
 =?utf-8?B?YXlFMmFnYWZxaXBQUko4YXpJZGRUd1Qvb1piWERwMVhGZTBvMTdpYU1mS0dv?=
 =?utf-8?B?U29uYk1YVXpkbWN1MVE2OFFOZ2tMSFZjVURTWXVncGlXZnVmeUJTQXhTTG9n?=
 =?utf-8?B?M3JwV3gyekNIdGpQWFVFTHZ0WWtFM1hTVDJmVnM2U3daamlCVWJQSTVmUkRC?=
 =?utf-8?B?emEzZ1JLM1RCMTlWN3pvUTYyTlhKUkhNZ3JpdXFJNEVzUWhEWkZhYVFHQWJj?=
 =?utf-8?B?L0MzK1dZQjgvdzhPL3k5WG96WGVibVdJZ3FMZmk2ei9pNlFFM0o1dHJtOXo4?=
 =?utf-8?B?UTVpM2RKYmNHWjBDcjh3QzgvRjhiYWlDNVNSUTdaNDR1V1RxYThFays5aXU0?=
 =?utf-8?B?SXFvYzVJSzlIVFhPNmlqL1lYN3YyNGpxRFMwU21GcWEzSVVFdSsxVGxKWUpZ?=
 =?utf-8?B?YTZseW1tRlVTM2l6UkxxK2t0djd0bWdRaWpNVnM1SUx1dERPRnBybUwwNGZr?=
 =?utf-8?B?M2d1dk5rWlZzblFmTzV0ejNaSHo5dlRoQTI2b2tEeE81NTM3QldqS2daNkR2?=
 =?utf-8?Q?adz/PLIpeMUtH+aOBHiQc9cXJvztrk4s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enhXVHlCZm82WlFoT1JveklHZDB5YTRoK010NjdYRWkwWGtZaVZDL0RDQ0ow?=
 =?utf-8?B?aWJ3TThSb0NPbkpmdFZodlBjdC84SDZzbS9JZTEzK0E3Zis5SEt0YlFHb3dF?=
 =?utf-8?B?WjZlWFNuTmMwTFZHaERRWTErMnRFRHFFTnY1MjEweHNEVXFIeXNRK252bS9T?=
 =?utf-8?B?ME1aVTRQN1htMnVvNkRZMk41aHN1QUZ1eUZ1Nkd3c2svek9PUWhYRjZ0RXdO?=
 =?utf-8?B?RkNzeFpvck9WeG81Mi95QlluRzJHcFlrWjI3dDNmMXFvai81SzlqUVYyRDVq?=
 =?utf-8?B?M3lWSTgzRk8wakNuRjVIVTQyRWtzcGJiT2dyeE1qV09BNm10c2xESk1HaUh1?=
 =?utf-8?B?akJtbWl6YjhOQkxGc290dlBJTERMbW8yYkp4azd0R3MxZFdkS3J5NEh1R0x2?=
 =?utf-8?B?SXdCMUphM3g4N090WmdHZ3hGOUhscE1rZ1FPK1NEVTYxcGgvb3NndFp2U2Mr?=
 =?utf-8?B?RitlQXFVQUVOUE9YUmEwTUxXak5DMGs3bWRZZjRId3NsQjY5U3p0TFNPbXlQ?=
 =?utf-8?B?WG5OVkRUQWhKanhOTWYzL2s5ZWJSOXBLNXlKRXh2ZVV6c0ExWmhVN2luc2xQ?=
 =?utf-8?B?ZFFLTksyYVl5TWRzYm1aNzZKcmlZOGdEakR6dnk2Y0twRnVmMWJoTTY5cnJi?=
 =?utf-8?B?SklueDBZRk51UUJDc3NId1RuZGM3VXV3SHE2aXpVZVRBb0UwdE1KdmhyWEVu?=
 =?utf-8?B?TWpaUnRXVVFWcDhDTjZzOUZYbXdzRHpET0NzK2QzVnBXVTNHRDMyUmZ4OXNk?=
 =?utf-8?B?Y1BEOGp5dVVYbC84c0VVcEhLTnJUMmlCbkFjS3ZpV05oRFI3OUpNS29YanZ5?=
 =?utf-8?B?Z1Yxc20yYlBQcEd6NWc5NzdTYjJMZjFqTUlLSUloOHFYTGlIVlNBRDlnVTJW?=
 =?utf-8?B?bU80TlBybUd0K1kyUWl5TEhkbzZxbnJlcUpMdGV2TFh1Y21PazZVT2tCYWVV?=
 =?utf-8?B?RXB0aEwvVUNaU3VyQkRVcHZ0MUkwVVU0TEVRU2pPOEZZeTYyU1psZVlLdDZK?=
 =?utf-8?B?WVRGMFRVSEgwOVRtcnNwRkd0VUs0S0JNWXdRM1p0Nnk4dHhzNXorNHRJNnFT?=
 =?utf-8?B?T3B3cnV3QjV4QjhZS3FEM29YajhEUVR4aW5LUXRQL2NvSllURXRYZit3MEsx?=
 =?utf-8?B?azh3bGtzKzBSa2FDR2pRZ1B2RDI4L1BLbmoxbUJaUTdJWmVzajBabDcrdElz?=
 =?utf-8?B?a1FEaEVaZmd4ZWF5OTlESGtvL1NwQTlLK3pKazM4WHc5QTQ1NUhTRk1aTGY1?=
 =?utf-8?B?U0g0cnFHN3ByWmtwN29hd2wxZlNBWUR0dGlrcEF4NG40aEJmNWMxaUpRQmZm?=
 =?utf-8?B?WXkyRnJKa3ZvcjFEUHhGQ0lJUHBmM0RvVWdTOXUrU1lsUGFXQ2g2OWxQS3c2?=
 =?utf-8?B?VGt4OFdLbnk3S2FhTEhBRFlNd3g2T1plSDVOc0dQU1hmRnRRWEJMVkZpK2U0?=
 =?utf-8?B?dXVZQmpBVUxKZnIrdkdGd1pVVm5GaHNPQ3dUdG10ZlRzVUFVZVZ5REdtYytL?=
 =?utf-8?B?T2VVaWluSHA4SnUwWWVLQ3RPbStpSkh4eWExdEZqUUh5VmFiNVltb3d6cGxm?=
 =?utf-8?B?MkNOcjMrZHJjSGZqekppUDJGbFdDR0dNYWxTOGlKQWNYM2dMczZnWmJmWU9a?=
 =?utf-8?B?WWpqMHRxSWVrWlZsVFprMy9yNjZpWTlLOXArUWhidklMWWpoUlNWNHBDU2pm?=
 =?utf-8?B?MWp3Wm1UZHlYZ29ZblFnSm0vSmwzNVZiYVJlOVMwSkZDYXpzUEtNaDFydmdK?=
 =?utf-8?B?Zi9WcVpmdm1zaWQ0MGNDZkpLajhSQVVwWkE5cXFuOEhXNTdrYzlvRDRya2pw?=
 =?utf-8?B?RFpLYVFBUTlVdUFqcjVDeEhQV1RHR3pPZ2I2d2Q3aENDT0tnYWsvbW9YbGtC?=
 =?utf-8?B?dDhQYitwNEt1cC92V1VTSlY5ZU1kMnhLbDA2Yis5WkI5TlVmcm9hSFFXZmtM?=
 =?utf-8?B?bzBFWU4xNlc4RmRSTHVOWlF6Wm5uWlNDaVB5c3FqazE0RWFHKzh3Z0g5bk1U?=
 =?utf-8?B?Z0tCV3Mwdy9HMWZEcldVVGpOZ0JzNnRRemxWNnp3dk5nbzFZNDQ2TVV5UnJ6?=
 =?utf-8?B?SXhPck5HMUJ1WUFYYjFlSEtpcFhpejNGQVhnNVM1dTB3SzZ6SFFjUzNGQ1RG?=
 =?utf-8?Q?zULvmoNF87bVup9WpI4oNDbok?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5faa59d-6033-4b14-cffe-08de025430a1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 08:09:35.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBcfUr4qWLBhUf70mXoDs1SaQKjI/MuS1UZ6JmXkid/xUumgyuWF+YBmnEmr8HEvoePRQ+7Hlwmz0EU3wHvFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7195

On Thu, Oct 02, 2025 at 07:42:38PM -0400, Jason Andryuk wrote:
> Split out AMD SVM and AMD IOMMU, and add myself as a reviewer.  Jan,
> Andrew and Roger are set as maintainers as they were for the X86 entry.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks for adding yourself!

I have on question below about the mechanics of MAINTAINERS parsing
(but no objection at all with you becoming a reviewer).

> ---
>  MAINTAINERS | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 793561f63f..0139edd88b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
>  F:	xen/include/acpi/
>  F:	tools/libacpi/
>  
> +AMD SVM
> +M:	Jan Beulich <jbeulich@suse.com>
> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
> +M:	Roger Pau Monné <roger.pau@citrix.com>
> +R:	Jason Andryuk <jason.andryuk@amd.com>
> +S:	Supported
> +F:	xen/arch/x86/hvm/svm/
> +F:	xen/arch/x86/cpu/vpmu_amd.c
> +
> +AMD IOMMU
> +M:	Jan Beulich <jbeulich@suse.com>
> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
> +M:	Roger Pau Monné <roger.pau@citrix.com>
> +R:	Jason Andryuk <jason.andryuk@amd.com>
> +S:	Supported
> +F:	xen/drivers/passthrough/amd/
> +
>  ARGO
>  M:	Christopher Clark <christopher.w.clark@gmail.com>
>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
> @@ -601,7 +618,8 @@ M:	Roger Pau Monné <roger.pau@citrix.com>
>  S:	Supported
>  L:	xen-devel@lists.xenproject.org
>  F:	xen/arch/x86/
> -F:	xen/drivers/passthrough/amd/
> +X:	xen/arch/x86/hvm/svm/
> +X:	xen/arch/x86/cpu/vpmu_amd.c

Would it be possible to not exclude the SVM related code here, and
avoid having to duplicate the x86 maintainers on the AMD entries?

Or the parsing of the file doesn't deal with multiple entries possibly
covering the same files?

Thanks, Roger.

