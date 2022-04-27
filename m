Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B51511529
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314860.533146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfD9-00031M-ON; Wed, 27 Apr 2022 10:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314860.533146; Wed, 27 Apr 2022 10:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfD9-0002y0-Jg; Wed, 27 Apr 2022 10:47:55 +0000
Received: by outflank-mailman (input) for mailman id 314860;
 Wed, 27 Apr 2022 10:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njfD8-0002LY-Bc
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:47:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c427951-c617-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:47:52 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:47:50 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3403.namprd03.prod.outlook.com (2603:10b6:4:43::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:47:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:47:48 +0000
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
X-Inumbo-ID: 7c427951-c617-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651056472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=BpP0m7aKbLABzlgc2LX2HlH4wa0142cM46ZjDoJX6eY=;
  b=htk4p4878Gp0Xzb52RijzVkziUAAxCBKEjTtC7aouZLEAVUV3cSbWppu
   9G0Y563Xi/luvZ3LUKmHLkSuHu537MTqykIFAHUvxOdipH0XT2sK1ZL/Y
   p/KDWZeMkNr2aPZ/CG4ewE8eO0OvLG4v6EPzWot7p1XHzBZ57WymMS2xL
   Y=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 72483422
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mECP9KMFyhjdZP/vrR3RlsFynXyQoLVcMsEvi/4bfWQNrUoj0zBTn
 DAYWzyGPf7cZDDwfNtwPNiw8ENU6pCAzYdjHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NAw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 tRdt7juTVsTNZLFlsgTA0MFHxhMMvgTkFPHCSDXXc276WTjKiOp6dMxSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB5GdaaG/SiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33CWvKGEC8jp5o4It+mL80RRe4oHcPYPQWoKIfeEMgF6X8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHsg/IHc99ZEul/4gfSzKPRul6dHjJdFm8Hb8E6vsgrQzBsz
 kWOg97iGT1otvuSVG6Z8bCX6zi1PED5MFM/WMPNdiNdi/GLnW35pkunogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:VabN8KyG9kkuYdfKA2OQKrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhORICOgqTMyftWzd1FdAQ7sSibcKrweBJ8S6zJ8l6U
 4CSdkANDSPNykcsS+S2mDRfbcdKZu8gdiVbI/lvgtQpGpRGsRdBmlCe2Wm+hocfng6OXN1Lu
 vU2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpAoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPXi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZNIMvD0vFnLA
 BSNrCd2B4PGmnqLEwx/1MfjeBEZ05DUCtvGSM5y46oOzs/pgEN86JX/r1bop46zuNNd3B13Z
 W7Dk1WrsA/ciZvV9MaOA4ge7rBNoWfe2O7DIqtSW6XZ50vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="72483422"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwL18PuxYiUSYXw1mfZo4CE9EtW1nAdyiz3XuNCS5OVi5J4JGH/qVW2iN5ApP4EhO7gi9kdPJANq9G73Rk5KiibkqsmkABWTsX5Bet+iXJMmKZkMD5oVRWpz0K3/sdGmu/Syg2jSMfV9D6NqqJa99Mnv5oGaFKlZOd1+YNnVFXhtwLpAiwhT5KvzXC/6QXj2ZloEWXwy7WQW335vcmMo40lEAy4uPvxBM8+DICuh+2FAjg+n5yfY506ZhCb4niuWTWU0PVha7DMyiVauYLwU7vQFfZ881+4huJZfX9KAbLeCN8BrZHpGtxe1HmVkPdtw25tHUxabcYavdeneQEnQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z12lg9DG0wvGLeF3XX3a2VomQuQ550jjqifJz8ePXvE=;
 b=RtTXLaPO4GF1HsvCHr0+FINX809520fZj/k46blPLVnmhSp6oMjo3de++nYb93R+lzleBeSJy1Ju6RoXE9Ct/X/NJfJCsRvyHdQ+n0kGpmcE+GoFljdrpND1tnZb3Uxli5XfEhJfZU+YIGfjX3exw9bKSPphhj/CedYTVhh636RJiITW0gzbKScmru5a8QhEd/Npja4IDmx7mCHN5x9njqsjD33QmNU3MEFFzRHtdfPhCy9IMTKyeOgHMyV9uS2AJdQRUQY0outcctOMYBbhQLhId9Va2+onsHk1YKb911IJspHWc2oe0DMx9tKizC+h16GoPYl/jIW1pq3XK7SYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z12lg9DG0wvGLeF3XX3a2VomQuQ550jjqifJz8ePXvE=;
 b=I7538quEMle03dYlt9D3+d/sCUZkioAkjlYB+X/y+t+uG5W7YWNunn/vZpWw5ynJyedkOW+cJp90wYI6nzYvw5noBkHi6Kzh0kiQILcZwaQHnSCTWARQfbGJtbR3bUoOEjvQ9fImAvKCNWsfwobb87otP4QbQu9lRZClEo9P94o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
Date: Wed, 27 Apr 2022 12:47:18 +0200
Message-Id: <20220427104718.81342-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427104718.81342-1-roger.pau@citrix.com>
References: <20220427104718.81342-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04e68e45-9edc-42a3-f8cc-08da283b5e8f
X-MS-TrafficTypeDiagnostic: DM5PR03MB3403:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB340300BE1E5AB1B4F898065D8FFA9@DM5PR03MB3403.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+KX6jJb0kutyHhzD0I8J+waPvkHnUStq10QFwfq3DvlPGvwNrBQS+ORF0daBa8ucZucHHpnYWDGx34e+IpzS+mXMmfr8ARhPo8Fi3E0PGOZCk6iainldPrFXWhSTQTIAXd6dpmo1vNU2InTdztS4vtkbcZ4N0c3/L36Gz2eLW2J/Y3MvT4gSsM3WC2yUl9FI8OkiRrriJY8A4Ymrh84VOt3Cmd8if/LLImOcWP7v9xCGYGWx6Oygw7B6UFUbbXZUt/Iatmkv+iKTY59+cwHLKPW5npPXrWIIguGq24+j581SvYAfS6l/3eizaxHvYhcJG2mEqbbbjmcrCHt1y4rLfT3nwxIq8gtkTMOb8XcfciUS+gwBW3WIDYocyFAkGlu0PCMj4xFQDFXD4RZaIjGNz1lyzAu4TDfhEcujDzuX/oyYEpc1dPACB78696UWtbnsPEtbzCYFA7Eh7+j1dFDNaKZTGFtmvRyGdSWtU5XjiLslR8deduYCxj/UnHBqF5/OQRfXguA2QWBPZPN1dmcB/9fzXK6IhzI1NHHGSX5QWiP6DWIKfyGMK7vQFd6YFHyviG4VHh8wzetMbsmkaNQFE1IvxHiZrOnalNcokv2bgmeUrL+bYleCln+Z0tejd75qp2Fa0MVB18EqQDVP4RyWukjoYs1uKqDqADKwd8guLdo7zAKYgpvhGvIrpoK36M0nUMTJL/MXzygODz3b1PTlGEAXKwsSYnnpy6lEltmxadxnI1NPZzNwr/zk6SNuxG8hgs9wc2Bph903INSPXEdsiItYcaKqEi1TEZdEBKpxPqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(966005)(6486002)(6666004)(8676002)(66476007)(66946007)(86362001)(4326008)(66556008)(6916009)(54906003)(38100700002)(36756003)(82960400001)(6506007)(1076003)(6512007)(316002)(83380400001)(2906002)(26005)(186003)(5660300002)(8936002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEV5TGxtWHI0VFVXUHBlaUgrNll1UHRQcW92T1M0SkdiTVh6cGVLQ0pIdFhL?=
 =?utf-8?B?YmxOOGZEUmdJWmxpdE9wbk5QZmwwa2FmRUhaZ0hxVnVhZVY5Mlh2cEg4dzRG?=
 =?utf-8?B?MStJbmY3MDF2eWlxUE9sbTBTeDhwUkJWQWxBQXRmcHJsRkJCay8yYm12bmZP?=
 =?utf-8?B?Rm5nNVBPZDFTNWRKZlhNNHVBZGRzZUNVM0JEcDl5VHdheERsRUtlZVlQay9y?=
 =?utf-8?B?Y1NIUGlKVkk2aHNtQVRUSS8vaE5PdHZPYnpZQVVoTGFFMFBXNmlaTkRoUzNS?=
 =?utf-8?B?TXFHRStNR3ZzRjdmdW43ZFExNnViQUFxSUZCNDMyVHdaZnc3Uk9pempmWWdG?=
 =?utf-8?B?TU1udS9zTy9HbW9MN0Zlblg2YjZLVXVaaG9OUmo1bDh1Y2h2aUdwTU5wdmJj?=
 =?utf-8?B?TVF0V1h4TnhxUFNpY1hwQ2V2cGZiM2FMdTd4TzRrSjkxN29DNnFJNFBnR2VX?=
 =?utf-8?B?aGVTeHplWGtvaVZZUmZ1ejhGbGVEbXYrTU11ZktaMFdRNm4za1dzcjBVbzRo?=
 =?utf-8?B?eFM3ZmZRNmpTSUF4T1o0cnR3bFlqaCt0TmpPT0h1d1RudlFFYys1TGxwMkt4?=
 =?utf-8?B?M1dwOTBYdi9tdXFCcm9zNS85SEQyLzNrZ2JkZmFBYi9NMmM3aHZxellycms1?=
 =?utf-8?B?Wnk2RUJuVkF5a0xPQnM2STRhVklWRWFNSytuSUNWNWhBcS93QVA5TWtkUUVh?=
 =?utf-8?B?VHlYejVxejRteDhnendmdnM3b3hKVkZQS1dVTHpTdVZ3MWZRbWhqMUdRdlNw?=
 =?utf-8?B?SDRmNFdVVUtTVHVnMTNCMlRJYmowdHNucDRwMFlCSE8vc1l5RW1tS3Brdms2?=
 =?utf-8?B?S1prdmZaRzZLT1JkRWpmWEVraFRtVENPYzYwWnovd3UxUHpWY3MyeGxVcWZj?=
 =?utf-8?B?QWdJZG9aTEl2Tytuc0x6MEd6REZwbm1tUDFhMkhmWkVpTWhtRnVUN1ZQd05M?=
 =?utf-8?B?OHF0SVVSZGV1eldZOVJKcjdnMXZ5UmZiajF5d2JQRkhXS0dUa29ReXlGbTgy?=
 =?utf-8?B?NVlQWTZDcXVoaGVEMkFUaXVzT1FTTnB0bml4NkpkWDRJQmNNbWZscW5lTkMv?=
 =?utf-8?B?TDF6MndibnNtSTBrTzMwR2o3UjljT2d3dkt2LzJPOXUwVTNlY3YwS1Blak9h?=
 =?utf-8?B?V2FxcFF4UEVjV056M0JTV3ZMSHNUamlVWEswckR2c0wxT0JSU1JpT3l5ZS9w?=
 =?utf-8?B?SXZPTVFhQVN3b0xqYUhnVEgwd2ZkTTdpRjZSUGp6bm50NnZ6MFF1UEdRbjd1?=
 =?utf-8?B?aTJ4YlJkTjI0YjgyOTZocXd1VXlrMm1RVWlqUEM2VnRyTThReVMxSGNkcW9J?=
 =?utf-8?B?QmM5cUxzcWRDQTY1MEdHdGMxaEMwSDJCWUZMM1hvb1RkL0dVV0x2eUkvY3Rh?=
 =?utf-8?B?RHlWZGg3d0J6SW1NOEk4L3VDc3YyQVFRQmp5ank1Y3lCNGkrL1ROWGJva0M0?=
 =?utf-8?B?SnNtSlFtY015bkhGcDJURm5IYUQ0YW9DSWE0bHFMOHFaTkhTVUpKekE3NFBQ?=
 =?utf-8?B?SG5rUHlrOFE2NStZZElaR3FiWTNnSndoQzlkT2hzWTg1dUVHOGl4bWRDV2M2?=
 =?utf-8?B?aGZIOWcvNjEvV0Q5cElxNnlmUTNpejQwODc4b3ppTE11VSttKzVmZ0srdmFG?=
 =?utf-8?B?LytkUWFyd1FmS3dXMytFakYrQVVmdDFRdUhuRWhoVndlMk5lbkh2czMzNDJu?=
 =?utf-8?B?Q0tueFRYSUZsYzJiWHJaek8xVnpOd0JBRVJFNjdhSDVPNU92TTV1RUxITWhG?=
 =?utf-8?B?M25SNktRZ1B2OE42c1VyTzJCU25sYTJNU284c2lZaXZsYXppSUx2VFF4cnNI?=
 =?utf-8?B?YW9VOVM4RnVyYi9EcWliNlZvRVR6Tjh6VytoOFdoWS9ZZlEwRkQ1L2ptQnpW?=
 =?utf-8?B?WjR3RlhQczNJa3VTT1ZLR3dyUitqd2ptaGVpYytuQ0RaUDBZVzdZUjdsRG5u?=
 =?utf-8?B?Nm5kVUhNQ0wveDl3STA0U3Y5MTd5b1RCRGxBNFJmbnl5eDZFbjJCaFFWZksy?=
 =?utf-8?B?Z3NFQ0FRazN5eWwvZUtid0I4Q3VBZExIWU8rbS9YZFdzWkRaMHVqSXd5S3BW?=
 =?utf-8?B?c1FRZjBCRHZobzhGMzUzTmx4VmU3b0lCdHBodzdaUTkvWC9QUFQzdDh4YWpv?=
 =?utf-8?B?U29udUY0RnhoTFRDRjVaTjFxWlhzZ2c5ZVZ0eTFpWmdBajlXNFErMHdJSldy?=
 =?utf-8?B?WGRVRDl4T1BwdzBoWXNqSTlJTk1jQ2tCbEFwVm13c1VGb2hLV1h1Y1hKT0VY?=
 =?utf-8?B?VnZRM2l2Z1c5OW1UaVcyK042Q0Y3UVdKK0MvV2hOVHE0NnB0RzdnVzMrcGc3?=
 =?utf-8?B?L1JMd1RDUncyVVVDUFE3WHEzM1ZhNDVEbVpxVlhLOElDeDB1dnpPOEcySXhC?=
 =?utf-8?Q?syxRIgWj0yGfpRJ8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e68e45-9edc-42a3-f8cc-08da283b5e8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:47:48.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gji5NHHtghA0t5WwpjUQspkvClDM+SVBFsO/I2asCS566eGvuV402ZeyforX/brpyZm9lu+J5qxoUzkOPJsOfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3403

Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
allows for an unified way of exposing SSBD support to guests on AMD
hardware that's compatible migration wise, regardless of what
underlying mechanism is used to set SSBD.

Note that on AMD Family 17h and Hygon Family 18h processors the value
of SSBD in LS_CFG is shared between threads on the same core, so
there's extra logic in order to synchronize the value and have SSBD
set as long as one of the threads in the core requires it to be set.
Such logic also requires extra storage for each thread state, which is
allocated at initialization time.

Do the context switching of the SSBD selection in LS_CFG between
hypervisor and guest in the same handler that's already used to switch
the value of VIRT_SPEC_CTRL.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Align ssbd per-core struct to a cache line.
 - Open code a simple spinlock to avoid playing tricks with the lock
   detector.
 - s/ssbd_core/ssbd_ls_cfg/.
 - Fix log message wording.
 - Fix define name and remove comment.
 - Also handle Hygon processors (Fam18h).
 - Add changelog entry.

Changes since v2:
 - Fix codding style issues.
 - Use AMD_ZEN1_MAX_SOCKETS to define the max number of possible
   sockets in Zen1 systems.

Changes since v1:
 - Report legacy SSBD support using a global variable.
 - Use ro_after_init for ssbd_max_cores.
 - Handle boot_cpu_data.x86_num_siblings < 1.
 - Add comment regarding _irqsave usage in amd_set_legacy_ssbd.
---
 xen/arch/x86/cpu/amd.c         | 119 ++++++++++++++++++++++++++++-----
 xen/arch/x86/cpuid.c           |  10 +++
 xen/arch/x86/hvm/svm/svm.c     |   5 ++
 xen/arch/x86/include/asm/amd.h |   4 ++
 xen/arch/x86/spec_ctrl.c       |   4 +-
 5 files changed, 124 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4999f8be2b..a911e2e50a 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -48,6 +48,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
+bool __ro_after_init amd_legacy_ssbd;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -685,23 +686,10 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
  * Refer to the AMD Speculative Store Bypass whitepaper:
  * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
  */
-void amd_init_ssbd(const struct cpuinfo_x86 *c)
+static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
 	int bit = -1;
 
-	if (cpu_has_ssb_no)
-		return;
-
-	if (cpu_has_amd_ssbd) {
-		/* Handled by common MSR_SPEC_CTRL logic */
-		return;
-	}
-
-	if (cpu_has_virt_ssbd) {
-		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
-		return;
-	}
-
 	switch (c->x86) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
@@ -715,20 +703,117 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    val &= ~mask;
-			    if (opt_ssbd)
+			    if (enable)
 				    val |= mask;
 			    false;
 		    }) ||
 		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    rdmsrl(MSR_AMD64_LS_CFG, val);
