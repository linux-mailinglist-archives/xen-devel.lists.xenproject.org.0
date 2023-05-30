Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FB716760
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541254.843813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41WE-0006YV-SP; Tue, 30 May 2023 15:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541254.843813; Tue, 30 May 2023 15:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41WE-0006Vu-PR; Tue, 30 May 2023 15:44:18 +0000
Received: by outflank-mailman (input) for mailman id 541254;
 Tue, 30 May 2023 15:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q41WE-0006Vo-99
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:44:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d58da1c5-ff00-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 17:44:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8149.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:44:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:44:15 +0000
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
X-Inumbo-ID: d58da1c5-ff00-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/8dDXUFqNmG3c+B/e0RP5vNbAx5X55/T3TglKZ6ARj7CSh7L91CPzesbrTuDR17Zq83Ab4YjEUDNpCkU2ZH7zc2Ah8w3gR01zjYv9hvLjxeuPjBV6qnEf3QNSMI1Eme3EXlnC/HJBS2E2pEz+Mle8GxsMKDLYMAdMlzYptBsNFwSl4LXX09Tmn1L52cDgzdPubyFjwbkBnVhsgFwCB+mjo2sO/NpW843ITeSmqew1RoQyHNCb7fmeX5XNHiyMa12wxwHMQbFKq+h00Mfwo7LcqztzZxTQF1tvWh5k2JmX2/7sL7NE3dNajxxgKDeK0sUj1zGIYfnqceAg7xmCNrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HJTtS53KqXWzSsb6L/aY7JxQ7HTLL/nxzWH6d7AWRs=;
 b=PTcpgYVj90fu8Ydo45BjsHZbcDnoroWvZm4OXws+c8oH0HTOg8ub4B8QAPA5YIAat/kXCAN+C0CEhpCBufIGY2VfhLr9U0Ak9jsCiZ3+8QMvX8m2xHpCyUKpAycUX5lD36AgaM1vgu5uT7JJeXHEH5bNakHPwVmgSOciUrcKR5LlypgF+YvE56Zb3sTUWL3T9ZkfodVusDqaNwBMJ3UfBPYOKq+FC5UuOtvSzGEkSzrF+I3oY/eTDgtFLxq6/ldvh8G8fgrdmj/IdhcxAd5hqGEc9Bzobl6UZX2hfin0kB0zc+XFj0w9N2C3rGmbwxefHdQNXu0k3cicN/5aJ99Bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HJTtS53KqXWzSsb6L/aY7JxQ7HTLL/nxzWH6d7AWRs=;
 b=AWCa18bj25OjbEQWmEWhI2DvE+8idz4AYtH7s2w82KI1WnW7wDSZycHGSkCNtShq+l/oSEnUkTXJWmGqvVqTV611XN4+2g+QEP7l5CFT4YQqAbSUGAJrn1lFGH8fWb7PUVUhPA0DD/TRC+p+MTO/sTnnL8hSVUuztS90aFTZ8Ep1e5HaKJtwWQOoGuOGSGy+e44/vb1e0l4eL5s6UHEF5OAv3VS+9SJRTnJqF/T9mNFZWfMV8rpKH1Jb/sppmJAp+wdzmKJRCplH0witmOX77x5yhxSZaabpZyUXfn0QrxSYAhgo60rS1hz01iENnkwbyk3fc3oGmqxc4LH3Xp4crA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86dc868a-eda9-9de6-0430-26da6f5ad465@suse.com>
