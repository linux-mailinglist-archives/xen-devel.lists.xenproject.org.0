Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238545911AC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 15:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385702.621397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUvO-0002Wk-Be; Fri, 12 Aug 2022 13:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385702.621397; Fri, 12 Aug 2022 13:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUvO-0002Tu-8b; Fri, 12 Aug 2022 13:42:06 +0000
Received: by outflank-mailman (input) for mailman id 385702;
 Fri, 12 Aug 2022 13:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMUvN-0002To-FA
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 13:42:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150044.outbound.protection.outlook.com [40.107.15.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cb2dc1a-1a44-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 15:42:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 13:42:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 13:42:01 +0000
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
X-Inumbo-ID: 8cb2dc1a-1a44-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeTiEDlfpRweQHVyvcZTc6KQRQV9nRiCWfmR3eRGgdvKSnhjmVZp9WCx5Um8HhCffVgLtxI4/Ce3WlVjdyC+nJvXx5cPBG/tNQiWtTp15GX6dU2JrNN3qKVKEEHp0nsHewLMf6napqFl5peG8Mtw6frxU61cnwo3YHJsqFi0bIJYVvFmwX5hppBqAtw3+fJGWg8vbaxwM5MEJEUjdOxS5CYeJeftq+bPTmELHWfuIIOwH/iO6+GhiunDAu6yx7NcConLBfGtguQp9N1B2OEvBJQvAeojs7v4Vj1u7mFnnufM1mckMo3eMauPg/hyfqd2j2Nz2ZrpyHFPRUo/cPSM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXcOqjAooVpoBaeqAsiBRv6Sikk7grLEfmW7vimd4Pw=;
 b=BXb5OiUzn3jETWkstcBAlq8O/KI+kmpVKffRBH9HUau19zMy9RwBDh9BE73Y5pdn00uq6rm1kXyP1tQn0rPY8UIcus+2a47oNiJUxcWMm0KZwgMODQVFyR4nmH28THQoPcbJ7DLUmvx2pdHPl1gDdIkRA2u6avI0hnsuezFZpPkVohQdJ4ipJYF82rNzAquNHLBbvirVI+nBuJOM28NvWnGeW91FR4VnEzGAk7akJ0icXQYlz8Xqf75Mbgr13I9c5YeCqDXa6pgKx6MCVZFhbhyLhKwWVbGVy87dIW/d9GW/2vq5hMzi+L3XcfyR0vCs3mr+yUW2qATTFV+Tl4LWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXcOqjAooVpoBaeqAsiBRv6Sikk7grLEfmW7vimd4Pw=;
 b=g73pJsk30gTgpPU0D9L0IFdgM7DXDjJpdEv1JQ41rk6mTlf+cNtZvBj+OALg/5zBzR/ypcN63zen85tt7+cyAYa1o8TSU0dClNIBoWhS58KB/zNPnUmMQoveDDyCJqEyBKwd6KVb3L4CG6KVn9x+Gz188HNEx4VzNTWnPnvb02rjop+awPGhb7FM/NtsU5yzlGf/I6DlsZ3nJxQpeag0SIr/F+dORWJMIvDhryWZafqEBUOZk7SGUE83Cvx4hBlaX5iy8+717H+0e6z86USTdYl+KYeFMYvXj6eKoGoDwFVMXvoxdcJQkKv07tjCbyDRL39snUEKi30HpWmn8yCmcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eef465fd-31b2-9fda-246a-2c3710a739e4@suse.com>
Date: Fri, 12 Aug 2022 15:41:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH v4 03/32] tools/fuzz/x86_instruction_emulator: rework
 makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811164845.38083-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5bf68a3-7f7e-4f8d-513c-08da7c686f62
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L5dUqrVB14qeiVrwNgfevpuGpu84jxP3oRr14Ze+N2PzcdUCt0dGXapGxxdbIZDnAE9UzCjD1OmifFPFRxq/TBMJZBf2Gdyw/r30fgze4ZRTbUf1NIqtgWYVXVqOfzZVpVNmd6oiNprOPP17tHTiVKcq1L8LAkK36FN8N4omxqC/+fOj3f8XuS+P58wBcFZk892Xv2z/S/QnUxTOyE9TWLXocN6lN8RBHXYiEXax0FIeq1LlEPyoo6SRGMBXO+BYqYpdn6tkXnjSCz+VFksFAIbzN3g3Igh+NY0+EgSveUQh9MjbL2PFZpsCcPMsdEK6IbaF42NKCWrR402DyK0RmzHbUXS24v9jMOvHQXcqVYzxLYdPdyf9q44gy7NCWytAjNs6gPBBjOcBQUxE/+DfSmAbj3D49l3++EFjR1c+IBcxcwDRr9tY52RCsLELrgRJEEwQ2XLZvivaIPayb9QMkWgWYFeZmoCMnZJbXPll30GG7dPNHYQhWstBxZsPueEj2ivnwQ1iMMvjsQF2XdFDgXo1Vw9XXrPTiDFR1gmue88XaaAK+OvE4dypq/tZZdt+Vr4gHLr6PMFDaDQUZGexFsJy1eFQ0i7taWedy0c9SDNXzfBzkdDDqZqeCEHO92WrRZ/fQvYh51tFCoDGw14clCjv22HaY4JLYjCu9G8Hu8ArEcoGUTLa+N38RKLuhCxqRJFZyyDSiAL2WAP+TvhiYGGc6ewTobG60zMz/Bbil8wfdWNQu3jDSXwtspqYMW8RAwlP49Kap8uI4nqVCc+F0gdDwyyD7m0xC51GkIVfZQKGMuqp1KPgcx+LF1RNVkrk1D4i6B3xKIc2l3nwux7Klg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(366004)(39860400002)(396003)(6916009)(6486002)(41300700001)(478600001)(54906003)(4744005)(316002)(4326008)(2906002)(26005)(66556008)(8676002)(38100700002)(66946007)(66476007)(5660300002)(8936002)(31686004)(53546011)(36756003)(31696002)(86362001)(6506007)(2616005)(186003)(83380400001)(6666004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFA4VEJOb0xiNVJHUHd5UGUzNmRvNXZWMGx3T0lMREJjQ0JHOFBHWjN3QnJ6?=
 =?utf-8?B?SHVGcW9obmhqbDFCT2tJN1ppUHIrN1ZINldDeW5aTksySHdKTk1URUU2d3dK?=
 =?utf-8?B?a0wrOHpCTUxFdlNYTDRyaXYrS2xRMlFmamc3WHpLZmVsaUhjbWZabW8vNzdM?=
 =?utf-8?B?MzNGczJyYzVMajE2azRKWHFWNlB4SUcvNXJqbGM5MmpSZDkyYWhYRkhjTk1t?=
 =?utf-8?B?MUdOdGNGa0F5T0R4bFoxbHZENWNORWRmQXhzTUFQanMwWGliTU5pUG5rdko3?=
 =?utf-8?B?WWJScFFDNG1EcERuQ2ZyREx0TnE4R1hsWWFMclZ5ZEFhNnR3V0lGVnJxNzQ0?=
 =?utf-8?B?K3JXSjd2Y0piaitCaXd0VEhOekZ4dGxCNGN6eUlHQ05zVEh3QzFTVGpYeUl5?=
 =?utf-8?B?YWhmTmgzbEo3akRWSzRXWk9KOEF0cExkWVQ2d2E1c052S09jeUc1a2NBYkt5?=
 =?utf-8?B?QXNpYTNHd3MySC9LS25nU1JBVk1JOTFFS2tkM0xrbGhrNktES1F5L1JEVW9Y?=
 =?utf-8?B?aFFBK2dPSWRBQTlIb0hibHdyZjBOTDhXSm9KTXIwTnVQc3BSSHY1MVZSMi9F?=
 =?utf-8?B?RmZFeGpITWdIcjJ4NWd6b1RFTTZqbHhLTmFEcjNvd1pvQS85STFqMWdkcG55?=
 =?utf-8?B?eUQwYldxa0hYbXZlaGdjVjJ2V1J3dnhSeG5QRkhDRFkyMGtBZVdoV0dJU2VZ?=
 =?utf-8?B?ZmJsZFdKUWpGWnkxWCsvU0VLYU1pa2pTWWlNdFVCN1RRYmFISTlJSlo5cUJ5?=
 =?utf-8?B?RzgzQ2UyMllhM1Rkc0twLzJmais5Qzlrb3BNdlFRWml6K3dWeGc5WjAxUTYr?=
 =?utf-8?B?ZEY1MmxQVXBjckdhNURFcC9iQjBCVlZ3YlRMQkcweEhNSFBSQmIvem5LcUpy?=
 =?utf-8?B?dGNoZzd5Y003ZnhoYXVJNHlxTzBHVmk3SWI2TjREY0pzL3U3TkFmcFNDdHND?=
 =?utf-8?B?UnNla2ZSRW1lZEo0TURNYUtjQ24raHhuRUNFZERoZExVdnQyaFRjVTVaMGU3?=
 =?utf-8?B?b0wydHM3OVE3ZFNZdjRRV0tzVllwaFJ6QkdRdzB1NnVIcUVjcnRDN29JeGE4?=
 =?utf-8?B?Sk5ldUJDVVRVU3ZqRG9yNnpoVndBbzdEZ0lzNUdGYnR3UmlLcFgwcXZaZkd0?=
 =?utf-8?B?eXRJQXRVWWJ0eFhoZTdPeDFVM3VrTW9oVnZEdU5iSE1lUzVjMkdJM0JZNXBp?=
 =?utf-8?B?NkxYY0JlZW1DeWNvYVdWangveUlnTmZKd3R4N0k0TTYrZFRNR2pZSkN2L3Vl?=
 =?utf-8?B?Y0hITU5SYTZPVVhMakgyNGhmdFJiUTNTNnFxd0taRGdKY3lIdmVsZTkvOG5C?=
 =?utf-8?B?T1JLV1BZRE14WElNZG9meDh4Y3o5Q0s0aU9mWVBIb2RCaTZJUDZ6M3lMVTVr?=
 =?utf-8?B?UUtjemozckkzRVhibi9ENkx3K0h5MDkraEJ1ZlhqOXFTU0FLTm8wWGtPQnND?=
 =?utf-8?B?cWpMeUhJOFFEclgvZGhKT1NMMEdzYm82RmpLTDU0ODdhRStvcUQ1a0pnSWdu?=
 =?utf-8?B?Y2FBSURJTVFyUE5Majl0dDV2bVN6b0VHUlRxWncxaEYyYm1DL2FJZGNhbXho?=
 =?utf-8?B?TW1ERGRiUHNrQ0haQmNEUkJzMlN3Y09hL1RzVFEyWHZBNmdjTUhNd1hESFk0?=
 =?utf-8?B?OVpaRW9Ic1g2ZHFjcklVNmFXRnRUNWsrbWN3ZGxETTd5Y2Z1YW41SENsbFhI?=
 =?utf-8?B?NDg4MWRuZWFYTjRycDd0WFAxQk0yNHo2eUl4czRxRlQ3VHBVNnhXdXlBQXpS?=
 =?utf-8?B?dnNzNHhHV3lnbFNveE03Y3VPd3NCRjBzTDBJMHVrdFo3S2dDbnNwb3BaWk9Z?=
 =?utf-8?B?czBvR2l1R2Z3S1B0cTdTamlicDVDRVVvVXBKWDNLSy9tQ1Y0UjgwbG1XdGgy?=
 =?utf-8?B?WEhBc2o1UGwvYU9jRlBQU3ZoTU5SWk1KWmg1bnA1eDlsbVlXZUtBaVYrYXRV?=
 =?utf-8?B?dmgxNllFdEJFSnhOR21aVUorZzdnVnFYbXN4NTRmVGNSQ0FCbGNHRFppSEtE?=
 =?utf-8?B?M0tuWnhSSW9iZXFCVis0VENvbDcxWWMyb1ZLTXNuS2ZFcjg5QVQxSURBMnlX?=
 =?utf-8?B?eTlld2xjdVdlSDZoYkh1cnFTcWFmUmJCN1MwZWNVRGFJRWNES1c4L2ZCd2tK?=
 =?utf-8?Q?tlNID4m0LO0Hsm3e6QNnD2U3F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bf68a3-7f7e-4f8d-513c-08da7c686f62
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:42:01.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NobfnkdrL3OY/egSlIXn/EFGj6EKMtjHUyt8XyyeDvPurq5Rwfix4waiEyXAAOy0VI2X8YVfoEzF0/+hhD3rlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813

On 11.08.2022 18:48, Anthony PERARD wrote:
> Rework dependencies of all objects. We don't need to add dependencies
> for headers that $(CC) is capable of generating, we only need to
> include $(DEPS_INCLUDE). Some dependencies are still needed so make
> knows to generate symlinks for them.
> 
> We remove the use of "vpath" for cpuid.c. While it works fine for now,
> when we will convert this makefile to subdirmk, vpath will not be
> usable. Also, "-iquote" is now needed to build "cpuid.o".
> 
> Replace "-I." by "-iquote .", so it applies to double-quote includes
> only.
> 
> Rather than checking if a symlink exist, always regenerate the
> symlink. So if the source tree changed location, the symlink is
> updated.
> 
> Since we are creating a new .gitignore for the symlink, also move the
> entry to it.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


