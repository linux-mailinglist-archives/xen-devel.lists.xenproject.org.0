Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A0F74B18D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 15:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560496.876453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlH8-0004JQ-Aw; Fri, 07 Jul 2023 13:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560496.876453; Fri, 07 Jul 2023 13:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlH8-0004Gw-7z; Fri, 07 Jul 2023 13:13:30 +0000
Received: by outflank-mailman (input) for mailman id 560496;
 Fri, 07 Jul 2023 13:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHlH7-0004Gq-4a
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 13:13:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e5df52f-1cc8-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 15:13:27 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 09:13:21 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by DS7PR03MB5621.namprd03.prod.outlook.com (2603:10b6:5:2c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 13:13:16 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 13:13:15 +0000
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
X-Inumbo-ID: 0e5df52f-1cc8-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688735607;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SYqBHFTh4RNARwcUc0iS8nKLsc3UA1K1eLEP3zNIAHM=;
  b=ddp6TS8UNaWHbKAUKC+L9WUiAZkRSHJtp54xAa1G8ogl9bLNUCUZ6s9Q
   KOj5QQzccLatkGeu5rIAvmG9jDahqfWhoXjFiOfGwFY/Gdx7v12KkGDSs
   gMthv/f8gXFXk4mgc1nWtHVWUP0nrAAYXOdinb2PBTQhierHoNZBol8jr
   s=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 114782644
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cbo+bavsjgjX3JuIZaFfYhjHOOfnVOZfMUV32f8akzHdYApBsoF/q
 tZmKWmObvuLM2L2L4gjPN+/p0sBvpSEnYNrSAs5/Hw2RS0X+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACGyCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBGtUNwCZu+6K5omcQ8VpoPgPfNfHM9ZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60bou9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAd5NROfmqqICbFu73DwJCEBODV6AheSUthSvAY5vJ
 ksu5X97xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52ml0bbZ/A+DGi4ETzpNZdY8vck6bTUv2
 hmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN07h8MRy7+y+1yBhju2v4XIVSY8/ACRVWWghitHY4qia52t+ELsx/9KJ4aETXGMp
 HEB3cOZ6YgmCpWAlzeERukXK624/PaOMDDagllHEoEo8nKm/HvLVYlK/Dx7E0J4Pc8FdCHBb
 VfavEVa45o7AZexRap+Yob0B8F0y6HlTI7hTqqNMIsIZYVtfgia+i0ofVSXw23mjEkrl+c4J
 IufdsGvS30dDMyL0QaLegvU6pdzrghW+I8ZbcmTI8iPuVZGWEOodA==
IronPort-HdrOrdr: A9a23:+sM0XKqQH5FwFIleG7PXYdQaV5r7eYIsimQD101hICG9Evbzqy
 nOpoV46faaslossR0b9uxoW5PwIk80l6QV3WB5B97LMTUO0FHCEGgI1+vfKlPbdREWjdQtsJ
 uJc8JFeabN5VoRt7eB3OFveexQveVu88qT9JvjJ28Gd3APV0n5hT0JcjpyFCdNNW577cpQLu
 v72iJfzQDQAEgqUg==
X-Talos-CUID: 9a23:IlPbe2+nlv1XL4WNZCSVv2JPQ5k1aEHR8FHrBEaUDEBVZO2LZVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Ajt7KHQ+h/T2rDDLh4snslmuQf904+aTzUBgIqrE?=
 =?us-ascii?q?blvXeJHYsCzqativiFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="114782644"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWogiS5v1/JTZfk+z1LRq6euaJeSOID+GcLRn/5fHHAziIMdg/mzYkpc0vMc1GtrjvRW4zAi4BDuuWRcID2/q9QkRacQiAxRk1h3AZf27ABRiTDwFi93Y3/id0feTN1QaHei2m/Vbk4RbmQw+Sq9om4irBBMc+4RTHQcEAGjjPE8ERHMDZlztPqLLQrTq67B6gcrWARKHw8Jj1Iqs+KmuxQyX+o8mIJXgYvqakAlr4BzJKEHrD5vs+njvn5QHct+GFF4qT3XNiBSVh13gm+DmJ5WBJ75xoWK+hf8UV3oWQ5OYtfyHtltuBwTMLvrvzPr2bxAh/RrRPhQhq0CaPDC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ+o5mY7M1XiBRfnC5QMqr9tUX6O/qoN4fcud89xSAA=;
 b=li/5eqkEqwKqKomiaiLz92u5amA6ru6V1ST+/5wjpmkOv++BNZbXXSgr2F2ZkompG0MR9yIBqBJH/COCaLdLycKsghuYaHqO1czvGWzmm9nYJfn+MHJNUqFFNz+UaCxL68eUtt5KjdZCA9MbokYRnBhKixK+sxiGZBUH0REYWxUTNOlUiptCIwMLvFUTy6+LfxoXmuFkdWUiYV/JAJ0DEplPyq/IVXL2QpNyNs7rA8kbK+8Hwo0tJziHP1mZtXFmWnPxEygVgdh88FIDK2YDShXqd0kU2wEQTkBWtLUJ7oK+4ojlCKWn7IST6srE5QZq2DbnuXxYWDuK6V4KwRAUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ+o5mY7M1XiBRfnC5QMqr9tUX6O/qoN4fcud89xSAA=;
 b=i9lz5x+HD7IKldvcUJm6gLoQfUO/MQixkit+f0V954aOEHU4COPgKfu0beW+AZqhm9/61ngOEpqGIqEeELLwfcjuJ00LeTgvKRGr6h0bP92wfPXKtO326jEkxYqGRwnkSIBnEsGyTKiqjH892KEIQTXE1ywSMXigOiCuAhZoVfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 15:13:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Message-ID: <ZKgPZGXY7dkDLnQR@MacBook-Air-de-Roger.local>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
 <ZKfjoXqb6Kgav-vL@MacBook-Air-de-Roger.local>
 <04c05db8-1e15-f2c1-ebc1-0563d442a808@xen.org>
 <ZKftKtkjgFLWaW_x@MacBook-Air-de-Roger.local>
 <7f89a925-6c4e-7840-041b-2e0816ed7b71@xen.org>
 <ZKf4PMkKF3x2VwXl@MacBook-Air-de-Roger.local>
 <9ca3724c-6ee7-9853-524e-6f55b3702dc4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ca3724c-6ee7-9853-524e-6f55b3702dc4@xen.org>
X-ClientProxiedBy: LO3P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::13) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|DS7PR03MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf95b4c-de1b-4dac-f261-08db7eebec85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	arb1W1/D3mbwwGmeH3wzg/KBTWbySdosrjU21xr03O8/22A/AMKR/wcN3xGF1iVMoHOsN4GDrMXTeu96hf9t5YlDJRfSdh1U6qNgHqWIYlLSVFjYo+pIi9gve+U+TLfBeKEdpHMlHA/5JamFpCT38m79ra/5pxPFTmsK0xyOUHcIbatZz7+BuWW0CxVfLarRgIopqvhNSZogSjKyqEIuDBfyjdp4hzldhhD4hPgi3/YCxMNVb6uj/QmHqs1WYUZ6maYY653msz14ktPCsnvt/QKISwLZSq50kO9I8Hj5H2FGaLpSP5IFGggL1IyO6WmNtHKWbtU6dntUB9iNA3Z6T8z5xfhLM4VDWkSyMYs2Z13XskZOLI096N8tgXR6zn/H7iUt4q15JcxhLSp2ZlruRrqYH8CCVUVs2LPp6wX87PYRiaxayCf+VEwjff6PGL4iR3c35ZVFgNCCiPMJ40R3z/xvkUsejJUsnRJ5BrwOk6DRlx4nImmKazOaZMYxLjJ57zMpGEZGxPYRXeLGbLFHSVgwvCsKCPeAXFt4Tt0KFdAH243Dv5gNuHkMEHvsMfmP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(8676002)(6486002)(478600001)(4326008)(6666004)(6506007)(53546011)(83380400001)(66556008)(6512007)(26005)(186003)(5660300002)(2906002)(6916009)(8936002)(66476007)(9686003)(316002)(41300700001)(86362001)(85182001)(38100700002)(54906003)(66946007)(82960400001)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enVyZ2Qwcjc1cExEaWdrUjN3R0FCZTdhdTVvTStNSVFOUVVVU2ZSVmRWMjBi?=
 =?utf-8?B?aEIzT3BLdXNsenR4RFUzRTFiSXRBKzI0OHRtNlpSaEsxcHJuaEpHYk1rK21m?=
 =?utf-8?B?ZmttN3I1cFdVb0ZrbXF1TFgzZ0tQTFk2UURGRENWbk1FOVlXL1lIWnhPcmdX?=
 =?utf-8?B?WXhOYnovUUx2NE8yTE40YVhYb2dCRGdhYktJSnhLdnF3dHR6cXVjSG4xRU9D?=
 =?utf-8?B?NTNESklTNnE5c0NWQnRUOERhSUdSRzUrT21tZ3h5MGFoSzBKdzBCaTBYbFVC?=
 =?utf-8?B?Y1N4NU54MXJpQUxCcE40a2s1TEZNRGZLOWJ0clhTczdKZU1UVVhEOEJxbG9x?=
 =?utf-8?B?cWtGbXoySlJ6WWhHQ2xiTzBhQTlPQ05wMzUrOTdrMDVXY2wxOXRieHhRUXdv?=
 =?utf-8?B?WUcrSGxXZndXRFlOeHg4V3JQVjhpRXpYR0JpczNxdTM3T3RZUndwYmdmbUhW?=
 =?utf-8?B?eitOeExhWWZNb1hvM3FhRzdyWkFtd3FyU1Y1S2lFeGNLYkhwL28wUFJybUM4?=
 =?utf-8?B?a0dGY1kwZHlGSkE3bXdXOVQwVzlVbXBOODBCaXlXV29EbUR5VEplNE1Kdzlj?=
 =?utf-8?B?aHJHOW1wTUZoUTZlOTVKcnJqQklvQnArRkEwQkJ4VzBuNEkrT3VCN0c1cEZJ?=
 =?utf-8?B?YjJBRnRoS0xFbkJmM0JOTmM0bExuV0ltSVFrWGN1Vm9UOHk1VlpZdGRUaDVE?=
 =?utf-8?B?UUJVcHhSOEZkb29aVERYQ1hnbGZYMWplamRHelhoZUFUWWdDaVdDS2x2Tndp?=
 =?utf-8?B?NlJrT29LOWhOUlVNK1psdWFId2doc3NoSUpKQ3IwUUZrRktwMTdJNXowQmRN?=
 =?utf-8?B?V3JRWWNSTjhFTnF4RUhrS3I1bFRFc0N2L0graG9aSW5oV292bERsam9zdXl4?=
 =?utf-8?B?dnpTL3I5dm12K2lnOU51MzRlaXcwZXpYSjRiRlZIQjNDbFN5TGhaUlFMdEhX?=
 =?utf-8?B?V3J0ZHFRM2R4OE91aU9wTzN1eDVXNHl4R0hxaW1WWjJHeDUydTRpTzNJUjl4?=
 =?utf-8?B?NmVDaU84TG44MWorNHluVW43b2lxaTMwMnVBa2tqVlRiZHF1UEZHSW5xdjBO?=
 =?utf-8?B?Z3FCRE9rYzVmcWpIdGpndnZLdSs2OEFSMktDQ0djQUxJRnV3YWd5SEhJWlFO?=
 =?utf-8?B?M0xBU0xDTzEwSWFxQnoxYTNTOTFwQnJBSHRTdnhGUEFFWUpXMHpFVURHWXJo?=
 =?utf-8?B?bEtiTStLd1ZrbEVMaDJUcWtIWDlIMlNwalcxSWJqNWhiSHlTUmh3VmQ1aHp2?=
 =?utf-8?B?VEtXK1dKeERIbVlyL0N3SlVTeEx5cmZXSTFhOFpXMlAxdCsrSzI0b0lvdWl4?=
 =?utf-8?B?VFM2WDNrbkxGTmkzaWdTVzR6WjNRYXJLajdJU051cm1wc0p0eGlmY1NmVjla?=
 =?utf-8?B?c1I1YUFOM292ZDVKcDgvZUJUYm1RUzhOa1RtazlReXo2OS9qbkY0U0M1UTJC?=
 =?utf-8?B?Qy8yL3I1NUZZRlBYdGJXNkNCK2swTUh2SWUzdTJ3SGtBcy9YS0pmUElJcUFw?=
 =?utf-8?B?aHdEdTVZQVR6cmJqUG0yeHVZSFdTQVBLcHdYY1E4aUd4dytrcENCVGRpMWY4?=
 =?utf-8?B?VXlnRzB6d21ULzRQa0FHZGdNOWxhSlR2TE1vd1VDOTFFeEdqL1hEL1RiMmNR?=
 =?utf-8?B?cGNHb0Jyc0JLWFVXUVVpTVBaOXpJWFhHM0lTSEVnby9WeENDN1JzcCtCakFB?=
 =?utf-8?B?RVZMUVR2RzRKdGdVaS9vNnVJbTlDTDVIWjFuRDFtOERRMlJRZ3kvck91YjUv?=
 =?utf-8?B?eUJxWGcwRmlLOGZxQXNpeDEvRFNBNU9VTElPNHpIWXFUS1QrTDJTaGM1dEVL?=
 =?utf-8?B?eElWZ2RISXNBenJ1ajBlbnMwRXBuUEJmQVBIM3h4SDJFVVNUdGxGeGhNdm52?=
 =?utf-8?B?RnhFV20rQTZyOVRWeW1PZkxMempmZmNRUW5zaGE2eldKb2ZWdTJyL2ZJYm5E?=
 =?utf-8?B?Rk9haXVETFlGS3Iwc0sxZzgzVm1GenJRalEvN0dLKytnNGRKNVIxR1pmMFRv?=
 =?utf-8?B?UC9sT0ZxY0Rpd3RHVmsrT1o4bHVHWHFCeWxnT1Y1TU1LQzhCM0tXRGlxWWow?=
 =?utf-8?B?RGpqZEJ3R2ZVZUR2STdkQ0pkUUw5WEc2RkErTFdsY0dOSXMrODc0K1hoOU5J?=
 =?utf-8?Q?UbT9M9XE4YpHQNhOYlAvltVQB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LWGHrRhcFG2EoxfFrGe8lNmxj5onTLdfOq+3yKXw3cy1auabf6lS9XqFAscNbEpj+jgoEfV1uuj5mhkmckdjt3jcMor8rVsEeuEmkXL65Gh0vepgYW2pfqO/LvjYW/Kk5PY33rAvsEkU4WBjo4/ZuHUkueh8TgXaEOG7ePVCBIRZdc/29EmYWRAchF3y4DD4GTGrCJDQVNZgv5tGYROMgkw7utdmYAi0tFZARZI08QvMSzHdxINws44hM1uIuVsPC1Z7OA8J1r2PbGvB42i1ZITcg5x5ptofbyCY/KHajQvHz3/hT1fgMiDdyVQrR4m/1+NEF2nVC6GjiVT/8qrlFCTd3t8OUyHgnn85NPwQpKKxWJmwN17vqmkEa4cedNN9T5JxcYHvzhSzvTZRLivAKicw1+AgvpIi8jAWfHRLor7x49Z9WDTopypZXsWOJ45HCpNOmSMPaWhAz0TqQ7vMUJwfJ+lhC0ckYmwZHkB84urTn30hCd6yMfP0np17tQ4CE5NQNIF3en1O6CfNi2CmvaJDJR3Ov8ZeBf351ykzIWrTAV7FBtj++UcgnmoRetsksz4mvmjW3LuehEGI6EqQLFdVsReZHGPMaW7bx9cV2IsVNU3hBw4oZo7pGxhgZEKg9++m/jBT07KRlkWGCTVWwDLMvRn6t781zm7TRyMhwXmPHOAGjUSTE7EzBLcj8SYsSSqu5cGuqx9BYMMVYIJMFbG62HfvLevfQUKR04QTuAfVXpuEaxFvkkKNwnwdxHucUdWPLp3zTAZIVWCsI6JXjHtMDhIUzz+ZOtajfV2LrkBFN7MrpQFQ2vS/KV3XkOn2c90c+Z8XODubzQjFNGBuOcqWME9rhPdFtzeH9KmHVtejXPPvivtryI+f5ZSor5DwGHU1+VXgqY3Pn/37i1mS/Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf95b4c-de1b-4dac-f261-08db7eebec85
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 13:13:15.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpwRjuCYYzSQa7HOHygsPxtSsSWsltn0JkGH3tTXlQjYpYHwYeks08skWw0XPYCWlvcISskrAh1xX0x/+GfXUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5621

