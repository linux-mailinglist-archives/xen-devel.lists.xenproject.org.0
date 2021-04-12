Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08E35CA41
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109328.208708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVygY-00087F-CS; Mon, 12 Apr 2021 15:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109328.208708; Mon, 12 Apr 2021 15:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVygY-00086q-9O; Mon, 12 Apr 2021 15:41:10 +0000
Received: by outflank-mailman (input) for mailman id 109328;
 Mon, 12 Apr 2021 15:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7uB=JJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lVygW-00086l-9K
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:41:08 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0d499fe-ad17-426e-abbf-021bb1f16f7d;
 Mon, 12 Apr 2021 15:41:07 +0000 (UTC)
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
X-Inumbo-ID: c0d499fe-ad17-426e-abbf-021bb1f16f7d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618242067;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H80Y4Edr7Rrc7qCHhExSs6Vzni0yEDlV/lKokyrM7hU=;
  b=cEA+jCfRwpGMcKqRfzcNyhuzP1L9kbikz12uOrucarTIf8e0/rFQc7Qe
   Bo8BxLPuZ4K5MPSYSMIWQbNYF0NFXaH6n2r7VD3v3+M0oep2jwfWYS/lC
   xCBX11O5cLOxK8Cr9oa9Ffu1KLAmFuoppA8w0wSs8Hy8rTAN77tjm5FS7
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VVDngNiPeL2o+E1JoCbJ80D+M0d+uR8upa5BfOM9G/NlY6Jpo6lSgIK8/cM3//235VAJPjX7Ht
 P9knX0+HR9ylpk4nsRNOVOfhJBg0sM/tReKEluDazmoM17Z+NNDSZs1qBZgmPdwgLWUxiaqqCP
 HMxPsprvNx4FBFoFuGDKVI/mfJJjy6xD7ItH+WteBTogwiit8LEAvjYcy1ubNXRbv6JjbIRK03
 WY04eva+aKFVa7aps9aX5MjM3UpNb1LnzyRglzhl5njEhqfB2Q+H+TcYzu7FrHIAI0fkoQLyNE
 J/8=
