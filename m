Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5574B5446
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272409.467240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd2C-000453-5i; Mon, 14 Feb 2022 15:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272409.467240; Mon, 14 Feb 2022 15:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJd2C-00042w-2f; Mon, 14 Feb 2022 15:13:00 +0000
Received: by outflank-mailman (input) for mailman id 272409;
 Mon, 14 Feb 2022 15:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJd2A-00042q-Hn
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:12:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9615e956-8da8-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 16:12:56 +0100 (CET)
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
X-Inumbo-ID: 9615e956-8da8-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644851576;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=J4LMMZs8RpC/2S6kfTeWrHFU9i3oeHB3Ei77y1GUEos=;
  b=Zx1K5A8vgQU1E2es0fP5G549+u59/XGjljlBdVDW7IkuA2pc0ZZFNiTs
   QAo6nuK5E4oZfQH8xTlrlNIMs4FjVf0MT+mdvJo50K567CaCbkB11aE/T
   1ekB6sNjpky/RGt9zbn1ebaojSYaMCHk+5gdijnP/i81gYCjP1jQ8D6Ss
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /GTN7gG647DFo7IyS58RPp7v+teqANUNWKd2u0SCon/bvIhZCmmTB+5dTS2FbstEn470I9vgQ5
 pvwshnniEa78BOsB/PVWo78NRn0OF9U3dgJscvT9fbxhTas1tE4ShSCnYgODizkLY7PBKEgrv3
 aDhZfsrX45K6D9XtGkN68z9rWmK2udFJO+8hITJAZ48a0upZn5epXPFDkgCC6XaDpNfwwonB4n
 7CiNSUEnWCi40NZN5TuA+dqfVLU7+493Scd2vZDrHdLi0dSXjfu1TNdgB54d91Wq3ayUrs4JdO
 VEcQfiH6vLRsk2/MdVHquaZN
X-SBRS: 5.1
X-MesageID: 64568127
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LIa7n6g1YbTBVrVYDNKV1RnRX161bxYKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41yZSGyNFrHQJr/n80EytEp5OaCdqQdhuqYCmfJMPJFhw6t
 cxOZtCccZpuQyPV+hn1PuSw8SZy2PjUGrCiA76cZioZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EA/9h24raTlJ4fLa9Bk2t/qusmlD7lAzbq5F5wSFxiBJXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyrzq70TGm0hK6YYD76vR5jnF0gvZT2MY0Mx8N0W3Txowpk
 r2hiLTrIesXFvyU8Agie0Ew/xFWZcWqL5eefBBTGeTKp6H3WyOEL8dGVSnaDqVBkgpDOklc9
 ORwFdw4Rkvra9RaYl6MYrIEaswLdKEHNW6E051q5Wmx4f0OGfgvT0hWjDPxMfhZas1mRJ7ji
 8QlhTVHRQ/cYDtpAWYuU9E4gsKyvnPfdgIftwfAzUY3yzC7IA1Z1bHsNJzee8CQRNUTlUGdz
 o7E1z2nWFdAboXZkGfbtCL37gPMtXqTtIY6O7C/7PFnxnGOwGgaEDUdVEehoOn/gUm7Mz5aA
 xJIp3R+9PJtnKCtZtj9bR+Z/yaDgkdCePdpH8kas1ynyIOBtm51AUBbF2UcObTKrvQeWTUv3
 0Shg9DtCDpgobCRD3ma89+8pDKpMCkRJEcIZDMIQAUI5dXuusc4iRenZs57EbS+h9n8EyzYy
 TGWoCUwirMfgNRN3KK+lXjlqT+xopnCTiYu+x7aGGmi62tRdIOjIoCl91XfxfJBN5qCCEmMu
 mAenMqT5/xICouC/ASSRM0dEbfv4OyKWAAwmnY2QcNnrW70vSf+I8YAu1mSOXuFLO4tYiPqR
 mnoiDoKp5lNGWGSZ49yXMWuXpFCIbfbKfzpUfXdb9xra5d3dROa8CwGWXN8z1wBg2B3z/hhZ
 M7zndKESC9DVP85lGbeq/I1jOdzrh3S018/UnwSI/6P9bOFLECYRr4eWLdlRrBotfjUyOk5H
 js2Cidr9/m9eLCkCsU02dRKRbzvEZTcLcqow/G7jsbZfmJb9JgJUpc9O48JdY1/hLhynezV5
 Hy7UUIw4AOh2SGYeVXXNyg6M+mHsXNDQZUTZ3JEALpV8yJ7PdbHAFk3K/PbgoXLBMQ8lKUpH
 pHpiu2LA+hVSySvxtjuRcKVkWCWTzzy3VjmF3P8OFAXJsc8LySUqo6MVla+r0EmU3vo3fbSV
 pX9j2s3t7JYHF88ZCsXAdryp26MUY81xr4jARuQeoMLEKgumaAzQxHMYjYMC5xkAT3IxyeA1
 hbQBhEdpOLXpJQy/sWPjqeBx7pF2cMndqaDN2WEv7uwKwfA+W+vnd1JXOqSJGiPX2Lo4qSyI
 +5SyqikYvEAmV9Ltat6Eqpqkv1it4e++ecCw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZl2CKv/Q4KUn3/gFt+7+DXRkANhWAknUFfrB0LJkk0
 aEqv8tPs16zjR8jM9CniCFI9jvTcixcAvt/7pxDWd3lkAsmzF1GcKfwMC6u7cHdcchIP2krP
 iSQ2PjIiYNDyxeQaHE0D3XMg7ZQ3MxcpBBQwVYeDF2Vgd6Z1OQv1Rhc/DlrHARYyhJLj7B6N
 mRxbhAnIKyP+3FjhdRZXnDqEAZEXUXL9kv0wloPtWvYU0j3CTCdcDxjYb6ArBID7mZRXjlH5
 7XJmm/qXAHjcNz1wiZvC1VurObuTIAp+wDP8Cx98x9pw3XujeLZv5KT
