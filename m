Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05206509B8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 11:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465954.724759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7CwN-0001EL-Ep; Mon, 19 Dec 2022 10:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465954.724759; Mon, 19 Dec 2022 10:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7CwN-0001BR-Ar; Mon, 19 Dec 2022 10:00:11 +0000
Received: by outflank-mailman (input) for mailman id 465954;
 Mon, 19 Dec 2022 10:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kQjb=4R=citrix.com=prvs=345253497=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p7CwL-0001BJ-QO
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 10:00:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9115822-7f83-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 11:00:06 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Dec 2022 05:00:02 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 PH0PR03MB5749.namprd03.prod.outlook.com (2603:10b6:510:38::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 09:59:55 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23%3]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 09:59:55 +0000
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
X-Inumbo-ID: e9115822-7f83-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671444008;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r23GlqhrFuYg0IYsnwfVRZNHFCcgbCjXHLf6Y0ptvdQ=;
  b=AKs6l76PyAPaNXI8wIpG9fLagKYQF8k2M5h/EoH5ltASeESd50/JvF0Q
   nhyyoGPCYoLpQx0C/ZCT/nwP727/lt24Fqg3QwXsUFX9Otp9CQYCFh0v+
   UsMsutUATrYmGDr4iil4l3imXn8lL8R08UIk8XHxmNohiCc2Pu1njAItm
   M=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 91540658
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qvNoUKOIRgaFjmbvrR1xlsFynXyQoLVcMsEvi/4bfWQNrUomhGcEn
 TEXDW+HM/yCMWTyf9EiOoS+p09S7JSAndBgTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5w1mPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rlGBlpQ3
 uVIEzJOSzmThuPp75SiGuY506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeNpOBy+OGF3N79cdyQRN5Jn0+e4
 GbH+Wj4DTkRNcCFyCrD+XWp7gPKtXKiBd5KSuDonhJsqHeq3lwfEQY7aV7l+KGejU+kY8J5I
 ENBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkvsIrQT0h1
 neSgsjkQzdotdW9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMS706
 yCHqm45nbp7sCIQ/6Cy/FSCjzfyoJHMF1cx/l+OATzj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:Zj5iSa7+gGzmZBY1VQPXwUKBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTP+ftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdk0NDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9r1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUbpDKh8KoNOCW/sLlVFtzesHfpWG2nYczAgNkBmpDg1L/tqq
 iPn/5vBbU315qbRBDJnfKk4Xid7N9p0Q6p9bbQuwqdneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2K2oM3R3am8a/hRrDvBnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLSU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsA5cuYGKaZmQOsRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHkondJNvaC6Dg4KFC6K
 gpCmkoy1LaU3ieePGz4A==
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="91540658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tryl3G9plt+LVPqWaI0aAQP2638ptyOrQsxtXkgFPGmvOuNNogwJsDidxhP7bdqUl6/t+SpFPdvoPaRVW4ZjChGzSorjhBuGrDqdvlBeZ2P05udflvKdnurqIee1oIm+8njuH74FVqYRPTVe30sgJJwmjds0gIquQ3lEjNVVrXe7467XFuIzf4n504iaqHqgkswOZ/jyUhBMZMiT+4hVPYzXU6femeCpRdO29aLjfLSockoY7JDHGVBKFpprHn83GFAfJnugwZB14os16p+C6k4/hypuFCHLQ99947yZrxKHz+kfHa2HquBg8QzBNG9Fsplagf0fw9n1fAJwaYbX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r23GlqhrFuYg0IYsnwfVRZNHFCcgbCjXHLf6Y0ptvdQ=;
 b=i6By8w15TmBRTvRkmJ4+WL/p2HHdfJmILQIM+UiZGhriyXU8Z1YaY5yRZTCu3PgaUS9HErs2tViVJLmYC3fBEAnMHesGyRr2vvvl1FPzN9Ide5Rvr9NoKpy5mvzMJ6Q6Yz5XMgxx7+LlN82p80dlni+hLOEJGT8BoWqAO+/KRrHsQXROT2yMISueVPdRNJ1k9paYc3eIL/Ro0utR1sd0+i9t9KatUPa6w51icq7lspgqmQ6OZVXxCwpBdVAB7VLai+FkH0nXE+v9oR3s0yo6qwnMWSuZ4mj61gbXa7ao3yM80Xuq6n7IfKOj27kJh9yg+1go4Q67OXUUEc4dE+XP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r23GlqhrFuYg0IYsnwfVRZNHFCcgbCjXHLf6Y0ptvdQ=;
 b=Ndco/ToBt0TZhQZlakNFBSki/QavPz+e2D30ArAMvN6KQ4jHTzWrl1DjRWYbgy882WKJ270mwtu9tWalJUITZALyqVUN14KwPGdgiaAXaxsKL8DOc3cyFMWmszv3SrT337qO+hzIfHeOuOiONS/hUNrAADcMzyaQKSYNZel0fPI=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 05/11] CODING-STYLE(tools/ocaml): add .editorconfig to
 clarify indentation uses spaces
