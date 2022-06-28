Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB555C69E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 14:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357083.585493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ahn-0005jI-QS; Tue, 28 Jun 2022 12:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357083.585493; Tue, 28 Jun 2022 12:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ahn-0005hR-NE; Tue, 28 Jun 2022 12:52:35 +0000
Received: by outflank-mailman (input) for mailman id 357083;
 Tue, 28 Jun 2022 12:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XT0n=XD=citrix.com=prvs=171720f04=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6Ahl-0005hL-MZ
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 12:52:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bd6b4ab-f6e1-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 14:52:32 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 08:52:20 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6802.namprd03.prod.outlook.com (2603:10b6:510:119::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 12:52:17 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 12:52:17 +0000
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
X-Inumbo-ID: 2bd6b4ab-f6e1-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656420752;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=s7q7nirPYl6/B6E0QbKRwO6w5gky2w39dAI2+yPMxB4=;
  b=EXH6IlFf3Kq1cVVyENsu2Rs59j+iwBtJCBv4pnzsYrSKkOQLgO1HOwh/
   DYcdVleV8aAACCT79d1nk+0DOq6WmD693EG3YzdDUYSfBYyrHt9uHLmz1
   B+HRY3YPp+22FsjiaeqJDK3BddBIhe7onPzkVlckkOh2Jbw9BlV7o/pih
   8=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 77154489
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6JBunqqrrvLo2tSEU99zO3ptqQVeBmIIZBIvgKrLsJaIsI4StFCzt
 garIBnSPquIMDCkKNpzbdi/9E0O6p/Wx9BrTQE/rH9kRiwap5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrRRbrJA24DjWVvT4
 4Oq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOr/DwfoDVChjCTxME6xjwJTWcEeOvpnGp6HGWyOEL/RGKmgTZNdd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFgXFp2JAm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK+vNqvzSDnWSd1pDTaYHfUdqMff4Nj2eCi
 k/HuEnFLQEzYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGaNoxo0S9dWVeog52ml1a788wufQG8eQVZpa9E4tclwWT0j0
 HeImc/kAXpkt7j9dJ6G3rKdrDf3My5FK2YHPHUAVVFcvYmlp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjnNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:OHyt1aiPFFR4/jb4WKH7feEqy3BQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/hSQRI+Lpv+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+6emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l8dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNPN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wWJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tAB+nhkjizyhSKeGXLzQO9k/seDlAhiXV6UkaoJlB9TpX+CRF9U1wtq7USPF/lp
 H52+pT5fRzp/QtHNNA7dc6MLWK41P2MGLx2UKpUCPa/fI8SgTwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.92,227,1650945600"; 
   d="scan'208";a="77154489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRkvZ50ISYiIdN4DQ8l7dNx5ugdvYs/xYqFd9PvJ8bH4fyzncJlFbIKA6c4sOIc3L+wv7FjhxirERlRuGxsPURTNtXoAshQ6DY0Ghn7WjuCTcmq4YR1STw6x7DbRrk9JJ2v7udZuoF4oorjlYZZQVo6PVH/WN47cYGIteG101G093j/4uZ8GktokaWWfYwl2UJLShFH4FmD4lzqDXhB9SOJdY3WUI6pxAAY5Wl64AcyV7N3iGPZuO0h/NAG+e+cy1fhQUiAHXjdSIV0n71xTlA9PO+eFVZbLLRDQvKXlgcsCJ6N5zVJNFeqCViPma96blTA94j7S7WhEcGFsw7qRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugGCxt2Oi3lZMs2xzCtuqrxzegRH1SjXuinG3eg9hsw=;
 b=XIvDXK2YS0dHFlZp/H6p7AmZz88oYHvZnZM/FiAx198N1dbwPSkNMsDcOkOdFeZBLkq7vbbEMJlIUs4a+59FBPDD1xqyR4F8TP1F3JElRMIEPGFgBy6XyTDVbA4ChWTj1dTKP5KmveeTsCPFDg+LxNon+DSQqQ+fOvgWFgPouKZf1mlQwvhKDGQdFOZ3QMXJPKaUwHpDBr0oDNsxErI6IQPMOHiVVTmrcosBgIt8vpddnFXNpbXaJwvnJ4PIgVqjYW6zHU0QAYPhg23GkNR6FY86xDgVBN7/NwEi/JwBmolHbuJ8fDC5pYe6dPPgV1rYax8Ni+2AE9N6q56EdfeBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugGCxt2Oi3lZMs2xzCtuqrxzegRH1SjXuinG3eg9hsw=;
 b=VORNtgNwWB/cfce6Q6x3HyUBYyKb52Xf2Tt5HsO53ilxuOuYq3oaNNIrHlQmSaklbVTOnv4Eqhgp7JGlnLu/29ctcXQco1t/6HS1GoRupRyJxCqAmcjVMjPguCoEcKsoYmqkckcSpKQ5uK5c0/xwk0inDrtjnwZkpOtS2GfSQQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Jun 2022 14:52:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v6 02/12] IOMMU/x86: new command line option to suppress
 use of superpage mappings
