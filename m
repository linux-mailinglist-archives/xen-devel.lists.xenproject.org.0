Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426C4DA187
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 18:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290913.493552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBF3-0007Mi-Ba; Tue, 15 Mar 2022 17:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290913.493552; Tue, 15 Mar 2022 17:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBF3-0007Kt-8N; Tue, 15 Mar 2022 17:45:53 +0000
Received: by outflank-mailman (input) for mailman id 290913;
 Tue, 15 Mar 2022 17:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDZV=T2=citrix.com=prvs=066e9a523=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUBF1-0007Kn-Ps
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 17:45:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf3cead9-a487-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 18:45:49 +0100 (CET)
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
X-Inumbo-ID: bf3cead9-a487-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647366350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tdqwOLsydB3QGIE8UtWDUhYHs6hDV7qNDrCkFHQ/LMU=;
  b=Wsi9gd2KGardq+P5RRZLAIDHuTQc10tvyr1WFvs5nV4OvbKPrfLXkXDJ
   UC+KRSdFTao/pkx4hvq4KkgKN1v9r5X3oei+QYxi5eaRC9MrxO3HsMi8B
   oHQ9u1FplJ0WhC58bUntV60PaVVc426MI+d5s9CqI9vYiec8UjzH51F9z
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68673786
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zFNvF6s9ZXuK92LLrs1yA9ffMOfnVN5eMUV32f8akzHdYApBsoF/q
 tZmKWGOa6nfYTbyL48jaoTi9UgA6sKBmoRlTlBo+Xw2EC5G+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jU5
 IupyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8bJ6aRlusUSiVWLB1SHKkZ/5XJYlmW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQ/MkubPE0RUrsRIJJuvuL1nFXOSGxdrn6Qorpt+0vC7TUkhdABN/KKI4fXFK25hH2wp
 H/C/mn/KgEXMpqY0zXt2nCmi/LLnCj7cJkPD7D+/flv6HWMwkQDBRtQUkG0ydGikVK3Ud9bL
 00S+wItoLI0+UjtScPyNzW0rneLsR8bX9t4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq18qqfpHW8MC4eIGsGeAcNVw5D6N7myKkxgQjIVc1LC7Oug5v+HjSY6
 y+HrW41h7gVpccR0uOw+lWvvt63jsGXFEhvvFyRBz/7qFMiDGK4W2C2wWrC5qtOI4+Acle+g
 FQln5eZxu5NLLjYwURhX94xNL2u4v+ENhjVjlhuA4Qt+lyRxpKzQWxDyGogfRk0a67obResO
 RaO4l0JuPe/KVPwNcdKj5SN59PGJEQKPfDsTbjqY9VHefCdnyfXrXg1NSZ8M40A+XXAcJ3T2
 7/GKa5A7l5AUMyLKQZaoc9GidfHIQhkmQvuqWjTlUjP7FZnTCf9pU05GFWPdPsly6iPvR/Y9
 d1SX+PTlUkACrykO3OHqNRJRbzvEZTdLcuvwyCwXrTfSjeK5Ul7U6OBqV/fU9ENc1tpehfgo
 SjmBx4wJKvXjnzbMwSaAk2Pm5u0NauTWUkTZHR2VX7xgiBLSd/2sM83KstmFZF6pbcL5aMlE
 JE4lzCoX60npsLvoG9GM/EQbeVKKXyWuO55F3H8MWZlIMI4GVChFx2NVlKHyRTixxGf7KMWi
 7ahyhnaUdwEQQFjB9zRc/Wh0xW6un11pQ64dxGgzgV7EKk0zLVXFg==
