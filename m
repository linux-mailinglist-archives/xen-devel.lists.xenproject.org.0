Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71904430BA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220320.381542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhv2m-0001bV-W7; Tue, 02 Nov 2021 14:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220320.381542; Tue, 02 Nov 2021 14:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhv2m-0001Yx-T5; Tue, 02 Nov 2021 14:45:44 +0000
Received: by outflank-mailman (input) for mailman id 220320;
 Tue, 02 Nov 2021 14:45:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhv2l-0001Yr-QL
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:45:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d707630-3beb-11ec-8558-12813bfff9fa;
 Tue, 02 Nov 2021 14:45:42 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-K37MtzHzMhivWH-Bq_VPSw-1; Tue, 02 Nov 2021 15:45:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 14:45:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 14:45:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:20b:313::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 14:45:37 +0000
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
X-Inumbo-ID: 8d707630-3beb-11ec-8558-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635864341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjwWGVTKUtax20fmTtf2tDRpp4RyO2cmOXoKcqufmQk=;
	b=g11dnOpMkW10YGhF40xr8dNZ4oqeX5OH4hbAyw1q8Z4u/QKKlaVfJzeU78zTQrAob9YQTB
	a80yXPl+Maz+XrEkLhfo8gUdDXkF9GT7s1ufzRDB05OAxfD6AuRhPVc9nAKDgGhAoMotQR
	Zy6neCs1S9XdAFZ7Kn6ijyRGaSjszBg=
X-MC-Unique: K37MtzHzMhivWH-Bq_VPSw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvuizsvHABtqjFt13zQWMzLVkqsb0tZ5S28Bsgfi9oLpsS1BquSzDMPYou387eqeOzyWgC7yFJ1UFGaIcGLjrXX/dHMaolm7vJbf4ToUnYoEd7sR8c89gff/u6GuAPiPNFl1IQ63eOsHOJFWSa5Wk56fW0IlUbcXFqunn9JHNh+HeW8cahWTGW75Eod5YKtLsOpYGYGbyaIu90qTS7gKW+vUc5jNeyYVMWmn7NQo0A011bdxz0Iue6VAW1e4/R+XOVxR67lE3h+xdMS3lD4iR+EY/+dyPCJ4YN7FE7OnuTM9cnEC2kdRrCV+6vYPCpnLIy67D0uPN8doSpKDxjcHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjwWGVTKUtax20fmTtf2tDRpp4RyO2cmOXoKcqufmQk=;
 b=j6uUXm1OW4b048jAkoyc17Ote7cKJlECeY1a7MpNB7yNdAdqy0lBfTXYL6znxvNtHrgxy3GYqiPR7KXNVUB7BatlJtzxf1F8tHUhMqEne4flVcJk1xFGQe62VagbOrV1Yr1DUf4IATgttWAeV3vPkx0mJ8/OCCaLubku63nH/5+agLfyRjvNVxbuuwT9AYNy4PtWMH8Xdj4S+v2joMgWGbE68ZqWwkxZgzG/LAtURxE5S34MUyH6Q5Pkp2dfpDikdgVZvo0RMCD5W12kwuIJv74HK0llTM7YCoYuiEDh/+Y/j8IUaGjZ+pr839CKWmG0tbEUmQ0ISsBl1uCMwkeQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
