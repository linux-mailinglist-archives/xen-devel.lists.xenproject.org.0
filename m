Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF951A3E3
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 17:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320838.541790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmGpV-0007Om-Jd; Wed, 04 May 2022 15:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320838.541790; Wed, 04 May 2022 15:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmGpV-0007Lt-FX; Wed, 04 May 2022 15:22:17 +0000
Received: by outflank-mailman (input) for mailman id 320838;
 Wed, 04 May 2022 15:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmGpU-0007Ln-5n
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 15:22:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8fe57b3-cbbd-11ec-a406-831a346695d4;
 Wed, 04 May 2022 17:22:14 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 11:22:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB3512.namprd03.prod.outlook.com (2603:10b6:a02:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 15:22:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 15:22:09 +0000
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
X-Inumbo-ID: f8fe57b3-cbbd-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651677734;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xjjpDfurCFr4fQGUmo+sE3/9zUTMYO0ZZwKB2QaDgDQ=;
  b=JxbdnxRcgcPH7CBcYcaNo1Aqt6l7C7jepy5bYqnDSMByXvv0QwTbUC8d
   9epjd4nl2U/mFIEkzrsTRKMv+hct05v6UIzXOVsD6R8ZmRWTazF7K3mRc
   TnEc6Y/O0SqB4Rp1CXmGgfY6RroVVPVHP1la4s5soYG8TsjAGtuxGZIWh
   4=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 73042646
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bJYAnaNKMgOYp5bvrR3TlsFynXyQoLVcMsEvi/4bfWQNrUorhj1Sz
 msaWTrXPqqMY2SjetkjbY+/8xxTvZ/cn9JhTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2tIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 tVHkbW/ZCESJqjxk+oRDSNVGQpGBPgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHPqiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33SGjKWME9jp5o4Ic0UXT4ApT7ILzF4DZI/y1VMsImmmx8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FSiU93VTxC+5nmesXYht8F4FuQ77ESBz/TS6gPAXGwcFGceN5ohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnFb6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:1F7oj6gJYztH68mD6O0GvTqIoXBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,198,1647316800"; 
   d="scan'208";a="73042646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXGjXmeyHgBb6OiTFVwieL5Gi96CC0RpRwEKhgiTduwr+7xKjg4RUfwzeN61WWm17zi5riri2NMIhn+PNtdluW82k0HsNnqqvXlixchnMtvtfzP6YFs+jJQrAGP8ai+lJIwsFPpoyCkU4bsdGwuOKjhnN7pR4BREwhkR++3t0pi0rr9Z2Rs+WEUszR58xXUSnyD07z+dI7Dcg/oGcHWlRt0YQTE3GxwdkIMOA1lsmufAvLG1yw+E4K2w4y6Wd9Ts/V9XRZPV4BrrWfjGJub4qCoo9C3MIIZC4e6G7bNimiRYBvNALWacvLwX84+le2WdZL/mIAfO39hIBP6/aN85iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mf0+SJmhNTTx4Llp+FZHiwS/xWK9D5akmjx62ddNe1E=;
 b=FYPlPNAewErR4ldC0veER2GO4KzsKwjZUTs8jPbmAWwzHeOgQ1X9dbfdNIBkMrx1bI7WfbpQkkU3vb7xTYIoJjQR/25EwYvJk8IiN2x9NwjzDABLi19zwbMx9IO/gS1LfU+tibFSMmZFCDrlQj+DEGlFH1DrYbnsIV+UkUqUVJHwUtbcQ8IEqaLm75+br5V4fkoFXDDb532jn3LtGWqKeKYkF2XGEzWRGhpkd39v8r7CiLw4UxilR/ZaFl8adqAFiHXoFy0glaFKWLR2nuXoBZdl/cSODvjj1s+LJbyXpQj2Y/v/NqmZ3+wAX0s7/jOD7yLb7oa+L88UuQVSWeKyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf0+SJmhNTTx4Llp+FZHiwS/xWK9D5akmjx62ddNe1E=;
 b=cDejAw4L2i0as28mKW17yZyiD5szG5VwRzXFjPYIr+705sM/FGodCx1MJQZeo1H4xcYknLu3o/a2nTzDJcLohWlcWkmhznXlL9ItKNwgw65cKV6ZfWS9Vrzq4C/G33IN/umloDHBCvzA3wGJrxVoqj6a/LMiVfHOfEDTkBQ9R+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 17:22:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YnKaHO+N9IBbSkMO@Air-de-Roger>
References: <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
 <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
 <YnJrBNkGl8Em0gTN@Air-de-Roger>
 <fa6e35ac-66f9-76f2-1dd7-f1175c65e3cd@suse.com>
 <YnJ5AeB0k4SQ4hhI@Air-de-Roger>
 <66587a43-02b8-20c6-2663-4a6fc3e010e2@suse.com>
 <YnKDm3fHHyjQ8vV6@Air-de-Roger>
 <2018a835-e924-7d70-1160-227acd75947c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2018a835-e924-7d70-1160-227acd75947c@suse.com>
X-ClientProxiedBy: MR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::32)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3099a40f-c462-444b-79a3-08da2de1daec
X-MS-TrafficTypeDiagnostic: BYAPR03MB3512:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB351226C495DD0CECC43318C68FC39@BYAPR03MB3512.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FnsXHH2MK1kcyIPQLXwiYz92nF7jg0iX422YLLaOG4LjlKP/2sba6eHv3a2UxxQSYGRrXgh0hsc4rPWlqF95QnxMOtAAcsJyqM5FMusS5oEFLtn/m6DtJdsltTwsyRo4ZeQba3gnQ31gF28pPXUawVz5NPB07b2VutqH12661yJswmCda01N2KGKhBqsRTIYJ/0j5037sirsivUfT93qxUm5GoO69jbNauEYyy5lB8gECeAccwnFPyXHplTGIpK/guRaZRqcO1XgybXn+k94rbkU7n+vG/hIqmyUDsxyHfRrOsUfIrnggnvG0zqF+0VOK8qnuThPpRJzeeS+wUp8zlFrYX6pK/+Tb9Est3a0LTn+2K5ujm/K859OJS29H4qA2hykAFjWTEXPVqvB4HytEPKR937qaxHyMgeKsTiZjCQV+t0O2AeMO0/6EQnlhdpKPK7mn5dTGZ8DUMyoWIlFRi+CFWRP4sWm08KsP9rGK1T22hwEt6SY4m4CvufD8k7jCHEtYp9kSlhu6CC7eC0Rf1Owfc4JmzOLMGO2WEtP9pYP45QHJ4x35BB6oZhhU4BeMWGd/6d+kaHHe1PQRS7J1qQGo67X7ybUv9+nh5aXZxj2liEXQxomrB49dQ125ytXJEfAvNCy8frxrzKkPEcrRuGhr/BxHGCWIUflJ3Zwk1IGWmzQU/JVqviApWt5v+xCwYq27RRbP7AWKnXc0oL1Jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(9686003)(82960400001)(26005)(83380400001)(33716001)(2906002)(38100700002)(508600001)(8936002)(6506007)(86362001)(6666004)(53546011)(6486002)(5660300002)(66556008)(66476007)(66946007)(186003)(54906003)(6916009)(8676002)(316002)(4326008)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2doZEpTaWxXNVBIbmg3b2FmWElVRWd4QzdiK2d2aXBhNlBTYW1nK3lSaW5t?=
 =?utf-8?B?RjhsQmZwRkNwUDgyTjE4dlRjWGFYRDVEQmlVdURXZDlJc2V4TDlPLzYvNmQw?=
 =?utf-8?B?QUZUNUdWaU5NVzFIR1VPYTJMMVlUWUtxcUNuQWJXNjlKVE8xVUlCUVNQMEZG?=
 =?utf-8?B?czRGM3hiT1pwZDJ0c2g3blFXbmxzSXdPbGNmZnVHUUovQkVuSktSc0VOWW9k?=
 =?utf-8?B?Vm5qamd5UGhRbGFjVExyd1ZQSE9OOE5wYnhxdjdoOGF4c0h2L01mL2Qyb2Np?=
 =?utf-8?B?dys3WFZhcEI3VFNpNm9mVTBxM1YrdU5CM0xQWXVKYUpvSTdaKzZyQ0htT3U5?=
 =?utf-8?B?elBQckMxcjQ1dENUNlkzd29CQXRxLzQ5YnBjandFNjVLTCtIOWVraEpVM0VX?=
 =?utf-8?B?WUVVQnpMejV6MVozVlFrbnorSmVzMlpuN25WbjNWU0paOVBVVUZrTzg0bkM2?=
 =?utf-8?B?a3pwVjJCcnBVQ3FLUWFyOFY0QjhUTm1aTzNtUk5OVjlyVlEybTNkRnhjUnlL?=
 =?utf-8?B?SjJub2EvcThXTHduTVFiNWNnd0pYdWQxSkpxNWJpeVdqSlA0ZmRnelhMMVk0?=
 =?utf-8?B?QnAxcHl1L0ZINktxcEc5MzZaR3ExU3hycVBXVFdhcFBMZGxvTUd2UzgvQTJo?=
 =?utf-8?B?WHBLU0hXeTlsa0FtYnlqb3lVK0lOOEVZSVZUeHRGM2Y5dGFkVTdRdTNpNld4?=
 =?utf-8?B?L2lwVTNDQW1jVEhBR0ovY3B3dFUwcHFNWEhiT3lBWE8yYk0reVp2bndhV20w?=
 =?utf-8?B?Y1dMTDlXZnppWEc1eFhFSkpUMFRWT3Jua2toeStqMEFuK21HNGtwWENWREh3?=
 =?utf-8?B?T3JDMUFJZFdnbnRadmlFaHl4SGRsR2pnb0t4b0FqQnVqdzhDaGpodWxvdkNs?=
 =?utf-8?B?Ui9jajhiK1dpWUxnZGw4R1BWcFFlbzRKT1hnalNwMnkvd1EzM05JdjdFcFdT?=
 =?utf-8?B?a2s3V2VkRGp5b2NSU1k5QkUrRC9sL0hRbHNsY1oxRTFxZHdIYXRBZC92Z3pk?=
 =?utf-8?B?UUtuT1kydGJpTHZTcTRWaDZueFRVcE4wTGlpRVpSams1bW5MdWVQeGNaQTBU?=
 =?utf-8?B?YjhoRjZQWFF5UjBzZFJOdEZyOVR6Z3k0OU5CQnEvMzVIdm5tdlVQVGh0elZG?=
 =?utf-8?B?dmZvUFIydGRDMm5vMlUwSmcyTERibkpxMTIvbERROURjci80aVhFVGRuQ0Fy?=
 =?utf-8?B?blJZY1NRLzExbXZKNnVaS04vRklxaG9ldlovR1Nmei9VTFEwM21BaTU0QXlq?=
 =?utf-8?B?UmJKd0lKUS9rbXNlM0dwR2Y5ZFVQeFFtUThHTVVzaUtQci9hM0xIT05Zb0pj?=
 =?utf-8?B?QnhQSXVFVjJwM0xtU3kyNjExWUV0bFprc0RXWGJnMEM5U2Q1eEIrTVE5cTB2?=
 =?utf-8?B?K2l2dEZhZWFLWUhnTDZkQWE4UE5MWWpqeTQxbWNjMEQyS2h5SmtUMjcxNzFR?=
 =?utf-8?B?ZU1wend1eG11blR1Sk1rbHhQbnhDSE5YRFRIUmdQWEZlU2JBeHVmbTB6ekc2?=
 =?utf-8?B?cXdWWUxvMHJWa2l2aEtvSEFYOG8wVTU2b0l2WE5BczcrYnlGWkdhZkRkd043?=
 =?utf-8?B?dEd6b0VhS0E3ZmRLaC8xd3ZSNXVMREJjWWdTVWppc2s1OHZML1VzaU1LUUdm?=
 =?utf-8?B?WlN3QUNMR3VwcW9NUjk1MURISTgyeVoxc1ExaTFSRWlKd2NwbEN3Sk1WQW5U?=
 =?utf-8?B?VE1KZ3VGQ0NvYTJTZjN0a3hHOEhIc0lTTzZ0ektDSC94Tm5Cek9BTCsrcjc5?=
 =?utf-8?B?OXBPdDAza2svS1dqTWxOZTdzUE5xUVNSVXlYNUVuUGxyeVJ2VU9ReXg1SnI1?=
 =?utf-8?B?d3hTL3VJWkJYYVlGY2xhZUpuUFh1Sjcwa3kwMnJST2dUMUM4NE9mZm0wMFQ3?=
 =?utf-8?B?eTYvUi9yQUpUUWl1dEQ4SEhjVXYvenJIcmJpUFpQSm5vV0RDNlpycWY2Y0JX?=
 =?utf-8?B?U0JLUTUycUhCWGQ1VE10dzlUWkthemxqVkppOVMxbExxTkVCaEZQRXh1MTJm?=
 =?utf-8?B?NWhZQXhiVUZ2dG9EQnJEWmRhMUk2d3Jsd3E4a3NOMnJwaUpST0prK041SXIv?=
 =?utf-8?B?Q3dHUDRCWlErdWhxUXZFTzRGd1hNd1JSNGpPcTkrSlQ0R1lxckxibWJCOUtQ?=
 =?utf-8?B?RFhzcXlySmIveVU3Rm5aTk01SzZXb3ZjL1A1SUdaLzkyMEM4K0tiL2RodDhY?=
 =?utf-8?B?WlNRdW1uQlBKZFh0ZXQxY0o0QURLTXJTQUxjTU8wemVWQ2FzcUpWOGdhamdB?=
 =?utf-8?B?VXppTi91RDgvbm9RRmM0NlhBVEM0dDkwalRJdk9Ob0JOQkRGMEtMQ0NxTEsx?=
 =?utf-8?B?UHVadEJQUWdBMUFZWXJmYVB0QXhqeE9QMWtURzlKQS9uZm9VK3RSMTNTZmwy?=
 =?utf-8?Q?ZkEa3n9G38ceBklA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3099a40f-c462-444b-79a3-08da2de1daec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 15:22:09.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wv7o+y7RvWIjGjooKN2OkHzMjefgqU3FmXdRC/0f/aOC3njp+qg6D2u40LrSlPtU5bxcsEQ5jpIOCYCEoqlf3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3512

