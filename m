Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2965AF6EC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400058.641618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFo-0000G1-KX; Tue, 06 Sep 2022 21:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400058.641618; Tue, 06 Sep 2022 21:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFo-0000DU-HY; Tue, 06 Sep 2022 21:37:08 +0000
Received: by outflank-mailman (input) for mailman id 400058;
 Tue, 06 Sep 2022 21:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HoH=ZJ=citrix.com=prvs=2410c4419=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVgFn-0000Cs-4L
 for xen-devel@lists.xen.org; Tue, 06 Sep 2022 21:37:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5393d51a-2e02-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 18:38:26 +0200 (CEST)
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
X-Inumbo-ID: 5393d51a-2e02-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662482306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3WhlFr3nKiparYrd+aDZOzFlNnQ3JOj8V/5RuSbTFTQ=;
  b=GeC5lnQdGdo+OBQtuSAKz1PWfyA/cuIU3NSdtV20LawpHh2/kTa0vauJ
   jIePn5d/E2UBugLvOH5BgZXWIcBDu/G17CaPJyw7aem1IZXtVgLQjGVVV
   K/0ODxAwRA33Ngz26sGE6q4ZxNakNQELO3d9Jr79tj0ol0IdXbpxsrOwJ
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79874608
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Aidd06q1CaEITcVb/H/bDix16xf2zMnBdZdB3s?=
 =?us-ascii?q?9h9DyJ0z/FvzIkanZKB8/OS+U9bHOpMeNiCB5Vf1yJ3P5qbDhymA2h6DsXYn?=
 =?us-ascii?q?qGX3gqNxGmMvFsvv8UKhB9hoMGJO8APlKYaKLNxYXbSBPIf0IGhEUciULn4F?=
 =?us-ascii?q?BPkg/SdoH5a8pQPEdkQex/F1R4dNjdkyjJwG6/DJ996bmm8BfJWhkFnj5KGN?=
 =?us-ascii?q?6TZntUcoQpQpd1jqQjEwXVm3knq6KMUnKyBTwXQgb1fjga6AnBURFN+HoCGJ?=
 =?us-ascii?q?HUkwLPSrgyfU8805RkVN5F44AItNWlnBApeSaA3wJyaswzxjz9WWSUNIO1Le?=
 =?us-ascii?q?lCr1gDEWCZ/UEdaKFBt9jtuat5Vsho70Lcn5rQFlSQPAg6pGQ+wne2kW8H5k?=
 =?us-ascii?q?X2t87hb02AvEe2qgbItZzRPWNRYs+zlTZMEyVaRh/jgsvOG1CmNb79jj8AEY?=
 =?us-ascii?q?bBGsi7PEtkI4WrAFo1SSLU/8bPGmsa3CI9ODIt/0e16BZIkNbKFQUU1J26ts?=
 =?us-ascii?q?zCFJsolWFKDEA35h7IbvLiLgahXPG+/Ro0pLmv/Gi/Q/yUe85e6hfKMQAu46?=
 =?us-ascii?q?HZzWSohxociu1V3m5CX/xLYdBuMcvo1TSqd3W4FuT1U/xPPPpOz4O+KMxTrc?=
 =?us-ascii?q?aEMI1IYmicpijWllnewoKlAivHqT4xd6eRRDlY7057bkvCNZQ19H+pXFhPc0?=
 =?us-ascii?q?fRzZzlAy3NVg+pCR8VeE1B/Evb5oYWMui3aQRzs4b/Y2qrX9Pf899Yv6Ylk4?=
 =?us-ascii?q?Ms9R9njmLFyM9AtgWux5MCGQyRybSECkXiivLc69T5uYyXQJn/bdG3W2ILAn?=
 =?us-ascii?q?hgWotnXQ9iE0gXYAagdGcedhtkzrkOPcb/Un/o1+//N/hpuw7oAKoHpLlgsP?=
 =?us-ascii?q?Gmo0CX3J8WSyJyy/6dDSlZH8QUq0tD5ZuPzbinQh6A0ziyYJUBQ7vVg26qOP?=
 =?us-ascii?q?1jKhYbV+eBjSH44hOL4sOxj/W+3/u9OIIq+9ZyzqWeaa3Uws4Zg1kQ0uN0zH?=
 =?us-ascii?q?MmvHHLWmpap2syJNRiOWCFgciw+Q2qMwYcvUc35wrJ01OMjk7YdWqYPNolHL?=
 =?us-ascii?q?CoO5paJCUrW07hQizit1V1BpTvtTCtF9AT2RRsJZyhn3PTMYRCdClGGQaAg7?=
 =?us-ascii?q?3zN1t88yiZZyPgQ4N2nk+IcjqD+DTEX2t/q6WH67B4gkTZY7NFepVx6aHyfb?=
 =?us-ascii?q?0qyq8NVtqm+Lco5xnkDICxD/UTtTu972BEk1hnm/FVEuT+1VgmPPrjiI43mH?=
 =?us-ascii?q?SbllCV8y/fqKZbVLjs2vqDi0IGQzQP58XofgsaFFyWd7JkaxgaRONd+YoDPn?=
 =?us-ascii?q?2pgbHN+MX8kSRolUnBYGFX7h5XNCTT6Dbxpb+hdtPAosmBXLayjUBEPE0BXc?=
 =?us-ascii?q?XrRUgwxjlgq0IsSYKqfjv8y07oUlwZLDxqjO7CMvYaCYi/4ZfIglIbQ2SZg3?=
 =?us-ascii?q?22FkU1Cjs9kiR5FaOVaK0e8VyHvx6U/dpIryDftL8kKyvmnezA7FLk9bW6jB?=
 =?us-ascii?q?y2M0r0c5aODJQLhC7saPi2xTipxfFibAFd2ks0jyTw8f8bvD7OBv/xSuRWQ4?=
 =?us-ascii?q?yf6feywJ+A/GBQByZq9EeEI1h4y3DTKj1Yzs/hUfQrVdotNmvrE1aCDNfA/t?=
 =?us-ascii?q?7a+8NIoiKyNK5YOnaYM5gwp9bhQpxf4S4LVX16CFSu6Uvo+wFQjQMk4NHM0d?=
 =?us-ascii?q?648vj6CKVMlKfla+Mu7CnYZ6kpYxoh8L8q9eOWju1DN/kN1SzkbTG0xl8Ymr?=
 =?us-ascii?q?+K8HcDNO7nTwCpOHPJki5XKuN11NcNywz8qnaVv0PX+mVF6/NM2rQuOtnWTq?=
 =?us-ascii?q?E7UdOrQnsRS0lWs4T9ODhw8tGlx02qI3RuZEZcnEs3LkrMM6PeWHpnFjSZce?=
 =?us-ascii?q?vvFA0RaSm6HTd0JE6z+P9K0Gj3UqC/qHsevaWeqnaLsD2xPtcXMxnUff0ORm?=
 =?us-ascii?q?Do+IZzOXkQz4N3W5yXZdcte3qrAHVP2wjCFRxkSS8IeTVda0MkZ9oMqawD4I?=
 =?us-ascii?q?aWKtSG7FDp6JAZV58v1SvV8SfvquLu0pEU2naGsjLVc2rYfx6QP4/R3DgwaC?=
 =?us-ascii?q?X7TaRxv+1i0s8qdYb8tXWq1wbWPp/3q9MDEdU3DZeKGpgSGYu0ek1KsdiPxS?=
 =?us-ascii?q?XL2XXH7F/z8aSKckfJxP1PQ0PcAd2HUMvrb5Ub8CZGTyYSv5c4eeDhtoc2qy?=
 =?us-ascii?q?FLgWGKbh5l9YPwmqWGQw7UQjzAS+Dbnxg0V0pHp6sViu47HgvUFvTILcQ8x1?=
 =?us-ascii?q?f4tQ8uF90KzchEgqNUuwbw8+mm6PAC24/zkXrLjZw+rDdMivrLWsJALRHNII?=
 =?us-ascii?q?v4LSw8eMEij6hwte5cmjUmXmA4BFO0gvHFZMM6yGkVW2wqWfaYwrwQ/lwmUQ?=
 =?us-ascii?q?rmtTFNiApqr+xSfpfJ9CcQEIgD2Wy9sbuay4l8lJvFKV2V/52PtJDSl3kzMe?=
 =?us-ascii?q?JfeuYk4otyOR0zx++BNZvNJcjQCDzGvbcjZqsaL+R7PJz3rApCHI4Irq23bh?=
 =?us-ascii?q?vD7zejPVcpjw8MUICAsUSJIh+MP/vMszS8ytJZ8JnNH+5yysz06TCRi6A1np?=
 =?us-ascii?q?hW6SONae5LtABFZ62J3/Vk815oDKy+OmMFcNOy0df9ORW/Y3LqmezCGnCMTi?=
 =?us-ascii?q?YgQRy7xYLvC61z97/H6FmAB47Rqt07tkYzys4Gzir0uLqZ3wgbbo/ahe5AaP?=
 =?us-ascii?q?fxJFrN/Eo7DFVzRbHqR/29f1paMHsofmq6MVBMJ8HzGw7Fu5gzaX95AzXqH2?=
 =?us-ascii?q?XD7o0TWepWAWElD1GI3Pq0nPhHOVQ3kH2xI9Sz6R8cDyjqHxuaaVxlYhbgz+?=
 =?us-ascii?q?r7xUpFKZ+9yuH1NLETcuSxFU9kucD2H1+JoDCWFeYbzRGd0ajYureo3DwN7u?=
 =?us-ascii?q?x4z+zDmHFmSVJrUaX4fP1e5HRMrsAL5herp3CH0OlYi1klf1g62tVmkez1DS?=
 =?us-ascii?q?mNA0OaHE7CzMp3oYeUMzEtLsywt3+Jc82UJbP1f8BZn46kk1qvbyrwl7jdUD?=
 =?us-ascii?q?VHBjqfCv5Q3OYOaXLoK38axVQr2stjHUmTfnqduuGRVbmgicCDutgv1xtgTJ?=
 =?us-ascii?q?YuEaK+9BZY6VNa0c4xfm4n0zHytUkuW/zeDAnW3xw6+xyYqynVDd3e4u1vR0?=
 =?us-ascii?q?YhwkKdy2l8iF3qGbMWyhyWVwR5UjYnaXnnX3A+UWU61KSyq2Lp4hSb/RAuKq?=
 =?us-ascii?q?BdjBJGYcIppe9y7c+q4qm0/sch1JT/EWwqg7L1y1fQWs3Zli4VYRjX6gKkYl?=
 =?us-ascii?q?ZeKPB4vdjfqB9OrUtYWwYEkJsYS36obJ5X6u4T/XT5uPE+V4OBOaPa6mRQDh?=
 =?us-ascii?q?e7SX+Q+KXEApbV20Rb1dwg5AcA07mtYDSiNMdG4ppDF3Jp7yPldXPwOBDBiO?=
 =?us-ascii?q?uFN+4fuxAl5GIiLvOtSt8aRU/Hy7E480zkirXg=3D?=
X-IronPort-AV: E=Sophos;i="5.93,294,1654574400"; 
   d="scan'208";a="79874608"
Date: Tue, 6 Sep 2022 17:38:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V5 5/6] libxl: Allocate MMIO params for I2c device and
 update DT
Message-ID: <Yxd3dbdS94jn79EK@perard.uk.xensource.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <7b871a16d981dcdc0046e6a69f77e2bcffe79065.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7b871a16d981dcdc0046e6a69f77e2bcffe79065.1661159474.git.viresh.kumar@linaro.org>

On Mon, Aug 22, 2022 at 02:45:17PM +0530, Viresh Kumar wrote:
> This also relocates the code responsible to call make_xen_iommu_node()
> towards the end of the routine, so we create the node only once.

Could you do this part in a separate patch? Then, I believe the rest of
the patch could be squashed into the patch that adds i2c support into
libxl.

Thanks,

-- 
Anthony PERARD

