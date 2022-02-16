Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E087D4B843F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:29:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273842.469128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGck-0003Hv-Od; Wed, 16 Feb 2022 09:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273842.469128; Wed, 16 Feb 2022 09:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGck-0003BI-Ji; Wed, 16 Feb 2022 09:29:22 +0000
Received: by outflank-mailman (input) for mailman id 273842;
 Wed, 16 Feb 2022 09:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKGcj-00038P-1F
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:29:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb1a2968-8f0a-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 10:29:20 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-4XpOG8NeP-yAcCu576ItGQ-1; Wed, 16 Feb 2022 10:29:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5277.eurprd04.prod.outlook.com (2603:10a6:803:51::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 16 Feb
 2022 09:29:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 09:29:17 +0000
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
X-Inumbo-ID: eb1a2968-8f0a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645003759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6Wp2ZGTPRZ7LKzifeymUV1Swd8F9/C7R4S7V8z3kt4=;
	b=RJnbxqMtgS4Yfb/JmBcR6a1inyj8pPMAqss/BA8d0eID7Nczzc9FyF/JxcSs5osw4C+kB1
	M39TPLGdVsmDd1yTT8GYME7FnUrl9OadUQTW3k530qa4uG9F6NmzmKg8rqeHT98/pivr8l
	8ZAdvLIdkZYTkqDZxIzrQSIl3g7ZV1k=
X-MC-Unique: 4XpOG8NeP-yAcCu576ItGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMc/FFQSG4Qmg/DWf0pRCFDm8+dX6VbkyFZTl9BNIfGCFanhiAlbzX18pvvgptVCoDPImCUmekvvPE6XvMczSwfrgUWXQkaqPOOdfUjY8GZP/UHCXJhESRteqn9lN/6CEXUkNM1BZDhwp2hR7aInWNsj/hf3K03qXyX80sduoI7Ct0HN7LEjPkKS3dJRdVf+J7sTdq7hvVU1AEHcI5aATkBR8vuExXrGEafpt6lEtKHIRo1wF1s/LEZxbyYMXaPbcXAqkFBUTjLBzXr7ZVRDV7AyC7681RGTDiaXOAlAnNztAnGm2qnyErOB8pG85+Ar9U92pf5p5wW/A3uHHh5HHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6Wp2ZGTPRZ7LKzifeymUV1Swd8F9/C7R4S7V8z3kt4=;
 b=cMDK71B//VIkmAXizoZHt2Bb0fjAb5YnEsFQz5ls1Zqh/+vYGIOLm/hGKv0hl/HQt/KHO2gs5IQ1aXjnrVAvrfI4uGDiNsA5qSdEycV8VJX+CIq1c7NSTSLr189T0dq/rkZwmpqZuqMGhXdmTlIRXQFO1pFq4jm3CqfpXTxaSpD7KuT43P86HbufYKVNDXjZyYGsNiK4a/vlAU72aeu5PAqlEjW0VqAjPBD+V1AM976YGZ9Vo7OoWt1JxqZBQzzIwlseDLH+uS5V35nuoEw6VmyZM+UtXInuW0TbmhAdmPDEER5FL+a8gAOwx1mbM8wxJKV0n4IIenSiFp61ZiJSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
Date: Wed, 16 Feb 2022 10:29:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:206:1::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0292db69-79e1-467c-2606-08d9f12ecd81
X-MS-TrafficTypeDiagnostic: VI1PR04MB5277:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5277B65853E1237F8A808E8BB3359@VI1PR04MB5277.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9t0Niamq/12Q1ypLMARbSpfpxxmwOwy8jK+/B7BgZvGTMzKWZdlMXRdWO6wICNPHWfi+vn70YbHCTHkUJZWaPp4WMFo080/eV1bg+oHTtEe59hEEuP/nhlg/epkrjywzbp8w70SRYTJd/MjFQ/v9eqS6P9vpEgyc2hirxEnT0YgjcA9/DRK1AnZOKKJzsY+Apt9VMdoY+tSdNd2Akt+Iy4EiDPJr3kSxoOJulKLnMU7vDzmFFmQ/bMxN97sWVLaBsVJWdYpeWoEGlaXmIOYAXQBy7RrjVllqAPi7o6KYFIRhxOE9pvvmbeQavZB9z7Gqw/wUBzDOBFfVfzyAXcRyOych+5M5zeFZZWyzmekhLseLV5UN47e2AeVcmlzkTKd0mNiyufW/bsqI25khzVAelkls+gbUsrpL0zxUlK8Ndds3Yw9l9YOTMCni/+a4Eq4BSXC/HjDVVnjzklPY7Zmu2NIZDR3idgh/aPzPgp8CKu1LdxOpzbHJqRUrAIUKXYUk5xWKefs3YKIFXxG9h+fdfzEKGgF/520ynbvSEs2PWfmiX6/JDsCJXv+4HWoRR5ELEOgVjaIAncOGbURMxDYTNjKe5HEK3Qv6etxndSamA/I4ZVMxkYs7bJ6BhNaHQnjQeONujFhAkre8sfoPa1VEStVpOCBlOpAbRDMFqCsfZbq58KmiqwHIG75gPT6HxLhYobGc3mUS21gZed9CC+jjhtofTbqLInb2jS6I4B+l1jlokCf+1TwZsum2/xqZpaUH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(31686004)(2906002)(53546011)(38100700002)(36756003)(316002)(5660300002)(83380400001)(8936002)(4744005)(66556008)(54906003)(6666004)(110136005)(86362001)(508600001)(66476007)(26005)(66946007)(8676002)(2616005)(6486002)(31696002)(6512007)(186003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW9IdEJkWXZwUnhQQnY1aWZqQWFYQ0d3M1Q4cmM2UjB0WjduUHRseXBDT1lh?=
 =?utf-8?B?clE2YzQ5TDFXcC83bnpqKzlUUnBwUTh2anRhcUYveGlzU0dMM2xzbTRDOFZs?=
 =?utf-8?B?OVVTWnVxdlFEcEpSWVlLVng4WDhZRXJlL2RRUTk0MnZqdlVuVG5UN0hVMjIw?=
 =?utf-8?B?amExMDFaeGpMNG9BTzZtRGcrM2N5Z2hZQTE5U2NxQXFqMFpLN1lHdlg0NW9S?=
 =?utf-8?B?SGFmaW41Q0hCUE93RTJ4aEZaSDlTSWp1Z0J1bEZXRmd2Z1d2R2VyZjlzQkEr?=
 =?utf-8?B?R2lUdDM5Sk9VMXpVeUFaNXBJY2o0MTNxOG95U2IyQ245elhQVGpFTWNpSGRt?=
 =?utf-8?B?cVZvZi83bjY5MVBzc2Uya3JTUTh3QWtTSVRLMjhxS2ZwRWwxVk53Nm0wSG1T?=
 =?utf-8?B?c1RIMGNlblpLWHNONmM2bHhReHFpVFJZODRKV3lrc010aGNGMFV5WEd2amZL?=
 =?utf-8?B?VHpnYnpsQjNVdG9ubFZRK0dmTGhOWEFLRElLbEVMbXlEOVB3MDhyUTZPd25O?=
 =?utf-8?B?MFpZTWFSZXlVSHhsbWE0dHZmZmpnM1VtYXY2akFUSGIwSUJwejBHdWxGZjRB?=
 =?utf-8?B?eXdjZ1dOWk9obVNTRzNZQ2pUcndYNjJGZ2pid1ZrR3dENFVzRTVWTkRNNzhB?=
 =?utf-8?B?VVE5QjRwMUFjZUxjUG53NzQ2YW9hUWllUkI5cGpwSlU0NlR1RzF2Q0JLTjBr?=
 =?utf-8?B?LytPYVdsOXZnMm45YmdmV3VXR2ljeVZqa1ZwWDR3UlpnRGtuVTl4WmFsejVF?=
 =?utf-8?B?Um9PSVZDdXVOQzVLUHhhdjRWb2xvTXMzSE1CNWk4WEwwLzZ3NEozRElPcERJ?=
 =?utf-8?B?TXRZVDU4S1VXbjRJWSs4dktKRVVBRHFPQ2lqcUpyeDdNYkF6ZEZxVlh3MFNF?=
 =?utf-8?B?cUtSUGJPUFA2R3M2d0FFc0dzOTJPT2RnWFlLK3hxbVhOMUsyQ29VRU1RZ1hY?=
 =?utf-8?B?Rk93aFhGSmlSTE5WYml2UmR3ajMvNkJBajdjMW1OcVB0Z2pkMVNvcWd4L2cv?=
 =?utf-8?B?d3o0Z0xjNW1jZkZ4blQ0cTNwQ0RBOGpKRlZXUTlOMlNzbE4vZ3B1dkZWR20y?=
 =?utf-8?B?Skl3QkVxN29NckdGc1VpVnp2WUh5bVNhcGlIZHl1SGJ1akhDZjBwaVgvZXk1?=
 =?utf-8?B?NjIxQ1I1UzVSZVpGb3BtbGZuU1R4bk91SFM5bXUzcDh2SEs3YWJHQkZPMWtU?=
 =?utf-8?B?Z2FzbkRsL1JJeFRZd1I0Yll0VzRNWlNnZ0dWSHpqUXdUOXhza2wvWFRoWUd2?=
 =?utf-8?B?dVlKZGZ1aXhyL2JxY3lNN3hVVGFuUEtxaHpySkhOYmV5ZXRRQ2Q5UE1KRHpV?=
 =?utf-8?B?dS9DTXdzM0ZnWlUybVJQeWozaVJRbE1Ud05SZ25WV2JwTGNzZFU2TXBZQzEy?=
 =?utf-8?B?c2xWcDZZOWpvd1ZaK2MzZThRZ2lPVU1rMUlxZjVodCtqemxIakQvNDRqTkVm?=
 =?utf-8?B?dzA0QUpaMVJRSkdQSU9JQk9kT04ydEFXcU16OXZkbEdNWm1zVHhMR0MxTEYy?=
 =?utf-8?B?MXRuamo2Qk5TTnhONG0vZnR6UFRwNm40R25tNEd5bXNJNDZseU1SNFJVRXhI?=
 =?utf-8?B?dld0ZDRxUXd0c216QnNFc29jNXhlTFNMVG1XYW1MU1lmT1dPWDh3ckNZUWlj?=
 =?utf-8?B?aHlZRWNOZlN0MEdIbmN2VGVXM3l4SGlGZWxZT0Z3UCtVNXM2NUFQc24vUU1K?=
 =?utf-8?B?ZzdmQXZmYm5TOWlHeWhsMVRhSEZSZ3VMUURQOEtHSk5HbFBKWElNUTVEbjUy?=
 =?utf-8?B?R2dibWV1U2xQRzJoYWY0a1hxdHVvc1VTN1VhZG5CcG1YQ0dSOXZMYTZhM0JX?=
 =?utf-8?B?MHhHUHhWZ3UrNTVXWVpjRXhGQ1BaN05aSWF5dDdnZU1wemxMdWhjNVcvNEE2?=
 =?utf-8?B?bDdmbFFrTlpIRVV2UG0xb1JYSkVPOVBkcXg4a3Bzd2lkM00wbkpWWXBXL2RI?=
 =?utf-8?B?amFTaTN6bERKeTFWOExVdEJIM0NxR21NVC9LR0t6dDlvbEVpR1lXWFAyRWs0?=
 =?utf-8?B?NWJ0bGpQVG52QlI2YXBIK2Q5YlBJM1ova0txQkxZTE9GSWZkWjR2d3RPS0xr?=
 =?utf-8?B?OFVxYmJoWittZmk1SVd4bmRGVE1kTzNKQlM2eFdxeGdnMnlxcG5aK0lmNUd6?=
 =?utf-8?B?cVlJK0c4M3J0TkpsOHlySXJ2UGVXejFVbGJwMkVMaHdGbDlmNXpXeHl2eUFy?=
 =?utf-8?Q?8D/W9J8OlH2dvl2mAMAk5gE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0292db69-79e1-467c-2606-08d9f12ecd81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:29:16.9468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxvvpHZ7wDKCFUcY5JkLdk5nOnM5TeSs8zHDbhmDRLrpzrxz8Rh0YT6h6T9UhjAEp/rirrc6b7ELnzJMFaoPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5277

On 16.02.2022 08:20, Juergen Gross wrote:
> On 15.02.22 22:13, Julien Grall wrote:
>> As a side note, should we also update SUPPORT.md?
> 
> Good question.

I'm not sure here either - talking about individual hypercall sub-ops
seems overly small granularity to me for this kind of doc. Plus I
don't view deprecation and de-supporting as the same thing. The latter
would mean to render unsupported any old XenoLinux which may still be
in use, all of the sudden.

What would want gaining an entry in any event imo is CHANGELOG.md.

Jan


