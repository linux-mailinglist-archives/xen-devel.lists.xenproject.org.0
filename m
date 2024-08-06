Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF30949818
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 21:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773112.1183579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbPew-0007cc-MR; Tue, 06 Aug 2024 19:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773112.1183579; Tue, 06 Aug 2024 19:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbPew-0007Zg-Jv; Tue, 06 Aug 2024 19:15:50 +0000
Received: by outflank-mailman (input) for mailman id 773112;
 Tue, 06 Aug 2024 19:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7YTl=PF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1sbPeu-0007Za-Bd
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 19:15:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48997b22-5428-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 21:15:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E86014EE0738;
 Tue,  6 Aug 2024 21:15:45 +0200 (CEST)
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
X-Inumbo-ID: 48997b22-5428-11ef-bc04-fd08da9f4363
MIME-Version: 1.0
Date: Tue, 06 Aug 2024 21:15:45 +0200
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [PATCH] automation: fix eclair scanning for merge requests
In-Reply-To: <alpine.DEB.2.22.394.2408061124280.4954@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408011500280.114241@ubuntu-linux-20-04-desktop>
 <f5990dbcf0131768fdfd35bfdfd8930c@bugseng.com>
 <alpine.DEB.2.22.394.2408051712320.4954@ubuntu-linux-20-04-desktop>
 <876a1792599b8a10fb49eefb10d475bc@bugseng.com>
 <alpine.DEB.2.22.394.2408061124280.4954@ubuntu-linux-20-04-desktop>
