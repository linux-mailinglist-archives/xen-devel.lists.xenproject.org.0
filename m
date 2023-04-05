Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E496D8766
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 21:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518616.805357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk9Ad-0006HQ-Dz; Wed, 05 Apr 2023 19:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518616.805357; Wed, 05 Apr 2023 19:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk9Ad-0006FY-Ai; Wed, 05 Apr 2023 19:51:51 +0000
Received: by outflank-mailman (input) for mailman id 518616;
 Wed, 05 Apr 2023 19:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pk9Aa-0006FS-Ri
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 19:51:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ac0d714-d3eb-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 21:51:46 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 15:51:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6114.namprd03.prod.outlook.com (2603:10b6:610:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 19:51:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 19:51:34 +0000
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
X-Inumbo-ID: 4ac0d714-d3eb-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680724306;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h5dPrDhv3AkJwZ5rc0F3+4lMFU5MOn9MEBGjaaxk9aw=;
  b=QY8ONM94vGqwqVwjcFrpqOPEAp9mF36rYR3AykwcZj3F+Oq7MuzA1IIn
   lYGO6pxluhcWprf3TJLHaKYeyTiK+vFpJ4tmjl9K5es2IUphIbOGhs5UP
   N97pWj2pK32yAYNofttg/aoyv7DT2icOPybapK+zhVUTPIQmeLFavXa/T
   0=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 103260996
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LEqC5aLUq8ykc4N2FE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENS0TAAy
 zMeCGuAMquKZ2ehft53PY/joxlVvcKDn9VlTQJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5SDEBu7
 PgpcAwVUQyZpseI4rbrT8dz05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMk2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHugAtxKRezmnhJsqEWNhVwpUVowbgKcntu5iU6uWOJtI
 kNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI88T+iyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:BcwX1qtbORdCxu2Wj+vNn/NK7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,321,1673931600"; 
   d="scan'208";a="103260996"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqRYTh4Wm3OF383lfTbU6dHQfPP/bE6RWVJBEXvamITSNb8vHBvp0yFK73MRbYLEw4CfYG8Wsn1s/ImNFYXLz28PHlikwtnVHXHsOxJbIrjxTgDYKJtWBqgJDDTnYoTRjNwjLXnw2jiWbQJJv1opDCljSy3zUqyhORNoUC3gRaTSFKNeu6OiSAmaN5lMYL/4sMvOhPArIOXY7HPInf9WINrXcehncqy/75RcqUPl7xpqyl8bRlpw0LujkqJ+VmRsc65sS7ucRW+s+drVSJL+cRKhEKZdnYDxuax4LYH6NLo+3gZ6WngW51sQym9A+id1kgLc8dsqrb7AkNkFl6c5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqaxVbZHPGQdakwydD81MgkRk/5WO4ZaS7WH5LX8MG4=;
 b=EKqKLwHcMJ8J+Lq2yvlYQ8R7NIy7nHizAZUFf1DPMVga+pA6tgZeGDYOqTisbW7zir7Ie4J5YaWY12XTF01xAPOAt4/5tbxcpw36zhaUKrDScD4mFJkb2b6LEMC5qSPhBZ0V/TvRmG0o7NfnK9N204LisWbywvZdvhtkPt2qdB5KazFdKOOUsuAJW3+EybPEnwz7DU4Y53tYbX1YSKAW+5u4RRy0eaRmdjtj3udlnppbfadgCska8FPkFi5CBEP00bV10F5NYvMAt9OrYhwpUn65JbLRj76ZQ2zjAT/F5AiXIan/ooBwi7lRlZNXkSQpJHOI4tXV+y4UnbP3rLzcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqaxVbZHPGQdakwydD81MgkRk/5WO4ZaS7WH5LX8MG4=;
 b=m7QbxSSLQ/OebYrkcmuBNHxXxZMZDjyaBYLP41ZhEaM8pNjFLy0cnWydq9yJ4enWsh+h50/AdLbas0ii2sGBuJ+k6MaepdlPuN7lEcFFCW1VhP+JH44HejfpO8XCQYBVZ8hmVUILYbGS7tJqMug2pGKu1bNqBQt8LGz5yqJSR68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fe24d528-3f65-6e26-d467-60794b4f3ac7@citrix.com>
Date: Wed, 5 Apr 2023 20:51:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/treewide: Drop the TRAP_* legacy names
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
 <20230220115956.1522728-4-andrew.cooper3@citrix.com>
 <1684ac85-f9ac-a57e-9529-f2e09f6f81ff@suse.com>
In-Reply-To: <1684ac85-f9ac-a57e-9529-f2e09f6f81ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0388.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd15747-8ce3-438f-14fd-08db360f2858
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Roy2HTV+3dydpawaMOsbr0tAO+O70Lm2tQKzQAYr09j9QpZEfd6xa4SEG7zbW4qkQOdze9e0sslriuTxmpz2BHb7i4Q+9R1NpyBDWy7/MpFrZdAbVm2O9v74LHppc8R5TcYA2OiC9/+DUQuBu+4goOokJCPg8+bdEjjOoYRfs2kwCgxCLcuSPzJF0xz1HcpoENF1T23dCSNTKk4+TQc3ENjkDlHv0zZERkUCUt3XxSwtRx64AYeF3IpFAJvbJ0X8zplKsiEmWncAR15Trpr2Yy/K4I8zbHhWkzzGlFGrSDr/fzgewvxgqH0OyBULkLSnFl/4mZ2ypVStTIETjkGGod5R4uj57EopHlE7C2qJNWHEHOvb6TyWvx2hq9isXyt/9SoE1Pmm2Jfqgs73VkxCNfZ6+ORY7qZ4JdIz8/ti0wcq/XoDVpil81Y73hpVt6Clo9klPeSdiBf7cd9ZjtqwJkAH/LDMYRbVAKpZ8Ca46+WbCW8Kx8QHINZ1DY/bvENrjZR12SJkTna1Kkpav4CncaOyQaxZfoq3yti5XYJvFSUo3C/BGPFBLiuXsVS/Wgoo2HRchpLi3ODcBun3wWNJJA763KIO6kubNnGX6mGsxO/CbpfmxfGAicA59fFFSdqEjHTdLGduGBHA5qlkx+ynw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199021)(31686004)(6666004)(83380400001)(2616005)(186003)(4326008)(53546011)(6512007)(6506007)(26005)(66556008)(31696002)(38100700002)(66476007)(6916009)(8676002)(2906002)(82960400001)(66946007)(41300700001)(316002)(478600001)(54906003)(5660300002)(86362001)(8936002)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGVtaUowaExWN0R6ZlArejJXc2UvT2xJdTlnYjk0T2R0RU1WeXRwWXdMQzFl?=
 =?utf-8?B?eWZ5T3BtclNJUzYxWno3U0JObzM3TFhyR2cwTFBraTU2Vjg5Y3pJWWlvZ3RB?=
 =?utf-8?B?d1VyUFVQKzNOcFNPTkVjUk5FVVhIMHgwOFpuUW5od2k3K3BGZ2M1TlFGencv?=
 =?utf-8?B?WDJKR2VSa1hWa2JFVlVUZE92ZWtqQ3NNR092WnBENVhBL0l1aG1UNm8xZWtX?=
 =?utf-8?B?U1JWbitZRGYwL1lsSnpkOFdoUGVoQSt1aWNCaTVzVTFDZzlsbG8yWU5wb0gv?=
 =?utf-8?B?b1FUbXJXMHVvbU91Ukw2bEJVMW1qdmMyZ1RSK0krQ1prS0FuZ25QL1ZZSXVa?=
 =?utf-8?B?MWFsa25oZkJvUVFKdFEvOGRRK1ZpbCtEOCtHU3hsRTVUREdDcmYwTlRlV3Ft?=
 =?utf-8?B?Y3FON3NOVnhQeDdyZDFjb2hXMWxuRnhxbk5DQjJpY1dvVnFYWCt2N2VuMFpj?=
 =?utf-8?B?eFZFNmJKYjdTamVxNHJHeFlnazZmUGpjWkppamV4L2t0SnRFTi9NeElUczF5?=
 =?utf-8?B?Z0JlVzhJK3ltaUM5dVBZRlJ2ZE1KSVBrWDVmMjJwSUVqb1ZKMmFsQ1hOd1BD?=
 =?utf-8?B?ZUNLZDkxYUVhUE9lUVVTaHJJTU9UN1FGWUJKdGt0SnYxYzdJcVo2UHdhd2F2?=
 =?utf-8?B?dGV4d3BTbDBWUFErVzVPbWRtTGZsNkdydXJFL01mTlYwRTYrcWliUmlCLzB5?=
 =?utf-8?B?Vkhjc1Z6Nzh2WEVXbktBb0d2RjJBb2p4MzVSVmg1TU91a3VrOElFRWo4Kzhj?=
 =?utf-8?B?eFRKS0xuZnl4ZzZnSTVTSDhDUDlpQ2hVd1dZZjkxM3pSbHpRajNCR016cXB4?=
 =?utf-8?B?WUE5MXlyL3lTdkw2UnJ6TWt6MDNidjM3QXpLZ0wvR0FQaWpHZ1Y1VHFnRk1H?=
 =?utf-8?B?Q1ZNUXJlQ0FZQy8wd1JVWmg4elBSZnhaS3FGS3FvRTlyQXRGS1Fia2ZYUk4w?=
 =?utf-8?B?dkpoWm40cTdieVhOZUJnVng0eHVQaUx3RmFCUGRjSlM5L1BFeE9sblZmNk1L?=
 =?utf-8?B?TGJ2ekpzRU54WXovTXFPRHN3OFcycU1BZWxRU2x3OGRFQW1BVFRSV2txQ1V3?=
 =?utf-8?B?bXBVRmxCeEZ3REZlemFoYVF5cVIrSTVIZldCQ2Z0K2JVNU9DSG5BOUlnbjRM?=
 =?utf-8?B?elY0MHU0eStBa2toTFFDS2dveHNLT3lrQlQ2MVBxVmFsek14ZWM5WTFWTklt?=
 =?utf-8?B?OHlWWnBnaDBybGhObUw1WnpNZjVMMFlLZWJtaUY3OU4yNzhkY2FPVHdwK1VC?=
 =?utf-8?B?NnM0SVd6b0thMldzMU5lRWtPYU5iSmVZeDRxQXk1bHZmY3BGbUFPTDJWUFV0?=
 =?utf-8?B?L0plUkVycXNjOWNNSHJ2QTdVNllBM0dQZmg2TUtFVHpMalM4U0phVnFNeVVV?=
 =?utf-8?B?UkxGSVlWeFNDbVYzMHd4QmVHSTRYZXZmdUYvQ2tFM3hCMWhNbzloNGlHTWR1?=
 =?utf-8?B?a1Fmd2xpOW1pNDduNHFGbW1rU2k3MXRsc1BIaFZubjkrWUpIOVNNVlJia3pS?=
 =?utf-8?B?VVQ3V2RhWDZiQVhhK0VRcXl6SzBxZkhMUy9SdDU5SC9vOWlDN3RLVUE2OEhP?=
 =?utf-8?B?R3cwcldpQm5DREgvSkdGSXM3VGxlWnFJdzk1dDJ2WCsvU1BGdGFBaFJIa2x6?=
 =?utf-8?B?bXJ2K1ZaTnNFbE56ZnBDZlg3emlocm5HQUpMa1hTR21nSFd6QllrQUNaYWxa?=
 =?utf-8?B?M0lUQXd4QUltSzJXMkM5cXVYRkM0OFNyWFIrTThoeVFoeTZrMnp1ampYa3Ez?=
 =?utf-8?B?RElxb3dnaE1hS1dabDYvK0pWSUZpSDBsdTNBeEwrb1UyTHpTVDZDQVM4eWZT?=
 =?utf-8?B?L0xxQXFSNVBIRk41L1FmMit1OHdJcDlrOWpJYTcyc0dwOUNvWGRtOVA1c0Zn?=
 =?utf-8?B?WnFpemhkZDFwdkJ2cERZK0FTTW5IaGxTY0VRTzl1MkFhNkdVR0UvSDVyVmxJ?=
 =?utf-8?B?U2drM2VNK1ZpSk1vRGZMSmFGVkhRTEpEbXJ3RnQ2SCtnS0JRU3B6eHZwRy9H?=
 =?utf-8?B?aGcwamlSQlhPbDUwU0xZNDNyMFBLYXF1S0NOT2s1TkErdnIvWFE5bkZIWk1H?=
 =?utf-8?B?NVhqUEtMc2ZCK0ZlWkIzcndzNGNHVHJEKy8zWGZyaTVoQUVGaTYyeFdiSHJN?=
 =?utf-8?B?OGVXTG1POWZBY0F1Ym03SlpRSW1LK1JEZTAzeXBTOGJISkxtZ1IxVzlqaldi?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p4nSUsZql532w/eZe/RZZ2pAj8dRku0jUvdAzVRzIx8nBu182VhJT+r2oox9bYOey46AslGQTTLKGtYk15ao4p9dJFC+ONPafMNtkeaK6mlx9QS/DddkL4u08TathLMNyJBm6s6DREhv7hLS6iCD/bLcP5wUHimnK53bK6O3S6mlg+CRD6oXVami+CbqSGu+HGHnKjSqafhfdQjN+rdmV5BJLvyWapAqnPfIyqsvVpMrj9Q6v7z4QTCiTg8u+RNnH6hLFxiyCJunj+dpwIdtyRTAe9Ti4OUQtmCiuHdlc2NGXuxJn8CPbdXF4rAWJaw9rr0duw+cgmFy0xUth7wXhJsnUv5jyn+yB0UY8LxaC4a2PM5UqASM+ozNOjIgj3AowUHtZ7gmwmXpJCffSFWRjKnoCWBO50BcBlz8D/oE/dVQxQrkJpQFivy+GIEsRt+P9tloVL8X2rXsB7YsOEbnc0FODmP8yD5/PMwuA6+ZUwsuHszs6dj0oHNI4BgIAjS2u8d8JDE3QWXXMXqdDXy76hyIvKIXQ5hBpNCNud3s/L3K1KYZvEsRarysxwrH+yhk7NQLc/jAavg35dqO41TuQ5P0Ped6zd9na6rA2N7HtvhgjbVS81DvoRa4Cr27U2YqKAiCM90qFgejtwQ5XsjePRSFtrtwGwgYzifY1J6L/wa0r183FHD+3cLavkEpKku0Sk80Tr5xWq8G5Pg35xmB0jyEGnZVtspDnQ+p1k2ohkKFolw9UntUR4V3CGtqgdDLG5qi3v2LnoE874NvXCM8IWSxuRaCKq+h/C1VD7Lm5whYdjqGP/LtIgrZktktJ4JT
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd15747-8ce3-438f-14fd-08db360f2858
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 19:51:34.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9hnIYtHOgQybaIJXyLbH9tSRzYg3tkRxsRhWJDzROtSn+IaKmNjLlVrBMsHQhRbduQeRxdYKzcQ0ZCfZMVa7Ih8fhOfzwxyaaBRdHDA1LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6114

