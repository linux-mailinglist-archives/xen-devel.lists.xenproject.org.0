Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0C5EDE80
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 16:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413355.656969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXms-00016e-M3; Wed, 28 Sep 2022 14:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413355.656969; Wed, 28 Sep 2022 14:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXms-00013E-I6; Wed, 28 Sep 2022 14:11:46 +0000
Received: by outflank-mailman (input) for mailman id 413355;
 Wed, 28 Sep 2022 14:11:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG3S=Z7=citrix.com=prvs=2639d358c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odXmq-0000S3-Km
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 14:11:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e71850c-3f37-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 16:11:24 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 10:11:38 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5596.namprd03.prod.outlook.com (2603:10b6:806:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Wed, 28 Sep
 2022 14:11:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 14:11:36 +0000
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
X-Inumbo-ID: 6e71850c-3f37-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664374301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=xqpzPTo+tqWuVrT/dDNqz4ZD0jH2eM4n5dh29qP+bVQ=;
  b=eusiJvoriASupoqr9vMvZvkYVbKYRfOYJQCRomEKfQ1S3EVzEkrimdOo
   wve5x+Q5uYNccD0gCUQVO0HI59kcCs0pHHl/SdnpnoDVxaTNiJhePo24w
   BKoZh4cNE0th/2QyXIF2w+nbCed58hsWKUvUUzceM3D4wHWbri14cv0yQ
   A=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 81960679
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:I90kCarI8QxXXUwAdC0TTIyHKXdeBmLpZBIvgKrLsJaIsI4StFCzt
 garIBmGM6mPZGXzc4sgaY2+8UpX75CEzIdkQAo5qi02RSNGpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPaER7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 Po1ci00NRy4t+vn8u2lSsJLl+pgI5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efxHKlANxNRdVU8NZopEyomEURFiQ0XGOGjdughkXiR95mf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750RkMhN0ay49FLGhjuEp57VQwpz7QLSNkqm4x14Ysi5ZoWuwVnd8ftEao2eSzG8U
 GMsnsGf6KUCCM+LnSnUGuEVRuj3trCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUKzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:T1HthaDd5+H+XKTlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dNME/N
 323Ls1mxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg12w
 31CNUXqFhwdL5mUUsEPpZmfSKWMB27ffueChPlHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.93,352,1654574400"; 
   d="scan'208";a="81960679"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7AzwnHxpmN/KV8N9yvgj9FUdiQ68WAOAvVjMcQrG3XUs6PFtCsOUmQMsxtIMYZi+YIPrXUGgwv/zK+u6Mz66b/Ms7MAkCgNl9pxPuXGZWBMeYVp02pdQwNQ3Jm23pODIPl1RgQAl7Cq/G4RDXASnY7OJ4Xttt9w8SgVAVikuC/dVnutctL8/MGCym6s94HgARCikUF/WRacx/25Y7mGnMhYgFQyYOV2w2pvd5e6TM9ENY2pRo5HJjsCHYuXxuKMc2bh5Hue0s1MVO6ZLWU80hp2XQsJM0ZROhtcm6Hjzrk3ILLolmEZs+1siZ1CB26b9BEzDTSu/nEjQkBFKHbHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrg6TmkiWke+u14j4kPKExk7sncmIIb6n+HAE1tRCec=;
 b=URXKDG46zgef/aipTzYUvYzy/ZkI28GN0es8qfjUrOt8rrMf4Bpqhv/0L545Su0Gy4ruBMglI/gU7KlNllH/yBhlCVpivGhGgTrCvOKuR8EQaimq+z3nHspky+WDWQMoUTx8xlzcAOhycY5GSypb5FjhQCSziZrBlHQbrXd/EWQ26K7vrb20PtYMYx3w+I8D1X8ad87NNNafzx7dKU94YaSBdWssXNMQUJ3x1Wzj0CJh9CB5I31LcrqL4yhIx3coXqyBdLEVpfwErhI8OqgxjDa8LAD3GKEXOoHwcjSvR3wdrfoJAxYhwz3KJ66EQo84lTUCnEqHXefNtIXsVa6IJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rrg6TmkiWke+u14j4kPKExk7sncmIIb6n+HAE1tRCec=;
 b=TT3onQoNrLH2kcxjn0ET5qXM4WwWfLUVj3kFPNMykhCaK0u6KzMyhCX+6/ycLp3QXuwHBmISmF45m7zsAkLr+eGSgb3aohqrmitMD5nWzKuQhvhuBAIGB5n7V9eXAoWWJNzt8Rydp/aJyhy152L0N9+gLgcqIebT1O++bgCCgAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 2/2] x86/ept: limit calls to memory_type_changed()
