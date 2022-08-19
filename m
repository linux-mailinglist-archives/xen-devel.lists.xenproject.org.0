Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4C5994EF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 08:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390022.627184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOvA5-0004Fy-Rz; Fri, 19 Aug 2022 06:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390022.627184; Fri, 19 Aug 2022 06:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOvA5-0004Cl-Os; Fri, 19 Aug 2022 06:07:17 +0000
Received: by outflank-mailman (input) for mailman id 390022;
 Fri, 19 Aug 2022 06:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOvA4-0004Cf-39
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 06:07:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bebd011-1f85-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 08:07:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2247.eurprd04.prod.outlook.com (2603:10a6:4:49::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Fri, 19 Aug
 2022 06:07:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 06:07:12 +0000
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
X-Inumbo-ID: 2bebd011-1f85-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSrYtXFAtdyyvJRkLeav4dHU9rnXEM4ybubp+oU2Fufi3miGp+0TMFw8PTLhgeHwvfjsLxGX8tmJTC+HRosIB/GTPV1brKE+572wTvGLtHsdkrRAVdvHMe2/I4LOkNFEy2G+c6eZ49sZ6DYrGGKprJu6GOobqpmFg7+6bgr25l+TtxFg8ViriaexfqYceKilKDOKVn+MQUiJPVYWXSnvSiIc8rjPDaz51d9WRThB1mXPkW9xrYT0NlSX7yGpW2EZPBddIFUW1jzd4Ak+vZxToz/RLUXpgVpJvMhLWV9aiKLzsI/IhwcM3mJUpOoMGteclD5l4a0qxkjuUbNwW6/MjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXJohMWn1R/5zadL3QrVtUMPdaKqZXbEzPsfOpT/vFM=;
 b=Mtne8Acn/rtMt2gBw0YMeY4tqkciPpF/LGv4IM03OILiB/OXkiEKZ4Yb36q2CZ9hBg+3MfZMeCKAzyr6qnnFkLDD7oJ/fJjWU+usi6nenE/Yx2csqcnd+2y50KCMIK+VB4vb8VIf9UKVyBEpdTWhLhtNCJw3CWVGtJA/sDcGWpKcyB/XmppJaAAnx0vHMLQGv5i1r1yCoAwEr8lch0h1GZury5od6Q2g4ckff2W4c3K9DlWXvptSbNlIjHUJsk1Rvb9F3c5yQIE5KTxkKNuU7jIHjNvOVjw0B+BKj29gCXQTN6bdRHC6uBBlPXCiZbGH+xY5RGOY2BJdnqVqayYa7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXJohMWn1R/5zadL3QrVtUMPdaKqZXbEzPsfOpT/vFM=;
 b=kB/bQEpyybFxqlA+tamRitjJRiTswn0rqDbLqpoIOL12bDqVLs3FXoESejNlpIdRi5Xr+RnE6qCQChKv8uKsFQxV0qiPuPzJcjELtEzePnfTkltzMD7UwhZSLb7S3OICKFnRa9fNuXXLdGLqNh05J5F3WGYOo3fSYPp42SviXqtOyRC9teU0DKgh6NjxmNU+/MQQsPvwk9VeWUkoNCEQ7+EMODXmay4H4YTWfeq49sxDXbGn5dFv4TOW+fiVh4GNqG3R3pnxLzy2jhQrdMHpUO0/+7zsdeJbCqCgwRKO0XNLzNJgAsv/QMBt7ADojZu4XlzWlyj2937ACqRDCc473A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06310bae-0ae9-d837-fc9e-bbc1209c4c9f@suse.com>
Date: Fri, 19 Aug 2022 08:07:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1660746990.git.rahul.singh@arm.com>
 <26fe963007e0a43b8fefd915027e90ddace1be73.1660746990.git.rahul.singh@arm.com>
 <114e88d3-0ec6-d51f-af41-555f79403b29@suse.com>
 <6FD6564E-8B4A-4A83-8E21-7E156878B2F9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6FD6564E-8B4A-4A83-8E21-7E156878B2F9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 980757b3-c1ed-4731-1313-08da81a90e72
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2247:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7PmWqLIV64QGt6LQjV/njVzigoA3b3DkDLCRDwHxkP9RDcFe8k/doGC+e2p0e9WR4EOFXmOQT9Fa/oQXE6zQWf6rYhA3LkD+hJZ+aWtr72c9daPqpS2QY1jZ/SQg5BR3dTRH6XKS5Vt986z/qqGNCZ5iUauCEP9Y2Nmy26s48rxz7KFOfT+znMccba/Un9fwVuNF+etGxyrh9SEZHiVjLryKX/Mk09lBz1yHpAFjrsR68V+XzjSr2SQEDvT7cjYxb4ObJ94YOdnvUgqrsEstbPR6HKGPWZjhbpcxTg4jeoRPhU3fGGUC38GrNBgsiBabAhYiRLlMiiGvFcsU5k8vQbYRYMITRJDFxpO5vWOCNA0KXpWXTs8fAvOHdIzkyvPuULg8HytSUswYz+K631g4xo0N8imSMwkRi5dqZyEWwQ1DdwT+OV7Bh8qBnwaZTL8dqMinJtymS5muuuqEj+1DY+XQ/OHwGxnDCvwLxQVdmf2jESy4SxbyVSvpvePNlEAQTqN+NRK1K4F24mNgAjAzaJ8XuYa9oMh7zSrLzO2IPjl12nMaT875lPxQIiukiqqJ8dd4yRkNZerVpxolAWltmNAhrKJYsX6hP9xD5tei5EHil9QLOfzhT0vtTWw+QHw8E6RoE2ES1CcMM3+tgOq6W5IslX+7RxuTYLEGuZfdwjowxTvVcYxJj8eXn8PpCnrXNW0OslQSErcrrFmUHywmGT0quVMNzW05dG2qomtV2pSD0rEc0TmwyLGI0+F8tPnOYbZbyk+pqrQ4mfLC5HUmZ3hY3fpA1K+AO6GvHZFjrm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(396003)(376002)(346002)(6512007)(26005)(186003)(6506007)(86362001)(2616005)(38100700002)(53546011)(31696002)(7416002)(36756003)(478600001)(5660300002)(4744005)(31686004)(2906002)(4326008)(66946007)(66556008)(6486002)(8936002)(8676002)(66476007)(6666004)(54906003)(41300700001)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ellsYW4wWWdQOGNaTk44Ym1pVVMzSmk0S0lSSEJUanM0cjhRWFhTRngrYWs1?=
 =?utf-8?B?R3VyNk44bEpzTmkwV25TVUxaNnpyMm84b3B0NE9RZUVxK2taZGU2N1JnQ2pC?=
 =?utf-8?B?Wm9adkpWdzJtbm1WNkRvNHRnY3NmcXlwREd4WTkyMFVsTEVHWU5ZbzhHTUtJ?=
 =?utf-8?B?WHNRcDlWY2ZrUE9CVmp2cWRBdGFCaWtuUmxFVTk0dDJKUkdiblB3L0IrdWJx?=
 =?utf-8?B?TmduK09TSDdkRkREQnFNWjZuMkpHT1ZOZ25pVnY5cmFBSzNva0dYZXh6cmdY?=
 =?utf-8?B?dlh2VE1OMzVjS2tiQjJEQ04wdVRLRFZOcnExUjB2OW8zMWhLWTlRd0NRVkxF?=
 =?utf-8?B?NFRaaUp6Wjh5dWFVcTRLN2FCVmQ2ZDJRaUhERm43Nk41NjBqL0RaUXd4Qlgx?=
 =?utf-8?B?VC9mWVJWSzRPSlFFeDU5Z0NUVHBKWit6ZTJodjFzeVM4YUVhbE16aUg1QnVn?=
 =?utf-8?B?TFlzclVvMjhEQ0NHaFl3b1I2NjY4UkRoTEs3b2FQNmhIR0dqc3hySnFvNmFW?=
 =?utf-8?B?ektRMTJHNHFSaUtTOTAzenU1YWY1OFJXWStoZXNLcU1xZ3FMWXBPV0dGYmVh?=
 =?utf-8?B?U3VUTEtMcFIrSW1DMktFWUE1d1ZiRVc4alRqNW9OMU1CZ2dPVnVnQ05CNFps?=
 =?utf-8?B?cUxrOWVrZ0FJM0M3U3JicDI0MXJPSUlDK0xrZHgzK1ZTakpibWxLTmlyL0FN?=
 =?utf-8?B?N2FjdExjNXVRNDVvd0ZjamNKZmhEdWErSk5NL2tpamdPRmNHcW5MWEJLQlhB?=
 =?utf-8?B?Ky9jZmtTOEt0RS9KdHBFZW5nZVhhUE0rY1FSTVR2eERweVlKbEczVG1oSmJK?=
 =?utf-8?B?WmxZRFRqWU9xNlV2bzl0WmZ0SllhaFZMb2Y2bkJhYzhHd1oraWkvbHRJNnI3?=
 =?utf-8?B?eGZySzlrWXJPYXhCeFN3L21KczhVaWUxdTVBQkJsbE45clJNK0x4Y2dNQStH?=
 =?utf-8?B?Q25lWnNwekpmOGdkNml1NW1oYjdETTJ1dGhEZm1oemtUWis2YytYN3hZOXM4?=
 =?utf-8?B?a0lDYnFITzB5M0RITkhzRVZjNzNYSVpRYndIVzZTa1U3enJMYkdPSlR0ZmJP?=
 =?utf-8?B?R2Y3UnlUN1N0T0VhWmVyMzNVbXJVakhiK1BDWlVJK0drb2MvUHNNN0NydDAv?=
 =?utf-8?B?R3RNMU9wdng2UUxWQVB5RlpsNGF3MjVPdEZQb2R2c2xsTUk4LzhmVnh5L2Iv?=
 =?utf-8?B?QTArWUxGbnZMR0tnRVF4TnV5S3d0Ky83eUNMTkppRWZzREUzODQ3aG1wMyt3?=
 =?utf-8?B?aEJLNmVPQm96VFVhM3RYYzNJU2ljQTJ5VUExellab2VyWVFYNm03aWRrNWVF?=
 =?utf-8?B?dE9tVkVnc0pOZFRCSjZMV3piaWg0aWFnTWllb1RJckQrZGZiRi9wOG1ubWt3?=
 =?utf-8?B?ME5mK3dpbmE1MWxQR2poeU96NE9ramNhNFpQdEVDT1RQSVFqcWNGaURWMUxj?=
 =?utf-8?B?eWI4NVdXMmh5dWJuK1pDODg0SFNPbUhsMWN3UFEvRjhkSEpZTTExS3B2anZx?=
 =?utf-8?B?YXJpRWczTzBpNVQ3ZldBK29lSUczaUNRRnJ0UjdyelhGZUlEWURZYVM2cE9N?=
 =?utf-8?B?N0pDTWpBQnBLWlVUWGpxQWJMbmZEVzFNK0xHMWwwMExTdEtXTW5mOXBhRHkw?=
 =?utf-8?B?bkZ3UjNtRTB6eDRYN3lqTGdCUk4zOXRJWE1kUk9GLzcxL0JMM1dCNXlHeVVG?=
 =?utf-8?B?anFCRUlwK0dyL2ZiZlQ1QXBpYU11Y3BLVzBvRyswNVVRUCs5TkoxTTg5OS8y?=
 =?utf-8?B?YnZwSndRYTVOU0ZVOWE4Y2toQ3J3ZTVhOVJEY0o5SXdSSERmTzNhcEh6NjV2?=
 =?utf-8?B?QTBXM0dOdWN0VzNESDNoS3pqZ1JyNDdBY2hWZWRjd2Z6Qjh1NVJKMlc0clJu?=
 =?utf-8?B?bUNaR21VdzJoak92TXhPZDZqUXNLOWllUldrWlBtTklycjRwUDU4czJhTHVW?=
 =?utf-8?B?OHlYdndtejBNZThUcWJpQmphdTU3dUNsdWJFUDBXQWxuajN0eTF5cnU5Y25w?=
 =?utf-8?B?Y2RxMllYdmcvUEx2TkJEckxjMjZoK2kzQnlYNXk1cm41ZC9uNkdkODFORisv?=
 =?utf-8?B?cWZqOWNhQ1pJQ05qTlpJQTA4V3JySjRMZTRWdXpnTzNvSm5rK2UwQU41eEhl?=
 =?utf-8?Q?vfRLPm/mPSVDAx2ydMleRxF7e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980757b3-c1ed-4731-1313-08da81a90e72
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 06:07:12.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gk7idjhZNcKg03qyFEvj9oJefXAvYuDQrUhqLjuxTZO1WMqs5zjIrhEbs+RpNJAIFt+BE6P8Xx8lS03fF05AOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2247

On 18.08.2022 16:58, Rahul Singh wrote:
>> On 17 Aug 2022, at 4:18 pm, Jan Beulich <jbeulich@suse.com> wrote:
>> On 17.08.2022 16:45, Rahul Singh wrote:
>>> @@ -363,6 +373,42 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>>     return 0;
>>> }
>>>
>>> +static int is_bar_valid(const struct dt_device_node *dev,
>>> +                        u64 addr, u64 len, void *data)
>>
>> s/u64/uint64_t/g please.
> 
> Ack. 
>>
>>> +{
>>> +    struct pdev_bar *bar_data = data;

const?

>>> +    unsigned long s = mfn_x(bar_data->start);
>>> +    unsigned long e = mfn_x(bar_data->end);
>>> +
>>> +    if ( (s < e) && (s >= PFN_UP(addr)) && (e <= PFN_UP(addr + len - 1)) )
>>
>> Doesn't this need to be s >= PFN_DOWN(addr)? Or else why is e checked
>> against PFN_UP()?
> 
> Ack. I will modify as if ( (s < e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )

Hmm, doesn't it further need to be s <= e, seeing that the range passed
to pci_check_bar() is an inclusive one?

Jan

