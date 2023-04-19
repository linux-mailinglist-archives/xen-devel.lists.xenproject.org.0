Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D46E7974
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523409.813428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6i4-00061z-UL; Wed, 19 Apr 2023 12:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523409.813428; Wed, 19 Apr 2023 12:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6i4-0005z9-Qp; Wed, 19 Apr 2023 12:14:52 +0000
Received: by outflank-mailman (input) for mailman id 523409;
 Wed, 19 Apr 2023 12:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp6i3-0005z3-PM
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:14:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe02::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7eb98f3-deab-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 14:14:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 12:14:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 12:14:46 +0000
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
X-Inumbo-ID: c7eb98f3-deab-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8fAzLnzEdjpGhjAYtPwBIawNKIqU2ciziDeKIuqITLoyve7rMRCH4pREB9ojWIfHk+XBt45W+nJN/egKNBspLcAiSp/S3Ij3MN9XM8jjYHESD9rfb9SH/LZt/hShH5j0NEWAltPhbuw/yf2bdV1c2RMSsDfzOdhL87TxDa0v5cWPlYRIlkCv4UH2/5zIGCcJ7YsoewkCeK8S5KZF+wE2v4RcMhV4kNWx/67RXG80gnryqOGzinWUJ5RJFzWhXslt3s5OXcFtPR1hXJuXa3bRbIC3oOMzM8I/GXUUZOwxnAhigQ1bWF6/6jPr3knvFV4EBo1qzHlCaxuVV/+QEHUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYPWiUehziRNTyCPJNuNqeT2LIGKZjN4b6i91CCECGw=;
 b=aafTOkiThYD2//7ePg1LMTuLKKcXahsDaWyiA2HebVOJINQAQuOiiaGi/u5JNWMuFITRs6fT3bf/xreZSFR9rT9CIpZ3WqBXu+e1fxY0BRgcw48Vq8mm3SFuuP9SCa7Yr++6NfwNT8SJWC8xjwefVVofK07PvEk/ZvKH9hQ6XkTnbisoveLnpi84OhBcmeKP/tvSnOUPiL5xXVlCFP9JuhuP+my3pSN2/k6ymYsPTcTACF+Mv5JHqQZLJjF+LdlYjP81D0uK5SSqiWXjTJPlgjiurkvWCEjPTOcRazcIj7VRGQkSUU1UIwvzA3wdbiXFLxnfhtp5r+qf94ja0UjkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYPWiUehziRNTyCPJNuNqeT2LIGKZjN4b6i91CCECGw=;
 b=F716ODBD0Q5+2IinQfGPNnsPZBwFPEA0gS18fxF2ERwLqwKdf8nVY6lza0wDMtJhq5z22peykNYLIodwWpZOnVb11Wa86wB2HTWNl4cwrv6dDwEyYxNiSNkhGzSoYd21jiPpfqcY1lXAnBSizqC4o6Ofx3HzzTTstJbTkCuDXZ9yiTeUwjaUAQTJRLD9BjsPkMi+SF8O48JqXyoxkNwlotgCJbszojrX/BLpCmuywin9ri9uVk0o+246iLTcS3x1H3b2o3eVQDr34c9vjPYveONrCmgpSCEI+hSx4fAV+SIbPy1+PZsBWu82X9QQMrl3JorNYQZINoguAunwWyeRNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e27c6431-053f-924e-27c4-763b3c45fdc2@suse.com>
