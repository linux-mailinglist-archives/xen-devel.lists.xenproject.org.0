Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3DD4AC11D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267019.460717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4zQ-0003KW-ND; Mon, 07 Feb 2022 14:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267019.460717; Mon, 07 Feb 2022 14:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4zQ-0003Hu-Jw; Mon, 07 Feb 2022 14:27:36 +0000
Received: by outflank-mailman (input) for mailman id 267019;
 Mon, 07 Feb 2022 14:27:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH4zP-0003Hi-NF
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:27:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1648ad83-8822-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 15:27:34 +0100 (CET)
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
X-Inumbo-ID: 1648ad83-8822-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644244053;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=akr8GOJt3oaCQlB2tmmbBBfx/DbP0CRzK2wTmN7HiVo=;
  b=RD5I6lFYOVZTx3u/ddA1ZV6EYoPN3jl2G1LdZWb3ViSqHkAaHPzWIyrh
   +mB89QQztIQJmIPgknOGcpwmlKtOCOhpGZ/jrS/AaxkxE7ecJI4jBLVSW
   YK50w57uJktF0or33e/3XWHH963oyP57YIJ1XHkWvrPnx7y6a/65ogTUu
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fnEeB445qKt3BUhMj0eHj9yx63XTNsjF0dTqE3Rs2qgMOv0CZBak6WUIqzF/7QWHFeb9vGjW3B
 uGL/UQyb0LQdoL7vccENpSrldwXMkYuZAD0rB2Q5pZfUzcNwOuBKWBJM/sup3h5LwYpiSAVtrs
 e/TK5DKEmEhoIGQN+VPba2uJFv2AODXfgagTqYXpqg+fWUN7gZhCrMYx+fendzVovRWXTRvCBq
 mhW9a3cgQB6ee3Ll/HwXwu6i1RAJf2iSO/NcDfVFG1nFcGbDMIXHHAc3GfVnNFSYHPQ3iGD6Kn
 UrxlN4H6HqikliRIIbpKWfDg
X-SBRS: 5.1
X-MesageID: 63559250
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MWvY2qt1NkAD04akEkyZZavbLufnVHVYMUV32f8akzHdYApBsoF/q
 tZmKT3SOPqLajT8f9lzbYm3oUsCvsfcm9JnHgdq+y4wESoW+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplubztVkA3YfL3lroiTUdiFyJYYYpC5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsTQKeEO
 pJxhTxHK1ecQBdPAF4sC49ikuOjq1DwfDZjkQfAzUYwyzeKl1EguFT3C/LNc8GObdVYmACfv
 G2u103jHhwfA/mOxjOE/2yEi/fGmGXwX4d6PLe17OJwiVufgGkaEgQLVECTqOO8zEW5Xrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmXw6rJ50CCB24LThZIctlgv8gzLRQU0
 VuOk8LsFCZYmrSfQnKA9Z+ZtTq3fyMSKAcqQisJThAM5dX5l6g1ggjSVdZoEKOzjdrdFCn5x
 naBqy1Wr7cZgNMP1q671UvamD/qrZ/MJiY3+wHWU2SN/g5/Iom/aOSAzlzW7u1JKoqDeWWQp
 3gPm8WY7+cmAImEkWqGR+BlNKqy+/+PPTnYgFhuN5os7TKg/zikZ4843d1lDB43aIBeI2avO
 RKN/1MKjHNOAJe0RaNXPp32FZt19qa+Ksq7bPTXSIZpZockIWdr4xpSTUKX2mnslm0lnqc+J
 YqXfK6QMJoKNUh05GHoHrlAiNfH0gh7nDqOHs6jk3xLxJLDPCb9dFsTDLeZggnVBougqR6dz
 dtQPtDiJ/53ALynOXm/HWL+wDk3wZkH6XLe9pY/mg2reFMO9IQd5xj5m+JJRmCdt/4J/tokB
 1nkMqOi9HLxhGfcNSKBYW15ZbXkUP5X9CxnYXV9ZA/2iiJ6Ou5DCZvzkLNtLNEaGBFLl6YoH
 5Hphe3cahiwdtg302tENsSsxGCTXB+qmRiPL0KYjMsXJPZdq/jy0oa8JGPHrXBWZgLu7JdWi
 +Dwh2vzHMtYLyw/XZm+QKz0lTuZ4yNC8N+eqmOVe7G/jm23q9M0Q8Ew59dqS/wxxeLrnGfDh
 13IUEtH+YEgYeYdqbH0uExNlK/we8NWFUtGBWjLq7GwMCjR5G24xoFcFu2PeFjguKncov/Ki
 Tx9w66uPfsZskxNtoYgQb9nwbhnv4nkpqNAzxQiF3LONgz5BrRlK3iA/M9OqqwSmeMJ5VroA
 hqCqotAJLGEGML5C1pNdgArWfuOiKMPkT7I4PVrfEijvH1r/KCKWFl5NgWXjHAPN6N8NY4om
 L9zuMMf5wGlpAAtN9KK0nJd+2iWdyRSWKQ7rJAKRoTsj1NzmF1FZJXdDA7w4Y2ONIoQYhV7f
 GfMifOb1bpGx0fEf34iLlT33LJQ1cYUpRRH7F4ePFDVyNDLseA6gU9K+jMtQwULkhgei7BvO
 nJmPlFeLLmV+2s6n9BKWm2hFl0TBBCd/UCtmVIFmHeAEhutX23JamY8JfyM7AYS9GcFJmpX+
 7SRyWDEVzf2fZ6ugntuCBA98/GzH8Zs8gDimdy8G5XXFpY3VjPpn6uyaDdasBDgG84w2BXKq
 OQCEDycskEn2fr8e5EGNrQ=
