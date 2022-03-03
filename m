Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D608A4CBB68
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282987.481865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPijv-0002bD-29; Thu, 03 Mar 2022 10:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282987.481865; Thu, 03 Mar 2022 10:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiju-0002YJ-TE; Thu, 03 Mar 2022 10:31:18 +0000
Received: by outflank-mailman (input) for mailman id 282987;
 Thu, 03 Mar 2022 10:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPijt-0002Y7-E2
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:31:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08758ee8-9add-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:31:07 +0100 (CET)
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
X-Inumbo-ID: 08758ee8-9add-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646303476;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=u1nd5gvGbjy+WiLF63/Nct6n2DffloJttn3jhHYx47g=;
  b=PzVfJuMys6uu6+jsitZkprZqFN05eq/beZuSagCNPnaZmfsLwHwh5819
   0vxO5ZYOzSCNXPzd6WLJdxKdOZKeMwmNU9uZeo/wT5hEOlOtwWKRRnIfr
   Dv95rNk9w8WbDyOydjxcvzrNv8q1Gdj8E3akbUAI3LpPqTIU2PPuV0kEo
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65375631
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FssWb6tfSfitXYAfObh+uUxt0efnVGheMUV32f8akzHdYApBsoF/q
 tZmKTyBPK7bMGT9ctEjbYqxpk5S6p/VmtFhHlZr+3xjRi8V+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8uJIDyyOJAQiJdPAxVB4NA6aCdAn+w5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pFGNGQ0NXwsZTVgMEYzVIARs9yYoWnadGYI826L/u0etj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3vx3hFyewEQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qa7Jqq/TXvKBMQAkIpXwECXBRfwN7s9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM3d3XC3270k5JGQWy2yGskTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPsYrKFHbrXoxOBf4M4XRfK4Ey/tX1
 XCzK5vEMJrnIf4/kGreqxk1i9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SnsChcFkwOk3RUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 pHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:NfgrAK7QoW4d3fdejAPXwT6BI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsj6KdgLNhRotKOTOJhILGFvAF0WKP+UyDJ8SczJ8j6U
 4DSdkGNDSYNzET5qybkWqF+r4bsaW6GcuT9IDjJhlWPGRXg/YK1XYFNu/XKDwBeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njHsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLldFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhC12dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtsgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4akWUmxjIbLH48JlO11Gh+e9
 MeTf00pcwmOm9yVkqp8lWGm7eXLzQO9hTveDlxhiXa6UkUoJlD9Tpo+CUupAZ/yHsDceg12w
 29CNURqFhvdL5jUUsvPpZ3fSOIYla9Mi4kdljiY2jaKA==
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65375631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI0VD1KwhMfC/8lT5nXQRvW0q9T9sQ8wuPPooLclMBLiwwGHRKjuorhTPw2o92kcXiT9XAQap6ouO29NFxdGMsAN9VOl7wOZy5D+UZzc2hT20cdK9hDsaMMfaPsQ0ken+NJWnwadJRyuRPHoy/N1SstijEqzYMyaoen3VVQ0ppldfTVNI8M4rLlem4DXlmi//Nbgi+Nx1Or28oy7Byql9/dUH55ketUkbF61asw0kHQ2r2j+PFE+Ve9IeEnzxqQFZTjZqVz36vtzQ3GCm28/jMhL8Njw9XEQnw8GJf+DtrlVlVhZK0T4pWYy3KrR0iGe01ZNo7QBX7MDmm3oJgQylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGede6jiblrepqQgzTK2pMH5xd5so27Xbwf7i1RSg7o=;
 b=F0gblp88+cqX1EQDib10Od3Egmn1Q9YluJT8+b+4MqyBSc+4Gv8yLvKZuEWeaUnaMoi01j+kPHjRw4MSKGr5noOZkzpTFl9bQjF9u3DcaqJGmEQJZApECR2sgU6NceFwk78ewcSvRi3uCQlsmrdJVs4hoiAkzoi29cq0DJ/fDWEqKvGlGrfSSnPDV7hUTRRC6NPTcc8eV7tJRnXxuQ017eErXU3PLeZRmp8cbPZQsHtNIycwofTyVUqvmTetWoJEU6rFe7PNt77G7NcSzLKUzotCSpQ9Z4zgTP1bFaqTwaCioiZ871ISio7Nl+e4xD5Mk/wHUG1nfykPcy1oeJYrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGede6jiblrepqQgzTK2pMH5xd5so27Xbwf7i1RSg7o=;
 b=mPWLWt9fREZ0dQH6/UHTZtl7sUwblsx9iOPkOG3UFzeI5WcUg2q3NP7jx2mEwDr+TRhUzyy6yp7/WSUIyoI1gLait7VDSH4U+l1i4tzRrdjoJaF8uThRxfvVwjXOLZ8S1q62vVQ7eZmo4plhE9kh7wOr1+KK7yezT+idzWii6Wg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] x86/hvm: PIRQ related cleanup and a fix
