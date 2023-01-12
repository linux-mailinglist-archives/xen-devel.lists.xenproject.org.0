Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A0F66725E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:39:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476113.738112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwr4-0007vL-EO; Thu, 12 Jan 2023 12:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476113.738112; Thu, 12 Jan 2023 12:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwr4-0007tF-BV; Thu, 12 Jan 2023 12:38:50 +0000
Received: by outflank-mailman (input) for mailman id 476113;
 Thu, 12 Jan 2023 12:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFwr2-0007t9-Ut
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:38:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e22cb03-9276-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 13:38:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 12:38:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:38:44 +0000
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
X-Inumbo-ID: 0e22cb03-9276-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwYYy558c98kKk98O+VctJnG1a/FElC7VxN26+COLLHPvK+rj6dBwOPWoz+hVhkpHYRksOKSVt6gacEBICkqrrkwd/c/JK85wCuBkiR6j+PPcFGMfSgwyaOgBtu1YUZms5rjH/sKxt1Wd8y03EWpzAXVgMvmorfLwJ7ctuTHxWWIoRD6hFr/+ji3b+c85OdWGXNtp/NW65B2+VDJxIb1sob/qRa3+H0/7qrsOPp0iGu3QYKLp0ChGCHejgUTNGx3NJ0vqce0qpgOE7t7sWaigmdOnpsBSz6yaAiUOztG1jriivWAgDPRKWYzv5YK4MuinH/sDiUZdqcFh4KmmLJJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGTUujg26/aFOTeDzWoP7dUsYAG6NhFV+q1kSVgBxUY=;
 b=R6Qfg45Ro9N0ZDO6mZsymbSRSFhj9EJzecGoO/rmKQj3N46WG7zS8rDmX5HGQahgu/OZbLjZ7Lcc1ihfUClNGQ0ncsVTZefjDJi9f7XyYUoaOGwae6CQv7OYSavWHUmE/3PhUEvcHJW/JF36FgpACUxVUO5JIOkkCNOESbMav8eykQP0i4+8uCjD3dGiqN0ltoPvpq/+TnHshqDjL99ta48t1f4X+wyzeVJfa6zDUanLPS6rSgmZQBLb6m/7k+NYxNMWH0iXix9hePmyrJjc7oUMkagU11+MkoBv4XcKz+b+5fTzhhBEC+RCwdZKTu1X/3g+aLR9hMZDIO2AHgjhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGTUujg26/aFOTeDzWoP7dUsYAG6NhFV+q1kSVgBxUY=;
 b=269nBU0bpNIUlbXMysfetnF9UIAotVC6dWipK6HZxVfanykl5y7iRRSEoDxcZ/Zspz8E2BK3dTdaQKSGq+MRYTg+362C3wVBcSSogRfkMKXzOpqQCtfjLR+YgTupWHOR1/jjdjyBvudL0f9tZj+J+xUw3waDnfo4MhOH87H13T2xnTydUo5oC8n2V45TUutkzN1c5aqor1SGtym0YoHq7i8wDcRD4v6iPCy1ld+YtRprJCR5mj1LAU0LzLwVyh0cyTVdjRgxaCK2eaP1H8xfgeG2RkHNhJT/SIZd19UudbiZOZYoR8ryNRQ8GMN3N2lzgEG3XfOcvTe1CPLy3/Cy7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4770d744-ed33-4246-4ba3-8e1fe8877587@suse.com>
