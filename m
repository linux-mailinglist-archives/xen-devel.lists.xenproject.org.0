Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498F694D3B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 17:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494758.764909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRbzg-0006iW-D2; Mon, 13 Feb 2023 16:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494758.764909; Mon, 13 Feb 2023 16:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRbzg-0006fk-9r; Mon, 13 Feb 2023 16:47:56 +0000
Received: by outflank-mailman (input) for mailman id 494758;
 Mon, 13 Feb 2023 16:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRbze-0006fN-Ju
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 16:47:54 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2897ed71-abbe-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 17:47:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 16:47:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 16:47:24 +0000
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
X-Inumbo-ID: 2897ed71-abbe-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNI/oJCSxT6OmpDu2RWmfPEDG1QlAgbnaxDUTQUJVFEkWY8NcZA9rvrDC/nynup+g7Hb1scCmJwaek00i7cqGelUu1qS1Cuy3kVEJyJkgc6UBKeO2hP2SmT0Jyvu4G+8tMv3A1JBPqXVkCHxQrKc8NZzLYmGzTjWuk5ZGpCR+b9QdzcNuLgb22mmDiTJN4IxjQHfm/T9B776RTwks/l1m4IwXaak//4dCUzN+LidlvLLRHo3CF0aA5A2O3P4zmnb0JCtE9Agh6/V6Zho3b1yGdOf2T++FmSJ8+Rh9JB0iOXKYOybcLvz2kOTj+04n+EJi3Uk+I4rUBrAnceBxB59Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdrJ9L61zZ0PMSNiVVDrrcsKMclEyt21jp6M+ePmhk4=;
 b=gwjh3i/tUmPcOWFbqaIENUMU9l7q1ViO/nFBTNETksAoHgy/cHIXNpM9morfIyzTQ/LNjICQPvfbTUualrM338fYbKdCv3YH6CwchPgM9jyLeqJR+lnxQAs7o89PiWzBa7Ib/S6SVOYyW1TVaj3Q9VaWyFvcqTGPOkvk6gW1KlhPtrfOwd+J3wMaCf1QjgNTiuqAiKD2FSLXhP7Iv3KN/HZA0PnAbEw7Jx5Ieg/Byd+KIVXUWIQSDX7p+taXfbyvEF0awmLfBmSYR7UJ4kiUAW3LfLabb5V8u0VHtnNw3NjV7skcAMxDoMrksDEgsztit63Iq1LkfSNGCuLc+iyt0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdrJ9L61zZ0PMSNiVVDrrcsKMclEyt21jp6M+ePmhk4=;
 b=tC33Tihr67o29W7x7lGDvC7Gr8Px7Ynp3y1SmHI05xCWoGwThgTLyD5D0fjzfgChbqwTSSM+8tl4ePxpt2YEIlEfFCDGB9k0NoKvn29o4i7G4OS5Q7Z1jPau7Sx9rBi051OWccD4KJ+KKLVULqmzz0kkwxjbhQgh8UHMEuZfBGfgtCx12y2Tilf5Xgkx8nKo01sSeUbZpV56DSJbsQOoPsiN+eyvU58Bcthfo4L9Xij08nA/8HCaapHP3UtkhiD+j2cPAOzPSeoQ3ShCagqES/Z0HYSUrNK5fVsIW7iYRb/RBn8hqu9HJ+HeDBjWtzLSTN3UXWqDYYIItcpUWTi2BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60b459c3-f81a-ecb4-35ff-76466a392db5@suse.com>