IronPort-HdrOrdr: A9a23:2TpiYa4UJfrFgBrNjAPXwWaBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+873WBjB8bfYOCAghrnEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpcdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwseOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNU0H4oJ69Pxkm13imhAdVZhHod
 J2NyjyjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1VwKp5KuZIIMvB0vFuLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMNoYDaxfzO2zGu/HQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.90,184,1643691600"; 
   d="scan'208";a="68673786"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd3CkHmW9DXQCqPIMyLT0TS+Rc5Nr7ZCpieupJRIpF/zdSI1yfdWPKZ23/N1Q00KvhW7PJ/KUKaRl6/YeKoHp2mlAIIF4S/c8lesD3qywN4/IHlVp7c0BGjQ5FiAxA8vjPN9ygC5f8knHwu84aTSwkPx48Yf2q/IxfiEZ2XDNXBQMRwCl1IgSxC6w9rFXeeFo01sxZUvweC2n7L81aXn9cnfNFDHtVr/AW5thQxW1/LkRhXgsuzPbwKGWrQ2wIrS8Jod5HtKx5OZIYnyDgW6fB6GLotTJFReTJAXmO+uzMQw5DvUPptWgUQtjU/rkLd69Oplze3fd5G04MxN674JYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdqwOLsydB3QGIE8UtWDUhYHs6hDV7qNDrCkFHQ/LMU=;
 b=K4McM3JZfWAPDUllIZBCtaXNABYm6miNift5SiaBxYzCISZrfPeYHfEmreWGfNQYwjUNpLpgt3Hk/JR5fiRN9FiKlxJ1JWNMu7MFV5EABcHP8Mx3D2wfhpuJ+98Vst9ivFiHUCgdlI5r/OfIkI/63ppriRUbVPYMwwoclRa01dOs0LVhLL0isASuA6DTa78r/J3XhTQJv4ohmZy8IxzYIUoHkp2hB70oQiOjmiPS4LFl9p0MNc67tPYHDlZ7ZqK/zyIwXetWxHQoyJdqSeFBQ0oqVgl4bfCU2HQi3BumeKGeakW3Bnowf49NAzUsYtTIkuKTOVLS65AWOa/Hj+f1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdqwOLsydB3QGIE8UtWDUhYHs6hDV7qNDrCkFHQ/LMU=;
 b=rnDmAvL6GRdA2jKgBGagbUUfMhqwZ8/COQkaucjqaBYXCQ9AjNS3LeXxd45aASamIG9tUW/Qr04oRNhI6BJdJcJJXOHZYyPoG3nTAA6t5nTtNTUi09YtJSKuLiIgp4VsCPp4UOEVqjLnwpOvJfRIgXNfWgzu2XZQKPxYoz3XzN8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "wei.chen@arm.com" <wei.chen@arm.com>, Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 2/6] xen/sched: create public function for cpupools
 creation
Thread-Topic: [PATCH v2 2/6] xen/sched: create public function for cpupools
 creation
