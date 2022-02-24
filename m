Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE564C2EB5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278337.475539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFVH-0002LM-1b; Thu, 24 Feb 2022 14:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278337.475539; Thu, 24 Feb 2022 14:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFVG-0002Im-Uf; Thu, 24 Feb 2022 14:53:58 +0000
Received: by outflank-mailman (input) for mailman id 278337;
 Thu, 24 Feb 2022 14:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gX/V=TH=citrix.com=prvs=047ddeb39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNFVG-0002Id-1Q
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:53:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 963e4043-9581-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 15:53:56 +0100 (CET)
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
X-Inumbo-ID: 963e4043-9581-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645714436;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yiAZxBXHR3X4ZzNbpc9Jm8d4cNxdGTj9ugxuePGrrlo=;
  b=XoL8E1uRXOY9fxL+Yjx1uK4k45u/aPkiefqDiSRmp4aC/TOfC0AJcwLu
   E0BiA2v4FbZgcbwk6HcL2A4hbv3j4UgWqLp5196ZFIq2LU+4C688LN15m
   TLyjXMQ/WSL2pk11j7xYFKhLHvTFe2rCVoBK06hAp8/5Di6hzJZeDJqPO
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64910182
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Fc2FVKhkJ3XOC6ZOLAOV8dgcX161lhAKZh0ujC45NGQN5FlHY01je
 htvCzjSbveMZGL3f9B2PtnnoBkDuZ6GzYcwHgpt/C0zRHgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnR4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQMqO72SquBeagBzSAJbA5Nl45P2cGfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiCN
 pNBMGo1BPjGSy9uYlgLDLwVoNqXlz68XxZK8niqmpNitgA/yyQuieOwYbI5YOeiRshLn0Deu
 mPP+Uz4BA0XMJqUzj/t2m2orv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGpK4+7hbzFoHVUBixoXrCtRkZM/JIGvA+wBGAzOzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcGUA8E7t/LsIw1yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT+VPCk2yeotvwVyVuxSDpYEG+wjIoe9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNrKigbArLWdrGR2Cg2bKgQgBd2B2zMkC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bDOiLPFe1ebwPVBgzc0E9iiF+Lm
 zq4H5HXoyizrcWkOnWHmWLtBQpiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6NbI57ZWqwXEFwqOV01NPHAkWCrTzzy7SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW+
 eHIOt/zKXbbezlfMQ==
IronPort-HdrOrdr: A9a23:GI4coKD3WRSd4i/lHeg1sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkj+Ka+Adww4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJJGdZc8qPSMex7wqDL3QSuvyAfcZek600ykke+C3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="64910182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUdxex0QcaVl3WAnHng/161OnUUIZ8puZJaBN6rzr/ybZ2WswtJB7BpsW+kX50xNCxcCje91MCiIxMxwHHd4cwNEEQr5BG4cY6iHx/IOBAsdGDW5Cbg94UCeeLaicFEzw9Evlrbg3+vUTw9BeECSRVqnTkohMAPQ6vVmlTq2wNw25l19n+i9bqzTJQZ5cudQl2Rnfs2P68hQXgFpnYiaJn4ONCj4z/llYGqZQinNFHU8gD6YfB+hxKregdaruNCBnI0qXco/6aJc1hHrmFu6pHbVv4Dtesz4yjbtAJWKugnX1ii1OlaMkEIyJzCtG+pJyAvaPaMuvpXgz4OJ3M0JaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6OFIDOaIaj/zUecjHYavG6hXt6oRTmZOnzyaM9GqfM=;
 b=YPBRReCQiW3d70hUcnN0+YiRg4/v/KfrS4V816dwDlk7s1c8JLjPQzE2ygv1dZBS2IEu+gRX0zrd95Z04nmxZdjGEEEyvuDyxPtiU0o4VHkvBd3Ra711M7wzv2DeRHFyVax3z/vqruzQAppwt/kmnGc406BJgAZfehmslSdaDGt5qEDM03WMqfHQG7iJC0CxOLrub2yelbdzJylC34zWIt82qo8g1IJ8hH7SK/NOisw7NmTfCMIZ2E94euVBG3m3Hff7D3AwbXnaZJxfX9fvFjxyhtMf/de0fo981cq01Bp3cRf6mvo0ndjmIglgQ46JvOsoHOz1uSFZGS+D69UqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6OFIDOaIaj/zUecjHYavG6hXt6oRTmZOnzyaM9GqfM=;
 b=idPnTq5ao7UTBNDkeUYAGiHpEOz0riykgeS3k0gzAH7qj3VP4x+Mk84yvKm5YOUO22xNBZM+4/O6+Nhba+ky5a27D5x68cPLT3Id40959s681Ug/TuNoHuz0NVYP+FdBMUXRf4ru1OnlMqc02nkH62zVIwxPqJvSVbNWpGL6dsI=
