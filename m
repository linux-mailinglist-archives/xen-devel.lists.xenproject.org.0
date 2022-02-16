Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA2A4B838E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273785.469046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDe-0005S9-Dc; Wed, 16 Feb 2022 09:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273785.469046; Wed, 16 Feb 2022 09:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDe-0005Px-9S; Wed, 16 Feb 2022 09:03:26 +0000
Received: by outflank-mailman (input) for mailman id 273785;
 Wed, 16 Feb 2022 09:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKGDc-0005Pr-Ff
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:03:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49d2c6ad-8f07-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:03:22 +0100 (CET)
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
X-Inumbo-ID: 49d2c6ad-8f07-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645002202;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=82IywCEJaGTDXuJv2gZ75axUySAXEkRmFEmzOfBUsd8=;
  b=W7pChdPUs71u3NehX/qA2Z25//6GKDeaerBUeKFzO6EhMl0NZyOIoBzo
   rP6TxrnXmFhulxV5lue88YQcPmRrorRDYDZTjLIq+9Xbs3ZMbNoz/7Ki0
   0PAgaxAFZedNNLCi2o+BYHnnGFv83n3ah62J6iKAKI9IkFSN0zeidlvhg
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1mFEKa9nNCiyfp7G+lmowVrtSPBHYrvOfSgYpNytdbg/UB1EG6Ghr/x88v1p/n0mKdpiRUOjph
 1dWXn3WHYmSCLw3w0MaVw6ptJTJTegiJMJYbLtOQ9puXIyBrnvdpgQy7PkIqTS47KLx/3V3wSb
 TO+EUOnTw1P2c9CM+aaLZmUxn2iT0mairD08nyb5bjQ37pGMJEC1q0dwkSSnN+YofraW1w2f3Q
 NbVSbut09AKh2BWfbwhteWtaY2jN9RRqNHbwUYsh96/RlHnXJAid+Q9yD74IQTlyk90x5/SsVe
 sAwFoAl0T6nrN5ia/1Rqeugk
X-SBRS: 5.1
X-MesageID: 63762583
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kuOun6jGJyjlHrsWiEMzvDd2X1615BcKZh0ujC45NGQN5FlHY01je
 htvW2+FPKmMMWL8KN9yPtvgp0ID68PXnddjHAs/+CpgESsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0TuIadRywIGJTzp7kbChZSHShlD45ZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3Z8QR6uOP
 KL1bxJmSTnBQTFUBGsTN6IvkeaVtlPcWAxH/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWn8tZ6jVvVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Rizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxQxvae4R1m80I6rkm60YCcfI2YZVwwbGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/Azr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6vdWNE/qQQ2d3XEy9hL0yT+FWy3yGsjTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CqyFM4MUM8kgLVXvEMRSiai4hT2FfK8Ey/9XB
 HtmWZz0USZy5VpPkFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNxfQFzLyZo
 SvkBye1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMPrYSPFNZ4E
 KsIfduuGPNKRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZu8
 ae90g77QIYYQ1gwBsjhd//ynUi6umIQmbwuUhKQcMVTYkjl7KNjNzf10q0sO8gJJBianmma2
 g+aDA02v+7Ip4NpotDFibrd99WiEvdkH1ocFG7etO7kOS7f92ul4IlBTOfXImyNCDKqoP2vP
 LwHwev9PfsLmEdxn7B9S7s7n7gj49bPpqNBylg2Fnv8cFn2WKhrJWOL3JcTu/QVlKNZowa/R
 mmG5sJeZeeSIMrgHVMceFglY+CE2a1GkzXe961ockDz5Ssx97ubS0RCeRKLjXUFfrdyNYokx
 8YnudIXtFPj2kZ7bI7eg3AG7XmII1wBT74j58MTD4LcgwY2zk1PPM7HASjs7ZDTM9hBPyHG+
 NNPaHYuU1iE+nf/Tg==
