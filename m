Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFBB51A17E
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320775.541688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFU2-0002Nn-OI; Wed, 04 May 2022 13:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320775.541688; Wed, 04 May 2022 13:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFU2-0002Kn-Kc; Wed, 04 May 2022 13:56:02 +0000
Received: by outflank-mailman (input) for mailman id 320775;
 Wed, 04 May 2022 13:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmFU0-0002FL-PT
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:56:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebd0b924-cbb1-11ec-a406-831a346695d4;
 Wed, 04 May 2022 15:55:58 +0200 (CEST)
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 09:55:53 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB3802.namprd03.prod.outlook.com (2603:10b6:5:50::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 13:55:49 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 13:55:49 +0000
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
X-Inumbo-ID: ebd0b924-cbb1-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651672558;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d4jzifbCRGSYi4KfZ1jOo3Xe24gNsjZCXv1fPF5OC8k=;
  b=J7virZJpjez2Rqfu1XYZiS4DIm6sh66D5kByxG/8dkoVXPYXQZNin5rn
   gWhuqGPaFfHinBRSC3UtDZ2bXbItlwMG1tpjMuxg7boaEfhM9UD2YWJQe
   GRGY+KgyViEJAio6jZzA1Op3IHcsspNU9L/wPyT3m2tZblxY0e4DSOXci
   0=;
X-IronPort-RemoteIP: 104.47.58.176
X-IronPort-MID: 69950537
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mur9R64s/zBnHLhLlEO+ewxRtELGchMFZxGqfqrLsTDasY5as4F+v
 mFNWmCHPPeKNjPyeNsgOY+xpENSvcfdyN5qHQBpqi0wHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXhX1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSyTiktB6z1x90tQgFIDhpSZYdD0a7udC3XXcy7lyUqclPK6tA3VQQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YHgl/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2MJ+Q/N+PFoi4TV5F11k57EHfXFQOeLe/dft0+Sh
 iHs+k2sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRxSlpFaUsxhaXMBfe8Ul7Cmdx6yS5ByWblXoVRZEYd0i8cUwFToj0
 wbQm8uzXGMx9rqIVXia67GY6yuoPjQYJnMDYilCShYZ597ko8c4iRenostfLZNZR+bdQVnYq
 w1mZgBk71nPpabnD5mGwG0=
IronPort-HdrOrdr: A9a23:7XvjpKqJ85fFrPNg0SA1UuwaV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,198,1647316800"; 
   d="scan'208";a="69950537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfQQbnww9kv/59hfsb+3CuC37PXX//RiGCrKisfPhiR7mGWmAGjawLAqIXS/spVbgUzXWnzrtSMn7zc6o8I1tMTNHh6ohRSVtpFjgPzdO+cRlHCjy9dNX7uTF670no7Bxexu1TNNHN1AcMfk1Or7FXPIn73GMXJ5zSjanCmIUximILoif1CTKnrjbFtNVuB32BdxTkWVCWcuczXnavF65m/EOX2Y7hnsGXWeLxtaloKxtzU1UCmLpHsTr0VugyTLg3vxtOQYgBVgEznxBR/meTD4NQSE7wvB8qwMcBO2vjGjVBGjNt1+InmXNW1yU6EPkoo7/elMr5JBu1kx0cnCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ1GIAIcILvu1VTg7Kv7YpbGZ4BPwhFXFVKbWwZ7Haw=;
 b=WAHEcESXe6ASaNpZGvkYY5QrvvQ5vQwk8e0BXlFI7grDRAFebhO25fH9Fr+7PlXzE26koTurWm3FF/of/BsOo12tGT0502ijRVkhap4Tz3KTK8qiZy5XIMpnnLDeiiPR13BH9MaTu2bI8AiBo8eI+T/UHCshPJb+4U0I9s2DK/G2amaNibcrFU1dITvnn6+8sTpQ0mEmLcC61UEtyLIw7JvY8mqAyA/9Qm6OHFl5HIMMs7cRALI7OdPAkliKpiAXdNirz2GV0hszgXJTk7kRFHDMIOMl/JY+9gAfs7IeDGyRm40DVj8goWHDL6M5AKpaZXodzoMRzVBJB8+uDoWYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ1GIAIcILvu1VTg7Kv7YpbGZ4BPwhFXFVKbWwZ7Haw=;
 b=ZHBgtTWzu9XktaLSpohkh2m7chcwa28IfglAuSdfF0yGIeG8nrQsxSDYnYP1U6T8DYrRa/CW5PGIqlZPBGAsY/5VUcziZOXU32RkUL/0YAR18y2GgaBESMefU0wM4FcuP4PFxHnatPJcWMx8zsMSB2K24+97TX49ea2bqZmLgnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 15:55:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 06/21] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <YnKF4fZklCyoKRr7@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
 <YnFBDsEdaMiMv+8O@Air-de-Roger>
 <73aabaf9-4509-53f9-8af4-354fd3d13fb3@suse.com>
 <YnJhYJSZ2IXxPEyz@Air-de-Roger>
 <7675bc21-e951-0d75-844c-94ddf47dd343@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7675bc21-e951-0d75-844c-94ddf47dd343@suse.com>
