Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3264592B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 12:42:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456216.713958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2so1-0004SG-Ph; Wed, 07 Dec 2022 11:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456216.713958; Wed, 07 Dec 2022 11:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2so1-0004Pk-Mh; Wed, 07 Dec 2022 11:41:41 +0000
Received: by outflank-mailman (input) for mailman id 456216;
 Wed, 07 Dec 2022 11:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2snz-0004Pe-Pe
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 11:41:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c49b7d7-7624-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 12:41:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7377.eurprd04.prod.outlook.com (2603:10a6:20b:1de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 11:41:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 11:41:35 +0000
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
X-Inumbo-ID: 1c49b7d7-7624-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0t7EvRR4eaDFoysf7Le1XO/IfeMfyMWV29+vhmMBkZH3tK6Up1Sbg/miOQ/LZUOjm+5tjcBxyjOSPJ38I1tJzvnktNgQT+Ii1Iilkdfo62XkRB4y1FXbq5zO7VR/RRd1YqVv4/fAobY65Bd/JP2Oio6Fp3ticwAi3eBmSpXS9O94POZHLAaPK0wyh0giB2C00ywVch9ssQvdvWEvg2rlaMEl5Mxf55vHnkAHooxrjIlbg1DKYhgShfEqYY+8TR87GAzMnVB8vKSFtjBr8IT+JKrqEIb63hxwM2o8xY/ZjphJid4I7luVzxEzi7Gzpt40LpoNFg7zlUer/u6SwPfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qeye4Yp9faDNp0AuKR7PsZOBMxJmqTN0aF0drAqZHzE=;
 b=N+5xUZIoDYrop9dPrL9/fz2F2NG2eLi1hPEE5iGQ4fvlx1KaQsiPqupeDgiqgj/jp//t6lRN+knMe39aNARUaMI5gIWnKvJVFZ3rlMaCmm6TYWPv5Q5EZb4e8gb+H2Z0oPufTZ6d6qKXofn0u5wRS44Sx65KcX00CRUOqA1aEQhVZbRzFZmqkZ8icOlYQ78kS30dzwefD0dV+0hD8u8n1+roankBTZOfFwXx3iXPX1o4yU2pGGvETjykSK+jDSb4LMrC7qY1VbTq/fG+1gwlfvShvrofkp3jW9w1GNOHZautmDbcWWlZSh1olwEWDMfL7wAlEfbRpB7dbD06ePW4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qeye4Yp9faDNp0AuKR7PsZOBMxJmqTN0aF0drAqZHzE=;
 b=kb8eybaTWLfTzqPHyszuCXqBjH4kTiB3Svx3K++aBKzNnB7wAVLAo4tQOVOn9qaRtGcIJVLtGHTC1SUvspT6lFctX4LOzDGbJRGpvIfnVnU7j6EC9cA4Uod8ofJYTdaBtvy9YLHjn+UMJSpyZM0TCUch5lNObU2pGIe3pNLr06ZoEgRVPXwzpUOCPvcz6Yuh9SPKWWyO4o0x0kU7c2AUkoR8xptx8Dma9RPNQCyTE44U1AmnLl4LrHy9kBPncNIW/ngKHdvBUIaW3OI7bhxTEWMDRKl7Vs3h0F9TH3GFqPXq1LFFGhDjOWtsT5uY7pWoayALLEi9aQHwUBYPpecQaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f453f08-0bc5-04f8-02aa-0beb0f0f3b5f@suse.com>
Date: Wed, 7 Dec 2022 12:41:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Ping: [PATCH v2] xen: credit2: respect credit2_runqueue=all when
 arranging runqueues
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20221003162158.2042-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221003162158.2042-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: c08d26cc-8f81-4ec3-bfeb-08dad847feb3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qcw0qASZZoYrDegP7z1NhycrASeIZzJoKGhw78OtYSJuDWkYWHn9Nrmk4Oz3Ac83bhlxztVN7Cxo5ydfH486xEnexzkNjl2OFYHCdmNyQDnw9kb/blHn5tN7phi1KPi+wk39KnqFy91AaitA/xlRBYB+9KMIddjf5da2vfsk07pV7vWqT7pHh1pIDTQN8sZ36mazg+pMWqFHB1FP5OUCFOXzQlq8vQyO2egobXKcDQudSiVWjhiiPClLacxaXSvpp4FguKkj3mVi2kUOIepFQbWzxu4T/HF8tUQ8rQYa9BRL+r+LCieLMr0TRx8xYg/rt+Nc2X83sVwSxSUTVETyfoqa7f8dnLeGD+wuBTNR34iHQgEnXF+0GZEMA25XX46tuoCVLtjRa4pfeqJ/dyS1PPPXsHzCFY5qL8VijRACKPgemqhKSA8/2DsnZ2q6tDpbrTQz0jrEZ2AR2zoWCtsVuCq/06TaEsUGrHF7D0NqC4jFRbsSWl3A1E8/B2RDwx/mmRUeW5PN0rx2GC42fKqVCYOaBjMXv6J1cj8erow5XczOQJaIbv5QKwy94C6cjdwhMFZr6NMyjniGt3/+jmvhuOqMJuhgwRATCJD6p/rhjh2YDAkFI3QkIf1u6BcUhHypcRSg36LCLNoh90pCuCAOeP8jg87AgwjJcNtdND3k0GljPDPMssf97a/FjaYIPkkFNeLDCi9VcqyWigOOv+rkuX0+l+4tO/RDHzWr93M932M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(6486002)(83380400001)(86362001)(5660300002)(4326008)(66574015)(41300700001)(2906002)(8936002)(8676002)(26005)(6506007)(6512007)(186003)(53546011)(2616005)(110136005)(316002)(54906003)(31696002)(66556008)(478600001)(66946007)(66476007)(31686004)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmpzcGhlYyt6K2pMV250QTVvWnl0VG9ocW03SnBveXBSdGFUVVN4endJUVMw?=
 =?utf-8?B?OGFFWnJtbzF3RjZRN1VaQTVHNG82Zk9jZmdTS1I4T0JXdjhjclI2b0F4TlR5?=
 =?utf-8?B?aFBjMFc3WncrWmkwQ2RvTU1nSkxuNDJEeE96bDA5c1lkREM0ODNHQWpGVHJ2?=
 =?utf-8?B?NTF3ZFlPa2JhQWRqYWdGeXk0bTRCcG9Ya3RqK3NUTDg3V3RyUmtpZFZkSnZ5?=
 =?utf-8?B?VXVPeVFKTFZsc1lYelp4NEN6dGJvcUJEVG9lQjdHMDhaTHo4VnE2QnZDVDVz?=
 =?utf-8?B?QndpbDVvM0RUUFk0ZGllYnVDL01nN0ZLbzFFVTNJNXBybU00YWZGZ09kenBZ?=
 =?utf-8?B?dmwyUUZUNU1aNWZmQkNobDJLS0hvUHJUUmpWbTBhMWJBMFY2ZDVhTUpNdnZi?=
 =?utf-8?B?TGl2Tnl1YU9oSVZidERtcXZ5Nlc2WFRDZEtiYUQxRVJYK0UzOFNJTjhSTTJV?=
 =?utf-8?B?NVNpRWR1WHdkUE0vTjNqdzM2MCtHdnpaZE9nakp0Wk5QSEZYSzhFdGNmRWF3?=
 =?utf-8?B?bGIrVk9CT0p3WmJ5L21UL2JCN3dxVm9rd3NjZDJZdW4yL1FMcVFpYmo3RS9t?=
 =?utf-8?B?MDRKakY4WmlYWVZBbEpJL1Bld0R5NEZNeTQ1elhsN3YzY1RjYWxIYU9KcWRR?=
 =?utf-8?B?RkMrcnNoZ09wRFNzbFpmQVJOQWNqOUN5Q0g5R3pIK3ZYMmVvZjlENzU2dTR6?=
 =?utf-8?B?VVFHWDU4UHJsWktjMm10eHd6aFlld1dKSkJOemxyc1RsUThiejYrdmFpcFBw?=
 =?utf-8?B?Z1FVNWF0Y1d5Ri9uMzVQZGZaY1B5eldNcmR2R2Z2cWlUcGcwRk5YalEyT3pk?=
 =?utf-8?B?TURMZ0UrK2YwdnBzY1dzMHlWKzBjMFlYRStVSFdUZXpYYmJTbnpsdi9EYlI5?=
 =?utf-8?B?THNpdUg2aFo0a2I5YlVraTl0eWFuaWk2dHNydEhZT0o0T0hQV3RXZUVEUXha?=
 =?utf-8?B?dWJpaURtSEpLYS9DeHhmZU9iRjl2ZkViWVdZNkIya2VYamxXTFFNSFBSZ2I4?=
 =?utf-8?B?QjhKRHZyOG10QWVwdFFQdFdYd283Y05ibVp6Ni9hSEgrRVNMaHJWNkVzU0VF?=
 =?utf-8?B?R0JYek9RV3J0ZFVCREgyNWlLZHY1b0ZiRTBvNTFiLy9vOUxPM004WlBvYkwr?=
 =?utf-8?B?R1Q4VXJ3RDRhVEdYZVNKeDB5bi8rLzhiNnd6M1FJcStrb2pCMmR2SjVSZWlG?=
 =?utf-8?B?S1c2NFA3VW9XNDVTUktQU0k3VDMwUjNZNkJqb3ZUTkZhYVlleHlrQUNEUEpu?=
 =?utf-8?B?ZzJZV0Q3WmpXV2VpcEViZk1pYlBJbW9WcVBpQ3pNc2xyM2xkZFVZK21qcFFB?=
 =?utf-8?B?aEg2WFE1TXprSXk5M1ZkTG5tdGpXNi9JdFc0S1l1Rytzbk1xZ0lEOUs5dTN4?=
 =?utf-8?B?c3E1RUlsVGtiV0tpZTRsSjVZUmNvUElzbjBlR2VndHdPR01yd2I2eWVZNU8w?=
 =?utf-8?B?dS8ycmx1ckgwYkJleXRzbi95SzJxZVFPZmQrbFk2eFZPbS8ybGRmWHZyQnpN?=
 =?utf-8?B?MUN6d2lDaUM2djVpOUQvT2pkOFhaQWFyNk1mSjlNZ2o2UnNSMnBwUzBOWjlO?=
 =?utf-8?B?TWE4RW0xL0p4UklIZkc0Mjh4dnFpckRBUlZPZ3Q3L2hMNjRwRFp2aVJUVU14?=
 =?utf-8?B?UHp4OWE2MWlMS3dRZGtkR0dZTGNQN3l0bHdEZWE3RnJhYkFJRXhMVTdLTG5s?=
 =?utf-8?B?STdNVi9CY2FNcTk3ZjVYVHRReFNJcHk0bXl0TXNCWHROb1dtMG1tOUo0ZjlL?=
 =?utf-8?B?WmNrWVQwM3djdHFzbUt2V1AzTkpPSjJuZ1ZMZW1kTW5ROWIzNHoxL2V0UGpz?=
 =?utf-8?B?QVorSEhuQTJvRU9YRGcwYTMrcGRZSHRzTjJRSU5zZW0wQWZkTDNqd0NxL00z?=
 =?utf-8?B?S3dHSDFzNGo5Z09vWGVUT2g5d0lFTVhNN3ZhVUZ3TDNyRUFTUU0yRE5IMzRY?=
 =?utf-8?B?WWlFZFl5L0ErQ2xPekdzTCtvYThRbWpoYVNTL29pT1F2TnZxTG1rZitMUHhT?=
 =?utf-8?B?dXdhbGcraDRNbGVxVmZpYy9hZ21ER3dTaFowMnV6ZVk2TkpFMkJnbzJqMEFQ?=
 =?utf-8?B?VllGOUxkK283VEVvTUdVWUlsdHlkVVQ3RUxRTEpYNitWVHpZQk13MzZjV0Zy?=
 =?utf-8?Q?/ZgAz8cImZsY5K1Fev2RpqNdp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08d26cc-8f81-4ec3-bfeb-08dad847feb3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 11:41:35.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DB6+X4jE8wT5fnlYhTsD68HiP9N2NYDpw/sCpmdaWfY5yLEC7QHXNd4zq0MxdJzd/CdOHVaUrqOalQLOy7yPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7377

On 03.10.2022 18:21, Marek Marczykowski-Górecki wrote:
> Documentation for credit2_runqueue=all says it should create one queue
> for all pCPUs on the host. But since introduction
> sched_credit2_max_cpus_runqueue, it actually created separate runqueue
> per socket, even if the CPUs count is below
> sched_credit2_max_cpus_runqueue.
> 
> Adjust the condition to skip syblink check in case of
> credit2_runqueue=all.
> 
> Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
> Changes in v2:
>  - fix indentation
>  - adjust doc
> 
> The whole thing is under cpu_runqueue_match() already, so maybe
> cpu_runqueue_siblings_match() isn't needed at all?
> ---
>  docs/misc/xen-command-line.pandoc | 5 +++++
>  xen/common/sched/credit2.c        | 9 +++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)

George, Dario - any chance of an ack (or reasons not to)?

Jan

