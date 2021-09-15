Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C5840C118
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187275.336086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPuh-0003B2-6Y; Wed, 15 Sep 2021 08:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187275.336086; Wed, 15 Sep 2021 08:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPuh-00037i-22; Wed, 15 Sep 2021 08:05:03 +0000
Received: by outflank-mailman (input) for mailman id 187275;
 Wed, 15 Sep 2021 08:05:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wWxD=OF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQPuf-000370-GW
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:05:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fa1e35e-15fb-11ec-b4e7-12813bfff9fa;
 Wed, 15 Sep 2021 08:05:00 +0000 (UTC)
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
X-Inumbo-ID: 9fa1e35e-15fb-11ec-b4e7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631693100;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=0MKXOtuPLz/CVTk0nxd0ruLUtS08Q8L9fwLdhUWEhMI=;
  b=MUgRRvzfPjFA8vPL8zuw45G1IqO+ntj9sAbJcCxe+VBcNMXQPvumsy7q
   xjboiW3ftNZOleBTupKYUOdSB6CcOuuk0txcwqUrDabb2WiciFfv1Yt4K
   by0q01OrAa5ZCHtsW6agNCBmO8HUVnyvKyYmzX6w/nf+s882jfgQG1Bk9
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dYo5ACvcKxygtG2bTpTTtE31Gdykrtcf3FYMQbzc+vKIvFPrdaMJMU5CqGAE9+NkovO4FPdzio
 dmzaoH0ISIlwXpRG6kNbqF1tMNrngCGW/6yppHSU/AF9FWgtETrnGeR3QaCXAsLvBOc69R0v+f
 IMXZINmGWZRu51fxd+FBa3vDow1aq03aT4wC+c/PowKMR2dRBFENU71NPdzNFtcmpPIz5EiuZ/
 8NDwMLIkOOGjPZ1xqiTtbw6Pnt+EF/5cuiUd+3Tlu6SuVNh/DEEWe7hLYSbEdLYROTZONsJI6c
 z7qhJ3fLUCWRJqJ8mZBcQGxm
X-SBRS: 5.1
X-MesageID: 52750017
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nN1NIah/3uJyoh+VSTqfLh7rX161XhcKZh0ujC45NGQN5FlHY01je
 htvWGHXa6reZGLxcoh0Ptm+pE0AsMXVz4BjSAI9ry1gRC4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8x3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1RrbiyCj4FBpH2kdoQeRkBKAh7P45JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t3J8TRa6HO
 KL1bxI+SzX7SBR9a25HJ7cetbyZvXz8TTxx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgIEf9gTKsEC1DuE9Kf+41+iL20GbTEUPbTKq/QKqSwWO
 k6hxo2yXGE+7+LLEBpx5Z/P8mjjYnF9wXsqIHZeFFpbuYGLTJQb00qXJuuPBpJZmTEc9dvY+
 DmMsCF2rLEal8djO06TrA2f3m7ESnQkSGcICuTrsoCNtVgRiG2NPdXABb3nARBodtjxor6p5
 iRspiRmxLpSZaxhbQTUKAn3IF1M2xpjGGeN6bKIN8J6nwlBBlb5JdwAiN2ADB4xb67ohgMFk
 GeM4FgMtfe/zVOBbLNtYpLZNijZ5fG7TrzYugTvRoMWOPBZLVbflAk3PBL49z29wSAEzPBkU
 b/GIJnEMJrvIfk+pNZAb7xGiuFDK+FX7T67eK0XODz8jePFNSLKEOxcWLZMB8hghJ65TMzu2
 483H+OByglFUf24ZS/S8IUJKksNI2R9Dpfzw/G7vMbaSua/MG1+WfLX3507fIlpw/ZcmuvSp
 ynvUU5E0lvvw3bALFzSOHxkbbruW7d5rG46YnNwbQr5hSB7bNb99robers2YaIjqL5pw8lrQ
 qRXYM6HGPlOFGjKomxPcZnnoYV+Xx23ngbSbTG9aT0ycsc4FQzE89PpZCX18ywKAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIUzcn7/lP46Jc0IOC7v/DrC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59aj+N
 +VYy/bwbK8OkFpQ6tcuFr9qyeQ15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e0QlceKT0sYvmHyfxJyCLZ6u44IRmi6SJ6lFZdvZ6+4/VYZPRhEYZI
