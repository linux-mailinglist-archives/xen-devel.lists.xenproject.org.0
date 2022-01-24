Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F519498377
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 16:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259889.448634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1C1-0001Ln-W9; Mon, 24 Jan 2022 15:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259889.448634; Mon, 24 Jan 2022 15:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1C1-0001JA-SQ; Mon, 24 Jan 2022 15:23:41 +0000
Received: by outflank-mailman (input) for mailman id 259889;
 Mon, 24 Jan 2022 15:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDBv=SI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nC1Bz-0001J2-4A
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 15:23:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98a4a82e-7d29-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 16:23:36 +0100 (CET)
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
X-Inumbo-ID: 98a4a82e-7d29-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643037817;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5wTV4dXepGMhmOedAvmDrMvoNHMtZLnP3QdUsfKJccQ=;
  b=gj0ipyQC7zcWXu61WJR6OhRLOeuxcPGfjnQZSpHRYtRVPSqbV8XgephN
   x3aKoP4Xla4exC+AG5TzTYHkPe/JGGsN70KV/6N9DX5xkC4pkUv33yOoU
   Xk603LsCjfneCFXgnRK1tghAUHsndHLFCourJKDvGQcjNp9QSS6Fz42Ii
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7DZU3U+KG/fm0IbDCaId5dNTGxeHqvh/z2zxdqRyNq7Vl5LEpU02RNkKsqSZxI87KWvn4XloWn
 fllZG20nXOUDtMgJU8I0rMdswboOCgOlXf/3qQGMXo3+oRP5rSL01xxvuGmGFsbM0qeRfgyHGI
 VdDpialcSH44qptU/zbgrOEEV6wv69go674r0HkdXh60hu+iIKau9VHW8DmEuqWtaPcMJKUvdH
 iYldlOVh5UZ/lQSCVB79lKeXCiEr453ZD6ZozjOhjm7xToAz0FTvskgkxRqhgMFYOy6fXEMz2o
 +AMIHZ+L9s/evJubB5+A9PKW
X-SBRS: 5.2
X-MesageID: 62633103
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:j2avx675VmVrpAi7i94JqQxRtOrAchMFZxGqfqrLsTDasY5as4F+v
 jceXjiEMvbYNjf2f9p0Yd6xoEsHusXRydFjHQo6rn83Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NIw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 NNLtaW7axoVHIb8kuU8TwNlPwAjIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm1u3ZsXRa22i
 8wxch40djXgZwFzPFpOObgQxceCu2ncbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6ar
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbUuBgcYtFyDtEYwzGHy4vI+Tu1JzUbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4jDGJGT9bxgbQ+0RqnBN3BJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q278pSX4INEBvmgWyKJV3iEsImeBX
 aMukVkJuM870IWCM8ebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HV/gP5GfoFo81jO96rghjlDi7bc2qkHyaPU+2OST9pUEtagXeN4jULcqs/W3oz
 jqoH5LakkoECLynPHC/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chUwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:1DMkuqCicorq4j7lHehCsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MA7hHP9OkPMs1NKZPTUO11HYVb2KgbGSpgEIeBeOiNK1t5
 0QC5SWYeeYZTMR4LeYkWuF+r4bsaa6GcuT9IHjJhlWPGVXg/YK1XYENu/XKDw/eCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njFsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLlfFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhCV2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtugPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4ckWUmxjIVLH48JlO71Gh+e9
 MeT/00pcwmPG9yVkqp8FWGm7eXLzYO9hTveDl3hiXa6UkSoJlD9Tpp+CUopAZ0yHsMceg02w
 36CNUaqFg3dL5sUUtcPpZ2fSLlMB2FffrzWFjiU2gPUpt3f07wlw==
