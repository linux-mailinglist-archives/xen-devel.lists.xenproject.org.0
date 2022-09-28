Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B236B5EDD7E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 15:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413319.656892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odWnl-0007aH-7s; Wed, 28 Sep 2022 13:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413319.656892; Wed, 28 Sep 2022 13:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odWnl-0007YU-3m; Wed, 28 Sep 2022 13:08:37 +0000
Received: by outflank-mailman (input) for mailman id 413319;
 Wed, 28 Sep 2022 13:08:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG3S=Z7=citrix.com=prvs=2639d358c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odWnj-0007YO-HT
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 13:08:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a65465f8-3f2e-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 15:08:33 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 09:08:29 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6482.namprd03.prod.outlook.com (2603:10b6:806:1c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Wed, 28 Sep
 2022 13:08:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 13:08:21 +0000
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
X-Inumbo-ID: a65465f8-3f2e-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664370513;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yPue7MoHtuj4RnLri1qlYwvWuqASZnyCotzIq0EyxII=;
  b=IFG9rClorRLpVZuzfQud7LW1mOSC4yF7p0wSvZYpgOMgpKXnRlK9GXjF
   dhGMpxY62TEKYJD6MMSzFC9de28vrtH0oRfUybAAEGa3j0aGwFFC7gPLF
   ciB7b4NQLTW/lmDWygw1hdIUFU3Ou22rq/KqHbnoP/Lp955ohsv83897o
   A=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 81534767
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AgnfAJ6J1mq5mluClFE//H55yizrwRhNe6xJEq?=
 =?us-ascii?q?0mlI8zMhWaLcFgCq1vmr1WN6+me0dt6G1viODzi/gQ2b3GK4eXApYjr9+/G8?=
 =?us-ascii?q?2rW+Uh+sC6+4jgM0ttUXVURwgi6rQZdoTcpjBtTm4Z3jpVI8Dr3+gngZLHEV?=
 =?us-ascii?q?g136bVcLm94ZFX6hYiPK4ET/Pvuxfv5WERFhE4p2s9bYJAgK2oo1u2yXsWqF?=
 =?us-ascii?q?vTCDWd4MJICsrUJX9GRuM12EQBcQ9EOn3lmaLza3ehSn492JSvZetB8z++B+?=
 =?us-ascii?q?tsc3Q2cnMYTj8IWyMnkhSEQ+RR47xGJ7KP3LX9GrS4XCvqFqBHWzUocCajmQ?=
 =?us-ascii?q?GKtA/1wIbJwK9RqD2vxNp/Wnwc5DdwBPJtP/HScPF3bp95FQCsAqJXTXsdNz?=
 =?us-ascii?q?r7/MdMGCvyCySOewB8kycWTkpN2DKhx3HckaHqELGIoEfKWHj9zHBain06Yd?=
 =?us-ascii?q?/T/h0CGpwtzA0Wzrudq1G4vqe82/XVXziVKtdIdXgx0OUg/lSkSXQX1qdQ52?=
 =?us-ascii?q?Z9NPjuUKZjdi8MKEiCjc6DWv+pZZXX7hebBpoZ+DD76+2ktit15aV5xluesq?=
 =?us-ascii?q?9YtbDhujJ5ooimcLqpkCavskXpSAD4D92376AuURhascFauKoSj+XLhXrixr?=
 =?us-ascii?q?V3MFvPUjn+A8RAk44U3cTqX0yKsy+DzvQEkKSJnPAFEQ74xP0RvY8nhFmJQf?=
 =?us-ascii?q?0oWbLqfXvQJHGc1ivMyBcyJ2zSxZn4xVvvLfDmibLUa9xlJdMt2sMFVEf1I+?=
 =?us-ascii?q?X+wrLRw1STGedFULe+iGE8Eii+FxT68gnQ/cxHN3CNmtGCO7/0ReI1zzHbPC?=
 =?us-ascii?q?/rRMYKtt9kwC9tH/mN5K9Yd0wzBebuZhv/RJm28ycav0DNnGlLNxo4xacgF4?=
 =?us-ascii?q?oHzI9QCIbp06Vub7CLXlPZj5fdjePOJ3enTbayY7oi0hLTCcM/Gr/Y58qaPn?=
 =?us-ascii?q?PGhLXM2B9YdF9jzrbKSd6EqLqzEoKUuo8Lh9r0ddRUIP+GWxye1hjaYpfRwL?=
 =?us-ascii?q?GUFGbbinx3RlGmcWLmwHDR88p1U1Y8kXklSVLGdpu7Q/mNVvt4jH98at5DKE?=
 =?us-ascii?q?bHAVFhsPi5sfNf6s/i6mJHIfKXFPAK/WO45SqFSp48ch0+H8++9dYIQiZ8iT?=
 =?us-ascii?q?1LOa159FLzsOOMZBfgE9vSpI+oGPMlnqL8ko/fP2EA3MByOuO3FOCiXY1+pv?=
 =?us-ascii?q?SxyBmEPM2PM6kXpZGcr7ZAU4C7URf4McLvfVtBoEBaccpEGiUQdzyWK23LPH?=
 =?us-ascii?q?9MuiLDFcBJo8CWt7KfSrNdRFzyU2zIx1qeJu2uxDts4qUn/WkzhHHIE+N1A+?=
 =?us-ascii?q?bReJXA18uw8RLoT4kirXVpgAY+SA+Jdr4KvyGZkCNQ9LZiMVppigPmfBJ2la?=
 =?us-ascii?q?H/Vqh9Ex88M2pGhzzzfnIKtumf1kA1vIPAQ6kixaHJL0xq+yKk+Gem6sJkdf?=
 =?us-ascii?q?1ACKyVCQTsqy5lKBBFyNE702heH+K7EZbxarMsfvabLSbH8SnTc5S8ZHIvWn?=
 =?us-ascii?q?3sfgtMZFBHA8G2NORZh6VEZI7YNf8LT+im9a46AFq9UtuTd7ZJdrQh7EWwxp?=
 =?us-ascii?q?LrbbvBe2VoPVM7XCGfuYJmQULaPpnHJ7/qYAUVJzHzqJbHTlXGhc/x/ukDpJ?=
 =?us-ascii?q?O7pzfJtq0CItbiG7H0U/TPI2n/8lgPkDMGoZ49GzdWJlkGFBn7K8m6RpQ659?=
 =?us-ascii?q?ug0lHv+KgDEMycw+9b7udPY0Yy6DkHwhQrRZc+eKawq4UUwQSsNogF+fF0zF?=
 =?us-ascii?q?9dYfT2LFDC7KMc6xqHeNyqPVFNI1IWCL0wWCN1RS3wDI/qTnXIqbYqCSI7S3?=
 =?us-ascii?q?99IdlKX09IMISQlAVn4ia2WW1ivOZFztXyWZSVNJYpTkvFTnnWkMjWzDQ/xK?=
 =?us-ascii?q?jy6MA62e/WhyUiXJEJobKc+PchyEOC4wCpCnZ4+qsq8Vz0U9/Hz9WlBBrVsh?=
 =?us-ascii?q?HZCu2Vmcr8i/LBLLaL6vUQ/Bur+lmcZGkWt8Q8NUjB32XqRCrjGsAuh2z1+W?=
 =?us-ascii?q?KUg8HS5tk/M9SvcjHv+mTgXPKMZ2EgeZVY7KxmG4RUW5KhlAu2Vp7XDjHp51?=
 =?us-ascii?q?l9tXH1CFuoictB0n7woAfKJ9oPHN3X6vtojHbyQLCYCko2yDauH0RX50/AEm?=
 =?us-ascii?q?HB0vJ2bUpB15Svfkd8oAVCyA2Kf3l3/L8KKk1+AH1iF1iICMLKuaFW8u1DsN?=
 =?us-ascii?q?lr2QOGRJAW9C5c6GomjWfxSgkCWgZSFBDMG86nHezB4ew+8aqyc2YElUoEU3?=
 =?us-ascii?q?kaidMMeFceqMlSIpA9W/34Pmf9ex1vQ0eBW8FbPNqyZVQNrW61DOyzjjnlLq?=
 =?us-ascii?q?2Ya46/4311SZOJys8tqbaAd5sVZDRBoqJXKaEHl/Q7fmurdb6RbIZqYqMOej?=
 =?us-ascii?q?oL1nGsqr6B968J6KpqnENVsOg8SUpza7bUVaaBke4TfLFluLMDO3+ZZoj2Wo?=
 =?us-ascii?q?/DBSYO6K7LKLe6tOKNrSEHNhicq3MOLmKuuMmH0FYUcflrC3fiklk5dvBagH?=
 =?us-ascii?q?/3YrW9+mt2AjQb2QXubfVF+f23K+snr/AQshRnrI3+p23pm6eXEH/b/0dykW?=
 =?us-ascii?q?j9ub1CAOieCFmVQgBKTjtvKMmi/nfrE5UCXtxyrTYimTMkj9Y4yzRCM6rU+1?=
 =?us-ascii?q?CtRb0NcQKDmKoE0vB2CR8NDXX8wGfdsVJW9xE+SpkWKzh1wIcB3V6JyEYsNe?=
 =?us-ascii?q?UbtxvFi++HdxzlwD4Dtksg/mDOmwCE+NHiFkr/QgREIKx3eiZarFPQoniBDW?=
 =?us-ascii?q?PD4LmJuY76ProlbXMFG/8wvJhbGi/I1psx2uHDo76wVC10bsWUDRECX5fxLC?=
 =?us-ascii?q?UaFwgUYdyh3+S+s5GY=3D?=
X-IronPort-AV: E=Sophos;i="5.93,352,1654574400"; 
   d="scan'208";a="81534767"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WashV8N5kFkR2+LeVTeP+5fSCuHxOmqLnSit78cqKJOBr1L1qEhokdcqIi9uU28BV44fna/7Dxoutf7qjgJN6dC4YyOthxAKlTaw1BBIzcvukFUz8svI7WsCpPFbxpvWh0sRYz5GBToOizPb1mIj0gIQ9lUNbz0oC07GW2xwQV2fdc/4z03JLKWRNyQ/1r8SbSzrOJ3BVjeHDefb1YDK0VLAYe9wSqOBro7cX9bkjxEfp1ma4MlIrNoGyVIDQGDthqQez/gtet4yVJa/7RdUGDVENCe5ezQ2KdrdEnU36+Rc+uFgR3MUooZqQDHLJiIqlYepE2MHy0NFTzQ//lTyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wCMjegadRp0pdZirD+3owx55y5HLmPaZcxTbkQAjdQ=;
 b=h3IH0j63Qf3FFRe62xWtHUc25MaDrUSlqKZZdUspUsRgqkmwzXeITdRqe69CYd8fNNeSIu++G4ge6qZJsr/jjt9OKN6neemBiNWy++Tri3pm/jnj/WbHYWVxbNyaLSAVue/YCuQJVmO4tWFJdscImIVoLzPGUuzMpBEGdoUXzL5yzSgSsTnfGU4hybM1dpmEouu+D3kkQuVBBnNuQTvCfxX9oCRnq2868mYNoF1y9ZFeCps2p4ipKcPIQLaaYcCmMXhpvz+am8lw5WvUISf4HrY0imFPr8AaLhLPzFs62PwlaLqwVFpxoY6B8uYc3lNO2QBFEX6icugSoaiyd59lpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wCMjegadRp0pdZirD+3owx55y5HLmPaZcxTbkQAjdQ=;
 b=iiX5wtuYJ2w6O3rOIuhDagyVtxYmmbH0czqiOCTMvcaxXLwnsoEW5UpTDuhzEKBlrk+N6oTDIDsUgEah0QFwvj7Oo1SNX32kNu42ggDK5SVbNVx1EoYMbHyeKW5448aQZg7e4vDejAtyk4u0aPom7drGIx40BKE81yeRIzCnaIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Sep 2022 15:08:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/ept: limit calls to memory_type_changed()
Message-ID: <YzRHQMxpT2v82Et/@MacBook-Air-de-Roger.local>
References: <20220927153937.39389-1-roger.pau@citrix.com>
 <ff79be48-8146-0b33-bdb9-ad9f33083559@suse.com>
 <YzQdEQbXhV2XDEKG@MacBook-Air-de-Roger.local>
 <357195b5-bfb5-7f0d-8295-3076a6762f12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <357195b5-bfb5-7f0d-8295-3076a6762f12@suse.com>
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d8ac30-d241-40bb-7986-08daa152846f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q/AOo7sQtyqV+3wZhirPIbsrZ8SarL6fSsnMqcoyyzuaphdBm9W5uHMD+Vf3JN3gv9R7rG6OcLZ+GbqCJDPeAeCa6m+bo1nQmz+QFwhkf2KfcdnqXAsXbIXf0YsQl63eBjXuCXdjxTr7AOrZp1PhLtJZKq//rDP0PQJ5+nQ6A+M+PzcANEf7AGtwX0ctuNIF1oolCAuvx0ywAkXdNHjQjJNjGOtnbLSpr47umwIRIk0zqXzyJ/VtFyeiUI6Zmx30oyP4r4AzyOuXlVSgWcyOXvZu510xQDcIeuR2bvPCCJEHRdEM7N5pRpZvhP59xQ5eq5YvFwTF8YAynSd8cKsPUFEJvBHLIZBdGv4KzsY4tkWe3HfzkOfbbb4LXWcdY3M3ql8JtjU/dAacNrVBF3Rtm3pQilVNeqX6VGfVVMITiNK90dajJZ1Iy2+V7QVZcIE8t5V4oNXOhOXnvd6alEPb1Df20pyH69PW/gUKved7L/yvVSogzM3pzqi4n6srBH4bpB0Dy2StBKhJ9nTNYYsmilPNpw3BIpy//USO9uMQ9tr71BqQ6H2RbYJl0URJPjpgesLqCL5jJM2h1ytneXsfnPKrWkhv0KAKKhvpMxLetDEXdPIk4Dx3k5iTu9s6adJIBAHBL+a+5+qt1txuwipajyuYXxCqsG6XIbzgCrymiYMkW84qvCoHoMnUia61sJBr0lQAvRDz5LX4H+3Pu7AQ9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199015)(6506007)(53546011)(478600001)(83380400001)(6666004)(9686003)(6486002)(41300700001)(186003)(6512007)(5660300002)(26005)(8936002)(2906002)(6916009)(54906003)(66556008)(66476007)(66946007)(8676002)(316002)(4326008)(82960400001)(38100700002)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEtudUF1Um11UDE2UkJhcjByQTFvWjlLckhFZGdHNWo2T291UE9ZR1RyQXdM?=
 =?utf-8?B?QTFqOWdsRmEwTVlNLzZPalZteVphV1dQUjZXQkVqbEYxOHB6Yit6YUgwb1VR?=
 =?utf-8?B?c3ozUkNONTk5U2RyZnR0ZFFKMHpwbFpoWlljZS9TeFlBNFFXS0s5Tm9ONVlR?=
 =?utf-8?B?WXhZaStQWWIyR3huQUQxaGhReWFhRDVxT3VJL0d3VXFoblIrVVFvKzkvU0s1?=
 =?utf-8?B?WURxRXFHSmlCQjBpdzh6cTRZTEUzdEJUQlFFRTRrS0NxTEZSam1NQWptOThD?=
 =?utf-8?B?V3NNR043YTlBUjdZQ0FHTE1yanpobWtMdDAxa21JMlQ5WlNaVDRkb1NrYnVX?=
 =?utf-8?B?TjgxY3RNME5yK2tMMk1LeEdIek9OdUxCbHhtTlhXNm9xQjUyOEdKQ1ZIVitq?=
 =?utf-8?B?OUoyNWdaamsvOTZWMXk5M3NjV0xERGNGUW1KQ013NzZzb3IzSmxUcGM1d3g4?=
 =?utf-8?B?Q1ljVmhCSjFhMlpVbDRxMlhxa1MwNHhOMDRoQXJQTWxvaitoNmpvNFRZM0hF?=
 =?utf-8?B?SFVKVGMvZUJuTGdEZXNXc0lpbW10RDVLUllOL3cwTFBzeW1CWmFrQnJxVkhX?=
 =?utf-8?B?dnh1TmFYRGJNYkZndmtrRDJsWnJxK1lXalVabFBtTU50ZlFkRk1IQXQyd2wx?=
 =?utf-8?B?Q0VYVXlxOUtMZW1XM2FnanNNUG0vejhrUkk1V2MrczFXRlhrbjlUQnJGa1JQ?=
 =?utf-8?B?eDhZSUpVNy80NXQ1clNOVU1UVnBmMmgvYjcxWWJmR3Y4VFNhUXVpNVFHRXd6?=
 =?utf-8?B?T255WTRZU0R3bGU3dHB1OEhIUnRuK2EyRVB6dzJ4V2hMZ0M1THlKaEowV3Vi?=
 =?utf-8?B?LytkeWxXRFA0Tm80Y29tSXRBdDlqUnJTMmU5WGVEMlEvSzFvNlVUTFZSd00x?=
 =?utf-8?B?T0pwb0UzOHcxZ2xmL1ZoTjIxSHUyNU4ybERSSlZGQVdCVG5uTmZQbTdqbkFn?=
 =?utf-8?B?dXFCZXRuWm5VWGpoazV0ZGJNRERTMDZldDI4M0lLVmdSV3E5VG1pQ2k5WHE2?=
 =?utf-8?B?d2RUVFlucmdTY2EvakR6eVpDWGtDU3RYTXNHcnZBazRPYUFHSHp5VmNhaXhm?=
 =?utf-8?B?dHczOG05OWpiMXlMVEU4R1EvVWozeHI2OEtOb0NFdGp1SDdXN1djWExkYjRi?=
 =?utf-8?B?YzdkcXZKVUJjbU9RK1BzVCtsYXpCbUZ2RXpsYkpRRzFpd00yeXQwOGdUc2R6?=
 =?utf-8?B?YjFEb1NLWHF2aGRNc21xVVlST0VpMlRNTUFuUW1ycDBxODhaRk1uV0xnR2Z5?=
 =?utf-8?B?cTd1cmhhdkhrRHhkb01YcW94WlBqRkkzM3Q5Yjd3VHNIcjFUZnNqaGp4NlMv?=
 =?utf-8?B?Mm1BNzRYZkZ3SUtQRUM3U3lZbnB2enJTaVlVeVkweDUwb1FiU2Y1c0RLenlx?=
 =?utf-8?B?b0JuL0dzVXc0N2lMN05LcE4wUTErQUduZVlDRi9EMDJzUTlNMHFKNytUd1Nv?=
 =?utf-8?B?Vjd0cFhwaEx1UWhFbXgyU2JiajF1SzA2V1RMSmMvM25obzNiZDlDa2t4SWR6?=
 =?utf-8?B?SncwLzJ4WEF4ZkRjVVVNMDhXZ25qQmtWS2hOY25McDIxVlZja2J1dE95OWxi?=
 =?utf-8?B?eE1FME05STByNUhrc3hnTmQ2ZWxjYVdwTG15UjI0cHZpT2lHUzc1ZkFKSlJO?=
 =?utf-8?B?R2g5dGk5V3UvMDYxZWdER2s0d3FmOWZNSVlWUmJlZ3p0OWlmUkpVNG1wc1ZI?=
 =?utf-8?B?eHhzdGJzblZlVS9hSWhzd0oybkZrOEhyS0ZFOXc2QTFHd3c1bVZoTWZ4bG9T?=
 =?utf-8?B?RUxkRGNJZmRLd2x5UDA5ZE5yQjhsaUpLMkNwNW5LamhFQStsaTJWUTRuZkJs?=
 =?utf-8?B?dndpOEJGUGtTb3R3QmNFdlVMYjljZmxiaHdFL2tMby9jSWhtNTV6NHNnL2lS?=
 =?utf-8?B?bEtRSDRXVkRQTmhDekRqbHFGSm81ajJkZ0VzQlNvVHpaYU5ucHppSlJnWmJT?=
 =?utf-8?B?Uy9FenN2eml3ZXBQaW5wbDJ0TmRDSVpPeEFyKytpaWNxNWV0bHNTVDFuRmdX?=
 =?utf-8?B?S04vRDNXd2ZJTFJGNEV3WnhmKzAzQVptRlVGSWxrbUsweVJXWWZYcVBVUHdZ?=
 =?utf-8?B?UTZBZG43TFVFQTgyTjdEZzBIVWxQVkRJYjQ3V0pwUFhsY0ttV2xDQVZ2clFl?=
 =?utf-8?B?UHFjbGVTN3hoSkpBMG9aSTcvMFhoaExOWFRrTUllaUxaUDVoT3JOcGhTTWV3?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d8ac30-d241-40bb-7986-08daa152846f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 13:08:21.1227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1MPhAJthzEk+VSkuEcyFo7uQBuccHLV0C4injCX4W9309QJJro5zjSSgNFV5JXIgDKCYf78KSMS010pIRcP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6482

On Wed, Sep 28, 2022 at 12:45:13PM +0200, Jan Beulich wrote:
> On 28.09.2022 12:08, Roger Pau Monné wrote:
> > On Wed, Sep 28, 2022 at 10:01:26AM +0200, Jan Beulich wrote:
> >> On 27.09.2022 17:39, Roger Pau Monne wrote:
> >>> memory_type_changed() is currently only implemented for Intel EPT, and
> >>> results in the invalidation of EMT attributes on all the entries in
> >>> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> >>> when the guest tries to access any gfns for the first time, which
> >>> results in the recalculation of the EMT for the accessed page.  The
> >>> vmexit and the recalculations are expensive, and as such should be
> >>> avoided when possible.
> >>>
> >>> Remove the call to memory_type_changed() from
> >>> XEN_DOMCTL_memory_mapping: there are no modifications of the
> >>> iomem_caps ranges anymore that could alter the return of
> >>> cache_flush_permitted() from that domctl.
> >>>
> >>> Encapsulate calls to memory_type_changed() resulting from changes to
> >>> the domain iomem_caps or ioport_caps ranges in the helpers themselves
> >>> (io{ports,mem}_{permit,deny}_access()), and add a note in
> >>> epte_get_entry_emt() to remind that changes to the logic there likely
> >>> need to be propagaed to the IO capabilities helpers.
> >>>
> >>> Note changes to the IO ports or memory ranges are not very common
> >>> during guest runtime, but Citrix Hypervisor has an use case for them
> >>> related to device passthrough.
> >>>
> >>> Some Arm callers (implementations of the iomem_deny_access function
> >>> pointer field in gic_hw_operations struct) pass a const domain pointer
> >>> to iomem_deny_access(), which is questionable.  It works because
> >>> the rangeset is allocated separately from the domain struct, but
> >>> conceptually seems wrong to me, as passing a const pointer would imply
> >>> no changes to the domain data, and denying iomem accesses does change
> >>> the domain data.  Fix this by removing the const attribute from the
> >>> affected functions and call chain.
> >>
> >> Personally I think this adjustment would better be a separate, prereq
> >> change.
> > 
> > Right - I was about to split it but didn't want to go through the
> > hassle if the approach didn't end up being well received.
> > 
> > Do you think placing the calls to memory_type_changed() inside the
> > {permit,deny}_,access is acceptable?
> 
> Well, as said before - it's not pretty, but the existence of
> memory_type_changed() itself isn't either, nor are the present
> placements of calls to it. So yes, I view this as acceptable.
> 
> >>> --- a/xen/include/xen/iocap.h
> >>> +++ b/xen/include/xen/iocap.h
> >>> @@ -7,13 +7,43 @@
> >>>  #ifndef __XEN_IOCAP_H__
> >>>  #define __XEN_IOCAP_H__
> >>>  
> >>> +#include <xen/sched.h>
> >>>  #include <xen/rangeset.h>
> >>>  #include <asm/iocap.h>
> >>> +#include <asm/p2m.h>
> >>
> >> That's heavy dependencies you're adding. I wonder if the functions
> >> wouldn't better become out-of-line ones (but see also below).

I would expect most callers to already have those dependencies TBH,
and in any case definitions there not used would be dropped anyway.

Or are you worried about the newly added dependencies causing a
circular dependency issue in the future?

> >>> +static inline int iomem_permit_access(struct domain *d, unsigned long s,
> >>> +                                      unsigned long e)
> >>> +{
> >>> +    bool flush = cache_flush_permitted(d);
> >>> +    int ret = rangeset_add_range(d->iomem_caps, s, e);
> >>> +
> >>> +    if ( !ret && !is_iommu_enabled(d) && !flush )
> >>> +        /*
> >>> +         * Only flush if the range(s) are empty before this addition and
> >>> +         * IOMMU is not enabled for the domain, otherwise it makes no
> >>> +         * difference for effective cache attribute calculation purposes.
> >>> +         */
> >>> +        memory_type_changed(d);
> >>> +
> >>> +    return ret;
> >>> +}
> >>> +static inline int iomem_deny_access(struct domain *d, unsigned long s,
> >>> +                                    unsigned long e)
> >>> +{
> >>> +    int ret = rangeset_remove_range(d->iomem_caps, s, e);
> >>> +
> >>> +    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> >>> +        /*
> >>> +         * Only flush if the range(s) are empty after this removal and
> >>> +         * IOMMU is not enabled for the domain, otherwise it makes no
> >>> +         * difference for effective cache attribute calculation purposes.
> >>> +         */
> >>> +        memory_type_changed(d);
> >>> +
> >>> +    return ret;
> >>> +}
> >>
> >> I'm surprised Arm's memory_type_changed() is an empty out-of-line function.
> >> This means the compiler can't eliminate this code (except when using LTO).
> >> But then cache_flush_permitted() (resolving to rangeset_is_empty()) can't
> >> be eliminated either, even if memory_type_changed() was. While gcc doc
> >> doesn't explicitly say that it may help (the talk about repeated invocations
> >> only), I wonder whether we shouldn't mark rangeset_is_empty() pure. In a
> >> reduced example that does help (once memory_type_changed() is also an
> >> inline function) with gcc12 - no call to rangeset_is_empty() remains.
> > 
> > Can look into it, do you want it to be a prereq of this patch?
> 
> Well, if done, then it being a prereq would seem desirable. But x86 isn't
> affected by this, so I'd leave the "whether" aspect to be judged by Arm folks.

OK, let me split and prepare a new version then.

Thanks, Roger.

