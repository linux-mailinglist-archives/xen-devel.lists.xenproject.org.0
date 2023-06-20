Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74D4736CA1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551830.861562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBayl-0001nA-Ca; Tue, 20 Jun 2023 13:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551830.861562; Tue, 20 Jun 2023 13:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBayl-0001kG-8x; Tue, 20 Jun 2023 13:01:03 +0000
Received: by outflank-mailman (input) for mailman id 551830;
 Tue, 20 Jun 2023 13:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBayj-0001kA-Hl
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:01:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80453128-0f6a-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 15:00:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 13:00:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 13:00:26 +0000
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
X-Inumbo-ID: 80453128-0f6a-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zgou5EdjO2+6Yn0yFR55goWcCksNfl01y3tSAIWgKdGyCp9l91vHvBeKFFP45PhWiRTqZcJhIMdyuvLIP4jdgf9KtuusWgPdeI3C72ChO/v/vyacwTzK+F1nG8Wm6rMqpwKdgkagF7USDqEU92QhJmKndRfxrJhA3k6H2xz1/SvCmvxnoqC3dHz1EHYrKP+cg4qYa1qOAMGxBfD/DFRqZ/hdIuow29MIBXtoONZL1KFxqwnIc/SD/wYo2COXOLIckjHqYpfuS/Gjc2pVM7Odo0sl19JoZgTrCKmTEvNI8H5V/UQ79JWQQv5vTA3hajshQvvEA0i6hiXc7W0aht9biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqxUeh3KPPvN+mv0Mu2fwlBD4Uuy4eC7AKdzDm94pPc=;
 b=f90qwR7HPt7bCv9GHWntEGftdQWUEtxvXVD7RUizvaQUKYDZ6Ntw5ig0TKWXj8C1SB58Mcsvgxai09F20dyh/dWCISJ32ZqRJkb8IaKNp1gvkGbDsFCmrJICWc+iB8qC9Ak4iZgACraeoKMO7+JYJdQEUPDPyWeroR0ilxjZMEHA9V3Fv0iJRYJiqF/NWv/FbIq1sNxhbidewf0hmKs/JTpNby3F4bT3mNGaqXXQStdc2q8xk9fVAhwtsUS0wQ3kOaKbL0VsD3TTn7nRiDmNbJhaQX2JFbV7Bz6acfO6NjR7DHeWMgTXFU4zM/syiBICFv2xHllvP2kcOZLRxRnYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqxUeh3KPPvN+mv0Mu2fwlBD4Uuy4eC7AKdzDm94pPc=;
 b=lZO1/P5Or2FnxyHPOpAqS0rwqUQ5SJuFM66PN5ecbAOa3X+GrccXlHSxkrqRGyZhlqzAtyEqXUrXq5vkj+QfqENModypaMN81l8QrBK7h2Qcoj4q7GO7NzoKSw5mbuD4qAU6qVkHRY/60KTcPzBnBv6Uh9yY7UEo3+unTwJdJvR6aqWW4bwbk6je1/8i9hgTcHA98z+uZDYMdR6k8iWSzH85sr02eO7Po0P2IThGzQyz9gpvZIdpi8io0ELXf7ZpBZ1xHNxRe9zIf41O7v5Gw4cyVZVgabET86nK9IyTKxLVqRdWhTm8wfxqtpFRYTanfz3xqkw5f1JKQVF2fFSI8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97d41c7e-94d1-928c-6619-adc25ffba106@suse.com>
