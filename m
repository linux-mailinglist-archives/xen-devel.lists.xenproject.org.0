Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CD55B7EF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 08:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356223.584313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iJ4-0004ri-Q1; Mon, 27 Jun 2022 06:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356223.584313; Mon, 27 Jun 2022 06:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iJ4-0004oW-Mv; Mon, 27 Jun 2022 06:33:10 +0000
Received: by outflank-mailman (input) for mailman id 356223;
 Mon, 27 Jun 2022 06:33:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5iJ2-0004oQ-Vg
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 06:33:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01bb8d54-f5e3-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 08:33:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7488.eurprd04.prod.outlook.com (2603:10a6:800:1b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21; Mon, 27 Jun
 2022 06:33:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 06:33:05 +0000
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
X-Inumbo-ID: 01bb8d54-f5e3-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3tgBz1inbnn/76dkjYMwZjwtmst7faan2l56WDfe2b3rxKaJ57K46tI6JpxkBT/lzLD3kgb06QHj+9SDA0QQyHy2lEKJ4HB4EPF47V4IkjHlmOdCvKlBebIRCgktgIUTuuVrXodYDpLsvBf4IIn4+y1R72szL80DW7DKSwIqTNosiKnwp82MMWxy1cq2WP5gz7+JxhGNIeTLLgO26XgfdBjwxfjhIzUejlmR+3PZB778ud0xPMqgJavYtRQakPbmiviTSF2ffL589MVcDULyIWEGUFYoRU30qP2+gDI5N4+xCd1pacTFm2cn3e0ZuQ+asgV8h5+7VI50wNv2/0VxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IElnXK9yk4XopBOwXyX7Ws22fw+Sa0TUazo8zYsenRQ=;
 b=VYiTHeoq+GCIIIwGomjnH2fPf9J/DggYI5NlzpPgHD3vRf5vqdQsT/jC5w7vZe2VPwWPWdQ2FuDSvgJFJRan3/d6GFhbh+h8oyTDu9tUbTCEmF/ZlByuGfiksGKBsAqGkE4H6xDxqm3/z9L0LhWFApc0pX5Z5W8JFC06g97tnagjPEPk2SRatRLy3ZWqFz3goshAdpxDSHUdFet0kJS9w58rhE7yKwaVHHnTrVdWazH6cygYlAftfzY9Mn9KfUeYGmPJC/XPM7L2yYwu/j8d+031+zsao+vLqob20vyfGBNed9pqYUNBV1P3Sk/73Jfwug6yDnNOOHWU4/sDax1zsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IElnXK9yk4XopBOwXyX7Ws22fw+Sa0TUazo8zYsenRQ=;
 b=vrUsRCkxFfJY8vxXvIgPporj1KKPoWc2YcUtfRWkgahWQwZSgkey/6jZhGhicSPsDTSFfh045ZI27kSAMEO6Tdf0QsRSL9qtJ5Fn01l/UY6XnaZdufFJTBo4BVyZ/IwkyA+AIKtqDghdtx7acxnMOKHwazeJ0GEyPBMJMrGBc+9ge442C7lGG+5kASrtqGr6pvNRez2erbuKY1KR08qW+i6euW0P7QexTiwSjxbJ/T0tfXSV/aKiqigIi5Ek4u0NipFO9bRzuViPjMHIZv4Vi7rM1DsqOT+jOA/OgpCHlqSvTuQpTkjJp9ClTpR5T7CI/LoxdR4eFvsjjMNTJa8Ipg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64ff8cc6-6c15-7255-e908-36d7bbbd6348@suse.com>
Date: Mon, 27 Jun 2022 08:33:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] x86/P2M: allow 2M superpage use for shadowed guests
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
 <7a80d08b-edd7-43c8-a7ce-42eb85d6f3be@suse.com>
 <8D91423A-67A6-40B3-A3D7-44711DC41A7E@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8D91423A-67A6-40B3-A3D7-44711DC41A7E@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be68bed-4462-449d-d4d0-08da5806e488
