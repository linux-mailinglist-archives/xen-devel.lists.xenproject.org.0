Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF906A6E0B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 15:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504056.776557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNAw-0001Xn-LX; Wed, 01 Mar 2023 14:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504056.776557; Wed, 01 Mar 2023 14:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNAw-0001UZ-H7; Wed, 01 Mar 2023 14:11:22 +0000
Received: by outflank-mailman (input) for mailman id 504056;
 Wed, 01 Mar 2023 14:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXNAv-0001UR-D5
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 14:11:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f01e0f5d-b83a-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 15:11:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8382.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 14:11:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 14:11:16 +0000
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
X-Inumbo-ID: f01e0f5d-b83a-11ed-96a6-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdGXP32/XyBH3/kaqOyPDjM+18w2xqKZX95Bl6e4zjBVqLqa2FnrHH+JUNGkopFceszxl3kqWQj+PLlYw1uZHYj1fxEiLdKDPvlNsAAywylp06x5UN8BAw9kQ6JyL65XZPFsMQIykErG/H0U8q489ME7dfgRgbRdiewCqlEnP4KbZDSsp4BganywSvkIw2rQ0it20uQC91VoYg1SZTk6IgPQP4i3RBJqq15OONinXX0uCtH0vsIfJGJjk1LRPGfG+dU0E6T0GCQJg4zltlkRMdypT5qsQkhyR7MXvJTJ2vzHwfewLeq+LRtEJdHnggF9pNIPxfWicHsKcjwofrmovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sZe/dp35tPrj7YyVHUaDUnwdBYpDAz1zRyQls4rHzA=;
 b=T8nQ51+xwYjlncNBddgSWRB55hX7KH/wzko+oaPIBC2sQX/Jf7kOrwybbR4QLPyV6N12jek/JOZo1Lbq3c0ZKfEgdrC4Npneu2TFmudxHafX3218pM/4AUaJJJYLa3HOXa4lsX/7NaB7k2yzB9mf/Y5KObUXdYV+fDP9vvYUmDATwD1w/587ZRsJDuSSV9SVak6QKB2UjmEiJz3vu6AwGsg4jB0XIE1unYnhZGa6jMnBfzv3TKs1j+hDWKic3lkdPygDzBQxrqX3qf9poj5ENTlJFeM4xM17s+I+gLy+AOQKn75gAVYFSyP+FhsDUOr1xgW4KegT+c3UL2+PPbAJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sZe/dp35tPrj7YyVHUaDUnwdBYpDAz1zRyQls4rHzA=;
 b=mOXtmS8BGwDdWb+/8CWt4k4pninKamWggJaQ1g6tpH8u+W4fVyx5a5jBU33V9q7d0CCyrZmYkklkZTxFS5iTnolTArHhqoRxN+Bl3iQELZAAPfIytitSN/xjzL/KnsYnzha9Xo5Cb8hgikeMLBNTa/kYY7z+tye5U6fUyOMGOR17XNSqFnMyRh+9dyb0EyppT5XlyIT4w1UgB9MQ2vYh5Wt45JcLRCNFjnApFRdJB8jGDbAIK+5mlZFKQdDCyAhOSrVMAhzJxlW8zYHwMJZROUvHQ9R9WzS+m94L5yP9oG6lYVsl5J9/PPzXuPF9/f/Zx52UsP1q3uw/t+/echW3ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
