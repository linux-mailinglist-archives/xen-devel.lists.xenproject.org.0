Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0B4ADC99
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 16:27:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268443.462279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHSOC-0005qC-Dm; Tue, 08 Feb 2022 15:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268443.462279; Tue, 08 Feb 2022 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHSOC-0005oN-9k; Tue, 08 Feb 2022 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 268443;
 Tue, 08 Feb 2022 15:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHSOB-0005oH-BU
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 15:26:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38e6e01a-88f3-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 16:24:37 +0100 (CET)
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
X-Inumbo-ID: 38e6e01a-88f3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644334001;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fyT0vCfAx1ZQqdpw9MwMrq4qkuWzIqACc2UASZ9b1dQ=;
  b=TxElDE02InimppUaryyS/n8bsekaItyhEu+xRBbhJHxjboilTYa9eMA3
   YlyTngqrQgzU3wEG5UazYJo/4jLC0dz0RGNFcxI+4kmKcbBWvzs140iVx
   BJV2CfzmrXj2P1scUVjFJYpCDAiYDqu4KU2HPTMr/xWybTaZ3e9VEJyWI
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BIwt2bXWhsK5nFDPpnRt+LQapKvWHp5mTf696X1uy5SEz6VzjwHKDfxKwrAe6SvZJiuLowqOAP
 oW6mZRa/eIaK25sJitXPafVUZh/HfDVG0aBU26GbYxmeEZJEyws2Nf0zPgJi4AFr1y4XEqfqc3
 3lw88yeoj2ngNYDNWw3JlRUOKO3mvjY4WLTb6bOIdhm7WQ3zQzMCCVPbR3DaJgQp3/oYM4QeR/
 tsanlBtuOtjgFVFmfCQZcPxUQ8qtvJFoX/oOvjRKJep3wEom/LvjBLW4WE1yEyIVIyatkiFKkZ
 nzyHBlnXXydq6N9UnvMFBFQe
X-SBRS: 5.1
X-MesageID: 63200731
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XlREjK4lFSvPCWJz6FnLdQxRtEnBchMFZxGqfqrLsTDasY5as4F+v
 jQYD2iPOv/fYzSmeI90bIrk8xgHupXSzd9lGgY//ykyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2t4w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 IUSkaT3TA4SY/Pqx9ZFAicDQ31gIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxq3pgRRq+2i
 8wxRQVjTUnNWAJ1GGwwS8wursyj3XDGWmgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt6Wmwj+XCmSf6XoM6F7Ci8PNuxlqJyQQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGSoQ8f8WVukoXeClh8aR9dUVeY97WmlyLfSpQCQBWEGTztIQN0gqMIyAzct0
 zehgNfBFTFp9rqPRhq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIa3gcfyAirY2
 C2RoW41gLB7pcwW06S2+3jXjjTqoYLGJiY37AjKWmOu7itieZWoIYev7DDmAe1oddjDCAPb5
 T5dxpbYvLtm4YyxeDKlYLVSOInu4v++bWP63mw3Tqd6p2iz5Cv2FWxP2w1WKEBsO8cCXDbmZ
 k7PpA9cjKNu0GuWgbxfONzoVZlzpUT0PZG8D62PMIISCnRkXFLfpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/p7imlXxLMpLEPRZ5rIvp13PUP4gEAFus+lm9z
 jqmH5LiJ+9jeOP/eDLL1oUYMEoHK3M2bbiv9ZALL7/ae1Q3Qjh6YxM0/V/GU9Y095m5a8+Sp
 i3tMqOm4AaXaYL7xfWiNSk4NeKHsWdXpnMnJy08VWtEKFB4CbtDGJw3LsNtFZF+rbQL5actE
 5EtJpXRatwSG2+v02lMMvHV8tc4HDz13l3mAsZQSGVmF3KWb1eSoYGMk8qG3HRmMxdbQuNk+
 +L5jV6AEcNYL+mgZe6PAM+SI5qKlSF1sMp5XlfSI8kVf0Pp8YNwLDf2gONxKMYJQSgvDBPDv
 +pPKRtH9+TLvaEv99zF2fKNo4uzSrMsFUtGBWjLq72xMHCCrGakxIZBVseOfCzcCzyoqPnzO
 70NwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 xvXqNlXMLmEIu3/F1sVKFZ3Z+iPz6hMyDLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNPsl6xkBsnNNqCnxt4zWXUIyxSSbgju7EbHJTv1lghxGZdbMGOESTx+pyONYlBaxF4P
 j+OiaPerL1A3U6eIWErHH3A0OcB15QDvBdGkA0LK1iTw4eXg/Y22Fta8CgtTxQTxRJCirohN
 m9uPkxzBKOP4zY325QTAzHyQ1lMVE+D50j861oVj2mIHUCnW1vEIHA5JevQrlsS9HhRf2QD8
 byVoIo/ve0GoC0lMvMOZHNY