Date: Tue, 30 May 2023 17:44:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 4/6] xen/riscv: introduce trap_init()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
 <f4c4b711106283e26536105105892b93bb39ea3e.1685359848.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f4c4b711106283e26536105105892b93bb39ea3e.1685359848.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: f7830e53-0ad5-463f-853c-08db6124b7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FGni2YcmC81mRzE1mkHrv3LzMMUrTGK3awPjfFn5yMoCqSOIikzZazxFR9tUURtS6LS6czzpYT3rSf6efogKtuXB00UzuD+g/oNsP6K8vOvawtHn0sdhx5ys1aRrzCLhCGVFSJV58VDG8haJu4elN3kQaEqi7MIebGki15WWzKIKAv8a5h3qgUYYGqkBxKszbar53jJzfp8cvzmjv/HxKlHvmLReymGjowJDhZCrOIqznoM0W7X7OyLi22JoQflp5Bam858NTk/JAWMFcDkr8TRhg5gJww3RD5OeAhx59Cw/AL4mZH9Wa/8F9Vv2UrwX7IC6z+yTp+uBXCNiT8pKlK8ImHGbvJcFKDncbSYb6aqK5e/3LoUz3xUVqJ8rXmVrJF6eRKvfQVTOyY+O5ZXnFk3XKoPQzjZIP4oXrP9OnNdOfV3p+gPfsOP2IRmRZ14a0qxcF+cSC8mj2obtvEy4PAbIDwy7SR+gQXOMzOUCYGnyuE4feNCYdFj4suEKafiKdmYriTKP3fRdeGeRzQ3L095QiwyNJ4YcVoyymwOAOuuaG3loH4yrTpCp3Z/Q6uuYUbrSW9aJDTlq0GmATGBiODlx4eDxvEWKTEezge1gqfiKFJ2m/gTEmsNLYMPhJMmEfHdT9ztzmsD1Nl772hDzGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(478600001)(54906003)(8676002)(8936002)(5660300002)(36756003)(2906002)(31696002)(86362001)(66476007)(4326008)(6916009)(66556008)(66946007)(316002)(38100700002)(41300700001)(2616005)(186003)(26005)(6506007)(53546011)(6512007)(6486002)(6666004)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWI5RjlvSkNjSjJkNzNMTUh3dzByRk9HKzJYMDRtek03aXhOMW1SNVZPYTZw?=
 =?utf-8?B?dFR2aVZSRGUrc0RBeCs3WEI5UHQyY0JQbmtiaHdjL3JtUWJrOEg5T09QNWYr?=
 =?utf-8?B?UHU5WW8yZnRkNXNkQWNVWHZ0aUF2TW1uRnJRRUU2Qjl1bHl2VmJUV0FFVDBp?=
 =?utf-8?B?djNOWjU2ZExoVjVaQTNTQUovbXhoZGVabDEvZnhwV2lNV3BpaEZQbnlXSVA3?=
 =?utf-8?B?WmtVbmt5ZVJoMkdaY0dqcjdhZzUxbzl6L3lCVmdyYUJBUThXbVExTWl2dCsw?=
 =?utf-8?B?aE5tSDZVOHZQMGdwUXE2bFZkM2I4WnhqdWpFU3BxRHYxSmVnQzFuUm9WT281?=
 =?utf-8?B?dmpMaStnMGd5aFhlL2lPRENUTnM3QjByS0I3alZ1VUxzQ0JxaUcvdzR3dWdv?=
 =?utf-8?B?V29ING50NE1sb2lZK2owdWNPTEZYaDFzaUN0Q2VWaHFERkJXTmsxV29QWml1?=
 =?utf-8?B?a0F0dnlQZitJckpGdG8raVZrR3BjZGhJSE1qaWQ5TE9neFI3ODNneTVWTUlV?=
 =?utf-8?B?RElUM1hPNHBqdlBJMWdFcWVmUUNwSWlpcGNpOVd2bEovTThoWnlGb2NRWk5z?=
 =?utf-8?B?UEUxaThMQklkVjluVmJlNmFSdXZmQ1BtMjdtNDlHSW1RZVBTbTlaTzV0NFJn?=
 =?utf-8?B?TjdBYjVxeVlGdWFISTJjRldFdVIyMW13YlorcHdwRys4SnQwMit0VEtKR09W?=
 =?utf-8?B?R1VRMnVua2VFRm5pWUNRSndxcTIwYWkxU2N5WDh6YzFJMUcydHJmOVRobTB3?=
 =?utf-8?B?cHpha2tjVHZCZUMxbjdSRE83M0pMNTF5RmNzUG9qd0NiTWJsVnJBUXdjMDJs?=
 =?utf-8?B?eDF3c0hrT0I4bEZWUG1IUkJFanUwSWF2eVVJWmhvNU1Od1kyaEtwSGRaR1dU?=
 =?utf-8?B?N205L0xscXFyYjRHTlAyMmlyVUpaMlFxQUdnWGFQUEFiMDN3NkFwVWNmSkFu?=
 =?utf-8?B?c1I1dWIzV3NLVGRoN0VqZU44VUxuOHlWVFJmVHFuNTVvTkJjTGdnM2srQ0lQ?=
 =?utf-8?B?TWR0NDV1ZkgwZ3FiZks0NWVSVmZxRnZMMDc3ZXVmSUl3b2kzMTBBYy9LRGRD?=
 =?utf-8?B?VjJBZGl4Um5ERVErVnRHZEJRVUNiNkJob2xDSjNCTXZZdkkrYWpaZVVBWk9X?=
 =?utf-8?B?ZnZEbEFoWUl3Wk0xNGREMDd1emxxM1AxSmZTTlNZOWU2ckxIMmVTT2RCNjky?=
 =?utf-8?B?UXRKSWFQck5Mc3JZOFU2clNTdGdYNlJVbDBHVndkUURtNk9wL1JCNGY0YXpW?=
 =?utf-8?B?VXQyM3FTRlU5OFRwbVIzd0VROGdpbWpBQWhTMFpGQUVFU1oyYkZGT255S3Ir?=
 =?utf-8?B?cCtmMUZzQXo1QzFodFh2aUNNRStjdUtMaTA4emdoSlh4bm5QbUVUR3ErdHpK?=
 =?utf-8?B?aW1nOE5nRG55TkFsZ0x1dzVBNVZDbTV1d2p1OGY4S09zMDlUTjVsL3cyZmlG?=
 =?utf-8?B?ZnhwdFY3SDBNejgrcjRSdVBocXFUSVBuQWhQMFJOczdWTXMvK09CVFMvMXZo?=
 =?utf-8?B?anhEdVlZNGY0RGFEN3FCQXphYS95NEh3dHo5bUtqWkxNTjhWWVVrWEVxbWd6?=
 =?utf-8?B?UC9MeGpQcktGa1BKdlVwTnVXRGpMM0tRVDQzR1l3QU5ySnlSUllTTldPSkt6?=
 =?utf-8?B?QzEvaTFkVW5HZkVhQmpaWE9XRnltams1UnJlVXcvY0lqNm1JYVU0YUhzYVBG?=
 =?utf-8?B?Z1labXROUWVUK3B5Q1ZIZ0QyOHpzQjFyVmV0RVlSMGNwNTNmcThBUzNVNDF6?=
 =?utf-8?B?SzA3SU9DZWtWOG5ERGsyS0lDWEgza1VFbjdzdkYyblprbVoyVjNYUlZUMGsy?=
 =?utf-8?B?L2JJb2dVTmlOM2RMbW9VZ0VFUWZYbXZ2d21XOWR2eWo3VDlPUjRHb0hXKyt2?=
 =?utf-8?B?ZndrUDQ2cjFTU1ptVVgrNE5taTY1dVpWTXZTR3ZrZmd0WFNkSUprclBQbkVE?=
 =?utf-8?B?bTdScGRJa2hiT0t0cDBhYXh1T1QxZ3gveDVzTlp0cGFqdk5YRVlhZmxlNjN3?=
 =?utf-8?B?YlUwd0xId3prZG9HU1QxYytJL2ZHTW9iYXNwQkNscVdOZnEyYlV1U2FlNlRI?=
 =?utf-8?B?cExRUzRyMnhQRE92YkFRMXE3N1g3M1pSSExwS3Fub3UyN3JVWHlYZzgxNUpX?=
 =?utf-8?Q?1TwIfOs2LWEgBVgLpNoVRdsV7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7830e53-0ad5-463f-853c-08db6124b7d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:44:13.6468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3l7SWV7WZgseWiNdhtJ+1U/FXUtA4eyYdIOqS1223JdhOCgtALY3fp9F+0euSz9LqU3hoJgCYqWLSHUR7dKwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8149

