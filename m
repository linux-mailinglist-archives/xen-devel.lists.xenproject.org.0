Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A702A5614E3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358297.587426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pSs-00005K-2G; Thu, 30 Jun 2022 08:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358297.587426; Thu, 30 Jun 2022 08:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pSr-0008UZ-VU; Thu, 30 Jun 2022 08:23:53 +0000
Received: by outflank-mailman (input) for mailman id 358297;
 Thu, 30 Jun 2022 08:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pSq-0008UT-Je
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:23:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7a9ee47-f84d-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 10:23:50 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:23:45 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5421.namprd03.prod.outlook.com (2603:10b6:a03:289::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 08:23:44 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:23:43 +0000
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
X-Inumbo-ID: f7a9ee47-f84d-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656577430;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=yN7e6p77YPxwkl+F7ksxrii0BUbd6C7Ul9rN241wp30=;
  b=LnaXjXdL7c+0IDI9OZgIVTUhMQ9O6EmnGox6w8P3ighaozt1geSsznKC
   JWQzYwIbN4YQ4VY2RAdUxCJZTPkYKPjfgq7d6tKFoqtfNucbWUJ5dfSrd
   vpuVuX9hR4TS+1OqXUmP9xMiTehg9HH477IAmiTqW1OyUbQclzHXZxCJR
   4=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 74602641
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pXclu6/UHhVTdQTTgTqSDrUDnX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WdNCmzXO6yCYmLwe4hza4+x8kwBvsOGx4JlHQBv+yo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34PhW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYC3GQE2AbXuob4mUgJaHTEiAq4W3bCSdBBTseTLp6HHW13F5qw0SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHfuMuYEwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgL2MA8gzJ/MLb5UDakjIq2enzDuaSOce7eMh/l0GBn
 HLJqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZtvgWxy1plaUsxhaXMBfe8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQ10
 neZktWvAiZg2IB5UlqY/7aQ6DatYy4cKDZYYTdeFVdbpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:Bauiy6ifMY+uJ3piW6NfbkCRtHBQXzV13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMDVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP++w+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlXQnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ9u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh5rD3xHklXKvoIRiKp7zOSI
 JVfY/hDbdtABunhknizyRSKIfGZAVzIv+EKnJyyvB9nQIm3EyR9HFou/D3rk1wiK7VdKM0md
 gsSp4Y8o2mbvVmH56VV91xNPefOyjqfS/mFl60DBDOKJwnUki92qIfpo9Frd2XRA==
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74602641"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNyDJaSwusRiqLYwr/ckPAAQq4X9qtlMT2NWT7UThTERtX75hkLCR62ELO7sFZtqWdRDWouUeXsfJzMmPEq5yS7hr/0yLrAcx90DuGAVhp2CCqOkcV792mSaY6+d2Cz69BqmNa1utE6hb+/pCQNSAGN8kTnAd490+50uCTJ5wSOTSoynVZgqAZGiL1DOZq56n66gSItm0QJ0VPA4u+jAz+f4RlE2vAiNxFl/teHttZu7ipL8i+MQC38Wp2TfxWaDSYDeQVsRIdUFFSlwD9pnExqvaz/yBR7X4ClLCT8UcZswdu3wPJ14DZzjdo/KTlHNIlmPHz9jCBC+XGzEPlF1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjxY6oKOPhEUU0pls0z99JS4H5ntUS179yrFkFE+DfM=;
 b=jg6t8KFSvwVL1AD6Q8+2HI+IHMsCoMzMocD2T9cGqNjPEUuuhs/tas+tIXifw8dxR8sMTXncDpmGXT3Bcq3GahzORfgtwmvzq4E0LQOaLOfVLP88nWnaJDkFeJEywarol7lb0csaSSKDINdrkE3XKn4l3F+iphge04tcXUcRI4mi0HUiHPn/F/ztbYSM94YpZVtt5zaqYI/rgK+s1tO6DHPnU1lvCxMSePXvnu7icrCTC6wvGYY2CqMFg1fVJMTGdgedMqu6KjI/TyupY4em/307p8Vth4KwZRF/L/34J0781Oi/4FNedCCAzHvoTEJaDwOsQDl/+axx8pMP9/2j3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjxY6oKOPhEUU0pls0z99JS4H5ntUS179yrFkFE+DfM=;
 b=Wf/DvpCW23uNWiTlYTPJq03+nlS+g2w8rfihVRmFf3wEb57R+s6m+wAMHqWN7HUBwML46rUssO/1+LQaDysPPuo3ibvqZFBEU4C31LAoM+sKvIFshfkRsBWue6yImoMq/nz8WsTKQJ6cua8HtYtkDIazgDPiE/PmMxIPeQm0GzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] console/serial: adjust default TX buffer size
