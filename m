Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84C51D948
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323147.544733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmy9Q-0004ft-OJ; Fri, 06 May 2022 13:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323147.544733; Fri, 06 May 2022 13:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmy9Q-0004dN-Ku; Fri, 06 May 2022 13:37:44 +0000
Received: by outflank-mailman (input) for mailman id 323147;
 Fri, 06 May 2022 13:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmy9Q-0004d9-2o
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:37:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b59d72-cd41-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 15:37:43 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-jYY1Q5NYPMGGWEvEFhXd7Q-1; Fri, 06 May 2022 15:37:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4244.eurprd04.prod.outlook.com (2603:10a6:208:5d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 13:37:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 13:37:40 +0000
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
X-Inumbo-ID: b4b59d72-cd41-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651844262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHJuGSU0qKTwmTKHxZiO8PSa+xZzXEfsSIdvXPh7LlY=;
	b=HWc2Y1agR+oS+hNgd4Yv5L32zmBlWGc3PFxeePJWLO3Jjbq7JOaY8R+Zo93h0Q7UEPfmXP
	Z8XlMwj+JQdo16kWe1J+HSyhnvm9zPtEFm2uF+Ufd9R2LUYXnMEgEdrkOxYHNHzi4wnb66
	eW/zGTvwyi3lNjZcl5nym/ZDfwV6T9c=
X-MC-Unique: jYY1Q5NYPMGGWEvEFhXd7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+6qqa68+qJQZC6OmDmEL8l5TBngI/OjRHx4aHIDnaCxA3ZThp8xkRjGJBQYihSV6l215aFkIjiiwT4PWV1WLIeEVYiCip6ZshCV3u1YmbL6Fj8NLWn8CLfgx8INxh3LnGJTh+jru5cEJvkttVoUNMHkg6K21UFmFLyxvjmRweGn79MO4k1JE8KXdmGXC4i7XD2dN42Jmer6KO3ce09rT3AasKTmFxzeIbTRaon8Xh4rovXELs35n/o3sk7vVUpBWhb+viv6QTOMgY9qTv68Ig3jUHoUwq+tdoLrM5Z6ogbdmPUEfFRbQg1kFaspsF1kA/coMDD5Ko76XjxjLXqjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHJuGSU0qKTwmTKHxZiO8PSa+xZzXEfsSIdvXPh7LlY=;
 b=mlnnOWQ+CtNzh40GzewOjzGU/3+U8ReBVICvpoq0ZjfV396+vKfE+l5N/hYeavuERtFNuV18Ypamc6XkL0DR+89TV3xeUJ4Kxg5Zqldsvz4OcwMJx5qVABdgjq8oN9/EeB/sVzFOYyYvUOrXwZPuIuwKDxIJWG6OywNqhdIEcmOwuQUh+BZB2yqro84JgoZyjFIGlQXe4Dk9euw8myiiWOlI44+C2heg5MGq2EwoZHLLEvFf3AF8EL8tQn91iwTFuYqXpeDA/+GNEOL3C/rQd5kdGHxSsTeSZTvJ8Tj27UrbRWXd3Do++IctrdO8H8HWFuY6E50aI8lVHiKnq5EuqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15350fcc-86ad-d42a-27a9-c0cbab091559@suse.com>
Date: Fri, 6 May 2022 15:37:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
In-Reply-To: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0114.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b0e3288-8a0c-4f1a-f06f-08da2f65975b
X-MS-TrafficTypeDiagnostic: AM0PR04MB4244:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4244517834B899B5E0698FD4B3C59@AM0PR04MB4244.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iSykRxGxM4p1i9PDSSCk5qJfN95c9N6a6sbm1jzSW8euqNUFT/bqCoFIifrqNCiJBiw/hmAmaUMh1x+ISef2AehvBii5J3Red9bXnRXWPZTpu585afUn+y80Vi8ys1WxsHsgmMWuFDXfGWGoaRs4rEwuaCAqcfWk26xy3oOBFVsjG4CPxlV2kwsQcXW5fYP6npd5dkv4QN01tXUUUU1QZx+dAkZxRv8KotCO8bovL6uee4ab/k0IzdCgOmskxKHda9ogYh/AWQtFbCfo6/VPPYqoS1VxX/hGtkTq/Jbq4Lfzo+J5U3AdFCZBanhEQ/yNnu4uEfOYa9oB+MltK7zK9XorqbsPTpAEhzAxa5Hsno+eWtVtXvkNFojiMv7EID2wvSOPKBSUWatq/FR1Gvbe2V0mHhKgkzfcdmH09NMjpBK4nSlaAmF+po2IEYsjRIoyqK5Y9Jw0GbYcD7CD539tpSfsfWMJ6Dha6JnaSnAo4QSiI9wWqQ2XMMUazHglxSSBWJxlOuFAa/fGGjtsJuq5ZBxevSPm+wqjS+Gv6QWw4OsfA/YT/jg2Lh3Q8DZpcOQfwW8dnZO0LO7BvzTAutPZVmK85Y/muaqN5u2HZrrakrx+eOsO4lra2ObwaRxeVV/MVN7Rise1XeIzBwAJPRep/MQFVxx1uA1kzDxe0mqixq/KGblwir+xHymtnAPGp7/UOK+3eV7TPxjk3U1hlLjWJaG8WrEwH+SY5TfWtxFVQl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(86362001)(38100700002)(2616005)(83380400001)(31696002)(54906003)(26005)(66476007)(8676002)(4326008)(6916009)(36756003)(66946007)(66556008)(5660300002)(8936002)(6506007)(508600001)(31686004)(4744005)(186003)(2906002)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NVaHB2TGQ1c1FTRlFjaGtESC9rQTYzS1JPeFIyc2c4THRCckRCNDJpakYz?=
 =?utf-8?B?UCtmaTBtTFZlUkRpTklOUEJqSHFsNCtyaHJFanZOYWo3eW1CUlJNZlVoTGNx?=
 =?utf-8?B?Snl6UVpCbUszZUdDSW02L0pBeXFBcXpsVjBZOXQ0TXlITnlncVFPTVJoTU40?=
 =?utf-8?B?SGlRam0weFYwV29kT09SNjFNNlZGM2dYT3pJV090c0FhZDkzV3pLZlhQbDlj?=
 =?utf-8?B?TDRlaHlsKzRWTEZVWTI0bmExWVE4Tlp5OHZXdXBoTnlFQkpLc0lzOS9CcmFr?=
 =?utf-8?B?STZMNGl0blZiMllSeGc4Qzd3TW50dDdnMFZiek91RWI2czBoZU1OMlJnRWpU?=
 =?utf-8?B?YkRQelFpYUlxdlZFRVpUK1pZeTBQWklZcVJIU2g2eGo4dm1CQ0pBcUFiWGRk?=
 =?utf-8?B?NGVOVytXb3g4bTc5S2dCTkxWZGpJRUFkaVd0dnIrRTNjRk5MOWtJYUllekJq?=
 =?utf-8?B?d2h0LzNIaXlIZDBDNEQ0OUJtUGpFcTE1b3puS05ZQ2hDNVFJbWFVazdLVm9Y?=
 =?utf-8?B?d3RFMnNyQWFwUG5DSE9VcHNncDJDcFdCcFBpS0hxZzMrN25QSVpUdXJ3dXNa?=
 =?utf-8?B?SW1rOThKanI2TFVFbmcvaGUxSWY4QmJTcHd5Tld3N1lOdlJLcTh0QmY5M2px?=
 =?utf-8?B?TTdxV0JHS2NvVnQ4ZW9nOHBtam9CRk1IQndMZ21tRlR3NVpXbXhjQUV1UmJJ?=
 =?utf-8?B?TjNacVhHOVFlcldjNkRoenZNM2lZZ0xiUyt6TGxEUEFMNC8reE1kWHIyZUJl?=
 =?utf-8?B?dUUyUXpFdFZpbUhqaFFVazRtZjZ4UElXdmMwbW1nTXh5eVVaL3FBYm1xN01C?=
 =?utf-8?B?YWtmdnlRY2pEZXc5Q0pZbGNvek1uaGZPdDRleW9ralc4S1l4a0E5R0lkcG9T?=
 =?utf-8?B?SEZ1cVJRcUZQZGRGWTRsV0RrNTFjSDN2aXdxSWUxcjJ1R1pQQTAvdi9PcGVx?=
 =?utf-8?B?MXVlOHNtTmhvdjZwakZ5dVJ6d2J1bU5SSkRTZEc2SEs0eFZ6ZDhmRGxlNDMz?=
 =?utf-8?B?alFGek1UeXdBMWdGYmNyejl6YSsxZ3hOOUk3MnhxWkRTM3VqN0JjZ0VmcnlE?=
 =?utf-8?B?ditLdXNRTkVuVVNoRlRHL3FpeGFyUnIvY01UUEhTQkxCSVBMdGZqRHNveC90?=
 =?utf-8?B?Z3FVQnF6UytTMWNsMGJMMnF4QyszVnVzRzNZaWI4NkJDUlhYL002RGJadzZm?=
 =?utf-8?B?K2l1OTNFZFo3MFhCSXVXcWM5bGtBU2MwcWhuSlAwdXE2UFFVNnZlMFlOVGhN?=
 =?utf-8?B?Yi9RcTBDdmIxZ1lJRTVxR0VTU3U5djZGRUpEeENSZjloUWY4VVRkc0JPT0Jy?=
 =?utf-8?B?S0NpR1Nxb3JrenhQdVJqSmdPMUlQUGRTeHhVcmpKZFhhS2ZjajU2eHY3d3ZQ?=
 =?utf-8?B?RFRKbWVhTCtQeHNLNFg1VkJiay81aVBZajAxR0lIVGlkZm5qSnpETHFpNVor?=
 =?utf-8?B?VUlhcU9rRHQ5Tm9yTWpmRWNSM3hhM2cvRW4rVzdzd0VvZlVzdnBqRnczQjVR?=
 =?utf-8?B?YWRxV1VWS3prMFN2RWdpeG5EcWlqWG5Yb2ZLTDd5T2ZNNFVyVVpGa29NUWgv?=
 =?utf-8?B?bHhBenRyL1hvZXZDWEFxbERxQldUS3RHVHRzbmNPODRSUHFMcThXR3JPcVdS?=
 =?utf-8?B?MW9nWWNTemc4b3NtNlBGOXQrRXI1citBQk5DYjUzWmw1ZGNwdWxxZFY2QzVJ?=
 =?utf-8?B?ZllkcWJEZytEWWo0WitNYmZPdUN5aWZzWTNVN0RQTjNFTGtmMXdwakpuUlpV?=
 =?utf-8?B?S2VJUnpnZ3QxQ29kQkRuQkd2R1NVczhTeHZSS2tJRzBGeSt0cERscW8xUTBP?=
 =?utf-8?B?LzBKbzhoN2lHTGJVVXF6dmhnNURrVFBsTm1ZRHUwQUV4RDlXRXIrTGhaOWh1?=
 =?utf-8?B?VnYyMXVodER2OEtRRnA3b0JqMUl3dUlKc1JENGNZeWxHZTNxUlVBNXpmbENJ?=
 =?utf-8?B?YllZb1NCQ1dDMThjdjBqTXBDdHlmWWt3ZUhyUnMyVDJRRTNUbmV2UHpoN09G?=
 =?utf-8?B?WDlHL0JBNVdVNmlpalVCL096cElWQnhOTnJ3amtDT2VWWkozSnQ2RmlSeFVr?=
 =?utf-8?B?UVF6ZGlsOUVmSzQwRVJqeTBHYzFQSEZlNWdNVWlTeDA2dFVHSnJsY2hXWE5Q?=
 =?utf-8?B?Tms5M3hIWE9hdWhEOUE4NU9nWWFBZmQrTGJOVmVERkRnbWJuekh6OGxUb082?=
 =?utf-8?B?dmc0blVZUDU4TXYzMUthWlVsc01LelhCNURqY3pOenZJdXZkbWdUMU05bmxZ?=
 =?utf-8?B?R05qakdqcWRiTU10UWN1VWk3bmNTMVA0VnFYS2o1QmcyU0VCYUZSSDc1bTl1?=
 =?utf-8?B?SDZwVTdqVkFwYUdoZ3JOWVRZRXE1bXBRMUhSQWszWkpDcVZIRnUzUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0e3288-8a0c-4f1a-f06f-08da2f65975b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:37:40.5712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmqsKmzm+twmlrRl1bblFBFY1E+OPOzMQYCm9yX+aq4hX2DIEvvKUd1TkN57yXH7KQ8E5giyjVGsS+oscDB/Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4244

We cannot really avoid such and we're also not really at risk because of
them, as we control page table permissions ourselves rather than relying
on a loader of some sort.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -397,6 +397,8 @@ endif
 
 AFLAGS += -D__ASSEMBLY__
 
+LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
+
 CFLAGS += $(CFLAGS-y)
 # allow extra CFLAGS externally via EXTRA_CFLAGS_XEN_CORE
 CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)