X-IronPort-AV: E=Sophos;i="5.88,311,1635220800"; 
   d="scan'208";a="62633103"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tjdj1diuw5YXZeMwmzb4JJGU8PXkhizLMJkKkBUZ2Gl4PHx0meO6PBtlaIfUN5HbxvaxWuAijRvEMq/+kis7lBKMlxzO3KRaxjRb9lH5Nz1ySartaGapg6o1HiLVSGCd2xvUxg+vq4MtwBiqPOD5rzCO35g9VHz9RSU/LNfqDDrGb7oUCcCPrCO3LivwCMbXuJQEhm1HUHbDpzSTMgKWOsINhxFpa29CSq/yjFYes5JV0UXY+ScZYh4j92/U6REuZmN59yhmyXXQvFzMhPNZsl6CK9mtqu0atypCqrLdCPzz2h0jjyhpXN8eQ2ew/+dwsc1dvwZIxbja+Ql8wzV3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fcmxul0WcH9tCwscw4bf/6Se6SVoxRS1aD5DGoEopw=;
 b=BF3VrqfUXkkOjmWjKD5ikTOuMS9Y81A1bzNueTqAmqJ+/xrdq48jjZDreiwQ+2lbjw8HUGsXGDuQ62qBrVmBQOZ3xGYL/5Su/zEhFN9phX20bK8wum5RHWj5x8jo4jrUew9T2JxT9GfCOUjryhHGj2GXUKZuSZdDcXLKzIVJ7/ZUMEsuPoNGJDtkydDX9uvLar91JthrOj/IHJzJYvoqp0JxY5Do6RNwcAZ+RRVI++Vo8najOudbHQcD6C2/8P/c/pZtHNLobLJwDVkin88a4HUyKgg7mJ323d4hkOfse7zjMuIw52lClj3N/RliMsmAf0dk7XTx9ABCXvImdgIbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fcmxul0WcH9tCwscw4bf/6Se6SVoxRS1aD5DGoEopw=;
 b=hm0AGiR7gNHJlP27dwRQ1N8g/G+TQPh0M2hGc2oig2rXg1ycjv51g4fyXJevfpApj4saaFJugX7MSg7bdz2EwC4VwVkbIoVfgM0qSrLVgjMx39waD1dl5GTZGXF36A6cG3NyZaFx//Iz620efnegloUR+gQdQaCVtGjP6NHGvJo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pvh: fix population of the low 1MB for dom0
