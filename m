Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF8252A5AB
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331040.554486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyoL-0007jP-H3; Tue, 17 May 2022 15:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331040.554486; Tue, 17 May 2022 15:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyoL-0007fv-Dz; Tue, 17 May 2022 15:08:33 +0000
Received: by outflank-mailman (input) for mailman id 331040;
 Tue, 17 May 2022 15:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqyoJ-0007fp-Gq
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:08:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 361445d1-d5f3-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:08:30 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-acxp4xaUMG6AZvV19aEdog-1; Tue, 17 May 2022 17:08:26 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5402.eurprd04.prod.outlook.com (2603:10a6:10:8f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:08:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:08:25 +0000
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
X-Inumbo-ID: 361445d1-d5f3-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652800110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjGBrCKCZBFFxIz0cjPIUlhGrfR5k3++i99IhLXcat4=;
	b=bFkLNhtcT2Eh+3hShUsqOAV4D/dZoC6wUDbf/c2anseBO9grUG58nxGlhrAriXG2KKOdfk
	pXeIThwDwK6yWBhVr7jq4Et3SCBwF9nZwgPO1zn/hwMRCzFY6yoryvNpd2IZVc7M7OXKI0
	g1HkwursNVAb9Rk3BaH4h/VqpbElPm0=
X-MC-Unique: acxp4xaUMG6AZvV19aEdog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqMBSSh8Cxf/CS8UeFBs9UTHvhmnpsQOaV0TsmQytvCYdDDjSWIZIA4N8UyR0JEryKA7oLi3+m6KuUg7H1GMN1xRItIVJX88qCljA5pvdwHW5YTdyKmeTnE+DrGsZw8M6zpZIn4TUZn/GduSJi4G2XYtaCPlbUxyCAJ8JyIRKPrVDHwxN5WBp19ion/mGE0q6QzFIkfwCNLVR2V7kcYTtzc3LFOsD+fMDHhpJ4BiY5bc5JqXlwwgH1qmyJRlHdzqgS3HzVLxLPaggI3G/0DEfZ1hE4cmq0ekkbA4pWSs96D4zydVlBlcCunKtD3peY5M0fBxWckJgggSWJlHJ1IT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjGBrCKCZBFFxIz0cjPIUlhGrfR5k3++i99IhLXcat4=;
 b=n8TF9i8OGxiBBjMTVAv/0tNsO2Nuk+GvfUmj8mewoO0hm+GtExdgjgexaUC+fzKgR6P96FZAOiQVN4SEtUFAWFm5IGCB1IELlQwOg7krDJAfERRNNVDgEkKaHHUe7ph2sZLlx4BBPFvstXVmXBZ4SSbtAkwLtHMFv4I5X45SNmlu22ssoNDdCKqBjgBg6yyCvWC4J95VW/ELY0ZLeZVNUAUbxRAlMY6kB2anoSWAhNKoivaDbmVG/bfTKXl9HuhTAg/wN7KKbz3QxNkKZEd5rwAPZ/dDLAvDvv4E+mj8LtbXxb+VM3XiI84tft6ezY984cu2YjJRwNIsWCGxv2OS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d3a35db-d2fa-0893-e3fb-d1edd58cb95a@suse.com>
Date: Tue, 17 May 2022 17:08:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: ECLAIR Xen x86 results and progress
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "julien@xen.org" <julien@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>,
 "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop>
 <3F6B0F2E-0CF6-4C60-A803-DD8A5EAF0DFB@arm.com>
 <alpine.DEB.2.22.394.2205091231570.43560@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2205091231570.43560@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0149.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7344df8a-c037-4b29-9b0b-08da38171702
X-MS-TrafficTypeDiagnostic: DB7PR04MB5402:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB54027191DB662F60500F0769B3CE9@DB7PR04MB5402.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Ids+0TszYD6H8w047OuvhqCyEgzC9dOwV70+BfsoKrPaL7fOzi5x4111YLiJ5O4HeatDxQFnguUXlBJ7bZoLB3fNYLccp7HRyKshuMBawLnL95+3HugCffnz/ttnhKGIA4itqtwpKrQyjUc8Jg2p+Y4smACmR3L5XzjTWjk1VSi3JknVR9o1Tk9I/G5cYh1cwx9TpZCRem8ATPvfY5dce7BgL2Mhe0nVTLTu4Zx1U0XMSdH+Zfyhj7MqfEJGe4FVDy5H7OdDh3PeuQ+c7zDXVSGlCkDnSMX3GwbyaUA+dJna6lgOGq5tlSWYjlT2dKCV94VxA4cSsspBnnFcZ2Bc5ijZeubvD88143EK4LN01P7CpbBJMQoIr051UHThGsRQGXLT0L2i5LOuK40qqI/Eb2MeJ+VHf6uUeenOuFixdQGYQcYKnGznChgF60fX99f1gJZAX5M02nu7PdICT4X5eVMfoPX03ELv6LvdwQdoZEIgmIQeHm/2TCnEkESqCCpaLnLNW0KyEk5PLB9QHqX6ORfNO8gQmcVypHn/CNgLSvw3glkx+gmMzirbRPx15IoCvLooJ5AFYosxsDTJ7dOojgWAmImk1HCwXUTUIWXrTJU6/sXOAiHCz5MAIeK/BJFFECLThf0UnFP4wMDuHtz3BDul0xtl0ZTix9RjdejhmZLa1v65wDbyILgGDqvGRg1JFeN/5I0F3kmb6iXWH8dGrzztl8IcUXY8l2H/MhFOslfy9Rwr2JrX1qufEz2I1g9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(316002)(36756003)(2906002)(6486002)(6666004)(5660300002)(26005)(6506007)(86362001)(6512007)(4326008)(66946007)(38100700002)(66476007)(508600001)(66556008)(8676002)(8936002)(6916009)(186003)(4744005)(2616005)(31696002)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWhUQ201dm12bCtLdFJIV0krZW9rN1NYNDBsMFFRMDhndFN2bCsxVEZGcEYv?=
 =?utf-8?B?MFJvQzY2ZnNHWFZBWUdlZEQ4d1U0dmViTStjMnh4MnZKZ0crN253OHE0TXhu?=
 =?utf-8?B?bVJKV1huQnJHQTF0SWozLzN5OTdoY0tQQ2lpbjE2Uzl4N0tNTUx2cXpQZU81?=
 =?utf-8?B?WXZDWkZyT2U5U0FNR3p6QnpQNUtTQmJrSWkvaTVqRHJ4VHR4alJISHh6S1VO?=
 =?utf-8?B?SEZXQ1dSaFBEOXVic2xHVWo1SEdqeWlKTTc1ZWoxa0U3WjZZUm9lNHlycmE5?=
 =?utf-8?B?QWtFdFlNdmlHY3dlNVpyaTBMMFJCN2FFWm8xNityZnU1Ymw1d3owcUNGVFNn?=
 =?utf-8?B?MWo4WTRQdFpDK2tKL3FRamhTdER0bThpam9HbjExNCtSYUVTMXlkRE5wRTlL?=
 =?utf-8?B?bHdJM3paYzRGZmt6WmxBc2VMYUgyVTRVU2hNcDVDMVVVK3QraS9UbUk3Mk9W?=
 =?utf-8?B?T3Z0K3NQRCtSeWdSeUhJeUFPd3Q0cmxTQ1J2NFp6dTFJdUlmcThoNVBGUHhr?=
 =?utf-8?B?TEZ6UC90MjNzRUw5SjBxY3RDRnQ5dCtJUHZ5KzBraGVZOEV1ejdYKytkYm9K?=
 =?utf-8?B?OWVWK29zVS9iY1dvUTB3ZlFhaTdTbk82RkM3MjlwQkFyTWZ3NENJSDJld2hY?=
 =?utf-8?B?Y2l1N3A3YytXWTZTVi84blc4cGlWWGVaWVBIYmJ0bUZjRStvekp3YlJscGdC?=
 =?utf-8?B?bVFYK0JlNlRlc3JiUzQ5T09XRGlXSWx2bnQreGtkdExrVkxFRnlJUHkyWnR2?=
 =?utf-8?B?VnE3VmxIMk5WNnhSNzdCSEk4RnVTOVJORyswcEVSM1NiUmlOOG10M3JZN1Z3?=
 =?utf-8?B?MmVodDBZTEZsSFBTa1VxUTRYSjhqcDYwZ3M2RTlDRGxxcWYyYjlPVmo1V1dX?=
 =?utf-8?B?bFNuK2lSblRhMExlTXFocnBpWjVLMTNESWRxVDR1NnhNT1RPOXBtdGlYOTlp?=
 =?utf-8?B?N0R1VStHL2lWT0I2Tms0aFRRak10eVlvbWJmRjdQMW1kVm0wNVpHWDMrYldD?=
 =?utf-8?B?b3dvRlpleFdHbmtnelY2Skc3YmErMEg4R1l3NlJhUjkwQ05jV3Z2Q0t2d0RD?=
 =?utf-8?B?dnlQMElSTkU5aW42czdHeng3VjZ4MmJYbzNlRXRPUVl5dDcwSi82b21lbW9n?=
 =?utf-8?B?QWVRQkJqVDRNaXJrSHdkQzlLK09NUzliQU1XRnV1a2pXbWVkVFNBL2Njc2pV?=
 =?utf-8?B?NUhCTkFwaEFQdVRUYkpQakEwR0I0OXJFZ2JoYU1oZ00zeHNMOUszYW8xOFZx?=
 =?utf-8?B?WlN4WDZoVWJkOFpyRlVPUnR6M0loZXNQSlBpdGg4ekhjQ1p4SnJCRDVSN3FU?=
 =?utf-8?B?TzV4d0Z4bjNlbXlsUFR6VW9zOHYzZjkxODg5MVpkL2gvKzVCN2xJSU9FN3NQ?=
 =?utf-8?B?RktJTXJuUWhENkwvNlBiQ3FIMUo0LzN6QUtKMVNEdFZ1THBJdGZ5SSsyTUhT?=
 =?utf-8?B?ZTd5ekRpTmIyK3poRGNYaXJXa3dlUGkzU25GTDdvWFUyamRUaHF3TFFtK1R2?=
 =?utf-8?B?bENmVHBnOTJhenZIamRLMkxPNkRoMFFkRXhXMUdxY0RqZ0l5RGwzVlhTUUhD?=
 =?utf-8?B?bEN4UmNuYitBWEcrNExiaHpheDZXR3FsLzdtV2lqZ1oxb0VpdUhBQ3c4dHFj?=
 =?utf-8?B?Uzc5aS9kL0F6ZnhXM05BalozUzhENnFCT3RiVDRoT3VhQ0w4c0NKMFVPVXZ1?=
 =?utf-8?B?cXlFNXduejlrVUpSS01RbzRud2FNWHExdWZ5QzFhUDRkUVVNQ2VwckdyTjA1?=
 =?utf-8?B?ZW8raWNMcUlTTnJjSzZxbG5VVlNHdWNjN3lLK3lob1Jpay8xaGQrNUNGUFlo?=
 =?utf-8?B?dGl2RDAzdTdoTzZWclhKdEpwSVBhSVJRcGhuQjJvUjJpZzRNaElmM3RnZnZG?=
 =?utf-8?B?cGltWWxXY1kzWlVDeDQ5M0ZUejVBSjR0M2c2YkFGeWdPbVhNUTB4cmNWNlVl?=
 =?utf-8?B?KzlHSkFiTTdSdTBGeXRxaEZJaXVSY2FSclpZL0lodFN4SzNYeUxydVhaOG1i?=
 =?utf-8?B?ZFl3WTYxNGtvQmttcWNCWndRTVpnS2EwMGVzcEp3VjhKZ0RpdHViSmMrVHY2?=
 =?utf-8?B?VVlYUVNsbUYrbGFJZTRzZ0x2bHRMcmxlVDNDYm0vSWNzaGJaNzd5bis2NXlu?=
 =?utf-8?B?bmdQYXM1WnZrbk5PWnpiVWtyeUlaUUdjOVkyU0N4OWU4ZEJHcnpRam40NHd2?=
 =?utf-8?B?WDR1eVZmV2xJYkVuN2QvUHp4a0dubVlHT1ozZ0JjRzJQdmFIUkhucWlCRmdE?=
 =?utf-8?B?Sjd4RUFseTZNVFBVaEVkMGpNZGhNTEFlSHVFdWRxZTZUYzFpbkhOV0RERGRo?=
 =?utf-8?B?NU1GTmNDQ2E5cGdRNDcvUFI5dUtKZ1VnV1YwMHRudituSWc4UW9KZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7344df8a-c037-4b29-9b0b-08da38171702
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:08:24.9515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gk1Y8F7nZxNmFY7A9FPx3dpiaa9ON4K8WcmGJ+oVa4KfUzdpkZa9x5x4a27wT9+/ijzQF5kDC2clgLVm6POhCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5402

On 09.05.2022 21:55, Stefano Stabellini wrote:
> # Rule 8.6 " An identifier with external linkage shall have exactly one external definition"
> 
> This one is meant to catch cases where there are 2 definitions for 1
> declaration:
> 
> header.h:
> extern int hello;
> 
> file1.c:
> int hello;
> 
> file2:
> int hello;

Which won't build (link) anyway with our use of -fno-common.

Jan


