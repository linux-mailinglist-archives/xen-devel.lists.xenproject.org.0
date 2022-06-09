Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6764544B8F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 14:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345310.570931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH64-0005MR-Ch; Thu, 09 Jun 2022 12:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345310.570931; Thu, 09 Jun 2022 12:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH64-0005KY-9S; Thu, 09 Jun 2022 12:17:08 +0000
Received: by outflank-mailman (input) for mailman id 345310;
 Thu, 09 Jun 2022 12:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7Sx=WQ=citrix.com=prvs=15236f833=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nzH62-0004iH-FY
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 12:17:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1103407c-e7ee-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 14:17:03 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 08:16:59 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SN4PR03MB6784.namprd03.prod.outlook.com (2603:10b6:806:217::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14; Thu, 9 Jun
 2022 12:16:57 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 12:16:57 +0000
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
X-Inumbo-ID: 1103407c-e7ee-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654777023;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=SFHZGe/NyJm4UgOLlTeQkgHrC66QfJCVmXFEpeixUB4=;
  b=IqfO7Nbb7oszHpOxX5ErzzrdwJxX6CSdeZNAna89U4Ty7NboRAuG5sBv
   ZmSdGeDHeBccPgNQDiuQeTxengzi4c8Wi3CnLfJbZgbu3NCIIB5fJSjTF
   TRttk9SiiIlk4tsyAQD24sCqt45HKAddmu8NT03xgANMR5pv59XyZvqp3
   U=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 73221298
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PYoukKj1s6kvCSy+xcnEes+ZX161ChAKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41yZbcxt4yG1NvpXowHi8b8MHMDIXIcUqhNXrPJJSZE09tt
 ZpEY9KYd5xlFiDS/0n8aeG+oyMhjv/USrbyVOfJYysZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EAOugW8rPjNEuq7c9R9j7ayj6T1FsgU1PaBH4g+FnCMbXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1DI0BK6YoD66vR4jnVaPp0TabxNMC+7tx3Tx4ork
 IsV5cTrIesUFvakdNo1AkEw/x5WZcWqyJefSZRomZXOp6FuWyKEL8RGVCnaD6VBkgpEKTgmG
 cgjACIMdni+a9eem9pXfAXOavMLd6EHNKtH0p1pIKqw4fwOGfgvSI2SjTNUMatZammj0p8ya
 uJAAQeDYigsbDURNGcKUoMi396Ci1C8ThhAkXW5/qgotj27IAxZiNABMfLzU/nTH4B/uBbdo
 WjLuWPkHhsdKdqTjyKf9W6hjfPOmiW9X58OELq/9bhhh1j7Km47UUVKEwfk56TkzBfhA7qzK
 GRNksYqhYc/81akQ5/RQhu8qWastR8AQdtAVeY97Wlhz4KLuFzDXzJVHlatbvQ/iOwURGUY6
 mWrwc/nK2xXoeScSkuko+L8QTSafHJ9wXU5TS0OQBYB4tLjiJoulR+JRdFmeIavidf4Ay33h
 TqDoy43nbw7h9MEzKi98hbMhDfEjojESEs56xvaWkqh7xhlf8i1aoqw81/Z4P1caoGDQTGpl
 WIYls2pyfEBBJCAigSAWOwIWrqu4p6tMiDYgFNpN4ks8XKq4XHLVapd+i1kLUFldOMNYyb0Y
 VT7sBlUopRUOROCY7JsaseqCssCyan7Cc+jRv3SdsBJYJV6aEmA5i4GTVWLw2nnnUwokKc+E
 ZSWa8ChCTAdE6sP8datb+IU0LtuzCZuw2rWHMr/107+juLYY2OJQ7AYNlfIdvo+8K6PvATS9
 ZBYKteOzBJcFub5Z0E77LIuELzDFlBjbbieliCdXrfrztZOcI35N8Ls/A==
IronPort-HdrOrdr: A9a23:RSyxKKgUDEzWNIUaEfYMqH2zA3BQX3Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftWjdySaVxeRZgbcKrAeQfBEWmtQ96U
 4kSdkHNDSSNyk3sS+Z2njfLz9I+rDun86VbKXlvg5QpGpRGsNdBnJCe2Km+zpNNWx77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Ln1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoDOCXMsLlUFtzfsHfrWG1TYczGgNnzmpDq1L8eqq
 iOn/7nBbU115qeRBDynfKn4Xic7N9n0Q6f9bbfuwqtnSWxfkNFN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3amBa/n7/nDE3kbKvNRj+UC3a7FuIYO5bLZvjn99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8PC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8e166MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBkPkoLVeLmzNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; 
   d="asc'?scan'208,217";a="73221298"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnAehYaNjuIkC/GHhmlKTxo2kSXaNaIdVomKEyK7qIRbQ+AAVUzr4t8PSEsuEoMdYAthCH195vnDXo4j8i9D55EtgEfVPSVj4ZC5sJorF04Mb4L9JxEWAfvMxYJDlPv5oqwHbABm+KpGHcvWXGBNPyNIjEGeHF8X0d+OUdSw+pexQd/U+eJOtQtymI3wruXrd+LHvo6h13ibvUMjmRyCAe+2PhcVM7x7vkpaPvawLOmylx5dTo9fzu9lkln25lZZ+3Ax1vg3uX/jKcXhQmAcJHtAY4ENSESMddGPq+VhOvnink8L8Ao5Xq8+KSg+6U1JOm2riYAZPimMQWEXpt3mVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIeRCBvMRWO8ZG+IXg2F1S36S3Jl98VDjZhcq9AUGOo=;
 b=HLi/6FO0inJVmx8/eIl/vYi4PzP+SJtH7969V2cfhRlhjkJPnkz5j3lHceVaMQ4zA48F9hFxdMfEgjcOeavRFbLQ3TsilY7KxUa8bw8M9+Hzrk1mRNX5J2c11C4DkzXiV7ODskHuhmJ9T4GICYV+dt8j+RLUI8szNsNHyENOvdn12I6dLgLqWud+LACAI6oARmKLWMdyKkPyQoHhhlRq6t13eOyVrUWsagItLBA9LNzs7B1pAhieNJIEfg6EXSlC5BAFrz+gm7WVr9kCiaq6LFHM3DLGP+f6x9UUPRRfAfPzJFql+h02ikOhzu4NXeOyssy3cZ7NLUa4d1BXqvsb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIeRCBvMRWO8ZG+IXg2F1S36S3Jl98VDjZhcq9AUGOo=;
 b=ekk7CrQm/tY6KaEW9JyG2SloNL3TQ5tTKPtMr6cy+pZrUUUpwt1VdsIHiqEc/kMVJGDx8OzpIeeVdf488gKO9ctVta1koHoFjnX55jXfNBxjuZYi5gR7xrOjmo2r3XWP6GUw8pwRnzHoIxcybnWEdpwCh2LjGMFxkr4wOPZMRHM=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "fusa-sig@lists.xenproject.org"
	<fusa-sig@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
Thread-Topic: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
Thread-Index:
 AQHYdZ38SXqYMiOAsUySyh3MMtjDRK06wjeAgAA+pgCAAMtvgIAHcfwAgAO5uACAAAOYAIAADsYA
Date: Thu, 9 Jun 2022 12:16:57 +0000
Message-ID: <A59C0FF8-649D-4B82-AC56-2B8089872FA2@citrix.com>
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
 <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
 <45c4d8fa-06de-b4a2-5688-14b9cbe5b48c@bugseng.com>
 <a10972fc-0f25-4187-4386-e73b4f5563af@suse.com>
In-Reply-To: <a10972fc-0f25-4187-4386-e73b4f5563af@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 263902de-a979-40c9-0490-08da4a11f2b2
x-ms-traffictypediagnostic: SN4PR03MB6784:EE_
x-microsoft-antispam-prvs:
 <SN4PR03MB6784B70B8D34C2DA6CE9807A99A79@SN4PR03MB6784.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hai489dvc7y9/WdNMybvvObPbpqh1JvORcV57fo+JnFbQoLrPqf+zSMKeO9PQd7/ciC60o5ZdJeHtBSLczBG+CyUNAIIiYgsg66Xv3golXkaUtiA1Q5yxrKafE3Jiq5jXj7cUmkmWnDDFvd7HICOye7vnk3aqk0Pf0uAgcj71RkidaczxsNtIg/wNDbpFRVUMeAAFZFixa1H/w/YvkYuy4oB0xjcP4QQExhg6wFLhpBdT5bbNIFDJv1qNpJeyG3SgmjhFAYdm8nBlaqHevCJO6QpgZvM5EOXWFmsHEI6NR/paAC1BV+CCrduvPAUvyKE9LuBjJyyP/bxGS1Z/mKjl9scucmUfsSXUKZNmV5yIgvWFHShqPub94WeCaZt+g6hJlaJC63BWTJavpX9bKY1KGMmkpVSET+6DTSDEk73oKBYTlggyiQ5HnFajsWwu+ARoe2B8Mh1Ej0OnWuoMG2M1aFHR2UIBaMZCXYpfRzoMR/b2PyiQ12CWG6RoRyD3G/gC0GwWoXM31HP76zYUab8K+pMmo9mdtZJmfKWjYHfd6BSzBCY3yp8jbGEgqrqzUBluA0ImmHE2vCs6Cfds3G8wVRk3M/lWxNncbllrxlL27QZ/V+w/3dx9pUoezQJDe+OuuInnTcieYz0/HAbxT7HehQbhbltNc0KA1J4gfREqlYAxadZ5NSqp8YrOp3TQdYgr2ftixzpj70Ejka7GI8RCr6+0qEloshTUIo2WmvIqjREXZ5gQ+kkLTg5g0tC9P5jjIT4WT01WkrECgckfQjGFGxEMb2dxKyAC1nUG30wBfBgd+YtB8p2YI8Ci3VOM9tv1jUZvvkJblTqIAoVtU4D4Hf8kpAqZHS/iKYLZWSLS2M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(91956017)(54906003)(6916009)(82960400001)(76116006)(71200400001)(99936003)(36756003)(5660300002)(316002)(26005)(38070700005)(122000001)(6512007)(53546011)(86362001)(4326008)(8936002)(8676002)(38100700002)(66446008)(66476007)(64756008)(66946007)(2616005)(166002)(33656002)(508600001)(186003)(6486002)(966005)(83380400001)(66556008)(6506007)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WG9TKzcybUhjaXRCUDJQS0Z5bHZHRkRGQzUvbmNQY0FPT29MYTRDblUvb1hm?=
 =?utf-8?B?MnZjL2VTNDluOWpyRVFiekxKNnErQVhXZUdhNENEZHVNVkwzRG95VkxQK20v?=
 =?utf-8?B?cUFDRysrWlhIRGJjTVJ0VHprTEJ4Tks3cjQwRTAvL1V3aW13WVBJbmJOM2ow?=
 =?utf-8?B?aUZxbXBxNW5CSEJjV2Y2QzNMOFE2V3JtWkhXblF1TWlxY0lSWXZyVVQxTDNj?=
 =?utf-8?B?SVdqak9oODVGTmUrbTdSVitGb0U2Zk1CSncwMURqeUJadkpJbEVCLy9wOStl?=
 =?utf-8?B?QTk1V1NJaWlRMnJoaDdLYk5pT1V2MDNmSEswV3Y4Sk42Y2d0N2h1STUza0xO?=
 =?utf-8?B?cUZsUEVrcFprMVY3dWkrTFZwVXpzSEJOdmJNaktoMmdRS2FIK29sV2VzYUFq?=
 =?utf-8?B?WEJ0ZzZRSDlVRjhyT3dHci8xL2pMa2pyMnlodGNCUGtuUHBPaEdraGROcHA4?=
 =?utf-8?B?MGJ6VjBXYVEvdUw0Z1dsUUhwRmV3QXFLR3dSaEEwM21YNERhNC9tOFkwWVRo?=
 =?utf-8?B?MEUzVm5wb1JKc1Z1RUIyZ21GeFc1UzhmMFRBTkdxOXQxalFxa0RiUHdQcjZy?=
 =?utf-8?B?N094K2xPUGEwWEN0U0oyMDdab1A5bmFWTkNHbTVXZjczUEZ0c0FtcGMxWlNH?=
 =?utf-8?B?L29tZ0VSNjB4NW9BT0k2cGVjYmM4eVJEUytBY2ZSL01FVHZwcjExNHhxK3ND?=
 =?utf-8?B?bGMzRCtQdHFSanI0dUFpbVFGc3lrQk1rOUFlTlFmbmpya1dOSEE3SlVFSElz?=
 =?utf-8?B?aHVzbzlweGZ5TWRaZDNUUFUrSzNFL1l3VTNkaWx4dmZzSGNEOGVrVVNLWUVl?=
 =?utf-8?B?Q3RWeVNhNGlTY1B2YW9xVHp3RjRnOEViSnBRRGZtcnlWRTZ1eXNwcThQL1VL?=
 =?utf-8?B?a25oRjRvSGVscEx2MUU4UFNlazYwMjBnUTIzWGU3T25XZCtDWSt4QVp0c2ww?=
 =?utf-8?B?Zk41cy9ULzVYTTM5ZXdDbFJHTHlpcXdJc1NnaFZNN2M2Qm9COEd3TjNWSmxi?=
 =?utf-8?B?NWlHL1Nxdnc1SlFXMjZoZGJ6Zm9GRGM1VEpMendGUXJnZWgvVG1vUWpRNFlK?=
 =?utf-8?B?bnFKTzBra2h5bmpsY2M0NXRFZDc1cUpRWk5vVHFJZGIyL0Rqc09LK21JK2Fj?=
 =?utf-8?B?N01jVEcxTG9tWFhkR2k4ZXZwUVpzVHgydlUzbldicHdJSDVSZ1BLNDR4NDVq?=
 =?utf-8?B?K3laVTFjZnd2bkk1WWZCWjNLVUlOQ1VKQTRuWUlsM2NJbWQyQTZvcm9nVTBk?=
 =?utf-8?B?Q2hCUStNbFBkeDREbWZKdDlnT09VOEtMUlZVSUZRUS85RTNLaVpXMnpHNDVX?=
 =?utf-8?B?OE5vZVA0eCtiUllRUUxhajA2cFY0REZxMXI3Qmo5Ynl2VmlPZVZzWE5SN2Rj?=
 =?utf-8?B?VERYc1JhRXFFUnY0S3NUaEZqRnV1dnA1c0tTdDFXeEQyRTc1U1IrOWtBR29z?=
 =?utf-8?B?T2h2YzFlZkxFTzRiVW5Kc3dDYzZMNldiWGw3YmdVd1d3WWRVaGQwRk8yR25v?=
 =?utf-8?B?WVdscy96NzVNUUZtK0R3anE2UTJ1c2RnZzl4RC94akxYblUwaWg5VlZwRVI3?=
 =?utf-8?B?cXB4VGM0NUZmUUpoR0U0cW9zRk1hTERqOXlOK252NjJPUTlXdWNCNmdjTENr?=
 =?utf-8?B?bjRPYmpQYys0Z1h1Z2lubUViM01rQzB2WnRRZFpVTlBCekpkaW5ld2w2Snd3?=
 =?utf-8?B?ZTd5bmMyTzQ4RUx3TmtMeFRhMEcxU1NsdWJSUFRaR0h1VVpuUUI5SWNnSWYy?=
 =?utf-8?B?K3BGdkdyNHpkeVZSa2NuUytmb1NKMUJxcGRXaW1Eak9ndEtrK0RhREFobkVv?=
 =?utf-8?B?MmtJcWloUkQ1WlpmeFVRY0lmcldpcW56OWtYMGd6bUJIVEpNbVVpbzBEQUdK?=
 =?utf-8?B?aThSZ0xxYXdsZWpqTUNZcUtlalN6eUxVeWJTK2NLcHQ2ejN5Rit3bmprNENQ?=
 =?utf-8?B?MXJpU1NtVVQzRkxnZnFkdnlFd1l6YVp3UjM3cnRHL3FhNVZSaEovWVV5UzlB?=
 =?utf-8?B?VHBOL3IvdkhLOHBTblhRWHZZeDdaUnlIK0dCSGJSSFl6eEhKSmY0anMyQ1BJ?=
 =?utf-8?B?M0tXcCtpV1pITDJqekR1aWVZUVIvWWZvYTVEcS9xUWcwVlkxWkl3VW9UZFVC?=
 =?utf-8?B?RlhYMkxCRW0rWXQxYTNzQmZ2ams0TzdpSGtVUDlvcjJJaHd1QlE1djdOWURZ?=
 =?utf-8?B?VEFwRytoaXd0THFZM2daUUJUSGdPVUhWZkZYSVdkUzdaWlZ5czI4c0RPZjB3?=
 =?utf-8?B?aDRBYVNCNXFLSVpnL1Vaai9LK2VrWHZzQ1prNUVjYitZVDUyeCttVDRJMUU4?=
 =?utf-8?B?TEw2RE94cW5KTThkRXVrYm1HZExIYldmaGUwZGRBNURSd05Hc2JFUTBrdGJ4?=
 =?utf-8?Q?hyOYNY8uoQ51mrnQ=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E84EEBFA-12A4-4474-989F-9003B89B2E08";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263902de-a979-40c9-0490-08da4a11f2b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 12:16:57.2373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +K5m30vCVW6LWSoz5ODzGYKnVOOVxauU8GDGWOmRj3gnSlq29KX90o7r+4hOOwIfzJhFKcwvIdhtBgB5jJaM5ahS9piZCKFAjxMKKBRY158=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6784

--Apple-Mail=_E84EEBFA-12A4-4474-989F-9003B89B2E08
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6AA87F33-84D6-45EB-9BE4-89565F3D7D43"


--Apple-Mail=_6AA87F33-84D6-45EB-9BE4-89565F3D7D43
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 9 Jun 2022, at 12:24, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.06.2022 13:11, Roberto Bagnara wrote:
>> On 07/06/22 04:17, Stefano Stabellini wrote:
>>> # Rule 9.1 "The value of an object with automatic storage duration =
shall not be read before it has been set"
>>>=20
>>> The question is whether -Wuninitalised already covers this case or =
not.
>>> I think it does.
>>>=20
>>> Eclair is reporting a few issues where variables are "possibly
>>> uninitialized". We should ask Roberto about them, I don't think they =
are
>>> actual errors? More like extra warnings?
>>=20
>> No, -Wuninitialized is not reliable, as it has plenty of (well known)
>> false negatives. This is typical of compilers, for which the =
generation
>> of warnings is only a secondary objective. I wrote about that here:
>>=20
>> =
https://www.bugseng.com/blog/compiler-warnings-use-them-dont-trust-them
>>=20
>> On the specifics:
>>=20
>> $ cat p.c
>> int foo (int b)
>> {
>> int a;
>>=20
>> if (b)
>> {
>> a =3D 1;
>> }
>>=20
>> return a;
>> }
>>=20

> I understand what you're saying, yet I'd like to point out that adding
> initializers "blindly" may give a false sense of code correctness.
> Among other things it takes away the chance for tools to point out
> possible issues. Plus some tools warn about stray initializers ...

Right =E2=80=94 if you always set =E2=80=9Cint a=3D0;=E2=80=9D, then =
you=E2=80=99re getting a known value; but if your algorithm relies on it =
being something specific (and not zero), then it=E2=80=99s not clear the =
resulting software is actually more reliable.  If you don=E2=80=99t =
initialise it, there=E2=80=99s at least a chance the compiler will be =
able to tell you that you made a mistake; if you explicitly initialise =
it, then it=E2=80=99s all on you.

 -George

--Apple-Mail=_6AA87F33-84D6-45EB-9BE4-89565F3D7D43
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 9 Jun 2022, at 12:24, Jan Beulich &lt;<a =
href=3D"mailto:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 09.06.2022 13:11, Roberto Bagnara wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
07/06/22 04:17, Stefano Stabellini wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""># Rule 9.1 "The value of an object with =
automatic storage duration shall not be read before it has been set"<br =
class=3D""><br class=3D"">The question is whether -Wuninitalised already =
covers this case or not.<br class=3D"">I think it does.<br class=3D""><br =
class=3D"">Eclair is reporting a few issues where variables are =
"possibly<br class=3D"">uninitialized". We should ask Roberto about =
them, I don't think they are<br class=3D"">actual errors? More like =
extra warnings?<br class=3D""></blockquote><br class=3D"">No, =
-Wuninitialized is not reliable, as it has plenty of (well known)<br =
class=3D"">false negatives. This is typical of compilers, for which the =
generation<br class=3D"">of warnings is only a secondary objective. I =
wrote about that here:<br class=3D""><br class=3D""><a =
href=3D"https://www.bugseng.com/blog/compiler-warnings-use-them-dont-trust=
-them" =
class=3D"">https://www.bugseng.com/blog/compiler-warnings-use-them-dont-tr=
ust-them</a><br class=3D""><br class=3D"">On the specifics:<br =
class=3D""><br class=3D"">$ cat p.c<br class=3D"">int foo (int b)<br =
class=3D"">{<br class=3D"">int a;<br class=3D""><br class=3D"">if (b)<br =
class=3D"">{<br class=3D"">a =3D 1;<br class=3D"">}<br class=3D""><br =
class=3D"">return a;<br class=3D"">}<br class=3D""><br =
class=3D""></blockquote></div></blockquote><div><br =
class=3D""></div><blockquote type=3D"cite" class=3D""><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I understand what you're saying, yet I'd like to point out =
that adding</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">initializers "blindly" may give a false sense of code =
correctness.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Among other things it takes away the chance for tools to =
point out</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">possible issues. Plus some tools warn about stray =
initializers ...</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div></div>Right =E2=80=94 if you always set =E2=80=9Cint =
a=3D0;=E2=80=9D, then you=E2=80=99re getting a known value; but if your =
algorithm relies on it being something specific (and not zero), then =
it=E2=80=99s not clear the resulting software is actually more reliable. =
&nbsp;If you don=E2=80=99t initialise it, there=E2=80=99s at least a =
chance the compiler will be able to tell you that you made a mistake; if =
you explicitly initialise it, then it=E2=80=99s all on you.<div =
class=3D""><br class=3D""></div><div =
class=3D"">&nbsp;-George</div></body></html>=

--Apple-Mail=_6AA87F33-84D6-45EB-9BE4-89565F3D7D43--

--Apple-Mail=_E84EEBFA-12A4-4474-989F-9003B89B2E08
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKh5LQACgkQshXHp8eE
G+3cdAf+MK66lHxuw653pjgr1E1SZYB5Rwjoby92BX5tLhPa7EC6NCMFzin40pEv
yyYkBOvlFBEx7+J3Ju7siKseSWm6dnrdBPeRHb/p0nQkGDARTAN/Fbr5qxrOaur+
DBaSE9lkkeM0l54v3MxspeK8R0GTUMUK92QgFzuDbZjCFVPEdFLKAv80J/eMhC/s
W0C/dShT63JmoHyir3GSQ9CwkWIZfmawVJKL0DviH/9bHEdM45LduHcQoEU0a1Cp
hhk7J1UYnVQgb0qMqDKyUIvtZXbLR9w+eR6tohJAQqRFxpzefgSj34LwosbfSJAS
liHl6cBhmO/7ojw70KA1cV9Z7G6y4A==
=3l7v
-----END PGP SIGNATURE-----

--Apple-Mail=_E84EEBFA-12A4-4474-989F-9003B89B2E08--

