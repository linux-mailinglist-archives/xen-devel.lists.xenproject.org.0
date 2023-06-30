Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFE743D5A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 16:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557508.870896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFF0o-0006Xi-Fm; Fri, 30 Jun 2023 14:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557508.870896; Fri, 30 Jun 2023 14:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFF0o-0006VP-CU; Fri, 30 Jun 2023 14:22:14 +0000
Received: by outflank-mailman (input) for mailman id 557508;
 Fri, 30 Jun 2023 14:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFF0n-0006Tp-7m
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 14:22:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ccedd97-1751-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 16:22:09 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 10:21:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7170.namprd03.prod.outlook.com (2603:10b6:510:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 14:21:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 14:21:19 +0000
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
X-Inumbo-ID: 7ccedd97-1751-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688134930;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KUzQGhQA160ilr/+zbIMHz+WFjdOYWOPGjhySzVRxBc=;
  b=QNizFBJC2cz+mN6OcoLHqvmKBzZPqK3ILn/yjDW4cOZeGO8hpW/Zn3u8
   im71ndVSa0UB/EZ/MjZixsnayKuYN+v83qF6wCzkdhZ7hmvGy9WuHI5yz
   ynLTEy+m0d9rVSHIedof0zW07Nq62R3cPCA89kb0xdBr7NZ8RZRrjXZfF
   M=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 115169608
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Y9rX3qB2V+c7whVW/+bjw5YqxClBgxIJ4kV8jS/XYbTApDh312MEx
 jRLWWGHPq6PYGbxfYgiPIq18xsP7cfXn9NqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4G1D5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/utmIlNJ2
 qYjOiEDdUC7rcixg6ifVbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDW7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWwHqlCdxKRNVU8NZW2mPP701CCCE4THjmo6KwrxW5A9d2f
 hl8Fi0G6PJaGFaQZtfwUxCioXWD+AURQdNeEus7wAuQxbHZ5QnfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqN+7HRoT6sNCw9KW4ZeTRCXQYD+8Pkoow4klTIVNkLOKWyiMboHS3xx
 T+ipjUxnLgVgogA0KDT1VLNji+op5PJZhUo/QiRVWWghitmYKa1aoru7kLUhd5YJZudZkmMu
 j4Dgcf2xPwHCJiWvDCOROgLE6Ck47CONzi0qVduBJAg8z2F8X+/cY1e7TdyKV0vOcEBERfxe
 E7JsgpV7ZVOFHGrcaN6bY+3B8kwi6PnELzNVO3SKNxHYZFzdQqO1CBoeUOUmWvqlSAEkqwhO
 JHdbcelC14bD7hqyHy9QOJ1+boqzSA3wSXUX4L2yzyu1LbYb3mQIZ8VPV2PZ6Yj5ayFqQnc8
 NFCH8KPx1NUV+iWSiDG+IhVLk0PJGJ9BZnyp8FNXueGLkxtH2RJNhPK6bYoeoggk6ELkO7Np
 yi5QhUBlwe5gmDbIwKXbHwlcKnoQZt0sXM8O2orIEqs3H8gJ42o6c/zaqcKQFXuz8Q7pdYcc
 hXPU5zZWpyjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:TVN+9aglwUCD5FMHyRCiOevlKnBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3Ak+PYpGqKdFZnFmLdGUJNPczmUcQoY17vy1iKGF2?=
 =?us-ascii?q?pB305cJe/ThyK3Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:rlh+1wuDUGIv+HjZ/82nuGtcaO5JsqSSJlkuzJddsuzfMnR1EmLI
X-IronPort-AV: E=Sophos;i="6.01,171,1684814400"; 
   d="scan'208";a="115169608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeV1nM/KPu+Q3xN3CtwHP6HgJJIY95OHpm/i90J30zBk1pYVUM4iO/nOdcEOEFnB+/7KYlniENs52lUwUzcgotcUNQAiQ525I1JskKS1HpCBllbpbdpScQkGxZ5mmNS0tTTlaHM4jWm6RCbncvH/3l6J57vuuip8SoBeNEQcyvCuzVjdzv8n9WK3Dj4MOW7FAdAZwuZieZzR7tuFOy9TJ+XMa1FBBVWAY+7UnJn0ddq7SG5EN8/e/GWbIfl3Jw9ynNXHFnCAwnOgnpYfUgqUNHJIfIuEWFLB/0N+CW0P5zU6aB4zz6c0mrzJUY8+mPoH+dCW2tfDBIbg3X+xD7V13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUzQGhQA160ilr/+zbIMHz+WFjdOYWOPGjhySzVRxBc=;
 b=M/Q1tj9Tp5X9d0s9CFufW4fwS65/nGxrmzR0ZWeQ6j4zR5BdcLWNMOGURvtpqc6+kXqf4s51rDGOxQ5BG+ivcx7X93zxSMECJTpdNl3kQiwVCCSMl7TsvPKSYarSrREWTJbM3wtsjFxlXXv60Yy5jdcU2mjDIqVih5BG4DMvEQoZN0EtcgUCfaEiW/hAzcGjZ6UuuzKYxmkYIbkbbbOchbaSP6h4dSDoV0X/vuqNGzarDTcE5hXQ03w6TFgz8PuJ0Nd6kr7SaTKMS22YX5JkiGJJDLy2Ei6h9GcgrxVG1RzkkQS2pftQMN0mIVVBWs4OXdM5QWPgb9oskpMKbpt7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUzQGhQA160ilr/+zbIMHz+WFjdOYWOPGjhySzVRxBc=;
 b=ra7o6YnPougkCVgt52MDM+vpckADQebngpuIALRlTjgD9vRwXNU28WPTtO+gv8u1LSSpiQ+2uSKi21bZU7BiWLUDgwZhZYbBPaB4OSbTRKESOIr/N2MJIaGPx1Vcz1ZsYzyVK3m6nLxG2tV6QZ1yAuAxkgQFmP0jh2dtlZ9Unt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <80c60246-bb4d-c8cc-1f96-282087b716b1@citrix.com>
Date: Fri, 30 Jun 2023 15:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 5/5] x86: make parameter names of function
 declarations consistent
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2306291236580.3936094@ubuntu-linux-20-04-desktop>
 <5ded390f-137a-0604-c78b-4521e1daccc6@bugseng.com>
