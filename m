Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34420B499
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:33:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joqLb-0006VL-C3; Fri, 26 Jun 2020 15:32:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1joqLa-0006V2-8x
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:32:58 +0000
X-Inumbo-ID: 4d41e4ee-b7c2-11ea-bb8b-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d41e4ee-b7c2-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mj838u9ouUx0Gl/m9ATFQDzRi6gcd/SQw8RLH6xw2U=;
 b=WbNorJr5LRjfG7mYpQK5L4JDt2oqndO8v7zRPhDXWe++Ev4FTZvmPlnpbFfawdL6B1hjI5dyaQhHVGiWNAkMgOzjEoMqt7a1xtgUEoYwufTkIAS3HHhZ1k+TrS+LB/ijinWlEZIlRGsuMFqd348EI8L5mNt3YdVKLG07g4vPL84=
Received: from DB3PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:8::33) by
 DB6PR0801MB2008.eurprd08.prod.outlook.com (2603:10a6:4:77::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21; Fri, 26 Jun 2020 15:32:52 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::3a) by DB3PR08CA0020.outlook.office365.com
 (2603:10a6:8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Fri, 26 Jun 2020 15:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:32:52 +0000
Received: ("Tessian outbound 1e00bf306733:v60");
 Fri, 26 Jun 2020 15:32:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e4ac0d027b81c41
X-CR-MTA-TID: 64aa7808
Received: from 5779f0dc0236.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CA2335C-68CC-4D9E-A275-FBACBC9EB87B.1; 
 Fri, 26 Jun 2020 15:32:47 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5779f0dc0236.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Jun 2020 15:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+AyDN8GdwN8/e2yb0KntjUfxJkjzn7tl00eeIrkPK/EJn48IdcUO6oooMWLL+YBT+77jp5M/IJMxVTXEBuUd4ZMSu1e+5o50HStmhG8YNuDmBVGmz2rgN1Jq95xB5IjLt6vVatno8vEqk8g83LQ2aer1Hy/2Xrh7oIxIKFIfWYxOLNmV3fYXGKmKNgtMpaHp2u62pMAyO//2sD5f3a+0me7ez0DCZM2LL1so39Qmad1OLaGI6DTFr6n2zwIZMJ7Bjfpk0LsbC5hy4Xn0Fwr8zulVdgjtG0RIbX4yznL+x8XEavJG7Z6IN3Wc6CoW1ncFChIYq2bIhYh/kXsZ8up3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mj838u9ouUx0Gl/m9ATFQDzRi6gcd/SQw8RLH6xw2U=;
 b=U+00w6qcfyqms4uXPoOWzWcy1aj0GIN8DAQrAkYwtHWgz/pqwcmBP4I4NpX+5rkC4eFS/SN1Eo3jzJ0N7B5bd4ruaHtQh08pDz+BNY1HjZ7bVWjF40tD614s284YAIiNK+h1fcjR7BO6Ml1BtRii8GKl8dxbcKilCAFPzQguDd/GpI9M2nu4xdymXMVTu7HDaekw7c4m4MBRACt+pI+zstRm39aQ2n0/2/NBOexmLXRDZToZDJ+OVh7ZKKoImqyaNjaoGsp0YcDB0AidrXzLVhrAVcMWCsEgS9oQjWF9SU8Eu8EPxhi+2d+HzRu7Is5BUaiVw9YGVMwojEw8XGJ47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mj838u9ouUx0Gl/m9ATFQDzRi6gcd/SQw8RLH6xw2U=;
 b=WbNorJr5LRjfG7mYpQK5L4JDt2oqndO8v7zRPhDXWe++Ev4FTZvmPlnpbFfawdL6B1hjI5dyaQhHVGiWNAkMgOzjEoMqt7a1xtgUEoYwufTkIAS3HHhZ1k+TrS+LB/ijinWlEZIlRGsuMFqd348EI8L5mNt3YdVKLG07g4vPL84=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1798.eurprd08.prod.outlook.com (2603:10a6:4:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 26 Jun
 2020 15:32:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3131.023; Fri, 26 Jun 2020
 15:32:44 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] build: tweak variable exporting for make 3.82
Thread-Topic: [PATCH] build: tweak variable exporting for make 3.82
Thread-Index: AQHWS8ssTlAGR1rYpUSLc7qQddQ2bajrBnwA
Date: Fri, 26 Jun 2020 15:32:44 +0000
Message-ID: <7736F1FB-A564-419A-9F49-8860502C5A2A@arm.com>
References: <0677fe2a-9ea1-7b3c-e212-4a2478537459@suse.com>
In-Reply-To: <0677fe2a-9ea1-7b3c-e212-4a2478537459@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6acf955d-b15c-49b8-790c-08d819e630be
x-ms-traffictypediagnostic: DB6PR0801MB1798:|DB6PR0801MB2008:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB20082FCF4556DCA2453EDCE79D930@DB6PR0801MB2008.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jlzQ2NVkD2MJhqiqbaUm4Mtsn2lSU3WeabJ48aajCURQOfb0Qd3Jyh9ZV7VGffW8xRXlyRbof6KAx1c+f1aeKiNfSmXQtBl5J5Hv9HoFJ2jqZW0jdaYHQT3rS09jvhMlrzc2aKkuecJ1vZiZAMl0j5soLbLUmXRbzxJVYi8bVNucvM6TB/LNaUEHOXAmAx9dHSGZpOST8PABgFirGXvKQCvuqV4qQatpwa5cEvFZF/WYjLLXQXYCEa5h9pNT0CT9W/t/VA4Clnvy2FFU8v/w8KWbGNn+8hnDZCKb6zqaRNy/RG1xLvMP74VnLJ2UIGK7SkP9x17QWQLddUKFJk8/2A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(54906003)(66556008)(66446008)(64756008)(86362001)(91956017)(76116006)(71200400001)(66946007)(6512007)(66476007)(316002)(6486002)(53546011)(2616005)(6506007)(26005)(4326008)(186003)(6916009)(7416002)(36756003)(478600001)(5660300002)(2906002)(8936002)(8676002)(33656002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uc6EZ5ovZg5Cj0VElH2JaCexdIHzyAN+cUVmtTEBGOuH365fhxNtz6aL2EUAiYEftSA6lsMo1P8SSoFvzy4jz+VcNhZdyqp/XjOt4YHKscxIXiRWj1RT5DudW6j+5LgflCchCfrU5/GKSEY+Ay2KoBqd9VhOLXqkzPj3ZsG3fykq4veSk5V/EUB90sSzedx0/+E+S3HImovy+7htvd+R7VrSYQRIbbbAkdy9maOykNc7lQeRrCi3fFjSfFloaBsjIIz01tp4LckdnjUQiw1XjdyBtTaZosL3ow+jzS7kPsxffcImW97HtsFn4SEkslyJ+tPu2Z0W24oAmn1JNr0QSreN/iNZ6Z96/Wr5zFtfMCVlCoPjlmTjHAVkSlA3crKCCgFC7CtZbiPwuctnah6HwXTAD7flxwaVwKPRagSKBBNswAJdYvDMBHGgiP11R9bO1v8eaAraBNjfNVr2vkQ9LO76QJB3whQ2Yk4oiyd9IHM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9027C811AA7D764BBCFD0BABD16A12B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1798
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(82740400003)(81166007)(53546011)(8936002)(6506007)(2906002)(316002)(70206006)(33656002)(70586007)(83380400001)(4326008)(2616005)(186003)(26005)(6862004)(54906003)(86362001)(47076004)(336012)(6512007)(36756003)(6486002)(356005)(8676002)(82310400002)(5660300002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f63ee55c-4741-4852-4d08-08d819e62c53
X-Forefront-PRVS: 0446F0FCE1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXL9HINAnQpNiga49XSnRHaorMokk9IwcrgalnOA10nIIh8NmI9jxSD5KZqIMcFO+usUbYrqkL931cLl5syTsG6EGW1nFhvS6IfvpODGcQh4sUiV4dzQLpQiB5XRAnKLZa/+b/qG3vn/3NMAHkT8HmiHtWjDKUvSH5DR8pR83pwUO10qYrabd6Y63DCja5qcpKdpAOMIGwEntsc+iCQVcsfUrurAWh+z7wp1w1oLC8OHpfNN7WHL5RuyP9Gv2BAMjf7hl7/HL+3PgZ/Os1eQVRG4ltBRfS+CD1vQ23fD6NKiQc6+ovUO32Em7I/wqiIU5/hRTx+RP4UOdqK/qMzDjVCH/CFvz5MRk9akitiorPxeIpHQULA0wHSKU/C0N8K+cdqNj8IpWcSbt2HXj3yZMA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:32:52.3816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acf955d-b15c-49b8-790c-08d819e630be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2008
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

> On 26 Jun 2020, at 16:02, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> While I've been running into an issue here only because of an additional
> local change I'm carrying, to be able to override just the compiler in
> $(XEN_ROOT)/.config (rather than the whole tool chain), in
> config/StdGNU.mk:
>=20
> ifeq ($(filter-out default undefined,$(origin CC)),)
>=20
> I'd like to propose to nevertheless correct the underlying issue:
> Exporting an unset variable changes its origin from "undefined" to
> "file". This comes into effect because of our adding of -rR to
> MAKEFLAGS, which make 3.82 wrongly applies also upon re-invoking itself
> after having updated auto.conf{,.cmd}.
>=20
> Move the export statement past $(XEN_ROOT)/config/$(XEN_OS).mk inclusion
> such that the variables already have their designated values at that
> point, while retaining their initial origin up to the point they get
> defined.

If I understand correctly you actually need this to be after=20
include $(XEN_ROOT)/Config.mk

Which actually includes the .config and the StdGNU.mk
Maybe you could say this as $(XEN_ROOT)/config/$(XEN_OS).mk is not actually=
 included directly in the Makefile itself ?

I tested the patch and it works on arm and x86 on my side.

>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -17,8 +17,6 @@ export XEN_BUILD_HOST	?=3D $(shell hostnam
> PYTHON_INTERPRETER	:=3D $(word 1,$(shell which python3 python python2 2>/=
dev/null) python)
> export PYTHON		?=3D $(PYTHON_INTERPRETER)
>=20
> -export CC CXX LD
> -
> export BASEDIR :=3D $(CURDIR)
> export XEN_ROOT :=3D $(BASEDIR)/..
>=20
> @@ -42,6 +40,8 @@ export TARGET_ARCH     :=3D $(shell echo $
> # Allow someone to change their config file
> export KCONFIG_CONFIG ?=3D .config
>=20
> +export CC CXX LD
> +
> .PHONY: default
> default: build
>=20
>=20


