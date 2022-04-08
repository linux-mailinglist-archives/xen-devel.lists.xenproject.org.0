Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551EE4F94F8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301461.514477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnGZ-0004LE-JQ; Fri, 08 Apr 2022 11:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301461.514477; Fri, 08 Apr 2022 11:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnGZ-0004JC-F5; Fri, 08 Apr 2022 11:59:03 +0000
Received: by outflank-mailman (input) for mailman id 301461;
 Fri, 08 Apr 2022 11:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncnGY-0004J4-Cd
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:59:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47731534-b733-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 13:59:01 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-2iZ1LtUiOvGJrsYPBrCVdg-1; Fri, 08 Apr 2022 13:58:58 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM0PR04MB6179.eurprd04.prod.outlook.com (2603:10a6:208:13a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 11:58:57 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 11:58:57 +0000
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
X-Inumbo-ID: 47731534-b733-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649419141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K069cJ/0fzb1j3nlccwM8sH1TZx0KZliOM5PfUVmheY=;
	b=FMyfFv/++m2LfA3wradxRlZAWZyBDu6BC7QUwgRXlsDyPKGakrarcDOSsmm8eGZgs+K1VD
	xD7F2U2sZ2Q0pircLoiAiyBmyFwBYo6TKeLv6EZl1qklEEcUD6o2gxQ1icad7wgv5vIb2T
	oCV+JmkRyq0wz0bEnpPkOSun75VXeKI=
X-MC-Unique: 2iZ1LtUiOvGJrsYPBrCVdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZHYPR27/DlfsMxIZq9eHnTZvzeRcCbBApMPneaXO11JUldFX33sGokcrCtlJR6lfnhoX1xebYRfaUrfXc56gaNhpZMzGAuiFwdOBRa5FbbUx7QWLIN7tf2DgTn2Iy43bKyZBTDZdPXbIgTTD58t7tTnk85k9R93JI7atscZ4PoReMz/2Z4UMAov8wo4nhFSSL4kz1CKvL6frfVt3V9DZpco1AZi2w4U2nIZwMZNE6ijoxxYYMCLJVgWWpBZPN3O+NuVFu46NX8Txa99iHqwEc0J1wkH+uIlgBL7zUkFBzDUKhpRVf1kMJavNeqAAOa1pkc6d0zgTgp1+EllFcaWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K069cJ/0fzb1j3nlccwM8sH1TZx0KZliOM5PfUVmheY=;
 b=NIWbNgPS8vSe35iOll22Aw8WI8MRob5FZsxmjb1Mx1P0wtCfJDsI9oUrSXWzi2PU5DPqQigBxzhJ7PMLkJQwtgbpcxswQk87L/s0YD+vuH6243feQzHF327G9mzynzpOKoSa2fk/8GMGR4nPnLRNuz4s4VytkIjVOJggNs+YK4b5HQU/9u1QXuakoea0QqtCZWQ8FU4ZtqJlvuIC1GZAfqNAva0I5oEER1drj8wFo+YcBSDL6AUHH8zpfenDk30az4zvEC1z9yFCOqlbQnfSf+8fD79BX/r5l3svHPPHkld5k3tzoKqWSeecZVq1jUhTPNr0ZKjaBSpy7vY7yhXy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
Date: Fri, 8 Apr 2022 13:58:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
 <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0156.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::13) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b50c709-72f9-4534-8a5e-08da19572962