Thread-Topic: [PATCH v4 05/11] CODING-STYLE(tools/ocaml): add .editorconfig to
 clarify indentation uses spaces
Thread-Index: AQHZEXvS6RVw/jj4C0W0HfdHSBPV8K50/lEA
Date: Mon, 19 Dec 2022 09:59:55 +0000
Message-ID: <C5C65E6D-79F9-4411-96A2-526FEE4DA0DD@citrix.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <bc7f3ab700525288938b84c9fbcc0f4ac6bd804c.1671214525.git.edwin.torok@cloud.com>
In-Reply-To:
 <bc7f3ab700525288938b84c9fbcc0f4ac6bd804c.1671214525.git.edwin.torok@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|PH0PR03MB5749:EE_
x-ms-office365-filtering-correlation-id: be396f5f-decd-49f7-67d0-08dae1a7c810
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yoOSEe38PjIOUpY7w7xB9EethfFGIODy3wyKl24xwYsbrXZn17cztGTIBOK3cIuW5TU4dVL3EC54kJ0Dn+loyDTkgKTdb8pKPxvfdxAsS1uObHII4rvKyNlzksZBL79kneB9KTkRPPUDkGgZNUZV94Kft+1t/SxE6IAPJlGmoQPI9JQto8C+sHpXS1B9djBG1r8n2aaYB2FqTbOsFZ2Wq00BROtJF4Fm45WLX/usWCkEA00Y8vjbPEtYidSb5+lA4nlj3ZdXmJBvUShJ9dIZ6DvTxcI4WRmlvXNCVms8Fo90S4ui88LI4FyOOY6U5JfCKpAUDsAGfIRTyOkdDll2KrLYvX/5a5ly36PQU2dE+6ru9cfXmywcq+XwVCiqGiHdVJ8CBeqYEpm3/ftVNLsoZ4mkbnt8j5If6P81qBxQAmrsTIz66jFYw0jCHDiU6yHMTXeHom2NwcE86TlO5E7FJTMpmuComR4r3wBN0dHM76/5up+HZCB8uddpjN8dxwPOCoxKLiLQGvWhHQkyOEUoLRiA8ohp8m3s+e4U8MRZD6Pr9Ea/4VvaJmguz6IjK48t9DaskcD71HX9IE8hi4arYncWOHhz7dgu9kkTq+vj8wMx1KcaICRzUp/1E4la4+XX8hbeHxMwkyw3u82ARv60BX0TI6qds2l5RhbhDXaL2y7Zj69L9KP/xLLA1RQVyluBcmv0JKYiEaQIYpYoDG+iTAjGl5qXTpMQgDt+ue1ULqMGGJldpBhHOvDWAI3PFgDQF2AteD0QGqBphkeJMjrOgQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(478600001)(6486002)(71200400001)(6506007)(66946007)(66476007)(66446008)(91956017)(76116006)(64756008)(6512007)(66556008)(26005)(186003)(86362001)(37006003)(316002)(2616005)(54906003)(6636002)(41300700001)(36756003)(66574015)(4326008)(6862004)(8676002)(8936002)(82960400001)(38070700005)(2906002)(5660300002)(53546011)(33656002)(38100700002)(122000001)(44832011)(142923001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2ZEeEprcDBkQzdUTVVDTktxL1BiL1orMmMvS0VFM0N4OTA5QmFRTG8wY3VP?=
 =?utf-8?B?MGtPYlhTdDkvRCsrcytRRjhKUnRWdE0xdlE0NkNVa1lDcnpXVDBwcWlCS1RZ?=
 =?utf-8?B?VCt1SUtBektWQ3hYTlZscEhDU2ZCY1oxNUhzeUtDZkhXYmZ3alFDeWNFT2ho?=
 =?utf-8?B?NlZTek14bktscjU3ZVo1clB4cnBkZ2tkdWlXc0NLdkZ4WFo3NVo2RFVmbWk3?=
 =?utf-8?B?c09KZFFxS2tPM2lRN2p4Q0s4dVl0SEJEbkN6cHplSGlhVDVIUmlNQjg4cjFB?=
 =?utf-8?B?cE8zT3lya0tpS2hmeFpGQXk1SVpJRERISUdtbEJKZjZpZU1oWlFqbE55SThB?=
 =?utf-8?B?Q0xxY3ZNQXZNK1htZkpjSWUzMEhrZFdWTTFwc2lNRVlCY0UzOEt3eUFWUXlQ?=
 =?utf-8?B?UkRpdmhkMDZKL2dGdVFDUHpDeHBBY1dOay9IMlhhWXhUVTBRc3Qxb1FEVWFz?=
 =?utf-8?B?VWNKTDJsZ0kvUkhHd0VoZlFTRCtFYk9TR1hhZEhTNVJYWGh4YU91TkhFK25F?=
 =?utf-8?B?SUcwcGhncXlIQUcvQ2FmSXVyRVJhaytaQlhGMWlXZ2JiZ3NKdHdZS0hwZzN0?=
 =?utf-8?B?WkFpeEEyQVFhZlAyN3pEd2R2TVJ6WTl6aDlEQU5hQkZOV3ZSbDJvanJKU3Mz?=
 =?utf-8?B?YXZtdmNuOHptVzMrWkxvY0JtRlY0cDJvWm84TnpJdHZDYXlYK2w5aUpnWnpQ?=
 =?utf-8?B?aTFLbENlM0J3TmlObHZhVHRka2pZTG1oL2N0NHJtYkNxWnFRM1ZQUFEwcHJB?=
 =?utf-8?B?UG54YTVSb0E5aU9FRGpyNWR0ZzJEdmdETmZQWmFZNTVtOVdQUGFoRXVjQUQ3?=
 =?utf-8?B?K1pTaFRuTHNtbHRRNHlRZ0RyUnhDM01Qb0x2NmFOQ0JPOG9Bd2d0WVFyZEtH?=
 =?utf-8?B?OEY3cFlRYzlEcm55TGF3NnpNSUZVcUtvT2RIOXN2NFBWcXFySG9RMFJRdE5T?=
 =?utf-8?B?bmVmSWlWbTAwc1paN2l6U2d3S2JPZ3FtNVVpVS9ibFFVb0NkMkVxTXY5eFdt?=
 =?utf-8?B?UkdibXVlelpHaS9CVHhSQW4vZU5GMDU3a3laRjl3ZVRJRGU0Q0R2V0krWjRi?=
 =?utf-8?B?SGk3cTBFeXp2b05lWHl0KzhqRlNLTTk3Zmx1dUkyTHRJY2l4cUFocGpVTHR3?=
 =?utf-8?B?NlVuK1NZNk1VVjRXOFBZaU43OUxCaVRTUXI0RWJPSHlhbWJJY2U1RklCeWxM?=
 =?utf-8?B?QU9Ic211RU1EUW43MjFDRE0vWUtQRVJLUk40dnZOalhoMVlvMExPelBFeDRz?=
 =?utf-8?B?aG9yWkMxNnpIM05GZExvZ0VkR3FWbUhEbXZ6SzZVZ0hwM2pjc3lTZmxqRkFZ?=
 =?utf-8?B?cU5zRXpDRmpESEdLUnFSYVNHamVSTUlOZmhGYUdtVFFZaVpFcFgyY3cxRFVM?=
 =?utf-8?B?OU9SWDVBb3Nkd0ZIQTJMM2U1SXV5SUVsRklsSFFOVkxQVWh4OGtKc3Q0Zko4?=
 =?utf-8?B?eUNDdzYrSjUzNG0rZ3BrYVF0Tzh1RGh5blp6WWJJaURka2paS3d5RjZMTHZw?=
 =?utf-8?B?aXZsbUJyQkZPRFZieG1hanhpU0ZNcGs5VzZaNmJJbUtuVUpXTXd2SG10SnNz?=
 =?utf-8?B?Z0lHWG85U2tubjRleXRuaWJ1cURRZndaOVpaeXo3TkdQVllDWVFNTC96VzNi?=
 =?utf-8?B?Q3NqWE01M3FITk1vYXJFZXN3RmFPRU0wb2pucFNzRGJTZ1pLVjlRV0VLTEI1?=
 =?utf-8?B?STFLbGFteHhkVUo0cDlKbGFNWko2eWFzcUJHZll4clFIam55NGx6b09wMSs4?=
 =?utf-8?B?RTVnUGZ0T3NFMHlzTHh2UHVic0FUektBMUtOQkpsQXJHcVFzN2FHYjRMN0VD?=
 =?utf-8?B?NkxKZ1ZHc2VVdmhZaUNpNnV2Ry9IMmg4dFkySExPdzU2Y3pRTEdvLzZGaFdN?=
 =?utf-8?B?Q1NzSUcvMFo1R0NxWnJBVmM4b3RLbldEaVY3dXBFcVl1bzlrWTI0MW9KMmpO?=
 =?utf-8?B?UDhQL3UwVzdod1lMV1RYRTltNjRzVzlYMFMwMW5ZOGpLTGVYYUZ0U1dxSGcx?=
 =?utf-8?B?UmVmMVlWQnRxdzkweC9vTmlXWHh1ZnAyUFV6ZUE2TnJVUjhnN29YcjgzazJz?=
 =?utf-8?B?bG5JVm1seTFaTGVjY2tQTDQ3RzhhZVlIamQ3VG82WWt3bzkzbFU4NEQxRG1R?=
 =?utf-8?B?c04xTHRSV0NCcEVZZEFzTjRQQUJ6aXhTN2lEY1VTT210Y04zOXI1bmlGd1lh?=
 =?utf-8?Q?+rPCX15r121qDE17y+YpUMM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E505903E8BAFD4086E40C8A31067FA0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be396f5f-decd-49f7-67d0-08dae1a7c810
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 09:59:55.8027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5GPKp+wB5oqlQ8O83ndF0WVpxW+2dphGeW5C3YD++HmbY1YN5f9WmVMald3VZ0yrqFhEJFZs4oViIzbP0+6fLv+TpiZFAn8F8zL0PnAKx2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5749

DQoNCj4gT24gMTYgRGVjIDIwMjIsIGF0IDE4OjI1LCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jv
a0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEFkZCBhbiAuZWRpdG9yY29uZmlnIHRvIG1ha2Ug
aXQgZWFzaWVyIHRvIGtlZXAgcGF0Y2hlcyBjb21wYXRpYmxlIHdpdGgNCj4gWGVuJ3MgY29kaW5n
IHN0eWxlLCBhbmQgdG8gcmVlbXBoYXNpemUgd2hhdCBYZW4ncyBjb2Rpbmcgc3R5bGUgaXMuDQo+
IA0KPiBJIHRob3VnaHQgdGhhdCBYZW4gZGVtYW5kcyB0YWJzIHJhdGhlciB0aGFuIHNwYWNlcyAo
d2hpY2ggaXMgbW9yZQ0KPiBkaWZmaWN1bHQgd2l0aCBPQ2FtbCBiZWNhdXNlIGluZGVudGF0aW9u
IHRvb2xzIHVzZSBzcGFjZXMsDQo+IGFuZCB0aGUgdXNlIG9mIHRhYnMgcmVxdWlyZXMgY2hhbmdp
bmcgZWRpdG9yIHNldHRpbmdzKSwNCj4gaG93ZXZlciBDT0RJTkctU1RZTEUgc2F5cyBpdCBpcyBz
cGFjZXMuDQo+IA0KPiBEb2N1bWVudCB0aGlzIGV4cGxpY2l0bHkgYnkgYWRkaW5nIGEgLmVkaXRv
cmNvbmZpZyBmaWxlIChzZWUgZWRpdG9yY29uZmlnLm9yZyksDQo+IHdoaWNoIGlzIGFuIGVkaXRv
ciBhZ25vc3RpYyBmb3JtYXQgZm9yIHNwZWNpZnlpbmcgYmFzaWMgc3R5bGUgcHJvcGVydGllcyBs
aWtlDQo+IGluZGVudGF0aW9uLCBlaXRoZXIgd2l0aCBuYXRpdmUgc3VwcG9ydCBpbiBlZGl0b3Jz
IG9yIHZpYSBwbHVnaW5zLg0KPiANCj4gSXQgaXMgc2FmZXIgdGhhbiBtb2RlbGluZXMgYmVjYXVz
ZSBpdCBvbmx5IHN1cHBvcnRzIGNvbnRyb2xsaW5nIGENCj4gcmVzdHJpY3RlZCBzZXQgb2YgZWRp
dG9yIHByb3BlcnRpZXMgYW5kIG5vdCBhcmJpdHJhcnkgY29tbWFuZHMgYXMgVmltDQo+IG1vZGVs
aW5lcyB3b3VsZCBoYXZlLCBhbmQgd29ya3Mgd2l0aCBlZGl0b3JzIG90aGVyIHRoYW4gVmltIHRv
by4NCj4gKFZpbSBoYXMgYSBkZW55IGxpc3QgZm9yIG1vZGVsaW5lIHNhbmRib3hpbmcsIHdoaWNo
IGlzIGVycm9yLXByb25lDQo+IGJlY2F1c2UgZXZlcnkgdGltZSBhIG5ldyBjb21tYW5kIGdldHMg
YWRkZWQgaXQgbmVlZHMgdG8gYmUgYWRkZWQgdG8gdGhlDQo+IGRlbnkgbGlzdCwgd2hpY2ggaGFz
IGJlZW4gdGhlIHNvdXJjZSBvZiBhIGZldyBDVkVzIGluIHRoZSBwYXN0DQo+IGFuZCBJIGRpc2Fi
bGUgVmltIG1vZGVsaW5lcyBldmVyeXdoZXJlIGFzIGEgcHJlY2F1dGlvbikuDQo+IA0KPiBUaGlz
IGZpbGUgaXMgYWRkZWQgYXMgYSBjb252ZW5pZW5jZSBmb3IgdGhvc2Ugd2hvIG1pZ2h0IGhhdmUg
YW4gZWRpdG9yDQo+IHRoYXQgc3VwcG9ydHMgaXQsIGFuZCBpdHMgcHJlc2VuY2Ugc2hvdWxkIGhh
dmUgbm8gaW1wYWN0IG9uIHRob3NlIHRoYXQNCj4gZG8gbm90ICh3YW50IHRvKSB1c2UgaXQuDQo+
IEl0IGFsc28gd29uJ3QgY2F1c2UgcmUtaW5kZW50YXRpb24gb2YgZXhpc3RpbmcgZmlsZXMgd2hl
biBlZGl0ZWQsIG9ubHkNCj4gbmV3bHkgYWRkZWQgbGluZXMgd291bGQgZm9sbG93IHRoZSBjb252
ZW50aW9uLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiBDYzogQ2hyaXN0aWFu
IExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KDQpBY2tlZC1ieTogQ2hyaXN0
aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KDQpJIGFtIGFnbm9zdGlj
IGFib3V0IHRoaXMgY2hhbmdlLiBBdXRvbWF0aWMgY29kZSBmb3JtYXR0aW5nIHNob3VsZCB0YWtl
IGNhcmUgb2YgdGhpcyBidXQgSSBzZWUgbm8gaGFybSBpbmNsdWRpbmcgdGhpcyBmaWxlLiBUaGUg
bnVtYmVyIG9mIGRldmVsb3BlcnMgY29udHJpYnV0aW5nIHRvIHRoZSBPQ2FtbCBjb2RlIGJhc2Ug
aXMgbWludXNjdWxlIGFuZCB3ZSBzaG91bGQgdHJ5IHRvIGtlZXAgYmFycmllcnMgYXMgbG93IGFz
IHBvc3NpYmxlLiBUaGUgd3JhbmdsaW5nIGFib3V0IGFsbCB0aGVzZSBtaW51dGlhZSBpcyBhbHJl
YWR5IHRvbyBtdWNoLg0KDQotIEM=

