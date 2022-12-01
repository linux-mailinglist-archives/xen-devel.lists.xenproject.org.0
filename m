Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C9663F00A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450636.708008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iDk-0005Fl-E7; Thu, 01 Dec 2022 11:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450636.708008; Thu, 01 Dec 2022 11:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iDk-0005Dz-Au; Thu, 01 Dec 2022 11:59:16 +0000
Received: by outflank-mailman (input) for mailman id 450636;
 Thu, 01 Dec 2022 11:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0iDi-0005Dt-MW
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:59:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0a6953a-716e-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 12:52:56 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 06:59:09 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 SJ0PR03MB7022.namprd03.prod.outlook.com (2603:10b6:a03:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 11:59:02 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:59:02 +0000
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
X-Inumbo-ID: b0a6953a-716e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669895952;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2QlTRpb0BduG87YX0l2YUS9nWhXre08np46Sd69s4qw=;
  b=LaRtL1hvrqBQt+7nqQ9uE4hCUgrBm1PLWWk/F0jQKfmJEjxgzhqwIErN
   Nm8Kqa+nEmouGEh2Rvww1/+kaiUoIt2SfmpNLxr61ZgX+LfctBrSTQvGA
   GwQGFcU6ebl+FelzOxDw3W3qla4J+yz7OG2icpwHklfC6H6mxR6GwYw4g
   w=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 85072345
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:g2/K26jGsL6PSGuD/OmHW64JX161fhEKZh0ujC45NGQN5FlHY01je
 htvXW3UO/rYazHxctwlatvn9UkBucfXz4dqHVBrryAyFCwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQXeDcIbiGvg9iH77mZTcdGl/4Bdo7SadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGybLI5efTTLSlRtk2Yv
 GPd42XwBFceNdqTyDWt+XOwnO7f2yj8Xer+EZXoq6Y12gbPmwT/DjUNbnyFp9acgHeSZNNnK
 30k2i0csIY9oRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC2
 laXkvvzCDdosbnTTmiSnop4thu3MCkRaGMHOykNSFJf58G5+d5vyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:ggowEq8dqcTY76NwWBluk+EKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVcqKRcdcLW7VJVoLkmskaKdjbNhX4tKPzOW21dATrsSlLcKqgeIc0KRltK1vZ
 0QC5SWY+eAamSS4/yKhTVQJ+xQu+VvvZrY9tv2/jNId0VHeqtg5wB2BkKyFVB3fhBPAd4cGI
 CH7sRKijK8cTBPB/7Lc0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfMJ8H
 TDkSb++qK/2svLuCP05iv21dB7idHhwtxMCIiljdUUECzljkKSaIFoS9S5zU4ISLXE0jcXue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgFP4yPaJDg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn93d7VTBtn/3DE6kbKqdRjwkC3bLFuIYO57LZvin+9Ka1wax4SPbpXWN
 WHD6nnlYlrmB2hHjzkV1JUsaCRt0QIb2q7q3c5y7aoOhht7QFEJhgjtbwidzE7heYAd6U=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="85072345"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMFlyg8KelmJTiJuJpj1Ut905Amro0mriFOt4U+WmDsWMCtkCZC/2PE4M9FodIwh7hmIdy7HXH1TS8rquFXfDmZ2XyI2OiD/I/uSc4xqJrLVhj2F8xSoCzGCFdCXvTpavBEkMWZEyBMp3QOyabosvejz1pSA6AANvPb+1oD8ZYdfyX0YL/OIc0d2xYRv5MXhpJ6vtZF6tVnl5FTukJoLFRF4zBTtWWfuqdmqwmh9OQrLYfPlzDCv34ucpC3lKvuFYUNhWwwa81zg6KLeVy1sLTN2v+zpGFk7Yc9gEsjZuHaqKIIa3RBQZNGa7INHuqE4gWe0Nso8LCX7isu5el+upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsYQ3Tm6Q6ZPy/nZ9w8l7ig2KIVv+wjnpnXuwKZi1+0=;
 b=OTevWftx45WUbp3HCzeVmsLLAJ197dubl48F09USfGBAktibSqYQJRbGMI8TdVu80HSJX+Z7a42SGtNHUb/fErAvuXYA1UWp8EEEI8FU+5cu+VHeMWpHqXfCKx6w8+abFe+pQWOoOueBezYqtPjC88yXVQTleQMm8Gwic3a3wpJo6WIhAK17vKkxNPgtWTA/JtuPH184D5OyCpSdsCtYLg2ckqqdxCk4NKO8aWjbmvkASCMSGJBiE0Vx0ccAF22Tg3KfL99u8xsC2XhYolkqFI0Ik8hH2EmK5r4nq05EaaS0puuHiyOAKZF/kWpjzXmRCDMKyjQ1gE1fO2vr40dx7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsYQ3Tm6Q6ZPy/nZ9w8l7ig2KIVv+wjnpnXuwKZi1+0=;
 b=JJaTLmr/p01GAJeQc1MtvnUw+iByleAYVrDm2s43xx5v3v8QznQc58Vph8FknkX8bDH3FvVGssNuwTjiRMVIOYUj3Kg0Nk0EVhYkYYrnpQhdhNo8uIjjyOUuveEW1CAeK+U/x5lHe4mNCSKkbXtidfzBR0F46HQm9CvE8QEJtoI=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 5/6] tools/oxenstored: Rework Domain evtchn handling to
 use port_pair
