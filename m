Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E26575F7C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 12:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368104.599291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCInE-0007H7-5G; Fri, 15 Jul 2022 10:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368104.599291; Fri, 15 Jul 2022 10:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCInE-0007Dd-2G; Fri, 15 Jul 2022 10:43:32 +0000
Received: by outflank-mailman (input) for mailman id 368104;
 Fri, 15 Jul 2022 10:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xid4=XU=citrix.com=prvs=188d5c0a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oCInB-0007DX-RQ
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 10:43:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f559231d-042a-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 12:43:28 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jul 2022 06:43:25 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by BY5PR03MB5252.namprd03.prod.outlook.com (2603:10b6:a03:224::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Fri, 15 Jul
 2022 10:43:20 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::ec74:68a1:2448:721b]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::ec74:68a1:2448:721b%6]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 10:43:20 +0000
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
X-Inumbo-ID: f559231d-042a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657881808;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FRPLlU3oexD7vGBeeD1i7qjtguNQRRtKb69qkCk8GZ4=;
  b=ayl1Uu2au9v+C8uvMmntBWaj3cZ3gDLUpL+41jTdoS1G0D7f0cqcuQnx
   A9UTAzv/GnofML2ivtaqe+PZse8LUKLJ4rN9NfWBmiCKwvQFaGF37hOVq
   r2mg0b3S0tW0SMGIZmaHppbxE5hCWmEtZE2A9h38pAZxVWdchFpAYUvPf
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 75176088
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tFfoy6P+5QPK1+vvrR1alsFynXyQoLVcMsEvi/4bfWQNrUp30DwDm
 mEbC2HXOvffMWHzLYpyOYnkpEoD6sSHyNIwSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPve8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPmzNU1AhA0DLYBpM1vXyJIy
 7szcxYSO0Xra+KemNpXS8FKr+F6dYzBGtNavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr4wCChI1W0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4HGlmTdoiLEaunnh2TYSpk3DbGE69FopAe41nU6CkMMbA7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasmgMXUpx+Gusx5QWJ14Ld+QPfDW8BJhZEYcAmtcIrAyAjz
 EWAm/vxHztzt7uQQHOZsLyTqFuaOzURLGIETT8JS00C+daLiJookhvFQ9JnEai0pt74Azf9x
 3aNtidWr6oXpd4G0eO851+vqyKhoN3FQxA44i3TX3m59UVpaYi9fYuq5FPHq/FaI+6kokKpu
 XEFn42U6rAIBJTUzSiVGrxTTPeu+uqPNyDajRh3BZ49+j+x+nmlO4dN/DV5I0QvOcEBEdP0X
 HLuVcpqzMc7FBOXgWVfOupd1+xCIXDcKOnY
IronPort-HdrOrdr: A9a23:PHIboKH0Q1wB5eyFpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.92,273,1650945600"; 
   d="scan'208";a="75176088"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Joyg+Y9OJWLrrPsQaLxz8vZkf3xcNtRRrVnfCzFD/VVc+g5UXCugTCLQv7rAwhIslxFW428ox+nNlcIwkl0oIS1EExJxGR5J7Kmi2bnFi11KpmeGUyL6Kf3adsWLv4A5rKS8WWj1zr775wmvtGUmv5818EzqxGGTy+pWqbXi18J58zMqzVcQOsSMU1RM+UJ9l5qcepx1Span46h07xkWQNJWjMdFtHLhKfwE/BcDFOdjPW/XYYJFmt+6ShV+qqGCYI2cFiRstPpIVKfJcyt/yDC4GDwlswI7cZN126s5JNejdhUcmJFfG+djnC0Ho8NkufSgK32Ab/ymH3x1vzsmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRPLlU3oexD7vGBeeD1i7qjtguNQRRtKb69qkCk8GZ4=;
 b=hvnUmL8thzAlV4de4yrHL9Ago5nddPV3SgvjNTpObh6hqfv9dtLdTTHM3jxa3nli/yhw/EOxTZC0RCDJ1MZzku8mPX0L22bLjFPZeKH8UAv0+01gf4RuY4Ry5rrhDjvpIuF7mqmQzK1bwX/2y3nRRWpENg8pPSsbkaOZeKaQz6QMrF1ebdiONnUDSNiQ2ghI5v6zjklZ+TmsrqoGOCghgADag/uUlG96PkCL0Dx6DnZQNsNijvKFho60oa2qHYpKImu/BaDMfJ3BHUwj/eiPmlW5Bd1SH2+IxUB58qGS8JodFvfQtIyobm28ZOOVQVkRz39d2PilCSUAeO5t+RBkBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRPLlU3oexD7vGBeeD1i7qjtguNQRRtKb69qkCk8GZ4=;
 b=RR951cQCBiiMJMkaUmmHs0W3w9/FflzZCU1NcKHegWGI4ZTyYzYjRdND4+bcNoZjsgbXn4P/+yiQ3sVcGbIxDy5xxlg06z7TDvN6R6qeb7k8X8nHTVXke2ajPbtirknSeuMBryhSXMFYmhkdF0J4wQwODxEIU47+V2F9O/76KX4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Topic: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Index: AQHYl4+Dg7FHxwiGFEGkNOu8rM/Cw61/OECAgAAIBYA=
