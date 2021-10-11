Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A542892F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205508.360822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr2e-0000Zb-Fv; Mon, 11 Oct 2021 08:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205508.360822; Mon, 11 Oct 2021 08:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr2e-0000XV-Cv; Mon, 11 Oct 2021 08:52:16 +0000
Received: by outflank-mailman (input) for mailman id 205508;
 Mon, 11 Oct 2021 08:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZr2c-0000XJ-UL
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:52:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddc318d1-ac02-45cc-8c34-73490eefc624;
 Mon, 11 Oct 2021 08:52:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-sZI4k-bJMPC-czKH1S6e_w-1;
 Mon, 11 Oct 2021 10:52:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 08:52:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:52:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.10 via Frontend Transport; Mon, 11 Oct 2021 08:52:09 +0000
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
X-Inumbo-ID: ddc318d1-ac02-45cc-8c34-73490eefc624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633942333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZ7xgFW5MTP2F5/lY2w8Tbkjk3TQIxmeXUytyre37D4=;
	b=c+vlFx05W5JrMewJ2us4qpMJvKsSx2rzggGYB7aJdKzO9cuqfeLgAdbkmiZOBV0eGNHHMy
	i7Nw2P42IrGkPG32VJQtpvvnwEYBR8wSfWbGG/jAA2omSPPVB5XFQoT96NmQxq8DKDHHYh
	qnvXPWEwFtBXK20EjzgyosecjE1UsaY=
X-MC-Unique: sZI4k-bJMPC-czKH1S6e_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj1Whg3hnyECi/5HrFUnswn0B6N5/vzK/fXqNPiNxkdi7J7sXqt3TyVMIhGTUYtF8CNTwRTOxO9l71KCN+Qe0LKBiwT99kKsMsCOcJ6cKgARpduUg1El6fvMofUYLQoG0Ys26HOTBZ0MsNXIbsEtFE+fsY/EE5bbxvWrTtN6d0xwPnJ3eZG2IXbSfD8yi/IAq224uAmveLvhIKqpZE87VfbFemvXwb+hdDpGXLW4L9fy+sgjj+BJWl4sl6GCLDcP5vietBcw0LehPKJvPqRMUHwqjhhouIyE4fpIxn52hz1krQ/kkb+2T2WXaC10JsYMnXKkozLeO810Ua9M9DyUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ7xgFW5MTP2F5/lY2w8Tbkjk3TQIxmeXUytyre37D4=;
 b=HPcyzEiEheKaUg1A4AaTo/xUemR/e8tbSNgy6bkAzds3sY8m64tDLg0LRgbbILr+OvI2lG3uYyV1wAA0U1YBCXSy0KX2h4LJvWCbJwzeJ9/LbRWV2adt0fcpGxsA4Eauo87O83ZQs8E0cXxRUw1M7BIjGQAHAfGMrWYLSdsiWIk/I/gcgN72Pnx45gU0TzBDntWLNkgpeSHgPah742nqVvRmRGrSrGihX/WXbgRAiAQ7BaFlBJP9nmiM1GYb5rW5uNEGk3mw65xeO69t52fs96SDROYuXJ2JhvaS4Gz+H7TBQ9BRqyUb01hzRGp7Ob4tLnVVG6IE8P1lkllYBJZNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211011080302.24203-1-luca.fancellu@arm.com>
 <20211011080302.24203-2-luca.fancellu@arm.com>
 <d7acbd79-fca0-f388-5304-9f85dba304fc@suse.com>
 <9D5D9F7A-F399-4C8C-80A6-C3B8452729D0@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b235bb9b-d9c5-5e70-fbe7-9683e5979075@suse.com>