Message-ID: <481901df1269750bba2da4294f32fd14@bugseng.com>
X-Sender: simone.ballarin@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-08-06 20:25, Stefano Stabellini wrote:
> On Tue, 6 Aug 2024, Simone Ballarin wrote:
>> On 2024-08-06 03:03, Stefano Stabellini wrote:
>> > On Sat, 3 Aug 2024, Nicola Vetrini wrote:
>> > > On 2024-08-02 00:06, Stefano Stabellini wrote:
>> > > > The ECLAIR jobs part of the Gitlab CI pipeline fail reliably when the
>> > > > pipeline is started from a merge request. This is the error:
>> > > >
>> > > > Unexpected event pull_request
>> > > >
>> > > > The error is a consequence of action.settings setting event=pull_request
>> > > > for merge_request_event. Given that we don't need any special behavior
>> > > > from ECLAIR for merge requests, just run the regular scan, change
>> > > > action.settings to set event=push for merge_request_event (same as for
>> > > > pipeline triggered by git push).
>> > > >
>> > >
>> > > According to my analysis, the error stems from the fact that
>> > > automation/scripts/eclair unconditionally calls action_push.sh, which is
>> > > not
>> > > designed to handle merge requests (that would be action_pull_request.sh).
>> > > One
>> > > approach, that needs to be tested, could be to execute that second script
>> > > based on the value of ${CI_PIPELINE_SOURCE}.
>> > >
>> > > The main difference the approach taken in this patch is that the analysis
>> > > results will be relative to the nearest merge point with the staging tree.
>> > > If
>> > > that's not something that is desired, then this approach looks good to me.
>> >
>> > You are right. I tested the below and it works as expected, see:
>> > https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1401863307
>> >
>> >
>> 
>> Hi Stefano,
>> 
>> the patch looks ok. Don't know whether is should be submitted again. 
>> Only one
>> minor nit:
>> 
>> > ---
>> > From dee036081cb367862daba264e1eb84ca2505f678 Mon Sep 17 00:00:00 2001
>> > From: Stefano Stabellini <stefano.stabellini@amd.com>
>> > Date: Mon, 5 Aug 2024 14:24:23 -0700
>> > Subject: [PATCH] automation: fix eclair gitlab jobs for merge requests
>> >
>> > The "eclair" script calls action_push.sh even for merge request, while
>> > instead action_pull_request.sh should be called, resulting in a job
>> > failure with this error:
>> >
>> > Unexpected event pull_request
>> >
>> > Fix the script to call action_pull_request.sh appropriately.
>> >
>> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> > ---
>> >  automation/eclair_analysis/ECLAIR/action_pull_request.sh | 2 +-
>> >  automation/scripts/eclair                                | 9 ++++++++-
>> >  2 files changed, 9 insertions(+), 2 deletions(-)
>> >  mode change 100644 => 100755
>> > automation/eclair_analysis/ECLAIR/action_pull_request.sh
>> >
>> > diff --git a/automation/eclair_analysis/ECLAIR/action_pull_request.sh
>> > b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
>> > old mode 100644
>> > new mode 100755
>> > index 68f7e6282e..812238e07f
>> > --- a/automation/eclair_analysis/ECLAIR/action_pull_request.sh
>> > +++ b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
>> > @@ -3,7 +3,7 @@
>> >  set -eu
>> >
>> >  usage() {
>> > -    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR COMMIT_ID" >&2
>> > +    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
>> >      exit 2
>> >  }
>> >
>> > diff --git a/automation/scripts/eclair b/automation/scripts/eclair
>> > index ebcaf09b54..97d743ab53 100755
>> > --- a/automation/scripts/eclair
>> > +++ b/automation/scripts/eclair
>> > @@ -21,5 +21,12 @@ ex=0
>> >  # Fail in case of new reports for clean guidelines
>> >  "${ECLAIR_DIR}/action_check_clean_regressions.sh" "${ECLAIR_OUTPUT_DIR}" ||
>> > ex=$?
>> >
>> > -"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
>> > +case "${CI_PIPELINE_SOURCE}" in
>> > +merge_request_event)
>> > +    "${ECLAIR_DIR}/action_pull_request.sh" "${WTOKEN}"
>> > "${ECLAIR_OUTPUT_DIR}"
>> > +    ;;
>> > +push | pipeline | web | schedule)
>> > +    "${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
>> > +    ;;
>> > +esac
>> 
>> here I think it's better to give an error if the event is not handled.
>> Something similar to
>> 
>> *)
>>     echo "Unexpected event ${CI_PIPELINE_SOURCE}" >&2
>>     ex=1
>>     ;;
> 
> Good suggestion. Here is the updated patch, please ack.
> 
> ---
> 
> From f49aacb3f281eca073ccdd9fd1326d79b58b7ed2 Mon Sep 17 00:00:00 2001
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> Date: Mon, 5 Aug 2024 14:24:23 -0700
> Subject: [PATCH v3] automation: fix eclair gitlab jobs for merge 
> requests
> 
> The "eclair" script calls action_push.sh even for merge request, while
> instead action_pull_request.sh should be called, resulting in a job
> failure with this error:
> 
> Unexpected event pull_request
> 
> Fix the script to call action_pull_request.sh appropriately.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
> Changes in v3:
> - handle unexpected ${CI_PIPELINE_SOURCE}
> ---
>  .../eclair_analysis/ECLAIR/action_pull_request.sh   |  2 +-
>  automation/scripts/eclair                           | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 
> automation/eclair_analysis/ECLAIR/action_pull_request.sh
> 
> diff --git a/automation/eclair_analysis/ECLAIR/action_pull_request.sh 
> b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
> old mode 100644
> new mode 100755
> index 68f7e6282e..812238e07f
> --- a/automation/eclair_analysis/ECLAIR/action_pull_request.sh
> +++ b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
> @@ -3,7 +3,7 @@
>  set -eu
> 
>  usage() {
> -    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR COMMIT_ID" >&2
> +    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
>      exit 2
>  }
> 
> diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> index ebcaf09b54..3ec760bab8 100755
> --- a/automation/scripts/eclair
> +++ b/automation/scripts/eclair
> @@ -21,5 +21,16 @@ ex=0
>  # Fail in case of new reports for clean guidelines
>  "${ECLAIR_DIR}/action_check_clean_regressions.sh" 
> "${ECLAIR_OUTPUT_DIR}" || ex=$?
> 
> -"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
> +case "${CI_PIPELINE_SOURCE}" in
> +merge_request_event)
> +    "${ECLAIR_DIR}/action_pull_request.sh" "${WTOKEN}" 
> "${ECLAIR_OUTPUT_DIR}"
> +    ;;
> +push | pipeline | web | schedule)
> +    "${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
> +    ;;
> +*)
> +    echo "Unexpected event ${CI_PIPELINE_SOURCE}" >&2
> +    ex=1
> +    ;;
> +esac
>  [ "${ex}" = 0 ] || exit "${ex}"

