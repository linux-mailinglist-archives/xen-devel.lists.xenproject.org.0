Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB27365AE2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113775.216844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4k-0001Yg-T2; Tue, 20 Apr 2021 14:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113775.216844; Tue, 20 Apr 2021 14:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4k-0001Wn-OC; Tue, 20 Apr 2021 14:10:02 +0000
Received: by outflank-mailman (input) for mailman id 113775;
 Tue, 20 Apr 2021 14:10:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr4j-0000xF-6P
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:10:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91416c04-4b23-4ec2-a787-16f6647b10eb;
 Tue, 20 Apr 2021 14:09:49 +0000 (UTC)
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
X-Inumbo-ID: 91416c04-4b23-4ec2-a787-16f6647b10eb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7GEPKb6ncYPoPihoILUyCWuStYhcu43arsQB5CIFPFU=;
  b=L3O5rcUGxVJtogKyOrG5gl6O2s3OPSnVhiQjVDuDFjzvUqtKH1aLEcFE
   zNGF6U6peVAcfP9jJnQi1wZAAK28IDsNbej+jJx/0qPHgA2MOPefZzbk5
   g67A9qTEdAtQfur6az5Rn6gTBl6vTRmkJNFK+wxSIOETmg1EK47ItR5sj
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VEEtpjlqf4G1++BClyikDs0Ls7k7Zt6xpVSuR1O/bHuqiPtT7hm68g6WfXeRCKNb5gdPhWo8ey
 Ns8U9Ejo2FXD3AYYO+saKO0YOwSFV7NytP+WJ2AxubI9aCxslz/T6zz+vVcG/jp1H94f6Ae4bi
 uamO87zMne5P0ljwKB/jq72qwpHvxtDsDE7f9bduTROSLcHb6/fktusw5bH6xM3Vse5/22PyHb
 s9NjYINPow6nNtQnso6HkyMFXRyuRCuRca4dW+Gz9lxUy32PisygU0HklI4EtFZkZQNlO6LUJW
 5So=
X-SBRS: 5.2
X-MesageID: 41981586
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:i1GYUq4SOFICYuRVegPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpT+jvfMk4/rZgNDOg4/5GC1/E6VwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLrCP0+HTU6/1t6bnc4/tFQPeBk80Ebgjr4zzYH7hJf52nkHQLrPq06FAs+e
 O80ysIG8ho8XveciWUjHLWqnDd+Q0j4XPj1lOU6EGLyaeSJENYerh8rLlUfRfD500rsMsU6t
 Mw40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ05baIibtZq3Oki1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmIpA79Ij
 CkglVg1saAeyuIzrgBDa0sZUxQdUgn8XxnldnyPbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbFVih
 ph+dmHk6u2cCX/sTqg8AdTE+Zr82y9R9m1Dx/JMelU88aiMVDJu5CU2qeI/X7KYAr+TV8Zi4
 1DfVERacoGqgBKtvxJ7gGCDortokwklFNC5ypAjVCF4Pn+3Fvm
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41981586"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiNqsrpIfT41HYdDcTVnK7WR1Y+ZytSUowSN9FihNKTwKBkleiykZ6UYts2wiDVeScg0dL3wD7GaLgjr5Z3JyPrN2o2WXbVCFWkzYxNqhQPj5eVwXbelPA5aQnnLqj64IUTLR+rLxEiAdcVA6unVQL9yq6ljpZXExuXRvaesMR4sCrOIM90jcfXicQ90cogaGmpuIueCvIPnypjeCAJBSU1WtHRFf4zjK906v6xXxs2IE9WSDiR9wCN2oAvijIw7Iv+agZ2uCFhtfDuQfom0sdwLHkuXh/0TI/Gdxf2ETRbv2qQk0gM1mI30QMuiBxBxZ0Ghzy68TJVaPW4gTooDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bszQ+bQrryson/MDnymvuIoXuzehE71ihmfPFljnugg=;
 b=nwpqGMLb1LMOkt/YQhPx1gd3IZX3gejEV8pG4eFPpT7cjz8ms+W9iW5S5bLUHiUFjRvE3qoL5uJqkXBdi+mnclF69FCqbYacY2leFkLwQICsIztKPQd9rxldUykI/WBexWyP9VTMe7qqTepeV4jKWgiDaXDOZbbF5x8VxeMQF+EOfzZam0ka8yq66NoV09w8HhlMKSUjZocCh0n4w4//ykXdsO0UN6InhU0oTAkJ1438kCstCSkcnMD2rUROUul2PPpsKGmG6SxwMHthrhADxnhqQ4G9ykK1FDqdi4JWm8IFX7e8Lo0XhWgcW3tlHk5XbmJKnq1wBWTy/wOOAFNqyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bszQ+bQrryson/MDnymvuIoXuzehE71ihmfPFljnugg=;
 b=Q5vqNM/UX7TkqqDh+Ox44YFOZnKbHEUvtxU7cpQWXw3nPd1KeF0xvQPqt6Fg4t16RIepOLiSGPl9352CeMJJDJoXpBPupnBb3KUjFBh0F2U/i92OoyfL6USaFM5bMz0VjlQLeBD62ob9ArSr5pBfgfg9uJa6whsvs6WA9nVFfo8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 09/12] x86/irq: remove unused parameter from hvm_isa_irq_assert