Date: Wed, 28 Sep 2022 16:11:17 +0200
Message-Id: <20220928141117.51351-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928141117.51351-1-roger.pau@citrix.com>
References: <20220928141117.51351-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: adce3f8c-8cf4-45be-e88a-08daa15b5a9f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OnwZQzge45P4seLIah8vp128gWh5NiC+MUNgNwXSDU+v0ynal/qlMtbP5E1G/qOZi3L1R0bpMtPaa0YQbh6PYsIn5pScjh01uV9FneoOu+zfDNuxqtWzufUeJ1pLFcWtudLI/oYE8jMGQ38K0l6BduZknrkHWGqjJq98U/395YzpLKD4IPHlz+lHrYjdjRDKokzLOwR/wSdui7nQT3rYFnPQcsnrT8kd6cVYscWam1F9evtPI2W3hYwytsh+kCtqLb6S1mK4TNRJjVVx81rdJVXsFwjddsOYVNoqgNmZrER3hpfgBgpBi47o5u9ozR/6uR94n/qwUX40REhRLU2/yjNhjLKRAHXKBMj0XxOjArmQoS6C84Bh/gwoBN1b2+gGi/7ko/3QgYDndEFf8UaHgGJiqmRnSld6h53LexVnL2hjJiKR0RBxsYsRURB53UWovxBuXXsWuX5IG1hwSOFG6p3zrT7hs/1yWqGqRV46U/2GWMfjWwINRM7mSmc5cK2Vgxk323tW9VrNGqw9q6TX8BALIKOiYCH1Xbp/M/T9aWqeUiWN323aV2Gw4+nc/4sFix9pWpPA72uHIWUo+a2nRnHN3lxBvsS76FeRdWaEzTTYqfF5aWyCOGrsZqkiYoc0/RNyCMEv2LTp1/5OsDi9raYiytvWjx+OtLgEbq6hoUe35Ooh69qjSIUcLUMGaNO8UhPGNobjf0QNHDVx5Ej9pA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(82960400001)(6916009)(316002)(54906003)(5660300002)(8936002)(8676002)(36756003)(41300700001)(66556008)(66476007)(4326008)(2906002)(66946007)(6512007)(186003)(83380400001)(86362001)(2616005)(26005)(38100700002)(478600001)(1076003)(6486002)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lNSXB0TTdHeVlRUWF2T0VXQW1OWG8zZmZLZmhxdVlkMjZrNXlXc2tjaU9i?=
 =?utf-8?B?dmRFTXhPalllNWFqMEtSRFlCOHJuTTdlVGpvS0JUeWh2K0V0SktaYmFRWFJr?=
 =?utf-8?B?bFF3MWxhbldjSnhzM29mc3UrTUd6bGhYWENITis4dThXVXBTZEFsa2ZsQlh4?=
 =?utf-8?B?QzY3Z2J6aC9BTURkeWtVbEhzdXFWTUk2VmhrRWlxMmlFSEhvQ2daemJuWlV1?=
 =?utf-8?B?Y1VQU0xtNVdBcTJpQnZxOW9CSVI3QjZxL0M0NHkzK0IzVDI1a3Nrb21qOVNW?=
 =?utf-8?B?dldFd0M4aVJndnZxM2NqeHdHSkxWOWxXN3NZQWF6a2pOTjhHeitiMEFHT08x?=
 =?utf-8?B?MVc4bUJXRWZ1UzJTbEJtSVc4RGtlNm00Qk5XRHhRK1QvL3d2VkE2eE5nQUJK?=
 =?utf-8?B?MlBpVStaZTNoY2RBTDlpSVlQb1U3NFoyODlPTkZteUpNaGY3NXpOSmRiUEhs?=
 =?utf-8?B?aitWZXowanF0R3NMWXpINSt3U01UUWxPNE15VGtmTkxmelk1S1JzTHBWZVRt?=
 =?utf-8?B?NXFraG15WFFxTUdOendRamk3Y21PQ1hvSkhraS8vRjMvUlZXbUpFcWx2dGNq?=
 =?utf-8?B?bGo4OHk5WmtRQ0JKcitubUJDaFJkbDhuYkxKVU1wWDZ2aStMODd3WmVNQlJJ?=
 =?utf-8?B?UlBISUFlQWF4bVVpMVluZDNiVElhaENjM2dzKzZxckRtQ1pZWFNDdmtwcEs5?=
 =?utf-8?B?eUlpRWpQZzYyVkJXaVdXUCtuSllDSUxIRGxNdWxOdTJMYWlkYkd3VzIySUZI?=
 =?utf-8?B?RjZxWGVBM3JxRHJlOWRKUDAvVVI1bHhGNmY2L3Jkdk1hMlowT21vbDJ0bzg5?=
 =?utf-8?B?WnJNODRKVXVkU2FvYWJ0dkJ2T1RPMUh0TDRJTW51b25QK1ZDa1VZK2JHUWdC?=
 =?utf-8?B?VDQwTncwK3U5ekdPRlROZHRGTmt3djR5TGlrSmRGOTFIY3hWQ1BZN2l5QnBy?=
 =?utf-8?B?dG1vN01ZanZuUXgzcnNXSklPeTVMUEZUdXY1VmtGUXR0cHhJNG0vUFVvOC9v?=
 =?utf-8?B?ZkZtOUh4TGV3OWVBVUw1ZnljOGZKVGVkajF6Wk9FdnlXekNoMVlNdHUvenVk?=
 =?utf-8?B?amdRMzJ3RTZDR2I4ZmJWZzVMVTFxbEdBclhUa0lxamNtOXJ0aWxOOUlDTWlk?=
 =?utf-8?B?emZDclF1SjBNZHhJcTB3Y2NRZnhOKzdRSVBzWXpkelg3Y3NYek9lRk03RHla?=
 =?utf-8?B?bHNDc3JRdGw3Z2gyMlJ4Yk0ydzYraHpXZkhUTmFkVUZ3Um9GQzRFMGxiOERS?=
 =?utf-8?B?ZnVqRHM4T3hoTkVMWXkrTG9Ed3h1cGZxN1RudEczQkZaNUhVNlFpb2E5bTl0?=
 =?utf-8?B?QlR2NUNIbFg2OUpqQTV1cWNNQlg0WlZVY3RMZmJhWnVQc09xdGVFRnhTdTlW?=
 =?utf-8?B?UUlCV0NlUGZrdkFwL01hN2JwMDNEMzBBZG15UXJnbU5FdjhsRnN0MTU3dFlX?=
 =?utf-8?B?dG9CYVN6NERyanloMmYwNXFOZzRqRDJIVlArK1J2Y2I5VmEyVUNaaTBpOVov?=
 =?utf-8?B?T0pzTFVaVHRrL3BEaWFaLytxc0tFd2lsYXpKMXVLa0tqbmxsaDBaTTZKcFY3?=
 =?utf-8?B?NU1jR1YrVGxkbGNRRE9xdWIrQzJSeFNCT1VIQ2U5OU1OMTdsbDVaQk9aNzlm?=
 =?utf-8?B?czlXcDBZNWgwcFFWZkNzYUpoaExYSzIzbHR2VXZaZFVGTTBySElWYUdqajRu?=
 =?utf-8?B?SkZCd2IrdmVkMis2ejl4c0NEa1o1cjhSYnJSZXplQUNERXkrb2lsM0NwM0Jx?=
 =?utf-8?B?bmJCNzg2UFU1WjJTWXhRdERKRUluZ3kwVklseE55N1Q3WDcwL0gzMm8vOUJF?=
 =?utf-8?B?RzhMcWdaazhiLzZoMWE2cmk0T2pNV21OSDBFdC8yRllDekRUL3RMNXhGd3NE?=
 =?utf-8?B?S1djdkxQcXJDOXBjQkgrbFp1VGY1K2RLNHNNY2RUaWl6SUptTHFsZlBiWksx?=
 =?utf-8?B?UHE3aVhwd21OTFcrcmEzdnRiY2pNbllaNy9QUGM3aFBZczd4ZzlwSzh4VHk4?=
 =?utf-8?B?bGdXMXJxY3BmbE1VemFUdFpOSGVuVlFDc1NKS1dCaEVSa0krNHZHYlJ4dUxm?=
 =?utf-8?B?KzBwTjhlNWMrZzAwTXBSdzY1MXZuUnhwYW5MN1AwY2NkNEdPUUdvR3JqemxM?=
 =?utf-8?B?bE5mTml5S2hXTldDTGU0Y2hEUnR5WjkyYkZiTUlndVZsMlpHelpYRmEyQnlJ?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adce3f8c-8cf4-45be-e88a-08daa15b5a9f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 14:11:36.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49A+fQb96QSnmLFIw4zTmhfRQDazU7lgWFEAzYhbeWzRFHRsH24hX9EWlyoMYPlIBlqhC0o5WvV0Psk0hVQS+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5596