In-Reply-To: <5ded390f-137a-0604-c78b-4521e1daccc6@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 762e45bd-f319-4423-8fb6-08db797545a6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+kueJvPXJBjm6EtHOHnT0z5t+uQQzEhMPGC1IyX167nX3OCgitYvZXulkLdwemNlQ8rovTYUUmHpFK0ZYpsFE4S/kz9WqIpxmu2de23xUbTzVC+KTozweXaN1kLlG0kX+7rb4vnLbWFESuMWrFx1U/0bgVQOOGvsWB2pRgiU7yQN+nZ916Ki+J3TGUk3+cvZpdpKgam53pD/VBkqUrSJW9ujb4aK3Uk4ImxHUWNtQ9S7xG7A2k8NrTR7HcSfimCgjGPq4B06E2ulCGMeEuO3u6M58PzLDVBmSD54eK3jpZPb3X7C7cBpeEs0iUpH/6Ry1pTP705BCdFNimIAanTJMVXl/H22F5GclICfpiHKwF3bF21lJPnWYFCT28NRT5dU2mjHuLjEamkJbCgqLgAV+oyjM/Vc3kOuicSgPAiQls42FxlZd+1t5BoEJlkNrl36Gf+D8suxna3+izF8nUif3kA1OTqZYnyCzB9NB/7hrzWblFK1u91zaSPeKrBum24dpJxuyBBmGm8k6SJIl/nsi3gyv8eDNkfjn7No3tvlLgThcMwPiDv4kDteiE0raLmyqRWNf6MFMij9EEEE6FiRUro9sdVKKrCcZn9UJjjGuRiWV+OpjOSOh7sz7ijSbYb6Q0tkN2cAGACeAdE1LmlKMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(7416002)(5660300002)(31686004)(66946007)(66556008)(4326008)(66476007)(478600001)(316002)(36756003)(8936002)(8676002)(2906002)(6512007)(6666004)(26005)(110136005)(54906003)(41300700001)(31696002)(6486002)(186003)(53546011)(6506007)(86362001)(82960400001)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VUTkZUS0R2VllLN0FYbVJxSHJHbjRST3lwL05OTmQvd1ArOWlWSUM3UHAv?=
 =?utf-8?B?dVdPTkpNWG1FRCtVbnZyazQ0Vi9QSGRIRjAzbW00ZHlsUkZLc0NuZVVwUVF1?=
 =?utf-8?B?ay92bnptUktPdjAwUlhBQnpoRVFqTjFQR3BDOStid25Qam5RMjlkNlZ5VS9n?=
 =?utf-8?B?OVQ5Ym43azFlR0lsRTgvM0hQQldlU05wbFVxbmQ2VWhBb3hLYXZSQSt2MERk?=
 =?utf-8?B?dDdvNDk4Q3pPYmphOXJleUlZb2Q3Y0UvUzR6WUw1Y0d2YXhmVzYyKzRsYkw3?=
 =?utf-8?B?Zm56ZmVCc0w5ZWxDbExZRjlwRzJzdmc3VVUxTngxRndzTHBQRFNuWWs3THNa?=
 =?utf-8?B?WDlieEs1c25ydDBNM01YYnFwM2doYXZLYU1LT0liMlM4Yk9OZWcvL1hBOHRC?=
 =?utf-8?B?U3ZSQmJNUEVIc1ROYmE1NisxeWhOYnhybEZab1FqaktIMUdpbitNSFJTbkZZ?=
 =?utf-8?B?cTNxSGw4SHFHZHkybmZtd1lVS0x0cTEzaWlYSUZ0QUhjRHdHcERIektvcWx5?=
 =?utf-8?B?dm9VSTRiQU10cUxYMDY3VXNkVERSaWxSem54MEhwN0drL0oyR3dETGYxNy8y?=
 =?utf-8?B?dE1GbEZWRGJoL2xCaHp6VGZSZkNaY2pTWTRUc0hlSTVYRWlCbGFHVzVzTXJy?=
 =?utf-8?B?WmpRaXlZTTBvTTFFOTBqOGxtWmhyRTNrNURLZXhSUzVnMjZNcXc3OVlZZy9q?=
 =?utf-8?B?V1VXMnlybmtGM0dybjVRSWR4ZDMvTDJiODZWUzQ0S0EyZkMzMmxhRm1DLzBx?=
 =?utf-8?B?RHcrdHlJclVWLzI1M2tUS3YxWnVqQmUzNWRZNW1iRll3Tmh4YzhtWERXU0xV?=
 =?utf-8?B?bWM3RVNVMzg4S1ZXWVRuUDRaTzVDTmo5N2piOUhINEdrWlBPVStqYWh3Sjg3?=
 =?utf-8?B?dnRUUEkzbHI1a3NTS1Q0cXJ3K09Tc08za09oV0ZBanhqNFB2OHZoanZZTldG?=
 =?utf-8?B?ekRHS3V3eFhKUVY0ZTB1bVltTHFVUngxdFZyWGlVL0FsWDhwY1VLRVB3czFQ?=
 =?utf-8?B?bVVYbmlNQks4MUxRSTVZMGFsK3Y5STRmczZMYmxIcFB6ZG83dnJVNkR0Vlow?=
 =?utf-8?B?RkFXQXRFaG84OGpuaG8yZXBoUFRNK1FDN1BpTW90TnNMekszTnFQLzdHaTVW?=
 =?utf-8?B?VmtEd0ZGZXBuOW9DYVhxa2ZDQ09wSTBOcFREWUVlZWFIcktpQzRTd0w3TG9E?=
 =?utf-8?B?cHJJRmNNelV0S2U5djFQcHZja011RzcyWXZFOGRFR0NTNloxZ3FrMnJJaXFx?=
 =?utf-8?B?NjA2UlFrVUI4QXhVVGY3WlV4UDM5UktycFVWNjAvTWZISHlLaGhXM0g5SGd2?=
 =?utf-8?B?N3hWaE9TYUpLYmlDWG1qd3A0aFJNRERHY1ErU29Cb0d6cnpyTGl5Z1JQaCtn?=
 =?utf-8?B?ZEVJQVkxQ3VFT200OUp3K29NWUovNTlTRWVEN0ttOTRjR094TitoUGRGWlZO?=
 =?utf-8?B?UDh0bVFMaHAvaCtaU05UTndUS08rMk5la1dHbnZXeWlOY0VreFNIR0tvaFdX?=
 =?utf-8?B?d3BlT1o3ek9WRGVob3pReUREQm43WkRXdXFQZDdGM1BVZ2g1aHFMSmZWeU54?=
 =?utf-8?B?M1U0Q0xYZUVZNzlyV21iVldsRXpmL0F3RVJza1l1SnpZdlZ3d3ZtL0R1SWlh?=
 =?utf-8?B?WVZKVUs3WGFVVk1LNjFqeTNudkVOY25QNDRjRURXRE42MHdENnlGVUpqTVEv?=
 =?utf-8?B?WHNMODVhd0FsUk13RGpqU05aYjB6a3FKQ2MxYnVRdFdlc1NiRmRwYXB2R09P?=
 =?utf-8?B?bVphQXhwV1ptR2paQUNzRkV4ajVad1MyRUpRUWVVcmFFMkxrV2krMzdmVUxp?=
 =?utf-8?B?U3RFbXBFbnpuc04wV3FLY1ZZdFdTOVhmYkM3aWJJZ1l3a1J2N2tuVzljcy90?=
 =?utf-8?B?ai9QdUw1T0lrWWdidjdNTHdhVDlqZkwrS1NvT1prdG9UNTg1RHdhTUY5N0xC?=
 =?utf-8?B?R2lBTWNveHkrd1ZPZWlVeGF6bHJ0RE9sQk9Nb202NnBNVGZIbFhqd0d4VjFO?=
 =?utf-8?B?OFdaR3JsSnJMWmxYMEgrNmRPSks2MzJzcWR4OHhNZUJueThWMnYrcUZReWtn?=
 =?utf-8?B?cDhzbVlGTGV4TFN2RHIwaXRwS2QwRnpnNGNrVE44WVUwRVBhNnlKeFdiK3BJ?=
 =?utf-8?B?M0xnK2N6bWk2L0ozbHNmV3lkWHJKNTFVQ3NmaEwyVkdJbTdkUVo4bldIMU5m?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?cHZZeGE3c04wMmJ0SDJvN1RLak9nMDdNaFZBV2FaV0VFam44VHFwS2ZNQjV0?=
 =?utf-8?B?WEY0WTNHMjRKZi9OSE9ybklsOWhrNTlFbGNta2NMQ0Y2SzNGNVpYZStZb2JT?=
 =?utf-8?B?bzRwR3JUTXphRnBPSHdUY0hrQWhlYjl0Skt1REtlMDBUNVBRVVZKOWs0MkU5?=
 =?utf-8?B?QW42UWFjbWxPRVAzZWJVZ2xHQndIRk5NT3NqUEhFYkYvaUo1eGVzK1VuNWJs?=
 =?utf-8?B?cXNNWDZ5a2xPRmI0UmlNU1FUbDFMUURaT3F5STU0aDYyeGk4WEhlejBaQldv?=
 =?utf-8?B?RkpCT29haGNQM2ZDZ09UQ0RZVlRma05zZ3N4QUVGazVTT2RuWE5YU0x1dTNr?=
 =?utf-8?B?cWYyZG4yZnJtWlgybTlSMWd1NUFVQUxtTWNEUXJmWTJLSnBSejIrTkpIcU81?=
 =?utf-8?B?Z1dsakNQbjdWZzdJSEVhZ2szTStBUVIyaW54ODRSaWxUQ0VaWlBIQ0NpRlBn?=
 =?utf-8?B?VWJJNFpvR1pyK2thNWNPVzFsSk56TmY2VHorUEdMWFlENFY3eGhYQnQ4aDJL?=
 =?utf-8?B?Mm95Q1QzQnNIMnV2VlZOUmJ5OHB3c0tpM1MzcVRiTVhFYjZOejdtcmtkSS91?=
 =?utf-8?B?aWZyVXVPQzhobkZnMCtOUHhKL3ZvMG4wVFBNa0pxeUdITjVnc0tDYjhkNEN6?=
 =?utf-8?B?Wm01ZWV2OTA1eHUzRHdtaHRObmFHbHkvemF4cjFYK0swMEJCdjAzcTJ1aXZi?=
 =?utf-8?B?UG1IZWNVdnBoK2gzUnI4UTZGNnJIQVVPd2ZtcU9wajFUTmN4d09aT2dsSjE4?=
 =?utf-8?B?VE1zemNOaWlOQmc1cnhZY1FDSi80TEh1aDNxZlZxQ2ZrV0NEZHRkZ0xjeW9w?=
 =?utf-8?B?WDBISGRUUm40NzA4UGpIeVFBWk9Ja3F2ZEx0dDExWWRGQnV0cjZ3RXYwWEpS?=
 =?utf-8?B?dHQ0S0xFYXkwb3ZldnNiRUh4VnF1NktuSFQzWXFqME1LV1FyYk00OFVrUk4x?=
 =?utf-8?B?a3lFRmU3ZmhtNG5xWnNobHpjQ0R5ZU9ZR1R2aUxaRHJnUi9nYWgzajRDM2dX?=
 =?utf-8?B?eTc5UEhyQ2dQWWxpNExrWEx0ZTlQNHlqOXVqdzZUZVN6Q2ZBd2NOK2IxWkVq?=
 =?utf-8?B?RXdQdDNsenQ5L2lhMHcwU3Z1TWFnTGNGYVpHWkNSNXlUSHg5MFNYYlRQTEhl?=
 =?utf-8?B?UG96SW5xWVdhRnFOM01pS2FSc29rNFpSMHB1TERNU2s4ckVieUpLckhSbDdX?=
 =?utf-8?B?UXRpN1JoMHgrVk81ZGR0clVJZGFKUGVRaERVVGgvMnFFRGQ1eHA1MldyUTlO?=
 =?utf-8?B?aU96QjE2MjNqWjNNaEZvajFTV1RQamtSNFBaZzdVTnpZV1VRck8rNTFvUGh0?=
 =?utf-8?Q?tr16FtKWsuZpB9c/W+ygSSPxy2a1PKuBg1?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762e45bd-f319-4423-8fb6-08db797545a6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 14:21:19.2976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjSAYVoeNAIBRGlPtC+SJWpC8vezIZTLhu/FWUCMwWWKYB/lUiuqMBwXHG7L5VHZyTKNhenQMr7N6T2lc5MMfFB/NABxphdWg7InomyI+sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7170

