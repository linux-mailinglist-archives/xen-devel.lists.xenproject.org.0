Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97B40F899
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 14:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189368.339029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDS3-0006oT-9V; Fri, 17 Sep 2021 12:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189368.339029; Fri, 17 Sep 2021 12:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDS3-0006mJ-6F; Fri, 17 Sep 2021 12:58:47 +0000
Received: by outflank-mailman (input) for mailman id 189368;
 Fri, 17 Sep 2021 12:58:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRDS2-0006mD-CY
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 12:58:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fce17194-17b6-11ec-b697-12813bfff9fa;
 Fri, 17 Sep 2021 12:58:44 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-oqh7d6_nMy6YG1wRPXOCbQ-2; Fri, 17 Sep 2021 14:58:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 12:58:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 12:58:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Fri, 17 Sep 2021 12:58:37 +0000
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
X-Inumbo-ID: fce17194-17b6-11ec-b697-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631883523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RONU+ejaKqP7oeNza1QQPRqupv8noL3rm/46uCuwdSk=;
	b=MKDo8d1oRjK6WaQ0DOKgqksK5cJHMny4uooFgNXETFW9PWK9d6OKdUEL+NyKZjy4smBSEo
	h4OpRDjjuxF1JoimWmQi+R6JMLAZ6jz1hvdRm3Cr0c/8MAJa5FGV2NimfWJfPgQqaT5GdE
	ZPZWPaofrtT3/zaRPzFtjIjzXxNYEa0=
