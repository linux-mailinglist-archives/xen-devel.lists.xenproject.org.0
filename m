Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE636401F79
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 20:17:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180176.326714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJBF-0007tc-IJ; Mon, 06 Sep 2021 18:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180176.326714; Mon, 06 Sep 2021 18:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJBF-0007rp-F5; Mon, 06 Sep 2021 18:17:17 +0000
Received: by outflank-mailman (input) for mailman id 180176;
 Mon, 06 Sep 2021 18:17:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNJBE-0007rj-4y
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 18:17:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a94a317c-0f3e-11ec-b0b4-12813bfff9fa;
 Mon, 06 Sep 2021 18:17:14 +0000 (UTC)
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
X-Inumbo-ID: a94a317c-0f3e-11ec-b0b4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630952234;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bC+EJiQzJ/3oT+llAauPcqganhRQKwalHRfyaI9+9Tw=;
  b=UezwOD+EOtgh0fPRXulGw58z9WTzbDOBqiK5cnkwZvBltQhCdJYZRgog
   IZJSIPSyf4eGiDUr9rXPb4KJzLrA60CaLiE03QS9CD5WlnTlQ6dbsJFx/
   hyjWyeEOtG/2g0B648mibq6hZekbmLGa4ySXBbPDvMCyM7FSvdcgvkfCb
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3O2i/bW5wEkgN2rYiFXpS6Zu53HhjTcrLQivkUprjMnlCrQboLUGdz9To1FsjgsxmYXi9XU/tZ
 9lrTUaoxNa6QwnsJdbfizSk4O7ZdiujrkL/yf5DHpGrYcdaqBeBOwR7aCzWPCGo2NC91LMLnAV
 90aSmINcb4Byr0O2vgB3Ysr4PXbBK7x6gLt5I1LA56wM1PTbCGcVC/+vN7emKpFodAhK1phmAK
 Vbo9UqwtKUJGU8L+9SH6qzrHAs03omVMTut6r3+HtuekjTDpWt3HaFT/Hsl5XD7sDxvFR9t7rT
 DEHD64zkBYhmCJ7jVAKGr5gv
X-SBRS: 5.1
X-MesageID: 52105057
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DwSEQaxFyy9SLGcW7Pm9KrPxvuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjlfZquz+8K3WB3B8bcYOCGghrVEGgG1+rfKlLbalbDH4JmpM
 Fdmu1FeaDN5DtB/LXHCWuDYq4dKbC8mcjC74qurAYOPHNXguNbnmBE426gYz1LrWJ9dOME/f
 Snl696TnabCA4qhpPRPAh1YwGPnayGqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD09jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU911rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxzr5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtgrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGYgoBW+q3oYp0PJGbDfqBb0fbllAS+3UoJjnfw/fZv3Evpr/kGOt95D+
 etCNUhqFgBdL5OUUtHPpZ0fSKAMB2Fffv9ChPmHb3ZLtBxB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52105057"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chiLBGFVJPSEpysz1lpQqJNjZC43D+rFqTOt+wtJmahEFMd8otEPIfkJjwO3FeX3366vXHQAD18IgSAdq0uFeqSftqhLjtt+qpYSvXpcT7qq1PlDqd4x9n7DYf4psM0Siip4oSokG3bGEjF/egEyjJLGoA3JANBrWOAmsq/3916tGUvLXXsptxKhOIfJCNmaiuc1vv8SL6CK7P21bdME+/dTorlXtwrqLpJJtI8Hop4M6GyFlKnI0FZkbgZler9H4LdTxM6Ov5ztuHeZEHYIWqJP1c/56G66lVxqF/OIoZ6UblJd0Lwg98e63aPhzKhZrctvHyYIoK49L2WuNL5/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0694yTCPGieLg9B9FN4YDvoVX+IZkzSt6FqWq++RqgQ=;
 b=jKSvGNIKr0tjVgU6NnrBVv53PlUodnuexs10miwY96ZYLSCOrOl8BmMs38nKN5VkIYcTA7PqNKgBXGBF8hO1TpuHIxDLylMQcDfrNFAD6e+iqaQS/7+Z+D0By+sG8f9DW6UVQTBaLTZov50xESoxh24vawVTTd7FnLTRcI3P+OyylB93PPVp1R217dDyhIpfUAA1OVFHahU4gTh0Pk6LIWpuZ6rx1f63tgpKDPqSAPzCfDNtPo4hurxKwAoIL+FesLTmzq0ZCHUE1gdr2UNOx4czmN8dlXmhg7d86hW9rxsvACAEoaKB/1hYoEIrtN9XVPGLo4EXYEdQ4LvGhAxc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0694yTCPGieLg9B9FN4YDvoVX+IZkzSt6FqWq++RqgQ=;
 b=NuniERP551CZ9ZHg2P4cauD4vyGOCdcuAhy8WQNHD0PcIO4kmV0h1Na0dcA91m6iHIHgWQR7AWPN2QHtzffo/ph4bvUPa5V5+GeMZ9QDkETYMh9bNSojKJDmCx+ou2/CmLTPAfzwjByBaMhOAhnEjtE9vdltM5vvcShY7os4YYg=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-5-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 04/11] xsm: apply coding style
