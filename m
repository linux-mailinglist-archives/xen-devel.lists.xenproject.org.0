Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E602588AC0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379780.613545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBul-0006QE-0k; Wed, 03 Aug 2022 10:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379780.613545; Wed, 03 Aug 2022 10:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBuk-0006OS-Tu; Wed, 03 Aug 2022 10:47:46 +0000
Received: by outflank-mailman (input) for mailman id 379780;
 Wed, 03 Aug 2022 10:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZNp=YH=citrix.com=prvs=207fabebc=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oJBuj-0006OM-Le
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:47:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2ed9188-1319-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 12:47:43 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Aug 2022 06:47:39 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by SA0PR03MB5419.namprd03.prod.outlook.com (2603:10b6:806:be::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 10:47:36 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409%5]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 10:47:36 +0000
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
X-Inumbo-ID: b2ed9188-1319-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659523664;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=veWF1bdpfh5dSJptFsfMk+nY7W/saD8jKwHmD0ZAIig=;
  b=IhQy1sarTpy+frU2tWg4huhKuGe8oXhqssiNutOIu94yxwd1a6giQW4n
   Emq5OujibwFmncvHBPOoW+6B/FXJWOkoFMAJFbYV2j5iil13fCX9CRvLq
   4Y2nhGNRWQHHhKsqbt6DBHSUdjhMs858pPIknmnTpvSmujQZ5zxkTFB3N
   A=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 77035230
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HNJmLakuPh4x2e8aZO3pshLo5gyYJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJWjuBa6mNNjfweN90YIW18kIAsZOAn4JrHARr+3w3RiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37Kyp4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kyNr0E9714PF1o+
 PIoMDs9ZRu+tuCPlefTpulE3qzPLeHNFaZG4zRL6micCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAG7gvK+8Lb4ECKpOB1+LPtKtvOZt2DQ4NRn0CUp
 23u9GXlGBAKcteYzFJp91rz2beUwHmgAOr+EpWa/blA0V6R51YBVjoPblSAv+O7oGexDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsQjdfZfQ8ucQxRDhs0
 UWG9/v2ARR/vbvTTmiSnop4thu3MCkRaGQFPCkNSFJc58G5+d5tyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:X1sM5K/XKi0oxWLEG6Fuk+Fudb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8bpYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOReEYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF3CcFkzOQrArGrUWShWNwyEGT3/DRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw1RgUd7DzJm5Xf2eP0A0feNQo/gpieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZeRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGda88aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu198HLzou
 W1bLp1jx9DR6u1M7z+4HRiyGG/fEytGTLw18pZ+591/rXhWbuDC1zwdGwT
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208,217";a="77035230"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvsqcX/gqDlHOMAZdwqpTUzzuCaM3BZym1ij+A9nSqDeirbgd529O7klLR+pNTRPAU822kxP9rDj/TgoKIGAN7Fg/wcurafnoDYL3ue/VuW0NOHagVpnVLhJXAzEEDpaCSBh4DKFsFnrhav9ujIkau5plamwYVQfBcriKhhq8Hhbqe8SUuBB48Su8VndxpSDNvZlOnunAX6RxOzKaSjbE/Cvq7fSkWB60IPyDNGm9uPyRlhTF/HeWzXS8RQv08L8Nu3vUz2lYJOOQimaedWZ+E/leDcHJGKmLeDZ9C/zC10GJPlcZ8gYv1K5EtaIZ6EyLC/V5vWgWs4q37VdVQQJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veWF1bdpfh5dSJptFsfMk+nY7W/saD8jKwHmD0ZAIig=;
 b=BFjuK+yrN0WlnEK7xhBpVDLXIBG9DtjZ85s+XQo0DCpY5nwJGLq9F5S7hUuS1GR51cmy0tDdMzLbxXbgXbjxml3ufZ52mIvbJlq9r+Md7k3g36Iq27saa3pyxAKDDFDNC7hmdcGer1zhx9h/x9RYWVArt9d22sl8tyJ0K3iHZqG05eA8JoaxdWM3oIBZNcNxIasGgNp5MakmgbAp+Y0XxwE12fdHg7wNAyBDghbgRtiBv9eEMEVkB7WnPzMfuSZQILbl6dVdfVf+CNdQtswmfR/O/6TifzDfDMt2eWUAjLZT0XUn76XZTIbSjoKdy+Boxlsjoj/+NKtQRnvEab5/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veWF1bdpfh5dSJptFsfMk+nY7W/saD8jKwHmD0ZAIig=;
 b=o9ufax8VjEpeS3sN5BofxqimM2H6BgnTV1OeiWQa2llgnizZS7PFUdqSO2bEtnFFGWgyiKB/d8lZt0NmIHcUprkR2kuH76I0eqCRlbY3CPhMaILwpJeM3woQ7jAlTe9wsoImBA5KgWzDmNO/7yigcUIauMIl5PmzSqULCL+Bx5U=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 5/7] tools/ocaml: fix compiler warnings
