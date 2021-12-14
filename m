Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53E0473F60
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:28:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246467.425056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx460-0004gK-H6; Tue, 14 Dec 2021 09:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246467.425056; Tue, 14 Dec 2021 09:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx460-0004e1-CY; Tue, 14 Dec 2021 09:27:40 +0000
Received: by outflank-mailman (input) for mailman id 246467;
 Tue, 14 Dec 2021 09:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx45y-0004dv-5B
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:27:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 376ba4f2-5cbf-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:21:29 +0100 (CET)
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
X-Inumbo-ID: 376ba4f2-5cbf-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639474055;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Gtfejlvab6fjNI/gB+ZAfl1jj6TGr1w0pix2oxBBehw=;
  b=HMyF6+Wqz9+nZISuTTMh8r8GL5dg7GJ6LS/sNdcdGUMgfdCYHhmOQMkO
   l/kpmj9yqr3yNyV5ui6VJL1h/Db/cxpxlhmyJpU9ajvQOUoespAEL9RmY
   KEeVaZ/RyHrG7YUhO39N369st4FX5jp1lybO3WzIMtQCtwgeS1f4Qv8Mv
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: r7A02iWP1wC0PPOTQJ4K91h43xQhKfVaRRm/bYCjyy2hLqqRsz0aqlPBF5DXWqfyVcf0ONoqhV
 QbuSMqXWRmocFOlQesyNtmFpL1HGz4wWZA5+v7PD9I0pXeyT1SdTg3Rl+lqUuMoavgxQ5+4ewY
 DOikqDLNbJ7MztfQX2PqQtG+2t85fWLyItl2VNLV5IhsIj1G7daGF/HEEl6aiD0WoxBPOk1PLb
 96VC1PLDWGHz0xUOu2cUrKwW4SNtu1Reft4qDVFLDQstDIGlxhU9i4uUqXKzDDLJdNDHmDsEos
 WgbpxcML7bliyEeAU42uXCif
X-SBRS: 5.1
X-MesageID: 60357996
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Qyi6DaItPDZEIy2YFE+RsZMlxSXFcZb7ZxGr2PjKsXjdYENS1jAAm
 GYWDT+Fa6yIazDwedwiPIXg9k5SsMPWyIVrG1ZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH140Eg6x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2usO5vl
 fEKmaWzZjsQNKTFp+ItcyVXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvYQFg2Zh2KiiG97cY
 401TR01dyjFTD0XH35GLbQ4mOeR0yyXnzpw9wvO+PtfD3Lo5BJ21L/hId/EYOuATM9enlubj
 m/e9mG/CRYfXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWpz2wODFstVF20odGwkEv4UNVaQ
 2Qe9zAyt6E0+AquR8PkQhyjiHeeu1gXXN84O+8n7ACAzILE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrMQ8hiFuipj9TzMTD23
 z2O6iM5gt07lccW042r8FaBhCijzqUlVSZsuF+RBDj8qFokOsj1PORE9GQ3895nA7iHE33Gk
 EEHtPSn5ukHMpe9tBCCFbBl8K6S296JNzjVgFhKFpYn9iiw93PLQb288A2SN28ybJ9aJGaBj
 Fv7/FoIucQNZCfCgbpfOtrpU6wXIb7c+cMJvxw+Rv5HedBPeQCO50mCjmbAjjm2wCDAfUzSU
 Kp3kPpA715GWcyLLxLsHo/xNIPHIAhkmgs/orihkHyaPUK2PiL9dFv8GALmghoFxK2Fuh7J1
 N1UKtGHzR5SOMWnPHKGrdRKdQ1UcilrbXwTlyCxXrTcSuaBMDt+Y8I9PJt7I9A190irvrmgE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NauTXlpgVRHAyW2AgiB5Ca72tf93X8JuIdEPqb07pdYpH
 qJtU5jRXZxypsHvpm11gW/V99c5KnxGRGumYkKYXdTIV8I6GlGSpIa7JlCHGetnJnPfiPbSa
 oaIj2vzaZECWx5jHIDRbveuxEm2pn8ThKR5WE6gHzWZUB+EHFFCJ3Ojg/kpDdsLLBmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmU+syInSP0cRVmLdKw7tV5Vm/V
 k6Vo4EIMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBwLbReWiSFbIL9kC68fw
 L8s6JwM9giyqhs2KdLa3CpawHuBcy4bWKI9u5BEXIKy0lg3yktPaID3AzPt5M3dcM1FN0QnL
 2PGhKfGgLgAlEPOf2BqSCrI1OtZw58PpApL3BkJIFHQwojJgfo+3Rtw9zUrT1sKkkUbgrwrY
 mU7ZVdoIaiu/itzgJkRVm+hLAhNGRmF9xGj0FAOjmDYExGlW2GlwLfR4gpREJT1K15hQwU=
