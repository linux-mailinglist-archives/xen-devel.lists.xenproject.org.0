Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C716E4066
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521763.810607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJ1g-0007mS-A0; Mon, 17 Apr 2023 07:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521763.810607; Mon, 17 Apr 2023 07:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJ1g-0007kC-7F; Mon, 17 Apr 2023 07:11:48 +0000
Received: by outflank-mailman (input) for mailman id 521763;
 Mon, 17 Apr 2023 07:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poJ1e-0007k6-NK
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:11:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bdc8ff9-dcef-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 09:11:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8566.eurprd04.prod.outlook.com (2603:10a6:10:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:11:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 07:11:40 +0000
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
X-Inumbo-ID: 1bdc8ff9-dcef-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XACSUd95gNSk4+/bamMfM6KEPbXqKyyt2RknVxl+GwTYu7roRoyMHWCdefzJufDPXh8/Vfm0m4XCSF+IP6BfDnC4d9jwyg/2VwDM8l4QBQL6Sc/bW0hFDLueSgvp/yDQVREBSweAYJe8aO6tJw+vXQFRz9Bwz4VA3brkhWv6jlxDr+ObIm8SaC5ZVOND6zQ/P0hzhVZaxVrmhKh0iRld8CB0ZsUAFzlEmuCYsFU2weeRLaWYXbxvKn4nJaawbhbbX5+y/64akSCBgkgVAJdq7UDux6Q8eUpd/G83M0viFe4opFKQQymP8G4XHAjEPbBvwPgzKRRF86WAr2+WUESBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynkEhOnbNy9kAOy+T/AB+jEXHtc582wleJWzK0Q62+A=;
 b=ZA4XBwUN14eNeHowibIw6kJZCdcFQfU/tiKp2AVbDlzxtC316t8eyHvXW//Q0hO458j4RaFFVEX0LKrHupxqngzs4JljWyQiiRioKt2RGOnXYUbxbYnLksXf5WrkHNq1vhZacD8Usn+oumuavNFf9K4IPmUWgivH7WslM1AKxcYRWQE2enSUnwdIXXsF4ZqvVh+C4XhDgVlPU0ImPOi4OPFSsz9Ly+fewQcBFzkqyhKRZYId+fAGxnLzziRi0GmpfFJtFs4W1rxz86dMp+ezZe+8REv47MDzbrtvaUbMBs0+jQxDocit94Cwf2jmaWmg4bDsKDEaV2bRvlJ6DTMz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynkEhOnbNy9kAOy+T/AB+jEXHtc582wleJWzK0Q62+A=;
 b=lBecPhAITbUVEdqy7h+w6atr1l2ssPNiYEaN1S+gUA0jOqpK/fd9JpWkS2XtgJdIGuvtsYHGTKdU/55EnbxCliwIck6Z09BjMzS/NDy670AtLxrnZKT3yCFe72ERfcozr7H8BFTnAqjX5geXBdDJgP6cK9gGouVLBDDscUE6KRTi+Mn2fIhQAH+Z84Ybk/lQL6r3C3Sg0kMYDnYnuXs5ADROfHFiQOznXl2Tw9YPgRY9uJkiMKo6dUUwSkJEnddiyX22rFJ+e6qyS1B+xOkDUlf1EylNVoNLxdgIU1hxqGBgxn6abaCe21fZ8+ARi1ykmqpIzKwI1Qn1hM4ag3653Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00e284d2-c4e5-5f2d-ef4b-6f0b5d7cc8ee@suse.com>
Date: Mon, 17 Apr 2023 09:11:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Parallel build regression in the emulator harness
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <19944c81-8dd4-6c89-0fa0-f4837648c7d5@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19944c81-8dd4-6c89-0fa0-f4837648c7d5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee71aa3-821a-48bd-3eea-08db3f12fdea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kIt/2bwd2Hr1AOsAZm8Yof/RDdm4/Ov32UpsADBRuIY7nD3yR5f7xoBwcMKdvVQLgRoXkA6lIGOMsCdwG3L9ATLzx3hClNNKQlW9/YRjGS0rDslHcrqhYcLXcfYNS7MW02xCZ9vzTD/b18TMQF4ucq7l/jBV1QszU89xzNbRrZP/z25JGClFKT6EGh/ChOsoGRmVZjWwkhhVIE7bsJq+y8rjDcTMIxhuhPhR5UyKRA77xPA3yFB88gSrkYmy1OE8krpgZHtl6cSmmjQ7JR4J7PtNNVTvoILo2BoQmCJUe32ivquNW8ERaAEy8IdCqCCppdSlzDndyUI0ioi3jyR0yfHarvm+KPcxeoljrGv+R1ZMLS6L36K4Qtt61WRZq/fh41XbmegyP08iZheaW5IrDJjSt06OFUf38HyCIPXN0fugLNMM1bf52ubfUXsYbMmmYO+Mak/gbniWJOhInENTFx0Q8Xjy00Buo+rJKbh9AYzxCyNEY4z4uydZM+/Ml7WsRSHH/+x2QS7lSI85oNcmbkLoyZOmeJReGPgJAGwnQ2HJkFvbWT4rgicIxGu4eB9Z/ZL49DEeK42EpIo5dmcn+fSTeDEGe3/4aW1GRnhpx/fRqwB/uyDTbG3pTHNwr+LKIpv7ikWrVlOdsOJvBRP5sA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(54906003)(31686004)(6486002)(478600001)(41300700001)(316002)(83380400001)(6916009)(4326008)(66556008)(966005)(2616005)(186003)(53546011)(26005)(6506007)(6512007)(66946007)(66476007)(5660300002)(4744005)(2906002)(8936002)(8676002)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFJwa2MrNUp1dEJtOWVjcDlIZkZ0MnJETitWQ0FSa1Y5NmE3czdDajBWdjB3?=
 =?utf-8?B?YjlJdDVUZGU3dytjV2tqVW13WnRmdVRSK0FZeXRUNERSRXg1UEU3ODh3T2tX?=
 =?utf-8?B?VWFTbG94bW40TS9mZUdpbzRuTnk4UGZKdlY0Zi9vZUNMQUU3cmpFQ05Hd25Q?=
 =?utf-8?B?ajR2VWEzcEtrVEJSY3N4TlkrRnowVUh2WitLL01NQVBkeDdrSEVRRUNySyt2?=
 =?utf-8?B?SUROQkVyK2s1TXV4SW1xWFA2blBhU25qWEh4TDRhWTNnV21iQTVRMXUxbndw?=
 =?utf-8?B?NUhYVzhKcDF2MkwrMnl6Uis3cFJPd3dCWlpBOW1YVXhQOWwzRmYvS1ZsNXNZ?=
 =?utf-8?B?b202aDM0WGFWbUJYaGxFRXgrNmZYanZmN0pnWEFpRnlOUFZnWmJvUVJnODVs?=
 =?utf-8?B?RkNEa2NpOGh3bEFVVGdWdlVxUG1NTWorU05qeHE1aVpvYlZpcGtCMElINkhO?=
 =?utf-8?B?aWFJQXdZYVJaaXFnbDhyL1NEZGF5bTNBL1RBMHJBeXh5TzQwWStRQzhBRFl6?=
 =?utf-8?B?bFNsM1ZuYWVHOE1oQzlJY1ByTncxd3YxemJVVHRndGhzQ3YySnBraGJNMmVS?=
 =?utf-8?B?R0l4SFNFR3RlcnN3eEZyOXVJN3F3b2g5aW1qS0RqQ3htb1NVeEVZbThiQzNa?=
 =?utf-8?B?WDQ5TFVKaWFjVWRadnFOMEVjNzcwVk5tVGVTU0ZZelVqeVAxVTVOUTZxaFF2?=
 =?utf-8?B?RUN0VFVKcFFBRGFYTDJWc1VtdkpZdGdZNS8rQTNUZHRzU0ZETWFDdDZTM1JN?=
 =?utf-8?B?VUhLeTJ0azg0TGIrQUR1YUYxeHFkY0JzN0wvODc1TzZudjZXdUhCT1hzOUZs?=
 =?utf-8?B?VEgzSWZIc3Rza1ZINW84YnFiK2tEZnJUajlGblpZQ1g3V2RKWnc5aWU0UDFs?=
 =?utf-8?B?M0RUaklaYm5mRVlUVForWmdDQzNBQmtCZTR2YU1pSXJLWFpLU3d6dDg2WE9i?=
 =?utf-8?B?cVhUZnVjS1o5cVVSM1k0UHFDcC9NOHFHNDRLQjlNQkpCVE0zakhhTnFlQlhM?=
 =?utf-8?B?VmY5WDBZMjlxbHAraVZZQVcxZk80aVZKcGp2aWsyVzAyNFVHUk1CSnA0MGsw?=
 =?utf-8?B?QlBZbnV4WlRLYk9WdFVWWnNLQWNZS2krRmxTSlY0SmZXS2F4NStiZzFPbUlS?=
 =?utf-8?B?aGt1T05VdG1FeithOUZFQ2s4c01NS21jTm1xenZuOTVVV0g2eU9Cb0VucjZO?=
 =?utf-8?B?K3d4dmF2L1Jsc2IySzEzbEJIZCs3QllpMXMvem1UTVJGSTc0N0M1QnBKY3Nh?=
 =?utf-8?B?akhleWdGZlI1V0M3MGUxWXd6bzZ3Zzhhd0VsVFhENlV3U2JkcktPb2F6UEdH?=
 =?utf-8?B?bnhSdGN5clRNelJZT09FUGttTkhpbmZuVVpsL0JXWWNGTEVYTGU0UTNVWDVy?=
 =?utf-8?B?QVVWRWNud0NZTXdoUXZoSFRTUWNQNy8wUW9GbjFHL0FGU2xSamh2Q0ZQSlIz?=
 =?utf-8?B?K0pQSGFreGkrb0ExaHBucDRwazM3RUZpSmdpMHRIYXIvVnhKNmdTQUhxWUFS?=
 =?utf-8?B?MXFNc25yYkV3TmVKOC9LNGtFS0hLRHkwZTRMdnhsR1NmOUhZeXB2VkxKWnBD?=
 =?utf-8?B?a1pCMXBOU1F0clJuTTZlbnk0eGpEeVNydnYyeHBJRm1uYTR3YVkrNllBeVh3?=
 =?utf-8?B?Yk5GY01KSDlVdzJmRW5pbWp4RjU4OEt1M1lZNzBpWGVXOWw2c3pKYjNoK1VM?=
 =?utf-8?B?VDhnUXJrR2wwRWJVRG5LNmU5T1V3NmkrT0lSWnZkTjFDaDlINk1KUmJVTDFM?=
 =?utf-8?B?S09qRktydVRRMUVIYisvZWZnUGFKdDdnbXBYa0I4WWNzZ1U2MSttTHFHams5?=
 =?utf-8?B?QlpOSU1VRlBQQzJETWR0NjJSSzV6RlRIMkt4ZTJlS1ByM1ErK0phSDVNNkd4?=
 =?utf-8?B?Y1FtU1M1MVdQRjRIVm5DRTNUMzBVYVZSMFhqQ3FRdG9HYXFhWSt1WE9sNkM5?=
 =?utf-8?B?VUlaNzBPWkFZNVU5WjJBZE1VdnFPekhUK3lpYVhFUlQvd1BoMy9CdTgwMmx6?=
 =?utf-8?B?cldOdzhsVll6YnI1NUMvRXE0emhsdmhjaEdySE1RM1J2cGpQYXlZTUtWc1ZG?=
 =?utf-8?B?ZzhCYUhHNDgxengwSnBJMVZpb1EwQ3dlZnpxTG1BaTZac2thOHFzOWgxTkNq?=
 =?utf-8?Q?d5aheuF+wgRAnKF/6qjHT6FvR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee71aa3-821a-48bd-3eea-08db3f12fdea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:11:40.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Lj/K6wF+xnqP6XRD5CZE74YsGAX3AMEu5xNcQiu7Cfw1xWv2/Gppjnu3umdWKoRfRSErBY5HalNWPnIakLW+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8566

On 13.04.2023 12:36, Andrew Cooper wrote:
> Gitlab has started very occasionally failing with this:
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4104532296
> 
> While the individual log lines appear to be in the right order, the
> build is clearly failing because compiling decode.o is happening before
> the x86-emulate.h symlink is properly in place.
> 
> This will be an error in the recent splitting, but I've not had time to
> investigate further at this juncture.

Well - I've introduced uses of $(x86_emulate.h) in the fuzzer Makefile
(mirroring what we have in the test harness'es) without realizing that
there is no such variable there (yet). I'll make a patch ...

Jan

