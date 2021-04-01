Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65E351359
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104310.199380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuTq-0002Iw-1J; Thu, 01 Apr 2021 10:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104310.199380; Thu, 01 Apr 2021 10:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuTp-0002IE-TS; Thu, 01 Apr 2021 10:23:13 +0000
Received: by outflank-mailman (input) for mailman id 104310;
 Thu, 01 Apr 2021 10:23:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRuTo-0002Hh-Cv
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:23:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d23c387-a08c-4507-be66-d0669f50a43e;
 Thu, 01 Apr 2021 10:23:10 +0000 (UTC)
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
X-Inumbo-ID: 5d23c387-a08c-4507-be66-d0669f50a43e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617272590;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=FVzsZ0mkSIkxtRKP3p3PSvTjfw2kuq7GTDLAG4vG22o=;
  b=TZF+njdXjdpaQU9mnB+lorHIu1rD65SY5llUBc0YluDzpyRTTHNW5pBM
   rQbEWclV8d82QThPUoNroL/vL9hjQedc/PhWepfKQpuOZKY5ZMVBGj4SI
   mD/CKQWnXBTEsdHKwgWs3Q3ZTZYTy14NeLv2wjiB1NDlsw+bYEpJuQxtk
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qRYtQFagYKcNt4XqlQBWb8oK+bqim6YGuEFIfIlZW4pzcQSdcw7ez+KZM3VBE4Ch3Fwb1ynoxk
 6U2Tk9D7INfcp2Wjupzl4NmO8hb0IA2pZZiOTQ/Qym/tOY44dBJYxcre83bH/iodYwFtWEgihZ
 yVJgHeHCYoodEYMRXQGnbJg+v5X6NzF8Uw/Q01uN5CTUN9tPQlAbNhHYYH0sq6My6vhyw5X2MY
 Jxit2drsjXkd00xL4ncqUzvBEBzRpeH4wJ6togB6B8RDNrCFHeV8ealK1CmeHMOeMhmfJXumqe
 /ms=