IronPort-HdrOrdr: A9a23:sRTl7KhwrtwP2oKb0C08lGb1V3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="63200731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKcUztD0rQHYioHQm/00q2Yc6rSGd5LN6uOsCFKoEf9lWWyq08O3J1UskFSI68bBnhv0BnQt0Fuhd4Te8rt0B666eoP7EOD+MniMawxUcAZ/LPn34BtQLyF2V0NSWH/qDnULvpQ5tNwpbA5jhXVzNrrhY8i5b8CcOPJnUlnnX2KaZrZZ1adreBSmVOIbYASn0B5GTht+s508XtrQ3ayV9NhlVzGELlkWCcUJ44wfN9SGFK3WPMrfBkrKr+0dbrXkDnoRv0gCqGTDt8nQwId7d++6WVMiIGS1V2+ov77KNx5Sl1p8xFK7LybxTACytl4D6RpulmGuZ0lTNzjLCbyL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2/1lksse+ybjWY2ukmke7t3TXw+dHDefZ9VtKNrgec=;
 b=LXQs4gFUKjJfzzcyARbkbKX/JynJ9e5GI3I8GllVczjmlTM3Vei4sLGRvEYBfDWV1N2p6t9JeU0h11ndBy5Sig1l4qvZBmakOT4pmrddhLmv6E8v1afhaqkRjGGrRxErlb5xPHKEZ42i9whqXHC42F7uoKle7AFbmAn+g0K6Ayg1KZny45nGS84wixI+oFKQSLQFoVZEbwr3CrmvZOvjCcme8YsKwe1leVKxJzm3p51IOI8PTTxLu7obsZAatexK8wieIv/p8jqwoYXS5RB9cCJ+NHuFT1VNj9eLedWMJg61X4CzkBfdT8XiMqea+nX4KKCVQR8qeOrOR3cxuWizQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2/1lksse+ybjWY2ukmke7t3TXw+dHDefZ9VtKNrgec=;
 b=Q4/4EtzfB9VYcFoQuR9B/YoQhBoOS2j5/jRWKsT1VkYB+kLPKJISFhMdXhItP/LQlnf+KDCaOjjggUB1RLf5fc8Uz5oHhPhxt+hJw9qShseFoehwmRfpP00F9poikRTx6Ane9Vc+N8n6d7JmRs0gHnlRsbYg8EH1bI++ez4sF/A=
