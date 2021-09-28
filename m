Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632741AE6B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 14:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197963.351231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVBrp-0000fB-7J; Tue, 28 Sep 2021 12:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197963.351231; Tue, 28 Sep 2021 12:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVBrp-0000d4-3a; Tue, 28 Sep 2021 12:05:49 +0000
Received: by outflank-mailman (input) for mailman id 197963;
 Tue, 28 Sep 2021 12:05:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVBrn-0000cy-JF
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:05:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68d6b92c-2054-11ec-bc85-12813bfff9fa;
 Tue, 28 Sep 2021 12:05:45 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-2vWm0Cy2PyKCTiKHQzYvZg-1; Tue, 28 Sep 2021 14:05:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 12:05:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 12:05:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0260.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 12:05:40 +0000
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
X-Inumbo-ID: 68d6b92c-2054-11ec-bc85-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632830744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVk5ot41PxQFmAqjFPSjiuilqpeppXXrDTGViWAZDr0=;
	b=jl60jKpzGeCtWnFpFYG57YTktK70pUaK8HsJNjmb0oDbmSgysi0cIYjJ0XZO6hDLi08dwx
	qH2vYcakT29opLAvAdO8/7UMUx7OenkCM4UwCb4RaF59gZ1CKg15zJxuKMrzeP6d8dNXld
	YEAHyG4lH6qytNIikzyEepxd/iEwj98=
X-MC-Unique: 2vWm0Cy2PyKCTiKHQzYvZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZfD9QWI4BGkgo3z7EqK2IRrA+LMnL2hIHFnHd89N2ctpn0jwME4BCBjg0PCzo7gZ+YunAe8texl/LiS9xlQnC9IdtQGWKYFwLqvsZY/1z/JS8SRungzeTcUnu2U7ou/xRMZE1O2l+/CI190GWjSSlfn9FPxdqyrlnBscywPxCCKjZwq/yvebXun2puRo4aNlHJ1v0YYDRl4MCyMlBAp37MaQEILDIaapyE/Sj4jPnSiZbnMQXiHEGTtnlyE4iv6blWT0ysYS6j8ZLkx1tkNj+VddCN8FaIyqh7wAXbyFmbfJLaIpJ7ZNwOAC3QOoY3TJZmVuJrBdO8jRqrjzERxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OVk5ot41PxQFmAqjFPSjiuilqpeppXXrDTGViWAZDr0=;
 b=AXl/CrbKe/QAX35qtmVNb1pNPGNIxy4R6TaUwMKmZT72I8z4ObAR0fIm23ppFZdB3RgHfuMB/TQfcmdPS2nBMNfBA5MQOAfNIljL3s9Sq25P+jtQe/AV2DnElmt39uyBehcLZzCU1pCZStWeQZJ7caZruxSCmHbNK/Ot8eaDD/LzPavyTaHK4sCBuxWD4LWa/jrsx2z1Nn4Gqr+l84WoLsdEKo/fl3WmdVUS4S7PkHJ0wH2pp1IcFBu9x57pxPW0UtZvHHYMAnYBcC70rzcRbdVjfpx9zkqNrycf07/V2RStCHsANavY6xNztWKeuT1e53BMcpDnBvhOXL9N53YHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 01/11] xen: reserve flags for internal usage in
 xen_domctl_createdomain
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, Julien Grall <julien@xen.org>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-2-penny.zheng@arm.com>
 <7da75d7c-5640-305d-d742-d64b8c219949@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60d813f7-a756-172c-999d-44f81504e268@suse.com>
