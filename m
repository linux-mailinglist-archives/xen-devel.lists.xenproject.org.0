Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175ED6C33DB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512717.792870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecmk-0005Db-Oa; Tue, 21 Mar 2023 14:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512717.792870; Tue, 21 Mar 2023 14:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecmk-0005B6-Lb; Tue, 21 Mar 2023 14:16:22 +0000
Received: by outflank-mailman (input) for mailman id 512717;
 Tue, 21 Mar 2023 14:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pecmi-00059u-Oz
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:16:20 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe16::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f355e2a4-c7f2-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:16:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:16:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:16:15 +0000
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
X-Inumbo-ID: f355e2a4-c7f2-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsVjAKwQMzcgcYLfxlKdUQIS0glcaLVoMxCAVGUyqoZxRrw79BkDYhT8H2eZNoYtOVwxXKCgpPxXq+3vPMLS0/H83XnM7r4sKVkh0Qp83MOONJYo8HYGHUFX6DtM2gwPk4VQ3mupEwYkNPqUJH7h7lINo8p/KgNYUrKZB8t7A9TxcVmXHZ22vkwom11h8OE90ypVP83FdVczQOsVr2d8mqx740YTKtEVukGoSVcxolIXGSHEqIbNRo0pa8lAdCZOrfQhba3cazDoIDtpgzRKpcQ3fUvpNju68UOif8AsNmp1VQzygD0fgI+hKijpuiT1cIJiK/GsHyZ7k1s2LKVMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmLdBnh+eDAXV3tNCr8h2itPWwIGIlAM+hXFVkNH9Dk=;
 b=AakKS+fR8PLJcvlgs0OYTNOpMFWdt1lM67Lk9bdmMAqOqpFQ/VXUC9VGHpXEekvvTsbcQW7TlRYlqSRnsMIfrGn/Ij7qhLcOXoJ3E8mm/Jm9jEd1U1OxIqUpnvCMLus11klv25rVG0mHVHpyfSxcQN9G51p6bptd/O0VmQxJCYyJmQvWemeJeEcJmOtSBQQpVaUAGxRPO+XDNm1Hlz33QkDcvg24EVg82mtu24GKkZ6aWRRpkNLWR/5CIesIFL+UuUuY+YeHcU1JdbiCjTrRPjjH86q4NBDUVfC8yQVGvzvQ7YT4svidJOE9Tqusg3XHm421Kpwtn4m3S3IQmM9+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmLdBnh+eDAXV3tNCr8h2itPWwIGIlAM+hXFVkNH9Dk=;
 b=IEM/Ge0VhojXV1cRFqr/X7oipRwaKmZnt8eBYHFe/cGRYoe6/aBDvIbh6IUdhrL3eq92keZeMuFXhil64dhoJQ1Q2+kLHT790kwjZFl2K/8kTIdwLHRCig7U7Z9Qe+TTPVj+fzNWyYEknGBgBcv6xF7WoBjdcy0zpF5LJ68OuDqxt9dGsZ5KZvdgfzodMimbCirJ4HetyM6llAgHaXE8RXs5n3T/YZldNvHxxwRpS+/xzLhnFbgA02QFmiBD4g2bfWZF6TRLiTlkyvvphupwQvd9Ajm1Zr2zmQrentyYO0RI2HH6Cqm3FL6IwYlECr23MT883hGrrkDjBTahxZluWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <197973ce-2361-f3e4-fd38-40b4ad802acf@suse.com>
