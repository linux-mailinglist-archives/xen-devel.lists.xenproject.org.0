Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237AE307438
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76894.138959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54zV-0006rJ-RG; Thu, 28 Jan 2021 10:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76894.138959; Thu, 28 Jan 2021 10:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54zV-0006qu-Nk; Thu, 28 Jan 2021 10:57:33 +0000
Received: by outflank-mailman (input) for mailman id 76894;
 Thu, 28 Jan 2021 10:57:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umji=G7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l54zT-0006qp-IY
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:57:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea38e240-973c-475d-bc76-f11f13925842;
 Thu, 28 Jan 2021 10:57:29 +0000 (UTC)
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
X-Inumbo-ID: ea38e240-973c-475d-bc76-f11f13925842
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611831449;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7TzwNvkjtjHujOYlekyln708LCyT5XlbsQ90Oa+3DRA=;
  b=EMLaZLKjtZO4qPB1rICJ4wlFV+FEqubFs2V+HJVDa9k0zSMmpvUrg4g/
   uIQai78xiAPDvNqOv/4a0UL5UhYKkdGX7cHQl+vX2o5Si7EsF57RNm5zk
   q1nhD7n+QuF1cQmguVFOIS9pcNCImTT6wXm6X6elS/A83+jPXHUQZ2qof
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YvYKXkQGRvo9kld6yi43dzsEzdadvpz+veSa0gRaj1m0TxqBvwk5ZtzzzfVcRNgrDcmsGJBu9E
 Ep4v149R/4WtdrTynK/TuXGhvX92emB3dsAaVnhawmEVNiBUxZe82on2I2HfeozeVYNw71O9IF
 t9Ycv1CV56iVbyvaQn0W55aSOmOLyQg57Ft1l0SIRH/aOTTdnNoZYrA3HaeQa3XfPMbevFwO6M
 RGP9+kC/UMNQIgCVq4gNQRQPCUIj7WSaqianjZfLPGg1ROgR/kjDnScZ/0oc2r2aP1qTrltTfX
 3lo=
X-SBRS: 5.2
X-MesageID: 36090031
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36090031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrRItQnxHmprfZwsSg82E3NIcd9CsU+LxqnM0wqzztg8huj9BySACXoIHn7pTaw/5OibzqhNBqV4yiyukXu0QIxSYT1ebUbq3cblUcxCcmiw0vm2SuZ8MMpWueaQpU8MZgZ37jx0J6o6boY7Q2zS6eLk5oeiBdsgYKm7ST+GNbZqmHeyAGAKjVi5pVTiEKuxwzpR6hXWN9Dc0uQIeZKCTt2lb7bH1X/nJ4QWszp2dQO5edr2pRttVlm0LWGsd4CFmv1hpCQF9+NyXkQY0iA6yKScjcZ2QCoqvKuDaV+zydmmI94xtWWiSkvyUPRyPH3jLAvSY0DhJx9c/wmH7+FQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wmWty2HyvgYw0/n5W92Q4hsgybxFbBWNus9AiiqNB8=;
 b=UYNcrqmHUIx1npYR9S3nqHtauwfKNiJnAPYIBh3vg6c/kg7UOSH2YrryZ/rYbDI4nediy+1dDio35CNS/nJTdYFjG0y+RYm3rY88VNXUSNSkGfwuh9EDuxVI4CoEsGkJsvR2b8bqjFEtX+Naap+iwFyFs52R/0P64WC2oTqvBK+Fqg81muBI3UZSg2EE1QRVbOnondZlsAC60bqJthOz1P9WWqee5u5ST+BYQrhQDckpjFZDUsrB4PALrHFQEr5Rw56B0oicJqB5mKBfUOIHYbi8sNbI7h6Npb0y5f+FABNJkZYEayNFS/tPh//fnrQFMd2PqlOFZkCeOWfr7+tVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wmWty2HyvgYw0/n5W92Q4hsgybxFbBWNus9AiiqNB8=;
 b=MAzS1UIaXpFJiEhkMNZzMlprXdiQ4As/+7UMGEijM0Pv+t1IqINi9YKMk3ZgTHykPVB6Wsg8+bxlKkWQwz89YvDZmoX445kXsfOGFvvEtnN3C1Yw4qx0L9fx/YStmCF7VTUqnxe6R7O2OINpwHO81B4/czRHxPqYNhJzTCnXh9Y=
