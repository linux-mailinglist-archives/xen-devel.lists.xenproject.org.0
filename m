Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9596A1B65
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500914.772461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWGo-0003AI-Aw; Fri, 24 Feb 2023 11:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500914.772461; Fri, 24 Feb 2023 11:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWGo-00038A-8J; Fri, 24 Feb 2023 11:29:46 +0000
Received: by outflank-mailman (input) for mailman id 500914;
 Fri, 24 Feb 2023 11:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVWGn-000384-5V
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:29:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86abedf7-b436-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 12:29:42 +0100 (CET)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 06:29:38 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6753.namprd03.prod.outlook.com (2603:10b6:510:120::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 11:29:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 11:29:36 +0000
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
X-Inumbo-ID: 86abedf7-b436-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677238182;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kgcxkP9caO8xC6csUiWVoP2Y5IYSOj2kLc+JSMltAfk=;
  b=BJseNQjelXohSMSe/UgEY/WQcMUd81oVm1sfBuMsQjxyqqDzM8i/cvq4
   tUZq1qpAchp0iIIG3oM9mxJ62JFm8Y7y14N42yaBUdox0kxp8g2mo6+Ns
   aC60gWWVb3g8WiXTtjZFw7Jo25UR1PgApEuqovD0NdGCHid2pA1+pQ/DJ
   g=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 98806997
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:N55IeKmbP5sXUZn96y+uTKro5gyjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUTzSOfmMMTSnf9AgPYWx90kBuMPXydUxSAZo+Xo0RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dAqBhY8d0jdvPOv3OufUMVpu8Q4NfC+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDRO3gqK873zV/wEQ6LxgdTQKdhsOcsRKuRI1vF
 hIf020x+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mqodjiBvKF4xnCPTs0IyzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:7EmMDKmAc4w3yGCdFCo+uWhHDUXpDfIH3DAbv31ZSRFFG/Fw9v
 re+cjzsCWf5Qr5N0tNpTntAsa9qArnhOdICOoqTNWftWvd2FdARbsKhbcKpQePJ8SUzJ8/6U
 4PSclD4erLfDxHZJbBizVQy+xQu+VvKprY49s2Ek0dKj2Ct5sQlzuR1DzraHFLeA==
X-IronPort-AV: E=Sophos;i="5.97,324,1669093200"; 
   d="scan'208";a="98806997"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6LvHK443hmK5Kl0Uisc8Jl6aSbk/4zsMUOYWzNgPCePhVQ6RxdoktFMpG/cUxBoB6hS9MftaJ8IVqGESK2s+1EnOZB5nhfXjGVHZ3td4sgSKD83kkW9x0Lu1KJXrtVfflJLUMQEsz9b3px+OSSc+5gxd3o9FLpr+I5Ix7kh/4VkX8nzvanYuoTjhuFoWAK8UIrSvEB1ZqfrgffjNLL6LuandJrWC4THwYSLQZGGwAqQ2VsTCJE64sCUGWxUAOJN/oNl8Wj4cZeRkQrrwTTYhJVFruo8H1msu4caVn7WKASzH0yiEbRZVoybdcXmwxrByTQ+dkuHyEtsAtpq6pdLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R39DJEougWpSxEFIPwBYJJ4S2mBajUEhWNIfe6fTpHc=;
 b=MrVmwkjs5sK+YkSe5kxAQaJKnr7I8y8AGn48TgHYNF56Y9DqFSP0jw/YZP5BQpD/dnTT8BIRAy6owribTsgDpTgRNDSs0UvlxwnlnBir+TbOb1X5vU3zYVBl3jy8YYR90qSifkKfG74ewYAjuzMfhvNlC5ZKpOuI2YxObvrdjSl8yZGW1wRxWbp/bXfHFaL6ozxOwLL6alDad6RHV0XJJXBOJ5wjcBGurYcK36Y/H+Hnt+ME3vblppwxoKqtQ8Ts1IFp0ymELFJ6Xf7oL+H8kUSd4qVfXIH0W45UX5/OQM65NhCS6qXoCC7skj1A9mp64JO6ILHV5z1sihnxNcGE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R39DJEougWpSxEFIPwBYJJ4S2mBajUEhWNIfe6fTpHc=;
 b=glBHDcPG8AKqbFc5i1xvorCpKdhT4iHDbPqPjeolATJ7JsmdxxLNJmDBw56poBvcDREpQHK4JHYleOdiUjVk8fpmm1lcpl6myer+NufYOrc+vH5KIQUpCWMV50SxK4NSliHqMmg50opVIrbqnvHQ3fIlXUwLEi9R2SAUKmez1eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <460a7e1f-dbc2-4948-3ee3-434832db4283@citrix.com>
Date: Fri, 24 Feb 2023 11:29:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Work around Clang -E vs -Wunicode bug
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223220358.2611252-1-andrew.cooper3@citrix.com>
 <f35274a1-1669-345c-2436-0eddcba558af@suse.com>
 <de4b7eab-7ae1-d444-6cfa-dc782277e355@citrix.com>
 <372e227d-a18b-fa76-d62a-4321493d8a24@suse.com>
In-Reply-To: <372e227d-a18b-fa76-d62a-4321493d8a24@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: a64ede3b-0320-4060-3745-08db165a686b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hADP/uphkm1mTGFJ9FFuUFPqde+NtJeQWbBMZIhB5F0vZQF8yF7yKBJgEDKrbOdj15M/mh0kV60RgN7VlKD2Mt4sZeOITw4KZ6yfhb+0/t5iVrnHVr0Tv9Nvp0LXCRE/WC+nO5RsgbS0lrtUvded0f/hRE4lRvy4ddl5OY/lm2NCbmnWGiip+VM4kCCvQRnqIv1blfYh4avoldnXU44O5NvxyJuNI4npxjXd+DejIsc0J7oTg+xxzLeEguJcs9+HQsRq/jDlzLzGDQRXy1dJieqMDpFwngKjMAsmaV4OuMUmsjHRQCI5nAlFIvtNO10Eg9AersClTph+T5gp85FkOsMoHMqrDRNfieKHvMyI5at1S/Gk02UzctC0PZY6W8ruCzbIHOMDsNv4ECRLTyrpuyMrf6oRiAe5eZOMalsm3twBrL+1B+DX26KXiRgNN62eoeTAtk61MGygvThsZ9r8VFUcdSFLMjCXac5gWnKk2uer/ts96veehxKhKLiQTWwvRY+7YGiCCHMx8sh13+YiREwaQnxkcpprpDYAVW9+IsMjToKBn5KtkuWWk44wcvqSOPTLnFPOf5kjxGCjEsOFOXg1PrIafHRYOO1KtKnTOS3JEa2JvFD5Oc2HgcXEA9aR+zhnmHGu4O8PsnNm49VKxLubvT+V9O/47RkaVnSKj6dZg2qGUIodtc1i+yAQRNkB8Ob+NgTLw7xSwdwlUC1/LKYPfWMv5czt3NGKpGa5uRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199018)(966005)(6486002)(31686004)(2906002)(41300700001)(36756003)(26005)(6666004)(186003)(6512007)(53546011)(6506007)(4326008)(31696002)(54906003)(86362001)(83380400001)(316002)(66946007)(5660300002)(66476007)(8676002)(66556008)(6916009)(38100700002)(478600001)(2616005)(82960400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVZXTmo1TndQVWM2SGkzWnp3cWZHZmpSbG9sa2hxeGxvQW5PZEhVUGM4OVNy?=
 =?utf-8?B?Y2NFTURvRkFKeXRkdGdxMUU4bGpHOFppZkhYa0xPek5HVDN5alpUcGk0OTZm?=
 =?utf-8?B?alJFbXRoVkZPUFR3b3IvVE11eXFCdWF6QkUxRUp0NXNjZktRYVlxZzhGTE5z?=
 =?utf-8?B?eWhNWS9zR2t1VUt3SytSM1RqcnBQTjhCYW1LbkRaN281MUhtem9XbGFKczdr?=
 =?utf-8?B?dWpoVU81dHVjWUZMWVFlUURhZ1dzcFROR2RmT2pRdGVLaWJVNStaTmtMTWFE?=
 =?utf-8?B?Z1B2a1VtaTVxZ2hhWGRyUmZhUGh4WjNRR2tJc1lxeG9PeHV4eWZuYTc5T2xl?=
 =?utf-8?B?N2pUMGhGalFTWllwcURIcUdlUm9yS1NPNGR4UzdHMDdtU2VrbDNEMHhENnE1?=
 =?utf-8?B?RnRHWmt4cnNGU2V2TEw1VndXWUJLOGtRTitieEZsVzhRazlZU2dNU0VOb0tu?=
 =?utf-8?B?WkxjQ2xoeDcwaGhzZi9HaTg3a0t2VVdkMW4vVVcxQTVLUWVSeldOb0szZGxi?=
 =?utf-8?B?N0dTVXZZN241a2pVQTB0YTNENjZEbFZwanJvbzB0aU9COHZLbXRuYU1lREZo?=
 =?utf-8?B?TUJrS0luMGRodVNtNGZpRGYvUFk2MmY2S1NpUVJMV0gzREEzT0xsM2tlc1gz?=
 =?utf-8?B?MEsyTlVZZkpFK2pmVVlIQWs0WDR3VGZaenNwdzdlQ1liQTBBN1F6dGluTjhQ?=
 =?utf-8?B?Mk4yWVBaM1NMbXVTRGZlcmUzblN0VU85YW5SVFFuTUVYaTFHY2d1cGR1NjR4?=
 =?utf-8?B?bnVweHZoTEkxbTN1L1V5aS94VCtYaVVHQU9IMGNOWTlJU0pxc05XaFpnZ3c4?=
 =?utf-8?B?UHFsM0JRdEtPWHpETVFucFJWSEVyUTNOdmg2TVpid3BSUVNzNUxIQjNOS09H?=
 =?utf-8?B?K29kdEh3T1BpdFNWSm5RUVQ2MVRHREhUQU9nTnkrRG9kL0U1K2x0ZkZqRE82?=
 =?utf-8?B?cXdFaEVxdjJzcEZiYkdXaEdWNnBFR0pEVmo5MUVsVDJNd2pTRVJWVEQzeWRn?=
 =?utf-8?B?VFZxbGdaZmJ4NXBwTlFNc0tWSy9QS2hkSWQ0bVJvcWM5QnVBczJQT3R5dW5h?=
 =?utf-8?B?Mmo2OERaSmZjUEdoeTR1TFFVRHhnNm04Lyt2TmNwRmRPU1VaaVgydGhQVEJv?=
 =?utf-8?B?dERJM0ZFYi9HQTJlbVB6cnRhb2N6eU5KcnB5YXF0eW90RldpbWRJUnQ4b21V?=
 =?utf-8?B?OERqZEhBbDdzUy9MSWtUbDJ4Q0FmTzEvZTdRcmc5S1E1M3Mwd1NVdDNnNHZh?=
 =?utf-8?B?K3BpQ0paZEFndmpoNDdWUnF2bmlyL3MzQlY4MHRLTG9kb1FUNlpqNHdsVW56?=
 =?utf-8?B?VTh2d1hzb2NzNDEyUWpjQ2gzcTlHRi9raFg5SjlKeGtEVzU5VVZrWXc1V2o0?=
 =?utf-8?B?clpFdDMrNjZtYVh2eWkrWnNPa0U5OXljYm53cHYyUEc4WGZIOFZTQmxUeXdX?=
 =?utf-8?B?Y0lUeGppQ2hsUDh6bFJvZDFNakpQbjFCb0JBcEx6SzFTdE4xdFB3VDArNU0y?=
 =?utf-8?B?dCtjUHNWc3hZNFc0dnRhYlBrZk16VEtzemR6TUQvdlJmbDFCSENYdlRtOWpC?=
 =?utf-8?B?NExtOEliU0o1eGd5ZTc2Q1M5RHdPTTJRemhNY1lzVnZIRGZuVmFBY20xSFRH?=
 =?utf-8?B?QTNOSlBaK2NnREFOWHpyV254cFp4THgrMkgzRURMTUE1NlBBUWVMRGM4TGNJ?=
 =?utf-8?B?MXEyOStkYmdwMjczWHBvbWp5NDlGMlc5Skl1WEtiUjVtSjB6U3VFLzlqSzdI?=
 =?utf-8?B?TFVkd1FqQUV6UklmRWFobTFIWGNrcXVNQ3VyKzdPYklTbW5pWW9ZR2VOaXpD?=
 =?utf-8?B?QmF5cjFKZlFDaFNoSk5EcDBWYVdFcjh6azNpTm1WdTFKQldFT2VFVk90YVpI?=
 =?utf-8?B?V1VIZlVvV0RDbHMvL0FpMlYwbFJrejBQWStCVEtGS1pmdWlwa0lJdHhWcGxU?=
 =?utf-8?B?TGxsUkxaSFhENEd2L0Vwd2lCaTYvWlNQODlRbC9JbVZaR1FIZWtSaGJjK0Mz?=
 =?utf-8?B?cXpua3A5NEtoKzA5WnR3S0NDY1BLRVhxR1JFQlV3K0lvVFp4S3RWWVQ2cXo1?=
 =?utf-8?B?b1QwSE5wRjJQUDQ2RjAyOTA5bkZZWlpSK09uVkdCVWdJVngyanMxcW9idW9s?=
 =?utf-8?B?cnM3THZ1ZExlSWlIZmx2TEl6NzdyaEtUSmxLbFo1S1NqSlR1STBITS9RdUh6?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4itFmZvTxHUrLIC4rTn7PGfr2vKcUeztTS2h6i5HF8tx7qbyYD6DoiGBMqokv1CFvMMQEBq+AtuAMFtC+R8S/sP8exoxQM7EvUewi78c3IPzcIH3W+djey5+ib0G++4VVhlJUwEGrjrY5AVbG+d8B0yROtz5EBrRiJSFtv8dfH8SlN2IaSJgX8PPxsLshxPQ/toVflbwk2YWoLDizmhpjUOITJ908oyZwieqE0kz3sTUyCLoSRNX/mDo4DBfJv7InAACsENcaNvph+cWV/Bjfd0l7wL8aeTmv7Dna5MFv3I4X14RzVmrtVkgLqPZes2dhCxelpSIc4M/j+3CWFpa7nDlopEKC5q8KFUmvdAVrNEXMUvqu7jgohZ2da8pkEP7Z/5YziQ7SSMHBXaHvBQMOT7zYfA6QP3SN1xKrcP9/8skgFU2HMViMh/5F8DhONZFwsQIanQKNbBPvr3mIeWOamggIGvbQ5ZM+WpZ2CrY6dPL1XcfLtQw104K+vana+hPKoC9CdSKWafcop3AMgInv7y1Kmeugk/l/XUJEK2Sr6FsAqlTYde/sSmZ+vvYbAE8+yjiRBSIIwGQcEnet1/RXqmkU71/Y0IP28FujQx1iirPpPAXMhqEA1Pg3b8B1CthTy16CiSduTKRlM2z5rKD/gcbbI7gVVuFpwCBagYs1//ZEz7qROrHsyAqVsSOeC7296om83s8eVwfHMIxVVP5VESRk1bGBo+uvA2jYe+DVTJ8b0o89Uv1Bo+SpBwBIa8fc/OvCX2wEleWBxjUf5dK0lMNEDlTYl76HHzEMRADw3sIvK7U3ul/hMxcu2RAWIViiS7f9/gtX+FbS+4PU9rA4A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64ede3b-0320-4060-3745-08db165a686b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 11:29:36.0437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv9xNewtKRKpPW8ZR6qRgqhy3DUL8JELzHAgVeULnPQKrRI4yKfCLvzCGMxttUKPAiytrK0FaMVfK/LyU1+OsjgZtQrW8OKv8A+JyQYQPE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6753

On 24/02/2023 11:17 am, Jan Beulich wrote:
> On 24.02.2023 11:50, Andrew Cooper wrote:
>> On 24/02/2023 7:27 am, Jan Beulich wrote:
>>> On 23.02.2023 23:03, Andrew Cooper wrote:
>>>> https://github.com/llvm/llvm-project/issues/60958
>>>>
>>>> While trying to work around a different Clang-IAS bug, I stubled onto
>>>>
>>>>   In file included from arch/x86/asm-macros.c:3:
>>>>   ./arch/x86/include/asm/spec_ctrl_asm.h:144:19: error: \u used with
>>>>   no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
>>>>   .L\@_fill_rsb_loop\uniq:
>>>>                     ^
>>>>
>>>> It turns out that Clang -E is sensitive to the file extension of the source
>>>> file it is processing.
>>> I'm inclined to say there's no bug there in Clang. Gcc, while not affected
>>> in this specific regard, also treats .c and .S differently in some perhaps
>>> subtle ways.
>> This part was just an observation.
>>
>> Whether .c and .S should be treated the same or not, this -Wunicode
>> diagnostic is given against something which isn't in a char/string
>> literal, and that is a bug.
> Why are you thinking of only string literals? Gcc is quite okay with
>
> void test\u0024ä\u00F6ü(void) {}
>
> yielding "test$äöü" in the object file (I haven't understood yet why it
> dislikes \u0040, i.e. @.)

Oh - it seems universal-character-name is an explicitly permitted part
of identifier-nondigit.

In which case, Clang is arguably correct given a semantic expectation of
being a C file.  I'll reword the commit message seen as I've not quite
pushed it yet.

~Andrew

