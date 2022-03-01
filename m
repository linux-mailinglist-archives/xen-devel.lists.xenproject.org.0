Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C2B4C8D8E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281514.479879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3MM-00050x-Lv; Tue, 01 Mar 2022 14:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281514.479879; Tue, 01 Mar 2022 14:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3MM-0004yE-IT; Tue, 01 Mar 2022 14:20:14 +0000
Received: by outflank-mailman (input) for mailman id 281514;
 Tue, 01 Mar 2022 14:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfhu=TM=citrix.com=prvs=052ba2b28=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nP3MK-0004y3-QM
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:20:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b274b7ab-996a-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:20:09 +0100 (CET)
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
X-Inumbo-ID: b274b7ab-996a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646144409;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8Jdq0/ohAYWojsb1R/HhqNnDc9KaRrY0G3pRZ4N+EuU=;
  b=Y0NzSIqmgSkR5/Gix9CQ6fJn/fsqv+ktaIBQ1TVhoNjztNfg7mDYM3Sq
   f90asoKAkc3G1U92xbiUBl1ESo8pqKpUoBPHyxYUHYtFhuoBoc1sunwwl
   HVHl9iYpocyR/w5MFAKu198DYrEG5RFSxEbwCEcLIrVxFo54GUyhvRXuq
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67510270
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:j5EnNa191U6k5JW3H/bD5WZxkn2cJEfYwER7XKvMYLTBsI5bp2BUy
 WMYCzzUb/mKYmf1eIskbduxo0sAvZTWzIRhSFNtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1tmZGKQw4kBJTTxuEyUyJITzAhBadvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2Z0XRayBP
 6L1bxJAMk/ufzhvYG4sM7QcwtynmnzyVxtX/Qf9Sa0fvDGIkV0ZPKLWGNDYYMCQTMNZ2EORv
 Hvb/n/RCwsfcteYzFKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fVmmp7+/g023WdNaI
 mQV/DYjqe4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpa9E4tclwWT0j0
 HeImc/kAXpkt7j9YW2Z3qeZq3W1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJv5hH7SylcbdAizrz
 naBqy1Wr64IkccB2qG//FbGqzGhvJ7ESkgy/Aq/dmC46gJ0Yqa1aoru7kLUhcusN67AEAPH5
 iJd3ZHDsqZeVvlhiRBhXs0tMLyT7f+ICgTD31tAH6IxqyXyw3SKKNU4DC5FGG9lNcMNeDnMa
 UDVuB9M6JI7AEZGfZObcKrqVZ10kPGI+cDNE6mNM4EQOsQZmBqvoXk2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwZ50n/uVZ9TCTMIVvgDLdoRrphhE9jiF+Im
 +uzz+PQl31ivBTWO0E7C7I7I1EQNmQcDpvrscFRfePrClM4RD95VKSPnep4It0Nc0FpegHgp
 CrVtqhwkgeXuJE6AV/SNiALhE3HB/6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LcL8BKAd
 NFcI5/oKq0WElzvom1BBbGg/N0KXEn63mqmYnv6CAXTirY9HmQlDPe/JVCxnMTPZwLq3fYDT
 0qIjVuKEcJeHF05VK47qpuHljuMgJTUo8orN2PgKdhPYkT8to9sLi36lPgsJM8Qbx7Ew1OnO
 8y+W3/0ecGlT1cJzeT0
