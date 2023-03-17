Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762666BE872
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 12:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511029.789756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8Qy-0005B2-Ow; Fri, 17 Mar 2023 11:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511029.789756; Fri, 17 Mar 2023 11:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8Qy-00058B-Lp; Fri, 17 Mar 2023 11:39:44 +0000
Received: by outflank-mailman (input) for mailman id 511029;
 Fri, 17 Mar 2023 11:39:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pd8Qw-000582-Le
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 11:39:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6564c0a1-c4b8-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 12:39:38 +0100 (CET)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 07:39:36 -0400
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by BN9PR03MB6140.namprd03.prod.outlook.com (2603:10b6:408:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 11:39:34 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Fri, 17 Mar 2023
 11:39:33 +0000
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
X-Inumbo-ID: 6564c0a1-c4b8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679053178;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Xv9YrKj4u1VRjToCOtG1kqK6GEiN+Yn4+GH+o5txc0k=;
  b=h4yF3G2/ToqYpMUOp8ZHC0XZOipeODHp0ZJnKCckqhPI7hs/7EC7gBhs
   dIhu+H+bWP1uETs863XQYFafBjVAo9HypC21Gzr9hiOTVBia088H1OYVe
   jJXA7KhJCrLuFLgeWf/Ealm0advIKuHeJRs7JrAuKpfk05+Jtz2fQj6V4
   4=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 103677361
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jNEbEa5j0PoZo9w2jTpbfwxRtB/GchMFZxGqfqrLsTDasY5as4F+v
 mZMXz/SOPiNZWX3ct90ao7j80NXvpLWmoVgGwU4rCs1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 scXOhcWMAu/v9mS7K+1Fe1sgJ15M5y+VG8fkikIITDxK98DGcqGb4CRoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkkotidABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXxn2kB9lMTdVU8NY1gWG2xS8OFyYnD1W+j+H+0l7gRIxmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBQQ5e5dDm+Ns3lkiXEo8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:BrBRxqEylTbtXXhopLqE/8eALOsnbusQ8zAXPidKOH9om62j9/
 xG+c5xvyMc5wx+ZJheo6HkBEDtex/hHP1OjLX5X43SPjUO0VHARL2KhrGC/9SPIULDH+dmpM
 NdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="103677361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqM7/3sSxRmhxG9WA1BKCz7u1/zrKlJVDsxGc7zI4Ggqo/2vBGtk5i0k2BftAmrOgPP8+1USuQpLtQW8FnNGIJE557gidUitkcCFVp7f/lQDAbyoODZWNTbaBhUYe8SRcUQstFAfM3cmSJ9qUvg43y+Va0GibYHFasvNBSZDh93/J+E3DsUVxOWeABpgCXE6nZyVTQfKXPz4WzrV+jrTLCZJvFg6U4ER0/1cpgnJxpBHRte84pVqJjlI+J3ZW6YKm/2x1coTyJzLK0iMvg4Evq1bZU6fzsBwjSV2xpbZEqOZN/SBvgyKaUtNeeB76R+ZnL+ppUzj5AXLabntJNT/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CN/U6peCy/NQ2yC9yvS3dcjZwCd2I8QnDHb1phSuEY=;
 b=acCswp9nAosH5gHKhLIMfixGVte+p+ZZnM0F8rUtOTuYmKHzAde8IBThIPL4AnylNNIwZKeo4S4fJkuwy6d6GYryCGZ8NKIZYLxhpBajzcUgV0JAdhvUW+WBG7R3VxqpmT3WJ8KOPM46U1xclv81DBjGjO6Sam4AdbWarT6kxAL5I51FwSxjrsGRKAolQ5ryIFNhYGgtvaCJknoOwYKgmodjoJROrfDw4jxz2iItQzlcr/bCj5l/4zcgLZ4/v+qYrW9Rll5H5n7YP5jq+6Azr4rxNqnnn1gILpn93h1CjKiQG7lmvb0OT4689rUeUX6bQ4vJ/h64jyW8GaG3ryNnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CN/U6peCy/NQ2yC9yvS3dcjZwCd2I8QnDHb1phSuEY=;
 b=woEIX9dTLfe9NTxgGEfIeTeFM7sFhzvTsevab3T7qW2zmZp5rNrUEo7p9cvLd9ZmoLDPTSQLC5a9ApDJ8MmlHIflVu7FsM92TiyFyNmo3JwgEo30AutTEdwTPAuTlK64deoF1Zd86Chcu7yaPT0/RuZD5f6TYC76XB3yYQEYZTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 12:39:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Message-ID: <ZBRRbnBjWHXAM1ug@Air-de-Roger>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
 <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
 <2c0ff1f3-ee0c-6d14-a51c-d82b65338005@citrix.com>
 <0df22405-bda8-8f4d-63b4-e9c4d57843b1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0df22405-bda8-8f4d-63b4-e9c4d57843b1@suse.com>
X-ClientProxiedBy: LO2P265CA0429.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::33) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|BN9PR03MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 309f4d8c-4318-40a0-9881-08db26dc476f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMHT73D+//2FQQ73JOZw0Ri9oRyj0YEqUBPk3yxlpnDNmezj5SyTiCI96Om5LoVFwtY2Xco23dKmeHqwB1wAykzfp5gu2oFfLHsAY403iXM/cPUcyKioBrc13ej+XvKg7+vXgeI/UqP9/1LBjpkJPS8SOdjdE0JLOzNgVRwjfLdjV17Qrf9ePwM6z4sp0zICmhgFFdrcQStE4fnGPHrMyXSFjEtjVDiYtfpk2vdYwnDy5AE8QNlL9MOxiGOMd3kghbQFbSeYnuMrwDLLCmoMvUJ9ApfppjN/ugQ1g2GJGzRuX6qzf+hd6ks0nRGcahHfj0cHIIUyC7PayLYnBHP63ep4gOiRD1INpiwdXSbM6n9K94Uxcjun23DkUtIBt4grgkCRQ0vsct/AjSbrfv1JAyOHa3g+xjeSOZsp7NBbVMipwgVqoEMbLg0qlze3gvwAfjUH28992ziPAJPw4IV9l1kqNZwbuTnKl/nL6lMvUO8FZvyPx5cu0QOdWW+kpzrqJz+Uu8f3uvLR9rHkDiGkjRQWNb+rh20TjjX1a0KvSzsGUIRQhyw9pBMA9HnsBjU/oEbzM1GRYJkQQAIJ7R+EJgDyJbPugi48Ygd4JTAkQsyhruInauGz+dr1QLT8Qu35UxNorG+gy9o4kzPbGs89Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199018)(6506007)(53546011)(9686003)(6512007)(6666004)(6486002)(316002)(478600001)(66476007)(26005)(66946007)(186003)(4326008)(54906003)(66556008)(8676002)(6916009)(83380400001)(5660300002)(2906002)(8936002)(82960400001)(41300700001)(38100700002)(33716001)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDBGWG9ZaWxOdTVPeTdWRFJGR2lsQkVNNDJTWWkxRGRhZ2gvL082NW9Wc0lw?=
 =?utf-8?B?Zkh6Q0xZVWxLYWNRVFZ0bXhGbXN4a2wxMzNURjlhbG5IMWRyeHp4Q3BqMkNu?=
 =?utf-8?B?UThuNDl2d2szZUtyd09mdnoyRnlpSFNFQ05nTnp6emtBMFJrSUY1ejNlOEdU?=
 =?utf-8?B?a21QcEhMVDhzTFNwV3M3SXJHdVlQTTNPVUhwdkxrdFgyRGdxcmUyNnd4Umc3?=
 =?utf-8?B?RXhOKy9TMmpsU3FQYVBPRkQ1Tk5oWTg1SzNqNHhVNFJCSmdZRHp4T2h2cE0z?=
 =?utf-8?B?UDRXZGFCRU51ejJrVmJBUHF0MDIzdytoejlGeWNzTm1Ydy80M3NENmZhOC9t?=
 =?utf-8?B?QkVFdmRoM1ZyZVBHRS94K1pEUDVuaC9qNE00M2I4ZWJOdzFYTkRHcDBZb2Y0?=
 =?utf-8?B?andrWmZWK2FTU1RaeUxrclp0WXR1RVJ0c1JKZWhIUGc1QU5qb2JPVDlnckZu?=
 =?utf-8?B?RXRSaGNwRjFVOG9jTEtYMlRkVDNLeVJsQ0RENEcxOEpJOTRiYjBDTW1TaGRs?=
 =?utf-8?B?QTlIdGpFOE9keGJ4eFFVVk1lN09vRWwvTW1qeEozWFVpMEVBWXVaMDBXUERj?=
 =?utf-8?B?bzA1WGJLUHVvR1pRKzVUL2xmTnEyb2tUS0tGbytGaWtRZ1dNTytyMDNZT1FP?=
 =?utf-8?B?WHRmYVdBeEZoZEZxdGkrZXlCdGJ0cDJSZDl1TEI2SkRaazVhVjVrdDhnTTNU?=
 =?utf-8?B?anVtSi8yQ0lRcUhQYVlZWWc3Z3d2L3RjRkFtbFdWOFBBQWFTT0o5TS9RNFpr?=
 =?utf-8?B?UTRRK1crK3d4T0dTMzdzUkpvSG1mbXJKM1N1aFIzR3h4ZUZWbFdrb2xKck5n?=
 =?utf-8?B?RTlHNmN5c01uaXN3VkdUSFJidUwyVmdydFNEZG9hZFpKVC92SXF2YUFzQjNB?=
 =?utf-8?B?MnpZQ0VRbm1vWDA5TTlNeTJHRU54MnVwY3VJQ1BROHhNZjhBdzhGMzJGWGtl?=
 =?utf-8?B?VW5nV3Zxb1Y3WDN2ejhqTy96czNCNUNtaElmSTM2bkNhTVE2b09xU1hINHcw?=
 =?utf-8?B?Ykt0bXBtby9nUTlnOEdGTEJOYzBPenZqT0s3SGpuNWxyTGdBZzJPQ3k4cVU1?=
 =?utf-8?B?amxIbEZUcGxkL0pjSlRNTWJGckFGUCtKZDFsYmozaXJDVXF4eFFyRnNSeHE3?=
 =?utf-8?B?QzFyZmtxYWR2L0xJYU50a1NwSU1kZXVCbHA1TFEySXo3ZFVNQ3o5OXlNcmI2?=
 =?utf-8?B?Z3NVVS9RWTFZRXFoQnB4bE1VWkNXTEQ1d3pIQ2pJL1Vma0JKRERpOUVYWjJi?=
 =?utf-8?B?ak1PTnN3S2g0b3ZhUW5VOXVzN3JEY3Jmd3UvazFrMmxER0hjSk5UTzlpdlVV?=
 =?utf-8?B?VDdRNndBVW1Tajl3anNqR3k1MEN5enpPQXRSSXlaMGRwcko1d1BBVGJjcHVx?=
 =?utf-8?B?ckt5UjlrQU9TSXNXSDJ6azFNZ1IyVE1JbFVmVWYrblZaNFJpNU93SE1mTVp6?=
 =?utf-8?B?cDVKY091NDlnWm44bnAwS3FCRTNueUMxWUVSQTdXcFo2VXFQZ0FVOWgxYnR6?=
 =?utf-8?B?QlVsWEpWLzZxWklpTS83Rjl4NTNsUFV4TFJhNWdJdlJGM0pscnZNZHpDNVBT?=
 =?utf-8?B?czNOZVRCalZFUGljU045emd6STRmeWh2UDZGNVJQcWxudGFpbVV6aFR3NUQ0?=
 =?utf-8?B?SmxmeTc4OTk1aktPY1dxa3ZEYWZGL3VINmNpaUJSOG5lZlRrOXJBOExUVGFl?=
 =?utf-8?B?dmdXYnBtL0dWMVJ2c1EvRXk5UndpSGZ0TDhmSXBrcWxkLzVqVnZMREdzYk5J?=
 =?utf-8?B?SGVVTWN2UTV4Vjhya1BKaGRFNEhqUkJUcTV3NVFWclBCT0FvZWNwZm1KWWk1?=
 =?utf-8?B?OWUvek9pcHJ1dHNPdzZTM1JjMVNwajdiSlNHZ0tiaS93bWFxeDhJRTQ1c1JF?=
 =?utf-8?B?QXlERXdXSHc3emlVNlRTaUlhb0dDbEZaaTJFUXhuL05OWVlFa2h4VzBTT0tI?=
 =?utf-8?B?aGtJM3l6bzJUZDk1RDBFdGlBS0x1ZXFtQk9jTGl1dGlWcDJ2dGlzQzMraVdt?=
 =?utf-8?B?WWdTSmUzMHduTEEwaEZUWk9Gdm81TGxXYnlVODUwdU5XU3RxeFh3UVlISTg1?=
 =?utf-8?B?TGRaZXYxVk9ycVRvTXBRQm1YRENBaFlnTFFjYVA0OThTMUFtRGdGZGVFOXIw?=
 =?utf-8?B?UHpaSlRNeXJQSTlDdjgxRnROUWFiMVAwdi8vUEVLekxLRGFiRHpuL2h4L0VK?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qUXkpdGcn8wi/8l9z4ndmkUhmDTUnlfKaG3+xPSMXuOZsV0Uu8kexeUA2xfQz3SoceKif68MEpXcciy4yItrj4jQ/Q8aXVRQO7IC7zgylsXeBG/q6SPw6vUEsEKk4YkgPNdyqFlqCofORspMt7yLjplpnFSSaaV61/kqg5aw86kk3fBttTcrw5j2qvVD/Ghlq7oP2HjNAwfiyO0ToQdbVrTGr6qiViiJC4hoSuphiNA2GdgWWY8zuH4kzQHzLNzAOe3Qi2LJlqIicKQAi5In7epLT5qVOoqMEmC7C9LKkARXG8H0WJByhdiMNxq+k6NWWtZkesGh9BR3qplce93B6phVIjc89twrxsu5jgH3LEO2Wxbhczk1aK2GBIiOk4IH92Fc2VugKJrpr2vXmzyec10g+SxqFEsXHiKGBVxC4Ix2CvP9GkxP17JyXQQH7804TFKHXvxaAz4+r8NcHM2G66lopEEuKR+F32sNIHCwyZojEh5bxf3dHq6PFgOS0XQa+zTawVYEoCSJEzQOBr2sm+cMotUPYgmF4fI2wkPangsXAmvOnwpY73NfyHVy5Zn3Gv2zzUWBub8ZjuiS3EnThSfbg3rlJflDIUezCdvYVYGSXjgqi7HQK60bw5dHP+38SmOZHcSccAZx8CoD6lDi1HOJjugUbhBD2U0qvoFd/VGZN46wKbJFaKf4voTp6I9ejoe4q6XzvBm1R7LknS4VU5sHxUZU+kI7LpeElWQITJnxEPI3CKRa17JpJT6enrzBqM6mvDq+JcYYUWbXSu5z2SLdSDQnwUHQuce64W4xlb4NqwneVkFWxYrDt8N6gBXAPPFTd6onDotiHwEBRQK0ig==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309f4d8c-4318-40a0-9881-08db26dc476f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 11:39:33.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVkVZXdxXhxMHuQ/Z/V7YN0GJTVrwSpQ62eEbDz2sRx/kY8EH/KUSwnbMWzLXFVupXezrYVORYMhyBdrQVAH1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6140

