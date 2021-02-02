Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DD30C5B4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80646.147629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yYf-0000vs-KR; Tue, 02 Feb 2021 16:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80646.147629; Tue, 02 Feb 2021 16:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yYf-0000vU-Gs; Tue, 02 Feb 2021 16:29:41 +0000
Received: by outflank-mailman (input) for mailman id 80646;
 Tue, 02 Feb 2021 16:29:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4+r=HE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6yYd-0000vP-QL
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:29:40 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a6b6893-0f6f-4e74-97a3-8cb1c0c4eccb;
 Tue, 02 Feb 2021 16:29:37 +0000 (UTC)
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
X-Inumbo-ID: 4a6b6893-0f6f-4e74-97a3-8cb1c0c4eccb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612283377;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RNY5drRKfQDqnT6tZEtwyUVCWsnHI+a2Y0+0kZ9nnZg=;
  b=L+02HfzzKAIY2WAmD7F5pa8DEz2Wlg0RizepqPucYOCpRwHmgMvTouCB
   OcKp23vkuMxy0I9bFodFiibgZMHgGQ4OpDqPqEGkqwzDy/ArHwSbYgU16
   Scd43mq3u/HG85779V1+g586NjD5a9WQZx7gMshba2zDTpfL5T0Ecd2Lo
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JQ93LLghNXf1Y8neF05Kz5wNtUOiKwNdjXI3niqK8NhImntjVl55u8MT3spGic9X3ByUSKhTFL
 hQxmhxbyAUN5wq/baQWYxDE0TuGxrJIhS79nzyBF3mQfyzqaVy/sOjeIObqLH7c54TvOnNIN7u
 dXHBTdyK6yrA3uLr3VMlIjjuknu7XU6y4ymDxmCQiVgi6h8QUQhC/KtMaA24ad4u9gguqACZSs
 zSc7PBwPfNlQYbJV2Xg1GQaP/LUxQVF1nqWznMMnme2aH/otsbmtsi+IvZCbq/+gGtLQHO2xDg
 axQ=
X-SBRS: 5.2
X-MesageID: 36385231
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,395,1602561600"; 
   d="scan'208";a="36385231"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRMZ35rgrDiN7iJc+THoOBqsWObnzNauYCn3OxFTnsnDKn9sVdEwRchaVnmu9ta6VzvMwCmTF0P8GrthTKb8kKJzp87IB9uR5Dj2Mnla4r1sWh3Q1RSW/dnil20QPYmyFhTveoAHq2mG3DnrPNL3sIDx2QjbSqiw5VwgBPtfU6FuviJjInD3XjA52Ym7eKniRtaBrQdUmJTdu6by0CpbBbJ2CcuXaAR8tursU+07W+errJQOELlHQeZyIPGV2uTrJQLbZPX7WfsmL+zWb9R/0BTEpxTG60KPfjWMzmcpN6M3jrVp+heoRUyuKk55g4/S2+RBeK8T7orJEd2zZ31+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=477fdphrfKsIiITpaPq/t+BDg5TfuMxQzRB9zww6uxs=;
 b=YgHdQBVQe4YK0jTGVYBCEpV/HCcKM79et6AiJePiA8SzxCfdLcwPZ7nN6sVUb81ouvt9dGSg64TjLsWVqRF9+FvdE0ryrCiNJu3P06y04yrc6SZUV8ef8TSq6yGl+JhhthSzZbk15SiXS7RIa/qTnew0wpwK/0DE3Zqp4vbZTzGuZyRz5AHLTHIRTxO+mD0EEqY6sPsUm8VKOrLaszOIg3Up/CZNTs9yqkv7CN4y6vqpS8Huwhdf6M72OwNQVWY+V4WaY44OhqLFug/UOVBzrvpNHDYui1A6b6avzeMfxy1i9QC6XPfs4JsJNXo1FvdhkSL+1YPe4I1W3rl+I8bvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=477fdphrfKsIiITpaPq/t+BDg5TfuMxQzRB9zww6uxs=;
 b=inQPcaCY3DKIfucd8iH0nKG0KducpDiJdoCXKzFW60iq70J2AUQPxINCQX9KWr7nn1GKTwhR8hoQm07F34vMVnuRpD/y6w7WuS+7N0cq2QDUEUkmAN5hksy0Imzru/P0CllFWk85Vs8zTigFB0Wk+zSg3ARCUQrD/gUkqHIh+GE=
