Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537F5113FB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314589.532722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdWs-0005YC-IZ; Wed, 27 Apr 2022 09:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314589.532722; Wed, 27 Apr 2022 09:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdWs-0005WD-FP; Wed, 27 Apr 2022 09:00:10 +0000
Received: by outflank-mailman (input) for mailman id 314589;
 Wed, 27 Apr 2022 09:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njdWr-0005W7-5G
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:00:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd47819-c608-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:00:08 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-V9ehCNQAPh-eT3EzJ1gtoQ-1; Wed, 27 Apr 2022 11:00:06 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6189.eurprd04.prod.outlook.com (2603:10a6:803:fd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 09:00:03 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 09:00:03 +0000
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
X-Inumbo-ID: 6fd47819-c608-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651050008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sb514sV2BkgQgmqKHrSdZIm03KhAsgFYXTM0bUtyV4Y=;
	b=MmVxiLMdNbRmnv1zmM44xldqRy5JssQPn3zwuvpBs67UE5DQ0Z+JMrjxuYH01rqJ42xTY0
	E6lCO/kk9V4nIzw9rahoN1v00CeIjcj+apjvYnGsAvCEnO3ZTrFsTkhWLx398LfjWQDmzH
	xfhbDD8cicUJ/In7/k0ixv1bwlBWlcI=
X-MC-Unique: V9ehCNQAPh-eT3EzJ1gtoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJJBVd7w63y8NtH9w+EqK5s86kk3aD1Ax5KmmuzMs5hDcozecR50+RCz4Evjz+EZIO2h0WSvZKreNmJ6K6lcc980Eu2fIJFjzpcUDQxWZmrW4whpkgrjh4HVlEu0PX+PouZejx7d3x0MkHno9MT+eWjReswJUCmLsgKYO/yMZoSnn50NWPuHG2hUVuKpRBVIAkD93G3Lwiv4qzs1I5H1h+9RxuZE4Cr+b5/TDun2tywFkbaQVWCIGp/0SDoKoyGz8Shi6tlDaj4bkCLNqlqjGWGRLf6j1V9z47nnkwCXJX5FGBwjEX/1W9A3s3GFugOoXIkad4ydpwHn0XrKavLoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb514sV2BkgQgmqKHrSdZIm03KhAsgFYXTM0bUtyV4Y=;
 b=BgV3Cmhvse0dqK0C1AjmYHdWLLIXpbBZC6xRX111BPzZj/RkooGurrawaVbSLSZWcg+PT7GA27U7roc7pkMC6DlY1k+ZCtsp91Rp/zxSJ/gBrSq2ZpZ+bK67EOI2Q+EE6uCgOOidRLKwgVVbX+gD3J8+M7XGAEvzwVcvBlRKSmNzh1+OuPTG2iIO45lskYaV4dbGjn5fxjzB4EQs9CJjNbWd4lAjC7AR7ITca+/OwkvVP9sAIuM/G2EFAAHxVAb94AkAyJb49QutdglZ7Wk9bVGOTcN+fCAdKPIhUydfIOlNkIcrrpU3JBG7h4266KQQ3rtUSLPcjUiVk3yfDyp8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22fd4b2e-fb50-d393-cbc6-a5ac83b2a2c4@suse.com>
Date: Wed, 27 Apr 2022 11:00:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] Grab the EFI System Resource Table and check it
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <Yl7WHv6+M+eJwQep@itl-email> <Yl7X3mAJhR5ENSpl@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yl7X3mAJhR5ENSpl@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f1ae725-1bfa-46ea-b326-08da282c5161
X-MS-TrafficTypeDiagnostic: VI1PR04MB6189:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB618911E0B9996B11EA4A0E0DB3FA9@VI1PR04MB6189.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FqhuHPRBsfDGHhpKl/C2t4pckBwFrc40Ye8M7o+tQSDLH4HePvpjIIJjjLxHKKG4MmAmh6x3Blh0y0WvauKwCpr4vAfvx4IuiKjwZYRp8w9+krEGr4jBAxB8GTGaEQirG1UDALmfZu0Cn3xNWX/n2w8TPM/mtp4TivWNGEzYZmnq5/ETRiRN6SDIKXeGPBh4C3tk/xRearWwuTlJynEQGYVzbnlT0tTn8iJmIz/QZhIqN/OgZbtvSllQMpp5u1ODF3DS26z7oRWADph7Eb7CBvRsMQuSopNmXQvvD8gDue2KH5TzmOaz5/4CXo0g61FToxTQu7PyH07w9ogih9c20TBYVzAhXCcpfonNDlUFyPC/FYtyfxsGNRC1E7JNmsmvezIjkoM419YvBTGfLHMc4J2U7OKw8dQ4nlTYLLD0As2XIJsAg4dfGD2SVKUBTHEhUBk0MWrd155jGj/NVNM/KR30P077DUfQmZ/kabURkKYWRBfY6Vg8nPtqKobX+u3L/bw7FJCVvFOCzBgehDJlKs2+9Cp97RK6+gZL6dqGDm7Ez9s5CNZ2wMk1kHl8MIACYJGnQrNq6Ver63V5U5poXjYFj/LLneHQ4gwQwRMuGatAiNL13LjHgNtjFqvTPH//QiSd4xbsk+U4tKrK5dDKfgd2wtU3WJ4BBfZu4gsgJ5fX+7MiHSyLZ7ZSAwDeUa2dTqModWMFZ+FWhv7vkWvvUQCkGPw1uWNMYUGL96A++UQfIgsEkUcjETEB/CCT2xnV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2616005)(6916009)(6486002)(31686004)(508600001)(54906003)(316002)(8936002)(53546011)(5660300002)(4744005)(26005)(6506007)(2906002)(31696002)(86362001)(6512007)(36756003)(186003)(66476007)(66556008)(8676002)(66946007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjN3cm1yYWROMkNINDlWdzBiMCtqODNWNVY1OCswaG04NDVOdmE3d0V6ODRm?=
 =?utf-8?B?cndURGJiL3ozQmRCZmJzUnp5QldidnA1L0kyMmtQb2xJSGdIemkyb2p5YWJJ?=
 =?utf-8?B?bThuMTRiVXJIQ1hSZzF1R0tib0ZFRm9GYVpqc284dFNIa2dPR3RKTkxVZmRs?=
 =?utf-8?B?VzJCd2RNWWdPZ3YyT2JrOXVVbUJUQTVHYUZDaVlvT3NVdzJBNXBiOVdiTll1?=
 =?utf-8?B?ck5iU2lzVHFFTmdXMXBhUk9vVmNvWGhEQTM2d3ZQZUZvYnl6ZW9xckhOTHFy?=
 =?utf-8?B?NWRrT1VBM2E0RGdXZW9UL3E5V2FCK1VnTU9IQlVEWDJSRXErNUpEdGNJODVq?=
 =?utf-8?B?TVpZTTlOQWFSKzk4YWxaQ2psM0E1S1A4Lzc5TnpIK2VMZE1tY2FjOFlCeDRM?=
 =?utf-8?B?VmF1YlFBVzQ0bmNrdlI0dWNKd0FmUS9CYWlzeDB3L2JIUmowR3YxN1h4TnNN?=
 =?utf-8?B?enhQQ0tPTldnOXJOUElRdlBkV2VJcUJQUFFuYVpINTBaMnVkelQvWjc3K1JW?=
 =?utf-8?B?N254QW1CdkV4US9PRGtrMWVheHFJK2lPN2F2U1o2czl5S1A3SDBqK2VYSENL?=
 =?utf-8?B?aEtpazlCUWszMGNSb1JKUEVmNFU5VFJTTTVGR0tyRkM0WGNRSklJN3BpNFZF?=
 =?utf-8?B?cm5qaU4reXlTTk5RNXo1cjNrS3Z2QTZGSGFFdHdsSm4yRXUvUnhaQ2lwQ0ow?=
 =?utf-8?B?Z1hjay9MQ3Q3T0FGaG1tbDk0blczVEZkTzd5TnorWmlJalR0cG9TVUpoczY4?=
 =?utf-8?B?c0Y0a1VTZVR6TWRBU1dmOVc1d2xQeVVXL1VpelNxOGJlSjRVWjVMcEViK3ZL?=
 =?utf-8?B?Wml2L2gzSEVkaTF5b0g3NGRmSXhpaDUzMCtucVRQbXZpdTF3dW1aMEVqdEhJ?=
 =?utf-8?B?M2tkT09PQVZYWUJnTTVGbzhPVGJKUERMRUZMTURBQmlET0FuaHkyTmdHdXIz?=
 =?utf-8?B?czFIYVVGemxISjY2d0RGdGF5ZnQxUkxoRWdXb1hsNmhTdWU4dTBUQmdJYU5o?=
 =?utf-8?B?T09BeTJaT0lpYXViaFpPU3VzVzlxdVhvUys2RFhBOUV6SElwTVc1MlFEWmpS?=
 =?utf-8?B?MjNnVW0rTmU0K09aYWpHdW9UbFVHL3g1QS9YNmZvLzZtck14YzNDaXVGajY4?=
 =?utf-8?B?T1dpWW1qZXY1c0d5TVpiallIL2QwYzJYT2g2bjduY2V5ejkyV1BPVUpybE9K?=
 =?utf-8?B?dEtPcGtyM2t2K1BibE8vZUJhOVp5bU9HNGhNbXFXZHpJSW5Samg4bWVGNFVK?=
 =?utf-8?B?VXl1SEM0K1BnaVNNWU9QQUZCMEFvR2VlWWJ3bS85d2NLK3E5UmQwYUpRTy96?=
 =?utf-8?B?MVJhajNHQkNIRytqV28wRG5xbmZLVThIeGJBekltY0pxUG5CQWRibkVFYURG?=
 =?utf-8?B?UGtRS25JQkVFd0g5SDlQZkVkNkpoSFdyS2hLYk12N29hWUE0MmVGMUJITWxj?=
 =?utf-8?B?WElURkp0VUZBOGYyTlpLdUd2dm1RY3VEUXcxUmxTcVh1RWd3Ni9nRlRmZklB?=
 =?utf-8?B?bUlKeE5PS01NWEEwaVZVL3EwbWR0Z0x4bFZhd0dNL3U4cUlzNk9ycDBpOFJE?=
 =?utf-8?B?ZytjQmVTUzZGdmNpZmtXNnRTY2NuNGJ5VHcwK0JLelRIRTZFY0tCVWppZm9p?=
 =?utf-8?B?d3ROaUJEWGRIMXhFbnBFNXhJYjBsa2srMFN1WjBaREx5TENZdS80R3Q2YXJE?=
 =?utf-8?B?WGN4dlRCRnZ1QVBRNkM2bGpuZncwamhidVR0RjA4UmFHc0NVUlJ3a0c1UXFZ?=
 =?utf-8?B?ZFd0aVRjRHI2dWR0MXFFUHlJWDNBSjhOVi8zMmh5Rk4raDFHVUZKZ3Y1ckNR?=
 =?utf-8?B?NGgreFRXVkozTk5lbVN0K3pKcWZiOXB1cGpqRGFlNit2OFltMkMrV3gydHdv?=
 =?utf-8?B?Nm5heWc4OGVDVURWa3BSb0dhNUdFVi9SNFJ0UFZZZXltY2xRN1BtcjhURE9E?=
 =?utf-8?B?QlNqeHZpcDFaQXZiZ3YrcGpiZ25WMU02YStHNlU2ako0NldZSzFQYjduVjBW?=
 =?utf-8?B?bnZkU0JYcjJ5UnJzZFd0MW9YeEFaQkxKQnk4bjZ4SnRBWU5ZcDc0aUVJVWdG?=
 =?utf-8?B?SFdLcTFoRlV5c01KeXBFVVZaV25pOXU4N1gvNEw0U1VPZTBOZW5ISHplcUxw?=
 =?utf-8?B?N0JWbDFvL2JWQUVYcStDVm9rTGJQL0JyQTlZMmJWYVY4TTk0WVlDeUxDazZT?=
 =?utf-8?B?WmhKMDQwRXZxSlpEMkY1RnRlSXZLZXBpUmVPL2VqNko2cWNTRGc4V1Mxc2VL?=
 =?utf-8?B?bW9vS0o3WFNISzNMUTVOang4UUIyMzVFT3dncTh3WUR1T3VxOVIzdGpLNUpz?=
 =?utf-8?B?UDk5aEg4QXd0V0J4K29sMUk1RFdua0dSRm9OeE1PNG1rODEvU1Zudz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1ae725-1bfa-46ea-b326-08da282c5161
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:00:03.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxR7xewLtCLVnRa2Kiur4nclsZJnCgW2pj6cH1vEBnA+p9gcsjIHp5TBTguErWmCL/78KOlQXCrDazRENYLylA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6189

On 19.04.2022 17:40, Demi Marie Obenour wrote:
> --- a/xen/include/efi/efiapi.h
> +++ b/xen/include/efi/efiapi.h
> @@ -882,6 +882,9 @@ typedef struct _EFI_BOOT_SERVICES {
>  #define SAL_SYSTEM_TABLE_GUID    \
>      { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
>  
> +#define ESRT_GUID    \
> +    { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
> +

I'm sorry, yet one more remark: This should go here only if the gnu-efi
package also has it there. Otherwise it should be added next to the
other GUIDs in efi/boot.c. This is to make updating of this header from
newer gnu-efi versions as straightforward as possible.

Also please once again use the name from the spec,
EFI_SYSTEM_RESOURCE_TABLE_GUID.

Jan


