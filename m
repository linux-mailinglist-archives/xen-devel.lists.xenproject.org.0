Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76162694E35
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 18:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494794.764953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRckw-00068C-Qo; Mon, 13 Feb 2023 17:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494794.764953; Mon, 13 Feb 2023 17:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRckw-000656-Nh; Mon, 13 Feb 2023 17:36:46 +0000
Received: by outflank-mailman (input) for mailman id 494794;
 Mon, 13 Feb 2023 17:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rhjs=6J=citrix.com=prvs=401394e30=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pRcku-000650-VN
 for xen-devel@lists.xen.org; Mon, 13 Feb 2023 17:36:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa24421e-abc4-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 18:36:43 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Feb 2023 12:36:30 -0500
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by BL1PR03MB6006.namprd03.prod.outlook.com (2603:10b6:208:313::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.20; Mon, 13 Feb
 2023 17:36:27 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99%6]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 17:36:27 +0000
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
X-Inumbo-ID: fa24421e-abc4-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676309803;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AyQStQMTYZQYv61QHCzNSv+Fhs5sThs+hE8iRJ2zWgI=;
  b=YvslsW06jlZfTvc+KOqBrMKyQ7R8TFpxjaxJf9+Gr95Sxdw0ijEbQcnY
   SrQLxmZhuTyq4FilkYNLdSr+gVXYyZJR7QokhI4fWMyDMrvtxkABMb0L0
   ki3bFp+VaQQH8zmUcOJxTCWk/h2ljiSBsTFX0tDLfgWFzN/iT5LfUuKjn
   U=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 96245372
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HqOA0aORkpYkiAnvrR2MlsFynXyQoLVcMsEvi/4bfWQNrUorgmNTn
 zZJCjqOOvaJZmD2e4snPI6x9kNX75bVmtZjSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5wdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rhVI31Wz
 NMZEz4AVTGqu9+kg/G9WMA506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeIpOBy+OGF3N79YNuRXoNRl0mVv
 H3P+2DRCRAGLt2PjzGC9xpAg8eew3mnBdlNTtVU8NZprHyp9mg2FiFJFmWLoOWBzVbma/h2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmOzazO6grfGWkATRZGctUtsMJwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60fy8PIgc/iTQsSAIE55zpptE1hxeWFNJ7Svfq1ZvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:jaGOS6wdvhRt9+YvBjlzKrPxVeskLtp133Aq2lEZdPWaSL3+qy
 nIpoVl6faQslkssR4b6Km90Ze7MDzhHPJOkOws1PKZLXPbUIXBFvAo0WPNqweQVhEW3NQtnJ
 uJSsBFeZfN5bITt7e33ODAKadp/DDlytHVuQ6h9QYUcegwUdAX0+4RMG/yeScaKHglOXcgLu
 vj2iMEnUvcRZ05VLX0OpBvZZmkmzSkruODXfbGbyRXnDVmTgnI1Fc5KXalN9slMw+nuY1Sil
 QsHGTCl9KeWjiAu3zh/l6W1Y1fnO3owMZCAsvksLlhFhzczjywbIBWULWY1QpF092H2RIRid
 HJlQwtJsJp9hrqDxOIiCqo4RDp1AA14Xn4xTaj8AveiP28fiszD/xaj4RDfi3Y7FdIhqAM7J
 52
