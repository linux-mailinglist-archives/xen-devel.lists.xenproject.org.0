Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B514E9369
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 13:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295403.502650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYnQv-0007tE-HI; Mon, 28 Mar 2022 11:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295403.502650; Mon, 28 Mar 2022 11:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYnQv-0007qm-D4; Mon, 28 Mar 2022 11:21:13 +0000
Received: by outflank-mailman (input) for mailman id 295403;
 Mon, 28 Mar 2022 11:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYnQu-0007qg-38
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 11:21:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b267895-ae89-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 13:21:10 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-C-21T5iiMK6XC_c2wpKyyw-1; Mon, 28 Mar 2022 13:21:08 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5748.eurprd04.prod.outlook.com (2603:10a6:208:123::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 11:21:07 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 11:21:06 +0000
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
X-Inumbo-ID: 2b267895-ae89-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648466469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PiJCa61unhO5yryVZ4HW6DE+2QIA8JuE7jKW9c+xtiI=;
	b=egd4yG7/ebOSblCsts0LudNtu1ECiox4nILkD/RpKD0jPYxXob7P0ELgtRswpDvI1Y+F46
	9A1aA6/2cUBTrD1xd2IKXbfGw8pC62avvpcpEG1c3xFWuh6dHpV9G2E4dfg3IzB/RzFo4K
	LLrOt0hNplvLhHymoNVuwhod2wZDO74=
X-MC-Unique: C-21T5iiMK6XC_c2wpKyyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h93QkaSIqk0jXs2jwt78f1I8raORvL/Y2jk4IyGNtHNlTbqnYzOGFIGYPPpw+CyJhCPRsxcGU3OaRsX5NNYdvQZY632M2r2QegrKPDrVMI36LgLAmrv07bWSJHbh5Sn7+E99bduHSXw9YCQlAEe4LOFKdzhsePOjtXpY8dvgcBp2ls9So9eHJs+e+NbSurxO7B1MLTX/4koTbeAuk25KYJ3nAYkNLHAoRY75xQgtyo7oMingeNyDQxU74JdS78nIcciCtCsKQaYLFH/ltKZzGBtLUXrfgMMLAerZ1ft7Z98df3/qYTs2vzQBQX5osCELegZ3qO4HohXdHI0Bi+VlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiJCa61unhO5yryVZ4HW6DE+2QIA8JuE7jKW9c+xtiI=;
 b=BMKkpI5uty5paTXc62lt+Oa+54TReo7RTVhbTotmBDvnKN/zSg5rRaTQXLIudUP8oKx2jMQzhenKmPq4D44WcUtaciHdIDqLdVzuZv0v622okYuotcxVZSoivIul5Rwzi97noqKvWYCsJ/Ay2WBSmC1Gte5TrzBTY7ud9z8+AVuPnvYepT8ZNs4RCTIye8mfOsfTlEl/VebIwfMq5ON1qMK2i1+cOsFGQrU+0atLvcL0RkNTDFDiIVyII2therjN4wIfC1GPL4wFphCL7ajYZwlkXKSYoDye17ubdZsH0PK5D1JcrsBfXd3XVD2xnHAU2SCy3IiKhzqH6ECzS8oBmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b86a45e6-cd2a-2072-78e4-22de098b02d0@suse.com>
Date: Mon, 28 Mar 2022 13:21:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/2] xen: Linker scripts synchronization
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <9345a37d-a091-6e32-fad6-9746e49646dc@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9345a37d-a091-6e32-fad6-9746e49646dc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a3edf1-1805-47c1-3dd3-08da10ad0d3f
X-MS-TrafficTypeDiagnostic: AM0PR04MB5748:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5748057AB1D60AC8DBA6DACBB31D9@AM0PR04MB5748.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Wy1OTBXYgYj0z3atO1djFVC8WEtMg/cP8OHbJbKWzxV12B9UewIsBfGcisOxGO9sC2eWj6k1AfqNkfyK6PMuUwWKnU4KbXOlTz3chClYOX1Xu/0/tLZaAer/7DZQXOsJ7IspPmTEASvAYQagYCNOUdzyVXWQYqNj7BGWJzegjv4UBTh0FLw5xQ+kKmGQXD2VzcWPAUCzGyqRbepTr/Cdu51JMUhSbKbGSxyEzc1sYLgrOfY17DTttmZaP4H8UhNLYI29PoROMYhxzFMJnf12n2TK3mpWMuZ39Xp2hhzprF+Gt0tQ1IYV6KFtnGJMV5jidjY0o4m0XqgasF7jmsmTZuX7e3JpDADr83yXl9Gmd0GoN1j9uPphUjYwWrQZLNBGtllX50xHZXWxIMKvrTKgh89OaTRejOG/Wph20CGNgB6wubtZ1icNmEsTS2gaEEmp2lgnanVYNqXyf0ZM7G19R7U638qyWi4bXB9jNAVEeC8OPk66zdAk4Acgjtl6qtKqe5E3xiBFvtlMIsCFpHBqrDfCxs+D+M2ETkS3799P8IoKLRQifGz4q5JeAcsh+1/axPTkqP4Qu0EUESD09zLD2NL7t0msg3CJVF2zyHb2yjVIsECUpFdW2GihdsyQdNjC04JFOv5dKXKom87HUMeSeLTmtTbwet+tlBkzRrfUV4P+oO2+cRl6Wu6q22HUgsxtfcfYzP3eDyVHGX/N/rT3ceM8qDBUhk1L3LsIDs4kr70K4Hpm7+cCEEOoGpvu8me
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66476007)(66556008)(66946007)(8676002)(6486002)(2906002)(5660300002)(316002)(36756003)(6512007)(54906003)(7416002)(83380400001)(31686004)(6916009)(38100700002)(2616005)(508600001)(26005)(8936002)(186003)(6506007)(31696002)(86362001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUdlR0N6MUxOS3d4bE9rZ3lQSnBaZCtBMnltVVRjMVMrdDlTSUVJR1Y3bVAw?=
 =?utf-8?B?TDhJTVVhajFpNlpKTy90clFSTytLVklUMFU4d1JlMkJwcnArQU5rRVBjeklj?=
 =?utf-8?B?SWhuSGJBYXplM2loM1ZuYllITVBpYTUwTVhZWjFmSkhZVmZiUW5pOHZrcjZs?=
 =?utf-8?B?cUJjMk5NRkdaUXlSOURYeS9lWEY4V2NXMlo3eTdLSVJ1bXd0ZERTRVVXUDdT?=
 =?utf-8?B?SlNwdXRZZHdRczdIQWM2YXV5TWZNbzRIMFNYTHhBak1zUlo0Tk9heERlL3JP?=
 =?utf-8?B?SHdZZFVWc1ZVcEJQem9FdlNobkc1NFZiMjhEWVJmZDZpQjMvMkhvQVd0bC8z?=
 =?utf-8?B?V3FKcWhYdWdkWmtyMm1wYXVLR2lueTFuMDA2R1Zvc04xWW1TejdockJISTU2?=
 =?utf-8?B?ZS90M0o0bnNnQjJGSjBrdzdNbWltMTFzck1YSGNXeXh0UW0vd0NiZ2RaYUY4?=
 =?utf-8?B?enUwY2w4aXBucnJqNVdSaE4xd1Qwd0Q1aCtNVmhvR1FpOUZrMXNhU1BTbm5B?=
 =?utf-8?B?Zm4vazNGTll2M3I5dCs3RzNUNExVTmR5YmVpYnBoZzRTdi8xVjZVa1lKREhD?=
 =?utf-8?B?cjlJNEQrem8yMTRiNWwwNzJsaWlUWGtULzQ2MyttT0N5NEo3RkNEdWljL0xR?=
 =?utf-8?B?enFLTHZCdDZ5SEFTTGhwcW13T0hsdjhuOEd4aUh2bGhYb3Z0WFNBSkdYK3hh?=
 =?utf-8?B?ZXFUYTlPd1VTeVBOaytwdU9zcm1vc2l1UjdTRjNtbjlvYWp4ZDRaeGNTZXIr?=
 =?utf-8?B?NElnOWpYaDYrOWczUDlwNVk5a0x6UGtnakRydisxYi9aK2I2Mjd5b0U3U1Bi?=
 =?utf-8?B?UFE0MUVqZkN5QmxEbE1wMVJqZHNkYkVnWVZGRzd0TlZhaWZPKzMzc0V4ZkZo?=
 =?utf-8?B?bmpLT2lHb1pFMFJZeGxiZVlLMWQ3bFZ3eUtUNldVMFNnSGhwb29KOW9HVG10?=
 =?utf-8?B?NDlmVEo1a2xjdE9kdnY0T2JmaU5mRkw4dms3QnQzd2JkN2V4YUJpaDZ2UVFs?=
 =?utf-8?B?eTNaV2hnNjBSbStVWWs4MHVubnA0QUlrdFltdW91NjIzbkl0eHhQRE9TY21k?=
 =?utf-8?B?dmpWUHp5Q2NGay9jVUZVeFVPZEpzZEVHbVlKaFFBcjY5Szd6UERMWGY3dU9k?=
 =?utf-8?B?ZURhQXA2YUc4TXJxZU90bUN1VHArZGRqWC9xR0QyUndpUjQ2c3lVc0tFSGxu?=
 =?utf-8?B?a1NmR3JEd0VlRGRXYzBDMzFlWlhENXlJbXhvNkxDQU10WVBEdWVTa2dZVUNt?=
 =?utf-8?B?MVk4Y0FnZ0JSTDIxaU5USmRHNFowcDdkNU83YVdhTVdBdlFuZm9Ta2ppVU1J?=
 =?utf-8?B?d2FDdTFvUXVNRUY3dnlsRzc2ZmJtcFZwSy9OT0VPZVgvejJPbitMU0V5S2dM?=
 =?utf-8?B?S1FGbnlYN01xcHdPWmJTWUExaEFEbGxHbnJRMkNFL0xuN2J1TzJEc3FrUEkv?=
 =?utf-8?B?d1hDajExOUxScVdPQUNiL2d0bGoyYTRLTGxHVUVvNVJ4cUk5UXRpajVwVG5p?=
 =?utf-8?B?Vjc2QWFySHR4aDJXNlh4U0tOVUVUcFk4amp1WnRxS3NkbE5rZXRUWExWS29s?=
 =?utf-8?B?T25KbVNCTTJpUisybUZDTjNTWjJkTk1WTkpoV3Z3bEJlT2Q5ZVNPNFh4b2Uy?=
 =?utf-8?B?LzRMdGJISlNoQUcwMjFSM0RFUXIzM2RkRGh2aG4wbTl6VUZXNVpRcnlYVmxn?=
 =?utf-8?B?NmVDT3ZkUXpWK1VlYWdJU1RtbVhoTGdpdWlzcjNCeENjV0tpd2lTVi9NSWFm?=
 =?utf-8?B?eTlvSmwyQnhUMHhXRFhJR3NsNTh3VVo2UERaRTRBOGdDb21SWVU1K0tHdmI2?=
 =?utf-8?B?UXBqemh0aXk2VEEwNUpFMy9VVkhqYlk0REhIdE9mcmkzYkRQeUF3blNhYWtC?=
 =?utf-8?B?elpmK0lFN09rK0dzOFErY0RlY1JlU3ZSVVFSWGZFT011dkNEcDVVZTFRNlhm?=
 =?utf-8?B?cE5VU2U2L3M1OVdwZ1cwZXVnbHhBQ3lyRWFET29lUjBnekVYZTVhd2xvYmtF?=
 =?utf-8?B?SEVLbnRGanBsVFpZbmFFWFFKcnI0TVVENmFlZy9pMDdBUmJ1V2dTMzNLeWhU?=
 =?utf-8?B?a05XUjdGYmFtdXNrUUpGNXE5MzUxTy9oZi9xa0pnckRjdVJ5ZkF3bytsVEQ4?=
 =?utf-8?B?ZDJZVUdYdTNPbzlpdmRlVER4UVdzL1p2b2srMTQxeTVLUkJLSmlxQnBrUHJ2?=
 =?utf-8?B?QTRPclAxbk0rSDdXcGVBYzZ5SitBSjRJTDRhcWdEZ2hpWDRhSExtMzdtQ0dH?=
 =?utf-8?B?cStjQzNLbE1PbFBoSWZSZDdEckNOT3VmWjFQMGo3d25aVFNlVHdlbUMwcWZD?=
 =?utf-8?B?dGQ3ckVHc1RXQmg2YUxXekZKd29sZmI3TEw2MFVWREVBeWdBV0ZQQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a3edf1-1805-47c1-3dd3-08da10ad0d3f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 11:21:06.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjD3tWW5SWqwWMmO4sDENW3+T3fxDRm+1yuFgGsL3D0+OS8LGYYiIRCPpoewJ1uOhn2dA88x+cTEwBAaWxkKCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5748

On 28.03.2022 12:31, Michal Orzel wrote:
> Could you please review this series as you did give some comments in v1?

I have it on my list of things to look at, yes.

Jan

> On 22.03.2022 09:02, Michal Orzel wrote:
>> This patch series aims to do the first step towards linker scripts
>> synchronization. Linker scripts for arm and x86 share a lot of common
>> sections and in order to make the process of changing/improving/syncing
>> them, these sections shall be defined in just one place.
>>
>> The first patch creates an empty header file xen.lds.h to store the
>> constructs mutual to both x86 and arm linker scripts. It also includes
>> this header in the scripts.
>>
>> The second patch populates xen.lds.h with the first portion of common
>> macros and replaces the original contructs with these helpers.
>>
>> Michal Orzel (2):
>>   xen: Introduce a header to store common linker scripts content
>>   xen: Populate xen.lds.h and make use of its macros
>>
>>  xen/arch/arm/xen.lds.S    |  38 +++++---------
>>  xen/arch/x86/xen.lds.S    |  79 +++-------------------------
>>  xen/include/xen/xen.lds.h | 108 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 129 insertions(+), 96 deletions(-)
>>  create mode 100644 xen/include/xen/xen.lds.h
>>
> 
> Cheers,
> Michal
> 


