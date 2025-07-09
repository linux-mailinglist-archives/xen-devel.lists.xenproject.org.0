Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA9AFEDAA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 17:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038387.1410877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWfh-0000b3-G2; Wed, 09 Jul 2025 15:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038387.1410877; Wed, 09 Jul 2025 15:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWfh-0000Yz-DD; Wed, 09 Jul 2025 15:25:21 +0000
Received: by outflank-mailman (input) for mailman id 1038387;
 Wed, 09 Jul 2025 15:25:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uZWfg-0000Yt-W8
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 15:25:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uZWfg-008sZb-0X;
 Wed, 09 Jul 2025 15:25:20 +0000
Received: from [2a01:cb15:8102:5800:1e0f:9f76:7a8b:e8d1] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uZWff-00AvfT-2o;
 Wed, 09 Jul 2025 15:25:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=/J7/Xls3desCzp6j0AHx2HMFJoZssPsvPYlGCh9kbh8=; b=S4m4zksdgRdbGySuvOMWzVmj32
	LpqIw8kgvlz8zdWYF3XqQ1w1Q3dB8mq3UQa5s5FsDLcV9vsQ66oK23oJWAFWNMNF7psx30Qw+0yNB
	FlJP4kPNSvwKRSXD6X+5jlFkaN3SvaEs5JL0dgsGhvvLEfTcYdMDnKSoJvHwaAmVR0E8=;
Date: Wed, 9 Jul 2025 17:25:17 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Anthony Perard <anthony.perard@vates.tech>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: Re: [XEN PATCH v2] automation/eclair: Make report browsing URL
 configurable.
Message-ID: <aG6J3Y9H5LrhyeAp@l14>
References: <a4653f50651af8463f7543793e38c40111790648.1751901789.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4653f50651af8463f7543793e38c40111790648.1751901789.git.nicola.vetrini@bugseng.com>

On Mon, Jul 07, 2025 at 05:28:26PM +0200, Nicola Vetrini wrote:
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 5b00b9f25ca6..9cec0f65a439 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -8,7 +8,10 @@
>      ENABLE_ECLAIR_BOT: "n"
>      AUTO_PR_BRANCH: "staging"
>      AUTO_PR_REPOSITORY: "xen-project/xen"
> +    ECLAIR_ANALYSIS_RESULTS: "https://eclair-analysis-logs.xenproject.org"
>    script:
> +    - export ECLAIR_ECDF_DIR
> +    - export ECLAIR_REPORT_HOST

I don't think these two "export" do anything useful, unless for some
reason there's a "before_script" in yamls that set those two variables
without exporting them. Otherwise, those two are expected to be CI
variables, so they should already be in the environment, so no need to
export them again.

>      - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
>    artifacts:
>      when: always

Beside this one comment, the patch looks good to me:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