X-IronPort-AV: E=Sophos;i="5.97,294,1669093200"; 
   d="scan'208";a="96245372"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEW5C2R+Ry/p1kf9lf0a5vypWxGPB2AvmEqexkUiKlLqiFtSwdxdHsg8krLjJPVhc+2n7PaJ9Uu9oLo3Qu/f838xUO3SGLiuTdqMNxPa9XdlKyQaR6ZpVOQrc/un62zTlN5j5Os+djRl/z6/x3CjlqFVEDjSXFmxm9E80PviVIaQS7UN7TEpn2UBrJAfukjSx+ABH70TEad1xs6PzFbcqFQr7RdXkoIMMc7g2RaGAO36A76xI31mjgdHdtHNwGbelDmn1kyaLPsqjfZNeaPIDvDkAZkDPu3fzkvuWNQpVvEjbBdDOKPHb4H2mx7CQk68Crj420S7gOHBRZkcyR+HwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyQStQMTYZQYv61QHCzNSv+Fhs5sThs+hE8iRJ2zWgI=;
 b=gFlg2BlJkGQfLWPaKYqmKP5C/kFr8Z84yBvlZ3Byhx2p0ydr0IRiechnxEakdaaxG22uhbO8S2U9dz2tQn8e2+MwPexfRuDEW5vIURQNrThBbA1X/wDIxsrh2/kjpzwWE18Ta4brsCtVan9M7VyslWbYqQZuXoNIj/n0lB/K5nnJDH9WvSVAI6Xi92UoR/A1GoFxE14z5xR1TEJE+YWV9W0EQVF92sLaF74dfEaFmBH+NyciL23bkz2TO532xaptahn9LXnv3yTcWblWy33Dl3ONh+sLxzXRls5zQwr7CMRtOREQ3WeINQ17EzCpmB1iefEs99ql5YmNZAPjNacqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyQStQMTYZQYv61QHCzNSv+Fhs5sThs+hE8iRJ2zWgI=;
 b=AOE9AjesBr2l7sZMTDkmInFX4bkTIOxZDL0NUw2gz+S0OzWXYk3yiuUxFzKQns8p1S+G01LER7jeNQemReuqLWNx8CkWj8KDer8qEquutsJqjf3+pnCxOXdjt7kxDTMaoyCUvRse/HVjCMVP8Z/GOXYP6bwPOHoyfhSMy+Ye3NY=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: [PATCH] create-diff-object: Handle missing secsym for debug
 sections
Thread-Topic: [PATCH] create-diff-object: Handle missing secsym for debug
 sections
Thread-Index: AQHZO+fsA+Vod/BpQUimyPUcdwpK1K7GTlEAgAbcoZ4=
Date: Mon, 13 Feb 2023 17:36:26 +0000
Message-ID:
 <DM6PR03MB5372211C9613D7562A9A31D3F0DD9@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230208180457.800671-1-ross.lagerwall@citrix.com>
 <fefaa0aa-6c94-021b-f609-95be9e7e1f7a@suse.com>
