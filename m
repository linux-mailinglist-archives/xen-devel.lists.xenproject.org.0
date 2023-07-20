Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9475B3E2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 18:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566702.885887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMWDP-0002Qd-M9; Thu, 20 Jul 2023 16:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566702.885887; Thu, 20 Jul 2023 16:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMWDP-0002Nd-IZ; Thu, 20 Jul 2023 16:09:19 +0000
Received: by outflank-mailman (input) for mailman id 566702;
 Thu, 20 Jul 2023 16:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMWDN-0002NV-On
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 16:09:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c58f2985-2717-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 18:09:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9241.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 16:09:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 16:09:11 +0000
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
X-Inumbo-ID: c58f2985-2717-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKGsOscJJO95T2SKW5ZLi+JrwStTfVDoFzQ6NG9xNw8+Zqn0LdkfP99U+VwRzQsb/AfNTGQqN2dVbSdy/f2oOBYpuYIo8r6tBT3WAD2PIFW4ZcyU5ji4+3jacHyWTS2f1ILwu3GosU2Q/SoXT32ewz4DAkfWo2ChoDIREAnwUl1+bbhH4ZTEXvD6DlcCl1aeJ51ODEa2jFxvO7p34i6JaLetRuG57AzwppUtGdhFj8Ja6u9NsGGh5MgwwykNf2pXrKEYW/7pzpyj6N7JLCCiUK4CpshXu3Bx7R88yiGzJBIx4ckIwFt4mhuTt8Ej2S+Zi2xZoYjrz9z6Chxvu4ltcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REC0gPTAmLm90VzImgSgtbRmFJQgH+0+SI5Iy9RMQRc=;
 b=bJXsMTSY8S3js8WvFAFqZaMQqFCBo9T53Yo87Czc+e0fYvT/+DvCYBWYaST7MHmpU6IycUoI3RxoQ75YApYfnSWpp3gLETa8uYK2vzrkglWRDI5T5185JiHfCg1cqdw/4RzCGcvOiYHLxZS2+o7UHgxvp1csSMmfKm0JEJJGN/rjyERMyv9khQM89pkO6uYXzHXHt5J04x8/qi3KVJrfm6iQMEnCFTep/KreJ4PUS9CMF+QEDUa1DK6pXgTQYgx6PzqrcgQpQCeME9C+eiE9LMogmZ+yfMdUa55w4pG5WKlbccxiioDqXcaWJcMNpGe6dJsZ2Fx9Qj1EZ1DBZBaHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REC0gPTAmLm90VzImgSgtbRmFJQgH+0+SI5Iy9RMQRc=;
 b=Khmueld03rXwY3t1ZdSgqP3RP9MXXQfn/ch202TK3dYf7zk/jt+6WCQlvkhJxIYhjIdv9FJSrVDniwqd7EXQGm9vhz5h7gYjWekhTN+9+ks0eCDyst/BX58ebPWUaCGHeiBB1aKpZwyCAgkTcwvzMwkdJUZKqzZy7ch6oRp06pznDR20Qx1tXQrTY9gx0V4PSNzKo73LiTW0BkRfhV+6RmQM4BLzAhMuc8xKNBkUC42nUPPImfjfs9T/nEbaTpM7brJUrbFPlfon976QGRbfL4GMWtiqadLoSr1y0diPN1/+d6VqI4weVfHsj2GqDlF9zGImH695M99lYtUuj5gufg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77cdee40-5284-bb40-c29a-54cfcb34af25@suse.com>