IronPort-HdrOrdr: A9a23:zcCeSqN/smnxucBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="64568127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRVsAmopmxnOt+F73iGa0QKDz2M/zEsKXJM1dOEjmtokyy+X2h2+lDZhTJ/WqPImIJy6jPSULMBHlesT7onD/AE2gKnLr7AVYwj9ERDWGrQbB7aL6YYcA1vRbybcmucgugxCxqoyXK6OdPqKiApSERk7mEKf+CjeKxcAM/GhtrB3Eer0GlU1OXxpwGnucdv713Y1aM5SgmxVWjw9ghoCAQd21cnhGrMl+o7sRF7FYrIdPFyOTbfhlLW6bsxLwVQ5Y7Hv1rlttKwn1/iqcaS9ky5BpXCoKYiuQ02y8SFuZ3yF9n/sd4isqc3hfHr8+JaxECzGEyUOjtRhCHunJ2j/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya0w5Pm8lt2K4enA1pVPf8WWJQx24SVk5IOLZ248c+8=;
 b=FwqCHiPpCxWbr2nwLxQkNvdH9nUj+whJe5s1rzq2b8ighvwubvYADFqnHZc1cLnEL93X2gqGe6eDNlFuHFOukOOYKFhYdjL49vtcUXVD3Zuu+7HKTwi5mx1uCIqFKu86IAOF5yU4kBkdykDXEbDOHstfAOOpzUiixhEzpyhZUWmknFnATuVoiZao8WQxFmSG74/HHTjDD/2WGS2cUz88Se02D5MoqNdRwZHxbpe3acQYeedEli6pqaHKFjSceOF4OD2ZI+0H5AakoMbB4FaPRxCku5yv63NCXU0E13p2gn05CrJ6WcvIpWwgZm7kETAIVLmH76CRPbViJqvz9pehBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya0w5Pm8lt2K4enA1pVPf8WWJQx24SVk5IOLZ248c+8=;
 b=uFoq7hXXqmLDmvUsEbKSlf5GzddU6/9bUX/vcexyJvsmP/3+BEl3t5OG8byji9hesNoDSuI8NUxPDo6y+P/7Lg0fs/kKfXvhRrnlWa+0wZ+PqZ7YgREEfxDOX7tAfeMDGJwBThEWFN5xN7B2R9GFJYGxpzXbqb4UGhu2+DcF4W4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
