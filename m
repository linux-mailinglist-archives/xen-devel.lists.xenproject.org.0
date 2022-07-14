Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A1D574AAC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367344.598456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBw9r-0007Lf-Fo; Thu, 14 Jul 2022 10:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367344.598456; Thu, 14 Jul 2022 10:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBw9r-0007Iw-Bl; Thu, 14 Jul 2022 10:33:23 +0000
Received: by outflank-mailman (input) for mailman id 367344;
 Thu, 14 Jul 2022 10:33:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4joA=XT=citrix.com=prvs=1872ec3d0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oBw9p-0006sV-DM
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:33:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f35a7b1-0360-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:33:18 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2022 06:33:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5916.namprd03.prod.outlook.com (2603:10b6:806:115::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 14 Jul
 2022 10:33:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 10:33:02 +0000
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
X-Inumbo-ID: 5f35a7b1-0360-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657794798;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VIjHaFxTIq3387J3I4OLADxWv+3LptoTj7Adnp4A4S4=;
  b=KjdcDaEZG/+8VVgXXDG+puwAFV6Wd/+Tk2lLRTzeUx1q7JjX4MSXyd8E
   xW89311Xd0vgOULSa/RwssQ7wbWZ6erPOSIvoKcNiVQi5tAFDKVO24sd7
   L2BEXWN3mPI2sMYX7dhkEZmeC3Xlg2QzpBFEffJmK+3ay9y9L6eaONA11
   k=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 78350323
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4O7Wqqk3CP/OwxjcloT++qbo5gx+J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXzvVaf6NamCmfI9zaYq28RkDv5fSmNcyTQBu+ClgHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8uWo4ow/jb8kk3462u4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kVItEHw6FlGVtJr
 7s7DXMPXz6po7mPlefTpulE3qzPLeHNFaZG4zRK62GcCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAI7gvL9cLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSL327eUx3iTtIQ6L6Xm595YjVOv9jYhFUBRFlKDpKChlRvrMz5YA
 wlOksY0loAW6UeiCPf0WRa1pHqZlhcGXpxbFOhSwASE1qrV7hvfGmEeVDdFQMQ8s9MxQzkj1
 1vPlNTsbRR/vbvQVGmQ7Ky8qTKpJTNTPWIEfTUDTwYO/5/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxAAuirNWgcMV2qGT+VHcnynqtpXPVhQy5AjcQiSi9AwRTK6oYZa5r2fS6/loJZycCFKGu
 RA5d9O26ekPCdSHknyLSeBURbWxva/bYHvbnEJlGIQn+3K14Xm/cItM4TZ4YkB0LsIDfjyva
 0jW0e9M2KJu0LKRRfcfS+qM5w4ClMAMyfyNuijoU+dz
IronPort-HdrOrdr: A9a23:zMFaTK0UAe/BU4J5oOo9ZQqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.92,271,1650945600"; 
   d="scan'208";a="78350323"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7B8RkyoVEHIowkVPosUCIpyX2SzEutF+7l1eHYUV4+xGlb2LdKkvkgQ7qddSkCqHeNKjoCC+XLzbGoIPIBU99spsu9T8pWyR9RjD+cg+DVupTV7bmUu6Ogokz2/K+Ujqvr7Q96fYZUDjG0b06SCsUVIE9iYzpMG6dWh3DtzG5ILrkb4KTqf8ZL8s5yqmedxIoXDFkIzRSDfnbFUM0clmNHcoYPOsqVMYEIGYKDqzReG29WS0CaLdQBfp/+6yXQl/j1jjhEl1VfCxgHTRUX4D374PjojYhED5m5PTYtzqiIOyapzD6t9SIRkyibDosNGdrf9VgaH0GXgM/z9LL++8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIjHaFxTIq3387J3I4OLADxWv+3LptoTj7Adnp4A4S4=;
 b=jMRfIv7I7EcrYK6P70C2R+YKv3iEVWUAgulBEd6P7u9z5W8Z2NH1qvAPuhUhOI1LfsA9qqw0ocMmjLkeZ4SFjShub6dv2I9BENLHSuphjeqaKVJnZuO3t7QXrQqz44Bkd7IHfeClk+K1uOvLYKbwB+qkzsGm7xdzDJWXBfcQUklaZoBVmIVaIUFW6kdVwbXO/lup341kFI+d1wJEdN5+WzVxWADHuy7SrZ6jqu8K6gOu4CAk+TRn8zSkGU+/bO4VAqpAU7L6TgzgXheR8gxl6TaSImPSTSCL9JyLt4kgiBsInMIym9cAKdU+ZcsfDWJ4UpjQV3hvSC6nbozqgrF5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIjHaFxTIq3387J3I4OLADxWv+3LptoTj7Adnp4A4S4=;
 b=mJ7EVRnk6leNmCnu2ThvA8plCUkVR3UcEF0McJV9KZzX7aPR3G5JsN8hfpv1XIjcCNkUoWaFcYL92yLyvlN7npbaRp6l8Cw3NXms4HsOXP8efIEzQiUbvvWLz4rnV3IjQZ2ucrc7+rdCQALGwlgJDltXwVFEhexvheVXM7pKUKQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>
CC: Xen-users <xen-users@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Topic: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Index:
 AQHYlsiZU/X6oYzkBUqjI0g62JIGmK18caCAgAAKCoCAAPuhAIAAJpSAgAAJHQCAAAWjAA==
Date: Thu, 14 Jul 2022 10:33:02 +0000
Message-ID: <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
References:
 <okFlqhJjn071_UXGT4dzMfI03eqFRtlDcnSyS_QtHFu3vZVCdTTKkvZS1ApPFXEN65mcnhOc2g-9HjZmTGYMyV1OOzrv_PkCzdo4KNKICf4=@protonmail.com>
 <5952497A-CB6F-4C66-8FA9-8EF9A1A08B5E@arm.com>
 <9gC8biTj2pIJoXJRy4N2I6nsOUEUjYsbIAj0XZsWdAwiwzXpgBBeBrLFB0bAC7LjVmKwPvzufWHPSVYaWuMl33lKHKbzChEgW4R9QBwJZJk=@protonmail.com>
 <F18A101C-ED4C-44DA-AB2C-15E79620A692@arm.com>
 <13TmiNmQ9iXXKyshVeCbt4ul_jYjdNejXrqhIJK7CioLQRgpSITJX1Ik0jNEZZDTUIXs9OvM0qjZJeqRhQl1oKU9IdiZ3W-Ajsqp3sYgt6Y=@protonmail.com>
 <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com>
In-Reply-To: <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f1a73cf-34a6-4bcc-0f1d-08da65843aeb
x-ms-traffictypediagnostic: SA2PR03MB5916:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SejD1eR6W8WFvl7mNB9edznR+81PDFY+mBrBwzJ7WE1YNnNI3OzM5lwVAEL4+DBbddXRz6x0oqeFdQBE0QJ8vU05ChoVqrNRnBcDpAwqEZtwbL/Yyo+dKjfAfN49BwM7zWSrSOU7jUEzBdGOts+Bquv3z4+bDBXjMv4dit027ITZCFPksd3XUIn16cVRnvxFEhgPlX90y15gmi3JovxPfjeXd0YPQ9Mr27CrAG/UCW9aLmzB/jFy9Y7n1O7F295N0YoIsgDkqHYmF8cwGQXf4Pxs1d02NB5cCnIkhFUMlbCsO3vsYkKvMh31YxIwvtCWAYUlHQBKfL0Xfz+y0eyx05UyooNqRAVhhbe2pCmnIh8P0PIiCad8jbGUvNS4k4i4gylqt+scrOgfbE/kd/wjRmr8v1jzjy/vRJADqM90s6/0vdPT6Z2/cPWp8HVNvFs1BvQQL+Jiqc6SdIKVl7vD/zVRqplMPWmVD8oupAHwwnDVajOjTgHayFBmnsT9Z0HRZAMcRApjNTA6T3ChXlaf9eS/QX/RhBzQFjJ9L6Tb1FINWQIX6LGZiaPo3mb+XD321jxI/U7Z9/vjwgEl68LI+LHHLJvSnwontepHmETk4DbRKHDijJz1ieYMBuVwHHb68L0AyRCpAceunsLeTzvHOX26/tq6PbXyJNEUe5whoS7mWdOUxpu5Q+u2RQUYN19uaXDpqpBDBOaAFU+n48YrmrlFKU+rY6dsS9+Jg0FPKpBWaRONISyWPyjmKdF3uYmhCnaiOW7F3Q4qotM3TSKRHk2cMVTV9YBDzRKw0e51ZXyEt9ZXJjZxI5VAYhBpCiQpumKpGNKpAG35XazZ/13E3fndG0D+Xs/kcQLxvl9ZbXqFhbxBMuQsDuK7EjbzdWXFKpFJ+xIPaHnaYC3mKCVt0lK5Rdl3wm0pny+RXEbBqsOdZWPW6AQopK8pvwn0ki6f
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(8936002)(38100700002)(66476007)(82960400001)(2906002)(31686004)(41300700001)(122000001)(5660300002)(38070700005)(83380400001)(86362001)(66446008)(2616005)(31696002)(110136005)(54906003)(53546011)(6486002)(8676002)(71200400001)(4326008)(186003)(6512007)(966005)(478600001)(66946007)(91956017)(26005)(64756008)(76116006)(66556008)(6506007)(36756003)(316002)(45980500001)(43740500002)(547064002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWZCSHY0Uis3bkppK1hSakxkMmM2aURKT21vd0tSaERlaXd3dFZvaWlpa3Ny?=
 =?utf-8?B?Q3l1U1Z0VGxhUWVrMTRLWitwNmlVMitVaVB2cFh4cU5sMCtoU294YjBXaXY3?=
 =?utf-8?B?NzNHTkxCa3JWWjFsbGEvSWFLZGFHM2gyeXlJaU1WdWJ4VDR2TXJpRXc1QXNM?=
 =?utf-8?B?bVJQWEwxcGFvczFmaDFkM1laVmQzaENIYmVSRXdkSmQwUkhnUlBuUHZXWTh2?=
 =?utf-8?B?Y2xHajBORVBlbGNxcDh0VGxwSmc1bWI5emUyRmlabis2YXVuQ2RRek5qaWtZ?=
 =?utf-8?B?eGloV0l3VGYwL0YyS2RhM0VyVVZDY3NqNzMrMUtpZGdWcWJySGJGdFVCQUVj?=
 =?utf-8?B?UkdPOXgrb2NLT2t1MFdYT0FKcjZpd1JZRGdIL1hBWWxiWVJSb2tZdGVjVVJt?=
 =?utf-8?B?dmdrM1RSaUl4VGNlRENzazBiWFRlZzNVNHFjWTM1cC9iN0pjWk8rTnMvcWJ1?=
 =?utf-8?B?bFZraDNpVTdYRWFEMi9CMWJuSjVIL2xiQU1QTHVGUzFwTDJRVnJSUVVjOEE2?=
 =?utf-8?B?aDVpTlZsVk5BQk04TVRyZ2FDS2hXQnU0ZUxxSU1La2o3UVBxcnJVeTlSVFVj?=
 =?utf-8?B?UHVJVHZpa1VqbHd2ZVk1V3NWK0p3cU44VFJGcldKaittelJ6N0JOeHNxUVF0?=
 =?utf-8?B?VUJET2twMWkvVDg2eTZ4dit1SElia2U1QmprNGozWGwwUThCbS9CZ0xsSFJr?=
 =?utf-8?B?VnVGNHVPTFBseko4aUI3SHphazF5R3JxbWViWk5HSGQxR1ZiWjV4SC96NWJu?=
 =?utf-8?B?MDI2ellzWUo5RVBZYURxUG5JWks1VXFmMGZhaU42OTJOdSsxdm91YTc2bFBl?=
 =?utf-8?B?YXNUOVR3N0JJQkxoUGlOSmV2YUYvdU5kZURXVFV6b0hwYXp1VGJTOEFkZ0dN?=
 =?utf-8?B?Vm5wTmpGNXJ5S1lBN3pWZkJ2QUVzUitzeHRQa3VTbzZqRFhkVXBXOWRzQWds?=
 =?utf-8?B?NTVvdWxiNk1jNXVWUnFUMExUeEhRR0c4LzBQVyt3V1RENXRDR2Qxc2Vxamp5?=
 =?utf-8?B?a0xvekpPMThVa1ZQdkZDOFIveUpQYW1zMTM3bEZLOUZib3JGR2dFeWxtRGdE?=
 =?utf-8?B?SEhYUEJUN3lDekxVU0xucUJPMW9mRE9MNnhHczVKbXozbmxtL2ZUVk9pdFNo?=
 =?utf-8?B?NFp1R1pCNkVjL0RlSzArL2diTHdLU2Vka0xjWFRlNEtpWG5VbWE1MjlLeDE5?=
 =?utf-8?B?RkNLemd3ejhoV3JjY1R6d2Jwckt4NHJVNXA3QkFXMGZPT2k1V2VpOWFCbGZU?=
 =?utf-8?B?N1VlM2FRWUR4THBEekdaTE5nb0dmRmZLZ3I2dCtqWVJscnNVSWtmbXlJQy95?=
 =?utf-8?B?R2ZkbmNscmRCa2ZPV1NNcnpUYk0rT1Y0ZjRLS0J6ZENNWFkwdFdsRXZqckc0?=
 =?utf-8?B?MEs1K0ZrdW0yNU9QZ1pRYWVIc3owUU9DTFMwcE8wRzBaSUcveDJWNmlNOHBS?=
 =?utf-8?B?NWR0MExZS0kxKytqRTlOVFNPMVRid1VUM2dsNlN6Q01ET3RNZXNFdTA1TnVl?=
 =?utf-8?B?MmVlSnhkdTZJSURPQmpzYUNScXpUWnZUc245TlViNFB0MlllZWkxNnFqUGpw?=
 =?utf-8?B?RElpejdSVG9sL285N0VvR08vaWgyeVBLd21GYUNrM0NFKzhWUWF2Tk1FWU9R?=
 =?utf-8?B?OVJrTHl0UXh0dTNzc2FmNS9qUk1Ha1gyNUtFVWs0cGRTWGdQZ2cwcFMrN1A2?=
 =?utf-8?B?eW51cXE5MTV5K3NsRksrOUxwWUYxek1DZUZ1WCtqay92VzNvdWpaVGZpZzM2?=
 =?utf-8?B?aGdrUWZBblZOcUQxWUhUcFpKbm40V01IREsrS1JlN3JnTEQvQnlFU0FkRzhJ?=
 =?utf-8?B?MDhyVHJkM1crMjg1V2UrN1pNbGw4Mlc0WTNkSTVEeU1MSThPOFlDTENoMyth?=
 =?utf-8?B?OGE1TnhUbVgwN2NQMDVha2drUm9LM0I4VnVNYmlGV0F2R2hLcEV2WHI2b2VD?=
 =?utf-8?B?Y0RkRm9aUHJ0VUk4eXh4VkJ6OWZCbmw4QlRtWEtiKzBURnB1dnhUZDlQRjFL?=
 =?utf-8?B?WW9La25FeVBYTDZGZ091K1BrRGEvRHFhb2l2cUtFeHMrN2hNL0VkZGlUbW1p?=
 =?utf-8?B?bW9KSlZFaDNmbHc4N2dEcmtXREt1YUZIcGNuWDV2UWREZjY0anFGVjM1N3hm?=
 =?utf-8?Q?N8nw7p5i7x9pvqChAFEV4httm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDAE1FEB8FF8084BB42DFB71EBE1F60F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1a73cf-34a6-4bcc-0f1d-08da65843aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 10:33:02.4762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eADH+pCFoLC2OBKfQSfir/VQRgInBGzyqZK8w4nKzdF1e29IUIstXabUp912DcZmZbD8C0N/3hbNbZxP37/XewsbUsTFvxbbJBnXidNCFPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5916

T24gMTQvMDcvMjAyMiAxMToxMiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4gKyBDQyB4ODYgbWFp
bnRhaW5lcnMNCj4NCj4+IE9uIDE0IEp1bCAyMDIyLCBhdCAxMDo0MCwgTWF0aGlldSBUYXJyYWwg
PG1hdGhpZXUudGFycmFsQHByb3Rvbm1haWwuY29tPiB3cm90ZToNCj4+DQo+PiBIaSBMdWNhLA0K
Pj4NCj4+PiBIaSBNYXRoaWV1LA0KPj4+DQo+Pj4gWW91IGFyZSBtaXNzaW5nIHdnZXQgaW4geW91
ciBwYWNrYWdlcy4NCj4+IEluZGVlZCwgaW5zdGFsbGluZyB3Z2V0IHNvbHZlZCB0aGUgaXNzdWUg
YW5kIEkgd2FzIGFibGUgdG8gZ2VuZXJhdGUNCj4+IGEgZGViaWFuIHBhY2thZ2UuDQo+Pg0KPj4g
U3RpbGwsIHdlIGhhdmUgYSBidWlsZCBzeXN0ZW0gdGhhdCBzaWxlbnRseSBkZXBlbmRzIG9uIGdh
d2sgYW5kIHdnZXQsIGFuZCB0aGVyZSBpcyBubyBjaGVjayBpbiB0aGUgY29uZmlndXJlIHNjcmlw
dCB0byBlbnN1cmUgdGhlc2UgdG9vbHMgYXJlIGluc3RhbGxlZC4NCj4+DQo+PiBBbmQgdGhlIGVy
cm9ycyBpbiB0aGUgYnVpbGQgc3lzdGVtIGFyZSBxdWl0ZSBvYnNjdXJlLCBpdCdzIGhhcmQgdG8g
dW5kZXJzdGFuZCB0aGF0IHlvdSB3ZXJlIG1pc3NpbmcgZ2F3ayBvciB3Z2V0IGluIHRoZSBmaXJz
dCBwbGFjZS4NCj4+DQo+PiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzID8NCj4gSGkgTWF0
aGlldSwNCj4NCj4gSeKAmXZlIENDIHRoZSB4ODYgbWFpbnRhaW5lciwgcHJvYmFibHkgdGhleSBr
bm93IGJldHRlciB0aGUgcmVhc29ucy4NCg0KVGhlc2UgYXJlIHR3byBkaWZmZXJlbnQgcHJvYmxl
bXMuDQoNClRoZSBjb25maWd1cmUgc2NyaXB0IGRvZXMgY2hlY2sgZm9yIFdHRVQgKG9yIG1vcmUg
Z2VuZXJhbGx5IEZFVENIRVIpIGFuZA0Kd2lsbCBvYmplY3QgaWYgc29tZXRoaW5nIGlzIG5vdCBw
cmVzZW50LsKgIFRoaXMgaXMgb25seSByZWxldmFudCBmb3INCnRvb2xzLyB3aGljaCB5b3Ugc2hv
dWxkIGhhdmUgYmVlbiBmb3JjZWQgdG8gcnVuIGNvbmZpZ3VyZSBmb3IgYW55d2F5LCBzbw0KSSdt
IHJlYWxseSBub3Qgc3VyZSB3aGF0IHdlbnQgb24gdGhlcmUuDQoNCkZvciB2YWxpZC1hZGRycyB2
cyBhbGwtYWRkcnMsIHRoYXQncyBjb21lIHVwIG9uIHhlbi1kZXZlbCBiZWZvcmUuwqAgSQ0KdGhp
bmsgdGhlIGdlbmVyYWwgY29uc2Vuc3VzIGlzIHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBzaWxlbnRs
eSBkZXBlbmQgb24NCmdhd2suDQoNCihXZSdyZSB0cnlpbmcgc29tZSBuZXcgcHJvamVjdCBtYW5h
Z2VtZW50IHRvb2xzLikgQ2FuIHlvdSB0cnkgb3BlbmluZyBhDQpidWcgaGVyZTogaHR0cHM6Ly9n
aXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL2lzc3VlcyBhYm91dCB0aGUNCmNoZWNrLWVuZGJy
LnNoIGlzc3VlPw0KDQpUaGlzIG91Z2h0IHRvIGJlIGEgNC4xNyByZWxlYXNlIGJsb2NrZXIgc2Vl
aW5nIGFzIGl0cyBhIHJlZ3Jlc3Npb24gZnJvbQ0KNC4xNi7CoCAoQ0MnaW5nIEhlbnJ5IGFzIHJl
bGVhc2UgbWFuYWdlci4pDQoNCn5BbmRyZXcNCg==

