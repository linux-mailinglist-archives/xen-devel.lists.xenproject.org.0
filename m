Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E658B4ED811
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 12:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296883.505521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZsVs-000896-Vr; Thu, 31 Mar 2022 10:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296883.505521; Thu, 31 Mar 2022 10:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZsVs-00086V-Sx; Thu, 31 Mar 2022 10:58:48 +0000
Received: by outflank-mailman (input) for mailman id 296883;
 Thu, 31 Mar 2022 10:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxtd=UK=citrix.com=prvs=0827c5e47=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nZsVr-00086P-NR
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 10:58:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87f5eaeb-b0e1-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 12:58:45 +0200 (CEST)
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
X-Inumbo-ID: 87f5eaeb-b0e1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648724325;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ax6YuIQ+H1vrl0gmBoICT37b/vsZoAfrOZoI50BgVEY=;
  b=DxOvF4n2x6uOyt+NerwEuiuGn/rK7BdCGOPIv6ppoR8uCxH/wTGWrKI4
   gENsQlGH55sWAGBzLnbjeIGYmIySzczLUIPGkzso9WAXNOO2H937PJWei
   lhXqJGNKY9yTHCEqs55fu6vJUpuzFsTeqk9iuglPvkV6Sztv+1dmR3nLj
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68047193
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AGywR6yIIFpliTSK2jJ6t+eBxirEfRIJ4+MujC+fZmUNrF6WrkUAy
 msXCj2EaKyJMWb2L4xwa4rloExX75eHztYwTwBvrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2oHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6LOcQyxuZbXwx+EBcxtDSwhzF7V00eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DHooZtzdFxDXQCf8gTLjIQrnQ5M8e1zA17ixLNaiOP
 5ZGMGs0BPjGSzdjZkUYGrgapduXq1mgWSd4hVu+urVitgA/yyQuieOwYbI5YOeie8JRmUqJo
 3PcyE7wCBoaKd+3xCKM9zSngeqntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTifO0kFKkUtRTb
 Ukd4DMzrLMa/VauCNL6WnWQo3OavxhaR9tZFcU77h2Azuzf5APxLmoZSHhHYd8vts4zTBQr0
 EOEm5XiAjkHmKKRYWKQ8PGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnYw
 T+QqzMlr64OlsNN3KK+lXjFnjatq57hXgMzoALNUQqN7Al0eYqkbIyA8kXA4LBLK4Pxc7Wal
 CFawY7EtrlIVMzT0nzWKAkQIF23z6uqHDf3xgV3I8Yk6xSv4CaKcKpI0hgrcS+FLf04UTPuZ
 UbSvyZY65lSIGamYMdLXm6hNyg55fO+TIq4D5g4evILO8EsL1HfoEmCcGbKhwjQfF4QfbbT0
 HtxWeKlFj4kBKtu11JarM9NgOZwlkjSKY4+LK0XLihLM5LDPBZ5qp9faTNii9zVCove+m05F
 P4Fa6O3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaOBn+18JNI/wvsI/gstw
 p1bchUCoLYYrSeaQThml1g5MO+/NXqBhSxT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYvJ
 8Tpj/6oW6wVIhyeomx1RcCk8ORKKUT67SrTbnHNSGVuIPZdq/nhp4aMkv3Hr3JVUEJadKIW/
 tWd6+8sacFdH147VpaHNarHIpHYlSF1pd+elnDge7F7UE7t7JJrO2r2iPo2KNsLMhLN2n2R0
 AP+PPvSjbClT1MdmDURuZ25kg==
