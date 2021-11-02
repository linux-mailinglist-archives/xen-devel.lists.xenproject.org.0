Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FFB443004
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220279.381476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuYg-0003ec-1y; Tue, 02 Nov 2021 14:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220279.381476; Tue, 02 Nov 2021 14:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuYf-0003bt-Uc; Tue, 02 Nov 2021 14:14:37 +0000
Received: by outflank-mailman (input) for mailman id 220279;
 Tue, 02 Nov 2021 14:14:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JXc=PV=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mhuYe-0003bn-HJ
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:14:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34912ded-3be7-11ec-8557-12813bfff9fa;
 Tue, 02 Nov 2021 14:14:35 +0000 (UTC)
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
X-Inumbo-ID: 34912ded-3be7-11ec-8557-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635862475;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eG1vvS2s27YHRA4tsM4COgiXTy+UO9BKXfr3XY6lHb0=;
  b=VqkxZIPZQf2MKDx4Dw8LZLupFXPEIIkHOEIeFuqU5bSuLhms0jTXl1w4
   B5nbJaiNgFD5UsBR1dkIv22clJCTQs459ceP0Xr8Ch65oply7G24jDUOr
   DKMkmjtVtyMuRwVJS8ain5k7umQ3mCOClz7HUpb0AcwoPyCvdGILzTOou
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VJfism31U9PhutnhIzrbtIh0lYvM63jXzkK3cf/P+ekVY8i9XYUEnyU6bE9uC4YAjyRcxr+zhc
 U9GmwVr/+IOxpWKIVZZw0CVc2jyTsw/HTAQSoKT3apMEHYyfHT212y3WAgnRCEK8hUVPQG+k+i
 7Mx9m5WmpUC1NcFBmVxTGonDlpENF9U3LzDPaUWi8bLcgPL9q3lLWsr7NeFjpIxFF9Be7r3996
 9kw0Y903Sp/Vrjx6ja1kDhxUyq69687eXAVpyXFoJPbhElH5cmtklcTWfFyEf/cTNn63mS5d/O
 Py1+TVHFPyTB0GPKkDB8+Drr
X-SBRS: 5.1
X-MesageID: 56908545
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:j9YL760A74DFoDTigPbD5U12kn2cJEfYwER7XKvMYLTBsI5bpzFUn
 WUWCD+DbP7eNjP9ft8lbNyyo0IEvZKEnNdrHgZtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6w7Rh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhg/Zb4
 4RAua2MFjgAfa3FvOAxaTYJKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t2JEWTauCO
 qL1bxJoRzDCWT0VKm1JVpYdt/70mEXbbhZX/Qf9Sa0fvDGIkV0ZPKLWGPj/d8GORM5Vtl2Fv
 W+A9GP8ajkbK9632TeD6mirhOLEgWX8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGr7U29UGtZsnwWVu/unHslgEYc8pdFas98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTTMiZyBU7tXSnN4Mp1HPR/JnPJSa3+SgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7AFgHZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyG0uTKuKGpxdEdMMX
 KM1kVkIjHO0FCDyBZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzyxVzwPtnZ
 s3BKJrE4ZMm5UJPlmPeqwA1iudD+8zD7TmLGcCTI+qPiOL2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09ehHgp
 SrmBCe1CTPX2BX6FOl9Qik4Ne60Ason9RrW/0UEZD6V5pTqWq72hI83fJorZ7g3sutlyP9/V
 f4efMucRP9IT1z6F/41N/ERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:EPT4+6i8Dh6cxGq7OGnOREtpOHBQX0p13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGJ2IrT0JbjpzencGNTWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpb+TpDw5d/bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Dh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj/sV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MQTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K4upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizyhSKeSXLzYO9yq9Mw0/UpT/6UkToJk59TpX+CUnpAZCyHpnIKM0oN
 gtMcxT5fhzp4EtHORA7dw6ML6K41r2MGTx2VKpUCba/Z48SgbwQr7Mkf4IDbKRCdY1JKVbou
 W3bLofjx9qR37T
