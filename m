Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F764CBC62
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283180.482111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjV0-0003MI-T4; Thu, 03 Mar 2022 11:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283180.482111; Thu, 03 Mar 2022 11:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjV0-0003KV-Pa; Thu, 03 Mar 2022 11:19:58 +0000
Received: by outflank-mailman (input) for mailman id 283180;
 Thu, 03 Mar 2022 11:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPjUz-0003KN-Rx
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:19:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9e03b6f-9ae3-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 12:19:56 +0100 (CET)
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
X-Inumbo-ID: d9e03b6f-9ae3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646306396;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=drbi93nK861rTbgrTJORxuegnx+emM3WevbpqR4wFYw=;
  b=f1P2K4IMhNnNg//OvUD0KjNMleVn2ZAyf77FriI+ir2j9yGjKK+4nTo7
   NyLnlWGvw+ajF+atfEC9Ou1oVhNWJ7P+VIlkPMnDq6PD4dH7uMeuJnepd
   fvSLiZCWU4yM/c77aMXHlwbGry28qiY3sQj1oyTDpKZFK+ERrONh0NTcA
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65384971
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:e8yKRK6/2xKSIzKolDCR7QxRtC7HchMFZxGqfqrLsTDasY5as4F+v
 mVNC2uBP/aMZ2qmftFya9zg8xwGsJKBmNZlTAQ9rS5hHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhWFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS0FSQDfaD3ot1BDR1FLjxeG4dK5/jIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQK2OO
 5tGMFKDajyZMxdIZmsKA6sfgeeoq0P/VWN2j3e88P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc94MMMd55Tq38/aK5xukG0giZDJeL9Nz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iJsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieh01bJpVImC0O
 Sc/XD+9ArcJZhNGioctPuqM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlOniHqdNIdAtSRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:1UdiTKwxF67B8F96hSQSKrPxyOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PPP+XZgNd9vpfvHHf1AlYSi8eV56cm6XXJ3uBRr22urKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65384971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rgoo3W2myrIL0DV8kWoTaj02VYSERln3ZQgV1OiL6tj1O/g6ZParKgVW0ZxUXHvPyPTbxoOf3xUYKNGq0vcQELuqEBN7erzncly/0kW1eREPypCrALO+UKAtZLiocs9rBoDpu9sSmztOQpn08xR4g8i2j3SsEkA63caUNj1F+oF4gBXy6rwW93R8GDosGFaW+DnigM68GdZcxK2Rj62mdDXEGUxeRz9xzJKDsEehyfyKpw35Pj6zExpratT/ikRtNb5BTI5LAfblHoi0MWxV4JoTdIrryp8IQE0cnopx6dyPfP7y/d4GqmomsSir7PAUMl9Hh5hPErwbWJMWl7k3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WepmeitH0Fb/BuwuVEAZRJdYewyBtxQsOxi2a6KbIec=;
 b=NAObcfxcL4podAIVknhcxtKLfry/sp9ffdYUtdy1mlSwCHMSuc8kFTZPUyhGrahY73qA8jnmP0I5OhBDIWPEiWc/Q8iHkrqkRcnsh1+ITZ7GpAHCRpzWMmvd5KPvBYIpbfu7121CvKF+QGRNB4ojLMSStsXqO926eHZoT8yzske/8cYBgtvAlVP81GruVrpo/OaHM2Zfh5mtfrg5jsNg8M8Mibz1PyYBxhq4aUwNDqj96Fo890P0oEWm8dgNSSLofzbKQ5/4pgvGmau9vYxmUxmoTYPa9C2xxqy0ZUYf7DrQsA/XsxHXcoOB1UPoHRWddmHMUypibQGuqFbmpdgc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WepmeitH0Fb/BuwuVEAZRJdYewyBtxQsOxi2a6KbIec=;
 b=KJ8c3zW6XfSRpWc66lKZw2fbdQd8fZlS7Le8fFV1xtyVmJ6UxtHusab00gW4uY0uIFWr34bVYU7x+F1na33cUDrLrFpphwqtDKTPrn5XZkxAW18MUfkwxb2gb4pNDQJA0x4Vuzo3lLt9gHPNeG5NFyuE+TJ7YfYmKn+OJj1Ewpk=
