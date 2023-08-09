Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE998775F8A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581052.909570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiZh-0003bJ-Bp; Wed, 09 Aug 2023 12:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581052.909570; Wed, 09 Aug 2023 12:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiZh-0003ZJ-8y; Wed, 09 Aug 2023 12:46:05 +0000
Received: by outflank-mailman (input) for mailman id 581052;
 Wed, 09 Aug 2023 12:46:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTiZg-0003ZD-6J
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:46:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2675725-36b2-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 14:46:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 12:46:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 12:46:00 +0000
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
X-Inumbo-ID: b2675725-36b2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fN9dfwLYVwcRZqwLANN+unwN4Yy2Rz35v5BaT10kHkQRD6Np7LAMvVw3WkeUK2RMQ8xlQdcrDv0mZGMIs7khRaVdTcvCu7LrC5+F0ec64CYA52AmriGCg7QCp9og9fs0R5kI6udXyctZelafz+81yuR/FEJdeeOWe8/CJkPVbogfBkkt6vZUkM28ZCvvpRNzKhG2hCW1EARd8P/b1ouI3Cf6G/ALo3ym3wvVQVe9bS/7T4tdno61TsM+UNchQgY0Jp/8Rwzvn6mHvZVupKRFPkHpObbFgc7idvhMjqDcsseCMzUQSbw65XPlJ8KksB4t80I2wkJM6OcyAVNWM1TIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6DHxT3FK1KX+fYL3PgU3l+FRGXVf2Q2tDn7awPp8m8=;
 b=mR08kxzCptggWHh/50b4DaHmn2rie0uKbEMDyCOoroJ0UrVKrt6H4XoH9WmdEDMbl4a+C/6NLTwFxvMVSD/Cu1fajzgHdUoDdH1gKYz048ZkXm7GHiJENR4SHl4kF4Cl48G8jSwvUK/v7iRAnkNgXpUXJ1Ud/RJxv00N3drGFJ9JdPm0yFMI9dodnmzcP4NiVRB40aMYbJx0/PI7Z3kZE1BL5L9kog0h2axgdU8nQ+dPdCxfa/XhYRTKaN4nxuuCKuWN/vx9xqiAf2JBdgqN22UdQgnvh/Frye5Qi8G73P7oDN5xW7kBjvyhtQk06s9AO+VFeJwLSZtdQ0D56aXU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6DHxT3FK1KX+fYL3PgU3l+FRGXVf2Q2tDn7awPp8m8=;
 b=D2vI8qTjwJdIyWbuS6pAcVvheI2aLL2Vm/3Huw40+qKv9TT4eZ31iCS6ZC0T8KKZCyM8K7U0ikxGpGqs44/7snc4L7ouVIdp15V0L3Mbkyc8MStqIDoaSJZH/IK7d50cw93d9ulb5s+pP0N1937IY9e45CShhnOK8S22clPsw0Hy4/xKtDODTyjxbZdR95JZQEOUY0G+7fcuWKIzSCv7oQBwU0dqqBNuCM6KSsianJ3Rj35azaqbm6iUsNq075l59GSOGLk26v+13Bn6KF3iAhKxJPrWQU85HITUZkx/fKRieDhsh0ehMNlAveYxqfnVHY1xYAtM8e6dzxdm73UlQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35c1a691-92a3-0fb1-04f2-f75755a3b5e9@suse.com>