Thread-Topic: [PATCH v2 5/6] tools/oxenstored: Rework Domain evtchn handling
 to use port_pair
Thread-Index: AQHZBNyGYEY4cgr2f0u9q8Jh29xLbq5Y7uCA
Date: Thu, 1 Dec 2022 11:59:02 +0000
Message-ID: <B01EB9B0-2E59-460E-9F1B-04F2406C788B@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-6-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-6-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|SJ0PR03MB7022:EE_
x-ms-office365-filtering-correlation-id: 000de282-2399-449a-eb2b-08dad393704e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 l/xsbeo4dRNWoaEHSPikfCHefk0PqdlseU/bqkf9EneAkDl839NXR/lBl6SLBPC7XNdL4XU4I+5HL1WNHAn0ofPxAVxVhZ+xxIdgf6CTW8MS1HCPOTWEo1nSozW789Bi5f9p1MwZqebhC5vJF7CMpO/hTFfoKwMu/fur1Psk4ZwGziSqzfFbgZw1vCxUfab6/Bcj7wrZlxFPBQt5UN7zazyqnzJBYnT2KbDRzRK82gFhjqUaxlBVvrCVp82VfdU0kRyc4g9JTxuvMOqBNNi4bI3D6LcHMVKVL1H3DEk6ALlvyd2cnKErXG1pO87Fb+VZi5KiRYsopbXc9t4sRzRaiRmZJ4KuO9Myd/QQUmX7m55itVxZGYzCQCOdI5CBtofQtgQDmZisubi6PHZVlehG6OY4NWC7Db+HPaACSdikiQxK7Bd7LyGx6TsmKjvAApRRKdEsfaPdGI9xKt29gHN4wBDBcikJkKdXE87+MPFQONF+6bXINzr3/GH7T1/Bbyp5AFVIB0mM8P8CMnLr0eUnioyFdMYOw5eWjgK+lEOXaZ3d7+Zcb9OwuGIQbFBqXn8N058lkSwqpCVIWCtqAzmQJwOpPaxikqrm0cig2ri7bHOargRYL75EzKLh+ip77AWzkCGw0/2wG+GrznxIxBY/T6cRXZp4zhVxf6Tew8ZwDV2NgfZG509E9IkX6+3b0vwqxiuGKKumqSRSi9wZSqFUBENfwgVbL0XVi/b3RqQxYVA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(2616005)(186003)(316002)(33656002)(6486002)(6636002)(37006003)(54906003)(38070700005)(36756003)(86362001)(82960400001)(38100700002)(83380400001)(122000001)(6506007)(53546011)(6512007)(26005)(107886003)(44832011)(2906002)(71200400001)(91956017)(478600001)(5660300002)(64756008)(41300700001)(8936002)(4326008)(6862004)(66476007)(66946007)(8676002)(76116006)(66556008)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I7hCZztXUQl5zc+NeWC3ef4hthvoovtJgtR5MEc3+gMFbdyzNFj/RXZ4C4S1?=
 =?us-ascii?Q?Y4bupRa2TCbXkozbOptky+ylX26gl75US3Mkca1PjeQfC+emnBD2dhZfLwQ4?=
 =?us-ascii?Q?H/+HnWPU6H3prdwjDX6OUd2QyOCcNA81bn48tA0kLN6ifi0yLpM/CinkOMNN?=
 =?us-ascii?Q?YvW9GtvVNZDox/Aeln3H4RjcF9W12Oj8Df7L299RbdEhKziNntdE0nETUMtv?=
 =?us-ascii?Q?JmTftgE6PdAdIJhgv80JuZnGSqQ8IVAh86yhvEjA2IMGmFoW9rHaOhYVTug+?=
 =?us-ascii?Q?4FfskD3QDF1uLtaYVvqk/Le0cNriSsjpZElNqst8OdKsiStd/ycsCs4TOBXy?=
 =?us-ascii?Q?94UtK3hPQmTJXukHIr4x8nNeQpm3nHJuC4KdqATqUfanuEioxYngY0v28TWf?=
 =?us-ascii?Q?f9dCPRvQ8Y5ZKM9kMecw+IUmS3VZ1JfGJ8Li7PbvaKH4be99Ob1SSwfn9B3E?=
 =?us-ascii?Q?YS9hy43TQO7DgidLZ8I54hwixfSbkxpfScaSQhdtAae2wjEKhcBZg8fmXspB?=
 =?us-ascii?Q?B1eKuYgpwrhUx7bzBnmmAGT8hYWmd0kTh+LOGD78/2q1Hh8BB2Ru+WDXCLFs?=
 =?us-ascii?Q?9q4tlfKn0UCgiMWy4Vyofq/3pj+Bvjfjh24zCJAFxVw1VbLnQpg8wTWsANtG?=
 =?us-ascii?Q?DlCvjocYbZnLX4WzLSPcT557E91gI0+AKzEYCmdX12c9oXby3zLzIb83exVq?=
 =?us-ascii?Q?PX2plW4PRuvMT2w1E2KwTJOizYAw88nUcwbOACGqa0hA2cade2P0ygSVpKIn?=
 =?us-ascii?Q?nMJT46c99AzZux56BrEjuecUD+bonbR+HjZL1Nms9/cmyKqVF4dlV5E0jFUU?=
 =?us-ascii?Q?rbjNXRECKuGhW9NX3qU8tagLfIclwLq6dAueAihj7GPO4bvj75eKVZEsrRss?=
 =?us-ascii?Q?4azjJdU9ei2VDC+w5vGsAlvEnuKrDeM+V4+XUZIcmPsWU96hsihrcpg8E7Q0?=
 =?us-ascii?Q?j+FnCHinJggbNvtTLPdBx7+zUARV7TLzC3+6g164AiW8EmcP9t4svHDT898q?=
 =?us-ascii?Q?0c3tZ7ms6svmTpazM1BQgqrwXhoY7NTrgCt8viegpRbr0rAHeHFNMLpy5xSL?=
 =?us-ascii?Q?oI5pjWqnhX8a201gtqmkTngRs/axPm5+GV9gyBuXo1s6o0wJyhIHDU99N940?=
 =?us-ascii?Q?1DEvrusIQDLFVDSbSLcv2T3F2ssNZbuAvRsqg3LeAypssfkqzYgsmQrzOduk?=
 =?us-ascii?Q?NPYtcaqkJygaavMgiW5WpXiAIHVdXEpPa0QgIe1HIAbYJp4pr1oh+9IXACAF?=
 =?us-ascii?Q?TBaaIfm7k4mAS/x8otZ7aDbvo5ZqYwNTlL1vLPDtLbL6bs35icvsQfx2gQFc?=
 =?us-ascii?Q?SJJqMbob+tuBaE1nvH2Esld4FOTHISf+RkduRSwUKj3CzJVxvo9ul2Td8LLH?=
 =?us-ascii?Q?oUmJ7PuCt4R9iP6bSnku1yW/2lpQ+eSAYGFJhWWa33NScIaSwhT2gYujDPnt?=
 =?us-ascii?Q?Ac4kiEET7Osz7lUIxmG425Xpi3FrewwqPVHLYUZ9fgGbkgipyK1zd+xJy+Kx?=
 =?us-ascii?Q?lkFpPur7TtoNruO+riQZSwsRwTKhuA5dU/OXNccwYmD4Koot5oYXEsIooVlS?=
 =?us-ascii?Q?dlcMsuAu/jctWpR7QPj+BhIua9Dd9clFU6NlCAwykEuv0syVF1t9ehf+6RBG?=
 =?us-ascii?Q?aYv33mvSC29Tnaedg1vAhtY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE9CA5DC5A738242903E34BFB6B1ED3E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oUQ2EZ9WRuo+vdohe11V9Q5ijL9Z5As9jIZ8uovTWj92DY1rZO0iZwiB8qcaZIfXoKoKAmmJCxK5hxI93oM9LxC/TzRNchpPvIKh3TRAsvJd/KLo2Li69TxcmGG1v8Ev09X/6m+H0iGk6DuAWrdbI16qveJswD4xIYlqNdx8E/5m6gYZZ40No42C0DKzp3fGVQJY120c8oqgIpKoBKKWPu4vu1WExYtGus+gSbFpT9V0AL48OV5tzseZRdjqz1t3NygNwLVA0r1RkZsk/eVrLA3piW5h8v4cH/kT8yv1/l1I8chrtSbiKtCjRJ5ex/DU/PpYZqO8fUSAyxXLANyknoVQ9lpxSRcZL4LHEuGU69+y9fUYBl39HhdmW3TusqTOHBovJEVnhU+6+A904YmeBLVF21dPb+/lDaqbiHUqh1EuQkYMF1TArFY9miyi0ZERvSIQeUzb/OQxityZRQasfvfwORCt3BfnDQ82ijmTWCxJvUoBmE/oBUTDsejMxBzBa+syJlUQCVuyLfvaeIs1cfWD+QjLo42Ufc0VaeVQ/Nw9T4hj736aTsgLTrU0+3/Zb/HYp2s9kEl1fruK9xRF5m+mtulChpi/i96CCLmsZDnv5yAIFhNg7N2BQ09LS1s4fchYGcrb5U7XRerdM5VtRgR1vItuvpZAUSYjOh4un54pbDnECeZUPZMjNtZZ9uSkNbu9wJYFHApfuRqJ5Lt1qBtz54e4jKc8lglxFkA7ZOean1GjPJ2DNeiUiP/H9vneYrpHQkiz/C3IVAN+koysfHtzY08f94uNJLpANZbGzx8vUhdjmoAN3gb1HrHE5hpf
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000de282-2399-449a-eb2b-08dad393704e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:59:02.4063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FI3NZGRnLA2oL5GG8t6W4F5Au5byqswdxHaUc8O9AuM76SH0hMkctQLCd288PKvcOGVdC4dYTbfKlA+0HrfwjjzzZUcYmEyMniDi++d5yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7022