Date: Mon, 11 Oct 2021 10:52:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9D5D9F7A-F399-4C8C-80A6-C3B8452729D0@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e34859bf-0edf-4765-29a4-08d98c946963
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448F973472E2974C16BE1BBB3B59@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:378;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkLrxt26X/QPLDMIIJto9n0+J/cpbmEZrUHZ2t/NJ4Za+gmLomTsTiAxR51CfBW/gADFwLampstzetEjhDuAYf23YBwnR0KgN6cYQgCuCFx1c0gHukt6l9obLTjSwSidwMndPwyrKjKfV3VrRFX/ChYaELNC10pDMGLx4/4TtLHlDNNH2Dqeon36075DY5sHxvaBg4SxQmjH+xzvWDtym7wMpkFek1q9NgqQuXYksG8a9r5sKkcxJ/hziPav+lXmV1YfvNGi+jZRGOzOj7flsWqH0UA/Es6qXctdg5sqnm0bP2taqzln/wsWPxpapZywkAbBg4XG4fM5uYuITKBENr7GY6DU0OFHsaHnixwKxaimQzrggGM1m3JSRdhuyUOoLBFPwEQsuG0rtF6At12Doc0tMnXpuwBtUY0jgcEhGT+TUWyLmcGZnHw2xI3FxRTkyP7w7dKlmagg6Y/VxBGDFC171FZsloIMARt9FiGqzDcnqjP/a4ug6MZZvx6QEahQyTkQM480v3/Mxu0VimyWbQz9dE77NqP5wyr/UxvRru4kwJpjfBYAuW1aH+9zCVhe8xT5BtmjgwimEl9uVdwauV65o8j4RSwncSkIMSsUaCmcc7IzyEeFL4ioIymh/Zg8ptnecwW5h5jdioskinQH6WL8rAYkq5lylNTMBRlxAZOg6edM6RWujfEtjrm+pCiz8CLaIRd7WRsKjbtGvMfCNhQdF2ACaGYDbUGbYV2JLyqGIopjLQDw5uNozmcOxNhvDUykr4m5pFaCzQg6mz+3+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(66476007)(2906002)(16576012)(316002)(66556008)(6916009)(4326008)(508600001)(2616005)(956004)(31686004)(54906003)(38100700002)(36756003)(26005)(186003)(66946007)(7416002)(8936002)(53546011)(6486002)(8676002)(83380400001)(5660300002)(86362001)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1k1UmsxaWl2UXpHaFFnQlZLMDFVaTVIUzZkbTJiQXNGczAveEtISGxGQ2hl?=
 =?utf-8?B?bjBGS2ZndTF0NVF5SytJVndyTEZoenMxOUJvQitkVjEyOGMyT0lBRWlvaDlx?=
 =?utf-8?B?OHJyakx4dTI0NWFVOWtuZ2J4U0RYMXM1RzZuMXZDdUFnMmEzd3I0azA3SVNp?=
 =?utf-8?B?bVArUjdqUDJ4Yy9zTWNUMktqSldwNDBIMmxCYnFOVUppcXlmT2ttSFJDUmRT?=
 =?utf-8?B?aEE2SDBZb2hvcmdNc20yU3dMZ2dhcjZublo3T09NWUxsbDhxcWl4Wnp3MUZ4?=
 =?utf-8?B?ZDgvSzJacHBBUTJaT0lPbkhIWkRjak95WDd4eHRka1dmTzVoVzZvTkdnSUVk?=
 =?utf-8?B?MlFadGxJU0lYM1RmdTZTb2twVkVtMXpUSC9WOXBPMzNlRExBY3UxYkVNa051?=
 =?utf-8?B?WW1UWVlIbFhxRUs0WjV5czlkd2tHRjBiT3FMejF3TlNSRUtiR2hsZDlmUlcx?=
 =?utf-8?B?eTEydWFBU2ZrS3JhTjcraXNreWI4V3p6cWQwaEJRaExCbldYVGh2b0R0THVL?=
 =?utf-8?B?OHpqOE1FQ3pXQkpMUEVXbUxJWUxNUFMzNXovL2JUbTRDc1Z6bFRWWTV0YTJZ?=
 =?utf-8?B?dXZUNmlKZGYxeTdqM051R2drQTU5YWhRdHNNKzRUeWFML1h5T1dsTXAvZkNQ?=
 =?utf-8?B?bVlHUjgybVNOMk4xMm1YNUs4SURvT2J5ZTk2UVRJa09MaDhNQ0dMTkNrbHY3?=
 =?utf-8?B?YUhrVjVvalRrdzdyYmpIQjFuMHVwaE5zZ0JNNEhDQ2ZBSFE1V1NqajRXNW9T?=
 =?utf-8?B?VWZTUzU0ZXpDRGVTSmFDUVMwVVhLbmNWNkw0YkV5QUthK1RNK1Bxa3FOeGFP?=
 =?utf-8?B?VWdjQVI4QS9aZ3REM3E2MlVRMVd0VlJZN3B0OFc2Zi9zMVd0cnFvbDZKYVFV?=
 =?utf-8?B?S1V4WkNQZ0ZzZnpweUJ0Tlh0TjJxejhZVFBxRlR3bVFwbEN2VE5UclY0UjhL?=
 =?utf-8?B?aitOSlhhb3NNQ2hDUmdSUTlUeDlNVmRKOTVFQnc0S3hLWktyemxScmtob3No?=
 =?utf-8?B?TTBhY1Uzc1lxQnFpSEVjdDFPNGk5bmlLWlR6R2ZDbm9QdmVEaDNtaEgvM3pP?=
 =?utf-8?B?UzZwS1VQdzNGakh2eFJodDhoNzcyLzZWS3BvSndZMDZYWlZPK00vV3puL0lq?=
 =?utf-8?B?ZTYybk5uUmVrQytJNCtKYklQMTZsVmxwK1E1a21xNkhvRHh2WlRWbTh2bHJD?=
 =?utf-8?B?U1dkNyt1c1ZNRlVDVlFYT0RCSkxqZTZmbnNSOUErSGRXdC9IaE45N3RXNmZy?=
 =?utf-8?B?aFVIUFZTRWFVMDFPRHNWYXFnNmM5OWQzMkxMUUFBZ2ZlbHFsdFNaVnFsRE9L?=
 =?utf-8?B?RlRLV3VpYm9PQ2FSVzZDYUtsTWg4TEJhV1NoLy9GbTFwakFpZ1hLZlJPL083?=
 =?utf-8?B?ZGM1QlZGOTFwS2dXNmNwQzNqaEtRZHhSVWxibldVRnZOZ25ObFduUmo5NEV6?=
 =?utf-8?B?cVM0VzhzY3B4YXdqUDRvdkNDQTlOSU1tOFE0R080UzNvQ01TcWx1TFhaUm1t?=
 =?utf-8?B?dnkrdExUV1IxUllzbzIxM25Dd01ReGZFNUVoMldLZXJnMWJ2Z091cERTYTNE?=
 =?utf-8?B?bmtXOTVhOTRxbTUrSUxrZWdtM0M5SGxjTFREU2x4QmZoalBIYlNuTnlOb0pY?=
 =?utf-8?B?RGpZTjFPK3B4eXY3elovRGpzRW9IMVlnbUFsRzg4bWE3Z3VNa0RTYTNGUWhC?=
 =?utf-8?B?cmg0UWQxZXpTbUlnVTVreFFydmpjMEpYVVdqVjlQeEVlZnA2WE5tcWFRRVc0?=
 =?utf-8?Q?8EnzJK2iTaot3Whut9JBD9LuNCgmxw+YTfzp+mg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34859bf-0edf-4765-29a4-08d98c946963
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:52:10.1590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXkBV3MLe0ekofmorXI7CSse9fwsg7DGy3H5zJpvvYuOyktJm6ldwiwetLea7MxVtVqIX/l8iy9NWVNrv5tmvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 11.10.2021 10:50, Luca Fancellu wrote:
>> On 11 Oct 2021, at 09:11, Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.10.2021 10:03, Luca Fancellu wrote:
>>> This patch introduces the support for dom0less configuration
>>> when using UEFI boot on ARM, it permits the EFI boot to
>>> continue if no dom0 kernel is specified but at least one domU
>>> is found.
>>>
>>> Introduce the new property "xen,uefi-binary" for device tree boot
>>> module nodes that are subnode of "xen,domain" compatible nodes.
>>> The property holds a string containing the file name of the
>>> binary that shall be loaded by the uefi loader from the filesystem.
>>>
>>> Introduce a new call efi_check_dt_boot(...) called during EFI boot
>>> that checks for module to be loaded using device tree.
>>> Architectures that don't support device tree don't have to
>>> provide this function.
>>>
>>> Update efi documentation about how to start a dom0less
>>> setup using UEFI
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Did you get indication that these are fine to retain with ...
>>
>>> ---
>>> Changes in v5:
>>> - Removed unneeded variable initialization
>>> - Fixed comment
>>> - Fixed error message for the absence of an initial domain kernel
>>> - changed efi_arch_check_dt_boot to efi_check_dt_boot and add
>>> a stub if CONFIG_HAS_DEVICE_TREE is not declared, updated commit
>>> message about the call introduction in the EFI boot flow.
>>
>> ... all of these changes? Every individual change may be minor enough,
>> but their sum makes me wonder. If so (or if at least one of the two
>> gets re-offered)
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> albeit preferably with ...
>>
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>>>     StdErr->OutputString(StdErr, (CHAR16 *)s );
>>> }
>>>
>>> +#ifndef CONFIG_HAS_DEVICE_TREE
>>> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>
>> ... the "inline" here dropped. We don't normally add this outside of
>> headers, leaving it to the compiler to decide. In headers it's wanted
>> to avoid "defined by never used" style warnings.
> 
> Ok I can drop it in a next serie and retain your Ack, or is it something that
> can be done on commit? 

I guess that's easy enough to do while committing. Provided of course
the two R-b get confirmed.

Jan