X-MC-Unique: oqh7d6_nMy6YG1wRPXOCbQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFEHw5XkJFcmpvX+NCQwd/9y1/kIrZbVzbNy3D7Woj9wQ3QYAdPHJsGjdkJ0sKg6QI5Jge7/m0J28vBMKfO7O8Cmn5TwWzy+GS4psUtalAKvvViDXxGSnkDHFxoagnBgGEHTKSqHDXr888qGNjdKaNmphpGV8Qm3FVbkZGLZBjcMhvVs1Oah6yJdloTMCK4RQnqW4eKfCymW3npndfDCgtOS6wAe7a17NCVdoddAN+EcRZmHdPiYKGEllxyFRskS+VBY+MYKybMbfWYrQ0dxeAjN/jo9kIKGpRzAkg0bMTAWUs1yC51tiMPHETRoOxSPT9tovtYocD+RDlP2d+gcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RONU+ejaKqP7oeNza1QQPRqupv8noL3rm/46uCuwdSk=;
 b=FY2uJA4cYtf9cXamrfAHu3QMOYpT746e86WlxSDPA2AjpjjWrBSIg2TAsvaLFnKZredyinfAtUUnuDvKCgFPAVnY8YfLH7h2es8SS8tAJaxKkv/MP3iY7/PCS4E8yVioRWgROS+80+tmrjy3g/2699O2gojQlVvuMu1SK4tWedIVt5PV4HW95hQDL2R91q8QmxqDzSc3VxB0Mx24bs7A8sbwPbRlRDfHsR23WzG+vLXv+X+A6bJxCSkHfejyurtfbf9OxM1ZVhM51bp6+DIqSHJgmC7BNuwuDrhuW+i/1V147BGMA5gKZhdT7VCJu+RuDxNbq1Sc1qpLo62wfgSYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/6] xen/trace: Don't over-read trace objects
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed07d2de-9354-6c6d-b9f6-4b325ca328ce@suse.com>
Date: Fri, 17 Sep 2021 14:58:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917084559.22673-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36c7304f-63bf-45d1-aef6-08d979daddc4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2701E861CD7C93499139375CB3DD9@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XM5JxTuwDEsL5himI1xL428sYXFotQpMjib8xLaKV6SddYxsspVsxWEgmYfvaetwZ9A3e+tji78c5NYCr9opjuuYZn5gSDk7DDeKE4HgqeqEXtimcpgZqtEF/+bbbItc3QNumfFEiMDQbgEHct4K1AnofhWu9BBVTiKTLR8pD4A1OpF6qbYnOuX/QTlRT0S/HZR96Zi1eQHJF3IHzNws9bhv1mIBl07tnc+Dl0Z3YNcagJprQbYX+pGMP+B8wAm2dHPIDUSyjcdn9Jo43sjuDlnHIqrxmnZh55Ng0WWjPFEfdZ2tWwv+ysViVpn01ObCaivpvcr3rbUAsV/PcrOAb2ChoO3SrvPEqxxKHBa58VSsuohhr65AKU0txSnoy0G131GPHKyazoWQYuSJGIlcvSSUgRwd5YlJs3CuJgT5jTmmsVg5GJy9UsQnkzYwqQ9p9xuhjBCoRFokRgWPKI1AyfCFpwD13+xkEVIdl2mpeoKRwmGqQdiEMDOMZTZun2Wd7OdAl/pc2sYbOVk55xsqC9XeiWH7Fy7g6CqQdxUfIKIIE9aWyjP32383zf1Z86GbqgudNQBCildq0w8Xa2dXf6pmU2E5GhGZugZPb6ZSDLt8PFCAQqs4aXq4d8YecHqs74FGtRKO3rJjQARtQKOvavON53RtRWHhfZaZeeX06CNmQLEw7GkjN0vEAA6gfkP0ZqY/PccCF81xyJwJroXJhrTHqB/ZDP+1CSfNcyFMPw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(16576012)(36756003)(31686004)(508600001)(4326008)(86362001)(54906003)(66476007)(6916009)(53546011)(6486002)(956004)(8676002)(5660300002)(2616005)(83380400001)(66556008)(66946007)(8936002)(2906002)(31696002)(26005)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vytna3dUdWp4QWVsalR6SVg4R2pnMHluTUtzcVVKdzVvTTZnZlQ2R1RFTjY1?=
 =?utf-8?B?WTE1T0lEa3lvdVBlc0lDZm5KUE5TZG11SjI2MFNsWG9Pai9oandOTXVQaExS?=
 =?utf-8?B?TVZhZFpDR3pxM29Qb2RubGpKN0huL2FkUFlUVXFpaDIxL0JkaFVnV3VEWnV4?=
 =?utf-8?B?SnRDc3VxS3F4djJUcFBEQ2dWSkFmNHdYVmZCOHZKWkNxT0FwRmpHSjJaMXJa?=
 =?utf-8?B?NXNXLzc2aHZXM2hLSFF4N3FJQmdUL2dkaWRRNXBZenR6U2RRa2F2akNRVVRk?=
 =?utf-8?B?MGx1cC9GdHNrVFBtd2NvdVpFQWhTUWZYK2JTajF3cHlTWWJBd1BWSUlpOVl5?=
 =?utf-8?B?UEQxMWJlSWVtSXorTlNBRGxMUkFYWVlBVzJwZlI3bENxVlF2cEtpVjUrZGFm?=
 =?utf-8?B?RlBKUDNCWjlnTURTTXBXQUcrWWxDdWliL2Y2UHBRWjBmK012UzBzY09jcW1X?=
 =?utf-8?B?akR0TXFKY0dDS1dKVlNmaXVKYzJJOGtEajMzRmpJTkFaR3hXV01ydEdPbURW?=
 =?utf-8?B?TkVyZmxicy92aW9QMHBGSUFoOWoxdzV6Y1Q1WWRzSjdiaGN1RnJmaDdNNG54?=
 =?utf-8?B?ZmpNS0hQNGlLRFpmdmJ1SUxjT1p2REtsSWhaaC9Td291eXZkaldIc2pzaGhi?=
 =?utf-8?B?a2NLZGR6V05sQ1dUZndKaFJpaWRiS2huOWgrZExRWDc2UHVSL3pyZnk4UHlE?=
 =?utf-8?B?dGRYbW8xQXdxYXo4amtLMm5md0kvVXVVUDB1ZzM3SW9LaUJPTm9ySHNoLy9j?=
 =?utf-8?B?emZMbnlRdHNvdWliRGwxSjdMeEZSYU5kWmcybjhkcTZFdG5pMk9kakF0NWF5?=
 =?utf-8?B?TGRGT3dlZzdQNUgrUFhWUitIcWhEclNzNUJxY1NoYTBDZlRVeHlVVDQ1Y2pK?=
 =?utf-8?B?ZDZ2dUdlUFdVWnVlQVhCREgzeE9BZnVQU1JicjlNRDl0L1FCNXNUS0ZpM1Vv?=
 =?utf-8?B?aFhHc0xYdXdNRDl4ajBpZ25pcnRRTGZzMVBLdHhmNVZUakFMQkplZUJZbkQz?=
 =?utf-8?B?aUtBQjc3ZlNid3RWUDYvcVhTN0tMakdMc3d2VUNPa2J5UVVHTzhWNE1yNFJa?=
 =?utf-8?B?L1hGMGtrRE15ZnpNdXVmL05VbXlrUEQxVUVhQWJrVzhUT1BRMS9yRzlnU2dY?=
 =?utf-8?B?emxQcHI2TGJhUjd6VC9IcUZFNURibWpROStFVENSN3JYdGRPVnI0cTIzVTlD?=
 =?utf-8?B?cis0TWJmbUxGcFloUmhQMkNWdnRxSUd0UHlHTHUvVGxXL25GNlQ3Z3VVbTh3?=
 =?utf-8?B?YnQ0bHFieDNGTTR6U0JkSzQ2c0ZxcGQwanNNVEJ5V0tjbkl3WkVuK1pUS0do?=
 =?utf-8?B?WC9YL2Y3SmdpdTdMVEQxVHVnM2k1K0NsQlJHRjJLUk81S0hzeTVTamNWZndn?=
 =?utf-8?B?MVQrWXZIL3k1ZnMyMzUrR1lscUdlSmxHU1VLRmswSmJaSkVjTHYzek9ZcW5R?=
 =?utf-8?B?OVh1RGlJTVkxVGFSTFhXZzJYMXZBTkg0cW91bHpFYk56YXNWWTRYM1ZSYUc5?=
 =?utf-8?B?Si9VRzcrMm1kZXlZNm5RL2pmaTFDV2VnM2tWaFFseXdMMnp3QkNEdWFwdDZI?=
 =?utf-8?B?UytLMll4eDBSNDhzdi9PbjkxcGNLQk9pTHVQc1haWjRVcTlHWTh1MXc0MWll?=
 =?utf-8?B?MHRHMG5PY1owVGRVbjlNWVBPQTBNTnlVUzJjSTdLYTBqVEVQSHd3UkZBbUgz?=
 =?utf-8?B?YTBTRzgrZmNZSFRnaU9VNVJDQTY0c2xkSkNmRURWcm8vRVRDMGVydm15c2VY?=
 =?utf-8?Q?Ovp5865mM57BFSS6CRSKG6Ircpxd3JiEIcp3ZiD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c7304f-63bf-45d1-aef6-08d979daddc4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 12:58:38.1391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMMptEYsm/4qK2uJMERSPawaE1qODn72iJ2l6xtXEeWT3xkP/FuRqA3VTIOXY6oWUS7+dFxDfJq+kLstH1BStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

