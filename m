Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FADA6A96E5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505934.778939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY44E-0000RF-DF; Fri, 03 Mar 2023 11:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505934.778939; Fri, 03 Mar 2023 11:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY44E-0000OI-9t; Fri, 03 Mar 2023 11:59:18 +0000
Received: by outflank-mailman (input) for mailman id 505934;
 Fri, 03 Mar 2023 11:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY44C-0000K3-1H
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:59:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0b9adb1-b9ba-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 12:59:15 +0100 (CET)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 06:59:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6574.namprd03.prod.outlook.com (2603:10b6:510:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Fri, 3 Mar
 2023 11:59:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 11:59:06 +0000
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
X-Inumbo-ID: d0b9adb1-b9ba-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677844754;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4qx6QdZIJfrtqyxRdZiDUNM1v4TNZOZGNA8/SLZlOzk=;
  b=YNPmVwj92QIY6M81Yk1UIwsNWviOJRPUYRjd4l9RRObAQCMo7S/4sMPO
   dPjHIuJ55WwDJXr4fqKj7k02kvjTuimC1R/GgZj1ci+Qm8e6lFno7ml/q
   3EPVTBzgQBf82SnBKS/Qdf6OKyOQeCH1MFNacKRKvY9gIJWwIXThEu47O
   w=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 99327614
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OeeDNK3b+6YQSEDrdvbD5R9wkn2cJEfYwER7XKvMYLTBsI5bpzQFz
 zYfUT+CaK7YamWmKot/aIu3oEsDuJbRz4JrTlE6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdmPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfP3BCr
 OMhFi4xVSuo2u+MxK6iCcBPv5F2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFMZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKqA9hNSuTknhJsqECrzXwvNTMdbmCyhOe1llKUQ4x2J
 3VBr0LCqoB3riRHVOLVWhyzoHeA+BkGSddUO+Q/5EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq1/b6OoTS/ESMcN2MFaGkPSg5ty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ikcQlr7AajMpO26Dl+1nC2mqovsKQFlFz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:eYczp6kKMZXcb/+LkKkE7gj0j/HpDfI93DAbv31ZSRFFG/Fw9v
 rCoB1/73SftN9/YhEdcK+7Scu9qB/nmqKdgrN8AV7BZniEhILAFugL0WKI+Vzd8kPFmNK13J
 0QFpRDNA==
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="99327614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GN9Gjhf+n1TODQqNwCeBq51dn3OY6Kpdy6pG/N29tLCajsyKbGz3DCBT3XAIECtCaC9bS8YGkWWa/2ceq8FQeH1Ixsd7OMtuGZmLECi1CYsTCFh25j0YbKflQivER7GLHTA0YZUoEbmhAj/88Y/yEOfUUBCUKemj5MHpFdQIxDD7ikyfF4zJc/Jw3usaA/WG3yuRheTnpLM/n1UewfAE1hw8AhCA+5Aiv8VwcQkLf8ovIKeLWfhZt0wlWRvQAMW95FhsGLPRU9odbhUKHQS6+6W54v2rWuFhp5US3HVuJDQ26p2o0jPkwmJU9YvfjT9aOg7ZA0sxoak5Qtxg19Dqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Pk9DikWWyqoofKzDY/0yqHGk/YP3v+dSWXxHaaICMI=;
 b=mueHVjTm+FEY1gCS6IesuihItsb52gj5z/zL/nwqgDquTxhgboHppVLFeEq2uxnzMs1F1G1Bp1kVG6fLULMBwPiMlCmDynS28mUSWEEmvQ84BbEZKBJsVCBY2FvLfoobBpHNITcF1n1EbU6fXyXDrEd/cIATNapVnxR+8Cs2/IuXQ9JLuaXnjeLml4UbLE1q/7TCnI19MFzpW6Md+K0Ofc+8QpxZLWMIUFna3zIIQPT4gLyqAIKfHlvhLXvfQDVbVW7p7heiipDHw9FLEBxq8eUa5tPsP1oMb8DYjG+n2J+ANweLPdsyv0JqKfsKuKOQOb1jJbP50UxgT69eEYoW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Pk9DikWWyqoofKzDY/0yqHGk/YP3v+dSWXxHaaICMI=;
 b=MqAR6EXRwRp87Cp+Ev6qcYco0zjmq+4aXu8AtoSdDcIAKj4P+/5UMl7/9Rz3qpYqf2O0Rj+jTM2gfdhAhETelByE7ldcmrjqAIV9jEkSEqJSm8o5zEgcKP2QmFb2YursJkxK4Nfq/9a0vF+aXttz0bxN5lqAVfO4Y41/59RaNR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <62e997e2-8e45-9048-10fa-469bfb28b08b@citrix.com>
Date: Fri, 3 Mar 2023 11:59:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: Add missing and drop obsoleted aliases from
 containerize
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230301090644.4452-1-michal.orzel@amd.com>
In-Reply-To: <20230301090644.4452-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 50aee5a8-78c2-4100-d202-08db1bdeb083
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ICUpMqr7hKlGIzgHRwdBnVAZzI1rn2ZIC7OHDcuzsojHpmRr+oBtapchyfOFT1LYWHnzCFsC+lFVDwSbPjhaECuTINZPj0ogK6z6Eflh9DRI+2hiBfztRx7YzBMQfo5ZJk+/QNJBCn/FKQMjgmuHEgL/w+2UNtNne6zM2FcH3mmp59g7jVvIvZaTZknpyvebjkYsDXkCF5ysvMpcmhLrrALi7TPlf1uaE4jiVd8gq6kplPcd7xsTVzec9CVapzRMelEU+yh7Ij/wZKMgMAxJeXlHPPz7jVEmVihzljlCfdBYzKdbe0qQ7RWiNR53UEjl2QzaY34BVD4EMxKtSA+du627TMnWBi4zEbKrtDpB42UtQMJbu1RgeeSZ6i0VARLJO/uUhoqz7iXPhPGS/KkubkgnujdLaHdlM71w+K5VpLmM75jhfJfS/5cfporVyIghmpTDLRdc1UKbQ/IlaRhJxQFK9/1WsvS6kxR1rz6QbNJLDdNEQg2AL3hiTWAqkdL0WNQBJvZEg1eUyxYR1vqnDkRpb1/bloy3bCGGah5o3sXhwZkzRd71+oG3XOb4Asi8mSUVc10fPCODfg7k/wqhb8eBVTU27PirSrtVNYryQ3vSK8auODKNwJShGJHNj9cLYNA0qzgt3FIf69qBPk8h8n6d7ERlQzh4M9yEPsLSZ0H4ffUkMcxWQT3aIwqFnxrNRNM8vx0XPFPFmH+/iMjaoa+RueFoIYIy830tCAqwKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199018)(66556008)(86362001)(8936002)(66476007)(66946007)(31696002)(4326008)(38100700002)(8676002)(2906002)(54906003)(316002)(82960400001)(5660300002)(478600001)(36756003)(41300700001)(2616005)(107886003)(6506007)(6512007)(53546011)(26005)(6666004)(31686004)(186003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkJvSC9hV3hYVnlRTjRFejZReGxxUkhwRks0VXV2SnZsYWRWR0N5RjN2THlv?=
 =?utf-8?B?blBiRm5SakxNRGpJQTZrZFRUZnRQUXVZUmptYjg0RE0rUXdmRFN0MkVrdW9V?=
 =?utf-8?B?YUJCR0N0ZmZrd0ZEWFczKzNDRTNvc016TmJ4S1pUVXJiQTE0R1hjUmNZUGVW?=
 =?utf-8?B?ZndtYmVRckxjeEM2VkhhNlpLK1l4YTRKVFNrdytzMWtsWVYrNTF2QThVQTk2?=
 =?utf-8?B?ck43MVI4Uks5VDFnakxlK0kvMGYyejdXRUp4SnBRZmxjaURQYXI2WkNSTmpQ?=
 =?utf-8?B?RzY5ZndNQUYvbytkQW9TajlxeFh4VkNYNWtLZDUrdTQ4V3E4TW9jUm9WZHlL?=
 =?utf-8?B?UnlvL09xM24rVDJ5Z2J6YmM0S1pLTDdhQzNwd1BzMFFzcFByUjhMRnJGTXcz?=
 =?utf-8?B?RXVXUHZ1aU4ydTF5UXY3S2trUyt2Nll1Y3JpdThxVUU2R25lVVpqT3FRTXdF?=
 =?utf-8?B?blFVRUV2dEUyZEFpYTdGcWtranNzVllQT2VhWjJ6OWpkd2RCejhhZ1BNemdC?=
 =?utf-8?B?ZDJFZkJ2VloremdOb3ZmNXUzMFV5a1ZXZ1MrOHE3OE82SXRYR2FGeE53ZTh3?=
 =?utf-8?B?ZHRNWjNWOWtFVVV4Y2pSc0p4YTlzc21BMXdqY00wdFkzTitzYW9rTzMwWFUz?=
 =?utf-8?B?WVZhckx3RGtSZGRDa0RVYTJRY3N1dVJCSThiSUwrajYwZzR6dXZWUnV5Y0RW?=
 =?utf-8?B?dE1pRmJFc1kvZ1pac29vc2tXNS9WQU1zY0xWTHhXVHo1OERXNDNWTGNjaG8w?=
 =?utf-8?B?TGlma0pNSXhSeHd1WWZoN1JobnVycVhUNW1yMkNESldBQ3JlL1QxT1RKb3lu?=
 =?utf-8?B?QllnNVhkT0kyaERrdThyR2gwTlFKUG9mV3VzQzhWMG5EY3hwcWNVc3dvRmtP?=
 =?utf-8?B?S1hJM0ozUUtINUV4eWhmM2pnNWFiblF1QjdVWkwvMHBTZnlkdDhsOGtrYmpO?=
 =?utf-8?B?N0ZYMjJtc0xEMDBtU29KOFJxbEpJdXR6WHo1dGxvcGc0cDRXNFlTSVJDc0FC?=
 =?utf-8?B?UnZZdXlzaHM2TGRZdmxsUEdvS1NVU2J3bnQ0ZUUvTGZhcWJmUkN0b2lJRzVO?=
 =?utf-8?B?MUk5eXh4L1VOck94c0RudkhLRVpjZVl5TnQxNTQyOExHNGRBbWtRU05OR1Q3?=
 =?utf-8?B?NVpNaFZVQnJTdVJ3aWVqUHhiQ05WaDFoSitRVXJmNGppMG0xVDJ3RGtTNTBx?=
 =?utf-8?B?KzlxcjJYYVBENlIwQ1ozaXkzVTQrbWFqTnlBRUlReS9BV2c5bEhMcU5LU2tM?=
 =?utf-8?B?TXI0SWlablN3VWtZNWd0MWNVM21lZXRUZS9iV04vbmhsOVVURkdCVUZ0RElv?=
 =?utf-8?B?dmRUVkRtMERhdzFwZTZMVFZnNTNJUk5xN1MvWkNiQnZDdHJlcGhYMmw2SERE?=
 =?utf-8?B?RHR4VUZOSE93L2Q2c3A0a0FGRTBiQzZHOUxZVy92NnlRQ0dVT1UvZ0FXV3Bs?=
 =?utf-8?B?Y2RzRlZCV0tDYXMvSFgxZWlqU1ZvV0E2OGdCclZKMGZTWlJoYlJyTWJadTE0?=
 =?utf-8?B?eU9oa1hqUkwwVjd1Zm5yZ1RFQVcyaGlOY2U0WVdzWXFJNUhTZ1lFYm8zRk45?=
 =?utf-8?B?cTU5elRleGVmQVpLS1FkSmg5d3FiVXZ1MTdnSlVMY0RYZ2JYMTVBRU9xQmp1?=
 =?utf-8?B?QUVNV3ozajRqdEgvOTV0SVZSeGhiWDZYZkxoc0J1UnJVdmhYUCtWY1ZHNzVM?=
 =?utf-8?B?MzRVdGlTaEFZR1RiSXF6cGVqSmVhZmd4aTdHcWhQell4K1hmNFhVTmhPVFdE?=
 =?utf-8?B?bDUwekpqNGpVck8vc2JpdFNFTm5RMk1EeXl1cHdxUmNjNmVLUlJ3K0ttSmpK?=
 =?utf-8?B?RWJySnZha0NONDY4QmRrNXlaUEZXbWJqdFprMU9Fakp5SzB6MjhDeVlqZy9B?=
 =?utf-8?B?UGgrRTZvdmtXeTZYaXVoUWM3N01NMExGbi8xbzkrbTk3SnppT29QKzljeDBw?=
 =?utf-8?B?ZEEwVTljQmxmRGdYa0xkUC83OWtrWVRmMEozcitFaDh1aGpad3ZYQTlHNHhu?=
 =?utf-8?B?bUx3Ni9XQldENTdVNHdxbXlVUGJTNyt4WTkrck5xdEw2c3RHSnI2cjAxRVBw?=
 =?utf-8?B?M0JlOG42eUJhcUFyQVAxbnRML01rR3VoL1dUWlRGZWIyS2NZQlRSekVxMDBu?=
 =?utf-8?B?dGZzVlV5MEdjTGNJelluNDc3SHFjaWZTN092WjlhaURpMEJRdjF2Lzhacklw?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O/nxVtLoQKzwPdity1+9slR0/O4Oq+pUg/spd5NJLuLGMIh6a3HaeWmswTVIwewPU+mpNcWktq9gyxO3LaIEpUcntO04kR+YZdc5JRLPNf6QAeuUlFwKff2VvbyOUCrPSXLXfb6jlNLXGgu/xmD5CzlOU49+YNjtoTcITcYGJLMs9ciK6kl95gYIMS5jA6EpRD+DMFJmntfaNakRV6pCRjeOOj/temU7U7GGA+cYtkdCkMEu3wAHFjmQS0UA3qGAaysRLaO0uJAaf9e3zVwjrUSoqBDU7Qh1klbQO1J1w1zsboo7HZA/Y4AsiTG6OUMnvT1yRza+NXYRcuHHMHh2uVKwpyLgoWPIVYFCRP9tQ3zcQKH+FzPNVQo1Du4PnA28NwSaIWGDLa3hr4bxyOUJL5dWGInIkPLel9QktcrL8Gv0BXhfXdtx7nXWxCfXMsWLjsxkTta0BNLJF0dWSS4IBQIh0BUkAP87TBAwfmDdUcoLaQ03u1W03lDCZLIBzz+uaiqIvX9o0M+1hgnSmkkueYijifGCbtjlaTQLDTk1SBOhUbsMH2/kNUeXLIh6bJMN02lHjPHtm5IXqbg2CoLftqUf5keJiMfO5X3FnsY6lUa+4KmKPvG/erq/VGDLk1UxFaaDipLwCH0QwRMgGNA1dRq8prFMnojeaRBr862+SaebBkQardvkY0RCM5glTEmOI50lc3gP3KLvSUocpAKMwAJ+7s6ApVCLZTsgoMignOhJoDF1mfbz1BPgRYv8cbTMm1bThUEbA7ap7PiLW5lVHTNQ59RoD0wb1ugkPPMwc9OknqRdNkg/aYMTaRib5bODYAzDASxwZjwl8AdLZE6LwRza/IYOH5GANLu3QEsLjo8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50aee5a8-78c2-4100-d202-08db1bdeb083
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 11:59:06.3988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3DdUimn05LQuTjoJWtJSZKDnEi5iPqmiDppFyO8xMSnd+sfAYwcYM9ocy2yNOEEqQPbHebn+QXweCoi5j/tRhtgFhnIPugvjFUAhx+E/ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6574

On 01/03/2023 9:06 am, Michal Orzel wrote:
> Add missing aliases for:
>  - debian:unstable-cppcheck
>  - debian:unstable-arm64v8-arm32-gcc
>  - ubuntu:bionic
>
> Remove aliases for no longer used containers:
>  - centos:7.2
>  - debian:unstable-arm32-gcc
>
> Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Open questions related to the CI cleanup (@Andrew, @Anthony):
>  - Why do we keep suse:sles11sp4 dockerfile?
>  - Why do we keep jessie dockefiles?

Because we don't yet have a process for retirement of such things.

Right now, all branches other than staging are using the jessie
containers.  While it's still in use on any branch, we need some way to
rebuild the container (potentially with modifications - see the recent
HTTPS fun), and standard practice is "patches into staging".

An alternative could be to patch into the most recent staging branch
containing the dockerfile.


sles11sp4 is more complicated.  We specifically tried to get a SLES
container working, but it was always in a weird state (only @suse people
could rebuild the container).  We did eventually replace it with
OpenSUSE containers, but I can't currently locate any evidence in the
gitlab yml that we wired sles11sp4 up.   Which is confusing because I
swear we did have it running at some point in the past...

~Andrew