Date: Tue, 20 Jun 2023 15:00:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 09/13] xen/public: fixed violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <2214598125081ccfb324555288bee0340f8b1024.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2214598125081ccfb324555288bee0340f8b1024.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: a46fff5f-db05-488c-3f31-08db718e5130
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TKCdkj6CvwClCzJi7DfAZ7LRBCuOFISVjTENK+vz/z06BO9sib4yCUa06yuUXcivpEshZ/4u9QgmphtDL5zyJ3yHqV1sHt9OeMp3c0lcGGQSz6ewsUcDynAHPskDkp1+hQld9XARH0edVVaWikLTH3E/vqtExx4zXNgZ6EGBzezseHnKWSFj6w1uHax+9XGEerCCMQ/ybdz9pYCIzfcfgJIMH6pNsKPa+HZa0w21rwH3lbUrlrH5sOX5TyGiSTNKDIZBrkVTrvrkqcGYe9Swnm6x9pnv7U2uCgO2AFNVekXCCvMPTKq2xsRDRWr1Gx1pZrf6DMldsgPDYYUvB05oF29IGEMz5+W7mOPXDFsYQ2EQu5+APB/cARKxprauXKLMSSc47d0uR6En+DIyISNwqkXb6oh1AJ+ISR12KHiWlDF9cG9254ZTaF4COrV2oTWrYXLP6JBtVqTlT7i3xRxXCvbcXkyEJHv7jDH5p+yD5CM1zDSATpgG0KkQF/i27ydXchjvdUphsHfQ7M6uUXsbu10ZnDliBQbj3GAQQ4g464V9OHouDqyldQx1UZcUu9oK+r96SoyiVwt1hfYI0L+yXp+rkpBumLdI2tTwqKta3AJD33xMIGF9R7Pd9AzaNrUkQoPXobuOsYfM4cKX93rpgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(86362001)(31696002)(41300700001)(8676002)(8936002)(5660300002)(66556008)(66476007)(66946007)(6916009)(316002)(31686004)(2616005)(83380400001)(38100700002)(36756003)(186003)(26005)(6512007)(6486002)(6506007)(53546011)(478600001)(4326008)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2t5a0NFdHBWM2FkME9OUy9iZ2dtL2txZVkwQk13cThtOEtCcHFsWUlOd3Zv?=
 =?utf-8?B?RWx3aUJzUnZwK3NDTFJ2SUlWOVZtWnZxTUt3NWpqK00vUzZjODlkeFlTZWZS?=
 =?utf-8?B?VFk4OGJVdTRWMzdPNlZFTzhMVlZmaGxxUHJCSElkMUN3MjRSeEprNlZaZEZK?=
 =?utf-8?B?Wkl1MUJ2RzQ4NmhWZWJoS3VyeHZLeDFVOElYK2UwZFdkT1BMUUlwMHNibWhW?=
 =?utf-8?B?QUJza3NDQnRsZWpWR0JUdmtFSVhpU1RhT2RkTUFFZXRIeWh1NlArNHNnTzdx?=
 =?utf-8?B?Z3dBMlNhMXRqS0tDY0JFYXBici9OMFZGa2FpMzl6dzdlTWEzclJsZ1dXSXZv?=
 =?utf-8?B?RXNyYm01Z29DUUlQbDJ0OGl5MnlXbVJMcW9OUXJSMHQxaDhQU20wSUVpelgr?=
 =?utf-8?B?dmhvZEdHQzg4R1cvQlBjcUFyNWJtcWdXQUJaSm16KzNiZzlHYWVsWkNKWmNC?=
 =?utf-8?B?MXF3b015TWhZSXpZUTZaek5UQXdDVjdkRDQ5ZUpVamtJSWxTNmY2ckJPUWN5?=
 =?utf-8?B?UVRkS0dKNFM5UVR6WTVESktzUkFZb3lXOG5KYnYwUzZMbFJTNnU5WDJ0RGZZ?=
 =?utf-8?B?VGp3QlBoNWtLaFhYOGR1T3luejZMT2J5UkVvc0tMdGVrdXpXUGZiQ1dhYk5m?=
 =?utf-8?B?cVU4K2V6RkdENXVWWXlybUM4bDl3WmxOVkJsS3BHV0k3bVhHUWZsTm80NHhW?=
 =?utf-8?B?OFFQNU5za0IwYXhBaEdOMGxLWC91Qi91c2Z4V3NnQzA3MVEzVGRVbVdVZFlX?=
 =?utf-8?B?bkVKQTRiZW4zenJrS2tjOEFPc2NxZGhnc1poMzVFWkFQUldHdW8rVHpEeWpa?=
 =?utf-8?B?OXN6aE5WeVdOR2N4MXZCOGRJQmgxV05RRXIrMmZ3TWpsQjBPSkYwQitOUzdW?=
 =?utf-8?B?L1VXdSsySkVEYkNYaUlQekxsVlRINHpWT2U1WHVaa0lmTlBEdk1vcmxrRzBZ?=
 =?utf-8?B?cEprSmNTb3JkSThJUkxSaUZVa0JYZHVqOEZHNDg3MFdwcHRBNE4rMTIzY2tV?=
 =?utf-8?B?TUJvKzBWcDR4Zmo4TysrSm5pTXJ5K1BHTGtYQXFFSjd4c1pzTWVRU3cvNkJR?=
 =?utf-8?B?S3pWZkpyeVJ1eFlwa05YSDZuM3NzNXZjR0dGTkh3MnFBcWVGNERBNGtrOExG?=
 =?utf-8?B?dCtzUVVDd1Q4UWR4L3BYUDBkTngzZ1Jla2ErWlMyT2F1S1VaczBjNUJKcjlp?=
 =?utf-8?B?MkpnNEtFaUE4WGdvM3NiOG9tSHJtak43aTdLVG1oVTFFZjQ0eFA1Rm0xUGp0?=
 =?utf-8?B?RDkvOG1YY3FqQ3o3YU5IempJeW4zMGsrZ1JxNXhWNFZHNEpFd0dXdERjMlY4?=
 =?utf-8?B?eXMybHZqdzRzSFJvVTc2M0dTMFpqanhsakVaMXRsL2VUOC92RElqY29mcGl2?=
 =?utf-8?B?eHFZcFhlMi9LbXVVR0VYaklpY2piNGlLRDhwMDBTMFpLRVpPTDNMdXJyU05S?=
 =?utf-8?B?QlNRSmpNcVNCcnlYRUZhK0k2OUgybzhTdDJKbTAxeXpkYzQzc0xEUVlReEt4?=
 =?utf-8?B?RCtMaEp6K2tHVGoxMlppMFhEVjgyTWJuR3o4dnh5WE1Va0hubEFyRVVMZHhy?=
 =?utf-8?B?SzVKN1JITVEyTC8rTEV4blk2SUZUT3J0dE8zZTNCcmVTQ0UxakVHcmNJZGph?=
 =?utf-8?B?RlFHekZqWUxRc3hueHNuK2prR0ZCMTNxUXQ4OXA0QjFONkVmRDMzZ2NIdTRC?=
 =?utf-8?B?alJzUC9aSzdVcHRBN0tqNmlBa01zS2xwUENlRDZmN1J5MSthN1Y5N3ptNXla?=
 =?utf-8?B?SmtwbVZPeUZDWjRWV0xqOTFZNWdFVjkyU1hJbktRUmErcVN0YlhzU3hzemIw?=
 =?utf-8?B?THlKdTNxeldkeEJLc3NOKzEzM24wUjhLdytJdUlHanVSRVhkZy82K3ZoN1pj?=
 =?utf-8?B?S0NpYTJQNmRFZkowcVp1ODlwWmorVVBlN3VzN1dITkhKWVpKbE4vQVhUcVhE?=
 =?utf-8?B?cy9qSE00MGNpLy90NTRtMGxaMGZFT3oxVVY2OE5XMDhHQWFBTTFEUGpvbStB?=
 =?utf-8?B?UEZpVGw2MnFJdDdEcnR2bWtuYnBZS0JKck1aa2Y4WnkrUHhPcnRlV1RCbytr?=
 =?utf-8?B?SEVjb01BM0NIS0lqcWRLVzBRdU1XbFk0NXVBQ1NjYUxlNWNoY2Q3alBaK2Vr?=
 =?utf-8?Q?4KFojBRL568g/3SzsjMqx3fwc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46fff5f-db05-488c-3f31-08db718e5130
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 13:00:26.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pvoc5rCqGpQoeHjal0bkXiC5Q3R9QlBvzBVTZv2TbQkPMFn7bDGao57LRy2YjGBmQh1ubBUszOfjuL0xtw3vTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390

