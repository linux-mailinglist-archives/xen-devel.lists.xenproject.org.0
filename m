Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E921898817F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806167.1217505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Ud-0004Le-HB; Fri, 27 Sep 2024 09:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806167.1217505; Fri, 27 Sep 2024 09:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Ud-0004Ig-DE; Fri, 27 Sep 2024 09:42:31 +0000
Received: by outflank-mailman (input) for mailman id 806167;
 Fri, 27 Sep 2024 09:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvZ8=QZ=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1su7Ub-00048z-VX
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:42:30 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf978eda-7cb4-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 11:42:29 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB5PR03MB9906.eurprd03.prod.outlook.com (2603:10a6:10:48d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Fri, 27 Sep
 2024 09:42:27 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 09:42:27 +0000
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
X-Inumbo-ID: cf978eda-7cb4-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRzkQPc276Z8gBGvdqGCIBUJJkox2kf4kVqkglmfpoL2GhLzmH1/hPF21Vpi/4o+fXK+YAjk+0A44SfO6VO0+20bggEl34XwJTC/B2fWRggTynlS260yWxtZD0EAVvDFVdOMdtY0wG92DZ7mA5wOn6ZnZw0SZKTIeGC5TV/fVPnagtFrcEolJ7E7renGnwKe8wvuxwwWIHXn+5waJkZ/ZVD/zolqtxevtFwDPk/LWGlCQSIF4wx/dCRIhxgqmT04IFY6uAlXGOxdlkcEBHIfGlRhvz1db4UuYHGJFW7ldpgzNI7GwsyHr9rKEBedhuqUh7kbwkh7ygymKtg26JlfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhnznkQSlXORm7PuZFJNaddsX3rwkwTwagp4RXo9aH4=;
 b=iu5AhA69p0qFXiQj+vrR9SX/3Rc33XnLrjCdjDUoJs6NYuhaM122vpaLyVNjIBejQG4SNePSXsA01V9HHVuFY9wxf2hxuKeeD6Z6j30uUkIFREB+XZAp+iI9pusRT+CHbes5W3ZfOMxs/UrrNkCJ54Nnc1SbK2VwR72+WLlXdRcJLHXttSLVopkNzKmV2mG51pq743TGnPI5hnavs52Ucb8WMoWUsxsS7TlJeirR9h2Kn6qDZx7fQbNdvTvDHzHgGInYEpKgyDzYVmVi/Jjh/gqL2Fdk0DLzgI9ToKYwvY4JY2q/CPZ/vq4M4ehTQUTsWh+qiTlhN+Zhp+DprK0qXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhnznkQSlXORm7PuZFJNaddsX3rwkwTwagp4RXo9aH4=;
 b=Pzk3khSYty9Fu0cafwx22GkzORmhEh3/IirmGxuV1gg7wgAVM+YOAKTvvSvkqyqEvnvYW+SDByei2WBI83H8TUuT9/49NYgcjlOBSWNlr0zRMYWf/LhUm5jqIXE7aXu+MLqvE7XJTyXjhb6KXSaOcdqRFjZ2dhAsVQ8G6NqPl8bU2OTIpArHHA8XC3IdZjfL+rnufBAed2R7sQqJz2Yd4uCBdYJqdCZdO3xYhSNwAFZHWA6dmyDWLhaMToAQVq35uE0YckCTIg+a5dDTffXwmrFxZnlqjo/Mdo3P2xe7slKC6eR7s/vC48xJRDX6xmAAEMVjHFp4ejJPOYzYDAKTfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <12072ee1-5a39-4c19-a442-c5be45fb968e@epam.com>
Date: Fri, 27 Sep 2024 12:42:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
 <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB5PR03MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4830081c-557d-42bc-62fa-08dcded8b286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlhDZGtOZHJaVjIzZ3ZUWExGdW1tVTdWaVRWbHJpb0ZoVjY3cHc1d0REc2xX?=
 =?utf-8?B?M0tSUUsyY21wdnRIWkI0ZW1JNnZaTUtYYUpXekdPUUd5R01WY0V2MisvT3dQ?=
 =?utf-8?B?UXArUEozdExUbFBLMGlXUVRQWEF6RjFPRUQwV3hCR3dFZVJWekxwRW5CY3d1?=
 =?utf-8?B?UUZ4dXU4eDRMeitjM0RINUVTT1F0V01NM3RSWnI5QkthK2lJM0RuWEJ4VTNP?=
 =?utf-8?B?T0x5THdNaktLTUpPQy9RZW9XeG8zb2tRV0RYcmVRYkt3Tlo5SVpJV1Z1Y1Ji?=
 =?utf-8?B?UlZiNjVsdk5iU3h3U2ZMYXg3K2dxUDdmNCtiTyttZG52QTl4dndJNHBrbmxO?=
 =?utf-8?B?M1lIVVUveFJYRHBTcWwyK2gxamVhanhKdW5acU1GWlhqdlZkc092YjVDZ0h4?=
 =?utf-8?B?NlB3RkhJcmZXblpXZ3c4blJsajl2VGtWYnEyVUNWbEozS1FFUitaZzg0b3Fo?=
 =?utf-8?B?R2ZoT2hBNzBNakxHOEprcW9zRXJBNHhZN0dGTUl2NmpmbS9ta3hOY1dVQ1pL?=
 =?utf-8?B?bU80U3hMbElLYmJuTUJJS2tDbTNJNHVwRXpFMkZSN0hNVUZGYXFFQU1zamdU?=
 =?utf-8?B?QjRNcTdTM2FwWDlkVkdPOUcxZHZaN3dtR05WeVlKOXprZVNRakk0cG4wN3NV?=
 =?utf-8?B?ZUdHQzZmTndsb2lFc0pMSVYyR0hhMnR6Q1ZyVHlJcXIwMDlZSHlObmZqR3Bj?=
 =?utf-8?B?U2trRmlaVkcyQXZ4anhiTXhmTGFjQ3l4cWFNOC9OSHpPMlA3b0tWTkNJL2Q3?=
 =?utf-8?B?N1c3UW5ndTN5SXlkMkVrK1RyQkRZcllIRWJ2NUo3OFZHUXhuNzEra3VkeWlr?=
 =?utf-8?B?V0doRytZdUROcGE0R1djOWs3M3RzY09MUC83VGsvUDhjUVU2VEdRSGNrejE4?=
 =?utf-8?B?RVd2VlFIVGQvUE9ZdFZ1ZU9tWWpleGIvNlZ6T0cxZW5lM1R4SWY5VVVXaHcy?=
 =?utf-8?B?c1hkeGlHVjFwMURnR2VPM0NESDh1SE9RbjMvSXZhdkxsSkl2akMvOUNwZkJN?=
 =?utf-8?B?b1YzWXprWkkraGYrRWVyZTVlc2syZHA1Zi9Xak9qZ2lwTUEwcG9lNmUrTHEw?=
 =?utf-8?B?aGpWV0gybmtXRWpRRDIxbTVKN002Vkg4bWx1dGRMYlJwc2o4bnFHV05FMDlI?=
 =?utf-8?B?ZU5uNGJSNldDTXVjWjQwN2d0KzRaS29zUndtUmpaSE4vZHRqKzFGWXZCUjJE?=
 =?utf-8?B?Vml2WnBmYXdXYjZSZG1TNFk2WklQaTlDa0g4OEU3b3lPZUtsUkx4Y1dkb2lV?=
 =?utf-8?B?eXpLL2UwTFRIZWVicXliU2RGanhvcTJrNmMxN3MzT3c1cWNab0V1WHlON2F1?=
 =?utf-8?B?dk9oSTR1UlFiZEJPbUlyenQxb2ZKSm5HVFhEdisxR1ZWbkFLY0E3b2U2NTIr?=
 =?utf-8?B?djNRbU1RYmVXQUUvc1JxcEh2VUhuRkFUMkJDMEhOVTJJdmhFd1hKVVJYaEJj?=
 =?utf-8?B?UXVRREEvcUEwTERPK0Y3eXBqVE9LSmRtOC9POGJjWkZDM01pVHJYbmZLbUdN?=
 =?utf-8?B?M0hBL0dXWmRGNmxLZENxTTZ2UHkwOVNTY0JyeDlFSDE1U3lodFMwQyt3ZmJu?=
 =?utf-8?B?L1U4bktFVHVrOVBqcFJQSmZnYytvYlAzdVh1a3RsRVc4TzhXTllUMkl5S1Jp?=
 =?utf-8?B?RWZtWjZrcDNQTUtGMUpuOWRJRlpGUEc1dE5oN1ZGSEJmMGxEd2U5QXNYcENy?=
 =?utf-8?B?ZVc4UWQ1dG1iYURwSW5Ib3BVOGdMcWcrNFBqNGh4bkhBbGlpTnh0QWx3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dS81K3FROXVDZitFMm5sVEJUS2RhcnFxVUV5R0FZUDAwWmVTVU90Vjl0dUVs?=
 =?utf-8?B?SVRvbzJWYVp3bXgvcTR5WmFRUEsvam1zMUlJU2R3UE5ZcG83dXI4bFJyeW93?=
 =?utf-8?B?Rlo5czF1SWU4K2poZ1UvOWdTUUFOVTZnZzUyYjg2dVB0OVphUlVYSkl0bFhV?=
 =?utf-8?B?ejVLcFlSWFIvNVR3VTgzRU5TeThSNFZoRkNrZ3g2UXVoWUJaNjlKVE1HNFpI?=
 =?utf-8?B?YU5hbWU0c0w0MzdNeWx1SU1sLzlwajJFakhnOWJBRU9pcGxNalY1MEJMOHBF?=
 =?utf-8?B?T3NtNlFFanRKRjJDTnBRL0ZWZG5NVXFTWEU4NG1rekRCZ2M1cWIyQ1RDOFZa?=
 =?utf-8?B?dUtuN3F1enJRWE5HcnBocldhaThmeVRqWlVLenJXWVU0RHFlZUMxaWpBMzg2?=
 =?utf-8?B?TVhXYTJnZjZJUHhjOGRmOTVDN0Y2WEFhZnBickg4dVlZZUdKdDYzZE5FRHpF?=
 =?utf-8?B?QVFsalM4SkRkbUJRMnVkQjBheFJxVGxHTDNmbHRjQXdHd1VPSXM0ZUE2SmRF?=
 =?utf-8?B?OXA5UloxMjFwYjdyR3BJdStUM3ZGSE4xWEdsYTNvUlYwRC9UQXNuYTAwNXhI?=
 =?utf-8?B?K2tLaG5EWVR0MU1Uem1MeS8zUFc5ZlB0SlhVM2VyUEJOclRDdlVmd0ZaMThK?=
 =?utf-8?B?MDNWMFd3SWltOWVUZUR4ZlJIVDdFaXNjRk1OanY5QXlxRVU1MUpHR096M1d6?=
 =?utf-8?B?RmNLZWxHUlorbW8xQ3NCQ0FaZGI4ZUg5bjFmYzI0QXdWSEZKYXdEWHAzd2xT?=
 =?utf-8?B?VFdsUDltZWJJV0FpVlg5UWhDQ3Rjc3NOUnVnZ2kvYlhIOFFFYUovMGx2V1Vt?=
 =?utf-8?B?TE9BZWFkUVZaUUdDakxjWXQyTFdCRnE5bFBhaUNQWnZCbGg0MjlQbmdOYVk1?=
 =?utf-8?B?c1cybGRXTjRxTWxVSU5MbWVnZGhUWVhPZW5ySUNTaDJKeTFOTU5HSmEyTTFF?=
 =?utf-8?B?QWRBUm9QMENxc2NFWWJJeHNLU0xWL2xYTGZpV2VPWTR5NkRBeVorM2ZTM0Nl?=
 =?utf-8?B?TWczeWR6am5hTWh5UGYrdjRmSitYWHMvYUo2MDFUTTNqNGxBMWR6NnlDZ2xP?=
 =?utf-8?B?bDNuNDdsbWplNUl6ZDVrRlgrOGVlcFBpc2tYV3NTdm5kWnR2SzNmcGhoZ3dp?=
 =?utf-8?B?Zm5PckVySzQramRzRXBycGhDWnlQVFZ5RXplVGpJbzZvdVN5SXhyRGttbGs1?=
 =?utf-8?B?OUYxQXZJUERRL29vWDRWdlhBcWpLdC9oNjJ0K3VGZ1Zadnp5Ly9zTXgrbWVI?=
 =?utf-8?B?bURXK2F6T0ZDUHg4Qk0vRC9JZjF1bW4wK1MxWmYzbXRQTHJ2cmJkN0l3c0xR?=
 =?utf-8?B?VFE1SzFFSnp1NzNyUEQrc2JETDlna2x2R3ZCZGtRcHA0MUw3ME14bjh4THBD?=
 =?utf-8?B?VVB0MFJjWDlndy9oQUM4VDhrRTUrTWZOeW5xRWdVa25tZjJoS0xjcURjSlR1?=
 =?utf-8?B?NVZ3dnZrdEtUcnN1YjMrbHV0YXhPRWJOcXBxSjZ0YVp5NnJBK0prT2FTbzVa?=
 =?utf-8?B?SXlibHB3N2ZyMWJXbnBpTlRIMUY2RkRCWmhHOTFQdTlJdVdxazRMaHl6dWNL?=
 =?utf-8?B?NitQYjFtSjVqMzRDN3JHQ0tCa2MwR1dDaGNlNE9jNFgveTdoTDdPMlg0VFlN?=
 =?utf-8?B?TWdncHN6ZjVNNXhBeWcrdzMwUmwzVzc5akJVTDNpc251MGZyWE5aUVMvVUZ3?=
 =?utf-8?B?eStLWnNxRDdsSFhiWlkvQkphYXAxK0lTeEdoN0xZSVZuaUNYNU5VY256dk9J?=
 =?utf-8?B?dWlNSitzWnNUVVEyZlpCcXlqMlVxUXlVOHU3RFFzZlVFdy9vRWlXekRuMlJx?=
 =?utf-8?B?MkROcEpFcUZmNk1xdE1XeSsrUDQ5SXR1L3hxQlNWc1I0d0xyVVJvQkIvOWl6?=
 =?utf-8?B?OGxGWEhVR1FFcjRPTmdUM01yRlFHS1hBWDBHaXVQM2pmdnZaalVDUEo4U3FI?=
 =?utf-8?B?SG1UVzlUckMwRWUzS2FaRFRmMzNoTU1JbS9DQUxjR0xoajhFZVV1NjE5M0Vh?=
 =?utf-8?B?OVpPbFB1SDJOUGptVG9HSkk4clFRQ3BVRTFmbFNhUFlwY2pobXJya0JmbXZw?=
 =?utf-8?B?WVdXMkJEMHh0d1pBVDdVNmZZdmtnNEdUKytoejZwQWF2QzJBdzFsVWhPNW9z?=
 =?utf-8?Q?ZFB7cJ9IM29yQ/neFx9Nmc6U7?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4830081c-557d-42bc-62fa-08dcded8b286
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 09:42:27.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPM8gkqnAtS379ltr14Ez9RGzGb3eUrx6DLiNTVF2gk4MPq3yJYIvVUAliEzXEITg5lhYeJG5xv0yP95cU/p7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB9906

23.09.24 13:01, Jan Beulich:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -758,6 +758,9 @@ static bool emulation_flags_ok(const struct domain
>> *d, uint32_t emflags)
>>                 (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
>>                 emflags != X86_EMU_LAPIC )
>>                return false;
>> +        if ( !is_hardware_domain(d) &&
>> +             (emflags & X86_EMU_PM) && !IS_ENABLED(CONFIG_X86_PMTIMER))
>> +            return false;
>>        }
>>        else if ( emflags != 0 && emflags != X86_EMU_PIT )
>>        {
> Why the is_hardware_domain() part of the check?

the idea was that since hardware domain has full hardware access it 
probably doesn't need emulated timer. But this check will be dropped 
anyway, as Roger suggested.

> 
>> (probably with X86_PMTIMER option depending on PV)
> HVM you mean?
> 

I wanted to do it like this:

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -386,7 +386,7 @@ config ALTP2M
           If unsure, stay with defaults.

  config X86_PMTIMER
-       bool "ACPI PM timer emulation support" if EXPERT
+       bool "ACPI PM timer emulation support" if EXPERT && PV
         default y
         depends on HVM
         help

to allow it to be disabled when PV is on and prevent situation when pvh 
domain can't be created because !PV and hvm domain can't be created 
either without emulated timer.

   -Sergiy

