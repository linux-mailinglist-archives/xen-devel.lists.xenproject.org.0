Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12896A54C2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 09:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503129.775287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvg3-0001Nx-1Z; Tue, 28 Feb 2023 08:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503129.775287; Tue, 28 Feb 2023 08:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvg2-0001Lf-TX; Tue, 28 Feb 2023 08:49:38 +0000
Received: by outflank-mailman (input) for mailman id 503129;
 Tue, 28 Feb 2023 08:49:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzr1=6Y=citrix.com=prvs=4168607d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWvg1-0001LX-Bw
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:49:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d22c0628-b744-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 09:49:35 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Feb 2023 03:49:24 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5485.namprd03.prod.outlook.com (2603:10b6:a03:28a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 08:49:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Tue, 28 Feb 2023
 08:49:22 +0000
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
X-Inumbo-ID: d22c0628-b744-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677574175;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A6UROjBR2d9qS/fSSn8vkPUByq9vxpu2ZFlMxm4T3aw=;
  b=A/zKOV456CeIso/JrvKiSPM0qKGeh1G5m8QxowwuEqSboXG4RzkGn2R8
   NxPWmoavtaCFjGxyOqsBvy6dPoBHvg+n+MnkI8EcKhh+O6RM6hpn3UoKM
   MyEhtX0Ykoly5wg6Xms2UYMPwKVYZkA3sZIlqEs7ExdsA0nVrtPmpGorX
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 101234488
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iip4taps0YX8Mz5+UQDuc8pEbfBeBmIkZBIvgKrLsJaIsI4StFCzt
 garIBmEbPiOYTb1f4hxOY2//EwPvMCHmtJlHFNo+S5gEiJEo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weEzSlNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACE8NB+ylfKz+bO+bftH3ehgNcLAAIxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqcw2wHPljx75Bs+bgfljMC3tBeHdOluL
 kAm1AgKv6os3Rn+JjX6d1jiyJKehTYeXNcWEew8wAaXw6HQ7kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaMy8PLHREYjQYVwwb+NryiIYphxnLQ5BoF6vdszHuMTT5w
 jTPpi5ugbwW1JcPz//iowCBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHXlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:CvXpQ6nMkozb8KgXe9PeAiIommfpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,221,1673931600"; 
   d="scan'208";a="101234488"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSpeb6g+SXwcrBqBkWpjaem0gkpik49KU45eqYjiaPpXDPsC40Hgd/1CLoAYm/ej6amjuTc71O8847EcPpRHHoQHrbs8MRxhgxBQTNfXdcQ2VDWKJE3UXqD4Yxl/tKSF7EGxc5LCFaW/Kx6+O3irbhAen67sjSviX7AGMTogDMbuI9LvDdM8Pn6kkuzmbiLyPfA9foKt9vUeSYujlYE4B6YgEeqJ0MrQdOZuKVvR+Ed4e89L2xXV47aWzaS/1Y51RJrkgonmWEujOGJ36TdEidr5Qnb5Beh94qZLDIbJdAKzI5Z1OCFfJDUwh+kHSFmkerk4nx9iiSLCWwSQBmLsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6UROjBR2d9qS/fSSn8vkPUByq9vxpu2ZFlMxm4T3aw=;
 b=VEWRcP7h1yh66TN8iP/I85ucmYJZ4VAVru7QDBqZnSw66h8W9rqY3J/nqJwm6wDg9iAGBu6e1O7gwj1HlEd1V06osl164w3g51e5DbmHY5q6Ch1lOfyYD8D+Jv43JIVEJfTabgbjQdwl2FTopRS8cAJ+lO1i7rJJjQGHhvZI32M6h72Y7ZNrBXu+8LN3FsHW5PVxoETzWG8QntNpLnN1ROelm/QRhcEO1EvcqFjK3ldrPaYXxdAD/xRbNGSHUk9/3KuXIThfl1PApU7l7q9l1iVi2JmiZqqtSfTSIdjZOo/GDO0tYCrz0wO0r8PqEohaNJFb7+GIqse/x+/UWHDPkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6UROjBR2d9qS/fSSn8vkPUByq9vxpu2ZFlMxm4T3aw=;
 b=GDsGjLGrdeGXDezU4euEsg45fyKkK2ZNPzAR17C7cjbdu3p7ejx5uGi2QX+jQ1SuZx9ie/O8tLuWKUS94Ki63Ll8ET5YoBUr3eMouhARl/tBDzWn0eQQmumsnfu4eA2HifJrt/JYSW04GFMLGck++WGOxdHJKLpJu2Lg65oMz+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <77fd3c1e-603c-ad46-c518-3b5b3311e9f9@citrix.com>
Date: Tue, 28 Feb 2023 08:49:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Is xl vcpu-set broken
Content-Language: en-GB
To: Joe Jin <joe.jin@oracle.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0435.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5485:EE_
X-MS-Office365-Filtering-Correlation-Id: 36accaa7-ca41-44a2-3b15-08db1968afcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eJEkm/q9hrfdlO9q949Xcdq8lYgN7oHVwUjjeHxxykdrLQy2uYcb0VJjiFgicWJ0qF4GKy54nCdG5Vrk8729iS15VNktLqngRzxNPsethpLD0WfrnwfS7alt5sgKBXnOYxsM7Vk2lO8BpSwBeS1upNyXAQIn5YMkwGsif2O9Al7ZCHR26l1PkOiQ/f5vBs3Kjw1KIu2KM+nfk99LUt9LuZNwgWctGvWYbaisgbMrJvntWu8nX69v9hCVCVBaMQJLtByRW8kv3MSftpov+V+FXR6omWagFjbRh1P3Sj1nu6RCPLSSGQul+Lhv8yIx0iNH609f9lJhTPVejetbMa3cGxHZpldz+00vhL0rJdAC5bWGTK07JIK3hEQKzTkMUW7BN1YF4+uyLH/OKdcY7ahyi5geuFm0vic+yaurM5STqaPIN/kyxoLZhv397UVTw/F+xNHj0akzf8aIVC2RLrE/gIDqd6bXfXdiVTqUYyimsuaud2+0MYyriHQE/AXdoTrZBJ33FLu+YPpDfCAcbZib6ykD8J0ZKFOj3GADupND2emh3o6kZiJml2M18z1/0444s/4pnT+ADarMDBN21vrb2vrE8Fgo9cUkVIZybjEwRMQayWhonJMHXW/HZf1OJv/ZAfRGD+FlYa5CRPeteA9Zo441nCrlV1a2QoETAX1DMMNFb725mGNFbXjEyoR4pN8ZG8ukKEEvtD1866CMMkibcv4ius204e9oZXKFsVBHoZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199018)(31686004)(86362001)(36756003)(41300700001)(66556008)(66476007)(66946007)(5660300002)(8936002)(4326008)(8676002)(31696002)(2906002)(82960400001)(3480700007)(38100700002)(6666004)(6486002)(478600001)(316002)(83380400001)(2616005)(186003)(26005)(53546011)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVRhdDVqZTJ1TWJycnRtcTlFU3dIaUdjRlV2aCs3ZXlRbWh0L2Y3Tnlsc0x1?=
 =?utf-8?B?ZTRKbjV0QldiNFNUeGRGSjhiWWVDdE9vVEN6ME1udDdoQ2xLM0dUZXNBVE90?=
 =?utf-8?B?QVVvdGJ1cFFTRmNmZ3ZyYkpRcE1wSDVhVTR0OXBncDJjMnFRcHZPTXhNc1RT?=
 =?utf-8?B?RmptYWJTeTNoMzdhT0xlM0haUExXMDRtandVNW9ldVNhZTN3NW1DaWI4dzhh?=
 =?utf-8?B?MzF4Z0JlU0Rab3JVcEZScFI4MVdJTVRRWTF0UGdyU0syOEdxTVhqRnZTS0xO?=
 =?utf-8?B?WUZyRjlhR1RnenhNNmI2UmFCM2Nzd1krMHpDV056YWxJT2VYTUg0NE10VGFq?=
 =?utf-8?B?QkVqMUQ1YWtjaXhlSVUyaDdCVzZvYlNQZ1VHMWRTWUdDWWNOYk5CdDhOQmRu?=
 =?utf-8?B?YWtEZjhGbXgyREk2WGN4cTY5ZnlhZlRVVGpSRlZGVnZkMy9sZjhJTS8yNTFy?=
 =?utf-8?B?eUdVVDdTNGxUdUtPTWZxLzNaTjhGclU5TEVycjZFUlpvNjliby9GQjM3WjMz?=
 =?utf-8?B?TzVCR1pueE5haEJrck9vbTYrbWdyeU1JR3kxZURRQkNrKy9VUmljY1AwTER5?=
 =?utf-8?B?cU14U1BKTGhibTZqd2tWOTQ3SWJhOEsyTDI4Y2JOaHJyMjRER3hCK0pIcHYr?=
 =?utf-8?B?c3VGOGhiWTBZZkEwcHJMVTNvamN5TzZRWkFLdlk4QVNJRWxiL09YMllXd0xB?=
 =?utf-8?B?K2pvUVNsSWdmT08zRmtBVVRibUxWd0U4WjBybXJNREVvbS9tNWwwUlVBMExj?=
 =?utf-8?B?TGNhM2NxVHptSVdFM3JlMFJaenUzZlNiQzA5ZkdZVEZZUkVKOXE3WHp2azAz?=
 =?utf-8?B?UC83SnltT3hoaDZmVkJ3SGREMzB0bGZFUXVCWFNPY3NEMzFBci9kRk0weDZw?=
 =?utf-8?B?aGVRWjJ6R2lFN3VEUHRtUU5idWlUd052R1BOUUgzZjMvK2NMSGFZOEhmb1k5?=
 =?utf-8?B?S1dkWkpNNFNNVFV5RzJZR1hmNDZLQmQxSGh0ZzNoNmd0MGtMODVqc1lTeTNq?=
 =?utf-8?B?bmhRc3crNGR4Mm9jQW9SWk4xTDlKSFl4NFE1bGEzWnRZdlVkd29DVDZGVExC?=
 =?utf-8?B?cmc1NnNwcWo5dE5iZXZKWVQxd0RHWW9qRHJidkNScXBxaG14R2RBbTBPa0RJ?=
 =?utf-8?B?REo1bm82aTFva0lpQ21naG5Ja2U1MWRsVXhmczBOV2FsMnAzTzY2RVZ5RTJI?=
 =?utf-8?B?dnBjek1MVnZ1cXhxQU1COFJvTGNaQVhmbmZ2bmJ3RjYrL2YxZDl5ZVF5ZHV0?=
 =?utf-8?B?c3ljbzA4U3J5Sk9TYlNVN1RpUXdveUY1ZHYxMzVWd3V5cHpYMXE5K29vdldQ?=
 =?utf-8?B?NE55RmZNb1NSVklMVnpia0NwODIrZ3l0VlRkTnBmYjQ2T1gveWk5WnJMM3Fy?=
 =?utf-8?B?MHZVbVJuallnai82clQweEIzeE9sdDB3bFY3ZElGTHBoQjYyK2FraUNlV1VQ?=
 =?utf-8?B?N2RiSlZUa3ZwNnMzL0loUktwdllXbzlUZ1d5ZDBKWm93d1JsS0JuL3M0dnpz?=
 =?utf-8?B?akNrU1p0VVpETXB4RHA4UnNpNGJjM0JjUGRJTE5HUitHbUMrMFVDa0lZZ3FU?=
 =?utf-8?B?TXpmMkw3TlRIQkNRR2p3Z2VvOTBYejZlcHk3dGxVQlFsOE1TZ2pZMWtYWi8v?=
 =?utf-8?B?VjUycm1OVnRvZnlQWHJKTUV4UHFFaXZqVFpwVVJFZ0lrdWZXeXY5SXRYVHhP?=
 =?utf-8?B?VXg1Wm5paUQ3YjJNMlpuNGRGa2pGQlRrclVWNDE3c0dLV2JsUEIvTEhJdWV2?=
 =?utf-8?B?ZWM1eGlTb3dnc0lLcTVQU29lZVFlWGVONnJmL0lqbytWRzZrVHhENXBUaGw4?=
 =?utf-8?B?UzA3QTRkenpoZVZvUjZONGVEUjJvdWNuZEprRFVteWtQY2JtTWYxbWFDNFor?=
 =?utf-8?B?VGgvV284emRpMjcvQWI5aXJjbFdzejRUK1FXWWQwclBKMXlsRW82MVF2VkJS?=
 =?utf-8?B?NHhxNW1NYVNVWVJqMkdQTjcxek1kTmJ5UzN1RVBWLzdRY1ljZlowOWNHNHpw?=
 =?utf-8?B?QUJXYlFQVGk3R1AzYm80dm9GaDNPWkErU2R6V08vV2M1QmpTWG9XaS9vWkFY?=
 =?utf-8?B?SWQxd0lQVEpPa0RFZ0V1bUFEV1BKUUhaUUdmL014NXNYZDZ3eVdLVDdkdFlI?=
 =?utf-8?B?N2RlNGF4cUlQZndqeC94aTBGWWlicElTU3ZSOEpYQ2pTKzVmcm04aVJlR3ZJ?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tc0XqbSlZGavS7Zza96IZrdZpd38pH9UbL1DRZZclZRbPi1eFLRSb6kvD3lP1aKUWpUqK1YBIOaXTyvHjP5RTmULDnLDQ48CIkpne1y1g/I3KLmAqRcul50ABCBPq02FYMOn0MMabeW4yVWLNJ/iip7Mjm/6bLkM3uh/dqKxLkuJLOZ1D+d0Jd63g5C143AmKuQWFpj2OOIi3NlSV+dcuDtBLRAcLGZnWSCAU70yJA4pjWj6q6rg8t6UewjZwmmkW8U686u6uTJw6pBEMS3msQBUjeaMyp0kV3FRUqg1JTq9CqjtzzB3tTuEjTnmaixf++u5LI1n2EqpFCWTY0WBeWfN6uD4TxhbhaISFXQgdsGvaRRSzoL3NfhjqwqpkT8lvxsbFA/ReivuALAntUnb4TqXOK4izy4DG8Eb9AUJZYEW2pOM03Hkqj7jXAyoRb8bCgqbIuCxkLP2aEsFkd0DOLLMlYNxMK1nu0gMpkhfLd2h4QYh/BN9O/KwDIkRsSz+QS6X8TFyxnU77qUO7aUlpGg0+MuP3B2DrAIMQol+LmmsqzrBPzMzvxmLFqiKS6BG9ApFuhy0ifpZUUByGDHYJhG+lPZJZpJNLw/a57d3XE17fdD020S5wML6E+nmRIKfpMyBqO4GtdTll+kyvX55vKYp97Wev3mUALAw3/sKBctrsYofYf76QrTMz75WwKrD/4cxxLVHrjh7vyNnxl4NcHRc38IwmBMiPLj+QeOTR3iFs9uzSrDskFCfWzUokQoXvbb+3Zyz9kbbWb6U+w8FlOSHFl7MpKhbtmH5BVTm0F4C+k5tDNqtsyqx9myl3MYg
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36accaa7-ca41-44a2-3b15-08db1968afcf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 08:49:22.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyoZTISM3R+z6e3DRgllK6IZ1wweiNzL2IzaiHHEeLWQb4SbW/hLeOVb6x1ypHe4LRu4nyLBZkdA+31HkPQr4uf0Y854C+4rLnw7SliGl3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5485