Thread-Index: AQHYNKHhVJSeUIj1QkeG/vMUhWMLjKzAv7cA
Date: Tue, 15 Mar 2022 17:45:42 +0000
Message-ID: <ab2df199-ea89-d965-f0cf-ef7fb48a949e@citrix.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-3-luca.fancellu@arm.com>
In-Reply-To: <20220310171019.6170-3-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39b3adbd-f37f-46e4-12da-08da06aba086
x-ms-traffictypediagnostic: CY4PR03MB2664:EE_
x-microsoft-antispam-prvs: <CY4PR03MB266411539EAF8B4AF47C1E26BA109@CY4PR03MB2664.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W4p4PKzYHdnoZQHGT9ds0J4Blss2UHU0WvO8MP14riXQXs9ipDMQy3kzZUOFSYoIb5v5unQE7GERJwMdTmECEaktZvGwN7nRkeWlWyA0PnOYGarXIGbZl5L8Y9RzsrCwvaE0c/uBx6rfWW4U4Io0xRoI1h/6vEpo6ZpteRHn3S/vwynXfsBiw8fB8Tva9FgErGi/MRadK6rhYYXZNSw4sfp+w15so4wrVgO5P1+/qSmsPSCgre+jWVf9v7ACyTaHBvwuIjjaMZB1ATENKdp7BSjES85s1h04V9eIoa1zR6RZcWnFZvH3vvE+791RS0p9q61df4AJZ1FczHpM25e/CVgl0NIjINNPey0qcsQO2V9WRyzrSP4w5pnXECi0r+zJej/7nM2USqXnxzOeyFWMBawjmxXQEOu14pW+8MVqyqetr/dwbNsItTxPCl7TB8POVWOSavvBACikOi4uszuAaOx8BUh6xgQWhfW3UfzAnHh/29aJFqgQ4ppD3hsdhKlB49iN5g0hBs0YUZnU4THmGBzok+KrW0XyOj8BmZkg3sG6BYQdeexDcSELQkqG9O0Mi9YA71L0utT/UgzJXGmMFnVDul9Msl0lS52IWbn0INnDIOboPT+ft58TyiholfDWRkPUtdiRjgXuATyluL4HIbOxvq5RfbvTaKKHOR6cxoExyM4akyrWX3/b/GcZF4HJJNjdMniSRFgx2Do02XowIptLuv0S346YUQ05uvw9+loeKYdR39DQNUU1jIehg9aV0TWkT4kkj5UHUoeWXx+JXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6486002)(71200400001)(2616005)(508600001)(122000001)(2906002)(36756003)(31686004)(26005)(5660300002)(6512007)(6506007)(8936002)(186003)(38070700005)(8676002)(316002)(110136005)(54906003)(64756008)(82960400001)(91956017)(66946007)(4326008)(66446008)(66476007)(66556008)(76116006)(53546011)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGhQeVFiSyszOFFrQ1Jva00yTHJIQTRHbDFaeElUa2dkaWxvQkJZeVBpbERE?=
 =?utf-8?B?K0xwWUtpd3ZKR0hnTzVPQk5KQXdoY0pUWHh6NXZ6VTZ3SjJlZDdWVEU1WTJz?=
 =?utf-8?B?VlpZaGZKSm02NEdRSVNQYXJURzcyZmhES3NRYlBCdjFDeFI4b3QzdWFabVNH?=
 =?utf-8?B?Qm1UbmpLdy9MdUtiTzlZVDhHbkxSOWdpVzhNZm45V29QTmQrRjA4NEdKcmVU?=
 =?utf-8?B?OEg5a3BNRDE1NkRYYk1DZTA5b09FdnN1Y0wyRHlVaU5lcTVCUzB4R1BqanpY?=
 =?utf-8?B?UjN6cUJpdW1CbWVjR1JQcElURVdTRzRmQ1I0YWozcFR1cWc4NkVWbm9ienY2?=
 =?utf-8?B?Qk4xVitscmxmbEorTDV5Z09NZ0lTN2MrRVE4YkJTNXBFUk90RU8wY3B2MW9i?=
 =?utf-8?B?SjR1TFlxcjFGMVJNWnpwNmdueEM0clBSNEF1Tzc3ZmtJbnNXOGUxMFlwQ0Zo?=
 =?utf-8?B?OWl3aDcyU1JNazdqZkVsbHdvSWV4OGFKWTB2aXVkOEdhbG9YeUt0azczZTR5?=
 =?utf-8?B?UUhQYVM5bkRnNjR6UnB2ZkdNTDNMVGlzdythV1pJVjE0Y2JvN0lVaVFqTkRE?=
 =?utf-8?B?Y3BVS3dXM3lIN096NXlGMnVlc1ZqbitBYlRCeHdYeGg3R3dWMDRkVUwwajVW?=
 =?utf-8?B?YXpsY3VnL1dyWXRIR2cxMEhYc0o1SGZZMG9qRndGSnBIVXVuYUVBMGdXeWdK?=
 =?utf-8?B?bUFQTk1jcE9vek9ucEk0d08vNURHR3N4WCtKYkJnTlgxelQvc3VDSTc4S085?=
 =?utf-8?B?VEdqS2s3NHJwYTIxbHFvZkt2UEFTdlhOSTFhU0duSVplbWh0ZTBLYnExdC9z?=
 =?utf-8?B?VDBGQ2Y5MEdVUm9MZXRWTlVDUkJtMGtTdlVRczF3ZHJwcjA5Z0dyM2drRmlm?=
 =?utf-8?B?bjR2ZXRMKy9HYm1DUVhXTktDVkVZUjBDZWRKRzhvcTZFYjFaRWwyU3E5bHJI?=
 =?utf-8?B?MFhqYk1MbUZzdmFZNnF4RDN4YmdYemlTREQxdkNlT2k4aVdkZnhDSXJoaVBE?=
 =?utf-8?B?c3VqbHVWeThGWEdLa25aeUduNWFFSms5YWlIS2hPWUdGRlRwd1BBQnNFY01H?=
 =?utf-8?B?RkNrcmdtZUw2a0h0Yzg0VHA5Z3RwbEhKTHZkcDg4NkFhdXpKaTV6Q3VNeXlv?=
 =?utf-8?B?UCsyNStlZU51WGY5bVgxek1WNVduYTB6VzlNcTVhODFWaFNYcGpRRVUvNlUz?=
 =?utf-8?B?NTl4aHBzWjBPQ0VJblUyUFZ1eHZCdXI1QktuQjgwNDlubWRKNTNlQmRLZnlL?=
 =?utf-8?B?d3IxVlVqajd5VmNJUXVadllkSGMzczdEdS80MU04WGt2cXBWdW9CZ09tSWpC?=
 =?utf-8?B?K0d3UzFROGpWOE43R25ZbkVWU3FkWWNSWjYvQlBKdGE1QnAyUHd6MElOY1Fn?=
 =?utf-8?B?YXVrQm5JaDEwcE45WU9nbUowRkRjSllyTS9kb2xBY0IrdzdTbDlPQWV5TGJx?=
 =?utf-8?B?SjBVYVd0aXJkaVlMS21MWHk0MFFKeEM3N0JiODRzRVk4UU1SZmJwTXpiM245?=
 =?utf-8?B?cURrU3ZZNGRCWDN3Sjh1bllCdHV4WXZ6MHVXb0xuZ2oxeGIyUndWekZUV0cx?=
 =?utf-8?B?MEh4MUtzVnhpZ2hvQjZKV3JuajlRT2JTbVY5WVNHaEdvekRjTGZMb3VhTTVt?=
 =?utf-8?B?NEl2MXRqa0RuMmpzWUhnRGFtazJHMnlhMTFkZGovL2VUSEJleXY2RjFKZjlN?=
 =?utf-8?B?b3hSdGxnK2trUzJOWW5xaW9MN1NJUmZncVU1d1Z0VTZzaGFUZ05ZaVE2OXh4?=
 =?utf-8?B?TndsUkdDR0dheUJaNzF0T1dlSXUwNmp3c2gweDVGTjRxSFJLYXhiWGxYTkw1?=
 =?utf-8?B?VFRQT3lJNWd1dnNwemRTQUhGdnh5bGJlUkU5NStBRGpZWTBIWExyZzRSWmxa?=
 =?utf-8?B?aElRNjdBYjFSTkVGdjNZV2cwRWkvU21wREtTcGwyUHhEeTdjYmYzMGpQZmZP?=
 =?utf-8?Q?DMmEzwoX8k0l/dLbzCfsASOOOyNSNWWa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C49AF86F1BBF349A35894669B2442A7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b3adbd-f37f-46e4-12da-08da06aba086
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 17:45:42.6318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Ar2EG8vkLHWBzlMinaPCgvEEKctw7JSHZlgjuR/JQcXT7fKvqulfv77RWl8jZFBqXpv33z0NjJfTTMjH1u3C0XKv3vcjy/bqGMU8ZkvqE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2664
X-OriginatorOrg: citrix.com