On 21/02/2023 1:10 pm, Jan Beulich wrote:
> On 20.02.2023 12:59, Andrew Cooper wrote:
>> We have two naming schemes for exceptions - X86_EXC_?? which use the
>> archtiectural abbreviations, and TRAP_* which is a mix of terminology and
>> nonstandard abbrevations.  Switch to X86_EXC_* uniformly.
>>
>> No funcational change, confirmed by diffing the disassembly.  Only 7 binary
>> changes, and they're all __LINE__ being passed into printk().
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Given that this is proving a pain to rebase, I've pulled it out on its
own and committed it.  I'll rebase patches 1 and 2 over this at some
other point.

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -2745,9 +2745,9 @@ static int cf_check sh_page_fault(
>>           * stream under Xen's feet.
>>           */
>>          if ( emul_ctxt.ctxt.event.type == X86_EVENTTYPE_HW_EXCEPTION &&
>> -             ((emul_ctxt.ctxt.event.vector == TRAP_page_fault) ||
>> -              (((emul_ctxt.ctxt.event.vector == TRAP_gp_fault) ||
>> -                (emul_ctxt.ctxt.event.vector == TRAP_stack_error)) &&
>> +             ((emul_ctxt.ctxt.event.vector == X86_EXC_PF) ||
>> +              (((emul_ctxt.ctxt.event.vector == X86_EXC_GP) ||
>> +                (emul_ctxt.ctxt.event.vector == X86_EXC_SS)) &&
>>                 emul_ctxt.ctxt.event.error_code == 0)) )
>>              hvm_inject_event(&emul_ctxt.ctxt.event);
>>          else
> Entirely unrelated to your change, but seeing that this piece of code is
> being touched: Aren't we too lax here with #PF? Shouldn't we refuse
> propagation also for e.g. reserved bit faults and insn fetch ones? Maybe
> even for anything that isn't a supervisor write?

Imagine a guest does a CMPXCHG16B which straddles a page boundary, with
the lower part hitting a shadow page table, and the higher half hitting
a mapping that the guest has mapped with RSVD bits in the PTE.

In this scenario, there would be a VMExit type PF (write to a page which
is actually read-only because it's a shadowed pagetable), and during the
course of emulation we'd permit the lower half, then encounter PF[Rsvd]
for the second half.

And the correct action here is genuinely to pass PF[Rsvd] back to the
guest.  So no, filtering on Rsvd is not the appropriate course of
action.  Similarly for a fetch fault, the guest could genuinely have
paged out the frame we're interested in in the time we've been spending
in the sh_fault() handler.


Whether the else path, choosing UNHANDLEABLE and unshadowing the frame
is really the right course of action, is a different question...  I
think the current behaviour is safe, and its not as if it's a codepath
worth optimising these days.

~Andrew

