Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5093A495
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 18:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763401.1173673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWIjd-0001Aj-B8; Tue, 23 Jul 2024 16:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763401.1173673; Tue, 23 Jul 2024 16:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWIjd-00019E-8N; Tue, 23 Jul 2024 16:51:33 +0000
Received: by outflank-mailman (input) for mailman id 763401;
 Tue, 23 Jul 2024 16:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxZo=OX=bounce.vates.tech=bounce-md_30504962.669fdf8f.v1-3735091ab57244a69d6a9754f20f9e49@srs-se1.protection.inumbo.net>)
 id 1sWIjb-000198-AV
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 16:51:31 +0000
Received: from mail177-8.suw61.mandrillapp.com
 (mail177-8.suw61.mandrillapp.com [198.2.177.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdfa9580-4913-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 18:51:28 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-8.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4WT37z39Bjz3sN66w
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 16:51:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3735091ab57244a69d6a9754f20f9e49; Tue, 23 Jul 2024 16:51:27 +0000
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
X-Inumbo-ID: cdfa9580-4913-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721753487; x=1722013987;
	bh=9DLgwX0OhKqKChobq7HnkjF4SNzeRVhkk/PAihevCfI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K6fHq/VYmq4SW+P27JbNXHt7AL162WXhgUqEAed5NgcBttePEX9d2BWZ1J/KIIplA
	 MWs+Da2iMCx6jr9sEQywk8Sd3D3vop5eGdzuSimW+Nts2gmFH5Ye3FI18iIZiZiOm6
	 dLdnOgKjKWAv5RK1sSpVU/fQ8ZCLhKA71p/Klgj742KCMkViFobEvmnS7QxD8L5T+T
	 7VMfdX8ece2F8JmGoF5djMYBF5dXkIKEx9lJ9x5tZJEyN2cHFofC3M58DGGbA3jldI
	 aT07023kTjnSM31pLSYYX5U8ZLybDiGL2IKMvf/23Ysff5A0fIysid3tQAIivZyyrB
	 XFlKXbi+LjI5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721753487; x=1722013987; i=anthony.perard@vates.tech;
	bh=9DLgwX0OhKqKChobq7HnkjF4SNzeRVhkk/PAihevCfI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=v3ISmCWcxsLsJNZPlFNQqs1NptL84DnAfxtVVFFbbWCHlXJiHtda0nqs4FuMI8JXc
	 YIssAgyplyzjFJhmXfVD6iodFgAryQuWkJ0ytIq4I40W9Yc1OQjqRkTVUOyEK/yMZc
	 Ib4SP41XMImnkWOaE7Y55kpKDbWYWHGbfOCfgrH5pXicFpqCvSeKg8q4GzSVDpTlpd
	 ua7vxMbi9Axth+IeJX1neX5Kwg94Hut4Rs3cYACYr8JH/ey3tHdMnPChsrcIjExLNl
	 QyuXfI5L2Hq+O2xSvv+e9RI12B2dCjGyv54vsx9gptRKGvKymqk6WRYDxNd+M3WqB0
	 S2uVC2rDD4DmA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v3=20RESEND]=20tools/lsevtchn:=20Use=20errno=20macro=20to=20handle=20hypercall=20error=20cases?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721753486131
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <Zp/fjdnRNPd59ieB@l14>
References: <8bde5ee38597a86334b86822de920802483a7179.1715100071.git.matthew.barnes@cloud.com>
In-Reply-To: <8bde5ee38597a86334b86822de920802483a7179.1715100071.git.matthew.barnes@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3735091ab57244a69d6a9754f20f9e49?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240723:md
Date: Tue, 23 Jul 2024 16:51:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 15, 2024 at 04:36:03PM +0100, Matthew Barnes wrote:
> Currently, lsevtchn aborts its event channel enumeration when it hits
> its first hypercall error, namely:
> * When an event channel doesn't exist at the specified port
> * When the event channel is owned by Xen
> 
> lsevtchn does not distinguish between different hypercall errors, which
> results in lsevtchn missing potential relevant event channels with
> higher port numbers.
> 
> Use the errno macro to distinguish between hypercall errors, and
> continue event channel enumeration if the hypercall error is not
> critical to enumeration.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> ---
>  tools/xcutils/lsevtchn.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
> index d1710613ddc5..e4b3f88fe4ec 100644
> --- a/tools/xcutils/lsevtchn.c
> +++ b/tools/xcutils/lsevtchn.c
> @@ -24,7 +25,18 @@ int main(int argc, char **argv)
>          status.port = port;
>          rc = xc_evtchn_status(xch, &status);
>          if ( rc < 0 )
> -            break;
> +        {
> +            if ( errno == ESRCH )
> +            {
> +                fprintf(stderr, "Domain ID '%d' does not correspond to valid domain.\n", domid);
> +                break;
> +            }
> +
> +            if ( errno == EINVAL )
> +                break;
> +
> +            continue;

Usually, when there's an error, we want to deal with it properly, and
not blindly ignore them. Instead, could you check for error that are
non-fatal, like described in the patch description?

Also, the code change doesn't reflect the patch description. The
description says "continue if error not fatal", but the implementation
is "exit on few known fatal error".

One other potentially useful thing to do would be to print why
xc_evtchn_status() failed like you did for ESRCH, but with perror() (or
err() or warn()) which print a translation of the errno value into text.
Of course, only in case where we stop the enumeration.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

