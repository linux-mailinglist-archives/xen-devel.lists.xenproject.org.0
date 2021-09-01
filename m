Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2C3FDE3B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 17:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176520.321195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLRoc-0000eB-0x; Wed, 01 Sep 2021 15:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176520.321195; Wed, 01 Sep 2021 15:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLRob-0000c4-Tn; Wed, 01 Sep 2021 15:06:13 +0000
Received: by outflank-mailman (input) for mailman id 176520;
 Wed, 01 Sep 2021 15:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLRoa-0000bt-9C
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 15:06:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 262e4026-ba4f-4d09-9b19-2a6765503b85;
 Wed, 01 Sep 2021 15:06:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-nk--lYA9MjSxirvyqLSAYA-1; Wed, 01 Sep 2021 17:06:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 15:06:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 15:06:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23 via Frontend Transport; Wed, 1 Sep 2021 15:06:05 +0000
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
X-Inumbo-ID: 262e4026-ba4f-4d09-9b19-2a6765503b85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630508769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lIEEVx3pKZhCJQYNuhuiguKiqn5e+HYCDbQkL7NIP7I=;
	b=f2TUGBMhWp5o1bkG8YjVQQMGOLV4R5wK1HPb4h1/2FtWriMEVctaEuka12XaVthvAc+qfz
	4k4vVjbUaXh0Zv/UspIiAOwn5ZpWyGiHMK9zOCecQXh0AYIa4qdilQXr/grrJzkqOGwaIH
	Mihr6SOwi0PQeva8ktoECo2FT+T7siY=
X-MC-Unique: nk--lYA9MjSxirvyqLSAYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsVp0pnb5svi4vgRWnekEUj0FYNzoQMJwN75M/1z6MpcacJcx7kL4pRWezLC4CKAnWU9HnRhpNQWDTd3u86ubd6ZSf+I/n/GF6x6/Wdobg5ihJXdXyA4AumO2jINxDgYRAdr+ELRFxxLY734u8XLvsVTKjL8nIz5lFe+90TYUWaW6YdP4ZP05LNe7iikRMl33vLqH/Pv1/8S1zr0FhrkNGI/j5sWyqCW724a68IxuL5aY4GPppOGC7yxMp+DfRBlp3YAUDhCSwZHWMWQJ3r3FlzdUX6HtFe+8ICoHVAbiLlSL2AegBgxXHzsxFesoR0YIgRl42J99blIiwVWu5sneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lIEEVx3pKZhCJQYNuhuiguKiqn5e+HYCDbQkL7NIP7I=;
 b=EOAXveL+MZ9jEWbSSGxZlMdQeEGg7xTsr/lkhokGk3jGmYC8srUbwLdRj5/m6vYPV5tXcgCyY3z4Y/xmSIlXrgb9V7wSaq9sml0uCXmLift2Z/CRuAWT/9yr3uDCBwPfHl6q8ePsiCDpSWGcUbgMziSm8UiG7WcCZPwPRotoI8hKVjtnUPnFIPZoOlsQxJwWIgIaVDrxsa/3/oMSwthT+uPfMyosgn4eKn7WqvLzQF0bFSHHKI7560CPnCVW9FFv0vm9CdpX3B3Dpy2W+7z8/9/brDT9+g9f2NnXSR90CNPUOzzcmOpMM6iAQgHOQSSoCCE35bw2EBD/NokJ+CaW/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Message-ID: <1d600035-851a-190a-f744-8cd7b2d887fd@suse.com>
