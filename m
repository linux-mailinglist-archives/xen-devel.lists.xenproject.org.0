Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCCD58CB57
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 17:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382491.617421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL4mt-0001ti-Pf; Mon, 08 Aug 2022 15:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382491.617421; Mon, 08 Aug 2022 15:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL4mt-0001rv-Mr; Mon, 08 Aug 2022 15:35:27 +0000
Received: by outflank-mailman (input) for mailman id 382491;
 Mon, 08 Aug 2022 15:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrjU=YM=citrix.com=prvs=2124ac30a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oL4mr-0001rW-R0
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 15:35:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b78413f0-172f-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 17:35:24 +0200 (CEST)
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
X-Inumbo-ID: b78413f0-172f-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659972924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fmSmf4dxev8BX9UnBlmgZx5kzHy7hC/FmOB8GnvpseA=;
  b=gDTHGKQ3CsGykvT1hj1dDsFxcmYN1fK6WOG7v3GGh0AZ2ESy2tisynz4
   shzLjJvZbEWxRWZaRwinMfPks45zI+F288afpJVotIXS9DRR8bcZalNOa
   cYU9T+eL0G5s4iM5RQUWrHngs60tcMk5WBy5EagJdemtglxzydAXYgXSC
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77617159
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Ah31NN6BJ+URFNRVWkefolKxfNB/EJm4LizeM4?=
 =?us-ascii?q?r3joE0InEoKPFUCq0HgJSnKGYA4Qc41jMxiXanNTTvWBpoYkwc3S4cn6jLgL?=
 =?us-ascii?q?Yjshj2TamjNzvQeJpR1L3L6ckNe8Pv/S33kuYoXGJ4N4voonDMRdAbur0H3o?=
 =?us-ascii?q?Z2sgae/s5wy76/7HAlA9Cs/FZguI+QR7LXYCbK1ah7m5AjeH2wG2+upqEc0X?=
 =?us-ascii?q?NEkApJDxGP2crIBfbHjuYxE19XzrC5ZRgoUOj9QLMgn4I8np/gKZJyhtteHE?=
 =?us-ascii?q?+oWaEFCVDofjpckYfQ4Qzzzue+hhvZ7gi6fzW0Gx98rZnrVqz6vv38SNjT7/?=
 =?us-ascii?q?PM2OA3Va0gFq/VXHLVNy1SjD+SBo2JzePssHzTfXRWpIdVRD8gYiaj2o2xgn?=
 =?us-ascii?q?NrbuiDGM/TUQ8hQr4QOMAZSwLKlAQ9SqF9P1e1r9W1xQ48JOYwvV5mayHRk6?=
 =?us-ascii?q?AwGxHGDxU0J+96MbMCdxteN+UdDwhTiW8q5lwJA4QIg/1fJdO9VMaMedQYjn?=
 =?us-ascii?q?ToJyGrpe++dNm9MOeVIjPxLGM96ne9oDv6A3fha7nQ9GpSfsRzVDLgGJ5cS9?=
 =?us-ascii?q?v2/4uofiXIuyxId44Osard6t5ZLoH2fDEcIEK9vpo6LO693/kjo+HmpmJj7h?=
 =?us-ascii?q?jVk/JgsWPdn8FsC5Cj4+7DGorNCOh6qS/7KP6wC9141+oSR7kyfQ59Bfr8oE?=
 =?us-ascii?q?u+trtQsX+bmIZlmK2wnt6cR+sODXMIouxWA0NGQWAHBSUy2IQx3MvznlbMQl?=
 =?us-ascii?q?NhN20dVSl2U+Z7pjswTGVwd2r/JjkMSu9ZRYjsLEkn27DS+34c5umZve2N67?=
 =?us-ascii?q?gZw9nzCgpauWqeli/+kLUa9WysI8bBBDFbvqADTgYvfYbyNbol7wPT+j0Fym?=
 =?us-ascii?q?phIHmn9iYAb0oou42SHMy3FX/aFlJvkjBeVECtdQ0X+HqZ8qd/8gDh27i59h?=
 =?us-ascii?q?oNkK0P8+qQhMnSh8GxpKO3p3QlKZk2hA87d+P5DSrlul18Ybz6OPIRsJE2zP?=
 =?us-ascii?q?CBc9zdTj8nht32r6ti0cIQwx5Ku2DLsCStg9flvM84Pf4BYHSEf+g946xTCx?=
 =?us-ascii?q?9LzaIQQo2fVH5tCzh9BI4j2fNcm3BqiP4GpFGoAsTbSZvS/swDnEeS4rt1I7?=
 =?us-ascii?q?H26NxZ/D9oZO/UJCZo5psza9KJd7ZoOiHwTsHa710ZJ3nLzXuabx/CK1monl?=
 =?us-ascii?q?/8iW1M2yZrEf5bvYhP1/YBz0T4M6NaRAHDoJY4+mJSTCcCWBBqbPB52r47aJ?=
 =?us-ascii?q?DSf2jqM5lEo1GTC/8MdNP5ki4Ao6oRkOoAAPIxgYv+UA9FCSI0JJgbbcV5bf?=
 =?us-ascii?q?jQ0sfTXym4sbeHkLNKtBYuuL5BTB0SI3bUAae3U7JCqEiokZTr4rXQen+A5w?=
 =?us-ascii?q?3+1rnZnVHkSH8N+EqMiBxKU1Uhtn6sSDjtQc6fWVqFyyNJaByNmb2BXDcy7K?=
 =?us-ascii?q?AXZ4xDO+jDoSy+X2dR3t3P5iVMhC5UKKIhz3CIcd9MACsQtbtwchry2GjhFI?=
 =?us-ascii?q?kFcB0Tq7WYoK+6kwWlZO2/uy/IHkL101iiNRzpQmUsWBuSxPKyndUycNqQnJ?=
 =?us-ascii?q?q4ZbcFhw1CpeJfpHD+7PsMSq3h4UKlsvGbpOBoX3TfMFm9Jw7hf2ToN2eVdx?=
 =?us-ascii?q?/K202+Noch/SWFcWmP83SH/0HAJF8fez3biO2P80OwFpT6pA9tIYlMVU5Uho?=
 =?us-ascii?q?byzPhc3UnKZzo7CZ+KpQPMb7V4knGTWTtuplmtnwOnWBTyQV/NlTx+buCAtb?=
 =?us-ascii?q?OscnCAXw1qmr8wBkMf2JZEXL0JQscsyHJoK/X2/K0/nqeOI7BElF8+Uq8UaS?=
 =?us-ascii?q?bHZy73ef8dAMqZYGVfQYpJFh+qfmmA77eqGSZZOibtxkTdOkhqZ0CuiFhu9k?=
 =?us-ascii?q?VUsuI684BHiOwvO134dO/T2Z3dNyMlHeDAu1R2LQD8gNQ0GdAtFwyBrbiH1i?=
 =?us-ascii?q?pULkrrJzHo5vsUt6MHAcqsHc8kxsZm5zOlSiIpYRBCb43zNgX2uFvaQTvm9y?=
 =?us-ascii?q?ZhGZlgOazeEc72SrszetiXu8ddLBrKvwm4axJGShJzTWNMAlDLZM4b7Aahhk?=
 =?us-ascii?q?1lyBjupJbpxdbIf4RtOyGi+CN+Ri+jiVh4grTJwGOwITQLTJXye2DxlTrqFL?=
 =?us-ascii?q?f6Obt2q2t/ZCnw8hfZO9wi4kK2+xhnS4r/OliA5iH6zcvItaM7JDIEQ1ZIFu?=
 =?us-ascii?q?6bAELE2bUnrG/O3lplo1c5Syw5Vp1Pe8gKX1vQfH1u3apTLmw8hHSDu+mGDI?=
 =?us-ascii?q?ulkUvux4A22/DAxC+/2k9MykmsAkf9fe2bMB+HQAkztg9T1JUMdTIksJHgml?=
 =?us-ascii?q?bMVW+EXqiGZrf7FDZ22bq1mappa21rg2Ua7Uw0X1tOKC3+vxwvTQn1/4MrcF?=
 =?us-ascii?q?4kkXrZ9ixYlEQKx3LAWsjWYn9VbPoMYtP2dOe1tJz4zXJp0y97hSL/X+QYpj?=
 =?us-ascii?q?yw+uSYlX+8syTQl188Lk8JVDhZA1QamnygOwt9KDBGlQQJNNJaNoXYXsd5lp?=
 =?us-ascii?q?7fDFZPs3lEOjm9DrWk0C9qwEV6NDuGA4oWy4w8Q6KC+nymzZ8HVXTc5Wls/E?=
 =?us-ascii?q?HlopkTp3B000WaC41nMvfh7k5qc9lj3HiQQdHOc0DatR0zjsVUHpEiWwVvBR?=
 =?us-ascii?q?PgvmoIfpN6mSSOn1Lr7FHEmtqMk96o+mA5s3JzWtnRXptqCwIZi7WKKGg3xR?=
 =?us-ascii?q?exq6gao5Fv0pS5cPVREgjqQ0QK92rIdbfGHHAh0d1ZGvLy2cb266tNQjb2nW?=
 =?us-ascii?q?SZWUeocITFZJxZEjNUhi6dq9Q=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,222,1654574400"; 
   d="scan'208";a="77617159"
Date: Mon, 8 Aug 2022 16:35:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 11/25] tools/xentrace: rework Makefile
Message-ID: <YvEtMQi5NR8ynV6T@perard.uk.xensource.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-12-anthony.perard@citrix.com>
 <F815868F-E754-451E-B7E1-488258D5EF62@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F815868F-E754-451E-B7E1-488258D5EF62@arm.com>

On Fri, Jul 22, 2022 at 01:30:53PM +0000, Luca Fancellu wrote:
> > On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > .PHONY: uninstall
> > uninstall:
> > 	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(LIBBIN))
> > 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(SCRIPTS))
> > 	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(SBIN))
> > -ifneq ($(BIN),)
> > 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(BIN))
> > -endif
> 
> Why here don’t we use $(RM) ?

Well, I don't think it matters which is used between $(RM) and rm -f,
beside consistency maybe. So I don't think introducing changes on those
line would be useful. (Also, it seems that the use of $(RM) for
"uninstall" targets are exceptional so far.)

-- 
Anthony PERARD