On 28/02/2023 6:44 am, Joe Jin wrote:
> Hi,
>
> We encountered a vcpu-set issue on old xen, when I tried to confirm
> if xen upstream xen has the same issue I find neither my upstream build
> nor ubuntu 22.04 xen-hypervisor-4.16 work.
>
> I can add vcpus(8->16) to my guest but I can not reduce vcpu number:
>
> root@ubuntu2204:~/vm# xl list
> Name                                        ID   Mem VCPUs    State    Time(s)
> Domain-0                                     0 255424    32     r-----     991.9
> testvm                                       1   4088    16     -b----      94.6
> root@ubuntu2204:~/vm# xl vcpu-set testvm 8
> root@ubuntu2204:~/vm# xl list
> Name                                        ID   Mem VCPUs    State    Time(s)
> Domain-0                                     0 255424    32     r-----     998.5
> testvm                                       1   4088    16     -b----      97.3
>
> After xl vcpu-set, xenstore showed online cpu number reduced to 8:
>
> /local/domain/1/vm = "/vm/aa109ea0-2fde-4712-81d8-75f73bd73715"
> /local/domain/1/name = "testvm"
> /local/domain/1/cpu = ""
> /local/domain/1/cpu/0 = ""
> /local/domain/1/cpu/0/availability = "online"
> /local/domain/1/cpu/1 = ""
> /local/domain/1/cpu/1/availability = "online"
> /local/domain/1/cpu/2 = ""
> /local/domain/1/cpu/2/availability = "online"
> /local/domain/1/cpu/3 = ""
> /local/domain/1/cpu/3/availability = "online"
> /local/domain/1/cpu/4 = ""
> /local/domain/1/cpu/4/availability = "online"
> /local/domain/1/cpu/5 = ""
> /local/domain/1/cpu/5/availability = "online"
> /local/domain/1/cpu/6 = ""
> /local/domain/1/cpu/6/availability = "online"
> /local/domain/1/cpu/7 = ""
> /local/domain/1/cpu/7/availability = "online"
> /local/domain/1/cpu/8 = ""
> /local/domain/1/cpu/8/availability = "offline"
> /local/domain/1/cpu/9 = ""
> /local/domain/1/cpu/9/availability = "offline"
> /local/domain/1/cpu/10 = ""
> /local/domain/1/cpu/10/availability = "offline"
> /local/domain/1/cpu/11 = ""
> /local/domain/1/cpu/11/availability = "offline"
> /local/domain/1/cpu/12 = ""
> /local/domain/1/cpu/12/availability = "offline"
> /local/domain/1/cpu/13 = ""
> /local/domain/1/cpu/13/availability = "offline"
> /local/domain/1/cpu/14 = ""
> /local/domain/1/cpu/14/availability = "offline"
> /local/domain/1/cpu/15 = ""
> /local/domain/1/cpu/15/availability = "offline"
> /local/domain/1/cpu/16 = ""
> /local/domain/1/cpu/16/availability = "offline"
>
> But guest did not received any offline events at all.
>
> From source code my understand is for cpu online, libxl will
> send device_add to qemu to trigger vcpu add, for cpu offline,
> it still rely on xenstore, is this correct? anything can block
> cpu scale down?
>
> Appreciate for any suggestions!

Your mention of Qemu suggests this is an HVM guest.  Can you confirm?

~Andrew

