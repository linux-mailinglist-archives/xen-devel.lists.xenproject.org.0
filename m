Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A07B9C1E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 11:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612918.953097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKbU-0006Tn-Dw; Thu, 05 Oct 2023 09:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612918.953097; Thu, 05 Oct 2023 09:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKbU-0006QX-Ay; Thu, 05 Oct 2023 09:25:08 +0000
Received: by outflank-mailman (input) for mailman id 612918;
 Thu, 05 Oct 2023 09:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhCt=FT=citrix.com=prvs=635b598b3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qoKbT-0006QP-34
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 09:25:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f8759e5-6361-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 11:25:04 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2023 05:25:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6501.namprd03.prod.outlook.com (2603:10b6:a03:386::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Thu, 5 Oct
 2023 09:24:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Thu, 5 Oct 2023
 09:24:58 +0000
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
X-Inumbo-ID: 0f8759e5-6361-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696497903;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qZoYmhJgKJlmLOUtAXKL1UZD7rIA5qfyp690tsrv5v0=;
  b=HK+E1DUWjMbxsReuL6MgP0nJ9li3PCnwEn5ol5oYCpfthiTP/PTMzVqL
   w0Ew9QT3dKG2yIclzHhb6vkOenabfzIG64N5h427vkDphvGz+smbPcLAp
   GiFd0Woh1sZlQnL8E/i+l3hfoPufDRe+28uHs1RMMJjIyPO0fmX6h0pD4
   U=;
X-CSE-ConnectionGUID: Gs0Ce7VVSW24UFLu3hk/GQ==
X-CSE-MsgGUID: BvealOTRRXWmnsI/jbDv3A==
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 124705149
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:5KcAequSOZ9UNumYiBRlAHSelufnVMBfMUV32f8akzHdYApBsoF/q
 tZmKT3SaP/YYWSjfdtwatu3/EsAu8LXnNJmSFNq+yw9HigQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeGyiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBytVRR3cudyN/+jnd8dIm58jL47EBdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4C9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt5NTODhqq8CbFu77HIeARkxaWGBkca8jFWfHNBVB
 1JP0397xUQ13AnxJjXnZDWju2KNtBMYX9tWEsU55RuLx66S5ByWbkAGUzpAZdoOpMIwAzsw2
 TehktPkAH9/vbu9TC+FsLyTqFuaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cRn6z
 iqWtiE4i/MWhNQSyqSg1VndhnSnoZ2hZjAy4gLbT2e09DRTbYSuZ5GrwVXD5PMGJ4GcJnGGu
 HUHgMGY4Po5EYCWlCeNTeMOG5mk//+AdjbbhDZS84IJ8j2s/zuveN5W6TQnfkNxaJ9bI3nuf
 VPZvh5X6NlLJny2YKRrYoW3TcM30aznEtejXffRBjZTXqVMmMa81HkGTSatM6rFySDATYlX1
 U+nTPuR
IronPort-HdrOrdr: A9a23:+0oetq/7uAA6kReqOFhuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-Talos-CUID: 9a23:iwzDVm5JPQBs+UtKptss21VMMc16TEPm8y2MHmGcFD1pS/q6cArF
X-Talos-MUID: 9a23:j3aREAaXWtErLeBTnSHhjTVFCP1S05urDlss1pcMl9ffHHkl
X-IronPort-AV: E=Sophos;i="6.03,202,1694750400"; 
   d="scan'208";a="124705149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P35qldkb8OVcW4Csg5MgjbGBUEVCZAE6591ZqMwKtGWJ7Ga4u/rVx3Al4zCF0fG0WYwk73bGo/K/b+tJ18IJmtDLZIEBPpoRYKh9+rRzNw5h21RClnRwci22s1s8ibgEE372DC7NYyL0taBpTIB3BzTPJL0sKhumTB+6LyIO1QM1dBltCUnLk7Z88Z3JxMYg7rs9RmwqbEJDiBr5q4poEvQdMC7RM7/nGPIA+egyYEceON6oPI/EPN1qDy1hYsl4dtDAz2mxCCitK7JVGxYCry9vWzJqdmt3q+FQkN+o1T4jFttB2McelrSAP4gakypxKGTbCsInqQwUaKV0oHzoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IY/ZP+1A8yLjOjA0HPlR3ZxteuI6jDosQ8al0+KNN3E=;
 b=E0WRvQcJCMcBv9AQX0o2KjDWU047Ulnhw7s04ibO5ljF3WtKCSmG0KQXrA+bbCh4mA4RzyQ3UNXfKT+oCB/vSKosJBn4WJ88f20t2JgfKrnad+YzfVZ/eNXy7307SQdkTb++tskOGIODiYNHqPhLjWfqZa/mnbVGo2Y4m2qTd9Ey9RKz0jBMjX7kBFbV/fZAv8HnRE7+Ko33p4oLFWQIE5XFMb286RPIUxJa8QqMFrHgwg8ZZg+07qvMrahjyqy4g8RGVpnswyAkLKgYxuAxns8XY54Wzwj4Scc5D8TOeYYjOD5yg5Uq61kUNO4I34X7G1bfAhoeAU5ePDYG9oyeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IY/ZP+1A8yLjOjA0HPlR3ZxteuI6jDosQ8al0+KNN3E=;
 b=aKw8swd+HUPpj6WdRldWpmqa1r8IOLaOBJLWfYMaRzKQGdcOhU6/4iOtZvfc7NU3IbqV8XPZRNqtjzL3Po44shrbWL3spqVIfisZH/Hfzgrp0zAPKt2ClZYwNcf7fC6lP+zd6GuKiLu5axI29KZdm7u5KVDMcfhhYDnKrfpz7sA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Oct 2023 11:24:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Elliott Mitchell <ehem+xen@m5p.com>,
	xen-devel@lists.xenproject.org,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR6A5LP1FKFAgJRv@MacBookPdeRoger>
References: <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
 <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
 <alpine.DEB.2.22.394.2310041509170.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310041509170.2348112@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ec6d85-aa0f-430b-fe16-08dbc584f176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xwYT4I58zOV6rwx8AssGBoOAzLCr5rbo6LCXYkt2zF0UWmbrnPTsEkK4YjKgNTTfeMwwk4lqq7vxyKg3KxpddgEAkNAFQdwLzroq2jIb6QXzMmyDyjeNCM+R4pdRnUACnoiur4tl/2mXeozBlR6gLwQ08BgZXSzmpL8Rnv/BnYT+4kzrLkM68PfDBIH8ciYsKkcSwd7NPnnzI1WEPs17B5/3lJwMhZoMT3R+1JWVqdvEv9nLgwTAmyhtgAVebX3oRrWKyrSpoDNqcSj1pyWEF3MMC7v2+1+uERWgzYmkR4mv6/1n9CM60WVjMmA6Ms5ktkai4elrNl93O5wm65AWkKSrdIgvpSGDOuMQwtMZYZ970iS3JRAf/OwiZfvOg+LX3+0koxBXe8w8KNQEqw5yNmWjEAeWusBbo/35vMyo3Q4oLrjqVegIkd3tQ177K95hMZ2eTmWolBrOjFPjRTNKYAli12jfvd4O4UXjXIc7gyYnPG2nk5eH/Wn74VfdLh0QKLZxXjIylMTGYrpx5m9lez+EH2sBBJfKG2xf1qBy0A5WXYLAg3iEF9T7ccXjw1pv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(5660300002)(8676002)(2906002)(4326008)(8936002)(41300700001)(66899024)(66556008)(316002)(6916009)(66946007)(66476007)(54906003)(33716001)(26005)(6666004)(85182001)(6506007)(6512007)(9686003)(82960400001)(38100700002)(83380400001)(86362001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VndVTnFLdlpVejRaOVhJWU1VK0JJTHVzbXJIUnA3V2RTa1ZrekhBd29sWU44?=
 =?utf-8?B?WGVMK29qd1FFTDZnakZyQnQ2eUdYeXBqbWJZUGJycFpqVk1xWU5yaHRCUlRC?=
 =?utf-8?B?K3Rzd2RuVUVwS3ZQbmNCK2pINmxrN255d1dRWnFMTk9rRXFkeVQyUlVRMlNq?=
 =?utf-8?B?QWswTzVmbzFqVzZrTGtnVk93eDR2NkF3R1E0UzdmNXdWOXB4RVR4cjA2VTBM?=
 =?utf-8?B?czlDZTRiTDE2U252QnQvTXZkOHU2aWd1VlRtZjVNQmR4TXVKby9TNzY0YXpU?=
 =?utf-8?B?MmdaeWtEcXJvaWx5aVE2OHRqZitUelpxNEpES3VJcUJHS0VtWG5nRW56bGVZ?=
 =?utf-8?B?U2ViZitqZ1JQdGtjNVNMM2l1T3ZKVlA5TmJCNTRabjNuTW1lNXRmUHpzUTU4?=
 =?utf-8?B?WGxGQjMyN3Izb0dvdDh6OUp2a1ZLU0txMFlMcVk4YkwxR1IzOVpLOEowSEc5?=
 =?utf-8?B?OXEyK0pWNlAvR1J5SCtISVNacmxNL3dQZjNqQWMycDAxM3l3aHVDWXdGNVdk?=
 =?utf-8?B?VUFIbk8yU1FSdUl3bGlqUGw4aUlmZi9ZNW5tTnc3cSswWmVjOHdtUzlSNUp4?=
 =?utf-8?B?cE55aDdITDZvUlJvS1pjcDBUOTN3Q0psUXJaOWNGbzBQNDErVjlKUlFKSmlK?=
 =?utf-8?B?TEtZejBDZ3JtUVAwWitDTi9QcmQxSjVpWHNzbldiU2R2OWh6c1lobHZiT29j?=
 =?utf-8?B?WVZKcFpCeWE4NGpNZjJucE1icFpQZEpFQ0pwM0lxNmUyOXFzNDRWWjdGeWgw?=
 =?utf-8?B?Zk5NYkhpVkxENThYeXVsUG5ReUd6Q0JrbWpKOHJKNGZlOGx0bzNtVHVpKzZ1?=
 =?utf-8?B?QVJRSzBtY0VjbnFXSjJ2N0hzbkY3blZ0OUUvejJGZzVDNzQ4eVBnbFkrR1l5?=
 =?utf-8?B?QkpGZkw5WmplSXFEdDFtZGVya1g4MEZqbUpiUkhUd2dIdnYzMjl5bzdJZ3lr?=
 =?utf-8?B?Z20vb3BkZ2doVm5HeUxyTGVkMDhDVmUrZ01ETVBHRjl0ajJzTGhaVUxBZU5W?=
 =?utf-8?B?UXJ1c3BuK0JmVzRyL2FzRit2V3JpV3ExQ05tSU44VEFOWXFyaThKYkRieXR5?=
 =?utf-8?B?UUxzZTNrRVhZMk1PVzNwU3hHVGp3eU1UdTFQUVp3dFpYQTZUSTV1ZVFTSFgx?=
 =?utf-8?B?bDJ6c3Rtdk5jTmtDQTlhbHBHdlV2YkJVVGFkL1p0bWlqK09mR2cwTHd0QkF5?=
 =?utf-8?B?K1JHZXk0bWtVaVB2M1o0V1RUNmhPMGdBOWl4UlpuTVZLbzV3YnZNbVlmZStj?=
 =?utf-8?B?d2h5MzdNVTQ2K0VUYWx1ZTR3cDhKUnBzbzdtaWlKbXdpTHJFQTBFVlZENlZO?=
 =?utf-8?B?YzVYREJrZzJ4Z2poclRXNS8zRFY4R0hSbjdZUFdPWDFjbFAwdDJDS2FzSXF5?=
 =?utf-8?B?b3FRcEc5QnlLSGZoSWV0cWkvR1hPN2NacnJmMEF0UWIxZlZyVDV5UWx1enBC?=
 =?utf-8?B?NkNMVHArSnRkNnZxNVlpemllUDBLZzZPdEdDakt4Q0JVYTNEaWNVNk52VXRY?=
 =?utf-8?B?TnNRQVFhdkFOanZQM09OeVlFR3hQdEdWRDA5b0NSVWs4YzUyTjhRREEvdWt5?=
 =?utf-8?B?eGpwbExLWlV1ODNkUklibUxybXgxNWdYMjdMZTk0VUpCUFB1MzI4NlY5Rmhx?=
 =?utf-8?B?QW45UXdsV2ZtSXQrS3dzNHRlNnVmMnltS3NaZW9XTE03aDJHMVZnR3BMV09S?=
 =?utf-8?B?VVdORWFvVUZiaDgvelFBQmVadStXQXh1d2hpY05ZbGNrdHd0M3JVV1RrM1Y5?=
 =?utf-8?B?aUN4VFkwM3gvTTdTUVBVWVh3S3phUmdiaGRNS3lsZ0NXT2JnR2FaYTdkeUJW?=
 =?utf-8?B?UnFBSkVMbUxPU2JKTVcvSVZrbms2TFVIZ2d0YmZXRnZ0aERHTjJxNXQzS3NH?=
 =?utf-8?B?WmZ4ODNKaEVyZ1BrWDdtY0JueTJzSkZMR3M0Wlp6REFzZmNEMCt0S01kcThW?=
 =?utf-8?B?cGxTajdIOHE3OGlIVllja0RWdUdpaFd1eHA4aVovLzRIcUY4L0tyT3pUd2N6?=
 =?utf-8?B?d0pMUnczelY5ZEl6ZUxKQ0dOd2llNXRjU0RLNlB6b3ZXYUdheDZhSkFzNjVp?=
 =?utf-8?B?blV1UlA1aXgwclBLVGhYR01YRDlGVy9YeXVUaG56cUNVL0pVd3ZBWHlYeVl6?=
 =?utf-8?Q?cXaOQSuZo2PPOZDwsjTm3wimY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GTd4JX6VvqoOgdKLMuxCVNOE6Bfr6u4GBui5VnpT40yV5JAZdaesUPGOiAK9VGhGDxa5MfRIYklCFT1LWV8X9ugKyd0jtZ3uN2H5UMW/aJmwLncbw3747PhqIXhpJjAzrFgpkntMJfd+reqM2kWBlWNJFJ8tbrgHzPUi+VKN19xJs1ReAF/G3Voj1ey6uxWvU3WwiIih0JH+lGxQERHtAvelcSVNEtHL5/C/Kj887hCDuCB600aUbjju2LFyzWnmWgjUWOycwz0d4pUp6XwrB5Iq8xQ5cCE3/F92p9eKA6hfmkfwUQADsG1r+JBq1ep5QKUxS+eDepvm4vpImJWWwu8KhoATSflVgeXCFwZYUHcE8ImtIT0CU7g/bACzo5+whZHYd+fApbohOhQXjnit8yeAMkiQkeuZOboufFEii1y2lf7zlofOxqxpqJ/RzSUG0imCodi/FQpBtyyGHuOjogvlk5e4brWnAQ1mTbYfUiXIL5BjsLn9ei/Qev8QCjKLG2vyiRpDVRxinXshDJwpahK/TMoFkBe4URa5p8+JeQoRKma3KgTUpYFaq0lurbH4wd1GlMR0s6EdAXfZySEBqPaDXIsfEK5RWXQlzMXRkEVhMKrrOGdbKqVYFhcM8g9jVmp9kSogmPpbZ0CfYHHDvoDH0BiWK64szjQgkGp2mdgPbbd0Ann8LilAW7Yxw1s0z0wMrfd4AYq+9aPDoiheeH1UGKJLkTBjKl4N/CnZQ/Cbg6jJ1zsibcVuvaqWy0QvUkJoM9SE264xoVwOWJRaANu4oMKD4iyTJL/Gocyqw0CY9znk5C4WBVeGzqu7YhXxQejqDdGWIVBpsxcyUDRf81FxGslxfxC1eybFauTUepom7YIbsOmgmMqgaDwormqDU17sBqNnvFJhCeIZ7sxFDg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ec6d85-aa0f-430b-fe16-08dbc584f176
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 09:24:58.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDMFRA0DQYwetUw7zXhpoPUNVpXvjFaYK4UEi12colGEtaOCPVKYeHzaScgtf1EO+4XnEH+30QOG0RmJl6G4rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6501

On Wed, Oct 04, 2023 at 03:52:54PM -0700, Stefano Stabellini wrote:
> On Wed, 4 Oct 2023, Julien Grall wrote:
> > > > If we want to handle such firmware, I think it would be better if we
> > > > provide
> > > > an hypercall that would return the GFN where it is currently mapped.
> > > 
> > > Sure, but such hypercall would be racy, as by the time the gfn is
> > > returned the value could be stale.  Adding a replacing and non
> > > replacing XENMEM_add_to_physmap variations would IMO be better.
> > > 
> > > Anyway, I don't maintain this, so it's up to you.
> > 
> > Bertrand/Stefano, any opinions?
> 
> I think we should fix EDK2 to unmap the shared info in all cases as
> that's simpler and the best implementation. What's the value of keeping
> the mapping around when the OS can't find it? Unless you have an idea on
> how the OS could find the location of the existing EDK2 shared info
> mapping.

Indeed, edk2 should unmap the page, and we should fix that.

> 
> It is important not to have 2 different behaviors for the same hypercall
> on ARM and x86, especially when the hypercall looks arch-neutral and an
> operating system would reasonably expect to use it in common code.
> Having different behaviors on ARM/x86 is more error prone than having a
> less-than-ideal hypercall implementation.
> 
> I agree with Julien that the ARM behavior is the right behavior. Can we
> change the x86 implementation to match ARM somehow?

I'm afraid I don't see how.  edk2 is supported on x86, and hence we
cannot simply make a change to the hypervisor that would render all
current versions of edk2 unusable.

> If we do, I guess we would end up breaking legacy EDK2?

Breaking plain edk2, as there's no version of edk2 that currently does
the unmapping?

> Is really the only choice to change the ARM implementation to match the
> x86 implementation?

Unless we want x86 and Arm to diverge in behavior.

I do think the arm behavior is more sane, but I don't think we can
make that change on x86 and simply render all existing versions of
edk2 unusable.

Thanks, Roger.