IronPort-HdrOrdr: A9a23:OaUj3qEK54VZCsU1pLqFeZHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nI/hSQRI+Lpz+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzp/QtHNBA7dE6ML2K41z2MGHx2V2pUCHa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="60357996"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byuhe0ScOb/xX16u8PJ0fIkk/wBkbm+P/lJVcbz4J2+kTl25uZPtcaNMjI4LuLqiGA7vSqJ5OdsRakHBh14QoMeN5HHZn3f962n+vwIjVx/TlM6CdaNOek6Ajcif60INLXkS9cAWRGoHsPM2F3YrzAmDz0xnP0AwUER6KFQ4YkQhP6pJglLoHxUVKP7qAZZdYKmD4sZN52+g1ood2Wa4zUBkb9c97B/aXfi2BsUnW8kAsKM8/VDkqJYx+ZVTXS954K1LVLfJ50y4T8hdeh+Nz4jC+cpYC11UaNdbWLWg5/DY09hxnzJIlhS23SxKa+2FYZ2paEJ48VBETn6I9myO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbgA2lJ5pJeptvlrLlwZHmNEZyQEIJL1N2gNhGXwc4A=;
 b=EYOhZ314dLfzgXdL5i6JJkFjagdAYO0kmN2wy4j41ZKPNDon08qhx9V6vahu8kxnQvk2uRaV+WThjMe+hGzBGaz/N5rZQSsP0gfsTRV703EgsUXEcZdSuI7D5JpV9T2ZuhgRcji4z/5uEY7HgRY3mgRsHRelurNPsixuZk5TxIMnPEHu9UxEhK5RcHMffIPtPxN5EhC3LlHVmzPs7OSi4amJUuGnBkWAjN/we0rk1ey5Iop9Za9qN25pdtzz54X22+B48i0cjSxAZajTFDre25Jl1Yy3c7IFBqa77cO5ZRHudcItRBCN9QDvuUKN7+/iiFXxnel64YOAvPMuQQLY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbgA2lJ5pJeptvlrLlwZHmNEZyQEIJL1N2gNhGXwc4A=;
 b=vYf0/2/CvRqKUelxtFFsQYRtM8u73ITwQcgTHv13lnjN9O2L6u/EwInPA5qALmtB452keeQsNVBGWjMlaCUwAGoB22q4VSr5SDmsShBsMsVKpDu9Uq2of3Mb/0ps5dXNeoBcKIr4uDQ+bmwoRw/wbEIK7IF9KBphEtMLHvTrzvM=
Date: Tue, 14 Dec 2021 10:27:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
Message-ID: <YbhjdjeHkFtt+e5h@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
 <Ybdg6/J6oUf/5hEH@Air-de-Roger>
 <612dc962-229c-f43e-abb3-fd460c1412b0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <612dc962-229c-f43e-abb3-fd460c1412b0@suse.com>
