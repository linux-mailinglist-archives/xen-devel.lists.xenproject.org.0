Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7D058FF24
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 17:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384696.620127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9wt-0005wW-9h; Thu, 11 Aug 2022 15:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384696.620127; Thu, 11 Aug 2022 15:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9wt-0005tW-6k; Thu, 11 Aug 2022 15:18:15 +0000
Received: by outflank-mailman (input) for mailman id 384696;
 Thu, 11 Aug 2022 15:18:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM9wr-0005tQ-Pg
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 15:18:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf67075c-1988-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 17:18:12 +0200 (CEST)
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 11:18:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5599.namprd03.prod.outlook.com (2603:10b6:a03:285::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 15:18:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 15:18:07 +0000
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
X-Inumbo-ID: cf67075c-1988-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660231092;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zgln2IJQYzhWPJHWQZ7pwhxJksIdJuGOA6CPVhNYYj0=;
  b=XuPREpYQ+u1wFxlCdLKIaqfDhThdlERRW/SOLXILZOY1g+Xn9WH8aQ+p
   AZoXc7d9QbQNSZgV1ETkyzt4nSCEoryEsyrBfH86lbK7ONdBM7OTJRjoT
   C/TiEsNSkJ1RkdX5q0nDxqofqeTjp7n0LWcfYik0/VRKc83TeOt2GEZg+
   A=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 77885634
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Gcu0Oa1l5Mklq8iozPbD5RJwkn2cJEfYwER7XKvMYLTBsI5bpzUGz
 WUfDG7UbP/cYWLxf9Ala9uxpBgGupHWztY2SgNppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Uo35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/x/IVAXD4EGxsVQGUZi0
 dczIQ0/bCnW0opawJrjIgVtruIKCZGxebg54zRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2ya5L20wRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPAmWrYrCnw7gPJtTLgWMFJOJ6IzNxNvmy09GE9OT4xckTu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC1
 EKNnt7vLSxitvuSU3313qyPsTq4NCwRLGkDTSwJVw0I55/kuo5bpg3LZsZuFuiylNKdJN3r6
 zWDrSx7nLNKhMgC0v3h+Uid22784J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1XdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:0Fi0nK5hrnWFUBWLowPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG8fIzmZ0Wd9ih33ekLhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77885634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2cz3BPtG475RL7ZSEEdGS0AInoqP4WnDffDdjDzx+l3eRqeEjKgWd8Lz+SXf3Gm5uX4ZfsXvEX6i3Zg6D9CGghkMzSQe6bOk4DZXA+Wn+QZoz4r1bwkwT+W2Zkfqn6aLxPkTe+H4GEdMZnebCDfCFGySxdr/NWhjHfYszNN4/6HOZWrrVyci+jr2tjL52N1Q2fmjzkwb0wtOMCTAdu6E6rRLOGu9S4zCs2Cu2mln2ldqOxf5D8F+IUBgX5zcijI0ZA5NiLqIgAfYaQNR8QTVOWyiCUZhNmDwfA/Dy3qmGN55oCDpHetkKAIv42fNgl3FDwYZO381/YvLQRckdMZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgln2IJQYzhWPJHWQZ7pwhxJksIdJuGOA6CPVhNYYj0=;
 b=gCZZEMwXlhoSkS0pgiBNXdIgcpky9xMQf7y5VVh3sI/l0T5fqOas9frooi7ms8FaffKe6vaaSoBvNhS9XHvb9jgJxKKhwMyddyHEvWwb31g8Kxs0SE22rBmZ1wBIubm0aq/ynYpI1aj23/WXS6va9e1dN2e6O/Hv2v5Q4Ytm2bTLjxIvirXMfSy3stVhTsnEcKI2K9z9SHsBbHY/3ukwyITeticbHcI+a/J0o+mRpnihRyhsynRXdiBKa5mXhtc6BktFoN8bjX5fTaWOTTmXnn0WEVB48KCpGg+hID2d0Ss/EA9jzigiYsYmsmpkSi4lrAPYHNpjoeDgE5LHk56Pug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgln2IJQYzhWPJHWQZ7pwhxJksIdJuGOA6CPVhNYYj0=;
 b=wVoUACSiqTxuYWJa//JkZSTFARnTsdndRTHUuB2KorhJBPTM4zy/P3Pd2HiNM/76m6ZoGoZnXEcI6BG+y46aTVXfCAOuMXryeP+b7t39ipr3TyTxv34rIjIqe0Kzeone7z0w0xD9ZUU4AUj6ua7UPt5ZIPahWvTJ0i93ichA6pI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] config/x86: tidy {Free,Open}BSD LDFLAGS_DIRECT handling
Thread-Topic: [PATCH] config/x86: tidy {Free,Open}BSD LDFLAGS_DIRECT handling
Thread-Index: AQHYrXv86BETBjNVqUiyAXoW2q4Ghq2p0CUA
Date: Thu, 11 Aug 2022 15:18:07 +0000
Message-ID: <73d232bf-08a5-00a1-f12b-451bd011a3f0@citrix.com>
References: <cdaf00fc-d0ca-988f-565a-1fef3ae203e5@suse.com>
In-Reply-To: <cdaf00fc-d0ca-988f-565a-1fef3ae203e5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e849587-b26c-42dc-3e8e-08da7bacb1ad
x-ms-traffictypediagnostic: SJ0PR03MB5599:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bSS3sW8Tz9z8W6QarcYQmcOQP4fBafw1JXsVMn4peuAP5drZzvDq1AdtSMzd1Ecpu7zcIpfzdGOK+66NSgPyf0v+Kupf7EqQubCakTmRO53HLg/iy2xAkkRlLiLJ7pel8jlhWG0kXZ3hmTRlJ+8jKxtZFuk2mZrHf1yChx7K8Hi+dCmL1wgAtmZ04GxOZXP/bBaP5m1J9ifyuf7orx5uPK6+/Ft+4/qgHsy8QOn2BWof57lz587STfFOV3BSk9OV59PYUeJCLybUjbHvtLJhm0USA23arUs/pnEnDNN+brHoAoIuynj01nIFma24ZbAeAs6HFIJLvzuS7KsIYE6yz7AtD0hI5+JfnVhbdCMgjeIhiqV9tguDay4ILAlNopl/TzY5amH8WPm+7sPc7v1t6DzPAsg9EZQlavewNqf0xAeSPqEqh0J3CquI0LcK8T2tt6A4B3kJmrpB+UhqbKCbDIPQ7hnWJzzF12pWGgGUPh/jjfWG5Q9ImolFisDZfTeIfCbQjKB/gKgNMu89dcb1OlCiFiryNM4eUWAZb2izhiUM///q8oPlAGfBj/zgeVjevOtO6E2k8w5HGJ5Eisn4w3FeKrA/VEU3JEI9LxXNs1eLn5nZ5CtHBny8XYrt+XUZiP8sbuVYTZqi+CquP1O85oWD8v/7dE+gSvCCExIvY7DJvWQrjYBCqpNcVXe9ap7VXxv9pv/7swuwSmONiNE00d7AZZDyG6At18lDgRZod2wuT20+suCd7dYGta3BrRHM0JtBCOuWGpZcG473pBM1FNuvlOBSA3CWL/QCluKt1tFu4MU1QLRE07TmF8TEE96RBxDzJScdr7hcoagdt1Mf/+ids3YRVnHCS9reOoczWotvtJu8RNaSLp/4EVirR5/t
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(38070700005)(6512007)(110136005)(186003)(26005)(66446008)(4326008)(316002)(66946007)(91956017)(54906003)(64756008)(66556008)(2616005)(8676002)(66476007)(6486002)(107886003)(76116006)(36756003)(31686004)(41300700001)(6506007)(2906002)(53546011)(71200400001)(8936002)(31696002)(86362001)(478600001)(5660300002)(38100700002)(122000001)(82960400001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVFIY05TaVpTeTI1cHd0R1lCZ3hSeVl0MUZCcm5FRDBoVjZaQkMwb2Z6anQ0?=
 =?utf-8?B?K2s5NmJNS3VjVW1XTythTVNhbThITWc4dGh4ckxJcUUyMVBHeVYzTkNWNnJX?=
 =?utf-8?B?VG1oK1dwTS93VGVXWlZoUzFPWEozTlJmY045aERtMlF0Zi9xT1k1U3cvTTFS?=
 =?utf-8?B?TldjSnhvVXNsR0FETGZUenlkVmNwR0dLcFMwTmFtVE5RQ1Y4dFFURVEwRGFB?=
 =?utf-8?B?RVlCbmQxcE1JT3haNURQSllTdy9yYkMvVCtVZVYvL0VpVmZLSUtlZThUdXFS?=
 =?utf-8?B?cWVibGpCRnlpVTZzc2ViU1U1KzAzRlJIU0ZYTzVWTTJpRURzejVkTUEzUW1u?=
 =?utf-8?B?a2FqNWhnRThZNnZuWnd6YnIvbVRrL3ZvNi91OHZlWlFBZ005Z003Rjk0bVhk?=
 =?utf-8?B?ciszSzN6ay95RTBkNDlYVUdQaFpPNDVIMUljellSNjR2OVpsYktmVjdzc1Mv?=
 =?utf-8?B?eks0MFNZV2hpYW9XejJRZGEyRzlHVUxic0NwS2JLQktFUVh0T3VyNTlMdUVH?=
 =?utf-8?B?Tk9jM2JZb0N1bkJBeXRnalJ5OWRiaUliSW9sMlJnVkxpUU1ZOEc4UHdEdERj?=
 =?utf-8?B?QTR1ZGRCaEZGeWJma1dRYmowbmt1SXhiVkVienZXSmRHY2FXdlpydVRuUXcx?=
 =?utf-8?B?NWQ4cmhwbGxST0xHSWFqUC81cndCNllxZU9aWktVSmVBdnRmOHNLcWVTTFd5?=
 =?utf-8?B?cEMwODdXOGEvNitDM3BsQ0o1ajVEa1M3dlNaT3V5akM0WUFCajlhaGI0end2?=
 =?utf-8?B?blprdm1GckVEdnNkZENhQ3VRbnhmL0JoOGkzRWp0elZULzVhRC9XdXdFZFVT?=
 =?utf-8?B?RDNoSzBzNEZvZTdwSWVubkl5VExYYTYzUUVMU0hzQ3JqeERiZTdONHZJY0dB?=
 =?utf-8?B?YWlzWXN3dHFscStLNXNvbndiTzlyK3pMMHprWWZRUllYQ0krMi8wRnVVNmZu?=
 =?utf-8?B?aCs5NWZBT0FUR25uUmNBOW1qL3hNYmp1M09QWEt6bkJyV3NkUnhIVkJXZ211?=
 =?utf-8?B?QjBmazZBa3N0OFBDOVRjTkJtWC9YbG5NQk5adGdhUHJSUGR0SkhCc0g2MzRq?=
 =?utf-8?B?MW9rSHlPTHFLR1ZxRFhsYmE2VEhCb2ZtY3Y4ZnBjbEJDejYyZzZxT1dKUzg2?=
 =?utf-8?B?KzJLN3hlMDMyODljR3FGT3hhd2lSNERJM29vOXI0emowVnpxTVV1djRLUHh3?=
 =?utf-8?B?bjRROWZKZ09yWU53b2xkdmhNWkFuQnpsMGF1dk9vMWJDVklONm5VMDVGSmFV?=
 =?utf-8?B?aE1aenM5SVRLeGFXekhqNXRidUZFdHlkSURwNjgvUlhrRzFiZ29UZElxSHUw?=
 =?utf-8?B?VytlZmFiUDVWQ3MrTUxycVVIcWx1YmlkWUlhTEhXdWVlVnZJUXFBNk5NczQ4?=
 =?utf-8?B?Z2hvbzlOT0UwbXI5ME16MGFuUE1rMFRGNEhQUWN2djZicXBxTFYzZzNXbkRq?=
 =?utf-8?B?Y0FZQkFNOEV0QWh5Umd0czZCVmdmYkJNd1pwb0VHRnRkUmF0aWtkbVFKQVZ6?=
 =?utf-8?B?RnZpT3RBZG5wY3ZGQ1lRenhITlNyaDJyczE0bDU5dW54dVFaV3VDVzFWRi9u?=
 =?utf-8?B?dzFVWmR2eDlmWHFsYVQydVVNa0pzS3NKc1RsRGdyMXdQLzJYdlYvYlFHTnJP?=
 =?utf-8?B?dGp3clZ4bXJnUDNIVENSaUxoazVhYUlwMThiUXoxSFdja09qYlA5NkhwOGtq?=
 =?utf-8?B?RWVXeXdHeGwvckFFOFhWaVluWFo5ZmV5RDZVTHBGMTFuNnp5RFN2U0IrejE1?=
 =?utf-8?B?TVRmYk9YMWJZbGhZQ2QzM2ZIQkhmbk1TSEJxa0t3UFNqcSttc1BBT0psWjBR?=
 =?utf-8?B?VzM2VkdGbm0xN2hWN0xrS1FuS2V0Z1g5WGlYVnhDVU5kSWlIR3N1VkRiQkNz?=
 =?utf-8?B?bUVwbzB5NFhtNjZScHFsSTYwcXpyQU1PL3h3UnJxU05ybHp5VUNFK0RNc1Vs?=
 =?utf-8?B?K1hUcGlETXgvQngrU1VsTEVock02bU9CRDl2Zzczelh6Mk0zeG9JWXAzVGoy?=
 =?utf-8?B?VVNya0lBQUoza1QxWCtCTDhTcG9Ra2ZJYnJRM3cvRHdXQ1FoRnljQVUxRTJ6?=
 =?utf-8?B?SzRVUnZNZHJVWW1VK2F1cUZVSkxDdGYvODZwWDUrY2xZZUJvM1lhVUhWeFdV?=
 =?utf-8?B?YkdjZm16bVNxTUJVdGNvWTBNWDVNUFJxZDJ2Vm84RHNpcGlLM08wZm1kMVpT?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A03CDC57EB05134B8076113B899ECF2C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e849587-b26c-42dc-3e8e-08da7bacb1ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 15:18:07.1702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHD987hfe76ByOo9qDdNuE49LtsLYj5xvx7tMBG5HoB7Tw+aujeCr/YxfdrjP1fiqw6covh5DAUhVRtleTif23AL/oKe36LrLayA81zbRco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5599

T24gMTEvMDgvMjAyMiAxMzoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEl0J3Mgbm90IGNsZWFy
IHdoeSBmb3IgeDg2LTY0IGEgZGlmZmVyZW50IGFwcHJvYWNoIHdhcyB1c2VkIHRoYW4gdGhlDQo+
IChzaG9ydGVyKSBvbmUgeDg2LTMyIGhhcyBiZWVuIHVzaW5nLiBNb3ZlIHRoZSBMREZMQUdTX0RJ
UkVDVF8qQlNEDQo+IHNldHRpbmcgdG8gdGhlIHJlc3BlY3RpdmUgT1MgZmlsZXMgYW5kIHJldXNl
IHg4Ni0zMidzIGFwcHJvYWNoIGZvcg0KPiB4ODYtNjQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCj4gLS0tDQo+IEkgd2FzIGFjdHVhbGx5IGlu
Y2xpbmVkIHRvIGdvIGZ1cnRoZXIgYW5kIHJlbmFtZSB0aGUgdmFyaWFibGUocykgYXMNCj4gd2Vs
bCwgdG8gZS5nLiBYRU5fRUxGX1NVQl9GTEFWT1IsIGF0IHRoZSBzYW1lIHRpbWUgZWxpbWluYXRp
bmcgdGhlDQo+IGluZGlyZWN0aW9uIHZpYSAkKFhFTl9PUykuDQoNClllYWgsIHRoYXQgbG9va3Mg
bmVhdGVyLsKgIE15IGFjayBzdGFuZHMgZWl0aGVyIHdheS4NCg==

