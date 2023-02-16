Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4A69A20F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 00:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496802.767696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSnHG-0004Pp-N7; Thu, 16 Feb 2023 23:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496802.767696; Thu, 16 Feb 2023 23:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSnHG-0004NS-KG; Thu, 16 Feb 2023 23:02:58 +0000
Received: by outflank-mailman (input) for mailman id 496802;
 Thu, 16 Feb 2023 23:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSnHE-0004NM-6u
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 23:02:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09fe5f1e-ae4e-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 00:02:54 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 18:02:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6961.namprd03.prod.outlook.com (2603:10b6:a03:381::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:02:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 23:02:36 +0000
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
X-Inumbo-ID: 09fe5f1e-ae4e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676588574;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k6HeOQ0vXGpC1e7qr7oAkG/9iFUfuMAEnjAf9y0Pj1I=;
  b=fGQQB19+lGznoRjDgYia9m36I4jFAJ/VAjzaMuj/MwXqhoiLJKKqTeli
   camCN9Xybsyl6DP+wtqa7BCFVOTjaCa+8PdMNBwjTnncpEGI40nmN3mbV
   WnBGlprgmVxBs/pLm5fvaBnZDCAg00xytCLDbcLp6iXMV6t4ZR3WM31kk
   0=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 97390886
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A8K2SqBr9ADQ3xVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApD8jgmYOm
 2NLXGDUPqqLMGLxed9waIXi905X68XUnNZlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlB4ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5+B7Lz5P+
 echdTUXZTqZpNDpmLO4Vbw57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6QxnKjCNJMfFG+3qR30R7MnFQ3MhdVdHSwmcnml3GEBPsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZjQtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoPSlID6ty6+YUr1EuQFZBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPtfABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:221ylq3H0t9cCyengDZqRgqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="97390886"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEHY+Hds1F79GJRjKS9jYPv5+DxN5ukm8kVqbzjbs6qXT7sbbAA+9wV6dAehIDI5H7sIM8gvVgFAdI/NcyjJ+sni5YRN5F2w2J9H97P23ZrV+bCTo/QsNG59DpklGAwEEjxU4Xg1dvSFRAaDs4iPn1oZy/71EXymb30IgW5r9avNGxMAhp3PeWkDxqvL+rQJV9WWBElkm2PibXa8M0elNl9YtwN7vPSv5irKLO17Sd+84ZWvD7dsq23BjPdpVUGthN3T7LFSaqUVM5bkY5cU+ZJV5YSHNVqJBbOn9mF6gytCFwIujAtNgl/zfjw66cwycqOAD6wNR0aBNcgVU/G6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhOe6FXKu+Cni5AEKMew4GNelTLHcuzr1v3BhAjYkzs=;
 b=Dn+r1oNRBYV2AZyearqzC661ZTJg/fbqkTv4qft6PhE71ySSFdsFoP7yLYzmuRuL2u5/wQKklYpteL9wTIruBuEsaSDgLkzOA8Ls5O9FidjHkE8r4wQvAYB2mtO8+vkF3UcJVEvfCPHg9k0v6N6S+QjaNhUlSQz1fSNNtNqgcqHjI5O2+ipOzvoT/iBbTbWbwLwkKNlL7B0E635NaeVU+x46ukpATwxS1GY29ka3dVTyzsjfa1fixPXCIxM97vKl+5hi5/hI86JhYmDi7ioItkD9KTXcnd1V7Sr+/+klcb43KqiZdC9cS3ZGSTff+qomorZApPtnTX08uBZoBAIDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhOe6FXKu+Cni5AEKMew4GNelTLHcuzr1v3BhAjYkzs=;
 b=wZ79U9Gla4eZTaLZMxiV1pi9uqaRPCjVwn/mtW3gPZU4g+4dK8R+xBbXyoIeFBFLbVAjJzPTCRRwKR/UZqACNGN698uP49DZzw8OqfAk7o9azN0WCrjtPn/aN4kzt0pjn2a9DNFUZnnxzBlvnft/8ng2LJuGJfs9akFOQuEBw6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a3e55b64-8393-c236-44d1-0db050ddec4a@citrix.com>
Date: Thu, 16 Feb 2023 23:02:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Remove the use of K&R functions
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230216224438.705395-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230216224438.705395-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fef562-cf68-4399-4421-08db1071e4d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wQKerjfXTU+pX09EpXTBPHXeEHR8tPSkV3udtlN+WF2vcGp6cWmB8keUVsAWtlMg99X39VaRHZJGb1aPz9qTp0E3dcqYeMyw9P/jUMqpPq2vLEfZJz6xFtX6xD6+Yx0m5KU0crVkdk7MfLKw7CVhJX5Oq64L9DeV4bk3KevkUCeitGjxesseM91x1exmP4oXq93YMA2F6iyxdbA4TiK4V0jIpFDdfwnDpjpN0KRlqsV9nI4oq9JeGJOCHRPq2WLmRGFdhVTCCiMuJKL/vLK+ExIau1YPdD7cYgb5TCa9q0SLWJ7lhy6jWMq964WXvtF2MYetyEpzhDv9mvb3Sgt4Coz2sNJ3QujvNL1a7rgRe2Wko6KayzhykwYURy3VVovSfZ9QmpbnWA+esdsOmtEncrEx+RM7yBG/CVAFe9a7CwiA0tMDqYxS7nPHMrfNpz4fDeuLinz+b8bYVKJwEijf6umv4ldQV7SDKnOSJtQk0RGxxJFSgRiN4Ar0s6jNZ0VMTdeLve8Cjt3IrukCap8wV5OYbGJ872IUUQJu80cwXpzLUMQ+Hu7ov+yK/Em4sg8XSPejOprvS6x3ZeUEWqIB/bG5SDzmr8jAomYR6+cy8cUROyyA1vJ+QfrvM7PkE6QpUPj+lsXUHAzRrOQs0qbtuJHmZ1rCUjHrNQehqvJ9BnRe/t6e8w3cWBK+KVpJ3UmyExIfwpBoDRYR6WajztGJHZUElu3Np/DDMm9TM2lrivM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(82960400001)(478600001)(66946007)(38100700002)(4326008)(66476007)(6666004)(6486002)(2616005)(36756003)(41300700001)(6916009)(8676002)(8936002)(5660300002)(66556008)(2906002)(83380400001)(31696002)(316002)(54906003)(31686004)(26005)(186003)(6512007)(86362001)(53546011)(6506007)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1cwWVZ6NkZqUS9uQisrU2JLbkRjNGlRV0FvUUVOSVJZNDJzTitZOWdrNFdY?=
 =?utf-8?B?RU92T0tBM1A1ejFuZHlCancwbUZKYktzaFdQcFpvaUp1bDYxV200N0NxRFJH?=
 =?utf-8?B?WUVJaFp3dThsMzhWMEJ6ZTZJbW9JVVRJQmdwRk95Sll3WWlPVGZqaGVBRmtu?=
 =?utf-8?B?Q09zaFFlT1NSQkxuVUxzb3B5blBzN25qWUJDdERtZkJKakx2YTFrUC9CNE0z?=
 =?utf-8?B?REZMV283VXBzSVF0YWh1MEdBbUwwaHVHRTBHdGduK1ZaSFRkM1d1VzFybWRD?=
 =?utf-8?B?TGhCUmtrQzR2MUp3bHRBSnJ2YzBSSjdxOVJPd1lPenNMVTFiZ21xYmdsK2Zo?=
 =?utf-8?B?RUxKYlJIMlJDNld2TWgyaHd0RGhLeUdnU01jZXlpMFplTU9NcnJjRnFhYmdk?=
 =?utf-8?B?STdNMityM0V0ellxbTlSd3d6Qnl2VE5yV2tuVXVtOS81OGg3dS9sNGkvMkVs?=
 =?utf-8?B?cUd0TFFGVmc0Rk9MdXRybWFpZnpzRXRKQ2dmdW9NZTZDN1p0azhtQWU4YTlq?=
 =?utf-8?B?U2tOWkZCV3d0QUwwZlJVNW1IcUp6dkYxaVN4c202M3JwVGp4WVlxcWk5OHNM?=
 =?utf-8?B?c0FLcVRjWlNOWm10VDdlN1FTc2JGVVVrdTJNbUsvNjNibHRCYXAwVlBEckE2?=
 =?utf-8?B?bEo1d3FLYUlOVlNPcEEwcW4vTnUyWmh0NW1SYTNtK2JaME44eGZObzFScVgw?=
 =?utf-8?B?cDJsTUhMQSs2UnRzVlJCZnpIYjM0YWNuUGJlbTNRN0gxa1RZL1VBM3R4VGh4?=
 =?utf-8?B?dkt5U3p0a0RydjlwU1dScGIyWWZTYTlRNklycWxKRXYyL0cvVi9SR3hEY3dT?=
 =?utf-8?B?Y3NNMGZuSW44NFhmU2tWeE1YMExiN1g1V0hwM2xmV29xM0pBbGl6aUVYeHdU?=
 =?utf-8?B?dFlkTUEycmpOSnRMZ1F4OVA3R2JNbUdVWlFiWW9lNkI5NjFjR1ZDL0JoYUtr?=
 =?utf-8?B?MzRwemR3R3NkVmNNNHA4VXVKZDNhUmlWdFIyZjlWcUpqWjRabjBGY2xjZEIz?=
 =?utf-8?B?ekkrRzIvMWtpTGp5MFRaVjYyVFB0MHRseklIOS9UR0hCb0E1RzZMMlAwRjZL?=
 =?utf-8?B?a1hGVHVrbjFLV3M2WTcycFlIbWZxUGZpaWNDYjAwdTFUZlFaa0ppY2c5OTJ0?=
 =?utf-8?B?QWlyMHA1bHhLRzVQVVdjajBGdnpNaHpuN0psa0l2dUlNK2xLSjlwNjFxQ0NB?=
 =?utf-8?B?TzZubzc4aFBuYVJENTdUV2NCUkVTYUQ5amMwMUJ6SVNaR2twd0dnK1BhQTU1?=
 =?utf-8?B?SXpqWXE2K25NT1JtaE9vRStzVlVwUkZqRnlYazNUZFpRUmpQU3ZpdlU5eHVs?=
 =?utf-8?B?ZDBrSVdsUnFxam9jNXNPcDVlUG45aFZ4MVdBc0VpdVBYUGZvZWJKdzNQaE41?=
 =?utf-8?B?c1NPSnVYVkFXSmcxM2M0TGtHK05pdTQwaDAvekFrdGpVSVljWnp2NUJqNnRG?=
 =?utf-8?B?YTdJeW8wMjZCdnE2SjFJVm9lenFadS80bDlxQVF4dnNaN3FUSDhvTlZIUEJI?=
 =?utf-8?B?a1FBeVF3dHhlcVJpVVdQdmlGYzlHU2xoS0NXa3NQdVdldjgvekJKbVhYMHR0?=
 =?utf-8?B?YVZoc3VtNWt6MjlWcXFMOUR2K0lhWTZJdkJ5MWxyWUNGcGxlblZYODk3SEc3?=
 =?utf-8?B?cVo4SmY2dkZVOVA4RzJsTXpTbXp3T3M2UUZ3bkk2bHl3c3NJaUd0THowNVZD?=
 =?utf-8?B?ZUd5NEZLRjg0QWVScy9UZk9reGNvWFZ2R2ZRa2VuTVQyQnlwcFZDUnpmMHJH?=
 =?utf-8?B?Qk90SzdHRG9MeHZoM2xJOEJlZVJyUHV0dzQwbW8vYmg5eUJFRklBc0JUZHhV?=
 =?utf-8?B?TzBYQzF5T053Ymkwc2F0UkVzUUswRW0yYitCZEI3Mmg5NEpPdVVmbmxab2FB?=
 =?utf-8?B?Q2xydStEdkNZblpUVm01U1RPWlpLcGRKUVU1TENKNE5qT0JLMUJrSXd1WDlZ?=
 =?utf-8?B?c2FhZ1VhbTM1Um44N1NRR29IS21vQkF6WmVoRnBMNTJiN2t4M1ZudVNhYjJN?=
 =?utf-8?B?L3U0cjF5cGZZK2t4SmpIMlNreVQ4MGVxcVlJQjNEZFZwbkFRSnk1Y1YrM2ho?=
 =?utf-8?B?SXRzdWVQS3VqUC80MXRMdDlWMzNOK0V5RGQ1cElNdUp4VWY3TjRiQmFGcm9l?=
 =?utf-8?B?ZGRHU0hNRm91RHpOZ2YrRDZwV2tSanMzYW41M2FrS3BQMGFKZHQyamhxTzc2?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DprOqILDj44bIJpVVGIkETB2pT+3AZp2k1dl7DEXQD4fGeGOG2oOhbVu98PSeDyDT4odAN3mo11XMRzVwbtUESp4zHaMLSMmgcsxokhOCnwlDJ0fKDTAA52mLuIRUkODsUAPtbWNTR/fvaNaV7g3FWzWOeXw19htEk3D/nVKKJeuJofwx8uso2ePz9sOfaUKMHfzoXlRWcsiT/W4lFyhRHHGj8yUGPQUhBV6SK4qWbApaknOWaZhvOlyhkXD7kBqCz+u4+BMnDXinADOzg9UBKK8VELH3hy/uA/OspIDzTELDRFpgBdsC2dJfMaAWuzSNncKG+IVHhR0hmpEbxZpJTsiGFAWlQYdVQyjfPxHpxNBT3dkidmLaJW9z8zoiiWq5HcxNW1/wfdhUasINn+vK8fFfzonCur+dpxQC3rnZnKNNxStpC4dt7HvZX3EKTTOq3rtoE0RZvdOMnDpd7qRg91jmiXVBeh2xmiXhX5HI1V3jMJqT7/LmI7sftDnS1ms18jaWKokRJlcucZY3tBhm6kp0uVAj0MONuAJmbWcnNOEsxy/ahM3T13A0lzJgU6MgRe6hy6E+nFZEmbGIzN3LHDzteO/cY0uT8fmV/h+nSP+qIzsdjuBqnjkTyd9wmnGQnYWbYqwkuD9US5PrJle9rzbFxEdqjekcMKtTzRWTcS+BjxL1pxxzVVemOp3H4rEXLfo56ZdDix4oAreilKbZZNqjLWK1f7E5ymGtx/eHMOyGgsFAfZ6T8Us1fwp6F3uaSSWaXRTO5thRci6NwkzG0sAV0TNKTUtgDZ8R0k4scVI/qFEYwG+SsSRy1k7HFg9r4q5+/pIP5pXZnkiwzKaOw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fef562-cf68-4399-4421-08db1071e4d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:02:36.2425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6ikZ7oPVZn4EBpsOWeXOwlpnPRWjyzpMS554GYiGt2Dye4SJKa1Ijp2W9AaVCfBk55mKW6ig0z1cijwuP1K95R4iO9PvdsaAtTQ5jhEbiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6961

On 16/02/2023 10:44 pm, Andrew Cooper wrote:
> Clang-15 (as seen in the FreeBSD 14 tests) complains:
>
>   arch/x86/time.c:1364:20: error: a function declaration without a
>   prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
>   s_time_t get_s_time()
>                      ^
>                       void
>
> The error message is a bit confusing but appears to new as part of
> -Wdeprecated-non-prototype which is part of supporting C2x which formally
> removes K&R syntax.
>
> Either way, fix the offending functions.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>
> These are all the examples found in a default build of Xen.  I'm still finding
> toolstack violations.

Apparently not.  int cf_check vmx_cpu_up() too.

~Andrew