> On 30 Nov 2022, at 16:54, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> Inter-domain event channels are always a pair of local and remote ports.
> Right now the handling is asymmetric, caused by the fact that the evtchn =
is
> bound after the associated Domain object is constructed.
>=20
> First, move binding of the event channel into the Domain.make() construct=
or.
> This means the local port no longer needs to be an option.  It also remov=
es
> the final callers of Domain.bind_interdomain.
>=20
> Next, introduce a new port_pair type to encapsulate the fact that these t=
wo
> should be updated together, and replace the previous port and remote_port
> fields.  This refactoring also changes the Domain.get_port interface (rem=
oving
> an option) so take the opportunity to name it get_local_port instead.
>=20
> Also, this fixes a use-after-free risk with Domain.close.  Once the evtch=
n has
> been unbound, the same local port number can be reused for a different
> purpose, so explicitly invalidate the ports to prevent their accidental m=
isuse
> in the future.
>=20
> This also cleans up some of the debugging, to always print a port pair.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>

Acked-by: Christian Lindig <christian.lindig@citrix.com>

>=20
> v2:
> * New
> ---
> tools/ocaml/xenstored/connections.ml |  9 +----
> tools/ocaml/xenstored/domain.ml      | 75 ++++++++++++++++++-------------=
-----
> tools/ocaml/xenstored/domains.ml     |  2 -
> 3 files changed, 39 insertions(+), 47 deletions(-)
>=20
> diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored=
/connections.ml
> index 7d68c583b43a..a80ae0bed2ce 100644
> --- a/tools/ocaml/xenstored/connections.ml
> +++ b/tools/ocaml/xenstored/connections.ml
> @@ -48,9 +48,7 @@ let add_domain cons dom =3D
> 	let xbcon =3D Xenbus.Xb.open_mmap ~capacity (Domain.get_interface dom) (=
fun () -> Domain.notify dom) in
> 	let con =3D Connection.create xbcon (Some dom) in
> 	Hashtbl.add cons.domains (Domain.get_id dom) con;
> -	match Domain.get_port dom with
> -	| Some p -> Hashtbl.add cons.ports p con;
> -	| None -> ()
> +	Hashtbl.add cons.ports (Domain.get_local_port dom) con

