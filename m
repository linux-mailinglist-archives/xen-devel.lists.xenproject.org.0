Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE698769D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 17:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805650.1216797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqX9-0005QZ-Un; Thu, 26 Sep 2024 15:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805650.1216797; Thu, 26 Sep 2024 15:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqX9-0005Ne-RQ; Thu, 26 Sep 2024 15:35:59 +0000
Received: by outflank-mailman (input) for mailman id 805650;
 Thu, 26 Sep 2024 15:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=roLj=QY=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1stqX7-0005NY-Vk
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 15:35:58 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0573a75f-7c1d-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 17:35:56 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2db89fb53f9so869385a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 08:35:56 -0700 (PDT)
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
X-Inumbo-ID: 0573a75f-7c1d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727364955; x=1727969755; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvSLnN5vw/GzKsyoiJq5KqWm4bAM0G/uiqMvk6Hx39w=;
        b=hBR/SGN40M74bfZcus+PStcSWpf8AVo2H0so8vFG8dEOsB6ZaIM8r61BH6iLUD2VyB
         8QTm+lhI4tywWQIuxkeVTu+byAO3mj01U7EvIKUDC0vwAn6tH6jVY2/9CxVdQhI3WNFM
         yGOMDA8H5Pqt6U3LbfIdX/1Fdjg7rntJbxblU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727364955; x=1727969755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvSLnN5vw/GzKsyoiJq5KqWm4bAM0G/uiqMvk6Hx39w=;
        b=gNMUTojKIuy6kOy3RO4Dzijaq7Pj72DS8AeGuIGGI6fVM4+tqSib3CzZBkPZlvzece
         88cQDeJvKmK0h8LHqUxovwik5UQmUE6aPdQc1Je+HIYL9dAqPMvtM+fXrtD/+8rGiIvS
         FFB4fjjnP/ajDeRG4S92KyaEBJWhHRi6WiAobCzN/omQIlfHMOYZ4+V/d8CTxlijbWVI
         nniaGnWNtbOXxfG1HBejhnfevW2xvY+TtemgHNWL5On1veW7nkbOxLxUuMVMi/stPgkM
         IxeHw77GtSIKNRfLqMS9FRo2h725EeGxD9fpduEvnHCLhP6lNRIU9lpVcwzs4HJWMaK5
         jU4A==
X-Gm-Message-State: AOJu0Yy9XXs03Irs4K3A0DGSsiQlD68c/cODM7JgUWaJYzeQ/s/Ic4Gi
	e1DdltLRct5Ef8O79dYTqPDpNqsssYCKZQNk5UU4rrO7pf7YMe5Mt6DFherBdnXrTlpj/ALidK1
	cyTUMVjsmKtN5Md+oh0GRwe1UuEN4pmLVew3A
X-Google-Smtp-Source: AGHT+IFl3v3oEZWT1zmVWEZzU5Fnj0mtdIYTedmUEIO0xnrbQ7pHOaI3LHn8v6bt7UZB/khuM/WLFmzuGdNzEcAvw5Q=
X-Received: by 2002:a17:90a:f40f:b0:2d1:c9c8:301c with SMTP id
 98e67ed59e1d1-2e0b8ec8c02mr95476a91.29.1727364955294; Thu, 26 Sep 2024
 08:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240926101431.97444-1-roger.pau@citrix.com> <20240926101431.97444-2-roger.pau@citrix.com>
In-Reply-To: <20240926101431.97444-2-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 26 Sep 2024 16:35:43 +0100
Message-ID: <CAG7k0ErQwbS-AB4WLMm_AV1GDnreu5d9qse-QvBR-JZ2FnzMKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] xen/livepatch: drop load_addr Elf section field
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 11:21=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> The Elf loading logic will initially use the `data` section field to stas=
h a
> pointer to the temporary loaded data (from the buffer allocated in
> livepatch_upload(), which is later relocated and the new pointer stashed =
in
> `load_addr`.
>
> Remove this dual field usage and use an `addr` uniformly.  Initially data=
 will
> point to the temporary buffer, until relocation happens, at which point t=
he
> pointer will be updated to the relocated address.
>
> This avoids leaking a dangling pointer in the `data` field once the tempo=
rary
> buffer is freed by livepatch_upload().
>
> Note the `addr` field cannot retain the const attribute from the previous
> `data`field, as there's logic that performs manipulations against the loa=
ded
> sections, like applying relocations or sorting the exception table.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

