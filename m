Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BB95F083A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 12:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414093.658181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeCsN-000175-HF; Fri, 30 Sep 2022 10:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414093.658181; Fri, 30 Sep 2022 10:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeCsN-00014C-EP; Fri, 30 Sep 2022 10:04:11 +0000
Received: by outflank-mailman (input) for mailman id 414093;
 Fri, 30 Sep 2022 10:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6brQ=2B=citrix.com=prvs=265c464c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oeCsL-000146-CO
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 10:04:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3771adcc-40a7-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 12:04:07 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 06:03:58 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO6PR03MB6209.namprd03.prod.outlook.com (2603:10b6:5:355::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:03:55 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 10:03:54 +0000
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
X-Inumbo-ID: 3771adcc-40a7-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664532247;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dyvhQqM3zw+q+Z2ExMdiluhz3OfGCk8UrPbZafiZ0ok=;
  b=OMtemyNiJkzMcLrxYq3BKmPCRudE0domi3AvxtcZX3c8n/4nr4hYfF8+
   fTAuCZuic5aVFP3F2AdJBuU/JOOAHgKZXaHfXUH1rsrohZCiNrGWntHm1
   /rI1k4EWNGb7bdVgfeG7BSrUMtR/7JR4kstBNbIun0uDr8KV4itUfMZtt
   w=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 80819171
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UNA/5qOMrnKptEzvrR2+lsFynXyQoLVcMsEvi/4bfWQNrUp01DJRy
 GQcDDqHOPrcYGCkLoxwPoi3/UsAvsXdmIUySQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KWp4GtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eMLEA9uF9Qlp03
 6ISKRQPTi2Ntd/nz+fuIgVsrpxLwMjDGqo64ygl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9xTM+vRfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPkWrcoyvz34cjmwu4cdwNLpe+2sVhkVu23kgxJwdPBFSC9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 kCNt8PkA3poqrL9dJ6G3rKdrDf3NS1LK2YHPHYAVVFcvIelp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjvNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:UfOf+ah7LuSnb8FSXBTph7azm3BQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nGPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SuV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A7eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Nq+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQf003MwmP29yUkqp/1WGmLeXLzQO91a9MwI/U/WuondrdCsT9Tpa+CQd9k1whq7VBaM0pd
 gsCZ4Y5I2mfvVmE56VO91xMPdfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="80819171"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu8nIvjnh96LP+CYkujMPyOa8i05hnIG4SwTAXfsPzIFjlsuZuGkFF686mhTlyzWPrGDN8eZG2YF5XCrHwvGzskfRAwI1O7bGGwmGhloID1pzbllk7sjSMk4znmrVslMe0pKdyQ1CZnrFqYHpcgVuSQeXL7uOnKkIQv46/uGsTOuDsd5Ybz3zmU026yTCaE7BCh7K6DLhoMoJv2xSfw/S81E0pC23QBtk7QdIaFoSXZF9084uP6B5RpqSeWaVybTM44DXrXNyp9wsqTbO50HuPelPypgJRK5PSJJa4mllbujnjAI6N+RQnXNdtFg4Bb8xaI2j+zNzbG/zt9pCGHhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuE1sTqW25DiE+I//Yzl82T6trxfFKMDCtda5z28jSI=;
 b=IWUBfX+tpmulQfB3+JCrlvTydGbZk8qANJ4kTuRQjbTTfVuP5KJHaGHeawER79BoflPfLxRDG+Mk5gyPciMb/MpRtLyLGk/iglP+CWvdeJU9OnwMUMxLCJgkD/zFKvtgPCt+AT5KC3yNbh+XuZM3n/Uw+QqPseKUVK2a2mrKD2MhzwdLvQvkXx+xJPzuiWq+ImU3AyizZEEEu9S2gJM9umgd6YzH+ltv5HnxfEZm1S3tBsX4oz83DUfDrNiZjIJAY+9c1SmkT3FgTeS1HjxKyMmDOWc572WeXl1xHGpb5IewREWt50rpGTHVW5Xk5TE7OCPNco+bGC0vwsCp2xKYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuE1sTqW25DiE+I//Yzl82T6trxfFKMDCtda5z28jSI=;
 b=Lsw0kRn8/+0nsvElMLVvnIVPShBjNu99P0HMiX1laEPtCo41Np/IiSYKHnjW70oYz7uPuawl7JoFeuf5rhNJ+WhKgxFcwpX4bq51Vuig/gJG2LLwjiDlt/iPiLR+6E3QJmMEd8T9dBmXYZPx3EQQwee2Z7rm66SZIh9yGSoPKUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 30 Sep 2022 12:03:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Message-ID: <Yza/AX8LmAbJuD8i@MacBook-Air-de-Roger.local>
References: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
 <Yzan9D2gZJ6yN3wq@MacBook-Air-de-Roger.local>
 <bf0168ea-f78a-477a-d3f6-cbff22b07cd1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf0168ea-f78a-477a-d3f6-cbff22b07cd1@suse.com>
X-ClientProxiedBy: LO4P123CA0246.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO6PR03MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ec9233-569e-4f71-e437-08daa2cb1547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ccZ8Lbj4qAC/rxqvzc6bvtq/9LMLbyFjNL313vc5eScYAB7PslF31d2LQN7RIh+4FuSBaCWrXuVw67tNxwDoDv1pauF3u44luTBWdv9DTpUcYcZIT0JgScDu7JytGdcCxWUF7vL5xtXmCDWoKuU5CVVmtBekXL4aRChZYh839kyQQyJK1NszL9+prWzfpvNBLvZPA5UqOkEB77imqa1Jrk1mY7sSRSyBkDeC8JJLjD01otnXxhFb2UQue5P4lFUsQWvQMM0sqibumKoSZJIpduCUel56iEojUtya6RW/0PMdwuJ26idGlGr5rCt/yB/S91P+TL5FVvA7N8JzgXcVby2dyU0tJfpT2i56/yu5J8IT7hbZR4Wo5u5bUZ6E1ZNfORLvABiUGWzMLVWi2SKFcT+kvfFWax0KcJKI9EQ4INwnPPkVDdjwxWZubGHeqPLEPkClXBiu750ETwbmDkAtasnM4YFlb6zS+JBCyanumtJaS5/xR0h5jwQss3HHbDLksFOVxy3QxTnkccG0t6LOyhbDXb9X9cD6w+WPVTkMtORsaGsum+qa1o7xPq9I0TuyQ8uymWtxPSBYKuzw6VwzVA8ppIOG/WZYouM1dkY5iELvYXIE3wME+OUBLmSnbKZiY4lGml+fsuJgbHxEVLB3m10IyN+cYn15Pc0Oa9oqH7s+nh1jLhdfWoaMppXVPpszULTkxtkjvJiTI3XyHvSX0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(478600001)(6486002)(82960400001)(6512007)(26005)(85182001)(8936002)(2906002)(6666004)(86362001)(38100700002)(5660300002)(186003)(316002)(4326008)(41300700001)(66556008)(66946007)(8676002)(66476007)(9686003)(53546011)(6506007)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGtLeVdCMFlNVjloK3hpbHBhVCtVUWMvRFBZY3BNLzVPd2lNRTRMTEcrU1Ex?=
 =?utf-8?B?N3Bhdk00NW9mV3h0WlZPTEsrdUZ1ZVhzbjQ3Ym81T2lyUUQ2Ni9NZkUxN0hB?=
 =?utf-8?B?RzVJUXBxTWVaVmhPL1JoNU56d1F2eWRlVVo5T1EwY1hYVGFMVmFEOXI5U1ZO?=
 =?utf-8?B?NEc5aE9mQktpeWhzcXZRNkE4Qjd5Q3NKam53SGxwSXJLcHdVT3pMZzBIR2VQ?=
 =?utf-8?B?S3FHUllFT1NBRk16OGlQV3dST3NndEJ4enIxdHFNNE1PbTEyWlZLQkJEc3lY?=
 =?utf-8?B?dUMvdmgzV2kyMDB5cWxZMG5oSG1XbFEraXRGLzZFUmh2L3FMU2RWRmN6ZDhB?=
 =?utf-8?B?VElrRFRzMUFRcXhybHNmeGpuRG9IcDlVcStMZ2RzcEpmOTJpVGFzUWU3QkVI?=
 =?utf-8?B?TmVwRWplTTJueGNKRE9GMGVBUC9pczZoYTRWMFY4Mk1CNDFKVm96OHZRbkpT?=
 =?utf-8?B?dzlKam1SZUYvRys2ZnM5NTRnRStjbmdVQTBEUVc1L2Q0UDZ2RVhUcWw2RUsw?=
 =?utf-8?B?OFhzU2Nya2RoekNrWkRzaDMvMFhsbEdrZS9RaXY4N1lyMmlOOC96ZVlVMmtG?=
 =?utf-8?B?NnVyTGx4eWphNzREaDlWS2U3SlBmR3FTcGJjSndZcUVvNzR1bnQ4M2JNVTNn?=
 =?utf-8?B?VHBNL0M5dUYyUTJ0TW5ISy9ubnZaQzduYTVqcU9TWnNldnl4VVV3emhyWkJz?=
 =?utf-8?B?Um8yQWpmcU1NdDVFRm56aFJ6Sm9ZTmpDbTd3dVdKc1BVZVZIa29pZlovelYx?=
 =?utf-8?B?ZnhwaUdmQkhXUUExanNZZmlhMzdPUGVvNWRrc0pzUjBHWmM4WVBwL05NZXFN?=
 =?utf-8?B?Q0pFSHVhd2NYTEZKeEJOeUdGVWlaVUtnUkNpZTNYRnhsbTkrMmtRa0tYdTVr?=
 =?utf-8?B?WmdmTHlzbzlPamd4VHltb2RMeWM0enIzd2F4eHZ5L3JhaDFBdHFGMWo5YTJy?=
 =?utf-8?B?MkY2ZFc5dmFTY2N2K1JBT1YvTWVoYnh0WUl1Q0pzcW40T0tVdmFoTjVUL1p4?=
 =?utf-8?B?R2I5OVQ4d1hDNU80UjQrdlIxQlhhbHVjdmZXdEd2eHlrL2F1V21EbDZpdjdh?=
 =?utf-8?B?VDNYSytROGtUOGNiN21lNElaU3MvaEtRNE94OWdrR0VQTytuK2VtdkREZzBt?=
 =?utf-8?B?cytoQXB3R0twVmhzOEc1SnloRXJzRzI5bXA1L3UvSSs4TnpkdW8xZ0RzWVJj?=
 =?utf-8?B?Z3NOWENlY1gyVXdpdTVzR2JQV0tCR2s0a21aTUJLd3VqMTRWdnJhR1RubFdy?=
 =?utf-8?B?ZmJxNUdNczdOWXZuaEpUQ3ZmVE01L2o1blg1NFVYUnpRdVNoZ3hqai9VTWs5?=
 =?utf-8?B?SDFUWGtXZEdDZGxCK1pJdkdYTXpobWRRd2VwUDJ1a0pQSnpQREVSanMwc2g0?=
 =?utf-8?B?aDZ0bklPT2Q0RVFCYS9NeWhLdnhIMGo4TWlyanpWY0ZydW5acUhxcndCZTdl?=
 =?utf-8?B?TWZiNWhKaStETzFXaGN5Z1dZcEtJRC9MSnpyZDNXMG0rd1JzYlFKNmVjMEVL?=
 =?utf-8?B?ZDJWalIvWEhTVkVWUW1pK21UOU05aHBSY0l1RWVBUmU1cVQxVzhpcVJ2MzVo?=
 =?utf-8?B?ZThZRjZNamx6RTlNVHFPN1ZpRVNnSGJMemhFMU10V1p6eE9EM3VVTGRLcks0?=
 =?utf-8?B?SHdJMWk1dmYzemVaanZSdlA3cXhQVmlqMlJFYlhJR01BS3FUT2dRRzlJRS9y?=
 =?utf-8?B?WXdLU0Y1eEN5N3FINUV0NThqcFd4U3J2NnU4N3g1cTdwNGx4NmNmWFNPZ2Vl?=
 =?utf-8?B?RDhib1lOcVdpalRlekk3TStVU1F4cDVkdDE0dm01ZmF0c091dzdlR1RxQ1dK?=
 =?utf-8?B?UVhISllRdVhRLy9BcFgwN1hIbVFuZlNYMkwyTGlBR05Rc1NmRWFUQUh3SkRM?=
 =?utf-8?B?M2JpM2RNM25UREh1ZHN0aVh1dUc0SCszRFErMXZoVnRvUE5lL0JQWTZjbWdx?=
 =?utf-8?B?Q1RaRkRjNDB5OE9OczVuR2hHTVdkNFNvVkt2Skt3UUdZQXl2b1UrM1dZQlNE?=
 =?utf-8?B?VlhaUmtrL2pENkplcVhWZDJQV3JkengxK2lJSElpc3lvVGZ3cTNyWitQamgz?=
 =?utf-8?B?cmpBVHoxV01KWEhiYWwyZlh4dTl5YmpiTXNEbk1XNzJuMWV4QXpoU0xIcENh?=
 =?utf-8?Q?GYPc2kRpyHPXa1KAnj0/hDQ2y?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ec9233-569e-4f71-e437-08daa2cb1547
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:03:54.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBj/o/lb1nVbuVaPFyyhrIVD195yjXct/99p001TeQ/ok/bMYqMhXQSjRiOOVUA5LTXwiDD625EtJz9lrdpfrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6209

On Fri, Sep 30, 2022 at 10:36:20AM +0200, Jan Beulich wrote:
> On 30.09.2022 10:25, Roger Pau Monné wrote:
> > On Tue, Sep 27, 2022 at 06:20:35PM +0200, Jan Beulich wrote:
> >> SRAT may describe individual nodes using multiple ranges. When they're
> >> adjacent (with or without a gap in between), only the start of the first
> >> such range actually needs accounting for. Furthermore the very first
> >> range doesn't need considering of its start address at all, as it's fine
> >> to associate all lower addresses (with no memory) with that same node.
> >> For this to work, the array of ranges needs to be sorted by address -
> >> adjust logic accordingly in acpi_numa_memory_affinity_init().
> > 
> > Speaking for myself (due to the lack of knowledge of the NUMA stuff) I
> > would benefit from a bit of context on why and how memnode_shift is
> > used.
> 
> It's used solely to shift PDXes right before indexing memnodemap[].
> Hence a larger shift allows for a smaller array (less memory and,
> perhaps more importantly, less cache footprint). Personally I don't
> think such needs mentioning in a patch, but I know others think
> differently (George for example looks to believe that the present
> situation should always be described). In the case here a simple
> grep for memnode_shift would tell you, and even if I described this
> here it wouldn't really help review I think: You'd still want to
> verify then that what I claim actually matches reality.

Right, that's why I like some context with the patches.  Sometimes (and
I'm saying it's the case here) the context analysis done by the patch
submitter is wrong, and hence it's easier to detect and point out if
it's part of the commit message.

IMO it also helps when looking at git history.

> >> @@ -413,14 +414,37 @@ acpi_numa_memory_affinity_init(const str
> >>  	       node, pxm, start, end - 1,
> >>  	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
> >>  
> >> -	node_memblk_range[num_node_memblks].start = start;
> >> -	node_memblk_range[num_node_memblks].end = end;
> >> -	memblk_nodeid[num_node_memblks] = node;
> >> +	/* Keep node_memblk_range[] sorted by address. */
> >> +	for (i = 0; i < num_node_memblks; ++i)
> >> +		if (node_memblk_range[i].start > start ||
> >> +		    (node_memblk_range[i].start == start &&
> > 
> > Maybe I'm confused, but won't .start == start means we have
> > overlapping ranges?
> 
> Yes, except when a range is empty.

Hm, OK.  Won't overlapping ranges be bad if not empty?

Shouldn't Xen complain if it finds overlapping ranges, or that's taken
care somewhere else?

Thanks, Roger.