On 30/06/2023 8:36 am, Federico Serafini wrote:
> Hello Stefano,
>
> On 29/06/23 21:47, Stefano Stabellini wrote:
>> On Thu, 29 Jun 2023, Federico Serafini wrote:
>>> Change the parameter names of function declarations to be consistent
>>> with the names used in the corresponding function definitions
>>> so as to fix violations of MISRA C:2012 Rule 8.3.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>>   diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> index d07fcb2bc9..24bf409d8f 100644
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> @@ -656,10 +656,10 @@ bool vmx_msr_is_intercepted(struct
>>> vmx_msr_bitmap *msr_bitmap,
>>>                               unsigned int msr, bool is_write)
>>> __nonnull(1);
>>>   void virtual_vmcs_enter(const struct vcpu *);
>>>   void virtual_vmcs_exit(const struct vcpu *);
>>> -u64 virtual_vmcs_vmread(const struct vcpu *, u32 encoding);
>>> +u64 virtual_vmcs_vmread(const struct vcpu *, u32 vmcs_encoding);
>>
>> Shouldn't the first parameter be "v" to match the definition?
>>
>> Or is that a different MISRA C rule?
>
> This is a violation of MISRA C:2012 Rule 8.2:
> "function types shall be in prototype form with named parameters".
> However, I can propose a new patch version to fix it as well.

As a general note - if you need to make multiple changes like this, it's
far better to do them as a single patch.

The end result tends to be easier to review, and it reduces the textural
dependencies between the various patches floating about on list.

~Andrew

