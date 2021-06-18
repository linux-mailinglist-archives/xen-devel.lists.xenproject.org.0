Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CF3AD45C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 23:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144999.266814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luLvm-0001ol-IQ; Fri, 18 Jun 2021 21:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144999.266814; Fri, 18 Jun 2021 21:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luLvm-0001lG-Ey; Fri, 18 Jun 2021 21:21:38 +0000
Received: by outflank-mailman (input) for mailman id 144999;
 Fri, 18 Jun 2021 21:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luLvk-0001kN-Mr
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 21:21:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07bb0c4e-8f65-4cbc-a09f-fcc9ceb23d3b;
 Fri, 18 Jun 2021 21:21:34 +0000 (UTC)
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
X-Inumbo-ID: 07bb0c4e-8f65-4cbc-a09f-fcc9ceb23d3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624051294;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jYITn8QtPUJZPZ5DB3WvN3JE8VbLOCc8z5qLhy6WMhg=;
  b=S1qnVYXCdJ9WGdFkEp+AyXWIfef6d9yLiAGV2jUUMKNWsrEEE4nfAtUd
   GKPaqwxIJDGHQpYyOz3KEvEDIxEiwB5tehSoBYgsD8/lgO/59R5dHCDce
   41WDKpj6I25/laOnv/za0S5+9o/QeioW5P3nBsgGGExuJy5gfQuCFf2VS
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J12I5d3PmPlDZmswEW4cKV5kkwYAbsQGT33WTo15HzQzNWgX98HfS7rMh9ev7etvVWMJpgooml
 7XuoKwaBE8gwjyO3YzdOyZkCvZaJGNoO81T3u+A7J0QJcSDoAGMCYPRLUo5sX4WYMnq4oY1qm3
 rGsA+qKG4Oq1f0+U4po/FFHv3K7WsPkVVEtUFa0Ry8qUMJSVscnsYQCVZ4tKU9WmS4WBNnIy5h
 KuwYtQVSQPiiZcC/08EaLRMYVoUv3iY89p+5uN4WgIH8j2vTcQ+Z++rg1EhEFJOssTpmh/yiQu
 blw=
X-SBRS: 5.1
X-MesageID: 46564440
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1dGfjqyJkq6vRuVJGRRoKrPxteskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Fdmu1FeafN5DtB/LXHCWuDYq8dKbC8mcjC74eurAYZcegpUdAG0+4QMHfqLqQcfnglOXNWLu
 v42iMKnUvaRZxBBf7Ld0XtEtKz6eEi0/ndEFc7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpi/uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyCIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ+e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3xHklV6voIRiKrrzOSI
 JVfZjhDbdtABCnhknizy1SKIfGZAVqIv/uKXJyyPB80FBt7T1EJgUjtZcidtppzuN0d3B+3Z
 WyDk1frsAFciYnV9MIOA4/e7rANoXse2OBDIvAGyWpKEk4U0i94KIft49Fmt1CPqZ4lqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46564440"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLxtDKyc0D/Yj8s7uwhzyaNDutC9YTTdLYZTQxDazrE3rNVB8XEzCqaPMZ7N04MmtDwH4ZlE792tsLIb1jZFcs5fGaDOljdszjSZRnRawoUlPWhFhHNQ57vz/SzgJi8b3uW4HKLMyHXnhut38JSuau7LjbMTXCe6Sz3CVlufTi1K1Ogj8Uc6pJcIiH4bkIQNbXjNvfCw6RWhY04pSqIWNZN9q+6/rrbIPI0Oked2Pd11yR3WidO+s/k4eInEAzUXoPreSUA8GjmHOzbHFfTE9f2CVfu2KfEAy0bX3dUeC6p8MJAzFYrNu5AQmtm2b9WHsIjd0LRts95eAyp5mm2lxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTA8X8eMw2UWAV74CePqAm/QBBr6ZrD0qMZ6isEI8F4=;
 b=NdlVAtwCgvix6oavZdc3j+d/Iwd7GmZJg6z77HMASzodBjPioiNgrjWMHbshTy5qiqi86pxgB9VEbvK7MkeTwQUYu9gq357y236Ih5a+X4aCyWq1kfr2Sdh8ZIyclj6d06eNtISZ6rF4wZFUsTF4i3Hg7wf0E4p/YhqqcsLYJHi2Fcqk0wrBXPpw4jtvaZ5QZBuWwVDDejj9axwHA5XBrB3X56ZLZCD7hpcPvYS9gP2WsYL6NlOMY3OOoUc0y2szaVLKeMV/2ktl9fBmgfXjBOpCcneK9mH4RTN8qSFLZtS9kpefUZeoFjRBtw/qKRtw6epROWRPBXXMuNCSxOYssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTA8X8eMw2UWAV74CePqAm/QBBr6ZrD0qMZ6isEI8F4=;
 b=lEenhRYFlW9czaJlbM5DBy7GOpWwGcE3Gx6MrgpoTUxE07pdsIKjm8rypBmb7WsI1t0ItgELoi9zevIS9tEus1tzTIRAh4AUNFdIujoUSTKQimEh2QaqO3JKhUF9ara/7+eO7JGzcNDYi/G3G9arfsWMwABNwgZyBCbEqJI9pbA=
