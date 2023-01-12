Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B74667E1A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 19:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476354.738477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG2Fm-0003rE-N1; Thu, 12 Jan 2023 18:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476354.738477; Thu, 12 Jan 2023 18:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG2Fm-0003ox-Ju; Thu, 12 Jan 2023 18:24:42 +0000
Received: by outflank-mailman (input) for mailman id 476354;
 Thu, 12 Jan 2023 18:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pG2Fl-0003oq-0j
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 18:24:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e6d618e-92a6-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 19:24:39 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 13:24:30 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6234.namprd03.prod.outlook.com (2603:10b6:510:ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 18:24:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 18:24:27 +0000
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
X-Inumbo-ID: 5e6d618e-92a6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673547879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Kv7SYk6PubM4TjXQAt73Phr45Sl1rUK9hEL18EWdA8M=;
  b=gU/hPu8G/A299bUS1O3Jj3UnFl7+fhFEIsBGJe90Od8rMG27z8G/wu3E
   P7TCczeO74GxJXaxvbgdNYqVCiyBotJfce8Dpem9OGZ2jaG7ek9RgfMDo
   DvgCdp5tV0IFMNlBjX+FPn58yavY3O43Hn0ijAYE+imas4iFmUWoepqVO
   Q=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 91829565
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Dazqlqnb+EbW3ZTylEGNevDo5gxEJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDTyGb66KN2XyKI11O4iw9EIFvsTRmNc3TgNo+XgxESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5QWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fkDGCoKYkCMvLiNy723dO4vmsF7NuC+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieeyWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDTe3ip6M03TV/wEQxJxAPSXmmoMKHl0yTA/1ZL
 xcd1ioX+P1aGEuDC4OVsweDiHSZpAwVX91cFPIzwA6Iw6vQpQ2eAwAsTDRMddgnv88eXiEx2
 xmCmNaBLSRmrbm9WX+bsLCOoluaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cQwc2
 BiPpSk6wr8V3cgC0vzh+Uid2m3z4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1UdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:SzDMYqMu9MuIAcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.97,211,1669093200"; 
   d="scan'208";a="91829565"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlwwafbivKOmOpmlXKehDy7zDfPclirSjXA4yRz52Y4hA2tuZBzcaj94w14mGbI95y5iPxxiek/FlY0fzYtwWFn/6wzY3Q9Hw8890NXHd0MfCHFxC5nx7oM06QaMrCNM1ZC5U0dUF1U44jN4qJbKi/eyTU12UxQ+bMAV+CHNQqjDi54TD2t/XDJ7egOgT1Ncl0IdckXmd37OP5AcT/Rk4+5HPO+pQmAjLeHZ3S4vcoL1fWtjKRu7De18soKKB6Dmgx6vbYfeVzVj3U833WwfuiMlSMv1UsZafcosgTY9DZTrKrnDzduCG4W9U3FOhJkRlTHrpgKmiqSTPx0djstrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv7SYk6PubM4TjXQAt73Phr45Sl1rUK9hEL18EWdA8M=;
 b=BIu9vqyGry3CbuvTv7zvsV3X1uu4ZXdzk6sFluufQ3jVYjm3Q1FTzEqDZF85ZpLeJKVzfNkresRz9OY0jJEYwbLaoBkhCb3UQGApdvQ9YHV/tx/ajYCNS8bHAGcd+/TtNH7t5YbKdji1vStngiF2Jy4pKpE3KlVnnsnQ8rgbh3nnWcUgkhMgdHeT4Ji0MC+SIY07WBcTpW00C2sN7XHytNNfoCFMry88DlD+WxEggd3uVyB+zROteGpJtoBWXUy8RBUXczznagUtTCSByFSDuVy4+k9QnBahHzKUGkAOekykbH7LbZuA0pcoEzScbH5lVpH/OFbSmLColXYfM9lKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv7SYk6PubM4TjXQAt73Phr45Sl1rUK9hEL18EWdA8M=;
 b=M3qEW9ktdFlxw5VFEO3IzE5VacXYSz9WQrgQ412ZLfJRiaNSd8pjQItM5/AnYQ34iKIHJQd8L4YrnTYH5arWn2fW1LCQ72IF2iO9NQfE6M00F+jz2oekIfRkUsQrBeyNawMokvwoBLR3L6xBKv8TRBrekclKNGMclEDbRqWFQUw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Thread-Topic: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Thread-Index: AQHZIBjlmMJMZF8p3USyswha31M+3K6asoyAgAAE+gCAAEGaAIAALOIA
Date: Thu, 12 Jan 2023 18:24:26 +0000
Message-ID: <0e21b24e-d715-bd04-f98c-4cdd53f129ee@citrix.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-4-burzalodowa@gmail.com>
 <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
 <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
 <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
In-Reply-To: <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6234:EE_
x-ms-office365-filtering-correlation-id: d9b95448-ec16-4a02-e5d3-08daf4ca3d03
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Zxi/nB4HTBWWVShbSDCVAETK6loLM2mPvVFcR69+aBwyq/1f9Hi7rRMpDtoOVa4DOlnVTfRjQpY0x8XyJLG4FCLCGyzxjg0j12MaxezFJ/Zye6uR/lL6gV3ztj4HxYBROiE+oVo/HlrS0Zzu2EDjCgL+NSk9w81ublIrROb/LiSvLNSEde0JM532fUbGwnt6WZ/tf76ZTEB1Bwm+2+u04h8HrZKWUEc02O3Y+jo5+W14GsXBHnv+fnuiCgEmedZ+kzscVS69uCVPilxcn7nAvOFavL3Ef+RlWa6AwJJP6utWt2p2mVu1AjoLWtLcUTUhRCssUTe2e5irO1/zjumyNi94hnYmEAFiLcY42CLXJOLnDk6EoW9XLr7zil7HCM+6GopPjU18YgQ8HetefOhvMETPRqC2w3bIjgcW1UEOez4P4kprtDW/N4iMB3t98F78HO4rlzu/lnSypIgnOJqo33S2+MS8JA4eJYuLFTzSdtAl60BQHNQMmBNpBeTCyVtxt5Y/Ivg5R8R6cxvepHrkpmTO8xKv3lSF2BE5Rb/EBvNM5WMNgFOzBSPjW3issnWizeeNsT+UC03nttLlpOjepOydTOqCmUW2/mnx5X4GuHL9SKPSX1/PCcvgVA88wFDi96iGMXdMaMGerPeOInA4UjcCp0gk9N5z94LKfm+RU9Lw0MHWsLXzX0NEfntKEscX/kwYhWAzBcaAl3BEfJHVWfyUSAwCtY/nmQYXgddBFxz0kuMtC1xaMpdkSReeigdJzLAwJBFZKp2/1q9uATNgkA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(86362001)(316002)(71200400001)(6512007)(26005)(5660300002)(186003)(478600001)(6486002)(2616005)(91956017)(31696002)(41300700001)(64756008)(66556008)(66446008)(4326008)(54906003)(66476007)(66946007)(110136005)(76116006)(38070700005)(83380400001)(8936002)(36756003)(8676002)(53546011)(31686004)(6506007)(122000001)(82960400001)(38100700002)(2906002)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTZ2TWNTaFV1ZFBQUGFOYW1sRmZyY3ltMUJiNklYZjR6MUkvcWl4VHBGMHlq?=
 =?utf-8?B?anNFTTVpNVZyVmtiaUVheGZnT25vOTh6cFZLeFRpNkt6czZMdk5wTnNSNGtS?=
 =?utf-8?B?N1FwSlEwWEY3SitMamlRbnVtZ1lHL1E4L1Z4M2lhNXlQRFA0RU5NM2lTQUxm?=
 =?utf-8?B?dTVBVVNsVVRNaUxuZVZPdFlEQjZXOEs0K0RFajhBUWtPTTZ1Yk9xdndTbE95?=
 =?utf-8?B?ZUQzMjV2UzZOeS9PME4zMG1yTXdKcVVrNEFZQS9CdVA5NzJkcjFsY1lXc1I1?=
 =?utf-8?B?NC9NYm1iU3E1WXBzYldGUGVORDlTZ1VFblRaSlovRENJTHozbXNaK0RENXgy?=
 =?utf-8?B?V1FoNmF3c3dwdk1PcDMrT2Z3WWVLN2h2dlBlOTZieVMvSzlUaGJnWXJ3ZUZV?=
 =?utf-8?B?L1BjN1FQeGMxUDdxYWlUMzE1emxvL0MwdWx1dkhzUlVNdzdsY01YSytkcUFK?=
 =?utf-8?B?OHIvcE14R1lUMldULytUNmlJVTR2VE05OENiT2hDcENSblVnaWQyb3d3SS9s?=
 =?utf-8?B?WG92ay9kMGhQb1NEODhXSVcyVmJJVUQvQ2dTRzNMMEpCWkVzL2g3dHNzTkt0?=
 =?utf-8?B?WWVxT3kyUHN5UUtMbElTZXN0ejZpZkdqeGtFQ2l3WWcxMEd1c0JEVDRtQTc1?=
 =?utf-8?B?M1hFekNNcHI0MDFubGxoZmtzUWJwQWJuS1VROUIxbGxvWnJublU1c2xnN1Zl?=
 =?utf-8?B?MXdDRTg1aXA3a3BWeUxBNUE2ZjNBa25JcTc3bjNqNllmNlZ3VTRsbDdmMkJP?=
 =?utf-8?B?UUo3d085ZTlrdXdjeHoxM3pvWHVjL3Y0V09NdkpmWXhWcEdUR1lGL3hpNkh6?=
 =?utf-8?B?RkNYMTlEeXhYTWdreXBBakxTWm5HSXFobmdCUkRRL21xbjB3TTZBUmJ1d0Qv?=
 =?utf-8?B?dFo0SnpLNkZjVmMvN2pVaUVMbkNiN2R5S1R1dkdRd25zUS8zaWJvcjJrcENr?=
 =?utf-8?B?Q2VqemZzUDM4VXR0V25uWDdyd1FoU1ZHUktXaDlnb1QwSytHRVpjMUhpdHVD?=
 =?utf-8?B?MkV1QTMrN0hrcVNqMmkwbjV3R0x3TDk4RlBVM0hHQ0g2SGJZcnoxRkQyV01t?=
 =?utf-8?B?RXZ3OG1OYjZFMThTNDNIc1ZSQlJ1SXY3aEkzemh1SkZnT3F3K3BycHNZcW5n?=
 =?utf-8?B?NE9Eb0NYcFRMa0tMaWo3MGRrMGR3M0V1ZDgxUWtObEtLQWh0eGlFSndPM0lX?=
 =?utf-8?B?L20yT3NiU0s5OW9Mdi9MWGsvWVhXU2xkK21jMGRkU0lFc0lwek1nUW4waDFT?=
 =?utf-8?B?cGhwUWhsNDBtN1Z1U05iYlpHaEFqWmFKZEVPNndmV1JrYStwMDlDVWNxcElW?=
 =?utf-8?B?MGoxdHoyZVRmM0xRcXZtKzhySXpWMVVhM3Nxblh6SFVBd2gxcklxWG4wcWpu?=
 =?utf-8?B?UDVnNW5hcHdLMHZtQ1pJR2FYckdRcVZKSGVMQ3c5TE42RzBPN0Q1eHk4TWlo?=
 =?utf-8?B?WjBaSmV6cUdhUDlOL0hZTmRIdU5FeGwvcUw2UWFVL0RST2FpUE5idmVGbU1r?=
 =?utf-8?B?aXJSWkhPRExNTUlPcVdDNktCSTE3Y0xRTVdsdWdpZmZlMEFRQlZVSVNONjVq?=
 =?utf-8?B?di9kdHlQbS93M0xvcGlZUmF2dm9YVWNQNi96OHl3ZmZXRjVsaXA0KzhxQ1Ro?=
 =?utf-8?B?Nm5ra2dFNGJWTXdISFl4anc3VElKUDAycjMxUjY2Uko2elhNTVp2RUVzZkNH?=
 =?utf-8?B?blhTTE5mRmo5dm9uYWFTSW9PSTZjYUszOEIrV0lpOWJjTTVDVG9zcEM0eXJ3?=
 =?utf-8?B?STE2ZFlrdTB3ay9Xa2xFb3lGZ2FPck9FNDk0NjdhLzZodWtGenozbzRaaUtt?=
 =?utf-8?B?T3FnUlRLY3NrQkNRbklMbjlqMHRjSEdma09zY3JwajhJbmZ3cnRkMWlqdzRQ?=
 =?utf-8?B?TkFvY0JrdjZNeEQ1a2tyakllRDdtUkdCdnJpWlF3NmJzTjlKR0laM3ExMHlp?=
 =?utf-8?B?eXFtRjhZall3WHo3MUNjUG83V2dBMkJoWEMyaXM0SmV1UWNWUUtUNk9QUHhQ?=
 =?utf-8?B?cWdzdStaN0RJQTQyL244NEtLWHR5TGYza2psVmFMMlVwMFlBNWVUaStPM2g4?=
 =?utf-8?B?dGhJSUhZcmp2Umx5ZlIxVXJ4dFFPdUtWN25sOHJkdkpZYU9QdGIxQSt2VHZ0?=
 =?utf-8?B?blpOdkUzYTZLMzk1TGp4bEw0YkJwMU41VUlnWUx2TnBVVk9UdWthb29FZERF?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC30C1AFCA31CA4C8CE408C3327EF0FC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ir5ybnVt3l4gcjLs/pW/HQqFd695Zb7scZCHlucEkymnyLiY9Qi42Uj2PWccIRA+twmGmBLaPuGH3uqmeNb5XEr/R/FAhx8wGPjN53qGAoDWBB6hL3M7kOu9/DvedbWtQp2qj6peb7Wyqn/Q0a2SldV+dRgH1Kb8BL5TomNxXDRlhJR64xPMyCcWUD8TxCeTs1kL+LV/7mwYHlq0MOCQ53PUCjIg6rmbayxdCUJ/PhAU+5rmu/SROvaFeQVOATOUe/pVOHltYAfcXx5mqStar4FSLbfNfhmiCrt4FaSs+DdFmnj+NnF0EAzXrT+f//f/94yFadrt/O5jz+c/XGXDnymeFwG9zXVUOtCjuwBuHpZZznPiJGDevXTije5ljh18I7lmm3JBfhI8eA+b8iDYBFf7rnsOobTa4MQHV7F/YpeWZuvFvIzUUanRaQj3LyMJ25EEwXEWlWf0HPlYd7Tg9oaHiNpoGONgegh5Nv+Bkprkh4IbAoqVVy2JWUY06uS1qbEsXD/AziBOJPAoycKw151vmC0ZczZHosCHNC533ilAuREaFVhmKin6nqVOxqHGUOqqvFYwG6OEHqnZbbqpDNsJZYuTHrk+7XzClw4gwxOcufLkA3M93R3UZqIRFFvvent1DlpUpknc1uliN+pQo0D6PNRY68m9rB3odnROoROeLdYgw4+WWKh7EU1rVVkBy+tnBh7G5PgtPQgAhTTS6UL5tAMqfCT6AWcaCM5FQi3YmjjTiTNpJYHt6K7Xtj/1zCcBc+Py9O5GahXUYDiBza8TqevftLyoY1PeA1I4p+au8SVm813dLh5Fbp0nCi1YJgcAB6CeZzOABiN5+aZOp/jcIsCIDy6+QlNVySgNFMI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b95448-ec16-4a02-e5d3-08daf4ca3d03
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 18:24:26.9958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIhU7eViyC2bD5gub0WkCdn5OmW0tKYO47yGc+01FfjrpP7aMi7mXKHGgF1t+XWxD6EQOfybfW14hKqkW5s2AmPDHybV5ajN4JCAiiALdNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6234

T24gMTIvMDEvMjAyMyAzOjQzIHBtLCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPg0KPiBPbiAx
LzEyLzIzIDEzOjQ5LCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPj4NCj4+IE9uIDEvMTIvMjMg
MTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA0LjAxLjIwMjMgMDk6NDQsIFhlbmlh
IFJhZ2lhZGFrb3Ugd3JvdGU6DQo+Pj4NCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11
LmgNCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4+Pj4gQEAgLTc0LDkgKzc0
LDEzIEBAIGV4dGVybiBlbnVtIF9fcGFja2VkIGlvbW11X2ludHJlbWFwIHsNCj4+Pj4gwqDCoMKg
wqAgaW9tbXVfaW50cmVtYXBfcmVzdHJpY3RlZCwNCj4+Pj4gwqDCoMKgwqAgaW9tbXVfaW50cmVt
YXBfZnVsbCwNCj4+Pj4gwqAgfSBpb21tdV9pbnRyZW1hcDsNCj4+Pj4gLWV4dGVybiBib29sIGlv
bW11X2lnZngsIGlvbW11X3FpbnZhbCwgaW9tbXVfc25vb3A7DQo+Pj4+IMKgICNlbHNlDQo+Pj4+
IMKgICMgZGVmaW5lIGlvbW11X2ludHJlbWFwIGZhbHNlDQo+Pj4+ICsjZW5kaWYNCj4+Pj4gKw0K
Pj4+PiArI2lmZGVmIENPTkZJR19JTlRFTF9JT01NVQ0KPj4+PiArZXh0ZXJuIGJvb2wgaW9tbXVf
aWdmeCwgaW9tbXVfcWludmFsLCBpb21tdV9zbm9vcDsNCj4+Pj4gKyNlbHNlDQo+Pj4+IMKgICMg
ZGVmaW5lIGlvbW11X3Nub29wIGZhbHNlDQo+Pj4+IMKgICNlbmRpZg0KPj4+DQo+Pj4gRG8gdGhl
c2UgZGVjbGFyYXRpb25zIHJlYWxseSBuZWVkIHRvdWNoaW5nPyBJbiBwYXRjaCAyIHlvdSBkaWRu
J3QgbW92ZQ0KPj4+IGFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAncyBlaXRoZXIuDQo+Pg0KPj4g
T2ssIEkgd2lsbCByZXZlcnQgdGhpcyBjaGFuZ2UgKGFzIEkgZGlkIGluIHYyIG9mIHBhdGNoIDIp
IHNpbmNlIGl0IGlzDQo+PiBub3QgbmVlZGVkLg0KPg0KPiBBY3R1YWxseSwgbXkgcGF0Y2ggd2Fz
IGFsdGVyaW5nIHRoZSBjdXJyZW50IGJlaGF2aW9yIGJ5IGRlZmluaW5nDQo+IGlvbW11X3Nub29w
IGFzIGZhbHNlIHdoZW4gIUlOVEVMX0lPTU1VLg0KPg0KPiBJSVVDLCB0aGVyZSBpcyBubyBjb250
cm9sIG92ZXIgc25vb3AgYmVoYXZpb3Igd2hlbiB1c2luZyB0aGUgQU1EDQo+IGlvbW11LiBIZW5j
ZSwgaW9tbXVfc25vb3Agc2hvdWxkIGV2YWx1YXRlIHRvIHRydWUgZm9yIEFNRCBpb21tdS4NCj4g
SG93ZXZlciwgd2hlbiB1c2luZyB0aGUgSU5URUwgaW9tbXUgdGhlIHVzZXIgY2FuIGRpc2FibGUg
aXQgdmlhIHRoZQ0KPiAiaW9tbXUiIHBhcmFtLCByaWdodD8NCj4NCj4gSWYgdGhhdCdzIHRoZSBj
YXNlIHRoZW4gaW9tbXVfc25vb3AgbmVlZHMgdG8gYmUgbW92ZWQgZnJvbSB2dGQvaW9tbXUuYw0K
PiB0byB4ODYvaW9tbXUuYyBhbmQgaW9tbXVfc25vb3AgYXNzaWdubWVudCB2aWEgaW9tbXUgcGFy
YW0gbmVlZHMgdG8gYmUNCj4gZ3VhcmRlZCBieSBDT05GSUdfSU5URUxfSU9NTVUuDQo+DQoNClBy
ZXR0eSBtdWNoIGV2ZXJ5dGhpbmcgWGVuIHRoaW5rcyBpdCBrbm93cyBhYm91dCBpb21tdV9zbm9v
cCBpcyBicm9rZW4uDQoNCkFNRCBJT01NVXMgaGF2ZSBoYWQgdGhpcyBjYXBhYmlsaXR5IHNpbmNl
IHRoZSBvdXRzZXQsIGJ1dCBpdCdzIHRoZSBGQw0KYml0IChGb3JjZSBDb2hlcmVudCkuwqAgT24g
SW50ZWwsIHRoZSBjYXBhYmlsaXR5IGlzIG9wdGlvbmFsLCBhbmQNCnR5cGljYWxseSBkaWZmZXJz
IGJldHdlZW4gSU9NTVVzIGluIHRoZSBzYW1lIHN5c3RlbS4NCg0KVHJlYXRpbmcgaW9tbXVfc25v
b3AgYXMgYSBzaW5nbGUgZ2xvYmFsIGlzIGJ1Z2d5LCBiZWNhdXNlICh3aGVuDQphdmFpbGFibGUp
IGl0J3MgYWx3YXlzIGEgcGVyLVNCREYgY29udHJvbC7CoCBJdCBpcyB1c2VkIHRvIHRha2UgYSBU
TFAgYW5kDQpmb3JjZSBpdCB0byBiZSBjb2hlcmVudCBldmVuIHdoZW4gdGhlIGRldmljZSB3YXMg
dHJ5aW5nIHRvIGlzc3VlIGENCm5vbi1jb2hlcmVudCBhY2Nlc3MuDQoNCkludGVsIHN5c3RlbXMg
dHlwaWNhbGx5IGhhdmUgYSBkZWRpY2F0ZWQgSU9NTVUgZm9yIHRoZSBJR0QsIHdoaWNoIGFsd2F5
cw0KaXNzdWVzIGNvaGVyZW50IGFjY2Vzc2VzIChpdHMgbWVtb3J5IGFjY2VzcyBoYXBwZW5zIGFz
IGFuIGFkanVuY3QgdG8gdGhlDQpMTEMsIG5vdCBhcyBzb21ldGhpbmcgdGhhdCBjb21tdW5pY2F0
ZXMgd2l0aCB0aGUgbWVtb3J5IGNvbnRyb2xsZXINCmRpcmVjdGx5KSwgc28gdGhlIElPTU1VIGRv
ZXNuJ3Qgb2ZmZXIgc25vb3AgY29udHJvbCwgYW5kIFhlbiAibGV2ZWxzIg0KdGhpcyBkb3duIHRv
ICJ0aGUgc3lzdGVtIGNhbid0IGRvIHNub29wIGNvbnRyb2wiLg0KDQoNClhlbiBpcyB2ZXJ5IGNv
bmZ1c2VkIHdoZW4gaXQgY29tZXMgdG8gY2FjaGVhYmlsaXR5IGNvcnJlY3RuZXNzLsKgIEkgc3Rp
bGwNCmhhdmUgYSBwaWxlIG9mIHBvc3QtWFNBLTQwMiB3b3JrIHBlbmRpbmcsIGFuZCBpdCBuZWVk
cyB0byBzdGFydCB3aXRoDQpzcGxpdHRpbmcgWGVuJ3MgaWRlYSBvZiAiZG9tYWluIGNhbiB1c2Ug
cmVkdWNlZCBjYWNoZWFiaWxpdHkiIGZyb20NCiJkb21haW4gaGFzIGEgZGV2aWNlIiwgYW5kIHdv
cmsgaW5jcmVtZW50YWxseSBmcm9tIHRoZXJlLg0KDQpCdXQgaW4gdGVybXMgb2Ygc25vb3BfY29u
dHJvbCwgaXQncyBzdHJpY3RseSBuZWNlc3NhcnkgZm9yIHRoZSBjYXNlcw0Kd2hlcmUgdGhlIGd1
ZXN0IGtlcm5lbCB0aGlua3MgaXQgaXMgdXNpbmcgcmVkdWNlZCBjYWNoZWFiaWxpdHksIGJ1dCBp
dA0KaXNuJ3QgYmVjYXVzZSBvZiBzb21ldGhpbmcgdGhlIGh5cGVydmlzb3IgaGFzIGRvbmUuwqAg
QnV0IGJleW9uZCB0aGF0LA0KZm9yY2luZyBzbm9vcCBiZWhpbmQgdGhlIGJhY2sgb2YgYSBndWVz
dCB3aGljaCBpcyB1c2luZyByZWR1Y2VkDQpjYWNoZWFiaWxpdHkgaXMganVzdCBhIHdhc3RlIG9m
IHBlcmZvcm1hbmNlLg0KDQp+QW5kcmV3DQo=