IronPort-HdrOrdr: A9a23:qnp/LK9lUvKu2s++UZ5uk+E9db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhORICOgqTMyftWzd1ldAQ7sSi7cKrweQeREWldQtqp
 uIEZIOceEYZGIS5a2RgHjaYqgdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngMObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Lk1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESnti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1yfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAz7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1RwKpsKuZBIMvG0vFlLA
 E3Z/uspsq+MGnqI0wxh1MfgeBFBR8Ib1K7qktrgL3j79EZpgE886O0rPZv7Evoz6hNO6Ws0d
 60RpiApIs+P/P+UpgNd9vpOfHHclAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.85,294,1624334400"; 
   d="scan'208";a="52750017"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgUPpPy/Puj5IkCcKEKeP+RpArtBF5TM3gjJaXUYqDHFXMC/3HWXBIPUY+7L3UAh4uc8GgbrzQh9MfOYWnv05fDxWaDRGg4zmZxpeQdHjUmQbfVnMqlAEmgyC2fQuTNoSYz3E6B54SDphrnc3Xj/6CJyAU5QFi6FtgDDiJ8P0jdJsxC6/J6/2VRJfwz/yDTmvTVp+INPjYKyP0jmMXsfBo/CnbIu4O8TLO0k8W/RakMEAuiIQyBh5fJwvdAgSFH6tMrMTIg8HQc5LGRvufilkkBhvYdV0pb2ej6+a/pPCjitY+33O5jH7RqXEkyE7ryYlbqVhDKOUp/Aw7ExO69E9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aGqy4nQE3HdDQKTl4mOJt2/JdDVwHm0kVMcZrpQQVcs=;
 b=QZyWV/qDICjutggGo8ipksRBO1WltzasKUOst1cM1S5cId9bTBdC3LJ7Ub0zNtl6VzGoJ4csMiZa0OZLFK5eoe/i9SK9cLWjsD/JMhjQ/fmmLR8VUhInF/g9P3AAgo/8+xURV7Ab8SKXjZ9yc+6oQ6gcqIMTfmLbOW5D0uhL8o/IPlBfwBNACN/uDAx0ewABKOTESclDUyExvfgyi40Alp8mlmstdQmK7NSEB6MgVfYw6iF03Gvx1xyzu9nIVW7teVxIVtD+v5VJVyXmDTVVHNb5DBHLpHxinZ5h/mkPqYre+tBo3JtucDVi3Xtj/o9RR+h9geYznIACzcNJJ25vZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGqy4nQE3HdDQKTl4mOJt2/JdDVwHm0kVMcZrpQQVcs=;
 b=S5ZT3WSyOei/M5Roje+NRSyAMT7MfEmUZwnjsqSpMXH6YiToh109wmFrtp634S1VMtBTyrWmBaJWHIGSK4mfe9/0NM/o9hM+KI13PSaW1zFitxP5wdknj6MFTv9vKcl0p5dmErDuTOaWv95/wYDULs4CNOo30s7YKGALv7osv9Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/p2m: fix xenmem_add_to_physmap_one double page removal