Message-ID: <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
Date: Mon, 6 Sep 2021 19:17:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0026.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::14)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8e8915a-9a06-4e25-7728-08d9716289e2
X-MS-TrafficTypeDiagnostic: BYAPR03MB3670:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3670C1D3B4AD229930CCE152BAD29@BYAPR03MB3670.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6PZ/TDbf344B4JInXfmap5ABOq96iIEUJGbtaM2XsQwKs4iNQmu4G1AvS+Fc7HH2/bZwyERHyYrkTkc/TcVDz0CHHQevCXM0IM7wqIvpVxIeDh8R5MLkdK2mPgWBPDjedmn1mEajFrtUlrGKo38hvgltwuhpFBFz5hPv/Ls+kwHSklX1XU1kaUWeorPaGMs0C36h8G4bplKThg5y834/8IWkS8Sps1NfkRL2ebpdSttlZldzi3+YnSIVxUBHfRfNGhbSlq31SL5hq+hlceDExbadCDBJGaIOzSfMBBidkym5NNIiREMiwwpHRmYa1UkcaQ6fw4QnEe0CxWJqF1EhxV+cwBDJFqiF8Sj7IHBX8TZWYjH+6AArFarlE0avXL6fXlbwH0xa0TiVv40XRSiWS1rfsKG1F8mFHOero+64OxkeJLZbtpEoDomV2X+ZIiOYtzpWORxbV6/gmdKifMSbSlVkDmnAJ+VjepK7ppZj4d7VVr9ufoZW3i+9IC7tIoHCXhTqVP/yAQ8DhEWKTSmIxdNcDwY1X3oaAA1aOErzIgDP5td79dM/nxSTlQqiTOdUZMgTSF3SmwcuO5gvTlETOjCdiIiyQCHtvS4pTkZhxKGhLOdtX+wqXRc8fbcstdwwMcXac6SHSs7Aki2l9naR9c+UT+0LYgdRmcrrL7PXqs7VNldGFAqr/E9ZngvQgj3Ne+ZDCQYZ3qSu4stlnLxH/9ITTWoh1qvSTMpe0jD5PgcWtH1V9QX+9/D97+erB9Y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(8936002)(16576012)(5660300002)(4326008)(316002)(66946007)(6666004)(186003)(956004)(8676002)(38100700002)(26005)(83380400001)(36756003)(478600001)(2906002)(31686004)(6486002)(31696002)(55236004)(66556008)(66476007)(2616005)(53546011)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkNsV2JtSFBGNUNGN2NmUUtrcXV2aCtTS2dNQVdhZnFESXUwVElwNldtbm9I?=
 =?utf-8?B?eTZOZDdmNkhhZjJPUDJQRXdsREpreE9NM3JHZXRiUzZzOG9ySnFaUHRaR21p?=
 =?utf-8?B?aWNoVGtrUXV4TG9EYzQ3N24xVmE0WEFwcmx1N05VVlg0c2lEbmFtMS9qZXVU?=
 =?utf-8?B?a1ExSzZnZGVtSlkrNkloTmM1dXloaGFNcmVkUWFtcTJEWE41bm1Gd3ZPNy9t?=
 =?utf-8?B?SGtIdjlXb0Y4L2t4TUVxamlXTGdYcHhlUGo2OTk1RXkrRmIyd0ZNKytNcFBZ?=
 =?utf-8?B?VUJrNmZ3OTQzanBkMG9YVGFWb1JocXdtZ0d2OUJVTWoxdFJuMklXZ2Fwc25Z?=
 =?utf-8?B?YnZZSTNqcWVOQjRIcDdld1I1OUM5ZzBqNjFZeTlxVGRNN0IvM1EzR0luTlpJ?=
 =?utf-8?B?UWV1SnZRWjdUVDdCUVh2VzB3UGxLa0ZtUTJNSm9HRmFCdnUyaVM3aFRXQ2E4?=
 =?utf-8?B?UEJrWENnK1I0OWsxc0gvcWRNa2QyQTRHcU1jVDJxZG9Ga0FCRm1uYjljWnp0?=
 =?utf-8?B?NGxLeUZiVHdSUGZ0UU9qeDRvZklldm4zTURIZFFlUXpsRFBZMGZZZkRhTGEz?=
 =?utf-8?B?YUMrZkErMThXOWpnbnlxM2tRQUF3RTVUZFVreFp3QlFYRmdYRUtyeWZzVU55?=
 =?utf-8?B?THE5QWl5TjRoRDJybmVBRzhCUnpoaDBRR0pTSGVJVndIRTFCcFVVTmlrT2VT?=
 =?utf-8?B?RytGR0pITHprTGVLaUwzdjBBT0Q5V0RCUUdTbW1EZU1Hb0kvNXArOXpTZHFW?=
 =?utf-8?B?MEhUMFZ2MHB5NmlaSjFkSGFjUnMrRjBNck1zaFo3VDg5cGxIMTl0Q1doQyto?=
 =?utf-8?B?dW1oSEtvU2t3bzRmbmhLejdUK2hxYXR1UjNzZjhKbVRJcUdDMW5nV2toNENV?=
 =?utf-8?B?UEt2U1QrS01pZGFmcTVCTXh5S1BKSFE5dUhYVGtHQ3RMQ3lMbjZ4WHloWGRq?=
 =?utf-8?B?aXFlWVBrL1FJRUtFSUJ0WXdjSW1NSkZocFhZVHUvZU9qcVo4UmJ1ZXdGZmxP?=
 =?utf-8?B?ZHI3RXYrSHRQcGhnbE5ZcjRSM2Vwa0ZFUm01U01uMlpscndFTkhnVHplTGhw?=
 =?utf-8?B?ZG1aeVlXRnRLVkZpd0d0Vllac0JxWFcxTzl0OFQrcHNuOGZFODJWM0srWC9B?=
 =?utf-8?B?NElhUlVIcmJxV25XNGNYekxOUzhJd09ZbktQZndWS2Y1WlZWMnNCMmJGem51?=
 =?utf-8?B?RUZHSHJyUTZ2YzN5anN3MUl0c3pjbldnVndzQ2ZqK2NIYmxIMDc5M29NM2Vv?=
 =?utf-8?B?b3lIQmQwVWRpbUw4NFNCY3BGYk5XQnpkWVNVR00rMll3d0RBQ1FtQ291SXd6?=
 =?utf-8?B?NStFbDVJeTdvWUNBWTM2Z3hDakRBQzAwVjcyWHlxc3B3cVA5UnpOR204Zk9S?=
 =?utf-8?B?WGxTVlZXZ2kvSnBOVnB2UHhxOTRNOUNHZEpna0hFZ1VFcVJUdE9iQVA5NndP?=
 =?utf-8?B?QkJqQmVDVzdmQVZKamI5d0xCVkxOd3B2U1l3QWlNK2kzbjcwRVBZc2FOdXha?=
 =?utf-8?B?WjRJQXNUUy9GZWJoM3N2VllkQ0pTR0I4ay9GOWlEZjU5UjlwL25Vdk82S28x?=
 =?utf-8?B?R1U4TFFObHpjUnF5dmpQVjN3bHJsT2VaZGRIYkNHVHhvZlYrUWRvdE9SdHlP?=
 =?utf-8?B?MzlCcU9tSGhuS0FDTExDQnhsMlJSSGxXM2ZFMUVuOHNwMFlvSS9qeXlEcm9B?=
 =?utf-8?B?MndrbGV0L1F5VGFJWlZ4Tkw0OFlpSm9YU0JJL0Vla2pIZXFscStRVzM0S2RL?=
 =?utf-8?Q?8p6YepYFOofhNmNFv258q0hcK8g3SiBdAiG/uHn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e8915a-9a06-4e25-7728-08d9716289e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 18:17:08.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD8QvT/kiWxR2XjqyiYJ7J1flEiq1/2bmjeGNYGj2Ni7HmZCEaZJou5Djnf5JhHhW0QaODNzRPMIVW7USo2V6REvY/S5emjvwjE4Vo/+JsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3670
