Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11AE6D6E6D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 22:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518141.804372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjncY-0003G8-QH; Tue, 04 Apr 2023 20:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518141.804372; Tue, 04 Apr 2023 20:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjncY-0003EP-Mn; Tue, 04 Apr 2023 20:51:14 +0000
Received: by outflank-mailman (input) for mailman id 518141;
 Tue, 04 Apr 2023 20:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjncX-0003EJ-3l
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 20:51:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dc6f685-d32a-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 22:51:11 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 16:51:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6176.namprd03.prod.outlook.com (2603:10b6:5:39c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 20:51:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 20:51:00 +0000
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
X-Inumbo-ID: 6dc6f685-d32a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680641471;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d/iOhb27zQl0Tuqnt544c6sjqrsZzaAcvW83EZJK5kY=;
  b=SBiv/y7gCNqL3Fl+wYSnk7ASKU2ztZxQpoWIzCkFs9+muxJ4zDKyAdWa
   0tOpLE48qPCkk3Em4yAEmD1jMPI9vfb1Td3sZUYCYmwzAL/MZW7EGYMmg
   DGFBTVJCtyVnJX0Uu/d1GdThAFZXGYpl4Gon3Ot8SvYVJHD0b7YRwP0pw
   I=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 106757052
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3yR+nqgEGUXmPLeAY/hMyiHbX161TREKZh0ujC45NGQN5FlHY01je
 htvD2GAM//bY2Wjc4ggO4vj/EkAv5fXzIJnHlE5/CBjQy4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQKJ21RZRLZhdmyg4OwQdcymeZgFsLCadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGybbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXmqaM12ADJroAVIDsWCHiJmNCrth+ze40FN
 RdJ0Asp8pFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ/i0zJR9M6Sqqt1ISqRHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:krKzKa0ssaxDfDCcwY4ckwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="106757052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZKFQ28R07lFlepFv/LBj/DbBqCnCyggutGWyuhaKCI5lClBeI0x0iIqJmGfwnLCLpX7VMz672kod6gCymRePumxxu0clr3wYBorKAMJyk8WAQpOiu7MfsNNSsVox4fOwRq9Emsl513D1NPth8wBWMDXX5jd30CQdxnqaxXAoQpoemxxwqyYBtRDHwVMUcXdbo8PKt3Dw24Q25AEx3hT836GStm38ClJ2rrJP1oryw+LerbQmt4sGgnuiShbfLlVzAMTgNnSUy/WCEmwREH8MvEU6OnIgtUM8eVWNJoEyOFuP1OFKR69Bb3P0uJ+2o6nCPgBvDPq6+mLjNjzZ7PhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDKuqcvC7AlVLeucoWBHyztl7KBKwvZVo/uJNac1XF8=;
 b=kiislyOBD3iUhTHjccwpgwVu+AHAlGX1ad47FUIyP7dWoT1amm4nY+dQ98kMiwCTniK7BhHzTEutEsMwV+cIKJTs22Lx7r7jg1l+SG81oCfTBnrNBZJR0JgshzyeNcPw8cJKX+1jyUV79iYAPeFgm6Ey7F+t7FVMTYzd9fHQhJy2v/SFxAQm9HWiwA3ib+vIeR68RO1Q54BgFrEsGoPpPx+JtLvNEvj5XC4MCghuwtRZKy7JoIaV7nSfSqPt8TJ5xKV/n+NOv0pAnmqUpXAqk5XRRpSOwaMem5wT53Kt9aY7eZlS4kdUUYOHDptl1BWkosvkMj+dV7uIQS7bN1iF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDKuqcvC7AlVLeucoWBHyztl7KBKwvZVo/uJNac1XF8=;
 b=PInC0lXGhivAMelWCiL5n5Ci9biOfsq7O0W/8u1bxqsaHQPC8Pa3FY7FIi6RN4sSRK9FqWnNFINv0Q9yVyuWnDA/XNmfCF2/Sktojh6Rw5rJY93FRBWXz25l9eAUGhIzj1Ayjam3CoNqppQZ1pNe5hkoOTWFe3b1fFUCn/mm3DQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fb22a998-1d2c-b723-a2a3-7dec8946cb78@citrix.com>
Date: Tue, 4 Apr 2023 21:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 11/15] x86/boot: Merge CPUID policy initialisation
 logic into cpu-policy.c
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-12-andrew.cooper3@citrix.com>
 <087536dd-96cf-84f0-4b8f-d4de4d6bd093@suse.com>
 <0c43546e-0333-af19-efa5-71cfaf5efa3f@citrix.com>
 <dfd78e18-9f78-dd44-c19d-3a5263285d4f@suse.com>
