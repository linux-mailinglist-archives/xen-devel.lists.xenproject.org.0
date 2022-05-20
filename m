Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992252E99C
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333664.557528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzZD-0005BP-VG; Fri, 20 May 2022 10:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333664.557528; Fri, 20 May 2022 10:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzZD-00058f-Rm; Fri, 20 May 2022 10:09:07 +0000
Received: by outflank-mailman (input) for mailman id 333664;
 Fri, 20 May 2022 10:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nrzZD-00058Z-1q
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:09:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e07c3caf-d824-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 12:09:05 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 06:08:58 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB2683.namprd03.prod.outlook.com (2603:10b6:3:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Fri, 20 May
 2022 10:08:55 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 10:08:55 +0000
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
X-Inumbo-ID: e07c3caf-d824-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653041345;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WO2E8EcvMfDZUQgtm7mMap8OWmSklnmVr4sI4Hn8z0I=;
  b=HmXzxEbpC8gWNCrEa6+asLlucgEGX259FxjgrIHNfS33fnSVcK/YHHY3
   KZNkfYs8Zih3VuOwFjyyKyttMUJJS+dIjuZg518NHNDMzGspjlwto7f2r
   0Hf4S5LB5nocTQ679/YmVo+B9tTut8ea4OmziHyrpQcifwAfCCrVg15z2
   M=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 71635313
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VqugJ6megKO59LiYI0xdtrzo5gxDJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaC2nSOvbcY2ehfo1xYI638UpS6sPcn4c1TFA9rS09HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWlLV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRDsNG6/MifUhCyZRLTBSbaMB2r7+Pi3q2SCT5xWun3rE5dxLVRhzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXupkBg2hYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8QzO+PFuuAA/yiRX7b+1Hf3/XubXeucMkhuFh
 2vY7ljQV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+lpH+JuDYMVtwWFPc1gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neWm/v5CDopt6eaIVqf67HSqzqxMCoUKGYqZCkYQA9D6N7myKkwgwzOSJB/EaezptzzBTz0h
 TuNqUADa647iMcK0+C3+A7Bijf1/5zRFFdquUPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytaVUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:nijMOKCkw+qba5HlHeglsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4J6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ1yHtycegB2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB26ffueChPaHbzYfJt3SU7lmtrQ3Igfwt2MVdgh8KYS8a
 6xJW+w81RCNn7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,238,1647316800"; 
   d="scan'208";a="71635313"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUzew5PX5agHCXGiTyW/Rdn7A3p7GmypdFnAnLc/Cw7b111ardGk40pUKiviGpR3PrdM33aUrPZ5hSTq1ARROcCM3/glUCbKx1JwomVtny2yAw/ef0pQ+6AbN37Meeqn261z5dKQEj5oSfKWHlEhrr2oXZBCOrdggr0MvjaaqvBONGxqsDTLZu0jVU+M38QLKIU/4IoaJX9LKz7/6KevDJQbcsGM6/9CI/sNK7/RBufatUl9LIp1Mkx1C4iVwgTFvjBLnVnTzqKwKnmdOLjUZ5CsG3FiZCeQ18F2YPEZrPvKCJj3aYR61eg/j55KLMO7IRXAgANvAXZevKnF2VhC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mzj7IhHVUpLPt/v/QrMEDI1JbRah5YZACjpeB9K8ovM=;
 b=BwdrrqKPtgZ3fwee8CwwGebpVcg6McDGx5u5tltz5rGSV0Kyr5iFe5nQ5WObaV7JgO54gaFtrELap3kRT50WQt5I27kfkS8GVkqqo37W8AP5cV1Qv8QfPXJpLa0shqBgk3+Ppn52oWQd2GZvDkP3wyHm5FW6AZ+3JHkhTvxKMcIptB9ekpUyzIBIR2CJVMxrUbTS9mMI/eTfhmX/bIXNhj/hQsXqChysQMBp46MNWZBiGKy27CvUM5UigiGomet6LveBfcfG2ngNxOCnnJLLTQdafGBGwBl5Ep4YbCkZp593WKtL44OiO0xGZuRTt3H8RFVa93aVAjsJu4Yp6XTyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mzj7IhHVUpLPt/v/QrMEDI1JbRah5YZACjpeB9K8ovM=;
 b=wJL9MyGW2zc+g3KTerpqG4jpG+5nFSMVez6CIK8w6M8qhyYlGGBgRYMcO5yYny3/1y8TW0jtrVIDxoiQd8LmEPm32BLcxxuf2Ylytxb9ohMu4attR4JEtuMX4vR3cvGOS2f9bqvHz50KZC9jfUFQVA0P9BwhUFH0UvEPKxO42Mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 12:08:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Message-ID: <YodosqK1YK5fx45P@Air-de-Roger>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
 <ac220eee-937a-bedc-509b-bcc75b376001@citrix.com>
 <YoZYAAG5YbHMyxMx@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoZYAAG5YbHMyxMx@Air-de-Roger>
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f7ca32f-d5a9-4100-b022-08da3a48bf7b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2683:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB2683A7969E84A970097BE1D78FD39@DM5PR03MB2683.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QMT8ASGwFW+E4B6oiVvM5d+h0w4ZSJmuhN7iw0pa8LLIIWC0O34Q1NsLLrxsk2ZeukvLFNl9qDOsYK21/O2Kv7Xf13iFpjbkIEKL5s2zXdcQIFpk/2wynnzWLogDQTsETKvBjdl1o590RK5ufqVPqhVJCD+tnv3PGyg7QUwfw68daZAB2BQipcIZuGyAPpjhK2rnhgJeCTwAPkE/VUAzqBWhTHx8drYjJNKMc95s7JNephy5j4IG9fiN2CydIFInKWQV83MJrJf2uuLRlpIaMu9IvvwoG25p3IEtnsZ80STB4Clfyb7CLv84YaM/anp5zzXTS9W6TfccZov7OGb4bMQpfZg23dFTG3Dbwi0IjQJHjReimOn3LXKdEIjjpKaNWDYVPPNLceaUT77hNmwlqGuBHg6QRRsE/Zst2XP+3f/WAkaSpCUfrpEzqt91/x+rNiU6pwiW3eUADDVnDNa09NiUYHwjeof8IfH4UzS21ZT6qx77xByZrC3TUqpjZ8MsFl7/gpx7jrff6s2jWH+lYVqEdPemRa/+fpTJfYWQUNEYIF95YVwXde5FL4FxW2/dCEqBOiMaoXKDjhe99SZSaWTRvZH3HIqrrtZKVJbRPnoFVQzrpmfjiUevaCU2W91EQDnvWupMBhijEL5im+McUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(83380400001)(2906002)(6666004)(186003)(26005)(9686003)(6512007)(6506007)(53546011)(38100700002)(4326008)(82960400001)(8676002)(66556008)(66476007)(85182001)(86362001)(110136005)(54906003)(316002)(8936002)(508600001)(5660300002)(66946007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEhXQk56bXdBYXRrblpKdHdvUkxpeDhSRk5BUGd3NEZscTNESGlIaG9jWnA5?=
 =?utf-8?B?MERta0dXd2JNdmljZTc2UWFiOURRQldZZ3FaWDFHT0FJVm1RUWpoWUVIZjEz?=
 =?utf-8?B?SHhNWXBiS1RZRHpxNjB6WDdMTm1BSjlNRkdISFBkRzB0RjJYZXRlTDdRZjZn?=
 =?utf-8?B?V2s2MjBlejJNZHF3T0dFZHpULzUxTlA4dWVUK3JqaGszUWFhNmZvT0UvNDJw?=
 =?utf-8?B?b1QwbUNVanBKT1lpVzdXamNTSVRRTFZ4bXdiU2cyZE1yT3ZoVVpFQ2h6NnYx?=
 =?utf-8?B?NVFLVkVwSHUwTFgwa2VLMGxsKzdqa2lySHZTcTM4TStGWUlFVkp5Vm11bEVG?=
 =?utf-8?B?UW5ndDhsSCsyY2E5NEp1WWpqQmYxbFBlNmlqOWZHTE5hZkswdG8xOGFNcUM3?=
 =?utf-8?B?SGp0N0p4cVN1clBzUVI3QUlzc09lZFhlUUJITzNrTUo1Y0dvWHpxeG5vQkto?=
 =?utf-8?B?NjdnNDhRUXR0cE03Y2wrcmVrOUlxUTRjSHBzc0JaZXVnbS9YK0ZYVHB4TW5W?=
 =?utf-8?B?UW9LQnN6cWcxMVBmZ0FYc3pNMmYwRzB2UGdpZFBCMGRCbWh6Q25HdnluUldN?=
 =?utf-8?B?QW1lYXp3MmdFWEJMazdVZkNYcDg1MmZvTFpJS2IvUmhITFd1QzVUblU2TWpy?=
 =?utf-8?B?WUhQRmZ6YkpkdVVUU3hGQkNYOUdmeXZlMVI2YXpuQVhWSWExUFVTWW5BcVFl?=
 =?utf-8?B?WU0zLzIydUNENTlDb0FEVkE5ajlqRlBIUitBMmorZ1pZY0tEckFZdHVJVEQ2?=
 =?utf-8?B?RzczNi84TXRYQ1hqV3A1Umd5Zm45K3RLM3V2NGRZczFGSklEVG5lQzBFaGV1?=
 =?utf-8?B?LzZDMkRXWXVkeGpSTENLQXBZZHozVUphVUNhY2dqbXN3YjQrc3RGL09SZEVs?=
 =?utf-8?B?dkdXNXBBV3pNTWUrbVBVaElFNTNoNm9rM3JCTmljVTZ1NXhsc0tyMU83eGhV?=
 =?utf-8?B?NG94eGwxTHI0R2xsZTVOdUtpQS9YNjdyQTVjQnhjSk1Zd1dEbWg5Smp4OWti?=
 =?utf-8?B?Q0JJRTBUaU9YVFNxOFFuSHFrUFpNc2E5SS9vY3RWZHVUalFTcVE4cG42cktX?=
 =?utf-8?B?Ni9yZVJFY0pQU3VTMVFhRElIT2VxSkxLa0VGNldjQ1crUU4zWXpudU5EWExI?=
 =?utf-8?B?anNXVGtJTndTS1M2bXFtdWhsRlZlalB6QURZOXI3bnBOcEVCSEJnZW1pSFlF?=
 =?utf-8?B?aXdxOGpmejY2eXFiUjEwa1ZtTzdCc1haWk9DMFZWc3o2S2YyeWhSV3M5cllt?=
 =?utf-8?B?Z1dkMXJCRlBuTlVPYngvM21WRTQwQm0yV1JuaXpZTm53dmcwN0lobFhLcUtu?=
 =?utf-8?B?OWlKZ3MyM25DUmNTZ2psNU9aT2huWTdmc1pHNUswbE5EbysxR3Q2MTVCdk1G?=
 =?utf-8?B?eG44Zkl4S1p6b3Ywd2Y0eHB4Y1RxMjNNZndSSDRvRFZnVXpXZEtJMHVJOWcr?=
 =?utf-8?B?WU91eGUzdHBTZEJtYzBOeE12WmxQeWNuYXA4cXFDc09OZW1LMWZkUFBHQjNh?=
 =?utf-8?B?bzZUeDE1VUtlc0UrZXZaNkJOZXhUUlJmeTFlWFhvc1lXY1czeENHSWJZczRv?=
 =?utf-8?B?cng2U01sY09BRXpoQ3p2UlJ6MXFQcVNtQXVWL0hiZUZnUEZRbS91YUVscFo3?=
 =?utf-8?B?QkQ2MkxaMFZMbjM3ZDA2NldRdzZvakhoajBDTVdnMlpGS2FPa2hVL2FGcFZK?=
 =?utf-8?B?Z3R4TmtrVnlIakIwUGo2VHZBMkJ6L042QSsvZzVoRlYzWUFxalJQYk94MmlG?=
 =?utf-8?B?ZFRlZE43dHZWUUt6eVRNVlZ4U2YyeW5zRjJlUUNSRjRMUDF5NktiZ0ozdkJv?=
 =?utf-8?B?VDJDOW52RDNGSmxMU3hWSDVJRXhzaExUTjU3d3JFaVJTS0NzTUFSWlh5TTA0?=
 =?utf-8?B?RGFLSVY3NFBmS2ovNWQ2YzZhYnpRcTgrakhlZTJTb2dWU2k0QjN6ZVMvbGpk?=
 =?utf-8?B?WCttd0ljU2hGcnEySTZ6VUNCMUVMZXo2RmdZSXBXcXlDYW5pK1BHSk1ZeUlD?=
 =?utf-8?B?SzVRSU1pbGdXSDJJZnRtYktIdXdURWdBeTdzWlVBRSswSG5QWXVna0l6aU1s?=
 =?utf-8?B?NkdQWlNieDdueWZTZkdTSm8yOUIwa1B4UUh5Vnp2VGRhbklSVHF1U1l4UGtK?=
 =?utf-8?B?SEtKSks4L01BaXlDTlJZVlJ2aFNGcjhJemJ5Zk9mVVFiQXVwaC84Rko0Tmls?=
 =?utf-8?B?YTdqeU1aUjZNZm5EMTZ4cXdDVjNZSzFNTnozT2p5K0ZFK1lVczF2NE5ucU1j?=
 =?utf-8?B?Zk9MYllEalJFMGpTZzQ0bW5yRzl3R25jZ3F1UldRV3BKN3NTaXRZcHBidm9V?=
 =?utf-8?B?aEUwbjJZOTQ3L0pqRVhTRzlJaUhvMGs1U08xbFIxZFV1ME14eU9Edz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7ca32f-d5a9-4100-b022-08da3a48bf7b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:08:55.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /czrFPVK2KekcZt1TSjQfuUMo4aJ53+UCJfix/EK7HzXQVlyrxoZUufTQkfooXEZlsp/H/7vI/2XZX8y+qBUqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2683

On Thu, May 19, 2022 at 04:45:20PM +0200, Roger Pau Monné wrote:
> On Thu, May 19, 2022 at 12:10:24AM +0000, Andrew Cooper wrote:
> > On 17/05/2022 14:21, Roger Pau Monne wrote:
> > > @@ -1333,6 +1338,19 @@ static int construct_vmcs(struct vcpu *v)
> > >          rc = vmx_add_msr(v, MSR_FLUSH_CMD, FLUSH_CMD_L1D,
> > >                           VMX_MSR_GUEST_LOADONLY);
> > >  
> > > +    if ( cpu_has_vmx_notify_vm_exiting && vm_notify_window >= 0 )
> > > +    {
> > > +        __vmwrite(NOTIFY_WINDOW, vm_notify_window);
> > > +        /*
> > > +         * Disable #AC and #DB interception: by using VM Notify Xen is
> > > +         * guaranteed to get a VM exit even if the guest manages to lock the
> > > +         * CPU.
> > > +         */
> > > +        v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
> > > +                                              (1U << TRAP_alignment_check));
> > > +        vmx_update_exception_bitmap(v);
> > 
> > IIRC, it's not quite this easy.  There are conditions, e.g. attaching
> > gdbsx, where #DB interception wants turning on/off dynamically, and the
> > logic got simplified to nothing following XSA-156, so will need
> > reintroducing.
> > 
> > AMD Milan (Zen3) actually has NoNestedDataBp in CPUID.80000021.eax[0]
> > which allows us to not intercept #DB, so perhaps that might offer an
> > easier way of adjusting the interception logic.  (Or maybe not.  I can't
> > remember).
> 
> OK, will look into it.

So after taking a look, I think we need to modify vmx_update_debug_state() so it's:

void vmx_update_debug_state(struct vcpu *v)
{
    unsigned int mask = 1u << TRAP_int3;

    if ( v->arch.hvm.vmx.secondary_exec_control &
         SECONDARY_EXEC_NOTIFY_VM_EXITING )
        /*
         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
         */
        mask |= 1u << TRAP_debug;

    if ( v->arch.hvm.debug_state_latch )
        v->arch.hvm.vmx.exception_bitmap |= mask;
    else
        v->arch.hvm.vmx.exception_bitmap &= ~mask;

[...]

I'm however confused by the usage of cpu_has_monitor_trap_flag
previous to XSA-156, which was:

void vmx_update_debug_state(struct vcpu *v)
{
    unsigned long mask;

    mask = 1u << TRAP_int3;
    if ( !cpu_has_monitor_trap_flag )
        mask |= 1u << TRAP_debug;

Was it fine to not set TRAP_debug only if cpu_has_monitor_trap_flag
is supported by the CPU? (even if not currently set on
secondary_exec_control)?

Thanks, Roger.