Date: Mon, 24 Jan 2022 16:23:16 +0100
Message-ID: <20220124152316.37049-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 459db505-1f5e-4ed7-221a-08d9df4d7755
X-MS-TrafficTypeDiagnostic: MW4PR03MB6666:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB666627CF53D243B9FACAFD4F8F5E9@MW4PR03MB6666.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Kyst+rXxDKfFBpgYo3htBA92OJMeAYCzbbeJ82JD0AnAAFf9vz6y+xa7zaYHB/OcCrQdzKRwcEiB2H0T4aaVCqZIryxe+MGKwU0deJnSFW1iJIxIcjiCXE4uSZkI8ixmssnatqNpptYBVWKHZdZQT83UapgRn12AkMBCiDJMyyzlbbv69U2rSEmlnVjHUwIvVcVu6dkNJQVEs/vMpDHQOzUPsos0cWOeb1hJ1sXU6WDTUCcifd2mVuNZ5sJBWyjKIpon5YxGt6ugu3IwAXzzHxNlm62ZTTokd1ABWF66k0HU0Vlz/dpy59RfAjHhDAPlJaYB2TJQjgZ4h5ZpZVU5RFyd49CoLM7UV9Qm4+msHutmYw9TtUg1VlbBVeEdl29W4UOTskPJzeKJd9jYAzhFaxmdCB/2PMPCnMZvXXNpcj0IUXxtEaNu5hiOabHwqY9Urk+FnlrtfhuLeDvwZbiCYPi7HTCnYYFCKWhR8Pd+aedwSMUm2FExsQShLQa39I7aGJdNhagQBpRPMpkgYkzkXLLMabK+mDDgv6xWl4z3FeU4QUztObZpkdzVCu+ETyRJbK8H3LdNA7by//IQg5L1Kb1oGlpajGEJbccBVC3R9r8XzUyl8eO8sOBdmY8GTqR0PR3r7tijglMHgcyLU6UDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(1076003)(83380400001)(4326008)(26005)(186003)(316002)(8676002)(66556008)(8936002)(2906002)(66476007)(2616005)(82960400001)(38100700002)(6666004)(86362001)(36756003)(6916009)(66946007)(508600001)(6486002)(6512007)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVhGZzFjd0NNM2dYek5ueFNlV214SEJ4Mnh6eStqSXNFY1lNWDUrWWg3S25N?=
 =?utf-8?B?MWZmRVViL0NBTnpTcnlBbFFpVnI2VGk0cDFHVnJXVnV0b243bUM2N0VieURJ?=
 =?utf-8?B?QnpOWVU0d0NKWFN1dGRyQUk5RkY1R2Npbk11bFNkZDBIRlJaZ0dUd3ZwT0M4?=
 =?utf-8?B?d1MxaTYvTDBobXhWQnpQaUFjcmdHdlFrckVOeVE4SHlla0tIVGRjRUxFQ3Mv?=
 =?utf-8?B?OS9kd2RURnNqK1RHU1YwVURjb2REcUwwL0V3d05LMDREL0t0aS9IaFQwZ0lE?=
 =?utf-8?B?dU9zeDFjKzZRSkxtalBrWDZQem9pcnhWUVFPNjMzREpNQTRpa0xhVkNTVUdW?=
 =?utf-8?B?cFpzemNsYWtzUHZTUFd6alMwOWE5ZGh3NDZPdWgvZG0yd0tRM2tDOE9kSU1i?=
 =?utf-8?B?a1RwbzltYS9samhheWFlMEtQZVlqRHVUc1JQeFBsMDBETldRcTIrcFFIMHNE?=
 =?utf-8?B?dTUwYXFiZ3RVb3Fwd3hkclJiUE9VTVJ5ZmRjT0lmbTM1YnJobGxlR0Y0a2JN?=
 =?utf-8?B?dXQvUHFuL2p6VG1wYmFST1NoTW1nYmNSMGFpenZwbG16enpoZnpXaFhQcW4r?=
 =?utf-8?B?YmdCU0pFNFVsL0paekt5b2dkSy9BVmwydDA2OXRRSzZVYUJQODJYK3djQzJ3?=
 =?utf-8?B?dVVkdGdpOG9YTDBWYTlSb0N6eU5TZDhVME9MMmdWRDRSaHVzY2lxRWhsYkJS?=
 =?utf-8?B?OGpCa09IZzN5M3ZyMWdUd3l5aUJQdHhwSTNvY3MyYnVYMzc3b3E4bkFUdU9v?=
 =?utf-8?B?eitraEJYQStOdE1sWVFTVHJRNi9mODQxOXVTSkNSb0VkdnhCaHJ2cmhwYk9O?=
 =?utf-8?B?d2diSDZVMTd0MlVmSWZkdnNPZU4rNVpqWjZraG1xb0Z1NlUrQjd3ZGpHYVNT?=
 =?utf-8?B?UWttd1J5b3pneTVUbU9vQ0pVdG5SY1RySE1xanF4b1pKWVdWQ280VGRGa0dE?=
 =?utf-8?B?amczd3VpY3lHR1E5S2dndmgyWEZ5YWtsVXdRVncvVmEyRmxJTm1ES09DSWJG?=
 =?utf-8?B?UHp6QWs1WnhkSWQzS3VxU2Rud1cxbHUvS0tZZXZFeldXN24vNEFOV0dDZjRk?=
 =?utf-8?B?cmlsL1VEdUR4Y2VoQkpYTTJCekVzdkFZRURrQ1pwQzFhZlJBNmpEVUJwSkVk?=
 =?utf-8?B?NlJFbE4zRitSMkRJbG9kNitmRHhjdE5ORGJTRllWQ2ZTT0EvRWExZmR2UlFB?=
 =?utf-8?B?NlRzOUQ2MUplYXdrN1V4Z3JMV2txd2FuSWoxa1ZGelA1VVdSMnd1dVg0cE9K?=
 =?utf-8?B?ckljTnVoVlIwdWxLQzhmQjUrSXduelc3dEZiUWQxQlJDRE83SDM0Q0dadGVD?=
 =?utf-8?B?V2thWDlGZkVRVzZUeW1CY0RuV2lkNkNKcHNuVjh6dVZQVk5WYnFwRDVqWjJa?=
 =?utf-8?B?aW1ZOW94UjdSTjFHek4xWXl5NmgyOWZrT0xUMi9COC8rZzNkbXBkaFFud1hx?=
 =?utf-8?B?UWY5dlZnc1B4RVF2OVF6VGtySzR5SEdxN2ZnUU1SSTVTMlBieE9oUE5CTFFw?=
 =?utf-8?B?Kzc0SjhZT0JDNGk1UTJqUWRUYnJEem9aQm4rejZwcjdxNTJobjJ0ZW9zRDla?=
 =?utf-8?B?TVNuL2E0WHJiRUlLTzNUL3E1WFpiYVFLNmo4VzZsVElHZER2NFdEKzFVWThJ?=
 =?utf-8?B?N2xSV1ArL2FWczJkQnFCYllYam0xQlVxQTFOYmg2UVM5QTBqYkJjTDhsaFpa?=
 =?utf-8?B?NG9EY2JCaUNwZEN5RWllZmhUNTFKenR5amMrZ1Z1VFRiNVgyRUlmZFJqVmZj?=
 =?utf-8?B?YkdFc0VlblJ1ZjBxcVA1K0JPbVYxeGY4OGswVWk3L1FDaHhoN09FWXlPbFBa?=
 =?utf-8?B?VmtqV1JCOEZneGM0bk9ad1RyZGZnTFRxWFgvMlNFdDNSTzBrU0R5OGNHbTFE?=
 =?utf-8?B?VW5OTmp3NDFhT0JoMDEyVzNzSkRJajN0aUo5WUJBR2xRalhSWXJhYnB5ejdp?=
 =?utf-8?B?UGlnbE9wZjd1S3V3MldGM0hUK0FGWitkUE9XaVJQclJSdlVrTE12MUszZDdq?=
 =?utf-8?B?NkwzNmdDZnErb3ZJM3RmaTRNK0VObjg1OTVpUHZBOGVYUlErYmJiQk5pVVNk?=
 =?utf-8?B?a3o5UGdTT3p0NTBuRkduTW9FTzlNRlpFTzljalFUMXJESzNkaTRyYUxhWUxF?=
 =?utf-8?B?b1MzcmhDQVRpRUdQRG9oTERMRVU0K05KYnZSbXZHNGVlYUlQWnlYMVNTWFVm?=
 =?utf-8?Q?yF67pOKEV8az6G9QcnwpVck=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 459db505-1f5e-4ed7-221a-08d9df4d7755
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 15:23:26.0003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZNteJZuTrkHahx0hbCdKUIE92SKCO9l2vtuu9OrQrhi760Bi+/6Pu3fhY0bb7Hl24D11lOejvZEXcw5tgJo9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6666
X-OriginatorOrg: citrix.com

