Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B57D70C0C3
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537958.837635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16JF-0004O8-4K; Mon, 22 May 2023 14:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537958.837635; Mon, 22 May 2023 14:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16JF-0004Kt-0v; Mon, 22 May 2023 14:14:49 +0000
Received: by outflank-mailman (input) for mailman id 537958;
 Mon, 22 May 2023 14:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXMk=BL=citrix.com=prvs=499503587=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q16JC-0004Kn-Ga
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:14:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec9f36b-f8aa-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 16:14:43 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 May 2023 10:14:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6985.namprd03.prod.outlook.com (2603:10b6:a03:433::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:14:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 14:14:23 +0000
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
X-Inumbo-ID: fec9f36b-f8aa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684764883;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HikiG1NFCBU8u1Lo53caaapa4/+8mqmyVPewJllENnU=;
  b=SbF9nnKZgBOJ869F1HeM9GOl2+UURsg2RGtK7gIUXvk6ELnOStUznjmW
   d3NIl/OHV2EjzIGQLgXo2tbPwDK8bSV9f3TR9L9wh+i7vCfcfihUCZ2OJ
   bxsXO0aMIAz/76wRrjiXcTdFBt7jaoPrr46NoNjKOG5Xdpj8/Bu3yytPB
   M=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 112399140
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ngfITKlXbRJ/KyNtYPjGInLo5gytJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYDDiGO/uMYGH1c9t1bt+2/B5S68SExoJgQQplpCkwESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgW5gWGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aEGC2gpagGvvMC364m5T+9Fu5gBcNa+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTefjp68z3AX7Kmo7GhQuZQWF+seCzUe3YINCF
 ldN93IehP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Y020BTGS486FLbv14KuXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94bd+51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:8fCIUqyDWGyGN9P2kzzxKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ACjpYgGhbZMt2XBBm2tKRp3T5fDJuL2P+lFPUMmO?=
 =?us-ascii?q?DK2dCc7+QT3atpIE4jJ87?=
X-Talos-MUID: 9a23:N+50QAamJc8+qOBTpTbUtG9cb/lTpK2nMxEQrI5ftpG0HHkl
X-IronPort-AV: E=Sophos;i="6.00,184,1681185600"; 
   d="scan'208";a="112399140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Awo3VaTwwS3sUZqLpuXDJOASPXhNmN5u1FFnKCyDuVczZsNv+WI8lAE8d/JlFcjz9Y/Zok8pIJdGYinDhcSOP/1/L7+hCnnCzekk3QHSkTzXRVAjapSH0Ve5j73Nt+tkhbNClQXtDcwya6MGe9fqgD9zDjZ9rjSKxHued/qKG9d3JBk7yRQ088CufZkV1hw0YlczsFerkjoVqxJUApgxszvNAlP2Q+1vRBCVa4aAuetvI6/Jw39aj4XV+IG5yXceDa9ad4L0PlFS7i374EcK2Wha65Di4LrH6Wp8Tc1LwMmkxt3+1rUGdegVU/hPG0n3BCXkFuSHeGodO0YUgkEa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXDCI8hGzOzqJwY/J8wzbDgmUQRsgCSILaSDg0F0HzE=;
 b=oJ592Alg1lUL62fFoaRVUM7wimjRje0iFYxbbJZeB+Jiy81GO1IkwLrq3eQYFcNr7BObPK1TcUHQ0SJJpKTV6Qy2LHMBdNJ8YfGq9N6STviVLaECFNXIjPYgdT0eepYZiXczCWUpNPYPHbAzMok/fv257JqguOUtY2yOfsA65uoz0f369gWe/a5S0LicVY2Fg1XmvzH4QxybbbG+FAy3G+UcQKZwBKbhkALdEA0RLVKD6DHOGErT+ORK8b7M4Rl43HeldEBjW9Qy3+TxRUsnxGQIb34KhxlUWRM7bcHvnrWiYI0xVc2kw2P/0r7ieUV+kHJhQ6ldZ005FenozQF7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXDCI8hGzOzqJwY/J8wzbDgmUQRsgCSILaSDg0F0HzE=;
 b=hwTOHjoK6rs7h4gc4N0qvvOIZdSDIU7htgpsTfuBLX6yYSXZaPPuPVqAvQqO1bTEw9zrQm2aOElSPOT3CSUADcN9lj8AxRkamLeN85AepUzHIAomR7de3MSMiTilwNsFpcGVgv577VnNfsy60kI9ktkJXyWpflBYYJkpH7bolaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e0d0de09-2da0-f961-f3d5-576cd7268f32@citrix.com>
Date: Mon, 22 May 2023 15:14:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-5-andrew.cooper3@citrix.com>
 <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
 <42cd2479-1eba-11c7-26d8-441045c230ed@citrix.com>
 <fb95d033-7a71-7cc1-bb8f-ee2a74d1c5cf@suse.com>
 <a8013bb5-b0bb-6e42-85de-2e12d7b6f83c@citrix.com>
 <678e997a-0e3e-a6b3-1bba-5e66ff74de48@suse.com>
In-Reply-To: <678e997a-0e3e-a6b3-1bba-5e66ff74de48@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0674.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 2629c22b-7233-437c-b469-08db5aced765
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T/42W0s3Wc+2Hve+Il71j8WdSfarYPRGfHVdM+31hHBmSShHmi1fNlXte9u3P09h8felA+9c6R9N4z7gUgpbx890nUDFZ58vE9kUpGak2YQAOHevB1t4W6c1Cx6RqbO1JM7FQ+co5R7gS+2z/mqjfvaIuTbcc+41k1zA24sQuRGBnEc30cZtHIQArpqRUUGZoDf2nrI9hAelen3EzogiWAZ4aoHItYoj2tY4UlWkLM+US8uhCTeqNoczzu0rss8vU55jYu5Tfchan8G6X7duI8b+O11jdKMEqFiFJQ591zsCre/mCzk6/g3PWTXe8e/p3xNzyjCYC45yGu9M8cdhWNax8VGoedoIKZOlMEHjG6ZYTRiDmMrJl3UpDhIr077ri5mkigpLis+LY5koGuXljlPFPlM7EruOO4I2Vj2P48OCa1WhakbuGQQIi76hz1LbC0IdUGNAfgs/JoIEt9y/Voz1wHr41WcczBW5ugnozDTYUy6R5NzqEpJ+iiEz0PB168vHSkA2+kpvewOCYdm2WnjJu+yjKY8FyIWJqZmb0XCZXFvl8tsxMvytTSaSxugWcEOFOx677NcVPCk3ibzE34d1BBR4A+f9MQTicl8RBiGT22J9yEyI2MnomzurzvLKdPcZxRkcSl9DRrGLBEIyOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(31686004)(2906002)(54906003)(478600001)(5660300002)(8676002)(8936002)(41300700001)(316002)(66476007)(66556008)(66946007)(6916009)(36756003)(4326008)(6486002)(6666004)(83380400001)(53546011)(26005)(6512007)(6506007)(38100700002)(86362001)(2616005)(31696002)(186003)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0Z6QVV4dXpaT25Vb05jSDVyNUNOWi9zWFZ4S1ovSWRPR2JPd2QrZzg1SVB4?=
 =?utf-8?B?QzVnMjU0TEZKVldkWnNHWFEreFRKQW5yQkt6b0VpNEZhamtjVk5aeVlVWldo?=
 =?utf-8?B?TUk4NW55Sm9WcWFWTVg0RkdMSHo3S25zZDBteFNaemJQMDNnbE1rMkhVMlV1?=
 =?utf-8?B?VFFSOEFVUGxKMy8rakpoWkxaUGpUVit1bDg2dTQ1YXFjSjY3T09UNzRZaDVL?=
 =?utf-8?B?UVB0V2txVy9XUzBqaDdWLzhNRExqVWprYWUrRXNTR1ZTMWdPc3RnWm51Mitl?=
 =?utf-8?B?SFFUSmFacHVTRFdYZHZIWkdPa2FOdnIvaEs3VnF6YU5nVkt5MS8wUmhmN1Mr?=
 =?utf-8?B?R0xQQlJXNDUzcUgrMWtEMWtPQzhsZzdlcjZMbU5CS3NrUDQ2OFcvVUlYWHBP?=
 =?utf-8?B?cUg0RnFzd0lDUGRLUnBOTlVMV0RlWnhSOEFlcG5RcnQ2YjNtZ3JVZWZyM0hE?=
 =?utf-8?B?aFlycWhObk1STDlBYmpZZ2x2WVl2bFZuYXBtODEweHRQNzJkK3FkTnM4ME1D?=
 =?utf-8?B?UnRLV29yYTJyaFl4UCtlYWFwVFBlemNKUnJVOVAvblpMTzV5Z2xSa1I3M1J0?=
 =?utf-8?B?Uks4NUJ2UEVGa3ozS0lDRktQdW13azdMN29JbG9WQ0NJZzgyRUFLaGJtcGhM?=
 =?utf-8?B?VnJjUTJoWUs4OTZXY2ZNc2YzZVkvdmQzVkYvTzlNSmNFUFdFZjdOZEN0UzFn?=
 =?utf-8?B?MXp3ODlZakE4dVJLUEVidU5hajVpMnBmdUJNS05DcjBYMVo1VFpORjAxUk1n?=
 =?utf-8?B?QlkrUGhCUldiNmpKaVlZQlhrTnR0eDB6WU9OM0tQanpoN3RaK3dLZ210YW5r?=
 =?utf-8?B?Q3VKb3I4ZmdnZ0hUQll3UzM4UDVpcCszRkY3dytxU2hBTDNEYW1sRi9vNU9X?=
 =?utf-8?B?L0s1OU14R01XdTNwVUVHdW92SmgyYTlVR01ubEEramh4TDAzMHV0VkxHNTZ4?=
 =?utf-8?B?MGVuNkNoNGo3TW1yeUpOOGRYM0lXdEhUWjBZSVFSd29iSVpkNy9iWUx3S2to?=
 =?utf-8?B?UWtMeGhRa091dkZTLzRMNjNRWmhIR2h1MzdkNTdiWWgyVTU2MGR4eXNhWFZu?=
 =?utf-8?B?clFaUjVkRzBxemh5bFZEZzZtN3lFdFM4M081TDdvRm15akRIV1lhUElkdFpw?=
 =?utf-8?B?WjZnOTlBZjZ5Y1loSE9UeDRvZWs5andKZXlScElNOHdJU2tyV3F6OVFRdHJs?=
 =?utf-8?B?b3FJemJrd0lRSG8xRDIrSFBKUmxXQllDY3NPcEx6YWhSN3BYUWdTbXdLcUMz?=
 =?utf-8?B?VTRzM1l4eTgrejY4azBKcyt2bER6bFVwOXVXRnJ3VS91QUJzVUpoY0NGWndB?=
 =?utf-8?B?OW93eDJOcHdzdlp0cTVDSUZPU1BXVGJNbWNkNy8xYXZBMis0Q0xveWpTZGJR?=
 =?utf-8?B?ei9jVkprc2NMT0RyVGJQa3JBL1RiSVRWcFN0Y0Q1VTk3dGUzc3MvZkE3WXZ2?=
 =?utf-8?B?T0puV2RGUG9VWjZuTTRrcGtOSjFqVkxGYy9DYWk0dU1hV0VGQWJxZFhtdVU1?=
 =?utf-8?B?cDBnNFU2dkxJdVNyOVJRbTRLVjZVejBZK0NKWUdvY1BiWFYrYkxiN0Jqa1Nu?=
 =?utf-8?B?TXdLcWtibktNcmpKdHNMZmo2aDB6cWN3R2hYZG1nZXMwa3Y4OTZ3T1FvMTVo?=
 =?utf-8?B?VHhOSlRkcXBFODlGQjJkNDRPQ1JwYy9RWWVyUC9NSlpxMld4KzY4aktrY21J?=
 =?utf-8?B?MUxKYSsrRnNQQXc4RHBnSkZIQ3E2TDBUbFhjVUsvaU4rTWJ6Z1dxVmFGUFd0?=
 =?utf-8?B?U2NUTnZaTXVnc1UwME8xTDVzL2RCaUcrRGVRWkYrVDRqbFF1NStBQ0pNNjJL?=
 =?utf-8?B?dE9yYWhpNkQyUW9Nd1FyTmg4Vy93aFNrc3ZPd0pOa2VGcWYrc3NjTk05UUR3?=
 =?utf-8?B?QTZyanlxQ1ZNdmhyTWE2OWRETHRLSk91bmFuSFB0cTUzVmU5aGszWHR3d1dS?=
 =?utf-8?B?WWxXdjdKOTdpL2NKYlNYQldvQmllV045bFJ5QnRTY3pFNTlBSG5vVGF2RDE2?=
 =?utf-8?B?OUhLWFNtZFlPRUpFNkFHczVxUVVTbk0vbnFISjNuNG94OU9BTkhvNGU4cjVG?=
 =?utf-8?B?eWFudjJuVldsZHNTT2E0Q2pQSzVHc2F0Z1o2RVUvcmx0cElNRENVN3VFWTdY?=
 =?utf-8?B?SXBUNDBwOVlHemVTbnZmV3p1WWVrbVE4M1QyNUdYUzMrS1BNTWVDbVQyTzRn?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	necJDkHN4BMKM9uq6nBAI6uyNKAwYg8t3KPw9KOVBR2ukx4smM5D2rtL/qkN7GMKuFp6qw9mq4rUI+iEDk0stvoVaT42z86JrTnRCIxh8VstWYHEoDvU5i2/AE//Ijs6Hzxpaa9pEocb7llu/MTYNd9WQapdgKvkLKo2uaGA/oUsdK29+hium7DxZ382wOr4++9jMr5pX5jwnvQWJcz+0/166gvlGtKmopASwRq3I+/o8UctyqaeudOk+cIQLHYe9wx6Z1M87x7CjzxI8wZTwwf/HwfFY6bLQILz1bdOPCT5GMOebttjQEX9ox/sHpDCXpLW21e37AZmduU/xkKLexzkVLx8N1H1yw/RedYbwgj4DeUYSiH37Cv/89jF21zIwAeEkTI3M8nXsdwR4TPlrTzCL1GulM0TeGK/uzisPq9imorssb6ip+dn7o9GfpWUkLjkb7oOGPnC+IAA0WSbWnbD9p378Li1n6rxTeI5l8Sty9Sd4LR7QOPsJ9sONbissLyh0atcwStc4c7Yqmdn5UWqj+TKetdPFp0hCYCKGw65gKNhG/ESc0RpJM3UgVBrko77Ea8i4dZMpj4mRMNqH1Tgyup+JU2NSkCa/u2kllPlPKYUYRoF/dDp1WnCtGqpAjM1UF8OkUUUxhWSLFwpfWEaCiwf8s5DQ/T3nNetpGA4UUS+N1YmuiefPjr5Q5H22PvXAksFUylF5GkMGAOCwtUEzhProS69lKOKwod+UFgUapjZhRtAyLYLQLDko7dVe+07o+T84Mlrs6ZNH/46PHOUU9zh208mVmNEqLa62CFwMDtxcwOKZEO+Vx65cOtI
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2629c22b-7233-437c-b469-08db5aced765
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 14:14:23.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQZEBhCyGRTDrEs7fWH6rIJ9LIksck1e6wPYiMYyNYByO5AinPXkum9ahO7tV+t1V7xC/XNYlMNDjr3XgHiV2OSuTSIjYJZ9qo4rnCOYxQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6985

On 22/05/2023 8:10 am, Jan Beulich wrote:
> On 19.05.2023 16:38, Andrew Cooper wrote:
>> On 19/05/2023 7:00 am, Jan Beulich wrote:
>>> On 17.05.2023 18:35, Andrew Cooper wrote:
>>>> On 17/05/2023 3:47 pm, Jan Beulich wrote:
>>>>> On 16.05.2023 16:53, Andrew Cooper wrote:
>>>>>> @@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>>>>>>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>>>>>>      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
>>>>>>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
>>>>>> +    if ( cpu_has_arch_caps )
>>>>>> +        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
>>>>> Why do you read the MSR again? I would have expected this to come out
>>>>> of raw_cpu_policy now (and incrementally the CPUID pieces as well,
>>>>> later on).
>>>> Consistency with the surrounding logic.
>>> I view this as relevant only when the code invoking CPUID directly is
>>> intended to stay.
>> Quite the contrary.  It stays because this patch, and changing the
>> semantics of the print block are unrelated things and should not be
>> mixed together.
> Hmm. On one hand I can see your point, yet otoh we move things in a longer
> term intended direction in other cases where we need to touch code anyway.
> While I'm not going to refuse to ack this change just because of this, I
> don't fell like you've answered the original question. In particular I
> don't see how taking the value from a memory location we've already cached
> it in is changing any semantics here. While some masking may apply even to
> the raw policy (to zap unknown bits), this should be meaningless here. No
> bit used here should be unmentioned in the policy.

The very next thing I'm going to need to do is start synthesizing arch
caps bits for the hardware with known properties but without appropriate
enumerations.  This is necessary to make migration work.

Because we have not taken a decision about the what printed block means,
it needs to not change when I start using setup_force_cpu_cap().

>>>> Also because the raw and host policies don't get sorted until much later
>>>> in boot.
>>> identify_cpu(), which invokes init_host_cpu_policies(), is called
>>> ahead of init_speculation_mitigations(), isn't it?
>> What is init_host_cpu_policies() ?
> Oops. I did use my own tree as reference during review. See the long
> pending "x86/xstate: drop xstate_offsets[] and xstate_sizes[]" [1]. Maybe
> you simply didn't tell me yet ...
>
>> I have a plan for what it's going to be if prior MSR work hadn't ground
>> to a halt, but it's a bit too late for that now.
>>
>> (To answer the question properly, no the policies aren't set up until
>> just before building dom0, and that's not something that is trivial to
>> change.)
> ... that what I'm doing there is too simplistic?

Raw is fine.  I found complexities with Host when doing that.

~Andrew