IronPort-HdrOrdr: A9a23:SG5gnahFgsFXXGRKSnk4gRYJNnBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="68047193"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNv9CtVd/Md1/3VA9Td9dQC+vr8XFjlMb7p5dDQRLGkskVZkcYQaWKMnkN8HeOlyH26s6JRifR28bPIEF2ZyrIvd1KSsQJ9e6YccLFJKjsUGDdM4aFJeWYKhsjPK4dTfsXAZWSEVry6LwQiYRUW0tPuYkafKY1VsC4Jt3NQmP+GsbIydZsqViQw5bS2rMgnaieEgM3r7gkKUbRaJv2ZoB+6ydPh7wzvO281i500A6EhvVlptHiMoyfFssUvjUwaOrLTVLeIhFCLpYXRnzq89RYjFyqnbuhfrCGXP+FRfh9a1zAQ92GuE42BiDzMRZwA8dbDj/GArUXud1JtBO79Gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax6YuIQ+H1vrl0gmBoICT37b/vsZoAfrOZoI50BgVEY=;
 b=gVJjGsjHeWvVbwx/jJ56QJ16xmFsZOAqaK8QdrMcjyMLpqbyRVuy6kpEGf2AGrl/xrUk0ReSWuPkoy1hMMWFFZRqUFi/7xjpoRrwFS8TLlbG3PvPN7Gw2ShyqhQIJeDRPd9/bp1Icv9XYYZfSJPSZFjztL90GJFLcNbEjTnODw7Zf4H6/Hb8MQT89z9UUWCkXdqEUNayyRFWRh9CTUvDtpcs1drOKienJ33dRLgl0uzTUoSfjhPNQi/FTm1JecJzZ3fnbT2Kd3EoYsqMP93mR0BBZ/UCBXPmGEGoVAuIv3Pyb3y+RqP99bmFEAAESqZk0Dk60TaC7oZrWrjtVwhQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ax6YuIQ+H1vrl0gmBoICT37b/vsZoAfrOZoI50BgVEY=;
 b=qo2SIIvYe3Xv7OjSajKkZM2kTAoayadYLiO8BYlI+BmDidC4Z4Kn61pGHimMT97i/cB5go16nh21EjzfeVZg4d6mwc7WpdUtchMJ36kDyrVt2A9d9JGSsaU7eXj+4MxbcNsgX8F1pmHCplgEaUj25qGdnzTQk5aUBLyGN7Esxo0=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v8 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v8 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYORYstIW/2ErvFUCgC13K5YqhFqzM4H0AgAyJ4oA=
Date: Thu, 31 Mar 2022 10:58:39 +0000
Message-ID: <258e14f7-b00f-7131-c846-6eecf04d61f5@citrix.com>
References: <20220316091315.19281-1-jane.malalane@citrix.com>
 <20220316091315.19281-2-jane.malalane@citrix.com>
 <YjsEuMBKI4Kp7kDL@Air-de-Roger>
