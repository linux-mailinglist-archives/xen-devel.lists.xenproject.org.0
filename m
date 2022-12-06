Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D56441BC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454613.712132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VfX-0007uL-W7; Tue, 06 Dec 2022 10:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454613.712132; Tue, 06 Dec 2022 10:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VfX-0007s0-SU; Tue, 06 Dec 2022 10:59:23 +0000
Received: by outflank-mailman (input) for mailman id 454613;
 Tue, 06 Dec 2022 10:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2VfV-0007ru-SW
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 10:59:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05eeae33-7555-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 11:59:17 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 05:59:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6759.namprd03.prod.outlook.com (2603:10b6:303:179::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 10:59:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 10:59:10 +0000
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
X-Inumbo-ID: 05eeae33-7555-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670324357;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/2AzkgF4a+9AJ7YOzwxj2q0kZigtMfhoQ0TvOO2fbSU=;
  b=ZMLWzCzh44nY6tQvvicwqff/wpEUU2KY/0lo0gsAQkNN0xRIM3puv9wJ
   8WURPBeMltZpLsWuU+BIxsK47e7mb3tJo/8sqEO4tGDASMuoyT82Kz2Ew
   dry6It54Pkf+3Q6hfqJ4kuvgDZFDL+4UMPLyEbjerY1oSmtj5KLte0XmA
   8=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 86346851
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KtP+H6oVY3o6V9hfEmukDps56/BeBmLvZBIvgKrLsJaIsI4StFCzt
 garIBmBOPiLMWfwf9EkOoW2/R4O75CEyYJhTQVtrCkwFCNH85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzydNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGAEMC2gl+Sx+7iyT8c23e57dcbNLapK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWLEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoqKU23g3OnwT/DjUIWBiSusm0oHXlWsMBB
 2oSpTErsJAtoRnDot7VGkfQTGS/lhIRXtt4Eusk6RqMwK7Z/waYAGcfSjdLLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcBRBEA6sPuo6kyiAzOVddpFKOpjtzzFir0y
 jrMpy87750Rh8MW06Sw/Xjcnimh4JPOS2Yd+QH/Tm+jqARja+aNe42twUjW67BHNonxc7Wal
 H0Nmszb5+dXC5iIzXWJWL9UQ+/v4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:7LojkarXP9FCDma7st1xJ0gaV5sFLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xig7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriCknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdI99WPBmcQa+d
 tVfYfhDcVtAAqnhrfizzFSKemXLzMO99G9MxM/U4KuomJrdTtCvjYlLYQk7ws9HdQGOtp5Dq
 3/Q9pVfPsldL5oUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR82AgEQu178HIeou
 W2bLpjjx96R2v+TcmVmJFb+BHER2uwGTzr18FF/pB8/rnxXqDiPyGPQE0n15LImYRUPuTLH/
 KofJ5GCf7qKmXjXY5Pwg3lQpFXbX0TStcctNo3U0+H5sjLNorpvOrGd+u7HsunLR80HmfkRn
 cTVjn6I8tNqkitR3/jmRDUH2jgf0TulKgAZ5QyP9JjvLTlGrc8wTT9027Jl/1jAQcywpAebQ
 95PK7tlL+9qC2/4XvIhl8ZTyZgMg==
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="86346851"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T77HbFJ0metX9KTLqmAwbcmaMcRvFmn/b/YYwmrY++y5Y87PLTdylNC7StLXPz51zpzDn6iBip2cZoX3f4Cm2rD5beO4MXWxS8Wdrp6W+QTHeZ3+zmoBHKyDxTGHrno5rrC0shVpUzLVZpj0a+wQX7UWsQ+sDuOIUJvu1d3Hakl8zcwy5cF8gn1YnVwxRNC9s38wR7BsFQWiRXzZxy4ovnQkmYtDCjO651Y6mrmfWv6uoku/5S1j7v7Y+lGr6qFaPjeTpuO8CdBBXxKwbD6phYAZIgkC2o+EyYLoexOH6rU4Ezj7A/QVSbqISDPAt/vA1keeE4haycrLnXHOry/pug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2AzkgF4a+9AJ7YOzwxj2q0kZigtMfhoQ0TvOO2fbSU=;
 b=N60ejX7L0nKTGsgXaM5y0ZCPCxLPHQixI4PnV119MLAAlfGdW4aSlgXoTqyTMubGI5AXW0se7gc0tWpkxnckysoognsbOjIOoYHyyiN59uKQUYxGK09Ts1xlpQn3yq+/FOgqfr5Y24L8XY2yYJNnmldAD5Mw0tfdqPYlrbKXFZ91LKLxYnvuqoPSyVbbWxJaaTpapLqk184s1VW8HLpXlvBm8rElhAG16unbp1uVLFztnfhDlhdtqOZwjrfwplz3uML2tnfoGWsrFY4U+bZoV3ZK8QnOXBCkjoQdeymSdwv1X23InxycF7tfJWhCGWPkPinANRGhMc2O/zmsM//a2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2AzkgF4a+9AJ7YOzwxj2q0kZigtMfhoQ0TvOO2fbSU=;
 b=jSDaRCMJ9RCbNv9lN1AK+bUEVp5aGFUpdF3TqddPYvynSP4fgICjGgOic6yXdnGoNsql5+XHS4KP2eBBBU6kfuZptfwUuuCUrKnTyGp6aLwnGzkDjztpLtEfZHFt7YiHfUCA0cFq03dbGXCnU8SQjMotROFqLbWMOTWDen6HWR4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 2/8] p2m-pt: Avoid hard-coding Xen's PAT
