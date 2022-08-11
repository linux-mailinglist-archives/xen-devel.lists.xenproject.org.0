Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6AB58FD4A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 15:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384596.620008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM884-00063D-2k; Thu, 11 Aug 2022 13:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384596.620008; Thu, 11 Aug 2022 13:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM883-0005uL-U0; Thu, 11 Aug 2022 13:21:39 +0000
Received: by outflank-mailman (input) for mailman id 384596;
 Thu, 11 Aug 2022 13:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM882-0005rd-A4
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 13:21:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85b7335e-1978-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 15:21:36 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 09:21:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6574.namprd03.prod.outlook.com (2603:10b6:510:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 13:21:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 13:21:29 +0000
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
X-Inumbo-ID: 85b7335e-1978-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660224096;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xgkDYEMjAbrJCrSSl6k4kjK9yxklbaqz3zx8hlWzobo=;
  b=dreGwbYRHNgb3i9s0ilOY6JqyBSwXFK8lRF+Kkbg4t+B15PukHG6lB6q
   PRLxYEYqb6VRtRoEtnXIyluxF8OqOM79rFVyD92aXVtEQANXJwjTijWRL
   3PKfhZosHYb80BRLWPcuxm7BHCr2nrN085mg+p7rTh+HiG8IVI53rkqM5
   c=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 78312075
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1DFBz6l8H6m3hvyUSMqhZjHo5gxjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcUGuCbvqLYjf8ctlyYI6/8koBvcOHn9I1SAZorShjEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2r4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kIBIQq+v52JFpH6
 OE+MGA8chWtitq5lefTpulE3qzPLeHNFaZG4jRF8mucCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAF7gvN+MLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSL337WXwn6TtIQ6P7e1ptkyrVGo5EtIOUQOeQvqjKKHsxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vxDCFrmK2YTzSa7Lj8hQm7OTURa1QDYyAEZQIf5p/op4RbphDSStduFoalg9uzHiv/q
 xiRtzQ3jbgXic8N1o248ErBjjbqoYLGJiYq4i3HU2Tj6Rl2DLNJfKSt4FnfqPNfdoCQSwDZu
 GBewpDDqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meJ0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:QjK7naoNzXGgFbqQd438e34aV5sDLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xiv7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriGknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdU99WPBmcUa+d
 tVfYbhDcVtABWnhrfizzBSKemXLzAO99G9MxA/U4KuomNrdTtCvjYlLYQk7ws9HdQGOtl5Dq
 3/Q9pVfPsldL5oUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR92AiGQu1+8HIJou
 W2bHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFkr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2STN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdDnAXPagAZZQy09JjuLTlbLc8wzT9oW7Jlf2jOHlFrrE8el
 d4Lffujr67zFPGj1r10w==
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="78312075"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZlurRFNs2dOlut03nSceF7h7712H50BTPFixKYJCC+4/9+BKyYDflCvjKYajP3K1Fkz4Vn+h5tK7bNRENoChcRuFskQ1aql01W9B9cDoEqlExmQZQ+yn6yboc0IMAtH+dYOjKjdBahLMX384iN642Tunqa/O3ozS9eeSI9qUoanPSML41tYsqQSLcLYGjg9nSsmAlxMqfHdceJTKYd15MTzInjaUE6dimblNOKgOOv+Lqxfd/q1QMpG+FdlkwW5WoqD3N8a7Y8407yWsq3hhsOYkHF/NgUp0BEJX7n58tQ9oK8r8zMVQhqoCwrRiBmyumOPDJCciBVOIJtn3LYzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgkDYEMjAbrJCrSSl6k4kjK9yxklbaqz3zx8hlWzobo=;
 b=ehVbpyR3ybig840JR/52Pq9LTSvdKkuYeamTtr516uj21pTMqKlR48hUZpbARMQ6aVwbHJVDAQGWm4Giwf3o36PTswtZBANa8ZT2FzY56VkvTx9XQ7V4C60SmDRB7t0ZxSBqBPFTwHa2r3E+4A4QVA08lFXarNSS/qbyGk4gSLgWXwpfntM5OgNVG2mbZHr4TKlgUlWbZ/j0NHLTvYqFCxTJdzA9UZMci4lECkLZHVtwtaiUxFsZaXZMZ+ZnCCS0VYvdcoGcK2ha4lJr+LTLWX1NA3EG0JQDI8VcQeXDhUWL16TU4s8PpNRVsp5ZMtUjPcoybRD3oINlClwF08D+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgkDYEMjAbrJCrSSl6k4kjK9yxklbaqz3zx8hlWzobo=;
 b=I9M6vKIf+4OLM9u9NoPvUEZ0XRz5GsqzMpUgJ07u5uAxlmnay6Mh0N9sPyU8NpWkIJx/kX8QLOIgcv37Oxpo15XtR2Cze9SA0HlAO2hEkXXyVy/EmbqKUH+jL/PtvLk6O9UU7ZMFw/HC2DQnSI4u5rjQWYB3kKGrNDDdFEiTWWQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Rahul
 Singh <Rahul.Singh@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Thread-Topic: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Thread-Index: AQHYrXBuhfhLVAQnY0WV4dbewZaCI62pr6eA
Date: Thu, 11 Aug 2022 13:21:29 +0000
Message-ID: <48eee228-f7fa-5932-ac93-03cf70de01e8@citrix.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
In-Reply-To: <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46e59ac7-4316-4bc4-475e-08da7b9c66ed
x-ms-traffictypediagnostic: PH0PR03MB6574:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QU2t+Uk4bO5t7JQj/qeewwQbGgl2ZzAIRHrHoPOsLMbobBfV1n1t2i/HJYmlRvmFG0LKQTaEr+TKM/bWFp8sHsXU34Ga6GfgltEFfjMIC0s5fvWCtwtYtG2iL5IYNqEbHLR3TKaOsck/DEcpgJMaZIASufI6TG4nyvJy883Ag3N3dkjvjII1iBtRddMPidVpvoL0BGg/eqIzmdpZPAjMFLeb20MrZGbJUd2g6lvMe6UjCY4ROkLIgOSMIfpvkd2VwblCrli+j473gz0imk5O60KMBzzyRsQzTpR2tS9MFqCyuGt0kim4ePuuKrTgQ+kFfOujPxm1TkZD+Vps3alKwkqrnmnprvLTxHZzX497urMoe4MnmZGRkZfNefS9f3HzKmzDmgCabEsT04KLQXcBuDLvBcbDllzw3iqvE9MuVz04qnGBRMWKiko8xdlYvjH5IxWjc16SUFvUM4iWzOUjlxXhZMS2onDVeJ5E05xhqMbIblU5RXdr7NuOcECDzhhZcWFxbJwdHz3UrVzfL+GTQCKYommjwAOrJjM24IY6iKRBmOu5WlPUYjNFWF4/lO3HnBk/uiHi4Det0cxCMYUlyMKg8mdMOaH5gWGA37XAa6FRZ6ijK//rykOfj226WAwCKd/xYcfz/kdrp+oUMYNlnzkrWL/q1DxYxS/FCk5JrXWqPfysKNrxEWKmd8VFMeE4uomP3Kdw8J8h8/7zCDfU4nfRxdsWyhj/5HtR51occz1qzGT95hMQwNJLfL7LGSMRjpeQFNLv8BAj6MQJJ2DGG5wfNvnjOjRx/9GSqsO+I4L158DhSa0exWruVR2th+08sd93pKKeC+TUplCUsYRJq3rtZ1NoaZl+f9CYyS2NPThB3MNSKk5/fr00QpezMQXc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(31686004)(36756003)(91956017)(76116006)(2906002)(2616005)(83380400001)(38100700002)(122000001)(186003)(6512007)(26005)(82960400001)(41300700001)(86362001)(31696002)(8936002)(5660300002)(53546011)(6506007)(66476007)(478600001)(6486002)(66556008)(38070700005)(4326008)(8676002)(66946007)(71200400001)(64756008)(66446008)(316002)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHZmZFV5Zmxpdi9Ib0ZWZGNlS0pHYzA0YzFzcUEvNlVyVjlkaDhmTHpnRzJs?=
 =?utf-8?B?QVZlU2t4Y1pjTFVkMTVLaVRFYnVRc2FJWGZTeXF0UWdQd3RRZjU5eFAyL0RZ?=
 =?utf-8?B?NXZMLzJGZkdzTGYwdzgrOURueDUvZUNMMmN1V0t5YkduUVZUVXFWQlorUU9i?=
 =?utf-8?B?ck5BQkhGamI2eVo3MHpKdEFKTXFlY2craUk4dDBieFRoVWpxSnBzRDBTU0dq?=
 =?utf-8?B?U0Jla0hOQlZrMVlib2FXTExmL09nakdBK0lYTFZCS0dabkI2MHpWNVpwYU1H?=
 =?utf-8?B?RVJRQW1QdmRjdFFSVThmdzhnczJKWE1nR2FNUWpocHlGckl0b25HN2tRVnpC?=
 =?utf-8?B?R2Z4WHVnaDhDQy9mcUFWTVVWMkk1ZHFEN2dEZS9uWktlRGtCemFBd3g4d0M3?=
 =?utf-8?B?M2xoc3A2WENyUk9QUTlqL3BuOVBHeHhtamRQc0hpaFNuZStsckcyNGFLTlh4?=
 =?utf-8?B?T2NjSHZLUjloeE1yUHNNeGlWK3V6MUNGODB4cndKdDA5dW1sVHo0ZGgvS2Y0?=
 =?utf-8?B?UGc0K0orRWJUY3Y0K3RQWGhrR1hyQ3BrK2dpWDhBTmhJTXFjdE1LTG9DVE9a?=
 =?utf-8?B?OW5OQ29nOE40dmcrMFBlcWJnVHRDZlBLdXBpRWZMNmwrSy9JbnVJdnltWmFE?=
 =?utf-8?B?M3Q5TEFNd1BEUUYwL05wL2swTVM4QXd4RHE1VWZsMDZVNVREeVZQb0N3T0xE?=
 =?utf-8?B?V0xkTkw5ZFIyUG84c1M1MytjVXFRVmpKUkJUUHlHY1M5dGJYNW95eHZ6cEZC?=
 =?utf-8?B?NkxEdzFuUkJ1UzhRMkVGbmFrNEhlUndYdDRGS0JVT2N4TGRFUUlRL0ZFYzJy?=
 =?utf-8?B?MG81RGt6OG5tS29YSDlUQ3BraTN4QTJvcFB2b2c2MDVDWEY3NWw5YTBDdW8v?=
 =?utf-8?B?Q3hvZ0ZoV3NyWVNrU1paZFFWNmIrTzBqSDRjMTM1cWhXSTBXcXZVVTE5MzVF?=
 =?utf-8?B?YlNGYmNiWXFrQm1ZVDhNUWxlanAvVXNjSVdPRkRVVjZnY1EzOXA0MDYwMCtv?=
 =?utf-8?B?SUdWTldIZVN4YkZ3YUJiNUYra3NKdDV3L3pEZ1FIdW83NXVIVmxkOHZhenZT?=
 =?utf-8?B?MzRFeklhZVVESEdyaUM5Y2UxOE0zWVNxSGd4TGJid0k4Q0JaWk9oL0RLRFJY?=
 =?utf-8?B?UEJabTRQdVhVVExZQ3BqbmdrMmEyRThTYkZjT3ZoZWR4YUw4bzRheDZ3S3Rm?=
 =?utf-8?B?ejkvQVdzSUVLNFp3UkRDM3JFRy85MmNqQ3BJMklYVElhSFBuMHdWNlpsOVY4?=
 =?utf-8?B?NndRYXl0MzloVkx3blBtOWZtZGJZMXdNZlAxQmViREprMzhlWldWRGhsTlAz?=
 =?utf-8?B?dlJBYmVMeG5JZEd1bFh6RkJXTjJRb1ByVFVHZkUraUhNODJLNnVpUDVjYkVq?=
 =?utf-8?B?NkFTWlcxYUZodnRCdWtZYTNxVTNSUjh0T0dGbk5XQVR1VWtqVFFaVndNRlVM?=
 =?utf-8?B?SWdIT2E5ZGtrZ2tQK2xQazkraHcxdHdVUjhwbnNtWmI0TmNnQkFDbEFDUmRB?=
 =?utf-8?B?RzRhVkllaXdQR2JCbkR2eE5sY3dWMmsrRFRRVC8vT3YyYmpKK1ZRblVCZXlU?=
 =?utf-8?B?QXlnL0x6dTZIWjFpUDYrcGlmMjgwUUhqRm9xOW0rZWx0N0dlNE01Ryt2cFRZ?=
 =?utf-8?B?VHAxNHdibVpCb0RPS1R2UjBkaWgrK1d4cktmM2xnNWpQK1g4UEZpMUVSMktr?=
 =?utf-8?B?a0tZQTczbG1kUkQrUURKdlBwbXNlQkpOdFNwb3YxQm5zSEFueld4UTNwWncw?=
 =?utf-8?B?dHV2OVBPLy9jSUlHYWc4RW9sbkxlZWFZdEpJWFpzYXV5a2dIbEpmaGJ5aWIv?=
 =?utf-8?B?TDFJYjZwU3VieTJRZkdqZTloWmkzZ0V6WjFIMkJRUllCVmxOMnhlbFFjNW5K?=
 =?utf-8?B?TDFDUk1TMmJnRU5BdEZuRVRqOWN6UEkzekJ6N3VWSkpkK01jNkxtRDd5UUlx?=
 =?utf-8?B?a3FGQzR6TEw1MVRkRGZGc3gvcXZVOFl2QlppVm04eVlsWjl2d0ZKMVlrOU1s?=
 =?utf-8?B?UDQ0Sk9oSzU1ektSWWc3bnIvQTU2UjVFODEvWHRmUzhsZXZOMm84SWRyY2pZ?=
 =?utf-8?B?MXBsSDNLa25QUHVwWW5uMDEreWhySEdrcVM1NWNqSnRqR1BTNE10eDJYc3JZ?=
 =?utf-8?B?RmVxdGlqQ2tJYzFoaWJnZVFEOXM3VkdsbXI4eEdiUHBURUlvUW5WQzdPT1FK?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F33493A68B571B419203F4B00C854083@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?VmVGUlkrVElFQStybDVWc3hOQTF4d2FMT29BUU5tNWRIdm5iaGY3SWNVcm1R?=
 =?utf-8?B?NWRtMXVFTTZmS0JCQndwYUI2QUVIOVQ3UDZQeHIrQjREQlpVTEliUkdGeC96?=
 =?utf-8?B?NWY5elBZMzEzUFh5RExRVlY4cTdxY2tiSVFwVFcwU3FrYkpGOG5YTjh1SmFs?=
 =?utf-8?B?OVZKT2Rpdmt5dCtOam5saUJVVERuZU1RVFVlMFh5N3V4VDF1aVUrN1F0endD?=
 =?utf-8?B?aEVZbDFWcC81ak5jNVpWT3lnMlZMSEdFN053Y0tUU0Zzd2FqR1NNZmV1UFJy?=
 =?utf-8?B?OFRqdlFITFlVNGgybEtzOWo3d1pmaGZTenNDT0c3MkZvYis3ak5ITUwySmxY?=
 =?utf-8?B?VlN1UHB5M1hZWkNOS3BMczZWNUFGQzcyUVkwbklQUlRkQlZUcm5LUU9XUUZU?=
 =?utf-8?B?TG1STFRDOG54Sm8xRUxpOUpWYmxQcUpZRExNRUM4MGlGUFZ0SVhmRk8xWGJr?=
 =?utf-8?B?a204K0FRTm9pOUtmMnVHdm1NMmtRTkhCUmFUTFZmRHBBZ2hocUhvM0pEcEVH?=
 =?utf-8?B?WklHb2J2MmRZcWpzRVhuTWR0RStScUxkaEUvOGV0SUJOR1pkeFhScE5YRnRX?=
 =?utf-8?B?djhwc3dySmN0ZEQ1SE4vajM2RVIzSHZnS0ovZ1ZHV2FkMFJDTTZ3U1RKaCtN?=
 =?utf-8?B?T0hlanJMSHJ4dzcvNVJLTmhwR2dQUGNXdzdKeFArdU5taWlDa2lpV0JBTXVF?=
 =?utf-8?B?ZFpUY1VzRUNsRktCV3lpd09jcGtTT2MwYjJRQ2VRZ1RxYVRrMHV6NUFaZFJt?=
 =?utf-8?B?TmhkR1ZFcER3enh0RzNyQ3lPemowaXZicFhjVDhjcnI0dTBxdi9tQjFSOHRo?=
 =?utf-8?B?dXIxdm84V1BmT2lVa2xJZ3JGUHpQaVU4ODlzSjEzc29ZREhhTjN5SS95OVFx?=
 =?utf-8?B?QWRDd01UNEI1Y0RPU01zU0R5OWlJM1M0dGtrQUk3TlRiVmlLbTMxMGtFUm5r?=
 =?utf-8?B?cXFnN3JzTitSVndScWUxc1VWMkgwZVI5YTY5aUlSTERsYmRMRE5tcVJaaytK?=
 =?utf-8?B?aU1xaGVwaHQwZlVvMzhDeEJlZXU2WHZkVWgrYkFSQ1h2cW9vN0pQQ1N6UEhx?=
 =?utf-8?B?YUpUNEg3Zk95MWh1OVJldG1xL2hLK1NkQzR1byt6SkdxZ3U5WnQ0aU11Qitx?=
 =?utf-8?B?WEtYMERCNURZZEJ6QkM1L1BMcjl3eHpTU2xJL293YkNGUnhNQWJFTEUzam1X?=
 =?utf-8?B?RUlJSkdOSnM1U2w5L2pld1JKc3ZBeGxLelpOZDRkRTgvSWNhcHluYWo2TnI1?=
 =?utf-8?B?NWgrNWNDbVNGV2lHOU5iay9DVHg4R05rdEgwNzUwMnB3dTJWa0JmejdmNzVG?=
 =?utf-8?Q?gQpY0bqejVwnnnPzXOx6RmG6jgDa2hC6qm?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e59ac7-4316-4bc4-475e-08da7b9c66ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 13:21:29.7818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/VISWKAkQqYDVmVtEYcNKF+Re6Fx2v2JkoS3u828nZoxQYT327AetOCl71pyjCGP0Vp6dkL0OaAu7iHGJgUXdISlUtbiRuC/yWfhKpN4VY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6574

T24gMTEvMDgvMjAyMiAxMTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFJlbmFtZSB0aGUgbGF0
dGVyLCBzdWJzdW1pbmcgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGZvcm1lciB3aGVuIHBhc3Nl
ZA0KPiBOVUxMIGFzIGZpcnN0IGFyZ3VtZW50Lg0KPg0KPiBTaW5jZSB0aGlzIHJlcXVpcmVzIHRv
dWNoaW5nIGFsbCBjYWxsIHNpdGVzIGFueXdheSwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkNCj4gYW5k
IGZvbGQgdGhlIHJlbWFpbmluZyB0aHJlZSBwYXJhbWV0ZXJzIGludG8gYSBzaW5nbGUgcGNpX3Ni
ZGZfdCBvbmUuDQo+DQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLiBJbiBwYXJ0aWN1
bGFyIHRoZSBsb2NraW5nIHJlbGF0ZWQNCj4gYXNzZXJ0aW9uIG5lZWRzIHRvIGNvbnRpbnVlIHRv
IGJlIGtlcHQgc2lsZW50IHdoZW4gYSBub24tTlVMTCBkb21haW4NCj4gcG9pbnRlciBpcyBwYXNz
ZWQgLSBib3RoIHZwY2lfcmVhZCgpIGFuZCB2cGNpX3dyaXRlKCkgY2FsbCB0aGUgZnVuY3Rpb24N
Cj4gd2l0aG91dCBob2xkaW5nIHRoZSBsb2NrIChhZGRpbmcgcmVzcGVjdGl2ZSBsb2NraW5nIHRv
IHZQQ0kgW29yIGZpbmRpbmcNCj4gYW4gYWx0ZXJuYXRpdmUgdG8gZG9pbmcgc29dIGlzIHRoZSB0
b3BpYyBvZiBhIHNlcGFyYXRlIHNlcmllcykuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IHYyOiBOZXcuDQo+DQo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9pcnEuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaXJxLmMNCj4gQEAgLTIxNjIs
NyArMjE2Miw3IEBAIGludCBtYXBfZG9tYWluX3BpcnEoDQo+ICAgICAgICAgIGlmICggIWNwdV9o
YXNfYXBpYyApDQo+ICAgICAgICAgICAgICBnb3RvIGRvbmU7DQo+ICANCj4gLSAgICAgICAgcGRl
diA9IHBjaV9nZXRfcGRldl9ieV9kb21haW4oZCwgbXNpLT5zZWcsIG1zaS0+YnVzLCBtc2ktPmRl
dmZuKTsNCj4gKyAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihkLCBQQ0lfU0JERihtc2ktPnNl
ZywgbXNpLT5idXMsIG1zaS0+ZGV2Zm4pKTsNCg0KT2gsIEkgc2hvdWxkIHJlYWxseSBoYXZlIHJl
YWQgdGhpcyBwYXRjaCBiZWZvcmUgdHJ5aW5nIHRvIGRvIHRoZSBzYmRmDQpjb252ZXJzaW9uIGlu
IHBhdGNoIDEuDQoNCkhvd2V2ZXIsIGl0IG9jY3VycyB0byBtZSB0aGF0IHRoaXM6DQoNCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNpLmggYi94ZW4vYXJjaC94ODYvaW5j
bHVkZS9hc20vbXNpLmgNCmluZGV4IDExNzM3OTMxOGYyYy4uNmYwYWI4NDUwMTdjIDEwMDY0NA0K
LS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zaS5oDQorKysgYi94ZW4vYXJjaC94ODYv
aW5jbHVkZS9hc20vbXNpLmgNCkBAIC01OSw5ICs1OSwxNCBAQA0KwqAjZGVmaW5lIEZJWF9NU0lY
X01BWF9QQUdFU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDUxMg0KwqANCsKgc3RydWN0IG1z
aV9pbmZvIHsNCi3CoMKgwqAgdTE2IHNlZzsNCi3CoMKgwqAgdTggYnVzOw0KLcKgwqDCoCB1OCBk
ZXZmbjsNCivCoMKgwqAgdW5pb24gew0KK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB7DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1OCBkZXZmbjsNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4IGJ1
czsNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUxNiBzZWc7DQorwqDCoMKgwqDCoMKgwqAgfTsN
CivCoMKgwqDCoMKgwqDCoCBwY2lfc2JkZl90IHNiZGY7DQorwqDCoMKgIH07DQrCoMKgwqDCoCBp
bnQgaXJxOw0KwqDCoMKgwqAgaW50IGVudHJ5X25yOw0KwqDCoMKgwqAgdWludDY0X3QgdGFibGVf
YmFzZTsNCg0Kd2lsbCBzaW1wbGlmeSBzZXZlcmFsIGh1bmtzIGluIHRoaXMgcGF0Y2gsIGJlY2F1
c2UgeW91IGNhbiBqdXN0IHBhc3MNCm1zaS0+c2JkZiByYXRoZXIgdGhhbiByZWNvbnN0cnVjdGlu
ZyBpdCBieSByZXZlcnNpbmcgMzIgYml0cyB3b3J0aCBvZg0KZGF0YSBmcm9tIHRoZWlyIGluLW1l
bW9yeSByZXByZXNlbnRhdGlvbi4NCg0KUHJlZmVyYWJseSB3aXRoIHNvbWV0aGluZyB0byB0aGlz
IGVmZmVjdCBpbmNsdWRlZCwgUmV2aWV3ZWQtYnk6IEFuZHJldw0KQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0K

