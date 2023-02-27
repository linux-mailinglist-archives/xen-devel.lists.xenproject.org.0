Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E36A3FAA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 11:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502355.774114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWb2t-0000Tl-Pr; Mon, 27 Feb 2023 10:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502355.774114; Mon, 27 Feb 2023 10:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWb2t-0000QS-N1; Mon, 27 Feb 2023 10:47:51 +0000
Received: by outflank-mailman (input) for mailman id 502355;
 Mon, 27 Feb 2023 10:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWb2r-000080-AH
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 10:47:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b4bf055-b68c-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 11:47:47 +0100 (CET)
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 05:47:44 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5941.namprd03.prod.outlook.com (2603:10b6:510:34::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 10:47:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 10:47:42 +0000
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
X-Inumbo-ID: 2b4bf055-b68c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677494867;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YsQyEKRRbfhV8Oz0ceHjsFMUvyKbHIOA4B/3kRCs+Oc=;
  b=iQF/qFu4dmdM0mQan3LcOQk1Q68SZJeEyuutBzHse+3868ym8qvCAE4D
   RkWPb8o7S8UMv8qFdRuPsqIRXIdmISpSNEhQSmF3AVCwRxMT0hfEKP8bt
   Zt4D7QdQpxFjrvtCi8pnp8H/pwcMrDo1ZNTBUWRJfBUhHxvZrEPtMQRJK
   g=;
X-IronPort-RemoteIP: 104.47.74.43
X-IronPort-MID: 98666362
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Cs10X6qZxpuOgnXjtniXVpgyd7deBmIsZBIvgKrLsJaIsI4StFCzt
 garIBmEM/3YYDDxLdEgYN6+/UtQv5WByIdmSAM+q3o3HytE95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHcndiud2OGu+pWYb8xjp/h/IdH0N5xK7xmMzRmBZRonabbqZv2WoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+SrbIG9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzoqKA02wPJroAVIBo1Z2GL/MiHsV6VRIJme
 04wx20oiLdnoSRHSfG4BXVUukWstAMGSdNUFOE99wilxa/d4gLfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaEQo/IHIGZCQEZRAY+NSlq4Y25i8jVf5mGa+xy9fzSTf5x
 mjWqDBk3+lIy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:ownjWa6XUtg9BPKNdAPXwMrXdLJyesId70hD6qkXc20yTiX4rb
 HIoB1/73TJYVkqKRMdcLy7V5VoIkmslqKdg7NxAV7KZmCP0geVxepZjbcKrQePJ8VSndQx6U
 /mGJIObOEZ2TNB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.97,331,1669093200"; 
   d="scan'208";a="98666362"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeowLBv7zGmH7eLS9yk75lJOLwSHox5WmTpuIE855qIjUPn6dw93jZU5crjf1/XkBftc5uSa0vBnnQLyNmEEie/YsbS1f9VXFfa+nx/uTAypzrDRnxguT0ROSQ0rn3CdtulKjH8UvU2gE4RmJBhaHoHcEKd7Eefwx05LP03q49hmVTMqSdrtVPFS6w7BuUcti9wYtYB9p4rdoqSL71n8oOadZ+5Bbb7ojY8YktleCIt8kr5y7Hc5Iw7Gh4qmXNTnAGArs3MXofdrkHb/+hVdEtho1rLmHrjHh6VaZoZ3usigBNIYYB5CvywVThaQbnC/GNrJz5usYqq0m4JUJacMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsQyEKRRbfhV8Oz0ceHjsFMUvyKbHIOA4B/3kRCs+Oc=;
 b=P6NDDuYdhPY61gvbTXP/XzIAbGzQiKI5wPtC7BFd6242HQbQx77rxLpLro6aeODKFgMssOAuZLIoM0G2+5CMr9T5zrcc5+n8dBh4AtT7px7/nP5ovuFaw0BTOocV5N1/Soe3t7BUQIlfQHRUINTAfwz4+SPjN7hOUnEP35mQGPU0IZjiJQqZdotNxfvEdaNasoKArY9+xW226mdXzpok0nN2GBXGfL59Qb0yDgXjAxoL0bM7xeVOViMZEIGB4ZJfgNzmrGoZNHF72VZGtBIbU+f1zYO32VieYTFMfHmWOxCVJWgOpKOUAXDtdHndg9iMdhFJz3GZVgK1BSL8DRw0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsQyEKRRbfhV8Oz0ceHjsFMUvyKbHIOA4B/3kRCs+Oc=;
 b=QhHVkRjNE9qqjrn38rmq7kPsSG0G0jo67KEUDAaOY78u+ywm1NjCI/Z3CyWS3jY0ceD8CeTXBH32gMeVmcoB2+fcfq8jmDBIDj7BFSzxdIW0oS7CJdm321Ef7lvRdmTmMJU3uMWiIDWtCVV9dr2xT4y5VwfdwIAoEATTga+omjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3e8b2f68-e620-770b-e44e-b273f0da74e7@citrix.com>
Date: Mon, 27 Feb 2023 10:47:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 05.5/14] x86/svm: Decouple types in struct nestedsvm
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>
References: <20230224185010.3692754-6-burzalodowa@gmail.com>
 <20230224210616.2818727-1-andrew.cooper3@citrix.com>
 <709fef03-4263-861b-3ccd-44e3706b5fb3@gmail.com>