On 29.05.2023 14:13, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -12,6 +12,31 @@
>  #include <asm/processor.h>
>  #include <asm/traps.h>
>  
> +#define cast_to_bug_frame(addr) \
> +    (const struct bug_frame *)(addr)

I can't find a use for this; should it be dropped or moved to some
later patch? In any event, if ti's intended to survive, it needs yet
another pair of parentheses.

> +/*
> + * Initialize the trap handling.
> + *
> + * The function is called after MMU is enabled.
> + */
> +void trap_init(void)

Is this going to be used for secondary processors as well? If not,
it will want to be __init.

> +{
> +    /*
> +     * When the MMU is off, addr varialbe will be a physical address otherwise
> +     * it would be a virtual address.
> +     *
> +     * It will work fine as:
> +     *  - access to addr is PC-relative.
> +     *  - -nopie is used. -nopie really suppresses the compiler emitting
> +     *    code going through .got (which then indeed would mean using absolute
> +     *    addresses).
> +     */

Is all of this comment still relevant not that you're running with
the MMU already enabled.

Jan

> +    unsigned long addr = (unsigned long)&handle_trap;
> +
> +    csr_write(CSR_STVEC, addr);
> +}
> +
>  static const char *decode_trap_cause(unsigned long cause)
>  {
>      static const char *const trap_causes[] = {