X-MS-TrafficTypeDiagnostic: VE1PR04MB7488:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2M909DLVdDTgxKlFqlcnkOO8zCt+tGXHjaGeNFKbxCTTJuPsVW39/79QBDQdde3oMhIK5oqYZ945YQ8QjiNYQ6Q5nNFisHcYEbJPP/Mp3jmxSS4hddOQdsXXCfaGQdnO7W0BKE/YQBaM4hGl8KVYWW98rv1OxFL3NaZhC+U1WxLyxoNM3rXxHnEFDIKFIVfGdXHDlse4eABTi9hQMFkKzEbQLutxCcdQGVykO0C6ybbHyY1asU7DwIOcIzu2LFZe53mEJC2/nQHtByvogx+9Qn0Bk0sBMfNj4IEz67v9o85QV5FEBAKFkxOl9GcgfdWlJUvVvrOo0kCQ8L4B9O8jw3G8uOwXXwRd2oRcBnJEVxzzlT86jhE6ObOALt27UMD2n6JD6RFAJGcorF6zLv5e3FptRVWOYJdjIlMFtpXgF3zYA8AVWFRxihCttGyjWvSvhBccY0ICPU+OcvPGiydLMgumEdIUzFzd+Fzc/4Z2y2Skp40n+1+2LDABXMQeBPHwptwULnplccO09bBjVnOLmMAM48ef+g9hblXagw8CUbCc76JSpEWIbWhcCdkbeRlcA/l5SkrcD3tbyXPHyTuflixIYeHMfeVHb2/kG8LUYbGK8oB1j0T8iAJ7xsuUdCa3Qw4+q2cpVXr5hvVgNv59tbTG1vPh2ixGUV6im4SFvgMG8ZAdeEMCgY71qLr4cCRM7ZPv9NuYvXnQnSJr2tECBy2S0XTuT5DKuPuDapPvaDM+bcu42G5JAuCSj4cNopJN/RhEMY9v1bySL+mnpVQZEuo1SxxCrDOAilwFzf1H2LlVohMryuXix1Al7pIJ7+ndtnVuDLdB/Rp7kyCLq5+uhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39850400004)(376002)(136003)(346002)(366004)(38100700002)(478600001)(53546011)(31686004)(8936002)(5660300002)(66476007)(66556008)(316002)(6506007)(186003)(41300700001)(54906003)(66946007)(31696002)(6512007)(86362001)(8676002)(4326008)(6486002)(2906002)(26005)(36756003)(2616005)(6916009)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGRqVC9DZ2RPbEt6Mm5kcXl5SDVwZnptMDVGaEdqQWVxZWNFZ1Baa3BKU3BY?=
 =?utf-8?B?Vk92Q1RNL3RQSVNGOXJYaXdneGJ1bFg3aXB0M1VoVjVhUFdvUWFzVW5LMjBU?=
 =?utf-8?B?L0tVWVA4L0VlL0pkU1hYNkM2Nm9oUXdnVGhjTzJGTnM1d2Joc1puN3dMVlUr?=
 =?utf-8?B?VEhzSTNpbXpscXJaQ0ROWEhhM1N4WWEzUFN3dGtScW5nTUQzMlBXT2N3Ti8z?=
 =?utf-8?B?ekFYOEQ5Z0JnRjZ2U1ljNXdCejRGK0N2cDRCbi9wSWZ6TndjcENKWGd3TGY3?=
 =?utf-8?B?czVFcWc0UzVYdWhmYVI1Q1JGWEVTOTBKRFB4bGR1V2p5TlNYT2FoTFc5SEkr?=
 =?utf-8?B?QTA2Rk9MSEVSNXRaUVJ0T1ZEZGdpL0dxTEw4QlRybiszcWhPQXg3ZzJTNFJZ?=
 =?utf-8?B?MVU5Zm5ZMVBIb0ZpZFlxcFdGcXhuL2JCZ3BJSXdCNVF1L2lFb1hUV0FqZ3Bx?=
 =?utf-8?B?UjYyeE5lY0V2ZS9HTnpUUDJYOXNsTlJEcHA1NlZKOXkxc2RXR3ZUa2FJWHhQ?=
 =?utf-8?B?b0I2VjZvbk9ONXlkc21kbytPbXNackZZZGVab241UElYckpFOHJwYjE5MzBO?=
 =?utf-8?B?Q1VOazRFaUc0Vi9taVF3N1JkTUtWemlxcUNWQWJTdGFaeFVsM2RZZmMvUjhw?=
 =?utf-8?B?RXNaTUZ0djF5OXcrNXZVMHlDcmR5c3FIUVp0NWk5dnYrVnZZOEF4clFPbGxY?=
 =?utf-8?B?alNlTmRKc2RjVlU1eGVsb2cza1A4TktmTkRHaGZ5VlFsUlFnb2FrL2pBZ1I1?=
 =?utf-8?B?VTlaQ2J1bmU2ZEo2c2xoUml2eEhGS01uK2llRzVHc0wrdHFtMDRUQm5XZEFZ?=
 =?utf-8?B?MGNubkNYZDZBOEVFbHdrRWVIMzY0bVdCQkM1RWJMSjJyWWdWTjJIcDgzSXRJ?=
 =?utf-8?B?Skc5dFZtZjVUOEIyUitXT1dBMlZ4Rnp3MENodFlxOU43SlJWRFVKSWJ6WGQz?=
 =?utf-8?B?VGxmYkJVcGdkRVZxQkpobCs1WDRXdXVHM1pnWlNDbVNpaityTW0yVDJKaVNM?=
 =?utf-8?B?S3VOaGVrRytWcGtDRlNvQXRDMUd0Y3FOdDlRcUNOZmU2TVp6dmRHMlNGOXN6?=
 =?utf-8?B?Q0RNMFZFVHRVVElMUlltMVdhWUNYZko0OWFybTBlcXVndWNFYzZDOEJtNWd3?=
 =?utf-8?B?dER3eXZNbFVWTW50M0Jsb2twTDdlOGNjRG9lMG9VdHFBMWhhNHVyUmUyRXlW?=
 =?utf-8?B?UW1oNWdJVDRXY09kNVdJQnF4ZGhpdXBWdTd5bitHdFpBZ3FPSlZ5bHd1ZXBX?=
 =?utf-8?B?QTlZczgza0NVN01ySVg0ZG1PaVZ0SmdyVzA4ZzVQcjUzcnBYbjdoS1VONk95?=
 =?utf-8?B?ZVNIQXdTS2t0SnZIWlBPY01QbDRHa1hycXNIS2I5d0tnNXVHaHE5NHhKcTVW?=
 =?utf-8?B?RWhYRDVJb0pyTk5vWGtxSmthV0RqYVJ4QU1FNzdCZG5yU21zcFlQVGtJdzhm?=
 =?utf-8?B?czBkVTRIWUl3ZmFkMG8yZU1waHZsbkR1aHRuMldYZERGbE1GdE1ncm1GdnFL?=
 =?utf-8?B?OTh0NHpncFViWEJsQ2dXekZNbXV5cjhwN0xpVlNleTMrNE02TG5mM09nUmZn?=
 =?utf-8?B?M25QOTd2eWlxakRGd0xBUTVvSFJrMTVsRHNWQlZLRnNJcXJ0MzlsNTU4QTZi?=
 =?utf-8?B?OFdqaTFTQzFlZCs0L1ZUZlNoeFdzeGwwVXBDZGtGQjNQMDQvaXRFdlM0VDBL?=
 =?utf-8?B?VnFxdWVuYUh5VmUzdHZuMEFPMkxvcUlGWkxnenZOYjV3TCszOEtXZGZPNXBT?=
 =?utf-8?B?THZuZ0Vvb0dXd3hBSkR2aVgweldCbUUvNzErR1c1MnVBMWdFK2JQU3N1TmZU?=
 =?utf-8?B?REV5Tit6akZNMmthS0Jjc3NEYnZXQ1JsWW9PeThlSUtoNEJHZytrSEd6djZQ?=
 =?utf-8?B?ZFNYRFBhLytXMVFJekd4TEFjdmtES2ozUHlxcmsvRmdxVTNaeGJsN3NVVjg5?=
 =?utf-8?B?a1NyRFUzc3pXQTN5TkpFOGF0T2EwUnM4ZjdEY3VmT1JSbW9tSG9IV1FPaWtl?=
 =?utf-8?B?Y2V1SUJwOVVtdjRYY2NUTTVZV0E3YUZZTjVPVTVSTlBnZktERWhNVXpET0VC?=
 =?utf-8?B?cnU1YzFxcjN5ODJ5Y3BvY0kwMTVYMjN0VWM2c1Z4OTZpdTZkOWlORW1VOFFI?=
 =?utf-8?Q?xThJakW3U23OU5GyT4s1GKg7p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be68bed-4462-449d-d4d0-08da5806e488
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 06:33:05.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIZnh54n5JXOeQ+jJVodYzyYcEH25CarICOTqSPoM+YmlKF1bG1XtOvLVBg20RG1eeOczLgMcf80CstOVbpRbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7488

On 24.06.2022 21:27, George Dunlap wrote:
> 
> 
>> On 9 Dec 2021, at 11:27, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> For guests in shadow mode the P2M table gets used only by software. The
>> only place where it matters whether superpages in the P2M can be dealt
>> with is sh_unshadow_for_p2m_change().
> 
> It’s easy to verify that this patch is doing what it claims to do; but whether it’s correct or not depends on the veracity of this claim here.  Rather than me having to duplicate whatever work you did to come to this conclusion, can you briefly explain why it’s true in a way that I can easily verify?

Would

"The table is never made accessible by hardware for address translation,
 and the only checks of _PAGE_PSE in P2M entries in shadow code are in
 this function (all others are against guest page table entries)."

look sufficient to you?

> e.g., all other accesses to the p2m in the shadow code are via get_gfn_[something](), which (because it’s in the p2m code) handles p2m superpages correctly?

Well, yes - I don't think I need to reason about generic P2M code being
super-page aware?

Jan