Subject: Re: [PATCH 0/6] xsm: refactoring xsm hooks
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>,
	<xen-devel@lists.xenproject.org>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <7219a9c8-f6c0-a86c-bf47-5b38c579170b@citrix.com>
 <b921c150-84f7-3ab3-1e4a-89d00725d9da@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6ed12320-f454-2751-1a41-014eaa835762@citrix.com>
Date: Fri, 18 Jun 2021 22:21:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b921c150-84f7-3ab3-1e4a-89d00725d9da@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0043.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::31)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f75df53-40f6-4b3a-2155-08d9329f09e2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6391:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6391B1670E144E2ECE232025BA0D9@SJ0PR03MB6391.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+LeLSm4VpBEncSpJ9qLm8PQJdTo4RYi0LsTTRbAUWckvrEMwzAiNC5AnykutpJC2BPjY4d4cPvQzZ29eXPYJOES9Fu7KDxhtz9vu2v3F5bbNZ3Yx4x5yvibcupIrjEumdLdyr7XqdFWV7V9PksMmK9XPfoWcM7WCDMiijEzUjs2T46XyBj/v+8c5T0rrdh1/qm3NEm0unRnZ83Zj0a7swuz/rbCC2JuucOedYDpO0b6Bp5FnDFluanFdxM436pjJf3LWWX8G1X3uwnKlqf/DDm3SohpHnS2DHY2qY5gKcKNwAFcY0pCkeskFWT0di2uHQpOx8NKA+cRB9IGpUgapzgCxOVmHeDXRsVwmklfsskL3F9eYNjqlNLWZCpk6BHVHEghQtXQ1okbQJ3sJhje2ehU2QfMW1HBbhIFLYVUbrXppY+C5R5o9IV22hSz0sEngjXctQxBLe8LO3FtWg3vBki9fFeJ76Y2TJjr90TbpBcNN0XgWRo9tJFve9wX3yBBjuh9ZktV0+jlB6Fvvg3DQ8TxnlkdUZKvsp/u1Og5moCZZJ94K3qDxCzuoOxiQQ2MA0FxrQ9GlkoczFraqFGaqlULdN93XMNs9eq6h7Lu8DJsTeCmYf1PBZKrgioWLEGbC5d9K/v67ndVKTbA2luhZywcVkD6dnB3wYcUIo4+M4wF1yOm0XiMv93/h6UyCvIMRDsewlDOLMgmDG6WVWdgNS8Zr9qFWZ185LnsLHyRUk51qqcXyL1Jnk8M+kphc7eFK1au1Ogixob+xpYOfhXaAXfo2R2rpLYpkpixtGjRMEPYXsfGgC4CmNSNXwK1KW4W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(2906002)(66476007)(316002)(7416002)(4326008)(31686004)(6666004)(66556008)(31696002)(83380400001)(16576012)(53546011)(86362001)(110136005)(2616005)(54906003)(6486002)(5660300002)(8936002)(956004)(966005)(186003)(26005)(478600001)(66946007)(38100700002)(36756003)(16526019)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWkzRzE0bUVyaWx3NE1JUzVrUkFUWm5KV2lMSVI3dm5UZEVDekdFOHJpUmt6?=
 =?utf-8?B?UE1qR01qaXFjaTRRdjNJRFVyQnRVVEdJbnNlTi8zZXlMSVh6aXRyME4xT1pU?=
 =?utf-8?B?TjAzM1pici93UVRZVytpaUI2U1J0QTREaytnZWpNVlcxRmFibFVHTWdHeThN?=
 =?utf-8?B?U3puVTJkQmQ1RDdVeXhWK3pJdjM1dEZxWHpTbXZTNyt0anBjVURIYVdaU2Fo?=
 =?utf-8?B?L2o0TUFLb1QyRUg2c2xGb2EyZkl4L0ZZNnNZeDFOTVM0NUZTank5cWdyczhn?=
 =?utf-8?B?WHVGOThNUmpSUmZ6TDFkUk5tdXJEVmlRZStQYS8zaVVxcHkvSzh2dGUrYjNp?=
 =?utf-8?B?Z3AyVUl1SDQrYVV2YW5JVmV6VW9xZEVrdEVaTkQ5Z0hJaXhSZ01pcWZEZ0Zq?=
 =?utf-8?B?d3duR2k1SVFMbmhmcElRdlNibnVzV0VhejhUUkE4UlBjL3NpZ3RPOER4Wmcy?=
 =?utf-8?B?SG5HR1JleU9YYk5WTlhubU1qZHpielNFZzNFd2tPVi9TTHc2U0FDb3NvTC9B?=
 =?utf-8?B?Nld0T0N6VWN6TjVaNTNnRGxUNmRJanRyMVVnbTlpbjhISTIrNzZMZ2FZYVFm?=
 =?utf-8?B?RzJLRzNLbmFlVGZQZmZsS0lIWHQrWHNqenlqNnZUMGNoOXRIVFZqSU5SQ241?=
 =?utf-8?B?bEkrZnhtT1kxOU9Ec0RVY0EzQTc5VHlSNHF2R1hObmo0ZjIwQWN1RVg0N2Nm?=
 =?utf-8?B?UGhDQ21VOURaOUY1Q0tqQW1QT29hYk9xcEoxcEVVcW9ramJpRlh6SnBqNVdN?=
 =?utf-8?B?aG4vQUJJL3BwNHQ0U3BmQTd6ZUxDcmNnamUwMU1uaDRkTFVYdlVxSUMydk9M?=
 =?utf-8?B?VEVkT3dNbFcvcGhVeHBhODdXR3pidXJkQ0g1SkIyTmtENUlPVHFHbklVZzFN?=
 =?utf-8?B?M1JDNTFZSHUxZmlGMW5ZV3B1L01nZStVY1FnVXU3ZVdYUVpxSExhS1RWWUth?=
 =?utf-8?B?SGVTd3hwVFE2ZW1DN0F4NERWVlFEWjliS0xJaGVGUG4rbHZGMFdmbjFDblRn?=
 =?utf-8?B?Q2k4Q2R2ci9uRmpwbDJyUDJ2VTB5NTlKTFp1NUxTUTdCd01PZSttZGRabDZ2?=
 =?utf-8?B?cTZWb0hibVliU01NbDVTM0U1VVVIWjR2dVdWU1VKeHFpRDN5NmJjR0h5b0hj?=
 =?utf-8?B?cEJId1BhUWs3eHd4ci84Z1BkZnBXdWwxTUtudGNnTXV0UW8wVldNNkxxQTdr?=
 =?utf-8?B?Ym5QWFp0Mi94bVg2My90Yi9lUmFKeTFsOFk2YVROaWp0TTFLYXUyenB6dXNw?=
 =?utf-8?B?dzlaZFdTdW9TTHlUVDI1RzhCMnlVNDcrTm8vT000WlEramdXN2ZFRWxFdzhW?=
 =?utf-8?B?TERSMEJJVlNsTzBqWjU5dURMVGxja1J6WEpQcjg5bjdsMGtOTDJlSTZ1UVdH?=
 =?utf-8?B?N3RrNFZOYTBYdG52LzMyVXY4UEtmb0JwUUJobWtsMnd0SXpUTFNRVHJ1b3p3?=
 =?utf-8?B?YXZiMHdObUowZFpGZUFUMUtXUzJKYmJMdGNheTRkRHFONnRJdnVYYjIyK1VK?=
 =?utf-8?B?a2lFQ1EwSDM0Rmp0SXJLMGpLTUx0cU4xVEpRejdXalNvZFVyd25uWkVUNS9Q?=
 =?utf-8?B?TG1MSkpGOTJwa2dzYzlSdkFaOU5zMG9aZ0YxcmhyeXBKQXpHUHZ3bk1IcGpa?=
 =?utf-8?B?MGFMYWJqMmsvSzFIR01NWEdZUTQvTmd5QVBrN3k5bmkzb1hNWFhJc1d1dEJj?=
 =?utf-8?B?cDhnam1YNS94VkZtTlhoMUxkTXRmeGs3c1Y5eUZQaDRaZFpPTzhVZHMxbnBY?=
 =?utf-8?Q?2wTaZngdjzg+U0neZjXGPFYzWnpVYaBnY6n87xU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f75df53-40f6-4b3a-2155-08d9329f09e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 21:21:30.0527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckva34l5629zYGO8296rUw3oNx8u77QAXCnqVT97pC04PPqBculq2YaJunJABlVy9Sgc6C/tBv5LUUYp3hFM/X2dMYMCZdj7gx3md1Ifqxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6391