memory_type_changed() is currently only implemented for Intel EPT, and
results in the invalidation of EMT attributes on all the entries in
the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
when the guest tries to access any gfns for the first time, which
results in the recalculation of the EMT for the accessed page.  The
vmexit and the recalculations are expensive, and as such should be
avoided when possible.

Remove the call to memory_type_changed() from
XEN_DOMCTL_memory_mapping: there are no modifications of the
iomem_caps ranges anymore that could alter the return of
cache_flush_permitted() from that domctl.

Encapsulate calls to memory_type_changed() resulting from changes to
the domain iomem_caps or ioport_caps ranges in the helpers themselves
(io{ports,mem}_{permit,deny}_access()), and add a note in
epte_get_entry_emt() to remind that changes to the logic there likely
need to be propagaed to the IO capabilities helpers.

Note changes to the IO ports or memory ranges are not very common
during guest runtime, but Citrix Hypervisor has an use case for them
related to device passthrough.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Split the Arm side changes into a pre-patch.

Changes since v1:
 - Place the calls to memory_type_changed() inside the
   io{ports,mem}_{permit,deny}_access() helpers.
---
 xen/arch/x86/domctl.c            |  4 ----
 xen/arch/x86/include/asm/iocap.h | 33 +++++++++++++++++++++++----
 xen/arch/x86/mm/p2m-ept.c        |  4 ++++
 xen/common/domctl.c              |  4 ----
 xen/include/xen/iocap.h          | 38 ++++++++++++++++++++++++++++----
 5 files changed, 67 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 020df615bd..e9bfbc57a7 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -232,8 +232,6 @@ long arch_do_domctl(
             ret = ioports_permit_access(d, fp, fp + np - 1);
         else
             ret = ioports_deny_access(d, fp, fp + np - 1);
-        if ( !ret )
-            memory_type_changed(d);
         break;
     }
 
