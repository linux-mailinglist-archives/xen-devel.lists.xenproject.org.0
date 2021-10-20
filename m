Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B0434644
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213631.371916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6P8-0003w7-LI; Wed, 20 Oct 2021 07:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213631.371916; Wed, 20 Oct 2021 07:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6P8-0003u1-HL; Wed, 20 Oct 2021 07:52:54 +0000
Received: by outflank-mailman (input) for mailman id 213631;
 Wed, 20 Oct 2021 07:52:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md6P6-0003tr-Pd
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:52:52 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 658f3b28-ab1c-4270-abcc-59a9e4fa3ad6;
 Wed, 20 Oct 2021 07:52:51 +0000 (UTC)
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
X-Inumbo-ID: 658f3b28-ab1c-4270-abcc-59a9e4fa3ad6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634716371;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IhSAS3rv4rKboriy4QJILijX0v9ECvxZKnz0R3A+Wok=;
  b=IEwUCzV4bJfLmLlq8Dar4VennQadZUy2ZmSAvXFYKkNlbx/p3rAUe6Ul
   qyYslr9mN2CfI10VzGhQlnwICOer0iebxFd1XCgrs8i3KMoL1rk9xGQZm
   Us2F9r9BRYgDrwGKYpBVw5G2BF1tZWO/YDzOrALRbTgzlPuQlqOcEvdAL
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 70aFUX49wuSpgjubCYB8O4odPLu1pPmzwO/83ESWJg/KE0RMyKRmShbuhrdlz1XQW0Dptp78RQ
 b2nWUIwrheCRQ3cYlPLy240ikhlkwnFz+TRMSNsfuzu1p81fCUzxg/XMuTyqWT8xYuIDWLUhWw
 crLMz7kYAS5R367uno2inlB7X3g8UqoCXs868Ut1OfH7JXDaqCV5SMsSwRcks/72IVZsvrszCi
 XMLpBSC0mTYhzbbaZ9UruL6SX6xkxAd7PthziVS8L6hmwlKvglZ/HNiqTAcLRCtaliO+IUzgIA
 u1HK30OBRlzhL2BPbGwO443I