Thread-Topic: [PATCH v1 5/7] tools/ocaml: fix compiler warnings
Thread-Index: AQHYo3Q92aLfQ5z7jEOjsQTVnpAyA62dA6CAgAACWYA=
Date: Wed, 3 Aug 2022 10:47:36 +0000
Message-ID: <FD21D306-CBDF-4AFB-B7A8-9F39FF6794D3@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <23dcc916bff25d0545c167833d99aa73b8a4c8da.1659116941.git.edvin.torok@citrix.com>
 <89416414-2bbe-a6cf-5e6a-1ab97ad5c15f@citrix.com>
In-Reply-To: <89416414-2bbe-a6cf-5e6a-1ab97ad5c15f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bb12b59-0892-4648-435a-08da753d9421
x-ms-traffictypediagnostic: SA0PR03MB5419:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 A9/sgHyEEZjWxTmom34xD/CRJ+gkFzwzQ2ub8Sj4NX/TK0sRSP6Q7qV99UigpBixOuJ5MBWyMjOheseRB46ySAXZOLZ6RMBdydv4RQmfivg6UL8FNvJM4CRz0IzUreku69Mz55/UOUxj1uDydl8mRioeLQmdlpK4D3i9rVk+ZF6gT6XYhOonvPS3V7SC+sbbJumn5JzcX1k981lfiVHWD/bQVQapbX4pT/p+y89rne/Xqm0fbPXtWOWNmf+wRQq/JZEgkAyW7whTviBRSg6W2FJ6Cnn/jGrpAEdJ/FUt/QpymyDwdJDugTL9jdE7sSeAqQh1JAA0bC5iE5el1RKdqQ1K5Dxi18jMrfR1HiXbGI9GSR7wEfYW9ZAAy+xa2Kz4iswyY4qZt1KmEMv0loa4K3LnlQEsQGgKhfsE5MOKdpfrxb5akkONnwH5UXL3zZLEi+IDDOiae2DMv280gaOftbwiF7jritH2oF/4AVDfsxYwlvTvKAcUp+iUj+ayLY3nVuSmWcD2wdYVvFpqPZ5/bpr/jcjHTd4FtavfgzCFoW67INY8YFJaJDJ0f05JKoYp0heZph+jqF5LWJO39sNfHmAic1aQ3/VNFmQbJ074trXm69vFvtK5v0G+cC+aoQgaj+HN4AbKPUqHfnjN7OPv0aJsYjZ/j/Z0H9mSRt8G48MsScKpdDV4rB67oLRMmf6I0ieD5qD/+Yzj/qMWtMsyeJ2XLMi/FUS8IRknDLMqHmWD0ulXIuDqOuhtWlYWM/21+DA/Iw5WhVEL3ZfRhKxJPnzoC0WVQaNDGUGuz8TkNRV54YVizg1QIrxK5K7CXJJnvpEW/6FCjMiFVI5OSbKvwAOlytfiX0R/1EEMVedBDXg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(4326008)(8676002)(91956017)(8936002)(66556008)(38070700005)(83380400001)(64756008)(76116006)(66446008)(66476007)(71200400001)(5660300002)(66946007)(2616005)(186003)(44832011)(33656002)(478600001)(6486002)(4744005)(110136005)(6636002)(36756003)(54906003)(2906002)(107886003)(316002)(38100700002)(122000001)(41300700001)(82960400001)(53546011)(86362001)(6512007)(26005)(6506007)(3714002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGllMDNFb0FhUnJCNFBrWldtQTB2QkpmejRBZm5MOTlwYXBpWkxOVEg5b1lk?=
 =?utf-8?B?OWpoOGZsU0c2Vlp4RFJoSXBWc01KM2RIQkM1Zm9Bbm1IaVdGd2JQU0swRUVh?=
 =?utf-8?B?ZHRKMXg4cElLTGR4QUdxcE5jaXQxUUdFZzBseGpzVkRhSlhkWEMwVDMvazNu?=
 =?utf-8?B?a0QrZXRjM1U1eWd3UmZoQlV6d3BXY2QyMTMwWjNKZUpWL2tMM1FuU0xOK2lL?=
 =?utf-8?B?bndzZzd3RytDNGJuVWFGcHRwZGlrbTA4TFRTMDFWWGs1YkNXbERGVEtHRWZj?=
 =?utf-8?B?UGdYT1l6NFh1bkE3eXIvVmlNdUxnUGQ0eWJET3FjQlRUa2JFODdLaEU0bTV4?=
 =?utf-8?B?U3g0WmJpN2xMYUE3b2RQdkNoaFpoQVV6M2JQbzBlVldhWEkrU21mNEl6bnNl?=
 =?utf-8?B?a2RxNW5QWnl0cUV2YjNhUEtDdWRLK2piYkMxM2RIMFVJTHpiRnU0WG1nbDJ3?=
 =?utf-8?B?TDVaYVVvVTdaOG5SRzZ1SUZwNm1IVWVmVk9oSnZSU3kyeTFIN1F3bXl0eURG?=
 =?utf-8?B?bkZEMjhuQ0lsUTBOcCtWWXI3NFpjajBDT0xHbkpGUHB1SzE1QmtxbndMMlJy?=
 =?utf-8?B?ckxDL1Z0MnU5OGQydlh0VW5uZlliVURMOXJOLysyZEdrQ21OaEZ4bFIrMnpj?=
 =?utf-8?B?ZW52NGM0N1dXSHk2MWd0eEJEOXNlMG01UnRMemVsR3IvdlYxK0QrYTlERUlS?=
 =?utf-8?B?azNQWU1HU1RWK3A4enFJaDUwWDlTKytvejhNdmE5Tm9YWDFsY3o2YjVDbUsr?=
 =?utf-8?B?WE5tdkVReUFxTm82L2phNnA0alNSVFBaQitIY0pHY0htVlVrenNzOWNTZGRo?=
 =?utf-8?B?RFRlcThBQlBCalBKOUowYld5NkxYRXo2ZEsyU0kza1FGaDI2UHEyNmoraUpM?=
 =?utf-8?B?T2EzOXErNko0R0dKSHZ4MFpoTDZrbjd2SDIwOUNrYkJhTWRyTlpZUE56Zmow?=
 =?utf-8?B?ZGV0NkVCcE1zSVdKV1dNeVVYcmtvcXo5R29GWHhCTEZJc0l0WldUbzg2ZUZU?=
 =?utf-8?B?eDF6K2V2RHdqdEMzNktJUzJkcm5xMm9hUUY0L1JjQWdWc0ozYTI5K1N1ZzR0?=
 =?utf-8?B?YmtZandycnJRUlpBeWdxWFVmVlF3dmxuSERXT1ZreGZSdFRNdFNuY0pqSHg5?=
 =?utf-8?B?VEM5MElDeTF5K3Zoc3RhektTL3JpY1dvazlQVUNTalpCc0ZCcnFXdTU3L25N?=
 =?utf-8?B?R1NFSnFlaVZQVHlhaHNrYmtQY1JhbFNPazJpV0JkNzVoVHNDb081M2lqbFNw?=
 =?utf-8?B?TkIrVGNUWFhqa2NRUWVGczdRbnV6NWE4M2x2aGE4d01ORFBoZi84U0RDZmIx?=
 =?utf-8?B?Y1Y4ei9CN1djbE5SYmdKVTk5ajUxSytnRC8zNXA5WFE0RjlGTjE5anJPQ3ky?=
 =?utf-8?B?ZVh1ZmVyNloxS2tGRUo5ZHlrNkh2Znh4RGRyc0IvYlo5eVgzdzF4RUZMSWZk?=
 =?utf-8?B?bkQvL0x1Qm5VcXhOMGpkNVJlS3RCZWtaWE53UTlzd3A4Ui9WVTcwNDM5cXQ1?=
 =?utf-8?B?SGJ4M0hncWhENmJZNktpUFZTSmE4NVJvek9EMGl0K2w2REl5MkNIMS9jSkt0?=
 =?utf-8?B?cU1HaFl3cDBFei9BaVpDREkyT1UrSDBhc3lVTzMwVHVMWjhqMU5aUlJjNjVm?=
 =?utf-8?B?M3hYUnBiK1BYTlhMcjNleG4wOTkybjZrWjZBRW0xUnBlK3NkcFlHQzBENE5T?=
 =?utf-8?B?SmJWUGowRmVZYXNJNzBuY1ZvMkt0MHo2LzAzdzBCampzbVN6bytMczNRQ0N3?=
 =?utf-8?B?NTBHdFRxakhralR2YXA2WitybFpnaGVQQVNjWnlCVldpY1U2SXh3NlZlRFpQ?=
 =?utf-8?B?ZmFaeUdHS3RXM2NzUW9OQVlBaGhZQVh2bFZQREtHSldXSHdrTnYwNGVMOFQw?=
 =?utf-8?B?a2c1UTAwcDNoL1dCUXBPa2t5cG1Jdzg0NmcwNmIyRzhBemNkdUtxb2hPM25G?=
 =?utf-8?B?U3hjRGtIQ0JkZ0hnWVFsM1U5VWFrTys3eVRmOHBKTDdOSnpPb0IyY3hScUtj?=
 =?utf-8?B?YnFKS2FMdHdkU0d2TFAxZHg1bmsrYkxCUEhqWTUrLzVHNXNIbEJMT0JHWXhi?=
 =?utf-8?B?dWorVGt2USttaUFDL2lnV05IVTVBbXdXQUpYK0VVYjhHNWpOWGFNZ0ZlT2E4?=
 =?utf-8?B?UVduN24zTUdlQWZMZG1FajJhTFh2RzM4ZHJmSGRnZVFiVzlQOTk2NWpHNFBo?=
 =?utf-8?Q?qDtf085Bqwbf2SmPgSVE72I=3D?=
Content-Type: multipart/alternative;
	boundary="_000_FD21D306CBDF4AFBB7A89F39FF6794D3citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb12b59-0892-4648-435a-08da753d9421
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 10:47:36.4853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNclTCrykOHtf4+SL62KDKITyMUe7ZX8akL4VV3/pwbK2IC+4Nvb5KN3A+W+/RYcwS1fuxSUlgaobPruc6kldio5pet1VFI3aX5MB+uy9EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5419

--_000_FD21D306CBDF4AFBB7A89F39FF6794D3citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDMgQXVnIDIwMjIsIGF0IDExOjM5LCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPG1haWx0bzpBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPj4gd3JvdGU6DQoN
ClRoZXJlIGFyZSBubyBzaWRlIGVmZmVjdHMgaGVyZS4gIENhbid0IHRoZSBsaW5lIHNpbXBseSBi
ZSBkZWxldGVkPw0KDQpZZXMuIFRoZSBjb21waWxlciB0ZWxscyB1cyBhYm91dCB1bnVzZWQgYmlu
ZGluZ3MgbGlrZSB0aGVzZSBhbmQgdGhpcyBpcyB0aGUgZWFzeSB3YXkgdG8gYWNrbm93bGVkZ2Ug
dGhpcyB3aXRob3V0IHJlbW92aW5nIHRoZSBjb2RlIGJ1dCBpdCBjb3VsZCBiZSByZW1vdmVkIGFz
IHdlbGwuDQoNCuKAlCBDDQo=

--_000_FD21D306CBDF4AFBB7A89F39FF6794D3citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2EAECBBB5D30044DA8E1614417C55769@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDMgQXVnIDIwMjIsIGF0IDExOjM5LCBBbmRyZXcgQ29vcGVyICZsdDs8YSBocmVmPSJtYWlsdG86
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbSIgY2xhc3M9IiI+QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbTwvYT4mZ3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNzPSJBcHBsZS1pbnRlcmNoYW5nZS1u
ZXdsaW5lIj4NCjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwg
MCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHls
ZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBs
ZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2lu
ZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjog
bm9uZTsgZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+
VGhlcmUNCiBhcmUgbm8gc2lkZSBlZmZlY3RzIGhlcmUuJm5ic3A7IENhbid0IHRoZSBsaW5lIHNp
bXBseSBiZSBkZWxldGVkPzwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwg
MCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTog
bm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0
ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsg
dGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzog
MHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9u
ZTsiIGNsYXNzPSIiPg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxiciBjbGFzcz0i
Ij4NCjxkaXYgY2xhc3M9IiI+WWVzLiBUaGUgY29tcGlsZXIgdGVsbHMgdXMgYWJvdXQgdW51c2Vk
IGJpbmRpbmdzIGxpa2UgdGhlc2UgYW5kIHRoaXMgaXMgdGhlIGVhc3kgd2F5IHRvIGFja25vd2xl
ZGdlIHRoaXMgd2l0aG91dCByZW1vdmluZyB0aGUgY29kZSBidXQgaXQgY291bGQgYmUgcmVtb3Zl
ZCBhcyB3ZWxsLjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxk
aXYgY2xhc3M9IiI+4oCUIEM8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_FD21D306CBDF4AFBB7A89F39FF6794D3citrixcom_--

