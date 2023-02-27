Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EA06A469B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 17:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502783.774765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfvM-0002Y1-LM; Mon, 27 Feb 2023 16:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502783.774765; Mon, 27 Feb 2023 16:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfvM-0002VP-Hn; Mon, 27 Feb 2023 16:00:24 +0000
Received: by outflank-mailman (input) for mailman id 502783;
 Mon, 27 Feb 2023 16:00:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWfvL-0002VJ-Ei
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 16:00:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5a3974c-b6b7-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 17:00:21 +0100 (CET)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 11:00:04 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6172.namprd03.prod.outlook.com (2603:10b6:408:101::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 16:00:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 16:00:02 +0000
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
X-Inumbo-ID: d5a3974c-b6b7-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677513621;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OdOt2fnNbDtBDMpTKBItze1GjIcvpdOsug2CPIU5SRM=;
  b=AfuzCZiLxvjr9yyYRf8RI0vdqT2Q8U0a0BDIqzRWcduVbk6bVH0+96uB
   q1459mMRG7Pmpzt83wwjkvtIKd/Bd0tCJlVWBKLVEkpogTU485aj1HzVZ
   xgynMXdCCHbuiUM0PR4ogPDkSb+RRAiOmOID6teoErTORY6IhYx0TB5KP
   8=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 97531915
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LDaJi6DPtXtU7hVW/8Hiw5YqxClBgxIJ4kV8jS/XYbTApDonhTNSz
 WROUGrSOKmJNDT3co8latjlpkkOsZ+EnN5nQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GlC4QRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpOQwAUZO9
 uAhMjEAVQG4h+jr+5GCRbw57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvTm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6QwHiiCdtPfFG+3u40jV3LyGoyMl45a1K/r+SIsgmTePsKf
 iT4/QJr98De7neDRMTnTRS8p3KDoRc0VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8PGSpDC7OykQJEcDYzMJSU0O5NyLiII+kBPJCMpiGaidj9vpFDW2y
 DePxAA8jbgOic8A142g4EvKxTmro/DhUQod9gjRGGW/4WtEiJWNYoWp7R3e8qxGJYPBEl2Z5
 iFayo6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 hC7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:XeuVv6s3HV4XBdW5SGK4LiLI7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="97531915"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/DYLAyC0pS3FnpiLvJMsDLuZ3KYPp66huEGhvMM4+8Vzd9qqRwN1uN2IkSvJP+hznrkisQ+M2XFcxDQCjuFT2Q1lNUed+dCSljDZ4ZR2khN5lfrppeI4lba6VlyDXoND9CDiFBQtd030O8eRb4T38WfFRkwo/uoB0aOFjip2qs7GmWmK01oB5OmgSRdhzcLflxGbi+7uEKwcSOPbU9lq5nvboRjIEvvStZLWWCaNGoBH8d7TmkCCqDf/RHJBXl+k1rub2UrZSqswEAlkU3J8g/C0Cx8M+CBRqXFimQi/K2HplgxS+OhFaTFWvyM1e62GHOTEND3YyNlNRvQYjL36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdOt2fnNbDtBDMpTKBItze1GjIcvpdOsug2CPIU5SRM=;
 b=WKd13sJ9W9cwm+ylcMmU5ZwIGxM0U33FmY5cnnFAouhtqXRDvgQ21xbhP+dUZwgJ3jm1LWprmgdgPcaFdA0Bpont40Uo/ItM01SvxlKeEVtllNTo8STAlR5FelIU2I346nWYXcuO4epZARd7YWlxdApFM2oRVH0KYM5ruDHaOgceWQ8OsWXFgHLAOyPAulbE8V+bxy8wMHOual8a6qOQ841t1aTHOEuL/3JjWCKlsxiyXwe9295ga3dRKlvAlL81rqBv/eM1Ylva7/c4LSLXrYs/O8FxtKwkwEldGJuJ1LF+AQzXDjODcQOQRbaC/sWQK6HAcFqnlZdkeyPSyeHxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdOt2fnNbDtBDMpTKBItze1GjIcvpdOsug2CPIU5SRM=;
 b=JbmtbnA+PqqZmEIxfSinvdc2pnEu0E12DqkUKWKMkWHpvIG8BEJkQA49JHAc8O6QWrgIMqcqA8gC+gQquF03lxnUp9LMklIoJL5BnFgUWWgArUji4ZbANX/zxviRlZUQBPcSQtHw24fUZde8x3o7I/KtYKkHuAQrmZm4A3GMERE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d1422e51-b19b-adb3-fafe-93aae6566841@citrix.com>
Date: Mon, 27 Feb 2023 15:59:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 08/14] x86/vmx: move vmx_update_debug_state() in vmcs.c
 and declare it static
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-9-burzalodowa@gmail.com>
In-Reply-To: <20230224185010.3692754-9-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: a692bbbf-6aaa-4201-9d5b-08db18dbaeff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7e/16IDnMZ1uTl9KlIRUUOXfaAwnX9AT8khJnBbVaQYEJfqOCn6ilqkB1wijTp8ozCnLvK1yqrCiakZnpJMXbr7pgYm7t54BvjkGGNbeBwlhnGN+fhu4vUpKBBfvjDvAPyoM5wQA/MWGbkaL27TsPkLhMZtDXDNbf/aHTTq2jlr3wRrhF+MC2Q5eC8lTwg7f3LZjJiR2zFtAX0T5CA0ICtCpB8rdGTmr8TqNo/C6m/hJZNAYbhEzIT3l75x6ArmMTEZJviJV7Y3us85R8CVypUgGGLKL+greKLZyfS+34OGkGJ63ME3f47J0Ok+pBN310JFmfxM/UGCVj703Q+Kj0p33BeI4kSGGvovtAKEaInUmaAqr7flR82qI7DsGPgwkmYfEqOcpE8W/Go6yTdBPKtfCo3cuIZZRlIekkQWt+it8RC5ddvu2HNhgySOleSccyIwYn6c2DGW2AdoNfp7KB3pEeuKECCfwD4dtuMJqUuV6cFPEQmYhw6G+cfNrhJu1Ki7hiuLsSVXiQpVeZ97WwutxQi/eCEO77Xf1E0g1w/VWNSIKydumZnoHIjIlSwoEpSP4YntwWUbnXcGoGFprZL9xex2LJdzOvn5t9fYnwM2JLu67i57xZoJ6i+gYFzEeBD1Ola+B/Vn1bNTcVB2ledeyEPEChEo+xYRLH84kggamaCTyMPhPBjPY6KCDKwSBheEAXkj52P7N5scO7pE27Ib81GH7RSmwJkpON7T0z5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199018)(316002)(82960400001)(2906002)(31686004)(31696002)(36756003)(4744005)(5660300002)(8936002)(86362001)(53546011)(6506007)(6512007)(66946007)(26005)(186003)(66476007)(66556008)(4326008)(8676002)(54906003)(38100700002)(41300700001)(2616005)(478600001)(83380400001)(6486002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emFVdW44dHM0SzBUK092M0VYeElsVDZwTVJQMmd1b3VMRDRqNUZ6SC9JZG5O?=
 =?utf-8?B?aDB2T1VRUWFOV0FzQVNzcEZwbDN5VjRGa3B5WXNWellsYXd3eEZpWTMwZDRH?=
 =?utf-8?B?MGpndThrc0VCRENHZXBwTGlTdzM2anlLMCtsdnl1YWNaQTlwL2NaajlJOFlP?=
 =?utf-8?B?U045UTR2RVo4SW92WktwV04vaDJOVGlodHZ1NU1YNFFVMjlXOVdIeU5FMkhx?=
 =?utf-8?B?bU1hUTgzOUZqMldmdEpLQ1JDWTBVRXhRcE5JaGluNU04VHBHQ3RZaGZIL29v?=
 =?utf-8?B?NUxjTldMNS9tdDZRK1RLUlUvSnRBMEF4UElsTmRrZkh2TlBBbmJDNnE0czBM?=
 =?utf-8?B?QlNybTRtN3NDT1pLeFhuK0FCbXZrVWw3L3JKWHp3YUxjcUFWTmRTR2k0ZkVh?=
 =?utf-8?B?YnpjTGJ2dmdYM0tpV2NDanB1a2Zqc0VPanBabE91dmRBQzgzbnJ4VURvWlNr?=
 =?utf-8?B?blMxY1VQN3ZlMWwvZ05JNlZwdTFZVERmQ3h6TmJZbUFIb2FySHRncjI4cXBF?=
 =?utf-8?B?RmdjVEd0UmhQUzEvVDBvdG8vYk5FQzFMc3FuT0YyQTg5R0NkNitaczBRM1ZN?=
 =?utf-8?B?UGw1UTEvR09UM0h6RnUzWS9DVm1sdWxQdVJKRlMzWnNFdUNqWFlEcitLL1pp?=
 =?utf-8?B?V245QW1ZbUx5a2J3a2NPNTg2NHRqWHY4VFUwdnZPK1k3aTgwbHRLWVlUMFhP?=
 =?utf-8?B?YU5YeFJia2lyWjdRblY3VzdtdmtyQTFoejc3ZDljSzJyUjAwOEdQclM0WXEw?=
 =?utf-8?B?clN4bXpOZ0FKc1hoVW5BcUROM2ZzbndpR2dpSHFoeGpWWStIWlA2eHRRTFdv?=
 =?utf-8?B?TFIwUHozV3FoUENlRFMwbGFFS2pWWE4walVrWjNRTnZmK1FoWSszVHRDUmFS?=
 =?utf-8?B?aWNkZTdZR1dpa0VSYnBFOHRjREk1eFFidEZiMmEzZEt2WHE2Wkh5a1BwOHJ4?=
 =?utf-8?B?d29lc282MWUrNEErdXpha1NTMDYrNHlKWmhpTVlzbmpPTjRnbGNPcG15ZzRO?=
 =?utf-8?B?WnRTZFZ1d1VvMGgxcTdIREdmKythM24ybnM0aDB5dkxIT21xR2lEZnNIL3Mr?=
 =?utf-8?B?UFFxUkh3Uk1CSVlxbnJLVFJYUjRCZ3hqWjljeEllWmIyZk5XcEp0SXRhekZZ?=
 =?utf-8?B?ZUdWUXVOdFpxNEdrN28rWWp4blhNaFJZQkgyRmYwUUxDanVabEpJYXlLa0tR?=
 =?utf-8?B?N1Q1MXY5Q1dkNDRra082QktCWmdzRWpkVkNTTGRnTW5UQUFlTFYzUDJzY1By?=
 =?utf-8?B?VkdtcGdxV3duVEgxejVmUWVhOE1pZmF3Sk1MeXNvby9aVjBNNUptZmVlZysw?=
 =?utf-8?B?cDFSdXlDd0JoRzhqZ2doSU5LdzRVb29EUlZNbmlHSDI2Ump2RnI0ZlQ4Qjcr?=
 =?utf-8?B?SnNUM05iR0ViNUpqNHl6L0xnWkhNVUhmQmU3WXlXbnE0bnNTc3dLYVlHSVNK?=
 =?utf-8?B?czd1K2JFakN1am05blMxaGxRT3pvMXlZNHBVcnNqTlRLMVZsemdEYWNOQmtN?=
 =?utf-8?B?aUgxdHR5RWVXRHdCZzdXR05vUkNTdWVBRDRoZklLN3RPSXRzUVlmakYxNS8y?=
 =?utf-8?B?RzlnaTBRczdTWm52Rk0wczFQcFVXeUIrTzcxSWUvbDVRVHJXRlZzMTZzZWdF?=
 =?utf-8?B?U2F1K2FtQlV6RUhjSjBEcEtwbmZadHNQV2R0WVpLNEtlMVBId05GQlJ0QU9Z?=
 =?utf-8?B?R0NxODNHUTNhRnJLbWpEZTM2ZnVZWWRnOWpwL20rR28rYXRxby9kTmloaWls?=
 =?utf-8?B?TTZIRlJBZkdGVGlKSUJBbG5MWWQzWWgvdkE2UUY3TFc0NjFSTWVnWmVQMGtQ?=
 =?utf-8?B?QTErdmduK1ZSU0ZBMkMzMVZENDY4eEtSVVcwQ1JBZ01yQTFvcUVIekhQR3V1?=
 =?utf-8?B?M3ZNY1BvWVJBUDgxaGhmMEliMXl0QjE1a2ZrU0xKOW9NZC83WlhNakhxbW1R?=
 =?utf-8?B?T2IzSDNRL0VySlE1cFFuUUwreUxZeittbk1nR3lQQUQvRkQxRVVKcDlhV0Iw?=
 =?utf-8?B?WWYrUW5MRjhrcjFNTG9Nc1pJNDJBVDNHUUplaUs4OEFadmVkNnZOWXFDelpx?=
 =?utf-8?B?d2tuK01FWWpUUTcyamFZcUJuV2pJM1VDeXEvNGFXS2MzUjhRSWVFMDBpQVVq?=
 =?utf-8?B?Y0JiK01aTGdHYTlBa1dZelpkUmlCeGp1TmRRT2ZMb0JGWXRPN0hrS1Z1SmtX?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZEcg+AhV2lztC5vqOvDcomCzQ9Z32CcqORdFMSLHohSFLBGnVUgxLG4LzcglGesEdd31XWL8bWiS/zJ9Ezz/iG4017MtB7YKxjKF0xViP8B989v/5P3JmkGVt9BNZw8HjqT8XwHZN4lxHGVXQwByVLS3x++adgD4cNQTPdl0/tFvHbJu+1Zt/tWaQ09nWbY57vQyZT72b2drQ7tFzr1kz2gAf7SuuggmyFA8hmUvtCRbpMcECtx4dEbx5y2dnXvkV4ByqxAFAUlf/EukK106BwlTHU09OvnD9MUEssP1xTPVLlVYyTNBLbauxTfFj/sfbJXGxC1Nc5VCl7OB41JTFo9eL1Zr2qQgO7a28x+QSE3XJm6tFC0iU5BUSA3QVH21KYNWRHErYhSPYEn9Gsd3u1gM2NucL3I0Mg8nsEh8KpBbzGBxC6zt4H0cgRgbZO09VEqnuIN2FktSFcLDwBHsae7I0AC0dDn8mMQNji2ohrDxZ1+2rz1jBIkrtHs7SyZDMbo1xRoC8+o+d81Zy07JWzUZNyQOLLF+kE02SYxqUZdI2Ijj6CLL2DPLeHJ1ydQKT4jpegoPhrs4Xfmw0zCW0+YbJm7M/cfcH3kO6r73xLPwFsN3ZeHQN3RfYTEOYe/+nuvwr3DwFpoBu+qfYoimEY0IML89KLfDXyf+23t9G6H9BRnKhZnV1MBsP6e0GVFakBdM4177uUis2HTK2g+DbTo/oMiUwp5Wvyoduc+uUtuRLT9TjFZSZD9FTJt7omp0fWDybtkcR2DSMMEe5+0Fk9gCS5dKFera8Fi03ZkYs1QOph1dI6UTg7pDYXRu4PNZ4Th72f+nvI4bhKfLdb/9vg9c8dX0BzjiHe5Kvh0U727825oUR8uE8Opjp+q1xpSf
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a692bbbf-6aaa-4201-9d5b-08db18dbaeff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 16:00:01.9698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9Z1lJM/9zGA8PNy/3WIWjob8XFmfNFyHXcYEt+w0qNThwDev9a5oFwxRuS7g1CAldoA8q4IjbX9wfE91rV7/YFwLwcPrPTMEzg//ZdpTcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6172

On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
> Move vmx_update_debug_state() in vmcs.c because it is used only in this
> file and limit its scope to this file by declaring it static and removing
> its declaration from vmx.h.
>
> No functional change intended.
>
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

