Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F134A9AFB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265652.459074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzbc-0004RU-Ik; Fri, 04 Feb 2022 14:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265652.459074; Fri, 04 Feb 2022 14:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzbc-0004PB-Fk; Fri, 04 Feb 2022 14:30:32 +0000
Received: by outflank-mailman (input) for mailman id 265652;
 Fri, 04 Feb 2022 14:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFzba-0004P4-Qc
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:30:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0023f67f-85c7-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 15:30:29 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-qhuhbnovOBebuRkkjrmUJg-1; Fri, 04 Feb 2022 15:30:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8795.eurprd04.prod.outlook.com (2603:10a6:20b:40a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Fri, 4 Feb
 2022 14:30:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 14:30:25 +0000
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
X-Inumbo-ID: 0023f67f-85c7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643985028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2MPSfIlWYqNOO3lvdFtlIz3pwCH/v7OkqRhPjHv7Y8=;
	b=PJ8Qchf1MVwF1EyHSWYcCSGh5z+2SIW1BIQjXYvLouTRJtoiEGXpe3HBicYLtCgauIiKP0
	IF4x4ttOMYVJpIKkajBb08idLsZljL7EgTgGvas49OdGQGMZ41QdZegcBqgXvbMWNDXipz
	xhr4oUY311zWa/L1t8Y3msqx44k+ynQ=
X-MC-Unique: qhuhbnovOBebuRkkjrmUJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Myb2qmP25wl19U2ZSkbUtuw7+WFycIiDjYNspu8R7p7SMMc44LqHzERGeUKCWjr+8FJrT13FHZdMyXEOXM0Zawt7z2hkdsNCjTKeD+vTGwBh0FY/tHnkgrZMnYFGLLniGikbUji+S/7YoK+TtvFm5BD0y4zuJh72Vor697KTZrsfzhRcRnvrgeI7ZYWBvmXBKb9lwFkldyV7fVsc15Vl9d3cC4UretL2I18LuLaOXVd0hdJmyfS5q29VWRXolJcSHtSKUJV6Td7uaATT4ZALnH7cnRcJZ0VQmMEnDIQZoGzvlYp2z+RncUpQs89Sf3bEU2NcFDsR4nCLtKpeH3dQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2MPSfIlWYqNOO3lvdFtlIz3pwCH/v7OkqRhPjHv7Y8=;
 b=He5w4tm1nhOAJD/jdMINI8XoJqpRTOyTpbEPYR23wLwjktZN16KOpbTJWKIZaAmmDdFQhviiIM/vVpD7SEcmfpCnBWnKIRvFA78Pw7M1Byop7R6LdDupZV8FlAMH+wTzH/ntuLj6Y1fQCvtPl3hf+kCnT9Flk6oIr1vhZjD9MpsgzC5tTVt5lfWG7kRgEFUEqycdKCRi5loIvEFFCVh5OMnS764MDyhJajLqraqoFRScY1IBIISrwR9wDInTdA+bi4ItNwSZOArnuwjCSH1rrf0fVgeEXJ18bg39KbPZQUp5M9MszRYzgj9kHnhXOT2SGM80ybIPE9cV2AgD2kQung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
Date: Fri, 4 Feb 2022 15:30:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204063459.680961-11-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d35840c6-6bab-4202-f13f-08d9e7eae1df
X-MS-TrafficTypeDiagnostic: AM9PR04MB8795:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8795A2931E3F95E14FC8209BB3299@AM9PR04MB8795.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+zehtaGSRfYEwAfzkfqohed6jquI9RuRNVQmDYkbDkKP5q3TJtNLxSQtXQkQNweussWoENClHxbd4tCBjLUc5wGfvKiNJN+a6Zk0v3rnvOy+ly846RUjWq1DIyGmiB0EWIYA/jCdZ6P03XfqEOZVP2+reOAca7pirhsjkv8VYH/zZF7LNb7wesK59NywDHF5QH4W3nRImuy8HxLSWI0LU59XkpXssHLBDBDeMxGyDVQxCi/kW16Yk8ApHa04dsleZyW+eGoqFGY/WXe2/4hcHol/UE0VNwjz0lwYl9YLmd7pDf6jZEk0KtW3teXpL4xYjdeXVdgVMjNrJZZ9HBxfan1TCpmLor3wxauxn8Ip/KjD8Tn5uEvWgc7BiGpd/LSMSwZMjbXhHc08HbuZu0YglbvAKUiQUW3OQiWpWn9UCHuC64MwzD1BF2bZN0q3JxOWSLieObQNdW9ny6tbJcZ60cr083q4IDc0JtH75BpIdAkena1km+aP1jp5r/H4XcoBTAns+LGnDGmG9jUk0UHJDF3rqkRfFN9tLCrZf0atvbekJzGWlCnvL1N5dgTHKCwVIdslLkl6Upv1c/UAJ9xpeE+HLTCPoL3aiRPu8TdTuActIJp3SZJKDhjtWyRUfEyEt+6GjShIHd4cSgkuSGHonXSHhGltzm3PeBRbUjdJgGUOhLtOpHU8q7Lpf+0c3JLFeb4nyC8fAukyT4LwyYJj+b6egOGD2+3HSn1WnwceNoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2906002)(4744005)(508600001)(36756003)(31686004)(8936002)(8676002)(31696002)(86362001)(53546011)(6486002)(6506007)(6512007)(6666004)(4326008)(316002)(6916009)(66946007)(2616005)(26005)(186003)(66556008)(83380400001)(66476007)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REhyMWlYcng3c3Q4MnVlM21hZlI1d1FuWHRoNHdlTTdIR0trajN3UjhtdXBF?=
 =?utf-8?B?anZ2c0lrcEN5YXAzbDVaaWVoZ3BVb3o3K2RlYjQ4akljSHlxUFJvaS9qMXNY?=
 =?utf-8?B?Tzd0ZlczdzBvWk5KZStkcmtOOUFOd0EzWHAyOE5jbkxSVFlDVEpiQWVqRGx5?=
 =?utf-8?B?Qys1RFJUcStlOG53TUNjR1RyTUREcXdpMVFzeERESVc5amRRRDRobVJlYTlN?=
 =?utf-8?B?RVRPVERRVVZwRXdTOWhkY3FoZVA0RWdMV1V5dmQ1MHBobTdpby9DYUNEbVJt?=
 =?utf-8?B?bmZYMjNKSVhMOCtWWStPbWNkK3pqUjFyNTRxYkxOcVlSczcxZGRwSHZuOHhp?=
 =?utf-8?B?c1BmVTJSK0NtaDVQc0RZVUFPcHhLd3A3Y2NVNFA4OE85QU9SVktrenhUV3g1?=
 =?utf-8?B?bjVzTmFpdVorc3FEeE5vL3MvSkNHYjZ2QWxlZ2JhcnExOXRJRHZielh3eXUr?=
 =?utf-8?B?YXdQRkl2VVgzNUgwcjFqOWpLYUZQMUorTHgwTmRsZG9RR1NMaDBja2I5ajh4?=
 =?utf-8?B?SW5CcjJkT2M5ZTNQZUhNcThJOTU3S3BVeFJkMENHVkZadWt5M3JyWVRiOXJR?=
 =?utf-8?B?eXl6U2pyKytvNGRMZSszd05LOGtYU0FEMStiaTB5bE9FeHFwc043bndVWU1n?=
 =?utf-8?B?ZHJBOEhUTzZBbWFldXpHNU5Vb0Y0M2pSbks1VlRwcmpMOEFMZUo3QXNDZlNE?=
 =?utf-8?B?c2Vkdm5obUFwU3VBaGdwZllMUDVOUmYyclBUZTFJNGhYMjh6WFBYVDRkQmZh?=
 =?utf-8?B?d0xaR2FwTWVFRGRQS0pGRjcxQkwycGpiMjVzbzdqaEwvZUhTTjUwTmZkR1J4?=
 =?utf-8?B?VmdhbzBUV0srYUE5NnVqbDJWeHhRU3JURlF6TGVDUWhYOGdWcHlsRFQ2d1U3?=
 =?utf-8?B?emRrTHFPbm01TEtVY3VFRlhyT2hQRmowL2QwRmZRRFlhMDVFbWlRbW5jdThx?=
 =?utf-8?B?OVkzYzJFRU0vZGxYK0pZYW9zeldiSWJsS0UwUlZxRHN6RitxNGlZZDFKelM3?=
 =?utf-8?B?ek9jOXFqNjN4RGtzVjRwdjV5SFdhck8vZ1IxdVFQNEduTWRFdlVMNS84ZEYx?=
 =?utf-8?B?Rm94YVJJd0JNcU1Pc21kTHlyQXZwaWg5a1lqbHR5Zlh3d004ZHptRWQzVVZ5?=
 =?utf-8?B?RVJYQTZCKzFqWVRKVWlKdlVQOWJzelBIT0dMQUJOcWZJQm5vVHRBMXZDOG5m?=
 =?utf-8?B?cnRGKzZyZWhOZ3JFcW5VdXNXVytjamVuL2FiYjl0b0dhbGhLdU1FbmY2QXRU?=
 =?utf-8?B?NHdDMkwvUjdMVWRhU2p3OTljSGFtUU5aUmwzcDA2RTY4YTRSVmFhancrMXlR?=
 =?utf-8?B?V0YyNVRiM25ZaEY3OGlhaG5HQW1PM1h4VXZ5OHgvRDJwd1JJOWdOY2k3U2lx?=
 =?utf-8?B?dzFJRzZTdnFrTittMHo1SFozRFlrbTk3bTJheXRxNGV5WFQwQ0lJSVprM2o2?=
 =?utf-8?B?R0dEVy9hRWNGQmpiRGVRenF1eWFHT1NRcDJjcnRRd0xXTEpCWjNCUHlzZmR3?=
 =?utf-8?B?U3hKbDROSFVuSXR2THlLNUZYSFlFdXdZSTh4dm5xUWNRTythQ2Juc1BNbFNX?=
 =?utf-8?B?UDJDcU14d2MraW01c3ZuQkFBaGNldS9wS2pMSkNjb3VkbjIxb1hPVTJvT1NY?=
 =?utf-8?B?NHFKK1ZEN3ZuNXluWEcwNm9kN2F2VVkwMG4xSTYxY2dHRERTQkZUd2FMeHdI?=
 =?utf-8?B?QmsxOFJnM0FWRGcxK0R2TFFPWWk2T2UweEtpd3JKMzJ0VVJ6Rys2YnFpSWNQ?=
 =?utf-8?B?K1RoelNqdVplVzJET29aUVRhV1NTdm5SaGZhVk1aMTZsMmdXamtQbHdEQzR6?=
 =?utf-8?B?Q3d3MHVpaDlJcU05bmhOQldhdWZCeDgxamMzZjZUbElaR0ZzN0Nycm11K1BZ?=
 =?utf-8?B?bDMrc1pheHVtdlZNOGk5ODFUdjFGcFAxZTBHRURGOEQxeGdraUxiOWRCZWh1?=
 =?utf-8?B?eDF6UVA2YU85UGd3RDdRSHN3Y0VjYWFFSVNWbGtyRjU0VFUvMUVzYTJYWlJS?=
 =?utf-8?B?UmhYajBaOE9PNW9xWFg1RnhkM2hCek9FUmRRQ0svWFkyWHlZeDhWRWJPdi9Z?=
 =?utf-8?B?QjNjQ3Bpd05UM0YyTi9xb05GdUMvbTFkUkJvODBJYkk4WnpqRFlmMXVWQU1i?=
 =?utf-8?B?YzZ5eXRkT3ZzK3lWKzRsQjFxbFMzbXF6Q1E4K3V3eXVuSmUwRXlvR0YvQWQr?=
 =?utf-8?Q?Ha/jk43FyZkI/dNiN6OXuUM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35840c6-6bab-4202-f13f-08d9e7eae1df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:30:24.9111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6IYRYUXt7DcqKiz3WX/iKWbCVIZa8t/dlSzXhD4l3+aJHY/H0s6Kw/7dq0u7JjyNRH4WGnfExJapbq8Fgybdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8795

On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> Reset the command register when assigning a PCI device to a guest:
> according to the PCI spec the PCI_COMMAND register is typically all 0's
> after reset.

It's not entirely clear to me whether setting the hardware register to
zero is okay. What wants to be zero is the value the guest observes
initially.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -454,8 +454,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> -static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> -                            uint32_t cmd, void *data)
> +static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)

The command register is a 16-bit one, so parameter and return type should
either be plain unsigned int (preferred, see ./CODING_STYLE) or uint16_t
imo.

Jan


