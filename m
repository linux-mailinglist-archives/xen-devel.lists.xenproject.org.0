Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C2375900D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565644.883971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2NN-0001gU-B6; Wed, 19 Jul 2023 08:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565644.883971; Wed, 19 Jul 2023 08:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2NN-0001dq-82; Wed, 19 Jul 2023 08:17:37 +0000
Received: by outflank-mailman (input) for mailman id 565644;
 Wed, 19 Jul 2023 08:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KnqJ=DF=citrix.com=prvs=5573504fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qM2NL-0001dR-8Y
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:17:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b46df22d-260c-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 10:17:32 +0200 (CEST)
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2023 04:17:24 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB7148.namprd03.prod.outlook.com (2603:10b6:806:33f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Wed, 19 Jul
 2023 08:17:16 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 08:17:15 +0000
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
X-Inumbo-ID: b46df22d-260c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689754652;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cH89sucdW3no+s4hD9S1nk6H36jxZkwVef+E7b0QLcg=;
  b=KnIx6P8cNE/6dVbeHEQh+xCHpDVVu53Z/mfXBfVJ4zOIhPTfshCAadUO
   7aro7YHggJOWfx0qPAdoZpzp/NY6G4oZitf15FXM+3YwzZ9yz9QJEuHLJ
   kZXKTeuPCr698oikelLBpvvtoUv8T2XZRPG+i8QZle1WrMVK3piWZaKOl
   Q=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 116718419
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RsaZH6vxQC9nCeg5K4J1acbSvOfnVHBfMUV32f8akzHdYApBsoF/q
 tZmKW2FaK7eY2GjeYhyPo+xoUlXu8PTx9NnHVBv/no2FXsU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACHxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdgoufgy5mryN2Z3qUeZuloN7A5KwI9ZK0p1g5Wmx4fcOZ7nmG/+P3vkBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/6xabI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiBt1LROHhp5aGhnXN+DYZBRcdBGK3huWSm0zmAINUc
 kMtr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A+N+6pog21kjLVow7TPfzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKAhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:BteHQKzX5KiATWI7LNUhKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-Talos-CUID: 9a23:DB6gLW18RVvW6jJmsHBh9bxfRPoGYmHn0SnrOmDpEmlrWPrNZgTL5/Yx
X-Talos-MUID: 9a23:ilu0aAR3Kb5Z1sBzRXSyumtoOc1jsp2iL1wmgJde4JiPbCNJbmI=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116718419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9CHrj0bpEZyVc23QGLnoGZFAe+L3F/CYtlZjuAd0qIwmObT9hVq0XiFzEk7dWe7J/yj7tkPp1zkTWlr5nogniej7Jt4OH2NHWAkUhwDzG3Keq/TLIpoBw01hJY7HjS1yeHA2yQYjEnPxuP1Ecuiq+dYbQNllxV11YszhO1Oai2txSNDSbAWtKfVzI+1XCTzo4xnoQ4N0iVUSf6VUsJJQvJNiTz4y2CQOI9A4VVDgFy1hO4KnCoGGum9DBn/O9mhGWIlO1bVms++SAEuvAm4tpZ5VvfxyN+uvS3nqyhS4zn/OLwE0MgAKxXM4ucjeWBrU90MabiJAMjdoI90cU3QHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxisrErvsXmxBmJIG4SlnuK6E7NZw1Zrn0X14k5RaV8=;
 b=BOG76Dq5CuIkdHLZUPu41rBY+9Zwgwq0Vyyz/lPMmLhwhfw0/8NNQMCdnxl6XGDInZcnZ1+NnCNiVEQpH5rGigvj8VqdSnVm947inNO2xB7TT3STVnMlkj3YdmcDbVo5EpE/GzIcpIYeqwd3eJ3xh0H6Hsj3ntj/QWAD3Wk/XOGbCfOgXicfnm7HKxyUEhGm5dskDMkDKgiO25nLcCTKnKGqYLGGgksqlPJfn8YykBPZMufM2KH3bZDARi0VwWxQigO0GbHCDlyhga80XzcUTzCeLS3DWgr8iS8a3FYX2zfYzkHqq4lchdSEENmLOcASHBbJfl8xN8C0UWyxuwDDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxisrErvsXmxBmJIG4SlnuK6E7NZw1Zrn0X14k5RaV8=;
 b=hRbW049sm9K3Iv9nnk6YllUCsJLZbN3NILTBF2qCUbEiLuR/t1b7+I3c5tCQ3fqQIHVlbMIByhW6PNg+4zGAgoVpIXDC5WYz8JHR9OFPwobDiWbAIhPUeqXwa2Q20hl5mLEPq5vSDdCqayG4SFvcYLo8FUolI7mh7RFpCuJXu9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Jul 2023 10:17:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: fix early boot output
Message-ID: <ZLecBsa0pD5wPF4s@MacBook-Air-de-Roger.local>
References: <3913c170-09c6-2baf-ed38-5614f8c6cb2e@suse.com>
 <f9e4d896-fcbb-eca3-ed3d-e7ad886dbc0f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9e4d896-fcbb-eca3-ed3d-e7ad886dbc0f@citrix.com>
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9098fe-faca-452a-34d7-08db88308fb3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hsakq2kuJQPSOcmf1aBNsspeSavVezpnfFzze3KfC+ekY+KkFXdQsLfJz1UEdMnbpbi7bH7mhvHfYPa4Oz9C9Yf9Qhg2s1qPPqERggljffCqRNvH+m68pmle5d/vZyDfEtRfg2hp07rm05x11tXGLr6Q3r69GnrVcCtiog6NyZlWwcbC0M3hecNvL14D1mUPr27/1lmOIUyBVUTNCdNB9jtEDiosu32dxOQ/Ve06diOjMkwr1aZecKTpTBxtavYy1XongPtsx5ZwydvWHqLU8O3JjMEVhufsqQ/cxawcwP/NG66nTcOmohczfoPcJhR1BYDvwpMCejhkMkId+K2ExgetC3lFF4qHZj5Qjhk1PLJ01xmyppLw+O+weiCs1zKZg5PZtaxCQMaidvtc1fX2AXuvZbDhkJ7vowuZspw7C+ltlzKlpgGcEb2Lg/98gpu96eigonEQS9oPHfZ9Qn6z+teSYrW2Zd1bAalvRJEb3mOki9VsCxQO3LIrau4VnMaFhx6i97DajmpMvUkLvXswPwUhDiLJObARxoF+wHMIVR5E/yPFtBYtfUv57Sp7ejwe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(9686003)(53546011)(6506007)(26005)(38100700002)(6512007)(186003)(83380400001)(2906002)(85182001)(5660300002)(54906003)(6862004)(478600001)(82960400001)(86362001)(6486002)(316002)(6666004)(41300700001)(66476007)(8936002)(8676002)(66556008)(4326008)(66946007)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2paZm1QbVM4Ym1IWVhrRndmT3NkU1orN2g2ZVIwNHYxVlRtREdzMGpUdDFO?=
 =?utf-8?B?amQ3QngvZHVVanFMTHVVWDJQZEQ0VWp3eERobGcwcURkYWYvVFBxZ0VmMGV5?=
 =?utf-8?B?dG4wYUl0MjNEdSt0Wm9IQzlETW5XbzJ0N0Rrbk1MMXVEN3pLT1crMFVZVUtj?=
 =?utf-8?B?aTZNR1NUTkZTWTBnT0pZYlVGTEtJSkFkWE5JYUd5Q3ZEQUthR08rOVd6MFly?=
 =?utf-8?B?SytzRWpBZkhXV1c0bmxsUFlXUXc2S000UXVBNnIyRWpsUDluQzNyM0JmWElm?=
 =?utf-8?B?LzkxZThlWDloRDBwbk9nQkxPc3BnMlRCZWhMWlhBOTN4ZG4xK0JHQkpMeitx?=
 =?utf-8?B?aHJtSkpCd0VScTRaWmV4RkM3Uy9IUG5tRHJuUlJtVC9KQ3ovb213ZTVXRlJw?=
 =?utf-8?B?VEtQZzFxRzVGeEFVWVZwcTI1TTM1ODdKaWF6ZnJDY1RmS2h1eTBBOVF0bXdU?=
 =?utf-8?B?enY5NUN2ZDRSeGVWcGpaV204d2VZRjJDS0tTTWVTSm9sNDR1RGE4YlZpZ2JL?=
 =?utf-8?B?c1d2RkcvcVVHQW40eVUzTE9hRkMrUWtWeURyVjFUZUR5SDd4YVpjQ1BZb2pz?=
 =?utf-8?B?L3JRQ1lsUjVTbU9obk1KdGNwNUswc3padjBEYXRBZ1hiRjROZ2lDZ1F5cmZM?=
 =?utf-8?B?SFdYeWh3ZW0rN2V1elpENzJ0WWJnbVNIdDR3TXZOUDJhbUdXT041bkszS2pN?=
 =?utf-8?B?Z3NIQmt3aldiRWp5eUF6b3ZWNUFqb1l2TzViMkRCb0QvdWVtdjB2SUdoUjlZ?=
 =?utf-8?B?QmZYYWpzMmdSZ1FodEFEK2lZMGZMZ0ZEbzEwMkpJbDdFUHJlRXkycjFqWm5n?=
 =?utf-8?B?djJZYk03bXlCSko3VzVBcWhYZmk2cFNnd2p0T1pyOXg4cDBqQVNmczNhbDdI?=
 =?utf-8?B?OFJxNmdDc0p1OHl2R29YMWk1L2F2KytGMHdkaGVxUUtsVTBoczh2eXBTYTMv?=
 =?utf-8?B?M1NzQlhDR2hENEdCMk5Zd1drOWFKUHZmTEorVG1wUURpcUc2eWFUQnBPZmhB?=
 =?utf-8?B?ZTlraWd5b2JHeEhPYUR0UmEyblZ3aXB0L0VkbjVlNTlXNlJ3ek84Y0luZTZY?=
 =?utf-8?B?dkkyOSs3MGN6T1JmTWM1clNvckE3eWgyVXRFM2xycVRxR3N4dVRMSmRMZjky?=
 =?utf-8?B?WnVNS0RUaVFHTXJRT2JhTVZHSkcyb3hwZ2NtRTJnYjNuMTBGNUtIQnl2dGtz?=
 =?utf-8?B?SVZUY1FVYUJGTHpzbUVLaWVGUi9yYTZTYzRMRWpLcDRSNStXNmVzY0Q3N3Vr?=
 =?utf-8?B?ZE1KVkRteFlqMnNzK3NNWFlqQzZLSmtTaTJMT3VtVGJMMnNVZ3p6Uy9mNDFl?=
 =?utf-8?B?aEdBV2NtUms3VENtaXA2dGNvaGFVVnBnUndoaDJ1dlNLcjZBOG5ZSThaaFNW?=
 =?utf-8?B?WlgxbTM0THVvcjNTUGEyUjdUVzRaSTJFdmRTOGxBUVNtcmpXSVlVcFhSODRP?=
 =?utf-8?B?ekFjVFpwN0lubWI2Zml2NmZsRGxBVi9uRENRY3p5SDRXbW5Bam83cXk1djdZ?=
 =?utf-8?B?V0lldDVxajJia2lYQWkxaHcrTG9DcUV3VkZkT1lWQ3RvZlZVOSs5SjdVald0?=
 =?utf-8?B?NzN3LzRRdUJsU0NTZG5RdUo2Z2l6aTlUWjM1MjlxMG9sSXY5c0lHaGh2K0E5?=
 =?utf-8?B?RElNOXhsdE5qZWRBWjF0TDFYNFE1NEdyZG01OE45WFRSZzF1RW05MHQ0d2NM?=
 =?utf-8?B?RHVPV2Z5UDBIQi90ZFhqQnZmS2ZYd2dGV2pza2lsWHE0d0VMaEY4QnJoWWQz?=
 =?utf-8?B?eXNPclExQTZLNURIWjJ4aU9sTE9qc0wzZ0pjSm1Xa09ObzMwR2JhZCtHb3Bz?=
 =?utf-8?B?OWRwd3V1UU00ZWNXNngyRUpway9uenlzVjlSOFJscmkzRHRDMDI5YnFrK3Jj?=
 =?utf-8?B?YVR6NVoyM0ZEYWxnazhpSlRjNVN1ZW5nQlA0YWJnNzdHZzN0emQyZ3U0MkJJ?=
 =?utf-8?B?NVJLbWc5T2xMaXJoTnJzYmRxejZKSm4xVTk5YXNUMlVtMU5yczZSZ1ltMU1o?=
 =?utf-8?B?bGdmVFRLOTRBS1lOU2dnVDgwMWpOcG5TWFFHdk5PcEFoRzhNZUo1dDF3bEdM?=
 =?utf-8?B?L01QRi80TWRqUzhJd3F6ZVBmcUo2N0c0QllKTW1rSmhkaWZHZXozMFBIdWM1?=
 =?utf-8?B?ZlJheGtDOXhmNHVWZkY2SWpwSWhTVERTT0J0U3U4Wjk3SCtPOTBlU0VYeHlr?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NVS3CA1xLXvp3y0YbLxDZaVYSS7cApkUydwNOsNjw5E+WjhfjvbADKO1VjA4MsrF5WrbxFvP7hg9ZfoWuBK/LRn+mW2iSSPE8LiSQi0tr5+Tik6+GIxvl+vlTXxcoyO+IgbtslaCsomyc5YXqYVMnhcNBwFrtkp3r0LeL8KYRbX3I+qNjSk1CQQC6ucWGnz/jjmWa0+uxm9g08qIUTR5mnAtGKsF/xWTs5AdYctwIsq9uJqA0qjiZqv3BtdfulHPtPB7Au12sUMGOukKe/BjNbYH95/TMumu1sc0ws2bPhTrr1VTB4/fFjdcAqJL05jIcoYsT8ecg9TRXs6jeYQdkWsZjl4dYH/7fEOUrtiyjR+Mhzz8kTG8Mm8zieQzdfrsVg/74lSpOIoWlLHTOte5bL3hX8BtAt0RRdnW9YZJ+Un+ayB8GWrOtLfLxGF3QyN5DQUfTROUGKx8/hniEdKwt45qCqWbS0uMop4x/Dm+T5UmQjaD6Yh5C9PVgFUBCYvv8PrrTLH2h4CUWGtmTGlKD3p/M5J/bGkhQpqUZhVCk4cZZq4WfuTkWfEVhi8/xFvj0+L4BUe7XxTWdgMpkBblDctZ2h1Jjj2Xecl65E30KTKqgMOd9yXf7+MlbMhvwzoydhAv1Nli1+NCxsgCqSc0ffHeovc/QfIOg8sfvnPYGvOm7DA8a3HrvbLIhPPRW3TmRi6AlqDMXaABkp2/3NajVCP9e2Y+Dey+sxfbnVQ3khnYcDp0jyjZXSIq7VIhqaZc7MNRw2VPnN2UaefGsRsHc/XeZTnOJHcpSrlJPhfRk6sVou7w89ZV2uZSO5TEZ4gg
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9098fe-faca-452a-34d7-08db88308fb3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 08:17:15.4786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxHPtXfUo5KFTsr+yvfSzFdXGR/ON652FX+YxXoByExqCfA9N6piJoVFL3ZQf6A9vvacdBJTQgM8fvfHzJq6PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7148

On Wed, Jul 19, 2023 at 09:06:08AM +0100, Andrew Cooper wrote:
> On 19/07/2023 8:38 am, Jan Beulich wrote:
> > Loading the VGA base address involves sym_esi(), i.e. %esi still needs
> > to hold the relocation base address. Therefore the address of the
> > message to output cannot be "passed" in %esi. Put the message offset in
> > %ecx instead, adding it into %esi _after_ its last use as base address.
> >
> > Fixes: b28044226e1c ("x86: make Xen early boot code relocatable")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> When I was doing the label cleanup, I did wonder how this worked, given
> that it clobbered %esi.  I guess this is the answer...
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Although it occurs to me that probably want to (optionally) use one of
> the IO-port/Hypercall protocols too to get these messages in PVH boot
> case too.

Using XEN_HVM_DEBUGCONS_IOPORT would be my preference, as it's the
same IO port that's used by QEMU as a debug console.

Roger.

