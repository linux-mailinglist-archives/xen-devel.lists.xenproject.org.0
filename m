Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F47159BF
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541012.843283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vVN-0005iz-0A; Tue, 30 May 2023 09:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541012.843283; Tue, 30 May 2023 09:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vVM-0005g9-TX; Tue, 30 May 2023 09:19:00 +0000
Received: by outflank-mailman (input) for mailman id 541012;
 Tue, 30 May 2023 09:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3vVM-0004Cg-53
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:19:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 026bd110-fecb-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:18:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6851.eurprd04.prod.outlook.com (2603:10a6:208:182::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:18:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:18:29 +0000
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
X-Inumbo-ID: 026bd110-fecb-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwkT4sEjvYNpfKFuOMbUjEZBFhf0h8GqzMLww7GdSoB65qZ050wJmjET3HJ6FklvasjQhYtlfTXGo2j1Adc+iqewvdgxMtaTbZFcNnrcZS7q2KXo5LH+Fr34DTqFXDQIRXE0agBmgkrvbHB4Lzxp6itbN80jRImEc2645/20bZ+/ILhwNvGf3EfZ/YEolBUNWBO+tKELxxOcyE7ZiiAEcmnzvSOOUs8opsVR2sCPO2+vMFt1tc3FBdpb+FYu4yhIAyfrcNvyEYzISW8THxHVYLOxqCtFom1cXeGA5K71dk8Sib9N363vkS5WjWcH3JbERulAuwR/TfnImbK0zK3q9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUm+r+Gxe0B9q3CmpmOq6xvj9aKAItU7wrYHA+GNleo=;
 b=m7jQvC7V3T2yXBxcNWDnS0acIpBy1bRbGwKO6HP4xzLyfLQoXEglhu4MMJKa5ERFg3fyc2icXdAWymr8mJEA1kslEUAxtNIzNCFBc/uBnUGYUBmM4wNVVs9Tfo4vrWZca0hJil/H6R+wFbZ8CVPlvYoPq78Q64iVuZKn47wnRV7sD2ii6VDrmvIaccizXKqJNkhcw7yjbtkYOoBSpHfItZTY/cByGRQvldc0ejrvPQS+07dqcoFqmq9JRman+ZBKKlH8e+Dr8rl0UCWRvuq66G9Ji8+I430XqxLt2aAHpyxCDnuoCdSk03ICbs9hZsCwVhb2BUrxdwx9Y9uQRxnm8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUm+r+Gxe0B9q3CmpmOq6xvj9aKAItU7wrYHA+GNleo=;
 b=3B/ErUtQIYjRtZZV6kne+EyTxPWM7IBV2YPCN51h/K+of+xmS6lxTvD0lC9P/dGBck/S+vrnNdoJ8TlM2sdhoSVM8ujrspos6119qWVyWao2CFOW682Ng68F9i53KTnAION1qUSaJrIq7Grohyzf6MndBAvP12vkF5OgIVW9U336NA2TA0tECH5TlrtLwJdInPCW0+BkxvISuXl7kq2OhQk2ebPgTCngFsge8Z5/tmvIL+rj8x90QGFDZ6u5ydm06gvdkJjFb2HhvkTDlkl/DGgWKcnGkCbPiwFjKbQ6ZcbP3KtwqaJituflzfxVqvtKZEpioBS5Jz0QwTg8BnJOtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f38d4c1-dac7-611a-1882-a5e6de16d4f9@suse.com>
Date: Tue, 30 May 2023 11:18:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] x86/spec-ctrl: Synthesize RSBA/RRSBA bits with older
 microcode
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230526110656.4018711-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fe27de-1c63-4300-a7a7-08db60eed4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w/KnyeBbYlN8kwIBP/Q/17Z/WrXt4cVzD3OyXyiitzomlxvXrlhNM2s9x5xhoMPJHR7Kf0ikGCqviT9DnSGILnFHaWgNf5pl7cpxE7yDjFpRw300bPg9jNieyCCtNs7ubkzXwPFOoYJtNJHoYrFaYu9oxfhd51cYJBS6lJ8ojBbxSdXPXoZpBcElsNYFBVdN9xalupTpTKNa0tOrN9w7TDQpEAtyGZzvmjIgfHSJes3498OE+2BkcUmPdvcRNCbMUne3AkdlFqIqjTlRCWN+MmQU6kDcRNTgFCAU9E5DmiS4eI/oKZO2/86wVdLDabSyRiqGP6+LuxYlu6pPAjyo6fqTL476vMTD3kjn+LDFnzSQUSSbJXG1mZYEfFC8hXFVKHTVi7b3DO/ruc7sX4QbB5UPttp21rEe1gX89B7VHs7OWKg7bugSbUOzpvnCT4KceRUX1INZehNgsc2wRjkxmvDpoBaiz4VLf060JlbcxgIYGX8K95ydxXzc5qOgCavnRciPXqNKBhWXE+Jo2QHMNdnSOVKBnCQHq1nIes6CfKLLFZDKWzA75xwNxGQE1HNZtrFQpfeujtyZna0yXfr8w7oj2JeFwHAE5ZayMFhpVV5u/bNjlIjU7wsWbqBC2o4V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(2616005)(2906002)(186003)(36756003)(38100700002)(8936002)(8676002)(966005)(5660300002)(86362001)(478600001)(66946007)(66556008)(66476007)(4326008)(6916009)(41300700001)(6486002)(31686004)(6506007)(316002)(6512007)(53546011)(26005)(54906003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU5reHB6VFNSNE5Tc2x0QTNLOW1CTkRUQmQ0b25mOTl2M1Q0amlKMUNTK1lH?=
 =?utf-8?B?T2xkaGE1ZVhnU25na3dpV3RBOWhwbFBLTktubGJ6U0tiZjJkSXdKNkZpNDV5?=
 =?utf-8?B?Qk10bmxaWURKNSs2aFVzVm04dFhXU2hQM3MreTFRRmFib0psTTU1TE84Z1NH?=
 =?utf-8?B?QlN1REsxMUpjWk9ibmQ0OFpCcnF2SnpqRzJhMDZlWXpwWTIrUlN1Y3MrdzFw?=
 =?utf-8?B?Lzh5dUZVSFhURnA5d25lWndUOVE0akQraUl1a0hZSmhERzBiVDRqWHEwRFQ2?=
 =?utf-8?B?M0VaeDlRYlVKM0ZTd3IwbHN0VGJiQW9MY0ltS1QzOURGbkM3RlFoQ2lHNUV5?=
 =?utf-8?B?L2FVQ2gvRk9sQW8zWHF5U0NqUko3Z1I1Ry81cnJvd2xhbkxUUWUwUERXMWZJ?=
 =?utf-8?B?MWVlUTQzVWxHWFROT0owbXhnalF0KytNYlVCU01lQkRwbjlkMUlwUmVySVla?=
 =?utf-8?B?dmVHelNNZ0R4bytnSi94SEwwQUNMaFJibFJjVDN5RXVyY0dJVVlVMFVpdSsz?=
 =?utf-8?B?YUo0U2U3MHU1anN5V3B1R2JRNmJXajJrbFVRQk9QeGFTYS9tNHNTYVJhdE5t?=
 =?utf-8?B?N2JCNENNNFJjVk5scElUaTA3cmI4YzJ5OGt0RWxJYldtRnNDSlJBYTlMVVpJ?=
 =?utf-8?B?NktlK205dGZZWVB3alh2SVV4VVRPOXIrNm1mRlh4ditwU2xVejQrRHU4ZWFj?=
 =?utf-8?B?blc0aFQ2TktzUHZGMXRCNHllZGkwbWZvZE5zbTIyOFVqQnp4NDNUNlBRaE9I?=
 =?utf-8?B?MW5TTEUrZTZtT1BKVmt5N3h6T1dKQzJIaUpUbjdQaVJPbUpPL1ZIVHpibTVo?=
 =?utf-8?B?WEFlbHZqL3ZXNmw5RllqOExJN1VsSzRZeXRzbTNIem9TWCtPd05UVlJ4S3Fs?=
 =?utf-8?B?QmxqejRheDJqcXJ5YXdoenNaSFFxbU9XenhQR2FidGI1bnFtWHZkNThXNGpR?=
 =?utf-8?B?SEY1S0VNVXdkTTVxYm5DVStYd0VZaHVFMDNIWlRyVGxMZmJjZWZKSWZ4Vldv?=
 =?utf-8?B?Ujl2NjR3L1pNOEhKa0hRR1JBSytEcGlaelZ0Y0FqanlmYnRMU1hBZU5mTUhY?=
 =?utf-8?B?VERZZExVNlUyZzZSUFJYSGI5ZzVzaU9rQjlZU0NXSnJQNkI0YmhnRGJTUDFG?=
 =?utf-8?B?TU5WZ0NoREhhRUEvVkpRY1JISDBIQ2pUMWRCWnI4SjRWSjV6TTJ6OWFRMjdV?=
 =?utf-8?B?SVI4ajd1YjYvK0dLdjVEMXBrVmtpTHlGb0pTeWMyZUVEWnExMXdhWWtaYXo2?=
 =?utf-8?B?bjVkalRqK0x2S1o4Vlk0eXp4RFhTK25QQlAzUElXS084QXFXam1NVzRXVVpr?=
 =?utf-8?B?MXoxYVdBd0Z1Z3NYTUhSbVIvODFHU1hNNGZXamUzVEZPMTF1dmh4K3dhREhu?=
 =?utf-8?B?OVgyRFh4SEd5RVR4M0tFQ1dJZkdJQTZPWWIwczExajZaaEUxMTgyeW1Iem9P?=
 =?utf-8?B?QTJFdis4RVVNM3V2ZGt0TDcwN0NBVDhadW5SMTl3b2lQTTN5VWpQOW9yL3o0?=
 =?utf-8?B?UEE1QlF1c0crMGFHWHNwc0FlTnJ6aHlMSkZTMms5QlczYmt4ZVpwaE5KYkJH?=
 =?utf-8?B?TGFwaC9GS25TcXF0K2J2WWh2SzNNV1ZQRFcwKzR1QkVhdGpzeGdnT0k4a0tJ?=
 =?utf-8?B?Wlp3Y2pnYjVUWG1DYjhpc1ZhcXZVRU1sYTBQbGl1TEFOYzlheWdscXdaem1R?=
 =?utf-8?B?VFV4Y0I3bG9Hd2NSOXFSclpWKzBJNTJjM2RNbVRVQXN2bGgzSjI5SHIxeWlK?=
 =?utf-8?B?bG9xY1lRU1NIZTM2QlJ6OXRTd1JuQXhhNXpMc0huYWw3YXg2STBiRGFuRUE2?=
 =?utf-8?B?NHphalgzZ3hsenRkMVgzTlRqUStNNm5Hbmx0ME83QnVXaHRsQ1crS2N4Vkkv?=
 =?utf-8?B?OENLVHdPdERjMVA4MEQyREt6RnZnVnNhT0Q5N2dNNVN4SURqaVA4YU1Ca1Ni?=
 =?utf-8?B?NGJvL1VqRENxRE1sRFhQVW1oNXlacjJldG13WGt1Ri9Ubk0yNkhTblNpV2VH?=
 =?utf-8?B?WXJxN2RLTmhTTkZNU0hXaUhSR3NqZmhYWXBNekV1WUVpYVdobjlTbEVRY3o1?=
 =?utf-8?B?WnNWRlFCamo0dUJxckhackxTQVM5WDRQa2lIY0JRMFdzczBzSTB2NFVxOVpo?=
 =?utf-8?Q?Hz0HE1Dmnddd3OcYwjA1Xkn/r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fe27de-1c63-4300-a7a7-08db60eed4b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:18:29.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Oapt4Tr+TfXu7/PTI4tjEQet7awJEIyXUaTTo1zedMIrs7IgGcgngoqiz4p6bfUua5OrufvFB11JdCkA2v9uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6851

On 26.05.2023 13:06, Andrew Cooper wrote:
> @@ -687,6 +697,32 @@ static bool __init retpoline_calculations(void)
>      if ( safe )
>          return true;
>  
> +    /*
> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
> +     * agreed upon meaning at the time of writing (May 2023) is thus:
> +     *
> +     * - RSBA (RSB Alterantive) means that an RSB may fall back to an
> +     *   alternative predictor on underflow.  Skylake uarch and later all have
> +     *   this property.  Broadwell too, when running microcode versions prior
> +     *   to Jan 2018.
> +     *
> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
> +     *   tagging of predictions with the mode in which they were learned.  So
> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
> +     *
> +     * Some parts (Broadwell) are not expected to ever enumerate this
> +     * behaviour directly.  Other parts have differing enumeration with
> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
> +     * to guests, and so toolstacks can level a VM safelty for migration.
> +     */

If the difference between the two is whether eIBRS is active (as you did
word it yet more explicitly in e.g. [1]), then ...

> + unsafe_maybe_fixup_rrsba:
> +    if ( !cpu_has_rrsba )
> +        setup_force_cpu_cap(X86_FEATURE_RRSBA);
> +
> + unsafe_maybe_fixup_rsba:
> +    if ( !cpu_has_rsba )
> +        setup_force_cpu_cap(X86_FEATURE_RSBA);
> +
>      return false;
>  }

... can both actually be active at the same time? IOW is there a "return
false" missing ahead of the 2nd label?

Not having looked at further patches yet it also strikes me as odd that
each of the two labels is used exactly once only. Leaving the shared
comment aside, imo this would then better avoid "goto".

Finally, what use are the two if()s? There's nothing wrong with forcing
a feature which is already available.

Jan

[1] https://lore.kernel.org/lkml/f43c3c33-f8b9-e764-709d-b3864d2bd9f8@citrix.com/

