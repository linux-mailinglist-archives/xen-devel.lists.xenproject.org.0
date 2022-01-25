Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD80649B1C0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260050.449036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJE3-0001uP-Qc; Tue, 25 Jan 2022 10:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260050.449036; Tue, 25 Jan 2022 10:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJE3-0001sN-NB; Tue, 25 Jan 2022 10:38:59 +0000
Received: by outflank-mailman (input) for mailman id 260050;
 Tue, 25 Jan 2022 10:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCJE2-0001sH-VX
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:38:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0004b144-7dcb-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 11:38:57 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-m2OFai4rPS6rTJxe9QIHDQ-1; Tue, 25 Jan 2022 11:38:55 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 10:38:54 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:38:54 +0000
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
X-Inumbo-ID: 0004b144-7dcb-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643107137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFDeXxxFKqJmNycVcUJJyoc87ooSRa1pSk2PnWeQ3BE=;
	b=KeuqAewYtDglilqGnqxZZL3RoAkahzPmAOZ/FgYoHbSwOAu8LkKvB95BhtDcjPNw/rMCt8
	mmNhtoFwZYok/PdCgGZ6HYQCnUWh5cOctdQhliM2lIGuiuXjTEN0hEuOYI/ptuN9UZzQqm
	EgTtgq+v9rat7KfUXI2OuGhO49/zvbA=
X-MC-Unique: m2OFai4rPS6rTJxe9QIHDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1iwegWG4w3wC1HBG1tt4/abndsGx1lSLc2It2xDgz1ccmWAuqvlLpTF26R8kEkrnglqsjuwFgzBoYkZSEg9ntUdC7def7qKHrai/r60Z9Up1wvp/ykWRmjsrm0tQ5YZLI9GdQ8def/28QsznfgIL7Ot2rNg3mTJlFWryQapOiJp1tajX4xyjdEvbFU9sEmQ2I39+30reBE4QmulBBaG+t5zV31OD2LgBYH4/w8T7Cj72LglY5bkYBKOW4Hd+Ixe1v4ENglS8oWOF9+wwy9FhjJMYVPssSfLI/mQwWVbkSKFG4jsIv+acwly4TCnfUMVWtmV36KNBRYlzDHNUHcEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFDeXxxFKqJmNycVcUJJyoc87ooSRa1pSk2PnWeQ3BE=;
 b=IDfrwLvlLjCHcaHWTb9yCXZL4YKb0MUXojP7SzlIJR1yfRFH2qC562G0JiZG/A/aoLNf++1ZEbvDEphHggVWUqsDU2wZwsWMiq8CibqLLTuKIQUtu2EgVJPEcaoC1lpYUxglUwwZ7qdHSSfxwFBfidlndnVk/GNXWHajUXz5GvSCP2WTeA/yUiXgkh4Ljwj40SPLoEzjgZNuZ6yE2uJGaufDh7vOBWyKWQHUFX+awwRPHDpWvTxrOoArNTWrscaJeHes5A/mrAycgixUDMA+Ut40E0Mea9gIyRUB+GHgz+BlquUe0sFqakFq6k/s3zUlAUWJHVtfFCk3H2cmhQ/JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9424e908-2f86-d487-e02f-dc0cec4820e9@suse.com>
