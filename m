Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33C44EECF4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 14:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297357.506512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naG9u-0007eg-RB; Fri, 01 Apr 2022 12:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297357.506512; Fri, 01 Apr 2022 12:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naG9u-0007bc-NY; Fri, 01 Apr 2022 12:13:42 +0000
Received: by outflank-mailman (input) for mailman id 297357;
 Fri, 01 Apr 2022 12:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MEhg=UL=citrix.com=prvs=083735472=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1naG9s-0007bW-SX
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 12:13:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29181b7d-b1b5-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 14:13:39 +0200 (CEST)
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
X-Inumbo-ID: 29181b7d-b1b5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648815219;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=faJF7Jitm0ep8Thv1crZvBWWE0xHa31Yovold151imk=;
  b=JLLEzhEdiYMllQ47EC1qQ9NppU8A5B/uWUDXkV5QmzPlLvU/hfMU2ERO
   L2EyQ8k06WHQLU5/KvGgeEITXblR71l+gZMuGMpLsXP90C2Y3AsHzy2jl
   gp4RGB6HhYxQ1t5Mqij5wJSkM03xiAkbox/pnw0HtVIP4OVpp0f7E2xJP
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67659974
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+gnXjq0s63kY9IQglPbD5UJxkn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/218B4Fu5bWyNFmGgts/3ozFHhD+ZqZXI/IJxf+NX+bd5PIFhlut
 s4VNYSYd5tuFnPRqxuna+O+8il3jPnWHeHwYAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 Put+ZKENQX5imMpOGxJ4a/e8Rg+5vmvszhA5FVgNakR4A6CmyEZAqxEKPDqJRMUYGX18s1W5
 Qrn5Ovklo8M1051UrtJqp6iLgtSBOS60TGm0hK6YYD76vR5jnF0g/5T2MY0Mx8N0W3Vx4kpk
 r2hiLTrIesXFvyU8Agie0Ew/xFWZcWqL5eefBBTGeTKp6H3WyOEL8dGVSnaDqVBkgpDOklc9
 ORwFdw4Rkvra9RaYl6MYrIEaswLdKEHNW6E051q5Wmx4f0OGfgvT0hWjDPxMfhZas1mRJ7ji
 8QlhTVHQR7/RSdFZnQuVpclxcyl1nb/LidEkQfAzUY3yzC7IA1Z1bHsNJzee8CQRNUTlUGdz
 o7E1z2nWFdAboXZkGfbtCL37gPMtXqTtIY6O7C/7PFnxnGOwGgaEDUdVEehoOn/gUm7Mz5aA
 xJLpHd//PdunKCtZvrvUwWajnW/hzURVOpgHuM75CqEy5OBtm51AUBbF2UcObTKrvQeWjgCx
 lKP2dTzClRHqLSITVqN+7HSqim9UQA3B2IfYS4PTSMe/sLu5oo0i3rnXttlVaK4kNDxMTXx2
 CyR6jgzga0JiswG3Ln9+krI6w9AvbCQEFRzvF+OGDv4sEUpP+ZJerBE93D258lmFozFbWDfu
 WNdsMXO4+BTF420wXnlrPo2IJml4POMMTv5iFFpHoU8+znFx0NPbby88xkleh43b59slSvBJ
 RaK5FgPvMM70G6CN/cfXm6nNyg9IUEM//zBX+ucUNdBa4MZmOSvrHA3Ph74M4wAfSERfUAD1
 XWzLJ7E4ZUyU/0PIN+KqwE1i+BDKscWnz+7eHwD5077uYdynVbMIVv/DHOAb/oi8ISPqxjP/
 tBUOqOikksDALKjOHOPoN9OcDjmyETX47is9KS7kcbZf2Jb9JwJUaeNkdvNhaQ790iqqgs41
 i7kARIJoLYOrXbGNR+LehhehEDHBv5CQYYAFXV0Zz6AgiF7Ca72tft3X8ZnLNEPqb04pdYpH
 qZtRil1KqkWItgx029GNseVQU0LXEnDuD9iyAL+PmBlJsQwFlGRkjImFyO2nBQz4uOMnZZWi
 5Wr1x/BQIpFQAJnDc3Mb+mowU/3tn8Y8N+elWORSjWPUC0AKLRXFhE=
