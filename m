Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B150772F8F1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548613.856620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Mho-0001gV-TO; Wed, 14 Jun 2023 09:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548613.856620; Wed, 14 Jun 2023 09:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Mho-0001ea-QF; Wed, 14 Jun 2023 09:22:20 +0000
Received: by outflank-mailman (input) for mailman id 548613;
 Wed, 14 Jun 2023 09:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiGM=CC=citrix.com=prvs=52225e267=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9Mhm-0001eU-Fa
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:22:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f321d775-0a94-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 11:22:16 +0200 (CEST)
Received: from mail-bn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2023 05:21:57 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DM6PR03MB4985.namprd03.prod.outlook.com (2603:10b6:5:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 09:21:54 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::7ebd:898:4cb0:7514]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::7ebd:898:4cb0:7514%5]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 09:21:54 +0000
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
X-Inumbo-ID: f321d775-0a94-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686734535;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/p6wk7Zbj763leAtBPF/DRevuEDBQhgJIb3HopmlTlU=;
  b=ejSNEjmvVrQNuLGT5CNb4OH9J5/E+NoSlQLZuEnAHI5Ian9jxJm3p0VS
   t56cvPSPXgWMrIpbfxXzX0iBaSD8REbJl7xnixQTxMhNJKLx1ilpF9FqL
   MWRQsEd/uHSW/QsGL+/nth5c9swp//RcEhlurxQdQsOhBeALwL9QRXZjS
   Q=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 115261419
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3F1Ntqugd09Gg71TDEDPlW2r3OfnVOBfMUV32f8akzHdYApBsoF/q
 tZmKWvXa6reazf8Kd13aNyz8xgHvJGEnd81SABlrnw2QS1D+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGHyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNxAoVxWIhc+P34m/WPk9gM47LJP0FdZK0p1g5Wmx4fcOZ7nmG/+Pz/kBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osif6xbLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTlrKAz3ATCroAVIDEQSniD++SYtkiVZotkA
 VJIpSpzlpFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLnIDRDNbdNtgvsY5QzUw3
 3eDgtzyCDpg9raSTBq16bO8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdJzb0x
 DybqTkksJ8ah8ULyqaT8EjOhnSnoZ2hZgQ4/BnNV2SpqAZwfpe4ZpeA4ELeq/1HKe6xR1yK7
 SYsgNKV4qYIAI3lvC6QROQAGpm56vDDNyfT6XZ/Ep9k+zmz9nqLeYFL/Co4NEpvKtwDezLif
 AnUoww52XNIFH6jbKsyaYToDc0vlfLkDY69CqySacdSaJ9scgPB5DtpeUObw2Hqlg4rjL07P
 pCYN82rCB72FJha8dZ/fM9FuZdD+8z07TqMLXwn53xLCYajWUM=
IronPort-HdrOrdr: A9a23:7Pso7qrcE+FekMUnz8cwyq0aV5s2LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwOE80hqQFhrX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YET0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dNT2CA5sQkDuRYTzrdnGeKjM2Y6bRWK
 DshPau8FGbCAgqh4mAdzE4t6+pnay4qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFx9f3Ls49m
 DBsgrhooGuqeuyxBPw33Laq80+oqqs9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbknyPgzDEtwXn/zkLwuwqvneXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o4GgbWAhqmOE5V4Z1cIDhX1WVoUTLJdXsIwk5UtQVLMNBjjz5owLGP
 RnSOvc+PFVW1WHaG2xhBgl/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgPcSm38RnahNPKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBGB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT9Yd3U8LAd23FFgMy4eFKyWhfzDGzG0vHQ7cn3O/erGM
 paY/ltcrjexWiHI/c84+SxYegVFZAkarxnhj8KYSP+niv1EPybigX6SoekGFO/K0dsZkrPRl
 0+YRPUGOJsqmiWZ16QummlZ5qqQD2xwa5N
X-Talos-CUID: =?us-ascii?q?9a23=3AU6HEamjpqmklIKv8d5g5WQNBFjJubV349XLbIWK?=
 =?us-ascii?q?BFl1tWq3ET1WI+Pl7up87?=
