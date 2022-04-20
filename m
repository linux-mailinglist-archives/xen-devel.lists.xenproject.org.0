Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A1508876
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 14:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309218.525253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9jz-00021G-NB; Wed, 20 Apr 2022 12:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309218.525253; Wed, 20 Apr 2022 12:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9jz-0001yP-J3; Wed, 20 Apr 2022 12:47:27 +0000
Received: by outflank-mailman (input) for mailman id 309218;
 Wed, 20 Apr 2022 12:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nh9jx-0001yJ-D4
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 12:47:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055c0c01-c0a8-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 14:47:23 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 08:47:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4785.namprd03.prod.outlook.com (2603:10b6:408:9d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 12:47:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 12:47:18 +0000
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
X-Inumbo-ID: 055c0c01-c0a8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650458843;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NkeRCNNE6NO3vqwczH4AqDoKgpWiY9CwvYfF8dQKHvw=;
  b=HiXfRsYjLZlxhv9ajIPE1uiFeSvKsHmjx1CCHBu+eOtjkNqJakqlYJyl
   zQ5N+aM0tH1sUfpW0X2ZuYwkR/qM6Ubvj8h1Udirh8U/jFKTUF0Wk38YG
   c+SZc1ablQmL/HLIH3I7NEC8w0RGqZRUHsd1joUS6vfse1nDMf6lBmfd6
   Q=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 69507797
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xMaRbKP8yJrhfO3vrR3WlsFynXyQoLVcMsEvi/4bfWQNrUom32dUn
 2scCGyFOKzeYWGhKdwnOd/kpEoFvpDcydVnGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 Olhnp33QyYSPobqtPoldQNeTSEnFPgTkFPHCSDXXc276WTjKiOp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7EdaaG/iiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2MJ9QrK+vtoi4TV5CpPjbHkEfWLQJutV+EPrhedg
 nnfoHusV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/Y5lifD21dFjpZMoV+6YkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:LWy0FK7Lf2VcY3EOIAPXwZGCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+843WBjB8bZYOCAghrmEGgC1/qu/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXerIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonis2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaQkEyzzYJriJaYfy+Azdk9vfr2rCV+
 O85SvICv4Drk85uFvF+CcFlTOQiArGoEWStGNwyUGT3fARAghKSvapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jRiuKYlGclsRLYkjQpo+VY7bVDHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TpE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZeo6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z44HSKyGG4fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="69507797"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUVqb7/vjgJ/Bf4NdgWUoa35LQjncTWH3JNgfbPGJ1aaEj96jLQ7EaMQMDu+EOGChOxQM989rSGUKHzTC2yPAgXBqPlGxoZVpzsq96MWWDUkfi3Sck0URMGxte1sSivLYVRu9LrH1r8l0pJ8+1M2JsAMCKCN853/P1FfltGNyRhppaKwhivK/MebcfScuJxiynHmBXm9GUyiuCZL0b9xscWjb78Z1g6ZfBCE9w/XCavfuqi8HuC1JoBgGc8GfYvl8iTBhA6zocO513+gJg1lUUUzejeRAguUAwk00yVA1I0zYZe+tcizexcvuPjx/bOCgxX5XS6R6GxBJJAc5UYifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkeRCNNE6NO3vqwczH4AqDoKgpWiY9CwvYfF8dQKHvw=;
 b=G0uQ53vZ4EvsX9pgv/Ub5oun0rM2Je3nfRmF4AbMxXDs9wG5FqZDY083kILWK3YvYT+LftSNPfUPMRRXbmLbpN2DHOy3EQoekoM4ba19EqpY2mlhpR/djPT+JJLKxkAAju5/iFzhXPFeGDyj6ZDQLdCHXsssTnns2H4ifxHjs8m/MaYWNmD2zQIXfBEE5qGUx26zuUO420yY8JnUREVS6SrWF2CfyKuuWM7pasXf6KIJnGbs48cgxi1OxYr7bqNToDtMOU+NxBYNbsQTDH4aslev0vmM3fJG51oLWFEmppDV0BfkPddrMZd1Z5JtDYzOq5EXTFbHN6USl0e8sD+OcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkeRCNNE6NO3vqwczH4AqDoKgpWiY9CwvYfF8dQKHvw=;
 b=KptddgDrLztx6yE0btN3c3hOqfLrJGiph8N8GqNbu6PEDTYKjnWAjawVd8DfNSgQcjA4FQEtWbXMKtyZgk2tn6VMwsdDmoUYcpo2u1vo49bvnDSk1BFyP2xfKPVnJOfG4NuYB17qOZLWNOUg4uLd1Lf8CfibwaDsUd4vV03zxQs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1.1 2/3] x86/build: Don't convert boot/{cmdline,head}.bin
 back to .S