X-IronPort-AV: E=Sophos;i="5.87,203,1631592000"; 
   d="scan'208";a="56908545"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdE6BXAkXGwgQC7OOcydDtSkNVQ9pFVPqQvCAB7QpUwcDcuEiC5s9l3rYhRzhcfR9mYE+FZH/Lu8qjrWBP7rf04PTXmUdm4UazZgH80PkHAiUfqOeLyShCl11az8bnPfVaMILegTWsuf2ruv69n5eYj7b5A1snO+QLQYw6MbsO8y/1q21yJw6MAEFE0TPjR+yofu4zyTLUHFePZTZ8Dhu+yi0/cr9KwhVmFIGR6cqQvIR8/tBlFGsm+ynO2fOpxqoyvd8LFS2giwlbDS50/x3kH6qlUhrmnBeaeeo+/9grlz941zXm/C7AisBw2kt9YkV2eIER2nDb0Mu6M9jXHVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzW4YmbavuNUn0ms41QbkjX1symPunZ/l8v3LvsAYZE=;
 b=ExAZZ+GCta3p7ikKaPW6BEgNgLwgymM2x1zOiqoBkfj3Mf5+GBzOX7e2WUvW4VRvIkjSapQ//qXtI7hO2YKvRngxoUk1Qa5c/wiNC9TJ64YGQkObodoRVwHbEIF9eWOoC2cUqiaetNmB6lfC/VgLGqHbfQv0wdFNXg86Js8h5n9Dk6qILzZm0OXIIjv9VQw/QPM40EQGY2aOaw0avrwQ26FNYS9Rws8Dg7F3jf8XqKzcDRXjhTLN/eFcBvDM8yg0OmDBRIG8KwDdfPq1EyDQLakLtXFUQEfRLLQNuA6+92TA1BNTg3NFX8IkfnGRChLMnjJEtF0GLjRrNPKQh07wsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzW4YmbavuNUn0ms41QbkjX1symPunZ/l8v3LvsAYZE=;
 b=FjDB64rvuBiKAt5wy/f3/0kLG5VPKKABC8vGLrKSzYPhDQhuJ1Wcg5u2tTuTeA4qtuZHmeFzyYL2osc2XrbgdAcnmSMg2xNzxiUxdqRubLBao1QuMn4X4a+yvV9v5AUmxjOO5aetM9KIKmfan360e4KE5YAwtzflUyBUh3jpCTg=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
	<edvin.torok@citrix.com>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <20211029173813.23002-1-andrew.cooper3@citrix.com>
 <YX0qmTXBD3jSXjBI@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities
 to the toolstack