Date: Tue, 25 Jan 2022 11:38:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 21/37] xen/arm: Keep memory nodes in dtb for NUMA when
 boot from EFI
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-22-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-22-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::10) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 981b445b-a817-4635-d37a-08d9dfeee230
X-MS-TrafficTypeDiagnostic: AM9PR04MB7634:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7634BD7BB49B82C84BE9D49AB35F9@AM9PR04MB7634.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mbb5LL6CStGfYYcPWn8oDu38uDHCIHOGfeeNKkLPO/Ysnf9csj2OSkVr7pZ54AeYWNqcwE7kMUJ3DX/tHcu9/G21N2UT4IChLLsiRqyQfN/DIVJmzBJn1a2u2LJxnC+UjBC+J5PMM6jfKQ79j0wRZ+rMYCUhpSwv8oVwc+WylMeQMzJkJgm5Kk7fLD5atO7jWL195uhhgDRMeIQay/847U3dcHxVumuue7eYYK+pIm+3tZQRd0YCk3hMGR/4A1Pf0IwtJ8RCQHBa17h0iXWQFXZgD/ulaKKBsPsfeBt7cfpiybWWmoo6WFWe0RJ1NktAcUi/imp2aSsa2MHHhb+srMsm+7HEMsTr3FHLmKXttckxmMKTIaqQz40zwIJtM7sdhprs0ZE4GHapN4G6zrS6sjJYkh7MiuK2DGZgMZuH8Et6gl7LmFcIxVOQwKXpKxf5hcMJvev2S+6E1N27iDueHkGVyAHZxV7f+eaIPLOTYEX3mMIeGze0WfV1yVnx/VhRdluuA7TJGRm2XzOmMB3YRfFb/vFbYHFJZ6xh4mLXGZS5AjurfhSPvJgMy2sIUUzFA3A6QgDnDNzwCeOZwGwamyBn/XY9goJwg89100wHmx/nhrhmdzUZHCLLvyv2cfjkGP66Z50x+oBVPd4whzEG4OMb2TsGXCYDhskFP2kQgF7GVgpeTdlSzqO/SuNMoCdTTMWHftNg0FK6zRjJHRnLfoLtdoj39M+90CQ4G4bQ7pvjt/GSUg/usOONSqAOafAp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(6916009)(86362001)(316002)(6486002)(53546011)(508600001)(31696002)(26005)(2616005)(186003)(38100700002)(36756003)(8936002)(5660300002)(4326008)(31686004)(2906002)(66946007)(4744005)(8676002)(66556008)(66476007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE1YSDBXUm5aa3k4VnNDOVQySHYvTVdNenlhUmdTQm9BQ0gvNUpaRmN4UHhX?=
 =?utf-8?B?aDlNeXZ1aHpUQTNEdmRlbnZYWVZZSnd4UWl1RFp1ZG1NUVZ5aHQ1RDRxc1NK?=
 =?utf-8?B?ZElTdk4weEsyb093bElRMUdrUURCY2kwcEF6eWt0M0dyeUFjTklqekt3ais4?=
 =?utf-8?B?K3Z4NzR4S3NiZnJwTnpnZUFnYlNLay9tZ0wyMnpXdEd2cmpyWGI0VUpVQlJl?=
 =?utf-8?B?V2NBdEh1eDZhVytJVHpCMWJTZGszVUhYajRrZHRORWNxRHZBUDBwZmMrN2hl?=
 =?utf-8?B?Z2xsMXhYNWo5ZUo0MXNNU3lFbVB6dXZURllJenNaT0xCVEVFdHVQYTNRVnJp?=
 =?utf-8?B?OU5qc2lhQ3hUVzRxMGRhRUY2ZEoyZWNLSzdpUGYrdWd6VThFc0JSQzZxcDBM?=
 =?utf-8?B?d3l2dmdOdURYd21nbVBRNXVtd2tCMVNiM1NQb0hKcGxFeWl4RmFOZ0F4dXBD?=
 =?utf-8?B?VUZCKzd1dXZrTnI1ZnB4Y3N4QmFNM3p2ZEt2eHhBRk16RnErR0ttWkgrZ3g4?=
 =?utf-8?B?ampVVUt6V3BPSFZKRWhQbW9yUXRWMXJyVGFDY2ZtR3h4ZGh4R1dndDVqVHFM?=
 =?utf-8?B?emhxb0FBMEIvTFdVdDRnMGtSeFNUTG55MGN1MzQ5QWMrTkRZWG13STRiUGkv?=
 =?utf-8?B?bjNjdldacnI0NmtwTkpyV0I0ZVFtNTk3SFdTbGoyVzNGSDlldVVua1NDbmJq?=
 =?utf-8?B?VzQ2WDdOeFNtSnpQTWNMejNEejhMRFRvRnI3S2tVczVWUGV2TElYSU04Szdy?=
 =?utf-8?B?R0NUaGxBa3R2dUFBOWhrUzY0M3l2SERSSFlZMENmNWJ2VHdWc3c2K0hMM2xW?=
 =?utf-8?B?TXZMUldua0ZzaWg4S3R6Z0tML3ZNMjBDdEJmWFloVmVrRkFVSThtVXFEWWZK?=
 =?utf-8?B?QWZZcnh5M3NWMWRGTVVTTnpTdUcvblVBUlQ3S2trNVZLRDA0VExVZWJlbHFh?=
 =?utf-8?B?VFlhRnRFSDFOYlN5amlralJqNVArbTd3M0pPVERueTdhb2NrV21KL3NXbkpx?=
 =?utf-8?B?ckM3Snh3MFNmTlYyZTFuWTBDVmNoSk1ibWxrT0RuQ05OTllZdUZ3c0lidERx?=
 =?utf-8?B?NFVxajM4ZDN0RDZyZlBzNWplMXZnT0pXeFczOXlFWWloVUx2cnFXTnhYTExH?=
 =?utf-8?B?VXVqa2NKakw1bTlpWTRnQk1XS0o0eFVMK21tc1BRbXo4cy80TTZjZjljT1I0?=
 =?utf-8?B?QjFJckRPdjZKK25YU1pFb2dIYXBPRFhDQTVRc3lFTnRLWXFpQzBrZFBoc3Bh?=
 =?utf-8?B?M1VYMUcwRzYydEVJSVl5UGsvcGEwbGlYbG5RWmxSQnJ3WEN6OGJpNjM2a0Z4?=
 =?utf-8?B?THBUeVlTVlN2L3h3UWxiSkNVa3JTYVRmQVo4UUh4RVJFTEdPeDZ0blhSeTJK?=
 =?utf-8?B?STJNZkQzYy9lZmtZT1VmaXRPU2pqcjZKVXpqQmdORHpZd3N4ZW5KZ1RBWlp0?=
 =?utf-8?B?aW10SGRFVzBUeGNYNVlzdlNBZnk5YldXSmlYQjFPSWhZZ21iZUJMZFpsNFlZ?=
 =?utf-8?B?RlQvZCsyYjRFQmFtdko0bU5KbTI2TzhmV1A2M0ZPdklBWnFuNkZvcVZ0dllM?=
 =?utf-8?B?Mkh6ejNoa21TVUNSV0RyY1lrNmxCdnpCVS92UGlGaUpacUE0NjdOTjE5UW1N?=
 =?utf-8?B?emM5QUc4T2Uxek1HNUdkWmt4Ylcxdk1GcWNTSnE1bkpDa2x4K1ZNM0o4M2ZD?=
 =?utf-8?B?Qk1mcnNONzczMTBibzh6aUdrZ3p2d01rbFhGWlFZNTF0eHhKU3p3R2l3UHdS?=
 =?utf-8?B?VWUyQ0Y5bml4WTlUdm1oYW1HMDM2bEpKRU8zS05NVUQrcmRodjZNb1h1TXRJ?=
 =?utf-8?B?S1JremZHOUNBZUp4SW0yZ2c0ZXhVWDlWVUU3NVM2T1A2Z0dGN3VkZUx1OWcx?=
 =?utf-8?B?cE5lQUtxVS9xK2ttRk81NC9jUHdnWGtoTFVpLy91citFaUFJaGdEQ3h4RWlq?=
 =?utf-8?B?SktHK0xiYmY1VjFLMXVqQTlRT28yV2JEcEhHV1BHK1F4Ky9Cc1JIZ25wZHJX?=
 =?utf-8?B?eDJON3lBSXZNWmNTNDhkcUQwTjI0blJ6eDRhTHJ6MTZ4Y1FZVGI3bTB4eGNv?=
 =?utf-8?B?MGd3NStkUlI0enZKSFFMSTRWVUQyUy9ZVHdnc004NkFKelJVc2lrMUQxOEhT?=
 =?utf-8?B?SnFiQVhPSG1qa2w0LzU3aWo3cE5aODNuRGNEWE9rcjVBUGJBVVlBUG9aR0E0?=
 =?utf-8?Q?5laxPaODujnb5oIJmaGtNww=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981b445b-a817-4635-d37a-08d9dfeee230
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:38:54.1415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ALUd6YZDFQINAJ/gLdTs1/MlK/JuvUDY5L4vaZ4D/zF9za0tFzb+JL7gPH4NFh1H+bMyRdyDu4FxVZKINiWYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

On 23.09.2021 14:02, Wei Chen wrote:
> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -47,6 +47,13 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *);
>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
>  
> +#else
> +
> +static inline bool efi_enabled(unsigned int feature)
> +{
> +    return false;
> +}
> +
>  #endif /* CONFIG_EFI*/

As already hinted at for the earlier patch, I think this hunk wants
moving ahead in the series.

Jan


