Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C125F53211D
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 04:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336120.560429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntKVE-00036i-6F; Tue, 24 May 2022 02:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336120.560429; Tue, 24 May 2022 02:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntKVE-000346-2t; Tue, 24 May 2022 02:42:32 +0000
Received: by outflank-mailman (input) for mailman id 336120;
 Tue, 24 May 2022 02:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQM0=WA=citrix.com=prvs=1363f17a3=lin.liu@srs-se1.protection.inumbo.net>)
 id 1ntKVC-000340-GF
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 02:42:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 258d2c41-db0b-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 04:42:28 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 22:42:25 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by DM6PR03MB3609.namprd03.prod.outlook.com (2603:10b6:5:b0::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 02:42:22 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 02:42:22 +0000
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
X-Inumbo-ID: 258d2c41-db0b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653360148;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=a3EYxop9xFB3YlPo5wYiD2gcP9bL1SMloLGnyuaK6AY=;
  b=Hue7R8DOtkLP76YZAXbfLxkkPwr8xkLS301dmLn28sYm12KbaXEJDKVm
   yNkBbTJXivQZjAj7KjChdSAlbmJzqj4dY1WQidW2TJe7Ng9jScyYyXbyp
   yx274FVfzZIa9c4U2vlIISrrsbPPGhYOCriQ8lChtzNi0WPwxTMbQdxmB
   c=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 72403662
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vg7flaCuWHSHgRVW/xziw5YqxClBgxIJ4kV8jS/XYbTApD8m0jwGm
 jAZXD/TPK3cajT9eNx1aoy2px4OsMTczdE1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nj2dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh3y
 +lIv72TWT55BarSoO4tdSRTNiVhaPguFL/veRBTsOS15mifKT7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6h4B8ydK0nJzYYwMDMYgsFIW/Lfe
 uISaCZ1bQSGaBpKUrsSIM1kwL/z2CelG9FegFbO/LIHzFHa9TNSjeX2GdPqeoOoaOwAyy50o
 UqDpQwVGCoyNsGbyDeD2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ84TEypKI/8EiqSNjVXBCipnOA+BkGVLJ4GeAg9BuEzKaS5g+DH3UFVRZIctlgv8gzLRQo3
 FKUm9LiBRR0raaYD3ma89+8sjeaKSUTa2gYakc5oRAt5tDipMQ2kUjJR9M6Sqqt1IWpR3f33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:7P0+Mq5TYlscS1if7APXwX2BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTP2ftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkyNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9p1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUZpDKh8KoDOCW/sLlXFtzesHfrWG2nYczGgNkBmpDu1L/tqq
 iJn/5vBbU115qbRBDJnfKk4Xid7N9p0Q6v9bbQuwqdneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KIoM3R3am+a/hRrDvDnZPiq59hs1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgl/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M0OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDKDgDKFC7a
 gpfGkoxFLaIXied/Fm9Kc7gizlUSG6QSnnzN1Y6txwpqD8LYCbQxG+dA==
X-IronPort-AV: E=Sophos;i="5.91,247,1647316800"; 
   d="scan'208,217";a="72403662"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaNYl8sI1bO5ibrjpwo5pEpCnzlSwUO/nEYXNOGS6I81YBlLPDcfQk6psIwyKAtJCirdIimdebaSNncP8DO3Cona/9AA6+9aoJXaqYmhanIxAdJh1FZ1M4tOLN9bSZ0G1x0as9OSSlW9a+z+D2SmpUJhr7bBl5xIc4qQHfOkJvEJ4FPqY3KkspFTCMHB9wTE2S41M15fYsDhFZJpzP2Bg8LlriansYeSs3hKWm8qehVzC6QWWir7bpP8o/E2C0CjTI8dkhYAAnOqFFtVR2smCu2HKHwwx0PZyn9mqV84U3+aFcs+hCiZD57E50ulUQSq34P685MmsCQKYKUlcw1JRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btQu1+JhWRACZ6gKW1IZmt0eOUl+jSSrhbLd3Y9cRRU=;
 b=fBD59Q5agODuWtIQ3E4HdBvgPE6c6AO9c/ogyMTwjWGwBb5FhJefDOWgQL9tvIZXfP/p9tcaRZNBo1rCc570zd7M+8EgNHPHEj+3vP/IPV7/T+LmUniIdS3rO26Kw9DaJ+0Vyaqoq9hZ4ZYrP2oiMZ31m4hdrlZ0kjCCIoKn8o2kTz1zTXSHckNYr/MVI6hvORXC7qEYv3/6kpMrR5F2R0Uo8gkpzC8iRt1hexpMLpansyPsW0167kPuypvoKPFUbKUPLC3eP2mJQbiP6yCq5TBd6nXl2owSZRCZSMZyKCTvekDCrh9AW4VTGBz6YZVWkLIiGwPNAAvvqC7+TA++JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btQu1+JhWRACZ6gKW1IZmt0eOUl+jSSrhbLd3Y9cRRU=;
 b=JUL4pCOAI8cEDdY0ywG6h7cfnBRy5xmX2RvtYTAy1SL+G2W9FGBFhhDKF3RwzqnxLQFzz3O/Xx2mSlCgZMERw0gx120iUq24+ZhcXs2myda8K3PI4Ma81Pumo5Ck77VKA8vwQK4Rk2LLBKDY2R48hek+IV/oXXubWw6X5Ewc+go=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Julien Grall <julien@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 4/6] xen: Switch to byteswap
