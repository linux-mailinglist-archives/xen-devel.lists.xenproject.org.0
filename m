Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C8690AD3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 14:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492461.761997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7HT-0000fq-Or; Thu, 09 Feb 2023 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492461.761997; Thu, 09 Feb 2023 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7HT-0000dW-Lj; Thu, 09 Feb 2023 13:48:07 +0000
Received: by outflank-mailman (input) for mailman id 492461;
 Thu, 09 Feb 2023 13:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ7HS-0000dO-1C
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 13:48:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60573613-a880-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 14:48:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7652.eurprd04.prod.outlook.com (2603:10a6:20b:285::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 9 Feb
 2023 13:47:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:47:35 +0000
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
X-Inumbo-ID: 60573613-a880-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRHXfMZuK4cHoXID0uSOOd5L/P/GOS0Jbk1n7pdPDZihB9d2LMMyzJfqmjvjgO/eheexmZ6F47KNq+mVOCk4zdFW/YeDJGXyTajqc3Kc1hOAaZv6g1oSxXF6wDmKnv9Q4PHa8CDUXbkrGi835MEcDr2+Gzyy5KLHJuJD7vTQEXgqEKjjm8MxlA4ir284Qcxst5MuhtzycmMNLbivg+zwsWCpyym1QD0DrfnZytY0RgDDFltY5GyvWFKksrakEFPwWSGwyAb8vnMmluO8K35A2s0NfZ/C5v5QyJkqt9ODJ/yZOiYChmHqT++hn2oBpOF0BeFzDkv8+SpQkn4qNeuqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahjvpTi7fKt9B0aA/ag7jEDPCf+7ZgQC4lifzUe4apQ=;
 b=m3P4zA7FFqXXnanq/sPYz/jgZJioblXBasOjFTK+MGuDPx6paY8nBk0ALCNziC+HD+rqeoOdIMrG8nHZR8b67atjW49DdGYyg6yyH8OzpRbIQ5+rwmqwF63Di1qCN28uo/d4bfvJxWSDc1Y7wCxfvKO0+0jOjAstPVEvfnb6mTHpCmk7sTyRo8I2zlnzV56gIHVqONmavmlE1SAi+VvP0H7NJH4S7m98TtssSx9cGDpDDe/wVlG8MuTwWR1ETLBOsDGRMrRyqJ+GcUzS/okPk65I0skyLOUrbyHKTkLpYyb+9+0oRzT/dPu68P//aibTDunikUwbO6zQTpSS2iGQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahjvpTi7fKt9B0aA/ag7jEDPCf+7ZgQC4lifzUe4apQ=;
 b=AuFiFxUskU4iJKFU2Zbzu0asjpMg1KXmiGgKw7o5RSKfsULK7awZu6ht+glBO3i3sGtfrnRPkaA/W94yQGSd9/l8pPfcoh9oJR8hY52L2wTgy4LdKpJ3T4ZsWHFwNvBk92tjE2YWUyAOWdDmag0pU3Cwg0133wcRhRL/gNo3i5iGEBNNd8FAyhZj0zqew4Tf701x30rg0vXNVJ/n4JEPFT0TtW+ik62mD8SThIycA98oBNyH7lJ2QyBKITuzGoTj0Z4/RPrxdp0tnt373npvjLytT9OPgXr1ZLuWZq0mee9XQjoJRjjyLeydTf0kS5HE1p0jlv+nC0qO728ikTHGnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <defd7f68-202f-0b4b-2049-4f29e95d3ba0@suse.com>
Date: Thu, 9 Feb 2023 14:47:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] build: Make FILE symbol paths consistent
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230208172416.725028-1-ross.lagerwall@citrix.com>
 <6d281c88-83a0-ee86-18b3-6c9d856a0971@suse.com>
 <DM6PR03MB5372B779A85FC592E4FE663BF0D99@DM6PR03MB5372.namprd03.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM6PR03MB5372B779A85FC592E4FE663BF0D99@DM6PR03MB5372.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b9d3c7-4b1e-444e-06c1-08db0aa4334b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZCtCfZsRo+orpYJXLZmbysOaibHU525Ga/w4OP0w9Q1mibihCHFbqSpYiuAEfDlRR2Sgd4/EPKjq6n66DA/ObFPjUqacmn1h25VXv9k6zmeOS5y1WTim1IJT+74TVQQY/iMI0VgS9OCQX8diGsufRc+NizNzMNblHkUw5N4005nacGYJ74ZMzPelIzov7kGg4R/X2GDlzRh3f5JDSrZPghKNc9hNqg5TG782Kd06BmoF267xF6z5V6jzh7teHShU/uccSNUy2n+ZRKg2PGbsonXEgSPHQgwxeKULtSVbtC9sZhLOb5JhX+I7chKkda1+YZUrATOye4kZlksqeeMTqLgp+pta3U/bQG+RmI0zr2apVaWVdB4rJmv0tQqDxesREr59T56b4t2RFW58yaIsOpFkLxg6K2ESyLwkHqDigZ/07SQ13iDTZmb+2oa099VXKLFE2O6y2+a/HJcNBKbrWdAbEChICv7q2I+7iQb1rSuWKD7X6vf8CbPF8hIni5WNG99lYS/nZ2yhdo3bDvJW4TuMImvg2yOK6VWoU8ODanp7dEVDesf0PwW3BcD7BMqVc7y7fDF7VbHfDuVdIVTstDpQ6QwO959+WoCaixcUmkaDKmY1AJLcnEe0fNJox9Lwzpim9Cqu6dIaQwz+tZ02Q45RrPphhpKlhsyIsJwyMheONiFAUCNvtmnV+Ib0HTCLFulW1P0fllPndW6/lJXDG9Kx4kDwNrYU69rIFQrfK3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199018)(6666004)(38100700002)(6486002)(4326008)(6916009)(2616005)(478600001)(54906003)(31696002)(316002)(41300700001)(86362001)(66556008)(8676002)(66946007)(66476007)(8936002)(5660300002)(36756003)(6506007)(2906002)(53546011)(6512007)(26005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFowd3Z5c3JsSXJWdkJobkkyYWxtVEk2bmp5bFJEQ2M0VXU5WElRSXpvV1Qv?=
 =?utf-8?B?dGk3UzVpb3R6T20yc29ZcytVeGcyZEs2OHR4Z1RMZDRrR2lnSitBclNxT001?=
 =?utf-8?B?czROQkk5VCtNdDVmRVF4OTRyVmpKNU1UR202cHAwWXczUlBwdnc5aENBMGl4?=
 =?utf-8?B?TDBwaFFuYURpWG5NOVZjbHQ0WWVOZDFSY284L3ZkNVdNYWVoSDBuaWNVelZW?=
 =?utf-8?B?bTdqTmtyOEU2RmppQ25MS1FYNDJOSVBEU0g2RUlDdUIyWUZabGhyNGRhZjNK?=
 =?utf-8?B?UGE0ZUczd3RPQk5ZVkNkVVpZS1hNK3U3VFZqRHVFN1VPY0VTbVdCY1I4QytL?=
 =?utf-8?B?VGdqMVI4OHVCRTFjNFl3d1NKN1pNcWluRFJhOG11TDdlclhkODFlU0VPZ21X?=
 =?utf-8?B?bytuaFIwYlF4RHhVZ3k3Rk0rL2ZJdGhtL0JSTFc3ZHVBUkE5eDV1V0VuZ0ZH?=
 =?utf-8?B?Sk9RWGJ2eWc4czdySEJFWXJGM2pjS0ZSU2JaVkgxWVVla3NGYUpiVFlpY2Vu?=
 =?utf-8?B?Rm1zbDhNT1JhcmxOVDY4KzdJWWZNL3RyYVUzVVZtQnRINnp2ZjFEeWs4TkNo?=
 =?utf-8?B?SWYyVDJ5L1FzeWtOZnpMd1JwendQdWUvMWZ3WU9BVFJSRjYvVWx3KzBoMkth?=
 =?utf-8?B?VExsUHE0UXJSaDFLMnJ0VmxyZzlTNzFzVndGaWRtemVYb1pnQ3RuWXRBajRi?=
 =?utf-8?B?VzVPV0t1clhmMmZIMVZRSU9UMUN2R3pzVEV1UTVNR3hhcUE2cEUyZ3dtRSs3?=
 =?utf-8?B?anJESWdYTldVejdYa3gxUXljQ1p4eXhRYk1IUzhQSVdEN2pUdVRTVmVEcFQw?=
 =?utf-8?B?b2NoM2FDdXJUQWFrYVlIYzh5eXVteTRZaUxYeVE1bUpUd252MXRGR05NV1FT?=
 =?utf-8?B?eVd0MzlJa1FzSy83elFKb3htR0l1U09jYWNVYVd5TlpPOVo5UHR0ZDRJKzQx?=
 =?utf-8?B?cVdsNkQ1QmJjOXFVUXBveDBLQVpmZ0l3czhsTjRYdktOalo5NW5wQ1k5bks0?=
 =?utf-8?B?RFdPdlpuNk5YQXJrdU4vSjFrS0Fpamp1SEdnSGVPbHdGV0tDbXFzV1JXZ3k2?=
 =?utf-8?B?Z0dYaXd6cWpBc2dybFZHK1NJRHprOS9GUEpwbHg4dDFTMXNzZ29iRTB4MFRF?=
 =?utf-8?B?NmNHUFdrR2Z2TDJ2YS84RU5WYVdSRC8vakQ0TXFzQ1lBVVBqKzkwSjkwTkdP?=
 =?utf-8?B?TDBKUWg2Z1BmWVVGWUN0cHpiRjRoN2Q5N3dOemZyZGJHOHQyT0Z0Z1RFNldl?=
 =?utf-8?B?U1BMVFppNHgwLzVGSHlwd2YvcTQvQ05BdXBhN0VGcTlEaVVGZDUzQkN6UEdN?=
 =?utf-8?B?bGdpQkl6RDBJZC9IdjFzTGsyc0x0ZkpYdzM5aFI5aXZUeDNubzdqaUJqLzFj?=
 =?utf-8?B?QjE0MmVXNjc3ZlRtVWs2OHA1YzlsNUJSUjlna0VzcnduZnVpVWhoalhpUHM0?=
 =?utf-8?B?TVhoVUtqbmhMaERUMlNYemRKckJhcEl2aTNjUTNmU2ZvajhicDFNTEFDYTFn?=
 =?utf-8?B?NHNxcy8zSjh5eU9KdlBGV1FVUGFlRTgwNHp6T1I0Ny96WlVuNityNkpzbjA2?=
 =?utf-8?B?T2tyY21SQUtDMHBBRWx1L1JIWXMyQVJ3bldEbjErOXRERDdRUjluN1FLMWhL?=
 =?utf-8?B?UFVhV2ltZDJLU2pxMXlKeGhpZ3Z2ZkZWaWQ2UmJpMFZPNXdmSmQ3OFRZNVZH?=
 =?utf-8?B?T2F5M1R3dTN3bXZpQ2U1WkpiQWdTYU44bGxDWVJaWHBmKy9pOFVaMkhoQzFI?=
 =?utf-8?B?M3ovY2V6MWFiNGczanZYeUdEdGx6Sms4bHpDUkhtYnlZd2E0M0JlUVVGS1ZS?=
 =?utf-8?B?bkdRYlk2OXp5RWlpRG1xMStLY0ZHcENzallpSGdJdDQ2ZjIvZk1mU0tEbE55?=
 =?utf-8?B?dDJEZ3N6UklNQmNHdWJuL2g2V2JmWWxYcFNUSnpNT2lIWnNmNkVlWjRyVVhu?=
 =?utf-8?B?R2l6ZzNmQmRMMEFUVlhvN0liblNxZWJkVWxOcXlZcGpqeG5yT1MwaDBlcFVG?=
 =?utf-8?B?aTlyY3piNEZMTlZ2d3o0bnQyWi9oQzlRV0h4aStreWVtSzNJOGZqZjJxZEhs?=
 =?utf-8?B?dUFZMHlERERxMVNCM3VGNDZ4eVZYQmVvR2YvT0sxdXhRblhua0U5VGQ5T2Ux?=
 =?utf-8?Q?1bxlGi+imPzoWI1/CYXVfT8YP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b9d3c7-4b1e-444e-06c1-08db0aa4334b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:47:35.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7+/KL3WYdrT4AM4YpkoGb4P0oNdY7piiujV9W6ZJ9fuDHnA0TCSeiOkXYHrRESnBcBQ7lvnOBJsjyC/vtMOSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7652

On 09.02.2023 12:40, Ross Lagerwall wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, February 9, 2023 8:44 AM
>>  
>> On 08.02.2023 18:24, Ross Lagerwall wrote:
>>> +        rel_path = $(patsubst $(abs_srctree)/%,%,$(call realpath,$(1)))
>>
>> Personally I'm against use of underscores when dashes would do, and using
>> a dash here would also be consistent with e.g. ...
>>
>>>           cmd_objcopy_fix_sym = \
>>> -         $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@ && rm -f $(dot-target).tmp
>>> +           $(OBJCOPY) --redefine-sym $(<F)=$(call rel_path,$<) $(dot-target).tmp $@ && rm -f $(dot-target).tmp
>>>       else
>>>           cmd_objcopy_fix_sym = mv -f $(dot-target).tmp $@
>>>       endif
>>
>> ... the several visible uses of $(dot-target) here.
> 
> I'm not sure if there is much consistency since other variables like
> abs_srctree and abs_objtree also use underscores but I can change it
> if you prefer.

These two variables had their names kept from their Linux origin, iirc,
so they aren't an overly good target for comparison. Nor are, for the
same reason, the various cmd_*. Linux, sadly, isn't consistent in that
regard ...

Jan