X-SBRS: 5.2
X-MesageID: 40673825
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:C124Hq59MPwxKqZ6eAPXwSyEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpL+jvfMk4/rZgNDOg4/5GC1/EiVwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLrCP0+HTU6/1t6bnc4/9iIODJtcQPMDXrjW+TFfpccpmPpio8ru3qyHtCqq
 i0nz4aM85+62zccwiOyHOHsWmQs0df11bYxUKFmnymmMTlRVsBerV8rLhEeRjU4VdIhqAa7I
 t32Quixv9qJCKFtiH869/Ubgpth0q5rFEz+NRj80B3YM8wbqRcopcY+14QOJAcHDji4IRiK+
 V2CtrAjcwmO2+yXjT8hC1C0dasVnM8ElOvRVUDgNWc13xzkGpix0UV6cQDlh47hd8AYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XWp0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9D1mVbHDI8IVz9pJ5srrzSP7AKiuYUm0jlMOmvrExGcved/
 GvOI9HIvPqIGf0cLw5nzHWat13Ez0zQccVstE0VxalucTQMLDnseTdbbLyKdPWYHUZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG62ZpxFaPd7tUC0YRlDPwPjiElzXCCou2bIzxLtaI7OG
 FkJqn8r6+9rW6quUHF8ntuIRgYKkpO+r3vXzdrqGYxQg/JWIdGn+/aVXFZ3XOBKBM6ZdjRCh
 Rjq1N+/r/yCYeRyyAkA9eOKXmbkHMXmXKPQ/4n6+y+zPagXql9IoctWaR3GwmOPQdygxxWpG
 BKbxJBelXSDQr0iaKujIUdAcbWc9UUunbvHedk7Vbk8WmMr8AmQXUWGxqjS9SejwoVSz1IvV
 Fp6KMEjL2cmTGgFHsnjI0DQSxxQVXSJIgDIBWOZY1SlLyuQg12QGuQrRGxih04eAPRhgwvr1
 2kCRfRVeDAA1JbtHwd773j90lscH6BO2hqbGphjIF7HWPam3p63OORfJCv22+JZlZq+JBYDB
 j1JR8pZi9+zdG+0xCY3AuYHXI935M0I6jzCq8gf7y74ALYFKS40YU9W9la85ZuOIqw7qslUe
 eDdxSUKz29IeUzwACRrmskPi4xiHRMq4Kb5DTVqEyDmFg4Cr7uBX4jYZcxCdSV9XLlSPaFy4
 8Rt6NCgcKAdkHKLuebwqTWZQNZIhzdoWSKX/glwKokzp4ahf9WJd3nSjPG23FM4QUmIOr1nE
 0YRr5n4LqpAP4bQ+UiPwZQ/l8kj720XTMWmz2zJu81Zlc2iXDHe/uP/rrTsLIqa3fx7DfYCB
 268ydH+e3CUDbG/bkGC7goKWATTEQn8nxt8KejcILXYT/aPN1rzR6fMnWndqVaR7XAMbIMrg
 xi69XNptSpTUPDqXftlAo+BLlP/WahSd6zBwzJOdcgya3GBX28xo2w4MCyiz/rTyCccEpwv/
 wDSXAt
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40673825"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGU3gj+fEVCLHlOzWdAXzgS9WAOQikTT8B6jnwO1zAzOsLXbDcohJiMxDv3FiIL3BBGiHnLRM1HaRy9adC4QsjLGZeazW7CCuhUiXT60/tUVxoL/n1Ikl5vGBHFBt83nVASD8BLl8xlg0LoguPbAUCilf2Fe+AgtB//G8EFY8+2ZBFpcHVDiMwQkn/5pTf9j6dFr4OTWKUzlX5GWRwXlL1nR7ROW8Xa94qsFTqfNRo0dqd/fHvLODosXaGI/lUVaNCwycTXqGlcCoVBbHnn0b/lIpfCLbAwUvfEb1jlRYWVq5223M+ON44UxwUD1hjgFgoLKNoH4pB5ben47dvFp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzignekplPfrIkofHKCad40QtmcSARFz8dyYlMrVaZk=;
 b=K7Ga2K26AnJQwOQmfuFWqXEzby63OKCrz8vrLsozqKD+UD2J2amq3NMx7igAorRerty2hdCfg/Lmo4d6vd2ki7cJNEBUlcOywGdr6blhHiQAX2/5yUQlbfen0ofw5y5mR3tVd+QdVUiiafcvIXFVKNVqrOm/Jhp59vKGxmH2i6ZVmbEL+tOPeO0eWkCIzpkLcts44sVSnPznCV1K4Cb46j4gg8zCYJSo4BLbwCAIc3mZ05bJ1+t6l5ERzGryUw1BjbHmcwFhAnttuiO7BINAZXX72Irun+5ktnG0/7f37644JLC8pxcb4aHgC1QCt/7UVuNQMpDIYMXh0lJeeYOOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzignekplPfrIkofHKCad40QtmcSARFz8dyYlMrVaZk=;
 b=aKvkySR9SH9CwxOCFjFMs8p9b+3mTNklgGE1n8tnjVY7zAzSiT9neB2mzSrpXvDcRCvMCIu5OTjim3ZC9GOCoc2zYdagQdQGCUCOhdpYRuaYqLopyMfBZ2nImNQhZeI9NI8WyraTqC/PT/79/LFIj6FiOD5i1mgPKqY+mr5dpps=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Wei
 Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] x86/viridian: EOI MSR should always happen in affected vCPU context
