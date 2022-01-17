Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B033749056E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258040.443911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OdU-000302-In; Mon, 17 Jan 2022 09:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258040.443911; Mon, 17 Jan 2022 09:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OdU-0002y3-Fa; Mon, 17 Jan 2022 09:49:12 +0000
Received: by outflank-mailman (input) for mailman id 258040;
 Mon, 17 Jan 2022 09:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9OdS-0002gi-4E
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5a3a174-777a-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 10:49:08 +0100 (CET)
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
X-Inumbo-ID: b5a3a174-777a-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Wz93ug/FPNJSgHXPaEs9gVh/zmqAvZ/KFxPj6vDe+ao=;
  b=c3eFca7SENnGcxUJl6mYnsnVdVag7f6rzADA1GQTyguJA4fw2SpWvRBQ
   CsuYpcBo6y8eKPrbHmGOT3WgY8JAWrHDLDjtXyi/UpZl+KNeAsauWnh96
   Ffk13+rLL4NtZc57uHVCjd0k3SYHPvyCrTKV0tGeksdMJw2FZCpzZui2I
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5o9VWThEf+1PV3GDUJxGHRVgwlGC6ZpJGykn1vwhgo7MlQZ3CKrTnHeRvnBYyGQ8/YiNqg+vTM
 nKdobOkOIXBn/Be2hLblTfS9YBYkbYnEgDl0PxxDwAnILfeU34+Pb4qCw2ALsChwBYDdmQxeOb
 Wdl1yx8VYftfvsPc1GoDUHiTbcLGaOl+PEEIV3ngbn5Dfkp4KIxZFnG8KlU9qy8USGeoIxgR8i
 w3ekaaGO4tbwvTkcW2vzfSUSVlGYb6kCggp4+QLA/v3oz/oUcUs+AxJD2SJMaq086LLed0Xaak
 pleo2aqAoK/GR43hLY5zOcYG
X-SBRS: 5.2
X-MesageID: 62542542
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Fn8hC617YdHbhtP7WvbD5SN2kn2cJEfYwER7XKvMYLTBsI5bp2AHy
 zNLXWmHb/yJNGWnKt1zO4mz9hxTsZSAn4ViSgJrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrFh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhk+pbl
 +5Al5GJU11xLLXt2+IZcDB4KnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4UFgG1t2pom8fD2V
 epFeQFxbzr6fV5dFX0RUrYAme2lvyyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc81bA
 1wZ/Gwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4qbuyVmiC0oJdyQbMM4+lYwwQR8D9
 mbcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjT9HBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNvDJrVil
 CJd8yR70AzoJcvX/MBqaL9cdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 BWI5FMKtMMPYivCgUpLj2SZUZlCIU/IT4WNaxwpRoAWPsgZmPGvoUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDOiL9YepbYTOmM7BohIvZ8V692
 4sOaKO3J+B3DbeWjt//q9BDdDjn7BETWPjLliCgXrXSfVo9RjBwUq+5LHFIU9UNopm5X9zgp
 xmVckRZ1ED+lTvALwCLYWpkc7ThQdB0qndTAMDmFQ/AN6ELbdn94aEBWYEweLV7puVvweQtF
 6sOetmaA+QJQTPComxPYZ74pY1kVRKqmQPRYHb1PGlhJ8ZtF17T59vpXgrz7y1SXCC5gtQz/
 u+73QTBTJtdGwk7VJTKaOiixk+atGQGnL4gRFPBJ9ReIR2+8IVjJyHroOUwJsUAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zP6k4FaUeuOcTTMb0/O+f2vN
 bdP0vXxEPwbh1IW4YByJKlmkPAl7Nz1qr4Ekgk9RCfXb06mA69LK2Wd2ZUdrbVEw7JUtFfkW
 k+L/dUGa7yFNNm8TQwULQshKO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI51k
 /08vMM26hCkjkt4O9mLuSlY6mCQIyFSSK4grJwbXNfmhwdDJouuunAA5vsaOK2yVug=
