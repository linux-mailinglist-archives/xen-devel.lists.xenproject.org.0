Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AE6CD2D6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 09:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516078.799621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQ6W-00042O-TE; Wed, 29 Mar 2023 07:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516078.799621; Wed, 29 Mar 2023 07:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQ6W-000402-QB; Wed, 29 Mar 2023 07:20:20 +0000
Received: by outflank-mailman (input) for mailman id 516078;
 Wed, 29 Mar 2023 07:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phQ6U-0003zp-NV
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 07:20:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 244680e4-ce02-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 09:20:15 +0200 (CEST)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 03:20:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6779.namprd03.prod.outlook.com (2603:10b6:a03:40e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 07:19:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Wed, 29 Mar 2023
 07:19:58 +0000
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
X-Inumbo-ID: 244680e4-ce02-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680074415;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/+hEML6wSmOL967Fs7Y2bFIQfFM5Zp5V++5d8UsbAVE=;
  b=Qp5qf5jX48qOXM6L5tFjuqAqRM3xZVFpE+zu1a+G25ohFXoobpgtZ+Sn
   n2Jn4fnDu+cq6BVMxA8Tj9iF5R7mqVXXUZPrNDK2yGIQawSz7E4FtuRrk
   02H75yCG+GXIItRtCzbgjf1VP/I1PDYUTarP0aB47XfTjU1EG/KXCETVb
   Q=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 102272871
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:o7r806w+mMq8oW6E/ut6t+f9xyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 zZJDT/VOauOYDejf9B1Pdnl8BkHvZCAmNMxHgU6pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6ET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTse9
 9ccDh8AVQGSmP7r2pKxe8x23O12eaEHPKtH0p1h5RfwKK56BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDSVkFAZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjAthNTu3nr5aGhnW2+ncVDUcvDmKpvNaillSUA9BnO
 UA9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5fPnzI2+9FHDxjiq9p7AS1Zp4h2NBj75qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y2d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:hNOH7qGyj0GCXwJQpLqEOceALOsnbusQ8zAXPo5KOH5om+ij5r
 iTdZUgpGbJYVMqNk3I9urgBEDtexPhHNtOkPIs1PSZLXbbUQiTXedfBOnZslnd8nbFh5JgPM
 5bGsAUYrCdYmSSz/yKhzVQeOxQpeVvnprY5tv2/jNIRQFua6ZvqyJ4EBvzKDwJeOBfP+tFKH
 OD3Ls8mwad
X-IronPort-AV: E=Sophos;i="5.98,300,1673931600"; 
   d="scan'208";a="102272871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF0HfsnW6aGB/EkJb0L3zuiuQNaCoqMhaS17yc4n2IO40DxkDYm+GdMUu1hVdS3GOXvaMZqr4C9flJwS7Hf8AY0CPmy90Tph1f8U83gfeYTS12Bp5Zq0/ABEkP6WfEwC371QjwCzu2T+5m7F2VUOMBimO3szEj9wAslIyf/O7xDEC8JNoYvv8ht/X6WIITth8A80EkTTDaLqxwl1EJvdDsdJSzjMaEfoiGJUJuMz8lrbhLGDKDu4VLJX0rmfM5zFdMfOICRvUtTZxRJASxaGPPcDV/gDE8mYF11uI8guub5GJeVsFQVxobMUeNoXttQvcHppAgNyp0KdviW0/mVzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+hEML6wSmOL967Fs7Y2bFIQfFM5Zp5V++5d8UsbAVE=;
 b=jVojF7UTgCXmHcCNE0rla+NsqZXsef/UlSe2zEJP1FYLfobtLIRYCoDyH7Jq3vUyKTtCodHTPqRg1eS9gYZLS8sdF93O5GM4TpAChgd3RGYhibbkHwbcHUHL/TDTWineB9c8LRq5paBOTkMKe3YkGLzSE/Bopr0QsEkYe98xPu15XvHCJLg6S8eQnT+HItoZZAdyNhbaidkH+QDPKzpWMUWhOgnyYxzK1bqcV+MKpRPXyDjkiy/JqVj6Vy5a5XmBsAEW3m3fVMsqSR3f125M/IreFmh1co4Q1LS1aXvSghsJR3y6Rc1PoiGFAFv3dhSuRBl/bp3HucXy6IKvLFZp8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+hEML6wSmOL967Fs7Y2bFIQfFM5Zp5V++5d8UsbAVE=;
 b=T2mFrLNAKisdaH4DmCN2NY/L3h0/a1j4mHgZW5ilVe+K3Y6TGwe/N3vMfhlnGWVosTzQidv9QHcH7Y0k24E6yqD/j4rui09yUQiIbDaYqmHURIdMiL83DQIVqY0ptl0bgFHLqAiF1U8mBaB2UwA0/2FGkW5ChPaz9WrbwBHpFA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <72defa4a-3dfa-e113-2313-4b897c3dace2@citrix.com>
Date: Wed, 29 Mar 2023 08:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] ns16550: correct name/value pair parsing for PCI
 port/bridge
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <8e96dec5-1575-3561-c61f-ee188c884b9a@suse.com>
In-Reply-To: <8e96dec5-1575-3561-c61f-ee188c884b9a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b2ce62-d38b-4049-6983-08db30260082
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lXROzhgw9uFLqDrJzi5kEuk64bL2P+0eiCGEP7ZAQufJrZSUwIBjroD7zP5OSNDzDK4++1RlXcMhZIb+DoaQ86qtSNE/hxtHB6Wa8pD4rwOV8V6vCH3unXzo5GB6KH2PCeJBSmLUv/CN/lj+g4dLv0zgdkh1u8snBTIcQr5V5Zb8MbN9N15NfqUcGyJ8rNNGlsUShY2ONhQ+UF3Mz7D+E+xXiegTmiXFUoF7pufHtPj/36oHrf2ZUYy44sOyQkgpb2VRO0TJcTyEkDg5aXQW2VquS7F7FYKmq5Dl9mh2kn/sgIFwmbiFM3quVTACgToBIpoOCytfWbfQkYWmiGJh4p6zKARfas+pexx5sLKQdpeM8wYLPCUSOT1RZF8o4eHK+rH81KVkK4WD72Z56YYcS6Ak0u3B1Qml8acznLQa9/8BggCbAMCP0shkM3NtfTQQlei8pMd+SLsGHIUukmWlhjB8hf5bNEnfuAxsR4aXUvU8a1AI//caU0+WCVc/YO/G+wFB/T7CnQDZ09aalGpOZyn0TsAkbcKHdtlGCOUX5OBPkmKh0GkFEHbAgAW1IRZnRp1NtUi9BKbat+wLvEvnm6a+B/z7/aDczNPPjZ3EtPlu0S8HOpw5cI1+zUQBKv7EX1kZ+DBan2JyRTVzmtI48w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199021)(36756003)(86362001)(31696002)(316002)(66556008)(66946007)(4326008)(8676002)(6666004)(478600001)(6486002)(110136005)(54906003)(8936002)(66476007)(41300700001)(5660300002)(4744005)(82960400001)(2906002)(38100700002)(186003)(26005)(53546011)(6506007)(6512007)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHhpL2NOanZ1ek4zYy9COUpOQm1SUTA2NXRYOGFVaHJVV2JDMEhIMTlOU0lj?=
 =?utf-8?B?ZXgrcVVhWXovdHYvbUNndlN5K1lJSlIyWTZ2aUN1MzFnY2QwVjU4dnFjZTQ3?=
 =?utf-8?B?ZzdyenVENys2dzNCdXlHTitBdjJab0wxSGlGWE9xZE1Uc0UzU3BZM0gyN0ZX?=
 =?utf-8?B?ZDduYXF1Ujg3YUoreFJHemVHNWRheWMzRnlXS1gxRWZkL20xQmRvUEZMYzRV?=
 =?utf-8?B?L0VOYWNhY3c3SGUxUjRMNHJIcVZaVlpxT2dUQ2JGL2RhejczUjRrMndPTGNZ?=
 =?utf-8?B?cC9Qc29YTnZ6ZERHbjVXcW92SkpxNms2Sm1MY2FKbFFGNmdTYjZ0V1dlbXdr?=
 =?utf-8?B?T0RFLzNWQjExR20zM0Nrd25FS25tV3BqYWMvdUJoMnZ5WTZFMjl4UVBub3VE?=
 =?utf-8?B?VFBzTVVCbUExNE9pTWZqdzhSbTFuaFY1UFZaQnVVUVp5UWllWTBCTk51QUt3?=
 =?utf-8?B?TW9YbEhVR2JIZDhwRmJCOXFjWjNURWFvOEs5QmZNaFcwYk5SMkpjTlJ3ZW41?=
 =?utf-8?B?Z29sN0djZ0ZZcHhCck5VMzRoeGpvRVkzQURqaTNKZWxERE0xUklvTWw2dmJU?=
 =?utf-8?B?cVN5aFlnZEgyMHdoVU9lK21jUmVsaXJoY2pSQ3VlZElrMy9MTkRMK0NWRDVh?=
 =?utf-8?B?MmV1NUtGZk5zK2dvWG04amhMd3AxRFEzcWNNU3lxOTlDWHlKZ3pFTGw5bXVH?=
 =?utf-8?B?MGF6VGlsbDMrREkyNVlMMnhFNG1RQldVYnRpeTh0eTBGdUZCNXF4SUhqYktI?=
 =?utf-8?B?SzlIdm9VWnAySFhWS1liSFBYalpXWmhROUhaa3V5bFJwbkI2Z3hnZmd2TTRT?=
 =?utf-8?B?VU90dTZwR3ZOelZhZjRWY3pYU3JKbTlHcUdpNFRXNDM1SjFPTTNlcy9Hb1ZL?=
 =?utf-8?B?ZmxuSjh4LzJQRTIxSlpiOVZnTzhXbUM1cGJOaFBPUE5zSmhqazRMM1BuYSsr?=
 =?utf-8?B?aFVDaDAzMUNxSWUxa014RTJqTmk1ZWxDQ2NPeHVnbU9sbnc0Y1kwSUR1MkhC?=
 =?utf-8?B?eGpTZy9tNWM4YkxRZDUyWUx5dEp3UGhFODlwZ0JoRU41d3FXeG4xQk1sa3lt?=
 =?utf-8?B?cTI3YlIwZDNlY2UzTWhkSGlEaFEvcTVNZVBsUmVUUDJXU3F5UWRpa3FOdVNj?=
 =?utf-8?B?NEQ0ZSsyOGlNSEFCSFlTWk5yVXFraFUyOWVGc0ZVVTBzaklXQlViSTk1cmFB?=
 =?utf-8?B?WHpoZUFkYStHQWNYUlRleU15c0ZhK1NZTVI3OHlLKzQveVZzSkExbmtuaGZF?=
 =?utf-8?B?WXFPSWFOam1SRFROQWFOQTNQR1hQRjFXeXJCWU0yaTIxU2t1OGcvTHNzZFQ5?=
 =?utf-8?B?UFVNOWVnUHpnZHY4RzdyZ3ZmVFBOcXRsMkJQdjhCM1dLU2tnWGlsNlpZYjZq?=
 =?utf-8?B?cys2MWErU2lXMkNJZTgxTzlFcjMwTXlNZmdDaHU3YjJRTjE3OFV2dlgxK0lx?=
 =?utf-8?B?N2VrNlgrSkdWVXhCQmdicmNxVGsxVG5GWUdJMHZYK0xvcFVBS1QyK1NlbDhh?=
 =?utf-8?B?aEdyVTdBUmxKWGE2dXJFSE1kTVgxM1VRaVppRThBYklYK3Q2eEJsNkRucEpP?=
 =?utf-8?B?MGpjZmtnVXNlanUreldGZ3pVYlU3Y2phZWlPSE1WeklQU3ZmTHBjanRrb0JN?=
 =?utf-8?B?NExkZEd4M3FZSjI1NW5IazZ4M1JjWW5nZmxoa3dLZGI4QzJ5UVFwbTdjUXEw?=
 =?utf-8?B?b0xubzJ3WVFQc3BBZXhiei9oS29WNGk0NjZza3RKK0huVzRuTWlPeWJHNW9F?=
 =?utf-8?B?WC9rYVZCL0E2Wnl3L21rYlN5MDFqbGVMblliUWlvTGNOVW0ydEwxLzZjZEhw?=
 =?utf-8?B?Tm5MRVpvU1VEb2sxL1dhYlVTdzIxaHhSUHBCTzF1bUdSYTRWQjM0cVpLUk0w?=
 =?utf-8?B?UnpLOG1EclgvWXpobElJVGw5Qml4OFBGVXJMSFd1cHdJUzFZMUxXcWFJeGZJ?=
 =?utf-8?B?c0tleDFHaFJndC9yMDU2aEhxeU1CeE1GcDBBczZaUS8vTXp5OGNHZVo2RnhN?=
 =?utf-8?B?bFBEMC9yVHV6UlFkb1l0NmNRNWlkMVVvNHNjM0dod3FFajJpTGwvWS8vUzBG?=
 =?utf-8?B?VVdBL3J5d05VUGlaWlZWV1ZSQUc5MmtnQ3pFT3dIaHcwbDVRYXIzSnBoU05i?=
 =?utf-8?B?UkZNZGs5Tkx2RTFxSFh2bzVkQkU4b3dvd1NvYmwwQlMzSTdySFNrWkl3SXNM?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1+zIZrrwZuFpy2JmojDycZZlCmELO9eIeHDS16ORZV1N+BQI6wvLxgnJuvNdAnDy6SKnq4euHzPoDiosiEgQVK7OSfLf7cbIXBAwilDygux0vJ83eQA1MC4Cl0/EfQezd+B8p5Jni5lAxFFVGg26+kMUTZeo9dzeniu8zCRKnLnOQEEbpW1fj0vbTAj4MJX33wOz9HaXo8U6U2+hbv6SSMpXzcZ1HNsx+4a28Il0RuUEDvpDPHKMPZMUj5nsRBd0rDSZib5Bkph9VsrM7nEkuElWxh/7xk6BEZ2rSaQZbnsdjGQgtfWW9N7sE9BNwgngzgbkH5Y2M6V+JVqJXWvCH2Kf9NSj8WeURLoVGqzQT/ZQCsiHowviEd5rUORuC2ZfcuyZFaKLVmQPkteTdUE0EXZV4xuxsPIVyMsXU8c46c76I476eFeZJ4zsQivkrjRP2VweTm71Y6/o2yeqwL18RJsvsHFQLpBJc8d6dJdbqY7ZPIbT7XdMgCujiVLMlGTpWyspFtnLihc4M9xIlFs+jZPr0wBoMPNH0amXKesO1fdsM2khUJxrOxaSFng6LKJQDxAIGH7dU4waWhUrRRgRURPQvitlB5ksSU4t7+8KegkwTcYJ6J2J+x6DpK089ay2i2fHgE6bjvN7zUSB68Mrtej3nbCLWbwOitzAGpoDcuEk/8zRhCV2QnrJf8NJ2A5aMVlz/n8goj45fXlF/kROgWa5a/7Ej6fOKNWyW65uYrTQQJED7CKi9+7t4X6VrJSaQ7Sbd95MyWUTi6QpFvc0VHU9HAGn8i8Z1Q/Ny7Y3ei0zDaYPsaCq3ctTxV+h2E2SH2Zv8DaaJj7KvvctoawRdmI1xGzNuUkxskIEA/btWRU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b2ce62-d38b-4049-6983-08db30260082
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 07:19:58.2294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hzb4HTiuDXg3L8hgtkVaDuWIKxy3E0Buk5HscyS0IR+UrVUDjKFWr6MqfwPqxe0mfPdvTEfv0nSlFhBU8pzyGlCI9PGmyN38/9ZwasNu8Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6779

On 29/03/2023 7:50 am, Jan Beulich wrote:
> First of all these were inverted: "bridge=" caused the port coordinates
> to be established, while "port=" controlled the bridge coordinates. And
> then the error messages being identical also wasn't helpful. While
> correcting this also move both case blocks close together.
>
> Fixes: 97fd49a7e074 ("ns16550: add support for UART parameters to be specifed with name-value pairs")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citirx.com>

