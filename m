Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7052EC3A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334076.558057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1rg-00036i-Ee; Fri, 20 May 2022 12:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334076.558057; Fri, 20 May 2022 12:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1rg-00034h-Bi; Fri, 20 May 2022 12:36:20 +0000
Received: by outflank-mailman (input) for mailman id 334076;
 Fri, 20 May 2022 12:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns1re-0002mR-MC
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:36:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68a20581-d839-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 14:36:03 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 08:36:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB4884.namprd03.prod.outlook.com (2603:10b6:408:9c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 12:36:13 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 12:36:12 +0000
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
X-Inumbo-ID: 68a20581-d839-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653050177;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xC0vjxIyRbNHBiwFx1Dc/YcynbgE7HtDZkd+l5hF/+o=;
  b=NBGfhLbPeNyy9zgBtBmYbj7b7sguocZlf0iSHcxyc3A/bAnthg/tXr2C
   p7R6m8HyMqkaIICS3ibJwsEVFbAcbR4xvRzrVO5/72t8ln5fSUXyfAzIp
   ZtbN2zdHp7CZbtAeoe4jnLI/+6ZhLYNz5Otdk4VOIJV/hSSVlOWysYUE/
   c=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 71791870
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:abekAqtjAOHgOxzSAKgD+kkDxefnVEZfMUV32f8akzHdYApBsoF/q
 tZmKWiDOKuKYGqgL913bYjj9RsDsZXXz4dqSVNlrio9RSwW+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X4
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi92ELbTtOAabyNHAisvM45B2+/dMCmW5Jn7I03uKxMAwt1IJWRvZMgz3b8yBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IGmm5v2aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3M+vtuszeLpOB3+LPKAOiWZJuYefl6px2E+
 mviuGrIXg5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQv3qsrhMaHd1KHIUS6wyTy6yS/weQAEAFSCJMbJots8pebSQjy
 1uhj97vQzt1v9WopWm1876VqXa5PnETJGpbPCscF1JavJ/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//AgpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:XsGkFagY8BcHNOagorZkyKzP3HBQX0l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A37gZJPh8sH7SGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5c9zp/8tHN1A7dg6MLqK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71791870"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an5sUqBXr8IcAfL200XPJ+S/O4/F8Ao6vycDvTwA9/WvYpdAT42k9nXpQzI2Kc1KoonPRpmONNhvccosvsp4LEi4gwRH3cH5Wzkksi4o9b1uQwUEi30H2uWSDykrHSqWl/3R6xHQPPvQfVPvO9IFv1ltDJ7KUZLwRGcDgISxPD6rgS0bKM7HDHL3PaRSeN6b0P07AzlOBfERUsXsleAoXgGV1oAjKBNgRxibOFdnN6O+F/sc7YiorP/VJ0PvHNuhqhUZU9bTSrrMZm8qH+wIMNGRp92C640vXxxcRF4Vl648TEpGF+a0F2XDHuLt3PHM73xBg/DO4fCjfgFYw8w/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zxTzpyk1fZJOjHA/b3qnVUkyP1pYre8UY2eBMabXVs=;
 b=J6rQu0YbdtAFR5/+eZczzPibK3oFkWqoMCB6cLfAxZeOIeRT8zgZQYyo7tr+93/QTxB0N80Tua20doojzA9fP8pJBnx8KvndvBTXUPtz/zhP3a7EVfbIuIaDlhQYQIlL1bh0LRa5Xvx39WMibuXkZGPsC2w559W/QXL3MrXTv8wEBU/HHPgRjteoTHacpmA3xAKGdEdB1DPFB/UT7GKYYOwaT9x4HdmGO9Y+qw5ppkzeqgaGWf0OkV/xx/fb9rYAU7UL+SrTsQGk5fXFdRFhdzKlzRHrg23A5j3nci50PwK9jwspGnzWAM1b7py6lN9nIlcxzoRXIVqCdVmgdURjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zxTzpyk1fZJOjHA/b3qnVUkyP1pYre8UY2eBMabXVs=;
 b=QNkct4mHGX5kfbGFt1aC4jIglPZZeBSi0FtR1Yhlsoqe08EzoFtJcXY+edblGgUbumWdowY0/fy/Z6btgpBkgSQoA2nOVSypHilAi8oHsJYCdniwZGSrIlzjxpy7Xw6x6tATXleSS1tEKxrxpiyLCZD7fxwGpucVsCxLdLoskzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 14:36:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH RFC 0/6] x86/ioapic: fix edge triggered interrupt
 migration
