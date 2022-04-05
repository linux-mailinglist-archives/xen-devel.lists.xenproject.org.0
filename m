Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628384F2A72
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 12:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298716.508978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgtU-000341-Jp; Tue, 05 Apr 2022 10:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298716.508978; Tue, 05 Apr 2022 10:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgtU-00031T-G7; Tue, 05 Apr 2022 10:58:40 +0000
Received: by outflank-mailman (input) for mailman id 298716;
 Tue, 05 Apr 2022 10:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0KMS=UP=citrix.com=prvs=0874ecad3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nbgtS-0002UC-Qc
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 10:58:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 577f734b-b4cf-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 12:58:37 +0200 (CEST)
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
X-Inumbo-ID: 577f734b-b4cf-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649156317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nQXkbqVvO9aFaBPbtP4E4+jIi/uqOgMO+4KOZd8P4E0=;
  b=DPEithr+g44ZQhtt7XNAklMlLcCcLZuOcm+7BLaGU7du7HXekzxqqrlS
   fDeJ9tMiC/ytZat2U0YV5OoEHnWWxMd64fFgNxc6FRwFsxXVqOHZg/RUj
   G0++7q30kojLyFGTlQC69EYVpkxg2mUB1RrTOfrfKsV2s9KF/wGfu8Vbt
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68031148
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VCxZq6IWSgKeRVHKFE+Rw5UlxSXFcZb7ZxGr2PjKsXjdYENS1mBVy
 zNJC2CHPvjcM2ekfN9waYzl9kpVsMfUm4A2SQtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MsVtLDhWzoFAq3VxtoPciVjDhtdE4QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6aGP
 JNANWoHgBLoIA9vZHsxWK8HmvqvtGbndyF2h16fnP9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ0WPK218LhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJOS+wWuROw5pbU+linFEk4dSN7S/IP4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud1IWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtfABbvzt68owGOlor+p5
 iVsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8idR8zappZJWS1P
 Cc/XD+9ArcJYRNGioctPeqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlO3ONrNFKcQ5RRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:D1P8CKMEdIH9gMBcTqKjsMiBIKoaSvp037BL7SBMoHluGfBw+P
 rCoB1273XJYVUqOU3I5+ruBEDoexq1yXcf2+Us1NmZMjXbhA==
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68031148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4cG2PbO6jf0Gq/XEA524mPFFhIkQBUcAoZ4+KVvTIGe7R1bjtces2tLvAbrUA2gua8kTuOCj6yuqeIpZn/lKyox7rpVwKLtSl03AjuiyEPovxBbc0su1C1zW56CscRuAX/Cq95sl45nFWP31+Q3H708YHqWumcb1kPPK/2ifqZC2GGg2A8BangJxzc8RCd/fUaxbo/d2XGakfj2pzH4w72jE3DTm+Hcg6+fa+UGs8Mb7DnUHEAhGeYuto3drN89xr6r+hrXvPL7MfkE/g/FUKaK9Vz8fFady4Sep45dVgu/Na+7XI7dNNtYQIpFgyyB0T9V5UrHZNlkuMQtT7T/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQXkbqVvO9aFaBPbtP4E4+jIi/uqOgMO+4KOZd8P4E0=;
 b=CQiygrMxM148RAtS5IAuNEk9JxZzJR4fZysUcqldcUnx5oHhDnzat+st7dDe1KLoN9JPKYiHKw2jc+wpdz7bUw366ao7Vb9AIpsqQP4xBcC/Xlosk5zQPGCWaQiDPcEGBPAMG8W1v4SwhVPj/leSCF1dPya1yY+wuTPOImHpH1bVH9jfvSIcWoPKkQGi/2J+2PzJr4TCw0oQ5Y0iedhZu/3vcM6DIjVbzGJ7IHNRj1QO0wqhojzjWJ74kRp/UOu+YCaqTuDalfyANB1QqcHIXinhdSueITxAQ/qg0l6lBlTVUDwU/hIXToB5i/yA1uGEZ1yRV9cYp1/v+YuaTjZ+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQXkbqVvO9aFaBPbtP4E4+jIi/uqOgMO+4KOZd8P4E0=;
 b=lA3Stj6cufxGL4ighgSj4sJzpEGmy8uYxxYTEGA61oZWCHFifbSNRcFAC1uDumzO6euBD0lQTecFv4p2GCcxmKNUb85Ma98v+BvwvGyJO4QqLhkt9C3xd/aCrYQ7dXDewdooAsxvI3falfaXKtF3PxeiLJ/eDDHx7nZ4YSnRF6w=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Roger
 Pau Monne" <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Topic: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Index: AQHYRdaC1Ty1lDbR3E6vxjqdlx39GKzbI4SAgAAExYCABfjsgIAAC0sA
