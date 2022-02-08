Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C7A4ADB82
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 15:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268434.462268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRmV-0001mN-9x; Tue, 08 Feb 2022 14:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268434.462268; Tue, 08 Feb 2022 14:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRmV-0001kX-6n; Tue, 08 Feb 2022 14:47:47 +0000
Received: by outflank-mailman (input) for mailman id 268434;
 Tue, 08 Feb 2022 14:47:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHRmU-0001kR-HL
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 14:47:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1187970e-88ee-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 15:47:44 +0100 (CET)
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
X-Inumbo-ID: 1187970e-88ee-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644331664;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OALkXEdYWTGWIyCFj4fCPe8lDTpYxxl38uBD6KW1DfA=;
  b=On5C/WwgvLcE81PMbVfEV23/aGRPdXh4NrZWPOAQM1NiNz78mGKel3Fw
   04CnssI+esXbrEEMifPWlVNxsofXCiprFG+Avg85kGkY7slHNaRksQYOj
   o1nmAApws1rVoTVPAGYCUc1sIQc/6X3yFElHbx9w3lla5SqrjXAyHiwo6
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UubI2e1Sxg5g6RZLK3rNn4GrBAQQpT5O0UnBFEwrDMkhnZoqjHCwSExknDrGCVcacLAnq98Ds1
 Ghh366Ewt2Cr1E6BboJs08ty6qXpDhft/tLhNJ5tJD8T0zpsOvWzHR3SfuLHh2apuzhoyXC4Tm
 0H8f+Hn4JCbqlIbQ1ILlzZSG7JbxtMjaTusnVZI9wMElwCB4GKFayZcCBlm/gM7Sw5EJDeHP+v
 pqALYZePnKDPJXJN2WgsqV6gnvW20PzkDXeaIqAeSXkpo9hvWGF9exGW4QoI4qRlwttW0e8oiY
 rAaztDU5XS0PRgw6J/AzcZtc
X-SBRS: 5.1
X-MesageID: 63740974
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aZqOnqLEasA4x6xIFE+RA5IlxSXFcZb7ZxGr2PjKsXjdYENS0mEDy
 WAdX2GCa/3fNjGmL4pxOY+08klXsMeEytFhHgFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2RnPlL2
 NtMuqbhdjsbAKuVu+4hAjxHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvoAEhGZv2qiiG97nX
 ugSMxl3NiiYWDhTa3oFK4kuzOin0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdwW7iUSUsB8TYYtvL98E7liuwJaFxhnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzjNAuBRPtfNi2mUBb/zt6coEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAzQ8Bwrm3zqiT6Jui8BQ2Sw28zY645lcLBO
 heP6Wu9GrcPVJdVUUOHS93oUJl7pUQRPd/kSurVfrJzjmtZL2e6ENVVTRfIhQjFyRF0+YlmY
 MvzWZv8XB4yVPU8pBLrFrh1+eFwnEgWmziMLa0XOjz6iNJyklbOEuxbWLZPB8hkhJ65TPL9q
 Y4AbpDXkEUGC4UToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3gp
 RlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:2c7a4KCyrbO06iTlHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63740974"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gulo/+z5LBZFFC1NKBBxPfCzBgl3pC+1KR7989muIbkXiOFIPZy0B0ByBmeQLwZMGYnzeYaZN9FvWCHAxizlkprSkIVlrF5Huva/lId0RqLUJkJk4E6HzuBYL3Y0cRMtiW/xxSFSzEivSbSIGz0w+Evqem+zplYpLPsUf3K6KKZQNcXSbu/NDCLmbXHI5g3BFLiEzduPh8FlbVFC9SmnzEQYBjwjtWNTsPN94ZSjhYMWnZsEwZp0PR0va3RZ6Mfwcnv/bv6u1UFKCiNGLrqr7bsfZ+oXfw6mu+5FrJ6szd7adCunZsr8/wCu19yfqnyT+dKc8x5odK9vfRuuo0xmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49vaL47Ca0bT3XdWEPgw1MGVyHkyPaeRkies6Pmp0fE=;
 b=aXLSHeLB8yik2yPFQVF/skQOEU58ubQYy5cvm/SX3jP2qumXNrcJPg1SMFj6k+Oo4X1jR/pPWV3kHTY/jtTDJvU2rm4aPAW1WoZQN6XTz4+rHdvqBnIGC1cnf+tVXBLMfNKGCexrQ+aCy6JcD1MCTORhKPhKJ9rlqYQeVhBdU5FNtZjyjfNTXBM9op+0Su7PWrq9vbwkK2sLtlWxVGDCkM6tybBp4/9IF2R9QEKA+LQtY1RZyB6FUYOsK+qCG+OWUZA306tsm8viKDkDBzCs3Spov7qkhx3VPTj3UIaNWV37TsU72munjPorriS0Av/9VB4LqxN51rhLcppxkmCDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49vaL47Ca0bT3XdWEPgw1MGVyHkyPaeRkies6Pmp0fE=;
 b=C+NS5tZnTe9YwNYLP3aWQuozq6W6sntaP54AtuRBCFbtpH9xL3l2PY5V0tCCARyjqI0KFBDxum4mJe8Op2taQEXVUPnQN0YgF9uSbmXKi+buGyKvIhH8ET+1lrzgQnwYuBuh4AZKv4mqATbUn/eclWAU+UUEtH9CkDCzQ1KTuD4=