X-SBRS: 5.1
X-MesageID: 55169651
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SiBdzK3UXm076eGxIvbD5T52kn2cJEfYwER7XKvMYLTBsI5bpzMPy
 mMcUWjQPa3fMzbxf9xzOYy2p0IFsZDcyt5gHQNvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es7wbZh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpex98
 tFB9rWMVxoGGJfMldkEaxhjDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIIBgmZu25km8fD2X
 ekrSBVufCr7Rz51HQsOMtVhmLi3ryyqG9FfgA3M/vdmi4TJ9yRy3absNpzJe9WMbcRTgkuc4
 GnB+gzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4KdE20gWBiYPo/Ru2IFIEQwNYUN0dq5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnBcE1NUizX3iMRq1EiXF4c8eEKgpoStQWmY/
 tyckMQpa1z/Z+Yw3KKn4UuPvTuoopXYJuLezlSKBjz7hu+ViYjMWmBJ1bQ5xaofRGp6ZgPY1
 JThpyR4xLpSZX1qvHfVKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aImO3P
 h6L418JvcY70J6WgUlfOd7Z5yMClvCIKDgYfqqMMoomjmZZJWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dw5adiZlWMiq8aS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLM9sDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:znox0632bcw8ESG7dXVL8AqjBThyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdL3AYV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1ENQq4Lbw5eXbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj3sV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MSTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4Kwupk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizypSKeSXLzAO9yq9Mw8/UpT/6UkRoJk59TpZ+CUnpAZEyHpnIKM0vt
 gtMcxT5fpzp4EtHPpA7Epoe7rANoX3e2O4DIulGyWuKEg2AQO+l3fJ2sRA2AiLQu1E8HJgou
 WMbLtn3VRCMn4GT/f+h6F2zg==
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55169651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=metJU38H6LbblKo8hSycTJ6dpfxeuJAFuLO8AOdpeanQbOaVJmOWlxk7E/UBR+bh5VcJd1IcFrSLWrkgr+Yv4vOif5Mp38aDKZQkDEdd+UDDPVJOuc+tkVeriG+GJN2nsgdNJYjN0O/B0PbOm7Tq1F8FwDHw9F4ywrONmU/ifUcuSMUjaRim8Q/Ef/sKU9zVdvOn5YuNG3am0NXkj1iU3e3AZf76JTxAFLBJq12voBqj8UdRiWX6LJOnCXmzgaGoa5OP5VjRS7/QazQvKTVXLEy6CYQTrH9IHIvFiGnK2dWHHuhHEmcpfqO9CPxpe1yXojLOYoqnLoc/XY+NFccNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tmuztz6vwa+9JX2I2mZx5cXZbfajbLXBNtVQbjZ2Gw8=;
 b=YguayAXQHtRIgLwMC5a6tELvO1OgM80hoBZpk+s7/3OLz8tQq03CIUtCGPhKrrCqb87kMYH3AHlL+KmGZaoK5vaJ5CnflADsa1WkjJFoN0TSA6QoSddMlVP0nF6ev+Jr+iLu4Fi9ZT3fnvt12UM2dp/d+/53B/AQ73H6i4UY9kJJ5krat3m+en384+gIUQMPclQMCaLPx8z9jy925ZbUHceMlpvoE2lvJnjtskamDDoN2lNUe0jHpHknWXTlFxRbKkUP9KBzFjw0gXWOQPpI4KGSOs7mxAA5FFRwgO68iqOcJErFKone3IrQ2mpi/xlXOTU5H6rRbF0NC+JJFFdS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tmuztz6vwa+9JX2I2mZx5cXZbfajbLXBNtVQbjZ2Gw8=;
 b=dPttiOLr6pFwzoczKlGFMxVJfTN1Cd8yXiti4XNMgQHBXd59HpBVt1Y6UiOXlGpGRlMb8l4zx3/6228nAgT+og9w0SVZDUMvTB9G3KMyKKe+6XAv0wKr4i29VikHBj85B+V2lGsoMg0Kn2QL4NmB7H1Zn6GXdU4UWO2h5H/aW68=
Date: Wed, 20 Oct 2021 09:52:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2] x86/PoD: defer nested P2M flushes
Message-ID: <YW/KvT/f9KE6dTGO@MacBook-Air-de-Roger.local>
References: <c6f2dcd7-81e6-3fb6-0e13-3ffb95e12bc1@suse.com>
 <YW7N13JsVfwwcqAl@MacBook-Air-de-Roger.local>
 <67220d20-9722-6566-0c6c-6166e346b09f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67220d20-9722-6566-0c6c-6166e346b09f@suse.com>
