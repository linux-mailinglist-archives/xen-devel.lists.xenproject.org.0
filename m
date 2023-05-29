Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D866D7146AA
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 10:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540580.842422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Ycl-0000vX-Eb; Mon, 29 May 2023 08:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540580.842422; Mon, 29 May 2023 08:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Ycl-0000so-Ba; Mon, 29 May 2023 08:53:07 +0000
Received: by outflank-mailman (input) for mailman id 540580;
 Mon, 29 May 2023 08:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxNl=BS=citrix.com=prvs=506ffa617=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3Yck-0000sg-5d
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 08:53:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37f89c1f-fdfe-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 10:53:03 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2023 04:53:01 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6355.namprd03.prod.outlook.com (2603:10b6:806:1b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 08:52:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 08:52:58 +0000
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
X-Inumbo-ID: 37f89c1f-fdfe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685350383;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+ogx2VbmbtIDEHz1VDdQI/OS63in2EM0sFzGzchWDy8=;
  b=Fonl6jrjtzI0eh7Gnc3g8FIxrVzs8yJ5V6D6bCxAa9B64tzOvCMMIiA1
   tZuAw9HXgGlrd5U5zqCXQaC/yhawMkYLPDN9sls5fZyvgkssuW+6bJ2sl
   RX79rM3dK2beaLGom7hnl/yrFz0nlMxxEsOn5gO2CvuPotXrczo6BhOhH
   M=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 110108251
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:flBzlK2btvjtRI4eT/bD5cFwkn2cJEfYwER7XKvMYLTBsI5bpzMGm
 mFNXj2Hb/qPZzD9etBzO4/l9U1U7JDcz9NrGwpppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLEty0
 f0hOjAxVRXfrrmU0vWKEMl2mZF2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kkl0ZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137eWxXOhBdt6+LuQ+q9z3E/QzVQpFxxOd0alndeV1hDvcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbQGDq5WQQHOZs7uR8zW7PHFMKXdYPHFVCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZsjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:L8G2rqMKNjMswsBcTnqjsMiBIKoaSvp037Dk7SFMoHtuA6qlfq
 GV7ZMmPHrP4gr5N0tMpTntAsW9qDbnhP1ICWd4B8bfYOCkghrUEGlahbGSvAEIYheOiNK1t5
 0BT0EOMqyVMbEgt7eC3ODQKb9Jq+VvsprY59s2qU0DcegAUdAE0+4WMGim+2RNNXh7LKt8Op
 qAx9ZN4wGtcW4Qaa2AdwM4dtmGid3XtY7sJSULDR4/6AWIkFqTmcXHOind8BcCci9FhYwv+2
 jdkwD/++GKvvyhxgXHvlWjn6h+qZ/OysZjGMfJsMQTJzn24zzYHLhcZw==
X-Talos-CUID: 9a23:v1mvVm5JkREVvrdIZdss2WQoPsEcYH3h93KMChSaGyFYEp2PVgrF
X-Talos-MUID: 9a23:MzCBSgbaqTpwoOBTu2712CMhP/9S/KX2Kl0Trbsq55fVHHkl
X-IronPort-AV: E=Sophos;i="6.00,200,1681185600"; 
   d="scan'208";a="110108251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnMj1rbF1HdlNpVldcjP0zKLuocujjQmrTWMgX5qsLRF9jfFSre9+etl4DpEztRd5QfzE1VpDuPy5e4gRalQzgZIdbpxg2FSwfCtwBpZ9N2jZIcqUPcuTVYTcRhCbCjVg/59BSnoXW0ow/RE0XiOpDelcemeOdkn07LnDlSeK1Z1fzEsrJO3iVuOA0qg1UHXuuSzJiCCPcI+CdmQBu6xfY8pm6ZuKpeVaQFWCScUe4ML12hSSaTCYWlKTMjBcWA7GH7+AmF3h4gMboofk9YbDcLRxEo4xgG6iSmcNtfaejGtCWxenkXvipPuVwt9uqPtmqzK1W21ZD61h0Gd6QvBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlxRk83gRDW2cqGmDzUxNl8Bv4umjbDDyyOgrnw3Goo=;
 b=oCA/tbP2wuYbyHL3Gklq1OSp0FDquRwHWmsLdLanYou+xiRRpLKsPcDkwhJRdVmi+C2cl6M/GqLUg8kQFxQrxouPkoEfNrt3fTyY30pjOsussRfvX2IzdB/BXqHpc/Tw4NoqEbkYSJ4iiK94sWPPxz3biaWg3clnR8x9oHvPVm3OsK7yKEF5xDi8rCYnNJ5pfcHX08DIhKJIBS8tHbu+m9E0LNhEv3F6sDXJdD8YLNv0zCao0DiP/HQwdF1OirO3V0j1V+v0xT297XsdZc+pRUfcAG+4E+rKjc/5Xkb0Aax87uc40QCHCq9kG3N8FEkR9t47J/TD5Gadptmw3PD1og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlxRk83gRDW2cqGmDzUxNl8Bv4umjbDDyyOgrnw3Goo=;
 b=LPhfv654aoD2JaatrdSoNkyS9Xr5sOLV20mBv66ks8pY4quk+MlAqbIIN2Awg4dgWGpzRUywOIg/JDVmq1sDDK3icNL8a4ecxzxdL5lTLdotL8FDD3Cb4OTsmLDHskbLNc3btxGUYl3GCoA/tlmoUUi6ga+M1xcdtgbRc7tajvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 29 May 2023 10:52:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] vpci/header: cope with devices not having vpci
 allocated
