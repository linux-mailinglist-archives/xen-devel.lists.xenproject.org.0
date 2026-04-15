Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sILZNHL23mkNNAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 04:22:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2A3FFB78
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 04:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282156.1564822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCpsi-0002su-2r; Wed, 15 Apr 2026 02:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282156.1564822; Wed, 15 Apr 2026 02:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCpsh-0002pu-T7; Wed, 15 Apr 2026 02:21:31 +0000
Received: by outflank-mailman (input) for mailman id 1282156;
 Wed, 15 Apr 2026 02:21:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <joan.bae@boeing.com>) id 1wCpsg-0002po-QL
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 02:21:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCpse-000XhT-NX
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 04:21:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <joan.bae@boeing.com>)
 id 69def5cb-e002-0a2a0a5209dd-0a2a450288b6-42
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 04:21:27 +0200
Received: from [130.76.144.163] (helo=clt-mbsout-02.mbs.boeing.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <joan.bae@boeing.com>)
 id 69def625-42fa-0a2a45020019-824c90a39098-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 04:21:26 +0200
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 63F2LO2m009931; Tue, 14 Apr 2026 22:21:24 -0400
Received: from XCH16-09-08.nos.boeing.com (xch16-09-08.nos.boeing.com
 [144.115.66.156])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 63F2Jh07008906
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 14 Apr 2026 22:19:43 -0400
Received: from XCH19-01-11.nos.boeing.com (144.115.67.131) by
 XCH16-09-08.nos.boeing.com (144.115.66.156) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.58; Tue, 14 Apr 2026 19:19:42 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH19-01-11.nos.boeing.com (144.115.67.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 19:19:42 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 14 Apr
 2026 19:19:41 -0700
Received: from SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:196::15)
 by BN0P110MB1546.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 02:19:40 +0000
