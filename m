Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD1F589C14
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380322.614431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaUG-0001el-FZ; Thu, 04 Aug 2022 13:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380322.614431; Thu, 04 Aug 2022 13:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaUG-0001bP-BG; Thu, 04 Aug 2022 13:02:04 +0000
Received: by outflank-mailman (input) for mailman id 380322;
 Thu, 04 Aug 2022 13:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJaUE-0001bJ-J9
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:02:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a13eb3b7-13f5-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 15:02:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB6368.eurprd04.prod.outlook.com (2603:10a6:803:11b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 4 Aug
 2022 13:01:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 13:01:57 +0000
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
X-Inumbo-ID: a13eb3b7-13f5-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVx18/oN/CneRJ+JyafTUrdDMuNw2/USgvQSI9z73Y6DOFJ8yE3YXWUOxb1fMgMehYqv9mvEdZSZQsGGeZjL9ut3ircO3LRjtY+gzrF/Z4VH32ec5FkJHF+CsHuXMw5+eOqIKWyYeqgi9VA+y7KToS3DCUA4+Vb0mIdz259W4c1vr2MOINEXauOWl8lCxl77xTFYsAEtmDeIYo932AT0rXDB7Qzak9Ognf9sCBvDTkQhKekdVSiZtYPbfNMPwBca2zbZA1N1WXJPBfe0/IvsN/VGRuu6FID0RvjlPScE44iLzxEfpYxYAKKULHKd//aOpc5drnSE9+43mQcmL+ENyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vzvY8rG5JYcO+qztovyVcromDl0fq1H7CGGj60lwXI=;
 b=fkXH5AHx30R0UyLXIF+eJSWBqw3O7/FTTf2lp01cYuNm6sWu7WMGIam9cjNRMJAwPoZocxKlazr3rF60jZMw3L6xnJCPAZ9Tjd/hxk0iKBNpEe83HDhQovCoyxRT/jajpVWtCxVXRmm6zE/07LRm7IKNBkd+1H8m4jiCU/iByzIrg6arybD/p0hLNFc28J10UoM3BOPkchfY6DHt+5IIDWtoDX+C32iatOjb0oQj5xUO/1vPQFEI4BuzmDhgxEEgPM3IWKX1CCzCW/cp0h3Zeg1UZGu3Hpf5ZiZDFyzFlMerdY7LiHEvdFcKI27fN3rmRIbvzD7RaV+yeGUou3M2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vzvY8rG5JYcO+qztovyVcromDl0fq1H7CGGj60lwXI=;
 b=4VO+ADaF6ClzydhPyhIQPbszY63dyg8BbZDR/C5vo1+/I3CJKozKnTQTmzpbceXDRyzkV1x38Gb2okWboL7W+v910r3zipQ1ALjyKca8nVYl3cF4xu2zVQpjsmrXCkdUDvJ423dCzVgDMBuhfihyP+fTUpPgKEqD1a2wOL45lB6kj4UmTwmZ+9uu2FGi+rA/8MY9ySEvNHMcUat8HopNZ8/rPK6wfP3dt5b4eYzANRJGm+GbkKpPC6vuL1V0pzAxu3cFbCSy9HNOIO610RJBH/fZU3S2xOTtTx6stfbSrMA8mNxoix4OBsL48/x3XWZdqXoKICYE7nr6MX18soN7MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be627b72-9f68-2deb-5639-2e7731f3e8a6@suse.com>
Date: Thu, 4 Aug 2022 15:01:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/hypfs: check the return value of snprintf to avoid
 leaking stack accidently
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220804124736.1827246-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220804124736.1827246-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f80acccf-cda7-464f-12d8-08da7619831d
X-MS-TrafficTypeDiagnostic: VE1PR04MB6368:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hoVGX8LVkqqIJ/f5UPBzU95jR4uthvKQN92pebjpUqg7mbVbmxEQ03MbdwGdvQYqsIbg0CtQZ6b4U3w5G+0TLQEB8WV5gs8MJKtSjl2JHDtfgoHxJumw5TdhJTFAD0jrWrgMFAP439eife0vVcLI04SbZM3UmXM6Jr2M/D48GyYgdSsK/RCUD7/f/jwPfBGfyiZ4ShK1UuoxYWmM0ZENwkFV9ECdK0lqJ9Fxl2+hJFOBrFe3sGemF6uX5pg3fd+v0lQVTpQOE5+3ejSBQNFgGuIHiT9jyDXOEwaS+nBpKTnS9WzW6IafVq6Zmz7l1ryNSehELjSHtiwwUhZzsxWKtwDu93593o4W7Cst/bG2EreG2wtxTt2u8eWtfwv4o4hDw2lR7RR2XDo9bmAVp6kWZ8UObDOtXtrD/0P49PD6yBpH6T0M7XZxD8xkwQAoMK+XhYG10ToixfaLPKmfVHrlKDKxEmBPYGOtGx6CIhxs6bgbEoD55jZg5dybpgQygCfZjdEhHYBpfRtz4kOVcdRY88/5RZ5V6FApA9gCHT5K4hOtKZQNKbytuqMU1bxDj3lbWhNr8EneWQurd5/2fkGHhett+tJ6H2DYhF5CulT88XE1Gc8g6TnnViuCiheCwbszhwRrylbjiZlSiqsHMEcqWztonjJPbQth2Gh3rCAdiV3wzlKCtmzYsGSrhg7xVkKFESEqui+CwEd/y/9n6I/BultQVg8tKdOvr7LeAh0St1kdrbjPCo8wQBAxhZL+DIeTEUMkaBnn8w4YOrbdBIl69+5oQqes4uP7qdyVtBVK8jbGcPg1c12mwPmA+Qee2exyWV6uQkOOwb9nHfwI1cpfQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(39860400002)(376002)(136003)(31686004)(26005)(6512007)(8936002)(36756003)(478600001)(5660300002)(66556008)(41300700001)(2616005)(6486002)(66476007)(66946007)(8676002)(86362001)(31696002)(4326008)(186003)(4744005)(6916009)(53546011)(2906002)(38100700002)(6506007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkl1dVN4V0hzcjBXQXVlblVuYmh6SnBnRlpSWllSS3F4Tmdjb29leEIzUHN1?=
 =?utf-8?B?SVhHMGxpd0xQWUFucHVyNkJJM1dHMkhoTjU3YVk3YXYwK2NIdVZjV0NqaEpM?=
 =?utf-8?B?Z1RaY09EeC9OVmhRcDEyYkhRa1ZQQ0ROOStMWHZOZ3JwOHFsc2RRZmFlRWJ0?=
 =?utf-8?B?Y2ZZdTdiU0NHRmNwMkVTUXVZR0dnK1UyckN0NjNMMGwxV0RHcFNrcVRZRWhw?=
 =?utf-8?B?ZGlFVEVRWm1aRmUyNDdpMkltOVZlVkZrUk1SWloxbTR6UHdUUzRyazZMVUd6?=
 =?utf-8?B?SWtWQzV4U3JRcG9nU0RRdnFVNWJzZjlxZjc1VlFQc1luYlVMVlMxVng5NW9G?=
 =?utf-8?B?Q1hhU0lEQlBZdExMdTIyNmUyeWdSYllvVk5zaEQ0UkZtbkplYlhpWTRjQklU?=
 =?utf-8?B?ZnVwc3hnWVR4ZWNNV3NsekhzTXh0Q3JoZU9YdUJOU091eHV6MmkwcWtjaWxL?=
 =?utf-8?B?U1ZjNm5ZUzN2SHVTT1hiMU1VREI1Q1R2OHlSZzdQRTlnRFYvVDR3ci96b0J0?=
 =?utf-8?B?YWZlZVdkazdGRWhjaDRtZ0NKWndDMHhIdkdteWw2L3d3WmUyd1pYSlJxdDhW?=
 =?utf-8?B?WVJhY3VUZEx1a0kvUDNUM1Y4MGtwb3VPS2VLSms2bHpGeTJiT0I5c05UWC9m?=
 =?utf-8?B?N2x0L1pFVXRPTldnTkYvZGZWQjJsVlRmZmpSOUhRNXNlNUNIaUdEYm5ENEJS?=
 =?utf-8?B?UWU2Rjc0aVp1UG1HZ1o3Mk9UUm56WXgwckxvMTkyYUZ1TDhZRjNaUjZsUU1R?=
 =?utf-8?B?dVBNZmtYVFhCSDNHRGlJam9JTmM4YmxEK2N2Tm1SNFV1dXdhbXV4RmY4N1lG?=
 =?utf-8?B?UEFxS0swN1E2K0tHc0ZRWHZtL05BeEU3MWorL1FqQldQbW1lTHpmZTdNb3F5?=
 =?utf-8?B?TmpYdU1zWi9MK2FuZ0ZJdXlZVDNvTDZwWnZQVi9XZ3p0akpTbkJnRjA0NGI2?=
 =?utf-8?B?SzJWSHFVdHE1UXdCLzJDcDRraUdXeDJuTW5OZG5LRk9DaGlaV0lZbHVYTG1j?=
 =?utf-8?B?MVJUb3FyRnJGeGhmeEY1b0REcGFORlN6MmtPNHlkSHNKQ3ZnVXl4bEJBNjVv?=
 =?utf-8?B?ZUg0ZWdPaUZBYTZLYzRvdEdHUnQ2RFd5cVhwMnRRN2ZLK0JQTDlKcmNDRGRa?=
 =?utf-8?B?d2VLN1dReHZCYzJtNysxMHo5T3ZJcUkrMVh1WmRQMGRDenl3Y3d1eTBvaU1H?=
 =?utf-8?B?WUJBLy91a29ZVmtKTWpqc0J1eEJxTTB1VUsyYTBkRFdWYk1mVloxcGVXUkh3?=
 =?utf-8?B?cHQra1VlSWlnQnRIR0ZrcWQyQjBZSUVnbHZVSTdYQkduUTE0Y0JqZHFrRkRi?=
 =?utf-8?B?S2RqYU5mVTNEZE5abWs0WDQ2S3l5OVFKOTZvOVZFcVlQYWQ1Vi8veWVRUXh6?=
 =?utf-8?B?ZElJdlN3cTFtYXNsanBkazRtZUJBYTd0R0NLRXdJa1VEdG5kRTRYc2MvYmlB?=
 =?utf-8?B?R3lhZ2xQVjN1bGd6YVVOY3NBNVBUZWZSaWx5ZkNKOGNyOE8rTTE2YnVrNjAy?=
 =?utf-8?B?Ni9SV3B2WlpJWE1wSXBYb3JRZmxYRUJnbm1xdWRleGZMUnlMbTJIa2pjZzhI?=
 =?utf-8?B?Mnpaa3NxWWpBenJFUjFQemlHOU1KZEpGRTFXTDVQUUltTkxWLzBmV3FiTkhn?=
 =?utf-8?B?M2JEVGk3K0N0cGlRaUtpbnp4QmxYV05FK2pxc3FSckZ5RVJYZzIrU3VuejRJ?=
 =?utf-8?B?WnZIQXhITFVhZGZvdUZlU3c4WHIxbkpMV24rRURVNU43d0hPcmZ0Mk1uN2NP?=
 =?utf-8?B?dUFsRHZKcnlvUWlBMHRQQUR3QlRDQjlBa0JGVy9SNUdLZXhyNS9ZQUg0cmpE?=
 =?utf-8?B?c2ZraUg4cllTZWtFeWFoWHF1R01FeW0xTEVTdE9wV25hYTdDOTRhZlo1YUto?=
 =?utf-8?B?M25RNXhrS3Jmdlh5MTMzWjVwN1VVM3lpVkVOVmF6ZnplUDFSeGZDMnRMUXZM?=
 =?utf-8?B?YWVLd3NCWkNyMGNKN1pOZkZNUXNmZlljS3B6VXFGbERtTi80Q3IvbVpZdWtm?=
 =?utf-8?B?S0lNMnRjQUxtaG9jMkVzclFLeVpCZ3IxdmVoRkx6VWxLOWxCU1pwanJPYitj?=
 =?utf-8?B?K3RhbWFqYU1VQ1Y4SGQxdjN5Tmp5ejkvRi9RRUhJQVNHSzlBQ0lYTGtNU3JR?=
 =?utf-8?Q?FkLBxP3EX5JOWzZnMpAw8pM5v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80acccf-cda7-464f-12d8-08da7619831d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:01:57.5139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8PNbnnNcPvy7cW6CfM2ZHw3Nwmg0qtooDk71x1BybRrmLuJexLDofrJG437jE1yFDEJWNGfLAYKFtVmkQQK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6368

On 04.08.2022 14:47, Xenia Ragiadakou wrote:
> Changes in v2:
> - add ASSERT_UNREACHABLE()

Hmm, this ...

> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -377,8 +377,10 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
>      unsigned int e_namelen, e_len;
>  
>      e_namelen = snprintf(name, sizeof(name), template->e.name, id);
> -    if ( e_namelen >= sizeof(name) )
> +    if ( e_namelen >= sizeof(name) ) {
> +        ASSERT_UNREACHABLE();
>          return -ENOBUFS;
> +    }

... looks to be an incremental patch on top of v1, not v2 of that
patch?

Also please correct the placement of the opening brace.

Jan

