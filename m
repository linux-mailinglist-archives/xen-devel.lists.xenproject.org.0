Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE706CC665
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515949.799353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBIL-00075W-5F; Tue, 28 Mar 2023 15:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515949.799353; Tue, 28 Mar 2023 15:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBIL-00072q-24; Tue, 28 Mar 2023 15:31:33 +0000
Received: by outflank-mailman (input) for mailman id 515949;
 Tue, 28 Mar 2023 15:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phBIJ-00072k-UA
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:31:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ad5047e-cd7d-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 17:31:28 +0200 (CEST)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 11:31:24 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5945.namprd03.prod.outlook.com (2603:10b6:806:11c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:31:13 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 15:31:12 +0000
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
X-Inumbo-ID: 9ad5047e-cd7d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680017488;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vVYYGMLZcNN3Bya6NFBdPpH1O24UqryU53E10iJDBww=;
  b=NLsIr031I63rT8XzqP3/Whe3LMaJy1aVYU5/3CKnDDgNk/OQxjiVYFsv
   9M3cSs019H6t6SNczs9/st9Li4IGJ9kZulAjW6qtwU86XiudOyhDtz40X
   Wtw0lerGw9m2pf5jeNnux3BAu3B68MoyJ4bzOXVD9Hv2E3jgWKdDYPZ2Y
   M=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 103291472
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IhpuF61+UZKeNVrvLfbD5QRwkn2cJEfYwER7XKvMYLTBsI5bpzFUx
 mFNXD2Haa6NM2TxLo0lbduz8UME6p/WzIQ1QVQ+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfG1lj0
 dk9C2A0YTum28KS5IiHTOxBiZF2RCXrFNt3VnBI6xj8VaxjbbWYBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6PkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03bWexH+kAur+EpXg3N5Omn2J7FdCJz1RUljqufeZl0uxDoc3x
 0s8v3BGQbIJ3EmiVNz0RRC7iH+CoB8HWtBUHvE66QeC0a7d6UCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaISEIKUcSaClCShEKi/HhqowuihPETv54DbW4yNbyHFnY3
 DSivCU4wbIJgqY2O76T+FnGh3ego8PPRwttvAHPBDr5s0V+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRcBJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:0wvQeaDbLMLCO4PlHehWsseALOsnbusQ8zAXPhhKOG9omwmj5r
 eTdPRy726OtN9jYgB1pTngAtjWfZq4z/VICOYqTMiftWXdyRKVxcRZnPvfKl7bamLDH4xmpN
 ldmsFFYbWbYTca7beckW+F+pQbsai6GciT9KbjJhxWPHtXgtRbnntE43GgYzBLrWd9dOIE/a
 6nl4p6jgvlVWUca8y6AnUffu7YutHHrpLpZhYaGwUq8k2rgSmz4LD3KgOf1BsFST9DqI1Skl
 TtokjU96+nu/G+xgT903bJ75NKsNH9yt1Fbfb87vQ9G3HBmwysbIRkV6ajuCkvoOazzV42nN
 7Hs34bTqFOwkKUUnC+pBPs3wX66S0p+m/GwUKVhnHyyPaJJg7SRvAxw76wvXPimgYdVHwW6s
 929lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nvf8Pg2dZWY4+bqYUiYAE5ktaHLoJASq/sekcYb
 FTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDblketteT2z12mmk860cD3sQQkloJ6Zp4YZhZ4O
 bvNLhuidh1P5YrRJM4IN1Ebdq8C2TLTx6JGGWOIW7/HKVCAH7Jo46f2sR/2An/EqZn8LIC3L
 D6FH9Iv287fEzjTeeU2odQzxzLSGKhGRzw18B3/fFCy+zBbYuuFRfGZEElksOmrflaKNbcQe
 yPNJVfBOKmBXfyGLxOwxb1V/BpWCcjufUuy4YGsm+10572w8zRx7Hmmc/oVeDQ+OMfKzzC6n
 hqZkm6GCwP1DHkKyzFaN64YQKvRqW1x+MDLEHgxZlb9GDWXrc89zT9uW7JpP1jYQcyx5DeXH
 EOZI8PwZnL4lVfCw7znihU0u00NDce3F1mOEk68DPj5yjPAOQ+UpOkCDtvNHfrHG4Kcyr/Kn
 8om2hK
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103291472"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyIqLqwtoB8gaHF15YHzXFSCzohs4Cf12LbIgP1ajBs8mrhV4ugLMqK+zaccbnlnvjJk8WBeSZW99RgIRDX9VHDtUprmxkscbDWFDOKNbGBzhVhzbZsDv56QIB5HtiMcq1W/fTPIUrWtRZlLK7B9iqL3PvrV1mRz1za0ThCliaGygeh4pELQZo/ACyvBw7VP5W5Tk5I/HUM3G5nI3HMAoXGCE1Z0D/p1qHhMuE9JZ/hqsjlEz0OMlQj198jt/TMVVuTnLEPjVysvF6qFL+zbWX+IzJlyDpG86aN5Frr6Dh+/BUrX2bjifcukYw55Jz1uSpyU9XI4h6e29FPHUmsOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZlafUHjvj0NetsmAe4XBuVz19+xsy3QF5zg+Tv72Cw=;
 b=X3gDk6Yq9Ugea7CSRubYrZGPAsZEGTBxijg+lRq/HjDXAtQjr84cCkCNzx2WEKTCvnlS2NZkvAE1JiVmFCqSMogyYMe/KaS1yt3dj/m8EcCmieLICO2nECEcn/cLzaf3Kd4QhF0C6Oof7vJTvIRtMH5HtJfLyC5Y8DPc9XZGqfdE6e0hw2S9+jcXQ1LBE7M83sYgfDXHQG0/sO3d3BEZIfvWtd//znU7YQgYCN337u+ncoEqrjekpzV9c57W3fJ897iZ0KENThqwI6X+vwMKjMHi8BIPXxTqwQzA2Ucr2JzCc/5DONkqOgdA51WlKvSjIVwm/K1w3I42CAjpa4RigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZlafUHjvj0NetsmAe4XBuVz19+xsy3QF5zg+Tv72Cw=;
 b=rLSyP4geBw7JtzSpnQ2qcTCTeuTXP+8Tt+YDzqxNHpMuQSz3lORcqpINnk59YP6zb80RZ0WybpK9d9Rr2est3JtjfP6HsKhD2a2Dpu1cJbbVXkmPIONhEKoO1XzEgkKMvqzl+f8sMb9zcz7iB8bCCI/WlFGskkEzQgl9gk6s2kQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 17:31:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only
Message-ID: <ZCMIO7cv4CBRXffs@Air-de-Roger>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
 <ZCLz/2QeoMVyOej8@Air-de-Roger>
 <ZCL+gCQrUc2lUf1A@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCL+gCQrUc2lUf1A@mail-itl>
X-ClientProxiedBy: LO4P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afc9c8d-ff48-4ee8-a64b-08db2fa17648
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UC2arYLCkabo7BA0TOPI1TbCfemnOvO+edywv0DVKyg9Nir2GRTn0kpaqV0f2lqmYg0+S5T9zoEfrtnIyoYNa5DKngNUZn15+ryzgFrXmNKvpQSX8f/Aim55OzBZfQQ/grUtxrJxr3lKm7JCIfBlrRlCITlO7N4AWYZa9alYVhdAvecdU7MQFz7K1xRBvzYq4cbIRgrz1unWFNPY89wlgdlR60GxYOvMfTc256ZmpqaJSY/QxP3HnxY7wNnRvXm91EKmbfBx3VBh8khr2H4CyEGpWrR3ltgBrWFqUgEMFn/frccrUBZl/vtoZZRQvhuoRPxJb/ZreMmJiRhGrEMcthpuKMBzlI10j9BSJ16hhRIcPPeQBOJx65xGPLRPdfHd587B6UYUoXM4e0Fvm6qNDzmX0zO4ZNIFITIOxJ9aHuZdHvA8Nk2XUxPZ0h3gNKlExUsU5aXwpXgT4A+0/eZpptSWTYWVCNBdYuwvx8EzyxgRvyb/xfHH/4Vsq3/hBgmj8m99cVSVDwzfdcAMv7BHnVUlj7qWq42R+LRzjcVoZHTVmX8HD49PbIslR+j5smHn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(54906003)(6486002)(6666004)(478600001)(8936002)(6506007)(9686003)(316002)(6512007)(26005)(66476007)(66946007)(6916009)(8676002)(4326008)(186003)(66556008)(41300700001)(82960400001)(5660300002)(2906002)(85182001)(33716001)(38100700002)(86362001)(83380400001)(30864003)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b25UTmg5YlprWGRXejV0cXI5M09nMWRTc29NMkk5WGlGd0x1dmpYVFQ3NXFM?=
 =?utf-8?B?OFBaQ0J6Z0M3cWRjZkRXRWk3TGg5cktkL0pHa2pDZGVtRTdwb2p6U2w3OUJw?=
 =?utf-8?B?T3AwSHVHZnlLdVNzdXpXK01TMlVyTE94TnNrTm5qaVgrY2pRdlRvblFWYm5J?=
 =?utf-8?B?NnU2SVBSbTZZT0dQUmNZNnlOeFhxeEI1K3ZjdjZUN01QaXMySFVNK3grRHhS?=
 =?utf-8?B?OGUrNndyR2daczBiQ1h5ejBDQW50RkR3RnJJQjNDK25UUHZEUGZwRU85VXJT?=
 =?utf-8?B?b3UwTE1abVZoMDFvNVYrc2RUTFhlaExjRnFBbklxc0pEdW8rVVdhUFZvUkhv?=
 =?utf-8?B?QzVlRDJ1OWRRTEl2aEVtTWNPQ2ROOVk0R1FiWHBnc2NteTFHNWpmVndGUzhs?=
 =?utf-8?B?eEdGME9yY1lJZmNDcUV1dmljdHpjanJWUU01bk54SW40c1d4d3RYOHhSSjFC?=
 =?utf-8?B?UGptRnEyc0JSNllMeThmcWtvWm01QmZSQWU0VERvbURQZ0tsS201UUNRWUln?=
 =?utf-8?B?aGNxTWpzMlFxMU9zUUVBUklDTXRGWTJzalFWMmxUeC96ZnQ0UEtTaXRjOXpI?=
 =?utf-8?B?N2pleXFNL0gwdE9XbSt0dEZpZldzeVV2ZnRyTWlJRFNOZFZ1eU9ycE90VGla?=
 =?utf-8?B?YmZ6VmUwSC9TTzV2U0labzdHNExmNzhIOFcvS0NIcThkK0l1TndRV2NxNCtD?=
 =?utf-8?B?Sk13YVhmUzl4alJHcWZ2V2dpRFVuY2w2OGY1aG1VclZEblFYT3QwdzFlMWtO?=
 =?utf-8?B?M3FQeFdsdkJkbG9WWUlwZlVpK2kwRFNmVExKa2crak8zZ2ZIUW94dVlheTdT?=
 =?utf-8?B?dlJkTzVFTGJOMkRpUnV2MFFzNmp5ZjNKRUdtZlI2R1p0TzM4S3NhNEFYWkhp?=
 =?utf-8?B?ZzFHSmRsSnQvSmxEU2JRdUh4UGlNdEZuMkozbzRwZ2t1MExhYWxWcmpCdUJq?=
 =?utf-8?B?Z2FzWk5FYWdOaWVTQ2IyaVZ2Tkh5RUZ1dGozM1c4Y3gzRG9za0xUbGNRdlQy?=
 =?utf-8?B?cGdsOFowNzl3S1FZMXNueEpIdDhUczJJVVFhU003U2VXSjQwd212S0VQdjN6?=
 =?utf-8?B?eU9iMSsxQTVxVGk1SVJMdlRoaW5OcG1FUnFaRUpkZnZHVWdCTkdlanQzWWNi?=
 =?utf-8?B?dUFJdWJjc0poZmp2TFhkZ0JkOVFveVhkMGREcGFDNW42SExXMkJwQllacGpv?=
 =?utf-8?B?TWhodG5vVjlVeEpUTEViR2VzK2hxOHJ6a3FOTFB4MGZCZ1RGejlkVmdrRWxK?=
 =?utf-8?B?V0JsTmRKVktVcG4vdjBaNGFQSU5uOGt6UTI0Z09oR3ZIWndSOGtoTjk2MXlh?=
 =?utf-8?B?UURNNjJVN0JnRExkOUhEU1BnK2gwQjVHQXNRZlRBbzBySGdLVi9MY0l2Mjdj?=
 =?utf-8?B?TmN5dVBGRHA2T0NOU3hVWktBZWs5TCtqZFpiNTFYaDgxdDByaWFwdDlQYXZp?=
 =?utf-8?B?UjdhUTRpWXlrSTBkQ2hYMlEzM0tneW01U0NGTFN1NFJwYmVqcVhVN0lTWVRB?=
 =?utf-8?B?V2R3cy9sQzdwT0RWcnFUZ0ZrOGVBRG9ibW1wVDlZTVBQaElLOHoveWNXaUJz?=
 =?utf-8?B?dHFKalVSdUgvQUlrSjhWdXhFS0cxaFBPbVdHU0RqdzEyRHVWWDBrMTBUZWg0?=
 =?utf-8?B?NDhpL0FMd0M1QkEzQklwbHd5c1ZDelFQS2E3S09BbDArMVdVUVJOMHA5NTBy?=
 =?utf-8?B?ZXhiM0NLcWZBNE5uUjYwaTdRemhRUGJHUS9QUkIrb2Q0NUEzNmdzNm5GVHVW?=
 =?utf-8?B?WFRYTGZqZGR3OUJZZU5waVB0VEFEcUs1NHNpTzh5YTI4WEdRQWdxK0t2d0tU?=
 =?utf-8?B?VExlNmd0RTkxditUblVOWHM2Ui9IT2RqTjZuTFV3bTNiWktRenhoc29GR0RJ?=
 =?utf-8?B?cXNPeDVudVJCdjNVbzd5TWkwVjBCSE4vR3U5NkF6RzdmRkw3THBaaXFTNitv?=
 =?utf-8?B?cEdGQ0VyWHJqK0R5NE5EcTg3UTJ6WFVRRDVnQzU4YnIvbzJHVElwWWNOaG5r?=
 =?utf-8?B?aWw3TG0wL3QzZ1dlejdKZS9KaGJFR1RCeUhRaURiclRaWGlMaHkzdXdXR1ox?=
 =?utf-8?B?VGtLK2hDZWtsbGR3akgyclF2b1k1dnJWZy9Oc3Z4VytKa3NWVmY0Z2d4MXd4?=
 =?utf-8?Q?wHc+Jh27o5gi7UxopQZcZZQQV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ys5kMAeEuwn3bFLiNjI9my2bWhakdCOR09la8J/VEf1rcY6KbS43VVKbrWzDndwG5ktB0S4i860HrMlJ1BG/y6yHS5T6vKNN2e8BhjKcdvefAXocgMW3cHPN1PbucQDjbpG0jnatEXtsZNUDyvyYClX4GP+KAFJRIAeQyg1tDimssBFuGfytZ2iLH9Zj4lZiA9uOoXBPizuejg/LHmIaxrlB8Ucn0qvULTPsSKdeW5pnw/fUw8XbNxgPFUnvu36iwVFo1G5fO7nEf+oCG48Kw4DT0ywbZPnWg6gPLV5jvfupz36IaEJOx//UuemxpgbRyRPArbOSpxZSnlX7kiy007lKNv6ELnJJa4PPboZLQalgEMGiVWB0M/6T07THrj/Rmx2zFiyhVDG9G2diUBIV5pOBlXZN5FD1sQiUxq2aNfYh7rpsKp0bb94IP1qxMQJL4LlFuOs72GpHKBLKePzbSrRAJiCCkfCfV5wLunjCbzxxFGypWXRtCz8jWEsCc8DsS91GAReFGrz5sBPtWuUFxkoVqBnegozgt45FlX+G/Oisrrj/YXL+VMMkWqerWfJjTDufipJbXHDVNPydlztiNrl9KLzDbefnvdYKTTT1DDM2ZpChdZlkef/j0MZYNXE7oFnYD9/jPqBx0tuuLVj1SaDFLutXMSD3k7XwtjjN7zE8W0xS8NJ/tn7C9UiNedk8VYk/C+jT/uAvoU+jE+PhxJv2WMoXO0Lt9K9wm9PBnINxHG6EIfcM8c0hMErrMYFUmWfhRu1Wi+9y0s8LYfcFtmLqB2AthttIM5YFZug9bEF7AiGZ9/rnTErXxT7dt/fbVpZEbhgYLkF8n31tZtauByFYprwQ0svxwzi7iOPJvDDc7jUifAbkGC9I7ukp2SH1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afc9c8d-ff48-4ee8-a64b-08db2fa17648
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:31:12.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DspoYBMnRWWLFRTB7FElvMDmUDBTlfw3D5hrcn5ghZbxPb2Pz2aPmO/Q39cHAH/dUk8H69Mn4FGhOe7v7XJXsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5945

On Tue, Mar 28, 2023 at 04:49:36PM +0200, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 28, 2023 at 04:04:47PM +0200, Roger Pau Monné wrote:
> > On Mon, Mar 27, 2023 at 12:09:15PM +0200, Marek Marczykowski-Górecki wrote:
> > > In some cases, only few registers on a page needs to be write-protected.
> > > Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> > > PBA table (which doesn't need to span the whole table either).
> > > Current API allows only marking whole pages pages read-only, which
> > > sometimes may cover other registers that guest may need to write into.
> > > 
> > > Currently, when a guest tries to write to an MMIO page on the
> > > mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> > > that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> > > from userspace (like, /dev/mem), it will try to fixup by updating page
> > > tables (that Xen again will force to read-only) and will hit that #PF
> > > again (looping endlessly). Both behaviors are undesirable if guest could
> > > actually be allowed the write.
> > > 
> > > Introduce an API that allows marking part of a page read-only. Since
> > > sub-page permissions are not a thing in page tables, do this via
> > > emulation (or simply page fault handler for PV) that handles writes that
> > > are supposed to be allowed. Those writes require the page to be mapped
> > > to Xen, so subpage_mmio_ro_add() function takes fixmap index of the
> > > page. The page needs to be added to mmio_ro_ranges, first anyway.
> > > Sub-page ranges are stored using rangeset for each added page, and those
> > > pages are stored on a plain list (as there isn't supposed to be many
> > > pages needing this precise r/o control).
> > 
> > Since mmio_ro_ranges is x86 only, it is possible to mutate
> > it to track address ranges instead of page frames.  The current type
> > is unsigned long, so that should be fine, and would avoid having to
> > create a per-page rangeset to just track offsets.
> 
> I was thinking about it, but rangeset doesn't allow attaching extra data
> (fixmap index, or mapped address as you propose with ioremap()).
> Changing all the places where mmio_ro_ranges is used will be a bit
> tedious, but that isn't really a problem.

Yes, you would still need to keep a separate structure in order to
store the maps, a simple list that contains the physical mfn and the
virtual address where it's mapped would suffice I think.  That would
avoid creating a separate rangeset for each mfn that you need to
track.

> > > The mechanism this API is plugged in is slightly different for PV and
> > > HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> > > it's already called for #PF on read-only MMIO page. For HVM however, EPT
> > > violation on p2m_mmio_direct page results in a direct domain_crash().
> > > To reach mmio_ro_emulated_write(), change how write violations for
> > > p2m_mmio_direct are handled - specifically, treat them similar to
> > > p2m_ioreq_server. This makes relevant ioreq handler being called,
> > > that finally end up calling mmio_ro_emulated_write().
> > > Both of those paths need an MFN to which guest tried to write (to check
> > > which part of the page is supposed to be read-only, and where
> > > the page is mapped for writes). This information currently isn't
> > > available directly in mmio_ro_emulated_write(), but in both cases it is
> > > already resolved somewhere higher in the call tree. Pass it down to
> > > mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.
> > > 
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > > Shadow mode is not tested, but I don't expect it to work differently than
> > > HAP in areas related to this patch.
> > > The used locking should make it safe to use similar to mmio_ro_ranges,
> > > but frankly the only use (introduced in the next patch) could go without
> > > locking at all, as subpage_mmio_ro_add() is called only before any
> > > domain is constructed and subpage_mmio_ro_remove() is never called.
> > > ---
> > >  xen/arch/x86/hvm/emulate.c      |   2 +-
> > >  xen/arch/x86/hvm/hvm.c          |   3 +-
> > >  xen/arch/x86/include/asm/mm.h   |  22 ++++-
> > >  xen/arch/x86/mm.c               | 181 +++++++++++++++++++++++++++++++++-
> > >  xen/arch/x86/pv/ro-page-fault.c |   1 +-
> > >  5 files changed, 207 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> > > index 95364deb1996..311102724dea 100644
> > > --- a/xen/arch/x86/hvm/emulate.c
> > > +++ b/xen/arch/x86/hvm/emulate.c
> > > @@ -2733,7 +2733,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
> > >          .write      = mmio_ro_emulated_write,
> > >          .validate   = hvmemul_validate,
> > >      };
> > > -    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
> > > +    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
> > >      struct hvm_emulate_ctxt ctxt;
> > >      const struct x86_emulate_ops *ops;
> > >      unsigned int seg, bdf;
> > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > index d326fa1c0136..f1c928e3e4ee 100644
> > > --- a/xen/arch/x86/hvm/hvm.c
> > > +++ b/xen/arch/x86/hvm/hvm.c
> > > @@ -1942,7 +1942,8 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
> > >       */
> > >      if ( (p2mt == p2m_mmio_dm) ||
> > >           (npfec.write_access &&
> > > -          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
> > > +          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
> > > +           p2mt == p2m_mmio_direct)) )
> > >      {
> > >          if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npfec) )
> > >              hvm_inject_hw_exception(TRAP_gp_fault, 0);
> > > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> > > index db29e3e2059f..91937d556bac 100644
> > > --- a/xen/arch/x86/include/asm/mm.h
> > > +++ b/xen/arch/x86/include/asm/mm.h
> > > @@ -522,9 +522,31 @@ extern struct rangeset *mmio_ro_ranges;
> > >  void memguard_guard_stack(void *p);
> > >  void memguard_unguard_stack(void *p);
> > >  
> > > +/*
> > > + * Add more precise r/o marking for a MMIO page. Bytes range specified here
> > > + * will still be R/O, but the rest of the page (nor marked as R/O via another
> > > + * call) will have writes passed through. The write passthrough requires
> > > + * providing fixmap entry by the caller.
> > > + * Since multiple callers can mark different areas of the same page, they might
> > > + * provide different fixmap entries (although that's very unlikely in
> > > + * practice). Only the one provided by the first caller will be used. Return value
> > > + * indicates whether this fixmap entry will be used, or a different one
> > > + * provided earlier (in which case the caller might decide to release it).
> > 
> > Why not use ioremap() to map the page instead of requiring a fixmap
> > entry?
> 
> In all the cases this feature is used (for now), I do have a fixmap
> anyway. So, I don't need to worry if I can call ioremap() at that boot
> stage (I think it's okay in console_init_postirq(), but that may not
> be obvious in other places).

If we moved for a model where mmio_ro_ranges tracks at address
granularity I would suggest that the underlying addresses are only
mapped when there's a guest access to handle, so that we don't waste
fixmap entries for no reason.

> > > +        if ( !entry->ro_bytes )
> > > +            goto err_unlock;
> > > +    }
> > > +
> > > +    rc = rangeset_add_range(entry->ro_bytes, offset_s, offset_e);
> > > +    if ( rc < 0 )
> > > +        goto err_unlock;
> > > +
> > > +    if ( !iter )
> > > +        list_add_rcu(&entry->list, &subpage_ro_ranges);
> > > +
> > > +    spin_unlock(&subpage_ro_lock);
> > > +
> > > +    if ( !iter || entry->fixmap_idx == fixmap_idx )
> > > +        return 0;
> > > +    else
> > > +        return 1;
> > > +
> > > +err_unlock:
> > > +    spin_unlock(&subpage_ro_lock);
> > > +    if ( !iter )
> > > +    {
> > > +        if ( entry )
> > > +        {
> > > +            if ( entry->ro_bytes )
> > > +                rangeset_destroy(entry->ro_bytes);
> > > +            xfree(entry);
> > > +        }
> > > +    }
> > > +    return rc;
> > > +}
> > > +
> > > +static void subpage_mmio_ro_free(struct rcu_head *rcu)
> > > +{
> > > +    struct subpage_ro_range *entry = container_of(rcu, struct subpage_ro_range, rcu);

Overly long line.

Out of precaution I would also add an extra
ASSERT(rangeset_is_empty(entry->ro_bytes)) here.

> > > +
> > > +    if ( !rangeset_is_empty(entry->ro_bytes) )
> > > +        goto out_unlock;
> > > +
> > > +    list_del_rcu(&entry->list);
> > > +    call_rcu(&entry->rcu, subpage_mmio_ro_free);
> > > +
> > > +out_unlock:
> > > +    spin_unlock(&subpage_ro_lock);
> > > +    return rc;
> > > +}
> > > +
> > > +static void subpage_mmio_write_emulate(
> > > +    mfn_t mfn,
> > > +    unsigned long offset,
> > > +    void *data,
> > > +    unsigned int len)
> > > +{
> > > +    struct subpage_ro_range *entry;
> > 
> > const.
> > 
> > > +    void __iomem *addr;
> > 
> > Do we care about the access being aligned?
> 
> I don't think Xen cares about it when page is mapped R/W to the guest,
> so why should it care when it's partially R/W only?

It's kind of the same issue we have with adjacent MSIX accesses: we
don't really know whether the device might choke on unaligned accesses
and generate some kind of exception that results in a NMI to the CPU.
Handling those it's likely more feasible if they happen in guest
context, rather than Xen context.

> > 
> > > +
> > > +    rcu_read_lock(&subpage_ro_rcu);
> > > +
> > > +    list_for_each_entry_rcu( entry, &subpage_ro_ranges, list )
> > > +    {
> > > +        if ( mfn_eq(entry->mfn, mfn) )
> > > +        {
> > 
> > You need to take the spinlock at this point, since the contents of
> > entry->ro_bytes are not protected by the RCU.  The RCU only provides
> > safe iteration over the list, but not the content of the elements on
> > the list.
> 
> mfn is not supposed to change ever on the specific list element, and
> IIUC, rangeset does locking itself. Am I missing something?

Oh, sorry, it was me being wrong, I didn't recall and didn't check that
rangesets do have internal locking.

Thanks, Roger.

