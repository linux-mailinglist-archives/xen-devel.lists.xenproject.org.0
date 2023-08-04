Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A361976FB4C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 09:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576939.903652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpNm-0001P1-GK; Fri, 04 Aug 2023 07:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576939.903652; Fri, 04 Aug 2023 07:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpNm-0001MU-DA; Fri, 04 Aug 2023 07:37:58 +0000
Received: by outflank-mailman (input) for mailman id 576939;
 Fri, 04 Aug 2023 07:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRpNl-0001MO-Kh
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 07:37:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d34cd56c-3299-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 09:37:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9716.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 07:37:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 07:37:52 +0000
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
X-Inumbo-ID: d34cd56c-3299-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoAJHKhaU3AiAoa7RHhCWXHxC5nd4OA8FCd6yZG1b1pSnSz2/CVrvOVh7OxVJhDB1+xWocA5Je490ckfwRaZvknrXVd1s6vJJjA68dUryvMjKQhiQ26MtjkmFEmzZmwhFT1dd/4h/8CBhOLB82qDqpKgkZdA0/0wz2CyAX0YHIZhHB/LiooQe/9g11+4bfzj4swwDMmqNH9rEmqxXbPIXcZGum5hA8TtkKMNF1vXKl3o4KyETbPsQmm2DDJKjDgiHI6iRvAutDR8K9VLBwKgmWfTbaMi6amSXdwfMwVXwJnRMlRL5ccL/S2eecs1nlxtx+lOe6zEQr6eDYNDpEHkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4xkYOHi2k/b79+KE7YivMJrRoGNugFKVWE7D78cG/M=;
 b=RCeV+TmSt7iD/Ud6o6ubm/V5LmTk0J2k78BTPBqG9UbsZf5525tStZC+Kp/oYVpVZY0RRDn3wnnQZbTLQyPt8LQUuuT4F4WbroaN18CsLXDWsHCktc/AL+WNkwMxo7FY919S2MCj1V26ARE7n2/TVrs5cTxxYpJgQLLctRRNNE4d+mXICX/70iJaj3r1H5prvA3hsfJbnMvmDnQl0G89lmFk30PDddlHdSZpIRBEyayyvPAeaqxXVjAdlvsysO7Z1qPg/dPrfZx+phlIKyH6SBRJHrsyGRg6nDy0TL9MBpbaMCbPboe9Qe5GHCvpOLpMr46Cxogzm9lKfxUNMC6HbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4xkYOHi2k/b79+KE7YivMJrRoGNugFKVWE7D78cG/M=;
 b=Fokrea92m2P8zqujZ2WyfgKQXjcjTU7uZRI9ZJEfPrmysLrKgRn6FS5Q6YgdkptJEDL+KF5boJFnJ7roXrwJh4dc8q/iKEdK5cTmBeHjS+vfSm43sR3cNMoNIM5DmLH7nWQRvdTPGzfOlvxVRMFxMOMpIvFKUVYlIKNxBtgRfspiPe6Lad3AebFDi2VQOT0sFcqI+oeTW27gU4J4T65dG8dXajtVgfmS4C24S10gm04pzgLnqIpXwBHdrFq+Jws52/y3Hx7sgwk986BGjLvcQlrqCLIWSOjJasqoIOq9rS2JCQq+mbRskzN9daeWWIOV720e00yr1VYaNw7brjvcFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8b78e9a-8aa8-dafc-bcda-b6a2101113cb@suse.com>