IronPort-HdrOrdr: A9a23:IVysw6En483tMYkGpLqFWZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVoMkmsiaKdgLNhcYtKOTOJhILGFvAa0WKP+UyCJ8S6zJ8m6U
 4CSdkwNDSTNykDsS+S2mDReLxAoOVvsprY/ts2p00dFD2CAJsQizuRfzzrdHGeMzM2YqbReq
 DshPZvln6FQzA6f867Dn4KU6zovNvQjq/rZhYAGloO9BSOpSnA0s+1LzGomjMlFx9fy7Yr9m
 bI1ybj4L+4jv29whjAk0fO8pVtnsf7wNcrPr3MtiFVEESttu+bXvUiZ1SwhkFxnAhp0idvrD
 D4mWZiAy200QKXQoj6m2qq5+Cq6kdQ15ar8y7nvZKkm72geNtyMbswuatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAgqqIlyUBS4NL7okYvGLf2UoUh5bD3PXklZKsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blngR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjia2jPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjTT4A21rep2Gzz2MReAtG7Wu7JjDrBCy8jBeIY=
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="asc'?scan'208";a="67659974"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzHwBw97K6F03QBqi306GCb964/mwFTh/r5wUQG/lJLWB9NZ3laXPtXiEq0Nb6eso1YUHo6VCV3RI6Pkzy8vCu+KFVdACbwL/SHnHlHr9DT6LbLxQdkmQMLXxhiAIMsQRrGnS49xlnFv9syBOhxkiWs0jxU+hg2Ss+nJa1dPhQ+wQJdt8Fehtlc7zvFVXSfImcE0PKCKUB3rKKtT7nOyge0QqJoXHkCvdjmN0oOWsOE1Gq7QUhjRKjUiMotV3wjdOLQso9xzOYol+uCmBW6H456OX0EIocn1LdVCgmo47r+doJG4bf9ZjRJWbz4NmpufOahrx65FVhuSDj7eeQSPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAEGxWNXFtU3HbhhGY8KRY4ZPiqwIdf93K87XmZBux0=;
 b=jxk8ok3Zv3gJGA4dzUq5MVRzJER3HIc8DsXNl7DpHqFQi/40OpsKOyvTrav9X7Lh5JI+rz1PXnZOFgE04CnXvowejHwxV74nv03SaLsqUWz8oet2g5SzAp3+Pn1p5Lwcn9xw/6m++Eb1CMLdN+qBHHlyw7VMsW37xLjc4LhmqByhP3CP3OY5mkRJcPzq1xj/wejCFsbFe+ywApUHpx+Lu79ALRzDsg1gkZJtWp3wUI24gR1T57WIZA7sbBe/2vcnJwDc9EfINO74lX95GNaJYm/TdVQ5SLE8hb8yhwaGv6fKqX34s6vlpwSbsPw6v9CiObncCJ66Ftbp7R5yRuQdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAEGxWNXFtU3HbhhGY8KRY4ZPiqwIdf93K87XmZBux0=;
 b=bqcSEmaAVP/SqT9zHaIZiwMnRpgyxdPrH2nh8kvMFlxPyxXNfwWat24ap+TCF0Q5F1eMxfeQh7I9fa4B8RopZt7TGd4pHk2xhn26uCnPYqiAPHVuRnZ+ASDP0orAyCtKsGj5dZFSiB7/KYdj1TtpekqxSTtMl0ipQBycVIgwh7g=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 04/14] x86/mm: split set_identity_p2m_entry() into PV
 and HVM parts
Thread-Topic: [PATCH v2 04/14] x86/mm: split set_identity_p2m_entry() into PV
 and HVM parts
