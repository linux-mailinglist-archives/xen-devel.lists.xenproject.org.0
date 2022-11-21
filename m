Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85093631B1B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 09:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446416.701982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox1ya-0008Kr-5A; Mon, 21 Nov 2022 08:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446416.701982; Mon, 21 Nov 2022 08:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox1ya-0008I3-2E; Mon, 21 Nov 2022 08:16:24 +0000
Received: by outflank-mailman (input) for mailman id 446416;
 Mon, 21 Nov 2022 08:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox1yY-0008Hx-Q9
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 08:16:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c77b2d42-6974-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 09:16:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7130.eurprd04.prod.outlook.com (2603:10a6:10:123::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 08:15:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 08:15:52 +0000
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
X-Inumbo-ID: c77b2d42-6974-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePHgTCw/0S0He11zh/wkhojr1U4TDHNyQKmx2PoL8GYkFNlGAxHIV88joeCv3GYnOaNGZK+OCNUb+5lvyGHbAPsdJUA2dvgPQCYSpUBjhcg22cu7YrEwNNpgxui+d2pJCXV0GUbsDjfRtemBetPXT8h1poCI9Tb0xcQVFG0lbu3l1s9hHYCFgZd0oVMTfbn7ej6DhiZjjFxQvcWUdAxfxZ/MSCCd4gAgRJsov5EtLIHvj1pCbC2SGs31CqiS5MLDZjAcCSjyxebyjsLo8y6kZQsH70hOGVMl8gZ7ImqtbEBSHDs6wCew9stLt+p42ByjZIWtvkfn667p11n4n5Vf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zVZrDcTECDCUU9XSL7IpNafkjQIy37KSqkWvtAnlC4=;
 b=GOZ+mDebiS/642wYxuuhv6mp4fqLaDyB/VoI/v2oH4VjObrGBtIBhTf4CWwnZdRaq304HJfruLhUzj92asUaAern84mPh5UffcT8F6qkzumHBV62KrAggqJdDzKtt7iC8SGvui3m5oZHSqDKVhs0/QHAeGqVcdlTSMagNUVSbXMIccqcSpsGttniKwLySrRJQ/Og0HQ863CRgUsk4bxiEHeKnXn6dOoWO3GVRcg3CXg9EvjYvvXKLPP1TA55Z0nQDse9k9wFwugdAANpH3dOxqybXEp+TyZB3Zv5fRhHcnP/WqXN9y656xSL4La2Fo3EeaGx0wuF3MBkwm+rzkzF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zVZrDcTECDCUU9XSL7IpNafkjQIy37KSqkWvtAnlC4=;
 b=oEAk6qcRxvOyl0aV1ivUigl6G9AaN6H35FdpUc9VxSgBSSXSNbMftdBc2nhMSAdi40xJE9joziM7WdfsvArE79780xLj+uvs2W9KPKmLDp5TW47grCmhSzMnT9mwmT6s1e1OXTSPkOFWzDr5tAFW/WA94tK85DN7oPNp6czT3kg7bft0SiC9WJBWFO6/CKvbOkq8t1wiFmB7hMY24eKaVyjrr+Mo5f71IVg2qV/Ljb24i+0XDq+1+GWqy6gFTUggZ46okqacSH9nTXxokOsa07O4XQnTXH9BgE1rYcshYbr7BY++rhB5hoaZFk4LKRIhST8T9eevQ1Ht3hxZevIaAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f14d9d4c-6761-dc4d-8f7a-e51b816d29fb@suse.com>
Date: Mon, 21 Nov 2022 09:15:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] efifb: ignore frame buffer with invalid configuration
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221118141132.26242-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221118141132.26242-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c85098-1408-4f4a-b21f-08dacb989ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6AvcV3ZZOpymyWQ+Kc3tJzAQJNHQTPsyCLTUhLic0p/ykoF1Dp0OO8oVp3w1c1ZYCuzwTZPAVpnpdlcGk6UEbYdEU2C9ImlnmT+4P1pN9jFoiOC2WYkVb7+Bw0F9Y1YehxPj7nnOPpB4XnB1cfJm2Ll6KmW5vM73uKbrlKSG61qR7dLVg0wlAnx5y/r5xJRhEpTk1DtiD9f4gukECIfLaSQRhEZ95/9YNOnecPXdsG5M/KeCmUAmaHScY7JS8m1D7HHqrEcxaL0qj4WhnAitTxhpHpWBPTk292FAGLrdVGvnuMcEKlg7W7/pyd10yZw3z4i9AVdmeQ+Oz91o4Hv2oQTEu0LilaM26HPusB2PO2K2Bhrv8DUdAftqkn8ydroDYjIDBvhi9q+euIMfw3d84SOFSLhqUCvPI+a4KEjX6ulLGU/0701/rBAj7U1qR5eN9Kf9cm9umzWVGS3qiZnr83LL7xTLvzztQfbAi7se1vDJ4qfY7m1ps6TachQzbUdaIdTEcjwUHfJTYmEw0RuddYmxgBObkq9C9bg78uSaUUlpst3REhYnox4bgMB4yCqUIVGjaSxFK2LPJDZ6b/D0Z6WQq9wyJjTGHvqVvquZQ1HCFaHcfD4Oo1MfiTL0xxTg+d/4lqVTEmUi4tLozYWfLPSzpDJ9BU0/7TAEIiaywOmD00WW7uzlOOeuSJL1EWCFZbGzZgUc2P5sdunLubv3ne1pEABYc2SilxJhKflLhFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(38100700002)(478600001)(86362001)(6486002)(31686004)(6506007)(316002)(186003)(2616005)(36756003)(8936002)(54906003)(6916009)(26005)(2906002)(53546011)(41300700001)(31696002)(8676002)(66946007)(6512007)(66556008)(4326008)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0FqZnFGTEE1Z3FWZjZ6QjZmYzBHMVRXV2ErQnlac2M1U1FHUFpueENzc0g2?=
 =?utf-8?B?UytETGRINjVFMUVzQmJaL3lyK0l4UmwwNzROZ2l0cDdwTU5RUUcvR1VPVGdk?=
 =?utf-8?B?cG9Kb1Jhc05CSlBOL3JnTkx3dmpRNTRtbDN3YjU3ZTVpVDk3NmJNZG1MZWRo?=
 =?utf-8?B?T1dWc1oxMWY1Ti84NEs1ZUxncWUxUUJ3MFZORVRlMG5HWlMrRndUblVYODZG?=
 =?utf-8?B?L1ZoRXlVRmRwcEVSaDZueEpwLzlyMXpmSk9qcXVWMjhHd3RmYjVLYkRncTVL?=
 =?utf-8?B?YUlyUENkd01zYWlBYmMvMWpJTXlaL3VmaEk5Umlnb21GZnVDTnhIc21KY0c0?=
 =?utf-8?B?WE4ybXhtc3l1Y2VhZUREWTMvc0tBdVRUYlR5cVB3ekhiVFV4N1A2eHBxb2tT?=
 =?utf-8?B?UG84aUVPYWsyMzM1NGpwQzVDbWQrQ1prQTdxYnFYK2MwUHc5dkR3NWhyZkJF?=
 =?utf-8?B?S2JRa1JrY0syNmlHRSt4cXptd2t3VW4wY0RGT2dzVlVFOHQycWp4TXFRV2R4?=
 =?utf-8?B?eHd4dEdpMUw1NWZMM2NySUQvVVJINEhaYkF2YzE3dWZKQy9tOGw1d2ZYdkNB?=
 =?utf-8?B?N2t4MUVOUHZ0eDdGR2RoWkUwcU9rakhROU1VcnZ1ZzROajV5ZktXcHdvN3lM?=
 =?utf-8?B?Y2VRZzMvYVNXL3hyV3V2WnZlWHY5TitDNWpYUzJKR2RpdXp0cG5JbGhrWkMy?=
 =?utf-8?B?V2dKc1FGMTJZbUdZM3FZRW53R0tnUU1vakIyd1pMMGlvK01IQzBiMkhrQlcv?=
 =?utf-8?B?RzlGdk1QUU1GU2QzV0JhdEZSVVFrTi9BaThVWkxaWXUxOStBa0Naa0I2aWNw?=
 =?utf-8?B?NnZFK3IxOVFkU0R6R3FqZXh3aWdEZFlWZHI0SUxhU2ZidUpSU3VsejVjQVdW?=
 =?utf-8?B?TkV1bEl0RUhQUzB1UlcvaVhOa2lIZS9CcThoZktsZDc5RUxYMkVZd04zZDV0?=
 =?utf-8?B?a1hHRGhwMUsvSFpXMkU0UmxnZVZHT3JqMVhyNzBUcGxCVzRBVWFLeGxIMzZ6?=
 =?utf-8?B?K055d3Fxb2ppbUNiYXdMSlVtRzh3UFpyTEZaLzkxOUU2QmFpTlVPL21JYW1Z?=
 =?utf-8?B?bW9QdUdnMTd3Z1JWeUlnZXhHclM0U04zWG5LQ1hGV1ExeHduQW1tOWZ1QmZR?=
 =?utf-8?B?SGdzcC9DSTNXdHlFMGM4dnk1MVZIaHd4YnNGMWl1NTJxNGVKNlA1UHZrVE1Y?=
 =?utf-8?B?T1d1RDRYdDl0VE9TajQxcElVdExUMG0yQ1JHSjdZUHpsT0toWnQ3USt4dTdn?=
 =?utf-8?B?U2VLN1BCYXJzY2RGdWlKdUdJTzllaEpnUEhqSkI0NTVXTStkdllkVzgwSlg3?=
 =?utf-8?B?SEp4QllQQVJWeU5wQmtGV3JFMHJVQkQyMzhXN2JCUnlnUy8rTzVtWlVQTHNQ?=
 =?utf-8?B?MUdYZVdjUXgxcnNuWTJBdTBMZDFRenpTdUNNK0VJdUtqdnZpM1h3dit3K3Ji?=
 =?utf-8?B?cVhsTVdQZEpQWDBGTTVFbWZCMk82UU0zRERxcFJMWUNQeU16QzhWd0RvUitk?=
 =?utf-8?B?aDZQODBsb0JvY0hvYXRhWEl4TEVLaXZEUk4zWnFiTmhTYXFDQjY0ZHVPNlN1?=
 =?utf-8?B?c3RZSVVDSGdxbXZNbUtXalRUbHpRUzF6VzE5aHl4bDNyZ0ttLzdxZjlkUWRq?=
 =?utf-8?B?bHE0bG9yYmpiQklvRmpzdDJjcS94Umtwc1RpajJ2d1NZMFZKL0U3by9pWkFB?=
 =?utf-8?B?WXArQ21hb3lkS1hHOE10MEpQdXZ3VlZUZTVOL2tiUldnbVExQUowQ2dHUWtQ?=
 =?utf-8?B?eXZFZVVJaVR5RGRYeVZoUHhGVXVtQ0pva0hLRWtiTDRPaFFTVmNaRmpDbmVJ?=
 =?utf-8?B?RFQrYlh1OW52SHo0WlFTZjNYUE1DcjF3ZDZ5a2xkRUtHM1BFaUtLcVQ5c2Yw?=
 =?utf-8?B?QW41UEZkcG9PZlB4NmtMbDdZSjRObzRjdE9rUXBTVzk5VzFsY1lWZGZ3bEs5?=
 =?utf-8?B?cW5QZ3RNYTA4UDE5RzhzY2F6ODIwU0NFeVNuSm1uajRGR2FaVVlWQ1NFYzZp?=
 =?utf-8?B?R2hoVjcrMVVKTjQ3SkF4aVNMcFNOUWhTUnJUUXZOdERFN3cwYjV0QmU3b0ZY?=
 =?utf-8?B?TmZoUDhiZ01zWXdkUjZiWVlUa2FSeEdJUjZ4azhVWXB3T0VtOGRlcXdndkRB?=
 =?utf-8?Q?3EzAfDog6r0/4/sezIhDGEAkQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c85098-1408-4f4a-b21f-08dacb989ad0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 08:15:52.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbxzhkyu6nSGbKZ+Fm8zYlRd2P4QHGRpXIZNe0i4086A5KLoF3TiK5/y3WFd4YKBMazd5UzFYHsmG9VcOba+sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7130

On 18.11.2022 15:11, Roger Pau Monne wrote:
> On one of my boxes when the HDMI cable is not plugged in the
> FrameBufferBase of the EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE structure is
> set to 0 by the firmware (while some of the other fields looking
> plausible).
> 
> Such (bogus address) ends up mapped in vesa_init(), and since it
> overlaps with a RAM region the whole system goes down pretty badly,
> see:
> 
> (XEN) vesafb: framebuffer at 0x0000000000000000, mapped to 0xffff82c000201000, using 35209k, total 35209k
> (XEN) vesafb: mode is 0x37557x32, linelength=960, font 8x16
> (XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:0:8:16
> (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) �ERROR: Class:0; Subclass:0; Operation: 0
> ERROR: No ConOut
> ERROR: No ConIn
> 
> Do like Linux and prevent using the EFI Frame Buffer if the base
> address is 0.  This is inline with the logic in Linuxes
> fb_base_is_valid() function at drivers/video/fbdev/efifb.c v6.0.9.
> 
> See also Linux commit 133bb070e94ab41d750c6f2160c8843e46f11b78 for
> further reference.
> 
> Also prevent using Frame Buffers that have a 0 height or width, as
> those are also invalid.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