Subject: Re: [PATCH 11/16] x86/P2M: derive a HVM-only variant from
 __get_gfn_type_access()
Thread-Topic: [PATCH 11/16] x86/P2M: derive a HVM-only variant from
 __get_gfn_type_access()
Thread-Index: AQHXcbiZRXYa712FeEi5bV+pycTuo6yUhy4A
Date: Mon, 14 Feb 2022 15:12:51 +0000
Message-ID: <1E368B6E-A3E4-4A43-8CBE-6213D302C6F1@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <a940e734-75ae-2660-7b2a-9b426437c48a@suse.com>
In-Reply-To: <a940e734-75ae-2660-7b2a-9b426437c48a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc50b30c-20dd-4a08-36f5-08d9efcc7805
x-ms-traffictypediagnostic: BYAPR03MB3863:EE_
x-microsoft-antispam-prvs: <BYAPR03MB3863DBF6DF018157F58D82FE99339@BYAPR03MB3863.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjQ99VqkvfYqOrK/hYFhgBl5dbVQ7Z2wPHTyq5kCb0vW4pg+kgA9DA2ubqlZ84Eb6F1y23CDTlOoubluChSUaNRE57edqlAl0acyCQhV2p89FmyZ72dMzXw7HceeCaqWKoz2NDc59cajoAnsa7jtNitpC1GnJR9Js4bZUOlOo5BKAb4y7EA09+k0siOgV44gDC6qnKKgFF7WlWEQ1/U6rg6MMVXvj6ycC/pmuffPdsjVFabFAlXig/4xt45HZjVZEpvKuNnFQj59sj4fI7gjtfIr/4ATT8o7HSZtBL3ZIMGFaWqH/ec0NOiVKdAJG+qBWlP+FrT4uFsztvV7c/ZgyyYupLpl6YNtxplBzubnqVZyaLzOhN/PmWB1uByeANnPsDO4zKVcXZPNGUfUkfL4TN1/FJKe0B26sw2Z6O/IN8QRBRIAeynEYofcNnkPDIHdjjkC2TvulHTxnBuh51n8oexLLSte8/CquleCCx6HgyGcFiXXfUPrLUSRaMFz6QLm45qw/YeKJj9kIYVHeDb5KmIO43Edu/RMkiOEc60sm0jRNFW3pfSpUJQ6e15eEjtmGIlDqCtvhUOFkRDnDyd9HnZ7H19RTuKarYkfUthATezOC3aZgbgE0+fdM15HsJDUyIcgXyB3yjcPn4xdtpP5wMFUW3yOTN+nxBv4KYWaQbJQUu6SrXl/jWEkVJDCPS7BxfcYiN95/ejTeDobt/3m1FuSniMxQTCZRW5dtLoADAc4Oe+tHOskfCnIcR/MNQbU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(99936003)(186003)(4744005)(4326008)(8936002)(66476007)(66946007)(66556008)(66446008)(64756008)(2906002)(5660300002)(38070700005)(76116006)(91956017)(33656002)(36756003)(86362001)(8676002)(82960400001)(122000001)(38100700002)(508600001)(83380400001)(71200400001)(6512007)(2616005)(26005)(6486002)(316002)(54906003)(6916009)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0ZETThYYVZIRXp2eGtEeHRKV3AvUk1WMUpEYVFvdlNmQkV6MVVLSEVjbC9U?=
 =?utf-8?B?ZWFsSzZ2NGI3Um9MVFhnb3Z3M2d3d3o2WTVFeUliLzlGTlloWGxVc3RLQTU5?=
 =?utf-8?B?WnpvK0RKc0VoOXNMSW5ac2tYUTVzZUdKdklPcEU3RzZXU2ZSZzZCTnc2WVY2?=
 =?utf-8?B?VFpYbm0xYUtINHdrSGc3NEowTVJISzY4Q3VweG1RTmZ0VElUV2xSczRGQTV3?=
 =?utf-8?B?akl2MFhucHpEQ2dlb0dvV2FRanNzVkE1bUc5MEdWcmMyWU52VWFWZjVEK0My?=
 =?utf-8?B?bkhQQmRtMmFFck5nTzc5ZFlIQ2VVcnNXQnRHU2RDZEhHWHVHdVRJOXJuUTRj?=
 =?utf-8?B?UUNMMEtjN2paK1ZNcHd2b2Rma0dKZzZxRm5LdU5sS3VXTkRyeUxVbG12QmtO?=
 =?utf-8?B?S1FYdTVWY25Fb2F5TVJWZ2xUY1RFcEFlVmZJbzkvdExCWWhxa3IvQndpVjZG?=
 =?utf-8?B?aFZrYTJYMzI3MW14eUZzRzJObVEyZjNmQ1l0VHdJNlgwYjFpbmdsQWlGV21U?=
 =?utf-8?B?QWkxdE13VDBjSTlkSERxemVTcThoclQzNHhQMWwwU1UxUmN1LzVxN3VUMlBW?=
 =?utf-8?B?bGFpN1ZPQy91SUJXbGY0UUhBUFpYamhHOStRa2R4bDlob3hnMmJQYWJFb2E3?=
 =?utf-8?B?RFZMTkxrWFFMOVNiWEtONVplbXZ3dm1acVVPYnhQVjF6N0JXMGIxeWE1OXIw?=
 =?utf-8?B?RjZHUUI5bEFGRjlsbjR3ZVhPL0kxVE45ZlNCR1ZtWHBrcVZmK0xYOGg0eWVR?=
 =?utf-8?B?NWo3NHE0Q0pVamZxMVFrN2lhUitjY254OHpLWGcvSm5vMHVXNStmeVNGNmYv?=
 =?utf-8?B?aUZ5d3ptQ3A3NXJzQy8xMUpTMFN1MnRnUFd6RmMzVTFHZk5rR0EwUUg1M3lp?=
 =?utf-8?B?djBybys1L1N1SEkrRlFHa3ZHUUI3ZS90ZnN2R2dXako4eitCcDBMWm1oRlhj?=
 =?utf-8?B?cFFDRG44ZmNhN2dEbVBhT21HRWEvd0EwRFNiTVhqS3d3NGJzakhWU3FWaEpv?=
 =?utf-8?B?TVdXVzFpMkJzRWMxNVY4MmJMNHlERlI5c0RIbm5yUERBcmdkTTdJRXpwaGdw?=
 =?utf-8?B?OUE2U0dzVVgxTUc5WVN0R3hid0sySi9XTmFObklPK0F1a3FtcnFKeHZTQ3NL?=
 =?utf-8?B?SG1pakhSbTRudDJSbVdaRkFKWlRkdGw5aWNRMllXSmJVUEM2bFVldHlUUWxK?=
 =?utf-8?B?dk5zYjNjN1kwSzVydDVTbHdtK3c0aHB2QzVNbXhyN2RHS3JHa25MamRKbXMz?=
 =?utf-8?B?cWp4T2hiMnJoV3FHUHZxYjVSYkVwZVFGNm1ML2h3TEtuRjFqNEF4ek1VZXJZ?=
 =?utf-8?B?TnRhZzB3WjBuZG1XVllZRVVWZElwK3o2U01oT0NnN3FGN0tySWViSTVuM1p0?=
 =?utf-8?B?UFFiTUVPZ29LeHZwZ09WenlRK0w0UkhPVUxjeXZUcXpTRThsSUM4eWxsaUNP?=
 =?utf-8?B?SFFBVkdqWWM5TDRxdUx3SCtpWXRMeFgxTXlmc1FNanpNc3NSNUFYVHR2TjUy?=
 =?utf-8?B?WWU5T0I4dXdHWEY2VWZMVHJQWUx5YVBDTXgwWFVyMHJOaDREWloyS0ovS0pB?=
 =?utf-8?B?c1FpaG5LKzlQQzJ5eXBHUUpLZnpXN3Yvd3BUU0F2cnRUZndKalhwcklQbDZu?=
 =?utf-8?B?ek5ZZ1RBQm4wTW5GSUFoVUVOYVRpVkZlK2dhZWJQbSsvMU1sdDh2ZVBOdG1T?=
 =?utf-8?B?WjVsQ3RsUS94SFhmVXpHUDZNL1EySnAvNTBaN240UkcvMW44MUtmWndDa3Fs?=
 =?utf-8?B?YjhDWVBTcEliMVVTcnMwaG9xTzk1ZEpwbjZxQ3hKS3dPYVNIY08yT0lLNXdz?=
 =?utf-8?B?bE96c212THFmdERKUi8xbzQwM21salZrektPYlBINE5PR2MyKzBOdW5wSFRP?=
 =?utf-8?B?VFh2bjZ0aDlmTUNjZUZ4Z0Y0Qk1CU09xS0tzSjJVdERXaEswMGtxTldYMCto?=
 =?utf-8?B?Z1ZaTUdoWWpFeUVDeDhQUEhOYVl4ZjR0b256T0FYWmZRS1E3MGpBTHhaaHds?=
 =?utf-8?B?Qk84RVA5ZTJYQzRlM0JYUnFweWZ6VG9HeGJHcnpMNFdkVjFaZHltUUR4dHRZ?=
 =?utf-8?B?aEJaaUVMOW5DY3NBbHBsREU0NklPUVVTZit4QXUyZldiZEk4TUgvWjdjQmhY?=
 =?utf-8?B?eXhhY3JUTkl5WHBLaFBud3g5cExrTWNpNWlzUDc3dTVTSlBaOHRHYkE3OGYz?=
 =?utf-8?B?UkMzL1psWGVXUnlTbUpOQjFzVk1CMkd5ZzRDK2pFR1V0NHltUDAwdWQ4bktJ?=
 =?utf-8?Q?/kaBdpgsXqzbODbhEsmvnLZAzZqv9zNuK8T100MSyI=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A0C6E35E-7A05-4186-86A8-B3E2BE053133";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc50b30c-20dd-4a08-36f5-08d9efcc7805
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:12:51.4204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVKk6Fypd0Kg4A+d27cqy8yJh/Xyo+kPNanjY2+bz0+9nXPykmjqCVUAl7YlrWJcDXXJIM0IZm5CSHA+qGm6IxC7KGZhKyPofzZdgwCRft8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3863
X-OriginatorOrg: citrix.com

