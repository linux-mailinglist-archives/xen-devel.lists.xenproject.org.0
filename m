Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8084AC589
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267247.460970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6sj-0003CV-9I; Mon, 07 Feb 2022 16:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267247.460970; Mon, 07 Feb 2022 16:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6sj-0003AE-62; Mon, 07 Feb 2022 16:28:49 +0000
Received: by outflank-mailman (input) for mailman id 267247;
 Mon, 07 Feb 2022 16:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH6sh-0003A8-5f
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:28:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0528e1de-8833-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 17:28:45 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-Yk7yNIw6MSm50xEL0sQNig-1; Mon, 07 Feb 2022 17:28:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB9329.eurprd04.prod.outlook.com (2603:10a6:10:36f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 16:28:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:28:42 +0000
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
X-Inumbo-ID: 0528e1de-8833-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644251325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+yJ9eyaSl/nJiqAGwb9GJNT4J1X1vX9QpP4jwt+04c=;
	b=bUuIpLPuJhOMrZ6Kyt8xGXf1MPW7hiazXZObVhON6Oc2HX13YWPqqSvQ2WPiX/gcKWvHis
	Ii85y6qxPWQRcgyHrHL5HL+mgNhRbEYeeIhcQrf+yawipM26sL75FLmIeDPvt4OqsZ8hgQ
	qPh/pcWQMmKb4FFjNjPmEuJO6Zh75As=
X-MC-Unique: Yk7yNIw6MSm50xEL0sQNig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdH0kreFYSbBYHWAuON5ld70/9r4B3FpEUVfQU6xkfhJ3gN8+mA6uPKwnGdjCDmuH5AFub/h0SVDgARXDFCED7JGOpznKbsRNxHvOQgcxke5ZFtblFDQkG5S8W7lf7Pn/gjnB0UhAnjChSmyr2bdj/3toQcwDjMJ0a9Nm/ZneRwg7O4zWcQTJuGOVhqFZkUa+EcRu+AWSGkVRmpR0p9+icMH9VnvlC985gNv2iVCEC18/zF/ZXgKupwvDSeZbmfTGPYoqFwEmrOi8o0ddN8JBCKCuWzEvTS85BzZjOe/TNuRtHSg1MzjY1NTxBeZHrWUUeNW6NXEUo/rKynifFOv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+yJ9eyaSl/nJiqAGwb9GJNT4J1X1vX9QpP4jwt+04c=;
 b=d2H97uchH0BZWm/Vw2J+o4/KIGddEYJ3h6V68WhhKeLrM9xij4aFfb8sWChKq6vA/S0uMBI1Ojk2TOfXThCuv8NsCxCPoeHqdbiNKXPz99iCg07rOltI6MIvG/CzVsT1ejUrLrs0om4JdXjNoNfYBynyMs3PgOoEwcnhZIoIYRQ87SH6Q08/7G4s7UvNu5TROL4L9vf6b/+jvSoE1xjKHBq1H/CiRwdw9DnYLBn8UfMHAAyCIEctqUpBtgg8pWcSLHwpqdxzDkvrx8jn1amhXJ9zObEABewq77kQJzJEhkFAAKTgCkQvZ24C9DMZK3bqtRIan9FulecbM2fw5IIo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
Date: Mon, 7 Feb 2022 17:28:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204063459.680961-6-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fe6bdfc-555d-4e2d-f839-08d9ea56e797
X-MS-TrafficTypeDiagnostic: DB9PR04MB9329:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB9329A4C9CAC84E2FAD7E952FB32C9@DB9PR04MB9329.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q9GXvfyJmAkgrz8AppqdfYyOoiMdiQS2GxEjxBewi0jIYF1XjoA6SZOlyPR/efE7R9rhItl9e5o6/rGMQT2T+8IxzI9LnPDKWYXduGjaIqWhKUPNSh3D4SQhhdER+czvyKmE6kY+pJeUzhOF5FeaI+lVjcETl2UZX+mefrzV5uZXjcLH5EbxxbYIwmtM077Z4m+NxUo9MtC/YDFV7eWOppvmlt0w+hcRCfuYtyhiVH6WdyrQKjVVRS3m9U71SG9xZYhKHgbNrFxx+3ZbTGmbz7a33kOZsLPM3whUAv9xbkGZnzMOn8qUuIHDPvEzphRYtra6921fsUzrR0Y2SJrXGwO7169Hp8OdlqfPEv10AXOp2bJJ9VGTnONe7DD4vtMIdzjSSgtiRZC0PV4T02XB9dSITN/XzmcjRD/QxX26f2b0RhiMk8dlzci5erB4Op8CgzB4EzapIm7kRB8BrgnQOSTwEDGyz7K8nIMepU6Ap90npC+uZsRVYiTXinKHreZsIQX4VYvB4z+q+5p4FEUIo1cM7g3g8hsEj6G/7jNiIr3LtqUWQoDwqHpEqOVp+JBB4q0TGUU9MQLYwcrkxUXq3+AiXVnGSe94VhCGceHMZTbqLr1bwirRjVRCFEQrLjQmm6c9bTbD1+173BV1/5f47w0KsLPM6qfku39VIIAgEObC1MG0p1qzLJ6kIpoH1ORn/u9gZQ/V80ApqYJ1OTlXyqQh9dsMAAV3WVZlzboKvYA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(36756003)(508600001)(31696002)(86362001)(66476007)(66556008)(6512007)(6506007)(83380400001)(2616005)(4326008)(26005)(186003)(5660300002)(6916009)(316002)(66946007)(6486002)(8676002)(8936002)(38100700002)(7416002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTNoNGJ1VHFJUTdwZWNWRGNBN3ZPY2lRVnY0T0gyazdxNm9BYkRuZ0pVUGhI?=
 =?utf-8?B?TjROWDVMVmJKcXVIYVhYb3dIa2w1OCtPb3FCNVYwOFFGY25JV1ZLS0JySHhD?=
 =?utf-8?B?SzRqMk9HUjJPVC9odGkxYUFmVWFlTlgwaUpZb0ZhL0lENFZnL3BFOXcyMjkr?=
 =?utf-8?B?QjRROEtJVXBPQ0JXeW1YZmxkL2NBbmFPam53VTZpOWhKR2lmQkRDOW9reG9D?=
 =?utf-8?B?dGtMYXFDVDVUMHFNbFljbmpITVB0VG14N1JXNFhKTmUxaXBBMmtXMWttcHMv?=
 =?utf-8?B?LzNlbXg2RldocWZHVTdoWUhrMFc1NC90MlVadHFNZTl4eDEvNDZzbUZQejI4?=
 =?utf-8?B?WnN5VnZUN2dKU2Y4TkIzL3pqUmxwWjVzcnZsQkVZb3JLK01rb3c1dWljVGJU?=
 =?utf-8?B?OEhIaCt5TkQ1c1BjV2tVaW5CdjBicFdSK1JERmFzeGhaZHhOMnFKT29SWXdh?=
 =?utf-8?B?T1NzZEhZb1lZMkdMZXVNZERvOHVUZEVRL2pjbUVtMWlpSW4vVFVsQmdWRzR2?=
 =?utf-8?B?TE90c3pVTzQ3T1E2eHZ1aDdxUmsvWjBJcjZGbHExSHJkZFQ4enV5Nnc4N2RD?=
 =?utf-8?B?SWYzTExoOTR3WUw3S3FrY2Y3ckduNXIvdlhoQXdUcFJ6a2pqY1k3bm52OWsv?=
 =?utf-8?B?ajhzMFNzVHNUbW9LY0o4eklUbG00U29rQTZabkhrWllBQ0FHaDVRQ1Z6cEEx?=
 =?utf-8?B?UHEwOCtwUTVoL0lwVS9aUUdqSVBlMHY0OUhaWGZuc0VjU25GNmhFbWlBS0NV?=
 =?utf-8?B?MFBMRk4yK09VWnlobmJsQnhBaGtqQzg2Z1FVTnpEbEVWRTBBQ1ZxcUJsanJT?=
 =?utf-8?B?UVQzZnM1Z0I5WUx0c2xLcW5RWjhZbEV1KzhPSGRQb1FVb3NkdTBDWEtBaVJR?=
 =?utf-8?B?MmtRREZXZi9WRTJOUnozMC9Jb2FDRUVnV3NpRThUWVRhL0hWVnkrSzhEejV6?=
 =?utf-8?B?OU5JM0owTURiOHZmNW1FcCtLV253NTRWUkF2d1J2TVhUdENOckVsZnB0SXJL?=
 =?utf-8?B?VkNsUkExN3RTajFWc0ROOTRkTUNtNVg1QTR4TE85U3BXaHBHK0dXNEJWV1hC?=
 =?utf-8?B?RGluOHpqNHRDRDM1UHc3V21vQzZmd010cXp5VVhDTERHM0ZLbjl5TTdrUHAv?=
 =?utf-8?B?OWpucUQ1REJTZlRwd3JaSDVJWUxtMkZ5MSs1YVVBVGM1K0VCc3RJYWNTbytV?=
 =?utf-8?B?Mmgvb3g1Q1AzMnpZZ3NCNzRwNWxjRWswWTFaNEE4b0wvNDJTWGpyOElPbW1U?=
 =?utf-8?B?K3ZxOXFHVkhPRUpvTnpIOEY2bjFLK3UvYjM4L0FuVFlVSlhZaWVVajJtVG1a?=
 =?utf-8?B?YjJhVHhZQStCeGhvN1hIdDhURkpqWElHOC9YVVppR3VkdzZHazZ3a042UWJK?=
 =?utf-8?B?ZFdPNG1naXZhSDk3aGo3Z0krVE1oRVJnMjE4MnNWcjk4Q2lQNkVaRlJSeWlT?=
 =?utf-8?B?MURFM1BNWVRRak1DS3hCa1pCSTZocEczb3J5NTkxS2FJUVJrL1Z4ajZ4QTF0?=
 =?utf-8?B?eWFQejdtc0lRcmxjYnFqNXVSWG40QlhQbEFscVVXd3Jkdm1sbzNnMXBVMm84?=
 =?utf-8?B?Sm1vQ08wT1BnQ2tlTWFITVdXcXFqUUdNb2hVRVlPbDhLSW5vQUpoNDVrY2hR?=
 =?utf-8?B?N0ZFVUVHSWhBcXI2SThTNHNvK0hKTzJIMlpWKyt3UVMzNmNXSVl6OTdYUnZM?=
 =?utf-8?B?TXJRYWFCSFl2d1dqeDlGOTBoL0JWWXpHMkpVcHpIUERqZ2JTb21wVWh3VDhz?=
 =?utf-8?B?V3NaZjhjeTcvaGZnV2JPWVd4cWRhYTR3clA3RUdrR0IyS2trc0JUTHUvbzlU?=
 =?utf-8?B?eEJqaE4xQ2xpdU5yQVg4NS9JanJ1V1hYcEFsd0tUWVI3OGJFR0JyM3FwbVFI?=
 =?utf-8?B?QWNDUlVTaS8xMjRiTDc4dFFvbG1Ibm5KbkRzUFdieDY2MU4vSFlseXdxUmhL?=
 =?utf-8?B?clFQb3oyMmZWZVNhazdBY0g5MHhjN0hKekpMT0lXSSt0ZU9lUlZSOERtZVo3?=
 =?utf-8?B?ZnJ1Qjhldmd4V09kcDhDT3pxTXlEWXBoV3pXSmNlT05kK0cwQm1hTFdFTXk2?=
 =?utf-8?B?SDF3TnA5ejRsS2tYR2l6MFBvNExUQkFHZHZSeGY3N211MEdoakpMUE1ZSmZn?=
 =?utf-8?B?N2MwaHJiTm40ZFAwb1picHFWTEpmTUxlNGpnem8wcG5sUm8wMlpMSnFhSERC?=
 =?utf-8?Q?BNYwpkYtcHl8Pp16/mjTmw4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe6bdfc-555d-4e2d-f839-08d9ea56e797
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:28:42.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l92nvIkTeYvBaN1hrZWRiR5a3UyfN8WhXzPkkDS0ech7d/Ye75qnA7G1p05EwJX+ngnGVwznT4xDh4WLc1G5Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9329

On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> @@ -1507,6 +1511,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>                          pci_to_dev(pdev), flag);
>      }
>  
> +    rc = vpci_assign_device(d, pdev);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",

There's no attempt to undo anything in the case of getting back an
error. ISTR this being deemed okay on the basis that the tool stack
would then take whatever action, but whatever it is that is supposed
to deal with errors here wants spelling out in the description.
What's important is that no caller up the call tree may be left with
the impression that the device is still owned by the original
domain. With how you have it, the device is going to be owned by the
new domain, but not really usable.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -99,6 +99,33 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    if ( !has_vpci(d) )
> +        return 0;
> +
> +    rc = vpci_add_handlers(pdev);
> +    if ( rc )
> +        vpci_deassign_device(d, pdev);
> +
> +    return rc;
> +}
> +
> +/* Notify vPCI that device is de-assigned from guest. */
> +void vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
> +{
> +    if ( !has_vpci(d) )
> +        return;
> +
> +    vpci_remove_device(pdev);
> +}
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */

While for the latter function you look to need two parameters, do you
really need them also in the former one?

Symmetry considerations make me wonder though whether the de-assign
hook shouldn't be called earlier, when pdev->domain still has the
original owner. At which point the 2nd parameter could disappear there
as well.

Jan


