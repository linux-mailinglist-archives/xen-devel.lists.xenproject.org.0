Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A253B613D78
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 19:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433137.686040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opZeq-0008NR-2d; Mon, 31 Oct 2022 18:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433137.686040; Mon, 31 Oct 2022 18:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opZep-0008Kh-Vv; Mon, 31 Oct 2022 18:37:11 +0000
Received: by outflank-mailman (input) for mailman id 433137;
 Mon, 31 Oct 2022 18:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7LD8=3A=citrix.com=prvs=2969372d8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1opZeo-0008Kb-Kj
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 18:37:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0505c1c0-594b-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 19:37:08 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Oct 2022 14:37:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5701.namprd03.prod.outlook.com (2603:10b6:510:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 18:37:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 18:37:02 +0000
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
X-Inumbo-ID: 0505c1c0-594b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667241427;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rOHxKu4DsSSnf3ymWmgk+YRyj847/cxN+YG1jFezWzM=;
  b=NPQ3DiiWr+hrN5oz2k+pR5mSPX43y1L7UtH0vksGcUdRi5SPptcSjCk9
   vK+vdeOUoQVAMOucjxwkDC4f0p73q0coDPtaeDKJgdunYmJKtnzbAa+W0
   heq0TTJQASlMs8eouyIMXATBXsHiU9S/g5HevoJB/4H7jVr1tsHgwimp+
   0=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 83882607
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lnbtwq0Nuh2rPg3zUPbD5c1wkn2cJEfYwER7XKvMYLTBsI5bpzMCy
 jcfDTiBbP6JYDD9edwgb4ni/R5XvJSHnNVlSAE/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRlPKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDFBfq
 NZDbxQ0flPSi9O0yYv8EdtjmZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1EZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOgCNJISuXnnhJsqEKL3UM4OCQVaVi6qOu/h1WyQ+t9K
 mVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1876VqXa5PnETJGpbPCscF1Javp/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:IHpjFai2azTs5ATdu1mOSTXdnXBQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfZsRKEkjTRo+a07bVTHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wf9igF3ekJhlTVfsuaDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.95,228,1661832000"; 
   d="scan'208";a="83882607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z40mwwSGFI/XP6xx6ruJ53zWtyhZc08cfWZw2BFqjLnytb6armDoVE0Uq680ncdU9Ul24lXAslYzdS8R0YKJ94CfgArXrHjv2/YuUazNM/Bi0+5XUwuZlHFobEKAII5yFzn0t8IPcXC9+qVKxD1TeLfW9smtkS/57BjVi0qRA3Td3Gc9r2pdZEhknZGIHDBP9p4fHGjm60Z8nJmNVZnsH8ngCAHgWWCzGyhOCcZb7ub8iQTISnGQqOju2Jmgd1tERCoRznKDgNEBTDalBm8nUInmQidDlxpfxG67y3x8edMc7vO6hTY+xzUy64qA43PEOG/4VpPrNmUfHR+zCRvOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOHxKu4DsSSnf3ymWmgk+YRyj847/cxN+YG1jFezWzM=;
 b=B9krWQ5j0ua+uOfOJP86DGL6gfw9TM4L7llJCMAY3SrQ+VoqYkO4dbFJ3PpWh1/3CGJji5i/G31aVLE5fw84k2H2yqa1h6o0QdmL8AYytBv/Ny62zo5nVriZdz/d7zaCXo5IPr2/gT2NhcE95Vb9mdAXIJTyux9F+IgfkZpLwlKju9/jPkxD42UstGcINjQo4battboJ9TGcAWkM9a5m86eyi6sLr7C+l9cmSt75Xo1Fmno2IZwBE/LZpnMNaQvQNZ2kP/+yCld13q0ynBVe+VbLKikANPhDgn+yPDMlxoevIJ/r6ocCBavhAtehPveir+3EYBXs9XcjaBOpsoT5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOHxKu4DsSSnf3ymWmgk+YRyj847/cxN+YG1jFezWzM=;
 b=ilnpgiStBSxfzRpNo7auBu2YXsWwiLjha5glXfMAyMnwgCgXl8cKrarg7LkFZwNydRObjzJyxWVn/WE8Act5cpeiwHMOgjs4V8fzfyvupFwN5YAirf8bLMuZYKILRwClsBypGXUZoarS4wS7WKJOMefdIZiUKygeCXEzscLai6I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: x86/HVM: Linux'es apic_pending_intr_clear() warns about stale IRR
Thread-Topic: x86/HVM: Linux'es apic_pending_intr_clear() warns about stale
 IRR
Thread-Index: AQHY7UFE3ShgMplOBEqVLVIh9xv/964o1QWA
Date: Mon, 31 Oct 2022 18:37:01 +0000
Message-ID: <ee91d4d2-e889-355b-4d5a-b40f3dabf81f@citrix.com>
References: <7d9022ce-4a46-e0cb-67c3-4124e1c0d2db@suse.com>
In-Reply-To: <7d9022ce-4a46-e0cb-67c3-4124e1c0d2db@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5701:EE_
x-ms-office365-filtering-correlation-id: a6fca244-2bf8-413b-1d3a-08dabb6ee6dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Pf8TeWFPEaTHGdqPfxb7s004U0negzyfa6RM7dlEJ0NrRWeQTkVCnDzN/H0Xc4KQJF1hy5fh4n7LaBXUazpc1ETBwucGAV8dsbmh7OzQBfQt4T7zO4BCA8QLu9QDcGxwVVDaBhHuKGR9OnMgm/hHyBepnMizZ9y9hHqFpMrnbBiN/LBKgBnqLiT5bHLEiiyl4s0cRZLnacGsRMnDa9vIslv30tFRh04Zu7gkwM84B8em14k0T6U0qaaosFs5h4ym0lU5QDiISdvBwu+cTA1Tf/8ddbksgxvq3aiwTLWuBri5mUNzAvy7dR5vOREZ96EfTu1sUBpdw1Jca8d5kxSOFL4QgSOI5Bc1beQCAN0lF5GnIRahTeSZfnhy7txGtNfTMhINZcz3jw4HOg8t3KdLxjNkSgyiFYgwYTFEZZJkkdEuL+nX7O6ifbfyl4HNfgUFhGB4H19Bt2hFe37ufPd0WtJxw1FOfB3QRJQHxozyddkMIsDcs1F4jzPhZdXQYtgNZlQQ1wZiiyhGUyJdQMWSm2gombsgggWfvoZK+YJNdq3pSFCLdzxLbfkqQdytgTso6amSIP/dEX5IKOAIICjfP1x+Zuzngj0P+6hkHhxdJLq7TuCe079mfi9TRAUfYUrkM6nuAw6Hl4kqlcEe3LURsmUmXeeMiASh9aSnJH0UvzlpLchbJqZJRyZBkxqDwWOxTyd8CZSy8b5YK+MK/uY61LWgOnBTtTjRMfEdJe/D9Fuqzd50x86phI4QHJIwDu3jdfw0Sc7zM4cOCChUQZnoVCZ55vbmoDaHH4abopX2LWgajd3PX4tuKDcqvzF8KA6IyFFBd3pWc5N5Uusqg8izKQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(31686004)(478600001)(71200400001)(38070700005)(6486002)(110136005)(6506007)(316002)(82960400001)(4326008)(107886003)(83380400001)(64756008)(76116006)(38100700002)(66946007)(91956017)(66446008)(66476007)(66556008)(8676002)(8936002)(86362001)(53546011)(122000001)(36756003)(41300700001)(5660300002)(6512007)(2906002)(31696002)(26005)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEVMazRCZkErUzd5cGJlN2E2dHIyS1RYM0FuQ09HbEdxdC8rZElwNytrUlFO?=
 =?utf-8?B?OXZoRXFkdGFpQ0tlekZQRUVTTTZtTEVGWTh5Q2g2Mnk3VVBKUGZ2ZHEzOGpx?=
 =?utf-8?B?SnhLS01MKzVFUTFzNjZqTDQ0MW9WMDNFV3JKWjZybWsxcTl4SVlJZjM3RmVG?=
 =?utf-8?B?cTZmc2NzN0FTMTR6b0JiZGxuM1VpNndHb21yNFlXY0lyYlFxUGxZT1hpNGZx?=
 =?utf-8?B?QTl5cE9TM25mSEN4T0l5YVRJcVVNL0YrM0NNQzNZbSt4YlVjTTMrYXJYTzEr?=
 =?utf-8?B?RXBLWEVlWHBPaFhKZCtyU0YzMEg5ckVJU2lWUHlrR0U5NllOK2pxdEZ5czl2?=
 =?utf-8?B?WXNBZUVUMmxxNVJyOW9uWWQxQnlJeEVxV2hSSi8wZUVCc0xocjVkSVNGeXhv?=
 =?utf-8?B?T0J0eURGMUVRWW4rQ09meUVmZW1lUlZoSjRvek4rWDRGUWhrV2xTUU01b2xo?=
 =?utf-8?B?YU4xMC9GTFVnemVKWVRacHJ0VWlqUVI5LytjV0hNeEZrZ3VaamVOSDZGQ2xh?=
 =?utf-8?B?aTQzZkdFRnJRNlB3M3Z0Vytadm81ZnpNdUVqWTVQSU5zRzdoUU95SkNQNWxi?=
 =?utf-8?B?YUxWQ3p0a245NmxCSC8ya09MTHNhU0R5UklwMmRqTFA4NFo0M2l5aUoyVVNx?=
 =?utf-8?B?Yi8zdWZZMzdFMWxGeUk2bzhBR2tJcFM1bHJTU1Y1MmxKR0tTWnl0V0lQUWNv?=
 =?utf-8?B?aS9ncTQ4eVNMTXc2akIzaldSM1B0V0hxQ2VtbCt5clFRbTdiWFV3TElsTFZJ?=
 =?utf-8?B?dTdqNThZakhVQjJiQzBETXFIYWxaRnVMWkFncWZXdnRJTURKdzFGQzQzc05S?=
 =?utf-8?B?Q01vcTBWVCs0bGs4MTJlcTVtODh1QSttZUwwc0kwVVFFalJqT3Eyc29EREc3?=
 =?utf-8?B?VG5RVThYNnpiV0tQVEp2a09ENU16NEI3U2syd0FteHJGcjZCZnJPNENsVS9E?=
 =?utf-8?B?SFdxdGpiUHRvbmQxTWdNTXVuYUw4Q1RuRW1XWk1od092QVpxNEY3alNSYUh0?=
 =?utf-8?B?elVoRFRWOWVISkZRSmQ0YmtEZVp6SkExbDV5MW1OLzQxOFNxMUQzcHRaT3hP?=
 =?utf-8?B?aXhKYWNoalJkTVVvU1MxZldtdUdQaUpINDJVbGlkWTc3bW1BdlhYT1h6VEU0?=
 =?utf-8?B?eERjT2Zwdnl1alhSNnV6djRLMkplay82MlRtV2sxM2F3bjF2NGlUeWFScHN0?=
 =?utf-8?B?THBKQlZWZW1iUVpoaVVpdndldVFUZTdDczUwbmg2d2VFU1pqbC9wZlFaRGNY?=
 =?utf-8?B?czAzbk9XRC9MK3hLMGpJVVVwbGt4V2QyZVo0Nzc3ZE9mR1hmRElBU05jLzJw?=
 =?utf-8?B?cGNZWFVNVTcvbzBkWUxVdzRrZGJCWUxiSXMwdVgxZS9ta3R1S0Fla0NQVi9C?=
 =?utf-8?B?REx6SEhCMUtaVFBBbW01ejQzemtXK3hWVTQwOTNraWFoVnRLVHBlVjl1dTlJ?=
 =?utf-8?B?MThxV3BBVzcrZnRicGhXY0d1dnZjYXFBSkl3WlZGd2xZYTFobC9Vc3JTUlBR?=
 =?utf-8?B?YkFEVEE4ZEtwUHptbHIrM3JKNjMvR1dFMXBVamNZdVVKdmloWmR1YXlGaFJq?=
 =?utf-8?B?bGdJN3FqdVgrYW5jdjI4NkdqbkMxYW15b3ZUZ2pmd0Z6OHlCTmxobFJrUjVG?=
 =?utf-8?B?dnhXb3A1NUkrdng1UXh5ZktFVGFpbUsvSnhUY1ZIdEZBM1RKbnRQRE5wZ3p2?=
 =?utf-8?B?WUJlV0p1L3NZNU5TYUJISDFxWDdQZVovaFFOYmVvN0NhRE9CZ1RSQjlVRVd2?=
 =?utf-8?B?aGlFb2NrNE91S0hqK0Z4UkhoZE5kd2tOZEpvQklvWjZKbG5td282VlJOUGVE?=
 =?utf-8?B?S0Vvbnpsc3AybXJiN3JwRVBWQUY4MGpLM1VNRG12dEMzODFBN2Y2T0ZaL2RX?=
 =?utf-8?B?MkhBbDJCMUUrQ1NqaWFJUG8zcUVGanBqYkU3ZTFmR1VLK21SZ2JiMkoweU5y?=
 =?utf-8?B?dVJ4VTB2V0kvWE1jWUJVM2p3V3pjLys2WmdGanJMRXYxUW9QS1IwVjlJYzBh?=
 =?utf-8?B?Mjhyd1VqZVZkNllySmx0WlpjcnFqcTFxU1ppU1JpYXF4UTQ0T21XWTRvYUNG?=
 =?utf-8?B?WWhZMk14RFMvZFRwNUxVUHRZbTFTazIvUGFHY09GQ2E5VXBRREtleXdTcDFr?=
 =?utf-8?Q?xAqmN/yDmzHprCLufBzyZZq2l?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3DDDBFFB2D6C641AC678BBFA93861DF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fca244-2bf8-413b-1d3a-08dabb6ee6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 18:37:02.0172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pB5n5MKgW88BuN8iJ57Aw3Ogo8SchRkpO4Uw2aE3S5rljmemtbXGtdgLJWLavIq6c9Ht0+VuLtrhQvUFSXZDubwvKYilvMw8kP22WT8/EJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5701

T24gMzEvMTAvMjAyMiAxNTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEhlbGxvLA0KPg0KPiBx
dWl0ZSBsaWtlbHkgdGhpcyBpc24ndCBuZXcsIGJ1dCBJJ3ZlIGVuZGVkIHVwIG5vdGljaW5nIGl0
IG9ubHkgcmVjZW50bHk6DQo+IE9uIGFuIG9sZGlzaCBzeXN0ZW0gd2hlcmUgSSBoYW5kIGEgSFZN
IGd1ZXN0IGFuIFNSLUlPViBOSUMgKG5vdCBzdXJlIHlldA0KPiB3aGV0aGVyIHRoYXQgYWN0dWFs
bHkgbWF0dGVycykgYWxsIEFQcyBoYXZlIHRoYXQgd2FybmluZyBpc3N1ZWQsIHdpdGggYWxsDQo+
IHJlcG9ydGVkIHZhbHVlcyB6ZXJvIGV4Y2VwdCBmb3IgdGhlIHZlcnkgZmlyc3QgSVJSIG9uZSAt
IHRoYXQncyAwMDA4MDAwMC4NCj4gV2hpY2ggaXMgc3VzcGljaW91cyBieSBpdHNlbGYsIGZvciBu
YW1pbmcgdmVjdG9yIDB4MTMsIGkuZS4gYmVsb3cgMHgyMA0KPiBhbmQgaGVuY2Ugd2l0aGluIENQ
VSBleGNlcHRpb24gcmFuZ2UuDQoNClRvIGJlIGNsZWFyLCB0aGVzZSBhcmUgdGhlIFZNJ3MgQVBz
ID8NCg0KPiBGb3Igb25lIEkgd29uZGVyIGFib3V0IHRoZWlyIGxvZ2ljOiBUaGUgZnVuY3Rpb24g
aXMgY2FsbGVkIGFmdGVyIHNldHRpbmcNCj4gVFBSIHRvIDB4MTAsIHdoaWNoIHByZXZlbnRzIHRo
ZSBoYW5kbGluZyBvZiB2ZWN0b3JzIGJlbG93IDB4MjAgKGFuZCBpbg0KPiBwYXJ0aWN1bGFyIHRo
ZWlyIHByb3BhZ2F0aW9uIGZyb20gSVNSIHRvIElSUiwgaWYgbXkgdW5kZXJzdGFuZGluZyBvZiB0
aGUNCj4gcHJvY2VzcyBpcyByaWdodCBhbmQgdGhlIGNvbnZvbHV0ZWQgYW5kIGltbyBwYXJ0bHkg
aW5jb21wbGV0ZSBTRE0NCj4gZGVzY3JpcHRpb24gaGFzbid0IGNvbmZ1c2VkIG1lKS4gUGx1cyB0
aGUgZnVuY3Rpb24gcnVucyB3aGVuIElSUXMgYXJlDQo+IHN0aWxsIG9mZiwgd2hpY2ggaXMgYW5v
dGhlciByZWFzb24gd2h5IG5vdGhpbmcgd291bGQgZXZlciBwcm9wYWdhdGUgZnJvbQ0KPiBJUlIg
dG8gSVNSIHdoaWxlIHRoZSBmdW5jdGlvbiBwZXJmb3JtcyBpdCB3b3JrLiBZZXQgYSBjb21tZW50
IHRoZXJlIHNheXMNCj4NCj4gCS8qDQo+IAkgKiBJZiB0aGUgSVNSIG1hcCBpcyBub3QgZW1wdHku
IEFDSyB0aGUgQVBJQyBhbmQgcnVuIGFub3RoZXIgcm91bmQNCj4gCSAqIHRvIHZlcmlmeSB3aGV0
aGVyIGEgcGVuZGluZyBJUlIgaGFzIGJlZW4gdW5ibG9ja2VkIGFuZCB0dXJuZWQNCj4gCSAqIGlu
dG8gYSBJU1IuDQo+IAkgKi8NCj4NCj4gc3VnZ2VzdGluZyBJUlIgYml0cyBjb3VsZCAicHJvbW90
ZSIgdG8gSVNSIG9uZXMuIEFuZCB0aGlzLCB0byBtZSwgaXMgdGhlDQo+IG9ubHkganVzdGlmaWNh
dGlvbiBmb3Igd2FybmluZyBhYm91dCBsZWZ0b3ZlciBJUlIgYml0cyAod2hlcmVhcyBJDQo+IGNl
cnRhaW5seSBhZ3JlZSB0aGF0IHRoZSBsb2dpYyBzaG91bGQgcmVzdWx0IGluIGFsbCBjbGVhciBJ
U1IgYml0cywgYW5kDQo+IGhlbmNlIHdhcm5pbmcgd2hlbiBvbmUgaXMgc3RpbGwgc2V0IGlzIGFw
cHJvcHJpYXRlKS4NCg0KQm90aCB0aGUgU0RNIGFuZCBBUE0gYXJlIGZhaXJseSBjbGVhciB0aGF0
IElSUiBvbmx5IG1vdmVzIHRvIElTUiB3aGVuDQp0aGUgY29yZSBhY2NlcHRzIHRoZSBpbnRlcnJ1
cHQuDQoNClNvIEkgYWdyZWUgdGhhdCBub3RoaW5nIGluIElSUiB3aWxsIGFjdHVhbGx5IG1vdmUg
dG8gSVNSIGFzIGRlc2NyaWJlZCBieQ0KdGhlIGNvbW1lbnQuDQoNCj4gQW5kIHRoZW4gSSBnb3Qg
cHV6emxlZCBieSBvdXIgbG9naWM6IHZsYXBpY19nZXRfcHByKCkgaXMgY2FsbGVkIG9ubHkgYnkN
Cj4gdmxhcGljX3NldF9wcHIoKSwgdmxhcGljX2xvd2VzdF9wcmlvKCksIGFuZCB2bGFwaWNfcmVh
ZF9hbGlnbmVkKCkuIFlldA0KPiBpbiBwYXJ0aWN1bGFyIG5vdCBieSB2bGFwaWNfaGFzX3BlbmRp
bmdfaXJxKCkuIFdoaWxlIGl0IGxvb2tzIGxpa2Ugd2UNCj4gZG9uJ3QgcmVhbGx5IGlnbm9yZSBU
UFIgZHVyaW5nIGRlbGl2ZXJ5LCB0aGlzIGFwcGVhcnMgdG8gYmUgYSBzdHJhbmdlDQo+IHNwbGl0
IGFwcHJvYWNoOiBodm1faW50ZXJydXB0X2Jsb2NrZWQoKSBjaGVja3MgVFBSLCB3aGVyZWFzDQo+
IHZsYXBpY19oYXNfcGVuZGluZ19pcnEoKSBjaGVja3MgSVNSLiBJIHdvbmRlciBpZiBzdWJ0bGUg
aXNzdWVzIGNhbid0DQo+IHJlc3VsdCBmcm9tIHRoYXQgLi4uDQoNClRoaXMgaXMgcHJlY2lzZWx5
IHdoeSB3YW50IHRoZSBmaW5lIGdyYWluIHNldHRpbmdzIGZvciBBUElDDQphY2NlbGVyYXRpb24u
wqAgSSBrbm93IGZvciBjZXJ0YWluIHRoZXJlJ3MgYXQgbGVhc3Qgb25lIGJ1ZyBoZXJlLCBiZWNh
dXNlDQppdCBzdGlsbCBjYXVzZXMgd2luZG93cyB0byBleHBsb2RlIG9uIG1pZ3JhdGUuDQoNCj4g
T2YgY291cnNlIEknbSB5ZXQgdG8gZmlndXJlIG91dCBob3cgSVJSIGJpdCAweDEzIGVuZHMgdXAg
YmVpbmcgc2V0IGluDQo+IHRoZSBmaXJzdCBwbGFjZS4NCg0KMHgxMyBpcyBhIGxlZ2FsIHZlY3Rv
ciBmb3IgaW5jb21pbmcgaW50ZXJydXB0cyAoZm9yIHJlYXNvbnMgb2YgV2luZG93cw0KdXNpbmcg
MHgxZiBmb3Igc2VsZi1JUEkuKQ0KDQpFeGNlcHRpb24gd2lzZSwgaXQncyAjWEYsIHdoaWNoIGlz
bid0IHZlcnkgY29tbW9uLsKgIFhlbiBjb3VsZCBpbg0KcHJpbmNpcGxlIGhhdmUgaGFkIGFuIGV2
ZW50IGRlbGl2ZXJ5IHR5cGUgZXJyb3IgYW5kIHRyaWVkIHRvIGRlbGl2ZXIgYW4NCmV4Y2VwdGlv
biBhcyBhbiBJUlEsIGFuZCBJIGRvbid0IHRoaW5rIGFueSBvZiB0aGUgc2FmZXR5IGFzc2VydGlv
bnMgaW4NCmh2bV9pbmplY3RfZXZlbnQoKSB3b3VsZCBoYXZlIHRyaWdnZXJlZCBpbiB0aGlzIGNh
c2UuDQoNCkkgZG9uJ3QgZXhwZWN0IExpbnV4IHdpbGwgaGF2ZSBkZWxpYmVyYXRlbHkgSVBJJ2Qg
aXRzZWxmIHdpdGggdGhhdA0KdmVjdG9yLCBidXQgSSBzdXBwb3NlIGl0J3Mgbm90IGltcG9zc2li
bGUgaWYgaXQgY29uc3RydWN0ZWQgYW4gSVBJIGZyb20NCmEgYmFkbHkgaW5pdGlhbGlzZWQgdmFy
aWFibGUuwqAgQWx0ZXJuYXRpdmVseSwgdGhhdCB2ZWN0b3IgaXMgaW4gdGhlDQpQSUMncyBkZWZh
dWx0IHJhbmdlLCBzbyB3ZSBjb3VsZCBoYXZlIGFuIGVtdWxhdGlvbiBpc3N1ZSB0aGVyZS4NCg0K
DQpJZiBJIHdlcmUgeW91LCBJJ2QgZW5zdXJlIHRoZSBWTSBoYXMgNCBvciBmZXdlciB2Q1BVcywg
YW5kIHNldCB1cCAlZHINCnBvaW50aW5nIGF0IElTUlszMTowXSBpbiB0aGUgcmVncyBwYWdlLsKg
IFRoYXQgd2lsbCBjYXRjaCB3aGF0ZXZlcg0KaGFwcGVucyB0byBiZSB3cml0aW5nIGludG8gSVNS
LCBhbmQgdGhlIGJhY2t0cmFjZSB3aWxsIHByb2JhYmx5IGJlDQppbnRlcmVzdGluZy7CoCBKdXN0
IG1ha2Ugc3VyZSB5b3UndmUgZGlzYWJsZWQgaW50ZXJydXB0IHBvc3RpbmcgZmlyc3QsDQpiZWNh
dXNlIHRoYXQgaXMgdGhlIG9uZSBzb3VyY2UgdGhhdCB3aWxsIGJ5cGFzcyB0aGUgZGVidWdyZWdz
Lg0KDQp+QW5kcmV3DQo=