IronPort-HdrOrdr: A9a23:dY0mHqsEvc3GeonfSLCBeGJ/7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hsAV7CZniahILMFu9fBOTZslvd8kHFh4xgPO
 JbAtND4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNz2CA5sQkTuRYTzrdXGeKjM2YKbQQ/
 Gnl7V6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9dVfYd1P7srhJJGdZc8qPSMex7wqGr3QRqvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62542542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIXjQTnjJj8j+GsfBW6xiPZzMhIgTCW3uci0+7TtDmOa8qPT3UYU2q60pLBpI0pove6rwik6v+U2P9BLdKw5u45n2ncSmIhv52aZdq0DJdAfxEAGUkMRJKobZJs+aT1MJbysjEktQIDfpr030AUxrLeIhQ8bQWtgeitynUL0YtWFq9kBrIFE4AFC5ycxj/VCTQz6fqS6RnfnlcspYgzDDme3cb74Jtloo89KMuttNgEsIHhu6NN6G9WmAWgqjtjUiZZ6mxLcmDZXCtUJ3OcYuLIyAYPvf2nol3ldvHyafnBQZ+OXm18j7oQa4/Ffw8gOZITtxgv/oRbhRaKUCJhTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayDbTDiZzC5P0TCfS6qraBUi+bw0MzhwKU7e6ofLrXs=;
 b=D+qY2k/FZ7zxsC0Y4ZZFgjN7bIfK6+pmEROzAVN34PEI0+lgAqnsJrI9PcHhgosOx73IX3tRQaxXwL5x1uLTmWM7T04BRH5PBEkBtW1hDZgoCkDCadyweBV2BXkLxVmLwOUH1ZWyszd4W6mYJVaEgn5JcjVDjqno43QNCfkrSuTPDd6fYueZrErR99ROuDxG27s0Iz814mxOllz0+1p6z6WhLyzQD3iJ05AECrxZckPVX1vy3XBeX+U0EpqhVZESJGy7aXhAA+iIOrrGihfQJCwswbLliAcyR5SgYMkqgM0OABw1AXlb+3L6TMnrzIGahN+3gNPm+ZpmybGNRUZdgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayDbTDiZzC5P0TCfS6qraBUi+bw0MzhwKU7e6ofLrXs=;
 b=iD8mrxCg93t1VYff/0r5r/GK5len+SNCT0/rZk0l+iVErgkyx9uSf8BCOZH0elTjYbT8MNL10yLXqw7HZxmUXHxnOS4d2b8nC8d9ZLdpnSFGo4puecm315C24/VJt0zuJkIZ43WdhWLq4VTtDPiOwtfuVRn86t5N2MgXwpZbjtU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v6 01/12] libs/guest: move cpu policy related prototypes to xenguest.h
