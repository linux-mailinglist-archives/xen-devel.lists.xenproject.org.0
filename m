Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2F4C6DDE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280551.478527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfwP-0005Gz-4f; Mon, 28 Feb 2022 13:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280551.478527; Mon, 28 Feb 2022 13:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfwP-0005E1-0z; Mon, 28 Feb 2022 13:19:53 +0000
Received: by outflank-mailman (input) for mailman id 280551;
 Mon, 28 Feb 2022 13:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3PPb=TL=citrix.com=prvs=0512ed4f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nOfwN-0005Dv-3h
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:19:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 199133ee-9899-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 14:19:49 +0100 (CET)
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
X-Inumbo-ID: 199133ee-9899-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646054389;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0kRc8gBjLkYgEVkXNntJvOvykn3mZ64v01dlovW2AXw=;
  b=P3L+SIYp4eEDiYp9wBAX6KMbL2Jr+bihUXqEMToApyZzUq2DC21MnmqP
   9caXoA1zoRUxjWIMyMK3srlS2LM8m/xAb7VgqfIO1Q/fjhECBOM6e7vKn
   58uNg0Q1fxeKO3ohm8tulfvBTeTl7+Eo47sHONA3ufCfk419gcBnlGbGV
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65020264
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q/kDkKoGvLGXd8WvNTQUXuo/v3ReBmLdZRIvgKrLsJaIsI4StFCzt
 garIBmHb/+KYjGmftgib4uwpE1T6sTTzNRlHgA/riFkRXxB8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvX4
 4Oq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOZbCycAWckZiKDB/E78F5Zj2BFGYiJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMUyaO0cRZj/7DroRkNqWr2egWQF5l0iph/o7znL11C9Yhe2F3N39JYXRGJQ9clyjj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcJ0WPK218LhtmlL77m4ODBwbU3OrrP//jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxu1AiZECWQjOhU/XAor8Zr+h7AWpzX2G4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAtACDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD32n3k5JAVdoJiN2bGKuPGpxZEdMOS
 BWO0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZoHw/NRHJhjyzyBhEfUQD1
 XGzK5vE4ZEyU/kP8dZLb71Fje9DKt4Wnws/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iF69z
 jqrDOPTk083eLSnOkH/qNdPRXhXfSlTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6INc790mU/8+Vl
 kyAtrhwkwKu1SWaclzRMhiOqtrHBP5CkJ7yBgR1VX6A0Hk/e4e/qqAZcpo8Z7488+J/i/VzS
 pE4lw+oWJyjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:rF4kiq6mICx/rMeh2QPXwWaBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+873WBjB8bfYOCAghrnEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpcdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwseOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNU0H4oJ69Pxkm13imhAdVZhHod
 J2NyjyjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1VwKp5KuZIIMvB0vFuLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMNoYDaxfzO2zGu/HQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65020264"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNlv2XXghfsbtQ6T0rLOFI56OoqBCr/38JUNIcMmjLCF5GBKOPZwHRKeGBhxG0Z1E8d+Q83Qo3/8UsSz9fDbfRilib1zeFi+vGZqegGsPyYHlK0pW3HuYfFv9DVxzc8si+eUvSOHDfwm9Gv7SH01YrwN4dnnFQWRD6I5TW3m8yrPW1zQHC4/2S9R3kL5EQeaE/C8Rz5AV0K4pGCxHv4bX72SrGv1mwMgwoQyyp53rPAi9wg+nXn7VyOEZBNZGbCfnjlW6zmWQWgWf4tqVygHJMnr/ZCImyk7kVSzsVF5TBgDsk54DCpZxTXjLytS42h+kECToILGYZjkYalqr9FPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kRc8gBjLkYgEVkXNntJvOvykn3mZ64v01dlovW2AXw=;
 b=XOPZv1L9Cq8Y5prbfat5V3rB7nv4YVzDZt4okQC4Ndf9jBO1dKDuW+GJTaXGqmuDeNL3WP83mhTxYejB+iMV8PyxhcEi8q1rr1Fke0hXXQQzvB3bT8NjJXcsUjI+tWv5BkJjs99FdELb+p8+d2TIBzFlftqa+Ytrads8jsnr7o0J4QEMqDqshYf5+BTOCRm5zIXRqxGHeKokrTy0FLNUnTDug1+RBvQxtcMCA/YMFSjjKZMax57if1tWLCga3l0BQXHZXa/4TylxGqwaPxXkRwwNc5fXKJfFUT8FPaPsntrtNPw5zCigfng4NwcBw1qBQzBoj4XGs8Bh/BuKsHlbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kRc8gBjLkYgEVkXNntJvOvykn3mZ64v01dlovW2AXw=;
 b=P2fltrgOxeDoerCkX+cR/3tOLb9+PVOGc/VQxX6vBUOT8nCj2mrJJzZL+QSS8DoFq2+U3gicpPnlzseEOPmVNSOSyNsYM+Beq3bGJbgF2HYGzPsSFpHTwJEZTdo68ipDb6M4P68fArBUKonPP+SVXG26UUh40AN8VkDtNZ/LGts=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Roger Pau
 Monne" <roger.pau@citrix.com>
