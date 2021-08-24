Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F23F626A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 18:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171638.313187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYzs-00006d-K2; Tue, 24 Aug 2021 16:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171638.313187; Tue, 24 Aug 2021 16:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYzs-0008V5-FH; Tue, 24 Aug 2021 16:09:56 +0000
Received: by outflank-mailman (input) for mailman id 171638;
 Tue, 24 Aug 2021 16:09:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIYzr-0008Uz-1T
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 16:09:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b741b2b2-04f5-11ec-a8ea-12813bfff9fa;
 Tue, 24 Aug 2021 16:09:53 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-Es3UwiJHPAKke9AGLAecyA-1; Tue, 24 Aug 2021 18:09:51 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6420.eurprd04.prod.outlook.com (2603:10a6:208:173::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 16:09:50 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 16:09:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 16:09:49 +0000
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
X-Inumbo-ID: b741b2b2-04f5-11ec-a8ea-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629821392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nOReZvV5m8YZYnyWs99iv2pYeB9n9k5kn0p4E1nE8s=;
	b=RSNKFH+nYxv56t8OwBHKFNeLM+ifu6GW6rBn7AKEyhaQoGGOh24BDEIkJrnyRStnIO+jft
	m5xoEIieeL1jfQzA2OD+f0F9OiPEww9oPTZxDB2tBMVgK0aiOl7iwiey9/mO9HRjV6sz9z
	7CVw6o58d0MPdKWPHFgF4ZSZZxGOdzk=
X-MC-Unique: Es3UwiJHPAKke9AGLAecyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz6CCfB2RWfXWa+k2kRoGwCeKNmWmwOSEPl1um18o65MfIZ1u8Uzhzj9lUFhds9cmk84GTZB6hQc6fxjv68gvlvOdKoQiOCgsRk2CuKr/GLXHY7Xqh7D+lhWLERO0s1Gf1sPor84WSllQeQ5oLIyXwzeIrB3sjJbYXOW7ADbMDSGvnjHBxlpmLYgNPV4J3J1p2+v8FvTcif/UAR1v4qc1ytGBSnyCAdgNBcC1l55g3y/UynVB0XMnTwsaiNHzpq1w4kxegU3mRPLhvmXDkWiRKpDzqxIrzFLPLH73Xdi4JlhAyeH5ktcmow+ZWgdOVPw6oLbQjN0SzexCkCERhpJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nOReZvV5m8YZYnyWs99iv2pYeB9n9k5kn0p4E1nE8s=;
 b=Oi4VIIr5PziiGHgUtE10OWhVCnqWktLApIoZd6ASXXfnuAJe2lGDputpMGQKsxmPIjS2vQEZYmGhzqdsJZeluBF1g/dOECJg6xzE3cfr6LGCrgIkDqt53tvsxTA4VZQsDGgTQ+dNPstVsx1K7OlPO126PLkb2fHo29T1jk8XxIID9N5CTdlnOVmm2FKuF3i36RlJH35FQVb4jJZRR/Ezq15Zb79tngZ+n4cOeIFcGl8D6RTK5sg+w/TNUc/TpDLLxZBPkdU/KWmCl4JeTwUAD4j4GShuW1bjlA6xvDLPbdVeHpg/PUkmaByZh2p1XzsrPmVVAGcg748TYAqKBjv7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 11/14] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <370f4f87c148eaee5ac5ec69346828e6473f0f2d.1629366665.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c4cd8072-e463-6c9b-ddb2-640108dd5d2a@suse.com>
