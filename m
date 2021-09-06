Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36F401FE9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 20:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180204.326760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJm5-0006CL-Ao; Mon, 06 Sep 2021 18:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180204.326760; Mon, 06 Sep 2021 18:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJm5-00069x-7F; Mon, 06 Sep 2021 18:55:21 +0000
Received: by outflank-mailman (input) for mailman id 180204;
 Mon, 06 Sep 2021 18:55:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNJm3-00069r-HC
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 18:55:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa1f1ec8-0f43-11ec-b0b5-12813bfff9fa;
 Mon, 06 Sep 2021 18:55:18 +0000 (UTC)
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
X-Inumbo-ID: fa1f1ec8-0f43-11ec-b0b5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630954517;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=78kqkbp/8KkJXYvxGOcNoRYv+d1QDAIOBRdg4h03mHw=;
  b=eqdXULvlQB3cHWYKjKYra+flJsOVPRhWc0x3VzmighZJd7JtMzofjUqQ
   8nX4dl93fO3GtAUMZWIe9IajfJpyKvuO1P70QIdn0WtpPquaKI5mFQlrc
   nucfuQA06dAF8P4qX6MAhos3832m+gKJqd6YRC2ScP1+9bXgQiA7bDAUS
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o6T8GI+uOEzF3SSOpElMJ/udZGNIFI8HyePgw/f/YFZSp2oJpJpjlynhgU6txRtrYymqVHrqzs
 214jrw+V9CyTzY/9FfskEQEqwtXv/pUZV6uOLO2685M3Jm3wfF7qJy1rwU4DDvORR2LBCrBNQT
 NTblttk4KAwgMcqGMC4HZJKXE1evl+YjzlUevggSPOSZMx7cERQ/ZIqbhYUqasuZinnzDILhEc
 TKDfscrenrBt5DsVhBS92a7pWwom1MaB6g8qv0nLrMdNqah8p8YM1InxxEqHKB1peFtxnaDC/s
 mZ6UBolSxBL4l42CS9deU+Kn
X-SBRS: 5.1
X-MesageID: 52507810
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WBgp6KuWThjwJeXCEp1b6VOF7skC5oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK4yXcH2/hvAV7EZnibhILIFvAe0WKG+VPd8kLFh5ZgPM
 tbAs9D4ZjLfCJHZKXBkXmF+rQbsaC6GcmT7I+0pRcdLnAYV0gj1XYcNu/yKDwGeOAsP+teKH
 Pz3Lskm9PtQwVtUiztbUN1IdQr6ue72a7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhSP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Dp0/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MpkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS0dI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/1WH+ObcHEjbIy32B3Tr4qeuonxrdTFCvgUlLfUk7zQ9HMlXcegC2w
 zGWp4Y3Y2mAPVmK56VP91xNPdfPFa9Ny4kAFjiU2gPK5t3T04li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52507810"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N01OWPYe/+p9tuJjLX6zqVHoR4i7uIFst9lr62Lcse3ehhx6gblYvA8TofqTZr5Fc9Yy35VQbcrSEiHHUFQmzvq8AEyzyxUvOkcLWM2Oi8lUXMtuM9KJ6UlAT9QqYSlajJ521X2wp1efiZG2QNpgBTuvLRHAjzv4sPR3QSqq7zyPgo65/gnDZjOHiMGtqXO+QQHbx+fFh2lwuEjU1ArymIANV4X5LUDg3WokBw87gKPaDg6IBiVpXAlvI5P0/HGyJ19ONlviIAQXZfQXsth7A14rosVJMqdjE81zfG5l9dVjbEE7H8ls/8t+jCkajLItzyzrw8Nmqxl/p5h8A73RtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yWjg6RICr/TwDqra08velTyo7XtSAg1czseNajXQ4w=;
 b=HtY0uIqk0aBYBSqEF2MiXQ85JB+O2cogloBDo4z3j7VcEYe0fneV9T1ZjOrV/kSmyBnlF+n2kI/1B+rbNXt7Q5SwdOmimEsRzn5WfNhNMRnW/cAhQ/KsDBbjIMoQpnWtkv5LjDFo9CzteVvmNXV5uuyoiABIumTra/oCZCR7Pi5m7x5AMkObv7Lqkkb2fnkvbvEYFCVdk/7zeazEj/KtJ9YsOlf7dIXS81zYB2IHYFpSYmeDf2rJ/m/q0Q6ckEusbx20eVtFnIGmQC7TeJpGQTfgoXHUN8W9A7LiCVvBW2SWd2i1dtFa79WSqt/b1MfBjdw/cazhUBYOtKV3VXmhxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yWjg6RICr/TwDqra08velTyo7XtSAg1czseNajXQ4w=;
 b=R0NXAynlhfI1WS90VlPjd6uvi04adwt6fnXcaTpb3dWrJqE3Sey73H/9G/lT+ST8loMJeasuC3FEGFQ4462nvRZ/jAf8LFFrm7lhMwztbKIrtuv3FXguxSHwsif52YfYq7ySCNWywColj2MKJg6uSEH7VhMR585cDylEGgiSOKM=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-10-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 09/11] silo: remove circular xsm hook call