On Wed, May 04, 2022 at 03:55:09PM +0200, Jan Beulich wrote:
> On 04.05.2022 15:46, Roger Pau Monné wrote:
> > On Wed, May 04, 2022 at 03:19:16PM +0200, Jan Beulich wrote:
> >> On 04.05.2022 15:00, Roger Pau Monné wrote:
> >>> On Wed, May 04, 2022 at 02:12:58PM +0200, Jan Beulich wrote:
> >>>> On 04.05.2022 14:01, Roger Pau Monné wrote:
> >>>>> On Wed, May 04, 2022 at 12:51:25PM +0200, Jan Beulich wrote:
> >>>>>> On 04.05.2022 12:30, Roger Pau Monné wrote:
> >>>>>>> Right, ->iomem_caps is indeed too wide for our purpose.  What
> >>>>>>> about using something like:
> >>>>>>>
> >>>>>>> else if ( is_pv_domain(d) )
> >>>>>>> {
> >>>>>>>     if ( !iomem_access_permitted(d, pfn, pfn) )
> >>>>>>>         return 0;
> >>>>>>
> >>>>>> We can't return 0 here (as RAM pages also make it here when
> >>>>>> !iommu_hwdom_strict), so I can at best take this as a vague outline
> >>>>>> of what you really mean. And I don't want to rely on RAM pages being
> >>>>>> (imo wrongly) represented by set bits in Dom0's iomem_caps.
> >>>>>
> >>>>> Well, yes, my suggestion was taking into account that ->iomem_caps for
> >>>>> dom0 has mostly holes for things that shouldn't be mapped, but
> >>>>> otherwise contains everything else as allowed (including RAM).
> >>>>>
> >>>>> We could instead do:
> >>>>>
> >>>>> else if ( is_pv_domain(d) && type != RAM_TYPE_CONVENTIONAL )
> >>>>> {
> >>>>>     ...
> >>>>>
> >>>>> So that we don't rely on RAM being 'allowed' in ->iomem_caps?
> >>>>
> >>>> This would feel to me like excess special casing.
> >>>
> >>> What about placing this in the 'default:' label on the type switch a
> >>> bit above?
> >>
> >> I'd really like to stick to the present layout of where the special
> >> casing is done, with PV and PVH logic at least next to each other. I
> >> continue to think the construct I suggested (still visible below)
> >> would do.
> >>
> >>>>>>>     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >>>>>>>         return IOMMUF_readable;
> >>>>>>> }
> >>>>>>>
> >>>>>>> That would get us a bit closer to allowed CPU side mappings, and we
> >>>>>>> don't need to special case IO-APIC or HPET addresses as those are
> >>>>>>> already added to ->iomem_caps or mmio_ro_ranges respectively by
> >>>>>>> dom0_setup_permissions().
> >>>>>>
> >>>>>> This won't fit in a region of code framed by a (split) comment
> >>>>>> saying "Check that it doesn't overlap with ...". Hence if anything
> >>>>>> I could put something like this further down. Yet even then the
> >>>>>> question remains what to do with ranges which pass
> >>>>>> iomem_access_permitted() but
> >>>>>> - aren't really MMIO,
> >>>>>> - are inside MMCFG,
> >>>>>> - are otherwise special.
> >>>>>>
> >>>>>> Or did you perhaps mean to suggest something like
> >>>>>>
> >>>>>> else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
> >>>>>>           rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >>>>>>     return IOMMUF_readable;
> >>>>>
> >>>>> I don't think this would be fully correct, as we would still allow
> >>>>> mappings of IO-APIC pages explicitly banned in ->iomem_caps by not
> >>>>> handling those?
> >>>>
> >>>> CPU side mappings don't deal with the IO-APICs specifically. They only
> >>>> care about iomem_caps and mmio_ro_ranges. Hence explicitly banned
> >>>> IO-APIC pages cannot be mapped there either. (Of course we only do
> >>>> such banning if IO-APIC pages weren't possible to represent in
> >>>> mmio_ro_ranges, which should effectively be never.)
> >>>
> >>> I think I haven't expressed myself correctly.
> >>>
> >>> This construct won't return 0 for pfns not in iomem_caps, and hence
> >>> could allow mapping of addresses not in iomem_caps?
> >>
> >> I'm afraid I don't understand: There's an iomem_access_permitted()
> >> in the conditional. How would this allow mapping pages outside of
> >> iomem_caps? The default case higher up has already forced perms to
> >> zero for any non-RAM page (unless iommu_hwdom_inclusive).
> > 
> > It was my understanding that when using iommu_hwdom_inclusive (or
> > iommu_hwdom_reserved if the IO-APIC page is a reserved region) we
> > still want to deny access to the IO-APIC page if it's not in
> > iomem_caps, and the proposed conditional won't do that.
> > 
> > So I guess the discussion is really whether
> > iommu_hwdom_{inclusive,reserved} take precedence over ->iomem_caps?
> 
> I think the intended interaction is not spelled out anywhere. I
> also think that it is to be expected for such interaction to be
> quirky; after all the options themselves are quirks.
> 
> > It seems a bit inconsistent IMO to enforce mmio_ro_ranges but not
> > ->iomem_caps when using iommu_hwdom_{inclusive,reserved}.
> 
> In a way, yes. But as said before - it's highly theoretical for
> IO-APIC pages to not be in ->iomem_caps (and this case also won't
> go silently).

My idea was for whatever check we add for PV to also cover HPET, which
is in a similar situation (can be either blocked in ->iomem_caps or in
mmio_ro_ranges).

Thanks, Roger.