Date: Wed, 1 Sep 2021 17:06:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e84511-4ea7-4a6d-76af-08d96d5a056f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68648DC50D749EFCF6FC42EEB3CD9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K5D4Y5B1MkK36YlI2zLhx1Pv7URAjtQSDEx+DoruwOBOdwRXnbIJ4UMDsrpn1eWvZXouSy4rRN7H9t5ATr58kGRNm/nivRrbUnThmavzvG0KiOu8X6pUe+xLIV0keyTwKI+IiIh0WPlP7bv8z+U9HDODl2KpPYy//f9WUFX8bcvVFXc+Ju8IiFkOVkKc9V1ttNv/730rY0fck0RvCiNMnLrf022278zXxMtnxs0/Vkd3vXiZcG9sdhm2M2Pg5pQUsdJTnGrrEQoSpyXN24L1CPzk7YJhoW8AKphJExyyk6n3EXhpc1302NcN5ZOdd9hzgUPyfJ21QG/+kN9DRFswo25rw5kXTmukyaUVEjSMkOs68kP//9MzGizzN66G9bOa3mDpZ+yCo3P701OiF2yFFG+kn5tfo8wkhHMMniCKwFsqJsnpDUxRdckANFaAHmKJVG119Igz7WV5MzXAw+pylOkssEJxBIAzSakB1cJ7g4+ecrfj9H1D2Fr5KyzPhz4p+ZyNeXcMGVoeENrXH+dOKXFqwDnSu9vXsYt9aq6KdLOsVb/zcJfKF2VLYeYx6bT0RicCCwq+aj3/7RGmmokNXt78V/dIW3VAasW+WACmfitME6lfHRGJPmwqxT3hm/5QlkJOnjNoJIyNrWsa8gFL/pr4ixvHCv0/Hsri+66KzCgqNCqZcc+tRHZv2XK9Z0sMiuvTXnYr3v+la6A+wZDHG+SraUsu4XUmGLGVVLttEs0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(53546011)(31686004)(16576012)(2616005)(956004)(86362001)(316002)(8936002)(186003)(31696002)(36756003)(38100700002)(8676002)(5660300002)(6486002)(2906002)(83380400001)(66946007)(66556008)(66476007)(6916009)(4326008)(26005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHhtNmRTTmtQcGhBMTZ3MTRndWQvcjBQQ3doWWhIWmZ2bzM4cUg2ODBMQ0t1?=
 =?utf-8?B?OXQzaEVvOG5uc0syMXNjY1Fzb2xxOHNpdml2cm1jdWw2UUNYcTdGcmZiWngr?=
 =?utf-8?B?UU9mckRNcnQwVHVRMFhHNHgxb2lCOVZKZlBYanRWL1FMVDlvUHhGZ0VzRFV5?=
 =?utf-8?B?T25jMjd4Rm5sdStSSGV4d2lSbEhMYjlRMlZoTTJKdFRmSzFPTnNoTWpIcEEx?=
 =?utf-8?B?bXI0RGZYYVU1YWF2eEhQN3dKUkQ2T2VPN0lUYkMxYWs5T2gvK1BrelNOM1dl?=
 =?utf-8?B?SU5lQmxIOHhjekhCZXdFL0lwby8wTDJhbVEwUDZIaDR2QWVnVkpVbGZvQkxF?=
 =?utf-8?B?LzNlN1VVNTJpK01WcUJIQ1dSWnVyVG9MNkdKYzhGUTdNKzVVN1dDV1lUaTh3?=
 =?utf-8?B?Rzl3My9Ycnp6RlRGcFZXazlxYzBMVEV4ei9MaG1BamIyUFB1WjM5a2JtSldE?=
 =?utf-8?B?ZlhrQVRBS013UG1WYTVEWUNnWjQ4VmNUSGFaa2xvN3Y1MGhySlNwUXZZaTJx?=
 =?utf-8?B?cVhBbEc1OG5tdzN5Mmptd00yN0ZBYzlCWU1ZM2JxcFRqcXRucWZXTno2VDMx?=
 =?utf-8?B?cllhZzcwVzcvZ3lhZUVQQTIzTm5UUktWMjIyd3pkMWQ2MjZpZ3pMejNLT3N6?=
 =?utf-8?B?YVRrb2VRcWZoSkZWcVBtbExhVVc0aE52WVN2ZEhTdk1qbDFkdXR2VUY1b1Rw?=
 =?utf-8?B?clpRY3pTUTZPVG5sWmNNdTY1TW5wTmFlNDJJWi8xQks3Q01Id29mTGh4ZHUy?=
 =?utf-8?B?K3ZFUkxuYnlSNzArQUdzazNVRStCWFRpZzdjbWJIcGxPTUk5QS9EdmJCeUJY?=
 =?utf-8?B?YndXTjAwS0FLQzMwOFNienpLV29hWThKSk8wNmlCM0pQUDNQS3RKbnVzV1U5?=
 =?utf-8?B?bXNRTm16T3hxKzU3OGV5ditHaE1BSDVUb251N0RYUHNSQ1dKSXUrU04zdVVE?=
 =?utf-8?B?MUMzalNUNVkvaDNQbHk3WDJ1Uk95UWhTSzVjcncvNUp4QVRTYzhzWmJ6QU9V?=
 =?utf-8?B?OE0ybnNrSGRKSE8yTzJ5Tm1YTHIyOVBIZFNhakNnMks2ZWpnV2pySDE1VVUx?=
 =?utf-8?B?WFlvd0VCZ0JxV3RUS2VrYk1yV0VUNDNObGFoRDlZV3I0L2dRTmRkQWdQSEp5?=
 =?utf-8?B?clo3TXZpbTdjc08vRmhvTzNMR0ZNUzlzUmFRY0FYUDFpeVp2TEFUc0ZIYys0?=
 =?utf-8?B?V0pFbGpQRnQwSVVkaEdTZkRhUERmaTZlR01waVVLYkRZN1lkM05RTGcwWjBB?=
 =?utf-8?B?U1ZBa1BYTDRvNG0wV2hHNkxZYXRoenpaQWE2QWR2RW1QSGpoNmptekJhbGNx?=
 =?utf-8?B?NnJueVdHam1lTW9TNnVYVFljT2tPTUJhemJKQWJuRFlTajVIekVyU1JnczFT?=
 =?utf-8?B?YmQxOWtWVnBSZlNiRGJSUGtGRjhUZnJBeHVKUmlVOTdiZk9QRlRtTVJNREly?=
 =?utf-8?B?TXdrQTlxNWxIc2pVaUo2ZXMxcG04NEthMlJMbmhBcThxZWREbDhTRDAza280?=
 =?utf-8?B?QzNUVzlZVVl6cUI3bGpLcEFZanhWZ1VILytYMDhlaXRtQjVYb2I3QzJFai94?=
 =?utf-8?B?K3ZtQk1zTVo1ZGxKb2E5RnQwWEtrWERrdmFZRmpxdXgrbWY5a1JUQy8rTmhu?=
 =?utf-8?B?NFR4OG1ucVJNNnRQUVVuRVd4eGNqck1GbmtVcXhPa0JiQmFVVWtBckE1bTM4?=
 =?utf-8?B?TmgxbHhxSE4xM3NaNXQ5UEd5ZDlqbVdaMS9zdjZQa3Q3bURTVUVEd1IvZi9Z?=
 =?utf-8?Q?czvYt1qGIbQtBQSiKbcoixduH+oFEPuT6XCuFTC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e84511-4ea7-4a6d-76af-08d96d5a056f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 15:06:05.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaEUpYWZx21VHKcv6/9vgIzW1oM5VHgGaLwYMyf0P17JPP5I9RIlq0rziLDz5sb1LRrAlVXl+Ea5/VO9RaeuAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 30.08.2021 15:01, Jan Beulich wrote:
> The code building PVH Dom0 made use of sequences of P2M changes
> which are disallowed as of XSA-378. First of all population of the
> first Mb of memory needs to be redone. Then, largely as a
> workaround, checking introduced by XSA-378 needs to be slightly
> relaxed.
> 
> Note that with these adjustments I get Dom0 to start booting on my
> development system, but the Dom0 kernel then gets stuck. Since it
> was the first time for me to try PVH Dom0 in this context (see
> below for why I was hesitant), I cannot tell yet whether this is
> due further fallout from the XSA, or some further unrelated
> problem. Dom0's BSP is in VPF_blocked state while all APs are
> still in VPF_down. The '0' debug key, unhelpfully, doesn't produce
> any output, so it's non-trivial to check whether (like PV likes to
> do) Dom0 has panic()ed without leaving any (visible) output.

Having made '0' work at least partly, I can now see that Dom0's
vCPU0 enters its idle loop after having gone through all normal
initialization. Clearly certain things must not have worked as
intended (no APs booted, no drivers loaded afaict), but I'm
having a hard time seeing how to find out what that might be
when there's no output at all. PV Dom0 does not require any
special command line option to do output to both the VGA console
and through hvc_xen (making its output also go to the serial
log) - is this perhaps different for PVH? I couldn't find
anything under docs/ ...

Jan