Message-ID: <YoeLOPgabooE7K+c@Air-de-Roger>
References: <20220421132114.35118-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220421132114.35118-1-roger.pau@citrix.com>
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47f12388-7c07-43b7-8286-08da3a5d52e5
X-MS-TrafficTypeDiagnostic: BN8PR03MB4884:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB4884BB3054AFEF90AF99AB658FD39@BN8PR03MB4884.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nMX/OPwyI3Sd4d8MsFEP3l3Ti+PH81/jNvM4TS96/QSXKmxQKeZZUV1wpw8km0sowsdJiCCk4avFk6Q/vMcC0hMDMvFr9jX0gkSawQpdukBfPQ5ap78GSjp8K5MV057p2J1YTZEh33nY8nv/PSxq4t1s6ky9/rrX6qsawSt5tpqixk7zvIM/0yPUbdyLAN8KUkiJl24NEfuDjZDo6vzoQ1CFiRUgVYKwS0es58ebRjI22V3leBmXEjDmlR36EybbDkPu5a0npa/bvgHyjIYw4/Z69TJTwf9vztMWTnnTahLcwD9EF5i+8t2sNp3HhzHGcUxz3Kg5ik7FHuIylAQMeYW4Ouat1Hyjm/A8E+oVtEAkl5LGZZz9t9zf/st/rOtRK6hAzwxSdLHIiVilA6ZRdn2CDQVChOnZPAW2pOEdJxexkusG5ZT0vF37FtYBeOU8fiW0xrDxWCyu08E6S0VspT7e6+IwPEbnMcqY2XYpEBwqgbHNMXuWd1i1MYU2DhHK9mNuTks4bRVfCYXl9SI4Lna6qS4Gz9H3lrXesYog//JCfA9O0eWko4pOfsxgUeihxjWeDivh0D2IOaQAzOJ9ap9YjwP9kl+49WTxGOzcMoa3RUXzM+McbTQtLdMA3LaPp1o4SYdxOUCkzeW/DUN4VLzy2ZeY0JYPk4vr+Z4QUD4s3l7Kj6Yaiwm8NrpSZ+DbkNujeSfIcpWoIqt1obyzzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(6506007)(8676002)(4326008)(2906002)(66946007)(9686003)(4744005)(6916009)(6512007)(6666004)(54906003)(26005)(186003)(66476007)(66556008)(5660300002)(38100700002)(316002)(6486002)(33716001)(8936002)(508600001)(82960400001)(83380400001)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0d4NEZzZE4wT0ZGVDRoSysvMU9XL0ZwUHRvVGpkNzJhcFdCZFVjZ0dZZDRM?=
 =?utf-8?B?ZXVXMk8yTUJuMDk3WnQvRms5OXE1a3FtQ0xqWStrdmY0MzFubndUQ2JOdEMy?=
 =?utf-8?B?Y05OblRNZEY2eW5zNmx4KzJwQmxMUTNZenhDOURnQ1UwQmhuZkhldWpzOGc2?=
 =?utf-8?B?ZklLRjU0ZGF2NUx6Q0VQK294bVVZd3FCc1NXaGp1emExK2d3Y3liWDlxck9k?=
 =?utf-8?B?dlUydmF3OEh4RVE1YkE0UitMbFpld280Q043Z25uOUtpOUtKaXdYZHQwK2tR?=
 =?utf-8?B?NEk1TVVybG1VMFFIU1NSUWs1eGdpS21zeEpERzFHT0piVmpEanlYMXFXNmxz?=
 =?utf-8?B?bEdzZVpaVGl3c2tMRDNIc0p4V0ZzMEVPdmJpdnpnNDlPazdoSmpKb3UvYXg4?=
 =?utf-8?B?UjR3cjUxWGNZc2JoOUhWRWRDKzdudmV2bGMwcFh4dlF3d0V3WXpleXgxQWt5?=
 =?utf-8?B?Z0VJblpBWDZMZHBtRkx0enpPbWdOTnp1MXh0UHl6cVJqY2ZhcGsxNDg5YVlG?=
 =?utf-8?B?S2lJYUttL1FoZWJ0VVh3NUFCUE5YckRlYlhYSVc3bmRHU0FYbUY5RWUvdmtw?=
 =?utf-8?B?eDNQRWVGYUJxVmNDMjRtWWZIVU53OVN3Y0wrYmp5MjRGZysxMWxxU2U1WS9D?=
 =?utf-8?B?TmZQdXpscm1iRUJDN2N4aDErWklUK2lSV1Y1RXF1akZRM1Q2OWp2azB4OWxO?=
 =?utf-8?B?RTI2OHlpWFlYQnA1L2NnRisxTWd0S2pDV20zREhJM0RWdGpEbUFqeDl3OHhZ?=
 =?utf-8?B?Y0tUTkZKeXh1SnlTNktDMGtsZElqY1lKbWNXRnk3eXBENHgxRDVwSThQa3kz?=
 =?utf-8?B?Q1d6UFFCN0RJZWlENU9wQ1pVN3oyL21aTzg0Wlh6SWpLL2dTQXo4cTJqaTB4?=
 =?utf-8?B?MVpEdEJZaVgvZWlBdEh6QytSR0VnZ1ZqeEovcGhWUnduUUtNWTZKL1hzeVJs?=
 =?utf-8?B?dk0xcjY3N2pjSHJFM0cwRTVUU0dhVEp3eExnM011YUQrNjBCNlVLSnFTWmN0?=
 =?utf-8?B?SlhDY1hMampJYzJ5aUZSVFZ4UlgvY1ZPQ1ZidFArT2hCazg0Qk01R2NWSlZo?=
 =?utf-8?B?MnloelJlMWg0WHl1aHFLdFVjamNPUk5QN1NUWmpFaUhsWVZsUEEyT0NCNzNW?=
 =?utf-8?B?NkVrTzNrMDZKQ2x3aXQ5d3RET295QUdzSkdEbjcySDRBeEs0Z0RkRkZhWkcr?=
 =?utf-8?B?cFltemdwakxOejgxWTF5WjMxMmFzaHB2byt2QkFsbVVTMEdGUnpoOHNmb3dV?=
 =?utf-8?B?SCt1eVovZ3RkTTMrNDYwTlNyVmNzaUd4dDJEYzd3VXVPWlJ0aEp1VEdsS1R5?=
 =?utf-8?B?WldJaEpQREFIODc5UURmd21FYUhmU1I2MXdTeEowMkVjYnZ2ZjZ3cXNrNDMx?=
 =?utf-8?B?VFpNV2gydlYrNy9pQTJRNzgvVXFjNUxUL0s3YVpJSHF5OXpBN1JoVkRYTmpy?=
 =?utf-8?B?M3A5VFpuN3RjNU92R0tDMnNISFBtc3ZVNm9lRE1GOG5XUnExcDNRTjRLMUQz?=
 =?utf-8?B?ZmpyK2pPcDN5RUhJY012c0ovZ3VsTUlZQ3NSazF3c2t6NDkzZW5CazMxT3JE?=
 =?utf-8?B?dlYwYU5OOVJPbTFkQ0xud3IyTnArZHRUSE5xVkt1SUJrbTBmelpoUUljTDhr?=
 =?utf-8?B?eUlIeW14QnpHZ0NDcXNFaS8rcnNodE9oWGZ1K2NVdkhGQUZSRTNSS0M3WUdV?=
 =?utf-8?B?UDQyMTVueTBzVjFMNVhySUVZNmpqSzByajlOSzFvTnk4cndpNk1RbkNZUmt5?=
 =?utf-8?B?a2JTR3cxUkdURmcvMzYvUDBTOG1kSGI5YjdmNVlWeWFKaklaUGY5djE5ajhz?=
 =?utf-8?B?RW85bitCM25mS0d0MDVYdnpxTnZpWC9TMG1YQmxrZTErMjQ5Rll6ZWRrOTk0?=
 =?utf-8?B?UlQ5UW0wbURDWHMycGF4WGlyb2pRSEpmN3c1allJZ3pOMkpwS0t1c1Z4ZFho?=
 =?utf-8?B?SXpLdkc1WU14ZmF4NWw0MzJndXFZZE4rMEg5YTdvTDkzSEVBNUtVUk5NTVpx?=
 =?utf-8?B?Z0J3ZFB1YmlQc1dHT3QxMVdmYUxvNFI0MXZJN09pSWRtL2tOODFrNTJMQmtG?=
 =?utf-8?B?WjF1WHBWMjhPbjN3UXRIZzFGTDFaOFA2TmhTRzNKOXdoUmtRRlVFS0xoR2ZX?=
 =?utf-8?B?Q0R1K3hYWUlGb29jMklLYWs2cUw0MzVoLzZMQzIrZUc1bWV4NUY2TUh3Qmxl?=
 =?utf-8?B?eXNVcTBXbmJxTDBXMnpwelVFSUpMR3FHWlRuQjFURDE3c29nQTdHYzZQZUxC?=
 =?utf-8?B?M2MxZDFTNDBGNmUzamVDR1lPdjB6RDhSbDdLelIvaVZhOHlBT1BLdXFud3RT?=
 =?utf-8?B?Nlg3MGRYdUUvWmZaM3VuM0pmOHNRK3BoRnNYVVVxc2xWeWI3emJiWWpFeHRa?=
 =?utf-8?Q?pRdq1gPymS7Tr0VE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f12388-7c07-43b7-8286-08da3a5d52e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 12:36:12.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNuwrk27+BzNcmJC2FCrLGCsYkI1uSJ1QMPXpfDTxmDrJPwozb2HYxdecb9Mb0EoBtj140fnABnop2t0hwIrCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4884

On Thu, Apr 21, 2022 at 03:21:08PM +0200, Roger Pau Monne wrote:
> Hello,
> 
> Following series attempts to solve the issue with IO-APIC edge triggered
> interrupts seeing an inconsistent RTE or IRTE when injected while being
> migrated.
> 
> It's currently RFC because some patches have post commit message notes,
> and because I'm not sure if patch 1 is really needed.  I originally had
> the idea of suggesting to only backport patch 1 in order to fix the
> issue in older releases, while leaving the more complex (and thus
> error prone) IOMMU changes in unstable.  Note however that patch 1 is
> just a workaround to prevent interrupts seeing inconsistent entries
> while being updated, masking the entry just makes the warning go away,
> but the interrupt will be lost.

Ping?

Thanks, Roger.