X-MS-TrafficTypeDiagnostic: AM0PR04MB6179:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB617926C9B69749E950F0F131B3E99@AM0PR04MB6179.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cVsibcRr4Gshgb4KN9pOpRxYBS6L0tG37VUEUpy5ZoZxNm1wNMm0mxhigQmf3gs03/AKnu+dTCuYMxUvaA6PN4kMxBhks8cte+wvOuz1rK3xF+y9uoeI6GsVm/J5WPyDb9LxOnblwSH7iEbdJtc5F8pmiAOpp2PwtzjO6JPDp1N0VN9DQJ/kjFLyc8TZ2qn3pF1hpGQ7OTiHBQcwigpkpHGbOjoGir+fVP/xxAjDWmnZN//5uN/1OC/kvXDVPLsQzlJqzCwVQi5zHdpL38lGpqnIINNwIxe7hW55g6qReaG7kpodXSddeg72jLJNhC1Qqy0dTNCC12OCq10wkAGSy7CZCcsLbibWVYyO9eCI/CP1KQqfRlr27B+5si8ivWmj5KSBW6XUKcV1xbsyDKImpGTaBH6EPnFB0BdbztTYQY9JUd4ZrFiQ3ULSx6GDHkVqefuSUh9JnHMkwrEiima6Q2LY2Jt7Z024al1vAShwTo4KzeVBWVLUuqAMfQoOm4aB9IJq3lt//eupkXGWA56GCU9IQTZy6OcKD9UBfwVDn+2F9wp/KjqRPnblSTBwMclaPWGODSNJKaywV9aPyScUfCEZDR2Efqcx7PqOTCTSVQTdTUF3qbl1tdR5bKdfKil2ujDmwPDWlOOUGfJB/tahzKvNV6y/wZebX7VFh6gwGqZA2yijcDZS5YCmWll8GGk7fOSSzEKSHUt1oTLITEkuD7DJe5Ic8t8peF5h3DHIr0tAVB1A0mWmgJMUzawGKnWA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2616005)(316002)(31696002)(36756003)(31686004)(2906002)(6512007)(6506007)(186003)(26005)(83380400001)(54906003)(508600001)(5660300002)(6486002)(8936002)(7416002)(66946007)(4326008)(8676002)(6916009)(66476007)(38100700002)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUwxYmY0U1pxTEc1ejZzRzlkeDVEeGcyMVJCWkxFYU93WVJpOWZQSmQ4MWxI?=
 =?utf-8?B?UjVmWDRvbTJLZDVyY2FIUHhBUGd2Rmh1cFhVYmdiamMxdTNOSitxWUcreFFh?=
 =?utf-8?B?NUllVUNVSW9YcWZHWDROb3ZlUnBEcndzYmJjTjBXQmRETWtQdUJqNXJvaUhS?=
 =?utf-8?B?ZzZLQnBsNG5UNm9OL1M5TTFmc0lBR2JWSzN5cnNZcnNuZmZROGdQYkVmNGVy?=
 =?utf-8?B?dWFSNUVxOCtJSGt0MnZRWXBzSTlVb0xJNjExVWFwOWphcWZpWVpCck15bTB2?=
 =?utf-8?B?MWxBNGFGNXdKakVzbFM2MURtZVV2V2hERzNUUEg4WlUxSUVlOXBnMkQrVWs3?=
 =?utf-8?B?c29MaHdUVEFJaGZrMEZnQzRqVExRWDU1U2VKSVNsc3A1R0lPSFZwZm5DaGhp?=
 =?utf-8?B?bU96eU9nT0l1ZDB5c1g1Mm5wUnFrMVZZNlNMZkphM2RTM2J2V1ZBYm5rSnZk?=
 =?utf-8?B?Y0Fqc3pjSHJUM3VnajFnY1QyMmRKcDFGeU1EaGJlYjVvdjNrNTFSTVJVWmxw?=
 =?utf-8?B?S2puN0prY2ZXU2Q4a2xCL0dMM2VXMmhGZ3J1UUpPeTJ2MjhaWi9pUjdpdDdI?=
 =?utf-8?B?UUYxSzJleDhOdDRhOU5yaVJ3M3BpKzFLK3VaYVlUd2VTalZhOEJoTFJ0K2JQ?=
 =?utf-8?B?RjBkVWVPbnBjL21JcEI0SG9EbjZEZEt2SWErWitVSjB5RGZWeXk2c3NGUTBH?=
 =?utf-8?B?cGJJWHZnc2Zkd1dGUCtjUStZT09UQThGbWROKzh6SlNuenpmYmh3TkZiTHBw?=
 =?utf-8?B?VDVlcEJ2YW41ZWllbFlpR216WjgxNDdUMUR0dldIRmhML0tTeUdUbXhMN0RD?=
 =?utf-8?B?MzNPeXhRc0pOV2dKMUpKQXNQY252amJBZ2h2L0RlT3AvaFM5MDdWL3M4cDU5?=
 =?utf-8?B?aXQ5dG5mamNwallxaXV2RHhFSXdnY2lZeVJnTFdKNS9wcnlCdnFXc2cvZ2kv?=
 =?utf-8?B?bDRpRmNDSy9SYm4wUUlBRnQ4VEtTb0Yvc0ZTSUxpQzM5RE1HT1NoNkpub2lZ?=
 =?utf-8?B?MDVZUTd2WS9iUzJDTzJtZVVuSGdMckJMdDF1elpNNFlaKzZYd0JjZmV5K2Ni?=
 =?utf-8?B?Y241a3BlUUozRS8zMXJIT0toTmk1eTIrWWR3RTVlNjVaK2pQZnE4cC9UU2Vw?=
 =?utf-8?B?Wk56RDExWHM3SWtSME04ZVJ5SWFKcWdIT3FBbVh0RnpCN1RMNFgyUUZBSVZM?=
 =?utf-8?B?TTZrbmFqSW4wM0NSZlpuUDNocjFUN28xRW5CaWFJYmtSUnJWempxYTdWcjRw?=
 =?utf-8?B?NnZIeVFvTUtONFRWRlNsSGx0amR6ZUx6LzEzWDh3UG1yUDJqNllJc2V3QjRS?=
 =?utf-8?B?ZHlkaGpZSEJxRlJRWHNFQ3Bmdm1KMmNCWjg4RmRLNmJmZ0xzWEpUWDZjdTdD?=
 =?utf-8?B?blMvVk0vcjFsRVJPQ2k4TEdLUkp4TXJndGwwV2E3Z3pZNUM0NmFMN2NmS3ZG?=
 =?utf-8?B?WC9DYS9QQ1lkWDdzY2JtcjFYa0ZDVTl1UUxJRFppK0g1WE1KMjdxTXJEd0xs?=
 =?utf-8?B?QkV0b0NpRldqYlZETmxlUHdoanZ3cStjb2g5NGxHNEtJeWsvZXZIRmRFdFN0?=
 =?utf-8?B?YkNHd0s0OXZ3ZU5NWFFKRzdTckw5b0QvY0txM1R5V2liWDV3cDQ2RzdLT0ZM?=
 =?utf-8?B?ZTE2MWFUTHN5SmRvcUhKeVhsTGNEbFRmYWxvTHdycmNBbjNicHU4eGMrSWd5?=
 =?utf-8?B?MjhPanZFdlFRUWJBczBaekN0SHUxNVlrR2VoV1dmcnYwVEtRTTcydk85R0lj?=
 =?utf-8?B?NDlDOVh4R2pXaWwwTGhMV2RrcVJONlIyUXhOZklEaHdscmJhL1p4K2VzRFVW?=
 =?utf-8?B?TFdyL0w5VWZNWGovdEI0R0FHcUNaajNIbk9XWHNOUGtsMk5ML3BGMjBYK0Js?=
 =?utf-8?B?YVZCSWcrVTFzSjlNZ3Z5UjlkejQwZjNqZmNDWnl4RllsSzEzbFN5aFhkK0RI?=
 =?utf-8?B?L0wwd1pZNURuQjdjbkZBQXZSODdOeUV4NE55ZVpraHdnWStnUkRVeTBDYXVt?=
 =?utf-8?B?RzM3Z05NRHRFckJhUFlhQVI2NU9JRUtmT3ZmYkFuOE9BVTVvS2JMdFluSGdp?=
 =?utf-8?B?cWNXRk1vQm1nb1M3SFdhNmJtU2dyV0tPYmNpaHVoVHZjUnZzVjF3cTNZTzFz?=
 =?utf-8?B?YlJkbzZaOUJPbCtkK0JJbVNoK2t2TVZZNGQ4M3hpTUt0MkJYZ1hFbmJiZ05I?=
 =?utf-8?B?STlKRUgwUWhSL3ZnWGVEdVFQWmpIeU8vSUpxMlVRWFY0WnZSd2FqU24xSTNh?=
 =?utf-8?B?SDMvcGxCTW90RWZ3dG5HalBlb0oxb1J1NTN5WjBwSWFEclhIL1ZmNkdNOE5m?=
 =?utf-8?B?ZGRqQnlaZUdPR1R1WHJkMGRyM3RVU1RsUTIyTG92MDZ2dWducXpJZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b50c709-72f9-4534-8a5e-08da19572962
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:58:57.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfaWya9fH5/mByHhOc/zvoSODxfiTuqseAiLLxi3VjVgHP0XbeqYR7tgrkfAMzljXtoV8mJERzes53fGDBsHbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6179