Date: Wed, 9 Aug 2023 14:45:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 1/2] x86/vmsi: rename variables to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691567429.git.nicola.vetrini@bugseng.com>
 <37bb5dc6f323bd2dc250c519523d05b66d17fdee.1691567429.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <37bb5dc6f323bd2dc250c519523d05b66d17fdee.1691567429.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a12c53e-84b3-41c3-e939-08db98d6954f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uJv8AIH9/8mEQ7zo15lh/AseqpTj253I6I2aAaiwsPJUN4U974puCxvzz0rpaNSGRcpFrejecZK4kXZGo9HRmRvTmK3PJ6UEk/mNGKqPL4CaBI+3OlDbUSWyJ4S/xk/mPg7WsA1rUClpElL9ansThKZz34XEpHX7pfcPKNX7cZmOxShbv6wIn7R8aKzGpYUiGUBZYQdZMvGdr4F8mTFSkKOzgu8aZwVj/ZQQGWNTJWs4DS0meUPkr1gNeqd7gaydgQAQmhZ2PMB/E6C0CQDXPsZ1tYUeESAa+qiINtRgW+a1FkJi/BqZ/P3WzjChWaZMg/XSYBgCdnH/mQh7WjQ18CA7SQd34b3ItnSQ5oOOYrEUrAmbmpE40ALsRQzvm3XPA9d9b6bDPgMKEF3g4SuKynsPP8ZCCGIWYtudCuhLhpHPG8OPRL+D6/2ZJyvSrYS/PqkjdlId5HqFlHi6xIZkqH5C4Q87isjNay7DYFam7u5SipS+xuYjPm2ijrzNzzOBLnBwzKbbqX7WL3zUQuKEIeMYsPhoCfhJhL8l6qYHpGSbdhuFyPf9T0qhVtsrk98OxYAnOMmenDRPscu3KkyXxu+tDUl9ZkCASGKwMOcZ5B8mIjVEG5IEtQel/nQBnJFD3Re/Ri8fbUoZVxIrQXTScA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(186006)(1800799006)(451199021)(31686004)(53546011)(6506007)(38100700002)(26005)(478600001)(8936002)(7416002)(5660300002)(8676002)(41300700001)(66476007)(66556008)(66946007)(6916009)(4326008)(6512007)(54906003)(31696002)(86362001)(316002)(6666004)(6486002)(2616005)(4744005)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05rZ1c0VDZCWEs3ZTl5c1oxOHd3WTdsQzdaZU5WYmFQcVRJTHlUUEVHVW0r?=
 =?utf-8?B?ZXhkYTIwLzViNXJSR0pOVjFmNFBpMGgrSHV6RkNncUkxMWwyeDF6bVp3NFNo?=
 =?utf-8?B?VEplNFBGWHFCaFFCZGJDRG9NdGExeG9OSjBFR056bnd2Z2w1VGFlYnRod2xo?=
 =?utf-8?B?aVJVYStVMnROSnE4dFVSekFlc3ovS0poOWxvQ0hZSmkzZzE4ZlllbW1jNDF5?=
 =?utf-8?B?MXpreVgxbVlNNE5lelU5T0UweEpBYUc3eXpZMzM3TUhIZFVtWG9kS3FXVS9G?=
 =?utf-8?B?RktUcmJnaDRCNHVaazZUTmVnc2d1OXp4QmdvSWFtREdBOWJybmhEalBub0ZW?=
 =?utf-8?B?RWFOWU9YZmJlUmhJcCtJUEdTMVhWZ05QakYxMzVMRkhmaHVBNkg4dTJyM0dW?=
 =?utf-8?B?K2dWbTVZUmNBbEJ2akNiMkQ0Q2V1MTRHL0NsSm9qYWdVUGxQQzMrNmUxdnVw?=
 =?utf-8?B?Y0txczVDOElUK1RacC9wK0x6VW1EeVdhSFY3KzFlalhSNGlRMTZzVkVuekpt?=
 =?utf-8?B?WndFZ1I1cnNEd09vcmRzYU1kRi9XbDJBZUF1VEVBQWltRHVVRFBKNVlnSTJZ?=
 =?utf-8?B?RGh0RWh0Q0NEN1FEeHJ3WldRMnp4NzQ2Uy84TkdLeFVxVVl3VURQa3R2QWpV?=
 =?utf-8?B?NlRxU2d4cVlreml3QmVZN0tYdGozYktIblNiR2JQK2ZNYnN6WlFRVjlxbkNR?=
 =?utf-8?B?OEF5MGoyK0JzUU1BVHBTNGlxVno3eHA0dXBkUkRQd0ZEWjhuNnBFZm1tWWNq?=
 =?utf-8?B?NjRKb0xxdnJPMXRrZ2R5R2xIVDgvUUpLMk4yMTBQbCtpUW5pckJXaXJOZEhh?=
 =?utf-8?B?blJhMkF3WFF5d1l3bkhEd0k4NTV2ZE85dElXK1RzSlJZS3E3TUdpak15THRm?=
 =?utf-8?B?eUx5aGxnZUlXcUJjS2h1b2o4b0dGN2I4K01Za3dDV0JlakxQWFJ5RzV3QkRK?=
 =?utf-8?B?d3MrVVFUYVlRWW5lVzNaV05abWY0Zk4xMGhnNHRkV3haaTlQYitkMS8rVlJU?=
 =?utf-8?B?YkV6a1lZQU1YNFd0WGg4U0FVQUhnSmEwenp0aU90Vkl0N0VSMHNRTE9FN0Rk?=
 =?utf-8?B?ZkhTSGhZNkd4TERZWkwvdW5yT1ZVLzFSRGJESHBweFhFTjB6VVZtSDJraVVK?=
 =?utf-8?B?cmZNUUZqbVgvSU9ITHF6MmpXcVN5VVo4MCtZeFNFSm9WS1M0YWtsNDVNR2Y4?=
 =?utf-8?B?SjdQd0ViUE81NnlMYjcvd1loWU9ncFBMaEdnN05IUFM1UmM0NStJWTZzZjky?=
 =?utf-8?B?NVhDUmJUQkFJZDhvMXIwVmtSZVJmckZ5VUYxTUVjRmgvWmJHcm5oZHhpTUNQ?=
 =?utf-8?B?V2h3U25xeTRuU3BjTTZkcnh4NDBuRWFkY1U3NGt3V1AwdzdrZCtYaE1JRTE5?=
 =?utf-8?B?eXIyL1hlUFNWc1lzSjRid1V6bDFNZkxkMllSRElzUDc1aENhcFNXM3U2UWpX?=
 =?utf-8?B?VGpXdWtlWkpwUFZ5aFVTV0FabmpnVXFFT2E0dlpKeVMyWCs4em90K0ZlSHRB?=
 =?utf-8?B?QUVoRnNwVVhaWncwVzZhMWNlRHErNU0rWTV3aGdEOG9hMHh1YW5MYlROSDla?=
 =?utf-8?B?N2lEZ3lYVmc3YnlqdTkxVG9DSmJjZ1g3cmZJRmFJc1BPK3RWTnJxYmxIRXox?=
 =?utf-8?B?eHVUaGltV091MHNmQzZVbDZPcmk5V0lyMFJuUVNBdzltWitsZnJuSy9jMTdD?=
 =?utf-8?B?cDdKN1dKL3lIbXM5b1ZTSUYzMEdDOFJZSzJjR1NkUnArNGpnRVNlTWhwOWRH?=
 =?utf-8?B?NHovL1VBdkR2NDJvMmFLT1JHMjRMZVFicUFzU3JuYWlNTksxdlhvS2lxYVVG?=
 =?utf-8?B?bENyQmlyQVZEMnI2RERuZ25QUDFnTGNLdS9FK0RhTEp0SUo0MVJpVnR4aEkz?=
 =?utf-8?B?RWx4L04yRVB5NlUwbE41My9hdzZMOUUyOGZ1SWN4ZmtZMjJucUlkTTVZSUc4?=
 =?utf-8?B?UkhXaWtOZHd0ZDdFbkFGWjA4b1hTMC9wZ2ZsTVJrS2ZTOHkyTmh0SjhCWWta?=
 =?utf-8?B?N2tONy92TjBqMGhMNlNNTGlZZGtTSmFHZHZ2SUtVVEY2MG5FODJDRmZVYTRt?=
 =?utf-8?B?Tjh0VW1iOUduWFBYZmRUM2VrZVZCT2w5amlMQ3hsSXlzQXlEWkxsVENsbUQ1?=
 =?utf-8?Q?rBZSsV1EYck/kfDfjp0QRKpdv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a12c53e-84b3-41c3-e939-08db98d6954f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 12:46:00.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVNzu8bJGZcYwrWy0DGcFExfyueA+dDRNGpy/yj1U+YLQC+WR3Cds4tH6za+gRZP+TKbr+Kb5NevFyojQdZHhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533

On 09.08.2023 09:55, Nicola Vetrini wrote:
> The local variables 'irq_desc' shadow the homonymous global variable,
> declared in 'xen/arch/x86/include/asm/irq.h', therefore they are renamed
> 'irqd' for consistency.

Perhaps with "for consistency" dropped (or else clarified what this
is to be consistent with) ...

> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