On Tue, May 26, 2020 at 06:40:16PM +0200, Jan Beulich wrote:
> On 26.05.2020 17:01, Andrew Cooper wrote:
> > On 26/05/2020 14:35, Jan Beulich wrote:
> >> On 26.05.2020 13:17, Andrew Cooper wrote:
> >>> On 26/05/2020 07:49, Jan Beulich wrote:
> >>>> Respective Core Gen10 processor lines are affected, too.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> --- a/xen/arch/x86/mm.c
> >>>> +++ b/xen/arch/x86/mm.c
> >>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
> >>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
> >>>>      case 0x000806e0: /* erratum KBL??? */
> >>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
> >>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
> >>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
> >>> This is marred in complexity.
> >>>
> >>> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
> >>> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
> >>> no longer exists/works.  This applies to IceLake systems, but possibly
> >>> not their initial release configuration (hence, via a later microcode
> >>> update).
> >>>
> >>> HLE is also disabled in microcode on all older parts for errata reasons,
> >>> so in practice it doesn't exist anywhere now.
> >>>
> >>> I think it is safe to drop this workaround, and this does seem a more
> >>> simple option than encoding which microcode turned HLE off (which sadly
> >>> isn't covered by the spec updates, as even when turned off, HLE is still
> >>> functioning according to its spec of "may speed things up, may do
> >>> nothing"), or the interactions with the CPUID hiding capabilities of
> >>> MSR_TSX_CTRL.
> >> I'm afraid I don't fully follow: For one, does what you say imply HLE is
> >> no longer enumerated in CPUID?
> > 
> > No - sadly not.  For reasons of "not repeating the Haswell/Broadwell
> > microcode fiasco", the HLE bit will continue to exist and be set. 
> > (Although on CascadeLake and later, you can turn it off with MSR_TSX_CTRL.)
> > 
> > It was always a weird CPUID bit.  You were supposed to put
> > XACQUIRE/XRELEASE prefixes on your legacy locking, and it would be a nop
> > on old hardware and go faster on newer hardware.
> > 
> > There is nothing runtime code needs to look at the HLE bit for, except
> > perhaps for UI reporting purposes.
> 
> Do you know of some public Intel doc I could reference for all of this,
> which I would kind of need in the description of a patch ...
> 
> >> But then this
> >> erratum does not have the usual text effectively meaning that an ucode
> >> update is or will be available to address the issue; instead it says
> >> that BIOS or VMM can reserve the respective address range.
> > 
> > This is not surprising at all.  Turning off HLE was an unrelated
> > activity, and I bet the link went unnoticed.
> > 
> >> This - assuming the alternative you describe is indeed viable - then is surely
> >> a much more intrusive workaround than needed. Which I wouldn't assume
> >> they would suggest in such a case.
> > 
> > My suggestion was to drop the workaround, not to complicated it with a
> > microcode revision matrix.
> 
> ... doing this? I don't think I've seen any of this in writing so far,
> except by you. (I don't understand how this reply of yours relates to
> what I was saying about the spec update. I understand what you are
> suggesting. I merely tried to express that I'd have expected Intel to
> point out the much easier workaround, rather than just a pretty involved
> one.) Otherwise, may I suggest you make such a patch, to make sure it
> has an adequate description?

Seeing as there seems to be some data missing to justify the commit -
was has Linux done with those erratas?

Thanks, Roger.