X-SBRS: 5.1
X-MesageID: 41247005
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:peEVMKsfzbzO/716bT8S3Lr77skCEIcji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyAOzH888hPyO9661jenTpk0dNz1CQadm8gt/F0K/Gkp5WAFJCfMCZe
 ehz+BAoCetfmlSU9SjChA+LqX+jvDotLajWx4JABY79BKD5AnD1JfWGwWVty1uNQ9n7qwl9Q
 H+4m/Ez4Wl98q20xrNk1LUhq4m4+fJ7vtmKIiyhtMOKjPq4zzYKLhJf7GZpjg6rKWOxT8R4a
 DxiiwtNchy9H/dF1vdyXCBumnd+Q0j5HP4xViTjWGLm72AeBsBF8FDiYhFGyGpjnYIgdBm3K
 pHm0KfupZHZCmw+xjV2tnSWxlm0nezuHop+NRj60B3bI12Us4ykaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzoONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P44rRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko9VIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erGc
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104f2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6kiqX3T/kQXAQn+FQD26wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9qosfE
 V/J7vjmrihpXa/+HvJ62kBAGsfMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYgNkQ9jOCw
 5ZrVRv8aexJ5idrBpSTO6PAya/tT8+tXiKR5ATlum//s/jYIo/FYtjcrd2Dx/3Gxt8nhtKpG
 9PZBQffFLWEirjhMye/dopLdCaU+M5oQ+wZeZItHrUtCyn1L0Sb0peewTrbOm6rkIFQSFOil
 h47qkF6YDw5gqHGC8Ym+Q3MFpFdWKNJqlJZT71K7l8q/TTYwd3Qn6NhTuGzz8OWkeCzTRKuk
 XRaRSOf/fFG1xcvW0d9J3L3hdbSkWxFngAMkxSgMlFDmLBtW900eiXIpCr22/UUVcL2OcbWQ
 u1Owc6E0dW3Naw2weSmDGeUUon3Yk1etPQF64idba74AL3FKSBibwGE/hI/JxsKdDptasRXf
 iCfhKORQmIdd8BykiboG0oNzJzr2RhmfT02Af95Gz9x3InB+HOSW4WDI0zMpWZ72L+QeyP34
 g8hdUpvfGoOmGZUK/O9YjHKzpCIAjUu2i4UqUhro1Vp7s7sP92E4PAWTXFkHFB0xNWFra9qG
 oOBKB66qvGIIlhYogbfD9Y5EMgkJCXN1Qw2zaGdtMWbBUolTvWLtmJ673Hpf4mBVCAvhL5PR
 2a/zdG9/nIUiOf3dcheugNCHUTbFJ55GVp/euEeYGVEgmseu1Z9FexM3O2ctZmOd64MKRVqg
 w/78CDnueReSa9xRvZuiFjJLlSt2mgWsG/DWu3aJt12s3/PU7JhKSk4MS+1miqDTS6blkVno
 1DewgbaN9ZhjwrkY0w1WyzR8XM0zEYukob5SsikFjnnpWi6iPcG0pNNAXCmJVYXTVJKBGz/L
 P42Pnd0G64+SRP3JnICVxZcd5PEcUBV4SfFVYfFeEA+Lqzu7c1iitNYB0yH3cxhTD00eRhx6
 q40pzpKp/fIGatP0kA9z5DDpN1mSJuqXgoSbnO0a6A
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41247005"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIURgxl/BLBXP2FZSBcRnl436iwkYpDpVJT7jil3R26Ai5QjNipU7GBzNOKEEn2MpHSWUJVhEed17igsxY/Ya4AXhT8lrgTB0K3CJh3ruRyVEdLVLrdwoPDUoEi4h2IFioAbP288tsePRV++KprFAr45GdWuifkUaKYVVtqozgdo9uftQp28+mw1MmQ6rPNvYwAm0Qxq3CcOndP75jV1coYjWb973VwCfyjtDatkbAmkxNk5oicKTOxqUTwvCxSSdyWc9quImSSTwV/xZGdFWO+dQShMiyknAZvqVvLqWp6GDwUT2fuHeFYoSh2xW/PJsHnTurs0/slQ3cOjkWlMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjlsgBhoYdU8eRzneX+I5WwcgTL5MZ/MmZsV/C1k4UA=;
 b=aZ2CooS2vPInuxqHBkjJq/7otyRQ2qBgQKTKXZx8Wxl6m5h6cXxDcmmEh31LQPbZNYlE7RpycM1R1Mk/iXzkdIspNb63UgZFKtJlfr/1iZLr/VzSArsCI+aPpu4knF88EtnME4CgogL5qpmFFBxWD2BY6jL/YQIxVlLtgD420MttMUDXkFRwSg2wwjXdZaIgUHuktWWLH2JqMMp2KlGgUvUrib86tTbmrri5Xc+0kVJCGmI03auFQffHXR2RQDqnjmmmLF5hhKDLRGIPSSC27UBHAUsx9x/Lp/Ydh7f3Yn6JQEf22voy+jsg6SKS/pQxrtvYFPCYlFAli2i3jq4b4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjlsgBhoYdU8eRzneX+I5WwcgTL5MZ/MmZsV/C1k4UA=;
 b=D2i4647tUri08DtXqD0Bh6F38BhItI830e6yxMwwhS4vmJ5/JnUvFvAu5IEeEqGdANcA6C9JpEasoeyQ/ND5mSzUiXZPFLgknYXlowjRKbMTSFuBg3jmfsYrsCVTN3He/mt4lf/Ek6CTEB582WbwVniiNdpOiL5a4dcbOpLfkPg=
Date: Mon, 12 Apr 2021 17:40:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: correct is_pv_domain() when !CONFIG_PV
Message-ID: <YHRqCh3zjUh1l2Kt@Air-de-Roger>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
 <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
 <YHQUJw8H2tgNy5iY@Air-de-Roger>
 <169d6a5b-81ec-f347-8edc-60ba6ab0864f@suse.com>
 <YHReAkwZPnnh2itL@Air-de-Roger>
 <9571d2ac-e8ae-4105-5f92-0a81728f44d2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9571d2ac-e8ae-4105-5f92-0a81728f44d2@suse.com>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be99c3a6-322c-43b1-2190-08d8fdc96166