Message-ID: <ZHRn5DxPzP6sqv19@Air-de-Roger>
References: <20230525145405.35348-1-roger.pau@citrix.com>
 <56cb3727-5905-1a7a-ceed-cf110bdddad4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56cb3727-5905-1a7a-ceed-cf110bdddad4@suse.com>
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a42b99-c741-4234-5645-08db60221989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AxYsqdzKMcepQ6cG/GFGA16Go9JBAsyinI3GgrfXWjvm2yRv++ouDQeW0cGUDrxF7j5YmmbzEz8375i0tIzpACS+nSGUHvBmPj+2I56RHZa1KU9UHnSAmaESxXszTy4SE4eb+B3i96u3qHB7EKBIzdXyEohVlIzDC+aWoA9zpNw4pJSccJQxS30qXAwm7Z4GPXcR+qCBYNbeVB/DlHMEyfs7Yum7XFxvDASIrN9XYOSjRb3r1BscJkESu+WcNLvAFnIrSbDMAPgk6rcncKaBqPPJH66nTIYAIgGQ22KxQjDE/kHZZQ71+0G9b5S2W+W7TLCXjgEqlcLXgx9gcMhQ8bJWEslFzozEQCylVlTv2OjChNMgBCkwTldMymIDwV+y++vNpwMzYBUh//Ah4i7hMoDqgrRUDNP7JoH8ecOjUTo5p0zF8khvMZfRjbjbvK8gnR3SFUZps56mGBswHHucpqcDGxaZEB80mKRRgc0lNUSCIvNP/XgZp8ax0F0INhmfCIapoHVZOBQJXDuHpzs6cVtnRMOVmTLS4mT6F3PxswhAgW0agbZyM45HxTt39ZTt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(82960400001)(478600001)(38100700002)(66476007)(66556008)(66946007)(33716001)(86362001)(4326008)(6916009)(6666004)(4744005)(2906002)(186003)(316002)(26005)(6486002)(6512007)(9686003)(6506007)(53546011)(41300700001)(5660300002)(85182001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGV3cjNpNmdQMnVlY1R4akxFYjQ1ZHdkUVFlNXZ6QTBWa25JSVUxVS81K05y?=
 =?utf-8?B?RStld0hJMDY4REQzam5GWUlNdFFPd2NEazBqTHFLRnNRcTRDd1dVczRIaG8z?=
 =?utf-8?B?bHM5Sjd1RXVURUtoNkVqakQwNXRHc3RNRHhGYWVENGxZaU1scTJNdU5zY25x?=
 =?utf-8?B?TVIzcVZ1VTZkVUNmQ01BVE1NK1pwRVdqWGE5TkpMWVVHUFpsRkRPUUMzeU1E?=
 =?utf-8?B?a0dFSysvM29rQ2pJcTZPeVNWODR3WVkraFM2aDhENTlINUV2b1NLSDVkS3g2?=
 =?utf-8?B?NWJkWGFndStYZEp3OG5XT0hxdmlRc3J1QjlNRU5VamVac21qTVZSSzhRUGRR?=
 =?utf-8?B?a2xmNnlteHdIWWZnbDMvbjJCUUlnT0JOVWFwcVorMi9oelN4c2dvZXYzcVo5?=
 =?utf-8?B?UUM5Zi9BWitwRHN6SVNWVzBYUC9wKzk5QmVIRklpeE5vdUoyTWk5YU0xd3hs?=
 =?utf-8?B?V2VUK3hsWXAzcDAwdkE2TWtEU1lRV290NVNVV0ZkYnNsTk5YQlpZTTZwT2h3?=
 =?utf-8?B?UkRBbWdtTDFqeGxBczBLOEdvTHB3V0xIUVpSeDR6bHYzVFRuS2VqR3NvT0lE?=
 =?utf-8?B?MDhwMzVEZ3NyUzdvc3VGMVZlbkZJMWZ5dnVkb1Y2Q0cvKzd6UkZCQWNnMFha?=
 =?utf-8?B?SFdXYmd0UXdnaXJheUhROXR0VFFSZ2FMZDFXMEJZMHlHOHVEbWlFZ0Q2OWR1?=
 =?utf-8?B?SEZCMWJlVEhYcVRBd3JXd2MzQUQ5TXdPa0JXZEhiRmYxTmlHY0R4VDlDTHAv?=
 =?utf-8?B?WGhNekpFM2lEN1JVV0FaRGI2RTZiV3lObTdFVkFaT01uaEMva0dhcm41cFpU?=
 =?utf-8?B?alpacVVUamFvUk5UTnFDZ3FNYXJjSEVyY1lKSDFPRE44cWFaMnFVeVJQSVhZ?=
 =?utf-8?B?VDNJdHlHY2FyRjNNamtGb1RrM2kwTG94WHV0OHNvSVhmNElWajNodFBHaVYv?=
 =?utf-8?B?bERSL08zZExZVWZFZDVVWENXeGpwZ3ZYMVZaQStsem1hSzJFMnhUUkRQeWFN?=
 =?utf-8?B?RHBPblhzajhDZnJOcThOODBHcUsxZDIyeVI0aUQzYkYvWHlaRTNEMXdic1do?=
 =?utf-8?B?R2tWQm1sKzFEalY0dHlCTmdLczRnUXN3dXAxUmYrZS9NU2lCTDRETGlYT0p0?=
 =?utf-8?B?TFpBL2hMYjQxaWZlaG5jUld5bFFCRnl1Wk1tSDUybEFjU01ISjM5bDd2YkJT?=
 =?utf-8?B?ZUlaSWhJRGs2OFJGUTNUb3F2KzUvUHhWTXhFaEh3cVBtd0diYkp0ZmJuTzJx?=
 =?utf-8?B?cW5IRUM0bkJpbTFZcE5yQkxyUytmN1I0WC9SbWE0YmtEdytVWlhxSTMwVEhn?=
 =?utf-8?B?UUxYalMyUEVmdk41RnNJa1NlMEJaSUdaOE1oelovN29RZmJNSG04dW1pOWk5?=
 =?utf-8?B?WXBpQkNkVTVpeG5xMEptNnJzbmN3TzdWTmQ2M1dwTHU0U1p6b3RnR2ZCaVAx?=
 =?utf-8?B?YlYxQUhnOSs2dzR6dG5PaVd3cHJFZk9Oelh1bXA3K1NRV1ptL2tZalNKRDFN?=
 =?utf-8?B?aWwydzVYQXJpc0RCTElMeEUyM21lOUozRXVTSWVORzJ0bERqZXFsV0xhcWdN?=
 =?utf-8?B?dlhWZHd1aGU5R0pGdVhjSEhkdndLZmNUZXZTb3Zvc0N0bk5YYytabWZVT0hC?=
 =?utf-8?B?YUVHZG53Nk5MY1hncTIxby90UjJZVUw5ajVHbTNOVmliUUJTRzZBeWtkNXQv?=
 =?utf-8?B?M2M1OFh5Yngyam85RHg0VzJaN2ZLVjJXTGMxM3VWdFBCS25EYnJWQnhvbTE4?=
 =?utf-8?B?U0NGa0JwZmpZTTFJaGI2eWRmZ2VoUUVUUFBSOWtXYUJCNFRDc0s3YjRiR1N6?=
 =?utf-8?B?ak9aaG92MmNuOU5CVWZmTGN3N1Z1ZTc3aDMzSEViQjZTU0preDdnam5XcTJF?=
 =?utf-8?B?cGtLSDNFdFFqcDFhd0x0Wlh1K0ZLeUlpUU0vcGNnV2VzRjhmQVVMVWRYd3RB?=
 =?utf-8?B?NWlEaDNtSlh2bXhIK0d1YzMzalowUE5wa2djSHY0UGltM1c3eGRJVGpUWnpY?=
 =?utf-8?B?Rm5TYm5nb2J3cTFqVTJMa3hCRHZzZ2x6TTJYZkwvY0tnUWVrUUo5M3orL0wx?=
 =?utf-8?B?M0IxUW5ZQzBLQ3V4SGtkQzl0RzN5YlNhdWdXd2NtK0NtQkVGNHl4Uk04d1Zv?=
 =?utf-8?B?S2FHMVFKbkxjNzdWRUwyNW1aNXd5cjk5ZUQ5ZmtYb0pGT2tWa29CUkIyYngr?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FOZqLfPZKYH4UrO0iuYZ02+WFWz1kVt7odhjQIQwuesELPfDUORq4Fqt/RzPABvbx5sigtshU6+41PKyPEHxhzi+DQ6p/Lxg3YK1p4d6inHYQr6Q7JFMgSdr16/NAQvyFupD3LtpdyYTVGV60u6pD7zblIugzh7CmNiuduTsbpmVklMppYqF16InnUPRhXy0iJpYTxGm2ityD2L3XoiDnELvb5+P/MuPJM+Q7YSInsSqEIwbbBEZE8csFjBa8/2ACkmYqqos0mtyZeODMBc0IqyJtvDfFZwJ0yfY9SeVYSflADmCnmcJnP+YndaeRO22RPjCJkYUveeu657Hg79V7JPnwK8oDSWKSGN6x1kvshDGSM4ddCcVCaPC5gtTZkntyO3UqDjhoUw96xrv4I/wUkmbcBPb30eP9K0WuB6bwZSpIHw80Bi8gQrRLdd9+2ytdPQbAhsSl+0/gzBkpJevUoib8fOuVIQVYU/sQSZKyaYh3oRIQ8n4PNVlx3nOnGIwPl2W0pSHB9D08N/bGhQ2SHw/FWo9GBuS+WJEUdpZKSGD94KoEuniuD9oPDa6dQaJzuTC9sjmcqE8M2VBviF6aOuJMzMRvULqp5bi8q1s4qyZ4xfT84VL4PrRA0Ocr5/7+er1Giaj7PebvUHlwmHph2+IGF9q6zV0x7R8jMlLpjIQFu6jyHCXbticFHPE7EJluCDI1vXVoAVu4DHR+7ZuW7ffoSn/l1sFzdZRqyQqsECQftPF9Gp38b0obuvcNom22RmCMzPkOJcVTqCm8a2gI1hJzi/vfP4ALpw+lxgTfUs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a42b99-c741-4234-5645-08db60221989
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 08:52:57.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WftqSlZ73/uiQaZs/2e8nNAf/nOTnqGfyJGXf01toJgpxE53zCri7jFE8xcCpzZ1OPJT/BgUrsdtz0QZoVJtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6355

On Thu, May 25, 2023 at 05:22:53PM +0200, Jan Beulich wrote:
> On 25.05.2023 16:54, Roger Pau Monne wrote:
> > When traversing the list of pci devices assigned to a domain cope with
> > some of them not having the vpci struct allocated. It should be
> > possible for the hardware domain to have read-only devices assigned
> > that are not handled by vPCI, such support will be added by further
> > patches.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> I was wondering whether to put an assertion in (permitting both DomXEN
> and hwdom, i.e. slightly more relaxed than I had it).

I also wondered it, but didn't think it was very helpful, but that was
back when I had the comment about how I envisioned this to work for
domUs.

Let me know if you want me to add it.

Thanks, Roger.

