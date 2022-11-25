Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984A16385C9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 10:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448116.704980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUZc-0002VW-8j; Fri, 25 Nov 2022 09:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448116.704980; Fri, 25 Nov 2022 09:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUZc-0002Sy-54; Fri, 25 Nov 2022 09:00:40 +0000
Received: by outflank-mailman (input) for mailman id 448116;
 Fri, 25 Nov 2022 09:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pdMr=3Z=citrix.com=prvs=32106567d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oyUZb-0002Ss-BW
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 09:00:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fdfc865-6c9f-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 10:00:37 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Nov 2022 04:00:34 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6451.namprd03.prod.outlook.com (2603:10b6:806:1c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 09:00:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Fri, 25 Nov 2022
 09:00:31 +0000
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
X-Inumbo-ID: 9fdfc865-6c9f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669366837;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gNdG5HqrIvHYi8D1uBXtYIgfnPWg14ZfjZprHOtTPrw=;
  b=ao+cApOhtFOHGhnuzSLyKQgkSeoMTSVT30YAlbbYAwr/ylNZVdrulCPH
   9G8obpq/fJsnpILWHkYUoGaZ2AQU2GGL31T896SsPx6AVh/HmWXK5e+5i
   PC9j13YbFWvGnIFTpBPYMzh5B566yYESbBhFnnewObIfuOZ0k5BPuQygw
   s=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 85537488
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bnkTya442ELDFnwIaT2ECgxRtA3GchMFZxGqfqrLsTDasY5as4F+v
 mIdXWCOOfaDa2Skf91/ad7g/E0CsMeGnNNmSQE++C01Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 uA7NHMvcA+/hMGEkeipe9BOj5sdFZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOWF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwH6gB95CRNVU8NY1mAGShXU2WCdORFidreCWpR+PGOtAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZZYcEinN87Q3otz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJobixvOSpNpFvGzh9isQTXom
 WnS8W45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 hDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:g6uW4qlsod2Jl0OmhI5QjoXw52DpDfNMiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Xh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboX0Twk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFv9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb9rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tps+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFzxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIKzNaVwg1DwqViGLHfQIpk03ek6hlS8fsumDcS7ciFuryP6yM9vR/EyWJ
 6ISeBr6rHYXC/T8L1yrn3DsqlpWAcjufIuy6cGsnK107b2w97Rx5vmWceWAobROhAZfU66Kk
 c/fVHIVbZ9BwaQKzLFvCQ=
X-IronPort-AV: E=Sophos;i="5.96,193,1665460800"; 
   d="scan'208";a="85537488"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4MRf+qAgVGiBkBtiw45p+K9PGHBCq2IW4njJctJWb+NcJMrnbPWUdhsaELbc8u84Q4clRkE7mUszk5vsvsMvtEXHFk4dx90KUWhNJ1lsnuPkW0as3Gt3Q28Jk6O00lz600tyZxHE8vMbwDteCZbN7YSOtctFC8zOzgHB5JAXMhyfHFZ2A+pR4KjvJyEutmPpgHGozypqBcAL7BD8qJfDqsuzbJtKK39A5LMKOBwOO/BvP+rQSKCoMRg9zZxpKkt7KK8p7e05zyt3+MsBvMqyHML+obf1LmjMXtSveoKA8WV43+DoFMAEVTNx8OdHJ3koAGUQv5VDlmRmK8n9NwxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p6tzce+1DxiJcGf7pTS063w6g4APCAUros5JTau/CQ=;
 b=WzAMT2U/5vxxj1hVSw4klwRS2qrmMglqLArN5T55IvzyP64AVaFqf6bqYaXsSCcOfpQ8lI3wE02/2Mu5BVdFfTlFJSKE+ayIUEFD3o3JsnsfSnZJWGQRvJnNd7rqWe6BEwYidj3dxr+rgjuzrtufcFziIOVtoDevaSQ9Crp5iZ6LZtS7lcoJS20skEfeK0fM3dYnvYrzyApQS4EKDuwMIKGkgIwybWonaWl0Kpb1TPWYEIRW3XfVhxDN8Ucg6PNLVYqgKjbLwljnvg2P54IL/qdH5cJP/QoYFXh5FxZIHapYnVqZzpTi+bQsYHanPMdBpjpqkFQQaXLP2+Ol9kwvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p6tzce+1DxiJcGf7pTS063w6g4APCAUros5JTau/CQ=;
 b=sx/gakxF9L7HmxgRS2NYv54dyW4tHl9Cl8Qean38j7ngUuC3xDSaNHlUd5dzATjSI+VRdQ2uyz5/Xi7gnc6zT9GIjlMj5RY481VgnAF7uQ7LQ55o5PuVKYozyb39MhAigpsGi0aidg+Ieco+55lKg8f0Y4rWTEpEXSppAIJv4Z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 25 Nov 2022 10:00:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y4CEKd800UtOKetX@Air-de-Roger>
References: <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger>
 <Y38z/h4aEkzh5rCG@Air-de-Roger>
 <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
 <Y386hoiAovoACjEG@Air-de-Roger>
 <3f3bced7-62e8-4ff2-655d-aed222f343a9@suse.com>
 <Y3+JwEtSHTRhngN1@Air-de-Roger>
 <516fb872-bc79-ad8a-233b-b821265c1911@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <516fb872-bc79-ad8a-233b-b821265c1911@suse.com>
X-ClientProxiedBy: LO4P123CA0120.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e30596d-e6d0-4e23-b9ba-08dacec3811e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kJmV8k/cbIFOyiwzrLiHp0dtyE39In6ZFDoewIyqT0FA/Lbnkkze9B0Ck5DfyPCoulb2Al0uCvFtSgqoyu9jNq0ga8p1rP1ArefR1xt0KrgLDwia/QnGy4EFruqLs0IqyXaXUOga4N+bTDOiidIs8zn2bqkyFZ3ikE0cW+FEGy9iobdifwJyTz/dOUsfq6iKlOJaEqjmXibr3TgDC2Z0qVIvKBjf+1QJT6xMA48wa5bBraUEkQ08Zgx5p99RIdYsuiGTtk9AuZic6TndwecwdTS6FWFnuiSYXyBBO/p91dNFx2pdtES4MDeYW100ecADzvO0gq6T/jIsjfnwAi7a0H7aMWv6Qw9p25NFK8yneSb57YqFOY7eCviIVxyILgrQhVhLhxk9ZFHqImnPswannMGCCSofKAD6j0xqlejmLRk/NqDxUb8iOfeY0RlzHxppqnJZ2mgm725ekbrzQynXPJtJMIOlbiOQIqJ3LBIWbA0EHroOQ1Kf+B9xaftQOed3pc4190Pt88pDY3wfBzXEIk5vLSNxnQPpRgkFdx6GTPldAwDq6LY3p+/nHEWqlXYRBOhSfcNKTtTq78XlwfWhi3Ryvi/72+F4dseeEyZF647XbsDgyi+TqY4Ez4uQuE/jEfRqCsOgETiOj4uvrEjrfOW3NTyH3yJM+oZ4xbct7QGvOz1oHPJkiDl/hD+U5Lwo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(966005)(6486002)(478600001)(66899015)(186003)(33716001)(41300700001)(85182001)(316002)(6916009)(54906003)(38100700002)(82960400001)(6506007)(6666004)(53546011)(26005)(9686003)(6512007)(4326008)(86362001)(8676002)(66946007)(66476007)(66556008)(5660300002)(8936002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1g5dFhBRk0rZyt1Q1pvYnQ0Sm02elBUOUt2TmVFREdqM3k4aHZtbitxejlO?=
 =?utf-8?B?WUhUMVFNcENSOW53bEZMMHBRZnpXSlc3RWhra3FFbGFEQnZUSUNUMU00Vmll?=
 =?utf-8?B?MC9MMk5TaWM5eXFCbmNLaTE5Wnd1RUVXRU1SU1I4ZFZWQzI1V0hJaDNZa1pn?=
 =?utf-8?B?M2FyOHozK0xCVmEvcVQ4eWs4bmorZEhjZCtSVml2Zy8yRzFCVk5nZWo5N29i?=
 =?utf-8?B?QXM4MlU0RWFCV0luMGlTYUV0LzRYUkp6a3lXY29TOHhvRXdsUFI0WXc5V011?=
 =?utf-8?B?TllUNG56dUpTSENCbzhjcVlMU3p5YmhFR1p0N1Byd2JGK1g2NGpyS0lBc2t6?=
 =?utf-8?B?NVlQMnJQbzVEanpFK1pBbVhEL0lHZ3pPbGNSblBaL2lmU0lqNjNOcTVpeUFo?=
 =?utf-8?B?UGhxUUc4bWtGSnpKNEZBNTRkM0xScERZdnRIanl4ejUvYVZQKzFxemcwTU1O?=
 =?utf-8?B?eDIrN0Z1VENBTWRoQk55Qk5HbjNoVXE0ODVkU0NGRmRGalpEZlRaK3RYUDh3?=
 =?utf-8?B?SG9SZ3VwMUY2OUpMcFhITk90MUlFc1RCYnFOR2tRdzJMaGF1NGxOam5yV0Vn?=
 =?utf-8?B?SGo3a01Zc1hqR1JYSm9OSTA4QThvbllnVk80Y2JDSlJRU2lpZmNCYXdlMlJS?=
 =?utf-8?B?bDc0eGFsNXB4K1VyWERJYW9uVUFock9xMWxrN1RNWndyRllwU29iSWhJdTZ4?=
 =?utf-8?B?UjlHOCtWNnRFZDc2WFlzQlFUTEV0dnQ1S3pVUTZLUWJNRnZDZ2FxWWs5bzla?=
 =?utf-8?B?ZzhrK3BGT0FEVklWampLTGRCd3M4THRuLy80cC82WjlHL1Z5MDJ4cVhYclBy?=
 =?utf-8?B?ajBKV0pvRUVVbStJWjdVakJ0bEdKdks4SFVmYWpVL3RIaGh5Vzg1YUQ2NElD?=
 =?utf-8?B?QXBYN0J1c1JycEhCTlhQa3hkOGpZN1lRUzVFaDNBc1N1dTlHcmgzMFZTblJG?=
 =?utf-8?B?aVVqTFg0RndlNjNHNDBpelhFTXZLUjY1b2srZXVYMHlha2MvRk1mM0F1M3Jx?=
 =?utf-8?B?K1pKbmQ1Yy9aZlZqeVNHRmdwQ1B6Qmttb0wzTTRiTHFhZU5KZm5TRUtmSlQx?=
 =?utf-8?B?OXFjK3ErS01xNDBHSC8wUGlrZllnYm1iNTRTR1FGY2FEQ1Z5Z0VYQjZyK1dQ?=
 =?utf-8?B?dzQ1YVFJQ0tmUTd3eXBZMjdVQ2dRWjJhS21CNGZRV2N1Sk5xVlQ2M1hjbjNx?=
 =?utf-8?B?T3RXWWtiak9OOUp3Rnp1VS9QQzdqZ1pJNTRjVHJGa1B3WWdFclZjYWJ5aXR2?=
 =?utf-8?B?SGFzUktkRFU4MXVTQjhrR09YK3lhTXlFR05BOFlJc1MrSVVydWpUS2xVN1RK?=
 =?utf-8?B?YzNML3ZmQ0lmd0k2cm5nTlovdDJaN3FpNXRVb29QK1N3eTY1MkdiZk9kazhs?=
 =?utf-8?B?dlVPOG5PaHJkRm9Na25FU2k4NHBlRDFnTnhKaUczeXRmV2hnaks3SzRmQlRm?=
 =?utf-8?B?MFVXY3BiOWdqMGdhNUFMTmtnckdYQUk5RHRBbzlFbEtTb3loMzYyRmpCcDBU?=
 =?utf-8?B?WWl2a1NjUXBHVDRqRHUwaGpLTEdOeFRxcWVmZnZoa25YUi93aDVsOHBrMG5G?=
 =?utf-8?B?S2ozSm9aOUVOYmYyNDVnem5LOVlSanhwTUxPU3N4cVpZNmhYR2tJeFREQXg1?=
 =?utf-8?B?V0NmM04yYmxGeUo2UHV0alRCT0w2Z2kxUDRoZXppWmJDT053aGZ6MFVnSTRD?=
 =?utf-8?B?djl0REUrUzNhYnZhQ3U5TEhtV3ZHOE9JNm15OGRkYWZjS0hXWDl2QUVOMTI2?=
 =?utf-8?B?YzlML2U2VUMxbFF3Z2U2bjVYOEwyV3NEcmlQdS9vNG1XZTg0RE4rZzFEWC8v?=
 =?utf-8?B?TXEybm5nMklSZ2lHV3ZJTXIzREVsN1pmbUxvNmg5cGhLdG52cjJZTTFhQWl0?=
 =?utf-8?B?cHNtNmE4NnJjaS9NLzVJWlJ4QUtXN1BWTU9tc0Q4cnJFdUwyb3lvL2RPeEdP?=
 =?utf-8?B?SElFMk5xSlNMZFhWd283YWlVcXVKM2xkbUdUWGF4ZXg1TU5JSStwV2x3S1VL?=
 =?utf-8?B?N0pVMUk5V1FVTnhQN3NpYTZiRi9KcHlxcGxXTmVQN1ZiUTByd1UxYWM1RDho?=
 =?utf-8?B?c3ZZWHhUZ0xMRjU3YXluaDZhVWVqdlNEYjNsUWlhekI1NXdsNWl2bmVQcXo4?=
 =?utf-8?Q?Ao4Gg2hdef8q34qdXJBOGW9RZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/VN5zIOHsynKnYEEtkECtvRniHg6UmxFsEQI0nOihe+R8zid65LD/CN/W4n37YnHIowIJZ5dz7uQb/57nzhwP9rSqQnWHVBx4tbn+trHepWBxdGcjK6VYBCuNaQreb0b6eXVZQr298GZYLKEOqCsuH8dtfKrZz+nqQsb2pSOWXMQVGXRCtSFYav4cUpnDFiLyjjNxnP1ssvSvRlHOoKBApQiwNre9k2tbm7B2JqzCt3+naCuVZeBJwGgkkkDHsZeiKkYBBEyuRi33K8SsS1nQtQityPdg2AOWKiaHhJ2/oTrHiAlvBPnABNQ+tVGxajWQXogBgnqYtx7ZzhhBy2Se0uVPBQPisC6q9mNlUvol2VzB9klDaLYIBZgepYnkwxTmhuL//CmgsCSmCUzD9shTZzWRJ6867KHgP8ZAILgMWzCj7q2xZSaidIctp7SpGzpPtbnmmNkM7Z2zbgMqR5ef1NZbJ3n91CCocUWMIIRGod9yIKW2tBCyR/fMMuPtRfZq5xdxT3vVbyn/kJoCKjHrB7EVs9xx3S0MOLtFsMyI/jRroarRos+qm16KNCk2/Vr6B58h2xRS4bM/3QgFGfcEg2+9SdrGbEMNFEPoJCKdOj24YISiaYO80WH7gT5h+Bo59lLVmhIIcT9PRWgWyq6IEhbmXReBgZhAQEYGam/jgu4x/c34jKnk/owg1KMAZOQoZxwv0pbq8s//fk2N9bJSqsynIQPpmEShdsT/peVIwLAuQr13U+kGnO8sdGBzM4YPN9HEoryTdowlJTPWUWdltLyRcLhZmJxieE3AIUZlebq7HzJ1DBZvxaDIHTIXE8VOBGqlKk5V+3k8DFVeplz1kAYamAA0yKnOv+B+3D9Q38=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e30596d-e6d0-4e23-b9ba-08dacec3811e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 09:00:31.0158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbXZxKgu2Dgnp34bY37t0REDrpLKUuGICbQsdUSotmIJ7vX2zh7kXcrDbivFajthoxjNxGFqpcjgApiKRuia0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6451

On Fri, Nov 25, 2022 at 09:43:59AM +0100, Jan Beulich wrote:
> On 24.11.2022 16:12, Roger Pau Monné wrote:
> > On Thu, Nov 24, 2022 at 12:16:13PM +0100, Jan Beulich wrote:
> >> On 24.11.2022 10:33, Roger Pau Monné wrote:
> >>> On Thu, Nov 24, 2022 at 10:11:05AM +0100, Jan Beulich wrote:
> >>>> On 24.11.2022 10:06, Roger Pau Monné wrote:
> >>>>> On Thu, Nov 24, 2022 at 09:42:40AM +0100, Roger Pau Monné wrote:
> >>>>>> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
> >>>>>>> - problematic wrt evtchn_upcall_pending, once set, preventing event
> >>>>>>>   injection later on.
> >>>>>>> As you may have inferred already, I'm inclined to suggest to drop the
> >>>>>>> the is_vcpu_online() check from hvm_set_callback_via().
> >>>>>>>
> >>>>>>> One related question here is whether vlapic_do_init() shouldn't have
> >>>>>>> the non-architectural side effect of clearing evtchn_upcall_pending.
> >>>>>>> While this again violates the principle of the hypervisor only ever
> >>>>>>> setting that bit, it would deal with the risk of no further event
> >>>>>>> injection once the flag is set, considering that vlapic_do_init()
> >>>>>>> clears IRR (and ISR).
> >>>>>>
> >>>>>> That would seem sensible to me, and was kind of what I was suggesting
> >>>>>> in:
> >>>>>>
> >>>>>> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/
> >>>>>
> >>>>> Another option would be for vcpu_mark_events_pending() to
> >>>>> unconditionally call hvm_assert_evtchn_irq() regardless of the state
> >>>>> of evtchn_upcall_pending.
> >>>>
> >>>> I think you said so before, and ...
> >>>>
> >>>>>  This will create some spurious events.
> >>>>
> >>>> ... I continue to be afraid of s/some/many/.
> >>>
> >>> Not _that_ many I think, as we can only queue one pending interrupt in
> >>> IRR.
> >>
> >> We need to be careful here - the kernel treating it as "edge" (like
> >> any other interrupt coming directly from the LAPIC), it ack-s it
> >> before calling the handler, i.e. before evtchn_upcall_pending would
> >> have a chance to be cleared. See Linux'es sysvec_xen_hvm_callback().
> > 
> > Hm, that's not how I handle it on FreeBSD, where the vector is acked
> > after calling the handler (evtchn_upcall_pending gets cleared before
> > the EOI).  Maybe there's some corner case I'm missing that requires
> > the EOI to be performed before clearing evtchn_upcall_pending?
> 
> I think for the purpose of the one vector doing the EOI late is okay,
> but aiui the goal of doing it early for edge triggered interrupts in
> general (and yet more generally as early as possible) is to unmask
> lower priority vectors as well.

My reasoning for doing it late was in order to avoid adding extra
latency to things like the timer handling, as the EOI will likely
trigger a vmexit.

> Of course that's useful only if IRQs
> as a whole are unmasked during (part of) the handling.

What do you mean with IRQs as a whole?  Are you referring to setting
the interrupt flag?

Thanks for the input, it's appreciated, and sorry for diverging the
conversation so much.

Roger.

