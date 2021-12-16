Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36086476F89
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247872.427464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxodl-0004V4-0b; Thu, 16 Dec 2021 11:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247872.427464; Thu, 16 Dec 2021 11:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxodk-0004TH-Sh; Thu, 16 Dec 2021 11:09:36 +0000
Received: by outflank-mailman (input) for mailman id 247872;
 Thu, 16 Dec 2021 11:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0Qa=RB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxodj-0003kR-FB
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:09:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5211ec3-5e60-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:09:34 +0100 (CET)
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
X-Inumbo-ID: a5211ec3-5e60-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639652974;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=38YnxexaKSLiwNmcvIkCImRQ28BYCqUx8n0/pWWTWx4=;
  b=iMywv3y+7AbPKmiECRn+44B6k3fcQ5yL/sYOSFhX5QsFubsUbI4H7D6r
   Ep5eXDptSIE0v1AxOBgpaPs+0WzkgckbLlaozn8mvrrXlomMrOdY5F969
   gkL3+JtplLYxScrYX+PRzEj075CYcvVN5yuFnciMwIqgfZXH3plQs8NRV
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ln9HIEBabr0E0ZSky9HoJW/u+CqLCGGcG4OsvMtWj5uo51dfqWaWOmGrHB0i/3hiQ/lPMUfr9P
 lMkNCJLUeRUdznIerK1i0xJ82HFNMyQjpC7y5dBD+UN6PKliVVM1XW/HkcHJMETF+pnL3BZBue
 E7wPJWqifj/Er09ehnHQa+obsAYS85GdwWBm3h3bG/YYwWSk5nK9rOuUDq2QyBVGdWTfMN/4Ln
 pamlkHUW0X0+satxafCBfgr0/cIm25M8dirrbPXCMKXlkzscHmqdDWu8/8X4LdZQZPuzLa7qVM
 fT8KWpQ+GyIaiUrOdTTD2Efh
X-SBRS: 5.1
X-MesageID: 60164149
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TAT09anxaX6RznRnHXxZCUjo5gxuIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZWz3UPqyOZmD3Kop+aNmwoE9VvMfTxoIyGVQ5qX8xEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2Nc22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PpQiMa7TQwbBa73tu8WEBdBGTElBrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glo354SRKqPD
 yYfQTZuNw/lTwVUAFlUAao+oumX22v9fQQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfQmQvrVYRUE6e3ntZjhVbCmEQIEhYYE122vZGRiESzRtZeI
 Ew84Tc1oO4580nDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyymEOzIPSjVzU98dmsQ9BjIz3
 E/SpMy8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBn3+1L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgXR1
 JTns5LHhAzrMX1rvHbXKAnqNOv2j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN4lIMtcQMbCbwNfQfj2eN5yICl/KI+TPNDK+8UzazSsIpKF/vEN9GOyZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TWcqr9pcJL7HbeWKL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX9hrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:WujjvarQ8l1FiOmi3NVauiYaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60164149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItFlQyXQO1Hwh9NlVh2Rat+nTCEDoQPEyQk1aix/Ah82NfT+1694xtHkk39t2/9flp3kQODdGomqfJiCGiAQQ2afNL/wACzsjubmxKLx6OCOixGh2+8OXvpLkEzozmwXzn4bIfviM8Iq34kyUIM2YEZV3679p0QcCJi8rME9GRDsOlK2v/oV4Ud2B+n4UyHmqxLFfUHgqiEdcifwgs/ZVqseneUGsGp6Py+HQg4AC7K3Jw6Ymgd8NA0/ZHFM4qky/2guYRvCdLfL4TqFmzDefEZp6dz2OjZ3CT5YkMDk3rr1dnXdY0c1kO+Vw/ZXS0PoQrbbeC9WUT66n1enwsKpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hji2z3QqydBhhpIzlLRwVcOrjCHh9Pg5U8XVhBYmkmE=;
 b=oN2ZjhZ1lUmscfPw6tj3mr3T/JszyJz9WK1R7MPX1mLh6p9UY49NmCc2ab6viZ3a0uqbK0YSnBbdL+pHiYhV3N4m/UTxu/InD3TBAhkDS5soJZ8zeaAq9crBeAzU5lxua1ChFSRoCLqjgkO50CHvSydv6deC3BBvVFFG35mPNjKSkxrczca9ywxYk62nBeDpfoZxnPJPKIQTCh4Rm/KFerSB7Gw2aFYtAX3YXb5fj0C7setvQEcnQRySa9EjQBecy/BgXzSF1rJYhlZQKqc/M4w7qGPRo4n3rKmHxJ1DYQ68gjJt2XpR03e9LsHP3aa6W0M8GfkWqbug4DWxFyWKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hji2z3QqydBhhpIzlLRwVcOrjCHh9Pg5U8XVhBYmkmE=;
 b=LEUz/uTEhqxCKIvL7jFewUuiw8JemRngVFl4cH3Kf9SleMMNYHM/pmDj3pqyhG0pep+inkXEE4c50BBHUwJWYSdYuNqhL2OL050BLDBRH4BjVv3tw20GB08c4Kg4b2IBrifnJh9ChN9JboB8etaqpHNpaTJURL0rrVY7acftm4E=
