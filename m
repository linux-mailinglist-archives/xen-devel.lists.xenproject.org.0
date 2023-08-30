Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127878D693
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593000.925885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMJ5-0001gL-Up; Wed, 30 Aug 2023 14:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593000.925885; Wed, 30 Aug 2023 14:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMJ5-0001dj-Rd; Wed, 30 Aug 2023 14:36:31 +0000
Received: by outflank-mailman (input) for mailman id 593000;
 Wed, 30 Aug 2023 14:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbMJ4-0001db-Io
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:36:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 988eb4d6-4742-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:36:26 +0200 (CEST)
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 10:36:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6637.namprd03.prod.outlook.com (2603:10b6:510:b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 14:36:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 14:36:21 +0000
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
X-Inumbo-ID: 988eb4d6-4742-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693406187;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vIUdh4RAx+KVoh0QU953pCp1/QEkFsT7wQBOFzcsMhU=;
  b=eVwij6yTYjQnpU4GBsyv2o+pe21+eEwn4vEOtXNhfdM+Kd5jiTk0QM4u
   yrJKNVHGEX7ucJvPwvaLcZ6lbr15aM7zzHuuyaEYPg0kdSdet60SOhLes
   bcn8VDj70S5Sg1WNZ3Sbq1xJRv+tBORnEKcNUExFr2cwbPrMvekuSHELv
   0=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 121147417
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Swe816i1VYVgzT/0BhD3tkKFX161pREKZh0ujC45NGQN5FlHY01je
 htvC23SPf7bM2GmfNp2b4yzoUMFucPWydRlSFM9rXo2Fy4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7ASGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQgCi5RdzKKmtno5+OBR+lIr88qCevSadZ3VnFIlVk1DN4AaLWbGeDxw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluS2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuThqqE22QL7Kmo7GC0dbmWEiP6CkBSYB/R6O
 V5K4xEfhP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRz0s0
 V/PnNrvCnpsqpWaTHuc8vGfqjbaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AIi5cN3qDjp1Tf2Wrw/d7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:dqOpvqnos7qhLcf2hFQ9mG5WXufpDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-Talos-CUID: =?us-ascii?q?9a23=3Au4vSgmt3WcPaWg/KAB5/WDyu6IsdUGOB1VXZPnT?=
 =?us-ascii?q?mLjdTRb2xYFSZ3YFdxp8=3D?=
X-Talos-MUID: 9a23:8qu6oApq4Bog69HAUyAezyFSP/xW3I2pM1pXt8kgntuWazVLCh7I2Q==
X-IronPort-AV: E=Sophos;i="6.02,213,1688443200"; 
   d="scan'208";a="121147417"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gD0hcgaGpyp9kyirLVcHrjVIjI/6iMlzJGoAx3NblagNMclHaZRVveAaaV5gZL0hhrTshjKizeLCL+vsG3jqfWxjuno/Gr+6QqSzxkuM4TYcPIdO9jKWDk29S8XabM8orRrDSTUlqxaUHKkJEeHMilR+qahvle0zbh0agFXrlZzAOCO4dspnTjcDwhoV1E8fd9lZEH8gr9kM+Fd5WiKM+kfO7um/TnFmQLg+B3+KheIbtrcaZcH632IfBiyJe26/aB1UtpEjgc52jghzGu2SD1YzvrL04NkOBoiXcRKFmqL4Igvx7r03aqGHqHtcPIQUgj9fAfHj4S6wuS++5/2Mmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmdxjvyQE9SI6O03xiflTvhbovcpqezUsDMRUpp70sg=;
 b=D37iSM1q9M15LBQg+zDUA7y52Rrz7I9mz+X2eBtczR+Bw0wd2orj+2AW4D0+LZh4Z+xgpv2jUdngtzB5AbqJnVwSXxCt9JY4i2OayV9kNhQ/goWUomjTngmazjBRqOL4+xY6HVcvAeOMULwtSr89E8LoEsUVFUY/xQ6nYOMYFo0UazbMAeztrehQ3wjv6stuI0ilN7ka5WkNzjWzuN01Dq9w1argfxhciVWkqMeC4QxRdQ3fD62L9xyRMRsK5jHYp0+42uJiD/vqNkqtCLJw+bJS0y2WELS4htIEf2QhW37AdlTYHJMhVOIgYAKBnMQgkD29k0wqlt1VAgregCkaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmdxjvyQE9SI6O03xiflTvhbovcpqezUsDMRUpp70sg=;
 b=wVUSiZvkYRgK3PWlXLKhfF+iRqPe89mekXY1ScvfvCEGI7NPU1SOSePfKJm9M8O4qRwJuGdOvgkArEeIVAv/W+UD1G2B2lOWxbszYtL4EMq9QImgr8wuLYzeeMDPYC5s7dPu6aB6bAsrV/1ItmjDJ72AiXFcmyo4C7ObEY5yNXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c86b8f1c-dffb-c850-3054-f31f584861c5@citrix.com>
Date: Wed, 30 Aug 2023 15:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
 <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
In-Reply-To: <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0002.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: a81cff9e-d83e-4113-6ef9-08dba9666f78
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QdWXfDdzz+1v0S/7HCj5SOHFVQ9kEa1IJLDE0d+vgMJdhg53qFgTNLoklxYbD2NWQC2EJ1LwZFpLFrGSGL3zK7FrytvdBESIT35p5B5gK99U+go4O8ZbMbUn3rDcFukjeAmREPWWuEuPjbttN5rMS8Tv3XTpNHdFXgggpQk4pyH+6c8FUalKNbnwmM1ah9Wqv75p4uETAdK5uaUql3cKjZcNYWD3d44kVEGoQXF/fM6CJn38i3xYb5r7z6hP9igbzZMDnlcI9zZzrC7M1hGrduQodWIP8Q433l4mkoiUR/oiwjX7mgneXpAeuhuTNOebouSk1wHv25cm9wyDBixVYlJEGsjDJ5B1tBG8pWBONRTK2UTggFhjqWHmcpd3EKMFz5/nqUt/LUtcSxR9tNmwz7J5dB3NFFoq4LglTDtkovW3lOHJzGG3cGsdqgl8cbq1ct6a84OMnkW6AZyNC04lMOstHnhVKWnAP1m5fq3o2twj3W1mdT8WyB485B6JD1Z5k4iPSryqxjB4i32EcngckHLGHXdd9ONGm8qaU6JiR+4+fHbuHAPYl/82n1uhlvlVNOHQkOY/c2r84EY4wXWKSMg/0MUoqZ/dYiLIAS35isMI1nHS1tbJEaVzaiAQXZOlJnialxL/dv0jRR2j7lAiFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(31686004)(478600001)(53546011)(6506007)(66556008)(66476007)(54906003)(6486002)(316002)(38100700002)(41300700001)(82960400001)(6512007)(5660300002)(8676002)(26005)(36756003)(31696002)(2906002)(83380400001)(2616005)(6916009)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDlIT3Jsb2JFMGx4ZXdKaVg3Nmk1Rlc2K1UvTjVBRnZtVVcyVDI5QVVjdUt1?=
 =?utf-8?B?MnZVb3FHZjI1OW93VWgzYVN3QnhCV1p6T2ZVYXBQY3ZZTU1BYnVKaVZTa2E0?=
 =?utf-8?B?MGMzSlArZWRDV1NoRjgzZ0t1ZWZIUzhPQlIzUHV2NVRpYm9ZRWNCcHZ0RzRK?=
 =?utf-8?B?QkZpZDBqNlhkZjNEc2JyanZzMU5jZlFOdm05WlhwQ0Q3Y2kwZUJlM3FXek9F?=
 =?utf-8?B?WkQvVDBpejdHZHpkUXZLUTVVeERPR3orbWhMUnpnYkQ1YnIyc2FFZEZSN3VE?=
 =?utf-8?B?YzVLdmJPbEtXalBVOGVpTFlleWJEU2YvSEJoOFE3YlU1cGloOFFJdlZiRDJG?=
 =?utf-8?B?ZlhYUmlQTDhqZmZxRFdFZzQwLzA0dXk2aVQ4aFEyUXFYS2JCVXhKYUdwM2JJ?=
 =?utf-8?B?azRMZ3BNdURXS002bUV1MnpwV0h3WlU1bFBxWk1rTzgzYlBJSWhVUXR4YWtF?=
 =?utf-8?B?ZDl6K1gxMGFYZjBkNkV3YnkxVXB1Ull0L0h1OHNkeHN6K1JERzBjM3lUZUpk?=
 =?utf-8?B?Q0VRdXpRM21NUGZXOCtRK3NVZCs4REJjY1llZXFBdG5Nc1FaaTA4cDhOdnBJ?=
 =?utf-8?B?QjV3RjZUR3J3QkUrQ3hNc00rbU85ZGl5K29tRjF5TFNYZ1NPcXpkMWUzV1J5?=
 =?utf-8?B?MmErZm1uOWFzVWhyRUZJY3ZPakhTNERGQzBPV3U1eGhWVHJ1MUlFeUhzTUU5?=
 =?utf-8?B?QktsbkZmcWE2cS9mazBOQlgzVDI0TGpoMTNocTVQUXBoQXB5YjNQWG9JalNx?=
 =?utf-8?B?b1VxdkVBd29BcXdyR3B4L28yZGRsVHlPTU41VndvRW9UeG1pOXUzdVArZ0FO?=
 =?utf-8?B?SEVQV25OQ0M1eUlzWU1rd0Z3WFFCNzl6ZEk0dkRsZ0R4bDh0TVR6TlUxaFF3?=
 =?utf-8?B?c3plSlQ1cCs1SHlmYjE1U3l1bDg0aTR0a2J4d0NNMS9MQ0M2aXoxbzVkUm4x?=
 =?utf-8?B?RFNkY2szVGtnZzhYOUJMazFkMHhML1NPYnBNdC8vaXdHS3ZPeUpYUjQ2cFU3?=
 =?utf-8?B?bWRuQ2JVSUltNC9NN3pwM3J2U2ZvcDdtWllEbFRNYlJka2tLeTR2dVpTWFFL?=
 =?utf-8?B?YjZLSVQvZHFZRWdmNUd5eWQyY1FaQWZpcHRteXU1Z2lrQWozQTJMd29keURR?=
 =?utf-8?B?TzNzaWRadUhoWm44MjQ3R083YzBkTDNiZWhDOGpBdWRZSk1TVnMvN0VtN1VT?=
 =?utf-8?B?LzR2SGhWL3F4ZDA3dnMrZGZ4SVdQaitRVmk0MXRMWTQzYmxrUkFIalptbXFX?=
 =?utf-8?B?akVSeFo4Q09DTWt4Q29UYmwwRTMrVDhrK1JsRVYyM2FjUnBXVUZhWFdIU1Bn?=
 =?utf-8?B?cGJTdWlPMkNwV0l4d1NOVExrdjJKYitnK3VhZ2ErakNncFRIN2J1MTJpNzlC?=
 =?utf-8?B?R1ZvSUlTR05XVmRZTmxxQVoxbkEyNTR3ZTFUSSt2V1lMeUZUd3B6UWJUVkRy?=
 =?utf-8?B?VmZLWnlkWEdTY05KQXM0VG8wZW1aUXNzeCs1Vk5CK3RlcU5WeStVelNkdGhp?=
 =?utf-8?B?RjlZWHlGV3ZaOXkzeTFmSGVBNVRqUGcwdjY2UXR5WTdHZHhLK2pwQ3ZWdEFx?=
 =?utf-8?B?L3NzTkdCU2lqMm9GVCtZUXdCM3NWd0NMaWZ6OWxpT1lUTWxKa2I3OVh0akFR?=
 =?utf-8?B?UUxONmhDVHVQZGRPYW9wUE42TUlFRkxUUDUwYzI4RDdpMStSaUNZR0p0dWNq?=
 =?utf-8?B?S3dOM1NTU2VKc1Z5dHdUZW9KMkZjdXJzTDBxU1AyazdHYnUweldUb0oyOHl1?=
 =?utf-8?B?enBDMXZRejAwb1hXd004bnlXWUloM3gvUE51dXEyUFdUYzMzbzI2V0NRU09I?=
 =?utf-8?B?YXVtOUpUc2hDYVZzakhwZ3JKV2RSbm1oUk05dVI5T0NtVFB3T0l1NnlKZ3N6?=
 =?utf-8?B?N01XaCt3VkswYktvbXpDL3NRZWluQ05VaVhHVzF4bmRjNVV5NHNxenlZZGR4?=
 =?utf-8?B?SWF0MTJzMUdHRGNXdlYvZmhOa3R4aG9uZS9BeWpMSEVsdTZFZEJYVkpoYml6?=
 =?utf-8?B?akx3empybW1VcHpFRWZUU29sWitSY1psa25EalcrbnBtRnRyMUtwdWxudzhY?=
 =?utf-8?B?UVpvQ24wbk9kSjJUTklzeDBhTUlxcktCWWIzZ2hoMk52K2EreDJlWHJGL2tK?=
 =?utf-8?B?QnZiVVgrRnU3MTdHWUFzWHh6cG9kR3kzNXQ1RWVOVkFPMXFFek1HOHhwamVy?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	68GtA+hcp+5W5VHu6EZqLFAMFqqKSugNuVSKKVJ3DYIDU+adPllJ/m6XFRzQmY0KCZVlP9YcZJglfgFtfWoF/AAvDvfcHGEOJBdbFnQskttDlIJ7DO5dFkhEEZ4oabUDC4gKpj4nqIAO+gbufX1Y2MkYXDTynckRAH9oLOhdreRt2jeL/7LkzV5lv+8K0wZ+XGoO0psMBQJYw0ebLipAL7qlX9/jkdDzc2TO+MmgT5+8YCibBP9HdAyQ3eb0HN+rp1m1AS5LgN6HtIWNZT6pGwdcLPrluRjPISSpi0SolqFtouEoX3EL+VLkfRUfPDs0Llc8UsTnMMzegQ6v8lkmZE+K5q612kn0uiLEWOH73vT9vrPnwX4hNQl0v1uIkgKrKBFX/Q0co2s+oHEDkVIsP0fRr72XUICDYjKCoEuqwRHP4nQQdJNcVUQrolkF6I1gEZh35H3cOtBVknr1z5jmc+nUCqWz0Rt7tu1etxc9S7g8rOLpEtuUHrGHtU8VkSBZr/ccn1YuMpl5GtOQeYefj84wxRoy/B35owLvDtmkiYd/XNAiRVmvYL9/lhsr4+9eCutda12Voo7QdPwimYAUOnJhw91kP8HJwl5Hm0z2xx9uyApbwjqjnnEKtgbbiEXVaJJodsavCgbRkn0ymhW2uE+Kmvg+Q3XOzITYLlKyCd7wwM+av9OBwxFBhjjL7XSNtdG2m5wNouIkILidAH2tnmZErQbWDwDJBzCRL2oLnDXVBbJ/9l/h+lazgIIHASHmVfSHYgcjsjUBFnY25gnWl3jm+UAujQtzDsO6iKVMbU5FACQM0Obx447swv4+gagsK09w3M7H77XDxsuJC4mzgBdWMcyIgfQ3bbSRTII4YRQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81cff9e-d83e-4113-6ef9-08dba9666f78
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 14:36:20.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eXi1qqVtyre+li37rt+mWRl93Z8+Tbb18M1Tt03bS4S1jmPYDJwBN4j6CfcRDooOeM09K9F07pSsB4VhnMZh7/axTMQACSes+KLlR6BHso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6637

On 29/08/2023 3:08 pm, Jan Beulich wrote:
> On 29.08.2023 15:43, Andrew Cooper wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>>  #endif
>>      flags = c(flags);
>>  
>> +    if ( !compat )
>> +    {
>> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
>> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
>> +            return -EINVAL;
>> +    }
>> +
>>      if ( is_pv_domain(d) )
>>      {
>> +        /*
>> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
>> +         * subset of dr7, and dr4 was unused.
>> +         *
>> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
>> +         * backwards compatibility, and dr7 emulation is handled
>> +         * internally.
>> +         */
>> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
>> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
> Don't you mean __addr_ok() here, i.e. not including the
> is_compat_arg_xlat_range() check? (Else I would have asked why
> sizeof(long), but that question resolves itself with using the other
> macro.)

For now, I'm simply moving a check from set_debugreg() earlier in
arch_set_info_guest().

I think it would be beneficial to keep that change independent.

~Andrew

