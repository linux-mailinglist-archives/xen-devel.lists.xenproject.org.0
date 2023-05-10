Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065416FD979
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 10:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532701.828963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwfFP-0001MU-86; Wed, 10 May 2023 08:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532701.828963; Wed, 10 May 2023 08:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwfFP-0001K6-5I; Wed, 10 May 2023 08:32:31 +0000
Received: by outflank-mailman (input) for mailman id 532701;
 Wed, 10 May 2023 08:32:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27j=A7=citrix.com=prvs=487c252bd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pwfFN-0001Jy-JT
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 08:32:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3131c7d9-ef0d-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 10:32:27 +0200 (CEST)
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2023 04:32:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7171.namprd03.prod.outlook.com (2603:10b6:510:242::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 08:32:19 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 08:32:19 +0000
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
X-Inumbo-ID: 3131c7d9-ef0d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683707547;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ocT/v0lo9HfLXTxYo3iupeTkaeBgKXMsyJcKEb1wYCk=;
  b=O3Fj1OCjwTNa4s3wNzlErUE8xZvcxD6RlNnEyfLCroWykuviVDVSDFpT
   IMNZ7GikkC9/bRlqSCBqG5mL+Y/3Ir0+tC4OV3LrqTvASEnsNveU2ONrZ
   JkvzGQ6WpzPN/PSFuBDojH2tu5BUQURE9O5jEn8JQxdT4BD9YHKua66+v
   E=;
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 107255395
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:o6EQ1KhAOdNPEMiaKFN9ujS+X161QBEKZh0ujC45NGQN5FlHY01je
 htvD2CCbvuIamL3KNgka4Sw8UwAsJbTm4RkQFRvrHxhQXsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QaGzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRJLWEISzmFptuPwbSERtlJv+oyFdLSadZ3VnFIlVk1DN4AaLWbGeDgw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEoluS1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHukAt9PT+zlnhJsqEGY4GoXCA8vb0OApcKV2mmdR8Nkd
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rLd/gKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptPl+Yc6i0qVSs45SPLtyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CCvZ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:GGtYzqyLI8KEYw6r8TccKrPxiOgkLtp133Aq2lEZdPULSK2lfp
 GV8sjziyWatN9IYgBepTiBUJPwJk80hqQFn7X5XI3SEDUO3VHJEGgM1/qY/9SNIVyaygcZ79
 YdT0EcMqy+MbEZt7eB3ODQKb9Jq7X3k9HLuQ6d9QYRcegAUdAH0+4NMHfiLqQAfng+OXNWLu
 v52uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJTIWGhI97wGKrDWwrJr3CQKR0BsyWy5Ghe5Kyx
 mFryXJooGY992rwB7V0GHeq7xQhdva09NGQOCcl8QPLT3oqwCwIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgkdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGf1sRM0kjQZo+aU7bWXHAbMcYa
 9T5Qbnla9rmGahHjTkV69UsYSRtzoIb0y7qwM5y72oOnBt7QBEJg0jtYwidhppzuNmd7B0o9
 nhdoxkmbFICucLcKMVPpZQfeKHTlHoBTrAPWKUZW39EqwaMW/mrZP6iY9Ft92CSdg06N8elJ
 HAT19C8VQzdUXnFNGU0PRwg0HwaVT4YBCo7ul/wtxDlpfRZIXGHGm/aHQD+vHLn9wvRvD+H9
 KaGLcTP8PCAALVdLqgGmXFKsZvwb13arxIhj79M2j+//7jG8nWksTgXLLjCpbLOxMDZk6XOA
 pcYNG7HrQy0mm7HnD/mxTfQHXrZwj2+o9xCrHT+6wJxJEKLZAkiHlftb2V3LDDFdR5iN1/QG
 JuZLf81q+rr2i/+mjFq21vJxpGF05QpLHtSWlDqwMGO179Ne9rgaTTRUlCmH+cYhNvRcLfFw
 BS41xx5KKsNpSVgSQvEciuPG6Wh2Ya4HiKU5AfkKue4tqNQOJzMr82HKhqUQnbHR18nghn7G
 9FdQ8fX0faUijjjK205aZkct03t+MM9ztDDfQk3U4373/s1/3HbkFrKgKTbQ==
X-Talos-CUID: 9a23:G3C3Gm0oNPGjrCaz3W7yvLxfS8V0d1j0ylbpGk6+NmpZbYS7WGaLwfYx
X-Talos-MUID: 9a23:IhRK/gUIylq940nq/CPnojdmNNVR2byVDHshwbIlp9i/aDMlbg==
X-IronPort-AV: E=Sophos;i="5.99,264,1677560400"; 
   d="scan'208";a="107255395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqhTLHl9xWHiF+4ESuGxK7eJAeCm1ObqYBdwancwH71Gt9GI8vomoc9WLKLtsXRUvVO6oyPGLbz3+a7Z/dUpuO5ldO9hOsLN5uW9OY45Z9z+LxnOvNZ1pzwveSdaYstNRstXRB9WiASV9ooWeuu5u+Sfkk6mXI6iar+DWIh+tE/YZCS+ksD4c+G9ZU9PNbwMcSGXbbhZA+2kjHmJ6bcYtAWgVgRALVoqaSKXLKCmvJkyrbAQNCztU5cIcoA2YUY4+W6ppz458nBKqLE4k/u0fi/W/Z1PPjr0VVkSLoEFJqwR59smxeG5yo5yNXowrGQ/dv94FjQbI9xw/fXeUk4nuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4JoY2KIceGClWxi+pH3a+dZJx6oAHtkD+56sKaBiaM=;
 b=dHgicEyQ7RuH9bR9vZR50Iwq75ehp9rbH9jcSbNz6o9RJu36SC036Fst3ClvCyCYSpRftVBUBk0+Kix/bTZfI00mdteruwZx2HVkTsBAa5Nz5cA53dFnm6xcQMSjv6W07J3ERdpjjT9OijK5WxXh9QPKCgXY5+Wvi5Mp1dY+NxSsO1X/W47r5gHuQNCrk5Ch6v4rBJP/g8ylvQO1kPwrP8poIKIO8t1dKd0F8VnFFkQZ7xn1J3Oofjq7dJTikdH4KuRagdlGkOhvgJsB1eELPTF3oA16tWR4nt+t34Ees779VuTKdHk9yas66LsQsNxQR40GYfChh0WB8eg4p7Eetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4JoY2KIceGClWxi+pH3a+dZJx6oAHtkD+56sKaBiaM=;
 b=oKX9XxnPluy1YRcO3UNYKEIwHyKNXiWOqc3LZDCSM7tTQwSIcwHjabOOTHvWx/MN1y1UVC7Q+ARNLujxWdJ5TcrYmRSFTDfjZ9EFiqV9psX5x8cXea6rVarf4QRStqCWM+aMpIDiBAlVkYInKXPoSNXfFepRFZ5ETuZJJGt97aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 May 2023 10:32:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/iommu: fix wrong iterator type in
 arch_iommu_hwdom_init()
Message-ID: <ZFtWc3ks5f0kMAQT@Air-de-Roger>
References: <20230509110325.61750-1-roger.pau@citrix.com>
 <56c5d0f1-bc47-8824-9515-239647015d47@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56c5d0f1-bc47-8824-9515-239647015d47@suse.com>
X-ClientProxiedBy: LO2P265CA0393.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8f4b45-42f9-4e96-1136-08db51311152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gdmqkdVfyRnffGVeQO2Wcz2O7oKRxTvbk8REctnlf/5Nx8R1TpP2UOcHI6+Rs1xTG8EB8SqEJoC1/QZyOA2t5YIEFjPfbRzGPWQ9oNTAHUKiFe/5Kc9oMwovInpWLjSlB5t0BkkxJ8lTYpUiai9uOgW89cLAVNbk/lEo8h/nQNW+wLXKtEHjQJWtc64dBGLvjz2Dvv/BpwH5c5xPbZXOghhbzVU1gJs4Vk/9a+v6poOyZyGdjU0d2WKcneMfNvHjJUtxvFTNHs2/FPfj8FjzvJcYJfDwVsZfK+ollSkborxh2tz0BJFHeVtV+C04LhvD7XwkezyF8ZukNjPBz7wfUQ3Ja5J8sjRtlAXMlkDUGkjLLQswWmt4CSQ8RHUaOgg4mWBdSJWykcW25Jsh732GDdUWWcfVKeJ5aY0eJ4DQ8pYguRICnvRcukMF455g6oVWMnqRsikf+CWD/CwSgqdzvET4cVTYmzctOG/Ikx2fpn2cf8LwP21aIsCE5ModMcZtR6N4UO6lrsJUOgvX2ADrgPXGRM/qzSifxtGi1Wy5xj2NIkC5qBIwDhOgJVTPG9D4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(83380400001)(82960400001)(8676002)(8936002)(316002)(6666004)(66946007)(4326008)(2906002)(6486002)(6916009)(5660300002)(66556008)(66476007)(478600001)(86362001)(53546011)(186003)(9686003)(6506007)(6512007)(38100700002)(85182001)(41300700001)(26005)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZCs0SWJ6NHN2SUpoRURRK0loZFUyL0ZveWphN0FHS2FySzR0VmtoOXZwNEN1?=
 =?utf-8?B?azhrcDFWamJ0OFRtZXhtZVFDSDBkR1lrM0tiTDN3ajl3bTJOR3Znekc4TGxN?=
 =?utf-8?B?eUl4Zk1QODZTNmxuUjdpM09QdnBpUHB6Q29zNUNtREtyTjh6V1F0RnhXajhu?=
 =?utf-8?B?NnlhUEh1TGEzcWhtTXNiNGN1SEJ5cW5tZFV3QWZwTWFSaGU3bnI5bGRUaUdQ?=
 =?utf-8?B?cG4yenZhNDk2OCt3akVOVml0Sm1QdEorTjBTdjQwM0tsaVZPdjhTeG55ay9X?=
 =?utf-8?B?cExHVGxFUzlZbS9pYnZpcG52bVhvRHEzaVFaQ1Z3V3o4bzNMTHBzWERFTG5P?=
 =?utf-8?B?TUQ1dEtzSXRacFJYSHlhRms0QTJSR2hXektkME1SRitTSHhDL3VrcTJZVHB2?=
 =?utf-8?B?bndqTnlnVnYveGZGQW1XSmFqQWRoS0ZxS2VvRW1aTGQ5YU4yMWNSZHMvUXVO?=
 =?utf-8?B?RlZKMllhMWdFRVhBdXJLNHdveDF0ckg0VFd5NXhyaC9tU1p3STNTQUJlWWg0?=
 =?utf-8?B?Wm5lMDBIc2pJQStkdDgxbTI1SXhlZHY4d1hWd3Fnclo1U203SUJpdnVwMlpH?=
 =?utf-8?B?REYrQVZwcllIZ1cwZnNoSndOQ3dnRk9NMGdmM3AxQk0zdWNHTSsrNjZBdU9J?=
 =?utf-8?B?WWkxZjVxMW5HdGFqbXQrdEYzVER1ZzlLS0lLQnc1TTdVS3hUcXRsenE1V2hG?=
 =?utf-8?B?QmsvSWhNSmczM3NzYUlWSHlFTi9WakV3SGNCZTVyTEwxUko5L1l0WUkrZVpn?=
 =?utf-8?B?amczUzBzbWdQWlg5THpITkFnL0xiNXJuUUlZTUxPekNoL1RWUUh6SmRGOWFC?=
 =?utf-8?B?RUNVYThGMG91NlJROVRYSk5zMzFFMWV4K2M1dGlVbjZtV2NNYis3aVg2c3pG?=
 =?utf-8?B?Q0c1U3dMNWdqVGpOU0R3c2l4NTRibnJSUzF4VTZQZ3hoSnlrYmUybXA1NGRh?=
 =?utf-8?B?b0hFYzFvRVZBOGtxQU9iMENiazhiS1dVMHMyWEhUeXpxakpvYW5oWVEvYldM?=
 =?utf-8?B?UnBCV0RVbks5b0F5L1lVWDhwQzhVQ3FpYmRVZFpXUU1GNHo1U2FVcUNaYUpj?=
 =?utf-8?B?bUtaVWhTS1UzVUdPOXVFVkE1dkRpWWJkemc3Nzl0eUFlSjVFa2Vob2JwZW1x?=
 =?utf-8?B?d3FCREF5U2FXeDBMakFqM3o1bXZ5TDQ1TmMzRE5adHQxYTFhdGdtcS9OUzdl?=
 =?utf-8?B?N01idElSdU1ydzUrWjA1b29sOEliMlUvZEZWemluWTNXMEd2Y2E4a256T2xE?=
 =?utf-8?B?RUVVQS9zN3pHeVpzY2RmUENPL3A4eVZLajVCbVNhY0JEZC9KWEdVZXE5d01s?=
 =?utf-8?B?VDdCdWVJQk00T0tpV3NRWTlCdUJnK2VMNVNQWnYrWmxWQXN3dGxxbFlGUEky?=
 =?utf-8?B?N3ZnVmxxWG5VUlVsT0hzUjVVdDZqMldxQTk1SVRPTFdHS1VWUS9vK3pGUjEz?=
 =?utf-8?B?RzQvelE0Qm1ia2FxVkdpYUt5VlhHeTJpRWMrRlgyQ1AzcGV0Z2IzbVBoaGQ5?=
 =?utf-8?B?SThyOWsxZ1pvZE1GUml1bmFNRGwyRlB0eWp4Tkh4R1NPWHllZmpMaFFxenhG?=
 =?utf-8?B?UjlsUFNaZ1JPSEJ0RUFsaXhLb2M5NHQ1d0p3WXdFMHFBeXp4dUl1WWF2bGVT?=
 =?utf-8?B?N3YzNGl5MDdZNDUvVWVYMG5pelRvMkZZMi90anppRWxxZlNMMXQ3bXBnOXpt?=
 =?utf-8?B?VFh2SkxrQ0FoWTlpankxQ21Vb0lqZDRQR1c2bVJ6ZGlPdGF4dHFpdkI5WGU4?=
 =?utf-8?B?Q3RNT0dvWVNmQUQ1a2M4dnF5dGswcHVNdjJJbmNGRldod0Jsbm92TUYrcFIw?=
 =?utf-8?B?ZnpYTXgwMXJZQUdtSGUrcXovakpleVVvUU1tRnZWQ05BNy82TE9MUHRWSXpK?=
 =?utf-8?B?eUtDMngvTDYwWDBWRENYTStmaTRnUmZwL3Nic1V0SEh1d3NDbEZSZ3JWTEVL?=
 =?utf-8?B?YW1vUWw1Q1lwSHBtSGpPOGZNMFlKQm9NMHVMNXEwN0s5V2tWU29TaGRrQkVV?=
 =?utf-8?B?ODlWR1ZLMmcrOE41Sms0YU9YWlYxdnBESmdxQ3B2OGtidDNKWlQrOXMwZy9N?=
 =?utf-8?B?Q3cxVS90MVpjamttWTJhZWV3SWFyZWp0SzFLUUpIeUxxZUVsUEUzb2liNVhV?=
 =?utf-8?Q?qdpaBz1L+RkrpPX7B6vP/Wz8I?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2lYhpNaX/8MRIhBcgvkESpog6lwxUgdpHFEqcFVDtcE9aNx5Ox1uqgoNcy4kPWksMfNRAQSrOnexAS1G2TRqwluaHxH0Hb9jSdJM1ZbhTw+wRszIqbjliaKP9Dn021yYKH3DDqz+VAxMqjKi2/Rzv4v4bTB8oSbcTe8hbuo6VMFgyYvNxLj+n+WtA0p8aJjxPFmGF6ystd+PzYg78UPm3ZzAaFc6IF3kvvulkWgHiqv1cCvSA4kwBKWVmnlqf5zMdXt2f+d5D587Rh1RGRVQggTRVD3dFo5acf63QBKa7pG94OZIqcMxw+bzk18QBz/UpO64uOmtAzJMu/QQMKPUFgqE6OHt1WJJ4vh8t5ZClF62pVFgdJNszMYvuVackdSy0lRVQfxh8iRl+/teauzfPk9pCR5TJrUDZDJXBIZtulxipZA99HYZ1aZwVT9Gy7OtR8YpJ4GLpBSRsFMfuOpRIh0vibSWHeQ+Hqgd5W/4A0GBzdjLoPBcfYg4VKEo/mtUJoHi/NRJaKfWr6Yivqp8+jCmEdI2NmeiRXz6MICZ5FS/NF+e01wqTsOMmZ+8pzuwCpRN4ET0lNgO8y5t5P/Z4wJRRtbdNeq0yX6rEM8B4k53FlzVPjKibhJZ+2iVN8pQrqFMuJ1Ujp6MvpggNn8Mf82tgaR/URf+ie2KPzDR6JE7Ck3H/H9gNBRYtF7VWw0GEXfPS7hCf9yWWMS3XhUvL6MFj+JG/PyxKe68orAok9eCqGd4sI4y+Yq5PysSDZg+C6HpvFUDUT2Uk1EGeXmSnUAyolVS8mQuIy0xhPH62wgpa2cHaqf6ryLcVnyaNsmb
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8f4b45-42f9-4e96-1136-08db51311152
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 08:32:19.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+U9iJz9nsB87EOAdsIiNVUIqV/K5udWyEqNdRJJWRyXvPUabiHN7OvjIq6KWUrO8Pdfh162RVkXcVzLGTK+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7171

On Tue, May 09, 2023 at 06:25:05PM +0200, Jan Beulich wrote:
> On 09.05.2023 13:03, Roger Pau Monne wrote:
> > The 'i' iterator index stores a pdx, not a pfn, and hence the initial
> > assignation of start (which stores a pfn) needs a conversion from pfn
> > to pdx.
> 
> Strictly speaking: Yes. But pdx compression skips the bottom MAX_ORDER
> bits, so ...

Oh, that wasn't obvious to me.

> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -406,7 +406,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >       */
> >      start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> 
> ... with this, ...
> 
> > -    for ( i = start, count = 0; i < top; )
> > +    for ( i = pfn_to_pdx(start), count = 0; i < top; )
> 
> ... this is an expensive identity transformation. Could I talk you into
> adding
> 
>     ASSERT(start == pfn_to_pdx(start));
> 
> instead (or the corresponding BUG_ON() if you'd prefer that, albeit then
> the expensive identity transformation will still be there even in release
> builds; not that it matters all that much right here, but still)?

So far the value of start is not influenced by hardware, so having an
assert should be fine.

Given that the assignation is just done once at the start of the loop
I don't see it being that relevant to the performance of this piece of
code TBH, the more that we do a pdx_to_pfn() for each loop
iteration, so my preference would be to use the proposed change.

> In any event, with no real bug fixed (unless I'm overlooking something),
> I would suggest to drop the Fixes: tag.

Right, I could drop that.

Thanks, Roger.