Date: Thu, 16 Dec 2021 12:09:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] revert "hvmloader: PA range 0xfc000000-0xffffffff should
 be UC"
Message-ID: <YbseXUE0byGJCzsy@Air-de-Roger>
References: <036c6899-dbfe-eca8-7974-5a13d20455a7@suse.com>
 <YbsMwIYFULP5sXQP@Air-de-Roger>
 <cb9bea36-9feb-dbc7-ce36-38fd42792f11@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb9bea36-9feb-dbc7-ce36-38fd42792f11@srcf.net>
X-ClientProxiedBy: MRXP264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82912828-3476-47a0-b922-08d9c0848454
X-MS-TrafficTypeDiagnostic: DM6PR03MB3737:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB37379A1AE9DBF1CAF829519F8F779@DM6PR03MB3737.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3NRh7ek5jRzE4R4zYfZVIqUvI2VAwer82W/wYiNTJy92ldtnnrszSsMyhWqpKd43Xg2S2dqbu+8mSKsuHLlEVfopGw8pmU0atyG3cIP22ESxRCULDQGsZcnWd8vapN56G2H0MktbrwTUuWWrhwl7a+Zi2927VFOrA//sbfMl5/TW7TC/CmyMJY9SzrYoGtPu1PCIVD6JqwVVW+Kv1UZTe9ON2ft+whEAXDxmvjFup4OiDIt0Rxjjfi3rzGqwAJBzkqO/e5fX4x1TsvFfR9sDoN7R11OKlEEMobkMJ8TRqOBx2tzgk2z3hkx26hjFx9kxJfoNr7XY+K0X+kh3qtoC35MT1T6iZrm5XZczdHwc3/gUyAoQ7OcrlLDlVf0tshCI0tCUq0s8tfUgSHy7Z0f6hdlboYfBtiX/6q1rcDqfPmmiVZXctkLjCHbmVJJVnPBC7IACp6Wv7egUNSy0DvN49FSgzdJukm0W1eOWyEe2/HzvFy+/gWxWyf9vyac1GMoTzHbUPYj0DY99Akhsju8VPyEXBWTUQc8r1LRDtcoh49uqgFaw4D6NdwNLet3HGUMWcNV3a8X4oJmBLjdYR00QBmi0GH3jBhMmd2Ftn9LFinQG3DTqfMX09JjTzp5QjIRuPWG50MPOQRpLmY6WlqEmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38100700002)(26005)(8676002)(86362001)(5660300002)(6486002)(186003)(66476007)(6916009)(66556008)(8936002)(33716001)(9686003)(6512007)(6666004)(53546011)(6506007)(83380400001)(85182001)(82960400001)(66946007)(508600001)(54906003)(316002)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJPN21NRGNYNDVFL3I5QnpYZUNvVDNndTAzRlFvNHNQSkg1ZmM0dVlTak56?=
 =?utf-8?B?bjA4eFd4bVA0NTlIUzZ3UmFjaG83Y2lBcmMwcWFFWFFmRjd6Wmg5ejg3b3lW?=
 =?utf-8?B?cjFlNkNyN3VVdnZvOTNLU25Fc3k3ZWpyM1U4YTdFZHBhN2RyUU02Q1VrVS9O?=
 =?utf-8?B?MzVTSnVYWUF1cjdkcVRqeU1MTWFITGtVZ3gyM1E0RUt2Q2RFMk5iWDZUM2NP?=
 =?utf-8?B?YjYreElqKzBlNkp4UTUyTkxpcGNtOEtDSngvWFZIajNwUjI5Z25QUnZ3aHFH?=
 =?utf-8?B?MXBKY0hQaEgxR0EzQVBESzkvZmpqYllmekhOWktHUFM1RlNNUDllSjJWaWpV?=
 =?utf-8?B?VFZaS2NOOStXRzdTeTZoMXYxOEFzeFBzZmJXQUs5WnJzQXZkY0lSOUtVZHJ3?=
 =?utf-8?B?WUtzb25hb0ZzZUZpd2ZoWTdzK24yb0JnN0dUb2lwaWZLR1hncUEweEt4bDNX?=
 =?utf-8?B?M0Z6aXJ0cVVVQzV5ai9BWlByYVZTY2hKNUNlZUlwMDZDTjhqSHU3ZEVRWGVF?=
 =?utf-8?B?dEh0S0hrRndZUUQ1YzZ3SEhXMmdVS1o3a3JhQ3h5Wkw2L0J5STV5aUpzQ3Fo?=
 =?utf-8?B?SldvNlIwWmpGWjBRd1VaUGpaYWdXOVg5U2o3N0JDNDdSMDBiaXVuTDRISjRF?=
 =?utf-8?B?WEVBMzFLTnBSYXRqdVRsSms1a3hXanE1V25rZWtueTlmU2ppVldPdGkyaWdX?=
 =?utf-8?B?RU14NW10aXl6QVg5QzhrWkZvK2JoUjlLd2NhNEVDWjRPcVl6ZjlQSCtyVWl5?=
 =?utf-8?B?R2w1WHNSdkZRUEtGZUtXZDJkNldDc21hMnZQOG9HSGRWTTdWUGR4T3pSaC9n?=
 =?utf-8?B?cGE2YjNTVDBsYWhpNkc0aWtreUpBeWdBdVE1STl5MHF1MmRva200blNySnhN?=
 =?utf-8?B?K1R1V0R2YnA3RWlJSHRrS3UwNjJNL3dJWFhHR1g4Skw2V0FMSEI2dFlTTlVK?=
 =?utf-8?B?VU1sNEE5MU5lUFIwUFY5d0wwT05jcmlsTTV0U3MvMnNzWUZSOUpJKzkzSW5r?=
 =?utf-8?B?WWpQSERZSnAyeGlENVBhVEg1T2lJYVRzNEZ3YWYybVFCQXVJTmJkSC9UbUZZ?=
 =?utf-8?B?cE93WndQNFI5RS9MQ3ppT2x6OXovcGpKTVZ1WWhjcmd0NkRkUUZQcHhuZXlK?=
 =?utf-8?B?dmdsQzdmZUFUTHFCYWkvazJwN1FabUJtSTBDQ0tZaGZ0TndnN0VwTlI2RWhK?=
 =?utf-8?B?aURDdXNFTUJUaElVQkRGd3FGREdMQ3pWSnFhYXprNmowWXNUTTY1b0lidWN4?=
 =?utf-8?B?VkxBUVA1b2NlUTI5WWJYOURtTmxtUnVFbjhHdHY5SUdQSjQweFJKeHB0YW1s?=
 =?utf-8?B?NUViWnpidzhKNUxDM0F5a3JIdDdLT29URm03V25aYkFKMk9VUFE2ZU5Caysz?=
 =?utf-8?B?ODVXb3ZRWk90ZmFGOXVzQlM5QjJqc1RSMm5yTGh0RlE5eWhIeWRCdm9iMThP?=
 =?utf-8?B?NXhqdncySG5jZ0ZPdkxua1pUNmo2aThMYUt2dkF1ODc3RU5uR2RXVkY3OWNh?=
 =?utf-8?B?OTJMank4QVI3UjE4elVEeXVnazVwMzZQVDg1Z1FuT1RwN2VTOFM1bzNkMk1P?=
 =?utf-8?B?WU8zZ3E1SGNSVlNHeVJnSVNOdzNPamxoMlc0TUVzcVpic2FhdEdBck5XVUxJ?=
 =?utf-8?B?Z0NXS25PdkdMYWljWXBJaENkYXJud0grMzRqejEyT2d0Q2tWcXZiZVA4Ulpz?=
 =?utf-8?B?cUZaM0lvM2ZPaEtvMnFnU2VOWjl0eW16NS8zNk9RVElqMENSWlMyL3J3aFZv?=
 =?utf-8?B?M3huMVVkdW80UTkyZnFqUFl0UU9jYmEyQ2RmalJ1eDRqY0s1OVVqRDFza2Fa?=
 =?utf-8?B?cFdXMkRTaTd4ekpXMkRhbDhva2tOUU41cVUzMUs3RFErVFlhTHJibFRpSkox?=
 =?utf-8?B?c1l5TFRwa2lKTmt4TndTSjB6d1loWjAvRUo5VHF5ZEVBVWMrdUxCRlU3c0hI?=
 =?utf-8?B?cU4yQWJxb3RqWlNEYkltME0zNVVLQTdRa1dFbnVOdEpFNjN5UnViQkRYWENs?=
 =?utf-8?B?U2Z5WFExTTJFVjdzUVVtQ1dnMGEyQ2xiR2QwTm9aR3lMNFpHOFVHLzRZb21Z?=
 =?utf-8?B?S294ZDdUNHg0NWJST2prbzhPSG4xcTFrTlEwRzNkd2FCVjl5dHlvUzkzdFlm?=
 =?utf-8?B?QmpVR0d3OVlPUXBpSStNNVY5aXJ3ZWFNbnpLMzNnMmh4WGVXZERON0JhaGtE?=
 =?utf-8?Q?bMlptVwLgQySgy5SBOsaoZs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82912828-3476-47a0-b922-08d9c0848454
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:09:24.0183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5p3cahkSMHGqL2wy+2DBsKBtzED96JPtgX5Qp+FxXmZqq5UKeK1jOjT9uYD+CWAw7ZVMUdki5Q6l/6RK8DtDhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3737
X-OriginatorOrg: citrix.com

