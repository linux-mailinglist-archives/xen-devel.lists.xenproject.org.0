Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A47443D50
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 07:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220559.381874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi9qu-0003BC-97; Wed, 03 Nov 2021 06:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220559.381874; Wed, 03 Nov 2021 06:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi9qu-00037k-55; Wed, 03 Nov 2021 06:34:28 +0000
Received: by outflank-mailman (input) for mailman id 220559;
 Wed, 03 Nov 2021 06:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mi9qs-00037e-AN
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 06:34:26 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a03a0fb-be1f-4570-aefb-5c7e1db53352;
 Wed, 03 Nov 2021 06:34:23 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A36Q8s1013113;
 Wed, 3 Nov 2021 06:34:20 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3mkur449-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 06:34:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2830.eurprd03.prod.outlook.com (2603:10a6:800:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 06:34:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 06:34:16 +0000
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
X-Inumbo-ID: 2a03a0fb-be1f-4570-aefb-5c7e1db53352
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyYikAWaNKPZxR6JjYTlZeS2ZCJRNv/IE+PJSEZan0EbaQZCBRvuoZU9ZwOCIMHQxlxmjHzGLQPKpmLWK5/7pdG+DqoGOtChrLASKxV1RkGhxb5ddJfUzyzowH8slTsQhOFKXPE90eQhz7vnwqnOvRu+yq1XT+pmf97VNV/51RuzfnAWaKN5wc1ixYmOFBGcRd7KtFXFXsmH8N37M8UieC2hTJh4JmyfVf6FGaHhYZ2p97cxROvGS9jHrWflYx1Lww0JOuAU9xcnKq8fhG5+pKfKm7l0r1oKpvI9gQdrNKuPM9bUlGONkcrPhM3Yz8lWuSuLMsn57Zi/6y5ZluB50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynkvLhIqhVruIaSahRTCy0rHrzfCELgp+eqrKqUhu3A=;
 b=A5/iH+XF08I7u3X7qIjfLESLcZPVs2DolN0BfA1BDIHQaTuZ3LiLx376OikoX89UnF1Y91sqK6c6QLxdrxueIXO/dLiReXnTGzKHe4x1GmuxmL4DNJ+g3hChYdAYgjpINEX6fqal6pg8IGeQ8gdoDSCx+5W+912veTE5tBWGZl8nCAPfqlK+3v/+GDlsvCZpRHofwcKZns5NvagpiQ88n0M2pV13pZDAX6EIYet8os0XcNriz0D8UsXV5Q2WtnjFyUnoU3zbUJNUL2vbCcM/w6r0HseCRcy/wi0zOIj3lXwjTuAyTwyGiX0MmkscQgodHI9R3jO74epgi04jeR8owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynkvLhIqhVruIaSahRTCy0rHrzfCELgp+eqrKqUhu3A=;
 b=SBxPp7tIqeYfsjjBO0RliF98j5WwSAhtHmzEVMKnHs6hYTDmgsRfBczZuPIbFdJwrdHn6i86i0gDy+/9JC/St5724g/v9RgmPthbBaiHQ/MifAp+ml4vSZtngc4KHbkCayW3aimBa6pF8kLqyP/2BFoMGYiKdpcEz7FXgZXytGF890kZGkkMmsgDuEh5+rPJYFfIPRqePwsKxypMThYBHc8pjeX3WSOB6jgorq98GYChgVlZZOw9/upwCXoI04OSzfuMasPu2H8/T3zx/RzIHFcK0xiLY9af33DHokjamv4XH09ACZCOOZsJk8U2bVf/ui6B5eyKpfmdFmd3gzd2mQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: AQHXtdAlOCu2AnkIOUC4Prsocox3sqvlTvCAgAw/FQA=
Date: Wed, 3 Nov 2021 06:34:16 +0000
Message-ID: <52b1533d-4aeb-29be-2611-9b50adea3f73@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
 <YXfng3PqDI6C4yxn@MacBook-Air-de-Roger.local>
In-Reply-To: <YXfng3PqDI6C4yxn@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bb9065d-0f0d-43b0-2a88-08d99e93f590
x-ms-traffictypediagnostic: VI1PR0302MB2830:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2830E6A8B6E2E35F779A29D4E78C9@VI1PR0302MB2830.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jNZJGqaG5weMLaYzegXHMZYhcPHZsNjH+duGs1SaFroAjOaMjzLVOaB2NX62Lm7xaaYikwab0UKpeLNlUyGw1H80We5e+tvvXQ7TSLJ4j5WExvV7erc24V7YHxdGn2g6O4iqd021iJF0h1/dMR1haT7OaCdqpLVvgQdr7jNqua+WB/BDetTZ+fjiw9oURhm2rntcl5/ool0D/kzINWHIlUmcYWYwmSEUMg0f62VVaE3yaw8gsmMwAiyN8GwduHK6bLXCRyD/DbyCfFl9O+SJIjmeIGtKclQaUk5Ck/3KobUnsvx/KgMgJrQFSRLQvOwc770wmB+oGWwU1v3hRS5CHFVxGeeeSb9tZQTFgfoHzkNWWD8NT4xvZ5L1zDgmA8zH/bSPjNXBZyQB2g7ANRfOT3zdQJsFsj94pYYR+6hzMqm7wwNJWDaYjlgFMWMp3re/Vz1O0oHIgH4gMFsWTKFZojd0RptxBKJAd2QBifSDUjFxxEiEGTyhkySkayQmYLqUn87t9Dp01z0456VLS3E1LXjmHINdAP+PoBwsg9e562rtc1ku6yd5dOMFJRym4+s21iuJB02eqNGDCjigkCKmxdrlqdzzn6VmGy2L4AK/5Ts6s8jlRvoYSCC1ojBYqRRtBhPWU/SKPlpSEhBoowNknnlH/Jbrrd4xq3rKtlW9OskGnwyXyUZAN/e+O/kswIPFcmpZu4RddsT/vg/+PRF63A2X8zahuc/q4ZQCRlhAoQNYN27UALd8ww15ObyjaNXc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(186003)(66446008)(66476007)(66556008)(38100700002)(26005)(5660300002)(6506007)(53546011)(31696002)(83380400001)(66946007)(36756003)(122000001)(38070700005)(64756008)(71200400001)(2616005)(54906003)(508600001)(31686004)(76116006)(110136005)(4326008)(91956017)(8676002)(107886003)(2906002)(8936002)(6486002)(316002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bmtrTW9acWkxK0czL0lncmViNWZSRFA4dGNrcWpNOWZjVDNRSU1JcGgxQXZY?=
 =?utf-8?B?SnU3QlFEa2JteEo2OHZCRHhHOFUxaVlLQXVqN0g0MWtWbXFHU0dpMUlnbUhi?=
 =?utf-8?B?eGlVUWtPa0VFUGRmT3piekxmWk9YN0RtaEFvalVqMFYvWG13YmdUWU11VEMw?=
 =?utf-8?B?aHVjK3ZOZlphK1UzQ3RRODU2WTNtYnUxUDN4bFV4ZE4xU0p6M001WU9qTUVv?=
 =?utf-8?B?aUk2NEZVWmVCRTRKVU9vK2xTNXczTTdBU2dxaEE1anZJNVh3ZzRkN2R5cjNn?=
 =?utf-8?B?YTBTcTBMVlNDVS9yZ2U3ODNKOTRjT29kdE5lbllQUVN2SUJDT05lMlZueDcv?=
 =?utf-8?B?TysrbW5JUGQrMHRwWjVybzVmSFpjSkhGQ2tydVJXcmEwWi8xY0laZFhwQkhj?=
 =?utf-8?B?c0drTXVEUWFpT3RqaTdqVFYxMkRrMEdtdkRFZDA1ajkvUFpLUXord0ZSZlpP?=
 =?utf-8?B?eUxzWEtYSVk3d3MyUUVCUWNpajVtSk9CY0ZNSFl6eWFwS0hTSGNkTHBWWk93?=
 =?utf-8?B?V01QWUFYSlhPeDNCK3pzQWF4N1QyQ0hlaG1qV3cwZlFxQjBTOGNBaHRMVlMy?=
 =?utf-8?B?Vkt1TW1kM0E4ZjZkQ0M0NG5qemZFblc2cTNXY0pJcWpxblp6NnhSUi9wczRt?=
 =?utf-8?B?QlV5YTRlQ2lwUEp2cnBHY24zc1BUSzVvdzRwd21mbmpaNlQwZjFPS2F1Z3Fq?=
 =?utf-8?B?M3M3ekM0SFV2bThMaXNqWkZoNlpCV2gvSmM4cWYrV2V1TmpwWEROWERyYkNS?=
 =?utf-8?B?RmdScC9RL1NiaGNTV0tZVEMwZmQ2Sk1GS08yTEpXOFh2Q1hwZGJMYnFQNkhm?=
 =?utf-8?B?WnYxUHZEWVRFSDMzb0hWTnk1OEw0SGp4aWpPVVQ0TXVuQVRJeEdIZENzdUhl?=
 =?utf-8?B?WEVZTjJWYldrNjRuWUVnK2xzNEg3ZzQwM05EUk16OGJCWWxVYlBzT052VzlR?=
 =?utf-8?B?TXpVVWhqbFZ0azZlK2lxMWZFMmEvZWo1dVhRbEtTSStVdjdNa0IxaTFVWlcv?=
 =?utf-8?B?bGdjbjUxcW5mTEdwN3I3d3VTME9zdFhML2hUWTFVTCtLK2ZnbW5XSG1yZVZa?=
 =?utf-8?B?RW83c0tIYzZjc2ZLVit3VVd1L2FSYTVGNmFJRjc4UFdGUnA1Tmt2c0ZkV2p3?=
 =?utf-8?B?dUltR0hzOEFYZWI5V25XTDJObExvRC80VTgzL2hKQW9JeUhjSjZUQkgyaXYz?=
 =?utf-8?B?ZVQ0Q0NtanJpVmR5VlRpN1ZqRk9paFBFS0xXQkFhd2RBMlE3dnRiQUxneFFQ?=
 =?utf-8?B?T0sxVmx1NlBKOEtQbm93Zmw0TWxCTFlZTTJzb2V4MW01Zmw5eEpZQlNJbjZN?=
 =?utf-8?B?VmhDdkZlMjc5dmw0WXNvemxoQXB2T3FRZVFGbkFtMndrQjJsU1dxZ0FoL1Zu?=
 =?utf-8?B?RWVhMUpONm1oeDZTaTRRQ0lPWXFuREJzVGYvUmFGdzRWaU13TWcvbGVzYjhO?=
 =?utf-8?B?dDRyME5SdW1UTmFudGxOWkhwTitJY2QwaFc4SjZyd01WMzNUZTV3WHdzckRh?=
 =?utf-8?B?czF5cDJqb2N0NFpSY1B4emdwbWN0enY5ZG9NQ0lwcjBnamtRU0kxREhpTTNG?=
 =?utf-8?B?dVcvTkhrdzdDQUhsOWhPaDMybDBPSWw4RnllaG5sZ1dZS1Uvb3N6NStSVlpT?=
 =?utf-8?B?L1h0dldVamJwMzM2dWk0TlJ5YWE2SGFVTGFPdXY5b1dIVE5YdVVsam9YV3FT?=
 =?utf-8?B?RDV4UTZCdW5SNmJkSUtJK01UVU01a1pSSkxtdG8wbGhSUndhVmY1Y1cwcjdE?=
 =?utf-8?B?ajM0cnRIU3BtVnJuNFZ6RFhtSjFldElaVjhFYzN1ZGVxbTZEbTN3dGZldncw?=
 =?utf-8?B?c3VlTi81U0QyTTZvcW9YMXByUUhsdmZIeERDRlNXdlZVZis1SWlOTGJ1M0xC?=
 =?utf-8?B?WHkyOTRIUy9kWG5VbisrWFhYa0sranJZSmh5OWhXenQwN3JHZm5zcGZuRFBE?=
 =?utf-8?B?SHpVamRtMzVtQmdrWlFkT0w4TWFMTXgxWVRqOGxidXo5NHE5Ym56YWtrbzdl?=
 =?utf-8?B?OVdhUEd1azFySkkyNXg3ZFhuQjNTKzZGdTd5RjZpL0s2TnFWWHltWExNRDJy?=
 =?utf-8?B?Ull2YTUwejJaSDRkVjgrai9XdFVwejFuYzNFdmp1SzJvM1liMDI0TVFJMXdK?=
 =?utf-8?B?VkRDaC9pUUFrVlpSM0I5akI2c0J0clczM3dzWk00aVpZaWRwRmNnTUVvQk41?=
 =?utf-8?B?QXdwc2Q0WEdNOHdpNlVtZkltVkVyQTJmVFUzYTlWd3lkVkFXNjdlMHc0YVBt?=
 =?utf-8?B?eHkxTWwzNkVTMERMa1VNdTdROHRnSWpuUzZmMVIrYTZCSUhHd2hxc1plSURl?=
 =?utf-8?B?TDI5QU4vZnJLcC9FdEQ0eGgxcThFL2o2UzIxWUV3N1hSNkpoRlhRdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45285D08B550A141B6FE80095BAEB64A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb9065d-0f0d-43b0-2a88-08d99e93f590
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 06:34:16.6186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DAZoqpHz/eoRYKyIsem88gHXd8SGB9hLmegtEUNZ6bN+KL2jnTsl50BU12G13I9yDDGrfhFEQSd/5WpCjrpq8DUKKYPE3vzX7/nafphWGVCseZVY+/cNAx35YwxdLJtg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2830
X-Proofpoint-ORIG-GUID: M-aj8_qA1Q-M_mSbxXhS53CYd0uO1j8Z
X-Proofpoint-GUID: M-aj8_qA1Q-M_mSbxXhS53CYd0uO1j8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_01,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030040

SGksIFJvZ2VyDQoNCk9uIDI2LjEwLjIxIDE0OjMzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
PiBPbiBUaHUsIFNlcCAzMCwgMjAyMSBhdCAxMDo1MjoyMkFNICswMzAwLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBBc3NpZ24gU0JERiB0byB0aGUg
UENJIGRldmljZXMgYmVpbmcgcGFzc2VkIHRocm91Z2ggd2l0aCBidXMgMC4NCj4+IFRoZSByZXN1
bHRpbmcgdG9wb2xvZ3kgaXMgd2hlcmUgUENJZSBkZXZpY2VzIHJlc2lkZSBvbiB0aGUgYnVzIDAg
b2YgdGhlDQo+PiByb290IGNvbXBsZXggaXRzZWxmIChlbWJlZGRlZCBlbmRwb2ludHMpLg0KPj4g
VGhpcyBpbXBsZW1lbnRhdGlvbiBpcyBsaW1pdGVkIHRvIDMyIGRldmljZXMgd2hpY2ggYXJlIGFs
bG93ZWQgb24NCj4+IGEgc2luZ2xlIFBDSSBidXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0K
Pj4NCj4+IC0tLQ0KPj4gU2luY2UgdjI6DQo+PiAgIC0gcmVtb3ZlIGNhc3RzIHRoYXQgYXJlIChh
KSBtYWxmb3JtZWQgYW5kIChiKSB1bm5lY2Vzc2FyeQ0KPj4gICAtIGFkZCBuZXcgbGluZSBmb3Ig
YmV0dGVyIHJlYWRhYmlsaXR5DQo+PiAgIC0gcmVtb3ZlIENPTkZJR19IQVNfVlBDSV9HVUVTVF9T
VVBQT1JUIGlmZGVmJ3MgYXMgdGhlIHJlbGV2YW50IHZQQ0kNCj4+ICAgICAgZnVuY3Rpb25zIGFy
ZSBub3cgY29tcGxldGVseSBnYXRlZCB3aXRoIHRoaXMgY29uZmlnDQo+PiAgIC0gZ2F0ZSBjb21t
b24gY29kZSB3aXRoIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiBOZXcgaW4gdjIN
Cj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICB8ICAzICsrDQo+PiAg
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgNjAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAgfCAxNCAr
KysrKysrLQ0KPj4gICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICB8IDIyICsrKysrKysr
KysrKysNCj4+ICAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgfCAgOCArKysrKw0KPj4g
ICA1IGZpbGVzIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5j
DQo+PiBpbmRleCA0MGQ2N2VjMzQyMzIuLmUwMTcwMDg3NjEyZCAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9jb21tb24vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4+IEBAIC02
MDEsNiArNjAxLDkgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlk
LA0KPj4gICANCj4+ICAgI2lmZGVmIENPTkZJR19IQVNfUENJDQo+PiAgICAgICBJTklUX0xJU1Rf
SEVBRCgmZC0+cGRldl9saXN0KTsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NV
UFBPUlQNCj4+ICsgICAgSU5JVF9MSVNUX0hFQUQoJmQtPnZkZXZfbGlzdCk7DQo+PiArI2VuZGlm
DQo+PiAgICNlbmRpZg0KPj4gICANCj4+ICAgICAgIC8qIEFsbCBlcnJvciBwYXRocyBjYW4gZGVw
ZW5kIG9uIHRoZSBhYm92ZSBzZXR1cC4gKi8NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBpbmRl
eCA4MDVhYjg2ZWQ1NTUuLjViOTYzZDc1ZDFiYSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Yw0KPj4gQEAgLTgzMSw2ICs4MzEsNjYgQEAgaW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcs
IHU4IGJ1cywgdTggZGV2Zm4pDQo+PiAgICAgICByZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiAgIA0K
Pj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4gK3N0YXRpYyBzdHJ1
Y3QgdnBjaV9kZXYgKnBjaV9maW5kX3ZpcnR1YWxfZGV2aWNlKGNvbnN0IHN0cnVjdCBkb21haW4g
KmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9k
ZXYgKnZkZXY7DQo+PiArDQo+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCB2ZGV2LCAmZC0+
dmRldl9saXN0LCBsaXN0ICkNCj4+ICsgICAgICAgIGlmICggdmRldi0+cGRldiA9PSBwZGV2ICkN
Cj4+ICsgICAgICAgICAgICByZXR1cm4gdmRldjsNCj4+ICsgICAgcmV0dXJuIE5VTEw7DQo+PiAr
fQ0KPj4gKw0KPj4gK2ludCBwY2lfYWRkX3ZpcnR1YWxfZGV2aWNlKHN0cnVjdCBkb21haW4gKmQs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHZwY2lf
ZGV2ICp2ZGV2Ow0KPj4gKw0KPj4gKyAgICBBU1NFUlQoIXBjaV9maW5kX3ZpcnR1YWxfZGV2aWNl
KGQsIHBkZXYpKTsNCj4+ICsNCj4+ICsgICAgLyogRWFjaCBQQ0kgYnVzIHN1cHBvcnRzIDMyIGRl
dmljZXMvc2xvdHMgYXQgbWF4LiAqLw0KPj4gKyAgICBpZiAoIGQtPnZwY2lfZGV2X25leHQgPiAz
MSApDQo+PiArICAgICAgICByZXR1cm4gLUVOT1NQQzsNCj4+ICsNCj4+ICsgICAgdmRldiA9IHh6
YWxsb2Moc3RydWN0IHZwY2lfZGV2KTsNCj4+ICsgICAgaWYgKCAhdmRldiApDQo+PiArICAgICAg
ICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsgICAgLyogV2UgZW11bGF0ZSBhIHNpbmdsZSBo
b3N0IGJyaWRnZSBmb3IgdGhlIGd1ZXN0LCBzbyBzZWdtZW50IGlzIGFsd2F5cyAwLiAqLw0KPj4g
KyAgICB2ZGV2LT5zZWcgPSAwOw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBUaGUgYnVz
IG51bWJlciBpcyBzZXQgdG8gMCwgc28gdmlydHVhbCBkZXZpY2VzIGFyZSBzZWVuDQo+PiArICAg
ICAqIGFzIGVtYmVkZGVkIGVuZHBvaW50cyBiZWhpbmQgdGhlIHJvb3QgY29tcGxleC4NCj4+ICsg
ICAgICovDQo+PiArICAgIHZkZXYtPmJ1cyA9IDA7DQo+PiArICAgIHZkZXYtPmRldmZuID0gUENJ
X0RFVkZOKGQtPnZwY2lfZGV2X25leHQrKywgMCk7DQo+IFRoaXMgd291bGQgbGlrZWx5IGJlIGJl
dHRlciBhcyBhIGJpdG1hcCB3aGVyZSB5b3Ugc2V0IHRoZSBiaXRzIG9mDQo+IGluLXVzZSBzbG90
cy4gVGhlbiB5b3UgY2FuIHVzZSBmaW5kX2ZpcnN0X2JpdCBvciBzaW1pbGFyIHRvIGdldCBhIGZy
ZWUNCj4gc2xvdC4NCj4NCj4gTG9uZyB0ZXJtIHlvdSBtaWdodCB3YW50IHRvIGFsbG93IHRoZSBj
YWxsZXIgdG8gcHJvdmlkZSBhIHByZS1zZWxlY3RlZA0KPiBzbG90LCBhcyBpdCdzIHBvc3NpYmxl
IGZvciB1c2VycyB0byByZXF1ZXN0IHRoZSBkZXZpY2UgdG8gYXBwZWFyIGF0IGENCj4gc3BlY2lm
aWMgc2xvdCBvbiB0aGUgZW11bGF0ZWQgYnVzLg0KPg0KPj4gKw0KPj4gKyAgICB2ZGV2LT5wZGV2
ID0gcGRldjsNCj4+ICsgICAgdmRldi0+ZG9tYWluID0gZDsNCj4+ICsNCj4+ICsgICAgcGNpZGV2
c19sb2NrKCk7DQo+PiArICAgIGxpc3RfYWRkX3RhaWwoJnZkZXYtPmxpc3QsICZkLT52ZGV2X2xp
c3QpOw0KPj4gKyAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gMDsN
Cj4+ICt9DQo+PiArDQo+PiAraW50IHBjaV9yZW1vdmVfdmlydHVhbF9kZXZpY2Uoc3RydWN0IGRv
bWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBzdHJ1
Y3QgdnBjaV9kZXYgKnZkZXY7DQo+PiArDQo+PiArICAgIHBjaWRldnNfbG9jaygpOw0KPj4gKyAg
ICB2ZGV2ID0gcGNpX2ZpbmRfdmlydHVhbF9kZXZpY2UoZCwgcGRldik7DQo+PiArICAgIGlmICgg
dmRldiApDQo+PiArICAgICAgICBsaXN0X2RlbCgmdmRldi0+bGlzdCk7DQo+PiArICAgIHBjaWRl
dnNfdW5sb2NrKCk7DQo+PiArICAgIHhmcmVlKHZkZXYpOw0KPj4gKyAgICByZXR1cm4gMDsNCj4+
ICt9DQo+PiArI2VuZGlmIC8qIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUICovDQo+PiAr
DQo+PiAgIC8qIENhbGxlciBzaG91bGQgaG9sZCB0aGUgcGNpZGV2c19sb2NrICovDQo+PiAgIHN0
YXRpYyBpbnQgZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90IHNlZywg
dWludDhfdCBidXMsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgZGV2
Zm4pDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgYi94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYw0KPj4gaW5kZXggNzAyZjdiNWQ1ZGRhLi5kNzg3ZjEzZTY3OWUgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMNCj4+IEBAIC05MSwyMCArOTEsMzIgQEAgaW50IF9faHdkb21faW5pdCB2cGNp
X2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgLyogTm90aWZ5IHZQQ0kg
dGhhdCBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+PiAgIGludCB2cGNpX2Fzc2ln
bl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKmRldikNCj4+
ICAgew0KPj4gKyAgICBpbnQgcmM7DQo+PiArDQo+PiAgICAgICAvKiBJdCBvbmx5IG1ha2VzIHNl
bnNlIHRvIGFzc2lnbiBmb3IgaHdkb20gb3IgZ3Vlc3QgZG9tYWluLiAqLw0KPj4gICAgICAgaWYg
KCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNfdnBjaShkKSApDQo+PiAgICAgICAgICAgcmV0
dXJuIDA7DQo+PiAgIA0KPj4gLSAgICByZXR1cm4gdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGQsIGRl
dik7DQo+PiArICAgIHJjID0gdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGQsIGRldik7DQo+PiArICAg
IGlmICggcmMgKQ0KPj4gKyAgICAgICAgcmV0dXJuIHJjOw0KPj4gKw0KPj4gKyAgICByZXR1cm4g
cGNpX2FkZF92aXJ0dWFsX2RldmljZShkLCBkZXYpOw0KPj4gICB9DQo+PiAgIA0KPj4gICAvKiBO
b3RpZnkgdlBDSSB0aGF0IGRldmljZSBpcyBkZS1hc3NpZ25lZCBmcm9tIGd1ZXN0LiAqLw0KPj4g
ICBpbnQgdnBjaV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0
IHBjaV9kZXYgKmRldikNCj4+ICAgew0KPj4gKyAgICBpbnQgcmM7DQo+PiArDQo+PiAgICAgICAv
KiBJdCBvbmx5IG1ha2VzIHNlbnNlIHRvIGRlLWFzc2lnbiBmcm9tIGh3ZG9tIG9yIGd1ZXN0IGRv
bWFpbi4gKi8NCj4+ICAgICAgIGlmICggaXNfc3lzdGVtX2RvbWFpbihkKSB8fCAhaGFzX3ZwY2ko
ZCkgKQ0KPj4gICAgICAgICAgIHJldHVybiAwOw0KPj4gICANCj4+ICsgICAgcmMgPSBwY2lfcmVt
b3ZlX3ZpcnR1YWxfZGV2aWNlKGQsIGRldik7DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAg
ICAgcmV0dXJuIHJjOw0KPj4gKw0KPj4gICAgICAgcmV0dXJuIHZwY2lfYmFyX3JlbW92ZV9oYW5k
bGVycyhkLCBkZXYpOw0KPj4gICB9DQo+PiAgICNlbmRpZiAvKiBDT05GSUdfSEFTX1ZQQ0lfR1VF
U1RfU1VQUE9SVCAqLw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaCBiL3hl
bi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4gaW5kZXggNDNiOGEwODE3MDc2Li4zMzAzM2EzYThmOGQg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaA0KPj4gQEAgLTEzNyw2ICsxMzcsMjQgQEAgc3RydWN0IHBjaV9kZXYgew0K
Pj4gICAgICAgc3RydWN0IHZwY2kgKnZwY2k7DQo+PiAgIH07DQo+PiAgIA0KPj4gKyNpZmRlZiBD
T05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4gK3N0cnVjdCB2cGNpX2RldiB7DQo+PiAr
ICAgIHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4+ICsgICAgLyogUGh5c2ljYWwgUENJIGRldmlj
ZSB0aGlzIHZpcnR1YWwgZGV2aWNlIGlzIGNvbm5lY3RlZCB0by4gKi8NCj4+ICsgICAgY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+PiArICAgIC8qIFZpcnR1YWwgU0JERiBvZiB0aGUgZGV2
aWNlLiAqLw0KPj4gKyAgICB1bmlvbiB7DQo+PiArICAgICAgICBzdHJ1Y3Qgew0KPj4gKyAgICAg
ICAgICAgIHVpbnQ4X3QgZGV2Zm47DQo+PiArICAgICAgICAgICAgdWludDhfdCBidXM7DQo+PiAr
ICAgICAgICAgICAgdWludDE2X3Qgc2VnOw0KPj4gKyAgICAgICAgfTsNCj4+ICsgICAgICAgIHBj
aV9zYmRmX3Qgc2JkZjsNCj4+ICsgICAgfTsNCj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZG9tYWlu
Ow0KPj4gK307DQo+PiArI2VuZGlmDQo+IEkgd29uZGVyIHdoZXRoZXIgdGhpcyBpcyBzdHJpY3Rs
eSBuZWVkZWQuIFdvbid0IGl0IGJlIGVub3VnaCB0byBzdG9yZQ0KPiB0aGUgdmlydHVhbCAoaWU6
IGd1ZXN0KSBzYmRmIGluc2lkZSB0aGUgZXhpc3RpbmcgdnBjaSBzdHJ1Y3Q/DQo+DQo+IEl0IHdv
dWxkIGF2b2lkIHRoZSBvdmVyaGVhZCBvZiB0aGUgdHJhbnNsYXRpb24geW91IGRvIGZyb20gcGRl
diAtPg0KPiB2ZGV2LCBhbmQgdGhlcmUgZG9lc24ndCBzZWVtIHRvIGJlIGFueXRoaW5nIHJlbGV2
YW50IHN0b3JlZCBpbg0KPiB2cGNpX2RldiBhcGFydCBmcm9tIHRoZSB2aXJ0dWFsIHNiZGYuDQpU
TDtEUiBJdCBzZWVtcyBpdCBtaWdodCBiZSBuZWVkZWQgZnJvbSBwZXJmb3JtYW5jZSBQT1YuIElm
IG5vdCBpbXBsZW1lbnRlZA0KZm9yIGV2ZXJ5IE1NSU8gdHJhcCB3ZSB1c2UgYSBnbG9iYWwgUENJ
IGxvY2ssIGUuZy4gcGNpZGV2c197bG9ja3x1bmxvY2t9Lg0KTm90ZTogcGNpZGV2cycgbG9jayBp
cyBhIHJlY3Vyc2l2ZSBsb2NrDQoNClRoZXJlIGFyZSAyIHNvdXJjZXMgb2YgYWNjZXNzIHRvIHZp
cnR1YWwgZGV2aWNlczoNCjEuIER1cmluZyBpbml0aWFsaXphdGlvbiB3aGVuIHdlIGFkZCwgYXNz
aWduIG9yIGRlLWFzc2lnbiBhIFBDSSBkZXZpY2UNCjIuIEF0IHJ1bi10aW1lIHdoZW4gd2UgdHJh
cCBjb25maWd1cmF0aW9uIHNwYWNlIGFjY2VzcyBhbmQgbmVlZCB0bw0KdHJhbnNsYXRlIHZpcnR1
YWwgU0JERiBpbnRvIHBoeXNpY2FsIFNCREYNCjMuIEF0IGxlYXN0IGRlLWFzc2lnbiBjYW4gcnVu
IGNvbmN1cnJlbnRseSB3aXRoIE1NSU8gaGFuZGxlcnMNCg0KTm93IGxldCdzIHNlZSB3aGljaCBs
b2NrcyBhcmUgaW4gdXNlIHdoaWxlIGRvaW5nIHRoYXQuDQoNCjEuIE5vIHN0cnVjdCB2cGNpX2Rl
diBpcyB1c2VkLg0KMS4xLiBXZSByZW1vdmUgdGhlIHN0cnVjdHVyZSBhbmQganVzdCBhZGQgcGRl
di0+dnBjaS0+Z3Vlc3Rfc2JkZiBhcyB5b3Ugc3VnZ2VzdA0KMS4yLiBUbyBwcm90ZWN0IHZpcnR1
YWwgZGV2aWNlcyB3ZSB1c2UgcGNpZGV2c197bG9ja3x1bmxvY2t9DQoxLjMuIExvY2tpbmcgaGFw
cGVucyBvbiBzeXN0ZW0gbGV2ZWwNCg0KMi4gc3RydWN0IHZwY2lfZGV2IGlzIHVzZWQNCjIuMS4g
V2UgaGF2ZSBhIHBlci1kb21haW4gbG9jayB2ZGV2X2xvY2sNCjIuMi4gTG9ja2luZyBoYXBwZW5z
IG9uIHBlciBkb21haW4gbGV2ZWwNCg0KVG8gY29tcGFyZSB0aGUgdHdvOg0KDQoxLiBXaXRob3V0
IHZwY2lfZGV2DQpwcm9zOiBtdWNoIHNpbXBsZXIgY29kZQ0KcHJvcy9jb25zOiBnbG9iYWwgbG9j
ayBpcyB1c2VkIGR1cmluZyBNTUlPIGhhbmRsaW5nLCBidXQgaXQgaXMgYSByZWN1cnNpdmUgbG9j
aw0KDQoyLiBXaXRoIHZwY19kZXYNCnByb3M6IHBlci1kb21haW4gbG9ja2luZw0KY29uczogbW9y
ZSBjb2RlDQoNCkkgaGF2ZSBpbXBsZW1lbnRlZCB0aGUgdHdvIG1ldGhvZHMgYW5kIHdlIG5lZWQg
dG8gZGVjaWRlDQp3aGljaCByb3V0ZSB3ZSBnby4NCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlv
dSwNCk9sZWtzYW5kcg==