Date: Tue, 2 Nov 2021 15:45:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211102140511.5542-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211102140511.5542-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a282a95-826a-47bf-11bb-08d99e0f6f61
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165BD41AF59FCF33C662859B38B9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vdKBfMHWXGqqPPN9zfbjEfBqqvE+Xw93h3PhfrzdruaeMh6kzrNzKZLzpnsKwukw2GdW6NAO0qnuYfksjsyj3+xddtnarWexX6lP0G5bEYo6ZOUZIf6eB1iw2XnzXKgIKclNOwcjo4/Z7B7DZzhfL/6hXpg4rII4/68daeumAchlh9wGHO6jw6Zk/RhXPN2vALudK2TyuL8DNtpcspPTlmMhYdiuFgg4OvmJsmMj/4cTURXElcMTnLIQiWav7YJSVoZMPr+pXwUpSOh5c93NWI6N8LGKCFfpaDIabKBPdbwH66oufeBuBEQarXP7Yqd4hOHs86EgGWu6MEhUF+dfxqrRGMDp1ZmZ2gOjmWJ0kpPa7YWrIddAPUWWKaO4VEHvFkPHlCGWP99QOdW2uhmNLMA97SNqDmyw9HLCqskGb2aeObMLU6eaSXB2CkDgqZwtbjIiArm78GoiAE1XCr4xbgpwczrQ/03zPjajLDYpFSAgQvpRKZ9lfAuGFC3W9lbCSg8tr0eo5lN8M6RjrgtGjgTDXW8CIHPqM9NknipNNGOmdIKzmnrvXm24PWToa64L6RZfncNBrmXlA/U9JH/XAFa5NpDVgsACQVYFklTH9cbG81eSok0lJ4eka0R6jQ9+vqYmbl8XI+UXKQ65fiVlMYNUhOSJvkAEZtf4O3pJlyG+kzkXZcGu1L+viEZ4lyCQAhEMgJBfORwCFo1En6H9WFk0nncTB58UpW6tqz/5kbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2616005)(5660300002)(8936002)(53546011)(54906003)(2906002)(66556008)(26005)(66476007)(6916009)(31696002)(186003)(36756003)(508600001)(8676002)(6486002)(66946007)(83380400001)(31686004)(4326008)(16576012)(316002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUZIK2hWZ0loVFVUZjhIVEhGN3NMNTUxaXBmUGxyUWFHQzUvMmZCMUNLbm8y?=
 =?utf-8?B?S290Tkt5NWVtZE9ReGc2TStvMTVHUjFMdVB2TGV2aHFXdmxMQWM5RXNkcWZW?=
 =?utf-8?B?RThSN012SkpxSUtuc3NjeFI0WWxwMGhZNWVBUU1kd05yaHRDRzlGakxNSjBH?=
 =?utf-8?B?UzBYa2x2dVpncDYySlpJN1N5aXZyblJiQzI0MSt4L2tDRjBQOUgxMVczbkRq?=
 =?utf-8?B?WXpNRWdGQjJDaXBHS3BCelNYWFNFKzVyc2tqREJEa2N1b1J5RUhwcCtHUTZJ?=
 =?utf-8?B?UGpmV2U4OXVWOFdVazRWclRjWXRDWURkUTRadFJoVXZwY3orZW9ZVUlrN0ts?=
 =?utf-8?B?T2R5MWlGcXFMZnlXTDUwUVJYYjlUVENTenQ0RWs3bWR3b0lUaytFbmoyQWMv?=
 =?utf-8?B?Y3JYYVFUUDlpd2ZpYXdKVEIvb1d2SFpob1ovMTlOdXMwb2M2L1NNQ3lZTzdi?=
 =?utf-8?B?TE5QNUhEL2JPYnZ3ZXBtNnI2V3Z1ZnF4SVE3T0F1b1Y5WEwrK3BPak9jc25U?=
 =?utf-8?B?VyszNStUeFFaNVZWRjJ2ZzlxaTM4Rk82bUs5YWJrNmZRNXB1ZU1YZDdGbzNQ?=
 =?utf-8?B?bnFNNDdoajdMb0hxM25pK2VPTmtNdHF0eU8zVHdic2hpVVlZTWZUSFE5ayt4?=
 =?utf-8?B?anZWL3RkcVVTL1B3OG5vVSs3TG5aL3crQ28vbHBXVU9URmRIalhVSko4Unpw?=
 =?utf-8?B?VXcrYUlYZU1lL2pZUzF6SWNZZzJkQUd5MXA3OTBoUlVHblhKQW84bCtldXJZ?=
 =?utf-8?B?cWxjS3ovTm5aT1V0NjJQNkk4Um1UKzRjZzVQeTZvMXpJa1EyMlh3MW1zU1Rk?=
 =?utf-8?B?WE5uQ1JKb3ZtT2s3TjFLUC96Z2dGZEgvMUw3WEUxR0RxVEhmeFZCQlVDdUdI?=
 =?utf-8?B?QVFqVEJMZXBUUnpWbEQvOVpzNDNSTW42NUp3OTlybkl4WWpNV056aVJtWkcy?=
 =?utf-8?B?NFVKb055M0NRNjlkZkxtTnhOQzFvcFU2Z1B4a0JESzJsM2NING1hQXQ1UzU2?=
 =?utf-8?B?LzZnRTVYT1NVaWZ1UVFiRlBNRXplRUUxMnl3ZnRzUElUVnQ0eDZhRjRRd09q?=
 =?utf-8?B?M2JTWHFtTWFjczZoMW9tQ3NYYzhMVTZFaS9lKzdoQ2NjbC9qaHEvV2ZqeVYv?=
 =?utf-8?B?OW9JRXJjMWR1TFl0T2FQM0pPd3g3aHFxYndUY0dCRkN3RDNHcEpzN3Z4YmlV?=
 =?utf-8?B?OEoxbzdNYlplWlRTVGtRNldYWjd2TitkT09Rcm9DWGpMOHBwYjJ6RnI0RzNr?=
 =?utf-8?B?OGlOYXlGZUxxVGFseWFBVWFqMHJnMEtXTVFKS2wxMGF5OVJzcnk1N0hkNUtU?=
 =?utf-8?B?Sm1yVldGQUJQTHhzM2JPTTBsaW9NWUJZc2pBditlejhuMHZnazNFdEtocFFH?=
 =?utf-8?B?Y1ZFZ3dKU0M2Yit0VVRkK2NQMnk0WkZ3Y2RJZXpsbmZmb2hNaUZUakR5YWRJ?=
 =?utf-8?B?L0U1VFBOYXZod3o1N1NIaFFCR0dYcDRDRXlhU3IwVVppRS9vWWdndTBIelFZ?=
 =?utf-8?B?MGw0MnBqZlAreXBrVmRiOWdiNkJCdmhxbTdQcUFxMTdQVm4xNDJyYUhjMml1?=
 =?utf-8?B?eHQxbDNlcEtTVGhYRXJ5ZGZja25nWWZWb1VnalEvTnJnUXVxRXIzdGZUdFNV?=
 =?utf-8?B?dGkyaFkxWXhLNU93b1pDRHhLQ0dZTU5LWGpmRFZHc3BETVRGdU9maVJqRkEv?=
 =?utf-8?B?RGQ5SDNXSU1Rajc2MU5jSEhWUXFtT0I2emIyeFkvYkM4MGJselZod2h6TmJI?=
 =?utf-8?B?SDkyejRxZThQSU96a2w1Wk90OHE3ZUJTSlhJMytLektucEpVMUEyMkFENm1Z?=
 =?utf-8?B?WGdkUktYMllaRmVWYnN5bjk5UVhHQWRrN1lIWEZCbU04OVIyc1FJbGNGejVQ?=
 =?utf-8?B?WWxjb0RDQ3o2eUF6SGlvU09DVzhkb3dDVG04OUdCazMwbTkzV2RlUkZEOHlZ?=
 =?utf-8?B?RUFBQTRJdzRkTEtBSC9TbHBmdFhJZ21JbUw4dytGWGE5UDBaTW5HcVE1c2Zz?=
 =?utf-8?B?N3Q5b01qWWp5NHdYeWpiczBqejlsOXZ4SzhqRlNSbFRYWGFLbWo4QS9vaEcy?=
 =?utf-8?B?ckpaS3RGbXdlTVhOTVBkVmNUNThPNmRqakJLbFlGall0WGZuRVVzbTNaNmFW?=
 =?utf-8?B?NW9jMHd4N0dVUGFkendYZm9lTm9icnpzMWN0eGp1WEtkaXQ2bTQzRWkrT0Rr?=
 =?utf-8?Q?RoX2JZ+0u82OJFCqr5YwbU4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a282a95-826a-47bf-11bb-08d99e0f6f61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:45:38.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XmBCjzpsJ3v7gYp7dqmRns0W92IAkJEtz3eUSwbKhENuU0ovD/WEA+ZuL5dGBFCZn9oE34aMpIdzIAsb4yAxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 02.11.2021 15:05, Luca Fancellu wrote:
> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
> ("arm/efi: Use dom0less configuration when using EFI boot") is
> introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.
> 
> The problem comes from the function get_parent_handle(...) that inside
> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
> is NULL, making Xen stop the UEFI boot.

According to my reading the UEFI spec doesn't (explicitly) allow for
this to be NULL. Could you clarify why this is the case? What other
information may end up being invalid / absent? Is e.g. read_section()
safe to use?

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -449,6 +449,13 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
>      CHAR16 *pathend, *ptr;
>      EFI_STATUS ret;
>  
> +    /*
> +     * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
> +     * to have access to the filesystem.
> +     */
> +    if ( !loaded_image->DeviceHandle )
> +        return NULL;

I couldn't find anything in the spec saying that NULL (a pointer with
the numeric value zero) could actually not be a valid handle. Could
you point me to text saying so?

> @@ -581,6 +588,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      EFI_STATUS ret;
>      const CHAR16 *what = NULL;
>  
> +    if ( !dir_handle )
> +        blexit(L"Error: No access to the filesystem");

dir_handle also gets passed to efi_arch_cfg_file_{early,late}() -
those don't need any adjustment only because they merely pass the
parameter on to read_file()?

> @@ -1333,6 +1342,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>              EFI_FILE_HANDLE handle = get_parent_handle(loaded_image,
>                                                         &file_name);
>  
> +            if ( !handle )
> +                blexit(L"Error retrieving image name: no filesystem access");

I don't think this should be fatal - see the comment ahead of the
enclosing if().

Jan


