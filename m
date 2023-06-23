Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD973B0DD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 08:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554224.865299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCaVc-0006TM-Uy; Fri, 23 Jun 2023 06:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554224.865299; Fri, 23 Jun 2023 06:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCaVc-0006Ql-R7; Fri, 23 Jun 2023 06:43:04 +0000
Received: by outflank-mailman (input) for mailman id 554224;
 Fri, 23 Jun 2023 06:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCaVa-0006Qf-NC
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 06:43:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32331236-1191-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 08:43:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6906.eurprd04.prod.outlook.com (2603:10a6:10:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 06:42:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 06:42:31 +0000
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
X-Inumbo-ID: 32331236-1191-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fETtDrOaTCi52Q5FMmqSBqzGfamqVllOdy2H8Ay9XAxjRTPmCsOm2b86wgtcBA+spUHGWqJoY7TOPblDld3eUL+OD/t/HVYuEXCpAzXq0y5qPqCTtplbwbTPVICrdHgNNMRuOLEDlBobvT3RlNriAoH3DVicFcBHF4K3oI4jFaRXA+7AhaJw3BYutys7ey7brNawh9OkU9l4YxaxXbeh4Lzr12puEzpUKZeuQ3r1lzQ/W/ecJpsyDfo1WJxQD31dxNKLt1WrwUlkvrZjJ60wFJE+Q1jNdKTl9nZRALcD49l1ymKfms1L6MhYcbcRJpB/JtfpliGKiIAI/TibGCgQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xUGSYuSE8R7DXAP86nHeFIYaI6Jg5t0+8s7a8FWz28=;
 b=OhWCpqeIJfWvNT8pIkMcxr5mQpNPtHMzvj9ubjfNHoe013wkzcpBQ+nW+DZmiZfR5XRGGkTEVBQdKJCnqGvwyA8exB3JMc/e6VAVFXHPTNpcD8xVrqsYG8ajt2ufXb4ogS2lzE+snFhgfr6nUzUT3wi3Zrp2pDSWSDfzJXD4TRA7ZMghx0ItvfEt4Vx9lknQaCZAGGmNGf9rDYAzr7xYoFFnw3X5KepYrve0dKVZzj/ULGTJkW2kom7487CtPU9rSQaDVaNQvdj3Wk5K1G6RFfm/ofCB3znctazQwnGWr2ssHfBMPuNfDlSPfhUuq8rrbfd+X29qwRuZ17C4LIjiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xUGSYuSE8R7DXAP86nHeFIYaI6Jg5t0+8s7a8FWz28=;
 b=WPUXOGGRC/k7u4Elc8slzjpN/XGqZ+Rs5Q9d0ujWnyqp9+qj/kXEY0N3x3CqyslaC71oASmaZtwrnjWZVFMEZ/mJa0G7mT5JhAJBr0aiBwhPx3Uhoa/z6Erc0+76yMuaybr6nkYshShmPHJFNpglj4LCaNsirKvSCH585goudhSmQ+nrz8Dl+WiqjgJpaD/p57FbEVoOJZ2Ov6Ltov3fD3MTtN/y2ezPg8RMTRwmn4tnqE5X8fvcg89lniD5OVQkmC4iHRoPKEjLyLCjWeGkZPdmvpiy6hwqvuIFvIO3rytdhC2Zam5seBXLgJleJ0GTCu5g8oS9UmqKB4pguf694g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <497fae66-a67c-cd0c-c198-5e54f8ba180a@suse.com>
Date: Fri, 23 Jun 2023 08:42:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/3] Early serial on Power
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1687466822.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: fe589b49-b480-40a0-4c8b-08db73b50513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QUJm+0JVZEzs0LK5b6h2QslexRQdL3jiWNu10JY45nY+dNJ6F8btq1DmMEgrFOOxw6mmDYA7rePj33mBRK0psWqapBQfdoGlYyNWkrqEgl9NEkZqiTFobjxlJzedCAIrWkMLejckutJdyZbJ0ryUGoJh9APwDzibjCFOAx5HXnizSGv2D0AZ9nzr/uzV9pDaVskD4n8Od4Cv7egvi8+vAw9euT8ee4vgbwAp8BmmpjY2iHTO0GzEh4o0keSIGTXWVPymIQA7XnHJSO5VCYO6yHIjaBXrMLYvXc1Tc3TPJKGCA/oBwrw3OTWRi7eLJzsxqDpZEPMVUuwkPWaYozUXnu9PYjGY3uZ4ADhY7C112xMZJzD9rZ87sYKJE2XeboETJxJnPF4i8FX0DvLfCI7IFcI6aPTLGet2Ltmzd/uL87xb/U0X3LxBAFyYYo7GOsdDOjZGp20dGMe7PcBwFClCEi8nho/0qA5exruBKWa65Ri1n1fyZhJyVqLwtBjNmV6NNW+mFTI+JHu0zzDi6s1r1Z9T1cy1mS8CP1hfiAOdFr6/4nfgvzuk9+W0Y3+IFGY6lMwviBnJrAMrgianYr0XA0d/J6RDm3gdV8ZgHRUItIS0jr9vJEcw+4fkzrx4DolkRzf1uTZq8r6qsSRigx7RGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(38100700002)(36756003)(6486002)(478600001)(41300700001)(66946007)(4326008)(6916009)(66476007)(5660300002)(316002)(66556008)(2906002)(8936002)(8676002)(54906003)(83380400001)(2616005)(6512007)(26005)(186003)(6506007)(53546011)(31696002)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEhoSHJzYlZXeWYvVE5WRVhEUUF6SW5yVVFpaHhsa2hMOXdhSnRHdDUydzF6?=
 =?utf-8?B?RURlZlVGMzQxKzNRdWRoalE1ZGlWeGNjN01ndkV5aUoycjFGbXNmWVFxbTk2?=
 =?utf-8?B?OU5qQmR5TndjcE5aL1NON0hWSUhxQksyQVN0aXdtVEtBTjNPK2thWkorUkxH?=
 =?utf-8?B?SGVsK0h0TU15T051MnRuUDhwOGcyYXoycVpSNE5lNjRpd0JUSUZldWFFOVJq?=
 =?utf-8?B?eDRVZ0NoVVJ3c1VuY3RMTVRZRmR1UWFQZityTXFFU2RkREh5eVJkR3E1Zzcw?=
 =?utf-8?B?dDJMS05WOEE2ZFVPdVBnQkZhM3Q2bmJaTitLT1haeGxaU1p6blcwWnRpSlZr?=
 =?utf-8?B?NEY3c2tVdVJjWXdNaVptaitUN3hvV1ZpaTV2OFd4RnBDa2Q3QVYxMGVrak1Q?=
 =?utf-8?B?ZnhlNnVIWVR1emRWWXhHYnFNSHdBVUJXTnk4K0hIb3k2RDJMZi9LbWl0bnZD?=
 =?utf-8?B?V1d5Q0d1eWNkMHZLWjJlcmp5Wk1UWDZ1aHg5Vit1QVBGSjVYUG1YZVlITGVs?=
 =?utf-8?B?SEJsQUdkQ2ozbHVnTlVkTlgyTG1rSjdGZEwxNUpUaDdjUnZhaitUWUJjTjI0?=
 =?utf-8?B?aTJCamdtVFh0TDkwcUM5b1o0aEh3WU5rR1FqZlVZaVVSeUJsMTZFRnpBNzM5?=
 =?utf-8?B?Sk5HVVJTc2tRcDNhQzNqUjYzVG5JT1RmNm9aZFJGUVk3R1o0b214ODljSXBz?=
 =?utf-8?B?djdpUFVhZTZtL08zbkNYakxOWjNOeXBvNjRla0pWa2tNcWdvSzI2U1dJZ25I?=
 =?utf-8?B?ZXpZYnJnV2lvbVkybHkvUGFUSlhDR2JPelBIZXU1aTN1Y0srSVZaTGxCN1Ez?=
 =?utf-8?B?WE9YRUsvWGFrVWt4WHgvQ05tNjlBRlRmaVh0SHZRbnQ3N2oxbzZRRXFRdGdW?=
 =?utf-8?B?VUcxZHRjazRjYkFOM2VhRDZpVWtRVkVrWEVjVmEyMGNwMXlPZllxdzlkRUpG?=
 =?utf-8?B?L1dTdmY3dU1YVHVVbXNOUkRmS1ZYaE9neHRQWWZZOWFwcWRZdG5ZZ00rTVVU?=
 =?utf-8?B?WDUxV251alZCRitsVldLUzgrMGtGZGQvdVNXb0ZTT3pKVzcrS3hJRFJyaVJk?=
 =?utf-8?B?eDRYRmRvOTR4WmRUWXRjc0RyblZQZ1Mwa05xTHhpb2FRaFlBSzB1eHVycjUw?=
 =?utf-8?B?WUhycnp0dldlb2dyaWpjb3ZYdFZrZmlldXVkT2JRRG00OWQxWHE1UVNsNG0v?=
 =?utf-8?B?cTlUT3dPbGJGNk9iL1FIZGdGUXlQby9ya080aFBhN3d0Mlo5MEwrcXNKbEZB?=
 =?utf-8?B?dGFVb0FKaXA3b2FiMm5SdXZ0QUgvajh2V0ViK3l1eFpkajM2RjlxVTZLakJ3?=
 =?utf-8?B?U2d4cElENytBa1BQbVNKSmR0dURmbWltRWpURkxucWMvSUxRUHc3a3ZsWlZZ?=
 =?utf-8?B?bkJJQ1VSMXo5cG9kVHUvNDJYTW9yRjJWMlRqQUhRS3EzTUNzRERRNjY3UFZU?=
 =?utf-8?B?SXRxbGpqR2dCb0hMZllDY0xpMEMxZWI5OTBwWnhaaU1ZRXZWUTlSeDV1ekdX?=
 =?utf-8?B?VVQxeWs1MlpoK3o1RkM1NzJacXR3TzRmQjFFYjVlODNmeEY2SXF3cU45TUww?=
 =?utf-8?B?ZnJVRDMyTTA2MDJiLzZBYXVxOSswMXlhWUI4RFI1WG42RDFmcTFVdkt1eHp3?=
 =?utf-8?B?RU1UUTVPN3E1Qk5xYzhaaFQzQ25xSVJNRGxxN3k3MGFralU3MUt2aC83SThz?=
 =?utf-8?B?ai8vdzc3RVlKaXg0b0NLZ0R5a2c1NGYxaTNveTkzKzhUb0N4bXJXMmpET0NB?=
 =?utf-8?B?Tk5BbDBvaDlNTUxETEpBNnM5d2NieEtPeWg0dFJsWmtMWDZvc1VNYVJYVEt1?=
 =?utf-8?B?TUNZNURxVXp3Y1ZUK2U0amNNeS9HWGhlM2N4QTA1YmdHV3RTcHBRQnRBaUxX?=
 =?utf-8?B?UDh4U2dwZFlLb3JpOXdPUS9scllBZERHeUR5UTh3Q0NNUWZQbXVON3VxSHJI?=
 =?utf-8?B?RGtCQUFnSkc3UFo4Nit3N3o3MlYxQkIzYy9TOXNFOVQydHlUNno5OUZuSWgw?=
 =?utf-8?B?b0Y0WmVMaVJRb0lZUEc2alUzbzFWM00vT1c3cmFCcHlSRzVQb1RsK3Fjem1v?=
 =?utf-8?B?cVhhUk9Cd0EwMGJqcEVuQUlsa25EWDZTTFhTM2VCM3JWUUZUSUpFbGlVd0hV?=
 =?utf-8?Q?U96PzUXgWDdvYI0MNFStIje7Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe589b49-b480-40a0-4c8b-08db73b50513
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 06:42:31.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXOvOBO7lD9pTQPrJlFJKDJrjwVC1zXiLOKX0V2iyPv17achZbHqDzPJ0e7f77/AwsDH1mje9LnEp07ytiUL9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6906