Date: Thu,  3 Mar 2022 11:30:54 +0100
Message-ID: <20220303103057.49181-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80590738-c158-45ea-ebdd-08d9fd00eedd
X-MS-TrafficTypeDiagnostic: SN6PR03MB4464:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4464EF01191760DD3E4C6D458F049@SN6PR03MB4464.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RRh/SU7gvOOaR6lS27aZvfX65jWGWG+CTBsCEVMugXQHPM3qLN0O6Oypz1gq1nvqhoS7olywKKHO5HMjmV9a46DpJcmOqkuWM+Eqk4Tr5R95F6Wv0lgwJ1jfy8m8Tk8R/rjQhaYDb74l28ABmAQj9pqKPDAWnuZzCaeZGlYZQDv+Yyl31bTFSIW5pPpJP2kN1usD/1uVwhOpcFo8TBL6HAlxM6usW0bPs4zIQNk0t5XDoLBdCEFFWdHO7a9lEv43k7ssZ6mYnPVVzBVfJ7hwv/uMrJ1h+PsB48ncwUGg7MeYXBkn5W69zbSAJelNiYsj9ThzJ1faWpBgobyoe7CuhxHq3SSoj2PUWuMpFJ665M4VyIyGWhydxVrT/bs5pEAFhhxkNojS73unh4VM2GKYVoIt6vTM7BA5bHrrRJPfxG8jMQJWwryexG+YTDptc5q6sEqvxMXH8oSzOFeYzlOEdlkSVyTGAmKZvlBhXfRjMJWshuluEcyBMYnv/32DxfYs8YCOpd9sJgzCYus1msf6QXx9UY83mdaGBon2vPOgiDXfYAvb5nRsX2HkstVKlghMgfWF0zurxJt+MudXG2nY5ej9yA6uu+DaZpzvFqNnDfKPIxI3VkMEIG443OCiDte6rAZ31qlpbcDGIKM9oWZU9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(66476007)(8676002)(4326008)(86362001)(4744005)(8936002)(5660300002)(82960400001)(38100700002)(2906002)(26005)(186003)(1076003)(2616005)(6486002)(6506007)(6512007)(6666004)(508600001)(6916009)(54906003)(316002)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpYQm4wYTlLWGVGOFBXM3lnKy9YY0RnYjNhc2U1R1liL2dtOTYvMi9aN2Qv?=
 =?utf-8?B?QURNM0ZiZGRZemZQUkF0U2xNNGs1cFR2ZEtKang1UUVqYlhBMGRTY0xKWmFj?=
 =?utf-8?B?N2NheXUvWHBlbzBLRkROUHQzUG1Xa251ZlRWRm5IL2hmVUl0dXJUVFVtSFhj?=
 =?utf-8?B?K3BvQllWS2d6UkpHUllJTnFRcU00M1lWSlowR2V2dGpzSnA3Uk1telVwdWxW?=
 =?utf-8?B?UlhWM0I0cGxXbUJZZG5wYmJxQ2Flb3dqMGkwbFYwc1dCcUtBRUkwQzhVYy91?=
 =?utf-8?B?VW5Ncjd3RlVHaUEwMERvVDEyQUV4R3lpcWRjWmdkS2p1QzUwZG9DUElTM3FB?=
 =?utf-8?B?VGE4WDVSSlZVcnJ1TS9pVGVDeE53c1dBUkRvU0xXS3FoNUl0TlIzT0ZZbys0?=
 =?utf-8?B?bzF3ZUordnNEamF3ZDlWbDR3Z1JtbXNhclZjQlFrOVJocW1HU1RFekhmc1ND?=
 =?utf-8?B?Y2RqNWxWUXZNc2lKWGtnY3RPNFE5OGVVTTlCd3U3T0FTeUthYUtxdDZCSlpj?=
 =?utf-8?B?RUJLVE1NZk9HYVZONklUbTNTdExtNU1Cb2ZFZ3MzZmNWRmFrbEVWUzRUVEpm?=
 =?utf-8?B?Z1RBMWtyQmdEZWtBTk5UOW1kVy9lYndTVStodit2S1ZKc3JZVzMwVGM3VmtX?=
 =?utf-8?B?S3o5aFRTVXJ4QnowNjVBcWlLWHFzUmYxdWV1NGc5TzVTTndhZ1VvYXV1QlJR?=
 =?utf-8?B?eng5cU5TQWRXNjlMclFLcnIvRDhaSUI0UXlKUHVXb2RFMURXNWVXYWYrL3lC?=
 =?utf-8?B?d1JJTDY4SU1UVnd2ZEFkaXBKTmkxU2RraStDcldLZm5UeldBSTdHZE5oNGdM?=
 =?utf-8?B?QVFBWHVSWE90eXlKbkR0MDZMNTNWMkR3QW9zbDYxK3NjbWRSMVFENlk0VVVm?=
 =?utf-8?B?Sys1Q1EwbEtnc0lJTjBOaXJ2ZmtsTUtobDl5STJJMDljdGhiUlpramxGd3dQ?=
 =?utf-8?B?VGJySUZaWVpRbFp6U29kQm9wV1d4NXBGalJZWU50bkZTWGhUVVFCZkFralFP?=
 =?utf-8?B?bitsc3pRWnRQOXloWFdvYUJ6ZlM3MUtwYzY3NlhFcXhyTkxtb0w2bHFWYU52?=
 =?utf-8?B?WGlGVjRHRzRPa05PM3ordjFRaHJ5TnlYMzBrbSs2UGlmeUNQU0ZGOWZOeXB3?=
 =?utf-8?B?WEpONk10Y1NQRWlSL3daY0twT3JEeG9FUDNBZnhzOWZsdUFFZEZmZElNYVU3?=
 =?utf-8?B?dzBTNmdYK3dkMUVmZnNyL3U5RHBicEZ3WnJpUEN0Tm9pNDFwUm8zS2RBYmZr?=
 =?utf-8?B?eW5ma3hWNjhWNkxiQS9rcVNLeW0yRU55WlRSdGJ1b29GNzhzOEtDTnp1Mkd5?=
 =?utf-8?B?T1U3UW5wNkxGT0pMSmRzRFpQeTZnNStPMjIzUWZRMGJ2eTdRNkNveFYzY21S?=
 =?utf-8?B?ODB3Uyt5NTdQZ0lvdGM4Nzg1SitKSkd1SWRTRjJoL2VEZy9vclhFYzVqcTVU?=
 =?utf-8?B?MnIzQnIzVkg5ZU1DdzBkOGpHNUR6enFZdlozNndwZks1ZFNJZzllNWlXdk9R?=
 =?utf-8?B?MnhzVUhHUzM5WXRWakZOeGNXM1hwYnpwaktnYS9abkhQOUhmcldPczExNEZK?=
 =?utf-8?B?RHBmbzJPZW1FdTJoUG9nT25CUnMzWWs0R0pUSjAvNUVPUkZQWVZlN3lUdHEr?=
 =?utf-8?B?S1p0VkxTRlFCS0hLdWFVVVdicFdNejdqcUxMZUk3Z2s2aGM0UGJ5Qm5DN3RD?=
 =?utf-8?B?RXo1R1EwZ0k2QXc0aXpNMjgvdWV6Zmt2Sk1hM0ZyWjVadVZUdXJVaENKM0hw?=
 =?utf-8?B?cVlNSzZFaHNOZUNoREJGS3M5MFk2N2ZZS3BLYkdndVlhR2NYZHBPYU0wWURt?=
 =?utf-8?B?UXlaQ1RBdHZINzVSb3Q5YmNWM1o5bFI5OFFmWjUzNy9BbUVRS0ljTVd5cjVz?=
 =?utf-8?B?d3I5RlF3bUFiWE93eVlCQkN4NkZwNXYxckRheEF1cmtFeW1WQmU3T3lVQVRV?=
 =?utf-8?B?ODhFbjk1YUtpdldVT2REbkdLYnVFM0dDZXMyQmlaSXhVeWdCc2NUNC81WkNj?=
 =?utf-8?B?b3hZZ3JESmQ5ZXFNVFNWQndRNlVJMEpXREh6YjU3b2FzcTB3STVxQkRqdks1?=
 =?utf-8?B?M3FIM3pyQ08wckRKMDNzVnhNdzU5b0g4Q05kNE54L1ZHbnZOTVlkSlY3NjlE?=
 =?utf-8?B?aFQ0L2FJSUNKYWpuMnoreXpnVEs5eFR0RlgzamQ3aVRCTmJUc1FmVlBFaUlr?=
 =?utf-8?Q?gVDGW6j/FfjOYfxVGihU8Lc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80590738-c158-45ea-ebdd-08d9fd00eedd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:31:10.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YoMTeadX3yCuroUG8tv9sIiwdt50DuU2qJEOeURbdxuaCCFv89ptH9kWfNjxhScqaiC8u2y6/Huf2PoiUXMUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4464
X-OriginatorOrg: citrix.com

Hello,

First two patches are cleanup related to the usage of PIRQs from HVM
guests, and shouldn't result in any functional change.

Patch 3 allows the usage of PHYSDEVOP_{un,}map_pirq for HVM control
domains even when lacking support to route PIRQs over event channels.
This is done in order to allow setup of device interrupts assigned to
different guests for passthrough support. Note that using passthrough
from a PVH dom0 with vPCI in a safe way will at least require proper
locking around PCI devices, and likely other fixes.

Roger Pau Monne (3):
  evtchn/hvm: do not allow binding PIRQs unless supported
  hvm/irq: tighten check in hvm_domain_use_pirq
  hvm/pirq: allow control domains usage of PHYSDEVOP_{un,}map_pirq

 xen/arch/x86/hvm/hypercall.c | 7 +++++++
 xen/arch/x86/hvm/irq.c       | 2 +-
 xen/common/event_channel.c   | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1


