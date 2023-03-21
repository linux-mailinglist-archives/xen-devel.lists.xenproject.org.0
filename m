Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085146C2EAB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512304.792219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZAH-000229-1P; Tue, 21 Mar 2023 10:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512304.792219; Tue, 21 Mar 2023 10:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZAG-00020N-Uf; Tue, 21 Mar 2023 10:24:24 +0000
Received: by outflank-mailman (input) for mailman id 512304;
 Tue, 21 Mar 2023 10:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/aZB=7N=citrix.com=prvs=43775ecc5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1peZAF-00020H-6S
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:24:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89702918-c7d2-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 11:24:20 +0100 (CET)
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
X-Inumbo-ID: 89702918-c7d2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679394260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=B476DAs0DWiIC9ZHrxZxpowmSvC2692orHcMW30yFDg=;
  b=hEoX68eSt/LEkze9fU0LD5bQzIzXTFewofKqS0kx+sQM7hrKi/f/Amf4
   w6SBQbt8j527zFhaceQRE62S+K5QXFP7NFZHMO1LlK7hlHSCusXdSKaeb
   T33S0i4CHBvYEaU3zylIXP/Py+BmQr4S9sSBGXdRaIKEmLc05/fZmXW++
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101046303
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zYrTq64Q2Y7SPGnfxXTY/wxRtCPHchMFZxGqfqrLsTDasY5as4F+v
 jNMUTqOPfyNMWv9KYt3YYi//EkO6J/cxtRjTlM4+XsyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 vIJdzMoNAG6tdmLkZW4RetPoPkjFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7B/
 j6YpDyiav0cHNrP4AqP7SyPv+vCrAXSBdNOSbP/1sc/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGpLA/7kWxQvHhXhezpziPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehndrvCSZ+rb69RneU97PSpjS3UQAXInUFfjQsVhYe7p/op4Rbs/7UZo89Sujv1ISzQGyuh
 WnQ90DSmon/k+Y02bTk/nWdkguenaWYaQ065CbxY2Kcu1YRiJGeW2C41bTKxa8ec9fCEATR5
 SNsd9u2t75XU8zU/MCZaKBURezyua7YWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25SI55wpUQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnEIJ33Ui5EUvw3llJaotvxN5dxnkgDKZ77H8inn3xLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 uuzw/Cikk0FOMWnO3G/2ddKfTg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9U4wv8PzbuYo
 BlQmCZwkTLCuJEOEi3SAlgLVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:b96nqa/r6KvHlSM04QZuk+DPI+orL9Y04lQ7vn2ZLiYlEfBw9v
 rPoB1/73SftN9/Yh8dcK+7Scy9qB/nmaKdgrN9AV7BZniFhILAFugL0WKI+Vzd8kPFmdK13J
 0QF5RDNA==
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101046303"
Date: Tue, 21 Mar 2023 10:24:10 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] tools/xl: allow split_string_into_pair() to trim
 values
Message-ID: <a9c4430b-3205-402c-9eba-37aaffbf0c29@perard>
References: <20230317111546.18061-1-jgross@suse.com>
 <20230317111546.18061-2-jgross@suse.com>
 <CAKf6xpsV1Xq0PiK_iqBDV0fpvkA0K6E-cbFXvhS3grjiuAkMGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpsV1Xq0PiK_iqBDV0fpvkA0K6E-cbFXvhS3grjiuAkMGA@mail.gmail.com>

On Mon, Mar 20, 2023 at 01:05:13PM -0400, Jason Andryuk wrote:
> On Fri, Mar 17, 2023 at 7:16 AM Juergen Gross <jgross@suse.com> wrote:
> >
> > Most use cases of split_string_into_pair() are requiring the returned
> > strings to be white space trimmed.
> >
> > In order to avoid the same code pattern multiple times, add a predicate
> > parameter to split_string_into_pair() which can be specified to call
> > trim() with that predicate for the string pair returned. Specifying
> > NULL for the predicate will avoid the call of trim().
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