In-Reply-To: <YjsEuMBKI4Kp7kDL@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d48c06ce-91be-442e-89e0-08da1305699f
x-ms-traffictypediagnostic: SA2PR03MB5804:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <SA2PR03MB580415126A370870ECBCF41781E19@SA2PR03MB5804.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gbO1ubP5zLUZVl71e0oQNgersT0qNDPJyAmupxY92AiovSJl6oCplbB2MMXHNJ7f3C/OkselijlCO9SdudKZfd59lj0uCtwfTAFCXaV/VGm7DWroJu9WZnKUQ1qKElkXO1cTf5xhSf7oW2MTxWIQa6KyoZfRPHEgAq1mtHkpFsMPb7HCLtbi0Y14hotcE5ZKXnePF/xrFxosmdoczqzxdsdCd8kXTPk+n8NMWNnQSeAUuzVE2Lhv4ZaXo1mdsvDU3nKUXalbUNYrOSPul2Bu7G/6liyD8GcHnZB7EmEV44XrKkqKgcX+UpRMyNrw9pwHeJ5fK8Rmo/5/MNmzfy5z0aFmJJqE0LQfHsskZNHds9xZh1MmxDgyJwRHDw7de0Zkg6droUfWi+v5532ELPtRYAmm6mzycaPhK3CvkRy0mjnCvW1CEr6R3UqqB15jXjtIIE61IekLjWdtQi2+2si4fP+1piOl/CWTyuqxu+vAiSzYy0RmTrROPPNTu4LubNJMmJfqWRe7wmtTPGLQQhT8RiwXJ6E8yogr1pCUsEDZfR8vZEQpo+2AsTVAb4tG3svDgj6iU9QLFX/2lgjiv8BD5KDj88LK63CC+xS6Q1ERoAGEy4+ccdrJW/ohpGczd2ChY7x0h4MmfFEJiz/NeIQ4XUmY+8rTb0hJBo5Iuzxts/fHQ3KeKYMJqiXM/Y2b6g/ujRytkd5aZ1DF2y8TtNAGGzQmeZ+K9AZCbF9vIMiXaLU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6636002)(55236004)(54906003)(316002)(37006003)(53546011)(38070700005)(6506007)(66946007)(76116006)(66476007)(64756008)(66446008)(66556008)(91956017)(86362001)(6512007)(83380400001)(8936002)(7416002)(31696002)(5660300002)(82960400001)(2906002)(26005)(6486002)(122000001)(6862004)(8676002)(4326008)(38100700002)(36756003)(71200400001)(508600001)(31686004)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnFxbHQ5M08yWkEwekJtMVNFSlJNSzNiWjZPWis4VGkzcEtKN3JUUjBhSVI5?=
 =?utf-8?B?RlV4b2xhYVdabFhMUGtMcUU4UUxoS2txcEh1MWljYW5UNHhoL2VnVlNSU3gx?=
 =?utf-8?B?MmlvSlZCVlpzRzc4ejE0VFMrOVFNMWtQL2Fic3RnTldETnVrUElVVUdiSElK?=
 =?utf-8?B?Q1VIbSticFRFaVlpMVlDUlAvbGpXN1JHR2FuV2hOZW1iVVNlYWhGMDY0WG83?=
 =?utf-8?B?SExXTlpqRVpxWlJ3RE52WXRUbTd1U3F4Y2ZsWXROdk5vSG9YMGFvTUZxVXlI?=
 =?utf-8?B?WXczcEFtejVtU0pqcTJOVHRPWjkzQ2dpRVhwZko5MkRLZ2hIaTJhOFFLb0JK?=
 =?utf-8?B?UmcwcVpsZ2RmVkt4R0ZWV1E1Q1ZKR1VjTWI0d21pQ0w5eWN5RktweUhtaDFu?=
 =?utf-8?B?dVp3eHh3L2lSZEtCbzlyRVAwK0MwbDl3N0UrcVZEclJLTVIvS3dwVnQrV1Ry?=
 =?utf-8?B?N2IyUUtpOGhZSnhMYmtka21vMlRlUnh2MWFDMVRpdCthVlBXMjNSbERCc0tO?=
 =?utf-8?B?dWU5NFQwRHE5YjRPQWRXZFJRR3hmWHNudWlTWlQ4NktYUEtKU2JDRnVwWUdi?=
 =?utf-8?B?WTBicVg4bnR6cnpKUlZ4MWFHMTFnZzgzYmwrM0xyaGpGdExtSkV4dklsRXdS?=
 =?utf-8?B?c25Gd29xN0J1bmswWDBCbHZYWTJkbXU1cDVRODlZY0pUUWdmMmJxSHZZUUdP?=
 =?utf-8?B?SDVlVGpYNUZYdUF0ZUtoVHhPajdVL2FxUVFVOG9GRlh1QWUxLzUxbkFISDh3?=
 =?utf-8?B?akl6TmR3dnFMQmQ3eE9nbGR6Um43REFPTElqcWdrOG5IVElrMkdHMlNPNElG?=
 =?utf-8?B?QW9CSE14Zkg4bXlYK2Vxb3FwQXAvbldlUDU0Wis0R2E2OG5zQVJtU3U4dkhI?=
 =?utf-8?B?UkVnZVZXVHJRUXFxZUVBMFBCM2hlcDh0VDdPTFkveXBhVlhFampiS2lLa1F3?=
 =?utf-8?B?RkgyWnJPWlEzV3BMZ3dxM2NETXRPalJHUVBnZWVPWEpFa2dpcWEvSjYvdEtp?=
 =?utf-8?B?WFhhTUl6NC8xTjZVSlNQeVV4LzhxNzZJdkM5c1M2V00yUkZ3dy9vdkJkT2lG?=
 =?utf-8?B?YmZaeVJkWm16NVZXT1RNQXZTeWQweHNvQ1VrU1BNZzd4SXkzcTRmMi8xcW1W?=
 =?utf-8?B?b1JrMkRkUkx0b0NZT3FjRkQ5U1hUZFdMamlSZjZaNThveEdEYjJobFBFYndl?=
 =?utf-8?B?Tk1pdms2YzFwbURaaS9YMmkrMEx2TDg1d3drenhERUxsR2UvdUFybjloQUFN?=
 =?utf-8?B?dFpoVjNpRTJqYlIwNWJkaUtNVnczM2xxK3pJZnJHUEx3V1hkYSt2eStKTlNK?=
 =?utf-8?B?UDZiOTVzWll4cTJEWDZMUmpFR0NXYUFtcUJWSnRjaTAzQlpnc2Fkc0R5Rk92?=
 =?utf-8?B?QjNjQUJwL21GSFlyQks3UEs2d3o4bjJ4VURLMlY2UTF1Y2hsZ2dNN0RRRS9m?=
 =?utf-8?B?QVlsOWE5MTRvWXQrQ1B6dTNCMjNTVytvVFNpRTRYZ01Rb0tOSGdod1NVWnBj?=
 =?utf-8?B?Y211Tk9DU0FuOFdGbnVFYjJPeGE3ZWhNdEFOVlo1SHk0VVZVMmVWbGJON2hv?=
 =?utf-8?B?cVVoU2E4ZXBPd3crVG5Rbm9zbjZwYlNLMlFRbjY0empzejB0SUsvOC9qREN1?=
 =?utf-8?B?ems4ZHc4QWZWRGRVK1VhOVpyamc0cTZ4Y09NeFBsSFNqdWs5R0J1a3RWYk1n?=
 =?utf-8?B?VVdrMFhsNXBNaUtBR241MmNETXBQMlQvMWFETS8yVVNiSm9BTUZUTHA2dUhy?=
 =?utf-8?B?bTY5UjE0R1ZQYzNzUkxGQ25jdWRiam9vdnhRV3NKZGY2aUtUTC9icUxFVzcy?=
 =?utf-8?B?eHBSb21Wd2F2Z2p3bDBJM3kvK1NzTFBGN1Avb2kwWW52bjNoOTJORkc0d3Vp?=
 =?utf-8?B?bzJkalFEL2VKaGVJZy9naE5BbDh1UVdUVTB6a2dHSm9obEx1dnpFMGcyN3hG?=
 =?utf-8?B?ZmpOMXE1aFJqNXFJMkRVd3NLcFhER0tVVFlFSEVCY2FZN3owMUlsUnN3QnRO?=
 =?utf-8?B?dllna1I4RUxmNlBUK0FVZmZjTCtKSmNNYWU4ZHFydXR6Q2xWd25vdGJPSVhK?=
 =?utf-8?B?QWMzT0d2TDRQRk14N0VzVWZiUVZtSDkvRHY0eDBSb1g1NDd4ZEY0V0hyVXFy?=
 =?utf-8?B?cGh0djV2R1JudEFwT0Mra2kyM3YwYWx2Y2NXREN1a0VXRkVTc3MrRkg3Sjcz?=
 =?utf-8?B?UTRrdnIwODZvSWpvMkhCYUpUby9nR0xzVTcrMS9PbWtOa3Z0MTlEbm91SEZk?=
 =?utf-8?B?b1NHd295TVlncFhIWDVxbUFjM1hPRHZiVlRRZXc3VFpkaW93ZlRjU3lkdXVG?=
 =?utf-8?B?OTdIWUJydnZBa25POXRwTmFEYXN1L3VSam81dW5jRXF2VGUxSU1KRXFNbHBC?=
 =?utf-8?Q?6aVtDdzDfJF3pQJE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF4DA95F3AF07C45A43618F606A7A4E7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48c06ce-91be-442e-89e0-08da1305699f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 10:58:39.3236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWXtBi122/a+fRRYjHwMVAowHn9xbdwoUJU1KMjvDCzDk5gPEccVefkhp7gQu+0xuzH8cIYxPNeRO4kWGDlbzkWn8CN8O33ttReoPfEnyl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5804
