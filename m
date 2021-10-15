Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8842F56C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210730.367710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOE8-00044T-Ox; Fri, 15 Oct 2021 14:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210730.367710; Fri, 15 Oct 2021 14:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOE8-00042D-Lj; Fri, 15 Oct 2021 14:30:28 +0000
Received: by outflank-mailman (input) for mailman id 210730;
 Fri, 15 Oct 2021 14:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbOE6-000427-Ay
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:30:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75cba17e-cfaf-46b3-873d-eb20a2acfc9f;
 Fri, 15 Oct 2021 14:30:25 +0000 (UTC)
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
X-Inumbo-ID: 75cba17e-cfaf-46b3-873d-eb20a2acfc9f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634308225;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Vu3O9a9RlsYjNlKIfK9sEj6cSaZki0vr3RCKMn5rq8I=;
  b=fSpK3Vs/fqKrm7HEd5ZlJ+1Pwlz7OPFFL5PUvkCkE5VkPjf4q7GnAjoW
   hrMXq+6ErA/I9Z+oiFD3DBbpr0Ir9pANUamHJtFfqXtSQpymMB3mQbHH5
   rmW/zNxDfLlFC/5IZ6hsVGTeceJNK4QS8ae7VhIo2+t0pBZ7/7Ku7ON8V
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DXwKK1IhSh5t7BgLPbT8woDh5g/MCMo2P8AzDRm2OKs0/7LbAeckmmJZxVWq/PGXjqQpBtjD/s
 9SKEtF4qrTq9XoHoiCt0Npntzh0FekX26aOCBM6TK2GSR4si2LUMFMDJqMotCro2MNM90bwFcq
 ajqv1PIBuHpHPl4l50fyxW1sBmPeHnHidL8oj1EBa7Wbzoeqok8M9rNW6+DoszIJ5A8OkrExOQ
 rtEoaKCcQlOaVeb5Cyn3CcII/IfNArJd492wT4VUdZ7c1y5RE9m+mLht7sjgfMdXJCqRXdlxT4
 oYUaIr8vsz3I4qWqevna+atz
X-SBRS: 5.1
X-MesageID: 55280633
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JZrEt6M9L4sk7NDvrR3TkcFynXyQoLVcMsEvi/4bfWQNrUoi02YGy
 WMcWW2GaK7bazahKYp2Ptm+pEJVvZDdnN4xGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Us+w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxuYlfwp0
 stHiZ+Pdj8FfYKLv/8ifRYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iXv48Agmxr7ixINfTXe
 MlFdhRFVUXBXB52B2s8Npc0g8790xETdBUH8QnI9MLb+VP78gt117T8NcvPTfaDT85Vg0Wwq
 3rP+iLyBRRyHN6CzTuI9Fq8i+mJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOTufCkjmauVtQZL
 FYbkgIxqYAi+UrtScPyNzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMU7XyAw3
 1mF2dbgHyVysaa9QGiYsLyTqFuaODcXBX8PYzceSgkI6MWlp5s85jrUVcpqGqOxitzzGBnzz
 iqMoSx4gK8c5eYR3qWm+RbcgjSjprDAVAtz7QLSNl9J9SsgOtTjPdbxrwGGs7AQd+51U2Vto
 lAqisKytPoQB62OqxO1bKYiW5ay2NiKZWi0bUFUI7Et8DGk+niGdI9W4S1jKEoBDvvoaQMFc
 2eI5lsPvM470G+CKPYtOdroWptCIb3ITIy9Dpjpgsxyjo+dneNt1BplYlKMxCjTmUwonLBX1
 XyzIJv0Uyhy5UiKylOLqwYhPV0Dmn9WKYD7H8mTI/GbPVy2PyP9pVAtagrmUwzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6t95YMLLXee1o8RgnN7sM9J5t6JuSJeIwOzo/1E
 oyVABcEmDITe1WWQel1VpyTQOy2BssuxZ7KFSctIUypyxAejXWHt88im28MVeB/roRLlKcsJ
 9FcIpnoKqkfG1zvpmVGBbGg/dMKSfherV/XV8ZTSGNkJMAIqs2g0oKMQzYDAwFVUHfp75Jl/
 eD5vu4ZKLJaLzlf4A/tQKvH53u6vGQHmfI0WE3NI9JJf17r/pQsICv05sLb6eldQfka7jfFh
 QuQHzkCouzB/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy+YB6wu7U
 06C4PdAPrCNNJ+3GVIdPlN9PO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI58m
 LUvos8b7QC7myEGCNfeg3AG7XmII1wBT74j6sMQDrj0h1d50VpFe5HdVHP7ucndd9VWP0A2C
 TaIn66e1a9Ez0/PfndvR3jA2e1R2cYHtBxQlQJQIl2InpzOh+Mt3Q0X+jMyF1wHwhJC2uN1G
 25qK0wqevneo2Y23JBODzK2BgVMJByF4UigmVIGmVrQQ1SsSmGQfnY2PvyA/RxB/m9RFtSBE
 Gp0FIoxve7WQfzM