IronPort-HdrOrdr: A9a23:1ua03ai+0IfjBWanRjikfxkJ2HBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="67510270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYM/BMkHRdILa//7Qdal053mUihfcFApfsOWvDOLjrvBfBTxDzchSvarA6gEUwsREf+5hfU4gC7pjpwOxCL0HibdgmWhDVtlTn23sxTyDYRm1p+TZuQL43hzxHD5ruxWTrgOpq7bx3nIffIqX55Fd0KQmK3Ie7NyCrzk2IuEMlqdzFYK4Z9J35z0V9K7gd9DCib9mZtpEzQzjp/D9x/lZFIgqCfCe6BLkLlLxEoXLsDA6aT6Znodcgj789q1dkhmdZAQhrtSGbJn/kw685beXnudf5zVYMh8+O7tWWQ2SPHz5cnESWfKOHjiNu/9jpVSfmHhaK88a69BH6/NXZKpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOfGY3OP8edMG6TcG86RWFr89ImlVtGKDeGPiH+RVd4=;
 b=FxsfQQ5E5+x2t2cN9Y6rEi/oSS44O5rN6UKCeYQ+8GqUBsjLEKleSvkX4DrsDMK8v/+MYDqBtcet+YhB8m5UWvD/WiqPz3JcLoMEjHomCTck9cbGcmG8CtA7mFPPnnzYks588qW67TIc4R8en2ve6khuVaaUWNgJzabKzIS1v2sqyZhbWF8M18VjLpP3qS9co3bUDvP8DM+o0G/3x0z+k2j4ugcdanu7ioZxuzqyaoFu1BdfEFkh5gKzXd3h1Q3pmool5DfLQqqjcT45lhAahURvxSFxrFLb8stMsdiej95ykhtk/iN/G9SiJrW8WIiPOLwDGl3SUqmt8it6W5FWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOfGY3OP8edMG6TcG86RWFr89ImlVtGKDeGPiH+RVd4=;
 b=S07LLasSkxkLP5ui4WUv9OsTZxlA75thHRjE8eMGQXBsu8FrouL9lx1pFXH2rOLWBDBPV4m7zv68uYLFRTc3wiTxewSzV2++zgWPlnlz74H0A9yIX2ujGEfbaMKsr2X2jvKw0doK0Pw/ldxTdI2xgr46W1stqeewDtt3hVy5g/k=
Date: Tue, 1 Mar 2022 15:19:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yh4riyoA0BGgfAYi@Air-de-Roger>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <YhyrAyxhNtNWi7NY@Air-de-Roger>
 <9aff51c2-0e8c-685c-7bff-0ed7ff7347c7@suse.com>
 <Yhzr739VZdRLWnok@Air-de-Roger>
 <6b59e3ea-01ff-e26c-02d4-3b11594fd7f0@suse.com>
 <Yhz4yShnpcyq5IDM@Air-de-Roger>
 <60bcd74d-5686-9813-e3a6-b28c15b66a22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60bcd74d-5686-9813-e3a6-b28c15b66a22@suse.com>