Date: Mon, 17 Jan 2022 10:48:16 +0100
Message-ID: <20220117094827.16756-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5763b145-3bf1-4090-9ad1-08d9d99e97b5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059B8005FA7EC0E43DF92F58F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7Qzipl0O5gPq4KJDrHfXmHBGDt1W7QQKXw3v0DLYLa9LOUlTw4IgGXlDH9oJs2Ioo661hj1QJdRzXnndE8YpWL3fMJlcLZxEce3hImsmo0MWmOL51pQVefBNspuo0KHLXCnwIzE4MWrZapLtKUZI72/rtnPpt6iarZ8OwwVwHBuwvBZfBxXvbnAD7ZtSx4ifFneHljeb0F9Hj+LdG2Ci8F/QirwGFLhz2Fo8mUwjLudgSc5GYSSJoLzQAVdBV1RGuuXyFYmq/Z81tRFv0MWtT4jcpI+0OcoYOlrLmyAav+tMVqy6lLFLHYvu0dXZPpdZhO1GejTxUs2XjiqnxLHdiZ8Kz2IRlioTHLj3Oz70C0LjK9eJg3aWjOtA8uk+84smLwWukI262n3f/BhXw+Ck5IsizhiuNcLlPmvyWtopkivG2KcEaQmLg4Z4MZZxYlquCa4EMaUImDY1uvQuOCfxRlaWgBvFdQtfWftuTpYNdVwlLnUdIARpeHPrMxJkE8plEC5gkI48v5g018DO8wXnh7ZPF4Q1DKU+4OPHO7pQLouLCnlu3ZHSwCYaCZwO4I9x5gA6N5T+FJQp6W7W3t2J22IEOSqMi3uSLlAuq3LHATGRSstKDhX2WqN77izS8+B0cxwQqIQOPz4SyF/3TxP+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(107886003)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkFMWTQ3THV4TWxqSDh0Q1d5MUlMSzFEMExGN2Uyc3d3ZmpvYXlVOGJieVNj?=
 =?utf-8?B?U09KMG50MTZ5ZmMzdlNZRlIxUHlqano2eU16U2pTLzBhTzJSdEI2OWxsN2cv?=
 =?utf-8?B?cG1iZTVGcWtBVFZTOG40UEJ6S2txSlowMzZlbTlzSWFSYnA3WTNoNENtZTNt?=
 =?utf-8?B?VjBiNktIakdlejJDUnc5QXZhTTZTQVpFU0xmQVFudmJoWDM5OUxicE9BUy9J?=
 =?utf-8?B?YU85UnVpVUxTMG5pME0wakMrUVpnTm1GRjZoU2RzUWlUL3pmc045NzlidTVO?=
 =?utf-8?B?Z0ErckE4WHRtajFNS29KOG1sdXZkTVpzQ2V4VndGaFJLenJBMGpTUWRRb0ZE?=
 =?utf-8?B?aTc4VW9zZHVhaHZCQkNkcnRQNVhUYnoxWG5yQWtEdlpvc2F4eU5MbmJpZFQ1?=
 =?utf-8?B?NnRhcW9BUHkxUklLZmZZSnUxMEJHQ0RkNXI0Y1hRVDZJN09jWXJGVThCeDNr?=
 =?utf-8?B?S0lPQVNza3lXczRPRklHRnpmTjRCZWFDa1c4RHdiYnZFcFYxSnNTOU1xNDBw?=
 =?utf-8?B?SGZMRW12b3JYa1RERDVESkRvWkRuTUt4SS9iV0R1cTQ2TVU2UjM4U2ExL0ZE?=
 =?utf-8?B?L1VNOUxXcEZ1Y0tQK2VsbFJrbFp4eC9Ma244NmJsdW12NmJPTEVGYkQzK2FF?=
 =?utf-8?B?ajhNdnNxMDhnSXgrMjBvcnFYeWZvL2NxZzFiVDdadytnaGRsbVFFNUd1OFR2?=
 =?utf-8?B?dEFza0VzVkwyZnl6RXBETlV1M1hKaCtVMWFqZC9tN1E1TGdJeGxtd2dFRWJ0?=
 =?utf-8?B?RkxDWFJpYmxnUFdXejlNekkrWlJwQjExV3lQNFhwRFJGd1A3dEROcTB1YXRR?=
 =?utf-8?B?MmI3cHdwT2NQZ2g3R3NJTHBVVG8vZS8vSUMrQjkyOUhQeFltWDRuc1RDczYw?=
 =?utf-8?B?TmpFVWpIQ1llbXNScWsyTW0rQmJ3TkdZc2JSUXZaejdmR1dWUG85WlY5RWNB?=
 =?utf-8?B?WXB3RWVJbGdHR2tPOWlhbVBJY2h5YUR3bDAyQmVWWUVaekxOL0tQRFlJMUI2?=
 =?utf-8?B?MW1DNnd5a29jU0pzUHEwSjNQNERacEExakVvNHlqUDc0TlRCc1FMNXhVV1h2?=
 =?utf-8?B?VFltMllTQkZGNWI3REIycjkwTTFXUnVTcXZ5M2R4QzJlamdXaGRtWS9oNEN2?=
 =?utf-8?B?QVFIZXlIbEtuYXIrS2VaclYwV0F3aUYxVTh2akplbVFNN2NTclU4S01KMmNk?=
 =?utf-8?B?RGtnRUNremVOQk0yNldlZm5SOXNtczBCQ0hmVktKUFpxWk5tMzZodEVTNTVF?=
 =?utf-8?B?QjB4M1hzZUFWUmpsRTlIRnZYbDBIQUxkVG1sS00vSWZiZXJkSnRDZ1B5TUJk?=
 =?utf-8?B?dmFYMGdxMllIU0t6RWd5Q0JBUlc2MDY1elU3OHFPWHVqbFJKTjVqUVhTdDVB?=
 =?utf-8?B?MGdQT2Z6OExzTzh4ZFNqRlRqRmNOQk1GbkgyeWc4VWxuS3BYend0ci9ITzBl?=
 =?utf-8?B?UmdkRm52aGNhNHBTZys5WVBCcEhDNUNVVlpXbU9DNldwd3d1ZjdkOTc0UG9w?=
 =?utf-8?B?OTk5UkowSTNYRzlHUG9YWXpaVFA5K1BsdFdTcG53VE1CZ1F5U0tqOUsvZ0l4?=
 =?utf-8?B?ZjJmVnlXVnhTa2l2VTQ3Y1NoOW5ETDBJckh0cUpnV0tnbGxNYnBUU0VXSmlr?=
 =?utf-8?B?OThjVDJJN3FuVmhUdjVVUTZzQTNNZytNYklIRktjK3Q4b1FYbWlNYVJxdlIw?=
 =?utf-8?B?ZjNjQ3BmNmlsUGp6NE56Mk44Y21DSUZBdDZwVVNpanJTWEhENXkySmh3UGdl?=
 =?utf-8?B?WFhqOTk5WVJ6VzJicHFaZU5wbkRGODBKcTBNSFcvK2xXbXNReHgzVHBPdzk1?=
 =?utf-8?B?ekt1TFRCVEpReFVyZnZkajZ3MnQ1UHRFSklKMWVIenkzbVZzQkM3ZElKOUZ0?=
 =?utf-8?B?YVZ3dmRPUHZyQk5YS3M0ZFJGcWtoS3lvbG4wZVBkN2E0RUNoMG8vRG85Zngv?=
 =?utf-8?B?UXpPNW5YN25LbnovNzJGVDBlTkl4V0YwYm9UY1YvQk5adjBsZnRvbFhyd3Nt?=
 =?utf-8?B?eFNWM3BsZXExSjFOWUdiUklIeFA5Nnl0MExYb2tQcXlETTR6TVcwZjljN3BN?=
 =?utf-8?B?MnJ6QnhTUFNVdFJvQTdiQVlsTERLK0tjeEQ2YW54WW84SFJ3NnpmMzkxclFB?=
 =?utf-8?B?RWFFVVdYelRJN08vVW54bWswSGJudVl6V3g2SXplM2k0Q0MxWmZWQmVNUUl2?=
 =?utf-8?Q?X393D6nRx7mVNPln0vqts9o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5763b145-3bf1-4090-9ad1-08d9d99e97b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:02.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AL6G03OVTkcKCfJJcQbJ2Upj8z8tMUD5Jsvj4RsTicwVVanQCLuaJjGbXs19c1joZD8ahBnzdN+MGI5TcsXoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Do this before adding any more stuff to xg_cpuid_x86.c.

