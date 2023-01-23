Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6F678AC7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483304.749391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5MU-0007Xb-TE; Mon, 23 Jan 2023 22:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483304.749391; Mon, 23 Jan 2023 22:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5MU-0007Up-Q8; Mon, 23 Jan 2023 22:32:22 +0000
Received: by outflank-mailman (input) for mailman id 483304;
 Mon, 23 Jan 2023 22:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiRr=5U=wdc.com=prvs=3802d7ee7=Alistair.Francis@srs-se1.protection.inumbo.net>)
 id 1pK5MT-0007Ui-Pm
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:32:22 +0000
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b16daf-9b6d-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 23:32:17 +0100 (CET)
Received: from mail-bn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.49])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2023 06:32:04 +0800
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by MN2PR04MB6768.namprd04.prod.outlook.com (2603:10b6:208:1ea::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 22:32:02 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::d767:b3d:a9d4:e1fa]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::d767:b3d:a9d4:e1fa%8]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 22:32:01 +0000
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
X-Inumbo-ID: c9b16daf-9b6d-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674513137; x=1706049137;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zb0cS8TcZWkmVNeyfxolYZIL0x2TrXX0Ywu/3AavAUQ=;
  b=QlH8av8c2H5FbY/wGlHEVjAJ1ZJAvuaK+PnZlfam9nIxr4XYmHQjuTbr
   WLmbzC1lDjKdCPQTJUzcfUhiyjBdF/Ln3PJNhQHY5Ypo61+U8shxGLzzE
   6VAp8eHS+7XkZdvmii0J5AQong896JldIDkKaTIAi9cEqF21zOxfzM7+N
   zaXjfWnpvMHS0L0DYcHmwObW/DtMj6TjOkQg+mmHGIDdTBwWV5jYdmKun
   YbEZeC1QWEltqKjAPDUlg81DTQVPCXIfC7sVwbLtXHeu6UcIucNESR8ki
   ZiJROo4x68am018YKysXicqU7ohhEKtnc7yHTdUO5EhZy9EAS0nc3CX87
   A==;
X-IronPort-AV: E=Sophos;i="5.97,240,1669046400"; 
   d="scan'208";a="325885985"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4zatBljZsRjEmJV2M0R5PO8oJdLHajBHHjvgH3Puod1WjbQq/KzoNIxnVNpQbZ3KzsYFQbRmIyvUS1ZVSvfoOsn7a3xvnOiUIIW7RFDBT+gRhqF4Ix4DebOHDVmQ6xI8iuvmjqU/bfkCUWjJbjAZVsdL+/sPnAfwaeWAIlOj5x8fx+/j8omHO5JBN/wsM1zzJkuPX6ghICzKIIirbPwMK4uRDvdjuO6+KQXFCWcIOrBm44Ft17PIhdhUG8jYIWBmO7gTqeM/FJCAfsoox60Ij4e+s2j0ZcWyjAR9QnwFSt+TK7HxixXt1swlYRcnK6gmiupE45isoCRljR4mTK/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb0cS8TcZWkmVNeyfxolYZIL0x2TrXX0Ywu/3AavAUQ=;
 b=TXAqlpk7QG4X8zLsAHflm7XAZWciSgjhT8lNeDsTG90fynsyt/Nt2bjlGXAApraJ008Rx1Xy/PEtg5I7mw0gQlCKFSSwGzvLLIRpWjnUJow/p/3u2v6gXtQTn+CdIRXNhAAhk1vdpkxpUTrSbmxT/YLzeTbQQ7qBUwSSzpbHzROu4XcaN8sEXvrmFwP/vKW7fmLj1uqjcY+G7heqFe6UPJ0iEmeYkfGSe/j/nuG5y+E6+n+VBWANe31gn8vWnncjf0QeGDFYnCa4N/m4oGoDvb94BNi0EIGP5mlJukrzFyEy4stzT/ri4A36Ua4c5NQnA42qYWC134q2X9yOKaeWEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb0cS8TcZWkmVNeyfxolYZIL0x2TrXX0Ywu/3AavAUQ=;
 b=mxRf8gN+jAUmzM3M4/eoh5yrrrtIjNtS80tDO4IkhblcPLjo6uff/OT5sm8/hg0MQoumpRrpoetXQV63Ts0AsdI3m1F2N8aZv5NQ8bnRIwzXJu0ij+tdydpWUvgmfNvPCwYx4HnebP0GKu0YK9PU6IqsjMKvteEQDPUdTldRhXg=
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "bobbyeshleman@gmail.com" <bobbyeshleman@gmail.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "gianluca@rivosinc.com"
	<gianluca@rivosinc.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: Re: [RISC-V] Switch  to H-mode