X-ClientProxiedBy: MR1P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b246fbf-ef37-46f2-c141-08d9bee3f345
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB36735355B74A8A71F8EDC04E8F759@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lKjs3FL67G81FMUDaBVS3kQwD7klOC96a1uGb29XyLsiLs52w0yRfY+aVAVF32IWC886Rn2gcabfUR07yw23XPbVl73cT0w2FXsKF1LOnSR68v7dPuCyqd+B6SVikCTZmmYcB12rbHmZGKgAkxMNJgC3VG6gJ8zEIpLYueagxC7IHm8wc72T8KJRt1jvAAFlfksq1F3xsxk68ZzjBxrjrcF85aWe6Cwi5AgD5vsVRavZk100uWMX6NtEdAMuAxGGR0xhCYeavn+tUDr4GtJwWCs4DGGhEs9hhaBuVFrchMx4sSA/I67p2VOGMe2QHIBTAVYjWNxnyzWxhiCw2TS6kcOsjiiLadAibexFPTfxovFXSTqsrc4KLOUAVpB1xtTpRIRw2Nn/0xW9tMrLFoP3PBGoIyHR5L95++lUOV8fE/93zFheIo0Ba/SgUv6QgWTqbEZ3X+e4GL47Svuw5hp+CdCW/1r687++qJXsgio0xhEhDa++0C/4iyH5heoBLcydfVDpTJzg3ZNkrJGVBLQ8LOZD4+sKjEkH+yPww/po/BfygSEZ4lDvM1WIKLPLYHMXqznJAaR/nHVzN7PaYcJ+c69PpWg94/cq2+/dJ4GQJgW9prXod0Dbw8AOZogtAOL9yi7ncHho2jmNNGed+nZup3fPNS/+HC9+4QH+gIOWZHuqwF6rkCDz9FrjVDhuCnkelROa6x6UBQ7GmlA9B/uijQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(8936002)(26005)(4326008)(86362001)(6506007)(85182001)(53546011)(5660300002)(8676002)(186003)(9686003)(6512007)(316002)(6666004)(66556008)(6916009)(508600001)(33716001)(54906003)(66476007)(82960400001)(2906002)(38100700002)(66946007)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THhQSmg5clRZVWtxTVRGRlZTVVV3VGFZaEZHcDFqenFYYjdvMjl4WXN4ZWtx?=
 =?utf-8?B?VFZQUXBadjI0UEwySHFlODMwODN4ZWRpbytOck9VTHU1Q0NuRkpWZURBaXhI?=
 =?utf-8?B?ZmwreEJ2RGoxK0dxc29LbVhKQURTRjFlVHdJcWFrWjBCS0FlY3FOZUtVNTds?=
 =?utf-8?B?cndGWkJ1OWJlRmFFNU0zOVRpYjlEVUhyUzhaSGd1WVlHVmJFYTNSejA0Z283?=
 =?utf-8?B?aStoS0IzZWRBWHJnc25rc2NVeHk0ejNrNS8wNDJ1YXVNU3FidE1VbDRJSStX?=
 =?utf-8?B?OVhGTzNhZllZNklDUy9sYnduMlJncWFoQXYxR3JTZ21nMkc5RTRtK3lnTFBk?=
 =?utf-8?B?Wlo3MVFhUS9BNSs4M011WGF3ZFdXenRiekhRU09kZ25IM3ArNG5ZVFdSMUtl?=
 =?utf-8?B?UmxheXVBRU1DcU1JaWxZc0VSVlhYNkJDdFhMSEREL3VSMENGMW56ejJBTndX?=
 =?utf-8?B?dkRJWWtDYktXcGhmbFhyM0NFdnVvekJuL1BENHFmTWtwQnhvdUJFWFI2NE9o?=
 =?utf-8?B?a3E2bGxEMHp4ZENXQ0pGdDd3NXgxQ1RaSkoxYXhBUUE2dUljUm51dnhOVjRl?=
 =?utf-8?B?RTh5Q1Z6UFM5SVpoYmV5L3JOcFhqM29nOVJpVFJNOWVEQ3JPVjVkUmRhR0ln?=
 =?utf-8?B?OG9XczZaQXpFOExqbzFuUHZPNFBiSFoydXdIRGkyS2tHLytIVFdHclE5UE5Z?=
 =?utf-8?B?eUtOQkpSQTN3bVEyOE9QQkgzUXYwbDlHb3htRWo1RU9ZbkRQNDlVandDTDJa?=
 =?utf-8?B?UzVGV2IrelMzRVQrWi8yS0NjNWVDQzc3VDA0R013bFFQalVWV0RMMFQ3QldW?=
 =?utf-8?B?QXhET3JNMVptaEtFWjNKZGRpZUtuQWhiTzcvUDhQczBQbm1vVlJrTGtFM1B2?=
 =?utf-8?B?ckFlY0grTTBTL2tjWnozVG5hVWE2T1hGYkZSN3lOMytNUDVKV01LUlZ5aTUv?=
 =?utf-8?B?anR6N09ON1hITU1Cd3VBVjE3dU0yTk5sNDdSNjAwVURiZEhkelpWL1JiVi9S?=
 =?utf-8?B?blBFb1ZGUklkZ3hCcHFNUjhpSTR0RjBScERVWHJINHMvcVE4c0pqVElDYVpm?=
 =?utf-8?B?WnhRZ0JXNW5wRWxmczI3RXgwSzN0U2g4dDFHSVFZKzY5VEFnWFdjejJGSzNM?=
 =?utf-8?B?QkZqSGt4WGVVY1FGZ0tqWFZZVWhPTWUwM2VPcTZNNWl2ZlJaYzVJMWtOU2lj?=
 =?utf-8?B?Zld6OGNXV09SNU8xTGluN0RBcEEyUUt3aHRCNC9aUmFZa2c2VXBPMTFEelhC?=
 =?utf-8?B?TDcyK1h5NTZPWHp0MnZaamNxb3d5NUFhZE1PY3gxTkNtYS9XUUs2akJSNW1D?=
 =?utf-8?B?MzRiY1J1dndBejlsRVA1MkxEUWNQU25MY09jdStUeG9qREhvbjNpZDZqTjFX?=
 =?utf-8?B?WUg0S3Y3WDVNVFVxL2xiZXRrckpzN0R4OFBNZXU4QXh0S2s5QVM4RHVOYVFB?=
 =?utf-8?B?cWgyMDIvZlNhQ0hUbnY2NjV5SllGWFJiMXJSdFl2WkI0SjFaVmV5V1ZnRFIx?=
 =?utf-8?B?Wk5DZGZ1WEhjVG12SW5hWXZqZGhCUFRFV3piTlowVTM1ZEhNUlFSc0ZwMis1?=
 =?utf-8?B?d2JQYStlempSVlR5cGxGNHg1blFwTng3K2FPQUFBeUN6Vk1VSmFvUFh4bEp3?=
 =?utf-8?B?QkZSMis4NzNjSVlsYm1lVG9kTlVjMnVTY3BCMHM5aGRpRTVLOHM5Y0xTb0dM?=
 =?utf-8?B?d1JiWnRGaWZ0cXhFR3hTQjhGRU5xNlM2eVRBRHJ4YW9sL0d1U25MQ3ExUzJo?=
 =?utf-8?B?eXpVeFdsSVhxdUxYUDJIelI0MXFuRDIvZjRwRmFlVHlpNnhlVHpla2p4emdX?=
 =?utf-8?B?STAyUlZrRmhMRmVBK0g1MThQTVoySkp1dlNRNm1rdXZ0eENxU0RsL1cyNm05?=
 =?utf-8?B?WjZTYURETXAyb3NleUV6bmdCOXJGNWdtczU1K0NoRWIrQWhEb1EzcGhwR2FS?=
 =?utf-8?B?MlZJV2dlMk5pRkk2dXV1amJXVEtjWXZld2VaYUd1dkc0YmtGbG5pNDc5M21v?=
 =?utf-8?B?S3pMa28zU1YvYXRwYVBTRUtDdnRtYnNoekdkSHFDNEF6MHNYbGhTSWplSk5J?=
 =?utf-8?B?aVg5TDlLUWdJWFI3ck1tSW5HWFZuenZxQTBPakJyNFRLMTRtWmgzQngrS3JO?=
 =?utf-8?B?eEg1b3BPYk81Q0tFa01YaFdvbXROTzA4SFVXdThYNlA2emE2TUIzTTFiVFlV?=
 =?utf-8?Q?U7ckMUmGpX1cSq6iJ/jd55Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b246fbf-ef37-46f2-c141-08d9bee3f345
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 09:27:30.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/iS7ATYDeAaSbgd6TnfV3jQ0OJFoUPUIjiFznuz2+dlW02CB8ug0S/wYptbRjfR6YAqGLZNda4zAX66kk6m4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 10:06:37AM +0100, Jan Beulich wrote:
> On 13.12.2021 16:04, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:53:59AM +0200, Jan Beulich wrote:
> >> Having a separate flush-all hook has always been puzzling me some. We
> >> will want to be able to force a full flush via accumulated flush flags
> >> from the map/unmap functions. Introduce a respective new flag and fold
> >> all flush handling to use the single remaining hook.
> >>
> >> Note that because of the respective comments in SMMU and IPMMU-VMSA
> >> code, I've folded the two prior hook functions into one. For SMMU-v3,
> >> which lacks a comment towards incapable hardware, I've left both
> >> functions in place on the assumption that selective and full flushes
> >> will eventually want separating.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> >> --- a/xen/drivers/passthrough/vtd/iommu.c
> >> +++ b/xen/drivers/passthrough/vtd/iommu.c
> >> @@ -731,18 +731,21 @@ static int __must_check iommu_flush_iotl
> >>                                                  unsigned long page_count,
> >>                                                  unsigned int flush_flags)
> >>  {
> >> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> >> -    ASSERT(flush_flags);
> >> +    if ( flush_flags & IOMMU_FLUSHF_all )
> >> +    {
> >> +        dfn = INVALID_DFN;
> >> +        page_count = 0;
> > 
> > Don't we expect callers to already pass an invalid dfn and a 0 page
> > count when doing a full flush?
> 
> I didn't want to introduce such a requirement. The two arguments should
> imo be don't-cares with IOMMU_FLUSHF_all, such that callers handing on
> (or accumulating) flags don't need to apply extra care.
> 
> > In the equivalent AMD code you didn't set those for the FLUSHF_all
> > case.
> 
> There's no similar dependency there in AMD code. For VT-d,
> iommu_flush_iotlb() needs at least one of the two set this way to
> actually do a full-address-space flush. (Which, as an aside, I've
> recently learned is supposedly wrong when cap_isoch() returns true. But
> that's an orthogonal issue, albeit it may be possible to deal with at
> the same time as, down the road, limiting the too aggressive flushing
> done by subsequent patches using this new flag.)

I see. AMD flush helper gets the flags as a parameter (because
the flush all function is a wrapper around the flush pages one), so
there's no need to signal a full flush using the other parameters.

> I could be talked into setting just page_count to zero here.

No, I think it's fine.

Thanks, Roger.