X-Talos-MUID: 9a23:K71LPQtGgfr6D683TM2nqDd9F/8y/oWSDmswyK4spZXbNXFLAmLI
X-IronPort-AV: E=Sophos;i="6.00,242,1681185600"; 
   d="scan'208";a="115261419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTpVjVArUsdNE9pqrYYB2Rg95Yl4LgH9lM9tg+hAKMdXkBDqvtjSCIviFFHO2HoAIs5b6kDlI/9chR3v3m/bP7sG4pavxO+4M4KrwgikkDZg+/uTi8d+pOvtE2N54TbbhVZCEbUBoFx6neHgN/KLrmAXLMrppkMZqq1k845m1/4eAfZbX4RlWkf/8zggC/BYscyR55DQNEzDF8z+uim9iwspxOb+rKRJcmhDTNtA/iEcKP79iXpnIgfy5s6ZesTyC/gWJxfCVMCfYzLJVjSWvA8ZNo4la+Zr0kATx8QN8aNw8U/aYlF67hQhdtl/hr4EYJZM369vq4G9Fi+Omqlqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p6wk7Zbj763leAtBPF/DRevuEDBQhgJIb3HopmlTlU=;
 b=HV6FkOPSddc4tq1w9HwqzTHayZrq9ovyCenXJ3yL8HV1DTtdhl+u1BZaZMaav9WqYhVD7979ntr++7aMN4mMtX891DcIRsuVLUxXgrC28uC+HaO99n+k0Gam4uPGRYDdbI1WByrvOsxGjMPXx68VKugSBHtWCdZnnu/6ceFL6V+CSJh5Cwg2MPTNo6oMMQOxvT/cGvLvLWcValbIUan62xfd5R+WCR7fFv6yy7eE+pvQGfzeAVPgz2DYGTY0+p7b0JVZBSMLDcNU2JCdYotqVYcRSdrDKT8SXvOTa5VOMJqJAv3tnJ6vq6/pEMcB29lYRfNKiyWhGYJHQyIhz3TtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p6wk7Zbj763leAtBPF/DRevuEDBQhgJIb3HopmlTlU=;
 b=SgCgeMTt3L1XVjJ45YeTQEPFIguFKF4hJkGQhF6NY3Ci9Q4cRXZ/CuPs9Mzi6APNCvRdHzgTvU9S5R4pDLcTgD6gNk20ZnmVE8DDLdCYbNTr92VRyvdwHXBzPiByvabZ4GixwHPGDHDwWjBGwAdxqAela2gVOEwE+61d70wGQl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <affb5dd6-26fa-71c7-5696-68aad00620dd@citrix.com>
Date: Wed, 14 Jun 2023 10:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper <amc96@srcf.net>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
 <d3883a59-acff-198c-a688-ac2546de69a7@xen.org>
 <86f357da-2fe1-7fe4-c061-d30b8e5bcbd3@srcf.net>
 <fab38a04-20ac-c2bc-7e8f-9ae00524ba6b@bugseng.com>
 <5dbb751d-e8d7-fa26-81f8-5a3b1b12cd65@suse.com>