X-ClientProxiedBy: MR2P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a33afb-7479-4c8b-b41d-08da2dd5cbd1
X-MS-TrafficTypeDiagnostic: DM6PR03MB3802:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB38023CE9A8C1EC49859D6AAA8FC39@DM6PR03MB3802.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RyN7UC+Z2Saux2MlihYQXB2pBQVs8MN9+n9gmkk3NHC83k9FiUPFKJptvpqNhvnYHMPmPOgZee/M/w0q6J3Q9HzP5BmQlvW/R7yLZAGp4NCi8nqUuWpgiVF71Kk/GU8JKuP65EL5tkAKKcO7GLu9+/AjbBCeNMYj/+PwmtkP0GgGjlG2BITcKaNnM17ilmxeOmEcysEZ14bCj12u4A7HeNyVS2Fvkq54vyHCxV1S+aeC7ByPOCHmNRVyOkTy5WxttRNia57q6ji6NBMAwW+mVI6S22UrYD4Yg1/SvIj9EhCx2OvKbTKEFy1DVzDfYz4V6yG+r+LLI/L3BZJQLbc/6CHHdXCYMFtdyoKWYmXd3xzGjr+ItO5xS/o9kjDTIbjSXx0Zn1YlwA1N6k1q2nT09L/vSOXcTdnAZr+CpVZqd2cdMnDBYWN8Z/UQ9h5ikVfLVHafQvRITYjpz9Bswyqxl6xzGTRhGXsHfMApWnhiF7Kh+f+O/iZz6CtfG0AkDrr2pn8Rh5zAUNNaHuV4QkICwQYP/ajE+rfLXtfz34ndpzWWZWHMx+JqJiwQX/AudtBtspPKezeaNrTv7YAY1d8m7LmQT3aX5xBzH6xvsEoa01dKnRscnfFd5aB2Q1R/VClypKMIqzoFE99OULikO6BxZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(6506007)(6486002)(9686003)(6666004)(6512007)(83380400001)(508600001)(5660300002)(8936002)(85182001)(2906002)(316002)(8676002)(6916009)(66476007)(66946007)(66556008)(33716001)(38100700002)(53546011)(86362001)(4326008)(82960400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjVYclhxQU9TNVJqODZrcVBmSmtIeW56YjJFUUphclNYYmNzQXBmUG4yZS82?=
 =?utf-8?B?TkNkOEhZY0RLcnNubUZDdlFJUkhRVkJPZ2ZxM0ZacS84cXh4dUQwbDNFbWY5?=
 =?utf-8?B?dEZ1bWI3QUxHSTVhZEFVTGxxY0ZicUFsQkUzcnFSeElZcWhUc00wS1pyTlFo?=
 =?utf-8?B?MmVuSm0rNDRXVlNId0xEWWVZV2pxY2IwdHFLdi9zZWQrSkh2dUJubDZockJU?=
 =?utf-8?B?dDlCUVNuSzNqNTB3REw3TXVBc0lWMkJ1MlVERzViM1dNUlJvYyszcGtza1Fy?=
 =?utf-8?B?VWdCb05jVXY5TFd4aUF3NFhmTndRWFZZVnltZk9zS2JZQk84eUtxK2kwR1Vq?=
 =?utf-8?B?SnNBUlkrcFJhZmRnWjlLZlB4RDFJTzJud2FGZytoaENjSmdkZ1ZVRWZOeGRB?=
 =?utf-8?B?WEIvclFxSlZmMnB4bFJ2d1JtbFI2Nkc1cU1BWVAraUZuc3lsZ3ROdkRvOGs3?=
 =?utf-8?B?OGZ6bjNYeHgzL2dpRytSQTdmLzFEdVduUTR6a1l0ZTV0UzRGdHkwU3dqeXda?=
 =?utf-8?B?QkJQMEk3S3p3allFdGtveWVENHhWVERsWVRILzhpWVNKT3JHeVR1Q0x5dUIy?=
 =?utf-8?B?ZFpqNW54WHRxaERzR1JQbkJvN3hCMXdHZlowbHR2bll0cFdjRkJmMkg0MHdl?=
 =?utf-8?B?dytBZlVoTUxqQ2RKTStvWVBpTjdzeFQxM01ianRVanFVd2F4UDR1SUdURndR?=
 =?utf-8?B?SlhWYlpKWU9aTGZmOG0vRXZyNzJuQnZmWWNnRVVmZG5hSUtqY2g4TnJoait5?=
 =?utf-8?B?UldXQmZWL2IxeUZSaHpEaFZGai9vaTBacC9wcVFwdUluY0xxbWZ3RVdGdzcw?=
 =?utf-8?B?UU5yb3Y3WUkxSEhNYWNPY0NWNGNicTMvQjhRMnlhMkg2aWhSYlFQSWVHcnhB?=
 =?utf-8?B?b21NcHJyOUxGOVpvR3NTWm83RVhzYm0xek91dnFGUGJ1N0Q3QU1VdnFYRGhu?=
 =?utf-8?B?WmxWOTRFZ0R6ZHg2QnlkWmZ4SWh4bk5yNFUxMVo2SlhMSUsvR0grK3Y0QnVY?=
 =?utf-8?B?KzQzbWloSDd3T0ZyeFA3TXdFTjVHZGgycFdCdDNFQmU3eWsxdVBxZ0k3eDNX?=
 =?utf-8?B?b3FJMFk5T3FuNlFiODhTUnpSUm1YR0k5NUxGbm1ucXRsT2xqdy9hRnpKN09a?=
 =?utf-8?B?djVlN0RwYWVnd0lXRHBGVUV1aEpQaG9Mc2xMM2ozVkxSaGRvK0ZxNXBWajk4?=
 =?utf-8?B?blZYNEN5VGJLVFZiVDA3N3pyaGM2MDg3eWNsQ1g2VnBUOWpsaGtjcWdGRXIr?=
 =?utf-8?B?cXI4NmFCSWpoeUdOUU9RemkxOWlUYXpxRVFvWFVoVzNIV2RjT295Z2M0U1hY?=
 =?utf-8?B?Y0VkVVpsSmhYd0pLSU5rOHdiZHZPdXBDNVBnbHJBWEVnNmEvMWZaUjA2dy9k?=
 =?utf-8?B?RDVISkRIZG1lbVJuWFhXNGZDeTlLQjQ1K2o0OExrajZLcmthbFlUVzZiVGIr?=
 =?utf-8?B?OGRFRHl0eW01eVVNbWxwdkdwaWxRazVKQ0lCVHNGK3JlczQvRUJvODM3cEx1?=
 =?utf-8?B?VzNDbGJjS0t1N2R1Y3FDQmN3N0NKdmM1TTN5d1N5dzNSQmxheVh4TWE5ZWFZ?=
 =?utf-8?B?VzdzcERna3lQWVBpUFpZWXdtandYMWxRVnh0U2JTRmQwaUhMVzgyV1ppYzJK?=
 =?utf-8?B?dHRvemo5T2NNQnQyWTJRYk9RTjFVcGRpSDhTNnp0N0wxUDF0Q1NTeTFTelVw?=
 =?utf-8?B?T3pVK0MzSDJzb0lJUEFsRm51UmtuQzI3bzVpVTl1NWo0Y2NQSTlHNXVPZG5i?=
 =?utf-8?B?eUhlR0FvcFcxVmpvTXdEc2wvNVA3aGFRWkIzZVQwWS9yRnJISHlac0hKZjJx?=
 =?utf-8?B?SUk2OTE5VVovdDdqeUFKVkFNanJpTXloM1lUbWdNeTNSdENtaGFhK01PdzFT?=
 =?utf-8?B?YUdBOHFhLzRMaHNjMVkwQU9lOUV0U2xMY0ZvZVhDdml2czdhSmdZOVkyQUFX?=
 =?utf-8?B?YnMwV2R5amFpNjIvOGNYWElOaGlCTTRSaGd1Q3JxRzV0ekVoeXdmRVplZm9P?=
 =?utf-8?B?MU1ReHVTYzdWT1FjWmk0bjBVeUt3ZWkzVGxwSUdHbUN4Sk1SeXZCTFN0Ritp?=
 =?utf-8?B?SkRqT1BHdGVvN1MrQjJrSUJ5QWxUKzdtQy9obit0VlJYaWw0SnhrdW85ZWNw?=
 =?utf-8?B?UkdiOXFrVW8zaDFVOWZqcm10VVBPN29nMG1XbVgreEJPUlZqaDEvWVVKWXY4?=
 =?utf-8?B?RTJtelV4TGpjQ3N5OGxCUW5XelErUlJlWHN4Umh2NmFDL0RiZ0dlU0tKSUU1?=
 =?utf-8?B?ZmZTWFVZUlNkcG9nY083NTVmd1hEL3MyQmlyeGt2NW5LcEE3ZXVJaE9waGxn?=
 =?utf-8?B?VnI4bzRtNTQ1bTQvSVNoMHEvRDQvaUo1aCsyM2lJOXp0THIvNEozaW1xdngv?=
 =?utf-8?Q?MYl8r8p2JE0SmiSU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a33afb-7479-4c8b-b41d-08da2dd5cbd1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:55:49.8398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNBinIK+1xn2m9Ic3hi+hgloKZ/wyKuN3rebcbUBV4LvBQ9VY4WBRP/NTvgyOkJfa3lsvEL9RO71PCueu4KEhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3802

On Wed, May 04, 2022 at 02:27:14PM +0200, Jan Beulich wrote:
> On 04.05.2022 13:20, Roger Pau Monné wrote:
> > On Wed, May 04, 2022 at 11:46:37AM +0200, Jan Beulich wrote:
> >> On 03.05.2022 16:49, Roger Pau Monné wrote:
> >>> On Mon, Apr 25, 2022 at 10:34:59AM +0200, Jan Beulich wrote:
> >>> It would seem to me that doing it that way would also allow the
> >>> mappings to get established in blocks for domUs.
> >>
> >> ... then this would perhaps be possible.
> >>
> >>>> The installing of zero-ref writable types has in fact shown (observed
> >>>> while putting together the change) that despite the intention by the
> >>>> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
> >>>> sufficiently ordinary pages (at the very least initrd and P2M ones as
> >>>> well as pages that are part of the initial allocation but not part of
> >>>> the initial mapping) still have been starting out as PGT_none, meaning
> >>>> that they would have gained IOMMU mappings only the first time these
> >>>> pages would get mapped writably. Consequently an open question is
> >>>> whether iommu_memory_setup() should set the pages to PGT_writable_page
> >>>> independent of need_iommu_pt_sync().
> >>>
> >>> I think I'm confused, doesn't the setting of PGT_writable_page happen
> >>> as a result of need_iommu_pt_sync() and having those pages added to
> >>> the IOMMU page tables? (so they can be properly tracked and IOMMU
> >>> mappings are removed if thte page is also removed)
> >>
> >> In principle yes - in guest_physmap_add_page(). But this function isn't
> >> called for the pages I did enumerate in the remark. XSA-288 really only
> >> cared about getting this right for DomU-s.
> > 
> > Would it make sense to change guest_physmap_add_page() to be able to
> > pass the page_order parameter down to iommu_map(), and then use it for
> > dom0 build instead of introducing iommu_memory_setup()?
> 
> To be quite frank: This is something that I might have been willing to
> do months ago, when this series was still fresh. If I was to start
> re-doing all of this code now, it would take far more time than it
> would have taken back then. Hence I'd like to avoid a full re-work here
> unless entirely unacceptable in the way currently done (which largely
> fits with how we have been doing Dom0 setup).

Sorry, I would have really liked to be more on time with reviews of
this, but there's always something that comes up.

> Furthermore, guest_physmap_add_page() doesn't itself call iommu_map().
> What you're suggesting would require get_page_and_type() to be able to
> work on higher-order pages. I view adjustments like this as well out
> of scope for this series.

Well, my initial thinking was to do something similar to what you
currently have in iommu_memory_setup: a direct call to iommu_map and
adjust the page types manually, but I think this will only work for
dom0 because pages are fresh at that point.  For domUs we must use
get_page_and_type so any previous mapping is also removed.

> > I think guest_physmap_add_page() will need to be adjusted at some
> > point for domUs, and hence it could be unified with dom0 usage
> > also?
> 
> As an optimization - perhaps. I view it as more important to have HVM
> guests work reasonably well (which includes the performance aspect of
> setting them up).

OK, I'm fine with focusing on HVM.

> >>>> --- a/xen/drivers/passthrough/x86/iommu.c
> >>>> +++ b/xen/drivers/passthrough/x86/iommu.c
> >>>> @@ -347,8 +347,8 @@ static unsigned int __hwdom_init hwdom_i
> >>>>  
> >>>>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >>>>  {
> >>>> -    unsigned long i, top, max_pfn;
> >>>> -    unsigned int flush_flags = 0;
> >>>> +    unsigned long i, top, max_pfn, start, count;
> >>>> +    unsigned int flush_flags = 0, start_perms = 0;
> >>>>  
> >>>>      BUG_ON(!is_hardware_domain(d));
> >>>>  
> >>>> @@ -379,9 +379,9 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>>>       * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
> >>>>       * setting up potentially conflicting mappings here.
> >>>>       */
> >>>> -    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> >>>> +    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> >>>>  
> >>>> -    for ( ; i < top; i++ )
> >>>> +    for ( i = start, count = 0; i < top; )
> >>>>      {
> >>>>          unsigned long pfn = pdx_to_pfn(i);
> >>>>          unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> >>>> @@ -390,20 +390,41 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>>>          if ( !perms )
> >>>>              rc = 0;
> >>>>          else if ( paging_mode_translate(d) )
> >>>> +        {
> >>>>              rc = p2m_add_identity_entry(d, pfn,
> >>>>                                          perms & IOMMUF_writable ? p2m_access_rw
> >>>>                                                                  : p2m_access_r,
> >>>>                                          0);
> >>>> +            if ( rc )
> >>>> +                printk(XENLOG_WARNING
> >>>> +                       "%pd: identity mapping of %lx failed: %d\n",
> >>>> +                       d, pfn, rc);
> >>>> +        }
> >>>> +        else if ( pfn != start + count || perms != start_perms )
> >>>> +        {
> >>>> +        commit:
> >>>> +            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
> >>>> +                           &flush_flags);
> >>>> +            if ( rc )
> >>>> +                printk(XENLOG_WARNING
> >>>> +                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
> >>>> +                       d, pfn, pfn + count, rc);
> >>>> +            SWAP(start, pfn);
> >>>> +            start_perms = perms;
> >>>> +            count = 1;
> >>>> +        }
> >>>>          else
> >>>> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> >>>> -                           perms, &flush_flags);
> >>>> +        {
> >>>> +            ++count;
> >>>> +            rc = 0;
> >>>
> >>> Seeing as we want to process this in blocks now, I wonder whether it
> >>> would make sense to take a different approach, and use a rangeset to
> >>> track which regions need to be mapped.  What gets added would be based
> >>> on the host e820 plus the options
> >>> iommu_hwdom_{strict,inclusive,reserved}.  We would then punch holes
> >>> based on the logic in hwdom_iommu_map() and finally we could iterate
> >>> over the regions afterwards using rangeset_consume_ranges().
> >>>
> >>> Not that you strictly need to do it here, just think the end result
> >>> would be clearer.
> >>
> >> The end result might indeed be, but it would be more of a change right
> >> here. Hence I'd prefer to leave that out of the series for now.
> > 
> > OK.  I think it might be nice to add a comment in that regard, mostly
> > because I tend to forget myself.
> 
> Sure, I've added another post-commit-message remark.

Sorry for being confused, but are those reflected in the final commit
message, or in the code itself?

Thanks, Roger.

