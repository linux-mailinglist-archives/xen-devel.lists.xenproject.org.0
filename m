Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5869586701
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 11:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378641.611943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRxI-0004lD-Qx; Mon, 01 Aug 2022 09:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378641.611943; Mon, 01 Aug 2022 09:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRxI-0004iB-No; Mon, 01 Aug 2022 09:43:20 +0000
Received: by outflank-mailman (input) for mailman id 378641;
 Mon, 01 Aug 2022 09:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIRxG-0004i4-VB
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 09:43:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e99bfce-117e-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 11:43:17 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by HE1PR04MB3049.eurprd04.prod.outlook.com (2603:10a6:7:18::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 09:43:14 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 09:43:14 +0000
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
X-Inumbo-ID: 5e99bfce-117e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYEgg3IObSp3eh5KCZYhonY5BigD7o9qxE0OG/I9war5o03uxGT3z13nFCMVFtSi6/nM/w9fNlVZtutSU3uMXniA5H3MJ3rfY5t+AbQgPtGHaEM5/o7lvclo0uRw8aJnpwQBSICT6iD8HHa6hUXqjCz50H+7urxxnunM0U/kxd8RTL945cQavfHRzSe2umTyFjFK8cpJ0CXLYzNZvJozZNU6UBTG7xkf+t9tLP92YorvleKODH55WwD2lAE+pY1leQ3jXAXa3OyadMNEJ1sBVJZKkGwIdV4cFdDBRB3qx1rkd1fCxwYa1z1xhJajqOBQTyIqxTCzuGHgLV/Mr2SvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWN3AOnBZCyLgcsvBs8szDTGViKin4dR2velo5lyhRM=;
 b=SNOdG4xGz5OnqgZc/emRbHbo9lqwlSFogWAhkgq2/1E5vJ21y3fag+MLmVmKsXMu8Dk7NemYbof5hB2ZSxZH46nYwlUTYl4V4IizmqrU22yRn4uB0IB2JQSiE/iB7isAYxE42gQ8MNQIQyL07a3fvsmyZQjI3QcFLS0O6kPJ9ROu14mdQjM8rbGjaAHkuiV5qQWA3Z1Micv6DEKWZXeoJcsnQPHJY8C+ELqtPHCG1ZS0fPWmX1MuD7bLJjvs4tAhBUukgo8lgi6QOvoaSbHGKrgk5c1ITnhkRD9JxTMH7Imw97+knbacR278WSsOuJIyRyH3kNC2xPYvgwKjdOuW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWN3AOnBZCyLgcsvBs8szDTGViKin4dR2velo5lyhRM=;
 b=HAph96dN3/xXh6P89K3Rk6yBoXI28YPeTCIcOKCaYNK+vvf7K9YwH4CCy5f88YmzthY4zW4PaKrJ7D+JI6XOsCAJW7A08L8ZErlUELRCJhn/QVn5qHSTDhtm8wYi2zInCZpiHrtOTPS7/BW5N03DD5Q02sL9Zvg9ngsHmUy64nKRYRB4VFugT+wWyTknubm2AWwXdFBgUTLJcSQa7gjm7CgRpj/0MNsqwNjAiFRQlydhRsLR+QoK0X/7jYpDkmFas++IQIQKnwlgkE6ZW6ojJPwUWaRcNITNKT+zgaZp83WP2OctuvzWYaPoNe+r0oEj238PCuLs+AqMW+gf8qJk6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7fa1b084-ef9a-976d-ddb1-b07cded96f08@suse.com>
Date: Mon, 1 Aug 2022 11:43:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH 0/X] tools/libxl: XSA-403 follow-up
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20220729132641.21221-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220729132641.21221-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 415d5984-34d9-4876-2da1-08da73a2410c
X-MS-TrafficTypeDiagnostic: HE1PR04MB3049:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rCd4xEvNJ3tjz3M+dqrulV/t8xtho9tdd1iZRIyUDl4mOVd2XOWpHB9pV2Wb+VsSRTowNVSJFtNZpcC9KF3vq/yb5f/Mj8US4DnuZbTd/xTjsl8ti1S7nKgyBYTm+wyq4oRWBfcU393eD05G4zx6nzwHEtSS6rudlV24RQvkMXtMZVw+lBq0V59GXeW0H/LmSPW10vnTkPdK2KC0JtzJqGy4x/+bRuJFk25vwJdedIPoFaV/x23ThZY8+czaJyQFqMoARdvone7i+cvi/LDg8htql891BU3vA5V+wazR/GgD0HWneH+ovRp72pAj8OIFWix9yUE9M0uMprRp2oIq1r6aCldL8SIyiNchU94FwryGLhfZRSbzPx0/Rl2djWQ+PnDHtkeBQ/YqKO72E2GyzU5DyaFNQdfbU0D8nlMf97XNJCp9iYWMmu2H08p4P/o1hyZnKqKTUNEdi7BjDK5Q9Ig0PVrDpA4XoknJFDI7Cm6Ev+9GVKYmD9Z/uvc9JZIlgYskRj1LBALUKU2sIMsOIbcPrQ2aQhy0veYsxBZrEBGfyRNmQucBpR9QnchYTB8aAaC/zY4iV3e7Um1vZ7J3fJ8dCL7JU/EeAh5iphqPu6vb47NpL4xv71fGsHI+rI/ssRylt0JK73ugGU3JRv14KqaEIRK0NV8/uWrEshkk3DqgAaxbfTyVnM6f60VtOVC2PsMBoFP1m+vTKO0sXoPKngK8cZMmvq3YFqqwsdlTEYp4JMAlP1UT4j0Bl0vpLw1kRoZgJScylOIazCXHtkwUvr/k5N6LENa1W9LT9E5iY19XIUd+hRnPEdD8C7/fiv1t4Q8yn4e89ag0HE5HUyjCTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(396003)(366004)(346002)(478600001)(186003)(8936002)(6512007)(2616005)(6486002)(26005)(53546011)(41300700001)(2906002)(5660300002)(6506007)(4744005)(36756003)(38100700002)(316002)(31686004)(31696002)(54906003)(6916009)(86362001)(8676002)(66946007)(66476007)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1poVHIzR0tXdzZVcGpUNytFeC81SnoyVXJFMWd5anpWTENlZ1ZkaDRhT29P?=
 =?utf-8?B?UFhjWU0xN3B2eURRbnRySGp0SHB5eGR3eTNwVG51RXFWbTFJWFRkU25kMkJI?=
 =?utf-8?B?bXRId08yeWZ0RE9mVnRWK3RxdlgyeVBwWG9LWXNEelQvc3RmbTNGeFRRREZm?=
 =?utf-8?B?Z1AySkZ3UWo5TW0rdGwxd2NzS0xOYU53YTRlSFQwN3k2c2lGT3VIWU1lZzlZ?=
 =?utf-8?B?Q1dCYWNtYnNteStNSGVLdW9VWklVRkFzb3FLR0tOQjRNeFMvZWQ1SEJZVDhC?=
 =?utf-8?B?aFd2cC9WcnJJK3NwY200TnpGQ2J2MUdkNW9oajQ1TVpibXorMHc0QUhGQUIw?=
 =?utf-8?B?VWxTTmU5ZVQ2U0FZTTlmaDJRWHFuRkhJZkZBTWlXM1pFeU0rUU1ZRVpNWlhk?=
 =?utf-8?B?OVdrSmpudG52bGZ1emtZbGJnU1BQZ1NJaE1heFVvcnlwa00xbmRuVUM1b25h?=
 =?utf-8?B?QWwyNEMvdXZjS0JxSlZXcmlHd0lJdE11amdjVTlSeUdGa3lXeDRRNVdsMjZY?=
 =?utf-8?B?NmVKSTZiQTc4Q3dsSVp0NnJRc0JjdlQ5U1dKUTNvL1Uwc3hXVExRODFzTFJ4?=
 =?utf-8?B?ZEs5bGwxM2kvT3hneE9kUDhtaTdYdStycGRHdit3ZG9VMWhtS2RJeFBscG9Z?=
 =?utf-8?B?TENab3RkSGRoTGZzYTJEMWsxV1M0UzluNVRFODlzbnhzRUlDOVhSajd1K2pq?=
 =?utf-8?B?TDd2ZkJLcllKT0phajdhQWl4UnJZdlBwZEZGN1RjMWM3OTluQ1JtZjIxS0Uw?=
 =?utf-8?B?MUg5U1RtSXJVZG81WTFwNldQQy9BVDc4c1pwVDk2Mzljc3FJWTVqSHpPZEhv?=
 =?utf-8?B?aTJXZ25jZzg2MlVhK2Z0Y1BOaVhqUUdBNzB3RThmMlllNHhOb3laNEdLeDEr?=
 =?utf-8?B?NExXb2E5T21pajNrNTJZaWF2QW4wTWcyaFJZeXNwSUIyRTdBU1VoMC90RVZv?=
 =?utf-8?B?M2doWHBJelpia2dPWUdBNjhYQndBa3JXUm1ZbFNFa2lYbkM2QXZUYnFsNS9n?=
 =?utf-8?B?U0NyTXFnUmE1V1BtU29OeTdLcklEVnMvWE5HSEF5M1YwNTMyYWZOZ01QS2xZ?=
 =?utf-8?B?TjJZbUtuM0FMY3VlYnJHSHpEUXpLR1h4dXpkaWR2UWFLbkZ4dUhLWC93NWRK?=
 =?utf-8?B?NklSSlR6ZUhoNEl3d2xHRVhrMjhlVlRvRGZBelRRSTl5VmFuQ2VhVTZFRWdD?=
 =?utf-8?B?TlA3L0xKdWhzMTBWYXRud0VDTkV3Z0ZxT2p0YzFkNlFvcER5V1ZadURaeW0r?=
 =?utf-8?B?Vnc5Qm95WG5JY1dMSGhVa25sQTgrQ3NFeHFQWHlkRVNQWkd3WWJJQnA3TFNU?=
 =?utf-8?B?eUFVanpacDN3NEdaaUtMdXN6amt5dDJ0RVp3MU4vWVpidzlCdTZHV3psbU1C?=
 =?utf-8?B?VVdwMjM3RHZqcmZ0YVY0dVo0WjMxUHMvd0lYUlFZYU5sUjkzUStuZFNobWJy?=
 =?utf-8?B?TU1xVHlmTDIyWHJ4cjE1a2JVbUpHbFVBSGpxM1NLUHFTRDVFTllFM3hnVXdq?=
 =?utf-8?B?dWxFdHE0QWxncTgzdXJXWEM2VCt5YzRGZlgwRE50M0x5UkxUWVp3dk9qcmkx?=
 =?utf-8?B?N3FFRWVReDk4WVFKcXNyY1B0N0l1ekJHWEpHWXJUbEVHMVNiVGtqTnlnK3hu?=
 =?utf-8?B?ZkdUeU4ra2w4NmtZSW5CY0VEM2d4TjQrakpnRFNSOCtsZ2NOa21vNEQxMElx?=
 =?utf-8?B?bUx0VFR6MmtQWnZ1R0orN245Zy8zSWtua212c0xGaG5QU1NKdHdHczVRVlpT?=
 =?utf-8?B?bkNiNEttZUJZZFlTWUFtRHNFZHJPWExSakV0bEJiZ0V1b0JtcjlFQVRsdzV6?=
 =?utf-8?B?NjVlakpFL09abytVU3NQVW9JNGtQeGVaMldtQmZscFRaQ1VUWktxNjc3U3NL?=
 =?utf-8?B?L2lNQko2ekdBNEczSTZrV1ZpN3FrMmhpYVdYbDR2SEtaVEc4M2t6eGNuNktT?=
 =?utf-8?B?ZmpwczNXN1hzUVZlUkxOSjJYdUdHb2RqWmhjekZROWhNdWE5bHNVc1QyLzYr?=
 =?utf-8?B?Uk1BaFEyS3lCWE9seFk5anZFQVVXZkhIbWtTU205VnNaVkRIYkV0QzBMYTZC?=
 =?utf-8?B?VzZnZk13SXRKVUw4NDJZQU1WdFE4ZmdObC9SUmEyRHhlVkVWQk85aTZ1ZFRY?=
 =?utf-8?Q?IW18fmYRXYKHv70qTuiGgAgBu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415d5984-34d9-4876-2da1-08da73a2410c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 09:43:14.0653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X644g/273TGzDAjWJIlBkNj/TpbsCAamEU9v8lMfocVE1+GFLTiWsmGKJ4x7rtrHhQD5F9xeXX74ISH+1Ev68Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3049

On 29.07.2022 15:26, Anthony PERARD wrote:
> Two patches:
>     - one for stable branches (I've rework the XSA's patch on 4.16 so
>       patch will need to be backported);
>     - and one patch for staging, forward porting the patch for stable
>       branches.
> 
> Those patches are a rework of the patch for the stable branches available
> in XSA-403. The environment variable is now in upper case, like one
> would expect, and now a value of "0" as the same meaning as the variable
> been absent. Also, there's a bit of documentation in `man xl`.

Thank you very much for helping out with this. While arguably not worth
a lot,
Reviewed-by: Jan Beulich <jbeulich@suse.com>
and I'm inclined to throw this in rather quickly, not the least to have
it in 4.16 a little ahead of the next stable version release there.

Jan