Date: Tue, 24 Aug 2021 18:09:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <370f4f87c148eaee5ac5ec69346828e6473f0f2d.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::14) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 762eff3a-5c5a-4378-d888-08d9671999af
X-MS-TrafficTypeDiagnostic: AM0PR04MB6420:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB64206728AB1F660C9E0D6023B3C59@AM0PR04MB6420.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GTPxfwdbVSknsK+Q63uugkSS0xgaJ9Cy9D1TMjMl4qvpn57KKtuKN+B56nyBQKtcGm/ZjDTzlOSoszfC8ebsMR4TQDgbwgiBuoK52WkycuIrK5SE0FIGnlvVu9OfpgP3S3rzQINEJb3ClVZcoFgRhrEifgmiassBpibMqTh/lxrrP0aYzPP5nctGRnQAhWiIuUkSmoIFhytZEa9ELVrxYSkLpz2a/cg241o6287qj8+zag+xImQb6bIIHo3OUAQTnwCF3phb65fc8St0mVbQg+Lk0nYDGj+vEjfdMztMk5LaddUaOqCpItvs2qIcpwAIDUxzmxe59EuNQNQ8vxZhEw8mAYpkKArNUvRrfgLR/s8/n1PERuuwq+5OcIu33CvB+JUmaaHxcMZXKzSkvUCZbvHqrUF8OuJ1ZxpbzvQeOPKmkipu80rD3hcD7sjxiRA6esf8EuwBoSK8E10eOxA3RWJW+7AkQI/eZQcd/S6/kEFN/vcUkT1wZzxwy8aL7QQd9q1WJ1AwxOJWQjaIRKq/ZsRFjxhi63grv3z6ZFHBh9fETQrziRMm2tVhzaRfHhmL5usUbXvrtuwvMBzW1MYkVmo2oYWUmLmVG7uQNwyvhsNSg0Gd0KYoJlLkblRjMmYDWkiouVtQY2sEEAmlBxWBAXJa3/lnG1/3iS+sGHPrZXh17e2SZqaJ33BHDEAvuqm4pyc1QVzOUYpb/McJ9z6jCcNzpJPuJ5XxvaTY3VPrplQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(39850400004)(136003)(366004)(26005)(186003)(86362001)(16576012)(5660300002)(38100700002)(6486002)(316002)(53546011)(31696002)(4326008)(36756003)(66556008)(66476007)(83380400001)(31686004)(478600001)(8936002)(956004)(54906003)(66946007)(8676002)(2616005)(6916009)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDRiL1FOVmQxSWFTWC9UZGd1dTRLZHEyY0VPVWJ1ekRCS1ZOMm9tR0pFMWxs?=
 =?utf-8?B?MzNsWXRKQk9aaFNlaGY1bUxnbHYrYjljakdwRDhkVVNJRFp0MkV6SldIR3A1?=
 =?utf-8?B?MnBvOUNWcVpUTmdFVk1XWkYyS20zcTZUeS9ydHhLeGpteHFpQzQzK3dRVjF0?=
 =?utf-8?B?SFlIS2FnUnJJeVNhaS9hbEJ6c3hhY2tyTDBNNkNlK1haNCtlK2d5b2l1aXdw?=
 =?utf-8?B?LzdjUjhEaC9oKzRVQStFcFZDUjBzQlVJc1hTOWJmeks0V20xbFN1S1J3STE2?=
 =?utf-8?B?eUZ1VmpvMHV3LzJDOGIxNlpJV1dTb2pXdkkyMTlteVU1ZFZFOEpCRzRCMHBn?=
 =?utf-8?B?T29LRE91MDVLYThhOG41Y2NUaHc2SzdtZTFZd0N5ZFlVd2oxYng4bCtZUnJi?=
 =?utf-8?B?Q3hKTlNySFcySVpmeDc5eFJDOHRDWFoxQnZLazUyUkxabTFVSEJOekFnYTEx?=
 =?utf-8?B?Rk13NUd5UlVvVHpQcWpYeVRtNEQrcXJGRjF2em9DVVkyaWNHRGFKUkRvRGJy?=
 =?utf-8?B?aEkxOE9lc2hmbXp4V0ovblhtazFMTGtJQjJkOEVTaGR6dDJ5a3R3L3QzWmxh?=
 =?utf-8?B?bVJSWEtSWXhidlE2T01kVytVWStkdGhUb3dJbExpcDlodkVWajd2ZWduK0Mr?=
 =?utf-8?B?TWtpRkFlMlFPQ0orOStWWC9sS3hGKzAxTThwWEpoNUZlSkhOdjdPM0RsWFFi?=
 =?utf-8?B?ZTJ4ZVBlOEdsNy9jOEpBdzhlSUFicFZhV2ZWcktteGlUWk5BM1JDS3J3Z3Fj?=
 =?utf-8?B?MHR1bThFWW5pM2wrQVNnQ0dpOVBwR3d6UGdBNm9SYVhvZkVRaXVvMkFrbzc2?=
 =?utf-8?B?QXV1VTc1UHFTM0hXM0M3WWVoOGUwOWNDL2EvWkg3cS80Q3FXUi9HTlB6bmc5?=
 =?utf-8?B?bStNUGZpZUp2bzFzaGUxN3VLb2V0L01PNSs3bStPWWQ5TVphRFJlbTBCOHZh?=
 =?utf-8?B?NEFKQnhzRjNmV3M5dE0vRU52TXJ0T29wTXE4dlBCQVJPcXhiL3UrTkx1T3pV?=
 =?utf-8?B?VW5lM0dDZXc0K3FCdFZERGZldm9lWklaZDgxbVBPOXlXWHJNclNPWkltTjFn?=
 =?utf-8?B?TDU2MVVKaTRPZ05tMTM0MGNmazhmQ2wxTjFFaC92b3hoMXdkbGYwck5CRmJH?=
 =?utf-8?B?ZzFhc2hBWFdjcUdhQlFrR2hlUWdzSTZvZXRROFJ6OHNkdEZLWDZvdFcvTUpp?=
 =?utf-8?B?STY5eURiaDhkTGxPZGZMd3pEODhVcVpoT1I2RjRXNHR0SXRFZDM4dmQ3WlZO?=
 =?utf-8?B?ZU90OGZ0U1NYYUdDNW1qeUJOWEtLNE4yYkJaQk1Eb2YzV0NFdnFIWnRhVk5z?=
 =?utf-8?B?VFU4aXFzcEppTkJDOUlDZGVLaTlybC9rT0V2NW9QKytncTM0bkdJWmphQVN1?=
 =?utf-8?B?TGpHYU1naC9EdGg0bU1BUEVUazdNbC9SZVFieitBbmNkbW5EK1RBU3hIa1Np?=
 =?utf-8?B?ZHBnOEZzc211Ny9aZzJtR210YWh1cmZHRmQ2UThOV1AwdlBOY29FSkRQZ1Vz?=
 =?utf-8?B?NTVPcXhGa0ZuSkZ1dWk3SzA2N2IrTTNXQmlVL1J3WGxVSnpveVY3S1JwUWo5?=
 =?utf-8?B?UXh4SGRPbmtwZ2NQQ1hGY2FsckFmbEhIaE1qRCsrOW1mTU1TT01CSnk5RXJT?=
 =?utf-8?B?WDNaL1FWMWpRZnpObjNwenlpbjFXbXhFaVFabVNnZFF5dnF1dUxYTCtSYUZE?=
 =?utf-8?B?dWpFSTJkdVZTdm5lYmk2UnBvQU9NamdwazVVOUdoSCtCbFpUbHJRMUZQelAx?=
 =?utf-8?Q?m7WdrLgvC6vyQk3l5jnkUKAKNemdJj4uGH4BbKC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762eff3a-5c5a-4378-d888-08d9671999af
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 16:09:50.1046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8YsaEEBdn/rdv/WB4zR9ICTovmCMm23vQFSvp0C93P3VqpgslULcVsflQjeoAOexh2R1tVrbHycIlMebZ9/4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6420