On 17.09.2021 10:45, Andrew Cooper wrote:
> --- a/xen/common/trace.c
> +++ b/xen/common/trace.c
> @@ -686,22 +686,21 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
>      unsigned long flags;
>      u32 bytes_to_tail, bytes_to_wrap;
>      unsigned int rec_size, total_size;
> -    unsigned int extra_word;
>      bool_t started_below_highwater;
>  
>      if( !tb_init_done )
>          return;
>  
> -    /* Convert byte count into word count, rounding up */
> -    extra_word = (extra / sizeof(u32));
> -    if ( (extra % sizeof(u32)) != 0 )
> -        extra_word++;
> -    
> -    ASSERT(extra_word <= TRACE_EXTRA_MAX);
> -    extra_word = min_t(int, extra_word, TRACE_EXTRA_MAX);
> -
> -    /* Round size up to nearest word */
> -    extra = extra_word * sizeof(u32);
> +    /*
> +     * Trace records require extra data which is an exact multiple of
> +     * uint32_t.  Reject out-of-spec records.  Any failure here is an error in
> +     * the caller.
> +     */

Hmm, is "require" accurate? They may very well come without extra data
afaics.

> +    if ( extra % sizeof(uint32_t) ||
> +         extra / sizeof(uint32_t) > TRACE_EXTRA_MAX )
> +        return printk_once(XENLOG_WARNING
> +                           "Trace event %#x bad size %u, discarding\n",
> +                           event, extra);

Any HVM guest looks to be able to trivially trigger this log message
(via HVMOP_xentrace), thus pointing out an issue in a guest and hiding
any other Xen related output. I'd like to suggest to adjust that call
site in prereq patch (I'm not overly fussed which of the two relatively
obvious ways).

Further sched/rt.c:burn_budget() has a bool field last in a packed
struct, yielding a sizeof() that's not a multiple of 4. All the uses of
__packed there look at best suspicious anyway.

Jan