Date: Tue, 20 Apr 2021 16:07:20 +0200
Message-ID: <20210420140723.65321-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bbd9453-e694-445c-1e81-08d90405f37f
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60007F4436DDE3D6C9AD4AC38F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yrp19vMbdgSLoMYRN5sFOM/aW2kCSa3UfvBF91iX5B4wbnjoVo3XAq0I6MYRRhmX4FAoJw5gxmWCbn/nJ/+WrpexoMZkDW8lhuuoow+Qx4JGm3yoEUDVoBeGtxMx0spsJO5rEtuFZh2GNTGMXislvEvJWzUPsi2Tr15Dk4byy/oDNadBWvYj/arzDtELdoDUsLgrkHQUb7ykvJADh5MTlhYDTJFqBDkMpLPiorbcMMewLQx4esMTS7hKvJNsFRvcaxPhRIvgkHI6dHBJGsI03BXLlN3gRkocdN1X13jNYyiqTUf1S4MBNbSNPfuPM1ZmTOrbMsgJRqgvNmLt93UtJ7eegRwoce1RqSr32cJmWQK//26I4qLUWvUtM8APESIvxQsjYGto/nw3tzeZ2Fpx1lCc9VXih1+0CV3nifpeAODGhLw1GkEdxrP1b6vQ7lzOft5IEJBSaUe6Nk/R1oibarlbznvf9ihdk4UVBZbsZItn1Vl7qG+zCPsXE0ZZsC3MfHdL4Hn79YdMwA/oaILwUQkEaKZLHqVbptLiXHqUnvVGeRe88PxCdtQFhWlpxPspQJq0ahWJ0mTr/ny3wKUosOWAcymT1YMIFQUvLsT0Aco=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFAyRUQ4VTFWOG85OHNaTUlwd3A2TUEwVVdIZjUvUFA4OWFhVnBkYVIzWm8r?=
 =?utf-8?B?NVcreGdLZzhVdmFuSnViTklmbXFoWkcwZ21UU1FPZStEMXhKeEJHMUx5OFZB?=
 =?utf-8?B?Nm5KRDErMnBMeWVzbmpyc0Zvb0t6S1FJVElicUx0aG5IMldQV2ZjdXlPdkpM?=
 =?utf-8?B?cWhjamJGcFRCVUtMSWZQTVlTY2ZjR1JCbzVYT1p4OGpXV1NWWXF1Tm1aeGJC?=
 =?utf-8?B?V25tMTRORlgvYjBKY3dTLzRvWUZvWWp6RmprRHF1RXBQeGFzU3FYY1R5bnBJ?=
 =?utf-8?B?VTdld0R6QnUvTk04QVhyQlhTMjF5L2dGU1h0eFdhb0ZyaGJBa0NER3Vhbnda?=
 =?utf-8?B?RSt3VXhzblJUejdSQlR2Q3c1dmJHb3JobXFqeUlYU3hHdzFicHhhLzc5NmVR?=
 =?utf-8?B?TFpEWitKZ1drOFNGZW0wNXZHemM0d2FueUZoQXpnQmJacThMRFNtSVdYNHF1?=
 =?utf-8?B?anpKRkYwTlRlcFliNTRCaEpQVU1RYTAwWmttb1I2bmV0eDhJR21hY1djOTMz?=
 =?utf-8?B?ZHVLVjBid3huTEt1eFhhMzdlbXNPV1dtbkFoQTJEQzRRK0p5V2taYjUxSzFE?=
 =?utf-8?B?aVMrZytLV3JBa2Z3Rzk0aWJLS2N1bG5zMXczWllrZ2xveXBIV2s3N0JBdUlZ?=
 =?utf-8?B?cTFGaW5uMTFvL3BPK0FnK1Z4cFB2MVowL1VOTWJoeUxaS3BhYmZWbVdjSmJU?=
 =?utf-8?B?TUJPU0JLNVd4N3R6bzJIVEpERms2S3k3ZTZQOGU3Z3V2UE14ODdIZ0NkOVFG?=
 =?utf-8?B?ekRKakgrNCtiWDk1VjhJcTVJRXo2K0Uxanc0blduNTl5YTY4NWdvQVM1cXJk?=
 =?utf-8?B?aTNEcS8yaEIrOU9DbGFka2h6VWMwTjRKellHTmNuSkNhRnVGM2ZEYk9NVEVy?=
 =?utf-8?B?MThwRDRQYjk3V0xLb3h5STVEV1lqczdPS1FPSi9MNXdaRHMyVHFUQkFaWm5p?=
 =?utf-8?B?WnFGaHl5NnJLN3JpcExSTlMvZW85MjNtbXdtRDJUcXB5am1EZlVmUkhybWNw?=
 =?utf-8?B?V29NU25EZGNZQnhWSVFGUCtFeHlBbG03MUZNZmx2b0RiTXNXQnBRT1ZWK2g1?=
 =?utf-8?B?VUZKT003a0drQzkySndKbUpYWmtpS3NnL0lpTWo0TXVFYnNGNlBPSXBJTU1n?=
 =?utf-8?B?NFZoazBiandlMlVxZ1BiOUVVK1p3RytSWFFtYmhzVmlyUXVBNE9hSmVlak1m?=
 =?utf-8?B?WkV4V29lNmMwbUFaRWR4cm96aUNZUmZDazZ6ZVpKMEpZL2l5cEJrQ2hJRTI2?=
 =?utf-8?B?OHVRNFRvOVVWTzR6dWo0Y3hPL0hIYXFld2laWVZ4ZzI0QXErZ2dOclowaWhS?=
 =?utf-8?B?TVZic3E5bnVQVExSbmwyK0NIYWVrVzRRaElaa1ZhZ2JmRGRyc3FoMEVSSTFn?=
 =?utf-8?B?aVUrZHczdWxRZHpMUkR4YkFxZzMwVkQrWXNKQjVRSU5TN1pycENkak9DaHhP?=
 =?utf-8?B?ZVBTaGIrTk5lQkZnRytEM3RJRytFcFgwUEtTVXdsWVlZWE5sMURubUJFZXF3?=
 =?utf-8?B?STNTVGN1QXBkMmora0FScTF5M2p0NVRzRHJYODFjRFE1akRJRWRDL3lYTVFW?=
 =?utf-8?B?VksvUm80dldGbVRtRkp6RndPL1FHWTF4dysvTE1Lb09FNExTdk5mS0pwQnV5?=
 =?utf-8?B?T0NiU1ArbUl5R0pJYkh5bHdNRWFsc3dqWnUxSDFIWkEzQWhqSllOWlF4QTQ0?=
 =?utf-8?B?bzZvMzdEalROQ0lTZEpBQytNZWlBT1RydndFM25MMGZrN0FwclhuWS9HRjRP?=
 =?utf-8?Q?Y+Hy+MK8jJM61yVo/AHlkWCgelHo2dIWxGHi/bG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbd9453-e694-445c-1e81-08d90405f37f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:45.7034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Br+6PV/vvVSV4s/znOhGu+1M1wygWtaVzVywUtgtGf5otv2d7FRQpCy2ikUCYz2UxaFeTzULB/SuVpwYJANHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

