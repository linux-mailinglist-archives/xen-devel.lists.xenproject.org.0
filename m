Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC652C6A1
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 00:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332506.556198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrSUe-0007Ny-7M; Wed, 18 May 2022 22:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332506.556198; Wed, 18 May 2022 22:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrSUe-0007L5-41; Wed, 18 May 2022 22:50:12 +0000
Received: by outflank-mailman (input) for mailman id 332506;
 Wed, 18 May 2022 22:50:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3vY=V2=citrix.com=prvs=130e47117=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nrSUc-0007Kz-LZ
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 22:50:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd0e1db4-d6fc-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 00:50:08 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2022 18:50:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5451.namprd03.prod.outlook.com (2603:10b6:806:b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 22:50:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 22:50:02 +0000
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
X-Inumbo-ID: dd0e1db4-d6fc-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652914208;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zg+5Mucm0RhLHOcRpNOWbQI15SNxs3X3X6BztpDjvw8=;
  b=DCbUZRqKdBxpQSiyETsS3hHR/MU17SGUrlMPH39iix7S35TGOsxppm+n
   RPL0ZjpH7bluooOxMT+dWxmxTZ1jPPn8gws3RPrrTE4vD6/R8Cu1qx2Ju
   UETPRtycMSbkrAYbQeshdSTwEAxQlDQsrckQ+Jk+yc8SMoO0FuqU2LYxD
   E=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 72039074
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:46+Q6a0cvFB4wagj5/bD5fJwkn2cJEfYwER7XKvMYLTBsI5bp2EBz
 TAYCGmHP6zbYzD0etpyaoTn9E4DvZeByoIwGwE9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1osIKMSAsFDpHOmco9cz5XUAtzPa1ZreqvzXiX6aR/zmXgWl61mrBFKxhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82dBfyVuLe03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9wjN/vtvvDS7IApZ8+TfGcD8W4ezfOp7nRudu
 GDrrm3YK0RPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BCL
 QoS8yknr6k3/WSqSMXwW1uzp3vslh0RRdtWVfE74Qely6zI7gLfDW8BJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoPSlID6ty6+YUr1EuQE5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:Wav+760d/ZDqV0exkB8nRQqjBe1xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hfAV7QZnidhILOFvAt0WKC+UytJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQgeVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEA9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyDpAJb4RHoFqjgpF591H22xa1u
 UkZC1QZvib3kmhOl1dZyGdgzUIngxesEMKgmXo/EcL6faJOA7STfAxxb6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMAjgRBq3P4iFW5uYd499RjBmcga+S
 hVfbThzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyNeFOwC1zzdLkHqbrSn9wPRsvGRv
 20JJVaR/f+MGqGI/c84zHD
X-IronPort-AV: E=Sophos;i="5.91,235,1647316800"; 
   d="scan'208";a="72039074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFgI8S5cW9e9OB7BTm3fzFJbLWJhq+Nr/boavF2w+0/skqZu/xI2vBVKYJTWnNbWjOceIbH9OzeagaL4RTL4VnVCA6s3vWx2u3kMi1i5zcK37Om2/6h2p1yDplEMA26iCq4AWk3Fn/YMeFguWyVBQpJ7WwpnWnolvsIHf87WhnPwDsM1PIi+M2MDMvZC+SIberimek6qmIr1HD2r3kTcW80wtyUCxhO7hiG5k+Wh/CxCgVzkHsvwc82ENhjxwMCJzsW1ReSRZN5//aw4S1Iyd+r0klTtMQS18jS8waewqy3zVDqFHsS6vI096MRV4al1zT4Qdvdu2KvkXKJYBn4R0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zg+5Mucm0RhLHOcRpNOWbQI15SNxs3X3X6BztpDjvw8=;
 b=HiQZJYKpK4xHxEMHomcY9mrHik/I96apXn095GfsMH3xqA0mW29EdpCqK3QKLYdSULPuf22yzkY1t3mj6H89t7GWDwE1DRrZNPKnxcfYEYw4Tt7yGj8jAZqpJfRHoTXseeC8gfdw/y8W3ApQXCoI3+eiemZLa+953NrOc7uxG9bzAYnBjpq0IqJ98nH9GB5fOMPPznuY56rgzhRuUB6sqZthqkdlt7pHsxkNpnhSCRERqMDP5Gq+v2QzU3v9iCTCFrE4JyTpzxftFD5f1LoUcwZFGQKfUJkEjoA2Flm/n6uv1FwqKM0dcO0RfPHXFFj7ecl6fk31Ccc4b8Uofsl4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg+5Mucm0RhLHOcRpNOWbQI15SNxs3X3X6BztpDjvw8=;
 b=M9SGwZmugc4Izi8NTsJzsqSEIzFAs3Eq4fliZ0ECL0ZYtfOdgBAydDE9MNlvlJTDIg6d2VMFpX5hyanfjyt4zMdAL13B54JD42JGhXPVgtD6ZnAWh51WDS7KHZ/b/crplfA4TO4nWAyhBXgpETCBya8iPa2cVyL5QkBrzfsKTE8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/vmx: implement Bus Lock detection
Thread-Topic: [PATCH 1/2] x86/vmx: implement Bus Lock detection
Thread-Index: AQHYafEbc73MBdU1ZE2y9t/J11ujK60lP1UA
Date: Wed, 18 May 2022 22:50:02 +0000
Message-ID: <84ee0886-9ed2-97ad-e9f9-c81e8a3885c5@citrix.com>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-2-roger.pau@citrix.com>
In-Reply-To: <20220517132130.38185-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27b7b35f-08df-44a2-ea8d-08da3920beaf
x-ms-traffictypediagnostic: SA0PR03MB5451:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <SA0PR03MB54510DB9550D1F0E028A9B99BAD19@SA0PR03MB5451.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ARxY1bkZPJMDOR4jxNiCTCGC9i/YT5p2/iQijVCoby3kEIziurs+/+los5Q8sH0w5bdCDByHm9v/vLClI5aNJJVrZkGmXf0VUf2UbwKUzpbM00BoJgctZu73pLl7Wofr0pG2vHv8bYcfYj1ziB9l14RoBiqciAEL5bGTpXIBMsgoeSYGqfHz79Csh2nhTlTYQz8IPeBWxhNIKfQhwaILS5XcVAPRw7B2pGpjA0vmHUdiZfmVwtIofzwCteA94/mOdvDiSl+BCzZcEfbPUFnRgyufb6rqwnXZPJOW3YOSceTNDCViWEvQYy5zrRi9IYfIDWY9vBkM7grgwcMnSnNHSoeF/WOXx7UVMh3cZ40MDIuUpGw3P2F6jTcBQwoQtYCoNVAZ1PuP2D3Z8lidp6GiQrcSni/w/g8xRZyIPYbCNr+gw887WJhe4MtrqHIrq4kR5OSVJXEvMHtkAnh2JsHMHkNwxAAgsyCU7wSe7Ph54ikLekP2L+dBeKyQ0nKv/FRs4Tw6blrfTwks1zaxlAFZMe7nJP9dirajoOroMplDrftoawxrA8O9ZKzeUk4YoEIUn6PQxgnuON1DsJyEuXa4cIebk9+vLEAIELIlhzqqDlXPE/is9iNZhG0Mbk+iPN/fymOb9f6TC2ojgIFq2Hfs1cenUUiBJ6N3/TmXza6Pnrm0J12P6EuJcsMNgXbsr/vpkhD6FLST8FyTxysM8HOcLaLEM6sDrIE9z0vWokt3sli6oV49q6cWn0Gwr9B74WcyYHcGG6yj/WTQhfEaSzv2rw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(86362001)(54906003)(76116006)(66946007)(31696002)(110136005)(186003)(4326008)(66556008)(508600001)(8676002)(6486002)(6512007)(64756008)(66476007)(66446008)(91956017)(82960400001)(2906002)(38070700005)(31686004)(38100700002)(36756003)(53546011)(55236004)(71200400001)(122000001)(6506007)(2616005)(26005)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkFycGNTUUhPbUFpY1llQnhCYm10SFNhUTl3VXN2aVNrQ0EvdkxQUWcrTjl0?=
 =?utf-8?B?MVlRMjgwTEJwTWxWc1FYb3BrcktiVkFRSWJjYlZnMmRNbUFBT0xmdlRpay9l?=
 =?utf-8?B?NzNLUjh4M2svUklGRWQ1bnFGM0RVK0REOTVxcjRLclAvaStCajhUYjhPaXdt?=
 =?utf-8?B?N0pPUnpyQzhBemJhWWJpK3JCNHFibmJqY1I1RHlDaSsweWVSUVVSelpXcXZL?=
 =?utf-8?B?Mm94KzAvWU9HVDR3QUJxalpPSDFvUktxT3FlZXFIU0lSR09GdXh5TFFFM0Q1?=
 =?utf-8?B?TGlUVDR1cm1jSUVRRDJKRWowSEpRd2lvWVVNSmZ2Y3lITi90SkMrVGtyUFhW?=
 =?utf-8?B?bEJSak9lQTh6TG04SWdPSXQ3UnFEOWpaYU8vTlJLZlRLZ2FKVXVncUs3YktU?=
 =?utf-8?B?dy9PZ0lGcndCTEFqYitEVXlGOTQ2RXNsVWJSSkRpSDZIWExRZm5wMUwxWUFP?=
 =?utf-8?B?N3BhOGlJOUl0MXRuaVh2dFQ1MkFxdTVpUGFVR1orVXdGSGVwanhDMjlrY2hO?=
 =?utf-8?B?YVpTcG0ycGMxclhmN213cWNVemhCNEY3V0cwejV6c09UY0xFb0xpSHU4WFBj?=
 =?utf-8?B?K0U0eld4ZVg3aGNyY09sSzlGMzFjZjN1cTZXRXdNbFJXcDJqR3FCaTBOMHJk?=
 =?utf-8?B?Uit5YlZrcHpxRlRyVEkrMWtkUmdmTEpxcGhFRUFrRmMzSkxpcWRFVTl0TW82?=
 =?utf-8?B?TDBicFV6V3lGbCtPQVBsbXZQanA4NnpscFZyTGJmZ0NFOEFUdEZDVjBoSkox?=
 =?utf-8?B?UnB2a3UwWGp5MmtEdEFQYmFIcnR4a09lZ1RPaVIvY1IzdUpuOWxhS2pRWkJL?=
 =?utf-8?B?WllZd1M1QXhWaUFKYWVlUmdHVDcwRmNFQ3k5OEttTHU5TGlQWUtsaG9rQ3Fz?=
 =?utf-8?B?eGxzdWYyWVU3Tkc5RnZxUXpiTlZlT2xxeEFHM0IxWGppSXNlT3phSUFEbnph?=
 =?utf-8?B?MEorVWdhNmpyUzQ0eXd5cko2Ukt4U1AzYUJBZE5wU205OEVBOFJubStUQzlK?=
 =?utf-8?B?ZXY2UURKN0RSZWQvZ1V6dDZLdUg4NE1UaUZIUHRoK2ZLUlhIYmJudzlVUktN?=
 =?utf-8?B?Z3FpV1lmUjhqQUNESXhtVU45dVJSakU5djQySlo5Vi9kSlNJa1gwMkFKOHl0?=
 =?utf-8?B?K0daQlJZOCtkMGNRcGtWNUxNUGFFMUQvaHJuMUZzT0xuNHN1Wkx1NDd6RnN4?=
 =?utf-8?B?bVpOaE4vL2F3WnltcFg0MXd5eGRwVEppMmNhVWVjWUdaYTAvRjlzRHN6TUxm?=
 =?utf-8?B?QSs1NCtWL2Uxd2ZSTXpBR3VPOFRWM3hZOElkZ0dwamlEM2RrU3VHYkhQeVhh?=
 =?utf-8?B?eWRYZm5VK0g5Y0RXSzhmV2tWb1FDdmJ1WktDYTdmbnF4RGkveldPVmk3aGN0?=
 =?utf-8?B?UFNEWmNVSWk1NTZ0NWhaVUp2YzV6RUJQR0Q0REE3dVVCdFg5alkyc2ZSeU03?=
 =?utf-8?B?K1F6ZW15M0hwUjZwWXBnUXY5VHdrZktxU3dhOFQxaHFMK29PTnFhSjlFeEhq?=
 =?utf-8?B?S3JaNC9TSmtmZEJEQUxKd0FQNHlDanE3VnlycDc0WG5nRnptZnhEaU13UWRW?=
 =?utf-8?B?NTdBeHk3NEd5ZnNOY3VhVjF2bmdwZkd4dWZ3TGRzNXJHb3BzaHRDUjNHYUFS?=
 =?utf-8?B?WlkxYnpyQkxWQlorNU00bnZqL2UyQis3ZXo4UTJrTy9POTBZUTJ3NjlXbloz?=
 =?utf-8?B?cUlvS01mWU1UZ2psMWlZV3dYL2p4alRvSzh2TTdiSFdVZE1aNCtZL3dWTTRn?=
 =?utf-8?B?TkJQQXNnUVZ4QVpyYVRUc0IyY3NnbzcrdExmRHIxOXkzVWdrZzVqWU5ieG1V?=
 =?utf-8?B?VG5mVVZ3V04xTll6MmdsSDI0UG5qY28vZ3ppNElUQWlyNE5Jd0s4NW9BTHJj?=
 =?utf-8?B?ZG5OOXRldE9sRW5USUlRcGRMaklreEo0a1phZHRnWHB1SW5BK1R1U3BWcVVW?=
 =?utf-8?B?aVdzRk5XOHhxVUhwWmE2U21IMmRoTWgzbHFTd1FmR1dYN2ZtV2tuVXE1TW9l?=
 =?utf-8?B?a0hUUDNQR3VnbVZnNjArY1Q1MnZkMmU4Q3RBQkQ5U3FpSzMvOTA5blZzb04y?=
 =?utf-8?B?c0N6Rk9FQUQ0VzNWMm9zaHpKY2NoWVBMM3ZmMm9xYTBpS1BnbWxWQ3UzWith?=
 =?utf-8?B?Q1BzSE5HOEtjS2t0SGJmMEFQeFRaczRaaURaa1UwRy8zTDdacHRhR3U5b3BF?=
 =?utf-8?B?d3g1eFowQU5HVEszYkp5QTlITlZJbTEybmlWbTVERlN1VjVxalFJWDY0Qm8x?=
 =?utf-8?B?L3U1aWt6Risva0Z4WWNrZDU4TzhsOFdMQ3VUbWUwMDMvQjg3VlkxSDU1MlhW?=
 =?utf-8?B?TjYxMDRPSm1TaEZWQXVtbld2cVpnWUY1bTJCVWVyUHJoRTFJK2UrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8396D47F0B55AE4DAAA100E2ED2FA415@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b7b35f-08df-44a2-ea8d-08da3920beaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 22:50:02.6658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8PiuZkheEwWBXETPztMGDwPoyq2OorvZ7Ea1c6MHWLtlnz3unBunI2EBop+OoRS+cKnU+7jBa2J9TtdS1XNkMoZrLPtd/XvsmlPNOmaYa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5451

T24gMTcvMDUvMjAyMiAxNDoyMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBBZGQgc3VwcG9y
dCBmb3IgZW5hYmxpbmcgQnVzIExvY2sgRGV0ZWN0aW9uIG9uIEludGVsIHN5c3RlbXMuICBTdWNo
DQo+IGRldGVjdGlvbiB3b3JrcyBieSB0cmlnZ2VyaW5nIGEgdm1leGl0LCB3aGljaCBpcyBlbm91
Z2ggb2YgYSBwYXVzZSB0bw0KPiBwcmV2ZW50IGEgZ3Vlc3QgZnJvbSBhYnVzaW5nIG9mIHRoZSBC
dXMgTG9jay4NCg0KIndoaWNoIGlzIGVub3VnaCBvZiBhIiBpcyBhIGJpdCBmaXJtZXIgdGhhbiBp
ZGVhbC7CoCAid2hpY2ggQW5keSBzYXlzDQp3aWxsIGJlIG9rIiBpcyBwZXJoYXBzIG1vcmUgYWNj
dXJhdGUuDQoNClBlcmhhcHMgIndoaWNoIG91Z2h0IHRvIGJlIGVub3VnaCIgPw0KDQpBIGJ1c2xv
Y2sgaGVyZSBvciB0aGVyZSBpcyBubyBwcm9ibGVtLCBhbmQgbm9uLW1hbGljaW91cyBzb2Z0d2Fy
ZQ0KYXBwZWFycyB0byBiZSBkZXZvaWQgb2YgYnVzbG9ja3MgKGhhcmRseSBzdXJwcmlzaW5nIC0g
aXQgd291bGQgYmUgYSBoYXJkDQplcnJvciBvbiBvdGhlciBhcmNoaXRlY3R1cmVzKSwgYnV0IGEg
bWFsaWNpb3VzIHBpZWNlIG9mIHVzZXJzcGFjZSBjYW4NCnRyaXZpYWxseSBjcmlwcGxlIHRoZSBz
eXN0ZW0uDQoNCkZvcmNpbmcgYSB2bWV4aXQgb24gZXZlcnkgYnVzbG9jayBsaW1pdHMgYW4gYXR0
YWNrZXIgdG8gb25lIGJ1c2xvY2sgcGVyDQpob3dldmVyIGxvbmcgYSB2bWVudHJ5L2V4aXQgY3lj
bGUgdGFrZXMuDQoNCj4gQWRkIGFuIGV4dHJhIHBlcmYgY291bnRlciB0byB0cmFjayB0aGUgbnVt
YmVyIG9mIEJ1cyBMb2NrcyBkZXRlY3RlZC4NCg0KZXh0cmEgWGVuIHBlcmYgY291bnRlci4NCg0K
QmVjYXVzZSBvdGhlciBoeXBlcnZpc29ycyB1c2UgYWN0dWFsIHBlcmYgY291bnRlcnMgdG8gZW11
bGF0ZSB0aGlzDQphYmlsaXR5IG9uIGN1cnJlbnQgaGFyZHdhcmUuwqAgTWF5YmUgc29tZXRoaW5n
IHdlIHNob3VsZCBjb25zaWRlci4uLg0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+IGluZGV4IGQwM2U3OGJm
MGQuLjAyY2M3YTIwMjMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
DQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+IEBAIC00MDUzLDYgKzQwNTMs
MTYgQEAgdm9pZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Mp
DQo+ICANCj4gICAgICBpZiAoIHVubGlrZWx5KGV4aXRfcmVhc29uICYgVk1YX0VYSVRfUkVBU09O
U19GQUlMRURfVk1FTlRSWSkgKQ0KPiAgICAgICAgICByZXR1cm4gdm14X2ZhaWxlZF92bWVudHJ5
KGV4aXRfcmVhc29uLCByZWdzKTsNCj4gKyAgICBpZiAoIHVubGlrZWx5KGV4aXRfcmVhc29uICYg
Vk1YX0VYSVRfUkVBU09OU19CVVNfTE9DSykgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgLyoNCj4g
KyAgICAgICAgICogRGVsaXZlcnkgb2YgQnVzIExvY2sgVk0gZXhpdCB3YXMgcHJlLWVtcHRlZCBi
eSBhIGhpZ2hlciBwcmlvcml0eSBWTQ0KPiArICAgICAgICAgKiBleGl0Lg0KPiArICAgICAgICAg
Ki8NCj4gKyAgICAgICAgZXhpdF9yZWFzb24gJj0gflZNWF9FWElUX1JFQVNPTlNfQlVTX0xPQ0s7
DQo+ICsgICAgICAgIGlmICggZXhpdF9yZWFzb24gIT0gRVhJVF9SRUFTT05fQlVTX0xPQ0sgKQ0K
PiArICAgICAgICAgICAgcGVyZmNfaW5jcihidXNsb2NrKTsNCg0KSSdtIHByZXR0eSBzdXJlIHlv
dSBjYW4gZHJvcCB0aGUgaWYsIGFuZCBkbyB0aGUgcGVyZmNfaW5jcigpDQp1bmNvbmRpdGlvbmFs
bHkuwqAgWW91IHdvbid0IGdldCBFWElUX1JFQVNPTl9CVVNfTE9DSyB8DQpWTVhfRVhJVF9SRUFT
T05TX0JVU19MT0NLIGdpdmVuIHRoYXQgd29yZGluZyBpbiB0aGUgSVNFLg0KDQpUbyB0ZXN0LCBJ
bnRlbCBoYXMgUEVORElOR19EQkcgd2hpY2ggaW50ZXJmZXJlcyB3aXRoIG1vc3QgZWFzeSBhdHRl
bXB0cw0KdG8gY3JlYXRlIHRoZSBjb25kaXRpb24sIGJ1dCBob3cgYWJvdXQgdGhpcy4NCg0KTG9h
ZCBhbiBMRFQsIG1pc2FsaWduZWQgYWNyb3NzIGEgY2FjaGVsaW5lIGJvdW5kYXJ5LCBhbmQgc2V0
ICNEQidzICVjcw0KdG8gTERUWzBdIHdpdGggYSBjbGVhciBhY2Nlc3MgYml0LCB0aGVuIGV4ZWN1
dGUgYW4gYGljZWJwYCBpbnN0cnVjdGlvbi7CoA0KVGhlIGF0b21pYyB3cml0ZSB0byBzZXQgdGhl
IGFjY2VzcyBiaXQgaXMgYSA0LWJ5dGUgYWNjZXNzIHR5cGljYWxseS4NCg0KVGhpcyBzaG91bGQg
Y2F1c2UgdGhlICNEQiBpbnRlcmNlcHQgdG8gdHJpZ2dlciBvbiB0aGUgc2FtZSBpbnN0YW50YW5l
b3VzDQpib3VuZGFyeSB0aGF0IGdlbmVyYXRlZCB0aGUgYnVzbG9jay4NCg0KT3RoZXJ3aXNlLCBM
R1RNLg0KDQp+QW5kcmV3DQo=

