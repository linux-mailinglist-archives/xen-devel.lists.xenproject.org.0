Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400C78BEC8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591979.924580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasVs-0000cd-04; Tue, 29 Aug 2023 06:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591979.924580; Tue, 29 Aug 2023 06:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasVr-0000a9-Rr; Tue, 29 Aug 2023 06:47:43 +0000
Received: by outflank-mailman (input) for mailman id 591979;
 Tue, 29 Aug 2023 06:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasVq-0000a3-JN
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:47:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2fce623-4637-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 08:47:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6988.eurprd04.prod.outlook.com (2603:10a6:10:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 29 Aug
 2023 06:47:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:47:39 +0000
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
X-Inumbo-ID: f2fce623-4637-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7WPv+eHJMgIPXrI/c6DpcgmPN6q0liLsVltnbw6A+OYisNYMyyS1ih8XRJW8Y8E3kth/SVAMZU/qKl8SbHz/nd2rO8xJShwUu8giBA9Wxf5mAKdAq7WYpRE5FSEaWs9ZMdjjQLFi7KTg1z60ZCnqsqEL8ZqP1tTVV6/fLL6qBxhWnxJptRI/saWmaJa62gFLGqZV6pRynX6rVL7XGiMzIC3xL3wrov740EBp8ETvbXJgJMBnHmpnUPjVgYXKHDpgiIJ5f9QvwAKUGLexG/IrOJ0yKP4Am/8/SSqi87xkUqVKHWPHgLHYVpRgK5CF6bnxhWYDKCJ575mfm898P+Vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1484RxhoZ5LqDBRVE/YfSqI/+t8It9Ms1UanNFR42I=;
 b=QpD0er0ZBhlCN3y3fX56JbqQmQMArGv0OVizWTbLAaQbRxOSXisDxXPOIm0qJUZtC3BWkI1BF1U1Dh+baelvoe+TUmflLlR4HOoJJ7a6wkBbM9dm7rM6vbZscvXysKZKz4CyFVfno5pYQ58gBvYKTSTFUQE6/8Gn0ArmCu6TWwFwnVyp9K/87vAy1lN5qyNMUh/H5a00refM1nId/q+cncfFa/41su46dsAjz07jcahE77E00f7UWR1Cdu2h3JRo3a5Hi/SfAQg58wepi6wjeENR9VLgOQ85SgQoAEf8/SOWmRB7hzUBNLnqCCpTaTpXyl3UoJ8x/sHfWxQ5qfXUlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1484RxhoZ5LqDBRVE/YfSqI/+t8It9Ms1UanNFR42I=;
 b=yddUaDpys+hYRv8Q1iMKcgTD7N/yqpOJIVVSOloaJQVQ6K7D2y8WYwXt+WW0QsAPItKoufJiq6esTXCy1Manl32d9CQu6ge55uwt1di/HwUoLYZK8VAmbmg6k7BMPNBF0UfIpIe8sjQgKWPHeNpxrWqYKfqEDBZimn12j6rcgjSzqj8OuQ+xnS7Lz5563pvJPfsmJO6UdStnPBs4qD7RJIDT6HlggDeUEJ8O+v1URrYA6Ja5rT9uvAFqtmaSuJw+8hqf7J6cciaejPILErMDfgaONtdzu8gJ4fQBP4OuCEKe/rjZWticfwWQa/rHiltffUN/Mt3NegsPQDUOlp+4uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65c3af43-9fc1-d284-bde4-20edea6a2558@suse.com>
Date: Tue, 29 Aug 2023 08:47:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 10/13] xen/efi: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <7726a38c4bf15a94b9bbcbc465bd499f94067ddc.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281542080.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308281542080.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: bfde1ef4-413f-4e2f-1772-08dba85bd668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgFkW6LpBdYmGAXjsO3kvjUGRmnM/Xu5kNYXLO6u/Q3mq4zrZzVkeH/7W/ccSM88blxxy2Iz0hw1a3Ugfren4lbBZ+19RVlmIt3+GkMQoW1GJd6wWTqZzfLjwsSm1+gF322UQOdEdyq0kE9Y+5NnOQK+NUDliKTyKzxQ3zIkBp/PYlWIehhZOG1A8fY4i0uV0IbRYsatR2XpRfLXOLfTPss1DgEHfg8wSLdH6ARLLkjURd1cEu8RBntU0F9pkNcqflgbzbLckKc5zfpq2LJEpU8uduKiX055lWnKiDemuasjnQoXJ7iuNQxV+pba0+GB1j5VNgqc875ArGad/nWPHhZ0bYKeJ8Jzal4hF2e8QOhoWoTrR2RSLhN+9QJsfOQk+OURmLGpqn4sCAmg9n2r4xtJ9SZZZBrG9dKA2FemUQsLh6asAIPzm3zFYehVjIyvypZemo31Nx7xWcTgi5Sq2VBpTSS4lYhhJg1PdYM8iQWu53HJFCtoi7A8xYOSz73xaKATWuX2yBrmXcKzzIJ5YGozgUg3rtENGQEI2w5LNozdS6P7Tkk4lb1DB5LgpmYMmCcWp3yqPEcLt90mn/7yFUcp5i61k2vzC7bVZc7XKhpXHs+ueO8C/Jk5XK5eJGBS1RCyQCIoR6QYFnR4Hb5Ozw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199024)(1800799009)(186009)(6506007)(66476007)(38100700002)(6512007)(66946007)(110136005)(66556008)(8936002)(2616005)(316002)(41300700001)(36756003)(4326008)(8676002)(478600001)(4744005)(2906002)(86362001)(26005)(31686004)(53546011)(31696002)(6486002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEFWa1NWdjUwOEZrdHJRUitzckx1clo3Vys0RFJTb1MwTjdkSzdySHRxTU53?=
 =?utf-8?B?TTRSQWRlbGsyVFowWWNsK0xpKzNSUm5YWU9sc2ZpZ3dDYjVseTkrSVN6Um9z?=
 =?utf-8?B?WFc2ZnRFNnkvczRYNU9iT0FGM1k1ZndodFRoUWhhT3VyQWdaN1BqUEo3TWZK?=
 =?utf-8?B?VytLUHZaSENlTnNjUlFIRkxjYnNUMVE1VlJnOVVseSthTzAxM1VLbnFIK0Nn?=
 =?utf-8?B?UldDVzdmNUdTNDBURGhVM1V3S1Y0WThKZ3NFYWlHWnVBcVJPOW9vOC9YbHBY?=
 =?utf-8?B?OEExVEVSWHZFZEdFVW90SzE1b1RvUVdHSWpYYTVmMnpFL1lTZENJd0FwK2FX?=
 =?utf-8?B?UURSV0ZHdm1VeFB4b2JxNEp6MktPTkpNVzc0R0orYXdPa2JYSUVhMmpSZkNa?=
 =?utf-8?B?TXZ6aS9kYXlxRDlGZk8zWVNFR3BEcGQ3Y0JPbFZINm91TFY0RldFTGcvRUsx?=
 =?utf-8?B?RW1hb0pESi9UZm5Wc2QvS2RDcGRpQzVuSDZTb3Y1V2owN3pZNU5pRU9UYmFQ?=
 =?utf-8?B?cE10Um5BS0haY050VkE3aVZEeEluVmloR3p0enBOU0E2UFdITjV0WUI4N3ds?=
 =?utf-8?B?VVFUM09rWEU2bkVtOElyUTVadEoxQjZOZGRQaU9JZG9xb1NQZ3VRU1loMzJ4?=
 =?utf-8?B?enNlSHNnVW1yaEFPZENSeDZWdEZnVEhjK1ZlMkUwZC9tOHdXdjlBSHpDYUhX?=
 =?utf-8?B?WWJWYnlJMXNNVU9uWXgxRHZJT1ZhTGtIUUM1OHpkOFZVM3NzUUlPa3VqMWhy?=
 =?utf-8?B?bncwMlJHNXByUkRBUzRFRkJ5Qi9Oek01QWlzRzF6N1lGRHg4cHBzc1J3TFY5?=
 =?utf-8?B?SkVZMXZSRTBoaURXeUxOZ0JkMHJsVU5Pc2MxemdtdkNOM0NCbEVFY3NDeExC?=
 =?utf-8?B?Y3dsUFRXdUpDcENORWxHNGQzdjBwZUd0KzA4d0ExTHlVMDYrM0dIRjFiNjhm?=
 =?utf-8?B?VEUxMDM4eFVsbEYzaksrbGVYZ0FoMzhIV0trSGpLTVpLcjBqQWZoSVk5QnJK?=
 =?utf-8?B?N0laSHZITXpURkFCMGJ6TUtjVWh4VWpIUjRaOE50azc4YXNqTnpOQ0h4eFpo?=
 =?utf-8?B?TFB1ZTdGTXFKdVQ2KzBxOEt0RVRiUm9waXRFNmZrK3FaUnZ5TFdRcEU0Vncz?=
 =?utf-8?B?bmxsQ3dUbndMa1U0aTJVdUV2L1NPS0tVNFNJSEhjaFYvZURjS0V3OWtNZ09x?=
 =?utf-8?B?T2k4ZWE1S0NoYU9OakpRSlhXYVZrcEpZL1RzT3hPYjRvMDNydzJJS3lwU0lV?=
 =?utf-8?B?VmtvditNcUJuN0hFckwrUWtlZnpyOG1JV2loNGkzZkhNRm9kR3JBbjdVU0tl?=
 =?utf-8?B?YXdSUEt1ZFZuWFI5LzZNb3VML2pnaWJIZUU0QXlLeEVsQVE2eDBkUXRad0pK?=
 =?utf-8?B?OUhmVmp1cFozTGliQ3VkV1BBWTk5dlBBUEkzZ3E3TFlFRWVLNGVTcEZyZkFy?=
 =?utf-8?B?cXZEb1d2UVdLT0JNcnlyU1p1b3FuK2g4U2ZSRWVvcWw1QXlSWktIeENvSUI1?=
 =?utf-8?B?Q0l0K2JoVERYUjRmSEZkZGJkY3Jxcm1YWGNZT2wyUTR1SjBGTElIdU14OVVF?=
 =?utf-8?B?eHpnVHg5Tm5nTkl3ak9YWkl1ZUtwME1hQTVLSEh3MGorU1FPeEdLclZXY2FT?=
 =?utf-8?B?UThWOFVOU0NDOTRUcE04TjkxWFF2cWxJb3phUVgyRkw3RHVsRlFEVGFFUmJG?=
 =?utf-8?B?VTVrNDVXbENJWnlidDJTL2lPaDdUYjNVZCtkb3g2ZlZOYUZZYXR5T3JUVWtN?=
 =?utf-8?B?c2piSzNlb1AxQmlLbDZvY0RHMmJ5bFh6cFQ1TGp6cGdadndobU1kOHh2NXpH?=
 =?utf-8?B?cklLZk5lNHhYeFNDVDI5YjZIcjdJOEY1Tmo1OWRmendSK2JZTSt1dXd0ODFr?=
 =?utf-8?B?Y2c0dEdYMER2SnVleENLZXhjQld2Q3R3b20vY3d4Mk1IUzhsMC9DcUZsOEho?=
 =?utf-8?B?NWZaQnlvajU1TExENFBNMTZ6bGY3MjVOOWsyQzVFVkxHcVNXOWFrVUpiMVJm?=
 =?utf-8?B?dzd0TVl6NWs3bHgwNXF1dlpWUDZBR1YwRUlXcHVWZjh1dDE1cGJkbitCWU5s?=
 =?utf-8?B?S3JMMHJwMjExT0hNcFRqVld5M3VwQWtaTy9iS2FIWXloUEU2OGJzWVRjZ3VZ?=
 =?utf-8?Q?MxlKEP+LHWTyNDZdPuPldWhiZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfde1ef4-413f-4e2f-1772-08dba85bd668
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:47:39.7384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOq7yyBzyheqMu++nzTdUwFPs1AiAKdstWeJKG9AYv0AGmMkeAKnq+X/f9/h0xg1gygXAvF2uf6pxQ92Wpy8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6988

On 29.08.2023 00:42, Stefano Stabellini wrote:
> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>> --- a/xen/common/efi/runtime.c
>> +++ b/xen/common/efi/runtime.c
>> @@ -6,6 +6,10 @@
>>  #include <xen/irq.h>
>>  #include <xen/time.h>
>>  
>> +#ifndef __COMMON_EFI_RUNTIME_C__
>> +#define __COMMON_EFI_RUNTIME_C__
> 
> Shouldn't this be at the top of the file?

Imo .c files shouldn't gain guards in the first place.

Jan