In-Reply-To: <fefaa0aa-6c94-021b-f609-95be9e7e1f7a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|BL1PR03MB6006:EE_
x-ms-office365-filtering-correlation-id: 53fcb2ae-0459-4836-bb02-08db0de8d586
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /hm5uAT2YeWu3NDUrJSBGOZASZt9kuh3uBXKs4gAAwBiMtwqeORtLVdROUp1RSQiX9WlmL/t+nfXDL86fAQaV/wJ+HeI31DvxF4JM6aoLX/zTNZxM7tCEVY5jD9Vum5anFSxwUsrFdTjzw+GCA2ptNzF9HSFhQI6xDdIOzPQL68fYHbWeU5yQ/uIGY0CIJz4TJe3h6lXNvpP4eEWBuwXpJ/O9otwhjOoElw2GBggVSEAVk+42KWuX9qBARCtGiiuz4464AH4snwDQolLtX1bRuB6+nAC0JkI7CZ/U5aPSziGUbATwuiSHBpTFdBrayisJEAzr2uYiZpuiXDAukh2QX7YAAembJc8c3LshrtnrgGnbmUcruQLk6ibSieZki8bnnX1c5BjyS//dubA5vFPOCkFCARvyfo5/lrtvugf45ojdWmLmqC6+m1Q4LZu6mEQ/IowjnQp06Hye1pDSiCJgM1bEAqOvRc8p6K11u9XvtfjBIaMOiYcwBsScExPcbS3SSsl2MLRCFCYNj7ftC5J8RzbP7Xtlq4Egv2GuB8FcXJlboTsWfy730AXQZwyghYaJo8gLJVgoQBriDQu7wqBfx1DlS2q0llg8bl8hCgbkGDmwrWbRsFfab4Tk0UAmyALfPzSc9n5Iq1fS86Z8t41xx41g77b3aOj3UP3aJ0ed4d38BZ3wJ0oEmkPrLo+TBjRmqi1zCmr8E5aEuz3yUr/2w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(44832011)(54906003)(122000001)(82960400001)(86362001)(38100700002)(2906002)(38070700005)(33656002)(66556008)(8676002)(4326008)(91956017)(52536014)(64756008)(6916009)(66946007)(316002)(41300700001)(66446008)(76116006)(66476007)(7696005)(55016003)(5660300002)(4744005)(186003)(9686003)(26005)(478600001)(71200400001)(8936002)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qp9fKNw4BNlCdhtOG1ok9AOeOEtwXWbzlvc2WOO+A8KoW19d3xHrTvgmDv?=
 =?iso-8859-1?Q?175ArDxyeqxa+cyhYigUXynytbh4wXgGdbixHd0qMbInOfkcjVdd8S2KWe?=
 =?iso-8859-1?Q?Fr1HqVqFGjWWtchLUj6gbztuwJS187QwVZUZDnD6zCW70aDfYD9VxEL0d8?=
 =?iso-8859-1?Q?PghAJbJTEjRe3bsT+cjIhInoxFq+cSxMsvbfNB+LzNZNQuPmEHTN4CtG/L?=
 =?iso-8859-1?Q?coKy7CmLbBzNWfEEot+QTMxQ39k1lroC0bCrZyPt+Gqu1pYfUULVBIHGWa?=
 =?iso-8859-1?Q?nF9LRRKa5uV+5rp5XSBWKU3W7AIMwo3D8bOED8QnFvl3K2mrY8GYD2SNk1?=
 =?iso-8859-1?Q?ppGrcCzSEMrn7WcckbIfXJycKcf3KwHQqu5FJLEM/613/0xC3oGmxOShS2?=
 =?iso-8859-1?Q?MObed7ucbMbm9y3EPBOv0HjDQj1f3kZ51YZJzgwleCsWugBGmUi9HNBBDy?=
 =?iso-8859-1?Q?44CSZG8/olPDK205pp8+SoeXYTjyEm3T3F+xsHWZ0QBUIfwYWyStqUwDHc?=
 =?iso-8859-1?Q?SBGfI3mwPQ8t+pyl3FEXhNqV+MB8fvDRv+8GogKLqRYPFos+qPoL1iDze5?=
 =?iso-8859-1?Q?GB1dgSw2IeWbZdI5AkPcaXx7BEG03hj3BrIEY57yWlWSpPiJy+rpe/ih4h?=
 =?iso-8859-1?Q?2PJ29UfzaPQx29nUAvq7djBh+rpgeS+fMSV7iyk6Hogvz8dTiBiEhtK93V?=
 =?iso-8859-1?Q?scvo+CoF3vjnnzqL2QaNGmk3q/mSsKGo7uVhgFL4dwOROqPMIweDzXnCik?=
 =?iso-8859-1?Q?CjKzcv/3fC0lFQVBy5/40ftqDySo3laWNm1EJDSvMjYDac4Gb4JhzCXZ9+?=
 =?iso-8859-1?Q?fO0MS8wcjxzlJsFXYbzwmmdvklPMrsdMK3hGWELGKso2xznMhHvfFsw4tx?=
 =?iso-8859-1?Q?c++eE0X2tPQIo2kGFweMUuuYB7wDwdb0ErTXrzdW6R+NTWXAl2NT8sFcsM?=
 =?iso-8859-1?Q?jeLhjtcZGp1wkx1NYxY9e9cYFWsboQwG8CodnKz5pLLFhz9Vpfyol315mJ?=
 =?iso-8859-1?Q?dm2XxcNCoXUHOzCo7/ljUinzrUYsrjMPU26KTop0s6Mp/bgBJfPw1a2xC/?=
 =?iso-8859-1?Q?pEjR4JBT7MyuAAPKxZr+oYhzEZ43uFscLK30AaohyTsW9ZDv+FBoBfnI8v?=
 =?iso-8859-1?Q?E4zsT+jDk1mvtM/lF/jFXViNZVwaqNLEAIoo/LMmeMG7Ej9W3kv7TVKJDv?=
 =?iso-8859-1?Q?XcpahbPICMrDQ6DUstFxR+8BaMb4qsFYzx8MJ2AAVt7W79jlzWkkWsT5Lm?=
 =?iso-8859-1?Q?G7mADw+49lMCX+RH2Hk7l3kI9ROoemfN3IXRS3WYokZMvbv9fPWF0pK0K4?=
 =?iso-8859-1?Q?klMu88578bnRjkeoFkUSKdPgCxhW0Lydxy57JEj+WXcUAIbzPiaZfwNtr5?=
 =?iso-8859-1?Q?oY+G30Q9pM5+idyvAkAiXt4FIIcAbZwKJhcyUhJZD9CrwRHQufPlWbHpd9?=
 =?iso-8859-1?Q?CALJNyleXIikCG1JoDWNLKHwkrkz7pcWEQsAHLTtSgQ1+DQR5HcYqQ81Ns?=
 =?iso-8859-1?Q?cuSZwbr4LmLtMU/ldBkvb4nYTzUEeJfO90XqJugkoWR1GDSBloW6eRvgQK?=
 =?iso-8859-1?Q?uHqR7LNz+5lKpHSXxLn3SeXGZDJk7SljvC5G9NrLvixQ5bF0NlsjzvHUBK?=
 =?iso-8859-1?Q?x8Tx26I+oQgWfq4MAGHrWI2dJcSP5B5gct?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hWxSnyf77URvht0oc7jZkaEonM4oX1D/8B08a7w1RVRQlBew2kM9sGQbuSTfBGbwK7riOxN4JZe6jr0Caqms0N9hb/JBVNFNGab+REgzG5CQH9WFiVr4cLp0jBBOXvYPidpwwlfR/RquyTI0sw7mpm17RaKLuc8FMtmyXIEjrQcLwadVQiUD9rWGVTNQEwc5cFRlJ3mP83pnOpaS9kNHgDh9xWhGtmnfzr6yS+gZAVqRFSzz/+XpMDmVVq/z8+XtGIJr4PRRPAH0U8rJV3f6kdE04JZGipdRMW0XPqk4Z7enZ1xkm1uS3byCz2wT7y4FdTxwVkOU8H5c9CfZBAdJkaZa1n1iHbp7TIcsoK3UYi7QV0vG4WKZbJrB1kTCTCc5DehrEEcpt8jZ8iY0Eq3r4/PPoUpNB3TCAK+kZlUQ5U2sF1nHwObUB58eUDY/jhJ1wbfTfSU051scMSZYiE9PbAy7ACcMqiatPAKzDpzeAsHZ70TGLA1gCj5B/DJxo1NW4GZHWkKbM+0SiAYnfR9ojSzRLs0Y4KutOF3oNK9G25UAXzGa71ZynBp9fIPp2Us2L5DiBhkIvm9e4oTVCmuhBAhdx7VHX0WXfXBMV5dgUBFzwOqoKyoDRk6q9nPSxz5sfkq8Ou0js8WLvdRgmI/aMO960Y5oyrler3L6lQv1btWPeqLtM8bZbaHSwlwozdCzhWjucPUXbObkgB2wHVEYm/EEG0NlnB2JD/zMpVSrGl/Hb5yxX+N1bMpGBMUVwTY3zuKbCXNBSGqTiOINiz54nI/q4qwOKfnrEBfZQwMT69WFs4tvSeS+lRM0TL+jO/oQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fcb2ae-0459-4836-bb02-08db0de8d586
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 17:36:26.8382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xw45j+PPiOJ0b7Iog1fTlhf6eDcvU5jyFrtCLZ/kK/Y8zNOwyV4Fwjv5Na2U3eLdTYe20lu/OlY9r2Ow0my0mWfNEBlagVoVA22r23mYnrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6006

> From: Jan Beulich <jbeulich@suse.com>=0A=
> Sent: Thursday, February 9, 2023 8:46 AM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Andrew Cooper <Andrew=
.Cooper3@citrix.com>; Sergey Dyasli <sergey.dyasli@citrix.com>; xen-devel@l=
ists.xen.org <xen-devel@lists.xen.org>=0A=
> Subject: Re: [PATCH] create-diff-object: Handle missing secsym for debug =
sections =0A=
> =A0=0A=
> On 08.02.2023 19:04, Ross Lagerwall wrote:=0A=
> > Certain debug sections like ".debug_aranges" when built with GCC 11.2.1=
=0A=
> > are missing section symbols (presumably because they're not needed).=0A=
> =0A=
> Is it really gcc (not gas) which controls whether section symbols are emi=
tted=0A=
> for a particular section?=0A=
=0A=
You're right. I tested it and it is down to the gas version (2.36.1 in this=
=0A=
case). I'll fix that before pushing it.=0A=
=0A=
Ross=

