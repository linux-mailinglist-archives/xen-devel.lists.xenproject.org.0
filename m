Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4508B6F83DF
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530354.825936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvON-0000sT-Vu; Fri, 05 May 2023 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530354.825936; Fri, 05 May 2023 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvON-0000pI-SR; Fri, 05 May 2023 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 530354;
 Fri, 05 May 2023 13:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puvOM-0000pC-NE
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:22:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f87e34-eb47-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 15:22:31 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2023 09:22:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7486.namprd03.prod.outlook.com (2603:10b6:510:2ec::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 13:22:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 13:22:18 +0000
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
X-Inumbo-ID: e2f87e34-eb47-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683292951;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x7eLhQmfN/cz2GOpic1QkGwjjsDjXQ0u/FsR7r7PqTI=;
  b=K+nQJwv+2Ik1a/j64T5Mnz4wVd/mO1v2XzDEC/vRmiRK1/yIfPOWr3Pv
   yh++Ql81D1AEqwZYwrcs0G+rn+cfApgjDRtbZ1rW3dYpEoAV4x5qju7lW
   hM6czrOjLSCsvprDngKkkLJCTLHjRS+Iw7TyfqkFwheyoQ2xO4pgpxLFY
   I=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 108403924
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oxVoUa9LC4xb5vKLed7WDrUDVX+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2RKDzqCPveLN2X9fNkkYdu19EpQv5LSx4BkSlRv+y88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkQ2
 OYnATkSfCmGvN2pzY+VcMNchZoaeZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpCSOXjp6Q26LGV7nUdJzcPFmPkm/Ok1GOuSvtAK
 kxX4TV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yx2CGmEOQzpFadonnMw7Xzon0
 hmOhdyBLSNrmK2YTzSa7Lj8hTGvPSkYK0cSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1VXOgjbprZ+QSAcwv1zTRjj8sVw/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:CNfzjKyTcShuYgmpxxquKrPxF+gkLtp133Aq2lEZdPULSKylfp
 GV/cjziyWbtN9IYgBepTiBUJPwJk80hqQFn7X5XI3SEzUO11HYV72KgbGSpgEIXheOitK12J
 0KT0EcMqy/MbEZt7eB3ODQKb9JqrTqn9HK9IXjJjVWPHxXgslbnl1E422gYytLrXx9dOIE/e
 2nl7N6TlSbCBAqhhjSPAhYY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6S071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6i9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFD9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcIa+a
 hVfYThDcRtABSnhkPizy9SKRuXLy0O9yK9Mww/UwquomBrdT5CvhAlLYck7wY9HdoGOul5Dq
 L/Q/lVffh1P70rha4RPpZzfeKnTmPKWh7CK2SUPBDuE7wGIWvEr9rt7Kwy//zCQu1D8HIeou
 WIbLpjjx94R2v+TcmVmJFb+BHER2uwGTzr18FF/pB8/rnxXqDiPyGPQE0n15LImYRSPuTLH/
 KofJ5GCf7qKmXjXY5Pwg3lQpFXbX0TStcctNo3U0+H5sjLNorpvOrGd+u7HsuhLR80HmfkRn
 cTVjn6I8tNqkitR3/jmRDUH2jgf0TulKgAWZQyP9JjvrTlGrc8xTT9027Jk/1jAQcyxpALQA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AMEPR+WtWVZY5zk8xt5yajxDJ6It7X2fi5X7PMXa?=
 =?us-ascii?q?9Mll2RYC7c3Wg+/1dxp8=3D?=
X-Talos-MUID: 9a23:+4WkGwas/RcT1eBTrjHDrighDJhS6bnwJVAcuIoHu4qfKnkl
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108403924"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC4FzQsDZZ3cSFtsloVOCFyLSGyKiJWL9ofYcBFSqDcrRo+SEpBTcc457kjogj4+bvfex1ZLzi5ROAlvJ6uJaAmdw6hdsqTd0+MZvOECSm56PcDWcf1SCO6RSymQnvIQg59M0F0qZJ9ZLPD7BVyMNJ+C7efRUM1oBr2E006yXwFfpRczEIc80gmMZI5TRFzwEUDvSDPghTQI+DI+ut+z3Ov5/jm/+8NeJacpv8C+NIO7d5rPx4zsksL0RHsR9vtsNmF1tkEKr3RIFaf10uw7euRDlQCA/uWEYEsmmQH3XEOsb7QNQO6yUecV+b4wvoAtJJmq3wh8qUb/RcoUTgIIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e9y5U85C5VI0YC+fuBdqDQLKy7qs2gImICHi/mfPZw=;
 b=jpOFy99TTmb4Je9uBnUIdusE2vGRaX+kwdSi/gJqxwwKJK7BY6FN1KR/LYq2qNvLEfnUbn1O5xkPmT9XxONm/Z20VY1MzVC02hzM4J0pD8Ge2y8EaVnsLbgs/s8kmIgYL5NsQnqCi28TYCxsppEzjLRDpb1NQz0VsgplcoTSmpkbXBo6AATuiCx1p3szq6VMaqaoqMz7kurTRPjVytpdZ4uC3nUtoYplmo1vFHG9LKxhEc26JbN5WjCtjlT6XmTORITI7ohsQf3bVAWOy1czcIg77lNj4MqDwi4CQnY/JIdTHzzDtxmuBrDLsQuXFOVWFLm93Fak1qmczO1teJjpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e9y5U85C5VI0YC+fuBdqDQLKy7qs2gImICHi/mfPZw=;
 b=R+mm6/c3TJQBLtocLGQayx7KupuyLHA14CrKk7jxFMvAnEBywi8bx55nQkkEs5JHaLG/md0RfjKQafhRmifdKlXQ7zG+0BdzYUJ66FivF413vh2Gd/h68m92s7qO/0HCWEItYMzoa0UBzSTHdAv+kT23o+GbEmxomnCzgkHPT+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8fa2cf23-4832-a033-cfc3-e3225eff0047@citrix.com>
Date: Fri, 5 May 2023 14:22:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] LICENSES: Remove the use of deprecated LGPL SPDX tags
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
 <20230505130533.3580545-3-andrew.cooper3@citrix.com>
 <40d70f11-37e7-ff29-37c1-a94d3e286455@suse.com>