Thread-Topic: [PATCH 2/8] p2m-pt: Avoid hard-coding Xen's PAT
Thread-Index: AQHZCSwIzli/2Ant/U6BsahXUdEmfK5gsTCA
Date: Tue, 6 Dec 2022 10:59:09 +0000
Message-ID: <cea0b80f-6fca-9dcd-8d04-2e7ce943118a@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <94c76a8be13a592ef98c80525b6c016cee583e73.1670300446.git.demi@invisiblethingslab.com>
In-Reply-To:
 <94c76a8be13a592ef98c80525b6c016cee583e73.1670300446.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6759:EE_
x-ms-office365-filtering-correlation-id: 708c9a2e-be80-471e-459a-08dad778e704
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xa7fWOKyycc9MKUzqyUapxtjrnypSih4dA4Lblrpy+MbBvOtBfh7AUYPoe68yvxTw8ISbeOqUD+T0fYvtPjEdAlmBnLOffX5EsDsNOhp+kftKkUaV6mukIcQTTdoOk5WDI8pORXnj2Owb6gXht9Tf4H+k47zhAsoW3vFsaRxPhvvt9jlT+1ZMmmswhQ6ejxMxGQxSoq32gjPvXyEbescVgHyois+AC5E3+/kMiQiN8uyQaYBYh+gfcW1TnFenr3XnjBXzhFCfmudiTo0PZxUjoJGsY8rUW1ZY6fXAirZsqhwgKmhhC4EPTwUw9MZGTv5mrawr49t7P4VnmDs/d9TqiNlOyDDgkgsSNLBeK7ci5DBLKa5A3eMgVUw08Sk0c9K1gG7fb/tBVsaWZmC/4gk3K88igo8lXT+y8oB406c2PNu6bAHZPn4zLD0aZeAkIoNHkiAcW5XA7g0IMSoiHF08vMORekDAoZRuRLG6RRLWJatTzU7Lux0MzLdsUzbTm/BLvsagLjM7wCaynXOYRlyJfTOp8GhGQ1bYLcmWuxp0uWA3fmet8J0lUVrapxKvv/+qg+d9bmXQjWk+C4I0m6KC3xAq5F05Njc4Nsd46R2Rh3Ou/YOUcFVg4MjnSoGvqLOxrBQt4Q2e65o0yHpfg2sa1JEW0+Yq+tJNXPgUxFWSqc3uY0wICnDZNejXLXvB0EEvAQogwsCvzPwbE/TZ6KZAzR1rBaQzKKRsRF14qpT89na1kZD5VO8JUHokKUUcPoKOFfmZ2wa1ZPxcHFYdMdGTw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(83380400001)(186003)(31696002)(86362001)(2616005)(38070700005)(38100700002)(122000001)(82960400001)(316002)(36756003)(110136005)(54906003)(2906002)(91956017)(76116006)(66476007)(66556008)(64756008)(41300700001)(66946007)(31686004)(66446008)(4326008)(8676002)(8936002)(5660300002)(53546011)(71200400001)(6506007)(26005)(6512007)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dW40bHV1dEd3QTc3VFUvRlliS28xYU1yYXBiL2E5SWlVL3J4RHpvOFIycHVh?=
 =?utf-8?B?RnpwK2hrUVJpOVBvUk9yWjZxd0s0Qk9pMTZvR0wwQjNpZlZGcTdSc3o5MXcx?=
 =?utf-8?B?YklzY0p1N0pySC8xNXNxUEowKzVSU1dPWnZjOVhCb3AzYkZRaEMvMkhFQnVW?=
 =?utf-8?B?N0dPVVA2T2wvNTJ0OWVOblZYT2JSc2xSQTZYQ3JLYVJkV0NuQ0RTNkNJY0R0?=
 =?utf-8?B?VkNUeDlKaTk1N3lVdURCK2grM3N2SnhQWC9EZTBoRG9BR2x5SHdLU1VEN2Jm?=
 =?utf-8?B?Vjlyajg0SmR4eTlzbkthMkpHVHJkQVJacTZRc2luZlh5TW9kU0VVZWZ0OVV3?=
 =?utf-8?B?U0d6ZzVETXNaOFl4ZVRJN2tXS2xWZS9mZjJMRHFGaWthbXNFVlRYeWNaQjlN?=
 =?utf-8?B?Nk05cy93V2RMaVQ4QmZTYWlndm5SL2I5ZEJiTEJORG5Hbk0wT0JBUXB1eUlz?=
 =?utf-8?B?R3JxUU9kNmhOMWtNL0g2bGR6cjFsSnY2L01uQVpJNklvbHk4QUJGQ1RWbzlK?=
 =?utf-8?B?YVR6aDcxYVFXYXVFQURzVDZ6emFBd2FtdFkzUnhyTnpud2NKNmhPaWh5V2py?=
 =?utf-8?B?U0FFU2lQN0JxQzNvekdDcmYwQytNN2tIU0NScGFRbXpUem5uNjJaMUR6aXlO?=
 =?utf-8?B?cnE0OEh6akJzaFBMMHpvUmZzcFgvU2pteVdsS0RkbjFJVW1ZK3RrOEN1aDB5?=
 =?utf-8?B?YjgrVnJ5RnFQUE0waGpTcEw4NGg2RCtwazduMEx2T2xQQjZYNHlSbGgwT3Y0?=
 =?utf-8?B?ckNkVkpqNlNNeEpzU1oyZXlEeW4zNndacFNrSnJjNHQ3aTZBQjJKUGIzM0JH?=
 =?utf-8?B?anlNQ0phcElEdnZsdE5QekR5Y2pmYTJDVDZDTlNWMldDVEk3dlhMcmlkL1hI?=
 =?utf-8?B?SWpDbHNManorODdjZ25aNDhSZ3JNUVRGY1RoUEdreUFPWG56eVNVU1ZLbjQy?=
 =?utf-8?B?VVZZZng5Yy9ibkRzM3R2R2VUMUVVbDJXZTFpWlBHSElNa0EwQTdXMDdCbUVx?=
 =?utf-8?B?UDlESjhXRzhReGZkczMwcUQ3RlhRUi9YRHFDSFdWZm1QOVFFbHdxSXo0NWV5?=
 =?utf-8?B?MEp1RUNvSG9lT1BMc3BoNzI1NzZ1Z3ZHUEpZUzR3NGF2SEhMeWJ1dE8xalY1?=
 =?utf-8?B?WlppVHFSbitydGRrZXdxbmtiYjNxMFJBWUVvaGlNR1ZwK3A5RStadlE5OVpX?=
 =?utf-8?B?VDN1cFlMNjllV3VCTjVrTU1TbTRGMW43UHd0U09pNXlETkkvRWRYb3VGMVAx?=
 =?utf-8?B?Y1VQemE3MTVhRlFHMm5KbEFYMWRoU1c0R05VaGpYVkdkK0gxNlJZTUgveGtx?=
 =?utf-8?B?cE9MY0VDdytZZVRmbTJaWjQ5UHdKNWx5ZzhscHM2Y1VXTUlxajJCVDZtQXV6?=
 =?utf-8?B?MFZMK2h4ZFJHcVhsSUFUa29MODZCT0RFbjJ1emh0MG5Fb2JPL1VZS09MOGIy?=
 =?utf-8?B?NWVWcGFoWGw5ci8zRDRKdzNDUjE1MzB1Z2E3UE9vMy9LakJSVnUzNlpEY0xL?=
 =?utf-8?B?K2FGSldNUnQ2bDV0eURPL0dpZkM1Mk9yOU5yby9Xc3VaUGJhOHkyZGxCYTlu?=
 =?utf-8?B?YitvWjN0QTVVUmJuUEh6RzMrZnNHaGhUUEtQWXNnVU9sM1ZkRnd3KzVKanFh?=
 =?utf-8?B?dHBidWdQQ2tNUHN1SjhpMm96NWNRSnNyejdhSlNOTDY1ekE1SENIemRLcTh3?=
 =?utf-8?B?VzZzRllVenJJTnJtd1E0YmtoRXVVdjdvNThVendjT0JhNEZTV1V5MkpOcUFJ?=
 =?utf-8?B?MFllcVEvcnUrUGRyR3RyZXdSbVMxMk1SelNzSzN3Uk5RVWVmcXNBMXh3ZnQr?=
 =?utf-8?B?b3FvbG5BVEhJd0RZUEVpQlMvYUFWZ3o2NXBnVzdDWXVlRjNKUWxkbWU4SFlu?=
 =?utf-8?B?QlROZk1wbWFraWVJdzZBMnBXcW1JRjlUNklRY0JxR2tDRmYxdGRPbjBzS1li?=
 =?utf-8?B?UDVZTHV6UXAveWRrbFJMUkc5OGV3eENmQ1ZxeVl0OGxXNHpNRWk2SHlqRWlU?=
 =?utf-8?B?ejJzWUhvaUg3Q2Rya0pGMGdNM3V0WnZ6Q1ZHc0YrR1hPWUc1VE0reWVibEU2?=
 =?utf-8?B?aHFzMmxGa2NtenNRRDI0cHhJRzNrRGtHVVRWVjcveGk4N2ovK0IxQW1BaHA1?=
 =?utf-8?Q?R/H1r0STMjB2eekvkxk3OUjR4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AD30B738082EA4EAC139A0DEFF412EF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?b3pSd21hdVdlK2NzUlVibllEOU1IL1pwdjBCN3VDcUxXS1FVaWNMdDNBSzhu?=
 =?utf-8?B?ZlZML3A3ZFpsd0VLNDhlKzlpaVp3Z0VLanRWcmZMMjRidTdmVGJHSGZBbUtk?=
 =?utf-8?B?RTdBNVhhYTRsS2dueG1JdkdsQVMyMHFnVU9MV0lDOFJGckkxNnE0VHFXT3ZS?=
 =?utf-8?B?Ym5jQXdVT095RFFodjhQVFdSajVMMzhsTk8zTDNNVEZDUUdEakNLMFZtTUZN?=
 =?utf-8?B?YlIrM242VlhvMG9Kck9FNXM4Ync4NlgyUFZpSjZXYnlhbmdiZGNuSzhHTmF0?=
 =?utf-8?B?ejhOalNwMVV4Rk9ZVS9jMUV4TFVjNEtwUFdKRWUyNFRNcjF5Ni9mUFZEdyt5?=
 =?utf-8?B?RFpKN2FMemtYYnduMXUzTE0xU2Q3ZTdyaEJvbGxqMTJLU05rZ20zK0ZrL0to?=
 =?utf-8?B?MnRjeExqQjYzOWkvd3JDQlNtbThycDgrNmVmWkpyNWlkcHovZHJ4bmh1S0ZB?=
 =?utf-8?B?Q2hyTjRZZk5KY0dVOElkM2k3cXdJZ0pSZmVacVpDYTgyMTVOekhNdFZnNEJW?=
 =?utf-8?B?cnJyU3JIRGtwY2dlUytRN04vSk5YZEtGUi9SNElORDBYQlR3YUx2TEQ3ODln?=
 =?utf-8?B?cVRpczVVMmRNYkxLdXdhV0pGRkNJRUhRdkVSa21ud2JOb1ZWNEt0Rmc3Skxy?=
 =?utf-8?B?S1VVeTZ5bkwwcGtra0EydG9XZHpnd25LNWczMzRzQm53R09lZlkweHdRRVZD?=
 =?utf-8?B?OEJkRnFRU1lleE5GYWVGd2dHVC92M3dZNm15dVBFVG5KQUp5SE9QTWtMWWJk?=
 =?utf-8?B?V2tpVGhHL0pJWVpDSlVEYjMwdXAyOW9jYm4zUjUvQ3M0MjRuY1F5VUh4Q1Bk?=
 =?utf-8?B?eGlWbDA4OHNNYTFPZnpOTkxjbUpKZTVWQjRZODFUMFdqcm9CUzliYkVzNFpX?=
 =?utf-8?B?OUVDZUxRSlNjTVRNRm9JdTNKemNCTGtpMmIxWVNib3NGOWRkVWJqRHVRZW1u?=
 =?utf-8?B?a25xbC9ablFyaUtKUDhpaHk2R1NOK2I5LzZTS2FXejlVMm90Y3VwQWo2QTdz?=
 =?utf-8?B?SEN1UjVDWi9xV0xsNjlCcEZLNjZWcXpnUUpQUXpOb29ONEQ5OW5BbFNYUGJ4?=
 =?utf-8?B?R1Bjck1yWXNJNUFQSVVEc2dkUG1VRlpRekdBV0N6RWdMeUZDeVI0TW0yNzRN?=
 =?utf-8?B?NXQ5VE90by9oM1RLZ2I1TWZ0RjhnK1hnZTg1SlNtY0ZrS3JKMWtNaDdCTEI5?=
 =?utf-8?B?TFRyZEFTY2dqOGM1STg4MVNUbzRhcWJlaTZGVUxvSjBEL2tUUUowTmRJcGFq?=
 =?utf-8?B?em44b3FvMVZLemVoNVd3Wk5namRpTmZSb2hWQkxVZjVzdHZmZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708c9a2e-be80-471e-459a-08dad778e704
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 10:59:09.7898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BY4T2crai0NAEhG++0DqP81EOtjuG/Com0D7qn2fAX+PSYs127pVkmUrMwxahQZIQH/ouuYIkfmQFKbIMIVRjM+7IHqrLsUDVVpeiAHIc+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6759

