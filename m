Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631994AACB5
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 22:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266144.459832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGScq-0006nb-HW; Sat, 05 Feb 2022 21:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266144.459832; Sat, 05 Feb 2022 21:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGScq-0006lU-EG; Sat, 05 Feb 2022 21:29:44 +0000
Received: by outflank-mailman (input) for mailman id 266144;
 Sat, 05 Feb 2022 21:29:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIk1=SU=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nGScp-0006lN-8N
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 21:29:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9db6810-86ca-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 22:29:41 +0100 (CET)
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
X-Inumbo-ID: b9db6810-86ca-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644096581;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ILYKtrJXEtUez2j+naLBzP7MvZQD5iPKKi7rHGXvfr8=;
  b=g/gDQa2PMiWjP1tbDN3lKQ4UR/BVAm0m0zKIAJXNgbw77G4u2BX0w2QU
   bjh0C5Keb0qZ1bKqyPzZWPZWYmRPXC+skPevwyxcnGNOWWrG3UxgivVKD
   TMsECw1fEYW3XhNDHTeCT+GnrD8SXs6q41RvugmbNLlIGgfKS3p5GG8FI
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lhbLRTjsRHqS6GrYBrCNpcBZmXnqF4pX0ui/8Pco2fsbjPJcMk4C7lL0GmWYoFiHu7lWSQA4/h
 kG+/b+HxSUb0bempSn4bOXUYJfNUUh6JvExKejG1gQSh/ZFm0MeujnWvk36CMKwt+0jLexlIcC
 3DFlNSWv4bIx7BaU032t5bBhjpyeRi3VoXQGwL8ENQux5PaWkfHvyum1VY7j1xPKhb+sD2houZ
 a8pWeSps+fAxRg6WAec8uRjIH9T9bRwoLxrBo1CWJfVoHddKPd0KcKHKOjaIEx82RuTNXXOwW9
 vgqKq+yHLrYRhM/XVRVOtATB
X-SBRS: 5.1
X-MesageID: 63033335
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E/B+BKMhhbaWOdXvrR1HkMFynXyQoLVcMsEvi/4bfWQNrUorhTAFn
 TNMWT2DP/2Dajf1Ldh3aYuzoR4B65LTzNZqHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxWFxOh8y
 9JSiYaTezcQD/WLibQyegYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsZhgd4sIY/HIYUbs2lIxjDFF/c2B5vERs0m4PcGh29r3ZsVQJ4yY
 eJHczp/aSzRTCcWeQwuL7UUsriapGDGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ1NRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiF6I5SYRWN1PL/cZ2jG0+/KT8la2L3dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtvxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/IdgIuG4heh81Yq7onAMFh
 meJ5Gu9A7cIZBOXgVJfOdrtW6zGM4C8fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP+eTFPha9F+xaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/q9JKfQtUfCRkWfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMBiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:xCpf0Kt8zudxJNNwjtLpeHd/7skC0IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKceeEqTPaftXrdyRSVxeZZnMvfKlzbamPDH4tmtJ
 uIHJIOcOEYYWIK7/oSpTPIburIo+P3s5xA592utEuFJDsCA8oLgmcJaTpzUHcGPjWubaBJSa
 Z0jfA3wAZIDE5nF/hTcUN1OdQryee78a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NTgj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDr1L9qqq
 iJn/4TBbU015rjRBDtnfIr4Xi57N8a0Q6k9bZfuwq5nSW2fkNhNyMLv/MmTvKQ0TtQgDg76t
 MW44vRjeslMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1TwKvEeK1wbB4SxbpXW9
 WGNvusrsq+sGnqGEzxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0qN
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gKcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltBEU33HNfPW2AG4OSUTevqb0oMi65fgKo
 SO0bptcoveEVc=
