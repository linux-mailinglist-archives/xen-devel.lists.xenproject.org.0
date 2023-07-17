Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B5755D9C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564279.881727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLJ6z-0007HT-TO; Mon, 17 Jul 2023 07:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564279.881727; Mon, 17 Jul 2023 07:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLJ6z-0007FB-Qb; Mon, 17 Jul 2023 07:57:41 +0000
Received: by outflank-mailman (input) for mailman id 564279;
 Mon, 17 Jul 2023 07:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLJ6z-0007F3-5C
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:57:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99fe8d72-2477-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:57:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7832.eurprd04.prod.outlook.com (2603:10a6:20b:2af::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 07:57:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:57:38 +0000
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
X-Inumbo-ID: 99fe8d72-2477-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuiEleEpenIq2mE1cYDKLd86rh3LK+7IF5E4lkVVDmTSvqB825pMVZ3JYz6qFxPTVF2Mts1v/jbcrFjlstX/pVFKlcj3PttzBt4M1MWG3ONt+at8LPFCxsgEGpoah8jriUupkIEFAGl99bC6SVtuz6qDPRdQV+2Zm7VXDyxckQ/HW/w2WMVnpDkhLB/yUbAedtXwFlXv568nSyoqLAAtK74e0Of3GrGYD3OBzk6WfCPRRel5OjNpa88u+w4mcr+i9tLtDthYv38eD7/NfaJmttRuEb1eDgMrhZQaj+l4tc52AWk9DQhEnIHcgJ4pHaLCcCv9mAhV4dcm0Tu2V6sUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRFbXK6GGnjVtDhTmcjg7SDhShIwH8xcmlWC7OG93sQ=;
 b=PIhXQqU/2HjY/vVjiLImSnfi+FspiB7mV1UOGO3yZ1EO8DSQGzUdyMxmvh0mjNihSmQ9pu2RsTH9ec5YcKLTcJTvF9YEhRdWXKC7KBrBnYY1eIn6gRzTct7m0n6uUWbxZLBHHAmqM0ur++aTZs8Zbf4pVImV7d0fTd4DsF1pney5iepdGbYct6od9wlUDnVzCK0J+4paqOJhcYRZ5jU2LAMeZRNSt1tJ8Hg4WWw+OhqpheAKLNt23g5tlAWX9XbRxucmXNEi06a9hPralQQ5X8dU7LM+EDVTph9LxT8z0UCX1aeG5dGLnSoztsz/dGCv+pu3VwVA3dnV39JgXyS7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRFbXK6GGnjVtDhTmcjg7SDhShIwH8xcmlWC7OG93sQ=;
 b=OdC6ctNdPtxju1aIHFV6lYms2uqoH3brqop33ZKcUueiepLQ+WpXuvJrme+bhG34VPncrYc6upZ4mnTW+pgiieL479PRpBh9/g8Uk+xRFslzq7aRB8eHlB0qHma+O1lBKfhynKFYe65QUOY15doEfq5Xk4P6/uBb94RGa8N1dgpBpowL4PXD4Pn1rt8acH7TaGSToE+YD+cANYS7JvcxKE6CLm/u3L5j04k7DFQzSHY4d8JCD4BySgxUwQhKYITdvyHM9goBA3aUYIn2lww1DclMZYYRMHNijfGBvs9VRjhWRK1ya2/Y3/Dlyrw4UBDBDPXkgyTtl72YJ8nAhO11mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28eba93a-3ffd-06b2-6fe8-f5c64ff79c9e@suse.com>
Date: Mon, 17 Jul 2023 09:57:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/ACPI: Remove acpi_get_pxm() entirely
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230714132024.3091309-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230714132024.3091309-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 79158142-b90d-423b-9bc4-08db869b7d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fRGMHVbKRfDOsE34LJU+ukOL36oZ4P62VFQ02oouO0vXfVZsu606qGi3aQGHYWVtL+iJHW4t8SiiN8Rk2Jjx7CWo4GxhkpDu2iKOc3FWm2utcE/y/H4wQXWz4XK3cgTORh7sogZWYsB6Of+BsOeNIUw9/NBiU0Bcp8kD1dU1bo14+zpVG+BBKhMMffIsmB+IMeYIdTR+N9r8qz0CmrfnjOkRdlkbItIa3wc+kykaTcQNVty/X1b5tZNqSSm4m6scDFiGQSGh91UIUuPJNslOgV28i46+JQHPUrMTB9Tpg5Mo/jnXzVoGgvdlQMdeYxAZ0TBasnlvmMVQ/K7XaHvBtAoC0ExhSA6mL8ujs132CrDSB5ex61D9gbLMeY/EK51ohWOBV44Uf39FAkW259M5lY0q/jILs+QAeHcJ8mBmurgbcKdXRvTsENgKC813RAJ28V8UN2n5JBGXM8LweCislJ9090a+D9RfbP1y+R1BpA96f9kN6Nh29T9S022AJVbCVBfzzSPvUM/0pgPy6oFyCM5vT3MjRRKvp4HDlxop/L9QZN3m+Z3CKDNktN84rjC+pAUWspbsOVyi2M163N9TXedOn/3uCNYMXs42DmlhsSBNGK4DPcXADRl65u3uTBLt6xDAo7V2okHJxWNTW9QVKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(6486002)(478600001)(54906003)(186003)(6506007)(53546011)(26005)(6512007)(2906002)(4744005)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(5660300002)(8936002)(8676002)(38100700002)(86362001)(31696002)(36756003)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDZFenBsVklYemJqenAzbnB6VUJWRG03SVBIWHQvdi9xeWxHTCtlWUZrZUln?=
 =?utf-8?B?cjlKN1JWT2VpUDlHM0Z3V0d1WUtRVHFuamN2OEo1VjJQeFBmeWt6NnQ0QWJD?=
 =?utf-8?B?WHpoT1BLbDlUbm9HNW45Q2V3SFYyMWZ4bFlEYWFFM29PK0srZm55dEYrSGdR?=
 =?utf-8?B?eExncERUcm9SanJMMDRNK2RhZXBWNjBrYWVHTFJVMjFqbC9Pc0ZGcVRZNjN1?=
 =?utf-8?B?cWlhT1RhSzIrVzgwMVZRc2VHZG9KclFnRlZUV3UyMUZ3enI4UHI3SUF2NDRT?=
 =?utf-8?B?RjUxVjdRSk1Fa3hZaVJvQnljdUU5VW5IUG0vSnJtMDI5TjI3cHdJWHIzMkxm?=
 =?utf-8?B?UmE1eU5TdUhtV25PaTJkRGNBYW5YMG9kQUU0YkdMc1dCb1I1cFJ3c0pOTS8w?=
 =?utf-8?B?T1lpUkxOVXVQTUVJcE8xRlBNSlhWZjVNNnhlQlF1MkRNMzlKdyt3ekNCMk10?=
 =?utf-8?B?V01xeUxIai9jN2RRMzdQS0JsSmlVdkM0dzBDM01vblJNSlVnN1RwUmJ2ekpG?=
 =?utf-8?B?S1FaNko3RGpQRWlSYzBSQ2NOTmdjekZWN21OU0JpbDJ3UnpmZ2J4OWk5d0pH?=
 =?utf-8?B?SklsSzNic2NEa3Q1MjI4THA2dnhCUlRza3ZaeDlmalNEaXNsQk41RkQyMmE0?=
 =?utf-8?B?NDdzQ0NpYVptYVQvWnB6MlRjYkY4MUZnZmt1WXhRQXFDdW9mQjFHVlB6dVB6?=
 =?utf-8?B?UVFnZ1dPLzRCTlpxalExeW8wMTZSSVVQREdjWjJKQXc0cThJdVZnWmhPUUFF?=
 =?utf-8?B?SVBBdGZvNXFTMVlLWWt2SStWYkQ3b3RURDcyQjlqVGt1S1kyVkdXMU1QSGJH?=
 =?utf-8?B?SFJmajkxQVQ3YmZOZmI0QzdlLzEyNzB6ckRtTGxoZjlNWWQrSUdMcUpIL25O?=
 =?utf-8?B?a2wvcVRJN1IrczJVb1hPWnpJVHU4S0Q1Z0hWQlc0TE5zRjZCWmQ2eGMySTdj?=
 =?utf-8?B?UG01ME1oMDR2aVUwRGdoSWtKb28wRS9QbE5USmFGQ3d6RXlzbHM3QTJxWjBP?=
 =?utf-8?B?UmVyRjhNWEtKQkZrR29rUm95QVJjek5hbjYzU1F2T3oxUkNBL2NxUnpsUTlI?=
 =?utf-8?B?NG83YVo4QVZLditqU0tXd2ZjVi9OaS9pd2dOZ25NbFhQenlqcWZKNE1wZzFi?=
 =?utf-8?B?VHp4ZGkvMXM0Si92WTZTQmp2Ri9OYWtTN3NRU0ZGajErMzNxcVZkNWdOaC9P?=
 =?utf-8?B?UnRsZmpReVJoU0FhVlp5SFBsdjB0dFZCbyszR1Z4anh3Q3VTd3R5dkNObHZH?=
 =?utf-8?B?L3BISzRuRnpWUmdmN0k4NFJmZ01LaEg2elBUT2szbU1JeUFvVVJnQ2R0YkpZ?=
 =?utf-8?B?aVNpQmdVV3V5TzU2R0xqWGhVZDhxbmJBcTFUSk8wVW9NbjdQWUsyLzdCdVJS?=
 =?utf-8?B?RDJ6UTlTZForVkFHK2JXSDFNSzlZUVFmby9tdzRST0xzRlJYZTg0ZFNiOWRE?=
 =?utf-8?B?Y3RYUVpzaWl1U1BldDU4ZDZJYktVRWtURmxweHRzVVlOckcwdFR3TGtaOGoy?=
 =?utf-8?B?Um8rNEZWUlFSZ0UrSDlGZE5XWk11ZlJYcXdGbHZJUmZZMWxQUGJKUENiblR6?=
 =?utf-8?B?L0FUZHhzcTBpS0NJeG0yOHR2T1BlNXlyR003YmphdDl1TFBvQW1NSG9QaUcx?=
 =?utf-8?B?Njl2M2NZYUhzNEx3c2NTM3ZaVzg5SEJqMUJ4SjVYLzR3cVFkUEROQVA2UTdC?=
 =?utf-8?B?WmRnZFRncFZ6NGpmYzZveEdPWnpjYmJTdGQyTlFiTi9zMEJkVjU4RlVFRnVr?=
 =?utf-8?B?ZmtqTzFyUmtHY21RQTBmRWcvTGhaakJlbERCV3YvcWFOSGVRK29DVmdGK0Vp?=
 =?utf-8?B?ZzV0ZGpKTVNGVHNCd3VKbXFJS3RVMXZWUGJmWTdNdm1TM2g1V1Zhb2kzQ1Fq?=
 =?utf-8?B?dHJkbVZDcno5VmhocCsraDEyZVkrUE5KeDkvcW9vbzJvTlJtNE84Tm9DVkZi?=
 =?utf-8?B?Um1odDdLUEN6ZktrdkZRZlYzWWkrcVlHSUJsbU9zd3VCY0lzY1R3TG9aa1k5?=
 =?utf-8?B?K3R4L0V4dkd0TTNrTDM1SXN2dE9hL2JLR1lUa2syREdxaVVYZ0VUUDByeFZZ?=
 =?utf-8?B?cFlWNkpqVWE2czNnaGlSUS9CQ1E4dnJGd1ZvUjBPMzlxa2pQMmJQaUtoaUZX?=
 =?utf-8?Q?0BbEMwQdJ8usdrusfQt5FESe1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79158142-b90d-423b-9bc4-08db869b7d38
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:57:38.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yc74NwvAw/NQOh1goRvInTWrX1Xg83t3/XiBP1BzXvoprjyAj7WhHutPeMbN6bEj25sradl1x/4z7388A5M2gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7832

On 14.07.2023 15:20, Andrew Cooper wrote:
> There are no callers, and the non-stub implementation is #if 0'd out, with the
> internal trying to perform an AML invocation.
> 
> There's no plausible way that code is getting un-#if 0'd, so drop it.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



