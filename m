Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACD25BC995
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 12:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408685.651504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaE3A-0007KF-CA; Mon, 19 Sep 2022 10:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408685.651504; Mon, 19 Sep 2022 10:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaE3A-0007Gm-8S; Mon, 19 Sep 2022 10:30:52 +0000
Received: by outflank-mailman (input) for mailman id 408685;
 Mon, 19 Sep 2022 10:30:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaE39-0007EJ-3T
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 10:30:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 216e8d6f-3806-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 12:30:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Mon, 19 Sep
 2022 10:30:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 10:30:48 +0000
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
X-Inumbo-ID: 216e8d6f-3806-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hExYrSg6/TBs4hlj3oNh/4rKbOfYZayuMElHZAe6Xg4qT3rqbMPhSvXuxeXie5Lv7ylCZZ/eqTbLH/JgdkLWvpKHOw74shi9SAGAehKur22AsIPKuW3FglrzsTgfRjo9BEJf6rMtJo+yKLxLB8C1J9cjNFlslHij6NWQ3CAOM51/Tb4StoIxOh0qvxldKchWIIvTCDZW6fsbIMcKRTJ8cCthUN/HNNOSKDRPR94S8ZoODUWVgl0wGpdkPy8MW4cN+m8Oq8vy5awWarCiQceemrzAJJRrvkvdGWSZz7mex1p0XFQLRXBcyY4mORV9Pq0pjUyOnOBUrTpovirGHQwzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr+IfXt0NMB0EKOt8VY3rXX1XSMAnYxBCKrKyzgMbOU=;
 b=iw/SRyyTaIvfm9HKSlEm/UivwFY4i2f7jcjFKi/z6Qhx5QjqNAk4joz+2gGCuTz7j+O3/noJ7WQxhMIg1ITAB1AkD4JC7V1kP4e8oS/EhJAh1ZS4e27pVPO4ZUKFqvW5UFtXdTHcxbXEjb8henxk7R8p53iYRsLukWXRai+qtV4qL6qvKrNFoAd6SbyiL6/T7oLlAyU8BgBjymXQ083yVERufGrSWULGX8CjvZry/rGasFyot9CL8o31uvswIyNX/ojkBdHGK1NKkca1t3Tovo/xw1OB+WIQYMoRboenKFdG95vEhiliAlZoVT2OkCSJR/cA+MGhVO/soyRTTHJk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr+IfXt0NMB0EKOt8VY3rXX1XSMAnYxBCKrKyzgMbOU=;
 b=XPjXtEJ/S1QzG4SRw832kwnVqp/uhqPFRFHrfm3+w33q9ZTed0raM4Lezr4TW+oOSPT8RavydGtqv6BdV3OK2aI/eQPUgVCv/A2UNl9lHpBbAmdwWRlnFaocpC2MdsOy6yqf9StFetPqEuyw26yti48D4oVE1qTGqVHtEuuktqPOX7nK6vI8Kim7UFWaNcL+N1rphOT6WTSUMvupU78zh4OwHb8XepKRXUpstsuWwDyA2OKMUtIPDtqfC915LcOf6el0DOKApj3RXUmjJd3zit3+UCxnadRN3wUPJhGg4EK5n3LyyWO5/4gCgJgu6ZHjY6W5nLsF0FH5dM9po2OowQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb2d6ca9-aa27-d199-c8f2-d3e740f918fa@suse.com>