X-OriginatorOrg: citrix.com

On 03/09/2021 20:06, Daniel P. Smith wrote:
> Instead of intermixing coding style changes with code changes as they
> are come upon in this patch set, moving all coding style changes
> into a single commit. The focus of coding style changes here are,
>
>  - move trailing comments to line above
>  - ensuring line length does not exceed 80 chars
>  - ensuring proper indentation for 80 char wrapping
>  - covert u32 type statements to  uint32_t
>  - remove space between closing and opening parens
>  - drop extern on function declarations
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/include/xsm/dummy.h | 173 +++++++++-----
>  xen/include/xsm/xsm.h   | 494 ++++++++++++++++++++++------------------
>  xen/xsm/xsm_core.c      |   4 +-
>  3 files changed, 389 insertions(+), 282 deletions(-)
>
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 214b5408b1..deaf23035e 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -69,8 +69,9 @@ void __xsm_action_mismatch_detected(void);
> =20
>  #endif /* CONFIG_XSM */
> =20
> -static always_inline int xsm_default_action(
> -    xsm_default_t action, struct domain *src, struct domain *target)
> +static always_inline int xsm_default_action(xsm_default_t action,
> +                                            struct domain *src,
> +                                            struct domain *target)

The old code is correct.=C2=A0 We have plenty of examples of this in Xen, a=
nd
I have been adding new ones when appropriate.

