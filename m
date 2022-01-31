Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705074A4AFA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 16:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263170.455785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYwz-0006mb-Vv; Mon, 31 Jan 2022 15:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263170.455785; Mon, 31 Jan 2022 15:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYwz-0006kV-Sv; Mon, 31 Jan 2022 15:50:41 +0000
Received: by outflank-mailman (input) for mailman id 263170;
 Mon, 31 Jan 2022 15:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEYwy-0006kP-SW
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 15:50:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 897ac1e2-82ad-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 16:50:39 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-EzanL8GEPUGSz-mBWQtnQA-1; Mon, 31 Jan 2022 16:50:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Mon, 31 Jan
 2022 15:50:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 15:50:36 +0000
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
X-Inumbo-ID: 897ac1e2-82ad-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643644238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qx6/YJRo4itrxy555f4/dNExjdDK3eyjdPvG4r1aV10=;
	b=dkJAIffiu2Ywv6eIYFYh1kVt1wXhMHqAng/afm14cLlQFoKTpFamNrrtvRoxtxBHs0pnrg
	sv9Jl62oVMk0kEHw6m+/jANSprejEbQNgddVSrzyef0Ax8NkkBeEFp6oI1jf2n0tJP3IGq
	pZ1fqr6Oht+19ZcvrTCLifeIqL7GcO8=
X-MC-Unique: EzanL8GEPUGSz-mBWQtnQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnpzM2kAw4ws9z5QPuzuPVesDELp36oBO6S0XGo01k7T8tvxw/9V4KebF188NPCl5K5A8qhSQeclSgiRzVynVJa5Ts0d+xofEaRXA7atQtYkTpDScLbzqVDlDTJzN8M87iUmQdzNVRDDD8hz2LsEmiCOjNEbP2ARp3PfOcEz29UFtacztHm+bam0ItiTvqOfE7QmmuGJWWywFkrAlIc3G4N2CjfhFidI4TlfRqkcsMQodQF0CaDPxeQycqXRHvb3fzpN2oOVz479xFJQ5qVVwH8IZmwrw6xEZ5cRgKAqM7lRQBl1KHy2cRgTv2gDRR08SNHozsI8xgLannghJ7QOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx6/YJRo4itrxy555f4/dNExjdDK3eyjdPvG4r1aV10=;
 b=Kc8cVwH/Ja4Ykm+OA9x+aS8mDxz33Fu2BVo4zW485zKzS0lJMAFZKOGAu62Vy0qBnnhBDGizv7dkhmUf3hTgFghxtw/3b/cnlHPlpHKEiNzbFyu4R3S8CNGHMNuMsEL12CE1L9RnHPpaG2udFQyPYkeDlUnafUAnvBLLBRiEry7iocGygX53I9VjCK3yUjr9ZqDbaQ65hq8TDPmHfsO2f0jAr+hronMFCPpN6Rh10Cw+cAYmahXYHeVuR6xum5dbvQwFbFHHj/dupRvVN32i9T+LNfXOityuz4QA1+o8/K+PH6oK8cyI3OqdkZua3Z8IhT46SKL670zXy15xsvzp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df36767b-e04f-aa29-82af-87e8624bd29c@suse.com>