Date: Fri, 4 Aug 2023 09:37:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] docs/misra: add always_inline to C-language-toolchain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230804013438.2894725-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230804013438.2894725-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 66692514-9822-4e3c-02c8-08db94bdb5ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u7nUns87Z8BoJc1RjeJ5B47ZZy06ixc/3ItNgujhxFwUtg+Fvhr64gZU//h/WIrOp7zJHtyXK7xoK/pS8QbMF8/4yPIpA1wuP5TzmpunQyxsEzJXgapvAZutQvfZUxI8NtGawJcdx9ymTc35aOOvtQShhox8Xe92v+N8lJfLoLj2iEKCa0y/scYOQsK72GUl6ZqR6e4sNvnznuVw0jZ5eTxWMHh9eKt4MJ3HyVHoP8mnNr6qX/BoJT3KTrwfo4Lvw14q+cG++z76+QYuk+DqFz1i5Bk4xFEtRVGGzfiBFkG5W9gm0nETq9ACg01NH2+IAQDeB0fS62GL7oVbqJnMTOXAu9nFmCHa08O5tVxrxOBqdQhjNvxkrukI2SAr9RB2Gu/XwoFuAalXVJLN74lKHe5O+ZxKV2DY1NElRPbTWGHeXQ4d5yUDuv6uORQN+CFgwT4S2ahTqjvVbITD5nfxfN4RSC4Cop4NZVUQSRdFM1kLMcrSjnzXksSzdZiQ/kC9UMKay15nvgaYCBeZuoitpz8UfqqG2/k89jVoDg40AhPMRVOUUpxcB/uo88+8uXoT5vejWw4i5ka9pwyBFKulR12bgE8Jvw652spZam5fyk27ZOIGXmXg0oIFR+oNCBWDA8gtEC9bwcTxxF7Kudqv6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(186006)(451199021)(1800799003)(66476007)(66946007)(66556008)(4326008)(6916009)(2906002)(38100700002)(2616005)(53546011)(6506007)(86362001)(6512007)(31696002)(26005)(478600001)(36756003)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODh2N1MxcUpYMVh0TXpGUHVHdXQvSE9aRjFMMU5ETGZjTVZvakpvK1dVQldo?=
 =?utf-8?B?am5hUXh6dkZqL0p1Z0tubDhId01CMXpQWGV5VjRNcVFxVXREd0pESHk3YnVQ?=
 =?utf-8?B?SEVYQkRJcFJWVmVvRVcrNTBLWXdzZkE3YUc3VllUTTRFMUNrdXNyUVdVM0k0?=
 =?utf-8?B?ai9QdlhkUkY0SXp4TkNYVzhsaGxjc0I1RmJZUnJrdXpVWUk4UDZuSythYUt6?=
 =?utf-8?B?bUQzS0MwQ1pOOXBBaDExTElHMVd6Tm1jOHVQcnhWeFJZbjk0S3VzMTFwQldN?=
 =?utf-8?B?ZHpHRHU3YXRhakt1K29nSFRNWTZXZms2L2JscExJR0VqNjV5bmVxcmVTcjR4?=
 =?utf-8?B?c3JIdjk4NjFzaDhGZFplbWV0ekRmNHVKMWJtNWkzYUhsbVNJT1pqaFJ5SC82?=
 =?utf-8?B?Q0lKM1VWUFd3KytCN1RzVjlxR3pwVEhXNzN5ejcrZTBFR3pKbFN1c1pnWjBE?=
 =?utf-8?B?bDNLOFlGZmo5YmVOUDVmUTdYY0h1NjFTOUpxdXpWSjc4UXRjZWdEODdiNGlC?=
 =?utf-8?B?MDlUM2cwVVB5SzIvZFFLdTRpOHhxeGZqa3hCam4vTEpNeTlLZlhmZWZpWDVx?=
 =?utf-8?B?aWY2RzRLaGlDMDVEV21KWTVuUDI3Y2RtWDRBMUdySzNWWUMrTmxaWVhCc3Ji?=
 =?utf-8?B?bEdzcUlJRFFjYWpsdFZPY1NEaXVrNWlmNnc4V0NKMDRMZjhyZUtGL3lySm41?=
 =?utf-8?B?L2JRTy9scjROTWpKR21mRGJnaHlsUUs4OE03dXFuUDFoOTYxQjErTVhzSktv?=
 =?utf-8?B?TjFYNGJBTEZBNy9zVEc5RGhCUENISXljMWdqcGtzMFNsbktlcnB6YXIwTmlz?=
 =?utf-8?B?emlrTDZ1Y0dCUWQ5NG80N0srb2U3WTJmZ2hkOFJsS01tVGlvTTgyb0ZPS2Fy?=
 =?utf-8?B?MEF0UnUyZVRZTzk4Vk90VGRGbEpZdHEzUWQwZ0kyNzRqR0lzNW83WjdFeEJp?=
 =?utf-8?B?TnJXcm1TZjB4bzZqUXdrMmY1cnVDbjVMSTJ4elJXOTVodDZYKzhBOGQ1bTJO?=
 =?utf-8?B?MkswZmhBRzJ4TjFNMDFuRkNvV1prSVZPNHJBR1RWOU1vSTdLZ09lL1BOb1Jt?=
 =?utf-8?B?Uk1XbEFiNnNVQ3VJNXFEYjVxR2dYdThEMTlrdWFYcnZlVmdUNGFiYVdHS1Jh?=
 =?utf-8?B?YnMxSURlRW1rOGJqaFBKSmFVcTZMQXJlTzVRcDBMNXdpZ3E5WTBwcE1nZkpD?=
 =?utf-8?B?OTcyYVJtTkFOMldzTlAvelFvZVptNDI0N0hnWXY1ajJlRy8vQjQ0VTYyZEJq?=
 =?utf-8?B?QjhzQlZWM2t3c3dzL29OM1RmeHVkMTFNa0VTYmxqVFpWaWtQa05zQm5mTVVh?=
 =?utf-8?B?cDFGWGVaTktuYkZDSmxrekhGK3hka0ZXL1MyWElTUnJMN05zM2U4UW5VbXo3?=
 =?utf-8?B?bDB3a2JMWmY3Yi9CanFzdXhaWnYxSS9HT3pJbFo0QWZNUG9xbU9wNUpJRy9Y?=
 =?utf-8?B?YWE0N1E4SVM3R1BSWFlyN3pPUmp5emh4R3c1elhNdFA1VGlpUFYwRG9neG54?=
 =?utf-8?B?VlI4QXFKQ2lqc2taWXJQK3RZMHRxcFJUclpUZVZYdXRvWktsdUZKR1lKWnY1?=
 =?utf-8?B?K0RuYXJUTXpnbHFvTkZUcFFmellMZE1VQkNhZlVVdkNFUm45RWV4eit4eHhi?=
 =?utf-8?B?YVNCZW1HNmlTcWQ4OFZuUTFleUdWSlZGelZsanNEZDVVUExLL2F0RlFrelZS?=
 =?utf-8?B?TkRpakdTTm9qLzJCU05sRURIZlg3L2g0M2lMZHV5UjJOUXV6OTZKMUpqcGIr?=
 =?utf-8?B?NXFra3pNcmI3bnN1VDkzTE5UdmZoZzErS0xmb3lTcnduSVJadUN4WXBLbGNa?=
 =?utf-8?B?NUxwVVhtamZRQ244Ty9LQXdtZHQzQkxmSGVCNXI2SW01S2pJN2dyQ3NGcnZS?=
 =?utf-8?B?aDhiSDdsL3FDSDBlVVhLM3pFd1hLTDVPblhyNnptSzc5Z2FHL1lzeWp2ZU9t?=
 =?utf-8?B?NHRGVVMxZzVwa1ZybjY4MmFDWWxmaWxQdmVXelZRM0ticnA5cXZSYi90bWNU?=
 =?utf-8?B?bXVwd2hKSUVKRW9ydUI4bHpqSUhDcFVVaVpzaG50TEZLeFJNQ1puYnVVdkRJ?=
 =?utf-8?B?UkM0VG9BTTkxMlo0bXowR1NPS3dqbTB5WVVWdERNVXRCaVFyMTJwQ2d6V0Qx?=
 =?utf-8?Q?K2hRD+7sA8TL53h992dBStfsg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66692514-9822-4e3c-02c8-08db94bdb5ab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 07:37:52.3611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppBZbqtWNX05DpAxSrJG7uPWu9bWo/5IZ4WVh4j5KsD7Vd0Bra6CtNE6zhQa6KwtTa3oAI3zYYhnkFKc/OzIfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9716

On 04.08.2023 03:34, Stefano Stabellini wrote:
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -84,6 +84,8 @@ The table columns are as follows:
>            see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
>         __const__, __inline__, __inline:
>            see Section "6.48 Alternate Keywords" of GCC_MANUAL.
> +       always_inline:
> +          see Section "6.45 An Inline Function is As Fast As a Macro" of GCC_MANUAL.
>         typeof, __typeof__:
>            see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
>         __alignof__, __alignof:

This is the "Non-standard tokens" section. What you add is a macro of our
own. In its expansion we don't use the similarly named attribute in this
very spelling, but with underscores prefixed and suffixed to it.

If we mean to enumerate __attribute__(()) identifier tokens here as well,
then I think we should add all of them that we use. But that's going to
be an ever expanding list.

In any event I don't think such an addition can come with an empty
description.

Jan