There are no callers anymore passing a get_vector function pointer to
hvm_isa_irq_assert, so drop the parameter.

No functional change expected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - New in this version.
---
 xen/arch/x86/hvm/dm.c         |  2 +-
 xen/arch/x86/hvm/irq.c        | 10 +---------
 xen/arch/x86/hvm/pmtimer.c    |  2 +-
 xen/arch/x86/hvm/rtc.c        |  2 +-
 xen/arch/x86/hvm/vpt.c        |  2 +-
 xen/include/asm-x86/hvm/irq.h |  4 +---
 6 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index b60b9f3364a..c62a259b7fc 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -110,7 +110,7 @@ static int set_isa_irq_level(struct domain *d, uint8_t isa_irq,
         hvm_isa_irq_deassert(d, isa_irq);
         break;
     case 1:
-        hvm_isa_irq_assert(d, isa_irq, NULL);
+        hvm_isa_irq_assert(d, isa_irq);
         break;
     default:
         return -EINVAL;
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 4825a387bdc..c3d8f2a786a 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -212,13 +212,10 @@ void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
     spin_unlock(&d->arch.hvm.irq_lock);
 }
 
-int hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq,
-                       int (*get_vector)(const struct domain *d,
-                                         unsigned int gsi))
+void hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     unsigned int gsi = hvm_isa_irq_to_gsi(isa_irq);
-    int vector = -1;
 
     ASSERT(isa_irq <= 15);
 
