Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F3F4291AE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206137.361643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwCZ-0006ia-IG; Mon, 11 Oct 2021 14:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206137.361643; Mon, 11 Oct 2021 14:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwCZ-0006gk-F0; Mon, 11 Oct 2021 14:22:51 +0000
Received: by outflank-mailman (input) for mailman id 206137;
 Mon, 11 Oct 2021 14:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZwCY-0006fJ-6l
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:22:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe9722b9-b6af-4691-a7b4-c778a04fca80;
 Mon, 11 Oct 2021 14:22:49 +0000 (UTC)
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
X-Inumbo-ID: fe9722b9-b6af-4691-a7b4-c778a04fca80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633962169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tX5/QVzzkAiTeJF4H2vdtKAV07e/76s4GmbMS2DiTfM=;
  b=W5EM6Av5v1SGkUDNA/38VVKLO81HjYTFKwJHvV/wYnOj1J/aFJfBSIEf
   oaT53SNz7dindoUxiRWYixulkWy63PnqP2cGeyvO4d2GEK3hN6hYZyE+9
   Oyj4OL2GZRz82/NgrF4w6Pq6+PMITyVHBYvqrSYomsW9uoQHGU8gdQPVn
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tzQnUxYX9IZHPnkZJd88ADDJCBe4wRrW5O+LImm0KY8PwL2hliGb22kodHvC1A0lMbgo8rj8V1
 n763MZOoHB4NgMTSqn3o1EChqpFYnet6zvuDiVOGFwttDl/+0jQJPYT9yxkg+yJLBsuMf1EGuB
 gn8x2F7nhf+ZLXf+Q7p9ehxaUEHMDhnV5hZSsvnBljwsA3B1nZTCTBTdZuRY/A2Iayc0Negj0h
 gjSCOxKNWmnn5df/y0fGzQ2pwtvJPvNKGA0LysYQvHH8ukfEYAjtd2JzJ03u+WV0HwcWT2qdXA
 4TESsr8WIaOrIt4X8xEs7gdP
X-SBRS: 5.1
X-MesageID: 54919159
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7FZlpaoYC7wEfO/s9HvyCIy30ANeBmKZYhIvgKrLsJaIsI4StFCzt
 garIBnQM/2JZDCmc98jbdni8ksHu8fdmoNiHVFlqS1nEytD95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncKweyAGb5zdoe4ycyIJPj4hB6Bs3YaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 pZIMGs2MUWojxtnEXlQN58RuOuUrSP4YRZypW+Vqqwv/D2GpOB2+Oe0a4eEEjCQfu1rmUKfq
 nPD7n7OKBgQP9yCyhKI6nupwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QW5y4voK4a5EGtCN7nUHWQonSJoxodUNp4CPAh5UeGza+8yx2CGmEOQzpFadonnMw7Xzon0
 hmOhdyBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZVUF0f7M8bAitxjgbu0yPbHqtNDfPAill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn6tl0hNeZJc6TtsAKBta8Rc+51W3HY5
 CBc8/Vy+tziGn1keMale+4KAK2yr8iMNDnRkDaD9LFwqmzzpRZPkW1WiQySxXuF0O5YKVcFg
 2eJ4Gu9AaO/2lPwMMebhKrrWqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8zAIZf0Ui9DVfo8pNZTewv7+eRxrszZ7TmCLa0XMjz9iebODJJrYeZt3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGMmbP/2WsidCBhbbiv8pQ/XrfafmJORTFwY9eMkOhJU9E0wMxoehLgo
 yjVtrlwkwGk2xUq6GyiNxheVV8Ydc8n9yxkZnZwYQ/ANrpKSd/H0ZrzvqAfJdEPnNGPB9YoJ
 xXcU8nfUPlJVBrd/DERMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421OJW4cHSiRjEN3SNKClwWSusCVPg+l1RUbJfIVeIR2+7IhwJiXtpfYrOMVQew7bzz6X2
 l/OUxcVrOXAuaEv99zNifzWpoulCbImTEFbA3Pa/fC9MiyDpjivxopJUeCpezHBVTyrpPX+N
 LsNl/ylaa8JhldHtYZ4Ao1H96Nm6ou9vaJewyRlAG7PMwahBIR/LyTUxsJIrKBMmONU4FPkR
 kKV99BGEryVI8e5QkUJLQ8oY+nfh/EZnj7esaY8LEngvXIl+bOGVQNZPgWWiTwbJ7xwadt3z
 eAksc8Qygq+lht1bYrW0nEKrzyBfi4aTqEqlpAGG4u62AMkx2ZLbYHYFiKrsoqEbM9BMxVyL
 zKZ7EYYa2+wGqYWn6IPKEXw
IronPort-HdrOrdr: A9a23:Y6BRD6Pm/6MnbcBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54919159"
Date: Mon, 11 Oct 2021 15:22:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 18/51] build: fix $(TARGET).efi creation in
 arch/arm
Message-ID: <YWRIrgSk2FbAUup5@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-19-anthony.perard@citrix.com>
 <34b274ae-fb02-10df-85ed-8d5231d49750@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <34b274ae-fb02-10df-85ed-8d5231d49750@suse.com>

On Mon, Oct 11, 2021 at 12:37:55PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > There is no need to try to guess a relative path to the "xen.efi" file,
> > we can simply use $@. Also, there's no need to use `notdir`, make
> > already do that work via $(@F).
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> As to the subject, I don't think "fix" is appropriate. How about "adjust"
> or "simplify" or some such?

"adjust" sound good, thanks.

-- 
Anthony PERARD