Thread-Topic: [RISC-V] Switch  to H-mode
Thread-Index: AQHZL0ujmIfMEOwMNEi0n3X25HhaKK6slm0A
Date: Mon, 23 Jan 2023 22:32:01 +0000
Message-ID: <0f810fd4de8b5b05ceddd53a9ce26e8be9014eb2.camel@wdc.com>
References: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
In-Reply-To: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.3 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7872:EE_|MN2PR04MB6768:EE_
x-ms-office365-filtering-correlation-id: f1330f0e-ddbc-42ad-621d-08dafd91a5aa
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SWkzjImgI7m3GhJ+d9F47SCfP70c4AjwD31lbZ6S7MS9RO56wrYqtNpxBCrybnursLgBESz6STW14OWGJsCEiDG2N3gcJuj/68XOwTYt2CQWyh+cMPer/DZD5dN84nQJe4fUkMANOw09Oy0rWjtzy41yMM0XrnnYUDXz41dFr9LQsF/q07K94CNNy4jK4xCc27wRMLa+4VjeVjkmH8SNhZ8NiFq51K2tDI7KJUCqTXmieq6C5tiIjYUR7D2Xsxy3x3j1T6JLbw6c4XwlnTDQFIs2Xu4B1zgY/YMBX5NyJsfAHMHbP0jsyu5dcQzN33FowT6xb+ZrB14JQsZatj2cNTt9gNFgxAfwIZDGl+kXiqEYz2MaDFQOqJpWT7c057VcbeLkbBWqAhWCbSoE7qMfRu1nh8wHWCaJpmez3u1p+geP1lBjN3YWm9NPhveRU2V0lc1rWNimdWA/9HNdV/S134sD4mh/MyDg8gZ86YRVC7Xi2j0RiQWH2JxIVnsTnsT9OyrpLQX2Bc3KCPyHq6zSnh009nGwZVBj10bJPAhcYDFf7bVSQ8Vr4WV/0uQW/VME5uhfJEArJCoqSrZ5abZSKaLXjYoRV3LhlXs9qvybpcKMzNX5qyPQp6Ks53tfSoyWn5SdjOMNaNAJhWIDmysyzXPrTPkqzW3Hv4LRkvkQH+Ni5qo18Wt4sps+xZpTpNurzSJ/WTxbIgIBVNRTrnwQebHqw5htQQhKlRLjFHWdZwLtLCne/Wb//rkAw86Wo9NRTeSjgKnGvoeZDx8MjAjW6w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR04MB7872.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(478600001)(38070700005)(82960400001)(6486002)(122000001)(966005)(36756003)(6506007)(6512007)(86362001)(186003)(38100700002)(64756008)(91956017)(66446008)(66476007)(4326008)(8676002)(66556008)(76116006)(66946007)(316002)(2616005)(71200400001)(54906003)(110136005)(41300700001)(2906002)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0U2MnczUjA3ZGVyS2J5SUJUay9HaUZPckI2STB1MStleFFUSEZQUWtNNTVI?=
 =?utf-8?B?cW5yQUUxY2FTY1hPSjljQ0grTGJleGVOU2JQa2tPRXRWZ3puOXJrVkE2MUUz?=
 =?utf-8?B?Z2tiK1pleDVtTnl3WjNrL1pYSUJMR0Q3TW9yeHN1NGlmVCsvQjkyaDVlcUtn?=
 =?utf-8?B?eWpNSnc3SUFER0lwWCtlWWFuUDZ2a1NzRitJS1RPc1YxaTgrZktUajRFVE1p?=
 =?utf-8?B?R1FwaG9JTmFZNzJaRkJCaDYxSUVGeWxnK1kxeHJUT2FOa0xKVVNLK1dmcXpw?=
 =?utf-8?B?ZkpEUUFpWkZGVXpRNktDL1NQdEJJV2hWc21DYU4rVkczK1YxTlMrUlJYVUlM?=
 =?utf-8?B?YzFFN0dnQnlGWGhHeEcrNVVXMURhSHpUNWdKazFLenlvSkRKMDc0TFRvaTNp?=
 =?utf-8?B?WWdaUHozMExBa0pUY2NNRi9SVGhob0Q0V0xKcTZ4VVhtQzNTczVkaGlZNVY0?=
 =?utf-8?B?ZmZpamVoajF3SXgwR2FaemM3NGo0eXpvRjBETk9zN1FKQm1Uc0NBRnlsRDVj?=
 =?utf-8?B?Q2ZKSVR4VnZENnRoS21MT0w3SlZkTm1yYkh4djFISERCNE83cUFZeS8rVFpn?=
 =?utf-8?B?T1RiNGNZL1dnbm9tZnhFM2pYU3lkVG1UelhIdElBZDFRYmRxMDMxbW15dGF0?=
 =?utf-8?B?SFdVaTc5azJmUnNoNFh0R1NOekpIem1XMytrWjI4eGtEcnFyYVFCTG85UldC?=
 =?utf-8?B?aEYwaC9VZFRJYUcwbTE4WkNFeTVyNGtwWnRtTVNNRDNoYXRDdHh0VWpvY1V2?=
 =?utf-8?B?emxQMUFrejF4QzN3eVJ4dzZxM0s2N0RYcG1pYXhlejQ1S3ZicGhEY2NBNk44?=
 =?utf-8?B?WGRKOU5YQitIem1QdmNCbUFxSEtLU0l4c1VDcUpmaTAvSzJQUmh0SGFMa2g0?=
 =?utf-8?B?alc4TmtGekwwbDkxcjJSdGgwR0hvQm5jaXVHMnZXQnNnam5DS2xGVVJHKzRF?=
 =?utf-8?B?QTg0SythU1RNbGZCb2pKajBlL0dRU3lsTis3N0h2UzJOZEI5NkgxbHoyUUFK?=
 =?utf-8?B?RHRuT0F0a3M4NDlVMnhIeHZsczVaMml2ajFMNCtsUEl3M2RFOHp5UTJEQW9Z?=
 =?utf-8?B?c0hUUW56dEZaSFoyMERpV2xRZENNa0x2eXI3VDhVMnVkS3VITU1FcXdCRjBq?=
 =?utf-8?B?N1hZKzR6cWVVNTdyek9KMEMxYjlENGh4Mk5BdEo2TVRFRllOeHQ5UjY2Qllr?=
 =?utf-8?B?SGdXL1ZTdE00cjVjNDcwOFVnY0JYc1U3NlJYN1pqTzRqSFE5bHAyS3lmNDlp?=
 =?utf-8?B?cjNkY0xVWXh0VC85c08vZHVCU0g2WktTQVQxejY3U0o1ZWNuM0RIRTJHSG9o?=
 =?utf-8?B?OFFFcGlYQmFtWndoU1M5blVIRjNTbU1aVUdiczA4MExZRk4zSkZKc2dWUEov?=
 =?utf-8?B?bWI0S0RpZjZUbDB1ZjRWQWc3bkdMOVRUVldhcGphS2drTUpXbnJkc0hwaGdo?=
 =?utf-8?B?Nyt2R1dxK2tJNTlpSU9na2Q4RkVZdXlibWJIaDZWdDNXL3Q5WTZ4TGFBUWZV?=
 =?utf-8?B?OXoybVFJNEZUbVA0TzE2d3AvTE1IaWdkZEdVUDd0SDgrUHNJbFV4eTM2QzNP?=
 =?utf-8?B?UGRadW5EeWhvbnhtTDNMRG1zbHZiWmh6NmozU0ZHcHdaUXJDaVdCMkJaY3hU?=
 =?utf-8?B?M1g4K2dSSHNEY1kvZ0JQUWVMZVM1bTdJeDNWaG1aOVY2dEJEQkwrQ3Y1K2NI?=
 =?utf-8?B?bXFOLytXOVh6WXo2dmNjL0h4UTcycC9ZbGxTS0lLbHdYTEllcHk1cjhaVWdp?=
 =?utf-8?B?cTRmYVZGSkJjQUw0bHJWZ2RzZFBKMDNaOW5xOUdiU0lvVm9JZlhVdndPeHo5?=
 =?utf-8?B?azBVekpsOFFpMW81QXRObnVVMHBEeE5ES2Z2ckxGUjJlM2t5a1ZiVlJLZVlG?=
 =?utf-8?B?YTZ2V0hpWGhWRkdGMU9QS3huNk9LZG9rd2JxU05DdmVQc2dMVzR0Y25SQWJE?=
 =?utf-8?B?WWh3cFE4WTVvZUJJeXZ0MXFkNkRqbEp6RVFhc3hmbElxYWI5bTJJTXVyMjNk?=
 =?utf-8?B?eGxnSXh0S201RjViNEhpWVV3VitpdGlWb0wwRFlYNk9iYmtGOVQyN0RXTUJy?=
 =?utf-8?B?TEx3TitRZWlXdk1nYVlZK3FNTmZITUg0T0E5NzhBQXhac1gwZ1dRMW1majdD?=
 =?utf-8?B?WFhKeGRuK0I1RUxGcXExZ2pRN0xLVjFxVEp2Q3BFVTFrMGR0SjdDcHIvZ2Ny?=
 =?utf-8?B?U1FpN0RLNDB2Tnd4QTZQOEtFQ1FKYStvK1NkNUprNDJhUzd4bXhtV2FLVUxl?=
 =?utf-8?B?SDhQTGF0c0x2RWwwQm5xaTBZenlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B551ACBDADE7845AE8B8ACB57F14310@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RvjmPm/airjriMSJfZHKoSbMQ7G+Jw9NP/seFTVIOHPTv71+3UJbrbOStlcmq8oczTOPC+8mKffl3+WA/Z2l2DGhkIEKaQBft3ZiPE6IsuxhhlUF3F3qUBSBQG02LOZrMG0FPFs4hiTgm3Fa3GQXI7DsLEoswpZRCJ8sjjzFfVSo0umwJB18bbmXjL0IMfcTFsKPMNmZzGCdLaHssZX5g5P4RSCGHDbZyxFjD9v0QH9Xbas7TI4VwemfQt/nfaTPNVjeEz+SbLecrMZwPQA7tJ9ygsFpHEXNgiho8h8hKKKRKJUr2aclnsiBPvF8OOwzKtH6QLMGzpwYwkWTwc8CIa1VnQ4CRtorkApyY1rcOYuvpe3gY0pa/boEnaLbplmsi4bEqQWOuYb+6DguYzUIwMxEoP4/PVYOFAp+DNVuR+I6ATygKprXizOfj3rLzEO6sg+o9UXYV+ews22B/6bHWPaencwHwQnrAcCspexuDJZa3/VivvmQNU+aVcdKJhcVrakgES0BILpstjfyx/GhXeGffV+l1xiLTnd2o3EbjEcH2e9anvmCbkiYcV5M7WEMK78UjIMHGc7u169jArQN9neN7x3gcmziMcv2oHhCDwhq4sTcQl7+oN19nLP6YCBvA5YAuch+nFnqut3p+V1PYyyY7ILaF1sbMdyc+qiUCW+CXrRcZab3sH9F6udWQy4zenDCzjOwG6NJsGQW0AfpgU8Hxo3cDz8SC9gVTjyNi7+zq/0i30wPzxn45VeOns1WfIa43qtZ4fENF4J2gAdxdFMwA4z8BI/74quBxZXvR/7TYDUQKZrLDFWfQmuhFq2y8UB+Goo20gc8SglYX1g3BowDkNA3HNxev4WCck6ocZTEyrP9/dToEEGR4Rrd32KiY3xHURCOTYGRz0Y0XFSnrKfymdCTbdD5ISYF08GLFWg=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1330f0e-ddbc-42ad-621d-08dafd91a5aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 22:32:01.7682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLdR+vDf+SuCqyCvEUavgEthDShD/GwPIaFZT4K7iIG/5cy46P/O2US4hEWtDz7GhWeJppVHqbXBOH9AEUlgJYtJimGUzf60ymVEa/ItjjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6768

