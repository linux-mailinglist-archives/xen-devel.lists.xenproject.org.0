Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941BA5B0B64
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 19:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402104.644105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVyjl-0000h7-Qj; Wed, 07 Sep 2022 17:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402104.644105; Wed, 07 Sep 2022 17:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVyjl-0000eR-NL; Wed, 07 Sep 2022 17:21:17 +0000
Received: by outflank-mailman (input) for mailman id 402104;
 Wed, 07 Sep 2022 17:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ME67=ZK=citrix.com=prvs=2424a236d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oVyjk-0000eL-8A
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 17:21:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7902de10-2ed1-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 19:21:14 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 13:21:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5532.namprd03.prod.outlook.com (2603:10b6:806:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 17:21:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 17:21:01 +0000
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
X-Inumbo-ID: 7902de10-2ed1-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662571274;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wiBhW//cs0Lo4jLUltZZGK1vAZd29B37ZjPcJR9qch4=;
  b=GPj/BsFggkrT3q5L3N63JcJXRyB7v1a42cRvDxPzi6BU28/rJVwzc8sG
   G5LYBDoZ6sSUVGyN4qGGbGSWYzyk+mG8Tcp7sIR4EI3Amw3aC16NKYxVh
   2zYRJU1ATDWHXvafMyctFsGUg76pRbd41uBtQsAnpL/wpKKud19H+67PW
   Y=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 82514786
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bEg9o6yn1ZfypM8VX4p6t+cNxyrEfRIJ4+MujC+fZmUNrF6WrkUHn
 GcfDT3UaamJYDCgedFybovlpx5VvZWBnINhHQNkqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Usw5KiaVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1XDh4OJZAW+NpZPlxl5
 +JINAICMyu60rfeLLKTEoGAh+wFBeyyZsY1nCElyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSiNWQG+Dp5poJui4TX5CV33KLgL5z+fduSSN8Otk2Zu
 njH7yLyBRRy2Nm3mWDYqy7z1rGncSXTU6QgTeKI2vVTrGaflkwSUzo2dnXqiKzs4qK5c5cFQ
 6AOwQIssKwz+UqDXtT7GRqirxastBMGR8BZFeF87QiX07fV+C6QHG1CRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdszHuMTT5w
 jTPpi5ugbwW1JQPz//iowCBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHflrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:uKRF7aoYqgJf+BlJKlnls4waV5uIL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AbeSITCNU4H4ox69Mxkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pWVFZ9l/1pwKpuKuZ3IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkcoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWuKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnieffFmHKc7hywlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDSq5rPw==
X-IronPort-AV: E=Sophos;i="5.93,297,1654574400"; 
   d="scan'208";a="82514786"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQQW3xm4LyBVNC9RvO62oDEVbut5ZaRMFWHS85wJIaQac+xhQq3OEXmpvuH+xlj7syxB6nTXBr9IejX/AXwjNwjrrpWtvG2By6Lje19MlVPPaZPqVGYk+Lm9Yn6AHchCIa9gorf2Xim01JRzHkBuqva2ojwtWa25r/lI5XgAlDA44WvOJR1wkzBjgYbX6DICWyR41scQ/G3yGPcJG++D4x2RMUdPs9gmTxNy4QJzY04YJCGrJWBmT2RPeT4Au0jFXU7rj+OzxrznAzP4Ayh/KclE9S8+Qdo4yLut0Fn4HWWbJLio8sBEXO32V4XsN7q4U0or4bTBFbx9E8UGxA7QrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiBhW//cs0Lo4jLUltZZGK1vAZd29B37ZjPcJR9qch4=;
 b=iLyxZzozujAiyNV1U+ETbpcS7urDC/4Tgdy9OlEBV8yN4u0INuML2U93Wi8VigldEXQkF5bV5hS+OfD8Aw5047LnVrh46njSlYSaXM7zod434vnGfrv7iTON8qsSVx1oVen89RTO8jDcN1J4bmeAGgfEFOWzbguby1faiV5q2LGjnz3kLdxsfh+CABB1eZ5g7QefX00gj588ejJfp6w+QGd8VQFxeztJ1ifRatmH2K/v7lJgCuwbRVx6hTzIUlvLO6MawjPnQzCRw8MG2RTfHhuFRza+k8bU9MvXHVCVaGhgrgQ77uyFw9heaDnmnjFxLOT75H5sExI7wqektpJh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiBhW//cs0Lo4jLUltZZGK1vAZd29B37ZjPcJR9qch4=;
 b=kMuYNpVPWLeMpLMa+c44pklaA/URODBu4O+m/r5OP4C61hfhTgwTVdzcdrofJEIRexZhD6jatSRzZRUmkiVBzb9J/qA3yAHNYgUg73zNZEzx8lZ7D6j8ZE0jwTNE5Mf6xqE+bZuVSoqC5/orL1YI9IsA4OPcr/92n7zzB9+zSEc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Unaligned access on arm32
Thread-Topic: Unaligned access on arm32
Thread-Index: AQHYws7YWEe9/blR2Uu4FtKoO/uDz63UNsgA
Date: Wed, 7 Sep 2022 17:21:00 +0000
Message-ID: <cffa9f33-dc9c-8b9d-a25b-586b4cf63a2b@citrix.com>
References: <c71163f6-2646-6fae-cb22-600eb0486539@xen.org>
In-Reply-To: <c71163f6-2646-6fae-cb22-600eb0486539@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfeb0187-8b6a-43bb-4a4c-08da90f555f2
x-ms-traffictypediagnostic: SA0PR03MB5532:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6ZZsCA4qwtX59zCwshI9qtzhh9xEpBfkf3jqAN5NZyIszBV+VId8pa/AGmBZ/rVyaWelMdt01Mij8Qecw8Qe//N3CEtB/tJ6e/p/XdZ7ulYUu5Oj4Ag9d7GbBS7jLWC3boGrWlq++b1sIhtjgKsncViN3yPW1roCJrvd+Kj4AHFXnCDd4RsYRqQrUWNwuKaiJr+T1ttZUFAxsl36wKUVJ1NBOEJ3S+gtJfZOm92uRXy8H9IpbkBPno1k2hC6IlDuxs8Mvee1PUEVB7nzuEMAxkh2SMaq0yE7x+OKAljfP3XV2w9HL8yRYIDZO9MomY95QjhVLTIUpq6cjuiXgz1BPtm5ISsSLhKlj2oxSZ5Fk8mhQd29G1OU0/C8MLWqp6mwth5WRrNlClTwNYbirN1txn7LXECeT36YMUCKrnqeuzt8TCw5PRlaELHqNJgDj6YyFjN47ukDmhjoq3hD41p3ZFWTjbrRiiUkZZFsIyH+5lGIHftZ08Mw1QKPDgoHER1MDsQdP+NWSetc7SHd4RCQusDaZv/59XJSo4xm+vMK8l1D7TH4p6Yj1oFh00a7ouUpB6cuVdiC6pZBGXvxftP1UMVPTvTVTcKHMgxBmLuCOSa8Q0F2kMqQyi8/GJPALA7fyT4JsLirM5F/4NviMoNvCUI0GVjS3Jiv9pBcAV5OdFTGf2vOn0Z1oJX4TAsRD/ipF+gQSg8LXqvaoaixqpsX4jY61dKQzu6ueVwuSiyUJ7CRFqDlF/mzdoPXy/oY4WAjUw8py8N5mCYkfQaq6el8OWGD6Kb+iWH3b0MoUZfe2vPTwAwqfAqlGMoQc+qURtbQkjnP2XbNmxEyL/TxAfU0jw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(316002)(5660300002)(66556008)(83380400001)(110136005)(4326008)(91956017)(66476007)(76116006)(8676002)(66946007)(36756003)(64756008)(8936002)(31686004)(66446008)(2906002)(31696002)(6486002)(6512007)(71200400001)(26005)(41300700001)(478600001)(38070700005)(86362001)(2616005)(186003)(53546011)(122000001)(82960400001)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTlCbThXN1BaYmovelBlemhQQUVUTWZ1YUsrTGxHd2VTOVFVdUFiVVRCdjFT?=
 =?utf-8?B?d1dDaXpkay9LM0Z4c1Jsc3k1aGhNOU5xdnZ2Q0haV0FvaERpeE1iRFhBaTll?=
 =?utf-8?B?Z3cxVFh3aVJiVXk1eTF6YlBDWWI4Z2EvNUhDZmZpb1NIQUcvRWxHN3VSOUtp?=
 =?utf-8?B?Vi96eEJOcHFWbFZoRlRITkhVenZic3pLM29tVGlodVd2MXJBRjVJakJ1WG9Z?=
 =?utf-8?B?bUt1SmxWdTkzaHZBQllhMnFaWVFvdTQzeVBoTERrOG9MSWpITEdnOU9wemQ4?=
 =?utf-8?B?UFZVQUdmaEFNeTBjSkpFRStkbWI5eERaOHVJanJsN2FHbytkUkZtd0ZtRHcv?=
 =?utf-8?B?OEthdEx4YnFIdFFrc0VQdzZYSVQ0YjdNR0ViV3ZiMGI5ZlVuY2VFckt5S0Np?=
 =?utf-8?B?dHN5RmU1eW82cytGaVl0d09NTjNZQWRwVzI2a0gzYUJKUWQwUGlId215bzk0?=
 =?utf-8?B?eFQ4YUxndjVHUG5VUEhlSDNZUEpBTmRwVjUzKzVEdHZIdGJzWFRTY3NsMDBK?=
 =?utf-8?B?NzlGenEyeVBPMzdvM2szNXZFQVlJMWhuekF4U3FuZ2Zjd0hVazVUWTV6ekVD?=
 =?utf-8?B?U2ZWV0RTczN4bERFZGg0c1VnanEyUkFmUGR3Rjg1N0I4Z0dxOUphVDFzcXcz?=
 =?utf-8?B?dUtyTXVGcEdrRGpIemdFR05wWGFQNHRVcmdKM09WY09zNzJvU0dvbGlCMHZU?=
 =?utf-8?B?NHBYMW81WXh1c2lQUWd1RldJbDNhcDBSbXR2YTVGVVNVcnZ5QW8xVm52dDFT?=
 =?utf-8?B?OVZyYWIwWmJSREtUR0tENlR2cGJDemZRbXF2T0NMbTk1UGk3N09zRXppdXpQ?=
 =?utf-8?B?OFdEeGtQTVpCSDl3cldOdFdEWkVrdE85SUVDYkNHVWw2YkZtcTdhM0JRekY0?=
 =?utf-8?B?UjFCdWtJa2Nsa3Z1ZFF6QnloZHFZbWk3KzBpUnY1d29TaUNsZHN2L3JlWjVH?=
 =?utf-8?B?Zk5XT3I2MVdrdVNJbTRZYmQ2a1BSU0VVazQzU1R5TWVaeGt5U0t6VE1jZFRZ?=
 =?utf-8?B?YmxzRThvSzZUYWR5UVJqQzJ4cnZPOWpUWVJDUzQwMWwvUmJoTG8yajhNK0Jk?=
 =?utf-8?B?eFQ1SlM3aDRvR3JFZWNWVlRySmI2ZFhPbHJxWUJwaSs2OFNmOUhuVy8zMGdQ?=
 =?utf-8?B?MlpPd2xwNVdUa0hUamF3cFNPRVVtNSt4clQxTWhERitBUFprcUdOL1VXZnpN?=
 =?utf-8?B?M3p4UkxHMjRoeGx3eVl5NlVId0RPU3cwQmMwV05Fa0MvR3NvS2QzVDlzaXdO?=
 =?utf-8?B?SHA5cUV5d0s3V25VdnlUT2dERXd0bWJNSUhBbUpPSW5hdU5iZjltSndyWmZ2?=
 =?utf-8?B?bzhXV0N0bVkrSURiZUwzbndBbFpuTWhYT3J0bHNBYjgzQmpzWVVXZVYxZjdI?=
 =?utf-8?B?S3hZMENwb0pzSWQ3OFY1WWg5ZnFUVTZSZ21Ld3IybVdwUUc5dXVKN05RLy9p?=
 =?utf-8?B?UkN6NG8rcURua2lCUExIbEk5NmdHQVdnd0VGczRLSTNrZFIyNHlOVGxKbEp5?=
 =?utf-8?B?MU1BVUpubldBRmdxZGxOQjRCbnJsMmloVmdmY3hydUFDR3ZpcHlMaTUxZFRl?=
 =?utf-8?B?SERFMGpuLzBRZldNcDd3ZFRJeWtrMFJ1bm9ZTkpBRUk0ZHlDa3RkVDMzb1E1?=
 =?utf-8?B?Z240czN2cUFQZGp4RC9XOC9LQ1VFY3dEQjV6S2FGSTBCQmIzWkNpV3V3OVpH?=
 =?utf-8?B?NHRYTGxwd2oveTU0MFduNFJlUTRoVkxLamY5VWtEOHZJVFM0Z2E0azBmbmJ0?=
 =?utf-8?B?SFF1c2hOTzN6dkhrY1RJRVA1T1NKYVBtdUNhRkZjQmJVdDYvMU10K1Y1bGhx?=
 =?utf-8?B?VXZSdGRpU3VFYmJNdndqcG53L2FpRmo5aXBhMjNxV3BkTi9oU0ViRFMrUCta?=
 =?utf-8?B?RVFENnAxM2tIbFlLY3ViWnJneENPRWpHbXhwM0F1dzdpVzRlRUNBQS9NK1R4?=
 =?utf-8?B?NFErK3p0RGswTFhUZFVTSkd2QmxvbnpTaGhxNXl1YmRQeVNSbVdGWEl0K3li?=
 =?utf-8?B?U3lMdjcxVkFqa2JyOFlMRCtKRmdXVUlKK3h5WlRFdzhmVmFWSENWbG05WDFk?=
 =?utf-8?B?SkZON1BoTXV1STY1YUxQOUdiS1owRXFwSVJ5cEhJKzhEalZmYVBhelBMZlVo?=
 =?utf-8?Q?Az6R1/achlvkmG7ZJlAeoF7h3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0B6949178102341925A3B6C61C8F654@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeb0187-8b6a-43bb-4a4c-08da90f555f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 17:21:00.9363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 63F3Ri8rpVz8KSD4w9DZavnDstS1XzAwFygFIhI00yWLdvwIT+284WxjoJx0DNpwzpC9dFA7oSXr9s3CPtSgxO7Bo4qg/Tg8ynuSX10BWdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5532

T24gMDcvMDkvMjAyMiAxNjozMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBhbGwsDQo+DQo+
IEkgdGhpbmsgbWVudGlvbmVkIGl0IHByaXZhdGVseSBhIHdoaWxlIGEgZ28sIGJ1dCBuZXZlciBz
ZW50IGFuIGUtbWFpbA0KPiBhYm91dCBpdC4NCj4NCj4gV2hpbGUgdGVzdGluZyBhcm0zMiB3aXRo
IElPUkVRLCBJIG5vdGljZWQgWGVuIGlzIGNyYXNoaW5nIGJlY2F1c2UgYW4NCj4gYWxpZ25tZW50
IGZhdWx0Og0KPg0KPiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5bmRyb21lPTB4MTgwMDA2MQ0K
PiAoWEVOKSBXYWxraW5nIEh5cGVydmlzb3IgVkEgMHg0MDAyN2ViYiBvbiBDUFUwIHZpYSBUVEJS
DQo+IDB4MDAwMDAwMDA0MDEyZjAwMA0KPiAoWEVOKSAxU1RbMHgwMDFdID0gMHgwMDQwMDAwMGJi
ZmZmZjdmDQo+IChYRU4pIDJORFsweDAwMF0gPSAweDAwNTAwMDAwYmMwMDBmN2QNCj4gKFhFTikg
Q1BVMDogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0DQo+IChYRU4pIC0tLS1bIFhlbi00LjE3
LXVuc3RhYmxlwqAgYXJtMzLCoCBkZWJ1Zz1uwqAgVGFpbnRlZDrCoMKgIEPCoMKgwqAgXS0tLS0N
Cj4gKFhFTikgQ1BVOsKgwqDCoCAwDQo+IChYRU4pIFBDOsKgwqDCoMKgIDAwMjYxM2I4IHRyeV9m
d2RfaW9zZXJ2KzB4NDQvMHgxYmMNCj4gKFhFTikgQ1BTUjrCoMKgIDYwMDAwMDVhIE1PREU6SHlw
ZXJ2aXNvcg0KPiAoWEVOKcKgwqDCoMKgwqAgUjA6IDAwMDAwMDAwIFIxOiAwMDAwMDAwMSBSMjog
MDAyMmE3NDggUjM6IDAwMDAwMDA2DQo+IChYRU4pwqDCoMKgwqDCoCBSNDogNDAwMjdmMjAgUjU6
IDQwMDI3ZjU4IFI2OiA0MDAyODAwMCBSNzogMDAwMDAwMDANCj4gKFhFTinCoMKgwqDCoMKgIFI4
OiA0MDAyN2YyMCBSOTogNDAwM2E0MzggUjEwOjAwMmYwMDQ0IFIxMTo0MDAyN2VkYw0KPiBSMTI6
MDAwMDAwMDINCj4gKFhFTikgSFlQOiBTUDogNDAwMjdlOTQgTFI6IDAwMjYwZWRjDQo+IChYRU4p
DQo+IChYRU4pwqDCoCBWVENSX0VMMjogODAwMDM1NTgNCj4gKFhFTinCoCBWVFRCUl9FTDI6IDAw
MDEwMDAwYmJmZjgwMDANCj4gKFhFTikNCj4gKFhFTinCoCBTQ1RMUl9FTDI6IDMwY2QxODdmDQo+
IChYRU4pwqDCoMKgIEhDUl9FTDI6IDAwN2M2NjNmDQo+IChYRU4pwqAgVFRCUjBfRUwyOiAwMDAw
MDAwMDQwMTJmMDAwDQo+IChYRU4pDQo+IChYRU4pwqDCoMKgIEVTUl9FTDI6IDk3ODAwMDYxDQo+
IChYRU4pwqAgSFBGQVJfRUwyOiAwMDY3ZmFmMA0KPiAoWEVOKcKgwqDCoMKgwqAgSERGQVI6IDQw
MDI3ZWJiDQo+IChYRU4pwqDCoMKgwqDCoCBISUZBUjogNjc2MDAwMDANCj4gKFhFTikNCj4gKFhF
TikgWGVuIHN0YWNrIHRyYWNlIGZyb20gc3A9NDAwMjdlOTQ6DQo+IChYRU4pwqDCoMKgIDk3ODAw
MDYxIDAwMjJhNzQ4IDAwMDAwMDAxIDAwMDAwMDAwIDgwMDAwMDVhIDAwODAwMDAwDQo+IDQwMDNh
MDAwIDAwMDAwMDAxDQo+IChYRU4pwqDCoMKgIDQwMDNhMTgwIDAwMDAwMDAwIGJiZmY0N2ZmIDAw
MDAwMDAwIDY3ZmFmMjAwIDAwMDAwMDAwDQo+IDQwMDNhMDAwIDQwMDI3ZjIwDQo+IChYRU4pwqDC
oMKgIDQwMDNhNDM4IDQwMDI3ZjFjIDAwMjYwZWRjIDAwMmYwMTEwIDQwMDI3ZjU4IDQwMDI4MDAw
DQo+IDQwMDNhMDAwIDAwMDAwMTNiDQo+IChYRU4pwqDCoMKgIDQwMDI4MDAwIDAwMmYwMjgwIDAw
MDAwMDkwIDQwMDI3ZjU4IDY3ZmFmMjAwIDkzODIwMDA2DQo+IDY3ZmFmMjAwIDAwMDAwMDAwDQo+
IChYRU4pwqDCoMKgIDAwMDAwMDAwIDQwMDI3ZjU0IDAwMjZiNmFjIDkzODIwMDA2IDAwMjJhNzQ4
IDAwMDAwMDAxDQo+IDAwMDAwMDA0IDY3ZmFmMjAwDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwIDAw
MDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIGZmZmZmZmZmIDY4MDAwMDAwDQo+IDQwMDAwMWQzIDQw
MDI3ZjU4DQo+IChYRU4pwqDCoMKgIDAwMjAxODcwIDYwMDAwMDAwIDY3NjAxMzI0IDY3ZmFmMjAw
IDAwMDAwMDAwIDAwMDAwMDEzDQo+IDAwMDAwMDAwIDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIGZm
ZmZmZmZmIDY4MDAwMDAwIDQwMDAwMWQzIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+IGZm
ZmZmZmZmIDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIDY3NjAxMDc0IDAwMDAwMWQzIDkzODIwMDA2
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+IDAwMDAwMDAwIDY3NjAxMDA4DQo+IChYRU4p
wqDCoMKgIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAw
MDAwDQo+IDAwMDAwMDAwIDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDQwMDAwMWQzIDAwMDAwMDAwIDAwMDAwMDAwDQo+IDAwMDAwMDAwIDAwMDAwMDAw
DQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAxDQo+IChYRU4pIFhlbiBj
YWxsIHRyYWNlOg0KPiAoWEVOKcKgwqDCoCBbPDAwMjYxM2I4Pl0gdHJ5X2Z3ZF9pb3NlcnYrMHg0
NC8weDFiYyAoUEMpDQo+IChYRU4pwqDCoMKgIFs8MDAyNjBlZGM+XSB0cnlfaGFuZGxlX21taW8r
MHgyYjAvMHgyZjQgKExSKQ0KPiAoWEVOKcKgwqDCoCBbPDAwMjYwZWRjPl0gdHJ5X2hhbmRsZV9t
bWlvKzB4MmIwLzB4MmY0DQo+IChYRU4pwqDCoMKgIFs8MDAyNmI2YWM+XQ0KPiBhcmNoL2FybS90
cmFwcy5jI2RvX3RyYXBfc3RhZ2UyX2Fib3J0X2d1ZXN0KzB4MThjLzB4MzRjDQo+IChYRU4pwqDC
oMKgIFs8MDAyMDE4NzA+XSBlbnRyeS5vI3JldHVybl9mcm9tX3RyYXArMC8weDQNCj4gKFhFTikN
Cj4gKFhFTikNCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KPiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4gKFhFTikgQ1BVMDogVW5leHBlY3RlZCBUcmFw
OiBEYXRhIEFib3J0DQo+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioNCj4NCj4gVGhlIGRpc2Fzc2VtYmxlZCBjb2RlIGlzOg0KPg0KPiAwMDI2MTM3NCA8dHJ5
X2Z3ZF9pb3NlcnY+Og0KPiDCoCAyNjEzNzQ6wqDCoMKgwqDCoMKgIGUxNmQ0MmYwwqDCoMKgwqDC
oMKgwqAgc3RyZMKgwqDCoCByNCwgW3NwLCAjLTMyXSEgOyAweGZmZmZmZmUwDQo+IMKgIDI2MTM3
ODrCoMKgwqDCoMKgwqAgZTFhMDQwMDLCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqDCoCByNCwgcjIN
Cj4gwqAgMjYxMzdjOsKgwqDCoMKgwqDCoCBlMWEwNTAwMMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDC
oMKgIHI1LCByMA0KPiDCoCAyNjEzODA6wqDCoMKgwqDCoMKgIGUxY2Q2MGY4wqDCoMKgwqDCoMKg
wqAgc3RyZMKgwqDCoCByNiwgW3NwLCAjOF0NCj4gwqAgMjYxMzg0OsKgwqDCoMKgwqDCoCBlM2Ew
MDAwMMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoMKgIHIwLCAjMA0KPiDCoCAyNjEzODg6wqDCoMKg
wqDCoMKgIGUxYTA2MDAxwqDCoMKgwqDCoMKgwqAgbW92wqDCoMKgwqAgcjYsIHIxDQo+IMKgIDI2
MTM4YzrCoMKgwqDCoMKgwqAgZTFjZDgxZjDCoMKgwqDCoMKgwqDCoCBzdHJkwqDCoMKgIHI4LCBb
c3AsICMxNl0NCj4gwqAgMjYxMzkwOsKgwqDCoMKgwqDCoCBlM2EwMTAwMcKgwqDCoMKgwqDCoMKg
IG1vdsKgwqDCoMKgIHIxLCAjMQ0KPiDCoCAyNjEzOTQ6wqDCoMKgwqDCoMKgIGU1OGRiMDE4wqDC
oMKgwqDCoMKgwqAgc3RywqDCoMKgwqAgZnAsIFtzcCwgIzI0XQ0KPiDCoCAyNjEzOTg6wqDCoMKg
wqDCoMKgIGUyOGRiMDFjwqDCoMKgwqDCoMKgwqAgYWRkwqDCoMKgwqAgZnAsIHNwLCAjMjgNCj4g
wqAgMjYxMzljOsKgwqDCoMKgwqDCoCBlNThkZTAxY8KgwqDCoMKgwqDCoMKgIHN0csKgwqDCoMKg
IGxyLCBbc3AsICMyOF0NCj4gwqAgMjYxM2EwOsKgwqDCoMKgwqDCoCBlMjRkZDAyOMKgwqDCoMKg
wqDCoMKgIHN1YsKgwqDCoMKgIHNwLCBzcCwgIzQwwqDCoMKgwqAgOyAweDI4DQo+IMKgIDI2MTNh
NDrCoMKgwqDCoMKgwqAgZTFjMjIwZDTCoMKgwqDCoMKgwqDCoCBsZHJkwqDCoMKgIHIyLCBbcjIs
ICM0XQ0KPiDCoCAyNjEzYTg6wqDCoMKgwqDCoMKgIGU1MGIwMDI0wqDCoMKgwqDCoMKgwqAgc3Ry
wqDCoMKgwqAgcjAsIFtmcCwgIy0zNl3CoCA7IDB4ZmZmZmZmZGMNCj4gwqAgMjYxM2FjOsKgwqDC
oMKgwqDCoCBlNWQ2N2EyNsKgwqDCoMKgwqDCoMKgIGxkcmLCoMKgwqAgcjcsIFtyNiwgIzI1OThd
IDsgMHhhMjYNCj4gwqAgMjYxM2IwOsKgwqDCoMKgwqDCoCBlMTRiMjRmNMKgwqDCoMKgwqDCoMKg
IHN0cmTCoMKgwqAgcjIsIFtmcCwgIy02OF3CoCA7IDB4ZmZmZmZmYmMNCj4gwqAgMjYxM2I0OsKg
wqDCoMKgwqDCoCBlNWQ0MzAwMMKgwqDCoMKgwqDCoMKgIGxkcmLCoMKgwqAgcjMsIFtyNF0NCj4g
KiAyNjEzYjg6wqDCoMKgwqDCoMKgIGU1MGIwMDIxwqDCoMKgwqDCoMKgwqAgc3RywqDCoMKgwqAg
cjAsIFtmcCwgIy0zM13CoCA7IDB4ZmZmZmZmZGYNCj4NCj4gVGhlIHByb2JsZW0gaXMgR0NDIFsx
XSBkZWNpZGVkIHRvIHVzZSAnc3RyJyBmb3IgYWNjZXNzaW5nIGFuIGFkZHJlc3MNCj4gdGhhdCBp
cyBub3QgMzItYml0IGFsaWduZWQgKGZwIC0gMzMgPSAweDQwMDI3ZTczKS4gT24gYXJtMzIsIHdl
IGFyZQ0KPiBmb3JiaWRkaW5nIGFsaWduZWQgYWNjZXNzLCBoZW5jZSB3aHkgaXQgY3Jhc2hlZC4N
Cj4NCj4gTG9va2luZyBvbmxpbmUsIGl0IGxvb2tzIGxpa2UgR0NDIGhhcyBhbiBvcHRpb24gdG8g
dHVybmVkIG9uL29mZiB0aGUNCj4gdXNlIG9mIHVuYWxpZ25lZCBhY2Nlc3MgWzJdIGFuZCBpdCBp
cyBlbmFibGVkIGJ5IGRlZmF1bHQgb24gQVJNdjcgKEkNCj4gYW0gbm90IHN1cmUgd2h5IHdlIGRp
ZG4ndCBub3RpY2UgdGhpcyBiZWZvcmUuLi4pLg0KPg0KPiBJIGhhdmUgcmVidWlsdCBYZW4gd2l0
aCB0aGUgb3B0aW9uIHR1cm4gb2ZmIGFuZCBkb20wIGlzIG5vdyBib290aW5nIGZpbmUuDQoNCkFu
eSBpZGVhIHdoaWNoIGxpbmUgb2YgY29kZSB0aGF0IGNvcnJlc3BvbmRzIHRvPw0KDQpJdCdzIHN0
b3JpbmcgemVybyBpbnRvIHRoZSBzdGFjayBxdWl0ZSBlYXJseSBvbiwgc28gSSBzdXNwZWN0IGl0
J3MgdGhlDQppbml0aWFsaXNhdGlvbiBvZiBwIG9uIHRoZSBzdGFjay4NCg0KVGhlcmUgYXJlIHBs
ZW50eSBvZiBpbXBsaWNpdCB6ZXJvcyBuZWVkaW5nIHNldHRpbmcsIHNvIGhhcyB0aGUgY29tcGls
ZXINCnRyaWVkIHRvIG1lcmdlIGFkamFjZW50IHN0b3JlcyBhbmQgZW5kZWQgdXAgd2l0aCBzb21l
dGhpbmcgdGhhdCdzIHVuYWxpZ25lZD8NCg0KPiBIb3dldmVyLCBJIGFtIGEgYml0IHB1enpsZWQg
YmVjYXVzZSB0aGUgQyBjb2RlIGRpZG4ndCBjb250YWluDQo+IHVuYWxpZ25lZCBhY2Nlc3MuIEl0
IHdhcyBhbGwgaW50cm9kdWNlZCBieSB0aGUgY29tcGlsZXIgaXRzZWxmLiBUaGlzDQo+IGlzIGJy
ZWFraW5nIG91ciBhc3N1bXB0aW9uIHRoYXQgdGhlIGNvbXBpbGVyIHdpbGwgbm90IGJyZWFrIGRv
d24NCj4gY29ycmVjdGx5IG5hdHVyYWxseSBhbGlnbmVkIGFjY2Vzcy4NCg0KVGhpcyBhc3N1bXB0
aW9uIGhhcyBuZXZlciBiZWVuIHRydWUsIGFuZCBpcyBkaXNjdXNzZWQgaW4gZGVwdGggaW4gdGhl
DQpMaW51eCBtZW1vcnkgYmFycmllcnMgZG9jLsKgIEEgbG90IG9mIGVmZm9ydCBpcyBnb2luZyBp
bnRvIHRyeWluZyB0bw0KZmlndXJlIG91dCB3aGVuIGl0IGlzIHNhZmUgdG8gbWVyZ2UgYWRqYWNl
bnQgYWNjZXNzZXMuwqAgKEJ1dCBpbiB0aGlzDQpjYXNlLCBJIHdvdWxkIHNheSBpdCdzIGEgY29t
cGlsZXIgYnVnLCBpZiB0aGUgZ3Vlc3MgYWJvdmUgaXMgY29ycmVjdC4pDQoNCn5BbmRyZXcNCg==

