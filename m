Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB677047AF
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 10:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535059.832656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypzG-0002Pv-Su; Tue, 16 May 2023 08:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535059.832656; Tue, 16 May 2023 08:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypzG-0002NZ-Q7; Tue, 16 May 2023 08:24:50 +0000
Received: by outflank-mailman (input) for mailman id 535059;
 Tue, 16 May 2023 08:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S66/=BF=citrix.com=prvs=49309c509=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pypzF-0002NT-OI
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 08:24:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d06b56b-f3c3-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 10:24:46 +0200 (CEST)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 04:24:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6251.namprd03.prod.outlook.com (2603:10b6:510:ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 08:24:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 08:24:37 +0000
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
X-Inumbo-ID: 1d06b56b-f3c3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684225486;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Uav4PC2AlaEXB/8JoN+QkQTEaiv3MLghgQuNeCqbpu4=;
  b=HCjPgE3scM1aWQLo8aubN94Qg9mGlr7W9y8cIWfT+RxrXw+ygAC9VTEX
   QtpyYK/+x04I9KV/8i4tKmyfZaw54U+o0O0NieK8a7X/LdjWCjRUo7z65
   rUyJXUCAirw4PvDfRLiS2BkxXvNO4G3hrsDgS8xPPl7k3j8Fr0z6Dlhch
   o=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 107938355
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FRmvUKDmPqefGhVW/8niw5YqxClBgxIJ4kV8jS/XYbTApDorgWFTm
 zEbUGzTM/vbZzDyLtlwO4y39EoOvpHXxtdhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5B4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwyttGM1NP7
 O0iCQsRdkisgM2r77arY7w57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvTm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqi393b+UwH6TtIQ6H+Ki9Ox7jnSp/C8fFxckCASqrtOFoxvrMz5YA
 wlOksY0loAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmPwKfJ5weSBkAfUyVMLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQc0QA0E6p/ZqY4yhx7GTdF+OKewgpv+HjSY6
 yuWoSY3gbJVltIC3ai/+VHBghqlo5SPRQkwjjg7RUqg5wJ9IYu6PYqh7ACH6e4addjICF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:cFOo96EnSr17wCcOpLqE0MeALOsnbusQ8zAXPiFKKCC9F/by/f
 xG885rtiMc5Ax9ZJhCo7690cu7LU80nKQdibX4V9+ZLW/bUQCTQ72Kg7GD/9XtcxeOlNK02M
 9bAs9D4NeZNykesS70iDPId+od/A==
X-Talos-CUID: 9a23:Si/+fWDr8JukmMf6ExlaxXwmG9k0SFzm0G+IDEiXFEltWJTAHA==
X-Talos-MUID: 9a23:Pw/TZQqiZhToGRU/KaUezzo9LsV68qqHMnpOnYoMiZTbJCNaBx7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="107938355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyP3KYCF432RbpWwbY1uDy2y6J1ncjztWDfqNGd+nOLGUxyL+RR5zkuSzwZg0sDwbaA5XYdrStnBdeUoAOXmjVwGyUU2R/MbzkMVIoL2fDwzKXpwWN7YO2Whp1cnWzl7Dk15YHBUKeMh9TrXM8p1pXA3HPjx/IEF/QWiNTzAbHFgs1YOh83Or503vjCDanXhUzXUurCp/8M7Vce8Ae+EgvjtHvMdYEfW0HJxrrlFUGtHO3/vZaycGPMb7q06q5ras1zf3hIT1tDhRtFsWRiSSc0gUTgP03mfnAXNbRCU8DmJpjpH3NBZflVhwYFmk0vgPrAYiFVCnzqwrhKSMdmLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic5iJQGmBYjd8X6FP0vDdhSJLVLkXGKHvRSkUXcg8gU=;
 b=k7cbJg9bPXg4aTBqIga+JBfDLgXJpJw5GlrEQZ2SXl3quYZQPJ6fTrPVW4KELESO8tKpUoYyZXyJd2HKPnXo0ARM8Lr5uVar5UsRh1Z4rJOfo7g3lYQiDAtSdvk/UCWgvxhKEwLpNDD6DA6G4Ing0g1P5EhuJkbWqUAgPkakid3n7s++KD3emkwKVawqo0AQ8iugMA37DWc6XmMzvwlT5vAmqqHlZ++Ee5g2kJWA52Cl+EHplT07oeR7BbaoobVX4MHPYsr9qgYjpe7pOJZuBAW+AqP1ej7O3mmSkMVN9cljqsnplIwyw8phddMXam9lorUa8IZE6NefB5+jcpZ8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ic5iJQGmBYjd8X6FP0vDdhSJLVLkXGKHvRSkUXcg8gU=;
 b=F2o6aFwoafXWfYN8QzXYUW56R80n8BOSOfW9e+Pws6p5HoSVfWwCLw8dGJt9qf2Rm+EofcNfCmHc9onmvUrL3t7mtW+hED+Rlj3jiU7ENl5GU5KL0roZrbW3UIQRPI9Vz0hct9y6Hle3IDXJ6kjPgD3i5Q+S91eCu39bHXJxAZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 16 May 2023 10:24:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Message-ID: <ZGM9vzwGm7Jv6i7M@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
 <ZGHx9Mk3UGPdli1h@Air-de-Roger>
 <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
 <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
 <ZGM6X19p50oSqbNB@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGM6X19p50oSqbNB@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0278.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c3e553-e827-4e5d-36ee-08db55e6fc5c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qAzH8LZUfxgS0n3Ta8aVMW+F1Su5b5kZZXFagdi2Y3na02yA7tk6Cpdpib8nnkZAIapfDr7btJtU1ytGCQcpUeSg368GhZkQy1spxiu4fU2m3zW3Z1yH4L1Esbc0PXZiOgfcJVL02cF5s1xlpUVD7gC3Kj/fvshYIasM9FT3ZywnbUjroXqa1mfAZHY1wchQT8lnHKK5zjEEI8v1EbvcSI/FaEizBI4c8BFoc+/HUHANAN2tTk9PP0RVn/kdyc0tsgWRdtyZqXtQ3U1xOnYs8lQPR4fbgeY2H2zn4oaqEjaCQyrvmH8gpzN4HtXI22MSQIUzFnV/ZGA2GBZzHi9wSg0BAC3jffO4tkUbB95Qq6W/vjSJUT3hvoUmiUQYLb8Fx+PYLfQngGy8W9bYXCabk1m433DWI8Srj0vz4/nVr+tqe7JcfT/nvhxWCmeXPGD2tPOptW5sW6NYb2cTJ4KIdHVrHcevhQABnUjoj03Cd3AbxEDIMIJZNfLSwpv0AFS6xJdBV9GtFxsGb1swVBavUNcpeqXhDP3wCNsu1RA8Eze+BPXkwQi86k7UMCYDYp3g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199021)(82960400001)(38100700002)(6506007)(186003)(26005)(9686003)(53546011)(83380400001)(2906002)(5660300002)(6512007)(8676002)(8936002)(41300700001)(85182001)(478600001)(54906003)(6486002)(6666004)(66556008)(66946007)(66476007)(316002)(4326008)(6916009)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmRhaURvbDlTY0pwOS80bmM3SWNrZ1Z0Y05kc09aeFQ1ZW00aFVhSWg3TDJi?=
 =?utf-8?B?Vk9NV0pVUXh2ZHFQN2RRSUJicEhwYjdsUGx4WlJhOEV1ZTZBREt3N2RxT3Mz?=
 =?utf-8?B?bFM0NGlpM2pKOE02RXBMTHBQWGQrVGE4a1FPSDVJSjRlZnBoTU9FUHlScXNl?=
 =?utf-8?B?V3crVmsySVZwWTBOMEdtNXYydE5YMWl4U1lua3VGbmhjTGY1Z0gvSGpFVEdj?=
 =?utf-8?B?bDZ0QmQ0bFIrdDQyS2pCWjN5VDJBZE9yRzBVeW9LaWkvUHZZKzhubk5nK1lQ?=
 =?utf-8?B?Tk5SRnR6NHd4N3E4WGZiVmhCZjJEaE5paTU0TVArS2JZZDVVcXFsVkFlVGc4?=
 =?utf-8?B?K2ZOdHk1SlJpUFpMOGVwQmQ3SnBLNFZKcWxRbnJXaVJlQk1UU25nZWdOVzli?=
 =?utf-8?B?Zkw4RWs0UWkzUFRseDVRZVNkZmdWc3EzNHhWeTM3Sk80TVIrYklWRjNNSGdL?=
 =?utf-8?B?dmFpVi9xcWpnVTZ4UmVoMmR4REMzWnVsQ0ZYWWJWbDZBZHNYdUJqSklRT3ln?=
 =?utf-8?B?OC9aNXFzejBHTVQ2cnA4OS8rdkdoamlMbUlweVQ1bkVtZHh3Mk5xVTF4SXVF?=
 =?utf-8?B?SFZNeDlPTzZhclZyS25qc1JTeS9jcWorakxrVmFSZlM5Z20xRUtpSFF4Um5s?=
 =?utf-8?B?QTBTei9FZmlVQktGWmRUYXRLM3E4K09QOVpDSlhlVFZ4ZWZFTFBRTWlxdENw?=
 =?utf-8?B?QVI0RVRFUjd0cGw2dEVxNFVIRHNvemt1SUJwQ24yYmFwV0JndFNoR0R0Z0lT?=
 =?utf-8?B?ZW50RGJoam9nOHJzcjRPc0lKWkErSWY1cWcvbTYyYVhvL21EM092dWJqZ0Zp?=
 =?utf-8?B?WXhPeXhHNWZ6WEN1Y0RyWHRLT1FXL2IybTE4ZER1NnZFWTcwNHljSHlmT3Ro?=
 =?utf-8?B?MXhNUkUrYjZIVkF1UnR1WEJxQ2M5ODNxeGlwanRqWmpDWkV1WkRabHZhWFMv?=
 =?utf-8?B?VjV0N2VpeWEzY25FVkV4TktaK3RudFZFM25ZNEN3VzZvVUUwOVA4TFF1Vllz?=
 =?utf-8?B?bmw0d2lzc0tGU252NjJIeWJXQWxQOVRtUEhCa1RrL2s5dXBleG05MDEyRnda?=
 =?utf-8?B?RjlYSk9sRFRKN01nSGVVa0F5K3ZJYTNJSGF1bzZGYy8wdmlySUlud08zK2dH?=
 =?utf-8?B?Q3hjRzhXTlRZMFhCaktCNG5rZi9aZ0VTdThNM1dON09Ya3A0bGlFWWJCOWJP?=
 =?utf-8?B?Q0VEMEtNaVJWbWY1M1F5RVZpZE5ORHE0V3pKbU4xQlhtTjErakV3TmU5R2Nx?=
 =?utf-8?B?U2pkYkplNXVqd2pVeUxhNGFZSDRDWk91dVh4ZEV1bEJUY0YwQW9MMzh3eGly?=
 =?utf-8?B?ZUNBTXZoUm1UQUlHMCs5WWZVaUt0N09Udk0zQnVwVmpEL3lSSzd1aHAyRzhl?=
 =?utf-8?B?a1U0WGlISVh2QmZHM2JUeUk3UmJBZWRtTWptdlJzQmd5VVJJS1VVTVMwazJT?=
 =?utf-8?B?ZlFENmp5M0xPY24rdHVYbVB1ZTByc0pHc0NQT1VwTFlzVlo0TjdDMjJ3dklm?=
 =?utf-8?B?ZGlSMWtaaFNTYTNyeXdFUHlBcmN4MFNLSHh1MFZLcXR4QU1WVC9hVXQxZWRa?=
 =?utf-8?B?VDlaaXNwL0NYWllMaytua0orb1FRRVowS1RDUzVmNENqOFB5NnlMckdocFZm?=
 =?utf-8?B?V0p0NlRSRkgrT2RMYlU0Q0QzWXBwMkErZTFQa3ZPRitEaTNNRGtFWWE4SEJO?=
 =?utf-8?B?S0djUFBuWWdodzJiVGhPSkpWS1VvWnNIU0gvTWV4a0w4ekFPemxtWlYxQmJw?=
 =?utf-8?B?UEdtR093Zlp6QklteS9KdE0xQ1dIYWx5Zy9DNUlLSENYNXlqUEtDeDJxcXFG?=
 =?utf-8?B?azFidkc2b0M1YWk3ZEdGNGpIYXlJYlFLVzRlc3VtTGRnQlZmZVViQWRvZXlz?=
 =?utf-8?B?WC9WaWgzL1J1d1Q3eC9PRTJjTHFFMlpQRHBUMVFCTXVqekZzWXJyV1B5Wllq?=
 =?utf-8?B?RkZmSE8vYnZIcEgzSmRrRklXTGJhb2s0Yy9NeS9iUElQM2lHUTVuUVJLTTA1?=
 =?utf-8?B?Ty8vbWxsWjhhdEkrL0dWSmVqS3VtZUxoSS9HQnFOdHlURk9aWXozbHduUVRQ?=
 =?utf-8?B?TDhXNmJNdnEyMU9nVXZEWnIzWkROWE1pU2tnYjdlOHJuM01HK1FLZkZPYkpz?=
 =?utf-8?Q?Ouv0FFAGwoe/UVgcqDPe6LWqG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ruHxbP/oO5sl4xHW9jMTkKY632Ixxa6uSO3mQho7hh+8lt46BZbR/TJgBRjHPIyVvX7T0vYrBAY+nKDzxZ+0LNWq9HG/3+O5ppcWpXaCw3G8VSN2qt067riRJiRZgrBI6WwrI4mfO5pByLB9wY/1v0AGEFaR+c7A1Cf2LPoC31EsFgEcjpmNWHn06LqgQIdPwGpcR33zdFiTX9OKYMJ1+5StJHLs/NN4RusC4vcJ/odM/9+cxuYAKV724P61vU9XrpQ5mFKrWye00HLnndHgEJzWFs2ciJV37Wha+xEyySGKdF3u6Jyez0eV7L7c0xb/RxUlxTpywS6E6JLzW3dgtDTVpD+CaOSoKCLT2ESaseFYJaC4CyqVxIfaHF6sF6xgd1hKXojZhiIE/MkulMopXWfzDoWJ3klCVsmlRe185X9oA4ja+ADnjYSg89aKFc8mPiet8/WCReaien2fIoR4EzsFNy4tApHboxPwtcwB81GfIp61XxT0ZBP1OtxDo0Djy001ELQaMH+id0zKuCCT5AaQjcmydjeVcmc+GnCxcYsJXMF7N0b3ZFXDRozEXI1yusOQsaGViZ9M++gMjNXvqVIyhhZi5nURFW88UXP82Oyb6bibO7DDNRbPN9AqPI3g+yPVS8XHj0BC1sjTwU9MR8Ne/sx0K2uVvHEuQpBH3kgJhJlGeG3yQLXh54iUocTbCmL3EX4/rjG+dhqytkrrnMhosJRu8VDJiUXstjt8c4imttQn09uPAOxYz5jtBOFDqahQmjhAt0vJuqcnF8T5DixqJA5ai5kH5Q9w8KkmiwcUW19Ro0jY4l77zSyAlX2Gi49Ol3DVXQJqZJv7olSj2A3GgH/VIZLPMumxCa9nz8Y=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c3e553-e827-4e5d-36ee-08db55e6fc5c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 08:24:37.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jt+d1ZDtOnXJEg8CSKkfEkBFcgw5Yi+KAgg3lwNz1l5s/UfE05ByNHda3sHE7hXiGbZkgl5blgP8sUAL/dtLWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6251

