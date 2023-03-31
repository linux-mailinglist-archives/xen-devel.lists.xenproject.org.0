Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34956D29C3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 23:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517048.802057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLxE-00054j-Vx; Fri, 31 Mar 2023 21:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517048.802057; Fri, 31 Mar 2023 21:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLxE-00051P-Sv; Fri, 31 Mar 2023 21:06:36 +0000
Received: by outflank-mailman (input) for mailman id 517048;
 Fri, 31 Mar 2023 21:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1cV=7X=citrix.com=prvs=4478a6bcf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1piLxD-00051F-Hf
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 21:06:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8f1ff9f-d007-11ed-85db-49a42c6b2330;
 Fri, 31 Mar 2023 23:06:32 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2023 17:06:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6001.namprd03.prod.outlook.com (2603:10b6:610:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Fri, 31 Mar
 2023 21:06:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 21:06:21 +0000
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
X-Inumbo-ID: e8f1ff9f-d007-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680296792;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=edhrLyDijSiqEEWFaghKS9+MLSBYiZJqhTQ3j1xs3Lk=;
  b=dLLisByv0OwqqZIF1EmrAVSHxObzPT2D+EHUvR2rvtBBJrQZQwMdtB7S
   jznWfUBKckKDznHMXt00ajxq03zApZP+Go3ZV1DrWc/IW+FTQUrIFXbwi
   ksQ7QwC0FsKvP0XQJS4C7V37VnErHIf/Ax15uk1U3Eb1VjfTC1BMv98gc
   4=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 102686308
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E3IyLa0m5dhD7dUiRvbD5fJwkn2cJEfYwER7XKvMYLTBsI5bp2RRm
 msYUG+DOP6LZmKmKYglbo3i8UMHvJ6Hy9BhHlBtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJkVc5
 K0Sbyk0LT+Epvy55q3ka+92v5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFUZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjAtxCSubgppaGhnXP+1MeN00fT2ec4qKU0Babfu0Fd
 kobr39GQa8asRbDosPGdxC6p36CpUJMc9FLVfc94wGA0bbZ+UCUCnVsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoOS1QD6ty6+IUr1EuXF5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNO+RENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:9QmQ765WMLp/nDQDFAPXwMzXdLJyesId70hD6qkXc203TiX4ra
 CTdZEgviMc5wx+ZJhNo7+90cq7LU80l6QFg7X5VI3KNGOKhILCFuBfBOXZslndMhy72ulB1b
 pxN4hSYeeAamSSVPyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="102686308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntbgZbXihO6rNJm5bR67pQsvUnXCzgn/DvuehkgtlkArx4+UasbUKrqwedzf34eadBMKQ2mALMpUhPEODeZj1X08chlBE5xR8pySJjDSmwfE4yaMGcftTQ3zOhN6HLKzE6281yRkWTU7u8HnAutJhFTlbJWWVnRKeiwdGfUKrq4pTAz0AHV3kI4Z6tzVHWI+F6ytsXEEtDSw5l1izGv5SezqH7nLzuNi/81rc/WtzUABtHy5Sl65c1U5bDypXiIMqXNYlaE7KWK2Pc5CdKTqnF4/C9uHqe8iEFzrBeW4iythgDYVvvnbtHsEFI7zeVSit1g3QmuCcuCrwHU7BmPkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6gcDtpK/u111jI6Os9InU0zkYCUcV40cq/9kO08AqE=;
 b=UtS5GiAchVzDHfbYoczs6QfWctH5eX5Y6tIW8HpfW9xxVtGglrqRE7Vqxinv2Ba3thu7kykiupv81cda03BRUdRhhAEjjacuW2RUrJt6XdtWBNDVEeS0ySP9Y8TOkXQDDrt7qIm/5geCOuACv6HT7mfL5+BrIuyY3N7YFB8Y5oBXMa+5ZXSoLutR5f2M/mFZc1NvWZhz6R4cpPYwQhE8dyyLoEQ2Hh1BNTcUFU9m+oLRgrqObptlN9Mee5voJ2xQrpb8PFWRJttI8vfEqut626CqCNOfNrbXa7aJxP+45J0IfOIEI7Mt4I/b3iBK8eQwx0a6Oz549Ylmmqem3eINHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6gcDtpK/u111jI6Os9InU0zkYCUcV40cq/9kO08AqE=;
 b=FgUvoflt1wsKeZQB4b9gfHm0KWU8TFHSzYBeyhVn0vclAjV8WKRCcnJLD+e9Qf8XXJasUx24r/XqcDkZiRD43Sbg038mRdJawEXMhjIzorO/8eqR+eZCFf1Ihq3zYBBJIdq85NdT9CIwaBPI34Jc/jtfgPFU+SzBGuNisFH+eLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <40e25bb7-aa5d-1629-04aa-4f552501e08a@citrix.com>
Date: Fri, 31 Mar 2023 22:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Best way to use altp2m to support VMFUNC EPT-switching?
To: "Johnson, Ethan" <ejohns48@cs.rochester.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <MN2PR07MB6045100322F58085DD6B1488E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
 <c12ff321-e1ad-1377-2158-195594fdbe04@citrix.com>
 <MN2PR07MB6045B965DD2DA308C55905F9E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
 <a1a814cd-9a76-9828-ffab-5590fcd5925f@citrix.com>
 <BYAPR07MB6040EB2AEC1567C5982FBD51E48E9@BYAPR07MB6040.namprd07.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <BYAPR07MB6040EB2AEC1567C5982FBD51E48E9@BYAPR07MB6040.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d1e676-f523-4e10-c07f-08db322bc718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VSEmysnpKVwYoMLoJKABaupag25kWcbJL1cowW37i+cntFwfMMZYrKWZ8+ymSw6bXQQRLS6wxr5CIALn8xIVJrRhzZ1i2xdB+wFgIYSlHiwzgjGHJ5ySzekpxlRQIEzQonrsHomsQaAuhcjaLmX12qHWaUdIca5YwPrYV5+jXjpQ4nrewEzufHGQsKxzWM7fydUfXuFnhbk5Lio+3CHKRelZL+eNXJeB/pQbzSQeRpPHQeGh/YPXDcaFqq9DFAlnQiQ/FfS+TYwlIJepw0cWGmtW91OaW3SRUijiSB0hUIxPV56uh02FeXkbjlZJiS2yQiPx13Wcpg71GdE535XerS9uNv4tiwG/kj1dFqskOu2RpYP8UDiA3SmU8e30wMlZ12rM8cqPG3mZhUctoMcKir90ZHGOhsobDnvrevOk9PKZlrg36FhSuoIjDhrAZguUdeKCDwPU1a9t4axB+/sCY0RyFK+080lx7hSTt8xLnP5yf9HEvAuUnFTTf1QQv88i9hBOORupq8hswCAhOv/H1UKnGAZiJtAVRzUra6HlSsgNFIBPBqWybUnXWKSZ8sNBt/edW37ghpfW54QSJlRGUfnOnW2shk3PAplR73lSfpRWcS67c2V3hN7xBowDSFJ0Yn+YafY5PCnkmqNg10CjIL6TclZiuSzDn0oYSRnGpSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(478600001)(82960400001)(66899021)(66556008)(41300700001)(66476007)(66946007)(2906002)(316002)(296002)(110136005)(8676002)(36756003)(8936002)(5660300002)(86362001)(38100700002)(186003)(66574015)(83380400001)(2616005)(31686004)(6486002)(53546011)(30864003)(966005)(26005)(31696002)(6512007)(6506007)(6666004)(43043002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHNUUkh3WXFjSDZCbnc1VDRrM0hIeVYvTFk1YkJReWlVMGZSeHliQ0w0bUtF?=
 =?utf-8?B?dDB4RCtWVnVXWXQ0S0Y2M2wzejdZNkUwQXF1VGFTdm9xQyt1ZjVDa1dVUnhr?=
 =?utf-8?B?WDBJQ1ZsaUxEbmxzaTFzbEhLZTIrVWxLTHUwM3EvbHJwMTl6TDRkdzJtS2pw?=
 =?utf-8?B?RXVQWHZCUzRJN010cUplRTQrNG9Vc0NoSnkxU09hY1J2RTNhUWZIZ01UKzB3?=
 =?utf-8?B?Y3k3bElUQTE1SVFkb21MQkhNMG9FMnlqcGYzR2tOUHpvQUgrc2p2UGdBOGRK?=
 =?utf-8?B?ZWk1NENJMVpYM3pWbXdEdlpRT3lMNDN1SDdBUjNlbU9zclFnRlk4bjZydFZz?=
 =?utf-8?B?WFdwd3FmT3p6MmYwSGtPb1lHdytkRTJ0YUZ2OFFwTzlQa2pQTFlkcjlROUFy?=
 =?utf-8?B?QktGT1diZWdHRUk3cjA0OC9qOWVYd1hsSmVveVlKRDM3NlpTZnpCQzh2VUYw?=
 =?utf-8?B?dmtwZWVYcXNiTWtTYXQxeEkrZDhHTktkb3JyMjVLM0RoR21yYlRzWWhONU9N?=
 =?utf-8?B?RWJPTC9raVQyRDBhTlFZVnNrVnFXZTQ3cVF0eUF0cnA5N0NTOGwxVW5XM1p0?=
 =?utf-8?B?L1ViU3NNYVN2dHdmQ05FTXY5Q0V0RW02UTdOZkcwT2ZFeVRNank3VTdSbytt?=
 =?utf-8?B?aVJqYThGTHNXNzJKaXdkdW5PLzBmMFUyZXVrdkM2YjJlWjFqclpNYmEyOEMz?=
 =?utf-8?B?V3ZEQURVS0xxeGxrVkRuTWU3aWxsT3F3U3ovczZlR0ZvNkR0aW16WERkVUt1?=
 =?utf-8?B?bGpSSWs1UGFLRFM4VG9kS01RelZKb2V5SVFHeFV1ZWljbzBNNnVvYitMK3Ro?=
 =?utf-8?B?aDM1VUlBeXllZ05SdUtsK2p1bjFXS2RuUExyMThvb1ZQVmQ5VWRnRlEwVkdk?=
 =?utf-8?B?NDNvZ2paUTUrUURneWNVdG9LUC8zWGFxMlZCZmM3ZUxsdjFyMzdPa2YySGNh?=
 =?utf-8?B?MlVOUmJGMmhNeHFUcUMwS2VGUkVHVEhyOE9QNXNDazJTb0FGbThOQVFIaUd5?=
 =?utf-8?B?bGt4SElONG1kSW9jd0k4SWhKVm9PbDlwTDZPdzd4QXRqK2FSNm13b1EvdTlU?=
 =?utf-8?B?b1BNM0k3U25UOUJxYm5leTVxZzB5WFpuRU81ZHlqVlJJN0cxQ0pGUjg4YWRN?=
 =?utf-8?B?MjFzMlFCanQvWUQ4c0g1RHRTOWhnSDBZTVpPUGF0L3RzNlptZzRFVHhmSWNL?=
 =?utf-8?B?VUwrR05Cd2J5R0VkWmVsU29rVG9LS1pCODlkK3BsS1FwZGtHYjFGRm1pcTAw?=
 =?utf-8?B?VzlZWHdOb1U5Ukg4SS9mN0ZPN0IyVHViNTRtYUcwNXFoODhnWmN0M3g4UUFG?=
 =?utf-8?B?Y3BwcXNJanN2bG9uay9Senp1LzFlNWxXb1RTait3TnI2TUhpM2NvMTRCZFIr?=
 =?utf-8?B?YUtjcmc3cGt1OWg0eW11UU9sbGxGTnlILzQ2U2JGdTZ6KzZ2ZHVUN0dBNFp1?=
 =?utf-8?B?VW5oNW8vQ3NrQzBkSjNsaUtmaDJaV3IyeE1JNHRuZ09ORXM3cWYxYXBNK0Qv?=
 =?utf-8?B?TUlBbE5WNk5TaGpNMzdvQ0hlS3B2NFFnUDNOQ1NoTy9vbDR2T1c1enRWbFRB?=
 =?utf-8?B?L3lFWUVpV21hZjVLLzRCWVdtOXJwREVDQUIrNFVadmM2SkE3SDB3M0RyQzRi?=
 =?utf-8?B?RE5td2xNSXRXeThzdTFGMkZzQzFGMEh0RVVYYXZoYXJGUlRZVEswT1ByRmdw?=
 =?utf-8?B?YXBGZldFT0tib1ZvZEF0bkN3SkZRMjBaR0pVVzV3aVpwakxDOEpXN2ZwOGZk?=
 =?utf-8?B?Y05FeW0vSFp1cUxDZkdMS0ZEVGIxSThTNWE1RjRqM1NDSW05OWlDUHgrMU5P?=
 =?utf-8?B?L0JXVlNlQXFqVCt1LytpcWpGeGprdW51SDRDbE5sT0wyLzZpSnBVVDUwbDlP?=
 =?utf-8?B?OTkzamZhemkyUHR0b3ZWQzdYTU9GUTFoUUFqcHFHQVI3ZFlHMXNCTnVNTEhP?=
 =?utf-8?B?YzB6Q2IvMloxblVmMjg2cmJqUis1emJkcy9RYWU4T0dsZmNzMlpxRkpsYmt3?=
 =?utf-8?B?UHRpdzQ0RUlGLzQvblcvWUFxSmJuYzJyOVFlK3JaM2REZGF6UjdiaUNSL0FD?=
 =?utf-8?B?UVZLZ0lVRmp0bmFKaWRsZ0s4cnQvN1drMkwvN0RWRUwvT2YySEYxS0xaTTMr?=
 =?utf-8?B?b09IVlRudnArTi9TK2UrTVBlY0RnbWtpN3hZYnhKeVU5RTE0QXA5bWJoM1F5?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bkS+RVas5LljZB4vAfjdRna0JxJhAL+Htl8Bs56fDxb1S7HN20MWYsy/cfnfZ7LojWitz4T9IAeTX4kdn/qOHuuF3saJrR1T7T9Q7GbGx3+SJY3y7sGPXmQxBYZzNMCpb2pPlW3jcjYScR/wEMW8FkjJKKCrnthefcnxqCm2U8RrAS7SGqmybSeOJ7s0PnRuOu8aXmC74o+qOwJ3jK2fAmt1kw2Z4JM5lor2k8ZFcOJLwOb6bipPqLQBpXxze5DpqzoaKtrAhMXadn+dxFzeLo5SOu18m5fuu/GAJ/rsQ5dWyL4/9JIdseMwIHixX+2FI+nu0WdwgLq9tz/LcEmoTpwdsaCr8cOS7jDEXef4B1Xxwvkc2brcZ2yOBVqbhMNCSQCJ7TTFB/XqeXBcjcwFSHTSc0P4uQfOx59K0Mb75dMsElOmCcAz54mw+ZbW9jCLvBdaHDQ5mMkTOncaPISjpdWm/1IN7LIrt9RZHhD4d0sZ0vZQDpfFgbWmhVPoiyQRWyAB9M7/v04AhizFuEcW1bSq8t1OGp+ZFOENQ5FuFHLAF/Em2fQnncm6cHTw+2B57D/lPIyn3pw3lxQX/WEs11IzJo93i8UPK/yYIjamGPzQesBrqwp3l/i/SAop1fz+vN10pAWLB9tfgnIPndJ/96b9MwEeRgGeeixscF3Mhx2bR2tJCznoCCs+JIs0+aUu5yNQHuFaZYbkvVTTqoTTAsx3NugbCcqLPVxkIBZwIPxAzsUwupvM2htkDTEH5ZGp82AQCcBccSZucibxnagFDvtukzftWsKecGNEtQv2HpnYzhj5Il1IeQ5NaHaRCcEK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d1e676-f523-4e10-c07f-08db322bc718
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:06:21.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8vmmh1NASRIf5miS4UI4hg1ur+0jB4O6K6ne3kpSSxiJjT7IFsdNSTW3vTOIEMdA8Pj8nJPfSoVEaiiLP+Ocr2KZRZaNFlmvVsrEc1NQ1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6001

On 30/03/2023 3:29 am, Johnson, Ethan wrote:
> On 2023-03-16 02:14:18 +0000, Andrew Cooper wrote:
>> Ok, so there is a lot here.  Apologies in advance for the overly long
>> answer.
>>
>> First, while altp2m was developed in parallel with EPTP-switching, we
>> took care to split the vendor neutral parts from the vendor specific
>> bits.  So while we do have VMFUNC support, that's considered "just" a
>> hardware optimisation to speed up the HVMOP_altp2m_switch_p2m hypercall.
>>
>> But before you start, it is important to understand your security
>> boundaries.  You've found external mode, and this is all about
>> controlling which aspects of altp2m the guest can invoke itself, and
>> modes other than external let the guest issue HVMOP_altp2m ops itself.
>>
>> If you permit the guest to change views itself, either with VMFUNC, or
>> HVMOP_altp2m_switch_p2m, you have to realise that these are just
>> "regular" CPL0 actions, and can be invoked by any kernel code, not just
>> your driver.  i.e. the union of all primary and alternative views is one
>> single security domain.
>>
>> For some usecases this is fine, but yours doesn't look like it fits in
>> this category.  In particular, no amount of protection on the trampoline
>> pages stops someone writing a VMFUNC instruction elsewhere in kernel
>> space and executing it.
>>
>> (I have seen plenty of research papers try to construct a security
>> boundary around VMFUNC.  I have yet see one that does so robustly, but I
>> do enjoy being surprised on occasion...)
>>
>> The first production use this technology I'm aware of was Bitdefender's
>> HVMI, where the guest had no control at all, and was subject to the
>> permission restrictions imposed on it by the agent in dom0.  The agent
>> trapped everything it considered sensitive, including writes to
>> sensitive areas of memory using reduced EPT permissions, and either
>> permitted execution to continue, or took other preventative action.
>>
>> This highlights another key point.  Some entity in the system needs to
>> deal with faults that occur when the guest accidentally (or otherwise)
>> violates the reduced EPT permissions.  #VE is, again, an optimisation to
>> let violations be handled in guest context, rather than taking a VMExit,
>> but even with #VE the complicated corner cases are left to the external
>> agent.
>>
>> With HVMI, #VE (but not VMFUNC IIRC) did get used as an optimisation to
>> mitigate the perf hit from Window's Meltdown mitigation electing to use
>> LOCK'd BTS/BTC operations on pagetables (which were write protected
>> behind the scenes), but I'm reliably informed that the hoops required to
>> jump through to make that work, and in particular avoid the notice of
>> PatchGuard, were substantial.
>>
>> Perhaps a more accessible example is
>> https://github.com/intel/kernel-fuzzer-for-xen-project and the
>> underlying libvmi.  There is also a very basic example in
>> tools/misc/xen-access.c in the Xen tree.
>>
>> For your question specifically about mapping other frames, we do have
>> hypercalls to map other frames (its necessary for e.g. mapping BARs of
>> passed-through PCI devices), but for obvious reasons, it's restricted to
>> control software (Qemu) in dom0.  I suspect we don't actually have a
>> hypercall to map MMIO into an alternative view, but it shouldn't be hard
>> to add (if you still decide you want it by the end of this email).
>>
>>
>> But on to the specifics of mapping the xAPIC page.  Sorry, but
>> irrespective of altp2m, that is a non-starter, for reasons that date
>> back to ~1997 or thereabouts.
>>
>> It's worth saying that AMD can fully virtualise IPI delivery from one
>> vCPU to another without either taking a VMExit in the common case, since
>> Zen1 (IIRC).  Intel has a similar capability since Sapphire Rapids
>> (IIRC).  Xen doesn't support either yet, because there are only so many
>> hours in the day...
>>
>> It is technically possible to map the xAPIC window into a guest, and
>> such a guest could interact the real interrupt controller.  But now
>> you've got the problem that two bits of software (Xen, and your magic
>> piece of guest kernel) are trying to driver the same single interrupt
>> controller.
>>
>> Even if you were to say that the guest would only use ICR to send
>> interrupts, that still doesn't work.  In xAPIC, ICR is formed of two
>> half registers, as it dates from the days of 32bit processors, with a
>> large stride between the two half registers.
>>
>> Therefore, it is a minimum of two separate instructions (set destination
>> in ICR_HI, set type/mode/etc in ICR_LO) to send an interrupt.
>>
>> A common bug in kernels is to try and send IPIs when interrupts are
>> enabled, or in NMI context, both of which could interrupt an IPI
>> sequence.  This results in a sequence of writes (from the LAPIC's point
>> of view) of ICR_HI, ICR_HI, ICR_LO, ICR_LO, which causes the outer IPI
>> to be sent with the wrong destination.
>>
>> Guests always execute with IRQs enabled, but can take a VMExit on any
>> arbitrary instruction boundary for other reasons, so the guest kernel
>> can never be sure that ICR_HI hasn't been modified by Xen in the
>> background, even if it used two adjacent instructions to send the IPI.
>>
>> Now, if you were to swap xAPIC for x2APIC, one of the bigger changes was
>> making ICR a single register, so it could be written atomically.  But
>> now you have an MSR based interface, not an MMIO based interface.
>>
>> It's also worth noting that any system with >254 CPUs is necessarily
>> operating in x2APIC mode (so there isn't an xAPIC window to map, even if
>> you wanted to try), and because of the ÆPIC Leak vulnerability, IceLake
>> and later CPUs are locked into x2APIC mode by firmware, with no option
>> to revert back into xAPIC mode even on smaller systems.
>>
>> On top of that, you've still got the problem of determining the
>> destination.  Even if the guest could send an IPI, it still has to know
>> the physical APIC ID of the CPU the target vCPU is currently scheduled
>> on.  And you'd have to ignore things like the logical mode or
>> destination shorthands, because multi/broadcast IPIs will hit incorrect
>> targets.
>>
>> On top of that, even if you can determine the right destination, how
>> does the target receive the interrupt?  There can only be one entity in
>> the system receiving INTR, and that's Xen.  So you've got to pick some
>> vector that Xen knows what to do with, but isn't otherwise using.
>>
>> Not to mention there's a(nother) giant security hole... A guest able to
>> issue interrupts could just send INIT-SIPI-SIPI and reset the target CPU
>> back into real mode behind Xen's back.  Xen will not take kindly to this.
>>
>>
>> So while I expect there's plenty of room to innovate on the realm switch
>> aspect of EPTP-switching, trying to send IPIs from within guest context
>> is something that I will firmly suggest you avoid.  There are good
>> reasons why it is so complicated to get VMExit-less guest IPIs working.
>>
>> ~Andrew
> Thank you for the detailed answers and context. I am somewhat encouraged to
> note that most of the roadblocks you mentioned are issues we've specifically
> considered (and think we have solutions for) in our design. :-) We're using
> some rather exotic compiler-based instrumentation on the guest kernel (plus
> some tricks with putting the "secure realm"'s page tables in a nonoverlapping
> guest-physical address range that isn't present in the primary p2m used by
> untrusted code) to prevent the guest from doing things it isn't supposed to
> with VMFUNC and (x2)APIC access, despite running in ring 0 within non-root
> mode.
>
> On a more concrete level, I am looking to do the following from within the
> hypervisor (specifically, from within a new hypercall I've added):
>
> 1) Get some (host-)physical memory frames from the domain heap and "pin" them
> to make sure they won't be swapped out.