Date: Thu, 20 Jul 2023 18:09:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9241:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e50024b-4df3-4fbc-901e-08db893ba7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ggwnbbANBfKMXMgub8stbfF6wCKYtQl3JGagomNDnhCPWJaDFhGqylrLJZhK2y2aO84Np1K7NUhU2jsN4bAOgif73BGW8e8GRhCFgY47vhrdz3Sqcr3ZrqjMSVs89QHU0v6J7Eip2sSkRnqWpPRBKTTSNqHlqGOjmmwCfbMa1oOR5R6kRUhVE9g8eP57QCNgpbQ8pPe291M43Kf6YMkLvya9Uw8VjmhT03exSx+l9AriNjQEJY5gJJRSXCFjXSLGp2phiLrAlYPwImgAaFKB5UbTOwTXk5UaEBcZQn/4FlMGbCeU+KJO7VXjwSshHDfzm1FUfJn6MGoMqLqY0sCbWzQnBL1RxBZtD/Za3v2/0IbNtUlRoq4igOeN+zcC6XCNgOZlpApP8YSufEK/Xoglcw1rWzG6CpO/OVzUksBOdLG3y3PwYEmmrzhUxx5WKjMLicLnXcE45M4HK0TeMjkxaC3sQw4IWBEZiNmPB9cyoYk21bixN8n6WxFBeKycu+cUxyGgtg+FwnmO1KFyzPcls+d5Zp6rD4kdYzuMTiSZNx0AQsLN0lviYnFcsfOdVpniDozj8ZvFUi4rO9/GU6QMuO+TMjmymoOn2ayboeh5+XtGNu75baQ7QqBvmaGikIYTrKUHRXBG1gOfHGDwxq6cdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(2906002)(86362001)(186003)(6506007)(31696002)(26005)(53546011)(83380400001)(2616005)(38100700002)(6512007)(6486002)(54906003)(6916009)(4326008)(316002)(36756003)(66476007)(5660300002)(41300700001)(66556008)(31686004)(478600001)(8676002)(66946007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2J1SWNya09JSWd6KzRFcWt2Und6dUI5THVqUDBTdUxNNkd6aWI2UHJrak1U?=
 =?utf-8?B?cUJUeFRETHF4aC9OSk04SjVCUGVvWTlXb0ZXQndiamFHeXIzNEZtTVVNdWI0?=
 =?utf-8?B?NG8xN1Fpb3ptV0xGb05RZzhmcTByY3JCSFBwR3FBNklGbFRXNlVWdHdPWk1j?=
 =?utf-8?B?cFAvb1F1Mlp2SHB5TzU1dVJMbHRteXlvbTlCam9YTnE0VHNoMzdjRER2V29m?=
 =?utf-8?B?UmlqVmV0YW43cDhZTUxvVy9hZ1YyOVdvVWpES0tncnpqV2t4aVRueWowSnp0?=
 =?utf-8?B?R2NJUzdHOUtzRXcxYllhbnJBS0JiR1p1V3YwcThWaG9maTdvd3lRN0Fpbisw?=
 =?utf-8?B?c3p4ODR2VTcwczh0MW9KK1FrNWdkdHk0aTNOVHQ4aiszVUdLcmlOSFBRMllX?=
 =?utf-8?B?QloycnlNbVdtUVQzOEJOS2loVXVJNzkvdWN6NGRpbDFIeGtjbXdHNmU5UVRw?=
 =?utf-8?B?c01IWVpsOWNNTHlUNUhlcC9RUnlZTzRjaVpyYnAraTladWd0UGgvR3RoU1Nu?=
 =?utf-8?B?K29lRkxyMTJJSHA2aS9qS2NmbDNSdFluMkZHNmhaa2dtdzhzVlM1WGtLTUpO?=
 =?utf-8?B?S0JjUnJSUTJBV1lLM2dyNG1GRzZSMVRNWDdrZ1djaEdqcExMbklCcStrNW1C?=
 =?utf-8?B?L3lpRys2YitiN3B0aGtPQnp4RFpPak1rdzd6RTlidCtuU0FXM2poVFZvc3p4?=
 =?utf-8?B?dkhpWTBPVGRkWm5NR1hPZXRka0xBK01tVzVlSkc0cFBMSlJNcnAyVjNnOWZP?=
 =?utf-8?B?QmZYcXBmeE1wWTlpRHJYRjgzbVcrZjltUktGRThLeG5Vam5DMUJiWnBrSlJv?=
 =?utf-8?B?VWRZUmtoNWh3M201VnRFT2h1VUxGTnhDVlFtYXdxYy9DZFEycDJ1aXRlbzFT?=
 =?utf-8?B?MHRrcEV6NWtLc0hnc2JvVUJNaDBFRUVJL0RyTTY5SlpLd1dwcVM3Z3Z0U1A4?=
 =?utf-8?B?dDlEOGRtMlhCVytYK1lLTTNIZDNIR3BPVnZtdE5VWC90NERYVDVLYUluaDZX?=
 =?utf-8?B?N0lxUUp4dTRDQUlqSE1VbVVIckNuWGQxMU8zNFA3TThlMzlxQ2x1TnM5RUpN?=
 =?utf-8?B?ajVnS1BJYmpCOFRqWStGdUlhdm9mL0lGVHc2dU1CRVN1ajNlR0V6TjVqeDNK?=
 =?utf-8?B?M1pCSmhkZ0Z6MzFvOXlEeUZzWlpsdThuL2FrbjFablBlNk5ab2tPWmN0Z0xq?=
 =?utf-8?B?TlhTdXlFQmtkU1BkSWhiVmMzbWRnRXpvVWRJRjloU01hSXk1eFRtWExvT0lE?=
 =?utf-8?B?L3lPS0Z5TTNkdmZzS0RsckZCL3o2K3J4cEFHNlYxblYwbnBWSW9KbGJ1MGll?=
 =?utf-8?B?MDNLOUhJRnhnR0dkQkY3aUJTR3dMVjFtQXBFamR2SjFvVEsvb05FU1lBQmg2?=
 =?utf-8?B?Z1czeDVUeG93bys4Q01OT0JLTWwxRFFJWGZCb2pRa0VUclEwcDhFSXR5b2Fp?=
 =?utf-8?B?OEFmUkhaRGlzUytud2xtckVzNnQ1TW96ZFI4MTBoY3RkR1RhNGVHVytacmpD?=
 =?utf-8?B?amo3bVE4eFFwRXliTmsySksrWEloT2ZrRG8yK0FaN2s4R2l1ZW9xa3VMS2Rt?=
 =?utf-8?B?eVUxQ1h6V1laK0NvRDgyR2lvKzhDckdBWlpQV0tvWE4rN2YvUjNVNXhnNDNn?=
 =?utf-8?B?K0h4TXlYUTkzQlBSeFlFOUJIcUplOW1IWmFHWXNhd1NHemgxS3d5cEw1S0Iw?=
 =?utf-8?B?RWpGTlhsR3FEN1g0dUdVMlFqd1V1dlFVUlc0ZDRFSEppQzBzVVBMNlJGMmw0?=
 =?utf-8?B?cUxBSWhTM3FvZWl6RFlsK09SRzE0OE1CWDByRjBIZ21penpmUmZleS9Fb1VT?=
 =?utf-8?B?TUZQOHpTeWpDMzVxS1VwNHZyRzRtdUVyK0xzVlU3VWFvVTd0bjhaN0VvVUdT?=
 =?utf-8?B?bFVhTFFMUFVWQS92M2x4QTRtVGhLSDloSjhKV2pINmdyaFZyaFNtRHFUVk5i?=
 =?utf-8?B?YXVSV1lEbXdIY0llUHpsOHVsRGNmamlYdWZjNDdKZEp6aERnNEtiL0V2ang0?=
 =?utf-8?B?Y0ZTd01FUGFPSFlmNFhwc3d4eUdJSktwVWcyK3JFcVcxdmNSOSszTDN5eUc2?=
 =?utf-8?B?dkFmUXQ0UzRpc2UxRlN0akNjOWtqaVNqUWVUQWNWTlpWMUNZZkZnN2dEK0hY?=
 =?utf-8?Q?QbfhddI63PWw4ezQ6bP6X0THc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e50024b-4df3-4fbc-901e-08db893ba7fe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 16:09:11.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxEpPH2I9BqHGOdr6WB2EiA33RgD3jyRg0+HxHMMhNxkYl3g8YGcvgvFbNlUT0D5H1WlxssT0jjtPIXuFVA87A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9241

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> @@ -431,10 +447,23 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>               r->private);
>  }
>  
> +/* Helper function to unlock locks taken by vpci_write in proper order */
> +static void unlock_locks(struct domain *d)
> +{
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        ASSERT(rw_is_locked(&d->pci_lock));

Copy-and-past mistake? You've asserted this same condition already above.

> +        read_unlock(&dom_xen->pci_lock);
> +    }
> +    read_unlock(&d->pci_lock);
> +}
> +
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> @@ -447,8 +476,16 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  
>      /*
>       * Find the PCI dev matching the address, which for hwdom also requires
> -     * consulting DomXEN.  Passthrough everything that's not trapped.
> +     * consulting DomXEN. Passthrough everything that's not trapped.
> +     * If this is hwdom, we need to hold locks for both domain in case if
> +     * modify_bars is called()
>       */
> +    read_lock(&d->pci_lock);
> +
> +    /* dom_xen->pci_lock always should be taken second to prevent deadlock */
> +    if ( is_hardware_domain(d) )
> +        read_lock(&dom_xen->pci_lock);

But I wonder anyway - can we perhaps get away without acquiring dom_xen's
lock here? Its list isn't altered anymore post-boot, iirc.

> @@ -498,6 +537,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    unlock_locks(d);

In this context the question arises whether the function wouldn't better
be named more specific to its purpose: It's obvious here that it doesn't
unlock all the locks involved.

Jan