Date: Mon, 19 Sep 2022 12:30:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] acpi: Add TPM2 interface definition.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wl@xen.org,
 roger.pau@citrix.com
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20220915204029.1227112-1-jennifer.herbert@citrix.com>
 <20220915204029.1227112-2-jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220915204029.1227112-2-jennifer.herbert@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb9b700-31dc-4d1d-70e4-08da9a2a0474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0I7Jh2o9XTzsjaQS2hzyEHxGEOy45u9nmoCK4utyyawqRnulqUh45GpXS5ymdp/WYQN/OGarDV/WRRZ2xc8FG7Z8uCEt/PRSW/VWcWNJw5KB6nP8OSvPvEQmIfQNmVjkC/HuDs/j2THSpDdF+Ry9UXQjP5gkzLw9da4rrqRGrt4rFXvYl+BrlJos+3C8fUzHIk3ibBqB+ngs8ntY/oGM54+mMit6+M7ViVG0Az1A3CYh9ntTkfRFsO94uhYbromaITrkD8PNG7V1lBYOwyWrsottOz7A3lZ96pFzp7gOKuo3Dmo+BAIaKdK04KqRiKeqoAGqbLdf20raLJP4s/XQnIiZBkJJzK5cneaw4SBB+9oiB+P8GY2mfpkPE62obNMSMTSsCVBY8c/NmRmoJEigC1Bmmx2TPO+/gj9A4VhUjXxu6a9H/+f3+slNrPfcnqnfS1GDj3ZB/mroTbBJi1SQyYhkykC2AwZOyCG+Uy/2TvNzzg4Nvovluell3ESahAY4rCaWJ94epJ2VRilM946RrtM7E82n4roxPzHad6lMf3aMGvUeBiCmz5YqmbM+vDNZiqIypspLqrZ8SVJGnrqw9cFoKlHxndBnIm88J/xrIiFnmcGXxKnAkwkqwqNBjh/iqspqNdif+d67DzTR2sCuy1NjegTxhb8HhkSQ4Uk6C7dvyH+U+/xPsXQzPUUSfAWqRRWIi7mF2gzPfI2PoiaOl4A56HU3ZUAh+/e7NNDOA0ZgFRsVC34egwzWWsMC42fY0CS2e7r5E5fENCswNaNq0P2yMSl6lysvuh0vKu2dbjc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(31686004)(6506007)(41300700001)(53546011)(6512007)(36756003)(8936002)(478600001)(6486002)(26005)(2906002)(2616005)(316002)(186003)(31696002)(6916009)(86362001)(5660300002)(8676002)(66946007)(66476007)(4326008)(38100700002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEdUSHh5SUcvQnVOTEhXQTJVZ3hkWFlBVEYwT01pV0dSSC9OYys3SCtBbDJh?=
 =?utf-8?B?UXh0UmpzWEo0eUdrVURLdStlRlJKNG1IUmZVSHY1Y0ZvcEJiWDJpWmZUZDRZ?=
 =?utf-8?B?cXZpVldzYk5lSDRpcVJueHVHQnM3SUwrcmxocjJOa3RwcTBGMGdLN3M2WnlM?=
 =?utf-8?B?M1I0MFk2TjRUYW56RXNrckRYQWRGbm4wbk1WZXhGSHNlQ0VtcHpjdlRtMkdS?=
 =?utf-8?B?S2g2WDdEV3VBMFRyUmpka3BqbzBtckxvQm1RbzFUU2piVjdKekFrZUVFL3RT?=
 =?utf-8?B?cU9JRGliLzBEaUJYbm9ITy9VR1Y3eWpSY2xvTlFKMGM3VXh0VVN3ajEvTzdt?=
 =?utf-8?B?K2pzWmJ4THRiUDBaaW1xcWI1VDJVUFBxR0tZeTlzbXFXQmxVQ3dlbUpNK21l?=
 =?utf-8?B?S2ZTZXIreGJURmJqaVhWd3VzSHpxQW9xL2VIZDVzaGJieFlReC9nRCtpM1V2?=
 =?utf-8?B?VFNNMDVxQ0I0MFl2aSswZnNwY3FZcERJR2k0YU5GTm14V1piTVBQbmp5dGla?=
 =?utf-8?B?QjliVkNYS1BBNmRUQXlpVkE0dVJObWxTbnN0dUlENjFsVWVRNjFmdWZFVkxu?=
 =?utf-8?B?SWVsNWszT3pRSXpLQjNzTWd2S2dhTjAyd09adU5QZzFsSUljYUlCZ3pZL0dM?=
 =?utf-8?B?VGVhTXhWaXpYMEdyYUorSC9jellMTkNNVVM4STZPZThvaDA5Ymt4VzBZQ0o2?=
 =?utf-8?B?aUlwVkdUK2ZXYitRdHFlQ0hkM1NzTEdtK3hLWE9leFh3Y1grTi8zem5BWFU3?=
 =?utf-8?B?TDg2UUl5cHhySHFlRlI3bGw1bmxqUm1JY2t2dVBtaTBjc0l2WnlOeFQrTjBr?=
 =?utf-8?B?TmY3QjVlQzg5TkhpZTZZU0ltSmcwUFJKSXp1UmF3NElnemxOaytNb1R6TGNN?=
 =?utf-8?B?MVZJdVFFRmtpQ3h5a21rQk0xTXh1VEUyRkFjTmE1bXMyS0JQRFhvRDVNN1Rw?=
 =?utf-8?B?dGNLblA1VjVIRjBvSjg1aVNzSEFqSlZwcjF5Nm9Ja3owZ1lpdHkwTjBTOEI1?=
 =?utf-8?B?UGNEc2phNFJxaTl5cUdVNGxlSUM5R2lwWWc3ZDdjc3hIZUIxZW9CSkY0VWJ4?=
 =?utf-8?B?bm82Z2hNRHd2bFNHdDlFY3NxLzJCRHNhdWVIZ2RLNHBqWHhKNDlUbGRlM2lW?=
 =?utf-8?B?aUZyQXQ4Y1FyVWxiSzF0aFJiZHc3WXE3RzhTN2x1K0MvUUN0bHZFUjFWL0FS?=
 =?utf-8?B?dG1UUlozejV0YzRoT1duWFNxckZ0Sml6Vm1XK0VyRWttUi9DYkVDL2NPcDdi?=
 =?utf-8?B?OHZmTDNZR210Vk8zOXFzeCtYSW9xd3JTY2o2MzVvMFRTdGdBTE5ZWTl3azZi?=
 =?utf-8?B?SmdQSlJKVG5OVUhLWTNuSXpwa0ZXVDZnUmoxMzB3VmdwakpLWkVldXpUd2R4?=
 =?utf-8?B?MU5iYXQ4eWhaRnpKNEZxK1Bjd3BGLzFyY0lzdDVIeWxNOHErY09qVWt3cG1V?=
 =?utf-8?B?MktlMjIwMnI3cStlOXExcWU2cFdseGkvNVhtNFNIU2FkdHlOd0JnbXNweFY1?=
 =?utf-8?B?bFJnTFBSalhvVmZLN0dyQ3ZVcmdEK3ZRWmk3amNpcEFQeXpOVjhNWlU5Rito?=
 =?utf-8?B?UnZyU3ZtWkZqckt5TllZdGJldW5VTzg0dVovaFgxZTlkOWJjWWtObTFvVStu?=
 =?utf-8?B?VXdHc1VBS29pWlFiNjBYTlI3NHZXeU9leHNrS2pPVnl3UGQweFBnZUxSb3JW?=
 =?utf-8?B?Y2dRclhzcUVaK3RocytXbUhDOW5waGFMVWkyaXdmN212MTRWZlVacU4vbWV5?=
 =?utf-8?B?amI3dDFOdjEzZ2NqTVYyaFBPQU5OaXk5ZmJidU1Mb1R5aGVuRWlOTVBGTVMv?=
 =?utf-8?B?RnVrVFZpc1dhRGV6cHdZTzBtR3k3RGRjNENLb092VnJaV1NpLzlZY0VneVd6?=
 =?utf-8?B?dWdPbWRrTnBLQXhBTlBOaWFJRVZrVnhIU2d0ZHJ3ZGFUdGNEQ3p0T3FyRnRu?=
 =?utf-8?B?MHc3NWNxdGpHSTMzWXRiQmRWNm00a25pMDBnSGRVNXB3cXc0UWtCZUxSV3Ni?=
 =?utf-8?B?U0MzM3I3TG9jMVhLOExKb3JndkRMNUt3VThUKzlzWUxIUFdhVzlPejdPR0ly?=
 =?utf-8?B?NW1mOUhHVWIzalh6OTFDaTN4Z3VCaFlFbDg3bHVFWEhob3hTUVdEeGErMkpr?=
 =?utf-8?Q?Sezy4XcRkX11FxX8sGxtiWxNf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb9b700-31dc-4d1d-70e4-08da9a2a0474
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 10:30:48.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiQnWjRYGadiAursxbQFK3ZCueW0E45k9KW2+fMPRge0TIu2G45HIncgmv2sZtaJpcVmUHjd+1NPZZGfhhkauQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289

On 15.09.2022 22:40, Jennifer Herbert wrote:
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -56,6 +56,7 @@ extern uint8_t ioapic_version;
>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
>  
>  #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
> +#define ACPI_CRB_HDR_ADDRESS 0xFED40034UL

I understand it may not be feasible to express this here as a proper
derivation from other constants, but then you want to have a
BUILD_BUG_ON() somewhere making (and guaranteeing) the connection.
Thi may of course involve moving the #define to a header which both
hvmloader and libacpi can (legitimately) include.

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -1009,6 +1009,13 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>          config->table_flags |= ACPI_HAS_TPM;
>          config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
>          break;
> +    case 2:
> +        config->table_flags |= ACPI_HAS_TPM;
> +        config->crb_hdr = (uint16_t *)ACPI_CRB_HDR_ADDRESS;
> +
> +        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT, TPM_LOG_SIZE >> PAGE_SHIFT);

Nit: Long line.

> +        memset((void *)(TPM_LOG_AREA_ADDRESS), 0, TPM_LOG_SIZE);

No need to parenthesize the operand of the cast?

Jan