Date: Thu, 24 Feb 2022 15:53:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] pci/ats: do not allow broken devices to be assigned
Message-ID: <Yheb8Z2oNwypwHFd@Air-de-Roger>
References: <20220224124344.86192-1-roger.pau@citrix.com>
 <3eb5e059-b37c-27c9-5c1b-0ed92b9edfd0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3eb5e059-b37c-27c9-5c1b-0ed92b9edfd0@suse.com>
X-ClientProxiedBy: LO4P123CA0508.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 891d14ef-9fff-48c9-1889-08d9f7a5732e
X-MS-TrafficTypeDiagnostic: CY4PR03MB2440:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR03MB24407F32FF7D9B66D56082A28F3D9@CY4PR03MB2440.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41J9V6WDPW5CWwjz4Gw2aEmXPc1EEFvV9J/Szql3rnws3vYC6J2oQfUN5c9XmrVUE+ydwLxEQrRsWbq/nRluuxCD8QNrS41BVEDRn43z8MH64a0FBYPDYEzT7EoYolZbLgPmHlbEo4k9Ji0Ob6eaBUdNcVCGgDshRZi+joi28DtHUtd5XVnnTls6UH+JCvN7XbESWdSq8eRgwXemYBgq3DwxxgslO8tciJMl/hl9DQ/sMF7yxve5fJCkOXWf0WTbu9XW9fkSmzF04qFR4XEGkXzfr/WwgRnBzAEKVx9jnib15F3eVH3eZP3zsjqETQSMQw26WxQx0HrZ17Nwitr9uimxXHk6ATX9N4zgRz8r0E5BtSUuy/DsJdPOnjw4vJ4w6azGgs2zb5wYQzEgHeiPU77G6cmTTgWBzMlOh2Ys7WfBVF5QqQGvp4bN2CgGKOidNcAJvCGKlg/7hCRUqYovS2jEsOczBTmbKPtdIcM/rgr0O23jogdwTYbIbjDKxBSXXvzvbKwXrOEAQbg7YWHehlFnqgZLIFlUD1juCSyf3Jb6KCtB3duXCsRdoRXj6tZzPxjREzQmxspwuLG2IMKRDhnAwnzOjT2zYbKUbvtjINvrO5Emzk1iZELjaDm7XqfiCoUgBv3PBKrCZ19H/HjNQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(53546011)(83380400001)(6916009)(2906002)(6506007)(6666004)(8936002)(54906003)(85182001)(6486002)(4326008)(66556008)(66946007)(26005)(33716001)(38100700002)(9686003)(6512007)(316002)(82960400001)(86362001)(8676002)(508600001)(186003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUxESlRzQnRrNGd6d2dVcDlFbi9lME5RQ0xndWp4SXdJb2lLWjlnd1dxb2tY?=
 =?utf-8?B?MVBBclRJK05ZREptQi9pUlVtdk5Mc24ySlN6WE9kWGZzWEkyaWJHNmdmZi9H?=
 =?utf-8?B?VTdya1Uxb2lIbGNsWjIvcVlmVEU1eXBFT2h6cE9lNmhENUswaS81bmFzUmNs?=
 =?utf-8?B?L3o0TmZxSDBmcm15dEo0ZlZkZEJ0aWRSM1NYQy9Kc0gwcWNka2cvekN4WllP?=
 =?utf-8?B?cWFjbUxDM3U5MVNoZ0h1NkUrUHkrMmxvSkQzdWVOdUEvUGRnTXVhc1lWUmNZ?=
 =?utf-8?B?ektXeko5TTBjQ3I0b25XU0FKTktaSktZN0pvMS9qZk1vczlBbWhXa05DMGxF?=
 =?utf-8?B?RCtHU0lqS3RtUXpZdFNab1NQcElnNDZMaHNLNGZRQi80Y0ErdmQ1S2QzdkJy?=
 =?utf-8?B?THk2djhwVjlDWnlnWmROMG12dDZvVTZMN0VYN3dFNUdicUJaNjE0MFJXN3RK?=
 =?utf-8?B?WjJueGRYcjJuTjA2NzFtaW1HRnJkNnhhM1FRNVpnUEl0VlFvdGZlRVhnbndy?=
 =?utf-8?B?aUdDaytBckt1bVlMZThnV2JUeVZuQzRPNUxmMWtoL1ZrR2Y1eCtuUjAreEww?=
 =?utf-8?B?c2t2OEJoM1BZMUtvMFUrSVJsS0dGK1h0SzJkdlVjbEJISklSNStlM1l3OXJq?=
 =?utf-8?B?M2s2ZUs1aytPSTcvSWkzSStyVlhBcmRVL2ltUExnTGpIODhBdGpMbUNQNlRR?=
 =?utf-8?B?Yi9USHY5dzJJVWxEbjJzczl0czBrR0J5NjBpc0VsNHI5LzFxMEN6dmdaaTBL?=
 =?utf-8?B?VU5IRDRjTGtuV0xyL1ZPMmNQcnR0V0EwMmY2ck9PaXVFcG1UcG4zNXhLbDk5?=
 =?utf-8?B?TS9DN1VQUVFvQWtlSVdoczM2TWVhYXNUVHYzTnZnajVlc1Q1WFE1WDhDOEtQ?=
 =?utf-8?B?STBhc1c5akRHU2VVYkNtNUxURnpPdGo3VDE1TU1wZlhzRS9TSlQ3SkFpSk5F?=
 =?utf-8?B?SlRzYkVsUWtYTkVLTWNLaHNWTjBQYW56SkcvV2FuRThGYWRqcEZzUHJkREp2?=
 =?utf-8?B?eGNUenIvR0VnZmIwODM4ZkgzczdBY015OEZyRWZKVXRxWkFHbW9wWDVVY20x?=
 =?utf-8?B?cTRyTEsvV2JtQjFsVnMzRWcyZ0pBSTRtdDFZZGd6ak5aN3F3eHNJc2FSRUJz?=
 =?utf-8?B?U1Bpa0dnNVFES3NhZmx1UHhXZnAvUTdhWnFOSm5hT2ZlRmhRaGhLVjR5WlIv?=
 =?utf-8?B?SEJHN1Bwc3REQ1VCTnRyMG1OTHFPdkI2TDl0WEJDYU9MRE8vbFJSNDF6M1B2?=
 =?utf-8?B?Um9wSmxiaDhmb3p4endsdFFVOGZ5Q2h6Y3NqR3hva0ZiQmZ4Qk5BdFRiUFZZ?=
 =?utf-8?B?Q0h6WFFhb1plN2JvYW9odXN4ajRTOTJVRnVMOG1UODcrdjdiZGg0TS9nRWU5?=
 =?utf-8?B?dlcwNFAzZS9lTSsrWDRjQTBqV2ZwOVFkKy84dFlUWU84TnJzeUdzY253THl2?=
 =?utf-8?B?OGtNK3Y1S0JSOWFadGtaTmlOOUZVTk5oTmtOTGxJOUs3SE05a3hGYnpEbmdk?=
 =?utf-8?B?cnRDWUg4KzYzNW95MkxkdXpZSWdpVHNkcHZyei82L3pUd2tSSHFQWm1Vemor?=
 =?utf-8?B?RlZxRU1pWi9sS1hDUGxlMEFCYzIzVUlIZ2JJU2ZiZ09HQkR3cm1CYk9lN2JZ?=
 =?utf-8?B?Qmx0VTJvK3VNVCt2bVVDUElpR2F2bnJaRUIzSytneS8vcFV2STd0c21qVW1h?=
 =?utf-8?B?V0ZheGkvM0dSMEdvUGFwTkIySlJXcHFQRHN4RXo4WXBPTFNhWEg0NFpLQ0hL?=
 =?utf-8?B?UWdONUUyMm5qYllZcm5zcXF2RlNnMm5POWhPQWI4b0Y5MDg5dXBQV2Y0M3Q5?=
 =?utf-8?B?RnhFbzdOUU1Qa0hnMDNWckR2QUkzcE5KQXdPUVRvRHRHL1ZxOGwzS3RRaml6?=
 =?utf-8?B?TEw4V3kyM0o0NytLTThSckpGRjZGSjZLNG5aeUpSejZLUVEzR2VSZ0FzaEUx?=
 =?utf-8?B?V2R1TFo2VngxVVd0YzdWZ2VCSjZNVmV6NmpxU1VlWDY1RmVrTURBenZkZjRq?=
 =?utf-8?B?S1E2RU5leVdvMkUxRU83UUpUZWEvbDJrY3VHL1UyREpKNUhnVjVCNFZob2Fz?=
 =?utf-8?B?bDVXSlM1VTg4Q0FkUWM3bUVSZGRwcWJLelBUUFVDWFd3U08vMlRxOU8zK1ZE?=
 =?utf-8?B?OGtMRUhPb1loMnNyYjc2YjA1R3dVQ0RRMyt2U3dUTzZiRitnLy8rWWlwaURL?=
 =?utf-8?Q?cvyF+x57AvQ9OoIqis4FZy0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 891d14ef-9fff-48c9-1889-08d9f7a5732e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:53:42.5263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCABRVlsXPlqcwsQZvA1zn/Y1sSBEjr6uiJyvuP5oCfTQ+PRoQR9pw8nAbfnPtXXnb0Q0DO2IW3V2Xvq52TQSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2440
X-OriginatorOrg: citrix.com

On Thu, Feb 24, 2022 at 01:58:31PM +0100, Jan Beulich wrote:
> On 24.02.2022 13:43, Roger Pau Monne wrote:
> > Introduce a new field to mark devices as broken: having it set
> > prevents the device from being assigned to domains. Use the field in
> > order to mark ATS devices that have failed a flush as broken, thus
> > preventing them to be assigned to any guest.
> > 
> > This allows the device IOMMU context entry to be cleaned up properly,
> > as calling _pci_hide_device will just change the ownership of the
> > device, but the IOMMU context entry of the device would be left as-is.
> > It would also leak a Domain ID, as removing the device from it's
> > previous owner will allow releasing the DID used by the device without
> > having cleaned up the context entry.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > RFC: I haven't tested the code path, as I have no ATS devices on the
> > box I'm currently testing on. In any case, ATS is not supported, and
> > removing the call to _pci_hide_device in iommu_dev_iotlb_flush_timeout
> > should allow to remove the dependency on recursive pcidevs lock.
> 
> No objection in principle. Whether this is the only dependency on
> recursive pcidevs lock isn't really know though, is it?

Indeed. I didn't word this clearly. The recursive lock was introduced
for this specific use case. Whether we have gained more recursive
paths in the meantime I haven't assessed.

> > TBD: it's unclear whether we still need the pcidevs_lock in
> > iommu_dev_iotlb_flush_timeout. The caller of
> > iommu_dev_iotlb_flush_timeout is already bogus as it iterates over a
> > list of pdevs without holding the pcidevs_lock.
> 
> Analysis of whether / where recursive uses are needed should imo
> include cases where the lock ought to be held, but currently isn't
> (like apparently this case).

Well, I'm not opposed to that. I think just aiming to get the current
usages analyzed will already be hard.

> > @@ -1487,6 +1487,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >      ASSERT(pdev && (pdev->domain == hardware_domain ||
> >                      pdev->domain == dom_io));
> >  
> > +    /* Do not allow broken devices to be assigned. */
> > +    rc = -EBADF;
> > +    if ( pdev->broken )
> > +        goto done;
> 
> I think this wants exceptions for Dom0 and DomIO. An admin may be
> able to fix things in Dom0, e.g. by updating device firmware.

Doesn't a device get assigned to DomIO (or Dom0 if not using quarantine
mode), and then when deassigned from DomIO gets assigned to Dom0?

So there's no usage of assign_device in the path that (re)assigns a
device used by a guest into Dom0?

Or would you rather imply that pdev->broken should get cleared at some
point (ie: when the device is assigned back to Dom0)?

Thanks, Roger.