X-ClientProxiedBy: LO2P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79d7c066-fa3f-441f-dd4c-08d9fb8e9261
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5647:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56475DB695BF047BCDC6C3258F029@SJ0PR03MB5647.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGx9RSJ9ETMmFNzBmvlteU55YNOXqY6/1aNm+TWA0v8g7T4nW+aB/f8OgyoRCF/WhLe2XvUJAmRN+6xwMSOi3IhtM7g99p3gOia4+UE3AvplfJLasnJZYNpxy+kK+yb2R7qjWlfQk7cBhwgAySvT6kH5tcGbEZsMcqAH6bvJKFRxOaPeENPOX4O8XBbpqthBICsB/XlL6kf3HqrOrto4fhQe9f8X5UnJbyogZQ3WGYdlc/6c9l00dym3nrZEPTNTXzSLhCv9be38rFv9wqM9KtOiHgiGDNJeBfV275m8kvXKayBSdWR4hT0+v6R1eEeb+ERXFVWlzkNdA6jO1PmD2F2iwbuRMLoPmeKkIcluBhdlXNBTa+OtmNZxYv6RFQQzeeoimga7xBGLTQpNU8uT5wuUPvZ8Rrqmhi805Adm6VLByc4wdwkjhYnzHC/qmq/13ffsdqPLpNXEWUl3Xar5gfDl3jvd8fhJ/CbkvUDUzwI1olEJ6o2YulU+QH+dLSTP3v5gWmwI1E1WCHNZN4lS13XNaVaFg5QCQuFFG/foi0nDCA6JQz12IwRSsS7q8huhkVGDorL3rURtCiUsycdUbx1PYgbMK+S5bQXDFnwqH6AAPeqyR9dCo+BUZfSVJJEcZYb9OIOCzmm5YqlbGEhcPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(8936002)(8676002)(4326008)(66556008)(66946007)(66476007)(33716001)(85182001)(2906002)(6486002)(508600001)(7416002)(316002)(5660300002)(6916009)(38100700002)(6666004)(53546011)(6506007)(82960400001)(83380400001)(9686003)(6512007)(54906003)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTBRcDVvZHY1TjJ5c1JNUDNFM01ZNm1QUm4zZUdMZm9TS0NlK2x2VWErQ2cy?=
 =?utf-8?B?OHFHSlRMVUdCRjJHMjl1eUluczY2cEZFWWlueDVNRjhvc3dVejZzYjRWR3Bv?=
 =?utf-8?B?cExwQWNWWXdNT0ZJdkRJK3l3RU5RWE1MSWhUTVZlcU84djh1S2NoZkZ2WVMy?=
 =?utf-8?B?dk5aWUVRSlh0QWFScitieTU0Q3JLMy95ZlVKWExuQStZU2NMbFJ2MkFxS0N1?=
 =?utf-8?B?aVpqRnB2TWpVWTl0ME1PMDIvTU9PN0lJWU44RzJUc2Rpc2dHOW5LV3R4WU8z?=
 =?utf-8?B?TGExaXpJWkpUMXd5bnFCcWYva0pxRXZkd3k3U2ptQnFJeVQ1a1dCUW9QNEsz?=
 =?utf-8?B?OEUzWDE4NC8wZkk1VHFTVHRSSWNxa2QyYWhYbVdBZkpEemtOS1dGdFJsTUpH?=
 =?utf-8?B?MTQwTnRSakMzdUhYL1kzWlhVSXQ1aGxVUFJMTm5iMWwyNURXd3VoMW00OHpZ?=
 =?utf-8?B?QVoraHZtcTk3WWpmNUdUUlI2ZDdrSzdQMnVXYUYzSWRJNGlCeHR0d1l3NFFN?=
 =?utf-8?B?NHR3SlNtUHlLRWMzaUY5cXJFcW8razFObi9rUmZMeE9OQkZhSHVsd0JkYVhM?=
 =?utf-8?B?MmJzWmlLbGtZWVdEWTRNTC9UVGJNUGRBMmlMTTQwaDRhZUxlaitPMFoxZmxs?=
 =?utf-8?B?QndUaGZZV0YveDMvRk82TjVPeGU4NGlYZHFzRzdIQU5IVWFwZXhxQndrVzBS?=
 =?utf-8?B?VWYrcTkvK3dZNDk4MktIQWhoTzdDTXFaYUlpcHhRL2o5SUlTT2FiTEJHczEx?=
 =?utf-8?B?djRtRThLSGRyMTloQWlXaGlOYzF5dS9sWW1udURnRXZoTldWeEpCRFhoL2xI?=
 =?utf-8?B?Sm1Pb1JPTEIreU9nZzBIUGlpSDBVbW9DSkFRd3hhdlhiNThSSVp2THQxVGQw?=
 =?utf-8?B?K0lEZ1pKWkZlTzJ0c3k0QVo0SW5ObmxpMUR1cVQ3emFRbVdtK3lPWWtBcnNQ?=
 =?utf-8?B?N1NTNWdET0IzSVN5bXoxL0trZHFRaWN3ZEM0Q0t2TmhSYzNuakxNN3haZS9C?=
 =?utf-8?B?NElFVTRCMGw2NE11aFE2NS9LdW9wUzNZQ1VvUWF1eHR2Nm1MTzdldG9aQ2Vi?=
 =?utf-8?B?cmJhM2lLVUFaZzVqSlNpS3ZCT2dWQVlUSE9qT1JvWXlIRG9ibDJiM3BUdFho?=
 =?utf-8?B?UGsxMEhPK3AyL3lZMTFQRTRkK1M1aE1ISlQxRmNsdkgvcFpMZXFxQmVnR0ta?=
 =?utf-8?B?QWMzQXVwRGlJU3FoSWJsWlpyK2NuakVvdVc5cnVwNzZCbnRXRW1FTXhEeUkr?=
 =?utf-8?B?VXphRnllcitSdWxsa2pJWDFMQ1hCL3RHVVFLMXdzRzdIcmUyamsvYnFrVlJy?=
 =?utf-8?B?OXlPWGFXWFVPVlFOTmhJZTFZb2xIcUNpMmx5VnQyUHdqRXZML1BWU1NEZzhX?=
 =?utf-8?B?YmpFN1VNdkRCZURLeDFSYysvdVdhbTlwT05mTThFMXQ5LzFyUi8reTRFcXZY?=
 =?utf-8?B?VGp5YitKOFRMZThlQjlxRUk3SW1VaWVlYkhUbG9ESHU5Y2lEL2ZUUHhCakVQ?=
 =?utf-8?B?eE5za2c3WmJSRWN2UlFMOFF1REpZYzFmMlZvUlhkNUF5MmZsZjVQQktkS3Bx?=
 =?utf-8?B?NW1kWkNQRE1nYW5NMit6ZDNXU2ZkaVBGcHdYUzZVazRNdExmVmdUZndZR1dh?=
 =?utf-8?B?TUFUemVIZWNQU2tWdTZ1N2c3WGM5MTBodW1ZT2dYcXpiYW9kbFd4S0ZRaDM1?=
 =?utf-8?B?SWpUbno0d0RHTWs0M2VGaHlKT3h1eVRacVlLcERabzRmNGp5QlZNNXlwc1A0?=
 =?utf-8?B?a2RTeFlyaTA2UTA2czNUNGF0aVhTelFmNU1DSHJLSVhOWU92Z1RsYXdLNisw?=
 =?utf-8?B?eFhsRktTaUZDRTNpZ0ZYeFg1THBNL1l1bjV6TU1JTTk3THFWMDFQdXgyOXM4?=
 =?utf-8?B?SmFuNTRMTGRDK3Bld1NWTXdEK1VKYUVSY2pRZUhDbG05R0NweFc4Vmp3VlZC?=
 =?utf-8?B?aWdhNXBGYXpYc2VvditDbUh3bTVGd3BMYXZ3TVNFVVFXVzBPRGlPZHRINHg2?=
 =?utf-8?B?QUxRYWlEQkhQQ2V4M2xaR3ZDODc4K2lYaTFvTDFobE05Vm43bElGbnB6OHFk?=
 =?utf-8?B?Z0lwNXd2U3ZwV2g3MVVBR21pci9vZGRCa1ZoTSs0YXV5WjF4M2o2MHZkRHFi?=
 =?utf-8?B?dktvTmFqREdyM0ZrYUZJeGZhek5BclRaQitrVElkbzZ2WGUyRlkxN0hpY09s?=
 =?utf-8?Q?c93Fzw2HceOLw8g8S+0L0UU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d7c066-fa3f-441f-dd4c-08d9fb8e9261
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:20:01.1025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIZZei+yAVN/DSlWxCw2DnZFZHnwGIyfpLyEO1osUKKeEkcqbQ6+hLZuCZcXZrYlVQFtzGmvhW6ckK4xmgYDzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5647
X-OriginatorOrg: citrix.com