T24gMTAvMDMvMjAyMiAxNzoxMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gaW5k
ZXggMTBlYTk2OWM3YWY5Li40N2ZjODU2ZTBmZTAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IEBAIC0xMTQ1
LDYgKzExNDUsMjIgQEAgaW50IGNwdXBvb2xfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IGNwdXBvb2wgKmMpOw0KPiAgaW50IGNwdXBvb2xfZG9fc3lzY3RsKHN0cnVjdCB4ZW5f
c3lzY3RsX2NwdXBvb2xfb3AgKm9wKTsNCj4gIHVuc2lnbmVkIGludCBjcHVwb29sX2dldF9pZChj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKTsNCj4gIGNvbnN0IGNwdW1hc2tfdCAqY3B1cG9vbF92YWxp
ZF9jcHVzKGNvbnN0IHN0cnVjdCBjcHVwb29sICpwb29sKTsNCj4gKw0KPiArLyoNCj4gKyAqIGNw
dXBvb2xfY3JlYXRlX3Bvb2wgLSBDcmVhdGVzIGEgY3B1cG9vbA0KPiArICogQHBvb2xfaWQ6IGlk
IG9mIHRoZSBwb29sIHRvIGJlIGNyZWF0ZWQNCj4gKyAqIEBzY2hlZF9pZDogaWQgb2YgdGhlIHNj
aGVkdWxlciB0byBiZSB1c2VkIGZvciB0aGUgcG9vbA0KPiArICoNCj4gKyAqIENyZWF0ZXMgYSBj
cHVwb29sIHdpdGggcG9vbF9pZCBpZC4NCj4gKyAqIFRoZSBzY2hlZF9pZCBwYXJhbWV0ZXIgaWRl
bnRpZmllcyB0aGUgc2NoZWR1bGVyIHRvIGJlIHVzZWQsIGlmIGl0IGlzDQo+ICsgKiBuZWdhdGl2
ZSwgdGhlIGRlZmF1bHQgc2NoZWR1bGVyIG9mIFhlbiB3aWxsIGJlIHVzZWQuDQo+ICsgKg0KPiAr
ICogcmV0dXJuczoNCj4gKyAqICAgICBwb2ludGVyIHRvIHRoZSBzdHJ1Y3QgY3B1cG9vbCBqdXN0
IGNyZWF0ZWQsIG9uIHN1Y2Nlc3MNCj4gKyAqICAgICBOVUxMLCBvbiBjcHVwb29sIGNyZWF0aW9u
IGVycm9yDQoNCldoYXQgbWFrZXMgeW91IHNheSB0aGlzP8KgIFlvdXIgbmV3IGZ1bmN0aW9uIHdp
bGwgZmFsbCBvdmVyIGEgTlVMTA0KcG9pbnRlciBiZWZvcmUgaXQgcmV0dXJucyBvbmUuLi4NCg0K
fkFuZHJldw0K

