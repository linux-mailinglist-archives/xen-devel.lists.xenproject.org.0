Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142466162A6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 13:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435915.689856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqCnG-00082Y-PG; Wed, 02 Nov 2022 12:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435915.689856; Wed, 02 Nov 2022 12:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqCnG-0007z8-M7; Wed, 02 Nov 2022 12:24:30 +0000
Received: by outflank-mailman (input) for mailman id 435915;
 Wed, 02 Nov 2022 12:24:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+cO=3C=citrix.com=prvs=2981f1107=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqCnF-0007z2-4C
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 12:24:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a084c43-5aa9-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 13:24:27 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 08:24:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6768.namprd03.prod.outlook.com (2603:10b6:806:214::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 12:24:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 12:24:21 +0000
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
X-Inumbo-ID: 4a084c43-5aa9-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667391866;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aDID4nVq4FEnFfYcVy85RxjiZcZdcE9HZxjFlaLQEDQ=;
  b=ZPrhDc1Coh4H3oRsWwI6u02Xg5FibNyif4Z0VIyuyvXkFYdaQoWeT/8t
   LbYS3ebvcgSjyeMBQ7Fbg3aI4kpic+uteWRCskzAlEOUrqOpHCVdz1SK8
   38Yz5FFGFXVR0B65n8rg/3jCgn+SvF/LoTi9RCwm9wGd84UB77FVberFw
   E=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 84431285
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:coZEGKK9a3vQTWtZFE+RN5QlxSXFcZb7ZxGr2PjKsXjdYENS0DJVz
 GAeDWiFO67ZZGujc9gla9m/oUhXuZbWztZjGQRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5wRkPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QIDlH6
 KYEDwwjLR2breCX+o6Vd9dF05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX+nA9tIRODQGvhCrwaLx2tIAwwvcgW3uN6lp0/iWOxzE
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdW9S3iQ67OVpjOaIjUOICkJYipsZQkY59jupqkjgxSJScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjYhxq8q56PSRQ6jjg7RUqg5wJ9IYWiPoqh7AGC6e4addnCCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:T1bQDKo0Rx0pM+L+KbC94e4aV5sqL9V00zEX/kB9WHVpm5Sj5q
 STdYcgpHjJYVcqKQsdcLW7Sdy9qBznlaKdjbN9AV7mZniChILKFvAe0WKB+UyCJ8SWzIc0v5
 uIMZIOauEYZWIQsS+Q2maF+qMboeVvh5rHuQ6x9RtQpEpRGsddBk9Ce3+mO3wzTgxBGZd8Dp
 aX+tFGuirIQwVkUu2LQnMBWfTP48fGno78YQMXQyEm8xWVlzmh79fBYmml9yZbWTZI3bpn62
 TOjxf4+7Xmufe9zRPXygbonudrseqkwN5EGMHJkMQeNi7tlxbtbp9wQqDqhkFKnMifrFwuls
 XA5w0tNdhp627AOmy0uxHp0wnl3C1G0Q6T9XaoxXHnp9D1ACg3AdZbhZ9INgDU4Uo4vN16zc
 twrh2knqsSBxbHgCm4/dTDSwpri1rxu3YknOIJ5kYvLbc2eftYsJEW9kJQHJAcdRiKk7zPPt
 MedP3h2A==
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="84431285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1U6dmqEgLabxqu9LLzYQIVB+22hiG1Y20JD4VNOuagNw/rNG8A+NtnqTTSPbslWydwFj86OZZBPz/qcuqYgDgF6OnT9k0/j4i+GWxmwOgvaYA0hW2eoKuhseulWCpKMe4tE0Wqbkkgr9D5bvegp6TjoEgq4unh1o68O0vZdM4DP1k4wtmVa7tIkuZOCzjBae1luwGM7eShW5AS2jGkFeN1eYFrL/t5V0Sjk8HlqEGaIe0mtAjRJ70E3VIHuwaqU/IrA+7s3eMAuln05ijvGCjj/j1znY5/trHj+r2ibpKLXQV9K9VZmWFtqHBjg1Pz3CrK+u9kBp3ohsFwzmvYDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDID4nVq4FEnFfYcVy85RxjiZcZdcE9HZxjFlaLQEDQ=;
 b=l0shiTyl0VlyT7I7by2RPOIDWzEwT30Q4DwXn3yBAOh1jkOJL74XbwF/aTbvS18CMbjVd0UTKTwL93pUUiIkeOg9RpgZAcFeaz4i0SwF8MXI7r+ljn57KwrwRFNamSZEqzyHpW46nBA1XS/fvr25mLe2Cwpfu5gbb1UcwXxiq0hdbYNjvdhxoj02pSWJMIWD2eGInJFXjW+O/Aw7MMnPnmmtkw0ZkWBfs4/CHS0pKarkeyfoo19iFxzAJNx3OopSmCfsqfxyuznhdtVSrj7kU3J+BvsXGeaqDZe10c3UeXJeo5mT/KGZIZWN8PkwbmwYU9bjUol7YY+Vk4mMd4sXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDID4nVq4FEnFfYcVy85RxjiZcZdcE9HZxjFlaLQEDQ=;
 b=qaZvgzGG6vZ8gyUrsPocSQXxULcCCE3QydaL/eUhvAXM8m/8URvk9I6rVWLhC6bF8YqvouWjR9lvp5DWYv1rVPoNo+rSCVP8XtF9aKpq8FsLU0N46UNCRgB4rjR31uDT5id4afHrYxGHM1P1E6OHJ09YEDimZnz+y5GczRnlO0s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 2/4] tools/include/xen-foreign: Capture
 licences from the input headers