Date: Tue, 21 Mar 2023 15:16:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN v4 04/11] xen/drivers: ns16550: Use paddr_t for
 io_base/io_size
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-5-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230321140357.24094-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: e4006f75-d454-4eec-1abd-08db2a16d511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U5kAmIK3k5a7EiLay5JFfVSWN2FWslcJHmYlBV0x+Wa0XW+RNHPb4nVCi5dXW5S+eK0j+pD3UBrsyBcvaeKrxx6EYwQV5DTibkZllfMGJZsKZ1ipET8UQ0FTfLb1UKF/14MKGThFCEg0S7MiOtiY7JiGRPPwjtwzyB2wS7kYpr0ff3nI0n23lH6Q90EMJFwiX/FbOJGurjsP9rZohXR8lLJZaWjCYDO20dBHRD2l6so4+/mcWXOVz8DF0LYCMTGA8A67kOImCVT2PpjpCcGBadZnsgDqD1CQ0AHHd37DMOZngblFLMRx9kzo3YqlwKJxDUzxXicz9KemHO2kYWp+G52WvJcc2Uvpz96BBrZB8TLU1Q2pK+Ch/cayxH7CkbDIFZX+tbBGoqNPRZ1ChUargY4jUIU7id/vooR8aIIAZ0qE2srkbP4/q5mt6eC1Ywxp3aAbdrNDWuIjZGEhsg3cSSjtBX30qpuC5skceWhZ6jwku/MOUQZL4ONYFxPfI1C2JNKSk/ChxU4T/pNzi//dgu9eiQkHpAyn+Cv5lFu8eES160+suDBCfRFzZYe6Ok2nH5nQJyvol7vHkS3VbHLAX78SQGlT+eg7SS36BXF1uyPg7BT89Zr4lSB7fbZ5+QEw3vs/iyZ58uFDI/c/Ufmoka5knrHoyrXvUpqxH/7MTPeGJW01xXzvvXvH8IN+O8NDDN/a8cJdk4/pCK59P7pqN7D/g3pFKn4FEMjs/KmWJqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199018)(2616005)(83380400001)(38100700002)(31696002)(2906002)(86362001)(36756003)(41300700001)(66476007)(4326008)(66556008)(8676002)(8936002)(66946007)(6916009)(316002)(5660300002)(186003)(6506007)(478600001)(6512007)(6486002)(7416002)(26005)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTA0YXZtVUQ0Nm5oajFaSXh4aW9pdm0vdVR2MnJRbjhVNjRrU2pmN09HNlBV?=
 =?utf-8?B?V2d0K3JQcHJoMjNpbDNJVExpNi9pakRZUXNHanlSVGQ5WmFOTVpINzNhdUVP?=
 =?utf-8?B?K1BHRTJSTnMxdW5CWWRvZ21UanhOcTRrOEo4NVpNVGE3Y3VpdlFaQ3NMRG14?=
 =?utf-8?B?bUJZZEVrZ2NUcHl0WnZtemFYL09tQkRYLzJzbWlSMVlDMFc0Y2prcXZCWUtK?=
 =?utf-8?B?TUh4TTV1SHdZUFp5MjFhOHpGRkVIcmRXNnZSbFF0aXhXR0o5WGF0TjFrMXFG?=
 =?utf-8?B?NlhtVUtiUlJmNDR0NThXUDY0VkNKNFlSZVRKWjFzSWRBUW5xcW5Pa0IxdnBB?=
 =?utf-8?B?bWc1Tko4WlBJOW5Dc2FNSHg5UXJpNW0vMzVuWkp2UE5DMjdEUWUxUlRoblh5?=
 =?utf-8?B?TVdDVVB6S1RSZ1poNDVUYTh6amxReEdtWkZiN3ZVLytRSDVtWENxS2pCK3Rh?=
 =?utf-8?B?ajJZNDJTMFR3bWNlZHdDNC95Wi9lUklIajhLUllrL3dlL3Z1ejJDRWlySm1E?=
 =?utf-8?B?WTRiamwxTnRHZU45QkExUjg3ZkFlMi9ab0RyMktUMnVueTZYTFBnTEYzRHBw?=
 =?utf-8?B?UHQwZE9sV3Z5OWIvN1ZQM2V5MUtXc2ZjVUNHK0NxRmYyWTdkMEhwQy8xYm5p?=
 =?utf-8?B?RkYrTVdoMDFNUGFLS3VJU1JPNjA2Q05KQWVxeWpZZGhwWmNSWDYyT3R5em14?=
 =?utf-8?B?cHkrUHBMamlZM3FLOUlEV0lvUXpJWXBwMjdxMTNaeXRzdGM4MkhuWVdpd003?=
 =?utf-8?B?emdZMWwwelhMUzk5dzBydjNEazFlUVpITGRNOWNiUE5tSTMxTnNtTjJhNkZY?=
 =?utf-8?B?V3cwd1FqaWJMSndaYWxNa2x4Yk5hT2NxMFEzMFpsNmtKcVhqM09MRnpwU3BS?=
 =?utf-8?B?NDJPbm9YS0ZxdTFiMC84LzdjMlFJczdqUUNvOXQwWUxtNEdJbStrUndENE05?=
 =?utf-8?B?enIzYkV1VDRYUEZJMHkzSnJBMWxYL3hRaDk3aEt5RUNDUlBxS2lEQnZkU3hZ?=
 =?utf-8?B?Snc2N2dYTENuQ2h0MDlza2F0SFZLZkdCZmVHQ0FZbXh0ek9mcldJMVM3ei95?=
 =?utf-8?B?WEdKYTcvbWN2YnhxaXd5VTlzSkVWYm05U1RlOEFRZlIzQ2NKU3dIRTZBT2ZB?=
 =?utf-8?B?Q1JxN2Y2WkN2OVdsVmhhcjdKU2RTb2dEc1Izd0NPdHNhd0MrWEJMdmtxajBm?=
 =?utf-8?B?Slc2YlRmRVdQZTFlVEs2amdzNTBkS3ViazZUNEY4NDgvUVo1V2VhdVoxVlhn?=
 =?utf-8?B?RDg5OStYaUU3aWpqSktPSjJGQWE1OEIzZHlpR1hEZEVSS3o3dVZBdGxxRld2?=
 =?utf-8?B?aHVwRmNybGdDNW1NSWpmKzJVcjBZalF6bTJrWTBzWmQ1OUx5TjFOUGFOTEpz?=
 =?utf-8?B?OTl4czRPTzJISGc5RjNTWUR2My9FTkdheFYrQzNqVDM5eEJtWmlUSnBLS0Nt?=
 =?utf-8?B?UXd1WmlPZHhOblA3ZGY1UER1bXZZb1QrcW95MUJEV1NSZWV3b2VoeHBUR1U3?=
 =?utf-8?B?VUoxUEFRZjZ0QmpmOGMzTVNKUXFXZG1JbFh2TEF2eGg2Z2I0a3NHYURTei9i?=
 =?utf-8?B?TFJDbVd1RVVRVTJpVWZFNVdiaW5qWDR6K0l2azdtSm1sZllpV1BvSjNnQ09N?=
 =?utf-8?B?MGJtUlNPQ0VZeTE1TTFsNVlTU3dwQTFnM21nNFdCTWdCRFpPYTYyamswYUJL?=
 =?utf-8?B?L0doalV5azhLbVFxY0U0UHNuUVAybXY2UWhrQ0tibCtkK0xENk5vQ2o1eGNN?=
 =?utf-8?B?UGUweWxjYzE1QUgxMU9Gb3g1MStsVGVsVnE1OGpqN2t3eDUrN3cxOXV5Q2ZS?=
 =?utf-8?B?ektGZE8rNW5ESDE2cjFvUURGOUFJV2tkeVl5NDBHMUNlTjB1ZUpOakZVcDA4?=
 =?utf-8?B?UHFqUXA3M1hHR2cyUUdtUVFEY0U2ektzU3VObWhHanI3RFJnRmR2UGhKcWtZ?=
 =?utf-8?B?eHUxQkNzL1FQbFF4cVo5ZjYrU3h1SDFXS1U2QllvbTZ6UUtickcxd0c5ZUY1?=
 =?utf-8?B?akdSVFdZeUxIcllwUXd5bEJ3cFFORXhCUUIyL1JIMWxEN1R3YngvSE9Vd2gw?=
 =?utf-8?B?cnlPb3IxME9sMXJOZ2dZUUJYMGF0enZ6NVQvK2hESEN0WjJvVkM0SzBpdXVP?=
 =?utf-8?Q?cwp6kXBxkY4uMn4gXRkUaDRSK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4006f75-d454-4eec-1abd-08db2a16d511
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:16:15.6934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoUV4o8+KJc+6zjsTK3N9tIlVod5pwE3KExqPhg3f42aaSzWaSXp6Mq2IdIexH5DWdgcMlGnUZEXkOppyHN39A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533