Date: Tue, 2 Feb 2021 17:28:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Paul Durrant <pdurrant@amazon.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	"Dongli Zhang" <dongli.zhang@oracle.com>
Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single page
 rings
Message-ID: <YBl9ycif3bG/Y+eR@Air-de-Roger>
References: <20210128130441.11744-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128130441.11744-1-paul@xen.org>
X-ClientProxiedBy: PR3P192CA0027.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaf24ce3-0811-499b-ea3b-08d8c797a6fc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4300:
X-Microsoft-Antispam-PRVS: <DM6PR03MB430067ACC6BC7A29FDFA1DC78FB59@DM6PR03MB4300.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8PmrSKENAYySBUdoMJRyGm1y826BHoULetuit6wzAMaesDO79mkr79cZrf1afS0aglwdpn1QY8mco+hd5KEUruEChTEpjXuwoNXtMBn7jP4GwXmcj1zuBQLI9phFAlmpZO8JkQKFcbCTFiw4Mo/tyZqGjPKJsiRE+6PV9nGzNjEftf6xm3O50G9kj/Rf2GP5uC527cBnCEXy3/fi0xocNSat59Saaq5tpzw78+qL8/XRZNfCTo2Dw3dzoAPCnvaaVWWvpEvtFPdxLLVedn7VEyBbtqELCBCcm84nUVxX8YGaSOGDVoZd9bAZK5UMvv5jlJioOgdjYYfp6VxeEQVr6S16rimJlSY4LTVN4BAO0KBeAI8gRtfAgvKxI8jlF22QK6D7cfrTu+vXVwtGR1csLSRNb5nNVrLa94UA1hGowQ4r3P0ch3qvkap5jsoMJHgvkgVFXBshie3UWkLt4apeUlv6iw0j+mbhWKsBsTBsODaSRNKAf78iw8Ys+GwLbf9JneLliY5YTB2eE8Q1QWCv3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(6486002)(5660300002)(9686003)(54906003)(66946007)(186003)(478600001)(16526019)(316002)(26005)(6496006)(85182001)(33716001)(6916009)(8936002)(8676002)(83380400001)(66556008)(2906002)(6666004)(956004)(86362001)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkIwVjJDd2ZVQjBIakxkcGc5SW5zOWpOUzB2RW83ekgvclRuNCtSYWZpVnpv?=
 =?utf-8?B?VjJCZ2FvSjNmTmZlclM3djZMMEV4M2crV0tHcTdZdVdnL3FkVHg0ZGJQRVR4?=
 =?utf-8?B?ei9aYVNUYzdwN1FiVHJLRU9CNUpDZG1RRENEL0hYNzdzOFVQcjRMVkg4bDJp?=
 =?utf-8?B?NUpQYk83TS8wK2pvblFDaDc1aEkwNUFodHJGSDQybXEvR082RE85WDBlWHJP?=
 =?utf-8?B?R3J4ek9SVEtqZHZBWGhQVE9WRWRGR3VuTjlBU0V5WmRJOXJSSExUNTVlUU16?=
 =?utf-8?B?SFRPSTRONWxsNFI3djVRWDBDY1lEK04ydnZsK1p0ejB2RUo2ODhtcGc2Nnkr?=
 =?utf-8?B?T0RHL3lxUDhiWGJ4MVVsUFVPUGtkb1FiUWVSVUp0SVVZRFByMGxpK2VTZmhh?=
 =?utf-8?B?QW1SVUpvcHdxS2tqTkZDbTNpY0NsZHVuNjJRSVhTMTd3YVp0SzhkSHYvUmFw?=
 =?utf-8?B?UEpobCsxM1ZHSkxwano4QlpBVVNLeEhvOGhMZkEzN0t3SEdSVmU2L1VZV1o5?=
 =?utf-8?B?cGZEbFlScWtNVXJmMUFCWUVnT2x3cTBHY29WTTRCRys4Z09sd2Z2NXgySFNQ?=
 =?utf-8?B?ZEQ2OHhGZ00wZmhYSExacytESnVxRTJiZzU4QU5pREw0OXY4bDMxdUhxSWFq?=
 =?utf-8?B?V2FsaGUwaEZnTlVrUGhHSkZ6WDFTN3MwaUdOT0lBQ1pPeWUxUEhHSE1GUHFp?=
 =?utf-8?B?czFJZUpGL2owZG1vVHJWeGxYVlpSWW1SQ1JjNjlnaHZkY1Q1NGFJRjN0dVJG?=
 =?utf-8?B?ZE9CTGZEaGRaZkwyUnZFdnFMZ2NubytLaEQ3UG12bWNHZUJTcEFvc0RXYTFO?=
 =?utf-8?B?bHVGZzdJdEtVS3B3Z2JpeG5YOExBVkVRUUwwczljQy94OXQrNHhuMU9rM0lm?=
 =?utf-8?B?dzJUU29SQUt2VVQ4VjZtWS9tcW9DYnM0MUZTN3JJSW5kYmx6MzYydU4wbEJz?=
 =?utf-8?B?cjR5RE5sb1R0Y2xiRkx2TVdlMDNDZDFZTWQ5QXBKbmYrVUxoYmxjbEErbzNj?=
 =?utf-8?B?b0xZcTZnYWNESWgwTmRxYnNOT0RyanAzYklHR0xjdmIwNHpoNUIrSGVVUGdD?=
 =?utf-8?B?U0pCM0krMkNNWHFIbVcyRHR0THJ1c3FwUFdkem9CUFlXVnNJZk80emo3MHRI?=
 =?utf-8?B?REJlU1F1OUR3ZWF6SzkwY2xTT3JKN1NJWm1WcDNsajFJMW1LaXdabnRvbVg0?=
 =?utf-8?B?RnBCSnpJcUlCVWxBdy9OeU5pMjh6UXZPUlo3MUQyV2QrelFkYlA3ZVQ2dFZP?=
 =?utf-8?B?VmNiTmx6V2E3bEZMVGdiRDVuRXZnVTVoV2NYcEdRTy9LamRwczZhaEJWUmpM?=
 =?utf-8?B?NlRUTEhXTHBwWnJiWkx1VkgvbHVXRFJCU1haMU5tTEVWWXhzT0pxVCsrTmZx?=
 =?utf-8?B?anhQYTFUcm41STZxTUhtQmx2NDlCUnpyOHZzQjdFK25veVowMTNxeWRraXBa?=
 =?utf-8?B?clBXK2d1WmJ2bjBrc1IrM2lYMUxKNWFBR0RKNDlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf24ce3-0811-499b-ea3b-08d8c797a6fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:29:03.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5HPjKISI7cin9PzFQz8pweIauiFYd+nfFn7nXrA+weeIbvWp2DA2m6RaXV+0oDWLofjyn/99iPx7AQEi+QNvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4300
