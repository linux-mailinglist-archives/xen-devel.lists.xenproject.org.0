Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADC4AC77E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 18:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267314.461049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7qY-00053W-Qs; Mon, 07 Feb 2022 17:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267314.461049; Mon, 07 Feb 2022 17:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7qY-000501-Lj; Mon, 07 Feb 2022 17:30:38 +0000
Received: by outflank-mailman (input) for mailman id 267314;
 Mon, 07 Feb 2022 17:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaUt=SW=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nH7qW-0004zv-L5
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 17:30:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6740094-883b-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 18:30:33 +0100 (CET)
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
X-Inumbo-ID: a6740094-883b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644255034;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V4d6ybWiEa/Ld6eapg8aG+8Qyid761iXYUAw8ZLMYZA=;
  b=gq4wLSYjuOsCHSgS0WhhW3ZB6X2bCb+OUdGfnqGurvegZZcysE25XF+c
   Zaw+KQfJ4uNG0FppOY7hrfOVX0zCkHeE1oJrfiCoIFH4JSV0q9ptXRZGX
   ADf+WT5njFBEvABNIS1uqe32HIMKM3UrMv2+umVfKe7SA2CL4Os+UwI2L
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lwO0WcjaoKWZYHY8QbRIfeKjU8AuTdv5My/GvARdrlu0edbXU3/gOpuFUir5dvgL3hRGAr1jqo
 QYlrCMXFqcO1JVhrszjP0/XCOOeXLAhk2IjOlnUBKw9iSL6xtlVD0YZw4+sOTrkW6YUfZAWxjF
 kP4gg9aw/F00RNhBzaZ5LCIORO8F6jAecYw1231Rad+5aTaTLz0/Dov2o7gq1cZglkfv8NNBut
 O3a49nupQLEOYhO91lR/g1uvLNeltGq3VrNZPKt9uSwomOe0QQzMIp6AtteObXoTRRYL/lWEHQ
 TSTuhhDTATbE5vM5zT3huw71
X-SBRS: 5.1
X-MesageID: 63123714
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FjCL6atb3Tqvu4F5iY28wvzKZOfnVBhYMUV32f8akzHdYApBsoF/q
 tZmKTqGPqnZZGuhLdAnOty28RxXvpLcz4MyQQFl+3wyFisT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplvruecg04BqD1g+VaUx8DSwx7O6pN0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 JNDMmU2MHwsZTVGBFpKKokxrt2ipUKvcBFIi3KJtYQOtj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3AhyTgQ6oJCaa1sPVthTW7zGEJFAcfU1f9pPCjk1O/QPpWM
 UlS8S0rxYAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf67OVoDWaKSUTa2gYakcsUg8t89Tl5oYpgXrnbPxuDaq0hd3dAizrz
 naBqy1WulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdmmCwDhzdbaoXpeprljdtq5tKYCeRXDU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J/rmrwohZPaagVuWgjfxkxbq7obBe0O
 Be7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4gjqFfKsEy/hX1
 XKnnSGEVydyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXSMrlotfra8V+Mq
 L6z0vdmLD0FAYXDjtT/q9ZPfTjm01BnbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6/DP5X8CNgVQRxbAnA8yZ4O+6HsvxAH6bbiJF6rYSPO9YvF
 KJbEyhBa9wSIgn6F8M1N8Wk/Nc8JUj02Wpj/UONOVACQnKpfCSQkvfMdQrz7igeSC2xsMo1u
 bq70Q3HB5EEQmxf4Az+NppDFnu94ioQnvxcRUzNLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94r5QfFjGkd6HnXA6erkPyft4Wf+k5RLV/yFfG6BWTqsqrmif
 +hc09r1LOYDwARRq4N5HrsylfA+6tLjqqV01ANhGHmXPV2nBqk5eiuN3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOjKhGlCPT4PI5JFTByBV2pLfXA19POxSsiTBGKOcnOo0S3
 up86tUd7Bayi0R2P4/e3DxU7WmFMlcJT74j6sMBGIbuhwcmlgNCbJjbBnOk6Z2DcYwRYEwjI
 zvSj6venbVMgEHFdiNrR3TK2ONcg7UIuQxLkwBedwjYxIKdi69lxgBV/BQ2Uh9Rn0dO3O9EM
 2R2M1F4ePeV9DByickfB22hFmmt3vFCFpAdH7fRqFDkcg==