Date: Tue, 28 Sep 2021 14:05:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <7da75d7c-5640-305d-d742-d64b8c219949@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0260.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::32)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f305928e-7e1c-4d0f-2d05-08d982784ae1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23343AD63172BFBF1D3D2D8FB3A89@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwIgxrm0xc2WExv4tAAYq33BbafvzqGRpp+u6viI80ZvdsX2QGJL4JYlUcVNoRbaKqjLa9GwYhT05pvz8RbWFdOTea+ntys0lWBGNOmy4ZnaT2BnvwvQYpp+NPid3bWVTwzEBZSWRVFuMcFuGNHPkavRcq5NTom4fbGptJ5hI9fQ/xi26YfswYKGpyCvutZQdIXq5lc7PkGiCi3VNft/MNECS0SYpjhuHNYU4crAT19Iw3zlW0nUKjTH2MJPjnSbg+/7KxGjGun6YYravouVNIPEDWuJqn520SGQFFsT8DcyfcDczhDZqm8sSvlKlGZbMB9Kj2lXJI9fQS+k5i6HJr7gZ2ePMCL+GE/u7I6Gf7dP+uCzPhbSmi3YwKMDPMkIYODkqWorzYZBWVMg53iVrGM82u8vIb/gJ6OpovTyQY7kWPeoe407FtuUVDrlpXiFIu5XMVxK+13FCZ+90hEPFkZ2f7q4p9rouLiG7RojsCRaJUBc6hxC8nRI4W37cRhxsl9VxmCJKKThctUOhKvW22s31R1vMGbYlhx/QbAkltDdtps8QD9olUziuv+T85AaNb4dXmgyVfz2lXq7xMzQSpZLt/ww/f0bzrVyYP9PMoZax11dVCBpqgeAcIABWG0QE/+6U4fyKjoppncCSsS349inSHbE3IHU7rC+A/DIwNKtFQU5k5yV9BFYz36cWJWbenyN2Qjw8okokuLeIHgpANY/LegdDtmTZaRgvgDbI0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(53546011)(508600001)(86362001)(5660300002)(956004)(2906002)(2616005)(4744005)(31696002)(4326008)(6486002)(16576012)(38100700002)(26005)(8936002)(316002)(66476007)(31686004)(66556008)(186003)(66946007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDdzS0M1WmkyU255Q2JVOUNuaDZMdzRlOGlTRWd1Q0dCUStxVXVSYlR4d0wr?=
 =?utf-8?B?VVVDSU85TC81ZTExS3hnWXdvVEJKYmZMei95anJkcUpPR0QwZFN5V09DVGhH?=
 =?utf-8?B?Z3BoTmdXcnkxdGxFeExPK2xpaHpXNC96NmlDN0x0VkEzTVRPVVBXRk40ajQx?=
 =?utf-8?B?OGFhY0Y1WG9zVUw4RFpzYjdwVWs2dkdSa0U4NnFsMHVDaUV1TmpyeDIzVEx3?=
 =?utf-8?B?ZFRmd0FIcEdBU3J2cW5QSnVTWjA3ZWtZZ3FLRHg4U1ZnczUxL1FuREk2SUhS?=
 =?utf-8?B?QzUwQTN6a0dOTnEwRXlLNW1QdzNLeWxVUFV3d0RzTW5qb0VjUU1Cb2FqK00r?=
 =?utf-8?B?U3BDOCt3RW1oWHhuSmt6Q1ZxbFlHWWxSNDIyTXZMNWkwcU1ITDZsYWN1Rm9r?=
 =?utf-8?B?WnNxYWlmcDJrMHVmRlowS3FZc2lTOHY3VnlxbVh5ZUlpcTJQeVJEU0NRcXZ6?=
 =?utf-8?B?T3FodnA5cEgzMnk0cmJFT0xyWnJRcjlIakJ2VHR3S2VLemJQdGhXTUtxczZU?=
 =?utf-8?B?WVk3bjF6UlBvU2ZmcUx3R1MyMjJBQktGa0tXZDBSV3pmVjNkbEQ2VVY1dGox?=
 =?utf-8?B?OE9nc0VDdmNFSzh2RU43TFdhQ0tJaTJ6NWV6ZzZGNWJ5RWp5eVJURmFBOGRt?=
 =?utf-8?B?SHY4djJYVGowbVQ1VkNoZkZCOHlQYVFrZFRtbEEwbldJdVdEb044V1pNTktK?=
 =?utf-8?B?SVhCSEx6YXJtb3k3UUxKWlA2bXlObm1JY2pNRGxsS0JRZFdiaW4valp6UGtG?=
 =?utf-8?B?N2NzSVNERkVDL0JSNjBEWXM0UHYxVElISk9tancyWVQ3L0FsVFZmZVNGdVhw?=
 =?utf-8?B?dEdDRnBDWEJsYW9iSHB3d3hZcmkvcnVsUyt1SGJMYjhBQVltelRqNHhMTHZX?=
 =?utf-8?B?VUpXSXpFMnFENkdjZHJBck5BY3hGdCtZYnEvcjhGVlhWbzFHbmhiTVUzOFls?=
 =?utf-8?B?ZklkeXYwYzl2cDBGV1B5Nk1RYnNzc1NITlFmU2tjU3k2Ny9DSEx6M29nTTB0?=
 =?utf-8?B?QVI1dE9iM2svTytMY0hnTW9sOElqK2RSd0Y3QjF0RWxPNlJHT1FFdUJvUWFE?=
 =?utf-8?B?dUtzTC80SEFHbHlKVzRtbkRkN1cvYnh5U0ZCZkhxQmFTcTZrOVd6a2hOWU05?=
 =?utf-8?B?ejFxZWwxSDZuVVVjSGRQVW5LaXFWV0NLU29qTE55SHlac2VaSVdZMzlFSCs0?=
 =?utf-8?B?YVBSb1FYRGtuNDZaNkJIYUdtMjhaUTVrYndPdGFTRDBHa3Z3c3dMY0xFNWw0?=
 =?utf-8?B?MjdqS1BJTFplUi9ldmIzK1RGNkdrSjFKdWYwTTg5N1pETXJOMzZqWExLRk16?=
 =?utf-8?B?cHF5RERidUp1ZXBId1B0UUhRaGdNd0VRZ2VwbGlUaDIwbytYeW5hRVc4UG1C?=
 =?utf-8?B?MDFGdlZJdnJjWFh1RHJpTUFxczJ2Tm5CZ3BvL0tXMEtQQjdtSkR2YVRZTTh3?=
 =?utf-8?B?M2xVaEc4UC9sdSthWlJaS25vMHkwNEFOY3NwNU5WTStCNXB3NERRcEIrRnAz?=
 =?utf-8?B?ODI3aForRXZOOWpKQUx0OUdyejdoMU5MdHlWc1pJd2sxZ0JFWkRUTDJDRlJo?=
 =?utf-8?B?azVVRDhqZmF2Mm9PbldKZFFYdlcydENBUFRXS2ZNL1JLcDdoQzNRS2tZTitR?=
 =?utf-8?B?UWNudkgwaXo1Z1c4dDVvSlFTTklqSzFwM0dJZWs5YTZVS0FKM3p1ZlpiTGFR?=
 =?utf-8?B?TThKSmM1bzE4U3hOQURaQS84NnF5RklycTZ3UUNzQitiRW5hbCtsb1BMTUx0?=
 =?utf-8?Q?ntZyBure7mGITyM+dCbIs0Xh0OiWE64A2f+raDR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f305928e-7e1c-4d0f-2d05-08d982784ae1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 12:05:41.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snkNe2fw3KAJVHnNbmCqiMOALWh2PZVai/RJp7pBb5ZH1bd6SZUmyKo8Yn8J7YZ8PXQPolUk1m5ILUcimbAx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 23.09.2021 11:54, Julien Grall wrote:
> On 23/09/2021 08:11, Penny Zheng wrote:
>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>
>> We are passing an extra special boolean flag at domain creation to
>> specify whether we want to the domain to be privileged (i.e. dom0) or
>> not. Another flag will be introduced later in this series.
>>
>> Reserve bits 16-31 from the existing flags bitfield in struct
>> xen_domctl_createdomain for internal Xen usage.
> 
> I am a bit split with this approach. This feels a bit of a hack to 
> reserve bits for internal purpose in external headers. But at the same 
> time I can see how this is easier to deal with it over repurposing the 
> last argument of domain_create().

I actually have trouble seeing why that's easier. It is a common thing
to widen a bool to "unsigned int flags" when more than one control is
needed. Plus this makes things needlessly harder once (in the future)
the low 16 bits are exhausted in the public interface.

Jan