X-OriginatorOrg: citrix.com

On Thu, Jan 28, 2021 at 01:04:41PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid
> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), the
> behaviour of xen-blkback when connecting to a frontend was:
> 
> - read 'ring-page-order'
> - if not present then expect a single page ring specified by 'ring-ref'
> - else expect a ring specified by 'ring-refX' where X is between 0 and
>   1 << ring-page-order
> 
> This was correct behaviour, but was broken by the afforementioned commit to
> become:
> 
> - read 'ring-page-order'
> - if not present then expect a single page ring (i.e. ring-page-order = 0)
> - expect a ring specified by 'ring-refX' where X is between 0 and
>   1 << ring-page-order
> - if that didn't work then see if there's a single page ring specified by
>   'ring-ref'
> 
> This incorrect behaviour works most of the time but fails when a frontend
> that sets 'ring-page-order' is unloaded and replaced by one that does not
> because, instead of reading 'ring-ref', xen-blkback will read the stale
> 'ring-ref0' left around by the previous frontend will try to map the wrong
> grant reference.
> 
> This patch restores the original behaviour.
> 
> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront")
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> 
> v2:
>  - Remove now-spurious error path special-case when nr_grefs == 1
> ---
>  drivers/block/xen-blkback/common.h |  1 +
>  drivers/block/xen-blkback/xenbus.c | 38 +++++++++++++-----------------
>  2 files changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
> index b0c71d3a81a0..524a79f10de6 100644
> --- a/drivers/block/xen-blkback/common.h
> +++ b/drivers/block/xen-blkback/common.h
> @@ -313,6 +313,7 @@ struct xen_blkif {
>  
>  	struct work_struct	free_work;
>  	unsigned int 		nr_ring_pages;
> +	bool                    multi_ref;

You seem to have used spaces between the type and the variable name
here, while neighbors also use hard tabs.

The rest LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

We should have forbidden the usage of ring-page-order = 0 and we could
have avoided having to add the multi_ref variable, but that's too late
now.

Thanks, Roger.