Subject: Re: [PATCH] docs: correct x86 MCE command line option info
Thread-Topic: [PATCH] docs: correct x86 MCE command line option info
Thread-Index: AQHYLIzH3mLmwWw5aEm0tUCG/sGwH6yo8pOA
Date: Mon, 28 Feb 2022 13:19:40 +0000
Message-ID: <81337ddc-afe4-ba82-9495-3f74c53e7041@citrix.com>
References: <329ac1cc-85d4-7ec0-a23d-a3f68c2864f4@suse.com>
In-Reply-To: <329ac1cc-85d4-7ec0-a23d-a3f68c2864f4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1c3ef8a-e6ca-4dc9-0f55-08d9fabcfa50
x-ms-traffictypediagnostic: BL0PR03MB4035:EE_
x-microsoft-antispam-prvs: <BL0PR03MB4035533F70186A8617C893BFBA019@BL0PR03MB4035.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2VkHdHNPpnjt72Uw/8uvD/U4dJAer/hc+lNW1/z5+KZT6+ntNiLyHUqrJGpKeT3uUvW68WuLghFEipMVtGGXOHxeWDlORKO2uE6DDh2UprH01zywzdnFXf92ut2sndSLMq9FdEErzOeaodPA0xNukWEB8wojc+MiIJc6+FzAQoiCxLlTVdHArqPKkESpqK4UHITuQbPAvl28lLMOMYomTukfOdT6gNWkJpGUUx2FZIXTDmq9JYM9wmmn5YfFy/LAICd7b43dhftzj6yi65skDfjtpjg1+jsUQijDEtbm/sE5FG+whflnP7xALIhGq7+SUL7hFV/iZmMnZzHIMoiodiExb+KfSeRkrT3UIFUMkTxQESIft1FjMTmD8x9gXN/UvNJq7xGUEr1/zruTjP53ysFvYcl97Bo7+oBS9IkKdF06ruI2I0hzt1i/6jbr1cR5UB3Zl729MKr96r6BZcqP+ElkgUbHbwY0fkR4OHTDXE+l/n0cY4YDgi07Lk4rMVWR01z8w3CGRqQDelVwkOVN0UpXUu3wGPaNhi2gQi+Gk4ewA1tKPxnCrqmZE0cGlpdzbmEpuDTXA2u5Wmku4KWyHX83CMBSW743VpG3VrIcJ5oP92lnpUeX1cBZRP/0Ir8NcA7wN4b69igDARpcTk9xdR4JP6YIomizOIY+rSjc26rKJr16FFWebjiA0FnXnHy/MB2bjA1scQNFY9QMf/a7NBbARezHWi8r25NDWYBIIZqlqJ2cYASlvjOG25od/Zw/6igBB85Z9S3TBAr+QzWd4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(8676002)(5660300002)(53546011)(31686004)(508600001)(6506007)(6512007)(86362001)(2616005)(26005)(186003)(38100700002)(31696002)(82960400001)(6486002)(107886003)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(2906002)(110136005)(4326008)(54906003)(36756003)(38070700005)(122000001)(316002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anprdGo3K3JHZFN0MzRKdHk2emN1YjhiMytXSGV0cm9tK0dad0hXQXZic2ha?=
 =?utf-8?B?dXkxQTlvejdNU1kzT0tqV2M5VnJ1cHFJYUdhRzd0eko4SG9GUlFrNWNqY0Fw?=
 =?utf-8?B?djd0c29Tb0xNRWJuNm5pZnNRL1hkaWlMa3Y1VnI1aHk1N0paR2RSNmFiSnlt?=
 =?utf-8?B?NHlJckhFZU8yTVFTS1h3ZVhCMWZ3dUZxTVhmRTJFVDF4a1kzcFIwMXBsNGJK?=
 =?utf-8?B?cDBYTW1NZk0wMDYzeDVzak40VmYzNExRcHhvQWdJdkh6RENpV3NoRkt2MWRJ?=
 =?utf-8?B?RVF5TXN1OE9hUHBQZWg2Y2xsWmVSdkwvTXM1VTNTR2IvaVlKeHowckM0cDdz?=
 =?utf-8?B?bEtaUGlzaXJ4bnlhK21kaitCTm5MZmhqYUFlKzUxekFTak12Q3hpNWt1eUh3?=
 =?utf-8?B?clVGMnlYN0RZb1doZHZOaFNPZWlmb09ZcDRDcDFFd3oxWGZoNDZabTU4WFhn?=
 =?utf-8?B?VXJxSzdiTHdkb1NUSk5HZkFjWGR2N3YyNEo2Q2RSVWFBSm9SSElRTzU5cWt5?=
 =?utf-8?B?T2QzaUkyR2JldzdBSHQ5ZG9CYUJEbGw3VGFxM3djT0Mzc2RGVXU1WjlSekdH?=
 =?utf-8?B?blROdE5nNEthVDUvZEJpcWMwMTUxYVJoSXdQNlRWTXkwcmpiU0hRKzJLK1Yy?=
 =?utf-8?B?NzZlanBQUno3YkhpWUZiNWZFcGFzSkdhZ0hOTjVuQkF5eHB2Z3BWS2ZPOG45?=
 =?utf-8?B?RC8yZDA0eCtKbFFhRmYzMExFaFV0MDlJUG4remYvbEU0a2hzQXlpZzBwNW9u?=
 =?utf-8?B?Y2Z0QXg5UG81RUFCMTVMMXpNeloxazRrczd3QWdic1FOWVl4YUtkVzhxb251?=
 =?utf-8?B?bitKY25peTFCQzFKTUlwQ3duTmJrdGVwa2M1U0kzR0ZBbGoreVRUOXZrcnVM?=
 =?utf-8?B?TnFHYk5VbElBZzdtVDQ3S2JSOGFRQ2RKTkN5ejJUK28vNi9BK2svZTdnWUVh?=
 =?utf-8?B?TVN2ei9MOEVuNXRtVHBCM0RsR2Y1cUU0dURia2t1S0w1eUt2VnV2dmpzVjZq?=
 =?utf-8?B?Ujd5Tnd4NUpPUU5kYm9BSjM3RFlRMnVXcVRUQm9oR1JVd3FTUFQzcjlVUFVP?=
 =?utf-8?B?cURxNEtsTFZwbkJobGlkdkJDMThXbUZLNG0zQUpuZElMbEJMN0JNQjZjRXlC?=
 =?utf-8?B?UWoySnY2TkpxUDN2WGNMbFVkVDA4NENsRjNveEI5eHA1MUFnRFIzTDNxWjc3?=
 =?utf-8?B?aXlCUjRGWVh0a20vYThTbC9pdHJ0V1BWaDF0QkhCTXkwc2RZSkwrd3FGQ1p5?=
 =?utf-8?B?OUowdmV2SmVITWJKV1pScWxDY1BVb3FSeVBMOTVaWDVOaUVaUnNtL0Z4UUdE?=
 =?utf-8?B?RDJwV2dYaE9QUzI0ajRtdm03cnM1akhtSkc3dVRjY3ZLcGxla3JOdTFYdnJv?=
 =?utf-8?B?RlErV1I5U1h2MXR3dHFURXdhQlp1Rk9CRDFTZG9tbzN0N0h2bENTblo5eGV4?=
 =?utf-8?B?cE1PUkVQZkx1U3JKbFppcldxYjdkZmFpUHBFSXZXQzhxazBQa3daMWl3S25l?=
 =?utf-8?B?ajl5MndZU0dYL3VJRlVPa3VFbEFDY2JqSzdvQWJVOFM5L0hjT0Y4MU42N0tp?=
 =?utf-8?B?TTl6ei9BL3pNL1RKL090YnY3eFJqR2h1a2FvZXZUUTdjcmN1cHJlOTZRb1Ft?=
 =?utf-8?B?blVNVXFKeGY1TWZuczRuQXV0MnE0emhiWmEzaTFzS3FRMEZzVWNZb3Rvb3Ru?=
 =?utf-8?B?WDN2MTN6ZWRtYk1wdm8vOTRBblNmbG53dVMwTlJNZWNLRW1XQWNKRDc3cmk0?=
 =?utf-8?B?OUNONkR1QjBON3RCdkhWSTNCb0lWRGMzSjBvSENpTE9YcTMrbHc1V2x0VG00?=
 =?utf-8?B?Zy94clltRm5kN2ErU1Z2Q2NBMFQ1S1BUaXBLVHArUVlzT2RMSkt6V0JwV2tX?=
 =?utf-8?B?TGE4M212VlUzYUJtbWVQNDVsZmRJMEtwRFYzRUdyQzl6cWdMVnVpWnhuTlYx?=
 =?utf-8?B?bXIrdXV0TFc1eGt3T0h2d1F0R2hhbkk4S2kwQlBGUm96K3Fia0VmZGJ0V2tl?=
 =?utf-8?B?LzB1V0xwaFJ1Q1ZycmFwaHhQOVpPbUdGbldUMldlSXRpSjYydlBhTDIxc1N2?=
 =?utf-8?B?UTZaYnRMRFAwbVBZVCtBc0VIaXNYTzdXNzkxUFlVaVVybXAyckd1cGw3WHJM?=
 =?utf-8?B?SnkyZHlFNDNSSFQrNkhHMnhWTFVqSURjcmxyZXRYRGtoKzc4cFZTeG5zbVB1?=
 =?utf-8?B?dnpndXI0RWJuK0VWcjNIczBJdlo2WTF4T2tCU2R6Q2MxVmpUYUNrZDNNMDFK?=
 =?utf-8?B?bkQzMU5WcTJIVWVoMVFmdFJ0KzlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D5E15B2C3CCCC46B8F16A1E66E5534C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c3ef8a-e6ca-4dc9-0f55-08d9fabcfa50
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 13:19:40.9201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GeB0KYGa6lCD4FRiYtGEPIguw18PXLnW7Ee5V6kNEn23qnP+gDr6j83M9fXxKIIn/68JVmRPV2Q8Jr1N601vpAOc02u9HmWML31nqdpWfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4035
X-OriginatorOrg: citrix.com

T24gMjgvMDIvMjAyMiAxMDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE5vdCBldmVuIHRoZSB0
eXBlcyB3ZXJlIGNvcnJlY3QsDQoNCkh1aCB5ZXMuwqAgYy9zIDk3NjM4ZjA4ZjQgd2FzIHBsYWlu
IHdyb25nLg0KDQo+ICBsZXQgYWxvbmUgZGVmYXVsdHMgYmVpbmcgc3BlbGxlZCBvdXQgb3INCj4g
dGhlIHB1cnBvc2Ugb2YgdGhlIG9wdGlvbnMgYWN0dWFsbHkgbWVudGlvbmVkIGluIGFueSB3YXku
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4N
Cj4gLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+ICsrKyBiL2RvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPiBAQCAtMTY4MSwxMCArMTY4MSwyMSBAQCBv
bmUgcGVuZGluZyBiaXQgdG8gYmUgYWxsb2NhdGVkLg0KPiAgRGVmYXVsdHMgdG8gMjAgYml0cyAo
dG8gY292ZXIgYXQgbW9zdCAxMDQ4NTc2IGludGVycnVwdHMpLg0KPiAgDQo+ICAjIyMgbWNlICh4
ODYpDQo+IC0+IGA9IDxpbnRlZ2VyPmANCj4gKz4gYD0gPGJvb2xlYW4+YA0KPiArDQo+ICs+IERl
ZmF1bHQ6IGB0cnVlYA0KPiArDQo+ICtBbGxvd3MgdG8gZGlzYWJsZSB0aGUgdXNlIG9mIE1hY2hp
bmUgQ2hlY2sgRXhjZXB0aW9ucy4gIE5vdGUgdGhhdCB0aGlzDQo+ICttYXkgcmVzdWx0IGluIHNp
bGVudCBzaHV0ZG93biBvZiB0aGUgc3lzdGVtIGluIGNhc2UgYW4gZXZlbnQgb2NjdXJzDQo+ICt3
aGljaCB3b3VsZCBoYXZlIHJlc3VsdGVkIGluIHJhaXNpbmcgYSBNYWNoaW5lIENoZWNrIEV4Y2Vw
dGlvbi4NCg0KVGhpcyBkZXNjcmlwdGlvbiBhcHBlYXJzIGJhY2t3YXJkcy7CoCBFcnJvcnMgaGFw
cGVuIGlycmVzcGVjdGl2ZSBvZiBNQ0UsDQphbmQgd2lsbCBieSBkZWZhdWx0IGNhdXNlIGEgc3lz
dGVtIHNodXRkb3duLg0KDQpNQ0Ugb2ZmZXJzIHRoZSBPUy9WTU0gc29tZSBhYmlsaXR5IHRvIGRl
YWwgd2l0aCBjZXJ0YWluDQpub3QtdG90YWxseS1mYXRhbCBlcnJvcnMgaW4gYSBsZXNzIGltcGFj
dGZ1bCB3YXkgdGhhbiBraWxsaW5nIHRoZSB3aG9sZQ0Kc3lzdGVtLsKgIEFsc28sIGl0IGFsbG93
cyByZXBvcnRpbmcgb2YgY29ycmVjdGVkIGVycm9ycyB3aGljaCBhcmUNCmluZGljYXRpdmUgb2Yg
ZmFpbGluZyBjb21wb25lbnRzLg0KDQpBbHNvLCBpdCdzIG5vdCBzaWxlbnQgLSB0aGUgTUNFIHJl
Z2lzdGVycyBleHBsaWNpdGx5IGRvbid0IGNsZWFyIG9uDQpyZXNldCBzbyB0aGV5IGNhbiBiZSBy
ZWNvdmVyZWQgYWZ0ZXIgd2FybSByZXNldC7CoCBGaXJtd2FyZSBjb2xsZWN0cw0KdGhlc2UgYW5k
IGlzIHN1cHBvc2VkIHRvIGRvIHNvbWV0aGluZyB1c2VmdWwgd2l0aCB0aGVtLCBhbHRob3VnaA0K
InVzZWZ1bCIgaXMgYSBtYXR0ZXIgb2Ygb3BpbmlvbiwgYW5kIGluIHNvbWUgY2FzZXMgZGVwZW5k
cyBvbiBob3cgbXVjaA0KZXh0cmEgeW91J3JlIHdpbGxpbmcgdG8gcGF5IHlvdXIgT0VNLg0KDQp+
QW5kcmV3DQo=