On 22.06.2023 22:57, Shawn Anastasio wrote:
> Changes in v2:
>   - Split main patch into two - one for basic C environment setup and
>     one for serial
>   - Mark OpenFirmware functions and early_printk functions as __init and
>     change boot-of.o to boot-of.init.o in Makefile
>   - Change <xen/lib.h> include to <xen/stdarg.h> and drop skeleton
>     headers that are no longer necessary for build as a result

What is this about? There's no change to non-ppc files here
according to ...

>  automation/gitlab-ci/test.yaml           |  20 ++++
>  automation/scripts/qemu-smoke-ppc64le.sh |  27 +++++
>  xen/arch/ppc/Kconfig.debug               |   5 +
>  xen/arch/ppc/Makefile                    |   3 +
>  xen/arch/ppc/boot-of.c                   | 100 +++++++++++++++++
>  xen/arch/ppc/configs/ppc64_defconfig     |   1 +
>  xen/arch/ppc/early_printk.c              |  28 +++++
>  xen/arch/ppc/include/asm/asm-defns.h     |  53 +++++++++
>  xen/arch/ppc/include/asm/boot.h          |  23 ++++
>  xen/arch/ppc/include/asm/byteorder.h     |  12 ++
>  xen/arch/ppc/include/asm/early_printk.h  |  15 +++
>  xen/arch/ppc/include/asm/msr.h           |  51 +++++++++
>  xen/arch/ppc/include/asm/processor.h     | 136 +++++++++++++++++++++++
>  xen/arch/ppc/include/asm/types.h         |  21 ++++
>  xen/arch/ppc/ppc64/Makefile              |   1 +
>  xen/arch/ppc/ppc64/asm-offsets.c         |  55 +++++++++
>  xen/arch/ppc/ppc64/head.S                |  55 +++++----
>  xen/arch/ppc/ppc64/of-call.S             |  83 ++++++++++++++
>  xen/arch/ppc/setup.c                     |  28 +++++
>  19 files changed, 697 insertions(+), 20 deletions(-)

... this. Plus lib.h already includes stdarg.h.

Jan