On 20.06.2023 12:35, Simone Ballarin wrote:
> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -36,11 +36,11 @@
>  typedef unsigned int RING_IDX;
>  
>  /* Round a 32-bit unsigned constant down to the nearest power of two. */
> -#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
> -#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
> -#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
> -#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
> -#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 : __RD16(_x))
> +#define __RD2(_x)  (((_x) & 0x00000002U) ? 0x2                  : ((_x) & 0x1))
> +#define __RD4(_x)  (((_x) & 0x0000000cU) ? __RD2((_x)>>2)<<2    : __RD2(_x))
> +#define __RD8(_x)  (((_x) & 0x000000f0U) ? __RD4((_x)>>4)<<4    : __RD4(_x))
> +#define __RD16(_x) (((_x) & 0x0000ff00U) ? __RD8((_x)>>8)<<8    : __RD8(_x))
> +#define __RD32(_x) (((_x) & 0xffff0000U) ? __RD16((_x)>>16)<<16 : __RD16(_x))

While I don't mind the suffixes being added, I'm wondering how
the tool would have spotted the single violation here. Iirc we
don't use this header anywhere in the hypervisor.

If this block is to be touched, I think it wants correcting for
style at the same time: There are numerous blanks missing, and
especially in a public header we shouldn't use underscore-
prefixed names outside of their spec permitted purpose. (This is
about _x; I'm not convinced we can change the various __RD<n>.)

Furthermore, if I recall correctly Misra also mandates single
evaluation of macro arguments. While I don't immediately see how
to address that without resorting to compiler extensions, I don't
think it makes sense to address one violation here but not he
other (the more when the code in question doesn't affect the
hypervisor build).

Jan

