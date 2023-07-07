Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F0F74AFE9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 13:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560452.876373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjjQ-00075m-AN; Fri, 07 Jul 2023 11:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560452.876373; Fri, 07 Jul 2023 11:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjjQ-00073H-6x; Fri, 07 Jul 2023 11:34:36 +0000
Received: by outflank-mailman (input) for mailman id 560452;
 Fri, 07 Jul 2023 11:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHjjO-00073B-UV
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 11:34:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d28be6f-1cba-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 13:34:32 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 07:34:29 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SA1PR03MB7099.namprd03.prod.outlook.com (2603:10b6:806:330::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 11:34:27 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 11:34:27 +0000
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
X-Inumbo-ID: 3d28be6f-1cba-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688729672;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GR5IYdmh6TQOjMrLF8R0lJMgoI+VtFW/s9rKqCaPGVQ=;
  b=AI0/G9+Vnfus0MZmtjBdMVF2JchvYfkJ9uh6ttFlZGiJ5k4cxSp227XA
   lHnCfoVU3IQJB2wSoQ6rugn69dig/fawyjXcV2SeGuVsJjCfgDr3xGYJC
   rsA+IFpqcJYHW+A4bw38vp7Mhz+DFI4glt8S5qpLoodxzaDWyJXp1KPHD
   c=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 115351495
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QLX7L6xdJKTzeIJ3apx6t+eHxyrEfRIJ4+MujC+fZmUNrF6WrkUDx
 zcaD2uGafuNZjD9KY0jO4m28E1UvZHVzt41G1M5qSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPa8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXtK0
 f0kORJcVTKK1vu5h7iRc+NXh9t2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQouFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aSxn6iBNNPfFG+3sJskkWy/GlUMiJMT0GKhPyJlROiet0Kf
 iT4/QJr98De7neDTMT5XhC+iG6JuFgbQdU4O/Ym5R6E0LaS4wedCmUOVDdHZPQvscNwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihCIznakJhMgHkaCy50nagimEr4LMCAUy423/YGWh6Q9oYZ+/UKah41Pb8PVoIZ6QSx+Ku
 31ss8+a4eMVBJeBjhuRUf4NF7Gk4fWCGDDEiFspFJ4knxyk4WKueLdV8T53JUp3GssccDqva
 0jW0T69/7dWNXquKKpoOYS4Dp1yybC6TIy8EPfJctBJf559Mhed+z1jblKR2Garl1UwlaY4O
 tGQdsPE4WsmNJmLBQGeH481uYLHDAhkrY8PbfgXFyia7Ic=
IronPort-HdrOrdr: A9a23:BAokvakdxeReARADmtFixMFfKNnpDfIQ3DAbv31ZSRFFG/Fw8P
 re5cjztCWE7gr5PUtKpTnuAsa9qB/nm6KdgrNhXotKPjOGhILAFugLh+aP/9SKIU3DH4BmpM
 NdWpk7JNrsDUVryebWiTPIdOrIGeP3kpxAU92uqktQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AljqeYmiy2XuldI1E4VeNXTDzNDJuaHn5zUvBAR6?=
 =?us-ascii?q?DK284UbLSQ3Wp8phljJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEytDfwzMU/718l9S+XU6MA7VasCaqJioGlgsq5B?=
 =?us-ascii?q?BgfbeLzZBHjKtk2mrY4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="115351495"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1DvLGLQmrK1kzGnEoCTq6Pi2r78R9jzJwwEGwQ4lFQdfpOhriOtxSotvafSOf3MGzd9PYm4kOWRCzwLwuazRpl+HgqMmAMXnXJ/4B7+C/S4jOkT9+qWeOe0yOFFeyVaXH8fbjTfvzSatgHIElaXLhaK7QUbfgGp2SxvehDCR7rywuX+RRKvMEY+RM5mtyGR33jz9Qsep+3DYiH7tTnApj+0gmp0cPVubxTtq+csNDgqTmSocpgF5tzAa5Sg1/pjsa+UQ4sngR5Fz+O7wD8XOnwdOssD/b92Us8aItwDgUrYdrhmGRCAJ/N11eqg7jq262MY/RpwTqb8oKvTntmBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DurWbeeyEKMpKvrrR82mtF34tYjFqnwVfv5vmBT6u2k=;
 b=aZxDfAk5Y5hugShgIJixlLZpLcU5aWexSpVlkcXugr0Qt1Oy8tBy4ccYXVNnuWMx/vEa3jNAROEStb+zA1ku2CqR4ylQ8yhZJLQhiKQGkdvHl21J3n4ecnYQ0P3PSsLCgthch6/EkFDBr7rNHUaTgxTPXn6e1hRXR5FHVb9NsYaRVvadoMzbEETzzpV51q3hjyq4UYE0+/K/E/5HyM6tlxwFWj8SHBkG4QdioYuyHnh4s7lERSQt0Ct+ZW6ZOyoWgdSLEo9t1tU8pbo97bePu39GM3Myhjbb3rPaP1KA5R649lbXjRHMb6BLoXzHyDNYXjxY+NJpCeAJEEtIjzhc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DurWbeeyEKMpKvrrR82mtF34tYjFqnwVfv5vmBT6u2k=;
 b=wlhsvRrkxatw6b7QLu6LMKFI/AUd8xn3xQuyFfM3SOaQBrFCu4gsnXy5K6VWigBf8z+nVgezxPW7AwrcvZ3RghEQYTYQAi3VJe+n3sZzow7u2DdOuTsSBPVGsQ9PE6oGkkHwB8I17mP9W5Fi/zaBwZwAF2Id3iYE8oXGUVkTuO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 13:34:20 +0200
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
Message-ID: <ZKf4PMkKF3x2VwXl@MacBook-Air-de-Roger.local>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
 <ZKfjoXqb6Kgav-vL@MacBook-Air-de-Roger.local>
 <04c05db8-1e15-f2c1-ebc1-0563d442a808@xen.org>
 <ZKftKtkjgFLWaW_x@MacBook-Air-de-Roger.local>
 <7f89a925-6c4e-7840-041b-2e0816ed7b71@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f89a925-6c4e-7840-041b-2e0816ed7b71@xen.org>
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SA1PR03MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 91db85cb-2269-4172-32c7-08db7ede1ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yPrhxE5fdgti9+6rhhHAls/thDng8q5TXttnJPAX7dTNsRqEk12SGvLbHyDCa9tX+cNiaX2waJpOYUaIAiChqxtMWxAMXAJVNoVWKPx4udqDQEGwak0E+b5Eof1AMllSmIyHkRg2bNuQDCSjCZekB2hScDfkliJmRhqtQMVvEfPVI7fgPPxL7ge5RwVBmDKk7ketzUBwfUbZO2mejaDn32SJ+10kVMqfSNSsq4I+Geox/GNATHLIIW/HYkuyIIUYsVZMaCakXkLEwWWEfy9yXBkXbH8eP1rIxSvdW58oCgkiso8p+qM5eRRDoaNPVCipTsVEGznVzNhNZA7WpRhBqxJMHxAsabwTAD8otXGgFKwsLImOISM+ZXU958a6XgIDKAqBfRbeXuKms30gKeDiSmXg2oorcsFrT2notpmc44oI/eSULGa4J3wNfIBCQxJY8wP/OzZPP9ybDukietJJkVSy++k7niTcy2zbMahGh8QWkeqiN4RVahpsIQ9D5gHf0n07TioEZ6IqkfDerIusaqOxzWNWcR6KTdB6qGFOxiLelC6fYxPj+uyEQAgjQX8R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(66899021)(2906002)(41300700001)(5660300002)(8936002)(8676002)(85182001)(86362001)(6666004)(82960400001)(478600001)(6486002)(53546011)(9686003)(6506007)(26005)(186003)(6512007)(66476007)(4326008)(6916009)(66946007)(66556008)(316002)(54906003)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTRiUnhXaFdtMy9UblBnU05oMVE5K0NYZ1JQc0grbVNWeFhJTTZRcDdEenUr?=
 =?utf-8?B?TUFzbEFUY0ZsUWs3WE92dFh3bE9mdm9oM3YwbDZaUnFKbkNHbGVWVHhQbGo5?=
 =?utf-8?B?VGhUSUNURG1maTVhNWRTT2tuYXJ2dTF5VmViY2JxN1NQc21NWXo3RmNqQS9O?=
 =?utf-8?B?Y2hZbXN4cFFjc1JyTTJMMXpqL3ZZTFRiNEtLSWJjQTIyVzdBZjl2TWNHTVU1?=
 =?utf-8?B?R2lWYnJRbU5uMTJONVh5MkNwckZ3ZmdZNVpFcFVYZDd4c1Z0VzNZejZtTDB0?=
 =?utf-8?B?M2pwSitwZ3ZWdkxBRm84VjZNSGZyTFJNUTM1QlFHd0RwbCtxOFQxUDNzS1cz?=
 =?utf-8?B?ZWxPSHpnT0R0b2hrRERkYlFBQ1lEdlZibEV5RTFiL1VhQTZselVzanQ0UW1n?=
 =?utf-8?B?dDFySWhXOUpTWUlkVXpWMFVNVHlqQS80WlZ5SVVXVTh2KzFSUGxxNDlDaDBG?=
 =?utf-8?B?Sm5wUkpZSitUVEw2cjBtREorRWFqTW5hU0ttaTlKSERHQkZXcEJXVmROU1BR?=
 =?utf-8?B?N2FqVy9abVQvanFPaDJaUXcrcS9jM0NWWW5ZY2ZMMlZ3UUQzQmVxSWZtZUNK?=
 =?utf-8?B?VTY4WHo4ZkVFVUhwT3lLZEtmUkZQWEVYcnFqVmgrcXZCajdwSis3RkpJaU5K?=
 =?utf-8?B?UHJ6Q3pJYVR4K2JLTmpjaWxITUJFaklXUTFoTCs4NkgxaXBJODJLalpLQVlt?=
 =?utf-8?B?S25kaGkxSnBha1NRMlJ3d09CRjExVzI3dVNHMElFaTNNUVA1LzNCdEpNUmE1?=
 =?utf-8?B?QTNBT3BiM2tpcGtMU3J5enZOUjRCTVZjUEhDdmk1TWFYYmxVYkR4enVKTWtk?=
 =?utf-8?B?ZmhTMmRWdHJjZndENG1QTG9QK2RSSXFMUThwZ0JRSmdxamtGZDZhOGFKaG13?=
 =?utf-8?B?TnN4Z3BrYzNWbmZyZ3ZWTitMdFNlUmF0c1B3RElkMmM1cDR4SXhHTjNNTUFV?=
 =?utf-8?B?Y1N4cHRmdExLZUtHbVcxWFY2RlNXL2RKK2NiZTdVNy9zZXFnU1crbk85ZWhY?=
 =?utf-8?B?SVNiM3dnYzhKaVlvRTkvMURPVGI2Q0hJRWY2cjZNaVNDRWMrZFZJOU5qMllJ?=
 =?utf-8?B?VWsrTHdjb3R3TUdpcnk5VU5Sb1FWM0xnb0dZMEp1TmRURVcwQXYyZlNjRENn?=
 =?utf-8?B?cEtGQ09Lcld2YU0rSmMxQmxPVUxIaG9iRUhpR2JOc3BNNklSamNscmhsN3Ba?=
 =?utf-8?B?czViekF6Nkx4YXkvNGtKTzNjcjJmTVUwTmJGRTZaWXBLWjhRMHk5YXVTTzcx?=
 =?utf-8?B?Q2xsYTg3UW5EVitxNFB6RFU5TmlUQUxWeDIxbC9hak1xRlgzMVNxNFJ5a1ov?=
 =?utf-8?B?NXZsRktzMDkwTnh5cHFnVGVyOVVjdmdoaklUTU5wMFQvUGt2blVlVnlCcDRU?=
 =?utf-8?B?ZzZsZVN1ajNCbEU5K3QzK0tDUFE0QXVabTRDUVpTRFpjOWNPZzNjaExDSlFV?=
 =?utf-8?B?L3k5a3Y0dnZKdzNkYVFybW1seGlXTWFrNGk1TUR5TFY3eVc2SzRVVWRqdS9N?=
 =?utf-8?B?Myt2TXB2eGR4SDFrbU5ZNmlyajZPa2tDeC9JeGhXdEUwVFNhV2ExK1FXNW55?=
 =?utf-8?B?MVRRZ2N4cFhuNE5lM1JiKzZCaUZ5SXQyMGhNUHdhSCt0UDlRNldoWHBrbkdL?=
 =?utf-8?B?c29wRnRpMTl4ZCsvQXE4cGk1cjIxMU04SWduYUV6OWdCTk0ra1BSYjFweDZ4?=
 =?utf-8?B?STE0djEvTVN4VDQ5OGFkL3NzdHd3NkgrTm9PYnVxYVFkclFuZmw1ZWFQR1Qx?=
 =?utf-8?B?NTFjKytPUW9WbHNSRHZzblRqVHpFQ1pYNUlQbGo2eTkyWXMyYTFFVzVQOE9Z?=
 =?utf-8?B?Ky9jR1NrRmtQSW1Gb1FXTkxNM1dvdDZlK1p1R0VBYU1VcDFMTGF5TmZsdExy?=
 =?utf-8?B?SmpvZjMySzNkUFpxRXc3dHBsaEVWc3RRak1Tb0hQVzFpR3Evd2FTRmpNbnVL?=
 =?utf-8?B?ejJMM0JQWU5XOG9mdkJHSE1EWWtaY0FjN2UxQWsxZ0xOWkpzVEtoM1d6d0tW?=
 =?utf-8?B?WUdLWlVkYWFXcWQ1eEpPbjYrUDIxUzNtNEtKTmZnQzdVY3ptVEFGK0d2citR?=
 =?utf-8?B?TFlsMGVvYnd5cW1hUnd3QnB2ZjRDeWd4cy9FZERYUGhVUVVLVFhSRWV0OUps?=
 =?utf-8?B?clRIQXcvZFBsR09EWEdSdmFwNDBZOTF4RTJFV0tsbkhGSUQ0bFgwR1ZqdlMv?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b0B0D9zC+9XEsI2cFX825qBGUNzxPLPycd/iXgrQG80r65QfgrNZk7CpWiLjH47bovoaggts13vYil7RiI0SoxP2kLNm+wnKEdv2c1OzBQG6XyQVuslaO8YfZolc4DS7tWoBMfXKMJFMmHcsiXFBk973/Kc2HoEApJDkuFiaxqWhMM39ZVz39Aiu7BWe261B3KLwrgCt9RKo3U6be9NRVDlQ5ZaalvkbrrqExfd5XpUo3I65+59U515O8fb0gfmMKSmzrFwhTOLW463wF0ghQt6JvDNJT1j0K0KlgbrpEhcI/3dC27rgJjZvDz4cV/DkxvwzjkA2YJyFe5bYy0K5tsTa8C0PGCUU10jmIZZxYupn8wVG1K5qDAJRP1UvdIBQmtcxuZpUAQ2RTsTkyuJmK5gxIxo/ABcGjKfvFe01ZKEba8oZ6heNK6AgZRo1CEoOuSoLx4ZlC+qvtae5N4ZHm1Gwhhx/E1bxWS1SJcihnzE8ZE5S94zJRrYJAg8w9y5jiqwY+tq3e49wVLRUpkAMf3XviN8Y0if79RhOxG3PxCJSOPUSS/h4XjzKTw0V/Yjm00I1iYG/2H8LoNlH7xgzpX6tPAwjYCukkBz+CPWnXzfrj2fLLG1qOnpl60m5w+0b3srMPAZE7Yyysy6TNt1P2v3suu0CJF3Jqs0lPEuwdpUmvTxdj5anLsJ7tZSBpYHnevKF6tAjKFhcFjwA5LjAWVXtBjxngG4fME0uacS3yk69Uri9qaWqgBvfVFXyaZokrlZtH7VCBuG6zRweuCytZd79H2vlZ/oIonG/sEgPCt3McVx26tNeFsOlPTdnBXpi+8EvxMQHH3pIhEr7wgipzHtrpLuyPm6OOC+9smpfitsV2GcRx5d4fNG19xMIzp6bwEKIE+zp4RpzM0K6fMNHGQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91db85cb-2269-4172-32c7-08db7ede1ec6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 11:34:26.9872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIFx78VWbkHmPUEFTwP5RlEX9euxcmJIwE02dcUUOhtXg+lkFbTr7XzcMQdZqvwUow7R9evNPq36/HDRdsPMOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7099

On Fri, Jul 07, 2023 at 12:16:46PM +0100, Julien Grall wrote:
> 
> 
> On 07/07/2023 11:47, Roger Pau Monné wrote:
> > On Fri, Jul 07, 2023 at 11:33:14AM +0100, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 07/07/2023 11:06, Roger Pau Monné wrote:
> > > > On Fri, Jul 07, 2023 at 10:00:51AM +0100, Julien Grall wrote:
> > > > > On 07/07/2023 02:47, Stewart Hildebrand wrote:
> > > > > > Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
> > > > > > code base. It will be used by the vPCI series [1]. This patch is intended to be
> > > > > > merged as part of the vPCI series.
> > > > > > 
> > > > > > v1->v2:
> > > > > > * new patch
> > > > > > ---
> > > > > >     xen/arch/arm/Kconfig              | 1 +
> > > > > >     xen/arch/arm/include/asm/domain.h | 2 +-
> > > > > >     2 files changed, 2 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > index 4e0cc421ad48..75dfa2f5a82d 100644
> > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
> > > > > >     	depends on ARM_64
> > > > > >     	select HAS_PCI
> > > > > >     	select HAS_VPCI
> > > > > > +	select HAS_VPCI_GUEST_SUPPORT
> > > > > >     	default n
> > > > > >     	help
> > > > > >     	  This option enables PCI device passthrough
> > > > > > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > > > > > index 1a13965a26b8..6e016b00bae1 100644
> > > > > > --- a/xen/arch/arm/include/asm/domain.h
> > > > > > +++ b/xen/arch/arm/include/asm/domain.h
> > > > > > @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
> > > > > >     #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
> > > > > > -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> > > > > > +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
> > > > > 
> > > > > As I mentioned in the previous patch, wouldn't this enable vPCI
> > > > > unconditionally for all the domain? Shouldn't this be instead an optional
> > > > > feature which would be selected by the toolstack?
> > > > 
> > > > I do think so, at least on x86 we signal whether vPCI should be
> > > > enabled for a domain using xen_arch_domainconfig at domain creation.
> > > > 
> > > > Ideally we would like to do this on a per-device basis for domUs, so
> > > > we should consider adding a new flag to xen_domctl_assign_device in
> > > > order to signal whether the assigned device should use vPCI.
> > > 
> > > I am a bit confused with this paragraph. If the device is not using vPCI,
> > > how will it be exposed to the domain? Are you planning to support both vPCI
> > > and PV PCI passthrough for a same domain?
> > 
> > You could have an external device model handling it using the ioreq
> > interface, like we currently do passthrough for HVM guests.
> 
> IMHO, if one decide to use QEMU for emulating the host bridge, then there is
> limited point to also ask Xen to emulate the hostbridge for some other
> device. So what would be the use case where you would want to be a
> per-device basis decision?

You could also emulate the bridge in Xen and then have QEMU and
vPCI handle accesses to the PCI config space for different devices.
The ioreq interface already allows registering for config space
accesses on a per SBDF basis.

XenServer currently has a use-case where generic PCI device
passthrough is handled by QEMU, while some GPUs are passed through
using a custom emulator.  So some domains effectively end with a QEMU
instance and a custom emulator, I don't see why you couldn't
technically replace QEMU with vPCI in this scenario.

The PCI root complex might be emulated by QEMU, or ideally by Xen.
That shouldn't prevent other device models from handling accesses for
devices, as long as accesses to the ECAM region(s) are trapped and
decoded by Xen.  IOW: if we want bridges to be emulated by ioreq
servers we need to introduce an hypercall to register ECAM regions
with Xen so that it can decode accesses and forward them
appropriately.

Thanks, Roger.