X-OriginatorOrg: citrix.com

On 18/06/2021 12:48, Jan Beulich wrote:
> On 18.06.2021 12:14, Andrew Cooper wrote:
>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>> Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC
>>> patch set is being split into two separate patch sets. This is the first
>>> patch set and is focused purely on the clean up and refactoring of the
>>> XSM hooks.
>>>
>>> This patch set refactors the xsm_ops wrapper hooks to use the alternative_call
>>> infrastructure. Then proceeds to move and realign the headers to remove the
>>> psuedo is/is not enable implementation. The remainder of the changes are clean up
>>> and removing no longer necessary abstractions.
>>>
>>> <snip>
>>>  51 files changed, 1309 insertions(+), 1413 deletions(-)
>> The diffstat is great, but sadly CI says no. 
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/323044913
>>
>> The problem is that ARM doesn't have alternative_vcall().  Given how
>> much of an improvement this ought to be for hypercalls, I don't want to
>> lose the vcalls.
>>
>> One option is to implement vcall() support on ARM, but that will leave
>> new architectures (RISC-V on the way) with a heavy lift to get XSM to
>> compile.
>>
>> Instead, what we want to do is make vcall() a common interface, falling
>> back to a plain function pointer call for architectures which don't
>> implement the optimisation.  So something like:
>>
>> 1) Introduce CONFIG_HAS_VCALL, which is selected by X86 only right now
>> 2) Introduce xen/vcall.h which uses CONFIG_HAS_VCALL to either include
>> asm/vcall.h or provide the fallback implementation
> A word on the suggested names: The 'v' in alternative_vcall() stands for
> "returning void", as opposed to alternative_call(). It's unclear to me
> what you see it stand for in the names you propose.

Urgh - yet another reason to prefer the Linux static_call() infrastructure.

Would a general alt_call name be acceptable?

~Andrew

