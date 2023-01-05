Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65865F71F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 23:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472220.732370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDZ9l-0005kk-Jb; Thu, 05 Jan 2023 22:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472220.732370; Thu, 05 Jan 2023 22:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDZ9l-0005hL-Fn; Thu, 05 Jan 2023 22:56:17 +0000
Received: by outflank-mailman (input) for mailman id 472220;
 Thu, 05 Jan 2023 22:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDZ9k-0005gy-DR
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 22:56:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 257e7de7-8d4c-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 23:56:12 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 17:56:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6085.namprd03.prod.outlook.com (2603:10b6:208:308::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 22:56:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 22:56:06 +0000
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
X-Inumbo-ID: 257e7de7-8d4c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672959371;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EScHE4GWpXVuFvg/BK0Zc3NxeCBO/9KiCKg60f4Y4Fs=;
  b=PwqXqPRUrjN0hOSYjQX8b4MUv8MuFxEI8iMRzhltjL/5r9WDd6b7Or/6
   VhE+uTKQBc2I6KcIttJI9et+v7Wd2nQWDRxQne2jSOnI8PmYUqlp0doPj
   SglVvyq4e2dAINd6OmCn8sh8bgz40T3/i+CYoyu8+1/z8oZEEz38qPlou
   o=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 91392351
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DAMSgK7IbAWrD2I5bCUMNgxRtBrGchMFZxGqfqrLsTDasY5as4F+v
 mUXUGuHbvaPamf8eNp+bY22phgGvJ/VyYcwTgRr+Xw8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakT4QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 sUGESgLYAu/hs29nJzlFflH1/k6FZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOWF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNLT+ziraMz6LGV7lITWB00CwacneCgmES7C+lkc
 mo72yV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsSAIE55zppt41hxeWFtJ7Svft05vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:ZJ/PeanNlc1CGxls72udf8RkKKTpDfIg3DAbv31ZSRFFG/Fw9v
 re/sjzsCWetN9/YhsdcLy7VZVoOEmskaKdgrNhXotKPjOGhILAFugL0WKF+VLd8gLFmtK1vp
 0BT0ERMrPN5eQRt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91392351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGrHqgA48/q/GnbuXAUJNU5v4Lr4AHey98FaXcRsoaNR5C85lI/vLV8/y1C+fI73yFbGdwhsf/GC3yVfDQRFr/9bZrIerjzuGw9kzLeWKb+Gqc0ZG29GGuVWXhPD46kyei9ipYWMfzswim8vi9ZMhP08D2gt0ARrl5WQr/S/NwYXZrH7uSNuR3W+KCgQ9uk8pqxXGjfmJehDzK1+glEo/MX/bJ5l9BQZsBSzcx1HCpfqLENnIy42fi58n3S2BnF9y13JZ+4yCn2ev6DiuXuPxbmrbJcWfdXosJ/8aIpYl0jpfmQxXhFBTrgThd4L2koAntzBdqWsWtayyBv786hSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EScHE4GWpXVuFvg/BK0Zc3NxeCBO/9KiCKg60f4Y4Fs=;
 b=oL1Obf/k1M2j1qROlt5u62Pfofq83gWPzaInltwyHH92kX4/erGjiN+bACrjzWUyFzszth4p5sBbTqf5Tbv8nwR2/kURWH+Kax9skiY8tqgkVq0yFejVkBtJExxjJF2OqL+9v75bcFosAY5qeZpZbveDJrhc/MokBXXv33qfAJaAVCeGSL0PGQOIlV6vFpJPh8dvSFXntlBZDV+ZiPx0J3J7TvIVB8jyjasJanqy7ImJ0MCYtqJ2Are4LNjcs3rCYD4XfUbC6DERZPmMxm1lCq/K/kErHht9xjBRCtHC+9lvJZFyGa6HJ2ql1pILG8TEJonVa/EwCrKHEeaFM3yGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EScHE4GWpXVuFvg/BK0Zc3NxeCBO/9KiCKg60f4Y4Fs=;
 b=aKnTcDpFQ7ScJlOWezra+VaPRKa2VoXhWPas/h9VWJxRsFDSqeqqfBdKLQOlCkWevLkWBjtIovMRT91z5tV5dGPpaWC+1203gb8hkAyJj6crORgVBsW8YE3jNXeF54eXx2X4IZ/Q/ppnKqjcA7EhJCwAaI5a08evgkY2pZGcOgw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/ucode/AMD: apply the patch early on every logical
 thread
Thread-Topic: [PATCH] x86/ucode/AMD: apply the patch early on every logical
 thread
Thread-Index: AQHZIQhyMB1JmOs75E6HWYrcfqEv3a6Qb7eA
Date: Thu, 5 Jan 2023 22:56:06 +0000
Message-ID: <55cccf9d-e4c9-6dec-ee9d-fec56f521931@citrix.com>
References: <20230105132004.7750-1-sergey.dyasli@citrix.com>
In-Reply-To: <20230105132004.7750-1-sergey.dyasli@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BL1PR03MB6085:EE_
x-ms-office365-filtering-correlation-id: d2315998-d0f7-43fc-ad13-08daef70072c
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zSZLrQe32GMJM5yqYe+oiiWsJpOit+mViJoZRZb3yFHEY4AF5Ar6XTbZ3YO+uIg/vA0C2Ba/YhbAECxW5qhmz7tc3woVHpiso+DURo487nuCG3lxJ9jwpaAc1rTa8rCe90iUFDQz8fWlviEsw2zaH7+WXZ3z5Q2SOh4l+fnk+rNQGIQqiY4VvpTodlhi0kYk2dnJYgD7PgmDprkh4Ipk3rk1wNfYbW+nuOPcB03W6TR/yzzfhzi1jMX/REUUpmXnx17prPXsUWFDeNzO3wUhe+xpH6askyp+dKPzRpG+Ut8IgbuMbWEdnfjQASRjTr3+dYGZQaornpxjPkze68mTlY1aunX+5jd8hHfSPNozXj6b/6M7UbYay/gUHU3zlNTcOLMwRJ3bKNZjN8op8QptHAm3OlB/7ospxkYJT+Z0zTkqZjL1zhGGpGGBPb9mAQH2D0VAqGpGNpK91NHLohrTUkad+LE46WttvPRJy28Y87T1hsIoIr/5KNSYRqk5l+qlrUKedQP1OWrm2ZbbMOOY1a7gYyDtcs7ECc3VsY28MLayTXzrtbpn0UAzyThCKpb7OCbAz5Aj9ouWbQs4IVTmhzxFvwl0g3Mhu3ZARhk3EJk+oBQr/4xLiEhRt0eAaiVwH2mpgTY9tAEc76yGKqKwY09Z51/Yhee0wgTJ8WjPq5Wr+fq+JfMasRyLG0qMgLQihrLWMFKJX1KrL1ipnAYFhyUQtSHWdyedSgTYmnDVpk6cI3ocPdi/h5BMvisn3QWn9OfhFXGhOGkMry6SrCkyMOSy4cCTbmaH4qzc1Swgpi8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(6512007)(53546011)(26005)(31686004)(478600001)(2906002)(6486002)(966005)(71200400001)(6506007)(186003)(66446008)(76116006)(2616005)(66476007)(64756008)(66556008)(91956017)(8676002)(66946007)(41300700001)(110136005)(4326008)(316002)(38100700002)(5660300002)(83380400001)(36756003)(122000001)(54906003)(82960400001)(8936002)(38070700005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U1NCYWxqZ0FiNWl5enJ2aWhIWjFPUTRrUEJUa1dsTUhqbkdMZ2JBWVdDa3hl?=
 =?utf-8?B?b2xYajM2VTBoN3dwOGlGUXQ5S0Z1TE84NXpzcUdpT1d2RHFhWEJZdjJFczho?=
 =?utf-8?B?UjF1Q28rL1Y4Y20yTXdvOFpGOFVScDlKemJVeHNyTmY2NFJ2UFluZjBGY2R6?=
 =?utf-8?B?bEY3ZWNSNkZwOTM3Qm9LaDB6K1lCSG85eitzOHNUUjlrQUsvWGhCaUdxWnFN?=
 =?utf-8?B?eGV4b0RlZEJrRzBUTzYwenNwTjRUZ0Nuc1lKd2tUUHpya1lPSWIvbmZ1cUl4?=
 =?utf-8?B?dktLZnNNazFiUmxSTmMyNE1RdlI1OVo4L3NYczRkUllaS2JieHV6VWp6SCsy?=
 =?utf-8?B?cGd0aGllb2JZV0o2TTZRVFFURFdrdVRHSEZQS1A5anY2MW1sZ0QyUW9rclNy?=
 =?utf-8?B?aDF5VTFPMmd6cFpsak5sNFVJWGhLeXpKZnp4YWZYT3A3RmRBNHl3Uk11L2Zz?=
 =?utf-8?B?NTNwa3JvMzRqRXhvMEZQWUw4TDRBK3crVTUrd0RCeEVEbzFTcXdFN0FiVGth?=
 =?utf-8?B?SmMyYzI1VDlSRWV1Z1BlMEtQdHBhSWN0Zkh6MStaY3o0YWZvVzhkamZCenM3?=
 =?utf-8?B?SitnOW1pSjlQZ2NZdGpHeUUrL1BTM1RzUlNrVy9lRk8wWEdRbVRpK1NNSDM1?=
 =?utf-8?B?aURSWkdWOWZWYm8wajhwcGdId0VGSVBMZElBQXlpTXp4ekFOQVZ5Q05udUdB?=
 =?utf-8?B?OEVEMTRnOG5MNm0vWXlGNHAvUmROcDllakRNZXR0R1p2ZUYva0dWK3FUYi9T?=
 =?utf-8?B?cGFIVVV3dkNINWU1c2Z6VU9zK3ZtV2JKR2VkR3Fvek1DMDd1OGRVL3ZBSEVh?=
 =?utf-8?B?QzlaV3hYK3M5L1Z0ZjlubkVOQ3c1MHJRQSt3d01oL2F2WUNzTHIxWW1kMldW?=
 =?utf-8?B?WmVGQjdSdGhJQzBacjZteWhXYWRzVDc1a0R3ZTNNTUk3RFJtU1hDSFFKL1dn?=
 =?utf-8?B?aDFLNmxnUFJ0aUZUQXkxSjNKbUUxbHBvOTlUVDJ6N2IwUnVoUEtvS2hUeVo3?=
 =?utf-8?B?Wk42cFNjR1VMaGh5TVRmdEtpT2ViaTFYd3JLQ09jQzRSY1FIYUFJcDVpMENZ?=
 =?utf-8?B?WGN2VDM4R0ppdE5mbm9uUWZibklMYnJIQWdiQktuam9sK29zb2ZzaWVXZzRm?=
 =?utf-8?B?ZldRWDg1YjFCY3RWVXNRY1NnVzdJd1ZoSnd1YlF2NXZybTFiaXE4VnFVOUJv?=
 =?utf-8?B?bTFJcUxjektydTJTUlFlRHlTeTVrNGRHbFhqV0t1dnhURDNCQUZQdmF4cDRn?=
 =?utf-8?B?dGFESG1DcXpPenREWjlCenBtaG9GaTl0b1FFVjZZN2x3VU94Z3JDOGFScVVH?=
 =?utf-8?B?dWM4dzVtSXBKUWlJeHFuRFovZzFQaitMWlF4VUVzV0dyT0p1THM1SlV0U21r?=
 =?utf-8?B?TlI1Zll6Z1pxQ2ptemtZSThybHJJb3dHU21tUjJCT3R2V2w5WmdadWNiMmdu?=
 =?utf-8?B?ZFFvSUNBM1VSZk1nWTN3ZVdOT2Q5Ymt2aCt4YUlSVWlQbHg2SVBFanhUQ21Y?=
 =?utf-8?B?QW1hUk1rdXpHa1VpM3l5YTJKajFqZnpEcVUvQnkwRmoyRmFINlpyYWNYem9S?=
 =?utf-8?B?cDR3RzFxa3M0RzNiSlg3UlIwRERpZk9IbENQaXBWeSszVDlLZjlBbXpFbWtz?=
 =?utf-8?B?RXVjYmhVNUJOMTg5d2pGZWNzMWkyYTJ6T0w5TStLMmpQM0ozY2hqSU5SMjJu?=
 =?utf-8?B?TkNYT2x1N0Q3TEpTZVIyTjhNSmR3MzBPM2tWTG93Ky9zWWs0NUQvMWlpaW0r?=
 =?utf-8?B?VXk4cXB6dENwZmNoZHROWmNvQXhjaGlnNkE1T0FFVm4vR05HVnh4a2NLVVhW?=
 =?utf-8?B?VlFRNldYUzZjR0RWUDEya2ZvdzdtRy81QnFWNEtLL3p3NkpLWGttM0dHTnNJ?=
 =?utf-8?B?NmNXc1pNMDJuakFXYWdKYml6Wm9XOUNWOFpvQkd3b0RQYm8vRTlWT00vbW1F?=
 =?utf-8?B?ekJHOU4xMkMrTGNpTmRWeWw2bUZQYURJcWlSM2JCMFlEUDB5a09JcktXcklF?=
 =?utf-8?B?Wkx5VkpyVWs3YnhoWDhvaVRxaW80RXpqekp6ZkNtRlNnMm1lWEF2NzVVaElk?=
 =?utf-8?B?MU5xdDhZOGRZcysxS045UVhwazVEQk9HaERqdk9QVUxUbUZFWXNnK096MEx0?=
 =?utf-8?B?Y05ram84Uk5VcUZ4UnB0VWRCWFRZbHl3UzFTcWFlaTZRb0JKeU9sNjFOZFJU?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC394087C5200443B58C720CC23E9CDF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZlOgr2EL7jQC8BCa0cqfjfQnJLDZgt9remToFQZWQC4zR7mcZddzrcQzphcI1sPThe0lv6NnHBwzwWpzAQxXgKvJp9gi/FFD4g8RL0OEGPL2brqEDwMtnLN/d+IZWwRhTJG2gCQ7g6yGGkhjwGB5v8gaOMiijR8g9yqv2fQ/IH8eSQ3lUk9gC7AY++tPUXuLNk3oZmvojiH4q2hj3G8Sj8XSmU3ajbV5HccpeExzRpmjq6fc0m/gLI+MyqI7HqQr2FdWElc+EjOKDb/ZXN9eCci2iG/tKFP2UeqhGmif1/drr3Fy6BHSL/o/9iRzEVFzp/1f9ZOYpuPqQaYg0zyJlyA+/NqXRLe9ifhzVP15ff13dJ1/aj2XKg3fxWQ+TTHKQKoPLZQDrXhSPncRRY7JlJkwPdTOwTx9pk3LfP214fTjaxC/xIAkCazj2+wJ0KhxT+Gdyo/lL5BrhXGGnbYx2xiaofOdNLoxuX8YvD8P7dbOYcSI4wWhfMWh1zDuMp8/KeSaJmze68WBacIlX8AQkEeVfSej7TenOn9EIphbpyjze0NbNzCn9uTS70VPGcHD6pZ5lOap8lwYQXF2h3iTL10CbE/2HGEMN9CgXo9SgvhcB2ZyrLAAuGiuZylvGQzIX3JZGBitA1xPKGQVCKzHVz8rzL053fiSLYVnocpoaN9U7hmDYJk5XdtNIXTWMog8f1oE+3tt2YiwUgfLBB9Xe+y7gdn+DknyKFu4p6nZyL2f93UN04u8T0VJUzQbPEKSbTkYWX+TriR4BcbMCR6pVBVK+5t0FfqUGOB6C+52O8PJ2mbXZZEfhrucgKLrZ81Q
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2315998-d0f7-43fc-ad13-08daef70072c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 22:56:06.1934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFs4yesNkYEDDl0KywZZpeSR6zPhUVGwG67/ZtiLbBiQ4IErxL4ZIyajX8EfJK5ojbLE/HZfJZ1dWN2lQxdVFn1TB+2jti+f2u+7a/7N1OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6085

T24gMDUvMDEvMjAyMyAxOjIwIHBtLCBTZXJnZXkgRHlhc2xpIHdyb3RlOg0KPiBUaGUgb3JpZ2lu
YWwgaXNzdWUgaGFzIGJlZW4gcmVwb3J0ZWQgb24gQU1EIEJ1bGxkb3plci1iYXNlZCBDUFVzIHdo
ZXJlDQo+IHVjb2RlIGxvYWRpbmcgbG9zZXMgdGhlIExXUCBmZWF0dXJlIGJpdCBpbiBvcmRlciB0
byBnYWluIHRoZSBJQlBCIGJpdC4NCj4gTFdQIGRpc2FibGluZyBpcyBwZXItU01UIGNvcmUgbW9k
aWZpY2F0aW9uIGFuZCBuZWVkcyB0byBoYXBwZW4gb24gZWFjaA0KPiBzaWJsaW5nIFNNVCB0aHJl
YWQgZGVzcGl0ZSB0aGUgc2hhcmVkIG1pY3JvY29kZSBlbmdpbmUuIE90aGVyd2lzZSwNCj4gbG9n
aWNhbCBDUFVzIHdpbGwgZW5kIHVwIHdpdGggZGlmZmVyZW50IGNwdWlkIGNhcGFiaWxpdGllcy4N
Cj4gTGluazogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTYy
MTENCg0KQnVsbGRvemVyIGlzIENNVCwgbm90IFNNVC7CoCBUaGUgcmVsZXZhbnQgcHJvcGVydHkg
aXMgdGhhdCBib3RoIENNVCdzDQpzaGFyZSBhIHNpbmdsZSBtaWNyb2NvZGUgc2VxdWVuY2VyLg0K
DQpYZW4gaGFwcGVucyB0byBub3QgYmUgaW1wYWN0ZWQgYnkgdGhhdCBzcGVjaWZpYyBidWcsIGJl
Y2F1c2Ugd2UgbGV2ZWwNCnRoZSBmZWF0dXJlIG1hc2tpbmcvb3ZlcnJpZGUgTVNScywgYW5kIHRo
ZSBMV1AgYml0IGZhbGxzIG91dC4NCg0KDQpJdCdzIGFsc28gaW1wb3J0YW50IHRvIHN0YXRlIHRo
YXQgbG9hZGluZyBvbiBldmVyeSBsb2dpY2FsIHByb2Nlc3NvciBpcw0KdGhlIHJlY29tbWVuZGF0
aW9uIGZyb20gQU1ELCBhZnRlciBkaXNjdXNzaW5nIHRoYXQgYnVnLsKgIEJlY2F1c2UgaXQNCmNv
bnRyYWRpY3RzIHRoZSBjdXJyZW50bHkgd3JpdHRlbiBhZHZpY2UgaW4gdGhlIEJLREcvUFBScy4N
Cg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oIGIv
eGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oDQo+IGluZGV4IDczYjA5NWQ1YmYu
LmM0YzY3MjlmNTYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL3By
aXZhdGUuaA0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmgNCj4g
QEAgLTcsNiArNyw3IEBAIGV4dGVybiBib29sIG9wdF91Y29kZV9hbGxvd19zYW1lOw0KPiAgDQo+
ICBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgew0KPiAgICAgIE9MRF9VQ09ERSwgLyogc2ln
bmF0dXJlIG1hdGNoZWQsIGJ1dCByZXZpc2lvbiBpZCBpcyBvbGRlciBvciBlcXVhbCAqLw0KPiAr
ICAgIFNBTUVfVUNPREUsIC8qIHNpZ25hdHVyZSBtYXRjaGVkLCBidXQgcmV2aXNpb24gaWQgaXMg
dGhlIHNhbWUgKi8NCj4gICAgICBORVdfVUNPREUsIC8qIHNpZ25hdHVyZSBtYXRjaGVkLCBidXQg
cmV2aXNpb24gaWQgaXMgbmV3ZXIgKi8NCj4gICAgICBNSVNfVUNPREUsIC8qIHNpZ25hdHVyZSBt
aXNtYXRjaGVkICovDQo+ICB9Ow0KDQpJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBjbGV2ZXIgaWRl
YS7CoCBGb3Igb25lLCBPTEQgYW5kIFNBTUUgYXJlIG5vdw0KYW1iaWd1b3VzIChhdCBsZWFzdCBh
cyBmYXIgYXMgdGhlIGNvbW1lbnRzIGdvKSwgYW5kIGhhdmluZyB0aGUNCmRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgdHdvIGRlcGVuZCBvbiBhbGxvd19zYW1lIGlzIHVuZXhwZWN0ZWQgdG8gc2F5IHRo
ZQ0KbGVhc3QuDQoNCkkgbmV2ZXIgcmVhbGx5IGxpa2VkIHRoZSBlbnVtIHRvIGJlZ2luIHdpdGgs
IGFuZCBJIHRoaW5rIHRoZSBsb2dpYyB3b3VsZA0KYmUgY2xlYW5lciB3aXRob3V0IGl0Lg0KDQoN
CldlIGRlcGVuZCBlbnRpcmVseSBvbiB0aGVyZSBiZWluZyBvbmUgdWNvZGUgYmxvYiB3aGljaCBp
cyBhcHBsaWNhYmxlDQpnbG9iYWxseSBhY3Jvc3MgdGhlIHN5c3RlbSwgc28gTUlTX1VDT0RFIGNh
biBiZSBleHByZXNzZWQgYXMgcmV0dXJuaW5nDQpOVUxMIGZyb20gdGhlIGluaXRpYWwgc2VhcmNo
ZXMuwqAgRXZlcnl0aGluZyBlbHNlIGNhbiB0aGVuIGJlIGV4cHJlc3NlZA0KaW4gYSBub3JtYWwg
e21lbSxzdHJ9Y21wKCkgd2F5IChpLmUuIC0xLzAvKzEpLg0KDQp+QW5kcmV3DQo=