Date: Wed, 19 Apr 2023 14:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] xen/vcpu: ignore VCPU_SSHOTTMR_future
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230419114556.34856-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230419114556.34856-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 8007b967-6405-47b1-5d1b-08db40cfaa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZxTdalgNrgDSGRRiJV7+KrWzjMclD7w4CGDcGxhzWOKXx6hq2E4sk9l7IFMTCDjaeo8kn+NBZzoF8/GQCYZBEwdbrlHwF5Pkoyugh2nWbpGM99zaoNZSLtxnMFQB492Zt9OBsy+270zVVQAJlkE89aerD8/uYUmOz/rL1wZU00yQBe1e5C8onAkK7vyalUMzY5zYTuEo5cw45PKFjB6+3zjsJbX7VEEjVempViJtvcauP4B+5MlqUF3Brk0TUMf6W4NTt9q6ysFIkK0U8wmAJ+y3waUl41JTcgWhhk87ens/b3HUhicu6qU3W+5YWfU1tNGM6dBKss3evn4Yd0XLAyVVW+xgEooOblhIuiwnvQZsnEm+3LDfqk/m8FbX8EGNtC2NCzBwotUPhPNPF2m55Pa9ZY9uz7Jxc8kHiYcPKFRTwy25sF50BPdi6U7Xv3uL0/uTAxoza0EuCclmwKmLWSb327gZzvMHHTHKxfPAUs7UPlcdS1jNPyMhC8LZVCUsczg9Y1KYG61O6y5K6gs5gDMoyOjJv+GUfedV48RRaDjMM7mkDycfPYyQ7tLr5f2q4s5VuKZDQU4Jce7d1KnE8Y2pGJBCb9SaFZB6qNjwkyXS8M5siO9Vyfri+iuen/L/atCUx761NtKcdGEp2P/WrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(53546011)(6512007)(6506007)(26005)(186003)(54906003)(478600001)(6486002)(5660300002)(8676002)(36756003)(8936002)(2906002)(66946007)(4326008)(6916009)(316002)(66556008)(86362001)(66476007)(38100700002)(41300700001)(31696002)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEIweWZwNzZlclY0Q0dMRFFXclF1cUtJUCtlRXFUYW9kalFXV1I0TGpPSjQr?=
 =?utf-8?B?MVM1Q3FWeE0zUDFFWlJRRU8zNkt3VzZpcGxjTy85dDhiTERYSldNbzRkR3gz?=
 =?utf-8?B?NDJ5ZWJkSHRWbXhHWWVENFlhUm9KU0Y3Mzd2Q2huekd4aGlSVEhGK2E0amlv?=
 =?utf-8?B?bFNhN2Q3bXNBcS8xR1ZXaWlVRCs5eDlyUzVhclo0YzJZSnptbGl4aDFOWDNa?=
 =?utf-8?B?MGhSQW91N01qeTdQbjRaVGNOdVFrVEs0S2RZV1BwenBrWXdKOCsrelJQVW1K?=
 =?utf-8?B?WUl4aXNQZ3BTd1c2aWNHKzMrZ1piYlJyaW5aa25iMDE1T3o3d1QzeDVXUzFk?=
 =?utf-8?B?NW5tWHBUNDZFNzlBQ2o4bnpvUFVnRmxrSCtFOFc1djMxcjVHei94eW1MTmd3?=
 =?utf-8?B?eFdnM2E2Q0JXMVB1UnpRRjhEUmluNDNPUG1LVFVDWHpndDBUT3FDM0E5Tk1W?=
 =?utf-8?B?OUFlZW13cVpEVDM5WVVzNzE1eTVDZ2tEYzlHY1dIelhyU041aUxBKzlrL0tH?=
 =?utf-8?B?cys5TE85Q1VGektBVytxRFg4MEpPUFlVNXVCdURsZnRNcFRzbFEzYzNJZ3c2?=
 =?utf-8?B?MTljbDNvbHhVdFZjSU1vSXZWQjg2UE9ObEhvUWVuRlRUVjN0Y2xBUG5DNER6?=
 =?utf-8?B?S3YweEg1VW41MkU0WE9yMndvelJaT2pMQU96RWVjMXRDTmx0a1k4NjJTT24y?=
 =?utf-8?B?dDlVYnRUbmZUTzhQcllJMEpUcUtZTnd3Z3h0Vmxydk45Z1RlMlExdGNFM3J2?=
 =?utf-8?B?U2UwaS9SZjdVR2w4VFdtUnRZSEFVbHNSbytXY2xqZXpad1lYQzU3YnEvSDVM?=
 =?utf-8?B?N1MwNk9nNEdYaTZGa0VJaG1xSjJCMW4wS0tzdDBKbVEyQXlPa1h2Q0xBQVZy?=
 =?utf-8?B?UnRBdTgxSzhoczRkQmRoZU5uQmNRVVVreWRFMFNNbm9mUzlyNk1MekxZTXJv?=
 =?utf-8?B?OGx0dE9nMlRsT0VGL0lEK2trK3dTYkUvTCtUVGlmdmhYQ2xGdTBiend5ZkJ1?=
 =?utf-8?B?NGI4d05raEhuU21sWHBzeXljcFRPQ0RFRzFHZmhvSTFRUGJFRUpzdFFTRTJY?=
 =?utf-8?B?NVgwUUlBL2xBWnlGUDNGS3RIL21rd2h0TFRKV3lDWGt0VWdWNWFjUDY3NWRm?=
 =?utf-8?B?UDNBaHNkZlE4aXBEYzZXUVd3YVJtbHFBTUp6ckdxcE1BYWVaRkptRyt6bnJZ?=
 =?utf-8?B?RXhSNzBESGV4TXJEZDNJMllYR2Z0YTRqcE10ekduL3pEd2JuUm1RUE9CZnox?=
 =?utf-8?B?bGZ4WG4xbkFLaVNJUWx0djBRZTNMdkUxRlZwVm9QUHI5UkdQSzRIemJBRGM2?=
 =?utf-8?B?NC9WRGcyWlBKSU9ET084ZHdoS2d0aDd0ZWE2eWpTaDhGWW1UN1hzUXdlWjJo?=
 =?utf-8?B?Z2M5UE5zd1pvb0MrU2prSFJ6YlozTUd5VE5WYmNkZzhZb0dGbU9PMm9sZ2Rp?=
 =?utf-8?B?WUozU29OckJMVHBjaXdaK2xvVFJmWXFGQzUzNkFHWk5KcWtUOGhqOHZxOTJ0?=
 =?utf-8?B?NEVqdW1qV1RJTFFlcExvUnpmTVN2ZzZDM2V3ZVdUb1NQQncycnF5SmttRUdk?=
 =?utf-8?B?dVN0eVMrTGI1RE94TURVcEFtdFdoYllmcmc4T0xLVDlXZVhNVHNnRGwwa0Nn?=
 =?utf-8?B?V1lSRFF2YUwxeSs4Si9MdUpBODNVbnZUM1d6YXZzMlpuM3Q5OE93aHh6WS9o?=
 =?utf-8?B?UGgva2JwcjFjc1RlSytZdlZMajU0a1pCdFZ6MXlxK1lIa01BOHBOK2hFN29s?=
 =?utf-8?B?bkhYdHhuZW1PSjhlU0ttNERXa2N6LzJxWFF5N1VhcExhTnpvVmMrRUJnRGZh?=
 =?utf-8?B?SnlpbXB6SUhHUlR1cUl1cGNVelBnajMyQ3BFRE80S3FBZkNmTkhqNzUvQU15?=
 =?utf-8?B?T0g1NHpOMklpWCtFbFc3VFh1ajBJbUZPUllvMUNSMitDMVdzWDNreGdHVTVq?=
 =?utf-8?B?V0xSdUlFUW5wZi9zVVcyN2l0cmx6OU84UXBFZGhWaTlUaXdKUDdNOGg4QlVm?=
 =?utf-8?B?bnJMUGRWc1RyS3JBRjc2eGRHZk5OcUk5OXdWVVpBUExxbkJaV1VRTXJUM25D?=
 =?utf-8?B?VEFWaFpOTk5NcE93NStVY1g0Q1RpQ1g4Q04xZVhBNDlTWnYwNEhvcHdvRmd3?=
 =?utf-8?Q?bLgZszVP4Y0pza3BWDBMc60kW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8007b967-6405-47b1-5d1b-08db40cfaa79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 12:14:46.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAX7nKu/KtCbwji+d9IfWj41I8PvaglW4ohli5MERq1leE741i6n+ZK+tNL+08wKvjuaUUD2oHSwfsQD1LRhbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059

