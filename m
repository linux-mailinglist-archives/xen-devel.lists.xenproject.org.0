Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762EA579672
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 11:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370504.602300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDjf2-00013W-6Y; Tue, 19 Jul 2022 09:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370504.602300; Tue, 19 Jul 2022 09:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDjf2-00011E-3W; Tue, 19 Jul 2022 09:37:00 +0000
Received: by outflank-mailman (input) for mailman id 370504;
 Tue, 19 Jul 2022 09:36:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDjf0-00010z-0V
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 09:36:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80078.outbound.protection.outlook.com [40.107.8.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5494f572-0746-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 11:36:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5679.eurprd04.prod.outlook.com (2603:10a6:803:ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 09:36:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 09:36:55 +0000
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
X-Inumbo-ID: 5494f572-0746-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUckE3dvkHn4P/wKeqyN5BGwM+vW5uYJ2JGlsoqLQTDibrydhgH2lp+JB5sInkAA2JrwBo8KxGi1D4bcI3/YEXuffn72wOizsCOYrala5ZNu2FdJF3shci7NaW5lCBQKzqPB0JWmg4QxPS36iDwG1GE4PeEdIRblLO5vV1UWomsfU8MKnApu/rlwByl8EtMUfAYpEbF8a5QW28NVoVivRxwmIpnUgRGuUMrrr8+b0DZRe0mg91yUI0urPG4ordo0+xS0lWt/866qeBuFpqI6yaU/qPWcOd2F1TUl1hKYxJKfyQFOqLuYr6dmkEmcXqhanJHHBHCyl7iKd7FrOqXz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKUbbPv7+dRxb1QL6FA+0ZSJh/h0yAdGOQWjDusTHwg=;
 b=fhUx1txzi71GRogv39oJuwZkg2G0ycj9xMybVMdwKCBx+/SujhuUMfy9b5cTVfI8ho+cuiFNSJGL5LHX06sikNISUrGz0alK4YH9EICOOF9V2eJvjD9zcKV0wyTmYY+p7dD1ibO6RRqfYScl2gfZuBXGYR8g/iJM39+DNV+4kLu2Sgwr2LJ+rJZuFlv/tzW0fN+NWG9+YJrnO8BQ7DdKgqKW4hTf/3LYRMfatFhgU7L96DLvqZk2PCTMXS0o4bCltRwzmQn+0s9YRA2a8XcEIeTBgzgHJ4pOM6A1aPvBljbNbR5FbebfacDjQ7vij4SDRhUpm5OJxz1Jo/cIwxW0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKUbbPv7+dRxb1QL6FA+0ZSJh/h0yAdGOQWjDusTHwg=;
 b=zvbwyVHSY+VC9ydO2HgXXJH06PSb+PIfFyU625Htgs3Km1ha8aPVtSVU5FLSYRmlGxnmjIbUQv8NSE5aLmOyzaBTrw9+DJA92Sj8J6BUBgYecXWZCexnC6B7AW8MAlbYCisyMNMGn4QRQ3UxD7KaFw9NVUH5oOZSfc2mMp93n5CxossgZL6KgumFdYM5/lhFsJQ/pC1QxyXybxX2VMZDtD5padg1g5p6Er7IeR1+167FC1MVLhA8D0xsWpLZoUrOP2e6k6LPW4Uwms6+NkLwkNzJy7Oy6GRPvCWmpCoposYOGx8h22N6tLN+Ocz7haU7HwBPNg+SULlxNQMpFr/oxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed9b1e17-6c44-0c59-138b-c1552df9eea8@suse.com>
Date: Tue, 19 Jul 2022 11:36:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/18] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-7-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 237c7eb4-38e0-4038-aea8-08da696a37d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5679:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kbVa+3Xacfu9oVs42QmGzY6ogJ2ML9gkw+XHa147BKg+lckA+j6V1CH0gxoQ4uAyl+SnKh9u2EljxwHc3ng5jL5FFqwdgljGwOrOkIkOmu0NyDcSJ09W1EgmTylNeLl67r1RJJbdfo+onrz9nOrDOt8Bk3oZX9gfb7fFxtlhwhvoE6K4VgGShwWtGsmI8+2Hbjh4svij2lINziKjxeU9P1bdPiJqROV5zHdSda6s+7qMGdeIwR3MnlslmNMJ0p1h+dO9BYNXLj1QL+jbFQufRYqzy+OJdxzyNEKTe08IbchCx7/CJycbwtUndQgT0Ao8D2uPoGIHifh1grVFZKPz3L85/mS1tVzuiKETShT3DQR+pRjUswcJ5Lbz2adT4qLlonapDADhUwzqdu3wJ1lLZGI2HciEcnU3mJC9+X82TExRJZPdB4ad9gcp+JNrADiQdyoMuFStwCFM+X6w3X7r7WP8EQ+8CikJeqwrIRWDLqxvwOjkULjBkRHNDhxmxaO1m3yX9kekVUmGt2pKFdrRPppzi0LYkeBgs7r+Q5qtd/st7Ov7zect1gClA+FNI5UMYvoRKTcBTRLgAZNhxwzuswnJDUBEfguunhGsPzp6iPQi5LNYD6XIXZp9wa/IPXrPUmtU0RTFReiOveeiODVWSz+p/8E41kdVs9ytloX/t1No7XgAwPpbztoaTjOcPVXB8vgckc+D46q2X+2Q5PpEaTIpoVdSVecOBlXtSZwFZRfDxHx27sNlJncZRMf5XfHAor0gEDyZ/P9KELmTjMYr2+H5n+u+AUom57ov22hK1E1lWFi1vkAhE7yAwmtc9DzT6HRezTOmeNtMmWGG4V5s8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(39860400002)(366004)(346002)(2616005)(5660300002)(6512007)(6486002)(86362001)(83380400001)(31696002)(8936002)(6506007)(2906002)(53546011)(7416002)(26005)(41300700001)(478600001)(4326008)(186003)(31686004)(36756003)(66476007)(38100700002)(66946007)(6916009)(8676002)(54906003)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHhGMUZHcWdqQlhrT2xNMzJHQ1FjYU1XRHBOUjZndkdVYVkyRTFPaDhRNndz?=
 =?utf-8?B?RHlYek0rbHRWQlhyN3FhTFpoYU9wVks0ZjlleGt4UzlqWlRMenR4bGVSZGln?=
 =?utf-8?B?UXFQRDVpWVJVMVJ2eVlYa09UZDhxb0MzRkx1WEVGRHJ5cUlOclp0LzdqSEtp?=
 =?utf-8?B?dTBod0JnYTB4UTRDWVVwMlk1TVhSQmN6M2FDcnp0eHlRSjk0V0lHQ1V0YjNv?=
 =?utf-8?B?SmsvUnJTUUdmTDByS0tJczJjeUpFRXcydzhkNzllcHdpcDlrVEdaZjJya01w?=
 =?utf-8?B?R3BXZDlFMTRhYU0weUg4YjBNaU1tWjN0MUJPVlY2a285Ulhyc0JyNk5JdDZh?=
 =?utf-8?B?RGh1ZE5LVGFrVVQ3SVVoVTNmR3FwUStMY1h3TS9ZT1ZJSitHUytLSTlsRVoz?=
 =?utf-8?B?c3FDZ3VXR2JLd3EzL21oN25sSGp2QWJvVSs5eCtJZGxYbXpVMTg0R0w3ZmVw?=
 =?utf-8?B?cElOeExKdERHUGlFMmsvbFliM2ZHZ2NlMC9SeE5HaUU1emZid05yWEE2dTZV?=
 =?utf-8?B?WkpMb01xSGJPRExQMlFlWTI5ZXpBQWFoR1VwcnZSeGkvR0tvcHZMa24wZjdU?=
 =?utf-8?B?WHdqT1ZLVVE0RVkrV1ZLMGxBcVpmTkJsK1hibHFaemhHVGxPMnRqbElaSFFI?=
 =?utf-8?B?TjQ3MnRYVlpSRUdLYjVjbDVFSXZGL1dnYkIyM01ncVdpWFZrQ2N6emsxWFIz?=
 =?utf-8?B?YkRoUjVacnhJbVBOWDRmSUVtWE92a1BXd1Baa2pIcWl5OWxPb0ExWFNiV0VB?=
 =?utf-8?B?UG9hZmpNZElqVHp5WkYySU9jRWtlcVdzMXRwRjE0TWljb1l0Qk43dlJncWYx?=
 =?utf-8?B?UndGMzgvaHUzbnpqZ2tIWU0zbS9xcmRvdStsS05RSVMzb2puZHptSXlvM2Ny?=
 =?utf-8?B?cnNyckZPeDVKUmk5dHdUaGJiVG8vWUFEOGFFclNMQkNQVmFXOGs3V1lyVnQ1?=
 =?utf-8?B?TjBFVTBxOG03Y0szaDcyZjVuNnJlM0xVKzY1a2RRNkd1NWU2czBPaEZ4eWdI?=
 =?utf-8?B?c2I0WHdXemtZakY1M2krZkJwSDBEUlVhZVFlMU04NDF4L0VPRGJTMFN0MWVh?=
 =?utf-8?B?RTRZRWtXM2RWNFIybENxVXFrVWIrejE0UVBmOWoxZE9EdUppL2JXaHFqQ05D?=
 =?utf-8?B?YnNZZC8ySlFrcGNETWxVWXBiK1Y5dWdQcGxuU3ZGZnRhZUVpL1A3MFY5VVNO?=
 =?utf-8?B?T205dGRPdjNKWkVIa1FYVjFJOFhiVDlZaVJaNTRLT1RMMkRnNXR6N0JqRERo?=
 =?utf-8?B?QXJ4Z0pDUUZuRDgvY0JjNEVkN25zb1JWMStIU3A4b1lHVVJzMjFxT1llSWZj?=
 =?utf-8?B?VXNIM2thczhYK2N6NUJQT3NGMERxV3o0NVRBZitTRS9kRFhIL3IyMDFmMlBD?=
 =?utf-8?B?Z3pwWVhNSjJNZWFtc2JOZzMydHRvRU9oQkdkK3Zmek5xVEpSeXk3czkraCt2?=
 =?utf-8?B?ZTczQXdYM1F4eXphZU0xaUltRWNzSUtzODBtR2kybVB4eTBPWXZWR0VZeXQ1?=
 =?utf-8?B?SzF4VEZubTJmVWNaYllINyszNUZ3QWFEY1F0UUsycjNoV3RKb2J2UWovTEhl?=
 =?utf-8?B?QTA3b21HaE5rL2h6dkdrUmFCNGQveWFlSjNjTkpnODhXdEFUS3ByQVBYQ2Zx?=
 =?utf-8?B?Y3lQTFlyNEt3MXJ2b1JvcnIxcWo2aDVoTDRpNGtYU2l4QU84Uk5SeFhqb08z?=
 =?utf-8?B?c2UyZzYzWmYyd0xWUGFIb3BjY3Ewak5GYVRzZDY1b3RQQ2x0amV6MEdJRjFH?=
 =?utf-8?B?eC9BUldwL28wc0pEUnZQQnlmY2JDckQ3Z1Y1eUY5aVEvcDJMclVqN2p0NEpZ?=
 =?utf-8?B?bm5GTkdmM3h1ZHdFUUlRRjZ0Y2RCMzRBNDhMWTVxdThYalIwT0QxOVp1dmNk?=
 =?utf-8?B?M0NUU1VQcmhyMVdEakNtYzI0alFveVFyM1RHbDFxbXRyVCtjNkJoc0s3SFJ4?=
 =?utf-8?B?LzBZS0tlN3F6c0pqcWkxd29lSWF6dk1JMVJ4UHlSMXRFQ0RjaUptSkRPaE1F?=
 =?utf-8?B?aExQSDNJSkxhOHB6UWFkRk9TZ2FSYVlMWnN3cVMyZjhGZDlDUzlTQzgzWUN6?=
 =?utf-8?B?WS9wNUp2OVJnMHdZK3AveHphbDlHMUhEa1Y0c29CNUhqMmk0anNrSzgwSFZZ?=
 =?utf-8?Q?KxlyGuCskRaXhcJDJtqdTnzko?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237c7eb4-38e0-4038-aea8-08da696a37d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 09:36:55.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8ryvRgzOxsYtjtrEAYuRQ+SkawC9UL9C+Nph/goC2608rRd4BW/7qWv+ckt1OMy7Vuk0cK8WekMTDlh7DpNLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5679

On 06.07.2022 23:04, Daniel P. Smith wrote:
> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
> introduced for when the ability of parsing DTB files is needed by a capability
> such as hyperlaunch.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>  xen/arch/arm/bootfdt.c        | 115 +----------------------------
>  xen/common/Kconfig            |   4 ++
>  xen/common/Makefile           |   3 +-
>  xen/common/fdt.c              | 131 ++++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h |  50 +------------
>  xen/include/xen/fdt.h         |  79 ++++++++++++++++++++
>  6 files changed, 218 insertions(+), 164 deletions(-)
>  create mode 100644 xen/common/fdt.c
>  create mode 100644 xen/include/xen/fdt.h

I think this wants to be accompanied by an update to ./MAINTAINERS,
so maintainership doesn't silently transition to THE REST.

I further think that the moved code would want to have style adjusted
to match present guidelines - I've noticed a number of u<N> uses which
should be uint<N>_t. I didn't look closely to see whether other style
violations are also retained in the moved code.

Jan