On Fri, Jul 07, 2023 at 01:09:40PM +0100, Julien Grall wrote:
> Hi,
> 
> On 07/07/2023 12:34, Roger Pau Monné wrote:
> > On Fri, Jul 07, 2023 at 12:16:46PM +0100, Julien Grall wrote:
> > > 
> > > 
> > > On 07/07/2023 11:47, Roger Pau Monné wrote:
> > > > On Fri, Jul 07, 2023 at 11:33:14AM +0100, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 07/07/2023 11:06, Roger Pau Monné wrote:
> > > > > > On Fri, Jul 07, 2023 at 10:00:51AM +0100, Julien Grall wrote:
> > > > > > > On 07/07/2023 02:47, Stewart Hildebrand wrote:
> > > > > > > > Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
> > > > > > > > code base. It will be used by the vPCI series [1]. This patch is intended to be
> > > > > > > > merged as part of the vPCI series.
> > > > > > > > 
> > > > > > > > v1->v2:
> > > > > > > > * new patch
> > > > > > > > ---
> > > > > > > >      xen/arch/arm/Kconfig              | 1 +
> > > > > > > >      xen/arch/arm/include/asm/domain.h | 2 +-
> > > > > > > >      2 files changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > > > index 4e0cc421ad48..75dfa2f5a82d 100644
> > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
> > > > > > > >      	depends on ARM_64
> > > > > > > >      	select HAS_PCI
> > > > > > > >      	select HAS_VPCI
> > > > > > > > +	select HAS_VPCI_GUEST_SUPPORT
> > > > > > > >      	default n
> > > > > > > >      	help
> > > > > > > >      	  This option enables PCI device passthrough
> > > > > > > > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > > > > > > > index 1a13965a26b8..6e016b00bae1 100644
> > > > > > > > --- a/xen/arch/arm/include/asm/domain.h
> > > > > > > > +++ b/xen/arch/arm/include/asm/domain.h
> > > > > > > > @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
> > > > > > > >      #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
> > > > > > > > -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> > > > > > > > +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
> > > > > > > 
> > > > > > > As I mentioned in the previous patch, wouldn't this enable vPCI
> > > > > > > unconditionally for all the domain? Shouldn't this be instead an optional
> > > > > > > feature which would be selected by the toolstack?
> > > > > > 
> > > > > > I do think so, at least on x86 we signal whether vPCI should be
> > > > > > enabled for a domain using xen_arch_domainconfig at domain creation.
> > > > > > 
> > > > > > Ideally we would like to do this on a per-device basis for domUs, so
> > > > > > we should consider adding a new flag to xen_domctl_assign_device in
> > > > > > order to signal whether the assigned device should use vPCI.
> > > > > 
> > > > > I am a bit confused with this paragraph. If the device is not using vPCI,
> > > > > how will it be exposed to the domain? Are you planning to support both vPCI
> > > > > and PV PCI passthrough for a same domain?
> > > > 
> > > > You could have an external device model handling it using the ioreq
> > > > interface, like we currently do passthrough for HVM guests.
> > > 
> > > IMHO, if one decide to use QEMU for emulating the host bridge, then there is
> > > limited point to also ask Xen to emulate the hostbridge for some other
> > > device. So what would be the use case where you would want to be a
> > > per-device basis decision?
> > 
> > You could also emulate the bridge in Xen and then have QEMU and
> > vPCI handle accesses to the PCI config space for different devices.
> > The ioreq interface already allows registering for config space
> > accesses on a per SBDF basis.
> > 
> > XenServer currently has a use-case where generic PCI device
> > passthrough is handled by QEMU, while some GPUs are passed through
> > using a custom emulator.  So some domains effectively end with a QEMU
> > instance and a custom emulator, I don't see why you couldn't
> > technically replace QEMU with vPCI in this scenario.
> > 
> > The PCI root complex might be emulated by QEMU, or ideally by Xen.
> > That shouldn't prevent other device models from handling accesses for
> > devices, as long as accesses to the ECAM region(s) are trapped and
> > decoded by Xen.  IOW: if we want bridges to be emulated by ioreq
> > servers we need to introduce an hypercall to register ECAM regions
> > with Xen so that it can decode accesses and forward them
> > appropriately.
> 
> Thanks for the clarification. Going back to the original discussion. Even
> with this setup, I think we still need to tell at domain creation whether
> vPCI will be used (think PCI hotplug).

Well, for PCI hotplug you will still need to execute a
XEN_DOMCTL_assign_device hypercall in order to assign the device, at
which point you could pass the vPCI flag.

What you likely want at domain create is whether the IOMMU should be
enabled or not, as we no longer allow late enabling of the IOMMU once
the domain has been created.

One question I have is whether Arm plans to allow exposing fully
emulated devices on the PCI config space, or that would be limited to
PCI device passthrough?

IOW: should an emulated PCI root complex be unconditionally exposed to
guests so that random ioreq servers can register for SBDF slots?

> After that, the device assignment hypercall could have a way to say whether
> the device will be emulated by vPCI. But I don't think this is necessary to
> have from day one as the ABI will be not stable (this is a DOMCTL).

Indeed, it's not a stable interface, but we might as well get
something sane if we have to plumb it through the tools.  Either if
it's a domain create flag or a device attach flag you will need some
plumbing to do at the toolstack level, at which point we might as well
use an interface that doesn't have arbitrary limits.

Thanks, Roger.

