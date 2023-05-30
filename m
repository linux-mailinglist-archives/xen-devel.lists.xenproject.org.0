Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426C715969
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540953.843132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vL6-00050z-L8; Tue, 30 May 2023 09:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540953.843132; Tue, 30 May 2023 09:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vL6-0004yU-IO; Tue, 30 May 2023 09:08:24 +0000
Received: by outflank-mailman (input) for mailman id 540953;
 Tue, 30 May 2023 09:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tCH=BT=citrix.com=prvs=5074c9224=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3vL5-0004y5-6g
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:08:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84ccddf3-fec9-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:08:20 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 05:08:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV3PR03MB7359.namprd03.prod.outlook.com (2603:10b6:408:1a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:08:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 09:08:13 +0000
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
X-Inumbo-ID: 84ccddf3-fec9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685437700;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QX4KCN4m7ZVeOB2VRjERMhtaPUv5AAwwibX1Fbaa/+g=;
  b=ATGbVD8BQgOOgofCNFnG9UGUBYv9IOlzqP0tfsZtitWk5VSCskwdj+Jw
   LHdOQpZ+YDqI4RjF1xfUv+M/XpSq91470NP/6DJOzS3SCy4Id+cctu0+i
   llzI9PeD9vcE0czKZ1h4UBWPoJTc7Gb0hKK0tTYzvYV15/l9WjEpj1r42
   s=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 110780281
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0TUkx6qAXKV++wJaL6CI6BSbsAVeBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmBMvzbZWbyLt10bNm38htTvcKEyoNgTwVqqC9hQypDo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzCFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACo2STfdiPus+qC6GsB2pZ8Kb+TGIapK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWMEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtKS+3grK4z6LGV7kEuCQczexydm6WarUf5B85+C
 kVTxSV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWFNJ7Svfq15vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:UN7r8qrKR2vYBh1Xl4xbKO8aV5tMLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qhoPRPAh3Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6f071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6p9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW32/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLTU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6ksoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPSHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwEzvn0ehT/Yd3R8LAd23Ag0YeMAYYDcBfzB2zGqvHQ48n2WabgKr
 KO0JE/OY6XEYKhI/cP4+TEYegjFZAvarxqhj8FYSP+nivqEPycigWJSoekGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHYZpa/ummcZ0/Q
X-Talos-CUID: 9a23:kuGjymFcg8XnFYPUqmJ9z2kzRM88aEfPzSf5OWzjICVEZaC8HAo=
X-Talos-MUID: 9a23:M9zb0Qqak097RUXjbIMezxxfNd1NzeOIMhwutpxB59WlFCU3BDjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,203,1681185600"; 
   d="scan'208";a="110780281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDZe7qk6KcRvl+vUGBXaOJ9+8hAD2P+y6IEuXQmr9Lw6GkAPK6mqIaSBldHUbkADLDSNCz1eluPYTHJ9s62HQ0Jho8rnvUFoympgMSBNzPyzNrSHJHLYX7jhFMYafmVK2TJI9549IijBvqJj6QCIyh4q95mV4E4VxDoz7IKcibjrDcBgjcQHJSMMoZ/nf+68SMjAKcFRz8MRCSoZ+QDlHWZL0zk/1RekKSp8MCI8q92hhjYIv4z2BR/+HJYN/YEBYyPzX3EPgIsyYWikan+KeP57Ni0/l+3FO8z/XTUKXbt9Fivi3T6zkUzEY9qsIedJ2OpenQE0jVdTKwLtEUi00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dlhsIQp2huyve/jcOpGQpBIbgHGAj6O4wLLauBNjxw=;
 b=jS3z+WST/V+YMSPHjP0+zh6aHXylW5ErS2lW/Ip1xyk9T3pxFyFvYyR5hY5SZa8wHr3zrXtlYxBBc/Sn/O+rGf85+pODwigBBr5v+TxsiyDVS0oMoTe8QowMoq75pe0rRhn2WEcWDyDkYuhctL4PndQzXVKdCd4Hkt4hSAUcRhk6JZe3GqC9ZDOPFuYmllC/7dNG9mmT/zY9KC+eZJqNmbrMqJzltBVvcZx74qWbdXOYTfjjnAFcC98DY3dPFMNL2s3nSuqJjbdUBeQEqBbv5VFrrMrzn9ou6uiPGA55qR06YkVFZi1ZZ9xXrzJkduWw56rJCsB6w8CCpz+K5OqJtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dlhsIQp2huyve/jcOpGQpBIbgHGAj6O4wLLauBNjxw=;
 b=UeVse2RxvaJX3zH4iJ3cLsQcIM4Sv9+hda+jMf1mJz/7+1p4KMxFIgZBbQR5cM9tpnLA5W5l+2BR+Sgmtq15AyiXdlNDoYam41vCZGjQ7pyHGH/1J8NwkXqeo+X/pAg/nuReG9LlWE+2mGMvyFIyWznJrF3u+NEqVarM8NYSvn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 May 2023 11:08:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vPIC: register only one ELCR handler instance
Message-ID: <ZHW897liNQKSbB0F@Air-de-Roger>
References: <5567b45d-d8ee-7f43-526f-7f601c6ddd46@suse.com>
 <ZHRkstB6UKWAadVZ@Air-de-Roger>
 <5f04bdd7-2337-812b-cf9d-985fe34d0f5d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f04bdd7-2337-812b-cf9d-985fe34d0f5d@suse.com>
X-ClientProxiedBy: LO4P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV3PR03MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: b953e6f1-2bf2-4565-a7e3-08db60ed657b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hd/7fxZp1yUw6KdOCDUTUTvwTxBT4Rm09VBUWCdgNSd57T8ODRB6rbtv/LNB+u6s+iEsjGOHuMwdNDSmpx2DgSbSwvkGULXmz7GmxeSIGGDld4BIMvSUd2kZjV3/6hnsRaTx1a4QlaWFAawpwY6Rig43dbsUzUAbj3oyBZCIKzE9msz9OkhjSVOioj1indAIqLuuLA8Uu0dhtQm6P7cYFB169bYmRaHxFowN299H0jaeAPKZkdo2fYuiMeLsS1QK7MWuKEVatrGNebmznGD8vdHvQnyJ0UOxxu/4pPvLspUwLMQMIX7DHJE+PUmSx9HMdYq47CFpMb2TS13c5EpYlnSidvmrmkeoTuve4xYZpnldPWim+n+uAt4eCut4u42lBJFg1T/GKJWEkyWxbA1KbHfNzBeIsLEzPpJdrXhzpx/3WpyBOzuN/pP/8NccMLsPrjrYEfYTeZpZ9vQOYEe7TXA8kAtnHai1lfKBieKWst7DcR2lkkxISa/mwAffVCb2L15OrO29daUKGICl64k8vfPKGHgfLFgiZmJgT54WD07kRk8HOpBKciyWMj6AUpbj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(478600001)(54906003)(5660300002)(8676002)(8936002)(85182001)(2906002)(86362001)(33716001)(66476007)(82960400001)(66556008)(4326008)(66946007)(316002)(6916009)(41300700001)(38100700002)(186003)(26005)(6506007)(6512007)(9686003)(53546011)(83380400001)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmVLamtTR3JzY21oOU9teEwyNlhkRzNiUTNLV0t6eVJvUjZ6a3lkbk5KNEVX?=
 =?utf-8?B?bnhhVGFOdEIxa0hvd2VyWFFhNHpOelorR3lMaEJOV01sZ2lvdjFJUkJYNUJk?=
 =?utf-8?B?dXh0eUVabVEvYjlMV200RklCM05oUnpYRHpMNjk0SWlMT3dkdG5xN3hVMUto?=
 =?utf-8?B?VTF1Q3krVDl4ZE5jbGx4V1BSRkRwWlVJMjNiWGJYN2JrSnh5Rkw0SU1HcmdE?=
 =?utf-8?B?Y0JCWnN6L2orTzkrdytwQ0pldXdlaFVIeDRyRnJHTGdOdWM3V0NqU0F4TVRj?=
 =?utf-8?B?cWV0ajlpTWFQejBFOHc4SEpQd0lMQ0FGdUhKeGYrdFhXb0pKN1diQ0NoL1ZB?=
 =?utf-8?B?MlFMNG9yR1VjQUp2d2czQitGWnB3RERIdmlGUW9ibnEyN2R6S2Q4dUxvRzM0?=
 =?utf-8?B?ZEpkS2RuNGdVSHEyMzdzdFlnVG1YaXBUQWllRXAwTldCcDVyYVRwbE82NWRI?=
 =?utf-8?B?aTNEclJQK0ZrcnhqK0FSam1CQnlmMWYrdzIzZjQxVDEwSUk2d013dGRnMGxE?=
 =?utf-8?B?VnFONW9DNjJjWVJIREZKK1NKYUhXZy9hMlNuY3I1TDNaMWxJOVFkTVZmYTg4?=
 =?utf-8?B?MnpGUWUwRWtQaDhWcjdobjRwUmJaeXlCRTEzekpSUVdQejBjaUh6WVQ1Wm5o?=
 =?utf-8?B?SWMvUCs5ay9XeHM2Z1FKUzI1Ty8rRjIways3M08yWUJSNFNnejB2R3ArTVdq?=
 =?utf-8?B?NkNWbU1BaFEzWWQrcVl0SisrZFFVMXdncEpvTUNCSDBNYnFydW11TGlyK2Vq?=
 =?utf-8?B?YlFGRWZEdFZZOGNFdkNjK1ZvU29GbU80SjRxMUd4R1RON1ZPSTg0Vlp5QTli?=
 =?utf-8?B?T1htdnBQNlVGaU14TlYrZGpCREVOdVdDNDg3cS90TTBtSDVZMHgreEoySS9E?=
 =?utf-8?B?ck1TWE1SRks0K2oralJMZzNWK2N4U2pjQ0NEWHZaa3UyZ1BpVm9vbThvTXFq?=
 =?utf-8?B?R09pbG9TTzVhZTdZcUxzWkVKUGFHM0lqbWJVY1NwdlNYVGtJVE9tMk9nMjlW?=
 =?utf-8?B?dldOYmduS0VvMERCazRIWUd5UFU0OXR5Vi9pR1Fpcjdpc205V1hOUy8reERJ?=
 =?utf-8?B?QXRVQnArMGZHOXlzamFFUHlVbk91MlFDQzBpVzRQU0pKMzdibDVIOFV3bmsw?=
 =?utf-8?B?TVhobTVsUStlcnIrOXRzMUVJOEtHVWF5Ri9IcjFnSDFjVHgzRHYxa1BMaCtt?=
 =?utf-8?B?dkFleXJENTVrNlNTOXo0WlZvWnk2TE8wZmxnZkh2dEVnRnJzRmxqWlVOZ3NC?=
 =?utf-8?B?OUg3QUJRM1p4YXo3cFZSMVpveVhDY2p3QWxraFBSbmo3MUxSa055aTJkYi9G?=
 =?utf-8?B?Y0dLdEMyWW9TRXRKMm1CSXBoOERKQWYxa01SbUNPQUdUYWYxUzY2TmtFajRp?=
 =?utf-8?B?WjBpL2lZdjZSWm55SE9aMTQ4R3V0S1ltL3dXeEVvNjcrMVQxaEp1QzV1RGNq?=
 =?utf-8?B?Z3ZLcFdSUU1UYzkybm1sMllFaGpGY0oxRitOdThKcDV1OGZtcW52SURvcnQ2?=
 =?utf-8?B?M3hLR1p0aVloWjE2SzNTdDV1RFB5bjZjMUI1U2RiREw1NEE2cERNQlBUcFll?=
 =?utf-8?B?THhZaWIxVlg0eHhmeVNXY3dkZzRmbXdkTHVPRG4wbXVuK0UrS2VlbFc1Skx4?=
 =?utf-8?B?LzREbTVaMERvZ1cvellxOCtxRzVqTzNESjdFTldLa3hJU3Q3a0pMaHpXMlZ3?=
 =?utf-8?B?NVNwYXJLZlJDbjQ0VVlqbTBDWUtxSTFwN3NkYWNMTmM4SEpUS2l3WURqZ3hM?=
 =?utf-8?B?UHl6cEJmcURIM05SYVBkbmtwajNhRUlQak1naSt0MEdTOGVveUNyOFdRVlhx?=
 =?utf-8?B?dFl2eXYyTG9Vb25HVzY5NTVrWWVWY2JCTHpmelhMaFYrcFlKem5wZkhrU0Y0?=
 =?utf-8?B?QkpXL1F3OVJJczl1bjdFOUVBYmpKcDNGbTNIa0ZEOFRUY3E0cUNtMTNEc01B?=
 =?utf-8?B?aWhUdXh5Sm5GRlVFa2xHdG5KNnVoSzhoaEQ4RXdOUVVBc0h2RVByZTd2TjZP?=
 =?utf-8?B?SFhRUzNVSFZKS3ZKSGdoWE5QdDhpV21RT3R3N2ZJbmRUTm4xUTJha2Fsb0hj?=
 =?utf-8?B?dStydU5aenRlR0lzVHhLd1d5NEFobEs0SDFMTTNSVFRoUmpyVXJhdmc1Wm1P?=
 =?utf-8?B?OVVPTis3ZDBsMUxBT25NR0dhTVhnNXJqdkYzZVhqMzdkMmpmTDFhb2Y4MXU4?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PqArKOyyTAQLRRM/Y8VX05IhLpj426BaoWil5dwAMq0a7HUTNDZ8q4Qhb+LFos9x8Jq2vwWZdyHHX6kvNvBafHAycjMNnnIuJ/NCXH9sJPi+dVTPUYzYBEtOCdusj8+D8uu88ixrwhRkTIVjL0qVpQVAq6dr9iK5Q7FTkk/a2r2DEs0ZC+micoinP4mVklLqYGtz5GeKkczN1Sum+MRGuWBUQwrT4+EZ6m3DYYBVgReUyGM5g8oWGpDc1JyWzOKogjRxSlScs+uRHIvojd96KZLrJlX+m/Ygbya1P88m4HNy+No/s11hhA7PHhUVDrI/fYOnzpGaYl17qXvYqkCuFoaNX8HEu3yRLYN2rje/DE5zeDJcyJrY6La6/u4PAJwoAzcY/apXZXuL6jRy1lKYSRLpQw311e+qnezmnUaUGeNgvSt62BMGrB5fflA3khbSmpozASs5DXnfakCghqSyM/s4g5YYP1wpj+aI+dQIqk5VX1SiVLDRwIm38hipjJ85F0bEkE2iScSpPHB2+35APELulj1vVXWAu3vz3ps6Gt2RAYbVdFOk8AWEFhUloaQvN/V9hVkGgjnbc0U17xaD7JmyTjjH6Pj8Au451EAShyf4HBLpDDr2FUTpmOnXiTdjChgyIgJOTBQhvNMzLWgZZEfzMfv2Rei2ud+NIWdAO9SWQF8mHfH86d4wy9LJJ9r8eLXwAVvx5IviorheyRIT/2VByMkT4CTKF4gWtd5leJwRmDKZsxJtvIu5RNGWUaYJ9B4JLfTzDCIs9qVZdEpgmRWqfbkaJtx/0L/ugkgkdNF1QTVYDH44sn9EF/n8I3ui
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b953e6f1-2bf2-4565-a7e3-08db60ed657b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:08:13.2543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bzh3dvKpfqBRV28uSiCdg5M86l0LuKIMER0lrnIETSOZJNknTTK0GMdn0UjxB0333GIGu81DSlkN2iRzYDF4Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7359

On Tue, May 30, 2023 at 10:48:02AM +0200, Jan Beulich wrote:
> On 29.05.2023 10:39, Roger Pau Monné wrote:
> > On Fri, May 26, 2023 at 09:35:04AM +0200, Jan Beulich wrote:
> >> There's no point consuming two port-I/O slots. Even less so considering
> >> that some real hardware permits both ports to be accessed in one go,
> >> emulating of which requires there to be only a single instance.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/hvm/vpic.c
> >> +++ b/xen/arch/x86/hvm/vpic.c
> >> @@ -377,25 +377,34 @@ static int cf_check vpic_intercept_elcr_
> >>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> >>  {
> >>      struct hvm_hw_vpic *vpic;
> >> -    uint32_t data;
> >> +    unsigned int data, shift = 0;
> >>  
> >> -    BUG_ON(bytes != 1);
> >> +    BUG_ON(bytes > 2 - (port & 1));
> >>  
> >>      vpic = &current->domain->arch.hvm.vpic[port & 1];
> >>  
> >> -    if ( dir == IOREQ_WRITE )
> >> -    {
> >> -        /* Some IRs are always edge trig. Slave IR is always level trig. */
> >> -        data = *val & vpic_elcr_mask(vpic);
> >> -        if ( vpic->is_master )
> >> -            data |= 1 << 2;
> >> -        vpic->elcr = data;
> >> -    }
> >> -    else
> >> -    {
> >> -        /* Reader should not see hardcoded level-triggered slave IR. */
> >> -        *val = vpic->elcr & vpic_elcr_mask(vpic);
> >> -    }
> >> +    do {
> >> +        if ( dir == IOREQ_WRITE )
> >> +        {
> >> +            /* Some IRs are always edge trig. Slave IR is always level trig. */
> >> +            data = (*val >> shift) & vpic_elcr_mask(vpic);
> >> +            if ( vpic->is_master )
> >> +                data |= 1 << 2;
> > 
> > Not that you added this, but I'm confused.  The spec I'm reading
> > explicitly states that bits 0:2 are reserved and must be 0.
> > 
> > Is this some quirk of the specific chipset we aim to emulate?
> 
> I don't think so. Note that upon reads the bit is masked out again.
> Adding back further context, there's even a comment to this effect:
> 
> +        else
> +        {
> +            /* Reader should not see hardcoded level-triggered slave IR. */
> +            data = vpic->elcr & vpic_elcr_mask(vpic);
> 
> The setting of the bit is solely for internal handling purposes,
> aiui.

Oh, I see, I should have paid more attention to the "Slave IR is
always level trig.", might have been helpful if this was noted as an
internal implementation detail.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