Date: Thu, 3 Mar 2022 12:19:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YiCkUebvg0gaBm4/@Air-de-Roger>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
X-ClientProxiedBy: LO2P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccd89cfc-f0f3-496c-ca99-08d9fd07bb65
X-MS-TrafficTypeDiagnostic: BN6PR03MB2771:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2771DE0D818FF652C33B21118F049@BN6PR03MB2771.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LG86akst6qA7tXWU/CgcGhKmFbmIV1P94ExEUsU1KaGeOcNNL8cSGZXIj7phyoarQrIOPjxiCt4smVyieiE+erZLWqbNsz1cwLoGMLfaOPYKFZBzA6xuzeMpl3MT+sjH1opPVaMTAt655wdQWEV/I+jX/GpB4On+UlGS6lzLM6yTi8gffl5Keg6Py4Yew3iCkZHAMJ9Iyz0lqQbt9Xwm+h9p7bMrzx1CX3wWt4u9/wtGm7rdQvRIXaxTE0rPfWiPkWZHBRrWi4ovaIg0sQ4Q3cASHyLmGNRlwWzjoEyZt1THW6Wm+3k8SPX3y7MCpEKCi4zNdkeLRkuVEq1vAnHchudXK8F3RapWkT4i28XcbjE6Q2I3/vPIMM5rGxO/jDlZ9CrYDC9VD9m2/i3jIhjHMN0cLEDXuRn19N3Ivy9Tzif4GbkX1SoHKsPo7nxOq3XpFXqKk2KKMaJ/KFcNxteTRk9HjEAbaGpexkw8gY/WcDeQOO+tOHGX44erL0I+2ECj9pk6ING/jWMRZfw78NOh2A/OMY9hcvPuuEigUh4rbYejgq4dzDuAaCYhj+bE5BSv7ay84jncF67QjzFU10tNJC8Q4upRRIGoQQxXJAOZ6WRNu8H3frPixR21EXtq1dftVmhYaH5Bsq+OdE3NIlRXiqTOVrfERN9JJA9YXHeXJXLaQpO7it1zauk1hgQ9cqlIygOcZKeYlOdbnCH7uSu74Z1pzRV/zdwbnWf4MRS5LNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(186003)(83380400001)(38100700002)(9686003)(6666004)(86362001)(6512007)(2906002)(8936002)(6506007)(5660300002)(85182001)(6486002)(33716001)(966005)(508600001)(6916009)(316002)(54906003)(82960400001)(66946007)(66556008)(66476007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0c4d3ZIR3ZBYkNSaE1NWUdxSWxnTmphYndEYnhobWQyeU90UmFBTjhTc01Y?=
 =?utf-8?B?NTE2Q0w1UEE1K3d0ZnhINU96azN1VEpIaVFPOUFDQlM0R1dWaGxhc1JmQ3ZM?=
 =?utf-8?B?MG9CRGNyRU02bElNbDFhRUpPYXRtNnN1TGp4R0JmVFFUemhteDVLTVkzTEox?=
 =?utf-8?B?Q0JIcHkwcG1UYmdPZ1hLTjJ2NGZpOHY5UWJpV3dEMW5xZWlZbmRYNzQvTkt0?=
 =?utf-8?B?SlJPKzB2SnN0Vnpwd2dqOWpzY1FaU1k1ajU3b2l4NUhpZDZYaTJUT1AyTTcz?=
 =?utf-8?B?ekZubUdaU1AzVCtIeXJHQ1JDSmpPd1RXMk5Ob3NUN2xxN0piZ0hqMGVlT3Jk?=
 =?utf-8?B?WFVVckZYUkdkS0N4cll4SksrelJhbmxRWTVDOU1Qb0NVOVZJQXJWMzJ5U3pr?=
 =?utf-8?B?MWpDSkRPRFBiRHB2anZHZ3Y5SVVNbE01Z1k1V3RiMDJsaWZzcGJJb29ZY0gz?=
 =?utf-8?B?VnRHdUFZRXhhcVdIMWZ5blVrNzFPK1VseHRVUzQ0VWUyMzhNMlFYY1dOVzVY?=
 =?utf-8?B?NEdUS0FkM1dobnBuazdTUmY3R1VWd3hYajEvUWNYM3lYNWJBZTBvbWVyN0dP?=
 =?utf-8?B?T21SUDF0RFQybFZQeGxTUzRpTFdwOEQzdjg2aERray9LOFlsU2dmdFZ3Y0x4?=
 =?utf-8?B?cmorQUxoTm05dGlNVFFrYkdZQU5pT2ZpZmJacjh5MVRGdFJQajlsckxrYk1N?=
 =?utf-8?B?Y1RyRmhHUEgyU1hlT2pQblNZSmN2MHduc0doejVJajI0QWQ5ZjR0cERIZnli?=
 =?utf-8?B?YUZjRTN4ajFEN0kzN3h1RkdramxMZzhjN0l1eHNoaGlMdWEwOE9nUVoveXI4?=
 =?utf-8?B?cGtnSVRUaHVONGlkQnJBV1RoTG53VlFFRlVNRElvSy9kZmRsSkl1RFpIRy9B?=
 =?utf-8?B?RXZzSk9PRFByaWdjWG1zdTVBNXJxcXpmYVRmdi9ONkFCb2dLVlZoN0VtUW9x?=
 =?utf-8?B?OWZtWWJ2UXdoVTZFT0NWajY2L0hLMHM1M0E2dkVHREZQbkdFT1pPK2xUa05y?=
 =?utf-8?B?bCtuSmdNKzRmaDNFZXB1cmRHd2ZsS1VSNzM2cG4rbkdLSmdLUUppdkRneDU3?=
 =?utf-8?B?M2l2MjFJemQ1aDFpOEcwOGFSanZaOU44ckRhU1Y0bmQ1ZUx3MmJpekZNYVBu?=
 =?utf-8?B?RFVGT25nUVlBYk1NQ3cxb0xyYUI0YmZIR2J1V3NkdUxvQXhFbWgxY3NPbFFy?=
 =?utf-8?B?Zy83eXh2b2J1VU9sVlkwOTJuRjFkSkF6YzdOSXBSaUhDbjBvemRFWHpYRW1s?=
 =?utf-8?B?SDBoTW0rc2lQSm5FVFJocnA0cEcwTzRYcVZydnRzTEg3Z0w2SmNqY0gyVlBO?=
 =?utf-8?B?QVpGaGFlZ2pEY1BpMktmZEozMW96ODZCM1BVL0kxY2dSb1FvOGE0cU83TGcx?=
 =?utf-8?B?L1JFSDhBOWdUVlk2K2lrYTVWZzBMeE5abUlFdnM0QW1RajdaLzBWamJnOHI0?=
 =?utf-8?B?b1luT3NSbWtWZU1hSWd0aVRQaEJRVGEvNTY0dVhhSXh5aXV4dktCaERDSDk3?=
 =?utf-8?B?clRiQVMzb3lreEdSNy93K1kwTmZyODZRRWwzYlZBQVNsMXRZSnpSTUlrTmwv?=
 =?utf-8?B?TmZIM1FwWGd6eXRieUlaTVRWSUpGOTh0dmxzUWhVSTlLbnNHdjlTODdaTEsw?=
 =?utf-8?B?dWc2c0V2eGp6ODUwMU9Rci9GUVI0VHp2S2I2eHVHdHVQWFZhYzJzMHVxZE1y?=
 =?utf-8?B?aTZyTjFXcjVwTHhVbm9odVZKbmhFenVwemZXQzQ3WFRrQTNYTUdnaGpCS3o1?=
 =?utf-8?B?UHlvcHNFV3ExZnpvRGt1RjNURExYbWgzMk9GQktLdFFFM3ZxRVdGdnQzNnNk?=
 =?utf-8?B?SmZ2elROLzdkQXpFUkxHT2V2c09EVlF6MHNGTm9Uam56SldlcmtuclNqUXp2?=
 =?utf-8?B?b1JPcE5qb0kyZFd3UllaejdNOGdkMFJDcm8zL1NReGJ2RlJ1M3NxUVhVc1JU?=
 =?utf-8?B?Y3VCSkM1eFdZUzBPWjcrK0JGUDlDM0hPVmszUEg2UGd1QmRtS2lGSVRVenQ1?=
 =?utf-8?B?QVNiUnQrOC9tRjFoU1pLZURyRTQ4YytVN3cyMUJGOXhKWHFDc3FDcW9kcStV?=
 =?utf-8?B?TDNsZGEwNzJpL1FwYVBxWGFzK2ZNMzM3R0V2RDBSWGJGMTJLaGN5dFJnWWZm?=
 =?utf-8?B?ckpwQ0plSUFic3Faay9vYkZvTFhOUUtpaWFVOUVGVG9HM3RSMnZnU0R0MXJv?=
 =?utf-8?Q?+c/quCx/aBBaEYLnsk6QGyU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd89cfc-f0f3-496c-ca99-08d9fd07bb65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:19:50.1494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FodY5AI1765IaiSAPw3ZLDFDHLHjncPtetMTbsd5nYVjC4JREen7PrBqrPebgCDa6tU36AXiOdv95GAvEqQSUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2771
X-OriginatorOrg: citrix.com

On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> binaries"), arbitrary sections appearing without our linker script
> placing them explicitly can be a problem. Have the linker make us aware
> of such sections, so we would know that the script needs adjusting.
> 
> To deal with the resulting warnings:
> - Retain .note.* explicitly for ELF, and discard all of them (except the
>   earlier consumed .note.gnu.build-id) for PE/COFF.
> - Have explicit statements for .got, .plt, and alike and add assertions
>   that they're empty. No output sections will be created for these as
>   long as they remain empty (or else the assertions would cause early
>   failure anyway).
> - Collect all .rela.* into a single section, with again an assertion
>   added for the resulting section to be empty.
> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
>   .debug_macro, then as well (albeit more may need adding for full
>   coverage).
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I would have wanted to make this generic (by putting it in
> xen/Makefile), but the option cannot be added to LDFLAGS, or else
> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
> LDFLAGS would mean use of the option on every linker pass rather than
> just the last one.)
> 
> Retaining of .note in xen-syms is under question. Plus if we want to
> retain all notes, the question is whether they wouldn't better go into
> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
> notes are discontiguous all intermediate space will also be assigned to
> the NOTE segment, thus making the contents useless for tools going just
> by program headers.
> 
> Newer Clang may require yet more .debug_* to be added. I've only played
> with versions 5 and 7 so far.
> 
> Unless we would finally drop all mentioning of Stabs sections, we may
> want to extend to there what is done for Dwarf here (allowing the EFI
> conditional around the section to also go away).
> 
> See also https://sourceware.org/pipermail/binutils/2022-March/119922.html.