X-IronPort-AV: E=Sophos;i="5.88,346,1635220800"; 
   d="scan'208";a="63033335"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOSbIIY+49IuyjzwPpIULMe314Pr6n4faqc+O6p+7P7uWmZL3b+ksGE1MjjWoHGq+3KPucncQUztPXbHvBNMD+KI4xvL+8fJq31Xys8IcUZAeJ1ROgVwNVNR1Uo5E2TP5fZloXsH4RTG5yN/qZ8Y7ri3RmatrThu7XNXJq6mRMfxc98GQJ/nRO6PjtDMMIwZxFwJVH+4P0Acf8Vlx1hrO0mcnmuDiXNvHKb06F0B8ZPLc5pz4/RqIV/hoDZz7lXGSxICw0/8+wlwrOnq+cuEHMuZOCzuwKxRPRkAw6/9EZ6F6bKhmbX4RzQERP6NiBHO8EJCimsGx4P6UBYcetXcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A3Tuku/0GdrmDCeToXondAN5ZO6FISbV8Tp3BuboDY=;
 b=jH6YXy4H767OIK15Tzj0yOuqH3fZJiNXQnor233OD6gnNBuuFuvcgmc12C3Rc6qnDzQ4dKQ7C7OtwVs5K0nM0bhSRnpoh1897f0V+jRQTeCtWRQLAeFhQVm2iIGJXXPwmj65gf/9HxOKTx04j4SWrC4+spBMX8qpTKej1yemfl83UuI4qlT1x0U+pILlspjOrAZLJUacprdqdmThb7TPZQmLCwZaTy53PFqY+/zMuIVyiRlhd05+D2SxKlv46+l+6aT57BKb54Zg17K+Ik8IW3gSQrqFQD5ZJ3bIZjLmlAq/Xtacu/Fq+Gn652geQPlW5JrVzUKrd46WuUnaTQEgnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A3Tuku/0GdrmDCeToXondAN5ZO6FISbV8Tp3BuboDY=;
 b=MOZDiXx06vPi9hJBr9ot6eXlMgf/iVj6cZbmbdeD7mLmRNlkiSix3+TDTUqQdreTFxEGxImNY3HhpG8EDZ6+89LjeiR+FElLVslvZGnZhPxcAgY+kIpFa6dHJvIsBfS6LekXLiCKEyh4VhSZyB/NQpKeU8LWOXicKlwfT9RZRLc=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 08/16] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