On Tue, Mar 01, 2022 at 08:51:59AM +0100, Jan Beulich wrote:
> On 28.02.2022 17:31, Roger Pau Monné wrote:
> > On Mon, Feb 28, 2022 at 05:14:26PM +0100, Jan Beulich wrote:
> >> On 28.02.2022 16:36, Roger Pau Monné wrote:
> >>> On Mon, Feb 28, 2022 at 02:11:04PM +0100, Jan Beulich wrote:
> >>>> On 28.02.2022 11:59, Roger Pau Monné wrote:
> >>>>> On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
> >>>>>> On 18.02.2022 18:29, Jane Malalane wrote:
> >>>>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> >>>>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> >>>>>>> and x2apic, on x86 hardware.
> >>>>>>> No such features are currently implemented on AMD hardware.
> >>>>>>>
> >>>>>>> For that purpose, also add an arch-specific "capabilities" parameter
> >>>>>>> to struct xen_sysctl_physinfo.
> >>>>>>>
> >>>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> >>>>>>> ---
> >>>>>>> v3:
> >>>>>>>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
> >>>>>>>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
> >>>>>>>  * Have assisted_x2apic_available only depend on
> >>>>>>>    cpu_has_vmx_virtualize_x2apic_mode
> >>>>>>
> >>>>>> I understand this was the result from previous discussion, but this
> >>>>>> needs justifying in the description. Not the least because it differs
> >>>>>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
> >>>>>> vmx_vlapic_msr_changed() does. The difference between those two is
> >>>>>> probably intended (judging from a comment there), but the further
> >>>>>> difference to what you add isn't obvious.
> >>>>>>
> >>>>>> Which raises another thought: If that hypervisor leaf was part of the
> >>>>>> HVM feature set, the tool stack could be able to obtain the wanted
> >>>>>> information without altering sysctl (assuming the conditions to set
> >>>>>> the respective bits were the same). And I would view it as generally
> >>>>>> reasonable for there to be a way for tool stacks to know what
> >>>>>> hypervisor leaves guests are going to get to see (at the maximum and
> >>>>>> by default).
> >>>>>
> >>>>> I'm not sure using CPUID would be appropriate for this. Those fields
> >>>>> are supposed to be used by a guest to decide whether it should prefer
> >>>>> the x{2}APIC over PV alternatives for certain operations (ie: IPIs for
> >>>>> example), but the level of control we can provide with the sysctl is
> >>>>> more fine grained.
> >>>>>
> >>>>> The current proposal is limited to the exposure and control of the
> >>>>> usage of APIC virtualization, but we could also expose availability
> >>>>> and per-domain enablement of APIC register virtualization and posted
> >>>>> interrupts.
> >>>>
> >>>> But then I would still like to avoid duplication of information
> >>>> exposure and expose through the featureset what can be exposed there
> >>>> and limit sysctl to what cannot be expressed otherwise.
> >>>
> >>> So you would rather prefer to expose this information in a synthetic
> >>> CPUID leaf?
> >>
> >> Depends on what you mean by "synthetic leaf". We already have a leaf.
> >> What I'm suggesting to consider to the give that hypervisor leaf a
> >> representation in the featureset.
> > 
> > Hm, but then we won't be able to expose more fine grained controls,
> > ie: separate between basic APIC virtualization support, APIC register
> > virtualization and interrupt virtualization. We would need to keep the
> > meaning of XEN_HVM_CPUID_APIC_ACCESS_VIRT / XEN_HVM_CPUID_X2APIC_VIRT
> > (and exposing more fine grained features to guests make no sense).
> 
> I did say before that once (if ever) finer grained controls are wanted,
> a sysctl like suggested would indeed look to be the way to report the
> capability. But we aren't at that point.

So we would expose everything in the 0x40000000 range, and caller
would figure out the position of the Xen leaves doing a signature
check until the Xen leaf is found?

Would we represent the max policy as having Viridian enabled (so Xen
leaves starting at 0x40000100)?

I would agree with this if the hypervisor leaves where already part of
the managed CPUID data, but the work required to expose the leaves in
the policy/featureset doesn't seem trivial. Making those leaves part
of the policy will likely be done at some point, and then we can
decide to drop the sysctl bits.

Thanks, Roger.