On 08.04.2022 13:37, Luca Fancellu wrote:
> 
> 
>> On 8 Apr 2022, at 10:01, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.04.2022 10:45, Luca Fancellu wrote:
>>> ---
>>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
>>> xen/arch/arm/include/asm/smp.h         |   3 +
>>> xen/common/Kconfig                     |   7 +
>>> xen/common/Makefile                    |   1 +
>>> xen/common/boot_cpupools.c             | 207 +++++++++++++++++++++++++
>>> xen/common/sched/cpupool.c             |  12 +-
>>> xen/include/xen/sched.h                |  14 ++
>>> 7 files changed, 383 insertions(+), 1 deletion(-)
>>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>>> create mode 100644 xen/common/boot_cpupools.c
>>
>> Under whose maintainership is the new file to fall? Without an
>> addition to ./MAINTAINERS and without the file being placed in
>> xen/common/sched/, it'll be REST maintainers, which I think would
>> better be avoided. Would it perhaps make sense to have this as
>> xen/common/sched/boot.c, allowing other boot-only code to
>> potentially be moved there over time? This would then also avoid
>> me asking about the underscore in the file name: Underscores are
>> a somewhat artificial thing for use in places where dashes can't
>> be used. Yet in the file system dashes are fine, and dashes are
>> (slightly) easier to type.
>>
> 
> Ok I can put the new file under xen/common/sched/ as boot.c, should this new
> file be under this section?
> 
> CPU POOLS
> M:  Juergen Gross <jgross@suse.com>
> M:  Dario Faggioli <dfaggioli@suse.com>
> S:  Supported
> F:  xen/common/sched/cpupool.c
> + F:  xen/common/sched/boot.c

If it's to hold general scheduler code (which this shorter name would
suggest), it shouldn't need any change to ./MAINTAINERS as the
scheduler section would already cover it then. If it was to remain
CPU-pools-specific, then you'd need to stick to the longer name and
put it in the section you have reproduced above.

Jan