Received: from SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM
 ([fe80::452a:f17:6196:8976]) by SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM
 ([fe80::452a:f17:6196:8976%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 02:19:40 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=boeing-s1912 header.d=boeing.com header.i="@boeing.com" header.h="From:To:CC:Subject:Date:References:In-Reply-To"; dkim=pass header.s=selector1-boeing-onmicrosoft-com header.d=boeing.onmicrosoft.com header.i="@boeing.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1776219684;
	bh=mh3jw2nNypx/gjnyF2rTr4YGVZIzELOgxhSCK38qGjI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ikFxk9BdwUsqJBWc5EtQWH9pcO+O2kBW6Me+Be91LaZjpj1lqC3HwEAXVL5cUspcz
	 QdX4iAzIwXAEZMGc9sK7Zr842f1PzAuaxZKNXFkngsSbr6/hCyjWoE4VGTog0HJPqh
	 2gNkfsNHucH9U3+pPEypTlk7ApLj+hN4D5aYUqeRjY4sXZNVN+80VO7FwwC+8LV8mL
	 3vAV7c2NgKRb4fR3gPu+hJOs0Zb4LgkL9wfqz/sDrci7BXuZw4a0xCDS/6/pUeXvAV
	 m6kxkjNLANp/IzJoS7Rh0VmS0gtjXC+sYv9zBVN1naRc4/hW77qQLFsLPbSkJO25Pf
	 eGKuo/77Q9G9Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=rqaHgzA3rsBF9fvGHuzwZoMehVmJAf9IIHmva8eM4/XXmMZhjtyQNGPlojFMEUuSP5EgytMNOZASYcX7gyhrsIflPICm2iVonfiNWRaP/3+A+eUv6GfSufYNOKhmlx9FAZd6rLsq9tMDa9W4ic6mDSll+Co75k4kZcBTrvyFk9wXAcmP/2TbcGKKfY9r7TlcxHmt0pIZi4yqViNO43znpfu57KlVuSpV1TN6RjSgdjJbo8q+Z+ww2eGouwWwkcPj5A4Xulu7pUt0OCc1LAa2mOvfDzbxe6A8+F+bq+Uq5OLsuks6bx9/sUCCPXOZ6ZR6WBBzZknXC8fwgAUN+QgUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mh3jw2nNypx/gjnyF2rTr4YGVZIzELOgxhSCK38qGjI=;
 b=lNapfPH99MhWizTyuamdF6iSBnvqjgLgBhEYwfdsQid4nwafUhcWMeQcNrOn5nZgSnGZfe9qxsFuSgM7W51OGXJW9c3S5r61c4036gTPiW5airgBULf6+pLOZCCY6Y3YVS9FZG2B0lLv8qNFBha6XVJLkTk899CNpvKzdE/lY9nNpRciSoW/KCSdzcIIixOpdER3W+3iMU6hReKaNkKkdedv5scYlkblTGrOj/hxKfohuLeqihbcwt6PTxWN/sGIffKFQqWJYfniN8GVcEm4zCZQqyHkzRYPEZ1gpQq1gOz5FoDnKBB31c4UVg2YZB2GGZ6YYsiqTSun4o2wEemlhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mh3jw2nNypx/gjnyF2rTr4YGVZIzELOgxhSCK38qGjI=;
 b=PkIoEgUpdZYZtkmhz+1hk4coseO/sRhJwjDlGafwFj6hVHSF/VaqLSMQI9nug1+pAdLb8x0Zbs4LgArNJlkBGJwSLRABR8pVEY9TgAzrVciShhqeVegtAcoP0OH01xok7uoNnooeqUFE5fZ41dGerSfDFhra/KprbVYL6zYn4EI=
From: "Bae, Joan" <joan.bae@boeing.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: RE: [EXTERNAL] Re: [XEN PATCH] xen/common: validate shared memory
 guest address overlap with guest RAM
Thread-Topic: [EXTERNAL] Re: [XEN PATCH] xen/common: validate shared memory
 guest address overlap with guest RAM
Thread-Index: AQHcy6n8SUKFV8ls/kGsGA5q0Nlt0bXdycCAgAGZ18A=
Date: Wed, 15 Apr 2026 02:19:39 +0000
Message-ID: <SA1P110MB16142073986E51B11EF98CD9FF22A@SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM>
References: <59dcd094173791926fff212f3f2b86df50b0dc12.1776060772.git.joan.bae@boeing.com>
 <cfe8b6ae-2f52-47c4-862d-52d648d41895@xen.org>
In-Reply-To: <cfe8b6ae-2f52-47c4-862d-52d648d41895@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1614:EE_|BN0P110MB1546:EE_
x-ms-office365-filtering-correlation-id: e8e60b48-e995-490e-c9f0-08de9a9572cc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: WbFYTB371mM0QeTu25pgMGg8KLpfeLf3Lh0j/xXryUnlxVKLuujjNllJka6DmdWN4qaG3YeUJ65n5iLphQYXOgZ5fSF6sGABzLLd0m7p/l8wyVR3MOSFDhyyXtjtI6IBjZ1PfhbrhD/EP5WJJqgzoJfdrMzgwRflMlHNw13NSoatrH2Erd7aOZZwwJT7U/GsEukVdAwIQ0sBJXn2k4VW4lTkhe/KWWLVXxVLCmgU6vj0lNzj7R63V8MH1iwo6GH2yYUp96f7JpwzPZEeTHfIN/6zJZduap6KDgy1NasRqcfbDsKIjDszQ4wouXkUQmd2HkpozqWFRdTairUpwzQW8pzv55q0zO9c5S5VSpxeG+oZXLYrGhTV8aGsSSi1R8mgUO4ouOysCaaJLnIBG8AK454cTS4tUOjfYt3zT+tKCXHuFCuivjSz6oc+2SWxJLJkXz5raAXNR98F5ij0w+8aqmMpbMPmDLRaBU1xYdjsdZXwuyKS2q37UkdWde7/vPWjP8lKnsTSfAJNAI/KqtOy7JY/MHJ9LBzs6Hw66XjFvS8aOwwmBZYTYdT1Ky9k3mvbcJ4CL+ts+YJGxAtjTorktpLn4119fwCGAasuwyZLTnWvBUABvWS+zo+1szWJac8q/2r4zk3Twh43AsvlnVhZfHcOUWxln45xw0IqNjq9nzCIcO0fMnUBvNXdLjNgB+MaY4ofxXg2CSqdeUmfDJyPYBJumkDiFfPuS6/Z9T/4yCmkcfGXLXciTuIMDua27JGsQ7UsUY6ucXmX34dO1E+UE55c23wHapsGiky+Hp7Ea0w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHVUOEYzUVZ2d1lZQU9uV3ZhMmp6ZjhVWjE3Y1RhOUM3bWt6VVJJaEdHVkVo?=
 =?utf-8?B?ZkN3alRXWXR5OXB3WHVBMVlPTlY3VDlHd2prblJXejN4aUFRVkJBQklQMjR5?=
 =?utf-8?B?WGVOUWxsem82WmpFbEQ0WTBCcG51N0ZqUEg4ajEvT0VkdGM1dnRzQ29MdFRD?=
 =?utf-8?B?bVZyaXErSm8xaEZxTktKMFJTWTBGc2xnVEEzN0Zzdm5RbTYySFVURkNYaFd1?=
 =?utf-8?B?YnF1MGtDUWc3enFKZ295ekMvVGtMYU0xSW1wdFVUbG9LYmR6U0tSNkRZamRl?=
 =?utf-8?B?ZzhjN3Q4NWRVY0cvMGxsWWVxdXRldkhOa1pmMk9VUVk0cVJjUHhoNUUrWklH?=
 =?utf-8?B?QW1FcHdka0hKLzVYaHUzY1ZmcGc0VXpremR6Q0h4SFQyTHp2bldSQ2xXRk56?=
 =?utf-8?B?ZUJRNmQrZ3FYTGJzVU5BbGZpYVpyNEwzanhtU25BUEh1YTlJNUZQT2NpcGxj?=
 =?utf-8?B?bC85YnZab3lJZ0ZxRmhtcngxRG9ST2pYbkhzYmZscVBrZ0ZnU21ucmZQVG44?=
 =?utf-8?B?Sy9JZ21DdzNPOG5XdGRQOVNYelRqWm9IMEtscVY0MXlWVGMxalgrWDArdkVI?=
 =?utf-8?B?VzMxb3JCZi9hc0Qrd1F5QkVSZURMNXJ6WTBqNGRuSEE4SXIvdUVIbjNzQjZh?=
 =?utf-8?B?bnpZd0ZrVHF6YmFFNGVvM3R5ckx6WDVnRWZKR054bklNYXlFbnRNblBvTFp5?=
 =?utf-8?B?LzRDd2QvOERwZWV1bURtMXV5MXUyc1NOamdObHphRmNMN3dEdHBqUTN3SXo2?=
 =?utf-8?B?ZzR0Z3BMSkdUWjBJYkxYaW5KYllOMXh1YXljUUtkeXlYT1BQOU1Ha3NSWnJ3?=
 =?utf-8?B?VlprdTFCODYwcTJZaElRUUlQMkE3WjZ0aXBsa1FVbE54NFl1MkxhWnl6aWdR?=
 =?utf-8?B?WmE4ZjBsZjh1bUs5VGJjOGd4blF3T3ZhNDBnd1BHYkVzOGdvK1NjOTZPQ1Z5?=
 =?utf-8?B?dVRlcXVwcitVdzdMTGpPeGRDYWhCU0c2ajNlNURkMGhhNzFya0pRb3lLRzhD?=
 =?utf-8?B?ZHZIc3NEcjBncVlYcGtXazFsaWgwZHBIcithSDBKd3hWeXN3TCtBQjArZ04w?=
 =?utf-8?B?N2FvaG85WUlZYVBTMVFXNFk4VnNxWnVZOW1EOFpXMEZMM1VFcjFwV0RtUGVa?=
 =?utf-8?B?SWV3QzUzTHZWcVczNSt4bGhpUVJ0a0RBcG5reHpDRFpDZkk5ZW8vdW1GWDZo?=
 =?utf-8?B?V20zZGE1d1g3VXZ5QVBpdERDKzdTMytNOHhtaFJjVEM5VDZSQllVWHZYRVhS?=
 =?utf-8?B?OUVtaWgwclVLQ3lWcmR0MllGY0FKZWhoRUZRWm42bmVsdjd4UlYycTJtOU1p?=
 =?utf-8?B?OEVaRGxmQVdxZFEzVmxub3p2ejVHVjhTQ05YRTZMelJ4Y0VxeU1pNEtLOTRv?=
 =?utf-8?B?Uk1ZUWwxL0JyemVsajVScFI5OWxrWFVuakVRbndSSnp3clR6SVVrTWFKSmtp?=
 =?utf-8?B?T3JiYjZENzZJbHBxWmlGM0FWTy9tK1JOeGh3VUUrUnBPdzJmVmo4dUpxS1Jx?=
 =?utf-8?B?RDZxTFVIVzdZQ2k0KzhrZGVDUnBFZHNMbDMxSlNkSWh2WkprUFQ4bUU0OFQ5?=
 =?utf-8?B?RTZLR09rSlJQTnJGTWdXVEE0Z0djSU5nemJvb2JxLzJlUmdDMkhwU1VWL05L?=
 =?utf-8?B?N3V4NXRzU2M4bTZNRzJ1UnVrVFA5dzhVN3BOakNCM0FGejMrc3VZT3JxOEE1?=
 =?utf-8?B?SDJxUDd6dkpVWjZQTW84MU9oa2NtZTBOcHE3SHlNM2I5bUhKa1lNYkFDekd6?=
 =?utf-8?B?eTJjMDFwbk1PSUxHNjVTb3FUMlQ4b09wdlRiS1BxMHhTYmVvZDh5OFJzMzU2?=
 =?utf-8?B?UXRhTm1VSndIc3JyUHVjT3JnUUdPVlpXeUFLNEFDbVJQTmt2dlBOZGt3OXJR?=
 =?utf-8?B?QitNNWVNY3lQNjRDUmdnbDBCaHpEWTg5TW1hWllpUis0MW53dExDY0hiWjk0?=
 =?utf-8?B?WlNCbGZSYks2L2c5N0xOaDJKeVRDNU9Cd2pGMlJuZzBueEVOY0pDUCthMXdh?=
 =?utf-8?B?UGVzOURWNXlmanllRXFlNThaSS9oTXpTN0lSVTF3WWpDS0ZDZDJqT05PM0xR?=
 =?utf-8?B?aWpQQ2c1QW1VNlozRDRYTHplMmpTMHdIUFpMNDAzN1lPR2FaYlNGb1ZBTWd5?=
 =?utf-8?B?bTczcDZaZnptZ1JiUVJOWGFnVFF0T1YycVd1eE95MTlLdHVSU2FWY1ZERnM5?=
 =?utf-8?Q?ky3v/A1Nh77aK0vy5qCs5eZhmN6iQQkfiHBnvEu38qnT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e60b48-e995-490e-c9f0-08de9a9572cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 02:19:39.9633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1546
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-purgate-ID: tlsNG-720697/1776219687-46D20CD1-23388831/0/0
X-purgate-type: clean
X-purgate-size: 3700
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector5401:i=1];
	DMARC_POLICY_ALLOW(-0.50)[boeing.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[boeing.com:s=boeing-s1912,boeing.onmicrosoft.com:s=selector1-boeing-onmicrosoft-com];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[joan.bae@boeing.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joan.bae@boeing.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[boeing.com:+,boeing.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[boeing.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: C8C2A3FFB78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgYWdyZWUgdGhhdCB0aGUg
b3ZlcmxhcCBpc3N1ZSBpcyBub3QgbGltaXRlZCB0byBzaGFyZWQgbWVtb3J5IG92ZXJsYXBwaW5n
IHdpdGggUkFNLiBJdCBjb3VsZCBoYXBwZW4gd2l0aCBhbnkgUDJNIG1hcHBpbmcgZHVyaW5nIGRv
bWFpbiBjb25zdHJ1Y3Rpb24uDQoNCkkgcmVzZWFyY2hlZCB0aGUgY2FsbGVycyBvZiBwMm1fc2V0
X2VudHJ5KCkuIEF0IGEgaGlnaGVyIGxldmVsLCBwMm1faW5zZXJ0X21hcHBpbmcoKSBjYWxsZXJz
IGNhbiBiZSBjYXRlZ29yaXplZCBpbnRvIHR3byBncm91cHM6IHJ1bnRpbWUgaHlwZXJjYWxscyBh
bmQgZG9tYWluIGNvbnN0cnVjdGlvbi4NCg0KUnVudGltZSBoeXBlcmNhbGxzIHN1Y2ggYXMgWEVO
TUVNX3BvcHVsYXRlX3BoeXNtYXAgcmVseSBvbiBvdmVyd3JpdGluZyBleGlzdGluZyBtYXBwaW5n
cywgc28gdGhleSBtdXN0IGFsbG93IGl0LiBPbiB0aGUgb3RoZXIgaGFuZCwgZG9tYWluIGNvbnN0
cnVjdGlvbiBjYWxsZXJzIHN1Y2ggYXMgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZXMoKSBzaG91bGQg
bm90IGFsbG93IG92ZXJ3cml0aW5nIGV4aXN0aW5nIG1hcHBpbmdzLg0KDQpTaW5jZSBib3RoIGNh
dGVnb3JpZXMgZGVwZW5kIG9uIHAybV9zZXRfZW50cnkoKSwgYWRkaW5nIGEgYmxhbmtldCBjaGVj
ayB0aGVyZSB3b3VsZCBicmVhayB0aGUgcnVudGltZSBoeXBlcmNhbGwgcGF0aHMuDQoNCk15IHBs
YW4gZm9yIHYyIGlzIHRvIGFkZCBhIGNoZWNrZWQgdmFyaWFudCBvZiBwMm1faW5zZXJ0X21hcHBp
bmcoKSAobmFtZWQgYXMgcDJtX2luc2VydF9tYXBwaW5nX2NoZWNrZWQpIHRoYXQgdmVyaWZpZXMg
bm8gZXhpc3RpbmcgbWFwcGluZyBpcyBwcmVzZW50IGJlZm9yZSBpbnNlcnRpbmcuIERvbWFpbiBi
dWlsZCBwYXRocyB3b3VsZCB1c2UgdGhlIGNoZWNrZWQgdmVyc2lvbiwgd2hpbGUgcnVudGltZSBo
eXBlcmNhbGwgcGF0aHMgcmVtYWluIHVuY2hhbmdlZC4NCg0KSSBhbHNvIG5vdGljZWQgYSByZWxh
dGVkIFRPRE8gaW4gcDJtLmg6DQovKiBUT0RPOiBBZGQgYSBjaGVjayBpbiBfX3AybV9zZXRfZW50
cnkoKSB0byBhdm9pZCBjcmVhdGluZyBhIG1hcHBpbmcgaW4NCiogYXJjaF9kb21haW5fY3JlYXRl
KCkgdGhhdCByZXF1aXJlcyBwMm1fcHV0X2wzX3BhZ2UoKSB0byBiZSBjYWxsZWQuIC8NCg0KVGhp
cyBzZWVtcyB0byBiZSBhZGRyZXNzaW5nIGEgc2ltaWxhciBjb25jZXJuLiBXb3VsZCB0aGUgYXBw
cm9hY2ggb2YgYSBjaGVja2VkIHdyYXBwZXIgYXQgdGhlIHAybV9pbnNlcnRfbWFwcGluZygpIGxl
dmVsIGJlIGFjY2VwdGFibGUsIG9yIHdvdWxkIHlvdSBwcmVmZXIgdGhlIGNoZWNrIGF0IGEgZGlm
ZmVyZW50IGxldmVsPw0KDQpUaGFuayB5b3UsDQpKb2FuDQoNCj4gRVhUIGVtYWlsOiBiZSBtaW5k
ZnVsIG9mIGxpbmtzL2F0dGFjaG1lbnRzLg0KPiANCj4gSGkgSm9hbiwNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gMTQvMDQvMjAyNiAwOTo1OSwgSm9hbiBCYWUgd3Jv
dGU6DQo+PiBDdXJyZW50bHksIHByb2Nlc3Nfc2htKCkgZG9lcyBub3QgY2hlY2sgd2hldGhlciB0
aGUgZ3Vlc3QgcGh5c2ljYWwNCj4+IGFkZHJlc3Mgb2YgYSBzaGFyZWQgbWVtb3J5IHJlZ2lvbiBv
dmVybGFwcyB3aXRoIHRoZSBkb21haW4ncyBhbGxvY2F0ZWQNCj4+IFJBTSBiYW5rcy4gTmVpdGhl
ciBwcm9jZXNzX3NobSgpIG5vciBwMm1fc2V0X2VudHJ5KCkgY2hlY2tzIGZvcg0KPj4gZXhpc3Rp
bmcgbWFwcGluZ3MsIHNvIHRoZSBSQU0gbWFwcGluZyBpcyBzaWxlbnRseSBvdmVyd3JpdHRlbiBp
ZiBhIHVzZXINCj4+IHNwZWNpZmllcyBhIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgdGhhdCBmYWxs
cyB3aXRoaW4gdGhlIGd1ZXN0IFJBTQ0KPj4gcmFuZ2UuIFNpbmNlIGNvbnN0cnVjdF9kb21haW4o
KSBsb2FkcyB0aGUga2VybmVsIGFmdGVyIHByb2Nlc3Nfc2htKCksDQo+PiB0aGUga2VybmVsIGNh
biBlbmQgdXAgaW4gc2hhcmVkIG1lbW9yeSBwYWdlcy4gVGhpcyBjYW4gY2F1c2U6IC0gQW5vdGhl
cg0KPj4gZG9tYWluIGNvcnJ1cHRpbmcgdGhlIGtlcm5lbCB2aWEgc2hhcmVkIG1lbW9yeSB3cml0
ZSAtIFNpbGVudCBndWVzdA0KPj4gY3Jhc2ggd2l0aCBubyBlcnJvciBtZXNzYWdlIGZyb20gWGVu
DQo+IA0KPiBUaGlzIHNlZW1zIHRvIGJlIHNvbHZpbmcgb25lIHNwZWNpZmljIGlzc3VlIChSQU0g
Y2xhc2hpbmcgd2l0aCBzaGFyZWQNCj4gbWVtb3J5KSBidXQgSSBiZWxpZXZlIHRoaXMgY291bGQg
YWxzbyBoYXBwZW4gd2l0aCBvdGhlciBraW5kIG9mIG1hcHBpbmdzDQo+IGJlY2F1c2UsIGFzIHlv
dSBzYWlkLCBwMm1fc2V0X2VudHJ5KCkgZG9lc24ndCBjaGVjayBhbnkgb3ZlcmxhcC4NCj4gDQo+
IFNvIEkgd291bGQgcmF0aGVyIHByZWZlciBpZiB3ZSBzb2x2ZSB0aGUgcHJvYmxlbSBvbmNlIGFu
ZCBmb3IgYWxsLiBUaGlzDQo+IHdvdWxkIG1lYW4gbW9kaWZ5aW5nIHAybV9zZXRfZW50cnkoKSAo
b3Igb25lIG9mIGl0cyB0b3AgY2FsbGVyKS4NCj4gQWx0aG91Z2gsIHdlIHdvdWxkIG5lZWQgdG8g
YmUgY2FyZWZ1bCB0byBub3QgYnJlYWsgbWVtb3J5IGh5cGVyY2FsbHMNCj4gd2hpY2ggbWF5IHJl
bHkgb24gb3ZlcndyaXRpbmcgZXhpc3RpbmcgbWFwcGluZ3MuDQo+IA0KPiBDaGVlcnMsDQo+DQoN
ClRoYW5rcywNCkpvYW4gQmFlDQoNCg0K

