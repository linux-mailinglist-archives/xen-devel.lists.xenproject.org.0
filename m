Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DCE41907D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196480.349343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUllz-0003y4-Vo; Mon, 27 Sep 2021 08:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196480.349343; Mon, 27 Sep 2021 08:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUllz-0003ud-S4; Mon, 27 Sep 2021 08:14:03 +0000
Received: by outflank-mailman (input) for mailman id 196480;
 Mon, 27 Sep 2021 08:14:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUllx-0003uX-Lv
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:14:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddfae81c-1f6a-11ec-bc42-12813bfff9fa;
 Mon, 27 Sep 2021 08:14:00 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-zeFcZcVPN6CzNfpcrPhFTQ-2; Mon, 27 Sep 2021 10:13:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.16; Mon, 27 Sep
 2021 08:13:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:13:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0027.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 08:13:55 +0000
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
X-Inumbo-ID: ddfae81c-1f6a-11ec-bc42-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632730439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1odbPXqDZnzI/wEIq/o1a4C0cKDMDP/eIYH7Bq3N3EU=;
	b=CcLjgBzcMuSq/hQZJJF/KPikfOJwY7tFuA6vDTEpFqMzpY06lwtKzSegLmVZ7ra5DYlBEZ
	OLq6sRFzHM0q5BIaLyheCT69Tba4VoidANkdAZcZ49q1qgeyvKV7qT7TxzxdHd54b7la+3
	idYb+0G/SsvR2aks4nyJlgUexIE/Eeg=
X-MC-Unique: zeFcZcVPN6CzNfpcrPhFTQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4hd4tJoc0eb0YxE9QCEmXr9BMiMLybjWIymb6wKQJOPcEXxDZWqd63CyO8ifau6Or8Jcn3+YdzoCUgeRS+o0AqgfJru1RVKCjXRwXQgV47e3m/hccNN9cDPTU/fwR4QCRf8OU9gJ6RXuhqaIrZtygicyrboZVqSGo6u5J0IzWu+UiyJVfu1sLHoAldd6EPYyQ2lNVLJTc+7/C7Ag1meb4yf1nqjRJDL/lf87+dydHXtOnkvX5RzZtH+WPtELsLv/Facmi2suqN0udJ+/K5BEWxaZCThCoxK2twFuekXjF4aex7VWfEJvpgxwtFM4eIyC5ua9gQu+r8FtFuccNR24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1odbPXqDZnzI/wEIq/o1a4C0cKDMDP/eIYH7Bq3N3EU=;
 b=JVAzSlzTj0gKFoQdnP+WjqGzJZExXGYIdOeGLyD+0T+33/1hRSKb0M35O5GebWJCi/L8ViRuANCJgMmvMegmJMxxSvwFJCen/rheairnOJ5TOh4rYxSI8rJNQSZUIFzrXxf2vfiSavHVee2Fj35EnP8z8UmQCzHIZ/WPY0IXKiWmDktkhjDYExmZiD+6DLZKaF5DOIJ72XyaAU6NzDQosYnHy1nj3nPNNSTnmDV6RIJotK7so0EU8l9EdB6utXX4h4X39Y91ULT/v1ahDjAVOuGR3vR5/lV8TpGvqZQJB1K5Y19IIRsX7Y4Z0DlKGSyV9ciDETRlFGpwmRjzrS5Umw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/2] include/public: add possible status values to usbif.h
To: Juergen Gross <jgross@suse.com>
References: <20210924150424.10047-1-jgross@suse.com>
 <20210924150424.10047-2-jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>