Thread-Topic: [XEN PATCH for-4.17 2/4] tools/include/xen-foreign: Capture
 licences from the input headers
Thread-Index: AQHY7q5XVsL2+RG/AUCiEkMy4e8OGa4rjrQA
Date: Wed, 2 Nov 2022 12:24:21 +0000
Message-ID: <822f8cb3-6f13-d729-9779-0aeceda46272@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-3-anthony.perard@citrix.com>
In-Reply-To: <20221102112854.49020-3-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SN4PR03MB6768:EE_
x-ms-office365-filtering-correlation-id: cafe5ac1-320d-4936-6618-08dabccd2bc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 obVPY/Qp+J1e3mCbvEc+KqQG4SE6Zo3Hfl2m2soM/iNu/7B4s7Z3fXLNVl7LYsM5gQpqyLmTDlPYdgFx/tNCIpQL/yYO0P6BzDmm0yqfbTB5iC5wBxvl8dfYfCnJ+8LXptDP+jS0um2Ifm0QNFVCwyc2K39xvAAieJoqP4gspbgTG7j5uaDufIUM13/DSJ827TFKKQ80lHC2ucqr0pj5yJWHggUbGlyBQTnCKBHvCYuYwc7XE0tu4CvDTW32aNOZXcL0JIPzzgl7DknfztGlGoCDugIWaYe99qGA1/hX2S77XSQZjN9/GQ5kqElZeKIUY1VmWd0HKqp0q9Xla9NXWLR57jXgaYmlKfO9NUAvbTQjeS2XcdegFPhPPH3heySAh9hKjSx0zZ67DXBraPgsRjFDVtt9Xrm2dUuiZxAEIL2fP7yk5NUbTf9YhPn2nb267RFVJExam3741hM4L0kqHlQ9XrxP/zXsw/lImZAL0vl330hwnGPSWMA21L2SOsUwTzzd5JXoBr9jBCsD4xyKPbBY/EgrPfj+8gZJe8V+adcfAJylgxyQc3aFIlqUu89e3mBetG6utbZEi0p3G3EVS6K/ZYAEUcHqhyUM+O0O7fkHXtTvE4wecCN2LwoftUKm0fi0NEqsSpX/NRDsZgz+r5oSAqhloQd7VaJ4/reibbcq7YICDFcbqpo9qdfj/h6clnVXY/SPI4nRUpX4q079Umh5QxYlZNWJJJ16HD1QzMAcaTZ2vE8VUEWqxv5QGRoR55cpzinyURkh7JXs7msIx5rMjBn6kJFzETV/0kLC9dYuea74KRGpC4oue664rRoSS+7XahrPncJxtmOrc8tlaA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(31686004)(2906002)(86362001)(6506007)(4326008)(53546011)(31696002)(6512007)(8676002)(41300700001)(26005)(38070700005)(36756003)(54906003)(71200400001)(316002)(64756008)(122000001)(82960400001)(66446008)(38100700002)(8936002)(5660300002)(76116006)(66556008)(186003)(66476007)(66946007)(2616005)(478600001)(91956017)(6486002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SE5GMGtvZy85UUJ1Rk1kWVVZdWRycG1SYXhMdS9CcURXVUNPVkRuY3lwclB3?=
 =?utf-8?B?WXFBKzIrK1JjMkJCUjU3czlYZ3ovUlFDa1pINlNiMk04d1hZUXl0cUFtVFJM?=
 =?utf-8?B?a2ZJZ1JKY0ZqMDBBeHFQTitIT2Y4VzBOY1pXRWUyODY1QmxJQWs5QlREd0t3?=
 =?utf-8?B?MjRia3dha3piWVMxR2xEYTk1OWpFTzhRRGpyTmU2dHBLQXRma3Zsb1A2c1dj?=
 =?utf-8?B?ekN0T2dERGx1enlqeFhzSVdSTWtIKzB2Z25kTG9WQXNDR1NDRVlXcUhVa3gy?=
 =?utf-8?B?clJ1a3BOdmh4NzN1a2tKTGk3QXA5eXBQVCtGZWttZjFycHdjK0ErM1pBTG1K?=
 =?utf-8?B?WTc2K1F2NnZidG1yOStzZ3M0Kys4WXorVERvZDFLVllXcFNsVmNPZklxcDRD?=
 =?utf-8?B?WldibFFkUTY0aGRGbXN0eWcyMkl6cnhqRnVENTdyMnp1MlRSa3ZzNDlxSkQv?=
 =?utf-8?B?eU9PNnJseHJFdllwSFcxUFFPYVgvV1dWVnAzSUlzK1RPSlZRSTFKb0FUVm9V?=
 =?utf-8?B?RG0za2szTUJtMzR3QmV6Zk84TlFwRmFpeGJ2TXJMRC8wYUoyUDRucm9wNXBt?=
 =?utf-8?B?bXNpTWdhS1VXVisvSU9PbmphcHFoMmZpejNlQjNvWTZpa21IODAwTEU1b2tX?=
 =?utf-8?B?UnUvWmlPV24yQk1sK1lTTWFxM3VodXBWUEVoYXkrcGhoYVppUzdyeHBRUXFq?=
 =?utf-8?B?YmZqaERHQnZPTzl2dlozUHYzaFZVTVJ1NWFieTF1bmhybm1BMkV0WFBqNC9E?=
 =?utf-8?B?cWNqSGdLUWM1dHlGY0xzbWEybmFCOEpobXcwcThkMThuTlRDYkFwbzJhTE81?=
 =?utf-8?B?Ti9GdFJ5MnAwUWozVHF5L1pKMkpkYWFNNlFxZXNxb1VGV2trN1IxUGJkZk83?=
 =?utf-8?B?SmdScWppUGpEUytvektPNExQL2xzYm9BU3UzOXRnM0IrR1dvMHdaTjlLNnFw?=
 =?utf-8?B?RmpMUUVYamF0dkNEWXNiQTdHVmZGQ1d2QmcxZFY5dEVtWUhaTDFaald2Z1FF?=
 =?utf-8?B?UnhlTHFRclRXZ2M5cjNKVHZ3eEs1eGlQajdFK1h0QmNTWTRyaTQ1QkYzN09G?=
 =?utf-8?B?UDhqTXlHeGJ5aWxhcUdRQXRZSTY4Ykg3YUNaRWxld3gxR3dpRDF0SDkzRnI5?=
 =?utf-8?B?ellQL21FdkU1U2lhQjdIYmhDT3Z4bFhoRithZnZvOXVLV2UrbG5Bd1Y3WFZj?=
 =?utf-8?B?RE5OSXFrOS9VWTFFeTh6QmRiWFkyd2tybHRZN011aEFUaHdPY0djcEN1aTlX?=
 =?utf-8?B?R3V3TGFBMGlDVWhDcXRNb1FwclFGU3B1UklGS3ovTFg0QnM0WS9GY0xwam9n?=
 =?utf-8?B?bFFERERLaUtNMFBNbHZQQUYyb29EaGZnRExuRndBejRNUHZ5MmZyZzNzZlA4?=
 =?utf-8?B?SEg5QjZkcE1HbDFvVlVhbUJLMElYQ2NTT1hJTG1RQU9jaWFEeGQ1eVg2VTRZ?=
 =?utf-8?B?S2dRS3RicnJ6QThrN1NuSWw1QVdZSnBKdU1IV3MwaXVoV004UDJ4UDU2SE0v?=
 =?utf-8?B?K2lyc2lCMHhuc0pSeks5MjB6TUlTSVhLNm1YZnZ0aFU5UFpNTVFQaWVpSTdH?=
 =?utf-8?B?aGd5d0hta0xLS2t0aTNhODNUN1N6dzRrTVhDMTFXSWxiT25RL0x2MUQxaXYw?=
 =?utf-8?B?TDRxU0hEaHJNUy9meHhGWkJGci8yYlZ3VDVvSWJVSlZUVHV0dDBoSU5KUHBx?=
 =?utf-8?B?dGlBYWlIWERWRVpHMEdXQkF0M215Q21pZFNXNlh6d1FlVHkxOHpIeVJoeUxX?=
 =?utf-8?B?bmZBazUrRjhIczJaSzJOd0o2Umh2ZkhnNXNGcG9SZGh6RGJKVDAybi80RVJD?=
 =?utf-8?B?V3RzM2xtc2NjdEN1dDF3K3hhSkpRcXoySzlpUVVDdzlkNXNmL3V0NUlDZDBV?=
 =?utf-8?B?c2YvRGlFQVlTUHNZVVp1S0E4aDdmY1d5bnoyQ0syOUxld21jbjl0VEVHUTZn?=
 =?utf-8?B?VGM0RUxNeUhUYzZEOWlRVDZsajZ0ZldzYU9Eclc3UklweGRKQ1g1MGRkWmgr?=
 =?utf-8?B?cGxmcUcyVmVTZDM3NG54RWg3MzBBd2Ftd0NLUnlSKzNmS0hXQkVLaW5Yc0l0?=
 =?utf-8?B?L3NZMHdhRFBDSEtSeVNKYlpJemVybWViL2NXWEc0M3FxUFBQbTdoQXB4SHhj?=
 =?utf-8?Q?DBbheo5Zu6TGN89RMJ6FMO8TL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DAD927489638242B6465EAD2BB6F3EB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafe5ac1-320d-4936-6618-08dabccd2bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 12:24:21.4512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5gUaA8+HxCJM+J6g5tE/aVxneleYIGXDbtVe2Uu+q/GsxzGfc0xZ9Xo6hykYjvz31eHSpgm+WkJyjzWFRdNm+WU6NphzL/1T5bVvI4DkEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6768

T24gMDIvMTEvMjAyMiAxMToyOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFRoZSBoZWFkZXJz
IGluc3RhbGwgaW4gIi91c3IvaW5jbHVkZS94ZW4vZm9yZWlnbi8iIGFyZSBtaXNzaW5nIGENCj4g
bGljZW5jZS4NCj4NCj4gV2hpbGUgd2UgY291bGQgcHJvYmFibHkganVzdCBhZGQgdGhlIE1JVCBs
aWNlbmNlIHRvIHRoZSBnZW5lcmF0ZWQNCj4gZmlsZSwgdGhpcyBwYXRjaCBpbnN0ZWFkIHRyeSB0
byBncmFiIHRoZSBsaWNlbmNlIGZyb20gdGhlIG9yaWdpbmFsDQo+IGlucHV0IGZpbGUuDQo+DQo+
IFNpbmNlIGxpY2VuY2VzIGFyZSBpbiB0aGUgZmlyc3QgbXVsdGlsaW5lIEMgY29tbWVudHMsIHdl
IGp1c3QgbG9vayBmb3INCj4gdGhhdC4gQWxzbyB3aXRoIHRoaXMgcGF0Y2gsIHRoZSBwb3NzaWJs
ZSBsaWNlbmNlcyB3aWxsIG5vdCBiZSBpbiB0aGUNCj4gImlucHV0IiB2YXJpYWJsZSBhbnltb3Jl
LCBidXQgaXQgc2hvdWxkIGJlIHVubmVjZXNzYXJ5IHRvIGdlbmVyYXRlIHRoZQ0KPiBmb3JlaWdu
IGhlYWRlci4NCj4NCj4gV2l0aCB0aGlzIGNoYW5nZSwgdGhlIGxpY2VuY2Ugd2lsbCBiZSBjb3Bp
ZWQgMiBvciAzIHRpbWUgaW4gdGhlDQo+IGluc3RhbGwgaGVhZGVycyBkZXBlbmRpbmcgb24gdGhl
IG51bWJlciBvZiBpbnB1dCBoZWFkZXJzLg0KPg0KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3Bl
ciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPg0KPiBOb3RlczoNCj4g
ICAgIE1heWJlIGluc3RlYWQgb2YgdGhpcywgd2Ugc2hvdWxkIGp1c3Qgc3RhbXAgdGhpcyBvbiB0
aGUgZ2VuZXJhdGVkIGhlYWRlcg0KPiAgICAgICAgIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBNSVQgKi8NCj4gICAgIA0KPiAgICAgYnV0IHdlIHdvdWxkIGJlIG1pc3NpbmcgdGhlICJDb3B5
cmlnaHQiIGluZm9ybWF0aW9ucy4gSSBndWVzcyB3ZSBjb3VsZA0KPiAgICAgbG9vayBmb3IgdGhv
c2UgbGluZSB3aXRoIENvcHlyaWdodCBhbmQgY29weSB0aGVtLg0KPiAgICAgDQo+ICAgICBPciwg
d2UgY291bGQgcmVwbGFjZSB0aGUgbGljZW5jZSBpbiB0aGUgaW5wdXQgaGVhZGVyIGJ5IGEgU1BE
WCBhbmQgaGF2ZQ0KPiAgICAgdGhlIHNjcmlwdCBwYXJzZSB0aGF0LiAoUHJvYmFibHkgc3RpbGwg
bmVlZCB0byBncmFiIHRoZSBDb3B5cmlnaHQgbGluZXMpDQoNCkFsbCBwdWJsaWMgaGVhZGVycyAo
ZXhjZXB0IG9uZSA6LSggKSBhcmUgTUlULg0KDQpXZSBzaG91bGQgU1BEWCB0aGUgbG90LCBub3Qg
bGVhc3QgYmVjYXVzZSB0aGF0IHJlbW92ZXMgYWxsIHRoZQ0KZ3Vlc3RpbWF0aW9uIGZyb20gdGhp
cyBzY3JpcHQ7IHdlIGNhbiByZXF1aXJlIHRoYXQgdGhlIFNQRFggbGluZSBpcyB0aGUNCmZpcnN0
IGxpbmUsIGFuZCBzYW5pdHkgY2hlY2sgaXQgYXMgd2UgcHJvY2VzcyBpdC4NCg0KVGhlIGhlYWRl
cnMgYWxzbyBvdWdodCB0byBzYXkgImF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZyb20gJE9USEVS
IiwgYW5kDQppbmNsdWRlIG5vIG90aGVyIGluZm9ybWF0aW9uLsKgIFRoYXQncyBub3cgbW9zdCBh
dXRvZ2VuIGhlYWRlcnMgd29yay4NCg0KU28gdGhlIGdlbmVyYXRlZCBmaWxlcyBvdWdodCB0byBl
bmQgdXAgbG9va2luZyBsaWtlOg0KDQovKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICov
DQovKiBBdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBmcm9tICRGSUxFICovDQoNCiNpZm5kZWYgJEJM
QUgNCi4uLg0KDQp+QW5kcmV3DQo=

