Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902436A1BFE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 13:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501024.772591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWzM-0000IZ-E3; Fri, 24 Feb 2023 12:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501024.772591; Fri, 24 Feb 2023 12:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWzM-0000FW-AM; Fri, 24 Feb 2023 12:15:48 +0000
Received: by outflank-mailman (input) for mailman id 501024;
 Fri, 24 Feb 2023 12:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVWzK-0000FQ-5r
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 12:15:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f39cecf0-b43c-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 13:15:42 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 07:15:35 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6170.namprd03.prod.outlook.com (2603:10b6:408:11f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 12:15:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 12:15:33 +0000
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
X-Inumbo-ID: f39cecf0-b43c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677240942;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QGNR8zoSD8SzLVJBMh89pR6xXz9DOYFM+df5Y1cUTVU=;
  b=ClGkQma/QCnzsZmEONQUzy2ouDrul0WtxzKgIs9+Q7J2XLWTHakzY6Il
   q3rke4PF4KTCKCbY4N9/YnKBk7nB+u5Jx8Z5qAOI7poDA9zsOWlsB4Ujr
   NtMA7GVBXvPh5YQI0bIxenH+l7/pp40Xp7G4eAGZ6dcRo22+A0gqjOEeW
   U=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 97230917
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lNSzI6g07dgkfcGysgSrgihxX161QhEKZh0ujC45NGQN5FlHY01je
 htvXm7VPP2OMWKjfY10PoXk8EIHu8fWndBgGVBsqns3Rnwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gWCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQEFHciPxmEgd7r+5GGE/YrieF5durkadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReLiraY72QL7Kmo7ISczCBjj/N6FiWX9YfVCE
 x0e/CUhlP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OlXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:IhJlF6muiCffZDh7ZA7wv1rCmALpDfIX3DAbv31ZSRFFG/Fw9v
 re5cjzsCWetN9/YhAdcLy7VpVoOEmwyXct2+Us1NSZLW/bURWTXeJfBOLZqlWOJ8SZzJ856U
 5OSdkbNDSaNzhHZKjBkWuF+whK+rO6GLrCv5a480tQ
X-IronPort-AV: E=Sophos;i="5.97,324,1669093200"; 
   d="scan'208";a="97230917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hE1JrfethE1OtGyi2KOBU38qVUFHsTzZAuUy8G5MEAttsLJf0N+e7vfmUbHlQ/q9jrL4vbIcMqgqseuCYqvmtcCN0xKEWVPZVgkkWrvu3PWiwDK0cxDOJSGIIZsseAqacMna8A/U6XunNuAX6gY2WNAAyUrMiVpnTP3C6XF51GIoPUqr+mcVuwYtKL+HesH8md6z0okQGkHC71GK7Z7t/zHIKHKY2Cn/TvC5UKMNdQZCR3Xu3d15OVBcn0YWTOkaX1F9hGKGYq+fQf7ZxQJCc6wbbTbAbzK2MJPQnNncMX/VeAGrVpzqQVKg1nz0+ZkJ8wT/paJmFEBGiTjM4mdfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4U8NCPg4+c5YLYKjwqjmKVf47QAqrWwrWpmb9THUcTc=;
 b=LGsObn6Dh/aJzmI/hNrwDhvjBexZG3R8Kwadotjv81muShNsOxTeElvwCsTfZNUp1sQQ+mC2NQn5An5Br4IZAjx4k7AG91FiFqoRuw2gaGD2WQ3ebY8p/roHIeSJXjBD7vA+8QDXUxKY3X1pNtEvQks3w+msQ8Z0/t5Ou5SlujW0siaLVGXCHtd/hlc4LSH5f1EssWtsbpBnD2cfEs1CdEuayQp7TZmd/RR3KqxT0A+HDrsWMWVhMAjKBpxQUj3dGqtDR5rtEV/fdS0FCsJ10XFSCIir2eSsXrXeDJWHbL1Ta9z9dKhzNH8uldWsJHoAGxj8qup37HVFJQ87TofWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U8NCPg4+c5YLYKjwqjmKVf47QAqrWwrWpmb9THUcTc=;
 b=mcYJiUf6qjMW7K83RZSC4+fW5lXobOz7icnbAIGE3MZSuIAY7KEPkaoR2qkIKk5oL/Wpr+13N8ynYp93PLUe3RwO/pXkPubTdz/7DDP4whlGSoX4EOP0bXPNsirX3sofdFXlbO2xpTxYcCMEfm2up0T1UC8a7VsxjApkx27fmYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <46415d75-f6c3-f56f-f02c-cf2822735e8e@citrix.com>
Date: Fri, 24 Feb 2023 12:15:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: Work around Clang-IAS macro \@ expansion bug
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223203659.2594851-1-andrew.cooper3@citrix.com>
 <25dde064-0b6f-0871-d7bf-9cc99c104bfb@suse.com>
In-Reply-To: <25dde064-0b6f-0871-d7bf-9cc99c104bfb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0291.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4598afac-f511-402a-0ffe-08db1660d3aa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O7OQhKc0ANKupbqqWdnKxkJzT4XHivJEkUU3ICR7pnpcNHuBvwrgvNX7f5zm92iuJErS1OnYLPhjpH8SBvSAXju5xM/NP6xPzDK+TKLeiT9Dt30guM9mo+1L6ItwTHqWHEorPiU4+A0mETPx8llN2XAcjkvAXs3YbbAbMoNKLVjnPd468SZ+/aY4jh65ZI5e60Gjj1l6Z7AKwMmq8sCNmCDzno/5nE34YJ++nDn3b6FbhG/vXWPAwLvdjDH4MZqoUYCxTLTVxwvla0o0XxigKY7eBZvkYfzEhjkbHzG3O+tAQAdzdMwJB8sd9aRyNXw9i/BxO5EK6+QHevF432n8942u3vUBGLHCPJJqAQojeuoKbhQPE3ShrHZMpTzv/iXekHED/1C6j5pZyVwlNuqNAhhAeV5620ccuCL6lHJjtbihr/SfrEmG2llqGMp1w1gKIsmfIlhQptiJKHidHahoPRcFXt0Xe8hQxyg0zl3aX1uZMEzR/zSkSb2EsNIHPYeavl8GWt3hs+OrpQ3QiIL3hiPo3dZeHaV3x/BN8+YsLGfd/3bZIahRIFrco1/NpCVax9djqz9JmvSZEoyMjwCTMRMWJ2vNiWxW5HU6Llql5IZWAPkR9oGCuYVY6dOlGjHt1RB7wMuUFR0WjIe1KnjX4xnkYilHkj/Wg+eaPZ3/5EPlHtl3y3QHSGnhNUhMILqbaLGaREERxgpOxwvgxYL3FlkqvqmJCFgbAkEaotNEF1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199018)(186003)(26005)(5660300002)(41300700001)(31686004)(8936002)(8676002)(4326008)(6916009)(66946007)(66556008)(66476007)(31696002)(86362001)(6506007)(6486002)(2906002)(6512007)(966005)(53546011)(316002)(82960400001)(2616005)(478600001)(38100700002)(54906003)(36756003)(6666004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0F5Z1BqK1gxMkpzaWdTT2hKT3FrbGNJZnFubjc4MjdvMjJjN0ZRMVRFQWI0?=
 =?utf-8?B?VmhsRzg4R1NKYzRzS2M2aDhhcjhaZ01aLzZsOXVnTjF5dU1pZ05sck5NaG04?=
 =?utf-8?B?ZVFzK0hyZXEyTTBmNnpkYVlkZmorNFdleWNiQ2lzTVdMbjVCZ1NvK2RxbSsx?=
 =?utf-8?B?WGxFQWtBU3pzYWZFK2VoVmEwK2xGay9BNVFyckE0UjdNWnhiRXN1eTZlSC84?=
 =?utf-8?B?bGpqQlJwZ1ZVK3hRUTdHczBhTjIzTGhSRlZNcTdNcW5IS01waVMwdGpPSGc0?=
 =?utf-8?B?eUd5dGxKSHFBZGYrM0NxR2lxS2Z4Z0tidnZKT2RST0RycTRWK2JMRFVGSzR2?=
 =?utf-8?B?c2lUSWtxMmNoK2VmVjV5YlNtRzg3NzJXaFFLKzQrVjJTNGczZUtUby91VXVS?=
 =?utf-8?B?ZUVVQ2dnZVpWaTVUaVhHSU9iMnRGY2NRZjZ2Y1EwU3ZIOU9oakY1dGpnbWpw?=
 =?utf-8?B?bVJrN1JJR3VqVVJIbTNMcmY5NVBaZTgvNlBudS9ndWpLOXJXQ3V6L0tMTDI2?=
 =?utf-8?B?NDVBbnN4SjliR1JqZVRyalV6eGJTY0dkY1crd29uUHpNaG1QUWNCTTFJSTl2?=
 =?utf-8?B?enk4K3o3UnlQOHEvRklLVFpnNTZWVXpNUFZuTUlzcEVOaTA0K0RidUt2U0ky?=
 =?utf-8?B?MW5hcHRMMlZBNlV4RVU2bi9NTWJZbTBvc3paZ3FjSU0yNGNqZ1VwSlRjdHpB?=
 =?utf-8?B?d29XMlBydm1keitDQkJialNJOHJRdkR4MFhreElELzFuMnd3bWQ3S3gxdUJx?=
 =?utf-8?B?aWN5Y0ZUV0ZwTWtVdHpRM3VtR0ZJeU0ySmZadEdyTEppQ29PTmdYYTVTM09v?=
 =?utf-8?B?Wk5lamlvZlEyWFZrMUdUS2ZGWEpZbTZydVIrc0dwVXRqVUJqWFFNc0kwcU1i?=
 =?utf-8?B?ZWM3dXZ3czFtVVZDazhUSzB0aWhRbzlUZ09BSjBhQnlUNGN3SWltMndteUxU?=
 =?utf-8?B?SnlFblIwdCtpU2FPcHZZdjlSdnovTHNEZyt6ekpuMUpzZjh0cXBzMXN6YlNh?=
 =?utf-8?B?ZDIyaWlheDdIL2ZENllkMjF6VGVDM0NycGdGUmZoamlXbHhwcnZFaVZjZ0dW?=
 =?utf-8?B?c29ydFVFSCtrUEx3V3BvdjVvYURpdk1IVnZ4eGR0T21vRG9BbHNUZmRoQjdu?=
 =?utf-8?B?ZlNjUzdIeEd0czJWeHdndi9zSzFyUGRsMmZMdkhzU1dkOC8xVTJhMHZxS1l6?=
 =?utf-8?B?dGFzS0dYQXpySWIxV2ZZQXdOUllZYlNjVm9BRjBIdUhCNlJJNk8yZWgraXN4?=
 =?utf-8?B?U3JMbFVHNkZablY0SllzZ3M5Qm1ocWlXY0kxYVZRN0NnaERUaWs0NmRzeUNJ?=
 =?utf-8?B?WTAyZ2l5bnc0N28wZFUwWVZXNU5udEdObjJNYzVGelQ2RTVPZ2JOSnBKZ3Q1?=
 =?utf-8?B?TTJseHMxVDRQOHV5ME83L05NQjgzU1I2QTRzeWQ3VHJKMUlwVENWa2QzQWlm?=
 =?utf-8?B?cGNpdWFqMzZ1TXJkWC80UTRybU5rVUJyTHRFczR3Q29UaTRWVkczVDNBTW5E?=
 =?utf-8?B?a1MxNTZhS2NPV3FDSmIwMzF3ampBMW1YVlFuTFZjZDFvZmtmekl4Q2ZqbG9q?=
 =?utf-8?B?ZVI2Y1N0cXNsb0NZU0o4UGc5akZTOHZDOGFiQjlXSEVFV0RKK0JheDRROFJX?=
 =?utf-8?B?NGNyUm9oYVpXMlE5aEdEa3FFR0lhVW5ubVVxMVh1WjF5bzhVZVRiL3BTZ3F1?=
 =?utf-8?B?UUtuTEg4S2pxa0dpQVJ5SlZYSUl4b1JwUlJiN0RxQTI5Sm9ScVpRRHl4WEVD?=
 =?utf-8?B?UlNNNm9XTzFJYU5NelFWR1FFRmZMT0svZEc0djNLNXlpMk9xRS9wS3BiV3hG?=
 =?utf-8?B?aUhqT28zWFZLUHE1OGVGSURZd0RWSktOaVRxQkVLdXovOS8rM0MrWVJSTkEr?=
 =?utf-8?B?WXBRT2kvRVE4MzNNYi9KdzhqUjB4SVdYZUFQTFhwK05lMk5YWXZLb3piUklM?=
 =?utf-8?B?blhlUjZXSnpWd1h3YXpKb2hTbnhpdlZac1NFYmp6MlRZQTlQY1c2M2xsZ09k?=
 =?utf-8?B?aEtlRVl3UCt6MFV1aUVFa1RudzZ5bVVCdmNCckZoOWNyQWgyM0FBYUtZakl3?=
 =?utf-8?B?dlRLY3ZvS1RhWE5IR2NuUTl1LzV0bncyMmdCZUdiWUgySFM1d1NlbjhHNXJM?=
 =?utf-8?B?YjVxd2U2UWpQN3hYSzIzdlZpbjcveDMrTEtXN1N1bmIrSS8xR1FTYy9ORVpI?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PrWC2qiHJMfq2+oP2h9dSrIAKn1aQ529vT9KCixH7puildVhZCSoLbHxYiAXMxBuoZIKUAR85olCB5I6ePLJJhnmO5vWWnAe+LFeH+83nfIJkYu/3A5Xm3zxZXEYLCl3+v/CafuSKxQSap4LJqkwxTlvmK3Dn0/D5QLNHeCSFU0Diunnp1ThS6QEnobHgS1v22/THr08LsvIWQdxsQcfZOgQDsdbrJO9OJszt4PhU0r/eZoc8K0I8cMrJ2j/8aAEwz1SqgE4s+l4qsJ9mgFsPtDvda4JLwMTPhBhqnRpFjiGMYOQFFW0bMBBxT4CEue27yf9MUsJTrM3e7WI1U2G+xt2K47Gip449BIlS45qAmjg72udr5fl4uP0/aYu3q84X0UBs2iGI6dDwybGgmqcP2S2voHUuIJmTW/C6IJ5ZZF6SISS2/PUPEHg27/BHYoGj0ILSdcPTFF9GmexhBjDl9FEetruTqpbQKth4C/l8Xq+axQ+hVuYgrjPn7KlIHUKQTtQe6DOumwMRv3s12gYfzP5tWt1PfmuArRbAzuf9aVDo8h8x5Oj/4HeOactUaFFoOjcL4ZEwtGXKSp16u3b9KJyK1gXd2TFcKQXuI9iPdzfQRprA8p696GHfziJ2siKj+vGi4BIktgR5ppaF5pLot6kM/L1LHmu2DEZOLN5qS0VOAMDk9TjvtB5U75fj2yJJRVMm1BdHLvL2A/vRrHgUvF1sXQqnUmNZzkKt7wE9e6jXoFOJkBbJn4b10Kw/s3TQQoLcqRCGpw/0jhqTHKKqLQUiOVnFuK+VSP3yDqnCmeIMMt+TwLoky38q8jpcmbsrqMEYxGt7nx2TZXlA7i60g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4598afac-f511-402a-0ffe-08db1660d3aa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 12:15:32.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWsuzsc+Rc3358mLcyYK7jA3w9i6kAraX16aWCeYxJlM/U8m1wHfU94iMy2OrL0hVWbxKievat8DlXtX6ng+6ghaUL2YShV3t/16RD7ri2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6170

On 24/02/2023 7:14 am, Jan Beulich wrote:
> On 23.02.2023 21:36, Andrew Cooper wrote:
>> https://github.com/llvm/llvm-project/issues/60792
>>
>> It turns out that Clang-IAS does not expand \@ uniquely in a translaition
>> unit, and the XSA-426 change tickles this bug:
>>
>>   <instantiation>:4:1: error: invalid symbol redefinition
>>   .L1_fill_rsb_loop:
>>   ^
>>   make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1
>>
>> Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mix %= in
>> too, which Clang does seem to expand properly.
>>
>> Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> A little hesitantly
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>> @@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
>>      wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
>>  
>>      /* (ab)use alternative_input() to specify clobbers. */
>> -    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
>> +    alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
> Especially with there possibly appearing more cases where we need to
> add such, wrapping the extra parameter in a C macro continues to
> seem better to me, for having a minimal level of documentation (I
> has CLANG in the suggested name for exactly this purpose) right at
> the place of use. The way you have it you force readers to go look
> up the assembler macro and read through the commentary there in order
> to find any explanation for the oddity.

I'm not massively happy with the patch in this form, but it is less bad
than splitting the name out.

We do not separate out parameters elsewhere.  Doing so adds cognitive
complexity to following the C, because now instead of having 2 places to
look at to figure out what's going on, you have 3.

Even a name like CLANG_EXTRA_UNIQUE is only meaningful to you and me. 
Everyone else has to go and find the two other places to understand
what's going on.

Finally, and most importantly, despite having moved to a 2-char macro
parameter name, there's still not a meaningful identifier here in C
that's shorter.

I do understand the want to try and make this more obvious, but adding
cognitive complexity and code volume isn't a good way of improving things.

~Andrew

