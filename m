Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B21D62D7EC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 11:24:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444909.700088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovc3h-0005dA-Hs; Thu, 17 Nov 2022 10:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444909.700088; Thu, 17 Nov 2022 10:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovc3h-0005bF-Ez; Thu, 17 Nov 2022 10:23:49 +0000
Received: by outflank-mailman (input) for mailman id 444909;
 Thu, 17 Nov 2022 10:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nIZC=3R=citrix.com=prvs=31383459a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ovc3g-0005aw-Hi
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 10:23:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea4f1cef-6661-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 11:23:46 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Nov 2022 05:23:40 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB4924.namprd03.prod.outlook.com (2603:10b6:5:1f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 10:23:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Thu, 17 Nov 2022
 10:23:39 +0000
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
X-Inumbo-ID: ea4f1cef-6661-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668680626;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/syP4OBlaE71vp3weC4d9I7lEi/MilJAmugblPo3HyI=;
  b=AkFwB9V0XYjZ0XmOpNZ/RBScr6LDby9mg3ZSOBdzLWe4HP5W1QR2XJO0
   shNYalbTSnIo77NHWCJKj7oA1CG9Fj81zy8sj9EsMSRAttmrJermCcBuc
   6921mfvrB58t5WiGl0lOL64cPVa/eFRVnbS5PBAQ+CHyNBK7AC0T7KKDp
   A=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 87555056
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vDhWJqBUAFE5kRVW/w7iw5YqxClBgxIJ4kV8jS/XYbTApGhwgTYAn
 2JMD2GFbvyCYGvzL9l1Oovi8E4Dv8DdydBmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/O8wAzxB+
 NwjLg8hRUmkpb2s2ZS4Vbw57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuuzS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVrS/x27eSw0sXXqotT4OG09RSg2fO11VUBDpRXAaAjuuQ3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQKHBYYyYBFFMB+4O6+N11iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:O2qQnam3Ia/S2j+MrFLyr2in10jpDfNMiWdD5ihNYBxZY6Wkfp
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
X-IronPort-AV: E=Sophos;i="5.96,171,1665460800"; 
   d="scan'208";a="87555056"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgQsa86kYP4+MldEeS5qwXpnX9xp9SqsRJNh2WZvNDM+X8iyBrMsz31z6F+qvw0XkI7eYAEF9Lsbx+H8apJ36T5OHtl/JPci5hBkPkgT11YUJCURBYBsu5PCVK511LlLdermnfne0sERHPgNfXprsI3DB1XtjXyx5kwUbOzM8H6tQIn2XZxmx5UfzVpf2mxnD6Vq75JoV51riW2lnwlNXRUA2WN2m7KQJrZYxjwa1zgPHFdX7VQOQPVM4dZ5lYcmLKXXgQ0DkJKytferQs15/en43kCTXihEYwN2j4hsFuGuSTxyUSlA89+0/Me+8Alg/rxQS+7teraI4edsJuHmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+CUtBcibqspFiL78oEpMfHbMCUtnnB6OiY+vXqjO74=;
 b=mxDkyorFUT5ZNdYZulugGgKrEJMs0JOevLgGL2eL0IZYJNd++PTbt8+E/zm6OjGlX09SQgvHJvx+6liVhlswSBIzPpT5HMHc6+eRq6OzXbHot+1A2z7/yWw4FzpHcHDVPZKPLcZDjZmmTm98MKZLCPKeGU0Z2rf6yPS05yI6kruEOuHo8QREZWiD0byMGBPVLeqh5vF6d1ilkmbANwzFB5x7ClWyP6zxi4UvsOJqNw+85/wViPoxNXuirauyPpnbLZiht/8gsYpVzyfMBVdZnh6BXSS/q4O2pXtQMnri4nRASjtiJOcwOE57iifVn34u9D57Qi1R5s+7Q9x5/CvDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+CUtBcibqspFiL78oEpMfHbMCUtnnB6OiY+vXqjO74=;
 b=tDtzmRb+Mz2sR63WRCJm8TNlXp/FeAu14TFHapopXBgarL9Zi4UgyahIFHBdKht/pqNaudVd//34MywhUfvt+M9aTwTmaqlduvx2ncXpLdfU/GkTtrPILA4wHcaJWOJNceMyZidY+ijuYRPUM+xO/GbgGlBOlTVBuRgCrb2hTv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 17 Nov 2022 11:23:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures
 to dom0
Message-ID: <Y3YLpFuYlVoifDuz@Air-de-Roger>
References: <20221116164216.7220-1-roger.pau@citrix.com>
 <9b559146-11d8-f848-d6fa-baed7e0fa06f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b559146-11d8-f848-d6fa-baed7e0fa06f@suse.com>
X-ClientProxiedBy: LO4P123CA0282.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d07453-69d5-4a47-9142-08dac885cae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0uQW1Zz2ZOJfcR9rcgKu+FxqHfzczU/MDXBJ7FiFPm8UH+9zmmrOJhJZ1OAcquLDN6wlfW9XsEDTCbQZwnaJGTcXIGIFy+8gnaq16B1X97Uarx5TzGUSUXw0xuSAGQxwt02osJydd5PPU3T6Z+05tGeHwxpMA95uy9+ofz83HFrCa1z1g27U/hBfoAVZ+6ZRkdPrny2dwgtuimvCo+t5VNW0Q8TczEuBidiXj/yu2gwY64tn7tKUIPtbGbmocTm+Zg08/bfalHxiqvOwko4GA9nS3gFeeuxTlAcQCRY+P5/VO7Cya7S4Sq+Uykp1zKn8nGa69VdtycC0ibdGXJ7190NOPUkdOjEdWifwgL+HWJVBzZ9pM8reppOQMRj9hKJ4wz4Ml86X7VriKrFq0b0BOVfu63oAkViUtTNqgZ9byTt9bRSjilLzfKF9o+oV15zU8scqXi7fnHttEULHcggM9c6bbdZm5dHeVGKBExrAG0jwSrc4Rb+C54wiz7pIjLnAHQUr6mpi9+3J1Ab1ENaK0VGKu7vnPeEFautGFsjugpmrNbSogGkKpi/PV0Namf4xrO2l5l/HDs4Y7AD1RFH9UOEJQQ23eWa/CopwioHXJlWEPnGzDeHUXRXU/co6F6qE3lYdmnsYFllsx+r9bUQ9tA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(82960400001)(2906002)(66476007)(8676002)(4326008)(38100700002)(5660300002)(8936002)(83380400001)(86362001)(66946007)(316002)(6916009)(186003)(54906003)(478600001)(85182001)(6486002)(33716001)(66556008)(41300700001)(9686003)(26005)(6666004)(6506007)(6512007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3JqQVRqNUVaajhxam9LV3V2Q3F2dUpmd2ZqZEpwRWZxMldFemJQenNGeUQ5?=
 =?utf-8?B?YVlQZStaVlVHeXVRVkJJb0FHT3lIdGVlYU1TMldQQ3Vxb294SUc5K2xLQ2lw?=
 =?utf-8?B?eE9ycHhoVnRGc2IrWWE3ZDQxQU5zeUpNbmRGR1V6cE5GU2ZQRHdJd0lPMnAy?=
 =?utf-8?B?NG1tcXR4enBDS2w5NWZnbGgvTzNUZnJRaFFYcXFtTEViT1UwS0pzUkVXNW13?=
 =?utf-8?B?RUFjeVptdG1xU0N0bHl1djlNWXJpMjVtdFFESE5JQ0hWb3dKanNrc3VBRk82?=
 =?utf-8?B?NGQ0QzdwN1pPVzlSZzJLQTQwendtQmVCa0ZvbFdDTzVlVTN6SlpKVndWUmwx?=
 =?utf-8?B?azc4dHArMkJzZWJreU9lM0EydHdjWHpxa2ZCSW1XS1RxNUtJTFlIcU1iditM?=
 =?utf-8?B?RXN2UExtNmw4eEdzUGd6M2RMUlF2MHlycDV0M3RSdmw3UVZMWmZ2UFd4THJp?=
 =?utf-8?B?WXV0U1dJZmVKcE1CZFpwM0N5NGZSMy9BWnRPK0ZsTDBkYitHcGFyQ3EvU0lF?=
 =?utf-8?B?eUhQRGR2SUpJVmZHNHMwR01yYlRWZm94UmF1a0xSbVcxR1V4ZnpTV213U001?=
 =?utf-8?B?SzJ1NHVMREVldVplUVFHdmg4blBUZzhNSFpvV1pOUWt3Z2s5cTVuZWFQTVdq?=
 =?utf-8?B?bSt5L3ZycFVxWU93V1VVU2taL3VZZTZWQXpPY2dQdFplanhEcmc0L0ZIcDRX?=
 =?utf-8?B?Y1BuQlBkSXRja21sbGZLODNnbWN6Umx1WW9jdk0wTnJjcjJjTm5TL2Z4VjBs?=
 =?utf-8?B?U2NuT0VPMUZUbmVHSjlIZlY3aXJvZkxKNjQ2cGZoOHJQa0VIRHpaN09aMUVN?=
 =?utf-8?B?TVpFTEFVamhqTnh6R3BMOFNGZWNBd0M4cllYWllJZW02RGJuejAyWjFGVTEz?=
 =?utf-8?B?anZpNmhRVlZqUWJhTGFxY2t6MVhsZ3o3VWhWSzBmWEUwMndESnMxZ2pPUXE1?=
 =?utf-8?B?cjBaTWFoTEpFUGdkMXU1UnIxTklpNmRNTkNtMEptTlY3OXJBZmFrQ2pnSVJ5?=
 =?utf-8?B?VDM2UnlUMGdweGFpYXZpL2t0YlNrOUozVWNYNmFSSTFQQmMwYjdMR28ycVpI?=
 =?utf-8?B?VGs1anNmYUFsYjFhL3VlaDI4SjI5dXViWjBMdTdnbVBia0xUL21zNUZYRS9O?=
 =?utf-8?B?b1dTVzZ5WVg2eWJSbUtOWS9ZU1d3L1FDTmNsTGorUGthS3crUGVBZmNzSkoz?=
 =?utf-8?B?TFRwYnpEc3BWLytMNStzQ2pSVmJoaEtad3B0UTJPMVpReHpQN0l1NEhTZS8v?=
 =?utf-8?B?c1d0aTlkNFErUGxYak1FcXhWbGJNYWtvOUtWLzVHK0dqR3ZVZU4vYWNBR3dq?=
 =?utf-8?B?Y01yQ1JRY0hIRjY5VW9vbkdjVE9uSVlPL2pFWWVRMGtRZTdvZjFQaE1kMXc0?=
 =?utf-8?B?TnVpZnFyRFhZYzJhTmNINUhIV3o5b1J0WDRYRWxIUVpzNGlHVWFxdXFhSUpL?=
 =?utf-8?B?eWQ1WS9mRzV1NllYVHgvcS9lY1Z0YmRYbDNDOUZINE1jMHFGOHUvRnJwUjlN?=
 =?utf-8?B?R3UyUHRjRjFkNUUrTXNkSHh3N1ZUcHVHSmtxa1BGSmdpRXJkU2VlanN1NWlq?=
 =?utf-8?B?eWVnSHNlRFFpOGQ3Qy9GY1pBM0g5d2szWklFbVNpL2pwQUg3UllhdkwzWEpH?=
 =?utf-8?B?MG1tYlRnSnFEWGtCNVJ0eWF0R3lyU0VPb3ZPMEZ4bHY3bUs5RS9JUlpCbEV3?=
 =?utf-8?B?VjRTaVhNRnFXbVh2TkxOREZaMUREY05Ya0UvY05YeUJ2czUyQUorN3RCSmxH?=
 =?utf-8?B?SEoramt5dVVibVhKVmE1dUdDemVKYlErZGlqSWdpWG90ckxldnEwVktSSW5P?=
 =?utf-8?B?MFN3K2VMazBTOFdubGwydE9OVmxST3VYTnB6MHBrdkNSalVRYVZwUzAwaUNz?=
 =?utf-8?B?b1ZETXA5RTEyeU1lMlpxd3ZWeWxlMVBOMTcrUkhJWkxxTTZqZVkwWEppYXhx?=
 =?utf-8?B?c1AzTlFvYmIwSHFOSHNYYSs4T2M4eDAxb0gvTC8ySVAwTHdhaW5KTXJMcVRi?=
 =?utf-8?B?WkxPNnhwd3dpV2JORW1HMTdEbFFCRDY1R2xQOCtpN09FUklnR0U2akJKTk1Z?=
 =?utf-8?B?b2JES2FvRHhCR0grQUtjZ0tMUXNKNFgwSUhuUjdTV1FGWnVHaktFcVBVekZi?=
 =?utf-8?Q?ZbQUDhNu7G2nTZNnNWCL0aLEd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2SJNE7WstJMEfbnZzgL0OTdniwSJ9RqibntxZilgez0q/PrNHUTdMCaWcIuAsY2sRUPsan0MNaDrS1J6+hbyN16rNzmWesdGQvpRXHJwtuv09v6AJhTtAMJ56/mNWYmStaHGmJl34dKMwe/i2vq83LSpXrj1htPSNTFHE5CUSbVxTjYFuDDI15bfIl/cKEDcNVFxoalCSgzrgeacz6PniSgNPyG8ocmohkc/VcTTUa1P79kC1oB8prYNKfQ2UrCZOk1X1Kc9Sv9uGaLqgYSVhWKJeWWhbll8MMXQVBZ8PSNidjjdH3Ys1sIWW4sjjhk3WEywtw1u/qNuhYDO6eeFYEB/nyt6xE3iVplSO9Leb4E5EetnIYKRfKaL3lj26eUW6dCYBF7c37r1VPgmIU1NB2skJGPYQ9MvHAIzycwrVvp0gx8IlXgRJL1kVb65qnsHzniZP2Ngf6w4jgfa7rKCDIIOPRBJw1okk1XBANMeQEaDedk084783mVMLXMm5aGAuTscHJeCnLmIPQtKpnRHGBw+jNSS9/JoBR2+JuQKqxO7XkhFFU7jTiN2IR7qjPt3rSttj16cpEEn0lsjrxVm6zPZVbAYsa6pq3e2Y/vOxStrHUUO0Pqm/SZLmCsYevtt1ta2FSbn5jJmDSSwTjYvU8B261o3leIhTk+nQZM7NjSv85u/EnpHyCRpIOVTrRsey2Bs/qouO+jIk58+4IraXlMOvcGXcYqce90oaPXmHNH3gnmGhrCEMOVPln8pyRS6NVYi55DAN+kbe3oxU3K8kjlro7eHabP3JkCSff5AOnM4CLtMHVXbtNVS74xQDhZt1lY3URBFP5Z8nr0MdyF4NA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d07453-69d5-4a47-9142-08dac885cae1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:23:38.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TudR5/+n6FN4JtQcVBjAS3p/YmWEgyjCETj3U+zUda/g3S2ypZQ5OAiIcceAEboK9lCd8475jQsqYIj9BaTRLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4924

On Thu, Nov 17, 2022 at 10:27:41AM +0100, Jan Beulich wrote:
> On 16.11.2022 17:42, Roger Pau Monne wrote:
> > Currently Xen will passthrough any Local APIC NMI Structure found in
> > the native ACPI MADT table to a PVH dom0.  This is wrong because PVH
> > doesn't have access to the physical local APIC, and instead gets an
> > emulated local APIC by Xen, that doesn't have the LINT0 or LINT1
> > pins wired to anything.  Furthermore the ACPI Processor UIDs used in
> > the APIC NMI Structures are likely to not match the ones generated by
> > Xen for the Local x2APIC Structures, creating confusion to dom0.
> 
> Plus we should have passed through Local x2APIC NMI Structures then as
> well.

Sadly this is not possible for PVH dom0, Linux will use the ACPI
Processor UID as vCPU ID in hypercalls, so if the UIDs don't start at
0 and are sequential Linux will panic during boot because vCPU
operations will fail.

> > Fix this by removing the logic to passthrough the Local APIC NMI
> > Structure for PVH dom0.
> > 
> > Fixes: 1d74282c45 ('x86: setup PVHv2 Dom0 ACPI tables')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit with the implied ack in there provisional upon Andrew accepting
> your response to his reply.

Thanks, Roger.