Date: Wed, 15 Sep 2021 10:03:42 +0200
Message-ID: <20210915080342.21346-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c4a3501-11a5-4e0d-d2d1-08d9781f8176
X-MS-TrafficTypeDiagnostic: DM5PR03MB2636:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2636C744EC5EFF57428F73828FDB9@DM5PR03MB2636.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OY8LCeB2VmP6T7oy0TFh4RGommL+zpaq7XKQ9aeSirIKUp23BvSMAxh5ZpgVgnJUcB93N/uT3AjKNJXwEujaL28IFZcirciVp7KbFUBJo47Fn9lkxQEDZg2IlbqeqItspcqC4JEvxgnkTDYiCp7QG21Aan/ZlKm4bseY0+OASb6WV0tq/SEQY7xpxQW/AacR4Gtv8uU3l24izg6gjdSfSyYcBYXfj1tz6YrGV7xCIF12QzOgKs8anLN/oMOSLTi66/S/XRYBVTNddS+xWwr6se7b5STMZejYC5fNMqQXN0i5wRlgZabwpR0MKJ4XQ/D+tg9S7rs+dnOyCuqwn6bTRsE75t/7pIxAw/VxTR5VOKR7DlRVjDsWE9AeUNmcNgZsLlhe3GgRv/0Ot655a4FeX7tUQMizhhfZkmbiJY/n04FOzyKUFhlaj8ronUHUYI2eCTEqvm3IAksxPRxU8kqckKOOaLq2KjRcqqL734lPic6THx0emkRe5NsCUQiAs1kw7L0GLeE5A83EXHESIUuW4Ghk2sl9o3QhAOd31MHf82QdsCJ5Ept15uFrbeYfYu/sXJBnCG5VMiI1mA8+wZACU/LZVrqWOv9vLjUKWnK7PxRJ4QMaRh5VETbqB7fE7EyDKnbl4ZnQFhGA+VAGg84r8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(2616005)(54906003)(5660300002)(316002)(1076003)(6916009)(8936002)(956004)(83380400001)(8676002)(26005)(478600001)(2906002)(6666004)(66476007)(36756003)(66556008)(38100700002)(186003)(4326008)(6496006)(6486002)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGxabG94ZkZSQysyZzk0OWlzRkNOQW1SRXBrcDJ6czBFbG94VG1ybStMWDhY?=
 =?utf-8?B?b3RkdXluaUJNNlJDRzNCZk5QUmlrdzZROWQ5cmNKSEwwRElvZm9oc0ZUWmpJ?=
 =?utf-8?B?NDk5b3B5emthb054ajcwYXAzNkMyanVucXdrRkhhQUFIQ1BibUdXTDg2Y1JN?=
 =?utf-8?B?YXVyUW1wc0FFbEVoQWh2a3RjcnhGSTZRSTgwUDJsY2daYlFpU3VBWDBmbmhL?=
 =?utf-8?B?R1ZQUVF0S0JrSHNwY3dvQnlFakxCUU5yOGxCeVIvYTM0ZkFtMGY5b2ZiaUd4?=
 =?utf-8?B?TSt1WEpzSy81ZVlBYlljUS9FR0toYmRMZEsyU3FiOHdzZ0JsUWI1MXVXV1Nj?=
 =?utf-8?B?NmRlMFdLamhMdWdNaEd6UnBWNEVYQlhHbDFvNTQrb0NrS0x1VUROTU9LS1R4?=
 =?utf-8?B?WVQreDNsSUJhUkgxa21PMVU3dVZhVjBWN3IyaFlOQlZ6bWdaekNPQVpNMld4?=
 =?utf-8?B?dkNybGJGdHpwT3JQRWdJbWJQRnZEOFIxdjFhblQySCtvcS82YVloZXU4bFB4?=
 =?utf-8?B?NnBrcXdGS3NqR20yRHN5by9Pb1loSWJ3SlFqRlZlaTRhWFZvSWZPell3MmNT?=
 =?utf-8?B?UWpYWE9ucVpZeUwrMGVNWjhaTklyRDNVUFBGTXRkTWdRT2dRZi9CY3gzSGRW?=
 =?utf-8?B?SzhoUXVaQ2doam9scGNIbDZSWGtmQWZhazRHMGRQeEYxNFRUbXhDRGFaWTFX?=
 =?utf-8?B?RkVDM1o5b1YxZ2VDYWtHREo4dlVvdHJjQ3cxbU9pWXN0cjEwMlVNQnJKcy9q?=
 =?utf-8?B?NGs4djlEbElwRjBPQWhFb3JEMzlFN1BkUkxITE1hOGJKZFdpdUhNUzNHNkpt?=
 =?utf-8?B?T01IOHNWZ1E3RXhRYXhuV0MwcDV0TDNYeEE1Q1RxeU1JaUZDSW9nOUduTzBH?=
 =?utf-8?B?SWZlN05iSlhSS1lyd1Q2Myt2SkhZcTE0cmpTdThDdkduTnVQUVFKU2NzVkFr?=
 =?utf-8?B?cDczcGJFMk1tZHY0SFd4c2ltSEl0dENwL290KzVEU1htcUVIdXdjZ3IrZGdO?=
 =?utf-8?B?NU1Sd1YxYlk0VGc3YVhXcG5QYm56dEFoZFNaS1RZZDNIS2dkVWozYnVHamxu?=
 =?utf-8?B?ZERkSGp4cjJrKzE2czRickZOVEorVHhwTnBQcGlsODF1V0l6ZzlnVnJQendD?=
 =?utf-8?B?dG1xeitucEFGQ0dwdlZudHFCemUzRGpTVTVBLzRQbFhOWHdFSTVBYklYVDBn?=
 =?utf-8?B?eWRsZFJaTTQ0MUhFTHJkaDUxRmpDWmFsbEVQWmxWU3R5TURQNEkxV0VMbEtB?=
 =?utf-8?B?QW0rdGZaZEdCYWdqQ0xYOGpURWtBcC83b2toNEp6R01PTHNqYTJXRFhHM05p?=
 =?utf-8?B?VCtOVWhXTllVdHRzSkZWTDNGWWsxQ3ZaU1RQYnFZM0F1RE81U0xWWjZnK3hT?=
 =?utf-8?B?ZWxkT0ZYSE5CR09RTGIzT0ZNV2tUalZDS0M1VytqNEJnTU53YUJSUjBOWUt2?=
 =?utf-8?B?aFNKS09WVXBjcmxzTkNCeFNwdWJGMVB0NmdSTGM4d3A3c2NnZWw5NG13K3Ex?=
 =?utf-8?B?bjRDSXRtcDFIRmVPMWdCYmJwV3VQdVYwdS8rbUdZMzdOWlVWVWdybkRtVTl4?=
 =?utf-8?B?WmZhSXRxK1pVTnlkZXp4MDdwRkFJTG5UZXFrNFBDcE5WWUcxL1Z4QmFUV0Uy?=
 =?utf-8?B?TnJpVHFOWkRVdThFZ1Fzc1lhRmZZYlNEbUdZQ05CbzFtcExicmxRUTl3a0JK?=
 =?utf-8?B?RjJSUXVQc1NSVUlGSWF4S0JKK0lNZ2NaZXYybFBrc1p2S2pTTTZkeHZha1la?=
 =?utf-8?Q?mHgOhgiBPmgT63faEMYq6E4nkj2/OssOvG0BqcA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4a3501-11a5-4e0d-d2d1-08d9781f8176
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:04:56.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuAqGZC81YIGSNncTzgoC3wMFhEGrdY4uit9h4z5VybWLv/knuYWhZlsnbYW/izDp6DpXi3quFcfXBEZQsmsAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2636
X-OriginatorOrg: citrix.com

If the new gfn matches the previous one (ie: gpfn == old_gpfn)
xenmem_add_to_physmap_one will issue a duplicated call to
guest_physmap_remove_page with the same guest frame number, because
the get_gpfn_from_mfn call has been moved by commit f8582da041 to be
performed before the original page is removed. This leads to the
second guest_physmap_remove_page failing, which was not the case
before commit f8582da041.

Add a shortcut to skip modifying the p2m if the mapping is already as
requested.

Fixes: f8582da041 ('x86/mm: pull a sanity check earlier in xenmem_add_to_physmap_one()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Short circuit and skip modifying the p2m.
---
 xen/arch/x86/mm/p2m.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 674a6f4fe9..bcdc5c7014 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2799,6 +2799,13 @@ int xenmem_add_to_physmap_one(
         goto put_all;
     }
 
+    if ( gfn_eq(_gfn(old_gpfn), gpfn) )
+    {
+        /* Nothing to do, mapping is already as requested. */
+        ASSERT(mfn_eq(prev_mfn, mfn));
+        goto put_all;
+    }
+
     /* Remove previously mapped page if it was present. */
     if ( p2mt == p2m_mmio_direct )
         rc = -EPERM;
-- 
2.33.0