X-OriginatorOrg: citrix.com

T24gMjMvMDMvMjAyMiAxMTozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBN
YXIgMTYsIDIwMjIgYXQgMDk6MTM6MTRBTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bWNzLmMNCj4+IGluZGV4IGUxZTFmYTE0ZTYuLjc3Y2UwYjIxMjEgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZtY3MuYw0KPj4gQEAgLTM0Myw2ICszNDMsMTUgQEAgc3RhdGljIGludCB2bXhf
aW5pdF92bWNzX2NvbmZpZyhib29sIGJzcCkNCj4+ICAgICAgICAgICAgICAgTVNSX0lBMzJfVk1Y
X1BST0NCQVNFRF9DVExTMiwgJm1pc21hdGNoKTsNCj4+ICAgICAgIH0NCj4+ICAgDQo+PiArICAg
IC8qIENoZWNrIHdoZXRoZXIgaGFyZHdhcmUgc3VwcG9ydHMgYWNjZWxlcmF0ZWQgeGFwaWMgYW5k
IHgyYXBpYy4gKi8NCj4+ICsgICAgaWYgKCBic3AgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBh
c3Npc3RlZF94YXBpY19hdmFpbGFibGUgPSBjcHVfaGFzX3ZteF92aXJ0dWFsaXplX2FwaWNfYWNj
ZXNzZXM7DQo+PiArICAgICAgICBhc3Npc3RlZF94MmFwaWNfYXZhaWxhYmxlID0gY3B1X2hhc192
bXhfdmlydHVhbGl6ZV94MmFwaWNfbW9kZSAmJg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0IHx8DQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxp
dmVyeSk7DQo+PiArICAgIH0NCj4gDQo+IEknbSBhZnJhaWQgdXNpbmcgY3B1X2hhc192bXhfKiBp
cyBub3QgY29ycmVjdCBoZXJlLiBUaGUNCj4gdm14X3NlY29uZGFyeV9leGVjX2NvbnRyb2wgdmFy
aWFibGUgaGFzbid0IGJlZW4gc2V0IGhlcmUsIHNvIHlvdSB3aWxsDQo+IG5lZWQgdG8gbW92ZSB0
aG9zZSBjaGVja3MgdG8gdGhlIGVuZCBvZiB0aGUgZnVuY3Rpb24sIGFmdGVyDQo+IHZteF9zZWNv
bmRhcnlfZXhlY19jb250cm9sIGhhcyBiZWVuIHNldC4NCg0KU29ycnkgSSBtaXNzZWQgdGhhdC4g
QXMgSmFuIHByZXZpb3VzbHkgc3VnZ2VzdGVkLCBtYXliZSBJIGNvdWxkIGFsc28gDQpqdXN0IG1v
dmUgdGhpcyB0byB2bXhfdm1jc19pbml0KCkgYW5kIHRodXMgZHJvcCB0aGUgImlmICggYnNwICki
ID8NCg0KVGhhbmsgeW91LA0KDQpKYW5lLg==

