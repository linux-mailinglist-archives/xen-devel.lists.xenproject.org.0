Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A66DFAD3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 18:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520262.807659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmcz3-0006sj-3j; Wed, 12 Apr 2023 16:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520262.807659; Wed, 12 Apr 2023 16:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmcz3-0006qh-0o; Wed, 12 Apr 2023 16:06:09 +0000
Received: by outflank-mailman (input) for mailman id 520262;
 Wed, 12 Apr 2023 16:06:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPvI=AD=citrix.com=prvs=459801679=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmcz1-0006qb-Ui
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 16:06:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebeb381b-d94b-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 18:06:04 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2023 12:06:00 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6578.namprd03.prod.outlook.com (2603:10b6:806:1c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 16:05:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 16:05:57 +0000
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
X-Inumbo-ID: ebeb381b-d94b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681315564;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3nmMro4PyJ8UWY3AplUrckhKfWxJt0OMYrLX6n8kRDo=;
  b=Tx6w8H4mMYs26HOioEDAqcJcCd3hl88QHxooP1h2k+b67LNJG+6Sn/CY
   PQNeo/ibKbl0BfR6SGV7ZDOPfSYU3rYSgvW78dGQ0J2nKQeIdfSXABvH/
   s3D16jseiTDm+6cG5AdKVcxn9VzK5NGNtdBROSCOg8RbBV9uv0oyqMilr
   M=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 105166298
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KRh5CaCALf/TVhVW//7iw5YqxClBgxIJ4kV8jS/XYbTApGh00zEEz
 jAZXGvVP/6NY2ahL911O9i/9RsEvsTdnNJmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9B5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/9gpGF9J3
 9YicDFKaz6HnsuTwrapRbw57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzK7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwHqlBthDRNVU8NY7mGSdllMrKyYORFiDhP/62m20CuJmf
 hl8Fi0G6PJaGFaQZsL5Vha7iGSNtBQdR5xUDoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRtv6eSUmm17aqPoHW5Pi19BW0fYS4JSyMV7t+lp5s85jrCQsliFuipicfyGhn7x
 zeXoG41gLB7sCIQ/6Cy/FSCjzfyoJHMF1Yx/l+OBjjj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:h6+ThqpjWLc3bcIlEMr7IDIaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3A8JBYEGk4BDy3wn7E8cNWsDC39LjXOXjjkm7uJGW?=
 =?us-ascii?q?SMz5oD7i7TUa53aFggcU7zg=3D=3D?=
X-Talos-MUID: 9a23:2NM0MwVljuEhOAHq/G70vT8yC/9L2Ly/C3gol9ZWmMPVBRUlbg==
X-IronPort-AV: E=Sophos;i="5.98,339,1673931600"; 
   d="scan'208";a="105166298"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQVBIj64aHWA7MEPIbA8jS4FvaFS+BznGRXbhDcku+/DwzRFvHMHkzpiOobnulYiKNc8tx6W5Q9m7VhFy/5ULZlNlANZAfVdjJlZ7DASsdRtc4PRdlniAiJeGB69HS2I/FTz2GzFtr2Vd9mA8OAdzWI/Gd8KBfEKB6Okfo4ZJtsHvxn3yfrSy2D4+3tRWNLho0WX4nQW6sMjT4WNCCXat79Z/VIJ9qU6AKKFpS1Dh4DvzPezwt7MyRWe7m4KBkqHXrfgpfrOWpznA0WeOJQZwopKB1cBDZJ+d4UDbRn21vZb+hjZZzGJ20zlL4fYCW571u1dEsg/anZbd1YdD5TSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nmMro4PyJ8UWY3AplUrckhKfWxJt0OMYrLX6n8kRDo=;
 b=ATc1Au19UECefjVk+BDkfDN+pjalYbO5VMu+L0vibi0JItc3VHwNKLfvQJQjWE0O7v0m5AuHoUrjLtUPOkDNsdk0kwIDv7quW21q8JgiBTUz2YoQUNrH1PPyAsw7keQ4tHuQnhyhWX+BplcHuMvuAM2xxWpaWkmhT/Gb6NNbf/vemc/vfrpthqJOjpf+mFTG5AOzBzUWwkt8h0ziQqu5qb2Hk7lIUAfei7hDo8CEw2v4TsMMegoJqTEloZZFZi3GLkcUkE8nAeUbfNeUuvuBHLAVmR2D7Iqsj11WQBC61MkxJf1klJ8WN6Rhq8FwJMAcqLe1Ikng4qWWcrkKuKHbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nmMro4PyJ8UWY3AplUrckhKfWxJt0OMYrLX6n8kRDo=;
 b=qTaXcxgyXbX3JMdS+juZaD+snZ58HHFoq3BnQOh8beBNP7yzq4wnPemARkWed+Nwj+V9N8t1kvIEYihhcqhswSzVA490FZLRfTIqiMytwpMC1+Mo5nsxrEIPehUxryeSVamww9peBjAjZ/xCwfCGiyN9N63bFAL2T9R7QRfURaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
Date: Wed, 12 Apr 2023 17:05:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
Content-Language: en-GB
To: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: a70278b2-05f6-459b-83d4-08db3b6fcc82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zVUJ6KDQRHY+5j6bdl52xMAtIHGKxOs4qKOLRW1ZM/4RKhB7GE2A4KIvHAHM0vul66tXHZRwzl1zp+FR/1iuiYXRMvRSp3jarogX/gzlia9X/DdifoAtnnFXK87sYrYogi2O7d+mhZndIQPdgx5iuYxsA4akgqd/hdv5ggGu39bPyfYt4pjHrab+FKqItveXcfzv29EAw0oVSR8mWrKoLH88zBmIFw8S+D4xDLubIUo+ekaNkobnu9BnQGIU+ntIsu9B/XibEwe9mV/1rSm+ma3XB9wAH3qF0B/9N82vk+OdJCCaCeP5X9ieukPimD501k1DdO3m9L3qI4kXa+yvhQn31SNFmc+eQ6pR08qJKWs8nT7Ae/evTC5FKbiw9GGPqaOITSvcBI70F8Qdi9SAgDFB7heYhUojHTiSEb9CNnFEynUvDh0uPAcBoluz9EibEonCiWVfeHWsRwGlwADuCKfPrp77iVvSszC9sFB1h6wnGI37hmp0iRsD6dxiyAob10iDFMc3Jd9HklK06pv9lC2PWNCG/SVq4BZeLMGhk8Yg5/9JkkykRUeVD1KO0IQUnA+zVnUFI2tZZ4fSfChnkHnKdGpIgmXXv1oJR9isNXHdh0lKd3t3uYFpuuTzqzGKBekmW6crFIZrwGL7b7zHhTRqRrcWW0MDLCl7bzTsUdR+VNcGxMMOJwkYoESkHFJn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(316002)(41300700001)(6486002)(6512007)(26005)(53546011)(6506007)(38100700002)(6666004)(86362001)(186003)(966005)(31696002)(2616005)(36756003)(66476007)(82960400001)(83380400001)(66556008)(66946007)(4326008)(54906003)(478600001)(8676002)(8936002)(5660300002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TiswWDJjZ2tWNVNDbnlOdThBN0ZoWXdnemh4clo5SWc3QnhjSmpTbEprK05l?=
 =?utf-8?B?YVpyWnEvbFQrY0I3VHdQY3hBSng0eEl5NS8xVXlpVkZZMklrcktEU1c3Z0Nj?=
 =?utf-8?B?YktETnJDZnNSak5rZVhtN2toVEYzNkhoU1JEWmNiZW1yR2VZVGZyQ1QxdlUv?=
 =?utf-8?B?MmxUWEhlSkpqTnNxbVN1eFhCWXRHK3NRR1pueVQ1OFUrMzVuMmpLWllsOHhx?=
 =?utf-8?B?aGUxYU5uSVNPamNTSHVIcXQ0VDRkdEtIV05udWlmR0RRcVMxSzhIRTY4VTdJ?=
 =?utf-8?B?aXBPZzZHeTA0SWRmTW1WS1B4akp2WStHZW41c3d3a1RSOE1walBVTU5naXJa?=
 =?utf-8?B?YUZlajNOb0FlVU5MdmxxWkJZZXF5dGNvYTVFeUc0THRnYUdDekVUN2M1dDVh?=
 =?utf-8?B?Rm5KNjVKaGIvd1V6ZjNvaXpYNHllMkkzaURmWmUvRjdUNWJ2dU1GcXZJdVkz?=
 =?utf-8?B?bjlFMjdsNm1qRFJwd29LWXUrUmxmaVJWVkJVdXJqRzFwYkVWSERxeWNZMzBP?=
 =?utf-8?B?QUVJaFUxSkwvWGtPVTZzNVRuMjJTaitmYU1uMjhsTE5ySFVEbk1GcmY0SEli?=
 =?utf-8?B?eVRPaTZHNk9qRWVPREVCSU53MkR2VGhBZmRiTENJZkRNcFROdVlmcjd4QkhC?=
 =?utf-8?B?TGlkNE5wODBRTjJMSEpybXllUWtrdldha3U2LzAwbFpaaE9peDFwZXBWZ1Fm?=
 =?utf-8?B?RVJKWUZtc05jbWRmYUgrd0l2Q0M3Q1NNcmxHRVF6TDVDbk04OUVLekc3SDVY?=
 =?utf-8?B?L2xMMWlvQWZHU3pDb0ZHRFhsZTc3ODFycURTb29nYmQxa01WclhOM1doLzR1?=
 =?utf-8?B?TEdnRmxzbFFzNHU3MXdFVnE5Q24yTUV6SDJKaW0yZ3BTZTc2L3UwYlFWYy9F?=
 =?utf-8?B?QUpCU08zMnVzRlo1dkp2cWhMVnNXcjRyZEIyaXQvTTdJbFZ0U2Z5dkNURzBQ?=
 =?utf-8?B?MXZ1aW0rZGJqNVE4N2Jaa3VnL20zenJzak1GaExCN3I5UVZYMXRuWHVUK3Zl?=
 =?utf-8?B?dmRBQXZGVnBGcHQ4dWlNSytNYVlyUis0Tkh3SzhLRkt1bUlMWWUyM0JGQ3VV?=
 =?utf-8?B?TlFUMXhQdllmSVlGTXFNOEJOc2tFYW1FVE5kc2d6Vml4RVA4TGNhYy9TaGNn?=
 =?utf-8?B?Skpod3BLZVpid0NiMHFsZHFEbnA5ZjZrK0xOSnhLMEk4NHRIN21tM3g0ZU9J?=
 =?utf-8?B?QkQ0cjh6OFFXNlhsU21mUWZWQmtUbUc3OU8vS0Fvb0cwYWtJc3FlNWRzdy81?=
 =?utf-8?B?UXVwL2FoQ1AvTTIxcnQ2WS9vTjJUZ2dUQmN1eHoxL2YwTjFScFZtNmtMVzBv?=
 =?utf-8?B?RkhmNlBXeWczUm1ZQVEwbTNHd0dOTTFoRTdZWG1RYUF0WDIxTVVhMjkyZW5v?=
 =?utf-8?B?dWlkTmtXS3dHRXM2YTdhVGZpMkI0N2hhdHlyUndHVHFtQ3gwV0ZiR2lqV3FP?=
 =?utf-8?B?dkF0WTBPOTlRWExhcEhRem83YVJ3TDFaYlNBcStzZEYvaExTQk5Jc3hnU2d4?=
 =?utf-8?B?OVZyWXE3cllMSFhQQ3RNYzJSbDZGZEhnYkZ0emVRNmZLL3hvSDQvbmg4NU5D?=
 =?utf-8?B?Q0tscXYwWTEvNDJaUHBveVVWM3dsek1QRHVJRHEvejczSHBPLy9yQXNnYnpv?=
 =?utf-8?B?UWJSOHhkVzdhaEQwSGgvdFdrbkx1UVI2VFhybkpITzNOTGloWW92NnVlTzht?=
 =?utf-8?B?OUhHNmFnOWxDNk51ZCtxYzZwZ0JtV2s4cXpjRTRXK2d2ZDdjSVM4OEJ0T3Yx?=
 =?utf-8?B?ZmFFVDdFNWR1ZFhWWTNtWW5jYVZoOXpVNXpJcjFpaUw2d0FRcm5TMkxaZXcz?=
 =?utf-8?B?UldzMWFDLzRmaHFwL2U0NzB6ejVNandTRk5PQU5ab3lMdGpCckpSS2hoUHVH?=
 =?utf-8?B?QlRYUjBxU1NCT2pmaHVlNnFMRSttdFVzUHcxVlRxOXpkbGFXOFVqU2JPdVBq?=
 =?utf-8?B?M0NlUUZzaGNZS1ptMWtyeCtvUjdCVEFZNmVLUlVrZEtNZWpPbko0SzRQUUV5?=
 =?utf-8?B?L2RCRjVmVVQ1bUZYV1FNbVI1MEw4b0dIeEdsdENyZHdTdnBGWmVKVUN5b0VG?=
 =?utf-8?B?bG5ZYkE1eUYrV3c3cm0vdDNZSG9ZakY4VDJlejFLRW0rQTlTenpia2tvSHpt?=
 =?utf-8?B?NTk3MWpxaEFzUlpjdmxobmFIaVpQdUtHbGYxajZqUWd4MVZrNklod1E2N1Nt?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RnBonBBgzMDqYMRnYvZ0WQIkI/TQKDNvUc7oYaNSWmaSZOBVjFaywTSkK+qunOHDqGpN0YDmTZn3sb9k/xytO1uBeZNREcBh7liJPsZyydLZAW3KRqR/nGLM1lrEjlmtiu4TT7lbuaCv4Ija1/JBeXqGNKSfXb9wXs1Wj2RtANovENPlJi46p/X8yNbaNYGb9Y26cokWKP2aHa3aNBihLZwDSV9zXtD5eMQaVWssRu0c7GoBEtzeOrvgPN80cZHE/VPjQPTjzIez1guzim6gg5sW/xYn66dUsJQCoOLi5gF1UTEfJ39NCli21KyQwJwJm17gpk+K1u4KJAzkwnnChTdtnVtgDZsai2WoMbmjvwbixITfwyPd+51cmwcRlaAiMx/x8mjOj7MNVrHFOjC332U2vGOqso3kMyX7yZ7xACOG/HrsBJNa4xUMJz3k3O9MKnWtZIksADpwpx0lPWEUQEdlT/mKKJ3XDytW/6aH0UEWDlzUb8WDmegM6DbFuvCCXZdcieRieD82twBFIQaQEStyh8YnjUrfzg2x6XO1QBQqihZ9WdNLzuW1XKTGFm17dQuyVHd4netlKK3L1n89ZB7TWFgA+K4nL32pUti4kppShhDxwD11KFXIun4olz2GGrSU7uTvEvjGfNPYlMEADjiifycl0A2LJqcBqhtQTUrWFSfZuCAA4xf1Fa96N0/C3SMqSJ1atVfL1TGJJ0hPGxjmEU4CV2+9m9l7t78toq7P78DyHpnkWZyiiqo8TYf+1OWppgWULQEPgswj/f8rZopW1JwrggIn1DABcKP6giFx0/+zmwjbpWpH1dPN1d75eyBYGDnf9Ff77tB9A4iQGaW3coFBSMtH8ajl5/6ZPLFwiGuCWgNCrKA+LHeFonGD
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70278b2-05f6-459b-83d4-08db3b6fcc82
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 16:05:56.9254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYRqNDyvry0ajFYRGGJkiNGd1fBfyDKInasa2Ty5eiEZOLKM4Vd/Cnm/RVmYmxS6GKyuK8VAZCsQAe0OidUV6lFrZBw9KTf7EyQ0pOxGL88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6578

On 12/04/2023 4:48 pm, zithro wrote:
> Hi all,
>
> this is what I have in "xenstored-access.log" in dom0 :
>
> [20230411T23:48:27.917Z]  D5         write     control/feature-balloon 1
> [20230411T23:48:27.917Z]  D5         error     EACCES
> [20230411T23:48:27.923Z]  D5         write     data/updated Wed Apr 12
> 01:48:27 CEST 2023
>
> It happens once each minute, on two different hosts, both amd64.
> (both hosts using the same config, only the hardware differs).
>
> I tried looking up for a similar bug, but didn't find one.
> I apologize in advance if this error is known, and if this is not the
> place to report this !
>
> -----------------------
> Technical infos
> -----------------------
> dom0s:
>
> Debian stable, kernel 5.10.0-21-amd64
> Xen 4.14.5
> xl.conf has : autoballoon="0"
> GRUB_CMDLINE_XEN="dom0_mem=2048M,max:2048M dom0_max_vcpus=4
> dom0_vcpus_pin loglvl=all guest_loglvl=all ucode=scan iommu=verbose"
> Running "xenstore-ls -f -p | grep balloon" returns no result
> -----------------------
> domUs (D5 in above logs):
>
> HVM TrueNAS Core, based on FreeBSD 13.1-RELEASE-p7
> (it happened also on previous FreeBSD realeases, but don't remember when
> it started, logs have been filled and rotated).
> In cfg files, using either the same value for "memory" and "maxmem" or
> only setting "memory" give the same results.
>
> What's strange is that I have xen* commands in FreeNAS :
>
> xen-detect        xenstore-control  xenstore-ls       xenstore-watch
> xenstore          xenstore-exists   xenstore-read     xenstore-write
> xenstore-chmod    xenstore-list     xenstore-rm
>
> root@truenas[~]# xenstore-ls
> xenstore-ls: xs_directory (/): Permission denied
>
> root@truenas[~]# ps aux
> root   [...]     0:36.98 [xenwatch]
> root   [...]     0:01.01 [xenstore_rcv]
> root   [...]     0:00.00 [balloon]
> root   [...]     0:01.74 /bin/sh /usr/local/sbin/xe-daemon -p
> /var/run/xe-daemon.pid
> [...]
>
> The xe-daemon looks strange also, I don't use XenServer/XCP-ng, only
> "raw" Xen.
> And this script which hand
>
> I also use PFsense domUs (based on FreeBSD), but they don't exhibit
> this behaviour (ie. no xenstore access error in dom0, no xen*
> commands in domU).
>
> So is this a problem with TrueNAS rather than with Xen ?
> If so I apologize for wasting your time.
>
> Thanks, have a nice day !
> (and as it's my first post here: thx for Xen, it rocks)

Hello,

(Leaving the full report intact so CC'd people can see it whole)

Yes, it is TrueNAS trying to re-write that file every minute.  It
appears that TrueNAS has inherited (from debian?) a rather old version
of https://github.com/xenserver/xe-guest-utilities/

https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html doesn't
list feature-balloon as a permitted feature node.

But, I suspect that it used to be the case that guests could write
arbitrary feature nodes, and I suspect we tightened the permissions in a
security fix to reduce worst-case memory usage of xenstored.

I suspect the best (/least bad) thing to do here is formally introduce
feature-ballon as a permitted node, and have the toolstack initialise it
to "" like we do with all other nodes, after which TrueNAS ought to be
able to set it successfully and not touch it a second time.

~Andrew