@@ -228,12 +225,7 @@ int hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq,
          (hvm_irq->gsi_assert_count[gsi]++ == 0) )
         assert_irq(d, gsi, isa_irq);
 
-    if ( get_vector )
-        vector = get_vector(d, gsi);
-
     spin_unlock(&d->arch.hvm.irq_lock);
-
-    return vector;
 }
 
 void hvm_isa_irq_deassert(
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 97b9e41712f..9d30b145f60 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -61,7 +61,7 @@ static void pmt_update_sci(PMTState *s)
     ASSERT(spin_is_locked(&s->lock));
 
     if ( acpi->pm1a_en & acpi->pm1a_sts & SCI_MASK )
-        hvm_isa_irq_assert(s->vcpu->domain, SCI_IRQ, NULL);
+        hvm_isa_irq_assert(s->vcpu->domain, SCI_IRQ);
     else
         hvm_isa_irq_deassert(s->vcpu->domain, SCI_IRQ);
 }
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 9992595c45a..b66ca6f64f1 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -63,7 +63,7 @@ static void rtc_update_irq(RTCState *s)
 
     s->hw.cmos_data[RTC_REG_C] |= RTC_IRQF;
     hvm_isa_irq_deassert(vrtc_domain(s), RTC_IRQ);
-    hvm_isa_irq_assert(vrtc_domain(s), RTC_IRQ, NULL);
+    hvm_isa_irq_assert(vrtc_domain(s), RTC_IRQ);
 }
 
 /* Called by the VPT code after it's injected a PF interrupt for us.
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 6744b88d20c..639e45c520e 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -368,7 +368,7 @@ static bool inject_interrupt(struct periodic_time *pt)
 
     case PTSRC_isa:
         hvm_isa_irq_deassert(d, irq);
-        hvm_isa_irq_assert(d, irq, NULL);
+        hvm_isa_irq_assert(d, irq);
         break;
 
     case PTSRC_ioapic:
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 57d51c15863..4e3534d4eb4 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -214,9 +214,7 @@ void hvm_pci_intx_deassert(struct domain *d, unsigned int device,
  * allows us to get the interrupt vector in the protection of irq_lock.
  * For most cases, just set get_vector to NULL.
  */
-int hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq,
-                       int (*get_vector)(const struct domain *d,
-                                         unsigned int gsi));
+void hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq);
 void hvm_isa_irq_deassert(struct domain *d, unsigned int isa_irq);
 
 /* Modify state of GSIs. */
-- 
2.30.1


