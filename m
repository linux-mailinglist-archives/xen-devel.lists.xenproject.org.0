Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3196E6665
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522896.812547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polkb-0005vX-2P; Tue, 18 Apr 2023 13:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522896.812547; Tue, 18 Apr 2023 13:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polka-0005s7-Us; Tue, 18 Apr 2023 13:52:04 +0000
Received: by outflank-mailman (input) for mailman id 522896;
 Tue, 18 Apr 2023 13:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqrX=AJ=citrix.com=prvs=465e465d1=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1polkZ-0005P1-JG
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:52:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3124a44f-ddf0-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 15:52:02 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 09:51:59 -0400
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by BN8PR03MB5059.namprd03.prod.outlook.com (2603:10b6:408:d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:51:53 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:51:52 +0000
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
X-Inumbo-ID: 3124a44f-ddf0-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681825922;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m3r19hQM1WDXFiw+A77e9FObRqsL+dJACDbBC/vUIN8=;
  b=A+wtdOaxnNExLT8FXvgb0V6Bck/e1tgKZmUkRHsEQnaETQU84MkFiMMA
   UR6dty/f/HOALd/PUiw+0Jl02Nnrwyr++PTC/DhNfoxEBL331j6Lwup/v
   l6kygorcSFwB4SJKo1FYKBrvs/+adlRM6VSNXu6SbntHqOEkO/xzrdRhZ
   s=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 105995734
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KK4R0K2LYozNIOVsUvbD5eBwkn2cJEfYwER7XKvMYLTBsI5bpzcHz
 GdKCG/XOvjYYGb9eN0iOdi180MPvsfQyoBrTFZupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEWdT1
 u4fdBk0fgm+gMPnw52LQbMvv5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1IZPLvFabI5fvSQQt5O2EKRq
 W/c4G39BjkRNcCFyCrD+XWp7gPKtXqjBdNDSeLjqpaGhnWplmYQDT0NWGLgrNyEtlGbXdJnB
 Eo9r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOttcxRDkg0
 VKhhd7lBTVz9raSTBq19bCStzq+fzcUKWwqYjUNRg8IpdLkpekOYgnnS99iFOu5i4PzEDSpm
 jSS9nFh2fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:Mc2Td668sSJifYuRMQPXwNnXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgpHzJYUkqKRMdcLy7VpVoIkmxyXcW2+ks1N6ZNWHbUQCTQ72Kg7GC/9ToIVyaytJg
X-Talos-CUID: 9a23:+OmlX2PjKZKfOO5DSC9611wTRukcYmTgy1aBIGCIAjwqcejA
X-Talos-MUID: =?us-ascii?q?9a23=3Auy/UqQ1wjU40LUxTp1IWTwM2eDUj2fSkC0Utipg?=
 =?us-ascii?q?/4MShCBBvHjGdtBuxa9py?=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105995734"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKIls7F+d0piLKgOZVFheSOtOMWJK2GRGV85L1Rt+oPOa9DQKQxMCpASLDvgHdUDnb0PuFHQC4ed4xEII9hEuAhxt27X7HIYWUuddRa6nxeLE2CjQQ+ZV/Krz2Id1RRoOco1djjCX5EnYb2z8NJYQX+oHqPD8xDd8JkZ0jCfxRh9R5C3tYX4umx5zTKiQATk8VOm1TbT1zIPl/GXKzhq0ICfhSmV2nxt/VhsB8UgkNAA6dNADdFC2kR+l2h7UZ7tnalw4+CvwcmCAOBBmXGB78H0mMh8fj9VEn4BP2qF2HVa5z3CUZT9RbIwu1L6/pgSQbley824tZY436/86xRucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3r19hQM1WDXFiw+A77e9FObRqsL+dJACDbBC/vUIN8=;
 b=Rd93/vikXcqM5PuFDbhKDSwy77Fpdk0kswNCIiE6wFPfkzaAefMjhegvYy+BbhqGMbwOJk86wXEy0rJAo0eNjyo/EdXCxsB8N43h5CggXEqL2JEDFiovQsWh2RqkxlbQGYjeP9dQpL8me95QGA0kIuOdfo1Dz8kxrQxcVQt+6QDlBzFl1oxkOKHcaEKaZfJolRUM+LxrLhdEzNlNIkZPHVFGinut61+VwcpUNDe5GFna7RF/oWq63dup8qA5bpdN9zL9KX6cEnPwHmReNoy84bBCdkWmEw33DveSCi2x75m1nDaEm0IaUg0HC35Gkc4JhNerOfUyJl5NQi0VgEltBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3r19hQM1WDXFiw+A77e9FObRqsL+dJACDbBC/vUIN8=;
 b=LI/KjDpX20PiyQKbY4JrVa9/9GHyngl7I7Jgtq7V89I+jyyJZ9UJDn1m4u1TV38J8vsHSjkbnMCfwAU06GQBFcp7W1BUAntwHAxyN2GX9S78h//aYEa1H9GavkfQKwOL/vkGxLk69a4helzcC6ksy0oJZn1gvwgC8Gz68DKb5AY=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Josh Poimboeuf <jpoimboe@redhat.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>
Subject: Re: [PATCH] create-diff-object: handle missing padding at end of
 special section
Thread-Topic: [PATCH] create-diff-object: handle missing padding at end of
 special section
Thread-Index: AQHZbuSTaQYCrBXOqU2gniRwRe4uLa8xG8Ih
Date: Tue, 18 Apr 2023 13:51:52 +0000
Message-ID:
 <DM6PR03MB53726ABC80D3687499672BA5F09D9@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230414151933.53851-1-roger.pau@citrix.com>
In-Reply-To: <20230414151933.53851-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|BN8PR03MB5059:EE_
x-ms-office365-filtering-correlation-id: 38328439-a2e7-48ab-34b7-08db401410aa
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZX02geIr/iuesYRP7VYH4IU2ZSKbv5Yni1+Sn0RZwnLpBGgLbvyG8yq31BeaATVh4O4mymiO6G2HiqssG7+YwR6KOOMLrXAyLILDw+SfWdxs5tjhBDTaZyR7QsXDDjKTJadW2tLUuaAfzYTiCwPKdeQt4k+5Hi+fjjgbUI/om8E5WMkuxm/WUhasqqyAZuujTWYumNbVx5/RDwIqVhm0Q5GQJUoSP1OvQYNBQD/Eo+wBUgm17iQccJdN6TmGM7ZM7V2B5JYFSXKjLUcuUCs1hwBGalAGLI+mB7iIUXGU1lhJAQHNY33NNJdn9pnoxXcQpKr7EWSiWrG0lEsiPoUE/RHziQI4z4JAtfya04TcWkloT3yrs1jMHA9i5xeZNu6BeiTCYIqrmJwZ/igGd9x+VDk8g9dxYlU+e6h2tKdichZfY9sId9dcqj5v4LaraH4YnIPMH1J4hi0KDRUYOJ0OnlBkCZpMydPK3Vm3PNMjFl0koktNbfcxNgot2h0TwtOVsRPkVz2gV8t6Xg+duMwXRQEOczQ7Ze/1GnoT+DRvQnR5uAIlWdxa93ZAXU0pMSiuakOABE+Pn78jJ802wWNad1nsgn8dc8q1rHreGyAebI9//p7CG9sofBf+h96XVJxV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(38100700002)(8936002)(8676002)(122000001)(38070700005)(44832011)(5660300002)(2906002)(33656002)(86362001)(52536014)(55016003)(478600001)(7696005)(71200400001)(54906003)(110136005)(186003)(9686003)(66946007)(53546011)(6506007)(76116006)(66476007)(66446008)(26005)(41300700001)(82960400001)(91956017)(316002)(4326008)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nq0pIF1Q2ii6uP1w7Syn3wGDN6XYxFoAHsCxKl96724LNGQWrodenQnFmV?=
 =?iso-8859-1?Q?jyTJQ+5udj360FfiL9gtdy5QxS3+2PTXx4+xFfJui+S7G9XHc99pjiBRlc?=
 =?iso-8859-1?Q?qljvOQK0BJBumRK3DKCHsoxW03ZmsTdQlwdWxGsZTRFAUzSSklfmOjgnO2?=
 =?iso-8859-1?Q?glv6FG3B+ls3xhOV79E3rmGzGn4gU6i/IujFOWctT044vjTExQuK9H/5jc?=
 =?iso-8859-1?Q?QAr+HpIYqcFTcS+hhWWRVgvgdylvTOeokK8B5HqTLx/tiUsri6+CXi7qGU?=
 =?iso-8859-1?Q?aXJrdM9g6BYd8gg795M0qK++tKI1uk/CT4VMdw8iWncOhtMiIg6QGt8vMq?=
 =?iso-8859-1?Q?RRIaaFGs/xzi+bSjoKcTiImD4dBIb9K/ccOQgz5CvXz9LwR/hNCShS9hzG?=
 =?iso-8859-1?Q?g8YHzl19yNWNo7lXoiOt70kG9CWnqglUtdqAK6Y6HlvBBZOd8OTqQ9cGLP?=
 =?iso-8859-1?Q?pXJ2cFj7AQqd1oiNZ4NTYNqp+CNs5UKPSx26qlqyK98QOKD55OtODrPxDn?=
 =?iso-8859-1?Q?hQwlnSeyc5ty7wilN7kWwb/u8JdUNvNpAYymAiK1Zk2x8XFE0ptFDsBmrm?=
 =?iso-8859-1?Q?99fUhxBXkkJW6RInZS+jQkNJhIDqpkLzPsetCgXvgmcQEY1lTNAfmjgXJ9?=
 =?iso-8859-1?Q?RbtnxU809SkbIUapZWNMI8yqo/zaldDcbbKm2RYz8Vx3GEVAlEmC1lNtc6?=
 =?iso-8859-1?Q?3zkI8OQigq422wN2AhatEr5tyxKIs4aKdrMpEcE+JTJyjsKoAQEceYnC6A?=
 =?iso-8859-1?Q?N4m+MkS+n4T0pePgZKdAGzbckuXwVRFw0Ej/Pf6JlXQum0AfPl08SjBXmZ?=
 =?iso-8859-1?Q?HTYAaGueaooUGEYfyin8rfiNXnuvDTocNAjCXUzbO2UFhsjAhqCgal/lOq?=
 =?iso-8859-1?Q?BtD6Hwa8OSN+x//flgiPDQTw4DXmHMO0iaYcn5FJeK9lyjhaTC2B0RQKvu?=
 =?iso-8859-1?Q?H7vOCD8wocKArwteEO/DoPWablb4DqadTfneFajzEP4vbgc50aiRFWNcJp?=
 =?iso-8859-1?Q?J8j36/69IbvzZsExY5G20ueJBleGPmwgtktjU114xEtBMpcTEo62CYU8/4?=
 =?iso-8859-1?Q?xKTFB3SMZF4IP9ezWGfUIz/vMtP/GkariGdhopKJiDm8pqZvQDDk+dlbuA?=
 =?iso-8859-1?Q?BlC6OYnexL3AMpFMDmcuBMq54uhYphdZXj/WiPl4DUgjQl3Ku8fo3qVeoY?=
 =?iso-8859-1?Q?WMhw//GElsyksmjgld6JaD+M2lx6aW2+42+MkmaeymeBe786iJf/JauObv?=
 =?iso-8859-1?Q?zhXKEoIqoPGDU/gdbYOzhAt11zHX0LqzYLHIxmuAqcvdWz7oXPuuEmKjgM?=
 =?iso-8859-1?Q?fiCZmBSPVhgY9GJ4bQBKLYaO5WxZeZF+20XBvUNSITiZ9ljXy0GiBx87hF?=
 =?iso-8859-1?Q?f0U3wN5sFGt24oIa7jBEPJ55ZXJvTbKkikGLn7X/mkycWl1WTbVeOchNns?=
 =?iso-8859-1?Q?7XHXp79nlTWbghz74Is4UiIianvTGRfOzLVi40rfjNFyX0lix6nAtbUzkC?=
 =?iso-8859-1?Q?aF2T2HzrUKfPlWEooDteOwBbOuD0FwvyElNwoYhTp/sFzOBh20thSaImNk?=
 =?iso-8859-1?Q?GXvlU88iYBMUCW7OnXF/tPqDqYd272DRY6bLyhExb39gLGW0w3V4FB0xkn?=
 =?iso-8859-1?Q?O0/fdY1mDhGNRSy4bmQJHHclYkInCGQIde?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xq5NZ0cmICe6cps6gFMcn4qSdaF1VjhVl68kpsr/vMsvOaDsNuA7Hfqb90Cj5dVbZG77w3FjaY2oJ68rGAQwHcPWyOCqzvl2DA+wYZETZLChhOF7FqPo+n5Kk7rrTiTgtM39YZS0H2cgHyin+v6qcQuE9XXRKJH9oZjCpD3kKF/6CAqtVEh2/DCq7HNMWRBsGUVV2Uc8rYxfOigEUWUFjLjglpuG39eOdKw940QkCbj2oSsDIFAw0MBpZEO0RntvjRbLfOdTgYhE1HQ5zCnxReGLkCXYdskvVC7usgNgcCuXqKDuIdgaFZpkrsafuQLpqfU6xdO5x/xkZgdyOj76/SB6XQIYK0ZzzbFn5A7K1F8zQKIyOZnVEDUPZ6/8zUwDeTc0actXhFac09Ij7JMi2GXvmXLsBAVO6KM14YUc3vJdarO0OjrSyVNQIkMBHEd4bWaujj4eJOOhNdK1bzSKiQYOrYB++CYyhWnV74q82i7+WDkZ8DZIEq9hDQmEcX7TW8Ddt1fMt/00L2HE63Z1pj9vctK9qpo/+HyvloJWl5dlBkn7lDZOg2kHOALrqKYJXCH4ABQgFEGjJj7rufXgOl+UShWaUkR9AxajJNcxroay8XEahvjsJCUIE8Q9BcEPHtDqBTKp54APhL2p5f2YdQYbJjwu3wnoNULhpID4oaZ8OuuTkfTLhpswXRMtUtcOVpzxxwXeK51eX4SKMw0JE97UMGlpciBOvGRMoaAV+5pweszkmAtZmucu2s7B5umhmFGjC/7IQyawolBQ/Niutsf1445zPzErF4KEDpJy3j9e6GC59BQlQkXZ3nQHTG4P/yAIOPTnJmhqYZ+FKN7rIA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38328439-a2e7-48ab-34b7-08db401410aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 13:51:52.5752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZRJovDOeY1nk/C8GoKoL73pYMDdzNM+z99AiJBlovhnU7lGJaWp5Dz767RzUqOyXOfyMG3aPc5SMIkjVykgbzzgeM9ZvWGenDVbfNKt2NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5059

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Friday, April 14, 2023 4:19 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Josh Poimboeuf <jpoimboe@redhat.com>; Roger Pau Monne <roger.pau@citr=
ix.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwall <ro=
ss.lagerwall@citrix.com>=0A=
> Subject: [PATCH] create-diff-object: handle missing padding at end of spe=
cial section =0A=
> =A0=0A=
> From: Josh Poimboeuf <jpoimboe@redhat.com>=0A=
> =0A=
> The paravirt_patch_site struct has 12 bytes of data and 4 bytes of=0A=
> padding, for a total of 16 bytes.=A0 However, when laying out the structs=
=0A=
> in the .parainstructions section, the vmlinux script only aligns before=
=0A=
> each struct's data, not after.=A0 So the last entry doesn't have the=0A=
> 4-byte padding, which breaks kpatch_regenerate_special_section()'s=0A=
> assumption of a 16-byte struct, resulting in a memcpy past the end of=0A=
> the section.=0A=
> =0A=
> Fixes #747.=0A=
> =0A=
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>=0A=
> =0A=
> This is commit:=0A=
> =0A=
> c2dc3836e862 create-diff-object: handle missing padding at end of special=
 section=0A=
> =0A=
> In kpatch repository.=0A=
> =0A=
> I've seen the .fixup section get an alignment of 16 but a size of 81,=0A=
> which makes the error removed in this patch trigger.=A0 Overall I'm not=
=0A=
> sure why the original alignment check was done against the size of the=0A=
> section, the alignment applies to the address of the section, not its=0A=
> size.=0A=
> =0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
> ---=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