@@ -666,8 +664,6 @@ long arch_do_domctl(
                        "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
                        ret, d->domain_id, fmp, fmp + np - 1);
         }
-        if ( !ret )
-            memory_type_changed(d);
         break;
     }
 
diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index eee47228d4..ce83c3d8a4 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -7,10 +7,11 @@
 #ifndef __X86_IOCAP_H__
 #define __X86_IOCAP_H__
 
-#define ioports_permit_access(d, s, e)                  \
-    rangeset_add_range((d)->arch.ioport_caps, s, e)
-#define ioports_deny_access(d, s, e)                    \
-    rangeset_remove_range((d)->arch.ioport_caps, s, e)
+#include <xen/sched.h>
+#include <xen/rangeset.h>
+
+#include <asm/p2m.h>
+
 #define ioports_access_permitted(d, s, e)               \
     rangeset_contains_range((d)->arch.ioport_caps, s, e)
 
@@ -18,4 +19,28 @@
     (!rangeset_is_empty((d)->iomem_caps) ||             \
      !rangeset_is_empty((d)->arch.ioport_caps))
 
+static inline int ioports_permit_access(struct domain *d, unsigned long s,
+                                        unsigned long e)
+{
+    bool flush = cache_flush_permitted(d);
+    int ret = rangeset_add_range(d->arch.ioport_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !flush )
+        /* See comment in iomem_permit_access(). */
+        memory_type_changed(d);
+
+    return ret;
+}
+static inline int ioports_deny_access(struct domain *d, unsigned long s,
+                                      unsigned long e)
+{
+    int ret = rangeset_remove_range(d->arch.ioport_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+        /* See comment in iomem_deny_access(). */
+        memory_type_changed(d);
+
+    return ret;
+}
+
 #endif /* __X86_IOCAP_H__ */
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b4919bad51..d61d66c20e 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -518,6 +518,10 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         return MTRR_TYPE_UNCACHABLE;
     }
 
