Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66643F969E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173505.316578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJXk3-00013j-Qs; Fri, 27 Aug 2021 09:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173505.316578; Fri, 27 Aug 2021 09:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJXk3-00011J-NO; Fri, 27 Aug 2021 09:01:39 +0000
Received: by outflank-mailman (input) for mailman id 173505;
 Fri, 27 Aug 2021 09:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJXk2-00011D-6v
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:01:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91cd9f73-e856-4e84-872f-fa564a5d313d;
 Fri, 27 Aug 2021 09:01:37 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-XJ9kg0oEMJqeevfW_tl7tg-1; Fri, 27 Aug 2021 11:01:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 09:01:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 09:01:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 09:01:32 +0000
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
X-Inumbo-ID: 91cd9f73-e856-4e84-872f-fa564a5d313d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630054896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SAHcHyJWXLvA18OIYwvYT2sPhL1aH7krd7s/dpGZjQU=;
	b=HYmNhRLPYG6PYsK/P/Ty/UiPhXIQv7Cje+WZWvizP0rDxiETxYLOdlxRZLAnMWuTXSRV4E
	So6HeR1ln7dV0ScB/bmTgxhWnU2hurmZrqBSBc8txg4UuS+ZHv4I8z8C9cgH3qsVuz+YvV
	6Sldj6oqOyqPhCUBQDXRCGALyKLCtEU=