In-Reply-To: <40d70f11-37e7-ff29-37c1-a94d3e286455@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0221.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 4695c6f1-8d1b-479e-718f-08db4d6bbf92
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZqBiaZENIhQBiX6cAREVb8hfiSgJHJpBtuoEKuh4nsUHfHlNpEVG7Lj1aAk9ElVzsxsamryJd6348OetPsuhnOni3EGWirAkfUAgv8QPYb12tcSxB2F63aVy0FizS/ksIQW6365YKoKcdTFLftY+XPgryzNJ6+HM/P89offRmCA69Qnvagjpm48yPmgQZfrLWYOalWEHVRxM/MQG6InPRbJwNtv86GUl0ptNyoMRu98SqXYKYqeIwKWWraPisYITw1SWgcqhDzn6Rfjz35icNy6php6ov8CuINrEfEHi2i252nECOJ9PJxRj9zfEW3YgtMEmcJqb4O/sXC/ULW6cqwUJZfUfjtlTr9Lsdz7Jdes6YtqZHWC0yMeDSxV22dlCZp5wG0Wf9BTlWmbUU29zSHu02IyPVxiSj/zlYc6bS7T9w6GaTMzoe/tKbw1TaYkFE5D7WaMgZ5T5QgQxA8TIbCugPYskJ9omar/S25nORpxDHVtw8zmMnDtIuR0DqPwCjLB+Ldi/l0f/NKarlZMPOpbU94g8XEp8sJO1PON/pLVkKOlYcJYdDHUoaz6sNnLwhpkHBzO+jbWoaljIrxJP8ad4zmZiHDfTizKSvWCzI+m9yYK6Gw2KO5cBo4v5pVwl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(2616005)(6512007)(83380400001)(2906002)(53546011)(186003)(6506007)(4326008)(66946007)(66556008)(66476007)(6916009)(316002)(41300700001)(6666004)(54906003)(478600001)(5660300002)(26005)(6486002)(966005)(8676002)(8936002)(38100700002)(82960400001)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnRUeWRPNkZCSUREY09JN0diNlZtVEU2V3AvRVlaeC9KTTQ5NmE1Sk0vc0lH?=
 =?utf-8?B?VW1KeXF5RFF2Rlh6cUs2SU53eTM2VkFva0M2TGhDZ09UZlEvWkN3R2xFNVlE?=
 =?utf-8?B?d2M1VDU0dUdLTVZ3VDIzT0RGaEZGYndqeGpMS1V4d1N0Ynpud2cwRDE3M0ts?=
 =?utf-8?B?L09oK3pnVUN5MFp4c0FJek1pcXFiQm9ycWhmTlgwTE8zWkJnQzlta0NBdkR5?=
 =?utf-8?B?WGorVzFuV3lhdC95SFc5Znl1NitSTHFGbmNiQUtEMDZXc2VVN1ZHMVZtR3NL?=
 =?utf-8?B?b2FrdTdmWHkxZHE0L0dGRWc5aWQyeGJWaUFyTFVKRmZMazFScjRZSVJjTzht?=
 =?utf-8?B?VHRiQVBkRFpyRFMzUDBQSUs5VzRxVEVxaDVaMHhxRFB3Y1dRcU9EbjNuMmZB?=
 =?utf-8?B?Si9QS01aZTJtamFsZWgyM1JxUXJoQU1Ua0ErTytQQUczSVFUQUFGTEFyR3Nn?=
 =?utf-8?B?ZVVxamxOV1hOZ2NxT3NIbm5hL0pGd0Zpd0ZZaUlDdCt0aWMweG82Z0JGWVQw?=
 =?utf-8?B?SC9GUm1aelozTmt4SnFSRTNZby8vamFJS3BoL01rbHgzREVNN00vb0Ixb0xM?=
 =?utf-8?B?L2luZzVXdlJZVjA0Vmt5cUt5MjVDWTlqdmNtV3dGRWRhaEFLVUFYRTV0aVA1?=
 =?utf-8?B?MVNnZ1dJNHozak4vWWZYdk5GT2dXSGtIUUJCNTM0RHhyQWdSaU5ld2UzMWsx?=
 =?utf-8?B?ODU5eGkrOHdtTzdnU0VyWnVFcVJ4NjI2dHdSMWtZYXVLK0JKZHFESGdDQVM1?=
 =?utf-8?B?N2l6QXY4WW04cG5oU1NtV3RVZ0ZybXl6VUxmNnhJQ1JYSzJOYi9OaDZWc0F3?=
 =?utf-8?B?cmJ4TFQxQzdPVnQ0T2JxK1ppTis4elBWMGNMZU5rOUl2cEw5ckorRHZZdm1C?=
 =?utf-8?B?U205cnZ4Y1pST1NBM0VvOUswaXNYc3JCNllqbnNoNmY1d1NGRHJqWWpnUXk1?=
 =?utf-8?B?UGF0OVg0bGN3TGU4SkY4bi8rVnFWYnZnbmRUMExPc3VWVEpxTjZZUjFpY01N?=
 =?utf-8?B?b0R1Q1VHSXplYld1aUJVbkkzTnZzbWVmR2tpaWhMdFpka1NuUGtEMTVkbGZH?=
 =?utf-8?B?MjJqZEQ0cHQyOHRkYm1NUko1cGZzNWFFRGQwVDF4a2MrZVc1WWVkbXQ4cEJ4?=
 =?utf-8?B?cDYvVjliVEYwOXlvSUtibS92L3JTeDdENm1GYkZHdlR2amwyZWVySXlZZHIv?=
 =?utf-8?B?TWtCajhudjVDK25nWlZvZGxraHNibHl1WFNDbCt6RTFvekc2V2JGRWVJQlJw?=
 =?utf-8?B?ZkNieTJBQ25waDQwKzl1N1FyYnpNNkV6RFhwMkN4RlNxWHVyMytyN0h3bFZh?=
 =?utf-8?B?YUsrRnMzWVI3Tk1KcGlUUXdaS1VDSk5PaGp1anUrSWpEMlVlMlBidjRMUUM4?=
 =?utf-8?B?NUdCR0Via3Z2bEtXc2srVVZyaFRFV2I3bkF3c3N1KzVWWHI5YmFwT25BK296?=
 =?utf-8?B?MU4wdzNKdE9WZFBhNG1vRHdIRVJJUEYzUk5IMG9LRFh2dE54cUNKdzhxaXFj?=
 =?utf-8?B?SlpiTGN5TEFPbUpzSjFKdFA5enNjQm15Zlpiam1nRHNYN0QzSi9RUzNNcHd2?=
 =?utf-8?B?SFJ2WHhNU3h2dlo0ZEhkbzI2UUNISE1JMFVXTWpSU2RoeHF5dXp4NTFySWts?=
 =?utf-8?B?Y3ovdkpOMUpmRnRuRit6NkwvWUM0WFNnMkdoVEE3Rkp5dkMwdXYxNmZ5Yysx?=
 =?utf-8?B?TVFRc04vVVZBemdsRURvcFFyemRsNW9UQU9zV1M3emFhWGhlMjdhOENIdTZJ?=
 =?utf-8?B?K2Q1VWN2Y3U5eGlITDBVQS9hQUxBMUtyUWdmdVVHKzhGQ2NjRGw5dGxLbFFh?=
 =?utf-8?B?bjFtdkVGRmlieXAxOEFhc01TZ0xiZGttbWFFQnJKeUlsbnlmY1oza0NuWnNw?=
 =?utf-8?B?YUkzdklDdU1HTGlEdm9QWU5UeEFRTkV6VmxOSVJ2bFRyeWsvNFZZTU9uMFBq?=
 =?utf-8?B?RFZ4aHoxaXY1SlFEd1JVOWdtUVlaejRQN0VQUXZLKy9vT3NTZ21zWXlnOUt5?=
 =?utf-8?B?RXJ3RDRLRC9KYmcrdTQ2aDR2dDBNb3VOOFBTdUErOUxYbWJEUmdCUVdyYmNo?=
 =?utf-8?B?ODVtWlc2T054QXZDUTM5ZW9kVVdRajd1TWVTelRUd3FtK2d6MUl3NzdqWmVU?=
 =?utf-8?B?VG52UUpIeFNRQjBicWJhUGJmdU1sSzFHUXhjSTJwV1RWSlJ4WFFmcDRSeTZU?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M3CEHc6XElKkNWb6tcfohcFmTMsdEyfvHJ9PPRZUJQIU68XtrbxHRmtX05BLGlsObeISlTCrJs4S/t3HqUtq3IFxo3S/a7rG9bawahvayxo3kZUbJT/B+vc+j49VAtkFZ/t82ML5RDLFuNwihPMbM+a7xu9uumCkL+yJf85VIuyIBHKvnTqXrA4cLnMbWuYix2RtrWnBdeAQau+1/7hmQU5+q8Ipj8poWyIWi3+ip19nIyM8X+FEX779EyzQmPqIn27p1VpEpZIgQ+h4kl8p8We6kJUZOxti2CJ3aHcmXXvwesz/BP/XvO21fscT8xaFE5Cn1odZdVA61veNnedbmZ9zvLguuz73Rn6lRInqlT86W9eaDwHF3XrDLwV8+qykg0lQ5YEpBFxzZKJt2VZfMztU7WpppgK0SweLRGEGYtNZJAH+rRvJhwIMCCBPY3QXRYWP4/XV/1eQCPESMGOcL82Z1h+lPpJ9I0FZ6YZ0nLnOjgpVA1MX/RNDh09BGrsYFbJdiYAJ+jBnonVyrG9uh5t1sRrKJuKDIPmsbBhWOmtbPbRe6tYLn4UgT3a0pz5HcSAa37NopeRlkBDsQycaiIF5g6n82pk49VFfskrwu+OJdB8oQ0NYuJYCdABot945RMLJWwjtNiBAkpuHO42V1+j0wOLdZ/rTKmnQ1+fw4xwnMPOc672JQuJ/0NP7XrgJIsqNDVJWXllRHlWGUYNBfz2Yty5TJXOuhX235oX8kgr53OihBDo+lJYnXco49H7OGDjWh14fu3meYbDrDX4riQTU0rn539k+gAOfoxVpQ38z8rfvTT/gUtUxXW8ZdJQLNGbzqsMFilOHyhEEOWvc7D9nbzruIxcKHvGRBLK1cmA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4695c6f1-8d1b-479e-718f-08db4d6bbf92
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:22:17.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug6PCMtMI9TlXXjmHQjV/2UWOBbjEmjU04jXNUScAeEWn5+JqcGm4mJdnaFnXe2Ejjo0f9j//7ibOnruXFMZKpnrU2pIvyQvj8V8jwN4N0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7486

