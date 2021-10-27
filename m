Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E649143C6E3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216838.376598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffce-00041N-Tg; Wed, 27 Oct 2021 09:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216838.376598; Wed, 27 Oct 2021 09:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffce-0003zA-Q7; Wed, 27 Oct 2021 09:53:28 +0000
Received: by outflank-mailman (input) for mailman id 216838;
 Wed, 27 Oct 2021 09:53:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mffcd-0003z4-Ao
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:53:27 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba9848f2-370b-11ec-8458-12813bfff9fa;
 Wed, 27 Oct 2021 09:53:26 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R9VRVA031287; 
 Wed, 27 Oct 2021 09:53:23 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0a-0039f301.pphosted.com with ESMTP id 3by475r3cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 09:53:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4755.eurprd03.prod.outlook.com (2603:10a6:208:c2::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 09:53:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 09:53:20 +0000
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
X-Inumbo-ID: ba9848f2-370b-11ec-8458-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q07DCNdX3mfsSyTCl/aGmCMIDcYejLWRx9+scROQdrGJoOk4Yk0uhoG9qBa+RwxejLTAX1nSDZT6HzsCuYMAYOuhuER2z+MvrmqnKUj6rnU4gojI8RhG4l+VQD1y5UfO5jMP00LXNmLGo4U5Qa0QwHKeUL5FFXN+upYWockG87RL5qtnPVpgL4Am58kL4CAeXTMp02GKQ3EoykHxHS7cWL/JGEuOylqqmFLl2NrdjLwpTcq3hqZBDoOkyCCPu4JGVtuucIXM383+TFEiRgNhR/tpoVU2Q8d/vqlQUtqiNAAsebXa8DzF/Cm6zvuCV9cg5kgh/8MrLep1+ZOSp9NkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4X/aaawMMI5dNoBKLU0OAoBCSiBjLiGRQVr/A8v00Y=;
 b=UTUCUohJOl1/+M7xn03hZqYI5rXh+eKmkQc1rEueZlxAXAMXPlDU6uIdMq8pA8OLy07Tg0r3L3XpSl6AweznxB1gdNDzG0Ia/5HNriV30itVGyccGDhvJGq7mT2clBn7c5yhuKutKK1JYnuF5z+ZcFbxTLrUvxutWUSkStuwsKqn6XkJBAGMQBc1bd0OWqbXWsheaiuO3aUQrB8g3V8GNvOYkfFyCNKl+DZSiZ+rhPFUEokIIhJogUBIolg28RuqLiamAQpwGdMC1RCAjBmOVCEoAB99ocWt/i50KIVC4vWNpFcuICY1Lbx1PLjjsXy4y7/qCTcdu9HiJin+lLt1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4X/aaawMMI5dNoBKLU0OAoBCSiBjLiGRQVr/A8v00Y=;
 b=J6BxeM4V/GXqBsA7iRt46VQaXXRtVqDIlFa2K43Kgh8NOG5ezT2SBxFfIuU9DzADniSXbGZ5n1G0vNy7rDWpaWaaBA5YQwQQ3ApNdmG45po2TJz4uKcP6IDt3KLF07rJffJuggUPp86VX3qt5pjMXOrffqGIyBXtS/X8oUWKnerybULXuBqYVGn1wW0KsrKF39ru1ppU3GV7hBALUXjUrzFakdkN/hCUfQz+r2AbOTsQNpsvsrK4QKb2V7H8INPTZqnUahW3PPMP0loJyIO6dWQbzZ9jK6/g8Sava8LjWH7G+V9JX6XZ3WEHz7uHiMqZwWyd4aT9sZsYY8gG8+qrZw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Index: AQHXtdAg2qzxZ1hIP02wGTFUbQtoPavQ36qAgBXlpoA=
Date: Wed, 27 Oct 2021 09:53:20 +0000
Message-ID: <58191b00-8246-8106-bf45-a1dc5e6265f7@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
 <YWbDMwC+6ehmGurS@MacBook-Air-de-Roger.local>
In-Reply-To: <YWbDMwC+6ehmGurS@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 986147d0-81a3-49b6-4ff7-08d9992f9bc6
x-ms-traffictypediagnostic: AM0PR03MB4755:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4755C39E77FE65C9B2E8BD91E7859@AM0PR03MB4755.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iSxz/l/oA0X1Xl0DiX78SkRMoF61XmdRGX73c78DZuXnT5c7huEYEsEJkEOpSOdLHaXprUmIhBzKivOHkGi64yQ4OiPWOs3GojpX4tm5vVtTfYO33iXSS3ZX6eIX1U5BMxG8wFvJFYM7qWjn+Uk8JeiWfoCf9D839SHfcs7T0iDBk1VuBR8rkc1SMlrdi1F0wqYHsJA/op/wMyO2zwwaYivwLLnFZ3JqF3JVBrsSf73nreVE81oahMCxgfEtrZ7RzK6nVMUuNYkj5Lcn2zYNl9OZd1VSL86+2MdS0fcgtB6MmehgY1RMSpgNaHKSccdIF6witcqg4HjlGGw/orbwCFqu6vPaHlmAYZ05v8X9yXKjwBT0C2vO9qEeJL71qsTHjGbmhaIe6F+DXTpc1T0IbGzICs/Ki8YYXnPpSsUHZ8KxXaGd+g/f7MpruLGAU304vg7RwApk16PDXC4qxfyjlVU0c1X6UYJRAmB8e9sTVk39BY+itDLnMtCGMHs2Oqaf26pf9LVzzBjXwX1UNbY3SnAEb6YZt+qv2AN+G/qfwalPaNbEk3mKYHSyy0zlmWKd4V2vXNNGSPyoVCAOjym6pHNgB9THm9/bOfo4qceDyAiml7IAvgH2MH6gd2bPXeDLWnHxK7wl8GFgOms9Q7sIA079uNVXXgybE2F4hNMV7VWYwIfzl0f9BFBgcuq8FFsEO9dfbFWmjp/3ivStNV1Y7RrmS+5NVJjejLJqZM4QmfVvyA5bunNIOikE1NGbqIit
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6512007)(508600001)(6486002)(122000001)(53546011)(8676002)(107886003)(66446008)(38100700002)(6916009)(64756008)(36756003)(91956017)(31686004)(5660300002)(54906003)(316002)(2616005)(38070700005)(2906002)(6506007)(76116006)(31696002)(186003)(71200400001)(4326008)(8936002)(66476007)(66946007)(66556008)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVFJN0N1ckd1bjVhT0NheWdVb2hwQUVaRDBSU3JLNWxkbU1rZEM3WExNd3E1?=
 =?utf-8?B?WkdDWVpqc0wwaW04SWgyNFBOUkFnK3JCMHUyWElvd24yclR0eDZsclJuNTJH?=
 =?utf-8?B?enhadTg4ZWE3K2V2em5wWlF0OG5acGh4ZTgvSzdCQTE0ZXZQWEhuc3dkRG8v?=
 =?utf-8?B?UjlBcWc3NTNmbWFDL3U3MjhaMllMTWxNTEV1RE1NS2VocExkclY3VTJoUlhK?=
 =?utf-8?B?aHplRHBCUHA5Y3VWTUhqZHhOWXExQiswL3Z1Nlc5elFuSTk1TVRTeGgxRVFx?=
 =?utf-8?B?YWh4U3ppUnJIdDdBZXBLa1hKS0czKzdLMjlRMmpDcExkS2IzQk1BenBwQWl3?=
 =?utf-8?B?dm1XWE1qMmhydGFSWC9reTlMWU5LLzg3YzVYZUs1UHRYbWd6ZlF1SmFxUHdY?=
 =?utf-8?B?QTF2cysvNC9xSUM0cDVwUktSSHFYaGxSZVFmeVdBREwwTjhVTmZvSmt6UDZu?=
 =?utf-8?B?VW13enBJdEFFL0RxMDAwanE5MUxkUkZ5OThhaitMSE5VR2J4dm9hQlVxQUlx?=
 =?utf-8?B?SElRTUViRmo1Tk9qSEtJWVUxS2l3dE96SXBzMzVzb1ZpNkhsTGxwNWlvaGNR?=
 =?utf-8?B?NmVRd0hTYzd3WjBmVlBnRkEwY1M0SmZQd1E5c1ljcFVJc2VMUTE2QmhEdFdL?=
 =?utf-8?B?Nzcrd2FWd2ZlbklrYWxHRGlKcFlYUDA0VVA4Q1hxVjJObmFsOUpGNXgyM2Qr?=
 =?utf-8?B?MFFwY1dGZ0dhbXZDYUt5V1I1V1dzdlg4R1kyV3NrSmNEWFZlSVc0VHBQWWRu?=
 =?utf-8?B?WUF1MWlVdGtJVXJhb3VzcjNXaC9UMFd2T1ZEQVdyZ0FNSWJHM1RrVDM3ekQv?=
 =?utf-8?B?R3ZrUldUbExoS3B1RW9VZXdvdHE1eG4wTDAxWWlMVjk3aXk3OGVxYi9vdmo5?=
 =?utf-8?B?VnFVMHZVREJSVlJvRFhqV2xHUzNWdTJXS0M1Z3AxcnNpR05LWjJycWFpYjJ4?=
 =?utf-8?B?K3JvQXZQcVZoeW95V283cjdOdElyeG4xbkpGNS9NQmJvZEh6Q3poNHN1YWhP?=
 =?utf-8?B?bjNaTm1QTDFqWDhRL3lEZGxwOHZ2bG1kQnorMXFvL2pBY3dEQk5CL0pZR042?=
 =?utf-8?B?NERZWjQvNmZHN1pwUU4rUS9OUmZGRDdOK0tlSUszRmVyeDRIc0RPdVBSTjM3?=
 =?utf-8?B?akhjVnJQVU1ta1FpQ1Zsc0NIQkFRODRURWZRT21GZS91WlpaTWlIYW1NSDdw?=
 =?utf-8?B?WVdlQXZCS2pha1ZweUhmNnE0YXRRRnc0dkhyaEVIS2pSSzBjdSt3ODdHYzJ2?=
 =?utf-8?B?d05xNHJReSsvT2VsbmhMVFNXVUc2Y09Kc29uWGQ4ZE5MMUVURXh6QjBWZFhl?=
 =?utf-8?B?QzI3ZDR1SEZEUWdsZlM5ZTJReXdmVHFuOTVDaUpGOE84WEdzKzB4UVBJUHBu?=
 =?utf-8?B?TXlQeUxDbHhLVk9COGdLRWpucFhoTEFUUEV5Q0dpd2dFUUEwM1A0K0dRQklq?=
 =?utf-8?B?Q0IybG14cWxtUUdmUEYxdDh2aTJqOHVhSDdQUTlpVExhRTB5SDR5M0ErUlpR?=
 =?utf-8?B?cXUzWEZoUVhzYnl5amlST01FZjFPMXEycHg5SkhwQU45U0hEZENFa3pzUUFN?=
 =?utf-8?B?UWJrVFFhQm1lSUI0TnV0UlBnYjU5SzVTL1lKd0c0NXhqVm1SMjU2M2poYjFn?=
 =?utf-8?B?cERkSVpJR3ZheGxIMWM0WUpRbWxKMWs0QUMrbVJkMVN3bGtsanpsRkdqU1lM?=
 =?utf-8?B?VkdpVVNpZHREeTIyNXNpVWtrV1k5L0w3ZzZCNTMxaklFUFVNWEM3UHRPR2lJ?=
 =?utf-8?B?WGEyQXRtOUNLNkdBdVZMVWZCTlpTWmNtMXhSa1RuelptelUrUFFNcnc5NzBn?=
 =?utf-8?B?UVg3eE9FVW1Vc3dHaXFSNlN0KzhkQTllZzh0UXhaQWs0MGZRS2pHUDEzaXR3?=
 =?utf-8?B?aHppWTNEWS81aVRkb3pkVWRFVjlzemFFUlZyQW5jMGFMQ3ZrWHZjblZBbG1E?=
 =?utf-8?B?dVIwR0xPTnd6MU83YkxqQmZNQVNwaUViZnJaTTBGSE1YVXRRL1lFcFZVeHNv?=
 =?utf-8?B?U2l4ZklKYmI4LzVQd2N0TW56Sit5eGoxQ2tvV0hKbjluOFZjZ1FJRzAxbnk1?=
 =?utf-8?B?SnYvc1ZsS0FobDg5RUFUV1BvcG0rRlJlNE9vUTJySXNBSk9HcWhScjRkMjlW?=
 =?utf-8?B?Rm1leFhReUJaZ2NDalZ6NjRxd1VzTkhJclRCMGVmOVIwOXhJTU1wMDl5ODBK?=
 =?utf-8?B?NUN6eFNKam5YcFRtMUxVQmVRcllDOXR4K2lRMVV6ajd4VmZ5N2RuaGVjSU9h?=
 =?utf-8?B?OXFXcndnOXBYVnFWRGlGNUVFaUlXV2FybGxnUW9JQjhZd084QUZOSU12aldj?=
 =?utf-8?B?TFVjTmhIenoyT0JoSFA0M2dKVkxhRHB6YUpFc3JMLzFmMlNOSlJadz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35DC485804E4B14F872C20888E54FAFF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986147d0-81a3-49b6-4ff7-08d9992f9bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 09:53:20.3801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wW158Fm1PI1WbdYelF1Z7qZjcybxTUi9nfOCjkIxEwsEKzTsYlRucm+V5dTLt3fYaPSuh0xkBONxOlhitdhWm5EmMaRcLWs3xeWvFbN5HqF9pvZafqFYiTrfr9ylJzax
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4755
X-Proofpoint-GUID: x_zFrt2w_LFkVAtH1bFjviCDxYVcvJne
X-Proofpoint-ORIG-GUID: x_zFrt2w_LFkVAtH1bFjviCDxYVcvJne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_03,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270060