Thread-Topic: [PATCH v1.1 2/3] x86/build: Don't convert
 boot/{cmdline,head}.bin back to .S
Thread-Index: AQHYUBya0e9ha5i+akWuF9Hg8XHktKz4v0CAgAAKD4A=
Date: Wed, 20 Apr 2022 12:47:18 +0000
Message-ID: <c62175f9-7b8b-5bcd-9d48-7bcd6c45f7e3@citrix.com>
References: <20220414114708.4788-3-andrew.cooper3@citrix.com>
 <20220414162739.7251-1-andrew.cooper3@citrix.com>
 <8d2c6196-cf87-dccc-a84b-8ace1c4f1a42@suse.com>
In-Reply-To: <8d2c6196-cf87-dccc-a84b-8ace1c4f1a42@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2f9146d-cb15-4564-cd0d-08da22cbe7a5
x-ms-traffictypediagnostic: BN8PR03MB4785:EE_
x-microsoft-antispam-prvs:
 <BN8PR03MB47853D52E5B845D62584916ABAF59@BN8PR03MB4785.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Zjm7VBhLmQzoSJGtDCwwuK604FTGe7hWnWyC/CrVXb0TAvElt4SBE5+EiW7kRkW0H/ogl1GpBUF4M5k/PzuzlTv61KGyV3gl21qlHjB5Vp+es5Cueemvl4CFCxkZZVuWMxqtt4YmVEJu8Re/gzPlY8akc5ovj+F5zAT6rGQLddCFlieZXdY7HRU3ZblsDY40jlhbJDmmEpJLEs5+56lv4+KpqoCmICN/NUj829JdhUDZ0Kgd0cDrI/gox+rcL5scRsXwfZoQvDKwi6ZVzXG14U8P47XJbLTpFEf8wyjsCT+j0GaxCKKGPuTJkSfzHnGCUDbeouOiIh38RIpF9E3wvAr+BPvAAgoTkjXrGWYUOYgK0+DiwEERK5k0dLZred/SOHyNXeSQbDTUuVaSP3vGNpUfpcw3HU6P89dEPlMsfTYPnkH54TCGggVHRJ3wzhb1NTXj843GdB/GoHa+wAT6gUcjlJlXigeUeNsgAmQ+oErYPTM2F0xLUKzSUulS+njQNtJPKVpDlFnPxlF0IUVNN9urLXJZyIHG83WrSwLDpQn51BYABfJkF7hI3XaOp688X5K8DHo27YOKmsKyaXDXxq+mrIFYSbAn2othOoE3F9YKnf2mRhGNAShc4G2ZMt1+jCTun4e55zaIa7gvKNSAZp8V7gagd6EhVwGnz6b81CMcbrKq4Hqt/22PEFeesREKuPFhR+vWwwQ5hKjuSb4PoDTw2iBJkLKM8hyWyA3hUpWoQ7nVZUv5Hp5aI3OcpqwemeF7/k/vgHhi4Vl11QnqL7XtVF3uEd/ON6/bDfYRDDs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(36756003)(31686004)(91956017)(64756008)(66946007)(38070700005)(186003)(6916009)(66476007)(122000001)(4326008)(66556008)(66446008)(8676002)(76116006)(86362001)(8936002)(31696002)(6486002)(82960400001)(26005)(54906003)(5660300002)(71200400001)(6506007)(53546011)(6512007)(38100700002)(508600001)(2616005)(2906002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkJpT2ZTTUJCbXdRTkFySTA2cWVJMjBJQWRKZVpUV0ltZ2Y0WGJCL2Zvd0F5?=
 =?utf-8?B?ZkUzVkdyMHlJV05SOWQ3SGRiWXJxd2lFOU1RZ1p4ZjNtak1mRHFqU1U5cFBq?=
 =?utf-8?B?TkdaWFJlRUE1NWQyY0FoLzRhS0FFZEFkay8rdVpuY3VvNUQ5VnF5dTBUNFpi?=
 =?utf-8?B?R1FoTHhIRDBuSmRFbWVPc3VKN29HdEhMSjJsbGlNTjZldEphazhMeWRsV1hh?=
 =?utf-8?B?UTladkRlakR3MG1kOE9EN2Z6Vlp6b2trLzh6WC9pV215dFpXOGJ6bEx6bW90?=
 =?utf-8?B?Vys2dVJWbi9NL1hSYUhDbTQxZ0lkYmFwVEJIMjBNWGNoQm4rQmpLYStZNmw1?=
 =?utf-8?B?L1p6eEt6V1JFdGNlM1hUUW9vSWF3dDVaTk5kWDdvZklSR3R3MjBWNEVDU09h?=
 =?utf-8?B?WWlJbWdUSDdCeUxJNFpxRjVSSGZTUGJ1WkFKRWlwVXgzWUtyTGtNZUlIdnIz?=
 =?utf-8?B?OEx0NVc0aEJ0a05DcnZRRlhBTWpOTk1UNGNQdUpudWUwcGVYZklFYVJsL2Rs?=
 =?utf-8?B?bXVrOTB5aW9mRzJPV1M3U3k2L0tIQlBndm5RdzVJcFE1bW5ZTFM0VndpZ3lV?=
 =?utf-8?B?UFBIbFlmWmRxNy95UVo2TWlKelFZakdnNFlObEYvM2xDMUNPdnlQZXJYdmdH?=
 =?utf-8?B?Zm05STFxeE5jWlV2YW9qRGErMG8xazd5V2NqN094RURCYVprT2FGWHI0T251?=
 =?utf-8?B?V3ZTcGpwTzlOZUhFb1M3Uzd1WUlIem02ckp2bExTY0ZKbXVWNlJNRE1nMGQy?=
 =?utf-8?B?K3hpNjYwR1EwODZEbVhuL1pZS29PYUVYaTRYRVJ2WjMwQWllbGU0YnMzWnc0?=
 =?utf-8?B?M0dDRU9ScTdqZ3laV0h5UXdlMjFQb3lpMzQ3Y0dIdW55VHFEd08zY3lwdVdu?=
 =?utf-8?B?VVoyQnZXYVlJYy9hM1I2R0h4Vy9LbzYwUnJUSlY4cW9kWHlQSlYvcEtmVTVQ?=
 =?utf-8?B?UWpqZldDZlJnSTNQd1VmWnhiYUlIU2l2amhiUitUWUo0WGhhS29wOGoxeDRs?=
 =?utf-8?B?Y1BCcjExTzN1cUJOdk9pazFVWFFRS3pzSEdDWE9tR1lJYmQyYk1ETmt6RUFh?=
 =?utf-8?B?UFljdVExc00xR1pWNUx3N3RUa2pyVVR5TVgvWW1zcW1kc09JNjk0b3dmRE5U?=
 =?utf-8?B?SVoxZUk1QU9JRzFoTjZvSTFHMjZueWh3NEtuaXF4M05JeTE4SDZNZjVQUDU2?=
 =?utf-8?B?UjBqbVg3YXphQkdlTTJwdVlBb3dwNTZZR0dEWnRTcFQxcjcxZFJUcEdURGs0?=
 =?utf-8?B?RmlhdWwzeUdUKzZqNHVTSlcwUVNJODRaSVJCemVMaEJiT05sWHBQc3ZjR1Y4?=
 =?utf-8?B?SG1YUnZOcmV2a1J0QlZpUUovWEpoRWZnSFZVN2FaR3F4T0ZxQnh5NEJSTkJE?=
 =?utf-8?B?bkpZSFVwc3lBZm5jZUVFanhBdDY2VVBWL3N6ak96UEN1VjE0aTR5WGhSYmNn?=
 =?utf-8?B?WDVYOExHNjF4amRNRHRDdjZ4U3ViMmRmTzZqWUxGYlhCYThwU0J5ZXYvaGFW?=
 =?utf-8?B?dThlR2M5SWRTUFVMaTErUzI0cWQ0RkpJS0lHVkVMR3VGb2FhcHA4SUlZVXJo?=
 =?utf-8?B?OVNwL1hTZTZ4TnUzYUNQTXJWL0krTFcrWlBxVTJDbVR0UTNjLzFCQnBzTHhl?=
 =?utf-8?B?L1pobXNYaEZmOEVRQjV2c05KT1V3VmQzSnVlaXh4RE84TERoUERER3VxUVl3?=
 =?utf-8?B?Z2dZMDF3WXhkNVJsSXRKemlEUnk2TXh0Z1IwcnRadFB1WmtyeEZ6eFNQcFlh?=
 =?utf-8?B?ZXNFWlJkb2g2Mlk0Skp5MUMzM2xQcExLSlVFaGltTFB1MmJXV3VnNU5IWXhU?=
 =?utf-8?B?a3ZPTGVaNTZHMi9zMjk0aWo1RHE1VkdsK2YzTzl2Q3MwNjRFb3ZzdnA2UFdn?=
 =?utf-8?B?aGJDKzk4d0R4MG50Mk42anV3VFBxUEZQOVhsUVM2a25sanNxL2dHR1B4amgv?=
 =?utf-8?B?T0ZWTFNCSHFrb0Vwb0VrbWRmUTRPOE9walAybGZkL3ZBUWo5b1FmZ2tITlFE?=
 =?utf-8?B?WGtsYVNqcnh0M1BnbUY2NmJQUjVrMG5oNU8wNHFoMkhWZE1IaWZ5WjhXYkRo?=
 =?utf-8?B?UFYreGQvNDNsN3RzRFZUNExIZ0QrS2tOeTdKZHF6d053N29uZUhtOG0zbEpM?=
 =?utf-8?B?K0s4Z1BLdW5CUzEzaCt1U1JnWEFvQzFaSS9uemROa29GdHV2anRqYWYxRUdo?=
 =?utf-8?B?Q3FvMTg0UUxVaUJPY2JkcVIwSFRaMlVJWEl4VU5tWFNMLzl2Q0h1a1pUbS9q?=
 =?utf-8?B?ODhETFg4N2NjTWdTS1piWW1tRVFLT0NwSkxUZmpvWkx6T1dSZHQ0YkhBaFhk?=
 =?utf-8?B?NEVHVmQ0K1libnlJVWNBejY3WGMrNE1Zd1hjWVBETmovWXNhNWhydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB652EC187A5D8419B9C6D1025FE70BD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f9146d-cb15-4564-cd0d-08da22cbe7a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 12:47:18.5829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzgv/WGmejji4ohRfCAxQA/sBH0XDTR2ohA6C1DxZvak970zkaqTAKigwZKJ+MGki8FEZLskkcg2zlQgOdISVQygB7kzVhl8v2jGKjJtjK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4785

T24gMjAvMDQvMjAyMiAxMzoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjA0LjIwMjIg
MTg6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGVyZSdzIG5vIHBvaW50IHdhc3Rpbmcg
dGltZSBjb252ZXJ0aW5nIGJpbmFyaWVzIGJhY2sgdG8gYXNtIHNvdXJjZS4gIEp1c3QNCj4+IHVz
ZSAuaW5jYmluIGRpcmVjdGx5LiAgRXhwbGFpbiBpbiBoZWFkLlMgd2hhdCB0aGVzZSBiaW5hcmll
cyBhcmUuDQo+IEhtbSwgeWVzLiBXaHkgaW4gdGhlIHdvcmxkIGRpZCB3ZSBkbyB0aGlzIGFsbCB0
aGVzZSB5ZWFycz8NCg0KT25lIG9mIG1hbnkgZ29vZCBxdWVzdGlvbnMuwqAgT3RoZXJzIGluY2x1
ZGUgIndoeSB0aGUgZ3JhdHVpdG91cw0Kc3Vic2VsbD8iIGFuZCAid2hvJ3MgdGVhY2hpbmcgdGhh
dCAnb2QgfCB0ciB8IGF3ayB8IHNlZCB8IHNlZCB8IHNlZCcgaXMNCmEgY2xldmVyIGlkZWE/IsKg
IEFwcGFyZW50bHkgc29tZW9uZSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBmb3Jrcw0K
YW5kIHVzZXJzcGFjZSBwaXBlcyB3ZXJlIGZyZWUuLi4NCg0KPj4gQWxzbywgYWxpZ24gdGhlIGJs
b2JzLiAgV2hpbGUgdGhlcmUncyB2ZXJ5IGxpdHRsZSBzdGF0aWMgZGF0YSBpbiB0aGUgYmxvYnMs
DQo+PiB0aGV5IHNob3VsZCBoYXZlIGF0IGxlYXN0IDQgYnl0ZSBhbGlnbm1lbnQuICBUaGVyZSB3
YXMgcHJldmlvdXNseSBubyBndWFyYW50ZWUNCj4+IHRoYXQgY21kbGluZV9wYXJzZV9lYXJseSB3
YXMgYWxpZ25lZCwgYW5kIHRoZXJlIGlzIG5vIGxvbmdlciBhbiBpbXBsaWNpdA0KPj4gNC1ieXRl
IGFsaWdubWVudCBiZXR3ZWVuIGNtZGxpbmVfcGFyc2VfZWFybHkgYW5kIHJlbG9jIGNhdXNlZCBi
eSB0aGUgdXNlIG9mDQo+PiAubG9uZy4NCj4gVGhlcmUncyBubyBhbGlnbm1lbnQgYXNzb2NpYXRl
ZCB3aXRoIHVzaW5nIC5sb25nLCBzbyBJIHRoaW5rIHlvdQ0KPiB3YW50IHRvIHJlLXdvcmQgdGhp
cy4NCg0KV2hhdCBJIG1lYW4gaXMgdGhhdCAubG9uZyB3aWxsIGd1YXJhbnRlZSB0byBoYXZlIGEg
NCBieXRlIHNpemUsIHNvIHJlbG9jDQp1c2VkIHRvIGVuZCB1cCB3aXRoIHRoZSBzYW1lIGFsaWdu
bWVudCB0aGF0IGNtZGxpbmVfcGFyc2VfZWFybHkgZGlkIChhcw0KZmFyIGFzIGludGVybmFsIHN0
YXRpYyBkYXRhIGlzIGNvbmNlcm5lZCksIHdoZXJlYXMgbm93IGl0IGRvZXNuJ3QuDQoNCn5BbmRy
ZXcNCg==

