Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485D83F45A5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 09:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170193.310866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI48g-0008TH-IS; Mon, 23 Aug 2021 07:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170193.310866; Mon, 23 Aug 2021 07:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI48g-0008QK-ER; Mon, 23 Aug 2021 07:12:58 +0000
Received: by outflank-mailman (input) for mailman id 170193;
 Mon, 23 Aug 2021 07:12:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mI48f-0008QE-1l
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 07:12:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89986fbe-03e1-11ec-a864-12813bfff9fa;
 Mon, 23 Aug 2021 07:12:56 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-KkW5To4XOVeW56LYqAwyqQ-1; Mon, 23 Aug 2021 09:12:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 07:12:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 07:12:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0223.eurprd02.prod.outlook.com (2603:10a6:20b:28f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 07:12:52 +0000
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
X-Inumbo-ID: 89986fbe-03e1-11ec-a864-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629702775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yu+aqojlU2uDBpz0VWJq++QkoONsKI9eDFOxdYeOFzM=;
	b=H+PbTwehk/t7uMoSOPrOoOIr//iheyCjbcQVAKJhq+5DlwYzpOAc+qL4TgGHbkL8jXJhs/
	4+hp9KruACxZtwnhMWlCHOONvd47dF58jd6fnmmCfy2fLbSA14oWGTNtUeoLYXnvbIRHzi
	VwKkkNq+F+0RV3ENzsp811pqXC/JXos=
X-MC-Unique: KkW5To4XOVeW56LYqAwyqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4qTfxTz7CHU191WlVTo7Div4mz9c4ZuONTGiid/7OnkRCKw1+DDg2lbIQo+FaLJMotIniS5rjSVdfX9VGsxm8YY6MUWnfbznsQPAeAGHVkktFAsb+qdBJN5vJ+U3Q4au/0Pz5iDPOGno4TTsK8vS0hl0Rb+AgMzUs4DsMaYd3/7NhSvWOrAPc4CYOXlNE9poMbjW1wiHSRaq8gOUs+Gmsmc/usEKQz1KQ0oGzVHy3xqTNuh33z7EFhoBG9+HjIMOoo+VfkwVOwXlWlhVcBBsav1/F4w7xmrlAUcN6+dV4ZGQCyot4XJlhdnfVmZtB8eFHIHGuJC4yMfUXrcIzgEPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu+aqojlU2uDBpz0VWJq++QkoONsKI9eDFOxdYeOFzM=;
 b=eB6mvZ0o5vNjM9qTXqewQxaXGnx3EkKSELQxXxovhuV8BkhV6WqlZY6Y9/EqpT2r/rKnS8aTH7VHlu945qDu7F0tDqyA+pCPW6nbzlbYnnSxBh06W7KXqIYJMB+sM6esp8s7vsqN6L+8zeQU6P6AN8m1Ot1OTsP7Ok3MrZ0tamytfsjdIruzNVznuCRRSQx2fJccEHraXGVR7Em5fGLZO57g35ST+c8OSrKRJ1rxt5bolxR5rnefU/IsmWeGV5jTbWRvuRgcSWRiuGUBzwsGXJjWZk5ihxCYPihyahgHXwD1RQ3oaTmSU4mHBDKAdykvHQ2iBewVIb60u5gHp7p3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Xen C-state Issues
To: Elliott Mitchell <ehem+xen@m5p.com>
References: <YSEo9Box2AFnmdLZ@mattapan.m5p.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dea9cf97-9332-b1c9-2cff-d87564832529@suse.com>
Date: Mon, 23 Aug 2021 09:12:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YSEo9Box2AFnmdLZ@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0223.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb43f555-f24a-4360-8abe-08d966056c04
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB736053A63DD4220517B8725AB3C49@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pWCplJE3dDnvRsjE/WB+1qoUGb83vxKcJyFflFg6RZX91koEcQ0IYZzB/8bB0W9sSlmS1VhbiZ/97RLVC3pRWHuRaI+5bQuy3dkO0+9OKa/wEx/qVY69OoA5e6vigJgoh/Lc2/rEyBd1veEvz9jTrz0uS1dbDldWX7nrsJZpL0R0Xk3A0rWN8TAmJGW+z0l8RLWg1qbPCZ60ZAsxdU60xVwISRquXd0lkyMdLxUaqHJPOZf1bYK4vU3E+f9Ea0G92ef5hsClxoj/HZNEcfUqoynkTTVa7NeW0c/xBgtZd2htPGZE3840YnPzOjtX3UhEUgdeVaaybRmj9qHEuf7fEM/R0TuK+2PcnPLXwmyTYdV8fxISmelOSYjuRRF6JRgIe4RIiFBRAHpsshWZAl/Xi96ONgrMGAWCOiRnvrqrBngHCZhf7ocE0Ct0KP+6q3HX6cMWDSLB9LM7Srkr4jHBJI0pUV9DowcYBEMIdRnWodj4pwifoEz31rPt3Qnvv8km93ikmdD57NHvLWdiUvUTQR5KSSA5oBgZTCiZSxrMHRI9zFLUnnGPvkj55teOw8+WHJ8ZVaWAFIbEosY67CEr7Hsm4bPBvfDbBhyA5K0CyEeCKE24skE5oVQi9NDo7UAp6KIVICUgNqdBvxMuD2cEtf8ASX2ld7jQ9e6pUze+7A9ILmZQd9CwRUJL0/QFaSqPe4R3P0r4VjxI2UofYv3xeIbypnqKNET4isTqHjTtamE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(136003)(39850400004)(376002)(8936002)(956004)(53546011)(2616005)(16576012)(186003)(38100700002)(26005)(36756003)(8676002)(6486002)(5660300002)(86362001)(31696002)(66556008)(66946007)(316002)(66476007)(4326008)(31686004)(478600001)(3480700007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEw4cTJBbnJmN3Qwc2RYRWJReTExNEdaZTFTdGlyRHhudHZoRVpZZ21rQnNw?=
 =?utf-8?B?UW42eEllSkhYOEh4V3VXSkkwZ3lyQm1mYkpvWlgxUE9aRTNuaVpGSWRxT3BB?=
 =?utf-8?B?V0tac0FKeTRMdlFUSlIyZW1UMWY2Q1QzN01TblZHeXRQNTNGRVpVYXRTb1Vs?=
 =?utf-8?B?cjBZMzJkeWhVQXh4cE1UYjdLbHNIUG9oaTc0eXk2cU00UXlHRmtoZGd3NEhh?=
 =?utf-8?B?bFliVFI3T2tGRTd6QkFhR2lTVkJSZ0svNlk4ZHFKbGt6M2wzcFVLS0s1K0dt?=
 =?utf-8?B?a0dXY0VDVUlWdE1PYWQ5R2EvNmRWL255S0VwMWdZZlZoMTdJYlVCTEZXTFRZ?=
 =?utf-8?B?RDNZVWNwVTRYQmErZnNBc2IyMGlTNWUvMzZJeTZJV25DanFySTdneHdyTWQv?=
 =?utf-8?B?TzBueGJUMmVKbXVJZEdwVHE5K1QzUEppTitDZ1FRaWdHV3ZIa2xrcktONW12?=
 =?utf-8?B?eTVQMS95RlNqeVA5QUx1ZUFEY0RlMVlRdnAzR0lmVWl5ckV0UUtwbTN6eCtP?=
 =?utf-8?B?N0tlcTFtYXhhZTkwcUd0UWpXdG94WFNTdGp5VXBYVnpTQkFyczlUYlNINndl?=
 =?utf-8?B?K1M2Mm92eEp2RlNDZmYvbThwV2E5eHFxVGNlL0xTSE9NR3B5emdlZWE1MUlJ?=
 =?utf-8?B?RHRRdlhlNDhCZ050M2dEVG9KR1dCVlZTdXhzY3JUMzhVVGdoZEpwSkN5RDcx?=
 =?utf-8?B?dndqbjAwVjgzUXNIQXFUa1ZGUGEyQUtjVGNVbzJpbThKY25YcW9Wc1JhLzlu?=
 =?utf-8?B?K3FPTGgxLzkvRGgwblg4TnJ4aHdpRzI2Um5Pcmxjd014NHhrRXFKMW9kL2hZ?=
 =?utf-8?B?aDRoblFLWEwvU21pcDdYUHJSZUJNNmVkMmxvV1MrSnBXUWplUnpJWjhvUFNP?=
 =?utf-8?B?QnRtVyt0R29SMERueDF2K0EyNm1TZHhoVEJDTkgxT0VVa0hLcTc1bEZEa1hB?=
 =?utf-8?B?MXNkREU1cXlpTmdKSHpnOW5xbEhDK1Y5M25DeUgySENMSUoxelg2bzNiZlI2?=
 =?utf-8?B?WXpJUUNOWDROMmFyZFBlSk5VMVNTQ3pIMkRldFNDUUVrV3kyYVRwWkxBTUNv?=
 =?utf-8?B?cWJyeiszQjVIUWF4MGhCNEhQSUN2MWg2QUFPYldnKzJrc2VJb2I0UTBmSGtl?=
 =?utf-8?B?UDQ0cXdXUmlWaWJibFJYV0taRXd4Rm1oZHVTdDg2TU1QVzJBbS9QYXpPdFJE?=
 =?utf-8?B?RHNHSEh3NE85T29RU2xHV0Z0ZnJMeERLblh2S3FhcGcvU2JYT0JZVDBzQk5D?=
 =?utf-8?B?VU5GUG84TW9rWldPZ1A0TG5Sem4xTElsdEVFWkdNN1IrZ1QrYlRETi9XMTdH?=
 =?utf-8?B?V2hTNFpKTmh2d3dOQmdBaGRSY0NKekF0ZWpjTUFPdHF1dGhPVEE4clNxNDFF?=
 =?utf-8?B?RkdpbVFpcWZxZ3lHK0E3YjJ0Z0pSTXgrQkplT2srRlp4M0VDQWJ5QUw5Y0ov?=
 =?utf-8?B?ZnQ3RkxRYUdBMUtRMkJSYW00WlVkOCthSFlPOUhjcjRTS0szeUtFLzd2eEZI?=
 =?utf-8?B?Z3hRcDRxdFBabzViL3MyaGw3SGZxUGVoTm5JSHFUQlJ0Y0IxN1lKeUNxeXU3?=
 =?utf-8?B?R1dRT25mVkpjb2VZVWk5N21MWlVUS1Rjd2pWNm0rcnpMdXFYTlRON0I4VGdZ?=
 =?utf-8?B?ZlFuR2d6QmxWb0pnVko3YlNqWnJjLzkvYnBFUUFRdzAwMHpBWjRvOEZjdldt?=
 =?utf-8?B?UWpVOE1kTXdJVFFMaUdzQ2pzNXp6Wk5taU5NVHBVMDRzcnRXNktFRHgxZzRw?=
 =?utf-8?Q?fAMO0PN7TanRoxrt0V+sjhjD4iZx/T8fcaeOD1m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb43f555-f24a-4360-8abe-08d966056c04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 07:12:52.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmB0K1kN/LB+DskCSauh7d511k4p8IBD3LmXzedi5MLqaEA7ufYX0bNITuqeNHfDEd2OxHkfp8rZxVS8YvnSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 21.08.2021 18:25, Elliott Mitchell wrote:
> ACPI C-state support might not see too much use, but it does see some.
> 
> With Xen 4.11 and Linux kernel 4.19, I found higher C-states only got
> enabled for physical cores for which Domain 0 had a corresponding vCPU.
> On a machine where Domain 0 has 5 vCPUs, but 8 reported cores, the
> additional C-states would only be enabled on cores 0-4.
> 
> This can be worked around by giving Domain 0 vCPUs equal to cores, but
> then offlining the extra vCPUs.  I'm guessing this is a bug with the
> Linux 4.19 xen_acpi_processor module.
> 
> 
> 
> Appears Xen 4.14 doesn't work at all with Linux kernel 4.19's ACPI
> C-state support.  This combination is unable to enable higher C-states
> on any core.  Since Xen 4.14 and Linux 4.19 are *both* *presently*
> supported it seems patch(es) are needed somewhere for this combination.

Hmm, having had observed the same quite some time ago, I thought I had
dealt with these problems. Albeit surely not in Xen 4.11 or Linux 4.19.
Any chance you could check up-to-date versions of both Xen and Linux
(together)?

Jan