Thread-Topic: [PATCH v5 4/6] xen: Switch to byteswap
Thread-Index: AQHYbrSjsRt5f6mJt0SG0aSZHEYt8q0sjRSAgAALyQCAAAeDgIAAsawQ
Date: Tue, 24 May 2022 02:42:22 +0000
Message-ID:
 <SJ0PR03MB5405D2D60515EE9C02761FE79DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <dcabb541d0b5ab7858ccf1c925afc334f3123ad5.1653314499.git.lin.liu@citrix.com>
 <8fcd30a6-9b93-6687-a0f5-1e035fa5f789@xen.org>
 <d77a5995-a916-70a9-4bf2-efdb2948588b@citrix.com>
 <1c7342ed-63af-e420-4f3a-938cb93021c7@xen.org>
In-Reply-To: <1c7342ed-63af-e420-4f3a-938cb93021c7@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb3d509-b543-463d-d510-08da3d2f079f
x-ms-traffictypediagnostic: DM6PR03MB3609:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB3609D03D59B0A78738A4EBD39DD79@DM6PR03MB3609.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Cg8gHGO1SxRocznV+rGBDNnV/PU0ZXmjGzacxZ4krrlsP8OahZ1yGVQTOScqdAJF7ts13iaLL8YfyjmkhXh78+kdIHt84pk4/K7s27axc+byBScqRXUpCOqSCnlyr18T8K2bVlmfxUswxfT91HmoSk/TJJu/rcIfqtSs2g2PlSPng+D9ofmdw2Db1OpxVmbcICWPHA1Gcrui7Fen8cr3UPK2FT8JUgUfD18Szh1W1izW0FA7eQZUwpPh7QUFYKFNdB/L5luVn3ueN8BajbEsEduD8EDWouS2gPoiEFFg+5670lFv8EruEm5BcT7+B3uJxj5+DdNsvYiHdoW+ReQLZnLcBWB7ohTswDzTw2hMnWeInHm5I1RuKjQvvEuryp4Jn6EVU/Rcil6jbqpsxQAUIrUyX+2BJhzSn2qeod9OKFVfRQvJB+Xg10ix7+0DiJeIVvQthdhvD5UXIgxWaYtMIkawi91kwqrBgTr0eFTJVDRFgoHxJ2fF1Ujrb2WwdGJKm3bbmyAADojwqRHHoQdPD8oy1c9n02Dh0sy4P6mBpA4VDNwAAbTnx3SEIErmgtju1wrpYNWEFRBL88OizbJ1mQ/SZiOPuT61pA/TopIwpYvwEtxzokcUujQUxd1yPtroTrdTZ8kfZQKdjL2UXOVJa0YrA7R23P2rXtsCx8W4a47Y3iwOR7nmSul1F133qZFSb8rEsYSJH7WghVpqXU5sxw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(53546011)(83380400001)(508600001)(186003)(9686003)(6506007)(86362001)(38100700002)(38070700005)(316002)(110136005)(64756008)(54906003)(66446008)(66556008)(76116006)(66946007)(66476007)(71200400001)(26005)(8676002)(4326008)(91956017)(2906002)(85182001)(5660300002)(8936002)(33656002)(55016003)(122000001)(82960400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?R0NnQXlkNURxWHJjVmFZM2NaMm5sMzhtRHJuK2trZnRyOWNNc3l6NlE3Q2JP?=
 =?gb2312?B?M1k1ejU0c0RZRDlhRHJHTFc0TWIxOVNWSndyN2I2OWV0M2hHYktNT21OMkVH?=
 =?gb2312?B?T3FTcGRaTWhCTUFjNFRqSTFHUG96RFB0VDBINUNPZnMrTWNDdGFvV2d1c051?=
 =?gb2312?B?K3hHZnVnVGppT0M4SEludUNUd0Y3bHgyRzRwalpzM1VZOE1zK1F3RnVMU0Y3?=
 =?gb2312?B?Znp6QnpLQ2ltQkthRzNTSWR3aWlRMUJFWTZkNzhabldsZ1gweEN5NXd3ekV2?=
 =?gb2312?B?ZDhRSlVMa2N0L1JwVGZ3Wlg5UGljMVhyVFlNaTZPZ2U0Y2t2NFFOU0xMMnBn?=
 =?gb2312?B?b2xpUnJodGJWM0grWUdFcWZpQWp6L3lwemwrbTRQWGhiWFk5QkIyc2trQUJa?=
 =?gb2312?B?NnFsTGhJM3pRVWYwUnorRmFlakVObStEcTdpVlFoQkNYK0ZQRFVob05udHNK?=
 =?gb2312?B?eGllZGNWcXlMOVhDM2w5eWRpSHhkNXZKV3dVWlRWY2RoS0Q2SnVXbzhKYzhW?=
 =?gb2312?B?dG1meS9sRjNIT2FNZnV4WEFLanJSTmdUMlUzZHVwTkVDSTVFemNHMHNsSzM4?=
 =?gb2312?B?RVpTOVdUdlhHQmtScEtCQU1MaFlWMDFjYUlYTi9pUFR0ZGxmTFJEb05DR3Iy?=
 =?gb2312?B?dzBSTnc3ZW5laFdSTVdmeU0xME5CWHRoZjcwaFJiQzlxaHBad0xVZTVkejRP?=
 =?gb2312?B?V05ZM2VUZWl5bFJxOTVHdXlsUWgvOU03ZkphbG93bXpQQmJWajM4N2prYmRG?=
 =?gb2312?B?L0UzL1pwbVpxL1JiUHliUHdtcWVRTDNTZDJyUHNWNjZTa0llQmp5RzZMTlIz?=
 =?gb2312?B?WE1MTVBXT2RZdVE0dnRRVHVqNDRrUGc4Q0VxekEweGpWbi9tUGpDY2trVWlR?=
 =?gb2312?B?MkRpNnJsdnE2RUpYcnVmT3hsTGRCTjlUYVptRU1tVFI1M3Bwb2RGWnZHaW55?=
 =?gb2312?B?cU03RXRUMDM3Tlk5b1RLWlNZVFI2K3ZwRUo1Rll0QXhRTnB2WUxxM3hQWitw?=
 =?gb2312?B?S1Q0ekxwa3ZWTGxpQjFqKzZteldqU085Z2M4RTNLd1MxY29vc3A1dGN2VnRl?=
 =?gb2312?B?ZEFiNGpnQzBpcDdWcDR0R01yVkh4bmwvWUtFM2UzN2RBMXVxdUxRSHRtdmdM?=
 =?gb2312?B?MlVlWEZXYURKbHJSMSsvaUxLbmYrZHoralhJV0o0N1Y0MjQrYi9oQ1BSaWxw?=
 =?gb2312?B?Z0IxVHBMQ3VzN3FmNUZ4ZmVzdmNUWDRqT0RRVlVha2lmTkRNUTVpbk5hb1NU?=
 =?gb2312?B?UFB2bDg4TW83TllmbGk3a3FXK2lOMFFhVTNad3ZSNERjemJlS3RRWmtEcEtj?=
 =?gb2312?B?aGtRZ2QxbDBLYUgwQ2V4UExDN05penNSR1YyVHljTm9LNHNraTRlTXFYK1RP?=
 =?gb2312?B?OTlOR2JOVTI0VWh4ZW05Z3U3cVJ2RW80c2NFSEhLS3hRTStPcGJjTnl0QWhR?=
 =?gb2312?B?Y3dZdkFxamRzbmJNZFpDV1F5OWQ0bDdlcXM5cVJ3STdUdGJvNEN3a0pBaFVF?=
 =?gb2312?B?M05Xb2tSTXB2em1aKzRRbnd0Mlg2bk9UR3BBTW5sRC9BSTBUM1BEQWd1cHc5?=
 =?gb2312?B?SUM3RjNHTkRYL2V2d1VsKytyR3o1ZWFpeDdhNFlDWWtqN3hWQVFZUjU1VC9T?=
 =?gb2312?B?Wk1DS1h1eTF0Si9NQWtpRHJPNkdQZTRVUDlHZnZ3RURTcGE1QUthamxOOC80?=
 =?gb2312?B?cFROTkhWMnJIQzBCekUybm8vQW5OczJqaGh3M0dEamloTVpDRzU1U281Wm9x?=
 =?gb2312?B?YWs4M2MvYUJ2MzAvUTdjRTlzbFFiUC83WHNTUTloR0tVUmpOb29Lb1JlVGdM?=
 =?gb2312?B?WVVTc2hMdWpvNkR2YjFwWXZ4Mmd5dmdxMm14OE51VDMzQUNWL3E3cmtiRE1I?=
 =?gb2312?B?a292cUNESWI1bjdXR0FJZVNjQUsvOHRrb3JlaEk1cHI2U24xSlhQeCtVMkVG?=
 =?gb2312?B?MWZnZy9FWlUrUnp6RWpsaEpCZ05qVnlmWmw5S2VkeCtMamkwMEZBQXVqaEdB?=
 =?gb2312?B?SlNiR1hBRURYR2d2NytsTCt1K1FIc1Z5bU1KeVdOWE5Da1MrNnNWOEJNRzdM?=
 =?gb2312?B?VXlDME51bm1uYUt4ZDVYZG5Kbm5LRG1nNm80TngvVmhnblVsdGVKd3VRVnZh?=
 =?gb2312?B?Q1NxOVlZOE9kL29xVU5LUFFLQmlManA3WTFobnB0UDh0MFpWZGVHWUNiUnFw?=
 =?gb2312?B?aXBkMEtJZFFyd0lERDFtOW9FK3A3UWpNenlMa2tkbzA3QVcwRi9zaUR6eGtk?=
 =?gb2312?B?RE42bUFwSFNqU2RiMkhPUTNlTWR6Tm53dURMOG4rV0dvOHE2NlF4dnJES2N1?=
 =?gb2312?B?YUV4ZkR0cWlZRmhhWWxLMVdIdjAyTGp0aUZ6VUhScTMwNGZEdjNiNW12a3Rw?=
 =?gb2312?Q?wPy39RtdpX7wDw34=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB5405D2D60515EE9C02761FE79DD79SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb3d509-b543-463d-d510-08da3d2f079f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 02:42:22.6863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DYYWhUf5d2B2fwk7N1NqGQMaG70VKUhzEC7bH1TsWshE0aleXOeYPuMjyOQKm6CEaoKS7kAeQp4OrfZh4r0lOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3609

--_000_SJ0PR03MB5405D2D60515EE9C02761FE79DD79SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

PkhpIEFuZHJldywNCj4NCj5PbiAyMy8wNS8yMDIyIDE2OjM4LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4gT24gMjMvMDUvMjAyMiAxNTo1NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0K
Pj4+DQo+Pj4gT24gMjMvMDUvMjAyMiAxNTo1MCwgTGluIExpdSB3cm90ZToNCj4+Pj4gVXBkYXRl
IHRvIHVzZSBieXRlc3dhcCB0byBzd2FwIGJ5dGVzDQo+Pj4+IGJlKl90b19jcHVwKHApIGlzIHNo
b3J0IGZvciBiZSp0b19jcHUoKnApLCB1cGRhdGUgdG8gdXNlIGxhdHRlcg0KPj4+PiBvbmUgZXhw
bGljdGx5DQo+Pj4NCj4+PiBCdXQgd2h5Pw0KPj4NCj4+IEJlY2F1c2UgZGVsZXRpbmcgY29kZSBv
YmZ1c2NhdGlvbiBjb25zdHJ1Y3RzICppcyogdGhlIHBvaW50IG9mIHRoZSBjbGVhbnVwLg0KPj4N
Cj4+PiBJIHJlYWxseSBkb24ndCBoYXZlIGEgc3VnZ2VzdGlvbiBvbiB0aGUgY29tbWVudCBiZWNh
dXNlIEkgZGlzYWdyZWUNCj4+PiAoYW5kIEFGQUlDVCBKYW4gYXMgd2VsbCkgd2l0aCB0aGUgYXBw
cm9hY2guDQo+Pg0KPj4gRHJvcHBpbmcgdGhlIG9iZnVzY2F0aW9uIGhhcyB1bmNvdmVyZWQgcHJl
LWV4aXN0aW5nIGJ1Z3MgaW4gdGhlDQo+PiBoeXBlcnZpc29yLiAgVGhlIHNlcmllcyBzdGFuZHMg
b24gaXRzIG93biBtZXJpdC4NCj4NCj5JIGFtIGd1ZXNzaW5nIHlvdSBtZWFuIHRoYXQgd2UgZG9u
J3QgaGFuZGxlIHVuYWxpZ25lZCBhY2Nlc3M/IElmIHNvLCB5ZXMNCj5JIGFncmVlIHRoaXMgaGVs
cGVkIHdpdGggdGhhdC4NCj4NCj4+DQo+PiBXaGlsZSBJIGNhbid0IGhlbHAgaWYgeW91IGxpa2Ug
aXQgb3Igbm90LCBpdCByZWFsbHkgZG9lcyBicmluZyBhbg0KPj4gaW1wcm92ZW1lbnQgdG8gY29k
ZSBxdWFsaXR5IGFuZCBsZWdpYmlsaXR5Lg0KPj4NCj4+IElmIHlvdSBoYXZlIG5vIHRlY2huaWNh
bCBvYmplY3Rpb25zLCBhbmQgbm8gc3VnZ2VzdGlvbnMgZm9yIGhvdyB0byBkbyBpdA0KPj4gZGlm
ZmVyZW50bHkgd2hpbGUgcmV0YWluaW5nIHRoZSBxdWFsaXR5IGFuZCBsZWdpYmlsaXR5IGltcHJv
dmVtZW50cywNCj4+IHRoZW4gIkkgZG9uJ3QgbGlrZSBpdCIgZG9lc24ndCBibG9jayBpdCBnb2lu
ZyBpbi4NCj4NCj5BbmQgeW91IGRvbid0IGxpa2UgdGhlIGV4aXN0aW5nIGNvZGUgOikuIEkgYW0g
d2lsbGluZyB0byBjb21wcm9taXNlLCBidXQNCj5mb3IgdGhhdCBJIG5lZWQgdG8gdW5kZXJzdGFu
ZCB3aHkgdGhlIGV4aXN0aW5nIGNvZGUgaXMgdGVjaG5pY2FsbHkgbm90DQo+Y29ycmVjdC4NCj4N
Cj5TbyBmYXIsIGFsbCB0aGUgYXJndW1lbnRzIHlvdSBwcm92aWRlZCBpbiB2MyB3YXMgZWl0aGVy
IGEgbWF0dGVyIG9mDQo+dGFzdGUgb3IgSU1ITyBib2d1cy4NCj4NCj5Zb3VyIHRhc3RlIGlzIG5v
ciBiZXR0ZXIgbm9yIHdvcnNlIHRoYW4gbWluZS4gQXQgd2hpY2gsIHdlIG5lZWQgc29tZW9uZQ0K
PmVsc2UgdG8gYnJlYWsgdGhlIHRpZS4NCj4NCj5JZiBJIGFtIG5vdCBtaXN0YWtlbiwgSmFuIGlz
IGFsc28gb2JqZWN0aW5nIG9uIHRoZSBwcm9wb3NhbC4gQXQgd2hpY2gNCj5wb2ludCwgd2UgYXJl
IDIgdnMgMS4NCj4NCj5TbyB0aGVyZSBhcmUgdGhyZWUgY2hvaWNlcyBoZXJlOg0KPiAgIDEpIFlv
dSBmaW5kIHR3byBvdGhlcnMgbWFpbnRhaW5lcnMgKGluY2x1ZGluZyBvbiBBcm0gbWFpbnRhaW5l
cikgdG8NCj5hZ3JlZSB3aXRoIHlvdQ0KPiAgIDIpIFlvdSBwcm92aWRlIGFyZ3VtZW50cyB0aGF0
IHdpbGwgc3dheSBvbmUgb2YgdXMgaW4geW91ciBzaWRlDQo+ICAgMykgV2Uga2VlcCBiZTMyX2Nw
dSooKSAodGhleSBhcmUgc2ltcGxlIHdyYXBwZXIgYW5kIEkgYW0gd2lsbGluZyB0bw0KPndyaXRl
IHRoZSBjb2RlKS4NCg0KUGVyc29uYWx5LCBJIGFncmVlIHdpdGggQW5kcmV3IENvcHBlciB0byBy
ZW1vdmUgdGhlIGJlKl90b19jcHVwIGhlbHBlcnMgYXMgY3VycmVudA0KaW1wbGVtZXRhdGlvbiBp
cyBqdXN0IGEgd3JhcHBlciwgbGlrZQ0KDQojaWZuZGVmIF9fYXJjaF9fc3dhYjE2cA0KIyAgZGVm
aW5lIF9fYXJjaF9fc3dhYjE2cCh4KSBfX2FyY2hfX3N3YWIxNigqKHgpKQ0KI2VuZGlmDQoNCldp
dGggYmUqX3RvX2NwdXAgYmVlbiByZW1vdmVkLCB0aGUgaW50ZXJmYWNlIGtlZXBzIHNpbXBsZSBh
bmQgY2xlYXIsIGFuZCBjYWxsZXJzDQphcmUgZGVyZWZlcmVuY2UgdGhlIHBvaW50ZXIgZXhwbGlj
dGx5Lg0KDQpJIGFtIHZlcnkgaGFwcHkgdG8gc2VlIHRoZSB0aHJlZSBjaG9pY2VzLCBob3BlIHdl
IGNhbiByZWFjaCBhbiBhZ3JlZW1lbnQgYWJvdXQgdGhpcyBzb29uLg0KDQpDaGVycnMsDQotLS0N
Ckxpbg0K

--_000_SJ0PR03MB5405D2D60515EE9C02761FE79DD79SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;margin-top:0cm;mso-mar=
gin-bottom-alt:0cm;mso-margin-top-alt:0cm;mso-add-space:auto">
<span style=3D"font-size:11.0pt">&gt;Hi Andrew,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;On 23/05/2022 1=
6:38, Andrew Cooper wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; On 23/05/2=
022 15:56, Julien Grall wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; Hi,<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;<o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; On 23/=
05/2022 15:50, Lin Liu wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; Up=
date to use byteswap to swap bytes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; be=
*_to_cpup(p) is short for be*to_cpu(*p), update to use latter<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; on=
e explictly<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;<o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; But wh=
y?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; Because de=
leting code obfuscation constructs *is* the point of the cleanup.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; I real=
ly don't have a suggestion on the comment because I disagree<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; (and A=
FAICT Jan as well) with the approach.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; Dropping t=
he obfuscation has uncovered pre-existing bugs in the<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; hypervisor=
.&nbsp; The series stands on its own merit.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;I am guessing y=
ou mean that we don't handle unaligned access? If so, yes
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;I agree this he=
lped with that.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; While I ca=
n't help if you like it or not, it really does bring an<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; improvemen=
t to code quality and legibility.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; If you hav=
e no technical objections, and no suggestions for how to do it<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; differentl=
y while retaining the quality and legibility improvements,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; then &quot=
;I don't like it&quot; doesn't block it going in.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;And you don't l=
ike the existing code :). I am willing to compromise, but
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;for that I need=
 to understand why the existing code is technically not
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;correct.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;So far, all the=
 arguments you provided in v3 was either a matter of
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;taste or IMHO b=
ogus.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;Your taste is n=
or better nor worse than mine. At which, we need someone
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;else to break t=
he tie.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;If I am not mis=
taken, Jan is also objecting on the proposal. At which
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;point, we are 2=
 vs 1.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;So there are th=
ree choices here:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&nbsp;&nbsp; 1)=
 You find two others maintainers (including on Arm maintainer) to
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;agree with you<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&nbsp;&nbsp; 2)=
 You provide arguments that will sway one of us in your side<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&nbsp;&nbsp; 3)=
 We keep be32_cpu*() (they are simple wrapper and I am willing to
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;write the code)=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Personaly, I agree =
with Andrew Copper to remove the be*_to_cpup helpers as current<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">implemetation is ju=
st a wrapper, like
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">#ifndef __arch__swa=
b16p<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">#&nbsp; define __ar=
ch__swab16p(x) __arch__swab16(*(x))<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">#endif<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">With be*_to_cpup be=
en removed, the interface keeps simple and clear, and callers<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">are dereference the=
 pointer explictly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I am very happy to =
see the three choices, hope we can reach an agreement about this soon.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Cherrs,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">---<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Lin<o:p></o:p></spa=
n></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB5405D2D60515EE9C02761FE79DD79SJ0PR03MB5405namp_--