Date: Mon, 27 Sep 2021 10:13:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924150424.10047-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0027.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b401e9a-2a99-48f7-9c23-08d9818ebffc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392D464A3C41F3F377DB4C1B3A79@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vCWbOIzksNNyfI5a6Hy5FOB8dPRrBUYkFXCjg4n485sqFXuYaj88MIFx5TyMrGrEo0T1s6q+8VELU2b5nWtCvAjmxX1eaNhRBSSffStQLb754hF7YyarK+5zcq+/JSGg+y7zxj476ytirlALbN5Yx4aG3PQVFcKuM8w32wSBhqE5qsVsHeGNezG58MGTy6T+GrM5oM1MMe/dGVlWodlRPnhqovxgij6FfkZB/E5Z9IW4cZo8caU1hpRoAzGilvc6taKgfo8+CqjD/Ws50jigt9gwXinZHErjBA9xVplApCsRtbn2fcWlQhE2mnkpM9PUCeVo5KADB4ej7s7PYgvypxp4LTzROIXyIVi3FQUBpC/mJg7FPl+H7+rJWAB6ZUp78PUaeq3gJ9Ytfz/s1r4nC+ZRSRMsRkx6/6rasJAGqWkbpf5vbasfhN36QmJSWgQCBs2ecRiwrXh20bICiiusOTO5QGl5dJtpPQzsNLA0bL7zNAkjNF26woo5G0W0UsrHoYFz0XrNfYsxRLVnjmrA0e2+/m8uAnrmXU79phslYiLNr44H/sH5H5p9/1h2vFKXEwPrPZ4l3+jc5nc1tuNaXAjuELCB4O9+IPkt6HPzEj1fc8ODyW0Yv/0FZ3C+yI0l2rvTykX2TQ94o7RF5bPCmKigYeYrDBCSeFbn3ATX0O0/40o5enFQUOUlXMUbfmCQmPlP2wpRNF2VnyZxGaSzb91w79Fscre2fVH/6dEp6qA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(31686004)(6862004)(83380400001)(4326008)(6636002)(5660300002)(66556008)(66476007)(66946007)(316002)(16576012)(2616005)(53546011)(2906002)(6486002)(86362001)(186003)(36756003)(956004)(8936002)(26005)(38100700002)(8676002)(31696002)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTE4S1VQOGJxQWlRTGdlSXY3UzE2ZXFPNFYwbGhEb2s4NVhRU2JIQ0hPRG56?=
 =?utf-8?B?RmtFeDJIN0d5VWttRzRjLzFsNThMS0YyczA5aDg0MXVRc0lRT2lpbWFlWWhF?=
 =?utf-8?B?S084ZG16d3JzUysvYXcvQS9YMVl0TnNvbEs5MitjaDhVMVRjYXh4RTVvQy9J?=
 =?utf-8?B?N2dOM0NhVmUxWS9rRDdBL0Z5VzVXdDNwbU9LazBDM3dPdXVadXZ3Wk0rYlp4?=
 =?utf-8?B?SFRTQnpPUHlralpJcmc3K3RyUzBSWEszM29UUis3dVVRb3g0WHo4STMrQmkx?=
 =?utf-8?B?WmRxeHplMk1PWEFTRUh1MWpBVU55dGM2UUJhbzU0cGFOeEIwY2puN2hIR1ov?=
 =?utf-8?B?aVJTbUxUQzR1b0lEb2wxcDZ2dExNK2xML2gveTJVb0xZV0JEa3R3ZUUyVUVC?=
 =?utf-8?B?ZWxVb3REcUY2TTZTS1hybjQ5bklmalI4WWxvY3RwYlN2YjFlNDYwa0wxaGM2?=
 =?utf-8?B?bnFyM1Bqd0k3MHY0cGtvV3BIYzdsVVpTU01TMmJsVjJnNk1YcE1LVTM5cWVG?=
 =?utf-8?B?WDRXQTI4U0V4RnY2TXdDS3ZOM0owODU1dEdGMzh1bFhkZGJOS2pRd01relU2?=
 =?utf-8?B?L3NJeGdZeHVia0V5TDF6VFZYc0swZ1Z2NURiNlE4aFp2VHhWbnZjelRkdjg1?=
 =?utf-8?B?ZGt2TG9DSkgydHRTWG9BbndDcVBSV1I3QjZuckRKL2RTNVU1a2xoZUpWSTRY?=
 =?utf-8?B?S05LaUZtY1FNcUlMRjYvZFVDdFd6ZFFiQVJOd2VjZjdJUmoycDByTTAxT2lW?=
 =?utf-8?B?eHlZRU5DMWg0OUU3YTlDVHdTNkhiZ1JGa0F1emZLTFY0eWRVbE1ObXFKQk4z?=
 =?utf-8?B?WU9sY1MrdTE5bGNWcmpXWEF0aWdkRE02VUZuWE84SFNSODkrR0tJaEY4NjdB?=
 =?utf-8?B?ZU16WG9qVnJENGg2WnBoWEE5dG5RaFkrN3NVM2dBUGZrUVhJd0tFUnlEYmc1?=
 =?utf-8?B?YlJWVHAydExnRm1GN0grRFd4VHRVeXFNb0pnNFJZZENNRXBmWHd3eGFPOU1j?=
 =?utf-8?B?MlJqVzdNQUFmTUhXcDEzR3h6cDJjL0o2TUw5NmRadFhCUStweUwxR04xZ3BZ?=
 =?utf-8?B?Mkljb3FQNjdPaG4zZlQrUnFnUVVrM0k1dGdabXBReFRjWUVONkZyM1ZnanQv?=
 =?utf-8?B?OGRPdUl4bkV5L3NYeFBteUI2ZTRsUmhIYUt1dFg5WXpncWhJbWRYUW9yNCtw?=
 =?utf-8?B?cm1idUJRSW9UOHdSaGZ4bGxzZjhQbENZM0owaVlQWXZHNkx6S1JTVGdBMnll?=
 =?utf-8?B?VG5xa2xZV3gvSTl2UGEwUW1uQm9EbWNoVU8xRm9BK24yWmFZVDdWMEd2d3Rv?=
 =?utf-8?B?NTRwZ2tVQzl2cTU1NGE4ZXdCT2NlbHg2eEg3Vmd1N01tME40dTEveWdnSWRE?=
 =?utf-8?B?T24vVlpGa3NLUXN3cEJFMzdLcnRTSWRhYlBoYXFPbW5EdjFOUDFZWklyR2kr?=
 =?utf-8?B?SHV3aXJCK2twdlNlL1d0K1J5VldoczZrK0dzcUczV2dwbzI5OGdBLzM5eW80?=
 =?utf-8?B?V2I3eENoNEJ0bGt0TDlsVnVWdlFqa0VEc2k2K3JTWWx4dDlPUXBQNHl5RytJ?=
 =?utf-8?B?ZkdMdFdGN2hlZWVRa3ZOZnIybkRZQUxJNkovY0RCZzJtbmFOOWN2UDByR2gx?=
 =?utf-8?B?ZGNhcEl3SUZZV3RPSnJpK25ydnkvbC9OOUx1ZXIvbUFvSXlTVUtYMlE2WmFN?=
 =?utf-8?B?VWtIdlpNd3dIQkJmVitWWjgrZDlRaGxTYXFiNUtuUERocGRHM1h5QnVoR01p?=
 =?utf-8?Q?ShI7q8sp+N/e1AAYeQ3SDT1/ELfFbxhjWggajlp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b401e9a-2a99-48f7-9c23-08d9818ebffc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 08:13:55.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsjC9JhBZWDi12L38zmTaKPcESJUeMURjpwyTsQfQedG9o55WC5Z2H7LymjRRhk1vNL3O7aqOmZgX0RjdrWUNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 24.09.2021 17:04, Juergen Gross wrote:
> The interface definition of PV USB devices is lacking the specification
> of possible values of the status filed in a response. Those are

Nit: "field"?

> negative errno values as used in Linux, so they might differ in other
> OS's. Specify them via appropriate defines.

What if new errno values got used by the driver? Would we alter the
public header every time? Or is the likelihood of further values ever
getting used vanishingly small? In how far would it be possible to tie
these to Xen's public/errno.h instead?

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/include/public/io/usbif.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.h
> index c6a58639d6..fbd6f953f8 100644
> --- a/xen/include/public/io/usbif.h
> +++ b/xen/include/public/io/usbif.h
> @@ -221,6 +221,13 @@ struct usbif_urb_response {
>  	uint16_t id; /* request id */
>  	uint16_t start_frame;  /* start frame (ISO) */
>  	int32_t status; /* status (non-ISO) */
> +#define USBIF_STATUS_OK		0
> +#define USBIF_STATUS_NODEV	-19
> +#define USBIF_STATUS_INVAL	-22
> +#define USBIF_STATUS_STALL	-32
> +#define USBIF_STATUS_IOERROR	-71
> +#define USBIF_STATUS_BABBLE	-75
> +#define USBIF_STATUS_SHUTDOWN	-108

Nit: While probably benign for all practical uses, these negative
values nevertheless would better be parenthesized.

Jan


