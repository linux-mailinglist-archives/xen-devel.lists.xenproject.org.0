Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B77269D4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 21:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544987.851141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6yrZ-0007dc-V2; Wed, 07 Jun 2023 19:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544987.851141; Wed, 07 Jun 2023 19:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6yrZ-0007ay-Ri; Wed, 07 Jun 2023 19:30:33 +0000
Received: by outflank-mailman (input) for mailman id 544987;
 Wed, 07 Jun 2023 19:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6yrY-0007as-Td
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 19:30:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2972716-0569-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 21:30:30 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 15:30:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7049.namprd03.prod.outlook.com (2603:10b6:a03:4ee::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 19:30:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 19:30:15 +0000
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
X-Inumbo-ID: c2972716-0569-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686166230;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d901K3FsQlArWyfEAVNSw8MoDUStTJpdR+xbJqnJY20=;
  b=IfbbJYI6WfIm7ZaQNRhLQ4orPX6E/9nB3S0SbtlneHbTamnQparfBXO7
   NwBZLf+uDxWXzL6jNPqCWgSjypKv4KwHHclFrw0jzCxfTnlPFXkwCxJaq
   qL7JDwJZAiZx6H3ECwus7LFu5B41Hl8BbPS0M3k4wVc299OWw0vYSxNvv
   0=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 110716793
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1u4xLaLQro11leZPFE+RVpQlxSXFcZb7ZxGr2PjKsXjdYENS0j0Ez
 TYcDzrXb/aIZTf1eN5zaomzpkkAsJXVz4dnGgplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARhPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c55On1r+
 aIfDgwocz3Ztvvr+4CnceVF05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqjB9tMS+zjnhJsqHzKyVcsVAUOaUuA5siDigmxRfJSJ
 2VBr0LCqoB3riRHVOLVRB2xv3istxgVQMZZCKs772ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWJUX+U7KyTqxuoMDAJKnUPYyAFSwYI+djlr8c4iRenZtRpHbOxj9b1MSrt2
 D3Mpy87750RkMoK2qOT7V3BxTW2qfDhVRUp7w/aWmak6AJRZ4O/YYGsr1/B4p5oM4KxXlSH+
 n8elKCjAPsmCJiMkGmHRroLFbTwv/KdamSE3xhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLITLwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:fTxeYKmggNj/e+TqpUj0D9LOxMbpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:RQHnlG432i4ewWkEINss+nUIP8x7dVvh6Wr9eX6hVF1bVIaZYArF
X-Talos-MUID: 9a23:4YfiGgh0PDia2tmO/R437cMpFZ5n2JvyEFgxga5BivOEciNuGzqRpWHi
X-IronPort-AV: E=Sophos;i="6.00,225,1681185600"; 
   d="scan'208";a="110716793"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQTbiEqXqweUi8m0u9k9BBoz+i2b9I0NfFQOvf24Xna3W9omIEVxjEQu9WZPiSKaHjpd21ho3+epI9rAHetMpkngZfRKFwGjBXAZCax4p3BQSIxaeFKYRdD27QCTKm2kbaEShdKBjeD4G62gnKsonKtRlgmtCS++55byo7xuX0L1bxSpxln/Xa2XmKoObptpr31isKMgNuPPppwpqRSxU49ZVeHFoEtFKU83P4r8UaOIolFZ7z3McLmgDPqnwI7hPWSiAS0QBHYqR1mJqsMqazwVzDz8G2rVlftiLA7BuNiJqNRf42sCqV6koNcdNBzecn3ywPCErsSbUmKwa0AeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d901K3FsQlArWyfEAVNSw8MoDUStTJpdR+xbJqnJY20=;
 b=GIvxMSv++FHK9tyl5jJfe/PtTS22640Jrr3gnXl2UmhO+p95C7HPe1cdpmASoBKvA3p/NAQkux2bXrBb1OLpl/Mu1sV67n902S7xPABitR473wK5SnYkOnc+uQfdn0x2Dnq/G54zFEgM80cmArDfxH6TSZ/rIn8MneOk/ORvXvf6RQkQe4U2pT0i9WBDE8fgESNqogoUnpRPBfjDp2Qk6gujt0y9nA5/rjgEcWqCR8HQVn01suhBZsDHMozawV1yg/OuEmrBgE1Ke1i9mkhgqH8cFxlB7Vv2bMcesVW10nd2RX+5i3l+2+LFTZKhIqehmu/Hy64ohHny4HVrrC+Myw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d901K3FsQlArWyfEAVNSw8MoDUStTJpdR+xbJqnJY20=;
 b=oTmSCAt5B4S0Y9mDdzFY5vjBlQkPh+XTNzlqxqeRjCHLeFefE7rDWCKEKm+MPf4EPrGN7tSgMPdVnA0efX5yeMJNp61bTWTny/DO6lB4Fyd6c+31Mvc3TvNE/9OZLjLYmYe5nYTJZ1mn1ppy+mQjwrFJtgqDF+FClFl8Mc+cGAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <704339f1-4103-62ad-49f8-b7df1fc8b7de@citrix.com>
Date: Wed, 7 Jun 2023 20:30:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] Initial support for Power
Content-Language: en-GB
To: Shawn Anastasio <shawn@anastas.io>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686148363.git.shawn@anastas.io>
 <c1e75aaf-407d-6163-b382-b0c984e9db4c@citrix.com>
 <CT6NFAE37O7K.215IO8HD8PTWU@Shawns-Mac-mini.lan>