RMRRs are setup ahead of populating the p2m and hence the ASSERT when
populating the low 1MB needs to be relaxed when it finds an existing
entry: it's either RAM or a RMRR resulting from the IOMMU setup.

Rework the logic a bit and introduce a local mfn variable in order to
assert that if the gfn is populated and not RAM it is an identity map.

Fixes: 6b4f6a31ac ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/dom0_build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index b00e45885c..739bb8adb6 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -466,11 +466,17 @@ static int __init pvh_populate_p2m(struct domain *d)
     for ( i = rc = 0; i < MB1_PAGES; ++i )
     {
         p2m_type_t p2mt;
+        mfn_t mfn;
 
-        if ( mfn_eq(get_gfn_query(d, i, &p2mt), INVALID_MFN) )
+        mfn = get_gfn_query(d, i, &p2mt);
+        if ( mfn_eq(mfn, INVALID_MFN) )
             rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
-        else
-            ASSERT(p2mt == p2m_ram_rw);
+        else if ( p2mt != p2m_ram_rw && !mfn_eq(mfn, _mfn(i)) )
+                /*
+                 * If the p2m entry is already set it must belong to a RMRR and
+                 * already be identity mapped, or be a RAM region.
+                 */
+                ASSERT_UNREACHABLE();
         put_gfn(d, i);
         if ( rc )
         {
-- 
2.34.1