SGksIFJvZ2VyIQ0KDQpPbiAxMy4xMC4yMSAxNDoyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MTRBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gV2hlbiBhIFBDSSBkZXZpY2Ug
Z2V0cyBhc3NpZ25lZC9kZS1hc3NpZ25lZCBzb21lIHdvcmsgb24gdlBDSSBzaWRlIG5lZWRzDQo+
PiB0byBiZSBkb25lIGZvciB0aGF0IGRldmljZS4gSW50cm9kdWNlIGEgcGFpciBvZiBob29rcyBz
byB2UENJIGNhbiBoYW5kbGUNCj4+IHRoYXQuDQo+Pg0KPj4gUGxlYXNlIG5vdGUsIHRoYXQgaW4g
dGhlIGN1cnJlbnQgZGVzaWduIHRoZSBlcnJvciBwYXRoIGlzIGhhbmRsZWQgYnkNCj4+IHRoZSB0
b29sc3RhY2sgdmlhIFhFTl9ET01DVExfYXNzaWduX2RldmljZS9YRU5fRE9NQ1RMX2RlYXNzaWdu
X2RldmljZSwNCj4+IHNvIHRoaXMgaXMgd2h5IGl0IGlzIGFjY2VwdGFibGUgbm90IHRvIGRlLWFz
c2lnbiBkZXZpY2VzIGlmIHZQQ0kncw0KPj4gYXNzaWduIGZhaWxzLCBlLmcuIHRoZSByb2xsIGJh
Y2sgd2lsbCBiZSBoYW5kbGVkIG9uIGRlYXNzaWduX2RldmljZSB3aGVuDQo+PiBpdCBpcyBjYWxs
ZWQgYnkgdGhlIHRvb2xzdGFjay4NCj4gSXQncyBraW5kIG9mIGhhcmQgdG8gc2VlIHdoYXQgd291
bGQgbmVlZCB0byBiZSByb2xsZWQgYmFjaywgYXMgdGhlDQo+IGZ1bmN0aW9ucyBhcmUganVzdCBk
dW1taWVzIHJpZ2h0IG5vdyB0aGF0IGRvbid0IHBlcmZvcm0gYW55IGFjdGlvbnMuDQo+DQo+IEkg
ZG9uJ3QgdGhpbmsgdGhlIHRvb2xzdGFjayBzaG91bGQgYmUgdGhlIG9uZSB0byBkZWFsIHdpdGgg
dGhlDQo+IGZhbGxvdXQsIGFzIGl0IGNvdWxkIGxlYXZlIFhlbiBpbiBhIGJyb2tlbiBzdGF0ZS4g
VGhlIGN1cnJlbnQgY29tbWl0DQo+IG1lc3NhZ2UgZG9lc24ndCBwcm92aWRlIGFueSBpbmZvcm1h
dGlvbiBhYm91dCB3aHkgaXQgaGFzIGJlZW4gZGVzaWduZWQNCj4gdGhpcyB3YXkuDQpZZXMsIHdl
IGRpc2N1c3NlZCBpbiBvdGhlciBwYXRjaGVzIHRoYXQgd2UgbmVlZCBub3QgcmVseSBvbiB0aGUN
CnRvb2xzdGFjayBhbmQgcGVyZm9ybSBjbGVhbnVwIG91cnNlbHZlcywgc28gdGhpcyB0aGUgY29k
ZSBmcm9tIHRoZQ0KZnV0dXJlIHRvIGlsbHVzdHJhdGUgdGhlIHJvbGwtYmFjazoNCg0KaW50IHZw
Y2lfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCnsNCiDCoMKgwqAgaW50IHJjOw0KDQogwqDCoMKgIC8qIEl0IG9ubHkgbWFrZXMgc2Vu
c2UgdG8gYXNzaWduIGZvciBod2RvbSBvciBndWVzdCBkb21haW4uICovDQogwqDCoMKgIGlmICgg
aXNfc3lzdGVtX2RvbWFpbihkKSB8fCAhaGFzX3ZwY2koZCkgKQ0KIMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAwOw0KDQogwqDCoMKgIHJjID0gdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGQsIHBkZXYpOw0K
IMKgwqDCoCBpZiAoIHJjICkNCiDCoMKgwqDCoMKgwqDCoCBnb3RvIGZhaWw7DQoNCiDCoMKgwqAg
cmMgPSB2cGNpX2FkZF92aXJ0dWFsX2RldmljZShkLCBwZGV2KTsNCiDCoMKgwqAgaWYgKCByYyAp
DQogwqDCoMKgIHsNCiDCoMKgwqDCoMKgwqDCoCBnZHByaW50ayhYRU5MT0dfRVJSLA0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlcHA6IGZhaWxlZCB0byBhZGQgdmlydHVhbCBk
ZXZpY2UgZm9yICVwZDogJWRcbiIsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
JnBkZXYtPnNiZGYsIGQsIHJjKTsNCiDCoMKgwqDCoMKgwqDCoCBnb3RvIGZhaWw7DQogwqDCoMKg
IH0NCg0KIMKgwqDCoCByZXR1cm4gMDsNCg0KZmFpbDoNCiDCoMKgwqAgLyoNCiDCoMKgwqDCoCAq
IFdlIGFyZSB0cnlpbmcgdG8gY2xlYW4gdXAgYXMgbXVjaCBhcyB3ZSBjYW4sIHNvIGlnbm9yZSB0
aGUgcmV0dXJuDQogwqDCoMKgwqAgKiB2YWx1ZSBvZiB2cGNpX2RlYXNzaWduX2RldmljZSBiZWxv
dywgc28gd2UgY2FuIHJldHVybiB0aGUNCiDCoMKgwqDCoCAqIGVycm9yIHdoaWNoIGNhdXNlZCB0
aGUgZmFpbHVyZS4NCiDCoMKgwqDCoCAqLw0KIMKgwqDCoCB2cGNpX2RlYXNzaWduX2RldmljZShk
LCBwZGV2KTsNCiDCoMKgwqAgcmV0dXJuIHJjOw0KfQ0KDQpTbywgSSB3aWxsIGRyb3AgdGhlIHBh
cnQgYWJvdXQgdGhlIHRvb2xzdGFjayBhbmQgY2xlYW51cCBmcm9tIHRoZSBjb21taXQgbWVzc2Fn
ZQ0KPg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBTaW5jZSB2MjoNCj4+IC0gZGVm
aW5lIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUIHNvIGRlYWQgY29kZSBpcyBub3QgY29t
cGlsZWQNCj4+ICAgIGZvciB4ODYNCj4+IFNpbmNlIHYxOg0KPj4gICAtIGNvbnN0aWZ5IHN0cnVj
dCBwY2lfZGV2IHdoZXJlIHBvc3NpYmxlDQo+PiAgIC0gZG8gbm90IG9wZW4gY29kZSBpc19zeXN0
ZW1fZG9tYWluKCkNCj4+ICAgLSBleHRlbmRlZCB0aGUgY29tbWl0IG1lc3NhZ2UNCj4+IC0tLQ0K
Pj4gICB4ZW4vZHJpdmVycy9LY29uZmlnICAgICAgICAgICB8ICA0ICsrKysNCj4+ICAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAgOSArKysrKysrKysNCj4+ICAgeGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICB4ZW4v
aW5jbHVkZS94ZW4vdnBjaS5oICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+PiAg
IDQgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9LY29uZmlnIGIveGVuL2RyaXZlcnMvS2NvbmZpZw0KPj4gaW5kZXggZGI5NDM5
M2Y0N2E2Li43ODA0OTBjZjhlMzkgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9LY29uZmln
DQo+PiArKysgYi94ZW4vZHJpdmVycy9LY29uZmlnDQo+PiBAQCAtMTUsNCArMTUsOCBAQCBzb3Vy
Y2UgImRyaXZlcnMvdmlkZW8vS2NvbmZpZyINCj4+ICAgY29uZmlnIEhBU19WUENJDQo+PiAgIAli
b29sDQo+PiAgIA0KPj4gK2NvbmZpZyBIQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiArCWJvb2wN
Cj4+ICsJZGVwZW5kcyBvbiBIQVNfVlBDSQ0KPiBJIHdvdWxkIGFzc3VtZSB0aGlzIGlzIHRvIGdv
IGF3YXkgb25jZSB0aGUgd29yayBpcyBmaW5pc2hlZD8gSSBkb24ndA0KPiB0aGluayBpdCBtYWtl
cyBzZW5zZSB0byBzcGxpdCB2UENJIGNvZGUgYmV0d2VlbiBkb21VL2RvbTAgb24gYSBidWlsZA0K
PiB0aW1lIGJhc2lzLg0KPg0KPj4gKw0KPj4gICBlbmRtZW51DQo+PiBkaWZmIC0tZ2l0IGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Yw0KPj4gaW5kZXggOWY4MDRhNTBlNzgwLi44MDVhYjg2ZWQ1NTUgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMNCj4+IEBAIC04NzAsNiArODcwLDEwIEBAIHN0YXRpYyBpbnQgZGVhc3NpZ25f
ZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90IHNlZywgdWludDhfdCBidXMsDQo+PiAg
ICAgICBpZiAoIHJldCApDQo+PiAgICAgICAgICAgZ290byBvdXQ7DQo+PiAgIA0KPj4gKyAgICBy
ZXQgPSB2cGNpX2RlYXNzaWduX2RldmljZShkLCBwZGV2KTsNCj4+ICsgICAgaWYgKCByZXQgKQ0K
Pj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiArDQo+PiAgICAgICBpZiAoIHBkZXYtPmRvbWFpbiA9
PSBoYXJkd2FyZV9kb21haW4gICkNCj4+ICAgICAgICAgICBwZGV2LT5xdWFyYW50aW5lID0gZmFs
c2U7DQo+PiAgIA0KPj4gQEAgLTE0MjksNiArMTQzMywxMSBAQCBzdGF0aWMgaW50IGFzc2lnbl9k
ZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwgdTMyIGZs
YWcpDQo+PiAgICAgICAgICAgcmMgPSBoZC0+cGxhdGZvcm1fb3BzLT5hc3NpZ25fZGV2aWNlKGQs
IGRldmZuLCBwY2lfdG9fZGV2KHBkZXYpLCBmbGFnKTsNCj4+ICAgICAgIH0NCj4+ICAgDQo+PiAr
ICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgZ290byBkb25lOw0KPj4gKw0KPj4gKyAgICByYyA9
IHZwY2lfYXNzaWduX2RldmljZShkLCBwZGV2KTsNCj4+ICsNCj4+ICAgIGRvbmU6DQo+PiAgICAg
ICBpZiAoIHJjICkNCj4+ICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORyAiJXBkOiBh
c3NpZ24gKCVwcCkgZmFpbGVkICglZClcbiIsDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gaW5kZXggMTY2NjQwMmQ1
NWI4Li4wZmU4NmNiMzBkMjMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+IEBAIC04Niw2ICs4NiwyOSBA
QCBpbnQgX19od2RvbV9pbml0IHZwY2lfYWRkX2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQ0KPj4gICANCj4+ICAgICAgIHJldHVybiByYzsNCj4+ICAgfQ0KPj4gKw0KPj4gKyNpZmRlZiBD
T05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4gKy8qIE5vdGlmeSB2UENJIHRoYXQgZGV2
aWNlIGlzIGFzc2lnbmVkIHRvIGd1ZXN0LiAqLw0KPj4gK2ludCB2cGNpX2Fzc2lnbl9kZXZpY2Uo
c3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKmRldikNCj4+ICt7DQo+PiAr
ICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gYXNzaWduIGZvciBod2RvbSBvciBndWVzdCBk
b21haW4uICovDQo+PiArICAgIGlmICggaXNfc3lzdGVtX2RvbWFpbihkKSB8fCAhaGFzX3ZwY2ko
ZCkgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4g
K30NCj4+ICsNCj4+ICsvKiBOb3RpZnkgdlBDSSB0aGF0IGRldmljZSBpcyBkZS1hc3NpZ25lZCBm
cm9tIGd1ZXN0LiAqLw0KPj4gK2ludCB2cGNpX2RlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWlu
ICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4gK3sNCj4+ICsgICAgLyogSXQgb25s
eSBtYWtlcyBzZW5zZSB0byBkZS1hc3NpZ24gZnJvbSBod2RvbSBvciBndWVzdCBkb21haW4uICov
DQo+PiArICAgIGlmICggaXNfc3lzdGVtX2RvbWFpbihkKSB8fCAhaGFzX3ZwY2koZCkgKQ0KPj4g
KyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsj
ZW5kaWYgLyogQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQgKi8NCj4+ICsNCj4+ICAgI2Vu
ZGlmIC8qIF9fWEVOX18gKi8NCj4+ICAgDQo+PiAgIHN0YXRpYyBpbnQgdnBjaV9yZWdpc3Rlcl9j
bXAoY29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnIxLA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBpbmRleCAyZTkx
MGQwYjFmOTAuLmVjYzA4ZjJjMGY2NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi92
cGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+IEBAIC0yNDIsNiArMjQy
LDI2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2cGNpX3Byb2Nlc3NfcGVuZGluZyhzdHJ1Y3QgdmNw
dSAqdikNCj4+ICAgfQ0KPj4gICAjZW5kaWYNCj4+ICAgDQo+PiArI2lmIGRlZmluZWQoQ09ORklH
X0hBU19WUENJKSAmJiBkZWZpbmVkKENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUKQ0KPiBZ
b3UgZG9uJ3QgbmVlZCB0byBjaGVjayBmb3IgQ09ORklHX0hBU19WUENJLCBhcw0KPiBDT05GSUdf
SEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCBhbHJlYWR5IGRlcGVuZHMgb24gQ09ORklHX0hBU19WUENJ
IGJlaW5nDQo+IHNldC4NCj4NCldpbGwgZml4DQo+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZp
Y2UgaXMgYXNzaWduZWQvZGUtYXNzaWduZWQgdG8vZnJvbSBndWVzdC4gKi8NCj4+ICtpbnQgX19t
dXN0X2NoZWNrIHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYp
Ow0KPj4gK2ludCBfX211c3RfY2hlY2sgdnBjaV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4gKyNlbHNlDQo+PiArc3RhdGljIGlubGluZSBpbnQgdnBj
aV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+PiArew0KPj4g
KyAgICByZXR1cm4gMDsNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IHZwY2lf
ZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKmRldikNCj4+ICt7DQo+
PiArICAgIHJldHVybiAwOw0KPj4gK307DQo+IFlvdSBuZWVkIHRoZSBfX211c3RfY2hlY2sgYXR0
cmlidXRlcyBoZXJlIGFsc28gdG8gbWF0Y2ggdGhlIHByb3RvdHlwZXMNCj4gYWJvdmUuDQpZZXMs
IGl0IHdhcyBhbHJlYWR5IGRpc2N1c3NlZCBhbmQgSSB3aWxsIHJlbW92ZSBfX211c3RfY2hlY2su
DQo+IFRoYW5rcywgUm9nZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

