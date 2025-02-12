Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE52A324FD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886362.1296028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAyL-00086R-6x; Wed, 12 Feb 2025 11:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886362.1296028; Wed, 12 Feb 2025 11:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAyL-000847-3Z; Wed, 12 Feb 2025 11:32:05 +0000
Received: by outflank-mailman (input) for mailman id 886362;
 Wed, 12 Feb 2025 11:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uxJh=VD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tiAyJ-00083z-Nt
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:32:03 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa257bc7-e934-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 12:32:02 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2fa2eb7eb45so1142162a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:32:02 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b7b20sm1364431a91.17.2025.02.12.03.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 03:32:00 -0800 (PST)
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
X-Inumbo-ID: fa257bc7-e934-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739359921; x=1739964721; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wEP4/rSQpYx4Fj/Xw9srDGCOa9S8mK4Q4Bnmz1C18gs=;
        b=P+8/M96yf+iHcdHEBpPr0Oeu7xR+eH9UGP61UHrJZyNCQVJps04EEFLJSNL+qfgOqe
         tOLwE74QvVKHgzMAfqqaQ5D5xCPEgqcXtNWcrwzm8jlQS6a7cyUiX10IFhdcG3xek0Zt
         xWfB+aQNeLypdNXe3WUGxKajczn8roRbSuOxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359921; x=1739964721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEP4/rSQpYx4Fj/Xw9srDGCOa9S8mK4Q4Bnmz1C18gs=;
        b=nh9HVffrN/TKwm2TdzYHdIjgu0k7e9pn/GuMwA5RUC8TIJ6RYFbRd/4vlvFi+789au
         Is/jOkK5GB5+m2HDERKU3Q+ZH0SH6xBpIq13/yEQMlIbRFfoEW0dSwvuqZI2XJ4PwWmm
         4Sd9Bp3kxOsHaeYJ5Qt0/H5e+TOHxzWBxmPgyKauolbVYR1kwSdstymC/jPatVcdYLD5
         W5i0rMgRu1xQHfk5gOheZ8zM9iGTIhSj1eoxSknF3s4DE6RfA7ImdS+FUxNnd3ZLMEz9
         Y6PbgQwrGrOLRlBlLp/GrRBmu2lzDkpMuAkqbwMA48vjeMuAhCiSvrYUKFwsmsIJ4CCs
         g+ng==
X-Forwarded-Encrypted: i=1; AJvYcCVM8aGujHYHqf48iLq8gldfX3gZ1b8yHqRCiv9ibtHVPAvYhWrljDWCZuMcWNCUE6KEtXI726AxAzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrdVAtroL0W8OxHeT11vERlrjULA0AFQMBLxJ4Gq3exuCxkO73
	E/TmjdeDTHZZxqxpPuNX9tDshtirTA++7i8M6ZI5Am3Khhi704puFizIH5oMO8Y=
X-Gm-Gg: ASbGncsTX1D+uyrna6w4+9GwwUa9wsKC0C9P90gbhuFEtgxe745UsAGbmn52UyFkbei
	JzaMUdrIVmygRPauVaNZxWkL9apwAJfSO36iqPDXVpFyJUTC3U+M+cWyNHsK5mQMrUHa8Kyy7ze
	nRc2mE5ITsg+tF/qzn5S0dWf4fTRbDfqm25Ww0aDw6TVImMWJ4vQ4F3HTys4xroYE28fgB+pFMI
	XyoIdd0WJngTkZFaHV8ZkJLX4EdGTdYV9YGOLNk4Vzt1N0OmeKXW6N6sBVTk3TMOZzd9tgC+4pt
	MISR7Wb5vWy0iboIMo9F
X-Google-Smtp-Source: AGHT+IHuy8Ux8XtnzGfmu+CBTUC8hmUeHXB6ejOeJqzEAajGV8Mt71N1BsSB4wyBIUtpzNVouaMJtA==
X-Received: by 2002:a17:90b:2803:b0:2ee:cbd0:4910 with SMTP id 98e67ed59e1d1-2fbf5be0a40mr4628556a91.1.1739359920949;
        Wed, 12 Feb 2025 03:32:00 -0800 (PST)
Date: Wed, 12 Feb 2025 12:31:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6yGq6TEIfavyPIS@macbook.local>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <alpine.DEB.2.22.394.2502111426380.619090@ubuntu-linux-20-04-desktop>
 <Z6xma27ZxfeHK6Y0@macbook.local>
 <65fcc449-3b15-4e14-995a-ddd3bec9f3d0@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65fcc449-3b15-4e14-995a-ddd3bec9f3d0@epam.com>

On Wed, Feb 12, 2025 at 01:14:20PM +0200, Grygorii Strashko wrote:
> Hi
> 
> On 12.02.25 11:14, Roger Pau Monné wrote:
> > On Tue, Feb 11, 2025 at 02:33:08PM -0800, Stefano Stabellini wrote:
> > > Hi Oleksandr,
> > > 
> > > This morning, we had a discussion among maintainers, and the suggested
> > > approach moving forward is as follows:
> > > 
> > > - First, it would be helpful to see a sample of the proposed changes
> > >    applied to a single source file as an example. If you could provide
> > >    such a patch, it would help advance the discussion.
> > > 
> > > - If the changes are acceptable, we need to properly document the new
> > >    coding style in xen.git. If not, we will need to iterate again. We may
> > >    also need to add a "xen" template to clang-format.
> > > 
> > > - Once finalized, we will proceed by making changes to the Xen source
> > >    code piece by piece, as you suggested, rather than applying a single
> > >    large patch.
> > 
> > No objections, just wandering myself whether it was considered to
> > initially only apply the new style to new chunks of code?  Using
> > `git-clang-format` or similar as suggested by Anthony.
> > 
> > Is the adjusted style expected to be too different from the current
> > one as such approach would lead to hard to read code due to the mixed
> > styles?
> 
> Sorry for may be dumb question, but wouldn't it be reasonable to consider
> adding just .clang-format specification to the Xen code base without
> automation features?

Yes, ti can be considered, but I think part of the desire to have
clang-format is so checking can be automated.

In any case, even if checking is not initially automated, whatever
rules are in .clang-format must be in-line with the coding style
document.  Otherwise the presence of .clang-format would just be
misleading if the resulting generated format doesn't adhere to our
coding style.

Thanks, Roger.

