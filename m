Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36A500DC5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 14:40:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304704.519397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyls-0002Cy-8X; Thu, 14 Apr 2022 12:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304704.519397; Thu, 14 Apr 2022 12:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyls-0002AJ-5O; Thu, 14 Apr 2022 12:40:24 +0000
Received: by outflank-mailman (input) for mailman id 304704;
 Thu, 14 Apr 2022 12:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xO=UY=citrix.com=prvs=09619e58f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neylq-0002AD-Kn
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 12:40:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b19d0c4-bbf0-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 14:40:21 +0200 (CEST)
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
X-Inumbo-ID: 0b19d0c4-bbf0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649940021;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=X/brzmAE/DpTLNxow1schrZSCxklrnjQ/FytNaW7ZTQ=;
  b=gc6vpSxwSeD54EmDfgLTUURJGPVkaplZUHfjJVU1NyWKTrJjz3qZOReQ
   ukTJgR1IhJHi2KImjvJCnnCgmaDugRqoT3W75O8hzuDOIXfz2RzTlpVT1
   8+R9VWdLcv6+qBEMobxnzLkaDMDlU2RVfRp/zJdfwGUfdDEMpv9+C0+0O
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68951733
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RVo8VK55wJQeuY3Icfjd2wxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 mdNUTrSM6nfZmT1Ko10a9jj80sCu5bUzYRqTlA6rihjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTgX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSwRBkGB6zqndgAVh5HQzBlMvNv95XYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQTaeDP
 pVCMlKDajzMbRcWI2o3BqsCp+eJp3zzMDxxlnma8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9pdDcID6SeI9rfR5BnJF3MLEBdOQsNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODEsogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vdB0xa5hYImS0C
 KM2he+3zMUCVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSnPHKGoNJJcAhiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:uoGx16DoERTMVp/lHehCsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHP9OkPMs1NKZPTUO11HYSb2KgbGSpwEIXheOitK1tp
 0QApSWaueAdWSS5PySiGLTfqdCsbu6GeKT9JzjJh9WPH9Xgspbnn5E42igYypLrF4sP+tHKH
 PQ3LsOmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczIgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenEPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tpt+CVQpAZEyHsHceg22w
 31CNUZqFhwdL5lUUtcPpZ2fSLlMB2FffrzWFjiVGgPUpt3f07wlw==
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68951733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H14Qr6BO+J/wBzDi69dO53Gl1uP26BtEE1ZELPCCTSHuFGyPFJXo9OW5MVjnVwntKFhakDD9TpOPdMFBPMvVH6g15ZGKEuWYp8+wm7bZUbdoD8c6YyPStOt6vY/1HDUANfLAtxkmanhoAXmnnND4y5VT0ir1XU+Xw0Ezr2Ox4di2p8r2AXKJlJ6XbMjxBq5EcsiJkFwyjAAEritdRE3Oj7iqaSdbI0ygkWGt06BsuiiGZHABoTFmlxCDfTNN8j4JitldcTrleWfGv6anusoobG9G593y11OV0LwkgGyzmR9FKqYiErBl7lYYZmZdBpu7uUAVCIS+MOhg3jtXO0LS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzXlpB20U4qtIGwny9tQ/KffctDeZlpyzaQOOpVpUKI=;
 b=KHBI3dLjXoB33jSQeVxH7hmTQ2XTiXF+be8nmDdAknfuLCmel2HSklpZguo3l9mgYkgljKTgK43NNjf/yw5gRhFkVf4MC8TSOjpM/Hm6SPEjRhytB6ix3gY+GVrrIZyqTJX59xtZImzhgkyTrkzKQZUJd4ghZoJxjS/Ol9FxqFusj5FypyENxiSt/7XSrbDCF+9ltYyxgvCDG7aHcnXB4lKYSDxi9qMTzBqe5HliSOps2cu906RtOO1efin8gVmaAZPA118RcBtCo+5vcxNWLX9pNnq3oe6SOS6+IHXj0lsqD89ZB8L03n0SkPxXkuc4Vyh/YQPUANh3Zx1zmB7SGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzXlpB20U4qtIGwny9tQ/KffctDeZlpyzaQOOpVpUKI=;
 b=R8IBCZcwEgwKITeQIer4W2w0tEysIUeUot+eeXJoRaHdu9C2ZQzTB1gfPBiZs8GmIguep700XWar2lpviXPGqCXWRdrQiMzpz8Fq51N8aIz27rQSBkF39BLjIWFASznh7Gp/loHXKzgTY0N0TrmVZ/XsYI+Hm+q65/uDkNhiN/c=