Date: Thu, 12 Jan 2023 13:38:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 8/8] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-9-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-9-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ddaf7c-6ad3-4504-9b15-08daf499f147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IDXfMyxWrBoxZY2dJt0zxnbBVwmqgKxvmb1xzNVT/KTbwQGzrg0slxnzd0C7j2O4T9FkAgeeZ6HFdLGh8k7DJCF5+UHQqbHe4C7D4SlG8ClkAC5XnCQtHfb/iXF3u5JogtAr/tuCPpRTn3jl4JsUaplmRHObaQkfK8TqLc1dwHHHl+JbdG5DSHwdxInoNqBHLztkVF4T+ViSG7YJvDBFNZP3dhQMo/IRGFqfuhyc6LdxcJ4AScAnrrQV44wHBi36V/9jXvCB+PzCVX7kxEHzGtN/VWGQKAib4ReTFLJLfDfDLT0BycIBjIcUos8awLCac+HXQfkEyYHMLBJ52x4ai5qseIBgYsj6eI8pGiP6I6bbywLQeUcJc3jBNUcN5W+JKRtdTiKeB+EGW7wiR9MdYIBuHa9PPVYYPzvwgj4wle2hPhdeUAmZGsgpgB+4wiRN1Pdjfr4i+kT4bwSXSq/ppEfLZUQ9dqQBvlhNotr/M1/ed6YQqUTnyTz4ODaJsc226xyBX1/5EIIuUhgeBHl070rUDXbdiI/OtKA48m0lXXQTnY4Dx7K21aoXPbdD22OD32bzRliLV2xGZtiABWLtX6r64LWB5qrVpfIhTFrMYcsrZxZ2XUyTX+pBxW65cbDKyRDSCEGl/F3eSaN6EVJXM+YH8Ta63fh8gVT9tD5dhtrD7mb+AryKoefIqgO4dyXUGLYI1rP+cV08zg2h7v3ZdltXPehcR0k3DqN44I+GNXM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(8676002)(66946007)(31686004)(41300700001)(2906002)(8936002)(36756003)(5660300002)(4744005)(6916009)(66476007)(316002)(66556008)(6512007)(54906003)(478600001)(6486002)(53546011)(6506007)(186003)(26005)(4326008)(2616005)(31696002)(83380400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXBsSHhnU24rT0FncktKWVN0MzRSMDg4d1YwK1Z3Z0kyZjhrdExFYy9RZ3Zw?=
 =?utf-8?B?c3lKeDM1eE9EZjBIT3B6R2NyMklTczFLeU11eUtzSWJrRFd1bytKZHE3ZHEw?=
 =?utf-8?B?OVMvbUlRVHVGTmxwckE4Y0NadkVpMlQvK1NJRFdZcUwwdGtjQnFzZENSYkxm?=
 =?utf-8?B?U2JncDhXTWFjVlZ4K0RRT0dUOENMTHhqbWlqTkYxWjNMc1dWUkZCMTdjZlgz?=
 =?utf-8?B?UGlmdWUzWmxJS3QrMDNmWkNPVVA3Vk1lTE1IbmtpampLVU9YZW1PbG11My9x?=
 =?utf-8?B?bkE3dUN3N0syZEJXbUYwRzgzWlR2emdybEptSWErOGllS2hKR0pwNzhqQk45?=
 =?utf-8?B?dWU5VkZMK0NVQWhybEx0WlQxZjRnNVNHWkxjTldnMmY4bTdybFN4ZFU0SzE3?=
 =?utf-8?B?enRCcG9acHMyWW9oeFlEcGJyOVBuM0hsdXl5RURWeG9jUXNzN3dDT09iWmVm?=
 =?utf-8?B?dWxxanlLeFJGMHA2Si8wZjM1VnN5RXZJMVAvN1R0UlJOZHF5MXN5S214QTNS?=
 =?utf-8?B?NEJDVndUZy93Snd6djRteXA5TC8yRWtERU5kWXkvcE13V2dNU3I3ci9hRTJN?=
 =?utf-8?B?T3NlRjdSWmV4eVZFc2ZDYVl1TXFBbllmUU8rYjB4eFVXS3U2Q3luU3lzdjNt?=
 =?utf-8?B?WHJMc0xRRzNaTGF3eEtsM0JqQmlxTldudHZJRGZmYW5ncVdNbmtTM1BKam8x?=
 =?utf-8?B?STlONWU4TGFaMDUyZ0k1N3IzbGVjMkMrdTN3SCtDSWY3aUdhUDN2S0gwampP?=
 =?utf-8?B?NWE0ZldaVUdyTGVIS1o1eGJVanprM2hzcENBNE1aeW1SNTNpQVVxeHYyam9w?=
 =?utf-8?B?Yy9tMnFZd0NYL1pXT0p1VWErcGxRZU5ra0ZyeGZRdUxpTk4zV1lpWnZjZEgr?=
 =?utf-8?B?ZmlzcloyS29mcStCanBZelVzVVpDYzMzb2tjTVdBRjFWMmxiZHFLR1MrUUFr?=
 =?utf-8?B?em5Bb1pjNzZFblFDcXJqNUFvODdSanhFdklWTnNZdjBwSnhMSHBqczVlTm9t?=
 =?utf-8?B?a1BMdzFTZXc0MzJ0eXlld2hSOVFxN2dkRWMySVFKcVNOQVFUWk4rYWRiZ3Bu?=
 =?utf-8?B?S3hjZG5uUTZkUzE1eW9lSXp3MVVXcmh2M2w4MjJxYlBoTVNmMG4wNWEwdjMy?=
 =?utf-8?B?VzVzaEpqUnhVeTRsU3cwK1dwQ05WdVNLK1VhQVp2TXJwVjk0eCsxVVorbzFK?=
 =?utf-8?B?c3daK1NWa2I5dTFkRlR6UkxUNFgwcnkwbmh6QTRxYko4T1ZlUmZpTmVjUFNs?=
 =?utf-8?B?YVJoNENRY3c0czIxOU9DeE0wWHFOV0w3U0xJY05xNk5tMC9yRmV3ZXJtUFdo?=
 =?utf-8?B?eXNBK2dHajkxa1VBMWRiMmQyUmx6cExYNTRaS1pWeEk2UkFEN2hmUDRrUWRE?=
 =?utf-8?B?bUs0ZWhYMHB3WmtIRi9XTFV5TmhTdm9FSWRUQlJlWStrV2ZsZldKSU1yNDB2?=
 =?utf-8?B?R2drTkVNdzlucWlYOGhlbHUzb08yZ1UwekpwcHY1bTJvTUtibDVGTWFBbUFt?=
 =?utf-8?B?TG5sWXlNdDF4RzRWWForb3p2MlovSWNhRlRzdjBUZVVYSnBPQlNRNnZtQ2hl?=
 =?utf-8?B?YVBWZmJSRTNWZWhNWVdCUTQ4YWE3WlFNTEN0bndIMU9YZWk2bFBjZGdEL01Y?=
 =?utf-8?B?SUZtM2hrdWo0Z3JNc0hoZWRjV2xRcE5PMjNKc2FPQlNIbEgzenkwRTRXSk1I?=
 =?utf-8?B?QVFmejgrUCtncGxsRzVSZW1mK2lOd2x0QkNTWE9KU3pnb2N5NnYyelMvd09i?=
 =?utf-8?B?aGRCWk02M3g1c2xHTTFLTThxbnpVeUcrbG9RcmVkZHF2UFFCYTNQWld3aDNJ?=
 =?utf-8?B?K3ZlY2VzWGdTcldTZE01OFAvZjRXWUNmSHVydTZDVStxanYxSWtQRXBCN3Fs?=
 =?utf-8?B?RzRCaEF4ZkN3ZmJWV3BqdUpFU0FyZXNlWGM0eWMrbVh4cnZlRkw3dml1Tm9N?=
 =?utf-8?B?V21UL3NmZTVzbTdMTEdIbEZxZ3NLNHdEMEl4dE96SHYyUk1nSXpWT2RmUEtC?=
 =?utf-8?B?d0NuckRuY05CbDBKcUtTem10UExJWDR0RGg3REZBbDg4YU5vckJSTDFDSHor?=
 =?utf-8?B?NFdLbkZHYTdZOFJZUzJNNkFzQkxIeXA1VHZramZTRmxLS1pnQ01zbHpGbmZU?=
 =?utf-8?Q?n+md5GBcgZwydMUFjj/wNhJ8r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ddaf7c-6ad3-4504-9b15-08daf499f147
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:38:44.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ks0kE073OVeUq8ffrRGwU97MACRqCSg5surG7N+37tgqSWQe2YeBIE6rz3H4ZpdE1KShfmUJiJK7hsC1WZr1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686

On 04.01.2023 09:45, Xenia Ragiadakou wrote:
> Provide the user with configuration control over the IOMMU support by making
> AMD_IOMMU and INTEL_IOMMU options user selectable and able to be turned off.
> 
> However, there are cases where the IOMMU support is required, for instance for
> a system with more than 254 CPUs. In order to prevent users from unknowingly
> disabling it and ending up with a broken hypervisor, make the support user
> selectable only if EXPERT is enabled.
> 
> To preserve the current default configuration of an x86 system, both options
> depend on X86 and default to Y.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