Date: Thu, 30 Jun 2022 10:23:28 +0200
Message-Id: <20220630082330.82706-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eff8f1f-f652-411d-29cd-08da5a71d897
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5421:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ajtxE3rOEtXM0pAIg4PpGC79qYm1oFkoMYC08gMHZxCD/sO8MApnKXKTrU0Ci8W/9uCwKBqspL7Sg+Ov1D/6TWEO9jvU+5AhzTVhfg+phfjY/Puvu9ao1luFjpJlmzpRjDGboDQEUqrLO08NpEht/J2N1NqOaY6igrgVo8Tn1xyM6h3Lr8jC8ScIz5HIiFpQkvzRhz53vQt75G2Vzb1Q1c1/LxtbrNnermibRi/x2kcW3r2f8Uzs00cM7nkJ3b/EF7/E7QanjEFm9LZN6KZiy6RKFzWbOxe5hbFTuhZ/kQTwWMjQeXaLF2uFu6w5ioWUVUP18QTGIXCcVc5DZjbIRDwVpSuPKtdM53TtRcpw3MGzGs47coe+0XWWiTTiOkKpAVG8LH6l5LOlMPOlG4yDrPd2hROsgHAN6Z9Q6WCkVufIcVpJFftL0DPHPakdBcCuhYvgv8NPY3YN2E2tbq1gZt3U9GB8+lgCZm9GK7R3sujOblEkYA83BZpnYJvdlHf7taYh7JNNemybEWkxXVy9pbRSWp5ldyDtCbPFzk9tNKviPaSLnPWFCI+5sSdDTkMZd4+E/MWXrameuB6pAfp1kY+I/astSEojPCRpbFJy6XgcN65z15IIfhbIl1DHL8jVx659gh1ru4/7G2XoVGVviM8AhYGSDBhWQQcwwtP6+n6gEDtwV9+gfKbPyrq3grcDeTo0YHlN2+1jL5IkN5meBarP42hOnrPNHRsCQw3Kdk0MDLPqkDwwCma1jpSgxa6cgw/C8gMFk7OVbgcST9rkwvgjTt043fFg3AUyzcxOF5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(2906002)(86362001)(6666004)(478600001)(6506007)(2616005)(1076003)(5660300002)(4744005)(8936002)(186003)(6916009)(82960400001)(38100700002)(6512007)(41300700001)(316002)(26005)(66946007)(6486002)(4326008)(36756003)(8676002)(66476007)(54906003)(66556008)(83380400001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZHdW0rRUNHSjFHaXNNbVRHWWJsdGdYQlNYejFlNlZkWEVzT1U5WGdyOU8x?=
 =?utf-8?B?bC92RXJQbHBBM2t3dit3SU5BdUlsZ1dwL283YkVhbWdESnJpRzI1WG90UC9G?=
 =?utf-8?B?ZGc4RFc5SlJsdkZ6UUxRZ01xRzF3N2lEYWxab3pqc0xNK2hNb2pKU0s5cXdM?=
 =?utf-8?B?UWNyTWU1dms1UUo3THp2WkhOWWJkV0lod3NCRUlXdDE4WSt3WmZRSGVpNFRm?=
 =?utf-8?B?d0hQa0hScXQvc1Vtb0pxcDVIRG5hRDNzYXpqWklBdllSWlA4RFgxbDN6UmRj?=
 =?utf-8?B?aTlGenhpaWVtbnBNYWE5R2NmNWdnL3Y1bVU0ZlRzNml4L1hBdjZRWTZlcmc3?=
 =?utf-8?B?ZGJXUXB3L0Vyc1l2dEdzNk56dWNjc2hmZ3F2ZFl6NWl3cEJCZmVXNHNOMkFz?=
 =?utf-8?B?V3ZpdUtNN2Vmdk9Oc2lxaEh2bmI2Y3hJYkFPczZFaVJ0YzZtVW5sNTYya2Rp?=
 =?utf-8?B?Yml1MEUxMTdUNkxYbVFXaHFUWndBbWlpY1lnaFp0c1BjY0h6ZDNUekU3VzQy?=
 =?utf-8?B?cUJob3NIdWRpN1BCVWVoNWxCd0xRUCt6UEJNU1VzQUZEbXR5TUprd04va1Iv?=
 =?utf-8?B?VkZrdUhNL1BHa0thQ1FxYzRxaEhaOVk0K1dvdEF4SWhYZzZMbHNjNU9JOTJ6?=
 =?utf-8?B?cUtQSTdRejd2NUFaY1ZOM2dvaUxPbmkvaUlJR3RoaExyd1lPWkVqWHJhZWpD?=
 =?utf-8?B?bzFVWE93Qnl6d1VaaEo2S2Q1b3Erd1duLzNnbGR5K2YvQlNBbDhlZG5BRVRp?=
 =?utf-8?B?SHp1VExKQVZ4Z2NyRWJwVGQzbTFKa2NFeW5BcDNNUCtGRUZvSWR6L1RUMFpx?=
 =?utf-8?B?SFU3TnU2R3BvbHlBVVlyOXNXalVOdG12VmpTcmxLOEFJRVZ6L2ZadXN1dWVX?=
 =?utf-8?B?Z3ZjSHo1SEhxeDBiQ2N2K0liZ2JKbndCaC80T1libE0xNmJHN3FJcTVveXBt?=
 =?utf-8?B?N0NIL2NCWm50ZXV5c1pRclVjbmhmbjk5b2ErS0svdXhPNXdJR2RVY0kzY3Ni?=
 =?utf-8?B?Qk83M2ZMczNBRXc1Yms1YzNOTE40SitURHNnSTRwTWl4M3dFWUFTbHV6a1I2?=
 =?utf-8?B?LzNCR1lVT01XWHV6aGpLR1E0QUZpdmIzNUhaRi9venhUZ0QrUmwxQVNFN2tO?=
 =?utf-8?B?MGtVUlZweDcycGh0d2V1bm1sYmlnUFlhdlFPL2VjYVVpMkFNb2RCdXZuc3Ja?=
 =?utf-8?B?NUEyYk9WcEhXemg0WVNmcWViYVY4dzZtTmJDaDVOdDM4VGpMSEhUNlZTci9Y?=
 =?utf-8?B?MDY2U1J1ajJxcUYwYnp5QnhEYVNMMmoxMEduRC9RcXJXa0FMcWJuU0hXMktS?=
 =?utf-8?B?dVFiRlJpWGtlYVpYdVNrL2RqV21NSXF0WnN0dW1OUkdKMmVZRVZZWUttUThX?=
 =?utf-8?B?OWZ2VTR0cEZYNy9oK0JGV3pUcXlSLzIwWlJCUWZRcndJTTJyTU9hME5TY2lV?=
 =?utf-8?B?YUFnZksxYXRlT2xoUk9NMHpjaXZTSTVyODJtR1IxQVZaRXQzSzVKekZUQ0VO?=
 =?utf-8?B?dEIzMTliQlNra24xZk1TMzdYbnZZOUQzYVA2TVhnbExjanJoeUpyMjJxZHlr?=
 =?utf-8?B?MTdhUjgvVW5KTGErNE5TMVRjZmw4ODZFUFZKckVBcG1RVVVBVVBPNHNXdUx3?=
 =?utf-8?B?Y2xpTVhocmRKTTB4M2VGYnBJUlZCUy8xUjJqL29nRkZZZ0c3N3ZIcWJhdFcz?=
 =?utf-8?B?QzhScEFxUXlPYXN3aDVDNzdKUHkySFMvU1R3QVJTRmc4ZzlqcnBRZ3ROVXhx?=
 =?utf-8?B?K1d5cHE1LzhJSmNrVDFhN0E1SCtKeGg3TmlvK0N0ak9ja2VGZFkrQ2tmS1I1?=
 =?utf-8?B?cjdUQnZiNTdpMmtyNHdDQTk2RmRSUkE0Szd0R21neDJaNWwxMVZXN05qM2FT?=
 =?utf-8?B?eVpEY2ZHVXYvbEFvL21JNFAxSUFwUDZzSmRQZS9IU25jenVWb3lqaHZNYXpa?=
 =?utf-8?B?bTBLOCtGZFNMRGltTmZVK0hDL1BsN1g3dkw5RlVGUVMrL2pnVElFUnBQbEVx?=
 =?utf-8?B?U3V2S1lZVXgvVVlWRnNpbVh5VFgycFp3TE8xOTZGemN4clNvTVBXNGlCVjU5?=
 =?utf-8?B?bUNEblpoYkpyK1c5WEFJSGpkSytSQ1RDMHRCeE5sUkFpY0NOZmlMUUxiYmZm?=
 =?utf-8?B?L1RyMWRISkp5QVVxdzRhaWVPdGFSVkMwdVZxVVBTcTVKYmI5L3Z3K1JnMjBo?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eff8f1f-f652-411d-29cd-08da5a71d897
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:23:43.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCoxGQSDTBVYlfHPbkXpzJ4q8h5JdDPCm6xFoEXEQdBXpNQEWYExObpUvFIhzjtCBAHIzO3zMLbzwCENkZnD6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5421

Hello,

First patch moves the setting of the default TX buffer size to Kconfig,
and shouldn't be controversial, second patch increases the buffer to
32K.  Jan doesn't feel comfortable Acking patch 2, so someone will have
to review and consider it, see:

https://lore.kernel.org/xen-devel/59fe1b28-b173-e497-5b8a-5e0bb6d946b6@suse.com/

Thanks, Roger.

Roger Pau Monne (2):
  console/serial: set the default transmit buffer size in Kconfig
  console/serial: bump buffer from 16K to 32K

 xen/drivers/char/Kconfig  | 10 ++++++++++
 xen/drivers/char/serial.c |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.36.1