IronPort-HdrOrdr: A9a23:UgWe8KGYPG/gbqJBpLqFQJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLN+AV7MZniAhILFFuBfBM7ZskXd8k7Fh6JgPM
 VbAs5D4bTLZDAX4voSojPIaurIq+P3kpxA8N2uq0uFOjsaDp2IgT0YNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5dzbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu17hPi7ontRrcenau5l+7f+3+40ow/LX+0KVjbFaKv6/VfYO0aaSARgR4Z
 /xSlwbTrlOAjvqDx2ISF3WqkbdOX8VmgDf4E7djn35rcPjQjUmT8JHmIJCaxPcr1Etpddmzc
 twrimkXjVsfGD9dQnGlpH1vitR5wKJSLsZ4Jwupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyRS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOhALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDdRHXJ9upEpH
 3saiIoiYcCQTObNSTV5uw0zvnkehTMYR39jtpZ+4V0/qbhQbaDC1z3dGwT
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63559250"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqW7AYAaymZiOJ14cMn5u4e7PRmvmWLMoWc3Go5tqOQ+mTCVkz7hxBpspC3BXKuu/edfdaxzytlsnmqNqu92qRK3Rx5T9SYJlvqsPYzSCcAOqKB7wKeqm0KSfuo6pGsuoEJWsBVQUyY0wXTvKuXP87A0OWrSOJm+I+lB+aOoDoUgcC8J6NXXXPerMi8ALpiSQTq+QL3USD6NTrtd03jMlLPhmdko29WK0lxfL67qzc6MyKNUcGP9JZDY1Eww07OflzMQRYfY3Fy7mi90UMfoFEt9qaL0c69yHX2Fg9ktM7YqtKeWkgYLGNwKvXrXdi6p+WHqen7/W63tAV7UPGXR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujlmL1pGk3S5HXxSrKv59ZMnBRiLBJ2kraMVbrRGEXQ=;
 b=QXoJuuKhIlSPrzle6KJWmsDYq8zbbqmnpQ1UIcxNsdMFIc0y5yRFvfQCp8lf5YNr5QygS1NUTkYiBkjPNMmMMa7v6o7RrFG81TuRd/THGYEyQPrNznvZZO23oztaQgSy1Vy+5OabLr7/1Ha4D33ctJwJL1DOuh58SBTXlaihFWPYH+FurzM9kCMSzZ00K7d9VXRDBkd+yWbd+4xdyPn7ixH6/2EH0jHmgA3opCe5krU1Vx6HoyvfVoRC7usc/xRZ8Mi76AysBNX06YkcVsH2r7554M6QPRB6h+frW+09XQgSAza53IFQy4bWeb0R88J0Zz9NLujwzZfqzA2DIiUJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujlmL1pGk3S5HXxSrKv59ZMnBRiLBJ2kraMVbrRGEXQ=;
 b=CHVFpJLpPlEDxv23UrIpd6l5TF/Jrm57IKoWoBC+P5pQ6s6PRJFbAvxk2zBTyjcRO5UtkCqNSJSxcuIRMkzOeJmPFCw/F/zJ/lCi/vBFYUbSxGHLtwZ9+GjSKKFRoYmwdXSWGB/Wy/NCBbjhV3Uhe5DlzMEVryI8Lwn4QkycAgI=
