Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF46B26D0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508289.782832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHAX-0002gF-U6; Thu, 09 Mar 2023 14:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508289.782832; Thu, 09 Mar 2023 14:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHAX-0002ct-R7; Thu, 09 Mar 2023 14:22:57 +0000
Received: by outflank-mailman (input) for mailman id 508289;
 Thu, 09 Mar 2023 14:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paHAV-0002cl-Rs
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 14:22:55 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e116c920-be85-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 15:22:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7570.eurprd04.prod.outlook.com (2603:10a6:20b:281::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 14:22:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 14:22:51 +0000
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
X-Inumbo-ID: e116c920-be85-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fex1dFuxERtW6taTru6ELm2mDwpkJ+HzVsH6RSt9TBSbNQfSpwGIYUrrJ7/YSauyWKdEElA49aRRC1J/AFW2zCrUGNBAl+jrD4L7gc0Jl4oWdHI7/A/QzZ7fwl4Er077UvsuU8h64EB5mdgGbVWDyjCGv2oscvE0X7bGj4xncP3wMrRuAUzrCUaE12MZ1VmNetqfybyFXQWrsokrJDT2QSCUJYaCgNAQT2ttZ/n1SN1IODhT7OPMgYFffq+IUOBoZ3XoDJSqPe3Jo/PoL4PZ/X4JBT/yJ6W2s4ZoY3yA1Hk7OrhlMNsI6FqhcP28Gxtqtg9BhJPmOpbHFW7+EqK4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsqKWsHJXt2SE+yZhMazS6mjdOcTgeigfH8BA4QM3Qw=;
 b=ec7NSda+e4oRqY3rJW4EUBs0I9yKoaPDIzAGDQCxVKbY8RVxIU7i5014ddbrVWsRf8hB0+RXluRtQUsj3YU57KbvXBAN0oDL0hz99S5p2PJKs/lUFQgOSEzdpNqdI7Ovot62SxcUvEOmRQbjviWk3tL+vDV+nN36FKAOKLbrx0HFhN8leE9s5oprOJjGzsd0it/TOYuQtk/8Qu/lGEywiy+ngH4GGeszJM6qsjYtNRg9lVBKMC5mFseYiw4FHjducv84lRKD0SUWKrT+3/XZiT1LkqhCwi9KLj6qNrzrL0q6u3ie4XP2GTCxTkdwcue8Zurym0nAXc9fYKzkY7cd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsqKWsHJXt2SE+yZhMazS6mjdOcTgeigfH8BA4QM3Qw=;
 b=Zh4pUC6ta0sjeFZuxXUlNIbzLGCyrHChmETwF5YN1WiR2p/Xjo6g4ch+KgYKM0vk6R97vGnLTk79OPN69AS8BcZ7eDp8hpHkYw39dVofp3z0rI6maKaZHaJeP9XMCTCc/HRvqcA5REeHDMhvSSPaN5ffg2avwfgdCwd/JwkvjxzGp7MK+z24CkG+EqAjOT06ZW1CWPji8MYJ3688FhCdXy39xYluK7HgMMK1aaaZcE3YSsjXQfz6k32TSXB4LmF7fZmxHmrk1DkHYiRb2Yg1uWyoPqQfNpSLC2oP6KfJbz+Stex/4MCohf4b2EyCrhUU77gdskD7fSE1YNoqYKUO5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40019342-d04a-c925-9cce-03fa118fd1ff@suse.com>
Date: Thu, 9 Mar 2023 15:22:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/5] xen/arm: remove unused defines in <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
 <ff898ad47ab1caae2ddfe3c9d34e7ebca8f40d44.1678368234.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ff898ad47ab1caae2ddfe3c9d34e7ebca8f40d44.1678368234.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a4601a-cfbd-4f91-b079-08db20a9c3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BiOQ65k94UMi67YmEGYoJ1gM7HRaEajkD725NpDTtrslpl5PftyuLiNKSagdphsBQmXYtdHQLE8rRYkxC2+7P7oPqklfGdhl3o8QeNe+YaPdmOAJ+HY6e8Nbj5WkX9jqG1zTkIO1Jue3na4Y+W1rIyjR2DxDZIlaG3G97+/fWhLPccX9v7HN+OKA7I28cWKZOE1/hhVQ1oTHXbspwaSGAhHZn1XOY5Ykzv2+Di2nN1Yz3y/y2SDaxtZgDg+aOZ6ejJkP9/Y9kMX6Yh2zrHyZ6BZQCEt6eJmPgI7iD+4Zh03NLt4x+G85fk4G9nj3xZKrj5Ojg0sTU9nNWyBPP29CkKhzaBahwdrVwT/AJdncLYv5rLxVF930flrBWok3Mf9UrxfFvg41rv/n29tWHx7deq41lrrlhcsWNK4xc2AXmYVcWHNq0QUWJpu1V3/m2MX5KD3Ev7M3QpAXVun5M1bymT21zw9GO82Vg5+KZRzJIWoI582R22wZcXCbKfakIwqjvaKsfB5m8xRnuufEMJdz4qMEosxHV9Ma3XReGUViuuylvLC7wrYnCnglS7dF0l7VW4fvDQ1kbBqF7en493RRBpIMqz4v55VWjjWKF4wOaBQGopwUI2PN2V6kQNQcBQwG7lRLqhtwhLBS+DAvg/ET0m7irZCfuIxpGitVXCjdLUCtqL7KpMsHH7zPkVjIrQRwIIRpAT6Csvor3Z9L37nCnKHHOglTYWcCdD8ATe2dFOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199018)(31696002)(86362001)(8676002)(38100700002)(36756003)(66946007)(4744005)(5660300002)(8936002)(41300700001)(66476007)(6916009)(2906002)(66556008)(4326008)(186003)(53546011)(83380400001)(2616005)(316002)(478600001)(54906003)(6666004)(6506007)(6512007)(26005)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVcyMkJkV3AzekJSTXk5aFlaRFo4Qkc3aGpKNmwzOWtFby9KM1Jpb0VJWEpJ?=
 =?utf-8?B?WGFmTkxiMStrei9xdVp3em5TYmRyVXBrZDcwcnFmK0RqR0NjYmR4OWtmZTRG?=
 =?utf-8?B?S01Damo2VGs3ZVVZb0p2eUxCYlpRL2lMTkR3SlN2SzZxZ25Bd1JYanR0RG9Q?=
 =?utf-8?B?c0xrSmQzd0laSEFLNGE5eDZRMXdaRzFmQ0dIaU0vTTVoQmNGbFE1dDVyNHAx?=
 =?utf-8?B?Skp5Y2lxcC9ncEVoR3dpRGlGbzFuclIzU1kwUTlvTmg0Nkt3ZVhmQ1UwM1gv?=
 =?utf-8?B?dFJWU2hrcERDNmV4Z0ptTlBRTG5DMnZMb3ZSYTFOMXlzY0l5Y1BwbmVZZ2U1?=
 =?utf-8?B?OW1yV0FVOTRUbzNnSTBzNjhpUDZjajdidE1nOTFRQ2dJNXRmSzhHUHF1Qy9r?=
 =?utf-8?B?Q2RrK2FuUy9tN3pYRmJuY1lIT3lsUUVuU2dNVkxqN2dscE0zamo3ZWh0Qksv?=
 =?utf-8?B?eGNxQjNydGhtaGJ4SDB1QVJzcmhET3FLYms5d3JhR211cVRNQ3VMbkxIdFBN?=
 =?utf-8?B?OFJDckJMb3gxa1E4THhDNGZHaHlQTWlxbGNPVnF3VjcyQkhTdloweWtDRDVH?=
 =?utf-8?B?NGNINUNyamU5ZXBadzFNelFkcFR6OHFVRkk4cml6RFU4WmtmbmMxL0JEMGRI?=
 =?utf-8?B?bk1NeTVZa2VVRGE2dVhnRmMxQjcrR093d2UvcFFzUUR3Z1Z2L3dUT2hkZS8v?=
 =?utf-8?B?RVJaajFDMUV5SEYzRDdSU2N4bmxsREN6a3JNVVJXYS81MXNZenVZMWFzNzd4?=
 =?utf-8?B?cVpnVk00S1ZPMHAvbkN4SjFGUWJHOGdIbk5QUUViMXgwdHh2K0tJbU1IczYr?=
 =?utf-8?B?enJkOEl3NTl5c2FSNTExNGpCNVBKK3FaUkZyUGlPWnJmOHcrbmJMM0F0MExX?=
 =?utf-8?B?UVF0aXpQdGsxdWY4ZUw5RzZBNzNhYk9wM282TGZIUWU2MEsxS1pFeGtmcTVJ?=
 =?utf-8?B?Z2NRL0hQelNVSUg3c3Rrc2lYUjJXVkRGUVJhYm5SQUlrUTFLeEF2RFhEWlBR?=
 =?utf-8?B?RHRmaVpyaDRTQzh2YWhPbVg1b2JmWHJGWkRBemhUaTBDRnNIRWpNbkVOTFY5?=
 =?utf-8?B?R2JGNisyNENUSkEzTkdKcEdqUVJBa0pTUDZ1ZDhmRkt0alh5Rm13eHZvYTE3?=
 =?utf-8?B?dE9zdTdkUHBwbWVibFhOYm8veThtN1p1REtoUnlPZUV4N25Bd1JMRUZtbUN3?=
 =?utf-8?B?SlJPQ0huSHkyczlsYWF6SnBpSmc2Q0lsdE5qVjRjbVV0Smp0MWZ3aDZQb3Jj?=
 =?utf-8?B?VFZUVDgvVGlMMFFwMWJEWVduR2ljeWVvMGhvanpwNTNvZTFHWldEaUU2enpt?=
 =?utf-8?B?RHpxa1JtZEVXd1pEcHdGVGZ4bHptOWVHeU5USmlSZlQ0VGNXQXNFRWZCMEs1?=
 =?utf-8?B?K2J3eW9yVytWTzM1UjA0R0lQc3hyTUwrMk9VR0loTTNoN3FIMG53aDQvNmVn?=
 =?utf-8?B?d0xzcWQ3c0lBQ0FJa2tVeW5nbm5mMW5DZEtlYm4rQTlNRXVnaDJWdHk4bFUz?=
 =?utf-8?B?ci9keHFoeVpzdXpHZnNrNWJ1bmdoYVVZUUU4SzRrbXBxUGxidXFXMkJIR3pE?=
 =?utf-8?B?VjlZUVpYR0tjaTYxczhMRkY2d1hsV2R6UTJWWGdSMjNkVXRjd0VSRVd6VGIw?=
 =?utf-8?B?V3FENkdUbkpOeVJkMGpHV2wrYW1oM3UvcVoxNXVtZVlKcjR4MTdlUFpZS3lV?=
 =?utf-8?B?UW5xWTdNd29pL05DbDF1SHhEWmJoelU3bThobVZPM1JTOEdtakF2cmhYd3U0?=
 =?utf-8?B?RHVBbGJFVVd3NkFRRmhIdTZ1SFBRL25LWEFmMWZycEpmdVFybzZPS1ptSUFS?=
 =?utf-8?B?R1NmS0RUOCthL1VQbXZMcG5rdlU3Y2ZNZ0FGWTF5L2RqMnZHTWNsOHpUK0hE?=
 =?utf-8?B?SHc1b0VkQmhZSFdUQU1LY0FGRTV2N0FIMlBsbWtMakVxalZDMzFSbmRydmJ1?=
 =?utf-8?B?MW81RmJzeGR5cGRTU2JJSGJIUm9YcUVRODlHYUxTZnNUampQNjhUZ29ZUFVh?=
 =?utf-8?B?anY0alp1OElkbXEzODU0WkNOSmVEcGVURmIreWhHVit4SEpPMFVxaDFkaDVl?=
 =?utf-8?B?NmhlSy93YS9RZFdWanBkTk5GYTJCaDdCRnhmendUblBmTk1rM2hjb1dXa3Iz?=
 =?utf-8?Q?Z+xJKmHYJKfmnxP/HKAB0LhMu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a4601a-cfbd-4f91-b079-08db20a9c3ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 14:22:51.1909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oL0Q0F2a+zX+3hrqqXqQCAa5GS5F3qqBBP+FcIL4y4hH+gC2VKmGYxEg+6R0Uq2fEDr+0zrzEJ6D8BxtWdtN/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7570

On 09.03.2023 14:33, Oleksii Kurochko wrote:
> The following defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH,
> BUG_LINE_HI_WIDTH aren't used in ARM so could be purged
> as unused.

Requested-by: Jan Beulich <jbeulich@suse.com>
or (but it's not really a bug)
Reported-by: Jan Beulich <jbeulich@suse.com>

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


