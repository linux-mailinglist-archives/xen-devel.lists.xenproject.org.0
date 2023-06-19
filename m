Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F3B73578C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551076.860392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBEXw-0005SA-3f; Mon, 19 Jun 2023 13:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551076.860392; Mon, 19 Jun 2023 13:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBEXw-0005P7-0q; Mon, 19 Jun 2023 13:03:52 +0000
Received: by outflank-mailman (input) for mailman id 551076;
 Mon, 19 Jun 2023 13:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBEXt-0005P1-Py
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:03:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9259cdb-0ea1-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:03:47 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 09:03:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5930.namprd03.prod.outlook.com (2603:10b6:806:111::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 13:03:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 13:03:38 +0000
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
X-Inumbo-ID: b9259cdb-0ea1-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687179827;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d8BPQxGBWr0IctFJzC/8mc1E/TFhGV3kEYrVVCZ2bVY=;
  b=hzgGjLbseZCCGM4i9BnRmABx0Ye2p11YXO+GqH/2k7YRJ5gQ8wbY1m+Z
   P6zIvWmpiHHl0ZoPzhzFz5aAHGpmJuJlU8qAy//rz90W2AGywPzXsV4M0
   uGiuKAiTURsaSlrEEu6C6pJE3i+fPpSUAEGHBEfR2N67K0IBAWCGpY8D6
   I=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 112070723
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Z/twh60zQ5cwlNY7DfbD5TNwkn2cJEfYwER7XKvMYLTBsI5bpzVUn
 zFKXmDTM66MNjHyLot0a4XgoEsGu5fQyoAyGVY/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJnNKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE25I1
 tMzNDY3YT+7p8jvnb/ka6ozv5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqhAN1KS+fjnhJsqF2B72oTJSYUbGKmnMaGulC9APxPE
 nVBr0LCqoB3riRHVOLVWBmxrlaNswYSX9cWH+BSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsreYVHac/be8ti6pNG4eKmpqTTAAZRsI5Z/kuo5bphDSSJBlGa28jNzwEBnxx
 SyHqG41gLB7pc0GyaS9u0zGijSEp57VQwpz7QLSNl9J9St8bY+hIom3s17S6K8aKJ7DFgXR+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5dEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:EKMftqy9coYBIti2Dyj0KrPwAL1zdoMgy1knxilNoEpuA6ulfq
 eV8MjztCWatN91YhodcL+7VpVoLUm8yXcW2/hzAV7SZmnbUQKTRekJgLcKpQeQfhEWndQtt5
 uIHZIOcOEYJGIK6frS0U2VFMsh3cnC0I3Av5ak8561d3ANV0i31XYBNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AKhh0YWjngO6cLHlMTp6ADWkVKTJuYHLb71j7P0m?=
 =?us-ascii?q?CBklRaJfMFFLP2eA7qp87?=
X-Talos-MUID: 9a23:39X0sQhoppYkFkbaHLK078MpNNVB5aSDM0I0qIg7hPa0Ky8rFSektWHi
X-IronPort-AV: E=Sophos;i="6.00,254,1681185600"; 
   d="scan'208";a="112070723"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Khp2ZgQoPkwTwp4oiXj1UkQqtxI0ThF5imKyjk+bgXWgVOyaRGghvRjYTih89eMWv8JQPp5u/8/VrFjVPa+ylBtoohk3qvAeo9IZUxfNa0ArXPq6YpuW+z47eOUPr2CzsFGfLKXpbaDlKIvHJWXGPkm6l+940S58xdQcuLNJuBGt8qGwXNYJwPs9sgW/wxB4JRXYBg84wHNTWqQOPRsikm/pCMlyWUHgGwVEyKpVugfZaJRBM2GBJheV1u2Ln3JHlY1Gi8X8bP3hU9DQnOjTbnIVWANPrLB18wKV4ceF4x+ocMq1yrORsXmkwV5L2jiV6U22cRnVTQ1egzOPr+or6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8BPQxGBWr0IctFJzC/8mc1E/TFhGV3kEYrVVCZ2bVY=;
 b=TgnDLMa7SbI4cE186RaZkTJSNi22tqNIeNt/vj0NPpCR+xyRyxkc+G+WTRatthOb37nzdXpXiY7ch+sywMaYxKfNveJmM6svBg0l6f5sEPmGdBFjhObeUun94Bl86vbBI6jP1bcruQHScXV8simR+vUivwO1/DOxlkLtCIUKWZ4gAoGEmb3nN3g+of/dUrFeCOGJHavOnL1obdls6H3p5Ip9QkTGa+uAx3mFgW2BiAeKQBVFotsuZ7Xw2mgHIDgOY7S7h3W5kC/sNUxrk4njTmAiIMa+Gs8wPg+SR8p1zwz5oBvbrYp4EWyWrpEdkYdMMZCJUczIteMm/kjbPAw9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8BPQxGBWr0IctFJzC/8mc1E/TFhGV3kEYrVVCZ2bVY=;
 b=XygJ+5lucnIXHWgxFfErtoPhXIO3WfdnyHnOp1LEhbN3Q7XyxixkY3kRB02Kgp4hSXmQFcY/z5Vvs2UugQ1BIGu5Z30iYDPgY6HXVr6hpdHdwCx/cLATrrvUinIsx5I2Q4sT9bCN5/aEV7lmIvRmSc2QpG12/BTiXr54V4NS/2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b5ff3e4a-7203-f3ba-59f0-681338605ff1@citrix.com>
Date: Mon, 19 Jun 2023 14:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] xen/trace: remove trace_will_trace_event
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230619121817.21969-1-olaf@aepfle.de>
In-Reply-To: <20230619121817.21969-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0138.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: fded8048-ee0b-4c04-10dc-08db70c5989f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BWTsPfZ1+hgV6h2Dk+PjwxpjeR45VObX9VGhGHK+0L5CAgj8ZGGZLvr42yDOPS43n0jmmgMipecMvloWAPE50w4qBxEZIRpXjMFsoFRFZcD9DBOmcAeKieq50ZGOGX9bzJUJhQu3UrfTGh3vS5v5tgEw9RYTWP5ttKtl4tDzApHEHEAm2wk4JWxcKlkQ+hisNTkec51tT3aTtmvnknzaUp/G/BPCOQODcy7helcF3fgzFROpzVP0Aqd3v+v5Sem5FprzqpY7nb27/VrB8U76LhRV9CEy1EKAzgP+EO/MyQBM3FKoqPg6FMU1nTWYG9RXSyMUrZLXq5jTSf9eaH356/PzTZ5lm94LQsbeMMWywVBfy96vb2rwXkLNtnCpIlxJVCMu3hPTzN6oi9OE0RbAzElSECXFiHCv3Bw3p8mT/AgcxmbxzMQa5jxNV5f4eMqsxEe+aBzXsFCwWxn7W5fnOq7R6XlRc6zwnc2Mxq+ejJZPdKX8IpWW8eefn4qs9a/SIvKS34Cs4yWyPkBCodd4EUSc8qCJ2Y4+VD4LIR4qaaXVWQcbQisffPC6uuge7b8xeshJhAqzI8HQKGfnyTHdlukAxs+TGHAMgSmpOyB90P+BcNp+ybr1SlPaNPoSUG8JdXSR6mqM3uX3GuORr3O2bA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(31696002)(31686004)(82960400001)(83380400001)(38100700002)(86362001)(41300700001)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(316002)(2616005)(107886003)(6506007)(53546011)(6512007)(26005)(6666004)(186003)(6486002)(478600001)(4326008)(54906003)(2906002)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjYyaXh5Q3lleDNLb3REenlFNFVMWHZpWXU2R2k1ays1ZW1ycUhMc01WUlJX?=
 =?utf-8?B?L2s2SUh0ZDZnemFhRWxvTkJCNUhXd2pLem15anlPb2E0QzZJTWg0RlgvNXBS?=
 =?utf-8?B?TDM2OXhWKzV1Z3RQV05CeU1PY01KT0RJaENwaFJNdVVOa2dzbkF3UWVSS3JQ?=
 =?utf-8?B?ZWlNdC9iSTlFTnk1eHUrVmFIOUF1Z1dEa1VBYk9HYXdFTlJNTVplY3JDMnBj?=
 =?utf-8?B?dmN4aEI3SmZRYTQwS01YeFlDRU40WXVoQ1ZuNG15OUJRSFFzTmo0bHFQTzND?=
 =?utf-8?B?c1FqYklpWklkU0d6Ri80VWtQOU9CN2hwSkY4STlVeUhNMzhCVTBRRGdRUzFD?=
 =?utf-8?B?NFBBcVd6b0RxUlY0Wk5mdGdQcko3dDROUDhZdStYYmlnek9NS3hodGJnaHJR?=
 =?utf-8?B?QXd6MFBPQWlNeXg5QkprdVhpamNkL1VRWHc2MFhacXZZYlp3Zk5pQ2N0bkJ0?=
 =?utf-8?B?SHVOTWxQaDIraUdkcHR4NEROT2ZyTkw0ekVCUC9Qbk5ZQ3NuWVIwVkNVeW43?=
 =?utf-8?B?ZTdZc3RESXhpeG1rS1gzWk54bEtML01pejBYTzIvaW9aZDAvNk9XMWxzTjNy?=
 =?utf-8?B?THMvZTR0Wm51c0VIQ1FkU3IyQnR4TFh0aFU3ZE1XN2xrdktOdUF1TncxUUlP?=
 =?utf-8?B?ZXg4SGcyVTV1azcxMUlRNmZvdUNvWlpmZDRnWjJkTmFyV1R5SFF3NFNJeHNo?=
 =?utf-8?B?TnRPZ2tDTTZZcXFRdmZUaUdHR1JEZHdJQ3JYdjNQZDhrNGc5TnRzYUJUNk1l?=
 =?utf-8?B?NXVZQVhzWk5wVWNhckJGODJzMHRpOWx2M2pKNXV2MW1XL3I5LzR3TUkveE9x?=
 =?utf-8?B?d0lpZmVEaWdkdmRudms3T3phaFZWUWRjK1FYZlFkeDExbDg4RjIyeWEzckdm?=
 =?utf-8?B?dCtQS1k2aVBxUEdJNElkbzRNbmxDMjErbDJYRVQrOGkxQ295cWZYbnowdzVp?=
 =?utf-8?B?UXhFb1VVaG5xNlVXR2l6ZS8wTHd1bWk1ZG1DSVNaVTZGVVEyNW5XV0Z3TXIy?=
 =?utf-8?B?SmtTYytjU3ptMk9RMi9GM2d4a1JtR1BCMUVFN2t4a3g4S0s4blJxNENtNjgv?=
 =?utf-8?B?YzVKZkZmcVU2L1pUTmozRDlDZ0hJODZRS1VjNlpmWnNOWUZqdmpuUlk0alAz?=
 =?utf-8?B?LzU3TkQxc0ZqK1hCVHhIUG40WUVNV0FlQ2dqcGtxUmw2ZGZjd09vbjNoT25Z?=
 =?utf-8?B?YTNjL0o2WW4yYklJL0RrN0VNZkY0bUkxR2JENCtERGpMbytqQmkyaEVWT0Za?=
 =?utf-8?B?Y1BmQ1czYkZMOHVNQmNJcTJxeTVrVyt3KzFHTi9zSTRVRVMxU1NEc0xHeEw3?=
 =?utf-8?B?d3N2eGpPT2cyaTMxcE1wcGRqREdkT0RjQ3BjZGJiYnFtR1Nra1NPSEZtdnBV?=
 =?utf-8?B?ZmFISEZlRHJ1OVlvYmtTaVNLa0U1OTVNeC9OZ0NadlYwWmdvejNtTm91eFFC?=
 =?utf-8?B?aERab3d6RlVBZkRyN2Q3MkdabHdIRmw5anFJSk5pdTJId0tqVm1lYk9udFVx?=
 =?utf-8?B?dFJQN1ZIdnIyUVp4YndtSFBCRVhSVW93QytYdFpXUFRESGxUbmtjdWZOaENH?=
 =?utf-8?B?MitSVC9iNC9XM2ZrUi9takVGcWpIaXQ2NHBKNUJkZXBUUXZnL0tWWWdhR0xE?=
 =?utf-8?B?Q2ZBcnppVmtvWUd6Q3p3ZFUyN2JKajRjVUtFQldXVlhQVEtOaUxGUlNreGlw?=
 =?utf-8?B?S0FCMTM3WVZ2UXF3WS9XUmJNbkVsR3VJMWJaeXpqVWp5R01ISVBidmp2TUMx?=
 =?utf-8?B?MVBubkY2SDE1SVgwNldHVGtyTDluZjRqVzZCazR6R0E4SXBReWhEcWk0K2xj?=
 =?utf-8?B?d2VzRFAzd0cyVFRVdXZHRVVxZFdRdEFRTVk4RFZ2QkhGMFZyUWF4cGYzNFE0?=
 =?utf-8?B?aXZHaC8rUzhEZnBBbE1EUHRVMFo1b2xaV3YrbEQwMTFCazZEaHhPVWovWHB1?=
 =?utf-8?B?OTZBakY5Z1hiMHdXdjY1Q3dLNk9PNFlOU1hkU1dWUURETFRReTZHaVQ3NzRS?=
 =?utf-8?B?bW5FejVWVXNHclZzVkRXVFdPd20zS0tNdXpGYTk1dnJtQWc5V01yUFlpakZ6?=
 =?utf-8?B?dzgydW9raXhXQ3g3YUIvS2hvem1NL1l6TjZLSnA3bktmSnBFZjZSaDVxZ2k5?=
 =?utf-8?B?TU1hdzBzTFVLM09wMEVPN0owNlhoemh5WkMyL1dpY21HdmIzL3NSWnZEWUsv?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tOuocpU46pZ1CTFKMROJ4QiHppYvosLduRdhDMOVsHuXeGVA6qsfWcTHGw010FkKRGjlq6w6BPQbXvpZAWx4Gj9QTIuukzw3kLBw5T7DGL3tsbxESopDip9O61/MKsbgaVJJ5I5X7gHcsX4kzyui2XR0WhHj4ifwc9TZ1SrEQ95thB0dcc032aCFuo2kJdoK78fh5XaINlyIom12eFgGCjNrQgVHf9ntBErNtVMZd7No4eZvWx7OqEeUh/5KvayJqLyzLnblXhMffr7deW0I6l0nXOgsGtOHY/m8rJtrv5j8k8DLMbjeZZouhA6dh6chxmkbsRLzLippeK+b+cgARawW+hoSBn7fPa4AW3Y0xDrx46c4rpgC/vnDRKyf2vYyL+UPRfvchkcveReode6xmGiqIow0N+qlPwxB1qYukpOzgps4awaa2ZmqqRw2knzpel7ngRH3TIQ8N6UTMBuotGzQjR2Od7+FXZSjLO0Gj1rMqMjIF4fKHAVa0Czr8l6GOmUt+FjqjBEgRRJxPxeRgJeVnLlC5Ki8Ko/lnRwJtvtVDWAxQ6zEkUM4Q3Q4tRUKonRO+ZBFftre8YkGpPnnFPhFmTaDXMo27GCWA917Lp3a33B5thywFGEQjQxnzQrmPl42gyvIs+Sh1DofxVEdU1qvp8ztAjhWJqGMIGpdBHbIyeymfNGLM76DHUc0gh8YKhJzX7I+Lae75dWeEuVxLoZTLCo9qDizRbGnUpZgBeeV59POc8UmFIt1JIqlE797S+EuBEiOfi+rvHpXvJ4zDuOKuFdzyyP68ejyI8QlTKwxu25b+RjW/UgovQ9p7NUCyI1K4/+C+HsA6E3+4JnFd35F6pzXva/hncXtwj+FPrk7Z8fZG0Z7c+BOuGuCogMS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fded8048-ee0b-4c04-10dc-08db70c5989f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 13:03:37.8164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ls90AyVRlziEs8Roc0f6JzJvpgGlTiDYlbHh/ZBQWCjn0teaKvSD4Mvqu1ZFPgKKbsBcGUkhAJAT+bvN1y61XdWfAcr7grtgXQfvNFcryKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5930

On 19/06/2023 1:18 pm, Olaf Hering wrote:
> There are just two callers of this function. It is identical to the
> checks done in __trace_var.
> The commit message of 9a86ac1aa3d2ebe1be05dc7fe78dd6759aa3241d
> ("xentrace 5/7: Additional tracing for the shadow code.") gives no
> indication what the benefit of this function is.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

This looks like it is meant to avoid double-tracing the #PF if
TRC_SHADOW is active.

~Andrew

