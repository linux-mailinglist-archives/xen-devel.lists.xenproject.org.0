Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA32450228
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225739.389880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYzm-0006Ni-2X; Mon, 15 Nov 2021 10:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225739.389880; Mon, 15 Nov 2021 10:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYzl-0006LI-Vo; Mon, 15 Nov 2021 10:13:49 +0000
Received: by outflank-mailman (input) for mailman id 225739;
 Mon, 15 Nov 2021 10:13:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmYzk-0005kY-6v
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:13:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b845e480-45fc-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 11:13:47 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-JQjTFDyCO4C9GEKKus6LqQ-1; Mon, 15 Nov 2021 11:13:45 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7732.eurprd04.prod.outlook.com (2603:10a6:20b:237::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 10:13:44 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:13:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0037.eurprd05.prod.outlook.com (2603:10a6:20b:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 10:13:43 +0000
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
X-Inumbo-ID: b845e480-45fc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636971226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wTJz5F1ShH4PkzlJhZclzsOhEIfGlYRmaiELeWfwqno=;
	b=GLgN0FOi0v7LC4Yaxfx1mWyNkjBsCbNZoF+5nfGKDJ+r4bUvHH3/2WTUcre2oCKD82BKa7
	lBHgKnTbqs10uu4EiNY+YiK1A6xQIDRznA285i6ofJinkZgqDaM/Mh+mnffGeO3FAtL0wn
	oNeGRqQJPJNqVsK7/wYeAFnaqeWBAog=
X-MC-Unique: JQjTFDyCO4C9GEKKus6LqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFdG8dgxOccNrdpyA7EUYeNs1HbpWK9bUFWEqw/iGCMdIZlyVSHe+20wfqi1JZpaVbTThEjwUTykIbXC8tTRCoTNnZH26cVqOCMd0d/FUfdh5DsVe2dG6BOk9oq44aL3pZoaB25rbuUcQtp+3KTtn0GMMClWFyoczWWXiO3xslkV1fjugz17oywvrISnLWurbKqdd1HUMtu/uqIntLp1S/f+fyAtNQ8rMgUWebgIlDWis0uIeJ/KMW4+962fnEGkSWhh+Eo4ozUkJyZv+icrFqDtO8Z0rrKKf4jtBwWPsQKT/Uao2jBrYpFDmMsMD8ilEBc+99pznp9Ms8qruFY6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTJz5F1ShH4PkzlJhZclzsOhEIfGlYRmaiELeWfwqno=;
 b=NsB8xDLRa4qVsriP4w4dGOlftRrKAa2p/bMZSd2AmOSFTbS5X/Cqxt7eKlhOheBXbXFwau1EJ+MSdQNz2y/SBN135AWgLJSSin/dr3mCjCRxqn3lW27mwK6XfijadNlYrh0qXxgdiXJnVj+zmX07hH6bGqxKzZhcRBtM6aithGgtd0mJwIRiMhmWoZLRcsSpwdi0BbnJSqCpMqk1HnP8EsZRYCP+erbl93MeWc0Ny5FJqVqkEx6XNF+9YgesjmotOO/oV5n1527EsmgBiMW3CFG7bB0yMgFnB/F6VCgoW4tBIzVXQVC4t61ETa594uJSIcQFKGAjk1CtOsjISnE+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64e9208d-ecda-2e62-e10f-81750c0279fb@suse.com>
Date: Mon, 15 Nov 2021 11:13:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0037.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::14) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35fd17f1-10a0-4326-ec7a-08d9a8209adb
X-MS-TrafficTypeDiagnostic: AM8PR04MB7732:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7732151AAC6892AAE7E0A7DCB3989@AM8PR04MB7732.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8wZ9yJyeqGKDI6+PHLtpzVUzXaHZWGw++qrEnTvWKfLan1Rm/35ansowuivB7EWAomTXq7cIzF6LCB9NRFMxUQrydKkpb27Cmmu1F1ceuyfRBYPkK17HLcBJnzAcRBuuychT/fd0a4DQ++UIc/ZEBlShUpn3c8C6pzmrkP7wzijF7T6ff9xe+X6gCRsxZVUbemRtLDaeS27kk7uTSbUOQjM44CMDlHqLWAihZcLPsDxvjVT8/KAMlvVc0doOQDoxdfMk5Ogugiq5qz0QrDSwguOLipDQvKf/BswgTdkdzilIWiL0SfFfmx4Ox/D0JhI1r4vBCcH/ZhG8cXWRjpyH+hHwnSIrBhMUWYWT7YTz/pAsFihX/7QXAgfiCR3LYL2TW0bpJb7D3PjWE0oFs+4tdJO8reBjIyC7+mm3SAnfmgHGu59Ja45GfcnLycWZ9NzxWfbiHRjiE/yEYcuPvEzNZXlDKhduOqDuGex53ozc5D9VvIztNmEZOBKYl4I1Q/FZBdR3j2fApQufK9NDJ1OuxZw3io9MiPgcEcdeGOTHb5lbGzpllnco5AiIrKGiDfiPplxnbm7ODby8Qcof0tQaZgzpw7LfoQl+mhkfn2eJJ+SZkwM6NK8sQUIAdbox5A9TRAFgqY1W5RbMueCaUsmRucW9jEQGihsfHeBG84dR6eo765eFKvEmSSrSyLIrUPIJ0dPwE3batHDdvkyJ9/NTJtKUwVfcreKCit76W+ZXSTa/i4OBQLo3HHhDzFFh1gxF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(31696002)(4326008)(956004)(508600001)(66556008)(16576012)(316002)(66476007)(110136005)(54906003)(83380400001)(86362001)(66946007)(2616005)(2906002)(6486002)(5660300002)(31686004)(36756003)(26005)(8936002)(186003)(8676002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1ZjZG5IbG9sMmFLblgrbDEzc0IwR2hCaGF6S0t0Z2gvdkFlbGFiQXVPaXpt?=
 =?utf-8?B?QjZlR2ppUmhKNjVXRzFLVjk3TlJBL2RVV3RxVnpJaVk5WUVvQ2JtaVg4WTBW?=
 =?utf-8?B?RUxFRUFZd3l6YlVuV2xQMVdvaFBqeWlDZU1KbkVrdmVwTnc1eTV1NDZINHU3?=
 =?utf-8?B?cno5UkJ2NzRqdFJ5MGdmYS9oTmtQdGN2cTRjWDE1OUViSkFkUjQ1QUl6VDgw?=
 =?utf-8?B?Z2NJRGYyYm8wbEdEOWVKbzhxa2FSNkxDM2hBc3FOU2VWM3BQUXBybUYzNWl4?=
 =?utf-8?B?MzRPOUxQa1h6SWt2dG9mM09XSndCcHVDeEUzTzFvNXNUNWRHUDJOck03b202?=
 =?utf-8?B?MEd3VW4vUDRocDdBbWw1dVFwbEdpeWluVW5GOXdWTGZNdjJVU2c4WGRHV245?=
 =?utf-8?B?Ky9RaVVxL2tFcTA2cERLZTNHV2R5Nmp3bTZjaEJ1bUluZGVOY3hScG9lSkxJ?=
 =?utf-8?B?SGNEK2lBdTQ2T0Q1WVRXQnhWYUc0SlBkZ2xXVU1VdVdFbEJRRTAyNlJ0WkQ5?=
 =?utf-8?B?Ti9nZjc3dDZqWmxRd1BnWDRuMjdMbVIxS00wemp4OHFjeHFFY1ozeEdOL0E1?=
 =?utf-8?B?eWVyT1FjakdkVzBhZTVOaWMwbEkxKzRST1QxWFluQVlOdnJuUk9taVVONUN5?=
 =?utf-8?B?NWxwRFVUSFc0ZTdZSDU2UXkxektNcWZqUEgzdlZkd2tJUkkwcnFmdEIzVVJX?=
 =?utf-8?B?c212clU5RFJOZGtlc1BUbjM3aXR0NnB0b252TzVxNms2OS9LQ3UyVWsrTUto?=
 =?utf-8?B?MFFCdDJWZUVabEVIc1pISHlCWmxFQzZGRUNic3hBT2NLdDZjK3BncEhqRFRl?=
 =?utf-8?B?T094OFFCSXdzWERPUHgyOTN4elRoT0N3TW5oV25qRTdTZEZBTzV5UzJhTlJT?=
 =?utf-8?B?b2FLdVpyc2IrRkYveGZ0Y3JEdUJxVzNZcE5sSVI3ZzRMNVZQUzhYWGxiYkNP?=
 =?utf-8?B?SjRDdURuNGgxajlveUdiQmFaV21CV0FHTG44VzFITjczWEtTVVB5TE1KbEp5?=
 =?utf-8?B?N0tPL1hyKzdnZWQ4NW0vc0M5ZUQrbXlkS1FDbTM5MEZOWHJ5NGJPRjBpNDZM?=
 =?utf-8?B?Q1RzU1VDRVpKR1kza2l6WHdIeUhYd3dsRStaMUw3TmVVdjdVeTl6UytyMGdp?=
 =?utf-8?B?S0c1MUdJOC9QaTQ2a3JyWE9VMUxScVQ3dFVPUE85MWNjbWgzT1A0WHJIWmlo?=
 =?utf-8?B?U0p2ZzRwcUJDRE1lUHlxcGxNblhka09Ea2NOVzNuYXVZWXRtMGptUUE4N2JL?=
 =?utf-8?B?R1V3Qm16bTZ5cHVtWVZVVlhTZVFubFFVaEZCanhVc3BMME1SK1IxcnkyMHI3?=
 =?utf-8?B?VGlBa1dtOXlvUEtMOC9ZZFRLWjNkZlR4MkUzeU5UZSttZTB3NS9OSE9QMXpn?=
 =?utf-8?B?ZEtlTndvcE1xQ0pvSFFHZG9BQVdkZ09NSGhadkdSNnFQNXB0clJNUXl5aGU3?=
 =?utf-8?B?VHNpOXQweGNPQlFGbXJ1azdKR08ybitBMnpQMWk1Um5KZ2lqdEdSTXlha0dm?=
 =?utf-8?B?R2NlQVpqMEJtUTNtNEV1aXJ4S081akNVY243UDNycjdTZWNMVEJJYUszOThL?=
 =?utf-8?B?ekVjT2tKckVKUE1oWE9MR0Roa2ZwQ3pwemdvUzBMU2NuVWRTZzRwWDV0ZGI4?=
 =?utf-8?B?c2xnTWxUUk1Ib0xQWUJCNStoRFQ0a0FnRlhIMEVIaEQzU2dlNzUrdUFsRURE?=
 =?utf-8?B?Q0ZHNmx6Ui9PY3hFaEs0d1d0SlR4U090MjMyTFVkM2Yzc1FRVDlPanBJeHB6?=
 =?utf-8?B?YnN0NCs0VTAwdklRSEkvNFdDU3liTzNxejFRbmVhc1czNjFEZURFdkNLd1E2?=
 =?utf-8?B?M3h5eldBNjBUcDdSRU9KcWJmZHNjQTFueURRTU5uY3NoZGE3dk9uSUpwM29q?=
 =?utf-8?B?RmgrR0RSUktrS0FmYnFoN1VhYkdtTVFaTlJXMlBtYnVFUUNXdHFxOTdSbzJV?=
 =?utf-8?B?MVhUYlBrL1IyQ241VklGL0dBOXl6bkdBditMaUtLc3ZLOHUzMDhuV29wbVN3?=
 =?utf-8?B?MjJUK2pKSFVqT0NwTWVzMHlRcE9PV2JJU3JSNGpYV0hPMFo5TTdKK0RYMjhr?=
 =?utf-8?B?K2NPQ2M5cCtwRkFCVnJkYmZ4WmxLMDFUampYeVEzUXlsZTJZMUxpbUIrbyt6?=
 =?utf-8?B?VENjZ3UvUXJDaExxMGtLWkNpdHFoVk1QMEs5WWM1VnJXeHByQm00Zlkxbm5V?=
 =?utf-8?Q?h1Qemwm234VxqQbls5nos0I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fd17f1-10a0-4326-ec7a-08d9a8209adb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:13:44.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GNqyxRdyDeH5P5ppOB/sJNeBjBnaXS4eyesEY7Y447XCYvLt+BWQa/KjBvtFfuAus9FC74kNEK/lLN6deOXOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7732

On 12.11.2021 17:02, Julien Grall wrote:
> Hi Elliott,
> 
> On 12/11/2021 15:44, Elliott Mitchell wrote:
>> On Fri, Nov 12, 2021 at 05:54:08AM +0000, Henry Wang wrote:
>>>
>>>> -----Original Message-----
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>>>> Elliott Mitchell
>>>>
>>>> I've been busy with another part of this project, so I've lost track of
>>>> progress on ACPI/UEFI support on ARM.
>>>>
>>>> Last I'd read full support for ACPI/UEFI seemed a ways off.  Using a stub
>>>> domain to constrain ACPI table parsing seemed the favored approach.  I
>>>> was under the impression that would take some time.
>>>>
>>>> What is the status?  Do the Xen/ARM leads have any guesses for when full
>>>> ACPI/UEFI support might reach completion?
>>>
>>> I am doing some development based on the Xen UEFI/ACPI on AArch64 using
>>> the Arm FVP_Base platform. Using edk2 and master branch of Xen with
>>> `CONFIG_ACPI=y`, it seems everything can work properly.
>>>
>>> Here are some of my logs:
>>> Shell> FS2:EFI\XEN\xen.efi
>>> Xen 4.16-rc (c/s Fri Nov 12 02:34:01 2021 +0000 git:323b47ffd9-dirty) EFI loader
>>> ...
>>> (XEN) PFN compression on bits 20...22
>>> (XEN) ACPI: RSDP F5E30018, 0024 (r2 LINARO)
>>> (XEN) ACPI: XSDT F5E3FE98, 005C (r1 LINARO RTSMVEV8        2       1000013)
>>> (XEN) ACPI: FACP F5E3FA98, 0114 (r6 LINARO RTSMVEV8        2 LNRO        2)
>>> (XEN) ACPI: DSDT F5E3ED98, 02AB (r2 LINARO RTSMVEV8        4 INTL 20200925)
>>> (XEN) ACPI: GTDT F5E3FC18, 00E0 (r2 LINARO RTSMVEV8        2 LNRO        2)
>>> (XEN) ACPI: APIC F5E3E998, 02D4 (r4 LINARO RTSMVEV8        2 LNRO        2)
>>> (XEN) ACPI: SPCR F5E3FF98, 0050 (r2 LINARO RTSMVEV8        2 LNRO        2)
>>> (XEN) Domain heap initialised
>>
>>> ...
>>> [    0.000000] ACPI: SPCR 0x00000000F5E3FF98 000050 (v02 LINARO RTSMVEV8 00000002 LNRO 00000002)
>>> [    0.000000] ACPI: SPCR: console: pl011,mmio32,0x1c090000,115200
>>> ...
>>>
>>> Hopefully this answers your question. :)
>>
>> Thanks for the attempt at answering, but the SPCR entry tells me there is
>> a substantial portion of ACPI/UEFI functionality you're not testing.  I'm
>> specifically looking for framebuffer console support and SPCR says you're
>> using serial console.  While serial console is appropriate for true
>> servers, for some use cases it is inadequate.
> 
> We don't have any support for framebuffer in Xen on Arm (even for 
> Device-Tree). I would be happy to consider any patches if you are plan 
> to post some.
> 
>>
>> Julien Grall and Stefano Stabellini had been proposing doing ACPI table
>> parsing in a stub domain, but I'm unaware of the status.  Not finding
>> much suggests it hasn't gone very far yet.
> 
> This was a very early proposal in case we needed to parse the DSDT in 
> Xen. This hasn't been needed so far, hence why this is not implemented 
> and no-one worked on it.
> 
> I am not very familiar how the framebuffer is detected in ACPI. Can you 
> provide more details on what exactly you want to parse?

I don't think there's any ACPI support involved there. Instead UEFI data
needs propagating to Dom0, as that can't access EFI boot services itself.
At least this is all that's needed on the x86 side (and all the needed
code is there, just presumably not [fully] wired up on Arm).

Jan