It avoids squashing everything on the RHS and ballooning the line count
to compensate.=C2=A0 (This isn't a particularly bad example, but we've had
worse cases in the past).

>  {
>      switch ( action ) {
>      case XSM_HOOK:
> @@ -99,12 +100,13 @@ static always_inline int xsm_default_action(
>  }
> =20
>  static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
> -                                    struct xen_domctl_getdomaininfo *inf=
o)
> +    struct xen_domctl_getdomaininfo *info)

This doesn't match any styles I'm aware of.=C2=A0 Either struct domain on t=
he
new line, or the two structs vertically aligned.

It more obviously highlights why squashing all parameters on the RHS is
a bad move.

> @@ -291,37 +307,41 @@ static XSM_INLINE void xsm_evtchn_close_post(struct=
 evtchn *chn)
>      return;
>  }
> =20
> -static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d, =
struct evtchn *chn)
> +static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d,
> +                                      struct evtchn *chn)
>  {
>      XSM_ASSERT_ACTION(XSM_HOOK);
>      return xsm_default_action(action, d, NULL);
>  }
> =20
> -static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d=
, struct evtchn *chn)
> +static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d=
,
> +                                        struct evtchn *chn)
>  {
>      XSM_ASSERT_ACTION(XSM_TARGET);
>      return xsm_default_action(action, current->domain, d);
>  }
> =20
> -static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1=
, struct domain *d2)
> +static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1=
,
> +                                       struct domain *d2)
>  {
>      XSM_ASSERT_ACTION(XSM_TARGET);
>      return xsm_default_action(action, d1, d2);
>  }
> =20
> -static XSM_INLINE int xsm_alloc_security_evtchns(
> -    struct evtchn chn[], unsigned int nr)
> +static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn chn[],
> +                                                 unsigned int nr)

I maintain that this was correct before.

> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 9872bae502..8878281eae 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -19,7 +19,7 @@
>  #include <xen/multiboot.h>
> =20
>  /* policy magic number (defined by XSM_MAGIC) */
> -typedef u32 xsm_magic_t;
> +typedef uint32_t xsm_magic_t;
> =20
>  #ifdef CONFIG_XSM_FLASK
>  #define XSM_MAGIC 0xf97cff8c
> @@ -31,158 +31,171 @@ typedef u32 xsm_magic_t;
>   * default actions of XSM hooks. They should be compiled out otherwise.
>   */
>  enum xsm_default {
> -    XSM_HOOK,     /* Guests can normally access the hypercall */
> -    XSM_DM_PRIV,  /* Device model can perform on its target domain */
> -    XSM_TARGET,   /* Can perform on self or your target domain */
> -    XSM_PRIV,     /* Privileged - normally restricted to dom0 */
> -    XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations=
 */
> -    XSM_OTHER     /* Something more complex */
> +    /* Guests can normally access the hypercall */
> +    XSM_HOOK,
> +    /* Device model can perform on its target domain */
> +    XSM_DM_PRIV,
> +    /* Can perform on self or your target domain */
> +    XSM_TARGET,
> +    /* Privileged - normally restricted to dom0 */
> +    XSM_PRIV,
> +    /* Xenstore domain - can do some privileged operations */
> +    XSM_XS_PRIV,
> +    /* Something more complex */
> +    XSM_OTHER
>  };

Why?=C2=A0 This takes a table which was unambiguous to read, and makes it
ambiguous at a glance.=C2=A0 You want either no change at all, or blank lin=
es
between comment/constant pairs so you don't need to read to either end
to figure out how to parse the comments.

~Andrew


