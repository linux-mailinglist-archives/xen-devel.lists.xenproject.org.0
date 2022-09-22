Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A025E6A37
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 20:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410425.653399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obQUa-00038A-Kd; Thu, 22 Sep 2022 18:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410425.653399; Thu, 22 Sep 2022 18:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obQUa-00035w-Gy; Thu, 22 Sep 2022 18:00:08 +0000
Received: by outflank-mailman (input) for mailman id 410425;
 Thu, 22 Sep 2022 18:00:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1obQUY-00031O-EI
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 18:00:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150088.outbound.protection.outlook.com [40.107.15.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62d1a23d-3aa0-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 20:00:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6822.eurprd04.prod.outlook.com (2603:10a6:20b:108::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 18:00:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 18:00:03 +0000
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
X-Inumbo-ID: 62d1a23d-3aa0-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KC+mHbrzWii3ebYyNjTR2HnKUqSYEvuiS6Tkh8/OYofO6fvQ7eTNwlVW5a67n6f+3K9Zx8jym/dt24mAMNnVcAOjpuc6LzNl2Y2CAi1H/8zNnrn2V59MKGsniWTyqpyA2JdpIjD/F4m4jc+fwdw91DN080AVyCYCrbndKUxGsr5PkTe6pbaFZ2n9kn1warjfDuY9KEuCvHmDrwrh93B1Tc+Am0v590Pv+tHegzjit3eejyft8x3pCiil3d3RBai/tIeX8MmndMySMS26XpvhC9+gz7WGnGubvqhGX/7I0vuxEmAg3l3fg0dmZTNPSceJv6/KKQAiL2Om85Y5mPxOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xi5rwIE4lCmJseog6Mrv9gQQht4AW38k0otLebEJPMI=;
 b=Qm+3ur6YGLV5FCqGzlz3chr7b3jfk/kY74Up+qH5zrR/1RjxIn5X+yO8YxkR4C5e/y7Np8QXhAn/EusVMtzcXdttANt0Q+yei8+aRV/+TQQkzok49Hd6vHirO2HDZVFiiT6tnZd0nAKrdgx1vxQeh7r0co6hpT7UegIKx6g3GD8V/sNKuuiQnWSe3RtJrreXT4YklM9vhlB6tgjejz22rg3XdOmVAnhUFx/wOk/4mshlm4OhKAfwCprvXLf9ZAwoHKD1ZCPMkzbrEqjtus5phr8wpsT35jkrOTWlljD1qYjYz3ui0uQt76bxXbkoCt03aVraBUjlFTWndMFTh0P3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xi5rwIE4lCmJseog6Mrv9gQQht4AW38k0otLebEJPMI=;
 b=OA4MJghVI3yiESr598Dm+0F2lHKZPp0Do7F7DyGwYMr54yn5iIL8fl+7Q9KHvYjnay1heh3HS8uQCKgtfuch2hna2IBkdYJhDf3qX6Ka1jV58+aX45HB2JrXnl7+cNLjBr28vK0w0QU+mxQlq1PzkoAEsdrHoeDeKhqm5qEC/VICmJND+xp6ACjdyNXUw1Xu1ttVsDrvs/e4mzO9bSq1CkcrMMvtL+kwEqRL/17PUiVQHMkONa+ly58bNOluURXgjW92DvoFg2mJtTg86PpxGr23Imupub6F4IcMQMDm1vRre5LyY4Ztu+ub108/LZARtb5e6e9pCjpjtspFjJXXRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com>
Date: Thu, 22 Sep 2022 20:00:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e568f2a-8946-41f9-671d-08da9cc445b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PY7dtbvfrfomCuoOJo4L8b9YoX2RcCe1T8CJR+qpg5Cw3dDkiecRp/nlsPXwhhNpeNgCorfPlGtfLaqVkWvAIxxsAo4Fzts8oQLuP0U25TuGEXbwwOZ6zWnICwQSRP4epeuyLRQNTHM/+0pAfn9QVE8EZ3MBt1tnq/VTrp82oFv7zOXHb69dYDuLWiQrfVzFE/y3yyLgNHkzjy9VKkGViKWo3G2r5FsQLzklPzvGVHbz/f8EIW7kP8Jnew81dPmQVu0AZ2X0D9suPAYYv+k7nZROlT5F7tzLNaR8EPKv64gvEPPQJcLE19StSaSosEcttaIcItoE9G7q+xTUjJWNrflfVTLsn4GBCz0fVSCSAxIBIL9e6jasMMbcoc1mrKN4yEfiEUdjIoMbLvnjCVHr90ryK57WggfUObb4oljRqnQLnV41uN1tG82xsnB2zjJIYeWv+IwloYew/cshUFT3knbxskgI1gJEFoOV56YJDzbgKn/txrZr3driZTs21K2++Y/U5n+BGzPafzj5+04ogf1zdhOvya8HRVEm8fUhX1QPkG9owbVDO6OLIN62Fps/9dssUq1rChdZ4OYgH4BdFrS3MTibXM9S6SHBwEgiQ0f5K3pEw8X9EFsJnErOPM6Z/2QGvUFUUAmXU+4Biy33j8xZMrFIlJQxIVhGOBAnlAf1ypL5bo8xZjPPHp/mC0r/5DqKl7CS2z5JuiT8fF7Cbd/0se5ETheJF7DwQRagqOpLze/ZcejyzD5eF1hhGaKy16uLm/1GEGDGtPQZnhDilXYGEjEAd5UhienDsoQbjiE3aIfO4vYttDDPDBwt8OmB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(31686004)(83380400001)(2616005)(186003)(38100700002)(8936002)(5660300002)(41300700001)(6512007)(26005)(966005)(478600001)(6486002)(6506007)(31696002)(86362001)(66946007)(8676002)(316002)(66556008)(66476007)(4326008)(53546011)(54906003)(2906002)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVd2OVJkMHFaZlczYzFFbkY0cHVGQ1ZQYXRzMCsxL01Ma2pCWGZrRC91U05q?=
 =?utf-8?B?bVNYaWVvUEJlbHE4SDhhSi94UWhLUTVaVGg3U1JwcHZQK0ljaEN3WGpKY21E?=
 =?utf-8?B?QndvWm9Cc1JxNFY5d3NrVjZyVTFWbGNuYzVnUVJNcUxCMlNTNEZJQ2JuYzh3?=
 =?utf-8?B?MWtRa1JVUk5uUEFqM3IvSUlzTFBVUnE2LzZFZyt3R1N1L2p0Ung3dWdta3g5?=
 =?utf-8?B?M0pkUmt3b1I1ZHEyU1N2TWVyRXBIcGRpYzJpL2dkekxZYWp2ZWtLMTM5VGNZ?=
 =?utf-8?B?NlR5RFRubjErSWF3UExNVFpFSWRlTFZVTklKTitOc2ZtbmdwRGNSQ1VRYlF3?=
 =?utf-8?B?aFRJbDJUcFpJcWwxV3ZhLzNyQ1lZZE1LaE82QVk2RmJ3eDc2VHp6U3dlVStv?=
 =?utf-8?B?QmJjYWpnWmxRbGN6ODlCTEpEb3dLUDRKcHJJYXE0dnlUckFVYnE1MmhVOWRr?=
 =?utf-8?B?ZUFqYzRLY0IrbXNyM3g0bGFkZU9sT0VRU2FOZ1lWaTgvdWkzM3c0dFJPRWlM?=
 =?utf-8?B?S3dMWFl0Yno3aHUxc0JMU1prR1VneFFxZ3lkWUdkbEdvRGZuODhFTTNYRTdR?=
 =?utf-8?B?NnN1MjB5TGpldzhTOUFkQmYrUERFUDdMaFFFYXJjeGxIRnZKZ2orLzEwMEJK?=
 =?utf-8?B?dUtrQVBvM0VacEFDcFJ6VncxZXVUdmVGalA2RFZrRFJLNEh0QUY2ZjlUWTJC?=
 =?utf-8?B?OENSYnQrK3VNSXFhRW9CYmFtT3dHZ090NDRuVTFUbHZjcTVXZysyR05rM3Bw?=
 =?utf-8?B?WnlkbnRQVWQ5K0VpbStwNWRma2pOaWxaVUlmYW1ZbmxZSFY2RHBSQ3dKd2NR?=
 =?utf-8?B?b1dKUU1aNHltb0Z0eFVML0JJb0NTWE5uWEc0N2pVem5qbFFoQTZ6Z2JRWWJw?=
 =?utf-8?B?ek8yenJId3A3ZGdRaTE4L2hWNXVlQUhicGFGMEhZN1NPRlE5R2g5WmVXN2Q4?=
 =?utf-8?B?NTFILzRzclp1cEVldnRmQU1sZ1l0THRGQUZZNlprNkw3SG1hY3B2VytwZmdr?=
 =?utf-8?B?Y3R0SksreVVuNndFUTArZTk0NmNIUTh1bjk4VUIyY3JjWFNzcFlhbStTb3lD?=
 =?utf-8?B?THNjS1VCVzN6Y05IT1dHeEVIZlIvdFlGQzJvaUNwN2FGYmtOUldPUnhEZVBs?=
 =?utf-8?B?eUg2dkY0YWkwaENjQy9oRmFaUVVhQWd4cFViTXBLMGlJbEtQU2RTOXVFcUVJ?=
 =?utf-8?B?dkN2N1NPT0w5ODcyRGpUOXk0ZVA3YUhZc2w1SDJUUEJrK2c5c0FBZzB2WDhL?=
 =?utf-8?B?SDZrNFhxWnBQYXg1ako2dDkzayt1UFJwNGRkakMvbEpBS1B3TlJhUmVFSG00?=
 =?utf-8?B?L3crc1VBaTUvOHhXeGcwVTBTSTBKajVyUVpURVJ2TWF5ajFyVENya0k5aUs5?=
 =?utf-8?B?QjFxU0UwVHZ6aGdVL09LK29xUnNwNllJQmV6c0V5YS9IUXFzTjFGcE9taGtP?=
 =?utf-8?B?cVRkL24wbGllblNtTmttUkcvQkl2czNEUzJTVUlCNjVMbTFvYS9rWGgxQnpt?=
 =?utf-8?B?R2VSRVpMNUR5VnVoK0x4QlRLSGRnNnE0dG9kMlR5ZUlNRXM5VTRvUkZvSTNs?=
 =?utf-8?B?WThuMEM0ZU1YRHJaRHh1Z0RWWXRCb2tLK3Z6VURaVURIdVdsQ3F3VmJGaGlH?=
 =?utf-8?B?aVJzcmUycGVzMlRycDJSakUvN2xESzZjRGFnVkdySERRRUNUVmhqSm9PS0JR?=
 =?utf-8?B?UDJIcUFNZnJNMWw0L08wZi9IOUhyUGo0VDFORnlZZGErTHg1NnZUSVRxVDg0?=
 =?utf-8?B?VVgxMWpaUWhTL1U1bDMzanE4c2w5MHZBR0ZrTzhZYTBoT2VRbkMySmJhQW5D?=
 =?utf-8?B?dXJ3YW94djZVTEZROGdDZHB1OEtlWlYyWEtNV1Y3ZXR4RnFzcmJGR2k4UEwz?=
 =?utf-8?B?WFZEMWpHbmc1VXBhemJoVnJlMGwvaEJDV3dmN0JacFVUTEtIUGlZNmkyc29V?=
 =?utf-8?B?NVYrbW45bUk0QldTcldwNnEwYk15anFiUlVwN0NOSitaMy8vVi9icXBISFpq?=
 =?utf-8?B?NitIdXZZcVkrOWY4WDkwR3E2cjJwaXVZTzFLNk5TZXJVQndwd2d5dlVIZFE4?=
 =?utf-8?B?YVZJZFJaV1VFVXFjSUVpdHMrbUg3U29aMFFCWXdOaVAxVStzN2ZuMFovTFpr?=
 =?utf-8?Q?/p5j9LQljf4nbTd3As5NfoSG1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e568f2a-8946-41f9-671d-08da9cc445b7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 18:00:02.9141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JADjBqixK+UgUbgDlt8jdXGAPzMkiXhYSN4QhhYFP5tz0SEjOydQKDfzjEPtKHhmovFFn0d9/PUuoinpMENYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6822

On 22.09.2022 18:05, Anthony PERARD wrote:
> WARNING: Notes missing at the beginning of the meeting.
> 
> session description:
>> Currently a HVM with PCI passthrough and Qemu Linux stubdomain doesn’t
>> support MSI-X. For the device to (partially) work, Qemu needs a patch masking
>> MSI-X from the PCI config space. Some drivers are not happy about that, which
>> is understandable (device natively supports MSI-X, so fallback path are
>> rarely tested).
>>
>> This is mostly (?) about qemu accessing /dev/mem directly (here:
>> https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579) - lets
>> discuss alternative interface that stubdomain could use.
> 
> 
> 
> when qemu forward interrupt,
>     for correct mask bit, it read physical mask bit.
>     an hypercall would make sense.
>     -> benefit, mask bit in hardware will be what hypervisor desire, and device model desire.
>     from guest point of view, interrupt should be unmask.
> 
> interrupt request are first forwarded to qemu, so xen have to do some post processing once request comes back from qemu.
>     it's weird..
> 
> someone should have a look, and rationalize this weird path.
> 
> Xen tries to not forward everything to qemu.
> 
> why don't we do that in xen.
>     there's already code in xen for that.

So what I didn't pay enough attention to when talking was that the
completion logic in Xen is for writes only. Maybe something similar
can be had for reads as well, but that's to be checked ...

Jan

> Issue: having QEMU open /dev/mem within stubdom isn't working.
> 
> We could look at removing the need for /dev/mem by improving support for qemu-depriv.
> 
> hypervisor configuration interface was intended for one domain. having stubdom in
> the middle makes thing difficult.
> 
> See QEMU's code
>     https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579
>         fd = open("/dev/mem", O_RDWR);
> 
> TODO:
> step1: Find out why qemu wants that mask?
> step2: identify what is missing in the PV interface.
> 
> QEMU use this to read the Pending Bit Array (PBA), and read entry in  table
> 
> comments at L465 (of xen_pt_msi.c) doesn't makes sense
> 
> Xen could do more fixup
> 
> passing value from hardware??
>     can't pass vector to the guest,
>     xen overwrite mask bit. (or something)
> 
> Did MSI-X worked in qemu-trad in stubdom?
>     No one in the room could remember.
> 
> MSI-X is required for pci express, not that thing are implemented correctly.
> 
> TODO:
> - get rid of opening /dev/mem in qemu
> 
> 
> Cheers,
> 


