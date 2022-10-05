Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5330D5F55DD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416262.660916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4qC-0000vI-DB; Wed, 05 Oct 2022 13:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416262.660916; Wed, 05 Oct 2022 13:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4qC-0000tJ-9m; Wed, 05 Oct 2022 13:53:40 +0000
Received: by outflank-mailman (input) for mailman id 416262;
 Wed, 05 Oct 2022 13:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzUo=2G=citrix.com=prvs=27000a6ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1og4qA-0000tD-Kz
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:53:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b377bc8-44b5-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 15:53:37 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 09:53:34 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB5990.namprd03.prod.outlook.com (2603:10b6:208:313::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 13:53:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 13:53:25 +0000
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
X-Inumbo-ID: 1b377bc8-44b5-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664978017;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9wsRYVWxaHyD76ELy4H1JP8yf3tq4MK3mJc/65W1nDk=;
  b=Xhzu7LPiAlIGfQz8gFfBCr7lohctndU1rbW8x4BkmGEIko8g2suWkflG
   8QD0BfyE+J/W33sE7a55aSptxx09USqXPuAOcD4hbTO2bh1diGtXSGkbg
   z8UZb38pSOMHFFrZCxk7f8Hbre+628RPjTtKO5ZTo3F81EzAoC8q1Flph
   c=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 82016701
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aXdY2qiWUQBSpWl1tSSKyM3jX161ihEKZh0ujC45NGQN5FlHY01je
 htvCjvQMqnfZzP3KIpyO4SwpEhUv5HTytY3TgVo/i9hQS8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmPa0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUdM7
 NYiJB1XVyGeiNmO8oi9afRz3f12eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFMZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r83LeWw3yjAer+EpWfp9xOvVG27FcMIw85BUu/uf6YoVWXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbBRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8hRO/PzIEa1ALYyAsRBEApdLkpekbixvVS995Ha2dj9vrGCrxy
 TSHsCg/gboIiccBka68+Djvjz+pp7DISBA0/QTdWm+57gJ/a5Whbobu4l/ehcusN66cR1iF+
 X0bwc6X6blUCYnXzHDSBuIQALuu+vCJdiXGhkJiFIUg8DLr/GO/eYdX43d1I0IB3ts4RAIFq
 XT74Wt5jKK/9lPwBUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:t/DmeK1xp3m1a6QivB2A9AqjBdJxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQD0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T+c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdkDXI4XIL0TvP2FWYiXzsrYjQQy87MdNIgcZ8fgHC40Qtkdlg2O
 YTtljp/6Z/PFflpmDQ9tLIXxZlmg6dpmcjq/caizh6XZEFYLFcgIQD9Ad+EYsGHgj99Ic7ed
 MeRf301bJzSxe3fnrZtm5gzJiFWWkyJA6PRgw4tsmcw1Ft7QVE5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTRb5hBc8aKPHHRFDlcFbpCia/MF7nHKYINzbmsJjs+og44+msZdgh0IYyop
 LcS1lV3FRCNH4GMff+nKGjzyq9A1lUBV/Wu4NjDtlCy/HBrYPQQGy+oAtEqbrknx0daverKc
 pbdqgmR8MLFlGeabqh7zeOJaW6FkNuIfH9muxLL25m8fi7XbHCh6j8TMv5AobLPHINZl7fa0
 FzLwQbYv8wo3yWZg==
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="82016701"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4CsF6bYBWZ6u9L7SRiIeNVfTA5u5ZyxgBTNHf2AyXe2t0TJyTkFG2VQ3dS4Mfmx7DrsdddNSWB1S8bl/TPprFGiS1kGOKTt0U4Zpsyc52zOUyUttnrcJdEkScdo9kbfhv7LewV3Nnt9J3nMP6eFlLLn87f+AfqmUJlglVi5bbupi1nZo69EkrAC30jM+5uqxavaQ/f0FRv55TcYvxVbnKyGCuowzw5usojBhdyjb7UKK54s/FzKyiDlK5ZQk7EckHSgpJQsjIXFp3EBtgqBHiXFLQUSBFNoUOW/wzoeiYsGHu3oEsAmbVh6vmL6Wi6lDKnNfLa/502anCWagyqy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inVV5Ie3QYghmXNDUIr67TzbUUcoGvEHtnoUDnuNlpo=;
 b=R1hHuQ3VjO75RiOFb2SJG2VPoEaRGyEcyDbxk6R1WEqvKesO4CD92hgWgZB7f5zW0TNhV47TZZV18pdsVQMs/gselZtrj15W8nhd8bcsRIlc1HFNQi9OQ0i3AndLa28EY9ROM/OfQ1QzGiMCdh278uCf/ARycBd6kXnCOukXMlvYtAmbTsZ41yROPxiJ0mdUzhLAcBeW7JSM2mMhbOgUrJPyPLl+9JKYkACuEY8tuT0Ar2aY97NVmqZWA+OT90ohyCOIRcUCnycn24cH6ryKk4S6FusLtaBwaEVws4+qKQEF2IjhKqLQS1E+pvb42vLRnYUvPVuX1Hfcp7HsK0IQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inVV5Ie3QYghmXNDUIr67TzbUUcoGvEHtnoUDnuNlpo=;
 b=ge0e3/GQfiVCUA5aCcdy99v3xTLOqiqmU8tbQNrW2/jcftgJFPbdeFtvwgSZmPdoo8UkhNxcohteTUTLKOwwEV6F8LkLBbUHSR/ZR0qU5aHYfcKRbeleU6KRcguZgfMPXTgbi5GqiUwCN0js2l/PTHaMGSuR1PIdOYjsZzqRO/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Oct 2022 15:53:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Message-ID: <Yz2MT9oIH/ofJmQ9@Air-de-Roger>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-2-andrew.cooper3@citrix.com>
 <Yz1Uoma3S4Wgmr4F@Air-de-Roger>
 <0ff7672e-46b8-d74c-ec66-75a1bec8b557@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ff7672e-46b8-d74c-ec66-75a1bec8b557@citrix.com>
X-ClientProxiedBy: LO4P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::7) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 3959822f-a5cf-4db0-6a4c-08daa6d8f975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	udAEEkOSh2lzpCAN9i7EgqZMOlpIQIzDIWBgH0ZZcC0uYtdnXlV7u5t6y6VYjF0yf6mVnvXSJ/oegS+l+L3d8KU295M5y5vGD7zcnJDbJbTeMbvqAYtYoG6tmkIbvmjnFqThEXt5Sy+WP8QGiF0bkInMwsJv/sfQv+OVB0+ffMKgTzCj2+z7Soipvb2s44rDOMB1xnXKBeXi8v4WYparAuEB3cUbl771mflqF6bL6z6BFjOPN+kEVoJ5fSzQcv66iDtvZ/iz8alzv/VDIbthz++9tPPIWvAyMBBOkQPpDLVvTKnLPwoLHRV8xS8uPaHPfHwVvSySKoD5ysq9bXicaBVcRVxIUrO9xYWFXQifcqw4ixRNMi1bZ0Pr8Az/MZoI51CdGfBWGbztBjGuuduVS52pkwKwO5bLGusdL7cJOlRf8xfEYHuLaDFYA4ZMGxTfo9UEil7qJLvPr5H2YKWw4KWLHAI6InLZMYxu9mYRp9Y1I3//W9NgjO1FL2sGA0QxApBbI8aQ0j3eZtONsYloe6iuBDxq9ECU7J7hQN3DCxK8McIYDhAr2gr+VXAIzSXed476H2aG6a7Zvk0Hd6bsDlfQiVj3rNsQq7V9OiiXbMTl3gb0Wg8D1sh5pkud2o0Wyk/JKLiD+iCYb1yH50CHu3uwcLYj0UGDfWT/EYS7JeGk70f+8AL93pej0gR+yZAEpnZVEU0D+umAGPh4QYS5Kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199015)(66946007)(8676002)(6506007)(6512007)(54906003)(4326008)(26005)(2906002)(6666004)(66476007)(33716001)(9686003)(85182001)(316002)(8936002)(186003)(38100700002)(5660300002)(66556008)(6862004)(82960400001)(4744005)(53546011)(41300700001)(86362001)(6636002)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDA0V2pDS3RWL0JSaE5uOWZrYlk1cWMwSjM3OGFBZWR3S2lPYnJzOVVZdTFj?=
 =?utf-8?B?aXVvclJqWHVBZEZwRVZrWUVCVFFodVQrT0JGLyt4OWY1dEoyNzluS09jdkw3?=
 =?utf-8?B?MlJRdzlValZESndhdTdMcFJqRTlaTnJwdHBxc2F1UGQ3UWJZZlhMeU1YMUNp?=
 =?utf-8?B?U3FLendBZklaYUxLM3JZTE04TmxsRXNXSFd6Q3p3TEJIVEhQQTQwTzJhdkx0?=
 =?utf-8?B?dkNrVElNN2I4NS80K0h4STJMSXY1d2hQVGtPeEZrNXRNaUJnSTFmbFMycmxh?=
 =?utf-8?B?Wis1Y0FFUzZXS3kyTDVURDEvSWtRUUhNNGRHZWNtbmdaT0FjaTROMi9EazYv?=
 =?utf-8?B?OXg5MFlYZkRVT3A5Ky9QUklPSW1TSmRWYVFXbnhERUsyLy9XUS9zSDdheURE?=
 =?utf-8?B?WHFidERmdVJGa1IyRkhxbFVkKzIxREdDUUlYZnlZWkZscHV2T04rd3VjK0l6?=
 =?utf-8?B?cDVRNldyWUZvOVIwRmU4RStkSHRHenRCTGphL0tuVGVia3c4aHVEQ1k2VUd1?=
 =?utf-8?B?dmdLMmt6SW1rZjRocHhFbE0rb3RjOWVCcGxnaHgxMWUrMUl2TWROZzlPVWha?=
 =?utf-8?B?RC9hTkF3Qml4aDJoTE01ajU0OFA5dmtaWlFacW5yd1NTMUdjakFBQkhUL0J0?=
 =?utf-8?B?Y2p6NzRaSzRMUjNZVG9hR2RRNGs0ME9lU2tDbldKRzVwZ0s2VjcxK1M5TGU3?=
 =?utf-8?B?WVNseGs0OVJ6R1l6bWhPTEkycWRCYW9hVjA5ODNzT2JMRzZkU3dsZ0ZuVHdw?=
 =?utf-8?B?a1VOdTVaNWhpSE1yUUhXQWErNEpyUVljMGdGdUdUcDUrcWFzTDEwVG9aRCtS?=
 =?utf-8?B?SFZEVzVJenZSV01BcWxyajk2SkU2L2F6MGVIdElIamhvazNSblYzeDkzYkRV?=
 =?utf-8?B?Q0J2RHZUbzd5SWVYV3R0blZ3R0xaMlY4aittN1U0cTlzdWJxOWt2Zmtpam9I?=
 =?utf-8?B?V0lqdjVnU2Zvd1RHYUpSZVVXZ3dXSzEvRWhnZHNxWHRiOHZSTkt6V3liaGlM?=
 =?utf-8?B?ZUVWSkRabEVNditmcURqSE10RUliakNTdSt1YUtRWVk1elRsOXhQZDBWaXhl?=
 =?utf-8?B?RXcwMmJ3MGc0ZzdEMENUaEIzbnM4aERyNzVJM1JCQkYyNUpMS2Y0dDdyNkxV?=
 =?utf-8?B?ZnQ2K2dGMW1NNkFFU2QwWEswL0RkU3BBL2dKTndLVXdDY3gvNlhEeHNXaExN?=
 =?utf-8?B?ZEZKc3VsdFVjVEVZbFhTT3ZEb0k4OGlmaG0vS3hCOHVLWlBGUnpiWVdUTjha?=
 =?utf-8?B?VC91NEFxQnJvcFQrZWRKaSsvS0FZR0VDbUdpeUNVSkxqRDNzMnN6UXhET1hR?=
 =?utf-8?B?SEdNNTBzR2g5ZzlhcGFCRTR3K3ppT21MZkR4M29ud1B1eWdXRGhrUDMyNkVD?=
 =?utf-8?B?bE5RVktQY0grdTNUVnlmWkdWMTZrTG1McnQ4NmY4ZTRra21Lb2ZEZEx0QzRn?=
 =?utf-8?B?dmJCVzE3V1VPOUdsbkp6NkpMS245YXovVVZBZE1pYUdSZ1c2MmJ1cVA1WlBu?=
 =?utf-8?B?SGduQStYeHEyTHJ0c3lRNFlWOW5QSmFBZDVibEVTMUI0ZmdJejE5V2NiSTNo?=
 =?utf-8?B?VWJPYVZBSHV6NHBYbEVLYldDQWI3dVFOSVhEUGlSb1ZQaWswSndjK1FJY3U2?=
 =?utf-8?B?UWFkVTRqc2NUZ1NYeVQxVUVxdVE0YmdURDZOVEdlOUFUN0xydEVSeXBLVmll?=
 =?utf-8?B?SEVnT1JzT0FPL0MxZmw0TGNvRHpEQjRlT2ZzakNSLytBemUzcGdxcnV5Sm14?=
 =?utf-8?B?N3E0anhjaHdOWkVaeUh0cnhHbVY0Mkh6ekdMQ0ZLMlROdzBpa2poNm9sZHhF?=
 =?utf-8?B?UWQ0L1FWTGFuMTlCaGhkTGZ0cnFWOWltdnRmRXFOWEgwOUlhaW1SdGJEOWVj?=
 =?utf-8?B?RjdLNzRJN2dJUExwampWTDRtWi9maFVrQ0gzbEcweERlSWxhWDg5a1orY0M0?=
 =?utf-8?B?c0JCQnZlbUtxWndpRXhCRmVyOWFPbTBKNDZ6WW9qUWd2dlQ3L05KRWd4QXE5?=
 =?utf-8?B?d1hJZkJncGxtek1NN2ttRDZtTExVa0NaUGJIcDdMUkRSWm1BQ3ZVOVdXekUv?=
 =?utf-8?B?cXZoL1orZjM3SzFtNEFoYlVtQllIVFJzMXRSSlRRQmNwT084OUVGZWNUV0Zm?=
 =?utf-8?Q?6fKtI3DEbPZU2558AwpfxnkIF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UHh6UEFtTjArY1RsdkVsYTVmcHNWd2pVR01vbloxOXZVRWllbzYxVC8yd1My?=
 =?utf-8?B?R1RXWktGazFyanhtbHdWSVk5REk4QWo5OWtSYS9xYlMza2tMaG5TeFdBblFu?=
 =?utf-8?B?b2l5QzcrM0xieU9MTzhxeWxKdGNUSm54RE5sVEJmMVlqODRTTENSQVh4Z3Nv?=
 =?utf-8?B?OEFpNWpCNFZDVnVNWHA0M1I2REJsRDl5OG9WejdJS2xrZjJyT1pYdU4rNTJX?=
 =?utf-8?B?NGwyUmUwMEhRNjJyWmt0T2l1TExaZ1ZvNVpvTHVtK1NCRGs0emNjMmovUWl5?=
 =?utf-8?B?bTcyeldNQ29ha2lFSTZWdE8rSWNxL3lwQXZnUEJsTjBMZXdlQUd5MDdaalhv?=
 =?utf-8?B?WlFYN2lpL0FaRkVBYStCbnhNYlZyeHRVdkkrQ3ljZHhzRWUwS0ZNZWVveFFV?=
 =?utf-8?B?V1hyV1orOElqeDI2NjZlNnhDNFFyLy83ZWQ5NkJRZldXTlloSUp4NVVER3VU?=
 =?utf-8?B?bVU4WFdObGdubUVJanJvSEZ1aWxCZVdQa0todFFTS3ZXUzJ5SE5UcklXWENL?=
 =?utf-8?B?Nll1aGpzYXNpWW9ZZmE0aVFoWjFkQWVxTFdvLzhUeklQcVRJQVo0aGtCMU4z?=
 =?utf-8?B?QllFcmtDbnF5aFFncTRNVlhHNGZvVjlGcHUvcHp6S3RwS0JUNEFIV1RUcURB?=
 =?utf-8?B?N3pSTjVtNGRWNzdMeG1XaTkyeDExdVlvU0NNK3RRNXVQMEMvRVl2Wk9ZQ0pK?=
 =?utf-8?B?elRBVzhiMFlkenZNM05YZTBpdXp3ZWZrNXByN0t5S0U2OThoelpFcTdhSFpH?=
 =?utf-8?B?ditoNUhFUU1qZ1VFUzFQSE5TSDBiU2pLd3hyQ0lzQUxFN1llMTFoTTBoMTlk?=
 =?utf-8?B?blJXWnVETW53VG80eDUxYTVPUHdFNGZpYXZGUVBnRmw4TzlKSnZjZlFpbmxv?=
 =?utf-8?B?b3RrdkltOFVoR1ZXa1RpNURqMkErMG05YWxCQ2pna05JNUxQangxLzdSRWNK?=
 =?utf-8?B?MStxbFpPZEFiM0JHdnhFc2FOWTJPRlJLYmMvRnlybHZ2MStkQVhvMzJHVlFn?=
 =?utf-8?B?NXM1WlFKeFZFVXEyOWthaEdWbkhFelRPVGR2Vzhyb0twY1Q0TEUrRWo3UGhT?=
 =?utf-8?B?bndxclVTM3VjSW5UclZTVktDVFdUYjF0MU9vOW9CdHNES1FkVFZpeXFRU0tz?=
 =?utf-8?B?eGJiSzc3Mi9ZRzNTdi9MNWQ1MnNBekFodlZSQ1RKaE5ldzVPZldvK1JEazNS?=
 =?utf-8?B?eTZaSVcremhFMlU2U0xLck10OEZJdFRxTy9COFRWSWt1M1VXR1NZYTU1OHla?=
 =?utf-8?B?cjRkMFlBM2JUQUpWZWJuS1JLT1Zzd2kwQkw0RzdqYzhuV0JwUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3959822f-a5cf-4db0-6a4c-08daa6d8f975
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 13:53:25.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liSD2HJgqwMNLlIylRruKRiVKhChXAosvSYnMNtNf8wnfglYQRhQ7t5Q2/DfQ3+hj8QODS83TZ5x9UZ+7kB+yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5990

On Wed, Oct 05, 2022 at 01:34:06PM +0000, Andrew Cooper wrote:
> On 05/10/2022 10:55, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 05:08:09PM +0100, Andrew Cooper wrote:
> >> A future change will want a cpuid-like identifier which doesn't have a mapping
> >> to a feature bit.
> > Why we prefer this logic over just giving such pseudo features a
> > synthetic bit or akin?
> 
> Synthetic bits are (intentionally) not available to cmdline parsing.  We
> need something that is available for parsing.

I think Jan expressed my view better, in that it would be nicer to
just have the MSR_ARCH_CAPS bits in the featureset, and listed in
cpufeatureset.h like we handle CPUID features.

Maybe we want to go your proposed route now if that's easier however.

Thanks, Roger.