I would prefer Hashtbl.replace. Hashtbl.add shadows an existing binding whi=
ch becomes visible again after Hashtabl.remove. When we are sure that we on=
ly have one binding per key, we should use replace instead of add.=20

>=20
> let select ?(only_if =3D (fun _ -> true)) cons =3D
> 	Hashtbl.fold (fun _ con (ins, outs) ->
> @@ -97,10 +95,7 @@ let del_domain cons id =3D
> 		let con =3D find_domain cons id in
> 		Hashtbl.remove cons.domains id;
> 		(match Connection.get_domain con with
> -		 | Some d ->
> -		   (match Domain.get_port d with
> -		    | Some p -> Hashtbl.remove cons.ports p
> -		    | None -> ())
> +		 | Some d -> Hashtbl.remove cons.ports (Domain.get_local_port d)
> 		 | None -> ());
> 		del_watches cons con;
> 		Connection.close con
> diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/doma=
in.ml
> index d59a9401e211..ecdd65f3209a 100644
> --- a/tools/ocaml/xenstored/domain.ml
> +++ b/tools/ocaml/xenstored/domain.ml
> @@ -19,14 +19,31 @@ open Printf
> let debug fmt =3D Logging.debug "domain" fmt
> let warn  fmt =3D Logging.warn  "domain" fmt
>=20
> +(* An event channel port pair.  The remote port, and the local port it i=
s
> +   bound to. *)
> +type port_pair =3D
> +{
> +	local: Xeneventchn.t;
> +	remote: int;
> +}
> +
> +(* Sentinal port_pair with both set to EVTCHN_INVALID *)
> +let invalid_ports =3D
> +{
> +	local =3D Xeneventchn.of_int 0;
> +	remote =3D 0
> +}
> +
> +let string_of_port_pair p =3D
> +	sprintf "(l %d, r %d)" (Xeneventchn.to_int p.local) p.remote
> +
> type t =3D
> {
> 	id: Xenctrl.domid;
> 	mfn: nativeint;
> 	interface: Xenmmap.mmap_interface;
> 	eventchn: Event.t;
> -	mutable remote_port: int;
> -	mutable port: Xeneventchn.t option;
> +	mutable ports: port_pair;
> 	mutable bad_client: bool;
> 	mutable io_credit: int; (* the rounds of ring process left to do, defaul=
t is 0,
> 	                           usually set to 1 when there is work detected,=
 could
> @@ -41,8 +58,8 @@ let is_dom0 d =3D d.id =3D 0
> let get_id domain =3D domain.id
> let get_interface d =3D d.interface
> let get_mfn d =3D d.mfn
> -let get_remote_port d =3D d.remote_port
> -let get_port d =3D d.port
> +let get_remote_port d =3D d.ports.remote
> +let get_local_port d =3D d.ports.local
>=20
> let is_bad_domain domain =3D domain.bad_client
> let mark_as_bad domain =3D domain.bad_client <- true
> @@ -56,54 +73,36 @@ let is_paused_for_conflict dom =3D dom.conflict_credi=
t <=3D 0.0
>=20
> let is_free_to_conflict =3D is_dom0
>=20
> -let string_of_port =3D function
> -	| None -> "None"
> -	| Some x -> string_of_int (Xeneventchn.to_int x)
> -
> let dump d chan =3D
> -	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
> +	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.ports.remote
>=20
> let rebind_evtchn d remote_port =3D
> -	begin match d.port with
> -	| None -> ()
> -	| Some p -> Event.unbind d.eventchn p
> -	end;
> +	Event.unbind d.eventchn d.ports.local;
> 	let local =3D Event.bind_interdomain d.eventchn d.id remote_port in
> -	debug "domain %d rebind (l %s, r %d) =3D> (l %d, r %d)"
> -	      d.id (string_of_port d.port) d.remote_port
> -	      (Xeneventchn.to_int local) remote_port;
> -	d.remote_port <- remote_port;
> -	d.port <- Some (local)
> +	let ports =3D { local; remote =3D remote_port } in
> +	debug "domain %d rebind %s =3D> %s"
> +	      d.id (string_of_port_pair d.ports) (string_of_port_pair ports);
> +	d.ports <- ports
>=20
> let notify dom =3D
> -	match dom.port with
> -	| None -> warn "domain %d: attempt to notify on unknown port" dom.id
> -	| Some port -> Event.notify dom.eventchn port
> -
> -let bind_interdomain dom =3D
> -	begin match dom.port with
> -	| None -> ()
> -	| Some port -> Event.unbind dom.eventchn port
> -	end;
> -	dom.port <- Some (Event.bind_interdomain dom.eventchn dom.id dom.remote=
_port);
> -	debug "bound domain %d remote port %d to local port %s" dom.id dom.remo=
te_port (string_of_port dom.port)
> -
> +	Event.notify dom.eventchn dom.ports.local
>=20
> let close dom =3D
> -	debug "domain %d unbound port %s" dom.id (string_of_port dom.port);
> -	begin match dom.port with
> -	| None -> ()
> -	| Some port -> Event.unbind dom.eventchn port
> -	end;
> +	debug "domain %d unbind %s" dom.id (string_of_port_pair dom.ports);
> +	Event.unbind dom.eventchn dom.ports.local;
> +	dom.ports <- invalid_ports;
> 	Xenmmap.unmap dom.interface
>=20
> -let make id mfn remote_port interface eventchn =3D {
> +let make id mfn remote_port interface eventchn =3D
> +	let local =3D Event.bind_interdomain eventchn id remote_port in
> +	let ports =3D { local; remote =3D remote_port } in
> +	debug "domain %d bind %s" id (string_of_port_pair ports);
> +{
> 	id =3D id;
> 	mfn =3D mfn;
> -	remote_port =3D remote_port;
> +	ports;
> 	interface =3D interface;
> 	eventchn =3D eventchn;
> -	port =3D None;
> 	bad_client =3D false;
> 	io_credit =3D 0;
> 	conflict_credit =3D !Define.conflict_burst_limit;
> diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/dom=
ains.ml
> index 26018ac0dd3d..2ab0c5f4d8d0 100644
> --- a/tools/ocaml/xenstored/domains.ml
> +++ b/tools/ocaml/xenstored/domains.ml
> @@ -126,7 +126,6 @@ let create doms domid mfn remote_port =3D
> 	let interface =3D Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesiz=
e()) mfn in
> 	let dom =3D Domain.make domid mfn remote_port interface doms.eventchn in
> 	Hashtbl.add doms.table domid dom;
> -	Domain.bind_interdomain dom;
> 	dom
>=20
> let xenstored_kva =3D ref ""
> @@ -144,7 +143,6 @@ let create0 doms =3D
>=20
> 	let dom =3D Domain.make 0 Nativeint.zero remote_port interface doms.even=
tchn in
> 	Hashtbl.add doms.table 0 dom;
> -	Domain.bind_interdomain dom;
> 	Domain.notify dom;
> 	dom
>=20
> --=20
> 2.11.0
>=20