Date: Tue, 5 Apr 2022 10:58:32 +0000
Message-ID: <4a425427-275f-e116-66a9-78e0bfc1be36@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
 <e20b3d17-0c2a-b23f-d949-667072a54f58@citrix.com>
 <ed31e78b-087e-869b-8aa0-5d5d0f3183fd@citrix.com>
 <75bd55fa-d29b-d49e-c3db-1bb952e4578f@suse.com>
In-Reply-To: <75bd55fa-d29b-d49e-c3db-1bb952e4578f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26a5ed29-7df3-4c88-e3bd-08da16f339e5
x-ms-traffictypediagnostic: DM5PR03MB2476:EE_
x-microsoft-antispam-prvs: <DM5PR03MB24767100EBF8AFEE9FDE2A35BAE49@DM5PR03MB2476.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JUXWttSeH5T0wSVFj537W34f8SwGx8cW3a7pJ6DP57+CCjFEUF3yYFcDF5ihqUWpTRl1Qoa0wov66b2v9jrE5zq7yU2vJB/LkgljXLbbTAbB76R5dtmkujDSwJfYPSuEx9eHJyXJYdDu+zI+KGv97+OBc7cfOjjNrmcN3vZLRepeqoZaiyYgtu0micJng18e3bCJYXuJJmeatCDfloSWHs6rE2acP3mZ5xj4wFg7S0qr9hvl8xCYgqyvInD8kUhNtHEc0+dqEtdGsOt37pTWG9JF6EsHUVjptQb1ad91XCkgYOBO8TJd8ZvHegs/8Cl3aZ2kYUZ9npJzW5TyVDTFOfkjDc1sPvkvl7ZKpwvSXoEKRrevYRoBhjsdmHsCyime98jR7HHsJBk/F2LdfPRpMEzH3iMvrX474hrs/WQqvxySRLOqROEo5nRuFGfhsrbMtyw3IyObj5tNJQNX5wT3U3axAlLvmbWMNb5A5awtVT7wV3uMaKSAc3nqkHvcZ9X4T8VxJk7iw/nqufpHxwOxzBKOcdh77R7IFUTJ6quZpK/hCQrcggF+U/k7jn5yRi+4HucHscmoxqI3fDsh4fECTkzkHF22b/axLrrmiE/1yrgC5bI0yYefNWDBWCirbLqZoezMDoJNW48RtTlAcn9LSSm7h62Ed2IL3wYANmaPYKIV1thbyWj/lAoMQYp2l5fFJK1Aoglbi1HtQQ6frYjjIqfp5Tq1mQtER964ClctrtIdBA4Wf9keoLXbE2aDB2nVbulQFRdliJedDHBEIs7d+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(36756003)(186003)(64756008)(66476007)(5660300002)(54906003)(71200400001)(66556008)(38070700005)(316002)(8936002)(2616005)(38100700002)(4744005)(2906002)(66446008)(26005)(31686004)(122000001)(6916009)(86362001)(91956017)(4326008)(6506007)(6512007)(508600001)(76116006)(66946007)(8676002)(6486002)(31696002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTJUczdHRzhGQXNEVzR1SXljMmR6WVhxd0FuMTZiTy9MTXZseHZNbWgyTUg2?=
 =?utf-8?B?eTUvQ24xOGRRbWo4TDZCRnBDa2VQZXQ4QnFPOHJ4M2dwdUpoS2ZvaTRqUUZ3?=
 =?utf-8?B?MERDZUMzVkl5alBUTVI4WmM3VitQekExQmc3RmMycldUdzBIeVpWTUZMZjFY?=
 =?utf-8?B?RmFXZzQ3Z1JSVGQrdGdCSXFCcUJjdHEzMUFnR003YXJZRXNMVmtSS21iU1U5?=
 =?utf-8?B?Y0NSN051L1ZST0JqRGxQMDUvRURNS3dndnRqWHlBWlNSUysvSFYwcEZXelo4?=
 =?utf-8?B?MUpIVDZEZ1JoM3cxL0pQUysrcURXVWxhNWVBOC9CbjdRYU1qL0tGc3hyS2hI?=
 =?utf-8?B?MncveW9KSHdmc05yR1owbXNtZEF1Qk9oVEk3VVRyZitHRm9obno0cC8wallo?=
 =?utf-8?B?MERxUEdxU1A0UUxzYXJVU1YxMEtoeHF3YnR5NnZPeW9yWmk2M3ZRWVlyZmFa?=
 =?utf-8?B?YjRPcldEbFBjWHNBaE56YVp6RFRkZVZFU1FPYWxwRWQrR04yY3lFSFJMckJO?=
 =?utf-8?B?WWVFYW9aZ1FoKzFpdWMwZkF3N082aThacXZHSUUzS2l1ak5Ocng1K3BvT1Nv?=
 =?utf-8?B?cFdhazlDcHZ5aFNDTWI0MXlPZTdTOTJaU2RBMmVRRkI1S1JpNDM2NjRzSmo3?=
 =?utf-8?B?eUVtczVGUm4zNVhxWGZNRWdtc3JTd0ZRRWNlb2t5UFlTMjQvZjlKTTk2cFVR?=
 =?utf-8?B?cFdUMkxZZHYzTmEzWGN3ZUFXdjZwaXpkYlBRZEpLOCtRa0diMHlyRTRkS201?=
 =?utf-8?B?WUlUMjR2NXViVlNrY1pvMHNKVkE0NHYrMUt0ODVhQUV4bzVXeGdkbmVkdU1u?=
 =?utf-8?B?S090ekRtYXUva2tyL3BKeFcvRDg0bUlZL3loMHMzM3lRaFhwTHNtNWhaYVVn?=
 =?utf-8?B?ZmpiVWpHb2I1UTRUUHBuZStMdE02Z3dSS2VZRGhPd0FSVjlqbm5JR2ZnZ21P?=
 =?utf-8?B?RFh1d2UwS2dxdWlFbUlyVVJnblhNbzh4TS82SUM3dDN6T1VLYVlaT1o5bGVx?=
 =?utf-8?B?cEhGVnlGYmIyYjJJc2hHbzdaZVlKQmczOXc4WHlsYVpjY2VQM21CdmRCKzFR?=
 =?utf-8?B?bXB5cm9SUmFuZGE4RWt4UVljRkNXOHljUVREYWZtVkZ3Y1h1Q1MzSDZtamRo?=
 =?utf-8?B?TlhaYmZ2bENhbnc3K3JYTUY0S3FwSUp2ci9mWmErL2IxeGZxblFWc0VNMGFS?=
 =?utf-8?B?S1c5aVQrMEsxVmRqc3RtbklaQVN6d3dMSmU0VHY0ZjI2ejNBMXFid3VML3My?=
 =?utf-8?B?Sm5zR250WHo5U1VqVEtzOW5nTUwzL0dqQmNpajZQazkrazV5Q1lRcncxSFBo?=
 =?utf-8?B?UFVYZXI5ZFJsMHlQSFlwRkxwTDlqQnpLelN4YmFEYlBlOUhqeXpza0NOMXVr?=
 =?utf-8?B?SVk2eTdrZzdRNzBJV0lYc0Q0VHpJZUZaNTNiOVNoQmhvREVHUktzSklPYXlm?=
 =?utf-8?B?ZWdLbDVMcGF2UC9kSUlmSHA0eTA1YVI2bFI4TXg3djhTUC96ekVyNFd5Ukph?=
 =?utf-8?B?d1NUWXZHS0twYWpwSmF3ekZMeUVUVzNIUlFLSHR5d2pIa2hYdVF0SGExNG8v?=
 =?utf-8?B?aElqQ2dRbXgrdGRZcEtrOUQwVlFaaDMwdmVOVXd1alRhbERZWmt5Z2IySHYz?=
 =?utf-8?B?cXNaTU4wU0xOTDFpLytEekpLYm81bUtvQ3pYOTdMeGRoVWFob2p1VGxCdTRZ?=
 =?utf-8?B?TkdlRDNxSlA4R1N5K0tybUJnL1JjYWhrcmxDSm5adjJFa0d2QzJkeGJqTk43?=
 =?utf-8?B?TFlNV0VPajhLOG1Yci9ZaC9GRmw1NktjSDVRdmZJbHdTaWhwR3RvdWFremNI?=
 =?utf-8?B?TFNhU0xlSm16WnlBQ21uT1FLUkZIL3RtSUM1UG92b2VFNm1WYzRhYysyNTlC?=
 =?utf-8?B?eDluMEV0MElFdllIR1l6M0FjSHNwVHR5NGdicU9zVHRhRFA2UXVYV0RRVmRD?=
 =?utf-8?B?VnAwNGhrQTNLbGRET1JWQ3JoY1ZkNDBlTUFGVWN4N1NCakJ4c0pZc2lZbDFW?=
 =?utf-8?B?dHRsbFZNNTdlMkhWUy85Wkd3S21UendlVUczZU1aYTM3QU5tT2M4QmZFNVNV?=
 =?utf-8?B?WDNiaTVKMDBTQndQcVdvVTZaaWx1WGs4RVJkM3lmSkxYSVlzM2pVenF2UWNM?=
 =?utf-8?B?ayt3c2V2RWlNOEp2eEpRdXFYaHlxNWsza3ZCUmFhOWh3Z0p1aFozNDYrQ2ZF?=
 =?utf-8?B?TVhlUjY3UXRWVHJRbmZoY0d5K3J6VHYxaEw1eVZFc0VTU2wyMEF5aUprNmZU?=
 =?utf-8?B?SG16a0xuT1FuT0ZBSzE3U2t1V1pYWXhuUFpOT1N4SjBNcE9qNTBBWkpPQ0VH?=
 =?utf-8?B?NnBOTnBSR0NJOUZrSXlWLzloV1h5bG9IMGZPYTl1QzBrakdxbzcxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73131A2CBF9D6147A1069A9FF8095DAB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a5ed29-7df3-4c88-e3bd-08da16f339e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 10:58:32.9484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CkxInY9hGEyxj0ndx43Ca3KkNMzxYNwgAqvWMt9jY8N3dSqWOSDZ1oEyQJugHGNIcUF0K2G7Zi6sCoDQYNh/XG7DFMyO05KkU5On2zO+FHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2476
X-OriginatorOrg: citrix.com

T24gMDUvMDQvMjAyMiAxMToxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjA0LjIwMjIg
MTc6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwMS8wNC8yMDIyIDE1OjQ4LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDAxLzA0LzIwMjIgMTU6MzcsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToNCj4+Pj4gU2V0dGluZyB0aGUgZmNmLXByb3RlY3Rpb249bm9uZSBvcHRpb24gaW4g
RU1CRURERURfRVhUUkFfQ0ZMQUdTIGluIHRoZQ0KPj4+PiBNYWtlZmlsZSBkb2Vzbid0IGdldCBp
dCBwcm9wYWdhdGVkIHRvIHRoZSBzdWJkaXJlY3Rvcmllcywgc28gaW5zdGVhZA0KPj4+PiBzZXQg
dGhlIGZsYWcgaW4gZmlybXdhcmUvUnVsZXMubWssIGxpa2UgaXQncyBkb25lIGZvciBvdGhlciBj
b21waWxlcg0KPj4+PiBmbGFncy4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDM2NjdmN2Y4ZjcgKCd4ODY6
IEludHJvZHVjZSBzdXBwb3J0IGZvciBDRVQtSUJUJykNCj4+Pj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4gQWNrZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBUaGlzIGFsc28gbmVlZHMg
YmFja3BvcnRpbmcgd2l0aCB0aGUgWFNBLTM5OCBDRVQtSUJUIGZpeGVzLg0KPiBJIGRvbid0IHRo
aW5rIHNvIC0gdGhlIGJhY2twb3J0cyBvZiB0aGUgb3JpZ2luYWwgY29tbWl0IGRpZG4ndCBpbmNs
dWRlDQo+IHdoYXQgdGhpcyBwYXRjaCBmaXhlcy4gSSBoYXZlIHF1ZXVlZCBwYXRjaCAyIG9mIHRo
aXMgc2VyaWVzIHRob3VnaC4NCg0KSW4gd2hpY2ggY2FzZSBJIHNjcmV3ZWQgdXAgdGhlIGJhY2tw
b3J0LsKgIChJIHJlbWVtYmVyIHNwb3R0aW5nIHRoaXMgYnVnDQphbmQgdGhvdWdodCBJJ2QgY29y
cmVjdGVkIGl0LCBidXQgY2xlYXJseSBub3QuKcKgIHRvb2xzL2Zpcm13YXJlIHJlYWxseQ0KZG9l
cyBuZWVkIHRvIGJlIC1mY2YtcHJvdGVjdGlvbj1ub25lIHRvIGNvdW50ZXJhY3QgdGhlIGRlZmF1
bHRzIGluDQpVYnVudHUvZXRjLg0KDQp+QW5kcmV3DQo=