On 21.03.2023 15:03, Ayan Kumar Halder wrote:
> @@ -1163,10 +1163,16 @@ static const struct ns16550_config __initconst uart_config[] =
>      },
>  };
>  
> +#define PARSE_ERR_RET(_f, _a...)             \
> +    do {                                     \
> +        printk( "ERROR: " _f "\n" , ## _a ); \
> +        return false;                        \
> +    } while ( 0 )

You can't really re-use this construct unchanged (and perhaps it's also
not worth changing for this single use that you need): Note the "return
false", which ...

>  static int __init
>  pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)

... for a function returning "int" is equivalent to "return 0", which
is kind of a success indicator here. Whatever adjustment you make
needs to be in line with (at least) the two callers checking the
return value (the other two not doing so is suspicious, but then the
way the return values are used is somewhat odd, too).

> @@ -1235,6 +1241,8 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                  /* MMIO based */
>                  if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
>                  {
> +                    uint64_t pci_uart_io_base;
> +
>                      pci_conf_write32(PCI_SBDF(0, b, d, f),
>                                       PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
>                      len = pci_conf_read32(PCI_SBDF(0, b, d, f),
> @@ -1259,8 +1267,14 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                      else
>                          size = len & PCI_BASE_ADDRESS_MEM_MASK;
>  
> -                    uart->io_base = ((u64)bar_64 << 32) |
> -                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
> +                    pci_uart_io_base = ((u64)bar_64 << 32) |

As you touch this code, please be so kind and also switch to using
uint64_t here.

Also why do you change parse_positional() but not (also)
parse_namevalue_pairs()?

Jan