T24gTW9uLCAyMDIzLTAxLTIzIGF0IDE4OjU2ICswMjAwLCBPbGVrc2lpIHdyb3RlOg0KPiBIaSBB
bGlzdGFpciBhbmQgY29tbXVuaXR5LA0KPiANCj4gSSBhbSB3b3JraW5nIG9uIFJJU0MtViBzdXBw
b3J0IHVwc3RyZWFtIGZvciBYZW4gYmFzZWQgb24geW91ciBhbmQNCj4gQm9iYnkNCj4gcGF0Y2hl
cy4NCj4gDQo+IEFkZGluZyB0aGUgUklTQy1WIHN1cHBvcnQgSSByZWFsaXplZCB0aGF0IFhlbiBp
cyByYW4gaW4gUy1tb2RlLg0KPiBPdXRwdXQNCj4gb2YgT3BlblNCSToNCj4gwqDCoMKgIC4uLg0K
PiDCoMKgwqAgRG9tYWluMCBOZXh0IE1vZGXCoMKgwqDCoMKgwqDCoMKgIDogUy1tb2RlDQo+IMKg
wqDCoCAuLi4NCj4gU28gdGhlIGZpcnN0IG15IHF1ZXN0aW9uIGlzIHNob3VsZG4ndCBpdCBiZSBp
biBILW1vZGU/DQoNClRoZXJlIGlzIG5vIEgtbW9kZSBpbiBSSVNDLVYuDQoNCldoZW4gdGhlIEh5
cGVydmlzb3IgZXh0ZW5zaW9uIGV4aXN0cyB0aGUgc3RhbmRhcmQgUy1tb2RlIGF1dG9tYXRpY2Fs
bHkNCmJlY29tZXMgSFMtbW9kZS4gVGhlIHR3byBuYW1lcyBjYW4gYmUgdXNlZCBpbnRlcmNoYW5n
ZWFibHkgKGFsdGhvdWdoDQp0aGUgc3BlYyBjYWxscyBpdCBIUy1tb2RlKS4NCg0KSW4gdGhpcyB3
YXkgTGludXggKHdpdGggb3Igd2l0aG91dCBLVk0gc3VwcG9ydCkgYW5kIFhlbiBhbGwgYm9vdCBp
biB0aGUNCnNhbWUgbW9kZSBhbmQgY2FuIGNob29zZSB0byB1c2UgdmlydHVsaXNhdGlvbiBpZiBk
ZXNpcmVkLg0KDQo+IA0KPiBJZiBJIGFtIHJpZ2h0IHRoYW4gaXQgbG9va3MgbGlrZSB3ZSBoYXZl
IHRvIGRvIGEgcGF0Y2ggdG8gT3BlblNCSSB0bw0KPiBhZGQgc3VwcG9ydCBvZiBILW1vZGUgYXMg
aXQgaXMgbm90IHN1cHBvcnRlZCBub3c6DQo+IFsxXQ0KPiBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytc29mdHdhcmUtc3JjL29wZW5zYmkvYmxvYi9tYXN0ZXIvbGliL3NiaS9zYmlfZG9tYWluLmMj
TDM4MA0KPiBbMl0NCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVu
c2JpL2Jsb2IvbWFzdGVyL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgjTDExMA0KPiBQbGVh
c2UgY29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLg0KPiANCj4gVGhlIG90aGVyIG9wdGlvbiBJIHNl
ZSBpcyB0byBzd2l0Y2ggdG8gSC1tb2RlIGluIFUtYm9vdCBhcyBJDQo+IHVuZGVyc3RhbmQNCj4g
dGhlIGNsYXNzaWNhbCBib290IGZsb3cgaXM6DQo+IMKgwqDCoCBPcGVuU0JJIC0+IFUtYm9vdCAt
PiBYZW4gLT4gRG9tYWluezAsLi4ufQ0KPiBJZiBpdCBpcyBhdCBhbGwgcG9zc2libGUgc2luY2Ug
VS1ib290IHdpbGwgYmUgaW4gUyBtb2RlIGFmdGVyDQo+IE9wZW5TQkkuDQoNClMtbW9kZSBpcyB3
aGVyZSB5b3Ugd2FudCB0byBiZS4gVGhhdCdzIHdoYXQgWGVuIHNob3VsZCBzdGFydCBpbi4NCg0K
QWxpc3RhaXINCg0KPiANCj4gVGhhbmtzIGluIGFkdmFuY2UuDQo+IA0KPiB+IE9sZWtzaWkNCg0K