-			    (val & mask) != (opt_ssbd * mask);
+			    (val & mask) != (enable * mask);
 		    }))
 			bit = -1;
 	}
 
-	if (bit < 0)
+	return bit >= 0;
+}
+
+void amd_init_ssbd(const struct cpuinfo_x86 *c)
+{
+	if (cpu_has_ssb_no)
+		return;
+
+	if (cpu_has_amd_ssbd) {
+		/* Handled by common MSR_SPEC_CTRL logic */
+		return;
+	}
+
+	if (cpu_has_virt_ssbd) {
+		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		return;
+	}
+
+	if (!set_legacy_ssbd(c, opt_ssbd)) {
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
+		if (amd_legacy_ssbd)
+			panic("CPU feature mismatch: no legacy SSBD\n");
+	} else if (c == &boot_cpu_data)
+		amd_legacy_ssbd = true;
+}
+
+static struct ssbd_ls_cfg {
+    bool locked;
+    unsigned int count;
+} __cacheline_aligned *ssbd_ls_cfg;
+static unsigned int __ro_after_init ssbd_max_cores;
+#define AMD_FAM17H_MAX_SOCKETS 2
+
+bool __init amd_setup_legacy_ssbd(void)
+{
+	unsigned int i;
+
+	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
+	    boot_cpu_data.x86_num_siblings <= 1)
+		return true;
+
+	/*
+	 * One could be forgiven for thinking that c->x86_max_cores is the
+	 * correct value to use here.
+	 *
+	 * However, that value is derived from the current configuration, and
+	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
+	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
+	 */
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
+		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
+		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
+	}
+	if (!ssbd_max_cores)
+		return false;
+
+	ssbd_ls_cfg = xzalloc_array(struct ssbd_ls_cfg,
+	                            ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS);
+	if (!ssbd_ls_cfg)
+		return false;
+
+	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
+		/* Record initial state, also applies to any hotplug CPU. */
+		if (opt_ssbd)
+			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+
+	return true;
+}
+
+void amd_set_legacy_ssbd(bool enable)
+{
+	const struct cpuinfo_x86 *c = &current_cpu_data;
+	struct ssbd_ls_cfg *status;
+
+	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
+		BUG_ON(!set_legacy_ssbd(c, enable));
+		return;
+	}
+
+	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
+	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
+	                      c->cpu_core_id];
+
+	/*
+	 * Open code a very simple spinlock: this function is used with GIF==0
+	 * and different IF values, so would trigger the checklock detector.
+	 * Instead of trying to workaround the detector, use a very simple lock
+	 * implementation: it's better to reduce the amount of code executed
+	 * with GIF==0.
+	 */
+	while ( test_and_set_bool(status->locked) )
+	    cpu_relax();
+	status->count += enable ? 1 : -1;
+	ASSERT(status->count <= c->x86_num_siblings);
+	if (enable ? status->count == 1 : !status->count)
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	barrier();
+	write_atomic(&status->locked, false);
 }
 
 void __init detect_zen2_null_seg_behaviour(void)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 9a8c73f067..7607155875 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -544,6 +544,16 @@ static void __init calculate_hvm_max_policy(void)
     if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
         /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
         __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+    else
