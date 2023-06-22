Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3FF7399BA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553380.863894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFhf-0000Ky-Bm; Thu, 22 Jun 2023 08:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553380.863894; Thu, 22 Jun 2023 08:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFhf-0000Iq-7a; Thu, 22 Jun 2023 08:30:07 +0000
Received: by outflank-mailman (input) for mailman id 553380;
 Thu, 22 Jun 2023 08:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCFhd-0000DZ-VK
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:30:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb386070-10d6-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:30:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8728.eurprd04.prod.outlook.com (2603:10a6:10:2df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 08:30:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 08:30:00 +0000
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
X-Inumbo-ID: fb386070-10d6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXtvw5njzgq2EwIIHnN3RZtFHWImf4TU/QbvkhdEUfGUBnUWd49jjdh6+rumuiW9aQ/gpZPn5F7UlX2lLru/LnGpdpMgn5VQ+46ewOpBZzz63wJ9bZKLZ0t5VVjqCyb+UC60uawZe3+as9+SqzFCc1dDN2Lq0IJnBsec5wv41QqUHMWbhA/k4hM9eAAyUvab/wv54+NRj+sI3xma1pcQpTZoC7P7obXs/7dGlJKawLr4NZbBYYVIKSYbeLrXMiEzuEQvfYXIycur51xKaI2CQLly2duj6ImvDzlSyogZ9QQtVUchAeUg6+TLVDKlkVm83MbzK4U4pMUROoufzD61Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5MVyD+CkEpVqlhJmAvRY/MwIAF4iLpc+3NoABci4s0=;
 b=SYSaQuDPJ7v3A4EtugCh4VvZ4lSwGrDtfSsWyHSL8DWywljiFufQxT6+fuEEZFfLb2vmpCc5MBwaZW4CtTS50UodsSWdkhnIHrhIeUK50n8jnLhV4Q+Rzxy28QSKnW8MIxNcbTblmP1OG81Oj3obWRGMOZLCn6IWhKWVpEGJvzA81uEfSBokiB7Yv7c7uEMIK5e2FZVNpZ9y/0C6UmopMlAgLbsj03P+ROGxP+FxmzZPkuWwU5YIFwfo5/j0Grb41y1okj0Zjs+EayMhhF6AZm+qSi7lS5HQVtPHP4ctiDPeK0vUnPgpWb4mYErj3OLdxdb80htUAQze9XBO5fZ4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5MVyD+CkEpVqlhJmAvRY/MwIAF4iLpc+3NoABci4s0=;
 b=WTqk8S7WlLV4DcG1DtlWj3w9eS4fkYl46ouwYrC+SGLAgyyi58Dk05lLN3KuS2gigKaAtboMecif4+k6FKFqKRz9tzvXTBPFBxye/IfHDKjzQ3o8HJO+AZgxLniVLj2efc8fftNLRlZ8WK+LsWTFwqxnt6gJt4tNDKj/j8svgjIhcyIZpgS6GNg4H5sITqEY5YSqlpuBcbF+wTQXs+PWk6mjzB8hDZh1ENMxRDmeA3JwB+suKJ5FGag3SqEFe40eRx6Ye/2yN2B/biHSUJfl5T2i6fOcEuZfSdkPcdLhsxnre70NnRYIcaJPxd8JNQFnjEMEfjKCrQsZ2WPH5fcSyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7e6ea8f-1d01-00dc-0796-b102c6f153b3@suse.com>
Date: Thu, 22 Jun 2023 10:29:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] xen/types: Drop #ifdefary for __{SIZE,PTRDIFF}_TYPE__
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230621211200.4132989-1-andrew.cooper3@citrix.com>
 <20230621211200.4132989-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230621211200.4132989-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 6faceec4-529d-495f-efa6-08db72fadeaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O5kmHsYn+7AlYTcQW6ErXX3ESYurx3ZigXSlsP68nXBe2MRQmpkNAI5ZEkQO44rNb0CXpD1LECUACmkjsU6imKCfBpCB0IZtnqtOdvH/UAeiOzAJzT+1XmlbbzCfqWtXnPOjD57r5zIRZvgBzpJwKG8CeYs87DPKV/XIxcBw9ugSdsqzROnjmR1klBh+96+YfCWPTN/alMynQPfoTkBhGfcS450XXEY9oRKiPBTWq2EJAP2TJXR7UM/DJt6L0fBs8WM2ydbveXR1LJ75+WfUX45SPBVsR+uiCBXopkjaWPjve3LySRx+zLlrYTKwFIijTTAqiarbeCUBOtOxmEDooce31q131pGVZnEi14Qx/jRZ9sA/xiFaH+6h+v12YQAmeKTIobFb3rXTbX76b3WAAsE4qYRwujiIaPVfT6xG5T+hZuCF1qRtWY6aMx06WCFy5x7euJQtGVs2D39xgs3Nmht8CPCyTu0j9KxYOBisPO9jcgv1ydHayvEc+TyE22ZbZ3VbfJv0Ot1aiJhn6JW0Vn7WvYNCLIfDN7p2yDO7I70xuy8HnVDI6rubVrY0ISxBOgLIQT4laRcG2gMiJpNjjcTebc4BfW8eMKfdt7RVIVKqTGq2hKGpNte5ibttyO/o0XH9SwubKiO6hZpb430BsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(8936002)(41300700001)(6486002)(8676002)(2906002)(36756003)(66556008)(558084003)(66476007)(6916009)(54906003)(86362001)(4326008)(31696002)(66946007)(316002)(38100700002)(478600001)(2616005)(5660300002)(7416002)(26005)(6512007)(6506007)(31686004)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHp6WlJVRk1KQSt6VEVEKzhYeDgxZHBpWnpVdmRyQTJWa20xcW82Wk5PUThu?=
 =?utf-8?B?QStETXZkekM4blBCY3oyNG5XMWVCWTBiY3BPR3lob0tMNHRjWWtBNEtHSUtP?=
 =?utf-8?B?ZDdzRm1kZjBpUG1XY2VpaXJKcjZXRE13QXFTQU9ubDNGR0dzL3kxYk5zeFhz?=
 =?utf-8?B?M2cwRGFJUURqa1BYQU5nRFdPRmFiNzNjRFd2ZXBxbnJacmpVc2VPUFhiMVpF?=
 =?utf-8?B?aWp6YVRwYUowdmhkeTlESm1jcHN6ZmVESnpBay9WS0RYTzBqMXl1c095MFhm?=
 =?utf-8?B?QzM0bHU2c0FYVVczR1B5RU9PdkxYV1NadGlvTlFLUDh5WWdMWEZrbzhiSmtG?=
 =?utf-8?B?Ni9aaXdpcjlkRzA5TzNFbkRsdWk4SUpxLzdkM1V5dVNCQmYycXB6QjJia09w?=
 =?utf-8?B?WW5lR0U3VjZVUVN0WDNlODE4TU9abjFraFRMai9EZkh6UWFnMjE0YlhLdy9h?=
 =?utf-8?B?dmNmRmVMTlRPdVlQckJBKzRIUVMxbFpKaEY4Qjhsd1cvSnNqQnNZeHFKT3lN?=
 =?utf-8?B?L1o1NWc3WHFMSEthbUFTTFlQWHZybFJmTXRndElFWmRNSkNNeGFPUEYxY2U0?=
 =?utf-8?B?YmZHOG5FcUROZ09pUXcyQ0NvMTNESjB6REwzUkthdzdjRUJ5aXJhMEZKamd1?=
 =?utf-8?B?dFlTYnZFRStFNXhIaXg4b0QyaXJpOXVqZEdNZXdybUQzd08wc3RmaDhjQUxI?=
 =?utf-8?B?bkpPVXQ4eVYzUVZCTk01L0lPcjJiMFAza2V5VmN2dWxDRWMxUGpWVWZtOGNp?=
 =?utf-8?B?TVpEZzEzUDdGQVg1RXNQR0NXSlhkdW1QbUI4S2lzb2dIQzJLc1BDTHJuYWlC?=
 =?utf-8?B?SVlydXRoTVd2MFF1enVybmhaZldmWDBVQUh0SHBHY3RzZi9YVi9PT1Q4d3kx?=
 =?utf-8?B?YnAvNDl4N2tCVXp4dW5aUFgvTDRKZUE0MVIwTm5SMHBSSFV2NHM0R3hkNjEw?=
 =?utf-8?B?THJ0SDJRQStPc0liNk01ZjJzZUx2ODZQSzdGUVlKakpCcnlCTTJTUFZYdllQ?=
 =?utf-8?B?QUZMZmtSaWhoOFZwWkRHNHVyNnNEVCtNU2ovc3FtcVd4b3BPdXVIRHpEbTJF?=
 =?utf-8?B?d0QyT2JwczYxQ3MrQmNiWFdKMGdDSGF2ZHVrNVUrR092eVU4bCtaTjlIYklQ?=
 =?utf-8?B?MHV5QytqY3ZmSm5YcVlOQ2U4YUV5eGIvRXFKMldtdEh0KzNXTzlPc1VTNXAr?=
 =?utf-8?B?WWtUU08vSXduMjhnYmFMeHovb1B5eHJ6WmNIQVltNUtrcG84ZTBlN0U5N0w1?=
 =?utf-8?B?ZGcya0d4UzNWenF3RkZMVnhjVjhMb215QVNMVnZGcnVHVVEveklNNUVheG1j?=
 =?utf-8?B?NzNKdGh6ZXJSM0xVL1dwbEZKLzEvK0NiQVhabzZhUVBiUmZmVzNRbHFJM2Ru?=
 =?utf-8?B?WHNZUG95VXFCdk01cllVb3p0MFMxVitqb3piUjZsRHdDY2N6czNmOVZYNzVB?=
 =?utf-8?B?UnBHdnEvTCtvbVNuYXZOWE9vTkVCU0J2RnNOc0lmenlTbnM4SXJUckpRbFZY?=
 =?utf-8?B?Zk5EWDYva3IvZWlYRi9IMnJURThjcHZ6VWJXZFNDUzQ5Q1RQZVY5cWZybEJU?=
 =?utf-8?B?V1lpdDlVeHh3bUpUZWJ1NEVCRlM2K2IxblUweFhub3llRzRoU0V6Zll5M1JG?=
 =?utf-8?B?S2Q1VFYvTHgrTkZhUmtWNWJ3Tmh5allTRm56UHVWQmtwU1FxTG1lMnljUlN4?=
 =?utf-8?B?cnVTeTVGWEkzNTg2aUJ6QUdvL3U3T3N6T2tYdy9VVW1pRzU5K1Qyb0lFU0lM?=
 =?utf-8?B?NmlzZUhHNGtld25aUG0rUVZCc21wS3RKSldqQTZIZi9GNVJOdXM5NDROeXdp?=
 =?utf-8?B?QVF1Z05ydGhTUmpNUklVaWxjaTMwSXVBYlNRZHk3Ty83bFQyTTFtN21WSytz?=
 =?utf-8?B?TU16N0dmZG52Wnloa212SVN6b0ZZanBGYjdzYzF6ZG9FYU5oK0ZqRnJBQXhV?=
 =?utf-8?B?Q1JwaHVHSm00RSs5dzJBQTUvVlRMR0VMcEFVTFhMRGZZelZHMlFSc1hPQ1dI?=
 =?utf-8?B?ckxQTDJtRy8yQmJPVVl5dGxuQUNNUkdNQlo5eE8zRC9OZHBOR0xMZnFObHhH?=
 =?utf-8?B?bzRITUdJVXZ3MjQ5VWVZNHhlREw4L1UxWEJROENzTG5naHBZMUd3YlBPV0RX?=
 =?utf-8?Q?iEWeRI6gnJgbK9MFsIjz1gpQi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6faceec4-529d-495f-efa6-08db72fadeaf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:30:00.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3He7Z57z5qSvOq7ZCfkqINPguZ9+T0y4v2GB7dQG1kDBz7eno6GDaMGK/1ypEgAtZkir6Qzh4Gp0DOMp6CReA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8728

On 21.06.2023 23:11, Andrew Cooper wrote:
> All supported compilers have these types.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



