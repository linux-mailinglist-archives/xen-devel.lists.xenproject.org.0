Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827815F0A05
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414150.658281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeE7J-00068f-PT; Fri, 30 Sep 2022 11:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414150.658281; Fri, 30 Sep 2022 11:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeE7J-00065Q-MH; Fri, 30 Sep 2022 11:23:41 +0000
Received: by outflank-mailman (input) for mailman id 414150;
 Fri, 30 Sep 2022 11:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6brQ=2B=citrix.com=prvs=265c464c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oeE7H-0005yl-Jo
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 11:23:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 533daf19-40b2-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 13:23:38 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 07:23:31 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5229.namprd03.prod.outlook.com (2603:10b6:208:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 11:23:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 11:23:29 +0000
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
X-Inumbo-ID: 533daf19-40b2-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664537017;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=74AUi90DdxL6dGcaAMIOBr+kSPxXx8XY4KCnUqBMJWQ=;
  b=RehfuoKk5OMMhTKbD13zvoZ/MWMM+Scxw/eQe/qVSEv0KorbP1oVEiI2
   T16RvvrIL4PscO/dewjJQh5BCnKdOz02DlL+EpUY6WcN6DhCRRihodLza
   ugZvf+FVHyWiMX48ONwah7oJfEW1mqkHiruuuTGmzAXr4fhOh47tWGsXS
   I=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 81350636
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jIrfx6nFp0AETarqolrStkDo5gxfJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZUWrSMv3Yamb9f4twaYm180MEvpXQnNU3SQc6rn9jFiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS83uDgNyo4GlC5g1lPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLEMey
 KRfBWo3Qxmmps2/27y/bq5emZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFMZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r837SSxX2gBur+EpW/9tJEvUO/7VAXAQURfES0kaKEuk+xDoc3x
 0s8v3BGQbIJ3EWuRYijdwaiq3DCuBMAM/JXCPYm5RqRj6PY5gefLngJSCZbb94rv9NwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty/nuppsiyC3GSNlLGbSwyNbyHFnY6
 T2QsDI3gblVqMcRzri65njOmTfqrZ/MJjPZ/S3SV2Ohqwl/O4isYtXw7UCBtK4faoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhknTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:tz8LIqHfo+hTJUMdpLqFc5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg12w
 31CNUXqFhwdL5mUUtcPpZ0fSLlMB27fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="81350636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsUDK18RerMm3gKiQFA9lglvS3fqK52kemDsgDvpCgaYzqJsDRdPJ4B63AvvchAeXIatE0VSixZDyY/2vmvW/VuEyKWuAVBoyYO2s/MS60+AazecqKXFk6PHBBp9l35Ot5c0eI2sNf1bfJIxtGxadJZA8xHQzTBHmRZS9/RTVXDRQrwZ692wIPKfLqVZFl5PChWfcYq4dPCW7R2S9ze3HXE8ueih4pLJgMPc3g/25zV9UwDOK8yx0//ohPUwaedGxtUOvWDlc+vjLbc5Scw+kgLZsBUUFWnnvFGq7IuwA3vRtNiAXAbyDtE31Qp1etd+nqMpPjP+KHRZibpKE888uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDSz2XNfzQl42ZLB5NRyxoIDse+60zT/s21jP13h+WI=;
 b=Xa0tbglmE6FS9PVPM32J/1JyvDnhTCcWUfW17h4YAfwMjC4Hg9nbtCYSWsquJu+evxQaDKmZhTdfTQSb+mbz4dRcw9C9leCiO6hvy2mc7seevdsEae2aj2xYuAn4e28AIiplOOSRJi1ToRz6fcRgJs/uR6TTT65w9iL+IG3N0qdopknBkDu9RDqHwqjGgXC7UttIOLYdgU80B6dCcubcWLhYpLkxPatTM7AD0KLL8WU4YvJTxEgnu1lChhZJwjaz7BQ4p88k+4kqPDrEzM5tWSaRMmPHmPW/2O9NbVV42R5gyOHsKmZ92lwpBYTqZUvyYAeO8grUU1zGAOZsfiHguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDSz2XNfzQl42ZLB5NRyxoIDse+60zT/s21jP13h+WI=;
 b=aQ0JBTiOimfZxdJu/kQrHc38meDXnHDbbYqskqHQpP8Tz3skMiPMdJwzuSeZVNJrdX72NAX8KfGihvWb3xeol8lq7TSM/U8nIMwzEBEnvGgEw8JtDXJMTe/hH3H0cl0ulxjoPAkTLdRPjbOP23Iw+kOtwk0oA+FrncUXtxE88wg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 30 Sep 2022 13:23:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [xen-unstable-smoke test] 173362: regressions - FAIL
Message-ID: <YzbRrH9+TVmlbtKP@MacBook-Air-de-Roger.local>
References: <osstest-173362-mainreport@xen.org>
 <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net>
X-ClientProxiedBy: BN8PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:408:d4::26) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5229:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f9178a-7e4a-40b5-02f6-08daa2d63313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gBrtRdwmbtnEVEDDjnsE8q50ui30eNpeiupY7yqMrxGUwE4CaOwCIctW9tX8L97w9DkT3l9ysE+UF9lZj33hl/ZouRgIrmlrYbOvYJWYDDeTUW8kU+y5AaXR+Dx6uNbCm86Y+5O/iGtoVF5+3BEzoperZnf132C3S0eII7C+ACvDL0dRAQJQ92qiXD4iy8YwdVjmNUK7nMn94zYz09JnnoXQ9TVp9bQ1o2VJBXmb0TnpV/nyLem0QDQ75EkGMmPYdpE0RGlVLm1bHmPuCaOV5aNdPibFn6WgUAoGHNr8HZHEWaTdRKNUy6am0AOpAxedgw3J5GssDEjfAb0D+E6qXlcjtyU/hq6UfqOv4R4Mf9nQMhL/fn1UWS36wsYwrZAMg5Cv3atVg4HXtRubAj44MGLkx9MmUnQOAOUVQefnA8qh499KgRCh6liCKT5rIcVPpDRJ8lvkjQKgjp4Bgtt+FzJF2yH1m6jD3eO0WR8vK155CbUmtPQz+wEMyNscUWEdNbTm7U+LXRx4tVAhQGtzrx99uUajxLCOCh7vUmSaZfykZFrd2Q+oBmH4Vmm/P0kCFHS5APSUSqX1DMiRsueBKAJCr+jn+wWLGA1X33HICD897DLp//LBUG4fbIIEpK/AZ8XZoUIaR2tmtQI5C5bqJv1MS9mojO4mkZuGubNSYTLTNL9E3bVQsieCNR33Ce2OtgyOJFzwuLcoG4TY5T8RXf9EgPi5b5npMom0Q2taQCdkfgdP9QanhmjLzDXnAijvPgJBYu+78JW2Qa8IiCAnpJJKNXWoAPBDaDaMYTLXu5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(6512007)(316002)(54906003)(66946007)(66476007)(66556008)(6486002)(966005)(8936002)(5660300002)(8676002)(4326008)(53546011)(6506007)(478600001)(6916009)(9686003)(26005)(41300700001)(6666004)(82960400001)(85182001)(83380400001)(2906002)(186003)(38100700002)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGUvY0NWSDB5cG0xdlFMTVJYMUNyVkkxN1V0Sjl3YkZQeUVlSmNpUXBuaUJH?=
 =?utf-8?B?MmZxUG5UL0swcGxoZCsrclVKL3hicFJtaXBqVloxbHVEdkdPOWNybFltV1Z1?=
 =?utf-8?B?L1FuQm9kckJzUHJUMFdOMVBVZXlhS3pwNFNONm1zQmZVOEs3NUUySGNJZGt0?=
 =?utf-8?B?Z21WaWxucStUU3UvWVVRc28xbFgzbVkrUUYyVkV6YzlJWWY2QUJhekt3SXpE?=
 =?utf-8?B?WmtQVFRIeFZTTk1OMU9DSnBNLzRDbEVhT0QyZlFqS2phV0JVYVpsZU5tWEVs?=
 =?utf-8?B?Q2l0bGtSSmY5U1RPdGFiNWtNd3VEZmFzUHF3VTl1Y0dFRFNOV3lmdW9SOVE3?=
 =?utf-8?B?REFCOTdqei9aNlNINkZyQk9KR1ROYjh2NXJTVWRVT2JFTXFLSGNDbjd5R2dV?=
 =?utf-8?B?OVVjK2RnWXhleGowbGxNZ2JxeFJuSjdwSTNKajhja0JST0YzVVRHQnJzOUJs?=
 =?utf-8?B?d1VSczVIRGJLSndIVWI1bjZLZ1RsV3F1MXcxTlA5VDJOK1krMjh5Z1hDbVU3?=
 =?utf-8?B?NXQ3TE5jSDFMVFcxVGxhUW84enhoYkdZOEY2bG04c0d5ODBrd1hxRERPcnpu?=
 =?utf-8?B?R3l0UWR5YmZKTzhoS0s0QlNLT0w4M01tblVLa3RHeTMvUUJYR3lGNHhYMlA1?=
 =?utf-8?B?MENUdXU5aWROT09ZQ1g4aHcxbkx0eVFvL2tvK3NMVlBCNytscUpMOG40YlFq?=
 =?utf-8?B?WktnTUFQQi9ZQzcvbndBcTlXbEdzY1piNmZ0ZTZCTmlDVzhhR0xSeTN1N1l5?=
 =?utf-8?B?a09uNlhhNzhzY2N3UUp0N0JoUHpDRExJQnp3THBCVk5jRHFjL3pCUWJTUHE0?=
 =?utf-8?B?aEt3c3FmblNsVU1PNGdOQ2tOZlNJZjNMRlQ3dWgxbHJMQ2ZGYzJsWmV3b0l4?=
 =?utf-8?B?d1g3VEFSSWkyZkVLZkVDNTVVeGJwTnpmMUwyZlcvcmtMTVRSU3N2U1J5ZEFr?=
 =?utf-8?B?YW9qajc3UnVWRkxVM1VLTDFDbUxHemQvR29qaU82NWtTMGcra0VqRmx2MHhO?=
 =?utf-8?B?MEZTRGRKT2dvWXFTK0p5VGE5YUptdXl4L2xqZVdrL1pGZ0Yyd3IwdG53TVBY?=
 =?utf-8?B?eU51MHVTTlk2K2ZvWjBpMjhpTDhiMjNWbVFIQmplU3E5Mmt5SGt4ZGpBSnUx?=
 =?utf-8?B?aTdWRFdMVHRUVFh3bVkvUUliQTl1eS96YzVkTGRUOFVIZWZqb0l5Rkx3RkVN?=
 =?utf-8?B?cWx1VU4zUEZiT2VLYTlCeTgrd2NJck1QYlJaMnZaWS9lQmdJMVhmUlg4VUln?=
 =?utf-8?B?aGV0WHdPZFRXSzFVQlZBNEd6cnRrY2NhY2VRSC8wYlR1QkxPYjVleTVMTmJh?=
 =?utf-8?B?Qm5RNU80dHVQdnpnNWRZaWhOaktJdXhmSmRJTFN4ZHF3NjFOL3B0bm4vWlIy?=
 =?utf-8?B?a2drS2ljNFFmY21hSmlNOWtnUzJvZnJoQnJKQmhMYlNjTWFqdmpTSm1Wb0hh?=
 =?utf-8?B?Q0gvVktxMlI2RFVnRWlmNDlpaEdYMGRnZi9iUHhVeGJjVFpFbmZxOGxKQ1Vl?=
 =?utf-8?B?MktXK1RwVDEzQWYzTjVud3VhRFF2NGVGWThFWkVyQjJtSjVTRG00WVRDcXJV?=
 =?utf-8?B?NWZTaUNaU0k5UEJBT2tjWmlTc29UditKN2JoNXlYY3lwVHBCVWoxT3dPNllr?=
 =?utf-8?B?eXMzc0hJVzlRWnRKeWNLcllCaGUzMlVMb0tLbW1zMjFEbWNLUkw5bEt5ZkVB?=
 =?utf-8?B?Q2lBaFFiNWFjaE5MTmhlS3B5TUtSaUkwd0hDaHRHdXdFVlAzeFVkVHlKSDM2?=
 =?utf-8?B?cStNZ084TzdwWEtjZHRlcEMzRWN6NjVydmZhNWxOTzF3cG9Fd0NhQ2d4eGRm?=
 =?utf-8?B?azgxZkNiTm92SklqR045WE55dUJlUHQyK2ZHTXNFYlhEd2wzN2Z5RGtIQ1Mx?=
 =?utf-8?B?R2h1aWJSRnM5bFZTTGd0STlVMWgvRjJFNU8xY0hMZTgzdDFNaGtUTTdqRE54?=
 =?utf-8?B?TllaQWdCR1JHWXF5bTI4UDhncXlLUGd2djUyZ0p1QXpmSFh5K09MVjlRUVdq?=
 =?utf-8?B?WTJMSGZBS1hyOGR1UkVwTitWMjFYMjhSSXNNcU1qUWtUalZ2TndwRzhjaUdl?=
 =?utf-8?B?ZklPMW1xTjY4UVNVYThIUkRUMlpySkpyd2xaQzBqbzRLaUpzeWtDK21MU211?=
 =?utf-8?B?ZUh4Qmc0RWhvMHZSb2RZcXhKMTFwenhpcmlvU01XalNqTGdNNzhhTExFQWNj?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f9178a-7e4a-40b5-02f6-08daa2d63313
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 11:23:29.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bTZHx/dJwaGNfd1dJfS162Tu9AoM+wtESae8/NErZpruef4ZProx7REO65doOyibvgfMm+wxJCzbZaZJc0Oeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5229

On Thu, Sep 29, 2022 at 05:25:29PM +0100, Andrew Cooper wrote:
> On 29/09/2022 17:22, osstest service owner wrote:
> > flight 173362 xen-unstable-smoke real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/173362/
> >
> > Regressions :-(
> >
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  build-arm64-xsm               6 xen-build                fail REGR. vs. 173347
> 
> arch/arm/gic-v3-its.c: In function 'gicv3_its_deny_access':
> arch/arm/gic-v3-its.c:905:32: error: passing argument 1 of
> 'iomem_deny_access' discards 'const' qualifier from pointer target type
> [-Werror=discarded-qualifiers]
>          rc = iomem_deny_access(d, mfn, mfn + nr);
>                                 ^
> In file included from arch/arm/gic-v3-its.c:24:
> ./include/xen/iocap.h:32:52: note: expected 'struct domain *' but
> argument is of type 'const struct domain *'
>  static inline int iomem_deny_access(struct domain *d, unsigned long s,
>                                      ~~~~~~~~~~~~~~~^
> cc1: all warnings being treated as errors

Hm, sorry.  I've tested on gitlab but seems like I didn't hit that
combination.

Roger.