On Tue, May 16, 2023 at 10:10:07AM +0200, Roger Pau Monné wrote:
> On Mon, May 15, 2023 at 05:16:27PM -0700, Stefano Stabellini wrote:
> > On Mon, 15 May 2023, Jan Beulich wrote:
> > > On 15.05.2023 10:48, Roger Pau Monné wrote:
> > > > On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> > > >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > >>
> > > >> Xen always generates a XSDT table even if the firmware provided a RSDT
> > > >> table. Instead of copying the XSDT header from the firmware table (that
> > > >> might be missing), generate the XSDT header from a preset.
> > > >>
> > > >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > >> ---
> > > >>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
> > > >>  1 file changed, 9 insertions(+), 23 deletions(-)
> > > >>
> > > >> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > >> index 307edc6a8c..5fde769863 100644
> > > >> --- a/xen/arch/x86/hvm/dom0_build.c
> > > >> +++ b/xen/arch/x86/hvm/dom0_build.c
> > > >> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> > > >>                                        paddr_t *addr)
> > > >>  {
> > > >>      struct acpi_table_xsdt *xsdt;
> > > >> -    struct acpi_table_header *table;
> > > >> -    struct acpi_table_rsdp *rsdp;
> > > >>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
> > > >>      unsigned long size = sizeof(*xsdt);
> > > >>      unsigned int i, j, num_tables = 0;
> > > >> -    paddr_t xsdt_paddr;
> > > >>      int rc;
> > > >> +    struct acpi_table_header header = {
> > > >> +        .signature    = "XSDT",
> > > >> +        .length       = sizeof(struct acpi_table_header),
> > > >> +        .revision     = 0x1,
> > > >> +        .oem_id       = "Xen",
> > > >> +        .oem_table_id = "HVM",
> > > > 
> > > > I think this is wrong, as according to the spec the OEM Table ID must
> > > > match the OEM Table ID in the FADT.
> > > > 
> > > > We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> > > > possibly also the other OEM related fields.
> > > > 
> > > > Alternatively we might want to copy and use the RSDT on systems that
> > > > lack an XSDT, or even just copy the header from the RSDT into Xen's
> > > > crafted XSDT, since the format of the RSDP and the XSDT headers are
> > > > exactly the same (the difference is in the size of the description
> > > > headers that come after).
> > > 
> > > I guess I'd prefer that last variant.
> > 
> > I tried this approach (together with the second patch for necessity) and
> > it worked.
> > 
> > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > index fd2cbf68bc..11d6d1bc23 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >          goto out;
> >      }
> >      xsdt_paddr = rsdp->xsdt_physical_address;
> > +    if ( !xsdt_paddr )
> > +    {
> > +        xsdt_paddr = rsdp->rsdt_physical_address;
> > +    }
> >      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
> >      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
> >      if ( !table )
> 
> To be slightly more consistent, could you use:
> 
> /*
>  * Note the header is the same for both RSDT and XSDT, so it's fine to
>  * copy the native RSDT header to the Xen crafted XSDT if no native
>  * XSDT is available.
>  */
> if (rsdp->revision > 1 && rsdp->xsdt_physical_address)
>     sdt_paddr = rsdp->xsdt_physical_address;
> else
>     sdt_paddr = rsdp->rsdt_physical_address;
> 
> It was an oversight of mine to not check for the RSDP revision, as
> RSDP < 2 will never have an XSDT.  Also add:
> 
> Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')

Just realized this will require some more work so that the guest
(dom0) provided RSDP is at least revision 2.  You will need to adjust
the field and recalculate the checksum if needed.

Thanks, Roger.