T24gMDYvMTIvMjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBUaGlzIG1h
a2VzIHRoZSBjb2RlIG11Y2ggZWFzaWVyIHRvIHVuZGVyc3RhbmQuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiAt
LS0NCj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyB8IDYgKysrLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21tL3AybS1wdC5jIGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jDQo+IGlu
ZGV4IGVhYmEyYjBmYjRlNjgzMGY1MmI3ZDExMmZiYTgxNzVkZmU2ZDI3NzAuLmNkMWFmMzNiNjc3
MmFiMTAxNmU4ZDRjMzI4NGE2YmM1ZDI4Mjg2OWQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS9wMm0tcHQuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMNCj4gQEAgLTk5
LDEzICs5OSwxMyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBwMm1fdHlwZV90b19mbGFncyhjb25z
dCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLA0KPiAgICAgICAgICByZXR1cm4gZmxhZ3MgfCBQMk1f
QkFTRV9GTEFHUyB8IF9QQUdFX1JXIHwgX1BBR0VfTlhfQklUOw0KPiAgICAgIGNhc2UgcDJtX21t
aW9fZGlyZWN0Og0KPiAgICAgICAgICBpZiAoICFyYW5nZXNldF9jb250YWluc19zaW5nbGV0b24o
bW1pb19yb19yYW5nZXMsIG1mbl94KG1mbikpICkNCj4gLSAgICAgICAgICAgIGZsYWdzIHw9IF9Q
QUdFX1JXOw0KPiArICAgICAgICAgICAgZmxhZ3MgfD0gX1BBR0VfUlcgfCBfUEFHRV9VQ007DQo+
ICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgew0KPiAtICAgICAgICAgICAgZmxhZ3MgfD0gX1BB
R0VfUFdUOw0KPiArICAgICAgICAgICAgZmxhZ3MgfD0gX1BBR0VfVUM7DQo+ICAgICAgICAgICAg
ICBBU1NFUlQoIWxldmVsKTsNCj4gICAgICAgICAgfQ0KPiAtICAgICAgICByZXR1cm4gZmxhZ3Mg
fCBQMk1fQkFTRV9GTEFHUyB8IF9QQUdFX1BDRDsNCj4gKyAgICAgICAgcmV0dXJuIGZsYWdzIHwg
UDJNX0JBU0VfRkxBR1M7DQoNCkkgYWdyZWUgdGhhdCB0aGlzIGlzIGEgY29ycmVjdCB0cmFuc2Zv
cm1hdGlvbiBvZiB0aGUgbG9naWMsIGJ1dCB0aGUNCmxvZ2ljIGNhbm5vdCBwb3NzaWJseSBiZSBj
b3JyZWN0IGluIHRoZSBmaXJzdCBwbGFjZS4NCg0KVGhlIHJlYWQtb25seS1uZXNzIG9mIHRoZSBN
TUlPIHJhbmdlIGhhcyBubyBsZWdpdGltYXRlIGJlYXJpbmcgb24gVUMgdnMNClVDLS7CoCBJIGhh
dmUgYSBmZWVsaW5nIHRoaXMgaXMgYW5vdGhlciBhdHRlbXB0IHRvIGNvbnRyb2wgbWl4ZWQNCmNh
Y2hlYWJpbGl0eSAtIHRoZSBIVk0gc2lkZSBjbGVhbnVwIGZyb20gWFNBLTQwMiBpcyBzdGlsbCB2
ZXJ5IG11Y2ggcGVuZGluZy4NCg0KSSdtIHRlbXB0ZWQgdG8gUi1ieSBhbmQgY29tbWl0IHRoZSBw
YXRjaCwgd2l0aCBhIG5vdGUgaW4gdGhlIGNvbW1pdA0KbWVzc2FnZSBzYXlpbmcgdGhhdCB0aGUg
dHJhbnNmb3JtYXRpb24gaXMgY29ycmVjdCBidXQgdGhhdCBpdCBoaWdobGlnaHRzDQp0aGF0IHRo
ZSBwcmUtZXhpc3RpbmcgbG9naWMgaXMgc3VzcGVjdC4NCg0KfkFuZHJldw0K