X-MS-TrafficTypeDiagnostic: DM6PR03MB4604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4604347B5CFD13478D4A1D5F8F709@DM6PR03MB4604.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asj49Ay9Ct+RrtwmVOaqK4VsobZ/PMS+UnQ6j3CtDItMjMWcKiuDJq2saAIl92Nhc+JpZMwHsLYxatghYB6b1jrGywm9MswfDc89uSWRd4yySGLmsacC6rq6zEMqoUQprK8KZGJL/Pnc7R95J5+JTUahZpz++VMNojGfDAh0c10TLZQ1SXKKTNrLJZ2KoghmgKL0EgU8v2ygWa4WK1OVzsn+YPMTWyRzhnz5V+xPyipTyXQPOdhknw/Y0R8dp9L0mG6qglgYHH/WlzLFkpezKunNdHHYIzSz2T+SIIBdN40ybF1W6CsKbxWjIRzk2e54w8ia01ptPB2GGpl0Sw6OvE3owQFvWaY0SDBXU0XZ7Np9zj2azauz2I5iP0zcB+hWL84xt43SQbZlA6egj9pjKG10U6+ckSSZVpR4tgHwcvpPNQFVbp9kDpiDFxCU41kiuQVqgnvPzMqD3HbVsuOG/TeiHSj17JyKzBwlmblvjZ5z1qj71FOoKPImVUO7HIN4VDkN3kzvl+Y3LhYXX899Lneosf3YLsd4mO/0FT2qUtylzXy3o4k7Y/gd9NKUphM4fuyJVKPjM4qrt3CwUD8ASrkkRDDNF60NmoErMG8IywE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(396003)(376002)(366004)(136003)(16526019)(6666004)(26005)(2906002)(316002)(54906003)(86362001)(186003)(9686003)(6916009)(6486002)(4326008)(33716001)(5660300002)(478600001)(53546011)(6496006)(8936002)(956004)(38100700002)(85182001)(66476007)(66946007)(66556008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUVwY05XM3RNVzVSTFlraUVYY1dVSS9WWjRxQnhPQ1Z3RVQ1SlhXdlpQUUNW?=
 =?utf-8?B?WmJPRTRBVWNUR1hLK1VNVDl0a0ZEUm5oSVV3U2dJeE43VFV6b1Mza0hMZmxU?=
 =?utf-8?B?UVlqOGhUcm1GcWw2T0xWZ3gzUjJ5K3hKeWI2eURsZUozUjREWFZTOE5wbmRF?=
 =?utf-8?B?Yi9wUnBZd2ZWWXViNmV4bGc3Yit3WkR2WWtWT0N1OWQrM3FxSWJUdWI1cmJn?=
 =?utf-8?B?V0FQMWNrRTZraU00L3F6WjhiakVoeGZuMm5pZzZCemswS0UvbzBHRDRTZml4?=
 =?utf-8?B?VWhUYUpIRjVqQndxenZWbzFXWUlHaHBVWHVGRWNOTnEwY0tlQlBXeU5nemN6?=
 =?utf-8?B?VEJTbFJvcGlET1JnV2RpWEJJREdVVnhacnlJc0l4R3lBVlVYWTB5c3dIREln?=
 =?utf-8?B?clpCY2s2TkJIUmxXVEN4V0REVmNCWjNXemswVkdHa2RlQ1prSm85SlpRMjhj?=
 =?utf-8?B?b3NyWFYxYjRXbG02Rmh6Qkc0aXgzZDlCUTFLOHU3Z05pU1NDQURjbmlsaW92?=
 =?utf-8?B?eE1yWFMvZDdKQnJCWmpOVDcxMWpxWWZaWU5DVDF1bmgvVGVSWWlINjdBTHQw?=
 =?utf-8?B?aDRSN3laa2M1aTNLWUZ3ZHFlaHZqY2hoWjRyNE51bkt3Y3hmUnBQd2QzbWxz?=
 =?utf-8?B?cUZlVWpWYmhpdzh2TjJodVBkQmFPVlliSlF5ekYwYmdUYUIzY0hTRkdXS01i?=
 =?utf-8?B?bDdtY0xwd0JIdmk1Vm9YT09rOU5pV1RYRUZTakRQZm9xMFJCcmtKQXpHYUdP?=
 =?utf-8?B?WSs3cjhJWTkydUpGSXU2dlkvcDE3amdEU0xxejFhVFpOUStEdHdSM2huakI3?=
 =?utf-8?B?bURrQXNzK0xXcTBKSUJIZy84S0FBTndOWXRlVTZheWI1MVpPdENlekVwL25V?=
 =?utf-8?B?aVJOVFNodHBrb2VwbnlXdHFFTHZ3NjM4a0NUbVFRT3QzSVdjUEhuNnRxRVdX?=
 =?utf-8?B?ajJiK2hxcWNjUVdwbXlCSzUzTEdzTnFHTTF3b3hZRkZ0ZmNGdFgzcjIzaWl3?=
 =?utf-8?B?UFM4eHRzYVdqZzRLUmlrSUtLM2I2U2dDMHhScTFzMkJRVkZISFdyNlpGenB1?=
 =?utf-8?B?RnJtcUVoWi8wT1ltYlg5TVEvNmh1anNudlc0RHJIcDVnZEIxcVlsbWx4M0pL?=
 =?utf-8?B?Y0VDS25mcm9pWDFPQmlJWm1NbjlvTjhyOVRITWFrOUJZS2FiVFBTbmxUdjdP?=
 =?utf-8?B?OFFkby82cHNHMmswa0F1Z1JTN3BMd2EvOFhpYUxLRGxXNmtGODB5MEVVeFYr?=
 =?utf-8?B?dHdrbXlKZURjUElacHRVUm5OcmlrTnV3VWVBTWZpTUhGWkY3aXM0anl4OVRs?=
 =?utf-8?B?MERnanB5Y01pWUs2clVpay82Ui9TdXV0RndKaW5YNVFHTnlsd0RvWFlvN2li?=
 =?utf-8?B?cXk5NjVhREdpSmZNUWE1S1VjY2VXSTliSUVEMUNMVjd4TGUwU1N3Ym90NmVx?=
 =?utf-8?B?UmsxN2NNYUF4bVBxTGJ5WGtaWGhIdjl4K1ozSCtHdnltL3JZQzh2ajQ1emVC?=
 =?utf-8?B?YWxPWVNkb3hWN3AvNU02THArRTNiTWIwTzZjNFYrQVp1REt3WWFQYXN0SVJk?=
 =?utf-8?B?TExOeHRodno3M2NtUE0xMGliS3ptVXJ0UVZ0MGtiS2RsZWU4L0Z2MzFmRDU2?=
 =?utf-8?B?Y1RYQ0ZVclNRb0p4MXQvN3pCMmtmNHBWTXMzS3pBbEZ3MTl4NXVLVjRYVmRx?=
 =?utf-8?B?bisvMmlUNXhqTUxqOCtmQXdYSDA5TnFBV25VTTkxTmhPVDVXNVlBRkxXdENN?=
 =?utf-8?Q?gf5lJPyeGiNj9vAeHB0HSg5H01iaN7VDtZo2jgU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be99c3a6-322c-43b1-2190-08d8fdc96166
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 15:41:03.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTBJyazyjaS5G5xIjjuysmGNbP+31ejUFWS6vg5/g14kgwhCO4Jc9ZGy/+k/dGur5zpfg7DB5VdN590p5upYvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4604
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 05:24:41PM +0200, Jan Beulich wrote:
> On 12.04.2021 16:49, Roger Pau Monné wrote:
> > On Mon, Apr 12, 2021 at 12:07:12PM +0200, Jan Beulich wrote:
> >> On 12.04.2021 11:34, Roger Pau Monné wrote:
> >>> On Fri, Nov 27, 2020 at 05:54:57PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/include/xen/sched.h
> >>>> +++ b/xen/include/xen/sched.h
> >>>> @@ -985,7 +985,7 @@ static always_inline bool is_control_dom
> >>>>  
> >>>>  static always_inline bool is_pv_domain(const struct domain *d)
> >>>>  {
> >>>> -    return IS_ENABLED(CONFIG_PV) &&
> >>>> +    return IS_ENABLED(CONFIG_X86) &&
> >>>>          evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
> >>>>  }
> >>>>  
> >>>> @@ -1011,7 +1011,7 @@ static always_inline bool is_pv_32bit_vc
> >>>>  
> >>>>  static always_inline bool is_pv_64bit_domain(const struct domain *d)
> >>>>  {
> >>>> -    if ( !is_pv_domain(d) )
> >>>> +    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
> >>>>          return false;
> >>>
> >>> I think overall is confusing to have a domain that returns true for
> >>> is_pv_domain but false for both is_pv_{64,32}bit_domain checks.
> >>>
> >>> I know those are only the system domains, but it feels confusing and
> >>> could cause mistakes in the future IMO, as then we would have to
> >>> carefully think where to use ( is_pv_64bit_domain(d)
> >>> || is_pv_32bit_domain(d) ) vs just using is_pv_domain(d), or
> >>> IS_ENABLED(CONFIG_PV) && is_pv_domain(d)
> >>
> >> Imo it's not "then we would have to carefully think where to use ..."
> >> but instead this patch is an indication that we should have been for
> >> quite some time. For this reason (coming back to your first comment
> >> at the top) I'm not sure adding a comment _there_ is actually useful.
> >> Every use of is_pv_*() needs carefully considering which domains are
> >> really meant.
> > 
> > Maybe we shouldn't have used is_pv_domain as a way to hide code from
> > the compiler and instead always provide dummy functions, as even with
> > PV support compiled out we still need some of it for system domains.
> > 
> > I'm not sure I have a good proposal to make, but it seems wrong to me
> > that is_pv_domain(d) could be different than is_pv_64bit_domain(d) ||
> > is_pv_32bit_domain(d).
> 
> Hmm, so we're of opposite opinions - not sure what to do. Short of
> having / introducing is_system_domain() or some such (with all the
> needed auditing) I can't see how assuming the two would mean the
> same could ever have been true. With what we have is_pv_domain() is
> legitimately true for them, and both is_pv_{32,64}bit_domain() ought
> to be false (as there's no specific bitness associated with them)
> imo _at least_ when !PV.

It's all quite ugly, but I wasn't really getting your reasoning that
system domains can be considered PV domains without a bitness.

I think we both agree that long term having is_system_domain would be
the cleanest solution, but it needs a lot of auditing. I think I would
be fine if you could add a comment somewhere noting that system
domains can be identified as PV domains without a bitness, so that
it's likely less confusing in the future.

Thanks, Roger.

