Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF37B34B6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 16:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610549.949999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmEIy-0000lP-EO; Fri, 29 Sep 2023 14:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610549.949999; Fri, 29 Sep 2023 14:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmEIy-0000im-An; Fri, 29 Sep 2023 14:17:20 +0000
Received: by outflank-mailman (input) for mailman id 610549;
 Fri, 29 Sep 2023 14:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdNd=FN=citrix.com=prvs=6299eddeb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qmEIw-0000ig-3A
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 14:17:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2df283e-5ed2-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 16:17:16 +0200 (CEST)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2023 10:17:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB6944.namprd03.prod.outlook.com (2603:10b6:510:15c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 29 Sep
 2023 14:17:09 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Fri, 29 Sep 2023
 14:17:08 +0000
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
X-Inumbo-ID: e2df283e-5ed2-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695997036;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5SWco/b7eZWbDM+2rRN+VTyhvGyiPaAvdv8L84S81t8=;
  b=DsvFMNn86ktfcmra1IcVMNv6mPQo/NNJDAe1vUOfzTstJBrACub5UNJe
   LgG2gxgZxBBgYJqMM/eU8s3B1naNxSA2mazHIzkN0GJLTj+FUNaZg0fL3
   7rMxOGO63V5slkvGv7rLhGsoRylVk9dC1Qa17aANFryCc1qWg8w0eC7Ow
   I=;
X-CSE-ConnectionGUID: l89dakrkRCKcCL7ZStAOFg==
X-CSE-MsgGUID: 0BuyFZpRSDudyKCLJVwbVQ==
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 124191488
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:zF62RKpX28rrlax2gdOgMyUXDsteBmLuZBIvgKrLsJaIsI4StFCzt
 garIBmDMqvcYzf3ctt0PIrn9hgGvJbQndQ2GgVuqSpnHilDp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5wePzShNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADRdPxyKhPi1+pmYQcJI2fYYMODMEoxK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIW9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt5LReTkpq4CbFu7nkYOGTMkTWGAjeS1m22Vf/BhN
 EYqw397xUQ13AnxJjXnZDWkqXuNpTYAWN5dFeIr5QXLwa3Riy6bDGUZSj9KaPQ9qdQ7Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HhvYUygxTnXttlVqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEuZzhXgMzoALNUQqNzg5/fp/jWIWu5nDS9/MGJ4GcJmRtp
 1ABksmaqfsIVJeEkXTXRP1XRO32ofGYLDfbnFhjWYE78Cig8GKieoYW5yxiIEBuMYAPfjqBj
 FLvhD69LaR7ZBOCBZKbqartYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:q2/ZZKhveKpY6/RYVG7sXQ1sM3BQX/p23DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwQJVoMkmsjqKdgLNhS4tKMzOW3FdAQLsD0WKm+UyYJ8SczJ8V6U
 4DSdkYNDSYNzET5qyVgTVQUexQpuVvm5rYw9s2uk0dKD2CHJsQjTuRZDzrcXFedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0oTvXOvNrCkbPheFojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv+/olbg9zoz/pEHYiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2O
 XkklMFBYBe+nnRdma6rV/GwA/7ygsj7Hfk1BuxnWbjidaRfkN2N+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnzUQ1wnEbcmwtvrQdTtQ0RbWItUs4RkWUtxjIULH7GJlO41GkTKp
 ghMCgb3ocVTbrVVQGdgoAl+q3XYp16JGb6fqFFgL3e7xFm2EljyU0W3coemWpF2q4cZvB/lq
 D5G5UtrapJSMAOa6J7GaMmeuuYTkLwYT+kChPUHbzAfJt3Y04lb6SHuYkd9aWkfocFw4A1n4
 mEWFREtXQqc0arEsGW2oZXmyq9NVlVcA6duf223aIJyIHUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10mmMqMiXkU2QYkQoJI2SliOqsXEJsnjsfHaau/aIP7oHSw/Um3yD3
 MfVHz4JdlG7EqsRnjk6SKhL0/Fawj659Z9AaLa9+8cxMwEMZBNqBEcjRCj6sSCOVR5w9wLlY
 tFUcLae4+A1BeLFDzznhlU0zJmfzlo3Ik=
X-Talos-CUID: =?us-ascii?q?9a23=3AEggbzmqQQkkxm8dHsXUd+23mUcR1I3HUz23TGWS?=
 =?us-ascii?q?bAk1NF4+uVXa31qwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A4meGTw9jCK95/rq6SeofGwGQf59C/rWAOlg3qrk?=
 =?us-ascii?q?bt9inHghSBSiXsg3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,187,1694750400"; 
   d="scan'208";a="124191488"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4yQh2hRjwEg/iiyqhxEkjzomBIrJdhhz6CwR3qXzsWmpOR/Yx/i5XyNDT3uA1NqSzrTxLoUADvEW33C2l5XUr2Icu97jjl2UoFwaLQ1NcQN1/XCAGibijoOOfwId8LPi8nZOsx5pQo+YcdzsBzvRPxENtcYa30ZQ3zbHJH9+erE+vCI46D02XvEDKD3iMzCrknh5lq3HlsMQQawzuyhen9dVRBS7ghyNyQGYjh+lLPHpZfQqndRifckFI/reRaEQAMXw+qHTal4GTJzg/aV4T9DiTHQmcFa1j5N4QHXaymdBCVzRU9cNWxE6NaVZiSVY/StrDq/RJ6zhIJ9xxk5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntp9RtGQDFqshZ2hLlhC/ZTLBjyevaTXr24A+tTXupo=;
 b=KVhgXXAuaXSz8rZvlmkDbTaGacoG8DF+n9cx9VYuhVf0Avsja9EAn6C4NsbZTU8Iw34Gk5bTWILJnNnWJMv4wxQqhCl5FI9X05csju09O52F52SVsTM/+/+KILsMZqSXIyMAmD2nLMoimdowBwjs7V8wyMlRJ1JOP0fPkzjcw2M/oILGc5Oz1u8aRnNC5RC26zj+8WIqALo0L5yIojngaykw0yS/cuPPSqCUCVcmP9wyrIDW6tjd53RnfLkoJ9htXIXpMyUnTEg1zK83Fu2Bqq1hhoi/JgWD7mFwxO5dzHXPOT7ZjRkDcXHVxrb45ahX/4vNag2JekL9PlxTBh9P4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntp9RtGQDFqshZ2hLlhC/ZTLBjyevaTXr24A+tTXupo=;
 b=mrVSkuGiQFHbWHpAU6DLdt2BczyhVFBAFvKnoShwNXJ6H6//IfQCWctGMA9dzua+jVPj6m/RehZpfPp++O3RkUgs0PoDwltefhbti2xfn49/eqQdc35h717ZEr4lACkbES8zIi0JkLqbuyf6YMfXAr/i1EJVJrCw0PEhbOFnjt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Sep 2023 16:17:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRbcX2CRIFrqYzSA@MacBookPdeRoger>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
 <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
 <d285a456-307a-0a36-0910-cb80f419627d@suse.com>
 <ZRVeiAFlyf1LJ2qR@MacBookPdeRoger>
 <CABfawhmAZGTaKZfmwY4t8599i6qKaTOJ-fngFmtvS4LhJMh7iA@mail.gmail.com>
 <ZRWI1vGscL9ItRMk@MacBookPdeRoger>
 <CABfawhmfFuB14CiPdyaP4HNayms0AG5=4h1FNURu4MDgt2HzAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmfFuB14CiPdyaP4HNayms0AG5=4h1FNURu4MDgt2HzAg@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef8f832-d27d-4a7b-729b-08dbc0f6c37e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	21plthIDUbKEOfoBhrlNhwaltPU0bbiHT/3vLcJ3+/7cxlHHe5CANltcPiBZBvpW7Le4hPgVLG/iwt93n426YhK9eCy9XsA0ImlOteyVnvgPTzr0D15flOirCs9egcOFC3BIP7i+QkwX48LR69lw1WYY4soiT2LBgH+QbrDb2deK1NWM7aO98Vbr8M2FosLwmOepi8ylf/3LL4/RAqgpyg0ebDh1hpzBWqaCrKD3Fa2RLu/S+N8yzMGNS5Wajamkhaf3ORluyCC+ekHWddNgVAHO2W4LJT/GPDDfW03rGpgheEgWV4POrbm5SPYrUlpRGUSCTQbDAi5sqHu9eydKhZtg7yo7XUF4o5lyEUq02qKR16sSBEn8oKdAzRcJCOh2IOgyWFkX2yKaLeu2ndJGTdHCWgvW2+ouVCf2dGtxeXCqPDyA+2qzOUbPd1eUXDQElyKF58ObCTZ6UuLulzI/DZOzZoHcqW3z+awtmhlXasjE6dsPp611c2mozNdq0cIH9VnknDhHipRsy6naLoblnjGlzy7yb3v6HtshBpu93Ndjn+lE8n71BlfoFgNEbTNf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(85182001)(33716001)(38100700002)(82960400001)(86362001)(66899024)(6666004)(6486002)(8676002)(478600001)(2906002)(4326008)(66946007)(53546011)(6506007)(26005)(66476007)(8936002)(54906003)(66556008)(9686003)(6512007)(83380400001)(6916009)(316002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVhzY3huUTU2eGdRNFpyS3ZKaWpVV0NpWDZOME5HQ0JWSnUrU0FvNWNMdzFU?=
 =?utf-8?B?YmNBZUI5Q1lSZW4rZDVVQXdmVzZPb3hyZFBvZFdXTTV2WWtXS0F1WFB6d050?=
 =?utf-8?B?WFZyRkhSWkFZWUxFaTh0eFdLY1hmMlJ6WkNGd0I3Y1krMVhqSWorZjVaSXhn?=
 =?utf-8?B?N1lGaVFEamxEZ3ZvY2VrY3Q5WkdiazlVZk9wZFl5Q0JPc0RWaXBJZWphUU83?=
 =?utf-8?B?bUo3NUFDWHNTZzNvOHFoUVdUUkZsVW8wK3dQZzZCaFc3ZTlXOWlMZ0xKcEdI?=
 =?utf-8?B?b0N2S3NoOFNDMXJ3TGc2U2dtVE01U3MrMDBPNENCTndUSFlWNzMvMjZJNFU4?=
 =?utf-8?B?SVU3OWJQM2xNcnc4REd4Z2h1QWVHdWRNZE1ES1RrSDVHUXl2QUxBWjRBVG1W?=
 =?utf-8?B?MXU0Z0tZM0IwQU5CS1pIZXhNUndNL21tMGJtVXpFbzk5eGx2c0xTV2ppS1Bl?=
 =?utf-8?B?VUlsZkdhaGF0a2JVakFwdEF6akUxcUVtWE0vTDVJZHVyZ29EcmtMQ0lOQ3o0?=
 =?utf-8?B?Vko3V1dSVVQ4QnpPZ1l0NTR3OGRRMytZRnNWTEVKQisyZG1VK1F2Nzh2ZXdJ?=
 =?utf-8?B?VGVnSzErY2s1dVpKYWFHNTI4Z0h2UkY2NlAwQjFXajVMUFc2MGlkekhLem8y?=
 =?utf-8?B?SytRNVIwbmxCS2h1Q3VhbjZER3RUMG56NnlzMDlPUTFxQm90aXorZzRlUUNE?=
 =?utf-8?B?ZWRMRC8vbENyWnYwRTFBN1hKYVMwbHA1TWU2Z0dTTVp5cEFuTzVRR2xqVXZZ?=
 =?utf-8?B?UG9pOE1iUDlibHNNa1czaFM0ZW5jSHJRelViMTQ2Qnkva1M4U2tNckZYTG9X?=
 =?utf-8?B?aDRNczRjc1JJVlRHNzF0UHMrdzY5RENmYUtyRGtUMWNqZFAyRlVkMHZKbllu?=
 =?utf-8?B?ZUdrR0dVdStIZlYxYlZMRitoWUN5ajlxcGcwcUZSaVhITEpqcW5IcTJscit1?=
 =?utf-8?B?bC9USisyK0oyOENXeVo5d2NHZjk3ZFc4S1NaeVZIS1ZhT1RmVGpMV3NPaVJW?=
 =?utf-8?B?LzFucm93THFBNnc2UjVnTExaT3dUSGNFS1pCZUJHbE5rRHQ4UmNmT0lNbzNN?=
 =?utf-8?B?VHl0MjVMVWJpQlRFaWZTLys4di9ROU5XMjJpMHdtVDBabGk3N3VNL2FhWTlp?=
 =?utf-8?B?dGhZTXpnZ2lNU0twVCs5ZkZEeVU0eFNQZFRYZ3haTm9FMW0rbHZCTnRQUVNk?=
 =?utf-8?B?d0x3UkV6T2RYUnVoVVVCZEF5RUw1MlBDYkJvRWNrM1lVQ01GMDFKRzB1Nkhn?=
 =?utf-8?B?TElTUFdxMStnRHFEekdmVVNTbmQ2SDRqbVB3RU1CNnpMUjRGbkVtaFV1a1cr?=
 =?utf-8?B?TDQ0NE1rMkRCK3RDakMyRGQxanVadEs2WmFzcWZobFVxL3pReDBhUmJsWjls?=
 =?utf-8?B?ZzQxYXNSMFJFMktVMmRkQ1l0M0NudjduZzk1RTdCb1pPVHZ0WEplMmZoelRU?=
 =?utf-8?B?SDI2MXNOd3N5Q3l0NmVyVTJraHAvTy9oQXAyMStJbnZJcnhmbzM2VjJSRHRI?=
 =?utf-8?B?VDNxUHJORFAvRzg4NlN0NDBIMk5uVXhLYzNpOUF0b1orYjI5blJSQm5uSFBQ?=
 =?utf-8?B?WEtEVWs2OXA1aHlNV2tiMnpYN25Qc0VvRytITnVIQUg5SWpvVUxoTlJNeTYw?=
 =?utf-8?B?Z2Qzd3o2c2hVbGgyajVGK216Z2NQeDd2eTJJQUVvOFJyL0RPU3RBL20zNkNZ?=
 =?utf-8?B?bW0xazc4d1Yxem5RNVJsY3dTTkFPaWMrMWJjR2JJdkp6SnVwZllrTUMxc2RT?=
 =?utf-8?B?MzhlaUZXNkNGa20vWG5POGw2NzRCSEo0Qk1vN1orZklnbERBcDVsWEt6UHY3?=
 =?utf-8?B?dDNxZDNnSFp3NlVSQWV3VCswTXBoSWdkaERqWHk2d2Rpa1lSUVNFZ01CMkRF?=
 =?utf-8?B?ckdZUy9ORldsdzJjMFZ6YStsckdHc3YxRU81YVQ1L0t1dlluZlVucUxiUVll?=
 =?utf-8?B?OWF1aHRibGR5WU0vK2VXdmtodTdtU2RMMEZFcnV2dkkzMkh1ZGV0MXVUeHo2?=
 =?utf-8?B?OU5LSE9ET1pZQ1B4SnlWVTM3UFVaUlAyaHpOZTArMUcxUkpJdG1FWVBqRUNI?=
 =?utf-8?B?WlQyVm5PSHJldm9HbGhxeFR4YlBZNTY2bzhHUnlOOTdBRkRKcHFWMnZYelB4?=
 =?utf-8?Q?pTt3+doHx4aUQp+pykSOnBjRo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N55QeIgt7NzQMg4YHaAsT22cqqkbg5oIfq3PhMs85cXrFSnvrBu7N/MvVdrhkGyGu/35FoNqkxDNMj56JWH1M6hp7KM57TeJ4YkJLcKrWemyU0mE2tJSKwMNNlfo85tX82k59Oq7au4yWT2o5+zD74ppoGHyyGQke1yJWkG7afiAK/l/I8ru7xHeTjwX3mgrjGYYCfc5Fv+w5XMmkhi4p9Q1nkp6FHuet7GD6/YkKIKK+aH7LZIjxEktC2Bco6CxKjS7IoU4KpikmHXl32lqh2ZridYmUZSEcNO8os5DnGlHWg4SgRl0tsZTiLBR080gztfWM31h8jiHFKukgLbUHEmtztF4jy28LYmqSNNdrVG2FbY2yoDf8HJ1hezb9RZuO7FHpsSB7H7NDFARpI2ZHmNLkaK87GjJcXd+QeOFFE/pMhGd/eYWy1kK7vIg3KAgY3bTmZ3EPC8t///AcsDVSQdJW9aDfCCRnM9alHRIK8kZCVkLk2ilD6Y1lczPJ24GC44g+4P7XrHzvzcHLUlJLaGYBem62ZS3BLcNuErxX/qfwvQa/vEmbJgOdv+u8nNi5KlFf+wSMX7+wG51WjPvpvTGeC6u29aRTOyMUiC2E4jeAW8FLCRFaTE00KtH2IAtTtjA6NYeDZr+d+rr16OY8PJ9xzL6wIYmlkzI2LDC96QSqVnHXmbBhplcyqwVvh+NpDRsfnrhWJ8G7leNkPi3h03UmwTXyubJeezuCazuZOjojQZf6FIQyA+rJ84JOC9lsnt4UbL+kv++5qLEo/305V5zXPQ/1I0+DmkdBENAlnVJEcicr8U9wYMrf32uhJ3SSPlRaIZBFDchsBYQycy73GcCznWzCws75q8n4f/JTv3j5cf3bikgJ7tx1UKmKylMwgLUONuRAzfNjrIHrDWSHxZsRQnkfJK295x6rj9IFP0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef8f832-d27d-4a7b-729b-08dbc0f6c37e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 14:17:08.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crQp95AcFQA0HdrAYALx3XGfrNrd7Kw6ffb4Jon1ypvA7VAUSuprboyOZJlnSAM9TKrCtYg0He6YcV4+ASmT/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6944

On Fri, Sep 29, 2023 at 08:31:58AM -0400, Tamas K Lengyel wrote:
> On Thu, Sep 28, 2023 at 10:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Sep 28, 2023 at 08:57:04AM -0400, Tamas K Lengyel wrote:
> > > On Thu, Sep 28, 2023 at 7:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Thu, Sep 28, 2023 at 12:11:02PM +0200, Jan Beulich wrote:
> > > > > On 28.09.2023 11:51, Roger Pau Monné wrote:
> > > > > > On Thu, Sep 28, 2023 at 09:16:20AM +0200, Jan Beulich wrote:
> > > > > >> --- a/xen/arch/x86/mm/mem_sharing.c
> > > > > >> +++ b/xen/arch/x86/mm/mem_sharing.c
> > > > > >> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
> > > > > >>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> > > > > >>  }
> > > > > >>
> > > > > >> +static int copy_guest_area(struct guest_area *cd_area,
> > > > > >> +                           const struct guest_area *d_area,
> > > > > >> +                           struct vcpu *cd_vcpu,
> > > > > >> +                           const struct domain *d)
> > > > > >> +{
> > > > > >> +    mfn_t d_mfn, cd_mfn;
> > > > > >> +
> > > > > >> +    if ( !d_area->pg )
> > > > > >> +        return 0;
> > > > > >> +
> > > > > >> +    d_mfn = page_to_mfn(d_area->pg);
> > > > > >> +
> > > > > >> +    /* Allocate & map a page for the area if it hasn't been already. */
> > > > > >> +    if ( !cd_area->pg )
> > > > > >> +    {
> > > > > >> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> > > > > >> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> > > > > >> +        p2m_type_t p2mt;
> > > > > >> +        p2m_access_t p2ma;
> > > > > >> +        unsigned int offset;
> > > > > >> +        int ret;
> > > > > >> +
> > > > > >> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> > > > > >> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> > > > > >> +        {
> > > > > >> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
> > > > > >> +
> > > > > >> +            if ( !pg )
> > > > > >> +                return -ENOMEM;
> > > > > >> +
> > > > > >> +            cd_mfn = page_to_mfn(pg);
> > > > > >> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> > > > > >> +
> > > > > >> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> > > > > >> +                                 p2m->default_access, -1);
> > > > > >> +            if ( ret )
> > > > > >> +                return ret;
> > > > > >> +        }
> > > > > >
> > > > > > I'm still unsure why map_guest_area() shouldn't be able to deal with a
> > > > > > forked child needing the page to be mapped.  What happens when a
> > > > > > forked child executes the hypercall to map such areas against not yet
> > > > > > populated gfns?
> > > > > >
> > > > > > Shouldn't map_guest_area() be capable of handling those calls and
> > > > > > populating on demand?
> > > > >
> > > > > Funny you should use this wording: P2M_ALLOC will deal with populating
> > > > > PoD slots, yes, but aiui forks don't fill their p2m with all PoD slots,
> > > > > but rather leave them empty. Yet again I need to leave it to Tamas to
> > > > > confirm or prove me wrong.
> > > >
> > > > If the child p2m populating is only triggered by guest accesses then a
> > > > lot of hypercalls are likely to not work correctly on childs.
> > >
> > > That's not what's happening. As I said before, ALL access paths, be
> > > that from the guest, dom0 or Xen trigger page population. If there is
> > > a hole and P2M_ALLOC is set we do the following in
> > > p2m_get_gfn_type_access:
> > >
> > >     /* Check if we need to fork the page */
> > >     if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> > >          !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
> > >         mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> > >
> > > Depending on the type of access we either populate the hole with a
> > > shared memory entry or a copy.
> >
> > Then the code here is redundant, as the call to get_page_from_gfn(...,
> > P2M_UNSHARE) in map_vcpu_info() will already take care of populating
> > the child p2m and copy the parents page contents?
> 
> Reading the code now, yes, calling map_vcpu_info() would take care of
> populating the page for us as well so we can remove that code from
> mem_sharing.

Thanks for confirming.  Will try to prepare a patch next week to get
rid of the explicit child p2m populate for the vcpu_info page, and
hopefully simply the code here also as a result.

Roger.

