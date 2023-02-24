Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30726A208A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 18:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501369.773079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVc1A-000447-Ds; Fri, 24 Feb 2023 17:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501369.773079; Fri, 24 Feb 2023 17:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVc1A-00041P-AX; Fri, 24 Feb 2023 17:38:00 +0000
Received: by outflank-mailman (input) for mailman id 501369;
 Fri, 24 Feb 2023 17:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVc18-00041J-E8
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 17:37:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8aa4288-b469-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 18:37:56 +0100 (CET)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 12:37:54 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6762.namprd03.prod.outlook.com (2603:10b6:a03:409::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 17:37:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 17:37:49 +0000
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
X-Inumbo-ID: f8aa4288-b469-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677260276;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+XSjsAk8jWSiDOjWQFPbWt5qqLOM0Vu3etiNJhXwjDQ=;
  b=Jwkj7n76tfw+XNRr1Bsb569ZwrHXrx2s4pbMQGjBHmKjDXrjdDIpyXBE
   FQkOhA3L+fg1UIYGikHavcPK7M0kVOpenLCc54cM7FSwjm3L8Ko76O8ve
   cvy3Qj1yt8WmrltucjMxrIvUMk7Uvt8gOzZCzTpPUEO0+N5YNeALWonHm
   Y=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 98448850
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UMLinK64QQTScKiohPHKAQxRtA/GchMFZxGqfqrLsTDasY5as4F+v
 mMcUW/TPv6JYmqnedEgaYy/9EkF65fdyoRiSFFs/C0zHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR4AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 fMqMwAQXCC5mbzu47KpZNlHvpkSM5y+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Nkkotj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdJOSO3oq6YCbFu77S8MDTIzeACB5sa91l/uUIl/C
 nU75X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMQ/XzAt2
 3eClsnlAjEpu7qQIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyLzflTrKR9dnVauq1Nv8HGiqx
 yjQ9HRhwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:JnVzbqh++V/SiL3wIhcYUjdta3BQXt4ji2hC6mlwRA09TyXPrb
 HLoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SOTUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebrN5fQRt7eY3OEYeexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98448850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8sx/MnLB62MgGgdr5iz5jUbFhcJLDn6AV+Uf1cuJ0vS12xwPUnVJDW9ARUyfaAAE6BQzWB0l/jmyX6/Px4atyd0GnuhHlGK9aVwCjKS/8l99oGqgCLyvfVeZengzOPYtTfce8Kh/4zjk0aiPGmFXQztcGzPnRDCb/oDnSg/gswfGWzJ704XYvK4Wwxz6X0Ky3XRmXNDOoPpFpiGlGz66d6tc6GIPABatvpCHG3HSkOgzY13uOgwTgtAQ3WY1YqjB6QaRPaKCGn2u9GHTEbzxq70ITjP61sqggGcqTx2io0ohaEtD3Dk2O2ZV4VDtlYuxiq7UNBJPFSqDVGfRlz2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9S+T7vv4d8pPJuPKqLn8ORHt1uiw2csfSfb5GMXDCY=;
 b=UiYrUR4Vbu3gaB7q2WKrRMTwNDtkDO9kJUqJRGO31I6NuMVLhKaaT2X4L7AUqZ6ao4wX8BmGRvjulv4/YhOPy/niNVUHFaPTQ9l6WMBlKJEfCganRXt2ry6oQxhvpppqwuzO6kf/sZ2cGw7x27kStWL+jlXKz08xQeOtHiwWWB2c7Vcjs8eXG9CFs0xGkQdxUSNX/YPJLaABm4tQK7SruXx9LiprAl+N73I4oPciFoWn/ZBdhwNmFZRYdOLGgYT7H2rb3mNVTZz5DSGZmJm11mGRm/lklT4FuoW8k9iyRG4YrUunWTdQIo1m4skskJ9oESas3yeWddRcqpZmCbA36w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9S+T7vv4d8pPJuPKqLn8ORHt1uiw2csfSfb5GMXDCY=;
 b=PuIvq8iaOuCd1RFvMkiNqb5gOAvM2ObVts3U7jLDfYMy1O0AKDDsdglBr9u5+QPtt0e5LFfGSqiIOJCym97qybufUBbnVTfMhLz2ycNEiL0qIGH79maZMUO6up0udUudqy+43NNFSvX4d8JdGGb9I8h1S2J+dXqjNxgBuFWokL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c8c99704-ee97-596e-d964-8071fb2b3f1c@citrix.com>
Date: Fri, 24 Feb 2023 17:37:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3 0/4] automation: Update containers to allow HTTPS
 access to xenbits
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230224172915.39675-1-anthony.perard@citrix.com>
In-Reply-To: <20230224172915.39675-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8b3f7f-9fe9-4a99-8816-08db168dd930
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zaQDfwNe/ICIw7rPmXzygpEB+W9VLwet+zBx7sF4Dq0H76YVpbDQ4IbygVvfbm2VxSQSTOuocD3lSFEQ8C3FKiVSMyRrqOYsY7Eb88/j9ruT4EkqYZT0L+8KcZDTtFOyAHRoPexS7+ytY0KfgRwSEUo1W9yz0/jeXVG3vb/Id0yDFiEXFYLyzR4ZH4y+1ALHqkXwW2aY7tK5uLuha72bw9zEMPJN+Uf1JEJy0qoKZ8vw08RvnOBWydme80Wo5U2yL2hjCVZ7W3P4hoWYVxTk7tiFEPaRLieYj944YBaonRffWKBHCOZ2X9Ku7ON3DxTebmWSzBXwCHH/Nto/Df7rgEXrqdV4EarHiiIo00nN3OZ96lZWhEb8sPB+/qX+UJ5FRsXCAEvw8JfU8BkBswYd5OHl1Ujh7tY1BJNAkcuNOBjN6R4Kn8yfLMfJgPvxlkVHkZZsNOZC1eE5FzNkW9iPMF1BCz0Giw6F8K99rIvG0dVfrp6NaIamCfx/zHesMFkDPzAu6MU5Ku44Me0njLd7WIADJaB7qYUwLlR8P4+iBBdqO0iEz17IeDDwEzxDd+QH/sZ7c2BT0Jem4z8fsnEu7L6y8dtjEHETViVPAkbuQnjLhkGxpKpxz79cbhga5EChzUF+HoxfMR33DxcB4mFOJ1PLFRG3UKesNQCK6tXYJyDx6CvUq7S50qGrQh3by+HzAbGdzAanIU4bIhZaDh9uGtTaClgEMaFXJAPzezsRONw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199018)(31686004)(966005)(26005)(6486002)(53546011)(186003)(8936002)(4326008)(66556008)(8676002)(66476007)(66946007)(83380400001)(6512007)(2616005)(6506007)(36756003)(6666004)(5660300002)(316002)(31696002)(478600001)(41300700001)(54906003)(86362001)(38100700002)(82960400001)(2906002)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDNxNERwUkZsMUY4bThKTVkyU3hUclNUUjY2eHNBajNhd1FhVW5GS29xTUtp?=
 =?utf-8?B?dkdub2o1M1RZUXdMeCtIQnlKMWxmaFM2bFFUeHJ2SGJmRGl3TlZJUkNWZEx6?=
 =?utf-8?B?dElEMUNNaGJQK3E3ZjQzQ1A5NjluWlFLaXdPWkx1elgvUmxjRGppRldQalQ5?=
 =?utf-8?B?ZS9uWGQ5UUNuK2tkWFdLbUVkUWIzTzhEcUtqRjJrTU91Zk42YUx1MGVjTVRO?=
 =?utf-8?B?c2J3bGdLWm00U1I2SGM5cVZGcVEzdkRmT3I1R1grbERRRDBZa3BLTW5XSUpN?=
 =?utf-8?B?ZW5vQ2ErZUpLTC9UbkRIS0hya0N3d0FUbitNWVVlekhQNld3eGdaNmgzbFJh?=
 =?utf-8?B?LzZKR1hhaUhwUDZJOHdGM3NnRUl2RjdPZWV3WVdhMzhBdGhVcC9IaHM1ajN4?=
 =?utf-8?B?MDFjaWVjb0NLS2cyNXIwU0N6eGpHWDFkTi9jbmN3ektLY1U2dDFPc0NTZmwx?=
 =?utf-8?B?eGIyYk9LOUd0M0ZoaXJnZVVXT3MvMTVJZmhnT3B3bC9Lb2toQUttY2EvdHIx?=
 =?utf-8?B?SzNvSTgvbk5XaGNsZU9Rb0p1amNrS0RaQ0R2SUZKOGN1UkdXSEVJVHBrWCs4?=
 =?utf-8?B?NzRDa0hZT0FBVW0yQVZqdTN5MEZXMTFUVjk5WWVHbHFnN25DdjcvMmZreldV?=
 =?utf-8?B?bFFwNzYrOGM5YnIrMXhoUjBDK1F1dVJVU0l2a243cHRiTjNpMURnUkhKdU85?=
 =?utf-8?B?RGZLMEE2bWdHWjRsS1RaME4vemdnWTI4OERzVGszSE15aXhSVmY0a3EyN1VZ?=
 =?utf-8?B?aldtVnhEY2lSN2E4K0RSS0ZQUVhwZ0VXVFd4dkRqWENQU3RGVHJMUTdtbXpH?=
 =?utf-8?B?NE5JOTRWRmJOakhMdVV0OWJiM284dHVpVmV2NnEvS2prZzROZVZwWFBDR2xr?=
 =?utf-8?B?MnJjM2xHcU84Y0hucUc0N2R2eWlGN3Zoa21TRmZOL2pwYVdIYzZlZHJ4V2Vp?=
 =?utf-8?B?S0hTeVNtQnN6MXJLK1Nhb0FJaFZ1T3BENTdjVDh5ZHF2V0JQR2F5Rjd0M05S?=
 =?utf-8?B?c1IzSGFsMWFWZUUxcm1jMUhFTDF1dXFqVjl1UUJSdko3K0QrTTdhRmVabzdu?=
 =?utf-8?B?MnVVSFJEZ1hMeW52Mk1VWWNoSFVoakhKdU15ZTRER3RlK2VuaW9FWnplYVZK?=
 =?utf-8?B?eDZ5QlB5Vy9qd2FZTzFVeHRONSt4ZTZPM0pQdVc1ZElJb0Z2RWJwMVNhRTU0?=
 =?utf-8?B?MjMxYXI2cGdpeVhUY1ltRmxQTU83bUZWeHlrNWhudWg1bG1tN1VGWFRDaTNN?=
 =?utf-8?B?YXdTUzZ3aWhmblk3ZGswT0Z0VUZZanlTU1oxL3VIVFUvZEhNWDlWMFJVNXMr?=
 =?utf-8?B?dDRqcFY3anVSYytUaWxHdHVIUVRhNk1xR2kxTEx4bXE1SW9RRFRhZnJmaThl?=
 =?utf-8?B?enJZaDZUbmkxTFJPVkorVVgydHF3aWdHdlJJWHNGRG5YQXhWaTZ5NFpabGJO?=
 =?utf-8?B?VUM3ZFpnYXpjWUxrOUk2YmV2MEFmdTNMWE1oWFBONm9pRHRnRWVEbWJBME9j?=
 =?utf-8?B?QlhmbThVRXZ2YmtiSkZaOFg0QXlRVmdhK1VaWFVZY3RYbWIvQ09uYUx1R3JN?=
 =?utf-8?B?YU1vaC9NKzZhWTllc0xhNzNiMndxMkJ3ZzFxOHNGNW5CTitGUzl6dUFNM2Vj?=
 =?utf-8?B?Tm5YQjBmbU5IaXBPMUwyK3ZLV3kwd01Sc1kyZWVsWnFtYmtSbHhGVGgra3Q0?=
 =?utf-8?B?ZEltNHBERndRU3pJWjMzODFndmpreWVtZGdXdE93bERaTldHWVRneEJ4WUxx?=
 =?utf-8?B?cWRZQmgzRWlCUE5PcXRnZjQzZHA0elI3TmpUQm1tN29RWmxYRWZBUzRvUVlq?=
 =?utf-8?B?UXJjSFVEYTN1V3pvdWlKb0hoVVdmeVJPTzd2MGJscXB4SndqTlpnZGs2eWdD?=
 =?utf-8?B?d0dwdWJkRm9EYkRLTWVoTkx5T1d1dHJ0c0FVemt6RU02T0Z0bWpLOExuOFlH?=
 =?utf-8?B?QWUvOE5FWkRRM09hTWY3Z3g4MUZIeDJjY2ExSFY5bndMODRGNU5pblFSTk1w?=
 =?utf-8?B?K09tdTVuZUt3ZTJyMmpIUUJZYXhkdHBhSlREdGEyaWxhNm9jbnRyKzVsR0Fz?=
 =?utf-8?B?WnFSM3NEK2pyeFROSVJUbm82d3IzWXBrUnhVRmdrMUVhQzhTLzlpNlJzN2dt?=
 =?utf-8?B?V0VsTng4dlNDTXMvSEo2Um1BREF4Vk5ZM003WWpjRlVwd3REbFJZZGVVNkN0?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zCvZxsQehAobuNkcUcUGS4jZqWnVgLyc92Qx8mYwnIlas35tZ0mHCEuvlZffLS7sHwL0diz5kgUMQiMc9A1zoEoAp9aIQLhbFHUBgdH7O7C2BjausMoj25CrMByOtqV43fRHZgRyMa/3ah5VhpIMTcBnlUp4l3D8RRqg7BtqWbXZxaoE40zClgW+MuIvxpUiB3SnilTKGG/3MlgpLKwjOfKLN3GhnKuDYiEwdeDM6uGrvjo5C9gtrUZQGxVLm7KlZrjKDO2uHSN5GiHg/aX61so7zoNO8e9YlMhhXHQCFihFENZEnLLr3lC0+7eCjDcmGay8F1gWkOAvCkyAp+hzJcn3FGcX+S28lSx66f06gE5r80QKXIHaOzchVcpdJFZuhne8BVEoTfzsxUYa9s29WOwt3sC25qtOCDm4OWeGoo9qVYtad5EzhfX7ZtmnVK+5rCP5WJkxI7eB9drktsbIYrZtuEV4YFXTDQNyQQdrc5KbwXYTabktDG+rfwfwMRg2SkmOmyA70ionIJH8C8jdMoUsGmn4rmHrXPowA1n0fixW99kv+h2L4Yz/6NTOmjxocIKqzSr3AtgcyX63NlEOhmwjDU1fuhC6WET/AsmTXLaEK4u4k/bkDqZUMPsdEQVYB3rcS9dTXCxVLnyYfVQg1pF69BRUXGGz4bP5+C7nYhoAfKImMQvRv8zeJcyFCoFpbP8VPD7cH3O/dz+BBVB+1HQRee0GgYDIweUZq+EV3FmSnjiwCVxOUrIr6svursDa/hRDDce7TRmi96zgk8+Jit2+tTjqOqqu3ho1rZDnc77tVDb4+KSKnnIKtCAVd15ad3mNSkUhT9n3dteLy3454w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8b3f7f-9fe9-4a99-8816-08db168dd930
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 17:37:49.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSsxkLvL6VvV60X2rZNfybL8DO2e7/7RvE4HLku4KtNFw5fJLM6w7vNmqR1+z1YXkbrpMimVUhM+jfe542iS0cWShLCUFqqlpzt+7DwoaRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6762

On 24/02/2023 5:29 pm, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-update-v3
>
> v3:
> - new patch which remove non-debug x86_32 builds
> - don't fix root certificates in jessie containers as those won't be used
>   anymore on the main branch.
>
> v2:
> - Remove CentOS 7.2
> - Remove Debian Jessie test, but update container recipe for the benefit of
>   older branches.
> - Fix CentOS 7 containner recipe to update all packages. (Fix missing update of
>   HTTPS root certificates)
>
> There is work in progress [1] to update urls in our repo to use https, but
> those https urls to xenbits don't work in our containers, due to an expired
> root certificate. So we need to update those containers.
>
> This series update the dockerfile where just rebuilding the container isn't enough.

LGTM.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll add this to my commit sweep, and rebuild the remaining containers.

But on that note, I noticed that the debian unstable container was 2.3G
when I last rebuilt it.  Which I think is obscenely large for what we're
doing.

Can we see about switching to slim/tiny container bases?

~Andrew