IronPort-HdrOrdr: A9a23:QkX71K3ZCMglRTSWp1MU5wqjBV5yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFm7X5XI3SJzUO3VHHEGgM1/qF/9SNIVydygc/79
 YeT0EdMqyIMbESt6+Ti2PZYrUdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngOObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Li1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESlti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAx7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1TwKpsKuZPIMvG0vFnLA
 E3Z/uspMq+MGnqJUwxh1Mfj+BFBR8Ib1S7qktrgL3h79EZpgE686Ii/r1vop43zuNOd3B13Z
 W7Dk1WrsA/ciZvV9MEOA4ge7rBNoWfe2O7DIqtSW6XZ53vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="63762583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Otbo96aYKVZ6p59KEF7xSUIz8OTrjvoSKd/6JcunhlPTwHA40rRUq0EJe0i9X5Cfo5VwqBXk7yMgAjPLslCwKZP3CK3tGT9LsLfyJhEZfHoFnrD9rNQ7Sb6RUoXcEiFIy4G7rQXuQuxcEgCSHp4VHE86kOkEWYWlCvEQ/r+On56gejp/wGImn2q60MhwcQI+mkHpuyTwuH2dH0jLwSSErkCbfR6NySvr66Gnv2mPBg9hSig6J5/iXW6LTFQBoG6CSzIlzjSCLMT7fCaqUvNRlXORNQefRJF76LESdcVhqejOFgBuvjJO7WySgTwoBfxFmfzEzvVPTwVIKKTYsp5FmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JUejUh5yzqKtWUj7o1W9V/dctJs6neBQWjRyLXc7bc=;
 b=KIBKO/keR0aAat2zGxHfEo2OvEIdLZY4zpDHpc7m9DGpni+B9Qu7UGaxoHfBN0Y3hhlFAf+Nm22yodQBIzCd0UuhJeN9W8naz87O5+KsxQ9kdskK7+bAPkuL8faHvBgETvwd7Wk6hBpNQaqt5KOSI7UhOWLcPBlxhuTdK9TEMLYci7FHh51cKjn7Bo3KcW+8n3pDcuGurBVMIGm9tneyRZpF9KIl1JKmXiN3JgQC7tDtXKY8xrspw8vt+qKuHnz4MGaguJzyuyOj75oTkHwV8/GbTR0bs1aZG0k04OIzCnVbUCk9Q9q++HPvPudhKJWH4G2JvojCzyv668ZgFKJU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JUejUh5yzqKtWUj7o1W9V/dctJs6neBQWjRyLXc7bc=;
 b=bIUVCrGGuR9y0aASYYngBKRu5QXGBFBMW6TNjJ5WPQkSrudTi72msTjkW1LPLVQyfXvc+Eb9VyiiECqyB3ekG/wFvlsfNCyFq4PRGdWI8iFqh+d+0wXCjM3h0c/u68JlreoZkVUmxuIjYf8FLbnW3F4LbJDeEMTlpMjT/P1jHEc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/3] retpoline: add clang support + Kconfig selectable
