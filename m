Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF3943954D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 13:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215771.375142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meyWN-0001L4-DE; Mon, 25 Oct 2021 11:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215771.375142; Mon, 25 Oct 2021 11:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meyWN-0001J7-9t; Mon, 25 Oct 2021 11:52:07 +0000
Received: by outflank-mailman (input) for mailman id 215771;
 Mon, 25 Oct 2021 11:52:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1v/+=PN=epam.com=prvs=0932af52eb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1meyWL-0001J1-Oz
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 11:52:05 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26b02925-b9d7-4a5c-8c6e-48df1b6af1b0;
 Mon, 25 Oct 2021 11:52:03 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PAVjHj018300; 
 Mon, 25 Oct 2021 11:52:02 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bwrvagujd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 11:52:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5009.eurprd03.prod.outlook.com (2603:10a6:208:105::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 11:51:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 11:51:57 +0000
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
X-Inumbo-ID: 26b02925-b9d7-4a5c-8c6e-48df1b6af1b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vu11CsIGfiN2RqIulJIaMKJJTbjEiCX11z2hYYsBT16/4P9n0TErDcdOje6nfrdSoNpQxPSil/hdqTRAyofJM4VzrG1wpXKKRnB6O7yKS7XWJLG03iwHaiLZuOR0BOBnB6tUWjXeDZrf4t8BKHrZb6OSoMP7fUFThN1MuTttfkXyiRC5fhlAGmfPJGKLWgvKhAerHgyIxvgdyfi99Lh8uRhtBTYnO0g7iIhv+Vd4QNW0J14ij8GC9ezytd4PWj8G19gCYJb1T6zSSfUf9vC6TAWP4F8vWTkh6SXZbJQEwkXGi/FeXb74Kk+3JlwtUDgSqJq52XjfFsqBhJUAOeyJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diyFJu3exAB9XQupRDEjylhswIDofa3cZIW7OV+c/EE=;
 b=fJrH6oiqiuEa3vDHaPujKzEoOQeDnYRmYLeIAKY44UH9+v0oHveFFVh7ydhbm9rYK/QpkUDOX3Kyfpf9Eu0nKAuHuzlxJeDiQrLCK0B3b1LBEcq41xX0eB6uTYX+bSvetZNr9nFIXMpelyKh2VmP1bFeHnWByTH3GUoHgz7sWTwYQ67kRxV95yzwTjYk93+CGM3diwZovHBv/rEUl5pGniarYicKD4tBhT709gdLfuxxYS2WjwydDI8WjJ6CTRsvsK8P6VE/WlTmu2WpTnxGnPW9VtZ2khifV9CRrUv7NWFGBgbVq/sZKujhu112+Fz4zkfyzU0pa3dg+66BkPg9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diyFJu3exAB9XQupRDEjylhswIDofa3cZIW7OV+c/EE=;
 b=Vj1pFSMTEM/FUGhKQVtHWqXcBtU3yUXlDXJFXlLN3RirwnQvr+Bu8zJsvCVLkW7bVimtcdcfH5TsPuql263qhM8mpts3iAwHgJoCeepX44g8DJnXqWvlvsTYimtFxPzScnE5WLSh7Ly5VAv3uhpjcJ/Ag+hgURX1HDvoj7IWbgQrkSW40yrZlqOxlcevWWCuMtVubGq+5I+29peLupwCXX++au2s83dy3qxdBj8Yf/8uUOUhSRblwfS6IacMxrciHGrqkBCICKMxrznbne4BbwY9g4X6qJcKCe+4RehSQ1AdNBrX8OWHMWijIN4dXlIRz/zCllM49CCw0ZHVRGfOEg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
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
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Thread-Topic: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Thread-Index: AQHXtdAibxRAFQhJuUO1GvFhv7aI/6vjwcoA
Date: Mon, 25 Oct 2021 11:51:57 +0000
Message-ID: <fc9de674-1000-c956-3401-103d8388d428@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-7-andr2000@gmail.com>
In-Reply-To: <20210930075223.860329-7-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e08ea65-3ccf-460b-a688-08d997add919
x-ms-traffictypediagnostic: AM0PR03MB5009:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5009223DD2A847B5358B53F7E7839@AM0PR03MB5009.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cnACTbQXJ9qucyQKaEbU9Wtx0KmdMJr05lvjKKv4KPpCDKfdHxAN/7ri7rfYtsXRcw5guCeyL8DZzDnTXZKtLazk0pR8To41QAhFFl6q15+5tWqIhIgpT3skmX1upEYb5NNJuTRWVyofVLlTrUAtZ3dMERJ/rwWpHdAAFR8kvPIin6KU/tZdMqbOWhLFdxrRf156l3aHCu6fnKYEMZI+rV8rdXNdVl9PROJzhYUiJDRgJQsJZyBkTB7S4J4QvNf/cSCe8Av+xfra6CjU8kA3GVmfqzKUPbZIwhoTa049F6XiNWYfBsPMvknmpS/ysXVPUB8MAIGxAtY5IISKSEpvO3TQ601u1yyu7jQIo/F1TxpYHRuiFFpoqp8dgqe9r+67YQIxi/lhJSOxbFS4jZufXUTjvIjrwPl5CwUFGBjQWo3Q6BACnfBpGHUaHWqB9j6SmBN6NB0BrMlm9Rs8Ioomgf8unlWLmcIw3qBM4kAI/s6rsRuPKKVAUM/gF+2Aj8KB0JmZZpc2GM5erW1+dqi/lYVfll+f81ottTYz+vY5T/hPHdnXXPGa6eLGb/gSuqvOYpI3PnC8je6nfxCTCsVrrBPAxMDD5gymMM+coXPwNUt17qZYDF6lKQ2xCpapx68T0pLvLUKMMiSxyuM4wknKBnRiKCdQtYs3SlqO1vCEP58DPMMsOdgx1I3KIXo9ZP7xc2DWD4BmWl5ikqOCrQMbi06VPy8GepdVkNUWr3eG4ffFGc3N/3iyDN87HQ6iHxNg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(30864003)(53546011)(6506007)(31686004)(83380400001)(6916009)(6486002)(86362001)(4326008)(91956017)(2616005)(26005)(31696002)(122000001)(64756008)(38070700005)(186003)(54906003)(6512007)(66946007)(76116006)(316002)(2906002)(66476007)(8936002)(66556008)(66446008)(36756003)(508600001)(5660300002)(8676002)(71200400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TndpVVk1WWZ4bExkMDEydW8xVWsvNkZXemMwb0Qrcm51NkI5TVM1c0dqUmxC?=
 =?utf-8?B?YllQYTRPWitpNXRVRlgvYU1XQUNxREpvRkpUVTVmZWZaUndRVVc1MUk0YktG?=
 =?utf-8?B?SVBMM1ErQU1hWGxkTzhkRmRDV0VsMzdOWE84VjVJeXE1NEl6QVRPTzh5TUJX?=
 =?utf-8?B?bSt0bFlxaUJ5OUs4a0hCQ2hoWjlUL1VsaXBOK205eDVkeFNTZjVBY1ZuclF4?=
 =?utf-8?B?N3NQNVZsZGIwSUJaaFFWZFl6bUJId3d3WXR2SXhVcHFKRnFUZ2hheG1HKzRO?=
 =?utf-8?B?eVMxTmhna3NZbzRPRW9lOHlFblh4NURyeWxGZTBzYUU2YWpMRlJSVk1UTVJR?=
 =?utf-8?B?NmxvQ2dFc0xtQjFncllBYklvRHdJdkpWeXRMai9DV096aUJOajhucjhwbjFv?=
 =?utf-8?B?a3NRcUQ1eXE2V0Rxd0VXKy94RENVQkNmYzlSVjhWZTRJall2VnJSMnVLRXQ2?=
 =?utf-8?B?d1lINHJRQ2FUZWptN3dEcE5qdlA1ays1SkYrUHVPNHRTb2lTc3Y2bS9LWHEr?=
 =?utf-8?B?cnovVVhQZjAreGV3WDhGamxJUzFabmsrM2QvWm5YR21YUVI3QmtWUjJJWU1E?=
 =?utf-8?B?U0swdlAySjh6UDBrVWNOaWZHMWRoZGRnWTYyVk5hcjkvT3JhSDN4RVN1Tldx?=
 =?utf-8?B?RUU2RFlnWHpPUWpwWWVhaUhxVE1SL2ZuVm5tbVJET09kOXc4RUhzNmFReis0?=
 =?utf-8?B?dHVYdWxJN0JZUG1FRmYxWW9IbEN1cEtXVERQcTRCb08zYmtob1ROOE4zRlhE?=
 =?utf-8?B?Q21KWTlyQnNVeG9xalcya1BSQTV0TGk5dnVKb0J3Nmh5RmZnQWllMFdnL3F2?=
 =?utf-8?B?L0svVU45aDFxcURiWFhGTVBPUk52Q0FMQ3FudnE3djluR1YwQUxaRGR2L2Q4?=
 =?utf-8?B?Nms3TlA5N2hhWjIwbTJLQlJnK3RtbFpUeVBPc2JxazUzSmRpNkxad05PbER0?=
 =?utf-8?B?a0FBYVBlQ2VHcGprWm1HSzZsYTJtblhKMGNqVEl0SWRzd0IwcDE4U2Y4Lzd4?=
 =?utf-8?B?SzhKalRaV05iRy9hQmsvVjdJYXVkaWJWZTlVMHFFYkJXUzVzMXkwcmJHQ2cv?=
 =?utf-8?B?ZUkrQjVuMXgxOWUwRkJ5L3l4b2RkYXNNKzFWcjZNMXNLVDluQUF4WXBpYmNs?=
 =?utf-8?B?WmNqd2IvTjJLaWR1TlJCSWd4bDdIZnZsbmVFTmQ3ZUdvMm5RcDIvVmFLdTVT?=
 =?utf-8?B?NWtWbHFNQmNTQXF6djRyTzhIZ1hSUUpKVmRRTFdYUFpNNlBvNTg0eThGaTVl?=
 =?utf-8?B?Ni9KMVpRVjNPdWtOQUVtc2wyTGpwbGtQRWlwcHAyZWwrbjhYY1dHU00wSDRG?=
 =?utf-8?B?b3A0cU5KYi9zays4MDFrRFd3OVkvUmNYNFVNMGZpVTM5MThCTUFLSk1mbDVq?=
 =?utf-8?B?bUh6MitlTTdnczg2YnlvdkhHLzcwZEROVXlwVTZpZ1VrbEFPYnVSU0VKeTh6?=
 =?utf-8?B?a1lSTUxrbVBjcllqeXB6V3BLSVA0ZWhNZWZsQzFvcjF2TCs1dHNBZSttQ0kx?=
 =?utf-8?B?RXRGQjgrS0FZWXJKQnpzWWh6T0RRbHNLQU9jVS9Bb1hhcm0vY0ZpamVBOXpY?=
 =?utf-8?B?KzJ5TjdSdHc4R3M5dG5hTFAvekx1VG5uQlpZN3NPbEZINk5MdU1GSG5QaEVR?=
 =?utf-8?B?ZUU0MGN4N3BxL2QwQmdwK3VzNXdyNFNXU3FHU05MQlFRVE81cjJ0MS9DOFE0?=
 =?utf-8?B?cEZjOFVURmZnSXdmU0lMSG00dmFiS2haL0MyWWM5NmdjSnhqV2JOSGt2dHdN?=
 =?utf-8?B?L0UzTlVQbDhhMGlsbStNNExSKzdKTTRjQjRkcEFjYksxcUxaU3YxenpQcWJk?=
 =?utf-8?B?VnIxVW1EVEw2dHlBcDFod1VxR2pBK0srUHNnZTlBSFlLT3N6MmlvMGc5TzZX?=
 =?utf-8?B?Y081dURWbE5BT09OczEzY0ZwZ0VtYTc4Y3F0aHRnck9nbFNOWXVyUU4xVmxw?=
 =?utf-8?B?aXNuQ0E0NXhUbzNWV1JDTTRDUWdVdnhZNnNhdXJEQVV1TmlLTU5EMTJOc0hr?=
 =?utf-8?B?b3hmUWV5K3R2eS9pQU1BSEpFYlVwbU8rM0lpbWp0TG1FUllHK1FsakJaU2Fl?=
 =?utf-8?B?UFhVdjFzVkhGb2liZitNUHp2ZDFKRHlMZE1qelRJSEE5OXNWQmozMUN4cFNy?=
 =?utf-8?B?ME5tRHY0WjAydTRNcUpVcUlaTE1nWnNpcWxVWGRmT1FFYmxoaVZoVGxTVzVU?=
 =?utf-8?B?WkpaRm1TMVZBKzJWMFFNN3pPSFVDTzVDNmt5Tjd6U0pXUGt1WU1jYXpVYjQw?=
 =?utf-8?B?cVRydVFrVXhEODI0OHEwUFNMVSsxOW1sWmkzSWNGWmhBcVNBcDdjTEtLTlhP?=
 =?utf-8?B?dm1GN0tQNWRKVmxvbHR6MWkxRFk5VStpek15TUpEREVNK1dYaExyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B19F14507A8A624FB81FC031AD11786D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e08ea65-3ccf-460b-a688-08d997add919
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 11:51:57.5147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZcZi4HlrlaiONT6+WxzX/FAaGjH42V29ZbqWe/xC3AYiJlFXIFPPsLETtQx/CK0iYXy7DK4LElfBCl+8ybSyt5hxhQoQhkFkY7dsdbmvhZ+okOv1pFYmqFISG9ACjBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5009
X-Proofpoint-GUID: tjITc_ZQjeYKLWhL1ivj1nDH-eOOJZeR
X-Proofpoint-ORIG-GUID: tjITc_ZQjeYKLWhL1ivj1nDH-eOOJZeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_04,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110250073

SGksIFJvZ2VyIQ0KQ291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGUgYmVsb3c/DQpK
YW4gd2FzIHF1ZXN0aW9uaW5nIHRoZSBwZXIgQkFSIHJhbmdlIHNldCBhcHByb2FjaCwgc28gaXQN
CmlzIGNydWNpYWwgZm9yIHRoZSBtYWludGFpbmVyICh5b3UpIHRvIGFuc3dlciBoZXJlLg0KDQpU
aGFuayB5b3UgaW4gYWR2YW5jZSwNCk9sZWtzYW5kcg0KDQpPbiAzMC4wOS4yMSAxMDo1MiwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4NCj4gSW5zdGVhZCBvZiBo
YW5kbGluZyBhIHNpbmdsZSByYW5nZSBzZXQsIHRoYXQgY29udGFpbnMgYWxsIHRoZSBtZW1vcnkN
Cj4gcmVnaW9ucyBvZiBhbGwgdGhlIEJBUnMgYW5kIFJPTSwgaGF2ZSB0aGVtIHBlciBCQVIuDQo+
DQo+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gb2YgbWFraW5nIG5vbi1pZGVudGl0eSBtYXBwaW5n
cyBpbiBwMm0gZm9yIHRoZQ0KPiBNTUlPcy9ST00uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4g
LS0tDQo+ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDE3MiArKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgfCAg
IDMgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jDQo+IGluZGV4IGVjNGQyMTVmMzZmZi4uOWM2MDNkMjZkMzAy
IDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+ICsrKyBiL3hlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4gQEAgLTEzMSw0OSArMTMxLDc1IEBAIHN0YXRpYyB2b2lk
IG1vZGlmeV9kZWNvZGluZyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2X3QgY21k
LA0KPiAgIA0KPiAgIGJvb2wgdnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpDQo+
ICAgew0KPiAtICAgIGlmICggdi0+dnBjaS5tZW0gKQ0KPiArICAgIGlmICggdi0+dnBjaS5udW1f
bWVtX3JhbmdlcyApDQo+ICAgICAgIHsNCj4gICAgICAgICAgIHN0cnVjdCBtYXBfZGF0YSBkYXRh
ID0gew0KPiAgICAgICAgICAgICAgIC5kID0gdi0+ZG9tYWluLA0KPiAgICAgICAgICAgICAgIC5t
YXAgPSB2LT52cGNpLmNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSwNCj4gICAgICAgICAgIH07DQo+
IC0gICAgICAgIGludCByYyA9IHJhbmdlc2V0X2NvbnN1bWVfcmFuZ2VzKHYtPnZwY2kubWVtLCBt
YXBfcmFuZ2UsICZkYXRhKTsNCj4gKyAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB2LT52
cGNpLnBkZXY7DQo+ICsgICAgICAgIHN0cnVjdCB2cGNpX2hlYWRlciAqaGVhZGVyID0gJnBkZXYt
PnZwY2ktPmhlYWRlcjsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+ICAgDQo+IC0gICAg
ICAgIGlmICggcmMgPT0gLUVSRVNUQVJUICkNCj4gLSAgICAgICAgICAgIHJldHVybiB0cnVlOw0K
PiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsr
ICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSAm
aGVhZGVyLT5iYXJzW2ldOw0KPiArICAgICAgICAgICAgaW50IHJjOw0KPiAgIA0KPiAtICAgICAg
ICBzcGluX2xvY2soJnYtPnZwY2kucGRldi0+dnBjaS0+bG9jayk7DQo+IC0gICAgICAgIC8qIERp
c2FibGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxseSBvbiBmYWlsdXJlLiAqLw0KPiAt
ICAgICAgICBtb2RpZnlfZGVjb2Rpbmcodi0+dnBjaS5wZGV2LA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgcmMgPyB2LT52cGNpLmNtZCAmIH5QQ0lfQ09NTUFORF9NRU1PUlkgOiB2LT52cGNp
LmNtZCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICFyYyAmJiB2LT52cGNpLnJvbV9vbmx5
KTsNCj4gLSAgICAgICAgc3Bpbl91bmxvY2soJnYtPnZwY2kucGRldi0+dnBjaS0+bG9jayk7DQo+
ICsgICAgICAgICAgICBpZiAoICFiYXItPm1lbSApDQo+ICsgICAgICAgICAgICAgICAgY29udGlu
dWU7DQo+ICAgDQo+IC0gICAgICAgIHJhbmdlc2V0X2Rlc3Ryb3kodi0+dnBjaS5tZW0pOw0KPiAt
ICAgICAgICB2LT52cGNpLm1lbSA9IE5VTEw7DQo+IC0gICAgICAgIGlmICggcmMgKQ0KPiAtICAg
ICAgICAgICAgLyoNCj4gLSAgICAgICAgICAgICAqIEZJWE1FOiBpbiBjYXNlIG9mIGZhaWx1cmUg
cmVtb3ZlIHRoZSBkZXZpY2UgZnJvbSB0aGUgZG9tYWluLg0KPiAtICAgICAgICAgICAgICogTm90
ZSB0aGF0IHRoZXJlIG1pZ2h0IHN0aWxsIGJlIGxlZnRvdmVyIG1hcHBpbmdzLiBXaGlsZSB0aGlz
IGlzDQo+IC0gICAgICAgICAgICAgKiBzYWZlIGZvciBEb20wLCBmb3IgRG9tVXMgdGhlIGRvbWFp
biB3aWxsIGxpa2VseSBuZWVkIHRvIGJlDQo+IC0gICAgICAgICAgICAgKiBraWxsZWQgaW4gb3Jk
ZXIgdG8gYXZvaWQgbGVha2luZyBzdGFsZSBwMm0gbWFwcGluZ3Mgb24NCj4gLSAgICAgICAgICAg
ICAqIGZhaWx1cmUuDQo+IC0gICAgICAgICAgICAgKi8NCj4gLSAgICAgICAgICAgIHZwY2lfcmVt
b3ZlX2RldmljZSh2LT52cGNpLnBkZXYpOw0KPiArICAgICAgICAgICAgcmMgPSByYW5nZXNldF9j
b25zdW1lX3JhbmdlcyhiYXItPm1lbSwgbWFwX3JhbmdlLCAmZGF0YSk7DQo+ICsNCj4gKyAgICAg
ICAgICAgIGlmICggcmMgPT0gLUVSRVNUQVJUICkNCj4gKyAgICAgICAgICAgICAgICByZXR1cm4g
dHJ1ZTsNCj4gKw0KPiArICAgICAgICAgICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsN
Cj4gKyAgICAgICAgICAgIC8qIERpc2FibGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxs
eSBvbiBmYWlsdXJlLiAqLw0KPiArICAgICAgICAgICAgbW9kaWZ5X2RlY29kaW5nKHBkZXYsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmMgPyB2LT52cGNpLmNtZCAmIH5QQ0lfQ09N
TUFORF9NRU1PUlkgOiB2LT52cGNpLmNtZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAhcmMgJiYgdi0+dnBjaS5yb21fb25seSk7DQo+ICsgICAgICAgICAgICBzcGluX3VubG9jaygm
cGRldi0+dnBjaS0+bG9jayk7DQo+ICsNCj4gKyAgICAgICAgICAgIHJhbmdlc2V0X2Rlc3Ryb3ko
YmFyLT5tZW0pOw0KPiArICAgICAgICAgICAgYmFyLT5tZW0gPSBOVUxMOw0KPiArICAgICAgICAg
ICAgdi0+dnBjaS5udW1fbWVtX3Jhbmdlcy0tOw0KPiArICAgICAgICAgICAgaWYgKCByYyApDQo+
ICsgICAgICAgICAgICAgICAgLyoNCj4gKyAgICAgICAgICAgICAgICAgKiBGSVhNRTogaW4gY2Fz
ZSBvZiBmYWlsdXJlIHJlbW92ZSB0aGUgZGV2aWNlIGZyb20gdGhlIGRvbWFpbi4NCj4gKyAgICAg
ICAgICAgICAgICAgKiBOb3RlIHRoYXQgdGhlcmUgbWlnaHQgc3RpbGwgYmUgbGVmdG92ZXIgbWFw
cGluZ3MuIFdoaWxlIHRoaXMgaXMNCj4gKyAgICAgICAgICAgICAgICAgKiBzYWZlIGZvciBEb20w
LCBmb3IgRG9tVXMgdGhlIGRvbWFpbiB3aWxsIGxpa2VseSBuZWVkIHRvIGJlDQo+ICsgICAgICAg
ICAgICAgICAgICoga2lsbGVkIGluIG9yZGVyIHRvIGF2b2lkIGxlYWtpbmcgc3RhbGUgcDJtIG1h
cHBpbmdzIG9uDQo+ICsgICAgICAgICAgICAgICAgICogZmFpbHVyZS4NCj4gKyAgICAgICAgICAg
ICAgICAgKi8NCj4gKyAgICAgICAgICAgICAgICB2cGNpX3JlbW92ZV9kZXZpY2UocGRldik7DQo+
ICsgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgIA0KPiAgICAgICByZXR1cm4gZmFsc2U7DQo+ICAg
fQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgX19pbml0IGFwcGx5X21hcChzdHJ1Y3QgZG9tYWluICpk
LCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSwgdWludDE2X3QgY21kKQ0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQxNl90IGNtZCkNCj4gICB7DQo+ICAgICAgIHN0cnVjdCBtYXBf
ZGF0YSBkYXRhID0geyAuZCA9IGQsIC5tYXAgPSB0cnVlIH07DQo+IC0gICAgaW50IHJjOw0KPiAr
ICAgIHN0cnVjdCB2cGNpX2hlYWRlciAqaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4g
KyAgICBpbnQgcmMgPSAwOw0KPiArICAgIHVuc2lnbmVkIGludCBpOw0KPiArDQo+ICsgICAgZm9y
ICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+ICsgICAgew0K
PiArICAgICAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9ICZoZWFkZXItPmJhcnNbaV07DQo+ICAg
DQo+IC0gICAgd2hpbGUgKCAocmMgPSByYW5nZXNldF9jb25zdW1lX3JhbmdlcyhtZW0sIG1hcF9y
YW5nZSwgJmRhdGEpKSA9PSAtRVJFU1RBUlQgKQ0KPiAtICAgICAgICBwcm9jZXNzX3BlbmRpbmdf
c29mdGlycXMoKTsNCj4gLSAgICByYW5nZXNldF9kZXN0cm95KG1lbSk7DQo+ICsgICAgICAgIGlm
ICggIWJhci0+bWVtICkNCj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiArDQo+ICsgICAgICAg
IHdoaWxlICggKHJjID0gcmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMoYmFyLT5tZW0sIG1hcF9yYW5n
ZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZGF0
YSkpID09IC1FUkVTVEFSVCApDQo+ICsgICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGly
cXMoKTsNCj4gKyAgICAgICAgcmFuZ2VzZXRfZGVzdHJveShiYXItPm1lbSk7DQo+ICsgICAgICAg
IGJhci0+bWVtID0gTlVMTDsNCj4gKyAgICB9DQo+ICAgICAgIGlmICggIXJjICkNCj4gICAgICAg
ICAgIG1vZGlmeV9kZWNvZGluZyhwZGV2LCBjbWQsIGZhbHNlKTsNCj4gICANCj4gQEAgLTE4MSw3
ICsyMDcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhcHBseV9tYXAoc3RydWN0IGRvbWFpbiAqZCwg
Y29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lk
IGRlZmVyX21hcChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSwgdWludDE2X3QgY21kLCBi
b29sIHJvbV9vbmx5KQ0KPiArICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGNtZCwgYm9v
bCByb21fb25seSwgdWludDhfdCBudW1fbWVtX3JhbmdlcykNCj4gICB7DQo+ICAgICAgIHN0cnVj
dCB2Y3B1ICpjdXJyID0gY3VycmVudDsNCj4gICANCj4gQEAgLTE5Miw5ICsyMTgsOSBAQCBzdGF0
aWMgdm9pZCBkZWZlcl9tYXAoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYs
DQo+ICAgICAgICAqIHN0YXJ0ZWQgZm9yIHRoZSBzYW1lIGRldmljZSBpZiB0aGUgZG9tYWluIGlz
IG5vdCB3ZWxsLWJlaGF2ZWQuDQo+ICAgICAgICAqLw0KPiAgICAgICBjdXJyLT52cGNpLnBkZXYg
PSBwZGV2Ow0KPiAtICAgIGN1cnItPnZwY2kubWVtID0gbWVtOw0KPiAgICAgICBjdXJyLT52cGNp
LmNtZCA9IGNtZDsNCj4gICAgICAgY3Vyci0+dnBjaS5yb21fb25seSA9IHJvbV9vbmx5Ow0KPiAr
ICAgIGN1cnItPnZwY2kubnVtX21lbV9yYW5nZXMgPSBudW1fbWVtX3JhbmdlczsNCj4gICAgICAg
LyoNCj4gICAgICAgICogUmFpc2UgYSBzY2hlZHVsZXIgc29mdGlycSBpbiBvcmRlciB0byBwcmV2
ZW50IHRoZSBndWVzdCBmcm9tIHJlc3VtaW5nDQo+ICAgICAgICAqIGV4ZWN1dGlvbiB3aXRoIHBl
bmRpbmcgbWFwcGluZyBvcGVyYXRpb25zLCB0byB0cmlnZ2VyIHRoZSBpbnZvY2F0aW9uDQo+IEBA
IC0yMDYsNDIgKzIzMiw0NyBAQCBzdGF0aWMgdm9pZCBkZWZlcl9tYXAoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICAgc3RhdGljIGludCBtb2RpZnlfYmFycyhjb25z
dCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KPiAg
IHsNCj4gICAgICAgc3RydWN0IHZwY2lfaGVhZGVyICpoZWFkZXIgPSAmcGRldi0+dnBjaS0+aGVh
ZGVyOw0KPiAtICAgIHN0cnVjdCByYW5nZXNldCAqbWVtID0gcmFuZ2VzZXRfbmV3KE5VTEwsIE5V
TEwsIDApOw0KPiAgICAgICBzdHJ1Y3QgcGNpX2RldiAqdG1wLCAqZGV2ID0gTlVMTDsNCj4gICAg
ICAgY29uc3Qgc3RydWN0IHZwY2lfbXNpeCAqbXNpeCA9IHBkZXYtPnZwY2ktPm1zaXg7DQo+IC0g
ICAgdW5zaWduZWQgaW50IGk7DQo+ICsgICAgdW5zaWduZWQgaW50IGksIGo7DQo+ICAgICAgIGlu
dCByYzsNCj4gLQ0KPiAtICAgIGlmICggIW1lbSApDQo+IC0gICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KPiArICAgIHVpbnQ4X3QgbnVtX21lbV9yYW5nZXM7DQo+ICAgDQo+ICAgICAgIC8qDQo+IC0g
ICAgICogQ3JlYXRlIGEgcmFuZ2VzZXQgdGhhdCByZXByZXNlbnRzIHRoZSBjdXJyZW50IGRldmlj
ZSBCQVJzIG1lbW9yeSByZWdpb24NCj4gKyAgICAgKiBDcmVhdGUgYSByYW5nZXNldCBwZXIgQkFS
IHRoYXQgcmVwcmVzZW50cyB0aGUgY3VycmVudCBkZXZpY2UgbWVtb3J5IHJlZ2lvbg0KPiAgICAg
ICAgKiBhbmQgY29tcGFyZSBpdCBhZ2FpbnN0IGFsbCB0aGUgY3VycmVudGx5IGFjdGl2ZSBCQVIg
bWVtb3J5IHJlZ2lvbnMuIElmDQo+ICAgICAgICAqIGFuIG92ZXJsYXAgaXMgZm91bmQsIHN1YnRy
YWN0IGl0IGZyb20gdGhlIHJlZ2lvbiB0byBiZSBtYXBwZWQvdW5tYXBwZWQuDQo+ICAgICAgICAq
DQo+IC0gICAgICogRmlyc3QgZmlsbCB0aGUgcmFuZ2VzZXQgd2l0aCBhbGwgdGhlIEJBUnMgb2Yg
dGhpcyBkZXZpY2Ugb3Igd2l0aCB0aGUgUk9NDQo+ICsgICAgICogRmlyc3QgZmlsbCB0aGUgcmFu
Z2VzZXRzIHdpdGggYWxsIHRoZSBCQVJzIG9mIHRoaXMgZGV2aWNlIG9yIHdpdGggdGhlIFJPTQ0K
PiAgICAgICAgKiBCQVIgb25seSwgZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIGd1ZXN0IGlzIHRv
Z2dsaW5nIHRoZSBtZW1vcnkgZGVjb2RlDQo+ICAgICAgICAqIGJpdCBvZiB0aGUgY29tbWFuZCBy
ZWdpc3Rlciwgb3IgdGhlIGVuYWJsZSBiaXQgb2YgdGhlIFJPTSBCQVIgcmVnaXN0ZXIuDQo+ICAg
ICAgICAqLw0KPiAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJz
KTsgaSsrICkNCj4gICAgICAgew0KPiAtICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIgKmJh
ciA9ICZoZWFkZXItPmJhcnNbaV07DQo+ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0g
JmhlYWRlci0+YmFyc1tpXTsNCj4gICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQgPSBQRk5f
RE9XTihiYXItPmFkZHIpOw0KPiAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQgPSBQRk5fRE9X
TihiYXItPmFkZHIgKyBiYXItPnNpemUgLSAxKTsNCj4gICANCj4gKyAgICAgICAgYmFyLT5tZW0g
PSBOVUxMOw0KPiArDQo+ICAgICAgICAgICBpZiAoICFNQVBQQUJMRV9CQVIoYmFyKSB8fA0KPiAg
ICAgICAgICAgICAgICAocm9tX29ubHkgPyBiYXItPnR5cGUgIT0gVlBDSV9CQVJfUk9NDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICA6IChiYXItPnR5cGUgPT0gVlBDSV9CQVJfUk9NICYmICFo
ZWFkZXItPnJvbV9lbmFibGVkKSkgKQ0KPiAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAgIA0K
PiAtICAgICAgICByYyA9IHJhbmdlc2V0X2FkZF9yYW5nZShtZW0sIHN0YXJ0LCBlbmQpOw0KPiAr
ICAgICAgICBiYXItPm1lbSA9IHJhbmdlc2V0X25ldyhOVUxMLCBOVUxMLCAwKTsNCj4gKyAgICAg
ICAgaWYgKCAhYmFyLT5tZW0gKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICByYyA9IC1F
Tk9NRU07DQo+ICsgICAgICAgICAgICBnb3RvIGZhaWw7DQo+ICsgICAgICAgIH0NCj4gKw0KPiAr
ICAgICAgICByYyA9IHJhbmdlc2V0X2FkZF9yYW5nZShiYXItPm1lbSwgc3RhcnQsIGVuZCk7DQo+
ICAgICAgICAgICBpZiAoIHJjICkNCj4gICAgICAgICAgIHsNCj4gICAgICAgICAgICAgICBwcmlu
dGsoWEVOTE9HX0dfV0FSTklORyAiRmFpbGVkIHRvIGFkZCBbJWx4LCAlbHhdOiAlZFxuIiwNCj4g
ICAgICAgICAgICAgICAgICAgICAgc3RhcnQsIGVuZCwgcmMpOw0KPiAtICAgICAgICAgICAgcmFu
Z2VzZXRfZGVzdHJveShtZW0pOw0KPiAtICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiArICAgICAg
ICAgICAgZ290byBmYWlsOw0KPiAgICAgICAgICAgfQ0KPiAgICAgICB9DQo+ICAgDQo+IEBAIC0y
NTIsMTQgKzI4MywyMSBAQCBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQo+ICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGVuZCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2FkZHIocGRldi0+dnBjaSwgaSkg
Kw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bXNpeF90YWJsZV9z
aXplKHBkZXYtPnZwY2ksIGkpIC0gMSk7DQo+ICAgDQo+IC0gICAgICAgIHJjID0gcmFuZ2VzZXRf
cmVtb3ZlX3JhbmdlKG1lbSwgc3RhcnQsIGVuZCk7DQo+IC0gICAgICAgIGlmICggcmMgKQ0KPiAr
ICAgICAgICBmb3IgKCBqID0gMDsgaiA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaisrICkN
Cj4gICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HDQo+
IC0gICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byByZW1vdmUgTVNJWCB0YWJsZSBbJWx4LCAl
bHhdOiAlZFxuIiwNCj4gLSAgICAgICAgICAgICAgICAgICBzdGFydCwgZW5kLCByYyk7DQo+IC0g
ICAgICAgICAgICByYW5nZXNldF9kZXN0cm95KG1lbSk7DQo+IC0gICAgICAgICAgICByZXR1cm4g
cmM7DQo+ICsgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9ICZoZWFkZXIt
PmJhcnNbal07DQo+ICsNCj4gKyAgICAgICAgICAgIGlmICggIWJhci0+bWVtICkNCj4gKyAgICAg
ICAgICAgICAgICBjb250aW51ZTsNCj4gKw0KPiArICAgICAgICAgICAgcmMgPSByYW5nZXNldF9y
ZW1vdmVfcmFuZ2UoYmFyLT5tZW0sIHN0YXJ0LCBlbmQpOw0KPiArICAgICAgICAgICAgaWYgKCBy
YyApDQo+ICsgICAgICAgICAgICB7DQo+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19H
X1dBUk5JTkcNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byByZW1vdmUgTVNJ
WCB0YWJsZSBbJWx4LCAlbHhdOiAlZFxuIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Rh
cnQsIGVuZCwgcmMpOw0KPiArICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4gKyAgICAgICAg
ICAgIH0NCj4gICAgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgIA0KPiBAQCAtMjkxLDcgKzMyOSw4
IEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVp
bnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4gICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IHN0YXJ0ID0gUEZOX0RPV04oYmFyLT5hZGRyKTsNCj4gICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGVuZCA9IFBGTl9ET1dOKGJhci0+YWRkciArIGJhci0+c2l6ZSAtIDEpOw0KPiAgIA0KPiAt
ICAgICAgICAgICAgaWYgKCAhYmFyLT5lbmFibGVkIHx8ICFyYW5nZXNldF9vdmVybGFwc19yYW5n
ZShtZW0sIHN0YXJ0LCBlbmQpIHx8DQo+ICsgICAgICAgICAgICBpZiAoICFiYXItPmVuYWJsZWQg
fHwNCj4gKyAgICAgICAgICAgICAgICAgIXJhbmdlc2V0X292ZXJsYXBzX3JhbmdlKGJhci0+bWVt
LCBzdGFydCwgZW5kKSB8fA0KPiAgICAgICAgICAgICAgICAgICAgLyoNCj4gICAgICAgICAgICAg
ICAgICAgICAqIElmIG9ubHkgdGhlIFJPTSBlbmFibGUgYml0IGlzIHRvZ2dsZWQgY2hlY2sgYWdh
aW5zdCBvdGhlcg0KPiAgICAgICAgICAgICAgICAgICAgICogQkFScyBpbiB0aGUgc2FtZSBkZXZp
Y2UgZm9yIG92ZXJsYXBzLCBidXQgbm90IGFnYWluc3QgdGhlDQo+IEBAIC0zMDAsMTMgKzMzOSwx
MiBAQCBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1
aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQo+ICAgICAgICAgICAgICAgICAgICAocm9tX29u
bHkgJiYgdG1wID09IHBkZXYgJiYgYmFyLT50eXBlID09IFZQQ0lfQkFSX1JPTSkgKQ0KPiAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gICANCj4gLSAgICAgICAgICAgIHJjID0gcmFuZ2Vz
ZXRfcmVtb3ZlX3JhbmdlKG1lbSwgc3RhcnQsIGVuZCk7DQo+ICsgICAgICAgICAgICByYyA9IHJh
bmdlc2V0X3JlbW92ZV9yYW5nZShiYXItPm1lbSwgc3RhcnQsIGVuZCk7DQo+ICAgICAgICAgICAg
ICAgaWYgKCByYyApDQo+ICAgICAgICAgICAgICAgew0KPiAgICAgICAgICAgICAgICAgICBwcmlu
dGsoWEVOTE9HX0dfV0FSTklORyAiRmFpbGVkIHRvIHJlbW92ZSBbJWx4LCAlbHhdOiAlZFxuIiwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBlbmQsIHJjKTsNCj4gLSAgICAgICAg
ICAgICAgICByYW5nZXNldF9kZXN0cm95KG1lbSk7DQo+IC0gICAgICAgICAgICAgICAgcmV0dXJu
IHJjOw0KPiArICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4gICAgICAgICAgICAgICB9DQo+
ICAgICAgICAgICB9DQo+ICAgICAgIH0NCj4gQEAgLTMyNCwxMiArMzYyLDQyIEBAIHN0YXRpYyBp
bnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwg
Ym9vbCByb21fb25seSkNCj4gICAgICAgICAgICAqIHdpbGwgYWx3YXlzIGJlIHRvIGVzdGFibGlz
aCBtYXBwaW5ncyBhbmQgcHJvY2VzcyBhbGwgdGhlIEJBUnMuDQo+ICAgICAgICAgICAgKi8NCj4g
ICAgICAgICAgIEFTU0VSVCgoY21kICYgUENJX0NPTU1BTkRfTUVNT1JZKSAmJiAhcm9tX29ubHkp
Ow0KPiAtICAgICAgICByZXR1cm4gYXBwbHlfbWFwKHBkZXYtPmRvbWFpbiwgcGRldiwgbWVtLCBj
bWQpOw0KPiArICAgICAgICByZXR1cm4gYXBwbHlfbWFwKHBkZXYtPmRvbWFpbiwgcGRldiwgY21k
KTsNCj4gICAgICAgfQ0KPiAgIA0KPiAtICAgIGRlZmVyX21hcChkZXYtPmRvbWFpbiwgZGV2LCBt
ZW0sIGNtZCwgcm9tX29ubHkpOw0KPiArICAgIC8qIEZpbmQgb3V0IGhvdyBtYW55IG1lbW9yeSBy
YW5nZXMgaGFzIGxlZnQgYWZ0ZXIgTVNJIGFuZCBvdmVybGFwcy4gKi8NCj4gKyAgICBudW1fbWVt
X3JhbmdlcyA9IDA7DQo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhlYWRlci0+
YmFycyk7IGkrKyApDQo+ICsgICAgew0KPiArICAgICAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9
ICZoZWFkZXItPmJhcnNbaV07DQo+ICsNCj4gKyAgICAgICAgaWYgKCAhcmFuZ2VzZXRfaXNfZW1w
dHkoYmFyLT5tZW0pICkNCj4gKyAgICAgICAgICAgIG51bV9tZW1fcmFuZ2VzKys7DQo+ICsgICAg
fQ0KPiArDQo+ICsgICAgLyoNCj4gKyAgICAgKiBUaGVyZSBhcmUgY2FzZXMgd2hlbiBQQ0kgZGV2
aWNlLCByb290IHBvcnQgZm9yIGV4YW1wbGUsIGhhcyBuZWl0aGVyDQo+ICsgICAgICogbWVtb3J5
IHNwYWNlIG5vciBJTy4gSW4gdGhpcyBjYXNlIFBDSSBjb21tYW5kIHJlZ2lzdGVyIHdyaXRlIGlz
DQo+ICsgICAgICogbWlzc2VkIHJlc3VsdGluZyBpbiB0aGUgdW5kZXJseWluZyBQQ0kgZGV2aWNl
IG5vdCBmdW5jdGlvbmFsLCBzbzoNCj4gKyAgICAgKiAgIC0gaWYgdGhlcmUgYXJlIG5vIHJlZ2lv
bnMgd3JpdGUgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgbm93DQo+ICsgICAgICogICAtIGlmIHRoZXJl
IGFyZSByZWdpb25zIHRoZW4gZGVmZXIgd29yayBhbmQgd3JpdGUgbGF0ZXIgb24NCj4gKyAgICAg
Ki8NCj4gKyAgICBpZiAoICFudW1fbWVtX3JhbmdlcyApDQo+ICsgICAgICAgIHBjaV9jb25mX3dy
aXRlMTYocGRldi0+c2JkZiwgUENJX0NPTU1BTkQsIGNtZCk7DQo+ICsgICAgZWxzZQ0KPiArICAg
ICAgICBkZWZlcl9tYXAoZGV2LT5kb21haW4sIGRldiwgY21kLCByb21fb25seSwgbnVtX21lbV9y
YW5nZXMpOw0KPiAgIA0KPiAgICAgICByZXR1cm4gMDsNCj4gKw0KPiArZmFpbDoNCj4gKyAgICBm
b3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsrICkNCj4gKyAgICB7
DQo+ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4g
Kw0KPiArICAgICAgICByYW5nZXNldF9kZXN0cm95KGJhci0+bWVtKTsNCj4gKyAgICAgICAgYmFy
LT5tZW0gPSBOVUxMOw0KPiArICAgIH0NCj4gKyAgICByZXR1cm4gcmM7DQo+ICAgfQ0KPiAgIA0K
PiAgIHN0YXRpYyB2b2lkIGNtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5z
aWduZWQgaW50IHJlZywNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94
ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+IGluZGV4IGEwMzIwYjIyY2IzNi4uMzUyZTAyZDAxMDZk
IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmgNCj4gQEAgLTgwLDYgKzgwLDcgQEAgc3RydWN0IHZwY2kgew0KPiAgICAg
ICAgICAgICAgIC8qIEd1ZXN0IHZpZXcgb2YgdGhlIEJBUi4gKi8NCj4gICAgICAgICAgICAgICB1
aW50NjRfdCBndWVzdF9hZGRyOw0KPiAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpemU7DQo+ICsg
ICAgICAgICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbTsNCj4gICAgICAgICAgICAgICBlbnVtIHsN
Cj4gICAgICAgICAgICAgICAgICAgVlBDSV9CQVJfRU1QVFksDQo+ICAgICAgICAgICAgICAgICAg
IFZQQ0lfQkFSX0lPLA0KPiBAQCAtMTU0LDkgKzE1NSw5IEBAIHN0cnVjdCB2cGNpIHsNCj4gICAN
Cj4gICBzdHJ1Y3QgdnBjaV92Y3B1IHsNCj4gICAgICAgLyogUGVyLXZjcHUgc3RydWN0dXJlIHRv
IHN0b3JlIHN0YXRlIHdoaWxlIHt1bn1tYXBwaW5nIG9mIFBDSSBCQVJzLiAqLw0KPiAtICAgIHN0
cnVjdCByYW5nZXNldCAqbWVtOw0KPiAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4gICAg
ICAgdWludDE2X3QgY21kOw0KPiArICAgIHVpbnQ4X3QgbnVtX21lbV9yYW5nZXM7DQo+ICAgICAg
IGJvb2wgcm9tX29ubHkgOiAxOw0KPiAgIH07DQo+ICAgDQo=

