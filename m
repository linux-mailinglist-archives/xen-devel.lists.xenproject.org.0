Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED759F888
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392456.630816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoQU-0007KL-Hh; Wed, 24 Aug 2022 11:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392456.630816; Wed, 24 Aug 2022 11:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoQU-0007Ge-CB; Wed, 24 Aug 2022 11:20:02 +0000
Received: by outflank-mailman (input) for mailman id 392456;
 Wed, 24 Aug 2022 11:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQoQR-0007CC-O8
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 11:20:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af08ce78-239e-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 13:19:58 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 07:19:55 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Wed, 24 Aug
 2022 11:19:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 11:19:50 +0000
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
X-Inumbo-ID: af08ce78-239e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661339998;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PTS5kuBOwMjUM8JcMdoCxpXOFFv4M73EeI7k7a3z2nY=;
  b=X8niLj5evjjmlbPBtLBksz2wFVgPhIG2zJ/V++myRwJvbzsOybmfEWkg
   sEkZ4l6ztKR0A9h6nW/kYf+uVo+y2gSZLiI3i1CJJCYUn7T00EReMiEdo
   WCt3OfU3UwUG/cTLZnG1fb9LTX7ULYHms8gzL0jKpsOfmnfeKmNbMqBwo
   g=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 81345045
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JrayXKuMGXI4ka53TxGNYgpb6ufnVLpfMUV32f8akzHdYApBsoF/q
 tZmKTzVafrfajfzeNB+Ody19x5XupLWytVnTwc+qS0wEXhE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4m9A5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYApotdaIV9fz
 vFGcx4INxCq28Dq763uH4GAhux7RCXqFKU2nyg6iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QPT/PVqi4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r837STwHunBer+EpW5p9Vy3Q2D11BDAR8JD0rmjvLiqRKXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U45xuK0bH8+BuCCy4PSTspQPwrstUnAwMj0
 FChlsnsQzdotdW9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMS706
 yCHqm45nbp7pd4G0eC38E7Khxqop4PVVUgl6wPPRGWn4whlIom/aOSVBUPz6P9BKMOVSweHt
 X1dwcyGtrlRUNeKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5vfe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:jH0YkaAVhT5pVy7lHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="81345045"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4ZRaYYceal3WMKh00OV1qLUhAokbhd0vKzfkSEp58Q01lZQgETDjG4ShPXbRJ/OpvVbrN62sIKErV2SQh1zLraD9zABe0evtY6df2gphVn7mCC61yaXtuHO81wnCvFa5N9TVjZHjQn33ffcFzanvcEyVMMe/sRoioWl/I0T5hNvskbHvXVMmV03+X0A48l0ENyUOjy2ZrMJMxyoUFKq/2YJ2IbqYX2Lp8y7JeFgqFdziTYufvAk/IB+jwNqIAiCQLQfSQ+QGmHlNjgV/c/KAYTGL29p7b9Pbtswwr1Fk17f4E/QyxRZYrs+y9+q1sCnECj1c50G0ka8Geytg1YXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTS5kuBOwMjUM8JcMdoCxpXOFFv4M73EeI7k7a3z2nY=;
 b=Lu7DIeNes2fRplLlNa+OJc10b/3/rmEISVWHKsdAkt7bSVNzgWBtgPOoq7kkjhOmkUude3d5FVV2bqQ1bPrLG9zp0zdLQ7qIUbt5u8uTMpfxtMmlna4m7Q7r2IX2EFXDhVwmhE8+0CSAsi7uI0vcXBpFrYp5LAhYrQsuhtfon2ls9IpzZCzJkqVanaiYaG4xemv+SK0S2WMX8c4aKkWJsXtGbn0dTbg5xrr+bKJEgdFkhrI8FxRRtwHGtKm+Coya/E4VVcepYyLUrOLKwJzd49/fQA133tnl68xwVHugKmkr9PGz24kpYs9zYS8IeV3eXlVj0+YKlt3b8HmQt7LXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTS5kuBOwMjUM8JcMdoCxpXOFFv4M73EeI7k7a3z2nY=;
 b=w9dYtulzvEuxQH/ZOmuWPAfwMEZ3YYdSAu64CpVBnGI5S9GZxaCzC1X11j+91n/l7VGxmB+zpvVwB5r6lvaLIR1OIPDfsXfUTgeKq1SeD989OPbboLfL6oSe01wkvNKgLYwmc2ec/ebLyCn/r9ZjETjA1W/tNfS9qkMlTK15XsI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Thread-Topic: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Thread-Index: AQHYt6Nrm2AFVHMPaUulll9Nh94Tqq292w4AgAAMhAA=
