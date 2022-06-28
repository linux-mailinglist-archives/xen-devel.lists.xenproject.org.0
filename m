Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEA55CB4C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 14:59:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357089.585504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6AoP-0006Vb-Hw; Tue, 28 Jun 2022 12:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357089.585504; Tue, 28 Jun 2022 12:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6AoP-0006Sk-Eg; Tue, 28 Jun 2022 12:59:25 +0000
Received: by outflank-mailman (input) for mailman id 357089;
 Tue, 28 Jun 2022 12:59:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XT0n=XD=citrix.com=prvs=171720f04=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6AoN-0006Se-RH
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 12:59:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2062a602-f6e2-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 14:59:22 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 08:59:19 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB5861.namprd03.prod.outlook.com (2603:10b6:510:3a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 12:59:17 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 12:59:17 +0000
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
X-Inumbo-ID: 2062a602-f6e2-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656421162;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KPJvd70DOpzKOXiXJHvjVUgEHRyWZ697HcGH8i26s2Q=;
  b=KtMope8XexI0ZQFVlgxL1BkU0MlRkB+laS5N+XU8gv1dGBmCSnFbrqUZ
   IqzGPzOkLP1VaVdRVhGIOIUYUwc0aGPeVnduzIiF83VybbvpyEq1i2NyT
   mRyQBiQz5AxK+DoKYwHPEwxc167uUqabLkifmoVnKeP3oyXJ8wBiYLRHS
   k=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 74582839
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4K3G4a+SG79XSV1kC/X0DrUD9H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GscWD/Va6yMZWLyLoh/OYqyoxsF7cfQz9JnHAI6pXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb7qFQ5zMobpor4QEBxGIhB4Hfdp1aCSdBBTseTLp6HHW13F5qw3SWoRZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvuMvIABtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGEF+AjF/vtfD277/jco/qfsAevpfd2Gf/hPw3eVp
 WGF4DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHiWzWorXjCuQQTM+e8CMU/4QCJj6HTugCQAzFdSiYbMYN/8sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:WoRk9qmYEWjzVtb68YQgXghRMZPpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 D4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR8Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqXneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3GlpT1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYzhDc5tAB2nhk3izyhSKITGZAVyIv7GeDlJhiWt6UkYoJgjpHFoh/D2nR87heAAotd/lq
 b5259T5cBzp/8tHNxA7dg6MLuK40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.92,227,1650945600"; 
   d="scan'208";a="74582839"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyTBqCAi5qFO2CNOUTLbGnvNuglnY6WdF7qHonpUiwFL4tuXNyt3UKX6IDIET8d7Y7S3PfsSpD/09NSn3/AHNmActjk5z+QrE+0Sf54RNz78v9maqWvEjUAGfCw6TfdgZ9pv78cCEJ1VA4LDpbZtZJe+UT6rUAPY/YhF56NIlRCOrOHp9HkkAafq4/iM6gZlGoWDznvPhR3uCHoBKQWK7EfI4bsHhJ4YuyaCUWbAJ3R4wmO0B7BJMLddults6miPjENwNuXYs6RT36SGg75NRPC3IUEAl+Fdn8JMc293DXTYo3J1C01XwpuW95mutLlaX0Lts4V3c0snzlgxUIgcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4WQVfKaHh29/UDMHLsgwd0cfxFswnebgrRcID3Ts1U=;
 b=EYfWsEyImzKswLS6H8WsmuqZE0egoTaXk+yrhtluZLdvEnxf1oEhUjcC/PiSE8Mwot2gByB6VhX++IjN5Ngb2hcx3YsIVf2JEWfsKtLTOVnvtWED6AqpwhZiRVbmYiBzBXac+hxkeQZD5yJpdXzwsXLfNc/q4hSnAhVeFOJZlPEaPk8uIdzA80HDaWnZfVJjhdBh2zm4YLmOG036Av0oxLCXViGtVBukl12Qnkd0uZCu7q/m1oQuAChWHFVOjFpRzaGFfxvKsP4NzVOCZU3+5XUUyCq5Y0Yi8eJfFic3BpXFJkihhRhIB950lQzQ1U8GQVTb3LPhy8K46dqSCBucVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4WQVfKaHh29/UDMHLsgwd0cfxFswnebgrRcID3Ts1U=;
 b=ZB/i3NvDeGixmp/b5/Oq/6CQ624lbQ/8lC/H14WbDbrc3MlzxskuXUFO33+wBpw9LPV2HdjB3E+Om3wYldDY2Nj3ptV8reF2TtQuSpPIqQkP6CSqF3LdD3lnUzlNUtpvhGqZOZJj9L0K+A57SXeO9cL/q9MiQq9GVVGtielgyL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Jun 2022 14:59:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: correct asm() constraints when dealing with
 immediate selector values
Message-ID: <Yrr7IO3LW4d1MZfR@Air-de-Roger>
References: <2c04b2aa-d41f-0a2c-6045-2d37a6fac53e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c04b2aa-d41f-0a2c-6045-2d37a6fac53e@suse.com>
X-ClientProxiedBy: LO4P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9309cf79-fb8b-4338-3113-08da5906022e
X-MS-TrafficTypeDiagnostic: PH0PR03MB5861:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jws8tfhRztCyCErfBMyv2RKdWVrUOF0OV2siwaJLcB3TNX5231+c4jiY1pm0ydYLyki4rtJ1AtLHutjGNpFh5PpS56LgdL/E0J5pmbk2zqSK6lvqHCBlREvC1A0USEmO3W0zQ3NGUdgx/+NZg25kNAU3yYO23jCz1qIZuDCq2O6NAVEYWAb6hkpvT4kSbGQDojE6Fze0jExUua22g3NI1RzycDIj7PHKLpmJVBpwtiCy7dP8jksHsTyiXd62yMkpPt8tWK45zf2ttSBvUV6gGwlus9i1VQ2ImNTZpAsBq/zcfWdSAX6NmnX1CQjA1lIopW7tCQb6Z88UhHPDCzjO4xYb+vPyfFNXPsagvhUj6QyQJhSZFA72IMwYGyGGPH7aM2jEfg3/r/TwbeC9yBX9g3LHriLa3HTSoukKtY84fE0pRnT551jHZTgELHDnSXTqpT5aSyxYaaNve1aTdSCdrB/6VVXlsPbRxkIn+1nta1/SkcH50/xT7giE0SaHSkSNCYwSRR/b49GJ8dS1GYNCj/D7LQN1uOuE99uuXpBMq9AHkwmzpT9eoPXqZpIHD/qf2BFkqAFoeBy/84Fw6VqRNOU8ob/KA00tbmeqMe1asAB1OFhtN8NHF5YlAwou4T06yWe8PQpmPX94Som4jDc0k6tljfmJn/JCKT6qT557mLB6uLx67r5KugIeQ5k0qDtJwnPKl8rSNYqe6bhdQywTbRPnE+ZlHMRbm1lrnRG64Tl2doKURiGVC0rK7iAzfIYk0w9zmgFcOswT+2xCNdXIgA9uG3cX2TbLC1BKK45xXMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(376002)(136003)(366004)(346002)(396003)(39860400002)(6916009)(6666004)(316002)(54906003)(2906002)(82960400001)(86362001)(41300700001)(5660300002)(85182001)(38100700002)(66556008)(26005)(33716001)(66946007)(66476007)(4326008)(6512007)(8676002)(6486002)(6506007)(83380400001)(478600001)(9686003)(186003)(8936002)(14773001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1c3MWY2TWJyYlNnQ3hxaXBNeGRJbnVVZ1EvcXN0WkRJb1JxZUFhMm5yT0Ni?=
 =?utf-8?B?R0NMYUtjMFQ2THVLUGFxN0QzK2hhejN3NjJwVUlkYUxQeUhJOVQ0UjJERFl6?=
 =?utf-8?B?S0FpOE4yZXptK2l0T3NjSndUQ2VSVEhPU21FdTVrZENuSDBnMEt1WXkrZDY4?=
 =?utf-8?B?VytlU3JPcXNXVWtMeENCRFRiOW0wd3hZWDFXckRNbTZHSHJDZ1pHS1MyanUv?=
 =?utf-8?B?QzRuN1NRU3V0MzM3aFlhdTVyQzV6T2FCYitFZjd5ejg3YlVlVjN5TGd4dlZJ?=
 =?utf-8?B?T3pxb3g4NndoVlFuaGRZQzg4RThiejJlK29YUEp2RkF5WXNPejFUdzZJM25z?=
 =?utf-8?B?b0trRTNERjlXRkduWitWVFBrME1wSVkvN3dOSE93UzhwRHhFY3pIdXZ3OHJQ?=
 =?utf-8?B?bTNyRGMvODV6WU43aHRJRytXRW85R2dqdUlnUGdvVkZUWm5Ecm1qQ3BOWk9R?=
 =?utf-8?B?dlFObG5saFFxaVZSdlZXeHI4dFBoVm5kQURVSUhQeWpabVdMUnJDZFBtUmcv?=
 =?utf-8?B?MmZmV2grYW4yUmdHekh5aS9IQ2pJRDdNV0FjanNsOHhCRFNIcWJuSStuL3lZ?=
 =?utf-8?B?dy83OXg2MUNVbWtxdnJBeUFjTFJqSFMyVFJlSlBJY05iT1k4djBmSllhSFN6?=
 =?utf-8?B?QjNiVXJxeU5aZlkyMVZYWjkrcXhNczd2TktXMkREeWJrRE5FRDliUjIxd0o1?=
 =?utf-8?B?ZXRMM3pDZGJHeE1ablZad1dWbElqL2RxSkNhcW9heC9reHZBQjZlQzVDWVY0?=
 =?utf-8?B?VThQVDB6VUgrNzk3aEc0VDlkaDZDa215alBaWGc0YkhYTHdsWlUzQ2d1SExt?=
 =?utf-8?B?c3FuOFRqNlpHTSszMGRmckxMOE5ta1loU0dFZ05QTk5aZVJOSlZIWnZya1Na?=
 =?utf-8?B?eVdDWWJXYXM4L215bWxwYVRzVGRZVTlvbUNWQTNyMTdCTEpxY3NKNzVBRFhT?=
 =?utf-8?B?SnhUcUJaRllrU1Q5Q2dDZWtXdEc5aHAzVktYUElyRTlXM2NPQjZ5QjNoSmhj?=
 =?utf-8?B?OS9DTEdsOUx6L2NUMmlmdU9HWVJ4bUpBcTUyOU0xRU9kMUFIK1Z1dDErYUps?=
 =?utf-8?B?QjJpK1R1akk2KzcwcmROZ01Hb09Dei8zM1VNZkFXL3ovQ04yTnZTSDlIc1FJ?=
 =?utf-8?B?UVhxQnlPWktMK04zS0pvWEdkbHFDVHAzM0xXWWRYQ0MvMFJDWERKNytXVk9z?=
 =?utf-8?B?VHpvQWR2bjZsODJqMHRPa21qaHBoODc3eXRBVEdOSGFpcU1zWURheHlYRGEr?=
 =?utf-8?B?SUo4U0hOWUE0NHV4b0lOWUJzUGV1VHdDSjYzUm5pYmVJZjBIUDVqL1VEdXlp?=
 =?utf-8?B?OHhjL3hDdUgrR3ZZRUxkZkozaGJIRVcvOVl2TG5sTDdTeGJTRC83dzhMcERP?=
 =?utf-8?B?TndQQ1BUSVhiNVpVUjF2OVBnZXlnZVBaZWROdlIybFR3TGQ3U0R1SFlKU3V4?=
 =?utf-8?B?ei9ndHNUYXNnUnE1a3l3SVpyL3NZU3ZxQ1ZpWVVlZ0YrZzFUeEZkS1FyNHRo?=
 =?utf-8?B?cXM5WURnb0FWK3NzejF0VXVMc29LT3lZWG41Nm0wRVg0dzhicmtzamdrZTJh?=
 =?utf-8?B?RTdLRmNxTjAveStzNGlBcDM3VWFBQi82RXFwRSsxbHFicG1SZzZLaklDR29x?=
 =?utf-8?B?RmFZQms1clBzMHZ2WDRWZitGQ2hsRWVzVDNVcEw3NWRDNXlrNmpFMll2NEtD?=
 =?utf-8?B?TlhQNG9RYk9hRXBoS3dpbWI0RGhnWW1nVlVCUklJMGszSFZNTjJ1c3B2ZkxC?=
 =?utf-8?B?bW0ycFhndE41WXNQcm51SHo1cnE4NWI2NnRUSkJGRFV1Q2ZaMUdHRS8xbFVO?=
 =?utf-8?B?bjBhbFJ1ZjNjNEx3TmMrWE8ra3lFbmgxSWlyaTJtcytyVnoxUmJvSkZyZzIv?=
 =?utf-8?B?UXJlVXRjdTJ1N3Q5K0Q4dW9HM1htaXFSSG5RQWIwZnVUWTNzb2lJQzZKUjk4?=
 =?utf-8?B?bDRqNG1Cb2FBeU9YTVVVOG5Vd05LNlNaeWorbVlScmFoQm5wMzFOTk1iMTF2?=
 =?utf-8?B?dkQrWldTbXppQ1BzVEFGM2M5NnRwRERNbGFyaWxPRm93UkxhSDRIcS94K1JH?=
 =?utf-8?B?SFBLZXh2MG5lWFBJS1hPdjBvbERoR1JYcE9VSDY5bEh4MFdVRjdMVTZpbWE3?=
 =?utf-8?B?WUtPZGtXQ3NJQWdZNXZkc1RGMi83K28wZ3p2a1NRY2kyWHJMMzQ2QlNlOGNV?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9309cf79-fb8b-4338-3113-08da5906022e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 12:59:17.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuOpM0q+rmPZIYYj+QY5nSc7reMMOYuEq6p5EfiM/ndOxI0oWj56PqZLYO0zDN9IU8WLSpyhfqM5HnQUSBlTag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5861

On Mon, Sep 13, 2021 at 08:26:21AM +0200, Jan Beulich wrote:
> asm() constraints need to fit both the intended insn(s) which the
> respective operands are going to be used with as well as the actual kind
> of value specified. "m" (alone) together with a constant, however, leads
> to gcc saying
> 
> error: memory input <N> is not directly addressable
> 
> while clang complains
> 
> error: invalid lvalue in asm input for constraint 'm'
> 
> And rightly so - in order to access a memory operand, an address needs
> to be specified to the insn. In some cases it might be possible for a
> compiler to synthesize a memory operand holding the requested constant,
> but I think any solution there would have sharp edges.
> 
> If "m" alone doesn't work with constants, it is at best pointless (and
> perhaps misleading or even risky - the compiler might decide to actually
> pick "m" and not try very hard to find a suitable register) to specify
> it alongside "r". And indeed clang does, oddly enough despite its
> objection to "m" alone. Which means there the change also improves the
> generated code.
> 
> While there also switch the two operand case to using named operands.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, and sorry for the delay.

Roger.