Message-ID: <d415ab82-ca83-98e8-0b07-0e093a1fa7e1@citrix.com>
Date: Mon, 6 Sep 2021 19:55:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f27be822-55ae-4309-3ec5-08d97167db7a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3941:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3941DFE8779FC82341110242BAD29@BYAPR03MB3941.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zY+YJchn0vKL1shRH3kH5Yat0y9+YgaMqGSumkFkY/F36j4lvyqY5K6n89ub0cUIUhVel8LXe3PxaVOdj/aCMTdzwaYZD7jBKeO8FQ592RSUD4f3Qf66jsI12kqwJINecNRW3VfFFpJ9NxVMUDYNSMil5KU5M5OdPa+SxowpGMacKX1oHQL0kRZaIWOSGFeR//AAtfRgVCQNcLkyqqirMdPCizQk54Fxb6nTqFvHyxHefJovTKjtTgHR/qIr9KPMhHCrKKH/jAHNTGWmbURuT9CDNpagApjaWY+yKp5hdFJpSrS7sCInSzj6Gwy68OynRwcNMWlwAwkx8kzBV7tAsgkiBabxsz0mg5vNwi58knZefJ57NW+ThveWNHI4L0c6Ya1N/dFdv4cO9FSX5yzxu+b+Vi2l1Qt0Htpf2GRFiYF3eqqTEjSK3C3eKqWYBPn7+UzZcX1biNAqeD88ZCqCiDXy68TP7HKaQSmo7gjsVmI1AGknqL/TLju96GLCLLnS7wl/DoatqBlfoCo1y6c5QcnGduHmOfn4TzWRo+je8gg7NXIe1cfmTQ2GLyiVEPlcTHrtdj29uJWRm9933YcMXnPhy8w7EqID3zBe4b+mDaiqwR+hAzcpyddfSou0pw/51WnAM+IyWZxmTD8zUidq43CnxZxoNbWKl6ib6S8vK0eChwhr8UAzKRLt7JsTj73+MLiZEJCCo6NdXQ1Svo97/xYO1hyzfWSgDnvamQyooAVQfF3JgyhNv6XB9GrdfRlHa2sXnyMu6r01YU8zZEqvzPHwzpINq6sbyms7ahMoNH8u7/CTae9manONHYf74qc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(53546011)(2616005)(5660300002)(55236004)(36756003)(8936002)(86362001)(26005)(478600001)(956004)(66946007)(66476007)(66556008)(83380400001)(31686004)(186003)(38100700002)(6666004)(2906002)(16576012)(8676002)(4326008)(31696002)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlNWeHNIY0V2UDdXYjEvMVNzN0pTT3dOcHEzd3lPTmpHWGpuL09mTENWa0ZG?=
 =?utf-8?B?M2tCejE0ODVpYXVwLzV3ZmJuTytXSE1YMU9xaERzU2g4VDdORGdjWm8rVTZV?=
 =?utf-8?B?c28wV2ZHMDJTN1lpM0pFN3FBNzFiajNXRTVQY2h3ZUpERlM4dGNUbHlGMFZs?=
 =?utf-8?B?bGJmSkZLejd2KzZXTUtCTXU3cXJMWlRkK1JKUWFxNzRTblp1eFdYN1A0K2cw?=
 =?utf-8?B?VThIbCtSL3VlMXFFdnVlNVc3S3FXYXdxYTJub1Z2TU80UFh2OFJDRmc5Z0Mz?=
 =?utf-8?B?dVVjRW5qUWh5bHZJS1pLVUQxZlM5WjVyNndJb2Vrd1JvWFE2TDIyZmc3NHZK?=
 =?utf-8?B?WTZlU2dudDNQbDNxMEVkT1g3NkcrMGpremRHMEdOVHg0MlB1VVBvNm9jdG5S?=
 =?utf-8?B?YkEyK1d3NVB2NjF4SG5JczZaTTFIREs1MDhMTGF6dFdGZUNtbVRsZkk4Q2JV?=
 =?utf-8?B?Vk1IQVk0V04vb3R3cjd6VUlkQ0xvNGc1UDZsN0k2dEZibERHcHVGZHZNeTA2?=
 =?utf-8?B?K1h5Nm4rdE90OEdmR1ppNWpDMlp6VWt2MGlUMXhlblE4MThpazRNYmd2OVls?=
 =?utf-8?B?emtWRFliQTRXMERkZlg0ZDhrSlB4MGtwbjBOME9vWWZrRUhkUHkyZTRMTjlQ?=
 =?utf-8?B?TjVoSlhuNGZqbGNVdUVXL2lESUdubkJFcE9jbUp5L000d0NNUm0xd3dpUFBS?=
 =?utf-8?B?b0pXcDRIQ0wvRE5Gdmp3b3I4QzZEZUlnSDZDc2JDYmhXQzAxTjlIeW03ejBw?=
 =?utf-8?B?c3FSVkVraVlxSjVJRDFadTgwcU01Tld6bFdFWXNUYy84S2svbUJTbmdKNGhP?=
 =?utf-8?B?QUxMaDdQQ2kvV1NPditHT0h0Z1pxWWM5OVdPbGQ0OFp5c2M3b3R0bzdWZlRU?=
 =?utf-8?B?dFVtWGl4aEZobEVqbjZwQWtrSHZyN1NvRGJlWHM1YlJwc2kyaHcwYkpXTDhi?=
 =?utf-8?B?Q1ZYMEZLSk5LblZLeWZUcnc4aXJtbEpjbFd4NmMvcmZFcFBieUpCc29PQU94?=
 =?utf-8?B?N3ViV2EvMEtUbUxkTmZhYkJrYVpoMXBzdkptMmpTRzJvdWZIaHA1ckc1K1Va?=
 =?utf-8?B?ZTdxckZaWjhCalBxL1huSEg0R3p6ZVRHWmN3ZFZiWHJVRUhvOElQeDAwdTVS?=
 =?utf-8?B?amtZZGdmYWdvWWtNMitFZm03bTkrSWtFR242dUhBV1VVMit6eDc5dUhSdFk2?=
 =?utf-8?B?V3orK1BsMmUzREMvTmpwcC9NbjNjemhiRnd0Qmt2TVJTSDVkdnFTRmRYekZI?=
 =?utf-8?B?WklUUWF2TGpKUC84NWVLeUhya0Z6QnV4QWFiL3p3TUNnNnZncWY5UVVsdnBQ?=
 =?utf-8?B?QmFYYzFOMk12SEtwdEhPOHZJenNBVlh5czl5MnIxZzlJL2FMeE1VL25ySjVq?=
 =?utf-8?B?eWZXbEc2azMraXcrUXViZ29pSSszQzF1MUR5MHpUS0FKRVdPT1RKOWZmTVRj?=
 =?utf-8?B?UFJOcXhwaVJ4WGM0ZS9zZzUzbFF6K1hZNHJYWEpTUkgzVTVVRlZmaEF6eW1S?=
 =?utf-8?B?ZUVyMVowSlRic25SUUZUekdEazNNT3MyUW9BcFVBTncxL2VRc3JtemN3ZXZY?=
 =?utf-8?B?OXVxUkR6bnZ1eldzNDlJdlVGK1l3Q2RRbkRtVTRKMC9LYnd5OXd4WTdFS3Zh?=
 =?utf-8?B?ZDZ5L1h4eTZpT2RtNTBDTDlQa05KZnVrS0JsYlMwSjcrdzFvVGI0SDRsVHRv?=
 =?utf-8?B?b2F0ck01dEVCNUpKRzdndnY0K3lIdzJnNzkvYTQxWHJpaUMrSEtxK1RXeUQ1?=
 =?utf-8?Q?8d4wefKVd6ykQd4dB3Om7jWp76lQQM0OFEvFdfk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f27be822-55ae-4309-3ec5-08d97167db7a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 18:55:12.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DcxsiQpdNP1ShTxmc1+3JAbpiL0CWoAgBeHyRSoc1JiAS4xbeGPgshMNT8VbjCWtWZNg5hg7JskkwBXn37vkhzuxBA6djmeOoBXnTN87H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3941