Date: Thu, 28 Jan 2021 11:57:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2] libs/store: make build without PTHREAD_STACK_MIN
Message-ID: <YBKYkXSMSAGnUXZh@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-13-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126224800.1246-13-bouyer@netbsd.org>
X-ClientProxiedBy: PR3P191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c39946ea-924b-4f12-9814-08d8c37b7fa4
X-MS-TrafficTypeDiagnostic: DM6PR03MB5337:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53373B761A52D0CD5CD9204A8FBA9@DM6PR03MB5337.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EHDBJy55hBNqMK+YzIsLDBeEIIa8XoRTiZUfTY9whK+tLmRHKTZxYheyA+bgkmhZdxzIMpdzJyuUqnLGvlx7tUQs+bSMgSTPFTy0Hy0LMHZdDJtXTHWdCjDrOQNTm0bxI0dXA+H/TykRSfIUEXxWwdAImeowVTdYxXubmqRoTTjYNu22CdRHE9XPvezplyxpcd8uEVbPZZEOA1X62IPdZHRFoa5pIS+QQK/N89pthrhNWCgtEZEsRhYkoIAcqd1h6flW2wE02Nsy/uUK8qvBQEDXmaAofpcX/GDxOHbFOCoxBR7kszhjpVrECuqERTKXUGptzlovGjaYxeCqI6sgGsAlpsDW8bG/ZnPtgK6PBQhyjGakxIIfIhbpE2fA2YCCLX7UQRpjBFV0myAqAwF6VJfgsCh3LCssRxGorktGj9I8G84AI7nEUkZKAiYsNfpa33upqOIpT1CH62HB284vO+oFh15QZVCPy1zXCuk2dONfS24LPySoi3ci3liXcz8kk3jnQ27vp03+7ING7hnq3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(136003)(346002)(39860400002)(376002)(85182001)(4326008)(478600001)(5660300002)(54906003)(6486002)(956004)(33716001)(16526019)(26005)(6496006)(9686003)(6666004)(186003)(316002)(66946007)(66556008)(86362001)(2906002)(66476007)(8676002)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VG1WWCt6a0Mwck9Wc0JjWXdseG9udW16OWsra291TzZ4Y285anA5SElqVSsw?=
 =?utf-8?B?RkVFQ3Z6d0I4QXQya2o3R0dRamZGc3FzVHNWNUFIazR3WVl2MVZMOEJNVVJK?=
 =?utf-8?B?cGZGWFJNVFlCYWNvZ2VzeXF6TTB5c3NFMXdaeGhUVkJJYUpTYlBNTTR4aS92?=
 =?utf-8?B?RmdoSE9OdmsxZTY5MFZZck03M29oR0h3bmRDRGhHcTBQS2tWY0R6R21ad1V5?=
 =?utf-8?B?ek1lUFVxMHY5MnYxZFhrK1pQNEVjTmpLWldUdG81YXJVNTBEN0R0MmRCMEZB?=
 =?utf-8?B?YWhNTmVqR2RubHI3aG9VakVERm1iV0dDd1hWSWpGUnN2YVhOTDJrWkVpV2NQ?=
 =?utf-8?B?dGtaa054L2RNK053NktuU29KSWphOVpMMXBVTk5paks3NHB6SmZBOUJkMDhM?=
 =?utf-8?B?blNRcnJRZHpFK1JlNTN2TUlUako5TXVTR2MrM0p4TjE3YzVEZldrVWpOelR4?=
 =?utf-8?B?YjI1NnNVRFlZa2dKc095VWMybmxTQUZUL2phN0pCVWE2QndGdElwOGlRTGMv?=
 =?utf-8?B?aEQvZHhCaFJXV2k1N2JaUExEanVTM1hQdDkxZnRLUmpwRU5RSzNVajIrUTRn?=
 =?utf-8?B?WDk4dENVaGNSZ1lBSHNpaDZ0dFpTUk9DUWc0Uk9nVG5KSHEyL0J5bFQ3cE1M?=
 =?utf-8?B?Qm15UFFIRFhKdk1ySGFJNWlvMDZ2b2ZtOVVKaGg1My83emg2eTZFaGpTNUtn?=
 =?utf-8?B?TlYzL0ZDMTNDQktCYmlJWXo0d1h2ajU5cUpOVzI3NW02cm1iK2s0azJybjUv?=
 =?utf-8?B?VnlnTGxHUzRPRkgzL2IvaHdVRkxFVUg5bzVsUmNSa3VreGlPclA0TUxNRWQz?=
 =?utf-8?B?d0hORTZaMkZWSWJaaWthV0oyWWtTK0tqcDU3VXYvUjlGdnRTcElnQXVaUEVI?=
 =?utf-8?B?elhIVXROaGorblJXUTAwak1oZ3BIcEF2emI3aWZ6Mit5YnJ5OW14cllOTzI1?=
 =?utf-8?B?RVhLaWtNZ2tDQUVCQUY3YUgrUXBHWmhTZThYUlhYUFdHNzNNYmtWM0libGxk?=
 =?utf-8?B?U21uMHljcUN4dXh1a2lyaWNYWWljNFdJM1ZqNXZUZmdBelJGUDlIdEgzSFAy?=
 =?utf-8?B?Y1ZWS2ZyOU9hUG5UUHh5TDArZVd6dHo5dlU2NGZTWWlsREhENG1XbkhpM013?=
 =?utf-8?B?YndGYVdwS2RsM0JjZEVFZ1pSaTlUaWVZN1pyd0NHNGxQdlRaaHZ2TTU3TVVD?=
 =?utf-8?B?d0JEdkFMMWRpMC9tZ1ZaTndUcWhCNmxCd2FKc1Y3eHB2d2JURTlmWDFVUTBh?=
 =?utf-8?B?L2hobDBZMmJWb0pPOUMxa1JORmliNUxmVFlaUmVGSjRXVHptbnlzWVVoL1RW?=
 =?utf-8?B?dDFvaFVSYVlmNGh4cG9sZGcxenhmb1kvVkszOVJNVjF4S0NPZDhZa0ZaSWs2?=
 =?utf-8?B?bm14enRKSjIyY1MwS3daa3BxZm91OFZzSG1mRCtWY0dXaXRiaXF1N3NVL1d4?=
 =?utf-8?B?L3lkWXVXYTh0Ty9WV1NqSzN0WVdCVnR4QXNKVFlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c39946ea-924b-4f12-9814-08d8c37b7fa4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:57:26.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFKpKnvTvNE+BkX03z21GE5vv/lUfti/v2UBmeSgyj3+VNQLpw6vEBNzVBsgx1nKUaM4NHipCbbCcnSEZ/c7qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5337
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:47:59PM +0100, Manuel Bouyer wrote:
> On NetBSD, PTHREAD_STACK_MIN is not available.
> If PTHREAD_STACK_MIN is not defined, define it to 0 so that we fallback to
> DEFAULT_THREAD_STACKSIZE
> 

I would add:

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
>  tools/libs/store/xs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 4ac73ec317..b6ecbd787e 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -811,6 +811,11 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>  
>  #ifdef USE_PTHREAD
>  #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
> +/* NetBSD doesn't have PTHREAD_STACK_MIN. */
> +#ifndef PTHREAD_STACK_MIN
> +# define PTHREAD_STACK_MIN 0
> +#endif
> +
>  #define READ_THREAD_STACKSIZE 					\
>  	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
>  	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)

There was also a suggestion to use MAX(PTHREAD_STACK_MIN,
DEFAULT_THREAD_STACKSIZE). Is maybe MAX not defied here?

Thanks, Roger.