Thread-Index: AQHYKM53Hk2TW/bmsEWEq3Un0PVcU6zbMjKA
Date: Fri, 1 Apr 2022 12:13:34 +0000
Message-ID: <86F5ABBA-C4AA-4F02-944D-6210D65CC16E@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
In-Reply-To: <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b4ffbed-bda8-4097-cb32-08da13d90b86
x-ms-traffictypediagnostic: BN7PR03MB3553:EE_
x-microsoft-antispam-prvs: <BN7PR03MB3553523869DF3B64EAF3AF9199E09@BN7PR03MB3553.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QMNycv0RAAHEu/pJ1b2UNfz5JW9NxKIF5V7u4ZaqPYsrX4aM0oljZSonBuFbhH6Pg10OokBd9r4UO8Y0Mw4Z6zroqnZ2uprMJX9qfwk4angL/t5N6MCW12u4p1B9UgbcY/iCmZonqa/UhA2fQNFSNZKNljFUhRxS1DovqKsY1dOzktmxjBJ6LsfX/dEGjFIfBz7O+pCNTLJjqe2b/QEdcb9qFrqXvwfxdFxPfkovYlBm3uS1KMNiXtEZC4guhbh993oZ7kc963LmP/IAbSLEulolF/A5gBdOcgFXlGIlYPrgPFj2Pa87F4nuQojpmvg2pm8vprtIJc8+htpvE77XDSlsc204CTib4qHQJzgQW3A75gJfC9eF74Z7YBq/xwUzPPtQTVv2tbah67De6H25xOGv9JRZnyRzjfF+PjMX7ZMF140FLeIStvoOUf1L7RJ688gtShcIZCmnPYnJBIYmXdPyswhPXcaNffcdi6cwlNdYI9IM5+jnLM/DymHuudsb9T9br4u5LjCDB4qQm3mVNyrQvobAq7SBzVS0+DEpOV84BcfF8N9v1fw7nseKIq4cXpgQZyAD6Y3JS4pkdmRc0lG8eRK9RRNZe2b3Lr3iJb5L02Lyd0mK1Koh95sxlDQ3ai3K5WO3lUa6d545pQfhWZ/gfik9XOj11j2fBM9e5Cxj00U3+ZfgWJomY3Z8jRSF8ni5nW4sQoap2JP61ONRx+bBk87lobE0WQ/qp99gdaK64JdsJjFgeo41L6NCkaqUyW5kq1RZ0cTP5Qa2jAwgIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(66446008)(66476007)(66556008)(76116006)(66946007)(64756008)(4326008)(8676002)(71200400001)(33656002)(91956017)(6486002)(508600001)(186003)(86362001)(6512007)(26005)(2616005)(2906002)(122000001)(38100700002)(99936003)(38070700005)(82960400001)(4744005)(53546011)(6506007)(36756003)(54906003)(6916009)(316002)(70780200001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDRLZ1FnRUttU3BpL3ZpOTQ5ZHRlVmJCQ3puKzNQc2FLNWh5dWUveU1ZdlF4?=
 =?utf-8?B?Zi9tSk05NWVNOC9obzZsdFl2S1lKL3NIem50c0dzYldrTTh5T2xGNUZqMFJu?=
 =?utf-8?B?Z2RoVTFPYUx2NjJ3U3E5U3FONXVlZnhkQVNiWmJCU2hKVFlwaXY0em9QZTVZ?=
 =?utf-8?B?TlpQV0Fkbjh6RERsVmVRd3hVNk5kMklPK1lwMTh2UnpOOWlYTmZNdWFLNXJa?=
 =?utf-8?B?YU1YdWpVVlRuUklrSE45Z3RmVTEzUVRmMC9FSThibitraGxWblptMjJwWEln?=
 =?utf-8?B?TittK3VUOXFBUXI5Z2YveTJNOW8rZnZOT25UUkpsdmVDRjZUT2xnQnRycyth?=
 =?utf-8?B?cTdBM1YvS1g1MjV6UHpVbTk1TWdDNzFDd1NhNExYQklTWXNXQkllaFFwNG1T?=
 =?utf-8?B?Qk5WUjIwSnBQazlzRGIzWXA1V3ZWQTNVUEpWUWNLU3V5bW9nWGNQalFWV0xz?=
 =?utf-8?B?LzEzN3R0OFpsb29ad2NsS0pVUDRvY1BDcE85UG43YlZCUUVkNXZEcVN4dUJs?=
 =?utf-8?B?RWFwYVRtdnp0a2RvaWpMZ2kwMENLdVR0UjlZMlhnYjBteWdVSmpCOVVnOHFB?=
 =?utf-8?B?NnhCQ2M5bXdsaC9nUTdXZmpiSGVkejFXNnlqNFBnb2hmOFY0MVY2WDI1emh2?=
 =?utf-8?B?STBsT0g4VEd4Q01jaXRHbDhHcXZOcEdsV09wNEtiMWxHZ3VOZFJja1hJNStD?=
 =?utf-8?B?YmhOOWZrWWc0QWVsMGFLdkVmSnRFQ0FIckdOWUU5STJIMlAvVzNXYzFsdGZw?=
 =?utf-8?B?cXJSOWlRRWxRcEQxVkFETzhwZjlHdzJrOFE3MWdTK2FCNGpqelUyMUFHbm91?=
 =?utf-8?B?SmtFTHE1SDNUcHpMdFhUbWI0R2xlcU53ZmFvc1ZIeGJXOHpudTRtbnZyUUxn?=
 =?utf-8?B?K0hWUUpLanVlUU54bDl6alNuQmlpcmdjcWo4bEZON1RBTFNhSzNjV0V5aDdr?=
 =?utf-8?B?VkdVclhMbUd4cU5pQnhURWZzemdpMVhxOXluUVJzT0hPVXdPbEpRWXZESmVT?=
 =?utf-8?B?bnFLZlVmbWpjSU1pdU9sbnFOZzJDVFdjOGV6MGZHMVVJR2NMSkRYdWNmTWxo?=
 =?utf-8?B?cHliRG1ZYmtVNm9wbmpwN0VodWxTUUtGQXlnZExNWXhDamtmY3RIcWkzSUE2?=
 =?utf-8?B?ZXQ1R3lPa2RaNVhxSmc0amJaRmRncldYNkN5N21QejI0OEJ0RjJVQ3JjRVBN?=
 =?utf-8?B?b2hPOVNmQ01QRTV3dHN2S2V6Y0c3aUl3UW5xQ2xmdSsreklMZ3p6WTk0TVlC?=
 =?utf-8?B?Y0R1cXFuRWpIaDFKbEdrdzQvWEorNWxwdlZacXhEWFFYRzBtWGE3cVdUWDRo?=
 =?utf-8?B?UmtBRHNiWDZPSVl2OEZUVjlTYmNzZStPUFhqNklXKzZ5WXRwWmtDcGZWOHA2?=
 =?utf-8?B?WUt2YVdmTGZYWmpCSTIvNm8yY01yRGxDWnhQNXJxbUdnQUFRQUl6aU1xVWhH?=
 =?utf-8?B?MWFuWUVmR2FFeTFwU1lWY1A4WUlmRERGWlltaVd1amJoeVdkRng2aWRITjc4?=
 =?utf-8?B?MG9YaXJEelRSTkc5WnZQeU4vNVRLc1pIemkwcklkQmx6Zk9BNFh5V3pjWGd4?=
 =?utf-8?B?LytSSTZxdTc4cVY0NWF0SmcyN1M2U1Z1c0wrWVFjVGt2Mkh5Zm85bCs2M3d3?=
 =?utf-8?B?dnRCcUZQVG9SbWNBSE1HK1hmNkZaekhKc1l1cURYVnRwN3grclRHNHpEMEp2?=
 =?utf-8?B?QzYxN0doVWdLNm4yZzUxa0xpOW9sV0h6ZEkzcFNITnZoVWNWS21wQUFKeEFX?=
 =?utf-8?B?dDVvd2sxSE9YRlhLRjBCeHRQWEFDVUlsNnBFcnRjcDJHbldKSURpaHZScEsv?=
 =?utf-8?B?elVoMm5ab2kxaDhkZFBzanZjb2g1TFI1TGlXdmlNWm9NWWoyVS93QzdHNjEx?=
 =?utf-8?B?WGs2WnRwQ2U5TWR3TGpIUzBab1VKQ1lhdDFjSzFsaHlZTHJBeGNKVlRTZHEx?=
 =?utf-8?B?RGpteGkwTTJZdHlUMGxmNUYrWS9pbUcxUEFkZTA4QjhKNlVDb1pDMFJYbW54?=
 =?utf-8?B?WUtFeUhHV01mMlYxd0RSaU5JVVJMb280VkZsc2VEaDVHMDBtKzB1R1YybjBB?=
 =?utf-8?B?TGJxVHFlYVBOV3oyTUJzdml6ekNKdzhoL0NNTVhrQW9BZDBZSW90ZTROdmJR?=
 =?utf-8?B?OUpab0tmUnVjaU0vYlE2a0dKQ2NuMU1pN0RVTVExMlZkZVF0TDcwUUhHLzcv?=
 =?utf-8?B?Y1NBdVlWMCtnaDlZeWs2eThzWWU0dXNGV3haZFB6bDhUbW11Z1o4YlBiTXFY?=
 =?utf-8?B?ZE0yd2dldE1ZeXJaWCszai8xTnAzMExyZTRxQ01GbjVDU2dhakZnM1B4cjdZ?=
 =?utf-8?B?QTg0VFV2T2RnY2s0TGlPU1Q2UmkxS1V6VE9STDNxQU05Y0ovb3R4MUcvanRx?=
 =?utf-8?Q?QrJuUMebZ/nKsKII=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_822F42B9-846B-42B2-AF8C-894124EDCAB3";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4ffbed-bda8-4097-cb32-08da13d90b86
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 12:13:34.7623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOwUHxvL6VrP/HbruIYYTk9Q9AI8xPoJOK+fXC53BbLsxR/+TN2pnDJ7/6LHNCglTkgjTV/3J8sZLTRO8o4ItbYOEkMZNzfLo7xXGEnV2nY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3553
X-OriginatorOrg: citrix.com

--Apple-Mail=_822F42B9-846B-42B2-AF8C-894124EDCAB3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 23, 2022, at 3:59 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> ..., moving the former into the new physmap.c. Also call the new
> functions directly from arch_iommu_hwdom_init() and
> vpci_make_msix_hole(), as the PV/HVM split is explicit there.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: George Dunlap <george.dunlap@ctirix.com>

=E2=80=9Ccitrix=E2=80=9D is spelled wrong in the email address =E2=80=94 =
not sure whether it=E2=80=99s my typo or yours. :-)