IronPort-HdrOrdr: A9a23:JfTnu6j/9966+237TjybFOSpTHBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63123714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfhrg1CYK/YY2MRKEGQqRtyj9fomHsB2X5cZMHdwBarl5T9vU5Q2CPGaug4lJ/xLRyvVTo+/Umbx9PCz+LB/TiCtDOxwh7AB/5rDFInoTWwwFYEssG5vHPhV6r9uahztjiBvMBkSY8+uTrYa56rjyitvmxOjyygtRmhb3ryL5ajoxF6fuv2XDv++UaGS11DlAj8sM2U4UD9YkOqIWovNsHInL5cWe8JEv4hdzp10ikZY8IpuDrDa4oUfqlrM4BlKxY0WXWKWdl/KPG9nThJqoDoKnAA5MkBN1vDiGuWHCZ3bLECRVXI5LShQNYK2pRdBWLKKNQOHYi5UuyTzcheMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4d6ybWiEa/Ld6eapg8aG+8Qyid761iXYUAw8ZLMYZA=;
 b=UGvHqpvp1rbGMZDZFMESiAyqMIES7NBzmAb7E799UzX/zj0ZZmPgjMSSOxUPERuwoqtGgPSerxF7fQVjkEnopzJo/mAk2fCdMfMTedhSQhFpxXgu5lg+ncuZLKrw/GlFGWfTIyn8YNl61Xt8zU3B16gVO4e6lnhppMoxwgL5pscdtPuX8xGQgezXZsFWaBI1Q+x3tgcSEQAPrQBJItRzeoHYdSAgymYWJZzk5u2xQzyBWDcwfqXqAz7UeE34qz1p0RXipzs2N5HzmUkAOe9cB58/YypWhuxK1+WCH+kmDGpAlNMxZs9ub/06WBy0w1VQo+X15qQAcbzwqODB9odepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4d6ybWiEa/Ld6eapg8aG+8Qyid761iXYUAw8ZLMYZA=;
 b=NctZVnC1YmUA/f3RgmcNYasdrfawzMfCo8jBJUe5amppQ4U4pyX5yV++ef7NrGogNQEuA0w/tk5R800U2+ria30Ze0ALltz11Iz4wq8XIZjwEVilZqoXw7SZ66AWqrgL11/U75kUdX7BgZpXzAHIl6ismdnXKyIRyp9WqTeuCN0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/smp: Speed up on_selected_cpus()
Thread-Topic: [PATCH] xen/smp: Speed up on_selected_cpus()
Thread-Index: AQHYGgY/F0hg0t0KmkKX/IIzwuTua6yG7rMAgAFuCIA=
Date: Mon, 7 Feb 2022 17:30:26 +0000
Message-ID: <456de888-c550-6abb-0949-9908a9b84425@citrix.com>
References: <20220204203115.13290-1-andrew.cooper3@citrix.com>
 <9a67c97c-0c61-ecee-067a-f1bdd0280b8b@xen.org>