Message-ID: <Yrr5fTdO1CAKfIH7@Air-de-Roger>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
 <99086452-43a8-2d93-ab4d-0343a0259259@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99086452-43a8-2d93-ab4d-0343a0259259@suse.com>
X-ClientProxiedBy: LO4P123CA0562.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4cff0e3-bf38-43a3-a520-08da59050832
X-MS-TrafficTypeDiagnostic: PH0PR03MB6802:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z8UA2bl468k9kgfzII3/WzZieMzHymRLcfC2kpsi5SDVWC3nqNqgNEmbd7bgGUl2Z5qwgV2Qr/FKWalY1TSIzrQ9dYmY/zdpt7fB4509oQpdg096MGKrAPNShMNM/Phw8PmMvW25WHu1RR5+wwS+43iLFEBDenZNMTWzLsaurpbqwGcnzvy2dW+FZM4y0iGzz0fI+oxhYDoLnrLUWSJVOxIxAPYLMpEbwpvkT1/7PKAb1cP+oEK6ww0U24JAJZVty6aQyMfrk9rv7bdtZMtLD4YDN4sVKAOWc1zDyVStOl5QjjOnXZQ8Vz38gK1CMR3ho9uI0KwcDLpWYwiNjRCJQh6pw1dcHcKxXFnp99rxlXZMIQYelCN4mFz9OF/Nq4Tif3LB+0hla36RdaAQWCn9+Ptmed8Ln/vuubWO0h0BlaP1VbTPVrFNdJiTKvTmAe4andzN7wbJpWP/Gfx/PElz6Mwj16n6BkEHMbIIAOWfBulX+lgDPPlFGCNn88rKts4WryFfmHgE1D+3g9hUvHxw4jPyBqNEc3RlcoKGIqBh5uXI8oxlSDhaRQijo/U9miUmfJCL/D7LXE+ONnrIXi9ODghz21AR6vvZmq+VEHvegOVntAMWdLB258MMlOgXE6D/XUZLbuBsWEyc1pZXx+ZjYlFX2sJBZATFeeUAz/bw+EfrcrHuIaVk5PUwYXOJ705HdypHeGnjNc+Z30o+ZVkM60JsPhARPWc1wuCOmKe/kCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(4326008)(82960400001)(41300700001)(6486002)(6916009)(26005)(9686003)(66946007)(66556008)(83380400001)(316002)(85182001)(8676002)(6512007)(54906003)(66476007)(5660300002)(6666004)(478600001)(86362001)(6506007)(186003)(33716001)(2906002)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmtWbHpVREorNXYxbFg5SStwWjQxWmxmY2ttUEV5Vm1ydzZUVDA2RjVzUXZB?=
 =?utf-8?B?OGYxeWgwYmJWVUg4RFdaVWQyY0NhYkh3NzJFMW9FWmVDMU9yZGVZSnM1MVdW?=
 =?utf-8?B?YS82ZDRpbjFvd1M1anJQS3BuRnNkR2VOQUYvVHdMSXY1YzcxbGYxZ1B1SklG?=
 =?utf-8?B?aUlYdFcrN25SNmNXdEFPd1RxR08rWURoVzQvNTlUOTFBelNKZGo1Y3hQMVg1?=
 =?utf-8?B?d3R0bVNGSmtjL3hBOFdmZlRJVnV6bGgzSS92V2RoeFU0UTdDMjErRzlORXBL?=
 =?utf-8?B?SEt2V1FLQjZpQmhpTU13cG9iM3ozbWdqc1Y1N0dZSU5ONnZkS0YzTXpxRVR1?=
 =?utf-8?B?N2VTNVRNRnVWVnI3d2RJaytBdDFUbzM1TUdVT3NnRVdFRDVIN3ZtRnBZUk4r?=
 =?utf-8?B?NVY5ODdsV2lFNGtDQThUSzZkMGRMS3h2YzRYeld6bEpUVzNxcTlUVVMrRXhh?=
 =?utf-8?B?eW1aK1Q0Y1hEanl5OGswK3pndCsrR3AvMENMcUI0dGdycVJuUUtFRFBnTEZR?=
 =?utf-8?B?WUtublFIdXRYZzgvSE1pVjlpUVRVNEZxSS9PYlM0TVY1bTlxVnp6M3FWRUVH?=
 =?utf-8?B?VXVWRFlOKzBubGFPQlF1QWd1L2J4WkxQNXJ2MUJ5akxpSldWUmNqSzY1dmxK?=
 =?utf-8?B?cEtpdzQ4RStTUTFSY1A0WDk4TE9EVVAvVjBVSmIxSmcwV2l6UGN5R3Y0cUZU?=
 =?utf-8?B?cmxSQXl6N3pVUzRBL1pJczhWam1WaUN3SGVGSEtrN29FMWUvbXEzanNFd29z?=
 =?utf-8?B?MmJ5d3EzeStEOTNEdUFubXNTUnBCcm9uOThXYXIzbWpMdHJOZDRYRUIwbDV6?=
 =?utf-8?B?NUVLYXU5cElIM2ZsSGp2a3lIVXl1UStsRW8zSkF0NlJ4eGMzTVF1QW5KWGg3?=
 =?utf-8?B?bm1QcTBOblhuaUJjdDNHZ21UaDhYRTlsRm5sOGFkRHZLcE9NM0ZrVVA2dXdQ?=
 =?utf-8?B?ejA5bVhyeFVzSHlyQWQrS2UwQ1FWLzZOS3FwM254Y2RnOGZ0VGs3ZU9wR1Fn?=
 =?utf-8?B?MG5xTlo5dnFKT214dHB0Sy9mejdGWDNvQzdxaGE1czhJdm9JOG9lOUIrN1NL?=
 =?utf-8?B?TzR6Z252Q0JqbVY4L0pBWkI1WEM3cndKeFRXcTViR3U0NkFqMUdpaHZmRlNL?=
 =?utf-8?B?dlowWmF1Mk9Cek9UTjF2S2J0TnRrRUxocFEyQzgyVU5BcFF1RCs2WDM4R0RP?=
 =?utf-8?B?cTJLQXBGMnJXWm9jdE1kSENXVnRQMVdmczR5UDREclRYcmgxU2MrdGRlYU5Z?=
 =?utf-8?B?KzROdDRsKzFRNEVmMmpaUG5ObGZpRkw3MnV6QzlwV09pTFdPNWpaSDduN2Zn?=
 =?utf-8?B?Mkc2UTRTSW9IdVN0MXBSemozWnVNRnlscDdvZnJPdEZhT2QvRmVPMnhGY2hJ?=
 =?utf-8?B?T1RPdHhqTDUxSHROKzhYdTBVSDduSDRJc1U0N0haWXVaaVBGOFNSUUZLYVVN?=
 =?utf-8?B?UUJsNGVKZnhhSXdxL0o5NkM5aEV2NEdZU1h6K3hFbGFVSldsZ2lEMmorVytG?=
 =?utf-8?B?cHNNeklZQUtidm5jNTFYVlY0QSt3NlRkVXFrZXJGV2JKQmlKbldwZGk5WVQ3?=
 =?utf-8?B?UkllOVI3NCtQSC9WU3NTVmZoUEx3ZnVISDJ5eEFsQTNUcE5VeUloYXJkR2JQ?=
 =?utf-8?B?K29ocXhyZlRBT1VyY2xPd2Q2aDdMa2NjV0hkRUFWTmFscWxYbzVFUlBEMWNE?=
 =?utf-8?B?b0tXT1JwSDdlZkJmbEo2OHBLRkh6azAwSFQwczVZd0lmMzVwbGZVYmRsSjN5?=
 =?utf-8?B?eEg1Sm5PSU5DMXprNG9KZ0tXYmJyWWxuODlPcGRYcDV6VDlZRk95YnJFanhy?=
 =?utf-8?B?Nmk3VzhDbHIwYTMyR1NsajFTamEvU2hLTWZZTmcvNGVQamowMytwa284OWZo?=
 =?utf-8?B?eStiQ2Q4ZnJBejA1a0NiRkRUQXdjVDRacGM1aFY3YytHSVRkSExkMWQ3Zy9V?=
 =?utf-8?B?SGFvVUZ3K21XYWFDK2xTbDIrTEZxRXlob1FvYk1iayt1ZzNCcmNYalRTZDd4?=
 =?utf-8?B?VmdVVE5BQ0J4MnhJTFlZTUovSTN3SVQvRDJCWWY5YzJmOUtEeEs3OUlxSFRB?=
 =?utf-8?B?VjVSVFMvVC9mZ3ozQi9xbzErZUhJb0s0c0JJVitwTko3cjA1U3QrR3YyMmlD?=
 =?utf-8?B?NDdaSTEwKzJqemZKc01aMzR2eTl2cis1Y291ckhjUTBld0tkWUllOEJNdlJ3?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cff0e3-bf38-43a3-a520-08da59050832
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 12:52:17.5154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJJlJVcIvhYB6rxpjmWcU5iSOZ9JEsoV0155iLOuwOymrv64PFlj3N5Wtue5PteFd3WqeGGHVAUN+Aio0Ephkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6802

