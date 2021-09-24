Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C784170F6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 13:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195325.347981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjWl-00073O-1V; Fri, 24 Sep 2021 11:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195325.347981; Fri, 24 Sep 2021 11:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjWk-00070x-Up; Fri, 24 Sep 2021 11:38:02 +0000
Received: by outflank-mailman (input) for mailman id 195325;
 Fri, 24 Sep 2021 11:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTjWi-00070r-Sj
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 11:38:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87dce733-ed67-4177-b44a-08542309bee1;
 Fri, 24 Sep 2021 11:37:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-VgvvKEGoMpWqXG4iDbmBgg-1; Fri, 24 Sep 2021 13:37:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 24 Sep
 2021 11:37:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 11:37:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 11:37:55 +0000
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
X-Inumbo-ID: 87dce733-ed67-4177-b44a-08542309bee1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632483478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2sBTeOOjlsr88v/K89sm3OS2YnDx3P3vKYIUokmi48=;
	b=fWeDJ4bF3q1mzDeQzTlnlH4OvNJZTkfA6+17cSqpcFJJS4LyNBmsr2IsX/16uxSI6A4t3Y
	AEIjgM1NYTKxEcGtcwBzhsSilvIUhhdgs1Sh5Oi4wqQ5jGQfpDQzv4X17+BfUrPI6M77wj
	+mE4syPCBXoPz4xhswdmkmuim69gsJU=