Xen doesn't have paging, owing to not having a disk driver.

There is a paging subsystem which you've probably found already in the
code, but it's a decade old and never got beyond experimental status, so
for most intents and purposes you can pretend that it doesn't exist.

i.e. nothing allocated in Xen moves around unexpectedly behind your back.

However, pages that are allocated to a guest (PGT_allocated) are
reference counted, and can be freed when the refcount drops to zero. 
This can include explicit guest actions such as a decrease_reservation()
hypercall.  You have to be aware of this if you want to point any other
non-refcounted thing at the memory, but I suspect it wont matter for
your cases here.

> 2) Create an altp2m for the calling (current) domain.
>
> 3) Map some of the newly-allocated physical frames into both the domain's
> primary p2m and its altp2m, with R/X permissions.
>
> 4) Map the rest of the physical frames into only the altp2m (as R/W), at a
> guest-physical address higher than the end of the main p2m's mapped range 
> (such that when the primary p2m is active, the guest cannot access these
> pages without taking a hard VM-exit fault).
>
> I've been poring through Xen's p2m code (e.g. xen/arch/x86/mm/p2m.c) to try
> to understand how to achieve these goals, but with little success. Comments
> in the p2m code seem to be rather sparse, and mostly unhelpful for
> understanding (without pre-understood context) what many of the functions do
> and what is the intended workflow for using them. For instance,
> similarly-named functions like guest_remove_page() and
> guest_physmap_remove_page() seem to operate at different levels of
> abstraction (in terms of memory management, refcount bookkeeping, etc.) but
> it isn't externally obvious how they're meant to all fit together and be used
> by client code.

