Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0002C565A7D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 17:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360453.589843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ORp-00010i-Uu; Mon, 04 Jul 2022 15:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360453.589843; Mon, 04 Jul 2022 15:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ORp-0000xU-Rw; Mon, 04 Jul 2022 15:57:17 +0000
Received: by outflank-mailman (input) for mailman id 360453;
 Mon, 04 Jul 2022 15:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Xk=XJ=citrix.com=prvs=1776e108b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o8ORn-0000xN-GP
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 15:57:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f79c607f-fbb1-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 17:57:13 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 11:57:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO3PR03MB6710.namprd03.prod.outlook.com (2603:10b6:303:179::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 15:57:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 15:57:09 +0000
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
X-Inumbo-ID: f79c607f-fbb1-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656950233;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eB9sPg5jx9kKiyduEEmDUQI2ehgwJh1tzA53kLtKjm0=;
  b=ZDoYnbvvCgjSTrfJfu5SbtS81ruxuh3+EFrKxnk9UbpH6mzh2ERAkOVY
   vAl+2Xp3nyNjuNhH9XLbA3Fi+3nWs56IGECPvCKRKWqdnzlOehQHfXxXB
   lVZtxnJ+Co34cpO0nsytDaJE9xhzH6mErdOiTUxD0lgdzMdgVJ/xrb9Qk
   4=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 75041376
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0KYwuahQ+1K0n9OVURebI6SrX161ZBEKZh0ujC45NGQN5FlHY01je
 htvC22GMvjbY2L1KdokYI/gpxtTvJaAnYI1Twc+rSthHygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXFvW4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVcpIKfWwts9akYGNQ16NKkc5IDnJEHq5KR/z2WeG5ft69NHKRhveKY/o6NwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIEehWht7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9w/N+fNsvDa7IApZ957kKtfPX+62TsBxvme0p
 Ufl4z2pDURPXDCY4X/fmp62vcfBnDn2XY8OGbqi3uNxjUeIgHcUFQcdWFW8u/a0zEizR7p3K
 UUS9jA/sKsa+0miT927VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufQG8eQVZ8hMcOscY3QXkh0
 QaPltawXDh36uTKFDSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa38716bnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:8a1qY6A/FdXRS4TlHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr18jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvS/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kda11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvjklLYIk7zU9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="scan'208";a="75041376"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emeZZBQ3lI5QBTEnU/ajzByQl0gytwF1Bam9l4s6JfaheVQh1f42SFpjFTawH5gxMT3jRR99GEdVX7g2fqugJ0SXgmVKAg0J+LCujpBVEim6WAfCSpbdeRqj6RyhWdmQ6yyZl3kHLRXWlgvFDjKE+SmvzVkGJr/x5NofEx06Wr5tToNeSE6b3vmIr9P2SXlTzl1fTz/nCNva80PPClAoXsodLQTuGUyjATlYLIjj6wdypQxgMe20VYUj6h3I08nkc+tQY3Le93sfro2wpATAbhWK3RDZx8QfE9ZIgwxZg8cR0idUXjCuWED5IQRNmcop+EIv1guZStW45f5XYu4V9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOpJvHeh1bw6kiABroF6PUWv7si+wNayZxlM6TRx4dU=;
 b=FgWhbldppl9qltyV9z2EtjTcSixjNeeupnmh6QWtHkbNRQD5vpRGentzC/JOwkDgcI0nOK+CXtqm1KXMGRj0nT5XeWNacW1TwL/s9bGHoFDwcxwvdGyyGv7vCid4dZZUVtut73UT9YXFz5/y0UkVmJU/FSflqEvvXsXV5AZISJn8oXu0Q3e8A3Bn8v3KKPWJQeDskEL88cN+gUhwsmfDZrCTr3gOQOyVynHcPyBYkXBAPY1ZFOcavFp7CD3mqEW490MoOt0TECf3iMxuCNnJgpzwrAtccXae82X5BPjheZY0ygprLkobAsyPKgoAPwO8w/vdDc/ii7LktanCGc57mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOpJvHeh1bw6kiABroF6PUWv7si+wNayZxlM6TRx4dU=;
 b=AH9qr03CoI8ltG3xZ5krjAKQOrEiP2XZpRuUFZwX7o78iEOTQXCEuZOObU46tKHJ7JQ3hwxFMuBXdX4NcPZfXYx/yEjabFOr6nEDy0B27+S2POHcpTG6CCh8I6i5k+4xBHn6cK8K+SqhJQfLjUscaf4pBIVVi2B94Gp1yAequo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 Jul 2022 17:57:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "G.R." <firemeteor@users.sourceforge.net>, jandryuk@gmail.com
Cc: xen-devel <xen-devel@lists.xen.org>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Message-ID: <YsMN1dA8RL62vm33@MacBook-Air-de-Roger.local>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <YsMIO3E5/hzFgxSa@MacBook-Air-de-Roger.local>
 <CAKhsbWY2OwkGQQ-dqjOOr3Ed7dThdiFpAWbdUOnzbnOkYVqF4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWY2OwkGQQ-dqjOOr3Ed7dThdiFpAWbdUOnzbnOkYVqF4A@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05c54e0c-d5a6-46e0-9942-08da5dd5d9f3
X-MS-TrafficTypeDiagnostic: CO3PR03MB6710:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QnnXiac3Z6d3pd4pmpsOUL+Jmr++wLP/LrVkFz3CmqqmYWdjfFknHyNc7AMCfcHxBuPxJLASEzHrSYlWoBt/PE8V6Q1tbIWr4G118CBE2H0VhEU89MJDzXwLPiz9FxOi52vMAbgHBjK0z7AkT3MNuSn50BA89ae0aVY0EM7nCS6l5TvhPdlsA4iRklAoxiJKrtSudSQ6YzHCZJe3g9yjxWELXu2ktNzw/NgTkaNzCSNHf9UeDkpJxxCra9A0XDDcZt/HCMM5PD1hbOb1/vrk+SknTxnjK2vsDL61IBlXva30Nbm8h/NitHsoaht0/H5G00ZTXy0gnEQ+Kboi4Y1jhHFfa3jO5UT9P65b9+J1Zq7K3ebnJsACrvGN9C3qViHYI4+20HdkNnESDm80xPuZPRy49eWZWcuP/oOqkBw0J+Hv0EGA1orRZPqiDUDMqPDEy84R+kvUEyXvBw6859JBclRHeL7OMDFO/eRCXAJIqtAHzZzCo5CNAFNrVW9tdEWxYbj+CN9OS8gC1GZDpTC3bpakJU1PuZsNS+B7YXXQgkuu6uJ00ce/7ablrFYs7m03UnGed+P1ASciQAGlwjuo+fE2a5lZO17yI2quoojaUVgf2NqisVD0IV1gwZiuNPpD8ugxrzx/6nTUN/v8da2o0oKGTybFw8jxAJIxwwrdtrujVaYMAyAdOwKeeApFetbxwhg92fRUds67TfNXFiuC/7Dj+GxEbJfUcJK5Ua7HsI6D3/GSmQeI6Dc6me/ZkLCJItf/QWQjbr8nDXHWw1tx/q1jdOAVd1TXRUxupnAGgUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(6506007)(41300700001)(6512007)(26005)(9686003)(186003)(53546011)(316002)(83380400001)(38100700002)(82960400001)(2906002)(966005)(6486002)(5660300002)(66556008)(4326008)(66946007)(8936002)(8676002)(66476007)(85182001)(86362001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1h1elprU01lb3Z5bmJEVE5pcTF4SnkzUnlNRTNvakRNR1YvbHhnTk1obWZz?=
 =?utf-8?B?eUhkenhXaUR1OU5Xdk5BdWJpTVN5MzJNUHIzY25Xd3k3NmdqbldLdHJxaVYz?=
 =?utf-8?B?Qm9RbXZYVXR4UWNvZlJnK0NGTjdncDllN0ttdG9mUE5Ea3E4ZXlCZ2xuVjRC?=
 =?utf-8?B?b0RBanlDbFovWUVRQ2tRZXQ1U2lSL3dia2dBNVkvYytYa2U2NzNTUkIwbW5q?=
 =?utf-8?B?emJ5NThlMEszOWFLbWo2T0U4ZGFRTC9OM1p5d29kbnR4NkVpKzlyV2hjNDNC?=
 =?utf-8?B?VUROcURwQ1BMNGU1TENDbGhORXhDUmw4cXd3cGhTalcvOEpiRUR3VXh2ZFVK?=
 =?utf-8?B?QlVUR1o4a1J2NEFqU2NrWlJNSXUwZGpkeU4rQnJqTm5uaHRiclZwS3B4UHlC?=
 =?utf-8?B?RW9MazNKUk0vQ1l3SlBHQ3dKQ1JwTVNLMGRSNHQ4bm9KV2ZCSFN6b2RlNHMw?=
 =?utf-8?B?RXVjUlRoSmVpQklNUHlEY0ZZWUlJZWU3MllEYmtoS1dMNlJDUC9RN3lPQkVB?=
 =?utf-8?B?VWdmdGloRDZwQmZTZTNCUDB1aDdwYmwwMWN5YTlPUVlyaE1teEpVVFNiaVNF?=
 =?utf-8?B?S2NBUHo5amVzMENOR3hRTG1lSENoKzVKeS80V1NIOGdrKzEvTGhGdDZzUjNk?=
 =?utf-8?B?TEI5dHdSY2ptQ3E3UFRDa1QyUjBpTGxhSUlIMTl2ZlNabzZoLy9NbUt2WFJT?=
 =?utf-8?B?SDgrNVN0b2doR0V0Q1VYcTBxdUxKQ0lPMmZxY3NoOU0wV004Ui9qdDVyS1Bt?=
 =?utf-8?B?dFRpWVVEbHZIUGE5MUEybEVpUWlIY3RXTG1lLy9Ra3RoUnNLNUNHdHN5UFhu?=
 =?utf-8?B?ZU5QQjcwMUhWMFBKcWZnY2NNSkI2NXNPbENkTGptbGhsUnkwSWJSNDQ4YnhB?=
 =?utf-8?B?aVU3SHU5RVY0MTUvcm5rdEI1dWFxOXAyeS9NWGYzMllHY0E3Qm16WS9OQXM2?=
 =?utf-8?B?aWFXcTc1aXc1MHZUTE44ZENMVFJOOHNENC9HYjVIay9WbWlIeWc2TjBhVTdo?=
 =?utf-8?B?MHhQa1JqYWYrMnVERGVzZ3ZVKzdONUlvT1NvV2RxOHFCTUM2TEo5V2JmNjZ2?=
 =?utf-8?B?d1dUVXJrRE8zVnhjS3FZdlliSXRHd0ZDOGtTVjJ4R3Y0ZzBhSldnbUZDMWRV?=
 =?utf-8?B?eGhnMWxvY0ozcTNybWpMUVJqNExKWXltSUxZd1lqTE5ZT1BtZjNhUitndURk?=
 =?utf-8?B?UjJEcURQTExmOGVlT0xISms5NlFldHJWKy96bXZUNEVpWUNkeWV6alZYRGlS?=
 =?utf-8?B?TlBLYkVUZVNuV0VlRnRMS0MxNzNPRXhTTitlU3Z6QmIwNm9heXRwVS85aUdN?=
 =?utf-8?B?N0Y1ZGpOeVFRWWw1R3lUU3M4TFlCVG5GK0UxWHIyajYraGhFOHlXN0dReFhz?=
 =?utf-8?B?V1Y5MEJSdUd3cndXZVZuSmZMK1cvZVNXMnFib1MzOXc4MktoZVd6K05BaWhz?=
 =?utf-8?B?Tk9hNHNjeHpBRFJSZFhCM2tGRE95OUdsbkNaSjVYVzdaYjNzZVFEVjlEb2x0?=
 =?utf-8?B?YUxKYzY2QUliSmdCZDRvLzUxeERBM211NUEvRGF3WERGYmFQVmRFc0VCVzY3?=
 =?utf-8?B?UGMzOTVFSEkxcVpsRG1YTnZrZ1Z5ZnNWUjFRbHpNOUpoOEhUaU5nY2txRnJM?=
 =?utf-8?B?OGJocmhhYUNjYzdYcm1INEl3YW40OGF4NEF2WDFMTWdDRUlubkJnSUEzd1cy?=
 =?utf-8?B?NTI4R1JTVXcrTUprYmlLWldEM2RrNXA0MjNyZ3VZS2I3dGxQcEpCU09GMjBC?=
 =?utf-8?B?UmgraHBmekMrVWptY1d1TzFCVTA1eFd0M05TK1B1MWtRa3owK05yRDEyZWRp?=
 =?utf-8?B?Zmt3VURWcUhWK1ZYNlZkYWl6YnIxM0NDRDlQUHNTTHU1a3ZOMzRHdHRIZEky?=
 =?utf-8?B?aUs5WFZkNHFsckZlYjV0Rm5TbWJqM3pYek01VVBjN1gyMlBMZHVSdDNWR2F1?=
 =?utf-8?B?d25oQlBFYlVQakJXWEpmYVdVY3JIS0pGUDhrNExybEltRmZQUklkY1Q4dkd6?=
 =?utf-8?B?M1BQZlNmalp0ckpkYm5FQXJUbCtJaWViQlBFN0hnQkxzcHVsOC9Zd2VRbzNz?=
 =?utf-8?B?RXdTT0YxOGhiRjZ2RWIrWGVFZE1rS2trZ0IwSXUrTWcyMGNCZG9YQ01vUHZS?=
 =?utf-8?B?VS9ybjlwWDJaZXNYVWVjMDJHR0FtbFY2MmFsb2pPMFFDa1VXZnd3bXErQVdi?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c54e0c-d5a6-46e0-9942-08da5dd5d9f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 15:57:09.4414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bNP4Kl7rf18KdwZoPwmvgdf77MWP5PYDIwwQIzlHXK+wBw5QY8gxabsSg1X8kGEeuYWtza5effsxzs64zrLug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6710

On Mon, Jul 04, 2022 at 11:44:14PM +0800, G.R. wrote:
> On Mon, Jul 4, 2022 at 11:33 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > Right, so hvmloader attempts to place a BAR from 05:00.0 and a BAR
> > from 00:17.0 into the same page, which is not that good behavior.  It
> > might be sensible to attempt to share the page if both BARs belong to
> > the same device, but not if they belong to different devices.
> >
> > I think the following patch:
> >
> > https://lore.kernel.org/xen-devel/20200117110811.43321-1-roger.pau@citrix.com/
> >
> > Might help with this.
> >
> > Thanks, Roger.
> I suppose this patch has been released in a newer XEN version that I
> can pick up if I decide to upgrade?
> Which version would it be?
> 
> On the other hand, according to the other experiment I did, this may
> not be the only issue related to this device.
> Still not sure if the device or the SW stack is faulty this time...

I don't think this patch has been applied to any release, adding Jason
who I think was also interested in the fix and might provide more
info.

Thanks, Roger.