X-OriginatorOrg: citrix.com

On 03/09/2021 20:06, Daniel P. Smith wrote:
> SILO implements a few XSM hooks to extended the decision logic beyond
> what is defined in the dummy/default policy. For each of the hooks, it
> falls back to the dummy/default policy. The fall back is done a slight
> round-about way.

"done in a slightly" ?

>  This commit makes the direct call to the default policy's
> logic, xsm_default_action().
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/xsm/silo.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
> index 6db793f35c..56a330a831 100644
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -17,6 +17,7 @@
>   * You should have received a copy of the GNU General Public License alo=
ng with
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
> +#include <xsm/xsm-core.h>
>  #include <xsm/dummy.h>
> =20
>  /*
> @@ -43,7 +44,7 @@ static int silo_evtchn_unbound(struct domain *d1, struc=
t evtchn *chn,
>      else
>      {
>          if ( silo_mode_dom_check(d1, d2) )
> -            rc =3D xsm_evtchn_unbound(d1, chn, id2);
> +            rc =3D xsm_default_action(XSM_TARGET, current->domain, d1);
>          rcu_unlock_domain(d2);
>      }
> =20
> @@ -54,7 +55,7 @@ static int silo_evtchn_interdomain(struct domain *d1, s=
truct evtchn *chan1,
>                                     struct domain *d2, struct evtchn *cha=
n2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_evtchn_interdomain(d1, chan1, d2, chan2);
> +        return xsm_default_action(XSM_HOOK, d1, d2);
>      return -EPERM;
>  }
> =20
> @@ -62,21 +63,21 @@ static int silo_grant_mapref(struct domain *d1, struc=
t domain *d2,
>                               uint32_t flags)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_grant_mapref(d1, d2, flags);
> +        return xsm_default_action(XSM_HOOK, d1, d2);
>      return -EPERM;
>  }
> =20
>  static int silo_grant_transfer(struct domain *d1, struct domain *d2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_grant_transfer(d1, d2);
> +        return xsm_default_action(XSM_HOOK, d1, d2);
>      return -EPERM;
>  }
> =20
>  static int silo_grant_copy(struct domain *d1, struct domain *d2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_grant_copy(d1, d2);
> +        return xsm_default_action(XSM_HOOK, d1, d2);
>      return -EPERM;
>  }
> =20
> @@ -86,14 +87,14 @@ static int silo_argo_register_single_source(const str=
uct domain *d1,
>                                              const struct domain *d2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_argo_register_single_source(d1, d2);
> +        return 0;
>      return -EPERM;
>  }
> =20
>  static int silo_argo_send(const struct domain *d1, const struct domain *=
d2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_argo_send(d1, d2);
> +        return 0;

Shouldn't these be XSM_HOOK too?=C2=A0 Or should all other XSM_HOOK's be
short-circuted to 0?

The asymmetry here seems weird.

~Andrew