Date: Mon, 31 Jan 2022 16:50:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <082ca110-2ab7-60ff-e705-032d2d472547@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <082ca110-2ab7-60ff-e705-032d2d472547@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0306.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ffc8439-a528-4ec2-c347-08d9e4d16bd8
X-MS-TrafficTypeDiagnostic: DB9PR04MB8250:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB825097B55B7393043E2885A2B3259@DB9PR04MB8250.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sOOo4o/EpMJtkf7kcJq9doLAs4pBV7xmI7ZRbp8ncP1m+deC8eyMX26hXaIg1IiBvTkrKohDBkhSBnH3BFs6b1IwGSWAR0fvzd47jivD+1bYvY+8GZny3ei7lA4HprGzoUSVU/neX/Tj2nKf3y8HT1u+7E5B+z1QsNG0ug1tz5OpFpDjxQyQQ1t2NokjGwXNatlLIBNkHgX+6Z3+w6HWKB8Ym/YD+hoqFT4HcvdyYd86ztRrrbuyucJYNnoCsbDRGXspZGHvxGoKlJTUOC/rWMPfUkhoUpSQofhdqn7WHMWo0bpzVP+EzG/wdbBObM4jK9TMwcAe8Mv65R3jGpUd3SwedFBUp4KeSDSVsTHrZpj9rwHwNtTcvfknXUHDPdJl9+JX7id9ZzhIVZSDAYx6Hh2qm5zsytms6nVFgPG+CJ8k6UwrskBZO82J1hKu+HnbdinjjrQKbMnuD1/Js90ep33iNMuxwZnlF1A5x7Gxj4PlgO3yVivwToIICrepK/8U30TbZQCnGm7CmC5kNxfqMG1WyYYbYGVQnzSueBHsSc7E5KWOVfjSM6hHCZZz89+D/lNyVc3pHIN6U12wh8yWx3Nj402fpB6UNDSwSLGJzwKQg24NX8009Wu2PyX0keWUapSYiEivE2Zpjol8jywzZcOn47ya9LnDr+pLWd4nAEWeCwZgBA/K1ufTqX9gqlZjUEvkykoXOnTsF1Oiau9rHe+3tEQXp1ZwEA50K6ACFRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(53546011)(31686004)(6666004)(6512007)(186003)(2616005)(36756003)(6506007)(26005)(6486002)(66476007)(66556008)(5660300002)(31696002)(38100700002)(7416002)(316002)(4326008)(110136005)(508600001)(8936002)(54906003)(8676002)(2906002)(86362001)(66946007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJPUDMyTVBrZTlBdW11dGJoYVl3VXN2bHBHM21ZRXBGSlltdkNDWmMyUUVD?=
 =?utf-8?B?dzdiK1M4NG9xdlp6b3Njdk5tOWpicDJKTVljZ1V4NXQyTmVPZ0VDb2UvUTF5?=
 =?utf-8?B?M1ZxaldNOFlKQ2hlUVZtR3V4bkxycW5TcWlWUW1ndjlpVS80Y0dWK0RZNko5?=
 =?utf-8?B?TGliZUlIcWNZZXZLR2g2OUlHMDlpUjFYZHJrVzFTeXR3T09QNElycGx2N21S?=
 =?utf-8?B?L1c5bVFrMDBKV3NEd0ZoZGxiN2hRL0kvVVBEa3EwbUpieFRtL1lOc3hGKzZz?=
 =?utf-8?B?a0VlM0dLOGpROFp1SlZJeTEyUmF3OUJlSFRtZnRRSUswejdZTVJkcEZzbnF4?=
 =?utf-8?B?RmUrMkdpclRwSXk0c3A4Vzc0dEdOVUF0YWRSc2xsNjE4MDRVeUh1RS83Y0Fa?=
 =?utf-8?B?djZpSGJSWlp1TjNUK0dkTVdObU9HeFFDODRkMExXK2EyOWl4UFNEOFBiUzAw?=
 =?utf-8?B?bXRkY0xrM0dsSjBETUpiYVQ5bmhBVDl5QkNFeFJFYTVObFNwL3FQMDMzMXVp?=
 =?utf-8?B?aXd1dWo3cFQ3a3ZweDl1S0psOHFHN3FtUXQvRXhGb1FKb3VRQ1hIZitmZmg2?=
 =?utf-8?B?dzhYaC9lZEt3Rmd0VVo3bjRIWTFwRkFia2hhSCs2ZjFtY1BtRzVvLzF0U1Fk?=
 =?utf-8?B?cGhVWkJrNkhaclU4T280bE54dC9UMkYxNzkrSGgyeWptT0tiV0N1N3JXakhm?=
 =?utf-8?B?dlJ6OUNraElKaE1Qb2NJVGhFT05LRHluNkV6VzhJa1RaSkxYeVR2YlJLb2tk?=
 =?utf-8?B?L0N0U3poWjNXcGw5Z1krcmZxV2NaQmFob2d6V2MxRmRucDVYUlM1ektxdmFQ?=
 =?utf-8?B?NytHSDdQZk5IZzJRM1BQK3pUb2Y2cVMybXRWRHFVZVNRMmRlNjhMenZwVUZB?=
 =?utf-8?B?TXhkT2lhY2NETGFtNS9XMmd1cTdzbWovNXlNZm9jSW5IQmV2ZTVTNUhtajJi?=
 =?utf-8?B?WlVrNTBTQmpBcDMxaGt2UEVXeXQ0ZnJDSHZBYjQxd0VUNFZQZU4xTDAxWU0r?=
 =?utf-8?B?YXlvT0xieDZ0dFc2NVNNMnUwWDR3MCs4SEN5eXQ4VndlOE1PVFpMUk1DbjVa?=
 =?utf-8?B?eG1INFk0eDVEZlRTVjBJMVBVZWQyRTAvMXVtM295aEJWc093MWFGVUFObmJy?=
 =?utf-8?B?WmxHYWNxYmRDcXI5N1F5Zit3OUdLNFcxTFpZaEZJREVDcjBobWpQTmNVbVBz?=
 =?utf-8?B?cnd6emVKM2FBUWc1bnNUQS9oeTZ1dUZwVy9pK3ZFQ2VmWU9RRm1pcVRPRE1y?=
 =?utf-8?B?SHNnN1d4Ymd0WW02cjlkbTZ1cERmb1VFVXBXSlg1cVE5aVp6ZnNxK1QrQ0FM?=
 =?utf-8?B?NWtjMHF0dlNmeEJPR0JBU1pXeStCU2VCa2tNc0p3Q0ZNZTB4Zm9EM0NhV3pn?=
 =?utf-8?B?cmhnR2NnL0FqR3FCNTdCcFlJYWg1SW4ySnYwTk02UXNvUklZajNtVmZQSXY2?=
 =?utf-8?B?ZE8zZWVLME05K3VsYTR2Ym4vT3o5aHVOYSs4WlBhTEUvWWdaaGFISXE1ME5n?=
 =?utf-8?B?dnVTbVFPM1NraTJ1elhOZm45aExNMEFKYVhzWk9FUlVWTEwxWFJSSlkyQmRJ?=
 =?utf-8?B?NFRjZ3k2YmdTSnZBYzJTUU1LZmVIRUpOVHY0enB6R3ZJV1hEZFZpZmNoT2hK?=
 =?utf-8?B?bWNtNnZTV2d0V253QzkzVlVtYi9iem1DaG43Tno5VDVpdjIzbHByaFVOaFcz?=
 =?utf-8?B?Qk53bngrQW9uamRqaWFmVC94SXNoY1YzUjBjV0R6UlNrWHlrUEV1L3pjTGda?=
 =?utf-8?B?MktLV0l1Rm9BbmdVTVlteGg5Q2ZnUnZmZDZWTlBlV2p2bDVaOXFZdU8rYzNX?=
 =?utf-8?B?dVYyNGtVKzA4aEU4YkVNaHo4WHFicndGa1RNbWltWW5VeitvS2dRU0FFVVJz?=
 =?utf-8?B?RCtvYWoxYU1VUFJHTmd1TWRnK1JOWTJvaG9jMXpXRXZ3ZXNsZk96T3JBS3A0?=
 =?utf-8?B?YmpGQjRlWEorNkVDSmV6MjFQUmhQODUvYTdjY3h5Mzd3UlBaYUg2WThtWFZL?=
 =?utf-8?B?MW9raWZRZEsvNE5KdGxycHJ6ZTM0eGY2UWhlSDF2TldZRE92bDdOZ1N1Qjht?=
 =?utf-8?B?VUVMM21oQWpnQ1VTOFF0Q0liaTRZaDlpNU9xNDBLSmh2eUtEUWlwR3BmbjV2?=
 =?utf-8?B?WG5pK0tUZk00U3QwcXgvdUFkMXJ2aWV3RUg1elozNnlVTCtJMzdLa0dVeDRx?=
 =?utf-8?Q?l1L5pBftzMfeBdapiRkukYc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffc8439-a528-4ec2-c347-08d9e4d16bd8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 15:50:35.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPG18xlyWc/8lCKVvfR4iuMys6j9FJvzDUn5CKR0edcHe2xLZxwCr7B7/f260Pr/0cvL0TB47dkQKIAQNqDvRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

On 31.01.2022 16:06, Oleksandr Andrushchenko wrote:
> Hi, Roger!
>>>               rom->type = VPCI_BAR_EMPTY;
>>>       }
>>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>>> index ed127a08a953..0a73b14a92dc 100644
>>> --- a/xen/include/xen/vpci.h
>>> +++ b/xen/include/xen/vpci.h
>>> @@ -68,7 +68,10 @@ struct vpci {
>>>       struct vpci_header {
>>>           /* Information about the PCI BARs of this device. */
>>>           struct vpci_bar {
>>> +            /* Physical view of the BAR. */
>> No, that's not the physical view, it's the physical (host) address.
>>
>>>               uint64_t addr;
>>> +            /* Guest view of the BAR: address and lower bits. */
>>> +            uint64_t guest_reg;
>> I continue to think it would be clearer if you store the guest address
>> here (gaddr, without the low bits) and add those in guest_bar_read
>> based on bar->{type,prefetchable}. Then it would be equivalent to the
>> existing 'addr' field.
>>
> I agreed first to do such a change, but then recalled our discussion with Jan [1].
> And then we decided that in order for it to be efficient it is better if we setup all the
> things during the write phase (rare), rather then during the write phase (more often).

Small correction: The 2nd "write" was likely meant to be "read". But
please recall that Roger is the maintainer of the code, so he gets
the final say.

Jan