Message-ID: <3eff50a7-bf2b-3e2c-e97d-228e353c00b0@citrix.com>
Date: Tue, 2 Nov 2021 14:14:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YX0qmTXBD3jSXjBI@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 285bdf86-025e-4a2f-5315-08d99e0b1573
X-MS-TrafficTypeDiagnostic: BYAPR03MB3864:
X-Microsoft-Antispam-PRVS: <BYAPR03MB38642D541D46BE855E553BCBBA8B9@BYAPR03MB3864.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zf2BCpCjsp6TJ4tovk8wUVYYxwErlTGa1r+cv4w7BOEmKAZZmNmaSOmN8GMeixeL+ajkNV/Q1OBszE7lIr0tU+JD6kkPbT3txZ6OP/NyxMOjSyZOf9E4YwqLqcBy+QWxaqf7NoGfnD/btyTvIRAXchL6MMBu4LIrY2XQ7m3lffgyIPzum5Q0w7PISwzgLSt0GjGwvvN/9tImMilkxtQBKSGksxPLGiKVTjRlL3xMhUPV+FyXKJsDJKx4cx02DYVVNljC/BThYN7KkfqmOdJpNQVT/2BnlDGx9dtI2gn0ZXunoT1K25kSGHWkq4lp80mxhVpBTFHdir5J9PVye8AcVoLJxYMIRofr9L060m6U7zdvHaXDnswDV7VKFQ8tInwXI+glk4dnXKy6oq22Wdwsev2tVkmm0QyA+oLMTpg9mYaBffEeNiFeTpyFk6WcmCjhjUEjPfFGsfU4AnUoy2bBC5sQPSANGVRq0+2wqgGK4KfUerGRYuimIPjdYEq4pn0XhSD/Vv56QxoinoC19q2lVNtllLYfA0zYVRCD7ymQW55hnAO0/Q64HLiZ9j6KUZPdzA3BI1AM8bAPaorMXlxH+2fc7Ul8pszxaAa7I+kaLe3g21w2N91nH7MrYK/G/xfqKV/LwQgD5uxVk9JP494evftoxjcS0yZoKs1Ejbjl73Yl2nNZGN4UwEdQU5QSwiwoT3U/zbxMP7pWQUyE5NMN3MRtAVlrunf4kKQeJlUWKHiyk3rY3eajyYDJc58e7sKq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(2616005)(5660300002)(86362001)(8936002)(66946007)(26005)(956004)(6862004)(6666004)(107886003)(8676002)(186003)(2906002)(82960400001)(66476007)(4326008)(37006003)(16576012)(316002)(6636002)(31696002)(38100700002)(83380400001)(508600001)(36756003)(66556008)(6486002)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zlh5RTF0YUdzTjR1dnVlOU5IMkJaZXlqTW5TM2NmWGxEWmVWbDlheFg1Q2g3?=
 =?utf-8?B?VzNtemxPU1gybWVjSjZYOEY5MlI1SENMOTVCSUg3QU5QbUtxSUtnVVdZa1Vn?=
 =?utf-8?B?a1JRVUpiTG1JKzdJS1ZWTVVWajFkdUVjd2ZjbUhNQ2srWlZaSU13Z2RLOHRL?=
 =?utf-8?B?U1FWb1ZGRkxZQlFLb1dad0N3RHVIS0k4a3Z6dEIzd09iNVlrNUdBVy9Sa3Zm?=
 =?utf-8?B?Z09kTUEvSURFU3lLTEx2TDNjYUVQekJVMkFjQkpGTHBPSWpsQXZZMFRCSU1q?=
 =?utf-8?B?VkQwd0Uzajl2U210SVNGdVp2Uk9CTytBV1VRanRhVlBsV1FjVWNlL25VQTNt?=
 =?utf-8?B?VjFWRTZaSFJ2Z0VzU2VyQ2dNNXI2MkdoeHZRVzNETnZCZEJmYmRsK2JLRDd2?=
 =?utf-8?B?eWJxRXhFdGw1YjRldzdoRjBPemR3cTh3bjZFSXNjTEZ2UnZTc2ZEaHQ2bDBw?=
 =?utf-8?B?TkErVlVHSHU4azVSVy8wSVZHODgrSVd5MTV5aFY3ZDVET0NLRnVYanJTaGtZ?=
 =?utf-8?B?OHRMYkhXVEttUHhlZzlHdC9jS2haM09WZ0w2c3NsTzNxV0NzWks5WHZkZ21N?=
 =?utf-8?B?aitPb3NDS2RwMVpicTNDcmpqN2xrRkFOamp0NHA5R1ZkRDFiSDRzUjBsMXlE?=
 =?utf-8?B?SjBhZy9RQ3pnV1ZYVEVEMVUyNTAyYmZDY2lobTJaMG9hMmhQaEdRVkgzRUM0?=
 =?utf-8?B?OVJTbm9GK2dORmsram5hMW0yeGpBWWFqRitXK0JMNnlhL3RVTFhpZG9LdEpn?=
 =?utf-8?B?cEw2dmhLU21adXVGNXp5aXc0QUNMMW5TdkRsRml3c1Z2akNueTMrZWRKNzlC?=
 =?utf-8?B?MjVNc1BHdk8rVlN4SXFqTUxZWHh3ZDRCT3pYUUQ1RU9wTkFQRnQyMUNhRXdT?=
 =?utf-8?B?VXY5eHVvUkhwa2oyaDlYN3pmaW5LOWdmTnRkVmxLeXhQTU96WXpKL1dmTVlT?=
 =?utf-8?B?Z2dPeUM1YWVRaGVGT2tObXFGczYvMGlaek5MK09OZEJRZVY3WjVic3RzOEhV?=
 =?utf-8?B?NUFweitoS1VjNmdzQkk1Q29UbzY4Uk9kNUs5aDVVTTVYUFlOazlVOS9RbU8v?=
 =?utf-8?B?QjBVb1dOTU5ORFVWTjhzcnVOZEFqNVloYS9uM0IvVnJLbnFETDdvUU9abUJ2?=
 =?utf-8?B?VWR4a0ZtZTNNTW5yUFpONi9UaDNxdTJqSkh2OFpuVVphaU1OYkN5a1dyZ0Fx?=
 =?utf-8?B?Q1RhcWVWSGdSZk5NNXlUZGp4eEtmcjFpWGwwYkVSUFR6ZXV4d2xZcGUwakVT?=
 =?utf-8?B?eE1acjlJU0V3TElxNmludFh3NllZb05peWp6ZlE3bjR3enpMTlByRVF6Rkd1?=
 =?utf-8?B?bThRdDVuYklTVUc1ZlJwWnVGaFNXbEdLSitVenE5Ny81MWczQWMzMnVwMisv?=
 =?utf-8?B?djRENzQzaEd0bnlicHpDK241Z3ZIK2xtTElEdEdRcVFra1pyNlpYQkVEVFRk?=
 =?utf-8?B?a1lBbmJxMXprdVFSZ0Q3Z2hPSFVKbWJVK0U2bTBTRjFKRXpBb0d0aGxvMWMv?=
 =?utf-8?B?WnpMQUloaXArM1NvZ0QrVFQ3dzlkdTVBN25TTTUvY1RJZ3pSTXlOcjFIbmEy?=
 =?utf-8?B?anBVWnJIbStVa0FlRWFrcndLSDdCRzR0K2FIcUJwTDFYcVp0WHdhcFR4VnFp?=
 =?utf-8?B?b1hNOTJ1SC9kWnlReFkyRXNRL0EzRks0ekM1bmR3UFZ5eWFTNTFLbzErRmZk?=
 =?utf-8?B?L2tVVXJtY2dQRlJ6dk9nNGd6TC9mV0o4empzQ1VnTjR4bjRsb2tqVE5abEtm?=
 =?utf-8?B?VEdKbExXUFFKeDloOWpmbVJZaWpQRW9iLzRuZnVyWmxQTUlITEkzZTJmNW5B?=
 =?utf-8?B?WE1GTVEwOXY5cFlyVkVZODZRWlNrTUxya2dYdTQ2N2RpcmVNR2djcEtVenpE?=
 =?utf-8?B?T0plZnh4NEhvQ0xvRGlYcTVzTlhrZmQwREo0UlpoamlVN1FQVE5YY0p3Unpo?=
 =?utf-8?B?RFRZSzRZTXl6SnlWbk9taEFZUGVReGZBK2s1L3NYVkJOVTdrZVl1eFdKQjdC?=
 =?utf-8?B?c08ybHNYMTNEWnJHaE44RVlFRUkyOWRQc3AzTXptSXJqUEp6dmJuVE5vTVky?=
 =?utf-8?B?bHpDLyt2S2EvMVBCUzNBcEVnNFZHWFlZYkhmV2VVd1czcVQraUxEMjZGcVVQ?=
 =?utf-8?B?aENGbjIzWDM5MDlzMlVIRUtOMnd1cFdTV1RqcDlSYVc2ejMzY1J4NFJKcHNn?=
 =?utf-8?B?NnlNUlVwaHpDQ0I2WXAwYlJQUFhKU1JTdzRBUTZFVEE0dWZreHEza3VLWXZE?=
 =?utf-8?B?dGUzMENQL2VRS2RBcy9tQjdpR1RBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 285bdf86-025e-4a2f-5315-08d99e0b1573
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:14:29.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e603PuboMYIAJg3p0pCzUHsIm4tidTktZMKA9zwDRS17hzwFBaxfFWhdw/s4S/v/JnIuk0GR2uQClszMWNS2IR7cX3pFTQiiMrZIt7kcCbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3864
X-OriginatorOrg: citrix.com