Thread-Topic: [PATCH 08/16] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
Thread-Index: AQHXcbg9+9E9Zp3QUEWtGX2TK6aCNayGy30A
Date: Sat, 5 Feb 2022 21:29:33 +0000
Message-ID: <0C051DFA-9147-42DB-AA36-0DED3D192F43@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <694a6590-0018-223a-c796-3e1469ec354a@suse.com>
In-Reply-To: <694a6590-0018-223a-c796-3e1469ec354a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a81960e-72ea-4e90-13df-08d9e8ee9a19
x-ms-traffictypediagnostic: BYAPR03MB3845:EE_
x-microsoft-antispam-prvs: <BYAPR03MB384593A7E9E6CAC333BBE547992A9@BYAPR03MB3845.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QDeioCJSdK0XoKB0zgo6XYrEzFxZajMVec6mqHHMdCrkIPXExRGHH7UHqHNCzEafY2e+fwNvRMjxy/f2sQwQvXr4ayNWe5/RYisAQZTuHL1FBGArar4kXVq8xpAsW9TrOhCgEtFk13FtwF1wknP1uCRuSjNZHw6VyQ88AcH+0AjdMsjFWNgaIlLZt/iYiaAX9h4zXfI4e92fafIJE22ixVj2TesyJoucsDLN8NpnHQ7Z1oFnEkTr15lZpokdjetV7OUvlnwXi0/I17etYQnBRX4pIiv8zust6E5uefmeIexdKPGgixixk4LMS8lu00aCHkdpP6rIHNNirv8I6HqxDVgR2Ly5HztdJaTVgp8z6Gy0PVpLHKHwKehmxQNQt+LiK/DaSa2+UWPqGU8S+uiMqACzINrET79g6EsXZ8FZZYlgqAStkrepxpT1VBlWFqClw/3gLIwwM/LBXSXhvePmgog8aCxlNGtWx87jgYmrffd4kNK8wErdm1CR6WRsP6JcAEPkmyXG9RNi0fBzp8LKalI5X+tmk71OaJpYD/wEXKa7bSqimW/zIwXD0/ENtNMDEhFk8jt3QORIZaBjZWoQDlu/cvwJz8VGtXyKwTMPcNu8CeAdrqnVgcvTn0w/vE7Tbc1zycivpHfNZyLdfZDQp4yELorxlAo8OHsVxLb8gucq1znHBJQK3auikQ+wBbem7/nfvRzqduvbSUs/tzmcjH+X1CNOeZDxITtPAGzfnJCjvx7oyL2IiGdt/xhdvNv2VIB5JgB0x3KuCmqaRYm/azvdK0tX9GCVblUVLgzo8/Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(66946007)(53546011)(6512007)(5660300002)(83380400001)(2906002)(82960400001)(6486002)(8676002)(38070700005)(86362001)(122000001)(508600001)(6916009)(64756008)(107886003)(91956017)(38100700002)(26005)(186003)(33656002)(316002)(66446008)(2616005)(54906003)(66476007)(66556008)(76116006)(8936002)(71200400001)(4326008)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?49i5zNffZggWslnSZXRWQMbLhybgPyIgeYxkdTyftczt4NzkdKNqzFwZG9ra?=
 =?us-ascii?Q?pi2UtGY0I4eX0cc3pxY1eZRxr2461X7sgVBooEx7y59Dgc2IK8OjZ+U//DUc?=
 =?us-ascii?Q?T322veeuhvwzWUlPbjpffqM6aO+wARliJdCmsKyrMPmRe8B3KB3NdogBFLbI?=
 =?us-ascii?Q?hLdQgofcvh8lW1JwyXRYrO1w06YA1KBDpHNtCoeh/lNLf9+X55/83bVc/Ht5?=
 =?us-ascii?Q?3RBQOJCXyvn3kLr6csUd6NPe9n6wzjkUWLmmwFWfRSQto5Xmgcc9l5mKV69C?=
 =?us-ascii?Q?jToXNKWGLL0jiWo0VpnC5ouR0e+yOUdt2J8vvyQX7SUbQE9DdWsqwGfe3tHu?=
 =?us-ascii?Q?1cgXuE1URcl2o+T04umllcGBywHZNiEpdhMaP94EQ8GfzXaeHodKxEGPcsk7?=
 =?us-ascii?Q?LyDux2YCBgGmb3dcDKJZCrztPIrAbFRpMAWkLpOk4L3GSEkPS/QckoGUwMJv?=
 =?us-ascii?Q?DaFY9v+HLkb/MZYaPz3ra78aw8KWPBRSL5cTQe3zYga0yET/u8EYF9s7NPsP?=
 =?us-ascii?Q?CjnOE6hVki1koz7YGknlgqWLERmPORyQzxtA0sCMMWqD51MhkoZU5ED65hOn?=
 =?us-ascii?Q?bHKXw8+OlyUby8qVZ7LDVgdUa/aqxNhEHNv6lPdicIveKapnL1Rd3rf4EgrY?=
 =?us-ascii?Q?gC2Tk5moIFcKEXCLh2oWPtGfpioMQp/msvUJlbH38cBh6ktDdAevH8p1ZkIu?=
 =?us-ascii?Q?dmSHFS+mvF3gGwqMkTgDFU8FMgwlxKlH8RHWf17lMBGHn4w76/mjjdrlA6P+?=
 =?us-ascii?Q?PBWpgkxrriYnz6ceoRueiX9Q3A4neGAsrwxVftbKvG2ilrLvYXsT3RSdCTzY?=
 =?us-ascii?Q?+O8Ox2vjRioz2lGsPHCnVRldGqCDN+J4eqjoGuP7WW1umg+upLJd4Lmk1kY3?=
 =?us-ascii?Q?//juw9lgMVMb2QnMGbP1nZAOiOSgh6PuaFGWqlbpR2mJI5q6G9bt0MN7Yajs?=
 =?us-ascii?Q?M5ACBn3Ik9rlCB4j3mBDULf4E2bQp6tflPTg3huRUaiuGBySyGzYH7XgOPz/?=
 =?us-ascii?Q?+aN6RZzCeimr1IYIIq19bD3dtcB3LmseNwityrbuC8KISgOMISVzxxJLaVUG?=
 =?us-ascii?Q?GN7tSVVDXWSonsfH+sTfXKkqyARlQB/X6ggN6gl6QvJwG09zk2U9j1+X2zVo?=
 =?us-ascii?Q?/KL5reurkk2cgy75eqD1DowJCdVMDEahrnXXhs3dYZxD+2wcqkuuNwZIhxF2?=
 =?us-ascii?Q?6oDj0hPoVbCr/jXKC2oaN6si/Ftwl/LlqwHplqG+S6Z7SVRp2xDE8t3ljL1C?=
 =?us-ascii?Q?cmWhRK5uzRRIlu0QEp7dhujjuQeQWwEMOdLT3nU2wF+zfkb6NJDrqVqMH0vO?=
 =?us-ascii?Q?cv2jR6259okdF5xJf1Vt083ynKXTYQN5zVjaSiUiOhoreBsEiZn5JlhcLUZn?=
 =?us-ascii?Q?WbMia2dNwadS63Lief/eC3G4CbFrv6dvPblSQIThiZy9/Yik89OwXJKE+SA/?=
 =?us-ascii?Q?fQ3ugVAuXmKoQW24L2I+vhkUzZZIF73jkp86BPl6nTGBQbqBn3fOMuG00qgM?=
 =?us-ascii?Q?Xi6AK68Mca+P5UJl4/de4EvsqBVTssBGOaFIdqz/fQYS5aDJYb1Nz74BsNmK?=
 =?us-ascii?Q?K6Lrec/SRRxoFs61dBonGXV4loEc9bb7ZkNU3LWVYB6G+PVXv2zaC0t5Fgxy?=
 =?us-ascii?Q?uc0oqZU+VUXTMc/ViorvOFIiHwnvdG3E9fi4e3muQARUQspIgIy2eySMkO0o?=
 =?us-ascii?Q?fRIw4LT/pf7SGt8n3pOGkCTDzYo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D759E4FEAA9F454092D58830EF79762A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a81960e-72ea-4e90-13df-08d9e8ee9a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2022 21:29:33.3893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KV4MzCgOv0nx5pqVWgFvrEARHLEMQrKbk6/3SZSqG5ZSkc36F84iEUc8Ub7c5tcOQse4WlNOsMMQgAqer9FjgbknFysFMXUD4sLU3QzSYPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3845
