Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8446A6D6910
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518078.804243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjgj-00059r-7c; Tue, 04 Apr 2023 16:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518078.804243; Tue, 04 Apr 2023 16:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjgj-00057R-4X; Tue, 04 Apr 2023 16:39:17 +0000
Received: by outflank-mailman (input) for mailman id 518078;
 Tue, 04 Apr 2023 16:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6be=73=citrix.com=prvs=4510202f8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjjgh-00057L-Tn
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:39:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39fe83bc-d307-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 18:39:13 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 12:39:08 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5575.namprd03.prod.outlook.com (2603:10b6:5:2cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Tue, 4 Apr
 2023 16:39:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Tue, 4 Apr 2023
 16:39:05 +0000
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
X-Inumbo-ID: 39fe83bc-d307-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680626353;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2VwF/6oP5Vnmo3WD3Q2qsw9zTr5lv4aZJIMcQTK7mI4=;
  b=B0J8c8OGyqgbNN2QaFK9dphCrDwk7IcEPvZ0wJThj8n4pCTipvLKyQ4g
   gad72IxUZzNpKWd64xfPfIb1vODqkShLJ4im3qF+z2X/JGKfrN9EsfTqQ
   QxyG3r0m+qaFBU90zSVasEecPURDbvo7oPcqFlP/Werzx69wezF/NFEKj
   Q=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 103095625
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MfBVxquAUHPrImC4G4Oovuo0dOfnVHBfMUV32f8akzHdYApBsoF/q
 tZmKW+GOfuCNGD3eYt+YY6z/EkBvMPXm99lQVQ+rilgHigR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGyyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOm00MTGMueKK45GYZ/Buo/wHNtb3FdZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANlKReDmrKMCbFu7wzc1FDI9TUCBn8Kp1FWnR9lTM
 HwF9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptPl8Ic6i0uWSs45SfDlyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:F5uwxa4OYAhfktoyKwPXwPrXdLJyesId70hD6qkRc202TiX8ra
 uTdZsguCMc9wxhIE3I9ertBED4ewK6yXct2/h2AV7AZniEhILLFuBfBOLZqlWLJ8SZzIFgPM
 xbE5SWZuefMbAP5vyKhDVRYb0bsby6GDbCv5am80tQ
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="103095625"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1xyXshKzn3AsI5nin9LNHyjXA0cPNdeavPitItCBWSomeaH3/DoDbCTWHYsoo9mm2Yg2T0gIFNA4E3ph5E8tU1wBQm1+IS64spzlRulJKJ9SKAc3MNH69qO9KyKnakN+Wajs/hfxHG6UNvGgcnJurSETJnqOoVVVqt6tN4ED9SgdaO1lXJ8dAem/cfrXsQTB9Rfo6tbDRzh3nlxjiEiXXmw8RmqEHYedjwT65Tk0EeQp4BlWKvc0C7m12BdbXNIpT3WUXKfDJw6Ef0eS/rDCpCNMTgy4Fn1DLCfw190m4ixxUKB0JLUsVwEfopfZ2axb7y4/sVQpuaNoa/EnXW0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvcsTwnXdBTocmvXSNfMLcZeG+qa8zME+K8EMsoSI54=;
 b=l7e9HwHQX4As9Vs/3989o2ktcL19LTV1yaXyy77VxtE4ZybBLhY1Un1eAQb8qDrnglkWqjYZbOAvSXrTrB4fKMkib4tfX8FSVzeYExAKHCMdLJVCkGpce463nEpLtfpH81vXjbFXa22z8JNpjbLE2UAEbvG93QvKqKkdEIdvALBu0yEGva+UincS6K31jG0qzrhUrcBDqbElbNo8Ku0yDxLLwV7jdT2t+cx5tNtZnT6beR50uWWvWyAZGdv9UlN2HvoLluIiNLQkra37SFKLXOvZzG6nJgnvrTlvxzO7aJMuGP3lEQ70kEAF67Cz+3loVOrylXf90hYfVo/DMwamOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvcsTwnXdBTocmvXSNfMLcZeG+qa8zME+K8EMsoSI54=;
 b=CsKf6VHnyg4m3lMY1SpsdQhXEcgeYfnWrzl9f9jzAFx1hQ6v+4qnZDPvZASCgc2aTwPE+ruaFkbjB6I7yI+Z+vr3DlJI2hdbw3Rr7lvblQ3HxLuqmpAs8K6I13mbnovs28FpOk+xX6jLuW2YNf4B0ujWt8iqDwrvkFVFeNc7zio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Apr 2023 18:38:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Message-ID: <ZCxSooPqPwpGW6yv@Air-de-Roger>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
 <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
 <ZCwM1SfCAfh2koBD@Air-de-Roger>
 <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
 <ZCxI18gb8zK5X+nR@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCxI18gb8zK5X+nR@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5575:EE_
X-MS-Office365-Filtering-Correlation-Id: 0675f27c-2a71-4a0c-b622-08db352b1adc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZDSkCjgLsp6KxiXQAwTEj08tBX4RF0YyhYbw/9cBAac5ZUzeOuqDuPdrUx2i3kPHU5Rizfrw/lOpXBsHylrYYsxL4xoEsfwc686EBT1Vw9oXIkFI9WYqZrp8mK3OugkoO748INZSZ+AifJsoQNEF9nWKbBYfPOeDgPwOy8LSROBMxaVCgidQZVNV7eSlQJ8AzAX4so/stoc8l0rn+9rz4qoUnYWx/qozs9AE2zG+sYJE16Pla/qPH8VK9b4XRLSuPmOBraC5504ywJK/R1HdAh5Y8sfRWLrqeZz4e6YRpJ5Ry4Cugjt3E1R5FFSDYnpJ5f3UxA3WOStBHpeK1QwQHH+xb8weSqGz2twxgjwbLq4lWGpgusEIU0n/givyzcVoEjjvfmV2mk1wP4jqZyBVF4P4FcAlqNjcEt6edKgeQPauq9/tQ7fBaud03gSPNJjN8rwRecvw0W0QXIiql+AA5wCwXalcmxXA7BMttzsYLtXrjDj8zg346dg0bzSOyK9p5xBa6W9gS5N7z+niUerFR/FoIopcnaKKR/UeElA2vaC80RDzcW8L3KjE10a+3g2hHVSD+QlqEV8QM5HSwCwf0vHx0CqRz5PydZZxLrZvOrc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(86362001)(41300700001)(5660300002)(9686003)(186003)(6666004)(53546011)(26005)(6506007)(38100700002)(6512007)(6486002)(82960400001)(33716001)(66946007)(8936002)(4326008)(478600001)(54906003)(8676002)(66476007)(83380400001)(316002)(66556008)(6916009)(85182001)(66899021)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHFRdHBwUmdlbWFtWTlqenZHM0czNzJaZUd0Q1hkNWFhQlpuZzZ3WmVyV0tN?=
 =?utf-8?B?RW1YQ204TVF6MjNhMnQxdVRqYm04d3czTjBTb1o5NCtITG9QUVFkUWtqcUJa?=
 =?utf-8?B?ZVFWRmtvQ3ArcC9qalRUQWtsKzBSMnhrU3ZOVUp0cUMvcnA0R3I3TEJ1dEt5?=
 =?utf-8?B?VWZyKy9VeUcyUkNGYkZHUXU4OFVjaGZ3S3V4V05OYnA3OG5mWEVXMnMza0oy?=
 =?utf-8?B?Y3pJQlQrMDg0VFlxTWtEYVYxZzUzdEYzZXBtSFQvUmhzN3I0OEphUVFVSzNW?=
 =?utf-8?B?d0VGbllpRFBMN0xQRjRhbjdRclU4MGxMWVFiUzVyYUY0alZ2MEFWQ2lLRDVo?=
 =?utf-8?B?b0ZmRjV5ejZXK05QT1IvR0FWdjN2b1R4bVQzVG14ZlgzOG1GaXpZMUxYZ0ZX?=
 =?utf-8?B?Vkx3TG41NWFRVkVEWGtxMHNuUWF4ZDE5U1Z4OHl1VXFtbXcrSkUwQ0ZsK1Vj?=
 =?utf-8?B?Vm03VmNuV0ZPV3llOFJEOVN4RHhUTWpRZGgyT2xnbUsvcllXaVNLQWJxWVdU?=
 =?utf-8?B?RS9ZdklRdmpoYmpjR1VnNnVOR0NlMmh3MmtIV3R3czJKQzB2Y1pidmdYSUlG?=
 =?utf-8?B?eFFZa3FlVWNhcEgwYUV3RnNIZlFQMUFjajc3SzlIM1lDZ3BZU2xyaUwzS0Fl?=
 =?utf-8?B?WXlMS3NlQzRDM0lMRTZUNGhXSmc5dmp3Q0NoY2tzYjNRN1B4aFBPS3hxQWFZ?=
 =?utf-8?B?TWtUa1BsNUVwWFNrbkQ4bDZ0eGd3NE11SlhkNXk4Mnl0eG9TTFcxNldvcndN?=
 =?utf-8?B?YmJtbUg4blAyRm9ndTJvdWEzay9KTE92Qk9qZnhrVVo0NVJ1MUVIL0RTZ1E0?=
 =?utf-8?B?TlY3K002RGNuQkVJdTc5ay9vaVJacWRnMVJ0NDVVemJqRHdQNlRtRktyOFc1?=
 =?utf-8?B?Z04xeEN1TXA3cGkvWlg4Q2Vndkxwc0c2ODRaaVFZWVlvdUZEdVdzVlE4bXFw?=
 =?utf-8?B?QmEwQ3BNYnFDUkRsRDJtOHAwdWlVZ1QyOUFyeDZWbVlBc1BVT1Zaa2ZubjRj?=
 =?utf-8?B?RXpWSDZGSzRBQjZGNDM2SGVNOWdXazhhRXVZS24zWHQrbHZGVzNUK3E1dm5i?=
 =?utf-8?B?dUwzOUp3WUFLZmhjdXJGVytmZEJBZXZ0VC8rVnRPWDhvTDdoaTcwY3JBUGUz?=
 =?utf-8?B?dGJBZlcrcnpBMytUemNQb0EwU1RjcHdpWHNlRmkxTXhRNTFUaW9UWFdwYTZV?=
 =?utf-8?B?eFJwZVZabTdwWWlFN1IySVRNaVhabmpJejQ5SmduKzVJVi9Yd00wR2ZFMlNz?=
 =?utf-8?B?VjlYK25lNkcwZnUyWTluY3pCVkY3NGdkU01GVXRXYmkzT0ZPQldDV2pnZzVM?=
 =?utf-8?B?TTM2T29HMHZ3T240U3QwZHN0d1h0UUNKN1dmeE1nVlZTa1BDTXRTeFpaRHdC?=
 =?utf-8?B?c1dJNkpxbk1qamNwbkJ6QkxtMVlTK0QzeVhROWpaMy9TT1BTbi9NTHh1Rmxk?=
 =?utf-8?B?YXd6azhmZ3V5RElMY0JqK21VNm1PYUtKWlIrbTFkU1ozR1pHaU9oNVR1em1z?=
 =?utf-8?B?RG5IYjJXcUkzVVYxNjBic0orcnd3dCtpazM1dGlrSW9haDMzRXU5MzJGdWZy?=
 =?utf-8?B?ajJ6c3cyaW1vU1dmT2toR094K2xzaU1WTEwyU1hXYTlpMUQ5Mjc4T0tlQito?=
 =?utf-8?B?UU0xYmZsNHFFRzVDU0RUVUYwRmhGQy9KbGl0NFUzUWhEM2dDbk1lbVZvYVAw?=
 =?utf-8?B?anNtQnVsSXV0NHhpRk1kbHdESHEvN0R4bG1RTzAzYkUrTGs4YnE3WHZOMEJr?=
 =?utf-8?B?dTlDbXEyZ3ZubUhuQ1hqaEZndFZpNzBNaVFDZnZiYWZJckdPaDlZZTFUeHVF?=
 =?utf-8?B?MER6aUFhTyszejJ5SllUSVpTWlhUYjlMUCtkVzNMSDhEZnBjVnNEczV0UHdo?=
 =?utf-8?B?Zk9GOUE1UlVrVlNXVVgyZTdnNm5WZTZsbURLR28zcTNxTkc0Nm4ySkc4b3Bk?=
 =?utf-8?B?QStVOUJMa29kVlEyb3FuenhHclJ0bjBQa3dDQXZrV1dNNEgrbThkSHZURllt?=
 =?utf-8?B?WkxqMzBHaTVTNHUxY0d2RXEzSmVuNlZybG9NT2R6blVSZjczZmZaNVJ0L2hX?=
 =?utf-8?B?S3VnZFczejNCQUYvbGpSR2d6RnhkQVhQdkgwbVVKUnU3dE9rTUNOSitxVXJU?=
 =?utf-8?B?R1B1eXBXY0NKRHU1VmJ5VE5SdGxxMDRNMUNvK1czQjBpYVBrQ0hJK2t5SXFD?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AAG3/3lI25PQSsvGZf/rleKCs2H+ojUcmHJ5gWMItwZIOV9LYoqMPXEHeOdsT2386g+7eNbe7fY37fywrzltsQYzAdEq2nXLULaykcuRXxZelPeGAFMTzGpRvcE/XVh+TXd33MvPfq/Em40TQDzr2pt5HkCDARrQtLTzAGv3GjDZJ+l693U1SOHofc0KOF6bQkDpLOOHIo+FbT0E13AikpcQl34KirRKPJ3tgqImdU4jnwd1bxTqP0j9vdkobiP2NNqkGLCz47UTGHwW6XbnseO6FSyoe4XEYmxVzCArlssoJ13FKNWmV4MBR+fFe3z/M2dqTSb/im+sIh0eM9Bh3wHGv4fUIBGhtFvVWICaCcOYDwRviW3opENkE3MURfNZoyeX4rmYipIo/G+Gww+A/HGUJrEv4fQJzKTHFnvbs69t4MW/7sbarWXaBETdeiFfdbQghp6DhUWt53kwY4uFbt8gf+7FvzNGT0G00yOExQaon/+NWvZ372DcPto5ymYv5YEC82pujjWmbBDQrHNGgf+EdF3NuE7kbUZ7aobx4P5P0rqw8OyneLqKIhSnvJV8AMHhrzW7LADpL7l+drWAs5Wbxxtk4TCEPw3XXWmjUhvX6icLnbbUBankeHv4ZTBZJrNgFxVIi5aDsMvOsHbwpTS1iqxFbIJ4F7SXuO6rMlwlNsCgxV0Jwf6/VyWDNChM6OVgkbFuDx58SHGexwnSnpPYnG42B8MJvdPgwQuDG4zWekJ6S6jCiepl0E2J3+u45ci2q326d5iCApeOMqHy/LItbXb1zdqbls12BSwsaFswqGOCKbaSLizDktbNUdwP
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0675f27c-2a71-4a0c-b622-08db352b1adc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 16:39:05.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GaC8WohKXghUOV/L+fW+g86GpluO/f+jHS26OpCPYDrZYdb9HdzBOIN73SneRZSeKmAlmYaBE2CbAU7mOZOxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5575

On Tue, Apr 04, 2023 at 05:57:11PM +0200, Roger Pau Monné wrote:
> On Tue, Apr 04, 2023 at 04:24:16PM +0200, Jan Beulich wrote:
> > On 04.04.2023 13:41, Roger Pau Monné wrote:
> > > On Tue, Apr 04, 2023 at 12:31:31PM +0200, Jan Beulich wrote:
> > >> On 04.04.2023 12:12, Roger Pau Monné wrote:
> > >>> On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
> > >>>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
> > >>>> applies to guests also when run on a 64-bit hypervisor: The "extended
> > >>>> CR3" format has to be used there as well, to fit the address in the only
> > >>>> 32-bit wide register there. As a result it was a mistake that the check
> > >>>> was never enabled for that case, and was then mistakenly deleted in the
> > >>>> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
> > >>>> CONFIG_PAGING_LEVELS==4"]).
> > >>>>
> > >>>> Similarly during Dom0 construction kernel awareness needs to be taken
> > >>>> into account, and respective code was again mistakenly never enabled for
> > >>>> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
> > >>>> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
> > >>>>
> > >>>> At the same time restrict enabling of the assist for Dom0 to just the
> > >>>> 32-bit case. Furthermore there's no need for an atomic update there.
> > >>>>
> > >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >>>> ---
> > >>>> I was uncertain whether to add a check to the CR3 guest read path,
> > >>>> raising e.g. #GP(0) when the value read wouldn't fit but also may not
> > >>>> be converted to "extended" format (overflow is possible there in
> > >>>> principle because of the control tools "slack" in promote_l3_table()).
> > >>>>
> > >>>> In that context I was puzzled to find no check on the CR3 guest write
> > >>>> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
> > >>>> of the low reserved ones) could observe anomalous behavior rather than
> > >>>> plain failure.
> > >>>>
> > >>>> As to a Fixes: tag - it's pretty unclear which of the many original
> > >>>> 32-on-64 changes to blame. I don't think the two cited commits should
> > >>>> be referenced there, as they didn't break anything that wasn't already
> > >>>> broken.
> > >>>>
> > >>>> --- a/xen/arch/x86/mm.c
> > >>>> +++ b/xen/arch/x86/mm.c
> > >>>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
> > >>>>      unsigned int   partial_flags = page->partial_flags;
> > >>>>      l3_pgentry_t   l3e = l3e_empty();
> > >>>>  
> > >>>> +    /*
> > >>>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
> > >>>> +     * understand the weird 'extended cr3' format for dealing with high-order
> > >>>> +     * address bits. We cut some slack for control tools (before vcpu0 is
> > >>>> +     * initialised).
> > >>>
> > >>> Don't we then need some check in the vCPU init path to assure that the
> > >>> cr3 is < 32bits if we allow those to initially be set?
> > >>>
> > >>> Or will the initialization unconditionally overwrite any previous cr3
> > >>> value?
> > >>
> > >> That's not the way I understand this "cut some slack". Instead I read it
> > >> to be meant to cover for the VM-assist bit not being set, yet. Beyond
> > >> that it is assumed to be tool stack's responsibility to constrain
> > >> addresses suitably. If it doesn't, it'll simply break the guest. (There
> > >> is some guessing on my part involved here, as the original introduction
> > >> of that code didn't further explain things.)
> > > 
> > > If it's just the guest that's broken I would think it's fine.  As long
> > > as such mismatch doesn't cause issues in the hypervisor internal state.
> > > 
> > > Did you see a toolstack setting such entries before pae_extended_cr3
> > > is set?
> > 
> > To be honest - I didn't look. As said in the longer reply to Andrew, I
> > think it is more logical this way (the page table root already being
> > validated as an L3 table when vCPU 0 is inititalized, which includes
> > setting its CR3). Hence even if right now the order was the other way
> > around (which I doubt it is), I wouldn't want to make impossible to
> > restore the original ordering again.
> 
> IMO I think it would be better if we could already report error at
> domain creation time if the toolstack is attempting to create a domain
> that the hypervisor knows is not going to work properly, rather than
> allowing it and the guest failing in maybe non obvious ways.
> 
> It seems to me however that we would need to fix xc_dom_boot_image()
> in order to setup the vCPU before creating the initial page-tables.
> (->setup_pgtables() hook being called before ->vcpu() hook)
> 
> So I don't think this is strictly worse than what we have, but it
> would also be nice to get things sorted out so the ability of the
> toolstack to shot its own foot is limited.

Maybe I'm confused after all day, but isn't the hypercall used by the
toolstack to set CR3 the same one used to set the vm_assist bits?
(XEN_DOMCTL_setvcpucontext)

At which point we just need to make sure d->vm_assist gets set before
attempting to load the new CR3 (seems that way from the quick look
I've given at arch_set_info_guest()).

And so there should be no need to give extra slack to toolstack
operations.

Thanks, Roger.