In-Reply-To: <dfd78e18-9f78-dd44-c19d-3a5263285d4f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: afc277d6-5a40-455f-dab8-08db354e4c2e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XUlKjAF76JH8xR6cCO1fPWYFAHi7R8CAI4N4YPboQfg5PbLzIMnh3kcxia7b/OjHl6fKkMhlv3eCQkyLYvUGI9Nrv1ba0mFrB05Fs7bW6x8mngd812CKT+8+cV3k2Y/VL34h+ILs2MecftC3hFgxZ9TGofT7jSUOXELxltaHhDS9H9ak+WW5dWTH5iy5f1cgQdDl0kBOiTXyMn2oN3jeQdUdWpnJuRDNvGbsUTd+2tYETCNoUv75ycOSfXNmRK8yS4frJbF8BI28tuvMDsMvfp6OXaOcpTCO7iOnA+uQ2KONbc1jasvsN2+aJWqs0z+ohH4rlerJkVk4kFinNRv37CTru/eKwtcvxB/sKdWyrYDs70pjJYY//m9BQ+74t7Mu0eKy3GdPy8EwTWfg615Y9DouvzHFfXtICmxNfRXzwCxrwhdDxfABlXDUivpQUZkZYfeUo9wIYT11+eUtekYHu8Tu/JL1ZnayjJMVeRdP9SD2Ji0WFWfYMw4nk6gLEZdG5UW1qQ+LsYqlGqf0B6u2bRx+bMXifVwgfXFCWiEPzYH49jOVd+ltYvBuQJ/5ZxcXUMssfMTqmcWa/FPWhwzNe/8Q0VMb0QIY9fWaKz73PK0RbNtz0tEcRFVpgwdZAruogZ/NkKKCqhJOYPS9BuhhGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(2906002)(31696002)(36756003)(31686004)(86362001)(6486002)(2616005)(186003)(6512007)(26005)(53546011)(6506007)(6666004)(66476007)(66946007)(8676002)(6916009)(41300700001)(82960400001)(66556008)(38100700002)(54906003)(5660300002)(478600001)(316002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0RMTlZNWm5wYVc1TXMvZFNveU5BUlBYUkxKRXRza05lRDdWcWxRdG56YVVL?=
 =?utf-8?B?Wlh1RkkyTXZXRGxHZlF0MTQyemEwMFB1dVlwSmh4M2tZWStXK0g5RjFEcUJt?=
 =?utf-8?B?VFNNY3NsbVVrRllacFRXNWxNTEJLdkMvRGowSExsajNRQkhSQllNbkxaSG1E?=
 =?utf-8?B?K3V4dHBmZXhiS2RLQnpTNStnMTVwZk8wM2ZvT0E4Q0VGYzBybmlyVlZ6SVA5?=
 =?utf-8?B?YUd0Sk1BRnZRb015QVRpbVgzOHVhYW9zVnUvNDdqb015bHErMUVpQzM3dlZQ?=
 =?utf-8?B?Y3prdGNMcG40ZjYzT0luSDlUR3czRjlIVkh6aXZab0RSRjRYMU13TUJaYU1E?=
 =?utf-8?B?cVdQMHJvOFZyVDFQcVNDanFRSmt4dVUxaUl0MW16Tmt6TzlGeERBaGJHQUZj?=
 =?utf-8?B?UE5oRndGMzdrMjlvT0FGTlRSM2JWWWZsdmlvQU4yNVJydHVmUXY5RXZVREVu?=
 =?utf-8?B?TkJFYytud2RpZ1FoQ2MzcXZiVW0zQlllZ0hITzRMdy9mbkVENi84TSs5dTNs?=
 =?utf-8?B?ZW4vL2pkQ24zM2RaVDJNb2wwVzZQaUF3TEFMWHkzZm5SMGhuMnlaQlNkWDBw?=
 =?utf-8?B?WWppb3hVejhoQ1phZTBmWEZ2VWZtYmo0ME1wc2ZuZFRlVC9ERUk5Ty84Q1dw?=
 =?utf-8?B?ZDdzMEhoQU9xajJBR0RaOS9kajhaQXpxN3RpUWZIODBDeUxRdXJ2bjE3Ry8w?=
 =?utf-8?B?dnc5Y2dkei9LcE1CRWNTczR0aUVsbDdsSTZIOGRYM095ajh0MkM2bWRtMVdp?=
 =?utf-8?B?a2tLRU5GL3V2ZXkzMmp3TWxsSm9YNGdudjI1QzJpY0NJbjZTeWNZTkswT2Ro?=
 =?utf-8?B?bHR3V1N2WXI4RmlxZFM0aGtlQmdoZUZha2NzS1VRUUREUGFyL2srM2VNSmhP?=
 =?utf-8?B?ZVlJU29aR0xEVW5PbE42Q2ZqaXhoaEYvaHBZNFFIL3NIQUJiTWlUUFN5akRr?=
 =?utf-8?B?aDlXaEdkYTVZbmZJNS9RRjBESFZXaStTemNQNnE1ajdQQkVZcStzQWVnT3By?=
 =?utf-8?B?R2Rvdk1nTm5OVFJhWEZNOVRaWWJ4Nkc5TDN6VDJ1eGtHT2U0bFVpRVI3TUdy?=
 =?utf-8?B?Vm55Q2JkeUh1dURmZDB4TWx6aWFoWTBrOW5VYUhuSFQ2RjJLSUptNHpNbGhW?=
 =?utf-8?B?SHZybzA1OFd4amxGU1pENlRWSHJQRjg1UWtlSGpUWUNzZmJzVkFFRXI0VXJr?=
 =?utf-8?B?Tkd0YTNYMUxyQ1ltM3pzQXhkS01ORGVxYzRZTHdCaUxzRm55U0dtRlA4YW1Y?=
 =?utf-8?B?djdHWjIyczY2bkNKejV3T3pUY2YvYlRqdUlYWjdXZTVhWDRsMXVuNmlJRnp1?=
 =?utf-8?B?SUlqbFZxOGFPelA1NWNYLzF6T0NWeWZEVUt5ZXA2MmlmbnhINXl0QXdGbnNV?=
 =?utf-8?B?ZDA3RVJ4OFFCM3ZkTjZrVzZaeWFlQ3R5QkhybW5pTEdYcGNpSmJDc0FnYjc2?=
 =?utf-8?B?UVI3ZUthblI5d1NIRytCRExHT1lRYUdpSDQ4bXp5UHQ5elloQ3FVQlRubTkv?=
 =?utf-8?B?bENKeFNOS3E0b0FBRzMzUnVQTmJhS3VhQzI5ejMvVkkyMmdhTVRVTkNDNlhP?=
 =?utf-8?B?UXliVjRKNHRWQUNaZE5RdlhsenNEbjkwT3BuVnN1MEg4UWY1MldhK3FIRkNh?=
 =?utf-8?B?YmdCVjVjZUpieXJlMEF3d3N0WVlzazBuNTY1bTFzNmwzK0wxNkNwU1BrSFFC?=
 =?utf-8?B?bDd0QnVEdWlla21oRzBkRUMydGtWNEFjRHF4QUR5M2VPSGxkSVZPZlo5bHNR?=
 =?utf-8?B?cit5czZncEh5RE9WRUZoSUtET043dlBnQ0U4Njhtd0FsYkRoMlZoZVdKZnhL?=
 =?utf-8?B?RFZ4clNYYWdSY0t6bG4wc3NLTW9lMllScU05Z1NWMENTUVEzVUVxRHVPWnl5?=
 =?utf-8?B?WlFKTk8rVjVVUHYzWEJ0M0EzVkc5SnRlUElGdlRob3lDVjlTcTlKc0x1Rzl5?=
 =?utf-8?B?SDY2c2JCU1prRzlmNGk3aXJMTkc2K2dBVjdUR0ZHK1VVQXZBVUlqTWxPbTVj?=
 =?utf-8?B?Rm8zWmpRdHpVZkpEczhOck5NbURxdkRJNFo4eDcwNzRQa0I5cGtaUXFpUXo0?=
 =?utf-8?B?ZTE1ZGVHK1dBblFsd0M3SkY5djBFUXMwQnNtVjVUZWFzZkRkVkNCTnVEeWlh?=
 =?utf-8?B?TDNCblB0eURpM01QR0pvY29wbDNLVE1acXVLV1dzV2xRRFBONTEzbkIzTUkw?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XFz+MTPEdioA6ii1oehNI6+bzbojB4FnKTvW5EcfqTunHF5eATImcU67Ves7JDxMa5jPVG50p2dsoZK4A6lbyhU74FkRdlQBOgLlLWjMizfTxhbTIrhx3O32P4DddQytI/uywdl41OqBOxQwytTlLv64mqQXVkPhOr62wf+A9fyWAC9V9P2eXiQwMpN+zq/3lvl68Tv3l4jynSRtcNbnp/gY2NTeDoSeI7MNyKhzcrQXX7ZkzHOP3VsRQHPzxxYEqI6UIjqdlPU/5TVdsVFtysLJd6fzOkodn4kdGAUgpkTpnWfl27NVEB0QedI+lRaRyjHtFoOOKufy5KXCJpEnOECUYxRdBENB9x7CZw90rGS+0pxdsf51rm4dFHNZXhB20Kj15p+rsizZ8DHw1fFWEa4D2Gs+2MLe8HctUKClNF7nPdPfZ/8KM/zxDITmcetnEl2WCKEmzrSJctOoAoIbLGP70m8iLop3fXxdLLw7r4wTnEa2PwM1jY7AMzz/LsLSRa0iA/t1jZS+oGxLaFAAWdbqhhKyAxohyN06P+UtarwgXkZBkrvCyBB/MgcdneC6FmgxV6ASlhJbuRO06zoAI4rKSJ1Mbva5xg/I6AwroHAN5rVrsCEnCNA+rzo5nlyOFQ62JwfxOZHEJZKQqe/99dz0gMofMIcB87QQHp/Rk228nGMxqzARENeG3cedKVnBWvODWPgImxMW8pCqOdLR4kLXYeZetQ6tI/pIY3FxYsPU1in5fvxUgoScL3AdlOo1RTMFS0wZhUrrLWnTx9FAt9aKQEdrTA+aA7U/JrkNf6UmvEjv301W+aZYhh7dkWJA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc277d6-5a40-455f-dab8-08db354e4c2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 20:51:00.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsIuDZu2geNTIV0P+Z7CYFuPJqIKOIgfGsEeqg9uE2RnMWa3/NTzATZMrF/D9GCu6UVPgW2HLhcnE4xZDcR5xvi/CqH6w/gbPlss9s5DLI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6176