In-Reply-To: <9a67c97c-0c61-ecee-067a-f1bdd0280b8b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ba82d1b-c840-4d89-fbf8-08d9ea5f8745
x-ms-traffictypediagnostic: CY1PR03MB2156:EE_
x-microsoft-antispam-prvs: <CY1PR03MB215672C951F854C760ABB424BA2C9@CY1PR03MB2156.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DeeCJzDUFdEGC8yrccgbSm/ce0Vbo3c05wfK6xQbl136b8IAeyoKVdDkNvhjcD2WzBTsOT04kKaQoZzTeCXpkvos5D9iTlilFwGDZzyMnJ7yQMn35zKeBiLy7EsrS3JnWp8km/tPwdSP01BXKRCUX6GHKD3ej5XG+54qoAWya9Q+8YYGlYxbBPzG41WmtUjEcG/Bl0pC/MM/Dr7NdS+1u6eWYkdu4kI3nxkNGv6aGNBrCSkBrQYy2dA2yjRG0IawZnEgHqSH7E03BFttX/S8kTFWkSxxUqRHwnRhduZOeILciwo9DC1cyr2OsTq2q0Cuco0fwYZUd+wfyojhO40tflkCazV1CkHChMoyYOw1+ziR/BfQ/sxJh4rRHLQKqNwJDrz/39trKHzPVyq5AIyxb64ulHUZo9pBw9JoW6NOseWN0niDkhsh1Gs6AROO3A+cAgKYrKT0in2Y1hqHqLI/NXpnHuzsCTceCVYEfpWzzIe4BMUiWhQg2t8sC7bgSL9DjH1xUctKnL07mZ7tc+KgOTeHebhnVP7+vVUS2hL54ivsPhku85QOunx5muyaJBUJ9QfIhoPpQfAQmzzBf+hIgav5cAsqh1v63wRLF/XiFbIMkdvqCCRr4zVsG7Wi8IdTPorkOMKWFcfOp+YjGA1PPkFvpV8oTzKzWK9KQgWHNihZM4ONzJ6xrfjC31O7OTQEK162xbYJR8OpvLWQkYgJcB8rOenkAkKQrkr3msxFYEpCKkaTMQWmlmsL5XOGE4ElK8P/f8aNmf+AlM0UDmFkGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(83380400001)(31686004)(508600001)(38100700002)(82960400001)(122000001)(316002)(26005)(91956017)(110136005)(53546011)(66476007)(8936002)(66556008)(66446008)(54906003)(186003)(38070700005)(36756003)(5660300002)(2906002)(2616005)(66946007)(86362001)(6512007)(31696002)(71200400001)(76116006)(4326008)(8676002)(6506007)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXE1anU3U0hlTjlRdTNFU0JNaEdlRWI2cXBpSFVwM21oN0ptY3FqYzNwZkFy?=
 =?utf-8?B?TE9RSjFxNzc5ays4eHU0cTdOT0wrSit4dFBTbDF6TWMwb0dsWGplaXRaOFI1?=
 =?utf-8?B?ek1ERWF4WFo5bVhUdUZtQ25xcGZLMnZEenk0ZTJXaXdXWUJqUCt1U2N3cFpX?=
 =?utf-8?B?b1lFMWFvdUlQd2FmY1RlcUFkN3ZWbUNrZ2crOXFnVU5hNTVFMHVkV0RoSzVq?=
 =?utf-8?B?ejIxNUZiaW5FVThpK2grMlhpUXZGWnkrb0QxWG1OQW1uN0FkU1g3TjZKb21S?=
 =?utf-8?B?YnVJL0ZtaVZwV0gvUTRvYVlZUjFNcTFQVU1MTDh3M2I3KzB3T3lNa09XemFr?=
 =?utf-8?B?V3Z4Y3NXZ05nbmNoaWppanpOSm50Y2x0QWhoTmM2M3hkWXNvaXlaSFVjUy8z?=
 =?utf-8?B?bHVGc05UU3J4RXF6VEZLSjBVa3dHQ1Q1QWNucXlyZncwWGorU3RVNHlFdmR0?=
 =?utf-8?B?SW9rTHIwbnB1YU9TdFdNNExyY3Q2RjdUQ3BlWHJHZ2pMQmgzMVlDTTFGYmZV?=
 =?utf-8?B?U1EveGwxbktXenA2N0R0eUJadlN0czhRY21jeHJwVUlWSWc2bHZwcVlETHBJ?=
 =?utf-8?B?NWhDOVRTbVpKS0FxNlBVcXJRN0tGOFpsY1hSRU1ydkZoTmRKOFdEamtwd1JO?=
 =?utf-8?B?U2l0TlFQRHpEWHgvOHByeC9uZDc1b2RSK2xXUFdueEowQ00wMURtUHNSeWhU?=
 =?utf-8?B?bmRjT0M3SWNlU0xQUlJxOERiaDRYSWhPdFgydGtPbzZQT2xNdVAwSXp5a1RW?=
 =?utf-8?B?R3FoOU5BRkhJSlhQajZVSUJwT1k2WXpXTFRtb1dpWE52STFsVWZKV25BdENi?=
 =?utf-8?B?N2UrckwzWW9kTVFvM2ZDb1MrZFdBeDhaK3BwTlRUeU9hUjBUWFhwLzVTZWto?=
 =?utf-8?B?bjVkMVRTMjEyWXNrdmFxN3JNUWZ6SmFlMkVmaHlSb0llTkNsZmwxd29vUHVt?=
 =?utf-8?B?eVc4azBaRlp1aHhDTGdFbld6WTNaWXJrN1g0RTB2aklPRWtMWS9aam1IOG1k?=
 =?utf-8?B?MlJweVF6SDNOSU5LdVRnVnVodm9RL1VpS0tTVEJCSFFPdWRoa3l4Qm9EWEFP?=
 =?utf-8?B?bGdxcGovVE40TElPVmtnMndUU2txdVFyNDFwN1dpR3NtSk0rTWZBL3ZMcGF5?=
 =?utf-8?B?ekFWM3pkYmE2Z0kyRkFWNnovR2VZeXFxMDlwV2pNTFNkZFZ3QjFXb0hiZnl3?=
 =?utf-8?B?QXBYRzNTOGdzY3c4Y25iazB6M1lKVExTZ3dnc0VIbFRYZjB2NVRNZFA1QVdm?=
 =?utf-8?B?Y2k4aThQenBIYjlCUVZ5L3ozRHZ1TFRCTE5zN2J6OXhkY1lWb0pCeG9LRk9h?=
 =?utf-8?B?STBwb2dVWjVKWCtlTE5KbklTc2xiOHFPTHNaYTdVV0pQNFpsbFpsWnZMc1N6?=
 =?utf-8?B?QXIwZ05nT05QQkxmcG9ac09WTmhNelpqckFxdXhVN2svazY1RWd3dm16ZUxB?=
 =?utf-8?B?RXk0ZUJHMEczN2F0QmNDbmRZSG1MY2FjWGdaVk9taVJpRWt4blNYOUxNZVBQ?=
 =?utf-8?B?OTNVZ0p4a3BxVmlmeVZNTWloKzRuOHVOcU1HVk00VTM3bzgrUlRrM3VzbSts?=
 =?utf-8?B?RjJpY1EwVlg3Yk9GTytGaEl0RzI0RHdiUktiMGk1Zlk0N2FBNFZTU2tJYU5O?=
 =?utf-8?B?bllnMFZlQXpEcTNqSVI0ZkZKczF4U1ZGYUF1RjAxRGI2Y3NzbjdKZXNTTDJ6?=
 =?utf-8?B?Vy9oOE9GYys5c3VUdzJOc3dmSnYxRlRKVEFWRUZveWFEQWdscGp4ZWk2b3dZ?=
 =?utf-8?B?ZXZ5SXJIdWdjeitmRXYyZjYvTXlsekkrT2J6U1ZhRUpUVW5JNmRVTzgvTUZ0?=
 =?utf-8?B?VW1QalUvMnRXNU9HYWhOSjRNeHJTaWhSYW5QeGZ3emowQ1Rra3BtZncvL3Ft?=
 =?utf-8?B?OGduU3VFaW51TnJyVXZNcGtNY3c3c1ZLV21UVGREOWdoMjZRUE8vbkx6aDRY?=
 =?utf-8?B?emh2K3dyU3BKQVBoK3ZvYytUTVp0UFl5YXZNZ0tWeDhqaURFNmYwOXhOM09X?=
 =?utf-8?B?cjNDd29JOHAvZXpUYituL2w0Sy9Zd1dLSWVYYkN4OUgxeENIblRrNzRnVTRM?=
 =?utf-8?B?RkNYUW96QmNFeUc5TzI0U295dVVkT2t1R2prd205a3BVYXhxSGh4TElidTV0?=
 =?utf-8?B?c2E3Y1IzK2JJcFBoV2piTVFhemo0NmQ1MndjYTFzVEtZdjh6OGM4RFJoTmEz?=
 =?utf-8?B?Zk5aZUFmK0szc3d2bDZEQXBPTXZMUHgydW9xVlRXcFpWU3l0WTh5M2VEbkVX?=
 =?utf-8?B?ZTE4dzgwL3N4dWxXeHZWS2MvUHpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <291715F8E02CD744A98269F125804E96@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba82d1b-c840-4d89-fbf8-08d9ea5f8745
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 17:30:26.1001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bP7pOqtL6vTgceKGCmGtDmvM284lRTjACqIUEuN3//vjvJWbKm2+YSStLZ1xjDHL1GEYumzqPIQpk6zyIqZH8fDXhpVBJGYGwDbepPwluAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2156
X-OriginatorOrg: citrix.com