X-OriginatorOrg: citrix.com



> On Jul 5, 2021, at 5:09 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> There's no need to initialize respective data for PV domains. Note that
> p2m_teardown_{alt,nested}p2m() will handle the lack-of-initialization
> case fine.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -102,6 +102,9 @@ static int p2m_initialise(struct domain
>     p2m->default_access =3D p2m_access_rwx;
>     p2m->p2m_class =3D p2m_host;
>=20
> +    if ( !is_hvm_domain(d) )
> +        return 0;
> +
>     p2m_pod_init(p2m);
>     p2m_nestedp2m_init(p2m);


>=20
> @@ -259,7 +262,7 @@ int p2m_init(struct domain *d)
>     int rc;
>=20
>     rc =3D p2m_init_hostp2m(d);
> -    if ( rc )
> +    if ( rc || !is_hvm_domain(d) )
>         return rc;
>=20
> #ifdef CONFIG_HVM
> --- a/xen/arch/x86/mm/p2m.h
> +++ b/xen/arch/x86/mm/p2m.h
> @@ -17,6 +17,8 @@
>=20
> #include <xen/mem_access.h>
>=20
> +void p2m_pod_init(struct p2m_domain *p2m);
> +
> int p2m_add_identity_entry(struct domain *d, unsigned long gfn,
>                            p2m_access_t p2ma, unsigned int flag);
> int p2m_remove_identity_entry(struct domain *d, unsigned long gfn);
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1135,6 +1135,12 @@ p2m_pod_demand_populate(struct p2m_domai
>     mfn_t mfn;
>     unsigned long i;
>=20
> +    if ( !p2m_is_hostp2m(p2m) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return false;
> +    }
> +
>     ASSERT(gfn_locked_by_me(p2m, gfn));
>     pod_lock(p2m);

Why this check rather than something which explicitly says HVM?

If you really mean to check for HVM here but are just using this as a short=
cut, it needs a comment.

With that addressed:

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

 -George