On 30/10/2021 12:20, Roger Pau Monn=C3=A9 wrote:
> On Fri, Oct 29, 2021 at 06:38:13PM +0100, Andrew Cooper wrote:
>> In order to let the toolstack be able to set the gnttab version on a
>> per-domain basis, it needs to know which ABIs Xen supports.  Introduce
>> XEN_SYSCTL_PHYSCAP_gnttab_v{1,2} for the purpose, and plumb in down into
>> userspace.
> I did consider exposing the versions supported together with
> max_{grant,maptrack}_frames using a new grant-table dedicated sysctl,
> but maybe it's fine to expose the version as a physcap and fetch the
> other two separately?

The naming is already rather wonky.=C2=A0 xl calls it virt_caps which is ho=
w
most humans interact with the content, while the comments call it
"platform capabilities".

> I certainly didn't look much into this, maybe it's pointless to expose
> max_{grant,maptrack}_frames. I think the toolstack will need to be
> able to fetch grant related limits on a per-domain basis like we plan
> to do with the grant version in order to assert the destination host
> supports the current limit applied to the domain.

All capabilities, settings and limits ought to be available to an admin
in dom0.=C2=A0 `xl dmesg | grep $FOO` is inadequate.

In an ideal world, yes, we would have max_*_frames available too so `xl`
can give a more coherent error message than "domaincreate returned
-EINVAL", but for now at least those are checks suitably.

On x86, the correct way for this all to have worked would be to have a
gnttab leaf in Xen's CPUID leaves, but that is firmly in ABI-v2
territory now.

~Andrew


