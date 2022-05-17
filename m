Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB652A571
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331014.554452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqybr-0004wM-OG; Tue, 17 May 2022 14:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331014.554452; Tue, 17 May 2022 14:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqybr-0004tE-Kx; Tue, 17 May 2022 14:55:39 +0000
Received: by outflank-mailman (input) for mailman id 331014;
 Tue, 17 May 2022 14:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqybq-0004t8-Px
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:55:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6848e191-d5f1-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 16:55:37 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 10:55:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO2PR03MB2182.namprd03.prod.outlook.com (2603:10b6:102:12::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Tue, 17 May
 2022 14:55:24 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 14:55:24 +0000
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
X-Inumbo-ID: 6848e191-d5f1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652799337;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9KL4ADFVASUeC+gatxZ4Mg/BqVyU+h/20m9SPG+GFMM=;
  b=I4zKKfeGS8Ltve8r9K8HikaIUQfs7xjuKtFt6v0IyOSBBt1/QP/wNSsE
   sJCqwsjUeqdqPylObXQj9RNRkTiw+Xt3rTQbRADQ+STICNwIQUG8bJrJn
   9S3uBc+g457Gyae03hq6IvNoMcdGe6iHH7Z4Y8fXQUkLCb+h+BuXhqIA8
   k=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 71901776
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gqHx3ayvSPFzAp/E9H96t+f1xyrEfRIJ4+MujC+fZmUNrF6WrkVWy
 WYcCGyOOPnbNGT3eYx1YYm0/UgHvcSBzIUwQQE9pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12IfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6LCIay54BIz1x6cEDToEOTNPGPF89+qSSZS/mZT7I0zuVVLJmq8rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtadHeOWvLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriamImUB9w3LzUYxy0LLwy9xzofJC/3EVc2kXcoMhB2Gt
 n2TqgwVBTlfbrRz0wGt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDTMT5XhC+iG6JuFgbQdU4O/Yh9AiHx67Q4gCYLmsJVDhMbJohrsBebSMu/
 k+EmZXuHzMHmL+ITzSb/7SdrzK3MAAUK3MPYWkPSg5ty9ruvoA1yA7OR9BLEaipg9mzEjb1q
 w1mtwA7jrQXyMsUjaOy+Amdhyr2/sSQCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnzu55p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:Le6mW6hIVi5JRdaJTfB/YfKSNnBQX1N13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJvhSQRI+Lpv+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lwdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNMN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 D52+pT5fVzp/QtHNNA7dc6MLWK41P2MGLx2UKpUCLa/fI8SjvwQ6Ce2sRG2MiaPLo18bAVpL
 PtFHtliE9aQTOaNSTJ5uwHzizw
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71901776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3IJsTn6nHapuws2uqXuqRv1ZU/8CcdUKuKRjorfRBNSZm7Ci8LoReL1rdVmDQWIR4OMPrY3vYvgTRWyU0SStVhXdFkGVaPnrbFBmDvz0LPjzJleGTluX1E1Vnnlf4ArK6X2UF5Bs3H5zkWHnml3RkyanqMc791d3Y0nnUrujvr0T/vJRWhNlpaagtXdR+pkZ0l/cUOXqNxYBKEUh2VaWKrUiKDawHc+dRYkdiz1l/hEj337iBPm4HTgCr6Zo3s9WZsHXi34UlswQWoe1uOumoizrPRXZQhup/bYd1vMdFHER/cLZryh4RFnsUf0oZzwNz1vm5xdj6F7pT6rIN80Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDZnyFFx/un2sZYeX0Dlyxo3VWrtVg/a60ehaCFG/gA=;
 b=R1YJi5+euPmm+uRIY+fS9qYYPoDFTvey8g4TeUvHQcVxWrxxRQgrfigTLfkaFiIiTUd0aieyMEFQRXWSEoC2KquETWYxcemoIKeSEoxfiZ+VfDjX6QPNzgXXIPVwmQsxPWmQlFK+OGpCU5Y73ZDwZsgw94jluxxaIjyP54phSpB2Dq/RM0CzQpN/3N7bWox77Uv9RSec3W0nzW5k3dojnJFw/6cDTeF+beuMsa0F9wpC3HONYZ8jgcMZHryl4qS6/HBC0tnLg+5In21l/0THQGHEF+OMT8lHduX8q10WzsJxW6F4Jf4N0pVY3b3CX9o2F537HwvdvjkIdWVJTijeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDZnyFFx/un2sZYeX0Dlyxo3VWrtVg/a60ehaCFG/gA=;
 b=JJsKybOHH2pchMmFXYV+84mTRc8YzXdS+gxxIK1WkvmY+UqL/SwutpyUUTps3vC+csbHZ3v9B8VlGox3HLd/d4aI+i2KJXYZJjHQqnCsNrSg1dneA1Lz7ZJZyOwRFT+dhqYQLNHQH+uuju+I9+BNXLXzRxQajkxml37HqeavPdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 May 2022 16:55:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Message-ID: <YoO3WNxxyRYzgyaY@Air-de-Roger>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220517132130.38185-3-roger.pau@citrix.com>
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 764e6f67-7f13-4e95-9b5e-08da3815458d
X-MS-TrafficTypeDiagnostic: CO2PR03MB2182:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<CO2PR03MB21826EDF59417CEB16661A788FCE9@CO2PR03MB2182.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sYASMFv9gf/uNwv70E1ebbICG2S2AgAeST8TIjZUHWbokeGuzjvPuhpe7IzewafuqmrzSXCRmKnL6DHZKRCg2hj/9UCsQmx8T1GnoHAcssbPo6n+HAVHSHGdzahi7GDb5OG+O7o1KC8u4z2Q8e5HdQ8NSanIsvQgqKGOMQCM3ZYirJkqoJUSjJlpLxaV/HU2yg7R8fD5DtP1j1fmzB4tfz82jdvfGjSvDDvqNrY2Ebp3plD4+IQzUG6DUrowQl8ns4jwoICchRPkJqf21r7/jo5COBxE/IfyQjMt4bvD4zisB8Mbmw0YP6oO45puwzx6pL45PEVv5CuxcODxJCjRJH54WPkgILT33mRZC3ovcppSUoS74R/gll+RxJYU9cgbuEUit35TsmqArDkAxQYmzfU1OrFbQ5jYgCcPAr16XhZSE3EkwZPaCuPG0w0NNJ0H1fPa4ijsIbLrcH3jF1q3aM4wpIWS5mjrdLJphH3FxbjU6Aqd9l5m4j1tESPj2DXUGTJLK9bkL9r8ZIBDRUENKfERi+MQkPtIfxQQImfRBI5zo3oIkg7ByiafzOSo9qVWHMp/FruCm6G9cZd1gE4YL8FnY4hwDxm5ZpT8hqhNuRMGqCMVwzEiuyr+iiSQDUd8SiwMRL4IuezxNuxwIXGMPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(66556008)(66946007)(8676002)(66476007)(85182001)(6512007)(6506007)(33716001)(26005)(82960400001)(54906003)(6916009)(2906002)(316002)(9686003)(6486002)(186003)(8936002)(83380400001)(5660300002)(38100700002)(6666004)(86362001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1FQbjdOUGhFRGM5VEk1NFQ5aVRPQmV6NkwvYVBVNXdKazJJRmNRZ1ZjbDlo?=
 =?utf-8?B?QU1HNHF0Z2tPNXBZS0Y3V0JvSVprbjk4WWxZeXJkTVJtUGdTNmNZcTg1UUQ4?=
 =?utf-8?B?TmdWTnIwcms0K3ZMazhhWWNrN25TYWNFaUlHVklvcU15a2UwNGNHdFdINkpy?=
 =?utf-8?B?UEl2R0JOdjVzbnlsalVJSDNFU0JoWXhUK1kzd3hoWXM2M29XM0Q0Z09xMzdz?=
 =?utf-8?B?TzRJd1NhN21WRkQ1UFNEWDZLVlR4L2FjZncxNkJJMld6b3dMcTd3cmI1a1Fy?=
 =?utf-8?B?ZVVnWityY0F3bHM4dWsyNlZhd2haMjRjdUFYNXBhdXI1ZjVhS0l0dm4wSUt6?=
 =?utf-8?B?b0VOSDRXUk1JUDgrR0w4aTBMSHU1MUNZM0YxV0E4dDREcXNrM1NRN0Z0bDdL?=
 =?utf-8?B?MHJCU000M25iV2E1ay85RU9HODBTek4wSWNLb2kreVc2Zlo5VDJ5YXdFdnpw?=
 =?utf-8?B?ZzkwalRVNVV0ZXdMYlR4VThSR1ZlcFdMeXFSbG5wZTN0allRTDZSc0VhMy9K?=
 =?utf-8?B?THdtMUs1Mk9sTEZkWWtyWTNhclBlNEVLa0Nua1NNYk5kV1pSVzRMcld3eWV3?=
 =?utf-8?B?WjIwUTJ4MG5VelVZUXMvKzRjK0d0USswRksxcS9FUldFZmcvR1d2SHc2V21I?=
 =?utf-8?B?TnpuamNmeHhoN3UwL2ZqclVRbkJGTVZDdWVvRFc0Q0xwNGVSd09Fa3YwUU1n?=
 =?utf-8?B?L3MxUUhER2tlN3I3cGt2WHBrcXlxMWdYVWlGZ0MvMnZnb2hjc2JMZDR0R2l5?=
 =?utf-8?B?WkFxOWRaYytxVnZZZ2o0b1hPUXRDSmJveGowK2VFYWNjc2xXSGxKQkdkeGk3?=
 =?utf-8?B?ais5eUNHbXdVazBuYUdKRThkMjBqNjRLTm9iZTBhcTFDMGZhMGlZcEc1czJQ?=
 =?utf-8?B?UHlKVTlXck43QjFJV3AzcnozMDR4OVhRWFUrVzMxM01SbXpTNGlTaTQ0SG9W?=
 =?utf-8?B?RUh5c2ZuQU5qUWRWdzlBaDJ0czZDK2MrOWRhdml3NVh0dkw3dnZPWmhtN0F4?=
 =?utf-8?B?RWRQeVI5RzlEVEZNTXNMeFQvbVgrSmdIRlgxWWcyZWdRM2syVDFYWGEvakJ3?=
 =?utf-8?B?UXZWWGgwZWkrOWFPWG9SOGZCQno4RGlDNTE3TzI2eTNKZWx4bGxkU1RBUHFa?=
 =?utf-8?B?aVFqcU9EN1pmeFpFNjFDUkhLNE4wMnU3dkVneW5qbmZId0ZNR29FbW85aFlW?=
 =?utf-8?B?d1JVcHVKRzAyNjFUTkViWDlIWXdGenNKV0FsbkY3QjJCeURqRS8yNlVwM0R6?=
 =?utf-8?B?bzR2SDBWWW5samJwS2Y4TTZLcHc3M0QxeHZxa1dIWG5lTnM3UVd0S3lSSEx1?=
 =?utf-8?B?OE9sai9YNExXTzNBT3Y2VHFRcjMvcHRxOHlLMWp3aU9LNjA3OWUyUUpYcDEy?=
 =?utf-8?B?S1ZpS1NTVTdibTYxSDRFRVUybVdlZlVZQU5xYjkreVROZGJSeXo4VWRGaVFC?=
 =?utf-8?B?VVV3TGtrd1lLL1JYbjVVK1c5S0ZvMHZDNkFOUFNMS0lTSFUyK2NJdDVSZm1T?=
 =?utf-8?B?aDlXanJtTVdrbVgrNEZxdHRrZHZ0ektVdW9ocnJtZFQ3TEpONlBOeW9iMEFo?=
 =?utf-8?B?Z1UyWE4vbkFvd0t4bVJtODZGTGF0aFcxNnJyOTNQcnVidnc1dXpSK2h1Ty9H?=
 =?utf-8?B?M0xSYm05cEUwWnZralh4dmxaLzRNNDRsU0VvYlRRc3NPL2tsQzBTRHdHeEFK?=
 =?utf-8?B?MmlkalBYd1pNbmc4dWVUYVFhcVRjYXZNcW5YaFRDQWNJM0ZIQXJxZ3g1WUg2?=
 =?utf-8?B?TWlNd2ViNHFBdzJ4cUludWtsVURyenJHaTdaUDBvS0k3Wnh2MlBGTU9KamxV?=
 =?utf-8?B?eTV0T2ppa0NqOEU0NGozc2I5bVZFQjIzcWJ1OVcwNlNwbjVpRDRxa1pRbFVQ?=
 =?utf-8?B?aVpLUDhKTi9ielppcmltaVE3eU02d29TbW54WXZaVW9sN3dLUzQ3Q3lkbFJM?=
 =?utf-8?B?M0V4SHJlNGpOYUZXNDBucEF3dWF6WUdTRU1BRXlVL1hQRnA2dUlWRlg4YWFs?=
 =?utf-8?B?M3MyajZqZ2xZUUlZN1lGU2dId1pTaWJWOFQzRk0wMTJraGVFdFZsdFp1OE9m?=
 =?utf-8?B?K3VGRlZ6ZmRZSGs4SWY4MXNpcWZHNTZrMTRKQnJrWDFnMlc3Q1FkcHRpdjFv?=
 =?utf-8?B?c1NSWGtwSDUyWWVIL3VTVHZCS2c0NWtxSjMrSG51TzhoeS9jakpnSmJGVXcw?=
 =?utf-8?B?a0w5Y3ZsUjhKQW9rK0V6QmpvOStTNjlYbWtXcUtXQmJoeUFUNmRGYXlBNmpN?=
 =?utf-8?B?R3VaZW1lWlp0TzBiYlJhVGxGZzlBOVdMdVltNXEwTGkzTk96aUVSajNqUTR5?=
 =?utf-8?B?aDRZR3lVQkNnTys4QnQ1d1VoQ0lSeHNMSmd6TkltRkNJQnZLZU5OWFFlZ0RW?=
 =?utf-8?Q?/TvlPcyC7vosxKD8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764e6f67-7f13-4e95-9b5e-08da3815458d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:55:24.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l39f5XMRNbt0FEIorBdEWtLx2Ph8NhjGTiYDHz9Tj0xJhTcRTeY+Jna8+1Fj08axpAOZBvaqlHKDgc63LdcrjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2182

On Tue, May 17, 2022 at 03:21:30PM +0200, Roger Pau Monne wrote:
> Under certain conditions guests can get the CPU stuck in an infinite
> loop without the possibility of an interrupt window to occur.  This
> was the case with the scenarios described in XSA-156.
> 
> Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
> if no interrupt window occurs for a specified amount of time.  Note
> that using the Notify VM Exit avoids having to trap #AC and #DB
> exceptions, as Xen is guaranteed to get a VM Exit even if the guest
> puts the CPU in a loop without an interrupt window, as such disable
> the intercepts if the feature is available and enabled.
> 
> Setting the notify VM exit window to 0 is safe because there's a
> threshold added by the hardware in order to have a sane window value.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> This change enables the notify VM exit by default, KVM however doesn't
> seem to enable it by default, and there's the following note in the
> commit message:
> 
> "- There's a possibility, however small, that a notify VM exit happens
>    with VM_CONTEXT_INVALID set in exit qualification. In this case, the
>    vcpu can no longer run. To avoid killing a well-behaved guest, set
>    notify window as -1 to disable this feature by default."
> 
> It's not obviously clear to me whether the comment was meant to be:
> "There's a possibility, however small, that a notify VM exit _wrongly_
> happens with VM_CONTEXT_INVALID".
> 
> It's also not clear whether such wrong hardware behavior only affects
> a specific set of hardware, in a way that we could avoid enabling
> notify VM exit there.
> 
> There's a discussion in one of the Linux patches that 128K might be
> the safer value in order to prevent false positives, but I have no
> formal confirmation about this.  Maybe our Intel maintainers can
> provide some more feedback on a suitable notify VM exit window
> value.
> 
> I've tested with 0 (the proposed default in the patch) and I don't
> seem to be able to trigger notify VM exits under normal guest
> operation.  Note that even in that case the guest won't be destroyed
> unless the context is corrupt.
> ---
>  docs/misc/xen-command-line.pandoc       | 11 +++++++++++
>  xen/arch/x86/hvm/vmx/vmcs.c             | 20 +++++++++++++++++++-
>  xen/arch/x86/hvm/vmx/vmx.c              | 24 ++++++++++++++++++++++++
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++++
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  6 ++++++
>  xen/arch/x86/include/asm/perfc_defn.h   |  3 ++-
>  6 files changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 1dc7e1ca07..ccf8bf5806 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2544,6 +2544,17 @@ guest will notify Xen that it has failed to acquire a spinlock.
>  <major>, <minor> and <build> must be integers. The values will be
>  encoded in guest CPUID 0x40000002 if viridian enlightenments are enabled.
>  
> +### vm-notify-window (Intel)
> +> `= <integer>`
> +
> +> Default: `0`
> +
> +Specify the value of the VM Notify window used to detect locked VMs. Set to -1
> +to disable the feature.  Value is in units of crystal clock cycles.

The following chunk is missing in order for -1 to disable the feature:

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 5685a5523e..817e644d09 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1110,6 +1110,10 @@ static int construct_vmcs(struct vcpu *v)
           SECONDARY_EXEC_ENABLE_VM_FUNCTIONS |
           SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS);

+    if ( vm_notify_window < 0 )
+        v->arch.hvm.vmx.secondary_exec_control &=
+            ~SECONDARY_EXEC_NOTIFY_VM_EXITING;
+
     if ( paging_mode_hap(d) )
     {
         v->arch.hvm.vmx.exec_control &= ~(CPU_BASED_INVLPG_EXITING |

Thanks, Roger.

