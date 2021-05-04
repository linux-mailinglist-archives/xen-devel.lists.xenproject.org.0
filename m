Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D7372CB2
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 17:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122512.231069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldwZi-00056I-1j; Tue, 04 May 2021 15:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122512.231069; Tue, 04 May 2021 15:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldwZh-00055t-Uv; Tue, 04 May 2021 15:03:01 +0000
Received: by outflank-mailman (input) for mailman id 122512;
 Tue, 04 May 2021 15:03:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldwZg-00055m-Rm
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 15:03:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c89b14fa-7a20-4a7f-8e60-a47346bcbc15;
 Tue, 04 May 2021 15:02:59 +0000 (UTC)
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
X-Inumbo-ID: c89b14fa-7a20-4a7f-8e60-a47346bcbc15
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620140579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bZGXlmwhAsPJxG4m5DpEz4VqP2Ra9gEBwL/WyieoUwQ=;
  b=egsxCaPy19OH+ZQCIiyqhAWWcmVjatGhEeQJ4+pwjd4fP/ePC5yoakew
   YJaWI9Gs8kbPtKrk/1yRJ9hI7H2NSW517Sp4n1lYfsS6oP30PtDw3GJsU
   vy/fVU33v/aH3ugw7plkTKEUCu/ZVElNpmf78UCTeLTFpXAK2sJxyX8SF
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LXlZInGMc84TC13rmkdvYlglLgEPiYzHshJbYVslgnsuVGucC3WnlT2tt2Q9DeaVZATqjJYJUP
 +YCNFFzNunCebmOumatmw/dVL2cTDBwuC5HHa58nbSYoC5vhDOCn+HY9R30axF8FAcAJkrQdnC
 IJlehiPu1xdHxgIQnwp7cnpclin2JRD3+mgQzRqsrB8vBlv88h9RWAdynnRAfld7SbKJO7jorX
 S+X1NcJn2ULIgSKucAN7iB/nFcYfUO0W+ASpaJbCFu766EPyrYlWAjg4Jo8c8wRn3W2aPs5akj
 erc=
X-SBRS: 5.1
X-MesageID: 43044107
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wNupua/pajgfEffGhfhuk+BJI+orLtY04lQ7vn1ZYzY9SK2lvu
 qpm+kW0gKxpTYKQXc7mc2BPq7oewK6ybde544NMbC+GDT3oWfAFvAH0aLOyyDtcheTysdzzq
 FlGpIQNPTRChxAgd/+8E2EFb8bsb+62YSJocub8Ht3VwFtbMhbnmJEIyKWCFd/SgUDJbdRLu
 v+2uN9qzCteWsaY62AbxFvNYX+jubGm578bRkNCwRP0njtsRqS5KPnCB/d5x8CUlp0sM4f2F
 LYmA/07LjLiZGG4yLbvlW806hr
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43044107"
Date: Tue, 4 May 2021 16:02:55 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <george.dunlap@citrix.com>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC v2 6/7] libxl: implement device add/remove/destroy
 functions generation
Message-ID: <YJFiH9dFdlq2l87k@perard>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
 <5986715fe1d677533b67c06e9561cd716716d46a.1614734296.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5986715fe1d677533b67c06e9561cd716716d46a.1614734296.git.rosbrookn@ainfosec.com>

On Tue, Mar 02, 2021 at 08:46:18PM -0500, Nick Rosbrook wrote:
> +def libxl_func_define_device_add(func):
> +    s = ''
> +
> +    return_type = func.return_type.typename
> +    if isinstance(func.return_type, idl.Enumeration):
> +        return_type = idl.integer.typename
> +
> +    params = ', '.join([ ty.make_arg(name) for (name,ty) in func.params ])
> +
> +    s += '{0} {1}({2})\n'.format(return_type, func.name, params)
> +    s += '{\n'
> +    s += '\tAO_CREATE(ctx, domid, ao_how);\n'
> +    s += '\tlibxl__ao_device *aodev;\n\n'
> +    s += '\tGCNEW(aodev);\n'
> +    s += '\tlibxl__prepare_ao_device(ao, aodev);\n'
> +    s += '\taodev->action = LIBXL__DEVICE_ACTION_ADD;\n'
> +    s += '\taodev->callback = device_addrm_aocomplete;\n'
> +    s += '\taodev->update_json = true;\n'
> +    s += '\tlibxl__{0}(egc, domid, type, aodev);\n\n'.format(func.rawname)
> +    s += '\treturn AO_INPROGRESS;\n'
> +    s += '}\n'

That's kind of hard to read, I think we could use python's triple-quote
(or triple double-quote) ''' or """ to have a multi-line string and
remove all those \t \n
Something like:

    s = '''
    {ret} {func}({params})
    {{
        return ERROR_FAIL;
        libxl__{rawname}(gc);
    }}
    '''.format(ret=return_type, func=func.name, params=params,
               rawname=func.rawname)

That would produce some extra indentation in the generated C file, but
that doesn't matter to me. They could be removed with textwrap.dedent()
if needed.

Thanks,

-- 
Anthony PERARD

