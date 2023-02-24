Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11546A2285
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 20:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501527.773312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVe65-000303-JV; Fri, 24 Feb 2023 19:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501527.773312; Fri, 24 Feb 2023 19:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVe65-0002xf-Gj; Fri, 24 Feb 2023 19:51:13 +0000
Received: by outflank-mailman (input) for mailman id 501527;
 Fri, 24 Feb 2023 19:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVe64-0002xZ-OY
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 19:51:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93d9ed52-b47c-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 20:51:08 +0100 (CET)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 14:50:56 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5262.namprd03.prod.outlook.com (2603:10b6:208:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Fri, 24 Feb
 2023 19:50:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 19:50:50 +0000
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
X-Inumbo-ID: 93d9ed52-b47c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677268268;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dEGrEgzvh+KXhdmODzmXHYdU1IPPQ3aQQ45GA7ydIjw=;
  b=V+N6iBYIhc4HA9pEDwnpE7qf6wTIjf7VOWJqtZ0oYye/ml9XN8ZeOcau
   Fs18l8iAbMgWuUCpMjGl9HpK7SLXCD28kteAbUYe9i0l0WQDjgwfNAkhC
   7gKzqkmK1IFsy7jhrUgfBUt2mQQKx36q0kK21mCmqEi0DKqi7YmmzMIH0
   o=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 97847154
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HLVrCK+3zYrO2l+9XBtZDrUDu3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mcbWGyOa/iPN2L0Ltl0OYm0oB4BvZDWyN8yTQNuqCE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oX5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklx5
 b84LSBccCuKivi3mYKxZsp0pP4seZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCd1CSOLhq6ICbFu7300IUjoMTHiCs6OhrXGbAPR/D
 UAW0397xUQ13AnxJjXnZDWyvWSWtxobV91PGsU17QiMzuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8rzm/JCwUJm8qfjIfQE0O5NyLiJ43pgLCSJBkCqHdszHuMTT5w
 jTPoC1ggbwW1JYPz//ipQ+BhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHXlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:74Tslq4XeBoc0qcrmAPXwNnXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgtSMc9wxhOk3I9eruBEDiex/hHPxOkOos1N6ZNWHbUQCTTb2Kg7GN/9ToIVyaytJg
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97847154"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJ0tzZ+WE6l+RYZRvOmJdmk9tyYy7i8TH66sMaJ3ZMjidMXVbVTn/fso+4tx6r/dOXiewgI24TKYkkb2l+2ju80dqc2OZFDf1Od+Od+LGSw8rf1QgMk5Wix/NyZpKpwtZkR+ZsXM6Mykc4I+YfQTRM6kpmt1OkWbf8YB3rey7Rkpy8otSxHOAtD8pkyyC7+L9QHShiJBWsPCR4F7ljpnRIV7Y2ds0yIgQpJGSXIw3DNpRuSP+vzJ7mzjhiGMZSMcYqzkPETpNFFtInlhTYZD5Yloo3tNsHTpQwMu4ws5OYetGausFz5bQtUpJCoZO05ZVYnmtUTcz/jJqCScV5YX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEGrEgzvh+KXhdmODzmXHYdU1IPPQ3aQQ45GA7ydIjw=;
 b=gH+LtXQ1XHlQKEc/8MnLpYAYU2D0ds631BV+3rXK/U5GhCWtva6PndmuHwnuzW9tp+RY8qk+BTJEyarZtnrynBtZ96xfGLWbZM9YFMjWL/+jiM+L2GpF52QJRepWkQWpsTMChRKxRg43Pvi4Ws/ixBeGEeOUkKHZbh9sIwzISpGEu1qYyfEByACDHZHt/dnITpjnzIuZtZAMBZQZnelIKNPg4FyQY5Wb9N7hrj8lnvjyO5lj60X15nZWPUHbvZPRzv7nsvZc03k3+32fbFRNDDYn4DaRVxB54O1GS4Av3EhHk76wwczHM+wGp7N9xkVIrq9JQEYK3tH3uub4gY8vSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEGrEgzvh+KXhdmODzmXHYdU1IPPQ3aQQ45GA7ydIjw=;
 b=RYZKUeqVErkNu/eVCfaisNqmPCgbm66EYt12gSV2ckCu0Af56m5rK5CpEb2PGuMN/6ZXACpQ8sKbzgWncwf405tdVMB82yhXCcSdoocOkNGjqLrQ1mgWednVkFxOlmjH6JUWUl9DouU42ELhrF3W0YAf0AWUhl+R6H+D2yjceFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e50d5dcd-2345-9252-9315-0df80b3c529d@citrix.com>
Date: Fri, 24 Feb 2023 19:50:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 04/14] x86/svm: make emulate.h private
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-5-burzalodowa@gmail.com>
In-Reply-To: <20230224185010.3692754-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5262:EE_
X-MS-Office365-Filtering-Correlation-Id: b96e274a-ee5b-4b13-a472-08db16a06e00
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3EcCCNmHQyWmcR3Ae2JhA9v0wKS/3q/quZJZiguNWtvQjg2cTwujjAHU//+IJZ3eZdDLxkjKfePvJwXd0KTMUyqx9EMJ6TDMaGHjUV4EGD+LBDx8XVPQlrjC1vrm+VeKvdqBjRNJAWI+S+wcR1jkEvWgOzcZNq5KAfEf9QZxjYMDxIXCMh5DLn+XjNpwy6/JWeyu+l4HdR6Ro/3kOuwGknTsVDYyh+UGPXXoQdhDDgkp8x5gtbpwYAXB6y++KXej3ttsk7yWJ4rtiRdi0ph3ZGBmH13qTbncHUvbQ+h1j0Ucl4miC5jiYq/j98juwxjru/wvYPpAjoLazo438HvngbF4tEb/UaGFqEjdEGPFei+Eoqmw7eSbsR4pM5sQMzQeO7+ft+l1v2LDDZTYxTktDCapRl2BQhNl2tppDL3hcAAhnC7IRsDh0kl3odaaryw6zGY7PZCkNz72GVF2UfGDVCJ89IO/XWLG2LrrQVPWO5ILnG6H6E5tJXKQSHTlyNH98xAcClxAL1DPz6yIszQ0L6cYzfx+pQr5YrznIjYmYKKtvo0mk3KhrL0dN11oiXExJ2fPAWIhqIgJohvRfmJHa6jBI6lvU7xoZzmAb+UNtgRl9uGp9uSXrsxhdgY2MmstVyw5Ab7gGcsrXWL2lCvyJAXgGZXtmNtxJ5L/N7g8fkM2Mxp8octJIB3qLmhKvcnoFznSNvlcsr/G7lqGuKqVe52TuKIupTrUJ0J55xg9N4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(53546011)(66946007)(2906002)(5660300002)(186003)(38100700002)(6512007)(6486002)(26005)(6506007)(82960400001)(8936002)(31686004)(6666004)(2616005)(4744005)(478600001)(4326008)(41300700001)(316002)(86362001)(66556008)(31696002)(8676002)(36756003)(83380400001)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG91Q294R3Z0bjZZRXpJd2hscGhCUjE0cDNDalRidE80RHMydU14WndwT1Bj?=
 =?utf-8?B?SHA4dHU1TG5VU3ZJcGMwNnlZalZYVVNReDZKNHpubkxXTFp1Rm5Ub0hVM2tY?=
 =?utf-8?B?MUZBVjlOQWlWQWNHUUdNaE9HbEpydVJ2R21jY2VpdDRqK3hoSWpLRllSS29E?=
 =?utf-8?B?S1c1NXF0amZ6M0IveVhwa0k2VjlyQUMrNDlma2l3TzlUZk04MjVnUXlBZ3Ru?=
 =?utf-8?B?aW5CU1Y5b1VnWnA1elVnajlRdVZ1bFNwOWh3NFF0bUo0eUhjM0thUGxzRi9H?=
 =?utf-8?B?dUJXQjhtUHZNc1ZuKzdIakJvNUtpcGNCaDdJSGM4YTYrSkhoWXVYTHhCaEU1?=
 =?utf-8?B?ZC9kbEUwZkNMdzdoN0czZ3pxSHFxN242aTB6azVQb1Q1L1ZpYVZLN2xPYlNM?=
 =?utf-8?B?VDJBdVIybHZoUitmQzAwU2lRQ0xmTlYrRW1kMnMwdDMwWWc3eitpbjIrQkRI?=
 =?utf-8?B?eDNuUjZhcU1MTlFTdjI2YUpiaDdvdmluZU43elB5Y2xxR2k4dDlRa0xvVW9q?=
 =?utf-8?B?SC92VkhCdWVXN0hNV2dubFVUQ1ZuME04NnlsRUtYK3dtei9YUGF4UHlWZjZO?=
 =?utf-8?B?c3VvK0NEQ2FUUDFxTHVFUHUvc3c5eEZkR0lPRXM2S3Ivc01wV1FpN2JudWFr?=
 =?utf-8?B?ejVxZ252Q2pwZlFyN0o5NzFLQ3U3T3pSVENuWlU2VkdnQXRrSjdBT09TbUJ6?=
 =?utf-8?B?RGZGcmc4Yk00R3cwejdwVGNXZnkwMTI0dHR5Z0pueU54RCt6OEVQVGwrckN4?=
 =?utf-8?B?Q3lVRm9VM04wUVFuSC9GcG1MVGdaalIva0EzZHBpY1NhWHd1V2swQ0NUczlR?=
 =?utf-8?B?RldNV2pVQ1p3WC9OQU1iY0xER1BDdEdKSExZcGtOVytXejFiSktBd2ZkSWln?=
 =?utf-8?B?Mmh5TlV0cnJuQllFWnA3S1oyamR1KzZ1THoxQmNmc3pROFgxRW5FK0o5enNK?=
 =?utf-8?B?Z0ZZR1Z4R251dVlUdjU5NVNrRkdqdTkrbTF0eTd3c1liU1BjRjRoQnpYY0dt?=
 =?utf-8?B?N0NlRWlTbkIrUlQ5N2gyeElsYTlzVHBEcmtZUUhhSnEvdFNOWHpBcll2QVRS?=
 =?utf-8?B?a0d5VmYzZVB2Nld5WURpQUlTOE1RQmZmUW9kNkpRakZWK2ZtZHpRTjRVSS96?=
 =?utf-8?B?QVdwTVM3dEZLcjNNbHY5VjE5eER1VmJLRHZocXpKR1V4dGkvcmt4M1ZpSEJy?=
 =?utf-8?B?NHFqbUF3TUZOOUZRS1FkRHlQMWtIQjRWL2tjTFloRHZjNmwzTUwrck9GR2Nv?=
 =?utf-8?B?K3ZTd1h4VVA5VDZadjFlMHJ4eW1POW0rNi9nNWdaaUJld1FtWWtYMjUzcUpa?=
 =?utf-8?B?ZkpNWlNVL1c3V0RSQVFBS2daWlNZUDVvWEJ0ai9VWUZOTTVrS0Nwa1hWSzFO?=
 =?utf-8?B?T09sbHZoT1J2UmNyYS96dEJ6QkNrNFp1dDAyTVJhVUt0WTVZalpVMFhrRnA3?=
 =?utf-8?B?MUluZDl1aGw1TGpCSm9CcUVsc0Y2M2l0ajNzRytJaXJ0OUkyUmlqRSsxd01u?=
 =?utf-8?B?YjlxcmVFVWRsSUEyeTBxQjFBUVBuTmkvaFNFT1E5YXk2Q242clJzZ21YUGNo?=
 =?utf-8?B?Zklndk5KcnZaa3VNY21XdkFnSnNNbmtvcElub2w4Z0l6aXpJM1I5RDVKR2hr?=
 =?utf-8?B?QWtpTzEzRlhSTlUrK0ljdFBZYytFVEIzV0hYcTBzS3JFV1FscG9VQVdHbW1L?=
 =?utf-8?B?b3QvK3hNdDBiN01UK0hFVEpwOTducmhoeElzaGswTnhiejcrZFYyTUpKc0pC?=
 =?utf-8?B?RTB0TDB3U255ZW1wc0dYUExOYk1Vb29HdTk5a2VGL3B2elIvVXl0NENsMXIr?=
 =?utf-8?B?ckF1c3lSZ1pPZG1ORmM5cFFUOC9hOVV0MEZBQkUwcXN5QXd0bXFTRHc1MFpF?=
 =?utf-8?B?NjVlYmpXVzFOeGFYaWhpUVdSSzF0OFErNE9nYksvbCtoU3JxcDQ5WHBXY01a?=
 =?utf-8?B?SWI4bnlzR3Z3bXpMbDJoZkw0Z1BEMW1HWEsvYzlHWTJEeEVDaHRLV0NYNERI?=
 =?utf-8?B?RVJ1TVh5VEpKanYwOVhnQlpMOGV3RGxoQys3a3Q5WlFtVC9PQ3FzRFFkdWpH?=
 =?utf-8?B?OThCTWZ3cU9EVUNLK1JNOXdHclkxVzc2c0d3Ny9lb0U1ZS8wMUZPYzBpZC9H?=
 =?utf-8?B?WTJONHZlWWJQT0pqekZVOWlKemFDS3JPWU43Y2VMT1d2MzlRbUE0ZE55RVVh?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fUq+eJXeAyaKlZKMfLiYPw6rSJoADhbttNIKpbGvsLu8MnpoH49xJmQ5GEsoXgeSf5t5SN3bNCVuYxwI3EDtsGGt5SiyTv/zt37uam5gc4cgIwip2czwNVzNXKDqB/YZdR97w4LlXJCoc9toWipzhUhta/L1u3x2OiCaXIKVfaWAA2/lQayXM+G9xT2FTiyXfqWYlAiWSkjeZtajdB/NHH/WmZ0lfMsVBuyrKkUiM+NCYVS+kiT9V5jIoPSFJ7JGoGo/K8eTwShspxu8GIt6cwz6jSEilISnEr9I5e7cywUI5i/DjX5xTD8+w6EpoqzMKl08qF2Wc9Bfd7zwq2EfZkckjlTcx0ikn0+TJ9saRvtHWhOmiLPjrjpV/k4d+GtC/Cw4LyVZI+LNkzr96YP1Ecivg147JNpIadWQD06vQpjAFPNOqDx0wb0ky+C1ctaYyXCGOk3057i8jNyv2yvsJw3BoULkbjpnT5b+mw7VJkh0gRUt+nZqWN3wpBcxmn/Xt7qzG7v3YaDl1RAjJ7Wl+EvHWRi+IuDFmjCOL3DhKgBPJY9fU+q/uLYhi57Yf9MFQ+x2Laabx8bITysS8ttZSzWIZR9S9hNcZr6Ehvj2uhs3LX9Yny21j95vrrRXU5+1eIvoK+x7hFUoVcMbKsGAnWKiAkVzKyPLLzz+S8AiAPdM6qFBMuLL7SfnBX2UcF4P3x1EGIyoysC/+AT1p6hulY4lqUNp/ScHHyIuY1OKkanAyW6tvS94rKxGssnoJS1Xtkjif0klqI35kkLddgjb7lR3rpg+8aaFl3FzlB4i+z2GF6oVEROJfwBY95+Wt+sEvQ3VzRQRyEusc3OKT4zGdsoow0nP01EoateTTRoUf+o=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96e274a-ee5b-4b13-a472-08db16a06e00
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 19:50:50.2139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDnNhnUdVBiIsfpK7JcfB1Nqgujx6+l8Vhm0m49pJmUXzGVYe7zijqFJIUzxUhRUiAMADYNa/yci9H5Qw9OSCnRLXUOIqjI9omsX5i4rdxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5262

On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
> The header asm/hvm/svm/emulate.h is used only internally by the SVM code,
> so it can be changed into a private header.
>
> Take the opportunity to use an SPDX tag for the licence.
>
> No functional change intended.
>
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

The name emulate.h is rather stale now.  We used to have a full ad-hoc
x86 emulator in emulate.{h,c}, before the work to use one single
emulator (rather than the 4(?) we had at the time).

Nowadays, it's just the the instruction length helpers, which you can
see are wrappers around x86_insn_length() which is the main emulator.

Given that it's now just two function declarations and a few constants
for the instr_enc field, it would be better to just move them into the
private svm.h (like I did the asid declarations) and remove the header
entirely.

~Andrew