X-MC-Unique: XJ9kg0oEMJqeevfW_tl7tg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKgIilriRzdFfoTNzY0i7otRcYg8ZeXnxkiHtXOQPWKhCSOoqa2eU2EizJ0VyfnCoW4fz7y+egl5ZsDFWJ+56sRlU1CjKiBALLVMTHqKwwm1/V9SMDg7xkYeaizb+HFBPOVZaqTA4lUL9NZoY6zxg8lSGvCr5EMmWuJHvrSDJpEKK9chC7RR4q6JNYgtbLFnm8vZg25ED7QvypXTfdegLu6pckRkw4WKUUBXxjeMXoJJysJdRGyc/guhEtmCzkM2wCQzrBcO7+Or3N7E0ZgfhMZuXOV53Zu2qS8zJ1LZTGoVgocMsTjsuw2YJc7PDE7+wrTT97aVqsU924MhmcaQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAHcHyJWXLvA18OIYwvYT2sPhL1aH7krd7s/dpGZjQU=;
 b=iZ007c9U2xss/gT8G5DSw/rrI9UnCvXW+fDIylyflUqrWJFeznpNGEVDCcUysG1sN7wO9n2n+lynDuO3kck2HK1uze8VmdLufdCW+9PzZeBv5JLuBw/Kqd6GXcox6ftlUiU+lFA9avcbEPLMChz0L1XyjTTFsnIcQ+LsZGAj0ALmBwSTlit9rQ43yM+NakdIc5lEbhbvM9DXqCy48mSog+JG1c+gbKlQ4ykENN3YN+ymjEherIL/jW0L2fz+JOdwhW533YwTqXLtETaqSlXUx+0nIbX1+7N8WunqCVz4ChKU91dtZnxro8TewIMxx3QtpxlJofM8euDt5KFch/lR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: Linux: balloon_process() causing workqueue lockups?
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <2bfd9396-0967-df51-298b-22a91f570c48@suse.com>
Date: Fri, 27 Aug 2021 11:01:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5241aa48-da18-4f19-70d6-08d969394400
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5470AA599E572BA5678CA84EB3C89@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ik/1z6Lc+NCNMfCnha4qv/pt1VnunFPlfeRGp+UuLFrF2MDaaHz6h6aUrpqEYjWblTMPJ1PbfemQubE8+KjAlYot4vihwHmyiKf1mmv5tKBmqKs5tGk7K8S2g2rF1whgS0RY23nqKSa4Qjx+nSLbBu9nBFC31xaCDVGjaDJC0XAP7tIEvOMejHRDsMfpwE4zo9Y4WYRuguYWgOCc0vso2I2XwsCZwk5rdT5oc2/WrSlol5bAiV9+9ZEvVFG7VreLfM1D1S/iYMeYR/N9bChAUtWogAh052+GSON+RWnQhVR76LmfWmCZoCtKOa+uCZJCwE66yxiFAhpl/zs7nPiKHscSwvmQBJ4LpMIdxPBbP8LU5A3ro+c8Xx7b0FWUhAji6IgmF9+2W8aJ5MDEYckPFv2lysS1CfFjqxtASDAe6/0xXq01bzS/wm7qU+cHpVrDy/dorGhD1u/WaoYWZPuivmySN5PuOqT2X4EMQT/Cddu73MLOYielqpC0Zk4/F07lL/PqKozQTTPsQc3THJe1KkHVjlurJTMPyUf/jphpd/34jegMqrTpxGsptr5UvdnQIqTRf56wfUeGcOj1QhPSJjDB9FfeifjYO9LYVhIfeMrkqXmBExbBDl/wC+G8pnoqttH33kZHZrJNUjxS1rJLneFtuOMRcGQWLpk/Oclrx6sJb6LyvjZSckZkFx+lJeJ8R+5lOOlpqN8ud4YDJPJqxe00hzOiVsVlUzTRZteyJos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(346002)(396003)(376002)(4326008)(316002)(38100700002)(186003)(36756003)(66556008)(8936002)(66476007)(31686004)(110136005)(31696002)(16576012)(66946007)(86362001)(26005)(5660300002)(4744005)(6486002)(2906002)(478600001)(2616005)(83380400001)(8676002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXZwaW56djhtakkvOG9HM28ralM4d2NlZ3NxU3N2WDlsTnRSaXlGcmMwZG83?=
 =?utf-8?B?cVArWmdzSmZaTEZOaU9GY3hKbkJOdExzVTJSK3p5Zi9PWEVYN0NUMTIwdGdC?=
 =?utf-8?B?MllxOXZ5ZkhZekVUUGpVM2hXakpwSFJEbXBpMDVuZXZhRllYVkRzQmU2TGp3?=
 =?utf-8?B?WUp1NmFna3FTcmNrbFBiT3FzUG1IZFhLalRtaXFia1AxYk5qTUZNSko0enlo?=
 =?utf-8?B?STdTdEFNUWM5UHpJQVNqVTFhb1c2ekdmdVZrN3hzY2p4dE1uU09LOWJQdlY0?=
 =?utf-8?B?K09qMTMvT2U5Kzg5QUVhYnZWSFRnMHZYMUgxekhxM0N3YlltRnRKLzdNT1NJ?=
 =?utf-8?B?SXZ1NGErM2dYbmdhNmtCWFZKQTFIR1VTTDY4KzRsWEVFMkplSFFtT0ljSDB4?=
 =?utf-8?B?K3l3ZkFNRGFrdmZZOFBvbnpQd2ZGWXZjM0djVTdFYTN1TjFJc2t6OEQ5Rng1?=
 =?utf-8?B?V3Q1ZTYrbEExSVQvTk9DYjlSUVpwb2ROU2YxSXdEVTJWMk9YMC9jRjB5VTJN?=
 =?utf-8?B?M3lUWEN1OElNNkZIemc2Z0pXV2EvbXNFaWRNVm04ZjRZbDhDR2grdFppM0Vh?=
 =?utf-8?B?L1Y4SzVSYlFUSGtuMkRKcit4bCtpYXhORjJDTjJhbmNDYVVnZ1ptbzdqRUZH?=
 =?utf-8?B?KzNiOTBEN2Nmek1iRUcrSlVHUDB1UjRyMUJ5dkpvU3pZRTV4VU9tazFodVBG?=
 =?utf-8?B?UXVteXl2c2crb0FESXgySVRVNHp5d3NsQ1JMVDhwUG9oT2JONnhOTW8vR1VD?=
 =?utf-8?B?bGFYVWlzZmVlVVNoem45eFZvY2ZzVWx1bmdmUWlSMG5Ra3lEN0NtdzZBZmFR?=
 =?utf-8?B?c2NhSWNUcEFQM2hacUtMTnpLa3pLckNONVByRHpkZ3V0YVV6d1pUeWMzYzJq?=
 =?utf-8?B?SU9IVlV0bDV6dHVCT2tTLzNtTThuRnk5RlgzUS82ZjNodjZCeHJKUFJ5Y0hW?=
 =?utf-8?B?dnVOUzhtYmtpTVV4SWdadmU1WE1PR05EMGI4ZmFRY0UwVlE0ZEp6eDdVOUZq?=
 =?utf-8?B?dEdSSG5zRWZSeW1ZZDArNlRSc3pDcCtlUklQaXlHblFYMzQ1Y1QxcEhSOHgy?=
 =?utf-8?B?blRpSDdXMWtkU2czMjZLUTU0eTJIU1ZmK2ZGYmhGTUd3T05JcXpWaWVCc0Vr?=
 =?utf-8?B?ZnZLUXdCU2NaclFHQ1gwZ3pUK3B1RStaa1NwamVMWXoxd2JpcmsrZVlGSWhm?=
 =?utf-8?B?aTRYanVsaktVUmNDV2d1L0RQZDArbW1TK0lhbk0vS1hrelpLZHUyZFZ4a0hG?=
 =?utf-8?B?MkhnaHh3ZDBPeFlzUlNpMUNtclNCalhYeE45ZjdlRFh3NUYxRHNQb3NjMGRN?=
 =?utf-8?B?cHp3WGZJRmNXTU9aVitvU2RveElLbDgxL0o1UW54amg2UkMzcHEzcGpWVEll?=
 =?utf-8?B?R3lTS3lWWVVuOEZrM1h0UUZQNkhpRkxQYStORDVQV3JSSkdLRXErOTk3aUxr?=
 =?utf-8?B?aXUwVGQxTnFEUmYwOHdzcFpoUW1MdkV3WGxObW5heWFZVFZBNk9qVWFTcytH?=
 =?utf-8?B?K3FrQW1JWC9KTUhBS0tUTlJOUlhkS0VKajB5YTN0VzlyT0JJbmgraHN2SUlr?=
 =?utf-8?B?UGVPQUk5MjRXTWJ5Sys5aVVQOVV2WktHV2VBU0J2elNnK3NtOExvQmc5aGRT?=
 =?utf-8?B?d2RRZ0tNR05ROTh5RHdvUm1RaDVkMGk1ZTdhZlpOUW5iUzFUK3BxanZNRS9R?=
 =?utf-8?B?Y0NNZHdZMFNPT1FVSlBzc1RXRVZhaVFJR1JUY3lzbTVRQk9OV0RRMEl3QjhG?=
 =?utf-8?Q?0OGTEfAmklHx/SVd/IunFdlmH1N4taYLRt+bztf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5241aa48-da18-4f19-70d6-08d969394400
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:01:32.5597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPU3ZiOK6q7rYOiQK/rGf1ZgYVSPbjYJTo+yTEP2BAY22tw9osdwf4AXD9i4bFbsN0NdCO5d13Vx/CxsnpfzJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

Hello,

ballooning down Dom0 by about 16G in one go once in a while causes:

BUG: workqueue lockup - pool cpus=6 node=0 flags=0x0 nice=0 stuck for 64s!
Showing busy workqueues and worker pools:
workqueue events: flags=0x0
  pwq 12: cpus=6 node=0 flags=0x0 nice=0 active=2/256 refcnt=3
    in-flight: 229:balloon_process
    pending: cache_reap
workqueue events_freezable_power_: flags=0x84
  pwq 12: cpus=6 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
    pending: disk_events_workfn
workqueue mm_percpu_wq: flags=0x8
  pwq 12: cpus=6 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
    pending: vmstat_update
pool 12: cpus=6 node=0 flags=0x0 nice=0 hung=64s workers=3 idle: 2222 43

I've tried to double check that this isn't related to my IOMMU work
in the hypervisor, and I'm pretty sure it isn't. Looking at the
function I see it has a cond_resched(), but aiui this won't help
with further items in the same workqueue.

Thoughts?

Thanks, Jan


