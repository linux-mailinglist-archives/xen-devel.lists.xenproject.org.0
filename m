Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15F32036F8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 14:41:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnLkn-0003Y1-UF; Mon, 22 Jun 2020 12:40:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnLkm-0003Xv-92
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 12:40:48 +0000
X-Inumbo-ID: 98374ae2-b485-11ea-bca7-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98374ae2-b485-11ea-bca7-bc764e2007e4;
 Mon, 22 Jun 2020 12:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaXf7hNxjE/AdURDa2FUMOdCT4Sn5FBsLjSRQEFDwQ7SYeawh0ByX/nWAp/34vYg4eVITDJLtQxjlQtJo46oYdUGXfXVZZseWN5QCFaUCZWllJ/op4AQ7axyXGSgBnkUIBn/FHAXB6d3qhvIgDOL9Q075qqx7g1EUaWCXW6YZyrYP9SRS1VhOz2ALCPNpJdIs09jPqV3MzDHYrRNst11WtnSIEmgKUZZ+QKHrJjYBCN4k0DG7l3BEncW4D8afGgL7/9k4S7rxvGQboF0ti+0cUWWZi5WqEY6gszLMVcRPulsYLGSN7wBVtK1iQSgx/iHHHf6ABbyEwgweoeeJ1Pw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n9+xLmlyddooYjRjmoM4rOUfnxJtGQuUXHMaDgnOBg=;
 b=mHW67qXbr6vcmJbIaByt4SzQ4s9S9vW+avyIR3irvjbsUAM1rzR7kQX1ggJOy6uiZhcX3VLZL/x14TvhDz9OYnRyaRJdhW30A8NrDfOp5AtKOgzOrW3UqXp/nBEucbnm4cHhNa/E1O2CVLeQazbsL2g66q3cxeUlAtJK7T7wzG9KhTQpbSX8Hkm6lYEUAZN6nIn/3jb6cr9cPWpRp5jN/adOYx4dr+koI9Hx+Xz42lbHDJs12YT0RRZvv/WfbCK6U+7BZuf8yFUOcpYPSKrIio1ZDbCscrzAktXuyEfzTsZw1rJA1t2EmPsPQVk/j/lBuvrtPzamLWSc4p51SEskVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n9+xLmlyddooYjRjmoM4rOUfnxJtGQuUXHMaDgnOBg=;
 b=CdPoA+997DbYwqpHZ5QJBcYDkBvbxBOIWlhAPx33H4jDM+FUMI3JgwPLl/1IQ41DftdRk2tiFh88HeDXRp5WUixg3/6tAdBPFY5qrdJhy1cXyfXJV9TPu0IMA6H0jGq7NNWydAFGfjto0aRAmf08wHIwtW+gDRB34s9kvfnpM1EdNsH0QM2DOHRNqY+kfdccGBFQK7zI4UBQ9jAS/KUraUwu9IMvZG79Q0aSMdHwVBxWlJ3X2icp0GahPZ6AOENQffIh77cbxp+52df99VLy8mr5p67uK0hWANY1Z25YRBLWnKId7Wx/sar2PpjsGYkkT3cgVMI7X4oHVGXtZgh7XQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5583.eurprd04.prod.outlook.com (2603:10a6:803:d4::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 12:40:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 12:40:45 +0000
Subject: Re: [PATCH v2 3/7] x86/vmx: add IPT cpu feature
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e197deb-325f-81fd-7464-900f4fad29ad@suse.com>
Date: Mon, 22 Jun 2020 14:40:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM0PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:208:3e::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 12:40:44 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667747a1-8833-4dd6-138c-08d816a97b83
X-MS-TrafficTypeDiagnostic: VI1PR04MB5583:
X-Microsoft-Antispam-PRVS: <VI1PR04MB55831BA4A941A6C0099C3830B3970@VI1PR04MB5583.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KccFh+u3EEUJLnNRn2E4xIOO7Qkpvd4IQ4I/uuX/2q89Ycs6aYNJeaheUblqWw4RNXObLyOnmHBglS7lt4WzOroba3h+X/ibOjfw6V+dmUtecxa0eNFeCCOvUZfAwcoq/RwCyL1RxHCtEQ296k64oLBXi/5iakSocwyBQhC7MxYPvMBqsSnX0OEy1i11NOcHO8x8CL+ws/Ph1FOD68U9iIrGVJ7uUQ9iwen6cnpD+VA4rFF8fFEznLyWRhc0sIwO2tqMyzlBxiJiXi+Te/ANABVz6IlkgDZVi47Fd82NsDV3cgzJaSx7jM3wedI9u1qE+LtvVhJo7qseNgpH1NOWc9lXMGohS/DgkXqyoj4AMOC/ugneCQh94ggwTLVHnyPI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(346002)(136003)(366004)(396003)(4744005)(86362001)(8676002)(5660300002)(16526019)(66556008)(66476007)(66946007)(8936002)(26005)(186003)(36756003)(2906002)(66574015)(31686004)(4326008)(31696002)(52116002)(478600001)(54906003)(16576012)(6666004)(53546011)(316002)(956004)(6916009)(2616005)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WDtR9pGHuzy17tnsPp36nQCO892cNQL59pimFeB4ZPvlb4VclA4NlVy6gkDxnktvl+BK3hYYmH6NezEI1WDO99NOI8xL9Ag8/m/VtkpzUgxsuVjbie0on5jTThHBfapX1KiZJrJO6RDvEw4/p1a/ezO51acQaIXKIrth6BxuXSP7KljWcuXgZemgHjyYXMd32xfP54LlYq7Y5ffzLT6c4BTZKlL++TvZVw506tD+lnDh7IyMqKiCu0x8LLo0Q7tgsIEVtMNZ8qWKGKHxVyde6kfejq2mmMZH0kYuPh5ruETNsVEyBiGBqull+MOcFcgx9LVWITJHYX/y+a0RfeRLISfQGnGRCrlb2jZKeTbHZbFtU5vffBO+VGjVnPJD8/XEQaGP2z9c/ABwcXaGLSiCJzjmNkphRnkw/tOSlCF9vPk+gSpFfYXf2hXGEfx3m4FlFMRh02wXB/KIIA4y65aE5CZux8l5KJLaXoqs7n2mUDs=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667747a1-8833-4dd6-138c-08d816a97b83
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 12:40:45.1177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMqUAmxdZBiaOdr1jMVTKdCiGFfyKjnbx9VA6eJ8ySkAXzSRB6Wlo0nyBsCqrulXQaptxYeTTuLksy2hQZD19Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5583
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 01:40, Michał Leszczyński wrote:
> @@ -630,6 +633,12 @@ static inline bool hvm_altp2m_supported(void)
>      return hvm_funcs.altp2m_supported;
>  }
>  
> +/* returns true if hardware supports Intel Processor Trace */
> +static inline bool hvm_pt_supported(void)
> +{
> +    return hvm_funcs.pt_supported;
> +}

This is vendor-independent code, hence I'd like to see "Intel"
dropped from the comment.

> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -285,6 +285,7 @@ extern u64 vmx_ept_vpid_cap;
>  
>  #define VMX_MISC_CR3_TARGET                     0x01ff0000
>  #define VMX_MISC_VMWRITE_ALL                    0x20000000
> +#define VMX_MISC_PT_SUPPORTED                   0x00004000

Move this up by two lines, so the values continue to be numerically
sorted?

Jan