Date: Mon, 13 Feb 2023 17:47:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 02/10] x86/hvm: separate AMD-V and Intel VT-x
 hvm_function_table initializers
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb75739-cb07-4b20-6e3b-08db0de1fbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O1mNXyqdhQMAgAbVhSDNHkgzESuYHt8mIPRZ/yTqCXvvzwYn+xf+A0quJvzBe6aXQI70/IBR+6hHe3l3/nMBFgAcqf1KhYX9ycq18yHnH+LruKMz/bUYJqJGqdgDBEKgPnxviLZ7sm6rth+w8nPeDCKNmRyhRAi/Xg2vg2b/HDrq86zQNh4+b6bX3jgFrFI1n3G3N5nPBwiNsi9BsTUv4a58GcH/1U/Wo2x9CzO+cI2X7x4GB2PexneXQouCJXer9EQs/l3+W4Nwyc9xXU/Og2i3p13jBrumf50v0jKOQOIlUGLNv4uFfmw8rW4V8JE43Goz1TuxrNlamxKu3slbBvOS0/sec5ePzVCbIL29yD6CBdH/7HLb8pSMhvpqGWXKlGMzDVIn+OHl9wuZ92MdTRKLUZwABuXj36UxvEJxMzuxzDSUPpT6bhcDVfv1kLg4qnV2OqKxVtk4txHkZNLd5pm6PRk33Drn1E8gqGXoCYSLgl7DpmyX+EsGqikpbU/RnZ8w0pdm42WDmwKe3kniK5KovkLdNwkou0kWcGhwk6AoygqyGJxd52YvupA/kIlCw+sMoD5zWqatpJYijfsZavLBeLHWGsxDS2HPWzgBoztisBsfMZEO+/El4xxZkcRj6TW7QRLh7DBtFuoejZoXyNL5za9/zPdyhfWpSPEwre8UfL/1Qx0Y2vK9QSXr5enfVgb4t/kcik8l/+kcPdqvPUZp0JTqGq38S1jzpO4YGAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199018)(6486002)(478600001)(36756003)(38100700002)(31696002)(86362001)(26005)(2616005)(53546011)(186003)(6506007)(6512007)(54906003)(66556008)(66946007)(6916009)(5660300002)(66476007)(8676002)(316002)(41300700001)(4326008)(8936002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0p1djBhQTdzZlFFSG10YW9wUzVqV0w5eVZpNnFldVVIZlBDZzFIdUwvWjBp?=
 =?utf-8?B?SVJFOFNqMEg1WmRaRkFsWmRJeERBTjZnb0RiVG96M0FXSFQ3N1BsTVFvMGdY?=
 =?utf-8?B?TWN5SUYyK3JjOVFlM2gyY0RqY2Z4V3cwWGdDMHJhTUV4RmtlRkNDSE01dUxs?=
 =?utf-8?B?VUZxUkVjbXhINzZjdFAybjRycFZPNzhIZEZZR3BuNG40SXR0ZlM4THdxS0Jq?=
 =?utf-8?B?RFVjZHBRNWd0RGttc2JyYjF4Q1pjZGxrUzNOZDhvMHdhL0s2d0NMMXlQMUlI?=
 =?utf-8?B?QjR1NVZBSFBTZTByY3B1YmhCV1JHSU5tVzFwei81ckxGbXhvZDJNdEZkQUdp?=
 =?utf-8?B?SVZWS1Q2VDJ4OEp4QlZ4dnNuS1pmcEVPeUF1NFZSOWR2WGN6VS9SWHNHOUFm?=
 =?utf-8?B?dm9JaDAzQ3V2eU9KTUI2ODdQRGFjdEcyQnZaY2FGd3Q5YmdHNmR5MGRIR2lS?=
 =?utf-8?B?cGNGN3ppZVhQQVV3aEFTUkN4aHhNMHZQNUJTZ3lkN29HeVhURFRocnZiQ0hw?=
 =?utf-8?B?SjhTdjJ6Q3BFZkQ0Z2hUTnRHZVFtT1NJYjRDQ1laNUhsREhYVU9HL2VLdmlw?=
 =?utf-8?B?Mlk5RGE0eTJpa2w0NWJzcDNuTGo5RzN2aVBYMGFpRElkWlNwcklEQy9talUw?=
 =?utf-8?B?bVRTdjZmOGJ6VE8zWHN4WHlmclljYkpxc01OUkdhY1ZWM3NpTVN6ODZJbWx5?=
 =?utf-8?B?dGpqdFUyM2NIb0twUXB6RGN3a25hd0dqUzBpbCtsNC85UjN1SW15RFI3QUoz?=
 =?utf-8?B?ZkhyVExlNW9lSWFRV2wyN3hwVXI3R2pxVHdicWNRaDRQQmZvc2tSbEVRK0dn?=
 =?utf-8?B?MmdFWHBPOFVhMG5HZVdHUm81L3NjdXp1anUzMUpPYjBiVG1wbnFIYk9HdXAx?=
 =?utf-8?B?bHVHZHBJdzMzcEVXQm03M2NKQWlmcWdORk9URFlUR1ZFQ0t2MHltMm55TWIw?=
 =?utf-8?B?Tjl0TGlnbHFvc0M1cklkRkFBZGdTcFViVUV0Mzg3VGtXMjFZRllGQmIyK2NT?=
 =?utf-8?B?TjA4ZzRiR01PekhVWW81VG1FVUEyMGpKNExHNWNpU2tZZUZ5VHh3QWJXbmV3?=
 =?utf-8?B?WHRWK2piRlRzakdqMW4xOThRSStSbGZHZllCWDVtSkxCVW9GNHdmYWJyTlEr?=
 =?utf-8?B?bEg5MXljM0pmdnpWemphc01taFk2VGlTWTNOcU1vTUxtYkJGRTJFc1R1ajdz?=
 =?utf-8?B?bTR3aXByaXFDUXJEZXB2L1JvU2VxdEdsUWRvMGQ5TjJXSE1nVm1TbjBXbTU1?=
 =?utf-8?B?TVpPbDRqeU5RUzJRZEVaNGIxZlNIWXRTTzd6Q1AwbkUrLytBVEYzTDRqNHFk?=
 =?utf-8?B?MXNoUkYxRDNqWGxPSkFUZlNkZHJ1UnBHelc4S0s4SU84M3dxVnlkd1RNaWYx?=
 =?utf-8?B?dW1qRkNUWUxLZWZxYnAzZkpSZnVJemNQNFkxdFlpdkRib213NFZqWkxpMGhH?=
 =?utf-8?B?WkdVOVgwSHRhZFFpdnorWHpSSHBvaDJwVU05T2Z0OW03S283NHdyZ3A3MG0r?=
 =?utf-8?B?OE8xYzI0MUg4TWNFT2xBNHNkSG0wMXl1c3kxajNnZnJONkU5eXIyUjZGMDd3?=
 =?utf-8?B?OStIYWxvYjJDK3ovakhRSEU0V25EaURaTlhrSzJUVWdjRWFlMms3aXExZXNn?=
 =?utf-8?B?YXZFSEtJZHNNREdDZHhsbnBWTFJOMmp2aFA2Y1huZnJDb0U4OWFoNHM3bnFQ?=
 =?utf-8?B?OG1GNXVBOG5GeVFQNXdoRXpEOXp3cVRYWUIvdWRUTFRpMWd4eERpdmdJRER6?=
 =?utf-8?B?MUJ3T2RUcTgvYkZVK3hVNXJJZElnKzUyUlVoQjFxR1dWV2U3eGZwdjZXSzgx?=
 =?utf-8?B?ZEVXQm0yS0hKaHhITkxFUEhYYXRTSGNvODFKOHl5TGhmSDJueUVTWHcrV0Ro?=
 =?utf-8?B?dGxsK3c1anVGamVRalkrQlhodmcwUkdIbFFVSmVOUS9BUnY4OFFMNGZ6ZUN5?=
 =?utf-8?B?RTJ2akMvMnpNYUpjMkY1TlFOSFg2V2ZmWFprQ0V1YVpLZ0c4Vm1Td0NHN3da?=
 =?utf-8?B?U3FKMFh1NkhwOHRIN0QxaFo1eDI5Q25FeGl3TzNFOWl4dEpiNEZFWU9RNFVk?=
 =?utf-8?B?VnIyOG9vZTgzUEhFZlFDMTBXK2Jha2NRdkxjRFQ3eEM4dnRQQmpqSXd4amRJ?=
 =?utf-8?Q?N56JhDo3OHLuN+fCexgQ9RgtG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb75739-cb07-4b20-6e3b-08db0de1fbd0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 16:47:24.8163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQc1UIz0hccNjM8BKOKRGYoF7Aiy9wh0pzXE5bnm3yGhOHqNnniw8bQ3NhmK9uxKKMVeUQaLgiOH0ihtOfw6tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -261,8 +261,16 @@ extern struct hvm_function_table hvm_funcs;
>  extern bool_t hvm_enabled;
>  extern s8 hvm_port80_allowed;
>  
> +#ifdef CONFIG_AMD_SVM
>  extern const struct hvm_function_table *start_svm(void);
> +#else
> +static inline const struct hvm_function_table *start_svm(void) { return NULL; }
> +#endif
> +#ifdef CONFIG_INTEL_VMX
>  extern const struct hvm_function_table *start_vmx(void);
> +#else
> +static inline const struct hvm_function_table *start_vmx(void) { return NULL; }
> +#endif
>  
>  int hvm_domain_initialise(struct domain *d,
>                            const struct xen_domctl_createdomain *config);

Instead of this (which I consider harder to read), may I suggest

    if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
        fns = start_vmx();
    else if ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )
        fns = start_svm();

in hvm_enable() instead (with DCE taking care of removing the dead
calls)?

Jan