On 19.08.2021 14:02, Rahul Singh wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -767,6 +767,13 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      else
>          iommu_enable_device(pdev);
>  
> +#ifdef CONFIG_ARM
> +    ret = vpci_add_handlers(pdev);
> +    if ( ret ) {
> +        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);
> +        goto out;
> +    }
> +#endif
>      pci_enable_acs(pdev);

I'm afraid I can't see why this is to be Arm-specific. The present
placement of the existing call to vpci_add_handlers() looks to be
sub-optimal anyway - did you look into whether it could be moved
to a place (potentially right here) fitting everyone? If you did,
would mind justifying the Arm-specific code in a non-Arm-specific
file in at least a post-commit-message remark?

If it were to remain like this, please add a blank line after the #endif.

> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1 +1,2 @@
> -obj-y += vpci.o header.o msi.o msix.o
> +obj-y += vpci.o header.o
> +obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o

I continue to consider this a wrong connection - HAS_PCI_MSI expresses
(quoting text from patch 1 of this series) "code that implements MSI
functionality to support MSI within XEN", while here we're talking of
vPCI (i.e. guest support). I can accept that this is transiently the
best you can do, but then please add a comment to this effect (if
need be in multiple places), such that future readers or people
wanting to further adjust this understand why it is the way it is.

But perhaps you instead want to introduce a HAS_VPCI_MSI (or, less
desirable because of possible ambiguity, HAS_VMSI) Kconfig option?

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>       * FIXME: punching holes after the p2m has been set up might be racy for
>       * DomU usage, needs to be revisited.
>       */
> +#ifdef CONFIG_HAS_PCI_MSI
>      if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>          return;
> +#endif

(This would be another such place.)

> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -262,7 +262,10 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  
>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>  
> -#define has_vpci(d)    ({ (void)(d); false; })
> +/* For X86 VPCI is enabled and tested for PVH DOM0 only but
> + * for ARM we enable support VPCI for guest domain also.
> + */

Comment style (/* goes on its own line).

> +#define has_vpci(d) ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })

Personally I'd recommend to get away without using extensions whenever
possible, i.e. use

#define has_vpci(d) ((void)(d), IS_ENABLED(CONFIG_HAS_VPCI))

here.

> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -27,6 +27,14 @@ struct arch_pci_dev {
>      struct device dev;
>  };
>  
> +/* Arch-specific MSI data for vPCI. */
> +struct vpci_arch_msi {
> +};
> +
> +/* Arch-specific MSI-X entry data for vPCI. */
> +struct vpci_arch_msix_entry {
> +};

But isn't it that you don't support vPCI's MSI in the first place?
Perhaps the need for these would go away with CONFIG_HAS_VCPI_MSI?

Jan