IronPort-HdrOrdr: A9a23:Msn9QatTykJB75ktxnY4YFql7skC5YMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJGtJdBkVCe32m+yVNNXh77PECZe
 OhD6R81l2dkSN9VLXEOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv2nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLbU5nghBgr/DWQZAV2Iv/fKXJy/fB9kgIm3UyR9nFohvD2xRw7hdQAo5ot3Z
 WNDk0nrsAWcie6BZgNc9vpevHHf1Aldyi8eV56EW6XZp3vBEi936IfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55280633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvHEzPrQyw6JF7wUNCzYHU7w0lViJld65BtkdUubTYvIeJurS80WK7RRHREbgBzVQDMDH3LZRjMNPGjdIgVbKdtyHb9i8ngWLuqpD/z2wXpEOVDY5D+z6QqZbzHEwDs1kgkqawYyK7lJrh97p20EEjZECCHLaHk5xFZQyQ5iOQNbmCk8nrZh32vaLxAxSXbGOyRTRguXWXi7P7Jm2bSpPdNmyahrcBN3wRYx1Qn6yYow/OkshvuMYL+nzYyaChgjWAt+9IYnJTJPH34chs03xOzqQL7nmu2O+IlwEc+4NiknSWpiyRuu0zTaQhdSrGXIC+Zla+rFtQnV/x/8A64s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0+3qYUb+Q1FysRGZgGkC50CSStj0qWL5rTTMaQox/Y=;
 b=itAKvrUOnUdt/wWfE4kZLhdVENmozIqD+49i1GlzpGyuRaeJAGUgI7E0m0NI0vMsVHLgaUPZYSDKGKMDDGti+yrzmndkqTWII9Kx6ZOWMd4cDhnjfgfItb0LHMwhOUCGDk1dLlFm2gf+2w+O0/KPQhIzQcIT+XzkH+SeTh8DCOBt9fg5kt6SRRveJVUUY1r+FD9lW03QwRBBAyguf8FAReYWHz+aam1gC0e8n8Hscj/bURhMzzPfdiiFjYG7/LSJgy38r31Pfq2POG51/uSt6p5RQcbg+7CL6PVJB50o0hjh+DVE+UdHd5LwBF1VxMayCMJEqz8Q0QYGLDoUBQIrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0+3qYUb+Q1FysRGZgGkC50CSStj0qWL5rTTMaQox/Y=;
 b=PPN3JOxbT2uZqn9WB40aKj88tv3HBcCV9I7qRceWjJNX6Msrf/ESw9qyIELnkrDpWxSO+WoP4GLIzXZ0Ajgdj39mx3H8S2rE8lk8MBOPvobKIDfgKu1L5hDfkqxXTREGa6kYzdHzObBaysc8L33dG4BA/KILdaC3y5DjTq3fhWM=