Date: Tue, 8 Feb 2022 16:26:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YgKLpCnhjP18c7oo@Air-de-Roger>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220207182101.31941-2-jane.malalane@citrix.com>
X-ClientProxiedBy: LO2P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8132a86-9fe6-46bb-05d5-08d9eb17637d
X-MS-TrafficTypeDiagnostic: SA2PR03MB5708:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <SA2PR03MB57083F0EE7BA668CCBF098598F2D9@SA2PR03MB5708.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTbiVkem4CWEZ6xiAAgJuxtIrOpnj/o0ZrN4cXPF+qlt1zfyRMWRhPrj5odWDd//SL6lXg6ipS51D46cTzILLBz6t+Kz0tOfLaXuAP9Y0Hei4v9BYgdR+hfjKeWUaXvHFrxQJnOFQnVtrzRb8si32PWHt+O2mkg1Pn0ozmYEdFIJ9b8A8QE2S0rSG8qwPY7kVwPFW8SMYaTnW6/OUt1JWqxYuSKjUeBhctS4T7LYRpeDdE6R2V2xOFtv47Yv2KfpY6YkZtK6nZPr78z+Gs/lcuRByPDiqji5CO5l38yZ0Sq7DqknVAKXd9ZArSCA9Psh9Esw1llRkSqtIvaJF9Ujud8nxqAvnwci+rONLgdLR1SEtD9PoUujdMSqNqKXFWb1AxwPOjzzaJb5y9ZgXvgVIrbZkbnTv+rx8y7v2acVy3By4yjLU+BX9QXslkAqKk2Uc4CSUMgC9F6rwHyzRCOZ1iebEfe0EodZ0f9PXToAyaew6xRUke+bgKjxqiDdRWpJMdoUz9qhM56CsEW0nsY1IlSCgvi2YI3rricIs4PsCpv5YRUm9iFA+JBBXls7GBTCkAgJPZbSj5g63Buq1IqA8iggboFqgRTxsfvX7rxjI7wicP23c5NsUYq/CrAqK6DwZ38V4a/okIPnv0JSHnu8bT4OfepW2BMbNcyLM7evTJoeS6lhA/VYmW3MRmPUpl4Ghxgarcjn2uO0UKf2Arxy8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(82960400001)(26005)(186003)(38100700002)(33716001)(83380400001)(316002)(508600001)(54906003)(6636002)(6506007)(6486002)(4326008)(6666004)(66476007)(66946007)(66556008)(85182001)(6862004)(8676002)(8936002)(7416002)(9686003)(86362001)(30864003)(6512007)(5660300002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1pJU2xiQk5JSVYxQzYrWjdEc0E5ZjBvaWtyWGZPN2JiQnRSNG83Zndkbll1?=
 =?utf-8?B?bjRrZGJaWlRBbDA3UkxxVjJuQXd3azZWUExqY29GUGZTaDVLWWgwKzQ2S1U3?=
 =?utf-8?B?WTgzdXlqRUoyVmxnUmExRFJqSnh1cndsODgrd1p3Z0s1eUhJMzVySnBuQmtC?=
 =?utf-8?B?RUEyWHJGRC94VkJXbmV2SUpmczJlZmxoZWViTGYwL3VOOWs4aDROZ0w5Q2VU?=
 =?utf-8?B?V2FndVRQWElReXlnOWQxTlV3dUFnd04xREtwUm03ZlNlWmZBNzVyUEZHVW1L?=
 =?utf-8?B?UVExcHMvYlFXSUQ3VXFKVWZTdEY0NEN4SHJZR0xZRitWTXVUQ1ZZUDJXTHZ3?=
 =?utf-8?B?c0ljVjZVUDRNelptZE1vb1hyZ0ZPaXFMTGIzM3F0SXpDclY3d2M3aEt6eFQw?=
 =?utf-8?B?NDdGclVBa2NteGdLcXlGN2trSzFqQ1lzYlgvS21yb1l0dE1iWndMKy95TnFY?=
 =?utf-8?B?c2tGTy80RXdEQ0Z5TEhkb1d0WHljdnh1MFRkakwvSzFRN284RGUyS0pUMzQz?=
 =?utf-8?B?NnN3cHpwV0dBNGgxTE9uRWFLV0VvK3hvbDIrRHp0b2tuMGRrbjVpVURkSXUv?=
 =?utf-8?B?ZGovV1VYWVlVTlA1aHRISkphY3JyWFRGWnNkcXVFR3BBMEZjVnJIUWRsdkFm?=
 =?utf-8?B?VUE5Z2ZVYWJlb1dzQTQrQTJSeW14L29oVW9HY3FSbEQwWFg1OTRjWjZFcEVQ?=
 =?utf-8?B?c2cxbmZXdHAzK3loK09iNnhuOFM1OG44Wk56OW84QmVxR21CU2FMQU8rZmQy?=
 =?utf-8?B?M1B3SFZIcnhqVzVmOFFQeEc2ejhYS1Fib1ZEejB2dm5hQUgyZFhSM1FxcVEw?=
 =?utf-8?B?LytmQ2NGQ2tOeU92eWdnRVNqZ3plb3B6dy82K0RIbGVmNHU1bE9Od1JhK0t5?=
 =?utf-8?B?cVJZL1hlb2x2cUg3YTQ2QTYzb3hRSFpwdXhvTDZBQ1dMaWpPWHk2ZjI1dzRt?=
 =?utf-8?B?UWpxYi9NRWNCZVduWDdza0FRK0s4YWVDT3Axck52WExBR1VqaVR4L0NjNDhy?=
 =?utf-8?B?Nklpc3dtSjdOU3dod0dzK2l0SGNHYzh1dU9Pa3JaaE0xZHhjbDR1V0RCK25H?=
 =?utf-8?B?R1RuY0pITldETFdBYjUvMG9WTXdsRzhzU3NKdGNneUloVThDeVQrOGh6ZkFE?=
 =?utf-8?B?RE5LN0pSVUtTUElRd0plNkk2VGlnZEpKOW9GVENGNm1QeEhzUE45cU5sZDha?=
 =?utf-8?B?MXhnWXA0V20yYkFydTd1ZWYrVFV0QWp3dFNOVitWSm5ua3hUaXVWL0c4WVdV?=
 =?utf-8?B?ZHJXUlFiWTJ0bXRWNlpzTE9TU3I1UmpyNHU2cHJYQ2RwUXhBTEFiVERDYVNu?=
 =?utf-8?B?OVVnT1hjSlMrYzhUYzdWTnE3dk15bnFpaXBsdWV5eHpqNkdUc3FiVTVkR3M1?=
 =?utf-8?B?T1FsL3dyM091SDJzUHd1QUlUbWpYdXRaVDQ2RTBWU1M2VGdBQ3lMNk9RUHpH?=
 =?utf-8?B?endyTVJINXByakN6MmtGclZCek9hTVFqUFR5RUpBRWJzeWZSUzVadWMyUTA2?=
 =?utf-8?B?RmtnOVl1MThTSkRMNmUrMVBrU3ZNUTZXZlRoNGVuWXFlVll0dFV4Q0RWa2Uw?=
 =?utf-8?B?dnJ6M3lEOFU4eEsySEd4dEF0RTJuV215S0MwMnB5bXZzOHlQeUl4SXJSZnRH?=
 =?utf-8?B?S21wdDRuS1l3b3krenBDSkJxbE53UmtTRDZvMlovWVRLa3RXeG13OGozSGxn?=
 =?utf-8?B?eWM0cFEvc3hQL3VpRjUwMHgxdGU4WFdzM1dUdkpTTnl0YU1OWURYNWRFOWM1?=
 =?utf-8?B?aXYvNUZacFMxRC84aTcrNjIzekNIOC9LNENqRnExYmJIQjdxWTlIMDhWU0V4?=
 =?utf-8?B?Z1AzcU9kRk1wVVNGZmhkdU42Ui9ncE9nUEhRKzRnMFpsWEJYbm04clMyU1pk?=
 =?utf-8?B?c0Fza0hiejJCZWNtcXNqazVnMFYxM1F0S0k2dFpJa1NSMXNKNGlGYllqd0xs?=
 =?utf-8?B?SXV2NWVYWGlOc2NHVGlqd3orSHc4T3BnRVpHRTJWbzZ6R3hJZlYwZkJVbGk5?=
 =?utf-8?B?WWNrU2dxZGgzcXE5UFJCWjBmM3p1aW8zdXZVVjQ0Nk5HdVo4TEI0RFNOMEl1?=
 =?utf-8?B?WEdoTkxwRTd2c0huc0RDQkI3R2QvTFNiSktRMS91N1I2eHN2bTY5TFZDaW5M?=
 =?utf-8?B?VVEwMEpvZUlLdHJkSWU5MkhqbXBIQmc5eVBrYmJVbnExazZQRVFNQVBtVURu?=
 =?utf-8?Q?T0GjVSQumjJg05xS7BONghg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8132a86-9fe6-46bb-05d5-08d9eb17637d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 15:26:33.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IfbTSxBG0y8dcnpHJA/AaubIohJ2NuN7HCROBqvOwtxcYDr8zGuI6KwH71UzX/s7rWhbpp8l7zApTDddie8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5708
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tag order should be inverted, first Suggested-by, then SoB.

> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v2:
>  * Use one macro LIBXL_HAVE_PHYSINFO_ASSISTED_APIC instead of two
>  * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
>  * Set assisted_x{2}apic_available to be conditional upon "bsp" and
>    annotate it with __ro_after_init
>  * Change XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X{2}APIC to
>    .._X86_ASSISTED_X{2}APIC
>  * Keep XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X{2}APIC contained within
>    sysctl.h
>  * Fix padding introduced in struct xen_sysctl_physinfo and bump
>    XEN_SYSCTL_INTERFACE_VERSION
> ---
>  tools/golang/xenlight/helpers.gen.go |  4 ++++
>  tools/golang/xenlight/types.gen.go   |  6 ++++++
>  tools/include/libxl.h                |  7 +++++++
>  tools/libs/light/libxl.c             |  3 +++
>  tools/libs/light/libxl_arch.h        |  4 ++++
>  tools/libs/light/libxl_arm.c         |  5 +++++
>  tools/libs/light/libxl_types.idl     |  2 ++
>  tools/libs/light/libxl_x86.c         | 11 +++++++++++
>  tools/ocaml/libs/xc/xenctrl.ml       |  5 +++++
>  tools/ocaml/libs/xc/xenctrl.mli      |  5 +++++
>  tools/xl/xl_info.c                   |  6 ++++--
>  xen/arch/x86/hvm/vmx/vmcs.c          |  9 +++++++++
>  xen/arch/x86/include/asm/domain.h    |  3 +++
>  xen/arch/x86/sysctl.c                |  7 +++++++
>  xen/include/public/sysctl.h          |  8 +++++++-
>  15 files changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index b746ff1081..dd4e6c9f14 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -3373,6 +3373,8 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
>  x.CapVpmu = bool(xc.cap_vpmu)
>  x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
>  x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
> +x.CapAssistedXapic = bool(xc.cap_assisted_xapic)
> +x.CapAssistedX2Apic = bool(xc.cap_assisted_x2apic)
>  
>   return nil}
>  
> @@ -3407,6 +3409,8 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
>  xc.cap_vpmu = C.bool(x.CapVpmu)
>  xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
>  xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
> +xc.cap_assisted_xapic = C.bool(x.CapAssistedXapic)
> +xc.cap_assisted_x2apic = C.bool(x.CapAssistedX2Apic)
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index b1e84d5258..5f384b767c 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -389,6 +389,10 @@ RunHotplugScripts Defbool
>  DriverDomain Defbool
>  Passthrough Passthrough
>  XendSuspendEvtchnCompat Defbool
> +ArchX86 struct {
> +AssistedXapic Defbool
> +AssistedX2Apic Defbool

Don't you need some indentation here?

Also name would better be Assistedx{2}APIC IMO if possible. Having a
capital 'X' and lowercase 'apic' looks really strange.

> +}
>  }
>  
>  type DomainRestoreParams struct {
> @@ -1014,6 +1018,8 @@ CapVmtrace bool
>  CapVpmu bool
>  CapGnttabV1 bool
>  CapGnttabV2 bool
> +CapAssistedXApic bool
> +CapAssistedX2apic bool
>  }
>  
>  type Connectorinfo struct {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 2bbbd21f0b..924e142628 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -528,6 +528,13 @@
>  #define LIBXL_HAVE_MAX_GRANT_VERSION 1
>  
>  /*
> + * LIBXL_HAVE_PHYSINFO_ASSISTED_APIC indicates that libxl_physinfo has
> + * cap_assisted_x{2}apic fields, which indicates the availability of x{2}APIC
> + * hardware assisted virtualization.
> + */
> +#define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
> +
> +/*
>   * libxl ABI compatibility
>   *
>   * The only guarantee which libxl makes regarding ABI compatibility
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index 667ae6409b..fabb474221 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -15,6 +15,7 @@
>  #include "libxl_osdeps.h"
>  
>  #include "libxl_internal.h"
> +#include "libxl_arch.h"
>  
>  int libxl_ctx_alloc(libxl_ctx **pctx, int version,
>                      unsigned flags, xentoollog_logger * lg)
> @@ -410,6 +411,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
>      physinfo->cap_gnttab_v2 =
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
>  
> +    libxl__arch_get_physinfo(physinfo, &xcphysinfo);
> +
>      GC_FREE;
>      return 0;
>  }
> diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
> index 1522ecb97f..207ceac6a1 100644
> --- a/tools/libs/light/libxl_arch.h
> +++ b/tools/libs/light/libxl_arch.h
> @@ -86,6 +86,10 @@ int libxl__arch_extra_memory(libxl__gc *gc,
>                               uint64_t *out);
>  
>  _hidden
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              const xc_physinfo_t *xcphysinfo);
> +
> +_hidden
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src);
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de0939..39fdca1b49 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1431,6 +1431,11 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
>      return rc;
>  }
>  
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              const xc_physinfo_t *xcphysinfo)
> +{
> +}
> +
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src)
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 2a42da2f7d..42ac6c357b 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1068,6 +1068,8 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_vpmu", bool),
>      ("cap_gnttab_v1", bool),
>      ("cap_gnttab_v2", bool),
> +    ("cap_assisted_xapic", bool),
> +    ("cap_assisted_x2apic", bool),
>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 1feadebb18..e0a06ecfe3 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
>      return rc;
>  }
>  
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              const xc_physinfo_t *xcphysinfo)
> +{
> +    physinfo->cap_assisted_xapic =
> +        !!(xcphysinfo->arch_capabilities &
> +           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC);
> +    physinfo->cap_assisted_x2apic =
> +        !!(xcphysinfo->arch_capabilities &
> +           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC);
> +}
> +
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src)
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 7503031d8f..7ce832d605 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -127,6 +127,10 @@ type physinfo_cap_flag =
>  	| CAP_Gnttab_v1
>  	| CAP_Gnttab_v2
>  
> +type physinfo_cap_arch_flag =
> +	| CAP_ARCH_ASSISTED_XAPIC
> +	| CAP_ARCH_ASSISTED_X2APIC
> +
>  type physinfo =
>  {
>  	threads_per_core : int;
> @@ -139,6 +143,7 @@ type physinfo =
>  	scrub_pages      : nativeint;
>  	(* XXX hw_cap *)
>  	capabilities     : physinfo_cap_flag list;
> +	arch_capabilities : physinfo_cap_arch_flag list;

I know very little about Ocaml, but I think you are not setting this
field anywhere? I would expect a call to ocaml_list_to_c_bitmap and
then you will likely need to define XEN_SYSCTL_PHYSCAP_X86_MAX so you
can check the options. See XEN_SYSCTL_PHYSCAP_MAX for example.

>  	max_nr_cpus      : int;
>  }
>  
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index d1d9c9247a..a2b15130ee 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -112,6 +112,10 @@ type physinfo_cap_flag =
>    | CAP_Gnttab_v1
>    | CAP_Gnttab_v2
>  
> +type physinfo_cap_arch_flag =
> +  | CAP_ARCH_ASSISTED_XAPIC
> +  | CAP_ARCH_ASSISTED_X2APIC
> +
>  type physinfo = {
>    threads_per_core : int;
>    cores_per_socket : int;
> @@ -122,6 +126,7 @@ type physinfo = {
>    free_pages       : nativeint;
>    scrub_pages      : nativeint;
>    capabilities     : physinfo_cap_flag list;
> +  arch_capabilities : physinfo_cap_arch_flag list;
>    max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
>  }
>  type version = { major : int; minor : int; extra : string; }
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 712b7638b0..3205270754 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -210,7 +210,7 @@ static void output_physinfo(void)
>           info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
>          );
>  
> -    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
> +    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>           info.cap_pv ? " pv" : "",
>           info.cap_hvm ? " hvm" : "",
>           info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
> @@ -221,7 +221,9 @@ static void output_physinfo(void)
>           info.cap_vmtrace ? " vmtrace" : "",
>           info.cap_vpmu ? " vpmu" : "",
>           info.cap_gnttab_v1 ? " gnttab-v1" : "",
> -         info.cap_gnttab_v2 ? " gnttab-v2" : ""
> +         info.cap_gnttab_v2 ? " gnttab-v2" : "",
> +         info.cap_assisted_xapic ? " assisted_xapic" : "",
> +         info.cap_assisted_x2apic ? " assisted_x2apic" : ""
>          );
>  
>      vinfo = libxl_get_version_info(ctx);
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 7ab15e07a0..4060aef1bd 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    if ( bsp )
> +    {
> +        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> +        assisted_x2apic_available = (cpu_has_vmx_apic_reg_virt ||
> +                                     cpu_has_vmx_virtual_intr_delivery) &&
> +                                    cpu_has_vmx_virtualize_x2apic_mode;
> +    }
> +
>      /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
>      if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
>                                          SECONDARY_EXEC_ENABLE_VPID) )
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index e62e109598..72431df26d 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -756,6 +756,9 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
>                        : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
>                                                : PV64_VM_ASSIST_MASK)
>  
> +extern bool assisted_xapic_available;
> +extern bool assisted_x2apic_available;
> +
>  #endif /* __ASM_DOMAIN_H__ */
>  
>  /*
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index aff52a13f3..642cc96985 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -69,6 +69,9 @@ struct l3_cache_info {
>      unsigned long size;
>  };
>  
> +bool __ro_after_init assisted_xapic_available;
> +bool __ro_after_init assisted_x2apic_available;

You could likely shorten this by dropping the _available suffix.

Thanks, Roger.