In-Reply-To: <CT6NFAE37O7K.215IO8HD8PTWU@Shawns-Mac-mini.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f970bf-a32f-4a98-06ca-08db678d9e5b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Iyhfx82t+r8cZf7jSLub4MCvWCVWVJAoxf9CtY3We5zQpybG6e0iAUrOM5JbtDm6VHJbfayy6EDXYvIc9BxHZu42NYCYsEMd6KFpuUUvJX9wnP/Dy2m1Du9PUi8h+zcK0F3WILndU0tXsMY7QBiR2FlFao7K7YCNttlrPtV9xRVvGuPTGPOwlcYTThFAUsqghEaOiSlJGhljW/xXOAMa9Odn+nWcywTeOrhxqPS1BZ8T2OE2x0T+aLi661U30kf4fFroB6EUSXpAgnTnY44P7sRCc0EzNGk69gecuCedPmM2DQHeIl4uAv72GEZ73kAdEQf+i6RypbstcX5wFIrjYyvbuhm9I/efoTB8X07s3d5iwXMQqAsH1BudKU8CXxwGIe8SLIid2BxR27u3EKGfUp2wYiWSISoZ8T9U8LLDHiu2MQrnvarn+W1/QYLNJOPa9+2QeqsqTYsgRGYgSGkRSbRpsk6+jSFzcYW3aSKHaPWfxlWlmT2Qo2j6K8Eh+7AmHQB6V92iIavcdzSJyKf4QnSEQx0ULDtLu8oGfW32evtcAUU1ItSKJSP7ejnqTyP1LhaTmDmuIF5PJYnc108Rm16O9wEPR6x3rbJWMUFkyUExunzlNeVYSsFTdcGFgsHdUiSAiEKSTpNrHWRLR0tSKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(66476007)(478600001)(4326008)(66946007)(31686004)(316002)(2906002)(8936002)(41300700001)(8676002)(54906003)(66556008)(6666004)(5660300002)(6486002)(6512007)(6506007)(26005)(966005)(53546011)(82960400001)(38100700002)(2616005)(186003)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVJFd25nQVZKbEY1NG02YnUwVTh4WWZaRDFQNFpPTStOd3pFOFRzSmM2WStB?=
 =?utf-8?B?Q082YnpDVWo2WjliY1FSekJRVm5TZkgvQXZ2YXFoTnIxbW9QdVJGYk8yWmRM?=
 =?utf-8?B?bWRwSjlTcW4xY1c2Z1JKdDkzN3lkcXhLb0g5YnpPNlpnWGVzZ1hzUVZuby9C?=
 =?utf-8?B?RnJ4aERNN3JzNmFZQm1FcFJtVm9kcXg5WXFxUGhHbDJ0bStzU094T0VzeTkw?=
 =?utf-8?B?Qm5qblBheHRJSWZacERCM3VMNXgwS1JjVktGcnRhODNHa1g5Q3JQWi8rYllN?=
 =?utf-8?B?MmhvcEY0TWo2Yi96dmdhWWZTZlBQR2h3c1VvQm9aTUJtR2VYOW9wdmpjQ25z?=
 =?utf-8?B?ak5xZEFjZldVZEowUjNlSlpKMjQyV3F5TmNiWTB4YVNGZk5ScHBNZ0ZhMXk4?=
 =?utf-8?B?Ylg2SWFpZVRKc3Iza2pDL0FQTnVNZW5qZDR5SFA3QkZiSTFDMERmYTArNXFp?=
 =?utf-8?B?cnZkQXo3SzY5eXZtRUlkSS9xNy9tWGtRZmc3Vlk4NUZWeEpYMndMN1BkczVu?=
 =?utf-8?B?Rlp4bC9WQllTUmRtam56Z3JJZHAxRkI3WVUxQVVCYkNrV3EwS1NOU2JSQmZu?=
 =?utf-8?B?Q1ZwMDNsMTVtZFU4QXVsYnJJRElrOXVJTUIwU3Z0Y0ROQmdQWjd5SFZtU1Q5?=
 =?utf-8?B?aGRUR0NMbkZyaUFsSjk1c1djdS9OMmt2dElrOFV5amxXblFxS0dBNGNvRWtZ?=
 =?utf-8?B?T0g1ZURZbVo1cm5aZkdseG5uQUZXZDZBUVdBYjNvaTlZaUw1Y21zWVlJdU01?=
 =?utf-8?B?ekoreDIvRU1UYUlCSDNuNmllb3NpYkFEUldzQmZBekJ1OEtOcjRycHdOMDVJ?=
 =?utf-8?B?K1hsZHZCelFLRjUwU1JIK0ZoUldNR2UrMUt5MDFybVZJemVYWThUZ0FvT0Zq?=
 =?utf-8?B?dllPN3dCdnNXakZkV09lSW4zRjJzU0FuaVRaNVVEbHhxRGpoY1JyZldBcVpm?=
 =?utf-8?B?OHhpd29ZemhMMTZ5bjBQY0dhL0pucW5SVVo4bFhrbmcrYzl5V1FHQ0xCR2lN?=
 =?utf-8?B?VXJ4QkIvZCszTFNiV2orNGpxRmVST3J2ZkJXVnJQMXJ2bFkwTnFaSjROK21Q?=
 =?utf-8?B?d0pUT1dFa2FSVUNndUJVY3p4MkJGc1JEYmhzaUpFRDVLcGUrd0tZd1JxSGln?=
 =?utf-8?B?Sit3TmErTHp3UXJ4WEhLUUFZT3NiSDhveHd2MXZHVTRlc2VTV2V1YXBpRmF1?=
 =?utf-8?B?ZnljRVp5SGtQbS9YV0Y4N3B0eDhhdXVWU2txQkxoSGxlOGxWVkpZM0hWQ0NV?=
 =?utf-8?B?WjRDRmNyZlZjNVplOVpZTmNDTFRaWkxOMHBadWtwRlhRNzZjaFduM2ZFTHp6?=
 =?utf-8?B?L0p3NzBxc01Bcy90ZTd6RW5Mb2t3MWFyV1N0eE9DbXhzdmNOWnBlcTVSeDVM?=
 =?utf-8?B?cTJ4N05GSVNnOHMwOTFKTkNaZHJEaXZIY0wzVFprbnprVmNBMFRyU2dqdng3?=
 =?utf-8?B?WlpLU2l6dlMyN3NBeDJnOWJtKzR6VjBwT1kyQWFXclhLUXYwZ3c4ZnEycTk3?=
 =?utf-8?B?U3hrTXB6SnIwS1VPQlRiWThxbXJmU3dVM2J3Q1piRnNnQTF6U2t3ejN2MVMx?=
 =?utf-8?B?aEFEOC9QRGptaGRTMGZsZEdFc2JtRCtUZ0pzcnFxQzZtbmtZdGpUVGI4eG8r?=
 =?utf-8?B?ZUY0QmpaQTZqeVQxMDdwejVXWG5RbUFnajVsRmdvMUx6Z0pxWCtCemNjSnFZ?=
 =?utf-8?B?bnhlNkErVEdsdTF4bmJkWlI3dFZuNUVhMUs1bG4zODdORkVvbkc4TFlvYzRN?=
 =?utf-8?B?ak84OWxGU3FBMm5ITUpHMm0rTkM4U1k2ekc3MXdZdGNielhGTlo2dlhNVTd6?=
 =?utf-8?B?MENIcVJ2R3JjUWZyRm1nbkxTOG9Wak5UTXhaTEx4ZWtCUUpXbGl5NCtIY0hk?=
 =?utf-8?B?dStsSEN4VDZBSUpEV0VqTWVHaksxWVA4REVTeXkzMTl5OHhWZWd6YWJITk9S?=
 =?utf-8?B?ZytsTGFvTVc2dmRqLy9ZeE13MzlXNnBDUDNuVFRXakpQVW5GbHJFRkREWDBI?=
 =?utf-8?B?ejY4TmU3ZFM0U2IvWDk3QU1iVGx3OGZRY05rcHlmd3owVGJoOTZrZkd6N3RV?=
 =?utf-8?B?RDhyNkhKMThCS0kzYWpQTEg1ckJmdlZBN2FncWRBenIrcDJBb3ZCMnJkUjAz?=
 =?utf-8?B?UTJOQ25hTDZaSFY2NFQrZFdlenhML3Y3L1UxeXRJcS9mdU8xaVRGWWY5UUlF?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?dWJLUHl5MDJoRGRLM25OZUNGTmRaRFhTNUc4cyszcCtOMzU0NGc2RUljeUZj?=
 =?utf-8?B?cDY4Uk1BMDV3ZDV1eUxGbERWSGxmMllhVGVuMno1WW83U1BBUVk5azgxYVFI?=
 =?utf-8?B?Q09vcFV4QVRodW4xSW1aVjRUV0tUaVRDS0pDUzhQdWlkem1QcnduRWRiaHpw?=
 =?utf-8?B?SFBRTDNqMEg4S3dNQXZDTHNMYXRhaWVNcTE3L3M4RHJWSkEvRGpsd3VJVjZk?=
 =?utf-8?B?WTc3NUlvRVhBWUs2NFdXRDEvNEFLbGU5SkNxdzRGVlpLdjFncSswekU2WStU?=
 =?utf-8?B?VGV0WE13ZmU4S2h6bE92bFVKaWtGNEk3blFJSk1XbTZxWWllMEVFeGhFeEZH?=
 =?utf-8?B?R3ZjNUE5NGxZTDFSRlZReUVYa3RjMHFVNVE0ZWFDQXhrOWd1cFdUSkxpSlcy?=
 =?utf-8?B?Y2RIek9DeE9zWXVhK3V3NUxTTFQrdkwwd3NBT25YNHdtb0JmenhoRCtHYk03?=
 =?utf-8?B?N1A1WGZQSlJqdVlTNUdmRnNyemtJRHBxL1RKVHNrY0FpNlRTZG5zdGRjN2Fv?=
 =?utf-8?B?b3pFMVJnekMxeGpuUmN5cCtGVzc1WmcvS3AyZ3JYRHU2OFpqQzNPQ1VCeG12?=
 =?utf-8?B?Skdsa3RacGhuRW1UMnZVaVRCcklKYlBoQUJFQ29kd2I2UkkzTmdCY3o0OXZM?=
 =?utf-8?B?M1RDeHNuTHkxUlZlVThwYjFmYzVYMHQzRE1XMDd0SVRmMFZGNUhxK1Y4RnVw?=
 =?utf-8?B?TmJEbmRXMkpva3VucmJMQ3RpOVd1RG00K2lzMjBjZktXSVBzaWpVVG5hdjcz?=
 =?utf-8?B?K2xhWWtMQ0xudS83ZDI3TnBQL3lNT0JCRzA5R3RRZkFlcnF4UHFLTW1DMWVO?=
 =?utf-8?B?c0RhOUp5RGxsRWR4NlM4YlFSZVU3ZHdhaEQ4ZXk3WXZrQVYzb0lVQUZTRzFy?=
 =?utf-8?B?UWQ2VGx3ZS81a21nNFVDZFBkYzhZdU9uNDVyeDJ1YkFPRm80ZDJuY1BaRE1H?=
 =?utf-8?B?QzRaN1NESFk2bmFHTmtjOUxFaEx3MEVEVWZZYWJSOFB4K3hiSnJzWE9Cd3VF?=
 =?utf-8?B?WitveUlNempiOHM4c25vUkdsdHhLNk1zTDV4amhPK0JySUJjaVZyTXM4NWFH?=
 =?utf-8?B?MFlaOVNvczFINHI2VjNPMUUyOTduRTBDWXhIQit4d2l0VzRZejUyWnFjMzR3?=
 =?utf-8?B?d1h2WDRYbHpJdUR5blhZMGdua1B5V1Q0MUdnc3RKWnYxOXJhVE9iZnhGMUVr?=
 =?utf-8?B?bGhQMkJUT1QvL1UxV0tyK0ZLYUhVVFRhZDYyTllGa2JFT0N5UUJYa1dKVUVa?=
 =?utf-8?Q?7JnBXFe0FrL3u2a?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f970bf-a32f-4a98-06ca-08db678d9e5b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 19:30:15.3229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Jgm1EgwhSxgmKqJgk/6Oe3hEpXN3XIMBYKdmgRwNiTLy+4Mk5hdSDy1fuDvM1xLeXXqBwzwI8TS/y3hqlV1Y5M3ZQDm2yz8dKiW3Z0Jzfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7049

On 07/06/2023 8:01 pm, Shawn Anastasio wrote:
>> If you look around in the Xen tree at bb62c25e3e5c and take the makefile
>> override's in particular, you should be able to get `make -C xen build`
>> work without any magic TARGET= overrides, and without most of the
>> headers you've added in patch 1.  The trick is to have a head.S which
>> doesn't include any files (except the config.h it gets implicitly).
> Perfect. I'll start work on a v2 without the TARGET= overrides and
> without the headers in patch #1.

Ok, in which case you probably want a first patch series doing:

1) New docker container (only - this wants to be taken early and set up
in CI)
2) one-or-more initial build system + head.S infinite loop patch. 
Probably the maintainer patch too.
3) Wiring the build(s) into build.yaml

You'll want to join the https://gitlab.com/xen-project/ and I can set
you up with a place to run the full CI (we have a reasonably custom
setup which the communal runners don't like).  You may also want to hang
out on oftc.org #xendevel  and/or the matrix bridge thereof.

Then a second patch series doing early printk, and adding the smoke test
script and wiring it into test.yaml.

~Andrew

