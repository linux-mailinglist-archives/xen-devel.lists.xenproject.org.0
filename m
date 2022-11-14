Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638A627D9B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 13:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443343.697876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouYSt-0003G5-49; Mon, 14 Nov 2022 12:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443343.697876; Mon, 14 Nov 2022 12:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouYSt-0003DT-1Q; Mon, 14 Nov 2022 12:21:27 +0000
Received: by outflank-mailman (input) for mailman id 443343;
 Mon, 14 Nov 2022 12:21:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JxMm=3O=citrix.com=prvs=310c1b068=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouYSr-0003DN-HL
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 12:21:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9b02794-6416-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 13:21:23 +0100 (CET)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Nov 2022 07:21:16 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6118.namprd03.prod.outlook.com (2603:10b6:208:31c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:21:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Mon, 14 Nov 2022
 12:21:14 +0000
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
X-Inumbo-ID: d9b02794-6416-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668428483;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lBXnySvigQeqW+ZDw01qKtbs/eKRULhXbeuejXvQDEA=;
  b=JuJkvHyohtrQ/f5i9dRvjnm0H8mbNl5fmH1EOwxk4ANoMK/15nAlVwBr
   a/h7xXkK43iY760aq86lhojSRBEUgT0iFy5ByzvsWYdvi93TgLz00UFZT
   5bYWl+PMW8iU8rwUgiMEpnFM/Gb1AQXvSWKgEDKss+i4oIZZJpr/5ISXj
   8=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 83829768
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eRtrRa0DsfT2G4GhxPbD5SRwkn2cJEfYwER7XKvMYLTBsI5bp2cPm
 mUeXW7QaKnYN2emedhzbYWz9EwF78OBm4cxSgVkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGGht+
 /wbLAo2Uk673euT5fWUVeRVmZF2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFQZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r83b+VzHylCOr+EpWJ8PEyuRqpmVc/SzcwZWqk4ubohA2xDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbjNHcs1gi8YwShQjz
 FrPlNTsbRR3uaCRYWKQ8PGTtzzaETcRBX8PY2kDVwRty9vprZw3jxnPZs1+C6PzhdrwcRny3
 jbMqiE9jrcSiMcj1qOn8FSBiDWpzrDKQxA04EPLX2ujxgJ/eIOhIYev7DDmAe1oKY+YShyNu
 SYCks3HtOQWV8jVzGqKXfkHG6yv67CdKjrAjFVzHp4nsTOw53qkeoMW6zZ7TKt0Dvs5lfbSS
 Be7kWtsCFV7ZRNGsYcfj1qNNvkX
IronPort-HdrOrdr: A9a23:00jV0652qNBYKYKXUgPXwa+CI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gZJPh8sH7eGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Lh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXwTwk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFj9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb5rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tpt+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFPxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIOzNaVwg1PwqViGLHbQIpk03ek9hlS8fsulDcS7ciFvryP6yM9vRvEyWJ
 6ISedr6rHYXCzT8L1yrn3DsqlpWAcjufIuy6cGsnK107X2w97Rx5rmWceWAobROhAZfU66Kk
 c/fVHIVbd9BwaQKzPFvCQ=
X-IronPort-AV: E=Sophos;i="5.96,161,1665460800"; 
   d="scan'208";a="83829768"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jiq5zdj9TXMp5mQGFuOAbY4VTu0hQE8Xc0XAENwJZxpXaXEXdlIGI16KfGFBrp8DMjvvNLN3EmTjaxKdAlIkEjOZSUOC04miBakMt/2Q5eVIoWe6msViO/p+hKAMF4kTx0wJRAxTz80bfcAfiIiLQwsKkHW1khT5qq6Iem6P8O/6GZ480Fr0JVYwSg8xODBjUbs9NTrqBf/Z+llk5bqzfOiryvQHAuxhgKZb+jPbtdysIw6Ab9qPgTKZcjr/SbPQ5G2hpRzfvzXr4ysrpt0tEaoHtbL9NoslwF8STvPHI+9/im3YRW7a+8YtzAe4u8EvB1Xz9GWFSZPjupMDPW8glA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNTcsBiFZbrLh133XwDwMIdoXwDbriQt8eK9G94FhYo=;
 b=G6qEqDcGWD1QE/BIyw0+EiGa1cyqVZL7Yk03DeqR4XRs0L1v2jLirm1VO9ve9aia/e455fEpBefSZ6eHgPbEYVo22D4kZxdhSHs1f7nSrgV3Uzs5jG+HYxxFCnsVv+kEwvDmtQgvIaip+7GJJoFMJzw7Kgzz741fwLf05iql0RNprt2D9cLPrAeEivLOZSbf/KxdyzocZcM4sOzDGAtQsh+cZKSia0En75ta2kR5iFraNKLfeEx1L6Zr204qSFqRlrYhLgqcFrLSscqbbwG+DlDAIEXG8dtg85jeIAMBAvTb99f2UNDmtGxxdzxsGNOET78ZlMx9yCGKASsMyFR++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNTcsBiFZbrLh133XwDwMIdoXwDbriQt8eK9G94FhYo=;
 b=sc34zIBgjJtEmfhKfsWpQ23NLmjNXFATmQfYwGqtJ1p7zSETy52ycdLMrxBf66nr19pvKuGd/dL1qpwBX+ifSN84NR8VaKquLt/U65uBeKswdI8q3OG9XLIGdvcEbO9P816p0s7RYPYCjaOglOKdjwWEbodgiSoMnsfwl5ceDeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 14 Nov 2022 13:21:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y3IytGtsqfQPXLCm@Air-de-Roger>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
X-ClientProxiedBy: LO4P123CA0606.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: f640fa84-07b2-4962-f403-08dac63ab8e2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WYdSwBj3jmsnBHyrtTLBH9RixqQ0vqVLr66zEockPFmtMhLflrbYzR6CQJKFBYCmxm1KIfDEkwB7pfMHBYjrdDRieT6Ws8ZJI90FDL0uY3eKXyCjHIbSKrTqTTrZaoJv4ts+hCY3MXuFbcxbGL/ri2SRywJeCkR+BNySFLgOrMvc324JAjknoO8uW0McypvrdqFcw0njgfzjtabW/vb7/N75XwBhafeEbB1WrbH6ja+dGC0xgKtbaEaffwHve2zwT8MRVc8/iESstmxjABeIIrjdIedVO5APAp9Kp2tQxxNxzZG+1a5KObta92YYFGceNr0rFfs8i7gYij++L7WmFKmZpjUDt3AJE/fn7y05RLRtMnbdryvKwlgMbSPJ9jnCI4bPQi3Pj3DD6nY2AGzX2tuDfmo+5QrE1SJxIEgAgMa8FC1wLgIzK58UmL8erACvFE6k/yP5FoQBiZVQXgDDKxoGhKaP/nRYV7rnRtoJDPAE8oCDB5u5lXo3OVPUAh9FAIrwz8knsAk0Jj52fjUOW9+u7tHAtfEfz709khbYKIJCxnOziq7MvTibgPcex/ETcueFxNrU782TRvhMjdahmqXKDGHvk4OiPVQNW/b0Su0VkCcP+DyfQE2zDRW9lb/XxBuL/wq5oZVNzq/rq0gmuiKHrWySkRU/avzcRnhTOxXquMQpuiAQUojcR7/CKlx+mqtzb1ugac/cdwfxb33qkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(41300700001)(26005)(2906002)(6666004)(6506007)(54906003)(86362001)(186003)(6636002)(6512007)(478600001)(6486002)(4326008)(316002)(5660300002)(8936002)(6862004)(38100700002)(83380400001)(66946007)(66556008)(66476007)(82960400001)(8676002)(9686003)(85182001)(53546011)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amJ1Q3ZnY3NRZDdWUk9SelkyUktPa2N0TGoyZDYvQzV0d0Q5emlFQzVYTVc4?=
 =?utf-8?B?bW1VVnJmU05oMzhkbyt1RXdkNXoxM1lHbGlDakJXbGFnSUFhVTNxQVNMWkta?=
 =?utf-8?B?bUppUXdpMWlyd2V6N3FYUzF0S1hDaDR0RHFkekgrSFZmYks1YjN6ak9nOEU2?=
 =?utf-8?B?U2xsR2d2bUlLTmUycVBEQVRJY1NJUVlvZEM5alg1dEZRUWJzMTZGYTBPUkdF?=
 =?utf-8?B?NExET01HTkhZUnl3bnhtS2paRGF3QmRUa3ZhRGZvSkdYK2dEYVg3R2dENUFF?=
 =?utf-8?B?eEs2dlJkRm4zYVU3dHNORVVtQ1pLZXIralptODJJSGtlamkzSEMzaEhPc1d6?=
 =?utf-8?B?dDVIY0V3RzJzTG9SOHBjV3lmY2MyaGxYa3VNUjhaK0phOGVjaHU5QU1kNG5F?=
 =?utf-8?B?QWl2VWxMWEthQWxOUmFlamVMZUFuRHQvbHVMaGdnRkQ3OXJ6cmRETFJWMTM2?=
 =?utf-8?B?WTd0LzNRZkpMMndDMC8xK1VqamZSWExkTjJuQnREUkRjQU51OTdGQnhEdEow?=
 =?utf-8?B?MzZoZ1M2dnBJRzYyd3dqTGZuWXFHN3h1QU1JZmQyS1hCZk1NdXVkN3BBUTFK?=
 =?utf-8?B?ZWIyWG1kUTFTTTZTMTRaaVBEYkRsdHA3ZC9yL3ZlbU9qUGMzWHBMdGpzbjBt?=
 =?utf-8?B?MlRzWjMxaHU5ZDdkNGpubHh5ZjJkbm9PRFlIdHNYWU9CbDhIWHVNckl1dWVv?=
 =?utf-8?B?a1NENDF0VW9WeWt0c3RNa040K1ZINFpSTW41eHNweEJ5aDRyVDlLeW84dWlD?=
 =?utf-8?B?czBodWYxN1gxNVduWEhkay92dHhIZXRKL3N6N1N4YWpFVGk1a1hSUmMzOHZ3?=
 =?utf-8?B?SW43RlFDL3VybkdyZGJYMDlQdXlJRWMxM1FSK2VTZE1pbkFaL0JUOVN5K3lL?=
 =?utf-8?B?RENUNm9YM3lTT1J6VnNmVzlDSGpHeUV1d3RwNWh6UTRwOWpwUVVIMURZcFRX?=
 =?utf-8?B?UnFQVHo5TEVWb0JsOE5UcmYya1BnSWdYeXlyMzlZL21QWmd0NTV0VWFTcG9s?=
 =?utf-8?B?MkZGVE4vdU1DMU85L2JDOE8vT1JIdGo3ZGE0TTVLM0FFY3RXVlBIOGwwWm1C?=
 =?utf-8?B?WnFkTFczSnFWcm1UQkg5cStnc2hUUmpLMm50dytYQlJibU44Z2xmejE5Qzh0?=
 =?utf-8?B?UTVZNEZmaGpwc29DUHVBdjIwbTYydXRoTk9WZDVNY3QrN2VnUDgwS3UvNTli?=
 =?utf-8?B?ZTZOZE5NS2ZwNXY4d2ZSblNJM1RJZlpoSW1sZVdFOGM4MlhoZWZaUUgxMEhL?=
 =?utf-8?B?YUJBSzdWYVdpK09NWDJZVDJsVy9teWo0dng2ZERtbVBUZFkwaXQ3eWYwaFox?=
 =?utf-8?B?K05QdUF2aFJQMTluTDJSeHc2bStMZFRTcStRaWVTVFRweXQydXI1Zm5GaW1t?=
 =?utf-8?B?OXhIekxXUERNMWNBaFFBbEVWcElVaWhuNGtXd3VLTGgwbmIyMXlmMHN0dllk?=
 =?utf-8?B?OWhJbkdrKzJ5VDIrVWUySHpVV1VsWWJuS282N1NwbklhbGd2UkhpZkdYY1Mr?=
 =?utf-8?B?NEZ1eUlOTzJxdGFEZG8xNUFXcEFQWkMxRWZNVXR4RjE1M1pUL2l4SjZlckJs?=
 =?utf-8?B?Q3l6ZjVYd3BYV3hoZVRvSmFYYXd6Z1oxRWl5cnUrMmZFQmplSXh1MXZwSlVX?=
 =?utf-8?B?UEY0Ly9rL09vaEZBOGpLSHpYT29Ec3dxeUdodmRDSWNiQjdNeE1jZUVwS3Fz?=
 =?utf-8?B?Tll2Y29BdEdEdFJrNUVpRDNQVjl1dEs2dHY2YTVxTitlbXhEekdUSndJSmR6?=
 =?utf-8?B?NVB1Tkg0UU5ybWJEL3BYakROWjVLTEJ5MURoZHJmYmpGNS94bDlRL1gwbTdL?=
 =?utf-8?B?Zlp3TVlQTnkya2JBUXZsaGRlLzBnSmhobU1ZVFJsM3lGRlBZMmk5TmYvanEz?=
 =?utf-8?B?NkwrTENFQUZvUFFwdnR4d2x0cWFvWng3bzd2cytLdXBXUHI1RTAwUUZSZFhJ?=
 =?utf-8?B?blF1NEtVdDRWWUJMTG91YmxMN2NEVjJ0ck1xRGJxSTNHZXVTK21MZzJjMlhC?=
 =?utf-8?B?NjdKOXFIMEdqUkxjb21xRHJJZ1VTNFJYeEVJeGMrUW53VUk4MFdJWHE1NE1S?=
 =?utf-8?B?YzhodGtvL3ZEWnRGUGtUWTZvWjkvdklLdEsrVnpwWjRET2U4UHNIQkRnVzgx?=
 =?utf-8?Q?TU1Q1QUyQTxBC9oMObpel8Pvc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X+5oCyDV+fmsytNy1/JIcV169SxzgW0yWMoJ5y+CueFN0nmxvyE/6QYFTkrJLgHiuNS066baT42uC7k51WJ82MOSAq8EVUKKxVdyi+0cZ7DY5MkedU2T8/jFuDjdDD8N52ilvwasaFHKrsfQ9rNpsok2Ounl9oUBYxMd2x24i0mlyxE0PQb3gCsBo/kAV2TzDHwXfZDvZDOfmDiX1BmCd6bhznPsXf/2MiVqsMRVKNBimULuWhwK8bf9l9NxU8d+fqEeGnANKrLgnaWNJKY0x3pevnN3KAVGx3k4u1VVz9Z3Cpqx81lS0BglHSp+wvjjYbvlOD0Wjd2j0xFV6sfMZH4v02K5Qr//4UuC1J0PejjqAwcYQQAXWIvgeGKuf/VXZfZItzPwTmd6Tzd2d0tQ5PAV0VAdHaYlN+zdKEkL8r3B+l4sGuzCIrmaANRbZzuBi2lkBrz9gxxXzpeto86K8JVIY9kxsZ+BePcQXFw53ZRyNpF0/Mo7CiNeB6BFFX0lH6hzzogzp0sG8gLkTLmqXRJVwBxBncI0jmCRsmSalCdIxUfYtxCc/69JQ7xXhbob6gapV1pUGLeM8YesIKkGusLs8Z7ZfJlXy+Ap961iDjV6oCw5wc0FlcEhHDtamy12/xRFHWwc7AE51KPUEXP2BsYinLyMBp+sjGmxmnx+TuiOGgJdVVnJax0bf9r8H2kXD/QzuMwI1nwHl3Ki+iU+ub/HnRDDwBbr4HmtloP7k/z079KreNJhDif3M4VcWypBT3h/FIXeCp3iy7XRI4mm3vda9cecsm40/lmPvrQz8mGeioQYptU+OfuDaYfPH4/JZ6wST+IehtOn0A6zRo/QVUH8vfObvwW7/z1pulr8umhfnMYImfkBtNsgIy0XhGB/ApTBw7YC9EAja9jdwWL41O96E3L36HyfC6mc1bKBVDs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f640fa84-07b2-4962-f403-08dac63ab8e2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:21:14.2238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiFUUADt2et8yAmICqwVEh/6r7mA6Z/uX6++/LDsIvF55c3eIdEwqX05JwRZ8/hhjT6Q5Z1DTSFvwW28kNbJ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6118

On Thu, Nov 10, 2022 at 10:47:07PM +0000, Andrew Cooper wrote:
> On 04/11/2022 16:18, Roger Pau Monne wrote:
> > The current reporting of the hardware assisted APIC options is done by
> > checking "virtualize APIC accesses" which is not very helpful, as that
> > feature doesn't avoid a vmexit, instead it does provide some help in
> > order to detect APIC MMIO accesses in vmexit processing.
> >
> > Repurpose the current reporting of xAPIC assistance to instead report
> > such feature as present when there's support for "TPR shadow" and
> > "APIC register virtualization" because in that case some xAPIC MMIO
> > register accesses are handled directly by the hardware, without
> > requiring a vmexit.
> >
> > For symetry also change assisted x2APIC reporting to require
> > "virtualize x2APIC mode" and "APIC register virtualization", dropping
> > the option to also be reported when "virtual interrupt delivery" is
> > available.  Presence of the "virtual interrupt delivery" feature will
> > be reported using a different option.
> >
> > Fixes: 2ce11ce249 ('x86/HVM: allow per-domain usage of hardware virtualized APIC')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
> > don't want to rewrite the function logic at this point.
> > ---
> > Changes since v1:
> >  - Fix Viridian MSR tip conditions.
> > ---
> >  xen/arch/x86/hvm/viridian/viridian.c |  2 +-
> >  xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
> >  xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
> >  xen/arch/x86/traps.c                 |  4 +---
> >  4 files changed, 24 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> > index 25dca93e8b..44eb3d0519 100644
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> >          res->a = CPUID4A_RELAX_TIMER_INT;
> >          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
> >              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> > -        if ( !cpu_has_vmx_apic_reg_virt )
> > +        if ( !has_assisted_xapic(d) )
> >              res->a |= CPUID4A_MSR_BASED_APIC;
> 
> This check is broken before and after.  It needs to be keyed on
> virtualised interrupt delivery, not register acceleration.
> 
> But doing this correctly needs a per-domain vintr setting, which we
> don't have yet.
> 
> It is marginally less broken with this change, than without, but that's
> not saying much.

I took a look at the HyperV TLFS spec but the table that lists the
CPUID bits don't explicitly name which registers are accessed using
MSRs rather than MMIO when the 'MSR_BASED_APIC' suggestion is set on
CPUID.

It's my understanding that the hint is not useful anymore, as Xen
exposes x2APIC by default, and that's what any new-ish version of
Windows should use, in which case all APIC registers are already
accessed using MSRs and the hint is moot.

> >          if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
> >              res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
> > diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> > index a1aca1ec04..7bb96e1a8e 100644
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -1136,7 +1136,7 @@ static int construct_vmcs(struct vcpu *v)
> >  
> >      if ( !has_assisted_xapic(d) )
> >          v->arch.hvm.vmx.secondary_exec_control &=
> > -            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
> > +            ~SECONDARY_EXEC_APIC_REGISTER_VIRT;
> >  
> >      if ( cpu_has_vmx_secondary_exec_control )
> >          __vmwrite(SECONDARY_VM_EXEC_CONTROL,
> > @@ -2156,10 +2156,10 @@ int __init vmx_vmcs_init(void)
> >      if ( !ret )
> >      {
> >          /* Check whether hardware supports accelerated xapic and x2apic. */
> > -        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> > +        assisted_xapic_available = cpu_has_vmx_tpr_shadow &&
> > +                                   cpu_has_vmx_apic_reg_virt;
> >          assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
> > -                                    (cpu_has_vmx_apic_reg_virt ||
> > -                                     cpu_has_vmx_virtual_intr_delivery);
> > +                                    cpu_has_vmx_apic_reg_virt;
> 
> apic reg virt already depends on tpr shadow, so that part of the
> condition is redundant.
> 
> virtualise x2apic mode and apic reg virt aren't dependent, but they do
> only ever appear together in hardware.

I would keep those as-is for sanity, it's easier to spot the
dependencies between them.  And then it's also possible that we want
to introduce a control for tpr_shadow, and which point having the
conditional here is a good reminder that virtualize_apic_accesses
depends on that feature being available and enabled.

> Keeping the conditionals might be ok to combat a bad outer hypervisor,
> but ...
> 
> >          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
> >      }
> >  
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index e624b415c9..bf0fe3355c 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -3405,25 +3405,29 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
> >  
> >  void vmx_vlapic_msr_changed(struct vcpu *v)
> >  {
> > +    bool virtualize_x2apic_mode = has_assisted_x2apic(v->domain) ||
> > +                                  (cpu_has_vmx_virtualize_x2apic_mode &&
> > +                                   cpu_has_vmx_virtual_intr_delivery);
> 
> ... this is still wrong, and ...
> 
> >      struct vlapic *vlapic = vcpu_vlapic(v);
> >      unsigned int msr;
> >  
> > -    if ( !has_assisted_xapic(v->domain) &&
> > -         !has_assisted_x2apic(v->domain) )
> > +    if ( !cpu_has_vmx_virtualize_apic_accesses &&
> > +         !virtualize_x2apic_mode )
> >          return;
> 
> ... this surely cannot be right.

It's indeed missing a has_assisted_xapic(v->domain), so it should be:

if ( !cpu_has_vmx_virtualize_apic_accesses &&
     !has_assisted_xapic(v->domain) &&
     !virtualize_x2apic_mode )
    return;

Logic in this function is not the best one IMO, as I've already
mentioned in a post-commit remark.

> 
> While attempting to figure ^ out, I've found yet another regression vs
> 4.16.  Because virt intr delivery is set in the execution controls
> system-wide and not controlled per domain, we'll take a vmentry failure
> on SKX/CLX/ICX when trying to build an HVM domain without xAPIC
> acceleration.

I've tried creating the following guest on one of our Ice Lake boxes
(with and without this patch applied):

type="pvh"
name = "test"
memory = 1024
vcpus = 1

kernel = "/root/vmlinuz-6.1.0-rc4+"
extra = "console=hvc0"

assisted_xapic=0

And it seem s to boot just fine, no vmentry failure.

> This, combined with the ABI errors (/misfeatures) that we really don't
> want to escape into the world but I haven't finished fixing yet, means
> that the only appropriate course of action is to revert.

Hm, I'm confused by this, as it is still not clear to me what's
wrong with the ABI.  Is it the way in which we expose the flags?  Or
is it the naming?

AFAIK we want to have a flag to toggle apic_reg_virt, which is the
proposal here.  Should it be named differently?

> I'd really hoped to avoid a full revert, but we've run out of time.

I've also hoped so.

Thanks, Roger.

