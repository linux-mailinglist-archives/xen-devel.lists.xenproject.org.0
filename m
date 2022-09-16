Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7B5BA699
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 08:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407789.650405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4X4-00021h-Sm; Fri, 16 Sep 2022 06:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407789.650405; Fri, 16 Sep 2022 06:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4X4-0001zs-Pa; Fri, 16 Sep 2022 06:08:58 +0000
Received: by outflank-mailman (input) for mailman id 407789;
 Fri, 16 Sep 2022 06:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCzl=ZT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oZ4X3-0001zm-Jv
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 06:08:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c08e012-3586-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 08:08:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 06:08:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 06:08:53 +0000
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
X-Inumbo-ID: 0c08e012-3586-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGdBU4vqOs41jEUSPNhHcutp+2VTFAB6spQSAzXiuoOuYPGNt5b6A9Hx9wXMKjU7k3+PlFWcRWLcVTtaLKnDOrwy3SMkPPrnuO3I6wYUEyWDGz0FvxKe0F89ujMvJxs+vUmWeWCOP9u5w1ktUvzfBv2BMkYAOUwfp5wqnYOiboqz++ZTIQNcUY8ztVFS8tL2hO5xbwsjbkBZT1VsTav0yHlbp31oC+vaA6KeIXvBpRq3hbAQYaAuxJo0Qdkmi4dUtEvNQJJmpHzRGmLf4rJwbT5vaJjosJw9CDcLmnnO9rGxFTOYFwxRR9pjiMDMCGXuBM+GaCrPN2Mqf1/qQjoFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUvv/nHbW3/gUK+CygDDfpL/8c04TM3bWPa4V5IJR8w=;
 b=R4NRhYZ6lSrM3MkPZH15X3n9PwXFzpxabsdJGDL260ltrKdZkuuJjWeemF5letHWC2TZvkO862ZHokDBp2TE07gsV9LcGijrjbFyxbZVGS50kxpz8Vf+JmLCYS6nWIVk/LZ08Mg0HCgcIvNV9vsoIAEstylNAMoy4qNyshq5m8r0xUyfiHveTrVzFPUt1TvCxAbUPN7Mh8NRCB6CYJTyaR+S7WdQVbKL0vrjT3pL7AfwcsQrToFs8ROKir5z1za6UN0rkoJyig3oLm1zBqPpSJnr2PPZT5fdkQPEKFNLuNG0IottysGm7qarUb//vDxhJ0OaHz9cenVvnZnGamtMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUvv/nHbW3/gUK+CygDDfpL/8c04TM3bWPa4V5IJR8w=;
 b=V0oHq1sXUtYaAexSve7k8IJxVVPOGedqQcoTmdOFHwhTwgGWLYVxOnrfjZH8ZWdhzbde6f5nvr17bF7KbLw8SRbXjmi6FeqTNGT3Sj/OqmWsmoxZR89sX3x/mB0fLh7zQdED0d+rqiO/dMZcSs2CRoOotyD3VxbPfsThg4Mvmk6S8RuweVRNNAG3KkM+InznBtEW0ahtvvfrROZnhsf8yEtgp6sc86JwaPM39/fzaPfUt6o740TQZTwm/sIDTirh/4UUKWdAw0LIuNZu9RDX84qYl9XGXXonxaUFqxkUm2ybDs2kluMREggPEp69yLGhedBO1TtIczu8rLAn53iAIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a83ac46b-3db8-7770-6f24-041de84a3392@suse.com>
Date: Fri, 16 Sep 2022 08:08:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] MAINTAINERS: change my email
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Robbie VanVossen <robert.vanvossen@dornerworks.com>,
 xen-devel@dornerworks.com, Stewart Hildebrand <stewart@stew.dk>,
 xen-devel@lists.xenproject.org