On 19.04.2023 13:45, Roger Pau Monne wrote:
> The usage of VCPU_SSHOTTMR_future in Linux prior to 4.7 is bogus.
> When the hypervisor returns -ENOTIME (timeout in the past) Linux keeps

Nit: -ETIME

> retrying to setup the timer with a higher timeout instead of
> self-injecting a timer interrupt.
>[...]
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Changed
>   - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
>     cap toolstack provided values.
> + - Ignore VCPU_SSHOTTMR_future VCPUOP_set_singleshot_timer flag. The only
> +   known user doesn't use it properly, leading to in-guest breakage.

Might this read a little better as

 - Ignore VCPUOP_set_singleshot_timer's VCPU_SSHOTTMR_future flag. The only
   known user doesn't use it properly, leading to in-guest breakage.

> --- a/xen/include/public/vcpu.h
> +++ b/xen/include/public/vcpu.h
> @@ -150,7 +150,7 @@ typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
>  
>  /* Flags to VCPUOP_set_singleshot_timer. */
> - /* Require the timeout to be in the future (return -ETIME if it's passed). */
> + /* Ignored. */

I think this could do with something like "as of Xen 4.18", as the public
header shouldn't be tied to a specific version (and then perhaps also
retaining the original text). Arguably mentioning a specific version may be
a little odd in case we'd consider backporting this, but something would
imo better be said.

All this said - while I'm likely to ack the final patch, I would still feel
a little uneasy doing so.

Jan