X-ClientProxiedBy: LO4P123CA0261.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1488fb82-b1e4-4b11-de7b-08d9939e93c6
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5084D87F62F75CC0891F373F8FBE9@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o08jPy3erxxukcZk4ydzgYXyd0KnkkHGfl1Nsvp5Yo3d2laVwHjOk5Ypa05ZS04XGp8Ig6x4HjimMv59+Ji/1MUo0bAmLLt7AOzQRuxBTOXhGmTtSUOzxKea5JaMGiFKVnXZDvarAnGC6SNm+/pPk6MUxFoWzFOezjZmH5qJP9RUVf4fg8esN0Jzvsfj3E0DqUFkm2rl/zmGNUgr1t2iZ28tmOQ6342C833Q5SQIAfKCMieMWAIhw0h7nDvUGV9WQWfv7CQi0tW8rsXq1W4MDV2GHHkOgNQ+wwZyNDNhsZoDIcc12Y8UK5Nld91vZVASiRBNLtnKgZT3W03NyTkEHX5GFO+JI0wLlJ+3zBW0O6FApn4CvDevrcAa9WFqVolzAXJJhuBfURPWU4YFOIMx7KHP59ZB+0sGjga//9v8Sduc5KqAIGbEioPML03D/hidsH3tF7rtXxsk82qkRDrSulEDKiVjwXPvCAL89Cx3fHYJuYAaUtz6lkM9aHt3hR5Ymzgx/tvwRRXigGx/s9roW+PALPX8vIK/VWbBW1eQKpVUYrFFcdylfi53AmpGvDBfzrqu0RhDJV/oA1LD5rMIcWSs6AszH9+9tuYgtMOwXduqrr1ooyBkyKXeRTpVfjwvsniNmugvyAO8/hVGIPkKlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(5660300002)(85182001)(8936002)(2906002)(66946007)(6486002)(54906003)(316002)(26005)(82960400001)(6666004)(186003)(66556008)(86362001)(508600001)(4326008)(6496006)(38100700002)(8676002)(53546011)(6916009)(83380400001)(66476007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE9DVGVXUzVRKytwR2hKS2dPNVJmMDhMQkJEZFpKRFlzK3ZHYzMwaWlsZTFS?=
 =?utf-8?B?YlRkVkN4bDNQTWRXSlRtenJzTUgzZTdNaXl2TG9ZZEY3bXQzY0ZEMkd1RjdP?=
 =?utf-8?B?dG9KcVZscFNMWUdBNmM5c1FBSDNnNHpMc281eWlxQVBBMlRSdXZCRXd2M0FM?=
 =?utf-8?B?d1BXRFg0dXp2RHNGUXVHcFRpbGptczFjZ1V4U3kxVTZyYy84d3hSY1puSG1s?=
 =?utf-8?B?bC9PZm9iTjRjUDE3Mkt3SklKVDdRVXQyWGp3ZGxJckxITXRUZUlUR1E1bVZW?=
 =?utf-8?B?QUxQYnFjTko1Y1ByQWp5bXNKTVUxY0RBY1VRU2Y2enZhb0hJRW5GK0d4ZzJK?=
 =?utf-8?B?VytTS1ZPbXhzNjk0T0R0aWJ5VTV3S0lBZjVLUjFoSithaGJhdU1zcENuZ2lZ?=
 =?utf-8?B?T1pBckhYQmc3VTVHczdPSWRRQVpCckdpaHE4RlF1TTJPSmhhTCswandvQ1FK?=
 =?utf-8?B?VDJQNTgzbWtjdlQ4VStTUUQ2Z0d1SFlESnZ0MXFGeG8yb1JZNGttUk9SYW5q?=
 =?utf-8?B?dkF4Y24xbm5DdDRwOXBoNmZyTERKUW9FYzV4SklEQmE3NTlURGV0OE9CSVZt?=
 =?utf-8?B?RlBrNzlYQzFTd0JJdEh5Yll2dUJJREJTbEhhSkNFT3pKUlVaN3loZ3NIU29G?=
 =?utf-8?B?WnBFUzZ2VGpaM3JXOG1hcU1GU0EvdXRON2JUSUZHQTFING5jWFB2V2FGRzZT?=
 =?utf-8?B?U2oxeEdwclBUNlJManVHZUpGdmZrMk05UEkrbldPbE8vUlBXT01zYWtTUHAw?=
 =?utf-8?B?VnBBek1FMlVOci8vN3JXRlNDc1ZKaDhqcStoUUlWNE1kVkNOaHpYSnFLTlZR?=
 =?utf-8?B?QnRZNEd5M0ZFb3pTakQzVmRnd3RZQnlvVW11cDFsMFdNb3ZmNktUOC9UQjMr?=
 =?utf-8?B?U2hzdTZjTCt2SWtmOUNsS2hNbEdxNmdPTVdrcmtDS2cvTGpUMHVkR29PNW92?=
 =?utf-8?B?T1hyb3JqTFVCN0pPMmdxSVdqcmtvREVWY0RTeGxmZFFGMmF1eG1OdmpoOE0y?=
 =?utf-8?B?VFZXbUJWZ3dxNHYzdVpKa2VzMmN6VHExL3Jzam8wLzNRWjdyTWJFRnI5UW92?=
 =?utf-8?B?Qm5EUjBTY2JXQTVlTGlzdVllOHNqOGNpcUd0cGJBTFV0TXZVbW5oOXpOVHN3?=
 =?utf-8?B?d0lGakl4TllEOTJqQVZ0MG9hZklkeW5OYmwzSzdnUS9uazI5UkdycFYrcngr?=
 =?utf-8?B?OFF5QW43anN6TGpDT2prb3RhNGYyV3BhTzgvMlNYZUZTMXZvb05IVzg0dDdv?=
 =?utf-8?B?WWhHc3lBWXJYSTVVY2pVWE84MW1Gb2dLc3BkSHhLbjY2Yi91WTJRU29TOWZY?=
 =?utf-8?B?dDhPWVhEOGVjOFZjWlNnbzNGNEtyYmJJQTRJOTRVckRVT1ZOM0lMOVBMNVBu?=
 =?utf-8?B?OG1iWERVZDhCK3ZQUVhrSzVzSWhXdlU1SVlWa0NLWmlFd0dLMCtiRmJVeEVm?=
 =?utf-8?B?Y1B4a0FTcTFXQitDZUR0bVZHaEN4UmQvSFVqSXBkQ1BHMkJGcTJleGVIeE5Y?=
 =?utf-8?B?YTFtcnZZNmZPcmFGNXFGUXhMUUdKd01FMFZOZ3FkaG9ueWQ3MkduMklOTzQ0?=
 =?utf-8?B?QXNIdjJXNmJoTzJHNU1aUmUvdHRWWFRyL0hqemlDcEFFNVlOTmhJemRQcUZq?=
 =?utf-8?B?dnovMXFPUWlKdzlBc1RoYWVhM0VUQkJ3Ukk4NlQ3alQrK0diU3NpTERkVlRz?=
 =?utf-8?B?YjYxZkFFYm94KzR2eWpWK29QV2p4T1ZMdHlWWE5hV1FJVFN2NFFIQUhheFpH?=
 =?utf-8?Q?vVflCewv/eWSkwgqBeanbvGE9X/5V6p/Rc8N2gK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1488fb82-b1e4-4b11-de7b-08d9939e93c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:52:34.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 05:06:27PM +0200, Jan Beulich wrote:
> On 19.10.2021 15:53, Roger Pau Monné wrote:
> > On Tue, Oct 19, 2021 at 02:52:27PM +0200, Jan Beulich wrote:
> >> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
> >> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
> >> order violation when the PoD lock is held around it. Hence such flushing
> >> needs to be deferred. Steal the approach from p2m_change_type_range().
> >> (Note that strictly speaking the change at the out_of_memory label is
> >> not needed, as the domain gets crashed there anyway. The change is being
> >> made nevertheless to avoid setting up a trap from someone meaning to
> >> deal with that case better than by domain_crash().)
> >>
> >> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
> >> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected. Make its
> >> p2m_flush_nestedp2m() invocation conditional. Note that this then also
> >> alters behavior of p2m_change_type_range() on EPT, deferring the nested
> >> flushes there as well. I think this should have been that way from the
> >> introduction of the flag.
> >>
> >> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/arch/x86/mm/p2m-ept.c
> >> +++ b/xen/arch/x86/mm/p2m-ept.c
> >> @@ -1253,7 +1253,7 @@ static void ept_sync_domain_prepare(stru
> >>      {
> >>          if ( p2m_is_nestedp2m(p2m) )
> >>              ept = &p2m_get_hostp2m(d)->ept;
> >> -        else
> >> +        else if ( !p2m->defer_nested_flush )
> >>              p2m_flush_nestedp2m(d);
> > 
> > I find this model slightly concerning, as we don't actually notify the
> > caller that a nested flush as been deferred, so we must make sure that
> > whoever sets defer_nested_flush also performs a flush unconditionally
> > when clearing the flag.
> 
> Well, this _is_ the model used for now. Until this change there was
> just a single party setting the flag. And like here, any new party
> setting the flag will also need to invoke a flush upon clearing it.
> It's not clear to me what alternative model you may have in mind.

I was mostly thinking of something similar to the
defer_flush/need_flush pair, where the need for a flush is signaled in
need_flush, so setting defer_flush doesn't automatically imply a flush
when clearing it.

Anyway, this is simple enough that it doesn't warrant the use of the
more complicated logic.

Thanks, Roger.