> ---
> v2: Change arch_iommu_hwdom_init() and vpci_make_msix_hole().

I think the R-b should probably have been dropped for this change, but =
in any case:

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_822F42B9-846B-42B2-AF8C-894124EDCAB3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJG7G4ACgkQshXHp8eE
G+2PcwgAi1pyCGVqdohSMaogNBHz9O+LPIFbX++8sFi6ubJdu8c2m/EFnuNki1vP
AFX8sFw8Ax9LEaBGipCClou89i6vQ9cQz+SBoawFGiHfHIrEO5yqQbAelPlR0+kW
UNqrvCw4GN82rTm1q1maHm+c4phGSy2kFCya+HFmlvhTTlDQgfi93L4wkue9CdBp
A+eAf7rk/IqTPurMrwKAvkDeEpFgH+gNnk9FqET2Q9VK7lHJASvnRoP5DQKLb1VW
DfgPXgpbPhP+nkjdJA+uVnRdkyeYnVfBWJy4CR07tEUdTJ0n5wK8ne5TZqOD9uWS
UWY1bPevNQY+Zt/E9zPZ6/ON6k78Pw==
=9pxz
-----END PGP SIGNATURE-----

--Apple-Mail=_822F42B9-846B-42B2-AF8C-894124EDCAB3--