The placement in xenctrl.h is wrong, as they are implemented by the
xenguest library. Note that xg_cpuid_x86.c needs to include
xg_private.h, and in turn also fix xg_private.h to include
xc_bitops.h. The bitops definition of BITS_PER_LONG needs to be
changed to not be an expression, so that xxhash.h can use it in a
preprocessor if directive.

As a result also modify xen-cpuid and the ocaml stubs to include
xenguest.h.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Include xenguest.h in ocaml stubs.
 - Change BITS_PER_LONG definition in xc_bitops.h.
---
 tools/include/xenctrl.h         | 55 --------------------------------
 tools/include/xenguest.h        | 56 +++++++++++++++++++++++++++++++++
 tools/libs/ctrl/xc_bitops.h     |  6 +++-
 tools/libs/guest/xg_cpuid_x86.c |  1 -
 tools/libs/guest/xg_private.h   |  1 +
 tools/misc/xen-cpuid.c          |  1 +
 6 files changed, 63 insertions(+), 57 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 07b96e6671..95bd5eca67 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2528,61 +2528,6 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
                            uint64_t *data);
 int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
                        xc_psr_feat_type type, xc_psr_hw_info *hw_info);
-
-typedef struct xc_cpu_policy xc_cpu_policy_t;
-
-/* Create and free a xc_cpu_policy object. */
-xc_cpu_policy_t *xc_cpu_policy_init(void);
-void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
-
-/* Retrieve a system policy, or get/set a domains policy. */
-int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
-                             xc_cpu_policy_t *policy);
-int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy);
-int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy);
-
-/* Manipulate a policy via architectural representations. */
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
-                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
-                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
-int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                               const xen_cpuid_leaf_t *leaves,
-                               uint32_t nr);
-int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const xen_msr_entry_t *msrs, uint32_t nr);
-
-/* Compatibility calculations. */
-bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
-                                 xc_cpu_policy_t *guest);
-
-int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
-int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
-                          uint32_t *nr_features, uint32_t *featureset);
-
-int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
-                           uint32_t *nr_msrs);
-int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
-                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
-                             uint32_t *err_msr_p);
-
-uint32_t xc_get_cpu_featureset_size(void);
-
-enum xc_static_cpu_featuremask {
-    XC_FEATUREMASK_KNOWN,
-    XC_FEATUREMASK_SPECIAL,
-    XC_FEATUREMASK_PV_MAX,
-    XC_FEATUREMASK_PV_DEF,
-    XC_FEATUREMASK_HVM_SHADOW_MAX,
-    XC_FEATUREMASK_HVM_SHADOW_DEF,
-    XC_FEATUREMASK_HVM_HAP_MAX,
-    XC_FEATUREMASK_HVM_HAP_DEF,
-};
-const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
-
 #endif
 
 int xc_livepatch_upload(xc_interface *xch,
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 61d0a82f48..e01f494b77 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -782,4 +782,60 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
                       unsigned long max_mfn,
                       int prot,
                       unsigned long *mfn0);
