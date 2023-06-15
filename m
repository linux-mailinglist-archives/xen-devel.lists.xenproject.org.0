Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9F7315A2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 12:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549538.858125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kQe-00047F-7i; Thu, 15 Jun 2023 10:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549538.858125; Thu, 15 Jun 2023 10:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kQe-00043u-4l; Thu, 15 Jun 2023 10:42:12 +0000
Received: by outflank-mailman (input) for mailman id 549538;
 Thu, 15 Jun 2023 10:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnOU=CD=citrix.com=prvs=523455384=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9kQc-00043T-DP
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 10:42:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43c738a6-0b69-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 12:42:04 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jun 2023 06:42:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6917.namprd03.prod.outlook.com (2603:10b6:510:12c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 10:42:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 10:42:00 +0000
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
X-Inumbo-ID: 43c738a6-0b69-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686825724;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ebPZQpXDPr+kQ+zkBy7tFVzhh325XmOUawACjb/KqdU=;
  b=Js7MBE2NILrLARWyWK86Tl2xskJ4cVp+6Me/WPX/ncY+IR+7q3FUELNR
   KHssK3kLJeBWYlEYI1aqddCKLGlqkhqZS72CGK4z+choyiLxbeUxAsLeF
   aMdkxGPCNTYFxOcbN47Er5L3R/yCSXzSdYWnp8N4SPZsIhoMcVBd+a4lX
   U=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 112903236
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X01h5aycDzTLs1rj2Id6t+caxyrEfRIJ4+MujC+fZmUNrF6WrkUFm
 mccD2HSaPzeYzfyKtt0PYnko0kPscCHydI1TQpu/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWZK9
 98qdWoAVCKKl92z5O/8buZNmst2eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdhDTObiraACbFu73mhILx4HaV+ChMaiiFCCHM5eG
 mcP9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptLk+Yc6i0uWSs45SfHqyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:0HIGl622MCTh0m8Nj+wxRQqjBa9xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtj4fZquz+8T3WB3B8beYOCGghrTEGgG1+ffKlLbak7DH4JmpM
 Jdmu1FeabN5DtB/LjHCWuDc+rIqePvmM7IuQ6d9QYUcegDUdAe0+4TMHf+LqQZfnghOXN0Lu
 v/2iIRzADQBUj/I/7LTkXsGIP41q/2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWtv1t6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwjPCz5E0smN
 zspQ5lG8ho8Xvecky8vBOo8Qj91zQF7WPk1Daj8DbeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4vrHzJltXv3vxhUBnvf8YjnRZX4dbQLhNrbYH9EcQNJsbBir15K0uDe
 ErJsDB4/R9d0+cchnizyJS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d/8AblmdozuNLd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeE6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSSAtAzWu4NjDqVCy/jBrOKBC1zGdLluqbrvnxwnOLyZZx
 7pU6gmRMMKLgPVaPJ0NkPFKt9vwEIlIb4oU+YAKiOzS/3wW/3XX8zgAYDuzenWYH8Zc1K6JE
 c/dx7OA+gFxnyXexbD8W3ssjXWCwPCwa4=
X-Talos-CUID: 9a23:EY1FNWzt0wui7LjqSPUCBgUTHsIGQCCHwU3iKl+HDEI0D5maaEOfrfY=
X-Talos-MUID: 9a23:QDXubwr4k9vuHjBX5yIezylmb+Br8piqMWUyipcYh46YNB1bIDjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,244,1681185600"; 
   d="scan'208";a="112903236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTk82AUpeUf6R0/FQ8u/FyRmmkX+oUjLrtG6Kliqhru55jnFykFH0nuuzG23ze4sywtCpFQL1udMFx0Ajw4MLfshnAwyM/Bm2n3Wxu/XUB+kJRmYFvBtXmUX0kN9hNwx9emScax2Z/uzK7pSF5rb60qHxq483o6pzdjDcbtuL5hPDOeg8M64bY9RiSylHwxNZ9qQPluv7wqGRu1pOn/+t+FKaBhUFZUhAyVCN8cUlfKK8A2zuxA4+Rtc2VWYWGVOeEGSSf5mhSH1z1yWG36DLFcXsVAdq+jmhI/VuBfWYzfNr3jPbH0lN2geECr/6CiTyF1c58bJUuCwNrtIjNC6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIqwDCdnzsmQRsv19InjPQYPxpJ4eIavPCVl68cnLxE=;
 b=mazNV9Aqc/ztItnoVob+siogGhlCuuiKdTpZGOvn7qFfBp6lqi0sSHLHtI1vq3wXKsCQKBYcGKQLzVJZj+xRVG3jqJX87Q/tIUKFxACSO9+uVESmD9ukedin25QNwQK6lskpZPhMx92Q0KgADoUOSn2nhBLkJLDxKL1sVUOrdDDbcpFEN7xeaGTzjuX26AWB34nSuch8bjb8ozhUHO56hdofzsbRCcDLv82Ag3KXsfTvaGi7UK6XXZdyQesD1L6B5H4S4hlohcg/hEM/gc8clIyE0+bC1zNhmNyofhUrbudL+5FISuLCVHkDrHPtywSWPcE8NqeETmKCUlC0/8Cyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIqwDCdnzsmQRsv19InjPQYPxpJ4eIavPCVl68cnLxE=;
 b=AoiCeyTuQWJokXswdg2m4Aw1HX9vyZUHQtrQ7M6LvTyD2grD6u3OATkXio1rA39sjPivhBm7ftFcg5wHPXHn0aDyNDioxtO8if/W2jd7QgNIjh8fi/arffHuCaVhDTWxUavJj9GQFzrX8UDxaNjp7zdRGiDaR2KNpszgbYV8KPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8a44c577-07e4-fbc4-d402-efa581042079@citrix.com>
Date: Thu, 15 Jun 2023 11:41:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
 <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
 <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
 <cf30658c-daa9-7e4a-11e2-c56e4513fd8a@suse.com>
In-Reply-To: <cf30658c-daa9-7e4a-11e2-c56e4513fd8a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0366.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 40feb35f-492a-42b5-296e-08db6d8d25e5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tKJdOIiTixdTyctJg02qFKNpfL88m+Zu8x+JpVMeEz6/LGFONH3iusGz49kJ9Dd5ZdheakG5PQOu35rtgerbMV+jRkDK9FVIw70UG9SUHxtKYZg0mv3PHD+Zc0JZMKGip8UgWudy/g6PqzfBukNySGnmmkE9LOEBIqQg+hkygdPbHUKsl683V6szCJxTDuNjCyREKO30oi/ph3DRG2QQlWvC1OIUdSQnHca24zG+iJN2/1IFtDudd1VZrsjF6zHAtnDn5PZorYNf9MIKCik2f7pZFt71s/pK2scXvf7uhkGX9n0wouL6NuGSndY6uqNF62hbSoYjlNpsIC78a+3yqDBCqlBi5fawSUohRMwAcRH5EpnH0T65tIiHccAbM4MNSFTaZzUXQDbjSmzrX25fpu9XJbRVpgzAaT9mNCFpYKkpQMI7y0bxcoNnB+VfGI+/tSWNthKbEiUXnl/0OuNi02wCQqiRsVZdL3uIql5tCxYhbxXr8i6fIeQJLT7xjvt/IZFtn3Sxagk4WZdeOIMJhxkuz5shmmCcWpNuPM8O4R3DeOKNEOuNLYUQKaLbN9baaL34okiVCZCYfJwsdlnSdND5/ybawux0ziiVOYcW1k06kayzhOOtW+DQ1AwHieWMO8RXDXdgekFcEJAPkAEXsQ7uEtQhDQnGFiTOybSf/JLfTYuSc456kmV+dseLETmantEz2b2TNRhdIFlKtXhhrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(4326008)(6916009)(66556008)(6666004)(66946007)(316002)(66476007)(6486002)(36756003)(8676002)(5660300002)(31686004)(8936002)(41300700001)(478600001)(54906003)(31696002)(53546011)(86362001)(186003)(2906002)(38100700002)(82960400001)(83380400001)(6512007)(26005)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGlDWDdDOGlhQm9jUnhSMVQ4R3puSHNXQ2VncFJ3dEpzTjlRdkVwM2lYeUt6?=
 =?utf-8?B?YUxMNXo3cTQvd2ErdDFBRWdBNEpmQUw3WVJYN2N4L1lib2VNSWVZUG5kYWhR?=
 =?utf-8?B?Wk1mejVHanRvUmFETy9mMVFORXM3dG5OcjRDTzBjcmRkTHQ1WFZhOVFKVEJK?=
 =?utf-8?B?SnNWY0o2bVZhYTR1azJpQi9sN053emhBYzF1RStFTkFmZ1c2Q2hGWTZlQWE1?=
 =?utf-8?B?NXpGWXNvVWdYbytkV2pkRURXbjQvaHEwOTA4UHFpUW9VcDJmYWNyS0ZqeHZH?=
 =?utf-8?B?SzZqc3lLTmRhdFZLdTNCbEE0dTE0U0o5WGFFaVlJVGVZRk13cWtaSCtYSlJ1?=
 =?utf-8?B?YnEyV2wva0dmRDY1K29HQmRZSjh1R0lxR3VhaVpSTzlxdElzM2lWb01BQmN1?=
 =?utf-8?B?aUd1dVVZdFVoMGc4WVlFVjlZamZrM290bHFBUEo0aENrMzNwYXQrTWtJSDhh?=
 =?utf-8?B?NEJ6STh4YTE5TFFYZmJKMlFXdmVGSXorL1F3UjNVT2trU0RSYXBCVk15bk40?=
 =?utf-8?B?S1hNMVdER1kxVGFDVVI2cFc5QkJad1dCYkxxb2pranNiNFZKa1Fodk1xVElX?=
 =?utf-8?B?aUg2SGJ5UmF4L2ZVaGpzdlpOcm9SSFFQTUJrZDlNZXc0amFhWUhyUGc3TG85?=
 =?utf-8?B?YUVZdHQ4d0JLa2o3YmFvUTJqV0V1WEpqdmNkNDhxb2F3TTIzOERsTndDbndn?=
 =?utf-8?B?L0h4ZGxTTnk5UXpjU3pPZ3dXektLWWJuZ2dab1FjSDViZTNOcmd5TXRiUDNh?=
 =?utf-8?B?QmUrbUd6UW1SRGFNdXFTYTdzNk5XaU1wWDBrQ2lXcENOY2FPMmRHY3NsVFdK?=
 =?utf-8?B?cDVZalBkTFBNMnF0cmFBZDVDYVRiKzBwcjAzQllHa0NualpBTUx6T01GY3Uy?=
 =?utf-8?B?Vm9GMjExL0I1QWttc1VHY0thUmpFeS9hRzJ4bllueGsrblhYV0RUWXplVitW?=
 =?utf-8?B?NUhoWDlMNk9MaDA5VDVnc3ZvWVl6TkI2RmdpaytHNVJPUzJXeXYyK2x5QW5h?=
 =?utf-8?B?NFVxcHoybER6Q0ViNStFZmpTR04rdy9nOGc1MFQ3QnBreFR2RTFYVUZJV2lk?=
 =?utf-8?B?N29saGVUSzlaMDlNVVVEaHpaMVNDVTlEU0dHZjBHbEI2c1BBdE9ucmhTaVY3?=
 =?utf-8?B?QS9lWURLSnVHcGZ2Rko0V25JSUp5eTM5STV1cnpTalNZRzZXanlQK0lYajBp?=
 =?utf-8?B?Ni9JN2hkekVUQ2kwNlNQN09JZnpQaHo3Q1AzcjVxb01zaHZ1YktMcktCbjJO?=
 =?utf-8?B?ZGl0cmYzN1pIZUl2eHIrcm0vbGlRWFZLVWtkRkZ3QzI0VTdtRkQ4MWtGSVRw?=
 =?utf-8?B?cTAwc29hc2E0NjhMemcweHJ4a3crQ09RSmNOSVMxZnlubnQ3YlFIUDdONGxI?=
 =?utf-8?B?RXNNcHc3a3lzaGVoSlpGR1VMa2dqTVNxeHovME93THY4cTNwdTByN1dmeDlB?=
 =?utf-8?B?bjZ5SFBvbUVINnhycnY2b2o4ZkFzUHVqc1QvSENzUmJVS0NJa0dUdnBjeUs0?=
 =?utf-8?B?UnJnWFpLb1R3cm5VSUsyMFJXMlh6dXZnclV5cVJCU01SbXBzaXo2a0g5NnA5?=
 =?utf-8?B?eFNQNDJpczZOMExldnFkZCt0cjY2b25CYnlaQ0M0QU0vMHlUenlCNVpUS2Jl?=
 =?utf-8?B?MnVWbzdVa2xNaGgwcUNIeHpsRHNEVTF6TzJZYWhZVkRXd1pvU0tXZEQ2d0Z2?=
 =?utf-8?B?Skw1bjgwVW15RDBEZlpGZUxTcElTWVRNdUhSNnh1Vk5ZKy8vOVZVSkFrTDI5?=
 =?utf-8?B?dmNZZmFlNVFNaG9qMjVPb1dJbGN5VjZTUmtNa1lwc3pXTHhuYkw2RVJMM1dU?=
 =?utf-8?B?QkNNNGh0TkdndHdtM2tQWFJqZzl2cEdHaTRQN2xpLzdWaXNlZHdJV2U4bkRG?=
 =?utf-8?B?dEMxR0daRmRYbDR4b3ZFNGMzaDNpWjhDU2RrYVpvZkxORXhmdU1LazVOdVBR?=
 =?utf-8?B?ZnFnQ0xBL05jcFdLaThGY1FUQjBVUVBUb2EweFNkUVZzU05pWU9Cc2ZjMVA1?=
 =?utf-8?B?NzJTNFA5VEFrZFczaU44bHVFU0xudkR4VW5iOUNOeTdkMTdESWVEM3VoQ0t3?=
 =?utf-8?B?STlUM2VxMWFTblovM3N6OFBKYmZ4enVWcWdxVDkrTHRodmxwOEFuYlU3MUY2?=
 =?utf-8?B?b2N4ZHlZOFJMZkZNOGRaTXM2eFUwNFZVTFZXTHZzOEc4UG9IY2RPRFVUV0d5?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ok4/+XK2ikBbfUyeCAASTRXtwlMW9Py/Zb7bwAJP9baGNMIRDaHE431roG+OrMYCwWEXrN2h6dyXO6iI1f8kmXnErlEC2h277x/hpaaEaqCAbvyF2vtz5EOWLnlfXDFo0ASXBNcA19dQBeRD0xOJ3CNtb2XLOfJdz3reVRGpHUWkC702ndQzhJJbzKx/I7yTBTFtbkbj7WXBdYBIoGav0D+1u5umqRCB2dHBAN9cWxvmvj6OgmE6PFI7r73M3a6kFH87zk+VbRU56kBx1a16gftlJ64qMx/JNlaiCc0V9wQozpgDCXyCt6q3XgSsuzUIMHBIek1G4l+OHGdd8sJgQ1mHU8cEAFrdCE1NaMrxV8lAnFg9WsTkUaVMN9wZgGqpg5QnsC4G6i5YKEpr9Z7qJaCS5cdMRiXVLbBfdUqbEwnLSqCclH0fXakNMlKjQ0kOOXVJEHxOm/o4CBjV8f1G75bNyxqzetXTwNOq65SzDMg8f6k1J/t0QQ+zAfvFuEd/pUL2YleUBCNTGnS4PdXsys7f6VkPzwQH5pCafbhYnmMImyixr+p0mR29b8SktejIx8wGi3S+KS7EfusjNvZ/wHed0rihgagkn62sISm3Nxbi5ZDMAO6mmpreaTFGsAVcU1E8Re7FpHBDw+JtUZLZX8InAV5vpmpGvpLr+w13utDZrzmjHw+x4/Bpp/UVutru+lfhN0mHFBog2AbVOGLD87t6HTubxWhV8kTTjcaxl/NFXcKr9OgLN46WJQleUtQaeb5cWAg1vf7ss+Fk5pFk+trtpNYi+LjA4uT4Vzg8eQ33473j1TGKwxI/JBk2+8YbbheBSXmSpSH/OrJOBsOaGQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40feb35f-492a-42b5-296e-08db6d8d25e5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 10:41:59.9466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPQTMLTMhprQT0ql8g+goVkwuT68uH6GScmJMnP17vCJnIsnZ1F9yGq1RBIDAS+LLupxCM+5cSvRDYQELPSaKsDPqqh4Vvpex6eOCM93uMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6917

On 15/06/2023 9:30 am, Jan Beulich wrote:
> On 14.06.2023 20:12, Andrew Cooper wrote:
>> On 13/06/2023 10:59 am, Jan Beulich wrote:
>>> On 12.06.2023 18:13, Andrew Cooper wrote:
>>>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>>>> predictors when empty.  From a practical point of view, this mean "Retpoline
>>>> not safe".
>>>>
>>>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>>>> statement that IBRS is implemented in hardware (as opposed to the form
>>>> retrofitted to existing CPUs in microcode).
>>>>
>>>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>>>> property that predictions are tagged with the mode in which they were learnt.
>>>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>>>> alternative predictors but restricted to the current prediction mode".  As
>>>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>>>
>>>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>>>
>>>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>>>> linked, absolutely nothing good can come of letting the guest see RRSBA
>>>> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
>>>> this dependency to simplify the max derivation logic.
>>>>
>>>> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
>>>> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
>>>> "somewhere you might run, Retpoline isn't safe".
>>>>
>>>> The default policies are more complicated.  A guest shouldn't see both bits,
>>>> but it needs to see one if the current host suffers from any form of RSBA, and
>>>> which bit it needs to see depends on whether eIBRS is visible or not.
>>>> Therefore, the calculation must be performed after sanitise_featureset().
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>>
>>>> v3:
>>>>  * Minor commit message adjustment.
>>>>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.
>>> With this dropped, with the title not saying "max/default", and with
>>> the description also not mentioning "live" policies at all, I don't
>>> think this patch is self-consistent (meaning in particular: leaving
>>> aside the fact that there's no way right now to requests e.g. both
>>> RSBA and RRSBA for a guest; aiui it is possible for Dom0).
>>>
>>> As you may imagine I'm also curious why you decided to drop this.
>> Because when I tried doing levelling in Xapi, I remembered why I did it
>> the way I did in v1, and why the v2 way was wrong.
>>
>> Xen cannot safely edit what the toolstack provides, so must not. 
> And this is the part I don't understand: Why can't we correct the
> (EIBRS,RSBA,RRSBA) tuple to a combination that is "legal"? At least
> as long as ...
>
>> Instead, failing the set_policy() call is an option, and is what we want
>> to do longterm,
> ... we aren't there.
>
>> but also happens to be wrong too in this case. An admin
>> may know that a VM isn't using retpoline, and may need to migrate it
>> anyway for a number of reasons, so any safety checks need to be in the
>> toolstack, and need to be overrideable with something like --force.
> Possibly leading to an inconsistent policy exposed to a guest? I
> guess this may be the only option when we can't really resolve an
> ambiguity, but that isn't the case here, is it?

Wrong.  Xen does not have any knowledge of other hosts the VM might
migrate to.

So while Xen can spot problem combinations *on this host*, which way to
correct the problem combination depends on where the VM might migrate to.

Xen cannot safely correct a problem combination even if you don't wish
to allow the admin the ability to override the safety check.

>
>> I don't really associate "derive policies" with anything other than the
>> system policies.  Domain construction isn't any kind of derivation -
>> it's simply doing what the toolstack asks.
> Hmm, I see. To me, since we do certain adjustments, "derive" still
> fits there as well. But I'm not going to insist on a subject
> adjustment then, given that imo both ways of looking at things make
> some sense.

It's a problem that Xen ever made adjustments behind the toolstack's
back, and this decade of technical debt has been extremely difficult to
address.  I guess I still view it in terms of the end properties, not
the intermediate mess.

~Andrew


