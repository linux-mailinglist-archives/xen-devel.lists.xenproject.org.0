Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98DB74AE84
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560349.876211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiMM-0006YH-3s; Fri, 07 Jul 2023 10:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560349.876211; Fri, 07 Jul 2023 10:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiMM-0006WL-0D; Fri, 07 Jul 2023 10:06:42 +0000
Received: by outflank-mailman (input) for mailman id 560349;
 Fri, 07 Jul 2023 10:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHiMK-0006WF-0p
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:06:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f43e49b3-1cad-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 12:06:36 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 06:06:33 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by PH0PR03MB6268.namprd03.prod.outlook.com (2603:10b6:510:ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:06:31 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 10:06:31 +0000
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
X-Inumbo-ID: f43e49b3-1cad-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688724396;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qIaN0alXvTfky71q+iqE80nS2UceBdciNaoi+nSMI8o=;
  b=Z+nrsHxLkjqpDtJ9sTQ4guGHIQ6QujnnQh9cIJC89CaJtwHeYahFML91
   m4AJ0YuJpY+waGqiOQq6z98qyAPvI8dutAeFH3CBL1WsUmY0280k0WtHh
   Eub2VV451HZQGCXHo7XZbNvtWLN0eNLRMnzRhmwbELn6a5mf38h3leTbL
   M=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 115344287
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rY4xpaAAmm6hphVW/5jiw5YqxClBgxIJ4kV8jS/XYbTApD4m1GNTy
 mQdX22Ea66INmL1KYhwPN7k8EgE6pOAmIU3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxA4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+9hzLn9l/
 t8jAz0Vdwit3sifw4uyY7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrvQA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPcrynw2rWfwksXXqooPqGm1NFvoWejx0wCDRswUgHjvPO23xvWt9V3b
 hZ8FjAVhaov8E2mSPHtUhv+p2SL1jYHR9dPGvcmrgGMzqbZ6RyQAGQsRztNLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRn6z
 iqWtiE4i/MWhNQSyqSg1VndhnSnoZ2hZjAy4gLbT2e09DRTbYSuZ5GrwVXD5PMGJ4GcJnGGu
 HUHgMGY4Po5EYCWlCeNTeMOG5mk//+AdjbbhDZHFoM9+jGa/m+sdIFd/hlzPE5sdM0DfFfUj
 FT7vApQ4NpWIyGsZKouOYapUZx2k+7nCMjvUe3SYpxWeJ9teQSb/SZoI0mNw2Tql0tqmqY6U
 XuGTfuR4b8hIfwP5FKLqy01iNfHGghWKbvveK3G
IronPort-HdrOrdr: A9a23:brQ1l6kEDGdDVVlitSlIz8yweYPpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3A5a1K1mrJcTLqsoIY1e/yalLmUcEbdlLD53zzGGS?=
 =?us-ascii?q?1EX9xZuS/YFyp8Yoxxg=3D=3D?=
X-Talos-MUID: 9a23:KC+klQXKzTqjD1nq/AXGmC9AG8JJ2ZSvKFEIl7MB4ZGZPyMlbg==
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="115344287"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iazWcKJ4r3SxCsJOolEP7ZD4ai4bT1iDo+S0MLK8W2yEKPE8+cKF07U7wTUkASsYVCKAPO8+goyNZbpWo4FuoxtL92lJuMM0snqNBUWyd2S9e8kPZfbumKuCCkp2Fg6Oik7uIMz4K9UgfL6kAkVneEnXWB9UacYPmCTt/mbYClpWYyi5Asv6UaktfR0ECvvpujPHkDuk8hbqU41UCrRg/78zKbQ3L/Py4glax3APBpipmqnvlMlmvgtiQYS0eylnSAcGzSZe7kFIWlQJIwkzxIjm54rVowJrXrZTCk+ReNPjVu5kY3XfcYb11KlUjcaWxDtLXfXgHv256n4rkGKqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8134oXwS1+4R3dyIlkk4ALZOUXtg0vpV7F0J7j/S0ds=;
 b=bfiTl4lXP7dMJR/2rJ73dq3lPn+kb2hyImQujfNSxUeqFV8SG7b9YGTqEVAueJavkmyylV6721LbkdNjNan6ydL4agmflpMDc4K9XOUWUqQcmPsZykXuotiBCnYb78MxmrkHFDbQzhLGn+S6hTt0nVYM4CrK7HByKuQNJxKHK+/iYjyOe5DyuCOibwDBPQ2fI8muwLTberJsOQhNisfbMxcXl0P/aVYFewx3cMm7KCttvEpKi/ClS72R9xgHCng0btDv3OTB83fjSvUXaNN5K8NjA31cyqGexXgdFUd8loeHkc6FWSyQsL3tJy1Px7paklMDmtbOTv9nOSQ3lclTkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8134oXwS1+4R3dyIlkk4ALZOUXtg0vpV7F0J7j/S0ds=;
 b=BGY//JzjQjAY7qvHaK0cjZ5xsKX8QA4mkahB6uld7IjTVL1wNkr24Rz5mF1du9NDBvLKIESxWV/a9e+HSM15Rz20NqQT2Xahe2ahdEZM7u1rnYAKwvqcfJSh2HpHftlbchGldcAbJ3W8FX2ovdu5Nva9yxgZs7o81ZX6PHsHA4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 12:06:25 +0200
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
Message-ID: <ZKfjoXqb6Kgav-vL@MacBook-Air-de-Roger.local>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|PH0PR03MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: ae64cbd4-6b99-49ac-a4ef-08db7ed1d66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YMhx7C+WdX+kIHnx7Bmi0fWvd5jkoZaacu+kltHUUVvl4HaWxkRk4uRWpf40CPA5FA/41WJ9Ma4kSzcY953gzK7gCgdSx88UiiiiuiRTCwM4Q6/eWY7FTRy3scGErZxltRjQECFkskhY+hKls8f08mKzMjFHkVGj1AXtLggnGk1l0Y7KAjTvBOZmrD5JNMD9XCohpV0R/EDQx2UHypVZbkWMKhm5HYxAby4NUZannKhbN1lcMEUCza/XPABOmD1JlLncZNLED51fxF6A+6nM2VzYlm5Fl1/bFDBMdh49PaQrQXi+Nbjx0SKlZIpcKnr2799emOBHC3RhH1Wca/+OJT/CwY3xmwEOygaT3UzOb5tfMX+stf9pbgT5k6RER2BIz1LKW/LMBh6hcreZOoby9bmxsgaeeM5xmAR+wpHEQ7KXEdWLUP6rSQZaG9itB7AsMm2ia16eorpl9CT45ldb2MoHHxk+nMtDzn/5JYUTodfHP9r2sgt1p17ZBd6f/rDs3wetGHHjI2TCAyRPxmlrV4hEOC5+dKNclJMKf9hul3M6esvgFK3hmLZqiALqzmjp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(478600001)(26005)(186003)(6512007)(82960400001)(6506007)(9686003)(53546011)(86362001)(6666004)(316002)(83380400001)(66476007)(66556008)(6486002)(54906003)(38100700002)(4326008)(6916009)(66946007)(5660300002)(8676002)(8936002)(66899021)(41300700001)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnNEYU1EbWhGZEUwTlAvQlZXNDFDNE1oZDVpajJmQ2RCV1hwaHJ2M1BOeCtl?=
 =?utf-8?B?ZU9WZnlVZXZ4VytscUlqKzlRY043Vk1sT0hyZjJjMEMvSytTS2F0eGoyRXpj?=
 =?utf-8?B?aUVkKy9ueEZBcGZoYS9nbkJuSXhIZG56NWZWZ3FBNE9ZVDVBaUZOQzlqZExh?=
 =?utf-8?B?WENpWmVlL2JNakVrSnRPZTU0bzJjR1B4NUpIRVJqUmVFVHIxN2NjRDV3K3V3?=
 =?utf-8?B?azJINUlub05tRW9FNXZVeW1iam02Zk9HSVkwY2tRTStjelhPbDRGVEZQM2ZL?=
 =?utf-8?B?RFM5NWNtZ3lLUFo2RzhKVW1qUUpLV1ZYMnFUS2Nzdk5WSXQ5aG1PTHo1WEdy?=
 =?utf-8?B?ejZRQUNBN1l1VHJqdzZvN1hWeUt6eHpMdVlLbXZCV20yeExQTkZNcElkMXpo?=
 =?utf-8?B?SUNXbG5uTU9jRlNiNUpseWF6ZlM1UExrYS9LU1N0QjQvSytnTnROdWp0YUtn?=
 =?utf-8?B?Slh4aUF1R2poUFl3VVVYQldxNjcwSkJUMXhqbVZUYjdycU1RSFFvQWdjanpR?=
 =?utf-8?B?dGE2dzVpTUttZmROOHB0dVNEMHVMcEhHZ21XR2c3RTFFSG4zK2g0NzVwT3B2?=
 =?utf-8?B?VmZZVTZ0OU5kU2REaHdlblJDMjlZanBWQlQ0c3lHWUIxNHJqTlRVbW52ZWV1?=
 =?utf-8?B?a2NvOUJsM2wrK01uQjV3V293YUljWFkrUVRQekRGaExleWFWdFNNcEQzR1c3?=
 =?utf-8?B?RkF3VzZUVFNOMEFLQ1FWVHBZRnkzVmVPc0IxSzJEc2lJekZaakJyLytZTHR5?=
 =?utf-8?B?UlM4Uy9FTTRhZ1h3ZE5IL0JsRUNvV3EyZWF2Vktud3pLOFBKTllONHpYWHVT?=
 =?utf-8?B?MTJjSldMMGMwRURld2ZkZmVLWk9iblJDdWQ0Wm5Ud0JiblZLRmo2WS9HaVhi?=
 =?utf-8?B?U21VRGFjVlZNRjNieWxpd1JaR09TbENoQWNYb1NMaUlUR1dpQkNYSS9TSlhS?=
 =?utf-8?B?VGYvZys0dGhVKzJ0UDZhY2U0VHFUQzVOZHBtUFU0SzdER1BqbjhGSkdPS0JX?=
 =?utf-8?B?ZTZ6emgwQVdRYjJCcGNWem9kSlF5VEJJK2FhUVJiamFlWUtyTlk3MDRwdmtD?=
 =?utf-8?B?WUM2RmZwVVNaQUIzNHR2MUIxQVNOTU1nR1ErVitTZW9GdE0yWTRmNXI2elM2?=
 =?utf-8?B?L05Ea0Y5SThNSXJPOFdUOThKT3djQlYrTEJZSHdPS3k3b0tvcXdyc3J6MUVY?=
 =?utf-8?B?dzRKUldXeXh5N3gxMk80ZGFOS2JGRE5PZWxpMzhjRzB5NTFTNTJNYnV5K0Zj?=
 =?utf-8?B?OGhCSS82UFhBNUh0dkw1MTBoUmtURTczV2tCSFJnK2hKRGZaTXExY0ZzY0kz?=
 =?utf-8?B?RFhCUFlNKzdTTnlnbnJPeWxJZmZ2UXVOVG9IRVFvaWcrdSs4ZlZWWW9zMlVE?=
 =?utf-8?B?NXVrWXEyVVYyMS9uOHlpVVRBYS91YWNUTTZ6bjd1SExVOTBBMlhVdkxSSVlV?=
 =?utf-8?B?YVBEWUU3MUVaWHRleEZkaUtJVTNEM1Q4bU9lV0dKc0FWZkdlZ1VBd0hXWjA3?=
 =?utf-8?B?b21YekNKSC9lUU01cGthT1puZGcraXg0Y2VzSTgwOHNtdGpEdjVSK24reWhZ?=
 =?utf-8?B?K29EbEg5d0QyNHR2eHRrc2ZYV3ZJZ1BYZmhOaWUyZlNEZnNtTitEWHJzV3F5?=
 =?utf-8?B?MzVaYldkd2dBa25YOWMwcFhZcDJ3REJmTEJkaWdYNmxrNHB4ak83cmNva3kx?=
 =?utf-8?B?OUNNQ1RaRithOUg5a0t6UzJkT0ZMQU9pb3ZJNktmdzJDUEtFUFJ6dG1sVWNU?=
 =?utf-8?B?TXNYcTVubDd5ZHBjUS9NSGwxK3BqeUI3WkxxcWhhN2YxMEtBNHljZ1RJZnpT?=
 =?utf-8?B?S010UlQxVGR1aldCUHJ5RWYveFJEMUxUbVJTQnpWNjg2aXBoekRINm5hMWUv?=
 =?utf-8?B?d2NlNEpUT1U3Z3RWQ2VsUHFUYTVFYzErdzNraFNiYXJPZ2RqaEVTYnJSQzdK?=
 =?utf-8?B?UGlmZGVVNnhlMVFYaldTMlpQVUlRM2h1eFhVeE8xRDNXRTdlSmEzbmlIWjJD?=
 =?utf-8?B?Z0l2UHNYb2lrVDdDaFk0TFgvYjlwUnRxMXlXZU9vRjJ3YXJkQWQrSlZmVkFi?=
 =?utf-8?B?bHNRMDlSYUVpTUxkQWVXUzBna0krY1VNSUNBU1BYMUVacDdVdGNXVS9vNmhj?=
 =?utf-8?B?K1FkWEFQU1l2aVIxcG05bk43OGR1b0pRT0FoVkMzYXQwc0NGYWdROTJoYnk2?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ry6Sx9U8yWGkefpBMKR3ZZ3LfjJtGxuvLCJ7y19d25qc8nkPCc6xdSH1x5hX7QfZGack2pynPHFd1SbOcsBw8Yj25tJSwPmirIvX3tqF/+ZPBQUzUKT1wq3JUa1xyWOVVytgA/4ZTWx/FzXJYXanDobj8+itwTWhII1VKl2OfPGHcJFnwC/ZAnwwgB1te5Ymu56JPVb7eKx+FIlg1Dj00RAc4FD8iPjZzyh2WdEXcjlzkZ7zAH2uNIl+X4GNfGI4l4IaWakgcum4wP/E3Zh1BxOeyCr0xNCtOKf6WgL7SIFsxtB2ObPTYQJaEKUFOYpYtw6oFWFHZ78b7QQJoUYBZ74KI73j2rwt7LqBn7It8RnMfBFI+6jAYfZTyeQ5op6sCCDFjdMl09U1aD7IbUVZTGsvbnnPfc2Dhd2zbalpuV3uGMN10fpJD/X8zS9uP89sheSw9Yz5ewpLw6UCfcLQmKI97nphiOnsBHoEkgZhMgtpzis49obYp65oO1CyHZDniPYqE5xVUPPBL1ycHJIqhYYViUgkx2qeivk00si8czxtF6cR8B4KtgANlFbj/9kEgBHcC5jGYGJMfHcE84K0Ih/5LjBUXhITl731ivicKv5nQ+euS/DBR7OaFivPM3TUx1lHtqUnI4LjsqZ1i6dZloA5gRKLb3FlYSCf78sxfXptwbw7bzWkko8v1pqwFGNaAxVZSVey/eh0Jbm+gKkMwMcTdOKgUccqn6qNPcHiOLbLvUT54XvOlsR+Zqd1TC3oAHJm69L0oHcmWbsarnvL/oHoaI2bkJUu7vY1n9e49QPvuC6dGs3RRaiVFim0Gxx8JKD0OzoL2gMcWolZ1FMd2nams82hLtYI5x1pQGevsE80GP0OpcgYIDnaZQVqFAV5snsXpHIqcYPAOZJI0l4Dmg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae64cbd4-6b99-49ac-a4ef-08db7ed1d66a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:06:31.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chwWJMmjaHoNJ4+Twhh5wxwm4k0fPkpUOqlaSWGbyjOm4D0fKFje//oubLdSwgHoasnfhH/oe/eXJxvBkmpO0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6268

On Fri, Jul 07, 2023 at 10:00:51AM +0100, Julien Grall wrote:
> On 07/07/2023 02:47, Stewart Hildebrand wrote:
> > Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
> > code base. It will be used by the vPCI series [1]. This patch is intended to be
> > merged as part of the vPCI series.
> > 
> > v1->v2:
> > * new patch
> > ---
> >   xen/arch/arm/Kconfig              | 1 +
> >   xen/arch/arm/include/asm/domain.h | 2 +-
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 4e0cc421ad48..75dfa2f5a82d 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
> >   	depends on ARM_64
> >   	select HAS_PCI
> >   	select HAS_VPCI
> > +	select HAS_VPCI_GUEST_SUPPORT
> >   	default n
> >   	help
> >   	  This option enables PCI device passthrough
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > index 1a13965a26b8..6e016b00bae1 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
> >   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
> > -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> > +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
> 
> As I mentioned in the previous patch, wouldn't this enable vPCI
> unconditionally for all the domain? Shouldn't this be instead an optional
> feature which would be selected by the toolstack?

I do think so, at least on x86 we signal whether vPCI should be
enabled for a domain using xen_arch_domainconfig at domain creation.

Ideally we would like to do this on a per-device basis for domUs, so
we should consider adding a new flag to xen_domctl_assign_device in
order to signal whether the assigned device should use vPCI.

Thanks, Roger.