+
+#if defined(__i386__) || defined(__x86_64__)
+typedef struct xc_cpu_policy xc_cpu_policy_t;
+
+/* Create and free a xc_cpu_policy object. */
+xc_cpu_policy_t *xc_cpu_policy_init(void);
+void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
+
+/* Retrieve a system policy, or get/set a domains policy. */
+int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
+                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t *policy);
+
+/* Manipulate a policy via architectural representations. */
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
+                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr);
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr);
+
+/* Compatibility calculations. */
+bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
+                                 xc_cpu_policy_t *guest);
+
+int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
+int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
+                          uint32_t *nr_features, uint32_t *featureset);
+
+int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
+                           uint32_t *nr_msrs);
+int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
+                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
+                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
+                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
+                             uint32_t *err_msr_p);
+
+uint32_t xc_get_cpu_featureset_size(void);
+
+enum xc_static_cpu_featuremask {
+    XC_FEATUREMASK_KNOWN,
+    XC_FEATUREMASK_SPECIAL,
+    XC_FEATUREMASK_PV_MAX,
+    XC_FEATUREMASK_PV_DEF,
+    XC_FEATUREMASK_HVM_SHADOW_MAX,
+    XC_FEATUREMASK_HVM_SHADOW_DEF,
+    XC_FEATUREMASK_HVM_HAP_MAX,
+    XC_FEATUREMASK_HVM_HAP_DEF,
+};
+const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
+#endif /* __i386__ || __x86_64__ */
 #endif /* XENGUEST_H */
diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index f0bac4a071..4a776dc3a5 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -6,7 +6,11 @@
 #include <stdlib.h>
 #include <string.h>
 
-#define BITS_PER_LONG (sizeof(unsigned long) * 8)
+#ifdef __LP64__
+#define BITS_PER_LONG 64
+#else
+#define BITS_PER_LONG 32
+#endif
 
 #define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
 #define BITMAP_SHIFT(_nr) ((_nr) % 8)
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 198892ebdf..b9e827ce7e 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -23,7 +23,6 @@
 #include <stdbool.h>
 #include <limits.h>
 #include "xg_private.h"
-#include "xc_bitops.h"
 #include <xen/hvm/params.h>
 #include <xen-tools/libs.h>
 
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 28441ee13f..09e24f1227 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -27,6 +27,7 @@
 #include <sys/stat.h>
 
 #include "xc_private.h"
+#include "xc_bitops.h"
 #include "xenguest.h"
 
 #include <xen/memory.h>
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index fb36cac07b..a3003245f1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -8,6 +8,7 @@
 #include <inttypes.h>
 
 #include <xenctrl.h>
+#include <xenguest.h>
 
 #include <xen-tools/libs.h>
 
-- 
2.34.1