LLD 13.0.0 also warns about:

ld: warning: <internal>:(.symtab) is being placed in '.symtab'
ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
ld: warning: <internal>:(.strtab) is being placed in '.strtab'

So seeing your mail where you mention GNU ld not needing those, I
think we would need to add them anyway for LLVM ld.

> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -120,6 +120,8 @@ syms-warn-dup-y := --warn-dup
>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
>  
> +orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn

Might be better to place in xen/Kconfig with the CC checks?

I'm also wondering whether we could add the flag here into XEN_LDFLAGS
and EFI_LDFLAGS, as those options are only used together with the
linker script in the targets on the Makefile.

>  $(TARGET): TMP = $(@D)/.$(@F).elf32
>  $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>  	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
> @@ -146,7 +148,7 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(o
>  		>$(@D)/.$(@F).1.S
>  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(@D)/.$(@F).1.o -o $@
> +	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
>  	$(NM) -pa --format=sysv $(@D)/$(@F) \
>  		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		>$(@D)/$(@F).map
> @@ -220,7 +222,7 @@ endif
>  		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
> -	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
> +	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
>  	$(NM) -pa --format=sysv $(@D)/$(@F) \
>  		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
>  	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -12,6 +12,12 @@
>  #undef __XEN_VIRT_START
>  #define __XEN_VIRT_START __image_base__
>  #define DECL_SECTION(x) x :
> +/*
> + * Use the NOLOAD directive, despite currently ignored by ld for PE output, in

Would you mind adding GNU ld here to avoid confusion?

Thanks, Roger.

