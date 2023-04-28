Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C386F1838
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527312.819808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNPY-00062R-V7; Fri, 28 Apr 2023 12:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527312.819808; Fri, 28 Apr 2023 12:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNPY-0005zv-SH; Fri, 28 Apr 2023 12:41:16 +0000
Received: by outflank-mailman (input) for mailman id 527312;
 Fri, 28 Apr 2023 12:41:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psNPY-0005zp-2V
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:41:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b75082-e5c1-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 14:41:14 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 08:40:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7234.namprd03.prod.outlook.com (2603:10b6:806:2f6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Fri, 28 Apr
 2023 12:40:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 12:40:55 +0000
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
X-Inumbo-ID: f5b75082-e5c1-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682685674;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+/orVMwf9ZoiiQHEJa/4dgnnbEpOlYdCAmwHJb6sJ/A=;
  b=gCjMtA8xRfCwFcM4/yu66ulu87IXml8dCSOcGuuKUrxu5JTxDbSVxUBh
   ETMV54p2QbLorefID2jDi4qKxTzJO0wSX5wls8iGOK7nxAqWNT0KRtByd
   FhNTpf4Z91wNgt8g13djtK8UakxN0PawInZImOMnsEySoy3orIIqn3TTr
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 106546004
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A0HsSKoG+VSvTpdqBp9XYMS7cx5eBmLZZBIvgKrLsJaIsI4StFCzt
 garIBmFPvzbYWKjed11PNnlp0wPup/Wn983Sgs/rSg9QigR85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzSlNUPrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAoXTlO5rf+O+aq2U+VVu/w6DPesMZxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqA33APLnjB75Bs+flWnn6HmkEiEftNgF
 h0I4wEPp7Ep6xn+JjX6d1jiyJKehTYVX9dSGus28gbL1KPQ5wubAUAPSjlcZJots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsUg8t89Tl5oYpgXrnTNl5F7WupsboAjy2x
 CqFxBXSnJ0WhM8Pkq+9rVbOhmv1ooCTF1BloALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7cYVUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:495DDatuZs0Ylkq0eiZblpmf7skCEIAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MArhHO1OkO4s1NCZLXTbUQqTXftfBO7ZrwEIdBeOldK1uZ
 0QFpSWTeeAdmSS7vyKnjVQcexB/DDvysnB64bjJjVWPHlXgslbnnhE422gYylLrWd9dPwE/d
 anl6h6T23KQwVqUi33PAhNY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6f071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6p9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW32/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLTU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6ksoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPSHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwEzvn0ehT/Yd3R8LAd23Ag0YeMAYYDcBfzB2zGqvHQ48n2WabgKr
 KO0JE/OY6XEYKhI/cP4+TEYeggFZAvarxlhj8FYSP/nivqEPycigWJSoekGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHYZpa/ummcZ0/Q
X-Talos-CUID: 9a23:/XSxg2437jn/+XzRxdsszlQ0WfoPb0Xk1HrJL3aFMX9JdvqYVgrF
X-Talos-MUID: 9a23:4APMGQsAsG522qV8782nrz9+Cp83+aKULUEyrMQaouKlPzVrJGLI
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="106546004"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZYMGiBk0dgItz90vl1YTpbPQOJnRM5gauSyZNyrWU7OupgGftnpOvBVKY0YTSs7RylrPstSqoUeHnGOGL2jMsjRRLQWKOMXtTceTOrDN0hXU/VT5JrNznx8FSwPSl3aL+YqR09pNngr2J4E2NI5UCWheQIalTnLsfoeOfhC8ZzDG1IgFx4GVnwrsk5PS98JpIdhGdaQmkpSSYVgs/bcDKUzvzA9tnMIEtc88XMXWIJlA809kzn3Pj2FdDOcs4l1Tg9qKr7H6L+woEKlCueZOOzjPlKj36Gjz7k7dY4lnWJlVYYj1gNQEwP0d0aG7q3g43OXoSIGqY0bvRghhdD4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpKa27AMU53aPXOAAvM5i4G0m4kr25JUg9B4mnhTNiI=;
 b=T3Q1lrCK+BXBevCz97ZWtmpPryP14uSNVBHP32OGdcTQ5F9limyTDImIGTSUF+WgOfYG5KO6XhagYkIMG+kxyPVcxM8Fr2JlceekH8YfAixZyb29jIEyUSpOf3qDL/B1aXWxVP0XcYyYjLbTW1uKLb8Sl57W6DN2tAMHd3CPXYDh8DcC5jjE4IR0EnPX5aJINr+O/0O0m3ZMxaKcOpAlqKhDu/s4pAXbIqFNq1PXwnfzJJpTfQhPmKI9nguhfSXeSSPJv0syHQSKGR30H7vkpo/lru2fcmJYei0lC0deBh14CJGI8JE41JGslFjDQ9pOd1aeG8CafRipfY4paIwcjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpKa27AMU53aPXOAAvM5i4G0m4kr25JUg9B4mnhTNiI=;
 b=ZAgbotknmbb1Qr+h0fcTVqk7m64+Ch1xjQo0H+AdwGLEIZMaqPOokOoyjaOmNAQbjkHjjDUBnvo49GJgKqwbRNiNM2sCCh7jrM4s35Fpp4DyaQcuGZWK9c3r0gDeE0WhrZHHoS8EfkEaeCGw2MQKhAF7QSh0s7JsV2LldxZa920=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8b7b7fe0-f814-ba53-eca9-a9341665cc7f@citrix.com>
Date: Fri, 28 Apr 2023 13:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/7] tools: Make init-xenstore-domain use
 xc_domain_getinfolist()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.org>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-5-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f8ee26-d882-4ee3-5d07-08db47e5cefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1btQ8YaRWJXExHHuRnckIg17q5M5EXr45rJ3/kuFdVevVomKzzEZ8M7zDt2/1ncCYrylQ2hG/GWFQEz3yHePVj2qKx0exuQuuY3ARd1e9FNG/fNs7P8BoW5aGHcmpntbJVqMF6ftqf9BKBih+A/e4Ds7w+jnJlsd84YuD2Avng3KyevQqwkOU/g6aQLxLfUXAxl9I+3FGSPyCs7MFY7HJiMRnc+IaS0EZx0Ndtm0FsXsfB2kxYkfXF1rLh/xQytMTD2WS56hCkULRpVYM79eQIC4z4wvS8oez6VoZ6NVrm2dIAhdDeNpI2N+5YNuF66TZU1zBGBvPZ42sAr+mPuxJbfNqlvf52roTAEzYW7VdFu/VrQ06i97H36cynG8Xdyvk/skG2HmJj7grHHwlguKmXrDCxmyPP0GZ+luwRwHJn+zenqAzRo1sVKG2kl843+/7TVReX8vZsFc6SLlRTlH9oiGXk+B3jgAaLx/aflAN+Zq+RGcpC6Xsxdwk5bbQ2Ru/1ghPU8LFUNaMktPFyvX875w7R9UOGe/nYHpGWUUNd83WsqOFef+yXd/o3dCkI3J/PamELoqiLobn9bHTmd5WAQkROeFYph6AKh9/pwBTu0CllhwU8wSUVlnCcGfXaH6R8uWWxMl4QlCerx+MnzP+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(31686004)(86362001)(186003)(6506007)(26005)(6512007)(38100700002)(5660300002)(53546011)(2616005)(31696002)(6486002)(6666004)(478600001)(36756003)(54906003)(110136005)(41300700001)(4744005)(8676002)(8936002)(2906002)(82960400001)(316002)(66556008)(66476007)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzRJQzBLZEdnSXowQjlVSjA2blhLOEtVVWQ4NnZKY0tEbnZTS1ROMjN3WVYz?=
 =?utf-8?B?VTNPVHFkd0hHUlg5TmRNUlluOEZualFBM0NDZzB2K0FiVS85WHdIZVB6QzJv?=
 =?utf-8?B?TStWUWFxRVRtK1lqYzJHMGJOSUU0Vm93d2pVY2trTzA2NktUVjRCYk9uais0?=
 =?utf-8?B?TkZ6Z2VYWEYyYkVpL3VHWnVURXhLWUs0V0lNMGIzTFI2Z1BHK3RIcUs1YW1j?=
 =?utf-8?B?WExVQTEzc1Q1VlEzcm40ZHBHUDIvb2JNcDZJcHlLSmFsZ0FVMFlMYWs2M3U1?=
 =?utf-8?B?UzdGcGcxcXVkQWRCMDJ1aCtXYi9IbVAxdlRVNENPSWVKdWU5Q0k3UktMSHNM?=
 =?utf-8?B?RWJkQkNpd09mTWs5RHVVb241OUVyMjVZQ3VjYzFIdnFaV2hseHlLb0VERk1Z?=
 =?utf-8?B?TVpkRWN6M0pKZmpzL3ROMTQ2T0tjbUFGSlBvL0FncUt1ZGZDRnRwU0w1VE4y?=
 =?utf-8?B?bFd0Q3BOUXdsZ2FrbDF0a0FWa2ZVeldYNUFXUkNkUUVCM1JqWjhQQkpWWUFk?=
 =?utf-8?B?c2NKcmpCdlVPRW9jdnZiM2V0dUdvTEZSR1ZLMnF6cHh4NGh2M0FOUlVzZUZG?=
 =?utf-8?B?SEFGNjFQdWFQQnZHZktTUW9kdW9OQUtnZ1ZqWktEWGs5aTNQbVUwcktXODh2?=
 =?utf-8?B?UVRqYm5YNUhQQTRuQnJJemFSRUJrS1A3L2t3MDBDeGpwVGRGVGV1THpGQW5k?=
 =?utf-8?B?ZWN3M3VBd1ZlY1doSTNzNnozK3p3UW5qWGYxTGE2UVdBMnJWNWNqMFBlZWd1?=
 =?utf-8?B?ZHVnMUVSTHY0Y0k4ZklqYmhEVVZZZkJlRnFzNlIzaTdpeGxlaXFFODkxeG93?=
 =?utf-8?B?TWF6QVNLbGRWNHZ2c3VaWVp5bHBOOHpsOGRLZXkyTXRYQnNmQXAyNVZjcW1Y?=
 =?utf-8?B?MWlIS090QmhHZWx2VEZWakpCUmhQejFSdVY5MURNVFpYa3VxeS9BdjlTQSsw?=
 =?utf-8?B?Mm5FTENlT0hpSHNTQ1BRUWZOelR2emw3R2dTSEZhZ1k1bVpVdUFaOWtGU1pF?=
 =?utf-8?B?cTFxcm0rOGM5K3NEaElRK0pKYkVtOE5MVGtVaU4rQTVvWVFLa3JmUTRLVnd2?=
 =?utf-8?B?YXFzMGdUellvdk1uWDVzR3NpckZrWU1TdmVydjUvMEpHK3hMWkRmREpOVitt?=
 =?utf-8?B?bXhEMFNEZW1aempJSXFFVFk4UVY0UzIzaGZBRDBEVElTTXJmNm9seW5CQnBH?=
 =?utf-8?B?QVhkMzRBdFV5RHJLNVVOVmxubi9zWDlVWGJGeTlybWtrYlZkVncrK05OZWY4?=
 =?utf-8?B?NG5ZT0hQZEplMWRqR3V3eTN1enIxYjFqWDFlUFp3ZFQ3OGtlbVlKaUFRYjVW?=
 =?utf-8?B?WWd4cW50aGY2MmNudmIzWlMwT3BpQ2gzOHd5Ymc2TEdKN0VubFk5QTdWd1Jw?=
 =?utf-8?B?SDB4V20vZVdxRU5uMG1uUnFJTnVhSWNIREtDb2JLYm96MGNaQzl6Q1YzRGlQ?=
 =?utf-8?B?bjlXYWFseVVFTFRWOWxWTjFQNDJ6ZUhXQVNyUEJDQ3NMUVhUU2l1N3NFNjFs?=
 =?utf-8?B?bmhBSFAyOW40Nm9NUWVFZXQybTg0bkdpdVhzais4MWJjNE1tK0daL0grbGVY?=
 =?utf-8?B?Rm80YUw5NHF2TzhpdEoxN2R5azAzN0VodERSTjExU1VlTFJSVUFyWjR5YStz?=
 =?utf-8?B?VG5FR0hkd2VncEEvV1owbG10QW03ZVZaZHNUT21GVGVBMmVXdjNtdWNCK1NY?=
 =?utf-8?B?WHA5MzdINUxhYStqcm04eDhmT2pWdWpab2c2T2k3RXBIdnpvT1duaTIwZTVG?=
 =?utf-8?B?ZXFzT2ZWeHhZd3NUeHV5cFdrbGQ2eiswaVBOZFBXcWNuMXZJL1JyTW9ta1J5?=
 =?utf-8?B?U2dVTTVQNnNGNUs2SXRSTkZvUkZURXRLRUN5a3BBUGMrdzNiZDdDSWVsNnRM?=
 =?utf-8?B?dkk2ZVg4R3NPSHV2TDhmRkpjM0ZuSkpDK2M4V21rQWk0cW5GRzJpUk5RcnRq?=
 =?utf-8?B?T0Fwd3d2d2xieEhqcUVFWTJPbHIzYjlhWW9Pdkc4MkJNV0w1OUdVUmxFcEVa?=
 =?utf-8?B?UDY5R3YvMEpFV3NILzgyY3lJbWVLVG1GWE9JRG5VQldzV3JicmV0bkRTZFV2?=
 =?utf-8?B?UUFOelpWeG5Nd2toVGZoZUM3bkhFRVhLUlJSWW02c3hxZ2FFUDdzYWtJRkph?=
 =?utf-8?B?OFFLSHdUbk8vWGN5OW0wdDB5SzBXYzhFakJmUnEvMGErWVN0bHpvSlJTUXFE?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ww0Bk9ozffMvWwGlz4o8ryBPLyUWfqXtRxqcXJtMfke6RbJ18xAysUH4wG9yBHdoeo7qJ5PRJfp2ibjdCDfrRGbHInVp/baJ9r6t4n9NMNH2/M9mSddYNkwx6fc0ZmozkZUsR8XzduZ+LqcZx+gapw4jTEbH7huQkFdJYoB3/ZTf/qR/mcnqxcW79Vls/U/1S/hA6sGXPy0bvfE8YNl3CT8KCCxn40Wqcpfd9hGShHR6VB3fu4gcDfwraitkmsFMWCUhGUmxpPnpXOYS3tLifR6at7pUZC8lwOzoKhr/gyZQ/r5OuSu48DgTovyQYhnS6u9B5QAENt2o+otYpF9dkdJswnV+KFW5dQq3r0DDn/VS8S//m/KE5/piw7fAdFnzAX0UnNSQuNdi9scMe6tJCjptje+8xMNNGo/yhycZQyRKtBPN9B89y2rqklcrQZpRAY3TJGGF8KEJJFemg0400diM0XFI1cRMlEfX+re2Fv84ups0ziKQkCotSmViWud9075JmrMKeVTjWCwL7NTIVQB4ln3SMNt7GQIz1B6pl4+9U/7p6Z/TlAK4LvZx0fMZzmIOCZ9CC4lZtp42HvM1HWBz7UftpCnaPVfE7WaXffYgMdnlN89BLPdut2u/1IrDZX4VYQyyeHTOGlytoYngDVZtEDfuR7YmN+HVhY9KXrG6hCMPrg6oEb0O/uVKatFuqAD5WnZrcR0ouuxuMraD0AarQX+iiRlUY9k3N9zU1G4aZNF0cqrrrIZWDBi5EjNTYKUZ3KCJo24pzCD8QjA2XDtGghU8ooiaICvmml/Z2+pCzoerztLyjQE99ZnOoi9d2cK0Xmj9HUMRGJEE/Zxb8KWcKdRVuy0iQ5hvWAyZ0c8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f8ee26-d882-4ee3-5d07-08db47e5cefe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 12:40:55.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +u/9msdq+jOctVyu8HoBnTefhl6pYu7yEj2rC0LpRjhdGSY/AgKseS+iI2a19wM8m/FhtAsMqaW7CpxEkX6rX98kYj1wkUJNCnaF/S3e+jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7234

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> index 0950ba7dc5..e210a2677e 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -322,16 +323,19 @@ err:
>  
>  static int check_domain(xc_interface *xch)
>  {
> -    xc_dominfo_t info;
> +    xc_domaininfo_t info[8];

I'm recommend having a comment here, saying something like /* Commonly
dom0 is the only domain, but buffer a little for efficiency. */

Because this is also the justification for why we don't need to ask for
32k domains at once to find XEN_DOMINF_xs_domain in a race-free way.

Can be fixed on commit if you're happy with the adjustment.

~Andrew

