Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10044428C40
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205860.361274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtgK-000658-Ff; Mon, 11 Oct 2021 11:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205860.361274; Mon, 11 Oct 2021 11:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtgK-00061p-C0; Mon, 11 Oct 2021 11:41:24 +0000
Received: by outflank-mailman (input) for mailman id 205860;
 Mon, 11 Oct 2021 11:41:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZtgJ-00061j-9w
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:41:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27d4519e-2a88-11ec-80d5-12813bfff9fa;
 Mon, 11 Oct 2021 11:41:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-fI-Mzn-kMCWtTKSI0L3KOA-1; Mon, 11 Oct 2021 13:41:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 11:41:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:41:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0047.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.16 via Frontend Transport; Mon, 11 Oct 2021 11:41:17 +0000
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
X-Inumbo-ID: 27d4519e-2a88-11ec-80d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633952481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrGr5wVVaHopp7AoYHAPc1PIODhQq+mvSjO27YeVW4w=;
	b=A7tQ1ZuKg2YmCvrkQQipg0BQkTlTzW7SblxFFkNCSyTBU+h+ePxhDstan6puniIeOnQlRq
	ky/UaoiZgJkEEHVfjgZ1JRuL9JwO2IYEg/LHpmT6qkoqo8CknznT2jueBcSyWZdcq+ekOl
	iIsZW5aQTVme+YsN3eqUl4JSf4dqpSk=
X-MC-Unique: fI-Mzn-kMCWtTKSI0L3KOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOCYe4s1aoq37XUOepo1tZKyiNuaDXCPgHRZGFA4ksRXF/3RCvw6a2RrrApzYguFVldroGGegLdC23ZiFc8EZ3QtBM+N4bB9TRS/dyzXBWPdsJRLGjVC31ALug+87dtei8Pbr6KGjuulLnJ9cAcRAmjAF+ab/tSakU4k7sd3MoH39qTbCp2Llk39cXhc6NRsUWMtyP/NP86eI8ZQcIwXFQGI+Qy5EEs5jmRUcn107NVen5vtLpc17mEYWCLpapTOz74kg1CpjsxgqWpnhTqbLs7T3Wc4XFpQjTjvH8wdoS8JuL5ZJWeMzsEomk93T5aWhr6bU9ingNS5xoWuKvrOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrGr5wVVaHopp7AoYHAPc1PIODhQq+mvSjO27YeVW4w=;
 b=oBZRSENxWDkjr6tJMQAUFOGx7bql7a/49qqZmnyqdW2cMlL5hxHwD7a/imnTQ3KP+WsL0vB0o/mmjD+ynwRudawRM3kYFBzJ7KX1YdwrqL8hN9odlerGYYoI/BiwC8Eo0Xg5RCet2gL8K9oFLDawbILZFQOHbCtZ7OcFZx0C81gXYhS99XEajOZ12nVX87ipg9sIguOB/nI9yvKjhc3KvC+Iwb2yxv/6kfhLnFkE7oEV9Zdoq7i/AmgIjaaGhmULQxrX/8oiRdJ3D3419ewOx3bhjvEICLANi4bh8aYS8bTsjafVHVyOCRcoaldeqvT0NXwg2ql0ikyCCMHmTp+Dvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 22/51] build: clean common temporary files from
 root makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-23-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd760c79-e761-3547-726a-4d7ee092d10f@suse.com>