Date: Thu, 14 Apr 2022 14:40:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Message-ID: <YlgWKGmR+u41zSsw@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13b24931-ccca-4c1c-80c1-08da1e13ebbe
X-MS-TrafficTypeDiagnostic: CY1PR03MB2171:EE_
X-Microsoft-Antispam-PRVS: <CY1PR03MB2171C126514DD3C6FF9707F68FEF9@CY1PR03MB2171.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pGzExSKZJ+ngZHl5KOfvz+K23RlTJAmX55p6VksmwqdGC6QlNoxF/cb5pImNbBne/b9wPcT5/hIxfh66EQ9VKjBy1HkukHSoWlILwVOXhbo83bRTbaxje3Pa8y5gA/Pv61+TqUEM4EtBjwLug9dyGueLZ09jzbyVw3MX0b25rPcNUyI2PVgi5GcsEnu8cxU51mGrux3O6aG0qJBEMX8brI96khx+MYyJcYu1ELdIWt+K6nR/7BmbXpu6q5AHsONzdJcQySmGquPoJKi7Qwleyqmkc1+09pjhLDHUYILYq5LRhTUzTXrnFE1DsPzsHOK3oErclpgbhWb+Nbh8JNciTSA6BPTwNj1NX4472n8Hh9oRjtkGGkzFwyJOfg3s9QjMTYZNEwgTtOZ5fMFlbERWn97BG8nJEDP5RheXVhJKdjFNYIm6CMisYdTuxCVQ5rX+6A8nHGkqkjLAzuGlb3luhhnZI0x3fWje8V8aSYueVOwAdheU2l5lF3ynRVC+KnDT8emjalOg1xwUXjbZQmEmTa5sIQMxcLiV9wRkXMBjUKAJDT7r/Q58pcCrVh3lbCgRFAyI3NXur0vRAJDghPNWZ0NBEvpHckKauVTGaSxoDjzI7ZcAJsXNzKxL1Erkt1yXDveaR+rOJnr7K1lEmUPSAMSotmrzT42BJ/kq2yphwOOO7dYmemYv/9VJDYxoUiq5/mEOMlnE8nRuwL5AL8NHWZRb72N17C9dfShZOBXI4eRCxOxjUxmuMWM0V7B+NnMYfJXUW4SY7NQ8ibjfzv93oTdDz2XgdThw/aDeG+FXJtE0iBrJAD7A2fbWtXVSSPWJOZd9udBWAeYHpCzOoE2tvCc0ibt+ex7AXY62Yvx3Mc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(5660300002)(26005)(6506007)(6512007)(6666004)(4326008)(9686003)(2906002)(66946007)(66556008)(66476007)(966005)(6486002)(508600001)(85182001)(86362001)(54906003)(316002)(6916009)(83380400001)(38100700002)(8936002)(186003)(33716001)(82960400001)(142923001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk5pa08relJSOG04RDZZRUtmcnByMGVkckRNVmg4QmdDZkFrRHY5TWcwL3VC?=
 =?utf-8?B?OTdKVHF1bEZ4L3c5R1NnZVdOb1M1VlNIbGtscVlGUTZHcjZnaDAwelJFUzBU?=
 =?utf-8?B?N09WVTFrWTFMZzZVVFhSWXVaUkF1eEQrdCsxN2ZQSThqaGl3dFNvaHR0Y1dG?=
 =?utf-8?B?L0RJL1dzVElFNVNoWVJLTE03UEhNczA4VG5HRU8yeHVCekVXMUNQZEFNVGpW?=
 =?utf-8?B?dmg4eWxmVGdkZDJ2T0owUjNueTNVUjM5S1FVNXlXRFVQbjh5SXZjMWplbnp4?=
 =?utf-8?B?b0h4UGNaaW1mWWNEekw4SU5TSjdTWUl4SUlLOVFRTjZrVUxFTGtQQnRNYTNw?=
 =?utf-8?B?b3JaUGJISFRpRWpPdHVQQ3Uycm4vTEcvcW10dU9ycDJnMHB6MEI2TWVCNitI?=
 =?utf-8?B?MnBYeHVpdEVhZFF3dEhyU0ZDYjFBWS9hWXovcXFyWW9iQlpkTzFnTDRuRUY2?=
 =?utf-8?B?T3BOOXp6TTdqT2F1eVl1WU8xdGE5YVhVYVY2R01QK29reDBWME0yQXJtc1lC?=
 =?utf-8?B?dUdVdmNjK0syTFlIS2FRZmJCWWdIMFBmbHVsUjZMUVdQdS95MnVEVERnVi90?=
 =?utf-8?B?TEIxZE5CdU95OWZ5Qmo4OHprdHdzblZKeUNQU3RUZ3BnYWw2RUdFQ3RETFQ1?=
 =?utf-8?B?R0V3akVESEUxdEI5UElKcVRGN0ozL3hLaGhVY0FUZnBoWk5xS0ljUERDeUtp?=
 =?utf-8?B?ZmlHelR5SXdIM0VwRTNUZ0hLbHZ4bWxzUXhCaHpRSmttQVh1M2wybnZ2QXJa?=
 =?utf-8?B?ZTkyYVIwYzkzM05jQ1NPQWJOQjY1R0hUTUlhSTZjdFR3UzVVNldpTnZya3BS?=
 =?utf-8?B?K2JlR1NiN2xnVDAwNUlZNHdJNnN3VUxyTXFzU1craWRRR25DUWVPWTVGbnB2?=
 =?utf-8?B?UlEvUjR6WW9XbnoyR0tzWk5DeTAvcFlSOC85a1d0eHVxYk5FKzFYVmpGUFhI?=
 =?utf-8?B?NjRkTmd4SFBvUFh2Sm1nYkpKaDhTZXBkTnRPNXZEakptRVJGSkdWUVgrQjVq?=
 =?utf-8?B?c3pIYUxEbGFQbko5N0laUTl2akpXNFp5NjdGcEdIajRaWE02ZnRZN1ZpVHRT?=
 =?utf-8?B?L285WS91dEt6NHlNeEducEZtdFRjdlJpeld4VzdZeDBOa0VmNnZ3TmQ4S3Fs?=
 =?utf-8?B?TWE1bmxWZGFTNW9BMTd3K2cvLzlUdnBPNDZNeWdSNkQ3MXJWOVJyRSsyd3FM?=
 =?utf-8?B?Z1RnbHZoanlPaXRXYlk0aEJFbVVVVDB2UGVVMWhRVEpEMjdyRFBjUHFMWStJ?=
 =?utf-8?B?VFowZGo2T3NoVmRvK05Pd2R1VjRqdnZyU3pWUXNmRitWdWJCbURObmxxbElo?=
 =?utf-8?B?cEs0d3RkakF4K3NCM0x2dlYySnNjTWlUeEZBUWdDNkdhN0VjQmsySkpHa2Jx?=
 =?utf-8?B?OU5nM3REbDNIN2VCL1kyRWgyQmh0NUdIU0tNNkx0cjROSDFMZXUzQ3g2cDBh?=
 =?utf-8?B?bVYrSHIvOWQ1NkNQemF0bGdidFhVa3RhNUw2UnhiVDdSajhxNCt5cmdwTk9C?=
 =?utf-8?B?THJaaDM5VVk4UGxrWnU0enhPZEtUd2ZScE1rbTNVQmVKVDFPZVpLUXdtUnJ0?=
 =?utf-8?B?Q0Qwd2pISW03c0JxOUdnTFNMcWlTWlVWYkVRN0F1RlBWdk1WUi92ajNIcVNS?=
 =?utf-8?B?RjFVa2lkQStRZHNYN0c1RFJic0FDUFZMZTJ1WEMxYlJkeS82Vi9xUTVBT1Jy?=
 =?utf-8?B?Uzc1ZmhZN2V2RG5Bc3ZqOEF5VVdkRkp2eWd4d2hBL21SZy9CZTdGTnNRMFJG?=
 =?utf-8?B?MmIyRTBLY1pyS1hFODI4TGZJUDVjUWY5dHRoNE4wTk8rWG95aU9LenJ6dXFB?=
 =?utf-8?B?VXRtM29yQVdqQ2dQVFZkTzZRR3l5N1hQUFRoSWpFYlJPRm1kOFliTkZpajhh?=
 =?utf-8?B?bjR3M214MGZyWjhBWHM5SHhSaGgyaFVjV1I4TlV2UnJBUG9xaCtOaklJVXA5?=
 =?utf-8?B?dlZXRUhXT0NvYnNyc2VYb2tJbVJyeHVQTDJuZ0pZT2RBNkoyZFhKdE5FVDlJ?=
 =?utf-8?B?ckVrR1RxU0pkWkI1RFcrbFF3eUprZWdoQ21ES0NJVUErRWMybVBBV0syOEps?=
 =?utf-8?B?Q2RGODIwY0JIbUF0WWpMUWJmc1Q4RVpjVXJiQ2tVcmNUMGZ5WGJycXNmWkZL?=
 =?utf-8?B?L3F5aTR4RW9sOWdKODdydk5qVVJCOFdpQzYyaXkrOWs2WkduakU5WDBYR3NI?=
 =?utf-8?B?ZWQzWUx4S3ljRE1UVEYxNngzbSt2QlhwOGd2eHAxSStmM0t4dE1YRTRXc0tN?=
 =?utf-8?B?L0ZZNm0xaVNWUWgwQmxmRkNadDJrL1JwSDNOWWhOSUtOeU9DQ3RuUGZnWm4w?=
 =?utf-8?B?SStjaldyYldncWhyVUFtTWRDc2NWMHpXRHYyY1RMZ0pRNWwrdFE0ZTNDWVNM?=
 =?utf-8?Q?imOmT/R5rvNWbN/w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b24931-ccca-4c1c-80c1-08da1e13ebbe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 12:40:13.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSzu10fUehjzMiix2GNHJVheFqBTFNnum39KLEUSi7VwLTHRs2wHl+8CcNgFT9sbqI7k+WySW+M9F/KNXJO9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2171
X-OriginatorOrg: citrix.com

On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
> While future gas versions will allow line number information to be
> generated for all instances of .irp and alike [1][2], the same isn't
> true (nor immediately intended) for .macro [3]. Hence macros, when they
> do more than just invoke another macro or issue an individual insn, want
> to have .line directives (in header files also .file ones) in place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=7992631e8c0b0e711fbaba991348ef6f6e583725
> [2] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=2ee1792bec225ea19c71095cee5a3a9ae6df7c59
> [3] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=6d1ace6861e999361b30d1bc27459ab8094e0d4a
> ---
> Using .file has the perhaps undesirable side effect of generating a fair
> amount of (all identical) STT_FILE entries in the symbol table. We also
> can't use the supposedly assembler-internal (and hence undocumented)
> .appfile anymore, as it was removed [4]. Note that .linefile (also
> internal/undocumented) as well as the "# <line> <file>" constructs the
> compiler emits, leading to .linefile insertion by the assembler, aren't
> of use anyway as these are processed and purged when processing .macro
> [3].
> 
> [4] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=c39e89c3aaa3a6790f85e80f2da5022bc4bce38b
> 
> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> @@ -24,6 +24,8 @@
>  #include <asm/msr-index.h>
>  #include <asm/spec_ctrl.h>
>  
> +#define FILE_AND_LINE .file __FILE__; .line __LINE__

Seeing as this seems to get added to all macros below, I guess you did
consider (and discarded) introducing a preprocessor macro do to the
asm macro definitons:

#define DECLARE_MACRO(n, ...) \
.macro n __VA_ARGS__ \
    .file __FILE__; .line __LINE__

Thanks, Roger.