+    /*
+     * Conditional must be kept in sync with the code in
+     * {iomem,ioports}_{permit,deny}_access().
+     */
     if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
          !cache_flush_permitted(d) )
     {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 452266710a..69fb9abd34 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -716,8 +716,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = iomem_permit_access(d, mfn, mfn + nr_mfns - 1);
         else
             ret = iomem_deny_access(d, mfn, mfn + nr_mfns - 1);
-        if ( !ret )
-            memory_type_changed(d);
         break;
     }
 
@@ -778,8 +776,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                        "memory_map: error %ld removing dom%d access to [%lx,%lx]\n",
                        ret, d->domain_id, mfn, mfn_end);
         }
-        /* Do this unconditionally to cover errors on above failure paths. */
-        memory_type_changed(d);
         break;
     }
 
diff --git a/xen/include/xen/iocap.h b/xen/include/xen/iocap.h
index 1ca3858fc0..0ca4c9745f 100644
--- a/xen/include/xen/iocap.h
+++ b/xen/include/xen/iocap.h
@@ -7,13 +7,43 @@
 #ifndef __XEN_IOCAP_H__
 #define __XEN_IOCAP_H__
 
+#include <xen/sched.h>
 #include <xen/rangeset.h>
 #include <asm/iocap.h>
+#include <asm/p2m.h>
+
+static inline int iomem_permit_access(struct domain *d, unsigned long s,
+                                      unsigned long e)
+{
+    bool flush = cache_flush_permitted(d);
+    int ret = rangeset_add_range(d->iomem_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !flush )
+        /*
+         * Only flush if the range(s) are empty before this addition and
+         * IOMMU is not enabled for the domain, otherwise it makes no
+         * difference for effective cache attribute calculation purposes.
+         */
+        memory_type_changed(d);
+
+    return ret;
+}
+static inline int iomem_deny_access(struct domain *d, unsigned long s,
+                                    unsigned long e)
+{
+    int ret = rangeset_remove_range(d->iomem_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+        /*
+         * Only flush if the range(s) are empty after this removal and
+         * IOMMU is not enabled for the domain, otherwise it makes no
+         * difference for effective cache attribute calculation purposes.
+         */
+        memory_type_changed(d);
+
+    return ret;
+}
 
-#define iomem_permit_access(d, s, e)                    \
-    rangeset_add_range((d)->iomem_caps, s, e)
-#define iomem_deny_access(d, s, e)                      \
-    rangeset_remove_range((d)->iomem_caps, s, e)
 #define iomem_access_permitted(d, s, e)                 \
     rangeset_contains_range((d)->iomem_caps, s, e)
 
-- 
2.37.3