Date: Mon, 11 Oct 2021 13:41:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-23-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1e252a9-2370-4437-8d90-08d98cac0a35
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4607DE5165669683ED69EFBCB3B59@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SmkJDjJpHDk0VQo33HHTtb9HeA9Vo6KzDrBZs/aHf7hujYLycBWBkttTRnbe/CydS/V8nI9CvQy9SY+DFv41j9wDmr9LZai1BN+Zonnti14StBqye24cKDXN5qUJm/qUmS4EteRGGAcFAZDQRMznbQjIiXAty2Gb2Xe00B9rWSjPJv0V/+oIcv35m1xCEUUQgzreag7OS9ib8c3nnzehvxMlVDwUOiHJOa8P/+8ENubn1w30rPGX1//pKNhaQh/QV4QjlshwUiGw69UgEm1aKqw9tY7WlXGn4FCaMwKp8ybx3uHEKWu81JrJSnez/9pnW0QWt4TS7jEvNu6pRMsYFoW9Ae9SkfshQS3MgLG2r2H3gvjEOq6RRMbZscikMKBAbFqgJ7bCN0LcWgewpT7LKbKLhV3cfgFuwUMK3M21dEr3Rf4v5DszAbR98ClY7Vq1gHW7B9T3GNHuqz8yetrW9ZN8ErqGOGbmhXYKBomqxK4Mx29lVvXiKC85fdTQAa+g5DrTHcAYbkgsbwfMhrJpYKUi4d9MCUq0IVDiE7ihXq2Y2O89EtzpzLSL+w4dR0TSSHp67+5xGZ7lArfWcts8i2jXETLNupZuCfyzE9Kze8dhVFg3O1tfmqu3kOzwPg9P1gh5bHYrQ0GKMcvfiyUPuHL05wspTqEtp+gkB4QgtJyd6oyQ5eQqLWOzl8HXWN+OlBaSK9Gr0G8TEg5RDOOgGCnzA4UyFyhmeQ3Bi2LZNVyQtgV80vUriCXR2EbACCKy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(26005)(508600001)(2906002)(8676002)(86362001)(36756003)(53546011)(5660300002)(31686004)(6486002)(4326008)(83380400001)(6916009)(54906003)(66946007)(16576012)(956004)(38100700002)(31696002)(2616005)(316002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHEvWDFXVTNvdzkvRjVpOE05eWFXYUdQU3oyWjZWWDQvV1JvdlBKZ0d4SG1a?=
 =?utf-8?B?QlNVK3Fqd3kyUnpoRzhQUW9DV2ZvRDdLcENaZzZIc1l4L1ZCZkY3MVgzakI1?=
 =?utf-8?B?UzVsWXBlemRsOEJFTDJKdmhENWdPTGZqYU02N0d0VmJNbHJTN2dUZ214MlFz?=
 =?utf-8?B?Y3FzUk1KRlFDM3ZVaGdoTU9hK2lrc1g3SDhKVU5RSGI1NzVpOGN1RTFCS1hB?=
 =?utf-8?B?Yk42SnJSMXJxbWRIdGg5bXczSm1UQzFCTnVLYUxpNGxwZHUrVnp6UEdRYjNX?=
 =?utf-8?B?K1R3VlcwNjFLVmFnT2ZvUzI0VFhTdlkxbGdFanMwNGsvdnBoRmdNMklsT0pi?=
 =?utf-8?B?aExGcDdhSFpzZ0FLNTlXdXBFVTNWVW40bkpreU9ZMnZUMXZKRjUvWjVhd0Y4?=
 =?utf-8?B?UlUyR1oyTENteXcvdlFYeDRibGRmTEhFall6OURyaG5OeUI4VHZ0OUhmc0Nq?=
 =?utf-8?B?bHpkVDVHZ2M3VUlJd2ZudEs5Q29zbXA4ekdsbUhSRzZBMDBzOHFwcThiZXNw?=
 =?utf-8?B?ZFJYV0hJTHFLYW9xOUJiT1JGYnplVTlVQUNMT2VyTXZvWldkK2FoWUpQMTJp?=
 =?utf-8?B?K3JiRFRaWkxrQXNYQU9ZOUZRQWZ6TnRRZlR2THpyZUM5dTIzbVJEVHJFa2t2?=
 =?utf-8?B?OEloOXRBblF5R2JtNlVac0hMdXFQYmZrckJ0TEZ6bFRTNG9hYTU0TDN1NXVn?=
 =?utf-8?B?L05uQ1RSUmVSS3JYVmZySzBYODF2TWh1cDlvTWs5ejVrcDNhaHdvWEFVek51?=
 =?utf-8?B?WXJTampCaUdZNm1lTllmRFJ6TFZYbXo2UGprdm9VWGx2UmI4UlBXbm5Ib015?=
 =?utf-8?B?OGd6ZnY1SzB5UnVMU3RxMGozQ0F4dnZyRnVpbEU0YW1ablhCS3lONW5jRWtB?=
 =?utf-8?B?c0k5dk03Rk8vUHhFRDhFOFZRMkI0QXZrb3IwT3RObDZ6aWkvdkZ5Undta0Ns?=
 =?utf-8?B?TVNJUUtvRElNTmdHd0xrSlBFYnkreHR1VTRHak1lNjZ6SzJIa1RQQ2FablhL?=
 =?utf-8?B?UzVOd0pSUm5ybXluT2NES3R5UURsUGJxSk44cFk1WDVlM3VGNUNscXVuRUlM?=
 =?utf-8?B?ZzZUUWtwTDRPRW8ybXpvRlBYNmQvcE9sOUU5SlFEY1VUUEpWNFVKUGxJMFRz?=
 =?utf-8?B?T3RldGNMMzcxU2M1Q2R6eG5oS0JjVDA4OUlaVVpOenhYWTlTbEx4STgwYzN0?=
 =?utf-8?B?SHV4T2toWjRkN2VBWmtZS1JmOGVlNi8rRTl1YnZySUx4dHd4RHllVGZBenh5?=
 =?utf-8?B?ZXZLNnhZc2JwVkVOQXJiV0RnWDdTaXRSY0dMSHZiV1cxNlFESEdDa2c2Mm4x?=
 =?utf-8?B?RXkwZmQ2cVZiYkxzbitzVHppcU90T1VPbU9xRGxKTGRXc2xkVER2NW5Mem9w?=
 =?utf-8?B?SVlhb1dLSDF2U2pYb1dlck83VUxBOWZhbWRpbGJnS0JDL0oyQjdGUzY3cEha?=
 =?utf-8?B?NU85RGFzcFQxYkxwZThQeElrMnI5ODZESTBIN2dHeTd6WmF4OEdKMEZLZWhP?=
 =?utf-8?B?WllXRlh2K2ZXcTV4K0lTbGdLVFY1a3lzeUNSVXBUdEdYNDBxdGRmWFVXbE9C?=
 =?utf-8?B?YkMyNVVzdlg3cmg0Z3RaUkdnM2hGZzFEUE16djJpTjA2UGV4WEdVVHU1MXhq?=
 =?utf-8?B?c3lRSnRKR1BOVHhHakpBVG91WlpYNG00R3MwMjBPcnEweFVnbDgrTjJtRy94?=
 =?utf-8?B?U1ZJNEZqV2htSjJOQ0JrZmU3bnJFbklMZW9CV0RVaW5HRHdGOXhGNGI2YlR1?=
 =?utf-8?Q?5kvPDRPizm6fl8CDozjZRcO70HmHApFzVkNZqiu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e252a9-2370-4437-8d90-08d98cac0a35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:41:18.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: li5xQK8cXFRxNQFlFrlNAhbBE0A1Tb4BcRmhJino00Q2uFeGPJc33sBwZ94SFD7i6/SA5Ix+6UlJT9E8sXEWZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 24.08.2021 12:50, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Trying to synthesize a description:

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -382,6 +382,7 @@ _clean:
>  	$(MAKE) $(clean) test
>  	$(MAKE) $(kconfig) clean
>  	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \

This was effectively redundant with ...

> +		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
>  		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
>  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
>  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
> index 027c200c0efc..b6df9e861e6e 100644
> --- a/xen/scripts/Makefile.clean
> +++ b/xen/scripts/Makefile.clean
> @@ -14,10 +14,8 @@ include Makefile
>  subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
>                $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
>  
> -DEPS_RM = $(DEPS) $(DEPS_INCLUDE)

... this and its use below.

>  .PHONY: clean
>  clean:: $(subdir-all)
> -	rm -f *.o .*.o.tmp *~ core $(DEPS_RM)

With the command gone, I think the :: should also be converted (back) to
just : then. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Assuming the patch is independent of the earlier still uncommitted ones
(please confirm), I'd be happy to make the adjustment while committing
- as long as you agree, of course.

Jan


