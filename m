Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF0447C2A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 09:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223112.385655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0E0-00047U-KB; Mon, 08 Nov 2021 08:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223112.385655; Mon, 08 Nov 2021 08:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0E0-00044O-H3; Mon, 08 Nov 2021 08:41:56 +0000
Received: by outflank-mailman (input) for mailman id 223112;
 Mon, 08 Nov 2021 08:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk0Dy-00044I-MR
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 08:41:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b895c287-406f-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 09:41:52 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-THIJfhhnMYepm8h1T_XGsw-1; Mon, 08 Nov 2021 09:41:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 08:41:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 08:41:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0017.eurprd06.prod.outlook.com (2603:10a6:203:a3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 08:41:49 +0000
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
X-Inumbo-ID: b895c287-406f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636360912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9LVy9bnVK/GsSqmKAYdrdOdnm2p9mWGOzeWtJ7EUHw=;
	b=Av+BKIRQlkpuKoqtFh6zStun18e3pwxN0sczp06BEUeYENY6hbMWSERsifDHTF4BhWX5L9
	m/agngrv5P+jBpmKlt9GZb5FxswCtjG1w8Gh0jo24mdy2yhwdDjZyIz+JMI3S1Q4O7/hpR
	B6WR26CO4sSgI/sEy4wK8EnuhhAhYYs=
X-MC-Unique: THIJfhhnMYepm8h1T_XGsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaB+odhMCHWcSMGxGeaLaMcND1uP0zCO37uNEvz2yKQSCzAftVx8Mj/H5VNGs0lSOIyqdVKCaZfszMB2RZ1xz4vRv2HLz8hv3uFEySjrEClIZ0AYF0u/MT1+MUcTTI/yIiHZj8g3KfiWoyokh8LySWADaBwnY7xwpdirsYo5KTFpAcnMRZ+upJVMfVOojOcJ0/62w9DId2YkAXJNNMgHBY+H4Ne8rVMdHHbj0avUCE9bm6QEEju26ktaKkbb3bZ/CIyO1Fg0zDzfO0wZtELK5h1s4gKcNiJQuX+cAZMqqPMEzwWH3xMDeubEhRIdwQlPnwv2sejOazbVcrIMAquFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9LVy9bnVK/GsSqmKAYdrdOdnm2p9mWGOzeWtJ7EUHw=;
 b=dBFnmPZMD51popduryU5IbjUZ0ZjoYb1uVsyOFFMqzktJDOJgst0M+QOuglZO+X9X01zAvw9hAPgznC3FuvqPlt4AOjvkiNyypiTdaPjiEErvJZ/m7rwDu+fQV11S7jCY05M7NalzIuQ80icIo08+OsFXMib0ps/UrN9g2zAvb3xHXo5V9ll46eOCCxyhY1Jv58VTmCgwHdYK1IvugSQ9RKTBcaMPvTGWdpyvmS+jyw6LSGST+7cDkN05WrSPwaWqFJr0O0hSyKfvXKOpOnYStCP3OWwbtPQ/lZ1pXQWEYGYJRCbsHEnKT6vl+0IBMa9e9bALp5Vn7OJuWJlQiweiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8695a5d1-2699-fb0d-539e-c4d20a507dc2@suse.com>
Date: Mon, 8 Nov 2021 09:41:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [XEN][PATCH v2 1/1] Update libfdt to v1.6.1
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Vikram Garhwal <fnu.vikram@xilinx.com>
References: <1636006796-360115-1-git-send-email-fnu.vikram@xilinx.com>
 <1636006796-360115-2-git-send-email-fnu.vikram@xilinx.com>
 <BCD82839-0BBC-4CD6-956B-E4938D9ACB7D@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BCD82839-0BBC-4CD6-956B-E4938D9ACB7D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0017.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d044aa4-82fe-4457-c5cd-08d9a2939b80
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532819F16F6C940BEC46DF95B3919@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AaILNHRB99++vzhcMXwAMMMmD9eOjGKveweACj1IVESMjk9BLM6pBw8CUPB2LPx233PGCHhymeUi374RKog8qccMaLYnYf/5Vutor8D1KJJhp0wkgdZj6KbgjfKqlGjSmC1GQCaV8sp3qj+RFy9xoNn0OALpfU6aQY2Gz1ShtZWgX5nyTHsCJid9L18cE15/wwmDFIOzwe+UD3d0qIgGGrlhzucUgWHanYy5EWlXJG0TBmAEaN5LMjksIUj0zCXgtWwSvU33+nhI42aAmD55MSKXmATE8FMYzCvpTEUH/VI0atnr1NolTWawh5SpaKMdC0c6Osy4a8l+rwRZXA7RRRWU/BFbMXpzgcHQKn/S6wx3KfE2EHSK7uRzG4+HrlkTdVgxFnevVrnjGsMLx3oLQBsRhCh6M8+7GwB+kofNlOu8/91oYBSRFp7rU0CmQcBzCdfXNXAIosNdr/9qpumsn4yC5nVJPDAQPNPF+wZbBvYOydJhSnTk/AcCwwCAZ7w3aRcBQX0Qdc5mhhP7HO2LWNXBbKxn/kMhGk+SQ/WuPgGOdjC4EfDl2NxH8j2QqdOuRn9BzQZJFyvSIUNXESSXDY1ch8Om97vc0E9bpTHaC6P+xEHU8zXHGsnMfpsnzZ+69Bw0QppMWAMJh6Lr+8gsCt02RvqTlJ/nE7vM7o62SVDEibf4GqvhoXwNpMYwerSeb/Lfuo3cs+Wbge2TqmBsM/fD17IVmI59GaRuNWFjFLctUXVCTZYHLU3xwKaHDwGw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(508600001)(8676002)(26005)(31686004)(15650500001)(186003)(6916009)(4326008)(86362001)(54906003)(36756003)(53546011)(316002)(16576012)(6486002)(83380400001)(6666004)(31696002)(2616005)(38100700002)(956004)(5660300002)(66556008)(66476007)(2906002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2wxMGxQa1BDdG5vSXkrR1JsaTFyQlA0WCs0QXhlUmpMRkZ4RDdTZk5ibHdv?=
 =?utf-8?B?WUcxT21mT3QvQitZcDJvdytJUTRabGpYZnpTZHNiNVdYaWJCY2RYTW8rejRi?=
 =?utf-8?B?UGFzRXQzZTdYaGFDYXpZdU5IUitQaFhka1pPdEc5Tk5qL3VkVTM5ZEJmeDdw?=
 =?utf-8?B?cVBGbmNuaVQzZ0tKRzVzTGFwbE1xNzVqTGcvUlBwRDhoNnNNTlZBdER1OFE0?=
 =?utf-8?B?MkJTQ29GQ2h6STBJb0ViZWFLc0RMcm4zMjEvanVPQ1JvTDlXdjlDSnZxYXlI?=
 =?utf-8?B?Y01sL2IyM3dwWG5SVzVHQkNtLzR0SkF3WkNwcjg4T0dEZDBsdHgyWWMyanhD?=
 =?utf-8?B?dGI4VjRJYzdaYmp6YVBKWUtQZGZ3bnJzMnhISSsveDFPazk4anRubEtkYWVv?=
 =?utf-8?B?dGdKaUNRS25paWRlTHhGeC9hU2hPT3VMYkJPcTdSMkQwc1V5WCszd1hwM3lo?=
 =?utf-8?B?L3YrZFZ3Y1RnVFFzTDZaczliVWF1Q04wTm9TSmtmd2cwZGJvRVdvNnByblN3?=
 =?utf-8?B?UmNHbDdXekQ0MUtFeFIyTjBuOEpqci9BNDRRM3p3NnhUUkVmV3FhdVdSb2JG?=
 =?utf-8?B?RjVCcG1pMzRuVUNzSWx6dXBES2lIT1Q3TzNWWW9XUXZ1aFlTMUpNc0t6Nkxu?=
 =?utf-8?B?VTd2bktOeGEzbWNETE5GOWRMNGhOUFdzUXIwUDBkekFWd0YzbS95ZnNNaTJu?=
 =?utf-8?B?Lzh5SDFUR3RUZ0dnZHN2TTNZbFl4N2pSZUxNRjREcGh3TXdtZm95VytPdm9N?=
 =?utf-8?B?eWY4SGttOVViam91VlgvS1h5Yjg5eTREQ3doTzl6WHRMdVIweGQ2K0dqWkJ3?=
 =?utf-8?B?eHRjd1FlVWtlMC9BMkVwMmN3MzRNVVprMzExcDF0MmIzeE5RVzZXclJDQk5v?=
 =?utf-8?B?M3JoOGJmamc4UHc4NllRRlRFVFZJeTZ0NXRLeXE4cHhVOWJDZEJyblZyN1k1?=
 =?utf-8?B?aHhGdWVSM0RSWFNKNHkzQUU1OGRKcFJGdjVSNlRHeXpWaXJublZpWHlpY1Vt?=
 =?utf-8?B?ODlRTnBnU3lRVlNDYWZKdEE2K1JSaUVNMzdBemlXSXYwR0hvc1VybkJUVWdE?=
 =?utf-8?B?YkVUdEUvbldwY0s4b3hjRWc5UjU5d2xiSXI3Mm5oRzRVMzVxbUZtbVZCRU1p?=
 =?utf-8?B?OWhQZXdibzRuVFU1VW9tNzdhVmFtMndZd2dLaW1qS1dKYjNWZ0MxdFVwWEZ5?=
 =?utf-8?B?cTRTb3M5ajFIRXpuVHFBOHI2MGtCYk1KbkV4YjFaTlZHY0lTSTZKSEM2Mk02?=
 =?utf-8?B?Q042dkJCMnBVNUF0eC82NEQxZmZrN0JXWmFpSkkrOFBTeDJubzBBOHJtdHlW?=
 =?utf-8?B?WVg3RTJCdUVsZFpnR3JNWnB5enQvcWJGbzk5SEFPZXhEZFprMEozME5ENDIv?=
 =?utf-8?B?eFY4RWFFZ2RWUkszemF0RG4wUDJjN0RmbThYa280VVhSMVhZcmJoU2FDcjVG?=
 =?utf-8?B?SGtVTUlUUUhlZHZZV25FTk1SYXBpVEdXMUt4YjczYVlBY3hKeVBxVEo5VC9j?=
 =?utf-8?B?a1JoeDFiRHlOc3QxS1VTbEpJbVdxa2szL0w2UFhIb2lmN0EwRVRaQ2VjRWFJ?=
 =?utf-8?B?bTVJTlJFMzVLR016dlNReWt3QTJ6YTRDamxHMHBLM0dvSlkwOXdJblMvYmIz?=
 =?utf-8?B?cDMwOHlNeGd0Y2JsYVMwSEZ1dWpyYy9ZMjlZdUJiRm50UWsrems3SkZCbXFa?=
 =?utf-8?B?YUVSdDZ0S2dyemlneXE0ZTcyek5xbzVvNGthT0ZCSE9FeHdndWxUZTkvRjU5?=
 =?utf-8?B?cGxrSFh4c1pBbGM1VG1FYlpIcGFsYTJKamp3U2p2Z0NXRXFxT3NXc2J4Z0xj?=
 =?utf-8?B?VTFWWk5kR0xEdHltR25LWEFhVVp5KzB3T1E0UFJaN1NIZW56eWVoanZjT3pt?=
 =?utf-8?B?d3dlMWdldmRycSt0ZnNmZWlkWWg3VUN1NnJpM1dGREQrQ3dvVHZoNlEwTDlP?=
 =?utf-8?B?WlNHbUIrY2YzSTAwN2QxbkJBelFkbnBCaEFBS256WTh2V0MrbGxmR0FnWjZh?=
 =?utf-8?B?NTZwT3VJTlRTUjF1cE9VT2dJS1ZUTzhwSFdEdWlPdTZSeGlVeWQxcUhNRnZB?=
 =?utf-8?B?bWFZdjhDY0FLN1RuYksxR1YrUkc4Q3JEMk5JTE5JaWdnNEUrNEFDbEJDcEpl?=
 =?utf-8?B?YisrZXZJTnYvRDBLKzRoRGlzTjF4clRiclFDUjQ1RDkvOTNza1FyQ1Q5dlBs?=
 =?utf-8?Q?tOWogDY2twMcq4s9b/gVuJg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d044aa4-82fe-4457-c5cd-08d9a2939b80
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 08:41:50.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSnTJBZTUPf58jnc63Dr3yEWbqZ0f2LLNdOkk84UccAz/3HRgSnaZZByRG9+1eAzxqgjAJ0gpRqjP8MXq85wVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 05.11.2021 15:43, Bertrand Marquis wrote:
>> On 4 Nov 2021, at 06:19, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>>
>> Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
>> This update is done to support device tree overlays.
>>
>> A few minor changes are done to make it compatible with Xen:
>> fdt_overlay.c: overlay_fixup_phandle()
>>    Replace  strtoul() simple_strtoul() as strtoul() is not available in Xen lib
>>    and included lib.h.
>>    Change char *endptr to const char *endptr.
>>
>> libfdt_env.h:
>>    Changed path for config.h and stdbool.h. Remaining Xen changes to
>>    libfdt_env.h carried over from existing libfdt (v1.4.0)
> 
> I can confirm that you updated all sources to version 1.6.1 and the changes
> are actually limited to what you said here.
> 
> But you forgot to update the version.lds file to sync it (which was done on the
> previous update to 1.4.0). Could also update version.lds ?
> 
> I can also confirm this is compiling for arm32, arm64 and x86.

Since you mention it explicitly, I'm curious: x86? Do you have a
custom patch in place to enable device tree (and hence libfdt
building) there?

Jan