Date: Fri, 15 Oct 2021 16:30:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Message-ID: <YWmQa4uMA8usiHcu@MacBook-Air-de-Roger.local>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0195.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d6aaf37-e260-48d7-5199-08d98fe849b4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB48421F3AEEBEA3DA635B7BBF8FB99@DM6PR03MB4842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qYGi/BpjzM/Ofnn8cjIdoetspcanb6HP5zB3Yyfpab3g88IAP9c1KB9FIHDqWjHXwqYDALTHYDWWsaGVSyOW/PaPpQrpR/fgNiYVjToJ3fSoB3sh3GM62y6qrPA+2i+RmehgpfgnyCePwJwa69RIZxpWnIMHKKxcm1NvBPb4QoOzPHMYKhFnWgExp9DTcRXo68BqFRrD3vL8MyDh3QJZ1+uSwOpzb7Taq5lRgL7qYna1jCcGDTCJvGt/m6oej3vkGPMa1QQ7/tI37W6s7mBN4xcpsvJc52aE+UkK19Ogw5nwmjRQG1InTbMlfxP5hF9mwdcY95FuaUZEleuqkQDf54p4CKLMVth7NYT+Yo0UiU0x6k6wz7pIcleyQv5u9LEckIZNQUR5H22NxMn+SkvUln+dGw9VtI3VZkBwc4LOI/1IhBD4+/8KChwl9+l6djrgXmbLeA3Au3HLfPLDBGNEWwmLtonmtdDWgdtjTPJjSNlXfQ2FLNRu9VdutjqLtcZQ5o5yxkq4nZxSKAqyGLrOK4OYX4DddnsGJA0TxjC+TpMLB5LNq4aTbuzBeLo3uwYhEXkWk01gy2OTXURYgXo0ZAO9bZjtWRvWcNsdcI4FkTr1NBKSDmuBP/49yUPwyAWhkQtguQ1QPS1IqvYPvctheA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(82960400001)(6486002)(508600001)(6496006)(7416002)(4326008)(9686003)(85182001)(8936002)(8676002)(86362001)(6666004)(54906003)(5660300002)(66946007)(38100700002)(83380400001)(2906002)(6916009)(186003)(66476007)(956004)(316002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWxQZWJsS3UrUjVyRXgvTmFWRCs1bDM4NlUxcXBHQUNlN1c3ZDNFT2g3NGZK?=
 =?utf-8?B?NHNVR2ZkZzBvRC90TEkvUlp3NzBJZkcwY2NZbmxBb1VtZ0RqNndwSUxtK3V1?=
 =?utf-8?B?KytUeDlNZTRLM2NadkY0MkRURG1adFNrZ1FsdEVxbytwbk1TeXRvek1PVFVs?=
 =?utf-8?B?cmRRMHluaEVlT0YyU2JUYXM3ZVBWbnNyRG9hWElYNVgxZXNOOWFVYlIvbkFP?=
 =?utf-8?B?ck9CUFpwTGthUXpzV29QQUlwcDBmV1pWM0VEUkhQUjZuL1d1T1V1SEdGZE00?=
 =?utf-8?B?MGYzZXBwajhhdkRFbGFSVlZLc1daZ095Yk1uZTc4bUFoc0YrUW0rR0s5d2gx?=
 =?utf-8?B?L3k2VmZZcTZpOG1sNlVHZ0xXdlZWVG5wK1R6S1pQRmkrd1pZZURVQVg0Zlc0?=
 =?utf-8?B?VWJHUUcrekdmVE9zdHF1Q0oyU1c4c1ZKTmkraXVIdlloNkhEdDdBNzgrZE1v?=
 =?utf-8?B?NXlCOTNKVVNDWmFGSERSWlc4a3BTOERacHJoa3l5MUZUaDROMXFEYVdTRWgz?=
 =?utf-8?B?bHkxaU5hUzFWK1ZZeGJ0R2VwMS9OMW9peTlKWm1Ec0VGQm1zWWd6K2M5cFpZ?=
 =?utf-8?B?Q0N4ZWdLbEw0dURJS0QvNnpoQWsvNWdjU0hVL01mZ0Y2QnEwNm5tNG9mbGt3?=
 =?utf-8?B?K1U4V0xoTDZrWkZBK21NdXJkdk8vR3kzZ3ErbmhIZUJWUmZRU29vVXI2ZFZl?=
 =?utf-8?B?U1JSTEh6ZVk0elFwWEZVV2dNQ0lBZVIwQXJFVTRkQk5HSm1sWlNtazhROWlk?=
 =?utf-8?B?cDdKV3Jab2l3VjM1aEorQjFKeVdSbmpIMDREOFgvZWFsRkJWUllnbDNjVFNQ?=
 =?utf-8?B?SnFLN3J3aXExVzN6NE95VjRtaldqS2FyWnptZDlVWXRDQk5qd1VwN1ZYdnRj?=
 =?utf-8?B?dVJTSnNjRHlZMVlLcGlqVkdyL1FnOFFFYi8ySEpPYmdQeDdsSWlLaTcyWkow?=
 =?utf-8?B?UENDbWVZNlkxcm9DSUxrUHY3ZWNDYmRDRzN2UGlDM0JGUjFQZDVrWEFDZ0NM?=
 =?utf-8?B?cUVNZGlNM21zRFIwYXIyUTVCQXA5L3hoV3JNY05tR05IRXdycUVwZ2VWSHBx?=
 =?utf-8?B?cisrZDN1ekVvU2FjQ0dPU2pkZTJ6Uk5CcE5tTUhqQ2JCRDF0Ui9lRHZXSXlH?=
 =?utf-8?B?U1l4bG1MN3VIaEVDM2xwRitZOTBoMjBZL2kxckIvbzRGSjVKL0t3UWRJYnRs?=
 =?utf-8?B?cFJjb3FGd1RTSFVKYUpBSk9MUkExdElEYi9oQlM2VnJBSllPZ0xDYWt3SEN6?=
 =?utf-8?B?dmNVTmQ1cytNMkNiWWNFL1ZwZVpVeEhsUzJsOVZuUWJkbmxXbm1EcytHK0hl?=
 =?utf-8?B?OTBNaEdPeXJNaktySTZYMElYcVdWeG5DZHBjK0pJbzlFWDBoSDlJeHNaWUQ3?=
 =?utf-8?B?WUI3QXA4WW4zN0tONDhhOWhNcXZwNFhMNStwOGFCTzlFSHUvQy9zcmRDTTcr?=
 =?utf-8?B?eThQanpGaTJkVTF0Y3MybXE5K3piMzg0RVkyRTlwWDkxcFRJZ0dmYlRueU9T?=
 =?utf-8?B?Z09TMVFVQjQwQnUzWGJiNmc3cEFJNFlTUm44NVp6dGkzTDJsNWVZN3BXZGtv?=
 =?utf-8?B?ZldHYVV2b2Y0RHUvZ0FvUitvS2pOOU1jYklVQTNDQUxDVVp6eDY0TUNEbVNY?=
 =?utf-8?B?cnh5UHN4cUh2YmFybkNwZWZUTjhoMWVVaE5kUWdGdmtPMWI5UEdOWU5HQXB0?=
 =?utf-8?B?RmtNQzFlTDd4K1k2NTlmMk5BZjk3K1JsK3BhTGF4RTE5WkhEK1ZJU1crVDh2?=
 =?utf-8?Q?EsYsJZSzDXvp1n0fPM2j/g4HNuKJVzGuX9hbpHK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6aaf37-e260-48d7-5199-08d98fe849b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 14:30:08.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejJqVfmQ8+n0XPYLgxUTntS1p+6xcQL0shI1sebz9OD54F9lNM425ZTi+aSVHUEhReth8s+vjq4zm4e1Knyi4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4842
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 02:59:19PM +0100, Bertrand Marquis wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> The existing VPCI support available for X86 is adapted for Arm.
> When the device is added to XEN via the hyper call
> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> access is added to the Xen to emulate the PCI devices config space.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN
> so that when guest is trying to access the PCI config space,XEN
> will trap the access and emulate read/write using the VPCI and
> not the real PCI hardware.
> 
> For Dom0less systems scan_pci_devices() would be used to discover the
> PCI device in XEN and VPCI handler will be added during XEN boots.
> 
> This patch is also doing some small fixes to fix compilation errors on
> arm32 of vpci and prevent 64bit accesses on 32bit:
> - use %zu instead of lu in header.c for print
> - prevent 64bit accesses in vpci_access_allowed
> - ifdef out using CONFIG_64BIT handling of len 8 in
> vpci_ecam_{read/write}
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

The vpci bits looks fine to me, so:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I have one question however related to the placement of the vpci setup
call in pci_add_device.

> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3aa8c3175f..082892c8a2 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -766,7 +766,21 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>      }
>      else
> +    {
> +#ifdef CONFIG_ARM
> +        /*
> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> +         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         */
> +        ret = vpci_add_handlers(pdev);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +            goto out;
> +        }

I'm likely lost here, but shouldn't this also be done for devices that
belong to the hardware domain and are assigned to it in the first
branch of this conditional?

Or else you will end up with devices assigned to the hardware domain
that don't have vPCI setup for them.

Thanks, Roger.