Date: Wed, 24 Aug 2022 11:19:50 +0000
Message-ID: <4af028cf-0213-f0e8-76cb-69bd6f42fa9f@citrix.com>
References: <20220824102225.11431-1-jgross@suse.com>
 <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
In-Reply-To: <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94c0f47d-941b-4b32-33c5-08da85c28fcb
x-ms-traffictypediagnostic: CH2PR03MB5285:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uhemC58a6BlPXbRLwrT/gDU2xZfHdoU1Ocf4ZKDRUjN0e2DEqRbgxYjO4S8qgxcuaY9IDcVrdBl2zp/lckb7Sj5U+B96WHY+zlB0EP284phQZKv8tK/QpVW21WRpkthEBhzArsYkCHZnXxvJEKJ46W/jKfgQLRkSrDQps7nyXqQcY+nce5vmWRXCQkHl1m1ivZHBHoLpWQf9DOa3tBw1RmIhvYT5Hj9nNsFNQDhA8fNA+l+CQoFjw9JXIdlzc00knrTKcfwOuDHhVZCyIFgBC1PoQWtdN8KUpJBhLP+OJywOrU6ETWeFFOWOgi4O3vO2HxcrgJy/HcLQkBd1XGwY0LNGmn3+qdtaU5fORRuwv4xrY2iIpI/FfvUaUn2hSGbKGWvHn/+JjhIsbREzXo1nbXaN/BcSFDE0IRJj8ZaFIjeQg3TArVPAiD5L1tvhl7lAntBxHkl8m9TwELAJVDYogSJVhcnEE2yqfqsPAjoqY/zEk1TuoiTKuiL+uHyQPVeGfjcwPYroJR+pz546bxRNyAAe+ROHxU2ksDc8vqQqJn9HxBdnrReduJYt28jnCeeiCEDzPFy9GlWmvuMH7FLgQcJdLJbJwJG4ZAMIEg1i/75L6Ga4CEJEtKKX82+6YuB4cXH8eobbuTW3QReMjm4F2z1hgOZHj3sVdynWGP5QpqKpdhI29Gz3eqGETV9k6BKJSDsy+obxk5ns0ik80x1rddQhMglXqx7JziXFz3kyV6DNgmbxFrt630poiFQSrE2zidrBPon/z8BQwCgd3bFkFeWOwAVbG/zQuWIRnGZbCk4tSc2juaNtvf+g6oiOscV4VEaxodWI2+nyZVw1QuTEdw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(86362001)(31696002)(38070700005)(82960400001)(38100700002)(316002)(122000001)(91956017)(54906003)(110136005)(8936002)(66946007)(66556008)(4744005)(2906002)(64756008)(4326008)(76116006)(66476007)(8676002)(66446008)(5660300002)(83380400001)(71200400001)(2616005)(186003)(478600001)(26005)(53546011)(6506007)(6512007)(31686004)(36756003)(41300700001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXM5cjlGVGxuNFQ1elQxWEF5YVBucWFnaElKOU1IS1E5UC9PazhtalRvZits?=
 =?utf-8?B?MUhrbEg4QTk4dmdyUnMzN2xxRjd2NGVFbC9jTEV5SExFMEQ4MDNEQXlnZ2VS?=
 =?utf-8?B?bVBrUVhHVkdkbzNUZzIxbE0rdmpzSHRIQmw0Vit5ZEVpZ1UrRnM2dnBGbmQy?=
 =?utf-8?B?b3VObzFHMGU5dE03aEo4QWwvUGswQTY5bnNCSlR2a1pSMVptMFgzMnVhMDJJ?=
 =?utf-8?B?T0tGS1E1VGxJS2xOdmdPR3p6eWNncFBBVW93a0pSWlBTWTBXR3JzQWRlN2p2?=
 =?utf-8?B?cXFiZHVwQ2lqbDJTUldmNlRrZjBHVXpDa3NlSCs2UWNRd1QvM3JYb01mWTZ1?=
 =?utf-8?B?L0xZcGVrbXpvNzhSaUQ4dDJvdE5DZERWa0ZEWU5pK050dmRSaTd5SlRubzJv?=
 =?utf-8?B?dnZvVk9Hc2lxM2QxTkNFZzN2Vzlqa2JUcU42OUxFV29NQWNia3B0SCt3K1ZN?=
 =?utf-8?B?WEFMVGpxYnZmaEFoT0ZsaTZOandOTXBDL0xwN3g3alBkL3ZUZXRETFFWTCtX?=
 =?utf-8?B?N0NuTDQ0Z1Z0VHpLWE9lME5WbkdDY1JaZ1dGTWFFUTNaM3YyQURDelQxMmZv?=
 =?utf-8?B?YlVDTnF1Ui9PSkhrTU9WMWwzVEVzeXBMeEJLWEVGYzVuaE0vS1E5MS9Mbmk5?=
 =?utf-8?B?OHowNnJFdFV4ZFJvaUc5VHNQS2Y3M2ZiNnRURFdXd3VCaHhtQ2hTb3R0WVhv?=
 =?utf-8?B?UExaS1dXQzB1TEpscVNTS3ZlV2ZrRk5tZmZsb2gwWG5LcWJqdW9rL0NMS3py?=
 =?utf-8?B?c2crZUJhWVR4RmxQQVhMeWhwa3dObnZKQ3NzWWZ5ZUUzdDNoZTZ5RGozb3Vv?=
 =?utf-8?B?dURhamVzZFM5eEZEZ1I0QkRXMHA2SWowNi8rRExJbjZXTnJYSVdYVXJhZ1lV?=
 =?utf-8?B?bm40Vzl1UUlLbHB6QUZxY2NqbStleTIzOUlka3p3L0t0UE9IUDhBeFhxL2NC?=
 =?utf-8?B?bVluMkpWQzBWK3hPb2pvc3hQSzFrUzU1aUhwZHNLMTh0RStqK0RyZjRBUHB2?=
 =?utf-8?B?VHB0UngwcXptNnRUa2wrMEFmQUY3U1Bia1ZvRnN5NHJUK0M0VnNhNEhSRGhJ?=
 =?utf-8?B?Sjh0Z2tHWUZpRFRZSkw1WVVkeHpzcGhtdE95UmNESFM0czhlVXB0NG5PN21T?=
 =?utf-8?B?OXArNkJxV1RQRzd0aEtNMml6aWdTRkIyQ0Q3THNIeHZRMkc2bWFab2N3b01v?=
 =?utf-8?B?VXlVYkd6Sk0vaGZWQVd1WE1nczZxaWp6YXhWaHJJYkhOVzFJb3VKNW5OVEFl?=
 =?utf-8?B?TnMwVXFHV2x4N1pqaHo3U0tyUkxEWjNlZzlCd3dCKzB1dmRlcnEzdUx5TEVV?=
 =?utf-8?B?K2d2L05rKzVleW5nL0hxRmE1NnNqRjVDSmxFUGFpYkh6OFBCTUhDVnlWUXVx?=
 =?utf-8?B?Tkd5ZmFZbENGS2NmL0RXdFJyUkRSajF6cmVMNXpLTFJuK1VaMDYrUkZJajhz?=
 =?utf-8?B?eXNHUFVmc2dFY0RIZDlpMnp5NURzVmFUY1p0TkExcUtWOXRIMnk0WTlGZm9v?=
 =?utf-8?B?SG1DQm0xakdqNktHUm1lMGxpTHhKVmtjSjlyZHZYQjlwZVB0ZXFRS3BvbjE1?=
 =?utf-8?B?elB4dHdLTzFoNHBEaVkweUxoUGYza3F0enFFOC93M2hUdWF1eTA3cGpWUzY5?=
 =?utf-8?B?UmMzK2pyTW4xeVRRMFRyS2JqRzZWd2ZJRW5WR1phclptN2hKNlVoWW5Kd2Ns?=
 =?utf-8?B?VDNIT3RPNVFVQmZhNTFlVTZnZG1CMUE1L3c3NjBpT0FTN1NFVzlnMkFNREJv?=
 =?utf-8?B?b0NPNjZ1Wi93NFFBRFZuNE1YaC9WZFJWdGc4ZUNkUHd5VkxuYjJJVUltSlox?=
 =?utf-8?B?aXFxa2xBMWloR2p3Y1NFN0RaRjliWllhTzVjdEozeUdlWlhaQUNaUGF1aTJv?=
 =?utf-8?B?SjZHbzU1VjZXTHNuOXFDcEtETkhUbVFLRmk5RjlLMFA0SVNocVV1eUR3ck10?=
 =?utf-8?B?SlRDemkrVkZjSVA1eEV4N1BldlZMMjg1VW5SaVVWTXVTSmw1ZWVvSDBqNENX?=
 =?utf-8?B?SXhyMjd3ZHVIcVV2bFRCbkNmUlBPUU91bW1RbGpqNVVYZ21aclowek9FSEpu?=
 =?utf-8?B?NitEVGVZUW1lcnQvdGxYV0xBU2hhWERzWWMwOUtyR2xQQ2JkZ3gxd2hyVHhJ?=
 =?utf-8?Q?4lCdQbpd0mJoHrBPogtTzrv6I?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <654A9D0FFC6C16478A75BB88FA250A6D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c0f47d-941b-4b32-33c5-08da85c28fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 11:19:50.8486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BHRO2bmgosEDTEVAlu9Vhnc/hfzo9gkI+4JviFiSdbaSyGT105nxMK5DOpsmdmeMwZnk59V0YgX3ofjJ37uLBuWBAruSowvVAXOrlQwbVOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5285

T24gMjQvMDgvMjAyMiAxMTozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI0LjA4LjIwMjIg
MTI6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBIaXR0aW5nIGFuIEFTU0VSVF9VTlJFQUNI
QUJMRSgpIGlzIGFsd2F5cyB3cm9uZywgc28gZXZlbiBpbiBwcm9kdWN0aW9uDQo+PiBidWlsZHMg
YSB3YXJuaW5nIHNlZW1zIHRvIGJlIGFwcHJvcHJpYXRlIHdoZW4gaGl0dGluZyBvbmUuDQo+IEkg
ZGlzYWdyZWUsIGZvciB0d28gcmVhc29uczogVGhpcyB2aW9sYXRlcyB0aGUgaW1wbGljYXRpb24g
b2YgTkRFQlVHDQo+IG1lYW5pbmcgQVNTRVJUKCkgYW5kIGZyaWVuZHMgZXhwYW5kIHRvIG5vIGFj
dHVhbCBjb2RlLg0KDQpJIGFncmVlLsKgIEFTU0VSVCgpIGFuZCBmcmllbmRzIHNob3VsZCBubyBj
b2RlIGluICFERUJVRyBidWlsZHMuDQoNCkZ1cnRoZXJtb3JlLCBpZiBhbiBBU1NFUlRfVU5SRUFD
SEFMQkUoKSBpcyBwcm92aW5nIHRvIGJlIHByb2JsZW1hdGljDQpldmVuIGF0IHJ1bnRpbWUsIHRo
ZW4gaXQncyBub3QgdGhlIGNvcnJlY3QgY29uc3RydWN0IGluIHRoZSBmaXJzdCBwbGFjZS4NCg0K
fkFuZHJldw0K

