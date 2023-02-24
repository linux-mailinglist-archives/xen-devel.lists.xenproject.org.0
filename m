Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08846A173C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 08:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500772.772258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVSVF-0001pm-Fn; Fri, 24 Feb 2023 07:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500772.772258; Fri, 24 Feb 2023 07:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVSVF-0001n5-Cu; Fri, 24 Feb 2023 07:28:25 +0000
Received: by outflank-mailman (input) for mailman id 500772;
 Fri, 24 Feb 2023 07:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVSVD-0001mz-Vr
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 07:28:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d12a7b53-b414-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 08:28:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9360.eurprd04.prod.outlook.com (2603:10a6:20b:4da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Fri, 24 Feb
 2023 07:27:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 07:27:53 +0000
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
X-Inumbo-ID: d12a7b53-b414-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRqvgE9GO576L71p8+lVUFI4VV45M+lsQ9KlLg4CIIo1YSQvPUBfx/327iiBQsiIIPXVmVWN2oo0Jf/sen4OCyRzh/9dP/Dr+98xt3/aZevxcGfRMJmwGAZ+UX4z7r/9xhj2GbAI4Y24yEYxIicpR4djw/hbn7zhiXdrXX4rWSIU5M2U4ztjje/g2R7N/vC7A9BNUnqGoIMhjjEMfTxTlRTvcfVJ4zGce7mIua8DX50UHqqb0U9/D6OVLb2uu7DiXjxhGd8eCEa/2EIOCPzypwNJnB8Z83UmKFrZzrdmh4GwO5PCo74aqKg83F6naoG4uhdGlAEmSDvlGk29QneWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1W3ahLFMDrKh3m+7DCKKG2s+oRCZSvDa5+8j4EkP1k=;
 b=BX+fQhnMeBjF40zVRVzhVjhlM6YIUOrIr/mbwXTetu/F2X+EXksBmapB3Wd0oCfWeXemNgMfCJB1KEZ9YSyVDVtjK3CgvyQOfZ4MSoCdXDyFcv/OZ52Q3CLbfZn6f75QQfhdwXCLC2N+2G9ZHB0PguQPb3s0wxEyIEn2ZuhSoXqoCLl+hWSf0PvTlNaIybkrzoSEYCbu3i5rx4MZ62eP0hk1cTveKZp0+vKnxqLmRwZwBbWlOtiFPkILnhQipqxsm58WMzkR2VLQzcd+I3a9qwiZWqNmrFX6oUbKxJsG+bVfFvPlF6TDTEACoaG5WSWAxg66Rl7+pri4OsDQ3KqEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1W3ahLFMDrKh3m+7DCKKG2s+oRCZSvDa5+8j4EkP1k=;
 b=enVVfIxkLFmiY/4WzteBSILPOCafPhWxzKharSQJJmE0BT0uoIH2NWGIjU34ZGZFOFp4A7IIviWTdchZG3U0XL++oVJGb6JF/DRQqTzkAdDiXejVSqOeJ2ukrkGV+LCopc4/QJ5EVofDeyO2TfpwepVVQdaGcJpDxrUyFs//aHhdu0fWwNcpQ7uXJETpaJotHdH49wVGLgG9GOucq5MF20QFLHTaiJMx7GHrxtM6vcOmyX1L/pdG6H7qHwKt6TpdZ1usCtWji3ciVEOXBMb/0aT0MyK0iK0uA8+3AJnkavshE/HB0Y+JrGsTqXyhwDawSb1e8YW2VzT/5BmC8daW7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f35274a1-1669-345c-2436-0eddcba558af@suse.com>
Date: Fri, 24 Feb 2023 08:27:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen: Work around Clang -E vs -Wunicode bug
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223220358.2611252-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230223220358.2611252-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: 746d7c29-5167-4fdc-2d0c-08db1638a411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cvaF8RjOyebkUZiKS8hX9UPTDcrhXXMI2mi+eAEhCxXpxaGRoMQ67Dgik0z+bzrhYopJqOf7lcCxx2bSwL5LmVCYtMcFbU1KpPAuG4IuFd0KpdSdKessooBJvkYqdOSJz9o1kBee/0WA/WY1e2+YWx41RMJ9CBk5MMbOWsO/rADmXGmnbYtI4c/w56XI479i/8svlQrCG2vhOlG6XqWMy4RJC1RcfCklJr3dz0ORuGPSZ/WJQRQTqnjkY6UUUoKnnn9+W7LHcRjEPJPZoEOWys+Bm9x2nP7RCKbOMFFYZE2qIbv+dDneSGhde1glDTuC1uFdWxmIpvW41LklpAXtwAhleQzUVOGJpjYwf79V/Iy/+L9GjihUoiA27PH5x1kDDxCAaf7I0eDu/lFTg9nnG/0MJVcy1hRrlOK7KWK4EbilRqRBzcd4xGEkgKJey+jYEWap6QwhlMFQOEn3SPOUyHrtdSULIKJWYYWcWoJkzwgHNIAi7rYR9IXt2Ws84TVLpkNIwhNie5GdI8GrO9ObgRI4Hx0s1BMgn5ePk41xCn5dZyk+QCToJyG9sHXbMZUpO82NsiQ6VBPTUlnhrY6XCG321+5jJDFnv1FRP6hQZgn0w9bBPUrBaZODP0mRA1pmqBvg7ThrnVrrpLtnf6luH2ZXsn1HKQMakPoVZnEKHilwLSfpLKb4Msn8M154gGaKkiH6eiYs+RUY4tepoef7RHUS+LS65SVSHbLO6DnJZBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199018)(66946007)(31686004)(31696002)(36756003)(8936002)(5660300002)(2906002)(38100700002)(6916009)(86362001)(6486002)(478600001)(26005)(966005)(6506007)(2616005)(4326008)(66556008)(66476007)(186003)(6512007)(41300700001)(316002)(8676002)(53546011)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmVuWE1yQkNSM3Byakt4SHJHZ2UrWkRMcGs4Yi9McWFjb1l4VjhHbnNqSmZ2?=
 =?utf-8?B?eEhuQTZwM0Ftbk1vc3JZR0JwMTluOFI5RWxMSzFjSWFqQjl1Y0RyR1VvQklN?=
 =?utf-8?B?S3hHZS9JckFxN1BhTWxRWjNNaGxORFVvYkwzcGdGUVRaU012SkVzZUw4NUFs?=
 =?utf-8?B?K3lTQlZHdjV4ZkZZejZLMzVJc21IekhqTDIvcU5MLzZEZWhMVXlEeVZkaVZU?=
 =?utf-8?B?WVQ5MUxYMWtKU2gxVlBWenJyM0JJbWRVUjBkNVFCVVFSRFZZZjZlSnZKYkZP?=
 =?utf-8?B?K01HVEN5WHMvNXNudFp1L3lEWXc0dlZ3Mk5jR1dvaTNsMVJHU3J1bHpGSStD?=
 =?utf-8?B?RGUrUGtCU0RoemtWZ1lhNkdVZXdhWnlzbi94eW1NRUt6SXozRlVFZlNsb21x?=
 =?utf-8?B?bHYxOUR2azNsemkwMkhMWlZXQVFYQkkyZXd0ekdhQ3lUVUloZDFFbnBqMk5D?=
 =?utf-8?B?MC9TSVRRRlZ2eXlMeFpUOXE2OVIySE5lbzRjSjhOUXpiOW5FSmp6a05QWEVl?=
 =?utf-8?B?ZWlvVUlJTGUrNFN1QXg0RG9PZkpnaDZnSyt5cENKTC90ZVlRMS9ja2F2WTht?=
 =?utf-8?B?bW83eUlWcVBvQnROOUZweGpBYngrSkV2K3VqTmlQZGZBRzk1eHlZYlRIQ3Vj?=
 =?utf-8?B?VHhGc0RIVUg5cUtOYkcrY1ZybzRta200aFdrSThyQ05XenJLV0hIaVhSVlln?=
 =?utf-8?B?K2hXMWVhQXR3YVUwb3ZTQU54VUdmMGEzN2ZWdTVJc3NGSTFybHF6QXdUT3A4?=
 =?utf-8?B?OVFrS0JCb2t0bTlZSDQ1ZC84a1pva3ZlSjdSakxSeUdnVldOek85NEFhQ1NT?=
 =?utf-8?B?dkZENmYzUkJvK0orQ0x1U2hURkV2Z3NJOHlQMGJaS3l5Z3BoSDhXczNyT0lW?=
 =?utf-8?B?clVNSFk2bHB0emZJVXpnR04zWFFJS3kwYW9uUzhWdjF3cVQ4dTgwRVZmNFRy?=
 =?utf-8?B?VW9DOEJGTXJpMzBrVGdpV29WZ3huWHNzNjM1dk1JWWx1TVNMYVNPUERSQ0p6?=
 =?utf-8?B?YnJadXJKV3M5eXppSEpnQkVuRm1GWURqT09aR002dXZMK3JCY2kySjVaK0Zr?=
 =?utf-8?B?ZlRBalNFbjZRTEUray92SGJJQUlNdGFQc2cyRFBsQ1l3ck9CdU8rTUo0amc1?=
 =?utf-8?B?TnlJNmw1VUtRYWg4MEk5aDdOUll3blMvNUUwNUNtai9JU2FLM1RxbTlneURX?=
 =?utf-8?B?UjJWL0lvN2R0OWhndEl1czVrckRoS1JyTTlHWFA1eTY0aEFvVENTb1VRT1dL?=
 =?utf-8?B?cFdBYzhYc2xnUXJ2Vm5YeS9FdUF3SStaL1FSRGhOSllZajY2WWxkaXdjeG80?=
 =?utf-8?B?a0diWkNVaHBLVmMwak85SklFMjROcGZrUWYvK0RaZGtGdExhN0VTR0pmQUg2?=
 =?utf-8?B?WWJhTTJsWG5UMTBpc1M0UnVOOGt0VzNaamV1ZENHR01kVFR3MXNYRFh4QTB2?=
 =?utf-8?B?WlVwL2xQZC9PQzdYbDgxd3FhTm94eWJjYXoxdGpmbU1uUGU3U3FWWHNZUjZV?=
 =?utf-8?B?UjhPQ3cwWWppQ0JHMmlRaEFaRFNzVjhMNkpwcG1yZUMvdXo1d1QwZTA2c3ZV?=
 =?utf-8?B?dUdXendXU00zd2hnQUZBZnl2Q01QeXlmVkk0TjBhU0h0b3FvenI4aVNTVzJq?=
 =?utf-8?B?WkRqUlpNbkMvZ1V2UzZKMjFRVU83bGEzZU11eWZyVGZMUGh2TzdCdE9WM2Ey?=
 =?utf-8?B?ZTQ5SWF3aGE4SHVjNnQrNVhJRjFDMWorSjFWeUtTR3RnSDRmWXpNd0Rmd01X?=
 =?utf-8?B?cGVwRjc3elBUVTBxOEZYdDFPa1EyWEN3ZXkrM3N2NDRpUkJUTnBNWHNqY0Vr?=
 =?utf-8?B?V3pmaUlxcC93OGhURmRSeGE0dUw4TVdWcUkvZ1l4TCs1d0RzRGpHeHE4NTBM?=
 =?utf-8?B?UW9mRTBYc3R4NS83TTUyZkpVWlFXUXNWTmsrUUk5VnRZL0Qvb3RSSktpbHJJ?=
 =?utf-8?B?Mkc0SXFrdUZneUtGWngvemU0ZU9FNFBxZHhIN0E4OVZtUW5TYUxVSFFsYlZD?=
 =?utf-8?B?ZTdIdUUvbFh5K3hxalFWeTZjY1JaTTRpVWVFbHlTaVF5RkhBbWN4V1I5c3Fx?=
 =?utf-8?B?dzczNFk4VFlicjRxRXBuRkFxMnNURVlPSVVjS3haYnNzczZkakVJbW56NzVx?=
 =?utf-8?Q?FneLMZ8ZVL/poFZPRKM0tU9g9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746d7c29-5167-4fdc-2d0c-08db1638a411
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 07:27:53.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJkN97KPBIHZ9H67FaAXiozkjOWUhqo4bQ+tx2x+VS6AQcsiKupk99UTUzHWL4iJH6n464oCnuVF7j3ECQD9dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9360

On 23.02.2023 23:03, Andrew Cooper wrote:
> https://github.com/llvm/llvm-project/issues/60958
> 
> While trying to work around a different Clang-IAS bug, I stubled onto
> 
>   In file included from arch/x86/asm-macros.c:3:
>   ./arch/x86/include/asm/spec_ctrl_asm.h:144:19: error: \u used with
>   no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
>   .L\@_fill_rsb_loop\uniq:
>                     ^
> 
> It turns out that Clang -E is sensitive to the file extension of the source
> file it is processing.

I'm inclined to say there's no bug there in Clang. Gcc, while not affected
in this specific regard, also treats .c and .S differently in some perhaps
subtle ways.

> asm-macros should really have been .S from the outset, as it is ultimately
> generating assembly, not C.  Rename it, which causes Clang not to complain.
> 
> We need to introduce rules for generating a .i file from .S, and substituting
> c_flags for a_flags lets us drop the now-redundant -D__ASSEMBLY__.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