Date: Wed, 16 Feb 2022 10:02:57 +0100
Message-ID: <20220216090300.9424-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca098a8e-2156-4c28-c9b2-08d9f12b2863
X-MS-TrafficTypeDiagnostic: MWHPR03MB3104:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB310415003D38B1EB6DC490DD8F359@MWHPR03MB3104.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJ+UZ0GZN7gRZH9B6xopiL+cj7/Wp0cIW+RD252AtsoCDkLCBNNXWApgPqKL2NSLoGLmeGLFwPI2z6OzT4HZP0bx50cjlEU0ceVkMOR3Ncbrss9ZubAuYodZmK9Teve9bOC2A/w9O6BlSy3QjIKk6O+aj5dXWY48L1NNgSkTesYC0VutPB+2VZMZlNh5TOVBcJluOHdohMlsQaKg3h2AYqcCSDuhsG78+D3BY/By68Lg02vadUrIj8Uj2lwB074hXSSTM75DpVa5EnOIvbUR1kWBQBdbsjIr9LZvTIBpDQ2/r9bmXCnCfeEuOgQwSzUzvLx1jo2/tnOCIKHFncCsChrRFXhORk+u60U7lhuJBjSh3RzksyRKuCE2CrUcDjWnWxmRWnZXcUWxazV/+NooI+tBkfHvHyWmR0ctNnlLr9Lu7T7+Z7zhURbboeYlW2ThfhOh1/mkDwDiGxC98Vx3whRpSQPrlKlCQBY/wtXrsP2PImI8lhVYIgzIUJO+M+xZ8O0IjmZVoetEYOO2U+p7efDOx/GgQHz23ahaB+jmsxDi9szFm8pmP8B6G9Dk+9W0GGxeOwk9zfLgRBaOOn4lwGaVukY1xQhZpUDq4MvYIffCgKwtwNH61dVmvDHqOrwmco7tTGXgFv4a5RUX47XTvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(8676002)(6512007)(2906002)(86362001)(6666004)(8936002)(6506007)(5660300002)(83380400001)(54906003)(508600001)(82960400001)(6486002)(38100700002)(6916009)(66476007)(36756003)(66946007)(316002)(2616005)(26005)(1076003)(186003)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2s3dHNrc1BwZkZLVmh0OHU2V2FDY05nOGNsdkZsNGJaNHhQMXh1UjY1TDBS?=
 =?utf-8?B?QmdFVmxXYTBGSG0rNUtzdFhqTGVKajBUT2t1VllRb3ZBMi8zeFdnNmZWUXJQ?=
 =?utf-8?B?dVM1Vnd6M3BWMW9ZeVFHQk4rSWNPczZ6OVpESFVqQ253blNWMU1WaDhjcSt5?=
 =?utf-8?B?bzhKaDZlbE1sM2hwdnB5QkZqbDJaUHd3ekpnMWV1ZUVwbmh4czdxeEl6aVB4?=
 =?utf-8?B?MjRBMVpxQTgxOW42YXZHQUtmSHVtMExZRVJydWg2d1hYaUhhY0wyc1JuaHJV?=
 =?utf-8?B?b0VoYTQ5S2x3NDc0U012T1dRV3ZIc242RytHMzFQVk13OFJPNE80YkFOL2Jt?=
 =?utf-8?B?OFN3YTc4RVJOVjdEMndZczJxSHFqeTNkUDk4UXEzVGM3bGVFKzFSN24xUXJW?=
 =?utf-8?B?bEVEUFkzTnpFeCtjVnliSTZwM1JiRlROUkNOZ0tnVGFxemhpR3hLTU1WaFlU?=
 =?utf-8?B?ZUs1YXNqL2EzMkJxZDNEcXhXZ1lWOTNFdllkVit1U0E2RjBTU2FWWG1ZTDNv?=
 =?utf-8?B?a20zRjZKTU93SWdRUHg4Z0RJTEtrOEh6dWIraFByVG5sR0JRNk9PcS9uZlRK?=
 =?utf-8?B?NEVHN3Y2TVRxbkFlSm41WDZIam9OVENacm5pUTBVK0Q2TjFjVVM0dDJvK1Nt?=
 =?utf-8?B?dlI5TFZSTzhkOWowRFhYMXk4OFZDQi8wMW1HZ0hmV1JrUHNubUlWdmpsMkc4?=
 =?utf-8?B?djdwYzlnR0o2eHJwenZHemJMTTZRME5Kd3VvYUIySDdCbWpNZlk0MmkwdlZy?=
 =?utf-8?B?Nkk2MHN0VFJscVE1YWlpZmxDWTdOVDNjYldvUVVvYXRSNDNZYWU2RDlyODJl?=
 =?utf-8?B?eUx3SDlZTXJFV0lUR1kzSGFUR2hCMXhMenlGTDhKM3MrbWR0MGxRb3FrY25F?=
 =?utf-8?B?YjZlekwyQWVyRGQydmI0RitqMFB3UFZsRGFBTmdqczAzVURhMytTSFNaRVRy?=
 =?utf-8?B?bUoyYlVxVG9HdjRjNU5SQ3NYZ3JkUURPWDZDeEt1L1RmNFpWWGZUVndjcjNY?=
 =?utf-8?B?MS9QZ01KWGplQ3BSQndBSTFJSzlxL3VaNzUwcURXSWk2cU45WTZSUDh2cXll?=
 =?utf-8?B?U3VtMldvNnZQWnhMMTRpYjBzdGN6TzhwbHNVZ0dSR0RoUWRQaTJEaENOak1X?=
 =?utf-8?B?dVlpMTlONEhSMG1rZEFPOTZtOUFoNDFvTk9lWmVVYlphTUNrTnNqYnFhVFlo?=
 =?utf-8?B?UUxlUDBiUUY5eHFHZk1hYWM5NlowbWlmTnM1Q3RERDF6OW1lREN0bGZ4UG96?=
 =?utf-8?B?ZllUUHh5RmFzS2w0MGRQcTRiQnJmUjR5WVJHdW1TWVljVGd4dDJwUEdSVzJ3?=
 =?utf-8?B?c1NuTUNsUkRYbFd6UmdLN244L2tSZ0lBMUdwcjdxbjI2ZlQ3amZoLzFrbTcw?=
 =?utf-8?B?ZmhtNWpOSGQrWVozUGhzbzdUTHhaSE81cmE0c0lZWTVBaElPNTJId1RxU0sz?=
 =?utf-8?B?SVA2dW84eWtRcFQ0QW53RXdXZlhEeCs2NGFicHREdTAwdUhLZzZ1QXYrOWRv?=
 =?utf-8?B?L0ZLdzc1d05OUkxrYXo5SFprOWxuNGFSZGliVFRxUU8vN3E2dkk0VmYybGNt?=
 =?utf-8?B?cTJZK3kweUE0MVB6SVZuSVNNdUlNRUh3UXhXMTZ1cnZLdzZJdDF3R1ZkM1lt?=
 =?utf-8?B?MFZsTVhzTk5iVE94Zlh1b1dTcjk1SUNsY3RZRllDb3JncXA4TXlWYWtVQ1E2?=
 =?utf-8?B?N0x2Sm1zbDFwZWZwYTl4NUJscjJLc1J1YVRwSlp4Qnl6ZUx3SmRtbDJPUzZw?=
 =?utf-8?B?R0JZT09zY2FIRGhoYlZGWkhTQ24rNUhzOE0rYXNJUnl5UGlTV0w4RXVNOFJy?=
 =?utf-8?B?aStmMkM0eXBDYUFEUS9oOTBaUjhqQ0VKRDFlUGxpekxEZjNnR1JWMW5HeU02?=
 =?utf-8?B?QkhXRXJXVUgydVNJdzNnRU9vb0xKZGJlaUozdGRrNDc2SWxvRnpDcXc5ZjN0?=
 =?utf-8?B?U29SNG1teERCaWh0anJrbGl6a1Y5d05rOUFTQXQyR09mYmxRSE9KaWlqZGVZ?=
 =?utf-8?B?UTBuQ0NjV1dkV1YxQzEzU3VvZ0sxVmx3WDVQSGFMMC96aGFJNGl3NytoZG9m?=
 =?utf-8?B?d2R6NlZaZjlWV1BQcERyTUw3OURIMEN2ODlxbVgrMm40VFlycVh1ajN6N21y?=
 =?utf-8?B?UlZFZFNRNkREWFdPelNpMTdFM3FmNERrSlJUL0F0MXo2bGZ0TVJydmdTajJz?=
 =?utf-8?Q?fW5tJI2vcyIxfkElqRHH7Ag=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca098a8e-2156-4c28-c9b2-08d9f12b2863
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:03:11.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IuCKl/jJsbQZsnFwsz6blRINapCtteFJrzeoGlbANLlcBXUrdsrvsIM5WhjbjJdcy/TGKwnY55oFPcFdy36mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3104
X-OriginatorOrg: citrix.com

Hello,

The following series adds retpoline support for clang builds, and also
allows the user to select whether to enable retpoline support at build
time via a new Kconfig option.

I've tried adding a suitable description to the Kconfig option, but I'm
sure there's room for improvement.

Thanks, Roger.

Roger Pau Monne (3):
  x86/retpoline: rename retpoline Kconfig check to include GCC prefix
  x86/clang: add retpoline support
  x86/Kconfig: introduce option to select retpoline usage

 xen/arch/x86/Kconfig |  5 ++++-
 xen/arch/x86/arch.mk | 13 +++++++++----
 xen/common/Kconfig   | 16 ++++++++++++++++
 3 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.34.1