--Apple-Mail=_A0C6E35E-7A05-4186-86A8-B3E2BE053133
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jul 5, 2021, at 5:12 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> Introduce an inline wrapper dealing with the non-translated-domain =
case,
> while stripping that logic from the main function, which gets renamed =
to
> p2m_get_gfn_type_access(). HVM-only callers can then directly use the
> main function.
>=20
> Along with renaming the main function also make its and the new inline
> helper's GFN parameters type-safe.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Nit in the title: I read =E2=80=9CHVM=E2=80=9D as =E2=80=9Caych vee =
emm=E2=80=9D, and so I use =E2=80=98an=E2=80=99 before it rather than =
=E2=80=98a=E2=80=99; i.e., =E2=80=9Cderive an HVM-only=E2=80=A6=E2=80=9D

I feel obligated to mention it but I=E2=80=99ll leave it to you whether =
you want to change it or not:

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_A0C6E35E-7A05-4186-86A8-B3E2BE053133
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKcWoACgkQshXHp8eE
G+1Sagf/WBs6HEbDQXnFX6nC78dTkRaShDGlN/xALtYEeIgbDHmvL8nLB3RGOJ3n
EAWmIcWPXlKaGwBFPsJbOc9rQHXW4grTClBIZGYXrsoURl2kf1rDRo8fYIO1YtcJ
exMoxyeAs/5eEynOh1l2CyNS2cJxgEH6AhjbYQIBYHvXVs/WajYsgNGKecX+ILAf
/HBvu1B7kefQJlyAbyL6dRVH020rIWKqgHFCVhc4bQY83djsI6Ac4IxwMYxabL/1
CrTxlK9DqY5lsx9Y3WvcZ8HPtcim8mtVjJGqvxhaFbDfmRGIY10xyTdkaTmIDRN/
bwLm2QRHz3LC53WPIvpfxD/pF0zftA==
=5lJg
-----END PGP SIGNATURE-----

--Apple-Mail=_A0C6E35E-7A05-4186-86A8-B3E2BE053133--