T24gMDYvMDIvMjAyMiAxOTo0MCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MDQvMDIvMjAyMiAyMDozMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IGNwdW1hc2tfd2VpZ2h0
KCkgaXMgYSBob3JyaWJseSBleHBlbnNpdmUgd2F5IHRvIGZpbmQgaWYgbm8gYml0cyBhcmUNCj4+
IHNldCwgbWFkZQ0KPj4gd29yc2UgYnkgdGhlIGZhY3QgdGhhdCB0aGUgY2FsY3VsYXRpb24gaXMg
cGVyZm9ybWVkIHdpdGggdGhlIGdsb2JhbA0KPj4gY2FsbF9sb2NrDQo+PiBoZWxkLg0KPg0KPiBJ
IGxvb2tlZCBhdCB0aGUgYXJjaGl2ZSBiZWNhdXNlIEkgd2FzIHdvbmRlcmluZyB3aHkgd2Ugd2Vy
ZSB1c2luZw0KPiBjcHVtYXNrX3dlaWdodCBoZXJlLiBJdCBsb29rcyBsaWtlIHRoaXMgd2FzIGEg
bGVmdC1vdmVyIG9mIHRoZSByZXdvcmsNCj4gaW4gYWMzZmMzNWQ5MTljICJ4ODY6IEZpeCBmbHVz
aF9hcmVhX21hc2soKSBhbmQgb25fc2VsZWN0ZWRfY3B1cygpIHRvDQo+IG5vdCByYWNlIHVwZGF0
ZXMiLg0KDQpUaGF0IGNoYW5nZSBzaHVmZmxlZCB0aGUgY29kZSwgYnV0IGRpZG4ndCBpbnRyb2R1
Y2UgdGhlIHByb2JsZW0uDQoNCkknbSBwcmV0dHkgc3VyZSBpdCB3YXMgNDMzZjE0Njk5ZDQ4IHdo
aWNoIGRyb3BwZWQgdGhlICE9MCB1c2VyIG9mIG5yX2NwdXMuDQoNCg0KVGFsa2luZyBvZiwgdGhl
cmUgaXMgbW9yZSBlZmZpY2llbmN5IHRvIGJlIGdhaW5lZCBieSByZXdvcmtpbmcgdGhlDQpzZWNv
bmQgY3B1bWFza19lbXB0eSgpIGNhbGwgdG8gbm90IHJlc3RhcnQgZnJvbSAwIG9uIGZhaWx1cmUs
IGJlY2F1c2UNCnRoYXQgcmVtb3ZlcyB1c2VsZXNzIHJlYWRzLg0KDQoNCj4NCj4+DQo+PiBTd2l0
Y2ggdG8gdXNpbmcgY3B1bWFza19lbXB0eSgpIGluc3RlYWQsIHdoaWNoIHdpbGwgc2hvcnQgY2ly
Y3VpdCBhcw0KPj4gc29vbiBhcw0KPj4gaXQgZmluZCBhbnkgc2V0IGJpdCBpbiB0aGUgY3B1bWFz
ay4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPg0KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9u
LmNvbT4NCg0KVGhhbmtzLg0KDQp+QW5kcmV3DQo=