X-MC-Unique: VgvvKEGoMpWqXG4iDbmBgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqwJ0VsO+PwTff6owfUfDq9QyRBJrcmRMIzH3SCgOOxBOqiPNz8khhmsLkxi7y5txZL5xcRDj0e/fyu+8beYInWZfzg8+zuCNj0w2zsUa32mIlpYyv/Faz6OkR6HWjYI6mqvEOl6LEqZTGYQs1xKMWYW8vuQZSVAxfD1DOWr1Jj6AhtsqpsHOljgBMZ7MWn4mzHLHrCdUzHyUD3VMf790CjpUioYSZS2Gno7CiF/asI9q6Ov5crbclQI+flvTnYdpr0qiAKVhMLx/wy4aLJgroRM+k7pBrNMYK4PW59ifHFzlL3LCzrmss4mGVgoptOU+yhGHdoc1W+gLGLXqSyFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=x2sBTeOOjlsr88v/K89sm3OS2YnDx3P3vKYIUokmi48=;
 b=ajS+qonkuLHlE5bK93nQ0K3Kv6JB/npJoujYIhQBKz5nnJ8e9Zsv2Y+r31f1L+p3IGzXcLlP1D+6jxYdg84XF2LOdy/1vlQHsmz23i/9Ks6JrIWZQ363Xr97zcLqrQXbKMHChzJj1DeEIEg8M0bTepMRcwxYGzpOHEthDxWZ652LughN3cCcpps6OKU3UjopVi5XaMgK0uSSD/scICBYnXou0sXheKnq8YhQIt2qasw6nnf9fEpNgMrycSY6jMt7XBqBztxh13TpxiNs26gseUivu92HkiqrXGxSTzga86kmsaoWgaZZUhDMUBoKMoVjzTYmhGZ379R+3GTGD9f5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libxl: Remove page_size and page_shift from struct
 libxl_acpi_ctxt
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210924110500.25412-1-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3d86499-3c1e-6cac-9225-f64b101c5478@suse.com>
Date: Fri, 24 Sep 2021 13:37:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924110500.25412-1-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 521ff169-e0da-4135-6ae8-08d97f4fc08f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742D55108E9960368F8FD8DB3A49@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v21MI/IJPJEvoCML1DAZUrw7BXTMZM8gGi7T+4qh2BXhZN92BKt751WMY/IL9JQQ8BWvrpQriT66NQnOgkWL6TxMqY3XkhRVNADN13nRLa+tOnNOdN/7gDrCV0Stxq47jGfQ/WdgZtrUFYfeUP1ovddSxWp8kncEZHC+RnolauurjyzK8OjbzjQmULT1DwiX3mUG9HLLsZl6qkpSX7sKax4ZSJYctQl06fv5i2b7Evd+vmmn1nolc+vdMA5ykRM0eziGPXPHnx7++fZgNebD4QDikaalXZ/B9zE+ZC6LPQSeXlHgDmSM0gWgFHIHDOjvMTcFrbJu7vQUB5M8utLntC7nesEsKS9C6W/nrfiGFf+88dtwQWGe2Zb/M95/iEKBNO35RZMLxjxjxj/QDaYK2f6uWP6oGfarhaU5UGxgdWS9Js9K3XoMOZPP7j86W4w4/oswvJfvhJKn+8lynL+J6xhDX3U4dLbiYwd2EyOFrAPXIR8HnWFgbldnyDzTk84KBh6lnJJvKFK/K1wGaaMB19qoO+0mxDGIMpljvzZl0UkeSNzt2e7Brpj1LMA/OG/EQcYtTVdqR9h0FVfzX4Nms9upEmaf52c3hN051QzrDiH1IHRHBNWcwMWoOi9LKGhJTXMVzPYpxTubu8VcbvgaJQl2Ja1ajkgpTb0w93jGyjOU9C8/b4Gs0Us1/qvrH9LqIJVQ6JPfqSuFluiZte4f3aA1nq0Z0y1DcNIbfhHOExI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66476007)(66556008)(6916009)(53546011)(8676002)(38100700002)(956004)(86362001)(26005)(66946007)(54906003)(186003)(316002)(6486002)(2906002)(5660300002)(508600001)(36756003)(4326008)(31696002)(16576012)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkR6Umh3anFkZVB6U2xaTjdma3hTS2kzNlhPUlVGSjFYTnBRZTBsbzBpTHVJ?=
 =?utf-8?B?UGpGa2Q2ZGV1UlNjTHQzVHpvNXpNVTFrcTFQenRDWER3WCtSSU1WaVpxM0FZ?=
 =?utf-8?B?RlZET05SaGZDTTRERDRsZFA5a1NDaTEvMjZCWnVzVFhQazZNWnlWbjM2Vm02?=
 =?utf-8?B?SlZJendXdmNFSEMzRkdGZVR6N0VZMGE2dHFBTExZcE0yY1JndWhmNno1QThX?=
 =?utf-8?B?TkIvbGhBandheW54YjdNVm9FVUxLNkZFRS9KdENBMFBSMUZ5TytEYjFIYkhW?=
 =?utf-8?B?eE16VjVQYlJnUmFUMnY1aGhIT3poTFpTbzd1ZGVHR0dHamU2c3E3UEx4ZDdU?=
 =?utf-8?B?ZzRRNWpYRCsxUVhhNmp4ODFRTHFsN09ZUGNxb3BVdE8ybXFYK2ZORkJGL3ZX?=
 =?utf-8?B?dnQyb1BGMlVPQzdpeTVHU0FvU09McUhZZU83SFNmc3FjcGxiSmdZZnYwU2dR?=
 =?utf-8?B?UW1iT0lTbGZxcDBORllJVmw0Und5cERUUVJDSlhQK2ZxUytzcmt6ZXJFd243?=
 =?utf-8?B?TVZDT2dtSjljT3VkZVBFMlVSdVU2MVhjTEtZU3A4N095R3BvQjFBY2s3bk1N?=
 =?utf-8?B?T2c2elY4c2hITHZRTEdKNVlwSUpTYlFOaU5YbXpubCtndUxzN25uTDd4d3Fv?=
 =?utf-8?B?ZkpXa2ZYTXdHUDlxZnlnbE0vN2NUWmlEVC9zVFBoSTNtUldEMlBqZkdSakNO?=
 =?utf-8?B?bGt0TlVxalkvRHNuV290ZWQwZDlQQ25NZk1Qbk4zZUFSUVBkUTJSdEZpU1M5?=
 =?utf-8?B?MUQzNmZsQW5xVVl4bVZleWNGeE5DWnptbjlSeEo0clhNUWhoLzlkN0tFd0Zz?=
 =?utf-8?B?NG9BR2dHSkpNS3BRdWVCbHdDTzJ2OVkrMmR6TjZ6REV0UCtiaVVLd0E2dEF1?=
 =?utf-8?B?eHU0QTMvaEsvUmxvSi9NVHBRN0d4Q1lIOStYNEM3MkkyRzhpdFdlWGNOWExL?=
 =?utf-8?B?U0xGcE9LcFBuajVEWnpHMFhZSmZBTHFDOUVObUhPMzFsNXM3VUM5LyttS3Jj?=
 =?utf-8?B?REFkWkEwOUZabE8wMU9NNDVBcXpvVDNqRWxzZUx5dWJmTWxmZ0pGVzBTcTh0?=
 =?utf-8?B?V3U5c3VnczJqZSsrdnUzbmpoUldabHBHeEo5U3M2bm1SQzdiZG13bWZWcWRU?=
 =?utf-8?B?dUw3RWorcDBmdXpMS2M3MEQ5ZTF1OHVpMXVHM3BNNXdrSGkwSVF5WGZzSEdn?=
 =?utf-8?B?VjFRSjZrZzZnMUVYeS9JOGszM0o0WkNjaTJBYzY0SWU2Ly9iVkNkbWpKUjRv?=
 =?utf-8?B?VTVhSGFZL3phN3o5dVNFMHBsMzMzT2tZSnFkUEZXVzNuTjMxYWVUbVBiNjlz?=
 =?utf-8?B?bVpzOHdleVNTU3hhNEk5TDYwQU1qK0w1MElPRXdoYTdqM2x0NzkybkhZZW0w?=
 =?utf-8?B?a1o5b2hxanFXYUZUSGxZU1VXUFFMUU5RQUl4NmxWM0lwSHNNTTREZzUyaElI?=
 =?utf-8?B?STlGUnBUOTh2RGhnaVlLY1Bubzc3QVQ4ZEkzU1V3TjFDZml5N25DeHlsZElR?=
 =?utf-8?B?Mm52M1Zic0FrSDI3dlFmY1l4cG45eDNqWVZhWHpRWXlWY05KZjJIeVhQS1U1?=
 =?utf-8?B?ZHJtaXBxMGk0NkFkcGM2WEk5KzJhYURnaXZobDM4WU1USzdGZlJkZ25odUNR?=
 =?utf-8?B?N0x2ZTVrWTZTeXlEMm5aK3ltZWlIZ2EzRFl5cVdXdEhBeEt3VFBFOTdCTk4v?=
 =?utf-8?B?UnBzeXpkVmJ1T0lpekwxTU5IM3ZhMks5NVRCKzRoWVBPK0lWVnNrMmlTTE56?=
 =?utf-8?Q?vPP4uWj/WyLpYW5bzCcpZi8AsnwzDgFpBQvxsP5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521ff169-e0da-4135-6ae8-08d97f4fc08f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 11:37:56.0753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7Q+jGnzXgYO6WX2QqUwvRA5PARQ45tEM1s/FwvpF3YsDkxuLKy7i1hToUF4s1hT09aw9UptTq44ZKv/QT4hmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 24.09.2021 13:05, Kevin Stefanov wrote:
> As a result of recent work, two members of struct libxl_acpi_ctxt were
> left with only one user. Thus, it becomes illogical for them to be
> members of the struct at all.
> 
> Drop the two struct members and instead let the only function using
> them have them as local variables.
> 
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I would like to suggest though to consider ...

> @@ -176,20 +174,19 @@ int libxl__dom_load_acpi(libxl__gc *gc,
>          goto out;
>      }
>  
> -    config.rsdp = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
> -    config.infop = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
> +    config.rsdp = (unsigned long)libxl__malloc(gc, page_size);
> +    config.infop = (unsigned long)libxl__malloc(gc, page_size);
>      /* Pages to hold ACPI tables */
> -    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES *
> -                                   libxl_ctxt.page_size);
> +    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES * page_size);

... using page_shift to replace all multiplications like the one here
at this occasion.

Jan