Don't feel too bad...  Not even the maintainers can agree on where that
split is either.

It's mostly an answer of history.  Originally Xen had paravirtual guests
(dom0 still runs in this mode) which were aware they were running under
Xen, and had to manage their own memory, including whatever idea they
had about their layout.

Then HVM guests came along and Xen had to start managing the guest
physical address space on behalf of the guest, and this was (dubiously)
called the physical_to_machine or P2M.

Notice how the guest_phymap_* functions have paging_mode_translate()
checks and do two totally different things.  Read
paging_mode_translate() as is_hvm_domain() and it might help.  The
guest_physmap_* functions are for doing logically-the-same operation on
PV or HVM guests, where PV is often a no-op, and HVM is quite involved.

The p2m functions are all for HVM guests specifically.

But yes - the APIs are a mess and you're not the only person to have
noticed.

> Any suggestions on which p2m (or other) APIs I should be focusing on, and how
> they're meant to be used, would be greatly appreciated. I suppose in theory I
> could just bypass p2m entirely, and populate one of the VMCS's EPTP-switching
> array's slots directly with my own manually constructed paging hierarchy
> (since I'm envisioning the memory layout of our "secure realm" as being quite
> simple - it only needs a handful of pages). But I'd rather "color within the
> lines" of the existing APIs if possible, especially since some of the pages
> will need to be mapped into the existing primary p2m (for the "insecure
> realm") as well.

Taking your analogy, I'm afraid you're probably going to have to start
with a pencil and draw some more lines.

The altp2m work got as far as minor {i,d}TLB bifurcation (to
stealth-breakpoint code under analysis), but didn't ever get to "I'd
like something totally different in different views".

There has to be an authoritative idea of what the guest physmap
(singular) looks like, and that's the host p2m.  (Not relevant to your
case, but to highlight a point.  Consider trying to migrate a VM with a
mutli-view setup.  The logdirty bitmap is expressed as a bit per gfn,
and all those gfn bits had better come from the same view, not the
alternate view which happened to be active.)

I suspect what you might want to do is create the guest with all memory
(but mark the secure realm's memory as either E820_RESERVED, or remove
the entry entirely), and create two altp2m's; one for the insecure
secure realm and one for the secure realm.

IIRC, views are populated copy-on-write style from the hostp2m as the
vCPU executes in that view, but you can make modifications using
HVMOP_altp2m_set_mem_access{,_multi} to give it specific perms or
HVMOP_altp2m_change_gfn to bifurcate.

I suspect what you want to do is set the default perm to no access (i.e.
disable CoW) and use HVMOP_altp2m_set_mem_access_multi explicitly create
the subset of mappings you want in each view.

But honestly, you're beyond my experience of using altp2m.  Good luck :)

~Andrew