+        /*
+         * Expose VIRT_SSBD if VIRT_SPEC_CTRL is supported, as that implies the
+         * underlying hardware is capable of setting SSBD using
+         * non-architectural way or VIRT_SSBD is available.
+         *
+         * Note that if the hardware supports VIRT_SSBD natively this setting
+         * will just override an already set bit.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e15c9754d7..cee11bb244 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3126,6 +3126,8 @@ void vmexit_virt_spec_ctrl(void)
 
     if ( cpu_has_virt_ssbd )
         wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+    else
+         amd_set_legacy_ssbd(opt_ssbd);
 }
 
 /* Called with GIF=0. */
@@ -3138,6 +3140,9 @@ void vmentry_virt_spec_ctrl(void)
 
     if ( cpu_has_virt_ssbd )
         wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
+    else
+        amd_set_legacy_ssbd(current->arch.msrs->virt_spec_ctrl.raw &
+                            SPEC_CTRL_SSBD);
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index a82382e6bf..6a42f68542 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -151,4 +151,8 @@ void check_enable_amd_mmconf_dmi(void);
 extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
+extern bool amd_legacy_ssbd;
+bool amd_setup_legacy_ssbd(void);
+void amd_set_legacy_ssbd(bool enable);
+
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0d5ec877d1..495e6f9405 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/amd.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -1073,7 +1074,8 @@ void __init init_speculation_mitigations(void)
     }
 
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
-    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
+         (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
         setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
 
     /* If we have IBRS available, see whether we should use it. */
-- 
2.35.1