Date: Thu,  1 Apr 2021 12:22:52 +0200
Message-ID: <20210401102252.95196-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dba7f02-7c34-4e2c-72ab-08d8f4f82374
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5542BF9107538CCC41143F688F7B9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xi6Kmv7EzL+yS2ii24RDitySm7GjLu0/kwzHqo3oH+r+odlJad8B0JCNT+F2IQpAHvsM5nI+v5jRb57hKD7Y71FVqyyr3/o9t1JT+9Sbvy3XArnO8XEcJBZNqiUMlmuqibo8HC55vpkzfTvYFBdzYyjC4NXz4gLzI3STrNkCF+Ad2Y9OHho1eWrSv8E04733HA7JRtygtRgvcm7YvVWZ1I0HI2R4C6B35mqcO0hBBcC53W0sQ+aTRrNIGvtY5Y3oGGxzwGmEAKTBMu5fC8PRYR97LryJD2Z0EBoFG3OopO+c/wAaoN+sAz/UuNLwT0lDrgYsKifoxbQobJm+dlzgONn/+k6vx7E2YIbu1mLoiDSH+bzT7lPqdkJGs0ci71Ah0hW9U2wb8sU66ODGmH330ebFLXjBlMKviMM+YlkmRlq1oZVJruOgELjvnM03QKPwg+r73uEBEHt/qC9A4oSLt30+RvhvO51gfMiR2VPtSCQUvf1gh44kqi/XAUQU7wR87mx6MRgkb8788b8AN7HGOupmzfQBqr4+Bi8P9R16B6fRxFp1nIl8VuuBz8lgY3P89idB6syvRxBb34A60ih0UPwi6O+cr+Q1tax5K60hyhX796GAWxFmug3dj3XrKnyJmyfKww2NhUnSfyCp5o4H3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(1076003)(6486002)(36756003)(186003)(16526019)(478600001)(66946007)(6666004)(26005)(8936002)(6496006)(38100700001)(4326008)(66556008)(2906002)(6916009)(54906003)(5660300002)(66476007)(2616005)(8676002)(107886003)(956004)(316002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWpGeVpQQXBOZmd2Z0hWc2NxMjJYUFdweWxvTFFCbWNiV2oyd0FmS0RNYTQz?=
 =?utf-8?B?eUtCLzdJeExQb0NjU1RYd0tMREd5TUM4dDY4WmM5YXhyT09jY25wR1VqRjBK?=
 =?utf-8?B?ZWFGZjJaNDJxNUVUSTdmVHpZMnZSMlJ3ZVBKaTZLcFRxRXhDbm52bWdBQ1Y0?=
 =?utf-8?B?WTRnblNzVHhIMytPdnlvZFljenQvTXFNdUUra2N2MVN0T0QxOG5ydXZKQUFU?=
 =?utf-8?B?MGJSUnRtdHlTQ1ZxbFFXU2RuZm9GN1BaNVpybTdrU2hJemNnZkJPSGorbzFh?=
 =?utf-8?B?OHQ1cWc1dEZGcDJsM3NLTXprWXNyS3FsNVJ0anVUNjlaNGhXcVhHVU5MU2Jz?=
 =?utf-8?B?a09VY0VjZVlsL0Y3K2xuR291UlpXQ1NuN0F2dkVmQXVxWVREb1FKcHFJMktV?=
 =?utf-8?B?bGF2VGNWZlErQTdBN05NK29jRlpRRUdzWjJRWUR4RFhKNWFJU3JpbFJxcFBL?=
 =?utf-8?B?Zi96V0V4SHJjcXJlT01FYTR2ckJTYUxtYWI2b3l2aDhucXVxVzZ0SG1FRE9K?=
 =?utf-8?B?M1FPSlN6RUw2dm9mVkFzOU9vdDJUaXpTaVVQZHRWa2V0SEovR25yVmdjS0Z5?=
 =?utf-8?B?bUFnR3F2ZkZBeDVyMTJXS1JCclA5M2hXcEZld2MrN0NJR1FkUllPd3hSK0Q5?=
 =?utf-8?B?djlFamRPakxDaWYxcVQ3cUhBQy9JQXh4M0NzRWpHdlAyU1pjaVRtdG9lWjJn?=
 =?utf-8?B?Z21tOUM3ejk1MHFRM0ZmV1JsMzlESVBGbFdGaXdyTDQyQlBaVnc5ZEdRY1lH?=
 =?utf-8?B?QlhjbUdCTEtJaGoxbVBCazFPSFd1MDlkV1ZUb3JPMjZKa0tNa3ZPNXEyM2RR?=
 =?utf-8?B?RE14MGFNSklHamkxZjNlVzVmNnNacks1dnlQTnY2QmtnM3Z0aW82N2trMWNy?=
 =?utf-8?B?ckh4NGIwWkdjcmlsdjdlQVp5TGdyV1lYT2NISWpuQlRsTGpTWjB1UzRLQUIv?=
 =?utf-8?B?bHFWOGpCYVh3ajc2T0U2bFpXVzk4VzJGQTJiOCtPaGowbmorMFpiU09wenFj?=
 =?utf-8?B?T1hRNzBZQk9jMlZyVmFNcHZQT0VlMVM4K3A1dml6aWdsaDNWa25EVHprVXdN?=
 =?utf-8?B?bml2bFNtTzcvZTNiY0k3RVJJbDFqVWIzc2thRDRKQXBQWVhwWW9xL0RYNEg0?=
 =?utf-8?B?aWVacmwrZlFaOEI0Uit5Yjk5OFpYQzZOakRhb3lteE1adnBhaXVBT3pzWDlp?=
 =?utf-8?B?YktpVlhXQ0JsdCt6MGV5WVp1MERmdy9uYWVUNHNjSmg4bWJHZTJIeUFjTjR3?=
 =?utf-8?B?WnhhT1o0NEpqVEdZVkhwNlhnYUR2dmo0a2YrZjJKMHpMQmRVa0NhSThoM3c0?=
 =?utf-8?B?TVdSd2J5WGkrSTJ4dTRHR09HNHhwa3FhMnc2aVgremVnbnNqbktMZUJ2ekNs?=
 =?utf-8?B?QWhGZTlFY2VTTi9LREtqbFlHTWpUaENCeXQwNjRRWnlaR2loUU5iOHc5UnU3?=
 =?utf-8?B?L3lhaU5ITTJ3WEFuR0xPK2FOR3FzL3NRQTE5Qm1iOFN3SURuY215anRyQjBN?=
 =?utf-8?B?S1d2OFM1M0xkZXhZZitFSU94N0lZaXZ0MTZIbkFVbTBLREhvQUIxOUVQNGpZ?=
 =?utf-8?B?WWtRNmQ2Zm5sSVpZMW9adDlKdFJGRUVINEFTN3RGOWdRUVVHM3FocE40VEoz?=
 =?utf-8?B?ZENseXFsNFRjcVZwdjJoYm4wRUNnWm1iM3FvV3JsMkhFR3Q3TFNQck03dVRG?=
 =?utf-8?B?aEZEZldnZEdMdGNBV3kyYjRmUUJmbkdtckpsOEtrOTQvS0gvdFZTcmZnNldE?=
 =?utf-8?B?MHFZSWVwMWRUN2U1bHZyNEZkczk2eTlQNEJwOWdCQkw4amFoMFRHQldOWFZI?=
 =?utf-8?B?MUIrNjgxMzd6a3ZSMXM4UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dba7f02-7c34-4e2c-72ab-08d8f4f82374
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 10:23:05.8906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b5TrogTHvmc/6j5HtK3X6uVkxdU0wj2wl7R12rk0JwFiFyLlyABjnH6MZPrliC44qz4k99P7+I1JSiDw7zmGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
as current, as there's no support for EOI'ing interrupts on a remote
vCPU.

While there also turn the unconditional assert at the top of the
function into an error on non-debug builds.

No functional change intended.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/synic.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index 22e2df27e5d..e18538c60a6 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -79,11 +79,20 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
     struct viridian_vcpu *vv = v->arch.hvm.viridian;
     struct domain *d = v->domain;
 
-    ASSERT(v == current || !v->is_running);
+    if ( v != current && v->is_running )
+    {
+        ASSERT_UNREACHABLE();
+        return X86EMUL_EXCEPTION;
+    }
 
     switch ( idx )
     {
     case HV_X64_MSR_EOI:
+        if ( v != current )
+        {
+            ASSERT_UNREACHABLE();
+            return X86EMUL_EXCEPTION;
+        }
         vlapic_EOI_set(vcpu_vlapic(v));
         break;
 
-- 
2.30.1


