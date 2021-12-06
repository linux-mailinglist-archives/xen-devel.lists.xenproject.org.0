Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA9469966
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:46:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239171.414554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFFd-0003K1-4z; Mon, 06 Dec 2021 14:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239171.414554; Mon, 06 Dec 2021 14:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFFd-0003Hf-1Q; Mon, 06 Dec 2021 14:45:57 +0000
Received: by outflank-mailman (input) for mailman id 239171;
 Mon, 06 Dec 2021 14:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muFFc-0003HZ-0I
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:45:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3728bb59-56a3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:45:54 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-TKhwINvUOyCfvgxSeO4MOw-1; Mon, 06 Dec 2021 15:45:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 14:45:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:45:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0097.eurprd04.prod.outlook.com (2603:10a6:20b:31e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 14:45:50 +0000
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
X-Inumbo-ID: 3728bb59-56a3-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638801954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3W/txn/hWiilUjdldPJb2V129+5aZT5R3XJ2wEN0+gw=;
	b=ZvCFpOBHIM+9EWVk7e3pQhT+i17VYJHkuygeTrZIZKIBHt31GvKXQJEDyBiNqYvJMY2Qd+
	z1hEsfIqETAJA5ZZ3TWGWgPn7Jk9/UAUBTYWgPtm4dSeCTdwdzl+4arTXiQXS/gPXtHzQB
	LSFZ+WFUsHw4ZShtDsKu8VwjzhorPwQ=
X-MC-Unique: TKhwINvUOyCfvgxSeO4MOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAKee9lki7UmMZIGbVrVMkbEj+ybYaLxZ9u6RqdmtlCS3+SlQvFJfjh/0ZtgO6kbrLiyHLHL5c7NuIP4EO5zKq+zrUBJI0XCadbdSVDCexH8CE2G5UHzN2TR5iCar8JHSlGyG/jmeW6Kn9N+B6R5H0hMVBnLlcQ49S4wsBUAgDi/L8FOD22aMBtZ+Bp1EE+EqB6zdDIxYFBBiwgHJQG8vE/kPuG08bmMth+i6y1JhSbzPG5sRYM862A/Lm8/4hkixeSYzn3nH99I3u8BYP+6i7ogFA7qf9hmRtj2ZuHMVoKXpOzE9tctJ93/m6no4cxdkPbzADCj7taJ3Ks7ke31IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W/txn/hWiilUjdldPJb2V129+5aZT5R3XJ2wEN0+gw=;
 b=fiNevMrajgFj7YLxe6pvHkWmWWgpGshh9zMPAb4pueKP24mSg5CQwN4z5IrRO4q6vMQlWrfvDz+aVGjgznW3/8uq3bWqsu5hanqrvXzh9BZCV7YFKbn8U977E82O0b+Q2xvex/eS/NjjhHnCpPhHDU33mZ3T6+9gzeWp+Q7sJtdD7EfX7yPnBk/OBHkw2SHPnDWvj54uhJHUGTWGDGkShiowghDOxj5SF5zToE37eGr+RRDnAs2+ctViYMbBU0DYIDtnjaz2KfUq3y8E4N2M6/hwxqHmzLkasnexbOdY1ppiiG3S3G0zYpFM12BqJFvUhOKL6qSErmW5aK3YBimtyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d46117a-972f-e341-94a0-0393d47c046f@suse.com>
Date: Mon, 6 Dec 2021 15:45:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211206142032.27536-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0097.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf29676a-1fde-471d-a2fc-08d9b8c7192e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829F9C404C52AC3A75B473DB36D9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fk3Rw1Qi+V5rr2YJne/jyr/eR2bnIcvSEa30lIP4C/Ww33B3ehLjDizTT/wk/Pu44v02qY74yjxn70XUylRhf4ZsX0TwGOuFywa83PmkOllpOPtMcvkNeaBS43X4hTCCr8fCzM/9is04jAiWWeP/NNewwsLpPA34iKJIFgPVot4ee8DT6o/Z1WZ+Zdu0H7DdhTCX6hanmCDpn9OxVKWfiHK/I9R5C0eEpOR5DJFLnx1HbL/j5hgCf/Cgbbuk1U1FxGVEbQrLniofpB0dzH2KBarjFzrE3g0X8SoO6vPs/hPRLtjIDxY6BjcmHm8Rn7QM62Ai4QuVD2pfdQn0ndqkrqWecQxDGu3hJAH+wVIP1nEnXimgfrtR8WO5Rx5h7jF9a7D7ct55XU/Sjswfhln/yxSOrrXlg3F7vNCOy0fwkxAiu2C2hr+cyFLES0jfj6JfVIQ3G4IFgooe68BZiCQRtce5A9KneDlUg46SKopqM3NpDdHTVNtVf8xWfVVe0ALsmsoffAa0XyGc8m5HN/a4ew05CG2lj++mzOBj70tIqO1oYi4fq2CTkNnkPibgGei6OWrMvGduwHyzFs3AKDxaunFHwZQaXvHf3JC2KWSPAqchSDNGW7lTGjsFn4BcoVpYIFLIIxcRJ79Rts4r5GpCmRUKtuv9WcSGkvx5xFb9qqY+bmHNGnn1rPWF/P0eJVT5pHDW7GqjO4sXscVITPaztoRrWNYdeDCCChz6QKNTFxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4744005)(2616005)(956004)(8936002)(186003)(31686004)(8676002)(36756003)(6486002)(53546011)(316002)(6916009)(66476007)(5660300002)(86362001)(31696002)(2906002)(26005)(4326008)(66946007)(16576012)(54906003)(508600001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHF4MHRoSjlzYmZscTJTM2g5RC9FUDZabjhlOG9hdGNkbUFYaGFMVXhCcUVm?=
 =?utf-8?B?N3hyamJud3h4WExNQUZndGhWUUVJWFJTZGVsWFRrdWV3SXRLbEdERWhmVTVq?=
 =?utf-8?B?dy9OM2RQd282ZzN5RTd3aEROQUZodVREWURCZVlvVVJHTHhYN3BZUENOdDhk?=
 =?utf-8?B?RkFDeHcvaTFUNFZPTzBMTUVyVUR1aHZrVDZJLytkWnpTT0VudHkxcWJlbEJ4?=
 =?utf-8?B?ZkpQdUdVaWROdFFrRzR1UVZYZXNWM3h3NXNJL1F0cnJ2bTJnZm5nZk9CK01t?=
 =?utf-8?B?ZnNSaVVpTTNPZzk0MXBGdjF1V3VUMEs3RE0zVFYzS3o2UHMwT2ZoQ3ZxY01Z?=
 =?utf-8?B?czMxcVJlTVlkYzFQUEg0RmdUemMwanBEbHRoOWwvSzZla1l0WFBmU2Z2V3h1?=
 =?utf-8?B?ZnlzTmZ5b1QwcDE4VHVlVnpWNVVwckVDMkFmTFlSSkVidmVnNCtsUk5hOFVz?=
 =?utf-8?B?RjVSWjBiL0Z1bWF5ZjdvOTJBbTlxc2t4dm0yR0kzeGVlZTlLcHU4WEJZaFRT?=
 =?utf-8?B?SGxQVE1WVXhiVEEraVUxeXF5NWZpdnRNQ3RsbG5OczY0WUxHeTgvaFQrKzhq?=
 =?utf-8?B?VlZjQVRXZ2ZLUUwrL1Q5R3QyRzV0Z0g0YnkxTXVETm9jUEZMNmY3SXlnV2Qr?=
 =?utf-8?B?UFZIMXZSSzdpNGxUZ0tDdWQyS0NvUFNUL2t1bTVteXgzS1k2YXNqRjU4MnRP?=
 =?utf-8?B?Wmt3cmJCTWZ4QUo5TDU2U0QrODgyT3h3dXNDSU5Vd1cwK2Y3Njd5aitZQmth?=
 =?utf-8?B?L2FlenZTK1dYMElDSG9FRkNoZTJBZWtaUWM0WjZMc1ZnWVgwQjZlaS9EUU03?=
 =?utf-8?B?YmRWbkV3Y1BlWERucUZMbEtiYzc3RDJJWVp5Q0pUWmhWZkJTQkZtVlFKajVU?=
 =?utf-8?B?d1ZLL010NE1MLzJkd2x2MHh6eGdlbHh4L0Z2em8wSUpXUG12Y1RtbllzMkdH?=
 =?utf-8?B?Tmx2ZEpvamRGNlJMcnN6RGY3dS9hVjdYRWJrK28xcWQ5Yi9MT2NTY0NISzRZ?=
 =?utf-8?B?aG1VOHlKNDFPQ3U0TCtQMGRHTTEwdHFqVHl3ajBGeHFndU9jL0tHbGpPUk5Q?=
 =?utf-8?B?ZjBJUGNiTWFGaGd5WG9GeS91OVNGcXlaL2FMWnpJSFMwS3duUFBKUUw2RUxN?=
 =?utf-8?B?Tm81bjhiTEl3aGJpa1l2T1c3aXhZZ1ZmYWVGRnZoUnB5bWE0ZkJ2Kyttcklq?=
 =?utf-8?B?L0owZXl0dS9kdXlYR3lrRytFN0YyY21UMm1NVktWOURNNWJycXBrOHRPSlkv?=
 =?utf-8?B?cjNCMjNEOFJIb09VeEdIUVlUMG5OcnhYUE1Fc0RmZ2N5NHhVTkZVN1g0SnpM?=
 =?utf-8?B?MjBGU3dqNy9CNVEyd2ZLZThONXNic2s1VE5TL2xDQWgraDhEYnlFY1lTd2xQ?=
 =?utf-8?B?bDg3ZnR1UkJtODdvb0JSdGt0NFJqU0cxakxZWlR0MXJPajVQQWtXYUxiY3J6?=
 =?utf-8?B?TWI1OHFNQlJXbTNONnUwTHhhRlBFVTBxU2Q0UWRhVHVGdTdPR1cvRmxjdHRr?=
 =?utf-8?B?QjZXVEFYRW9hZG12cVBnaUYxMlkyUk9FR3BSMjhCaUNtRXYxblJxQlZJbk55?=
 =?utf-8?B?ejJUczNiQWZBbk9hVXdISXVKcmh0ZnJ4RHNvU3YvY3VtMi9FUVNkMHNJbkpY?=
 =?utf-8?B?Q2E3WTJzRVZzVzlNYlpjaEtYbHoyL1dmc2RxUDI1V2xaSFZHNm53THIvTVd6?=
 =?utf-8?B?Mks3V3FmZE0wRTU1Mlg5cnZqTWJYaEJBTXZQZlc1dW1WZE5HTWVqSGVmTGxi?=
 =?utf-8?B?VVFpT2sxaFplQ25GcDFRTC9RUm82U1FNd0VLZEpwUEFsbnk5S1k4YUowYkFr?=
 =?utf-8?B?RWtyL2Z2cU5oTTNRd3lHdEJBc0I3VHVZQVRVNCsvQUFKRnNBbEFJWEN2UUVU?=
 =?utf-8?B?NENVaGhPK0hUUmY3K1lQbld2SmVzZ2R1cmYxWURZQlJNMTFXTHBFS2JIaDdO?=
 =?utf-8?B?alFjZ29vWkJQQVNDT1A4QnVNS3NyM0pwMVFUWkxLOFo5a2F3YXJ1QnNqRlRX?=
 =?utf-8?B?SXEzeE1MS3Q5ZzA2cGZqRUhZUmlocllGYktPenJ1OGc3aUhGeW41ZFlRVGo4?=
 =?utf-8?B?c3NVa0JHb29XekNSRTVNMTRXSHFXS0lvMHY1TG1PTzRmSVoxc0xtVzFrUlZu?=
 =?utf-8?B?R0hPR2RHYXJscFRwb29NdmRZN0xMZXZWUFBaQVhaamljNkRjaFhFcWo4Yy85?=
 =?utf-8?Q?DvvQl9D0TH9agMsVvGKu7GU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf29676a-1fde-471d-a2fc-08d9b8c7192e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:45:51.1624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/nr4gEMV63Rn64vr6AX4uxbdP6TjFcF8S/PIUFliKWU4auyFo2rhcrlE1j1Me9D9bIBmy2TBx+LnMNFiRVdvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 06.12.2021 15:20, Michal Orzel wrote:
> to hypervisor when switching to AArch32 state.

Do you perhaps mean "from AArch32 state" (also in further places below?
The 64-bit hypervisor runs in AArch64 state in all cases aiui.

> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -109,8 +109,16 @@
>   * If 0, we rely on the on x0/x1 to have been saved at the correct
>   * position on the stack before.
>   */
> -        .macro  entry, hyp, compat, save_x0_x1=1
> +        .macro  entry, hyp, compat=0, save_x0_x1=1
>          sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
> +
> +        /* Zero the upper 32 bits of the registers when switching to AArch32 */
> +        .if \compat == 1      /* AArch32 mode */
> +        .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
> +        mov w\nr, w\nr
> +        .endr
> +        .endif

Don't you at least want, perhaps even need to respect save_x0_x1 being
zero here?

Jan


