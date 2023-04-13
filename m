Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2AD6E0B7D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 12:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520615.808387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuK7-0007JU-EZ; Thu, 13 Apr 2023 10:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520615.808387; Thu, 13 Apr 2023 10:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuK7-0007GD-Bh; Thu, 13 Apr 2023 10:37:03 +0000
Received: by outflank-mailman (input) for mailman id 520615;
 Thu, 13 Apr 2023 10:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9nQ=AE=citrix.com=prvs=46097603d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmuK5-0007G7-CR
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 10:37:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d74c1fc-d9e7-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 12:36:59 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Apr 2023 06:36:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6379.namprd03.prod.outlook.com (2603:10b6:303:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:36:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Thu, 13 Apr 2023
 10:36:48 +0000
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
X-Inumbo-ID: 1d74c1fc-d9e7-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681382219;
  h=message-id:date:to:from:subject:
   content-transfer-encoding:mime-version;
  bh=7o/zoZvLpO8iuKHhAUnS6ufHTV8O/4SsFt5DFoyrqSQ=;
  b=cuZtoDiBPD/C6Mr/fg+RYjdBW5OCH4e/vH+wCtTwmcsCdtbdxUI3ZAmD
   50TFbsP+BhshWaQfYQdrbiQuQ7L9OzYQMcCKjGk11bGK4aIm352unvY3y
   nlDQzfIRax5Y4s7dNo8MHhAsxSfxhzTdznSYBD0j45auR41Jb2vkcQPJf
   A=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 107797070
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CNjO6qh5LFp06etRCUYABjj4X161eREKZh0ujC45NGQN5FlHY01je
 htvUGyBbvzeMDHxf98nPYzg9B4B7J7QztY2SlRorXw2Fn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AaFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ/KSpUVS2dxNv10ZCHYbFOiMU5b9bkadZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1bbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXnqa812ALLroAVID4XUFiwhfC6s2mvY9lCN
 m87/jArrKdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+pQSiaPCEUKSoIY3ACRA5cu937+thr01TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:As6Zz6Dg2SuPnnjlHelc55DYdb4zR+YMi2TDt3oddfU1SL3+qy
 nKpp4mPHDP5wr5NEtPpTnEAtjifZq+z+8Q3WByB9eftWDd0QPFEGgh1/qB/9SJIUbDH4VmpM
 JdmsZFaeEZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3AHm4iHmi2SjAjHmPxnOlLFg/c4jJuVXzHlUztPQy?=
 =?us-ascii?q?BSndLdJbNa1GR4uB7nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A7ik9xg43h/+X20ed/bdGHWYpxoxL4qGtA2QEkqw?=
 =?us-ascii?q?hqvGPKDFTFDOHiTW4F9o=3D?=
X-IronPort-AV: E=Sophos;i="5.98,341,1673931600"; 
   d="scan'208";a="107797070"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTZg9dXvjL/Z6Tcrj4hKJP4JyLXxfahnJtEpspXDa2/VpCsAOrP1fRP8mAKbbBQ/o3Eye79UJyNgUeNjCPFj0f/71SbtEst6OAVKrV72IkbVWMv89PCieAtJAd0Klgy/1XsuD+g53T6n8HqoCYSpHpE4EHoz2ALwoYaiK9Q0ZPhbA9SonZoDGjGINmpOKeV48p81cFusB2zl77Ss07HLVgbBxCJzG+JB+AP4vrRZblYQO+jIcFhACNV6Tq7vzExFWBR0nxtKKzccVI17KVgZZW3IH6R/XL1jmkBW3K6kLA3wVdTdPWSIjHJIoohSYy9HwACa/E51evSfhTG27J4Qlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o/zoZvLpO8iuKHhAUnS6ufHTV8O/4SsFt5DFoyrqSQ=;
 b=PqmLiHYU84Mu/fSyO7zp0qiXoT71mTog7RWgIWhrH7G3iHCTkgRlGI6X8iO4wDhKRv0onzz3I5QGbvM6w45aYOXCdhimZ6NiXAzeTSBuzyCsHVuVyUnQSHhcMqj3k6wkePcqEklZ90qpXZpcbUtZVSzMLdbDabhsRkcuWApeYV8vH1Kw7AZQesON9nb7qj0g0HlFcCze3jpCOJdzDJObZlQyNXK2lPKQ1ka/22v+Kb4TVYSCT6AZdx0nLddSYGZ+tg8XB2k+T2/ZuFyT64eBqP8ON0JQb6/CQhtYImayXcl8ftFFzDeH1k6nBc2iJ8JPdKVgcb/GgTsalvq8/tLKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o/zoZvLpO8iuKHhAUnS6ufHTV8O/4SsFt5DFoyrqSQ=;
 b=nXNsAPQWnPjWQrBHxWAchQ/jX+mn6v8eRChjlWvLlsf5lcASpUWS0a805oSI8m5y5k8kvp/6PTcmecJ2DULP/8RAdyT+0gn7aB/nKncmQCBLjEI0R3q3vnnwcfy4T3brQuio6FYF/68TSP8dAVsxna3FsrFLBJwUAMibxHuFvS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <19944c81-8dd4-6c89-0fa0-f4837648c7d5@citrix.com>
Date: Thu, 13 Apr 2023 11:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Parallel build regression in the emulator harness
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 5536b235-eee8-476d-a8ac-08db3c0afc55
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ekTbf1YQIlGn2o9xdOCYCH+G5xyPE7zMId2NkTYLsfJfabXUeA40IMER5iL4xuy0O11QalS4SOqPmm0umXY6N7Yf//sw5+NTuuQ3HFLUXYpx1MdxpDVMUKviky/sVlTODRToNdPo/cKkdS8df5IAO9j1pgbUnrYsLZby7jEfTGcmUn8J+LiQ9Y2wq/Ih+aX9a7wlhUnXJYFJc71E+ckGATIWz40Hps9LEi5iQTakCYl4YbQi6saTLcmI86Xxv/dQZQ9VQQGJrskrbepnst516AITuSFw6bbGRSjDxxiD38QKHYhhg4npUSbD6rquZyPkuK+sk0JWfX/e+D+Yrgnbfn9hOQfNqtyAzmgi+nnfPZ189seRQnBQ/g6V9x00z3oEMuy8qAuYD61Us8zMfoyl4UfS0eBlBDnzCyJPksRkmmCq9+O8x2qNNDeJg7UQQ0C6MsV29L+hJMERGYWrEuBJHTESQjpeqb+8sUJhU/3vJPk/XHS6ab4ZRbcMN6zFxFnJ0Xn02cKT8//Y396S1DeQuxVQY2eN6ySfb4uVOHhxtINq8NKZx315I0z0pNhGh2j8Tk0HwxAOgmTr238+4A7JwVo9N0l8bf0OuatUXoRg4JW+Ni/SwMgEZ7o0/CbV923B/ztuKSSn+4TCnYitnKdT7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(6512007)(110136005)(966005)(316002)(6636002)(66946007)(66476007)(66556008)(5660300002)(478600001)(8936002)(6666004)(6486002)(8676002)(41300700001)(82960400001)(4744005)(2906002)(36756003)(86362001)(31696002)(38100700002)(2616005)(26005)(186003)(6506007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDdDQ09wcWdGQ1FxclVqMkc2djJzTEUvQjlhMGI0VVBwREZGUmgzZlJ4amh2?=
 =?utf-8?B?Y2Y0WVorRHh4b0NOTVY3S3VaamVUb29zUGhxbUlRVlh1QVJQNXoyLzFWenBZ?=
 =?utf-8?B?STJiMzNrakNEVFZaN0FyN2tVbTFHb3dSa29pWENxVlg4WkxZbUJLN01ISktz?=
 =?utf-8?B?T3ZrbFN0a3lOMnJ0SExwVVNrM210SjYxT3JWbzFZNUYrZTRxRFpUZkowOVlJ?=
 =?utf-8?B?MW03eGdlVHBseGozWmpUVTJBaHpxZ1M0WktsRmRMc3ZaRlhOVUpEWVU2MVFa?=
 =?utf-8?B?Q1dCUGRhWEZ3YU1TeFVvc09wWXZGR2lPcnVEV1JzN1Z2eHlqTTcrNkVRbFp0?=
 =?utf-8?B?cEpnNEt1SjFLVE9JclNGUnp1djRITGU3Wk84UWdrSG1MYit3aTRwL3lYWUg3?=
 =?utf-8?B?TGFEQStSZVN5MnI5TUZ1WHlpL1dGaTRBazh6Tmp6MkxLK2lXcFZVTGExR3Qz?=
 =?utf-8?B?cjhtRk9FeUMrNGJHb29Rd1BteDNiWkU3amd3MGFSZWZ2QWFMZ2lKQWdQVEtI?=
 =?utf-8?B?SHlLQmJseXUvT2p6emR4MXVCZ1JHZGhUdG1rdWplWkJVa0M4QjYxZWJwdkN6?=
 =?utf-8?B?M3llNk5zanRya0ZtVXNDcjcwSWErek44TW41RzBSZ3JzMlRnREo5ak8xVCth?=
 =?utf-8?B?VWVVSWJuY3NNejlVM1dJSU5kTkZvaEd0R2cxZ09Xek5qQkJPNGRnbk1zOUJh?=
 =?utf-8?B?Y3lUQnViYU5oTmZWZlFaNzd3SkRWMzAwemQ2VEdPUVd0cjBjbTZMSUczUGty?=
 =?utf-8?B?aWU0dmk4STJyRFlBOTlVTEN3QmswdVUrSHJFY1phL21EUkx2aHNKQWFQWHl3?=
 =?utf-8?B?Wm0vN0g1MzRjR3VLRkdHM2ZCNFFSZm9iUHB4OHpxWHFDZHVrT0NNWXZlVTBl?=
 =?utf-8?B?Y1hPSHN4a0lTUzVtbm9rU1pEZVFvWk5ZcTV3TEt3dnBjYjJGcGdRN25TME5O?=
 =?utf-8?B?R3lPam80YzIrZlZYS3JXaGxyRHdjeWI0anZmMXpnYnA2cUVkcUxPV3MyK1lw?=
 =?utf-8?B?MXN0ZHliUUd6VjVJTm9TTUhmdnZrdWpsTGlZQ01IZWs3SGZtbDZsOTgrZGxl?=
 =?utf-8?B?eWxxWUVqcUVyVlR0b0V6SEN2OG1IMHlialBXVFR3ME9pTUpFYzV1SDl6NlJY?=
 =?utf-8?B?MS90YzQyWnpYdWhlSGdpVXVxbE9NUmxxT0c0MENZRnpzbXlDUVZmYndaUGJ5?=
 =?utf-8?B?ZmN5OFo2THdhdXVrMTk5VFRkcjNLNWoyZExobFNzaE5RbUZibTdaWjFKczR0?=
 =?utf-8?B?bDgxQjIyLzVpZHFoRDBqQVlHRWZGUVFwZFNTZ0gyZVd5Q09oL01pUDBNVXU3?=
 =?utf-8?B?Q2lTbFc4RlZhYlI5RUhoanU3Rmh5OGMvS01zaFJEazVzOS9ocWZ2OGw3dmFu?=
 =?utf-8?B?Z3FqNEJmb2JXYjZCaXVFdlJ6UWNNUWhhTmtUQVVFZmNZVW9XQUo2eWI1aWE0?=
 =?utf-8?B?b1F3M29Benl3SnJNdXk5Sy9Ra0t0OFVhRDdCeDZhU3hVbksyUFo2VG12Y0pO?=
 =?utf-8?B?SHBZK1FGc1J6bURKc2U0MUg3SnI5S2NzbUhMeWpiQTNZSlduam1wUE9XZTk5?=
 =?utf-8?B?Q2FhNkFGcmJSZ1lwdDdJbWM1T0RtV1l5b3ZpbVBUY1N1RW9KeG10alNHemFM?=
 =?utf-8?B?WndmQ1ZEd0RFUGQ4cjFFN0ZCSW9aWFdYcENTZVd2eWovM291RjdQWW9YdGw4?=
 =?utf-8?B?OXhXVnR4UUkxK1RYNjlGNjUySGRocWpubktLaExBTk05WStjdXl6dWp2dkU1?=
 =?utf-8?B?M2NCNllWZitPN1pzTWNaWi90Rjg0VWI5dzdjMjZDek9FR2hoN1VkZE12b09C?=
 =?utf-8?B?eFBsZ1ZvNWIzSmJiK0JhVFMzN0JJaVo3QkVCOGc5MC9hejc0Ukt0OHhscENM?=
 =?utf-8?B?a3J4SkZuMXhHaE1UVXlhcGRuWk4weENhc2VIcHR2cHBhUTdHMEZaYTljb2tU?=
 =?utf-8?B?aFZmOCtTazRtcUhxbHROQXRsWHhBZmpDcU9LT29BazNZU1NOUm5sVjN3ZU5F?=
 =?utf-8?B?MVZ3WFBKaW16MVYvc0x2MXJpMW9LUkQ3ZGJQOXNUSHRwTSt4MWprR0c2RHI0?=
 =?utf-8?B?dWpPQzA1OUQ5ay9iTlZwOVk4dTFPbXA3a1BwNmxxV01HMjNRa2JqR3FQU0Iy?=
 =?utf-8?B?bU5sZjFQVDd0ZUxJNFU5Um5jNW5xOEFsRElqODJOU2J2bzZmYjVzQlNOVmRB?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i6EYP9E8dEZ5u06rkJvyrVxNJ9VcEvWL6uEKFw3WkdZ/NniTUHB+F9WVSzMA7JcoHWYHLjIq/KCgWfeM8OEnpKSFu+Oc3/Z7hz65dGsGtrqnouiiVqt9HjGL3GkxyoLhbhb6ylvKIz3MYNlVWymYu8VxxagdIyJlYHU6g5gzFW7oiz0QPjNPxafyo0tVanlbLDfUqOZof4Zoe8YqjXQO51U/6TnOF4kKJ/Dyz7+5dev/awQJvY4EM06RzFysOpAxD6qf+2y5QJx2egaUGRDfz2S4c8CjmYaFuAmSnOe8rMPzpoWOcrBuEfAfNDPBp0U1uuG21fgks/dHQnM2/8wqJFrn3NzRrYERwq5PxavtrUry2IpsrLVtOxZ8QxnuRKdJ2cMsbqOCmZavN7r9HPfcZzBgDzgj7Ec99jlECmhHLpBCpSp8TS1/vvwoy61fnd/ZzWTHTo9sHglOwNcL3kY8Wvp4v/4yL+3RgMYdWXJle4GjNVhYYEiUG7uf/npd628AGvHuqrhwcAB4pGxpjX8OgW7CCIC+0Y0Xn6gcf14nHeo0F+Y10V3yluJv6O7pJN8eslhwFqI9MILZe/mB++wxo2ib8NAQKiMi9M5HMRU1bbFVtBP4tU1kEo8cJznYFO8gfD7KoYhtI6VHGt4rrZMYb6OI6vU0Yewmfqnv9irC+/1LdlVvH5X03P/LCJCoW7qECrKQHa/47cA9iH2YW1DY5LlB59wvsVNLGW/4yd3ojE/c+57vFEyjdPdBuXLRKhmHor/pGWqMXaF5ZgTJB9EV3gu4YG+alvvrsly57+rbmEjaUwlLDYkVJT6/SJojA8y1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5536b235-eee8-476d-a8ac-08db3c0afc55
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:36:48.7503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JRZ3i7fmIcbKiDce3tV/VC6B5ApEBOYBDUrpxkmTZh7ZfRCNBIXMaJV6GqeJmKIdbKGYEBuq4Ljwc4WFx8itfmmpah24p48bjKzozbflkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6379

Hi,

Gitlab has started very occasionally failing with this:

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4104532296

While the individual log lines appear to be in the right order, the
build is clearly failing because compiling decode.o is happening before
the x86-emulate.h symlink is properly in place.

This will be an error in the recent splitting, but I've not had time to
investigate further at this juncture.

~Andrew