On Thu, Jun 09, 2022 at 12:17:23PM +0200, Jan Beulich wrote:
> Before actually enabling their use, provide a means to suppress it in
> case of problems. Note that using the option can also affect the sharing
> of page tables in the VT-d / EPT combination: If EPT would use large
> page mappings but the option is in effect, page table sharing would be
> suppressed (to properly fulfill the admin request).
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v6: New.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1405,7 +1405,7 @@ detection of systems known to misbehave
>  
>  ### iommu
>      = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
> -                sharept, intremap, intpost, crash-disable,
> +                sharept, superpages, intremap, intpost, crash-disable,
>                  snoop, qinval, igfx, amd-iommu-perdev-intremap,
>                  dom0-{passthrough,strict} ]
>  
> @@ -1481,6 +1481,12 @@ boolean (e.g. `iommu=no`) can override t
>  
>      This option is ignored on ARM, and the pagetables are always shared.
>  
> +*   The `superpages` boolean controls whether superpage mappings may be used
> +    in IOMMU page tables.  If using this option is necessary to fix an issue,
> +    please report a bug.
> +
> +    This option is only valid on x86.
> +
>  *   The `intremap` boolean controls the Interrupt Remapping sub-feature, and
>      is active by default on compatible hardware.  On x86 systems, the first
>      generation of IOMMUs only supported DMA remapping, and Interrupt Remapping
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -132,7 +132,7 @@ extern bool untrusted_msi;
>  int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
>                     const uint8_t gvec);
>  
> -extern bool iommu_non_coherent;
> +extern bool iommu_non_coherent, iommu_superpages;
>  
>  static inline void iommu_sync_cache(const void *addr, unsigned int size)
>  {
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -88,6 +88,8 @@ static int __init cf_check parse_iommu_p
>              iommu_igfx = val;
>          else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
>              iommu_qinval = val;
> +        else if ( (val = parse_boolean("superpages", s, ss)) >= 0 )
> +            iommu_superpages = val;
>  #endif
>          else if ( (val = parse_boolean("verbose", s, ss)) >= 0 )
>              iommu_verbose = val;
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2213,7 +2213,8 @@ static bool __init vtd_ept_page_compatib
>      if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
>          return false;
>  
> -    return (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
> +    return iommu_superpages &&
> +           (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
>             (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);

Isn't this too strict in requesting iommu superpages to be enabled
regardless of whether EPT has superpage support?

Shouldn't this instead be:

return iommu_superpages ? ((ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
                           (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap))
                        : !((ept_has_2mb(ept_cap) && opt_hap_2mb) ||
                            (ept_has_1gb(ept_cap) && opt_hap_1gb));

I think we want to introduce some local variables to store EPT
superpage availability, as the lines are too long.

The rest LGTM.

Thanks, Roger.

