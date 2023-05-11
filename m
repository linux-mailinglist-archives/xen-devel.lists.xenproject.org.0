Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03756FF48C
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533426.830084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7PI-000364-2t; Thu, 11 May 2023 14:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533426.830084; Thu, 11 May 2023 14:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7PH-00032p-WE; Thu, 11 May 2023 14:36:36 +0000
Received: by outflank-mailman (input) for mailman id 533426;
 Thu, 11 May 2023 14:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+vG=BA=citrix.com=prvs=48888ca5b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1px7PG-00032j-LL
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:36:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38840875-f009-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 16:36:33 +0200 (CEST)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 10:36:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6987.namprd03.prod.outlook.com (2603:10b6:a03:43b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Thu, 11 May
 2023 14:36:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:36:19 +0000
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
X-Inumbo-ID: 38840875-f009-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683815792;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QynTMtKm9yTbukJYheanqMIgEUBj21sLJU4rzZoXO/Q=;
  b=gcjInLRjW5y1Yf65u1Y5b/QSlFW0ODK/wGBw3y1t8/Xkdp2M03G9lSER
   adYo6LJ1sEWd4R9+WZ+XjM01bxaRrCY3IGGUcN82hHrcCgeXnSTar4eJc
   c36KcH5mt/HlwPkybQNq/ip/L1ff3fnR4B1BZISVYCkTd5wDlyalA2rvw
   k=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 107438631
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LY40G677GR4bdLo3N1WBagxRtPLGchMFZxGqfqrLsTDasY5as4F+v
 jQXWGjXOPeCYGOkctx+bIS0pkIO7Z/UzNJhS1Fq+3o3Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S5QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 /4UazA1cEu/hvOG/Kumd/Uvm5s4BZy+VG8fkikIITDxK98DGcyGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MkEotj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpNSOboqKUz6LGV7lU4UkUxfEGFmviayUG9Vc8PM
 nMf5SV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj6kmg1VXOgjbprJ6ZSAcwvlnTRjj9slw/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:SGlJbqC9lWrxnjnlHeixsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ4OxoS5PwJk80kqQFnLX5XI3SJjUO3VHFEGgM1/qA/9SNIVyaygcZ79
 YaT0EcMqyPMbEZt6bHCWCDer5PoeVvsprY/ds2p00dMj2CAJsQizuRZDzrdHGeCDM2Z6bQQ/
 Gnl7Z6TnebCDwqhoPRPAh2Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6e071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6u9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW22/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLQU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6UsoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPTHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwLzvn0ehT+Yd3R8LAa23Ag0YeMAIYDcBfzBmzGqvHQ4Mn2WabgKr
 GO0JE/OY6WEYKhI/cO4+TEYeggFZAvarxlhj8FYSP/nivqEPydigWJSoebGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHfZpa/ummfZ0/Q
X-Talos-CUID: =?us-ascii?q?9a23=3A8SiGamr8Ihjv+QWr+RL599PmUf4nfj7d9GmLH06?=
 =?us-ascii?q?pOVpwVYCJCkLP44oxxg=3D=3D?=
X-Talos-MUID: 9a23:b7w2XQRij+K/Xkv3RXTVr2s6E+5y3Z+vKwMCkpsb69C7PjN/bmI=
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="107438631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLLCMzxg6kkd4RPs8Lm9KwTuIU7xQOTZbNK6hANLQuTRrRrrYQMmyUFfoyY7x0srSGlk7QEyselGKZnEEZb8i+bkJIMXHMU9XNkePrdgGNdw+6AAapqiv7Cz9r0OAOcpuGRDqXHd+Yz4yBCuvScQA5dB0UVutI2FucwD+Ui9hANLD8IYajDdx9AwAuok1+oybDu+pe+MELchqXQUjQqvPcopQDImoe1JVotu09J4pGzWxlDGWsxz2OPNDQbJiCVu3Xoab+AhamXX5Qu7hUT2qJaUiD4GZaeH7JSd7TMFNtHxR+GvpAD4bCZKLkLGcGggXOdJi2Y27YwlLEbehX/g+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QynTMtKm9yTbukJYheanqMIgEUBj21sLJU4rzZoXO/Q=;
 b=V9Zm3MUV5Y/3t8h+vmn/bEWfzxDwRjej2l62b12gc2cZvoiC7wB3LMi8WIF0xrqmfAaopbJwaOK0EcZoxGQHqA586erB83pHsgWEvRvpsrSPgES/ZRMEUyicK7Rpcr2nX4zchYCzsB9kyf5uK++MBXY8H10MyzkRvfQV9+WmHFqI8c+1Dek4NZ6EEu79Ghe/rBpKLGrPnH82F8Nj8+wGRKchbqF8t/BZMSYFQWDIQXjHGO10F+sPVpiAVfrrYoC4XZ3r7vpgaWHA5mKDuobGBJpPNbsKHE1ov0CMhmFUQMewFzyme2eG1j5oCMkdk+SVU89jZ1OfyT/iiuGJ7HT2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QynTMtKm9yTbukJYheanqMIgEUBj21sLJU4rzZoXO/Q=;
 b=awLT6aBX4ODvJz9N3kExb8VrZVvT7LiHJPdUZEtUtizD33kjag/0iAtRyozP5Wtc99dMkADJwgQJ+AZqM62kvF51VcndA8+xKgI+IYJx19ddH9yE+xLVdCBZfb1rDh0G1OF0461dqhWCGQWPr5O8aMNe8x39MMCYfZd4lWr6778=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <67778be8-ebed-e160-559a-9cbbab7c06da@citrix.com>
Date: Thu, 11 May 2023 15:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] SUPPORT.md: explicitly mention EFI (secure) boot status
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <82c8ce93-a9a7-9309-2b04-8092ca84e7d6@suse.com>
In-Reply-To: <82c8ce93-a9a7-9309-2b04-8092ca84e7d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: 65006e44-c7b9-49c8-bf0b-08db522d157b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wb6HPitimy6Ga0tPmi/Vd12mM0Yiz5RX3kU9ubYc+8Km1DoZ2yy0kGyqykxvlPW7GojRd/sK/fx9sC/pTe6Rhdm1YiKzqRBQUEuIPBelnkIvfFdrChUIeI2rSMux4a3853Y1uGFvmq3aLbLm7UKBcLep1Ow62mFlwBwD07aUjpuGDiK2CwoCLbk2XBFORpQlW7f0x7h0xWBz1Z7wzRbko99nvLojgWLrbIwrB26LoWg6unYlhmkSflmw3DdHIUeQ6Oiy4ECvubd7s12EPiw9+Ht04qddTtC8z2zq45Bvq0/fMOdGI777+BY1/XkPnHk1Qq+TbBToO1ifg6wFGBeBWWPr39fnTz9DEXPDuS26Ktpz0fXM5obs82NIAwx881JqXvpdktSL7Jqc/15j+iY12I+KEi2poEhvBkDInFz3jls5Ik5HcjHxAXTZUB8QpJVbKjg4pLzat8mUSrAJ+E4M3azfm4f9GDBQHg8nd6rD1H5P6xrDHIH7lG+07qnpb//PtjudeUKfivJwFK5ZKVUbKwu2KaodxstxOnZ4lVA3W06urG2JTV5LMsFHzcRDljpa6rhQ7MQVKH6y1rsnB6R3SSCLP9GDkVTNcNHirP+hUoiZpcuVdal+DWXBDKA1lfy5RygzqQS2a2T3Jfmt/utzOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199021)(31686004)(53546011)(38100700002)(110136005)(54906003)(478600001)(86362001)(8936002)(41300700001)(4326008)(66556008)(316002)(6666004)(6486002)(66946007)(31696002)(66476007)(8676002)(83380400001)(26005)(82960400001)(6512007)(186003)(4744005)(2616005)(36756003)(6506007)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1h3eWV1YWdtVzJqbEQ0RFZ0L2V1MzVCdHN2M3RjMjlNcHJFZUNkUThoUW0x?=
 =?utf-8?B?QTVSd1VJbEEyS1FxTEwrMFJIQ0svRXhTMTVyak9uQ1dOdXNTQ012N3dIdzA0?=
 =?utf-8?B?SE1oWEw0WTd1R25kK3lFS1NyQ0gvOE0vZ002cFI1cHJZYkg5YzBNVFNOQWdh?=
 =?utf-8?B?N1lxZ1Z0bkIrRkRwYnlSM2lNWTJoeWlkMjhidUxwWUZHVVRMSk81MTEwUmJX?=
 =?utf-8?B?TXJlS3dNZlkyS3d4eU9jR1ZtUzRlOWtnS3JFMHNsOGJvWTY2M2VuTlNiWXpn?=
 =?utf-8?B?NFZ3TElUQ0d3aHA4aExMQzFsZjdNU3YyclQyL3dNTEpSbWwvVW92eGtHSFNr?=
 =?utf-8?B?R3RubTRidGJQdDgwUEs2MDVXbDdBUWp2eEhZYmIrMlJTek9zbmxxYlJLNS9V?=
 =?utf-8?B?Z2hMdnFPVWF3ZU5iMzI3UHptb2tRQVFEQ2llb2ZEZVdGOUZ2L3pPUmFWSWJE?=
 =?utf-8?B?eFF2UGFUeE1CM3VQQmN5T0RBNWYyNFVsS29iNlZnL2o1OTg1UU8zb2w4azJF?=
 =?utf-8?B?N3pqM2kzSnUzMW1HNnd1UFdhZk5zeklLRTM3SGk1NE1uOHZwWThnNHlZVnJj?=
 =?utf-8?B?anRyOG9BMC9TL3ZIaFJhWDZrVEJsb01iei93NlVzQkJTRFJUQjR1UjFzUS9n?=
 =?utf-8?B?RHBWQXlpYnRzYkl4WDZoT1EyMk5kU0QwTVhvNGNvdStYTUFTRDByclFHZGFF?=
 =?utf-8?B?dlQ4Q1VJelpOYVpiWDg0bEsxajkvVWsyWUtlKzhQS09pbElZTEtBV2VNcjQv?=
 =?utf-8?B?RlN3T3ZXb2xGbGgrSHFSYU5zRGE4Vlc0ckZhZm43dHh5ZTFuZGMzanNyQ2x3?=
 =?utf-8?B?QmsxVlNTNllkcGtqOTV1TXZmMUdvOVNWdWJaeE03QmhyRmNGa2NBM1FQMVpS?=
 =?utf-8?B?S0ZIMnV5OFMvcXEvcml3UFNvcTNJbDBEQ2xWbXlPK29ZMTFERldETDZXR1B0?=
 =?utf-8?B?TSs1ZVZQK0I3WUh1MmNtczR0cllrbWdiVUw1dHZXY2dXUGpCNTdFa0tSWEl2?=
 =?utf-8?B?L2FBc242TUxoYWF3a1p4U0gzMnJVeWNPOUlxUHF5OWQzdUk5bkVKVmcyRDFL?=
 =?utf-8?B?dFBCQ2cvekFQNFk5WVlPM1E5Rk9CcVIwZTRQeVRONXBNTWhKT3p1MDJwdnRW?=
 =?utf-8?B?MjVRdTJWWm9NSDF5bmZuMGx5Vmh2SCthdGdOMnN0N1dPV3FuQVpuV3lFNzVB?=
 =?utf-8?B?UmdVQ1M4R3huSHdLRGFid3JKZEtadWRaSXVMUGpUTXhQWWVpSkRKa0FLZ3Bh?=
 =?utf-8?B?TkRka3lXWVpSS0ZzSEI2ekV6TmpQU2grVXIzQUZiVDdNejJLZVpWcEcwQ1Yw?=
 =?utf-8?B?M1lGbTZyOHRORlhFb3ZQMnJEOTRXZHV6cG9ITjJoS3lKOG9iaFd1UXJualZm?=
 =?utf-8?B?bmJjdHo1ODdqRGlXT0p6VTJMV0RIWUZDdklZMUc0OGRlVElKbW9xeXR5eUIv?=
 =?utf-8?B?amNtYlNHb282TWtlbHlpczhadjlncEhQa0dVT1hTTTNJYzVRVWRXNFE0cVdk?=
 =?utf-8?B?U3NkYU5wWDNrdXlKc0JxVVByMU5PN0dSNWo5YkNyZTVvTGYyQXR2K0ZlNGdo?=
 =?utf-8?B?TWpDQncwNmlCZ0RtTnpQcFhTekpEQmxLOGVlaUVSV0xJWUFPVGlXNE9uYzBZ?=
 =?utf-8?B?ZlZlYjdPTzhrOTNVcVQ4c2kwaDROTzMzRW1pejM4dlpWZ1pNUDl4ekJIS29w?=
 =?utf-8?B?YThxUmk4NC91U2ZSa0lMY1lrRUlYdnJGVGtiWmdQbU1KYTlYNHFjZjFHanUw?=
 =?utf-8?B?UFV5UDZEUHlQeU9GUVZrblNuOTIxSTZXVVBERjg4d21NTHFCRmMwZlRxTnBG?=
 =?utf-8?B?VGJ3cmVvRW9iKzFsSVk5azNySnFRY01kZldxdkxYV0ZYS25PMEN2ZElXTlZ3?=
 =?utf-8?B?OUo5SFFoT0s5VmVCaEtiK0ZpNEFsOHNvbnVYRUJIZkJybkNxeUpwWXd3dXYw?=
 =?utf-8?B?S3NvOGdCZUh6VnBicFJUY2lzNjlXQjFsM1lzck8zN2NhN0ZFV1lNSS96c3Vz?=
 =?utf-8?B?VTFQWE1hZ0EwY1Z4UGd3dlBHamtRQnp3c2pWaGs0RzJQMWs4ckZyd3ZzUXJB?=
 =?utf-8?B?OGszaDVMN0h4TlBKQjJvTE5iSjd2Sng5OGltZmdDMTB0QnVvRXljeEdjZ25F?=
 =?utf-8?B?Yk1QdHZVRVdwdWt0ZlNEVWtJT0R2S29zeWkycEIyVzE2NEFPWXJHSWxOU2Zv?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rfNILfZxCIgeuAFycaTmG6RDvt3qbAJtrYyd6yvkLkFwKdpeIXj94/rKJTps7zOWFheBwk4Ut1ZwFlO/MrcJrM+Yc16ihI/vB8tad5PlZxGtv63aHVSz5GXNNxTWWMdVK14LVH+iicj1qe7rwVgzUnzEHGmdPbxsqRg7rcrKYYkcmp++8FDxo5f1xZDqf6rZ6h9AkhgRiDDHHM8hnkgysLEpVYlgsWgaf/m0XDJpjGMXqZVonSGEUd0x89dGsuRFXQweMN89gXnAaQqIPst/3/T63PkzXsPIaA0S2uERgBqcaCnNP3gCnn1tP9Ro8S102jLaQHgqp3wZKluwN3HQUUwj7vjYRQ0mK4ChgRd1lGIt0HZZ0cPYT0LKjnL0gktB2Wgh6NWUzvlpQl2KjCOuTUXBrxYgdCzNdBtP8fFQ2FdCLxaEeDUauc2It2SVbBrkeGcwVmRo81/m7OVMC8KYD+BhXhHFI2ME4+lQ2FxnHAYnrs9bWDzTOEIL1038bn4/4ulubRjMH9dgvguIxSZElIyrOmtUKU64cASuLBArSg6yLS1baj6ejMGTdwD/h4BCiu5IvcTW5bCdT6s0+PqnIVS1XUensYLF282OFXRAsjcyq27smOut+odZ+2A+PKuvPJ9Ld6ZQbb0haOQIKAzQEufB3jSMo9hVft74KhKJcIQyZbyrSRaUXfv4WCMmZP9SRwfzJrNjFJiHviRemR0oC1T6+z28DLYonBkYGLx3DBLC1joHlJUz7SsoM2L+ES1ZuCu8jRW0r3EeaNgkQbMmiHBYNUS+/lcapjI1g3TrlkPtBkr9C3nfbzJ8YqYCzaUf5vvlCMa4mFILEYa1o9kgATBKPwwCzGhNs0WzCK21jXQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65006e44-c7b9-49c8-bf0b-08db522d157b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:36:19.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBBi+2OZDDTJT3C/HewaxA8rRS2oLDmHlzAVHz/j4HWeRAIlYyc9yh3qjSIrbs2wgopQfYYO91FphFTcKS9fxeOparqCME2XhBYmbNtCE8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6987

On 11/05/2023 3:34 pm, Jan Beulich wrote:
> While normal booting is properly supported on both x86 and Arm64, secure
> boot reportedly requires quite a bit more work to be actually usable
> (and providing the intended guarantees). The mere use of the shim
> protocol for verifying the Dom0 kernel image isn't enough.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