References: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 262d954b-81d4-48f1-dc66-08da97a9eeae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4h5EF6ee3Do0Z43QXD+8vri0V2gd1CBxAI6DNnCVJa2MEMoUKU8t7c8KPegIF9n8HRAAgwPMo+Id7BPzgECXUo+RVlzUYFesakdTIjX2U4htwLYf1aMUZxsEnd5s+CqrwcNS4PNCiGkyeP12z9j2FKxnMtCZEJ+gt+3ibyAEV+UuOS3vAbrA9BkRkGnCdFMGy7eYLKstvQmJ+8Ypx5wzkeFgZrg0SxYoq4B3Vp92mnk6BepYscAykIPKWPPYTCqmSTP4Y81QCSC0UVXWdu7eniICSQ3LBL+jLK85jF9+EP4rjQDOvLOE+zEXLdN4PYyJwWN+l03m9hUoUK0813fmBLvoCiP/jXnpVED0OjpfBdx1tdUExeLzTmFOzA3h0yUBwyKwb8yqkdHPHcsj4F5IYZhwrvli3Y2IXDtqIMmE3udN1iVjSws6vmoqLtjxH/RMSrFJSvXThLZFTZqIi7eTu41CvEBuLGKpWsJw47t8L6os37zB0GDW78jXxuXU7N7Zx/pQDYlPfQ9DebMOOgPz9TMJee2jvtVhM6+chqNPTmFhei55YjLPmGeC/G11kZ9fY3cbMb99P7O2uWww2OwrgMNf7Ukm9wZ1dd8lsOAoWIRgHPtYpNxbImdfG9E4dZTbQ5r8yBeEqKpBW6RzJFK/f35R6yQMX7xA1P1rRRLbUE/4Nz8YvnBTmxHL6EneoLMd3pQjF9e5vZJFY/FskXQJ08Q0cJmqag7Th242IEEN6RAnJUMb6bN3flvjo0EfG0bSHKRDUWIxStPF9n9O2VGEqfAcj4ds3A4izYtlUYP8QYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(6506007)(31686004)(53546011)(7416002)(31696002)(41300700001)(4326008)(66556008)(66476007)(66946007)(2616005)(2906002)(86362001)(110136005)(6512007)(54906003)(26005)(316002)(83380400001)(8936002)(36756003)(186003)(5660300002)(38100700002)(8676002)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDFkYkZ6S1lSVnA3ZllRUnpYM09JVUZFVy9IMzI1aUhsRGNQbGZyVmMrU0lB?=
 =?utf-8?B?bUlWV2N1T2crVkJXT2xmcXBvNkRVS0lWWW0reUZMVlFreDlMRjBJdkFuNHFx?=
 =?utf-8?B?c3BxcUZzeXgzeHJlTmlubmp0VmlrWVhwSFdCOWlwdlQzdmpMZW90U0tTTUxG?=
 =?utf-8?B?VDVCaWI3OWx4TXp2RXg0dG1wRVZiTlNHV3FYTUVxaHE2bUpCSUpSVVU0cGNj?=
 =?utf-8?B?TVl1eGl6VUhmdEtlWjJBNzhTSFJHT3lEbUlVZE8zeFFhaXJwRExGMXI2N2RQ?=
 =?utf-8?B?b0ozSGMvZlp6aENZR0FKbmdJTU5WNEMvSDRFVXVFOGF3QVRYbTcvR0VOcG1T?=
 =?utf-8?B?OWlxeTZBU2w2bWgrZGZMYkEzZnk1cUg3dEUwWWFQSHBzSmhmSG1oRVJidnRa?=
 =?utf-8?B?RGhLVzJwUFd5L0ZtVXM5MlpaSUpZSnhPbkNQbGtnUVVxK1RMS1hYZGpLb1FF?=
 =?utf-8?B?Uythak0zVUd0L3FrUFFhbkIwcVNVL1grS1JBQXo5QnhLQis2SEhhelFRNlFl?=
 =?utf-8?B?VDkvSlg1NXpUYWFJMHZpQVgvYnlSeXY4eklVTTJhNlExVWI2NnBaMC9SMTlL?=
 =?utf-8?B?WUh2aDR4a0dWa0xjTi9wVFpiTmd0UVBkS0p2MWtLTGVuZlZzOXcwZUFha1JG?=
 =?utf-8?B?Z2dyT1FDZG41RHNNcnhZUGo5Y2JmaW8rN3U5OC8rakt4RnBPRUdvRjNTbHlQ?=
 =?utf-8?B?RWNiV1ZUdmxXVlpXVzA0bzcvN2d3MERTSnpJeDE3RDR3c0U0aUt1eXdScUxR?=
 =?utf-8?B?N0s5WHZFRVF3NFgzV0JiSFNsc3lXQ2tsemFoVEQ3bFR4aHlWenVhcUgwYVFo?=
 =?utf-8?B?Y3FUYTViOUJucXdhMFJRYWt1QzFYT1ZUSktPN0xlSmo2TEhlcmxOZFRHWUUw?=
 =?utf-8?B?c2kzMm5qTlcxcFluTnhMR3JZVy9tZVY5cXZGaHZLN1VCbE9BQnBob1RkQ0xq?=
 =?utf-8?B?bzFIWHRpdmoyQS9LRUJOQzVxdTllbjdIYmVqckNKYW5JWnFpd0kweDZqTU1a?=
 =?utf-8?B?bUI1Y1UvU0huSWZBTDhkUndrMTliUGgyckRFemVXZjZ1SUUwamR5MU02MWFX?=
 =?utf-8?B?dlZmaUJWNU53NHdXWVU5aFRRTEdCR1J5Q25kdFhEQnQ1OVFZNFlOOHdSbjBk?=
 =?utf-8?B?b3poenpIZUpCVTN2NDA3RkN4cFQyWFhpT1RzOGMrbWhFVXc2YWdkb3JUNW50?=
 =?utf-8?B?VnBZZGt3RkZCL256aHVLTkZ0VE5TSHpzbEZndzdNM0c5M1JkQkc0ekpCU1Nw?=
 =?utf-8?B?TUJ1SnFESmdBZXpUMXM0VERudFZPMHRnYWgwU25lNnljVlFJc0JRdUVBTjlT?=
 =?utf-8?B?SGpWdTRxU1FoV1AvaXhidS94bUo2V1NOSjB5ekJwWWZVV242T1ZSWjJ4TXRO?=
 =?utf-8?B?U0I2QUsxQ3hlVjd1azk2WDlDSFZhUUxBWTNOZ0ZoOVljTTh3czA1R0RVUkl3?=
 =?utf-8?B?RFRGcFhRbS9QTHlpWFZFaW9aZlpRU0NZODdiWUNhc1lHZVJjN2FHVG1BTXlT?=
 =?utf-8?B?TUlwKzdiYUdYK3hpYlIwUmIvV2JLMDlEMlBXZWdJVkF3Qm9lNDB0cXJ6N3FY?=
 =?utf-8?B?d1hVcU9XTXlxVzZ3Y0NNd2tnYkZZaDNDZVVtSFU5STN3ZTlucyt1T01kREpy?=
 =?utf-8?B?Q0ZRYVBxaUd5blI0UEZYbVJJQU8zVmhoZUFBdkVIdzdOY0pGZUxYNjY3RUZU?=
 =?utf-8?B?NGhodlZDRnEvb25wTHlEaDhWRC92QlZXQzBJS1lSS3h3KzBoaU15S2U5Z2t4?=
 =?utf-8?B?bEcyYmt2VkhhTVVVcmZSdGswZjZySHM4TmlHSTgxTyswcFE0VXBreXVjUVZw?=
 =?utf-8?B?ODlqckpPYnVjWnNHRmtZVTFLTThucVlqZzVURkZDVHowL1dWN1JvbHNjQnFp?=
 =?utf-8?B?R2V5bmp6alBVZjRIcGowWXNKaUFuRFdOUkJWYUR5M3dBZXd6eTFzL1l1cW8x?=
 =?utf-8?B?NXhsc3hWbjFSdzhXZkEzYXlVV3lKa254UUp6dFlaMUVqdWZ5cURab3J1bndX?=
 =?utf-8?B?K1JrdThMV0JGMnpxOEhtd0ZKbURwcUJUaUJ5V2RNSWpXaWdDUHU1azFYSndW?=
 =?utf-8?B?TnRwaWxYYnN6Ui9GMFhvQVBlWnVpUEdyMktIWldQMU5IcDBPY3VPT2NxOENM?=
 =?utf-8?Q?p9Jf50paadlaxWJQMNd/8YSHm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 262d954b-81d4-48f1-dc66-08da97a9eeae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 06:08:53.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /i7DfS162Jwdm5/29E2mkm4NiEi9t4asuVJTtO8nLb9lDoCwFNLqnTx3jyDXD2Tqtqp7S/SCV9QEQt7V40wFtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695

On 15.09.2022 21:30, Stewart Hildebrand wrote:
> I am departing DornerWorks. I will still be working with Xen in my next
> role, and I still have an interest in maintaining the ARINC 653
> scheduler, so change to my personal email address. Also change status to
> Maintained.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e12c499a28..f674b5f7ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -221,8 +221,8 @@ F:	xen/include/xen/argo.h
>  F:	xen/common/argo.c
>  
>  ARINC653 SCHEDULER
> -M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> -S:	Supported
> +M:	Stewart Hildebrand <stewart@stew.dk>
> +S:	Maintained
>  L:	xen-devel@dornerworks.com
>  F:	xen/common/sched/arinc653.c
>  F:	tools/libs/ctrl/xc_arinc653.c

If it was just for the email change, I would have said it can go in without
release manager approval. But the support level change I think wants a
release ack at this point. Just to not leave the question unasked: There's
no interest within DornerWorks to have someone else be (co)maintainer of
this code?

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