Date: Fri, 15 Jul 2022 10:43:20 +0000
Message-ID: <a3484e66-4c02-91e6-2ffd-f82b1f96058d@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
 <d4767bc7-0f0d-7fde-4a9e-c6d4bc7ca2c2@suse.com>
In-Reply-To: <d4767bc7-0f0d-7fde-4a9e-c6d4bc7ca2c2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f25dc97-7df6-45a0-d130-08da664ed58a
x-ms-traffictypediagnostic: BY5PR03MB5252:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eoesUkTABDKQ3fg/ptFi9w9yvXGobVeVltoqXXI/f/jr/TJDehRArRrOlCFs31lVFxdEZAT9DWR36idblu75G3xiQkVy4oiSqNcdpjZROwC/vJUBgXGKf9yUeWpnvRSr5BUV2UBIeEuV6OhDbRTKpIDz2G31ehA4BTCzbVbdW5RRoCccxBMhE/wjvxOw/p2sPfH0Lrd2SnSgHP9Bdk3FHAUeHXtN/d48sDM0dzmFfLDPhzN4fsRszmcP9KzgORuh1YbsWq10lF313uXJ1lwkSJ8/FuOLCv1nMZQVTcpU0H29qPnaTLZiqtdXbm2utmS35rmBgaCz+pkPsAEUqXYL9OeZ9rNvz+NqZgx0rdblBRxbx5xa+bBMNTjXsjZNHnwOmGypru/TBu4N0lJyAhw8BMTyRn3+Vtm78CSLfNFJzLeK8/77EIn8zovRSPImhzUd2nBNVE4v5N12Ukb2mtnR89S2+/Npj5Uir4DyBldaF8/97GBVTRpNgJ+tEW/JhO5RU6U465gRBvSuUMgx1yi8Ti/1mHSmgKA5UkvjEgqKPFjUr1sl4xk7HDyYZ/jMaDvwE87qdpmFdC1wT5nl/g4+lHX0/NSuLA1PSY9Bhhc/BKROW1E/2qjTnPV2prBi7zw6V+toqJQV+g+oOMUkUJEg5Ty2aymXVbi9Y6b2wzqGOd17bTZZHzALV9JZbitxrXRZO5k7yZYD1tuQ+qmLZBpWa7QSdOcUa/tRI7VMGIq748/SVC9hMYUEvDWlMnslJXEdPvTRttck97eKIWITGkiGOVwU3WlLDlE/7XPUbPDATxP74ZWqzip55hDV/lDtqVJwNCoJrgMmWj2vabqw9zlP5Qk7XgBR+0j8871zYhWAT7hS0uAmrlvfOmLj9sAEN/ua
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(2616005)(5660300002)(186003)(82960400001)(38070700005)(2906002)(31686004)(36756003)(66946007)(64756008)(66476007)(4326008)(66446008)(8676002)(8936002)(76116006)(66556008)(6506007)(316002)(71200400001)(91956017)(26005)(53546011)(6512007)(41300700001)(38100700002)(122000001)(6636002)(54906003)(478600001)(86362001)(6486002)(110136005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDZ0emx1ck9jTEV3ZmJBQnV2SXU3di9mUFR3UXgybTRCTzBVQWp0K3Q1ZTBz?=
 =?utf-8?B?dDhuSXowaVZHL1M5TUE4MS9uam1RODEranlyWTVkL1BXVnNkZC9WSlhwZS9Z?=
 =?utf-8?B?a2M1WWFYV2dNSm1MYTRuWlBmYmhJd09iMEpyWlYyWGVoRFNzR3NrVG93LzEr?=
 =?utf-8?B?cWV1YVVVMEdJaEhTbE55c1YyRVFLRkplOUo3bG00ajVHSUM0c1Rpa0tGZ3l5?=
 =?utf-8?B?SW1EZXZTdGRydnByTng4emZQc3lBL21qaXFMVHpySjZoMGZjcmY2UVQ2UmRy?=
 =?utf-8?B?VUN0anltb3Vhek1XTWY0S24wWGR5NUZWUS9kcEx6bkt0c0sxT0orVTVTUDB6?=
 =?utf-8?B?VnFQZTVEeXpCMlF6ZnlSMjJ6K0Z1N3V1UHBrWFlMdlp6QTA0cTFnYXBJbVR0?=
 =?utf-8?B?QXJCZm1ic1QzSjRSNmVFams1VmFKdi9qZFBwVTB6MmdGQURsWkJtOUV4Rmxz?=
 =?utf-8?B?Vk5ycWlXc3I4K3BZSHlpZnQ0VmtidHhFSHlFNEwwVmpObTVMSkVwR2N4c000?=
 =?utf-8?B?dDZLMWtwRGlsMnd1cXl1SVFNYm9ObnN6YW1mU2NFMy83SkpJdGloSEFFaDhL?=
 =?utf-8?B?aHEwUFlLa3diSG1EY2ROSnhMK0ZSZUtMS1N0a2dXYWo5RFowVndIUnM0UzMx?=
 =?utf-8?B?KzZXTlIxZHZON1ZYcy8xOHowTW1nN2pVMmNKaGhpOEQ1VzJ0NS8vREVMc3pt?=
 =?utf-8?B?T2QzeGd0ei9raWthS3lCVUI1bnFSMnNnK3ByOTlQcGNOS1pSRXhzZWpiQUQ5?=
 =?utf-8?B?Z203cFY5aS92Vy8yQmgrQVJycSt3NkdqRng3WnBTaDI3S2NIQ3JpRzFkb0ZS?=
 =?utf-8?B?K2JYSkd4VU1XSmlYNVJEQ3loeWMybkNjSURmQUpxN1B0a2NUL3V0c2tFSUFC?=
 =?utf-8?B?WEpCbmRGZnExbTdWYXVod0wwQ3dlWFo5YjZkaDBZU1ErVEtqQVBXdzVMTnFE?=
 =?utf-8?B?V1FPWk10U3UzR2NmOE5xZk1lYVJsazlTOUJwZURZV2s0QzQxZEN4VDhMcmEr?=
 =?utf-8?B?OWhPbUExWmtZZDVwWVVjKzJ3YlY5b3p1NHcrZDUybXp5Y0VCK05mMEVDZWd3?=
 =?utf-8?B?V2traEF6ODk3MlNIcTJzN2ovNU8zdk1IcmdTNGZ4anUyb0NsVGlNVFpEVUFk?=
 =?utf-8?B?R3dnNTY4dXJIV05GYUdlU2FRRUVBR09uSFppdVQzUlg2RHFkMGZSSU5HQmsx?=
 =?utf-8?B?ZzM3bmdvaWQyYVdhWFZackFwOTR2VjhJa2VoeE9LaVZxV1ZrOGRlRnYxWm1C?=
 =?utf-8?B?ZFI0NjEyOEE3Y0JOeHRNUHVwcTBHblZIMjdIeDVJeXhlU3R5T2tqc3FBbXc0?=
 =?utf-8?B?eHlGUk90ZDdNTEVNNnBqQktLcWlsaU9xS2YyQTlHVmEvVGtVUEZxUUVsWEZ4?=
 =?utf-8?B?eEVrOHQ4YjQ2UWJ0blNnR3JXMHdDQkQvTjdNd2FDM2JGMml1bjhmQ0ZWMEtk?=
 =?utf-8?B?c2FIWjdZZitGaTFxQmtDSERQWjBsSW1OMFBtd3hPbGVneVJFOXdNU2NNcmwy?=
 =?utf-8?B?N0hjOTJNcFFUdW1QZzd3MFhNek9wRVJDR2IwVFFvVktDTHFzK2pZRjFCS2NY?=
 =?utf-8?B?cHJOOVBxUmp1aHZ0eEx5d0dKQ0NoZGlEQ1I0L0w3SExiaTNoT1hvaHV1L2No?=
 =?utf-8?B?Wm55WEJhNlBCekduTnlHaThWRlhrWGhWYkg5ODlJRHpWZUJPMVBxTXdSSnVz?=
 =?utf-8?B?RUo0bXFWWXJpeFlXQTBGNEUrL3hIWU1hZzZFZEZNT3pHRm1ZckpCd3VXbmNx?=
 =?utf-8?B?aFBRWEZmbmc2N3BwVEpKWEU3dlRoTTVxWEpGUXhWVXdnSVpaZlhQd3d5Nks2?=
 =?utf-8?B?ZmxxMHRUSDF1UmpmNFJYVjFCM2ZHRjlRNzMxU1VQcC9XK0poTWUyWmh2Q01B?=
 =?utf-8?B?a25NeURqRHJETlZqZTExVlpnK2lmdlk3bzl4ZEwwd1ZqY1NiUHdUc0ZxdzY4?=
 =?utf-8?B?ZitoYThlOHFNQ0I2a2VXYWlIeWNrR3EvQXZ0bEpJSWxMaC9kVVFUNlRadWFt?=
 =?utf-8?B?a2h3TnN2MjVzbkY4RFJ2RzhzNUNzQkp5OUFLYVZ0c2lNWWhsMktMRnlsMExn?=
 =?utf-8?B?RTNDVGNpU2lLWVdvbEJuQThNejJmRnc4ME1mSVRwS2JxTUVudnY1enlWTEN0?=
 =?utf-8?Q?8WfmEo//zwSIoSqHv04c0UDzb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8220B262BCD16049A1F5E4155183B98A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f25dc97-7df6-45a0-d130-08da664ed58a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 10:43:20.2160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22eTuzoaQr4RbvIyoU5yqGuBQXGCTQlk+ZURM8kyGGAw2XjMCtopvRuDGSIhqLmgBSLTzI39pBwiRBiL1K3pTWETIhX7W2hlsIPEBdV6474=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5252

T24gMTUvMDcvMjAyMiAxMToxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjA3LjIwMjIg
MTY6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4gLS0tIGEveGVuL3Rvb2xzL2NoZWNrLWVu
ZGJyLnNoDQo+PiArKysgYi94ZW4vdG9vbHMvY2hlY2stZW5kYnIuc2gNCj4+IEBAIC03OCw3ICs3
OCw3IEBAIHRoZW4NCj4+ICBlbHNlDQo+PiAgICAgIGdyZXAgLWFvYiAtZSAiJChwcmludGYgJ1wz
NjNcMTdcMzZcMzcyJykiIC1lICIkKHByaW50ZiAnXDM2M1wxN1wzNlwzNzMnKSIgXA0KPj4gICAg
ICAgICAgIC1lICIkKHByaW50ZiAnXDE0NlwxN1wzN1wxJykiICRURVhUX0JJTg0KPj4gLWZpIHwg
YXdrIC1GJzonICd7cHJpbnRmICIlcyV4XG4iLCAiJyR2bWFfaGknIiwgaW50KDB4JyR2bWFfbG8n
KSArICQxfScgPiAkQUxMDQo+PiArZmkgfCBhd2sgLUYnOicgJ3twcmludGYgIiVzJXhcbiIsICIn
JHZtYV9oaSciLCBpbnQoJyQoKDB4JHZtYV9sbykpJykgKyAkMX0nID4gJEFMTA0KPiBJJ20gYWZy
YWlkIHRoYXQncyBub3QgcG9ydGFibGUgdG8gZW52aXJvbm1lbnRzIHdoZXJlIHNpemVvZihsb25n
KSA8IDguDQo+IFRoZSBzaGVsbCBpc24ndCByZXF1aXJlZCB0byB1c2Ugd2lkZXIgdGhhbiBsb25n
IGZvciB0aGUgZXZhbHVhdGlvbi4NCg0KWXVjay7CoCBUaGlzIHdvcmtzIGF0IHRoZSBtb21lbnQg
aW4gMzIgYml0IGJ1aWxkcyBiZWNhdXNlOg0KDQorKyBvYmpkdW1wIC1qIC50ZXh0IHhlbi1zeW1z
IC1oDQorKyBhd2sgJyQyID09ICIudGV4dCIge3ByaW50ZiAidm1hX2hpPSVzXG52bWFfbG89JXNc
biIsIHN1YnN0cigkNCwgMSwNCjgpLCBzdWJzdHIoJDQsIDksIDE2KX0nDQorIGV2YWwgdm1hX2hp
PWZmZmY4MmQwIHZtYV9sbz00MDIwMDAwMA0KKysgdm1hX2hpPWZmZmY4MmQwDQorKyB2bWFfbG89
NDAyMDAwMDANCg0Kc28gdGhlIHRvcCBiaXQgaXNuJ3Qgc2V0Lg0KDQpBbmQgZ29pbmcgZnJvbSBh
biA4Lzggc3BsaXQgdG8gYSA5Lzcgc3BsaXQgZG9lc24ndCB3b3JrIGVpdGhlciBiZWNhdXNlDQp0
aGF0IHVzZXMgNCBiaXRzIGFuZCB3ZSd2ZSBvbmx5IGdvdCAyIHRvIHBsYXkgd2l0aCBnaXZlbiAu
dGV4dCdzIDFHDQphbGlnbm1lbnQuDQoNCkkga25vdyBpdCdzIGRpc2d1c3RpbmcsIGJ1dCBob3cg
YWJvdXQgYSBCVUlMRF9CVUdfT04oWEVOX1ZJUlRfU1RBUlQgJg0KKDF1IDw8IDMxKSkgPw0KDQp+
QW5kcmV3DQo=

