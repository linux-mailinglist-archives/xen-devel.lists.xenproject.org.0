Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48825B8A62
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 16:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406984.649407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYTIa-0001dI-NV; Wed, 14 Sep 2022 14:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406984.649407; Wed, 14 Sep 2022 14:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYTIa-0001aB-KZ; Wed, 14 Sep 2022 14:23:32 +0000
Received: by outflank-mailman (input) for mailman id 406984;
 Wed, 14 Sep 2022 14:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VL8e=ZR=citrix.com=prvs=249e2d04f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oYTIY-0001a5-EK
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 14:23:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb7a7bc5-3438-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 16:23:27 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2022 10:23:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5551.namprd03.prod.outlook.com (2603:10b6:a03:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 14:23:11 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 14:23:11 +0000
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
X-Inumbo-ID: cb7a7bc5-3438-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663165407;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kMXXEszx/UDNx/Hlz+5OqZSi67cY+K2qH6GlXC0h+/M=;
  b=QULS4Lh2bLhyZwOm8oSzvxqoH5cNFk2BIm4lkVvgOIbq+TQJVbF4/7lO
   BRqSm3FZOYRNJrqk1GLO7RdhkdnhfAlFu48UjgGSZulZy4MjdZ4OwWjJs
   GkHyZv8Rqu1AI2A7vrKTXZ2lXU9yU6XBXOJKPFGM7HbqheNJNQ5yW4wOQ
   w=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 83015918
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ebv/oqBCfWyc6hVW/zTiw5YqxClBgxIJ4kV8jS/XYbTApD4h3zVWy
 mdLDGHUPPeLZzSmKdElYI239k8CvJHUn99nQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpFsv7b8XuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW1HWyt5hHkM0AddbpMd1WEpK3
 /YfcwlYO3hvh8ruqF66Ys9Fo516aeLMZcYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbnu3yajG9FbgAv9Sa4f+W/cwRY3yLHwGNHUZsaLVYNemUPwS
 mfurz+hW0xLbYz3JTyt+yqFu8bCr3nBaKVCO6eHytFJgFmeyTlGYPERfR7hyRWjsWa8Ud9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9+4FHhRqubyRDHmar7GdqGrrPTBPdDBeIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCTFGbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:m4LK8a+j7117dqythCRuk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.93,315,1654574400"; 
   d="scan'208";a="83015918"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKx9CnxpClgtjpHt9UrB3XO4glg8PxLBPbFCGnYnNIqYrwv2vVG2k4HEcCROXcHx475u44CZSt8WK4fan4c5AMZK7CZGvVHvy6mTgoriYlMJVRo+PH4jdUWwOZBNZtBQpx6kADeR9b6qOnLJfg/YbFpoLzR1cLQIh8sgxVueVh7/+1zxc8a42a+NS7NwXpoz2dvK7yONeGwu2vfnoaxNQNs7Cw5sBFYE3Zq9Dc9NPl8YjwSKKck2Sgq0ET4WHIbbMFpJQlZLGdcF4ckJdgeuB8ZwzOIDCzgtmlcfG4SNBMNgU7k1pNaMSA1J6fdgUL6+MN6WVMKOwmwJ6Psg0Hwt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPNaKtubl7sRms6IbW97Z3xRV9+cgT+QxDinvrzBxR0=;
 b=ao1BtZddxymzBCoLw9/d8wWvQsYVitYUL8epyHM+B0LxLWI9G3q8voSgOp9zZoLmUh9gb1q1nAf/cFmG7L4QXPM/w6YgM/tBHb7jK7ADhHggzOQSKv0nMmTRrDolRFMTv3c6yxgNxVPLRKkcPZMv5p/X5QaLwBQg3n3xemSC97ZcnViPNPaGnccONlJRsYNyZJTbNge7Ppd6/lJJ2Vt+3aV2Oiy9b3Sn2Nc64wZhqrSxUN/YETPMEDvaYy3o7S0B6hzDnHEGOWRWXqGRMKmkwfCAIwQRRkv0QahMqNJK7q1ViSSxIabp1vMzfQSlxIploBQw/EwBsBcBmPVpbcv04A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPNaKtubl7sRms6IbW97Z3xRV9+cgT+QxDinvrzBxR0=;
 b=ZLMzDe3CJiBcPiBoKGhhJJDbyxGlk418ZLnvk9xm0FrjkVrQ1QGGoIWaZm8YneIaLapgeso16pEEH86OhVG+/YpNrY1xfOBT17pMXjGyuyyzGdQi4kP3kIxjnFW9WyKVkuh7/EyEuLuHyyREphYvWKB8tksYNWQEIDZGK9tnzgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Sep 2022 16:23:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Message-ID: <YyHjyzXfScvSWyK2@MacBook-Air-de-Roger.local>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
 <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
 <0ccfe125-9455-8f40-430e-cfa1347b0aed@suse.com>
 <YyGbTIwaO+a2KVFW@MacBook-Air-de-Roger.local>
 <d232013d-aa21-afe8-ae71-5580ff4d679d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d232013d-aa21-afe8-ae71-5580ff4d679d@suse.com>
X-ClientProxiedBy: LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|SJ0PR03MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cf25a0-57d6-4507-c1ce-08da965ca71b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TeZHdwf/ec1S5xmmyx+QIVvqyur1HZXrq7vBI9e2evpZfHaxvZ4nEu9vOITq3MeJHNvq56/CzLW3ZRWVU4vm9WWWSPhwF54laU0CjGpzdEpD3VQ4lcQDgktBxiGTH8fyHK4NbtrTVEQvAu7ZIv3Oe6DA784Hcv41zLDZhkQWBIYPv/sCD6IByKR466e47mO5sAmB7eKL/lkIB9LMpZEvZU0QdNr/8150lLoSc/UE1wfXeGwSESbsRFDUEh9SmPiJA6V70hf8s9R862UVzyoxZJKb6POCE7ib6njSv5+QDpntCD1LtApJ4rBVMFGFkOJDt+WL+pysfsD0ZeO/vDocewZbR4M8g9yNuJxMQhnxehTfNieFI5j560qCLrF6Z53TXRXdQw/zx4Dpa3G6BWFZe/LbKl5oyzZ9bF9h3DySrnvNPuSHQ3p42qaKSiLfs2yDorDy0dcO9hPZ0F9KsMJJ80XZg/+CzYutEtXT1d6zDkin3PT441LeWUji1n0829p7CEV47LoN+IPXUHfU1Qr8UbKSb5ypTzUzk3iEMGPJ4GUC9Yh6XQ9gMEhFoyFg47QzDkEJDic+f+Vkj02oq+zKQiWpEgifSFpAJtpzVUoM50sSHwgW6hwJsKko/iCoJcHJOa7P6UNyTeqvSt4H6QyL/lif/n0BUPFSxbn9OcDWMDtKENKHLhIZtjM9jf520BJIW5YfayV6/WBe7fup7bGFnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199015)(66946007)(82960400001)(6506007)(53546011)(54906003)(66476007)(6916009)(86362001)(85182001)(4326008)(6666004)(5660300002)(66556008)(41300700001)(2906002)(26005)(6512007)(38100700002)(478600001)(316002)(8936002)(9686003)(83380400001)(6486002)(8676002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0NicUJwcFR6LzRzeHlWck5CUlBLSGE4TDhGR2NvYTFNZkpJUzlvTzYzdUhh?=
 =?utf-8?B?R0NxTHA1eHRINm0vTzR6NVRaRDFWdXZZUXh5ZmN6K1FTdEx0YTlJU25BWTFV?=
 =?utf-8?B?THBhUUdKOHF0Ym0xYUxCQStzaUVtYnVNWWRveWtiT2RwN0dOQUpTVTVYbm9O?=
 =?utf-8?B?enBEdDVMWVIvbUdjM3h5YU1vVmJvaytZSXd4bFBOc2tObGhDVk9BcDN0MnVa?=
 =?utf-8?B?cHBaR3YxSWRNWGpONm40aHBQNU9hSGxEZm1waDdFNmNNZUIrMGlVbmVJZjg5?=
 =?utf-8?B?ZnZaZTdiMGRnR2JTbXFZSW44cElLWnp1R3hQYy9DZ2pwYzVXUFIzN2R3RUJQ?=
 =?utf-8?B?WWwxcktubURXTVhLcDVoZGJsTWcwTlFUQVlpYUl4U3hGd1phMm8wTTF5bERE?=
 =?utf-8?B?bUt6djF2MHh3MG1DbWlqc0tHK1c5VnF5YVZMWjJXdnNKZWd0RVdjNTUwTUNJ?=
 =?utf-8?B?ZjRhV1VUNTk2S1JnSWlhU0Z5OStORHY4c1h5bEp2NnlVOWVjaFlQZFRaeXhE?=
 =?utf-8?B?bFo5c1hDS0o0ZUhCY08wamlnSFFyK2RlNTl5RE5CNlY5am1HcG1iTFMyWmV6?=
 =?utf-8?B?bHVGeDgrQXZ5N3RlL09mbEhqMkxQMHgyM3pvbUgxT3FhSXRML3NwdVBWSFZp?=
 =?utf-8?B?UVhwNWZZaDB6TUROV1NHNzE5WnRuMkJhU3NpZHI5eS9wL3F0VFYwUjlic09i?=
 =?utf-8?B?Tm9tZDRSOVdNZHhMaXFzWEx3RWtleTg4eW0wQzAwOWhpVW1pRFZnYWJwYnpm?=
 =?utf-8?B?Q1Q5UXhpTDFtQmVybStieCtZRzNNU2NHUCtOVnZMZXlOSXFQcngwdXEveUNT?=
 =?utf-8?B?azFtWDZGMDdwVld0MUgwWlFOQjhBQVRjc01kZ1UvYVJXL09uSnp1YStudmRV?=
 =?utf-8?B?clpWemJSbnVNSEhySDBRVWsxQUM3NmdJbytWcEQ3RmxPcG9zd2tZa0F0c2Rk?=
 =?utf-8?B?TDVmNE5MdmdydXhqYzNNMk8waEwvTllyUHpad3RCV3lLNmNDZXprenZaZ3gy?=
 =?utf-8?B?bkp4WjhTbTVaMUFqWXZVczVxbFF3VGIrZkhPU3Z5UElsUnZWdDNHWTFiV3NG?=
 =?utf-8?B?bC8xWXI0ckRMNDU5WFY5NmpsNVIvUndQNjJXRkRYelVrNnBsN2gzQUM0YnRJ?=
 =?utf-8?B?R2l3NW91Ui9KeXpPbXhJM2h3L2NPSmF3Z3VQTm9ab3VtNkx4NXUzTm9rMjhj?=
 =?utf-8?B?ZjdYRVRocHJrZmplcVI2dWhkTUYxZTdzVW5qNEtSalByUlNlcE9ZK2p4VXln?=
 =?utf-8?B?ZEFxYlgvUGZnZE1weHNrSHgwc25VSDNhSlhSTjlvUU1pSlFrc0grNWJqK2NP?=
 =?utf-8?B?N1dja0hnbG16TndMbTVhTERqbEUvZ08vMnRZRE9vOGZnV1kvZU53bWNpdzVZ?=
 =?utf-8?B?bzhmdDZXZU5YMDNvVXJzQ2lSazA0WHMrYXY0RFZ1aU1McHZrbS9KaTlnNTlo?=
 =?utf-8?B?bmpXcEtsVVdTR0M2R1lvMlRsdzQ5ZGpuSExZdnB2UGFHdUhUVW5uSHQ5NzFm?=
 =?utf-8?B?aHNUOExTbnhWL241QUlTbHUrNjRBeTVLeVR3cUNBcVNQNitYcGFCOXZzdUN3?=
 =?utf-8?B?N3dlSWExellSMEtCVTlTcjNsNWVham4ydHFhZmphRXFIT3Fkait3SnNSdEJr?=
 =?utf-8?B?WlZZQlhJRXYrRTRmdDhld3dFcnd2VkpsOU5UeFNpU2VpQ2o3bWpvZGIwVDE1?=
 =?utf-8?B?eUM4NW1MUmdNQjMvUEtLUVVDQ3d3WTFQTEh0b2xONExmZWNrM21pcWY2ZjZK?=
 =?utf-8?B?bXhMK0hJNzdwZnhoM3hHcVZpdnRWMm9VTkFqNjEzdjB3TnNYcHFLQVV6ZkNh?=
 =?utf-8?B?L0lBK2RESzloZHVyeU5SOWJXN3NNcjVjMWUzWVA2QSsxYlBudzd5TzZhUzk5?=
 =?utf-8?B?SEhMTldQYlJPU21yN0QzdGZHQlNtZTZvSXJQWG1lOWRVcWN5VlIzdjFvdVVz?=
 =?utf-8?B?VFJFK1d6WkJKTW9qTi9yL3VmU2kyMi9LS3pJSXI5L05wOWpJRGh2ZWxiTzdj?=
 =?utf-8?B?V0RVeENrbTNmUENjVXp6dlNVZWJ3REIyRXlYVTJVTStOUEdlQUdSNVY2eGxt?=
 =?utf-8?B?a2RVUzIySjRvTkxGNThJYno1YTBwOUdQaWdIeVZWMmI3OG0xei9JZ2Vyb042?=
 =?utf-8?B?b2tHckxTUFNsZWlaRFRuck1kbm54TUtwMEJ3aHVSVW1hTENLcThXdFh6OEto?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cf25a0-57d6-4507-c1ce-08da965ca71b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 14:23:11.6720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKz+Kud+ZtVTgjtr4Qv2UN+cK5nHJh99Msv8dyhLnTWM+TCLPwGCuEDWhCobn6ZuR+jFy7JnO2b6JEPR29oCFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5551

On Wed, Sep 14, 2022 at 12:13:49PM +0200, Jan Beulich wrote:
> On 14.09.2022 11:13, Roger Pau Monné wrote:
> > On Wed, Sep 14, 2022 at 10:31:34AM +0200, Jan Beulich wrote:
> >> On 14.09.2022 10:14, Jan Beulich wrote:
> >>> On 13.09.2022 16:50, Roger Pau Monné wrote:
> >>>> On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
> >>>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
> >>>>> the consistency check in check_lock() for the p2m lock. To do so in
> >>>>> spurious_interrupt() requires adding reentrancy protection / handling
> >>>>> there.
> >>>>
> >>>> There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
> >>>> trigger when trying to acquire the p2m lock from spurious_interrupt()
> >>>> context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
> >>>> percpu_write_lock().
> >>>
> >>> s/will/may/ since spurious_interrupt() doesn't itself use irq_enter(),
> > 
> > do_IRQ() does call irq_enter(), and that's the caller of
> > spurious_interrupt() AFAICT.
> 
> Hmm, you're right. I was mislead by smp_call_function_interrupt()
> explicitly using irq_{enter,exit}(). I guess that should have been
> removed in b57458c1d02b ("x86: All vectored interrupts go through
> do_IRQ()"). I guess I need to either open-code the variant of in_irq()
> I'd need, or (perhaps better for overall state) explicitly irq_exit()
> before the check and irq_enter() after the call. Thoughts?

Well, it's ugly but it's likely the easier way to get this working.

> >>> but yes - we could nest inside a lower priority interrupt. I'll make
> >>> local_irq_enable() depend on !in_irq().
> >>
> >> Upon further thought I guess more precautions are necessary: We might
> >> have interrupted code holding the P2M lock already, and we might also
> >> have interrupted code holding another MM lock precluding acquiring of
> >> the P2M lock. All of this probably plays into Andrew's concerns, yet
> >> still I don't view it as a viable route to omit the stack dump for HVM
> >> domains, and in particular for PVH Dom0. Sadly I can't think of any
> >> better approach ...
> > 
> > Yes, I also had those concerns.  The mm locks are recursive, but
> > spurious_interrupt() hitting in the middle of code already holding any
> > mm lock is likely to end up triggering the mm lock order checker.
> 
> Guarding against this is possible, while ...
> 
> > One (likely very risky option ATM) is to introduce a per pCPU flag
> > that when set will turn all mm locks into noops, and use it here in
> > order to avoid any locking issues.  This could introduce two issues at
> > least: first one is how resilient page walking routines are against
> > page tables changing under their feet.  The second one is that any
> > page table walker p2m helper should avoid doing modifications to the
> > p2m, so no P2M_ALLOC or P2M_UNSHARE flags could be used.
> 
> ... personally I view this as too risky.

Is the dump of the stack only used for the debug key handler, or there
are other places this is also used?

Thanks, Roger.