On 05/05/2023 2:13 pm, Jan Beulich wrote:
> On 05.05.2023 15:05, Andrew Cooper wrote:
>> The SPDX forms without an explicit -only or -or-later suffix are deprecated
>> and should not be used.
> I guess this wants a reference to where this is specified. In particular ...
>
>> --- a/LICENSES/LGPL-2.1
>> +++ b/LICENSES/LGPL-2.1
>> @@ -1,5 +1,5 @@
>> -Valid-License-Identifier: LGPL-2.1
>> -Valid-License-Identifier: LGPL-2.1+
>> +Valid-License-Identifier: LGPL-2.1-only
>> +Valid-License-Identifier: LGPL-2.1-or-later
>>  
>>  SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
> ... I can't spot anything like this under e.g. this URL.

Hmm yeah, it is irritating.  The statement is at
https://spdx.org/licenses/ but only by virtue of two tables, the second
of which is the list of deprecated identifiers.

I'll put a paragraph about this in the commit message.

> Also is there a reason you add Deprecated-Identifier: only to GPL-2.0?
> Enumerating them would seem reasonable to me, not just for completeness,
> but also in case we end up importing a file with a deprecated tag.

We have problematic uses of GPL in tree, where we don't for LGPL.

I'm considering a gitlab pass which will reject patches with use an
identifier not in the permitted list, and reject in introduction of new
uses of the deprecated ones.    For this, the deprecated-but-tolerated
tags need calling out in some machine-readable way, but I don't think
it's helpful to express the tolerating of a tag we don't have any
violations of.

~Andrew

