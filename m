Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2E44ECD3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 19:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225386.389216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbe1-0006gz-VC; Fri, 12 Nov 2021 18:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225386.389216; Fri, 12 Nov 2021 18:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlbe1-0006eh-RF; Fri, 12 Nov 2021 18:51:25 +0000
Received: by outflank-mailman (input) for mailman id 225386;
 Fri, 12 Nov 2021 18:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=an8x=P7=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mlbe0-0006eb-8L
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 18:51:24 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86969b7c-43e9-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 19:51:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:58800)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mlbdw-000Gju-75 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 12 Nov 2021 18:51:20 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E1A071FBF1;
 Fri, 12 Nov 2021 18:51:19 +0000 (GMT)
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
X-Inumbo-ID: 86969b7c-43e9-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
To: Jane Malalane <jane.malalane@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Message-ID: <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
Date: Fri, 12 Nov 2021 18:51:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211110091935.16906-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 10/11/2021 09:19, Jane Malalane wrote:
> Before, user would change turbo status but this had no effect: boolean
> was set but policy wasn't reevaluated.  Policy must be reevaluated so
> that CPU frequency is chosen according to the turbo status and the
> current governor.
>
> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
>
> Reported-by: <edvin.torok@citrix.com>
> Signed-off-by: <jane.malalane@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Ian Jackson <iwj@xenproject.org>
> ---
>
> Release rationale:
> Not taking this patch means that turbo status is misleading.
>
> Taking this patch is low-risk as it only uses a function that already
> exists and is already used for setting the chosen scaling governor.
> Essentially, this change is equivalent to running 'xenpm
> en/disable-turbo-mode' and, subsequently, running 'xenpm
> set-scaling-governor <current governor>'.
> ---
>  xen/drivers/cpufreq/utility.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utilit=
y.c
> index b93895d4dd..5f200ff3ee 100644
> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_state=
)
>      {
>          ret =3D cpufreq_driver.update(cpuid, policy);
>          if (ret)
> +        {
>              policy->turbo =3D curr_state;
> +            return ret;
> +        }
>      }
> =20
> -    return ret;
> +    /* Reevaluate current CPU policy. */
> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
>  }

So, having looked through the manual, what the cpufreq_driver does for
turbo on Intel is bogus according to the SDM.

There is a non-architectrual dance with IA32_MISC_ENABLE bit 38 (per
package) for firmware to configure turbo, but it manifests as another
dynamic CPUID bit (which I think we handle correctly).=C2=A0 It has the s=
ame
semantics as XD_DISABLE and CPUID_LIMIT so we might want to consider
adding it to the set of bits we clear during boot.

However, the correct way to turn off turbo is to set
IA32_PERF_CTL.TURBO_DISENGAGE bit, which is per logical processor.=C2=A0 =
As
such, it *should* behave far more like the AMD CPB path.

Therefore, I propose that the update hook gets renamed to update_turbo()
to more clearly state it's purpose, and that we use the TURBO_DISENGAGE
bit as documented.

If we're going this route, I'd also like to make this hook consistent
with others, where we IPI directly, rather than having an intermediate
function pointer just to send an IPI.

~Andrew