Date: Mon, 7 Feb 2022 15:27:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <YgEsRuckQJIQlkzf@Air-de-Roger>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d121a1dc-1ddd-454a-113f-08d9ea45f484
X-MS-TrafficTypeDiagnostic: BYAPR03MB4184:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4184D031E66063C00E6999BA8F2C9@BYAPR03MB4184.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QenGAvZ0J2lPw84rrX8Me4LGsRau4sEq/fDo8VaL4cvy9qNWFgBhI0KwuTSkiqlh8fiVkuB0KhvtSdhZ6/zi1Hllh1MfacB6vDvJ4VbeWUx+8eo03z8UTpVbkzYiEPSKfouiPRDk6ezRb5jgKbvJ8eEj02CUETZsvM2C8W2xdWOpmUibdw1PPeBetyis8k7NGAyS8QiUwbrVz5rHEoVylStQc6upskIEq+z5iWmWq/Q20tZoZMnZP3Mzyi+o/sulOptbtzPiGDt3hltaGe3D9JJefFSChht8+B1+5AJSNvDL0aB7hASI1dNcfU1xI/KEQbjBBgqJY8vwulEvB3I4+AF8G/1jZMCFNS955RQyyAaRVpw4p0W15VGHo/vlKoV2KK2SYodDO4vKmuxh2hlJ96vlcjN245+gpnvqp3GHEx8YGSdifv6B2Okk7GFWkKuPyqGOnLGcaGsEk4VztJKog7zGz1dhv5tIFB/N8HcmMy2lC1jF0+Hiecn4k0pjCK+wLuD+SkY7IIaIjym/abFPoIBBxrEPQ+dFbLWe1e2CqritL10BZWf6pc2QPimlwzpAZfthMeQ8xDSzfK2Ihexq1CXEsnZhKETffGJOFc0d+a2am3P82ixdxPV+XXNuVDz20zQnIibLJMyid65Gtz+ctA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(6486002)(8936002)(6916009)(508600001)(85182001)(33716001)(9686003)(6512007)(54906003)(82960400001)(66556008)(86362001)(8676002)(5660300002)(6506007)(66946007)(4326008)(66476007)(83380400001)(7416002)(53546011)(2906002)(26005)(38100700002)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1tTnhoMDlKK3Q3SFBMc3o1Tm1UQjVXNjVEL08reDI3ekZwTG1uZmdwVkt6?=
 =?utf-8?B?Y2c0MmVSN2lhendDeUt0NkFDRDRHVklsSXlDbXR3ZnREZjY4cXRVQUd3cTlO?=
 =?utf-8?B?SFVZVzE4dnNZN21EYXVhR0NyWHpFT1JPci9ld25YZlpYTGFVUnFpaXR5Tnlv?=
 =?utf-8?B?c2c3Nkg2RTI4NExHRE1IWUFhdUdaSjFNN2syOTBhajN0eGFLV0dVVUZpc3Qx?=
 =?utf-8?B?SjFBbVBUT29xeWZNZEg2cFdxbmdjWWtYT2tvTno0Ui9aUGJzalg4cHFOTHJH?=
 =?utf-8?B?NkxVNlFCZk1xVERLRmNMM1hsNDdrT2wyVGhhQ2J2bG5jR2RqTTNoaE03Q3d1?=
 =?utf-8?B?WGpLZW1UdUliTTByWHlGa2w0YW84NEVMTXlaOHgrVDZQWStJYld6UGZ4M1F2?=
 =?utf-8?B?R1Jxd1FOWUE2cHFpNE5RSmZvNHhIc1ZSMzRUL05iRVpZS0swamVxK2tNcGIx?=
 =?utf-8?B?dHd4algyK1ZucTRWUHlycGF4RDRxbVVqc1JZUWpWT2xHN0dMRnB3U2MrT3lu?=
 =?utf-8?B?RmRXeU5HL2I4ZTRRdk9rT29mR09zVHlIbHcxYXU4bndaMkp1Rm1KZTNRU3pv?=
 =?utf-8?B?dHRBUDVyTFhXYXVqVVBHYkhmcmVMVCtwdnE1aWVFc1dpZlkzK2E1dE1Ka0hw?=
 =?utf-8?B?YU9MV3drTXFoTFVuQzhrMWtlZ3ZFQW4rV2UyRm1LZkFBOHBldVNZVFNlTjY3?=
 =?utf-8?B?WTZ0SmZaamc5b3FTdHpiVHRWbG02ZE52UndXWEc5SytpVVMzenNXTC9IVnhO?=
 =?utf-8?B?SFU4NG9saVVkVG9mTnZZVmk2NmhUQ3cwZysxMzByb1JWVms0KzJLcmI2Tlp4?=
 =?utf-8?B?ZVAxRDZkaEZCSkJxMEI0OUJSNEJaQWN6d3IrYzIzeEg3VGJ1REo1aWtFcUFq?=
 =?utf-8?B?R0pZNDhLZ1M2RXJ6ZmFEZ09ldks3R0lQT3ZsZmx5ZjR0T3VXZDZwbFdHQW1H?=
 =?utf-8?B?Z21abkZjTnpvQmhpa2dUcHRDTm5FVjAvTjFsak5UQnZZR2F1bGZXTVd4Z0hh?=
 =?utf-8?B?SktKTjVKWlBZdWs0VmR4bE5DU1ozaGNhNEVNWjh4amkxTkJIYnRrS29tMXkx?=
 =?utf-8?B?cjJqcEppVmhodVZVQzBOQjZHRG9wKzNIUTBES0pUSGd2M0tpeGhvbW9sM2ln?=
 =?utf-8?B?b2tGTUVybUtTQUpoMFZySnEyUzkvSXhWUHR6TDNaTkVmYzFPWFBINTBJUTBl?=
 =?utf-8?B?TzR2MWtsa3pmZWhRa0h0REJkQ3E1dlBjbGtHbXdIN2UvdE1SVWxpTC9NTXdi?=
 =?utf-8?B?ZEUvbklETVpEcWxFYkRnTnlBYnZqVURYamw5VlJSWEJsWDArMEluckdWcURB?=
 =?utf-8?B?YTh0cGxKVkxPdUMvT3Z2RENQV3ZpNm5aV2J6dkI0N090RHRKMXNIc2NxbC8r?=
 =?utf-8?B?bnYrRGoyOWxFRmVKTlUrbVpkV1djNGxjSTVqMGl3d1lHRXVrdFo5dVM4WjFw?=
 =?utf-8?B?QXZFR1hwSFYrSm1zazFTRWNCS2djMjJHUWlGU2JVUGFBVmloRGZWUCtMUGpD?=
 =?utf-8?B?eXQxenhTRFpSSG1yMGc4V2ZZeDRzWTViaWJ6bTZqYS9hNXZkVTV6NVJwaUZ2?=
 =?utf-8?B?clNDU2FuZ29QMjNLMlc5a3cxNkFndi92S2tvVjJ5RjNqUFJ3cUFTNW1TeFc5?=
 =?utf-8?B?YmVGaE9LcW01ajlQOU1pck1aMVdyam55ZTBEdkRjWGlUTzhQSmUrMGw2MFBr?=
 =?utf-8?B?TU5jVHFESkpSeURXNlVBV3RjdHFtek1KcVhERTBHbGg4TUNBS3A3VTBWc3Fz?=
 =?utf-8?B?Q1N6ZklWUmRlTFBZNmdyU0ozdUdTOEUvL1RhbEU5aVovNHNhRTFxYlhaVkE4?=
 =?utf-8?B?YTJqME1MaS9GSnJBME0yT1lBWG50VzNCU0ZkbmhXVkRQRFhsbHQ4SXdjK1Jw?=
 =?utf-8?B?TG9KVTJ0dWUvMWJLcVBhcWdhUS9vU3NJK29ndEtmcEhScC9iUlpCb09iNG9h?=
 =?utf-8?B?Y2UvRkU2OElpbTJaMU9lT2hEVnBzdzlNYXc4MFIydWtOTGlsekhZa2xGeFdV?=
 =?utf-8?B?MGVZOTFnTTd3SGNSbDV6MnpCdDR0aWcvc0pxSzlvM0RHaGpWUk9DNFFZYzRU?=
 =?utf-8?B?ellHV0pxOWUyTkk1UkpkN1ZFaHZzemg4K2w5ZW05Z2lmTlk4SmJRVElVeUVq?=
 =?utf-8?B?YmxwSUJ1Q0Yzb0xQK3ZIaTRKQm9iUnBxNlZzVlVmdUc4aFZ5bTVEdzU4ZTFr?=
 =?utf-8?Q?GhfUDC21JMzmWZZck+nqTtU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d121a1dc-1ddd-454a-113f-08d9ea45f484
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 14:27:22.7605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LW5OmlIIW452YjdUREvOSK+AwkY4DKktlnc9TSxUfVwZlv4qfMd/tfYS/Lnzp7/jFOq4z9Z/ECqNg7gvsywkHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4184
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 03:11:03PM +0100, Jan Beulich wrote:
> On 07.02.2022 14:53, Oleksandr Andrushchenko wrote:
> > On 07.02.22 14:46, Roger Pau Monné wrote:
> >> I think the per-domain rwlock seems like a good option. I would do
> >> that as a pre-patch.
> > It is. But it seems it won't solve the thing we started this adventure for:
> > 
> > With per-domain read lock and still ABBA in modify_bars (hope the below
> > is correctly seen with a monospace font):
> > 
> > cpu0: vpci_write-> d->RLock -> pdev1->lock ->                                                  rom_write -> modify_bars: tmp (pdev2) ->lock
> > cpu1:        vpci_write-> d->RLock pdev2->lock -> cmd_write -> modify_bars: tmp (pdev1) ->lock
> > 
> > There is no API to upgrade read lock to write lock in modify_bars which could help,
> > so in both cases vpci_write should take write lock.
> 
> Hmm, yes, I think you're right: It's not modify_bars() itself which needs
> to acquire the write lock, but its (perhaps indirect) caller. Effectively
> vpci_write() would need to take the write lock if the range written
> overlaps the BARs or the command register.

I'm confused. If we use a per-domain rwlock approach there would be no
need to lock tmp again in modify_bars, because we should hold the
rwlock in write mode, so there's no ABBA?

We will have however to drop the per domain read and vpci locks and
pick the per-domain lock in write mode.

Thanks, Roger.

