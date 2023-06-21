Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8E738E01
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 20:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553086.863441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC29i-00081k-Uw; Wed, 21 Jun 2023 18:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553086.863441; Wed, 21 Jun 2023 18:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC29i-0007zf-Rw; Wed, 21 Jun 2023 18:02:10 +0000
Received: by outflank-mailman (input) for mailman id 553086;
 Wed, 21 Jun 2023 18:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC29h-0007zZ-FP
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 18:02:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb4796b6-105d-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 20:02:07 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2023 14:02:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5873.namprd03.prod.outlook.com (2603:10b6:303:9b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 18:02:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 18:02:00 +0000
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
X-Inumbo-ID: bb4796b6-105d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687370527;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7WZ2tzKypgAROr+dORuDn7CwO5xKfrOV59gigBp3nWE=;
  b=fyXJN/aozir4oHA4FEiR9wdC2pl/7cbZQaJteShYfB6Xo7InTqikrQ/d
   eRn8//2CxzPBIiEmTWLHdCX2euLQNCsmxrgfhNBcqJaMfPlFvOkAkN/bf
   X26tpl2QMws22X6SSTr1bv/871CU+5jex2TAeocnhvj1/J4qiGlekFIRj
   g=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 113679250
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z17ej6gMu9pPZluxZ92DRW0lX161rhEKZh0ujC45NGQN5FlHY01je
 htvUG7TOvmJNzP0fdkiO4W3px8E78XRy4djTFZo+3xnRikb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gWHzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQhFjZQKQqamNiXwYqCFbJQ15gqDODkadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybrI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTjqKE72gDLroAVIDEdTli5r/nptmfgA/VgI
 RdI1BUWoJFnoSRHSfG4BXVUukWspRcaUsFMGvY77ymXw7LI5ByUAGcFSDNMct0gu4k9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt/8HuqZsoiRTnVN97DKmvg9v6GDf9z
 iqLqid4jLIW5fPnzI2+9FHDxjiq9p7AS1dv4h2NBz37qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y+d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:RyDvcqrgYSvOK56BE5xlfWQaV5oveYIsimQD101hICG9E/bo8P
 xG+c5x6faaslkssR0b9exoW5PhfZqjz/9ICOAqVN/JMTUO3lHYT72KhrGN/9SPIVyaysdtkY
 tmbqhiGJnRIDFB/KLHCdCDYrQd/OU=
X-Talos-CUID: 9a23:hGmoeGAtgflRGEb6ExBZ8hNTANk6SFzc9E6PeHPpVW9JYbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AxMAv0AxNr77wlpjlRxyTqIZOhZmaqIilE0MPn5V?=
 =?us-ascii?q?Wh+DabQtPMWzBoguPT7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="113679250"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l28/1pQ/BtpwRdr+vI4wNmEiYtGITyw5XMa0V58ecgFu1zwqhFYpGbGdMBO/ZzH/PK/MASRXMmVsnnoKcIq6u6+hZD9fNbylONCVsygBfSQiA40E6kAlTi7tNHB1Uwi8xI7DiNhHrjUHhscGhF3Q8oUam8jrulDP9TbF52BPOOrj5pY5PLrFDk7TfYGT9Pv2SZlqkvxlFjCBz9KnKk9Wfqp55mA/TK5YBHaGAKU7PEgxfps1llSG4/k+gi93lSJDJ6pIXNRL2kh48archV6HomXyx3WItsod4vcv7t1WeVgq8z1gxl9dfC4VOaPkeeb4PVyBz8Wb9iTPEVo5WSXGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WZ2tzKypgAROr+dORuDn7CwO5xKfrOV59gigBp3nWE=;
 b=BlFZmvlRdb7LlO/8yGd0DmA4pvPTOG4ElwRZZWjJERjY7V/vAIhue+uU7oaDcm/xOQNdEEhdhttYyzlo8wZDeZ41ASY2EfP65IIw5pRMgEr8F8viQeuWUAtke8wLroqmayGMli7OSyYVsDyRnU0OpkJUEId2iD58l3XQ+MArs7UDPMdKP4XOJd/0/D9kC1F0HUnCZ6hjTeNq50n3OWvryTBe1iJix3SwgrYt4+SlA6mZS42gQdE5H6C52GMPe+uGOwl5GQhAFu+G3BGeb3nseFWvoeJWYPf8vml5CeHKRKmfw7CvJjkdS/+LNHhMVOg1OAp0nkdtXRn89iY0WMyqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WZ2tzKypgAROr+dORuDn7CwO5xKfrOV59gigBp3nWE=;
 b=guc0FjoJHZ/qMtCQ6MQe8v1cTp43EyKJDwDD8gQpNFxQ8QFhyr2L2/R2X4lTdX6DY8QWCOOa2TA4MMjvH6YCMwLoqP6tDKRCQyPMYYrKks+VwRYRvUqSSzTf7eElS9OZtZGDzKIcDauHsEvZW1xv1CQQucv2eAm8vt9lsU197JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aa3a2db2-8e1b-0cdd-7fe3-eeaf2abc5832@citrix.com>
Date: Wed, 21 Jun 2023 19:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] automation: Add QEMU to bullseye-ppc64le
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <e07442f76aac05398cd0115d90db8036337462e9.1687366665.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e07442f76aac05398cd0115d90db8036337462e9.1687366665.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 8977f561-6ec6-44e0-fec8-08db72819c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qi4T+lm0+WxMQLLhYVbRfgjmI/LmsWdFg9r8mBFTFUiPEq+MrA+7BmZwvnro8UMV/6M1EVE9wk5nkkXt7NtKhcm5vVfY/BjHw5S4jfHEkKHSILDNPywoDEIbZzl/5StuNa2Gjgqg9tsn5f1pjx8i/JgkbCffuYUdEdXAC0Rb4Bqe4PnHCmAVAaegS5jEiYjzSboc2nWtK3KH8M1b9pdTimq1cHaWa8B+kCUAZAT9tK1dLn6FbHp0OSA04gTHbpUTurlwtgtLNAs9E07olwm9PqMMongYOJhBGT5f1I19Bt0zISyXkcLcB8EyVp3bzopknXD+A/ZjbOSkfvihXifi/zRLxlAIgk3eoaekDOYpfaX1hQufedH5zLARNIJELRYN1MDgPWtxiU9mdU3wNOZhK8B7MoHppWR/kYmN/bhvTEpY7iVCVBwNj6kzCvfGGRTKEiroF5nGSPMHhpH/AoINQy+fHBvMSeHJg2bBDEF04sOcb7acsfsZDKrYSKcSo2nJcDlqFYzcl4JgOBDk52SefaZFOghRcNYDJASYBVJzQvCKA4h/LoqRFmfPMF1Sm9Dgw0ys3UNih909DzMjy6cfyCshuzzQ06f+So30Da26piUMj6QkkRuCpTSe7EpJ+ORa18V6dnaGTLS9AyU/dlk61g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(82960400001)(8936002)(41300700001)(5660300002)(66476007)(86362001)(66946007)(31696002)(4326008)(38100700002)(66556008)(316002)(8676002)(36756003)(478600001)(2906002)(4744005)(6666004)(6486002)(186003)(31686004)(6512007)(26005)(53546011)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFg0U2NMYVgrak44WTNVNjB4WDJ5T3pML2c3ZDY5aVR4WUUvVTB1OExWcjlU?=
 =?utf-8?B?UFhjNkx6Wm9kd3VoZm9RaUtGbkRvU2FYU0JycFJoUEM5NVBBU0xNV0YzakR1?=
 =?utf-8?B?QXV0ak4zcjhyWGNXRnJjd0xqMTJCU3REQXYrOENBRkg3cGhtOUk4b0RUUnlU?=
 =?utf-8?B?cmdnZnF1QmFRODJZSE8rMjd6ekRUT0h2ZHlMY1dPazRobStDc0ZFMStUTGtn?=
 =?utf-8?B?ZndqL2U5YzIyc0RKamMwWmpjVEIwMWl2eWlzbWJNUUhXQmptcCsrMGJSa3FM?=
 =?utf-8?B?TmhFdkhqdDd3bWp0eXpwNGhIQTVzS2tOSVBIVnpOVmd4Wis5L3RSTW5VeDY4?=
 =?utf-8?B?b0ppM2MxZ2RlWS8yWFpTeVpNNU05Vmp6RzdGR2JhcDJoYjVXN01ZVFVkT1Na?=
 =?utf-8?B?V1FVWFZzaGVoRnFwcCtSaWRXUGhXMFpkWUd0b3JWOHpMd1kyY2JzZ3pYNXlS?=
 =?utf-8?B?RWp5b0pXaU45bUdXbjlMdE5SbVNTVFdIZ0VJS0xtaWhpUVBScWhFNXZ3Zjdo?=
 =?utf-8?B?cWZudGJzRklxamZtaC80bTBwVUNNYVlGQ2NjM1N5cnpJT2E5VE8rd3hmVWts?=
 =?utf-8?B?N0ZoZjFxVVlnT2pLNzQ2VXFMd2JhZVVzKzFteWNCNWdTbmVLNWp6RnExcCtr?=
 =?utf-8?B?Q1p1Zmg4TVFGaDlHQk5ITE5hRDhLRVIvU0l3UHZHaGF6YVZaZTE5ek5keGRL?=
 =?utf-8?B?RlQ1NEpPS2sxT2ZIUXk3cTVFSXJCVVh5ZmV3QVNyZGJ2NWdIUFBHYVJPZXJx?=
 =?utf-8?B?T3dYbGhGN2pwOFZxNzZxNGM5WThvMmhUZkpwQkVCNytGM2pncWdTZUdudVNW?=
 =?utf-8?B?Z2tZL2dab1E2ODREbEZKc2JoSE5NVytrNW5VczBYMWNwYXUxRFRsM2p0MmRj?=
 =?utf-8?B?ME1kTEtmYXR5ck1QMm9NeFhBY1BCM2NzaUVnWGEyNUVXeHpuVXNtT25NTDVy?=
 =?utf-8?B?aDZqb0grZzc2UmFMeEl2dThpSTRQUGo0OUJMQ3NWMzlZdkwwOTlqdWJGVTF2?=
 =?utf-8?B?ZFMwRmpQVmRHOU1VQjVSYVIyRGoxdXpnaFlPdGkwK3RGUXc3UVY2bWppZ0FK?=
 =?utf-8?B?WTRCQUIwbEhBS1JGZ0p2Y05rN01pUUlVTWZjNWpiTEtabTNKeWNJU3k4REpw?=
 =?utf-8?B?ZXMwZ1MvR2tPdy9QclpWWUloQVVGZ2Fwb3BCY05ZYVVJUlJYNUYxNzFTendC?=
 =?utf-8?B?Rko3Sm9EZUo0T3NMWFhuQTV1MGc1YXRNNTZ3aUM4dXc5QkdneG8vY1FMVGoz?=
 =?utf-8?B?QndNV21VSEVJTUVTT21PbmluNmkzcjlPOXhoV3YrdjVlMm1GSVQ0Wi9nMG1l?=
 =?utf-8?B?RmEzSmhVMmo5dFdkWVRJY0NIbUJuNllIVTZCMy9adHpsOG83OWVYVHBoZGpa?=
 =?utf-8?B?V2ttTHBudVhoTzVablNhbmxqYS9Kd2JoNzcrYUZWZlNqbzJmQkJKMXBLZ25z?=
 =?utf-8?B?eHg0VVduMVdjUVJWSmJDN3p0Z1lrTWJrNlMzSU44LytzdVh6NDQrMGNhdGN4?=
 =?utf-8?B?eUoxOWEvU0Q3VktyeGM0V1dIK3JUVEpoTzU5YjVvODVMK1pJelBFTFRpY1hZ?=
 =?utf-8?B?WnB2dHNOTGhrUFlOZDRkT2hoVFBCd0czZm1ic3NlWURuSDNmWHpFZnFHTkxs?=
 =?utf-8?B?VTBOUU1YVytuanVCM1Y1Y2ZyZkV2UkliSTBRck82cFZDUG5JU1JKQ05NOTRV?=
 =?utf-8?B?S0dVVXJNOXhsb1JvR3FURHNlb29iNnNLbXNCRnVZWFlDRC9hcDZ3TkUzOE5k?=
 =?utf-8?B?VWhPaThsMGhLb05SSWlkUWF1ZG1zUitRTTBGeENjeUErV2lpWkJReW16UVQ4?=
 =?utf-8?B?QnVDUGFNT0NJNUNmamtCbm95eEttdUpCb0xKVDEzYkVFK1dxa013REpENDF2?=
 =?utf-8?B?YjZlK3lwTGl5eWh1VkE0bXVQbWx4VkFZMkZoTzU1b1J5anJhb0lic3lnbm1u?=
 =?utf-8?B?ZEx3QUJoU1VYTTlaYTdxalVxN1NiajQzVnpLUmZTOGRXeDVQb3YrTjVLZWlx?=
 =?utf-8?B?b01qRDB2czJvTDBIOWczbFEvbjg0dWtUcUdwUkFwK1BCNUpTcndIZStDYmJ5?=
 =?utf-8?B?VUdhMlJWMHhKdlJ5Z1FZbTV1cWNtMlI5VlRMbXZlY0REOVI4QlRzSWF1bzhL?=
 =?utf-8?B?NmtuME5hVkIyR3dnQjEvQkhUVkFCNkZuQ2RsRDk0YmZXb0xFN2l2QnVpYTVr?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YrZfjxMAnFuiHhaWkwuCwBI7wpq0zFGpIxNB7DjM89r4ZaThX8WoVp0rquHWS529JMarrTIhnKY7oLF7Pz3AF2xwW9fAinwrknkR7yHytU5IN+TSpVdDHQsK99twahW2PTnxeOzKi3mroxSENuHrEL+eYAeUmpF5PsF63XGyl75I2gJfWud4H0VhLWgLEDViL5Pn3VRdNMTY9p78ukL6g4vYpzO3cAk6oFT5iAf1D+wGwoxZ1N3Y9+AStk0SxjxbhiR0MSYn2dweuUiuzab4cGC2E8NUfGevgHHAtOdQIe4FilOERlFws9IxMzIiSUtn/f7bx57q3NA0Uau7DAK24Uiu3yz+YCpE5P5y7Pj2k90pMS5KoT+K1jN+Sb6eKhGYSvoyBH2I5xVacHpNANICqdc5WJBTUvk9XmyXNb4MhELGtSAMTNQSUWlmrVnEwNx7ovOnDpk6bJQ6dopilpLvL/A7cwPMYQ3IeW/fsynSNU/WW0RM/UAfsSpF0VYFm/uNmAN+gIN9Mzn4ffR1yhDgKj78IGK7dNFHQDXhAoEfDxkmW7avrexrBTBlBxNWcMjwv3RA91w8XYYSJVlimTMzqfwJO8/vz+7lbC+O7qQLLjGzvVTx8wWoN7kK0nXuf5dhrj/ktCvgv+JL6rIewQRlblq3v3R89zhshwzyG/TjxXHcCt4JbIUmEkYIVWnmtdSef2/Lwa3aCYgrhNC9EHXCDRxAy8R7yv2XqrzX2f2hZ1XQtOCaQWtnhTWVenScE6XCMYTbz8lm2KvZcXaiCfj/AdB6uKc+Lp8pXQGNy596DrUecEaAH+SvWdkmAjb9XpzTBMu7zU42mf1ySr63r60Udg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8977f561-6ec6-44e0-fec8-08db72819c16
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 18:02:00.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtzX1MLKh//hdYX71N+wuHV1PdTXxFzTWM1rrdd9qBvIHIh1eoX39MJdKuxeM+jK+7xaoY0oKA3R0P21RBbcMkecG+xfpdZ5gfDC/nBZAsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5873

On 21/06/2023 5:59 pm, Shawn Anastasio wrote:
> Add qemu-system-ppc package to the bullseye-ppc64le container to allow
> running smoke tests in CI.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Sorry - should have remembered to check on the previous patch.

I'll commit and deploy this right away.