On 04/04/2023 5:14 pm, Jan Beulich wrote:
> On 04.04.2023 17:45, Andrew Cooper wrote:
>> On 04/04/2023 4:16 pm, Jan Beulich wrote:
>>> On 04.04.2023 11:52, Andrew Cooper wrote:
>>>> @@ -20,10 +26,332 @@ struct cpu_policy __ro_after_init hvm_max_cpu_policy;
>>>>  struct cpu_policy __ro_after_init hvm_def_cpu_policy;
>>>>  #endif
>>>>  
>>>> +const uint32_t known_features[] = INIT_KNOWN_FEATURES;
>>>> +
>>>> +static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
>>>> +static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
>>>> +static const uint32_t __initconst hvm_hap_max_featuremask[] =
>>>> +    INIT_HVM_HAP_MAX_FEATURES;
>>>> +static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
>>>> +static const uint32_t __initconst hvm_shadow_def_featuremask[] =
>>>> +    INIT_HVM_SHADOW_DEF_FEATURES;
>>>> +static const uint32_t __initconst hvm_hap_def_featuremask[] =
>>>> +    INIT_HVM_HAP_DEF_FEATURES;
>>>> +static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
>>>> +
>>>> +static const struct feature_name {
>>>> +    const char *name;
>>>> +    unsigned int bit;
>>>> +} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
>>>> +
>>>> +/*
>>>> + * Parse a list of cpuid feature names -> bool, calling the callback for any
>>>> + * matches found.
>>>> + *
>>>> + * always_inline, because this is init code only and we really don't want a
>>>> + * function pointer call in the middle of the loop.
>>>> + */
>>>> +static int __init always_inline parse_cpuid(
>>>> +    const char *s, void (*callback)(unsigned int feat, bool val))
>>>> +{
>>>> +    const char *ss;
>>>> +    int val, rc = 0;
>>>> +
>>>> +    do {
>>>> +        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
>>>> +        const char *feat;
>>>> +
>>>> +        ss = strchr(s, ',');
>>>> +        if ( !ss )
>>>> +            ss = strchr(s, '\0');
>>>> +
>>>> +        /* Skip the 'no-' prefix for name comparisons. */
>>>> +        feat = s;
>>>> +        if ( strncmp(s, "no-", 3) == 0 )
>>>> +            feat += 3;
>>>> +
>>>> +        /* (Re)initalise lhs and rhs for binary search. */
>>>> +        lhs = feature_names;
>>>> +        rhs = feature_names + ARRAY_SIZE(feature_names);
>>>> +
>>>> +        while ( lhs < rhs )
>>>> +        {
>>>> +            int res;
>>>> +
>>>> +            mid = lhs + (rhs - lhs) / 2;
>>>> +            res = cmdline_strcmp(feat, mid->name);
>>>> +
>>>> +            if ( res < 0 )
>>>> +            {
>>>> +                rhs = mid;
>>>> +                continue;
>>>> +            }
>>>> +            if ( res > 0 )
>>>> +            {
>>>> +                lhs = mid + 1;
>>>> +                continue;
>>>> +            }
>>>> +
>>>> +            if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
>>>> +            {
>>>> +                callback(mid->bit, val);
>>>> +                mid = NULL;
>>>> +            }
>>>> +
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        /*
>>>> +         * Mid being NULL means that the name and boolean were successfully
>>>> +         * identified.  Everything else is an error.
>>>> +         */
>>>> +        if ( mid )
>>>> +            rc = -EINVAL;
>>>> +
>>>> +        s = ss + 1;
>>>> +    } while ( *ss );
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static void __init cf_check _parse_xen_cpuid(unsigned int feat, bool val)
>>>> +{
>>>> +    if ( !val )
>>>> +        setup_clear_cpu_cap(feat);
>>>> +    else if ( feat == X86_FEATURE_RDRAND &&
>>>> +              (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
>>>> +        setup_force_cpu_cap(X86_FEATURE_RDRAND);
>>>> +}
>>>> +
>>>> +static int __init cf_check parse_xen_cpuid(const char *s)
>>>> +{
>>>> +    return parse_cpuid(s, _parse_xen_cpuid);
>>>> +}
>>>> +custom_param("cpuid", parse_xen_cpuid);
>>>> +
>>>> +static bool __initdata dom0_cpuid_cmdline;
>>>> +static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
>>>> +static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
>>>> +
>>>> +static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
>>>> +{
>>>> +    __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
>>>> +    __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
>>>> +}
>>>> +
>>>> +static int __init cf_check parse_dom0_cpuid(const char *s)
>>>> +{
>>>> +    dom0_cpuid_cmdline = true;
>>>> +
>>>> +    return parse_cpuid(s, _parse_dom0_cpuid);
>>>> +}
>>>> +custom_param("dom0-cpuid", parse_dom0_cpuid);
>>> Unless the plan is to completely remove cpuid.c, this command line
>>> handling would imo better fit there. I understand that to keep
>>> dom0_{en,dis}able_feat[] static, the _parse_dom0_cpuid() helper
>>> would then need to be exposed (under a different name), but I think
>>> that's quite okay, the more that it's an __init function.
>> I'm not sure I agree.  (I did debate this for a while before moving the
>> cmdline parsing.)
>>
>> I do have some cleanup plans which will move code into cpuid.c, and
>> guest_cpuid() absolutely still lives there, but for these options
>> specifically, the moment I add MSR_ARCH_CAPS into a featureset, their
>> bit names names will work here too.
>>
>> So arguably {dom0-}cpuid= don't be a great name moving forwards, but it
>> is is absolutely more cpu-policy.c content than cpuid.c content.
>>
>> We can't get rid of the existing cmdline names, and I think documenting
>> our way out of the "it's not only CPUID bits any more" is better than
>> adding yet a new name.
> Hmm, yes:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>>>> @@ -149,3 +716,188 @@ int init_domain_cpu_policy(struct domain *d)
>>>>  
>>>>      return 0;
>>>>  }
>>>> +
>>>> +void recalculate_cpuid_policy(struct domain *d)
>>>> +{
>>>> +    struct cpu_policy *p = d->arch.cpuid;
>>>> +    const struct cpu_policy *max = is_pv_domain(d)
>>>> +        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
>>>> +        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
>>> While this is how the original code was, wouldn't this want to use
>>> hvm_enabled, just like init_guest_cpu_policies() does (patch 10)?
>> No.  That will fail to link.
> Why? hvm_enabled is a #define (to false) only when !HVM.

Hmm, maybe.

But honestly, I want to keep the code as it is because this is trying to
only be code-movement, and because it's currently symmetric between the
two cases.

~Andrew

