Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F14D881439
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695983.1086419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxbO-0006lr-9r; Wed, 20 Mar 2024 15:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695983.1086419; Wed, 20 Mar 2024 15:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxbO-0006kK-6s; Wed, 20 Mar 2024 15:11:38 +0000
Received: by outflank-mailman (input) for mailman id 695983;
 Wed, 20 Mar 2024 15:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmxbM-0006io-Q7
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:11:36 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22ae35b7-e6cc-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 16:11:33 +0100 (CET)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2228c4c5ac3so9964fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:11:33 -0700 (PDT)
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
X-Inumbo-ID: 22ae35b7-e6cc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710947492; x=1711552292; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0244I174yMserW4WriQI6+VQN+aADe3FDH8sxYcaRVU=;
        b=LWjzwIHXSjarJ3W041k4CIeeMHg6GGTw9CKYIQDvk+ZOn6nMPA1Sk5gfu+48xw1xCx
         0Upbmvm8yu91In04Do6c5GTM6Pgf9qdIRfNdVJFHtkFbwFA8IN6eliz3AyHChpfBXWja
         IXtdrA0FN8/zfaoPHMmX1T0h1cg+KNKzuorw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947492; x=1711552292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0244I174yMserW4WriQI6+VQN+aADe3FDH8sxYcaRVU=;
        b=IQRzBKVMzoqTHaOtn+rLZ/sdyTUpmqiOEXskkm6R6aYmmOAOMFgJ/M7R8m94+f+0DV
         sDDn81uO67mRgP6QjsafQ2WZdtmA/POOwPjnmqthmqaABdWNrXvRGyvPeFwq/T20CRKC
         tV9JNGY09W4NresxXtmutBNCakCuWKWbaLGoal8szC0zbtcjG3rduUXxnJFQw5iaTbMF
         6HGQZlhQZY798eiyi6DzB7Y4p9awSZDozpb07s/Z1QLMkJE0DAt2TMNFgbbPTXmvDiIY
         Z+P+fVC9M2abwLxME5mDN5f1VD3PxsY8kO1MgO+ANMWb/veRo6QjdqoIcpj4yYkw/9BO
         7t1Q==
X-Gm-Message-State: AOJu0YyjPHvGoL00TFYOQ58Wdn7r58/PQhe9jGuFqWcNnZeeSCaF2up1
	0k8qODOXycnxy24ErAbt3yjxliDnJH+EBmX2oK2EjyQcEX85aBZ3TZK9l2f2HXR038am45ZqmLl
	Si52VBgOzLsSFJeP6aedHum7jb1b1L+157wwX5A==
X-Google-Smtp-Source: AGHT+IH40+yX7ezao7mg8F4/9jENJs125mNUqMN9d3TgA6J1IhEGts0e38thHUw8oGuntYx1JoTNzFUi7BTFbXL2WmY=
X-Received: by 2002:a05:6871:7406:b0:222:4bde:fede with SMTP id
 nw6-20020a056871740600b002224bdefedemr22520812oac.13.1710947491914; Wed, 20
 Mar 2024 08:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com> <20240318163552.3808695-4-andrew.cooper3@citrix.com>
In-Reply-To: <20240318163552.3808695-4-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 15:11:21 +0000
Message-ID: <CA+zSX=YwGY_0FNX_b6_N5YDXOwG+um5A3T8Xa_ERrH5ACrHrsQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] xen/rt: Clean up trace handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Most uses of bitfields and __packed are unnecessary.  There is also no ne=
ed to
> cast 'd' to (unsigned char *) before passing it to a function taking void=
 *.
> Switch to new trace_time() API.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

