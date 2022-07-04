Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0F565A9B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 18:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360460.589867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OaI-0003MX-BK; Mon, 04 Jul 2022 16:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360460.589867; Mon, 04 Jul 2022 16:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OaI-0003Ir-7Z; Mon, 04 Jul 2022 16:06:02 +0000
Received: by outflank-mailman (input) for mailman id 360460;
 Mon, 04 Jul 2022 16:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Xk=XJ=citrix.com=prvs=1776e108b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o8OaH-0003ID-6G
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 16:06:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30e1a0cf-fbb3-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 18:05:59 +0200 (CEST)
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 12:05:47 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6622.namprd03.prod.outlook.com (2603:10b6:510:b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 16:05:44 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 16:05:44 +0000
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
X-Inumbo-ID: 30e1a0cf-fbb3-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656950759;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VkvD4ekt5WTe+vRTVgw37/uNhAd4nFgU9t1H4Aa2QZU=;
  b=ckqk1cLnvyauiWD5pKc1Y4cU1b79izXNOVQlsu2XKfQteD4RJZn40Yo7
   Tu4UCnk56hovInpzoqnGn1+vWnxjcR/wScXis1ORH0oPzQKaHSAi/6CUM
   yEauKOvhnqpxMWRNMo+m+wyJvmiWkvO39V5OdyiVhgT9oyWzZydBGKiDh
   E=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 74365605
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M3dGOK1nxaSdZD+akPbD5alwkn2cJEfYwER7XKvMYLTBsI5bpz1Rn
 DQdXDiHbv6LMTHwKYwlaISz9BhSvZKAzoAySlRlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tEw2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1VqbKragF3DJeTp8dNTABYFj91G7JZreqvzXiX6aR/zmXgWl60mbBEKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82aBfmVjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SWkLWAG8A/9Sawf42b8yAp/7bLWH/X8X/urVMtLlHnGj
 zeTl4j+KlRAXDCF8hKL82ihg+LTkCThcJ8JGaejsOVtnUeYy2IUEhIbE122vZGRmkO4Ht5SN
 UEQ0i4vtrQpslymSJ/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Rizt1HUABRz9FLdYg7ck/QGR10
 kfTx4+2QztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjTxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:CqVvrquAxM6lRvc0p3KwBLr17skC7YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVgUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZrzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDn1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9EfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZzyHtycegH2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB24ffueChPkHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="scan'208";a="74365605"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFUjRUF7NGzRiCg/hS5KW+ihiEEOjiOHWT9E3GnpFTXmE4WiKbXt0vbL5A3+Uq8MKw5cgx9lE7zFKQuR4AuLgFE74VEP0glKui0zIyd8ypYrywLmeDu8+GdcD6dtYU/3A1wTum/ozpJoe2kPke7Zce7yvXIb9qjrtL6ESMnNL08PhCky3GCMCP2ZXvxbYhGzOjmD3oe8wIbJTQ/1r5/gshkZEOQijBouSCxAUaFCWs5y6UQN+BsYo6oViQYuSMtssjYGBAA/VK8fhwQHQa45TLYrMjUKUYAnO3VMqR4E925jZpo5yyq6HBUL0qqa/540k2PG9H698+69C+rojwZ+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c3a6rVImi5dqRSIfLU7WycXTqelQQ5pk1VTTDgZsQk=;
 b=YJovUrifQzkS/vXWhOEPLe/jYKldDb+xEiQbjI4IRoz0wFQzjxn9Zrq7q68FpqztFqXv8zyhud4dTMkVxjftnNP1SfCA1ETUcafTt0X12Ees9WK5G8e1EvSgAokbxVPvM9OEDLpPoNHKUunF98yb+9mI/qw5kGnqfTNkGp14baun/vpCTXDa2c5uuNj7mXG4HLSNMAM4xEYAqyvstmWjt9M3VK6NvwPJzBk46ufOQwU8602GGr9q1IhVOZ6Jo/U6s7V1j3rt4GK4GjjQJ4V/onDe0f0AAkxSoi++m7+VLx8/Q+F88UvKHo3F8zvJ2glVHQO/isvYpymFljDcQSuvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c3a6rVImi5dqRSIfLU7WycXTqelQQ5pk1VTTDgZsQk=;
 b=TKlJmJ380ToS3y/WC33/JBufanZCOhFGdwrnOC4zZ0/z2+M9FJm7TPrDj5e4FNRXjmT9z65fx1O4wbLQ8R4qdwVN1CKx11J4TO4lt7o0z3KmigBPtNzv5hrWRjUOST90e/uXePZ1BFGdM3WOVbg+jxh5jgMlD4NsZO1qgIjPv7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 Jul 2022 18:05:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Message-ID: <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1c091df-e32a-4add-3715-08da5dd70d1b
X-MS-TrafficTypeDiagnostic: PH0PR03MB6622:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vu8/TE8PnzKPqSi1PDHsKDQVgc+d87LOtORSUmx1NU8KihtUEccBZYkj9LuuFAfAYuOVie3iqvyXx1JUWLu989XuHs6Nf3/+zygj16TVF1K8v2ncL9Ke2bU68MkL54TkWaO1gNpHkBdvl3t8ADiBZmMz2M+2J7vdsma3UM+3fOfap3A1Ss5d7nwo0w53n19tDA+4Xh6WoSoihRVNR6gJn6aB74gxWGF8MrRA58HxAW86GP+TWSmAQlIptMJfLmGo+mUlccdp7F4K891P3ixbalJLOJwnqoEU1QV9KLT+y6MuaEBI8QJuZaDTeQLu043++DO4QHkoXAJtVposhKk23IAIm/QmCKClP+UNsNYQSWQ98CuXDu3MDSNuPGxRnMhymDc19BOYAs4Mcupzt3hr2H3LU/rbVaAuIbok74srZVDwYlq5GjRANrd7l1h5zEkfJSB1wYntslcNZmiqdSqDTj5NUJoJqn/96dd0eUvDauraGJlkwrfNLwgGirk2sLb7KN7NdmmLDjmEpPo3S67g5XPJj8L6F9Suzqggi5uzq6XGiyGFPEVAMzaE/YVRWQzwYWKsQaGehyzBj8igkJUtVUC1PNQyBhDmXKreJFf3nugKmFz752nuUhEQ3JKdEvarBvm3pYmNXzUskIHylnq4WxgXjMBMSIPQDC4CpkFVlPBgNNlmkCOqjF+eskCPaVyO0ptYQzMKfBN0xCTOFUgyYDHaI660T98go9o+NJygN41vNcJk9P688fW2OCv2U4Bi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(316002)(41300700001)(82960400001)(53546011)(66476007)(54906003)(8676002)(38100700002)(66946007)(4326008)(6506007)(6916009)(85182001)(66556008)(83380400001)(5660300002)(86362001)(478600001)(2906002)(6486002)(8936002)(186003)(6512007)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWpENjVlNXEybnZiRWJLdzRzbWJ5cCtxMmZzZ1hsbitPRUttQU5HY0UxSjkv?=
 =?utf-8?B?YTRIUTM2NjFxWDJqdVBlNEJjNzhNRnJQTHdNUE5aVmc0RWZ2Q1k4ZUloUy83?=
 =?utf-8?B?dmdVSHpDWkRNUHpXOERoZU1LNnpqc0RoT2MzUWNJdHJqZVZzQ3hsdEN2Rmh6?=
 =?utf-8?B?YTQ5RUMxV21lbHEvYWpsN0N6amlhRjY0b3NDOTNEdHN2TUpxSnlpRkkxRzVv?=
 =?utf-8?B?amJJdWNtejh3Tm1KYzM2NkU5Z2dHdHBWd0dldnM4Q3pDOG40ejNPMUR6Q0Q5?=
 =?utf-8?B?ZFdnSGZCQklRT0ZWNCtLaFpZNUpuWHo3YTR3aHlWOHQ0TzMzNmNjZGp4dkg1?=
 =?utf-8?B?bTZoYnhJVjIwVEptQ0h4S3FzQ2N2bnZQbDZwc1dPaERITlJpME5ZeGg1R3oz?=
 =?utf-8?B?ZUNHVVpNUzRUcnZRa2s2UXhqNUhRT2VvOEdrYnM4SkdJRE9sVnVZRjErbUpu?=
 =?utf-8?B?Q2ZyY2N5SEJSc1NuNkkvYXJRWS9GcTR1SFZ2ZkVHUjVJZ3ZLK21MTGFtNFNz?=
 =?utf-8?B?RDFJNkdYclMxS3NxVnFtVGJRbEsrcEtDRVJlZm8xWGd2QkRINmpKdGVHejBO?=
 =?utf-8?B?eEh0SjY3ZWNIb1VUOE9XeE5qQTZyVVVVc0EwWEU4Z1RCVXpPVUtrbVFSUEdm?=
 =?utf-8?B?SGF6RVYvaU1DT0lvUnRsaElrdE9wS3lOMSs5TmF3TjFpRnFRb2tJZzRiRXdI?=
 =?utf-8?B?ZzF0bk9DaWg0cEF6czFpRGF1eVNiTE4ybzVEVXFGMmxJbElaQlZyUmQvMHhH?=
 =?utf-8?B?d3RkVTJvbnhQeURXYWZxK2RYSVR6K0ViNllPekZxZzJBZkpHdnlRNzlUNTNS?=
 =?utf-8?B?ejJUZUhvU05ld0JJYVJqbCtpemlsRU0vQ3ZXeHRFTUVDUEIzYnhRSU4zMVVs?=
 =?utf-8?B?Q3FEUGtqd3NscUlzWHRISC9rSjRVRm8yV1JQb0RwSU1LR1lncnhRalpkbVRC?=
 =?utf-8?B?ckdGWWRpNUQxdmhzK1ROOWUyTGcyejFMYzVQSVRHNjk3N2NGLzVmamhhWVRB?=
 =?utf-8?B?RHhEVDJTZG1TUGNGWTNSNytwZmNvUnVITDVWenZVMmpraWNmNkRyeVJEMGxN?=
 =?utf-8?B?LzlVejYrTXZrUndwTHVKeGVMYlBHdGpkVDdhQmxZbXVBaXpMZFNWSVBBWUVm?=
 =?utf-8?B?eithNnF5RlRaUXk2RzFsamg0R1FFTUYxOUhhbHZEa20rcXZVUjN2WXYxTVo0?=
 =?utf-8?B?VUQ2MzdEMUJzbXpHU2lXejhjeXNGNjROdy9TbXl6U0J4UzBXYWxSWXBmNWps?=
 =?utf-8?B?VzRVT0FxZXRLa1c4a29qNU1CRk5QREpKSnBlQVVBTUhBN2tFYytZMWhTSGtp?=
 =?utf-8?B?V0g4MWhCbVFCL3loa2JXbitCZDF6SmoyY2ZSbkQ3KzRIajd0Y282MUlMSVFX?=
 =?utf-8?B?ZUY1TXpLeENZa21nYytMR1JsRHo2NDJmMHdHZVpZUkt1Z1M1aWVSMFhxeWFN?=
 =?utf-8?B?UVNUU001K1ZOWk55MWlmUnNYL004bTVldjdidFpnOVptdUU0YmNtK3pBUDAy?=
 =?utf-8?B?NERWRy9wcmxjMG5TZDhnN0Fma2FhNjlsQ3NXWUY4UWVJcHhQcmJzM2prRGlq?=
 =?utf-8?B?MnZiZFhEWjZsTUVGK1NhdG9vQTFTMEhvcFFuVyszRHhJR2Z0UDEvc3ZtWUVq?=
 =?utf-8?B?VGljWTRNOGdFWDhHaDBjaWZnUHZ2RTRIOFd3N1hmazY3b0NHelEzS1JPa0pI?=
 =?utf-8?B?Y0YrU1EwZ2pVVTVxUXU0MWVQMnJkVzJqVE1FS0FkK3o0aElwcjZiZDZhMUN0?=
 =?utf-8?B?Q2psNk5JZUxIYStQcFFqb09SUDcrNEdSMVI4RTA4ekRKZFl4YVA3aXhHVEkz?=
 =?utf-8?B?M3lSLzh0NU90cUtiS3RyTUNDdUlPTWMrSlphSHpJKzRkZldKUFJyZ3crb0RZ?=
 =?utf-8?B?TkhZZFZTdDlMQTk2NktNUUU2ckhBUVFxS1Q4dGpsdnJsUzlnMFNaeE9nWWwr?=
 =?utf-8?B?K2NlRkg1REdwZ3lHNnlZWVBDMU9nUVJOUTJGTG5ZMWNNR0t1OXdQMy91L0Jx?=
 =?utf-8?B?em1DOVhDRzBpK21MQXpuNlAxRE1HaUgzSkhGY0FBL0VOSUoyR1JlWnkyaVdH?=
 =?utf-8?B?VGVEN0ZtMm01U0pnYU1uT08wWjlsa3F4V2NNc1VpdFJwbzkzQzdsZGFld05Y?=
 =?utf-8?B?Y00zdHQvY3FTS2ltcFppT2dNL0xNK0E5YnlaVVd2RXRiZFU0cHk3Yy9oMWpy?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c091df-e32a-4add-3715-08da5dd70d1b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 16:05:44.7616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9AqIgJoAoZ1jPfrQa4DKY+7WoESui8lhyecu99MHOYHojpj43t7SxzVm8lgNYLrKz6j5SLq/zhNjSf0yjkAVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6622

On Mon, Jul 04, 2022 at 11:37:13PM +0800, G.R. wrote:
> On Mon, Jul 4, 2022 at 11:15 PM G.R. <firemeteor@users.sourceforge.net> wrote:
> >
> > On Mon, Jul 4, 2022 at 10:51 PM G.R. <firemeteor@users.sourceforge.net> wrote:
> > >
> > > On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > > Can you paste the lspci -vvv output for any other device you are also
> > > > passing through to this guest?
> > > >
> >
> > As reminded by this request, I tried to assign this nvme device to
> > another FreeBSD12 domU.
> Just to clarify, this time this NVME SSD is the only device I passed to this VM.
> 
> > This time it does not fail at the VM setup stage, but the device is
> > still not usable at the domU.
> > The nvmecontrol command is not able to talk to the device at all:
> > nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
> > nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
> > nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
> > nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
> >
> > The QEMU log says the following:
> > 00:05.0] Write-back to unknown field 0x09 (partially) inhibited (0x00)
> > [00:05.0] If the device doesn't work, try enabling permissive mode
> > [00:05.0] (unsafe) and if it helps report the problem to xen-devel
> > [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entry 0)
> 
> I retried with the following:
> pci=['05:00.0,permissive=1,msitranslate=1']
> Those extra options suppressed some error logging, but still didn't
> make the device usable to the domU.
> The nvmecontrol command still get ABORTED result from the kernel...
> 
> The only thing remained in the QEMU file is this one:
> [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entry 0)

Hm it seems like Xen doesn't find the position of the MSI-X table
correctly, given there's only one error path from msi.c returning
-ENODATA (61).

Are there errors from pciback when this happens?  I would expect the
call to pci_prepare_msix() from pciback to fail and thus also report
some error?

I think it's likely I will have to provide an additional debug patch
to Xen, maybe Jan has an idea of what could be going on.

Roger.