On Thu, Dec 16, 2021 at 11:00:17AM +0000, Andrew Cooper wrote:
> On 16/12/2021 09:54, Roger Pau Monné wrote:
> > On Tue, Dec 14, 2021 at 09:21:22AM +0100, Jan Beulich wrote:
> >> This reverts commit c22bd567ce22f6ad9bd93318ad0d7fd1c2eadb0d.
> >>
> >> While its description is correct from an abstract or real hardware pov,
> >> the range is special inside HVM guests. The range being UC in particular
> >> gets in the way of OVMF, which places itself at [FFE00000,FFFFFFFF].
> > I would assume this range to be unpopulated? Does hvmloader populate
> > it in order to place ovmf?
> 
> It's generally not unpopulated.  The video RAM lives there until the VGA
> BAR is reprogrammed.

Right, but that's an MMIO area from guests PoV, even if in our
implementation is backed by RAM pages.

> The reason OVMF places itself there is because it is where the real SPI
> ROM is mapped in address space on a real system.

Just to clarify my understanding, this is not reported as a RAM region
to guests? So hvmloader or the domain builder populates this with RAM
to place OVMF, even if not reported as a RAM region in the memory map
(much like with ACPI tables for example).

I wonder whether we should have some kind of document or code comment
about the guest memory layout (maybe there's one and I'm missing it).

Thanks, Roger.