In-Reply-To: <5dbb751d-e8d7-fa26-81f8-5a3b1b12cd65@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0629.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::10) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|DM6PR03MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: 29754565-eac3-4253-f850-08db6cb8cb47
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	85GTjJ0IeSzA5Nr+k9WRFpTqKrgQ2UJajMVIY1+zfUU04cW2AjAIjXKhcr3J8FXsirornDwq0bbO7aYafPf+Sgis+tAJ/YskWDwVkfD38MIembvyubKdY2xDCuA3F3Dv/6ALir1cOPMoO0dc/ZJ2+EPqtR6nIdGSzQEXC8fE2YZPq1Vga56YPW9KaYu4rMEsfHmPT18Jz7/dCiOgF4p0K5ozycxkeHBshp7sAw71BGZ1Hnfd8J8Ha5X836ulTuU6aMoarplDVatMw3wqXZh3FEQiHk3/hus0O4hrkCqfMTmUCo+IUjbr2gJiWOIKEjucC5xFWBJs9nnIK2/VXhgDkCzC+sZFoiFOIzDTRf80T8Eci9aZX1P94bt1U4VeKluwGk0A10RZtlHJ6WzWytp5PaMNU91hASskgX2w0gAYWaBC9rBVuEbfsqlQzQdV6UmRU5ryQWGL6HQRuDUn1ykagJqi9PPCqA+0IxIo5hqpEfPWxqKb7NZ5WKeJ1Je2d+lm9z+eaD5YUrupAEdGZQkCp80ZO0LC7SeiPuA6vqQRVKchXDqMV6OhCLKz60LMPSHJ+U0paLNNva7Dp1o68NNZOiq3+jE5AtJEDsAB94qGSCYLGCnOBpD9NTNMm/VNeJWMlA4D8ax7+jWfGJ92+mVUcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(31686004)(66946007)(4326008)(36756003)(66556008)(186003)(54906003)(478600001)(110136005)(2616005)(2906002)(66476007)(8676002)(6666004)(316002)(41300700001)(31696002)(86362001)(6486002)(7416002)(6506007)(53546011)(8936002)(82960400001)(26005)(5660300002)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVBVazlzSXFFVXBJbDZhcllpVmd4WjV4TkFIL0lVdHk1SmVtSVJNVWQ5VTJn?=
 =?utf-8?B?UDBZUlZMR1JBclFGSVhwclh6TWc4Wi9OdldTeEZuV2F1aHRpa0had240N2tO?=
 =?utf-8?B?UmJMMkxsNHZBS3RDMXh5bGIzNTJad3RwM1ljSFVLM3JhMS9RZ3hCWGFjbnhn?=
 =?utf-8?B?Z2FWd3p0ckRHazdKQ05Md2l5eG5jVXVJa3Z2VmdzWlkvNUwyUHdIV0FnNkJG?=
 =?utf-8?B?Z3kzaFRlcm1vSDBVTmJOdy9lcXZ6TU9BZWJpRmhTVjBCVDJOQVlkbWI2NHJ3?=
 =?utf-8?B?VUU4dm9lckowUnpXcVN4TEJNVVRiTW1rODNwRDU5eWtibWNNV0JKYXJTK1ov?=
 =?utf-8?B?UlVFZHlSNE9BWmlHbDhsWWt1L2s0VnJPQzFmcW45YU1vZGNTN29zaEN2WDB0?=
 =?utf-8?B?VXNremo5VTBDWEdaWFlCZVpQZnNXV3BoME96Q1NjWnFQNFJCdFdEcmo4cGFy?=
 =?utf-8?B?UTUwZnMwVnZFQjgyNm83cVJhN0VGWS9lV1ZOWlEzblNhU3RBa0dBS0QvMmZm?=
 =?utf-8?B?TWU3NjMwVmVLYTROV0hCOGxtb01ublA4ZW82dHNwTXNIT3YycTRaT0loQnBa?=
 =?utf-8?B?Z280Qjh6SzZwSThkWjREK3B3RGhYVlNQVHdUVFZ0UTJhSUxWVndhdmQ5NzNO?=
 =?utf-8?B?bDVhNmRqMDJ5VmJpaHNCNXVrTnEyaFFuUEtMU3lhQm5KallwRmNKWHlrY0Rq?=
 =?utf-8?B?VkdBL1A4WGR6dDRjOWJoM1VYckg0aEEzM0JIZlZvVGNPclRJdDAxdnI2VjZX?=
 =?utf-8?B?WnVlMTUrdE5jR2FDNDlkazg1VXJ5MDZhS01ra1VsK0lQY2RmLzhiLzBnNjF4?=
 =?utf-8?B?K2RESUhaa0djMTlCMW9iWGZuQUZSSnR4MVdLREE0ZW1XdTVwOXVyVGpJSGtM?=
 =?utf-8?B?bW83RXdEbVdLeHVINTVBc25Ueml6S01mVDVob0x2V1pwSmdRYUUxZkttaFE5?=
 =?utf-8?B?K1djQmJURURZOWFQZ0tmM0xheHFKQkdpVUJNekVRU0p4aGlYYUlyaGtDSnkx?=
 =?utf-8?B?eC9zUFhYdzJSb0NMcHEvc0lHM2ZjZ0RCTmQxWDIrS1J1MkFiNDJSQzQ0YWZm?=
 =?utf-8?B?SzJJYzA3c1dMV0l3Z2FJQUFneVBhaUVoU1E0L0xHbkhZT08xdUpYbW1qS05X?=
 =?utf-8?B?c0pEdFozSVVuZVFWOS9UT0RXbldZdjM1TERHL01ydEs0dEhGZGs1cUhNYXln?=
 =?utf-8?B?ZEdyRGoya2tWK0s0L0Z5TDJ6WW5Rb2hhTUpRMTBlbGdneUw3b0tsVWh2QUpY?=
 =?utf-8?B?d1ZCbDBiRlZEZlpoeHpiN2orSFdEL1pRV1A0ZmsvakZKTHhWNk5pdE4vbmEy?=
 =?utf-8?B?YncwcGcwMk9YempOc3ZsRHFOcWllbEZ3N0xCSHV2VXEreW5CZW1BaTlVYUV4?=
 =?utf-8?B?Q0FiL29sU1U5Uy9odG1vcjkzU0o5dVFsM1o0V3ozOWQ4dTZKY201R2d0K2cw?=
 =?utf-8?B?V0l0bmc4bElSS2pmeWdiY2Y0Z0l5RDB0UFBobHliSGdObnJPS3ZMNmh4djZN?=
 =?utf-8?B?dlJzR2pYZlNhLzc1TnFoNkFqZFZUOTFZeklnUFp2NzNFS2p5SWh4QVp0ck9G?=
 =?utf-8?B?SzBlWUxwVnJ5THF5bDdiVk9DT0hXNVFIck5PYVdLQlhhYUdlbWhtaHBQYVFo?=
 =?utf-8?B?cEJIODNPVmJ0M3lMeTRGRFRNOHlPK2l2UGYzcEhma1U0a1JPK0lXWHlram9I?=
 =?utf-8?B?dlFKdzFrT09nRTJkdFQvVFRSMXU1d2VNMzd5RUdpWC84dUQvbC9heUVQN0JU?=
 =?utf-8?B?WGFweWRtR1lGVkFsSUY4QnhMMEx6OWw2d1cvYzV2SW1hRWpFR1hxcnpPUGpG?=
 =?utf-8?B?Y1V5MFVwVzdUZzZvRllYaC9TamNIejdPMDNIOHJEcHhkdTJHMEthTWZpaE1a?=
 =?utf-8?B?YWhtaktBeVhPMGVzcGVnMHFwY01CdVFRTyt4a1hrT1NOa2lXdUxYNjZmTm0r?=
 =?utf-8?B?bDQyRk9RcVFKeXNtV09iNTFINWU5dGkwU1lKc1ovSHRPajZmVW95dlJBMlVZ?=
 =?utf-8?B?WmVXZzRxLy9ZbWdIMDF3b1RYNHdtQTcxMVBmRE0wZDhQbjFyUXBJWXdyRlY5?=
 =?utf-8?B?ZlFmTGtZNHl0Z1VkYXcxTGljSk1TYUVhU2UvODhpQ05CZDNkNHdNaHlPS3NQ?=
 =?utf-8?B?WDArOWxUckorcDl0aVlkK1VXSWc3aHlFTFpXTktpQUxBY3ZXbHFjdGdaWFJQ?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?MjV4ckJUY0FkR295SWZXSGsra1F0VWFmWmwzYUQ5WmFEYU9wOWFvUnh6RzdZ?=
 =?utf-8?B?WksyMlJqY29pY21PbTUzMVlSVGkvbHpBdzJ4TGt2R21IcTV4OXZJeW95dENk?=
 =?utf-8?B?U1g1eXFiRzhyQlRRbHZUV3hUTWtyM0dOTHVkVk1ma3MzVjBVRmloY0xESncz?=
 =?utf-8?B?TDZPQWttZ05UY0hNTkRULzhwY3VING95eDZia280ZWt1TDhadk5VTnROajdi?=
 =?utf-8?B?am1nY3BzT2dTbyt2cWlQUW54SjNScCtuN3dqTURJZ0lOMVdrWEtnMHpJNW84?=
 =?utf-8?B?MkRYNWNmdUpmcGlwWWx0VGoyeldsZHRydm9oMkYwQjhqNENJaXFGaTFMbDBl?=
 =?utf-8?B?a3hPRGJTV3pZcWd5TUgyZ0t1MTMvdG9QNGtEaVFZZlNwbWwrdnJWa0lMK1JL?=
 =?utf-8?B?OWtJQmVqWXFENW9NWWhVVkc5ZllkUEVLSSt0RFBjTEdRanA1aE9LR0hkcC9v?=
 =?utf-8?B?RE1vcFBtSUVWVHNWbkpTdk96RkxoVXM5bDQyY0djbVkwUmZJUjdCbFZkWHZm?=
 =?utf-8?B?eGFYcjVrYTF2V0ZBenkxZi91T3Z6NnJwb3JUVlYwdDRmSlA2a1FKQ3NHOHlm?=
 =?utf-8?B?NjdWMGovZmpOaEIzYUxiakFXRnpKRldZTElWeGJDNmlkcU4xWnNaR0lJWHJs?=
 =?utf-8?B?czduN09wZ3Uzc1pUSkowQmd1cSswVTNNNmlDNDNvc2FrbndacFlwRXFhN1JD?=
 =?utf-8?B?TVArenlqVXo0MEs2RDhoUVNRbloxd3J6Nk9LUDJ5bjNFRGRIczZwVVRQTjU1?=
 =?utf-8?B?RlBtb3V4K3dhempwTHd3K2JidTdhNis1djMxWUhqU0I2NzRwNmFGS1V6WFIx?=
 =?utf-8?B?aEZWcytpQ3FTbmhQVzdVUzd4bGVibzBhalFxaHpLSEM5KzlObmlkeDZ5WDB2?=
 =?utf-8?B?VnQ1UXV4QktTbFdNNGZndTZlMXF2cmpoV3o3V0R1MURZbWFPRzhUc1VOREhk?=
 =?utf-8?B?YXRmWUtUd2Q5ZUV1amxyeTl0dENKdVo4bm9qektqbVNNWEJ6MW1VR1RLNXIx?=
 =?utf-8?B?ZVhGRktQdXRzQS9HOE5SREJTYk1xL2h1VGIySVZHRk9oM0pnMHBiTFBVRmMy?=
 =?utf-8?B?UGVuMC9nTWIwOVlueHNGV2xOWWY0Ly8wRGJyOUxQMU11a2VtVXRBdjQzdzBu?=
 =?utf-8?B?MDcyMzQwaGdPWFpka3VZNFZqV2xzTXNhWGFPQlpSblJLOWZXSVo4QUN1NFRJ?=
 =?utf-8?B?a0dPV3BORlZGaXB6eGFJZDhCa05IYy9xT1pZV0ZsamRIR3p2OWFna050TS9N?=
 =?utf-8?B?STZ1QjliYlY2Y0JOV0N5czJvOHRxTHJVWlZ0VXk2MEVEbTlrUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29754565-eac3-4253-f850-08db6cb8cb47
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:21:54.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkK1eWHVTsCYM8lEvdGZAnfwZBL0ddPPwJkQ18CIttAwRv7MC3wUZSrDhoA5RJvC7Xz/1Ke6unL5rre/LH1y/w3RUw2HRaDq1SyVCedk9jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4985

On 14/06/2023 7:52 am, Jan Beulich wrote:
> On 13.06.2023 21:47, Roberto Bagnara wrote:
>> On 13/06/23 19:45, Andrew Cooper wrote:
>>> On 13/06/2023 6:39 pm, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 13/06/2023 17:22, Andrew Cooper wrote:
>>>>> These are disliked specifically by MISRA, but they also interfere
>>>>> with code
>>>> Please explicitly name the rule.
>>> I can't remember it off the top of my head.
>>>
>>> Stefano/Bertrand?
>> Rule 2.1
> That's about unreachable code, but inside the constructs there's nothing
> that's unreachable afaics. Plus expanding "manually" them wouldn't change
> reachability, would it?

I bet it's complaining about the while() after the goto.

I can see why things end up caring - because this violation can only be
spotted in the fully-preprocessed source where the macro-ness has gone
away, and *then* applying blanket rules.

Which comes back to the original point I made on the call yesterday that
do{}while(0) correctness for macros is far more important than some,
honestly suspect, claim about the resulting code being somehow "better"
without the macro safety.

~Andrew