In-Reply-To: <709fef03-4263-861b-3ccd-44e3706b5fb3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c98f53-b908-4985-d1ad-08db18b00d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cRQa37rrjwpIJDjNlsRw5I9pLZkOp+k6RrqGA++bS7CBgU49VOjPj5sU4BJrNecrjjj6gaCU7bq1Es797rtZDAGVijCX0uMHqB7JLeTe32snsNJX0wtgmxkWw+ZDovbTMrWsfgw3Zu5nstweM+r3DtYp7xfnclECHpv6D4aBlV0uGg+CCBZ/Wl0qaOdZO5h3wMw49xtQ5WLp3N6v11IL8nOhF1T1/9FHFZu8NlLx7mAKkg5s8STwIxWO7iHSxtDDp1bTHLZLUt/0pUMN89Br9ztA3j/2OrTy0ypH+OgVE1uQ3wmHsz/MtWRG+uFBpltZV/6QgMFhQLwl+CCv4C2i8f4yxvEl+A8j1CIGAlVwHzLAWQnZMe8wZ8vNdlv3mRnA9ihXjZIpZTI68dhx/Uup4HLxbzjrnDxvh9X0c8DU7qc88rVvrVeiHCDkjZUX+EA14xXuz7TJyCvjVIujkNIUKE9EyQHNXxC21CFo3Q9ttj/PqPvHH0Cxy3c0qOHrwCYLmWFWvt0ur++wu7CK+RpR3sSTvxPhDyXo6RMEN4c233kgwmS4OjE1dpuRgKE2Ahxq+cFP2fQoLUotdw0Mwwa8GTfiOPbIejnKjqFtzNw7xiTmr/ffsOXLXTY68I3WM4ukKlXrrV43hHgeit6cvl97/ulOKq1Y3WiQm015xXo5xkFfgGIqeTyV2ryqK62xhaipEoem0EIsySQyTyZmeXq3RuiOweT7rUJhag40wly1gfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199018)(36756003)(316002)(110136005)(6486002)(5660300002)(478600001)(2906002)(8936002)(66556008)(66946007)(66476007)(4744005)(8676002)(4326008)(41300700001)(82960400001)(31696002)(86362001)(38100700002)(6512007)(26005)(6506007)(53546011)(83380400001)(6666004)(186003)(2616005)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjRSK0lBQm5UOFdERk1wNThQelNFaDNMMVBvRnlXa3p1TDU1ZU9KNHpZUkk1?=
 =?utf-8?B?ZEFVcUR4cEVIeGlJem0vQ09sU2c3MWJBOVZUVUVYNTk4Q1Fqak9GR2VkdnNm?=
 =?utf-8?B?QythazlWaFYzazIyQlNzaE1ZM0VXNGs5bUdEQ25HWE1aVmREVitHeS9TeEJQ?=
 =?utf-8?B?bFpyNnpndFBxQUFHVDNqZmh2bHF1RU5za0hSUUVaNTRZZ1lVeDBMQU03QTBm?=
 =?utf-8?B?cnRtaUFELy9GbFNkbVc2T2JMc0IrUHQ2eFBNb1J0YkozK29XLzI4cVA5SzBB?=
 =?utf-8?B?bWxVaDVabHlVcElrVEFtRFcrei9GNmRhUzlxa3BzQUdoNFpPWmZRa05RczdF?=
 =?utf-8?B?TmFBUTlEUzRGc1RsWjZ5ZGZEWUN4OGRWS3NJSDE4ajBQZmNHc001dGgzNUxH?=
 =?utf-8?B?cDA4OUFva0REbUpoWjE5TVh5bmRTS09hUmlNUjQxWHI1SkEwRDkvQTRTV0Zz?=
 =?utf-8?B?Yy9DYW9vWVQvcjQxL3UrQ01xUUVaa2lFNis1RXBjS0MweHZabENobE1uZUhh?=
 =?utf-8?B?QVJ5cU5KK0NYMEM5bnBKQ3ozTEFkbVlGcGpQajB6VVVvUTZmcmdXbk1oQTBl?=
 =?utf-8?B?N1FKcEc3K0cvUXNNQnMxdTJ6SDBsRE5wa0F2TDI4K0x1ZGdBTjFvbzU4Q3hQ?=
 =?utf-8?B?enRwOVYzUnEweWJuL0xmQUl2L2VqYjA1d1VrVk1ienZMMlJEb1hhTCtqZHR3?=
 =?utf-8?B?YXB3SjA0Q29RVFowREdHODVWNUhNM242MzgzZU0vUkw2T0ZzeWExem1SNW1y?=
 =?utf-8?B?c1JncTJ0cEIyNXoySGV2bEp6dXNXdkdmc1pON0E3ZW51cGQ5TXBBcUZ4L1JI?=
 =?utf-8?B?czhLR0hrMHZNdExSNDd0YTdqcHVzMWJlM3dNTUxWOC9ScmhYb2owRmlGaCsw?=
 =?utf-8?B?RDg1d0dLZGcyRXRWVURRZGd6T2ZwNWhSd3JJYVBLczhoS1YxNnlwbTVMV0pP?=
 =?utf-8?B?NG1mTTIwTFJ4dkp3cjkxS0hSZXVNdzNrYnI3aTdrdDNTVjFRQlgzeGxDT2I0?=
 =?utf-8?B?Z3lOWUpBbVV2NitkejdRNjJXMTk0Y0FDVkZRc1NMZXRlNnZaV1p4eVhVWHdv?=
 =?utf-8?B?d214eVdhdzdMZHhHcDhlVUliRkxDQUxjVnowMWx6dEg3MFducGQ5MTZ2SnVF?=
 =?utf-8?B?aERBa0ZlQXM5WVhsL3lMK3JjOElDNjZUcG1OUk5mMXBCUWFxeXdrN2pnRlFz?=
 =?utf-8?B?ZDlJOGdqWXpYRFhSZnhVSGdNUzVZQ0pKRW9MYnlFZjVlOHJ4dHNPc0g3ajNG?=
 =?utf-8?B?dUMwanR4ZVBZOVVQUW9KWHRmaFQrSnRlRm1HZHBCK2wwNFFSMy9iLzhEQXQx?=
 =?utf-8?B?UTZyd096YVJmMFhzanBJUXptQlArVzkvMk0zNHVpc0pYakpWSlZURDFCcE05?=
 =?utf-8?B?MjNydUVFRTZRWEl1QWdXdmM2WTlJbGJmZVA4VmJDM1FadHpSQmtNZng5MGtm?=
 =?utf-8?B?ekk3WVhDM2c1cDVEeDhFL2RRenRRcGlUeGQ3TlFzTzR2NzJJNGpGNzhEMDBx?=
 =?utf-8?B?UXBTWXhvZHFOK0xjVHplN0dOaEZTZmkrdWFrOEVVNE1DaVpFS3J2SUl4UVBo?=
 =?utf-8?B?OW0xcXV3c3JYQ0xkaUNTUnNOa0lNdEtqcHpuRGsrRWo3a1RPSldKYWtWWVdR?=
 =?utf-8?B?R1JyamtlYjkxaFFjSStqZGErMlNWOVRIajRvRXVwWGVvcDFTNjBHNFByLzlC?=
 =?utf-8?B?TGxaSStlQkhWZ3R4Q2RZaTQ1WDhqWXdmbjNSaTk1WDB6NWwvdXlCMll3NXM4?=
 =?utf-8?B?SG0xRldtam1TbVdWVTdBSHU0WmhyQ01hNTBtdmgvdkMrQ2h0WEgvaGp4RG10?=
 =?utf-8?B?K3FBeDJMZytoVStuYnlrRytBQzRXalRJVWkya0hYVHJTdHVDbHYrZ1JSNkRJ?=
 =?utf-8?B?SWYvSHFiUGpDMDhpYkVoekNuRUZzOGZGUG0yUm5pdjZ0UE9mZGd1dThRZ3JP?=
 =?utf-8?B?WTIxcWhoWUYwNG9CeTIrc3AyaUR3bnVEMFhxRG5rVGZSNTh0ZWhwdktZQm5s?=
 =?utf-8?B?OG5pT3BTSjVJSW45U1pLa2tyVG83aktXQ082RVhvZmVvcjN2RHM1S2R1dVV4?=
 =?utf-8?B?QmdWT1ZDZFpPQ3l2dHJ4YmFVYzFTTUFybkFPSmlPM3RPaGhsRy9YSHpHLytF?=
 =?utf-8?B?b0xEK0FRbEdHWEF0UjZwbXZRWGZWY1VNcHgzalBpK0V0cVFjb2FFcjdFWnhl?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jEB51g+l0LClv7loEarg0JT456H9Unp9HvclWKMeHmsuwWdTimD5WGyXgUDTg/MWTYyLo0T7mo6Z522587K8MAnYgrMNKFlfUrW89yj8IthulcOZsky9Qw9XhO9ZTscsXE2uBiGH5G7NvwTdA0kszSDVlFpJ3UzW1TW60kGjtv3UqonAklLzQY3DmsTFmnAkL4qrB7R01kLFnkUMvrPRDz8NeJiihC2Klse6fYa1yIeEkJSFDkmTtUxU15hdZ58oo06ygfPeIN8bZhPEJzpW969uwWcqw45d/p557HKgiS8KAm23yAPXBzz6BFY86Pe36R5yKMYG9mj/NUhYiKs/khkpB6kMwN+L1LdqWiyxvDMu0oEVLz37Oh18lCA7M5awVjWGVtX/h1p5jUcPQ91WJk8hKuX+i3AnHaHCucS0yMYi0u5XQqlc+DDHKWwHdex0fav62bfuQryHf9CLBAU1jpjEpIr7g1+4G4zZ4DKXgKi6VdIcxP6zRpt/GCpgsdm7ma7XC/SqsQ0v4Bw5xmBIsqOyUxd0xR/ihgJnEqMeecNrJyEFFN/JoYnnnTbav4H4O9yeFZ7r80Ly7t94WZfVZrUj5+BaH5KvrBiayrn/EKXxSfpPJwm5Fz5c5bxep9Z92aOLpfsKwkuip7/CZjoV/W3FKvXhovakhe77N7aX/K+rF/IIY0Ygrz4bLzxNcCAsN3T6eFQw0Z3uQpIC5pQu6r83aItPg/bSVTTGlR8lFri5vf5xTA7azFGJa2taytFdkZhr/otQIGsKZ2C6iPuiEotbYGfHSlx+hmWgQnJ7o8A6JEGL76nD5bLaQfLAnTe81fSU353xlYMRTwNdmiV8yQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c98f53-b908-4985-d1ad-08db18b00d0c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 10:47:41.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCnt22rXDEYycb4dxPA0tJZnSTaiK/r6hQABsVzybsNJXRwPg5ru5z0DmTdfRB4wtazHfZCuHS9e+E38mPILZO0p5tlHXFx2UW1ICfxwaqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5941

On 27/02/2023 8:52 am, Xenia Ragiadakou wrote:
>
> On 2/24/23 23:06, Andrew Cooper wrote:
>> struct nestedvm uses mostly plain integer types, except for
>> virt_ext_t which
>> is a union wrapping two bitfield names.  But the nested virt logic
>> only ever
>> deals with it as full opaque register.
>>
>> Switch it to being a plain uint64_t, allowing us to hide even more of
>> the SVM
>> internal infrastructure.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>

On second thoughts, the fact that this patch compiles means its a
write-only variable.

Lemme experiment quickly with an alternate patch.

~Andrew