Date: Tue, 8 Feb 2022 15:47:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/Intel: don't log bogus frequency range on Core/Core2
 processors
Message-ID: <YgKChtaJLAYMsVqG@Air-de-Roger>
References: <419db65a-a6f2-f812-d51e-7a23d065d460@suse.com>
 <YgIv3O8ojoDK+wiR@Air-de-Roger>
 <1680d537-fb6d-c589-66bd-f845b8280308@suse.com>
 <YgJ8REZepbp7WKnv@Air-de-Roger>
 <6ff6d1b4-e096-90c9-1329-eb5dfecde94c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ff6d1b4-e096-90c9-1329-eb5dfecde94c@suse.com>
X-ClientProxiedBy: LO4P123CA0440.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91c7752e-2fb4-4bfb-ba75-08d9eb11f371
X-MS-TrafficTypeDiagnostic: SA2PR03MB5705:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB57052F2702C616494925BAFB8F2D9@SA2PR03MB5705.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZoGFmIcGa57m0jCY7L1Jxq0TQb2rcgNAz890Wn9WaYhYuSnLPm5E7/l0IzAb7v5IqfBn7fbDYXc4Meh4x2mHiTLGP9L0KjHdGUU39H3OJNUuXHTjZBxnOk8tU8o3uw9a5ZFlCJ5AqIOjXxQ1sm9GwO//Olkavulaua7/hCBdcVLi92hZWtJ9l8k8/gRZDQwQY1xmUubl7q2zeDm0GqXA9SGdEEITCx/mPH8tCRA/FYS8WfDNxgQaP8GXrnTZXx6y5MALXLq0uCT27ZowKdUC5cFzVzqmqD9o2BFMSyEPXEVDjZ+3saePXRM+7PT2hLBPAxQC9KlWVlNeQ/4hFUY1FKnEYZS47V79OXuOqPaASlypj3IeytQpDzw2eBYPhcLzXf/ZTUbZpMmM/0WJU4nibFFnL9MB/Cr5WhVp4ZixlWxTp2UAxFW6KXnmPJwnZ2P8UhTw5rGtLsXG2InQZxfEKhQL32s/xfGf98ywKkV+4Oi6Ekk2nLGGk2NC5/YlGgJ167ui8/ct1gpYYr8wyN7Msdt/N5Z08N0tV/YU7KUXnlxDLqAH3GKcHP5eE1b1KIUMfZS7VkqmOB4UehDriMTqj4FBuEFAPfpEAHTWKRMJ2brJhHIAcQI8tkfZ3kKY3uT+KK8eV4QxB0e9A4ZZZOsnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(66476007)(6512007)(9686003)(6916009)(54906003)(8676002)(4326008)(83380400001)(316002)(26005)(508600001)(86362001)(6666004)(33716001)(82960400001)(53546011)(8936002)(85182001)(6486002)(38100700002)(2906002)(6506007)(66556008)(66946007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGQrQzZnYkZvRzc1andBWFJIRi83YnV6bVdUM0V0Z3d2RlFsN3FLQ3VGUmZa?=
 =?utf-8?B?WGFPbnF6QkpKS3kyNHEwdzE1dU1mMEU4VmRlN3RNb2lxNDRHOXZGOTJ1RXBu?=
 =?utf-8?B?SEI5YTgzMUlLV2hUL0NlYkgrbk1VdjYvSWpmT29iTHpZYVFpb0ZIVDYvL1hF?=
 =?utf-8?B?a2xOeVdKN0FmaitWVnJWOE81VVJ5eksyMjYybS9OcllQTC96UnBNTGtDT0hl?=
 =?utf-8?B?NXJzRmozdzVvWG1iS0lJT0IxUU81NFhhS25pL1dhNVRhNktneFIrQnpNb3hi?=
 =?utf-8?B?amJ6MG9udFBsQ1l4NkJ3Znc4dmdqU05La2dmWk95cUw5eVdGNi9GdVZQQjdI?=
 =?utf-8?B?bTVmSnNhc2pBZjJ3VWNHc0hMWlZ3U3dKRTRzRmtKZ2VoSUEyNG5iV3p3eTVE?=
 =?utf-8?B?VUoyRmkwZkxJWit3RXVCTk5zTWt2SE5hUlorcHNKWHRQWkI1ei9yK1BNeDM4?=
 =?utf-8?B?RWhvV2NGYVdHZ29yWGs5OGtCY0NiRVY5NURKVHRRTk1TRlZnUVJPRUwvZW5W?=
 =?utf-8?B?V3hJTGFFeDJoZ1VEMDJUbktZVUJkRS96OXQzY3BobC9XbUhmZFhod3U2RHBM?=
 =?utf-8?B?WXI3WEJrbTRCSnJGak1DMm5DQS93UlAxMHRzdEpkTTNFUnIvS0tEMDVVRGIv?=
 =?utf-8?B?SHFITlJpM0JKQXcxVngzR1ROVlN2QUJkNDlPOFJKRndwNFJDT1ZiU2JMNGZz?=
 =?utf-8?B?Ny81cUJxa1ZudjcreEJsT2N2S3JKajNlNnk1Y1k2LzNlUGI0bkJGRVZXZGJV?=
 =?utf-8?B?SStmQ25LRE53TVVlMVd4d29XUjhJcmJGWWJLNjZVeTloUWUvZ2JGMzFkMkYw?=
 =?utf-8?B?UXQ5MHpkNmFsdWtTTHNzdkQwWTBuL0ppaUt4WnZGL0FIL0pyUi9GdGlqU1JK?=
 =?utf-8?B?S0FQUXNzVmtCcXdkd0R5OTNOV1ZpMUZiR25jM1VVRms3YjE2YjNjUkpMS2t2?=
 =?utf-8?B?SGJlNnExbjZaYnp1T3BZREpmLzBOcEc1aWlNdEpqNndXekhxdnlmYVVuYzZl?=
 =?utf-8?B?anorbWlaUm5IRnFLTnJIV0ZaeHJkV2ZCYVg5NTYzKzFpWTd4anlBR2xKRUJ3?=
 =?utf-8?B?TUZQVUpYaS9KUzRlYmZwbER6dGZYQlF1WDJicFk0akZkVEV0QmxTeTNRTVJp?=
 =?utf-8?B?L243ZzlBcXlwYTA1UFNJWk1qa0k5VVh2d1ZLR0JiVElVZmRtUStWaG1zc2dz?=
 =?utf-8?B?SzI4WkY2S0l6a3loMmtTWE1TVjFsNXhnOURXdHNMUGNuUWs4U0xDbVdUZE5M?=
 =?utf-8?B?THdqQlpkeTBlL3REVE5lRkVVamt6L21LQUgxMkVKSVVkaVJUMjVDOE1Ma05M?=
 =?utf-8?B?enowUnZsZ1NTQWJPdDhwRUxOTE5pZnd0eE9RK0FoSlFycHhoNEYyY2R1RVRu?=
 =?utf-8?B?TmxVemljMk1wUGV5Nm9qb0hFbW96bjV1djdINVFpd3FVaFdMK1lOUXNmMGJ3?=
 =?utf-8?B?cjUzeFE4L1lodW9wekNSNWhjM1E4UGVLVy91ODNnb09jTDBDdUZyaUFiTGEv?=
 =?utf-8?B?UGF4RmNEN3VYMDNrVVFvOStVaG5jSnl0eGIyWERyWm5RN3FBbDRaOFVCTnVC?=
 =?utf-8?B?a2paT3hvNWRNTk53TytLbldIZkJ5cnNqL0p2RFpWSmx6TjN3R0tWNk5pNU53?=
 =?utf-8?B?RWpkMWZHaXkzanppcUw2M1RGK2pES2g4UkttWHNXYk9PNDIxd2JPVks5dkFt?=
 =?utf-8?B?bzUyYjgyOENON3RYYkRvR3B2aklvZkRvN2psZUxraGJINmIvREJrYitlRmN5?=
 =?utf-8?B?ZEw3OXhpWTJWMVRtR3lZeStFVm1hVHRyZFBWd1VVUFJSaGJWRFVqQlJteEFU?=
 =?utf-8?B?UFMyM0ZUYWlRT00rbWVPd3U3SW9jQ2dMVS9mbXE2TDB3a2hoK2EzOFBtUXZO?=
 =?utf-8?B?d1VXTHpwMTdtZUpFNDc1cWsyN3JUTTExN1pIcjNIbmJabUdYNjBPdjN0VjJT?=
 =?utf-8?B?QWlldzIyaUFMM2RibjhCVlpBME1qdHd6bHdaR1JJcVRCOGNwV003bGJNdHZt?=
 =?utf-8?B?TmFzUXBoTkdTRFU5ZVdGZEtqRTJOam42WnB6SlF5b2c2UEV3cEQzcGJ0dGpP?=
 =?utf-8?B?Q1FFWTBvaWdieDZpVVdsMERBZDBjMUNzUGpaNlljNlQwTkUxS2tjdEpBZmht?=
 =?utf-8?B?dFNvQ285SHJORCtJS1lyaDdKT29oZnZKSHozOG56NDRHUENqMUZMS3FiWTIy?=
 =?utf-8?Q?c2MEQIVhYasOOWmyvFDQFd4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c7752e-2fb4-4bfb-ba75-08d9eb11f371
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 14:47:38.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIrRJfHBwNS+dK/9ABwfdebiTx1fUiEUqqKc12VPLVidinzvNNncbQ9Ys56A6lZY7/QEqgu4+A5Zm6uvk+M17g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5705
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 03:28:23PM +0100, Jan Beulich wrote:
> On 08.02.2022 15:20, Roger Pau Monné wrote:
> > On Tue, Feb 08, 2022 at 11:51:03AM +0100, Jan Beulich wrote:
> >> On 08.02.2022 09:54, Roger Pau Monné wrote:
> >>> On Fri, Feb 04, 2022 at 02:56:43PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/cpu/intel.c
> >>>> +++ b/xen/arch/x86/cpu/intel.c
> >>>> @@ -435,6 +435,26 @@ static void intel_log_freq(const struct
> >>>>          if ( c->x86 == 6 )
> >>>>              switch ( c->x86_model )
> >>>>              {
> >>>> +                static const unsigned short core_factors[] =
> >>>> +                    { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
> >>>> +
> >>>> +            case 0x0e: /* Core */
> >>>> +            case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
> >>>> +                /*
> >>>> +                 * PLATFORM_INFO, while not documented for these, appears to
> >>>> +                 * exist in at least some cases, but what it holds doesn't
> >>>> +                 * match the scheme used by newer CPUs.  At a guess, the min
> >>>> +                 * and max fields look to be reversed, while the scaling
> >>>> +                 * factor is encoded in FSB_FREQ.
> >>>> +                 */
> >>>> +                if ( min_ratio > max_ratio )
> >>>> +                    SWAP(min_ratio, max_ratio);
> >>>> +                if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
> >>>> +                     (msrval &= 7) >= ARRAY_SIZE(core_factors) )
> >>>> +                    return;
> >>>> +                factor = core_factors[msrval];
> >>>> +                break;
> >>>> +
> >>>>              case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
> >>>>              case 0x25: case 0x2c: case 0x2f: /* Westmere */
> >>>>                  factor = 13333;
> >>>
> >>> Seeing that the MSR is present on non documented models and has
> >>> unknown behavior we might want to further sanity check that min < max
> >>> before printing anything?
> >>
> >> But I'm already swapping the two in the opposite case?
> > 
> > You are only doing the swapping for Core/Core2.
> > 
> > What I mean is that given the possible availability of
> > MSR_INTEL_PLATFORM_INFO on undocumented platforms and the different
> > semantics we should unconditionally check that the frequencies we are
> > going to print are sane, and one easy check would be that min < max
> > before printing.
> 
> Oh, I see. Yes, I did consider this, but decided against because it
> would hide cases where we're not in line with reality. I might not
> have spotted the issue here if we would have had such a check in
> place already (maybe the too low number would have caught my
> attention, but the <high> ... <low> range logged was far more
> obviously wrong). (In any event, if such a change was to be made, I
> think it should be a separate patch.)

My suggestion was to avoid printing both (max and min) if min > max,
as there's obviously something wrong there. Maybe we could print
unconditionally for debug builds, or print an error message otherwise
to note that PLATFORM_INFO is present but the values calculated don't
make sense?

In any case, this is just for informational purposes, so I don't
really want to delay you anymore with this. If you think both options
above are not worth it, feel free to take my Ack for this one:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