Date: Wed, 1 Mar 2023 15:11:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86/pv-shim: configuring / building re-arrangements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: ca516e73-1dc2-4345-e6f4-08db1a5ed243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bc8704y6zVQg3maRpwfQqkuzInMEo2NEl5DU1W5l7yxlSBdHhf/OIvgJVeVJRdOB2wt7BGCb38jSAUMZoiXa2D2EqKkU66gBFVo+HFVuWDKaNutINqAjEB94EfJrAhjioXty0MyN4xOt8D6aNI4dsPF9J0+zrAEhnaB8FgDwlsln3yDw9T/IafBVwyFMMaYZSL/tXYdqu4okqLTlZAKP0LW6Nw+TGlDeTQV7jO2XBREJjm8c9li6bNdbQzujftpOO/ObjamXyt8YGSimycLN0jSNN10mU/m8Wx5T0LJDZ4mvxSrbr1fj4r0GLX5IQpEyEI1jvkakGVeOtges9Wnv9218ICk75E42nIFd3V25hdNHG5gZf2ryXNjdD0fWmBBbKhXCu3rmi4tUvEOnE7hblqMj7rrsYu9RHNUNRXJE3DKqi0s0+X9/A3BkfMDh0vTO8hynajjQOO7bIQpWjbox7VkN1oNWrBUIWmg4RCjUJZtUm3e/lFpRDAsGCFjw0QpFYZ+lA6ioQPCsyE2eY/lBch+dUuYzHP5dXWQrf8h0bjsIP+1ZQ/gyt0wPHjswHScpW+eVKCFOuIyuWb4iIAemIfvA4vNdIwdIck0dmxFRei5oOtxeQT3YDrArXhfYr0PuDR+UP503BOjJ7HPcIt5ROIF9DBIG0YNAtCXNAO8EgSoM2yDC/Un2gcZe7/bhMZe3GF148tA1xSa3BlqXBiE7xExe3odcy1wisWCvt0l8RNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199018)(66476007)(36756003)(54906003)(316002)(478600001)(83380400001)(6486002)(2616005)(6506007)(6512007)(186003)(26005)(8936002)(41300700001)(86362001)(2906002)(5660300002)(31696002)(66946007)(4744005)(66556008)(38100700002)(6916009)(4326008)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3JnTzJFQjlOR1l2S0RxdWJBZmpOVTcrU2ttS2pKN01VRkJHQ01uMzVqckI1?=
 =?utf-8?B?eGNVUzdCTW5oM3dQRTVjQlJCeTM1NFdKcjdOSWU0RTZhTGU5VVBaR3NFSEpT?=
 =?utf-8?B?KzdlTno3UVVnSHFJeXY0MHkyZjNuWjVBditrTlgzSlMzWTFMZHo2ZWhiaGxW?=
 =?utf-8?B?bEtsSWEzRE9Vb1J4bWFpQlc1V2JVZEovTWdaTWs5dU1LM215SXZNVDQ4MFJy?=
 =?utf-8?B?VnpOK3dkQ0I1NTlXeW1WdDdJb2x6NlBpQ0NubUFZSmFGVUMySnVFZ1VjR2tU?=
 =?utf-8?B?c0VHalAvUTR1aVRHSmFyRU12YUZBMk9DdDFkTUZoZ1VQLy9NUWVqMysrL2l2?=
 =?utf-8?B?cTZhdHBmcExhUnNhaFZsWDArMFFSN3U0Yk1NR0RBNUt3elVhdHlHb3NybkdU?=
 =?utf-8?B?aFJSSm1FaHprdy9TZEN1NkZVdlc2bG13RjAvbFVTZXBwbWRsdlZZNERiQm1s?=
 =?utf-8?B?TDBhVC9mUFdWNWcva21CUUdRMXZhVDFsWGxjZS9xV0hweUhLTHFYNGgySDVy?=
 =?utf-8?B?WDI1WUpQbXpwbTA2ZlRja2Q4Z0gyK2ZoWmF2THBvTVU1SVJnVFcyVXZ2dFUw?=
 =?utf-8?B?angyNktGWmpJbDhrUHJPTDlROHg4ZWhzaEpYYXZtNkRWRUpsWDVVaDFjeWhB?=
 =?utf-8?B?UlZ5UHd0cXdyQUVPODhhSmlSMWtqb1BHRnB1WDltYjc3MzR2NHRGSlI5MkFJ?=
 =?utf-8?B?bDV0dmJmVG9LdHNUcENZdTBkN3pCbEMvZWdpWUxIOHorVFZKcnhvU1JNUXV5?=
 =?utf-8?B?NHlURCs5V3FJaWRhRWNxMWc1UVNpbjNLTE5JTHdsZmxFcWE3SDVGTjA3SU5i?=
 =?utf-8?B?cnFUdFdzTGRabE01TzZQSEVXaTYzN1lENjVjYmJqL1l3aFJXYW9ZOXA5TzRa?=
 =?utf-8?B?VFBscU9mVGEwYisvK2g0alNBcmtuekJoSE00NWNHTFcwM3d0UG1JaVVRNWhX?=
 =?utf-8?B?VDc2dDY0alQ3dDltZmxGdHFQM0I2alE3ZENDYnB5QVhVUUtCcGF2NXVzRlFV?=
 =?utf-8?B?Nk9OOUJxT1VGZVA4ejYzMHpteTQ0YkJHWkdOVG9TZDNmRDh1cjQ1OURwajFI?=
 =?utf-8?B?RmtMZlVPcDBwUHhkZUZvUmtKYUV1UDBDN2lOTWlwNDduVXhNRTNCSml4dWJC?=
 =?utf-8?B?S2dvVjRNYjJhaDY3TWZLQUg5dldodmtUd1lrZDdyS1diakNJOTNqUGZBMWd4?=
 =?utf-8?B?M0xJdm5LTFRVT202RWxTeGcvSVI2U0pkb1JwcXBvcXpnTllhRGZOQStQMWZy?=
 =?utf-8?B?MFVobUV6KzJuRVNpcFJYT2NEblpGVkxubzZzcS9DRVBjaFFCVC8yc2VJSGZB?=
 =?utf-8?B?bHB2T0VYWnA3ZS9Nd2pqelVmdWRjdTNzSi8yd3gyUHVZQlM0STgvR0dXSmJU?=
 =?utf-8?B?a1lnRUFYNmtmU0ZOakRXZFhmSmYwcmw0QitIbHRVSVBoRExDVGEvUFhYKzdk?=
 =?utf-8?B?L2RDREVBL29icStuSU5lNlNTUVo4MmIxVzY5SmRydnlPSlZsMVRmNGVvZnl2?=
 =?utf-8?B?cDhZYVlxL3JuQUw3RG4yK3dOQXkvWGVMeHZUaUNtQWxuZUYyMWZHWTJiVC9F?=
 =?utf-8?B?T1doT09SbnR4aDdROWhWTDROUFQzWEFXdzNGK3NxaVhlUE4xbHJveDdESDBN?=
 =?utf-8?B?V0VrUjdqbVl5WXVpcy9RMCsybEEyVlBxaVY3cFRPTkx5ckZ2Z3hxM3kwaWdF?=
 =?utf-8?B?dFRrT281dFlZd0s2eXVURHNpZXhiWE82TC85U3J5WjdiaVRHdFhlT1hQK25a?=
 =?utf-8?B?NmpKNmNsYWJDcG4wZkErMEdZSm40Y3ZkODdFSTVYdjVTMDAvd2RGQnpxTm9J?=
 =?utf-8?B?UFk3TXR4SGxwRlo5TkM0bC9CUEhUbkM5TEwyQ2xCYStITmxJbzlpWGRsLzIx?=
 =?utf-8?B?NlVVRWpiMHFKNE1KU3Rlb1Z2L2VrbXVDbG9UQTJLWGZwbGppdmpxb2NWVDRH?=
 =?utf-8?B?bGl6UllNSG9WcU1TRUpvVEQvTHJ4cHUwbk1ScHZQOWFwVEIrN1h5MGZBQXVs?=
 =?utf-8?B?KzFPZTd5UEszVEgrSEFTN25QQisrSXNaeXBwUTJqamllOEp5MjU4dVZ0c3Yz?=
 =?utf-8?B?dXQyZlNCRmg1ZnpzTk94aWlmTTJaN0Jnam5FUWdsWXFJMnlHOTZvK3pwZ1hi?=
 =?utf-8?Q?R4L9uKnS3/fDMSnydUZQZ8Dia?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca516e73-1dc2-4345-e6f4-08db1a5ed243
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 14:11:16.5438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MjPpZAwzw9MXtpf+O2DgshBarNh36wa56boOO8RSLtMkraE6uSJHY44yg5JpH/gBmAAbbnLc61TOEEBMFdTTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8382

The 2nd patch, while originally having been the main piece here, and while
fixing a bug kind of as a side effect, is partly RFC; see there. The last
two changes are really minor adjustments for aspects noticed while putting
together the main change.

1: provide an inverted Kconfig control for shim-exclusive mode
2: common: reduce PV shim footprint
2: don't even allow enabling GRANT_TABLE
3: suppress core-parking logic

The main change in v2 is the addition of patch 1, as requested by Andrew.

Jan

